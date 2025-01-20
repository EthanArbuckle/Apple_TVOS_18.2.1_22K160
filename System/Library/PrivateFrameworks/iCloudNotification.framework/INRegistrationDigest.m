@interface INRegistrationDigest
- (BOOL)isEqual:(id)a3;
- (INRegistrationDigest)initWithData:(id)a3;
- (INRegistrationDigest)initWithRegistrationRequest:(id)a3;
- (id)data;
- (unint64_t)hash;
@end

@implementation INRegistrationDigest

- (INRegistrationDigest)initWithRegistrationRequest:(id)a3
{
  id v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)&OBJC_CLASS___INRegistrationDigest;
  v5 = -[INRegistrationDigest init](&v16, "init");
  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue([v4 parameters]);
    id v7 = [v6 mutableCopy];

    [v7 removeObjectForKey:@"cause"];
    v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSKeyedArchiver archivedDataWithRootObject:]( &OBJC_CLASS___NSKeyedArchiver,  "archivedDataWithRootObject:",  v7));
    v9 = v8;
    if (v8)
    {
      id v10 = v8;
      CC_SHA1([v10 bytes], (CC_LONG)objc_msgSend(v10, "length"), md);
      uint64_t v11 = objc_claimAutoreleasedReturnValue(+[NSData dataWithBytes:length:](&OBJC_CLASS___NSData, "dataWithBytes:length:", md, 20LL));
      hashData = v5->_hashData;
      v5->_hashData = (NSData *)v11;
    }

    else
    {
      uint64_t v13 = _INLogSystem(0LL);
      v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
        sub_1000146CC(v14);
      }
    }
  }

  return v5;
}

- (INRegistrationDigest)initWithData:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___INRegistrationDigest;
  v6 = -[INRegistrationDigest init](&v9, "init");
  id v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_hashData, a3);
  }

  return v7;
}

- (id)data
{
  return self->_hashData;
}

- (BOOL)isEqual:(id)a3
{
  id v5 = (INRegistrationDigest *)a3;
  if (v5 == self)
  {
    unsigned __int8 v9 = 1;
  }

  else
  {
    uint64_t v6 = objc_opt_class(&OBJC_CLASS___INRegistrationDigest, v4);
    if ((objc_opt_isKindOfClass(v5, v6) & 1) != 0)
    {
      hashData = self->_hashData;
      v8 = (void *)objc_claimAutoreleasedReturnValue(-[INRegistrationDigest data](v5, "data"));
      unsigned __int8 v9 = -[NSData isEqualToData:](hashData, "isEqualToData:", v8);
    }

    else
    {
      unsigned __int8 v9 = 0;
    }
  }

  return v9;
}

- (unint64_t)hash
{
  return (unint64_t)-[NSData hash](self->_hashData, "hash");
}

- (void).cxx_destruct
{
}

@end