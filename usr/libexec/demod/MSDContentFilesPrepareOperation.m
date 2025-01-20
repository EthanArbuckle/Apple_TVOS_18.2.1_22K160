@interface MSDContentFilesPrepareOperation
- (BOOL)_compareManifests;
- (BOOL)_deteremineContentFilesInstallNecessity;
- (BOOL)_generateDeviceManifest;
- (BOOL)_prepareStagingArea;
- (BOOL)_processAlreadyHaveList;
- (BOOL)_restoreStashedStagingToSecondaryStaging;
- (id)methodSelectors;
@end

@implementation MSDContentFilesPrepareOperation

- (id)methodSelectors
{
  if (+[MSDOperationContext downloadOnly](&OBJC_CLASS___MSDOperationContext, "downloadOnly")
    && +[MSDHubFeatureFlags disableBackgroundInstall](&OBJC_CLASS___MSDHubFeatureFlags, "disableBackgroundInstall"))
  {
    v2 = (void *)objc_claimAutoreleasedReturnValue( +[NSValue valueWithPointer:]( &OBJC_CLASS___NSValue,  "valueWithPointer:",  "_deteremineContentFilesInstallNecessity"));
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSValue valueWithPointer:](&OBJC_CLASS___NSValue, "valueWithPointer:", "_generateDeviceManifest"));
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSValue valueWithPointer:](&OBJC_CLASS___NSValue, "valueWithPointer:", "_compareManifests"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:](&OBJC_CLASS___NSArray, "arrayWithObjects:", v2, v3, v4, 0LL));
  }

  else
  {
    v2 = (void *)objc_claimAutoreleasedReturnValue( +[NSValue valueWithPointer:]( &OBJC_CLASS___NSValue,  "valueWithPointer:",  "_deteremineContentFilesInstallNecessity"));
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSValue valueWithPointer:](&OBJC_CLASS___NSValue, "valueWithPointer:", "_prepareStagingArea"));
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSValue valueWithPointer:](&OBJC_CLASS___NSValue, "valueWithPointer:", "_generateDeviceManifest"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSValue valueWithPointer:](&OBJC_CLASS___NSValue, "valueWithPointer:", "_compareManifests"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSValue valueWithPointer:](&OBJC_CLASS___NSValue, "valueWithPointer:", "_processAlreadyHaveList"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:](&OBJC_CLASS___NSArray, "arrayWithObjects:", v2, v3, v4, v6, v7, 0LL));
  }

  return v5;
}

- (BOOL)_deteremineContentFilesInstallNecessity
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MSDOperation context](self, "context"));
  if ([v3 containerized])
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[MSDOperation context](self, "context"));
    v5 = (void *)objc_claimAutoreleasedReturnValue([v4 contentRootPath]);

    if (!v5 && !+[MSDOperationContext downloadOnly](&OBJC_CLASS___MSDOperationContext, "downloadOnly"))
    {
      id v6 = sub_10003A95C();
      v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        v8 = (void *)objc_claimAutoreleasedReturnValue(-[MSDOperation context](self, "context"));
        v9 = (void *)objc_claimAutoreleasedReturnValue([v8 identifier]);
        int v17 = 138543362;
        v18 = v9;
        v10 = "No content root path found for containerized component: %{public}@";
LABEL_10:
        _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, v10, (uint8_t *)&v17, 0xCu);

        goto LABEL_11;
      }

      goto LABEL_11;
    }
  }

  else
  {
  }

  v11 = (void *)objc_claimAutoreleasedReturnValue( +[MSDContentFilesContext processedContainers]( &OBJC_CLASS___MSDContentFilesContext,  "processedContainers"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[MSDOperation context](self, "context"));
  v13 = (void *)objc_claimAutoreleasedReturnValue([v12 uniqueName]);
  unsigned int v14 = [v11 containsObject:v13];

  if (v14)
  {
    id v15 = sub_10003A95C();
    v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v15);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue(-[MSDOperation context](self, "context"));
      v9 = (void *)objc_claimAutoreleasedReturnValue([v8 uniqueName]);
      int v17 = 138543362;
      v18 = v9;
      v10 = "Shared container is already installed: %{public}@";
      goto LABEL_10;
    }

