@interface LSServer
@end

@implementation LSServer

void ___LSServer_RefreshContentInFrameworkAtURL_block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v44 = *MEMORY[0x1895F89C0];
  id v24 = a2;
  id v25 = a3;
  uint64_t v26 = a1;
  int v5 = _LSUnregisterPluginsInDirectory(*(const __CFURL **)(a1 + 32));
  if (v5)
  {
    _LSMakeNSErrorImpl( (void *)*MEMORY[0x189607670],  v5,  (uint64_t)"_LSServer_RefreshContentInFrameworkAtURL_block_invoke",  470LL,  0LL);
    id v27 = (id)objc_claimAutoreleasedReturnValue();
    _LSInstallLog();
    oslog = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(oslog, OS_LOG_TYPE_ERROR)) {
      ___LSServer_RefreshContentInFrameworkAtURL_block_invoke_cold_2();
    }
  }

  else
  {
    oslog = (os_log_s *)objc_alloc_init(MEMORY[0x189603FE0]);
    id v39 = 0LL;
    v40 = 0LL;
    int inited = _LSContextInitReturningError((uint64_t)&v40, (uint64_t)&v39);
    id v27 = v39;
    if (inited)
    {
      uint64_t v33 = MEMORY[0x1895F87A8];
      uint64_t v34 = 3254779904LL;
      v35 = ___LSServer_RefreshContentInFrameworkAtURL_block_invoke_2;
      v36 = &unk_189D72EB0;
      v38 = v40;
      v37 = oslog;
      _CSStoreEnumerateUnits();
      int v7 = _LSExtensionPointUnregisterUnderFrameworkURL(v40, *(void **)(a1 + 32));
      if (v7)
      {
        uint64_t v8 = _LSMakeNSErrorImpl( (void *)*MEMORY[0x189607670],  v7,  (uint64_t)"_LSServer_RefreshContentInFrameworkAtURL_block_invoke",  454LL,  0LL);

        id v27 = (id)v8;
      }

      v9 = v38;
    }

    else
    {
      _LSInstallLog();
      v9 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
        ___LSServer_RefreshContentInFrameworkAtURL_block_invoke_cold_1();
      }
    }

    if (!v27)
    {
      __int128 v31 = 0u;
      __int128 v32 = 0u;
      __int128 v29 = 0u;
      __int128 v30 = 0u;
      id v10 = *(id *)(a1 + 40);
      uint64_t v11 = [v10 countByEnumeratingWithState:&v29 objects:v43 count:16];
      if (v11)
      {
        uint64_t v12 = *(void *)v30;
        do
        {
          for (uint64_t i = 0LL; i != v11; ++i)
          {
            if (*(void *)v30 != v12) {
              objc_enumerationMutation(v10);
            }
            v14 = *(void **)(*((void *)&v29 + 1) + 8 * i);
            [v14 objectForKey:@"ApplicationType"];
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            if ([v15 isEqualToString:@"Framework"])
            {
              v16 = (objc_class *)MEMORY[0x189604030];
              id v17 = v14;
              id v18 = objc_alloc(v16);
              [v17 objectForKey:@"Path"];
              v19 = (void *)objc_claimAutoreleasedReturnValue();

              v20 = (const __CFURL *)[v18 initFileURLWithPath:v19 isDirectory:1];
              CFDictionaryRef v21 = CFBundleCopyInfoDictionaryForURL(v20);
              CFDictionaryRef v22 = v21;
              if (v21)
              {
                v23 = -[__CFDictionary objectForKeyedSubscript:](v21, "objectForKeyedSubscript:", @"NSExtensionSDK");
                v41[0] = MEMORY[0x1895F87A8];
                v41[1] = 3221225472LL;
                v41[2] = ___registerExtensionPointsFromMIFrameworkDictionary_block_invoke;
                v41[3] = &unk_189D73B78;
                v42 = v20;
                [v23 enumerateKeysAndObjectsUsingBlock:v41];
              }
            }

            else if ([v15 isEqualToString:@"PluginKitPlugin"])
            {
              _registerMIPluginDictionary(v14, oslog);
            }
          }

          uint64_t v11 = [v10 countByEnumeratingWithState:&v29 objects:v43 count:16];
        }

        while (v11);
      }
    }
  }

  (*(void (**)(void))(*(void *)(v26 + 48) + 16LL))();
}

void ___LSServer_RefreshContentInFrameworkAtURL_block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if ((*(_BYTE *)(a3 + 160) & 4) != 0)
  {
    id v4 = (id)_CSStringCopyCFString();
    [*(id *)(a1 + 32) addObject:v4];
  }

void ___LSServer_LSEnumerateAndRegisterAllBundles_block_invoke(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  v5[0] = MEMORY[0x1895F87A8];
  v5[1] = 3221225472LL;
  v5[2] = ___LSServer_LSEnumerateAndRegisterAllBundles_block_invoke_2;
  v5[3] = &unk_189D739B8;
  id v3 = v2;
  uint64_t v4 = *(void *)(a1 + 40);
  id v6 = v3;
  uint64_t v7 = v4;
  +[LSDatabaseRebuildContext withStatsGatherer:runWithRebuildContext:]( (uint64_t)&OBJC_CLASS___LSDatabaseRebuildContext,  v3,  v5);
}

void ___LSServer_LSEnumerateAndRegisterAllBundles_block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  _LSServer_DatabaseExecutionContext();
  uint64_t v4 = (os_unfair_lock_s *)objc_claimAutoreleasedReturnValue();
  -[LSDBExecutionContext assertNotActiveForThisThread](v4);

  _LSInstallLog();
  int v5 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl( &dword_183E58000,  v5,  OS_LOG_TYPE_DEFAULT,  "calling into InstalledContentLibrary to register all content",  buf,  2u);
  }

  *(void *)buf = 0LL;
  v36[0] = buf;
  v36[1] = 0x2020000000LL;
  char v37 = 1;
  uint64_t v6 = MEMORY[0x1895F87A8];
  uint64_t v7 = *(void *)(a1 + 32);
  v32[0] = MEMORY[0x1895F87A8];
  v32[1] = 3221225472LL;
  v32[2] = ___LSServer_LSEnumerateAndRegisterAllBundles_block_invoke_732;
  v32[3] = &unk_189D72C18;
  uint64_t v34 = buf;
  id v8 = v3;
  id v33 = v8;
  -[LSRebuildStatisticsGatherer performSystemContentScan:](v7, v32);
  _LSInstallLog();
  v9 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v28 = 0;
    _os_log_impl(&dword_183E58000, v9, OS_LOG_TYPE_DEFAULT, "finished enumerating system content.", v28, 2u);
  }

  *(void *)v28 = 0LL;
  __int128 v29 = v28;
  uint64_t v30 = 0x2020000000LL;
  char v31 = 0;
  uint64_t v10 = *(void *)(a1 + 32);
  v27[0] = v6;
  v27[1] = 3221225472LL;
  v27[2] = ___LSServer_LSEnumerateAndRegisterAllBundles_block_invoke_736;
  v27[3] = &unk_189D730E8;
  v27[4] = v28;
  -[LSRebuildStatisticsGatherer performSystemContentSave:](v10, v27);
  _LSInstallLog();
  uint64_t v11 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v24 = 0;
    _os_log_impl( &dword_183E58000,  v11,  OS_LOG_TYPE_DEFAULT,  "Performing upcall to register containerized content.",  v24,  2u);
  }

  *(void *)id v24 = 0LL;
  v25[0] = v24;
  v25[1] = 0x2020000000LL;
  char v26 = 1;
  _LSInstallLog();
  uint64_t v12 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v23 = 0;
    _os_log_impl( &dword_183E58000,  v12,  OS_LOG_TYPE_DEFAULT,  "finished enumerating system content. Performing upcall to register containerized content",  v23,  2u);
  }

  uint64_t v13 = *(void *)(a1 + 32);
  v20[0] = v6;
  v20[1] = 3221225472LL;
  v20[2] = ___LSServer_LSEnumerateAndRegisterAllBundles_block_invoke_738;
  v20[3] = &unk_189D72C18;
  CFDictionaryRef v22 = v24;
  id v14 = v8;
  id v21 = v14;
  -[LSRebuildStatisticsGatherer performContainerizedContentScan:](v13, v20);
  uint64_t v15 = -[LSDatabaseRebuildContext finishAndArmSaveTimer]((id *)v14);
  v16 = (void *)v15;
  if (*(_BYTE *)(v25[0] + 24LL) && *(_BYTE *)(v36[0] + 24LL))
  {
    char v17 = 1;
  }

  else
  {
    if (v15)
    {
      _LSInstallLog();
      id v18 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
        ___LSServer_LSEnumerateAndRegisterAllBundles_block_invoke_2_cold_2();
      }
    }

    _LSInstallLog();
    v19 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
      ___LSServer_LSEnumerateAndRegisterAllBundles_block_invoke_2_cold_1((uint64_t)v36, (uint64_t)v25, v19);
    }

    char v17 = 0;
  }

  *(_BYTE *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL) = v17;

  _Block_object_dispose(v24, 8);
  _Block_object_dispose(v28, 8);

  _Block_object_dispose(buf, 8);
}

