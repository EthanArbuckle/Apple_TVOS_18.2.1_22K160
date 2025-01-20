@interface SUCoreDocumentationDataManager
+ (id)_sharedManagerInitWithPath:(id)a3;
+ (id)sharedManager;
+ (void)setupSharedManagerWithStashPath:(id)a3;
- (BOOL)cleanupNonInstalledDocumentationWithError:(id *)a3;
- (BOOL)queue_cleanupNonInstalledDocumentationWithError:(id *)a3;
- (BOOL)queue_evictStashIfNecessary:(id *)a3;
- (BOOL)queue_getDocumentation:(id *)a3 documentationData:(id *)a4 forInstalledUpdateType:(unint64_t)a5 withError:(id *)a6;
- (BOOL)queue_stashDocumentationAssetData:(id)a3 forBuildVersion:(id)a4 error:(id *)a5;
- (BOOL)stashDocumentationAssetData:(id)a3 forBuildVersion:(id)a4 error:(id *)a5;
- (NSString)documentationPath;
- (OS_dispatch_queue)stateQueue;
- (SUCoreDocumentationDataManager)init;
- (SUCoreDocumentationDataManager)initWithStashPath:(id)a3;
- (id)description;
- (id)getDocumentationDataForInstalledUpdateType:(unint64_t)a3 withError:(id *)a4;
- (id)getDocumentationForInstalledUpdateType:(unint64_t)a3 withError:(id *)a4;
- (id)installedBuildVersionsWithError:(id *)a3;
- (id)stashedDataDirectoryForBuildVersion:(id)a3;
- (void)setDocumentationPath:(id)a3;
@end

@implementation SUCoreDocumentationDataManager

- (SUCoreDocumentationDataManager)init
{
  return -[SUCoreDocumentationDataManager initWithStashPath:]( self,  "initWithStashPath:",  @"/var/MobileSoftwareUpdate/Controller/SoftwareUpdateCore/Documentation");
}

- (SUCoreDocumentationDataManager)initWithStashPath:(id)a3
{
  uint64_t v17 = *MEMORY[0x1895F89C0];
  v4 = (__CFString *)a3;
  v14.receiver = self;
  v14.super_class = (Class)&OBJC_CLASS___SUCoreDocumentationDataManager;
  v5 = -[SUCoreDocumentationDataManager init](&v14, sel_init);
  if (v5)
  {
    dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v6 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue();
    dispatch_queue_t v7 = dispatch_queue_create("com.apple.su.installedDocManager", v6);
    stateQueue = v5->_stateQueue;
    v5->_stateQueue = (OS_dispatch_queue *)v7;

    if (v4) {
      v9 = v4;
    }
    else {
      v9 = @"/var/MobileSoftwareUpdate/Controller/SoftwareUpdateCore/Documentation";
    }
    objc_storeStrong((id *)&v5->_documentationPath, v9);
  }

  [MEMORY[0x1896127A0] sharedLogger];
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  [v10 oslog];
  v11 = (os_log_s *)objc_claimAutoreleasedReturnValue();

  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    v12 = -[SUCoreDocumentationDataManager documentationPath](v5, "documentationPath");
    *(_DWORD *)buf = 138543362;
    v16 = v12;
    _os_log_impl( &dword_187A54000,  v11,  OS_LOG_TYPE_DEFAULT,  "[SUCoreDocumentationDataManager] Created SUCoreDocumentationDataManager with stash path: %{public}@",  buf,  0xCu);
  }

  return v5;
}

+ (id)sharedManager
{
  return +[SUCoreDocumentationDataManager _sharedManagerInitWithPath:]( &OBJC_CLASS___SUCoreDocumentationDataManager,  "_sharedManagerInitWithPath:",  0LL);
}

+ (void)setupSharedManagerWithStashPath:(id)a3
{
  id v3 =  +[SUCoreDocumentationDataManager _sharedManagerInitWithPath:]( &OBJC_CLASS___SUCoreDocumentationDataManager,  "_sharedManagerInitWithPath:",  a3);
}

+ (id)_sharedManagerInitWithPath:(id)a3
{
  id v3 = a3;
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = __61__SUCoreDocumentationDataManager__sharedManagerInitWithPath___block_invoke;
  block[3] = &unk_18A0EF970;
  id v9 = v3;
  uint64_t v4 = _sharedManagerInitWithPath__onceDocumentationDataManager;
  id v5 = v3;
  if (v4 != -1) {
    dispatch_once(&_sharedManagerInitWithPath__onceDocumentationDataManager, block);
  }
  id v6 = (id)_sharedManagerInitWithPath____dataManager;

  return v6;
}

void __61__SUCoreDocumentationDataManager__sharedManagerInitWithPath___block_invoke(uint64_t a1)
{
  v1 = -[SUCoreDocumentationDataManager initWithStashPath:]( objc_alloc(&OBJC_CLASS___SUCoreDocumentationDataManager),  "initWithStashPath:",  *(void *)(a1 + 32));
  v2 = (void *)_sharedManagerInitWithPath____dataManager;
  _sharedManagerInitWithPath____dataManager = (uint64_t)v1;
}

- (BOOL)stashDocumentationAssetData:(id)a3 forBuildVersion:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  uint64_t v26 = 0LL;
  v27 = &v26;
  uint64_t v28 = 0x2020000000LL;
  char v29 = 0;
  uint64_t v20 = 0LL;
  v21 = &v20;
  uint64_t v22 = 0x3032000000LL;
  v23 = __Block_byref_object_copy__8;
  v24 = __Block_byref_object_dispose__8;
  id v25 = 0LL;
  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_stateQueue);
  if (a5) {
    *a5 = 0LL;
  }
  stateQueue = self->_stateQueue;
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = __84__SUCoreDocumentationDataManager_stashDocumentationAssetData_forBuildVersion_error___block_invoke;
  block[3] = &unk_18A0F0FC8;
  v18 = &v26;
  void block[4] = self;
  id v11 = v8;
  id v16 = v11;
  id v12 = v9;
  id v17 = v12;
  v19 = &v20;
  dispatch_sync((dispatch_queue_t)stateQueue, block);
  if (a5) {
    *a5 = (id) v21[5];
  }
  char v13 = *((_BYTE *)v27 + 24);

  _Block_object_dispose(&v20, 8);
  _Block_object_dispose(&v26, 8);

  return v13;
}

