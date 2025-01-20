@interface HMDCKRecordIDCanonicalStringTransformer
+ (Class)transformedValueClass;
+ (Class)valueClass;
+ (id)reverseTransformedValue:(id)a3 error:(id *)a4;
+ (id)transformedValue:(id)a3 error:(id *)a4;
@end

@implementation HMDCKRecordIDCanonicalStringTransformer

+ (Class)valueClass
{
  return (Class)objc_opt_class(&OBJC_CLASS___CKRecordID, a2);
}

+ (Class)transformedValueClass
{
  return (Class)objc_opt_class(&OBJC_CLASS___NSString, a2);
}

+ (id)transformedValue:(id)a3 error:(id *)a4
{
  return objc_msgSend(a3, "hmd_canonicalStringRepresentation");
}

+ (id)reverseTransformedValue:(id)a3 error:(id *)a4
{
  id v4 = a3;
  v5 = objc_alloc(&OBJC_CLASS___CKRecordID);
  id v6 = -[CKRecordID hmd_initWithCanonicalStringRepresentation:](v5, "hmd_initWithCanonicalStringRepresentation:", v4);

  return v6;
}

@end