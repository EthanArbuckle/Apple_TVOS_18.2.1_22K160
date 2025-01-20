@interface HMDCoreDataTransformerNSDateComponents
+ (Class)transformedValueClass;
@end

@implementation HMDCoreDataTransformerNSDateComponents

+ (Class)transformedValueClass
{
  return (Class)objc_opt_class(&OBJC_CLASS___NSDateComponents, a2);
}

@end