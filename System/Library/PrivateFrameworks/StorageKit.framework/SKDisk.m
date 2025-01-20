@interface SKDisk
+ (void)sortWithDisks:(id)a3;
- (BOOL)canBeErasedToRole:(id)a3;
- (BOOL)canBoot;
- (BOOL)canPartitionDisk;
- (BOOL)canResize;
- (BOOL)cleanupWithError:(id *)a3;
- (BOOL)ejectWithCompletionBlock:(id)a3;
- (BOOL)ejectWithError:(id *)a3;
- (BOOL)isCaseSensitive;
- (BOOL)isDiskImage;
- (BOOL)isEqual:(id)a3;
- (BOOL)isExternal;
- (BOOL)isIOMediaDisk;
- (BOOL)isIOSRootSnapshot;
- (BOOL)isInternal;
- (BOOL)isJournaled;
- (BOOL)isLiveFSAPFSDisk;
- (BOOL)isLocked;
- (BOOL)isMediaWritable;
- (BOOL)isOSInternal;
- (BOOL)isPartitionDisk;
- (BOOL)isPhysicalDisk;
- (BOOL)isRemovable;
- (BOOL)isTrusted;
- (BOOL)isValid;
- (BOOL)isVirtualDiskType;
- (BOOL)isWholeDisk;
- (BOOL)isWritable;
- (BOOL)matchesDictionary:(id)a3;
- (BOOL)mountWithCompletionBlock:(id)a3;
- (BOOL)mountWithOptions:(id)a3 withCompletionBlock:(id)a4;
- (BOOL)mountWithOptionsDictionary:(id)a3 error:(id *)a4;
- (BOOL)mountWithOptionsDictionary:(id)a3 withCompletionBlock:(id)a4;
- (BOOL)mountWithParams:(id)a3 error:(id *)a4;
- (BOOL)rename:(id)a3 withCompletionBlock:(id)a4;
- (BOOL)supportsJournaling;
- (BOOL)supportsRepair;
- (BOOL)supportsVerify;
- (BOOL)unmountWithCompletionBlock:(id)a3;
- (BOOL)unmountWithOptions:(id)a3 completionBlock:(id)a4;
- (BOOL)unmountWithOptions:(id)a3 error:(id *)a4;
- (BOOL)wipeDiskWithError:(id *)a3;
- (NSNumber)diskObjectID;
- (NSObject)daDisk;
- (NSString)diskIdentifier;
- (NSString)filesystemType;
- (NSString)ioContent;
- (NSString)mediaUUID;
- (NSString)mountPoint;
- (NSString)role;
- (NSString)type;
- (NSString)volumeName;
- (NSString)volumeUUID;
- (SKDisk)initWithDictionary:(id)a3;
- (SKDiskPrivateCache)privateCache;
- (SKFilesystem)filesystem;
- (id)cachedWholeDiskByIdentifier;
- (id)children;
- (id)description;
- (id)dictionaryRepresentation;
- (id)formattableFilesystemWithFilesystem:(id)a3;
- (id)formattableFilesystems;
- (id)innerDescriptionWithPrivateData:(BOOL)a3;
- (id)minimalDictionaryRepresentation;
- (id)redactedDescription;
- (id)resizeToSize:(unint64_t)a3 completionBlock:(id)a4;
- (id)supportedFilesystems;
- (id)wholeDiskIdentifier;
- (unint64_t)availableSpace;
- (unint64_t)childCount;
- (unint64_t)freeSpace;
- (unint64_t)hash;
- (unint64_t)purgeableSpace;
- (unint64_t)startLocation;
- (unint64_t)totalSpace;
- (unint64_t)unformattedSize;
- (unsigned)getSectorSize;
- (unsigned)ownerUID;
- (void)expireCache;
- (void)expireCacheWithCompletionBlock:(id)a3;
- (void)expireCacheWithOptions:(unint64_t)a3 completionBlock:(id)a4;
- (void)recacheWithOptions:(unint64_t)a3;
- (void)resize:(unint64_t)a3 completion:(id)a4;
- (void)setAvailableSpace:(unint64_t)a3;
- (void)setCanPartitionDisk:(BOOL)a3;
- (void)setChildCount:(unint64_t)a3;
- (void)setDaDisk:(id)a3;
- (void)setDiskIdentifier:(id)a3;
- (void)setDiskObjectID:(id)a3;
- (void)setFilesystem:(id)a3;
- (void)setFilesystemType:(id)a3;
- (void)setFreeSpace:(unint64_t)a3;
- (void)setIoContent:(id)a3;
- (void)setIsCaseSensitive:(BOOL)a3;
- (void)setIsDiskImage:(BOOL)a3;
- (void)setIsInternal:(BOOL)a3;
- (void)setIsJournaled:(BOOL)a3;
- (void)setIsLocked:(BOOL)a3;
- (void)setIsMediaWritable:(BOOL)a3;
- (void)setIsOSInternal:(BOOL)a3;
- (void)setIsPartitionDisk:(BOOL)a3;
- (void)setIsPhysicalDisk:(BOOL)a3;
- (void)setIsRemovable:(BOOL)a3;
- (void)setIsValid:(BOOL)a3;
- (void)setIsWholeDisk:(BOOL)a3;
- (void)setIsWritable:(BOOL)a3;
- (void)setMediaUUID:(id)a3;
- (void)setMountPoint:(id)a3;
- (void)setOwnerUID:(unsigned int)a3;
- (void)setPrivateCache:(id)a3;
- (void)setPurgeableSpace:(unint64_t)a3;
- (void)setRole:(id)a3;
- (void)setStartLocation:(unint64_t)a3;
- (void)setSupportsJournaling:(BOOL)a3;
- (void)setSupportsRepair:(BOOL)a3;
- (void)setSupportsVerify:(BOOL)a3;
- (void)setTotalSpace:(unint64_t)a3;
- (void)setType:(id)a3;
- (void)setUnformattedSize:(unint64_t)a3;
- (void)setVolumeName:(id)a3;
- (void)setVolumeUUID:(id)a3;
- (void)updateWithDictionary:(id)a3;
@end

@implementation SKDisk

- (id)minimalDictionaryRepresentation
{
  v2 = self;
  objc_sync_enter(v2);
  [MEMORY[0x189603FC8] dictionaryWithCapacity:5];
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  [v3 setObject:v5 forKey:@"**ClassName**"];
  v6 = -[SKDisk diskObjectID](v2, "diskObjectID");
  [v3 setObject:v6 forKey:@"diskObjectID"];
  v7 = -[SKDisk role](v2, "role");
  [v3 setObject:v7 forKey:@"role"];
  v8 = -[SKDisk type](v2, "type");
  [v3 setObject:v8 forKey:@"type"];
  v9 = -[SKDisk filesystemType](v2, "filesystemType");
  if (v9)
  {
    v10 = -[SKDisk filesystemType](v2, "filesystemType");
    [v3 setObject:v10 forKey:@"filesystemType"];
  }

  else
  {
    [v3 setObject:kSKDiskFileSystemUndefined[0] forKey:@"filesystemType"];
  }
  v11 = -[SKDisk diskIdentifier](v2, "diskIdentifier");
  if (v11)
  {
    v12 = -[SKDisk diskIdentifier](v2, "diskIdentifier");
    [v3 setObject:v12 forKey:@"diskIdentifier"];
  }
  v13 = -[SKDisk mediaUUID](v2, "mediaUUID");
  if (v13)
  {
    v14 = -[SKDisk mediaUUID](v2, "mediaUUID");
    [v3 setObject:v14 forKey:@"mediaUUID"];
  }

  objc_sync_exit(v2);

  return v3;
}

