@interface MCMDataProtectionManager
+ (id)defaultManager;
- (MCMDataProtectionManager)init;
- (OS_dispatch_queue)protectionOperationFileQueue;
- (int)desiredDataProtectionClassForMetadata:(id)a3 clientIdentity:(id)a4;
- (int)intendedDataProtectionClassBasedOnEntitlementsForIdentifier:(id)a3 clientIdentity:(id)a4 containerClass:(unint64_t)a5 info:(id)a6;
- (void)_startDataProtectionChangeOperation:(id)a3 withCompletion:(id)a4;
- (void)restartPendingDataProtectionOperations;
- (void)setDataProtectionOnDataContainerForMetadata:(id)a3 isSecondOrThirdPartyApp:(BOOL)a4 retryIfLocked:(BOOL)a5 deferUntilNextLaunch:(BOOL)a6 withCompletion:(id)a7;
@end

@implementation MCMDataProtectionManager

- (MCMDataProtectionManager)init
{
  uint64_t v8 = *MEMORY[0x1895F89C0];
  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS___MCMDataProtectionManager;
  v2 = -[MCMDataProtectionManager init](&v7, sel_init);
  if (v2)
  {
    dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v3 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue();
    dispatch_queue_t v4 = dispatch_queue_create("com.apple.MobileContainerManager.ProtectionOperationFileQueue", v3);
    protectionOperationFileQueue = v2->_protectionOperationFileQueue;
    v2->_protectionOperationFileQueue = (OS_dispatch_queue *)v4;
  }

  return v2;
}

- (void)_startDataProtectionChangeOperation:(id)a3 withCompletion:(id)a4
{
  uint64_t v34 = *MEMORY[0x1895F89C0];
  id v5 = a3;
  id v6 = a4;
  uint64_t v28 = 0LL;
  v29 = &v28;
  uint64_t v30 = 0x3032000000LL;
  v31 = __Block_byref_object_copy__8125;
  v32 = __Block_byref_object_dispose__8126;
  id v33 = 0LL;
  [v5 dataContainerMetadata];
  objc_super v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_initWeak(&location, v7);

  LODWORD(v7) = [v5 newDataProtectionClass];
  char v8 = [v5 retryIfLocked];
  v9 = objc_alloc(&OBJC_CLASS___MCMApplicationTerminationAssertion);
  id v10 = objc_loadWeakRetained(&location);
  [v10 identifier];
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v12 = -[MCMApplicationTerminationAssertion initWithBundleIdentifier:reason:]( v9,  "initWithBundleIdentifier:reason:",  v11,  @"preventing app launch during container data protection class change");
  v13 = (void *)v29[5];
  v29[5] = v12;

  uint64_t v14 = MEMORY[0x1895F87A8];
  v25[0] = MEMORY[0x1895F87A8];
  v25[1] = 3221225472LL;
  v25[2] = __79__MCMDataProtectionManager__startDataProtectionChangeOperation_withCompletion___block_invoke;
  v25[3] = &unk_18A29DBD8;
  v25[4] = &v28;
  objc_copyWeak(&v26, &location);
  [v5 setRetryStartBlock:v25];
  uint64_t v16 = v14;
  uint64_t v17 = 3221225472LL;
  v18 = __79__MCMDataProtectionManager__startDataProtectionChangeOperation_withCompletion___block_invoke_2;
  v19 = &unk_18A29DC00;
  objc_copyWeak(&v22, &location);
  int v23 = (int)v7;
  char v24 = v8;
  v21 = &v28;
  id v15 = v6;
  id v20 = v15;
  [v5 setCompletionBlock:&v16];
  objc_msgSend(v5, "performChangeOperation", v16, v17, v18, v19);

  objc_destroyWeak(&v22);
  objc_destroyWeak(&v26);
  objc_destroyWeak(&location);
  _Block_object_dispose(&v28, 8);
}

