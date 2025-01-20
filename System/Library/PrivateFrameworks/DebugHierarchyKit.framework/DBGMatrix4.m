@interface DBGMatrix4
+ (id)valueWithEncodedValue:(id)a3 format:(id)a4 error:(id *)a5;
+ (id)withMatrix4:(_OWORD *)a3;
- (NSString)debugDescription;
- (NSString)description;
- (__n128)initWithMatrix4:(uint64_t)a3;
- (id)JSONCompatibleRepresentation;
- (id)objectValue;
- (void)matrix4;
- (void)setMatrix4:(const void *)a3;
@end

@implementation DBGMatrix4

+ (id)withMatrix4:(_OWORD *)a3
{
  id v4 = objc_alloc(a1);
  __int128 v5 = a3[5];
  v10[4] = a3[4];
  v10[5] = v5;
  __int128 v6 = a3[7];
  v10[6] = a3[6];
  v10[7] = v6;
  __int128 v7 = a3[1];
  v10[0] = *a3;
  v10[1] = v7;
  __int128 v8 = a3[3];
  v10[2] = a3[2];
  v10[3] = v8;
  return [v4 initWithMatrix4:v10];
}

- (__n128)initWithMatrix4:(uint64_t)a3
{
  v11.receiver = a1;
  v11.super_class = (Class)&OBJC_CLASS___DBGMatrix4;
  id v4 = -[DBGMatrix4 init](&v11, "init");
  if (v4)
  {
    DBGMatrix4 v6 = *(DBGMatrix4 *)a3;
    DBGMatrix4 v7 = *(DBGMatrix4 *)(a3 + 16);
    DBGMatrix4 v8 = *(DBGMatrix4 *)(a3 + 48);
    v4[3] = *(DBGMatrix4 *)(a3 + 32);
    v4[4] = v8;
    v4[1] = v6;
    v4[2] = v7;
    __n128 result = *(__n128 *)(a3 + 64);
    DBGMatrix4 v9 = *(DBGMatrix4 *)(a3 + 80);
    DBGMatrix4 v10 = *(DBGMatrix4 *)(a3 + 112);
    v4[7] = *(DBGMatrix4 *)(a3 + 96);
    v4[8] = v10;
    v4[5] = (DBGMatrix4)result;
    v4[6] = v9;
  }

  return result;
}

- (id)objectValue
{
  return 0LL;
}

- (NSString)description
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[DBGMatrix4 objectValue](self, "objectValue"));
  v3 = (void *)objc_claimAutoreleasedReturnValue([v2 description]);

  return (NSString *)v3;
}

- (NSString)debugDescription
{
  v3 = (objc_class *)objc_opt_class(self, a2);
  id v4 = NSStringFromClass(v3);
  __int128 v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  DBGMatrix4 v6 = (void *)objc_claimAutoreleasedReturnValue(-[DBGMatrix4 description](self, "description"));
  DBGMatrix4 v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"<%@: %p %@>",  v5,  self,  v6));

  return (NSString *)v7;
}

- (void)matrix4
{
}

- (void)setMatrix4:(const void *)a3
{
}

