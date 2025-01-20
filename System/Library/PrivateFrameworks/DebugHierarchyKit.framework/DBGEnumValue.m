@interface DBGEnumValue
+ (id)valueWithEncodedValue:(id)a3 format:(id)a4 error:(id *)a5;
+ (id)withValue:(id)a3;
- (DBGEnumValue)initWithCustomValue:(id)a3;
- (NSString)debugDescription;
- (NSString)description;
- (id)enumValue;
- (id)stringValue;
- (int64_t)integerValue;
- (unint64_t)unsignedIntegerValue;
- (void)setEnumValue:(id)a3;
- (void)setIntegerValue:(int64_t)a3;
- (void)setStringValue:(id)a3;
- (void)setUnsignedIntegerValue:(unint64_t)a3;
@end

@implementation DBGEnumValue

+ (id)withValue:(id)a3
{
  id v4 = a3;
  id v5 = [objc_alloc((Class)a1) initWithCustomValue:v4];

  return v5;
}

- (DBGEnumValue)initWithCustomValue:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___DBGEnumValue;
  v6 = -[DBGEnumValue init](&v9, "init");
  v7 = v6;
  if (v6) {
    objc_storeStrong(&v6->_enumValue, a3);
  }

  return v7;
}

- (int64_t)integerValue
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[DBGEnumValue enumValue](self, "enumValue"));
  if (v3)
  {
    id v4 = (void *)objc_claimAutoreleasedReturnValue(-[DBGEnumValue enumValue](self, "enumValue"));
    uint64_t v6 = objc_opt_class(&OBJC_CLASS___NSNumber, v5);
    objc_opt_isKindOfClass(v4, v6);
  }

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[DBGEnumValue enumValue](self, "enumValue"));
  id v8 = [v7 integerValue];

  return (int64_t)v8;
}

- (void)setIntegerValue:(int64_t)a3
{
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[DBGEnumValue enumValue](self, "enumValue"));
  if (v5)
  {
    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(-[DBGEnumValue enumValue](self, "enumValue"));
    uint64_t v8 = objc_opt_class(&OBJC_CLASS___NSNumber, v7);
    objc_opt_isKindOfClass(v6, v8);
  }

  id v9 = (id)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", a3));
  -[DBGEnumValue setEnumValue:](self, "setEnumValue:", v9);
}

- (unint64_t)unsignedIntegerValue
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[DBGEnumValue enumValue](self, "enumValue"));
  if (v3)
  {
    id v4 = (void *)objc_claimAutoreleasedReturnValue(-[DBGEnumValue enumValue](self, "enumValue"));
    uint64_t v6 = objc_opt_class(&OBJC_CLASS___NSNumber, v5);
    objc_opt_isKindOfClass(v4, v6);
  }

  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(-[DBGEnumValue enumValue](self, "enumValue"));
  id v8 = [v7 unsignedIntegerValue];

  return (unint64_t)v8;
}

- (void)setUnsignedIntegerValue:(unint64_t)a3
{
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[DBGEnumValue enumValue](self, "enumValue"));
  if (v5)
  {
    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(-[DBGEnumValue enumValue](self, "enumValue"));
    uint64_t v8 = objc_opt_class(&OBJC_CLASS___NSNumber, v7);
    objc_opt_isKindOfClass(v6, v8);
  }

  id v9 = (id)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInteger:", a3));
  -[DBGEnumValue setEnumValue:](self, "setEnumValue:", v9);
}

- (id)stringValue
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[DBGEnumValue enumValue](self, "enumValue"));
  if (v3)
  {
    id v4 = (void *)objc_claimAutoreleasedReturnValue(-[DBGEnumValue enumValue](self, "enumValue"));
    uint64_t v6 = objc_opt_class(&OBJC_CLASS___NSString, v5);
    objc_opt_isKindOfClass(v4, v6);
  }

  return -[DBGEnumValue enumValue](self, "enumValue");
}

- (void)setStringValue:(id)a3
{
  id v8 = a3;
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[DBGEnumValue enumValue](self, "enumValue"));
  if (v4)
  {
    uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[DBGEnumValue enumValue](self, "enumValue"));
    uint64_t v7 = objc_opt_class(&OBJC_CLASS___NSString, v6);
    objc_opt_isKindOfClass(v5, v7);
  }

  -[DBGEnumValue setEnumValue:](self, "setEnumValue:", v8);
}

- (NSString)description
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[DBGEnumValue objectValue](self, "objectValue"));
  v3 = (void *)objc_claimAutoreleasedReturnValue([v2 description]);

  return (NSString *)v3;
}

- (NSString)debugDescription
{
  v3 = (objc_class *)objc_opt_class(self, a2);
  id v4 = NSStringFromClass(v3);
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(-[DBGEnumValue description](self, "description"));
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"<%@: %p %@>",  v5,  self,  v6));

  return (NSString *)v7;
}

- (id)enumValue
{
  return objc_getProperty(self, a2, 8LL, 1);
}

- (void)setEnumValue:(id)a3
{
}

- (void).cxx_destruct
{
}

+ (id)valueWithEncodedValue:(id)a3 format:(id)a4 error:(id *)a5
{
  id v12 = 0LL;
  uint64_t v7 = DBGDecodeValueFromJSONCompatibleValue(a3, a4, &v12);
  id v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  id v9 = v12;
  if (v9)
  {

    id v8 = 0LL;
    if (a5) {
      *a5 = v9;
    }
  }

  v10 = (void *)objc_claimAutoreleasedReturnValue([a1 withValue:v8]);

  return v10;
}

@end