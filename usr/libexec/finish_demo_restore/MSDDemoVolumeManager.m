@interface MSDDemoVolumeManager
+ (id)sharedInstance;
- (BOOL)mountAPFSVolume:(id)a3 atMountPoint:(id)a4 withAttributes:(id)a5;
- (BOOL)moveStagingToFinal:(id)a3;
- (NSString)userHomePath;
- (id)findAPFSVolumeMountPoint:(id)a3;
- (id)lookupAPFSVolumeDevByName:(id)a3;
- (void)mountDemoVolume;
- (void)moveDataFromShelterToFinal;
@end

@implementation MSDDemoVolumeManager

+ (id)sharedInstance
{
  if (qword_10000C740 != -1) {
    dispatch_once(&qword_10000C740, &stru_100008390);
  }
  return (id)qword_10000C738;
}

- (NSString)userHomePath
{
  return NSHomeDirectoryForUser(@"mobile");
}

- (void)mountDemoVolume
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[MSDLogModel sharedInstance](&OBJC_CLASS___MSDLogModel, "sharedInstance"));
  [v3 logMessage:1, @"[INF]", @"Mounting demo volume with name '%@' at '%@'...", @"com.apple.mobilestoredemo.storage", @"/private/var/mnt/com.apple.mobilestoredemo.storage" prefix message];

  v4 = (void *)objc_claimAutoreleasedReturnValue( -[MSDDemoVolumeManager lookupAPFSVolumeDevByName:]( self,  "lookupAPFSVolumeDevByName:",  @"com.apple.mobilestoredemo.storage"));
  if (!v4)
  {
    v7 = 0LL;
    goto LABEL_8;
  }

  uint64_t v5 = objc_claimAutoreleasedReturnValue(-[MSDDemoVolumeManager findAPFSVolumeMountPoint:](self, "findAPFSVolumeMountPoint:", v4));
  if (v5)
  {
    v6 = (__CFString *)v5;
    v7 = 0LL;
  }

  else
  {
    v13[0] = NSFileOwnerAccountName;
    v13[1] = NSFileGroupOwnerAccountName;
    v14[0] = @"mobile";
    v14[1] = @"mobile";
    v13[2] = NSFilePosixPermissions;
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithShort:](&OBJC_CLASS___NSNumber, "numberWithShort:", 448LL));
    v14[2] = v8;
    v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v14,  v13,  3LL));

    v6 = @"/private/var/mnt/com.apple.mobilestoredemo.storage";
    if (!-[MSDDemoVolumeManager mountAPFSVolume:atMountPoint:withAttributes:]( self,  "mountAPFSVolume:atMountPoint:withAttributes:",  v4,  @"/private/var/mnt/com.apple.mobilestoredemo.storage",  v7)) {
      goto LABEL_8;
    }
  }

  unsigned __int8 v9 = -[__CFString isEqualToString:]( v6,  "isEqualToString:",  @"/private/var/mnt/com.apple.mobilestoredemo.storage");
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[MSDLogModel sharedInstance](&OBJC_CLASS___MSDLogModel, "sharedInstance"));
  v11 = v10;
  if ((v9 & 1) != 0) {
    objc_msgSend( v10,  "logMessage:prefix:message:",  1,  @"[INF]",  @"Demo volume successfully mounted!",  v12);
  }
  else {
    [v10 logMessage:1, @"[INF]", @"Demo volume incorrectly mounted at %@", v6 prefix message];
  }

LABEL_8:
}

- (void)moveDataFromShelterToFinal
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
  if (![v3 fileExistsAtPath:@"/private/var/mnt/com.apple.mobilestoredemo.storage/com.apple.mobilestoredemo.blob/DataShelter" isDirectory:&v11]) {
    goto LABEL_7;
  }
  int v4 = v11;
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(+[MSDLogModel sharedInstance](&OBJC_CLASS___MSDLogModel, "sharedInstance"));
  v6 = v5;
  if (v4)
  {
    [v5 logMessage:1 prefix:@"[INF]" message:@"Moving files from data shelter folder..."];

    -[MSDDemoVolumeManager moveStagingToFinal:]( self,  "moveStagingToFinal:",  @"/private/var/mnt/com.apple.mobilestoredemo.storage/com.apple.mobilestoredemo.blob/DataShelter");
  }

  else
  {
    [v5 logMessage:1, @"[INF]", @"%@ is not a folder.", @"/private/var/mnt/com.apple.mobilestoredemo.storage/com.apple.mobilestoredemo.blob/DataShelter" prefix message];
  }

  if ([v3 fileExistsAtPath:@"/private/var/mnt/com.apple.mobilestoredemo.storage/com.apple.mobilestoredemo.blob/DataShelter"])
  {
    id v10 = 0LL;
    unsigned __int8 v7 = [v3 removeItemAtPath:@"/private/var/mnt/com.apple.mobilestoredemo.storage/com.apple.mobilestoredemo.blob/DataShelter" error:&v10];
    id v8 = v10;
    if ((v7 & 1) == 0)
    {
      unsigned __int8 v9 = (void *)objc_claimAutoreleasedReturnValue(+[MSDLogModel sharedInstance](&OBJC_CLASS___MSDLogModel, "sharedInstance"));
      [v9 logMessage:1, @"[INF]", @"Failed to remove data shelter folder with error - %@", v8 prefix message];
    }
  }

  else
  {
LABEL_7:
    id v8 = 0LL;
  }
}

