@interface SKLastPartitions
+ (unint64_t)hfsMinimalSizeForDisk:(id)a3 currentSize:(unint64_t *)a4;
+ (unint64_t)secondaryPartitionTableSizeWithDiskType:(id)a3;
- (SKDisk)recoveryPart;
- (SKDisk)resizablePart;
- (SKLastPartitions)initWithDisk:(id)a3;
- (unint64_t)nonResizableSize;
@end

@implementation SKLastPartitions

- (SKLastPartitions)initWithDisk:(id)a3
{
  id v4 = a3;
  v27.receiver = self;
  v27.super_class = (Class)&OBJC_CLASS___SKLastPartitions;
  v5 = -[SKLastPartitions init](&v27, sel_init);
  if (!v5) {
    goto LABEL_11;
  }
  [v4 children];
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6 && [v6 count])
  {
    [v7 lastObject];
    resizablePart = (void *)objc_claimAutoreleasedReturnValue();
    p_resizablePart = (void **)&v5->_resizablePart;
    objc_storeStrong((id *)&v5->_resizablePart, resizablePart);
    if ((unint64_t)[v7 count] >= 2)
    {
      [resizablePart ioContent];
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      int v11 = [v10 isEqualToString:@"Apple_APFS_Recovery"];

      if (v11)
      {
        v12 = resizablePart;
        recoveryPart = v5->_recoveryPart;
        v5->_recoveryPart = v12;
      }

      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0) {
          goto LABEL_19;
        }
        [resizablePart container];
        v20 = (SKDisk *)objc_claimAutoreleasedReturnValue();
        recoveryPart = v20;
        if (v20)
        {
          v21 = -[SKDisk volumes](v20, "volumes");
          if ([v21 count] == 1)
          {
            [v21 objectAtIndexedSubscript:0];
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            [v22 getAPFSVolumeRole];
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            int v24 = [v23 isEqualToString:SKAPFSVolumeRoleRecovery];

            if (v24) {
              objc_storeStrong((id *)&v5->_recoveryPart, resizablePart);
            }
          }
        }
      }

LABEL_19:
      if (v5->_recoveryPart)
      {
        uint64_t v25 = objc_msgSend(v7, "objectAtIndexedSubscript:", objc_msgSend(v7, "count") - 2);
        v26 = *p_resizablePart;
        *p_resizablePart = (void *)v25;
      }
    }
  }

  else
  {
    v14 = (SKDisk *)v4;
    resizablePart = v5->_resizablePart;
    v5->_resizablePart = v14;
  }

  uint64_t v15 = -[SKDisk startLocation](v5->_resizablePart, "startLocation");
  v16 = (void *)objc_opt_class();
  [v4 type];
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v5->_nonResizableSize = [v16 secondaryPartitionTableSizeWithDiskType:v17] + v15;

  v18 = v5->_recoveryPart;
  if (v18) {
    v5->_nonResizableSize += -[SKDisk unformattedSize](v18, "unformattedSize");
  }

LABEL_11:
  return v5;
}

+ (unint64_t)secondaryPartitionTableSizeWithDiskType:(id)a3
{
  else {
    return 0LL;
  }
}

+ (unint64_t)hfsMinimalSizeForDisk:(id)a3 currentSize:(unint64_t *)a4
{
  uint64_t v30 = *MEMORY[0x1895F89C0];
  id v5 = a3;
  [v5 type];
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  char v7 = [v6 isEqualToString:kSKDiskTypeHFS[0]];

  if ((v7 & 1) != 0)
  {
    id v19 = 0LL;
    v8 = +[SKPartitionTable createMediaRefWithDisk:error:]( &OBJC_CLASS___SKPartitionTable,  "createMediaRefWithDisk:error:",  v5,  &v19);
    id v9 = v19;
    if (v8)
    {
      int v10 = MKHFSGetResizeLimits();
      CFRelease(v8);
      if (!v10)
      {
        unsigned int v17 = [v5 getSectorSize];
        if (a4) {
          *a4 = *(void *)buf * v17;
        }
        unint64_t v16 = *(void *)&v28[2] * v17;
        goto LABEL_14;
      }

      SKGetOSLog();
      int v11 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        int v20 = 136315650;
        v21 = "+[SKLastPartitions hfsMinimalSizeForDisk:currentSize:]";
        __int16 v22 = 2112;
        id v23 = v5;
        __int16 v24 = 1024;
        int v25 = v10;
        v12 = "%s: Failed to get size from %@, %d";
        v13 = (uint8_t *)&v20;
        v14 = v11;
        uint32_t v15 = 28;
LABEL_9:
        _os_log_impl(&dword_188F75000, v14, OS_LOG_TYPE_ERROR, v12, v13, v15);
      }
    }

    else
    {
      SKGetOSLog();
      int v11 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315650;
        *(void *)&buf[4] = "+[SKLastPartitions hfsMinimalSizeForDisk:currentSize:]";
        __int16 v27 = 2112;
        *(void *)v28 = v5;
        *(_WORD *)&v28[8] = 2112;
        id v29 = v9;
        v12 = "%s: Failed to read media from %@, %@";
        v13 = buf;
        v14 = v11;
        uint32_t v15 = 32;
        goto LABEL_9;
      }
    }

    unint64_t v16 = [v5 totalSpace];
LABEL_14:

    goto LABEL_15;
  }

  unint64_t v16 = [v5 totalSpace];
LABEL_15:

  return v16;
}

- (SKDisk)resizablePart
{
  return self->_resizablePart;
}

- (SKDisk)recoveryPart
{
  return self->_recoveryPart;
}

- (unint64_t)nonResizableSize
{
  return self->_nonResizableSize;
}

- (void).cxx_destruct
{
}

@end