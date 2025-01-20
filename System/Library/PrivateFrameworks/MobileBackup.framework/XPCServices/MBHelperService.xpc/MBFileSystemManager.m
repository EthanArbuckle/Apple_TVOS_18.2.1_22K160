@interface MBFileSystemManager
+ (BOOL)_createSnapshotForVolumeFd:(int)a3 volumeMountPoint:(id)a4 name:(id)a5 error:(id *)a6 cancelationHandler:(id)a7;
+ (BOOL)_mountSnapshotForVolumeFd:(int)a3 volumeMountPoint:(id)a4 name:(id)a5 mountPoint:(id)a6 error:(id *)a7;
+ (BOOL)createSnapshotForVolume:(id)a3 name:(id)a4 error:(id *)a5 cancelationHandler:(id)a6;
+ (BOOL)deleteAllSnapshotsForVolume:(id)a3 withPrefix:(id)a4 error:(id *)a5;
+ (BOOL)deleteAllSnapshotsForVolume:(id)a3 withPrefix:(id)a4 latestCreationDate:(id)a5 error:(id *)a6;
+ (BOOL)deleteSnapshotForVolume:(id)a3 name:(id)a4 error:(id *)a5;
+ (BOOL)mountSnapshotForVolume:(id)a3 name:(id)a4 mountPoint:(id)a5 error:(id *)a6;
+ (BOOL)renameSnapshotForVolume:(id)a3 name:(id)a4 newName:(id)a5 error:(id *)a6;
+ (BOOL)startFilesystemKeyRollingWithPath:(id)a3 error:(id *)a4;
+ (BOOL)stopFilesystemKeyRollingWithPath:(id)a3 error:(id *)a4;
+ (BOOL)unmount:(id)a3 error:(id *)a4;
+ (BOOL)unmountAndDeleteSnapshotForVolume:(id)a3 name:(id)a4 mountPoint:(id)a5 error:(id *)a6;
+ (BOOL)unmountAndRenameSnapshotForVolume:(id)a3 name:(id)a4 mountPoint:(id)a5 newName:(id)a6 error:(id *)a7;
+ (BOOL)volumeSupportsLocalSnapshots:(id)a3;
+ (id)_deleteFileSystemSnapshots:(id)a3 block:(id)a4;
+ (id)createAndMountSnapshotForVolume:(id)a3 name:(id)a4 atFirstAvailableMountPoint:(id)a5 error:(id *)a6 cancelationHandler:(id)a7;
+ (id)fetchAllAPFSVolumeMountPoints;
+ (id)listSnapshotsForVolume:(id)a3 error:(id *)a4;
+ (id)volumeMountPointForFile:(id)a3 error:(id *)a4;
+ (id)volumeUUIDWithVolumeMountPoint:(id)a3 error:(id *)a4;
+ (unint64_t)fileSystemCapacity;
+ (void)removeDeviceTransferDirectoryWithEarliestCreationDate:(id)a3;
+ (void)removeDriveBackupSnapshotsWithLatestCreationDate:(id)a3;
@end

@implementation MBFileSystemManager

+ (BOOL)volumeSupportsLocalSnapshots:(id)a3
{
  id v3 = a3;
  int v4 = open((const char *)[v3 fileSystemRepresentation], 0);
  if (v4 < 0)
  {
    id v14 = MBGetDefaultLog();
    v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      int v16 = *__error();
      *(_DWORD *)v30 = 138412546;
      *(void *)&v30[4] = v3;
      *(_WORD *)&v30[12] = 1024;
      *(_DWORD *)&v30[14] = v16;
      _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_ERROR,  "Unable to open %@: %{errno}d while checking if FS supports snapshot",  v30,  0x12u);
      __error();
      _MBLog( @"ERROR",  (uint64_t)"Unable to open %@: %{errno}d while checking if FS supports snapshot",  v17,  v18,  v19,  v20,  v21,  v22,  (uint64_t)v3);
    }
  }

  else
  {
    int v5 = v4;
    uint64_t v27 = 0LL;
    __int128 v26 = xmmword_100015738;
    int v31 = 0;
    memset(v30, 0, sizeof(v30));
    if (!fgetattrlist(v4, &v26, v30, 0x24uLL, 0))
    {
      unsigned int v24 = *(_DWORD *)&v30[8] & *(_DWORD *)&v30[24];
      close(v5);
      BOOL v23 = (v24 >> 17) & 1;
      goto LABEL_11;
    }

    id v6 = MBGetDefaultLog();
    v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v29 = v3;
      _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_ERROR,  "Couldn't get attr list for filesystem path %@",  buf,  0xCu);
      _MBLog( @"ERROR",  (uint64_t)"Couldn't get attr list for filesystem path %@",  v8,  v9,  v10,  v11,  v12,  v13,  (uint64_t)v3);
    }

    close(v5);
  }

  LOBYTE(v23) = 0;
LABEL_11:

  return v23;
}

+ (unint64_t)fileSystemCapacity
{
  unint64_t v2 = atomic_load(&qword_100022220);
  if (!v2)
  {
    id v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
    id v16 = 0LL;
    int v4 = (void *)objc_claimAutoreleasedReturnValue([v3 attributesOfFileSystemForPath:@"/var/mobile" error:&v16]);
    id v5 = v16;

    if (v4)
    {
      id v6 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:NSFileSystemSize]);
      unint64_t v2 = (unint64_t)[v6 unsignedLongLongValue];

      atomic_store(v2, &qword_100022220);
    }

    else
    {
      id v7 = MBGetDefaultLog();
      uint64_t v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412546;
        uint64_t v18 = @"/var/mobile";
        __int16 v19 = 2112;
        id v20 = v5;
        _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_ERROR,  "Failed to get filesystem capacity at %@: %@",  buf,  0x16u);
        _MBLog( @"ERROR",  (uint64_t)"Failed to get filesystem capacity at %@: %@",  v9,  v10,  v11,  v12,  v13,  v14,  (uint64_t)@"/var/mobile");
      }

      unint64_t v2 = -1LL;
    }
  }

  return v2;
}

