@interface BKDisplayRenderOverlayPersistenceCoordinator
+ (BKDisplayRenderOverlayPersistenceCoordinator)sharedInstance;
- (BKDisplayRenderOverlayPersistenceCoordinator)init;
- (BOOL)destroyOverlay:(id)a3;
- (BOOL)saveOverlay:(id)a3;
- (id)_fileNameForOverlay:(id)a3;
- (id)_filePathForOverlay:(id)a3;
- (id)rebuildPersistentOverlays;
@end

@implementation BKDisplayRenderOverlayPersistenceCoordinator

- (BKDisplayRenderOverlayPersistenceCoordinator)init
{
  v9.receiver = self;
  v9.super_class = [BKDisplayRenderOverlayPersistenceCoordinator class];
  BKDisplayRenderOverlayPersistenceCoordinator *v2 = [[BKDisplayRenderOverlayPersistenceCoordinator alloc] init];
  if (v2)
  {
    uint64_t v3 = BSSystemSharedDirectoryForCurrentProcess();
    v4 = v3;
    v5 = [v4 stringByAppendingPathComponent:@"RenderOverlay"];
    v6 = (NSString *)[v5 copy];
    rootPersistencePath = v2->_rootPersistencePath;
    v2->_rootPersistencePath = v6;
  }

  return v2;
}

- (id)rebuildPersistentOverlays
{
  id v26 = [NSMutableArray array];
  uint64_t v3 = (void *)[NSFileManager defaultManager];
  v27 = self;
  v4 = [v3 enumeratorAtPath:self->_rootPersistencePath];

  __int128 v32 = 0u;
  __int128 v33 = 0u;
  __int128 v30 = 0u;
  __int128 v31 = 0u;
  id obj = v4;
  id v5 = [obj countByEnumeratingWithState:v30 objects:v38 count:16];
  if (v5)
  {
    id v7 = v5;
    uint64_t v8 = *(void *)v31;
    *(void *)&__int128 v6 = 138543618LL;
    __int128 v25 = v6;
    do
    {
      for (i = 0LL; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v31 != v8) {
          objc_enumerationMutation(obj);
        }
        v10 = [v30 objectAtIndex:i];
        if (objc_msgSend(v10, "hasSuffix:", @"libitmap", v25))
        {
          v11 = [v27->_rootPersistencePath stringByAppendingPathComponent:v10];
          NSData *v12 = [[NSData alloc] init];
          id v29 = 0LL;
          v13 = [NSData initWithContentsOfFile:v11 options:8 error:&v29];
          id v14 = v29;
          v15 = [_BKDisplayRenderOverlayPersistenceData classesRequiredToDecode];
          _BKDisplayRenderOverlayPersistenceData *v16 = [NSKeyedUnarchiver unarchiveObjectWithData:v13];

          unint64_t v17 = (unint64_t)[v16 overlayType];
          if (v17 <= 4)
          {
            uint64_t v19 = [*(*(off_1000B6DF0 + v17)) class];
            unint64_t v17 = [v19 autorelease];
          }

          v20 = [[v17 alloc] initWithPersistenceData:v16];
          v21 = v20;
          if (v20)
          {
            uint64_t v22 = BKLogDisplay(v20);
            v23 = [os_log logWithName:v22];
            if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = v25;
              v35 = v21;
              __int16 v36 = 2114;
              v37 = v11;
              _os_log_debug_impl( (void *)&_mh_execute_header,  v23,  OS_LOG_TYPE_DEBUG,  "[BKDisplayRenderOverlayPersistenceCoordinator] Loaded overlay from persistence: %{public}@ from location: %{public}@",  buf,  0x16u);
            }

            [v26 addObject:v21];
          }
        }
      }

      id v7 = [obj countByEnumeratingWithState:&v30 objects:v38 count:16];
    }

    while (v7);
  }

  return v26;
}