- (void)restartPendingDataProtectionOperations
{
  uint64_t v58 = *MEMORY[0x1895F89C0];
  id v3 = containermanager_copy_global_configuration();
  [v3 managedPathRegistry];
  dispatch_queue_t v4 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 containermanagerPendingUpdates];
  id v5 = (void *)objc_claimAutoreleasedReturnValue();

  [v5 url];
  id v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    +[MCMFileManager defaultManager](&OBJC_CLASS___MCMFileManager, "defaultManager");
    objc_super v7 = (void *)objc_claimAutoreleasedReturnValue();
    id v48 = 0LL;
    [v7 urlsForItemsInDirectoryAtURL:v6 error:&v48];
    char v8 = (void *)objc_claimAutoreleasedReturnValue();
    id v9 = v48;

    if (v8)
    {
      id v38 = v9;
      v39 = v6;
      v40 = v5;
      __int128 v56 = 0u;
      __int128 v57 = 0u;
      __int128 v54 = 0u;
      __int128 v55 = 0u;
      id v10 = v8;
      uint64_t v11 = [v10 countByEnumeratingWithState:&v54 objects:v53 count:16];
      if (v11)
      {
        uint64_t v12 = v11;
        uint64_t v13 = *(void *)v55;
        p_info = &OBJC_METACLASS___MCMXPCMessageSetDataProtection.info;
        uint64_t v41 = *(void *)v55;
        v42 = self;
        do
        {
          uint64_t v15 = 0LL;
          uint64_t v43 = v12;
          do
          {
            if (*(void *)v55 != v13) {
              objc_enumerationMutation(v10);
            }
            uint64_t v16 = *(void **)(*((void *)&v54 + 1) + 8 * v15);
            container_log_handle_for_category();
            uint64_t v17 = (os_log_s *)objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
            {
              [v16 path];
              v18 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138412290;
              *(void *)v50 = v18;
              _os_log_impl( &dword_188846000,  v17,  OS_LOG_TYPE_DEFAULT,  "Found pending data protection operation at %@",  buf,  0xCu);
            }
            v19 = -[MCMDataProtectionManager protectionOperationFileQueue](self, "protectionOperationFileQueue");
            id v47 = 0LL;
            [p_info + 6 dataProtectionChangeOperationAtURL:v16 queue:v19 error:&v47];
            id v20 = (void *)objc_claimAutoreleasedReturnValue();
            id v21 = v47;

            if (v20)
            {
              container_log_handle_for_category();
              id v22 = (os_log_s *)objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
              {
                int v23 = [v20 newDataProtectionClass];
                [v20 dataContainerMetadata];
                v44 = (void *)objc_claimAutoreleasedReturnValue();
                [v44 userIdentity];
                char v24 = (void *)objc_claimAutoreleasedReturnValue();
                [v20 dataContainerMetadata];
                v25 = (void *)objc_claimAutoreleasedReturnValue();
                [v25 identifier];
                id v26 = (void *)objc_claimAutoreleasedReturnValue();
                [v20 dataContainerMetadata];
                id v27 = v21;
                id v28 = v10;
                v29 = (void *)objc_claimAutoreleasedReturnValue();
                uint64_t v30 = [v29 containerClass];
                *(_DWORD *)buf = 67109890;
                *(_DWORD *)v50 = v23;
                uint64_t v12 = v43;
                *(_WORD *)&v50[4] = 2112;
                *(void *)&v50[6] = v24;
                *(_WORD *)&v50[14] = 2112;
                *(void *)&v50[16] = v26;
                __int16 v51 = 2048;
                uint64_t v52 = v30;
                _os_log_impl( &dword_188846000,  v22,  OS_LOG_TYPE_DEFAULT,  "Starting pending data protection update to protection class %d for user: %@, ID: %@, containerClass: %llu",  buf,  0x26u);

                id v10 = v28;
                id v21 = v27;

                self = v42;
                uint64_t v13 = v41;

                p_info = (__objc2_class_ro **)(&OBJC_METACLASS___MCMXPCMessageSetDataProtection + 32);
              }

              v31 = (dispatch_queue_s *)MCMDataProtectionQueue();
              block[0] = MEMORY[0x1895F87A8];
              block[1] = 3221225472LL;
              block[2] = __66__MCMDataProtectionManager_restartPendingDataProtectionOperations__block_invoke;
              block[3] = &unk_18A29E238;
              block[4] = self;
              id v46 = v20;
              dispatch_async(v31, block);
            }

            else
            {
              container_log_handle_for_category();
              v32 = (os_log_s *)objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
              {
                [v16 path];
                id v33 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 138412546;
                *(void *)v50 = v33;
                *(_WORD *)&v50[8] = 2112;
                *(void *)&v50[10] = v21;
                _os_log_error_impl( &dword_188846000,  v32,  OS_LOG_TYPE_ERROR,  "Failed to read data protection change operation at %@ : %@",  buf,  0x16u);
              }
            }

            ++v15;
          }

          while (v12 != v15);
          uint64_t v12 = [v10 countByEnumeratingWithState:&v54 objects:v53 count:16];
        }

        while (v12);
      }

      id v6 = v39;
      id v5 = v40;
      id v9 = v38;
    }

    else
    {
      [v9 domain];
      uint64_t v34 = (void *)objc_claimAutoreleasedReturnValue();
      if ([v34 isEqualToString:*MEMORY[0x189607688]])
      {
        uint64_t v35 = [v9 code];

        if (v35 == 2) {
          goto LABEL_30;
        }
      }

      else
      {
      }

      container_log_handle_for_category();
      id v10 = (id)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled((os_log_t)v10, OS_LOG_TYPE_ERROR))
      {
        [v5 url];
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        [v36 path];
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        *(void *)v50 = v37;
        *(_WORD *)&v50[8] = 2112;
        *(void *)&v50[10] = v9;
        _os_log_error_impl( &dword_188846000,  (os_log_t)v10,  OS_LOG_TYPE_ERROR,  "Failed to get items at pendingUpdates URL %@ : %@",  buf,  0x16u);
      }
    }
  }

  else
  {
    container_log_handle_for_category();
    id v10 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled((os_log_t)v10, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl( &dword_188846000,  (os_log_t)v10,  OS_LOG_TYPE_ERROR,  "Failed to get url for storing pending operations.",  buf,  2u);
    }

    id v9 = 0LL;
  }

