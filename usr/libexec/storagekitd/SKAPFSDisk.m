@interface SKAPFSDisk
+ (BOOL)isLIFSAPFSWithDiskDescription:(id)a3;
- (BOOL)_cacheInfoForDADisk:(id)a3;
- (BOOL)_cacheSpacesWithPurgeable:(BOOL)a3;
- (BOOL)canResize;
- (BOOL)canUpdateDiskIdentifierWithDiskInfo:(id)a3;
- (BOOL)cleanupWithError:(id *)a3;
- (NSString)containerBSDName;
- (id)getDataVolumeBSD;
- (id)liveDiskIdentifierWithDiskDescription:(id)a3;
- (id)volumeNameWithDiskDescription:(id)a3;
- (void)_cacheVolumeGroup;
- (void)cacheEncryptionInfo;
@end

@implementation SKAPFSDisk

- (BOOL)_cacheInfoForDADisk:(id)a3
{
  id v4 = a3;
  v5 = self;
  objc_sync_enter(v5);
  v33.receiver = v5;
  v33.super_class = (Class)&OBJC_CLASS___SKAPFSDisk;
  if (!-[SKAPFSDisk _cacheInfoForDADisk:](&v33, "_cacheInfoForDADisk:", v4)) {
    goto LABEL_14;
  }
  -[SKAPFSDisk setType:](v5, "setType:", kSKDiskTypeAPFSLV);
  -[SKAPFSDisk setFilesystemType:](v5, "setFilesystemType:", kSKDiskFileSystemAPFS);
  if (-[SKAPFSDisk isIOMediaDisk](v5, "isIOMediaDisk"))
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[SKAPFSDisk mediaUUID](v5, "mediaUUID"));
    BOOL v7 = v6 == 0LL;

    if (!v7)
    {
      -[SKAPFSDisk setSupportsVerify:](v5, "setSupportsVerify:", 1LL);
      -[SKAPFSDisk setSupportsRepair:](v5, "setSupportsRepair:", 1LL);
      unsigned __int16 v32 = 0;
      id v8 = objc_claimAutoreleasedReturnValue(-[SKAPFSDisk diskIdentifier](v5, "diskIdentifier"));
      APFSVolumeRole([v8 fileSystemRepresentation], &v32, 0);

      if (v32 <= 0x1Fu)
      {
        switch(v32)
        {
          case 0u:
            v9 = &SKAPFSVolumeRoleNone;
            goto LABEL_37;
          case 1u:
            -[SKAPFSDisk setApfsRole:](v5, "setApfsRole:", SKAPFSVolumeRoleSystem);
            v17 = &kSKDiskRoleMacSystem;
            goto LABEL_42;
          case 2u:
            v22 = &SKAPFSVolumeRoleUser;
            goto LABEL_35;
          case 3u:
          case 5u:
          case 6u:
          case 7u:
            goto LABEL_26;
          case 4u:
            -[SKAPFSDisk setRole:](v5, "setRole:", kSKDiskRoleRecovery);
            v18 = &SKAPFSVolumeRoleRecovery;
            break;
          case 8u:
            -[SKAPFSDisk setRole:](v5, "setRole:", kSKDiskRoleVirtualMemory);
            v18 = &SKAPFSVolumeRoleVM;
            break;
          default:
            if (v32 != 16) {
              goto LABEL_26;
            }
            -[SKAPFSDisk setRole:](v5, "setRole:", kSKDiskRoleBooter);
            v18 = &SKAPFSVolumeRolePreboot;
            break;
        }

        -[SKAPFSDisk setApfsRole:](v5, "setApfsRole:", *v18);
        goto LABEL_43;
      }

      if (v32 <= 0xFFu)
      {
        if (v32 == 32)
        {
          v22 = &SKAPFSVolumeRoleInstaller;
LABEL_35:
          -[SKAPFSDisk setApfsRole:](v5, "setApfsRole:", *v22);
          v17 = &kSKDiskRoleMacSystemData;
          goto LABEL_42;
        }

        if (v32 != 64)
        {
          if (v32 == 192)
          {
            -[SKAPFSDisk setApfsRole:](v5, "setApfsRole:", SKAPFSVolumeRoleUpdate);
            v17 = &kSKDiskRoleInstaller;
LABEL_42:
            -[SKAPFSDisk setRole:](v5, "setRole:", *v17);
LABEL_43:
            v24 = (void *)objc_claimAutoreleasedReturnValue(-[SKAPFSDisk _getFilesystem](v5, "_getFilesystem"));
            -[SKAPFSDisk setFilesystem:](v5, "setFilesystem:", v24);

            -[SKAPFSDisk _cacheVolumeGroup](v5, "_cacheVolumeGroup");
            -[SKAPFSDisk cacheEncryptionInfo](v5, "cacheEncryptionInfo");
            goto LABEL_44;
          }

          goto LABEL_26;
        }

        v9 = &SKAPFSVolumeRoleData;
        goto LABEL_37;
      }

      switch(v32)
      {
        case 0x100u:
          v23 = &SKAPFSVolumeRoleXART;
          break;
        case 0x140u:
          v23 = &SKAPFSVolumeRoleHardware;
          break;
        case 0x180u:
          v9 = &SKAPFSVolumeRoleBackup;
LABEL_37:
          -[SKAPFSDisk setApfsRole:](v5, "setApfsRole:", *v9);
LABEL_38:
          v17 = &kSKDiskRoleMacData;
          goto LABEL_42;
        default:
LABEL_26:
          id v19 = sub_10000E2BC();
          v20 = (os_log_s *)objc_claimAutoreleasedReturnValue(v19);
          if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 67109120;
            LODWORD(v35) = v32;
            _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "Unknown role, value: %u", buf, 8u);
          }

          v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%u", v32));
          -[SKAPFSDisk setApfsRole:](v5, "setApfsRole:", v21);

          goto LABEL_38;
      }

      -[SKAPFSDisk setApfsRole:](v5, "setApfsRole:", *v23);
      v17 = &kSKDiskRoleStorageImplementation;
      goto LABEL_42;
    }

    id v13 = sub_10000E2BC();
    v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      v15 = (void *)objc_claimAutoreleasedReturnValue(-[SKAPFSDisk diskIdentifier](v5, "diskIdentifier"));
      *(_DWORD *)buf = 136315394;
      v35 = "-[SKAPFSDisk(Daemon) _cacheInfoForDADisk:]";
      __int16 v36 = 2114;
      v37 = v15;
      _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_ERROR,  "%s: APFS volume %{public}@ has no UUID",  buf,  0x16u);
    }

