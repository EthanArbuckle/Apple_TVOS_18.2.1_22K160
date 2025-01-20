@interface SKPartitionTable
+ (BOOL)updatePartitionTypeWithPartitions:(id)a3 partID:(id)a4 newType:(id)a5 error:(id *)a6;
+ (__MKMedia)createMediaRefWithDisk:(id)a3 error:(id *)a4;
+ (id)partitionIDFromDisk:(id)a3;
- (BOOL)allocateMediaRef:(id *)a3;
- (BOOL)fitToContainerSize:(unint64_t)a3 error:(id *)a4;
- (BOOL)overwriteExistingMediaLayout:(id)a3 opts:(__CFDictionary *)a4 partitionScheme:(int)a5;
- (BOOL)overwriteExistingMediaLayout:(id)a3 opts:(__CFDictionary *)a4 partitionScheme:(int)a5 size:(unint64_t)a6;
- (BOOL)overwritePartitionAt:(id)a3 filesystem:(id)a4 error:(id *)a5;
- (BOOL)resizePartitionID:(id)a3 size:(unint64_t)a4 offset:(unint64_t)a5 error:(id *)a6;
- (BOOL)writeNewMediaLayout:(id)a3 partitionScheme:(unint64_t)a4;
- (BOOL)writePartitionScheme:(unint64_t)a3 error:(id *)a4;
- (NSMutableArray)partitions;
- (SKDisk)disk;
- (SKPartitionTable)initWithDisk:(id)a3 error:(id *)a4;
- (__MKMedia)mediaRef;
- (unsigned)sectorSize;
- (void)dealloc;
- (void)flushMediaRef;
- (void)setDisk:(id)a3;
- (void)setMediaRef:(__MKMedia *)a3;
- (void)setPartitions:(id)a3;
- (void)setSectorSize:(unsigned int)a3;
@end

@implementation SKPartitionTable

+ (__MKMedia)createMediaRefWithDisk:(id)a3 error:(id *)a4
{
  v21[2] = *MEMORY[0x1895F89C0];
  id v5 = a3;
  v6 = (void *)NSString;
  [v5 diskIdentifier];
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  id v8 = [v6 stringWithFormat:@"/dev/r%@", v7];
  [v8 fileSystemRepresentation];

  v20[0] = @"Writable";
  v20[1] = @"Shared Writer";
  v21[0] = MEMORY[0x189604A88];
  v21[1] = MEMORY[0x189604A88];
  [MEMORY[0x189603F68] dictionaryWithObjects:v21 forKeys:v20 count:2];
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (__MKMedia *)MKMediaCreateWithPath();
  if (!v10)
  {
    SKGetOSLog();
    v11 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315650;
      v15 = "+[SKPartitionTable createMediaRefWithDisk:error:]";
      __int16 v16 = 2112;
      id v17 = v5;
      __int16 v18 = 1024;
      int v19 = 0;
      _os_log_impl( &dword_188F75000,  v11,  OS_LOG_TYPE_ERROR,  "%s: Failed to create media ref with disk %@, MK err %d",  buf,  0x1Cu);
    }

    id v12 = +[SKError nilWithPOSIXCode:error:](&OBJC_CLASS___SKError, "nilWithPOSIXCode:error:", 0LL, a4);
    v10 = 0LL;
  }

  return v10;
}

