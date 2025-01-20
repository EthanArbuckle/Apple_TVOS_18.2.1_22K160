@interface CacheDeleteVolume
+ (CacheDeleteVolume)volumeWithMountpoint:(id)a3;
+ (CacheDeleteVolume)volumeWithPath:(id)a3;
+ (CacheDeleteVolume)volumeWithUUID:(id)a3;
+ (id)mountPointForUUID:(id)a3;
+ (id)rootVolume;
+ (id)validateVolumeAtPath:(id)a3;
+ (int64_t)stateForPath:(id)a3;
- (BOOL)amountIsRational:(id)a3 freespace:(unint64_t)a4 effective_size:(unint64_t)a5 used:(unint64_t)a6 size:(unint64_t)a7;
- (BOOL)containsPath:(id)a3;
- (BOOL)freespaceIsStale:(unint64_t)a3;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualTo:(id)a3;
- (BOOL)isRoot;
- (BOOL)mayContainPurgeableAmount:(id)a3 forService:(id)a4;
- (BOOL)validate;
- (CacheDeleteVolume)initWithPath:(id)a3;
- (CacheDeleteVolume)initWithVolume:(id)a3;
- (NSDictionary)thresholds;
- (NSString)bsdName;
- (NSString)fsType;
- (NSString)mountPoint;
- (id)FSEventsUUID;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)uuid;
- (int)dev;
- (int64_t)state;
- (unint64_t)amountPurged;
- (unint64_t)effective_size;
- (unint64_t)freespace;
- (unint64_t)hash;
- (unint64_t)initialFreespace;
- (unint64_t)size;
- (unint64_t)used;
- (unsigned)block_size;
@end

@implementation CacheDeleteVolume

- (CacheDeleteVolume)initWithVolume:(id)a3
{
  id v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)&OBJC_CLASS___CacheDeleteVolume;
  v5 = -[CacheDeleteVolume init](&v19, sel_init);
  if (v5)
  {
    v5->_isRoot = [v4 isRoot];
    [v4 fsType];
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v7 = [v6 copy];
    fsType = v5->_fsType;
    v5->_fsType = (NSString *)v7;

    [v4 mountPoint];
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v10 = [v9 copy];
    mountPoint = v5->_mountPoint;
    v5->_mountPoint = (NSString *)v10;

    v5->_initialFreespace = [v4 freespace];
    [v4 thresholds];
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v13 = [v12 copy];
    thresholds = v5->_thresholds;
    v5->_thresholds = (NSDictionary *)v13;

    [v4 bsdName];
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v16 = [v15 copy];
    bsdName = v5->_bsdName;
    v5->_bsdName = (NSString *)v16;

    v5->_dev = [v4 dev];
    v5->_block_size = objc_msgSend(v4, "block_size");
  }

  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  return -[CacheDeleteVolume initWithVolume:](objc_alloc(&OBJC_CLASS___CacheDeleteVolume), "initWithVolume:", self);
}

- (unint64_t)amountPurged
{
  uint64_t v13 = *MEMORY[0x1895F89C0];
  if (!-[CacheDeleteVolume validate](self, "validate")) {
    goto LABEL_6;
  }
  id v3 = -[CacheDeleteVolume mountPoint](self, "mountPoint");
  uint64_t v4 = volumeFreespace((const char *)[v3 fileSystemRepresentation]);

  CDGetLogHandle((uint64_t)"client");
  v5 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    int v9 = 134218240;
    unint64_t v10 = -[CacheDeleteVolume initialFreespace](self, "initialFreespace");
    __int16 v11 = 2048;
    uint64_t v12 = v4;
    _os_log_debug_impl( &dword_1874E4000,  v5,  OS_LOG_TYPE_DEBUG,  "begin_freespace: %llu, cur_freespace: %llu",  (uint8_t *)&v9,  0x16u);
  }

  if (v4 > -[CacheDeleteVolume initialFreespace](self, "initialFreespace")) {
    unint64_t v6 = v4 - -[CacheDeleteVolume initialFreespace](self, "initialFreespace");
  }
  else {
LABEL_6:
  }
    unint64_t v6 = 0LL;
  CDGetLogHandle((uint64_t)"client");
  uint64_t v7 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    int v9 = 134217984;
    unint64_t v10 = v6;
    _os_log_debug_impl(&dword_1874E4000, v7, OS_LOG_TYPE_DEBUG, "result: %llu", (uint8_t *)&v9, 0xCu);
  }

  return v6;
}

