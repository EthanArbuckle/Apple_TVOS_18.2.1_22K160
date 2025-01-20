@interface MCMClientConnection
+ (id)privilegedClientConnectionWithUserIdentity:(id)a3;
+ (id)privilegedClientConnectionWithUserIdentity:(id)a3 kernel:(BOOL)a4;
+ (id)sharedClientConnection;
- (BOOL)_containerURL:(id)a3 isValidForContainerClass:(unint64_t)a4;
- (MCMClientConnection)init;
- (MCMClientConnection)initWithContext:(id)a3;
- (MCMCommandContext)context;
- (id)_commandForResumedDeleteOperationsWithResultPromise:(id)a3;
- (id)clientBundleIdentifier;
- (void)_cleanTransientContainersWithContainerConfig:(id)a3;
- (void)_cleanTransientUserContainersWithContainerConfig:(id)a3;
- (void)_cleanupOprhanedCodeSigningMappingData;
- (void)_cleanupOrphanedDataForDirectories:(id)a3 containerClass:(unint64_t)a4 forUserIdentity:(id)a5;
- (void)_regenerateContainerPaths;
- (void)_resumeDeleteOperations;
- (void)containerManagerCleanupWithCompletion:(id)a3;
- (void)containerManagerSetup;
- (void)rebootContainerManagerCleanupWithCompletion:(id)a3;
- (void)rebootContainerManagerSetup;
@end

@implementation MCMClientConnection

- (MCMClientConnection)init
{
  uint64_t v15 = *MEMORY[0x1895F89C0];
  v14.receiver = self;
  v14.super_class = (Class)&OBJC_CLASS___MCMClientConnection;
  v2 = -[MCMClientConnection init](&v14, sel_init);
  if (v2)
  {
    v3 = +[MCMUserIdentitySharedCache sharedInstance](&OBJC_CLASS___MCMUserIdentitySharedCache, "sharedInstance");
    [v3 defaultUserIdentity];
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = +[MCMClientIdentity anonymousPrivilegedClientIdentityWithUserIdentity:]( &OBJC_CLASS___MCMClientIdentity,  "anonymousPrivilegedClientIdentityWithUserIdentity:",  v4);
    v6 = objc_alloc(&OBJC_CLASS___MCMContainerFactory);
    v7 = -[MCMContainerFactory initWithContainerCache:clientIdentity:userIdentityCache:]( v6,  "initWithContainerCache:clientIdentity:userIdentityCache:",  gContainerCache,  v5,  v3);
    v8 = objc_alloc(&OBJC_CLASS___MCMCommandContext);
    uint64_t v9 = gContainerCache;
    id v10 = containermanager_copy_global_configuration();
    uint64_t v11 = -[MCMCommandContext initWithClientIdentity:containerCache:containerFactory:userIdentityCache:kernelPersonaID:globalConfiguration:]( v8,  "initWithClientIdentity:containerCache:containerFactory:userIdentityCache:kernelPersonaID:globalConfiguration:",  v5,  v9,  v7,  v3,  0LL,  v10);
    context = v2->_context;
    v2->_context = (MCMCommandContext *)v11;
  }

  return v2;
}

- (MCMClientConnection)initWithContext:(id)a3
{
  uint64_t v10 = *MEMORY[0x1895F89C0];
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___MCMClientConnection;
  v6 = -[MCMClientConnection init](&v9, sel_init);
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_context, a3);
  }

  return v7;
}

- (id)clientBundleIdentifier
{
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  [v2 clientIdentity];
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  [v3 codeSignInfo];
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 identifier];
  id v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void)containerManagerSetup
{
  uint64_t v90 = *MEMORY[0x1895F89C0];
  id v3 = containermanager_copy_global_configuration();
  int v4 = [v3 dispositionForContainerClass:12];

  if (v4 == 1)
  {
    -[MCMClientConnection context](self, "context");
    id v5 = (id)objc_claimAutoreleasedReturnValue();
    id v6 = containermanager_copy_global_configuration();
    int v7 = [v6 systemContainerMode];

    if (!v7)
    {
LABEL_60:

      goto LABEL_61;
    }
    v8 = +[MCMFileManager defaultManager](&OBJC_CLASS___MCMFileManager, "defaultManager");
    id v9 = containermanager_copy_global_configuration();
    int v10 = [v9 systemContainerMode];

    if (v10 == 1)
    {
      +[MCMUserIdentitySharedCache sharedInstance](&OBJC_CLASS___MCMUserIdentitySharedCache, "sharedInstance");
      uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue();
      uint64_t v12 = [v11 globalSystemUserIdentity];
    }

    else
    {
      if (v10 != 2)
      {
LABEL_59:

        goto LABEL_60;
      }

      +[MCMUserIdentitySharedCache sharedInstance](&OBJC_CLASS___MCMUserIdentitySharedCache, "sharedInstance");
      uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue();
      uint64_t v12 = [v11 userIdentityForCurrentContext];
    }

    v13 = (void *)v12;

    +[MCMContainerClassBackupPath systemContainerBackupBaseDirectoryWithUserIdentity:]( &OBJC_CLASS___MCMContainerClassBackupPath,  "systemContainerBackupBaseDirectoryWithUserIdentity:",  v13);
    objc_super v14 = (void *)objc_claimAutoreleasedReturnValue();
    +[MCMContainerClassBackupPath systemContainerBackupDirectoryWithUserIdentity:]( &OBJC_CLASS___MCMContainerClassBackupPath,  "systemContainerBackupDirectoryWithUserIdentity:",  v13);
    uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = +[MCMContainerClassBackupPath systemGroupContainerBackupDirectoryWithUserIdentity:]( &OBJC_CLASS___MCMContainerClassBackupPath,  "systemGroupContainerBackupDirectoryWithUserIdentity:",  v13);
    v60 = v16;
    v61 = v15;
    if ([v8 itemDoesNotExistAtURL:v14])
    {
      container_log_handle_for_category();
      v17 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl( &dword_188846000,  v17,  OS_LOG_TYPE_DEFAULT,  "There are no system/system group containers staged for restore, skipping.",  buf,  2u);
      }

      v62 = 0LL;
      v63 = 0LL;
      v18 = 0LL;
      id v19 = 0LL;
LABEL_11:

LABEL_54:
      id v65 = v19;
      char v42 = [v8 removeItemAtURL:v14 error:&v65];
      id v43 = v65;

      if ((v42 & 1) == 0)
      {
        container_log_handle_for_category();
        v44 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v44, OS_LOG_TYPE_ERROR))
        {
          [v14 path];
          v58 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)v70 = 138412546;
          v71 = v58;
          __int16 v72 = 2112;
          id v73 = v43;
          _os_log_error_impl( &dword_188846000,  v44,  OS_LOG_TYPE_ERROR,  "Failed to remove system container base dir %@: %@",  v70,  0x16u);
        }
      }

      goto LABEL_59;
    }

    if ([v8 itemExistsAtURL:v15])
    {
      [v15 URLByAppendingPathExtension:@"inprogress"];
      v69[1] = 0LL;
      v63 = (void *)objc_claimAutoreleasedReturnValue();
      char v20 = objc_msgSend(v8, "removeItemAtURL:error:");
      id v21 = 0LL;
      if ((v20 & 1) == 0)
      {
        v22 = v16;
        container_log_handle_for_category();
        v23 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          id v83 = v21;
          _os_log_error_impl( &dword_188846000,  v23,  OS_LOG_TYPE_ERROR,  "Failed to remove existing inprogress system containers: %@",  buf,  0xCu);
        }

        v16 = v22;
      }

      v69[0] = v21;
      char v24 = [v8 moveItemAtURL:v15 toURL:v63 error:v69];
      id v19 = v69[0];

      if ((v24 & 1) != 0)
      {
        int v25 = 1;
        goto LABEL_24;
      }

      container_log_handle_for_category();
      v26 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        id v83 = v19;
        _os_log_error_impl( &dword_188846000,  v26,  OS_LOG_TYPE_ERROR,  "Failed to move system containers to inprogress: %@",  buf,  0xCu);
      }
    }

    else
    {
      v63 = 0LL;
      id v19 = 0LL;
    }

    int v25 = 0;
