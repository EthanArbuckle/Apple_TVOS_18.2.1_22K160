@interface ODRAssetPack
+ (Class)databaseEntityClass;
+ (id)defaultProperties;
- (id)description;
@end

@implementation ODRAssetPack

+ (Class)databaseEntityClass
{
  return (Class)objc_opt_class(&OBJC_CLASS___ODRAssetPackEntity, a2);
}

+ (id)defaultProperties
{
  v3[0] = @"bundle_key";
  v3[1] = @"bundle_id";
  v3[2] = @"chunk_size";
  v3[3] = @"download_identifier";
  v3[4] = @"download_priority";
  v3[5] = @"download_request_uuids";
  v3[6] = @"effective_always_preserve";
  v3[7] = @"effective_preservation_priority";
  v3[8] = @"file_size";
  v3[9] = @"hash_array";
  v3[10] = @"known_content_hashes";
  v3[11] = @"last_used_date";
  v3[12] = @"local_url";
  v3[13] = @"md5";
  v3[14] = @"pin_count";
  v3[15] = @"primary_content_hash";
  v3[16] = @"purgeable";
  v3[17] = @"purge_reason";
  v3[18] = @"sha";
  v3[19] = @"streamable";
  v3[20] = @"source_url";
  v3[21] = @"uncompressed_size";
  return (id)objc_claimAutoreleasedReturnValue( +[NSArray arrayWithObjects:count:]( &OBJC_CLASS___NSArray,  "arrayWithObjects:count:",  v3,  22LL));
}

- (id)description
{
  id v3 = sub_1001F7970(self);
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  id v5 = sub_1001F794C(self);
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Bundle Key: %@ Bundle ID: %@",  v4,  v6));

  return v7;
}

@end