void __84__SUCoreDocumentationDataManager_stashDocumentationAssetData_forBuildVersion_error___block_invoke( void *a1)
{
  v2 = (void *)a1[4];
  uint64_t v3 = a1[5];
  uint64_t v4 = a1[6];
  uint64_t v5 = *(void *)(a1[8] + 8LL);
  id obj = *(id *)(v5 + 40);
  char v6 = objc_msgSend(v2, "queue_stashDocumentationAssetData:forBuildVersion:error:", v3, v4, &obj);
  objc_storeStrong((id *)(v5 + 40), obj);
  *(_BYTE *)(*(void *)(a1[7] + 8LL) + 24LL) = v6;
}

- (id)getDocumentationDataForInstalledUpdateType:(unint64_t)a3 withError:(id *)a4
{
  uint64_t v17 = 0LL;
  v18 = &v17;
  uint64_t v19 = 0x3032000000LL;
  uint64_t v20 = __Block_byref_object_copy__8;
  v21 = __Block_byref_object_dispose__8;
  id v22 = 0LL;
  uint64_t v11 = 0LL;
  id v12 = &v11;
  uint64_t v13 = 0x3032000000LL;
  objc_super v14 = __Block_byref_object_copy__8;
  v15 = __Block_byref_object_dispose__8;
  id v16 = 0LL;
  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_stateQueue);
  if (a4) {
    *a4 = 0LL;
  }
  stateQueue = self->_stateQueue;
  v10[0] = MEMORY[0x1895F87A8];
  v10[1] = 3221225472LL;
  v10[2] = __87__SUCoreDocumentationDataManager_getDocumentationDataForInstalledUpdateType_withError___block_invoke;
  v10[3] = &unk_18A0F0FF0;
  v10[4] = self;
  v10[5] = &v11;
  v10[6] = &v17;
  v10[7] = a3;
  dispatch_sync((dispatch_queue_t)stateQueue, v10);
  if (a4) {
    *a4 = (id) v18[5];
  }
  id v8 = (id)v12[5];
  _Block_object_dispose(&v11, 8);

  _Block_object_dispose(&v17, 8);
  return v8;
}

void __87__SUCoreDocumentationDataManager_getDocumentationDataForInstalledUpdateType_withError___block_invoke( void *a1)
{
  v1 = (void *)a1[4];
  uint64_t v2 = *(void *)(a1[5] + 8LL);
  uint64_t v3 = *(void **)(v2 + 40);
  uint64_t v4 = a1[7];
  uint64_t v5 = *(void *)(a1[6] + 8LL);
  id v6 = *(id *)(v5 + 40);
  id obj = v3;
  objc_msgSend(v1, "queue_getDocumentation:documentationData:forInstalledUpdateType:withError:", 0, &obj, v4, &v6);
  objc_storeStrong((id *)(v2 + 40), obj);
  objc_storeStrong((id *)(v5 + 40), v6);
}

- (id)getDocumentationForInstalledUpdateType:(unint64_t)a3 withError:(id *)a4
{
  uint64_t v17 = 0LL;
  v18 = &v17;
  uint64_t v19 = 0x3032000000LL;
  uint64_t v20 = __Block_byref_object_copy__8;
  v21 = __Block_byref_object_dispose__8;
  id v22 = 0LL;
  uint64_t v11 = 0LL;
  id v12 = &v11;
  uint64_t v13 = 0x3032000000LL;
  objc_super v14 = __Block_byref_object_copy__8;
  v15 = __Block_byref_object_dispose__8;
  id v16 = 0LL;
  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_stateQueue);
  if (a4) {
    *a4 = 0LL;
  }
  stateQueue = self->_stateQueue;
  v10[0] = MEMORY[0x1895F87A8];
  v10[1] = 3221225472LL;
  v10[2] = __83__SUCoreDocumentationDataManager_getDocumentationForInstalledUpdateType_withError___block_invoke;
  v10[3] = &unk_18A0F0FF0;
  v10[4] = self;
  v10[5] = &v11;
  v10[6] = &v17;
  v10[7] = a3;
  dispatch_sync((dispatch_queue_t)stateQueue, v10);
  if (a4) {
    *a4 = (id) v18[5];
  }
  id v8 = (id)v12[5];
  _Block_object_dispose(&v11, 8);

  _Block_object_dispose(&v17, 8);
  return v8;
}

void __83__SUCoreDocumentationDataManager_getDocumentationForInstalledUpdateType_withError___block_invoke( void *a1)
{
  v1 = (void *)a1[4];
  uint64_t v2 = *(void *)(a1[5] + 8LL);
  uint64_t v3 = *(void **)(v2 + 40);
  uint64_t v4 = a1[7];
  uint64_t v5 = *(void *)(a1[6] + 8LL);
  id v6 = *(id *)(v5 + 40);
  id obj = v3;
  objc_msgSend(v1, "queue_getDocumentation:documentationData:forInstalledUpdateType:withError:", &obj, 0, v4, &v6);
  objc_storeStrong((id *)(v2 + 40), obj);
  objc_storeStrong((id *)(v5 + 40), v6);
}

- (BOOL)cleanupNonInstalledDocumentationWithError:(id *)a3
{
  uint64_t v15 = 0LL;
  id v16 = &v15;
  uint64_t v17 = 0x2020000000LL;
  char v18 = 0;
  uint64_t v9 = 0LL;
  v10 = &v9;
  uint64_t v11 = 0x3032000000LL;
  id v12 = __Block_byref_object_copy__8;
  uint64_t v13 = __Block_byref_object_dispose__8;
  id v14 = 0LL;
  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_stateQueue);
  if (a3) {
    *a3 = 0LL;
  }
  stateQueue = self->_stateQueue;
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = __76__SUCoreDocumentationDataManager_cleanupNonInstalledDocumentationWithError___block_invoke;
  block[3] = &unk_18A0F0630;
  void block[4] = self;
  void block[5] = &v15;
  block[6] = &v9;
  dispatch_sync((dispatch_queue_t)stateQueue, block);
  if (a3) {
    *a3 = (id) v10[5];
  }
  char v6 = *((_BYTE *)v16 + 24);
  _Block_object_dispose(&v9, 8);

  _Block_object_dispose(&v15, 8);
  return v6;
}

