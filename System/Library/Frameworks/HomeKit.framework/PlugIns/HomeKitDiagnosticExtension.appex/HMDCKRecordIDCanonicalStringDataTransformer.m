@interface HMDCKRecordIDCanonicalStringDataTransformer
+ (Class)transformedValueClass;
+ (Class)valueClass;
+ (id)reverseTransformedValue:(id)a3 error:(id *)a4;
+ (id)transformedValue:(id)a3 error:(id *)a4;
@end

@implementation HMDCKRecordIDCanonicalStringDataTransformer

+ (Class)valueClass
{
  return (Class)objc_opt_class(&OBJC_CLASS___CKRecordID, a2);
}

+ (Class)transformedValueClass
{
  return (Class)objc_opt_class(&OBJC_CLASS___NSData, a2);
}

+ (id)transformedValue:(id)a3 error:(id *)a4
{
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "hmd_canonicalStringRepresentation"));
  v5 = (void *)objc_claimAutoreleasedReturnValue([v4 dataUsingEncoding:1]);

  return v5;
}

+ (id)reverseTransformedValue:(id)a3 error:(id *)a4
{
  id v4 = a3;
  v5 = -[NSString initWithData:encoding:](objc_alloc(&OBJC_CLASS___NSString), "initWithData:encoding:", v4, 1LL);

  if (v5)
  {
    v6 = objc_alloc(&OBJC_CLASS___CKRecordID);
    id v7 = -[CKRecordID hmd_initWithCanonicalStringRepresentation:](v6, "hmd_initWithCanonicalStringRepresentation:", v5);
  }

  else
  {
    id v7 = 0LL;
  }

  return v7;
}

@end