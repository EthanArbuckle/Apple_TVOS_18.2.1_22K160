@interface PushMessage
- (BOOL)isEqual:(id)a3;
- (id)description;
- (unint64_t)hash;
@end

@implementation PushMessage

- (BOOL)isEqual:(id)a3
{
  v5 = (PushMessage *)a3;
  if (self == v5)
  {
    BOOL v8 = 1;
  }

  else
  {
    uint64_t v6 = objc_opt_class(&OBJC_CLASS___PushMessage, v4);
    char isKindOfClass = objc_opt_isKindOfClass(v5, v6);
    BOOL v8 = 0;
    if (self && (isKindOfClass & 1) != 0) {
      BOOL v8 = -[NSDictionary isEqualToDictionary:](self->_userInfo, "isEqualToDictionary:", v5->_userInfo);
    }
  }

  return v8;
}

- (unint64_t)hash
{
  return (unint64_t)-[NSDictionary hash](self->_userInfo, "hash");
}

- (id)description
{
  id v3 = -[NSDictionary mutableCopy](self->_userInfo, "mutableCopy");
  uint64_t v4 = objc_claimAutoreleasedReturnValue([v3 objectForKeyedSubscript:@"0"]);
  v5 = (void *)v4;
  if (v4)
  {
    uint64_t v6 = AMSHashIfNeeded(v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
    [v3 setObject:v7 forKeyedSubscript:@"0"];
  }

  if (!+[NSJSONSerialization isValidJSONObject:](&OBJC_CLASS___NSJSONSerialization, "isValidJSONObject:", v3)
    || (uint64_t v8 = objc_claimAutoreleasedReturnValue( +[NSJSONSerialization dataWithJSONObject:options:error:]( &OBJC_CLASS___NSJSONSerialization,  "dataWithJSONObject:options:error:",  v3,  0LL,  0LL))) == 0 || (v9 = (void *)v8,  v10 = -[NSString initWithData:encoding:](objc_alloc(&OBJC_CLASS___NSString), "initWithData:encoding:", v8, 4LL),  v9,  !v10))
  {
    v10 = (NSString *)objc_claimAutoreleasedReturnValue([v3 description]);
  }

  v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@: %@",  self->_timestamp,  v10));

  return v11;
}

- (void).cxx_destruct
{
}

@end