void ___LSServer_LSEnumerateAndRegisterAllBundles_block_invoke_732(uint64_t a1)
{
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1895F87A8];
  v7[1] = 3221225472LL;
  v7[2] = ___LSServer_LSEnumerateAndRegisterAllBundles_block_invoke_2_734;
  v7[3] = &unk_189D73940;
  id v8 = *(id *)(a1 + 32);
  id v6 = 0LL;
  char v3 = [v2 enumerateBuiltInSystemContentWithBlock:v7 error:&v6];
  id v4 = v6;
  *(_BYTE *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL) = v3;

  if (!*(_BYTE *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL))
  {
    _LSInstallLog();
    int v5 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      ___LSServer_LSEnumerateAndRegisterAllBundles_block_invoke_732_cold_1();
    }

    -[LSDatabaseRebuildContext noteRebuildError:](*(void *)(a1 + 32), v4);
  }
}

uint64_t ___LSServer_LSEnumerateAndRegisterAllBundles_block_invoke_2_734(uint64_t a1, void *a2)
{
  v13[1] = *MEMORY[0x1895F89C0];
  id v3 = a2;
  id v4 = *(void **)(a1 + 32);
  id v5 = v3;
  id v6 = v4;
  [v5 legacyRecordDictionary];
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue();
  [v7 objectForKeyedSubscript:@"ApplicationType"];
  id v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v8)
  {
    v9 = (void *)[v7 mutableCopy];
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      uint64_t v10 = @"PluginKitPlugin";
    }

    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
LABEL_8:

        goto LABEL_9;
      }

      uint64_t v10 = @"Framework";
    }

    [v9 setObject:v10 forKeyedSubscript:@"ApplicationType"];
    goto LABEL_8;
  }

  v9 = v7;
LABEL_9:
  v13[0] = v9;
  [MEMORY[0x189603F18] arrayWithObjects:v13 count:1];
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[LSDatabaseRebuildContext registerItems:]((uint64_t)v6, v11);

  return 1LL;
}

void ___LSServer_LSEnumerateAndRegisterAllBundles_block_invoke_736(uint64_t a1)
{
  uint64_t v11 = *MEMORY[0x1895F89C0];
  v7[0] = 0LL;
  v7[1] = v7;
  v7[2] = 0x3032000000LL;
  v7[3] = __Block_byref_object_copy__3;
  void v7[4] = __Block_byref_object_dispose__3;
  id v8 = 0LL;
  _LSServer_DatabaseExecutionContext();
  v2 = (os_unfair_lock_s *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1895F87A8];
  v6[1] = 3221225472LL;
  v6[2] = ___LSServer_LSEnumerateAndRegisterAllBundles_block_invoke_2_737;
  v6[3] = &unk_189D73968;
  uint64_t v3 = *(void *)(a1 + 32);
  v6[4] = v7;
  v6[5] = v3;
  -[LSDBExecutionContext syncRead:](v2, v6);

  if (*(_BYTE *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL))
  {
    _LSInstallLog();
    id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      [(id)__LSDefaultsGetSharedInstance() systemContentDatabaseStoreFileURL];
      id v5 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      uint64_t v10 = v5;
      _os_log_impl(&dword_183E58000, v4, OS_LOG_TYPE_DEFAULT, "Saved system content database to %@", buf, 0xCu);
    }
  }

  else
  {
    _LSInstallLog();
    id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT)) {
      ___LSServer_LSEnumerateAndRegisterAllBundles_block_invoke_736_cold_1();
    }
  }

  _Block_object_dispose(v7, 8);
}

void ___LSServer_LSEnumerateAndRegisterAllBundles_block_invoke_2_737(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 8LL);
  id obj = *(id *)(v7 + 40);
  uint64_t v13 = 0LL;
  int inited = _LSContextInitReturningError((uint64_t)&v13, (uint64_t)&obj);
  objc_storeStrong((id *)(v7 + 40), obj);
  if (inited)
  {
    uint64_t v9 = *(void *)(*(void *)(a1 + 32) + 8LL);
    id v11 = *(id *)(v9 + 40);
    BOOL v10 = _LSDatabaseSaveSystemContentDatabase(v13, &v11);
    objc_storeStrong((id *)(v9 + 40), v11);
    *(_BYTE *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL) = v10;
  }
}

void ___LSServer_LSEnumerateAndRegisterAllBundles_block_invoke_738(uint64_t a1)
{
  dispatch_semaphore_t v2 = dispatch_semaphore_create(0LL);
  uint64_t v3 = (void *)[objc_alloc(MEMORY[0x189610088]) initWithTargetUID:_CFGetEUID()];
  [MEMORY[0x189610098] defaultWorkspace];
  id v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1895F87A8];
  v7[1] = 3221225472LL;
  v7[2] = ___LSServer_LSEnumerateAndRegisterAllBundles_block_invoke_2_740;
  v7[3] = &unk_189D73990;
  id v5 = *(void **)(a1 + 32);
  uint64_t v10 = *(void *)(a1 + 40);
  id v8 = v5;
  dispatch_semaphore_t v9 = v2;
  id v6 = v2;
  [v4 triggerRegistrationForContainerizedContentWithOptions:v3 completion:v7];

  dispatch_semaphore_wait(v6, 0xFFFFFFFFFFFFFFFFLL);
}

uint64_t ___LSServer_LSEnumerateAndRegisterAllBundles_block_invoke_2_740(uint64_t a1, void *a2)
{
  if (a2)
  {
    *(_BYTE *)(*(void *)(*(void *)(a1 + 48) + 8LL) + 24LL) = 0;
    -[LSDatabaseRebuildContext noteRebuildError:](*(void *)(a1 + 32), a2);
  }

  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
}

void ___LSServer_RebuildApplicationDatabases_block_invoke(uint64_t a1)
{
  dispatch_semaphore_t v2 = (dispatch_group_s *)objc_claimAutoreleasedReturnValue();
  dispatch_group_enter(v2);

  uint64_t v3 = _LSServer_CopyLocalDatabase(0LL);
  uint64_t v4 = *(void *)(*(void *)(a1 + 40) + 8LL);
  id v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;

  if (!*(_BYTE *)(a1 + 56)
    || (uint64_t v6 = *(void *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 40LL)) == 0
    || (-[_LSDatabase isSeeded](v6) & 1) == 0)
  {
    uint64_t v7 = MEMORY[0x1895F87A8];
    *(_BYTE *)(*(void *)(*(void *)(a1 + 48) + 8LL) + 24LL) = 1;
    v13[0] = v7;
    v13[1] = 3221225472LL;
    void v13[2] = ___LSServer_RebuildApplicationDatabases_block_invoke_2;
    v13[3] = &unk_189D73A08;
    id v14 = *(id *)(a1 + 32);
    enumeratePlaceholderAndInstalledApplicationRecords(v13);
    +[_LSInstallProgressService sharedInstance](&OBJC_CLASS____LSInstallProgressService, "sharedInstance");
    id v8 = (void *)objc_claimAutoreleasedReturnValue();
    allAppexRecords();
    dispatch_semaphore_t v9 = (void *)objc_claimAutoreleasedReturnValue();
    [v8 detachAndSendNotification:@"com.apple.LaunchServices.pluginswillberemoved" forApplicationExtensionRecords:v9];

    _LSResetServer();
    uint64_t v10 = _LSServer_CopyLocalDatabase(0LL);
    uint64_t v11 = *(void *)(*(void *)(a1 + 40) + 8LL);
    uint64_t v12 = *(void **)(v11 + 40);
    *(void *)(v11 + 40) = v10;

    _LSDatabaseSessionSetSeedingInProgress(1);
    _LSDatabaseSessionSetSeedingDueToManualRebuild(*(_BYTE *)(a1 + 57) != 0);
  }

void ___LSServer_RebuildApplicationDatabases_block_invoke_2(uint64_t a1, void *a2)
{
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  +[_LSBundleIdentifierAndType createRepresentingProxy:]( &OBJC_CLASS____LSBundleIdentifierAndType,  "createRepresentingProxy:");
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3) {
    [*(id *)(a1 + 32) setObject:v4 forKey:v3];
  }
}