- (id)dictionaryRepresentation
{
  v2 = self;
  objc_sync_enter(v2);
  v3 = -[SKDisk minimalDictionaryRepresentation](v2, "minimalDictionaryRepresentation");
  objc_msgSend(MEMORY[0x189607968], "numberWithBool:", -[SKDisk isValid](v2, "isValid"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  [v3 setObject:v4 forKey:@"isValid"];

  objc_msgSend(MEMORY[0x189607968], "numberWithBool:", -[SKDisk isDiskImage](v2, "isDiskImage"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  [v3 setObject:v5 forKey:@"isDiskImage"];

  objc_msgSend(MEMORY[0x189607968], "numberWithBool:", -[SKDisk isInternal](v2, "isInternal"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  [v3 setObject:v6 forKey:@"isInternal"];

  objc_msgSend(MEMORY[0x189607968], "numberWithBool:", -[SKDisk isWholeDisk](v2, "isWholeDisk"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  [v3 setObject:v7 forKey:@"isWholeDisk"];

  objc_msgSend(MEMORY[0x189607968], "numberWithBool:", -[SKDisk isPhysicalDisk](v2, "isPhysicalDisk"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  [v3 setObject:v8 forKey:@"isPhysicalDisk"];

  objc_msgSend(MEMORY[0x189607968], "numberWithBool:", -[SKDisk canPartitionDisk](v2, "canPartitionDisk"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  [v3 setObject:v9 forKey:@"canPartitionDisk"];

  objc_msgSend(MEMORY[0x189607968], "numberWithBool:", -[SKDisk isCaseSensitive](v2, "isCaseSensitive"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  [v3 setObject:v10 forKey:@"isCaseSensitive"];

  objc_msgSend(MEMORY[0x189607968], "numberWithBool:", -[SKDisk isLocked](v2, "isLocked"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  [v3 setObject:v11 forKey:@"isLocked"];

  objc_msgSend(MEMORY[0x189607968], "numberWithBool:", -[SKDisk isOSInternal](v2, "isOSInternal"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  [v3 setObject:v12 forKey:@"isOSInternal"];

  objc_msgSend(MEMORY[0x189607968], "numberWithBool:", -[SKDisk isPartitionDisk](v2, "isPartitionDisk"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  [v3 setObject:v13 forKey:@"isPartitionDisk"];

  objc_msgSend(MEMORY[0x189607968], "numberWithUnsignedLongLong:", -[SKDisk freeSpace](v2, "freeSpace"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  [v3 setObject:v14 forKey:@"freeSpace"];

  objc_msgSend(MEMORY[0x189607968], "numberWithUnsignedLongLong:", -[SKDisk purgeableSpace](v2, "purgeableSpace"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  [v3 setObject:v15 forKey:@"purgeableSpace"];

  objc_msgSend(MEMORY[0x189607968], "numberWithUnsignedLongLong:", -[SKDisk availableSpace](v2, "availableSpace"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  [v3 setObject:v16 forKey:@"availableSpace"];

  objc_msgSend(MEMORY[0x189607968], "numberWithUnsignedLongLong:", -[SKDisk totalSpace](v2, "totalSpace"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  [v3 setObject:v17 forKey:@"totalSpace"];

  objc_msgSend(MEMORY[0x189607968], "numberWithUnsignedLongLong:", -[SKDisk startLocation](v2, "startLocation"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  [v3 setObject:v18 forKey:@"startLocation"];
  v19 = -[SKDisk mountPoint](v2, "mountPoint");
  if (v19) {
    -[SKDisk mountPoint](v2, "mountPoint");
  }
  else {
    [MEMORY[0x189603FE8] null];
  }
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  [v3 setObject:v20 forKey:@"mountPoint"];
  v21 = -[SKDisk volumeName](v2, "volumeName");
  if (v21) {
    -[SKDisk volumeName](v2, "volumeName");
  }
  else {
    [MEMORY[0x189603FE8] null];
  }
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  [v3 setObject:v22 forKey:@"volumeName"];
  v23 = -[SKDisk volumeUUID](v2, "volumeUUID");
  if (v23) {
    -[SKDisk volumeUUID](v2, "volumeUUID");
  }
  else {
    [MEMORY[0x189603FE8] null];
  }
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  [v3 setObject:v24 forKey:@"volumeUUID"];
  v25 = -[SKDisk ioContent](v2, "ioContent");
  if (v25) {
    -[SKDisk ioContent](v2, "ioContent");
  }
  else {
    [MEMORY[0x189603FE8] null];
  }
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  [v3 setObject:v26 forKey:@"ioContent"];

  objc_msgSend(MEMORY[0x189607968], "numberWithUnsignedLongLong:", -[SKDisk unformattedSize](v2, "unformattedSize"));
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  [v3 setObject:v27 forKey:@"unformattedSize"];

  objc_msgSend(MEMORY[0x189607968], "numberWithBool:", -[SKDisk supportsRepair](v2, "supportsRepair"));
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  [v3 setObject:v28 forKey:@"supportsRepair"];

  objc_msgSend(MEMORY[0x189607968], "numberWithBool:", -[SKDisk supportsVerify](v2, "supportsVerify"));
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  [v3 setObject:v29 forKey:@"supportsVerify"];

  objc_msgSend(MEMORY[0x189607968], "numberWithUnsignedLongLong:", -[SKDisk childCount](v2, "childCount"));
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  [v3 setObject:v30 forKey:@"childCount"];

  objc_msgSend(MEMORY[0x189607968], "numberWithBool:", -[SKDisk supportsJournaling](v2, "supportsJournaling"));
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  [v3 setObject:v31 forKey:@"supportsJournaling"];

  objc_msgSend(MEMORY[0x189607968], "numberWithBool:", -[SKDisk isJournaled](v2, "isJournaled"));
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  [v3 setObject:v32 forKey:@"isJournaled"];

  objc_msgSend(MEMORY[0x189607968], "numberWithBool:", -[SKDisk isWritable](v2, "isWritable"));
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  [v3 setObject:v33 forKey:@"isWritable"];

  objc_msgSend(MEMORY[0x189607968], "numberWithBool:", -[SKDisk isMediaWritable](v2, "isMediaWritable"));
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  [v3 setObject:v34 forKey:@"isMediaWritable"];
  v35 = -[SKDisk filesystem](v2, "filesystem");
  if (v35)
  {
    v36 = -[SKDisk filesystem](v2, "filesystem");
    [v36 dictionaryRepresentation];
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    [v3 setObject:v37 forKey:@"filesystem"];
  }

  objc_sync_exit(v2);

  return v3;
}

- (BOOL)matchesDictionary:(id)a3
{
  id v4 = a3;
  v5 = (objc_class *)objc_opt_class();
  NSStringFromClass(v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 objectForKey:@"**ClassName**"];
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ([v6 isEqualToString:v7])
  {
    v8 = -[SKDisk diskIdentifier](self, "diskIdentifier");
    [v4 objectForKey:@"diskIdentifier"];
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    int v10 = [v8 isEqualToString:v9];

    if (!v10)
    {
      char v12 = 0;
      goto LABEL_9;
    }
    v11 = -[SKDisk mediaUUID](self, "mediaUUID");
    if (!v11)
    {
      char v12 = 1;
      goto LABEL_9;
    }
    v6 = -[SKDisk mediaUUID](self, "mediaUUID");
    [v4 objectForKeyedSubscript:@"mediaUUID"];
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    char v12 = [v6 isEqual:v7];
  }

  else
  {
    char v12 = 0;
  }

LABEL_9:
  return v12;
}

- (SKDisk)initWithDictionary:(id)a3
{
  id v4 = a3;
  v5 = -[SKDisk init](self, "init");
  v6 = v5;
  if (v5)
  {
    v7 = v5;
    objc_sync_enter(v7);
    -[SKDisk updateWithDictionary:](v7, "updateWithDictionary:", v4);
    objc_sync_exit(v7);
  }

  return v6;
}

- (void)updateWithDictionary:(id)a3
{
  uint64_t v97 = *MEMORY[0x1895F89C0];
  id v95 = a3;
  id v4 = self;
  objc_sync_enter(v4);
  [v95 objectForKey:@"**ClassName**"];
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    v6 = (objc_class *)objc_opt_class();
    NSStringFromClass(v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    [v95 objectForKey:@"**ClassName**"];
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    char v9 = [v7 isEqualToString:v8];

    if ((v9 & 1) == 0)
    {
      SKGetOSLog();
      v91 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v91, OS_LOG_TYPE_ERROR))
      {
        v92 = (objc_class *)objc_opt_class();
        NSStringFromClass(v92);
        id v93 = (id)objc_claimAutoreleasedReturnValue();
        [v95 objectForKey:@"**ClassName**"];
        v94 = (void *)objc_claimAutoreleasedReturnValue();
        -[SKDisk updateWithDictionary:].cold.1(v93, v94, buf, v91);
      }

      __assert_rtn("-[SKDisk updateWithDictionary:]", "SKDisk.m", 211, "NO");
    }
  }

  [v95 objectForKeyedSubscript:@"diskObjectID"];
  int v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[SKDisk setDiskObjectID:](v4, "setDiskObjectID:", v10);

  [v95 objectForKey:@"role"];
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    [v95 objectForKey:@"role"];
    char v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[SKDisk setRole:](v4, "setRole:", v12);
  }

  [v95 objectForKey:@"filesystemType"];
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
  {
    [v95 objectForKey:@"filesystemType"];
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[SKDisk setFilesystemType:](v4, "setFilesystemType:", v14);
  }

  [v95 objectForKey:@"type"];
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (v15)
  {
    [v95 objectForKey:@"type"];
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[SKDisk setType:](v4, "setType:", v16);
  }

  [v95 objectForKey:@"isValid"];
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  if (v17)
  {
    [v95 objectForKey:@"isValid"];
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[SKDisk setIsValid:](v4, "setIsValid:", [v18 BOOLValue]);
  }

  [v95 objectForKey:@"isDiskImage"];
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  if (v19)
  {
    [v95 objectForKey:@"isDiskImage"];
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[SKDisk setIsDiskImage:](v4, "setIsDiskImage:", [v20 BOOLValue]);
  }

  [v95 objectForKey:@"isInternal"];
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  if (v21)
  {
    [v95 objectForKey:@"isInternal"];
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[SKDisk setIsInternal:](v4, "setIsInternal:", [v22 BOOLValue]);
  }

  [v95 objectForKey:@"isWholeDisk"];
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  if (v23)
  {
    [v95 objectForKey:@"isWholeDisk"];
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    -[SKDisk setIsWholeDisk:](v4, "setIsWholeDisk:", [v24 BOOLValue]);
  }

  [v95 objectForKey:@"isPhysicalDisk"];
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  if (v25)
  {
    [v95 objectForKey:@"isPhysicalDisk"];
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    -[SKDisk setIsPhysicalDisk:](v4, "setIsPhysicalDisk:", [v26 BOOLValue]);
  }

  [v95 objectForKey:@"canPartitionDisk"];
  v27 = (void *)objc_claimAutoreleasedReturnValue();

  if (v27)
  {
    [v95 objectForKey:@"canPartitionDisk"];
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    -[SKDisk setCanPartitionDisk:](v4, "setCanPartitionDisk:", [v28 BOOLValue]);
  }

  [v95 objectForKey:@"isPartitionDisk"];
  v29 = (void *)objc_claimAutoreleasedReturnValue();

  if (v29)
  {
    [v95 objectForKey:@"isPartitionDisk"];
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    -[SKDisk setIsPartitionDisk:](v4, "setIsPartitionDisk:", [v30 BOOLValue]);
  }

  [v95 objectForKey:@"supportsJournaling"];
  v31 = (void *)objc_claimAutoreleasedReturnValue();

  if (v31)
  {
    [v95 objectForKey:@"supportsJournaling"];
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    -[SKDisk setSupportsJournaling:](v4, "setSupportsJournaling:", [v32 BOOLValue]);
  }

  [v95 objectForKey:@"isJournaled"];
  v33 = (void *)objc_claimAutoreleasedReturnValue();

  if (v33)
  {
    [v95 objectForKey:@"isJournaled"];
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    -[SKDisk setIsJournaled:](v4, "setIsJournaled:", [v34 BOOLValue]);
  }

  [v95 objectForKey:@"isCaseSensitive"];
  v35 = (void *)objc_claimAutoreleasedReturnValue();

  if (v35)
  {
    [v95 objectForKey:@"isCaseSensitive"];
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    -[SKDisk setIsCaseSensitive:](v4, "setIsCaseSensitive:", [v36 BOOLValue]);
  }

  [v95 objectForKey:@"mediaUUID"];
  v37 = (void *)objc_claimAutoreleasedReturnValue();

  if (v37)
  {
    [v95 objectForKey:@"mediaUUID"];
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    [MEMORY[0x189603FE8] null];
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    if (v38 == v39)
    {
      v40 = 0LL;
    }

    else
    {
      [v95 objectForKey:@"mediaUUID"];
      v40 = (void *)objc_claimAutoreleasedReturnValue();
    }

    -[SKDisk setMediaUUID:](v4, "setMediaUUID:", v40);
    if (v38 != v39) {
  }
    }

  [v95 objectForKey:@"isOSInternal"];
  v41 = (void *)objc_claimAutoreleasedReturnValue();

  if (v41)
  {
    [v95 objectForKey:@"isOSInternal"];
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    -[SKDisk setIsOSInternal:](v4, "setIsOSInternal:", [v42 BOOLValue]);
  }

  [v95 objectForKey:@"childCount"];
  v43 = (void *)objc_claimAutoreleasedReturnValue();

  if (v43)
  {
    [v95 objectForKey:@"childCount"];
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    -[SKDisk setChildCount:](v4, "setChildCount:", [v44 unsignedLongLongValue]);
  }

  [v95 objectForKey:@"startLocation"];
  v45 = (void *)objc_claimAutoreleasedReturnValue();

  if (v45)
  {
    [v95 objectForKey:@"startLocation"];
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    -[SKDisk setStartLocation:](v4, "setStartLocation:", [v46 unsignedLongLongValue]);
  }

  [v95 objectForKey:@"isLocked"];
  v47 = (void *)objc_claimAutoreleasedReturnValue();

  if (v47)
  {
    [v95 objectForKey:@"isLocked"];
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    -[SKDisk setIsLocked:](v4, "setIsLocked:", [v48 BOOLValue]);
  }

  [v95 objectForKey:@"diskIdentifier"];
  v49 = (void *)objc_claimAutoreleasedReturnValue();

  if (v49)
  {
    [v95 objectForKey:@"diskIdentifier"];
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    [MEMORY[0x189603FE8] null];
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    if (v50 == v51)
    {
      v52 = 0LL;
    }

    else
    {
      [v95 objectForKey:@"diskIdentifier"];
      v52 = (void *)objc_claimAutoreleasedReturnValue();
    }

    -[SKDisk setDiskIdentifier:](v4, "setDiskIdentifier:", v52);
    if (v50 != v51) {
  }
    }

  [v95 objectForKey:@"volumeName"];
  v53 = (void *)objc_claimAutoreleasedReturnValue();

  if (v53)
  {
    [v95 objectForKey:@"volumeName"];
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    [MEMORY[0x189603FE8] null];
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    if (v54 == v55)
    {
      v56 = 0LL;
    }

    else
    {
      [v95 objectForKey:@"volumeName"];
      v56 = (void *)objc_claimAutoreleasedReturnValue();
    }

    -[SKDisk setVolumeName:](v4, "setVolumeName:", v56);
    if (v54 != v55) {
  }
    }

  [v95 objectForKey:@"volumeUUID"];
  v57 = (void *)objc_claimAutoreleasedReturnValue();

  if (v57)
  {
    [v95 objectForKey:@"volumeUUID"];
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    [MEMORY[0x189603FE8] null];
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    if (v58 == v59)
    {
      v60 = 0LL;
    }

    else
    {
      [v95 objectForKey:@"volumeUUID"];
      v60 = (void *)objc_claimAutoreleasedReturnValue();
    }

    -[SKDisk setVolumeUUID:](v4, "setVolumeUUID:", v60);
    if (v58 != v59) {
  }
    }

  [v95 objectForKey:@"supportsRepair"];
  v61 = (void *)objc_claimAutoreleasedReturnValue();

  if (v61)
  {
    [v95 objectForKey:@"supportsRepair"];
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    -[SKDisk setSupportsRepair:](v4, "setSupportsRepair:", [v62 BOOLValue]);
  }

  [v95 objectForKey:@"supportsVerify"];
  v63 = (void *)objc_claimAutoreleasedReturnValue();

  if (v63)
  {
    [v95 objectForKey:@"supportsVerify"];
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    -[SKDisk setSupportsVerify:](v4, "setSupportsVerify:", [v64 BOOLValue]);
  }

  [v95 objectForKey:@"unformattedSize"];
  v65 = (void *)objc_claimAutoreleasedReturnValue();

  if (v65)
  {
    [v95 objectForKey:@"unformattedSize"];
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    -[SKDisk setUnformattedSize:](v4, "setUnformattedSize:", [v66 unsignedLongLongValue]);
  }

  [v95 objectForKey:@"filesystem"];
  v67 = (void *)objc_claimAutoreleasedReturnValue();

  if (v67)
  {
    v68 = objc_alloc(&OBJC_CLASS___SKFilesystem);
    [v95 objectForKey:@"filesystem"];
    v69 = (void *)objc_claimAutoreleasedReturnValue();
    v70 = -[SKFilesystem initWithDictionaryRepresentation:](v68, "initWithDictionaryRepresentation:", v69);
    -[SKDisk setFilesystem:](v4, "setFilesystem:", v70);
  }

  [v95 objectForKey:@"freeSpace"];
  v71 = (void *)objc_claimAutoreleasedReturnValue();

  if (v71)
  {
    [v95 objectForKey:@"freeSpace"];
    v72 = (void *)objc_claimAutoreleasedReturnValue();
    -[SKDisk setFreeSpace:](v4, "setFreeSpace:", [v72 unsignedLongLongValue]);
  }

  [v95 objectForKey:@"purgeableSpace"];
  v73 = (void *)objc_claimAutoreleasedReturnValue();

  if (v73)
  {
    [v95 objectForKey:@"purgeableSpace"];
    v74 = (void *)objc_claimAutoreleasedReturnValue();
    -[SKDisk setPurgeableSpace:](v4, "setPurgeableSpace:", [v74 unsignedLongLongValue]);
  }

  [v95 objectForKey:@"availableSpace"];
  v75 = (void *)objc_claimAutoreleasedReturnValue();

  if (v75)
  {
    [v95 objectForKey:@"availableSpace"];
    v76 = (void *)objc_claimAutoreleasedReturnValue();
    -[SKDisk setAvailableSpace:](v4, "setAvailableSpace:", [v76 unsignedLongLongValue]);
  }

  [v95 objectForKey:@"totalSpace"];
  v77 = (void *)objc_claimAutoreleasedReturnValue();

  if (v77)
  {
    [v95 objectForKey:@"totalSpace"];
    v78 = (void *)objc_claimAutoreleasedReturnValue();
    -[SKDisk setTotalSpace:](v4, "setTotalSpace:", [v78 unsignedLongLongValue]);
  }

  [v95 objectForKey:@"ioContent"];
  v79 = (void *)objc_claimAutoreleasedReturnValue();

  if (v79)
  {
    [v95 objectForKey:@"ioContent"];
    v80 = (void *)objc_claimAutoreleasedReturnValue();
    [MEMORY[0x189603FE8] null];
    v81 = (void *)objc_claimAutoreleasedReturnValue();
    if (v80 == v81)
    {
      v82 = 0LL;
    }

    else
    {
      [v95 objectForKey:@"ioContent"];
      v82 = (void *)objc_claimAutoreleasedReturnValue();
    }

    -[SKDisk setIoContent:](v4, "setIoContent:", v82);
    if (v80 != v81) {
  }
    }

  [v95 objectForKey:@"isWritable"];
  v83 = (void *)objc_claimAutoreleasedReturnValue();

  if (v83)
  {
    [v95 objectForKey:@"isWritable"];
    v84 = (void *)objc_claimAutoreleasedReturnValue();
    -[SKDisk setIsWritable:](v4, "setIsWritable:", [v84 BOOLValue]);
  }

  [v95 objectForKey:@"isMediaWritable"];
  v85 = (void *)objc_claimAutoreleasedReturnValue();

  if (v85)
  {
    [v95 objectForKey:@"isMediaWritable"];
    v86 = (void *)objc_claimAutoreleasedReturnValue();
    -[SKDisk setIsMediaWritable:](v4, "setIsMediaWritable:", [v86 BOOLValue]);
  }

  [v95 objectForKey:@"mountPoint"];
  v87 = (void *)objc_claimAutoreleasedReturnValue();

  if (v87)
  {
    [v95 objectForKey:@"mountPoint"];
    v88 = (void *)objc_claimAutoreleasedReturnValue();
    [MEMORY[0x189603FE8] null];
    v89 = (void *)objc_claimAutoreleasedReturnValue();
    if (v88 == v89)
    {
      v90 = 0LL;
    }

    else
    {
      [v95 objectForKey:@"mountPoint"];
      v90 = (void *)objc_claimAutoreleasedReturnValue();
    }

    -[SKDisk setMountPoint:](v4, "setMountPoint:", v90);
    if (v88 != v89) {
  }
    }

  objc_sync_exit(v4);
}

+ (void)sortWithDisks:(id)a3
{
}

uint64_t __24__SKDisk_sortWithDisks___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  id v5 = a3;
  id v6 = v4;
  id v7 = v5;
  unint64_t v8 = [v6 startLocation];
  if (v8 >= [v7 startLocation])
  {
    unint64_t v10 = [v6 startLocation];
    if (v10 <= [v7 startLocation])
    {
      [v6 diskIdentifier];
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      if ((unint64_t)[v11 length] < 5)
      {
        uint64_t v9 = 0LL;
      }

      else
      {
        [v7 diskIdentifier];
        char v12 = (void *)objc_claimAutoreleasedReturnValue();
        unint64_t v13 = [v12 length];

        if (v13 < 5)
        {
          uint64_t v9 = 0LL;
          goto LABEL_29;
        }

        [v6 diskIdentifier];
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        [v14 substringFromIndex:4];
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        [v15 componentsSeparatedByString:@"s"];
        v11 = (void *)objc_claimAutoreleasedReturnValue();

        uint64_t v16 = [v11 count];
        [v7 diskIdentifier];
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        [v17 substringFromIndex:4];
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        [v18 componentsSeparatedByString:@"s"];
        v19 = (void *)objc_claimAutoreleasedReturnValue();

        uint64_t v20 = [v19 count];
        uint64_t v9 = 0LL;
        if (v16 && v20)
        {
          uint64_t v21 = 0LL;
          uint64_t v29 = v20;
          uint64_t v30 = v16;
          if (v16 >= v20) {
            uint64_t v22 = v20;
          }
          else {
            uint64_t v22 = v16;
          }
          if (v22 <= 1) {
            uint64_t v23 = 1LL;
          }
          else {
            uint64_t v23 = v22;
          }
          uint64_t v9 = 1LL;
          do
          {
            objc_msgSend(v11, "objectAtIndexedSubscript:", v21, v29, v30);
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            int v25 = [v24 intValue];

            [v19 objectAtIndexedSubscript:v21];
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            int v27 = [v26 intValue];

            if (v25 < v27)
            {
              uint64_t v9 = -1LL;
              goto LABEL_27;
            }

            if (v25 > v27) {
              goto LABEL_27;
            }
            ++v21;
          }

          while (v23 != v21);
          if (v30 == v29)
          {
            uint64_t v9 = 0LL;
          }

          else if (v30 < v29)
          {
            uint64_t v9 = -1LL;
          }

          else
          {
            uint64_t v9 = 1LL;
          }
        }

- (id)children
{
  uint64_t v26 = *MEMORY[0x1895F89C0];
  if (-[SKDisk isWholeDisk](self, "isWholeDisk"))
  {
    v3 = -[SKDisk diskIdentifier](self, "diskIdentifier");
    if (v3)
    {
      +[SKBaseManager sharedManager](&OBJC_CLASS___SKBaseManager, "sharedManager");
      id v4 = (void *)objc_claimAutoreleasedReturnValue();
      [v4 allDisks];
      id v5 = (void *)objc_claimAutoreleasedReturnValue();

      [MEMORY[0x189603FA8] arrayWithCapacity:2];
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      BOOL v6 = -[SKDisk isLiveFSAPFSDisk](self, "isLiveFSAPFSDisk");
      id v7 = objc_alloc(NSString);
      uint64_t v8 = -[SKDisk diskIdentifier](self, "diskIdentifier");
      uint64_t v9 = (void *)v8;
      if (v6) {
        unint64_t v10 = @"%@/";
      }
      else {
        unint64_t v10 = @"%@s";
      }
      v11 = (void *)objc_msgSend(v7, "initWithFormat:", v10, v8);

      __int128 v23 = 0u;
      __int128 v24 = 0u;
      __int128 v21 = 0u;
      __int128 v22 = 0u;
      id v12 = v5;
      uint64_t v13 = [v12 countByEnumeratingWithState:&v21 objects:v25 count:16];
      if (v13)
      {
        uint64_t v14 = v13;
        uint64_t v15 = *(void *)v22;
        do
        {
          for (uint64_t i = 0LL; i != v14; ++i)
          {
            if (*(void *)v22 != v15) {
              objc_enumerationMutation(v12);
            }
            v17 = *(void **)(*((void *)&v21 + 1) + 8 * i);
            [v17 diskIdentifier];
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            int v19 = [v18 hasPrefix:v11];

            if (v19) {
              [v3 addObject:v17];
            }
          }

          uint64_t v14 = [v12 countByEnumeratingWithState:&v21 objects:v25 count:16];
        }

        while (v14);
      }

      +[SKDisk sortWithDisks:](&OBJC_CLASS___SKDisk, "sortWithDisks:", v3);
    }
  }

  else
  {
    v3 = 0LL;
  }

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()])
  {
    id v5 = v4;
    -[SKDisk mediaUUID](self, "mediaUUID");
    BOOL v6 = (void *)objc_claimAutoreleasedReturnValue();
    [v5 mediaUUID];
    id v7 = (void *)objc_claimAutoreleasedReturnValue();
    int v8 = isEqualOrBothNil((unint64_t)v6, (uint64_t)v7);

    if (v8)
    {
      -[SKDisk diskIdentifier](self, "diskIdentifier");
      uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue();
      [v5 diskIdentifier];
      unint64_t v10 = (void *)objc_claimAutoreleasedReturnValue();
      char v11 = isEqualOrBothNil((unint64_t)v9, (uint64_t)v10);
    }

    else
    {
      char v11 = 0;
    }
  }

  else
  {
    char v11 = 0;
  }

  return v11;
}

- (unint64_t)hash
{
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  -[SKDisk diskIdentifier](self, "diskIdentifier");
  id v4 = (void *)objc_claimAutoreleasedReturnValue();
  unint64_t v5 = [v4 hash];
  if (v3)
  {
    -[SKDisk mediaUUID](self, "mediaUUID");
    BOOL v6 = (void *)objc_claimAutoreleasedReturnValue();
    v5 ^= [v6 hash];
  }

  return v5;
}

- (id)supportedFilesystems
{
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  [v2 formatableFileSystems];
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (BOOL)canResize
{
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ([v3 isEqualToString:kSKDiskFileSystemHFS[0]])
  {
    -[SKDisk filesystem](self, "filesystem");
    id v4 = (void *)objc_claimAutoreleasedReturnValue();
    char v5 = [v4 isJournaled];
  }

  else
  {
    char v5 = 0;
  }

  return v5;
}

- (BOOL)isExternal
{
  if (-[SKDisk isInternal](self, "isInternal")) {
    return 0;
  }
  else {
    return !-[SKDisk isDiskImage](self, "isDiskImage");
  }
}

- (BOOL)isTrusted
{
  BOOL v3 = -[SKDisk isInternal](self, "isInternal");
  if (v3) {
    LOBYTE(v3) = !-[SKDisk isRemovable](self, "isRemovable");
  }
  return v3;
}

- (void)expireCacheWithOptions:(unint64_t)a3 completionBlock:(id)a4
{
  id v6 = a4;
  +[SKHelperClient sharedClient](&OBJC_CLASS___SKHelperClient, "sharedClient");
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  [v7 recacheDisk:self options:a3 callbackBlock:v6];
}

- (void)expireCacheWithCompletionBlock:(id)a3
{
  id v4 = a3;
  +[SKHelperClient sharedClient](&OBJC_CLASS___SKHelperClient, "sharedClient");
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  [v5 recacheDisk:self options:0 callbackBlock:v4];
}

- (void)expireCache
{
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  [v3 recacheDisk:self options:0 callbackBlock:0];
}

- (void)recacheWithOptions:(unint64_t)a3
{
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  [v5 recacheDisk:self options:a3 blocking:1 callbackBlock:0];
}

- (BOOL)canBoot
{
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (([v2 isEqualToString:kSKDiskRoleMacSystem[0]] & 1) != 0
    || ([v2 isEqualToString:kSKDiskRoleLegacyMacSystem[0]] & 1) != 0)
  {
    char v3 = 1;
  }

  else
  {
    char v3 = [v2 isEqualToString:kSKDiskRoleWindowsSystem[0]];
  }

  return v3;
}

- (BOOL)canBeErasedToRole:(id)a3
{
  char v3 = (void *)MEMORY[0x189604010];
  id v4 = kSKDiskRoleLegacyMacData[0];
  id v5 = kSKDiskRoleMacData[0];
  id v6 = kSKDiskRoleWindowsData[0];
  id v7 = kSKDiskRoleDigitalCameraData[0];
  int v8 = kSKDiskRoleExternalMedia[0];
  id v9 = a3;
  objc_msgSend(v3, "setWithObjects:", v4, v5, v6, v7, v8, 0);
  unint64_t v10 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v4) = [v10 containsObject:v9];

  return (char)v4;
}

- (id)innerDescriptionWithPrivateData:(BOOL)a3
{
  if (self->_isValid) {
    char v3 = @"Yes";
  }
  else {
    char v3 = @"No";
  }
  mediaUUID = @"None";
  volumeUUID = (const __CFString *)self->_volumeUUID;
  if (!volumeUUID) {
    volumeUUID = @"None";
  }
  if (self->_mediaUUID) {
    mediaUUID = (const __CFString *)self->_mediaUUID;
  }
  return (id)[NSString stringWithFormat:@"Role: %@, Type: %@, Valid: %@, Volume UUID: %@, Media UUID: %@", self->_role, self->_type, v3, volumeUUID, mediaUUID];
}

- (id)redactedDescription
{
  v2 = self;
  objc_sync_enter(v2);
  char v3 = (void *)NSString;
  id v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  id v5 = (void *)objc_claimAutoreleasedReturnValue();
  diskObjectID = v2->_diskObjectID;
  diskIdentifier = (const __CFString *)v2->_diskIdentifier;
  mountPoint = v2->_mountPoint;
  uint64_t v9 = -[SKDisk innerDescriptionWithPrivateData:](v2, "innerDescriptionWithPrivateData:", 0LL);
  unint64_t v10 = (void *)v9;
  char v11 = @"None";
  if (diskIdentifier) {
    char v11 = diskIdentifier;
  }
  id v12 = @"Yes";
  [v3 stringWithFormat:@"<%@: [%@] { BSD Name: %@, Mounted: %@, %@ }>", v5, diskObjectID, v11, v12, v9];
  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_sync_exit(v2);
  return v13;
}

- (id)description
{
  v2 = self;
  objc_sync_enter(v2);
  char v3 = (void *)NSString;
  id v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  id v5 = (void *)objc_claimAutoreleasedReturnValue();
  diskObjectID = v2->_diskObjectID;
  volumeName = (const __CFString *)v2->_volumeName;
  diskIdentifier = (const __CFString *)v2->_diskIdentifier;
  mountPoint = (const __CFString *)v2->_mountPoint;
  uint64_t v10 = -[SKDisk innerDescriptionWithPrivateData:](v2, "innerDescriptionWithPrivateData:", 1LL);
  char v11 = (void *)v10;
  id v12 = @"Not Mounted";
  uint64_t v13 = @"None";
  if (diskIdentifier) {
    uint64_t v13 = diskIdentifier;
  }
  uint64_t v14 = &stru_18A323F58;
  if (volumeName) {
    uint64_t v14 = volumeName;
  }
  [v3 stringWithFormat:@"<%@: [%@] { Volume Name: %@, BSD Name: %@, Mount point: %@, %@ }>", v5, diskObjectID, v14, v13, v12, v10];
  uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue();

  objc_sync_exit(v2);
  return v15;
}

- (id)wholeDiskIdentifier
{
  char v3 = (void *)objc_claimAutoreleasedReturnValue();
  [v3 substringFromIndex:4];
  id v4 = (void *)objc_claimAutoreleasedReturnValue();

  [v4 componentsSeparatedByString:@"s"];
  id v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((unint64_t)[v5 count] >= 2)
  {
    -[SKDisk contentDiskIdentifier](self, "contentDiskIdentifier");
    id v7 = (void *)objc_claimAutoreleasedReturnValue();
    [v7 substringToIndex:4];
    int v8 = (void *)objc_claimAutoreleasedReturnValue();
    [v5 objectAtIndexedSubscript:0];
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue();
    [v8 stringByAppendingString:v9];
    id v6 = (void *)objc_claimAutoreleasedReturnValue();
  }

  else
  {
    id v6 = 0LL;
  }

  return v6;
}

- (id)cachedWholeDiskByIdentifier
{
  uint64_t v18 = *MEMORY[0x1895F89C0];
  v2 = -[SKDisk wholeDiskIdentifier](self, "wholeDiskIdentifier");
  if (v2)
  {
    +[SKBaseManager sharedManager](&OBJC_CLASS___SKBaseManager, "sharedManager");
    char v3 = (void *)objc_claimAutoreleasedReturnValue();
    [v3 allDisks];
    id v4 = (void *)objc_claimAutoreleasedReturnValue();

    __int128 v15 = 0u;
    __int128 v16 = 0u;
    __int128 v13 = 0u;
    __int128 v14 = 0u;
    id v5 = v4;
    id v6 = (id)[v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
    if (v6)
    {
      uint64_t v7 = *(void *)v14;
      while (2)
      {
        for (uint64_t i = 0LL; i != v6; uint64_t i = (char *)i + 1)
        {
          if (*(void *)v14 != v7) {
            objc_enumerationMutation(v5);
          }
          uint64_t v9 = *(void **)(*((void *)&v13 + 1) + 8LL * (void)i);
          objc_msgSend(v9, "diskIdentifier", (void)v13);
          uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue();
          char v11 = [v10 isEqualToString:v2];

          if ((v11 & 1) != 0)
          {
            id v6 = v9;
            goto LABEL_12;
          }
        }

        id v6 = (id)[v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
        if (v6) {
          continue;
        }
        break;
      }
    }

- (BOOL)isVirtualDiskType
{
  return 0;
}

- (BOOL)isIOMediaDisk
{
  if (-[SKDisk isLiveFSAPFSDisk](self, "isLiveFSAPFSDisk")) {
    return 0;
  }
  else {
    return !-[SKDisk isIOSRootSnapshot](self, "isIOSRootSnapshot");
  }
}

- (BOOL)isLiveFSAPFSDisk
{
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  char v3 = [v2 hasPrefix:@"apfs://disk"];

  return v3;
}

- (BOOL)isIOSRootSnapshot
{
  return objc_opt_isKindOfClass() & 1;
}

- (BOOL)rename:(id)a3 withCompletionBlock:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  +[SKHelperClient sharedClient](&OBJC_CLASS___SKHelperClient, "sharedClient");
  int v8 = (void *)objc_claimAutoreleasedReturnValue();
  [v8 renameDisk:self to:v7 withCompletionBlock:v6];

  return 1;
}

- (BOOL)unmountWithCompletionBlock:(id)a3
{
  id v4 = a3;
  +[SKHelperClient sharedClient](&OBJC_CLASS___SKHelperClient, "sharedClient");
  id v5 = (void *)objc_claimAutoreleasedReturnValue();
  [v5 unmountDisk:self withCompletionBlock:v4];

  return 1;
}

- (BOOL)unmountWithOptions:(id)a3 completionBlock:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  +[SKHelperClient sharedClient](&OBJC_CLASS___SKHelperClient, "sharedClient");
  int v8 = (void *)objc_claimAutoreleasedReturnValue();
  [v8 unmountDisk:self options:v7 withCompletionBlock:v6];

  return 1;
}

- (BOOL)unmountWithOptions:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v7 = objc_alloc_init(&OBJC_CLASS___SKSyncCommand);
  +[SKHelperClient sharedClient](&OBJC_CLASS___SKHelperClient, "sharedClient");
  int v8 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1895F87A8];
  v11[1] = 3221225472LL;
  v11[2] = __35__SKDisk_unmountWithOptions_error___block_invoke;
  v11[3] = &unk_18A323698;
  id v12 = v7;
  uint64_t v9 = v7;
  [v8 unmountDisk:self options:v6 blocking:1 withCompletionBlock:v11];

  LOBYTE(a4) = -[SKSyncCommand returnWithError:](v9, "returnWithError:", a4);
  return (char)a4;
}

uint64_t __35__SKDisk_unmountWithOptions_error___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) onCallbackWithError:a2];
}

- (BOOL)mountWithCompletionBlock:(id)a3
{
  return -[SKDisk mountWithOptions:withCompletionBlock:](self, "mountWithOptions:withCompletionBlock:", 0LL, a3);
}

- (BOOL)mountWithOptions:(id)a3 withCompletionBlock:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  [MEMORY[0x189603FC8] dictionaryWithCapacity:1];
  int v8 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v9 = v8;
  if (v6) {
    [v8 setObject:v6 forKey:@"kSKDiskMountOptionToolOptions"];
  }
  BOOL v10 = -[SKDisk mountWithOptionsDictionary:withCompletionBlock:]( self,  "mountWithOptionsDictionary:withCompletionBlock:",  v9,  v7);

  return v10;
}

- (BOOL)mountWithOptionsDictionary:(id)a3 withCompletionBlock:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  +[SKHelperClient sharedClient](&OBJC_CLASS___SKHelperClient, "sharedClient");
  int v8 = (void *)objc_claimAutoreleasedReturnValue();
  [v8 mountDisk:self options:v7 completionBlock:v6];

  return 1;
}

- (BOOL)mountWithOptionsDictionary:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v7 = objc_alloc_init(&OBJC_CLASS___SKSyncCommand);
  +[SKHelperClient sharedClient](&OBJC_CLASS___SKHelperClient, "sharedClient");
  int v8 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1895F87A8];
  v11[1] = 3221225472LL;
  v11[2] = __43__SKDisk_mountWithOptionsDictionary_error___block_invoke;
  v11[3] = &unk_18A323698;
  id v12 = v7;
  uint64_t v9 = v7;
  [v8 mountDisk:self options:v6 blocking:1 completionBlock:v11];

  LOBYTE(a4) = -[SKSyncCommand returnWithError:](v9, "returnWithError:", a4);
  return (char)a4;
}

uint64_t __43__SKDisk_mountWithOptionsDictionary_error___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) onCallbackWithError:a2];
}

- (BOOL)mountWithParams:(id)a3 error:(id *)a4
{
  id v6 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a4) = -[SKDisk mountWithOptionsDictionary:error:](self, "mountWithOptionsDictionary:error:", v6, a4);

  return (char)a4;
}

- (BOOL)ejectWithCompletionBlock:(id)a3
{
  id v4 = a3;
  +[SKHelperClient sharedClient](&OBJC_CLASS___SKHelperClient, "sharedClient");
  id v5 = (void *)objc_claimAutoreleasedReturnValue();
  [v5 ejectDisk:self withCompletionBlock:v4];

  return 1;
}

- (BOOL)ejectWithError:(id *)a3
{
  id v5 = objc_alloc_init(&OBJC_CLASS___SKSyncCommand);
  +[SKHelperClient sharedClient](&OBJC_CLASS___SKHelperClient, "sharedClient");
  id v6 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1895F87A8];
  v9[1] = 3221225472LL;
  v9[2] = __25__SKDisk_ejectWithError___block_invoke;
  v9[3] = &unk_18A323698;
  BOOL v10 = v5;
  id v7 = v5;
  [v6 ejectDisk:self blocking:1 withCompletionBlock:v9];

  LOBYTE(a3) = -[SKSyncCommand returnWithError:](v7, "returnWithError:", a3);
  return (char)a3;
}

uint64_t __25__SKDisk_ejectWithError___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) onCallbackWithError:a2];
}

- (id)resizeToSize:(unint64_t)a3 completionBlock:(id)a4
{
  id v6 = a4;
  +[SKProgress progressWithTotalUnitCount:](&OBJC_CLASS___SKProgress, "progressWithTotalUnitCount:", 100LL);
  id v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[SKHelperClient sharedClient](&OBJC_CLASS___SKHelperClient, "sharedClient");
  int v8 = (void *)objc_claimAutoreleasedReturnValue();
  [v8 resize:self toSize:a3 completionBlock:v6];
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue();

  [v7 chainChildProgress:v9 withPendingUnitCount:100];
  return v7;
}

- (void)resize:(unint64_t)a3 completion:(id)a4
{
  id v8 = a4;
  +[SKHelperClient sharedClient](&OBJC_CLASS___SKHelperClient, "sharedClient");
  id v6 = (void *)objc_claimAutoreleasedReturnValue();
  id v7 = (id)[v6 resize:self toSize:a3 completionBlock:v8];
}

- (NSString)type
{
  return (NSString *)objc_getProperty(self, a2, 32LL, 1);
}

- (void)setType:(id)a3
{
}

- (NSString)filesystemType
{
  return (NSString *)objc_getProperty(self, a2, 40LL, 1);
}

- (void)setFilesystemType:(id)a3
{
}

- (BOOL)isValid
{
  return self->_isValid;
}

- (void)setIsValid:(BOOL)a3
{
  self->_isValid = a3;
}

- (NSString)volumeName
{
  return (NSString *)objc_getProperty(self, a2, 48LL, 1);
}

- (void)setVolumeName:(id)a3
{
}

- (NSString)volumeUUID
{
  return (NSString *)objc_getProperty(self, a2, 56LL, 1);
}

- (void)setVolumeUUID:(id)a3
{
}

- (NSString)mediaUUID
{
  return (NSString *)objc_getProperty(self, a2, 64LL, 1);
}

- (void)setMediaUUID:(id)a3
{
}

- (NSString)mountPoint
{
  return (NSString *)objc_getProperty(self, a2, 72LL, 1);
}

- (void)setMountPoint:(id)a3
{
}

- (unint64_t)freeSpace
{
  return self->_freeSpace;
}

- (void)setFreeSpace:(unint64_t)a3
{
  self->_freeSpace = a3;
}

- (unint64_t)purgeableSpace
{
  return self->_purgeableSpace;
}

- (void)setPurgeableSpace:(unint64_t)a3
{
  self->_purgeableSpace = a3;
}

- (unint64_t)availableSpace
{
  return self->_availableSpace;
}

- (void)setAvailableSpace:(unint64_t)a3
{
  self->_availableSpace = a3;
}

- (unint64_t)totalSpace
{
  return self->_totalSpace;
}

- (void)setTotalSpace:(unint64_t)a3
{
  self->_totalSpace = a3;
}

- (NSString)diskIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 112LL, 1);
}

- (void)setDiskIdentifier:(id)a3
{
}

- (BOOL)isDiskImage
{
  return self->_isDiskImage;
}

- (void)setIsDiskImage:(BOOL)a3
{
  self->_isDiskImage = a3;
}

- (BOOL)isInternal
{
  return self->_isInternal;
}

- (void)setIsInternal:(BOOL)a3
{
  self->_isInternal = a3;
}

- (BOOL)isRemovable
{
  return self->_isRemovable;
}

- (void)setIsRemovable:(BOOL)a3
{
  self->_isRemovable = a3;
}

- (BOOL)isWholeDisk
{
  return self->_isWholeDisk;
}

- (void)setIsWholeDisk:(BOOL)a3
{
  self->_isWholeDisk = a3;
}

- (BOOL)isPhysicalDisk
{
  return self->_isPhysicalDisk;
}

- (void)setIsPhysicalDisk:(BOOL)a3
{
  self->_isPhysicalDisk = a3;
}

- (BOOL)canPartitionDisk
{
  return self->_canPartitionDisk;
}

- (void)setCanPartitionDisk:(BOOL)a3
{
  self->_canPartitionDisk = a3;
}

- (BOOL)supportsJournaling
{
  return self->_supportsJournaling;
}

- (void)setSupportsJournaling:(BOOL)a3
{
  self->_supportsJournaling = a3;
}

- (BOOL)isJournaled
{
  return self->_isJournaled;
}

- (void)setIsJournaled:(BOOL)a3
{
  self->_isJournaled = a3;
}

- (BOOL)isLocked
{
  return self->_isLocked;
}

- (void)setIsLocked:(BOOL)a3
{
  self->_isLocked = a3;
}

- (NSString)ioContent
{
  return (NSString *)objc_getProperty(self, a2, 120LL, 1);
}

- (void)setIoContent:(id)a3
{
}

- (BOOL)supportsRepair
{
  return self->_supportsRepair;
}

- (void)setSupportsRepair:(BOOL)a3
{
  self->_supportsRepair = a3;
}

- (BOOL)supportsVerify
{
  return self->_supportsVerify;
}

- (void)setSupportsVerify:(BOOL)a3
{
  self->_supportsVerify = a3;
}

- (unint64_t)unformattedSize
{
  return self->_unformattedSize;
}

- (void)setUnformattedSize:(unint64_t)a3
{
  self->_unformattedSize = a3;
}

- (BOOL)isCaseSensitive
{
  return self->_isCaseSensitive;
}

- (void)setIsCaseSensitive:(BOOL)a3
{
  self->_isCaseSensitive = a3;
}

- (unint64_t)childCount
{
  return self->_childCount;
}

- (void)setChildCount:(unint64_t)a3
{
  self->_childCount = a3;
}

- (unint64_t)startLocation
{
  return self->_startLocation;
}

- (void)setStartLocation:(unint64_t)a3
{
  self->_startLocation = a3;
}

- (SKFilesystem)filesystem
{
  return (SKFilesystem *)objc_getProperty(self, a2, 152LL, 1);
}

- (void)setFilesystem:(id)a3
{
}

- (NSString)role
{
  return (NSString *)objc_getProperty(self, a2, 160LL, 1);
}

- (void)setRole:(id)a3
{
}

- (BOOL)isOSInternal
{
  return self->_isOSInternal;
}

- (void)setIsOSInternal:(BOOL)a3
{
  self->_isOSInternal = a3;
}

- (BOOL)isPartitionDisk
{
  return self->_isPartitionDisk;
}

- (void)setIsPartitionDisk:(BOOL)a3
{
  self->_isPartitionDisk = a3;
}

- (BOOL)isWritable
{
  return self->_isWritable;
}

- (void)setIsWritable:(BOOL)a3
{
  self->_isWritable = a3;
}

- (BOOL)isMediaWritable
{
  return self->_isMediaWritable;
}

- (void)setIsMediaWritable:(BOOL)a3
{
  self->_isMediaWritable = a3;
}

- (NSNumber)diskObjectID
{
  return self->_diskObjectID;
}

- (void)setDiskObjectID:(id)a3
{
}

- (NSObject)daDisk
{
  return objc_getProperty(self, a2, 176LL, 1);
}

- (void)setDaDisk:(id)a3
{
}

- (unsigned)ownerUID
{
  return self->_ownerUID;
}

- (void)setOwnerUID:(unsigned int)a3
{
  self->_ownerUID = a3;
}

- (SKDiskPrivateCache)privateCache
{
  return self->_privateCache;
}

- (void)setPrivateCache:(id)a3
{
}

- (void).cxx_destruct
{
}

- (id)formattableFilesystems
{
  if (-[SKDisk isMediaWritable](self, "isMediaWritable"))
  {
    +[SKBaseManager sharedManager](&OBJC_CLASS___SKBaseManager, "sharedManager");
    char v3 = (void *)objc_claimAutoreleasedReturnValue();
    [v3 formatableFileSystems];
    id v4 = (void *)objc_claimAutoreleasedReturnValue();

    if (-[SKDisk isExternal](self, "isExternal"))
    {
      [MEMORY[0x1896079C8] predicateWithBlock:&__block_literal_global_6];
      id v5 = (void *)objc_claimAutoreleasedReturnValue();
      [v4 filteredArrayUsingPredicate:v5];
      id v6 = (void *)objc_claimAutoreleasedReturnValue();
    }

    else
    {
      +[SKFilesystem allFilesystems](&OBJC_CLASS___SKFilesystem, "allFilesystems");
      id v5 = (void *)objc_claimAutoreleasedReturnValue();
      [MEMORY[0x1896079C8] predicateWithBlock:&__block_literal_global_12];
      id v7 = (void *)objc_claimAutoreleasedReturnValue();
      [v4 filteredArrayUsingPredicate:v7];
      id v8 = (void *)objc_claimAutoreleasedReturnValue();

      [MEMORY[0x1896079C8] predicateWithBlock:&__block_literal_global_13_0];
      uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue();
      [v5 filteredArrayUsingPredicate:v9];
      BOOL v10 = (void *)objc_claimAutoreleasedReturnValue();

      [v8 arrayByAddingObjectsFromArray:v10];
      char v11 = (void *)objc_claimAutoreleasedReturnValue();
      [v11 sortedArrayWithOptions:16 usingComparator:&__block_literal_global_15_0];
      id v6 = (void *)objc_claimAutoreleasedReturnValue();
    }
  }

  else
  {
    id v6 = (void *)MEMORY[0x189604A58];
  }

  return v6;
}

uint64_t __39__SKDisk_Erase__formattableFilesystems__block_invoke(uint64_t a1, void *a2)
{
  return [a2 isExtension];
}

uint64_t __39__SKDisk_Erase__formattableFilesystems__block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  [v2 majorType];
  char v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ([v3 isEqualToString:@"hfs"])
  {
    uint64_t v4 = 0LL;
  }

  else
  {
    [v2 majorType];
    id v5 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v4 = [v5 isEqualToString:@"apfs"] ^ 1;
  }

  return v4;
}

uint64_t __39__SKDisk_Erase__formattableFilesystems__block_invoke_3(uint64_t a1, void *a2)
{
  id v2 = a2;
  [v2 majorType];
  char v3 = (void *)objc_claimAutoreleasedReturnValue();
  else {
    uint64_t v4 = 0LL;
  }

  return v4;
}

uint64_t __39__SKDisk_Erase__formattableFilesystems__block_invoke_4(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  id v5 = a3;
  int v6 = [v4 sortPriority];
  if (v6 >= (int)[v5 sortPriority])
  {
    int v8 = [v4 sortPriority];
    uint64_t v7 = v8 > (int)[v5 sortPriority];
  }

  else
  {
    uint64_t v7 = -1LL;
  }

  return v7;
}

- (id)formattableFilesystemWithFilesystem:(id)a3
{
  id v4 = a3;
  -[SKDisk formattableFilesystems](self, "formattableFilesystems");
  id v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (([v5 containsObject:v4] & 1) == 0)
  {
    int v6 = (void *)MEMORY[0x1896079C8];
    v11[0] = MEMORY[0x1895F87A8];
    v11[1] = 3221225472LL;
    v11[2] = __53__SKDisk_Erase__formattableFilesystemWithFilesystem___block_invoke;
    v11[3] = &unk_18A323808;
    id v12 = v4;
    id v7 = v4;
    [v6 predicateWithBlock:v11];
    int v8 = (void *)objc_claimAutoreleasedReturnValue();
    [v5 filteredArrayUsingPredicate:v8];
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue();

    if ([v9 count])
    {
      [v9 firstObject];
      id v4 = (id)objc_claimAutoreleasedReturnValue();
    }

    else
    {
      id v4 = 0LL;
    }
  }

  return v4;
}

uint64_t __53__SKDisk_Erase__formattableFilesystemWithFilesystem___block_invoke(uint64_t a1, void *a2)
{
  return [a2 isExtensionInsensitiveEqual:*(void *)(a1 + 32)];
}

- (BOOL)cleanupWithError:(id *)a3
{
  uint64_t v16 = *MEMORY[0x1895F89C0];
  __int128 v11 = 0u;
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  -[SKDisk children](self, "children", 0LL);
  id v4 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v5 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v12;
    while (2)
    {
      for (uint64_t i = 0LL; i != v6; ++i)
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v4);
        }
        if (![*(id *)(*((void *)&v11 + 1) + 8 * i) cleanupWithError:a3])
        {
          BOOL v9 = 0;
          goto LABEL_11;
        }
      }

      uint64_t v6 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }

  BOOL v9 = 1;
LABEL_11:

  return v9;
}

- (unsigned)getSectorSize
{
  uint64_t v23 = *MEMORY[0x1895F89C0];
  unsigned int v16 = 512;
  -[SKDisk diskIdentifier](self, "diskIdentifier");
  char v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    SKGetOSLog();
    __int128 v11 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      uint64_t v18 = "-[SKDisk(Erase) getSectorSize]";
      __int16 v19 = 2112;
      uint64_t v20 = self;
      __int128 v12 = "%s: Disk %@, does not have a BSD name";
      __int128 v13 = v11;
      uint32_t v14 = 22;
LABEL_12:
      _os_log_impl(&dword_188F75000, v13, OS_LOG_TYPE_ERROR, v12, buf, v14);
    }

- (BOOL)wipeDiskWithError:(id *)a3
{
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
  {
    __int128 v13 = @"Disk does not have a BSD name";
    uint64_t v14 = 22LL;
    return +[SKError failWithPOSIXCode:debugDescription:error:]( &OBJC_CLASS___SKError,  "failWithPOSIXCode:debugDescription:error:",  v14,  v13,  a3);
  }

  id v6 = (void *)NSString;
  -[SKDisk diskIdentifier](self, "diskIdentifier");
  int v7 = (void *)objc_claimAutoreleasedReturnValue();
  id v8 = [v6 stringWithFormat:@"/dev/r%@", v7];
  int v9 = open((const char *)[v8 fileSystemRepresentation], 2);

  if (v9 < 0)
  {
    uint64_t v14 = *__error();
    __int128 v13 = @"Failed to open disk";
    return +[SKError failWithPOSIXCode:debugDescription:error:]( &OBJC_CLASS___SKError,  "failWithPOSIXCode:debugDescription:error:",  v14,  v13,  a3);
  }

  -[SKDisk getSectorSize](self, "getSectorSize");
  uint64_t v10 = wipefs_alloc();
  if ((_DWORD)v10)
  {
    uint64_t v11 = v10;
    close(v9);
    __int128 v12 = @"wipefs_alloc failed";
  }

  else
  {
    uint64_t v11 = wipefs_wipe();
    wipefs_free();
    close(v9);
    if (!(_DWORD)v11) {
      return 1;
    }
    __int128 v12 = @"wipefs_wipe failed";
  }

  return +[SKError failWithPOSIXCode:debugDescription:error:]( &OBJC_CLASS___SKError,  "failWithPOSIXCode:debugDescription:error:",  v11,  v12,  a3);
}

- (void)updateWithDictionary:(uint8_t *)buf .cold.1(void *a1, void *a2, uint8_t *buf, os_log_t log)
{
  *(_DWORD *)buf = 138543618;
  *(void *)(buf + 4) = a1;
  *((_WORD *)buf + 6) = 2114;
  *(void *)(buf + 14) = a2;
  _os_log_impl(&dword_188F75000, log, OS_LOG_TYPE_ERROR, "Invalid Class Update: %{public}@ -> %{public}@", buf, 0x16u);
}

@end