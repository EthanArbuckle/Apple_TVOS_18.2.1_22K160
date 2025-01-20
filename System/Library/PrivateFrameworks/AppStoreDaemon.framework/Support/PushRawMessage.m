@interface PushRawMessage
- (BOOL)isEqual:(id)a3;
- (id)description;
- (unint64_t)hash;
@end

@implementation PushRawMessage

- (BOOL)isEqual:(id)a3
{
  v5 = (PushRawMessage *)a3;
  if (self == v5)
  {
    LOBYTE(self) = 1;
  }

  else
  {
    uint64_t v6 = objc_opt_class(&OBJC_CLASS___PushRawMessage, v4);
    if ((objc_opt_isKindOfClass(v5, v6) & 1) != 0)
    {
      v7 = v5;
      v8 = v7;
      if (self)
      {
        if (self->_topic == v7->_topic
          && ((timestamp = self->_timestamp, timestamp == v8->_timestamp)
           || -[NSDate isEqual:](timestamp, "isEqual:")))
        {
          userInfo = self->_userInfo;
          if (userInfo == v8->_userInfo) {
            LOBYTE(self) = 1;
          }
          else {
            LOBYTE(self) = -[NSDictionary isEqual:](userInfo, "isEqual:");
          }
        }

        else
        {
          LOBYTE(self) = 0;
        }
      }
    }

    else
    {
      LOBYTE(self) = 0;
    }
  }

  return (char)self;
}

- (unint64_t)hash
{
  return (unint64_t)-[NSDictionary hash](self->_userInfo, "hash");
}

- (id)description
{
  id v3 = -[NSDictionary mutableCopy](self->_userInfo, "mutableCopy");
  if (!+[NSJSONSerialization isValidJSONObject:](&OBJC_CLASS___NSJSONSerialization, "isValidJSONObject:", v3)
    || (uint64_t v4 = objc_claimAutoreleasedReturnValue( +[NSJSONSerialization dataWithJSONObject:options:error:]( &OBJC_CLASS___NSJSONSerialization,  "dataWithJSONObject:options:error:",  v3,  0LL,  0LL))) == 0 || (v5 = (void *)v4,  v6 = -[NSString initWithData:encoding:](objc_alloc(&OBJC_CLASS___NSString), "initWithData:encoding:", v4, 4LL),  v5,  !v6))
  {
    uint64_t v6 = (NSString *)objc_claimAutoreleasedReturnValue([v3 description]);
  }

  unint64_t v7 = self->_topic - 1;
  if (v7 > 2) {
    v8 = @"Invalid";
  }
  else {
    v8 = off_1003F06D0[v7];
  }
  v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"(%@) %@: %@",  v8,  self->_timestamp,  v6));

  return v9;
}

- (void).cxx_destruct
{
}

@end