void ___LSServer_RebuildApplicationDatabases_block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  uint64_t v56 = *MEMORY[0x1895F89C0];
  id v35 = a2;
  id v34 = a3;
  _LSDatabaseSessionSetSeedingDueToManualRebuild(0);
  _LSDatabaseSessionSetSeedingInProgress(0);
  -[_LSDatabase setSeeded:](*(void *)(*(void *)(*(void *)(a1 + 72) + 8LL) + 40LL), 1);
  -[_LSDatabase setSeedingComplete:]( *(_LSDatabase **)(*(void *)(*(void *)(a1 + 72) + 8LL) + 40LL),  *(_BYTE *)(a1 + 80) != 0);
  _LSSaveImmediately(1);
  context = (void *)MEMORY[0x186E2A59C]();
  id v5 = objc_alloc_init(MEMORY[0x189603FE0]);
  +[_LSInstallProgressService sharedInstance](&OBJC_CLASS____LSInstallProgressService, "sharedInstance");
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
  allAppexRecords();
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue();
  [v6 detachAndSendNotification:@"com.apple.LaunchServices.pluginsregistered" forApplicationExtensionRecords:v7];

  v48[0] = MEMORY[0x1895F87A8];
  v48[1] = 3221225472LL;
  v48[2] = ___LSServer_RebuildApplicationDatabases_block_invoke_4;
  v48[3] = &unk_189D73A58;
  id v8 = v5;
  id v49 = v8;
  id v50 = *(id *)(a1 + 32);
  id v51 = *(id *)(a1 + 40);
  id v52 = *(id *)(a1 + 48);
  enumeratePlaceholderAndInstalledApplicationRecords(v48);
  if ([*(id *)(a1 + 40) count])
  {
    __int128 v46 = 0u;
    __int128 v47 = 0u;
    __int128 v44 = 0u;
    __int128 v45 = 0u;
    id v9 = *(id *)(a1 + 40);
    uint64_t v10 = [v9 countByEnumeratingWithState:&v44 objects:v55 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v45;
      do
      {
        uint64_t v13 = 0LL;
        do
        {
          if (*(void *)v45 != v12) {
            objc_enumerationMutation(v9);
          }
          id v14 = (id)[*(id *)(*((void *)&v44 + 1) + 8 * v13++) plugInKitPlugins];
        }

        while (v11 != v13);
        uint64_t v11 = [v9 countByEnumeratingWithState:&v44 objects:v55 count:16];
      }

      while (v11);
    }

    +[_LSInstallProgressService sharedInstance](&OBJC_CLASS____LSInstallProgressService, "sharedInstance");
    uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue();
    [v15 sendNotification:7 forAppProxies:*(void *)(a1 + 40) Plugins:0 completion:0];
  }

  __int128 v42 = 0u;
  __int128 v43 = 0u;
  __int128 v40 = 0u;
  __int128 v41 = 0u;
  id v16 = *(id *)(a1 + 32);
  uint64_t v17 = [v16 countByEnumeratingWithState:&v40 objects:v54 count:16];
  if (v17)
  {
    uint64_t v18 = v17;
    uint64_t v19 = *(void *)v41;
    do
    {
      uint64_t v20 = 0LL;
      do
      {
        if (*(void *)v41 != v19) {
          objc_enumerationMutation(v16);
        }
        uint64_t v21 = *(void *)(*((void *)&v40 + 1) + 8 * v20);
        if (v21 && ([v8 containsObject:*(void *)(*((void *)&v40 + 1) + 8 * v20)] & 1) == 0)
        {
          [*(id *)(a1 + 32) objectForKey:v21];
          CFDictionaryRef v22 = (void *)objc_claimAutoreleasedReturnValue();
          [*(id *)(a1 + 56) addObject:v22];
          v23 = *(void **)(a1 + 64);
          [v22 bundleIdentifier];
          id v24 = (void *)objc_claimAutoreleasedReturnValue();
          [v23 addObject:v24];
        }

        ++v20;
      }

      while (v18 != v20);
      uint64_t v18 = [v16 countByEnumeratingWithState:&v40 objects:v54 count:16];
    }

    while (v18);
  }

  if ([*(id *)(a1 + 56) count])
  {
    __int128 v38 = 0u;
    __int128 v39 = 0u;
    __int128 v36 = 0u;
    __int128 v37 = 0u;
    id v25 = *(id *)(a1 + 56);
    uint64_t v26 = [v25 countByEnumeratingWithState:&v36 objects:v53 count:16];
    if (v26)
    {
      uint64_t v27 = v26;
      uint64_t v28 = *(void *)v37;
      do
      {
        uint64_t v29 = 0LL;
        do
        {
          if (*(void *)v37 != v28) {
            objc_enumerationMutation(v25);
          }
          id v30 = (id)[*(id *)(*((void *)&v36 + 1) + 8 * v29++) plugInKitPlugins];
        }

        while (v27 != v29);
        uint64_t v27 = [v25 countByEnumeratingWithState:&v36 objects:v53 count:16];
      }

      while (v27);
    }

    +[_LSInstallProgressService sharedInstance](&OBJC_CLASS____LSInstallProgressService, "sharedInstance");
    char v31 = (void *)objc_claimAutoreleasedReturnValue();
    [v31 sendNotification:8 forAppProxies:*(void *)(a1 + 56) Plugins:0 completion:0];
  }

  objc_autoreleasePoolPop(context);
  +[_LSInstallProgressService sharedInstance](&OBJC_CLASS____LSInstallProgressService, "sharedInstance");
  __int128 v32 = (void *)objc_claimAutoreleasedReturnValue();
  [v32 sendDatabaseRebuiltNotification];
}

void ___LSServer_RebuildApplicationDatabases_block_invoke_4(uint64_t a1, void *a2)
{
  v15[1] = *MEMORY[0x1895F89C0];
  id v3 = a2;
  +[_LSBundleIdentifierAndType createRepresentingRecord:]( &OBJC_CLASS____LSBundleIdentifierAndType,  "createRepresentingRecord:",  v3);
  id v4 = (void *)objc_claimAutoreleasedReturnValue();
  [*(id *)(a1 + 32) addObject:v4];
  [*(id *)(a1 + 40) objectForKey:v4];
  id v5 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v6 = v5;
  if (!v5)
  {
LABEL_5:
    id v8 = *(void **)(a1 + 48);
    [v3 compatibilityObject];
    id v9 = (void *)objc_claimAutoreleasedReturnValue();
    [v8 addObject:v9];

    uint64_t v10 = *(void **)(a1 + 56);
    [v3 bundleIdentifier];
    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue();
    [v10 addObject:v11];

    goto LABEL_6;
  }

  int v7 = [v5 bundleModTime];
  if (v7 != [v3 _bundleModTime])
  {
    if ([v3 isPlaceholder] && (objc_msgSend(v6, "isPlaceholder") & 1) == 0)
    {
      +[_LSInstallProgressService sharedInstance](&OBJC_CLASS____LSInstallProgressService, "sharedInstance");
      uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue();
      [v3 compatibilityObject];
      uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue();
      v15[0] = v13;
      [MEMORY[0x189603F18] arrayWithObjects:v15 count:1];
      id v14 = (void *)objc_claimAutoreleasedReturnValue();
      [v12 sendNotification:1 forAppProxies:v14 Plugins:0 completion:0];

      goto LABEL_6;
    }

    goto LABEL_5;
  }

void ___LSServer_SyncWithMobileInstallation_block_invoke(uint64_t a1)
{
  v22[0] = 0LL;
  v22[1] = v22;
  v22[2] = 0x3032000000LL;
  v22[3] = __Block_byref_object_copy__3;
  v22[4] = __Block_byref_object_dispose__3;
  [MEMORY[0x189603FE0] set];
  id v23 = (id)objc_claimAutoreleasedReturnValue();
  [(id)__LSDefaultsGetSharedInstance() dbRecoveryFileURL];
  id v3 = (void *)objc_claimAutoreleasedReturnValue();
  _LSDatabaseCreateRecoveryFile(v3);

  uint64_t v18 = 0LL;
  uint64_t v19 = &v18;
  uint64_t v20 = 0x2020000000LL;
  char v21 = 1;
  _LSInstallLog();
  id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl( &dword_183E58000,  v4,  OS_LOG_TYPE_DEFAULT,  "Will begin MobileInstallation item enumeration now",  buf,  2u);
  }

  uint64_t v5 = MEMORY[0x1895F87A8];
  if (!MobileInstallationLibrary_frameworkLibrary)
  {
    MobileInstallationLibrary_frameworkLibrary = (uint64_t)dlopen( "/System/Library/PrivateFrameworks/MobileInstallation.framewo rk/MobileInstallation",  2);
    if (!MobileInstallationLibrary_frameworkLibrary)
    {
      _LSInstallLog();
      uint64_t v12 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
        ___LSServer_SyncWithMobileInstallation_block_invoke_cold_1();
      }

      _LSMakeNSErrorImpl( (void *)*MEMORY[0x189607688],  78LL,  (uint64_t)"_LSServer_SyncWithMobileInstallation_block_invoke",  6168LL,  0LL);
      int v7 = (void *)objc_claimAutoreleasedReturnValue();
      if (v7)
      {
        int v8 = 0;
        goto LABEL_7;
      }
    }
  }

  v15[0] = v5;
  v15[1] = 3221225472LL;
  void v15[2] = ___LSServer_SyncWithMobileInstallation_block_invoke_2;
  v15[3] = &unk_189D73B20;
  v16[1] = &v18;
  v16[2] = v22;
  v16[0] = *(id *)(a1 + 32);
  v1 = (id *)v16;
  id v6 = (id)softLinkMobileInstallationEnumerateAllInstalledItemDictionaries(0LL, v15);
  if (v6)
  {
    int v7 = v6;
    int v8 = 1;
LABEL_7:
    *((_BYTE *)v19 + 24) = 0;
    goto LABEL_11;
  }

  if (*((_BYTE *)v19 + 24))
  {
    _LSServer_DatabaseExecutionContext();
    id v9 = (void *)objc_claimAutoreleasedReturnValue();
    v14[0] = v5;
    v14[1] = 3221225472LL;
    v14[2] = ___LSServer_SyncWithMobileInstallation_block_invoke_5;
    v14[3] = &unk_189D73AF8;
    v14[4] = v22;
    -[LSDBExecutionContext syncWrite:]((uint64_t)v9, v14);
  }

  int v7 = 0LL;
  int v8 = 1;
LABEL_11:
  _LSServer_DatabaseExecutionContext();
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = v5;
  v13[1] = 3221225472LL;
  void v13[2] = ___LSServer_SyncWithMobileInstallation_block_invoke_6;
  v13[3] = &unk_189D73AF8;
  void v13[4] = &v18;
  -[LSDBExecutionContext syncWrite:]((uint64_t)v10, v13);

  _LSDatabaseClearSyncInterrupted();
  MEMORY[0x186E2AFE0]();
  do
    unsigned __int8 v11 = __ldaxr((unsigned __int8 *)&sMISyncFlag);
  while (__stlxr(v11 & 0x7F, (unsigned __int8 *)&sMISyncFlag));
  if (v8) {

  }
  _Block_object_dispose(&v18, 8);
  _Block_object_dispose(v22, 8);
}