- (unint64_t)used
{
  if (!-[CacheDeleteVolume validate](self, "validate")) {
    return 0LL;
  }
  id v3 = -[CacheDeleteVolume mountPoint](self, "mountPoint");
  unint64_t v4 = volumeUsed((const char *)[v3 fileSystemRepresentation]);

  return v4;
}

- (unint64_t)size
{
  if (!-[CacheDeleteVolume validate](self, "validate")) {
    return 0LL;
  }
  id v3 = -[CacheDeleteVolume mountPoint](self, "mountPoint");
  uint64_t v4 = volumeSize((const char *)[v3 fileSystemRepresentation]);

  return v4;
}

- (unint64_t)effective_size
{
  uint64_t v26 = *MEMORY[0x1895F89C0];
  if (-[CacheDeleteVolume validate](self, "validate"))
  {
    unint64_t v3 = -[CacheDeleteVolume size](self, "size");
    unint64_t v4 = volumeUsed("/");
    v5 = -[CacheDeleteVolume mountPoint](self, "mountPoint");
    disk();
    unint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();

    disk();
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue();
    if ([v6 isEqualToString:v7]
      && (unint64_t v8 = -[CacheDeleteVolume size](self, "size"), v8 == volumeSize("/")))
    {
      if (v3 <= v4)
      {
        CDGetLogHandle((uint64_t)"client");
        v14 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
        {
          humanReadableNumber(v4);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          mountPoint = self->_mountPoint;
          humanReadableNumber(v3);
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          int v18 = 134218754;
          unint64_t v19 = v4;
          __int16 v20 = 2112;
          v21 = v15;
          __int16 v22 = 2112;
          v23 = mountPoint;
          __int16 v24 = 2112;
          v25 = v17;
          _os_log_error_impl( &dword_1874E4000,  v14,  OS_LOG_TYPE_ERROR,  "CacheDeleteVolume effective_size: systemVolume used amount is greater than this volume's size. System used a mount: %llu (%@), this volume: %@ : %@",  (uint8_t *)&v18,  0x2Au);
        }

        effective_size_volume_effective_size = 0LL;
      }

      else
      {
        effective_size_volume_effective_size = v3 - v4;
        CDGetLogHandle((uint64_t)"client");
        int v9 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
        {
          -[CacheDeleteVolume mountPoint](self, "mountPoint");
          unint64_t v10 = (void *)objc_claimAutoreleasedReturnValue();
          humanReadableNumber(v3);
          __int16 v11 = (void *)objc_claimAutoreleasedReturnValue();
          humanReadableNumber(effective_size_volume_effective_size);
          uint64_t v12 = (NSString *)objc_claimAutoreleasedReturnValue();
          int v18 = 138412802;
          unint64_t v19 = (unint64_t)v10;
          __int16 v20 = 2112;
          v21 = v11;
          __int16 v22 = 2112;
          v23 = v12;
          _os_log_impl( &dword_1874E4000,  v9,  OS_LOG_TYPE_DEFAULT,  "CacheDeleteVolume effective_size: %@ container size: %@, effective size: %@",  (uint8_t *)&v18,  0x20u);
        }
      }
    }

    else
    {
      effective_size_volume_effective_size = v3;
    }
  }

  return effective_size_volume_effective_size;
}

- (unint64_t)freespace
{
  unint64_t v3 = (void *)MEMORY[0x1895A73EC](self, a2);
  if (-[CacheDeleteVolume validate](self, "validate"))
  {
    id v4 = -[CacheDeleteVolume mountPoint](self, "mountPoint");
    uint64_t v5 = volumeFreespace((const char *)[v4 fileSystemRepresentation]);
  }

  else
  {
    CDGetLogHandle((uint64_t)"client");
    unint64_t v6 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)unint64_t v8 = 0;
      _os_log_error_impl( &dword_1874E4000,  v6,  OS_LOG_TYPE_ERROR,  "CacheDeleteVolume validate failed. Returning 0 free space",  v8,  2u);
    }

    uint64_t v5 = 0LL;
  }

  objc_autoreleasePoolPop(v3);
  return v5;
}