- (SKPartitionTable)initWithDisk:(id)a3 error:(id *)a4
{
  v26[1] = *MEMORY[0x1895F89C0];
  id v6 = a3;
  v22.receiver = self;
  v22.super_class = (Class)&OBJC_CLASS___SKPartitionTable;
  v7 = -[SKPartitionTable init](&v22, sel_init);
  if (v7)
  {
    uint64_t v8 = [MEMORY[0x189603FA8] array];
    partitions = v7->_partitions;
    v7->_partitions = (NSMutableArray *)v8;
    v10 = +[SKBaseManager sharedManager](&OBJC_CLASS___SKBaseManager, "sharedManager");
    [v10 wholeDiskForDisk:v6];
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v11)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0) {
        goto LABEL_11;
      }
      [v6 container];
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v11) {
        goto LABEL_11;
      }
    }

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      uint64_t v12 = [v11 designatedPhysicalStore];
      if (!v12)
      {
        v26[0] = v11;
        [MEMORY[0x189603F18] arrayWithObjects:v26 count:1];
        int v19 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = +[SKError errorWithCode:disks:userInfo:]( &OBJC_CLASS___SKError,  "errorWithCode:disks:userInfo:",  117LL,  v19,  0LL);
        +[SKError nilWithError:error:](&OBJC_CLASS___SKError, "nilWithError:error:", v20, a4);
        __int16 v18 = (SKPartitionTable *)objc_claimAutoreleasedReturnValue();

        goto LABEL_16;
      }

      v13 = (void *)v12;
      v14 = +[SKBaseManager sharedManager](&OBJC_CLASS___SKBaseManager, "sharedManager");
      uint64_t v15 = [v14 wholeDiskForDisk:v13];

      id v6 = v13;
      v11 = (void *)v15;
      if (!v15)
      {
LABEL_11:
        id v25 = v6;
        [MEMORY[0x189603F18] arrayWithObjects:&v25 count:1];
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        +[SKError errorWithCode:disks:userInfo:]( &OBJC_CLASS___SKError,  "errorWithCode:disks:userInfo:",  117LL,  v11,  0LL);
        int v19 = (void *)objc_claimAutoreleasedReturnValue();
        +[SKError nilWithError:error:](&OBJC_CLASS___SKError, "nilWithError:error:", v19, a4);
        __int16 v18 = (SKPartitionTable *)objc_claimAutoreleasedReturnValue();
LABEL_16:

        goto LABEL_17;
      }
    }

    objc_storeStrong((id *)&v7->_disk, v11);
    v7->_sectorSize = [v11 getSectorSize];
    __int16 v16 = (void *)objc_opt_class();
    -[SKPartitionTable disk](v7, "disk");
    id v17 = (void *)objc_claimAutoreleasedReturnValue();
    v7->_mediaRef = (__MKMedia *)[v16 createMediaRefWithDisk:v17 error:a4];

    if (!v7->_mediaRef)
    {
      SKGetOSLog();
      int v19 = (void *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled((os_log_t)v19, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315138;
        v24 = "-[SKPartitionTable initWithDisk:error:]";
        _os_log_impl(&dword_188F75000, (os_log_t)v19, OS_LOG_TYPE_ERROR, "%s: Failed to create media ref", buf, 0xCu);
      }

      __int16 v18 = 0LL;
      goto LABEL_16;
    }
  }

  __int16 v18 = v7;
LABEL_17:

  return v18;
}

- (void)dealloc
{
  mediaRef = self->_mediaRef;
  if (mediaRef) {
    CFRelease(mediaRef);
  }
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___SKPartitionTable;
  -[SKPartitionTable dealloc](&v4, sel_dealloc);
}

- (BOOL)writeNewMediaLayout:(id)a3 partitionScheme:(unint64_t)a4
{
  uint64_t v17 = *MEMORY[0x1895F89C0];
  id v5 = a3;
  int v12 = 0;
  if (MKCFCreateMedia())
  {
    -[SKPartitionTable sectorSize](self, "sectorSize");
    -[SKPartitionTable sectorSize](self, "sectorSize");
    v11 = -[SKPartitionTable mediaRef](self, "mediaRef");
    MKCFCreateMap();
    -[SKPartitionTable mediaRef](self, "mediaRef", v11, &v12, 0LL);
    int v12 = MKCFWriteMedia();
    if (v12)
    {
      SKGetOSLog();
      v10 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315394;
        v14 = "-[SKPartitionTable writeNewMediaLayout:partitionScheme:]";
        __int16 v15 = 1024;
        int v16 = v12;
        _os_log_impl(&dword_188F75000, v10, OS_LOG_TYPE_ERROR, "%s: Failed to write scheme, MK err %d", buf, 0x12u);
      }
    }

    MKCFDisposeMedia();
    BOOL v8 = v12 == 0;
  }

  else
  {
    +[SKBaseManager sharedManager](&OBJC_CLASS___SKBaseManager, "sharedManager");
    id v6 = (void *)objc_claimAutoreleasedReturnValue();
    [v6 logEvent:@"com.apple.StorageKit.log.fault" eventPayloadBuilder:&__block_literal_global_45];

    SKGetOSLog();
    v7 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 136315394;
      v14 = "-[SKPartitionTable writeNewMediaLayout:partitionScheme:]";
      __int16 v15 = 1024;
      int v16 = v12;
      _os_log_impl(&dword_188F75000, v7, OS_LOG_TYPE_FAULT, "%s: Failed to create media, MK err %d", buf, 0x12u);
    }

    BOOL v8 = 0;
  }

  return v8;
}

