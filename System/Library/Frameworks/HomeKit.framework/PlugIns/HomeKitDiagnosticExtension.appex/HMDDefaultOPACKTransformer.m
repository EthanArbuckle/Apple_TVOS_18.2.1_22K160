@interface HMDDefaultOPACKTransformer
+ (Class)valueClass;
+ (id)OPACKFromValue:(id)a3 error:(id *)a4;
+ (id)description;
+ (id)valueFromOPACK:(id)a3 error:(id *)a4;
@end

@implementation HMDDefaultOPACKTransformer

+ (id)description
{
  return objc_msgSend((id)objc_opt_class(HMDOPACKTransformer, a2), "description");
}

+ (Class)valueClass
{
  return (Class)objc_opt_class(&OBJC_CLASS___NSObject, a2);
}

+ (id)OPACKFromValue:(id)a3 error:(id *)a4
{
  return a3;
}

+ (id)valueFromOPACK:(id)a3 error:(id *)a4
{
  return a3;
}

@end