- (BOOL)freespaceIsStale:(unint64_t)a3
{
  uint64_t v20 = *MEMORY[0x1895F89C0];
  unint64_t v5 = -[CacheDeleteVolume freespace](self, "freespace");
  if (v5 <= a3) {
    unint64_t v6 = a3 - v5;
  }
  else {
    unint64_t v6 = v5 - a3;
  }
  unint64_t v7 = -[CacheDeleteVolume freespace](self, "freespace");
  if (v7 / 0x14 >= 0x40000000) {
    unint64_t v8 = 0x40000000LL;
  }
  else {
    unint64_t v8 = v7 / 0x14;
  }
  if (v8 <= 0x9600000) {
    unint64_t v9 = 157286400LL;
  }
  else {
    unint64_t v9 = v8;
  }
  CDGetLogHandle((uint64_t)"client");
  unint64_t v10 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    int v14 = 134218496;
    unint64_t v15 = v8;
    __int16 v16 = 2048;
    unint64_t v17 = v9;
    __int16 v18 = 2048;
    unint64_t v19 = v6;
    _os_log_debug_impl( &dword_1874E4000,  v10,  OS_LOG_TYPE_DEBUG,  "freespaceIsStale ceiling: %llu, freespace_diff_threshold: %llu, freespace_diff: %llu",  (uint8_t *)&v14,  0x20u);
  }

  CDGetLogHandle((uint64_t)"client");
  __int16 v11 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v13 = "NO";
    if (v6 >= v9) {
      uint64_t v13 = "YES";
    }
    int v14 = 136315138;
    unint64_t v15 = (unint64_t)v13;
    _os_log_debug_impl(&dword_1874E4000, v11, OS_LOG_TYPE_DEBUG, "freespaceIsStale: %s", (uint8_t *)&v14, 0xCu);
  }

  return v6 >= v9;
}

- (int64_t)state
{
  if (!-[CacheDeleteVolume validate](self, "validate")) {
    return 0LL;
  }
  id v3 = -[CacheDeleteVolume mountPoint](self, "mountPoint");
  int64_t v4 = volumeLowDiskState([v3 fileSystemRepresentation]);

  return v4;
}

- (BOOL)validate
{
  id v3 = (void *)MEMORY[0x1895A73EC](self, a2);
  BOOL v12 = -[CacheDeleteVolume isRoot](self, "isRoot");
  int v11 = 0;
  -[CacheDeleteVolume mountPoint](self, "mountPoint");
  int64_t v4 = (void *)objc_claimAutoreleasedReturnValue();
  _validateVolume(v4, &v12, 0LL, &v11, 0LL, 0LL, 0LL);
  unint64_t v5 = (void *)objc_claimAutoreleasedReturnValue();

  int v6 = -[CacheDeleteVolume dev](self, "dev");
  char v7 = 0;
  if (v6 == v11)
  {
    BOOL v8 = -[CacheDeleteVolume isRoot](self, "isRoot");
    if (v12 == v8)
    {
      -[CacheDeleteVolume mountPoint](self, "mountPoint");
      unint64_t v9 = (void *)objc_claimAutoreleasedReturnValue();
      char v7 = [v5 isEqualToString:v9];
    }

    else
    {
      char v7 = 0;
    }
  }

  objc_autoreleasePoolPop(v3);
  return v7;
}