+ (BOOL)createSnapshotForVolume:(id)a3 name:(id)a4 error:(id *)a5 cancelationHandler:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  id v13 = v10;
  id v14 = MBGetDefaultLog();
  v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    id v51 = v11;
    __int16 v52 = 2114;
    id v53 = v13;
    _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_DEFAULT,  "Creating filesystem snapshot %{public}@ at %{public}@",  buf,  0x16u);
    _MBLog( @"DEFAULT",  (uint64_t)"Creating filesystem snapshot %{public}@ at %{public}@",  v16,  v17,  v18,  v19,  v20,  v21,  (uint64_t)v11);
  }

  +[NSDate timeIntervalSinceReferenceDate](&OBJC_CLASS___NSDate, "timeIntervalSinceReferenceDate");
  double v23 = v22;
  id v24 = v13;
  uint64_t v25 = open((const char *)[v24 fileSystemRepresentation], 0);
  if ((v25 & 0x80000000) != 0)
  {
    uint64_t v39 = *__error();
    id v40 = MBGetDefaultLog();
    v41 = (os_log_s *)objc_claimAutoreleasedReturnValue(v40);
    if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543618;
      id v51 = v24;
      __int16 v52 = 1024;
      LODWORD(v53) = v39;
      _os_log_impl( (void *)&_mh_execute_header,  v41,  OS_LOG_TYPE_ERROR,  "Failed to open %{public}@: %{errno}d",  buf,  0x12u);
      _MBLog( @"ERROR",  (uint64_t)"Failed to open %{public}@: %{errno}d",  v42,  v43,  v44,  v45,  v46,  v47,  (uint64_t)v24);
    }

    if (a5)
    {
      id v48 = (id)objc_claimAutoreleasedReturnValue( +[MBError errorWithErrno:path:format:]( &OBJC_CLASS___MBError,  "errorWithErrno:path:format:",  v39,  v24,  @"Failed to open snapshot path"));
      BOOL v38 = 0;
      *a5 = v48;
      goto LABEL_13;
    }

+ (BOOL)_createSnapshotForVolumeFd:(int)a3 volumeMountPoint:(id)a4 name:(id)a5 error:(id *)a6 cancelationHandler:(id)a7
{
  id v9 = a4;
  id v10 = a5;
  id v11 = (unsigned int (**)(void))a7;
  id v12 = 0LL;
  int v13 = 0;
  while (1)
  {
    id v14 = objc_autoreleasePoolPush();
    if (v11)
    {
      if (v11[2](v11)) {
        break;
      }
    }

    id v15 = v10;
    int v16 = fs_snapshot_create(a3, (const char *)[v15 fileSystemRepresentation], 0);
    BOOL v17 = v16 == 0;
    if (!v16) {
      goto LABEL_12;
    }
    uint64_t v18 = *__error();
    uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue( +[MBError errorWithErrno:path:format:]( &OBJC_CLASS___MBError,  "errorWithErrno:path:format:",  v18,  v9,  @"Failed to create snapshot: %d",  v18));

    id v20 = MBGetDefaultLog();
    uint64_t v21 = (os_log_s *)objc_claimAutoreleasedReturnValue(v20);
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138544130;
      id v42 = v10;
      __int16 v43 = 2114;
      id v44 = v9;
      __int16 v45 = 1024;
      int v46 = v13;
      __int16 v47 = 1024;
      int v48 = v18;
      _os_log_impl( (void *)&_mh_execute_header,  v21,  OS_LOG_TYPE_ERROR,  "Failed to create filesystem snapshot %{public}@ at %{public}@ (%d): %{errno}d",  buf,  0x22u);
      _MBLog( @"ERROR",  (uint64_t)"Failed to create filesystem snapshot %{public}@ at %{public}@ (%d): %{errno}d",  v22,  v23,  v24,  v25,  v26,  v27,  (uint64_t)v15);
    }

    if ((_DWORD)v18 != 36)
    {
      id v12 = v19;
LABEL_12:
      double v28 = a6;
      goto LABEL_16;
    }

    sleep(0xAu);
    objc_autoreleasePoolPop(v14);
    ++v13;
    id v12 = v19;
    if (v13 == 30)
    {
      BOOL v17 = 0;
      double v28 = a6;
      if (!a6) {
        goto LABEL_18;
      }
      goto LABEL_17;
    }
  }

  id v29 = MBGetDefaultLog();
  id v30 = (os_log_s *)objc_claimAutoreleasedReturnValue(v29);
  double v28 = a6;
  if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138543618;
    id v42 = v10;
    __int16 v43 = 2114;
    id v44 = v9;
    _os_log_impl( (void *)&_mh_execute_header,  v30,  OS_LOG_TYPE_ERROR,  "Failed to create filesystem snapshot %{public}@ at %{public}@ (canceled)",  buf,  0x16u);
    _MBLog( @"ERROR",  (uint64_t)"Failed to create filesystem snapshot %{public}@ at %{public}@ (canceled)",  v31,  v32,  v33,  v34,  v35,  v36,  (uint64_t)v10);
  }

  uint64_t v37 = objc_claimAutoreleasedReturnValue( +[MBError errorWithCode:format:]( &OBJC_CLASS___MBError,  "errorWithCode:format:",  202LL,  @"Failed to create snapshot"));
  BOOL v17 = 0;
  id v12 = (void *)v37;
LABEL_16:
  objc_autoreleasePoolPop(v14);
  uint64_t v19 = v12;
  if (!v28) {
    goto LABEL_18;
  }
LABEL_17:
  *double v28 = v19;
LABEL_18:

  return v17;
}

