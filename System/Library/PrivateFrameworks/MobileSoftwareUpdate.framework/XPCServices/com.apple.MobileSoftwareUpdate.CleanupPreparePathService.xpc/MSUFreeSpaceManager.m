@interface MSUFreeSpaceManager
+ (id)sharedInstance;
- (BOOL)requestFreeSpace:(unint64_t)a3 allowSpecialCaseUrgency:(id)a4 disableMobileAssetPurge:(id)a5 disableSpecialCaseUrgency:(id)a6 disableAPFSReserve:(id)a7 error:(id *)a8;
- (BOOL)resetAPFSFreeBlocksThreshold:(id *)a3;
- (BOOL)setAPFSFreeBlocksThreshold:(unsigned int)a3 error:(id *)a4;
- (MSUFreeSpaceManager)initWithMountedDataVolume:(id)a3;
- (NSString)dataMountPoint;
- (id)description;
- (id)metricInfo:(BOOL)a3;
- (unint64_t)availableSpace:(id *)a3;
- (unint64_t)purgeableSpace:(id *)a3;
- (unsigned)getAPFSFreeBlocksThreshold:(id *)a3;
- (void)dealloc;
- (void)discardOldCacheDeletePaths;
- (void)setDataMountPoint:(id)a3;
@end

@implementation MSUFreeSpaceManager

+ (id)sharedInstance
{
  if (sharedInstance_pred != -1) {
    dispatch_once(&sharedInstance_pred, &__block_literal_global_2);
  }
  return (id)sharedInstance___instance;
}

void __37__MSUFreeSpaceManager_sharedInstance__block_invoke(id a1)
{
  v1 = objc_autoreleasePoolPush();
  sharedInstance___instance = -[MSUFreeSpaceManager initWithMountedDataVolume:]( objc_alloc(&OBJC_CLASS___MSUFreeSpaceManager),  "initWithMountedDataVolume:",  @"/private/var");
  objc_autoreleasePoolPop(v1);
}

- (MSUFreeSpaceManager)initWithMountedDataVolume:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS___MSUFreeSpaceManager;
  v4 = -[MSUFreeSpaceManager init](&v7, "init");
  v5 = v4;
  if (v4)
  {
    -[MSUFreeSpaceManager setDataMountPoint:](v4, "setDataMountPoint:", a3);
    *(_OWORD *)&v5->_purgeableRequested = 0u;
    *(_OWORD *)&v5->_manuallyPurged = 0u;
  }

  return v5;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___MSUFreeSpaceManager;
  -[MSUFreeSpaceManager dealloc](&v3, "dealloc");
}

- (BOOL)requestFreeSpace:(unint64_t)a3 allowSpecialCaseUrgency:(id)a4 disableMobileAssetPurge:(id)a5 disableSpecialCaseUrgency:(id)a6 disableAPFSReserve:(id)a7 error:(id *)a8
{
  if (a8) {
    *a8 = 0LL;
  }
  return 1;
}

- (void)discardOldCacheDeletePaths
{
  v2 = +[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager");
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  uint64_t v3 = 0LL;
  id v4 = [&off_10006C970 countByEnumeratingWithState:&v14 objects:v23 count:16];
  if (v4)
  {
    uint64_t v5 = *(void *)v15;
    do
    {
      v6 = 0LL;
      do
      {
        if (*(void *)v15 != v5) {
          objc_enumerationMutation(&off_10006C970);
        }
        objc_super v7 = *(void **)(*((void *)&v14 + 1) + 8LL * (void)v6);
        memset(&v22, 0, sizeof(v22));
        if (!lstat((const char *)[v7 UTF8String], &v22))
        {
          uint64_t v13 = 0LL;
          uint64_t v8 = size_directory((char *)[v7 UTF8String]);
          if (([v7 hasSuffix:@"/"] & 1) == 0
            && -[NSFileManager removeItemAtPath:error:](v2, "removeItemAtPath:error:", v7, &v13)
            || [v7 hasSuffix:@"/"]
            && -[NSFileManager removeItemsUnderPath:error:](v2, "removeItemsUnderPath:error:", v7, &v13))
          {
            v9 = (os_log_s *)msuSharedLogger();
            v3 += v8;
            if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412290;
              v19 = v7;
              _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "Successfully removed old CacheDelete path %@",  buf,  0xCu);
            }
          }

          else
          {
            v10 = (os_log_s *)msuSharedLogger();
            if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138412546;
              v19 = v7;
              __int16 v20 = 2112;
              uint64_t v21 = v13;
              _os_log_error_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_ERROR,  "Failed to remove old CacheDelete path %@: %@",  buf,  0x16u);
            }
          }
        }

        v6 = (char *)v6 + 1;
      }

      while (v4 != v6);
      id v4 = [&off_10006C970 countByEnumeratingWithState:&v14 objects:v23 count:16];
    }

    while (v4);
  }

  v11 = (os_log_s *)msuSharedLogger();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    v22.st_dev = 134218240;
    *(void *)&v22.st_mode = v3;
    WORD2(v22.st_ino) = 2048;
    *(__darwin_ino64_t *)((char *)&v22.st_ino + 6) = v3 / 0x100000;
    _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "Manually purged %lld bytes (%lld MB) from old CacheDelete paths.",  (uint8_t *)&v22,  0x16u);
  }

  self->_manuallyPurged += v3;
  objc_sync_exit(self);
}

