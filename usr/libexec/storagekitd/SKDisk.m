@interface SKDisk
+ (id)copySortedChildrenWithDADisk:(id)a3 ioMedia:(id)a4;
+ (id)newSortedChildrenWithIOMedia:(id)a3;
- (BOOL)_cacheInfo;
- (BOOL)_cacheInfoForDADisk:(id)a3;
- (BOOL)_cacheInfoWithDiskDescription:(id)a3;
- (BOOL)_cacheInfoWithIOMedia:(id)a3;
- (BOOL)_cacheSpacesWithPurgeable:(BOOL)a3;
- (BOOL)_supportsRecaching;
- (BOOL)canUpdateDiskIdentifierWithDiskInfo:(id)a3;
- (BOOL)isRealEFIPartition;
- (BOOL)reProbeWithError:(id *)a3;
- (SKDisk)init;
- (SKDisk)initWithDADisk:(id)a3;
- (SKMountState)previousMount;
- (id)_getFilesystem;
- (id)filesystemWithType:(id)a3;
- (id)liveDiskIdentifierWithDiskDescription:(id)a3;
- (id)volumeNameWithDiskDescription:(id)a3;
- (unsigned)_getOwnerUsingStat;
- (void)_cacheFilesystem;
- (void)_cacheIsWholeDiskWithDiskDescription:(id)a3;
- (void)_cacheNoFilesystem;
- (void)setPreviousMount:(id)a3;
@end

@implementation SKDisk

- (SKDisk)init
{
  v11.receiver = self;
  v11.super_class = (Class)&OBJC_CLASS___SKDisk;
  v2 = -[SKDisk init](&v11, "init");
  if (v2)
  {
    v3 = objc_alloc(&OBJC_CLASS___NSNumber);
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[SKDaemonManager sharedManager](&OBJC_CLASS___SKDaemonManager, "sharedManager"));
    v5 = -[NSNumber initWithUnsignedLongLong:](v3, "initWithUnsignedLongLong:", [v4 nextDiskObjectID]);
    -[SKDisk setDiskObjectID:](v2, "setDiskObjectID:", v5);

    id v6 = sub_10000E2BC();
    v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue(-[SKDisk diskObjectID](v2, "diskObjectID"));
      *(_DWORD *)buf = 136315394;
      v13 = "-[SKDisk(DaemonAdditions) init]";
      __int16 v14 = 2114;
      v15 = v8;
      _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "%s: Initializing new disk with ID %{public}@",  buf,  0x16u);
    }

    v9 = objc_alloc_init(&OBJC_CLASS___SKDiskPrivateCache);
    -[SKDisk setPrivateCache:](v2, "setPrivateCache:", v9);
  }

  return v2;
}

- (SKDisk)initWithDADisk:(id)a3
{
  id v4 = a3;
  v5 = -[SKDisk init](self, "init");
  id v6 = v5;
  if (v5)
  {
    if (!v4 || (-[SKDisk setDaDisk:](v5, "setDaDisk:", v4), !-[SKDisk _cacheInfo](v6, "_cacheInfo")))
    {
      v7 = 0LL;
      goto LABEL_7;
    }

    -[SKDisk setIsValid:](v6, "setIsValid:", 1LL);
  }

  v7 = v6;
LABEL_7:

  return v7;
}

- (BOOL)canUpdateDiskIdentifierWithDiskInfo:(id)a3
{
  return 0;
}

- (BOOL)_cacheInfo
{
  v2 = self;
  objc_sync_enter(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SKDisk daDisk](v2, "daDisk"));
  unsigned __int8 v4 = -[SKDisk _cacheInfoForDADisk:](v2, "_cacheInfoForDADisk:", v3);

  objc_sync_exit(v2);
  return v4;
}