LABEL_14:
    BOOL v16 = 0;
    goto LABEL_47;
  }

  if (-[SKAPFSDisk isIOSRootSnapshot](v5, "isIOSRootSnapshot"))
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[SKAPFSDisk _getFilesystem](v5, "_getFilesystem"));
    -[SKAPFSDisk setFilesystem:](v5, "setFilesystem:", v10);

    -[SKAPFSDisk setApfsRole:](v5, "setApfsRole:", SKAPFSVolumeRoleNone);
    v11 = &kSKDiskRoleSnapshot;
  }

  else
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue( +[SKFilesystem filesystemFor:caseSensitive:encrypted:isExtension:]( &OBJC_CLASS___SKFilesystem,  "filesystemFor:caseSensitive:encrypted:isExtension:",  @"apfs",  0LL,  0LL,  1LL));
    -[SKAPFSDisk setFilesystem:](v5, "setFilesystem:", v12);

    -[SKAPFSDisk setApfsRole:](v5, "setApfsRole:", SKAPFSVolumeRoleNone);
    v11 = &kSKDiskRoleMacData;
  }

  -[SKAPFSDisk setRole:](v5, "setRole:", *v11);
LABEL_44:
  v25 = (void *)objc_claimAutoreleasedReturnValue(-[SKAPFSDisk filesystem](v5, "filesystem"));
  -[SKAPFSDisk setIsCaseSensitive:](v5, "setIsCaseSensitive:", [v25 isCaseSensitive]);

  v26 = (void *)objc_claimAutoreleasedReturnValue(-[SKAPFSDisk filesystem](v5, "filesystem"));
  unsigned int v27 = [v26 isEncrypted];
  unsigned int v28 = -[SKAPFSDisk isEncrypted](v5, "isEncrypted");

  if (v27 != v28)
  {
    v29 = (void *)objc_claimAutoreleasedReturnValue(+[SKDaemonManager sharedManager](&OBJC_CLASS___SKDaemonManager, "sharedManager"));
    v31[0] = _NSConcreteStackBlock;
    v31[1] = 3221225472LL;
    v31[2] = sub_100012FF0;
    v31[3] = &unk_100045090;
    v31[4] = v5;
    [v29 filesystemsWithCallbackBlock:v31];
  }

  BOOL v16 = 1;
