@interface MSDContentFilesInstallOperation
- (BOOL)_addToProcessedContainersIfNeeded;
- (BOOL)_constructStagingArea;
- (BOOL)_createWormholeInStagingToUserHome;
- (BOOL)_moveFilesFromStagingToSecondaryStaging;
- (BOOL)_patchBackupFolderIfNeeded;
- (BOOL)rollback;
- (MSDContentCacheManagerProtocol)contentCacheProtocol;
- (MSDContentFilesInstallOperation)initWithContext:(id)a3;
- (MSDContentFilesInstallOperation)initWithContext:(id)a3 andContentCacheManager:(id)a4 andTargetDevice:(id)a5;
- (MSDTargetDeviceProtocol)targetDeviceDelegate;
- (id)_retrieveContentRootPath;
- (id)methodSelectors;
- (int64_t)type;
- (void)setContentCacheProtocol:(id)a3;
- (void)setTargetDeviceDelegate:(id)a3;
@end

@implementation MSDContentFilesInstallOperation

- (MSDContentFilesInstallOperation)initWithContext:(id)a3
{
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[MSDContentCacheManager sharedInstance](&OBJC_CLASS___MSDContentCacheManager, "sharedInstance"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[MSDTargetDevice sharedInstance](&OBJC_CLASS___MSDTargetDevice, "sharedInstance"));
  v7 = -[MSDContentFilesInstallOperation initWithContext:andContentCacheManager:andTargetDevice:]( self,  "initWithContext:andContentCacheManager:andTargetDevice:",  v4,  v5,  v6);

  return v7;
}

- (MSDContentFilesInstallOperation)initWithContext:(id)a3 andContentCacheManager:(id)a4 andTargetDevice:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  v13.receiver = self;
  v13.super_class = (Class)&OBJC_CLASS___MSDContentFilesInstallOperation;
  v10 = -[MSDOperation initWithContext:](&v13, "initWithContext:", a3);
  v11 = v10;
  if (v10)
  {
    -[MSDContentFilesInstallOperation setContentCacheProtocol:](v10, "setContentCacheProtocol:", v8);
    -[MSDContentFilesInstallOperation setTargetDeviceDelegate:](v11, "setTargetDeviceDelegate:", v9);
  }

  return v11;
}

- (id)methodSelectors
{
  v2 = (void *)objc_claimAutoreleasedReturnValue( +[NSValue valueWithPointer:]( &OBJC_CLASS___NSValue,  "valueWithPointer:",  "_createWormholeInStagingToUserHome"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSValue valueWithPointer:](&OBJC_CLASS___NSValue, "valueWithPointer:", "_constructStagingArea"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSValue valueWithPointer:](&OBJC_CLASS___NSValue, "valueWithPointer:", "_patchBackupFolderIfNeeded"));
  v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSValue valueWithPointer:]( &OBJC_CLASS___NSValue,  "valueWithPointer:",  "_moveFilesFromStagingToSecondaryStaging"));
  v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSValue valueWithPointer:]( &OBJC_CLASS___NSValue,  "valueWithPointer:",  "_addToProcessedContainersIfNeeded"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:](&OBJC_CLASS___NSArray, "arrayWithObjects:", v2, v3, v4, v5, v6, 0LL));

  return v7;
}

- (BOOL)rollback
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MSDOperation context](self, "context"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 stagingRootPath]);

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MSDOperation context](self, "context"));
  v6 = (void *)objc_claimAutoreleasedReturnValue([v5 secondaryStagingRootPath]);

  v7 = (void *)objc_claimAutoreleasedReturnValue(+[MSDHelperAgent sharedInstance](&OBJC_CLASS___MSDHelperAgent, "sharedInstance"));
  unsigned __int8 v8 = [v7 removeWorkDirectory:v4];

  if ((v8 & 1) == 0)
  {
    id v13 = sub_10003A95C();
    v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      goto LABEL_8;
    }
    goto LABEL_9;
  }

  id v9 = (void *)objc_claimAutoreleasedReturnValue(+[MSDHelperAgent sharedInstance](&OBJC_CLASS___MSDHelperAgent, "sharedInstance"));
  unsigned __int8 v10 = [v9 removeWorkDirectory:v6];

  if ((v10 & 1) == 0)
  {
    id v15 = sub_10003A95C();
    v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v15);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