LABEL_24:
    if ([v8 itemExistsAtURL:v16])
    {
      [v16 URLByAppendingPathExtension:@"inprogress"];
      v68[1] = v19;
      v62 = (void *)objc_claimAutoreleasedReturnValue();
      char v27 = objc_msgSend(v8, "removeItemAtURL:error:");
      id v28 = v19;

      if ((v27 & 1) == 0)
      {
        v29 = v16;
        container_log_handle_for_category();
        v30 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          id v83 = v28;
          _os_log_error_impl( &dword_188846000,  v30,  OS_LOG_TYPE_ERROR,  "Failed to remove existing inprogress system containers: %@",  buf,  0xCu);
        }

        v16 = v29;
      }

      v68[0] = v28;
      char v31 = [v8 moveItemAtURL:v16 toURL:v62 error:v68];
      id v19 = v68[0];

      if ((v31 & 1) != 0)
      {
        if (!v25)
        {
          v18 = 0LL;
          id v35 = v19;
LABEL_69:
          container_log_handle_for_category();
          v52 = (os_log_s *)objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v52, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)v74 = 0;
            _os_log_impl(&dword_188846000, v52, OS_LOG_TYPE_DEFAULT, "Installing system group containers", v74, 2u);
          }

          id v66 = v35;
          [v8 urlsForItemsInDirectoryAtURL:v62 error:&v66];
          v53 = (void *)objc_claimAutoreleasedReturnValue();
          id v19 = v66;

          if (v53)
          {
            __int128 v80 = 0u;
            __int128 v81 = 0u;
            __int128 v78 = 0u;
            __int128 v79 = 0u;
            v17 = v53;
            uint64_t v54 = -[os_log_s countByEnumeratingWithState:objects:count:]( v17,  "countByEnumeratingWithState:objects:count:",  &v78,  v74,  16LL);
            if (v54)
            {
              uint64_t v55 = v54;
              uint64_t v56 = *(void *)v79;
              do
              {
                for (uint64_t i = 0LL; i != v55; ++i)
                {
                  if (*(void *)v79 != v56) {
                    objc_enumerationMutation(v17);
                  }
                  _moveSystemContainerIntoPlace(*(void **)(*((void *)&v78 + 1) + 8 * i), 13LL, v5, v13);
                }

                uint64_t v55 = -[os_log_s countByEnumeratingWithState:objects:count:]( v17,  "countByEnumeratingWithState:objects:count:",  &v78,  v74,  16LL);
              }

              while (v55);
              v18 = v17;
            }

            else
            {
              v18 = v17;
            }
          }

          else
          {
            container_log_handle_for_category();
            v17 = (os_log_s *)objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)v74 = 138412546;
              v75 = v62;
              __int16 v76 = 2112;
              id v77 = v19;
              _os_log_error_impl( &dword_188846000,  v17,  OS_LOG_TYPE_ERROR,  "Couldn't find any system shared containers at %@: %@",  v74,  0x16u);
            }

            v18 = 0LL;
          }

          goto LABEL_11;
        }

        int v32 = 1;
LABEL_34:
        container_log_handle_for_category();
        v33 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_188846000, v33, OS_LOG_TYPE_DEFAULT, "Installing system containers", buf, 2u);
        }

        id v67 = v19;
        [v8 urlsForItemsInDirectoryAtURL:v63 error:&v67];
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        id v35 = v67;

        if (v34)
        {
          char v59 = v32;
          __int128 v88 = 0u;
          __int128 v89 = 0u;
          __int128 v86 = 0u;
          __int128 v87 = 0u;
          v18 = v34;
          uint64_t v36 = -[os_log_s countByEnumeratingWithState:objects:count:]( v18,  "countByEnumeratingWithState:objects:count:",  &v86,  buf,  16LL);
          if (v36)
          {
            uint64_t v37 = v36;
            uint64_t v38 = *(void *)v87;
            do
            {
              for (uint64_t j = 0LL; j != v37; ++j)
              {
                if (*(void *)v87 != v38) {
                  objc_enumerationMutation(v18);
                }
                _moveSystemContainerIntoPlace(*(void **)(*((void *)&v86 + 1) + 8 * j), 12LL, v5, v13);
              }

              uint64_t v37 = -[os_log_s countByEnumeratingWithState:objects:count:]( v18,  "countByEnumeratingWithState:objects:count:",  &v86,  buf,  16LL);
            }

            while (v37);
          }

          if ((v59 & 1) != 0) {
            goto LABEL_69;
          }
        }

        else
        {
          container_log_handle_for_category();
          v41 = (os_log_s *)objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412546;
            id v83 = v63;
            __int16 v84 = 2112;
            id v85 = v35;
            _os_log_error_impl( &dword_188846000,  v41,  OS_LOG_TYPE_ERROR,  "Couldn't find any system containers at %@: %@",  buf,  0x16u);
          }

          v18 = 0LL;
          if (v32) {
            goto LABEL_69;
          }
        }

        id v19 = v35;
        goto LABEL_54;
      }

      container_log_handle_for_category();
      v40 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        id v83 = v19;
        _os_log_error_impl( &dword_188846000,  v40,  OS_LOG_TYPE_ERROR,  "Failed to move shared system containers to inprogress: %@",  buf,  0xCu);
      }

      if ((v25 & 1) == 0)
      {
LABEL_49:
        v18 = 0LL;
        goto LABEL_54;
      }
    }

    else
    {
      v62 = 0LL;
      if ((v25 & 1) == 0) {
        goto LABEL_49;
      }
    }

    int v32 = 0;
    goto LABEL_34;
  }

- (void)containerManagerCleanupWithCompletion:(id)a3
{
  uint64_t v45 = *MEMORY[0x1895F89C0];
  id v4 = a3;
  uint64_t v35 = 0LL;
  uint64_t v36 = (id *)&v35;
  uint64_t v37 = 0x3032000000LL;
  uint64_t v38 = __Block_byref_object_copy_;
  v39 = __Block_byref_object_dispose_;
  id v40 = 0LL;
  -[MCMClientConnection _resumeDeleteOperations](self, "_resumeDeleteOperations");
  uint64_t v5 = MEMORY[0x1895F87A8];
  v34[0] = MEMORY[0x1895F87A8];
  v34[1] = 3221225472LL;
  v34[2] = __61__MCMClientConnection_containerManagerCleanupWithCompletion___block_invoke;
  v34[3] = &unk_18A29C9F8;
  v34[4] = self;
  id v6 = (void *)MEMORY[0x1895CE54C](v34);
  id v7 = containermanager_copy_global_configuration();
  BOOL v8 = [v7 dispositionForContainerClass:1] == 1;

  if (v8)
  {
    +[MCMContainerClassStagingPath stagingGlobalURL](&OBJC_CLASS___MCMContainerClassStagingPath, "stagingGlobalURL");
    id v9 = (void *)objc_claimAutoreleasedReturnValue();
    +[MCMFileManager defaultManager](&OBJC_CLASS___MCMFileManager, "defaultManager");
    int v10 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v11 = v36;
    obuint64_t j = v36[5];
    [v10 urlsForItemsInDirectoryAtURL:v9 error:&obj];
    uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_storeStrong(v11 + 5, obj);

    if (v12)
    {
      v13 = (dispatch_queue_s *)MCMSharedBackgroundQueue();
      block[0] = v5;
      block[1] = 3221225472LL;
      block[2] = __61__MCMClientConnection_containerManagerCleanupWithCompletion___block_invoke_10;
      block[3] = &unk_18A29DCF8;
      int v32 = v6;
      id v31 = v12;
      dispatch_async(v13, block);

      objc_super v14 = v32;
    }

    else
    {
      [v36[5] domain];
      uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue();
      if ([v15 isEqualToString:*MEMORY[0x189607688]])
      {
        BOOL v16 = [v36[5] code] == 2;

        if (v16) {
          goto LABEL_11;
        }
      }

      else
      {
      }

      container_log_handle_for_category();
      objc_super v14 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        [v9 path];
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        id v24 = v36[5];
        *(_DWORD *)buf = 138412546;
        char v42 = v23;
        __int16 v43 = 2112;
        id v44 = v24;
        _os_log_error_impl( &dword_188846000,  v14,  OS_LOG_TYPE_ERROR,  "Failed to get items at global staging URL: %@ : %@",  buf,  0x16u);
      }
    }

LABEL_11:
  }

  id v17 = containermanager_copy_global_configuration();
  BOOL v18 = [v17 dispositionForContainerClass:2] == 1;

  if (v18)
  {
    -[MCMClientConnection context](self, "context");
    id v19 = (void *)objc_claimAutoreleasedReturnValue();
    [v19 userIdentityCache];
    char v20 = (void *)objc_claimAutoreleasedReturnValue();
    v27[0] = v5;
    v27[1] = 3221225472LL;
    v27[2] = __61__MCMClientConnection_containerManagerCleanupWithCompletion___block_invoke_2;
    v27[3] = &unk_18A29CA20;
    v29 = &v35;
    id v28 = v6;
    [v20 forEachAccessibleUserIdentitySynchronouslyExecuteBlock:v27];
  }

  id v21 = (dispatch_queue_s *)MCMSharedBackgroundQueue();
  v25[0] = v5;
  v25[1] = 3221225472LL;
  v25[2] = __61__MCMClientConnection_containerManagerCleanupWithCompletion___block_invoke_2_13;
  v25[3] = &unk_18A29DCF8;
  v25[4] = self;
  id v26 = v4;
  id v22 = v4;
  dispatch_async(v21, v25);

  _Block_object_dispose(&v35, 8);
}

