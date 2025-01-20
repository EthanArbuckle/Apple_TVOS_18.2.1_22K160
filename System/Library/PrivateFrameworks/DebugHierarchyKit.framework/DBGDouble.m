@interface DBGDouble
+ (id)valueWithEncodedValue:(id)a3 format:(id)a4 error:(id *)a5;
+ (id)withValue:(double)a3;
- (DBGDouble)initWithDouble:(double)a3;
- (NSString)debugDescription;
- (NSString)description;
- (double)doubleValue;
- (id)JSONCompatibleRepresentation;
- (id)objectValue;
- (void)setDoubleValue:(double)a3;
@end

@implementation DBGDouble

+ (id)withValue:(double)a3
{
  return [objc_alloc((Class)a1) initWithDouble:a3];
}

- (DBGDouble)initWithDouble:(double)a3
{
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___DBGDouble;
  result = -[DBGDouble init](&v5, "init");
  if (result) {
    result->_doubleValue = a3;
  }
  return result;
}

- (id)objectValue
{
  return +[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:");
}

- (NSString)description
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[DBGDouble objectValue](self, "objectValue"));
  v3 = (void *)objc_claimAutoreleasedReturnValue([v2 description]);

  return (NSString *)v3;
}

- (NSString)debugDescription
{
  v3 = (objc_class *)objc_opt_class(self, a2);
  v4 = NSStringFromClass(v3);
  objc_super v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[DBGDouble description](self, "description"));
  v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"<%@: %p %@>",  v5,  self,  v6));

  return (NSString *)v7;
}

- (double)doubleValue
{
  return self->_doubleValue;
}

- (void)setDoubleValue:(double)a3
{
  self->_doubleValue = a3;
}

+ (id)valueWithEncodedValue:(id)a3 format:(id)a4 error:(id *)a5
{
  id v8 = a3;
  if ([a4 isEqualToString:@"d"])
  {
    uint64_t v10 = objc_opt_class(&OBJC_CLASS___NSNumber, v9);
    if ((objc_opt_isKindOfClass(v8, v10) & 1) != 0)
    {
      [v8 doubleValue];
      goto LABEL_9;
    }

    uint64_t v13 = objc_opt_class(&OBJC_CLASS___NSString, v11);
    if ((objc_opt_isKindOfClass(v8, v13) & 1) != 0)
    {
      [v8 dbgDoubleValue];
      goto LABEL_9;
    }
  }

  double v12 = 0.0;
  if (!v8 && a5) {
    *a5 = 0LL;
  }
LABEL_9:
  v14 = (void *)objc_claimAutoreleasedReturnValue([a1 withValue:v12]);

  return v14;
}

- (id)JSONCompatibleRepresentation
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:"));
  v3 = (void *)objc_claimAutoreleasedReturnValue([v2 dbgStringForType:@"d" error:0]);

  return v3;
}

@end