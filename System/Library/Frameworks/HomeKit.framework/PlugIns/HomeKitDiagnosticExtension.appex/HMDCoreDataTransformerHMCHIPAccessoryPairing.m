@interface HMDCoreDataTransformerHMCHIPAccessoryPairing
+ (id)allowedTopLevelClasses;
@end

@implementation HMDCoreDataTransformerHMCHIPAccessoryPairing

+ (id)allowedTopLevelClasses
{
  v4[0] = objc_opt_class(&OBJC_CLASS___NSSet, a2);
  v4[1] = objc_opt_class(&OBJC_CLASS___HMCHIPAccessoryPairing, v2);
  return (id)objc_claimAutoreleasedReturnValue( +[NSArray arrayWithObjects:count:]( &OBJC_CLASS___NSArray,  "arrayWithObjects:count:",  v4,  2LL));
}

@end