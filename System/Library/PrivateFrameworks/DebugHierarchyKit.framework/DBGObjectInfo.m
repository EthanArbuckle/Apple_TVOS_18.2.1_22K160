@interface DBGObjectInfo
+ (id)valueWithEncodedValue:(id)a3 format:(id)a4 error:(id *)a5;
+ (id)withInfo:(id)a3;
- (DBGObjectInfo)initWithInfo:(id)a3;
- (NSDictionary)objectInfo;
- (NSString)debugDescription;
- (NSString)description;
- (NSString)displayString;
- (id)objectClassName;
- (id)objectPointer;
- (void)setObjectInfo:(id)a3;
@end

@implementation DBGObjectInfo

+ (id)withInfo:(id)a3
{
  id v4 = a3;
  id v5 = [objc_alloc((Class)a1) initWithInfo:v4];

  return v5;
}

- (DBGObjectInfo)initWithInfo:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___DBGObjectInfo;
  v6 = -[DBGObjectInfo init](&v9, "init");
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_objectInfo, a3);
  }

  return v7;
}

- (NSString)displayString
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[DBGObjectInfo objectInfo](self, "objectInfo"));

  if (v3)
  {
    id v4 = (void *)objc_claimAutoreleasedReturnValue(-[DBGObjectInfo objectClassName](self, "objectClassName"));
    uint64_t v5 = objc_claimAutoreleasedReturnValue(-[DBGObjectInfo objectPointer](self, "objectPointer"));
    v6 = (void *)v5;
    v7 = 0LL;
    if (v4 && v5) {
      v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"<%@: %@>",  v4,  v5));
    }
  }

  else
  {
    v7 = 0LL;
  }

  return (NSString *)v7;
}

- (id)objectClassName
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[DBGObjectInfo objectInfo](self, "objectInfo"));
  v3 = (void *)objc_claimAutoreleasedReturnValue([v2 objectForKeyedSubscript:@"className"]);

  return v3;
}

- (id)objectPointer
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[DBGObjectInfo objectInfo](self, "objectInfo"));
  v3 = (void *)objc_claimAutoreleasedReturnValue([v2 objectForKeyedSubscript:@"memoryAddress"]);

  return v3;
}

- (NSString)description
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[DBGObjectInfo objectValue](self, "objectValue"));
  v3 = (void *)objc_claimAutoreleasedReturnValue([v2 description]);

  return (NSString *)v3;
}

- (NSString)debugDescription
{
  v3 = (objc_class *)objc_opt_class(self, a2);
  id v4 = NSStringFromClass(v3);
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[DBGObjectInfo description](self, "description"));
  v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"<%@: %p %@>",  v5,  self,  v6));

  return (NSString *)v7;
}

- (NSDictionary)objectInfo
{
  return (NSDictionary *)objc_getProperty(self, a2, 8LL, 1);
}

- (void)setObjectInfo:(id)a3
{
}

- (void).cxx_destruct
{
}

+ (id)valueWithEncodedValue:(id)a3 format:(id)a4 error:(id *)a5
{
  id v8 = a3;
  if ([a4 isEqualToString:@"objectInfo"]
    && (uint64_t v10 = objc_opt_class(&OBJC_CLASS___NSDictionary, v9), (objc_opt_isKindOfClass(v8, v10) & 1) != 0))
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue([a1 withInfo:v8]);
  }

  else
  {
    v11 = 0LL;
    if (!v8 && a5)
    {
      v11 = 0LL;
      *a5 = 0LL;
    }
  }

  return v11;
}

@end