LABEL_30:
}

- (void)setDataProtectionOnDataContainerForMetadata:(id)a3 isSecondOrThirdPartyApp:(BOOL)a4 retryIfLocked:(BOOL)a5 deferUntilNextLaunch:(BOOL)a6 withCompletion:(id)a7
{
  BOOL v43 = a6;
  BOOL v8 = a5;
  BOOL v9 = a4;
  uint64_t v59 = *MEMORY[0x1895F89C0];
  id v11 = a3;
  uint64_t v12 = (void (**)(id, uint64_t))a7;
  uint64_t v48 = 0LL;
  v49 = &v48;
  uint64_t v50 = 0x2020000000LL;
  uint64_t v51 = 1LL;
  uint64_t v13 = [v11 dataProtectionClass];
  unint64_t v14 = [v11 containerClass];
  if (v14 > 0xB || ((1 << v14) & 0xED4) == 0 || (uint64_t v15 = [v11 containerClass], v15 == 13) || v15 == 7)
  {
    v49[3] = 11LL;
    container_log_handle_for_category();
    uint64_t v16 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
LABEL_6:
      uint64_t v17 = 0LL;
      goto LABEL_7;
    }

    *(_DWORD *)buf = 138412290;
    *(void *)v53 = v11;
    id v27 = "Can't act on an invalid object: %@";
    goto LABEL_21;
  }

  [v11 containerPath];
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  [v18 containerClassPath];
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  char v20 = [v19 supportsDataProtection];

  if ((v20 & 1) == 0)
  {
    v49[3] = 72LL;
    container_log_handle_for_category();
    uint64_t v16 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
      goto LABEL_6;
    }
    uint64_t v26 = [v11 containerClass];
    *(_DWORD *)buf = 134217984;
    *(void *)v53 = v26;
    id v27 = "Data protection not supported for containers of class [%llu]";
LABEL_21:
    id v28 = v16;
    uint32_t v29 = 12;