- (BOOL)_cacheInfoForDADisk:(id)a3
{
  unsigned __int8 v4 = (__DADisk *)a3;
  CFDictionaryRef v5 = DADiskCopyDescription(v4);
  if (!v5)
  {
    id v15 = sub_10000E2BC();
    __int16 v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v15);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      int v34 = 136315138;
      v35 = "-[SKDisk(DaemonAdditions) _cacheInfoForDADisk:]";
      _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_ERROR,  "%s: DADiskCopyDescription failed",  (uint8_t *)&v34,  0xCu);
    }

    goto LABEL_28;
  }

  if (-[SKDisk _cacheInfoWithDiskDescription:](self, "_cacheInfoWithDiskDescription:", v5))
  {
    if (!-[SKDisk isIOMediaDisk](self, "isIOMediaDisk"))
    {
      __int16 v14 = 0LL;
LABEL_16:
      uint64_t v17 = objc_opt_class(&OBJC_CLASS___SKAPFSSnapshotDisk);
      if ((objc_opt_isKindOfClass(self, v17) & 1) != 0
        || -[SKDisk _cacheSpacesWithPurgeable:](self, "_cacheSpacesWithPurgeable:", 1LL))
      {
        if ((-[SKDisk isWholeDisk](self, "isWholeDisk") & 1) != 0)
        {
          -[SKDisk setCanPartitionDisk:]( self,  "setCanPartitionDisk:",  -[SKDisk isVirtualDiskType](self, "isVirtualDiskType") ^ 1);
          else {
            uint64_t v18 = 0LL;
          }
          -[SKDisk setIsPhysicalDisk:](self, "setIsPhysicalDisk:", v18);
        }

        else
        {
          -[SKDisk setIsPhysicalDisk:](self, "setIsPhysicalDisk:", 1LL);
          -[SKDisk setCanPartitionDisk:](self, "setCanPartitionDisk:", 0LL);
        }

        if (-[SKDisk isMemberOfClass:](self, "isMemberOfClass:", objc_opt_class(&OBJC_CLASS___SKDisk)))
        {
          if (-[SKDisk isWholeDisk](self, "isWholeDisk"))
          {
            v24 = (void *)objc_claimAutoreleasedReturnValue(-[SKDisk daDisk](self, "daDisk"));
            id v25 = +[SKDisk copySortedChildrenWithDADisk:ioMedia:]( &OBJC_CLASS___SKDisk,  "copySortedChildrenWithDADisk:ioMedia:",  v24,  v14);
            v26 = (void *)objc_claimAutoreleasedReturnValue(-[SKDisk privateCache](self, "privateCache"));
            [v26 setSortedChildren:v25];

            v27 = (void *)objc_claimAutoreleasedReturnValue(-[SKDisk privateCache](self, "privateCache"));
            v28 = (void *)objc_claimAutoreleasedReturnValue([v27 sortedChildren]);
            -[SKDisk setChildCount:](self, "setChildCount:", [v28 count]);
          }

          else
          {
            -[SKDisk setChildCount:](self, "setChildCount:", 0LL);
          }

          -[SKDisk setSupportsJournaling:](self, "setSupportsJournaling:", 0LL);
          -[SKDisk setIsJournaled:](self, "setIsJournaled:", 0LL);
          -[SKDisk setSupportsVerify:](self, "setSupportsVerify:", 0LL);
          -[SKDisk setSupportsRepair:](self, "setSupportsRepair:", 0LL);
          v29 = (void *)objc_claimAutoreleasedReturnValue(-[SKDisk _getFilesystem](self, "_getFilesystem"));
          -[SKDisk setFilesystem:](self, "setFilesystem:", v29);

          v30 = (void *)objc_claimAutoreleasedReturnValue(-[SKDisk filesystem](self, "filesystem"));
          if (v30) {
            -[SKDisk _cacheFilesystem](self, "_cacheFilesystem");
          }
          else {
            -[SKDisk _cacheNoFilesystem](self, "_cacheNoFilesystem");
          }
          v31 = (void *)objc_claimAutoreleasedReturnValue(-[SKDisk privateCache](self, "privateCache"));
          v32 = (void *)objc_claimAutoreleasedReturnValue([v31 wholeDADisk]);
          -[SKDisk _cacheCanSupportRecoveryPartitionWithWholeDisk:]( self,  "_cacheCanSupportRecoveryPartitionWithWholeDisk:",  v32);
        }

        BOOL v16 = 1;
        goto LABEL_40;
      }

- (void)_cacheIsWholeDiskWithDiskDescription:(id)a3
{
  id v4 = (id)objc_claimAutoreleasedReturnValue([a3 objectForKeyedSubscript:kDADiskDescriptionMediaWholeKey]);
  -[SKDisk setIsWholeDisk:](self, "setIsWholeDisk:", sub_100012488(v4));
}

- (id)volumeNameWithDiskDescription:(id)a3
{
  return [a3 objectForKeyedSubscript:kDADiskDescriptionVolumeNameKey];
}

- (id)liveDiskIdentifierWithDiskDescription:(id)a3
{
  return [a3 objectForKeyedSubscript:kDADiskDescriptionMediaBSDNameKey];
}

- (BOOL)_cacheInfoWithDiskDescription:(id)a3
{
  id v4 = a3;
  CFDictionaryRef v5 = (void *)objc_claimAutoreleasedReturnValue(-[SKDisk liveDiskIdentifierWithDiskDescription:](self, "liveDiskIdentifierWithDiskDescription:", v4));
  unsigned __int8 v6 = (void *)objc_claimAutoreleasedReturnValue(-[SKDisk privateCache](self, "privateCache"));
  [v6 setLiveDiskIdentifier:v5];

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[SKDisk diskIdentifier](self, "diskIdentifier"));
  if (!v7 && !-[SKDisk isValid](self, "isValid")
    || (unsigned int v8 = -[SKDisk canUpdateDiskIdentifierWithDiskInfo:](self, "canUpdateDiskIdentifierWithDiskInfo:", v4),
        v7,
        v8))
  {
    DADiskRef v9 = (void *)objc_claimAutoreleasedReturnValue(-[SKDisk privateCache](self, "privateCache"));
    v10 = (void *)objc_claimAutoreleasedReturnValue([v9 liveDiskIdentifier]);
    -[SKDisk setDiskIdentifier:](self, "setDiskIdentifier:", v10);
  }

  id v11 = sub_10000E2BC();
  v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[SKDisk diskIdentifier](self, "diskIdentifier"));
    *(_DWORD *)buf = 136315650;
    v38 = "-[SKDisk(DaemonAdditions) _cacheInfoWithDiskDescription:]";
    __int16 v39 = 2114;
    v40 = v13;
    __int16 v41 = 1024;
    unsigned int v42 = -[SKDisk isValid](self, "isValid");
    _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEFAULT,  "%s: Caching %{public}@, isValid=%d",  buf,  0x1Cu);
  }

  __int16 v14 = (void *)objc_claimAutoreleasedReturnValue(-[SKDisk diskIdentifier](self, "diskIdentifier"));
  if (v14)
  {
    -[SKDisk _cacheIsWholeDiskWithDiskDescription:](self, "_cacheIsWholeDiskWithDiskDescription:", v4);
    id v15 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:kDADiskDescriptionVolumePathKey]);
    __int16 v36 = v15;
    if (v15)
    {
      BOOL v16 = (void *)objc_claimAutoreleasedReturnValue([v15 path]);
      -[SKDisk setMountPoint:](self, "setMountPoint:", v16);
    }

    else
    {
      -[SKDisk setMountPoint:](self, "setMountPoint:", 0LL);
    }

    uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue(-[SKDisk mountPoint](self, "mountPoint"));

    if (!v17) {
      -[SKDisk setOwnerUID:](self, "setOwnerUID:", -[SKDisk _getOwnerUsingStat](self, "_getOwnerUsingStat"));
    }
    uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue(-[SKDisk volumeNameWithDiskDescription:](self, "volumeNameWithDiskDescription:", v4));
    -[SKDisk setVolumeName:](self, "setVolumeName:", v18);

    id v19 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:kDADiskDescriptionVolumeUUIDKey]);
    if (v19)
    {
      v20 = (__CFString *)CFUUIDCreateString(0LL, (CFUUIDRef)v19);
      -[SKDisk setVolumeUUID:](self, "setVolumeUUID:", v20);
    }

    else
    {
      -[SKDisk setVolumeUUID:](self, "setVolumeUUID:", 0LL);
    }

    v21 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:kDADiskDescriptionMediaSizeKey]);
    -[SKDisk setUnformattedSize:](self, "setUnformattedSize:", sub_1000124CC(v21));
    v22 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:kDADiskDescriptionDeviceInternalKey]);
    -[SKDisk setIsInternal:](self, "setIsInternal:", sub_100012488(v22));
    id v23 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:kDADiskDescriptionMediaRemovableKey]);
    -[SKDisk setIsRemovable:](self, "setIsRemovable:", sub_100012488(v23));
    v24 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:kDADiskDescriptionMediaWritableKey]);
    id v25 = v24;
    if (v24) {
      uint64_t v26 = (uint64_t)sub_100012488(v24);
    }
    else {
      uint64_t v26 = 1LL;
    }
    -[SKDisk setIsMediaWritable:](self, "setIsMediaWritable:", v26);
    v27 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:kDADiskDescriptionDeviceProtocolKey]);
    if (sub_10001232C(v27)) {
      id v28 = [v27 isEqual:@"Virtual Interface"];
    }
    else {
      id v28 = 0LL;
    }
    -[SKDisk setIsDiskImage:](self, "setIsDiskImage:", v28);
    v29 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:kDADiskDescriptionVolumeKindKey]);
    v30 = (void *)objc_claimAutoreleasedReturnValue(-[SKDisk privateCache](self, "privateCache"));
    [v30 setVolumeKind:v29];

    v31 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:kDADiskDescriptionVolumeTypeKey]);
    v32 = (void *)objc_claimAutoreleasedReturnValue(-[SKDisk privateCache](self, "privateCache"));
    [v32 setVolumeType:v31];

    v33 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:kDADiskDescriptionMediaContentKey]);
    int v34 = (void *)objc_claimAutoreleasedReturnValue(-[SKDisk privateCache](self, "privateCache"));
    [v34 setRawIOContent:v33];
  }

  return v14 != 0LL;
}