+ (id)valueWithEncodedValue:(id)a3 format:(id)a4 error:(id *)a5
{
  id v87 = 0LL;
  uint64_t v7 = DBGDecodeValueFromJSONCompatibleValue(a3, a4, &v87);
  DBGMatrix4 v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  id v9 = v87;
  DBGMatrix4 v10 = v9;
  if (v9)
  {
    __int128 v11 = *(_OWORD *)matrix_identity_double4x4.columns[0].f64;
    __int128 v12 = *(_OWORD *)&matrix_identity_double4x4.columns[0].f64[2];
    __int128 v13 = *(_OWORD *)matrix_identity_double4x4.columns[1].f64;
    __int128 v14 = *(_OWORD *)&matrix_identity_double4x4.columns[1].f64[2];
    __int128 v15 = *(_OWORD *)matrix_identity_double4x4.columns[2].f64;
    __int128 v16 = *(_OWORD *)&matrix_identity_double4x4.columns[2].f64[2];
    __int128 v17 = *(_OWORD *)matrix_identity_double4x4.columns[3].f64;
    __int128 v18 = *(_OWORD *)&matrix_identity_double4x4.columns[3].f64[2];
    if (a5)
    {
      __int128 v80 = *(_OWORD *)&matrix_identity_double4x4.columns[0].f64[2];
      __int128 v83 = *(_OWORD *)matrix_identity_double4x4.columns[0].f64;
      __int128 v73 = *(_OWORD *)&matrix_identity_double4x4.columns[1].f64[2];
      __int128 v76 = *(_OWORD *)matrix_identity_double4x4.columns[1].f64;
      __int128 v66 = *(_OWORD *)&matrix_identity_double4x4.columns[2].f64[2];
      __int128 v69 = *(_OWORD *)matrix_identity_double4x4.columns[2].f64;
      __int128 v59 = *(_OWORD *)&matrix_identity_double4x4.columns[3].f64[2];
      __int128 v62 = *(_OWORD *)matrix_identity_double4x4.columns[3].f64;
      id v19 = v9;
      __int128 v18 = v59;
      __int128 v17 = v62;
      __int128 v16 = v66;
      __int128 v15 = v69;
      __int128 v14 = v73;
      __int128 v13 = v76;
      __int128 v12 = v80;
      __int128 v11 = v83;
      *a5 = v19;
    }
  }

  else
  {
    v20 = (void *)objc_claimAutoreleasedReturnValue([v8 objectAtIndexedSubscript:0]);
    [v20 doubleValue];
    uint64_t v84 = v21;

    v22 = (void *)objc_claimAutoreleasedReturnValue([v8 objectAtIndexedSubscript:1]);
    [v22 doubleValue];
    uint64_t v77 = v23;

    v24 = (void *)objc_claimAutoreleasedReturnValue([v8 objectAtIndexedSubscript:2]);
    [v24 doubleValue];
    uint64_t v81 = v25;

    v26 = (void *)objc_claimAutoreleasedReturnValue([v8 objectAtIndexedSubscript:3]);
    [v26 doubleValue];
    *(void *)&__int128 v27 = v84;
    *((void *)&v27 + 1) = v77;
    __int128 v85 = v27;
    *(void *)&__int128 v27 = v81;
    *((void *)&v27 + 1) = v28;
    __int128 v82 = v27;

    v29 = (void *)objc_claimAutoreleasedReturnValue([v8 objectAtIndexedSubscript:4]);
    [v29 doubleValue];
    uint64_t v78 = v30;

    v31 = (void *)objc_claimAutoreleasedReturnValue([v8 objectAtIndexedSubscript:5]);
    [v31 doubleValue];
    uint64_t v70 = v32;

    v33 = (void *)objc_claimAutoreleasedReturnValue([v8 objectAtIndexedSubscript:6]);
    [v33 doubleValue];
    uint64_t v74 = v34;

    v35 = (void *)objc_claimAutoreleasedReturnValue([v8 objectAtIndexedSubscript:7]);
    [v35 doubleValue];
    *(void *)&__int128 v36 = v78;
    *((void *)&v36 + 1) = v70;
    __int128 v79 = v36;
    *(void *)&__int128 v36 = v74;
    *((void *)&v36 + 1) = v37;
    __int128 v75 = v36;

    v38 = (void *)objc_claimAutoreleasedReturnValue([v8 objectAtIndexedSubscript:8]);
    [v38 doubleValue];
    uint64_t v71 = v39;

    v40 = (void *)objc_claimAutoreleasedReturnValue([v8 objectAtIndexedSubscript:9]);
    [v40 doubleValue];
    uint64_t v63 = v41;

    v42 = (void *)objc_claimAutoreleasedReturnValue([v8 objectAtIndexedSubscript:10]);
    [v42 doubleValue];
    uint64_t v67 = v43;

    v44 = (void *)objc_claimAutoreleasedReturnValue([v8 objectAtIndexedSubscript:11]);
    [v44 doubleValue];
    *(void *)&__int128 v45 = v71;
    *((void *)&v45 + 1) = v63;
    __int128 v72 = v45;
    *(void *)&__int128 v45 = v67;
    *((void *)&v45 + 1) = v46;
    __int128 v68 = v45;

    v47 = (void *)objc_claimAutoreleasedReturnValue([v8 objectAtIndexedSubscript:12]);
    [v47 doubleValue];
    uint64_t v64 = v48;

    v49 = (void *)objc_claimAutoreleasedReturnValue([v8 objectAtIndexedSubscript:13]);
    [v49 doubleValue];
    __int128 v58 = v50;

    v51 = (void *)objc_claimAutoreleasedReturnValue([v8 objectAtIndexedSubscript:14]);
    [v51 doubleValue];
    uint64_t v60 = v52;

    v53 = (void *)objc_claimAutoreleasedReturnValue([v8 objectAtIndexedSubscript:15]);
    [v53 doubleValue];
    *(void *)&__int128 v54 = v64;
    *((void *)&v54 + 1) = v58;
    __int128 v65 = v54;
    *(void *)&__int128 v54 = v60;
    *((void *)&v54 + 1) = v55;
    __int128 v61 = v54;

    __int128 v18 = v61;
    __int128 v17 = v65;
    __int128 v16 = v68;
    __int128 v15 = v72;
    __int128 v14 = v75;
    __int128 v13 = v79;
    __int128 v12 = v82;
    __int128 v11 = v85;
  }

  v86[0] = v11;
  v86[1] = v12;
  v86[2] = v13;
  v86[3] = v14;
  v86[4] = v15;
  v86[5] = v16;
  v86[6] = v17;
  v86[7] = v18;
  v56 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "withMatrix4:", v86, v58));

  return v56;
}