- (BOOL)amountIsRational:(id)a3 freespace:(unint64_t)a4 effective_size:(unint64_t)a5 used:(unint64_t)a6 size:(unint64_t)a7
{
  uint64_t v51 = *MEMORY[0x1895F89C0];
  id v12 = a3;
  if ([v12 unsignedLongLongValue] + a4 >= a5 || objc_msgSend(v12, "unsignedLongLongValue") >= a6)
  {
    CDGetLogHandle((uint64_t)"client");
    int v14 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      -[CacheDeleteVolume mountPoint](self, "mountPoint");
      __int16 v16 = (void *)objc_claimAutoreleasedReturnValue();
      uint64_t v24 = [v12 unsignedLongLongValue];
      humanReadableNumber([v12 unsignedLongLongValue]);
      unint64_t v17 = (void *)objc_claimAutoreleasedReturnValue();
      humanReadableNumber(a4);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      unint64_t v22 = [v12 unsignedLongLongValue] + a4;
      humanReadableNumber([v12 unsignedLongLongValue] + a4);
      __int16 v18 = (void *)objc_claimAutoreleasedReturnValue();
      humanReadableNumber(a5);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      humanReadableNumber(a7);
      uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue();
      humanReadableNumber(a6);
      unint64_t v19 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138415362;
      uint64_t v26 = v16;
      __int16 v27 = 2048;
      uint64_t v28 = v24;
      __int16 v29 = 2112;
      v30 = v17;
      __int16 v31 = 2048;
      unint64_t v32 = a4;
      __int16 v33 = 2112;
      v34 = v23;
      __int16 v35 = 2048;
      unint64_t v36 = v22;
      __int16 v37 = 2112;
      v38 = v18;
      __int16 v39 = 2048;
      unint64_t v40 = a5;
      __int16 v41 = 2112;
      v42 = v21;
      __int16 v43 = 2048;
      unint64_t v44 = a7;
      __int16 v45 = 2112;
      v46 = v20;
      __int16 v47 = 2048;
      unint64_t v48 = a6;
      __int16 v49 = 2112;
      v50 = v19;
      _os_log_error_impl( &dword_1874E4000,  v14,  OS_LOG_TYPE_ERROR,  "Volume: %@ : Irrational amount: %llu (%@), plus freespace %llu (%@) = %llu (%@) > self.effective_size: %llu (%@) , real size: %llu, (%@), amount used: %llu (%@)",  buf,  0x84u);
    }

    BOOL v13 = 0;
  }

  else
  {
    BOOL v13 = 1;
  }

  return v13;
}

- (CacheDeleteVolume)initWithPath:(id)a3
{
  uint64_t v30 = *MEMORY[0x1895F89C0];
  id v4 = a3;
  v21.receiver = self;
  v21.super_class = (Class)&OBJC_CLASS___CacheDeleteVolume;
  unint64_t v22 = 0LL;
  unint64_t v5 = -[CacheDeleteVolume init](&v21, sel_init);
  if (!v5)
  {
LABEL_17:
    unint64_t v5 = v5;
    unint64_t v17 = v5;
    goto LABEL_18;
  }

  if (v4)
  {
    memset(v24, 0, sizeof(v24));
    mapVolume(v4, 0);
    int v6 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v7 = _validateVolume(v6, &v5->_isRoot, (char **)&v22, &v5->_dev, &v5->_block_size, 0x20uLL, (char *)v24);
    mountPoint = v5->_mountPoint;
    v5->_mountPoint = (NSString *)v7;

    if (v5->_mountPoint)
    {
      if (v22)
      {
        uint64_t v9 = objc_msgSend(NSString, "stringWithUTF8String:");
        fsType = v5->_fsType;
        v5->_fsType = (NSString *)v9;
      }

      uint64_t v11 = [NSString stringWithUTF8String:v24];
      bsdName = v5->_bsdName;
      v5->_bsdName = (NSString *)v11;

      uint64_t v13 = -[NSString UTF8String](v5->_mountPoint, "UTF8String");
      *(void *)&__int128 buf = 0LL;
      *((void *)&buf + 1) = &buf;
      uint64_t v26 = 0x3032000000LL;
      __int16 v27 = __Block_byref_object_copy__3;
      uint64_t v28 = __Block_byref_object_dispose__3;
      id v29 = 0LL;
      if (qword_18C4C4278 != -1)
      {
        uint64_t v20 = v13;
        dispatch_once(&qword_18C4C4278, &__block_literal_global_5);
        uint64_t v13 = v20;
      }

      block[0] = MEMORY[0x1895F87A8];
      block[1] = 3221225472LL;
      block[2] = __cdVolumeThresholdsForMountPoint_block_invoke_2;
      block[3] = &unk_18A066370;
      block[4] = &buf;
      block[5] = v13;
      dispatch_sync((dispatch_queue_t)qword_18C4C4270, block);
      int v14 = (NSDictionary *)*(id *)(*((void *)&buf + 1) + 40LL);
      _Block_object_dispose(&buf, 8);

      thresholds = v5->_thresholds;
      v5->_thresholds = v14;

      v5->_initialFreespace = volumeFreespace(-[NSString fileSystemRepresentation](v5->_mountPoint, "fileSystemRepresentation"));
    }

    else
    {
      CDGetLogHandle((uint64_t)"client");
      __int16 v18 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
      {
        LODWORD(buf) = 138412290;
        *(void *)((char *)&buf + 4) = v4;
        _os_log_debug_impl( &dword_1874E4000,  v18,  OS_LOG_TYPE_DEBUG,  "unable to validate volume: %@",  (uint8_t *)&buf,  0xCu);
      }

      unint64_t v5 = 0LL;
    }

    if (v22) {
      free(v22);
    }
    goto LABEL_17;
  }

  CDGetLogHandle((uint64_t)"client");
  __int16 v16 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
  {
    LOWORD(buf) = 0;
    _os_log_error_impl(&dword_1874E4000, v16, OS_LOG_TYPE_ERROR, "path is NIL", (uint8_t *)&buf, 2u);
  }

  unint64_t v17 = 0LL;
LABEL_18:

  return v17;
}