id __56__SKPartitionTable_writeNewMediaLayout_partitionScheme___block_invoke()
{
  v4[1] = *MEMORY[0x1895F89C0];
  v3 = @"faultCode";
  base64Encode((uint64_t)"SKPartitionTable.m", 141LL);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = v0;
  [MEMORY[0x189603F68] dictionaryWithObjects:v4 forKeys:&v3 count:1];
  v1 = (void *)objc_claimAutoreleasedReturnValue();

  return v1;
}

id __56__SKPartitionTable_writeNewMediaLayout_partitionScheme___block_invoke_49()
{
  v4[1] = *MEMORY[0x1895F89C0];
  v3 = @"faultCode";
  base64Encode((uint64_t)"SKPartitionTable.m", 149LL);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = v0;
  [MEMORY[0x189603F68] dictionaryWithObjects:v4 forKeys:&v3 count:1];
  v1 = (void *)objc_claimAutoreleasedReturnValue();

  return v1;
}

- (BOOL)overwriteExistingMediaLayout:(id)a3 opts:(__CFDictionary *)a4 partitionScheme:(int)a5
{
  return -[SKPartitionTable overwriteExistingMediaLayout:opts:partitionScheme:size:]( self,  "overwriteExistingMediaLayout:opts:partitionScheme:size:",  a3,  a4,  *(void *)&a5,  0LL);
}

- (BOOL)overwriteExistingMediaLayout:(id)a3 opts:(__CFDictionary *)a4 partitionScheme:(int)a5 size:(unint64_t)a6
{
  uint64_t v22 = *MEMORY[0x1895F89C0];
  id v7 = a3;
  int v17 = 0;
  -[SKPartitionTable mediaRef](self, "mediaRef");
  BOOL v8 = (const __CFDictionary *)MKCFReadMedia();
  if (!v8)
  {
    SKGetOSLog();
    v10 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      int v19 = "-[SKPartitionTable overwriteExistingMediaLayout:opts:partitionScheme:size:]";
      __int16 v20 = 1024;
      int v21 = v17;
      _os_log_impl(&dword_188F75000, v10, OS_LOG_TYPE_ERROR, "%s: Failed to read media, MK err %d", buf, 0x12u);
    }

    goto LABEL_10;
  }

  Value = (const __CFArray *)CFDictionaryGetValue(v8, @"Schemes");
  -[SKPartitionTable sectorSize](self, "sectorSize");
  int v16 = -[SKPartitionTable mediaRef](self, "mediaRef");
  MKCFCreateMap();
  CFArrayGetValueAtIndex(Value, 1LL);
  -[SKPartitionTable mediaRef](self, "mediaRef", v16, &v17);
  int v17 = MKCFUpdateScheme();
  if (v17)
  {
    v11 = +[SKBaseManager sharedManager](&OBJC_CLASS___SKBaseManager, "sharedManager");
    [v11 logEvent:@"com.apple.StorageKit.log.fault" eventPayloadBuilder:&__block_literal_global_60];

    SKGetOSLog();
    int v12 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 136315394;
      int v19 = "-[SKPartitionTable overwriteExistingMediaLayout:opts:partitionScheme:size:]";
      __int16 v20 = 1024;
      int v21 = v17;
      _os_log_impl(&dword_188F75000, v12, OS_LOG_TYPE_FAULT, "%s: Failed to update scheme, MK err %d", buf, 0x12u);
    }

    MKCFDisposeMedia();
LABEL_10:
    BOOL v13 = 0;
    goto LABEL_11;
  }

  -[SKPartitionTable mediaRef](self, "mediaRef");
  int v17 = MKCFWriteScheme();
  if (v17)
  {
    SKGetOSLog();
    __int16 v15 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      int v19 = "-[SKPartitionTable overwriteExistingMediaLayout:opts:partitionScheme:size:]";
      __int16 v20 = 1024;
      int v21 = v17;
      _os_log_impl(&dword_188F75000, v15, OS_LOG_TYPE_ERROR, "%s: Failed to write scheme, MK err %d", buf, 0x12u);
    }
  }

  MKCFDisposeMedia();
  BOOL v13 = v17 == 0;
LABEL_11:

  return v13;
}

id __75__SKPartitionTable_overwriteExistingMediaLayout_opts_partitionScheme_size___block_invoke()
{
  v4[1] = *MEMORY[0x1895F89C0];
  v3 = @"faultCode";
  base64Encode((uint64_t)"SKPartitionTable.m", 180LL);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = v0;
  [MEMORY[0x189603F68] dictionaryWithObjects:v4 forKeys:&v3 count:1];
  v1 = (void *)objc_claimAutoreleasedReturnValue();

  return v1;
}

