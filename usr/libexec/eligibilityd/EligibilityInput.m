@interface EligibilityInput
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (EligibilityInput)initWithCoder:(id)a3;
- (EligibilityInput)initWithInputType:(unint64_t)a3 status:(unint64_t)a4 process:(id)a5;
- (NSDate)setTime;
- (NSString)settingProccessName;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (unint64_t)hash;
- (unint64_t)status;
- (unint64_t)type;
- (void)encodeWithCoder:(id)a3;
- (void)setSetTime:(id)a3;
- (void)setSettingProccessName:(id)a3;
- (void)setStatus:(unint64_t)a3;
- (void)setType:(unint64_t)a3;
@end

@implementation EligibilityInput

- (EligibilityInput)initWithInputType:(unint64_t)a3 status:(unint64_t)a4 process:(id)a5
{
  id v9 = a5;
  v15.receiver = self;
  v15.super_class = (Class)&OBJC_CLASS___EligibilityInput;
  v10 = -[EligibilityInput init](&v15, "init");
  v11 = v10;
  if (v10)
  {
    v10->_type = a3;
    v10->_status = a4;
    uint64_t v12 = objc_claimAutoreleasedReturnValue(+[NSDate now](&OBJC_CLASS___NSDate, "now"));
    setTime = v11->_setTime;
    v11->_setTime = (NSDate *)v12;

    objc_storeStrong((id *)&v11->_settingProccessName, a5);
  }

  return v11;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedLongLong:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedLongLong:",  -[EligibilityInput type](self, "type")));
  [v4 encodeObject:v5 forKey:@"type"];

  v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedLongLong:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedLongLong:",  -[EligibilityInput status](self, "status")));
  [v4 encodeObject:v6 forKey:@"status"];

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[EligibilityInput setTime](self, "setTime"));
  [v4 encodeObject:v7 forKey:@"setTime"];

  id v8 = (id)objc_claimAutoreleasedReturnValue(-[EligibilityInput settingProccessName](self, "settingProccessName"));
  [v4 encodeObject:v8 forKey:@"settingProccessName"];
}

- (EligibilityInput)initWithCoder:(id)a3
{
  id v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)&OBJC_CLASS___EligibilityInput;
  v5 = -[EligibilityInput init](&v19, "init");
  if (v5)
  {
    id v6 = [v4 decodeObjectOfClass:objc_opt_class(NSNumber) forKey:@"type"];
    v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
    v5->_type = (unint64_t)[v7 unsignedIntegerValue];

    id v8 = [v4 decodeObjectOfClass:objc_opt_class(NSNumber) forKey:@"status"];
    id v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
    v5->_status = (unint64_t)[v9 unsignedIntegerValue];

    id v10 = [v4 decodeObjectOfClass:objc_opt_class(NSDate) forKey:@"setTime"];
    uint64_t v11 = objc_claimAutoreleasedReturnValue(v10);
    if (!v11)
    {
      id v12 = sub_10000C968();
      v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315138;
        v21 = "-[EligibilityInput initWithCoder:]";
        _os_log_error_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_ERROR,  "%s: Failed to deserialize setTime, setting to default value",  buf,  0xCu);
      }

      uint64_t v11 = objc_claimAutoreleasedReturnValue(+[NSDate now](&OBJC_CLASS___NSDate, "now"));
    }

    setTime = v5->_setTime;
    v5->_setTime = (NSDate *)v11;

    id v15 = [v4 decodeObjectOfClass:objc_opt_class(NSString) forKey:@"settingProccessName"];
    uint64_t v16 = objc_claimAutoreleasedReturnValue(v15);
    settingProccessName = v5->_settingProccessName;
    v5->_settingProccessName = (NSString *)v16;
  }

  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = [(id)objc_opt_class(self) allocWithZone:a3];
  unint64_t v5 = -[EligibilityInput type](self, "type");
  unint64_t v6 = -[EligibilityInput status](self, "status");
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[EligibilityInput settingProccessName](self, "settingProccessName"));
  id v8 = [v4 initWithInputType:v5 status:v6 process:v7];

  id v9 = (void *)objc_claimAutoreleasedReturnValue(-[EligibilityInput setTime](self, "setTime"));
  [v8 setSetTime:v9];

  return v8;
}