+ (BOOL)mountSnapshotForVolume:(id)a3 name:(id)a4 mountPoint:(id)a5 error:(id *)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  if (!v12)
  {
    if (a6)
    {
      BOOL v17 = (void *)objc_claimAutoreleasedReturnValue( +[MBError errorWithCode:description:]( &OBJC_CLASS___MBError,  "errorWithCode:description:",  5LL,  @"No mountpoint specified at which to mount the snapshot"));
LABEL_10:
      unsigned __int8 v16 = 0;
      *a6 = v17;
      goto LABEL_12;
    }

+ (id)createAndMountSnapshotForVolume:(id)a3 name:(id)a4 atFirstAvailableMountPoint:(id)a5 error:(id *)a6 cancelationHandler:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a7;
  if (![v14 count]) {
    sub_100011940();
  }
  id v16 = v12;
  uint64_t v17 = open((const char *)[v16 fileSystemRepresentation], 0x100000);
  if ((v17 & 0x80000000) != 0)
  {
    uint64_t v38 = *__error();
    id v39 = MBGetDefaultLog();
    id v40 = (os_log_s *)objc_claimAutoreleasedReturnValue(v39);
    if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      uint64_t v69 = (uint64_t)v16;
      __int16 v70 = 1024;
      LODWORD(v71) = v38;
      _os_log_impl((void *)&_mh_execute_header, v40, OS_LOG_TYPE_ERROR, "Unable to open %@: %{errno}d", buf, 0x12u);
      _MBLog(@"ERROR", (uint64_t)"Unable to open %@: %{errno}d", v41, v42, v43, v44, v45, v46, (uint64_t)v16);
    }

    if (a6)
    {
      id v47 = (id)objc_claimAutoreleasedReturnValue( +[MBError errorWithErrno:path:format:]( &OBJC_CLASS___MBError,  "errorWithErrno:path:format:",  v38,  v16,  @"Unable to open snapshot path"));
      id v37 = 0LL;
      *a6 = v47;
    }

    else
    {
      id v37 = 0LL;
    }

    goto LABEL_34;
  }

  int v18 = v17;
  if (![(id)objc_opt_class(a1) _createSnapshotForVolumeFd:v17 volumeMountPoint:v16 name:v13 error:a6 cancelationHandler:v15])
  {
    id v37 = 0LL;
    goto LABEL_32;
  }

  id v62 = v15;
  id v19 = v13;
  v59 = (char *)[v19 fileSystemRepresentation];
  __int128 v64 = 0u;
  __int128 v65 = 0u;
  __int128 v66 = 0u;
  __int128 v67 = 0u;
  id obj = v14;
  id v20 = [obj countByEnumeratingWithState:&v64 objects:v74 count:16];
  if (!v20) {
    goto LABEL_15;
  }
  id v21 = v20;
  uint64_t v22 = *(void *)v65;
  id v60 = v14;
  id v61 = v13;
  uint64_t v58 = (uint64_t)v19;
  while (2)
  {
    for (i = 0LL; i != v21; i = (char *)i + 1)
    {
      if (*(void *)v65 != v22) {
        objc_enumerationMutation(obj);
      }
      id v24 = *(id *)(*((void *)&v64 + 1) + 8LL * (void)i);
      uint64_t v25 = (const char *)[v24 fileSystemRepresentation];
      id v26 = [(id)objc_opt_class(a1) volumeMountPointForFile:v24 error:a6];
      uint64_t v27 = (void *)objc_claimAutoreleasedReturnValue(v26);
      double v28 = v27;
      if (!v16)
      {
        id v37 = 0LL;
        id v13 = v61;
LABEL_31:
        id v15 = v62;

        id v14 = v60;
        goto LABEL_32;
      }

      if (![v27 isEqualToString:v24])
      {
        id v13 = v61;
        if (fs_snapshot_mount(v18, v25, v59, 0))
        {
          uint64_t v48 = *__error();
          id v49 = MBGetDefaultLog();
          v50 = (os_log_s *)objc_claimAutoreleasedReturnValue(v49);
          if (os_log_type_enabled(v50, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412802;
            uint64_t v69 = v58;
            __int16 v70 = 2080;
            v71 = v25;
            __int16 v72 = 1024;
            int v73 = v48;
            _os_log_impl( (void *)&_mh_execute_header,  v50,  OS_LOG_TYPE_ERROR,  "Unable to mount snapshot %@ at mount point %s: %{errno}d",  buf,  0x1Cu);
            _MBLog( @"ERROR",  (uint64_t)"Unable to mount snapshot %@ at mount point %s: %{errno}d",  v51,  v52,  v53,  v54,  v55,  v56,  v58);
          }

          id v37 = 0LL;
          if (a6) {
            *a6 = (id)objc_claimAutoreleasedReturnValue( +[MBError errorWithErrno:path:format:]( &OBJC_CLASS___MBError,  "errorWithErrno:path:format:",  v48,  v24,  @"Unable to mount snapshot"));
          }
        }

        else
        {
          id v37 = v24;
        }

        goto LABEL_31;
      }

      id v29 = MBGetDefaultLog();
      __int16 v30 = (os_log_s *)objc_claimAutoreleasedReturnValue(v29);
      if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        uint64_t v69 = (uint64_t)v28;
        _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_INFO, "Mount point %@ is already in use", buf, 0xCu);
        _MBLog(@"INFO", (uint64_t)"Mount point %@ is already in use", v31, v32, v33, v34, v35, v36, (uint64_t)v28);
      }
    }

    id v21 = [obj countByEnumeratingWithState:&v64 objects:v74 count:16];
    id v14 = v60;
    id v13 = v61;
    id v19 = (id)v58;
    if (v21) {
      continue;
    }
    break;
  }

+ (BOOL)_mountSnapshotForVolumeFd:(int)a3 volumeMountPoint:(id)a4 name:(id)a5 mountPoint:(id)a6 error:(id *)a7
{
  id v10 = a5;
  id v11 = a6;
  realpath_DARWIN_EXTSN((const char *)[v11 fileSystemRepresentation], v30);
  id v12 = v10;
  int v13 = fs_snapshot_mount(a3, v30, (const char *)[v12 fileSystemRepresentation], 0);
  if (v13)
  {
    uint64_t v14 = *__error();
    id v15 = MBGetDefaultLog();
    id v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(v15);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412802;
      id v25 = v12;
      __int16 v26 = 2080;
      uint64_t v27 = v30;
      __int16 v28 = 1024;
      int v29 = v14;
      _os_log_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_ERROR,  "Unable to mount snapshot %@ at mount point %s: %{errno}d",  buf,  0x1Cu);
      _MBLog( @"ERROR",  (uint64_t)"Unable to mount snapshot %@ at mount point %s: %{errno}d",  v17,  v18,  v19,  v20,  v21,  v22,  (uint64_t)v12);
    }

    if (a7) {
      *a7 = (id)objc_claimAutoreleasedReturnValue( +[MBError errorWithErrno:path:format:]( &OBJC_CLASS___MBError,  "errorWithErrno:path:format:",  v14,  v11,  @"Unable to mount snapshot"));
    }
  }

  return v13 == 0;
}