- (unsigned)_getOwnerUsingStat
{
  v3 = (os_log_s *)objc_claimAutoreleasedReturnValue(-[SKDisk _getIdentifierForStat](self, "_getIdentifierForStat"));
  if ((-[SKDisk isIOMediaDisk](self, "isIOMediaDisk") & 1) == 0)
  {
    id v9 = sub_10000E2BC();
    id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      __int16 v14 = v3;
      _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "%@ is not an IO media disk, assuming owner is root",  buf,  0xCu);
    }

    goto LABEL_8;
  }

  id v4 = (os_log_s *) objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString, "stringWithFormat:", @"/dev/%@", v3));
  int v5 = stat((const char *)-[os_log_s UTF8String](v4, "UTF8String"), &v12);
  id v6 = sub_10000E2BC();
  v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
  BOOL v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);
  if (v5)
  {
    if (v8)
    {
      *(_DWORD *)buf = 138412290;
      __int16 v14 = v4;
      _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "stat failed on %@, assuming owner is root",  buf,  0xCu);
    }

LABEL_8:
    uid_t v10 = 0;
    goto LABEL_9;
  }

  if (v8)
  {
    *(_DWORD *)buf = 138412546;
    __int16 v14 = v4;
    __int16 v15 = 1024;
    uid_t st_uid = v12.st_uid;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "stat on %@, returned UID %d", buf, 0x12u);
  }

  uid_t v10 = v12.st_uid;
LABEL_9:

  return v10;
}

- (BOOL)_cacheInfoWithIOMedia:(id)a3
{
  id v4 = a3;
  id v5 = [v4 copyProperties];
  if (v5)
  {
    id v6 = (void *)objc_claimAutoreleasedReturnValue(-[SKDisk privateCache](self, "privateCache"));
    id v7 = objc_msgSend( v6,  "copyHumanIOContentWithMediaDict:isWholeDisk:",  v5,  -[SKDisk isWholeDisk](self, "isWholeDisk"));
    -[SKDisk setIoContent:](self, "setIoContent:", v7);

    if ((-[SKDisk isValid](self, "isValid") & 1) == 0)
    {
      id v8 = [v4 copyPropertyWithClass:objc_opt_class(NSString) key:@"UUID"];
      -[SKDisk setMediaUUID:](self, "setMediaUUID:", v8);
    }

    v16[0] = 0;
    if (-[SKDisk isWholeDisk](self, "isWholeDisk", *(void *)v16))
    {
      -[SKDisk setStartLocation:](self, "setStartLocation:", 0LL);
      BOOL v9 = 0LL;
    }

    else
    {
      v13 = sub_1000086C4(v5, v16);
      __int16 v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
      -[SKDisk setStartLocation:](self, "setStartLocation:", [v14 unsignedLongLongValue]);

      BOOL v9 = v16[0] != 0;
    }

    -[SKDisk setIsPartitionDisk:](self, "setIsPartitionDisk:", v9);
    id v11 = [v4 copyParentPropertyWithClass:objc_opt_class(NSNumber) key:@"OSInternal"];
    -[SKDisk setIsOSInternal:](self, "setIsOSInternal:", sub_100012488(v11));
  }

  else
  {
    id v10 = sub_10000E2BC();
    id v11 = (id)objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled((os_log_t)v11, OS_LOG_TYPE_ERROR))
    {
      stat v12 = (void *)objc_claimAutoreleasedReturnValue(-[SKDisk diskIdentifier](self, "diskIdentifier"));
      *(_DWORD *)BOOL v16 = 136315394;
      *(void *)&v16[4] = "-[SKDisk(DaemonAdditions) _cacheInfoWithIOMedia:]";
      __int16 v17 = 2114;
      uint64_t v18 = v12;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)v11,  OS_LOG_TYPE_ERROR,  "%s: Failed to get IO media properties for %{public}@",  v16,  0x16u);
    }
  }

  return v5 != 0LL;
}

