@interface MSDHVolumeManager
+ (id)sharedInstance;
- (BOOL)checkFreeSpaceLeftInContainer:(id)a3 neededSpace:(unint64_t)a4;
- (BOOL)deleteAPFSVolume:(id)a3;
- (BOOL)deleteDemoVolume;
- (BOOL)manageSnapshot:(id)a3 forVolumeAt:(id)a4;
- (BOOL)mountAPFSVolume:(id)a3 atMountPoint:(id)a4 withAttributes:(id)a5;
- (BOOL)mountSnapshotAt:(id)a3 forVolumeAt:(id)a4;
- (BOOL)setupDemoVolume;
- (BOOL)unmountAPFSVolume:(id)a3;
- (BOOL)unmountSnapshotAt:(id)a3;
- (MSDHVolumeManager)init;
- (NSString)demoVolumeDev;
- (NSString)userHomePath;
- (id)createAPFSVolume:(id)a3 withSizeInMB:(unint64_t)a4 inContainer:(id)a5;
- (id)findAPFSVolumeMountPoint:(id)a3;
- (id)getAPFSBootContainerDeviceNode;
- (id)lookupAPFSVolumeDevByName:(id)a3;
- (void)setDemoVolumeDev:(id)a3;
- (void)waitForSnapshotDeletionOnVolume:(int)a3;
@end

@implementation MSDHVolumeManager

+ (id)sharedInstance
{
  if (qword_10004F848 != -1) {
    dispatch_once(&qword_10004F848, &stru_100044D68);
  }
  return (id)qword_10004F840;
}

- (MSDHVolumeManager)init
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___MSDHVolumeManager;
  v2 = -[MSDHVolumeManager init](&v6, "init");
  v3 = v2;
  if (v2)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue( -[MSDHVolumeManager lookupAPFSVolumeDevByName:]( v2,  "lookupAPFSVolumeDevByName:",  @"com.apple.mobilestoredemo.storage"));
    -[MSDHVolumeManager setDemoVolumeDev:](v3, "setDemoVolumeDev:", v4);
  }

  return v3;
}

- (BOOL)manageSnapshot:(id)a3 forVolumeAt:(id)a4
{
  id v6 = a3;
  uint64_t v7 = open((const char *)[a4 UTF8String], 0);
  if ((int)v7 > 0)
  {
    if ([v6 isEqualToString:@"RevertSnapshot"])
    {
      int v8 = fs_snapshot_revert(v7, "com.apple.snapshot.mobilestoredemo", 0);
      id v9 = sub_100021D84();
      v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
      v11 = v10;
      if (!v8)
      {
        if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
        {
          LOWORD(v23) = 0;
          v12 = "Snapshot reverted.";
LABEL_21:
          _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, v12, (uint8_t *)&v23, 2u);
          goto LABEL_22;
        }

        goto LABEL_22;
      }

      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
        sub_100029C90();
      }
    }

    else
    {
      if ([v6 isEqualToString:@"DeleteSnapshot"])
      {
        if (fs_snapshot_delete(v7, "com.apple.snapshot.mobilestoredemo", 0))
        {
          if (*__error() != 2)
          {
            id v13 = sub_100021D84();
            v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
            if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
              sub_100029CFC();
            }
            goto LABEL_17;
          }
        }

        else
        {
          -[MSDHVolumeManager waitForSnapshotDeletionOnVolume:](self, "waitForSnapshotDeletionOnVolume:", v7);
        }

        id v19 = sub_100021D84();
        v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v19);
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
        {
          LOWORD(v23) = 0;
          v12 = "Snapshot deleted.";
          goto LABEL_21;
        }

        goto LABEL_22;
      }

      if ([v6 isEqualToString:@"CreateSnapshot"])
      {
        int v14 = fs_snapshot_create(v7, "com.apple.snapshot.mobilestoredemo", 0);
        id v15 = sub_100021D84();
        v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(v15);
        v11 = v16;
        if (!v14)
        {
          if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
          {
            LOWORD(v23) = 0;
            v12 = "Snapshot created.";
            goto LABEL_21;
          }

- (BOOL)mountSnapshotAt:(id)a3 forVolumeAt:(id)a4
{
  id v5 = a3;
  int v6 = open((const char *)[a4 UTF8String], 0);
  if (v6 <= 0)
  {
    id v13 = sub_100021D84();
    int v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      sub_100029C24();
    }

    BOOL v8 = 0;
  }

  else
  {
    int v7 = fs_snapshot_mount( v6, (const char *)[v5 UTF8String], "com.apple.snapshot.mobilestoredemo", 0);
    BOOL v8 = v7 == 0;
    id v9 = sub_100021D84();
    v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
    v11 = v10;
    if (v7)
    {
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
        sub_100029DD4();
      }
    }

    else if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v15 = 0;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Snapshot mounted.", v15, 2u);
    }

    close(v6);
  }

  return v8;
}

