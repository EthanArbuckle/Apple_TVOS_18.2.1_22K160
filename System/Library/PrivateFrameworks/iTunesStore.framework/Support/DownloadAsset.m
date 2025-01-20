@interface DownloadAsset
+ (Class)databaseEntityClass;
- (DownloadAsset)initWithClientXPCAsset:(id)a3;
- (DownloadAsset)initWithExternalManifestDictionary:(id)a3 validateVariants:(BOOL)a4;
- (DownloadAsset)initWithURLRequestProperties:(id)a3;
- (id)copyJobAsset;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
@end

@implementation DownloadAsset

- (id)copyJobAsset
{
  id v3 = objc_alloc_init((Class)ISWeakLinkedClassForString(@"ASDJobAsset", 29LL));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[DownloadAsset valueForProperty:](self, "valueForProperty:", @"asset_type"));
  [v3 setAssetType:v4];

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[DownloadAsset valueForProperty:](self, "valueForProperty:", @"url"));
  [v3 setAssetURL:v5];

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[DownloadAsset valueForProperty:](self, "valueForProperty:", @"bytes_total"));
  [v3 setBytesTotal:v6];

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[DownloadAsset valueForProperty:](self, "valueForProperty:", @"uncompressed_size"));
  [v3 setExpectedDiskspace:v7];

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[DownloadAsset valueForProperty:](self, "valueForProperty:", @"hash_array"));
  [v3 setHashArrayData:v8];

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[DownloadAsset valueForProperty:](self, "valueForProperty:", @"hash_type"));
  [v3 setHashType:v9];

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[DownloadAsset valueForProperty:](self, "valueForProperty:", @"bytes_to_hash"));
  [v3 setNumberOfBytesToHash:v10];

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[DownloadAsset valueForProperty:](self, "valueForProperty:", @"sinfs_data"));
  [v3 setSinfs:v11];

  v12 = (void *)objc_claimAutoreleasedReturnValue(-[DownloadAsset valueForProperty:](self, "valueForProperty:", @"store_download_key"));
  [v3 setStoreDownloadKey:v12];

  v13 = (void *)objc_claimAutoreleasedReturnValue(-[DownloadAsset valueForProperty:](self, "valueForProperty:", @"variant_id"));
  [v3 setVariantID:v13];

  v14 = (void *)objc_claimAutoreleasedReturnValue(-[DownloadAsset valueForProperty:](self, "valueForProperty:", @"dpinfo_data"));
  uint64_t v15 = objc_opt_class(&OBJC_CLASS___NSData);
  if ((objc_opt_isKindOfClass(v14, v15) & 1) != 0) {
    [v3 setDPInfo:v14];
  }
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[DownloadAsset valueForProperty:](self, "valueForProperty:", @"initial_odr_size"));

  v17 = (void *)objc_claimAutoreleasedReturnValue(-[DownloadAsset valueForProperty:](self, "valueForProperty:", @"is_local_cache_server"));
  if ((objc_opt_respondsToSelector(v17, "BOOLValue") & 1) != 0) {
    objc_msgSend(v3, "setIsLocallyCacheable:", objc_msgSend(v17, "BOOLValue"));
  }
  v18 = (void *)objc_claimAutoreleasedReturnValue(-[DownloadAsset valueForExternalProperty:](self, "valueForExternalProperty:", @"is_external"));

  if ((objc_opt_respondsToSelector(v18, "BOOLValue") & 1) != 0) {
    objc_msgSend(v3, "setIsExternal:", objc_msgSend(v18, "BOOLValue"));
  }
  v19 = (void *)objc_claimAutoreleasedReturnValue(-[DownloadAsset valueForProperty:](self, "valueForProperty:", @"is_zip_streamable"));

  if ((objc_opt_respondsToSelector(v19, "BOOLValue") & 1) != 0) {
    objc_msgSend(v3, "setIsZipStreamable:", objc_msgSend(v19, "BOOLValue"));
  }

  return v3;
}

