@interface SKAPFSContainerDisk
+ (id)copyExtendedSpaceInfoWithDiskIdentifier:(id)a3 containerBSDName:(id)a4;
+ (id)copyPhysicalStoresMediaWithDADisk:(id)a3;
- (BOOL)_cacheInfo;
- (BOOL)_cacheSpacesWithPurgeable:(BOOL)a3;
- (BOOL)_supportsRecaching;
- (BOOL)cleanupWithError:(id *)a3;
- (SKAPFSContainerDisk)initWithPhysicalStoreDisk:(id)a3;
- (id)copyDesignatedPhysicalStoreUUID;
- (id)copyPhysicalStoresIOMedia;
- (id)copyPhysicalStoresUUIDs;
- (void)_cacheIsWholeDiskWithDiskDescription:(id)a3;
@end

@implementation SKAPFSContainerDisk

- (BOOL)_cacheInfo
{
  v2 = self;
  objc_sync_enter(v2);
  v11.receiver = v2;
  v11.super_class = (Class)&OBJC_CLASS___SKAPFSContainerDisk;
  if (!-[SKAPFSContainerDisk _cacheInfo](&v11, "_cacheInfo"))
  {
LABEL_8:
    BOOL v6 = 0;
    goto LABEL_9;
  }

  if ((-[SKAPFSContainerDisk isLiveFSAPFSDisk](v2, "isLiveFSAPFSDisk") & 1) == 0)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[SKAPFSContainerDisk mediaUUID](v2, "mediaUUID"));
    BOOL v4 = v3 == 0LL;

    if (v4)
    {
      id v7 = sub_10000E2BC();
      v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        v9 = (void *)objc_claimAutoreleasedReturnValue(-[SKAPFSContainerDisk diskIdentifier](v2, "diskIdentifier"));
        *(_DWORD *)buf = 136315394;
        v13 = "-[SKAPFSContainerDisk(Daemon) _cacheInfo]";
        __int16 v14 = 2114;
        v15 = v9;
        _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_ERROR,  "%s: APFS container %{public}@ has no UUID",  buf,  0x16u);
      }

      goto LABEL_8;
    }
  }

  id v5 = -[SKAPFSContainerDisk copyDesignatedPhysicalStoreUUID](v2, "copyDesignatedPhysicalStoreUUID");
  -[SKAPFSContainerDisk setDesignatedPSUUID:](v2, "setDesignatedPSUUID:", v5);

  -[SKAPFSContainerDisk setRole:](v2, "setRole:", kSKDiskRoleStorageImplementation);
  -[SKAPFSContainerDisk setType:](v2, "setType:", kSKDiskTypeAPFSContainer);
  -[SKAPFSContainerDisk setSupportsVerify:](v2, "setSupportsVerify:", 1LL);
  -[SKAPFSContainerDisk setSupportsRepair:](v2, "setSupportsRepair:", 1LL);
  -[SKAPFSContainerDisk setFilesystem:](v2, "setFilesystem:", 0LL);
  -[SKAPFSContainerDisk setFilesystemType:](v2, "setFilesystemType:", kSKDiskFileSystemUndefined);
  BOOL v6 = 1;
LABEL_9:
  objc_sync_exit(v2);

  return v6;
}

- (BOOL)_cacheSpacesWithPurgeable:(BOOL)a3
{
  v3 = self;
  objc_sync_enter(v3);
  if ((-[SKAPFSContainerDisk isLiveFSAPFSDisk](v3, "isLiveFSAPFSDisk") & 1) == 0)
  {
    BOOL v4 = (void *)objc_claimAutoreleasedReturnValue(-[SKAPFSContainerDisk diskIdentifier](v3, "diskIdentifier"));
    id v5 = (void *)objc_claimAutoreleasedReturnValue(-[SKAPFSContainerDisk diskIdentifier](v3, "diskIdentifier"));
    id v6 = +[SKAPFSContainerDisk copyExtendedSpaceInfoWithDiskIdentifier:containerBSDName:]( &OBJC_CLASS___SKAPFSContainerDisk,  "copyExtendedSpaceInfoWithDiskIdentifier:containerBSDName:",  v4,  v5);

    id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKeyedSubscript:@"size"]);
    -[SKAPFSContainerDisk setTotalSpace:](v3, "setTotalSpace:", sub_1000124CC(v7));

    v8 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKeyedSubscript:@"used"]);
    id v9 = sub_1000124CC(v8);

    v10 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKeyedSubscript:@"reserve"]);
    id v11 = sub_1000124CC(v10);

    unint64_t v12 = (unint64_t)v9 + (void)v11;
    else {
      v13 = (char *)-[SKAPFSContainerDisk totalSpace](v3, "totalSpace") - v12;
    }
    -[SKAPFSContainerDisk setAvailableSpace:](v3, "setAvailableSpace:", v13);
    -[SKAPFSContainerDisk setFreeSpace:](v3, "setFreeSpace:", v13);
  }

  objc_sync_exit(v3);

  return 1;
}