- (unint64_t)hash
{
  unint64_t v3 = -[EligibilityInput type](self, "type");
  unint64_t v4 = -[EligibilityInput status](self, "status") ^ v3;
  unint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[EligibilityInput setTime](self, "setTime"));
  unint64_t v6 = v4 ^ (unint64_t)[v5 hash];
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[EligibilityInput settingProccessName](self, "settingProccessName"));
  unint64_t v8 = v6 ^ (unint64_t)[v7 hash];

  return v8;
}

- (BOOL)isEqual:(id)a3
{
  unint64_t v4 = (EligibilityInput *)a3;
  v22.receiver = self;
  v22.super_class = (Class)&OBJC_CLASS___EligibilityInput;
  if (-[EligibilityInput isEqual:](&v22, "isEqual:", v4))
  {
    if (v4 == self)
    {
      BOOL v15 = 1;
      goto LABEL_22;
    }

    uint64_t v5 = objc_opt_class(self);
    if ((objc_opt_isKindOfClass(v4, v5) & 1) != 0)
    {
      unint64_t v6 = v4;
      id v7 = -[EligibilityInput type](self, "type");
      if (v7 == (id)-[EligibilityInput type](v6, "type"))
      {
        id v8 = -[EligibilityInput status](self, "status");
        if (v8 == (id)-[EligibilityInput status](v6, "status"))
        {
          id v9 = (void *)objc_claimAutoreleasedReturnValue(-[EligibilityInput setTime](self, "setTime"));
          id v10 = (void *)objc_claimAutoreleasedReturnValue(-[EligibilityInput setTime](v6, "setTime"));
          char v11 = sub_1000179E0(v9, v10);

          if ((v11 & 1) != 0)
          {
            id v12 = (void *)objc_claimAutoreleasedReturnValue(-[EligibilityInput settingProccessName](self, "settingProccessName"));
            v13 = (void *)objc_claimAutoreleasedReturnValue(-[EligibilityInput settingProccessName](v6, "settingProccessName"));
            char v14 = sub_1000179E0(v12, v13);

            if ((v14 & 1) != 0)
            {
              BOOL v15 = 1;
LABEL_21:

              goto LABEL_22;
            }

            id v20 = sub_10000C968();
            v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v20);
            if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 136315394;
              v24 = "-[EligibilityInput isEqual:]";
              __int16 v25 = 2080;
              v26 = "settingProccessName";
              goto LABEL_19;
            }

- (id)description
{
  id v3 = sub_10000C910(-[EligibilityInput type](self, "type"));
  unint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  unint64_t v5 = -[EligibilityInput status](self, "status");
  if (v5 >= 8)
  {
    id v7 = sub_10000C968();
    id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      id v16 = "eligibility_input_status_to_str";
      __int16 v17 = 2048;
      unint64_t v18 = v5;
      _os_log_error_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_ERROR,  "%s: Unsupported input status: %llu",  buf,  0x16u);
    }

    uint64_t v6 = objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"<Unknown: %llu>", v5));
  }

  else
  {
    uint64_t v6 = objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", (&off_100034AB8)[v5]));
  }

  id v9 = (void *)v6;
  uint64_t v10 = objc_claimAutoreleasedReturnValue(-[EligibilityInput settingProccessName](self, "settingProccessName"));
  if (v10) {
    char v11 = (__CFString *)v10;
  }
  else {
    char v11 = @"<NULL>";
  }
  id v12 = (void *)objc_claimAutoreleasedReturnValue(-[EligibilityInput setTime](self, "setTime"));
  v13 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"[EligibilityInput type:%@ status:%@ setTime:%@ settingProcess:%@]",  v4,  v9,  v12,  v11));

  return v13;
}

- (unint64_t)type
{
  return self->_type;
}

- (void)setType:(unint64_t)a3
{
  self->_type = a3;
}

- (unint64_t)status
{
  return self->_status;
}

- (void)setStatus:(unint64_t)a3
{
  self->_status = a3;
}

- (NSDate)setTime
{
  return self->_setTime;
}

- (void)setSetTime:(id)a3
{
}

- (NSString)settingProccessName
{
  return self->_settingProccessName;
}

- (void)setSettingProccessName:(id)a3
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