+ (BOOL)unmount:(id)a3 error:(id *)a4
{
  id v5 = a3;
  id v6 = v5;
  if (!v5)
  {
    if (a4)
    {
      uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue( +[MBError errorWithCode:description:]( &OBJC_CLASS___MBError,  "errorWithCode:description:",  5LL,  @"No mountpoint specified from which to unmount the current snapshot"));
      goto LABEL_17;
    }

+ (BOOL)deleteSnapshotForVolume:(id)a3 name:(id)a4 error:(id *)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = v7;
  int v10 = open((const char *)[v9 fileSystemRepresentation], 0);
  if (v10 < 0)
  {
    uint64_t v24 = *__error();
    id v25 = MBGetDefaultLog();
    uint64_t v26 = (os_log_s *)objc_claimAutoreleasedReturnValue(v25);
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543618;
      id v50 = v9;
      __int16 v51 = 1024;
      LODWORD(v52) = v24;
      _os_log_impl( (void *)&_mh_execute_header,  v26,  OS_LOG_TYPE_ERROR,  "Failed to open %{public}@: %{errno}d",  buf,  0x12u);
      _MBLog(@"ERROR", (uint64_t)"Failed to open %{public}@: %{errno}d", v27, v28, v29, v30, v31, v32, (uint64_t)v9);
    }

    uint64_t v33 = (void *)objc_claimAutoreleasedReturnValue( +[MBError errorWithErrno:path:format:]( &OBJC_CLASS___MBError,  "errorWithErrno:path:format:",  v24,  v9,  @"Unable to open snapshot path"));
    if (a5) {
      goto LABEL_19;
    }
  }

  else
  {
    int v11 = v10;
    id v12 = v8;
    if (fs_snapshot_delete(v11, (const char *)[v12 fileSystemRepresentation], 0))
    {
      uint64_t v13 = *__error();
      id v14 = MBGetDefaultLog();
      uint64_t v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
      uint64_t v16 = v15;
      if ((_DWORD)v13 == 2)
      {
        if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543618;
          id v50 = v12;
          __int16 v51 = 2114;
          id v52 = v9;
          _os_log_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_DEFAULT,  "Snapshot %{public}@ not found at %{public}@",  buf,  0x16u);
          _MBLog( @"DEFAULT",  (uint64_t)"Snapshot %{public}@ not found at %{public}@",  v17,  v18,  v19,  v20,  v21,  v22,  (uint64_t)v12);
        }

        uint64_t v23 = objc_claimAutoreleasedReturnValue( +[MBError errorWithCode:path:format:]( &OBJC_CLASS___MBError,  "errorWithCode:path:format:",  4LL,  v9,  @"Snapshot not found"));
      }

      else
      {
        if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138543874;
          id v50 = v12;
          __int16 v51 = 2114;
          id v52 = v9;
          __int16 v53 = 1024;
          int v54 = v13;
          _os_log_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_ERROR,  "Failed to delete snapshot %{public}@ at %{public}@: %{errno}d",  buf,  0x1Cu);
          _MBLog( @"ERROR",  (uint64_t)"Failed to delete snapshot %{public}@ at %{public}@: %{errno}d",  v42,  v43,  v44,  v45,  v46,  v47,  (uint64_t)v12);
        }

        uint64_t v23 = objc_claimAutoreleasedReturnValue( +[MBError errorWithErrno:path:format:]( &OBJC_CLASS___MBError,  "errorWithErrno:path:format:",  v13,  v9,  @"Unable to delete snapshot"));
      }

      uint64_t v33 = (void *)v23;
    }

    else
    {
      id v34 = MBGetDefaultLog();
      uint64_t v35 = (os_log_s *)objc_claimAutoreleasedReturnValue(v34);
      if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543618;
        id v50 = v12;
        __int16 v51 = 2114;
        id v52 = v9;
        _os_log_impl( (void *)&_mh_execute_header,  v35,  OS_LOG_TYPE_DEFAULT,  "Deleted snapshot %{public}@ at %{public}@",  buf,  0x16u);
        _MBLog( @"DEFAULT",  (uint64_t)"Deleted snapshot %{public}@ at %{public}@",  v36,  v37,  v38,  v39,  v40,  v41,  (uint64_t)v12);
      }

      uint64_t v33 = 0LL;
    }

    close(v11);
    if (a5)
    {
LABEL_19:
      if (v33) {
        *a5 = v33;
      }
    }
  }

  return v33 == 0LL;
}

+ (BOOL)renameSnapshotForVolume:(id)a3 name:(id)a4 newName:(id)a5 error:(id *)a6
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = v9;
  int v13 = open((const char *)[v12 fileSystemRepresentation], 0x100000);
  if (v13 < 0)
  {
    uint64_t v28 = *__error();
    id v29 = MBGetDefaultLog();
    uint64_t v30 = (os_log_s *)objc_claimAutoreleasedReturnValue(v29);
    if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      id v41 = v12;
      __int16 v42 = 1024;
      LODWORD(v43) = v28;
      _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_ERROR, "Unable to open %@: %{errno}d", buf, 0x12u);
      _MBLog(@"ERROR", (uint64_t)"Unable to open %@: %{errno}d", v31, v32, v33, v34, v35, v36, (uint64_t)v12);
    }

    if (a6)
    {
      id v37 = (id)objc_claimAutoreleasedReturnValue( +[MBError errorWithErrno:path:format:]( &OBJC_CLASS___MBError,  "errorWithErrno:path:format:",  v28,  v12,  @"Unable to open snapshot path"));
      BOOL v38 = 0;
      *a6 = v37;
    }

    else
    {
      BOOL v38 = 0;
    }
  }

  else
  {
    int v14 = v13;
    id v15 = v10;
    uint64_t v16 = (const char *)[v15 fileSystemRepresentation];
    id v17 = v11;
    if (fs_snapshot_rename(v14, v16, (const char *)[v17 fileSystemRepresentation], 0))
    {
      uint64_t v18 = *__error();
      id v19 = MBGetDefaultLog();
      uint64_t v20 = (os_log_s *)objc_claimAutoreleasedReturnValue(v19);
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412802;
        id v41 = v15;
        __int16 v42 = 2112;
        id v43 = v17;
        __int16 v44 = 1024;
        int v45 = v18;
        _os_log_impl( (void *)&_mh_execute_header,  v20,  OS_LOG_TYPE_ERROR,  "Unable to rename snapshot: %@ -> %@: %{errno}d",  buf,  0x1Cu);
        _MBLog( @"ERROR",  (uint64_t)"Unable to rename snapshot: %@ -> %@: %{errno}d",  v21,  v22,  v23,  v24,  v25,  v26,  (uint64_t)v15);
      }

      uint64_t v27 = (void *)objc_claimAutoreleasedReturnValue( +[MBError errorWithErrno:path:format:]( &OBJC_CLASS___MBError,  "errorWithErrno:path:format:",  v18,  v12,  @"Unable to rename snapshot"));
    }

    else
    {
      uint64_t v27 = 0LL;
    }

    close(v14);
    BOOL v38 = v27 == 0LL;
    if (a6 && v27) {
      *a6 = v27;
    }
  }

  return v38;
}

+ (BOOL)unmountAndDeleteSnapshotForVolume:(id)a3 name:(id)a4 mountPoint:(id)a5 error:(id *)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v17 = 0LL;
  unsigned __int8 v13 = [(id)objc_opt_class(a1) unmount:v12 error:&v17];

  id v14 = v17;
  if ((v13 & 1) != 0) {
    goto LABEL_4;
  }
  if (+[MBError isError:withCode:](&OBJC_CLASS___MBError, "isError:withCode:", v14, 4LL))
  {

    id v14 = 0LL;
LABEL_4:
    unsigned __int8 v15 = [(id)objc_opt_class(a1) deleteSnapshotForVolume:v10 name:v11 error:a6];
    goto LABEL_5;
  }

  if (a6)
  {
    id v14 = v14;
    unsigned __int8 v15 = 0;
    *a6 = v14;
  }

  else
  {
    unsigned __int8 v15 = 0;
  }

