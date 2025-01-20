@interface HMDHomeKitVersionStringTransformer
+ (Class)transformedValueClass;
+ (Class)valueClass;
+ (id)reverseTransformedValue:(id)a3 error:(id *)a4;
+ (id)transformedValue:(id)a3 error:(id *)a4;
@end

@implementation HMDHomeKitVersionStringTransformer

+ (Class)valueClass
{
  return (Class)objc_opt_class(&OBJC_CLASS___HMDHomeKitVersion, a2);
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
  v5 = -[HMDHomeKitVersion initWithVersionString:]( objc_alloc(&OBJC_CLASS___HMDHomeKitVersion),  "initWithVersionString:",  v4);

  return v5;
}

@end