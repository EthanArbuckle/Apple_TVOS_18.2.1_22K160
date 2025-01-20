@interface AppMetadataEntity
+ (Class)memoryEntityClass;
+ (id)databaseTable;
+ (id)defaultProperties;
@end

@implementation AppMetadataEntity

+ (id)databaseTable
{
  return @"current_apps";
}

+ (id)defaultProperties
{
  v3[0] = @"app_platform";
  v3[1] = @"bundle_id";
  v3[2] = @"bundle_version";
  v3[3] = @"cohort";
  v3[4] = @"device_vendor_id";
  v3[5] = @"evid";
  v3[6] = @"is_arcade";
  v3[7] = @"is_beta";
  v3[8] = @"is_clip";
  v3[9] = @"is_prior";
  v3[10] = @"is_system_app";
  v3[11] = @"item_id";
  v3[12] = @"item_name";
  v3[13] = @"short_version";
  v3[14] = @"storefront";
  v3[15] = @"timestamp";
  v3[16] = @"vendor_name";
  return (id)objc_claimAutoreleasedReturnValue( +[NSArray arrayWithObjects:count:]( &OBJC_CLASS___NSArray,  "arrayWithObjects:count:",  v3,  17LL));
}

+ (Class)memoryEntityClass
{
  return (Class)objc_opt_class(&OBJC_CLASS___AppMetadata, a2);
}

@end