@interface MSDContentCacheManager
+ (id)sharedInstance;
- (BOOL)copyFileIfPresentInCache:(id)a3 toLocation:(id)a4 verifyHash:(BOOL)a5;
- (BOOL)deleteFromCache:(id)a3;
- (MSDContentCacheManager)init;
- (NSArray)cachedManifestPaths;
- (NSArray)fileDownloadCachePaths;
- (NSFileManager)fileManager;
- (NSMutableDictionary)appPatches;
- (NSString)dataVolumeCacheFolderPath;
- (NSString)demoVolumeCacheFolderPath;
- (NSString)userHomePath;
- (NSString)userVolumeCacheFolderPath;
- (NSURL)appPatchesListFileURL;
- (id)appDiffPatchFileForSourceAppUID:(id)a3 targetAppUID:(id)a4;
- (id)fileCachePathFromSourcePath:(id)a3 forBackgroundDownload:(BOOL)a4;
- (id)findFileInCache:(id)a3;
- (unint64_t)fileSizeInCache:(id)a3;
- (void)_clearFactoryCache;
- (void)_loadCachedManifestPaths;
- (void)addAppDiffPatchFile:(id)a3 sourceAppUID:(id)a4 targetAppUID:(id)a5;
- (void)clearCache;
- (void)clearCacheExceptFileHashes:(id)a3;
- (void)createDownloadCacheFolders;
- (void)loadAppPatchesList;
- (void)removeAppDiffPatchFileForSourceAppUID:(id)a3 targetAppUID:(id)a4;
- (void)saveAppPatchesList;
- (void)setAppPatches:(id)a3;
- (void)setAppPatchesListFileURL:(id)a3;
- (void)setDataVolumeCacheFolderPath:(id)a3;
- (void)setDemoVolumeCacheFolderPath:(id)a3;
- (void)setFileDownloadCachePaths:(id)a3;
- (void)setFileManager:(id)a3;
- (void)setUserHomePath:(id)a3;
- (void)setUserVolumeCacheFolderPath:(id)a3;
@end

@implementation MSDContentCacheManager

+ (id)sharedInstance
{
  if (qword_1001255C8 != -1) {
    dispatch_once(&qword_1001255C8, &stru_1000FAC30);
  }
  return (id)qword_1001255C0;
}

- (MSDContentCacheManager)init
{
  v14.receiver = self;
  v14.super_class = (Class)&OBJC_CLASS___MSDContentCacheManager;
  v2 = -[MSDContentCacheManager init](&v14, "init");
  if (v2)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
    -[MSDContentCacheManager setFileManager:](v2, "setFileManager:", v3);

    v4 = (void *)objc_claimAutoreleasedReturnValue( +[NSURL fileURLWithPath:]( &OBJC_CLASS___NSURL,  "fileURLWithPath:",  @"/private/var/mnt/com.apple.mobilestoredemo.storage/com.apple.mobilestoredemo.blob/Metadata/.MSD_cache/AppPatches.plist"));
    -[MSDContentCacheManager setAppPatchesListFileURL:](v2, "setAppPatchesListFileURL:", v4);

    -[MSDContentCacheManager setDemoVolumeCacheFolderPath:]( v2,  "setDemoVolumeCacheFolderPath:",  @"/private/var/mnt/com.apple.mobilestoredemo.storage/com.apple.mobilestoredemo.blob/Metadata/.MSD_cache");
    -[MSDContentCacheManager setDataVolumeCacheFolderPath:]( v2,  "setDataVolumeCacheFolderPath:",  @"/var/MSDWorkContainer/.MSD_cache");
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[MSDTargetDevice sharedInstance](&OBJC_CLASS___MSDTargetDevice, "sharedInstance"));
    v6 = (void *)objc_claimAutoreleasedReturnValue([v5 demoUserHomePath]);
    -[MSDContentCacheManager setUserHomePath:](v2, "setUserHomePath:", v6);

    v7 = (void *)objc_claimAutoreleasedReturnValue(-[MSDContentCacheManager userHomePath](v2, "userHomePath"));
    v8 = (void *)objc_claimAutoreleasedReturnValue([v7 stringByAppendingPathComponent:@"/.MSD_cache"]);
    -[MSDContentCacheManager setUserVolumeCacheFolderPath:](v2, "setUserVolumeCacheFolderPath:", v8);

    v9 = (void *)objc_claimAutoreleasedReturnValue(-[MSDContentCacheManager dataVolumeCacheFolderPath](v2, "dataVolumeCacheFolderPath"));
    v15[0] = v9;
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[MSDContentCacheManager demoVolumeCacheFolderPath](v2, "demoVolumeCacheFolderPath"));
    v15[1] = v10;
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[MSDContentCacheManager userVolumeCacheFolderPath](v2, "userVolumeCacheFolderPath"));
    v15[2] = v11;
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v15, 3LL));
    -[MSDContentCacheManager setFileDownloadCachePaths:](v2, "setFileDownloadCachePaths:", v12);

    -[MSDContentCacheManager _loadCachedManifestPaths](v2, "_loadCachedManifestPaths");
    -[MSDContentCacheManager createDownloadCacheFolders](v2, "createDownloadCacheFolders");
    -[MSDContentCacheManager loadAppPatchesList](v2, "loadAppPatchesList");
  }

  return v2;
}

