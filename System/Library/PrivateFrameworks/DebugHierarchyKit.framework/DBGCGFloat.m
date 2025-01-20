@interface DBGCGFloat
+ (id)valueWithEncodedValue:(id)a3 format:(id)a4 error:(id *)a5;
+ (id)withValue:(double)a3;
- (BOOL)backingTypeIsDouble;
- (DBGCGFloat)initWithCGFloat:(double)a3;
- (NSString)debugDescription;
- (NSString)description;
- (double)CGFloatValue;
- (double)doubleValue;
- (float)floatValue;
- (id)JSONCompatibleRepresentation;
- (id)objectValue;
- (void)setBackingTypeIsDouble:(BOOL)a3;
- (void)setCGFloatValue:(double)a3;
- (void)setDoubleValue:(double)a3;
- (void)setFloatValue:(float)a3;
@end

@implementation DBGCGFloat

- (double)CGFloatValue
{
  if (-[DBGCGFloat backingTypeIsDouble](self, "backingTypeIsDouble"))
  {
    -[DBGCGFloat doubleValue](self, "doubleValue");
  }

  else
  {
    -[DBGCGFloat floatValue](self, "floatValue");
    return v4;
  }

  return result;
}

- (void)setCGFloatValue:(double)a3
{
  if (-[DBGCGFloat backingTypeIsDouble](self, "backingTypeIsDouble"))
  {
    -[DBGCGFloat setDoubleValue:](self, "setDoubleValue:", a3);
  }

  else
  {
    *(float *)&double v5 = a3;
    -[DBGCGFloat setFloatValue:](self, "setFloatValue:", v5);
  }

+ (id)withValue:(double)a3
{
  return [objc_alloc((Class)a1) initWithCGFloat:a3];
}

- (DBGCGFloat)initWithCGFloat:(double)a3
{
  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS___DBGCGFloat;
  float v4 = -[DBGCGFloat init](&v7, "init");
  double v5 = v4;
  if (v4)
  {
    v4->_backingTypeIsDouble = 1;
    -[DBGCGFloat setCGFloatValue:](v4, "setCGFloatValue:", a3);
  }

  return v5;
}

- (id)objectValue
{
  return +[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:");
}

- (NSString)description
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[DBGCGFloat objectValue](self, "objectValue"));
  v3 = (void *)objc_claimAutoreleasedReturnValue([v2 description]);

  return (NSString *)v3;
}

- (NSString)debugDescription
{
  v3 = (objc_class *)objc_opt_class(self, a2);
  float v4 = NSStringFromClass(v3);
  double v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[DBGCGFloat description](self, "description"));
  objc_super v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"<%@: %p %@>",  v5,  self,  v6));

  return (NSString *)v7;
}

- (BOOL)backingTypeIsDouble
{
  return self->_backingTypeIsDouble;
}

- (void)setBackingTypeIsDouble:(BOOL)a3
{
  self->_backingTypeIsDouble = a3;
}

- (double)doubleValue
{
  return self->_doubleValue;
}

- (void)setDoubleValue:(double)a3
{
  self->_doubleValue = a3;
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
  if ([a4 isEqualToString:@"CGf"])
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
      [v8 dbgCGFloatValue];
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
  v3 = (void *)objc_claimAutoreleasedReturnValue([v2 dbgStringForType:@"CGf" error:0]);

  return v3;
}

@end