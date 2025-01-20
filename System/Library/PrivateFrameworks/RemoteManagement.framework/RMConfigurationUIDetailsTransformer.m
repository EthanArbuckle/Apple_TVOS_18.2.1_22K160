@interface RMConfigurationUIDetailsTransformer
+ (id)allowedTopLevelClasses;
@end

@implementation RMConfigurationUIDetailsTransformer

+ (id)allowedTopLevelClasses
{
  uint64_t v3 = objc_opt_class(&OBJC_CLASS___RMConfigurationUIDetails);
  return (id)objc_claimAutoreleasedReturnValue( +[NSArray arrayWithObjects:count:]( &OBJC_CLASS___NSArray,  "arrayWithObjects:count:",  &v3,  1LL));
}

@end