LABEL_8:
    }
      sub_100095FCC();
LABEL_9:

    BOOL v11 = 0;
    goto LABEL_4;
  }

  BOOL v11 = 1;
LABEL_4:

  return v11;
}

- (int64_t)type
{
  return 3LL;
}

- (BOOL)_createWormholeInStagingToUserHome
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[MSDContentFilesInstallOperation targetDeviceDelegate](self, "targetDeviceDelegate"));
  v5 = (__CFString *)objc_claimAutoreleasedReturnValue([v4 demoUserHomePath]);

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[MSDOperation context](self, "context"));
  v7 = (void *)objc_claimAutoreleasedReturnValue([v6 stagingRootPath]);
  unsigned __int8 v8 = (void *)objc_claimAutoreleasedReturnValue([v7 stringByAppendingPathComponent:v5]);

  if (+[MSDOperationContext downloadOnly](&OBJC_CLASS___MSDOperationContext, "downloadOnly")) {
    id v9 = @"/private/var/mnt/com.apple.mobilestoredemo.storage/com.apple.mobilestoredemo.blob/Metadata";
  }
  else {
    id v9 = v5;
  }
  unsigned __int8 v10 = (void *)objc_claimAutoreleasedReturnValue( -[__CFString stringByAppendingPathComponent:]( v9,  "stringByAppendingPathComponent:",  @"/.MSDWorkContainer"));
  BOOL v11 = (void *)objc_claimAutoreleasedReturnValue([v10 stringByAppendingPathComponent:@"/MSD_staging"]);
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[MSDOperation context](self, "context"));
  id v13 = (void *)objc_claimAutoreleasedReturnValue([v12 uniqueName]);
  v14 = (void *)objc_claimAutoreleasedReturnValue([v11 stringByAppendingPathComponent:v13]);

  id v15 = (void *)objc_claimAutoreleasedReturnValue([v10 stringByAppendingPathComponent:@"/MSD_secondary_staging"]);
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[MSDOperation context](self, "context"));
  v17 = (void *)objc_claimAutoreleasedReturnValue([v16 uniqueName]);
  v18 = (void *)objc_claimAutoreleasedReturnValue([v15 stringByAppendingPathComponent:v17]);

  id v19 = sub_10003A95C();
  v20 = (os_log_s *)objc_claimAutoreleasedReturnValue(v19);
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    v45 = v8;
    __int16 v46 = 2114;
    v47 = v14;
    _os_log_impl( (void *)&_mh_execute_header,  v20,  OS_LOG_TYPE_DEFAULT,  "Creating wormhole in staging from %{public}@ to %{public}@...",  buf,  0x16u);
  }

  v21 = (void *)objc_claimAutoreleasedReturnValue([v8 stringByDeletingLastPathComponent]);
  id v43 = 0LL;
  unsigned __int8 v22 = [v3 createDirectoryAtPath:v21 withIntermediateDirectories:1 attributes:0 error:&v43];
  id v23 = v43;

  if ((v22 & 1) == 0)
  {
    id v33 = sub_10003A95C();
    v34 = (os_log_s *)objc_claimAutoreleasedReturnValue(v33);
    if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR)) {
      sub_1000961B8(v23, v34);
    }
    goto LABEL_26;
  }

  id v42 = v23;
  unsigned __int8 v24 = [v3 createDirectoryAtPath:v14 withIntermediateDirectories:1 attributes:0 error:&v42];
  id v25 = v42;

  if ((v24 & 1) == 0)
  {
    id v35 = sub_10003A95C();
    v34 = (os_log_s *)objc_claimAutoreleasedReturnValue(v35);
    if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR)) {
      sub_100096134((uint64_t)v14, v25);
    }
    goto LABEL_25;
  }

  id v41 = v25;
  unsigned __int8 v26 = [v3 createDirectoryAtPath:v18 withIntermediateDirectories:1 attributes:0 error:&v41];
  id v23 = v41;

  if ((v26 & 1) == 0)
  {
    id v36 = sub_10003A95C();
    v34 = (os_log_s *)objc_claimAutoreleasedReturnValue(v36);
    if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR)) {
      sub_100096134((uint64_t)v18, v23);
    }
    goto LABEL_26;
  }

  v27 = (void *)objc_claimAutoreleasedReturnValue([v3 destinationOfSymbolicLinkAtPath:v8 error:0]);

  if (v27)
  {
    id v40 = v23;
    unsigned __int8 v28 = [v3 removeItemAtPath:v8 error:&v40];
    id v25 = v40;

    if ((v28 & 1) != 0)
    {
      id v23 = v25;
      goto LABEL_12;
    }

    id v38 = sub_10003A95C();
    v34 = (os_log_s *)objc_claimAutoreleasedReturnValue(v38);
    if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR)) {
      sub_1000960B4(v25, v34);
    }
