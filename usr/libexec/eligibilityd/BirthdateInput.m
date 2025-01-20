@interface BirthdateInput
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (BirthdateInput)initWithCoder:(id)a3;
- (BirthdateInput)initWithDate:(id)a3 status:(unint64_t)a4 process:(id)a5;
- (NSDate)birthdate;
- (NSNumber)age;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setBirthdate:(id)a3;
@end

@implementation BirthdateInput

- (BirthdateInput)initWithDate:(id)a3 status:(unint64_t)a4 process:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  if (v8)
  {
    xpc_type_t type = xpc_get_type(v8);
    if (type != (xpc_type_t)&_xpc_type_date)
    {
      v11 = type;
      id v12 = sub_10000C968();
      v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315394;
        v20 = "-[BirthdateInput initWithDate:status:process:]";
        __int16 v21 = 2080;
        name = xpc_type_get_name(v11);
        _os_log_error_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_ERROR,  "%s: Birthdate input is wrong data type: %s",  buf,  0x16u);
      }

      v14 = 0LL;
      goto LABEL_11;
    }

    v13 = (os_log_s *)_CFXPCCreateCFObjectFromXPCObject(v8);
  }

  else
  {
    v13 = 0LL;
  }

  v18.receiver = self;
  v18.super_class = (Class)&OBJC_CLASS___BirthdateInput;
  v15 = -[EligibilityInput initWithInputType:status:process:](&v18, "initWithInputType:status:process:", 15LL, a4, v9);
  v16 = v15;
  if (v15) {
    objc_storeStrong((id *)&v15->_birthdate, v13);
  }
  self = v16;
  v14 = self;
LABEL_11:

  return v14;
}

- (NSNumber)age
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[BirthdateInput birthdate](self, "birthdate"));
  if (v2)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSCalendar currentCalendar](&OBJC_CLASS___NSCalendar, "currentCalendar"));
    v5 = (void *)objc_claimAutoreleasedReturnValue([v4 components:4 fromDate:v2 toDate:v3 options:0]);

    v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithInteger:]( NSNumber,  "numberWithInteger:",  [v5 year]));
  }

  else
  {
    v6 = 0LL;
  }

  return (NSNumber *)v6;
}

- (void)encodeWithCoder:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___BirthdateInput;
  id v4 = a3;
  -[EligibilityInput encodeWithCoder:](&v6, "encodeWithCoder:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[BirthdateInput birthdate](self, "birthdate", v6.receiver, v6.super_class));
  [v4 encodeObject:v5 forKey:@"birthdate"];
}

- (BirthdateInput)initWithCoder:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)&OBJC_CLASS___BirthdateInput;
  v5 = -[EligibilityInput initWithCoder:](&v10, "initWithCoder:", v4);
  if (v5)
  {
    id v6 = [v4 decodeObjectOfClass:objc_opt_class(NSDate) forKey:@"birthdate"];
    uint64_t v7 = objc_claimAutoreleasedReturnValue(v6);
    birthdate = v5->_birthdate;
    v5->_birthdate = (NSDate *)v7;
  }

  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___BirthdateInput;
  id v5 = -[EligibilityInput copyWithZone:](&v9, "copyWithZone:");
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[BirthdateInput birthdate](self, "birthdate"));
  id v7 = [v6 copyWithZone:a3];
  [v5 setBirthdate:v7];

  return v5;
}

- (unint64_t)hash
{
  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS___BirthdateInput;
  unint64_t v3 = -[EligibilityInput hash](&v7, "hash");
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[BirthdateInput birthdate](self, "birthdate"));
  unint64_t v5 = (unint64_t)[v4 hash] ^ v3;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (BirthdateInput *)a3;
  v13.receiver = self;
  v13.super_class = (Class)&OBJC_CLASS___BirthdateInput;
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
    id v6 = v4;
    objc_super v7 = (void *)objc_claimAutoreleasedReturnValue(-[BirthdateInput birthdate](self, "birthdate"));
    id v8 = (void *)objc_claimAutoreleasedReturnValue(-[BirthdateInput birthdate](v6, "birthdate"));
    char v9 = sub_1000179E0(v7, v8);

    if ((v9 & 1) == 0)
    {
      id v10 = sub_10000C968();
      v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315394;
        v15 = "-[BirthdateInput isEqual:]";
        __int16 v16 = 2080;
        v17 = "birthdate";
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
  unint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(-[BirthdateInput age](self, "age"));
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___BirthdateInput;
  id v4 = -[EligibilityInput description](&v8, "description");
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  id v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"[BirthdateInput age:%@ %@]",  v3,  v5));

  return v6;
}

- (NSDate)birthdate
{
  return self->_birthdate;
}

- (void)setBirthdate:(id)a3
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