void __76__SUCoreDocumentationDataManager_cleanupNonInstalledDocumentationWithError___block_invoke( void *a1)
{
  uint64_t v2 = (void *)a1[4];
  uint64_t v3 = *(void *)(a1[6] + 8LL);
  id obj = *(id *)(v3 + 40);
  char v4 = objc_msgSend(v2, "queue_cleanupNonInstalledDocumentationWithError:", &obj);
  objc_storeStrong((id *)(v3 + 40), obj);
  *(_BYTE *)(*(void *)(a1[5] + 8LL) + 24LL) = v4;
}

- (BOOL)queue_stashDocumentationAssetData:(id)a3 forBuildVersion:(id)a4 error:(id *)a5
{
  uint64_t v63 = *MEMORY[0x1895F89C0];
  id v8 = a3;
  id v9 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_stateQueue);
  if (a5) {
    *a5 = 0LL;
  }
  [MEMORY[0x1896127A0] sharedLogger];
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  [v10 oslog];
  uint64_t v11 = (os_log_s *)objc_claimAutoreleasedReturnValue();

  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    id v58 = v8;
    __int16 v59 = 2114;
    id v60 = v9;
    _os_log_impl( &dword_187A54000,  v11,  OS_LOG_TYPE_DEFAULT,  "[SUCoreDocumentationDataManager] Stashing documentation asset: %{public}@ for build version: %{public}@",  buf,  0x16u);
  }

  [MEMORY[0x1896078A8] defaultManager];
  id v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v12)
  {
    id v22 = (void *)MEMORY[0x189607870];
    v23 = @"Failed to create NSFileManager";
    uint64_t v24 = 9000LL;
LABEL_13:
    [v22 buildAndLogCheckedSUCoreError:v24 underlying:0 description:v23];
    id v25 = (void *)objc_claimAutoreleasedReturnValue();
    id v20 = v25;
    if (!a5)
    {
      char v21 = 0;
      uint64_t v15 = 0LL;
      goto LABEL_33;
    }

    id v26 = v25;
    id v20 = v26;
    char v21 = 0;
    uint64_t v15 = 0LL;
LABEL_32:
    *a5 = v26;
    goto LABEL_33;
  }

  uint64_t v13 = (void *)MEMORY[0x189604030];
  -[SUCoreDocumentationDataManager stashedDataDirectoryForBuildVersion:]( self,  "stashedDataDirectoryForBuildVersion:",  v9);
  id v14 = (void *)objc_claimAutoreleasedReturnValue();
  [v13 fileURLWithPath:v14];
  uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v15)
  {
    id v22 = (void *)MEMORY[0x189607870];
    v23 = @"Failed to create stashURL";
    uint64_t v24 = 9004LL;
    goto LABEL_13;
  }

  [v15 path];
  id v16 = (void *)objc_claimAutoreleasedReturnValue();
  int v17 = [v12 fileExistsAtPath:v16];

  if (v17)
  {
    [MEMORY[0x1896127A0] sharedLogger];
    char v18 = (void *)objc_claimAutoreleasedReturnValue();
    [v18 oslog];
    uint64_t v19 = (os_log_s *)objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v58 = v9;
      _os_log_impl( &dword_187A54000,  v19,  OS_LOG_TYPE_DEFAULT,  "[SUCoreDocumentationDataManager] Documentation data already stashed for build version %@",  buf,  0xCu);
    }

    id v20 = 0LL;
    char v21 = 1;
    goto LABEL_33;
  }

  id v56 = 0LL;
  BOOL v27 = -[SUCoreDocumentationDataManager queue_evictStashIfNecessary:](self, "queue_evictStashIfNecessary:", &v56);
  id v28 = v56;
  if (!v27)
  {
    [MEMORY[0x1896127A0] sharedLogger];
    char v29 = (void *)objc_claimAutoreleasedReturnValue();
    [v29 oslog];
    v30 = (os_log_s *)objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR)) {
      -[SUCoreDocumentationDataManager queue_stashDocumentationAssetData:forBuildVersion:error:].cold.1( (uint64_t)v28,  v30,  v31,  v32,  v33,  v34,  v35,  v36);
    }
  }

  if (([v8 refreshState] & 1) == 0)
  {
    v49 = (void *)MEMORY[0x189607870];
    v50 = @"Failed to refresh documentation asset";
    uint64_t v51 = 9011LL;
    goto LABEL_30;
  }

  if (([v8 wasLocal] & 1) == 0)
  {
    v49 = (void *)MEMORY[0x189607870];
    v50 = @"Documentation asset is not local";
    uint64_t v51 = 9012LL;
LABEL_30:
    [v49 buildAndLogCheckedSUCoreError:v51 underlying:v28 description:v50];
    id v20 = (id)objc_claimAutoreleasedReturnValue();

    if (!a5)
    {
LABEL_35:
      char v21 = 0;
      goto LABEL_33;
    }

    goto LABEL_31;
  }

  id v55 = v28;
  char v37 = [v12 createDirectoryAtURL:v15 withIntermediateDirectories:1 attributes:0 error:&v55];
  id v38 = v55;

  if ((v37 & 1) == 0)
  {
    [MEMORY[0x189607870] buildAndLogCheckedSUCoreError:9004 underlying:v38 description:@"Failed to create documentation data stash directory"];
    id v20 = (id)objc_claimAutoreleasedReturnValue();

    if (!a5) {
      goto LABEL_35;
    }
LABEL_31:
    id v26 = v20;
    id v20 = v26;
    char v21 = 0;
    goto LABEL_32;
  }

  [v8 getLocalUrl];
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  [v39 URLByDeletingLastPathComponent];
  v40 = (void *)objc_claimAutoreleasedReturnValue();

  [v40 lastPathComponent];
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v42 = [v15 URLByAppendingPathComponent:v41];

  v43 = (void *)v42;
  [MEMORY[0x1896127A0] sharedLogger];
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  [v44 oslog];
  v45 = (os_log_s *)objc_claimAutoreleasedReturnValue();

  if (os_log_type_enabled(v45, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543874;
    id v58 = v9;
    __int16 v59 = 2114;
    id v60 = v40;
    __int16 v61 = 2114;
    v62 = v43;
    _os_log_impl( &dword_187A54000,  v45,  OS_LOG_TYPE_DEFAULT,  "[SUCoreDocumentationDataManager] Copying documentation asset for %{public}@ from %{public}@ to %{public}@",  buf,  0x20u);
  }

  id v54 = v38;
  char v21 = [v12 copyItemAtURL:v40 toURL:v43 error:&v54];
  id v20 = v54;

  if ((v21 & 1) == 0)
  {
    v46 = (void *)MEMORY[0x189607870];
    v53 = v43;
    [NSString stringWithFormat:@"Failed to copy from \"%@\" to \"%@\"", 0, v15];
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    [v46 buildAndLogCheckedSUCoreError:9002 underlying:v20 description:v47];
    v48 = (void *)objc_claimAutoreleasedReturnValue();

    if (a5)
    {
      id v20 = v48;
      *a5 = v20;
    }

    else
    {
      id v20 = v48;
    }

    v43 = v53;
  }

LABEL_33:
  return v21;
}