LABEL_25:
    id v23 = v25;
LABEL_26:

    BOOL v31 = 0;
    goto LABEL_14;
  }

- (BOOL)_constructStagingArea
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MSDOperation context](self, "context"));
  v86 = (void *)objc_claimAutoreleasedReturnValue([v2 stagingRootPath]);

  v85 = (void *)objc_claimAutoreleasedReturnValue(-[MSDContentFilesInstallOperation _retrieveContentRootPath](self, "_retrieveContentRootPath"));
  v91 = (void *)objc_claimAutoreleasedReturnValue([v86 stringByAppendingPathComponent:v85]);
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MSDOperation context](self, "context"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 masterManifest]);
  v5 = (void *)objc_claimAutoreleasedReturnValue([v4 dict]);
  v6 = (void *)objc_claimAutoreleasedReturnValue([v5 allKeys]);

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[MSDOperation context](self, "context"));
  v90 = (void *)objc_claimAutoreleasedReturnValue([v7 masterManifest]);

  v146[0] = 0LL;
  v146[1] = v146;
  v146[2] = 0x3032000000LL;
  v146[3] = sub_1000309E4;
  v146[4] = sub_1000309F4;
  id v147 = (id)objc_claimAutoreleasedReturnValue(-[MSDContentFilesInstallOperation contentCacheProtocol](self, "contentCacheProtocol"));
  uint64_t v140 = 0LL;
  v141 = &v140;
  uint64_t v142 = 0x3032000000LL;
  v143 = sub_1000309E4;
  v144 = sub_1000309F4;
  id v145 = (id)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
  v138[0] = 0LL;
  v138[1] = v138;
  v138[2] = 0x2020000000LL;
  unsigned __int8 v8 = (void *)objc_claimAutoreleasedReturnValue(-[MSDOperation context](self, "context"));
  LOBYTE(v4) = [v8 verifyFileHash];

  char v139 = (char)v4;
  uint64_t v134 = 0LL;
  v135 = &v134;
  uint64_t v136 = 0x2020000000LL;
  char v137 = 1;
  uint64_t v128 = 0LL;
  v129 = &v128;
  uint64_t v130 = 0x3032000000LL;
  v131 = sub_1000309E4;
  v132 = sub_1000309F4;
  id v133 = 0LL;
  v92 = objc_alloc_init(&OBJC_CLASS___NSMutableSet);
  uint64_t v122 = 0LL;
  v123 = &v122;
  uint64_t v124 = 0x3032000000LL;
  v125 = sub_1000309E4;
  v126 = sub_1000309F4;
  v127 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  uint64_t v116 = 0LL;
  v117 = &v116;
  uint64_t v118 = 0x3032000000LL;
  v119 = sub_1000309E4;
  v120 = sub_1000309F4;
  id v121 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  uint64_t v110 = 0LL;
  v111 = &v110;
  uint64_t v112 = 0x3032000000LL;
  v113 = sub_1000309E4;
  v114 = sub_1000309F4;
  v115 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  uint64_t v104 = 0LL;
  v105 = &v104;
  uint64_t v106 = 0x3032000000LL;
  v107 = sub_1000309E4;
  v108 = sub_1000309F4;
  id v109 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  __int128 v100 = 0u;
  __int128 v101 = 0u;
  __int128 v102 = 0u;
  __int128 v103 = 0u;
  id obj = v6;
  id v9 = [obj countByEnumeratingWithState:&v100 objects:v153 count:16];
  if (v9)
  {
    uint64_t v89 = *(void *)v101;
    *(void *)&__int128 v10 = 138543362LL;
    __int128 v84 = v10;
LABEL_3:
    uint64_t v11 = 0LL;
    while (1)
    {
      if (*(void *)v101 != v89) {
        objc_enumerationMutation(obj);
      }
      uint64_t v12 = *(void *)(*((void *)&v100 + 1) + 8 * v11);
      id v13 = objc_autoreleasePoolPush();
      v14 = (void *)objc_claimAutoreleasedReturnValue([v91 stringByAppendingPathComponent:v12]);
      id v15 = (void *)objc_claimAutoreleasedReturnValue([v14 stringByDeletingLastPathComponent]);
      v16 = (void *)objc_claimAutoreleasedReturnValue([v90 metadataForFile:v12]);
      v17 = v16;
      if (!v16) {
        break;
      }
      v18 = (void *)objc_claimAutoreleasedReturnValue([v16 getFileType]);
      -[NSMutableSet addObject:](v92, "addObject:", v15);
      if ([v18 isEqualToString:NSFileTypeDirectory])
      {
        -[NSMutableSet addObject:](v92, "addObject:", v14);
      }

      else
      {
        if ([v18 isEqualToString:NSFileTypeSymbolicLink])
        {
          [(id)v111[5] addObject:v14];
          v20 = (void *)v105[5];
          v21 = (os_log_s *)objc_claimAutoreleasedReturnValue([v17 getTargetFile]);
          [v20 setObject:v21 forKey:v14];
          goto LABEL_17;
        }

        if (![v18 isEqualToString:NSFileTypeRegular])
        {
          id v25 = sub_10003A95C();
          v21 = (os_log_s *)objc_claimAutoreleasedReturnValue(v25);
          if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138543618;
            uint64_t v150 = v12;
            __int16 v151 = 2114;
            v152 = v18;
            _os_log_impl( (void *)&_mh_execute_header,  v21,  OS_LOG_TYPE_DEFAULT,  "Ignore path %{public}@ of unexpected file type %{public}@",  buf,  0x16u);
          }

- (BOOL)_patchBackupFolderIfNeeded
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MSDOperation context](self, "context"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 identifier]);

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MSDOperation context](self, "context"));
  v6 = (void *)objc_claimAutoreleasedReturnValue([v5 containerType]);

  return 1;
}