- (void)_cacheFilesystem
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SKDisk filesystem](self, "filesystem"));
  id v29 = (id)objc_claimAutoreleasedReturnValue([v3 majorType]);

  if ([v29 isEqualToString:@"hfs"])
  {
    -[SKDisk setSupportsVerify:](self, "setSupportsVerify:", 1LL);
    -[SKDisk setSupportsRepair:](self, "setSupportsRepair:", 1LL);
    id v4 = (void *)objc_claimAutoreleasedReturnValue(-[SKDisk filesystem](self, "filesystem"));
    -[SKDisk setSupportsJournaling:](self, "setSupportsJournaling:", [v4 supportsJournaling]);

    id v5 = (void *)objc_claimAutoreleasedReturnValue(-[SKDisk privateCache](self, "privateCache"));
    -[SKDisk setIsJournaled:](self, "setIsJournaled:", ((unint64_t)[v5 mountFlags] >> 23) & 1);

    id v6 = (void *)objc_claimAutoreleasedReturnValue(-[SKDisk filesystem](self, "filesystem"));
    -[SKDisk setIsCaseSensitive:](self, "setIsCaseSensitive:", [v6 isCaseSensitive]);

    id v7 = (void *)objc_claimAutoreleasedReturnValue(-[SKDisk ioContent](self, "ioContent"));
    unsigned __int8 v8 = [v7 isEqualToString:@"Apple_Boot"];

    if ((v8 & 1) != 0)
    {
      -[SKDisk setRole:](self, "setRole:", kSKDiskRoleBooter);
      BOOL v9 = &kSKDiskTypeAppleBoot;
    }

    else
    {
      __int16 v14 = (void *)objc_claimAutoreleasedReturnValue(-[SKDisk mountPoint](self, "mountPoint"));

      if (v14)
      {
        __int16 v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
        BOOL v16 = (void *)objc_claimAutoreleasedReturnValue(-[SKDisk mountPoint](self, "mountPoint"));
        __int16 v17 = (void *)objc_claimAutoreleasedReturnValue( [v16 stringByAppendingPathComponent:@"/System/Library/CoreServices/Finder.app"]);
        unsigned int v18 = [v15 fileExistsAtPath:v17];

        id v19 = &kSKDiskRoleLegacyMacSystem;
        if (!v18) {
          id v19 = &kSKDiskRoleLegacyMacData;
        }
        -[SKDisk setRole:](self, "setRole:", *v19);
      }

      else
      {
        -[SKDisk setRole:](self, "setRole:", kSKDiskRoleLegacyMacData);
      }

      BOOL v9 = &kSKDiskTypeHFS;
    }

    -[SKDisk setType:](self, "setType:", *v9);
    v13 = &kSKDiskFileSystemHFS;
    goto LABEL_23;
  }

  if ([v29 isEqualToString:@"msdos"])
  {
    -[SKDisk setSupportsVerify:](self, "setSupportsVerify:", 1LL);
    -[SKDisk setSupportsRepair:](self, "setSupportsRepair:", 1LL);
    unsigned int v10 = -[SKDisk isRealEFIPartition](self, "isRealEFIPartition");
    id v11 = &kSKDiskRoleBooter;
    if (v10)
    {
      stat v12 = &kSKDiskTypeEFI;
    }

    else
    {
      id v11 = &kSKDiskRoleWindowsData;
      stat v12 = &kSKDiskTypeFAT;
    }

    -[SKDisk setRole:](self, "setRole:", *v11);
    -[SKDisk setType:](self, "setType:", *v12);
    v13 = &kSKDiskFileSystemFAT;
    goto LABEL_23;
  }

  if (![v29 isEqualToString:@"exfat"])
  {
    if ([v29 isEqualToString:@"ntfs"])
    {
      v20 = (void *)objc_claimAutoreleasedReturnValue(-[SKDisk mountPoint](self, "mountPoint"));
      v21 = (void *)objc_claimAutoreleasedReturnValue([v20 stringByAppendingPathComponent:@"/Windows/System32/ntdll.dll"]);

      uint64_t v22 = objc_claimAutoreleasedReturnValue(-[SKDisk mountPoint](self, "mountPoint"));
      if (v22)
      {
        id v23 = (void *)v22;
        v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
        unsigned int v25 = [v24 fileExistsAtPath:v21];

        uint64_t v26 = &kSKDiskRoleWindowsSystem;
        if (!v25) {
          uint64_t v26 = &kSKDiskRoleWindowsData;
        }
      }

      else
      {
        uint64_t v26 = &kSKDiskRoleWindowsData;
      }

      -[SKDisk setRole:](self, "setRole:", *v26);
      -[SKDisk setType:](self, "setType:", kSKDiskTypeNTFS);
      id v28 = (void *)kSKDiskFileSystemNTFS;
      v27 = self;
    }

    else
    {
      if ([v29 isEqualToString:@"acfs"])
      {
        -[SKDisk setRole:](self, "setRole:", kSKDiskRoleXSanData);
        -[SKDisk setType:](self, "setType:", kSKDiskTypeXSanLV);
        v13 = &kSKDiskFileSystemACFS;
        goto LABEL_23;
      }

      -[SKDisk setRole:](self, "setRole:", kSKDiskRoleUnknown);
      -[SKDisk setType:](self, "setType:", kSKDiskType3rdPartyFilesystem);
      v21 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"kSKDiskFileSystem_%@",  v29));
      v27 = self;
      id v28 = v21;
    }

    -[SKDisk setFilesystemType:](v27, "setFilesystemType:", v28);

    goto LABEL_24;
  }

  -[SKDisk setSupportsVerify:](self, "setSupportsVerify:", 1LL);
  -[SKDisk setSupportsRepair:](self, "setSupportsRepair:", 1LL);
  -[SKDisk setRole:](self, "setRole:", kSKDiskRoleWindowsData);
  -[SKDisk setType:](self, "setType:", kSKDiskTypeExFAT);
  v13 = &kSKDiskFileSystemExFAT;
