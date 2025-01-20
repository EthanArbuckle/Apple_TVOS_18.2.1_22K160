@interface SKAPFSStoreDisk
+ (BOOL)isIOMediaStoreWithDisk:(id)a3;
+ (BOOL)isLiveFSStoreWithRawIOContent:(id)a3 diskDesc:(id)a4;
- (BOOL)_cacheContainerInfo;
- (BOOL)_cacheInfo;
- (BOOL)cleanupWithError:(id *)a3;
- (SKAPFSStoreDisk)initWithDADisk:(id)a3;
- (SKAPFSStoreDisk)initWithDADisk:(id)a3 isLiveFSContainer:(BOOL)a4;
@end

@implementation SKAPFSStoreDisk

- (SKAPFSStoreDisk)initWithDADisk:(id)a3 isLiveFSContainer:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  v7 = -[SKAPFSStoreDisk init](self, "init");
  v8 = v7;
  if (v7)
  {
    if (!v6) {
      goto LABEL_10;
    }
    -[SKAPFSStoreDisk setDaDisk:](v7, "setDaDisk:", v6);
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[SKAPFSStoreDisk privateCache](v8, "privateCache"));
    [v9 setIsLiveFSContainer:v4];

    id v10 = sub_10000E2BC();
    v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      v12 = @"kernel";
      int v15 = 136315650;
      v16 = "-[SKAPFSStoreDisk(Daemon) initWithDADisk:isLiveFSContainer:]";
      __int16 v17 = 2112;
      if (v4) {
        v12 = @"liveFS";
      }
      v18 = v12;
      __int16 v19 = 2112;
      id v20 = v6;
      _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "%s: Initializing %@ APFS physical store %@",  (uint8_t *)&v15,  0x20u);
    }

    if (!-[SKAPFSStoreDisk _cacheInfo](v8, "_cacheInfo"))
    {
LABEL_10:
      v13 = 0LL;
      goto LABEL_11;
    }

    -[SKAPFSStoreDisk setIsValid:](v8, "setIsValid:", 1LL);
  }

  v13 = v8;
LABEL_11:

  return v13;
}

- (SKAPFSStoreDisk)initWithDADisk:(id)a3
{
  return -[SKAPFSStoreDisk initWithDADisk:isLiveFSContainer:](self, "initWithDADisk:isLiveFSContainer:", a3, 0LL);
}

- (BOOL)_cacheInfo
{
  v2 = self;
  objc_sync_enter(v2);
  v7.receiver = v2;
  v7.super_class = (Class)&OBJC_CLASS___SKAPFSStoreDisk;
  if (-[SKAPFSStoreDisk _cacheInfo](&v7, "_cacheInfo")
    && -[SKAPFSStoreDisk _cacheContainerInfo](v2, "_cacheContainerInfo"))
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[SKAPFSStoreDisk mediaUUID](v2, "mediaUUID"));

    if (!v3)
    {
      BOOL v4 = (void *)objc_claimAutoreleasedReturnValue(-[SKAPFSStoreDisk apfsContainerUUID](v2, "apfsContainerUUID"));
      -[SKAPFSStoreDisk setMediaUUID:](v2, "setMediaUUID:", v4);
    }

    -[SKAPFSStoreDisk setSupportsRepair:](v2, "setSupportsRepair:", 1LL);
    -[SKAPFSStoreDisk setSupportsVerify:](v2, "setSupportsVerify:", 1LL);
    -[SKAPFSStoreDisk setRole:](v2, "setRole:", kSKDiskRoleStorageImplementation);
    -[SKAPFSStoreDisk setType:](v2, "setType:", kSKDiskTypeAPFSPS);
    -[SKAPFSStoreDisk setFilesystem:](v2, "setFilesystem:", 0LL);
    -[SKAPFSStoreDisk setFilesystemType:](v2, "setFilesystemType:", kSKDiskFileSystemUndefined);
    BOOL v5 = 1;
  }

  else
  {
    BOOL v5 = 0;
  }

  objc_sync_exit(v2);

  return v5;
}