- (void)clearCache
{
  __int128 v17 = 0u;
  __int128 v18 = 0u;
  __int128 v19 = 0u;
  __int128 v20 = 0u;
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MSDContentCacheManager fileDownloadCachePaths](self, "fileDownloadCachePaths"));
  id v4 = [v3 countByEnumeratingWithState:&v17 objects:v23 count:16];
  if (v4)
  {
    id v6 = v4;
    uint64_t v7 = *(void *)v18;
    *(void *)&__int128 v5 = 138543362LL;
    __int128 v16 = v5;
    do
    {
      v8 = 0LL;
      do
      {
        if (*(void *)v18 != v7) {
          objc_enumerationMutation(v3);
        }
        uint64_t v9 = *(void *)(*((void *)&v17 + 1) + 8LL * (void)v8);
        v10 = (void *)objc_claimAutoreleasedReturnValue(-[MSDContentCacheManager fileManager](self, "fileManager", v16));
        unsigned int v11 = [v10 fileExistsAtPath:v9];

        if (v11)
        {
          id v12 = sub_10003A95C();
          v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
          if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = v16;
            uint64_t v22 = v9;
            _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_DEFAULT,  "Clearing the cache at path: %{public}@",  buf,  0xCu);
          }

          objc_super v14 = (void *)objc_claimAutoreleasedReturnValue(-[MSDContentCacheManager fileManager](self, "fileManager"));
          [v14 removeItemAtPath:v9 error:0];
        }

        v15 = (void *)objc_claimAutoreleasedReturnValue(-[MSDContentCacheManager fileManager](self, "fileManager"));
        [v15 createDirectoryAtPath:v9 withIntermediateDirectories:1 attributes:0 error:0];

        v8 = (char *)v8 + 1;
      }

      while (v6 != v8);
      id v6 = [v3 countByEnumeratingWithState:&v17 objects:v23 count:16];
    }

    while (v6);
  }

  -[MSDContentCacheManager _clearFactoryCache](self, "_clearFactoryCache");
}