+ (BOOL)unmountAndRenameSnapshotForVolume:(id)a3 name:(id)a4 mountPoint:(id)a5 newName:(id)a6 error:(id *)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a6;
  id v15 = a5;
  unsigned int v16 = [(id)objc_opt_class(a1) unmount:v15 error:a7];

  if (v16) {
    unsigned __int8 v17 = [(id)objc_opt_class(a1) renameSnapshotForVolume:v12 name:v13 newName:v14 error:a7];
  }
  else {
    unsigned __int8 v17 = 0;
  }

  return v17;
}

+ (id)_deleteFileSystemSnapshots:(id)a3 block:(id)a4
{
  id v6 = a3;
  id v7 = (uint64_t (**)(id, void *))a4;
  id v47 = a1;
  id v55 = 0LL;
  uint64_t v48 = v6;
  id v8 = [(id)objc_opt_class(a1) listSnapshotsForVolume:v6 error:&v55];
  id v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
  id v10 = v55;
  id v11 = v10;
  if (!v9)
  {
    id v11 = v10;
    uint64_t v36 = v11;
    goto LABEL_24;
  }

  if ([v9 count])
  {
    __int128 v53 = 0u;
    __int128 v54 = 0u;
    __int128 v51 = 0u;
    __int128 v52 = 0u;
    uint64_t v46 = v9;
    id obj = v9;
    id v12 = [obj countByEnumeratingWithState:&v51 objects:v56 count:16];
    if (!v12) {
      goto LABEL_19;
    }
    id v13 = v12;
    uint64_t v14 = *(void *)v52;
    while (1)
    {
      for (i = 0LL; i != v13; i = (char *)i + 1)
      {
        if (*(void *)v52 != v14) {
          objc_enumerationMutation(obj);
        }
        unsigned int v16 = *(void **)(*((void *)&v51 + 1) + 8LL * (void)i);
        unsigned __int8 v17 = objc_autoreleasePoolPush();
        if ((v7[2](v7, v16) & 1) == 0)
        {
          id v29 = MBGetDefaultLog();
          uint64_t v22 = (os_log_s *)objc_claimAutoreleasedReturnValue(v29);
          if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138543362;
            id v58 = v16;
            _os_log_impl( (void *)&_mh_execute_header,  v22,  OS_LOG_TYPE_DEBUG,  "Ignoring snapshot: %{public}@",  buf,  0xCu);
            _MBLog(@"DEBUG", (uint64_t)"Ignoring snapshot: %{public}@", v30, v31, v32, v33, v34, v35, (uint64_t)v16);
          }

          goto LABEL_15;
        }

        uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue([v16 name]);
        id v50 = v11;
        unsigned int v19 = [v47 deleteSnapshotForVolume:v48 name:v18 error:&v50];
        id v20 = v50;

        if (v19)
        {
          id v21 = MBGetDefaultLog();
          uint64_t v22 = (os_log_s *)objc_claimAutoreleasedReturnValue(v21);
          if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138543362;
            id v58 = v16;
            _os_log_impl( (void *)&_mh_execute_header,  v22,  OS_LOG_TYPE_DEFAULT,  "Deleted snapshot: %{public}@",  buf,  0xCu);
            _MBLog( @"DEFAULT",  (uint64_t)"Deleted snapshot: %{public}@",  v23,  v24,  v25,  v26,  v27,  v28,  (uint64_t)v16);
          }

          id v11 = v20;
LABEL_15:

          goto LABEL_17;
        }

        id v11 = v20;
LABEL_17:
        objc_autoreleasePoolPop(v17);
      }

      id v13 = [obj countByEnumeratingWithState:&v51 objects:v56 count:16];
      if (!v13)
      {
LABEL_19:

        uint64_t v36 = 0LL;
        id v9 = v46;
        goto LABEL_24;
      }
    }
  }

  id v37 = MBGetDefaultLog();
  BOOL v38 = (os_log_s *)objc_claimAutoreleasedReturnValue(v37);
  if (os_log_type_enabled(v38, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138543362;
    id v58 = v6;
    _os_log_impl((void *)&_mh_execute_header, v38, OS_LOG_TYPE_INFO, "No snapshots to delete for %{public}@", buf, 0xCu);
    _MBLog(@"INFO", (uint64_t)"No snapshots to delete for %{public}@", v39, v40, v41, v42, v43, v44, (uint64_t)v6);
  }

  uint64_t v36 = 0LL;
LABEL_24:

  return v36;
}

+ (BOOL)deleteAllSnapshotsForVolume:(id)a3 withPrefix:(id)a4 error:(id *)a5
{
  id v8 = a4;
  id v9 = a3;
  id v10 = (void *)objc_opt_class(a1);
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472LL;
  v14[2] = sub_100005C50;
  v14[3] = &unk_10001C678;
  id v15 = v8;
  id v11 = v8;
  id v12 = (void *)objc_claimAutoreleasedReturnValue([v10 _deleteFileSystemSnapshots:v9 block:v14]);

  if (a5 && v12) {
    *a5 = v12;
  }

  return v12 == 0LL;
}

+ (BOOL)deleteAllSnapshotsForVolume:(id)a3 withPrefix:(id)a4 latestCreationDate:(id)a5 error:(id *)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  if (!v12) {
    sub_100011968();
  }
  id v13 = v12;
  uint64_t v14 = (void *)objc_opt_class(a1);
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472LL;
  v20[2] = sub_100005D94;
  v20[3] = &unk_10001C6A0;
  id v21 = v13;
  id v22 = v11;
  id v15 = v11;
  id v16 = v13;
  unsigned __int8 v17 = (void *)objc_claimAutoreleasedReturnValue([v14 _deleteFileSystemSnapshots:v10 block:v20]);
  uint64_t v18 = v17;
  if (a6 && v17) {
    *a6 = v17;
  }

  return v18 == 0LL;
}