LABEL_23:
  -[SKDisk setFilesystemType:](self, "setFilesystemType:", *v13);
LABEL_24:
}

- (BOOL)isRealEFIPartition
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SKDisk ioContent](self, "ioContent"));
  unsigned int v4 = [v3 isEqualToString:@"EFI"];

  if (v4)
  {
    id v5 = (void *)objc_claimAutoreleasedReturnValue(-[SKDisk privateCache](self, "privateCache"));
    id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 wholeDADisk]);
    id v7 = +[SKDisk copySortedChildrenWithDADisk:ioMedia:]( &OBJC_CLASS___SKDisk,  "copySortedChildrenWithDADisk:ioMedia:",  v6,  0LL);

    unsigned __int8 v8 = (void *)objc_claimAutoreleasedReturnValue(-[SKDisk daDisk](self, "daDisk"));
    id v9 = [v7 indexOfObject:v8];

    if (v9) {
      BOOL v10 = v9 == (id)0x7FFFFFFFFFFFFFFFLL;
    }
    else {
      BOOL v10 = 1;
    }
    LOBYTE(v4) = v10;
    if (v9 && v9 != (id)0x7FFFFFFFFFFFFFFFLL)
    {
      id v11 = sub_10000E2BC();
      stat v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        v13 = (void *)objc_claimAutoreleasedReturnValue(-[SKDisk diskIdentifier](self, "diskIdentifier"));
        int v15 = 136315650;
        BOOL v16 = "-[SKDisk(DaemonAdditions) isRealEFIPartition]";
        __int16 v17 = 2114;
        unsigned int v18 = v13;
        __int16 v19 = 1024;
        int v20 = (int)v9;
        _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEFAULT,  "%s: %{public}@ is an EFI partition in the middle of the disk (child #%d), treating as a regular FAT",  (uint8_t *)&v15,  0x1Cu);
      }
    }
  }

  return v4;
}

- (void)_cacheNoFilesystem
{
  unsigned int v3 = -[SKDisk isWholeDisk](self, "isWholeDisk");
  unsigned int v4 = (void *)objc_claimAutoreleasedReturnValue(-[SKDisk privateCache](self, "privateCache"));
  unsigned int v5 = [v4 schemeID];
  if (v3)
  {

    id v6 = &kSKDiskTypeAPMWholeDisk;
    id v7 = &kSKDiskTypeMBRWholeDisk;
    unsigned __int8 v8 = &kSKDiskTypeUninitalized;
    if (v5 == 16) {
      unsigned __int8 v8 = &kSKDiskTypeGPTWholeDisk;
    }
    if (v5 != 8) {
      id v7 = v8;
    }
    if (v5 != 1) {
      id v6 = v7;
    }
    -[SKDisk setType:](self, "setType:", *v6);
    id v9 = &kSKDiskRolePhysicalDisk;
    goto LABEL_9;
  }

  if (v5 == 512
    || (BOOL v10 = (void *)objc_claimAutoreleasedReturnValue(-[SKDisk ioContent](self, "ioContent")), v10, !v10))
  {
    __int16 v14 = &kSKDiskRoleNoRole;
LABEL_15:
    -[SKDisk setRole:](self, "setRole:", *v14);
    int v15 = &kSKDiskTypeUninitalized;
LABEL_16:
    -[SKDisk setType:](self, "setType:", *v15);
    goto LABEL_17;
  }

  id v11 = (void *)objc_claimAutoreleasedReturnValue(-[SKDisk ioContent](self, "ioContent"));
  unsigned int v12 = [v11 isEqualToString:@"Apple_Boot"];

  if (v12)
  {
    -[SKDisk setRole:](self, "setRole:", kSKDiskRoleBooter);
    v13 = &kSKDiskTypeAppleBoot;
LABEL_25:
    -[SKDisk setType:](self, "setType:", *v13);
    BOOL v16 = &kSKDiskFileSystemHFS;
    goto LABEL_18;
  }

  if (-[SKDisk isRealEFIPartition](self, "isRealEFIPartition"))
  {
    -[SKDisk setRole:](self, "setRole:", kSKDiskRoleBooter);
    -[SKDisk setType:](self, "setType:", kSKDiskTypeEFI);
    BOOL v16 = &kSKDiskFileSystemFAT;
    goto LABEL_18;
  }

  __int16 v17 = (void *)objc_claimAutoreleasedReturnValue(-[SKDisk ioContent](self, "ioContent"));
  if ([v17 isEqualToString:@"Apple_HFS"])
  {

LABEL_24:
    -[SKDisk setRole:](self, "setRole:", kSKDiskRoleMacData);
    v13 = &kSKDiskTypeHFS;
    goto LABEL_25;
  }

  unsigned int v18 = (void *)objc_claimAutoreleasedReturnValue(-[SKDisk ioContent](self, "ioContent"));
  unsigned int v19 = [v18 isEqualToString:@"Apple_RAID"];

  if (v19) {
    goto LABEL_24;
  }
  int v20 = (void *)objc_claimAutoreleasedReturnValue(-[SKDisk ioContent](self, "ioContent"));
  unsigned int v21 = [v20 isEqualToString:@"Apple_APFS"];

  if (v21)
  {
    unsigned int v22 = -[SKDisk isMemberOfClass:]( self,  "isMemberOfClass:",  objc_opt_class(&OBJC_CLASS___SKAPFSStoreDisk));
    -[SKDisk setRole:](self, "setRole:", kSKDiskRoleStorageImplementation);
    if (v22) {
      int v15 = &kSKDiskTypeAPFSPS;
    }
    else {
      int v15 = &kSKDiskTypeDamaged;
    }
    goto LABEL_16;
  }

  id v23 = (void *)objc_claimAutoreleasedReturnValue(-[SKDisk ioContent](self, "ioContent"));
  unsigned int v24 = [v23 isEqualToString:@"Apple_RAID_Offline"];

  if (v24)
  {
    __int16 v14 = &kSKDiskRoleStorageImplementation;
    goto LABEL_15;
  }

  unsigned int v25 = (void *)objc_claimAutoreleasedReturnValue(-[SKDisk ioContent](self, "ioContent"));
  if ([v25 isEqualToString:@"Apple_KernelCoreDump"])
  {

LABEL_35:
    -[SKDisk setRole:](self, "setRole:", kSKDiskRoleStorageImplementation);
    v13 = &kSKDiskTypeAppleCoreDump;
    goto LABEL_25;
  }

  uint64_t v26 = (void *)objc_claimAutoreleasedReturnValue(-[SKDisk ioContent](self, "ioContent"));
  unsigned int v27 = [v26 isEqualToString:@"Apple_SadMac"];

  if (v27) {
    goto LABEL_35;
  }
  id v28 = (void *)objc_claimAutoreleasedReturnValue(-[SKDisk privateCache](self, "privateCache"));
  id v29 = (void *)objc_claimAutoreleasedReturnValue([v28 rawIOContent]);
  v30 = (void *)objc_claimAutoreleasedReturnValue(-[SKDisk ioContent](self, "ioContent"));
  unsigned __int8 v31 = [v29 isEqualToString:v30];

  if ((v31 & 1) != 0)
  {
    uint64_t v32 = kSKDiskTypeOtherUnrecognized;
    v33 = (void *)objc_claimAutoreleasedReturnValue(-[SKDisk privateCache](self, "privateCache"));
    int v34 = (void *)objc_claimAutoreleasedReturnValue([v33 rawIOContent]);
    v35 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%@%@", v32, v34));
    -[SKDisk setType:](self, "setType:", v35);
  }

  else
  {
    uint64_t v36 = kSKDiskTypeOtherRecognizable;
    v33 = (void *)objc_claimAutoreleasedReturnValue(-[SKDisk ioContent](self, "ioContent"));
    int v34 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%@%@", v36, v33));
    -[SKDisk setType:](self, "setType:", v34);
  }

  id v9 = &kSKDiskRoleNoRole;
LABEL_9:
  -[SKDisk setRole:](self, "setRole:", *v9);
LABEL_17:
  BOOL v16 = &kSKDiskFileSystemUndefined;
LABEL_18:
  -[SKDisk setFilesystemType:](self, "setFilesystemType:", *v16);
}