- (void)clearCacheExceptFileHashes:(id)a3
{
  id v4 = a3;
  __int128 v21 = 0u;
  __int128 v22 = 0u;
  __int128 v23 = 0u;
  __int128 v24 = 0u;
  __int128 v5 = (void *)objc_claimAutoreleasedReturnValue(-[MSDContentCacheManager fileDownloadCachePaths](self, "fileDownloadCachePaths"));
  id v6 = [v5 countByEnumeratingWithState:&v21 objects:v27 count:16];
  if (v6)
  {
    id v8 = v6;
    uint64_t v9 = *(void *)v22;
    *(void *)&__int128 v7 = 138543362LL;
    __int128 v18 = v7;
    do
    {
      v10 = 0LL;
      do
      {
        if (*(void *)v22 != v9) {
          objc_enumerationMutation(v5);
        }
        uint64_t v11 = *(void *)(*((void *)&v21 + 1) + 8LL * (void)v10);
        id v12 = (void *)objc_claimAutoreleasedReturnValue(-[MSDContentCacheManager fileManager](self, "fileManager", v18));
        unsigned int v13 = [v12 fileExistsAtPath:v11];

        if (v13)
        {
          id v14 = sub_10003A95C();
          v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
          if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = v18;
            uint64_t v26 = v11;
            _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_DEFAULT,  "Clearing the cache at path: %{public}@",  buf,  0xCu);
          }

          __int128 v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
          __int128 v17 = (void *)objc_claimAutoreleasedReturnValue([v16 contentsOfDirectoryAtPath:v11 error:0]);

          v19[0] = _NSConcreteStackBlock;
          v19[1] = 3221225472LL;
          v19[2] = sub_10008995C;
          v19[3] = &unk_1000FAC58;
          v19[4] = v11;
          v19[5] = self;
          id v20 = v4;
          [v17 enumerateObjectsUsingBlock:v19];
        }

        v10 = (char *)v10 + 1;
      }

      while (v8 != v10);
      id v8 = [v5 countByEnumeratingWithState:&v21 objects:v27 count:16];
    }

    while (v8);
  }

  -[MSDContentCacheManager _clearFactoryCache](self, "_clearFactoryCache");
}

- (BOOL)copyFileIfPresentInCache:(id)a3 toLocation:(id)a4 verifyHash:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a3;
  id v9 = a4;
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[MSDContentCacheManager findFileInCache:](self, "findFileInCache:", v8));
  if (v10)
  {
    if (v5)
    {
      uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(+[MSDFileMetadata fileHashWithPath:](&OBJC_CLASS___MSDFileMetadata, "fileHashWithPath:", v10));
      id v12 = (void *)objc_claimAutoreleasedReturnValue([v11 hexStringRepresentation]);

      if (![v8 isEqualToString:v12])
      {
        id v25 = sub_10003A95C();
        uint64_t v26 = (os_log_s *)objc_claimAutoreleasedReturnValue(v25);
        if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR)) {
          sub_10009FF3C();
        }

        id v17 = 0LL;
        goto LABEL_19;
      }
    }

    unsigned int v13 = (void *)objc_claimAutoreleasedReturnValue(-[MSDContentCacheManager fileManager](self, "fileManager"));
    unsigned int v14 = [v13 fileExistsAtPath:v9];

    if (v14)
    {
      v15 = (void *)objc_claimAutoreleasedReturnValue(-[MSDContentCacheManager fileManager](self, "fileManager"));
      id v28 = 0LL;
      unsigned __int8 v16 = [v15 removeItemAtPath:v9 error:&v28];
      id v17 = v28;

      if ((v16 & 1) == 0)
      {
        id v18 = sub_10003A95C();
        id v12 = (void *)objc_claimAutoreleasedReturnValue(v18);
        if (os_log_type_enabled((os_log_t)v12, OS_LOG_TYPE_ERROR)) {
          sub_10009FED4();
        }
LABEL_19:

        BOOL v19 = 0;
        goto LABEL_13;
      }
    }

    else
    {
      id v17 = 0LL;
    }

    id v20 = v17;
    __int128 v21 = (void *)objc_claimAutoreleasedReturnValue(-[MSDContentCacheManager fileManager](self, "fileManager"));
    id v27 = v17;
    unsigned __int8 v22 = [v21 copyItemAtPath:v10 toPath:v9 error:&v27];
    id v17 = v27;

    if ((v22 & 1) == 0)
    {
      id v24 = sub_10003A95C();
      id v12 = (void *)objc_claimAutoreleasedReturnValue(v24);
      if (os_log_type_enabled((os_log_t)v12, OS_LOG_TYPE_ERROR)) {
        sub_10009FE6C();
      }
      goto LABEL_19;
    }

    BOOL v19 = 1;
  }

  else
  {
    BOOL v19 = 0;
    id v17 = 0LL;
  }