id __75__SKPartitionTable_overwriteExistingMediaLayout_opts_partitionScheme_size___block_invoke_59()
{
  v4[1] = *MEMORY[0x1895F89C0];
  v3 = @"faultCode";
  base64Encode((uint64_t)"SKPartitionTable.m", 187LL);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = v0;
  [MEMORY[0x189603F68] dictionaryWithObjects:v4 forKeys:&v3 count:1];
  v1 = (void *)objc_claimAutoreleasedReturnValue();

  return v1;
}

- (void)flushMediaRef
{
  if (-[SKPartitionTable mediaRef](self, "mediaRef"))
  {
    CFRelease(-[SKPartitionTable mediaRef](self, "mediaRef"));
    -[SKPartitionTable setMediaRef:](self, "setMediaRef:", 0LL);
  }

- (BOOL)allocateMediaRef:(id *)a3
{
  if (!-[SKPartitionTable mediaRef](self, "mediaRef"))
  {
    id v5 = (void *)objc_opt_class();
    -[SKPartitionTable disk](self, "disk");
    id v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[SKPartitionTable setMediaRef:](self, "setMediaRef:", [v5 createMediaRefWithDisk:v6 error:a3]);
  }

  return -[SKPartitionTable mediaRef](self, "mediaRef") != 0;
}

- (BOOL)writePartitionScheme:(unint64_t)a3 error:(id *)a4
{
  uint64_t v37 = *MEMORY[0x1895F89C0];
  if (!-[SKPartitionTable allocateMediaRef:](self, "allocateMediaRef:", a4)) {
    return 0;
  }
  -[SKPartitionTable disk](self, "disk");
  id v7 = (void *)objc_claimAutoreleasedReturnValue();
  int v8 = [v7 wipeDiskWithError:a4];

  if (!v8) {
    return 0;
  }
  v9 = (void *)objc_opt_new();
  __int128 v26 = 0u;
  __int128 v27 = 0u;
  __int128 v28 = 0u;
  __int128 v29 = 0u;
  v10 = -[SKPartitionTable partitions](self, "partitions", 0LL);
  uint64_t v11 = [v10 countByEnumeratingWithState:&v26 objects:v36 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v27;
    if (a3) {
      unsigned int v14 = 1;
    }
    else {
      unsigned int v14 = 16;
    }
    if (a3 == 1) {
      uint64_t v15 = 8LL;
    }
    else {
      uint64_t v15 = v14;
    }
    while (2)
    {
      for (uint64_t i = 0LL; i != v12; ++i)
      {
        if (*(void *)v27 != v13) {
          objc_enumerationMutation(v10);
        }
        uint64_t v17 = objc_msgSend( *(id *)(*((void *)&v26 + 1) + 8 * i),  "buildWithScheme:sectorSize:",  v15,  -[SKPartitionTable sectorSize](self, "sectorSize"));
        if (!v17)
        {
          -[SKPartitionTable disk](self, "disk");
          __int16 v20 = (void *)objc_claimAutoreleasedReturnValue();
          v35 = v20;
          [MEMORY[0x189603F18] arrayWithObjects:&v35 count:1];
          int v21 = (void *)objc_claimAutoreleasedReturnValue();
          uint64_t v22 = 300LL;
          goto LABEL_23;
        }

        __int16 v18 = (void *)v17;
        [v9 addObject:v17];
      }

      uint64_t v12 = [v10 countByEnumeratingWithState:&v26 objects:v36 count:16];
      if (v12) {
        continue;
      }
      break;
    }
  }

  v33 = @"Partitions";
  v34 = v9;
  [MEMORY[0x189603F68] dictionaryWithObjects:&v34 forKeys:&v33 count:1];
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[SKPartitionTable writeNewMediaLayout:partitionScheme:](self, "writeNewMediaLayout:partitionScheme:", v10, a3))
  {
    -[SKPartitionTable flushMediaRef](self, "flushMediaRef");
    BOOL v19 = 1;
  }

  else
  {
    SKGetOSLog();
    v23 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      v32 = "-[SKPartitionTable writePartitionScheme:error:]";
      _os_log_impl(&dword_188F75000, v23, OS_LOG_TYPE_ERROR, "%s: Failed to write media on disk", buf, 0xCu);
    }

    -[SKPartitionTable disk](self, "disk");
    __int16 v20 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = v20;
    [MEMORY[0x189603F18] arrayWithObjects:&v30 count:1];
    int v21 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v22 = 114LL;
LABEL_23:
    v24 = +[SKError errorWithCode:disks:userInfo:](&OBJC_CLASS___SKError, "errorWithCode:disks:userInfo:", v22, v21, 0LL);
    BOOL v19 = +[SKError failWithError:error:](&OBJC_CLASS___SKError, "failWithError:error:", v24, a4);
  }

  return v19;
}

