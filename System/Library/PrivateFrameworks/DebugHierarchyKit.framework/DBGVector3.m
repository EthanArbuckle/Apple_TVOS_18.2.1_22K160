@interface DBGVector3
+ (id)valueWithEncodedValue:(id)a3 format:(id)a4 error:(id *)a5;
+ (id)withVector3:(id)a1;
- (DBGVector3)initWithVector3:(DBGVector3 *)self;
- (NSString)debugDescription;
- (NSString)description;
- (double)vector3;
- (id)JSONCompatibleRepresentation;
- (id)objectValue;
- (void)setVector3:(DBGVector3 *)self;
@end

@implementation DBGVector3

+ (id)withVector3:(id)a1
{
  __int128 v4 = v2[1];
  v5[0] = *v2;
  v5[1] = v4;
  return [objc_alloc((Class)a1) initWithVector3:v5];
}

- (DBGVector3)initWithVector3:(DBGVector3 *)self
{
  __int128 v4 = *v2;
  __int128 v5 = v2[1];
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___DBGVector3;
  result = -[DBGVector3 init](&v6, "init");
  if (result)
  {
    *(_OWORD *)result->_vector3 = v4;
    *(_OWORD *)&result->_vector3[16] = v5;
  }

  return result;
}

- (id)objectValue
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", v10));
  v11[0] = v3;
  -[DBGVector3 vector3](self, "vector3");
  __int128 v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", v9));
  v11[1] = v4;
  -[DBGVector3 vector3](self, "vector3");
  __int128 v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", v8));
  v11[2] = v5;
  objc_super v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v11, 3LL));

  return v6;
}

- (NSString)description
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[DBGVector3 objectValue](self, "objectValue"));
  v3 = (void *)objc_claimAutoreleasedReturnValue([v2 description]);

  return (NSString *)v3;
}

- (NSString)debugDescription
{
  v3 = (objc_class *)objc_opt_class(self, a2);
  __int128 v4 = NSStringFromClass(v3);
  __int128 v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  objc_super v6 = (void *)objc_claimAutoreleasedReturnValue(-[DBGVector3 description](self, "description"));
  v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"<%@: %p %@>",  v5,  self,  v6));

  return (NSString *)v7;
}

- (double)vector3
{
  *(void *)&__int128 v3 = a2[2];
  *((_OWORD *)a2 + 1) = v3;
  return *(double *)&v3;
}

- (void)setVector3:(DBGVector3 *)self
{
  __int128 v3 = v2[1];
  v4[0] = *v2;
  v4[1] = v3;
  objc_copyStruct(self->_vector3, v4, 32LL, 1, 0);
}

+ (id)valueWithEncodedValue:(id)a3 format:(id)a4 error:(id *)a5
{
  id v26 = 0LL;
  uint64_t v7 = DBGDecodeValueFromJSONCompatibleValue(a3, a4, &v26);
  double v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  id v9 = v26;
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
    uint64_t v23 = v14;

    v15 = (void *)objc_claimAutoreleasedReturnValue([v8 objectAtIndexedSubscript:1]);
    [v15 doubleValue];
    uint64_t v22 = v16;

    v17 = (void *)objc_claimAutoreleasedReturnValue([v8 objectAtIndexedSubscript:2]);
    [v17 doubleValue];
    __int128 v21 = v18;
    *(void *)&__int128 v18 = v23;
    *((void *)&v18 + 1) = v22;
    __int128 v24 = v18;

    __int128 v12 = v21;
    __int128 v11 = v24;
  }

  v25[0] = v11;
  v25[1] = v12;
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "withVector3:", v25, v21));

  return v19;
}

- (id)JSONCompatibleRepresentation
{
  __int128 v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", v10));
  v11[0] = v3;
  -[DBGVector3 vector3](self, "vector3");
  __int128 v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", v9));
  v11[1] = v4;
  -[DBGVector3 vector3](self, "vector3");
  __int128 v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", v8));
  v11[2] = v5;
  objc_super v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v11, 3LL));

  return v6;
}

@end