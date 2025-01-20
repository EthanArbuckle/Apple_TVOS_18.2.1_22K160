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
  v28.receiver = self;
  v28.super_class = (Class)&OBJC_CLASS___SKLastPartitions;
  v5 = -[SKLastPartitions init](&v28, "init");
  if (!v5) {
    goto LABEL_11;
  }
  v6 = (void *)objc_claimAutoreleasedReturnValue([v4 children]);
  v7 = v6;
  if (v6 && [v6 count])
  {
    resizablePart = (SKDisk *)objc_claimAutoreleasedReturnValue([v7 lastObject]);
    p_resizablePart = (void **)&v5->_resizablePart;
    objc_storeStrong((id *)&v5->_resizablePart, resizablePart);
    if ((unint64_t)[v7 count] >= 2)
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue(-[SKDisk ioContent](resizablePart, "ioContent"));
      unsigned int v11 = [v10 isEqualToString:@"Apple_APFS_Recovery"];

      if (v11)
      {
        v12 = resizablePart;
        recoveryPart = v5->_recoveryPart;
        v5->_recoveryPart = v12;
      }

      else
      {
        uint64_t v20 = objc_opt_class(&OBJC_CLASS___SKAPFSStoreDisk);
        if ((objc_opt_isKindOfClass(resizablePart, v20) & 1) == 0) {
          goto LABEL_19;
        }
        v21 = (SKDisk *)objc_claimAutoreleasedReturnValue(-[SKDisk container](resizablePart, "container"));
        recoveryPart = v21;
        if (v21)
        {
          v22 = (void *)objc_claimAutoreleasedReturnValue(-[SKDisk volumes](v21, "volumes"));
          if ([v22 count] == (id)1)
          {
            v23 = (void *)objc_claimAutoreleasedReturnValue([v22 objectAtIndexedSubscript:0]);
            v24 = (void *)objc_claimAutoreleasedReturnValue([v23 getAPFSVolumeRole]);
            unsigned int v25 = [v24 isEqualToString:SKAPFSVolumeRoleRecovery];

            if (v25) {
              objc_storeStrong((id *)&v5->_recoveryPart, resizablePart);
            }
          }
        }
      }

LABEL_19:
      if (v5->_recoveryPart)
      {
        uint64_t v26 = objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectAtIndexedSubscript:", (char *)objc_msgSend(v7, "count") - 2));
        v27 = *p_resizablePart;
        *p_resizablePart = (void *)v26;
      }
    }
  }

  else
  {
    v14 = (SKDisk *)v4;
    resizablePart = v5->_resizablePart;
    v5->_resizablePart = v14;
  }

  id v15 = -[SKDisk startLocation](v5->_resizablePart, "startLocation");
  v16 = (void *)objc_opt_class(v5);
  v17 = (void *)objc_claimAutoreleasedReturnValue([v4 type]);
  v5->_nonResizableSize = (unint64_t)v15
                        + (void)[v16 secondaryPartitionTableSizeWithDiskType:v17];

  v18 = v5->_recoveryPart;
  if (v18) {
    v5->_nonResizableSize += (unint64_t)-[SKDisk unformattedSize](v18, "unformattedSize");
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
  id v5 = a3;
  v6 = (void *)objc_claimAutoreleasedReturnValue([v5 type]);
  unsigned __int8 v7 = [v6 isEqualToString:kSKDiskTypeHFS];

  if ((v7 & 1) != 0)
  {
    id v21 = 0LL;
    v8 = +[SKPartitionTable createMediaRefWithDisk:error:]( &OBJC_CLASS___SKPartitionTable,  "createMediaRefWithDisk:error:",  v5,  &v21);
    id v9 = v21;
    if (v8)
    {
      int v10 = MKHFSGetResizeLimits(buf, v8, 0LL);
      CFRelease(v8);
      if (!v10)
      {
        unsigned int v19 = [v5 getSectorSize];
        if (a4) {
          *a4 = *(void *)buf * v19;
        }
        unint64_t v17 = *(void *)&v30[2] * v19;
        goto LABEL_14;
      }

      id v11 = sub_10000E2BC();
      v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        int v22 = 136315650;
        v23 = "+[SKLastPartitions hfsMinimalSizeForDisk:currentSize:]";
        __int16 v24 = 2112;
        id v25 = v5;
        __int16 v26 = 1024;
        int v27 = v10;
        v13 = "%s: Failed to get size from %@, %d";
        v14 = (uint8_t *)&v22;
        id v15 = v12;
        uint32_t v16 = 28;
LABEL_9:
        _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_ERROR, v13, v14, v16);
      }
    }

    else
    {
      id v18 = sub_10000E2BC();
      v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v18);
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315650;
        *(void *)&buf[4] = "+[SKLastPartitions hfsMinimalSizeForDisk:currentSize:]";
        __int16 v29 = 2112;
        *(void *)v30 = v5;
        *(_WORD *)&v30[8] = 2112;
        id v31 = v9;
        v13 = "%s: Failed to read media from %@, %@";
        v14 = buf;
        id v15 = v12;
        uint32_t v16 = 32;
        goto LABEL_9;
      }
    }

    unint64_t v17 = (unint64_t)[v5 totalSpace];
LABEL_14:

    goto LABEL_15;
  }

  unint64_t v17 = (unint64_t)[v5 totalSpace];
LABEL_15:

  return v17;
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