- (BOOL)unmountSnapshotAt:(id)a3
{
  int v3 = unmount((const char *)[a3 UTF8String], 0x80000);
  id v4 = sub_100021D84();
  id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
  int v6 = v5;
  if (v3)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      sub_100029E40();
    }
  }

  else if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)BOOL v8 = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Snapshot unmounted.", v8, 2u);
  }

  return v3 == 0;
}

- (BOOL)setupDemoVolume
{
  int v3 = (void *)objc_claimAutoreleasedReturnValue(-[MSDHVolumeManager demoVolumeDev](self, "demoVolumeDev"));

  if (!v3)
  {
    id v4 = (void *)objc_claimAutoreleasedReturnValue(-[MSDHVolumeManager getAPFSBootContainerDeviceNode](self, "getAPFSBootContainerDeviceNode"));
    id v5 = (void *)objc_claimAutoreleasedReturnValue( -[MSDHVolumeManager createAPFSVolume:withSizeInMB:inContainer:]( self,  "createAPFSVolume:withSizeInMB:inContainer:",  @"com.apple.mobilestoredemo.storage",  64LL,  v4));
    -[MSDHVolumeManager setDemoVolumeDev:](self, "setDemoVolumeDev:", v5);

    int v6 = (void *)objc_claimAutoreleasedReturnValue(-[MSDHVolumeManager demoVolumeDev](self, "demoVolumeDev"));
    if (!v6) {
      goto LABEL_8;
    }
  }

  v17[0] = NSFileOwnerAccountName;
  v17[1] = NSFileGroupOwnerAccountName;
  v18[0] = @"mobile";
  v18[1] = @"mobile";
  v17[2] = NSFilePosixPermissions;
  int v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithShort:](&OBJC_CLASS___NSNumber, "numberWithShort:", 448LL));
  v18[2] = v7;
  int v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v18,  v17,  3LL));

  BOOL v8 = (void *)objc_claimAutoreleasedReturnValue(-[MSDHVolumeManager demoVolumeDev](self, "demoVolumeDev"));
  unsigned int v9 = -[MSDHVolumeManager mountAPFSVolume:atMountPoint:withAttributes:]( self,  "mountAPFSVolume:atMountPoint:withAttributes:",  v8,  @"/private/var/mnt/com.apple.mobilestoredemo.storage",  v6);

  if (v9)
  {
    id v10 = sub_100021D84();
    v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      v12 = (void *)objc_claimAutoreleasedReturnValue(-[MSDHVolumeManager demoVolumeDev](self, "demoVolumeDev"));
      int v15 = 138543362;
      v16 = v12;
      _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "Demo volume '%{public}@' is created and mounted.",  (uint8_t *)&v15,  0xCu);
    }

    BOOL v13 = 1;
  }

  else
  {
LABEL_8:
    BOOL v13 = 0;
  }

  return v13;
}