+ (CacheDeleteVolume)volumeWithPath:(id)a3
{
  id v4 = a3;
  unint64_t v5 = (void *)[objc_alloc((Class)a1) initWithPath:v4];

  return (CacheDeleteVolume *)v5;
}

+ (CacheDeleteVolume)volumeWithMountpoint:(id)a3
{
  id v4 = a3;
  unint64_t v5 = (void *)[objc_alloc((Class)a1) initWithPath:v4];
  [v5 mountPoint];
  int v6 = (void *)objc_claimAutoreleasedReturnValue();
  [v6 stringByStandardizingPath];
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 stringByStandardizingPath];
  BOOL v8 = (void *)objc_claimAutoreleasedReturnValue();

  LODWORD(v4) = [v7 isEqualToString:v8];
  if ((_DWORD)v4) {
    id v9 = v5;
  }
  else {
    id v9 = 0LL;
  }

  return (CacheDeleteVolume *)v9;
}

+ (CacheDeleteVolume)volumeWithUUID:(id)a3
{
  uint64_t v20 = *MEMORY[0x1895F89C0];
  id v3 = a3;
  if (v3)
  {
    __int128 v17 = 0u;
    __int128 v18 = 0u;
    __int128 v15 = 0u;
    __int128 v16 = 0u;
    getLocalVolumes();
    id v4 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v5 = [v4 countByEnumeratingWithState:&v15 objects:v19 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v7 = *(void *)v16;
LABEL_4:
      uint64_t v8 = 0LL;
      while (1)
      {
        if (*(void *)v16 != v7) {
          objc_enumerationMutation(v4);
        }
        +[CacheDeleteVolume volumeWithMountpoint:]( &OBJC_CLASS___CacheDeleteVolume,  "volumeWithMountpoint:",  *(void *)(*((void *)&v15 + 1) + 8 * v8),  (void)v15);
        id v9 = (void *)objc_claimAutoreleasedReturnValue();
        unint64_t v10 = v9;
        if (v9)
        {
          [v9 uuid];
          uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue();
          [v11 UUIDString];
          id v12 = (void *)objc_claimAutoreleasedReturnValue();
          char v13 = [v12 isEqualToString:v3];

          if ((v13 & 1) != 0) {
            break;
          }
        }

        if (v6 == ++v8)
        {
          uint64_t v6 = [v4 countByEnumeratingWithState:&v15 objects:v19 count:16];
          if (v6) {
            goto LABEL_4;
          }
          goto LABEL_11;
        }
      }
    }

    else
    {
LABEL_11:
      unint64_t v10 = 0LL;
    }
  }

  else
  {
    unint64_t v10 = 0LL;
  }

  return (CacheDeleteVolume *)v10;
}

+ (id)mountPointForUUID:(id)a3
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue();
  [v3 mountPoint];
  id v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (id)rootVolume
{
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = __31__CacheDeleteVolume_rootVolume__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (qword_18C4C4268 != -1) {
    dispatch_once(&qword_18C4C4268, block);
  }
  return (id)_MergedGlobals_5;
}

void __31__CacheDeleteVolume_rootVolume__block_invoke(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  getRootVolume();
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v2 = [v1 volumeWithMountpoint:v4];
  id v3 = (void *)_MergedGlobals_5;
  _MergedGlobals_5 = v2;
}

+ (id)validateVolumeAtPath:(id)a3
{
  int v6 = 0;
  if (!a3) {
    return 0LL;
  }
  mapVolume(a3, 0);
  id v3 = (void *)objc_claimAutoreleasedReturnValue();
  _validateVolume(v3, 0LL, 0LL, &v6, 0LL, 0LL, 0LL);
  id v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (int64_t)stateForPath:(id)a3
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue();
  id v4 = v3;
  if (v3) {
    int64_t v5 = volumeLowDiskState([v3 fileSystemRepresentation]);
  }
  else {
    int64_t v5 = 0LL;
  }

  return v5;
}

