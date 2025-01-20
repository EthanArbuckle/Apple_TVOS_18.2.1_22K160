@interface PLPartialVideoCacheCleanUpMaintenanceTask
+ (BOOL)_shouldRemovePartialVideoAtURL:(id)a3;
- (BOOL)runTaskWithTransaction:(id)a3;
@end

@implementation PLPartialVideoCacheCleanUpMaintenanceTask

+ (BOOL)_shouldRemovePartialVideoAtURL:(id)a3
{
  id v3 = a3;
  id v17 = 0LL;
  id v16 = 0LL;
  unsigned int v4 = [v3 getResourceValue:&v17 forKey:NSURLContentAccessDateKey error:&v16];
  id v5 = v17;
  id v6 = v16;
  v8 = v6;
  if (v4) {
    BOOL v9 = v5 == 0LL;
  }
  else {
    BOOL v9 = 1;
  }
  if (v9)
  {
    uint64_t Log = PLBackendGetLog(v6, v7);
    v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(Log);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412802;
      id v19 = v3;
      __int16 v20 = 1024;
      unsigned int v21 = v4;
      __int16 v22 = 2112;
      v23 = v8;
      _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_ERROR,  "Cannot get the last access date on partial video file %@, success: %d, error: %@",  buf,  0x1Cu);
    }

    BOOL v14 = 1;
  }

  else
  {
    v11 = -[NSDate initWithTimeInterval:sinceDate:]( objc_alloc(&OBJC_CLASS___NSDate),  "initWithTimeInterval:sinceDate:",  v5,  604800.0);
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate now](&OBJC_CLASS___NSDate, "now"));
    -[os_log_s timeIntervalSinceDate:](v11, "timeIntervalSinceDate:", v12);
    BOOL v14 = v13 < 0.0;
  }

  return v14;
}

- (BOOL)runTaskWithTransaction:(id)a3
{
  id v3 = self;
  unsigned int v4 = (void *)objc_claimAutoreleasedReturnValue(-[PLMaintenanceTask libraryServicesManager](self, "libraryServicesManager", a3));
  unsigned int v5 = [v4 isSystemPhotoLibrary];

  if (!v5) {
    return 1;
  }
  v53 = (void *)objc_claimAutoreleasedReturnValue( +[PLPhotoLibraryPathManager systemLibraryPathManager]( &OBJC_CLASS___PLPhotoLibraryPathManager,  "systemLibraryPathManager"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v53 photoDirectoryWithType:19]);
  uint64_t v7 = objc_claimAutoreleasedReturnValue(+[NSURL fileURLWithPath:isDirectory:](&OBJC_CLASS___NSURL, "fileURLWithPath:isDirectory:", v6, 1LL));

  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
  v74[0] = NSURLContentAccessDateKey;
  v74[1] = NSURLIsDirectoryKey;
  BOOL v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v74, 2LL));
  v52 = (void *)v7;
  v10 = (void *)objc_claimAutoreleasedReturnValue( [v8 enumeratorAtURL:v7 includingPropertiesForKeys:v9 options:14 errorHandler:&stru_100020C78]);

  __int128 v65 = 0u;
  __int128 v66 = 0u;
  __int128 v63 = 0u;
  __int128 v64 = 0u;
  id v11 = v10;
  id v12 = [v11 countByEnumeratingWithState:&v63 objects:v73 count:16];
  if (!v12)
  {
    char v54 = 1;
    int v58 = 0;
    goto LABEL_41;
  }

  id v13 = v12;
  int v58 = 0;
  uint64_t v14 = *(void *)v64;
  char v54 = 1;
  id v56 = v11;
  v57 = v3;
  uint64_t v55 = *(void *)v64;
  do
  {
    for (i = 0LL; i != v13; i = (char *)i + 1)
    {
      if (*(void *)v64 != v14) {
        objc_enumerationMutation(v11);
      }
      id v16 = *(void **)(*((void *)&v63 + 1) + 8LL * (void)i);
      id v61 = 0LL;
      id v62 = 0LL;
      unsigned int v17 = [v16 getResourceValue:&v62 forKey:NSURLIsDirectoryKey error:&v61];
      id v18 = v62;
      id v19 = v61;
      unsigned int v21 = v19;
      if (!v17)
      {
        uint64_t Log = PLBackendGetLog(v19, v20);
        v26 = (os_log_s *)objc_claimAutoreleasedReturnValue(Log);
        if (!os_log_type_enabled(v26, OS_LOG_TYPE_ERROR)) {
          goto LABEL_35;
        }
        *(_DWORD *)buf = 138412546;
        id v68 = v16;
        __int16 v69 = 2112;
        uint64_t v70 = (uint64_t)v21;
        v27 = v26;
        os_log_type_t v28 = OS_LOG_TYPE_ERROR;
        v29 = "Failed to check NSURLIsDirectoryKey on URL: %@, with error: %@";
        uint32_t v30 = 22;
LABEL_15:
        _os_log_impl((void *)&_mh_execute_header, v27, v28, v29, buf, v30);
        goto LABEL_35;
      }

      if (!v18) {
        goto LABEL_36;
      }
      if (([v18 BOOLValue] & 1) == 0
        && objc_msgSend((id)objc_opt_class(v3, v22), "_shouldRemovePartialVideoAtURL:", v16))
      {
        v23 = (void *)objc_claimAutoreleasedReturnValue([v16 pathComponents]);
        v24 = (void *)objc_claimAutoreleasedReturnValue([v23 lastObject]);
        else {
          uint64_t v59 = objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "objectAtIndex:", (char *)objc_msgSend(v23, "count") - 2));
        }
        v38 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
        id v60 = 0LL;
        unsigned int v39 = [v38 removeItemAtURL:v16 error:&v60];
        v26 = (os_log_s *)v60;

        if (v39)
        {
          ++v58;
          uint64_t v42 = PLBackendGetLog(v40, v41);
          v43 = (os_log_s *)objc_claimAutoreleasedReturnValue(v42);
          if (os_log_type_enabled(v43, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138543618;
            id v68 = v24;
            __int16 v69 = 2114;
            v44 = (void *)v59;
            uint64_t v70 = v59;
            _os_log_impl( (void *)&_mh_execute_header,  v43,  OS_LOG_TYPE_INFO,  "Removed partial video %{public}@ of asset %{public}@",  buf,  0x16u);
            goto LABEL_29;
          }

@end