+ (id)partitionIDFromDisk:(id)a3
{
  id v3 = a3;
  objc_super v4 = objc_alloc(&OBJC_CLASS___SKIOMedia);
  [v3 diskIdentifier];
  id v5 = (void *)objc_claimAutoreleasedReturnValue();

  id v6 = -[SKIOMedia initWithDevName:](v4, "initWithDevName:", v5);
  id v7 = -[SKIOObject copyPropertyWithClass:key:]( v6,  "copyPropertyWithClass:key:",  objc_opt_class(),  @"Partition ID");

  return v7;
}

+ (BOOL)updatePartitionTypeWithPartitions:(id)a3 partID:(id)a4 newType:(id)a5 error:(id *)a6
{
  uint64_t v28 = *MEMORY[0x1895F89C0];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  __int128 v23 = 0u;
  __int128 v24 = 0u;
  __int128 v25 = 0u;
  __int128 v26 = 0u;
  id v11 = v8;
  uint64_t v12 = [v11 countByEnumeratingWithState:&v23 objects:v27 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v24;
    while (2)
    {
      for (uint64_t i = 0LL; i != v13; ++i)
      {
        if (*(void *)v24 != v14) {
          objc_enumerationMutation(v11);
        }
        int v16 = *(void **)(*((void *)&v23 + 1) + 8 * i);
        [v16 objectForKeyedSubscript:@"Partition ID"];
        uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue();
        int v18 = [v17 isEqual:v9];

        if (v18)
        {
          [v16 setObject:v10 forKeyedSubscript:@"Type"];
          BOOL v20 = 1;
          BOOL v19 = v11;
          goto LABEL_11;
        }
      }

      uint64_t v13 = [v11 countByEnumeratingWithState:&v23 objects:v27 count:16];
      if (v13) {
        continue;
      }
      break;
    }
  }

  [NSString stringWithFormat:@"Couldn't find partition with ID %@", v9];
  BOOL v19 = (void *)objc_claimAutoreleasedReturnValue();
  BOOL v20 = +[SKError failWithSKErrorCode:debugDescription:error:]( &OBJC_CLASS___SKError,  "failWithSKErrorCode:debugDescription:error:",  117LL,  v19,  a6);
LABEL_11:

  return v20;
}