LABEL_22:
    _os_log_error_impl(&dword_188846000, v28, OS_LOG_TYPE_ERROR, v27, buf, v29);
    goto LABEL_6;
  }

  uint64_t v21 = [v11 info];

  if (v21)
  {
    [v11 info];
    id v22 = (void *)objc_claimAutoreleasedReturnValue();
    [v22 objectForKeyedSubscript:@"com.apple.MobileInstallation.ContentProtectionClass"];
    int v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    id v24 = v23;
    if ((objc_opt_isKindOfClass() & 1) != 0) {
      id v25 = v24;
    }
    else {
      id v25 = 0LL;
    }

    if (v25) {
      uint64_t v21 = [v25 intValue];
    }
    else {
      uint64_t v21 = 0LL;
    }
  }

  [MEMORY[0x189607968] numberWithInt:v21];
  uint64_t v30 = (void *)objc_claimAutoreleasedReturnValue();
  [MEMORY[0x189607968] numberWithInt:v13];
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  int64_t v32 = +[MCMFileHandle compareDataProtectionClassTarget:withExisting:]( &OBJC_CLASS___MCMFileHandle,  "compareDataProtectionClassTarget:withExisting:",  v30,  v31);

  if (v32 == 3)
  {
    -[MCMDataProtectionManager protectionOperationFileQueue](self, "protectionOperationFileQueue");
    id v33 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1895F87A8];
    block[1] = 3221225472LL;
    block[2] = __146__MCMDataProtectionManager_setDataProtectionOnDataContainerForMetadata_isSecondOrThirdPartyApp_retryIfLocked_deferUntilNextLaunch_withCompletion___block_invoke;
    block[3] = &unk_18A29DC28;
    id v46 = (os_log_s *)v11;
    id v47 = &v48;
    dispatch_sync(v33, block);

    if (v12 && v49[3] == 1) {
      v12[2](v12, 1LL);
    }
    uint64_t v17 = 0LL;
    uint64_t v16 = v46;
  }

  else
  {
    if (!v32)
    {
      v49[3] = 72LL;
      container_log_handle_for_category();
      uint64_t v16 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
        goto LABEL_6;
      }
      *(_DWORD *)buf = 67109376;
      *(_DWORD *)v53 = v21;
      *(_WORD *)&v53[4] = 1024;
      *(_DWORD *)&v53[6] = v13;
      id v27 = "Unable to determine precedence of data protection; desired = %d, original = %d";
      id v28 = v16;
      uint32_t v29 = 14;
      goto LABEL_22;
    }

    if ((_DWORD)v21 == 2)
    {
      v49[3] = 38LL;
      container_log_handle_for_category();
      uint64_t v16 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
        goto LABEL_6;
      }
      *(_DWORD *)buf = 67109120;
      *(_DWORD *)v53 = 2;
      id v27 = "Data protection class %d is not allowed";
      goto LABEL_36;
    }

    if (v9 && (v21 > 7 || ((1 << v21) & 0x8B) == 0))
    {
      v49[3] = 38LL;
      container_log_handle_for_category();
      uint64_t v16 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
        goto LABEL_6;
      }
      *(_DWORD *)buf = 67109120;
      *(_DWORD *)v53 = v21;
      id v27 = "Data protection class %d is invalid for 2nd and 3rd party apps";
LABEL_36:
      id v28 = v16;
      uint32_t v29 = 8;
      goto LABEL_22;
    }

    int v34 = v21;
    -[MCMDataProtectionManager protectionOperationFileQueue](self, "protectionOperationFileQueue");
    uint64_t v35 = (void *)objc_claimAutoreleasedReturnValue();
    if (v32 == 1) {
      uint64_t v36 = 7LL;
    }
    else {
      uint64_t v36 = 1LL;
    }
    +[MCMDataProtectionChangeOperation dataProtectionChangeOperationWithContainerMetadata:settingClass:retryingIfLocked:changeType:queue:]( &OBJC_CLASS___MCMDataProtectionChangeOperation,  "dataProtectionChangeOperationWithContainerMetadata:settingClass:retryingIfLocked:changeType:queue:",  v11,  v21,  v8,  v36,  v35);
    uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue();

    id v44 = 0LL;
    char v37 = [v17 writeToDiskWithError:&v44];
    id v38 = (os_log_s *)v44;
    uint64_t v16 = v38;
    if ((v37 & 1) != 0)
    {
      if (!v43)
      {
        -[MCMDataProtectionManager _startDataProtectionChangeOperation:withCompletion:]( self,  "_startDataProtectionChangeOperation:withCompletion:",  v17,  v12);
        goto LABEL_7;
      }

      container_log_handle_for_category();
      v39 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
      {
        [v11 identifier];
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        uint64_t v41 = [v11 containerClass];
        *(_DWORD *)buf = 138413058;
        *(void *)v53 = v40;
        *(_WORD *)&v53[8] = 2048;
        uint64_t v54 = v41;
        __int16 v55 = 1024;
        int v56 = v13;
        __int16 v57 = 1024;
        int v58 = v34;
        _os_log_impl( &dword_188846000,  v39,  OS_LOG_TYPE_DEFAULT,  "Wrote DP class update operation for [%@(%llu)] %d → %d, deferred until next daemon launch.",  buf,  0x22u);
      }
    }

    else
    {
      uint64_t v42 = -[os_log_s type](v38, "type");
      v49[3] = v42;
      container_log_handle_for_category();
      v39 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        *(void *)v53 = v16;
        _os_log_error_impl( &dword_188846000,  v39,  OS_LOG_TYPE_ERROR,  "Failed to write data protection update file to disk: %@",  buf,  0xCu);
      }
    }
  }