- (BOOL)deleteDemoVolume
{
  int v3 = (void *)objc_claimAutoreleasedReturnValue(-[MSDHVolumeManager demoVolumeDev](self, "demoVolumeDev"));

  if (v3)
  {
    id v4 = (void *)objc_claimAutoreleasedReturnValue(-[MSDHVolumeManager demoVolumeDev](self, "demoVolumeDev"));
    unsigned int v5 = -[MSDHVolumeManager unmountAPFSVolume:](self, "unmountAPFSVolume:", v4);

    if (!v5) {
      return 0;
    }
    int v6 = (void *)objc_claimAutoreleasedReturnValue(-[MSDHVolumeManager demoVolumeDev](self, "demoVolumeDev"));
    unsigned int v7 = -[MSDHVolumeManager deleteAPFSVolume:](self, "deleteAPFSVolume:", v6);

    if (!v7) {
      return 0;
    }
    -[MSDHVolumeManager setDemoVolumeDev:](self, "setDemoVolumeDev:", 0LL);
    id v8 = sub_100021D84();
    unsigned int v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v14 = 0;
      id v10 = "Demo volume is unmounted and deleted.";
      v11 = (uint8_t *)&v14;
LABEL_8:
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, v10, v11, 2u);
    }
  }

  else
  {
    id v12 = sub_100021D84();
    unsigned int v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      id v10 = "Demo volume not found. Skip delete.";
      v11 = buf;
      goto LABEL_8;
    }
  }

  return 1;
}

- (NSString)userHomePath
{
  return NSHomeDirectoryForUser(@"mobile");
}

- (id)getAPFSBootContainerDeviceNode
{
  if (qword_10004F858 != -1) {
    dispatch_once(&qword_10004F858, &stru_100044D88);
  }
  return (id)qword_10004F850;
}

- (id)createAPFSVolume:(id)a3 withSizeInMB:(unint64_t)a4 inContainer:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  id v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  v11 = 0LL;
  id v12 = 0LL;
  if (v8 && v9)
  {
    if (-[MSDHVolumeManager checkFreeSpaceLeftInContainer:neededSpace:]( self,  "checkFreeSpaceLeftInContainer:neededSpace:",  v9,  a4 << 20))
    {
      if (a4)
      {
        BOOL v13 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedLongLong:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedLongLong:",  a4 << 20));
        [v10 setObject:v13 forKey:kAPFSVolumeReserveSizeKey];
      }

      [v10 setObject:v8 forKey:kAPFSVolumeNameKey];
      id v14 = v9;
      if (APFSVolumeCreate([v14 UTF8String], v10))
      {
        id v20 = sub_100021D84();
        id v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v20);
        if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
          sub_10002A040();
        }
        v11 = 0LL;
        id v12 = 0LL;
      }

      else
      {
        int v15 = (void *)objc_claimAutoreleasedReturnValue([v10 objectForKey:kAPFSVolumeFSIndexKey]);
        id v12 = v15;
        if (!v15 || ([v15 intValue] & 0x80000000) != 0)
        {
          id v19 = sub_100021D84();
          id v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v19);
          if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
            sub_10002A014();
          }
          v11 = 0LL;
        }

        else
        {
          v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( NSString, "stringWithFormat:", @"%ss%d", [v14 UTF8String], objc_msgSend(v12, "intValue") + 1));
          id v16 = sub_100021D84();
          id v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);
          if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138543618;
            v22 = v11;
            __int16 v23 = 2048;
            unint64_t v24 = a4;
            _os_log_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_DEFAULT,  "APFS volume '%{public}@' with size %llu MB is created.",  buf,  0x16u);
          }
        }
      }
    }

    else
    {
      v11 = 0LL;
      id v12 = 0LL;
    }
  }

  return v11;
}

- (BOOL)deleteAPFSVolume:(id)a3
{
  id v3 = a3;
  id v4 = v3;
  if (v3)
  {
    id v5 = v3;
    int v6 = APFSVolumeDelete([v5 UTF8String]);
    BOOL v7 = v6 == 0;
    id v8 = sub_100021D84();
    id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
    id v10 = v9;
    if (v6)
    {
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
        sub_10002A0A4();
      }
    }

    else if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      int v12 = 138543362;
      id v13 = v5;
      _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "APFS volume '%{public}@' deleted.",  (uint8_t *)&v12,  0xCu);
    }
  }

  else
  {
    BOOL v7 = 0;
  }

  return v7;
}