- (BOOL)_cacheContainerInfo
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SKAPFSStoreDisk privateCache](self, "privateCache"));
  unsigned int v4 = [v3 isLiveFSContainer];

  if (!v4)
  {
    v9 = objc_alloc(&OBJC_CLASS___SKIOMedia);
    id v10 = (void *)objc_claimAutoreleasedReturnValue(-[SKAPFSStoreDisk daDisk](self, "daDisk"));
    v11 = -[SKIOMedia initWithDADisk:](v9, "initWithDADisk:", v10);

    if (v11)
    {
      id v12 = -[SKIOObject newIteratorWithOptions:](v11, "newIteratorWithOptions:", 1LL);
      v13 = -[SKIOObject initWithIteratorNext:](objc_alloc(&OBJC_CLASS___SKIOMedia), "initWithIteratorNext:", v12);
      if (v13)
      {
        v14 = v13;
        do
        {
          if (IOObjectConformsTo(-[SKIOObject ioObj](v14, "ioObj"), "AppleAPFSMedia"))
          {
            id v15 = -[SKIOObject copyPropertyWithClass:key:]( v14,  "copyPropertyWithClass:key:",  objc_opt_class(&OBJC_CLASS___NSString),  @"BSD Name");
            -[SKAPFSStoreDisk setApfsContainerIdentifier:](self, "setApfsContainerIdentifier:", v15);
          }

          else if (IOObjectConformsTo(-[SKIOObject ioObj](v14, "ioObj"), "AppleAPFSContainer"))
          {
            id v19 = -[SKIOObject copyPropertyWithClass:key:]( v14,  "copyPropertyWithClass:key:",  objc_opt_class(&OBJC_CLASS___NSString),  @"UUID");
            -[SKAPFSStoreDisk setApfsContainerUUID:](self, "setApfsContainerUUID:", v19);

            break;
          }

          v16 = -[SKIOObject initWithIteratorNext:](objc_alloc(&OBJC_CLASS___SKIOMedia), "initWithIteratorNext:", v12);

          v14 = v16;
        }

        while (v16);
      }

      uint64_t v20 = objc_claimAutoreleasedReturnValue(-[SKAPFSStoreDisk apfsContainerUUID](self, "apfsContainerUUID"));
      if (v20)
      {
        v21 = (void *)v20;
        v22 = (void *)objc_claimAutoreleasedReturnValue(-[SKAPFSStoreDisk apfsContainerIdentifier](self, "apfsContainerIdentifier"));

        if (v22)
        {
          BOOL v8 = 1;
LABEL_21:

          return v8;
        }
      }

      id v23 = sub_10000E2BC();
      v24 = (os_log_s *)objc_claimAutoreleasedReturnValue(v23);
      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
      {
        v25 = (void *)objc_claimAutoreleasedReturnValue(-[SKAPFSStoreDisk diskIdentifier](self, "diskIdentifier"));
        *(_DWORD *)buf = 136315394;
        v28 = "-[SKAPFSStoreDisk(Daemon) _cacheContainerInfo]";
        __int16 v29 = 2114;
        v30 = v25;
        _os_log_impl( (void *)&_mh_execute_header,  v24,  OS_LOG_TYPE_ERROR,  "%s: Failed to get APFS container info for %{public}@",  buf,  0x16u);
      }
    }

    else
    {
      id v17 = sub_10000E2BC();
      id v12 = (id)objc_claimAutoreleasedReturnValue(v17);
      if (os_log_type_enabled((os_log_t)v12, OS_LOG_TYPE_ERROR))
      {
        v18 = (void *)objc_claimAutoreleasedReturnValue(-[SKAPFSStoreDisk diskIdentifier](self, "diskIdentifier"));
        *(_DWORD *)buf = 136315394;
        v28 = "-[SKAPFSStoreDisk(Daemon) _cacheContainerInfo]";
        __int16 v29 = 2114;
        v30 = v18;
        _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)v12,  OS_LOG_TYPE_ERROR,  "%s: Failed to get physical store IO media of %{public}@",  buf,  0x16u);
      }
    }

    BOOL v8 = 0;
    goto LABEL_21;
  }

  BOOL v5 = objc_alloc(&OBJC_CLASS___NSString);
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[SKAPFSStoreDisk diskIdentifier](self, "diskIdentifier"));
  objc_super v7 = -[NSString initWithFormat:](v5, "initWithFormat:", @"apfs://%@", v6);
  -[SKAPFSStoreDisk setApfsContainerIdentifier:](self, "setApfsContainerIdentifier:", v7);

  return 1;
}

+ (BOOL)isIOMediaStoreWithDisk:(id)a3
{
  id v3 = a3;
  unsigned int v4 = -[SKIOMedia initWithDADisk:](objc_alloc(&OBJC_CLASS___SKIOMedia), "initWithDADisk:", v3);
  BOOL v5 = v4;
  if (v4)
  {
    id v6 = -[SKIOObject newIteratorWithOptions:](v4, "newIteratorWithOptions:", 0LL);
    objc_super v7 = 0LL;
    do
    {
      BOOL v8 = v7;
      objc_super v7 = -[SKIOObject initWithIteratorNext:](objc_alloc(&OBJC_CLASS___SKIOMedia), "initWithIteratorNext:", v6);

      BOOL v9 = v7 != 0LL;
    }

    while (v7 && !IOObjectConformsTo(-[SKIOObject ioObj](v7, "ioObj"), "AppleAPFSContainerScheme"));
  }

  else
  {
    BOOL v9 = 0;
  }

  return v9;
}

+ (BOOL)isLiveFSStoreWithRawIOContent:(id)a3 diskDesc:(id)a4
{
  return 0;
}

- (BOOL)cleanupWithError:(id *)a3
{
  unsigned int v4 = (void *)objc_claimAutoreleasedReturnValue(-[SKAPFSStoreDisk container](self, "container"));
  LOBYTE(a3) = [v4 cleanupWithError:a3];

  return (char)a3;
}

@end