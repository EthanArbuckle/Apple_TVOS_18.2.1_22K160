@interface DBGMatrix2
+ (id)valueWithEncodedValue:(id)a3 format:(id)a4 error:(id *)a5;
+ (id)withMatrix2:(double)a3;
- (NSString)debugDescription;
- (NSString)description;
- (__n128)initWithMatrix2:(__n128)a3;
- (double)matrix2;
- (id)JSONCompatibleRepresentation;
- (id)objectValue;
- (void)setMatrix2:(__n128)a3;
@end

@implementation DBGMatrix2

+ (id)withMatrix2:(double)a3
{
  return objc_msgSend([a1 alloc], "initWithMatrix2:", a2, a3);
}

- (__n128)initWithMatrix2:(__n128)a3
{
  v7.receiver = a1;
  v7.super_class = (Class)&OBJC_CLASS___DBGMatrix2;
  v3 = -[DBGMatrix2 init](&v7, "init");
  if (v3)
  {
    __n128 result = a3;
    v3[1] = (DBGMatrix2)a2;
    v3[2] = (DBGMatrix2)a3;
  }

  return result;
}

- (id)objectValue
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:"));
  v12[0] = v3;
  -[DBGMatrix2 matrix2](self, "matrix2");
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", v4));
  v12[1] = v5;
  -[DBGMatrix2 matrix2](self, "matrix2");
  objc_super v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", v6));
  v12[2] = v7;
  -[DBGMatrix2 matrix2](self, "matrix2");
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", v8));
  v12[3] = v9;
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v12, 4LL));

  return v10;
}

- (NSString)description
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[DBGMatrix2 objectValue](self, "objectValue"));
  v3 = (void *)objc_claimAutoreleasedReturnValue([v2 description]);

  return (NSString *)v3;
}

- (NSString)debugDescription
{
  v3 = (objc_class *)objc_opt_class(self, a2);
  double v4 = NSStringFromClass(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  double v6 = (void *)objc_claimAutoreleasedReturnValue(-[DBGMatrix2 description](self, "description"));
  objc_super v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"<%@: %p %@>",  v5,  self,  v6));

  return (NSString *)v7;
}

- (double)matrix2
{
  return *(double *)&v2;
}

- (void)setMatrix2:(__n128)a3
{
  v3[0] = a2;
  v3[1] = a3;
  objc_copyStruct((void *)(a1 + 16), v3, 32LL, 1, 0);
}

+ (id)valueWithEncodedValue:(id)a3 format:(id)a4 error:(id *)a5
{
  id v25 = 0LL;
  uint64_t v7 = DBGDecodeValueFromJSONCompatibleValue(a3, a4, &v25);
  double v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  id v9 = v25;
  v10 = v9;
  if (v9)
  {
    simd_double2 v11 = matrix_identity_double2x2.columns[0];
    simd_double2 v12 = matrix_identity_double2x2.columns[1];
    if (a5)
    {
      simd_double2 v22 = matrix_identity_double2x2.columns[1];
      simd_double2 v23 = matrix_identity_double2x2.columns[0];
      id v13 = v9;
      v12.f64[0] = v22.f64[0];
      v11.f64[0] = v23.f64[0];
      *a5 = v13;
    }
  }

  else
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue([v8 objectAtIndexedSubscript:0]);
    [v14 doubleValue];
    double v24 = v15;

    v16 = (void *)objc_claimAutoreleasedReturnValue([v8 objectAtIndexedSubscript:1]);
    [v16 doubleValue];

    v17 = (void *)objc_claimAutoreleasedReturnValue([v8 objectAtIndexedSubscript:4]);
    [v17 doubleValue];
    v22.f64[0] = v18;

    v19 = (void *)objc_claimAutoreleasedReturnValue([v8 objectAtIndexedSubscript:5]);
    [v19 doubleValue];

    v12.f64[0] = v22.f64[0];
    v11.f64[0] = v24;
  }

  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "withMatrix2:", v11.f64[0], v12.f64[0], *(void *)&v22.f64[0]));

  return v20;
}

- (id)JSONCompatibleRepresentation
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:"));
  v12[0] = v3;
  -[DBGMatrix2 matrix2](self, "matrix2");
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", v4));
  v12[1] = v5;
  -[DBGMatrix2 matrix2](self, "matrix2");
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", v6));
  v12[2] = v7;
  -[DBGMatrix2 matrix2](self, "matrix2");
  id v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", v8));
  v12[3] = v9;
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v12, 4LL));

  return v10;
}

@end