+ (void)removeDriveBackupSnapshotsWithLatestCreationDate:(id)a3
{
  id v60 = a3;
  uint64_t v3 = objc_claimAutoreleasedReturnValue( +[NSURL fileURLWithPath:isDirectory:]( &OBJC_CLASS___NSURL,  "fileURLWithPath:isDirectory:",  @"/var/mobile/Library/Caches/Backup",  1LL));
  NSURLResourceKey v4 = NSURLIsDirectoryKey;
  v79[0] = NSURLIsDirectoryKey;
  v79[1] = NSURLCreationDateKey;
  id v61 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
  id v58 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v79, 2LL));
  v59 = (void *)v3;
  __int128 v70 = 0u;
  __int128 v71 = 0u;
  __int128 v72 = 0u;
  __int128 v73 = 0u;
  id v5 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v61, "enumeratorAtURL:includingPropertiesForKeys:options:errorHandler:", v3));
  id v64 = [v5 countByEnumeratingWithState:&v70 objects:v78 count:16];
  if (v64)
  {
    uint64_t v63 = *(void *)v71;
    id v62 = v5;
    do
    {
      id v6 = 0LL;
      do
      {
        if (*(void *)v71 != v63) {
          objc_enumerationMutation(v5);
        }
        id v7 = *(void **)(*((void *)&v70 + 1) + 8LL * (void)v6);
        id v8 = objc_autoreleasePoolPush();
        id v9 = objc_alloc(&OBJC_CLASS___NSUUID);
        id v10 = (void *)objc_claimAutoreleasedReturnValue([v7 lastPathComponent]);
        id v11 = -[NSUUID initWithUUIDString:](v9, "initWithUUIDString:", v10);

        if (v11)
        {
          id v68 = 0LL;
          id v69 = 0LL;
          unsigned __int8 v12 = [v7 getResourceValue:&v69 forKey:v4 error:&v68];
          id v13 = v69;
          id v14 = v68;
          if ((v12 & 1) != 0)
          {
            if ([v13 BOOLValue])
            {
              id v66 = 0LL;
              id v67 = 0LL;
              unsigned __int8 v15 = [v7 getResourceValue:&v67 forKey:NSURLCreationDateKey error:&v66];
              id v16 = v67;
              id v17 = v66;

              if ((v15 & 1) != 0)
              {
                if (v16 && [v60 compare:v16] == (id)-1)
                {
                  id v49 = MBGetDefaultLog();
                  id v22 = (os_log_s *)objc_claimAutoreleasedReturnValue(v49);
                  if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
                  {
                    [v16 timeIntervalSince1970];
                    *(_DWORD *)buf = 138412546;
                    v75 = v7;
                    __int16 v76 = 2048;
                    id v77 = v50;
                    _os_log_impl( (void *)&_mh_execute_header,  v22,  OS_LOG_TYPE_INFO,  "Ignoring %@ since it was created at %.3f",  buf,  0x16u);
                    [v16 timeIntervalSince1970];
                    _MBLog( @"INFO",  (uint64_t)"Ignoring %@ since it was created at %.3f",  v51,  v52,  v53,  v54,  v55,  v56,  (uint64_t)v7);
                  }
                }

                else
                {
                  id v65 = v17;
                  unsigned int v18 = [v61 removeItemAtURL:v7 error:&v65];
                  id v19 = v65;

                  id v20 = MBGetDefaultLog();
                  id v21 = (os_log_s *)objc_claimAutoreleasedReturnValue(v20);
                  id v22 = v21;
                  if (v18)
                  {
                    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
                    {
                      *(_DWORD *)buf = 138412290;
                      v75 = v7;
                      _os_log_impl( (void *)&_mh_execute_header,  v22,  OS_LOG_TYPE_DEFAULT,  "Removed drive backup snapshot directory: %@",  buf,  0xCu);
                      _MBLog( @"DEFAULT",  (uint64_t)"Removed drive backup snapshot directory: %@",  v23,  v24,  v25,  v26,  v27,  v28,  (uint64_t)v7);
                    }
                  }

                  else if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
                  {
                    *(_DWORD *)buf = 138412546;
                    v75 = v7;
                    __int16 v76 = 2112;
                    id v77 = v19;
                    _os_log_impl( (void *)&_mh_execute_header,  v22,  OS_LOG_TYPE_ERROR,  "Failed to remove drive backup snapshot directory %@: %@",  buf,  0x16u);
                    _MBLog( @"ERROR",  (uint64_t)"Failed to remove drive backup snapshot directory %@: %@",  v43,  v44,  v45,  v46,  v47,  v48,  (uint64_t)v7);
                  }

                  id v17 = v19;
                  NSURLResourceKey v4 = NSURLIsDirectoryKey;
                }
              }

              else
              {
                id v36 = MBGetDefaultLog();
                id v22 = (os_log_s *)objc_claimAutoreleasedReturnValue(v36);
                if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
                {
                  *(_DWORD *)buf = 138412546;
                  v75 = v7;
                  __int16 v76 = 2112;
                  id v77 = v17;
                  _os_log_impl( (void *)&_mh_execute_header,  v22,  OS_LOG_TYPE_ERROR,  "Failed to get NSURLCreationDateKey for %@: %@",  buf,  0x16u);
                  _MBLog( @"ERROR",  (uint64_t)"Failed to get NSURLCreationDateKey for %@: %@",  v37,  v38,  v39,  v40,  v41,  v42,  (uint64_t)v7);
                }
              }

              id v5 = v62;

              id v14 = v17;
              goto LABEL_24;
            }
          }

          else
          {
            id v29 = MBGetDefaultLog();
            id v16 = (id)objc_claimAutoreleasedReturnValue(v29);
            if (os_log_type_enabled((os_log_t)v16, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138412546;
              v75 = v7;
              __int16 v76 = 2112;
              id v77 = v14;
              _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)v16,  OS_LOG_TYPE_ERROR,  "Failed to get NSURLIsDirectoryKey for %@: %@",  buf,  0x16u);
              _MBLog( @"ERROR",  (uint64_t)"Failed to get NSURLIsDirectoryKey for %@: %@",  v30,  v31,  v32,  v33,  v34,  v35,  (uint64_t)v7);
            }

+ (id)listSnapshotsForVolume:(id)a3 error:(id *)a4
{
  id v4 = a3;
  id v5 = MBGetDefaultLog();
  id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138543362;
    id v90 = v4;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEBUG, "Listing all snapshots at %{public}@", buf, 0xCu);
    _MBLog(@"DEBUG", (uint64_t)"Listing all snapshots at %{public}@", v7, v8, v9, v10, v11, v12, (uint64_t)v4);
  }

  id v84 = v4;
  int v83 = open((const char *)[v84 fileSystemRepresentation], 0);
  if (v83 == -1)
  {
    uint64_t v53 = *__error();
    id v54 = MBGetDefaultLog();
    uint64_t v55 = (os_log_s *)objc_claimAutoreleasedReturnValue(v54);
    if (os_log_type_enabled(v55, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543618;
      id v90 = v84;
      __int16 v91 = 1024;
      LODWORD(v92) = v53;
      _os_log_impl( (void *)&_mh_execute_header,  v55,  OS_LOG_TYPE_ERROR,  "Failed to open %{public}@: %{errno}d",  buf,  0x12u);
      _MBLog( @"ERROR",  (uint64_t)"Failed to open %{public}@: %{errno}d",  v56,  v57,  v58,  v59,  v60,  v61,  (uint64_t)v84);
    }

    if (a4)
    {
      id v62 = (id)objc_claimAutoreleasedReturnValue( +[MBError errorWithErrno:path:format:]( &OBJC_CLASS___MBError,  "errorWithErrno:path:format:",  v53,  v84,  @"Unable to open snapshot path"));
      uint64_t v63 = 0LL;
      *a4 = v62;
    }

    else
    {
      uint64_t v63 = 0LL;
    }

    goto LABEL_49;
  }

  id v13 = objc_opt_new(&OBJC_CLASS___NSMutableArray);
LABEL_5:
  *(_OWORD *)&v87.bitmapcount = xmmword_100015750;
  *(void *)&v87.fileattr = 0LL;
  int v14 = fs_snapshot_list(v83, &v87, buf, 0x400uLL, 0);
  if ((v14 & 0x80000000) == 0)
  {
    if (!v14)
    {
      uint64_t v52 = 0LL;
      goto LABEL_41;
    }

    int v86 = v14;
    v85 = 0LL;
    uint64_t v15 = 0LL;
    int v16 = 1;
    while (1)
    {
      id v17 = &buf[v15];
      uint64_t v18 = v15 + 24;
      uint64_t v20 = *(unsigned int *)&buf[v15];
      int v19 = *(_DWORD *)&buf[v15 + 4];
      if ((v19 & 0x20000000) == 0) {
        goto LABEL_14;
      }
      uint64_t v21 = *(unsigned int *)&buf[v18];
      if (!(_DWORD)v21) {
        break;
      }
      id v22 = MBGetDefaultLog();
      uint64_t v23 = (os_log_s *)objc_claimAutoreleasedReturnValue(v22);
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)v88 = 67109120;
        *(_DWORD *)&v88[4] = v21;
        _os_log_impl( (void *)&_mh_execute_header,  v23,  OS_LOG_TYPE_ERROR,  "Failed to read attributes for directory entry: %{errno}d\n",  v88,  8u);
        _MBLog( @"ERROR",  (uint64_t)"Failed to read attributes for directory entry: %{errno}d\n",  v24,  v25,  v26,  v27,  v28,  v29,  v21);
      }

      uint64_t v30 = objc_claimAutoreleasedReturnValue( +[MBError errorWithErrno:path:format:]( &OBJC_CLASS___MBError,  "errorWithErrno:path:format:",  v21,  v84,  @"Failed to read snapshot attributes"));
      uint64_t v31 = 0LL;
      uint64_t v32 = 0LL;
      uint64_t v33 = 0LL;
      int v34 = 0;
      v85 = (void *)v30;
LABEL_29:

      if (v34)
      {
        v15 += v20;
        if (v16++ < v86) {
          continue;
        }
      }

      uint64_t v52 = v85;
      if (v85) {
        goto LABEL_41;
      }
      goto LABEL_5;
    }

    uint64_t v18 = v15 + 28;
LABEL_14:
    if ((v19 & 1) != 0 && (uint64_t v35 = &buf[v18], v18 += 8LL, (v36 = *((_DWORD *)v35 + 1)) != 0))
    {
      uint64_t v37 = &v35[*(int *)v35];
      uint64_t v38 = (v36 - 1);
      uint64_t v33 = -[NSString initWithBytes:length:encoding:]( objc_alloc(&OBJC_CLASS___NSString),  "initWithBytes:length:encoding:",  v37,  v38,  4LL);
      int v19 = *((_DWORD *)v17 + 1);
      if ((v19 & 0x200) != 0)
      {
LABEL_18:
        uint64_t v39 = (uint64_t *)&buf[v18];
        v18 += 16LL;
        uint64_t v31 = -[NSDate initWithTimeIntervalSinceReferenceDate:]( objc_alloc(&OBJC_CLASS___NSDate),  "initWithTimeIntervalSinceReferenceDate:",  (double)*v39 - kCFAbsoluteTimeIntervalSince1970 + (double)v39[1] * 0.000000001);
        if ((*((_DWORD *)v17 + 1) & 0x800000) != 0) {
          goto LABEL_19;
        }
        goto LABEL_23;
      }
    }

    else
    {
      uint64_t v33 = 0LL;
      if ((v19 & 0x200) != 0) {
        goto LABEL_18;
      }
    }

    uint64_t v31 = 0LL;
    if ((v19 & 0x800000) != 0)
    {
LABEL_19:
      *(_OWORD *)v88 = *(_OWORD *)&buf[v18];
      v18 += 16LL;
      uint64_t v40 = -[NSUUID initWithUUIDBytes:](objc_alloc(&OBJC_CLASS___NSUUID), "initWithUUIDBytes:", v88);
      uint64_t v32 = (void *)objc_claimAutoreleasedReturnValue(-[NSUUID UUIDString](v40, "UUIDString"));

      if (!v33) {
        goto LABEL_27;
      }
      goto LABEL_24;
    }

+ (id)volumeMountPointForFile:(id)a3 error:(id *)a4
{
  id v5 = a3;
  if (statfs((const char *)[v5 fileSystemRepresentation], &v9))
  {
    id v6 = __error();
    uint64_t v7 = 0LL;
    if (a4) {
      *a4 = (id)objc_claimAutoreleasedReturnValue( +[MBError errorWithErrno:path:format:]( &OBJC_CLASS___MBError,  "errorWithErrno:path:format:",  *v6,  v5,  @"statfs failed"));
    }
  }

  else
  {
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSString mb_stringWithFileSystemRepresentation:]( &OBJC_CLASS___NSString,  "mb_stringWithFileSystemRepresentation:",  v9.f_mntonname));
  }

  return v7;
}

+ (id)fetchAllAPFSVolumeMountPoints
{
  int v2 = getfsstat(&v8, 43360, 1);
  uint64_t v3 = -[NSMutableArray initWithCapacity:]( objc_alloc(&OBJC_CLASS___NSMutableArray),  "initWithCapacity:",  v2 & ~(v2 >> 31));
  if (v2 >= 1)
  {
    uint64_t v4 = v2;
    f_mntonname = v8.f_mntonname;
    do
    {
      if (!strcmp("apfs", f_mntonname - 16) && (*(f_mntonname - 22) & 0x10) == 0)
      {
        id v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSString mb_stringWithFileSystemRepresentation:]( &OBJC_CLASS___NSString,  "mb_stringWithFileSystemRepresentation:",  f_mntonname));
        -[NSMutableArray addObject:](v3, "addObject:", v6);
      }

      f_mntonname += 2168;
      --v4;
    }

    while (v4);
  }

  return v3;
}