void ___LSServer_SyncWithMobileInstallation_block_invoke_2(void *a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v6) {
    *(_BYTE *)(*(void *)(a1[5] + 8LL) + 24LL) = 0;
  }
  [v5 objectForKey:@"ApplicationType"];
  int v7 = (void *)objc_claimAutoreleasedReturnValue();
  [v5 objectForKey:*MEMORY[0x189604E00]];
  int v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (([v7 isEqualToString:@"User"] & 1) != 0
    || ([v7 isEqualToString:@"System"] & 1) != 0
    || [v7 isEqualToString:@"VPNPlugin"])
  {
    [v5 objectForKey:@"IsPlaceholder"];
    id v9 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v10 = [v9 BOOLValue];

    unsigned __int8 v11 = *(void **)(*(void *)(a1[6] + 8LL) + 40LL);
    uint64_t v12 = -[_LSEnumeratedBundleInfo initWithBundleID:isPlaceholder:]( objc_alloc(&OBJC_CLASS____LSEnumeratedBundleInfo),  "initWithBundleID:isPlaceholder:",  v8,  v10);
    [v11 addObject:v12];

    id v13 = objc_alloc(MEMORY[0x189604030]);
    [v5 objectForKey:@"Path"];
    id v14 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v15 = (void *)[v13 initFileURLWithPath:v14 isDirectory:1];

    [v5 objectForKey:@"ParallelPlaceholderPath"];
    id v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (v16) {
      uint64_t v17 = (void *)[objc_alloc(MEMORY[0x189604030]) initFileURLWithPath:v16 isDirectory:1];
    }
    else {
      uint64_t v17 = 0LL;
    }
    uint64_t v18 = a1[4];
    if (v18)
    {
      if (v15) {
        (*(void (**)(uint64_t, void *))(v18 + 16))(v18, v15);
      }
      if (v17) {
        (*(void (**)(void))(a1[4] + 16LL))();
      }
    }

    __int128 v39 = v8;
    uint64_t v60 = 0LL;
    v61 = &v60;
    uint64_t v62 = 0x3032000000LL;
    v63 = __Block_byref_object_copy__789;
    v64 = __Block_byref_object_dispose__790;
    id v65 = 0LL;
    uint64_t v54 = 0LL;
    v55 = &v54;
    uint64_t v56 = 0x3032000000LL;
    v57 = __Block_byref_object_copy__789;
    v58 = __Block_byref_object_dispose__790;
    id v59 = 0LL;
    _LSServer_DatabaseExecutionContext();
    uint64_t v19 = (os_unfair_lock_s *)objc_claimAutoreleasedReturnValue();
    uint64_t v20 = MEMORY[0x1895F87A8];
    v47[0] = MEMORY[0x1895F87A8];
    v47[1] = 3221225472LL;
    v47[2] = ___LSServer_SyncWithMobileInstallation_block_invoke_791;
    v47[3] = &unk_189D73AA8;
    id v48 = v5;
    id v51 = &v60;
    id v21 = v15;
    id v49 = v21;
    id v22 = v17;
    uint64_t v23 = a1[6];
    id v50 = v22;
    uint64_t v52 = v23;
    v53 = &v54;
    -[LSDBExecutionContext syncRead:](v19, v47);

    if (v61[5] || v55[5])
    {
      _LSServer_DatabaseExecutionContext();
      id v24 = (void *)objc_claimAutoreleasedReturnValue();
      v46[0] = v20;
      v46[1] = 3221225472LL;
      v46[2] = ___LSServer_SyncWithMobileInstallation_block_invoke_2_792;
      v46[3] = &unk_189D73968;
      v46[4] = &v60;
      v46[5] = &v54;
      -[LSDBExecutionContext syncWrite:]((uint64_t)v24, v46);
    }

    _Block_object_dispose(&v54, 8);
    _Block_object_dispose(&v60, 8);

    int v8 = v39;
  }

  else if (([v7 isEqualToString:@"CoreServices"] & 1) != 0 {
         || [v7 isEqualToString:@"Internal"])
  }
  {
    id v25 = *(void **)(*(void *)(a1[6] + 8LL) + 40LL);
    uint64_t v26 = -[_LSEnumeratedBundleInfo initWithBundleID:isPlaceholder:]( objc_alloc(&OBJC_CLASS____LSEnumeratedBundleInfo),  "initWithBundleID:isPlaceholder:",  v8,  0LL);
    [v25 addObject:v26];

    id v27 = objc_alloc(MEMORY[0x189604030]);
    [v5 objectForKey:@"Path"];
    uint64_t v28 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v29 = (void *)[v27 initFileURLWithPath:v28 isDirectory:1];

    uint64_t v30 = a1[4];
    if (v30 && v29) {
      (*(void (**)(uint64_t, void *))(v30 + 16))(v30, v29);
    }
  }

  else if ([v7 isEqualToString:@"PluginKitPlugin"])
  {
    id v31 = objc_alloc(MEMORY[0x189604030]);
    [v5 objectForKey:@"Path"];
    __int128 v32 = (void *)objc_claimAutoreleasedReturnValue();
    id v33 = (void *)[v31 initFileURLWithPath:v32 isDirectory:1];

    uint64_t v34 = a1[4];
    if (v34 && v33) {
      (*(void (**)(uint64_t, void *))(v34 + 16))(v34, v33);
    }
    uint64_t v60 = 0LL;
    v61 = &v60;
    uint64_t v62 = 0x3032000000LL;
    v63 = __Block_byref_object_copy__789;
    v64 = __Block_byref_object_dispose__790;
    id v65 = 0LL;
    _LSServer_DatabaseExecutionContext();
    id v35 = (os_unfair_lock_s *)objc_claimAutoreleasedReturnValue();
    uint64_t v36 = MEMORY[0x1895F87A8];
    v41[0] = MEMORY[0x1895F87A8];
    v41[1] = 3221225472LL;
    v41[2] = ___LSServer_SyncWithMobileInstallation_block_invoke_3;
    v41[3] = &unk_189D73AD0;
    __int128 v45 = &v60;
    id v42 = v8;
    id v37 = v33;
    id v43 = v37;
    id v44 = v5;
    -[LSDBExecutionContext syncRead:](v35, v41);

    if (v61[5])
    {
      _LSServer_DatabaseExecutionContext();
      __int128 v38 = (void *)objc_claimAutoreleasedReturnValue();
      v40[0] = v36;
      v40[1] = 3221225472LL;
      v40[2] = ___LSServer_SyncWithMobileInstallation_block_invoke_4;
      v40[3] = &unk_189D73AF8;
      v40[4] = &v60;
      -[LSDBExecutionContext syncWrite:]((uint64_t)v38, v40);
    }

    _Block_object_dispose(&v60, 8);
  }
}

void ___LSServer_SyncWithMobileInstallation_block_invoke_791(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  v19.db = 0LL;
  if (!_LSContextInit((id *)&v19.db))
  {
    int v7 = (void *)MEMORY[0x186E2A59C]();
    [*(id *)(a1 + 32) objectForKey:*MEMORY[0x189604E00]];
    int v8 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v9 = _getBlockToUpdateBundleRecordFromMIAndNotifyIfChanged(&v19, v8, *(void **)(a1 + 40), *(void **)(a1 + 32));
    uint64_t v10 = *(void *)(*(void *)(a1 + 56) + 8LL);
    unsigned __int8 v11 = *(void **)(v10 + 40);
    *(void *)(v10 + 40) = v9;

    if (*(void *)(a1 + 48))
    {
      uint64_t v12 = *(void **)(*(void *)(*(void *)(a1 + 64) + 8LL) + 40LL);
      id v13 = -[_LSEnumeratedBundleInfo initWithBundleID:isPlaceholder:]( objc_alloc(&OBJC_CLASS____LSEnumeratedBundleInfo),  "initWithBundleID:isPlaceholder:",  v8,  1LL);
      [v12 addObject:v13];

      id v14 = (void *)[*(id *)(a1 + 32) mutableCopy];
      [v14 setObject:MEMORY[0x189604A88] forKeyedSubscript:@"IsPlaceholder"];
      [*(id *)(a1 + 48) path];
      uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue();
      [v14 setObject:v15 forKeyedSubscript:@"Path"];

      [v14 setObject:MEMORY[0x189604A88] forKeyedSubscript:@"IsParallelPlaceholder"];
      uint64_t v16 = _getBlockToUpdateBundleRecordFromMIAndNotifyIfChanged(&v19, v8, *(void **)(a1 + 48), v14);
      uint64_t v17 = *(void *)(*(void *)(a1 + 72) + 8LL);
      uint64_t v18 = *(void **)(v17 + 40);
      *(void *)(v17 + 40) = v16;
    }

    objc_autoreleasePoolPop(v7);
    _LSContextDestroy((void **)&v19.db);
  }
}

void ___LSServer_SyncWithMobileInstallation_block_invoke_2_792(uint64_t a1, void *a2, void *a3)
{
  id v8 = a2;
  id v5 = a3;
  uint64_t v6 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 40LL);
  if (v6) {
    (*(void (**)(void))(v6 + 16))();
  }
  uint64_t v7 = *(void *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 40LL);
  if (v7) {
    (*(void (**)(void))(v7 + 16))();
  }
}