- (void)_cleanupOrphanedDataForDirectories:(id)a3 containerClass:(unint64_t)a4 forUserIdentity:(id)a5
{
  uint64_t v53 = *MEMORY[0x1895F89C0];
  id v8 = a3;
  id v41 = a5;
  obuint64_t j = v8;
  __int128 v49 = 0u;
  __int128 v50 = 0u;
  __int128 v51 = 0u;
  __int128 v52 = 0u;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v49 objects:v48 count:16];
  if (v9)
  {
    uint64_t v11 = v9;
    uint64_t v12 = *(void *)v50;
    v13 = &OBJC_CLASS___MCMContainerStagingPath;
    *(void *)&__int128 v10 = 138412546LL;
    __int128 v40 = v10;
    do
    {
      for (uint64_t i = 0LL; i != v11; ++i)
      {
        if (*(void *)v50 != v12) {
          objc_enumerationMutation(obj);
        }
        uint64_t v15 = *(void **)(*((void *)&v49 + 1) + 8 * i);
        BOOL v16 = -[MCMClientConnection _containerURL:isValidForContainerClass:]( self,  "_containerURL:isValidForContainerClass:",  v15,  a4,  v40);
        [&v13[11] defaultManager];
        id v17 = (void *)objc_claimAutoreleasedReturnValue();
        int v18 = [v17 itemExistsAtURL:v15];

        if (v18)
        {
          if (v16)
          {
            [v15 URLByAppendingPathComponent:@".com.apple.mobile_container_manager.metadata.plist" isDirectory:0];
            id v19 = (id)objc_claimAutoreleasedReturnValue();
            [&v13[11] defaultManager];
            char v20 = (void *)objc_claimAutoreleasedReturnValue();
            int v21 = [v20 itemDoesNotExistAtURL:v19];

            if (!v21) {
              goto LABEL_32;
            }
            if ((a4 & 0xFFFFFFFFFFFFFFFELL) == 0xC)
            {
              [v15 lastPathComponent];
              id v22 = (void *)objc_claimAutoreleasedReturnValue();
              v23 = +[MCMEntitlementBypassList sharedBypassList](&OBJC_CLASS___MCMEntitlementBypassList, "sharedBypassList");
              id v24 = v23;
              char v25 = a4 == 13
                  ? [v23 systemGroupContainerIdIsWellknown:v22]
                  : [v23 systemContainerIdIsWellknown:v22];
              char v27 = v25;

              if ((v27 & 1) != 0)
              {
LABEL_28:
                v13 = &OBJC_CLASS___MCMContainerStagingPath;
                goto LABEL_32;
              }
            }

            container_log_handle_for_category();
            id v28 = (os_log_s *)objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
            {
              [v15 path];
              v39 = (os_log_s *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138412290;
              uint64_t v45 = v39;
              _os_log_error_impl( &dword_188846000,  v28,  OS_LOG_TYPE_ERROR,  "Deleting orphaned data missing a metadata file at: %@",  buf,  0xCu);
            }
          }

          id v29 = containermanager_copy_global_configuration();
          int v30 = [v29 isInternalImage];

          if (v30)
          {
            container_log_handle_for_category();
            id v31 = (os_log_s *)objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
            {
              *(_WORD *)buf = 0;
              _os_log_error_impl( &dword_188846000,  v31,  OS_LOG_TYPE_ERROR,  "***INTERNAL BUILD REQUEST: If you see this, file a Radar in MobileContainerManager | all with the following data:",  buf,  2u);
            }

            container_log_handle_for_category();
            int v32 = (os_log_s *)objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
            {
              *(_WORD *)buf = 0;
              _os_log_error_impl( &dword_188846000,  v32,  OS_LOG_TYPE_ERROR,  "\tSomeone is writing invalid data to a container, which has now been orphaned. Here are the invalid files:",  buf,  2u);
            }
            v33 = +[MCMFileManager defaultManager](&OBJC_CLASS___MCMFileManager, "defaultManager");
            [v33 printDirectoryStructureAtURL:v15];

            container_log_handle_for_category();
            v34 = (os_log_s *)objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
            {
              *(_WORD *)buf = 0;
              _os_log_error_impl(&dword_188846000, v34, OS_LOG_TYPE_ERROR, "***END INTERNAL BUILD REQUEST", buf, 2u);
            }
          }

          -[MCMClientConnection context](self, "context");
          uint64_t v35 = (void *)objc_claimAutoreleasedReturnValue();
          [v35 containerFactory];
          uint64_t v36 = (void *)objc_claimAutoreleasedReturnValue();
          id v43 = 0LL;
          char v37 = [v36 deleteURL:v15 forUserIdentity:v41 error:&v43];
          id v19 = v43;

          if ((v37 & 1) != 0) {
            goto LABEL_28;
          }
          container_log_handle_for_category();
          id v26 = (os_log_s *)objc_claimAutoreleasedReturnValue();
          v13 = &OBJC_CLASS___MCMContainerStagingPath;
          if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
          {
            [v15 path];
            uint64_t v38 = (os_log_s *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = v40;
            uint64_t v45 = v38;
            __int16 v46 = 2112;
            id v47 = v19;
            _os_log_error_impl( &dword_188846000,  v26,  OS_LOG_TYPE_ERROR,  "Failed to delete [%@]; error = %@",
              buf,
              0x16u);

            v13 = &OBJC_CLASS___MCMContainerStagingPath;
          }
        }

        else
        {
          container_log_handle_for_category();
          id v19 = (id)objc_claimAutoreleasedReturnValue();
          if (!os_log_type_enabled((os_log_t)v19, OS_LOG_TYPE_DEFAULT)) {
            goto LABEL_32;
          }
          [v15 path];
          id v26 = (os_log_s *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412290;
          uint64_t v45 = v26;
          _os_log_impl( &dword_188846000,  (os_log_t)v19,  OS_LOG_TYPE_DEFAULT,  "Ignoring deleted container path during cleanup: [%@]",  buf,  0xCu);
        }

LABEL_32:
      }

      uint64_t v11 = [obj countByEnumeratingWithState:&v49 objects:v48 count:16];
    }

    while (v11);
  }
}

- (BOOL)_containerURL:(id)a3 isValidForContainerClass:(unint64_t)a4
{
  id v5 = a3;
  id v6 = objc_alloc(MEMORY[0x189607AB8]);
  [v5 lastPathComponent];
  id v7 = (void *)objc_claimAutoreleasedReturnValue();
  id v8 = (void *)[v6 initWithUUIDString:v7];

  if (a4 == 12)
  {
    +[MCMEntitlementBypassList sharedBypassList](&OBJC_CLASS___MCMEntitlementBypassList, "sharedBypassList");
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue();
    [v5 lastPathComponent];
    __int128 v10 = (void *)objc_claimAutoreleasedReturnValue();
    char v11 = [v9 systemContainerIdIsWellknown:v10];
  }

  else
  {
    if (a4 != 13)
    {
LABEL_7:
      BOOL v13 = v8 != 0LL;
      goto LABEL_8;
    }

    +[MCMEntitlementBypassList sharedBypassList](&OBJC_CLASS___MCMEntitlementBypassList, "sharedBypassList");
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue();
    [v5 lastPathComponent];
    __int128 v10 = (void *)objc_claimAutoreleasedReturnValue();
    char v11 = [v9 systemGroupContainerIdIsWellknown:v10];
  }

  char v12 = v11;

  if ((v12 & 1) == 0) {
    goto LABEL_7;
  }
  BOOL v13 = 1;
LABEL_8:

  return v13;
}

- (void)_cleanupOprhanedCodeSigningMappingData
{
  uint64_t v8 = *MEMORY[0x1895F89C0];
  id v5 = 0LL;
  char v2 = [(id)gCodeSigningMapping removeAllAdvanceCopiesWithError:&v5];
  id v3 = v5;
  if ((v2 & 1) == 0)
  {
    container_log_handle_for_category();
    id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v7 = v3;
      _os_log_error_impl( &dword_188846000,  v4,  OS_LOG_TYPE_ERROR,  "Could not remove advance copies of code sign data: %@",  buf,  0xCu);
    }
  }
}

- (void)rebootContainerManagerSetup
{
  uint64_t v22 = *MEMORY[0x1895F89C0];
  id v3 = (void *)objc_opt_new();
  if ([v3 isBuildUpgrade])
  {
    -[MCMClientConnection _regenerateContainerPaths](self, "_regenerateContainerPaths");
    +[MCMContainerMigrator sharedInstance](&OBJC_CLASS___MCMContainerMigrator, "sharedInstance");
    id v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[MCMClientConnection context](self, "context");
    id v5 = (void *)objc_claimAutoreleasedReturnValue();
    id v19 = 0LL;
    char v6 = [v4 performSynchronousBuildUpgradeMigration:v3 context:v5 error:&v19];
    id v7 = v19;

    if ((v6 & 1) == 0)
    {
      container_log_handle_for_category();
      uint64_t v8 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        uint32_t multiuser_flags = 138412290;
        id v21 = v7;
        _os_log_error_impl( &dword_188846000,  v8,  OS_LOG_TYPE_ERROR,  "Failed to perform build upgrade migration : %@",  (uint8_t *)&multiuser_flags,  0xCu);
      }
    }

    [v3 writeCurrentBuildInfoToDisk];
  }

  int v18 = 0;
  id v17 = 0LL;
  char v9 = [(id)gCodeSigningMapping removeAllInvalidPluginCodeSigningEntriesWithNumRemoved:&v18 error:&v17];
  id v10 = v17;
  if ((v9 & 1) == 0)
  {
    container_log_handle_for_category();
    char v11 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      uint32_t multiuser_flags = 138412290;
      id v21 = v10;
      _os_log_error_impl( &dword_188846000,  v11,  OS_LOG_TYPE_ERROR,  "Failed to remove invalid plugin codesign entries; error = %@",
        (uint8_t *)&multiuser_flags,
        0xCu);
    }
  }

  id v12 = containermanager_copy_global_configuration();
  int v13 = [v12 dispositionForContainerClass:7];

  if (v13 == 1)
  {
    if (v18 > 0
      || (multiuser_flags = 0, host_t v14 = MEMORY[0x1895CE2D0](), !host_get_multiuser_config_flags(v14, &multiuser_flags))
      && (multiuser_flags & 0x80000000) != 0)
    {
      +[MCMGroupManager defaultManager](&OBJC_CLASS___MCMGroupManager, "defaultManager");
      uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[MCMClientConnection context](self, "context");
      BOOL v16 = (void *)objc_claimAutoreleasedReturnValue();
      [v15 reconcileGroupContainersForContainerClass:7 context:v16];
    }
  }
}