- (id)uuid
{
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue();
  mapVolume(v2, 0);
  id v3 = (void *)objc_claimAutoreleasedReturnValue();

  id v4 = v3;
  VolUUID((const char *)[v4 UTF8String]);
  int64_t v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)FSEventsUUID
{
  uint64_t v17 = *MEMORY[0x1895F89C0];
  id v3 = FSEventsCopyUUIDForDevice(-[CacheDeleteVolume dev](self, "dev"));
  if (!v3)
  {
    CDGetLogHandle((uint64_t)"client");
    int v6 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      id v10 = -[CacheDeleteVolume mountPoint](self, "mountPoint");
      int v13 = 136315138;
      uint64_t v14 = [v10 UTF8String];
      _os_log_error_impl( &dword_1874E4000,  v6,  OS_LOG_TYPE_ERROR,  "Unable to get FSEvents UUID for %s",  (uint8_t *)&v13,  0xCu);
    }

    goto LABEL_11;
  }

  id v4 = v3;
  CFStringRef v5 = CFUUIDCreateString(0LL, v3);
  if (!v5)
  {
    CDGetLogHandle((uint64_t)"client");
    uint64_t v11 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      int v13 = 138412290;
      uint64_t v14 = (uint64_t)v4;
      _os_log_error_impl( &dword_1874E4000,  v11,  OS_LOG_TYPE_ERROR,  "CFUUIDCreateString failed for: %@",  (uint8_t *)&v13,  0xCu);
    }

    CFRelease(v4);
    int v6 = 0LL;
LABEL_11:
    id v9 = 0LL;
    goto LABEL_12;
  }

  int v6 = (os_log_s *)v5;
  CFRelease(v4);
  CDGetLogHandle((uint64_t)"client");
  uint64_t v7 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    -[CacheDeleteVolume mountPoint](self, "mountPoint");
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
    int v13 = 138412546;
    uint64_t v14 = (uint64_t)v6;
    __int16 v15 = 2112;
    __int128 v16 = v8;
    _os_log_impl( &dword_1874E4000,  v7,  OS_LOG_TYPE_DEFAULT,  "CacheDeleteVolume FSEventsUUID: %@ for %@",  (uint8_t *)&v13,  0x16u);
  }

  id v9 = (void *)[objc_alloc(MEMORY[0x189607AB8]) initWithUUIDString:v6];
LABEL_12:

  return v9;
}

- (BOOL)containsPath:(id)a3
{
  uint64_t v19 = *MEMORY[0x1895F89C0];
  id v4 = a3;
  CFStringRef v5 = volRootFromPath((char *)[v4 UTF8String], v18);
  if (v5)
  {
    int v6 = v5;
    -[CacheDeleteVolume mountPoint](self, "mountPoint");
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue();
    [NSString stringWithUTF8String:v6];
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
    char v9 = [v7 isEqualToString:v8];
  }

  else
  {
    CDGetLogHandle((uint64_t)"client");
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled((os_log_t)v7, OS_LOG_TYPE_ERROR))
    {
      uint64_t v11 = [v4 UTF8String];
      id v12 = __error();
      int v13 = strerror(*v12);
      int v14 = 136315394;
      uint64_t v15 = v11;
      __int16 v16 = 2080;
      uint64_t v17 = v13;
      _os_log_error_impl( &dword_1874E4000,  (os_log_t)v7,  OS_LOG_TYPE_ERROR,  "Unable to get mount point for %s : %s",  (uint8_t *)&v14,  0x16u);
    }

    char v9 = 0;
  }

  return v9;
}