void ___LSServer_SyncWithMobileInstallation_block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  uint64_t v35 = *MEMORY[0x1895F89C0];
  id v5 = a2;
  id v6 = a3;
  id v27 = 0LL;
  if (!_LSContextInit(&v27))
  {
    context = (void *)MEMORY[0x186E2A59C]();
    uint64_t v7 = *(void **)(a1 + 40);
    id v8 = *(void **)(a1 + 48);
    id v9 = *(id *)(a1 + 32);
    id v10 = v7;
    id v11 = v8;
    _LSDefaultLog();
    uint64_t v12 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      *(void *)&uint8_t buf[4] = v9;
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = v10;
      _os_log_impl( &dword_183E58000,  v12,  OS_LOG_TYPE_DEFAULT,  "Checking if %@ needs to be registered at %@",  buf,  0x16u);
    }

    int v29 = 0;
    id v13 = -[FSNode initWithURL:flags:error:]( objc_alloc(&OBJC_CLASS___FSNode),  "initWithURL:flags:error:",  v10,  0LL,  0LL);
    if (v13)
    {
      uint64_t v14 = _LSPluginFindWithInfo(v27, 0LL, 0LL, 0, v13, &v29, 0LL);
      if (v14)
      {
        *(void *)buf = 0LL;
        id v28 = 0LL;
        BOOL v15 = -[FSNode getContentModificationDate:error:](v13, "getContentModificationDate:error:", buf, &v28, context);
        id v16 = v28;
        if (v15)
        {
          if (*(_DWORD *)(v14 + 24) >= (int)*(double *)buf)
          {
            id v22 = 0LL;
LABEL_21:
            uint64_t v23 = MEMORY[0x186E2A7B8](v22);

            uint64_t v24 = *(void *)(*(void *)(a1 + 56) + 8LL);
            id v25 = *(void **)(v24 + 40);
            *(void *)(v24 + 40) = v23;

            objc_autoreleasePoolPop(context);
            _LSContextDestroy(&v27);
            goto LABEL_22;
          }

          int v17 = 1;
        }

        else
        {
          _LSDefaultLog();
          LSContext v19 = (os_log_s *)objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
            ___LSServer_SyncWithMobileInstallation_block_invoke_3_cold_2((uint64_t)v9);
          }

          int v17 = 0;
        }

uint64_t ___LSServer_SyncWithMobileInstallation_block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 40LL) + 16LL))();
}

void ___LSServer_SyncWithMobileInstallation_block_invoke_5(uint64_t a1, void *a2, void *a3)
{
  uint64_t v60 = *MEMORY[0x1895F89C0];
  id v31 = a2;
  id v32 = a3;
  id v33 = *(id *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 40LL);
  [MEMORY[0x189603FA8] array];
  id v5 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v47 = 0LL;
  id v48 = (void **)&v47;
  uint64_t v49 = 0x3812000000LL;
  id v50 = __Block_byref_object_copy__914;
  id v51 = __Block_byref_object_dispose__915;
  uint64_t v52 = 256LL;
  id v53 = 0LL;
  if (!_LSContextInit(&v53))
  {
    uint64_t v40 = MEMORY[0x1895F87A8];
    uint64_t v41 = 3221225472LL;
    id v42 = ___uninstallMIBundlesNotInSet_block_invoke;
    id v43 = &unk_189D73DD8;
    __int128 v46 = &v47;
    id v44 = v33;
    id v45 = v5;
    _CSStoreEnumerateUnits();
    _LSContextDestroy(v48 + 6);
  }

  __int128 v38 = 0u;
  __int128 v39 = 0u;
  __int128 v36 = 0u;
  __int128 v37 = 0u;
  id obj = v5;
  uint64_t v10 = [obj countByEnumeratingWithState:&v36 objects:v59 count:16];
  if (v10)
  {
    uint64_t v11 = *(void *)v37;
    do
    {
      uint64_t v12 = 0LL;
      do
      {
        if (*(void *)v37 != v11) {
          objc_enumerationMutation(obj);
        }
        uint64_t v13 = *(void *)(*((void *)&v36 + 1) + 8 * v12);
        unsigned int v35 = 0;
        if (v13)
        {
          int v14 = *(unsigned __int8 *)(v13 + 24);
          id v15 = *(id *)(v13 + 16);
          if (v14) {
            unsigned int v16 = 1;
          }
          else {
            unsigned int v16 = 2;
          }
        }

        else
        {
          id v15 = 0LL;
          unsigned int v16 = 2;
        }

        BOOL v17 = _LSUnregisterAppWithBundleID(0LL, v15, v16, (int *)&v35, v6, v7, v8, v9) == 0;

        if (v17)
        {
          _LSDefaultLog();
          uint64_t v18 = (os_log_s *)objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
          {
            if (v13)
            {
              id v22 = *(id *)(v13 + 16);
              id v23 = v22;
              if (*(_BYTE *)(v13 + 24)) {
                uint64_t v24 = @" (placeholder)";
              }
              else {
                uint64_t v24 = &stru_189D7B4C8;
              }
            }

            else
            {
              id v23 = 0LL;
              uint64_t v24 = &stru_189D7B4C8;
            }

            *(_DWORD *)buf = 138412546;
            id v56 = v23;
            __int16 v57 = 2112;
            v58 = v24;
            _os_log_impl(&dword_183E58000, v18, OS_LOG_TYPE_DEFAULT, "Unregistered %@%@", buf, 0x16u);
          }
        }

        else
        {
          _LSDefaultLog();
          uint64_t v18 = (os_log_s *)objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
          {
            if (v13)
            {
              id v19 = *(id *)(v13 + 16);
              id v20 = v19;
              if (*(_BYTE *)(v13 + 24)) {
                id v21 = @" (placeholder)";
              }
              else {
                id v21 = &stru_189D7B4C8;
              }
            }

            else
            {
              id v20 = 0LL;
              id v21 = &stru_189D7B4C8;
            }

            *(_DWORD *)buf = 138412546;
            id v56 = v20;
            __int16 v57 = 2112;
            v58 = v21;
            _os_log_error_impl(&dword_183E58000, v18, OS_LOG_TYPE_ERROR, "Failed to unregister %@%@", buf, 0x16u);
          }
        }

        +[_LSInstallProgressService sharedInstance](&OBJC_CLASS____LSInstallProgressService, "sharedInstance");
        id v25 = (void *)objc_claimAutoreleasedReturnValue();
        if (v13) {
          uint64_t v26 = *(void **)(v13 + 8);
        }
        else {
          uint64_t v26 = 0LL;
        }
        uint64_t v27 = v35;
        id v28 = v26;
        id v54 = v28;
        [MEMORY[0x189603F18] arrayWithObjects:&v54 count:1];
        int v29 = (void *)objc_claimAutoreleasedReturnValue();
        [v25 sendNotification:v27 forAppProxies:v29 Plugins:0 completion:0];

        ++v12;
      }

      while (v10 != v12);
      uint64_t v30 = [obj countByEnumeratingWithState:&v36 objects:v59 count:16];
      uint64_t v10 = v30;
    }

    while (v30);
  }

  _Block_object_dispose(&v47, 8);
}

void ___LSServer_SyncWithMobileInstallation_block_invoke_6(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (!*(_BYTE *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL))
  {
    _LSDefaultLog();
    uint64_t v7 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( &dword_183E58000,  v7,  OS_LOG_TYPE_DEFAULT,  "MobileInstallation reported PartialResultsReturned = YES, setting incomplete seed flag",  buf,  2u);
    }

    uint64_t v9 = 0LL;
  }

  _LSSaveImmediately(1);
  [(id)__LSDefaultsGetSharedInstance() dbRecoveryFileURL];
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
  _LSDatabaseDeleteRecoveryFile(v8);
}

void ___LSServer_ExecuteSyncWithQuiescedInstallationActivity_block_invoke(uint64_t a1)
{
  dispatch_semaphore_t v2 = (dispatch_group_s *)objc_claimAutoreleasedReturnValue();
  dispatch_group_wait(v2, 0xFFFFFFFFFFFFFFFFLL);

  id v3 = (void *)MEMORY[0x186E2A59C]();
  (*(void (**)(void))(*(void *)(a1 + 32) + 16LL))();
  objc_autoreleasePoolPop(v3);
}

