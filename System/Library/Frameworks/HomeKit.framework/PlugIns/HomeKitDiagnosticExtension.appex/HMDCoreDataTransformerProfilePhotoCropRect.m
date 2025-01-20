@interface HMDCoreDataTransformerProfilePhotoCropRect
+ (Class)valueClass;
+ (id)OPACKFromValue:(id)a3 error:(id *)a4;
+ (id)valueFromOPACK:(id)a3 error:(id *)a4;
@end

@implementation HMDCoreDataTransformerProfilePhotoCropRect

+ (id)OPACKFromValue:(id)a3 error:(id *)a4
{
  id v5 = a3;
  v6 = v5;
  if (v5)
  {
    [v5 rectValue];
    double v8 = v7;
    double v10 = v9;
    double v12 = v11;
    v24[0] = @"x";
    *(float *)&double v13 = v13;
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](&OBJC_CLASS___NSNumber, "numberWithFloat:", v13));
    v25[0] = v14;
    v24[1] = @"y";
    *(float *)&double v15 = v8;
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](&OBJC_CLASS___NSNumber, "numberWithFloat:", v15));
    v25[1] = v16;
    v24[2] = @"w";
    *(float *)&double v17 = v10;
    v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](&OBJC_CLASS___NSNumber, "numberWithFloat:", v17));
    v25[2] = v18;
    v24[3] = @"h";
    *(float *)&double v19 = v12;
    v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](&OBJC_CLASS___NSNumber, "numberWithFloat:", v19));
    v25[3] = v20;
    v21 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v25,  v24,  4LL));
  }

  else
  {
    if (a4)
    {
      v22 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Invalid crop rect value: %@",  0LL));
      *a4 = (id)objc_claimAutoreleasedReturnValue( +[NSError hmfErrorWithCode:reason:]( &OBJC_CLASS___NSError,  "hmfErrorWithCode:reason:",  3LL,  v22));
    }

    v21 = 0LL;
  }

  return v21;
}

+ (id)valueFromOPACK:(id)a3 error:(id *)a4
{
  id v5 = a3;
  uint64_t v7 = objc_opt_class(&OBJC_CLASS___NSDictionary, v6);
  if ((objc_opt_isKindOfClass(v5, v7) & 1) != 0) {
    double v8 = v5;
  }
  else {
    double v8 = 0LL;
  }
  id v9 = v8;
  double v10 = v9;
  if (v9)
  {
    double v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "hmf_numberForKey:", @"x"));
    [v11 floatValue];
    double v13 = v12;
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "hmf_numberForKey:", @"y"));
    [v14 floatValue];
    double v16 = v15;
    double v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "hmf_numberForKey:", @"w"));
    [v17 floatValue];
    double v19 = v18;
    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "hmf_numberForKey:", @"h"));
    [v20 floatValue];
    double v22 = v21;

    a4 = (id *)objc_claimAutoreleasedReturnValue(+[NSValue valueWithRect:](&OBJC_CLASS___NSValue, "valueWithRect:", v13, v16, v19, v22));
  }

  else if (a4)
  {
    v23 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Expected NSDictionary value to create crop rect value: %@",  v5));
    *a4 = (id)objc_claimAutoreleasedReturnValue( +[NSError hmfErrorWithCode:reason:]( &OBJC_CLASS___NSError,  "hmfErrorWithCode:reason:",  3LL,  v23));

    a4 = 0LL;
  }

  return a4;
}

+ (Class)valueClass
{
  return (Class)objc_opt_class(&OBJC_CLASS___NSValue, a2);
}

@end