- (BOOL)mayContainPurgeableAmount:(id)a3 forService:(id)a4
{
  uint64_t v24 = *MEMORY[0x1895F89C0];
  id v6 = a3;
  id v7 = a4;
  unint64_t v8 = -[CacheDeleteVolume size](self, "size");
  if ([v6 longLongValue] < 0 || v8 && objc_msgSend(v6, "unsignedLongLongValue") > v8)
  {
    CDGetLogHandle((uint64_t)"client");
    char v9 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)__int128 buf = 67110146;
      int v15 = 0;
      __int16 v16 = 2112;
      id v17 = v6;
      __int16 v18 = 2048;
      unint64_t v19 = v8;
      __int16 v20 = 2112;
      id v21 = v7;
      __int16 v22 = 2112;
      v23 = self;
      _os_log_error_impl( &dword_1874E4000,  v9,  OS_LOG_TYPE_ERROR,  "Received implausible purgeable amount. Returning: (%d) passed: (%@), volume max: (%llu), service ID: (%@), volume: (%@)",  buf,  0x30u);
    }

    BOOL v10 = -[CacheDeleteVolume isRoot](self, "isRoot");
    BOOL v11 = 0;
    if (v7 && v10)
    {
      [NSString stringWithFormat:@"Service (%@) has reported (%@) purgeable for a root volume (%@) with max size (%llu)", v7, v6, self, v8];
      id v12 = (void *)objc_claimAutoreleasedReturnValue();
      CDSimulateCrash(195890387LL, v12);

      BOOL v11 = 0;
    }
  }

  else
  {
    BOOL v11 = 1;
  }

  return v11;
}

- (id)description
{
  id v21 = (void *)NSString;
  id v3 = (objc_class *)objc_opt_class();
  NSStringFromClass(v3);
  __int16 v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[CacheDeleteVolume mountPoint](self, "mountPoint");
  unint64_t v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[CacheDeleteVolume bsdName](self, "bsdName");
  id v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[CacheDeleteVolume fsType](self, "fsType");
  CFStringRef v5 = (void *)objc_claimAutoreleasedReturnValue();
  BOOL v6 = -[CacheDeleteVolume validate](self, "validate");
  id v7 = ", INVALID ";
  if (v6) {
    id v7 = "";
  }
  __int16 v18 = v7;
  unint64_t v8 = -[CacheDeleteVolume freespace](self, "freespace");
  humanReadableNumber(-[CacheDeleteVolume freespace](self, "freespace"));
  char v9 = (void *)objc_claimAutoreleasedReturnValue();
  unint64_t v10 = -[CacheDeleteVolume initialFreespace](self, "initialFreespace");
  humanReadableNumber(-[CacheDeleteVolume initialFreespace](self, "initialFreespace"));
  BOOL v11 = (void *)objc_claimAutoreleasedReturnValue();
  unint64_t v12 = -[CacheDeleteVolume used](self, "used");
  humanReadableNumber(-[CacheDeleteVolume used](self, "used"));
  int v13 = (void *)objc_claimAutoreleasedReturnValue();
  unint64_t v14 = -[CacheDeleteVolume size](self, "size");
  humanReadableNumber(-[CacheDeleteVolume size](self, "size"));
  int v15 = (void *)objc_claimAutoreleasedReturnValue();
  [v21 stringWithFormat:@"<%@> at: %@ [%@ : %@] %sfreespace: %llu (%@), initialFreespace: %llu (%@), used: %llu (%@), total size: %llu (%@)", v20, v19, v4, v5, v18, v8, v9, v10, v11, v12, v13, v14, v15];
  __int16 v16 = (void *)objc_claimAutoreleasedReturnValue();

  return v16;
}

- (unint64_t)hash
{
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue();
  unint64_t v3 = [v2 hash];

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  BOOL v5 = (objc_opt_isKindOfClass() & 1) != 0 && -[CacheDeleteVolume isEqualTo:](self, "isEqualTo:", v4);

  return v5;
}

- (BOOL)isEqualTo:(id)a3
{
  id v4 = a3;
  -[CacheDeleteVolume mountPoint](self, "mountPoint");
  BOOL v5 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 mountPoint];
  BOOL v6 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v4) = [v5 isEqualToString:v6];
  return (char)v4;
}

- (BOOL)isRoot
{
  return self->_isRoot;
}

- (NSString)fsType
{
  return self->_fsType;
}

- (NSString)mountPoint
{
  return self->_mountPoint;
}

- (unint64_t)initialFreespace
{
  return self->_initialFreespace;
}

- (NSDictionary)thresholds
{
  return self->_thresholds;
}

- (int)dev
{
  return self->_dev;
}

- (unsigned)block_size
{
  return self->_block_size;
}

- (NSString)bsdName
{
  return self->_bsdName;
}

- (void).cxx_destruct
{
}

@end