void ___LSServer_DisplayRemovedAppPrompt_block_invoke(uint64_t a1, int a2, void *a3)
{
  uint64_t v71 = *MEMORY[0x1895F89C0];
  id v5 = a3;
  if (a2)
  {
    id v52 = v5;
    id v6 = *(void **)(a1 + 40);
    uint64_t v7 = *(void **)(a1 + 48);
    uint64_t v8 = *(void **)(*(void *)(*(void *)(a1 + 80) + 8LL) + 24LL);
    id v56 = *(id *)(a1 + 32);
    id v55 = v6;
    id v53 = v7;
    _LSDefaultLog();
    uint64_t v9 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412802;
      *(void *)&uint8_t buf[4] = v56;
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = v55;
      *(_WORD *)&buf[22] = 2048;
      v67 = v8;
      _os_log_impl( &dword_183E58000,  v9,  OS_LOG_TYPE_DEFAULT,  "Showing removed app prompt for %@ (%@), restore source %ld",  buf,  0x20u);
    }

    _LSGetAppRemovalPromptStringForKey(@"Restore “%@”?", @"APP_REMOVAL_PROMPT_TITLE");
    id v54 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8 == (void *)1)
    {
      id v10 = v53;
      int v11 = [v55 isEqual:@"com.apple.AppStore"];
      BOOL v12 = v11 == 0;
      if (v11) {
        uint64_t v13 = @"“App Store” was deleted and needs to be restored.";
      }
      else {
        uint64_t v13 = @"“App Store” was deleted and needs to be restored before you can download this app.";
      }
      if (v12) {
        int v14 = @"APP_REMOVAL_PROMPT_DETAIL_APP_STORE_DELETED";
      }
      else {
        int v14 = @"APP_REMOVAL_PROMPT_DETAIL_APP_STORE_DELETED_SELF";
      }
      _LSGetAppRemovalPromptStringForKey(&v13->isa, &v14->isa);
      id v15 = (void *)objc_claimAutoreleasedReturnValue();
      if (![(id)__LSDefaultsGetSharedInstance() isAppleInternal]
        || (_os_feature_enabled_impl() & 1) != 0)
      {
        unsigned int v16 = v15;
        goto LABEL_17;
      }

      uint64_t v18 = [v15 stringByAppendingString:@"\n\n[Apple Internal Engineering Note]\nFeature flags configuration indicates 135298349 is not complete. Therefore you will be brought to Settings instead of automatically kicking off the restore."];
    }

    else
    {
      id v10 = v56;
      _LSGetAppRemovalPromptStringForKey( @"To continue, download “%@” from the App Store.",  @"APP_REMOVAL_PROMPT_DETAIL_Default");
      id v15 = (void *)objc_claimAutoreleasedReturnValue();
      uint64_t v18 = objc_msgSend(NSString, "stringWithFormat:", v15, v10);
    }

    unsigned int v16 = (void *)v18;

LABEL_17:
    objc_msgSend(NSString, "stringWithFormat:", v54, v10);
    id v19 = (void *)objc_claimAutoreleasedReturnValue();
    CFOptionFlags v20 = *MEMORY[0x189605688];
    responseFlags[0] = *MEMORY[0x189605680];
    responseFlags[1] = v20;
    *(void *)buf = v19;
    *(void *)&uint8_t buf[8] = v16;
    responseFlags[2] = *MEMORY[0x189605690];
    responseFlags[3] = (CFOptionFlags)@"SBUserNotificationDontDismissOnUnlock";
    *(void *)&uint8_t buf[16] = MEMORY[0x189604A80];
    v67 = (void *)MEMORY[0x189604A88];
    [MEMORY[0x189603F68] dictionaryWithObjects:buf forKeys:responseFlags count:4];
    id v21 = (void *)objc_claimAutoreleasedReturnValue();
    _LSGetAppRemovalPromptStringForKey(@"Cancel", @"CANCEL_BUTTON");
    id v22 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8 == (void *)1)
    {
      _LSGetAppRemovalPromptStringForKey(@"Restore Now", @"RESTORE_APP_BUTTON");
      id v23 = (void *)objc_claimAutoreleasedReturnValue();
      uint64_t v24 = (void *)[v21 mutableCopy];
      uint64_t v25 = *MEMORY[0x189605698];
      uint64_t v61 = *MEMORY[0x1896056A0];
      uint64_t v62 = v25;
      v63 = v23;
      v64 = v22;
      [MEMORY[0x189603F68] dictionaryWithObjects:&v63 forKeys:&v61 count:2];
      uint64_t v26 = (void *)objc_claimAutoreleasedReturnValue();
      [v24 addEntriesFromDictionary:v26];
    }

    else
    {
      if (v8) {
        goto LABEL_22;
      }
      _LSGetAppRemovalPromptStringForKey(@"Show in App Store", @"SHOW_IN_STORE_BUTTON");
      id v23 = (void *)objc_claimAutoreleasedReturnValue();
      uint64_t v24 = (void *)[v21 mutableCopy];
      uint64_t v27 = *MEMORY[0x189605698];
      uint64_t v61 = *MEMORY[0x1896056A0];
      uint64_t v62 = v27;
      v63 = v23;
      v64 = v22;
      [MEMORY[0x189603F68] dictionaryWithObjects:&v63 forKeys:&v61 count:2];
      uint64_t v26 = (void *)objc_claimAutoreleasedReturnValue();
      [v24 addEntriesFromDictionary:v26];
    }

    id v21 = v24;
LABEL_22:
    SInt32 error = -1;
    CFUserNotificationRef v28 = CFUserNotificationCreate((CFAllocatorRef)*MEMORY[0x189604DB0], 0.0, 0LL, &error, (CFDictionaryRef)v21);
    CFUserNotificationRef v29 = v28;
    if (v28)
    {
      if (!error)
      {
        id v33 = (__CFUserNotification *)CFRetain(v28);
        id v32 = 0LL;
        char v34 = 0;
LABEL_27:

        if ((v34 & 1) == 0) {
          CFRelease(v29);
        }

        id v35 = v32;
        if (!v33)
        {
          (*(void (**)(void))(*(void *)(a1 + 72) + 16LL))();
LABEL_39:

          BOOL v17 = v52;
          goto LABEL_40;
        }

        __int128 v36 = *(void **)(a1 + 72);
        uint64_t v37 = *(void *)(*(void *)(*(void *)(a1 + 80) + 8LL) + 24LL);
        id v38 = *(id *)(a1 + 56);
        __int128 v39 = v36;
        responseFlags[0] = 0LL;
        id v57 = v35;
        _LSServer_DatabaseExecutionContext();
        uint64_t v40 = (os_unfair_lock_s *)objc_claimAutoreleasedReturnValue();
        -[LSDBExecutionContext assertNotActiveForThisThread](v40);

        SInt32 v41 = CFUserNotificationReceiveResponse(v33, 0.0, responseFlags);
        if (v41)
        {
          v63 = (void *)*MEMORY[0x189607490];
          *(void *)buf = @"CFUserNotificationReceiveResponse() failed.";
          [MEMORY[0x189603F68] dictionaryWithObjects:buf forKeys:&v63 count:1];
          id v42 = (id)objc_claimAutoreleasedReturnValue();
          _LSMakeNSErrorImpl((void *)*MEMORY[0x189607630], v41, (uint64_t)"_LSDisplayRemovedAppPrompt", 320LL, v42);
          id v43 = (void *)objc_claimAutoreleasedReturnValue();
          v39[2](v39, 0LL, v43);
        }

        else
        {
          if ((responseFlags[0] & 3) != 0)
          {
            _LSDefaultLog();
            id v44 = (os_log_s *)objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v44, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138477827;
              *(void *)&uint8_t buf[4] = v38;
              _os_log_impl( &dword_183E58000,  v44,  OS_LOG_TYPE_DEFAULT,  "User cancelled restoring system app %{private}@",  buf,  0xCu);
            }

            v39[2](v39, 1LL, 0LL);
            goto LABEL_38;
          }

          if (v37 == 1)
          {
            if (_os_feature_enabled_impl())
            {
              uint64_t v50 = [MEMORY[0x189604030] URLWithString:@"appstore-ui://restoreAppStore"];
              uint64_t v49 = @"com.apple.ios.StoreKitUIService";
            }

            else
            {
              uint64_t v50 = [MEMORY[0x189604030] URLWithString:@"settings-navigation://com.apple.Settings.AppInstallation/#ADRestoreAppStore"];
              uint64_t v49 = @"com.apple.Preferences";
            }

            id v48 = (void *)v50;
          }

          else
          {
            if (v37) {
              goto LABEL_38;
            }
            id v45 = objc_alloc_init(MEMORY[0x189607A50]);
            [v45 setScheme:@"itms-apps"];
            [v45 setHost:&stru_189D7B4C8];
            id v46 = objc_alloc_init(MEMORY[0x189603FA8]);
            [MEMORY[0x189607A88] queryItemWithName:@"bundleIdentifier" value:v38];
            uint64_t v47 = (void *)objc_claimAutoreleasedReturnValue();
            [v46 addObject:v47];

            [v45 setQueryItems:v46];
            [v45 URL];
            id v48 = (void *)objc_claimAutoreleasedReturnValue();

            uint64_t v49 = @"com.apple.AppStore";
          }

          if (!v48) {
            goto LABEL_38;
          }
          _LSServer_DatabaseExecutionContext();
          id v51 = (os_unfair_lock_s *)objc_claimAutoreleasedReturnValue();
          *(void *)buf = MEMORY[0x1895F87A8];
          *(void *)&uint8_t buf[8] = 3221225472LL;
          *(void *)&uint8_t buf[16] = ___ZL26_LSDisplayRemovedAppPromptP20__CFUserNotificationP8NSStringP5NSURL18LSAppRestoreSourceU13block_pointerFvbP7NSErrorE_block_invoke;
          v67 = &unk_189D740E0;
          v68 = v49;
          id v69 = v48;
          v70 = v39;
          id v42 = v48;
          -[LSDBExecutionContext syncRead:](v51, buf);

          id v43 = (void *)v68;
        }

LABEL_38:
        CFRelease(v33);
        id v35 = v57;
        goto LABEL_39;
      }

      CFRelease(v28);
    }

    uint64_t v30 = error;
    uint64_t v59 = *MEMORY[0x189607490];
    uint64_t v60 = @"CFUserNotificationCreate() failed.";
    [MEMORY[0x189603F68] dictionaryWithObjects:&v60 forKeys:&v59 count:1];
    id v31 = (void *)objc_claimAutoreleasedReturnValue();
    _LSMakeNSErrorImpl((void *)*MEMORY[0x189607630], v30, (uint64_t)"_LSCreateRemovedAppPrompt", 241LL, v31);
    id v32 = (id)objc_claimAutoreleasedReturnValue();

    CFUserNotificationRef v29 = 0LL;
    id v33 = 0LL;
    char v34 = 1;
    goto LABEL_27;
  }

  BOOL v17 = v5;
  (*(void (**)(void))(*(void *)(a1 + 72) + 16LL))();