- (id)fileCachePathFromSourcePath:(id)a3 forBackgroundDownload:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  if ([v6 hasPrefix:@"/private"])
  {
    uint64_t v7 = objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "substringFromIndex:", objc_msgSend(@"/private", "length")));

    id v6 = (id)v7;
  }

  if (v4)
  {
    uint64_t v8 = objc_claimAutoreleasedReturnValue(-[MSDContentCacheManager demoVolumeCacheFolderPath](self, "demoVolumeCacheFolderPath"));
  }

  else if (v6 {
         && (id v9 = (void *)objc_claimAutoreleasedReturnValue(-[MSDContentCacheManager userHomePath](self, "userHomePath")),
  }
             unsigned int v10 = [v6 hasPrefix:v9],
             v9,
             v10))
  {
    uint64_t v8 = objc_claimAutoreleasedReturnValue(-[MSDContentCacheManager userVolumeCacheFolderPath](self, "userVolumeCacheFolderPath"));
  }

  else
  {
    uint64_t v8 = objc_claimAutoreleasedReturnValue(-[MSDContentCacheManager dataVolumeCacheFolderPath](self, "dataVolumeCacheFolderPath"));
  }

  uint64_t v11 = (void *)v8;

  return v11;
}

- (void)addAppDiffPatchFile:(id)a3 sourceAppUID:(id)a4 targetAppUID:(id)a5
{
  id v13 = a3;
  id v8 = a4;
  id v9 = a5;
  unsigned int v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%@_%@", v8, v9));
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(-[MSDContentCacheManager appPatches](self, "appPatches"));
  objc_sync_enter(v11);
  id v12 = (void *)objc_claimAutoreleasedReturnValue(-[MSDContentCacheManager appPatches](self, "appPatches"));
  [v12 setObject:v13 forKey:v10];

  -[MSDContentCacheManager saveAppPatchesList](self, "saveAppPatchesList");
  objc_sync_exit(v11);
}

- (void)removeAppDiffPatchFileForSourceAppUID:(id)a3 targetAppUID:(id)a4
{
  id v10 = a3;
  id v6 = a4;
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%@_%@", v10, v6));
  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[MSDContentCacheManager appPatches](self, "appPatches"));
  objc_sync_enter(v8);
  id v9 = (void *)objc_claimAutoreleasedReturnValue(-[MSDContentCacheManager appPatches](self, "appPatches"));
  [v9 removeObjectForKey:v7];

  -[MSDContentCacheManager saveAppPatchesList](self, "saveAppPatchesList");
  objc_sync_exit(v8);
}

- (id)appDiffPatchFileForSourceAppUID:(id)a3 targetAppUID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%@_%@", v6, v7));
  id v9 = (void *)objc_claimAutoreleasedReturnValue(-[MSDContentCacheManager appPatches](self, "appPatches"));
  objc_sync_enter(v9);
  id v10 = (void *)objc_claimAutoreleasedReturnValue(-[MSDContentCacheManager appPatches](self, "appPatches"));
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([v10 objectForKey:v8]);

  objc_sync_exit(v9);
  return v11;
}

- (id)findFileInCache:(id)a3
{
  id v4 = a3;
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  BOOL v5 = (void *)objc_claimAutoreleasedReturnValue(-[MSDContentCacheManager fileDownloadCachePaths](self, "fileDownloadCachePaths", 0LL));
  id v6 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v15;
LABEL_3:
    uint64_t v9 = 0LL;
    while (1)
    {
      if (*(void *)v15 != v8) {
        objc_enumerationMutation(v5);
      }
      id v10 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(*((void *)&v14 + 1) + 8 * v9) stringByAppendingPathComponent:v4]);
      uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(-[MSDContentCacheManager fileManager](self, "fileManager"));
      unsigned __int8 v12 = [v11 fileExistsAtPath:v10];

      if ((v12 & 1) != 0) {
        break;
      }

      if (v7 == (id)++v9)
      {
        id v7 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
        if (v7) {
          goto LABEL_3;
        }
        goto LABEL_9;
      }
    }
  }

  else
  {
LABEL_9:
    id v10 = 0LL;
  }

  return v10;
}