- (BOOL)_prepareStagingArea
{
  v17.receiver = self;
  v17.super_class = (Class)&OBJC_CLASS___MSDContentFilesPrepareOperation;
  if (-[MSDBasePrepareOperation _prepareStagingArea](&v17, "_prepareStagingArea"))
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[MSDHelperAgent sharedInstance](&OBJC_CLASS___MSDHelperAgent, "sharedInstance"));
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[MSDOperation context](self, "context"));
    id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 stashedStagingRootPath]);

    if (!+[MSDOperationContext downloadOnly](&OBJC_CLASS___MSDOperationContext, "downloadOnly")
      && [v4 fileExistsAtPath:v6])
    {
      id v7 = sub_10003A95C();
      v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        v19 = v6;
        _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "Found container already stashed at: %{public}@",  buf,  0xCu);
      }

      unsigned int v9 = -[MSDContentFilesPrepareOperation _restoreStashedStagingToSecondaryStaging]( self,  "_restoreStashedStagingToSecondaryStaging");
      if (os_variant_has_internal_content("com.apple.mobilestoredemod"))
      {
        if ((v9 & 1) == 0)
        {
          v10 = (void *)objc_claimAutoreleasedReturnValue(+[MSDTestPreferences sharedInstance](&OBJC_CLASS___MSDTestPreferences, "sharedInstance"));
          unsigned int v11 = [v10 bailOnStashedStagingRestoreFailure];

          if (v11)
          {
            id v12 = sub_10003A95C();
            v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
            if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
            {
              *(_WORD *)buf = 0;
              _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_DEFAULT,  "Treat stashed staging restore failure as fatal error!",  buf,  2u);
            }

            BOOL v14 = 0;
            goto LABEL_16;
          }

          goto LABEL_15;
        }

- (BOOL)_generateDeviceManifest
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[MSDHelperAgent sharedInstance](&OBJC_CLASS___MSDHelperAgent, "sharedInstance"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[MSDTargetDevice sharedInstance](&OBJC_CLASS___MSDTargetDevice, "sharedInstance"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[MSDOperation context](self, "context"));
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 contentRootPath]);

  if (!v7)
  {
    if (+[MSDOperationContext downloadOnly](&OBJC_CLASS___MSDOperationContext, "downloadOnly"))
    {
      v30 = objc_alloc_init(&OBJC_CLASS___MSDManifest);
      v31 = (void *)objc_claimAutoreleasedReturnValue(-[MSDOperation context](self, "context"));
      [v31 setDeviceManifest:v30];

      BOOL v29 = 1;
      goto LABEL_8;
    }

    id v44 = sub_10003A95C();
    v45 = (os_log_s *)objc_claimAutoreleasedReturnValue(v44);
    if (os_log_type_enabled(v45, OS_LOG_TYPE_ERROR)) {
      sub_100099C50(v45, v46, v47, v48, v49, v50, v51, v52);
    }

LABEL_18:
    BOOL v29 = 0;
    goto LABEL_8;
  }

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[MSDOperation context](self, "context"));
  unsigned int v9 = (void *)objc_claimAutoreleasedReturnValue([v8 uniqueName]);
  v10 = (void *)objc_claimAutoreleasedReturnValue([v9 stringByAppendingPathExtension:@"plist"]);

  unsigned int v11 = (void *)objc_claimAutoreleasedReturnValue( [@"/private/var/mnt/com.apple.mobilestoredemo.storage/com.apple.mobilestoredemo.blob/Metadata/MSDWorkContainer/DeviceManifests" stringByAppendingPathComponent:v10]);
  id v57 = 0LL;
  unsigned __int8 v12 = [v3 createDirectoryAtPath:@"/private/var/mnt/com.apple.mobilestoredemo.storage/com.apple.mobilestoredemo.blob/Metadata/MSDWorkContainer/DeviceManifests" withIntermediateDirectories:1 attributes:0 error:&v57];
  id v13 = v57;
  BOOL v14 = v13;
  if ((v12 & 1) == 0)
  {
    id v33 = sub_10003A95C();
    v34 = (os_log_s *)objc_claimAutoreleasedReturnValue(v33);
    if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR)) {
      sub_100099CB0(v14, v34);
    }

    goto LABEL_18;
  }

  v53 = v13;
  v54 = v10;
  v56 = v3;
  id v15 = (void *)objc_claimAutoreleasedReturnValue(-[MSDOperation context](self, "context"));
  v16 = (void *)objc_claimAutoreleasedReturnValue([v15 rootFileSystemPath]);
  objc_super v17 = (void *)objc_claimAutoreleasedReturnValue(-[MSDOperation context](self, "context"));
  v18 = (void *)objc_claimAutoreleasedReturnValue([v17 contentRootPath]);
  v19 = (void *)objc_claimAutoreleasedReturnValue([v16 stringByAppendingPathComponent:v18]);

  v20 = (void *)objc_claimAutoreleasedReturnValue(-[MSDOperation context](self, "context"));
  v21 = (void *)objc_claimAutoreleasedReturnValue([v20 identifier]);
  v22 = (void *)objc_claimAutoreleasedReturnValue(-[MSDOperation context](self, "context"));
  v23 = v4;
  v24 = (void *)objc_claimAutoreleasedReturnValue([v22 containerType]);
  v55 = v5;
  v25 = (void *)objc_claimAutoreleasedReturnValue([v5 demoUserHomePath]);
  v26 = v23;
  v27 = (void *)objc_claimAutoreleasedReturnValue( [v23 createDeviceManifestForComponent:v21 ofType:v24 withRootPath:v19 userHomePath:v25 andSavePath:v11]);

  if (v27)
  {
    v28 = (void *)objc_claimAutoreleasedReturnValue(-[MSDOperation context](self, "context"));
    [v28 setDeviceManifest:v27];

    BOOL v29 = 1;
  }

  else
  {
    id v35 = sub_10003A95C();
    v36 = (os_log_s *)objc_claimAutoreleasedReturnValue(v35);
    if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR)) {
      sub_100099C80(v36, v37, v38, v39, v40, v41, v42, v43);
    }

    BOOL v29 = 0;
  }

  v5 = v55;
  v3 = v56;
  v4 = v26;