- (void)_cacheIsWholeDiskWithDiskDescription:(id)a3
{
}

+ (id)copyPhysicalStoresMediaWithDADisk:(id)a3
{
  id v3 = a3;
  BOOL v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  id v5 = -[SKIOMedia initWithDADisk:](objc_alloc(&OBJC_CLASS___SKIOMedia), "initWithDADisk:", v3);
  id v6 = v5;
  if (v5)
  {
    id v7 = -[SKIOObject copyParent](v5, "copyParent");
    v8 = v7;
    if (v7)
    {
      id v9 = [v7 newIteratorWithOptions:2];
      v10 = -[SKIOObject initWithIteratorNext:](objc_alloc(&OBJC_CLASS___SKIOMedia), "initWithIteratorNext:", v9);
      if (v10)
      {
        id v11 = v10;
        do
        {
          if (IOObjectConformsTo(-[SKIOObject ioObj](v11, "ioObj"), "IOMedia")) {
            [v4 addObject:v11];
          }
          unint64_t v12 = -[SKIOObject initWithIteratorNext:](objc_alloc(&OBJC_CLASS___SKIOMedia), "initWithIteratorNext:", v9);

          id v11 = v12;
        }

        while (v12);
      }

      id v13 = v4;
    }

    else
    {
      id v15 = v4;
    }
  }

  else
  {
    id v14 = v4;
  }

  return v4;
}

- (id)copyPhysicalStoresIOMedia
{
  if (-[SKAPFSContainerDisk isLiveFSAPFSDisk](self, "isLiveFSAPFSDisk"))
  {
    id v3 = objc_alloc(&OBJC_CLASS___SKIOMedia);
    BOOL v4 = (void *)objc_claimAutoreleasedReturnValue(-[SKAPFSContainerDisk daDisk](self, "daDisk"));
    id v5 = -[SKIOMedia initWithDADisk:](v3, "initWithDADisk:", v4);

    if (v5)
    {
      v10 = v5;
      id v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v10, 1LL));
    }

    else
    {
      id v6 = &__NSArray0__struct;
    }

    return v6;
  }

  else
  {
    id v7 = (void *)objc_claimAutoreleasedReturnValue(-[SKAPFSContainerDisk daDisk](self, "daDisk"));
    id v8 = +[SKAPFSContainerDisk copyPhysicalStoresMediaWithDADisk:]( &OBJC_CLASS___SKAPFSContainerDisk,  "copyPhysicalStoresMediaWithDADisk:",  v7);

    return v8;
  }

- (id)copyPhysicalStoresUUIDs
{
  id v2 = -[SKAPFSContainerDisk copyPhysicalStoresIOMedia](self, "copyPhysicalStoresIOMedia");
  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  id v4 = v2;
  id v5 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v14;
    do
    {
      id v8 = 0LL;
      do
      {
        if (*(void *)v14 != v7) {
          objc_enumerationMutation(v4);
        }
        id v9 = *(void **)(*((void *)&v13 + 1) + 8LL * (void)v8);
        uint64_t v10 = objc_opt_class(&OBJC_CLASS___NSString);
        id v11 = objc_msgSend(v9, "copyPropertyWithClass:key:", v10, @"UUID", (void)v13);
        if (v11) {
          [v3 addObject:v11];
        }

        id v8 = (char *)v8 + 1;
      }

      while (v6 != v8);
      id v6 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }

    while (v6);
  }

  return v3;
}

