@interface HMDHomeKitVersionStringDataTransformer
+ (Class)transformedValueClass;
+ (Class)valueClass;
+ (id)reverseTransformedValue:(id)a3 error:(id *)a4;
+ (id)transformedValue:(id)a3 error:(id *)a4;
@end

@implementation HMDHomeKitVersionStringDataTransformer

+ (Class)valueClass
{
  return (Class)objc_opt_class(&OBJC_CLASS___HMDHomeKitVersion, a2);
}

+ (Class)transformedValueClass
{
  return (Class)objc_opt_class(&OBJC_CLASS___NSData, a2);
}

+ (id)transformedValue:(id)a3 error:(id *)a4
{
  v4 = (void *)objc_claimAutoreleasedReturnValue([a3 versionString]);
  v5 = (void *)objc_claimAutoreleasedReturnValue([v4 dataUsingEncoding:4]);

  return v5;
}

+ (id)reverseTransformedValue:(id)a3 error:(id *)a4
{
  id v5 = a3;
  v6 = -[NSString initWithData:encoding:](objc_alloc(&OBJC_CLASS___NSString), "initWithData:encoding:", v5, 4LL);
  if (v6)
  {
    v7 = -[HMDHomeKitVersion initWithVersionString:]( objc_alloc(&OBJC_CLASS___HMDHomeKitVersion),  "initWithVersionString:",  v6);
    if (v7)
    {
      v8 = v7;
      v9 = v8;
    }

    else
    {
      if (a4)
      {
        v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"String isn't valid as HMDHomeKitVersion: %@",  v6));
        *a4 = (id)objc_claimAutoreleasedReturnValue( +[NSError hmfErrorWithCode:reason:]( &OBJC_CLASS___NSError,  "hmfErrorWithCode:reason:",  3LL,  v10));
      }

      v8 = 0LL;
      v9 = 0LL;
    }
  }

  else
  {
    if (!a4)
    {
      v9 = 0LL;
      goto LABEL_10;
    }

    v8 = (HMDHomeKitVersion *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Data is not UTF8: %@",  v5));
    v9 = 0LL;
    *a4 = (id)objc_claimAutoreleasedReturnValue( +[NSError hmfErrorWithCode:reason:]( &OBJC_CLASS___NSError,  "hmfErrorWithCode:reason:",  3LL,  v8));
  }

LABEL_10:
  return v9;
}

@end