- (BOOL)queue_getDocumentation:(id *)a3 documentationData:(id *)a4 forInstalledUpdateType:(unint64_t)a5 withError:(id *)a6
{
  uint64_t v105 = *MEMORY[0x1895F89C0];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_stateQueue);
  if (a3) {
    *a3 = 0LL;
  }
  if (a4) {
    *a4 = 0LL;
  }
  v82 = a4;
  if (a6) {
    *a6 = 0LL;
  }
  [MEMORY[0x189612770] sharedDevice];
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v11 = v10;
  if (a5 == 1)
  {
    if ([v10 hasSplatOnlyUpdateInstalled])
    {
    }

    else
    {
      [MEMORY[0x189612770] sharedDevice];
      uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue();
      char v14 = [v13 hasSemiSplatActive];

      if ((v14 & 1) == 0)
      {
        [MEMORY[0x189607870] buildAndLogCheckedSUCoreError:9009 underlying:0 description:@"Splat update not installed. No documentation data found for splat update"];
        v78 = (void *)objc_claimAutoreleasedReturnValue();
        id v65 = v78;
        if (a6)
        {
          id v65 = v78;
          BOOL v67 = 0;
          *a6 = v65;
        }

        else
        {
          BOOL v67 = 0;
        }

        goto LABEL_52;
      }
    }

    [MEMORY[0x189612770] sharedDevice];
    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v12 = [v11 splatCryptex1BuildVersion];
  }

  else
  {
    uint64_t v12 = [v10 buildVersion];
  }

  uint64_t v15 = (void *)v12;
  v91 = -[SUCoreDocumentationDataManager stashedDataDirectoryForBuildVersion:]( self,  "stashedDataDirectoryForBuildVersion:",  v15);
  if (v91)
  {
    v81 = a3;
    v83 = v15;
    __int128 v96 = 0u;
    __int128 v97 = 0u;
    __int128 v94 = 0u;
    __int128 v95 = 0u;
    [MEMORY[0x1896078A8] defaultManager];
    id v16 = (void *)objc_claimAutoreleasedReturnValue();
    id v93 = 0LL;
    [v16 contentsOfDirectoryAtPath:v91 error:&v93];
    int v17 = (void *)objc_claimAutoreleasedReturnValue();
    id v80 = v93;

    id obj = v17;
    uint64_t v89 = [v17 countByEnumeratingWithState:&v94 objects:v104 count:16];
    char v18 = 0LL;
    uint64_t v19 = 0LL;
    if (!v89) {
      goto LABEL_31;
    }
    uint64_t v88 = *(void *)v95;
    uint64_t v84 = *MEMORY[0x189612808];
    uint64_t v85 = *MEMORY[0x189612850];
    while (1)
    {
      uint64_t v20 = 0LL;
      char v21 = v18;
      id v22 = v19;
      do
      {
        if (*(void *)v95 != v88) {
          objc_enumerationMutation(obj);
        }
        uint64_t v23 = *(void *)(*((void *)&v94 + 1) + 8 * v20);
        uint64_t v24 = (void *)MEMORY[0x189604030];
        v103[0] = v91;
        v103[1] = v23;
        v103[2] = @"AssetData";
        [MEMORY[0x189603F18] arrayWithObjects:v103 count:3];
        id v25 = (void *)objc_claimAutoreleasedReturnValue();
        uint64_t v26 = [v24 fileURLWithPathComponents:v25];

        BOOL v27 = (void *)MEMORY[0x189604030];
        v102[0] = v91;
        v102[1] = v23;
        v102[2] = @"Info.plist";
        [MEMORY[0x189603F18] arrayWithObjects:v102 count:3];
        id v28 = (void *)objc_claimAutoreleasedReturnValue();
        [v27 fileURLWithPathComponents:v28];
        char v29 = (void *)objc_claimAutoreleasedReturnValue();

        [MEMORY[0x189603F68] dictionaryWithContentsOfURL:v29];
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        uint64_t v31 = (SUCoreDocumentation *)v26;
        [v30 safeObjectForKey:@"MobileAssetProperties" ofClass:objc_opt_class()];
        uint64_t v32 = (SUCoreDocumentationData *)objc_claimAutoreleasedReturnValue();

        [MEMORY[0x1896127A0] sharedLogger];
        uint64_t v33 = (void *)objc_claimAutoreleasedReturnValue();
        [v33 oslog];
        uint64_t v34 = (os_log_s *)objc_claimAutoreleasedReturnValue();

        if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543618;
          v99 = v31;
          __int16 v100 = 2114;
          v101 = v32;
          _os_log_impl( &dword_187A54000,  v34,  OS_LOG_TYPE_DEFAULT,  "[SUCoreDocumentationDataManager] Initializing documentation with assetBundleURL: %{public}@, assetAttributes: %{public}@",  buf,  0x16u);
        }

        char v18 = -[SUCoreDocumentation initWithLocalBundleURL:attributes:]( objc_alloc(&OBJC_CLASS___SUCoreDocumentation),  "initWithLocalBundleURL:attributes:",  v31,  v32);
        id v35 = -[SUCoreDocumentation extendDocumentationProperties](v18, "extendDocumentationProperties");
        if (a5 == 1)
        {
          id v36 = objc_alloc(NSString);
          -[SUCoreDocumentation humanReadableUpdateName](v18, "humanReadableUpdateName");
          char v37 = (void *)objc_claimAutoreleasedReturnValue();
          [MEMORY[0x189612770] sharedDevice];
          v87 = v32;
          id v38 = (void *)objc_claimAutoreleasedReturnValue();
          [v38 splatCryptex1ProductVersion];
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          [MEMORY[0x189612770] sharedDevice];
          v92 = v22;
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          [v40 splatCryptex1ProductVersionExtra];
          v41 = (void *)objc_claimAutoreleasedReturnValue();
          uint64_t v42 = (void *)[v36 initWithFormat:@"%@ %@ %@", v37, v39, v41];
          -[SUCoreDocumentation setHumanReadableUpdateName:](v18, "setHumanReadableUpdateName:", v42);

          id v43 = objc_alloc(NSString);
          [MEMORY[0x189612770] sharedDevice];
          v44 = (void *)objc_claimAutoreleasedReturnValue();
          [v44 splatCryptex1ProductVersion];
          v45 = (void *)objc_claimAutoreleasedReturnValue();
          [MEMORY[0x189612770] sharedDevice];
          v46 = (void *)objc_claimAutoreleasedReturnValue();
          [v46 splatCryptex1ProductVersionExtra];
          v47 = (void *)objc_claimAutoreleasedReturnValue();
          v48 = (void *)[v43 initWithFormat:@"%@ %@", v45, v47];
          -[SUCoreDocumentation setHumanReadableUpdateVersion:](v18, "setHumanReadableUpdateVersion:", v48);

          id v22 = v92;
          uint64_t v32 = v87;
        }

        [MEMORY[0x189612770] sharedDevice];
        v49 = (void *)objc_claimAutoreleasedReturnValue();
        v50 = (void *)[objc_alloc(MEMORY[0x189612768]) initWithProjectName:v85];
        char v51 = [v50 getBoolConfigForKey:v84];

        if ((v51 & 1) == 0)
        {
          id v52 = objc_alloc(NSString);
          v53 = -[SUCoreDocumentation humanReadableUpdateName](v18, "humanReadableUpdateName");
          id v54 = (void *)[v52 initWithFormat:@"%@ (%@)", v53, v83];
          -[SUCoreDocumentation setHumanReadableUpdateName:](v18, "setHumanReadableUpdateName:", v54);

          id v55 = objc_alloc(NSString);
          v49 = -[SUCoreDocumentation humanReadableUpdateVersion](v18, "humanReadableUpdateVersion");
          id v56 = (void *)[v55 initWithFormat:@"%@ (%@)", v49, v83];
          -[SUCoreDocumentation setHumanReadableUpdateVersion:](v18, "setHumanReadableUpdateVersion:", v56);

LABEL_26:
        }

        uint64_t v19 = objc_alloc_init(&OBJC_CLASS___SUCoreDocumentationData);
        v57 = -[SUCoreDocumentation humanReadableUpdateName](v18, "humanReadableUpdateName");
        -[SUCoreDocumentationData setHumanReadableUpdateName:](v19, "setHumanReadableUpdateName:", v57);

        -[SUCoreDocumentation humanReadableUpdateTitle](v18, "humanReadableUpdateTitle");
        id v58 = (void *)objc_claimAutoreleasedReturnValue();
        -[SUCoreDocumentationData setHumanReadableUpdateTitle:](v19, "setHumanReadableUpdateTitle:", v58);

        -[SUCoreDocumentation humanReadableUpdateVersion](v18, "humanReadableUpdateVersion");
        __int16 v59 = (void *)objc_claimAutoreleasedReturnValue();
        -[SUCoreDocumentationData setHumanReadableUpdateVersion:](v19, "setHumanReadableUpdateVersion:", v59);

        -[SUCoreDocumentation releaseNotes](v18, "releaseNotes");
        id v60 = (void *)objc_claimAutoreleasedReturnValue();
        -[SUCoreDocumentationData setReadme:](v19, "setReadme:", v60);

        -[SUCoreDocumentation releaseNotesSummary](v18, "releaseNotesSummary");
        __int16 v61 = (void *)objc_claimAutoreleasedReturnValue();
        -[SUCoreDocumentationData setReadmeSummary:](v19, "setReadmeSummary:", v61);
        v62 = -[SUCoreDocumentation licenseAgreement](v18, "licenseAgreement");
        -[SUCoreDocumentationData setLicense:](v19, "setLicense:", v62);

        if (v18 && v19) {
          goto LABEL_31;
        }
        ++v20;
        char v21 = v18;
        id v22 = v19;
      }

      while (v89 != v20);
      uint64_t v89 = [obj countByEnumeratingWithState:&v94 objects:v104 count:16];
      if (!v89)
      {
LABEL_31:

        [MEMORY[0x1896127A0] sharedLogger];
        uint64_t v63 = (void *)objc_claimAutoreleasedReturnValue();
        [v63 oslog];
        v64 = (os_log_s *)objc_claimAutoreleasedReturnValue();

        if (os_log_type_enabled(v64, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543618;
          v99 = v18;
          __int16 v100 = 2114;
          v101 = v19;
          _os_log_impl( &dword_187A54000,  v64,  OS_LOG_TYPE_DEFAULT,  "[SUCoreDocumentationDataManager] Returning documentation: %{public}@, documentation data: %{public}@",  buf,  0x16u);
        }

        uint64_t v15 = v83;
        id v65 = v80;
        if (v81) {
          id *v81 = v18;
        }
        if (v82) {
          id *v82 = v19;
        }
        if (v18) {
          BOOL v66 = v19 == 0LL;
        }
        else {
          BOOL v66 = 1;
        }
        BOOL v67 = !v66;

        goto LABEL_51;
      }
    }
  }

  [MEMORY[0x1896127A0] sharedLogger];
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  [v68 oslog];
  v69 = (os_log_s *)objc_claimAutoreleasedReturnValue();

  if (os_log_type_enabled(v69, OS_LOG_TYPE_ERROR)) {
    -[SUCoreDocumentationDataManager queue_getDocumentation:documentationData:forInstalledUpdateType:withError:].cold.1( (uint64_t)v15,  v69,  v70,  v71,  v72,  v73,  v74,  v75);
  }

  v76 = (void *)MEMORY[0x189607870];
  [NSString stringWithFormat:@"No available stashed documentation path for provided build version (%@)", v15];
  v77 = (void *)objc_claimAutoreleasedReturnValue();
  [v76 buildAndLogCheckedSUCoreError:9004 underlying:0 description:v77];
  id v65 = (id)objc_claimAutoreleasedReturnValue();

  if (a6)
  {
    id v65 = v65;
    BOOL v67 = 0;
    *a6 = v65;
  }

  else
  {
    BOOL v67 = 0;
  }

