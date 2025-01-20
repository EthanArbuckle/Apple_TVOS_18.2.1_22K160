@interface CKKSSQLResult
- (BOOL)asBOOL;
- (NSString)stringValue;
- (id)asBase64DecodedData;
- (id)asISO8601Date;
- (id)asNSNumberInteger;
- (id)init:(id)a3;
- (int64_t)asNSInteger;
- (void)setStringValue:(id)a3;
@end

@implementation CKKSSQLResult

- (id)init:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___CKKSSQLResult;
  v6 = -[CKKSSQLResult init](&v9, "init");
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_stringValue, a3);
  }

  return v7;
}

- (BOOL)asBOOL
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSSQLResult stringValue](self, "stringValue"));
  unsigned __int8 v3 = [v2 BOOLValue];

  return v3;
}

- (int64_t)asNSInteger
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSSQLResult stringValue](self, "stringValue"));
  id v3 = [v2 integerValue];

  return (int64_t)v3;
}

- (id)asNSNumberInteger
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSSQLResult stringValue](self, "stringValue"));

  if (v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSSQLResult stringValue](self, "stringValue"));
    id v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithInteger:]( NSNumber,  "numberWithInteger:",  [v4 integerValue]));
  }

  else
  {
    id v5 = 0LL;
  }

  return v5;
}

- (id)asISO8601Date
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSSQLResult stringValue](self, "stringValue"));

  if (v3)
  {
    v4 = objc_alloc_init(&OBJC_CLASS___NSISO8601DateFormatter);
    id v5 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSSQLResult stringValue](self, "stringValue"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[NSISO8601DateFormatter dateFromString:](v4, "dateFromString:", v5));
  }

  else
  {
    v6 = 0LL;
  }

  return v6;
}

- (id)asBase64DecodedData
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSSQLResult stringValue](self, "stringValue"));

  if (v3)
  {
    v4 = objc_alloc(&OBJC_CLASS___NSData);
    id v5 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSSQLResult stringValue](self, "stringValue"));
    v6 = -[NSData initWithBase64EncodedString:options:](v4, "initWithBase64EncodedString:options:", v5, 0LL);
  }

  else
  {
    v6 = 0LL;
  }

  return v6;
}

- (NSString)stringValue
{
  return (NSString *)objc_getProperty(self, a2, 8LL, 1);
}

- (void)setStringValue:(id)a3
{
}

- (void).cxx_destruct
{
}

@end