LABEL_40:
}

void ___LSServer_BeginProvidingVisualizationArchives_block_invoke()
{
  dispatch_semaphore_t v2 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue();
  dispatch_queue_t v0 = dispatch_queue_create("com.apple.lsd.internal.store-visualizations", v2);
  v1 = (void *)_LSServer_BeginProvidingVisualizationArchives::visualizationQueue;
  _LSServer_BeginProvidingVisualizationArchives::visualizationQueue = (uint64_t)v0;
}

id ___LSServer_BeginProvidingVisualizationArchives_block_invoke_2()
{
  uint64_t v4 = 0LL;
  id v5 = &v4;
  uint64_t v6 = 0x3032000000LL;
  uint64_t v7 = __Block_byref_object_copy__39;
  uint64_t v8 = __Block_byref_object_dispose__40;
  id v9 = 0LL;
  _LSServer_DatabaseExecutionContext();
  dispatch_queue_t v0 = (os_unfair_lock_s *)objc_claimAutoreleasedReturnValue();
  v3[0] = MEMORY[0x1895F87A8];
  v3[1] = 3221225472LL;
  v3[2] = ___LSServer_BeginProvidingVisualizationArchives_block_invoke_41;
  v3[3] = &unk_189D75868;
  v3[4] = &v4;
  -[LSDBExecutionContext syncRead:](v0, v3);

  id v1 = (id)v5[5];
  _Block_object_dispose(&v4, 8);

  return v1;
}

void ___LSServer_BeginProvidingVisualizationArchives_block_invoke_41(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v23 = 0LL;
  CFOptionFlags v20 = 0LL;
  id v21 = 0LL;
  char v22 = 0;
  +[_LSDServiceDomain defaultServiceDomain]();
  uint64_t v7 = (_LSDServiceDomain *)objc_claimAutoreleasedReturnValue();
  uint64_t v8 = (uint64_t *)LaunchServices::Database::Context::_get((LaunchServices::Database::Context *)&v20, v7, 0LL);

  if (v8)
  {
    MutableCopy = (const void *)CSStoreCreateMutableCopy();
    if (MutableCopy)
    {
      _LSDatabaseGetNode(*v8);
      id v10 = (void *)objc_claimAutoreleasedReturnValue();
      uint64_t SessionKey = _LSDatabaseGetSessionKey(*v8);
      BOOL v12 = _LSDatabaseCreateWithAccessContext(v10, SessionKey, MutableCopy, 0LL, 0LL);

      if (v12)
      {
        uint64_t v13 = v12;
        id v19 = v13;
        Visualizer = _LSContextCreateVisualizer((id *)&v19);
        uint64_t v15 = *(void *)(*(void *)(a1 + 32) + 8LL);
        unsigned int v16 = *(void **)(v15 + 40);
        *(void *)(v15 + 40) = Visualizer;
      }

      CFRelease(MutableCopy);
    }
  }

  if (v20 && v22) {
    _LSContextDestroy(v20);
  }
  id v17 = v21;
  CFOptionFlags v20 = 0LL;
  id v21 = 0LL;

  char v22 = 0;
  id v18 = v23;
  id v23 = 0LL;
}

void ___LSServer_GetServerStoreForConnectionWithCompletionHandler_block_invoke(uint64_t a1)
{
  dispatch_semaphore_t v2 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
    ___LSServer_GetServerStoreForConnectionWithCompletionHandler_block_invoke_cold_1(v2);
  }

  _LSServer_RebuildApplicationDatabases(1LL, 1LL, 1LL, 1, 0);
  _LSServer_DatabaseExecutionContext();
  id v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x1895F87A8];
  v4[1] = 3221225472LL;
  v4[2] = ___LSServer_GetServerStoreForConnectionWithCompletionHandler_block_invoke_2;
  v4[3] = &unk_189D75590;
  id v5 = *(id *)(a1 + 32);
  -[LSDBExecutionContext syncWrite:]((uint64_t)v3, v4);
}

void ___LSServer_GetServerStoreForConnectionWithCompletionHandler_block_invoke_2()
{
}

void ___LSServer_PerformOpenOperation_block_invoke(uint64_t a1, char a2, void *a3)
{
  uint64_t v10 = *MEMORY[0x1895F89C0];
  id v5 = a3;
  if ((a2 & 1) == 0)
  {
    _LSDefaultLog();
    id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      int v8 = 138543362;
      id v9 = v5;
      _os_log_impl( &dword_183E58000,  v6,  OS_LOG_TYPE_DEFAULT,  "LaunchServices: [Perform] not launching application - result = %{public}@",  (uint8_t *)&v8,  0xCu);
    }
  }

  uint64_t v7 = (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16LL))();
  MEMORY[0x186E2AFE0](v7);
}

void ___LSServer_PerformOpenOperation_block_invoke_72(uint64_t a1)
{
  uint64_t v82 = *MEMORY[0x1895F89C0];
  id v59 = *(id *)(a1 + 32);
  dispatch_semaphore_t v2 = *(void **)(a1 + 48);
  id v3 = *(id *)(a1 + 40);
  id v4 = v2;
  [v4 objectForKeyedSubscript:getFBSOpenApplicationOptionKeyPayloadURL()];
  id v5 = (void *)objc_claimAutoreleasedReturnValue();
  id v6 = v5;
  if (v5)
  {
    if ([v5 isEqual:v3])
    {
      v58 = (void *)[v4 mutableCopy];
      [v58 removeObjectForKey:getFBSOpenApplicationOptionKeyPayloadURL()];

      char v7 = 0;
      id v8 = 0LL;
      goto LABEL_9;
    }

    _LSDefaultLog();
    id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      ___LSServer_PerformOpenOperation_block_invoke_72_cold_1();
    }

    id v75 = (id)*MEMORY[0x189607490];
    *(void *)&__int128 buf = @"FBSOpenApplicationOptionKeyPayloadURL did not match input URL, making the open request ambiguous";
    [MEMORY[0x189603F68] dictionaryWithObjects:&buf forKeys:&v75 count:1];
    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue();
    _LSMakeNSErrorImpl( (void *)*MEMORY[0x189607670],  -50LL,  (uint64_t)"_LSOpenOperationMassageOpenOptionsOrFail",  217LL,  v10);
    id v8 = (id)objc_claimAutoreleasedReturnValue();

    char v7 = 1;
  }

  else
  {
    char v7 = 0;
    id v8 = 0LL;
  }

  v58 = v4;
LABEL_9:

  id v11 = v8;
  if ((v7 & 1) != 0)
  {
    id v12 = v11;
    goto LABEL_54;
  }

  id v56 = v11;
  uint64_t v13 = *(void **)(a1 + 40);
  int v14 = *(unsigned __int8 *)(a1 + 136);
  id v15 = *(id *)(a1 + 56);
  id v16 = v13;
  __int128 v17 = *(_OWORD *)(a1 + 120);
  __int128 buf = *(_OWORD *)(a1 + 104);
  __int128 v77 = v17;
  id v57 = v16;
  if (![v16 isFileURL])
  {
    id v21 = 0LL;
    id v19 = 0LL;
    int v23 = 1;
    id v55 = v59;
LABEL_48:
    id v36 = v56;
    goto LABEL_50;
  }

  [v57 path];
  id v18 = (void *)objc_claimAutoreleasedReturnValue();
  [v18 lastPathComponent];
  id v19 = (void *)objc_claimAutoreleasedReturnValue();

  +[LSDocumentProxy documentProxyForURL:isContentManaged:sourceAuditToken:]( &OBJC_CLASS___LSDocumentProxy,  "documentProxyForURL:isContentManaged:sourceAuditToken:",  v57,  v14 != 0,  &buf);
  CFOptionFlags v20 = (void *)objc_claimAutoreleasedReturnValue();
  id v75 = 0LL;
  id v53 = v20;
  [v20 applicationsAvailableForOpeningWithStyle:2 limit:-1 XPCConnection:v15 error:&v75];
  id v54 = (void *)objc_claimAutoreleasedReturnValue();
  id v21 = v75;
  if (v59 && [v59 length])
  {
    +[LSApplicationProxy applicationProxyForIdentifier:]( &OBJC_CLASS___LSApplicationProxy,  "applicationProxyForIdentifier:",  v59);
    id v55 = v59;
    char v22 = (void *)objc_claimAutoreleasedReturnValue();
  }

  else
  {
    if (!v54 || ![v54 count])
    {
      char v22 = 0LL;
      id v55 = v59;
      goto LABEL_24;
    }

    [v54 objectAtIndex:0];
    uint64_t v24 = (void *)objc_claimAutoreleasedReturnValue();
    [v24 bundleIdentifier];
    id v55 = (id)objc_claimAutoreleasedReturnValue();
    char v22 = v24;
  }

  if (v54 && v22 && ([v54 containsObject:v22] & 1) != 0)
  {
    char v25 = 1;
    goto LABEL_41;
  }