- (unsigned)getAPFSFreeBlocksThreshold:(id *)a3
{
  unsigned int v14 = 0;
  size_t v13 = 4LL;
  if (sysctlbyname("vfs.generic.apfs.proc_free_blocks_threshold", &v14, &v13, 0LL, 0LL))
  {
    uint64_t v5 = *__error();
    NSErrorUserInfoKey v17 = NSDebugDescriptionErrorKey;
    v6 = __error();
    v18 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"sysctlbyname(%s) failed: %s",  "vfs.generic.apfs.proc_free_blocks_threshold",  strerror(*v6));
    objc_super v7 = +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  NSPOSIXErrorDomain,  v5,  +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v18,  &v17,  1LL));
    v15[0] = NSDebugDescriptionErrorKey;
    v15[1] = NSUnderlyingErrorKey;
    v16[0] = @"failed to get APFS free blocks threshold";
    v16[1] = v7;
    uint64_t v8 = +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"MobileSoftwareUpdateErrorDomain",  71LL,  +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v16,  v15,  2LL));
  }

  else
  {
    uint64_t v9 = v14;
    unint64_t blockSize = self->_blockSize;
    v11 = (os_log_s *)msuSharedLogger();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109376;
      unsigned int v20 = v14;
      __int16 v21 = 2048;
      unint64_t v22 = (blockSize * v9) >> 20;
      _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "Successfully got APFS free blocks threshold: %d blocks (%lld MB)",  buf,  0x12u);
    }

    uint64_t v8 = 0LL;
  }

  objc_sync_exit(self);
  if (a3) {
    *a3 = v8;
  }
  return 0;
}

- (BOOL)setAPFSFreeBlocksThreshold:(unsigned int)a3 error:(id *)a4
{
  return 1;
}

- (BOOL)resetAPFSFreeBlocksThreshold:(id *)a3
{
  return -[MSUFreeSpaceManager setAPFSFreeBlocksThreshold:error:](self, "setAPFSFreeBlocksThreshold:error:", 8096LL, a3);
}

- (unint64_t)availableSpace:(id *)a3
{
  uint64_t v5 = (__CFString *)-[NSString copy](self->_dataMountPoint, "copy");
  objc_sync_exit(self);
  if (v5) {
    v6 = v5;
  }
  else {
    v6 = @"/private/var";
  }
  bzero(&v15, 0x878uLL);
  objc_super v7 = (const char *)-[__CFString UTF8String](v6, "UTF8String");
  if (!statfs(v7, &v15))
  {
    v10 = 0LL;
    unint64_t v11 = v15.f_bavail * v15.f_bsize;
    if (!a3) {
      goto LABEL_7;
    }
    goto LABEL_6;
  }

  uint64_t v8 = *__error();
  NSErrorUserInfoKey v13 = NSDebugDescriptionErrorKey;
  uint64_t v9 = __error();
  unsigned int v14 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"statfs(%s) failed : %s",  v7,  strerror(*v9),  NSDebugDescriptionErrorKey);
  v10 = +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  NSPOSIXErrorDomain,  v8,  +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v14,  &v13,  1LL));
  unint64_t v11 = 0LL;
  if (a3) {
LABEL_6:
  }
    *a3 = v10;