- (id)copyDesignatedPhysicalStoreUUID
{
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  __int128 v18 = 0u;
  id v2 = -[SKAPFSContainerDisk copyPhysicalStoresIOMedia](self, "copyPhysicalStoresIOMedia");
  id v3 = [v2 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v3)
  {
    id v4 = v3;
    id v5 = 0LL;
    uint64_t v6 = *(void *)v16;
    while (2)
    {
      for (i = 0LL; i != v4; i = (char *)i + 1)
      {
        if (*(void *)v16 != v6) {
          objc_enumerationMutation(v2);
        }
        id v8 = *(void **)(*((void *)&v15 + 1) + 8LL * (void)i);
        uint64_t v9 = objc_opt_class(&OBJC_CLASS___NSString);
        id v10 = objc_msgSend(v8, "copyPropertyWithClass:key:", v9, @"UUID", (void)v15);
        id v11 = v10;
        if (v10)
        {
          if (v5)
          {
            id v12 = [v8 copyPropertyWithClass:objc_opt_class(NSString) key:@"TierType"];
            __int128 v13 = v12;
            if (v12 && ([v12 isEqualToString:@"Secondary"] & 1) != 0)
            {

              goto LABEL_18;
            }
          }

          else
          {
            id v5 = v10;
          }
        }
      }

      id v4 = [v2 countByEnumeratingWithState:&v15 objects:v19 count:16];
      if (v4) {
        continue;
      }
      break;
    }
  }

  else
  {
    id v5 = 0LL;
  }

  id v5 = v5;
  id v11 = v5;
LABEL_18:

  return v11;
}

+ (id)copyExtendedSpaceInfoWithDiskIdentifier:(id)a3 containerBSDName:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(+[SKDaemonManager sharedManager](&OBJC_CLASS___SKDaemonManager, "sharedManager"));
  id v8 = (os_log_s *)[v7 copyExtendedDiskInfoWithDiskIdentifier:v5];

  if (!v8)
  {
    if (v6)
    {
      v21 = 0LL;
      id v9 = sub_10000E2BC();
      id v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315650;
        v23 = "+[SKAPFSContainerDisk(Daemon) copyExtendedSpaceInfoWithDiskIdentifier:containerBSDName:]";
        __int16 v24 = 2114;
        id v25 = v6;
        __int16 v26 = 2114;
        id v27 = v5;
        _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "%s: Caching APFS extended info for %{public}@, asked by %{public}@",  buf,  0x20u);
      }

      id v11 = v6;
      int v12 = APFSExtendedSpaceInfo([v11 fileSystemRepresentation], &v21);
      if (v12 || (__int128 v13 = v21) == 0LL)
      {
        id v19 = sub_10000E2BC();
        __int128 v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(v19);
        if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136315650;
          v23 = "+[SKAPFSContainerDisk(Daemon) copyExtendedSpaceInfoWithDiskIdentifier:containerBSDName:]";
          __int16 v24 = 2114;
          id v25 = v11;
          __int16 v26 = 1024;
          LODWORD(v27) = v12;
          _os_log_impl( (void *)&_mh_execute_header,  v18,  OS_LOG_TYPE_ERROR,  "%s: APFSExtendedSpaceInfo failed for %{public}@ with error %d",  buf,  0x1Cu);
        }

        id v8 = 0LL;
      }

      else
      {
        __int128 v14 = (void *)objc_claimAutoreleasedReturnValue(+[SKDaemonManager sharedManager](&OBJC_CLASS___SKDaemonManager, "sharedManager"));
        [v14 _addToExtendedDiskInfoCacheWithDictionary:v13];

        __int128 v15 = (void *)objc_claimAutoreleasedReturnValue([v13 objectForKeyedSubscript:v5]);
        if (!v15)
        {
          id v16 = sub_10000E2BC();
          __int128 v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);
          if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 136315394;
            v23 = "+[SKAPFSContainerDisk(Daemon) copyExtendedSpaceInfoWithDiskIdentifier:containerBSDName:]";
            __int16 v24 = 2114;
            id v25 = v5;
            _os_log_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_ERROR,  "%s: Cannot get APFS extended space info for %{public}@",  buf,  0x16u);
          }
        }

        __int128 v18 = v15;

        id v8 = v18;
      }
    }

    else
    {
      id v8 = 0LL;
    }
  }

  return v8;
}

