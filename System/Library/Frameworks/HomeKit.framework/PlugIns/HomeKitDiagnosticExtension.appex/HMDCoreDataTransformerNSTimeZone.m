@interface HMDCoreDataTransformerNSTimeZone
+ (Class)transformedValueClass;
@end

@implementation HMDCoreDataTransformerNSTimeZone

+ (Class)transformedValueClass
{
  return (Class)objc_opt_class(&OBJC_CLASS___NSTimeZone, a2);
}

@end