- (BOOL)_moveFilesFromStagingToSecondaryStaging
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MSDOperation context](self, "context"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 stagingRootPath]);

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MSDOperation context](self, "context"));
  v6 = (void *)objc_claimAutoreleasedReturnValue([v5 secondaryStagingRootPath]);

  id v7 = sub_10003A95C();
  unsigned __int8 v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v12 = 138543618;
    id v13 = v4;
    __int16 v14 = 2114;
    id v15 = v6;
    _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "Moving files from %{public}@ to %{public}@.",  (uint8_t *)&v12,  0x16u);
  }

  id v9 = (void *)objc_claimAutoreleasedReturnValue(-[MSDContentFilesInstallOperation targetDeviceDelegate](self, "targetDeviceDelegate"));
  unsigned __int8 v10 = [v9 moveFilesToFinalDst:v4 finalPath:v6];

  return v10;
}

- (BOOL)_addToProcessedContainersIfNeeded
{
  v3 = (void *)objc_claimAutoreleasedReturnValue( +[MSDContentFilesContext processedContainers]( &OBJC_CLASS___MSDContentFilesContext,  "processedContainers"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[MSDOperation context](self, "context"));
  v5 = (void *)objc_claimAutoreleasedReturnValue([v4 uniqueName]);

  if (([v3 containsObject:v5] & 1) == 0)
  {
    id v6 = sub_10003A95C();
    id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      int v9 = 138543362;
      unsigned __int8 v10 = v5;
      _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "Adding to processed containers: %{public}@",  (uint8_t *)&v9,  0xCu);
    }

    [v3 addObject:v5];
  }

  return 1;
}

- (id)_retrieveContentRootPath
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MSDOperation context](self, "context"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 contentRootPath]);

  if (!v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[MSDOperation context](self, "context"));
    id v4 = (void *)objc_claimAutoreleasedReturnValue([v5 pseudoContentRootPath]);
  }

  return v4;
}

- (MSDContentCacheManagerProtocol)contentCacheProtocol
{
  return (MSDContentCacheManagerProtocol *)self->super._checkpointBarrier;
}

- (void)setContentCacheProtocol:(id)a3
{
}

- (MSDTargetDeviceProtocol)targetDeviceDelegate
{
  return self->super._observer;
}

- (void)setTargetDeviceDelegate:(id)a3
{
}

- (void).cxx_destruct
{
}

@end