- (id)_getFilesystem
{
  unsigned int v3 = (void *)objc_claimAutoreleasedReturnValue(-[SKDisk privateCache](self, "privateCache"));
  unsigned int v4 = (__CFString *)objc_claimAutoreleasedReturnValue([v3 volumeKind]);

  if (!sub_10001232C(v4))
  {
    unsigned int v5 = (void *)objc_claimAutoreleasedReturnValue(-[SKDisk privateCache](self, "privateCache"));
    id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 rawIOContent]);
    unsigned __int8 v7 = [v6 isEqualToString:@"41504653-0000-11AA-AA11-00306543ECAC"];

    if ((v7 & 1) != 0)
    {
      unsigned __int8 v8 = @"apfs";
    }

    else
    {
      unsigned int v18 = (void *)objc_claimAutoreleasedReturnValue(-[SKDisk ioContent](self, "ioContent"));
      unsigned __int8 v19 = [v18 isEqualToString:@"Apple_APFS"];

      if ((v19 & 1) != 0) {
        goto LABEL_12;
      }
      unsigned int v22 = (void *)objc_claimAutoreleasedReturnValue(-[SKDisk ioContent](self, "ioContent"));
      unsigned __int8 v23 = [v22 isEqualToString:@"Apple_HFS"];

      if ((v23 & 1) != 0)
      {
        unsigned __int8 v8 = @"hfs";
      }

      else
      {
        unsigned int v24 = (void *)objc_claimAutoreleasedReturnValue(-[SKDisk ioContent](self, "ioContent"));
        unsigned int v25 = [v24 isEqualToString:@"MS-DOS"];

        if (!v25) {
          goto LABEL_5;
        }
        unsigned __int8 v8 = @"msdos";
      }
    }

    unsigned int v4 = (__CFString *)v8;
  }

- (id)filesystemWithType:(id)a3
{
  id v4 = a3;
  if (([v4 isEqualToString:@"apfs"] & 1) == 0
    && ([v4 isEqualToString:@"hfs"] & 1) == 0
    && ([v4 isEqualToString:@"msdos"] & 1) == 0
    && ![v4 isEqualToString:@"cd9660"])
  {
    if ([v4 isEqualToString:@"zfs"])
    {
      uint64_t v9 = 0LL;
      BOOL v10 = @"ZFS";
      goto LABEL_8;
    }

    goto LABEL_10;
  }

  unsigned int v5 = (void *)objc_claimAutoreleasedReturnValue(-[SKDisk privateCache](self, "privateCache"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 volumeType]);
  BOOL v7 = sub_10001232C(v6);

  if (!v7)
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[SKDisk mountPoint](self, "mountPoint"));
    sub_10001232C(v13);

    goto LABEL_10;
  }

  unsigned __int8 v8 = (void *)objc_claimAutoreleasedReturnValue(-[SKDisk privateCache](self, "privateCache"));
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([v8 volumeType]);

  if (!v9)
  {
LABEL_10:
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(+[SKDaemonManager sharedManager](&OBJC_CLASS___SKDaemonManager, "sharedManager"));
    BOOL v12 = (void *)objc_claimAutoreleasedReturnValue([v9 _firstFilesystemForMajorType:v4]);
    goto LABEL_11;
  }

  BOOL v10 = 0LL;