- (BOOL)checkFreeSpaceLeftInContainer:(id)a3 neededSpace:(unint64_t)a4
{
  unint64_t v9 = 0LL;
  uint64_t v10 = 0LL;
  if (APFSContainerGetSpaceInfo([a3 UTF8String], &v10, &v9))
  {
    id v6 = sub_100021D84();
    BOOL v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      sub_10002A18C();
    }
  }

  else
  {
    if (v9 > a4) {
      return 1;
    }
    id v8 = sub_100021D84();
    BOOL v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      sub_10002A108(&v9, a4, v7);
    }
  }

  return 0;
}

- (id)lookupAPFSVolumeDevByName:(id)a3
{
  id v3 = a3;
  id v4 = v3;
  io_iterator_t existing = 0;
  CFMutableDictionaryRef properties = 0LL;
  if (!v3)
  {
LABEL_36:
    unint64_t v9 = 0LL;
    goto LABEL_26;
  }

  id v5 = v3;
  id v6 = IOServiceNameMatching((const char *)[v5 UTF8String]);
  if (IOServiceGetMatchingServices(kIOMasterPortDefault, v6, &existing))
  {
    id v21 = sub_100021D84();
    v22 = (os_log_s *)objc_claimAutoreleasedReturnValue(v21);
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
      sub_10002A1F0();
    }

    io_object_t v8 = 0;
LABEL_30:
    if (existing) {
      IOObjectRelease(existing);
    }
    if (v8) {
      IOObjectRelease(v8);
    }
    if (properties) {
      CFRelease(properties);
    }
    goto LABEL_36;
  }

  io_object_t v7 = IOIteratorNext(existing);
  if (v7)
  {
    io_object_t v8 = v7;
    do
    {
      if (IOObjectConformsTo(v8, "AppleAPFSVolume"))
      {
        memset(name, 0, sizeof(name));
        if (IORegistryEntryGetName(v8, name)
          || IORegistryEntryCreateCFProperties(v8, &properties, kCFAllocatorDefault, 0))
        {
          goto LABEL_30;
        }

        if (!strncmp((const char *)[v5 UTF8String], name, 0x80uLL))
        {
          Value = CFDictionaryGetValue(properties, @"BSD Name");
          uint64_t v11 = objc_claimAutoreleasedReturnValue(Value);
          if (!v11) {
            goto LABEL_30;
          }
          int v12 = (void *)v11;
          unint64_t v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"/dev/%@",  v11));
        }

        else
        {
          unint64_t v9 = 0LL;
        }

        CFRelease(properties);
      }

      else
      {
        unint64_t v9 = 0LL;
      }

      IOObjectRelease(v8);
      io_object_t v8 = IOIteratorNext(existing);
      if (v8) {
        BOOL v13 = v9 == 0LL;
      }
      else {
        BOOL v13 = 0;
      }
    }

    while (v13);
    IOObjectRelease(existing);
    if (v9)
    {
      id v14 = sub_100021D84();
      int v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543618;
        id v26 = v5;
        __int16 v27 = 2114;
        v28 = v9;
        id v16 = "APFS volume '%{public}@' found as '%{public}@'.";
        id v17 = v15;
        uint32_t v18 = 22;
LABEL_24:
        _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, v16, buf, v18);
        goto LABEL_25;
      }

      goto LABEL_25;
    }
  }

  else
  {
    IOObjectRelease(existing);
    unint64_t v9 = 0LL;
  }

  id v19 = sub_100021D84();
  int v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v19);
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    id v26 = v5;
    id v16 = "APFS volume '%{public}@' NOT found.";
    id v17 = v15;
    uint32_t v18 = 12;
    goto LABEL_24;
  }

