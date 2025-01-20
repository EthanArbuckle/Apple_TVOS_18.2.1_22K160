@interface HMDCoreDataTransformerHMCameraActivityZoneSet
+ (Class)valueClass;
+ (id)OPACKFromValue:(id)a3 error:(id *)a4;
+ (id)valueFromOPACK:(id)a3 error:(id *)a4;
@end

@implementation HMDCoreDataTransformerHMCameraActivityZoneSet

+ (id)OPACKFromValue:(id)a3 error:(id *)a4
{
  id v5 = a3;
  uint64_t v16 = 0LL;
  v17 = &v16;
  uint64_t v18 = 0x3032000000LL;
  v19 = sub_100011088;
  v20 = sub_100011098;
  id v21 = 0LL;
  v10 = _NSConcreteStackBlock;
  uint64_t v11 = 3221225472LL;
  v12 = sub_1000111A0;
  v13 = &unk_100028A70;
  v15 = &v16;
  id v6 = (id)objc_claimAutoreleasedReturnValue( +[NSMutableArray arrayWithCapacity:]( NSMutableArray,  "arrayWithCapacity:",  [v5 count]));
  id v14 = v6;
  objc_msgSend(v5, "hmf_enumerateWithAutoreleasePoolUsingBlock:", &v10);
  v7 = (void *)v17[5];
  if (v7)
  {
    id v8 = 0LL;
    if (a4) {
      *a4 = v7;
    }
  }

  else
  {
    id v8 = objc_msgSend(v6, "copy", v10, v11, v12, v13);
  }

  _Block_object_dispose(&v16, 8);
  return v8;
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

  if (v8)
  {
    uint64_t v17 = 0LL;
    uint64_t v18 = &v17;
    uint64_t v19 = 0x3032000000LL;
    v20 = sub_100011088;
    id v21 = sub_100011098;
    id v22 = 0LL;
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472LL;
    v14[2] = sub_1000110A0;
    v14[3] = &unk_100028A98;
    uint64_t v16 = &v17;
    id v9 = (id)objc_claimAutoreleasedReturnValue( +[NSMutableSet setWithCapacity:]( NSMutableSet,  "setWithCapacity:",  [v8 count]));
    id v15 = v9;
    objc_msgSend(v8, "hmf_enumerateWithAutoreleasePoolUsingBlock:", v14);
    v10 = (void *)v18[5];
    if (v10)
    {
      id v11 = 0LL;
      if (a4) {
        *a4 = v10;
      }
    }

    else
    {
      id v11 = [v9 copy];
    }

    _Block_object_dispose(&v17, 8);
  }

  else
  {
    if (a4)
    {
      v12 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Expected NSArray value to create NSSet<HMCameraActivityZone>: %@",  v5));
      *a4 = (id)objc_claimAutoreleasedReturnValue( +[NSError hmfErrorWithCode:reason:]( &OBJC_CLASS___NSError,  "hmfErrorWithCode:reason:",  3LL,  v12));
    }

    id v11 = 0LL;
  }

  return v11;
}

+ (Class)valueClass
{
  return (Class)objc_opt_class(&OBJC_CLASS___NSSet, a2);
}

@end