@interface DBGFloat
+ (id)valueWithEncodedValue:(id)a3 format:(id)a4 error:(id *)a5;
+ (id)withValue:(float)a3;
- (DBGFloat)initWithFloat:(float)a3;
- (NSString)debugDescription;
- (NSString)description;
- (float)floatValue;
- (id)JSONCompatibleRepresentation;
- (id)objectValue;
- (void)setFloatValue:(float)a3;
@end

@implementation DBGFloat

+ (id)withValue:(float)a3
{
  id v4 = objc_alloc((Class)a1);
  *(float *)&double v5 = a3;
  return [v4 initWithFloat:v5];
}

- (DBGFloat)initWithFloat:(float)a3
{
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___DBGFloat;
  result = -[DBGFloat init](&v5, "init");
  if (result) {
    result->_floatValue = a3;
  }
  return result;
}

- (id)objectValue
{
  return +[NSNumber numberWithFloat:](&OBJC_CLASS___NSNumber, "numberWithFloat:");
}

- (NSString)description
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[DBGFloat objectValue](self, "objectValue"));
  v3 = (void *)objc_claimAutoreleasedReturnValue([v2 description]);

  return (NSString *)v3;
}

- (NSString)debugDescription
{
  v3 = (objc_class *)objc_opt_class(self, a2);
  id v4 = NSStringFromClass(v3);
  objc_super v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[DBGFloat description](self, "description"));
  v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"<%@: %p %@>",  v5,  self,  v6));

  return (NSString *)v7;
}

- (float)floatValue
{
  return self->_floatValue;
}

- (void)setFloatValue:(float)a3
{
  self->_floatValue = a3;
}

+ (id)valueWithEncodedValue:(id)a3 format:(id)a4 error:(id *)a5
{
  id v8 = a3;
  if ([a4 isEqualToString:@"f"])
  {
    uint64_t v11 = objc_opt_class(&OBJC_CLASS___NSNumber, v9);
    if ((objc_opt_isKindOfClass(v8, v11) & 1) != 0)
    {
      [v8 floatValue];
      goto LABEL_9;
    }

    uint64_t v13 = objc_opt_class(&OBJC_CLASS___NSString, v12);
    if ((objc_opt_isKindOfClass(v8, v13) & 1) != 0)
    {
      [v8 dbgFloatValue];
      goto LABEL_9;
    }
  }

  LODWORD(v10) = 0;
  if (!v8 && a5) {
    *a5 = 0LL;
  }
LABEL_9:
  v14 = (void *)objc_claimAutoreleasedReturnValue([a1 withValue:v10]);

  return v14;
}

- (id)JSONCompatibleRepresentation
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](&OBJC_CLASS___NSNumber, "numberWithFloat:"));
  v3 = (void *)objc_claimAutoreleasedReturnValue([v2 dbgStringForType:@"f" error:0]);

  return v3;
}

@end