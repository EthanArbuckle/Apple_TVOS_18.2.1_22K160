@interface SKANTokenEntity
+ (Class)memoryEntityClass;
+ (id)databaseTable;
+ (id)defaultProperties;
@end

@implementation SKANTokenEntity

+ (id)databaseTable
{
  return @"skan_tokens";
}

+ (Class)memoryEntityClass
{
  return (Class)objc_opt_class(&OBJC_CLASS___SKANToken, a2);
}

+ (id)defaultProperties
{
  v3[0] = @"app_adam_id";
  v3[1] = @"blinded_element";
  v3[2] = @"private_input";
  v3[3] = @"finalized_token";
  v3[4] = @"certificate";
  v3[5] = @"is_redownload";
  v3[6] = @"timestamp";
  return (id)objc_claimAutoreleasedReturnValue( +[NSArray arrayWithObjects:count:]( &OBJC_CLASS___NSArray,  "arrayWithObjects:count:",  v3,  7LL));
}

@end