- (void)_cleanTransientUserContainersWithContainerConfig:(id)a3
{
  uint64_t v11 = *MEMORY[0x1895F89C0];
  id v4 = a3;
  -[MCMClientConnection context](self, "context");
  id v5 = (void *)objc_claimAutoreleasedReturnValue();
  [v5 userIdentityCache];
  char v6 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1895F87A8];
  v8[1] = 3221225472LL;
  v8[2] = __72__MCMClientConnection__cleanTransientUserContainersWithContainerConfig___block_invoke;
  v8[3] = &unk_18A29D250;
  id v9 = v4;
  id v10 = self;
  id v7 = v4;
  [v6 forEachAccessibleUserIdentitySynchronouslyExecuteBlock:v8];
}

- (void)_cleanTransientContainersWithContainerConfig:(id)a3
{
  uint64_t v17 = *MEMORY[0x1895F89C0];
  id v4 = a3;
  if (([v4 usesGlobalBundleUserIdentity] & 1) != 0
    || [v4 usesGlobalSystemUserIdentity])
  {
    +[MCMContainerClassTransientPath transientGlobalURL]( &OBJC_CLASS___MCMContainerClassTransientPath,  "transientGlobalURL");
    id v5 = (void *)objc_claimAutoreleasedReturnValue();
    if ([v4 usesGlobalBundleUserIdentity])
    {
      uint64_t v6 = +[MCMContainerClassTransientPath transientGlobalBundleURL]( &OBJC_CLASS___MCMContainerClassTransientPath,  "transientGlobalBundleURL");

      id v5 = (void *)v6;
    }

    if (v5)
    {
      -[MCMClientConnection context](self, "context");
      id v7 = (void *)objc_claimAutoreleasedReturnValue();
      [v7 containerFactory];
      uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
      id v12 = 0LL;
      char v9 = [v8 deleteURL:v5 forUserIdentity:0 error:&v12];
      id v10 = v12;

      if ((v9 & 1) == 0)
      {
        container_log_handle_for_category();
        uint64_t v11 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412546;
          host_t v14 = v5;
          __int16 v15 = 2112;
          id v16 = v10;
          _os_log_error_impl( &dword_188846000,  v11,  OS_LOG_TYPE_ERROR,  "Failed to delete shared transient bundle URL %@ : %@",  buf,  0x16u);
        }
      }
    }
  }

  else
  {
    -[MCMClientConnection _cleanTransientUserContainersWithContainerConfig:]( self,  "_cleanTransientUserContainersWithContainerConfig:",  v4);
  }
}

