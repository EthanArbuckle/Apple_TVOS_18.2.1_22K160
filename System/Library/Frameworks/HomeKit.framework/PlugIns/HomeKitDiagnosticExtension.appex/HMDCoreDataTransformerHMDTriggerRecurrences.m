@interface HMDCoreDataTransformerHMDTriggerRecurrences
+ (id)allowedTopLevelClasses;
- (id)reverseTransformedValue:(id)a3;
- (id)transformedValue:(id)a3;
@end

@implementation HMDCoreDataTransformerHMDTriggerRecurrences

- (id)transformedValue:(id)a3
{
  id v5 = a3;
  if (v5)
  {
    uint64_t v6 = objc_opt_class(&OBJC_CLASS___NSData, v4);
    if ((objc_opt_isKindOfClass(v5, v6) & 1) == 0) {
      _HMFPreconditionFailure(@"[value isKindOfClass:NSData.class]", v7);
    }
    v23.receiver = self;
    v23.super_class = (Class)&OBJC_CLASS___HMDCoreDataTransformerHMDTriggerRecurrences;
    id v8 = -[HMDSecureUnarchiveFromDataTransformer transformedValue:](&v23, "transformedValue:", v5);
    id v9 = (id)objc_claimAutoreleasedReturnValue(v8);
    __int128 v24 = 0u;
    __int128 v25 = 0u;
    __int128 v26 = 0u;
    __int128 v27 = 0u;
    id v10 = [v9 countByEnumeratingWithState:&v24 objects:v28 count:16];
    if (v10)
    {
      id v11 = v10;
      uint64_t v12 = 0LL;
      uint64_t v13 = *(void *)v25;
      do
      {
        for (i = 0LL; i != v11; i = (char *)i + 1)
        {
          if (*(void *)v25 != v13) {
            objc_enumerationMutation(v9);
          }
          v15 = *(void **)(*((void *)&v24 + 1) + 8LL * (void)i);
          v16 = (void *)objc_claimAutoreleasedReturnValue([v15 calendar]);
          v17 = v16;
          if (!v16 || ([v16 maximumRangeOfUnit:512] == (id)1 ? (BOOL v19 = v18 == 7) : (BOOL v19 = 0), v19))
          {
            v20 = (char *)[v15 weekday];
          }
        }

        id v11 = [v9 countByEnumeratingWithState:&v24 objects:v28 count:16];
      }

      while (v11);
    }

    else
    {
      uint64_t v12 = 0LL;
    }

    v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInteger:", v12));
  }

  else
  {
    v21 = 0LL;
  }

  return v21;
}

- (id)reverseTransformedValue:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (!v4)
  {
    v20 = 0LL;
LABEL_15:

    return v20;
  }

  id v6 = v4;
  uint64_t v8 = objc_opt_class(&OBJC_CLASS___NSNumber, v7);
  int v9 = objc_opt_isKindOfClass(v6, v8) & 1;
  if (v9) {
    id v10 = v6;
  }
  else {
    id v10 = 0LL;
  }
  id v11 = v10;

  if (v9)
  {
    id v13 = [v6 unsignedIntegerValue];
    if (v13)
    {
      int v14 = (int)v13;
      v15 = -[NSMutableArray initWithCapacity:](objc_alloc(&OBJC_CLASS___NSMutableArray), "initWithCapacity:", 7LL);
      for (uint64_t i = 1LL; i != 8; ++i)
      {
        if ((v14 & (1 << (i - 1))) != 0)
        {
          v17 = objc_alloc_init(&OBJC_CLASS___NSDateComponents);
          -[NSDateComponents setWeekday:](v17, "setWeekday:", i);
          -[NSMutableArray addObject:](v15, "addObject:", v17);
        }
      }

      id v18 = -[NSMutableArray copy](v15, "copy");

      v24.receiver = self;
      v24.super_class = (Class)&OBJC_CLASS___HMDCoreDataTransformerHMDTriggerRecurrences;
      id v19 = -[HMDCoreDataTransformerHMDTriggerRecurrences reverseTransformedValue:]( &v24,  "reverseTransformedValue:",  v18);
      v20 = (void *)objc_claimAutoreleasedReturnValue(v19);
    }

    else
    {
      v20 = 0LL;
    }

    goto LABEL_15;
  }

  v22 = (void *)_HMFPreconditionFailure(@"daysOfTheWeekNumber", v12);
  return +[HMDCoreDataTransformerHMDTriggerRecurrences allowedTopLevelClasses](v22, v23);
}

+ (id)allowedTopLevelClasses
{
  v4[0] = objc_opt_class(&OBJC_CLASS___NSArray, a2);
  v4[1] = objc_opt_class(&OBJC_CLASS___NSDateComponents, v2);
  return (id)objc_claimAutoreleasedReturnValue( +[NSArray arrayWithObjects:count:]( &OBJC_CLASS___NSArray,  "arrayWithObjects:count:",  v4,  2LL));
}

@end