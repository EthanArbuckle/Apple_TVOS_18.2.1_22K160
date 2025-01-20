@interface FinishDownloadAssetMemoryEntity
+ (Class)databaseEntityClass;
+ (id)defaultProperties;
- (BOOL)isDRMFree;
- (BOOL)isExternalAsset;
- (NSArray)SINFs;
- (NSData)DPInfoData;
- (NSData)SINFData;
- (NSDictionary)fileAttributes;
- (NSString)assetType;
- (NSString)destinationFileName;
- (NSString)destinationURLString;
- (NSString)downloadKind;
- (NSString)fileProtectionType;
- (NSString)localPath;
- (NSString)pathExtension;
- (NSString)sourceURLString;
- (NSString)variantIdentifier;
- (int64_t)mediaLibraryProtectionType;
- (unint64_t)processingTypes;
- (void)setDownloadKind:(id)a3;
@end

@implementation FinishDownloadAssetMemoryEntity

- (NSString)assetType
{
  return (NSString *)-[FinishDownloadAssetMemoryEntity valueForProperty:]( self,  "valueForProperty:",  @"asset_type");
}

- (NSString)destinationFileName
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[FinishDownloadAssetMemoryEntity destinationURLString](self, "destinationURLString"));
  if (v3)
  {
    v4 = -[NSURL initWithString:](objc_alloc(&OBJC_CLASS___NSURL), "initWithString:", v3);
    if (-[NSURL isFileURL](v4, "isFileURL"))
    {
      if (v4)
      {
        v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSURL lastPathComponent](v4, "lastPathComponent"));
        goto LABEL_14;
      }
    }

    else
    {
    }
  }

  v4 = (NSURL *)objc_claimAutoreleasedReturnValue(-[FinishDownloadAssetMemoryEntity pathExtension](self, "pathExtension"));
  if (!-[NSURL length](v4, "length"))
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[FinishDownloadAssetMemoryEntity localPath](self, "localPath"));
    uint64_t v7 = objc_claimAutoreleasedReturnValue([v6 pathExtension]);

    v4 = (NSURL *)v7;
  }

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[FinishDownloadAssetMemoryEntity sourceURLString](self, "sourceURLString"));
  if (!-[NSURL length](v4, "length") && v8)
  {
    v9 = -[NSURL initWithString:](objc_alloc(&OBJC_CLASS___NSURL), "initWithString:", v8);
    uint64_t v10 = objc_claimAutoreleasedReturnValue(-[NSURL pathExtension](v9, "pathExtension"));

    v4 = (NSURL *)v10;
  }

  v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%lld",  -[FinishDownloadAssetMemoryEntity databaseID](self, "databaseID")));
  if (-[NSURL length](v4, "length"))
  {
    uint64_t v11 = objc_claimAutoreleasedReturnValue([v5 stringByAppendingPathExtension:v4]);

    v5 = (void *)v11;
  }

LABEL_14:
  return (NSString *)v5;
}

- (NSString)destinationURLString
{
  return (NSString *)-[FinishDownloadAssetMemoryEntity valueForProperty:]( self,  "valueForProperty:",  @"destination_url");
}

- (NSData)DPInfoData
{
  return (NSData *)-[FinishDownloadAssetMemoryEntity valueForProperty:](self, "valueForProperty:", @"dpinfo_data");
}

- (NSDictionary)fileAttributes
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[FinishDownloadAssetMemoryEntity fileProtectionType](self, "fileProtectionType"));
  if ([v2 length]) {
    v3 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjectsAndKeys:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjectsAndKeys:",  v2,  NSFileProtectionKey,  0LL));
  }
  else {
    v3 = 0LL;
  }

  return (NSDictionary *)v3;
}

- (NSString)fileProtectionType
{
  return (NSString *)-[FinishDownloadAssetMemoryEntity valueForProperty:]( self,  "valueForProperty:",  @"file_protection");
}

- (BOOL)isDRMFree
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[FinishDownloadAssetMemoryEntity valueForProperty:](self, "valueForProperty:", @"is_drm_free"));
  unsigned __int8 v3 = [v2 BOOLValue];

  return v3;
}

- (BOOL)isExternalAsset
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[FinishDownloadAssetMemoryEntity valueForProperty:](self, "valueForProperty:", @"is_external"));
  unsigned __int8 v3 = [v2 BOOLValue];

  return v3;
}

- (int64_t)mediaLibraryProtectionType
{
  v2 = (void *)objc_claimAutoreleasedReturnValue( -[FinishDownloadAssetMemoryEntity valueForProperty:]( self,  "valueForProperty:",  @"protection_type"));
  id v3 = [v2 integerValue];

  return (int64_t)v3;
}

