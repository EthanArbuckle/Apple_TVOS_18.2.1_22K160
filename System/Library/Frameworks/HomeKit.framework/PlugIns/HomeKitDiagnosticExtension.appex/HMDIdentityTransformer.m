@interface HMDIdentityTransformer
+ (Class)transformedValueClass;
+ (Class)valueClass;
+ (id)reverseTransformedValue:(id)a3 error:(id *)a4;
+ (id)transformedValue:(id)a3 error:(id *)a4;
- (id)reverseTransformedValue:(id)a3 error:(id *)a4;
- (id)transformedValue:(id)a3 error:(id *)a4;
@end

@implementation HMDIdentityTransformer

+ (Class)valueClass
{
  return (Class)objc_opt_class(&OBJC_CLASS___NSObject, a2);
}

+ (Class)transformedValueClass
{
  return (Class)objc_opt_class(&OBJC_CLASS___NSObject, a2);
}

+ (id)transformedValue:(id)a3 error:(id *)a4
{
  return a3;
}

+ (id)reverseTransformedValue:(id)a3 error:(id *)a4
{
  return a3;
}

- (id)transformedValue:(id)a3 error:(id *)a4
{
  return a3;
}

- (id)reverseTransformedValue:(id)a3 error:(id *)a4
{
  return a3;
}

@end