- (id)findAPFSVolumeMountPoint:(id)a3
{
  id v3 = a3;
  uint32_t v18 = 0LL;
  if (!v3)
  {
LABEL_20:
    unint64_t v9 = 0LL;
    goto LABEL_16;
  }

  int v4 = getmntinfo_r_np(&v18, 2);
  if (v4 < 1 || (id v5 = v18) == 0LL)
  {
    id v15 = sub_100021D84();
    id v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(v15);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
      sub_10002A254();
    }

    goto LABEL_20;
  }

  unint64_t v6 = 0LL;
  uint64_t v7 = 2168LL * v4;
  while (1)
  {
    if (!strncmp("apfs", v5[v6 / 0x878].f_fstypename, 0xFuLL))
    {
      io_object_t v8 = (const char *)[v3 UTF8String];
      id v5 = v18;
      if (!strncmp(v8, v18[v6 / 0x878].f_mntfromname, 0xFuLL)) {
        break;
      }
    }

    v6 += 2168LL;
    if (v7 == v6)
    {
      unint64_t v9 = 0LL;
      goto LABEL_15;
    }
  }

  memset(&v17, 0, sizeof(v17));
  int v10 = stat(v5[v6 / 0x878].f_mntonname, &v17);
  if (v10)
  {
    int v11 = v10;
    id v12 = sub_100021D84();
    BOOL v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      int v20 = v11;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Mount point corrupted. error - %d", buf, 8u);
    }

    unint64_t v9 = 0LL;
  }

  else
  {
    unint64_t v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithUTF8String:]( &OBJC_CLASS___NSString,  "stringWithUTF8String:",  v18[v6 / 0x878].f_mntonname));
  }

  id v5 = v18;
LABEL_15:
  free(v5);
LABEL_16:

  return v9;
}

- (BOOL)mountAPFSVolume:(id)a3 atMountPoint:(id)a4 withAttributes:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  BOOL v11 = 0;
  id v12 = 0LL;
  __int128 v58 = 0u;
  memset(v59, 0, sizeof(v59));
  __int128 v56 = 0u;
  __int128 v57 = 0u;
  __int128 v55 = 0u;
  __int128 v54 = 0u;
  __int128 v53 = 0u;
  __int128 v52 = 0u;
  __int128 v51 = 0u;
  __int128 v50 = 0u;
  __int128 v49 = 0u;
  __int128 v48 = 0u;
  __int128 v47 = 0u;
  __int128 v46 = 0u;
  __int128 v45 = 0u;
  __int128 v44 = 0u;
  __int128 v43 = 0u;
  __int128 v42 = 0u;
  __int128 v41 = 0u;
  __int128 v40 = 0u;
  memset(&v34, 0, sizeof(v34));
  BOOL v13 = 0LL;
  if (v8 && v9)
  {
    id v14 = (void *)objc_claimAutoreleasedReturnValue(-[MSDHVolumeManager findAPFSVolumeMountPoint:](self, "findAPFSVolumeMountPoint:", v8));

    if (v14)
    {
      id v26 = sub_100021D84();
      __int16 v27 = (os_log_s *)objc_claimAutoreleasedReturnValue(v26);
      if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR)) {
        sub_10002A450();
      }
      id v12 = 0LL;
      BOOL v13 = 0LL;
    }

    else
    {
      BOOL v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
      id v33 = 0LL;
      unsigned __int8 v15 = [v13 createDirectoryAtPath:v9 withIntermediateDirectories:1 attributes:0 error:&v33];
      id v12 = v33;
      if ((v15 & 1) != 0)
      {
        id v16 = v9;
        if (stat((const char *)[v16 UTF8String], &v34))
        {
          id v29 = sub_100021D84();
          __int16 v27 = (os_log_s *)objc_claimAutoreleasedReturnValue(v29);
          if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR)) {
            sub_10002A344(v27);
          }
        }

        else
        {
          id v39 = [v8 UTF8String];
          WORD4(v40) = 1;
          *(void *)&v59[3] = *(void *)&v34.st_uid;
          LODWORD(v40) = 0x100000;
          id v17 = v16;
          if (mount("apfs", (const char *)[v17 UTF8String], 0x100000, &v39))
          {
            unsigned int v18 = 3;
            do
            {
              id v19 = sub_100021D84();
              int v20 = (os_log_s *)objc_claimAutoreleasedReturnValue(v19);
              if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
              {
                int v23 = *__error();
                *(_DWORD *)buf = 138543618;
                id v36 = v17;
                __int16 v37 = 1024;
                int v38 = v23;
                _os_log_error_impl( (void *)&_mh_execute_header,  v20,  OS_LOG_TYPE_ERROR,  "Failed to mount APFS volume on %{public}@ - %{errno}d",  buf,  0x12u);
              }

              if (*__error() != 2 || v18 < 2) {
                goto LABEL_31;
              }
              --v18;
              usleep(0x7A120u);
              v22 = (const char *)[v17 UTF8String];
            }

            while (mount("apfs", v22, v40, &v39));
          }

          if (!v10)
          {
            BOOL v11 = 1;
            goto LABEL_32;
          }

          id v32 = v12;
          unsigned __int8 v24 = [v13 setAttributes:v10 ofItemAtPath:v17 error:&v32];
          id v25 = v32;

          if ((v24 & 1) != 0)
          {
            BOOL v11 = 1;
            id v12 = v25;
            goto LABEL_32;
          }

          id v30 = sub_100021D84();
          __int16 v27 = (os_log_s *)objc_claimAutoreleasedReturnValue(v30);
          if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR)) {
            sub_10002A2C8(v25);
          }
          id v12 = v25;
        }
      }

      else
      {
        id v28 = sub_100021D84();
        __int16 v27 = (os_log_s *)objc_claimAutoreleasedReturnValue(v28);
        if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR)) {
          sub_10002A3C4((uint64_t)v9, v12, v27);
        }
      }
    }