- (BOOL)overwritePartitionAt:(id)a3 filesystem:(id)a4 error:(id *)a5
{
  uint64_t v37 = *MEMORY[0x1895F89C0];
  id v8 = a3;
  id v9 = a4;
  if (-[SKPartitionTable allocateMediaRef:](self, "allocateMediaRef:", a5))
  {
    -[SKPartitionTable mediaRef](self, "mediaRef");
    MKCFReadMedia();
    id v10 = (void *)objc_claimAutoreleasedReturnValue();
    id v11 = v10;
    if (!v10)
    {
      SKGetOSLog();
      int v21 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315394;
        v34 = "-[SKPartitionTable overwritePartitionAt:filesystem:error:]";
        __int16 v35 = 1024;
        int v36 = 0;
        _os_log_impl(&dword_188F75000, v21, OS_LOG_TYPE_ERROR, "%s: Failed to read media, MK err %d", buf, 0x12u);
      }

      [MEMORY[0x189607870] errorWithDomain:*MEMORY[0x189607688] code:0 userInfo:0];
      uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue();
      BOOL v20 = +[SKError failWithError:error:](&OBJC_CLASS___SKError, "failWithError:error:", v12, a5);
      goto LABEL_17;
    }

    [v10 objectForKeyedSubscript:@"Schemes"];
    uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue();
    [v12 objectAtIndexedSubscript:0];
    uint64_t v28 = (void *)objc_claimAutoreleasedReturnValue();
    [v28 objectForKeyedSubscript:@"Sections"];
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    [v30 objectAtIndexedSubscript:0];
    __int128 v29 = (void *)objc_claimAutoreleasedReturnValue();
    [v29 objectForKeyedSubscript:@"Partitions"];
    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[SKPartitionTable disk](self, "disk");
    uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue();
    [v14 type];
    uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue();
    int v16 = diskTypeToScheme(v15);

    if (v16 == 512)
    {
      MKCFDisposeMedia();
      -[SKPartitionTable disk](self, "disk");
      uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue();
      v32 = v17;
      [MEMORY[0x189603F18] arrayWithObjects:&v32 count:1];
      int v18 = (void *)objc_claimAutoreleasedReturnValue();
      +[SKError errorWithCode:disks:userInfo:](&OBJC_CLASS___SKError, "errorWithCode:disks:userInfo:", 117LL, v18, 0LL);
      BOOL v19 = (void *)objc_claimAutoreleasedReturnValue();
      BOOL v20 = +[SKError failWithError:error:](&OBJC_CLASS___SKError, "failWithError:error:", v19, a5);
    }

    else
    {
      uint64_t v22 = (void *)objc_opt_class();
      [v9 contentMask];
      __int128 v23 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(v22) = [v22 updatePartitionTypeWithPartitions:v13 partID:v8 newType:v23 error:a5];

      if ((_DWORD)v22)
      {
        -[SKPartitionTable mediaRef](self, "mediaRef");
        int v31 = MKCFWriteMedia();
        MKCFDisposeMedia();
        __int128 v25 = v29;
        __int128 v24 = v30;
        if (v31)
        {
          BOOL v20 = +[SKError failWithSKErrorCode:debugDescription:error:]( &OBJC_CLASS___SKError,  "failWithSKErrorCode:debugDescription:error:",  114LL,  @"Failed to overwrite existing partition",  a5);
        }

        else
        {
          -[SKPartitionTable flushMediaRef](self, "flushMediaRef");
          BOOL v20 = 1;
        }

        __int128 v26 = v28;
        goto LABEL_16;
      }

      BOOL v20 = 0;
    }

    __int128 v26 = v28;
    __int128 v25 = v29;
    __int128 v24 = v30;
LABEL_16:

LABEL_17:
    goto LABEL_18;
  }

  BOOL v20 = 0;
LABEL_18:

  return v20;
}

- (BOOL)fitToContainerSize:(unint64_t)a3 error:(id *)a4
{
  uint64_t v31 = *MEMORY[0x1895F89C0];
  if (!-[SKPartitionTable allocateMediaRef:](self, "allocateMediaRef:", a4)) {
    return 0;
  }
  -[SKPartitionTable mediaRef](self, "mediaRef");
  MKCFReadMedia();
  id v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    -[SKPartitionTable disk](self, "disk");
    id v8 = (void *)objc_claimAutoreleasedReturnValue();
    [v8 type];
    id v9 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v10 = diskTypeToScheme(v9);

    if ((_DWORD)v10 == 512)
    {
      MKCFDisposeMedia();
      -[SKPartitionTable disk](self, "disk");
      id v11 = (void *)objc_claimAutoreleasedReturnValue();
      __int128 v26 = v11;
      [MEMORY[0x189603F18] arrayWithObjects:&v26 count:1];
      uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue();
      +[SKError errorWithCode:disks:userInfo:](&OBJC_CLASS___SKError, "errorWithCode:disks:userInfo:", 117LL, v12, 0LL);
      uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue();
      BOOL v14 = +[SKError failWithError:error:](&OBJC_CLASS___SKError, "failWithError:error:", v13, a4);
    }

    else
    {
      [v7 objectForKeyedSubscript:@"Schemes"];
      id v11 = (void *)objc_claimAutoreleasedReturnValue();
      [v11 objectAtIndexedSubscript:0];
      int v16 = (void *)objc_claimAutoreleasedReturnValue();
      [v16 objectForKeyedSubscript:@"Sections"];
      uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue();
      [v17 objectAtIndexedSubscript:0];
      int v18 = (void *)objc_claimAutoreleasedReturnValue();
      BOOL v19 = -[SKPartitionTable overwriteExistingMediaLayout:opts:partitionScheme:size:]( self,  "overwriteExistingMediaLayout:opts:partitionScheme:size:",  v18,  &unk_18A330008,  v10,  a3 / -[SKPartitionTable sectorSize](self, "sectorSize"));
      MKCFDisposeMedia();
      if (v19)
      {
        -[SKPartitionTable flushMediaRef](self, "flushMediaRef");
        BOOL v14 = 1;
      }

      else
      {
        SKGetOSLog();
        BOOL v20 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136315138;
          uint64_t v28 = "-[SKPartitionTable fitToContainerSize:error:]";
          _os_log_impl(&dword_188F75000, v20, OS_LOG_TYPE_ERROR, "%s: Failed to fit existing partition", buf, 0xCu);
        }

        -[SKPartitionTable disk](self, "disk");
        int v21 = (void *)objc_claimAutoreleasedReturnValue();
        __int128 v25 = v21;
        [MEMORY[0x189603F18] arrayWithObjects:&v25 count:1];
        uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue();
        +[SKError errorWithCode:disks:userInfo:]( &OBJC_CLASS___SKError,  "errorWithCode:disks:userInfo:",  114LL,  v22,  0LL);
        __int128 v23 = (void *)objc_claimAutoreleasedReturnValue();
        BOOL v14 = +[SKError failWithError:error:](&OBJC_CLASS___SKError, "failWithError:error:", v23, a4);
      }
    }
  }

  else
  {
    SKGetOSLog();
    uint64_t v15 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      uint64_t v28 = "-[SKPartitionTable fitToContainerSize:error:]";
      __int16 v29 = 1024;
      int v30 = 0;
      _os_log_impl(&dword_188F75000, v15, OS_LOG_TYPE_ERROR, "%s: Failed to read media, MK err %d", buf, 0x12u);
    }

    [MEMORY[0x189607870] errorWithDomain:*MEMORY[0x189607688] code:0 userInfo:0];
    id v11 = (void *)objc_claimAutoreleasedReturnValue();
    BOOL v14 = +[SKError failWithError:error:](&OBJC_CLASS___SKError, "failWithError:error:", v11, a4);
  }

  return v14;
}

