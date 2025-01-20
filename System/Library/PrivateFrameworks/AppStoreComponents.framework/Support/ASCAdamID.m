@interface ASCAdamID
+ (ASCAdamID)invalidAdamID;
+ (BOOL)supportsSecureCoding;
- (ASCAdamID)initWithCoder:(id)a3;
- (ASCAdamID)initWithInt64:(int64_t)a3;
- (ASCAdamID)initWithNumberValue:(id)a3;
- (ASCAdamID)initWithStringValue:(id)a3;
- (BOOL)isEqual:(id)a3;
- (NSNumber)numberValue;
- (NSString)stringValue;
- (id)description;
- (int64_t)int64value;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation ASCAdamID

- (ASCAdamID)initWithStringValue:(id)a3
{
  id v4 = a3;
  sub_10000F4DC((uint64_t)&OBJC_CLASS___ASCEligibility);
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___ASCAdamID;
  v5 = -[ASCAdamID init](&v9, "init");
  if (v5)
  {
    v6 = (NSString *)[v4 copy];
    stringValue = v5->_stringValue;
    v5->_stringValue = v6;
  }

  return v5;
}

- (ASCAdamID)initWithNumberValue:(id)a3
{
  id v4 = (void *)objc_claimAutoreleasedReturnValue([a3 stringValue]);
  v5 = -[ASCAdamID initWithStringValue:](self, "initWithStringValue:", v4);

  return v5;
}

- (ASCAdamID)initWithInt64:(int64_t)a3
{
  id v4 = -[NSString initWithFormat:](objc_alloc(&OBJC_CLASS___NSString), "initWithFormat:", @"%lld", a3);
  v5 = -[ASCAdamID initWithStringValue:](self, "initWithStringValue:", v4);

  return v5;
}

+ (ASCAdamID)invalidAdamID
{
  return (ASCAdamID *)[objc_alloc((Class)a1) initWithInt64:0x8000000000000000];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (ASCAdamID)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [v4 decodeObjectOfClass:objc_opt_class(NSString) forKey:@"stringValue"];
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);

  if (v6)
  {
    self = -[ASCAdamID initWithStringValue:](self, "initWithStringValue:", v6);
    v7 = self;
  }

  else
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_1000E0770();
    }
    v7 = 0LL;
  }

  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = (id)objc_claimAutoreleasedReturnValue(-[ASCAdamID stringValue](self, "stringValue"));
  [v4 encodeObject:v5 forKey:@"stringValue"];
}

- (unint64_t)hash
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[ASCAdamID stringValue](self, "stringValue"));
  v3 = (char *)[v2 hash] + 47;

  return (unint64_t)v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_opt_class(&OBJC_CLASS___ASCAdamID);
  id v6 = v4;
  v7 = v6;
  if (v6)
  {
    if ((objc_opt_isKindOfClass(v6, v5) & 1) != 0) {
      v8 = v7;
    }
    else {
      v8 = 0LL;
    }
  }

  else
  {
    v8 = 0LL;
  }

  id v9 = v8;

  if (v9)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[ASCAdamID stringValue](self, "stringValue"));
    uint64_t v11 = objc_claimAutoreleasedReturnValue([v9 stringValue]);
    v12 = (void *)v11;
    if (v10 && v11) {
      unsigned __int8 v13 = [v10 isEqual:v11];
    }
    else {
      unsigned __int8 v13 = v10 == (void *)v11;
    }
  }

  else
  {
    unsigned __int8 v13 = 0;
  }

  return v13;
}

- (id)description
{
  v3 = -[ASCDescriber initWithObject:](objc_alloc(&OBJC_CLASS___ASCDescriber), "initWithObject:", self);
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[ASCAdamID stringValue](self, "stringValue"));
  -[ASCDescriber addSensitiveObject:withName:](v3, "addSensitiveObject:withName:", v4, @"stringValue");

  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[ASCDescriber finalizeDescription](v3, "finalizeDescription"));
  return v5;
}

- (NSNumber)numberValue
{
  v3 = objc_alloc(&OBJC_CLASS___NSNumber);
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[ASCAdamID stringValue](self, "stringValue"));
  uint64_t v5 = -[NSNumber initWithLongLong:](v3, "initWithLongLong:", [v4 longLongValue]);

  return v5;
}

- (int64_t)int64value
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[ASCAdamID stringValue](self, "stringValue"));
  id v3 = [v2 longLongValue];

  return (int64_t)v3;
}

- (NSString)stringValue
{
  return self->_stringValue;
}

- (void).cxx_destruct
{
}

@end