LABEL_8:
  id v11 = (void *)objc_claimAutoreleasedReturnValue(+[SKDaemonManager sharedManager](&OBJC_CLASS___SKDaemonManager, "sharedManager"));
  BOOL v12 = (void *)objc_claimAutoreleasedReturnValue([v11 _filesystemForUnlocalizedName:v9 dmPersonality:v10]);

LABEL_11:
  return v12;
}

- (BOOL)_cacheSpacesWithPurgeable:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = self;
  objc_sync_enter(v4);
  bzero(&v20, 0x878uLL);
  unsigned int v5 = (void *)objc_claimAutoreleasedReturnValue(-[SKDisk mountPoint](v4, "mountPoint"));
  if (v5
    && (id v6 = objc_claimAutoreleasedReturnValue(-[SKDisk mountPoint](v4, "mountPoint")),
        BOOL v7 = statfs((const char *)[v6 fileSystemRepresentation], &v20) == 0,
        v6,
        v5,
        v7))
  {
    -[SKDisk setIsWritable:](v4, "setIsWritable:", (v20.f_flags & 1) == 0);
    -[SKDisk setTotalSpace:](v4, "setTotalSpace:", v20.f_blocks * v20.f_bsize);
    -[SKDisk setFreeSpace:](v4, "setFreeSpace:", v20.f_bavail * v20.f_bsize);
    uint64_t f_flags = v20.f_flags;
    BOOL v16 = (void *)objc_claimAutoreleasedReturnValue(-[SKDisk privateCache](v4, "privateCache"));
    [v16 setMountFlags:f_flags];

    -[SKDisk setOwnerUID:](v4, "setOwnerUID:", v20.f_owner);
  }

  else
  {
    -[SKDisk setIsWritable:](v4, "setIsWritable:", 0LL);
    -[SKDisk setTotalSpace:](v4, "setTotalSpace:", -[SKDisk unformattedSize](v4, "unformattedSize"));
    -[SKDisk setFreeSpace:](v4, "setFreeSpace:", 0LL);
    unsigned __int8 v8 = (void *)objc_claimAutoreleasedReturnValue(-[SKDisk privateCache](v4, "privateCache"));
    [v8 setMountFlags:0];
  }

  if (v3)
  {
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(-[SKDisk mountPoint](v4, "mountPoint"));

    id v10 = 0LL;
    if (v9 && &_CacheDeleteCopyPurgeableSpaceWithInfo)
    {
      id v11 = (void *)objc_claimAutoreleasedReturnValue(-[SKDisk mountPoint](v4, "mountPoint", @"CACHE_DELETE_VOLUME"));
      unsigned __int8 v19 = v11;
      BOOL v12 = (void *)CacheDeleteCopyPurgeableSpaceWithInfo( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v19,  &v18,  1LL));

      if (v12)
      {
        v13 = (void *)objc_claimAutoreleasedReturnValue([v12 objectForKeyedSubscript:@"CACHE_DELETE_AMOUNT"]);
        unsigned int v14 = v13;
        if (v13) {
          id v10 = [v13 unsignedLongLongValue];
        }
        else {
          id v10 = 0LL;
        }
      }

      else
      {
        id v10 = 0LL;
      }
    }

    -[SKDisk setPurgeableSpace:](v4, "setPurgeableSpace:", v10);
  }

  -[SKDisk setAvailableSpace:]( v4,  "setAvailableSpace:",  (char *)-[SKDisk freeSpace](v4, "freeSpace") + (void)-[SKDisk purgeableSpace](v4, "purgeableSpace"));
  objc_sync_exit(v4);

  return 1;
}

+ (id)copySortedChildrenWithDADisk:(id)a3 ioMedia:(id)a4
{
  id v6 = (__DADisk *)a3;
  BOOL v7 = (SKIOMedia *)a4;
  if (v6)
  {
    BSDName = DADiskGetBSDName(v6);
    if (BSDName)
    {
      uint64_t v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", BSDName));
      id v10 = (void *)objc_claimAutoreleasedReturnValue(+[SKDaemonManager sharedManager](&OBJC_CLASS___SKDaemonManager, "sharedManager"));
      id v11 = [v10 copyExtendedDiskInfoWithDiskIdentifier:v9];

      if (v11
        && (BOOL v12 = (void *)objc_claimAutoreleasedReturnValue([v11 objectForKeyedSubscript:@"kSKSortedChildren"]),
            v12,
            v12))
      {
        id v13 = (id)objc_claimAutoreleasedReturnValue([v11 objectForKeyedSubscript:@"kSKSortedChildren"]);
      }

      else
      {
        if (!v7) {
          BOOL v7 = -[SKIOMedia initWithDADisk:](objc_alloc(&OBJC_CLASS___SKIOMedia), "initWithDADisk:", v6);
        }
        id v13 = [a1 newSortedChildrenWithIOMedia:v7];
        unsigned int v14 = (void *)objc_claimAutoreleasedReturnValue(+[SKDaemonManager sharedManager](&OBJC_CLASS___SKDaemonManager, "sharedManager"));
        id v20 = v13;
        unsigned int v21 = v9;
        unsigned __int8 v19 = @"kSKSortedChildren";
        int v15 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v20,  &v19,  1LL));
        unsigned int v22 = v15;
        BOOL v16 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v22,  &v21,  1LL));
        [v14 _addToExtendedDiskInfoCacheWithDictionary:v16];
      }
    }

    else
    {
      id v17 = sub_10000E2BC();
      uint64_t v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v17);
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315394;
        unsigned int v24 = "+[SKDisk(DaemonAdditions) copySortedChildrenWithDADisk:ioMedia:]";
        __int16 v25 = 2112;
        uint64_t v26 = v6;
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, "%s: Invalid DADiskRef %@", buf, 0x16u);
      }

      id v13 = &__NSArray0__struct;
    }
  }

  else
  {
    id v13 = &__NSArray0__struct;
  }

  return v13;
}