- (BOOL)queue_cleanupNonInstalledDocumentationWithError:(id *)a3
{
  uint64_t v47 = *MEMORY[0x1895F89C0];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_stateQueue);
  if (a3) {
    *a3 = 0LL;
  }
  [MEMORY[0x1896078A8] defaultManager];
  id v38 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v38)
  {
    [MEMORY[0x189607870] buildAndLogCheckedSUCoreError:9000 underlying:0 description:@"Failed to create NSFileManager for cleanup"];
    uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue();
    id v13 = v23;
    if (!a3)
    {
      BOOL v25 = 0;
      id v9 = 0LL;
      uint64_t v5 = 0LL;
      goto LABEL_36;
    }

    id v24 = v23;
    id v13 = v24;
    BOOL v25 = 0;
    id v9 = 0LL;
    uint64_t v5 = 0LL;
    goto LABEL_26;
  }

  id v45 = 0LL;
  -[SUCoreDocumentationDataManager installedBuildVersionsWithError:](self, "installedBuildVersionsWithError:", &v45);
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue();
  id v6 = v45;
  dispatch_queue_t v7 = v6;
  if (!v5 || v6)
  {
    [MEMORY[0x189607870] buildAndLogCheckedSUCoreError:9005 underlying:v6 description:@"Failed to create installedBuildVersions array for cleanup"];
    id v13 = (id)objc_claimAutoreleasedReturnValue();

    if (!a3)
    {
      BOOL v25 = 0;
      id v9 = 0LL;
      goto LABEL_36;
    }

    id v24 = v13;
    id v13 = v24;
    BOOL v25 = 0;
    id v9 = 0LL;
    goto LABEL_26;
  }

  -[SUCoreDocumentationDataManager documentationPath](self, "documentationPath");
  id v8 = (void *)objc_claimAutoreleasedReturnValue();
  id v44 = 0LL;
  [v38 contentsOfDirectoryAtPath:v8 error:&v44];
  id v9 = (id)objc_claimAutoreleasedReturnValue();
  id v10 = v44;

  if (!v9 || v10)
  {
    uint64_t v26 = (void *)MEMORY[0x189607870];
    BOOL v27 = (void *)NSString;
    -[SUCoreDocumentationDataManager documentationPath](self, "documentationPath");
    id v28 = (void *)objc_claimAutoreleasedReturnValue();
    [v27 stringWithFormat:@"Failed to read contents of %@ for cleanup: %@", v28, v10];
    char v29 = (void *)objc_claimAutoreleasedReturnValue();
    [v26 buildAndLogCheckedSUCoreError:9003 underlying:v10 description:v29];
    id v13 = (id)objc_claimAutoreleasedReturnValue();

    if (!a3)
    {
      BOOL v25 = 0;
      goto LABEL_36;
    }

    id v24 = v13;
    id v13 = v24;
    BOOL v25 = 0;
LABEL_26:
    *a3 = v24;
    goto LABEL_36;
  }

  __int128 v42 = 0u;
  __int128 v43 = 0u;
  __int128 v40 = 0u;
  __int128 v41 = 0u;
  id v9 = v9;
  uint64_t v11 = [v9 countByEnumeratingWithState:&v40 objects:v46 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    char v37 = a3;
    id v13 = 0LL;
    uint64_t v14 = *(void *)v41;
LABEL_10:
    uint64_t v15 = 0LL;
    while (1)
    {
      if (*(void *)v41 != v14) {
        objc_enumerationMutation(v9);
      }
      uint64_t v16 = *(void *)(*((void *)&v40 + 1) + 8 * v15);
      if (([v5 containsObject:v16] & 1) == 0)
      {
        -[SUCoreDocumentationDataManager stashedDataDirectoryForBuildVersion:]( self,  "stashedDataDirectoryForBuildVersion:",  v16);
        int v17 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v17)
        {
          v30 = (void *)MEMORY[0x189607870];
          [NSString stringWithFormat:@"Failed to create build version path for cleanup with build version (%@)", v16];
          uint64_t v31 = (void *)objc_claimAutoreleasedReturnValue();
          [v30 buildAndLogCheckedSUCoreError:9004 underlying:0 description:v31];
          uint64_t v32 = (void *)objc_claimAutoreleasedReturnValue();

          id v13 = v32;
          uint64_t v33 = v37;
          if (v37) {
            goto LABEL_33;
          }
          goto LABEL_34;
        }

        char v18 = v5;
        id v19 = v9;
        uint64_t v20 = v13;
        id v39 = v13;
        char v21 = [v38 removeItemAtPath:v17 error:&v39];
        id v22 = v39;

        if ((v21 & 1) == 0)
        {
          id v35 = (void *)MEMORY[0x189607870];
          [NSString stringWithFormat:@"Failed to remove directory %@: %@", v17, v22];
          id v36 = (void *)objc_claimAutoreleasedReturnValue();
          [v35 buildAndLogCheckedSUCoreError:90007 underlying:v22 description:v36];
          uint64_t v32 = (void *)objc_claimAutoreleasedReturnValue();

          id v13 = v32;
          uint64_t v33 = v37;
          id v9 = v19;
          uint64_t v5 = v18;
          if (!v37) {
            goto LABEL_34;
          }
LABEL_33:
          id v13 = v32;
          *uint64_t v33 = v13;
LABEL_34:

          BOOL v25 = 0;
          goto LABEL_35;
        }

        id v13 = v22;
        id v9 = v19;
        uint64_t v5 = v18;
      }

      if (v12 == ++v15)
      {
        uint64_t v12 = [v9 countByEnumeratingWithState:&v40 objects:v46 count:16];
        if (v12) {
          goto LABEL_10;
        }
        goto LABEL_31;
      }
    }
  }

  id v13 = 0LL;
