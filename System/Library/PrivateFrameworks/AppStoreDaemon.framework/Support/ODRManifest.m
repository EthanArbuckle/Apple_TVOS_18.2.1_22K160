@interface ODRManifest
+ (Class)databaseEntityClass;
+ (id)defaultProperties;
@end

@implementation ODRManifest

+ (Class)databaseEntityClass
{
  return (Class)objc_opt_class(&OBJC_CLASS___ODRManifestEntity, a2);
}

+ (id)defaultProperties
{
  v3[0] = @"bundle_id";
  v3[1] = @"evid";
  v3[2] = @"is_store_based";
  v3[3] = @"item_id";
  v3[4] = @"last_modification_date";
  v3[5] = @"local_cache_allowed";
  v3[6] = @"thinning_variant";
  v3[7] = @"storage_id";
  v3[8] = @"version";
  return (id)objc_claimAutoreleasedReturnValue( +[NSArray arrayWithObjects:count:]( &OBJC_CLASS___NSArray,  "arrayWithObjects:count:",  v3,  9LL));
}

- (void).cxx_destruct
{
}

@end