- (BOOL)_supportsRecaching
{
  return -[SKAPFSContainerDisk isLiveFSAPFSDisk](self, "isLiveFSAPFSDisk") ^ 1;
}

- (SKAPFSContainerDisk)initWithPhysicalStoreDisk:(id)a3
{
  id v4 = (__DADisk *)a3;
  id v5 = -[SKAPFSContainerDisk init](self, "init");
  id v6 = v5;
  if (!v5) {
    goto LABEL_6;
  }
  if (!v4) {
    goto LABEL_10;
  }
  -[SKAPFSContainerDisk setDaDisk:](v5, "setDaDisk:", v4);
  BSDName = DADiskGetBSDName(v4);
  if (!BSDName)
  {
    id v15 = sub_10000E2BC();
    id v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(v15);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      id v19 = "-[SKAPFSContainerDisk(Daemon) initWithPhysicalStoreDisk:]";
      __int16 v20 = 2112;
      v21 = v4;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_ERROR, "%s: Failed to get BSD name of %@", buf, 0x16u);
    }

    goto LABEL_10;
  }

  id v8 = -[NSString initWithUTF8String:](objc_alloc(&OBJC_CLASS___NSString), "initWithUTF8String:", BSDName);
  id v9 = (void *)objc_claimAutoreleasedReturnValue(-[SKAPFSContainerDisk privateCache](v6, "privateCache"));
  [v9 setLiveDiskIdentifier:v8];

  id v10 = objc_alloc(&OBJC_CLASS___NSString);
  id v11 = (void *)objc_claimAutoreleasedReturnValue(-[SKAPFSContainerDisk privateCache](v6, "privateCache"));
  int v12 = (void *)objc_claimAutoreleasedReturnValue([v11 liveDiskIdentifier]);
  __int128 v13 = -[NSString initWithFormat:](v10, "initWithFormat:", @"apfs://%@", v12);
  -[SKAPFSContainerDisk setDiskIdentifier:](v6, "setDiskIdentifier:", v13);

  if (!-[SKAPFSContainerDisk _cacheInfo](v6, "_cacheInfo"))
  {
LABEL_10:
    __int128 v14 = 0LL;
    goto LABEL_11;
  }

  -[SKAPFSContainerDisk setIsValid:](v6, "setIsValid:", 1LL);
LABEL_6:
  __int128 v14 = v6;
LABEL_11:

  return v14;
}

- (BOOL)cleanupWithError:(id *)a3
{
  __int128 v17 = 0u;
  __int128 v18 = 0u;
  __int128 v19 = 0u;
  __int128 v20 = 0u;
  id v5 = (id)objc_claimAutoreleasedReturnValue(-[SKAPFSContainerDisk volumes](self, "volumes"));
  id v6 = [v5 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v18;
    while (2)
    {
      for (i = 0LL; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v18 != v8) {
          objc_enumerationMutation(v5);
        }
        if (![*(id *)(*((void *)&v17 + 1) + 8 * (void)i) cleanupWithError:a3])
        {
          BOOL v15 = 0;
          goto LABEL_12;
        }
      }

      id v7 = [v5 countByEnumeratingWithState:&v17 objects:v21 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }

  id v10 = (void *)objc_claimAutoreleasedReturnValue(-[SKAPFSContainerDisk diskIdentifier](self, "diskIdentifier"));
  id v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"/dev/%@", v10));

  id v5 = v11;
  APFSContainerWipeVolumeKeys([v5 UTF8String]);
  int v12 = objc_alloc(&OBJC_CLASS___SKIOMedia);
  __int128 v13 = (void *)objc_claimAutoreleasedReturnValue(-[SKAPFSContainerDisk diskIdentifier](self, "diskIdentifier"));
  __int128 v14 = -[SKIOMedia initWithDevName:](v12, "initWithDevName:", v13);

  -[SKIOObject waitIOKitQuiet](v14, "waitIOKitQuiet");
  BOOL v15 = 1;
LABEL_12:

  return v15;
}

@end