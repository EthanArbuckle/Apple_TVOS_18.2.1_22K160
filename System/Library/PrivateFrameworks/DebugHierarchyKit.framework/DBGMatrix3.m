@interface DBGMatrix3
+ (id)valueWithEncodedValue:(id)a3 format:(id)a4 error:(id *)a5;
+ (id)withMatrix3:(_OWORD *)a3;
- (NSString)debugDescription;
- (NSString)description;
- (__n128)initWithMatrix3:(uint64_t)a3;
- (id)JSONCompatibleRepresentation;
- (id)objectValue;
- (void)matrix3;
- (void)setMatrix3:(const void *)a3;
@end

@implementation DBGMatrix3

+ (id)withMatrix3:(_OWORD *)a3
{
  id v4 = objc_alloc(a1);
  __int128 v5 = a3[3];
  v9[2] = a3[2];
  v9[3] = v5;
  __int128 v6 = a3[5];
  v9[4] = a3[4];
  v9[5] = v6;
  __int128 v7 = a3[1];
  v9[0] = *a3;
  v9[1] = v7;
  return [v4 initWithMatrix3:v9];
}

- (__n128)initWithMatrix3:(uint64_t)a3
{
  v9.receiver = a1;
  v9.super_class = (Class)&OBJC_CLASS___DBGMatrix3;
  id v4 = -[DBGMatrix3 init](&v9, "init");
  if (v4)
  {
    DBGMatrix3 v6 = *(DBGMatrix3 *)(a3 + 16);
    v4[1] = *(DBGMatrix3 *)a3;
    v4[2] = v6;
    __n128 result = *(__n128 *)(a3 + 32);
    DBGMatrix3 v7 = *(DBGMatrix3 *)(a3 + 48);
    DBGMatrix3 v8 = *(DBGMatrix3 *)(a3 + 80);
    v4[5] = *(DBGMatrix3 *)(a3 + 64);
    v4[6] = v8;
    v4[3] = (DBGMatrix3)result;
    v4[4] = v7;
  }

  return result;
}

- (id)objectValue
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", v22));
  v23[0] = v3;
  -[DBGMatrix3 matrix3](self, "matrix3");
  id v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", v21));
  v23[1] = v4;
  -[DBGMatrix3 matrix3](self, "matrix3");
  __int128 v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", v20));
  v23[2] = v5;
  -[DBGMatrix3 matrix3](self, "matrix3");
  DBGMatrix3 v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", v19));
  v23[3] = v6;
  -[DBGMatrix3 matrix3](self, "matrix3");
  DBGMatrix3 v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", v18));
  v23[4] = v7;
  -[DBGMatrix3 matrix3](self, "matrix3");
  DBGMatrix3 v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", v17));
  v23[5] = v8;
  -[DBGMatrix3 matrix3](self, "matrix3");
  objc_super v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", v16));
  v23[6] = v9;
  -[DBGMatrix3 matrix3](self, "matrix3");
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", v15));
  v23[7] = v10;
  -[DBGMatrix3 matrix3](self, "matrix3");
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", v14));
  v23[8] = v11;
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v23, 9LL));

  return v12;
}

- (NSString)description
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[DBGMatrix3 objectValue](self, "objectValue"));
  v3 = (void *)objc_claimAutoreleasedReturnValue([v2 description]);

  return (NSString *)v3;
}

- (NSString)debugDescription
{
  v3 = (objc_class *)objc_opt_class(self, a2);
  id v4 = NSStringFromClass(v3);
  __int128 v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  DBGMatrix3 v6 = (void *)objc_claimAutoreleasedReturnValue(-[DBGMatrix3 description](self, "description"));
  DBGMatrix3 v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"<%@: %p %@>",  v5,  self,  v6));

  return (NSString *)v7;
}

- (void)matrix3
{
}

- (void)setMatrix3:(const void *)a3
{
}