void ___LSServer_PerformOpenOperation_block_invoke_2( uint64_t a1,  int a2,  uint64_t a3,  uint64_t a4,  uint64_t a5,  uint64_t a6,  uint64_t a7,  uint64_t a8,  void *a9,  void *a10)
{
  if (a2)
  {
    (*(void (**)(void))(*(void *)(a1 + 88) + 16LL))();
  }

  else if (*(_BYTE *)(a1 + 104))
  {
    _LSOpenOperationPerform( *(void **)(a1 + 32),  *(void **)(a1 + 40),  *(void **)(a1 + 48),  *(unsigned __int8 *)(a1 + 112),  *(void **)(a1 + 56),  *(void **)(a1 + 64),  *(void **)(a1 + 96),  *(void **)(a1 + 72),  *(void **)(a1 + 80),  *(void **)(a1 + 88));
  }

  else
  {
    std::__throw_bad_optional_access[abi:nn180100]();
    _LSOpenOperationPerform(v10, v11, v12, v13, v14, v15, v16, v17, a9, a10);
  }

void ___LSServer_OpenUserActivity_block_invoke(uint64_t a1)
{
  v24[1] = *MEMORY[0x1895F89C0];
  dispatch_semaphore_t v2 = *(void **)(a1 + 32);
  if (v2 || *(void *)(a1 + 40))
  {
    id v3 = *(void **)(a1 + 48);
    if (v3)
    {
      if (*(void *)(a1 + 56))
      {
        id v4 = *(void **)(a1 + 40);
        unint64_t v5 = v2;
        unint64_t v6 = v4;
        id v7 = v3;
        if (UIKitLibrary(void)::frameworkLibrary
          || (UIKitLibrary(void)::frameworkLibrary = (uint64_t)dlopen( "/System/Library/Frameworks/UIKit.framework/UIKit",  2)) != 0)
        {
          if (!(v5 | v6))
          {
            uint64_t v23 = *MEMORY[0x189607490];
            v24[0] = @"invalid input parameters";
            [MEMORY[0x189603F68] dictionaryWithObjects:v24 forKeys:&v23 count:1];
            int v13 = (void *)objc_claimAutoreleasedReturnValue();
            _LSMakeNSErrorImpl( (void *)*MEMORY[0x189607670],  -50LL,  (uint64_t)"_LSGetBSActionForUserActivity",  1294LL,  v13);
            int v14 = (void *)objc_claimAutoreleasedReturnValue();

            goto LABEL_21;
          }

          [MEMORY[0x189603FC8] dictionary];
          id v8 = (void *)objc_claimAutoreleasedReturnValue();
          id v9 = v8;
          if (v8)
          {
            if (v6)
            {
              [v8 setObject:v6 forKeyedSubscript:&unk_189DA81B8];
            }

            else
            {
              [(id)v5 UUIDString];
              id v16 = (void *)objc_claimAutoreleasedReturnValue();
              [v9 setObject:v16 forKeyedSubscript:&unk_189DA81D0];
            }

            [v9 setObject:v7 forKeyedSubscript:&unk_189DA81E8];
            [v9 setObject:v7 forKeyedSubscript:&unk_189DA8200];
            [MEMORY[0x189603F50] date];
            __int128 v17 = (void *)objc_claimAutoreleasedReturnValue();
            [v9 setObject:v17 forKeyedSubscript:&unk_189DA8218];

            id v12 = (void *)[objc_alloc((Class)getUIActivityContinuationActionClass()) initWithSettings:v9];
            if (v12)
            {

              char v18 = 0;
              id v19 = 0LL;
              goto LABEL_22;
            }

            _LSMakeNSErrorImpl( (void *)*MEMORY[0x189607670],  -10810LL,  (uint64_t)"_LSGetBSActionForUserActivity",  1286LL,  0LL);
            int v14 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_21:
            id v19 = v14;

            id v12 = 0LL;
            char v18 = 1;
LABEL_22:

            id v11 = v19;
            if ((v18 & 1) != 0)
            {
              uint64_t v20 = *(void *)(a1 + 96);
              if (v20) {
                (*(void (**)(uint64_t, void, id))(v20 + 16))(v20, 0LL, v11);
              }
            }

            else
            {
              _LSServer_OpenApplicationCommon( *(void **)(a1 + 56),  v12,  *(unsigned __int8 *)(a1 + 104),  *(void **)(a1 + 64),  *(void **)(a1 + 72),  *(void **)(a1 + 80),  5uLL,  *(void **)(a1 + 88),  *(void **)(a1 + 96));
            }

            goto LABEL_26;
          }

          uint64_t v15 = _LSMakeNSErrorImpl((void *)*MEMORY[0x189607670], -41LL, (uint64_t)"_LSGetBSActionForUserActivity", 1290LL, 0LL);
        }

        else
        {
          uint64_t v15 = _LSMakeNSErrorImpl((void *)*MEMORY[0x189607670], -4LL, (uint64_t)"_LSGetBSActionForUserActivity", 1298LL, 0LL);
        }

        int v14 = (void *)v15;
        goto LABEL_21;
      }
    }
  }

  uint64_t v10 = *(void *)(a1 + 96);
  if (!v10) {
    return;
  }
  uint64_t v21 = *MEMORY[0x189607490];
  char v22 = @"invalid input parameters";
  [MEMORY[0x189603F68] dictionaryWithObjects:&v22 forKeys:&v21 count:1];
  id v11 = (id)objc_claimAutoreleasedReturnValue();
  _LSMakeNSErrorImpl( (void *)*MEMORY[0x189607670],  -50LL,  (uint64_t)"_LSServer_OpenUserActivity_block_invoke",  324LL,  v11);
  id v12 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, void, void *))(v10 + 16))(v10, 0LL, v12);
LABEL_26:
}

void ___LSServer_GetIOQueue_block_invoke()
{
  dispatch_semaphore_t v2 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue();
  dispatch_queue_t v0 = dispatch_queue_create("com.apple.lsd.registrationIO", v2);
  id v1 = (void *)_LSServer_GetIOQueue::result;
  _LSServer_GetIOQueue::result = (uint64_t)v0;
}

void ___LSServer_RegisterItemInfo_block_invoke(uint64_t a1)
{
  DistributedCenter = CFNotificationCenterGetDistributedCenter();
  [*(id *)(a1 + 32) name];
  name = (__CFString *)objc_claimAutoreleasedReturnValue();
  [*(id *)(a1 + 32) userInfo];
  id v3 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();
  CFNotificationCenterPostNotification(DistributedCenter, name, 0LL, v3, 1u);
}

void ___LSServer_RefreshContentInFrameworkAtURL_block_invoke_cold_1()
{
}

void ___LSServer_RefreshContentInFrameworkAtURL_block_invoke_cold_2()
{
}

void ___LSServer_LSEnumerateAndRegisterAllBundles_block_invoke_2_cold_1( uint64_t a1,  uint64_t a2,  os_log_t log)
{
  uint64_t v8 = *MEMORY[0x1895F89C0];
  BOOL v3 = *(_BYTE *)(*(void *)a1 + 24LL) == 0;
  BOOL v4 = *(_BYTE *)(*(void *)a2 + 24LL) == 0;
  v5[0] = 67109376;
  v5[1] = v3;
  __int16 v6 = 1024;
  BOOL v7 = v4;
  _os_log_error_impl( &dword_183E58000,  log,  OS_LOG_TYPE_ERROR,  "ICL error, enumerating system (%d) or other (%d) content",  (uint8_t *)v5,  0xEu);
  OUTLINED_FUNCTION_1();
}

void ___LSServer_LSEnumerateAndRegisterAllBundles_block_invoke_2_cold_2()
{
}

void ___LSServer_LSEnumerateAndRegisterAllBundles_block_invoke_732_cold_1()
{
}

void ___LSServer_LSEnumerateAndRegisterAllBundles_block_invoke_736_cold_1()
{
}

void ___LSServer_SyncWithMobileInstallation_block_invoke_cold_1()
{
}

void ___LSServer_SyncWithMobileInstallation_block_invoke_3_cold_1()
{
  uint64_t v4 = *MEMORY[0x1895F89C0];
  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_12_0();
  __int16 v2 = 2114;
  uint64_t v3 = 0LL;
  _os_log_error_impl( &dword_183E58000,  v0,  OS_LOG_TYPE_ERROR,  "Couldn't determine if record for %{private}@ needed to be updated, failed to create FSNode for %{private}@: %{public}@",  v1,  0x20u);
  OUTLINED_FUNCTION_16();
}

void ___LSServer_SyncWithMobileInstallation_block_invoke_3_cold_2(uint64_t a1)
{
  LODWORD(v3) = 138478083;
  *(void *)((char *)&v3 + 4) = a1;
  OUTLINED_FUNCTION_12_0();
  OUTLINED_FUNCTION_2_0( &dword_183E58000,  v1,  v2,  "Couldn't get mod date for bundle %{private}@, so forcing update: %{public}@",  (void)v3,  DWORD2(v3));
  OUTLINED_FUNCTION_1();
}

void ___LSServer_GetServerStoreForConnectionWithCompletionHandler_block_invoke_cold_1(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl(&dword_183E58000, log, OS_LOG_TYPE_ERROR, "Local database is invalid, rebuilding.", v1, 2u);
}

void ___LSServer_PerformOpenOperation_block_invoke_72_cold_1()
{
}

@end