+ (BOOL)startFilesystemKeyRollingWithPath:(id)a3 error:(id *)a4
{
  return 1;
}

+ (BOOL)stopFilesystemKeyRollingWithPath:(id)a3 error:(id *)a4
{
  return 1;
}

+ (void)removeDeviceTransferDirectoryWithEarliestCreationDate:(id)a3
{
  id v3 = a3;
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
  if ([v4 fileExistsAtPath:@"/var/mobile/Library/Caches/Backup/DT"])
  {
    id v54 = 0LL;
    id v5 = (void *)objc_claimAutoreleasedReturnValue( [v4 attributesOfItemAtPath:@"/var/mobile/Library/Caches/Backup/DT" error:&v54]);
    double v6 = COERCE_DOUBLE(v54);
    if (v5)
    {
      uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKeyedSubscript:NSFileCreationDate]);
      if (v7)
      {
        if (v3 && [v3 compare:v7] == (id)-1)
        {
          id v45 = MBGetDefaultLog();
          uint64_t v24 = (os_log_s *)objc_claimAutoreleasedReturnValue(v45);
          if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
          {
            [v7 timeIntervalSince1970];
            *(_DWORD *)buf = 138412546;
            uint64_t v56 = @"/var/mobile/Library/Caches/Backup/DT";
            __int16 v57 = 2048;
            double v58 = v46;
            _os_log_impl( (void *)&_mh_execute_header,  v24,  OS_LOG_TYPE_INFO,  "Ignoring %@ since it was created at %.3f",  buf,  0x16u);
            [v7 timeIntervalSince1970];
            _MBLog( @"INFO",  (uint64_t)"Ignoring %@ since it was created at %.3f",  v47,  v48,  v49,  v50,  v51,  v52,  (uint64_t)@"/var/mobile/Library/Caches/Backup/DT");
          }
        }

        else
        {
          id v8 = MBGetDefaultLog();
          statfs v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
          if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
          {
            [v7 timeIntervalSince1970];
            *(_DWORD *)buf = 138412546;
            uint64_t v56 = @"/var/mobile/Library/Caches/Backup/DT";
            __int16 v57 = 2048;
            double v58 = v10;
            _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "Removing %@ created at %.3f",  buf,  0x16u);
            [v7 timeIntervalSince1970];
            _MBLog( @"DEFAULT",  (uint64_t)"Removing %@ created at %.3f",  v11,  v12,  v13,  v14,  v15,  v16,  (uint64_t)@"/var/mobile/Library/Caches/Backup/DT");
          }

          +[NSDate timeIntervalSinceReferenceDate](&OBJC_CLASS___NSDate, "timeIntervalSinceReferenceDate");
          double v18 = v17;
          double v53 = v6;
          unsigned __int8 v19 = [v4 removeItemAtPath:@"/var/mobile/Library/Caches/Backup/DT" error:&v53];
          double v20 = COERCE_DOUBLE(*(id *)&v53);

          if ((v19 & 1) != 0)
          {
            +[NSDate timeIntervalSinceReferenceDate](&OBJC_CLASS___NSDate, "timeIntervalSinceReferenceDate");
            double v22 = v21;
            id v23 = MBGetDefaultLog();
            uint64_t v24 = (os_log_s *)objc_claimAutoreleasedReturnValue(v23);
            if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412546;
              uint64_t v56 = @"/var/mobile/Library/Caches/Backup/DT";
              __int16 v57 = 2048;
              double v58 = v22 - v18;
              _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, "Removed %@ in %.3fs", buf, 0x16u);
              _MBLog( @"DEFAULT",  (uint64_t)"Removed %@ in %.3fs",  v25,  v26,  v27,  v28,  v29,  v30,  (uint64_t)@"/var/mobile/Library/Caches/Backup/DT");
            }
          }

          else
          {
            id v38 = MBGetDefaultLog();
            uint64_t v24 = (os_log_s *)objc_claimAutoreleasedReturnValue(v38);
            if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138412546;
              uint64_t v56 = @"/var/mobile/Library/Caches/Backup/DT";
              __int16 v57 = 2112;
              double v58 = v20;
              _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_ERROR, "Failed to remove %@: %@", buf, 0x16u);
              _MBLog( @"ERROR",  (uint64_t)"Failed to remove %@: %@",  v39,  v40,  v41,  v42,  v43,  v44,  (uint64_t)@"/var/mobile/Library/Caches/Backup/DT");
            }
          }

          double v6 = v20;
        }
      }
    }

    else
    {
      id v31 = MBGetDefaultLog();
      uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(v31);
      if (os_log_type_enabled((os_log_t)v7, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412546;
        uint64_t v56 = @"/var/mobile/Library/Caches/Backup/DT";
        __int16 v57 = 2112;
        double v58 = v6;
        _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)v7,  OS_LOG_TYPE_ERROR,  "Failed to fetch attributes at %@: %@",  buf,  0x16u);
        _MBLog( @"ERROR",  (uint64_t)"Failed to fetch attributes at %@: %@",  v32,  v33,  v34,  v35,  v36,  v37,  (uint64_t)@"/var/mobile/Library/Caches/Backup/DT");
      }
    }
  }
}