LABEL_31:
  BOOL v25 = 1;
LABEL_35:

LABEL_36:
  return v25;
}

- (BOOL)queue_evictStashIfNecessary:(id *)a3
{
  uint64_t v63 = *MEMORY[0x1895F89C0];
  -[SUCoreDocumentationDataManager stateQueue](self, "stateQueue");
  uint64_t v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  if (a3) {
    *a3 = 0LL;
  }
  [MEMORY[0x1896078A8] defaultManager];
  id v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v6)
  {
    id v22 = (void *)MEMORY[0x189607870];
    uint64_t v23 = @"Failed to create NSFileManager";
    uint64_t v24 = 9000LL;
LABEL_16:
    [v22 buildAndLogCheckedSUCoreError:v24 underlying:0 description:v23];
    BOOL v25 = (void *)objc_claimAutoreleasedReturnValue();
    id v18 = v25;
    if (a3)
    {
      id v26 = v25;
      id v18 = v26;
      BOOL v21 = 0;
      id v13 = 0LL;
LABEL_21:
      id v19 = 0LL;
      uint64_t v20 = 0LL;
LABEL_22:
      *a3 = v26;
      goto LABEL_40;
    }

    BOOL v21 = 0;
    id v13 = 0LL;
LABEL_39:
    id v19 = 0LL;
    uint64_t v20 = 0LL;
    goto LABEL_40;
  }

  unint64_t v7 = 0x189612000uLL;
  [MEMORY[0x1896127A0] sharedLogger];
  id v8 = (void *)objc_claimAutoreleasedReturnValue();
  [v8 oslog];
  id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue();

  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    -[SUCoreDocumentationDataManager documentationPath](self, "documentationPath");
    id v10 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    uint64_t v60 = (uint64_t)v10;
    _os_log_impl( &dword_187A54000,  v9,  OS_LOG_TYPE_DEFAULT,  "[SUCoreDocumentationDataManager] Preparing to evict stashed documentation assets at directory %{public}@",  buf,  0xCu);
  }

  -[SUCoreDocumentationDataManager documentationPath](self, "documentationPath");
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v11)
  {
    id v22 = (void *)MEMORY[0x189607870];
    uint64_t v23 = @"Missing documentation path when attempting to evict documentation stash";
    uint64_t v24 = 9004LL;
    goto LABEL_16;
  }

  -[SUCoreDocumentationDataManager documentationPath](self, "documentationPath");
  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue();
  id v58 = 0LL;
  [v6 contentsOfDirectoryAtPath:v12 error:&v58];
  id v13 = (void *)objc_claimAutoreleasedReturnValue();
  id v14 = v58;

  if (!v13 || v14)
  {
    BOOL v27 = (void *)MEMORY[0x189607870];
    id v28 = (void *)NSString;
    -[SUCoreDocumentationDataManager documentationPath](self, "documentationPath");
    char v29 = (void *)objc_claimAutoreleasedReturnValue();
    [v28 stringWithFormat:@"Failed to read contents of %@: %@", v29, v14];
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    [v27 buildAndLogCheckedSUCoreError:9003 underlying:v14 description:v30];
    id v18 = (id)objc_claimAutoreleasedReturnValue();

    if (a3)
    {
      id v26 = v18;
      id v18 = v26;
      BOOL v21 = 0;
      goto LABEL_21;
    }

    BOOL v21 = 0;
    goto LABEL_39;
  }

  if ((unint64_t)[v13 count] <= 4)
  {
    [MEMORY[0x1896127A0] sharedLogger];
    uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue();
    [v15 oslog];
    uint64_t v16 = (os_log_s *)objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v17 = [v13 count];
      *(_DWORD *)buf = 134218240;
      uint64_t v60 = v17;
      __int16 v61 = 2048;
      uint64_t v62 = 5LL;
      _os_log_impl( &dword_187A54000,  v16,  OS_LOG_TYPE_DEFAULT,  "[SUCoreDocumentationDataManager] Stashed assets (%lld) is below the minimum threshold (%lld), not evicting any assets",  buf,  0x16u);
    }

    id v18 = 0LL;
    id v19 = 0LL;
    uint64_t v20 = 0LL;
    goto LABEL_13;
  }

  id v57 = 0LL;
  -[SUCoreDocumentationDataManager installedBuildVersionsWithError:](self, "installedBuildVersionsWithError:", &v57);
  uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue();
  id v31 = v57;
  uint64_t v32 = v31;
  if (!v20 || v31)
  {
    [MEMORY[0x189607870] buildAndLogCheckedSUCoreError:9005 underlying:v31 description:@"Failed to create installedBuildVersions array"];
    id v18 = (id)objc_claimAutoreleasedReturnValue();

    if (!a3)
    {
LABEL_44:
      BOOL v21 = 0;
      id v19 = 0LL;
      goto LABEL_40;
    }

    goto LABEL_42;
  }

  [v13 sortedArrayUsingComparator:&__block_literal_global_5];
  uint64_t v33 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v33)
  {
    [MEMORY[0x189607870] buildAndLogCheckedSUCoreError:90007 underlying:0 description:@"Failed to create sorted build version directory"];
    id v18 = (id)objc_claimAutoreleasedReturnValue();
    if (!a3) {
      goto LABEL_44;
    }
LABEL_42:
    id v26 = v18;
    id v18 = v26;
    BOOL v21 = 0;
    id v19 = 0LL;
    goto LABEL_22;
  }

  id v19 = v33;
  if ((unint64_t)[v33 count] < 5)
  {
    id v18 = 0LL;
LABEL_13:
    BOOL v21 = 1;
    goto LABEL_40;
  }

  id v52 = v13;
  unint64_t v34 = 0LL;
  uint64_t v35 = 0LL;
  id v18 = 0LL;
  while (1)
  {
    if ([v19 count] <= v34)
    {
      BOOL v21 = 1;
LABEL_52:
      id v13 = v52;
      goto LABEL_40;
    }

    uint64_t v36 = [v19 objectAtIndex:v34];
    if (!v36) {
      break;
    }
    char v37 = (void *)v36;
    if (([v20 containsObject:v36] & 1) == 0)
    {
      -[SUCoreDocumentationDataManager stashedDataDirectoryForBuildVersion:]( self,  "stashedDataDirectoryForBuildVersion:",  v37);
      id v55 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v55)
      {
        id v45 = (void *)MEMORY[0x189607870];
        [NSString stringWithFormat:@"Failed to create deletePath"];
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        [v45 buildAndLogCheckedSUCoreError:90007 underlying:0 description:v46];
        uint64_t v47 = (void *)objc_claimAutoreleasedReturnValue();

        id v18 = v47;
        if (!a3) {
          goto LABEL_51;
        }
        goto LABEL_50;
      }

      id v54 = v37;
      [*(id *)(v7 + 1952) sharedLogger];
      id v38 = (void *)objc_claimAutoreleasedReturnValue();
      [v38 oslog];
      id v39 = (os_log_s *)objc_claimAutoreleasedReturnValue();

      if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        uint64_t v60 = (uint64_t)v55;
        _os_log_impl( &dword_187A54000,  v39,  OS_LOG_TYPE_DEFAULT,  "[SUCoreDocumentationDataManager] Removing documentation asset at path %{public}@",  buf,  0xCu);
      }

      id v56 = v18;
      char v53 = [v6 removeItemAtPath:v55 error:&v56];
      id v40 = v56;

      if ((v53 & 1) == 0)
      {
        v48 = (void *)MEMORY[0x189607870];
        v49 = (void *)NSString;
        v50 = -[SUCoreDocumentationDataManager documentationPath](self, "documentationPath");
        [v49 stringWithFormat:@"Failed to remove directory %@: %@", v50, v40];
        char v51 = (void *)objc_claimAutoreleasedReturnValue();
        [v48 buildAndLogCheckedSUCoreError:90007 underlying:v40 description:v51];
        uint64_t v47 = (void *)objc_claimAutoreleasedReturnValue();

        id v18 = v47;
        char v37 = v54;
        if (!a3)
        {
LABEL_51:

          BOOL v21 = 0;
          goto LABEL_52;
        }

uint64_t __62__SUCoreDocumentationDataManager_queue_evictStashIfNecessary___block_invoke( uint64_t a1,  void *a2,  uint64_t a3)
{
  return [a2 compare:a3 options:65];
}

- (id)installedBuildVersionsWithError:(id *)a3
{
  uint64_t v24 = *MEMORY[0x1895F89C0];
  if (a3) {
    *a3 = 0LL;
  }
  id v4 = objc_alloc_init(MEMORY[0x189603FA8]);
  if (!v4)
  {
    uint64_t v15 = (void *)MEMORY[0x189607870];
    uint64_t v16 = @"Failed to allocate installed build version array";
    uint64_t v17 = 9000LL;
    goto LABEL_13;
  }

  [MEMORY[0x189612770] sharedDevice];
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue();
  [v5 buildVersion];
  id v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
  {
    uint64_t v15 = (void *)MEMORY[0x189607870];
    uint64_t v16 = @"No OS build version found";
    uint64_t v17 = 9006LL;
LABEL_13:
    [v15 buildAndLogCheckedSUCoreError:v17 underlying:0 description:v16];
    id v18 = (void *)objc_claimAutoreleasedReturnValue();
    id v14 = v18;
    if (a3)
    {
      id v14 = v18;
      id v13 = 0LL;
      *a3 = v14;
    }

    else
    {
      id v13 = 0LL;
    }

    goto LABEL_16;
  }

  [v4 addObject:v6];
  [MEMORY[0x189612770] sharedDevice];
  unint64_t v7 = (void *)objc_claimAutoreleasedReturnValue();
  [v7 splatCryptex1BuildVersion];
  id v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8 && ([v8 isEqualToString:v6] & 1) == 0) {
    [v4 addObject:v8];
  }
  [MEMORY[0x1896127A0] sharedLogger];
  id v9 = (void *)objc_claimAutoreleasedReturnValue();
  [v9 oslog];
  id v10 = (os_log_s *)objc_claimAutoreleasedReturnValue();

  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v11 = [v4 count];
    objc_msgSend(v4, "componentsJoinedByString:", @", ");
    uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue();
    int v20 = 134218242;
    uint64_t v21 = v11;
    __int16 v22 = 2114;
    uint64_t v23 = v12;
    _os_log_impl( &dword_187A54000,  v10,  OS_LOG_TYPE_DEFAULT,  "[SUCoreDocumentationDataManager] Found %lld installed build versions: %{public}@",  (uint8_t *)&v20,  0x16u);
  }

  id v13 = v4;
  id v14 = 0LL;