- (id)lookupAPFSVolumeDevByName:(id)a3
{
  id v3 = a3;
  int v4 = v3;
  io_iterator_t existing = 0;
  CFMutableDictionaryRef properties = 0LL;
  if (!v3)
  {
LABEL_31:
    id v10 = 0LL;
    goto LABEL_23;
  }

  id v5 = v3;
  v6 = IOServiceNameMatching((const char *)[v5 UTF8String]);
  uint64_t MatchingServices = IOServiceGetMatchingServices(kIOMasterPortDefault, v6, &existing);
  if ((_DWORD)MatchingServices)
  {
    uint64_t v17 = MatchingServices;
    v18 = (void *)objc_claimAutoreleasedReturnValue(+[MSDLogModel sharedInstance](&OBJC_CLASS___MSDLogModel, "sharedInstance"));
    objc_msgSend( v18,  "logMessage:prefix:message:",  1,  @"[INF]",  @"Failed to scan IO Registry with error - %d",  v17);

    io_object_t v9 = 0;
LABEL_25:
    if (existing) {
      IOObjectRelease(existing);
    }
    if (v9) {
      IOObjectRelease(v9);
    }
    if (properties) {
      CFRelease(properties);
    }
    goto LABEL_31;
  }

  io_object_t v8 = IOIteratorNext(existing);
  if (!v8)
  {
    IOObjectRelease(existing);
    id v10 = 0LL;
LABEL_21:
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[MSDLogModel sharedInstance](&OBJC_CLASS___MSDLogModel, "sharedInstance"));
    [v15 logMessage:1, @"[INF]", @"APFS volume '%@' NOT found.", v5, v19 prefix message];
    goto LABEL_22;
  }

  io_object_t v9 = v8;
  do
  {
    if (IOObjectConformsTo(v9, "AppleAPFSVolume"))
    {
      memset(name, 0, sizeof(name));
      if (IORegistryEntryGetName(v9, name)
        || IORegistryEntryCreateCFProperties(v9, &properties, kCFAllocatorDefault, 0))
      {
        goto LABEL_25;
      }

      if (!strncmp((const char *)[v5 UTF8String], name, 0x80uLL))
      {
        Value = CFDictionaryGetValue(properties, @"BSD Name");
        uint64_t v12 = objc_claimAutoreleasedReturnValue(Value);
        if (!v12) {
          goto LABEL_25;
        }
        v13 = (void *)v12;
        id v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"/dev/%@",  v12));
      }

      else
      {
        id v10 = 0LL;
      }

      CFRelease(properties);
    }

    else
    {
      id v10 = 0LL;
    }

    IOObjectRelease(v9);
    io_object_t v9 = IOIteratorNext(existing);
    if (v9) {
      BOOL v14 = v10 == 0LL;
    }
    else {
      BOOL v14 = 0;
    }
  }

  while (v14);
  IOObjectRelease(existing);
  if (!v10) {
    goto LABEL_21;
  }
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[MSDLogModel sharedInstance](&OBJC_CLASS___MSDLogModel, "sharedInstance"));
  [v15 logMessage:1, @"[INF]", @"APFS volume '%@' found as '%@'.", v5, v10 prefix message];
LABEL_22:

LABEL_23:
  return v10;
}

