@interface EligibilityOverride
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (EligibilityOverride)init;
- (EligibilityOverride)initWithCoder:(id)a3;
- (NSMutableDictionary)overrideMap;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)overrideResultDictionaryForDomain:(unint64_t)a3;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)forceDomain:(unint64_t)a3 answer:(unint64_t)a4 context:(id)a5;
- (void)resetAllAnswers;
- (void)resetAnswerForDomain:(unint64_t)a3;
- (void)setOverrideMap:(id)a3;
@end

@implementation EligibilityOverride

- (EligibilityOverride)init
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___EligibilityOverride;
  v2 = -[EligibilityOverride init](&v6, "init");
  if (v2)
  {
    v3 = objc_opt_new(&OBJC_CLASS___NSMutableDictionary);
    overrideMap = v2->_overrideMap;
    v2->_overrideMap = v3;
  }

  return v2;
}

- (void)forceDomain:(unint64_t)a3 answer:(unint64_t)a4 context:(id)a5
{
  id v8 = a5;
  if (a3 > 0x7D) {
    v9 = "<Unknown Domain>";
  }
  else {
    v9 = off_1000345B8[a3];
  }
  id v12 = (id)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", v9));
  v10 = -[EligibilityOverrideData initWithAnswer:context:]( objc_alloc(&OBJC_CLASS___EligibilityOverrideData),  "initWithAnswer:context:",  a4,  v8);

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[EligibilityOverride overrideMap](self, "overrideMap"));
  [v11 setObject:v10 forKeyedSubscript:v12];
}

- (void)resetAnswerForDomain:(unint64_t)a3
{
  if (a3 > 0x7D) {
    v4 = "<Unknown Domain>";
  }
  else {
    v4 = off_1000345B8[a3];
  }
  id v6 = (id)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", v4));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[EligibilityOverride overrideMap](self, "overrideMap"));
  [v5 removeObjectForKey:v6];
}

- (void)resetAllAnswers
{
  v3 = objc_opt_new(&OBJC_CLASS___NSMutableDictionary);
  overrideMap = self->_overrideMap;
  self->_overrideMap = v3;
}

- (id)overrideResultDictionaryForDomain:(unint64_t)a3
{
  if (a3 > 0x7D) {
    v4 = "<Unknown Domain>";
  }
  else {
    v4 = off_1000345B8[a3];
  }
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", v4));
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[EligibilityOverride overrideMap](self, "overrideMap"));
  v7 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKeyedSubscript:v5]);

  if (v7)
  {
    id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 context]);

    if (v8)
    {
      v15[0] = @"os_eligibility_answer_t";
      v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedLongLong:]( NSNumber,  "numberWithUnsignedLongLong:",  [v7 answer]));
      v16[0] = v9;
      v16[1] = &off_100038068;
      v15[1] = @"os_eligibility_answer_source_t";
      v15[2] = @"context";
      v10 = (void *)objc_claimAutoreleasedReturnValue([v7 context]);
      v16[2] = v10;
      v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v16,  v15,  3LL));
    }

    else
    {
      v13[0] = @"os_eligibility_answer_t";
      v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedLongLong:]( NSNumber,  "numberWithUnsignedLongLong:",  [v7 answer]));
      v13[1] = @"os_eligibility_answer_source_t";
      v14[0] = v9;
      v14[1] = &off_100038068;
      v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v14,  v13,  2LL));
    }
  }

  else
  {
    v11 = 0LL;
  }

  return v11;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = (id)objc_claimAutoreleasedReturnValue(-[EligibilityOverride overrideMap](self, "overrideMap"));
  [v4 encodeObject:v5 forKey:@"overrideMap"];
}

- (EligibilityOverride)initWithCoder:(id)a3
{
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)&OBJC_CLASS___EligibilityOverride;
  id v5 = -[EligibilityOverride init](&v15, "init");
  if (v5)
  {
    uint64_t v6 = objc_opt_class(&OBJC_CLASS___NSDictionary);
    uint64_t v7 = objc_opt_class(&OBJC_CLASS___NSString);
    id v8 = +[NSSet setWithObjects:]( &OBJC_CLASS___NSSet,  "setWithObjects:",  v6,  v7,  objc_opt_class(&OBJC_CLASS___EligibilityOverrideData),  0LL);
    v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
    v10 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue([v4 decodeObjectOfClasses:v9 forKey:@"overrideMap"]);

    if (!v10)
    {
      id v11 = sub_10000C968();
      id v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315138;
        v17 = "-[EligibilityOverride initWithCoder:]";
        _os_log_error_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_ERROR,  "%s: Failed to deserialize overrideMap, setting to default value",  buf,  0xCu);
      }

      v10 = objc_opt_new(&OBJC_CLASS___NSMutableDictionary);
    }

    overrideMap = v5->_overrideMap;
    v5->_overrideMap = v10;
  }

  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = objc_msgSend(objc_msgSend((id)objc_opt_class(self), "allocWithZone:", a3), "init");
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(-[EligibilityOverride overrideMap](self, "overrideMap"));
  id v7 = [v6 copyWithZone:a3];
  [v5 setOverrideMap:v7];

  return v5;
}

- (unint64_t)hash
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[EligibilityOverride overrideMap](self, "overrideMap"));
  id v3 = [v2 hash];

  return (unint64_t)v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (EligibilityOverride *)a3;
  v13.receiver = self;
  v13.super_class = (Class)&OBJC_CLASS___EligibilityOverride;
  if (!-[EligibilityOverride isEqual:](&v13, "isEqual:", v4)) {
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
    id v7 = (void *)objc_claimAutoreleasedReturnValue(-[EligibilityOverride overrideMap](self, "overrideMap"));
    id v8 = (void *)objc_claimAutoreleasedReturnValue(-[EligibilityOverride overrideMap](v6, "overrideMap"));
    char v9 = sub_1000179E0(v7, v8);

    if ((v9 & 1) == 0)
    {
      id v10 = sub_10000C968();
      id v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315394;
        objc_super v15 = "-[EligibilityOverride isEqual:]";
        __int16 v16 = 2080;
        v17 = "overrideMap";
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
  uint64_t v3 = objc_opt_class(self);
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[EligibilityOverride overrideMap](self, "overrideMap"));
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"<%@: overrides: %@>",  v3,  v4));

  return v5;
}

- (NSMutableDictionary)overrideMap
{
  return self->_overrideMap;
}

- (void)setOverrideMap:(id)a3
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