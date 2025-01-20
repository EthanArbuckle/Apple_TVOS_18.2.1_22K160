@interface HMDSoftwareVersionStringTransformer
+ (Class)transformedValueClass;
+ (Class)valueClass;
+ (id)reverseTransformedValue:(id)a3 error:(id *)a4;
+ (id)transformedValue:(id)a3 error:(id *)a4;
@end

@implementation HMDSoftwareVersionStringTransformer

+ (Class)valueClass
{
  return (Class)objc_opt_class(&OBJC_CLASS___HMFSoftwareVersion, a2);
}

+ (Class)transformedValueClass
{
  return (Class)objc_opt_class(&OBJC_CLASS___NSString, a2);
}

+ (id)transformedValue:(id)a3 error:(id *)a4
{
  return [a3 versionString];
}

+ (id)reverseTransformedValue:(id)a3 error:(id *)a4
{
  id v4 = a3;
  id v5 = [[HMFSoftwareVersion alloc] initWithVersionString:v4];

  return v5;
}

@end