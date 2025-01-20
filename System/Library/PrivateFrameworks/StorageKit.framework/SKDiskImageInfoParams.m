@interface SKDiskImageInfoParams
+ (id)asif_info_key;
+ (id)checksum_info_key;
+ (id)compression_info_key;
+ (id)encryption_info_key;
+ (id)format_desc_info_key;
+ (id)format_info_key;
+ (id)getDictDescriptionWithDisk:(id)a3;
+ (id)identity_info_key;
+ (id)partitions_info_key;
+ (id)runs_info_key;
+ (id)size_info_key;
- (BOOL)extraInfo;
- (BOOL)stdinPassPhrase;
- (NSDictionary)imageInfo;
- (id)getInfoDictWithDisk:(id)a3;
- (void)setExtraInfo:(BOOL)a3;
- (void)setImageInfo:(id)a3;
- (void)setStdinPassPhrase:(BOOL)a3;
@end

@implementation SKDiskImageInfoParams

+ (id)format_info_key
{
  return @"Image Format";
}

+ (id)format_desc_info_key
{
  return @"Format Description";
}

+ (id)identity_info_key
{
  return @"Identity Info";
}

+ (id)size_info_key
{
  return @"Size Info";
}

+ (id)compression_info_key
{
  return @"Compression Info";
}

+ (id)encryption_info_key
{
  return @"Encryption Info";
}

+ (id)checksum_info_key
{
  return @"Master Checksum Info";
}

+ (id)asif_info_key
{
  return @"ASIF Info";
}

+ (id)runs_info_key
{
  return @"Runs";
}

+ (id)partitions_info_key
{
  return @"Partitions";
}

+ (id)getDictDescriptionWithDisk:(id)a3
{
  id v3 = a3;
  [MEMORY[0x189603FC8] dictionaryWithCapacity:4];
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  [v3 ioContent];
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    [v3 ioContent];
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    [v4 setObject:v6 forKey:@"content-hint"];
  }

  else
  {
    [v4 setObject:@"N/A" forKey:@"content-hint"];
  }

  [v3 volumeName];
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    [v3 volumeName];
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    [v4 setObject:v8 forKey:@"volume-name"];
  }

  else
  {
    [v4 setObject:@"N/A" forKey:@"volume-name"];
  }

  objc_msgSend(MEMORY[0x189607968], "numberWithUnsignedLongLong:", objc_msgSend(v3, "totalSpace"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 setObject:v9 forKey:@"total-space"];

  if ([v3 isMemberOfClass:objc_opt_class()])
  {
    objc_msgSend(MEMORY[0x189607968], "numberWithUnsignedLongLong:", objc_msgSend(v3, "usedSpace"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    [v4 setObject:v10 forKey:@"used-space"];
  }

  else
  {
    [v4 setObject:@"N/A" forKey:@"used-space"];
  }

  return v4;
}

- (id)getInfoDictWithDisk:(id)a3
{
  id v4 = a3;
  v5 = -[SKDiskImageInfoParams imageInfo](self, "imageInfo");
  v6 = (void *)[v5 mutableCopy];

  if (v6)
  {
    [MEMORY[0x189603FA8] arrayWithCapacity:4];
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    [MEMORY[0x189603FA8] arrayWithObject:v4];
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    while ([v8 count])
    {
      [v8 objectAtIndex:0];
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = +[SKManager syncSharedManager](&OBJC_CLASS___SKManager, "syncSharedManager");
      [v10 childDisksForWholeDisk:v9];
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      [v8 addObjectsFromArray:v11];
      v12 = +[SKDiskImageInfoParams getDictDescriptionWithDisk:]( &OBJC_CLASS___SKDiskImageInfoParams,  "getDictDescriptionWithDisk:",  v9);
      [v7 addObject:v12];

      if ([v9 isMemberOfClass:objc_opt_class()])
      {
        [v9 container];
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        [v13 volumes];
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        [v8 addObjectsFromArray:v14];
        v15 = +[SKDiskImageInfoParams getDictDescriptionWithDisk:]( &OBJC_CLASS___SKDiskImageInfoParams,  "getDictDescriptionWithDisk:",  v13);
        [v7 addObject:v15];
      }

      [v8 removeObjectAtIndex:0];
    }

    [v6 setObject:v7 forKey:@"Partitions"];
    id v16 = v6;
  }

  return v6;
}

- (BOOL)stdinPassPhrase
{
  return self->_stdinPassPhrase;
}

- (void)setStdinPassPhrase:(BOOL)a3
{
  self->_stdinPassPhrase = a3;
}

- (BOOL)extraInfo
{
  return self->_extraInfo;
}

- (void)setExtraInfo:(BOOL)a3
{
  self->_extraInfo = a3;
}

- (NSDictionary)imageInfo
{
  return self->_imageInfo;
}

- (void)setImageInfo:(id)a3
{
}

- (void).cxx_destruct
{
}

@end