LABEL_8:

  return v29;
}

- (BOOL)_compareManifests
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MSDOperation context](self, "context"));
  v4 = (void *)objc_claimAutoreleasedReturnValue([v3 masterManifest]);

  v31 = self;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MSDOperation context](self, "context"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 deviceManifest]);

  v34 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  v36 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  __int128 v38 = 0u;
  __int128 v39 = 0u;
  __int128 v40 = 0u;
  __int128 v41 = 0u;
  id obj = (id)objc_claimAutoreleasedReturnValue([v4 dict]);
  id v37 = [obj countByEnumeratingWithState:&v38 objects:v46 count:16];
  if (v37)
  {
    uint64_t v7 = *(void *)v39;
    uint64_t v33 = *(void *)v39;
    do
    {
      v8 = 0LL;
      do
      {
        if (*(void *)v39 != v7) {
          objc_enumerationMutation(obj);
        }
        uint64_t v9 = *(void *)(*((void *)&v38 + 1) + 8LL * (void)v8);
        v10 = objc_autoreleasePoolPush();
        unsigned int v11 = (void *)objc_claimAutoreleasedReturnValue([v6 dict]);
        unsigned __int8 v12 = (void *)objc_claimAutoreleasedReturnValue([v11 objectForKey:v9]);

        if (!v12)
        {
          [v36 addObject:v9];
          goto LABEL_19;
        }

        id v13 = (void *)objc_claimAutoreleasedReturnValue([v4 metadataForFile:v9]);
        BOOL v14 = (void *)objc_claimAutoreleasedReturnValue([v6 metadataForFile:v9]);
        id v15 = [v13 compareWith:v14];
        if ((_DWORD)v15 != 5)
        {
          id v18 = v15;
          v19 = v6;
          v20 = v4;
          id v21 = sub_10003A95C();
          v22 = (os_log_s *)objc_claimAutoreleasedReturnValue(v21);
          if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
          {
            v32 = (void *)objc_claimAutoreleasedReturnValue( +[MSDFileMetadata compareResultToNSString:]( &OBJC_CLASS___MSDFileMetadata,  "compareResultToNSString:",  v18));
            *(_DWORD *)buf = 138543618;
            uint64_t v43 = v9;
            __int16 v44 = 2114;
            v45 = v32;
            _os_log_debug_impl( (void *)&_mh_execute_header,  v22,  OS_LOG_TYPE_DEBUG,  "File meta data mismatch: %{public}@ (%{public}@)",  buf,  0x16u);
          }

          if (v18 < 4)
          {
            [v36 addObject:v9];
            id v23 = sub_10003A95C();
            objc_super v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v23);
            if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 138543362;
              uint64_t v43 = v9;
              _os_log_debug_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_DEBUG,  "File found with incorrect metadata; Add to creation list: %{public}@",
                buf,
                0xCu);
            }

            v4 = v20;
            id v6 = v19;
            uint64_t v7 = v33;
            goto LABEL_17;
          }

          v4 = v20;
          id v6 = v19;
          uint64_t v7 = v33;
          if ((_DWORD)v18 != 4) {
            goto LABEL_18;
          }
        }

        [v34 addObject:v9];
        id v16 = sub_10003A95C();
        objc_super v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);
        if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138543362;
          uint64_t v43 = v9;
          _os_log_debug_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_DEBUG,  "Add to already have list: %{public}@",  buf,  0xCu);
        }