- (NSString)localPath
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[FinishDownloadAssetMemoryEntity valueForProperty:](self, "valueForProperty:", @"local_path"));
  if (!v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[FinishDownloadAssetMemoryEntity valueForProperty:](self, "valueForProperty:", @"is_hls"));
    if ((objc_opt_respondsToSelector(v4, "BOOLValue") & 1) != 0 && [v4 BOOLValue])
    {
      v5 = (void *)objc_claimAutoreleasedReturnValue(-[FinishDownloadAssetMemoryEntity downloadKind](self, "downloadKind"));
      id v6 = sub_10015AF78(v5);
      uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(v6);

      v8 = (void *)objc_claimAutoreleasedReturnValue(-[FinishDownloadAssetMemoryEntity destinationFileName](self, "destinationFileName"));
      id v3 = (void *)objc_claimAutoreleasedReturnValue([v7 stringByAppendingPathComponent:v8]);
    }

    else
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue( -[FinishDownloadAssetMemoryEntity valueForProperty:]( self,  "valueForProperty:",  @"download_id"));
      id v10 = [v9 longLongValue];

      id v11 = -[FinishDownloadAssetMemoryEntity databaseID](self, "databaseID");
      uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(-[FinishDownloadAssetMemoryEntity downloadKind](self, "downloadKind"));
      id v3 = (void *)objc_claimAutoreleasedReturnValue( +[ScratchManager directoryPathForDownloadID:assetID:kind:createIfNeeded:]( &OBJC_CLASS___ScratchManager,  "directoryPathForDownloadID:assetID:kind:createIfNeeded:",  v10,  v11,  v7,  1LL));
    }
  }

  return (NSString *)v3;
}

- (NSString)pathExtension
{
  return (NSString *)-[FinishDownloadAssetMemoryEntity valueForProperty:]( self,  "valueForProperty:",  @"path_extension");
}

- (unint64_t)processingTypes
{
  v2 = (void *)objc_claimAutoreleasedReturnValue( -[FinishDownloadAssetMemoryEntity valueForProperty:]( self,  "valueForProperty:",  @"processing_types"));
  id v3 = [v2 unsignedIntegerValue];

  return (unint64_t)v3;
}

- (NSData)SINFData
{
  return (NSData *)-[FinishDownloadAssetMemoryEntity valueForProperty:](self, "valueForProperty:", @"sinfs_data");
}

- (NSArray)SINFs
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[FinishDownloadAssetMemoryEntity SINFData](self, "SINFData"));
  if (v2)
  {
    id v3 = (void *)objc_claimAutoreleasedReturnValue( +[NSPropertyListSerialization propertyListWithData:options:format:error:]( &OBJC_CLASS___NSPropertyListSerialization,  "propertyListWithData:options:format:error:",  v2,  0LL,  0LL,  0LL));
    uint64_t v4 = objc_opt_class(&OBJC_CLASS___NSArray);
    id v5 = 0LL;
    if ((objc_opt_isKindOfClass(v3, v4) & 1) != 0) {
      id v5 = v3;
    }
  }

  else
  {
    id v5 = 0LL;
  }

  return (NSArray *)v5;
}

- (NSString)sourceURLString
{
  return (NSString *)-[FinishDownloadAssetMemoryEntity valueForProperty:](self, "valueForProperty:", @"url");
}

- (NSString)variantIdentifier
{
  return (NSString *)-[FinishDownloadAssetMemoryEntity valueForProperty:]( self,  "valueForProperty:",  @"variant_id");
}

+ (Class)databaseEntityClass
{
  return (Class)objc_opt_class(&OBJC_CLASS___DownloadAssetEntity);
}

+ (id)defaultProperties
{
  v3[0] = @"destination_url";
  v3[1] = @"download_id";
  v3[2] = @"dpinfo_data";
  v3[3] = @"file_protection";
  v3[4] = @"is_drm_free";
  v3[5] = @"is_external";
  v3[6] = @"is_hls";
  v3[7] = @"path_extension";
  v3[8] = @"processing_types";
  v3[9] = @"protection_type";
  v3[10] = @"local_path";
  v3[11] = @"sinfs_data";
  v3[12] = @"asset_type";
  v3[13] = @"url";
  v3[14] = @"variant_id";
  return (id)objc_claimAutoreleasedReturnValue( +[NSArray arrayWithObjects:count:]( &OBJC_CLASS___NSArray,  "arrayWithObjects:count:",  v3,  15LL));
}

- (NSString)downloadKind
{
  return self->_downloadKind;
}

- (void)setDownloadKind:(id)a3
{
}

- (void).cxx_destruct
{
}

@end