LABEL_47:
  objc_sync_exit(v5);

  return v16;
}

- (id)liveDiskIdentifierWithDiskDescription:(id)a3
{
  id v3 = a3;
  unsigned int v4 = +[SKAPFSDisk isLIFSAPFSWithDiskDescription:](&OBJC_CLASS___SKAPFSDisk, "isLIFSAPFSWithDiskDescription:", v3);
  v5 = (const CFStringRef *)&kDADiskDescriptionVolumeLifsURLKey;
  if (!v4) {
    v5 = &kDADiskDescriptionMediaBSDNameKey;
  }
  v6 = (void *)objc_claimAutoreleasedReturnValue([v3 objectForKeyedSubscript:*v5]);

  return v6;
}

- (id)volumeNameWithDiskDescription:(id)a3
{
  id v4 = a3;
  if (-[SKAPFSDisk isLiveFSAPFSDisk](self, "isLiveFSAPFSDisk"))
  {
    v5 = [kSKDiskIdentifierLiveFSAPFSPrefix length];
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[SKAPFSDisk diskIdentifier](self, "diskIdentifier"));
    BOOL v7 = (void *)objc_claimAutoreleasedReturnValue(-[SKAPFSDisk diskIdentifier](self, "diskIdentifier"));
    id v8 = (char *)objc_msgSend( v6,  "rangeOfString:options:range:",  @"/",  0,  v5,  (_BYTE *)objc_msgSend(v7, "length") - v5);

    if (v8 == (char *)0x7FFFFFFFFFFFFFFFLL)
    {
      id v9 = sub_10000E2BC();
      v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        v11 = (void *)objc_claimAutoreleasedReturnValue(-[SKAPFSDisk diskIdentifier](self, "diskIdentifier"));
        *(_DWORD *)buf = 136315394;
        v18 = "-[SKAPFSDisk(Daemon) volumeNameWithDiskDescription:]";
        __int16 v19 = 2112;
        v20 = v11;
        _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_ERROR,  "%s: Invalid volume name in LiveFS URL %@",  buf,  0x16u);
      }

      v12 = 0LL;
    }

    else
    {
      v14 = (void *)objc_claimAutoreleasedReturnValue(-[SKAPFSDisk diskIdentifier](self, "diskIdentifier"));
      v12 = (void *)objc_claimAutoreleasedReturnValue([v14 substringFromIndex:v8 + 1]);
    }
  }

  else
  {
    v16.receiver = self;
    v16.super_class = (Class)&OBJC_CLASS___SKAPFSDisk;
    id v13 = -[SKAPFSDisk volumeNameWithDiskDescription:](&v16, "volumeNameWithDiskDescription:", v4);
    v12 = (void *)objc_claimAutoreleasedReturnValue(v13);
  }

  return v12;
}

