@interface DBGCustomValue
+ (id)valueWithEncodedValue:(id)a3 format:(id)a4 error:(id *)a5;
+ (id)withValue:(id)a3;
- (DBGCustomValue)initWithCustomValue:(id)a3;
- (NSString)description;
- (id)customValue;
- (void)setCustomValue:(id)a3;
@end

@implementation DBGCustomValue

+ (id)withValue:(id)a3
{
  id v4 = a3;
  id v5 = [objc_alloc((Class)a1) initWithCustomValue:v4];

  return v5;
}

- (DBGCustomValue)initWithCustomValue:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___DBGCustomValue;
  v6 = -[DBGCustomValue init](&v9, "init");
  v7 = v6;
  if (v6) {
    objc_storeStrong(&v6->_customValue, a3);
  }

  return v7;
}

- (NSString)description
{
  v3 = (objc_class *)objc_opt_class(self, a2);
  id v4 = NSStringFromClass(v3);
  id v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[DBGCustomValue customValue](self, "customValue"));
  v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"<%@: %p %@>",  v5,  self,  v6));

  return (NSString *)v7;
}

- (id)customValue
{
  return objc_getProperty(self, a2, 8LL, 1);
}

- (void)setCustomValue:(id)a3
{
}

- (void).cxx_destruct
{
}

+ (id)valueWithEncodedValue:(id)a3 format:(id)a4 error:(id *)a5
{
  id v12 = 0LL;
  uint64_t v7 = DBGDecodeValueFromJSONCompatibleValue(a3, a4, &v12);
  v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  id v9 = v12;
  if (v9)
  {

    v8 = 0LL;
    if (a5) {
      *a5 = v9;
    }
  }

  v10 = (void *)objc_claimAutoreleasedReturnValue([a1 withValue:v8]);

  return v10;
}

@end