- (id)findAPFSVolumeMountPoint:(id)a3
{
  id v3 = a3;
  uint64_t v17 = 0LL;
  if (!v3) {
    goto LABEL_16;
  }
  int v4 = getmntinfo_r_np(&v17, 2);
  if (v4 < 1 || (id v5 = v17) == 0LL)
  {
    BOOL v14 = (void *)objc_claimAutoreleasedReturnValue(+[MSDLogModel sharedInstance](&OBJC_CLASS___MSDLogModel, "sharedInstance"));
    v15 = __error();
    objc_msgSend( v14,  "logMessage:prefix:message:",  1,  @"[INF]",  @"Failed to get mounted filesystem info with error - %s",  strerror(*v15));

LABEL_16:
    io_object_t v9 = 0LL;
    goto LABEL_14;
  }

  unint64_t v6 = 0LL;
  uint64_t v7 = 2168LL * v4;
  while (1)
  {
    if (!strncmp("apfs", v5[v6 / 0x878].f_fstypename, 0xFuLL))
    {
      io_object_t v8 = (const char *)[v3 UTF8String];
      id v5 = v17;
      if (!strncmp(v8, v17[v6 / 0x878].f_mntfromname, 0xFuLL)) {
        break;
      }
    }

    v6 += 2168LL;
    if (v7 == v6)
    {
      io_object_t v9 = 0LL;
      goto LABEL_13;
    }
  }

  memset(&v16, 0, sizeof(v16));
  uint64_t v10 = stat(v5[v6 / 0x878].f_mntonname, &v16);
  if ((_DWORD)v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(+[MSDLogModel sharedInstance](&OBJC_CLASS___MSDLogModel, "sharedInstance"));
    objc_msgSend( v12,  "logMessage:prefix:message:",  1,  @"[INF]",  @"Mount point corrupted with error - %d",  v11);

    io_object_t v9 = 0LL;
  }

  else
  {
    io_object_t v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithUTF8String:]( &OBJC_CLASS___NSString,  "stringWithUTF8String:",  v17[v6 / 0x878].f_mntonname));
  }

  id v5 = v17;
LABEL_13:
  free(v5);
LABEL_14:

  return v9;
}

- (BOOL)mountAPFSVolume:(id)a3 atMountPoint:(id)a4 withAttributes:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  uint64_t v10 = 0LL;
  BOOL v11 = 0;
  __int128 v46 = 0u;
  *(_OWORD *)v47 = 0u;
  __int128 v44 = 0u;
  __int128 v45 = 0u;
  __int128 v43 = 0u;
  __int128 v42 = 0u;
  __int128 v41 = 0u;
  __int128 v40 = 0u;
  __int128 v39 = 0u;
  __int128 v38 = 0u;
  __int128 v37 = 0u;
  __int128 v36 = 0u;
  __int128 v35 = 0u;
  __int128 v34 = 0u;
  __int128 v33 = 0u;
  __int128 v32 = 0u;
  __int128 v31 = 0u;
  __int128 v30 = 0u;
  __int128 v29 = 0u;
  __int128 v28 = 0u;
  memset(&v26, 0, sizeof(v26));
  id v12 = 0LL;
  if (v7 && v8)
  {
    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
    id v25 = 0LL;
    unsigned __int8 v13 = [v10 createDirectoryAtPath:v8 withIntermediateDirectories:1 attributes:0 error:&v25];
    id v12 = v25;
    if ((v13 & 1) != 0)
    {
      id v14 = v8;
      uint64_t v15 = stat((const char *)[v14 UTF8String], &v26);
      if ((_DWORD)v15)
      {
        uint64_t v22 = v15;
        v20 = (void *)objc_claimAutoreleasedReturnValue(+[MSDLogModel sharedInstance](&OBJC_CLASS___MSDLogModel, "sharedInstance"));
        objc_msgSend( v20,  "logMessage:prefix:message:",  1,  @"[INF]",  @"Failed to get file stat with error - %d",  v22);
      }

      else
      {
        id v27 = [v7 UTF8String];
        WORD4(v28) = 1;
        *(void *)&v47[12] = *(void *)&v26.st_uid;
        LODWORD(v28) = 0x100000;
        id v16 = v14;
        if (mount("apfs", (const char *)[v16 UTF8String], 0x100000, &v27))
        {
          v20 = (void *)objc_claimAutoreleasedReturnValue(+[MSDLogModel sharedInstance](&OBJC_CLASS___MSDLogModel, "sharedInstance"));
          v23 = __error();
          objc_msgSend( v20,  "logMessage:prefix:message:",  1,  @"[INF]",  @"Failed to mount APFS volume with error - %s",  strerror(*v23));
        }

        else
        {
          if (!v9)
          {
            BOOL v11 = 1;
            goto LABEL_10;
          }

          id v24 = v12;
          unsigned __int8 v17 = [v10 setAttributes:v9 ofItemAtPath:v16 error:&v24];
          id v18 = v24;

          if ((v17 & 1) != 0)
          {
            BOOL v11 = 1;
            id v12 = v18;
            goto LABEL_10;
          }

          v20 = (void *)objc_claimAutoreleasedReturnValue(+[MSDLogModel sharedInstance](&OBJC_CLASS___MSDLogModel, "sharedInstance"));
          [v20 logMessage:1, @"[INF]", @"Failed to set file attributes on mount point - %@", v18 prefix message];
          id v12 = v18;
        }
      }
    }

    else
    {
      v20 = (void *)objc_claimAutoreleasedReturnValue(+[MSDLogModel sharedInstance](&OBJC_CLASS___MSDLogModel, "sharedInstance"));
      v21 = (void *)objc_claimAutoreleasedReturnValue([v12 localizedDescription]);
      [v20 logMessage:1, @"[INF]", @"Failed to create mount point at '%@' -  %@", v8, v21 prefix message];
    }

    BOOL v11 = 0;
  }