- (unint64_t)fileSizeInCache:(id)a3
{
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[MSDContentCacheManager findFileInCache:](self, "findFileInCache:", a3));
  BOOL v5 = (void *)objc_claimAutoreleasedReturnValue(-[MSDContentCacheManager fileManager](self, "fileManager"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 attributesOfItemAtPath:v4 error:0]);

  if (v6) {
    id v7 = [v6 fileSize];
  }
  else {
    id v7 = 0LL;
  }

  return (unint64_t)v7;
}

- (BOOL)deleteFromCache:(id)a3
{
  id v4 = a3;
  BOOL v5 = (void *)objc_claimAutoreleasedReturnValue(-[MSDContentCacheManager findFileInCache:](self, "findFileInCache:", v4));
  if (!v5)
  {
    id v11 = sub_10003A95C();
    unsigned __int8 v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      sub_10009FFA0();
    }
    id v8 = 0LL;
    goto LABEL_10;
  }

  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[MSDContentCacheManager fileManager](self, "fileManager"));
  id v15 = 0LL;
  unsigned __int8 v7 = [v6 removeItemAtPath:v5 error:&v15];
  id v8 = v15;

  if ((v7 & 1) == 0)
  {
    id v13 = sub_10003A95C();
    unsigned __int8 v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      __int128 v14 = (void *)objc_claimAutoreleasedReturnValue([v8 localizedDescription]);
      *(_DWORD *)buf = 138543874;
      id v17 = v4;
      __int16 v18 = 2114;
      BOOL v19 = v5;
      __int16 v20 = 2114;
      __int128 v21 = v14;
      _os_log_error_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_ERROR,  "Failed to delete hash: %{public}@ with path: %{public}@ from cache; error: %{public}@",
        buf,
        0x20u);
    }

- (void)createDownloadCacheFolders
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[MSDHelperAgent sharedInstance](&OBJC_CLASS___MSDHelperAgent, "sharedInstance"));
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[MSDContentCacheManager fileDownloadCachePaths](self, "fileDownloadCachePaths", 0LL));
  id v5 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v13;
    do
    {
      id v8 = 0LL;
      do
      {
        if (*(void *)v13 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void *)(*((void *)&v12 + 1) + 8LL * (void)v8);
        id v10 = (void *)objc_claimAutoreleasedReturnValue(-[MSDContentCacheManager fileManager](self, "fileManager"));
        unsigned __int8 v11 = [v10 fileExistsAtPath:v9];

        if ((v11 & 1) == 0) {
          [v3 prepareWorkDirectory:v9 writableByNonRoot:1];
        }
        id v8 = (char *)v8 + 1;
      }

      while (v6 != v8);
      id v6 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }

    while (v6);
  }
}

- (void)loadAppPatchesList
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MSDContentCacheManager fileManager](self, "fileManager"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[MSDContentCacheManager appPatchesListFileURL](self, "appPatchesListFileURL"));
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 path]);
  unsigned int v6 = [v3 fileExistsAtPath:v5];

  if (v6)
  {
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(-[MSDContentCacheManager appPatchesListFileURL](self, "appPatchesListFileURL"));
    id v13 = 0LL;
    id v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithContentsOfURL:error:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithContentsOfURL:error:",  v7,  &v13));
    id v9 = v13;

    if (v8)
    {
      id v10 = (os_log_s *)[v8 mutableCopy];
      -[MSDContentCacheManager setAppPatches:](self, "setAppPatches:", v10);
    }

    else
    {
      id v11 = sub_10003A95C();
      id v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
        sub_1000A0004(v9, v10);
      }
    }
  }

  else
  {
    __int128 v12 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    -[MSDContentCacheManager setAppPatches:](self, "setAppPatches:", v12);
  }