+ (id)valueWithEncodedValue:(id)a3 format:(id)a4 error:(id *)a5
{
  double v7 = matrix_identity_double3x3.columns[0].f64[3];
  double v8 = matrix_identity_double3x3.columns[1].f64[3];
  double v9 = matrix_identity_double3x3.columns[2].f64[3];
  id v70 = 0LL;
  uint64_t v10 = DBGDecodeValueFromJSONCompatibleValue(a3, a4, &v70);
  v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
  id v12 = v70;
  double v14 = v12;
  if (v12)
  {
    double v15 = matrix_identity_double3x3.columns[0].f64[2];
    int8x16_t v16 = *(int8x16_t *)matrix_identity_double3x3.columns[0].f64;
    unint64_t v17 = vextq_s8(v16, v16, 8uLL).u64[0];
    double v18 = matrix_identity_double3x3.columns[1].f64[2];
    int8x16_t v19 = *(int8x16_t *)matrix_identity_double3x3.columns[1].f64;
    unint64_t v20 = vextq_s8(v19, v19, 8uLL).u64[0];
    *(double *)&__int128 v13 = matrix_identity_double3x3.columns[2].f64[2];
    int8x16_t v21 = *(int8x16_t *)matrix_identity_double3x3.columns[2].f64;
    unint64_t v22 = vextq_s8(v21, v21, 8uLL).u64[0];
    if (a5)
    {
      unint64_t v57 = v17;
      __int128 v59 = *(_OWORD *)matrix_identity_double3x3.columns[0].f64;
      __int128 v53 = *(_OWORD *)matrix_identity_double3x3.columns[1].f64;
      double v55 = matrix_identity_double3x3.columns[0].f64[2];
      double v49 = matrix_identity_double3x3.columns[1].f64[2];
      unint64_t v51 = v20;
      unint64_t v45 = v22;
      __int128 v47 = *(_OWORD *)matrix_identity_double3x3.columns[2].f64;
      __int128 v44 = v13;
      id v23 = v12;
      *(void *)&__int128 v13 = v44;
      unint64_t v22 = v45;
      v21.i64[0] = v47;
      double v18 = v49;
      unint64_t v20 = v51;
      v19.i64[0] = v53;
      double v15 = v55;
      unint64_t v17 = v57;
      v16.i64[0] = v59;
      *a5 = v23;
    }
  }

  else
  {
    v24 = (void *)objc_claimAutoreleasedReturnValue([v11 objectAtIndexedSubscript:0]);
    [v24 doubleValue];
    uint64_t v60 = v25;

    v26 = (void *)objc_claimAutoreleasedReturnValue([v11 objectAtIndexedSubscript:1]);
    [v26 doubleValue];
    unint64_t v58 = v27;

    v28 = (void *)objc_claimAutoreleasedReturnValue([v11 objectAtIndexedSubscript:2]);
    [v28 doubleValue];
    double v56 = v29;

    v30 = (void *)objc_claimAutoreleasedReturnValue([v11 objectAtIndexedSubscript:4]);
    [v30 doubleValue];
    uint64_t v54 = v31;

    v32 = (void *)objc_claimAutoreleasedReturnValue([v11 objectAtIndexedSubscript:5]);
    [v32 doubleValue];
    unint64_t v52 = v33;

    v34 = (void *)objc_claimAutoreleasedReturnValue([v11 objectAtIndexedSubscript:6]);
    [v34 doubleValue];
    double v50 = v35;

    v36 = (void *)objc_claimAutoreleasedReturnValue([v11 objectAtIndexedSubscript:8]);
    [v36 doubleValue];
    uint64_t v48 = v37;

    v38 = (void *)objc_claimAutoreleasedReturnValue([v11 objectAtIndexedSubscript:9]);
    [v38 doubleValue];
    unint64_t v46 = v39;

    v40 = (void *)objc_claimAutoreleasedReturnValue([v11 objectAtIndexedSubscript:10]);
    [v40 doubleValue];
    __int128 v44 = v41;

    *(void *)&__int128 v13 = v44;
    unint64_t v22 = v46;
    v21.i64[0] = v48;
    double v18 = v50;
    unint64_t v20 = v52;
    v19.i64[0] = v54;
    double v15 = v56;
    unint64_t v17 = v58;
    v16.i64[0] = v60;
  }

  double v62 = v15;
  v16.i64[1] = v17;
  int8x16_t v61 = v16;
  double v63 = v7;
  double v65 = v18;
  v19.i64[1] = v20;
  int8x16_t v64 = v19;
  double v66 = v8;
  uint64_t v68 = v13;
  v21.i64[1] = v22;
  int8x16_t v67 = v21;
  double v69 = v9;
  v42 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "withMatrix3:", &v61, v44));

  return v42;
}

- (id)JSONCompatibleRepresentation
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", v22));
  v23[0] = v3;
  -[DBGMatrix3 matrix3](self, "matrix3");
  id v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", v21));
  v23[1] = v4;
  -[DBGMatrix3 matrix3](self, "matrix3");
  __int128 v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", v20));
  v23[2] = v5;
  -[DBGMatrix3 matrix3](self, "matrix3");
  DBGMatrix3 v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", v19));
  v23[3] = v6;
  -[DBGMatrix3 matrix3](self, "matrix3");
  double v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", v18));
  v23[4] = v7;
  -[DBGMatrix3 matrix3](self, "matrix3");
  double v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", v17));
  v23[5] = v8;
  -[DBGMatrix3 matrix3](self, "matrix3");
  double v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", v16));
  v23[6] = v9;
  -[DBGMatrix3 matrix3](self, "matrix3");
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", v15));
  v23[7] = v10;
  -[DBGMatrix3 matrix3](self, "matrix3");
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", v14));
  v23[8] = v11;
  id v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v23, 9LL));

  return v12;
}

@end