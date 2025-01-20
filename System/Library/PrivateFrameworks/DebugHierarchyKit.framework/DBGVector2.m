@interface DBGVector2
+ (id)valueWithEncodedValue:(id)a3 format:(id)a4 error:(id *)a5;
+ (id)withVector2:(id)a1;
- (DBGVector2)initWithVector2:(DBGVector2 *)self;
- (NSString)debugDescription;
- (NSString)description;
- (double)vector2;
- (id)JSONCompatibleRepresentation;
- (id)objectValue;
- (void)setVector2:(DBGVector2 *)self;
@end

@implementation DBGVector2

+ (id)withVector2:(id)a1
{
  return [objc_alloc((Class)a1) initWithVector2:v2];
}

- (DBGVector2)initWithVector2:(DBGVector2 *)self
{
  __int128 v4 = v2;
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___DBGVector2;
  result = -[DBGVector2 init](&v5, "init");
  if (result) {
    *(_OWORD *)result->_vector2 = v4;
  }
  return result;
}

- (id)objectValue
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:"));
  v8[0] = v3;
  -[DBGVector2 vector2](self, "vector2");
  objc_super v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", v4));
  v8[1] = v5;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v8, 2LL));

  return v6;
}

- (NSString)description
{
  __int128 v2 = (void *)objc_claimAutoreleasedReturnValue(-[DBGVector2 objectValue](self, "objectValue"));
  v3 = (void *)objc_claimAutoreleasedReturnValue([v2 description]);

  return (NSString *)v3;
}

- (NSString)debugDescription
{
  v3 = (objc_class *)objc_opt_class(self, a2);
  double v4 = NSStringFromClass(v3);
  objc_super v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[DBGVector2 description](self, "description"));
  v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"<%@: %p %@>",  v5,  self,  v6));

  return (NSString *)v7;
}

- (double)vector2
{
  return *(double *)&v2;
}

- (void)setVector2:(DBGVector2 *)self
{
  __int128 v3 = v2;
  objc_copyStruct(self->_vector2, &v3, 16LL, 1, 0);
}

+ (id)valueWithEncodedValue:(id)a3 format:(id)a4 error:(id *)a5
{
  id v19 = 0LL;
  uint64_t v7 = DBGDecodeValueFromJSONCompatibleValue(a3, a4, &v19);
  v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  id v9 = v19;
  v10 = v9;
  if (v9)
  {
    double v11 = 0.0;
    if (a5)
    {
      id v12 = v9;
      double v11 = 0.0;
      *a5 = v12;
    }
  }

  else
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue([v8 objectAtIndexedSubscript:0]);
    [v13 doubleValue];
    double v18 = v14;

    v15 = (void *)objc_claimAutoreleasedReturnValue([v8 objectAtIndexedSubscript:1]);
    [v15 doubleValue];

    double v11 = v18;
  }

  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "withVector2:", v11, *(void *)&v18));

  return v16;
}

- (id)JSONCompatibleRepresentation
{
  __int128 v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:"));
  v8[0] = v3;
  -[DBGVector2 vector2](self, "vector2");
  objc_super v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", v4));
  v8[1] = v5;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v8, 2LL));

  return v6;
}

@end