- (BOOL)_processAlreadyHaveList
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[MSDContentCacheManager sharedInstance](&OBJC_CLASS___MSDContentCacheManager, "sharedInstance"));
  uint64_t v52 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
  unsigned int v50 = +[MSDOperationContext downloadOnly](&OBJC_CLASS___MSDOperationContext, "downloadOnly");
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MSDOperation context](self, "context"));
  v5 = (void *)objc_claimAutoreleasedReturnValue([v4 contentRootPath]);

  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[MSDOperation context](self, "context"));
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([v6 rootFileSystemPath]);
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[MSDOperation context](self, "context"));
  uint64_t v9 = v8;
  if (v5) {
    uint64_t v10 = objc_claimAutoreleasedReturnValue([v8 contentRootPath]);
  }
  else {
    uint64_t v10 = objc_claimAutoreleasedReturnValue([v8 pseudoContentRootPath]);
  }
  unsigned int v11 = (void *)v10;
  uint64_t v51 = (void *)objc_claimAutoreleasedReturnValue([v7 stringByAppendingPathComponent:v10]);

  __int128 v58 = 0u;
  __int128 v59 = 0u;
  __int128 v56 = 0u;
  __int128 v57 = 0u;
  unsigned __int8 v12 = (void *)objc_claimAutoreleasedReturnValue(-[MSDOperation context](self, "context"));
  id v13 = (void *)objc_claimAutoreleasedReturnValue([v12 alreadyHaveList]);

  id obj = v13;
  id v55 = [v13 countByEnumeratingWithState:&v56 objects:v62 count:16];
  if (v55)
  {
    char v15 = 0;
    uint64_t v54 = *(void *)v57;
    *(void *)&__int128 v14 = 138543362LL;
    __int128 v47 = v14;
    uint64_t v48 = self;
    uint64_t v49 = v3;
LABEL_6:
    uint64_t v16 = 0LL;
    while (1)
    {
      if (*(void *)v57 != v54) {
        objc_enumerationMutation(obj);
      }
      uint64_t v17 = *(void *)(*((void *)&v56 + 1) + 8 * v16);
      id v18 = objc_autoreleasePoolPush();
      v19 = (void *)objc_claimAutoreleasedReturnValue(-[MSDOperation context](self, "context"));
      v20 = (void *)objc_claimAutoreleasedReturnValue([v19 masterManifest]);
      id v21 = (void *)objc_claimAutoreleasedReturnValue([v20 metadataForFile:v17]);

      if (!v21)
      {
        id v43 = sub_10003A95C();
        __int16 v44 = (os_log_s *)objc_claimAutoreleasedReturnValue(v43);
        if (os_log_type_enabled(v44, OS_LOG_TYPE_ERROR)) {
          sub_100099D30();
        }

        objc_autoreleasePoolPop(v18);
        goto LABEL_33;
      }

      v22 = (void *)objc_claimAutoreleasedReturnValue([v21 getFileType]);
      unsigned int v23 = [v22 isEqualToString:NSFileTypeRegular];

      if (!v23) {
        break;
      }
      id v24 = (void *)objc_claimAutoreleasedReturnValue([v21 getHash]);
      v25 = (void *)objc_claimAutoreleasedReturnValue([v24 hexStringRepresentation]);

      v26 = (void *)objc_claimAutoreleasedReturnValue([v3 findFileInCache:v25]);
      if (v26)
      {
        v27 = 0LL;
LABEL_14:
        v28 = 0LL;
        goto LABEL_15;
      }

      v28 = (void *)objc_claimAutoreleasedReturnValue([v51 stringByAppendingPathComponent:v17]);
      BOOL v29 = (void *)objc_claimAutoreleasedReturnValue([v3 fileCachePathFromSourcePath:v28 forBackgroundDownload:v50]);
      v27 = (void *)objc_claimAutoreleasedReturnValue([v29 stringByAppendingPathComponent:v25]);

      v30 = (void *)objc_claimAutoreleasedReturnValue([v21 getAccessControlList]);
      if (v30)
      {
        v31 = (void *)objc_claimAutoreleasedReturnValue([v21 getAccessControlList]);
        BOOL v32 = [v31 length] != 0;
      }

      else
      {
        BOOL v32 = 0;
      }

      if (![v52 isReadableFileAtPath:v28] || v32)
      {
        __int128 v39 = (void *)objc_claimAutoreleasedReturnValue(+[MSDHelperAgent sharedInstance](&OBJC_CLASS___MSDHelperAgent, "sharedInstance", v47));
        __int128 v40 = (void *)objc_claimAutoreleasedReturnValue([v21 getHash]);
        unsigned __int8 v41 = [v39 cloneFile:v28 to:v27 expectingHash:v40];

        if ((v41 & 1) == 0)
        {
LABEL_23:
          id v35 = sub_10003A95C();
          v36 = (os_log_s *)objc_claimAutoreleasedReturnValue(v35);
          if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = v47;
            uint64_t v61 = v17;
            _os_log_error_impl( (void *)&_mh_execute_header,  v36,  OS_LOG_TYPE_ERROR,  "Failed to clone file %{public}@; Adding it to creation list.",
              buf,
              0xCu);
          }

          self = v48;
          id v37 = (void *)objc_claimAutoreleasedReturnValue(-[MSDOperation context](v48, "context"));
          __int128 v38 = (void *)objc_claimAutoreleasedReturnValue([v37 cloneFailedList]);
          [v38 addObject:v17];

          char v15 = 0;
          v3 = v49;
          goto LABEL_15;
        }
      }

      else
      {
        uint64_t v33 = (void *)objc_claimAutoreleasedReturnValue([v21 getHash]);
        unsigned __int8 v34 = [v52 cloneFile:v28 to:v27 expectingHash:v33 correctOwnership:0];

        if ((v34 & 1) == 0) {
          goto LABEL_23;
        }
      }

      char v15 = 1;
      self = v48;
      v3 = v49;
LABEL_15:

      objc_autoreleasePoolPop(v18);
      if (v55 == (id)++v16)
      {
        id v42 = [obj countByEnumeratingWithState:&v56 objects:v62 count:16];
        id v55 = v42;
        if (v42) {
          goto LABEL_6;
        }
        goto LABEL_29;
      }
    }

    v27 = 0LL;
    v25 = 0LL;
    goto LABEL_14;
  }