- (BOOL)_cacheSpacesWithPurgeable:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = self;
  objc_sync_enter(v4);
  v24.receiver = v4;
  v24.super_class = (Class)&OBJC_CLASS___SKAPFSDisk;
  if (!-[SKAPFSDisk _cacheSpacesWithPurgeable:](&v24, "_cacheSpacesWithPurgeable:", v3))
  {
LABEL_13:
    LOBYTE(v8) = 0;
    goto LABEL_16;
  }

  if (!-[SKAPFSDisk isIOMediaDisk](v4, "isIOMediaDisk"))
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[SKAPFSDisk mountPoint](v4, "mountPoint"));
    BOOL v13 = [v12 length] == 0;

    if (v13)
    {
      id v19 = sub_10000E2BC();
      v20 = (os_log_s *)objc_claimAutoreleasedReturnValue(v19);
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315394;
        v26 = "-[SKAPFSDisk(Daemon) _cacheSpacesWithPurgeable:]";
        __int16 v27 = 2112;
        v28[0] = v4;
        _os_log_impl( (void *)&_mh_execute_header,  v20,  OS_LOG_TYPE_ERROR,  "%s: LiveFS disk is not mounted: %@",  buf,  0x16u);
      }
    }

    else
    {
      v23[2] = 0LL;
      memset(v22, 0, 12);
      v23[0] = 5LL;
      v23[1] = 2155872256LL;
      id v14 = objc_claimAutoreleasedReturnValue(-[SKAPFSDisk mountPoint](v4, "mountPoint"));
      BOOL v15 = getattrlist((const char *)[v14 fileSystemRepresentation], v23, v22, 0xCuLL, 1u) == 0;

      if (v15)
      {
        -[SKAPFSDisk setUsedSpace:](v4, "setUsedSpace:", *(void *)((char *)v22 + 4));
        goto LABEL_15;
      }

      id v16 = sub_10000E2BC();
      v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      {
        int v18 = *__error();
        *(_DWORD *)buf = 136315650;
        v26 = "-[SKAPFSDisk(Daemon) _cacheSpacesWithPurgeable:]";
        __int16 v27 = 1024;
        LODWORD(v28[0]) = v18;
        WORD2(v28[0]) = 2112;
        *(void *)((char *)v28 + 6) = v4;
        _os_log_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_ERROR,  "%s: getattrlist failed with errno %d for %@",  buf,  0x1Cu);
      }
    }

    goto LABEL_13;
  }

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[SKAPFSDisk privateCache](v4, "privateCache"));
  v6 = (void *)objc_claimAutoreleasedReturnValue([v5 liveDiskIdentifier]);
  BOOL v7 = (void *)objc_claimAutoreleasedReturnValue(-[SKAPFSDisk containerBSDName](v4, "containerBSDName"));
  id v8 = +[SKAPFSContainerDisk copyExtendedSpaceInfoWithDiskIdentifier:containerBSDName:]( &OBJC_CLASS___SKAPFSContainerDisk,  "copyExtendedSpaceInfoWithDiskIdentifier:containerBSDName:",  v6,  v7);

  if (v8)
  {
    id v9 = (void *)objc_claimAutoreleasedReturnValue([v8 objectForKeyedSubscript:@"fs_used"]);
    -[SKAPFSDisk setUsedSpace:](v4, "setUsedSpace:", sub_1000124CC(v9));

    v10 = (void *)objc_claimAutoreleasedReturnValue([v8 objectForKeyedSubscript:@"fs_reserve"]);
    -[SKAPFSDisk setReserveSpace:](v4, "setReserveSpace:", sub_1000124CC(v10));

    v11 = (void *)objc_claimAutoreleasedReturnValue([v8 objectForKeyedSubscript:@"fs_quota"]);
    -[SKAPFSDisk setQuotaSpace:](v4, "setQuotaSpace:", sub_1000124CC(v11));

LABEL_15:
    LOBYTE(v8) = 1;
  }