- (void)rebootContainerManagerCleanupWithCompletion:(id)a3
{
  uint64_t v50 = *MEMORY[0x1895F89C0];
  id v4 = a3;
  v44[0] = 0LL;
  v44[1] = v44;
  v44[2] = 0x3032000000LL;
  v44[3] = __Block_byref_object_copy_;
  v44[4] = __Block_byref_object_dispose_;
  id v45 = (id)os_transaction_create();
  v42[0] = 0LL;
  v42[1] = v42;
  v42[2] = 0x3032000000LL;
  v42[3] = __Block_byref_object_copy_;
  v42[4] = __Block_byref_object_dispose_;
  id v43 = 0LL;
  id v5 = containermanager_copy_global_configuration();
  BOOL v6 = [v5 dispositionForContainerClass:1] == 1;

  if (v6)
  {
    [MEMORY[0x189604030] fileURLWithPath:@"/private/var/installd/Library/Caches/com.apple.containermanagerd" isDirectory:1];
    id v7 = (void *)objc_claimAutoreleasedReturnValue();
    +[MCMFileManager defaultManager](&OBJC_CLASS___MCMFileManager, "defaultManager");
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
    int v9 = [v8 itemExistsAtURL:v7];

    if (v9)
    {
      container_log_handle_for_category();
      id v10 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        id v47 = v7;
        _os_log_error_impl( &dword_188846000,  v10,  OS_LOG_TYPE_ERROR,  "Sentencing legacy transient bundle directory [%@] to final deletion",  buf,  0xCu);
      }

      -[MCMClientConnection context](self, "context");
      uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue();
      [v11 containerFactory];
      id v12 = (void *)objc_claimAutoreleasedReturnValue();
      id v41 = 0LL;
      char v13 = [v12 deleteURL:v7 forUserIdentity:0 error:&v41];
      id v14 = v41;

      if ((v13 & 1) == 0)
      {
        container_log_handle_for_category();
        __int16 v15 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412546;
          id v47 = v7;
          __int16 v48 = 2112;
          id v49 = v14;
          _os_log_error_impl( &dword_188846000,  v15,  OS_LOG_TYPE_ERROR,  "Failed to delete legacy shared transient bundle URL %@ : %@",  buf,  0x16u);
        }
      }
    }
  }

  id v16 = containermanager_copy_global_configuration();
  [v16 classIterator];
  uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v18 = MEMORY[0x1895F87A8];
  v40[0] = MEMORY[0x1895F87A8];
  v40[1] = 3221225472LL;
  v40[2] = __67__MCMClientConnection_rebootContainerManagerCleanupWithCompletion___block_invoke;
  v40[3] = &unk_18A29D4A8;
  v40[4] = self;
  [v17 selectWithIterator:v40];

  id v19 = containermanager_copy_global_configuration();
  LODWORD(v17) = [v19 dispositionForContainerClass:2] == 1;

  if ((_DWORD)v17)
  {
    -[MCMClientConnection context](self, "context");
    char v20 = (void *)objc_claimAutoreleasedReturnValue();
    [v20 userIdentityCache];
    id v21 = (void *)objc_claimAutoreleasedReturnValue();
    v39[0] = v18;
    v39[1] = 3221225472LL;
    v39[2] = __67__MCMClientConnection_rebootContainerManagerCleanupWithCompletion___block_invoke_2;
    v39[3] = &unk_18A29CA98;
    v39[4] = self;
    v39[5] = v42;
    [v21 forEachAccessibleUserIdentitySynchronouslyExecuteBlock:v39];
  }

  -[MCMClientConnection context](self, "context");
  uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue();
  [v22 userIdentityCache];
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  [v23 defaultUserIdentity];
  id v24 = (void *)objc_claimAutoreleasedReturnValue();

  -[MCMClientConnection context](self, "context");
  char v25 = (void *)objc_claimAutoreleasedReturnValue();
  [v25 classIterator];
  id v26 = (void *)objc_claimAutoreleasedReturnValue();
  v35[0] = v18;
  v35[1] = 3221225472LL;
  v35[2] = __67__MCMClientConnection_rebootContainerManagerCleanupWithCompletion___block_invoke_30;
  v35[3] = &unk_18A29CA70;
  id v27 = v24;
  char v37 = self;
  uint64_t v38 = v42;
  id v36 = v27;
  [v26 selectGlobalWithIterator:v35];

  id v28 = (dispatch_queue_s *)MCMSharedBackgroundQueue();
  block[0] = v18;
  block[1] = 3221225472LL;
  block[2] = __67__MCMClientConnection_rebootContainerManagerCleanupWithCompletion___block_invoke_32;
  block[3] = &unk_18A29E378;
  void block[4] = self;
  dispatch_async(v28, block);

  id v29 = (dispatch_queue_s *)MCMSharedBackgroundQueue();
  v31[0] = v18;
  v31[1] = 3221225472LL;
  v31[2] = __67__MCMClientConnection_rebootContainerManagerCleanupWithCompletion___block_invoke_2_33;
  v31[3] = &unk_18A29CAC0;
  id v32 = v4;
  v33 = v44;
  id v30 = v4;
  dispatch_async(v29, v31);

  _Block_object_dispose(v42, 8);
  _Block_object_dispose(v44, 8);
}

- (void)_regenerateContainerPaths
{
  uint64_t v8 = *MEMORY[0x1895F89C0];
  container_log_handle_for_category();
  id v3 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_188846000, v3, OS_LOG_TYPE_DEFAULT, "Rolling system container directory UUIDs on disk", buf, 2u);
  }

  -[MCMClientConnection context](self, "context");
  id v4 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 classIterator];
  id v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1895F87A8];
  v6[1] = 3221225472LL;
  v6[2] = __48__MCMClientConnection__regenerateContainerPaths__block_invoke;
  v6[3] = &unk_18A29CB10;
  v6[4] = self;
  [v5 selectAutorollingWithUserIdentityIterator:v6];
}

- (void)_resumeDeleteOperations
{
  uint64_t v11 = *MEMORY[0x1895F89C0];
  id v3 = objc_alloc_init(&OBJC_CLASS___MCMResultPromise);
  -[MCMClientConnection _commandForResumedDeleteOperationsWithResultPromise:]( self,  "_commandForResumedDeleteOperationsWithResultPromise:",  v3);
  id v4 = (void *)objc_claimAutoreleasedReturnValue();
  id v5 = v4;
  if (v4)
  {
    [v4 execute];
    -[MCMResultPromise result](v3, "result");
    BOOL v6 = (void *)objc_claimAutoreleasedReturnValue();
    [v6 error];
    id v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
    {
      container_log_handle_for_category();
      uint64_t v8 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        int v9 = 138412290;
        id v10 = v7;
        _os_log_error_impl( &dword_188846000,  v8,  OS_LOG_TYPE_ERROR,  "Failed to destroy container(s) during resumed delete; error = %@",
          (uint8_t *)&v9,
          0xCu);
      }
    }
  }
}

- (id)_commandForResumedDeleteOperationsWithResultPromise:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_opt_new();
  -[MCMClientConnection context](self, "context");
  BOOL v6 = (void *)objc_claimAutoreleasedReturnValue();
  [v6 userIdentityCache];
  id v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[MCMDeleteManifest deleteManifestsForGlobalContainersWithUserIdentityCache:]( &OBJC_CLASS___MCMDeleteManifest,  "deleteManifestsForGlobalContainersWithUserIdentityCache:",  v7);
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
  [v5 unionSet:v8];

  -[MCMClientConnection context](self, "context");
  int v9 = (void *)objc_claimAutoreleasedReturnValue();
  [v9 userIdentityCache];
  id v10 = (void *)objc_claimAutoreleasedReturnValue();
  +[MCMDeleteManifest deleteManifestsForUserContainersWithUserIdentityCache:]( &OBJC_CLASS___MCMDeleteManifest,  "deleteManifestsForUserContainersWithUserIdentityCache:",  v10);
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue();
  [v5 unionSet:v11];

  if ([v5 count])
  {
    id v12 = objc_alloc(&OBJC_CLASS___MCMCommandOperationDelete);
    -[MCMClientConnection context](self, "context");
    char v13 = (void *)objc_claimAutoreleasedReturnValue();
    id v14 = -[MCMCommandOperationDelete initWithManifests:waitForDiskSpaceReclaim:removeAllCodeSignInfo:context:resultPromise:]( v12,  "initWithManifests:waitForDiskSpaceReclaim:removeAllCodeSignInfo:context:resultPromise:",  v5,  0LL,  0LL,  v13,  v4);
  }

  else
  {
    id v14 = 0LL;
  }

  return v14;
}

- (MCMCommandContext)context
{
  return self->_context;
}

- (void).cxx_destruct
{
}