- (BOOL)resizePartitionID:(id)a3 size:(unint64_t)a4 offset:(unint64_t)a5 error:(id *)a6
{
  uint64_t v65 = *MEMORY[0x1895F89C0];
  id v50 = a3;
  if (-[SKPartitionTable allocateMediaRef:](self, "allocateMediaRef:", a6))
  {
    int v55 = 0;
    -[SKPartitionTable mediaRef](self, "mediaRef");
    MKCFReadMedia();
    id v8 = (void *)objc_claimAutoreleasedReturnValue();
    id v9 = v8;
    if (!v8)
    {
      SKGetOSLog();
      int v21 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315394;
        v62 = "-[SKPartitionTable resizePartitionID:size:offset:error:]";
        __int16 v63 = 1024;
        int v64 = v55;
        _os_log_impl(&dword_188F75000, v21, OS_LOG_TYPE_ERROR, "%s: Failed to read media, MK err %d", buf, 0x12u);
      }

      [MEMORY[0x189607870] errorWithDomain:*MEMORY[0x189607688] code:v55 userInfo:0];
      uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue();
      BOOL v20 = +[SKError failWithError:error:](&OBJC_CLASS___SKError, "failWithError:error:", v10, a6);
      goto LABEL_26;
    }

    [v8 objectForKeyedSubscript:@"Schemes"];
    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue();
    [v10 objectAtIndexedSubscript:0];
    id v11 = (void *)objc_claimAutoreleasedReturnValue();
    [v11 objectForKeyedSubscript:@"Sections"];
    uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue();
    [v12 objectAtIndexedSubscript:0];
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    [v46 objectForKeyedSubscript:@"Partitions"];
    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[SKPartitionTable disk](self, "disk");
    BOOL v14 = (void *)objc_claimAutoreleasedReturnValue();
    [v14 type];
    uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue();
    unsigned int v16 = diskTypeToScheme(v15);

    v47 = v13;
    if (v16 == 512)
    {
      MKCFDisposeMedia();
      -[SKPartitionTable disk](self, "disk");
      uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue();
      v60 = v17;
      [MEMORY[0x189603F18] arrayWithObjects:&v60 count:1];
      int v18 = (void *)objc_claimAutoreleasedReturnValue();
      +[SKError errorWithCode:disks:userInfo:](&OBJC_CLASS___SKError, "errorWithCode:disks:userInfo:", 117LL, v18, 0LL);
      BOOL v19 = (void *)objc_claimAutoreleasedReturnValue();
      BOOL v20 = +[SKError failWithError:error:](&OBJC_CLASS___SKError, "failWithError:error:", v19, a6);
    }

    else
    {
      unsigned int v44 = v16;
      v41 = v12;
      v42 = v11;
      v43 = v10;
      v40 = a6;
      v45 = v9;
      uint64_t v17 = (void *)objc_opt_new();
      __int128 v51 = 0u;
      __int128 v52 = 0u;
      __int128 v53 = 0u;
      __int128 v54 = 0u;
      id v22 = v13;
      uint64_t v23 = [v22 countByEnumeratingWithState:&v51 objects:v59 count:16];
      if (v23)
      {
        uint64_t v24 = v23;
        uint64_t v25 = *(void *)v52;
        do
        {
          for (uint64_t i = 0LL; i != v24; ++i)
          {
            if (*(void *)v52 != v25) {
              objc_enumerationMutation(v22);
            }
            __int128 v27 = *(void **)(*((void *)&v51 + 1) + 8 * i);
            uint64_t v28 = (void *)[v27 mutableCopy];
            [v27 objectForKeyedSubscript:@"Partition ID"];
            __int16 v29 = (void *)objc_claimAutoreleasedReturnValue();
            int v30 = [v29 isEqualToNumber:v50];

            if (v30)
            {
              objc_msgSend( MEMORY[0x189607968],  "numberWithUnsignedLongLong:",  a4 / -[SKPartitionTable sectorSize](self, "sectorSize"));
              uint64_t v31 = (void *)objc_claimAutoreleasedReturnValue();
              [v28 setObject:v31 forKeyedSubscript:@"Size"];

              if (a5)
              {
                objc_msgSend( MEMORY[0x189607968],  "numberWithUnsignedLongLong:",  a5 / -[SKPartitionTable sectorSize](self, "sectorSize"));
                v32 = (void *)objc_claimAutoreleasedReturnValue();
                [v28 setObject:v32 forKeyedSubscript:@"Offset"];
              }
            }

            [v17 addObject:v28];
          }

          uint64_t v24 = [v22 countByEnumeratingWithState:&v51 objects:v59 count:16];
        }

        while (v24);
      }

      v57 = @"Partitions";
      v58 = v17;
      [MEMORY[0x189603F68] dictionaryWithObjects:&v58 forKeys:&v57 count:1];
      int v18 = (void *)objc_claimAutoreleasedReturnValue();
      BOOL v33 = -[SKPartitionTable overwriteExistingMediaLayout:opts:partitionScheme:]( self,  "overwriteExistingMediaLayout:opts:partitionScheme:",  v18,  &unk_18A330058,  v44);
      id v9 = v45;
      MKCFDisposeMedia();
      if (!v33)
      {
        SKGetOSLog();
        __int16 v35 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        uint64_t v12 = v41;
        v34 = v46;
        if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136315138;
          v62 = "-[SKPartitionTable resizePartitionID:size:offset:error:]";
          _os_log_impl( &dword_188F75000,  v35,  OS_LOG_TYPE_ERROR,  "%s: Failed to overwrite existing partition",  buf,  0xCu);
        }

        -[SKPartitionTable disk](self, "disk");
        int v36 = (void *)objc_claimAutoreleasedReturnValue();
        v56 = v36;
        [MEMORY[0x189603F18] arrayWithObjects:&v56 count:1];
        uint64_t v37 = (void *)objc_claimAutoreleasedReturnValue();
        v38 = +[SKError errorWithCode:disks:userInfo:]( &OBJC_CLASS___SKError,  "errorWithCode:disks:userInfo:",  114LL,  v37,  0LL);
        BOOL v20 = +[SKError failWithError:error:](&OBJC_CLASS___SKError, "failWithError:error:", v38, v40);

        id v11 = v42;
        uint64_t v10 = v43;
        goto LABEL_25;
      }

      -[SKPartitionTable flushMediaRef](self, "flushMediaRef");
      BOOL v20 = 1;
      uint64_t v10 = v43;
      uint64_t v12 = v41;
    }

    v34 = v46;
LABEL_25:

LABEL_26:
    goto LABEL_27;
  }

  BOOL v20 = 0;
LABEL_27:

  return v20;
}

- (NSMutableArray)partitions
{
  return self->_partitions;
}

- (void)setPartitions:(id)a3
{
}

- (SKDisk)disk
{
  return (SKDisk *)objc_getProperty(self, a2, 24LL, 1);
}

- (void)setDisk:(id)a3
{
}

- (unsigned)sectorSize
{
  return self->_sectorSize;
}

- (void)setSectorSize:(unsigned int)a3
{
  self->_sectorSize = a3;
}

- (__MKMedia)mediaRef
{
  return self->_mediaRef;
}

- (void)setMediaRef:(__MKMedia *)a3
{
  self->_mediaRef = a3;
}

- (void).cxx_destruct
{
}

@end