- (BOOL)saveOverlay:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (v4)
  {
    uint64_t v6 = BKLogDisplay(v4);
    os_log_s *v7 = [v6 autorelease];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      v44 = [v5 name];
      *(_DWORD *)buf = 138543362;
      uint64_t v52 = (uint64_t)v44;
      _os_log_debug_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEBUG,  "[BKDisplayRenderOverlayPersistenceCoordinator] Persisting overlay: %{public}@",  buf,  0xCu);
    }

    uint64_t v8 = (void *)[v5 _persistenceData];
    objc_super v9 = [v8 bs_secureEncoded];

    v10 = [self _fileNameForOverlay:v5];
    uint64_t v47 = [self _filePathForOverlay:v5];
    v11 = [NSFileManager defaultManager];
    NSFileAttributeKey v59 = NSFilePosixPermissions;
    v60 = &off_1000C0528;
    unsigned int v12 = 1;
    uint64_t v13 = [NSDictionary dictionaryWithObjects:forKeys:count:&v60, &v59, 1LL];
    v46 = (void *)v13;
    if ([v11 fileExistsAtPath:self->_rootPersistencePath isDirectory:0])
    {
      id v14 = 0LL;
    }

    else
    {
      rootPersistencePath = self->_rootPersistencePath;
      id v50 = 0LL;
      unsigned int v12 = [v11 createDirectoryAtPath:rootPersistencePath withIntermediateDirectories:1 attributes:v13 error:&v50];
      id v17 = v50;
      uint64_t v18 = v17;
      if ((v12 & 1) == 0)
      {
        uint64_t v19 = BKLogCommon(v17);
        os_log_s *v20 = v19;
        if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
        {
          v21 = self->_rootPersistencePath;
          *(_DWORD *)buf = 138543618;
          uint64_t v52 = (uint64_t)v21;
          __int16 v53 = 2114;
          uint64_t v54 = (uint64_t)v18;
          _os_log_impl( (void *)&_mh_execute_header,  v20,  OS_LOG_TYPE_DEFAULT,  "[BKDisplayRenderOverlayPersistenceCoordinator] Unable to create path: %{public}@: %{public}@",  buf,  0x16u);
        }
      }

      NSURL *v22 = [NSURL fileURLWithPath:self->_rootPersistencePath isDirectory:1];
      id v49 = 0LL;
      unsigned __int8 v23 = [v22 setResourceValue:&__kCFBooleanTrue forKey:NSURLIsExcludedFromBackupKey error:&v49];
      id v24 = v49;
      id v14 = v24;
      if ((v23 & 1) == 0)
      {
        uint64_t v25 = BKLogCommon(v24);
        os_log_s *v26 = v25;
        if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
        {
          v27 = self->_rootPersistencePath;
          *(_DWORD *)buf = 138543618;
          uint64_t v52 = (uint64_t)v27;
          __int16 v53 = 2114;
          uint64_t v54 = (uint64_t)v14;
          _os_log_impl( (void *)&_mh_execute_header,  v26,  OS_LOG_TYPE_DEFAULT,  "[BKDisplayRenderOverlayPersistenceCoordinator] Unable to exclude path from backups: %{public}@: %{public}@",  buf,  0x16u);
        }
      }
    }

    NSFileAttributeKey v57 = NSFilePosixPermissions;
    v58 = &off_1000C0540;
    v28 = [NSDictionary dictionaryWithObjects:forKeys:count:v58, v57, 1LL];
    id v29 = NSTemporaryDirectory();
    __int128 v30 = (__CFString *)v29;
    __int128 v31 = v30;
    if (!v30) {
      __int128 v30 = @"/tmp";
    }
    __int128 v32 = (void *)[v30 stringByAppendingPathComponent:v10];

    if (!v12)
    {
      LOBYTE(v15) = 0;
      v34 = (void *)v47;
LABEL_33:

      goto LABEL_34;
    }

    id v33 = [v11 createFileAtPath:v32 contents:v9 attributes:v28];
    v34 = (void *)v47;
    if ((v33 & 1) != 0)
    {
      id v48 = v14;
      unsigned int v15 = [v11 moveItemAtPath:v32 toPath:v47 error:&v48];
      id v45 = v48;

      if (v15)
      {
        uint64_t v36 = BKLogDisplay(v35);
        v37 = [os_log_s class];
        if (os_log_type_enabled(v37, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138543362;
          uint64_t v52 = v47;
          _os_log_debug_impl( (void *)&_mh_execute_header,  v37,  OS_LOG_TYPE_DEBUG,  "[BKDisplayRenderOverlayPersistenceCoordinator] Wrote overlay to file: %{public}@",  buf,  0xCu);
        }

        LOBYTE(v15) = 1;
        goto LABEL_31;
      }

      uint64_t v42 = BKLogCommon(v35);
      v37 = [os_log logWithName:v42];
      if (!os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
      {
LABEL_31:
        id v14 = v45;
        goto LABEL_32;
      }

      *(_DWORD *)buf = 138543874;
      uint64_t v52 = (uint64_t)v32;
      __int16 v53 = 2114;
      uint64_t v54 = v47;
      __int16 v55 = 2114;
      id v14 = v45;
      id v56 = v45;
      v39 = "[BKDisplayRenderOverlayPersistenceCoordinator] Unable to move temporary file (%{public}@) to real location i"
            "n the shared container (%{public}@): %{public}@";
      v40 = v37;
      uint32_t v41 = 32;
    }

    else
    {
      uint64_t v38 = BKLogCommon(v33);
      v37 = [os_log logWithCategory:v38];
      if (!os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
      {
LABEL_30:
        LOBYTE(v15) = 0;
LABEL_32:

        goto LABEL_33;
      }

      *(_DWORD *)buf = 138543362;
      uint64_t v52 = (uint64_t)v32;
      v39 = "[BKDisplayRenderOverlayPersistenceCoordinator] Unable to save temporary snapshot to disk at %{public}@";
      v40 = v37;
      uint32_t v41 = 12;
    }

    _os_log_impl((void *)&_mh_execute_header, v40, OS_LOG_TYPE_DEFAULT, v39, buf, v41);
    goto LABEL_30;
  }

  LOBYTE(v15) = 0;
LABEL_34:

  return v15;
}

- (BOOL)destroyOverlay:(id)a3
{
  uint64_t v3 = (void *)[self _filePathForOverlay:a3];
  if (v3)
  {
    id v4 = [NSFileManager defaultManager];
    unsigned __int8 v5 = [v4 removeItemAtPath:v3 error:0];
  }

  else
  {
    unsigned __int8 v5 = 0;
  }

  return v5;
}

- (id)_filePathForOverlay:(id)a3
{
  id v4 = [self _fileNameForOverlay:a3];
  rootPersistencePath = self->_rootPersistencePath;
  uint64_t v6 = (void *)[v4 stringByAppendingPathExtension:@"libitmap"];
  id v7 = [rootPersistencePath stringByAppendingPathComponent:v6];

  return v7;
}

- (id)_fileNameForOverlay:(id)a3
{
  id v3 = a3;
  id v4 = [v3 descriptor];
  uint64_t v5 = [v4 displayUUID];
  uint64_t v6 = (void *)v5;
  if (v5) {
    id v7 = (const __CFString *)v5;
  }
  else {
    id v7 = @"main";
  }
  uint64_t v8 = (void *)[v3 name];

  NSString *v9 = [NSString stringWithFormat:@"%@|%@", v7, v8];
  return v9;
}

- (void).cxx_destruct
{
}

+ (BKDisplayRenderOverlayPersistenceCoordinator)sharedInstance
{
  if (qword_1000DC268 != -1) {
    dispatch_once(&qword_1000DC268, &stru_1000B7FA8);
  }
  return (BKDisplayRenderOverlayPersistenceCoordinator *)(id)qword_1000DC260;
}

@end