void __48__MCMClientConnection__regenerateContainerPaths__block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v25 = *MEMORY[0x1895F89C0];
  id v5 = a3;
  id v6 = a2;
  id v7 = containermanager_copy_global_configuration();
  [v7 classPathCache];
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
  [v8 containerClassPathForUserIdentity:v5 containerConfig:v6 typeClass:objc_opt_class()];
  int v9 = (void *)objc_claimAutoreleasedReturnValue();

  id v10 = objc_alloc(&OBJC_CLASS___MCMContainerClassCache);
  uint64_t v11 = objc_opt_class();
  [*(id *)(a1 + 32) context];
  id v12 = (void *)objc_claimAutoreleasedReturnValue();
  [v12 userIdentityCache];
  char v13 = (void *)objc_claimAutoreleasedReturnValue();
  id v14 = -[MCMContainerClassCache initWithContainerClassPath:cacheEntryClass:targetQueue:userIdentityCache:]( v10,  "initWithContainerClassPath:cacheEntryClass:targetQueue:userIdentityCache:",  v9,  v11,  0LL,  v13);

  __int16 v15 = objc_alloc(&OBJC_CLASS___MCMContainerClassCache);
  uint64_t v16 = objc_opt_class();
  [*(id *)(a1 + 32) context];
  uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue();
  [v17 userIdentityCache];
  uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue();
  id v19 = -[MCMContainerClassCache initWithContainerClassPath:cacheEntryClass:targetQueue:userIdentityCache:]( v15,  "initWithContainerClassPath:cacheEntryClass:targetQueue:userIdentityCache:",  v9,  v16,  0LL,  v18);

  -[MCMContainerClassCache waitForSynchronizationToComplete](v14, "waitForSynchronizationToComplete");
  [*(id *)(a1 + 32) context];
  char v20 = (void *)objc_claimAutoreleasedReturnValue();
  [v20 containerCache];
  id v21 = (void *)objc_claimAutoreleasedReturnValue();
  [v21 setContainerClassCache:v19];

  v23[0] = MEMORY[0x1895F87A8];
  v23[1] = 3221225472LL;
  v23[2] = __48__MCMClientConnection__regenerateContainerPaths__block_invoke_2;
  v23[3] = &unk_18A29CAE8;
  v23[4] = *(void *)(a1 + 32);
  id v24 = v19;
  uint64_t v22 = v19;
  -[MCMContainerClassCache enumerateCacheEntriesWithEnumerator:](v14, "enumerateCacheEntriesWithEnumerator:", v23);
}

uint64_t __48__MCMClientConnection__regenerateContainerPaths__block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v41 = *MEMORY[0x1895F89C0];
  id v3 = a2;
  +[MCMEntitlementBypassList sharedBypassList](&OBJC_CLASS___MCMEntitlementBypassList, "sharedBypassList");
  id v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[MCMContainerCacheEntry identifier](v3, "identifier");
  id v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[MCMContainerCacheEntry containerPath](v3, "containerPath");
  id v6 = (void *)objc_claimAutoreleasedReturnValue();
  [v6 containerClassPath];
  id v7 = (void *)objc_claimAutoreleasedReturnValue();
  char v8 = objc_msgSend(v4, "containerIdIsWellknown:class:", v5, objc_msgSend(v7, "containerClass"));

  int v9 = v3;
  if ((v8 & 1) == 0)
  {
    id v34 = 0LL;
    -[MCMContainerCacheEntry metadataWithError:](v3, "metadataWithError:", &v34);
    id v10 = (void *)objc_claimAutoreleasedReturnValue();
    id v11 = v34;
    if (v10)
    {
      id v12 = objc_alloc(&OBJC_CLASS___MCMCommandRegenerateDirectoryUUID);
      [v10 containerIdentity];
      char v13 = (void *)objc_claimAutoreleasedReturnValue();
      [*(id *)(a1 + 32) context];
      id v14 = (void *)objc_claimAutoreleasedReturnValue();
      __int16 v15 = -[MCMCommandRegenerateDirectoryUUID initWithConcreteContainerIdentity:context:resultPromise:]( v12,  "initWithConcreteContainerIdentity:context:resultPromise:",  v13,  v14,  0LL);

      id v33 = v11;
      -[MCMCommandRegenerateDirectoryUUID regenerateDirectoryUUIDNoCacheUpdateWithMetadata:error:]( v15,  "regenerateDirectoryUUIDNoCacheUpdateWithMetadata:error:",  v10,  &v33);
      uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue();
      id v17 = v33;

      if (v16)
      {
        uint64_t v18 = objc_alloc(&OBJC_CLASS___MCMContainerCacheEntry);
        [*(id *)(a1 + 32) context];
        id v19 = (void *)objc_claimAutoreleasedReturnValue();
        [v19 userIdentityCache];
        char v20 = (void *)objc_claimAutoreleasedReturnValue();
        int v9 = -[MCMContainerCacheEntry initWithMetadata:userIdentityCache:]( v18,  "initWithMetadata:userIdentityCache:",  v16,  v20);
      }

      else
      {
        container_log_handle_for_category();
        id v19 = (void *)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled((os_log_t)v19, OS_LOG_TYPE_ERROR))
        {
          -[MCMContainerCacheEntry identifier](v3, "identifier");
          id v29 = (void *)objc_claimAutoreleasedReturnValue();
          -[MCMContainerCacheEntry containerPath](v3, "containerPath");
          id v30 = (void *)objc_claimAutoreleasedReturnValue();
          [v30 containerClassPath];
          id v31 = (void *)objc_claimAutoreleasedReturnValue();
          uint64_t v32 = [v31 containerClass];
          *(_DWORD *)buf = 138412802;
          id v36 = v29;
          __int16 v37 = 2048;
          uint64_t v38 = v32;
          __int16 v39 = 2112;
          id v40 = v17;
          _os_log_error_impl( &dword_188846000,  (os_log_t)v19,  OS_LOG_TYPE_ERROR,  "Failed to regenerate directory UUID for identifier: %@, class: %llu, error = %@",  buf,  0x20u);
        }

        int v9 = v3;
      }
    }

    else
    {
      container_log_handle_for_category();
      __int16 v15 = (MCMCommandRegenerateDirectoryUUID *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled((os_log_t)v15, OS_LOG_TYPE_ERROR))
      {
        -[MCMContainerCacheEntry identifier](v3, "identifier");
        uint64_t v25 = (void *)objc_claimAutoreleasedReturnValue();
        -[MCMContainerCacheEntry containerPath](v3, "containerPath");
        id v26 = (void *)objc_claimAutoreleasedReturnValue();
        [v26 containerClassPath];
        id v27 = (void *)objc_claimAutoreleasedReturnValue();
        uint64_t v28 = [v27 containerClass];
        *(_DWORD *)buf = 138412802;
        id v36 = v25;
        __int16 v37 = 2048;
        uint64_t v38 = v28;
        __int16 v39 = 2112;
        id v40 = v11;
        _os_log_error_impl( &dword_188846000,  (os_log_t)v15,  OS_LOG_TYPE_ERROR,  "Failed to regenerate directory UUID (couldn't read metadata) for identifier: %@, class: %llu; error = %@",
          buf,
          0x20u);
      }

      id v17 = v11;
      int v9 = v3;
    }
  }

  id v21 = *(void **)(a1 + 40);
  -[MCMContainerCacheEntry identifier](v9, "identifier");
  uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue();
  id v23 = (id)[v21 setCacheEntry:v9 forIdentifier:v22];

  return 1LL;
}

void __67__MCMClientConnection_rebootContainerManagerCleanupWithCompletion___block_invoke( uint64_t a1,  void *a2)
{
  id v3 = a2;
}

void __67__MCMClientConnection_rebootContainerManagerCleanupWithCompletion___block_invoke_2( uint64_t a1,  void *a2)
{
  uint64_t v12 = *MEMORY[0x1895F89C0];
  id v3 = a2;
  if ([v3 homeDirectoryExists])
  {
    [*(id *)(a1 + 32) context];
    id v4 = (void *)objc_claimAutoreleasedReturnValue();
    [v4 classIterator];
    id v5 = (void *)objc_claimAutoreleasedReturnValue();
    v7[0] = MEMORY[0x1895F87A8];
    v7[1] = 3221225472LL;
    v7[2] = __67__MCMClientConnection_rebootContainerManagerCleanupWithCompletion___block_invoke_3;
    v7[3] = &unk_18A29CA70;
    char v8 = (os_log_s *)v3;
    __int128 v9 = *(_OWORD *)(a1 + 32);
    [v5 selectUserWithIterator:v7];

    id v6 = v8;
  }

  else
  {
    container_log_handle_for_category();
    id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412290;
      id v11 = v3;
      _os_log_debug_impl( &dword_188846000,  v6,  OS_LOG_TYPE_DEBUG,  "Skipping orphan cleanup of data containers since home directory doesn't exist for %@",  buf,  0xCu);
    }
  }
}