- (BOOL)_restoreStashedStagingToSecondaryStaging
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[MSDHelperAgent sharedInstance](&OBJC_CLASS___MSDHelperAgent, "sharedInstance"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MSDOperation context](self, "context"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 stashedStagingRootPath]);

  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue( [@"/private/var/mnt/com.apple.mobilestoredemo.storage/com.apple.mobilestoredemo.blob/Metadata" stringByAppendingPathComponent:@"/.MSDWorkContainer"]);
  v8 = (void *)objc_claimAutoreleasedReturnValue([v7 stringByAppendingPathComponent:@"/MSD_stashed_staging"]);
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(-[MSDOperation context](self, "context"));
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([v9 uniqueName]);
  unsigned int v11 = (void *)objc_claimAutoreleasedReturnValue([v8 stringByAppendingPathComponent:v10]);

  unsigned __int8 v12 = (void *)objc_claimAutoreleasedReturnValue(-[MSDOperation context](self, "context"));
  id v13 = (void *)objc_claimAutoreleasedReturnValue([v12 pseudoContentRootPath]);

  v68 = (void *)objc_claimAutoreleasedReturnValue([v6 stringByAppendingPathComponent:v13]);
  __int128 v14 = (void *)objc_claimAutoreleasedReturnValue(-[MSDOperation context](self, "context"));
  char v15 = (void *)objc_claimAutoreleasedReturnValue([v14 secondaryStagingRootPath]);

  uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue(-[MSDOperation context](self, "context"));
  uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue([v16 contentRootPath]);
  uint64_t v65 = objc_claimAutoreleasedReturnValue([v15 stringByAppendingPathComponent:v17]);

  id v18 = sub_10003A95C();
  v19 = (os_log_s *)objc_claimAutoreleasedReturnValue(v18);
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    v73 = v6;
    __int16 v74 = 2114;
    v75 = v15;
    _os_log_impl( (void *)&_mh_execute_header,  v19,  OS_LOG_TYPE_DEFAULT,  "Restoring files from: %{public}@ to: %{public}@",  buf,  0x16u);
  }

  v66 = v15;
  v67 = v13;
  if (v13 && [v4 fileExistsAtPath:v68])
  {
    v20 = (void *)objc_claimAutoreleasedReturnValue(-[MSDOperation context](self, "context"));
    id v21 = (void *)objc_claimAutoreleasedReturnValue([v20 contentRootPath]);
    v22 = (void *)objc_claimAutoreleasedReturnValue([v6 stringByAppendingPathComponent:v21]);

    id v23 = sub_10003A95C();
    id v24 = (os_log_s *)objc_claimAutoreleasedReturnValue(v23);
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      v73 = v68;
      __int16 v74 = 2114;
      v75 = v22;
      _os_log_impl( (void *)&_mh_execute_header,  v24,  OS_LOG_TYPE_DEFAULT,  "Renaming pseudo content content root path from: %{public}@ to: %{public}@",  buf,  0x16u);
    }

    v25 = (void *)objc_claimAutoreleasedReturnValue([v22 stringByDeletingLastPathComponent]);
    id v70 = 0LL;
    unsigned __int8 v26 = [v4 createDirectoryAtPath:v25 withIntermediateDirectories:1 attributes:0 error:&v70];
    id v27 = v70;

    if ((v26 & 1) != 0)
    {
      id v69 = v27;
      v28 = v4;
      unsigned __int8 v29 = [v4 moveItemAtPath:v68 toPath:v22 error:&v69];
      id v30 = v69;

      if ((v29 & 1) != 0)
      {

        v4 = v28;
        char v15 = v66;
        id v13 = v67;
        goto LABEL_10;
      }

      id v62 = sub_10003A95C();
      uint64_t v61 = (os_log_s *)objc_claimAutoreleasedReturnValue(v62);
      if (os_log_type_enabled(v61, OS_LOG_TYPE_ERROR)) {
        sub_100099E28(v30, v61);
      }
      id v27 = v30;
      v4 = v28;
    }

    else
    {
      id v60 = sub_10003A95C();
      uint64_t v61 = (os_log_s *)objc_claimAutoreleasedReturnValue(v60);
      if (os_log_type_enabled(v61, OS_LOG_TYPE_ERROR)) {
        sub_100099EA8();
      }
    }

    char v15 = v66;

    id v13 = v67;
LABEL_27:
    __int128 v38 = (void *)v65;
LABEL_28:

    BOOL v41 = 0;
    goto LABEL_14;
  }

@end