+ (id)newSortedChildrenWithIOMedia:(id)a3
{
  id v3 = a3;
  if (v3)
  {
    id v4 = &APFSCancelContainerResize_ptr;
    id v5 = [v3 copyPropertyWithClass:objc_opt_class(NSNumber) key:@"BSD Unit"];
    int v34 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
    id v6 = (void *)objc_claimAutoreleasedReturnValue(+[SKDaemonManager sharedManager](&OBJC_CLASS___SKDaemonManager, "sharedManager"));
    v33 = (__DASession *)[v6 diskArbSession];

    id v32 = v3;
    id v7 = [v3 newIteratorWithOptions:1];
    unsigned __int8 v8 = (objc_class *)&selRef_initWithClassName_;
    uint64_t v9 = -[SKIOObject initWithIteratorNext:](objc_alloc(&OBJC_CLASS___SKIOMedia), "initWithIteratorNext:", v7);
    if (v9)
    {
      id v11 = v9;
      *(void *)&__int128 v10 = 136315394LL;
      __int128 v31 = v10;
      do
      {
        if (IOObjectConformsTo(-[SKIOObject ioObj](v11, "ioObj"), "IOMedia"))
        {
          id v12 = -[SKIOObject copyPropertyWithClass:key:]( v11,  "copyPropertyWithClass:key:",  objc_opt_class(v4[98]),  @"BSD Unit");
          if ([v12 isEqual:v5])
          {
            id v13 = DADiskCreateFromIOMedia(kCFAllocatorDefault, v33, -[SKIOObject ioObj](v11, "ioObj"));
            if (v13)
            {
              id v14 = -[SKIOObject copyProperties](v11, "copyProperties");
              v46[0] = v13;
              int v15 = sub_1000086C4(v14, 0LL);
              BOOL v16 = (void *)objc_claimAutoreleasedReturnValue(v15);
              v46[1] = v16;
              id v17 = v4;
              uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue( +[NSArray arrayWithObjects:count:]( &OBJC_CLASS___NSArray,  "arrayWithObjects:count:",  v46,  2LL));
              [v34 addObject:v18];

              id v4 = v17;
              unsigned __int8 v8 = (objc_class *)&selRef_initWithClassName_;
            }

            else
            {
              id v20 = sub_10000E2BC();
              id v14 = (id)objc_claimAutoreleasedReturnValue(v20);
              if (os_log_type_enabled((os_log_t)v14, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = v31;
                __int16 v41 = "+[SKDisk(DaemonAdditions) newSortedChildrenWithIOMedia:]";
                __int16 v42 = 2114;
                id v43 = v12;
                _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)v14,  OS_LOG_TYPE_ERROR,  "%s: Failed to create DADisk for child disk %{public}@",  buf,  0x16u);
              }
            }
          }

          else
          {
            id v19 = sub_10000E2BC();
            id v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v19);
            if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 136315650;
              __int16 v41 = "+[SKDisk(DaemonAdditions) newSortedChildrenWithIOMedia:]";
              __int16 v42 = 2114;
              id v43 = v12;
              __int16 v44 = 2114;
              id v45 = v5;
              _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_DEFAULT,  "%s: Found IO media with BSD unit %{public}@ as a child of disk with BSD unit %{public}@, ignoring",  buf,  0x20u);
            }
          }

          IORegistryIteratorExitEntry((io_iterator_t)[v7 ioObj]);
        }

        unsigned int v21 = (SKIOMedia *)[objc_alloc(v8 + 435) initWithIteratorNext:v7];

        id v11 = v21;
      }

      while (v21);
    }

    unsigned int v22 = (void *)objc_claimAutoreleasedReturnValue([v34 sortedArrayUsingComparator:&stru_100044BF0]);
    unsigned __int8 v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
    __int128 v35 = 0u;
    __int128 v36 = 0u;
    __int128 v37 = 0u;
    __int128 v38 = 0u;
    id v24 = v22;
    id v25 = [v24 countByEnumeratingWithState:&v35 objects:v39 count:16];
    if (v25)
    {
      id v26 = v25;
      uint64_t v27 = *(void *)v36;
      do
      {
        for (i = 0LL; i != v26; i = (char *)i + 1)
        {
          if (*(void *)v36 != v27) {
            objc_enumerationMutation(v24);
          }
          unsigned __int8 v29 = (void *)objc_claimAutoreleasedReturnValue( [*(id *)(*((void *)&v35 + 1) + 8 * (void)i) objectAtIndexedSubscript:0]);
          [v23 addObject:v29];
        }

        id v26 = [v24 countByEnumeratingWithState:&v35 objects:v39 count:16];
      }

      while (v26);
    }

    id v3 = v32;
  }

  else
  {
    unsigned __int8 v23 = &__NSArray0__struct;
  }

  return v23;
}

- (BOOL)_supportsRecaching
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[SKDisk diskIdentifier](self, "diskIdentifier"));
  BOOL v3 = v2 != 0LL;

  return v3;
}

- (BOOL)reProbeWithError:(id *)a3
{
  v9[0] = kSKDiskMountOptionRecursive;
  id v5 = &__kCFBooleanFalse;
  if (-[SKDisk isWholeDisk](self, "isWholeDisk")
    && !-[SKDisk isLiveFSAPFSDisk](self, "isLiveFSAPFSDisk"))
  {
    id v5 = &__kCFBooleanTrue;
  }

  v9[1] = kSKDiskMountOptionToolOptions;
  v10[0] = v5;
  v10[1] = &off_100047BF0;
  id v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v10,  v9,  2LL));
  BOOL v7 = +[SKMountOperation mountWithDisk:options:error:]( &OBJC_CLASS___SKMountOperation,  "mountWithDisk:options:error:",  self,  v6,  a3);

  return v7;
}

- (SKMountState)previousMount
{
  return (SKMountState *)objc_getAssociatedObject(self, "previousMount");
}

- (void)setPreviousMount:(id)a3
{
}

@end