void __67__MCMClientConnection_rebootContainerManagerCleanupWithCompletion___block_invoke_30( void *a1,  void *a2)
{
  uint64_t v22 = *MEMORY[0x1895F89C0];
  id v3 = a2;
  id v4 = containermanager_copy_global_configuration();
  [v4 classPathCache];
  id v5 = (void *)objc_claimAutoreleasedReturnValue();
  [v5 containerClassPathForUserIdentity:a1[4] containerConfig:v3 typeClass:objc_opt_class()];
  id v6 = (void *)objc_claimAutoreleasedReturnValue();

  +[MCMFileManager defaultManager](&OBJC_CLASS___MCMFileManager, "defaultManager");
  id v7 = (void *)objc_claimAutoreleasedReturnValue();
  [v6 classURL];
  char v8 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v9 = *(void *)(a1[6] + 8LL);
  obuint64_t j = *(id *)(v9 + 40);
  [v7 urlsForItemsInDirectoryAtURL:v8 error:&obj];
  id v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_storeStrong((id *)(v9 + 40), obj);

  if (v10)
  {
    [v6 setExists:1];
    id v11 = (dispatch_queue_s *)MCMSharedBackgroundQueue();
    v16[0] = MEMORY[0x1895F87A8];
    v16[1] = 3221225472LL;
    v16[2] = __67__MCMClientConnection_rebootContainerManagerCleanupWithCompletion___block_invoke_2_31;
    v16[3] = &unk_18A29DDB8;
    v16[4] = a1[5];
    id v17 = v10;
    id v18 = v3;
    dispatch_async(v11, v16);
  }

  else
  {
    [*(id *)(*(void *)(a1[6] + 8) + 40) domain];
    uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue();
    if ([v12 isEqualToString:*MEMORY[0x189607688]])
    {
      uint64_t v13 = [*(id *)(*(void *)(a1[6] + 8) + 40) code];

      if (v13 == 2) {
        goto LABEL_10;
      }
    }

    else
    {
    }

    container_log_handle_for_category();
    id v14 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      uint64_t v15 = *(void *)(*(void *)(a1[6] + 8LL) + 40LL);
      *(_DWORD *)buf = 138412290;
      uint64_t v21 = v15;
      _os_log_error_impl(&dword_188846000, v14, OS_LOG_TYPE_ERROR, "Failed to get items : %@", buf, 0xCu);
    }
  }

uint64_t __67__MCMClientConnection_rebootContainerManagerCleanupWithCompletion___block_invoke_32(uint64_t a1)
{
  return [*(id *)(a1 + 32) _cleanupOprhanedCodeSigningMappingData];
}

void __67__MCMClientConnection_rebootContainerManagerCleanupWithCompletion___block_invoke_2_33(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (v2) {
    (*(void (**)(void))(v2 + 16))();
  }
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8LL);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = 0LL;
}

uint64_t __67__MCMClientConnection_rebootContainerManagerCleanupWithCompletion___block_invoke_2_31( uint64_t a1)
{
  return objc_msgSend( *(id *)(a1 + 32),  "_cleanupOrphanedDataForDirectories:containerClass:forUserIdentity:",  *(void *)(a1 + 40),  objc_msgSend(*(id *)(a1 + 48), "containerClass"),  0);
}

void __67__MCMClientConnection_rebootContainerManagerCleanupWithCompletion___block_invoke_3( uint64_t a1,  void *a2)
{
  uint64_t v29 = *MEMORY[0x1895F89C0];
  id v3 = a2;
  id v4 = containermanager_copy_global_configuration();
  [v4 classPathCache];
  id v5 = (void *)objc_claimAutoreleasedReturnValue();
  [v5 containerClassPathForUserIdentity:*(void *)(a1 + 32) containerConfig:v3 typeClass:objc_opt_class()];
  id v6 = (void *)objc_claimAutoreleasedReturnValue();

  +[MCMFileManager defaultManager](&OBJC_CLASS___MCMFileManager, "defaultManager");
  id v7 = (void *)objc_claimAutoreleasedReturnValue();
  [v6 classURL];
  char v8 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v9 = *(void *)(*(void *)(a1 + 48) + 8LL);
  obuint64_t j = *(id *)(v9 + 40);
  [v7 urlsForItemsInDirectoryAtURL:v8 error:&obj];
  id v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_storeStrong((id *)(v9 + 40), obj);

  if (v10)
  {
    [v6 setExists:1];
    id v11 = (dispatch_queue_s *)MCMSharedBackgroundQueue();
    block[0] = MEMORY[0x1895F87A8];
    block[1] = 3221225472LL;
    block[2] = __67__MCMClientConnection_rebootContainerManagerCleanupWithCompletion___block_invoke_4;
    block[3] = &unk_18A29D458;
    void block[4] = *(void *)(a1 + 40);
    id v19 = v10;
    id v20 = v3;
    id v21 = *(id *)(a1 + 32);
    dispatch_async(v11, block);
  }

  else
  {
    [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) domain];
    uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue();
    if ([v12 isEqualToString:*MEMORY[0x189607688]])
    {
      uint64_t v13 = [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) code];

      if (v13 == 2) {
        goto LABEL_10;
      }
    }

    else
    {
    }

    container_log_handle_for_category();
    id v14 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      uint64_t v15 = *(void *)(a1 + 32);
      uint64_t v16 = [v3 containerClass];
      uint64_t v17 = *(void *)(*(void *)(*(void *)(a1 + 48) + 8LL) + 40LL);
      *(_DWORD *)buf = 138412802;
      uint64_t v24 = v15;
      __int16 v25 = 2048;
      uint64_t v26 = v16;
      __int16 v27 = 2112;
      uint64_t v28 = v17;
      _os_log_error_impl( &dword_188846000,  v14,  OS_LOG_TYPE_ERROR,  "Skipping orphan cleanup of data containers for %@, %llu; error = %@",
        buf,
        0x20u);
    }
  }

uint64_t __67__MCMClientConnection_rebootContainerManagerCleanupWithCompletion___block_invoke_4(uint64_t a1)
{
  return objc_msgSend( *(id *)(a1 + 32),  "_cleanupOrphanedDataForDirectories:containerClass:forUserIdentity:",  *(void *)(a1 + 40),  objc_msgSend(*(id *)(a1 + 48), "containerClass"),  *(void *)(a1 + 56));
}

void __72__MCMClientConnection__cleanTransientUserContainersWithContainerConfig___block_invoke( uint64_t a1,  void *a2)
{
  uint64_t v15 = *MEMORY[0x1895F89C0];
  id v3 = a2;
  if (-[os_log_s homeDirectoryExists](v3, "homeDirectoryExists"))
  {
    +[MCMContainerClassTransientPath transientURLWithUserIdentity:withContainerClass:]( MCMContainerClassTransientPath,  "transientURLWithUserIdentity:withContainerClass:",  v3,  [*(id *)(a1 + 32) containerClass]);
    id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    [*(id *)(a1 + 40) context];
    id v5 = (void *)objc_claimAutoreleasedReturnValue();
    [v5 containerFactory];
    id v6 = (void *)objc_claimAutoreleasedReturnValue();
    id v10 = 0LL;
    char v7 = [v6 deleteURL:v4 forUserIdentity:v3 error:&v10];
    id v8 = v10;

    if ((v7 & 1) == 0)
    {
      container_log_handle_for_category();
      uint64_t v9 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412546;
        uint64_t v12 = v4;
        __int16 v13 = 2112;
        id v14 = v8;
        _os_log_error_impl( &dword_188846000,  v9,  OS_LOG_TYPE_ERROR,  "Failed to delete per-user transient URL %@ : %@",  buf,  0x16u);
      }
    }
  }

  else
  {
    container_log_handle_for_category();
    id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412290;
      uint64_t v12 = v3;
      _os_log_debug_impl( &dword_188846000,  v4,  OS_LOG_TYPE_DEBUG,  "Skipping cleanup of transient data containers since home directory doesn't exist for %@",  buf,  0xCu);
    }
  }
}