- (void)cacheEncryptionInfo
{
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue(-[SKAPFSDisk privateCache](self, "privateCache"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 liveDiskIdentifier]);

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[SKAPFSDisk apfsRole](self, "apfsRole"));
  if (v5 == (void *)SKAPFSVolumeRoleSystem)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[SKAPFSDisk apfsVolumeGroupUUID](self, "apfsVolumeGroupUUID"));

    if (!v6) {
      goto LABEL_5;
    }
    v5 = v4;
    id v4 = (void *)objc_claimAutoreleasedReturnValue(-[SKAPFSDisk getDataVolumeBSD](self, "getDataVolumeBSD"));
  }

LABEL_5:
  if (v4)
  {
    BOOL v7 = (void *)objc_claimAutoreleasedReturnValue(+[SKDaemonManager sharedManager](&OBJC_CLASS___SKDaemonManager, "sharedManager"));
    id v8 = (__DASession *)[v7 diskArbSession];

    id v9 = v4;
    DADiskRef v10 = DADiskCreateFromBSDName(kCFAllocatorDefault, v8, (const char *)[v9 fileSystemRepresentation]);
    if (v10)
    {
      v11 = -[SKIOMedia initWithDADisk:](objc_alloc(&OBJC_CLASS___SKIOMedia), "initWithDADisk:", v10);
      v12 = v11;
      if (v11)
      {
        id v13 = -[SKIOObject copyProperties](v11, "copyProperties");
        id v14 = (void *)objc_claimAutoreleasedReturnValue([v13 objectForKeyedSubscript:@"Encrypted"]);
        unsigned int v15 = sub_100012488(v14);

        id v16 = (void *)objc_claimAutoreleasedReturnValue([v13 objectForKeyedSubscript:@"Effaceable"]);
        unsigned int v17 = sub_100012488(v16);

        int v18 = (void *)objc_claimAutoreleasedReturnValue([v13 objectForKeyedSubscript:@"Locked"]);
        unsigned int v19 = sub_100012488(v18);

        -[SKAPFSDisk setIsEncrypted:](self, "setIsEncrypted:", v15 | v17);
        buf[0] = 0;
        char v24 = 0;
        if (-[SKAPFSDisk isEncrypted](self, "isEncrypted"))
        {
          APFSVolumeGetVEKState([v9 fileSystemRepresentation], buf, &v24);
          if (buf[0]) {
            BOOL v20 = v24 == 0;
          }
          else {
            BOOL v20 = 0;
          }
          uint64_t v21 = !v20;
        }

        else
        {
          uint64_t v21 = 1LL;
        }

        -[SKAPFSDisk setDefaultEffaceable:](self, "setDefaultEffaceable:", v21);
        if (-[SKAPFSDisk isEncrypted](self, "isEncrypted"))
        {
          if (((v21 | v19 ^ 1) & 1) != 0)
          {
            id v23 = -[SKIOObject copyParentPropertyWithClass:key:]( v12,  "copyParentPropertyWithClass:key:",  objc_opt_class(&OBJC_CLASS___NSNumber),  @"AppleTDMLocked");
            -[SKAPFSDisk setIsLocked:](self, "setIsLocked:", sub_100012488(v23));
          }

          else
          {
            -[SKAPFSDisk setIsLocked:](self, "setIsLocked:", 1LL);
          }
        }
      }
    }

    else
    {
      id v22 = sub_10000E2BC();
      v12 = (SKIOMedia *)objc_claimAutoreleasedReturnValue(v22);
      if (os_log_type_enabled((os_log_t)v12, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315394;
        v26 = "-[SKAPFSDisk(Daemon) cacheEncryptionInfo]";
        __int16 v27 = 2114;
        id v28 = v9;
        _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)v12,  OS_LOG_TYPE_ERROR,  "%s: Cannot create DADisk for data volume %{public}@",  buf,  0x16u);
      }
    }
  }
}

