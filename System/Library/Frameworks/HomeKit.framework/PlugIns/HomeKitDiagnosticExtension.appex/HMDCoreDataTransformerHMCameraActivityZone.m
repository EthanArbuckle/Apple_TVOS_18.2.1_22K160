@interface HMDCoreDataTransformerHMCameraActivityZone
+ (Class)valueClass;
+ (id)OPACKFromValue:(id)a3 error:(id *)a4;
+ (id)valueFromOPACK:(id)a3 error:(id *)a4;
@end

@implementation HMDCoreDataTransformerHMCameraActivityZone

+ (id)OPACKFromValue:(id)a3 error:(id *)a4
{
  id v4 = a3;
  v5 = objc_alloc(&OBJC_CLASS___NSMutableArray);
  v6 = (void *)objc_claimAutoreleasedReturnValue([v4 points]);
  v7 = -[NSMutableArray initWithCapacity:](v5, "initWithCapacity:", 2 * (void)[v6 count]);

  v8 = (void *)objc_claimAutoreleasedReturnValue([v4 points]);
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472LL;
  v12[2] = sub_100010CD4;
  v12[3] = &unk_100028A48;
  v13 = v7;
  v9 = v7;
  objc_msgSend(v8, "hmf_enumerateWithAutoreleasePoolUsingBlock:", v12);

  id v10 = -[NSMutableArray copy](v9, "copy");
  return v10;
}

+ (id)valueFromOPACK:(id)a3 error:(id *)a4
{
  id v5 = a3;
  uint64_t v6 = objc_opt_class(&OBJC_CLASS___NSArray);
  if ((objc_opt_isKindOfClass(v5, v6) & 1) != 0) {
    v7 = v5;
  }
  else {
    v7 = 0LL;
  }
  id v8 = v7;
  v9 = v8;
  if (!v8)
  {
    if (a4)
    {
      id v10 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Expected NSArray value to create HMCameraActivityZone: %@",  v5);
      goto LABEL_17;
    }

+ (Class)valueClass
{
  return (Class)objc_opt_class(&OBJC_CLASS___HMCameraActivityZone, a2);
}

@end