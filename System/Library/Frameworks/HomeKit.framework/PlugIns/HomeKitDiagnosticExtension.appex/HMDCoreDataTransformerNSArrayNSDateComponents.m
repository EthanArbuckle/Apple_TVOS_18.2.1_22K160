@interface HMDCoreDataTransformerNSArrayNSDateComponents
+ (id)allowedTopLevelClasses;
@end

@implementation HMDCoreDataTransformerNSArrayNSDateComponents

+ (id)allowedTopLevelClasses
{
  v4[0] = objc_opt_class(&OBJC_CLASS___NSArray, a2);
  v4[1] = objc_opt_class(&OBJC_CLASS___NSDateComponents, v2);
  return (id)objc_claimAutoreleasedReturnValue( +[NSArray arrayWithObjects:count:]( &OBJC_CLASS___NSArray,  "arrayWithObjects:count:",  v4,  2LL));
}

@end