- (id)JSONCompatibleRepresentation
{
  v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", v36));
  v37[0] = v20;
  -[DBGMatrix4 matrix4](self, "matrix4");
  id v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", v35));
  v37[1] = v19;
  -[DBGMatrix4 matrix4](self, "matrix4");
  __int128 v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", v34));
  v37[2] = v18;
  -[DBGMatrix4 matrix4](self, "matrix4");
  __int128 v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", v33));
  v37[3] = v17;
  -[DBGMatrix4 matrix4](self, "matrix4");
  __int128 v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", v32));
  v37[4] = v16;
  -[DBGMatrix4 matrix4](self, "matrix4");
  __int128 v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", v31));
  v37[5] = v15;
  -[DBGMatrix4 matrix4](self, "matrix4");
  __int128 v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", v30));
  v37[6] = v14;
  -[DBGMatrix4 matrix4](self, "matrix4");
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", v29));
  v37[7] = v3;
  -[DBGMatrix4 matrix4](self, "matrix4");
  id v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", v28));
  v37[8] = v4;
  -[DBGMatrix4 matrix4](self, "matrix4");
  __int128 v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", v27));
  v37[9] = v5;
  -[DBGMatrix4 matrix4](self, "matrix4");
  DBGMatrix4 v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", v26));
  v37[10] = v6;
  -[DBGMatrix4 matrix4](self, "matrix4");
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", v25));
  v37[11] = v7;
  -[DBGMatrix4 matrix4](self, "matrix4");
  DBGMatrix4 v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", v24));
  v37[12] = v8;
  -[DBGMatrix4 matrix4](self, "matrix4");
  id v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", v23));
  v37[13] = v9;
  -[DBGMatrix4 matrix4](self, "matrix4");
  DBGMatrix4 v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", v22));
  v37[14] = v10;
  -[DBGMatrix4 matrix4](self, "matrix4");
  __int128 v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", v21));
  v37[15] = v11;
  __int128 v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v37, 16LL));

  return v12;
}

@end