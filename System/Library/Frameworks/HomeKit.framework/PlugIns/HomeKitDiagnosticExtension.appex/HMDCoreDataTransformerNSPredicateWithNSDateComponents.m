@interface HMDCoreDataTransformerNSPredicateWithNSDateComponents
+ (id)allowedTopLevelClasses;
@end

@implementation HMDCoreDataTransformerNSPredicateWithNSDateComponents

+ (id)allowedTopLevelClasses
{
  v4[0] = objc_opt_class(&OBJC_CLASS___NSDateComponents, a2);
  v4[1] = objc_opt_class(&OBJC_CLASS___NSPredicate, v2);
  return (id)objc_claimAutoreleasedReturnValue( +[NSArray arrayWithObjects:count:]( &OBJC_CLASS___NSArray,  "arrayWithObjects:count:",  v4,  2LL));
}

@end