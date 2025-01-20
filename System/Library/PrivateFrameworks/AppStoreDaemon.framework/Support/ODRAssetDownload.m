@interface ODRAssetDownload
+ (Class)databaseEntityClass;
+ (id)defaultProperties;
@end

@implementation ODRAssetDownload

+ (Class)databaseEntityClass
{
  return (Class)objc_opt_class(&OBJC_CLASS___ODRAssetDownloadEntity, a2);
}

+ (id)defaultProperties
{
  v3[0] = @"bundle_id";
  v3[1] = @"bundle_key";
  v3[2] = @"coordinator_id";
  v3[3] = @"is_paused";
  v3[4] = @"source_url";
  v3[5] = @"type";
  v3[6] = @"unique_key";
  return (id)objc_claimAutoreleasedReturnValue( +[NSArray arrayWithObjects:count:]( &OBJC_CLASS___NSArray,  "arrayWithObjects:count:",  v3,  7LL));
}

@end