LABEL_7:

  return v11;
}

- (unint64_t)purgeableSpace:(id *)a3
{
  return 0LL;
}

- (id)metricInfo:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = +[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary");
  unint64_t manuallyPurged = self->_manuallyPurged;
  if (manuallyPurged) {
    objc_msgSend( v5,  "setObject:forKeyedSubscript:",  +[NSNumber numberWithUnsignedLongLong:]( NSNumber,  "numberWithUnsignedLongLong:",  manuallyPurged >> 20),  @"purgedManually");
  }
  unint64_t purgeableRequested = self->_purgeableRequested;
  if (purgeableRequested)
  {
    objc_msgSend( v5,  "setObject:forKeyedSubscript:",  +[NSNumber numberWithUnsignedLongLong:]( NSNumber,  "numberWithUnsignedLongLong:",  purgeableRequested >> 20),  @"purgeableRequested");
    objc_msgSend( v5,  "setObject:forKeyedSubscript:",  +[NSNumber numberWithUnsignedLongLong:]( NSNumber,  "numberWithUnsignedLongLong:",  self->_purgeableRequested >> 20),  @"purgeableReceived");
    objc_msgSend( v5,  "setObject:forKeyedSubscript:",  +[NSNumber numberWithLongLong:](NSNumber, "numberWithLongLong:", self->_netPurgedBytes / 0x100000),  @"purgedMeasured");
  }

  if (v3)
  {
    *(_OWORD *)&self->_unint64_t manuallyPurged = 0u;
    *(_OWORD *)&self->_unint64_t purgeableRequested = 0u;
  }

  return +[NSDictionary dictionaryWithDictionary:](&OBJC_CLASS___NSDictionary, "dictionaryWithDictionary:", v5);
}

- (NSString)dataMountPoint
{
  dataMountPoint = self->_dataMountPoint;
  objc_sync_exit(self);
  return dataMountPoint;
}

- (void)setDataMountPoint:(id)a3
{
  self->_dataMountPoint = (NSString *)[a3 copy];
  bzero(&v11, 0x878uLL);
  id v5 = (const char *)[a3 UTF8String];
  if (statfs(v5, &v11))
  {
    v6 = (os_log_s *)msuSharedLogger();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      objc_super v7 = __error();
      uint64_t v8 = strerror(*v7);
      -[MSUFreeSpaceManager setDataMountPoint:].cold.1((uint64_t)v8, v10, (uint64_t)v5, v6);
    }

    unint64_t f_bsize = 4096LL;
  }

  else
  {
    unint64_t f_bsize = v11.f_bsize;
  }

  self->_unint64_t blockSize = f_bsize;
  objc_sync_exit(self);
}

- (id)description
{
  BOOL v3 = (objc_class *)objc_opt_class(self);
  id v4 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"\n<%@>\n\tdataMountPoint = %@\n\t_blockSize=%llu\n\tmetrics = %@",  NSStringFromClass(v3),  self->_dataMountPoint,  self->_blockSize,  -[MSUFreeSpaceManager metricInfo:](self, "metricInfo:", 0LL));
  objc_sync_exit(self);
  if (!v4)
  {
    v6.receiver = self;
    v6.super_class = (Class)&OBJC_CLASS___MSUFreeSpaceManager;
    return -[MSUFreeSpaceManager description](&v6, "description");
  }

  return v4;
}

- (void)setDataMountPoint:(uint64_t)a3 .cold.1(uint64_t a1, uint8_t *buf, uint64_t a3, os_log_t log)
{
  *(_DWORD *)buf = 136315394;
  *(void *)(buf + 4) = a3;
  *((_WORD *)buf + 6) = 2080;
  *(void *)(buf + 14) = a1;
  _os_log_error_impl( (void *)&_mh_execute_header,  log,  OS_LOG_TYPE_ERROR,  "Assuming default 4K block size because statfs(%s) failed : %s",  buf,  0x16u);
}

@end