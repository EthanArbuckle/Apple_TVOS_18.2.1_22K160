@interface BetaAppFeedbackMetadataMemoryEntity
+ (Class)databaseEntityClass;
+ (id)defaultProperties;
@end

@implementation BetaAppFeedbackMetadataMemoryEntity

+ (Class)databaseEntityClass
{
  return (Class)objc_opt_class(&OBJC_CLASS___BetaAppInfoEntity, a2);
}

+ (id)defaultProperties
{
  v3[0] = @"bundle_id";
  v3[1] = @"bundle_version";
  v3[2] = @"email";
  v3[3] = @"platform";
  v3[4] = @"bundle_short_version";
  return (id)objc_claimAutoreleasedReturnValue( +[NSArray arrayWithObjects:count:]( &OBJC_CLASS___NSArray,  "arrayWithObjects:count:",  v3,  5LL));
}

@end