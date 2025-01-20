@interface EligibilityOverrideData
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (EligibilityOverrideData)initWithAnswer:(unint64_t)a3 context:(id)a4;
- (EligibilityOverrideData)initWithCoder:(id)a3;
- (NSDictionary)context;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (unint64_t)answer;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setAnswer:(unint64_t)a3;
- (void)setContext:(id)a3;
@end

@implementation EligibilityOverrideData

- (EligibilityOverrideData)initWithAnswer:(unint64_t)a3 context:(id)a4
{
  id v6 = a4;
  v10.receiver = self;
  v10.super_class = (Class)&OBJC_CLASS___EligibilityOverrideData;
  v7 = -[EligibilityOverrideData init](&v10, "init");
  v8 = v7;
  if (v7)
  {
    -[EligibilityOverrideData setAnswer:](v7, "setAnswer:", a3);
    -[EligibilityOverrideData setContext:](v8, "setContext:", v6);
  }

  return v8;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedLongLong:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedLongLong:",  -[EligibilityOverrideData answer](self, "answer")));
  [v4 encodeObject:v5 forKey:@"answer"];

  id v6 = (id)objc_claimAutoreleasedReturnValue(-[EligibilityOverrideData context](self, "context"));
  [v4 encodeObject:v6 forKey:@"context"];
}

- (EligibilityOverrideData)initWithCoder:(id)a3
{
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)&OBJC_CLASS___EligibilityOverrideData;
  v5 = -[EligibilityOverrideData init](&v15, "init");
  if (v5)
  {
    id v6 = [v4 decodeObjectOfClass:objc_opt_class(NSNumber) forKey:@"answer"];
    v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
    v5->_answer = (unint64_t)[v7 unsignedIntegerValue];

    uint64_t v8 = objc_opt_class(&OBJC_CLASS___NSDictionary);
    uint64_t v9 = objc_opt_class(&OBJC_CLASS___NSString);
    objc_super v10 = +[NSSet setWithObjects:]( &OBJC_CLASS___NSSet,  "setWithObjects:",  v8,  v9,  objc_opt_class(&OBJC_CLASS___NSNumber),  0LL);
    v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
    uint64_t v12 = objc_claimAutoreleasedReturnValue([v4 decodeObjectOfClasses:v11 forKey:@"context"]);
    context = v5->_context;
    v5->_context = (NSDictionary *)v12;
  }

  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = objc_msgSend(objc_msgSend((id)objc_opt_class(self), "allocWithZone:", a3), "init");
  objc_msgSend(v5, "setAnswer:", -[EligibilityOverrideData answer](self, "answer"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[EligibilityOverrideData context](self, "context"));
  id v7 = [v6 copyWithZone:a3];
  [v5 setContext:v7];

  return v5;
}

- (unint64_t)hash
{
  unint64_t v3 = -[EligibilityOverrideData answer](self, "answer");
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[EligibilityOverrideData context](self, "context"));
  unint64_t v5 = (unint64_t)[v4 hash] ^ v3;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (EligibilityOverrideData *)a3;
  v16.receiver = self;
  v16.super_class = (Class)&OBJC_CLASS___EligibilityOverrideData;
  if (-[EligibilityOverrideData isEqual:](&v16, "isEqual:", v4))
  {
    if (v4 == self)
    {
      BOOL v11 = 1;
      goto LABEL_16;
    }

    uint64_t v5 = objc_opt_class(self);
    if ((objc_opt_isKindOfClass(v4, v5) & 1) != 0)
    {
      id v6 = v4;
      id v7 = -[EligibilityOverrideData answer](self, "answer");
      if (v7 == (id)-[EligibilityOverrideData answer](v6, "answer"))
      {
        uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(-[EligibilityOverrideData context](self, "context"));
        uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(-[EligibilityOverrideData context](v6, "context"));
        char v10 = sub_1000179E0(v8, v9);

        if ((v10 & 1) != 0)
        {
          BOOL v11 = 1;
LABEL_15:

          goto LABEL_16;
        }

        id v14 = sub_10000C968();
        v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
        if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136315394;
          v18 = "-[EligibilityOverrideData isEqual:]";
          __int16 v19 = 2080;
          v20 = "context";
          goto LABEL_13;
        }
      }

      else
      {
        id v12 = sub_10000C968();
        v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
        if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136315394;
          v18 = "-[EligibilityOverrideData isEqual:]";
          __int16 v19 = 2080;
          v20 = "answer";
LABEL_13:
          _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_DEFAULT,  "%s: Property %s did not match",  buf,  0x16u);
        }
      }

      BOOL v11 = 0;
      goto LABEL_15;
    }
  }

  BOOL v11 = 0;
LABEL_16:

  return v11;
}

- (id)description
{
  unint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(-[EligibilityOverrideData context](self, "context"));
  id v4 = v3;
  if (v3) {
    uint64_t v5 = (__CFString *)objc_claimAutoreleasedReturnValue([v3 description]);
  }
  else {
    uint64_t v5 = @"<NULL>";
  }
  uint64_t v6 = objc_opt_class(self);
  id v7 = sub_10000C814(-[EligibilityOverrideData answer](self, "answer"));
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"<%@: answer: %@; context: %@>",
                   v6,
                   v8,
                   v5));

  return v9;
}

- (unint64_t)answer
{
  return self->_answer;
}

- (void)setAnswer:(unint64_t)a3
{
  self->_answer = a3;
}

- (NSDictionary)context
{
  return self->_context;
}

- (void)setContext:(id)a3
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