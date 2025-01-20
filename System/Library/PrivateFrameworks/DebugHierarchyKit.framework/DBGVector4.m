@interface DBGVector4
+ (id)valueWithEncodedValue:(id)a3 format:(id)a4 error:(id *)a5;
+ (id)withVector4:(id)a1;
- (DBGVector4)initWithVector4:(DBGVector4 *)self;
- (NSString)debugDescription;
- (NSString)description;
- (id)JSONCompatibleRepresentation;
- (id)objectValue;
- (void)setVector4:(DBGVector4 *)self;
- (void)vector4;
@end

@implementation DBGVector4

+ (id)withVector4:(id)a1
{
  __int128 v4 = v2[1];
  v5[0] = *v2;
  v5[1] = v4;
  return [objc_alloc((Class)a1) initWithVector4:v5];
}

- (DBGVector4)initWithVector4:(DBGVector4 *)self
{
  __int128 v4 = *v2;
  __int128 v5 = v2[1];
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___DBGVector4;
  result = -[DBGVector4 init](&v6, "init");
  if (result)
  {
    *(_OWORD *)result->_vector4 = v4;
    *(_OWORD *)&result->_vector4[16] = v5;
  }

  return result;
}

- (id)objectValue
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", v12));
  v13[0] = v3;
  -[DBGVector4 vector4](self, "vector4");
  __int128 v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", v11));
  v13[1] = v4;
  -[DBGVector4 vector4](self, "vector4");
  __int128 v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", v10));
  v13[2] = v5;
  -[DBGVector4 vector4](self, "vector4");
  objc_super v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", v9));
  v13[3] = v6;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v13, 4LL));

  return v7;
}

- (NSString)description
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[DBGVector4 objectValue](self, "objectValue"));
  v3 = (void *)objc_claimAutoreleasedReturnValue([v2 description]);

  return (NSString *)v3;
}

- (NSString)debugDescription
{
  v3 = (objc_class *)objc_opt_class(self, a2);
  __int128 v4 = NSStringFromClass(v3);
  __int128 v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  objc_super v6 = (void *)objc_claimAutoreleasedReturnValue(-[DBGVector4 description](self, "description"));
  v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"<%@: %p %@>",  v5,  self,  v6));

  return (NSString *)v7;
}

- (void)vector4
{
}

- (void)setVector4:(DBGVector4 *)self
{
  __int128 v3 = v2[1];
  v4[0] = *v2;
  v4[1] = v3;
  objc_copyStruct(self->_vector4, v4, 32LL, 1, 0);
}

+ (id)valueWithEncodedValue:(id)a3 format:(id)a4 error:(id *)a5
{
  id v30 = 0LL;
  uint64_t v7 = DBGDecodeValueFromJSONCompatibleValue(a3, a4, &v30);
  v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  id v9 = v30;
  double v10 = v9;
  if (v9)
  {
    if (a5) {
      *a5 = v9;
    }
    __int128 v11 = 0uLL;
    __int128 v12 = 0uLL;
  }

  else
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue([v8 objectAtIndexedSubscript:0]);
    [v13 doubleValue];
    uint64_t v27 = v14;

    v15 = (void *)objc_claimAutoreleasedReturnValue([v8 objectAtIndexedSubscript:1]);
    [v15 doubleValue];
    __int128 v24 = v16;

    v17 = (void *)objc_claimAutoreleasedReturnValue([v8 objectAtIndexedSubscript:2]);
    [v17 doubleValue];
    uint64_t v25 = v18;

    v19 = (void *)objc_claimAutoreleasedReturnValue([v8 objectAtIndexedSubscript:3]);
    [v19 doubleValue];
    *(void *)&__int128 v20 = v27;
    *((void *)&v20 + 1) = v24;
    __int128 v28 = v20;
    *(void *)&__int128 v20 = v25;
    *((void *)&v20 + 1) = v21;
    __int128 v26 = v20;

    __int128 v12 = v26;
    __int128 v11 = v28;
  }

  v29[0] = v11;
  v29[1] = v12;
  v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "withVector4:", v29, v24));

  return v22;
}

- (id)JSONCompatibleRepresentation
{
  __int128 v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", v12));
  v13[0] = v3;
  -[DBGVector4 vector4](self, "vector4");
  __int128 v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", v11));
  v13[1] = v4;
  -[DBGVector4 vector4](self, "vector4");
  __int128 v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", v10));
  v13[2] = v5;
  -[DBGVector4 vector4](self, "vector4");
  objc_super v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", v9));
  v13[3] = v6;
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v13, 4LL));

  return v7;
}

@end