+ (id)volumeUUIDWithVolumeMountPoint:(id)a3 error:(id *)a4
{
  id v5 = a3;
  if (!v5) {
    sub_1000119E0();
  }
  if (!a4) {
    sub_100011A08();
  }
  id v6 = v5;
  int v7 = open((const char *)[v6 fileSystemRepresentation], 0);
  if (v7 < 0)
  {
    uint64_t v10 = *__error();
    id v19 = MBGetDefaultLog();
    uint64_t v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v19);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)uint64_t v35 = 138543618;
      *(void *)&v35[4] = v6;
      *(_WORD *)&v35[12] = 1024;
      *(_DWORD *)&v35[14] = v10;
      _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_ERROR,  "open failed at %{public}@: %{errno}d",  v35,  0x12u);
      _MBLog(@"ERROR", (uint64_t)"open failed at %{public}@: %{errno}d", v20, v21, v22, v23, v24, v25, (uint64_t)v6);
    }

    goto LABEL_9;
  }

  int v8 = v7;
  *(void *)&v35[16] = 0LL;
  *(_OWORD *)uint64_t v35 = xmmword_100015768;
  v33[0] = 0LL;
  v33[1] = 0LL;
  int v34 = 0;
  int v9 = fgetattrlist(v7, v35, v33, 0x14uLL, 0);
  uint64_t v10 = *__error();
  close(v8);
  if (v9)
  {
    id v11 = MBGetDefaultLog();
    uint64_t v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543618;
      id v30 = v6;
      __int16 v31 = 1024;
      int v32 = v10;
      _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_ERROR,  "fgetattrlist failed at %{public}@: %{errno}d",  buf,  0x12u);
      _MBLog( @"ERROR",  (uint64_t)"fgetattrlist failed at %{public}@: %{errno}d",  v13,  v14,  v15,  v16,  v17,  v18,  (uint64_t)v6);
    }

@end