- (int)intendedDataProtectionClassBasedOnEntitlementsForIdentifier:(id)a3 clientIdentity:(id)a4 containerClass:(unint64_t)a5 info:(id)a6
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a6;
  int v12 = 0;
  if (a5 <= 0xB && ((1LL << a5) & 0xE54) != 0)
  {
    [v10 codeSignInfo];
    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue();
    [v13 identifier];
    unint64_t v14 = (void *)objc_claimAutoreleasedReturnValue();
    int v15 = [v9 isEqualToString:v14];

    if (v15)
    {
      [v10 codeSignInfo];
      uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue();
      [v16 entitlements];
      id v17 = (id)objc_claimAutoreleasedReturnValue();
    }

    else
    {
      if (v11 && ([v10 isKernel] & 1) == 0)
      {
        [v11 objectForKeyedSubscript:@"com.apple.MobileInstallation.ContentProtectionClass"];
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        id v19 = v18;
        id v17 = (objc_opt_isKindOfClass() & 1) != 0 ? v19 : 0LL;

        if (v17)
        {
          int v20 = [v17 intValue];
LABEL_15:
          int v12 = v20;

          goto LABEL_16;
        }
      }

      uint64_t v21 = [(id)gCodeSigningMapping entitlementsForIdentifier:v9];
      if (!v21)
      {
        int v12 = 0;
        goto LABEL_16;
      }

      id v17 = (id)v21;
    }

    int v20 = [v17 intendedDataProtectionClass];
    goto LABEL_15;
  }

- (int)desiredDataProtectionClassForMetadata:(id)a3 clientIdentity:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  [v5 containerPath];
  objc_super v7 = (void *)objc_claimAutoreleasedReturnValue();
  [v7 containerClassPath];
  BOOL v8 = (void *)objc_claimAutoreleasedReturnValue();
  int v9 = [v8 supportsDataProtection];

  if (v9)
  {
    +[MCMDataProtectionManager defaultManager](&OBJC_CLASS___MCMDataProtectionManager, "defaultManager");
    id v10 = (void *)objc_claimAutoreleasedReturnValue();
    [v5 identifier];
    id v11 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v12 = [v5 containerClass];
    [v5 info];
    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue();
    int v14 = [v10 intendedDataProtectionClassBasedOnEntitlementsForIdentifier:v11 clientIdentity:v6 containerClass:v12 info:v13];
  }

  else
  {
    int v14 = -1;
  }

  return v14;
}

- (OS_dispatch_queue)protectionOperationFileQueue
{
  return self->_protectionOperationFileQueue;
}

- (void).cxx_destruct
{
}

void __146__MCMDataProtectionManager_setDataProtectionOnDataContainerForMetadata_isSecondOrThirdPartyApp_retryIfLocked_deferUntilNextLaunch_withCompletion___block_invoke( uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x1895F89C0];
  [*(id *)(a1 + 32) containerIdentity];
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  id v6 = 0LL;
  BOOL v3 = +[MCMDataProtectionChangeOperation deleteUpdateFileWithContainerIdentity:error:]( &OBJC_CLASS___MCMDataProtectionChangeOperation,  "deleteUpdateFileWithContainerIdentity:error:",  v2,  &v6);
  id v4 = v6;

  if (!v3)
  {
    container_log_handle_for_category();
    id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v8 = v4;
      _os_log_error_impl( &dword_188846000,  v5,  OS_LOG_TYPE_ERROR,  "Failed to delete existing data protection update file: %@",  buf,  0xCu);
    }

    *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = [v4 type];
  }
}