LABEL_31:
    BOOL v11 = 0;
  }

- (BOOL)unmountAPFSVolume:(id)a3
{
  id v4 = a3;
  if (!v4)
  {
    id v10 = 0LL;
    id v7 = 0LL;
    id v8 = 0LL;
    BOOL v6 = 0;
    goto LABEL_11;
  }

  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[MSDHVolumeManager findAPFSVolumeMountPoint:](self, "findAPFSVolumeMountPoint:", v4));
  BOOL v6 = v5 == 0LL;
  if (!v5)
  {
    id v11 = sub_100021D84();
    id v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Volume is not mounted.", buf, 2u);
    }

    id v10 = 0LL;
    id v7 = 0LL;
    goto LABEL_9;
  }

  id v7 = v5;
  if (unmount((const char *)[v7 UTF8String], 0x80000))
  {
    id v14 = sub_100021D84();
    id v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      sub_10002A508();
    }
    id v10 = 0LL;
LABEL_9:
    id v8 = 0LL;
LABEL_10:

    goto LABEL_11;
  }

  id v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
  id v16 = 0LL;
  unsigned __int8 v9 = [v8 removeItemAtPath:v7 error:&v16];
  id v10 = v16;
  if ((v9 & 1) == 0)
  {
    id v15 = sub_100021D84();
    id v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v15);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      sub_10002A47C((uint64_t)v7, v10, v12);
    }
    goto LABEL_10;
  }

  BOOL v6 = 1;
LABEL_11:

  return v6;
}

- (void)waitForSnapshotDeletionOnVolume:(int)a3
{
  v10[1] = 0LL;
  v10[2] = 0LL;
  v10[0] = 3LL;
  if (ffsctl(a3, 0x80184A24uLL, v10, 0) < 0)
  {
    int v3 = *__error();
    id v4 = sub_100021D84();
    id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
    BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);
    if (v3 == 35)
    {
      if (v6)
      {
        *(_WORD *)buf = 0;
        id v7 = "Timed out waiting for snapshot deletion to finish.";
        id v8 = v5;
        uint32_t v9 = 2;
LABEL_7:
        _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, v7, buf, v9);
      }
    }

    else if (v6)
    {
      *(_DWORD *)buf = 67240192;
      int v12 = v3;
      id v7 = "Wait for snapshot deletion failed: %{public, errno}d";
      id v8 = v5;
      uint32_t v9 = 8;
      goto LABEL_7;
    }
  }

- (NSString)demoVolumeDev
{
  return self->_demoVolumeDev;
}

- (void)setDemoVolumeDev:(id)a3
{
}

- (void).cxx_destruct
{
}

@end