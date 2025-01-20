@interface HMDCoreDataTransformerCLRegion
+ (id)allowedTopLevelClasses;
@end

@implementation HMDCoreDataTransformerCLRegion

+ (id)allowedTopLevelClasses
{
  uint64_t v3 = objc_opt_class(&OBJC_CLASS___CLRegion, a2);
  return (id)objc_claimAutoreleasedReturnValue( +[NSArray arrayWithObjects:count:]( &OBJC_CLASS___NSArray,  "arrayWithObjects:count:",  &v3,  1LL));
}

@end