LABEL_16:

  return v13;
}

- (id)stashedDataDirectoryForBuildVersion:(id)a3
{
  id v4 = a3;
  -[SUCoreDocumentationDataManager documentationPath](self, "documentationPath");
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    if (v4)
    {
      -[SUCoreDocumentationDataManager documentationPath](self, "documentationPath");
      id v6 = (void *)objc_claimAutoreleasedReturnValue();
      [v6 stringByAppendingPathComponent:v4];
      uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue();
    }

    else
    {
      [MEMORY[0x189612778] sharedDiag];
      id v6 = (void *)objc_claimAutoreleasedReturnValue();
      [v6 trackAnomaly:@"SUCoreDocumentationDataManager" forReason:@"Missing build version to construct documentation path" withResult:8116 withError:0];
      uint64_t v5 = 0LL;
    }
  }

  else
  {
    [MEMORY[0x189612778] sharedDiag];
    id v6 = (void *)objc_claimAutoreleasedReturnValue();
    [v6 trackAnomaly:@"SUCoreDocumentationDataManager" forReason:@"Missing base path to construct documentation path" withResult:8116 withError:0];
  }

  return v5;
}

- (id)description
{
  uint64_t v2 = (void *)NSString;
  -[SUCoreDocumentationDataManager documentationPath](self, "documentationPath");
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue();
  [v2 stringWithFormat:@"SUCoreDocumentationDataManager(%@)", v3];
  id v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (OS_dispatch_queue)stateQueue
{
  return self->_stateQueue;
}

- (NSString)documentationPath
{
  return self->_documentationPath;
}

- (void)setDocumentationPath:(id)a3
{
}

- (void).cxx_destruct
{
}

- (void)queue_stashDocumentationAssetData:(uint64_t)a3 forBuildVersion:(uint64_t)a4 error:(uint64_t)a5 .cold.1( uint64_t a1,  os_log_s *a2,  uint64_t a3,  uint64_t a4,  uint64_t a5,  uint64_t a6,  uint64_t a7,  uint64_t a8)
{
}

- (void)queue_getDocumentation:(uint64_t)a3 documentationData:(uint64_t)a4 forInstalledUpdateType:(uint64_t)a5 withError:(uint64_t)a6 .cold.1( uint64_t a1,  os_log_s *a2,  uint64_t a3,  uint64_t a4,  uint64_t a5,  uint64_t a6,  uint64_t a7,  uint64_t a8)
{
}

@end