- (void)_cacheVolumeGroup
{
  uint64_t v24 = 0LL;
  uint64_t v25 = 0LL;
  uint64_t v22 = 0LL;
  uint64_t v23 = 0LL;
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue(-[SKAPFSDisk diskIdentifier](self, "diskIdentifier"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 substringFromIndex:4]);
  v5 = (void *)objc_claimAutoreleasedReturnValue([v4 componentsSeparatedByString:@"s"]);

  if ((unint64_t)[v5 count] > 1)
  {
    id v9 = (void *)objc_claimAutoreleasedReturnValue([v5 objectAtIndex:0]);
    DADiskRef v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"/dev/disk%@", v9));

    v11 = (void *)objc_claimAutoreleasedReturnValue([v5 objectAtIndex:1]);
    unsigned __int8 v12 = [v11 intValue];

    id v7 = v10;
    if (APFSContainerVolumeGroupGet([v7 fileSystemRepresentation], v12, &v24))
    {
      id v13 = sub_10000E2BC();
      id v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Failed to read volume group UUID", buf, 2u);
      }
    }

    else if (v24 != v22 || v25 != v23)
    {
      id v16 = -[NSUUID initWithUUIDBytes:](objc_alloc(&OBJC_CLASS___NSUUID), "initWithUUIDBytes:", &v24);
      unsigned int v17 = (void *)objc_claimAutoreleasedReturnValue(-[NSUUID UUIDString](v16, "UUIDString"));
      -[SKAPFSDisk setApfsVolumeGroupUUID:](self, "setApfsVolumeGroupUUID:", v17);

      goto LABEL_14;
    }

    -[SKAPFSDisk setApfsVolumeGroupUUID:](self, "setApfsVolumeGroupUUID:", 0LL);
  }

  else
  {
    id v6 = sub_10000E2BC();
    id v7 = (id)objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled((os_log_t)v7, OS_LOG_TYPE_ERROR))
    {
      id v8 = (void *)objc_claimAutoreleasedReturnValue(-[SKAPFSDisk diskIdentifier](self, "diskIdentifier"));
      *(_DWORD *)buf = 136315394;
      unsigned int v19 = "-[SKAPFSDisk(Daemon) _cacheVolumeGroup]";
      __int16 v20 = 2114;
      uint64_t v21 = v8;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)v7,  OS_LOG_TYPE_ERROR,  "%s: Invalid BSD name for APFS volume: %{public}@",  buf,  0x16u);
    }
  }

- (BOOL)canResize
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[SKAPFSDisk container](self, "container"));
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue([v2 designatedPhysicalStore]);
  unsigned __int8 v4 = [v3 canResize];

  return v4;
}

- (NSString)containerBSDName
{
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue(-[SKAPFSDisk privateCache](self, "privateCache"));
  unsigned __int8 v4 = (__DADisk *)objc_claimAutoreleasedReturnValue([v3 wholeDADisk]);
  BSDName = DADiskGetBSDName(v4);

  if (BSDName)
  {
    id v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", BSDName));
  }

  else
  {
    id v7 = sub_10000E2BC();
    id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      id v9 = (void *)objc_claimAutoreleasedReturnValue(-[SKAPFSDisk diskIdentifier](self, "diskIdentifier"));
      int v11 = 136315394;
      unsigned __int8 v12 = "-[SKAPFSDisk(Daemon) containerBSDName]";
      __int16 v13 = 2114;
      id v14 = v9;
      _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_ERROR,  "%s: Failed getting container BSD name for %{public}@",  (uint8_t *)&v11,  0x16u);
    }

    id v6 = 0LL;
  }

  return (NSString *)v6;
}