- (void)saveAppPatchesList
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MSDContentCacheManager appPatches](self, "appPatches"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[MSDContentCacheManager appPatchesListFileURL](self, "appPatchesListFileURL"));
  id v9 = 0LL;
  unsigned __int8 v5 = [v3 writeToURL:v4 error:&v9];
  id v6 = v9;

  if ((v5 & 1) == 0)
  {
    id v7 = sub_10003A95C();
    id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      sub_1000A0084(v6, v8);
    }
  }
}

- (void)_loadCachedManifestPaths
{
  v3 = (NSArray *)objc_opt_new(&OBJC_CLASS___NSArray, a2);
  cachedManifestPaths = self->_cachedManifestPaths;
  self->_cachedManifestPaths = v3;
}

- (void)_clearFactoryCache
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MSDContentCacheManager fileManager](self, "fileManager"));
  unsigned int v4 = [v3 fileExistsAtPath:@"/var/MSDWorkContainer/.MSD_cache_manifest"];

  if (v4)
  {
    id v5 = sub_10003A95C();
    id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      int v13 = 138543362;
      __int128 v14 = @"/var/MSDWorkContainer/.MSD_cache_manifest";
      _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "Clearing the cache at path: %{public}@",  (uint8_t *)&v13,  0xCu);
    }

    id v7 = (void *)objc_claimAutoreleasedReturnValue(-[MSDContentCacheManager fileManager](self, "fileManager"));
    [v7 removeItemAtPath:@"/var/MSDWorkContainer/.MSD_cache_manifest" error:0];
  }

  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[MSDContentCacheManager fileManager](self, "fileManager"));
  unsigned int v9 = [v8 fileExistsAtPath:@"/var/MSDWorkContainer/.MSD_cache_content_plist"];

  if (v9)
  {
    id v10 = sub_10003A95C();
    id v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      int v13 = 138543362;
      __int128 v14 = @"/var/MSDWorkContainer/.MSD_cache_content_plist";
      _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "Clearing the cache at path: %{public}@",  (uint8_t *)&v13,  0xCu);
    }

    __int128 v12 = (void *)objc_claimAutoreleasedReturnValue(-[MSDContentCacheManager fileManager](self, "fileManager"));
    [v12 removeItemAtPath:@"/var/MSDWorkContainer/.MSD_cache_content_plist" error:0];
  }

- (NSArray)cachedManifestPaths
{
  return self->_cachedManifestPaths;
}

- (NSArray)fileDownloadCachePaths
{
  return self->_fileDownloadCachePaths;
}

- (void)setFileDownloadCachePaths:(id)a3
{
}

- (NSFileManager)fileManager
{
  return self->_fileManager;
}

- (void)setFileManager:(id)a3
{
}

- (NSMutableDictionary)appPatches
{
  return self->_appPatches;
}

- (void)setAppPatches:(id)a3
{
}

- (NSURL)appPatchesListFileURL
{
  return self->_appPatchesListFileURL;
}

- (void)setAppPatchesListFileURL:(id)a3
{
}

- (NSString)dataVolumeCacheFolderPath
{
  return self->_dataVolumeCacheFolderPath;
}

- (void)setDataVolumeCacheFolderPath:(id)a3
{
}

- (NSString)demoVolumeCacheFolderPath
{
  return self->_demoVolumeCacheFolderPath;
}

- (void)setDemoVolumeCacheFolderPath:(id)a3
{
}

- (NSString)userVolumeCacheFolderPath
{
  return self->_userVolumeCacheFolderPath;
}

- (void)setUserVolumeCacheFolderPath:(id)a3
{
}

- (NSString)userHomePath
{
  return self->_userHomePath;
}

- (void)setUserHomePath:(id)a3
{
}

- (void).cxx_destruct
{
}

@end