uint64_t __66__MCMDataProtectionManager_restartPendingDataProtectionOperations__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _startDataProtectionChangeOperation:*(void *)(a1 + 40) withCompletion:0];
}

void __79__MCMDataProtectionManager__startDataProtectionChangeOperation_withCompletion___block_invoke( uint64_t a1)
{
  v2 = *(void **)(*(void *)(*(void *)(a1 + 32) + 8LL) + 40LL);
  if (v2) {
    [v2 invalidate];
  }
  BOOL v3 = objc_alloc(&OBJC_CLASS___MCMApplicationTerminationAssertion);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained identifier];
  id v4 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v5 = -[MCMApplicationTerminationAssertion initWithBundleIdentifier:reason:]( v3,  "initWithBundleIdentifier:reason:",  v4,  @"preventing app launch during container data protection class change");
  uint64_t v6 = *(void *)(*(void *)(a1 + 32) + 8LL);
  objc_super v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v5;
}

void __79__MCMDataProtectionManager__startDataProtectionChangeOperation_withCompletion___block_invoke_2( uint64_t a1,  void *a2)
{
  uint64_t v24 = *MEMORY[0x1895F89C0];
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (v3)
  {
    uint64_t v5 = [v3 type];
    container_log_handle_for_category();
    uint64_t v6 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      [WeakRetained identifier];
      id v11 = (void *)objc_claimAutoreleasedReturnValue();
      [WeakRetained containerPath];
      uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue();
      [v12 containerDataURL];
      uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue();
      [v13 path];
      int v14 = (void *)objc_claimAutoreleasedReturnValue();
      int v15 = *(_DWORD *)(a1 + 56);
      int v16 = 138413058;
      id v17 = v11;
      __int16 v18 = 2112;
      id v19 = v14;
      __int16 v20 = 1024;
      int v21 = v15;
      __int16 v22 = 2112;
      id v23 = v3;
      _os_log_error_impl( &dword_188846000,  v6,  OS_LOG_TYPE_ERROR,  "Failed to set data protection on container with identifier %@ at %@ to %d: %@",  (uint8_t *)&v16,  0x26u);
    }

    if (v5 == 61)
    {
      if (*(_BYTE *)(a1 + 60))
      {
        container_log_handle_for_category();
        objc_super v7 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
        {
          LOWORD(v16) = 0;
          _os_log_error_impl( &dword_188846000,  v7,  OS_LOG_TYPE_ERROR,  "Unexpectedly got completion block called while locked",  (uint8_t *)&v16,  2u);
        }
      }

      uint64_t v5 = 61LL;
    }
  }

  else
  {
    uint64_t v5 = 1LL;
  }

  [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) invalidate];
  uint64_t v8 = *(void *)(*(void *)(a1 + 40) + 8LL);
  uint64_t v9 = *(void **)(v8 + 40);
  *(void *)(v8 + 40) = 0LL;

  uint64_t v10 = *(void *)(a1 + 32);
  if (v10) {
    (*(void (**)(uint64_t, uint64_t))(v10 + 16))(v10, v5);
  }
}

+ (id)defaultManager
{
  v3[5] = *MEMORY[0x1895F89C0];
  v3[0] = MEMORY[0x1895F87A8];
  v3[1] = 3221225472LL;
  v3[2] = __42__MCMDataProtectionManager_defaultManager__block_invoke;
  v3[3] = &__block_descriptor_40_e5_v8__0l;
  v3[4] = a1;
  if (defaultManager_onceToken != -1) {
    dispatch_once(&defaultManager_onceToken, v3);
  }
  return (id)defaultManager_defaultManager;
}

void __42__MCMDataProtectionManager_defaultManager__block_invoke()
{
  id v0 = objc_alloc_init((Class)objc_opt_class());
  v1 = (void *)defaultManager_defaultManager;
  defaultManager_defaultManager = (uint64_t)v0;
}

@end