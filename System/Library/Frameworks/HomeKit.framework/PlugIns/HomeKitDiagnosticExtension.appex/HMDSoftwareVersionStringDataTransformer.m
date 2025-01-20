@interface HMDSoftwareVersionStringDataTransformer
+ (Class)transformedValueClass;
+ (Class)valueClass;
+ (id)reverseTransformedValue:(id)a3 error:(id *)a4;
+ (id)transformedValue:(id)a3 error:(id *)a4;
@end

@implementation HMDSoftwareVersionStringDataTransformer

+ (Class)valueClass
{
  return (Class)objc_opt_class(&OBJC_CLASS___HMFSoftwareVersion, a2);
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
    id v6 = [[HMFSoftwareVersion alloc] initWithVersionString:v5];
  }
  else {
    id v6 = 0LL;
  }

  return v6;
}

@end