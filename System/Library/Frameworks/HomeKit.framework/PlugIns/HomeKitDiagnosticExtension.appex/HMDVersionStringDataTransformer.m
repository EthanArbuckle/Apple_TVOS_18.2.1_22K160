@interface HMDVersionStringDataTransformer
+ (Class)transformedValueClass;
+ (Class)valueClass;
+ (id)reverseTransformedValue:(id)a3 error:(id *)a4;
+ (id)transformedValue:(id)a3 error:(id *)a4;
@end

@implementation HMDVersionStringDataTransformer

+ (Class)valueClass
{
  return (Class)objc_opt_class(&OBJC_CLASS___HMFVersion, a2);
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
  id v4 = a3;
  v5 = -[NSString initWithData:encoding:](objc_alloc(&OBJC_CLASS___NSString), "initWithData:encoding:", v4, 4LL);

  if (v5) {
    v6 = -[HMFVersion initWithVersionString:](objc_alloc(&OBJC_CLASS___HMFVersion), "initWithVersionString:", v5);
  }
  else {
    v6 = 0LL;
  }

  return v6;
}

@end