- (id)getDataVolumeBSD
{
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue(-[SKAPFSDisk containerBSDName](self, "containerBSDName"));
  if (v3)
  {
    unsigned __int8 v4 = objc_alloc(&OBJC_CLASS___NSUUID);
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[SKAPFSDisk apfsVolumeGroupUUID](self, "apfsVolumeGroupUUID"));
    id v6 = -[NSUUID initWithUUIDString:](v4, "initWithUUIDString:", v5);

    -[NSUUID getUUIDBytes:](v6, "getUUIDBytes:", v42);
    id v7 = v3;
    int Volumes = APFSContainerVolumeGroupGetVolumes([v7 UTF8String], v42, &v34);
    if (Volumes)
    {
      int v9 = Volumes;
      id v10 = sub_10000E2BC();
      int v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        unsigned __int8 v12 = (void *)objc_claimAutoreleasedReturnValue(-[SKAPFSDisk apfsVolumeGroupUUID](self, "apfsVolumeGroupUUID"));
        int buf = 136315650;
        v37 = "-[SKAPFSDisk(Daemon) getDataVolumeBSD]";
        __int16 v38 = 2114;
        id v39 = v12;
        __int16 v40 = 1024;
        int v41 = v9;
        _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_ERROR,  "%s: Failed to get volumes in APFS group %{public}@, err %d",  (uint8_t *)&buf,  0x1Cu);
      }

      id v13 = 0LL;
    }

    else
    {
      __int128 v30 = 0u;
      __int128 v31 = 0u;
      __int128 v32 = 0u;
      __int128 v33 = 0u;
      int v11 = (os_log_s *)v34;
      id v14 = -[os_log_s countByEnumeratingWithState:objects:count:]( v11,  "countByEnumeratingWithState:objects:count:",  &v30,  v35,  16LL);
      if (v14)
      {
        id v15 = v14;
        uint64_t v16 = *(void *)v31;
        id v28 = v3;
LABEL_9:
        uint64_t v17 = 0LL;
        while (1)
        {
          if (*(void *)v31 != v16) {
            objc_enumerationMutation(v11);
          }
          int v18 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@s%@",  v7,  *(void *)(*((void *)&v30 + 1) + 8 * v17)));
          __int16 v29 = 0;
          id v19 = v18;
          int v20 = APFSVolumeRole([v19 fileSystemRepresentation], &v29, 0);
          if (v20) {
            break;
          }
          if (v29 == 64)
          {
            id v13 = v19;
            BOOL v3 = v28;
LABEL_23:

            uint64_t v22 = v11;
            goto LABEL_24;
          }

          if (v15 == (id)++v17)
          {
            id v15 = -[os_log_s countByEnumeratingWithState:objects:count:]( v11,  "countByEnumeratingWithState:objects:count:",  &v30,  v35,  16LL);
            BOOL v3 = v28;
            if (v15) {
              goto LABEL_9;
            }
            goto LABEL_16;
          }
        }

        int v24 = v20;
        id v25 = sub_10000E2BC();
        v26 = (os_log_s *)objc_claimAutoreleasedReturnValue(v25);
        BOOL v3 = v28;
        if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
        {
          int buf = 136315650;
          v37 = "-[SKAPFSDisk(Daemon) getDataVolumeBSD]";
          __int16 v38 = 2114;
          id v39 = v19;
          __int16 v40 = 1024;
          int v41 = v24;
          _os_log_impl( (void *)&_mh_execute_header,  v26,  OS_LOG_TYPE_ERROR,  "%s: Failed to get volume role for %{public}@, err %d",  (uint8_t *)&buf,  0x1Cu);
        }

        id v13 = 0LL;
        goto LABEL_23;
      }

+ (BOOL)isLIFSAPFSWithDiskDescription:(id)a3
{
  return 0;
}

- (BOOL)canUpdateDiskIdentifierWithDiskInfo:(id)a3
{
  id v4 = a3;
  LOBYTE(self) = [(id)objc_opt_class(self) isLIFSAPFSWithDiskDescription:v4];

  return (char)self;
}

- (BOOL)cleanupWithError:(id *)a3
{
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[SKAPFSDisk diskIdentifier](self, "diskIdentifier"));
  uint64_t v6 = SK_DM_APFSUtils_deleteVolume(v5);

  if (a3)
  {
    if ((_DWORD)v6) {
      *a3 = (id)objc_claimAutoreleasedReturnValue( +[SKError errorWithOSStatus:error:]( &OBJC_CLASS___SKError,  "errorWithOSStatus:error:",  v6,  a3));
    }
  }

  return (_DWORD)v6 == 0;
}

@end