void __61__MCMClientConnection_containerManagerCleanupWithCompletion___block_invoke( uint64_t a1,  void *a2,  void *a3)
{
  uint64_t v31 = *MEMORY[0x1895F89C0];
  id v5 = a2;
  id v6 = a3;
  __int128 v27 = 0u;
  __int128 v28 = 0u;
  __int128 v29 = 0u;
  __int128 v30 = 0u;
  obuint64_t j = v5;
  uint64_t v7 = [v5 countByEnumeratingWithState:&v27 objects:v26 count:16];
  if (v7)
  {
    uint64_t v9 = v7;
    uint64_t v10 = *(void *)v28;
    *(void *)&__int128 v8 = 138412546LL;
    __int128 v19 = v8;
    do
    {
      uint64_t v11 = 0LL;
      do
      {
        if (*(void *)v28 != v10) {
          objc_enumerationMutation(obj);
        }
        uint64_t v12 = *(void **)(*((void *)&v27 + 1) + 8 * v11);
        objc_msgSend(*(id *)(a1 + 32), "context", v19);
        __int16 v13 = (void *)objc_claimAutoreleasedReturnValue();
        [v13 containerFactory];
        id v14 = (void *)objc_claimAutoreleasedReturnValue();
        id v21 = 0LL;
        char v15 = [v14 deleteURL:v12 forUserIdentity:v6 error:&v21];
        id v16 = v21;

        if ((v15 & 1) == 0)
        {
          container_log_handle_for_category();
          uint64_t v17 = (os_log_s *)objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
          {
            [v12 path];
            id v18 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = v19;
            id v23 = v18;
            __int16 v24 = 2112;
            id v25 = v16;
            _os_log_error_impl( &dword_188846000,  v17,  OS_LOG_TYPE_ERROR,  "Failed to delete [%@]; error = %@",
              buf,
              0x16u);
          }
        }

        ++v11;
      }

      while (v9 != v11);
      uint64_t v9 = [obj countByEnumeratingWithState:&v27 objects:v26 count:16];
    }

    while (v9);
  }
}

uint64_t __61__MCMClientConnection_containerManagerCleanupWithCompletion___block_invoke_10(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16LL))( *(void *)(a1 + 40),  *(void *)(a1 + 32),  0LL);
}

void __61__MCMClientConnection_containerManagerCleanupWithCompletion___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v23 = *MEMORY[0x1895F89C0];
  id v3 = a2;
  +[MCMContainerClassStagingPath stagingURLWithUserIdentity:]( &OBJC_CLASS___MCMContainerClassStagingPath,  "stagingURLWithUserIdentity:",  v3);
  id v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[MCMFileManager defaultManager](&OBJC_CLASS___MCMFileManager, "defaultManager");
  id v5 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v6 = *(void *)(*(void *)(a1 + 40) + 8LL);
  obuint64_t j = *(id *)(v6 + 40);
  [v5 urlsForItemsInDirectoryAtURL:v4 error:&obj];
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_storeStrong((id *)(v6 + 40), obj);

  if (v7)
  {
    __int128 v8 = (dispatch_queue_s *)MCMSharedBackgroundQueue();
    v14[0] = MEMORY[0x1895F87A8];
    v14[1] = 3221225472LL;
    v14[2] = __61__MCMClientConnection_containerManagerCleanupWithCompletion___block_invoke_11;
    v14[3] = &unk_18A29DFE8;
    uint64_t v17 = (os_log_s *)*(id *)(a1 + 32);
    id v15 = v7;
    id v16 = v3;
    dispatch_async(v8, v14);

    uint64_t v9 = v17;
  }

  else
  {
    [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) domain];
    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue();
    if ([v10 isEqualToString:*MEMORY[0x189607688]])
    {
      uint64_t v11 = [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) code];

      if (v11 == 2) {
        goto LABEL_10;
      }
    }

    else
    {
    }

    container_log_handle_for_category();
    uint64_t v9 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      [v4 path];
      uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue();
      uint64_t v13 = *(void *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 40LL);
      *(_DWORD *)buf = 138412546;
      id v20 = v12;
      __int16 v21 = 2112;
      uint64_t v22 = v13;
      _os_log_error_impl( &dword_188846000,  v9,  OS_LOG_TYPE_ERROR,  "Failed to get items at per-user staging URL: %@ : %@",  buf,  0x16u);
    }
  }

LABEL_10:
}

void __61__MCMClientConnection_containerManagerCleanupWithCompletion___block_invoke_2_13(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x1895F89C0];
  uint64_t v2 = objc_alloc(&OBJC_CLASS___MCMResultPromise);
  uint64_t v7 = MEMORY[0x1895F87A8];
  uint64_t v8 = 3221225472LL;
  uint64_t v9 = __61__MCMClientConnection_containerManagerCleanupWithCompletion___block_invoke_3;
  uint64_t v10 = &unk_18A29CA48;
  id v11 = *(id *)(a1 + 40);
  id v3 = -[MCMResultPromise initWithCompletion:](v2, "initWithCompletion:", &v7);
  id v4 = objc_alloc(&OBJC_CLASS___MCMCommandOperationReclaimDiskSpace);
  objc_msgSend(*(id *)(a1 + 32), "context", v7, v8, v9, v10);
  id v5 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v6 = -[MCMCommandOperationReclaimDiskSpace initWithAsynchronously:context:resultPromise:]( v4,  "initWithAsynchronously:context:resultPromise:",  1LL,  v5,  v3);

  -[MCMCommandOperationReclaimDiskSpace execute](v6, "execute");
}

id __61__MCMClientConnection_containerManagerCleanupWithCompletion___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(void *)(a1 + 32);
  if (v4) {
    (*(void (**)(void))(v4 + 16))();
  }
  return v3;
}

uint64_t __61__MCMClientConnection_containerManagerCleanupWithCompletion___block_invoke_11(void *a1)
{
  return (*(uint64_t (**)(void, void, void))(a1[6] + 16LL))(a1[6], a1[4], a1[5]);
}

+ (id)sharedClientConnection
{
  if (sharedClientConnection_onceToken != -1) {
    dispatch_once(&sharedClientConnection_onceToken, &__block_literal_global_878);
  }
  return (id)sharedClientConnection_sharedConnection;
}

+ (id)privilegedClientConnectionWithUserIdentity:(id)a3 kernel:(BOOL)a4
{
  id v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[MCMUserIdentitySharedCache sharedInstance](&OBJC_CLASS___MCMUserIdentitySharedCache, "sharedInstance");
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v7 = objc_alloc(&OBJC_CLASS___MCMContainerFactory);
  uint64_t v8 = -[MCMContainerFactory initWithContainerCache:clientIdentity:userIdentityCache:]( v7,  "initWithContainerCache:clientIdentity:userIdentityCache:",  gContainerCache,  v5,  v6);
  uint64_t v9 = objc_alloc(&OBJC_CLASS___MCMCommandContext);
  uint64_t v10 = gContainerCache;
  id v11 = containermanager_copy_global_configuration();
  uint64_t v12 = -[MCMCommandContext initWithClientIdentity:containerCache:containerFactory:userIdentityCache:kernelPersonaID:globalConfiguration:]( v9,  "initWithClientIdentity:containerCache:containerFactory:userIdentityCache:kernelPersonaID:globalConfiguration:",  v5,  v10,  v8,  v6,  0LL,  v11);

  uint64_t v13 = (void *)[objc_alloc((Class)a1) initWithContext:v12];
  return v13;
}

+ (id)privilegedClientConnectionWithUserIdentity:(id)a3
{
  return (id)[a1 privilegedClientConnectionWithUserIdentity:a3 kernel:0];
}

void __45__MCMClientConnection_sharedClientConnection__block_invoke()
{
  uint64_t v0 = objc_opt_new();
  v1 = (void *)sharedClientConnection_sharedConnection;
  sharedClientConnection_sharedConnection = v0;
}

@end