- (DownloadAsset)initWithClientXPCAsset:(id)a3
{
  v16.receiver = self;
  v16.super_class = (Class)&OBJC_CLASS___DownloadAsset;
  v4 = -[DownloadAsset init](&v16, "init");
  if (v4)
  {
    -[DownloadAsset setDatabaseID:](v4, "setDatabaseID:", xpc_dictionary_get_int64(a3, "0"));
    uint64_t v5 = objc_opt_class(&OBJC_CLASS___NSDictionary);
    uint64_t v6 = SSXPCDictionaryCopyCFObjectWithClass(a3, "1", v5);
    if (v6)
    {
      v7 = (void *)v6;
      id v8 = +[DownloadAssetEntity copyDatabaseDictionaryToSetClientDictionary:]( &OBJC_CLASS___DownloadAssetEntity,  "copyDatabaseDictionaryToSetClientDictionary:",  v6);
      -[DownloadAsset setValuesWithDictionary:](v4, "setValuesWithDictionary:", v8);
    }

    v9 = -[SSURLRequestProperties initWithXPCEncoding:]( objc_alloc(&OBJC_CLASS___SSURLRequestProperties),  "initWithXPCEncoding:",  xpc_dictionary_get_value(a3, "2"));
    if (v9)
    {
      v10 = v9;
      id v11 = +[DownloadAssetEntity copyDatabaseDictionaryWithRequestProperties:]( &OBJC_CLASS___DownloadAssetEntity,  "copyDatabaseDictionaryWithRequestProperties:",  v9);
      -[DownloadAsset setValuesWithDictionary:](v4, "setValuesWithDictionary:", v11);
    }

    uint64_t v12 = objc_opt_class(&OBJC_CLASS___NSData);
    uint64_t v13 = SSXPCDictionaryCopyObjectWithClass(a3, "3", v12);
    if (v13)
    {
      v14 = (void *)v13;
      +[NSKeyedUnarchiver unarchivedObjectOfClass:fromData:error:]( &OBJC_CLASS___NSKeyedUnarchiver,  "unarchivedObjectOfClass:fromData:error:",  objc_opt_class(&OBJC_CLASS___NSSecurityScopedURLWrapper),  v13,  0LL);
    }
  }

  return v4;
}

- (DownloadAsset)initWithExternalManifestDictionary:(id)a3 validateVariants:(BOOL)a4
{
  BOOL v4 = a4;
  v41.receiver = self;
  v41.super_class = (Class)&OBJC_CLASS___DownloadAsset;
  result = -[DownloadAsset init](&v41, "init");
  if (!result) {
    return result;
  }
  v7 = result;
  id v8 = [a3 objectForKey:@"kind"];
  uint64_t v9 = objc_opt_class(&OBJC_CLASS___NSString);
  if ((objc_opt_isKindOfClass(v8, v9) & 1) != 0)
  {
    if ([v8 isEqualToString:@"full-size-image"])
    {
      v10 = (void **)&SSDownloadAssetTypeArtwork;
LABEL_5:
      id v11 = *v10;
      goto LABEL_10;
    }

    if (([v8 isEqualToString:@"software-package"] & 1) != 0
      || [v8 isEqualToString:@"vpn-plugin-package"])
    {
      id v11 = (void *)SSDownloadAssetTypeMedia;
    }

    else
    {
      if ([v8 isEqualToString:@"newsstand-image"])
      {
        v10 = (void **)&SSDownloadAssetTypeNewsstandArtwork;
        goto LABEL_5;
      }

      if ([v8 isEqualToString:@"transit-data"])
      {
        v10 = (void **)&SSDownloadAssetTypeTransitMapsData;
        goto LABEL_5;
      }

      else {
        id v11 = 0LL;
      }
    }
  }

  else
  {
    id v11 = 0LL;
  }

- (DownloadAsset)initWithURLRequestProperties:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS___DownloadAsset;
  BOOL v4 = -[DownloadAsset init](&v7, "init");
  if (v4)
  {
    id v5 = +[DownloadAssetEntity copyDatabaseDictionaryWithRequestProperties:]( &OBJC_CLASS___DownloadAssetEntity,  "copyDatabaseDictionaryWithRequestProperties:",  a3);
    -[DownloadAsset setValuesWithDictionary:](v4, "setValuesWithDictionary:", v5);
  }

  return v4;
}

+ (Class)databaseEntityClass
{
  return (Class)objc_opt_class(&OBJC_CLASS___DownloadAssetEntity);
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___DownloadAsset;
  return -[DownloadAsset copyWithZone:](&v4, "copyWithZone:", a3);
}

- (id)description
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___DownloadAsset;
  return +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@ [url = %@, variantID = %@]",  -[DownloadAsset description](&v3, "description"),  -[DownloadAsset valueForProperty:](self, "valueForProperty:", @"url"),  -[DownloadAsset valueForProperty:](self, "valueForProperty:", @"variant_id"));
}

@end