- (BOOL)moveStagingToFinal:(id)a3
{
  id v27 = a3;
  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
  if ([v3 fileExistsAtPath:@"/private/var/demo_backup/backup"])
  {
    __int128 v30 = 0u;
    __int128 v31 = 0u;
    __int128 v32 = 0u;
    __int128 v33 = 0u;
    id v4 = (id)objc_claimAutoreleasedReturnValue([v3 enumeratorAtPath:v27]);
    id v5 = [v4 countByEnumeratingWithState:&v30 objects:v34 count:16];
    if (v5)
    {
      id v6 = v5;
      id v24 = 0LL;
      id v25 = v4;
      uint64_t v7 = *(void *)v31;
      stat v26 = v3;
      uint64_t v23 = *(void *)v31;
      while (2)
      {
        for (i = 0LL; i != v6; i = (char *)i + 1)
        {
          if (*(void *)v31 != v7) {
            objc_enumerationMutation(v4);
          }
          uint64_t v9 = *(void *)(*((void *)&v30 + 1) + 8LL * (void)i);
          uint64_t v10 = objc_autoreleasePoolPush();
          BOOL v11 = (void *)objc_claimAutoreleasedReturnValue([v27 stringByAppendingPathComponent:v9]);
          if ([v3 fileExistsAtPath:v11])
          {
            id v12 = (void *)objc_claimAutoreleasedReturnValue( [@"/private/var/demo_backup/backup" stringByAppendingPathComponent:v9]);
            unsigned __int8 v13 = (void *)objc_claimAutoreleasedReturnValue([v12 stringByDeletingLastPathComponent]);
            if (([v3 fileExistsAtPath:v12] & 1) == 0
              && [v3 fileExistsAtPath:v13])
            {
              id v14 = (void *)objc_claimAutoreleasedReturnValue(+[MSDLogModel sharedInstance](&OBJC_CLASS___MSDLogModel, "sharedInstance"));
              [v14 logMessage:1, @"[INF]", @"Moving %@ to %@", v11, v12 prefix message];

              id v29 = v24;
              unsigned int v15 = [v3 moveItemAtPath:v11 toPath:v12 error:&v29];
              id v16 = v29;

              if (!v15)
              {
                v21 = (void *)objc_claimAutoreleasedReturnValue(+[MSDLogModel sharedInstance](&OBJC_CLASS___MSDLogModel, "sharedInstance"));
                uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue([v16 localizedDescription]);
                [v21 logMessage:1, @"[INF]", @"Cannot move %@ to %@ with error - %@", v11, v12, v22 prefix message];

                objc_autoreleasePoolPop(v10);
                BOOL v17 = 0;
                id v18 = v25;
                id v3 = v26;
                id v4 = v25;
                goto LABEL_19;
              }

              id v24 = v16;
              uint64_t v7 = v23;
            }

            id v4 = v25;
            id v3 = v26;
          }

          objc_autoreleasePoolPop(v10);
        }

        id v6 = [v4 countByEnumeratingWithState:&v30 objects:v34 count:16];
        if (v6) {
          continue;
        }
        break;
      }

      BOOL v17 = 1;
      id v18 = v4;
      id v16 = v24;
    }

    else
    {
      id v16 = 0LL;
      BOOL v17 = 1;
      id v18 = v4;
    }

    goto LABEL_19;
  }

  uint64_t v19 = objc_claimAutoreleasedReturnValue(+[MSDLogModel sharedInstance](&OBJC_CLASS___MSDLogModel, "sharedInstance"));
  BOOL v17 = 1;
  [(id)v19 logMessage:1, @"[INF]", @"Moving %@ to %@", v27, @"/private/var/demo_backup/backup" prefix message];

  id v28 = 0LL;
  LOBYTE(v19) = [v3 moveItemAtPath:v27 toPath:@"/private/var/demo_backup/backup" error:&v28];
  id v16 = v28;
  if ((v19 & 1) == 0)
  {
    id v4 = (id)objc_claimAutoreleasedReturnValue(+[MSDLogModel sharedInstance](&OBJC_CLASS___MSDLogModel, "sharedInstance"));
    id v18 = (void *)objc_claimAutoreleasedReturnValue([v16 localizedDescription]);
    [v4 logMessage:1, @"[INF]", @"Could not move %@ to %@ with error - %@", v27, @"/private/var/demo_backup/backup", v18 prefix message];
    BOOL v17 = 0;
LABEL_19:
  }

  return v17;
}

@end