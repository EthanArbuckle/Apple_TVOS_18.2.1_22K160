@interface MCMCodeSigningMapping
+ (id)_moveDBIfNeededFromURL:(id)a3 queue:(id)a4 error:(id *)a5;
+ (id)codeSignMappingWithError:(id *)a3;
- (BOOL)_onQueue_addGroupIdentifier:(id)a3 forIdentifier:(id)a4 containerClass:(unint64_t)a5 error:(id *)a6 reconcileHandler:(id)a7;
- (BOOL)_onQueue_identifierHasCallerRegisteredEntitlements:(id)a3;
- (BOOL)_onQueue_invalidateCodeSigningInfoForIdentifier:(id)a3 error:(id *)a4;
- (BOOL)_onQueue_processCodeSigningInfo:(id)a3 identifier:(id)a4 options:(id)a5 oldEntitlements:(id)a6 error:(id *)a7 reconcileHandler:(id)a8;
- (BOOL)_onQueue_removeAllAdvanceCopiesWithError:(id *)a3;
- (BOOL)_onQueue_removeAllInvalidPluginCodeSigningEntriesWithNumRemoved:(int *)a3 error:(id *)a4;
- (BOOL)_onQueue_removeGroupIdentifier:(id)a3 forIdentifier:(id)a4 containerClass:(unint64_t)a5 error:(id *)a6 reconcileHandler:(id)a7;
- (BOOL)_onqueue_enumerateOwnersAndGroupsWithGroupClass:(unint64_t)a3 error:(id *)a4 block:(id)a5;
- (BOOL)addGroupIdentifier:(id)a3 forIdentifier:(id)a4 containerClass:(unint64_t)a5 error:(id *)a6 reconcileHandler:(id)a7;
- (BOOL)enumerateOwnersAndGroupsWithGroupClass:(unint64_t)a3 error:(id *)a4 block:(id)a5;
- (BOOL)identifierHasCallerRegisteredEntitlements:(id)a3;
- (BOOL)identifierHasSystemContainer:(id)a3;
- (BOOL)invalidateCodeSigningInfoForIdentifier:(id)a3 withError:(id *)a4;
- (BOOL)invalidateCodeSigningInfoForIdentifierAndItsChildren:(id)a3 withError:(id *)a4;
- (BOOL)removeAllAdvanceCopiesWithError:(id *)a3;
- (BOOL)removeAllInvalidPluginCodeSigningEntriesWithNumRemoved:(int *)a3 error:(id *)a4;
- (BOOL)removeGroupIdentifier:(id)a3 forIdentifier:(id)a4 containerClass:(unint64_t)a5 error:(id *)a6 reconcileHandler:(id)a7;
- (MCMChildParentMapCache)childParentMapCache;
- (MCMCodeSigningMapping)initWithUserIdentityCache:(id)a3 queue:(id)a4 mappingDB:(id)a5 childParentMapCache:(id)a6 library:(id)a7;
- (MCMManagedPath)library;
- (MCMSQLiteDB)codeSigningMappingDB;
- (MCMUserIdentityCache)userIdentityCache;
- (OS_dispatch_queue)queue;
- (id)_codeSigningInfoForCodeSigningEntry:(id)a3 externalRequest:(BOOL)a4;
- (id)_entitlementsFromCodeSigningEntry:(id)a3;
- (id)_onQueue_codeSigningEntryForIdentifier:(id)a3 withError:(id *)a4;
- (id)_onQueue_codeSigningInfoForIdentifier:(id)a3 externalRequest:(BOOL)a4;
- (id)_onQueue_copyReferenceCountSetForContainerClass:(unint64_t)a3;
- (id)_onQueue_entitlementsForIdentifier:(id)a3;
- (id)_onQueue_identifiersWithError:(id *)a3;
- (id)_onQueue_invalidateCodeSigningInfoForIdentifierAndItsChildren:(id)a3;
- (id)_onQueue_removeReferenceForGroupIdentifiers:(id)a3 containerClass:(unint64_t)a4;
- (id)_onQueue_setCodeSigningDictionaryValues:(id)a3 forIdentifiers:(id)a4;
- (id)_readCodeSigningMappingFromDiskAtURL:(id)a3;
- (id)appGroupIdentifiersForIdentifier:(id)a3;
- (id)codeSigningEntryForIdentifier:(id)a3 withError:(id *)a4;
- (id)copyReferenceCountSetForContainerClass:(unint64_t)a3;
- (id)entitlementsForIdentifier:(id)a3;
- (id)getCodeSigningInfoForIdentifier:(id)a3;
- (id)groupContainerIdentifiersAssociatedWithIdentifier:(id)a3 containerClass:(unint64_t)a4;
- (id)identifiersWithError:(id *)a3;
- (id)processCallerRegisteredEntitlements:(id)a3 identifier:(id)a4 error:(id *)a5;
- (id)processCodeSigningInfo:(id)a3 identifier:(id)a4 options:(id)a5 error:(id *)a6;
- (id)removeCodeSigningDictionaryForIdentifiers:(id)a3;
- (id)systemGroupIdentifiersForIdentifier:(id)a3;
- (unint64_t)_onQueue_dataContainerTypeForIdentifier:(id)a3;
- (unint64_t)dataContainerTypeForIdentifier:(id)a3;
- (unint64_t)invalidateCodeSigningInfoForAppsWithoutDataContainer;
- (void)_onQueue_handleChangeFromOldGroupContainerIds:(id)a3 toNewGroupContainerIds:(id)a4 containerClass:(unint64_t)a5 reconcileHandler:(id)a6;
- (void)_onQueue_iterateGroupIdsWithKey:(id)a3 fallBackKey:(id)a4 noReferenceKey:(id)a5 forAllIdentifiersUsingBlock:(id)a6;
- (void)_onQueue_migrateAppGroupIdsFromDataContainersToFileUsingContainers:(id)a3;
- (void)_onQueue_migrateCachedCodeSigningInfoFromBundleContainerToMappingWithInfo:(id)a3 identifier:(id)a4 containerClass:(unint64_t)a5;
- (void)_onQueue_migrateCachedCodeSigningInfoFromBundleContainersToMappingWithContainersLegacy:(id)a3 containerClass:(unint64_t)a4;
- (void)_onQueue_migrateDataFromLegacyEntitlementsFileToCodeSigningFile;
- (void)_onQueue_migrateFromMappingFileToDBIfNecessary;
- (void)_onQueue_reconcileSystemContainersWithContext:(id)a3;
- (void)migrateAppGroupIdsFromDataContainersToFile;
- (void)migrateCachedCodeSigningInfoFromBundleContainersToMapping;
- (void)performAllCodeSigningMigrationAndReconciliationWithContext:(id)a3;
- (void)setCodeSigningMappingDB:(id)a3;
@end

@implementation MCMCodeSigningMapping

- (MCMCodeSigningMapping)initWithUserIdentityCache:(id)a3 queue:(id)a4 mappingDB:(id)a5 childParentMapCache:(id)a6 library:(id)a7
{
  uint64_t v24 = *MEMORY[0x1895F89C0];
  id v20 = a3;
  v13 = (dispatch_queue_s *)a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  v23.receiver = self;
  v23.super_class = (Class)&OBJC_CLASS___MCMCodeSigningMapping;
  v17 = -[MCMCodeSigningMapping init](&v23, sel_init);
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_queue, a4);
    objc_storeStrong((id *)&v18->_userIdentityCache, a3);
    objc_storeStrong((id *)&v18->_codeSigningMappingDB, a5);
    objc_storeStrong((id *)&v18->_library, a7);
    objc_storeStrong((id *)&v18->_childParentMapCache, a6);
    block[0] = MEMORY[0x1895F87A8];
    block[1] = 3221225472LL;
    block[2] = __95__MCMCodeSigningMapping_initWithUserIdentityCache_queue_mappingDB_childParentMapCache_library___block_invoke;
    block[3] = &unk_18A29E378;
    v22 = v18;
    dispatch_sync(v13, block);
  }

  return v18;
}

- (void)_onQueue_migrateFromMappingFileToDBIfNecessary
{
  uint64_t v35 = *MEMORY[0x1895F89C0];
  -[MCMCodeSigningMapping queue](self, "queue");
  v3 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  uint64_t v23 = 0LL;
  uint64_t v24 = &v23;
  uint64_t v25 = 0x3032000000LL;
  v26 = __Block_byref_object_copy__3872;
  v27 = __Block_byref_object_dispose__3873;
  id v28 = 0LL;
  v4 = -[MCMCodeSigningMapping library](self, "library");
  [v4 url];
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    [v5 URLByAppendingPathComponent:@"mcm_code_signing_info.plist" isDirectory:0];
    v6 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    v7 = -[MCMCodeSigningMapping _readCodeSigningMappingFromDiskAtURL:](self, "_readCodeSigningMappingFromDiskAtURL:", v6);
    if (v7)
    {
      *(void *)v29 = 0LL;
      v30 = v29;
      uint64_t v31 = 0x2020000000LL;
      __int16 v32 = 0;
      uint64_t v19 = 0LL;
      id v20 = &v19;
      uint64_t v21 = 0x2020000000LL;
      __int16 v22 = 0;
      container_log_handle_for_category();
      v8 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_188846000, v8, OS_LOG_TYPE_DEFAULT, "Migrating code signing info from file to DB", buf, 2u);
      }

      v18[0] = MEMORY[0x1895F87A8];
      v18[1] = 3221225472LL;
      v18[2] = __71__MCMCodeSigningMapping__onQueue_migrateFromMappingFileToDBIfNecessary__block_invoke;
      v18[3] = &unk_18A29D408;
      v18[4] = self;
      v18[5] = &v23;
      v18[6] = &v19;
      v18[7] = v29;
      [v7 enumerateKeysAndObjectsUsingBlock:v18];
      container_log_handle_for_category();
      v9 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        int v10 = *((unsigned __int16 *)v30 + 12);
        int v11 = *((unsigned __int16 *)v20 + 12);
        *(_DWORD *)buf = 67109376;
        *(_DWORD *)v34 = v10;
        *(_WORD *)&v34[4] = 1024;
        *(_DWORD *)&v34[6] = v11;
        _os_log_impl( &dword_188846000,  v9,  OS_LOG_TYPE_DEFAULT,  "Successfully migrated %d entries, failed to migrate %d",  buf,  0xEu);
      }

      if (*((_WORD *)v30 + 12))
      {
        v12 = +[MCMFileManager defaultManager](&OBJC_CLASS___MCMFileManager, "defaultManager");
        v13 = (id *)(v24 + 5);
        id obj = (id)v24[5];
        char v14 = [v12 removeItemAtURL:v6 error:&obj];
        objc_storeStrong(v13, obj);

        if ((v14 & 1) == 0)
        {
          container_log_handle_for_category();
          id v15 = (os_log_s *)objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
          {
            uint64_t v16 = v24[5];
            *(_DWORD *)buf = 138412290;
            *(void *)v34 = v16;
            _os_log_error_impl( &dword_188846000,  v15,  OS_LOG_TYPE_ERROR,  "Failed to remove legacy code signing mapping file: %@",  buf,  0xCu);
          }
        }
      }

      _Block_object_dispose(&v19, 8);
      _Block_object_dispose(v29, 8);
    }
  }

  else
  {
    container_log_handle_for_category();
    v6 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v29 = 0;
      _os_log_error_impl(&dword_188846000, v6, OS_LOG_TYPE_ERROR, "Failed to get library url.", v29, 2u);
    }
  }

  _Block_object_dispose(&v23, 8);
}

- (void)migrateAppGroupIdsFromDataContainersToFile
{
  uint64_t v53 = *MEMORY[0x1895F89C0];
  v2 = (void *)MEMORY[0x1895CE3A8](self, a2);
  v3 = (void *)objc_opt_new();
  if (([v3 hasMigrationOccurredForType:@"GroupIdMigration"] & 1) == 0)
  {
    v33 = v3;
    v34 = v2;
    container_log_handle_for_category();
    v4 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_188846000, v4, OS_LOG_TYPE_DEFAULT, "Performing group ID migration", buf, 2u);
    }
    v5 = -[MCMCodeSigningMapping userIdentityCache](self, "userIdentityCache");
    uint64_t v6 = [v5 userIdentityForLegacyMobileUser];

    uint64_t v35 = (void *)v6;
    v7 = +[MCMClientConnection privilegedClientConnectionWithUserIdentity:]( &OBJC_CLASS___MCMClientConnection,  "privilegedClientConnectionWithUserIdentity:",  v6);
    uint64_t v8 = 0LL;
    v9 = (objc_class *)&OBJC_CLASS___MCMContainerStagingPath;
    while (1)
    {
      int v10 = (void *)gContainerCache;
      objc_msgSend(MEMORY[0x189604010], "setWithObject:", v35, v33);
      int v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = (void *)qword_188918DD8[v8];
      id v43 = 0LL;
      [v10 entriesForUserIdentities:v11 contentClass:v12 transient:0 error:&v43];
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      id v14 = v43;

      if (!v13) {
        break;
      }
      v37 = v14;
      uint64_t v38 = v8;
      -[MCMCodeSigningMapping queue](self, "queue");
      id v15 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
      block[0] = MEMORY[0x1895F87A8];
      block[1] = 3221225472LL;
      block[2] = __67__MCMCodeSigningMapping_migrateAppGroupIdsFromDataContainersToFile__block_invoke;
      block[3] = &unk_18A29E238;
      void block[4] = self;
      id v16 = v13;
      id v42 = v16;
      dispatch_sync(v15, block);

      __int128 v47 = 0u;
      __int128 v48 = 0u;
      __int128 v45 = 0u;
      __int128 v46 = 0u;
      id obj = v16;
      uint64_t v17 = [obj countByEnumeratingWithState:&v45 objects:v44 count:16];
      if (v17)
      {
        uint64_t v18 = v17;
        uint64_t v19 = *(void *)v46;
        do
        {
          uint64_t v20 = 0LL;
          do
          {
            if (*(void *)v46 != v19) {
              objc_enumerationMutation(obj);
            }
            [*(id *)(*((void *)&v45 + 1) + 8 * v20) metadataMinimal];
            uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue();
            id v22 = objc_alloc_init(v9 + 140);
            uint64_t v23 = objc_alloc(&OBJC_CLASS___MCMCommandSetInfoValue);
            [v21 containerIdentity];
            uint64_t v24 = (void *)objc_claimAutoreleasedReturnValue();
            [v7 context];
            uint64_t v25 = (void *)objc_claimAutoreleasedReturnValue();
            v26 = -[MCMCommandSetInfoValue initWithKey:value:containerIdentity:context:resultPromise:]( v23,  "initWithKey:value:containerIdentity:context:resultPromise:",  @"com.apple.MobileInstallation.GroupContainerIDs",  0LL,  v24,  v25,  v22);

            -[MCMCommandSetInfoValue execute](v26, "execute");
            [v22 result];
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            [v27 error];
            id v28 = (void *)objc_claimAutoreleasedReturnValue();

            if (v28)
            {
              container_log_handle_for_category();
              v29 = (os_log_s *)objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
              {
                [v21 containerIdentity];
                v30 = (void *)objc_claimAutoreleasedReturnValue();
                [v22 result];
                v39 = (void *)objc_claimAutoreleasedReturnValue();
                [v39 error];
                uint64_t v31 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 138412546;
                v50 = v30;
                __int16 v51 = 2112;
                id v52 = v31;
                _os_log_error_impl( &dword_188846000,  v29,  OS_LOG_TYPE_ERROR,  "Failed to clear group id metadata for %@ : %@",  buf,  0x16u);

                v9 = (objc_class *)&OBJC_CLASS___MCMContainerStagingPath;
              }
            }

            ++v20;
          }

          while (v18 != v20);
          uint64_t v18 = [obj countByEnumeratingWithState:&v45 objects:v44 count:16];
        }

        while (v18);
      }

      uint64_t v8 = v38 + 1;
      if (v38 == 2)
      {
        v3 = v33;
        [v33 setMigrationCompleteForType:@"GroupIdMigration"];
        v2 = v34;
        goto LABEL_22;
      }
    }

    container_log_handle_for_category();
    __int16 v32 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    v2 = v34;
    if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134218242;
      v50 = v12;
      __int16 v51 = 2112;
      id v52 = v14;
      _os_log_error_impl( &dword_188846000,  v32,  OS_LOG_TYPE_ERROR,  "Failed to fetch list of containers for userId: 501, class %ld : %@",  buf,  0x16u);
    }

    v3 = v33;
LABEL_22:
  }

  objc_autoreleasePoolPop(v2);
}

- (void)_onQueue_migrateAppGroupIdsFromDataContainersToFileUsingContainers:(id)a3
{
  uint64_t v61 = *MEMORY[0x1895F89C0];
  id v4 = a3;
  id v42 = self;
  -[MCMCodeSigningMapping queue](self, "queue");
  v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  __int128 v59 = 0u;
  __int128 v60 = 0u;
  __int128 v57 = 0u;
  __int128 v58 = 0u;
  id v6 = v4;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v57 objects:v56 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v58;
    uint64_t v40 = *(void *)v58;
    id v41 = v6;
    do
    {
      uint64_t v10 = 0LL;
      do
      {
        if (*(void *)v58 != v9) {
          objc_enumerationMutation(v6);
        }
        int v11 = *(void **)(*((void *)&v57 + 1) + 8 * v10);
        v12 = (void *)MEMORY[0x1895CE3A8]();
        id v45 = 0LL;
        [v11 metadataWithError:&v45];
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        id v14 = v45;
        if (!v13)
        {
          container_log_handle_for_category();
          uint64_t v25 = (os_log_s *)objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 136315650;
            __int16 v51 = "-[MCMCodeSigningMapping _onQueue_migrateAppGroupIdsFromDataContainersToFileUsingContainers:]";
            __int16 v52 = 2112;
            uint64_t v53 = (os_log_s *)v11;
            __int16 v54 = 2112;
            id v55 = v14;
            _os_log_error_impl( &dword_188846000,  v25,  OS_LOG_TYPE_ERROR,  "%s: Could not fetch metadata for %@; error = %@",
              buf,
              0x20u);
          }

          goto LABEL_31;
        }

        [v13 info];
        id v15 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v15) {
          goto LABEL_32;
        }
        [v13 info];
        id v16 = (void *)objc_claimAutoreleasedReturnValue();
        [v16 objectForKeyedSubscript:@"com.apple.MobileInstallation.GroupContainerIDs"];
        uint64_t v17 = (os_log_s *)objc_claimAutoreleasedReturnValue();

        if (v17)
        {
          container_log_handle_for_category();
          uint64_t v18 = (os_log_s *)objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
          {
            [v13 identifier];
            v33 = (char *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412546;
            __int16 v51 = v33;
            __int16 v52 = 2112;
            uint64_t v53 = v17;
            _os_log_debug_impl( &dword_188846000,  v18,  OS_LOG_TYPE_DEBUG,  "Data container for userId: 501, identifier %@ references container IDs: %@",  buf,  0x16u);
          }

          -[MCMCodeSigningMapping codeSigningMappingDB](v42, "codeSigningMappingDB");
          uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue();
          [v13 identifier];
          uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue();
          id v44 = 0LL;
          [v19 codeSigningEntryWithIdentifier:v20 error:&v44];
          uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue();
          id v22 = v44;

          if (v21)
          {
            container_log_handle_for_category();
            uint64_t v23 = (os_log_s *)objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
            {
              [v13 identifier];
              uint64_t v24 = (char *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138412290;
              __int16 v51 = v24;
              _os_log_impl( &dword_188846000,  v23,  OS_LOG_TYPE_DEFAULT,  "Deleting app group entitlements for %@ because we already have them in mapping",  buf,  0xCu);
              goto LABEL_14;
            }

            goto LABEL_28;
          }

          [v22 domain];
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          if ([v26 isEqualToString:@"MCMErrorDomain"])
          {
            uint64_t v27 = [v22 code];

            if (v27 == 67)
            {
              container_log_handle_for_category();
              id v28 = (os_log_s *)objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
              {
                [v13 identifier];
                v29 = (char *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 138412290;
                __int16 v51 = v29;
                _os_log_impl( &dword_188846000,  v28,  OS_LOG_TYPE_DEFAULT,  "Migrating app group entitlements for %@",  buf,  0xCu);
              }

              v30 = objc_alloc(&OBJC_CLASS___MCMCodeSigningEntry);
              __int128 v47 = v17;
              __int128 v48 = @"com.apple.MobileContainerManager.Entitlements";
              __int128 v46 = @"com.apple.security.application-groups";
              [MEMORY[0x189603F68] dictionaryWithObjects:&v47 forKeys:&v46 count:1];
              v37 = (void *)objc_claimAutoreleasedReturnValue();
              v49 = v37;
              [MEMORY[0x189603F68] dictionaryWithObjects:&v49 forKeys:&v48 count:1];
              uint64_t v31 = (void *)objc_claimAutoreleasedReturnValue();
              uint64_t v23 = -[MCMCodeSigningEntry initWithCodeSigningInfo:andDataContainerClass:]( v30,  "initWithCodeSigningInfo:andDataContainerClass:",  v31,  [v13 containerClass]);

              -[os_log_s setInvalid:](v23, "setInvalid:", 1LL);
              -[MCMCodeSigningMapping codeSigningMappingDB](v42, "codeSigningMappingDB");
              uint64_t v38 = (void *)objc_claimAutoreleasedReturnValue();
              [v13 identifier];
              uint64_t v35 = (void *)objc_claimAutoreleasedReturnValue();
              id v43 = v22;
              char v36 = [v38 addCodeSigningEntry:v23 withIdentifier:v35 error:&v43];
              uint64_t v25 = (os_log_s *)v43;

              if ((v36 & 1) == 0)
              {
                container_log_handle_for_category();
                __int16 v32 = (os_log_s *)objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
                {
                  [v13 identifier];
                  v39 = (char *)objc_claimAutoreleasedReturnValue();
                  *(_DWORD *)buf = 138412546;
                  __int16 v51 = v39;
                  __int16 v52 = 2112;
                  uint64_t v53 = v25;
                  _os_log_error_impl( &dword_188846000,  v32,  OS_LOG_TYPE_ERROR,  "Failed to write migrated group id info to DB for %@ : %@",  buf,  0x16u);
                }
              }

              goto LABEL_29;
            }
          }

          else
          {
          }

          container_log_handle_for_category();
          uint64_t v23 = (os_log_s *)objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
          {
            [v13 identifier];
            uint64_t v24 = (char *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412546;
            __int16 v51 = v24;
            __int16 v52 = 2112;
            uint64_t v53 = (os_log_s *)v22;
            _os_log_error_impl( &dword_188846000,  v23,  OS_LOG_TYPE_ERROR,  "Error retrieving entry from DB with identifier %@ : %@",  buf,  0x16u);
LABEL_14:
          }

- (void)_onQueue_migrateDataFromLegacyEntitlementsFileToCodeSigningFile
{
  uint64_t v41 = *MEMORY[0x1895F89C0];
  -[MCMCodeSigningMapping queue](self, "queue");
  v3 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  -[MCMCodeSigningMapping library](self, "library");
  id v4 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 url];
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    [v5 URLByAppendingPathComponent:@"mcm_entitlements.plist" isDirectory:0];
    id v6 = (void *)objc_claimAutoreleasedReturnValue();
    +[MCMFileManager defaultManager](&OBJC_CLASS___MCMFileManager, "defaultManager");
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue();
    char v8 = [v7 itemDoesNotExistAtURL:v6];

    if ((v8 & 1) == 0)
    {
      container_log_handle_for_category();
      uint64_t v9 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(buf) = 0;
        _os_log_impl( &dword_188846000,  v9,  OS_LOG_TYPE_DEFAULT,  "Performing legacy entitlement migration",  (uint8_t *)&buf,  2u);
      }

      uint64_t v10 = (void *)[objc_alloc(MEMORY[0x189603FC8]) initWithContentsOfURL:v6];
      int v11 = v10;
      if (v10)
      {
        *(void *)&__int128 buf = 0LL;
        *((void *)&buf + 1) = &buf;
        uint64_t v37 = 0x3032000000LL;
        uint64_t v38 = __Block_byref_object_copy__3872;
        v39 = __Block_byref_object_dispose__3873;
        id v40 = 0LL;
        [v10 objectForKeyedSubscript:@"com.apple.MobileContainerManager.ChildPluginBundleIDs"];
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        [v11 objectForKeyedSubscript:@"com.apple.MobileContainerManager.EntitlementsRegisteredByCaller"];
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        [v11 objectForKeyedSubscript:@"com.apple.MobileContainerManager.PlaceholderEntitlements"];
        id v14 = (void *)objc_claimAutoreleasedReturnValue();
        [v11 removeObjectForKey:@"com.apple.MobileContainerManager.ChildPluginBundleIDs"];
        [v11 removeObjectForKey:@"com.apple.MobileContainerManager.EntitlementsRegisteredByCaller"];
        [v11 removeObjectForKey:@"com.apple.MobileContainerManager.PlaceholderEntitlements"];
        v27[0] = MEMORY[0x1895F87A8];
        v27[1] = 3221225472LL;
        v27[2] = __88__MCMCodeSigningMapping__onQueue_migrateDataFromLegacyEntitlementsFileToCodeSigningFile__block_invoke;
        v27[3] = &unk_18A29D430;
        p___int128 buf = &buf;
        v27[4] = self;
        id v15 = v12;
        id v28 = v15;
        id v16 = v14;
        id v29 = v16;
        id v17 = v13;
        id v30 = v17;
        [v11 enumerateKeysAndObjectsUsingBlock:v27];
        +[MCMFileManager defaultManager](&OBJC_CLASS___MCMFileManager, "defaultManager");
        uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue();
        uint64_t v19 = (id *)(*((void *)&buf + 1) + 40LL);
        id obj = *(id *)(*((void *)&buf + 1) + 40LL);
        char v20 = [v18 removeItemAtURL:v6 error:&obj];
        objc_storeStrong(v19, obj);

        if ((v20 & 1) == 0)
        {
          container_log_handle_for_category();
          uint64_t v21 = (os_log_s *)objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
          {
            [v6 path];
            uint64_t v24 = (void *)objc_claimAutoreleasedReturnValue();
            uint64_t v25 = *(void *)(*((void *)&buf + 1) + 40LL);
            *(_DWORD *)__int16 v32 = 138412546;
            v33 = v24;
            __int16 v34 = 2112;
            uint64_t v35 = v25;
            _os_log_error_impl( &dword_188846000,  v21,  OS_LOG_TYPE_ERROR,  "Failed to remove legacy file at %@: %@",  v32,  0x16u);
          }
        }

        container_log_handle_for_category();
        id v22 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)__int16 v32 = 0;
          _os_log_impl(&dword_188846000, v22, OS_LOG_TYPE_DEFAULT, "Legacy entitlement migration completed", v32, 2u);
        }

        _Block_object_dispose(&buf, 8);
      }

      else
      {
        container_log_handle_for_category();
        int v11 = (void *)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled((os_log_t)v11, OS_LOG_TYPE_ERROR))
        {
          [v6 path];
          uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue();
          LODWORD(buf) = 138412290;
          *(void *)((char *)&buf + 4) = v23;
          _os_log_error_impl( &dword_188846000,  (os_log_t)v11,  OS_LOG_TYPE_ERROR,  "Entitlement File exists at %@, but we unexpectedly cant read it",  (uint8_t *)&buf,  0xCu);
        }
      }
    }
  }

  else
  {
    container_log_handle_for_category();
    id v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled((os_log_t)v6, OS_LOG_TYPE_ERROR))
    {
      LOWORD(buf) = 0;
      _os_log_error_impl( &dword_188846000,  (os_log_t)v6,  OS_LOG_TYPE_ERROR,  "Failed to get library url.",  (uint8_t *)&buf,  2u);
    }
  }
}

- (void)migrateCachedCodeSigningInfoFromBundleContainersToMapping
{
  uint64_t v10 = *MEMORY[0x1895F89C0];
  v3 = (void *)MEMORY[0x1895CE3A8](self, a2);
  id v4 = (void *)objc_opt_new();
  if (([v4 hasMigrationOccurredForType:@"CodeSigningMigration"] & 1) == 0)
  {
    container_log_handle_for_category();
    v5 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)__int128 buf = 0;
      _os_log_impl(&dword_188846000, v5, OS_LOG_TYPE_DEFAULT, "Performing code signing migration", buf, 2u);
    }

    id v6 = containermanager_copy_global_configuration();
    [v6 classIterator];
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8[0] = MEMORY[0x1895F87A8];
    v8[1] = 3221225472LL;
    v8[2] = __82__MCMCodeSigningMapping_migrateCachedCodeSigningInfoFromBundleContainersToMapping__block_invoke;
    v8[3] = &unk_18A29D4A8;
    v8[4] = self;
    [v7 selectWithFlags:0x10000040000 iterator:v8];

    [v4 setMigrationCompleteForType:@"CodeSigningMigration"];
  }

  objc_autoreleasePoolPop(v3);
}

- (void)_onQueue_migrateCachedCodeSigningInfoFromBundleContainersToMappingWithContainersLegacy:(id)a3 containerClass:(unint64_t)a4
{
  uint64_t v66 = *MEMORY[0x1895F89C0];
  id v6 = a3;
  -[MCMCodeSigningMapping queue](self, "queue");
  uint64_t v7 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v7);

  __int128 v64 = 0u;
  __int128 v65 = 0u;
  __int128 v62 = 0u;
  __int128 v63 = 0u;
  id v8 = v6;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v62 objects:v61 count:16];
  if (v9)
  {
    uint64_t v11 = v9;
    uint64_t v49 = *(void *)v63;
    *(void *)&__int128 v10 = 138412546LL;
    __int128 v43 = v10;
    id v44 = v8;
    id v45 = self;
    unint64_t v46 = a4;
    do
    {
      uint64_t v12 = 0LL;
      uint64_t v47 = v11;
      do
      {
        if (*(void *)v63 != v49) {
          objc_enumerationMutation(v8);
        }
        v13 = *(void **)(*((void *)&v62 + 1) + 8 * v12);
        id v14 = (void *)MEMORY[0x1895CE3A8]();
        id v54 = 0LL;
        [v13 metadataWithError:&v54];
        id v15 = (void *)objc_claimAutoreleasedReturnValue();
        id v16 = v54;
        id v17 = v16;
        if (v15)
        {
          id v50 = v16;
          __int16 v51 = v14;
          [v15 info];
          uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue();
          [v18 objectForKeyedSubscript:@"com.apple.MobileInstallation.CachedCodeSigningInfo"];
          uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_opt_class();
          id v20 = v19;
          if ((objc_opt_isKindOfClass() & 1) != 0) {
            id v21 = v20;
          }
          else {
            id v21 = 0LL;
          }

          if (!v21)
          {
            id v17 = v50;
            id v14 = v51;
            goto LABEL_41;
          }

          -[MCMCodeSigningMapping codeSigningMappingDB](self, "codeSigningMappingDB");
          id v22 = (void *)objc_claimAutoreleasedReturnValue();
          [v15 identifier];
          uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue();
          id v53 = 0LL;
          [v22 codeSigningEntryWithIdentifier:v23 error:&v53];
          uint64_t v24 = (void *)objc_claimAutoreleasedReturnValue();
          id v25 = v53;

          __int128 v48 = v24;
          if (v24 && ([v24 isInvalid] & 1) == 0)
          {
            container_log_handle_for_category();
            id v30 = (os_log_s *)objc_claimAutoreleasedReturnValue();
            if (!os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT)) {
              goto LABEL_30;
            }
            [v15 identifier];
            __int16 v34 = (char *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)__int128 buf = 138412290;
            v56 = v34;
            _os_log_impl( &dword_188846000,  v30,  OS_LOG_TYPE_DEFAULT,  "Deleting cached code signing info for %@ because we already have it in mapping",  buf,  0xCu);
          }

          else
          {
            objc_msgSend(v25, "domain", v43);
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            if ([v26 isEqualToString:@"MCMErrorDomain"]
              && [v25 code] == 67)
            {

              goto LABEL_20;
            }

            char v27 = [v24 isInvalid];

            if ((v27 & 1) != 0)
            {
LABEL_20:
              container_log_handle_for_category();
              id v28 = (os_log_s *)objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
              {
                [v15 identifier];
                id v29 = (char *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)__int128 buf = 138412290;
                v56 = v29;
                _os_log_impl( &dword_188846000,  v28,  OS_LOG_TYPE_DEFAULT,  "Migrating code signing info for %@",  buf,  0xCu);
              }

              id v30 = (os_log_s *)[v21 mutableCopy];
              [v21 objectForKeyedSubscript:@"Entitlements"];
              uint64_t v31 = (void *)objc_claimAutoreleasedReturnValue();
              -[os_log_s setObject:forKeyedSubscript:]( v30,  "setObject:forKeyedSubscript:",  v31,  @"com.apple.MobileContainerManager.Entitlements");

              __int16 v32 = objc_alloc(&OBJC_CLASS___MCMCodeSigningEntry);
              if ((uint64_t)a4 > 4)
              {
                if (a4 == 5)
                {
                  uint64_t v33 = 6LL;
                }

                else
                {
                  uint64_t v33 = 2LL;
                  if (a4 != 14) {
                    goto LABEL_33;
                  }
                }
              }

              else
              {
                uint64_t v33 = 2LL;
                if (a4 == 1) {
                  goto LABEL_35;
                }
                if (a4 == 3)
                {
                  uint64_t v33 = 4LL;
                  goto LABEL_35;
                }

- (void)_onQueue_migrateCachedCodeSigningInfoFromBundleContainerToMappingWithInfo:(id)a3 identifier:(id)a4 containerClass:(unint64_t)a5
{
  uint64_t v32 = *MEMORY[0x1895F89C0];
  id v8 = a3;
  id v9 = a4;
  -[MCMCodeSigningMapping queue](self, "queue");
  __int128 v10 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v10);

  -[MCMCodeSigningMapping codeSigningMappingDB](self, "codeSigningMappingDB");
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue();
  id v27 = 0LL;
  [v11 codeSigningEntryWithIdentifier:v9 error:&v27];
  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue();
  id v13 = v27;

  if (v12 && ([v12 isInvalid] & 1) == 0)
  {
    container_log_handle_for_category();
    id v17 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)__int128 buf = 138412290;
      id v29 = v9;
      _os_log_impl( &dword_188846000,  v17,  OS_LOG_TYPE_DEFAULT,  "Deleting cached code signing info for %@ because we already have it in mapping",  buf,  0xCu);
    }

    goto LABEL_17;
  }

  [v13 domain];
  id v14 = (void *)objc_claimAutoreleasedReturnValue();
  if ([v14 isEqualToString:@"MCMErrorDomain"] && objc_msgSend(v13, "code") == 67)
  {

    goto LABEL_7;
  }

  char v15 = [v12 isInvalid];

  if ((v15 & 1) == 0)
  {
    container_log_handle_for_category();
    id v17 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)__int128 buf = 138412546;
      id v29 = v9;
      __int16 v30 = 2112;
      id v31 = v13;
      _os_log_error_impl( &dword_188846000,  v17,  OS_LOG_TYPE_ERROR,  "Error retrieving entry from DB with identifier %@ : %@",  buf,  0x16u);
    }

- (void)_onQueue_reconcileSystemContainersWithContext:(id)a3
{
  uint64_t v50 = *MEMORY[0x1895F89C0];
  id v30 = a3;
  -[MCMCodeSigningMapping queue](self, "queue");
  id v4 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v4);

  uint64_t v36 = 0LL;
  uint64_t v37 = &v36;
  uint64_t v38 = 0x3032000000LL;
  char v39 = __Block_byref_object_copy__3872;
  id v40 = __Block_byref_object_dispose__3873;
  id v41 = 0LL;
  [MEMORY[0x189603FE0] setWithCapacity:0];
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[MCMCodeSigningMapping userIdentityCache](self, "userIdentityCache");
  id v6 = (void *)objc_claimAutoreleasedReturnValue();
  [v6 defaultUserIdentity];
  id v29 = (void *)objc_claimAutoreleasedReturnValue();

  -[MCMCodeSigningMapping queue](self, "queue");
  uint64_t v7 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = __71__MCMCodeSigningMapping__onQueue_reconcileSystemContainersWithContext___block_invoke;
  block[3] = &unk_18A29E328;
  id v35 = &v36;
  void block[4] = self;
  id v31 = v5;
  id v34 = v31;
  dispatch_sync(v7, block);

  if (v37[5])
  {
    container_log_handle_for_category();
    log = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(log, OS_LOG_TYPE_ERROR))
    {
      id v8 = (os_log_s *)v37[5];
      *(_DWORD *)__int128 buf = 138412290;
      uint64_t v49 = v8;
      _os_log_error_impl( &dword_188846000,  log,  OS_LOG_TYPE_ERROR,  "Failed to enumerate system container references: %@",  buf,  0xCu);
    }
  }

  else
  {
    [v30 containerCache];
    id v9 = (void *)objc_claimAutoreleasedReturnValue();
    [MEMORY[0x189604010] setWithObject:v29];
    __int128 v10 = (void *)objc_claimAutoreleasedReturnValue();
    id v32 = 0LL;
    [v9 entriesForUserIdentities:v10 contentClass:12 transient:0 error:&v32];
    id v27 = (void *)objc_claimAutoreleasedReturnValue();
    log = (os_log_s *)v32;

    if (v27)
    {
      __int128 v46 = 0u;
      __int128 v47 = 0u;
      __int128 v44 = 0u;
      __int128 v45 = 0u;
      id v11 = v27;
      uint64_t v12 = [v11 countByEnumeratingWithState:&v44 objects:v43 count:16];
      if (v12)
      {
        uint64_t v13 = *(void *)v45;
        do
        {
          for (uint64_t i = 0LL; i != v12; ++i)
          {
            if (*(void *)v45 != v13) {
              objc_enumerationMutation(v11);
            }
            [*(id *)(*((void *)&v44 + 1) + 8 * i) metadataMinimal];
            char v15 = (void *)objc_claimAutoreleasedReturnValue();
            [v15 identifier];
            id v16 = (void *)objc_claimAutoreleasedReturnValue();
            char v17 = [v31 containsObject:v16];

            if ((v17 & 1) == 0)
            {
              container_log_handle_for_category();
              uint64_t v18 = (os_log_s *)objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
              {
                [v15 identifier];
                id v26 = (os_log_s *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)__int128 buf = 138412290;
                uint64_t v49 = v26;
                _os_log_error_impl( &dword_188846000,  v18,  OS_LOG_TYPE_ERROR,  "Removing system container with identifier %@",  buf,  0xCu);
              }

              uint64_t v19 = objc_alloc_init(&OBJC_CLASS___MCMResultPromise);
              [v15 containerIdentity];
              uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue();
              uint64_t v42 = v20;
              [MEMORY[0x189603F18] arrayWithObjects:&v42 count:1];
              id v21 = (void *)objc_claimAutoreleasedReturnValue();
              +[MCMCommandOperationDelete commandForOperationDeleteWithContainerIdentities:removeAllCodeSignInfo:context:resultPromise:]( &OBJC_CLASS___MCMCommandOperationDelete,  "commandForOperationDeleteWithContainerIdentities:removeAllCodeSignInfo:context:resultPromise:",  v21,  0LL,  v30,  v19);
              id v22 = (void *)objc_claimAutoreleasedReturnValue();

              [v22 execute];
              -[MCMResultPromise result](v19, "result");
              uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue();
              [v23 error];
              char v24 = (os_log_s *)objc_claimAutoreleasedReturnValue();

              if (v24)
              {
                container_log_handle_for_category();
                id v25 = (os_log_s *)objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
                {
                  *(_DWORD *)__int128 buf = 138412290;
                  uint64_t v49 = v24;
                  _os_log_error_impl( &dword_188846000,  v25,  OS_LOG_TYPE_ERROR,  "Failed to destroy system container(s) with no references; error = %@",
                    buf,
                    0xCu);
                }
              }
            }
          }

          uint64_t v12 = [v11 countByEnumeratingWithState:&v44 objects:v43 count:16];
        }

        while (v12);
      }
    }

    else
    {
      container_log_handle_for_category();
      id v11 = (id)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled((os_log_t)v11, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)__int128 buf = 138412290;
        uint64_t v49 = log;
        _os_log_error_impl( &dword_188846000,  (os_log_t)v11,  OS_LOG_TYPE_ERROR,  "Failed to fetch system container list: %@",  buf,  0xCu);
      }
    }
  }

  _Block_object_dispose(&v36, 8);
}

- (void)performAllCodeSigningMigrationAndReconciliationWithContext:(id)a3
{
  uint64_t v12 = *MEMORY[0x1895F89C0];
  id v9 = a3;
  uint32_t multiuser_flags = 0;
  host_t v4 = MEMORY[0x1895CE2D0]();
  if (host_get_multiuser_config_flags(v4, &multiuser_flags) || (multiuser_flags & 0x80000000) == 0) {
    -[MCMCodeSigningMapping migrateAppGroupIdsFromDataContainersToFile]( self,  "migrateAppGroupIdsFromDataContainersToFile");
  }
  -[MCMCodeSigningMapping queue](self, "queue");
  v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = __84__MCMCodeSigningMapping_performAllCodeSigningMigrationAndReconciliationWithContext___block_invoke;
  block[3] = &unk_18A29E378;
  void block[4] = self;
  dispatch_sync(v5, block);

  uint64_t v6 = -[MCMCodeSigningMapping migrateCachedCodeSigningInfoFromBundleContainersToMapping]( self,  "migrateCachedCodeSigningInfoFromBundleContainersToMapping");
  uint32_t multiuser_flags = 0;
  host_t v7 = MEMORY[0x1895CE2D0](v6);
  if (host_get_multiuser_config_flags(v7, &multiuser_flags) || (multiuser_flags & 0x80000000) == 0)
  {
    +[MCMGroupManager defaultManager](&OBJC_CLASS___MCMGroupManager, "defaultManager");
    id v8 = (void *)objc_claimAutoreleasedReturnValue();
    [v8 reconcileGroupContainersForContainerClass:7 context:v9];
  }
}

- (id)_readCodeSigningMappingFromDiskAtURL:(id)a3
{
  uint64_t v33 = *MEMORY[0x1895F89C0];
  id v3 = a3;
  id v23 = 0LL;
  objc_msgSend(MEMORY[0x189603F68], "MCM_dictionaryWithContentsOfURL:options:error:", v3, 0, &v23);
  host_t v4 = (void *)objc_claimAutoreleasedReturnValue();
  id v5 = v23;
  uint64_t v6 = v5;
  if (v4)
  {
    host_t v7 = (void *)objc_opt_new();
    __int128 v25 = 0u;
    __int128 v26 = 0u;
    __int128 v27 = 0u;
    __int128 v28 = 0u;
    [v4 allKeys];
    id obj = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v8 = [obj countByEnumeratingWithState:&v25 objects:v24 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      id v21 = v6;
      uint64_t v10 = *(void *)v26;
      do
      {
        for (uint64_t i = 0LL; i != v9; ++i)
        {
          if (*(void *)v26 != v10) {
            objc_enumerationMutation(obj);
          }
          uint64_t v12 = *(void *)(*((void *)&v25 + 1) + 8 * i);
          uint64_t v13 = (void *)MEMORY[0x1895CE3A8]();
          id v14 = objc_alloc(&OBJC_CLASS___MCMCodeSigningEntry);
          [v4 objectForKeyedSubscript:v12];
          char v15 = (void *)objc_claimAutoreleasedReturnValue();
          id v16 = -[MCMCodeSigningEntry initWithSerializedDictionary:](v14, "initWithSerializedDictionary:", v15);

          [v7 setObject:v16 forKeyedSubscript:v12];
          objc_autoreleasePoolPop(v13);
        }

        uint64_t v9 = [obj countByEnumeratingWithState:&v25 objects:v24 count:16];
      }

      while (v9);
      uint64_t v6 = v21;
    }

- (id)_onQueue_setCodeSigningDictionaryValues:(id)a3 forIdentifiers:(id)a4
{
  uint64_t v46 = *MEMORY[0x1895F89C0];
  id v6 = a3;
  id v7 = a4;
  -[MCMCodeSigningMapping queue](self, "queue");
  uint64_t v8 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v8);

  uint64_t v9 = [v6 count];
  if (v9 != [v7 count])
  {
    v39[0] = MEMORY[0x1895F87A8];
    v39[1] = 3221225472LL;
    v39[2] = __80__MCMCodeSigningMapping__onQueue_setCodeSigningDictionaryValues_forIdentifiers___block_invoke;
    v39[3] = &unk_18A29E118;
    id v40 = v6;
    id v41 = v7;
    __80__MCMCodeSigningMapping__onQueue_setCodeSigningDictionaryValues_forIdentifiers___block_invoke((uint64_t)v39);
    id v11 = (id)objc_claimAutoreleasedReturnValue();

    uint64_t v14 = (uint64_t)v40;
    goto LABEL_31;
  }

  if (![v6 count] || !objc_msgSend(v6, "count"))
  {
    id v11 = 0LL;
    goto LABEL_33;
  }

  id v11 = 0LL;
  uint64_t v12 = 0LL;
  *(void *)&__int128 v10 = 138412290LL;
  __int128 v34 = v10;
  while (1)
  {
    uint64_t v13 = v11;
    uint64_t v14 = objc_msgSend(v6, "objectAtIndex:", v12, v34);
    [v7 objectAtIndex:v12];
    char v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[MCMCodeSigningMapping codeSigningMappingDB](self, "codeSigningMappingDB");
    id v16 = (void *)objc_claimAutoreleasedReturnValue();
    id v38 = v11;
    uint64_t v17 = [v16 codeSigningEntryWithIdentifier:v15 error:&v38];
    id v11 = v38;

    if (v17) {
      goto LABEL_9;
    }
    [v11 domain];
    uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v19 = [v11 code];

    if (v19 != 67) {
      goto LABEL_35;
    }

    id v11 = 0LL;
LABEL_9:
    [(id)v14 codeSigningInfo];
    uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v20)
    {

      uint64_t v14 = 0LL;
    }

    if (!(v17 | v14) || ([(id)v14 isEqual:v17] & 1) != 0) {
      goto LABEL_26;
    }
    -[MCMCodeSigningMapping codeSigningMappingDB](self, "codeSigningMappingDB");
    id v21 = (void *)objc_claimAutoreleasedReturnValue();
    id v22 = v21;
    if (v14)
    {
      id v37 = v11;
      char v23 = [v21 addCodeSigningEntry:v14 withIdentifier:v15 error:&v37];
      id v35 = v37;

      if ((v23 & 1) != 0)
      {
        container_log_handle_for_category();
        char v24 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)__int128 buf = 138412546;
          __int128 v43 = v15;
          __int16 v44 = 2112;
          uint64_t v45 = v14;
          __int128 v25 = v24;
          __int128 v26 = "Set Code Signing Mapping for ID: %@ : %@";
          uint32_t v27 = 22;
LABEL_20:
          _os_log_impl(&dword_188846000, v25, OS_LOG_TYPE_DEFAULT, v26, buf, v27);
        }
      }

      else
      {
        container_log_handle_for_category();
        char v24 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)__int128 buf = 138412546;
          __int128 v43 = v15;
          __int16 v44 = 2112;
          id v29 = v35;
          uint64_t v45 = (uint64_t)v35;
          id v30 = v24;
          __int16 v31 = "Failed to write code signing info to DB for %@ : %@";
LABEL_29:
          _os_log_error_impl(&dword_188846000, v30, OS_LOG_TYPE_ERROR, v31, buf, 0x16u);
          goto LABEL_25;
        }
      }
    }

    else
    {
      id v36 = v11;
      char v28 = [v21 deleteCodeSigningEntryWithIdentifier:v15 error:&v36];
      id v35 = v36;

      if ((v28 & 1) != 0)
      {
        container_log_handle_for_category();
        char v24 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)__int128 buf = v34;
          __int128 v43 = v15;
          __int128 v25 = v24;
          __int128 v26 = "Deleted Code Signing Mapping for ID: %@";
          uint32_t v27 = 12;
          goto LABEL_20;
        }
      }

      else
      {
        container_log_handle_for_category();
        char v24 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)__int128 buf = 138412546;
          __int128 v43 = v15;
          __int16 v44 = 2112;
          id v29 = v35;
          uint64_t v45 = (uint64_t)v35;
          id v30 = v24;
          __int16 v31 = "Failed to delete code signing info from DB for %@ : %@";
          goto LABEL_29;
        }
      }
    }

    id v29 = v35;
LABEL_25:

    id v11 = v29;
LABEL_26:
  }

LABEL_35:
  container_log_handle_for_category();
  uint64_t v33 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)__int128 buf = 138412546;
    __int128 v43 = v15;
    __int16 v44 = 2112;
    uint64_t v45 = (uint64_t)v11;
    _os_log_error_impl( &dword_188846000,  v33,  OS_LOG_TYPE_ERROR,  "Error retrieving entry from DB with identifier %@ : %@",  buf,  0x16u);
  }

LABEL_31:
LABEL_33:

  return v11;
}

- (id)_onQueue_codeSigningInfoForIdentifier:(id)a3 externalRequest:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v21 = *MEMORY[0x1895F89C0];
  id v6 = a3;
  -[MCMCodeSigningMapping queue](self, "queue");
  id v7 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v7);

  -[MCMCodeSigningMapping codeSigningMappingDB](self, "codeSigningMappingDB");
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
  id v16 = 0LL;
  [v8 codeSigningEntryWithIdentifier:v6 error:&v16];
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue();
  id v10 = v16;

  if (v9) {
    goto LABEL_2;
  }
  [v10 domain];
  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue();
  if ([v12 isEqualToString:@"MCMErrorDomain"])
  {
    uint64_t v13 = [v10 code];

    if (v13 == 67)
    {
LABEL_2:
      -[MCMCodeSigningMapping _codeSigningInfoForCodeSigningEntry:externalRequest:]( self,  "_codeSigningInfoForCodeSigningEntry:externalRequest:",  v9,  v4);
      id v11 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_10;
    }
  }

  else
  {
  }

  container_log_handle_for_category();
  uint64_t v14 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)__int128 buf = 138412546;
    id v18 = v6;
    __int16 v19 = 2112;
    id v20 = v10;
    _os_log_error_impl( &dword_188846000,  v14,  OS_LOG_TYPE_ERROR,  "Error retrieving entry from DB with identifier %@ : %@",  buf,  0x16u);
  }

  id v11 = 0LL;
LABEL_10:

  return v11;
}

- (id)_codeSigningInfoForCodeSigningEntry:(id)a3 externalRequest:(BOOL)a4
{
  BOOL v4 = a4;
  id v5 = a3;
  id v6 = v5;
  if (v4
    && (([v5 isPlaceholder] & 1) != 0
     || ([v6 isAdvanceCopy] & 1) != 0
     || ([v6 isInvalid] & 1) != 0
     || ([v6 isRegisteredByKernel] & 1) != 0))
  {
    id v7 = 0LL;
  }

  else
  {
    [v6 codeSigningInfo];
    id v7 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v7;
}

- (id)_onQueue_entitlementsForIdentifier:(id)a3
{
  id v4 = a3;
  -[MCMCodeSigningMapping queue](self, "queue");
  id v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  -[MCMCodeSigningMapping _onQueue_codeSigningInfoForIdentifier:externalRequest:]( self,  "_onQueue_codeSigningInfoForIdentifier:externalRequest:",  v4,  0LL);
  id v6 = (void *)objc_claimAutoreleasedReturnValue();
  id v7 = objc_alloc(&OBJC_CLASS___MCMEntitlements);
  [v6 objectForKeyedSubscript:@"com.apple.MobileContainerManager.Entitlements"];
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
  id v9 = containermanager_copy_global_configuration();
  [v9 classIterator];
  id v10 = (void *)objc_claimAutoreleasedReturnValue();
  id v11 = -[MCMEntitlements initWithEntitlements:clientIdentifier:classIterator:]( v7,  "initWithEntitlements:clientIdentifier:classIterator:",  v8,  v4,  v10);

  return v11;
}

- (id)_entitlementsFromCodeSigningEntry:(id)a3
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue();
  [v3 objectForKeyedSubscript:@"com.apple.MobileContainerManager.Entitlements"];
  id v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)_onQueue_codeSigningEntryForIdentifier:(id)a3 withError:(id *)a4
{
  uint64_t v20 = *MEMORY[0x1895F89C0];
  id v6 = a3;
  -[MCMCodeSigningMapping queue](self, "queue");
  id v7 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v7);

  -[MCMCodeSigningMapping codeSigningMappingDB](self, "codeSigningMappingDB");
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
  id v15 = 0LL;
  [v8 codeSigningEntryWithIdentifier:v6 error:&v15];
  id v9 = (void *)objc_claimAutoreleasedReturnValue();
  id v10 = v15;

  if (v9) {
    goto LABEL_6;
  }
  [v10 domain];
  id v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (([v11 isEqualToString:@"MCMErrorDomain"] & 1) == 0)
  {

LABEL_8:
    container_log_handle_for_category();
    uint64_t v14 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)__int128 buf = 138412546;
      id v17 = v6;
      __int16 v18 = 2112;
      id v19 = v10;
      _os_log_error_impl( &dword_188846000,  v14,  OS_LOG_TYPE_ERROR,  "Error retrieving entry from DB with identifier %@ : %@",  buf,  0x16u);
    }

    if (a4) {
      goto LABEL_5;
    }
    goto LABEL_6;
  }

  uint64_t v12 = [v10 code];

  if (v12 != 67) {
    goto LABEL_8;
  }
  if (a4) {
LABEL_5:
  }
    *a4 = v10;
LABEL_6:

  return v9;
}

- (BOOL)_onQueue_identifierHasCallerRegisteredEntitlements:(id)a3
{
  uint64_t v19 = *MEMORY[0x1895F89C0];
  id v4 = a3;
  -[MCMCodeSigningMapping queue](self, "queue");
  id v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  -[MCMCodeSigningMapping codeSigningMappingDB](self, "codeSigningMappingDB");
  id v6 = (void *)objc_claimAutoreleasedReturnValue();
  id v14 = 0LL;
  [v6 codeSigningEntryWithIdentifier:v4 error:&v14];
  id v7 = (void *)objc_claimAutoreleasedReturnValue();
  id v8 = v14;

  if (v7) {
    goto LABEL_2;
  }
  [v8 domain];
  id v10 = (void *)objc_claimAutoreleasedReturnValue();
  if ([v10 isEqualToString:@"MCMErrorDomain"])
  {
    uint64_t v11 = [v8 code];

    if (v11 == 67)
    {
LABEL_2:
      char v9 = [v7 isRegisteredByCaller];
      goto LABEL_10;
    }
  }

  else
  {
  }

  container_log_handle_for_category();
  uint64_t v12 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)__int128 buf = 138412546;
    id v16 = v4;
    __int16 v17 = 2112;
    id v18 = v8;
    _os_log_error_impl( &dword_188846000,  v12,  OS_LOG_TYPE_ERROR,  "Error retrieving entry from DB with identifier %@ : %@",  buf,  0x16u);
  }

  char v9 = 0;
LABEL_10:

  return v9;
}

- (unint64_t)_onQueue_dataContainerTypeForIdentifier:(id)a3
{
  uint64_t v19 = *MEMORY[0x1895F89C0];
  id v4 = a3;
  -[MCMCodeSigningMapping queue](self, "queue");
  id v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  -[MCMCodeSigningMapping codeSigningMappingDB](self, "codeSigningMappingDB");
  id v6 = (void *)objc_claimAutoreleasedReturnValue();
  id v14 = 0LL;
  [v6 codeSigningEntryWithIdentifier:v4 error:&v14];
  id v7 = (void *)objc_claimAutoreleasedReturnValue();
  id v8 = v14;

  if (v7) {
    goto LABEL_2;
  }
  [v8 domain];
  id v10 = (void *)objc_claimAutoreleasedReturnValue();
  if ([v10 isEqualToString:@"MCMErrorDomain"])
  {
    uint64_t v11 = [v8 code];

    if (v11 == 67)
    {
LABEL_2:
      unint64_t v9 = [v7 dataContainerClass];
      goto LABEL_10;
    }
  }

  else
  {
  }

  container_log_handle_for_category();
  uint64_t v12 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)__int128 buf = 138412546;
    id v16 = v4;
    __int16 v17 = 2112;
    id v18 = v8;
    _os_log_error_impl( &dword_188846000,  v12,  OS_LOG_TYPE_ERROR,  "Error retrieving entry from DB with identifier %@ : %@",  buf,  0x16u);
  }

  unint64_t v9 = 0LL;
LABEL_10:

  return v9;
}

- (BOOL)_onQueue_processCodeSigningInfo:(id)a3 identifier:(id)a4 options:(id)a5 oldEntitlements:(id)a6 error:(id *)a7 reconcileHandler:(id)a8
{
  v73 = a7;
  uint64_t v104 = *MEMORY[0x1895F89C0];
  id v80 = a3;
  id v83 = a4;
  id v84 = a5;
  id v78 = a6;
  v74 = (void (**)(void))a8;
  v77 = self;
  -[MCMCodeSigningMapping queue](self, "queue");
  uint64_t v13 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v13);

  v76 = (void *)objc_opt_new();
  v75 = (void *)objc_opt_new();
  v79 = (void *)objc_opt_new();
  v81 = (void *)objc_opt_new();
  v82 = (void *)objc_opt_new();
  if (!v83)
  {
    char v24 = 0LL;
    __int128 v25 = -[MCMError initWithErrorType:](objc_alloc(&OBJC_CLASS___MCMError), "initWithErrorType:", 18LL);
    v85 = 0LL;
    __int128 v26 = 0LL;
    uint64_t v27 = 0LL;
    char v28 = 0LL;
    uint64_t v29 = 0LL;
    id v17 = 0LL;
    goto LABEL_79;
  }

  id v14 = v84;
  if (!v84) {
    id v14 = (id)MEMORY[0x189604A60];
  }
  id v84 = v14;
  -[MCMCodeSigningMapping codeSigningMappingDB](self, "codeSigningMappingDB", v73);
  id v15 = (void *)objc_claimAutoreleasedReturnValue();
  id v93 = 0LL;
  [v15 codeSigningEntryWithIdentifier:v83 error:&v93];
  id v16 = (void *)objc_claimAutoreleasedReturnValue();
  id v17 = v93;

  if (!v16)
  {
    [v17 domain];
    id v30 = (void *)objc_claimAutoreleasedReturnValue();
    if ([v30 isEqualToString:@"MCMErrorDomain"])
    {
      BOOL v31 = [v17 code] == 67;

      if (v31)
      {

        id v17 = 0LL;
        goto LABEL_5;
      }
    }

    else
    {
    }

    container_log_handle_for_category();
    id v32 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)__int128 buf = 138412546;
      id v95 = v83;
      __int16 v96 = 2112;
      uint64_t v97 = (uint64_t)v17;
      _os_log_error_impl( &dword_188846000,  v32,  OS_LOG_TYPE_ERROR,  "Error retrieving entry from DB with identifier %@ : %@",  buf,  0x16u);
    }

    id v16 = 0LL;
    v85 = 0LL;
    __int128 v26 = 0LL;
    uint64_t v27 = 0LL;
    char v28 = 0LL;
    uint64_t v29 = 0LL;
    BOOL v33 = 0;
    if (!v17) {
      goto LABEL_73;
    }
    goto LABEL_67;
  }

- (id)_onQueue_invalidateCodeSigningInfoForIdentifierAndItsChildren:(id)a3
{
  v9[1] = *(id *)MEMORY[0x1895F89C0];
  id v4 = a3;
  -[MCMCodeSigningMapping queue](self, "queue");
  id v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  -[MCMCodeSigningMapping codeSigningMappingDB](self, "codeSigningMappingDB");
  id v6 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = 0LL;
  [v6 invalidateCodeSigningForIdentifierAndAllChildren:v4 error:v9];

  id v7 = v9[0];
  return v7;
}

- (BOOL)_onQueue_invalidateCodeSigningInfoForIdentifier:(id)a3 error:(id *)a4
{
  id v6 = a3;
  -[MCMCodeSigningMapping queue](self, "queue");
  id v7 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v7);

  -[MCMCodeSigningMapping codeSigningMappingDB](self, "codeSigningMappingDB");
  id v8 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a4) = [v8 invalidateCodeSigningWithIdentifier:v6 error:a4];

  return (char)a4;
}

- (void)_onQueue_iterateGroupIdsWithKey:(id)a3 fallBackKey:(id)a4 noReferenceKey:(id)a5 forAllIdentifiersUsingBlock:(id)a6
{
  uint64_t v29 = *MEMORY[0x1895F89C0];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  -[MCMCodeSigningMapping queue](self, "queue");
  id v14 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v14);

  -[MCMCodeSigningMapping codeSigningMappingDB](self, "codeSigningMappingDB");
  id v15 = (void *)objc_claimAutoreleasedReturnValue();
  v22[0] = MEMORY[0x1895F87A8];
  v22[1] = 3221225472LL;
  v22[2] = __112__MCMCodeSigningMapping__onQueue_iterateGroupIdsWithKey_fallBackKey_noReferenceKey_forAllIdentifiersUsingBlock___block_invoke;
  v22[3] = &unk_18A29D520;
  v22[4] = self;
  id v23 = v10;
  id v24 = v11;
  id v25 = v12;
  id v26 = v13;
  id v16 = v13;
  id v17 = v12;
  id v18 = v11;
  id v19 = v10;
  [v15 enumerateIdentifiersAndCodeSigningInfoUsingBlock:v22];
  uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue();

  if (v20)
  {
    container_log_handle_for_category();
    id v21 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)__int128 buf = 138412290;
      char v28 = v20;
      _os_log_error_impl( &dword_188846000,  v21,  OS_LOG_TYPE_ERROR,  "Failed to enumerate code signing info: %@",  buf,  0xCu);
    }
  }
}

- (id)groupContainerIdentifiersAssociatedWithIdentifier:(id)a3 containerClass:(unint64_t)a4
{
  id v5 = (void *)objc_claimAutoreleasedReturnValue();
  id v6 = v5;
  if (a4 != 13)
  {
    if (a4 == 7)
    {
      uint64_t v7 = [v5 appGroupIdentifiers];
      goto LABEL_6;
    }

- (id)removeCodeSigningDictionaryForIdentifiers:(id)a3
{
  uint64_t v30 = *MEMORY[0x1895F89C0];
  id v4 = a3;
  [MEMORY[0x189603FE0] set];
  id v5 = (void *)objc_claimAutoreleasedReturnValue();
  __int128 v26 = 0u;
  __int128 v27 = 0u;
  __int128 v28 = 0u;
  __int128 v29 = 0u;
  id v6 = v4;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v26 objects:v25 count:16];
  if (v7)
  {
    uint64_t v9 = v7;
    id v10 = 0LL;
    uint64_t v11 = *(void *)v27;
    *(void *)&__int128 v8 = 138412546LL;
    __int128 v19 = v8;
    do
    {
      uint64_t v12 = 0LL;
      id v13 = v10;
      do
      {
        if (*(void *)v27 != v11) {
          objc_enumerationMutation(v6);
        }
        uint64_t v14 = *(void *)(*((void *)&v26 + 1) + 8 * v12);
        id v20 = v13;
        -[MCMCodeSigningMapping processCodeSigningInfo:identifier:options:error:]( self,  "processCodeSigningInfo:identifier:options:error:",  0LL,  v14,  0LL,  &v20,  v19);
        id v15 = (void *)objc_claimAutoreleasedReturnValue();
        id v10 = v20;

        if (v15)
        {
          [v5 unionSet:v15];
        }

        else
        {
          container_log_handle_for_category();
          id v16 = (os_log_s *)objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)__int128 buf = v19;
            uint64_t v22 = v14;
            __int16 v23 = 2112;
            id v24 = v10;
            _os_log_error_impl( &dword_188846000,  v16,  OS_LOG_TYPE_ERROR,  "Failed to clear entitlements for %@ : %@",  buf,  0x16u);
          }
        }

        ++v12;
        id v13 = v10;
      }

      while (v9 != v12);
      uint64_t v9 = [v6 countByEnumeratingWithState:&v26 objects:v25 count:16];
    }

    while (v9);
  }

  id v17 = (void *)[v5 copy];
  return v17;
}

- (id)codeSigningEntryForIdentifier:(id)a3 withError:(id *)a4
{
  uint64_t v21 = *MEMORY[0x1895F89C0];
  id v6 = a3;
  uint64_t v15 = 0LL;
  id v16 = &v15;
  uint64_t v17 = 0x3032000000LL;
  id v18 = __Block_byref_object_copy__3872;
  __int128 v19 = __Block_byref_object_dispose__3873;
  id v20 = 0LL;
  -[MCMCodeSigningMapping queue](self, "queue");
  uint64_t v7 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = __65__MCMCodeSigningMapping_codeSigningEntryForIdentifier_withError___block_invoke;
  block[3] = &unk_18A29D390;
  void block[4] = self;
  id v12 = v6;
  id v13 = &v15;
  uint64_t v14 = a4;
  id v8 = v6;
  dispatch_sync(v7, block);

  id v9 = (id)v16[5];
  _Block_object_dispose(&v15, 8);

  return v9;
}

- (BOOL)identifierHasCallerRegisteredEntitlements:(id)a3
{
  uint64_t v15 = *MEMORY[0x1895F89C0];
  id v4 = a3;
  uint64_t v11 = 0LL;
  id v12 = &v11;
  uint64_t v13 = 0x2020000000LL;
  char v14 = 0;
  -[MCMCodeSigningMapping queue](self, "queue");
  id v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1895F87A8];
  v8[1] = 3221225472LL;
  v8[2] = __67__MCMCodeSigningMapping_identifierHasCallerRegisteredEntitlements___block_invoke;
  v8[3] = &unk_18A29E328;
  id v9 = v4;
  id v10 = &v11;
  v8[4] = self;
  id v6 = v4;
  dispatch_sync(v5, v8);

  LOBYTE(self) = *((_BYTE *)v12 + 24) != 0;
  _Block_object_dispose(&v11, 8);
  return (char)self;
}

- (BOOL)identifierHasSystemContainer:(id)a3
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue();
  char v4 = [v3 hasSystemContainer];

  return v4;
}

- (unint64_t)dataContainerTypeForIdentifier:(id)a3
{
  uint64_t v16 = *MEMORY[0x1895F89C0];
  id v4 = a3;
  uint64_t v12 = 0LL;
  uint64_t v13 = &v12;
  uint64_t v14 = 0x2020000000LL;
  uint64_t v15 = 0LL;
  -[MCMCodeSigningMapping queue](self, "queue");
  id v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1895F87A8];
  v9[1] = 3221225472LL;
  id v9[2] = __56__MCMCodeSigningMapping_dataContainerTypeForIdentifier___block_invoke;
  v9[3] = &unk_18A29E328;
  id v10 = v4;
  uint64_t v11 = &v12;
  v9[4] = self;
  id v6 = v4;
  dispatch_sync(v5, v9);

  unint64_t v7 = v13[3];
  _Block_object_dispose(&v12, 8);
  return v7;
}

- (id)appGroupIdentifiersForIdentifier:(id)a3
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue();
  [v3 appGroupIdentifiers];
  id v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)systemGroupIdentifiersForIdentifier:(id)a3
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue();
  [v3 systemGroupIdentifiers];
  id v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)processCallerRegisteredEntitlements:(id)a3 identifier:(id)a4 error:(id *)a5
{
  uint64_t v40 = *MEMORY[0x1895F89C0];
  id v8 = a3;
  id v9 = a4;
  if (!v9)
  {
    __int128 v19 = -[MCMError initWithErrorType:](objc_alloc(&OBJC_CLASS___MCMError), "initWithErrorType:", 18LL);
    id v10 = 0LL;
    id v18 = 0LL;
    uint64_t v12 = 0LL;
    if (!a5) {
      goto LABEL_28;
    }
    goto LABEL_26;
  }

  id v35 = 0LL;
  -[MCMCodeSigningMapping codeSigningEntryForIdentifier:withError:]( self,  "codeSigningEntryForIdentifier:withError:",  v9,  &v35);
  id v10 = (void *)objc_claimAutoreleasedReturnValue();
  id v11 = v35;
  uint64_t v12 = v11;
  if (!v10)
  {
    [v11 domain];
    id v20 = (void *)objc_claimAutoreleasedReturnValue();
    if ([v20 isEqualToString:@"MCMErrorDomain"])
    {
      uint64_t v21 = [v12 code];

      if (v21 == 67) {
        goto LABEL_3;
      }
      if (v12) {
        goto LABEL_12;
      }
    }

    else
    {

      if (v12)
      {
LABEL_12:
        [v12 domain];
        uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue();
        int v23 = [v22 isEqual:@"MCMErrorDomain"];

        if (v23)
        {
          id v24 = objc_alloc(&OBJC_CLASS___MCMError);
          uint64_t v25 = [v12 code];
          __int128 v26 = v24;
LABEL_24:
          uint64_t v32 = -[MCMError initWithErrorType:](v26, "initWithErrorType:", v25);
LABEL_25:
          __int128 v19 = (MCMError *)v32;
          id v10 = 0LL;
          id v18 = 0LL;
          if (!a5) {
            goto LABEL_28;
          }
          goto LABEL_26;
        }

        [v12 domain];
        uint64_t v30 = (void *)objc_claimAutoreleasedReturnValue();
        int v31 = [v30 isEqual:@"MCMErrorDomain"];

        __int128 v26 = objc_alloc(&OBJC_CLASS___MCMError);
        if (v31)
        {
          uint64_t v32 = -[MCMError initWithErrorType:category:path:POSIXerrno:]( v26,  "initWithErrorType:category:path:POSIXerrno:",  40,  1,  0,  [v12 code]);
          goto LABEL_25;
        }

- (id)processCodeSigningInfo:(id)a3 identifier:(id)a4 options:(id)a5 error:(id *)a6
{
  uint64_t v41 = *MEMORY[0x1895F89C0];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  uint64_t v35 = 0LL;
  id v36 = &v35;
  uint64_t v37 = 0x3032000000LL;
  id v38 = __Block_byref_object_copy__3872;
  id v39 = __Block_byref_object_dispose__3873;
  id v40 = 0LL;
  uint64_t v29 = 0LL;
  uint64_t v30 = &v29;
  uint64_t v31 = 0x3032000000LL;
  uint64_t v32 = __Block_byref_object_copy__3872;
  BOOL v33 = __Block_byref_object_dispose__3873;
  id v34 = 0LL;
  -[MCMCodeSigningMapping entitlementsForIdentifier:](self, "entitlementsForIdentifier:", v11);
  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[MCMCodeSigningMapping queue](self, "queue");
  uint64_t v14 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  v22[0] = MEMORY[0x1895F87A8];
  v22[1] = 3221225472LL;
  v22[2] = __73__MCMCodeSigningMapping_processCodeSigningInfo_identifier_options_error___block_invoke;
  v22[3] = &unk_18A29D570;
  v22[4] = self;
  id v15 = v10;
  id v23 = v15;
  id v16 = v11;
  id v24 = v16;
  id v17 = v12;
  id v25 = v17;
  id v18 = v13;
  id v26 = v18;
  __int128 v27 = &v35;
  __int128 v28 = &v29;
  dispatch_sync(v14, v22);

  __int128 v19 = v30;
  if (a6 && !v30[5])
  {
    *a6 = (id) v36[5];
    __int128 v19 = v30;
  }

  id v20 = (id)v19[5];

  _Block_object_dispose(&v29, 8);
  _Block_object_dispose(&v35, 8);

  return v20;
}

- (id)getCodeSigningInfoForIdentifier:(id)a3
{
  uint64_t v19 = *MEMORY[0x1895F89C0];
  id v4 = a3;
  uint64_t v13 = 0LL;
  uint64_t v14 = &v13;
  uint64_t v15 = 0x3032000000LL;
  id v16 = __Block_byref_object_copy__3872;
  id v17 = __Block_byref_object_dispose__3873;
  id v18 = 0LL;
  id v5 = -[MCMCodeSigningMapping entitlementsForIdentifier:](self, "entitlementsForIdentifier:", v4);
  -[MCMCodeSigningMapping queue](self, "queue");
  id v6 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1895F87A8];
  v10[1] = 3221225472LL;
  v10[2] = __57__MCMCodeSigningMapping_getCodeSigningInfoForIdentifier___block_invoke;
  v10[3] = &unk_18A29E328;
  id v11 = v4;
  id v12 = &v13;
  v10[4] = self;
  id v7 = v4;
  dispatch_sync(v6, v10);

  id v8 = (id)v14[5];
  _Block_object_dispose(&v13, 8);

  return v8;
}

- (id)entitlementsForIdentifier:(id)a3
{
  uint64_t v48 = *MEMORY[0x1895F89C0];
  id v4 = a3;
  uint64_t v40 = 0LL;
  uint64_t v41 = &v40;
  uint64_t v42 = 0x3032000000LL;
  int v43 = __Block_byref_object_copy__3872;
  __int16 v44 = __Block_byref_object_dispose__3873;
  id v45 = 0LL;
  -[MCMCodeSigningMapping queue](self, "queue");
  id v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  uint64_t v6 = MEMORY[0x1895F87A8];
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = __51__MCMCodeSigningMapping_entitlementsForIdentifier___block_invoke;
  block[3] = &unk_18A29E328;
  id v39 = &v40;
  void block[4] = self;
  id v7 = v4;
  id v38 = v7;
  dispatch_sync(v5, block);

  if (!v41[5])
  {
    id v8 = containermanager_copy_global_configuration();
    BOOL v9 = [v8 dispositionForContainerClass:1] == 1;

    if (v9)
    {
      id v10 = containermanager_copy_global_configuration();
      [v10 staticConfig];
      id v11 = (void *)objc_claimAutoreleasedReturnValue();
      [v11 configForContainerClass:1];
      BOOL v33 = (void *)objc_claimAutoreleasedReturnValue();

      +[MCMUserIdentityCache defaultUserIdentity](&OBJC_CLASS___MCMUserIdentityCache, "defaultUserIdentity");
      id v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[MCMCodeSigningMapping userIdentityCache](self, "userIdentityCache");
      uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue();
      +[MCMContainerIdentity containerIdentityWithUserIdentity:identifier:containerConfig:platform:transient:userIdentityCache:error:]( &OBJC_CLASS___MCMContainerIdentity,  "containerIdentityWithUserIdentity:identifier:containerConfig:platform:transient:userIdentityCache:error:",  v12,  v7,  v33,  0LL,  0LL,  v13,  0LL);
      uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue();

      if (v14)
      {
        [(id)gContainerCache entryForContainerIdentity:v14 error:0];
        uint64_t v32 = (void *)objc_claimAutoreleasedReturnValue();
        [v32 metadataWithError:0];
        uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue();
        id v16 = v15;
        if (v15)
        {
          [v15 info];
          id v17 = (void *)objc_claimAutoreleasedReturnValue();
          [v17 objectForKeyedSubscript:@"com.apple.MobileInstallation.CachedCodeSigningInfo"];
          id v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_opt_class();
          id v19 = v18;
          if ((objc_opt_isKindOfClass() & 1) != 0) {
            id v20 = v19;
          }
          else {
            id v20 = 0LL;
          }

          if (v20)
          {
            uint64_t v21 = (void *)[v20 mutableCopy];
            container_log_handle_for_category();
            uint64_t v22 = (os_log_s *)objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
            {
              [v16 identifier];
              id v23 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)__int128 buf = 138412290;
              __int128 v47 = v23;
              _os_log_impl( &dword_188846000,  v22,  OS_LOG_TYPE_DEFAULT,  "Migrating code signing info from bundle container upon request for %@",  buf,  0xCu);
            }

            [v20 objectForKeyedSubscript:@"Entitlements"];
            id v24 = (void *)objc_claimAutoreleasedReturnValue();
            [v21 setObject:v24 forKeyedSubscript:@"com.apple.MobileContainerManager.Entitlements"];

            id v25 = -[MCMCodeSigningEntry initWithCodeSigningInfo:andDataContainerClass:]( objc_alloc(&OBJC_CLASS___MCMCodeSigningEntry),  "initWithCodeSigningInfo:andDataContainerClass:",  v21,  2LL);
            -[MCMCodeSigningMapping queue](self, "queue");
            id v26 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
            v34[0] = v6;
            v34[1] = 3221225472LL;
            v34[2] = __51__MCMCodeSigningMapping_entitlementsForIdentifier___block_invoke_79;
            v34[3] = &unk_18A29DDB8;
            v34[4] = self;
            __int128 v27 = v25;
            uint64_t v35 = v27;
            id v36 = v16;
            dispatch_sync(v26, v34);

            uint64_t v28 = [v21 objectForKeyedSubscript:@"com.apple.MobileContainerManager.Entitlements"];
            uint64_t v29 = (void *)v41[5];
            v41[5] = v28;
          }
        }
      }
    }
  }

  id v30 = (id)v41[5];

  _Block_object_dispose(&v40, 8);
  return v30;
}

- (unint64_t)invalidateCodeSigningInfoForAppsWithoutDataContainer
{
  uint64_t v74 = *MEMORY[0x1895F89C0];
  id v53 = 0LL;
  -[MCMCodeSigningMapping identifiersWithError:](self, "identifiersWithError:", &v53);
  id v3 = (void *)objc_claimAutoreleasedReturnValue();
  id v35 = v53;
  if (!v3)
  {
    container_log_handle_for_category();
    id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      LODWORD(v64) = 138412290;
      *(void *)((char *)&v64 + 4) = v35;
      _os_log_error_impl( &dword_188846000,  v4,  OS_LOG_TYPE_ERROR,  "Failed to enumerate containers when invalidating code signing info: %@",  (uint8_t *)&v64,  0xCu);
    }
  }

  __int128 v72 = 0u;
  __int128 v73 = 0u;
  __int128 v70 = 0u;
  __int128 v71 = 0u;
  id obj = v3;
  uint64_t v39 = [obj countByEnumeratingWithState:&v70 objects:v69 count:16];
  if (v39)
  {
    uint64_t v37 = *(void *)v71;
    uint64_t v5 = MEMORY[0x1895F87A8];
    do
    {
      for (uint64_t i = 0LL; i != v39; ++i)
      {
        if (*(void *)v71 != v37) {
          objc_enumerationMutation(obj);
        }
        uint64_t v7 = *(void *)(*((void *)&v70 + 1) + 8 * i);
        id v8 = (void *)MEMORY[0x1895CE3A8]();
        *(void *)&__int128 v64 = 0LL;
        *((void *)&v64 + 1) = &v64;
        uint64_t v65 = 0x3032000000LL;
        uint64_t v66 = __Block_byref_object_copy__3872;
        int v67 = __Block_byref_object_dispose__3873;
        id v68 = 0LL;
        uint64_t v47 = 0LL;
        uint64_t v48 = &v47;
        uint64_t v49 = 0x3032000000LL;
        BOOL v50 = __Block_byref_object_copy__3872;
        id v51 = __Block_byref_object_dispose__3873;
        id v52 = 0LL;
        -[MCMCodeSigningMapping queue](self, "queue");
        BOOL v9 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
        block[0] = v5;
        block[1] = 3221225472LL;
        block[2] = __77__MCMCodeSigningMapping_invalidateCodeSigningInfoForAppsWithoutDataContainer__block_invoke;
        block[3] = &unk_18A29DD68;
        void block[4] = self;
        void block[5] = v7;
        block[6] = &v64;
        block[7] = &v47;
        dispatch_sync(v9, block);

        if (v48[5])
        {
          container_log_handle_for_category();
          id v10 = (os_log_s *)objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
          {
            uint64_t v32 = v48[5];
            *(_DWORD *)__int128 buf = 138412546;
            *(void *)&uint8_t buf[4] = v7;
            *(_WORD *)&buf[12] = 2112;
            *(void *)&buf[14] = v32;
            _os_log_error_impl( &dword_188846000,  v10,  OS_LOG_TYPE_ERROR,  "Error fetching code sign info for %@ to check for invalidation: %@",  buf,  0x16u);
          }
        }

        else
        {
          int v11 = [*(id *)(*((void *)&v64 + 1) + 40) isRegisteredByCaller];
          BOOL v12 = 0;
          unint64_t v13 = [*(id *)(*((void *)&v64 + 1) + 40) dataContainerClass] - 3;
          unint64_t v38 = v13;
          if (*(void *)(*((void *)&v64 + 1) + 40LL) && v13 <= 3)
          {
            -[MCMCodeSigningMapping childParentMapCache](self, "childParentMapCache");
            uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue();
            [v14 parentIdentifierForChildIdentifier:v7];
            uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue();

            BOOL v12 = v15 != 0LL;
          }

          container_log_handle_for_category();
          id v16 = (os_log_s *)objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
          {
            uint64_t v17 = *(void *)(*((void *)&v64 + 1) + 40LL);
            *(_DWORD *)__int128 buf = 138413314;
            *(void *)&uint8_t buf[4] = v7;
            *(_WORD *)&buf[12] = 2048;
            *(void *)&buf[14] = v17;
            *(_WORD *)&buf[22] = 1024;
            int v59 = v11;
            __int16 v60 = 1024;
            BOOL v61 = v38 < 4;
            __int16 v62 = 1024;
            BOOL v63 = v12;
            _os_log_impl( &dword_188846000,  v16,  OS_LOG_TYPE_INFO,  "Checking for invalidation: identifier = %@, codeSigningEntry = <%p>, isRegisteredByCaller = %d, isPlugIn = %d, hasParent = %d",  buf,  0x28u);
          }

          if (!(v11 & 1 | (v38 < 4 && v12)))
          {
            uint64_t v18 = 0LL;
            *(void *)__int128 buf = 0LL;
            *(void *)&uint8_t buf[8] = buf;
            *(void *)&buf[16] = 0x2020000000LL;
            char v19 = 1;
            LOBYTE(v59) = 0;
            do
            {
              uint64_t v20 = qword_188918E60[v18];
              id v21 = containermanager_copy_global_configuration();
              [v21 staticConfig];
              uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue();
              [v22 configForContainerClass:v20];
              id v23 = (void *)objc_claimAutoreleasedReturnValue();

              uint64_t v24 = -[MCMCodeSigningMapping userIdentityCache](self, "userIdentityCache");
              v42[0] = v5;
              v42[1] = 3221225472LL;
              v42[2] = __77__MCMCodeSigningMapping_invalidateCodeSigningInfoForAppsWithoutDataContainer__block_invoke_80;
              v42[3] = &unk_18A29D598;
              id v45 = buf;
              v42[4] = v7;
              id v25 = v23;
              id v43 = v25;
              __int16 v44 = self;
              [(id)v24 forEachAccessibleUserIdentitySynchronouslyExecuteBlock:v42];

              LOBYTE(v24) = *(_BYTE *)(*(void *)&buf[8] + 24LL) == 0;
              char v26 = v24 & v19;
              uint64_t v18 = 1LL;
              char v19 = 0;
            }

            while ((v26 & 1) != 0);
            if (!*(_BYTE *)(*(void *)&buf[8] + 24LL))
            {
              container_log_handle_for_category();
              __int128 v27 = (os_log_s *)objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)id v54 = 138412546;
                uint64_t v55 = v7;
                __int16 v56 = 1024;
                BOOL v57 = v38 < 4;
                _os_log_impl( &dword_188846000,  v27,  OS_LOG_TYPE_DEFAULT,  "Invalidating: identifier = %@, isPlugin = %d",  v54,  0x12u);
              }

              uint64_t v28 = (id *)(v48 + 5);
              id v41 = (id)v48[5];
              BOOL v29 = -[MCMCodeSigningMapping invalidateCodeSigningInfoForIdentifierAndItsChildren:withError:]( self,  "invalidateCodeSigningInfoForIdentifierAndItsChildren:withError:",  v7,  &v41);
              objc_storeStrong(v28, v41);
              if (!v29)
              {
                v40[0] = v5;
                v40[1] = 3221225472LL;
                v40[2] = __77__MCMCodeSigningMapping_invalidateCodeSigningInfoForAppsWithoutDataContainer__block_invoke_82;
                v40[3] = &unk_18A29D5C0;
                v40[4] = v7;
                v40[5] = &v47;
                uint64_t v30 = __77__MCMCodeSigningMapping_invalidateCodeSigningInfoForAppsWithoutDataContainer__block_invoke_82((uint64_t)v40);
                uint64_t v31 = (void *)v48[5];
                v48[5] = v30;
              }
            }

            _Block_object_dispose(buf, 8);
          }
        }

        _Block_object_dispose(&v47, 8);

        _Block_object_dispose(&v64, 8);
        objc_autoreleasePoolPop(v8);
      }

      uint64_t v39 = [obj countByEnumeratingWithState:&v70 objects:v69 count:16];
    }

    while (v39);
  }

  if (v35) {
    unint64_t v33 = [v35 code];
  }
  else {
    unint64_t v33 = 1LL;
  }

  return v33;
}

- (id)identifiersWithError:(id *)a3
{
  uint64_t v22 = *MEMORY[0x1895F89C0];
  uint64_t v16 = 0LL;
  uint64_t v17 = &v16;
  uint64_t v18 = 0x3032000000LL;
  char v19 = __Block_byref_object_copy__3872;
  uint64_t v20 = __Block_byref_object_dispose__3873;
  id v21 = 0LL;
  uint64_t v10 = 0LL;
  int v11 = &v10;
  uint64_t v12 = 0x3032000000LL;
  unint64_t v13 = __Block_byref_object_copy__3872;
  uint64_t v14 = __Block_byref_object_dispose__3873;
  id v15 = 0LL;
  -[MCMCodeSigningMapping queue](self, "queue");
  uint64_t v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1895F87A8];
  v9[1] = 3221225472LL;
  id v9[2] = __46__MCMCodeSigningMapping_identifiersWithError___block_invoke;
  v9[3] = &unk_18A29DBB0;
  v9[4] = self;
  void v9[5] = &v10;
  v9[6] = &v16;
  dispatch_sync(v5, v9);

  uint64_t v6 = (void *)v11[5];
  if (a3 && !v6)
  {
    *a3 = (id) v17[5];
    uint64_t v6 = (void *)v11[5];
  }

  id v7 = v6;
  _Block_object_dispose(&v10, 8);

  _Block_object_dispose(&v16, 8);
  return v7;
}

- (id)_onQueue_identifiersWithError:(id *)a3
{
  uint64_t v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  -[MCMCodeSigningMapping codeSigningMappingDB](self, "codeSigningMappingDB");
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
  [v6 identifiersWithError:a3];
  id v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (BOOL)invalidateCodeSigningInfoForIdentifierAndItsChildren:(id)a3 withError:(id *)a4
{
  uint64_t v21 = *MEMORY[0x1895F89C0];
  id v6 = a3;
  uint64_t v15 = 0LL;
  uint64_t v16 = &v15;
  uint64_t v17 = 0x3032000000LL;
  uint64_t v18 = __Block_byref_object_copy__3872;
  char v19 = __Block_byref_object_dispose__3873;
  id v20 = 0LL;
  -[MCMCodeSigningMapping queue](self, "queue");
  id v7 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x1895F87A8];
  v12[1] = 3221225472LL;
  v12[2] = __88__MCMCodeSigningMapping_invalidateCodeSigningInfoForIdentifierAndItsChildren_withError___block_invoke;
  v12[3] = &unk_18A29E328;
  uint64_t v14 = &v15;
  v12[4] = self;
  id v8 = v6;
  id v13 = v8;
  dispatch_sync(v7, v12);

  BOOL v9 = (void *)v16[5];
  if (a4 && v9)
  {
    *a4 = v9;
    BOOL v9 = (void *)v16[5];
  }

  BOOL v10 = v9 == 0LL;

  _Block_object_dispose(&v15, 8);
  return v10;
}

- (BOOL)invalidateCodeSigningInfoForIdentifier:(id)a3 withError:(id *)a4
{
  uint64_t v18 = *MEMORY[0x1895F89C0];
  id v6 = a3;
  uint64_t v14 = 0LL;
  uint64_t v15 = &v14;
  uint64_t v16 = 0x2020000000LL;
  char v17 = 0;
  -[MCMCodeSigningMapping queue](self, "queue");
  id v7 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = __74__MCMCodeSigningMapping_invalidateCodeSigningInfoForIdentifier_withError___block_invoke;
  block[3] = &unk_18A29D390;
  void block[4] = self;
  id v11 = v6;
  uint64_t v12 = &v14;
  id v13 = a4;
  id v8 = v6;
  dispatch_sync(v7, block);

  LOBYTE(a4) = *((_BYTE *)v15 + 24) != 0;
  _Block_object_dispose(&v14, 8);
  return (char)a4;
}

- (id)copyReferenceCountSetForContainerClass:(unint64_t)a3
{
  uint64_t v15 = *MEMORY[0x1895F89C0];
  uint64_t v9 = 0LL;
  BOOL v10 = &v9;
  uint64_t v11 = 0x3032000000LL;
  uint64_t v12 = __Block_byref_object_copy__3872;
  id v13 = __Block_byref_object_dispose__3873;
  id v14 = 0LL;
  -[MCMCodeSigningMapping queue](self, "queue");
  uint64_t v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1895F87A8];
  v8[1] = 3221225472LL;
  v8[2] = __64__MCMCodeSigningMapping_copyReferenceCountSetForContainerClass___block_invoke;
  v8[3] = &unk_18A29DB88;
  v8[4] = self;
  void v8[5] = &v9;
  v8[6] = a3;
  dispatch_sync(v5, v8);

  id v6 = (id)v10[5];
  _Block_object_dispose(&v9, 8);

  return v6;
}

- (id)_onQueue_copyReferenceCountSetForContainerClass:(unint64_t)a3
{
  uint64_t v18 = *MEMORY[0x1895F89C0];
  -[MCMCodeSigningMapping queue](self, "queue");
  uint64_t v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  uint64_t v12 = 0LL;
  id v13 = &v12;
  uint64_t v14 = 0x3032000000LL;
  uint64_t v15 = __Block_byref_object_copy__3872;
  uint64_t v16 = __Block_byref_object_dispose__3873;
  [MEMORY[0x189607838] setWithCapacity:0];
  id v17 = (id)objc_claimAutoreleasedReturnValue();
  if (a3 == 7)
  {
    [MEMORY[0x189604010] setWithArray:&unk_18A2BE8C0];
    id v6 = (void *)objc_claimAutoreleasedReturnValue();
    id v8 = 0LL;
    id v7 = @"com.apple.private.MobileContainerManager.appGroup.noReference";
  }

  else
  {
    if (a3 != 13)
    {
      id v6 = 0LL;
      goto LABEL_7;
    }

    [MEMORY[0x189604010] setWithObject:@"com.apple.security.system-groups"];
    id v6 = (void *)objc_claimAutoreleasedReturnValue();
    id v7 = 0LL;
    id v8 = @"com.apple.security.system-group-containers";
  }

  v11[0] = MEMORY[0x1895F87A8];
  v11[1] = 3221225472LL;
  v11[2] = __73__MCMCodeSigningMapping__onQueue_copyReferenceCountSetForContainerClass___block_invoke;
  v11[3] = &unk_18A29D5E8;
  v11[4] = &v12;
  -[MCMCodeSigningMapping _onQueue_iterateGroupIdsWithKey:fallBackKey:noReferenceKey:forAllIdentifiersUsingBlock:]( self,  "_onQueue_iterateGroupIdsWithKey:fallBackKey:noReferenceKey:forAllIdentifiersUsingBlock:",  v6,  v8,  v7,  v11);
LABEL_7:
  id v9 = (id)v13[5];

  _Block_object_dispose(&v12, 8);
  return v9;
}

- (void)_onQueue_handleChangeFromOldGroupContainerIds:(id)a3 toNewGroupContainerIds:(id)a4 containerClass:(unint64_t)a5 reconcileHandler:(id)a6
{
  uint64_t v35 = *MEMORY[0x1895F89C0];
  uint64_t v10 = (uint64_t)a3;
  unint64_t v11 = (unint64_t)a4;
  uint64_t v12 = (void (**)(id, void *, void *))a6;
  -[MCMCodeSigningMapping queue](self, "queue");
  id v13 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v13);

  uint64_t v14 = (void *)objc_opt_new();
  uint64_t v15 = (void *)objc_opt_new();
  if (!(v10 | v11))
  {
    unint64_t v11 = 0LL;
    uint64_t v10 = 0LL;
LABEL_6:
    if (!v12) {
      goto LABEL_8;
    }
LABEL_7:
    v12[2](v12, v14, v15);
    goto LABEL_8;
  }

  if ([(id)v10 isEqualToSet:v11]) {
    goto LABEL_6;
  }
  if (v11)
  {
    uint64_t v16 = (void *)[(id)v10 mutableCopy];
    id v17 = (void *)[(id)v11 mutableCopy];
    [v16 minusSet:v11];
    uint64_t v18 = [v16 copy];

    [v17 minusSet:v18];
    uint64_t v19 = [v17 copy];

    id v20 = (void *)v19;
    uint64_t v10 = v18;
  }

  else
  {
    id v20 = 0LL;
  }

  [(id)v10 allObjects];
  uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v22 = -[MCMCodeSigningMapping _onQueue_removeReferenceForGroupIdentifiers:containerClass:]( self,  "_onQueue_removeReferenceForGroupIdentifiers:containerClass:",  v21,  a5);

  uint64_t v23 = MEMORY[0x1895F87A8];
  v30[0] = MEMORY[0x1895F87A8];
  v30[1] = 3221225472LL;
  v30[2] = __126__MCMCodeSigningMapping__onQueue_handleChangeFromOldGroupContainerIds_toNewGroupContainerIds_containerClass_reconcileHandler___block_invoke;
  v30[3] = &unk_18A29DC50;
  unint64_t v11 = v20;
  unint64_t v34 = a5;
  id v31 = (id)v11;
  uint64_t v32 = self;
  id v33 = v15;
  uint64_t v24 = (void (**)(void, void))MEMORY[0x1895CE54C](v30);
  if (+[MCMUserIdentity isUserIdentityRequiredForContainerClass:]( &OBJC_CLASS___MCMUserIdentity,  "isUserIdentityRequiredForContainerClass:",  a5))
  {
    -[MCMCodeSigningMapping userIdentityCache](self, "userIdentityCache");
    id v25 = (void *)objc_claimAutoreleasedReturnValue();
    v28[0] = v23;
    v28[1] = 3221225472LL;
    v28[2] = __126__MCMCodeSigningMapping__onQueue_handleChangeFromOldGroupContainerIds_toNewGroupContainerIds_containerClass_reconcileHandler___block_invoke_98;
    v28[3] = &unk_18A29D610;
    BOOL v29 = v24;
    [v25 forEachAccessibleUserIdentitySynchronouslyExecuteBlock:v28];

    char v26 = v29;
  }

  else
  {
    -[MCMCodeSigningMapping userIdentityCache](self, "userIdentityCache");
    char v26 = (void *)objc_claimAutoreleasedReturnValue();
    [v26 globalSystemUserIdentity];
    __int128 v27 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(void, void *))v24)[2](v24, v27);
  }

  uint64_t v14 = (void *)v22;
  if (v12) {
    goto LABEL_7;
  }
LABEL_8:
}

- (id)_onQueue_removeReferenceForGroupIdentifiers:(id)a3 containerClass:(unint64_t)a4
{
  uint64_t v46 = *MEMORY[0x1895F89C0];
  id v26 = a3;
  __int128 v27 = self;
  -[MCMCodeSigningMapping queue](self, "queue");
  uint64_t v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  id v6 = (void *)objc_opt_new();
  v32[0] = MEMORY[0x1895F87A8];
  v32[1] = 3221225472LL;
  v32[2] = __84__MCMCodeSigningMapping__onQueue_removeReferenceForGroupIdentifiers_containerClass___block_invoke;
  v32[3] = &unk_18A29D638;
  unint64_t v34 = a4;
  uint8_t v32[4] = v27;
  id v25 = v6;
  id v33 = v25;
  id v7 = (uint64_t (**)(void, void, void))MEMORY[0x1895CE54C](v32);
  if (v26 && [v26 count])
  {
    -[MCMCodeSigningMapping _onQueue_copyReferenceCountSetForContainerClass:]( v27,  "_onQueue_copyReferenceCountSetForContainerClass:",  a4);
    id v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      if (a4 == 13)
      {
        container_log_handle_for_category();
        id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)__int128 buf = 138412290;
          *(void *)&uint8_t buf[4] = v26;
          _os_log_impl( &dword_188846000,  v9,  OS_LOG_TYPE_DEFAULT,  "Would have removed system group container references for %@",  buf,  0xCu);
        }
      }

      else
      {
        __int128 v44 = 0u;
        __int128 v45 = 0u;
        __int128 v42 = 0u;
        __int128 v43 = 0u;
        id v10 = v26;
        uint64_t v11 = [v10 countByEnumeratingWithState:&v42 objects:v41 count:16];
        if (v11)
        {
          uint64_t v12 = *(void *)v43;
          do
          {
            for (uint64_t i = 0LL; i != v11; ++i)
            {
              if (*(void *)v43 != v12) {
                objc_enumerationMutation(v10);
              }
              uint64_t v14 = *(void *)(*((void *)&v42 + 1) + 8 * i);
              uint64_t v15 = [v8 countForObject:v14];
              if (v15 == 1)
              {
                *(void *)__int128 buf = 0LL;
                *(void *)&uint8_t buf[8] = buf;
                *(void *)&buf[16] = 0x2020000000LL;
                char v40 = 1;
                container_log_handle_for_category();
                uint64_t v16 = (os_log_s *)objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
                {
                  *(_DWORD *)uint64_t v35 = 138543618;
                  uint64_t v36 = v14;
                  __int16 v37 = 2048;
                  uint64_t v38 = 1LL;
                  _os_log_impl( &dword_188846000,  v16,  OS_LOG_TYPE_DEFAULT,  "Reference count for [%{public}@] is %ld, including for delete",  v35,  0x16u);
                }

                if (+[MCMUserIdentity isUserIdentityRequiredForContainerClass:]( &OBJC_CLASS___MCMUserIdentity,  "isUserIdentityRequiredForContainerClass:",  a4))
                {
                  -[MCMCodeSigningMapping userIdentityCache](v27, "userIdentityCache");
                  id v17 = (void *)objc_claimAutoreleasedReturnValue();
                  v29[0] = MEMORY[0x1895F87A8];
                  v29[1] = 3221225472LL;
                  v29[2] = __84__MCMCodeSigningMapping__onQueue_removeReferenceForGroupIdentifiers_containerClass___block_invoke_100;
                  v29[3] = &unk_18A29D660;
                  id v31 = buf;
                  uint64_t v18 = v7;
                  v29[4] = v14;
                  id v30 = v18;
                  [v17 forEachAccessibleUserIdentitySynchronouslyExecuteBlock:v29];
                }

                else if (*(_BYTE *)(*(void *)&buf[8] + 24LL))
                {
                  -[MCMCodeSigningMapping userIdentityCache](v27, "userIdentityCache");
                  id v20 = (void *)objc_claimAutoreleasedReturnValue();
                  [v20 globalSystemUserIdentity];
                  uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue();
                  char v22 = ((uint64_t (**)(void, uint64_t, void *))v7)[2](v7, v14, v21);
                  *(_BYTE *)(*(void *)&buf[8] + 24LL) = v22;
                }

                else
                {
                  *(_BYTE *)(*(void *)&buf[8] + 24LL) = 0;
                }

                if (*(_BYTE *)(*(void *)&buf[8] + 24LL)) {
                  [v8 removeObject:v14];
                }
                _Block_object_dispose(buf, 8);
              }

              else
              {
                container_log_handle_for_category();
                uint64_t v19 = (os_log_s *)objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
                {
                  *(_DWORD *)__int128 buf = 138543618;
                  *(void *)&uint8_t buf[4] = v14;
                  *(_WORD *)&buf[12] = 2048;
                  *(void *)&buf[14] = v15;
                  _os_log_impl( &dword_188846000,  v19,  OS_LOG_TYPE_DEFAULT,  "Reference count for [%{public}@] is %ld",  buf,  0x16u);
                }
              }
            }

            uint64_t v11 = [v10 countByEnumeratingWithState:&v42 objects:v41 count:16];
          }

          while (v11);
        }
      }
    }

    else
    {
      container_log_handle_for_category();
      id v8 = (void *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled((os_log_t)v8, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)__int128 buf = 134217984;
        *(void *)&uint8_t buf[4] = a4;
        _os_log_error_impl( &dword_188846000,  (os_log_t)v8,  OS_LOG_TYPE_ERROR,  "Failed to get reference count information for class: %llu",  buf,  0xCu);
      }
    }
  }

  uint64_t v23 = (void *)[v25 copy];

  return v23;
}

- (BOOL)removeAllAdvanceCopiesWithError:(id *)a3
{
  uint64_t v12 = *MEMORY[0x1895F89C0];
  uint64_t v8 = 0LL;
  id v9 = &v8;
  uint64_t v10 = 0x2020000000LL;
  char v11 = 0;
  -[MCMCodeSigningMapping queue](self, "queue");
  uint64_t v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1895F87A8];
  v7[1] = 3221225472LL;
  v7[2] = __57__MCMCodeSigningMapping_removeAllAdvanceCopiesWithError___block_invoke;
  v7[3] = &unk_18A29DB88;
  v7[4] = self;
  v7[5] = &v8;
  v7[6] = a3;
  dispatch_sync(v5, v7);

  LOBYTE(a3) = *((_BYTE *)v9 + 24);
  _Block_object_dispose(&v8, 8);
  return (char)a3;
}

- (BOOL)_onQueue_removeAllAdvanceCopiesWithError:(id *)a3
{
  uint64_t v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  -[MCMCodeSigningMapping codeSigningMappingDB](self, "codeSigningMappingDB");
  id v6 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a3) = [v6 deleteAllAdvanceCopiesOfCodeSigningEntriesWithError:a3];

  return (char)a3;
}

- (BOOL)removeAllInvalidPluginCodeSigningEntriesWithNumRemoved:(int *)a3 error:(id *)a4
{
  uint64_t v14 = *MEMORY[0x1895F89C0];
  uint64_t v10 = 0LL;
  char v11 = &v10;
  uint64_t v12 = 0x2020000000LL;
  char v13 = 0;
  -[MCMCodeSigningMapping queue](self, "queue");
  id v7 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = __86__MCMCodeSigningMapping_removeAllInvalidPluginCodeSigningEntriesWithNumRemoved_error___block_invoke;
  block[3] = &unk_18A29D688;
  void block[4] = self;
  void block[5] = &v10;
  block[6] = a3;
  block[7] = a4;
  dispatch_sync(v7, block);

  LOBYTE(a4) = *((_BYTE *)v11 + 24);
  _Block_object_dispose(&v10, 8);
  return (char)a4;
}

- (BOOL)_onQueue_removeAllInvalidPluginCodeSigningEntriesWithNumRemoved:(int *)a3 error:(id *)a4
{
  id v7 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v7);

  -[MCMCodeSigningMapping codeSigningMappingDB](self, "codeSigningMappingDB");
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a4) = [v8 deleteAllInvalidPluginCodeSigningEntriesWithNumChanges:a3 error:a4];

  return (char)a4;
}

- (BOOL)enumerateOwnersAndGroupsWithGroupClass:(unint64_t)a3 error:(id *)a4 block:(id)a5
{
  uint64_t v29 = *MEMORY[0x1895F89C0];
  id v8 = a5;
  uint64_t v23 = 0LL;
  uint64_t v24 = &v23;
  uint64_t v25 = 0x3032000000LL;
  id v26 = __Block_byref_object_copy__3872;
  __int128 v27 = __Block_byref_object_dispose__3873;
  id v28 = 0LL;
  uint64_t v19 = 0LL;
  id v20 = &v19;
  uint64_t v21 = 0x2020000000LL;
  char v22 = 0;
  -[MCMCodeSigningMapping queue](self, "queue");
  id v9 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  v14[0] = MEMORY[0x1895F87A8];
  v14[1] = 3221225472LL;
  v14[2] = __76__MCMCodeSigningMapping_enumerateOwnersAndGroupsWithGroupClass_error_block___block_invoke;
  v14[3] = &unk_18A29D6B0;
  uint64_t v16 = &v19;
  id v17 = &v23;
  v14[4] = self;
  unint64_t v18 = a3;
  id v10 = v8;
  id v15 = v10;
  dispatch_sync(v9, v14);

  int v11 = *((unsigned __int8 *)v20 + 24);
  if (a4 && !*((_BYTE *)v20 + 24))
  {
    *a4 = (id) v24[5];
    int v11 = *((unsigned __int8 *)v20 + 24);
  }

  BOOL v12 = v11 != 0;

  _Block_object_dispose(&v19, 8);
  _Block_object_dispose(&v23, 8);

  return v12;
}

- (BOOL)_onqueue_enumerateOwnersAndGroupsWithGroupClass:(unint64_t)a3 error:(id *)a4 block:(id)a5
{
  uint64_t v18 = *MEMORY[0x1895F89C0];
  id v8 = a5;
  -[MCMCodeSigningMapping queue](self, "queue");
  id v9 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v9);

  id v10 = (void *)MEMORY[0x1895CE3A8]();
  -[MCMCodeSigningMapping codeSigningMappingDB](self, "codeSigningMappingDB");
  int v11 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = MEMORY[0x1895F87A8];
  v15[1] = 3221225472LL;
  v15[2] = __85__MCMCodeSigningMapping__onqueue_enumerateOwnersAndGroupsWithGroupClass_error_block___block_invoke;
  v15[3] = &unk_18A29D6D8;
  unint64_t v17 = a3;
  id v12 = v8;
  id v16 = v12;
  [v11 enumerateIdentifiersAndCodeSigningInfoUsingBlock:v15];
  char v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_autoreleasePoolPop(v10);
  if (a4 && v13) {
    *a4 =  -[MCMError initWithNSError:url:defaultErrorType:]( objc_alloc(&OBJC_CLASS___MCMError),  "initWithNSError:url:defaultErrorType:",  v13,  0LL,  66LL);
  }

  return v13 == 0LL;
}

- (BOOL)addGroupIdentifier:(id)a3 forIdentifier:(id)a4 containerClass:(unint64_t)a5 error:(id *)a6 reconcileHandler:(id)a7
{
  uint64_t v31 = *MEMORY[0x1895F89C0];
  id v12 = a3;
  id v13 = a4;
  id v14 = a7;
  uint64_t v27 = 0LL;
  id v28 = &v27;
  uint64_t v29 = 0x2020000000LL;
  char v30 = 0;
  -[MCMCodeSigningMapping queue](self, "queue");
  id v15 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  v20[0] = MEMORY[0x1895F87A8];
  v20[1] = 3221225472LL;
  v20[2] = __96__MCMCodeSigningMapping_addGroupIdentifier_forIdentifier_containerClass_error_reconcileHandler___block_invoke;
  v20[3] = &unk_18A29D700;
  v20[4] = self;
  id v21 = v12;
  uint64_t v24 = &v27;
  unint64_t v25 = a5;
  id v26 = a6;
  id v22 = v13;
  id v23 = v14;
  id v16 = v14;
  id v17 = v13;
  id v18 = v12;
  dispatch_sync(v15, v20);

  LOBYTE(v12) = *((_BYTE *)v28 + 24) != 0;
  _Block_object_dispose(&v27, 8);
  return (char)v12;
}

- (BOOL)removeGroupIdentifier:(id)a3 forIdentifier:(id)a4 containerClass:(unint64_t)a5 error:(id *)a6 reconcileHandler:(id)a7
{
  uint64_t v31 = *MEMORY[0x1895F89C0];
  id v12 = a3;
  id v13 = a4;
  id v14 = a7;
  uint64_t v27 = 0LL;
  id v28 = &v27;
  uint64_t v29 = 0x2020000000LL;
  char v30 = 0;
  -[MCMCodeSigningMapping queue](self, "queue");
  id v15 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  v20[0] = MEMORY[0x1895F87A8];
  v20[1] = 3221225472LL;
  v20[2] = __99__MCMCodeSigningMapping_removeGroupIdentifier_forIdentifier_containerClass_error_reconcileHandler___block_invoke;
  v20[3] = &unk_18A29D700;
  v20[4] = self;
  id v21 = v12;
  uint64_t v24 = &v27;
  unint64_t v25 = a5;
  id v26 = a6;
  id v22 = v13;
  id v23 = v14;
  id v16 = v14;
  id v17 = v13;
  id v18 = v12;
  dispatch_sync(v15, v20);

  LOBYTE(v12) = *((_BYTE *)v28 + 24) != 0;
  _Block_object_dispose(&v27, 8);
  return (char)v12;
}

- (BOOL)_onQueue_addGroupIdentifier:(id)a3 forIdentifier:(id)a4 containerClass:(unint64_t)a5 error:(id *)a6 reconcileHandler:(id)a7
{
  v36[1] = *MEMORY[0x1895F89C0];
  id v11 = a3;
  id v12 = a4;
  id v13 = a7;
  -[MCMCodeSigningMapping queue](self, "queue");
  id v14 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v14);

  if (a5 != 7 && a5 != 13)
  {
    uint64_t v24 = -[MCMError initWithErrorType:category:]( objc_alloc(&OBJC_CLASS___MCMError),  "initWithErrorType:category:",  20LL,  4LL);
LABEL_10:
    BOOL v27 = 0;
    goto LABEL_11;
  }

  -[MCMCodeSigningMapping codeSigningMappingDB](self, "codeSigningMappingDB");
  id v15 = (void *)objc_claimAutoreleasedReturnValue();
  id v32 = 0LL;
  [v15 codeSigningEntryWithIdentifier:v12 error:&v32];
  id v16 = (void *)objc_claimAutoreleasedReturnValue();
  id v29 = v32;

  unint64_t v17 = 0x189603000uLL;
  if (!v16)
  {
    +[MCMEntitlements publicEntitlementForGroupContainerClass:]( &OBJC_CLASS___MCMEntitlements,  "publicEntitlementForGroupContainerClass:",  a5,  v29);
    unint64_t v25 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v35 = v25;
    v36[0] = v11;
    [MEMORY[0x189603F68] dictionaryWithObjects:v36 forKeys:&v35 count:1];
    id v23 = (id)objc_claimAutoreleasedReturnValue();

    id v18 = 0LL;
    id v22 = 0LL;
    goto LABEL_8;
  }

  -[MCMCodeSigningMapping _entitlementsFromCodeSigningEntry:](self, "_entitlementsFromCodeSigningEntry:", v16);
  id v18 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v19 = objc_alloc(&OBJC_CLASS___MCMEntitlements);
  id v20 = containermanager_copy_global_configuration();
  [v20 classIterator];
  id v21 = (void *)objc_claimAutoreleasedReturnValue();
  id v22 = -[MCMEntitlements initWithEntitlements:clientIdentifier:classIterator:]( v19,  "initWithEntitlements:clientIdentifier:classIterator:",  v18,  v12,  v21);

  if (!v22)
  {
    uint64_t v24 = -[MCMError initWithErrorType:category:]( objc_alloc(&OBJC_CLASS___MCMError),  "initWithErrorType:category:",  60LL,  3LL);

    goto LABEL_10;
  }

  id v23 = -[MCMEntitlements copyEntitlementsDictionaryByAddingGroupContainerOfClass:groupIdentifier:]( v22,  "copyEntitlementsDictionaryByAddingGroupContainerOfClass:groupIdentifier:",  a5,  v11,  v29);
  unint64_t v17 = 0x189603000LL;
LABEL_8:
  id v33 = @"com.apple.MobileContainerManager.Entitlements";
  unint64_t v34 = v23;
  [*(id *)(v17 + 3944) dictionaryWithObjects:&v34 forKeys:&v33 count:1];
  id v26 = (void *)objc_claimAutoreleasedReturnValue();
  id v31 = 0LL;
  BOOL v27 = -[MCMCodeSigningMapping _onQueue_processCodeSigningInfo:identifier:options:oldEntitlements:error:reconcileHandler:]( self,  "_onQueue_processCodeSigningInfo:identifier:options:oldEntitlements:error:reconcileHandler:",  v26,  v12,  0LL,  v22,  &v31,  v13);
  uint64_t v24 = (MCMError *)v31;

LABEL_11:
  return v27;
}

- (BOOL)_onQueue_removeGroupIdentifier:(id)a3 forIdentifier:(id)a4 containerClass:(unint64_t)a5 error:(id *)a6 reconcileHandler:(id)a7
{
  v32[1] = *MEMORY[0x1895F89C0];
  id v11 = a3;
  id v12 = a4;
  id v13 = a7;
  -[MCMCodeSigningMapping queue](self, "queue");
  id v14 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v14);

  if (a5 != 7 && a5 != 13)
  {
    id v26 = -[MCMError initWithErrorType:category:]( objc_alloc(&OBJC_CLASS___MCMError),  "initWithErrorType:category:",  20LL,  4LL);
LABEL_9:
    BOOL v25 = 0;
    goto LABEL_10;
  }

  -[MCMCodeSigningMapping codeSigningMappingDB](self, "codeSigningMappingDB");
  id v15 = (void *)objc_claimAutoreleasedReturnValue();
  id v30 = 0LL;
  [v15 codeSigningEntryWithIdentifier:v12 error:&v30];
  id v16 = (void *)objc_claimAutoreleasedReturnValue();
  id v17 = v30;

  if (!v16)
  {
    id v26 = -[MCMError initWithErrorType:category:]( objc_alloc(&OBJC_CLASS___MCMError),  "initWithErrorType:category:",  67LL,  3LL);

    goto LABEL_9;
  }

  id v28 = v17;
  -[MCMCodeSigningMapping _entitlementsFromCodeSigningEntry:](self, "_entitlementsFromCodeSigningEntry:", v16);
  id v18 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v19 = objc_alloc(&OBJC_CLASS___MCMEntitlements);
  id v20 = containermanager_copy_global_configuration();
  [v20 classIterator];
  id v21 = (void *)objc_claimAutoreleasedReturnValue();
  id v22 = -[MCMEntitlements initWithEntitlements:clientIdentifier:classIterator:]( v19,  "initWithEntitlements:clientIdentifier:classIterator:",  v18,  v12,  v21);

  if (!v22)
  {
    id v26 = -[MCMError initWithErrorType:category:]( objc_alloc(&OBJC_CLASS___MCMError),  "initWithErrorType:category:",  60LL,  3LL);

    goto LABEL_9;
  }

  id v23 = -[MCMEntitlements copyEntitlementsDictionaryByRemovingGroupContainerOfClass:groupIdentifier:]( v22,  "copyEntitlementsDictionaryByRemovingGroupContainerOfClass:groupIdentifier:",  a5,  v11);
  id v31 = @"com.apple.MobileContainerManager.Entitlements";
  v32[0] = v23;
  [MEMORY[0x189603F68] dictionaryWithObjects:v32 forKeys:&v31 count:1];
  uint64_t v24 = (void *)objc_claimAutoreleasedReturnValue();
  id v29 = 0LL;
  BOOL v25 = -[MCMCodeSigningMapping _onQueue_processCodeSigningInfo:identifier:options:oldEntitlements:error:reconcileHandler:]( self,  "_onQueue_processCodeSigningInfo:identifier:options:oldEntitlements:error:reconcileHandler:",  v24,  v12,  0LL,  v22,  &v29,  v13);
  id v26 = (MCMError *)v29;

LABEL_10:
  return v25;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (MCMChildParentMapCache)childParentMapCache
{
  return self->_childParentMapCache;
}

- (MCMSQLiteDB)codeSigningMappingDB
{
  return self->_codeSigningMappingDB;
}

- (void)setCodeSigningMappingDB:(id)a3
{
}

- (MCMUserIdentityCache)userIdentityCache
{
  return self->_userIdentityCache;
}

- (MCMManagedPath)library
{
  return self->_library;
}

- (void).cxx_destruct
{
}

uint64_t __99__MCMCodeSigningMapping_removeGroupIdentifier_forIdentifier_containerClass_error_reconcileHandler___block_invoke( uint64_t a1)
{
  uint64_t result = objc_msgSend( *(id *)(a1 + 32),  "_onQueue_removeGroupIdentifier:forIdentifier:containerClass:error:reconcileHandler:",  *(void *)(a1 + 40),  *(void *)(a1 + 48),  *(void *)(a1 + 72),  *(void *)(a1 + 80),  *(void *)(a1 + 56));
  *(_BYTE *)(*(void *)(*(void *)(a1 + 64) + 8LL) + 24LL) = result;
  return result;
}

uint64_t __96__MCMCodeSigningMapping_addGroupIdentifier_forIdentifier_containerClass_error_reconcileHandler___block_invoke( uint64_t a1)
{
  uint64_t result = objc_msgSend( *(id *)(a1 + 32),  "_onQueue_addGroupIdentifier:forIdentifier:containerClass:error:reconcileHandler:",  *(void *)(a1 + 40),  *(void *)(a1 + 48),  *(void *)(a1 + 72),  *(void *)(a1 + 80),  *(void *)(a1 + 56));
  *(_BYTE *)(*(void *)(*(void *)(a1 + 64) + 8LL) + 24LL) = result;
  return result;
}

void __85__MCMCodeSigningMapping__onqueue_enumerateOwnersAndGroupsWithGroupClass_error_block___block_invoke( uint64_t a1,  void *a2,  void *a3)
{
  uint64_t v25 = *MEMORY[0x1895F89C0];
  id v5 = a2;
  id v6 = a3;
  id v7 = objc_alloc(&OBJC_CLASS___MCMEntitlements);
  [v6 codeSigningInfo];
  id v8 = (void *)objc_claimAutoreleasedReturnValue();
  [v8 objectForKeyedSubscript:@"com.apple.MobileContainerManager.Entitlements"];
  id v9 = (void *)objc_claimAutoreleasedReturnValue();
  id v10 = containermanager_copy_global_configuration();
  [v10 classIterator];
  id v11 = (void *)objc_claimAutoreleasedReturnValue();
  id v12 = -[MCMEntitlements initWithEntitlements:clientIdentifier:classIterator:]( v7,  "initWithEntitlements:clientIdentifier:classIterator:",  v9,  v5,  v11);

  uint64_t v13 = *(void *)(a1 + 40);
  if (v13 == 13)
  {
    -[MCMEntitlements systemGroupIdentifiers](v12, "systemGroupIdentifiers");
    id v14 = (void *)objc_claimAutoreleasedReturnValue();
  }

  else if (v13 == 7)
  {
    -[MCMEntitlements appGroupIdentifiers](v12, "appGroupIdentifiers");
    id v14 = (void *)objc_claimAutoreleasedReturnValue();
  }

  else
  {
    id v14 = 0LL;
  }

  __int128 v23 = 0u;
  __int128 v24 = 0u;
  __int128 v21 = 0u;
  __int128 v22 = 0u;
  id v15 = v14;
  uint64_t v16 = [v15 countByEnumeratingWithState:&v21 objects:v20 count:16];
  if (v16)
  {
    uint64_t v17 = v16;
    uint64_t v18 = *(void *)v22;
    do
    {
      uint64_t v19 = 0LL;
      do
      {
        if (*(void *)v22 != v18) {
          objc_enumerationMutation(v15);
        }
        (*(void (**)(void))(*(void *)(a1 + 32) + 16LL))();
        ++v19;
      }

      while (v17 != v19);
      uint64_t v17 = [v15 countByEnumeratingWithState:&v21 objects:v20 count:16];
    }

    while (v17);
  }
}

void __76__MCMCodeSigningMapping_enumerateOwnersAndGroupsWithGroupClass_error_block___block_invoke( uint64_t a1)
{
  obj[1] = *(id *)MEMORY[0x1895F89C0];
  uint64_t v2 = *(void *)(a1 + 64);
  uint64_t v3 = *(void *)(*(void *)(a1 + 56) + 8LL);
  obj[0] = *(id *)(v3 + 40);
  char v4 = objc_msgSend( *(id *)(a1 + 32),  "_onqueue_enumerateOwnersAndGroupsWithGroupClass:error:block:",  v2,  obj,  *(void *)(a1 + 40));
  objc_storeStrong((id *)(v3 + 40), obj[0]);
  *(_BYTE *)(*(void *)(*(void *)(a1 + 48) + 8LL) + 24LL) = v4;
}

uint64_t __86__MCMCodeSigningMapping_removeAllInvalidPluginCodeSigningEntriesWithNumRemoved_error___block_invoke( uint64_t a1)
{
  uint64_t result = objc_msgSend( *(id *)(a1 + 32),  "_onQueue_removeAllInvalidPluginCodeSigningEntriesWithNumRemoved:error:",  *(void *)(a1 + 48),  *(void *)(a1 + 56));
  *(_BYTE *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL) = result;
  return result;
}

uint64_t __57__MCMCodeSigningMapping_removeAllAdvanceCopiesWithError___block_invoke(uint64_t a1)
{
  uint64_t result = objc_msgSend(*(id *)(a1 + 32), "_onQueue_removeAllAdvanceCopiesWithError:", *(void *)(a1 + 48));
  *(_BYTE *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL) = result;
  return result;
}

BOOL __84__MCMCodeSigningMapping__onQueue_removeReferenceForGroupIdentifiers_containerClass___block_invoke( uint64_t a1,  void *a2,  void *a3)
{
  uint64_t v29 = *MEMORY[0x1895F89C0];
  id v5 = a2;
  id v6 = a3;
  if ([v6 homeDirectoryExists])
  {
    id v7 = containermanager_copy_global_configuration();
    [v7 staticConfig];
    id v8 = (void *)objc_claimAutoreleasedReturnValue();
    [v8 configForContainerClass:*(void *)(a1 + 48)];
    id v9 = (void *)objc_claimAutoreleasedReturnValue();

    uint64_t v18 = 1LL;
    [*(id *)(a1 + 32) userIdentityCache];
    id v10 = (void *)objc_claimAutoreleasedReturnValue();
    +[MCMContainerIdentity containerIdentityWithUserIdentity:identifier:containerConfig:platform:userIdentityCache:error:]( &OBJC_CLASS___MCMContainerIdentity,  "containerIdentityWithUserIdentity:identifier:containerConfig:platform:userIdentityCache:error:",  v6,  v5,  v9,  0LL,  v10,  &v18);
    id v11 = (void *)objc_claimAutoreleasedReturnValue();

    BOOL v12 = v11 != 0LL;
    if (v11)
    {
      [*(id *)(a1 + 40) addObject:v11];
    }

    else
    {
      container_log_handle_for_category();
      uint64_t v13 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        uint64_t v15 = v18;
        uint64_t error_description = container_get_error_description();
        uint64_t v17 = *(void *)(a1 + 48);
        *(_DWORD *)__int128 buf = 134219010;
        uint64_t v20 = v15;
        __int16 v21 = 2080;
        uint64_t v22 = error_description;
        __int16 v23 = 2112;
        id v24 = v6;
        __int16 v25 = 2112;
        id v26 = v5;
        __int16 v27 = 2048;
        uint64_t v28 = v17;
        _os_log_error_impl( &dword_188846000,  v13,  OS_LOG_TYPE_ERROR,  "Could not generate identity for ref cnt delete of container; error = (%llu) %s, userIdentity = %@, identifier "
          "= %@, class = %llu",
          buf,
          0x34u);
      }
    }
  }

  else
  {
    BOOL v12 = 0LL;
  }

  return v12;
}

uint64_t __84__MCMCodeSigningMapping__onQueue_removeReferenceForGroupIdentifiers_containerClass___block_invoke_100( uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 48) + 8LL);
  if (*(_BYTE *)(v1 + 24))
  {
    uint64_t result = (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16LL))();
    uint64_t v1 = *(void *)(*(void *)(a1 + 48) + 8LL);
  }

  else
  {
    uint64_t result = 0LL;
  }

  *(_BYTE *)(v1 + 24) = result;
  return result;
}

void __126__MCMCodeSigningMapping__onQueue_handleChangeFromOldGroupContainerIds_toNewGroupContainerIds_containerClass_reconcileHandler___block_invoke( uint64_t a1,  void *a2)
{
  uint64_t v35 = *MEMORY[0x1895F89C0];
  id v3 = a2;
  __int128 v31 = 0u;
  __int128 v32 = 0u;
  __int128 v33 = 0u;
  __int128 v34 = 0u;
  id obj = *(id *)(a1 + 32);
  uint64_t v4 = [obj countByEnumeratingWithState:&v31 objects:v30 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v32;
    do
    {
      uint64_t v7 = 0LL;
      do
      {
        if (*(void *)v32 != v6) {
          objc_enumerationMutation(obj);
        }
        uint64_t v8 = *(void *)(*((void *)&v31 + 1) + 8 * v7);
        id v9 = containermanager_copy_global_configuration();
        [v9 staticConfig];
        id v10 = (void *)objc_claimAutoreleasedReturnValue();
        [v10 configForContainerClass:*(void *)(a1 + 56)];
        id v11 = (void *)objc_claimAutoreleasedReturnValue();

        uint64_t v19 = 1LL;
        [*(id *)(a1 + 40) userIdentityCache];
        BOOL v12 = (void *)objc_claimAutoreleasedReturnValue();
        +[MCMContainerIdentity containerIdentityWithUserIdentity:identifier:containerConfig:platform:userIdentityCache:error:]( &OBJC_CLASS___MCMContainerIdentity,  "containerIdentityWithUserIdentity:identifier:containerConfig:platform:userIdentityCache:error:",  v3,  v8,  v11,  0LL,  v12,  &v19);
        uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue();

        if (v13)
        {
          [*(id *)(a1 + 48) addObject:v13];
        }

        else
        {
          container_log_handle_for_category();
          id v14 = (os_log_s *)objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
          {
            uint64_t v17 = v19;
            uint64_t error_description = container_get_error_description();
            uint64_t v16 = *(void *)(a1 + 56);
            *(_DWORD *)__int128 buf = 134219010;
            uint64_t v21 = v17;
            __int16 v22 = 2080;
            uint64_t v23 = error_description;
            __int16 v24 = 2112;
            id v25 = v3;
            __int16 v26 = 2112;
            uint64_t v27 = v8;
            __int16 v28 = 2048;
            uint64_t v29 = v16;
            _os_log_error_impl( &dword_188846000,  v14,  OS_LOG_TYPE_ERROR,  "Could not generate identity for ref cnt add of container; error = (%llu) %s, userIdentity = %@, identifier"
              " = %@, class = %llu",
              buf,
              0x34u);
          }
        }

        ++v7;
      }

      while (v5 != v7);
      uint64_t v5 = [obj countByEnumeratingWithState:&v31 objects:v30 count:16];
    }

    while (v5);
  }
}

uint64_t __126__MCMCodeSigningMapping__onQueue_handleChangeFromOldGroupContainerIds_toNewGroupContainerIds_containerClass_reconcileHandler___block_invoke_98( uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

void __73__MCMCodeSigningMapping__onQueue_copyReferenceCountSetForContainerClass___block_invoke( uint64_t a1,  void *a2,  void *a3)
{
  uint64_t v16 = *MEMORY[0x1895F89C0];
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    objc_opt_class();
    id v7 = v6;
    if ((objc_opt_isKindOfClass() & 1) != 0) {
      id v8 = v7;
    }
    else {
      id v8 = 0LL;
    }

    if (v8)
    {
      container_log_handle_for_category();
      id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
      {
        int v12 = 138412546;
        id v13 = v5;
        __int16 v14 = 2112;
        id v15 = v7;
        _os_log_debug_impl( &dword_188846000,  v9,  OS_LOG_TYPE_DEBUG,  "Entitlements for identifier %@ references container IDs: %@",  (uint8_t *)&v12,  0x16u);
      }

      id v10 = *(void **)(*(void *)(*(void *)(a1 + 32) + 8LL) + 40LL);
      [v7 allObjects];
      id v11 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      [v10 addObjectsFromArray:v11];
    }

    else
    {
      container_log_handle_for_category();
      id v11 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        int v12 = 138412546;
        id v13 = v5;
        __int16 v14 = 2112;
        id v15 = v7;
        _os_log_error_impl( &dword_188846000,  v11,  OS_LOG_TYPE_ERROR,  "identifier: %@ has non-array type of group container IDs: %@",  (uint8_t *)&v12,  0x16u);
      }
    }
  }
}

void __64__MCMCodeSigningMapping_copyReferenceCountSetForContainerClass___block_invoke(uint64_t a1)
{
  uint64_t v2 = objc_msgSend(*(id *)(a1 + 32), "_onQueue_copyReferenceCountSetForContainerClass:", *(void *)(a1 + 48));
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8LL);
  uint64_t v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

uint64_t __74__MCMCodeSigningMapping_invalidateCodeSigningInfoForIdentifier_withError___block_invoke( uint64_t a1)
{
  uint64_t result = objc_msgSend( *(id *)(a1 + 32),  "_onQueue_invalidateCodeSigningInfoForIdentifier:error:",  *(void *)(a1 + 40),  *(void *)(a1 + 56));
  *(_BYTE *)(*(void *)(*(void *)(a1 + 48) + 8LL) + 24LL) = result;
  return result;
}

void __88__MCMCodeSigningMapping_invalidateCodeSigningInfoForIdentifierAndItsChildren_withError___block_invoke( uint64_t a1)
{
  uint64_t v2 = objc_msgSend(*(id *)(a1 + 32), "_onQueue_invalidateCodeSigningInfoForIdentifierAndItsChildren:", *(void *)(a1 + 40));
  uint64_t v3 = *(void *)(*(void *)(a1 + 48) + 8LL);
  uint64_t v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

void __46__MCMCodeSigningMapping_identifiersWithError___block_invoke(void *a1)
{
  obj[1] = *(id *)MEMORY[0x1895F89C0];
  uint64_t v2 = (void *)a1[4];
  uint64_t v3 = *(void *)(a1[6] + 8LL);
  obj[0] = *(id *)(v3 + 40);
  uint64_t v4 = objc_msgSend(v2, "_onQueue_identifiersWithError:", obj);
  objc_storeStrong((id *)(v3 + 40), obj[0]);
  uint64_t v5 = *(void *)(a1[5] + 8LL);
  id v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v4;
}

void __77__MCMCodeSigningMapping_invalidateCodeSigningInfoForAppsWithoutDataContainer__block_invoke( uint64_t a1)
{
  obj[1] = *(id *)MEMORY[0x1895F89C0];
  [*(id *)(a1 + 32) codeSigningMappingDB];
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v3 = *(void *)(a1 + 40);
  uint64_t v4 = *(void *)(*(void *)(a1 + 56) + 8LL);
  obj[0] = *(id *)(v4 + 40);
  uint64_t v5 = [v2 codeSigningEntryWithIdentifier:v3 error:obj];
  objc_storeStrong((id *)(v4 + 40), obj[0]);
  uint64_t v6 = *(void *)(*(void *)(a1 + 48) + 8LL);
  id v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v5;
}

void __77__MCMCodeSigningMapping_invalidateCodeSigningInfoForAppsWithoutDataContainer__block_invoke_80( void *a1,  void *a2)
{
  if (!*(_BYTE *)(*(void *)(a1[7] + 8LL) + 24LL))
  {
    uint64_t v3 = a1[4];
    uint64_t v4 = a1[5];
    uint64_t v5 = (void *)a1[6];
    id v6 = a2;
    [v5 userIdentityCache];
    id v7 = (void *)objc_claimAutoreleasedReturnValue();
    +[MCMContainerIdentity containerIdentityWithUserIdentity:identifier:containerConfig:platform:transient:userIdentityCache:error:]( &OBJC_CLASS___MCMContainerIdentity,  "containerIdentityWithUserIdentity:identifier:containerConfig:platform:transient:userIdentityCache:error:",  v6,  v3,  v4,  0LL,  0LL,  v7,  0LL);
    id v9 = (id)objc_claimAutoreleasedReturnValue();

    if (v9)
    {
      [(id)gContainerCache entryForContainerIdentity:v9 error:0];
      id v8 = (void *)objc_claimAutoreleasedReturnValue();
      if (v8)
      {
        *(_BYTE *)(*(void *)(a1[7] + 8LL) + 24LL) = 1;
      }
    }
  }

id __77__MCMCodeSigningMapping_invalidateCodeSigningInfoForAppsWithoutDataContainer__block_invoke_82( uint64_t a1)
{
  v20[3] = *MEMORY[0x1895F89C0];
  uint64_t v2 = (void *)[objc_alloc(NSString) initWithFormat:@"Failed to invalidate code signing info for %@ : %@", *(void *)(a1 + 32), *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40)];
  v19[0] = @"FunctionName";
  [NSString stringWithUTF8String:"-[MCMCodeSigningMapping invalidateCodeSigningInfoForAppsWithoutDataContainer]_block_invoke"];
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue();
  v20[0] = v3;
  v20[1] = &unk_18A2BDED0;
  uint64_t v4 = *MEMORY[0x1896075E0];
  v19[1] = @"SourceFileLine";
  v19[2] = v4;
  v20[2] = v2;
  [MEMORY[0x189603F68] dictionaryWithObjects:v20 forKeys:v19 count:3];
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (*(void *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 40LL))
  {
    id v6 = (void *)[v5 mutableCopy];
    [v6 setObject:*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) forKeyedSubscript:*MEMORY[0x189607798]];
    id v7 = (void *)[v6 copy];

    if (*(void *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 40LL))
    {
      container_log_handle_for_category();
      id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        uint64_t v9 = *(void *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 40LL);
        *(_DWORD *)__int128 buf = 138543618;
        uint64_t v16 = v2;
        __int16 v17 = 2114;
        uint64_t v18 = v9;
        id v10 = "%{public}@ (%{public}@)";
        id v11 = v8;
        uint32_t v12 = 22;
LABEL_9:
        _os_log_error_impl(&dword_188846000, v11, OS_LOG_TYPE_ERROR, v10, buf, v12);
        goto LABEL_7;
      }

      goto LABEL_7;
    }
  }

  else
  {
    id v7 = v5;
  }

  container_log_handle_for_category();
  id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)__int128 buf = 138543362;
    uint64_t v16 = v2;
    id v10 = "%{public}@";
    id v11 = v8;
    uint32_t v12 = 12;
    goto LABEL_9;
  }

void __51__MCMCodeSigningMapping_entitlementsForIdentifier___block_invoke(uint64_t a1)
{
  uint64_t v2 = objc_msgSend(*(id *)(a1 + 32), "_onQueue_entitlementsForIdentifier:", *(void *)(a1 + 40));
  uint64_t v3 = *(void *)(*(void *)(a1 + 48) + 8LL);
  uint64_t v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

void __51__MCMCodeSigningMapping_entitlementsForIdentifier___block_invoke_79(uint64_t a1)
{
  uint64_t v14 = *MEMORY[0x1895F89C0];
  [*(id *)(a1 + 32) codeSigningMappingDB];
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v3 = *(void *)(a1 + 40);
  [*(id *)(a1 + 48) identifier];
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue();
  id v9 = 0LL;
  char v5 = [v2 addCodeSigningEntry:v3 withIdentifier:v4 error:&v9];
  id v6 = v9;

  if ((v5 & 1) == 0)
  {
    container_log_handle_for_category();
    id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      [*(id *)(a1 + 48) identifier];
      id v8 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)__int128 buf = 138412546;
      id v11 = v8;
      __int16 v12 = 2112;
      id v13 = v6;
      _os_log_error_impl( &dword_188846000,  v7,  OS_LOG_TYPE_ERROR,  "Failed to write code signing info to DB for %@ : %@",  buf,  0x16u);
    }
  }
}

void __57__MCMCodeSigningMapping_getCodeSigningInfoForIdentifier___block_invoke(uint64_t a1)
{
  uint64_t v2 = objc_msgSend(*(id *)(a1 + 32), "_onQueue_codeSigningInfoForIdentifier:externalRequest:", *(void *)(a1 + 40), 1);
  uint64_t v3 = *(void *)(*(void *)(a1 + 48) + 8LL);
  uint64_t v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

void __73__MCMCodeSigningMapping_processCodeSigningInfo_identifier_options_error___block_invoke(void *a1)
{
  v8[1] = *(id *)MEMORY[0x1895F89C0];
  uint64_t v2 = (void *)a1[4];
  uint64_t v1 = a1[5];
  uint64_t v3 = a1[6];
  uint64_t v4 = a1[7];
  uint64_t v5 = a1[8];
  uint64_t v6 = *(void *)(a1[9] + 8LL);
  v8[0] = *(id *)(v6 + 40);
  v7[0] = MEMORY[0x1895F87A8];
  v7[1] = 3221225472LL;
  v7[2] = __73__MCMCodeSigningMapping_processCodeSigningInfo_identifier_options_error___block_invoke_2;
  v7[3] = &unk_18A29D548;
  v7[4] = a1[10];
  objc_msgSend( v2,  "_onQueue_processCodeSigningInfo:identifier:options:oldEntitlements:error:reconcileHandler:",  v1,  v3,  v4,  v5,  v8,  v7);
  objc_storeStrong((id *)(v6 + 40), v8[0]);
}

void __73__MCMCodeSigningMapping_processCodeSigningInfo_identifier_options_error___block_invoke_2( uint64_t a1,  void *a2)
{
}

uint64_t __56__MCMCodeSigningMapping_dataContainerTypeForIdentifier___block_invoke(uint64_t a1)
{
  uint64_t result = objc_msgSend(*(id *)(a1 + 32), "_onQueue_dataContainerTypeForIdentifier:", *(void *)(a1 + 40));
  *(void *)(*(void *)(*(void *)(a1 + 48) + 8LL) + 24LL) = result;
  return result;
}

uint64_t __67__MCMCodeSigningMapping_identifierHasCallerRegisteredEntitlements___block_invoke(uint64_t a1)
{
  uint64_t result = objc_msgSend(*(id *)(a1 + 32), "_onQueue_identifierHasCallerRegisteredEntitlements:", *(void *)(a1 + 40));
  *(_BYTE *)(*(void *)(*(void *)(a1 + 48) + 8LL) + 24LL) = result;
  return result;
}

void __65__MCMCodeSigningMapping_codeSigningEntryForIdentifier_withError___block_invoke(uint64_t a1)
{
  uint64_t v2 = objc_msgSend( *(id *)(a1 + 32),  "_onQueue_codeSigningEntryForIdentifier:withError:",  *(void *)(a1 + 40),  *(void *)(a1 + 56));
  uint64_t v3 = *(void *)(*(void *)(a1 + 48) + 8LL);
  uint64_t v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

void __112__MCMCodeSigningMapping__onQueue_iterateGroupIdsWithKey_fallBackKey_noReferenceKey_forAllIdentifiersUsingBlock___block_invoke( uint64_t a1,  void *a2,  uint64_t a3)
{
  uint64_t v26 = *MEMORY[0x1895F89C0];
  id v5 = a2;
  [*(id *)(a1 + 32) _entitlementsFromCodeSigningEntry:a3];
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
  [MEMORY[0x189603FE0] set];
  id v7 = (void *)objc_claimAutoreleasedReturnValue();
  __int128 v22 = 0u;
  __int128 v23 = 0u;
  __int128 v24 = 0u;
  __int128 v25 = 0u;
  uint64_t v20 = (void *)a1;
  id v8 = *(id *)(a1 + 40);
  uint64_t v9 = [v8 countByEnumeratingWithState:&v22 objects:v21 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    id v11 = 0LL;
    uint64_t v12 = *(void *)v23;
    do
    {
      uint64_t v13 = 0LL;
      uint64_t v14 = v11;
      do
      {
        if (*(void *)v23 != v12) {
          objc_enumerationMutation(v8);
        }
        id v11 = +[MCMEntitlements copyGroupEntitlementForIdentifier:entitlements:groupKey:]( &OBJC_CLASS___MCMEntitlements,  "copyGroupEntitlementForIdentifier:entitlements:groupKey:",  v5,  v6,  *(void *)(*((void *)&v22 + 1) + 8 * v13));

        [v7 unionSet:v11];
        ++v13;
        uint64_t v14 = v11;
      }

      while (v10 != v13);
      uint64_t v10 = [v8 countByEnumeratingWithState:&v22 objects:v21 count:16];
    }

    while (v10);
  }

  else
  {
    id v11 = 0LL;
  }

  if (v20[6] && ![v7 count])
  {
    id v15 = +[MCMEntitlements copyGroupEntitlementForIdentifier:entitlements:groupKey:]( &OBJC_CLASS___MCMEntitlements,  "copyGroupEntitlementForIdentifier:entitlements:groupKey:",  v5,  v6,  v20[6]);

    uint64_t v16 = [v15 mutableCopy];
    id v11 = v15;
    id v7 = (void *)v16;
  }

  if (v20[7] && [v7 count])
  {
    id v17 = +[MCMEntitlements copyGroupEntitlementForIdentifier:entitlements:groupKey:]( &OBJC_CLASS___MCMEntitlements,  "copyGroupEntitlementForIdentifier:entitlements:groupKey:",  v5,  v6,  v20[7]);

    [v7 minusSet:v17];
    id v11 = v17;
  }

  if (![v7 count])
  {

    id v7 = 0LL;
  }

  uint64_t v18 = v20[8];
  uint64_t v19 = (void *)[v7 copy];
  (*(void (**)(uint64_t, id, void *))(v18 + 16))(v18, v5, v19);
}

void __115__MCMCodeSigningMapping__onQueue_processCodeSigningInfo_identifier_options_oldEntitlements_error_reconcileHandler___block_invoke( uint64_t a1,  uint64_t a2,  void *a3)
{
  id v5 = *(void **)(a1 + 32);
  id v6 = a3;
  [v5 unionSet:a2];
  [*(id *)(a1 + 40) unionSet:v6];
}

void __115__MCMCodeSigningMapping__onQueue_processCodeSigningInfo_identifier_options_oldEntitlements_error_reconcileHandler___block_invoke_2( uint64_t a1,  uint64_t a2,  void *a3)
{
  id v5 = *(void **)(a1 + 32);
  id v6 = a3;
  [v5 unionSet:a2];
  [*(id *)(a1 + 40) unionSet:v6];
}

id __115__MCMCodeSigningMapping__onQueue_processCodeSigningInfo_identifier_options_oldEntitlements_error_reconcileHandler___block_invoke_73( uint64_t a1)
{
  v15[3] = *MEMORY[0x1895F89C0];
  id v2 = objc_alloc(NSString);
  uint64_t v3 = *(void **)(a1 + 32);
  [v3 callStackSymbols];
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue();
  id v5 = (void *)[v2 initWithFormat:@"Got exception: %@ : %@", v3, v4];

  v14[0] = @"FunctionName";
  [NSString stringWithUTF8String:"-[MCMCodeSigningMapping _onQueue_processCodeSigningInfo:identifier:options:oldEntitlements:error:reconcileHandler:]_block_invoke"];
  id v6 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = v6;
  v15[1] = &unk_18A2BDEB8;
  uint64_t v7 = *MEMORY[0x1896075E0];
  v14[1] = @"SourceFileLine";
  v14[2] = v7;
  v15[2] = v5;
  [MEMORY[0x189603F68] dictionaryWithObjects:v15 forKeys:v14 count:3];
  id v8 = (void *)objc_claimAutoreleasedReturnValue();

  container_log_handle_for_category();
  uint64_t v9 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)__int128 buf = 138543362;
    uint64_t v13 = v5;
    _os_log_error_impl(&dword_188846000, v9, OS_LOG_TYPE_ERROR, "%{public}@", buf, 0xCu);
  }

  [MEMORY[0x189607870] errorWithDomain:@"MCMErrorDomain" code:40 userInfo:v8];
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

id __80__MCMCodeSigningMapping__onQueue_setCodeSigningDictionaryValues_forIdentifiers___block_invoke( uint64_t a1)
{
  v11[3] = *MEMORY[0x1895F89C0];
  uint64_t v1 = (void *)objc_msgSend( objc_alloc(NSString),  "initWithFormat:",  @"Can't act on an invalid input: values count: %ld, IDs count: %ld",  objc_msgSend(*(id *)(a1 + 32), "count"),  objc_msgSend(*(id *)(a1 + 40), "count"));
  v10[0] = @"FunctionName";
  [NSString stringWithUTF8String:"-[MCMCodeSigningMapping _onQueue_setCodeSigningDictionaryValues:forIdentifiers:]_block_invoke"];
  id v2 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = v2;
  v11[1] = &unk_18A2BDEA0;
  uint64_t v3 = *MEMORY[0x1896075E0];
  v10[1] = @"SourceFileLine";
  v10[2] = v3;
  v11[2] = v1;
  [MEMORY[0x189603F68] dictionaryWithObjects:v11 forKeys:v10 count:3];
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue();

  container_log_handle_for_category();
  id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)__int128 buf = 138543362;
    uint64_t v9 = v1;
    _os_log_error_impl(&dword_188846000, v5, OS_LOG_TYPE_ERROR, "%{public}@", buf, 0xCu);
  }

  [MEMORY[0x189607870] errorWithDomain:@"MCMErrorDomain" code:60 userInfo:v4];
  id v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

uint64_t __84__MCMCodeSigningMapping_performAllCodeSigningMigrationAndReconciliationWithContext___block_invoke( uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_onQueue_migrateDataFromLegacyEntitlementsFileToCodeSigningFile");
}

void __71__MCMCodeSigningMapping__onQueue_reconcileSystemContainersWithContext___block_invoke(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x1895F89C0];
  [*(id *)(a1 + 32) codeSigningMappingDB];
  id v2 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1895F87A8];
  v7[1] = 3221225472LL;
  v7[2] = __71__MCMCodeSigningMapping__onQueue_reconcileSystemContainersWithContext___block_invoke_2;
  v7[3] = &unk_18A29D4D0;
  uint64_t v3 = *(void **)(a1 + 40);
  v7[4] = *(void *)(a1 + 32);
  id v8 = v3;
  uint64_t v4 = [v2 enumerateIdentifiersAndCodeSigningInfoUsingBlock:v7];
  uint64_t v5 = *(void *)(*(void *)(a1 + 48) + 8LL);
  id v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v4;
}

void __71__MCMCodeSigningMapping__onQueue_reconcileSystemContainersWithContext___block_invoke_2( uint64_t a1,  void *a2,  uint64_t a3)
{
  uint64_t v14 = *MEMORY[0x1895F89C0];
  id v5 = a2;
  [*(id *)(a1 + 32) _entitlementsFromCodeSigningEntry:a3];
  id v6 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v7 = objc_alloc(&OBJC_CLASS___MCMEntitlements);
  id v8 = containermanager_copy_global_configuration();
  [v8 classIterator];
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v10 = -[MCMEntitlements initWithEntitlements:clientIdentifier:classIterator:]( v7,  "initWithEntitlements:clientIdentifier:classIterator:",  v6,  v5,  v9);

  if (-[MCMEntitlements hasSystemContainer](v10, "hasSystemContainer"))
  {
    container_log_handle_for_category();
    id v11 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      int v12 = 138412290;
      id v13 = v5;
      _os_log_error_impl( &dword_188846000,  v11,  OS_LOG_TYPE_ERROR,  "System container exists for identifier %@",  (uint8_t *)&v12,  0xCu);
    }

    [*(id *)(a1 + 40) addObject:v5];
  }
}

void __82__MCMCodeSigningMapping_migrateCachedCodeSigningInfoFromBundleContainersToMapping__block_invoke( uint64_t a1,  void *a2)
{
  uint64_t v59 = *MEMORY[0x1895F89C0];
  id v3 = a2;
  if ([v3 handledByProxy])
  {
    container_query_create();
    [v3 containerClass];
    container_query_set_class();
    container_query_set_include_other_owners();
    container_query_operation_set_flags();
    v46[1] = (id)MEMORY[0x1895F87A8];
    v46[2] = (id)3221225472LL;
    v46[3] = __82__MCMCodeSigningMapping_migrateCachedCodeSigningInfoFromBundleContainersToMapping__block_invoke_2;
    v46[4] = &unk_18A29D480;
    v46[5] = *(id *)(a1 + 32);
    id v47 = v3;
    container_query_iterate_results_sync();
    container_query_free();

    goto LABEL_29;
  }

  [*(id *)(a1 + 32) userIdentityCache];
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 defaultUserIdentity];
  id v5 = (void *)objc_claimAutoreleasedReturnValue();

  +[MCMClientConnection privilegedClientConnectionWithUserIdentity:]( &OBJC_CLASS___MCMClientConnection,  "privilegedClientConnectionWithUserIdentity:",  v5);
  char v40 = (void *)objc_claimAutoreleasedReturnValue();
  id v6 = (void *)gContainerCache;
  [MEMORY[0x189604010] setWithObject:v5];
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue();
  v46[0] = 0LL;
  objc_msgSend( v6,  "entriesForUserIdentities:contentClass:transient:error:",  v7,  objc_msgSend(v3, "containerClass"),  0,  v46);
  id v8 = (void *)objc_claimAutoreleasedReturnValue();
  id v9 = v46[0];

  if (v8)
  {
    id v35 = v9;
    __int16 v37 = v5;
    [*(id *)(a1 + 32) queue];
    uint64_t v10 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1895F87A8];
    block[1] = 3221225472LL;
    block[2] = __82__MCMCodeSigningMapping_migrateCachedCodeSigningInfoFromBundleContainersToMapping__block_invoke_46;
    block[3] = &unk_18A29DDB8;
    void block[4] = *(void *)(a1 + 32);
    uint64_t v36 = v8;
    id v11 = v8;
    id v44 = v11;
    id v38 = v3;
    id v45 = v3;
    dispatch_sync(v10, block);

    __int128 v57 = 0u;
    __int128 v58 = 0u;
    __int128 v55 = 0u;
    __int128 v56 = 0u;
    id obj = v11;
    uint64_t v12 = [obj countByEnumeratingWithState:&v55 objects:v54 count:16];
    if (!v12) {
      goto LABEL_24;
    }
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v56;
    while (1)
    {
      uint64_t v15 = 0LL;
      do
      {
        if (*(void *)v56 != v14) {
          objc_enumerationMutation(obj);
        }
        uint64_t v16 = *(void **)(*((void *)&v55 + 1) + 8 * v15);
        id v42 = 0LL;
        [v16 metadataWithError:&v42];
        id v17 = (void *)objc_claimAutoreleasedReturnValue();
        id v18 = v42;
        if (!v17)
        {
          container_log_handle_for_category();
          __int128 v23 = (os_log_s *)objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)__int128 buf = 136315650;
            uint64_t v49 = "-[MCMCodeSigningMapping migrateCachedCodeSigningInfoFromBundleContainersToMapping]_block_invoke_2";
            __int16 v50 = 2112;
            id v51 = v16;
            __int16 v52 = 2112;
            id v53 = v18;
            _os_log_error_impl( &dword_188846000,  v23,  OS_LOG_TYPE_ERROR,  "%s: Could not fetch metadata for %@; error = %@",
              buf,
              0x20u);
          }

          goto LABEL_21;
        }

        [v17 info];
        uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue();
        [v19 objectForKeyedSubscript:@"com.apple.MobileInstallation.CachedCodeSigningInfo"];
        uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        id v21 = v20;
        if ((objc_opt_isKindOfClass() & 1) != 0) {
          id v22 = v21;
        }
        else {
          id v22 = 0LL;
        }

        if (v22)
        {
          __int128 v23 = objc_alloc_init(&OBJC_CLASS___MCMResultPromise);
          __int128 v24 = objc_alloc(&OBJC_CLASS___MCMCommandSetInfoValue);
          [v17 containerIdentity];
          __int128 v25 = (void *)objc_claimAutoreleasedReturnValue();
          [v40 context];
          uint64_t v26 = (void *)objc_claimAutoreleasedReturnValue();
          uint64_t v27 = -[MCMCommandSetInfoValue initWithKey:value:containerIdentity:context:resultPromise:]( v24,  "initWithKey:value:containerIdentity:context:resultPromise:",  @"com.apple.MobileInstallation.CachedCodeSigningInfo",  0LL,  v25,  v26,  v23);

          -[MCMCommandSetInfoValue execute](v27, "execute");
          -[os_log_s result](v23, "result");
          __int16 v28 = (void *)objc_claimAutoreleasedReturnValue();
          [v28 error];
          uint64_t v29 = (void *)objc_claimAutoreleasedReturnValue();

          if (v29)
          {
            container_log_handle_for_category();
            id v30 = (os_log_s *)objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
            {
              [v17 containerIdentity];
              __int128 v31 = (char *)objc_claimAutoreleasedReturnValue();
              -[os_log_s result](v23, "result");
              uint64_t v39 = (void *)objc_claimAutoreleasedReturnValue();
              [v39 error];
              __int128 v32 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)__int128 buf = 138412546;
              uint64_t v49 = v31;
              __int16 v50 = 2112;
              id v51 = v32;
              _os_log_error_impl( &dword_188846000,  v30,  OS_LOG_TYPE_ERROR,  "Error setting info value for identity %@ : %@",  buf,  0x16u);
            }
          }

LABEL_21:
        }

        ++v15;
      }

      while (v13 != v15);
      uint64_t v13 = [obj countByEnumeratingWithState:&v55 objects:v54 count:16];
      if (!v13)
      {
LABEL_24:

        id v5 = v37;
        id v3 = v38;
        id v9 = v35;
        id v8 = v36;
        goto LABEL_28;
      }
    }
  }

  container_log_handle_for_category();
  __int128 v33 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
  {
    uint64_t v34 = [v3 containerClass];
    *(_DWORD *)__int128 buf = 134218242;
    uint64_t v49 = (const char *)v34;
    __int16 v50 = 2112;
    id v51 = v9;
    _os_log_error_impl( &dword_188846000,  v33,  OS_LOG_TYPE_ERROR,  "Failed to fetch list of containers for class %llu : %@",  buf,  0x16u);
  }

LABEL_28:
LABEL_29:
}

uint64_t __82__MCMCodeSigningMapping_migrateCachedCodeSigningInfoFromBundleContainersToMapping__block_invoke_2( uint64_t a1)
{
  uint64_t v23 = *MEMORY[0x1895F89C0];
  container_object_get_info();
  id v2 = (void *)objc_claimAutoreleasedReturnValue();
  id v3 = v2;
  if (v2)
  {
    uint64_t v4 = xpc_dictionary_get_value(v2, "com.apple.MobileInstallation.CachedCodeSigningInfo");
    if (v4)
    {
      id v5 = (void *)v4;
      [NSString stringWithUTF8String:container_get_identifier()];
      id v6 = (void *)objc_claimAutoreleasedReturnValue();
      uint64_t v7 = (void *)_CFXPCCreateCFObjectFromXPCObject();
      [*(id *)(a1 + 32) queue];
      id v8 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
      v15[0] = MEMORY[0x1895F87A8];
      v15[1] = 3221225472LL;
      v15[2] = __82__MCMCodeSigningMapping_migrateCachedCodeSigningInfoFromBundleContainersToMapping__block_invoke_3;
      v15[3] = &unk_18A29D458;
      void v15[4] = *(void *)(a1 + 32);
      id v16 = v7;
      id v9 = v6;
      id v17 = v9;
      id v18 = *(id *)(a1 + 40);
      id v10 = v7;
      dispatch_sync(v8, v15);

      uint64_t v11 = container_set_info_value();
      if (v11 != 1)
      {
        uint64_t v12 = v11;
        container_log_handle_for_category();
        uint64_t v13 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)__int128 buf = 138412546;
          id v20 = v9;
          __int16 v21 = 2048;
          uint64_t v22 = v12;
          _os_log_error_impl( &dword_188846000,  v13,  OS_LOG_TYPE_ERROR,  "Error setting info value for identity %@ : %llu",  buf,  0x16u);
        }
      }
    }
  }

  return 1LL;
}

uint64_t __82__MCMCodeSigningMapping_migrateCachedCodeSigningInfoFromBundleContainersToMapping__block_invoke_46( uint64_t a1)
{
  return objc_msgSend( *(id *)(a1 + 32),  "_onQueue_migrateCachedCodeSigningInfoFromBundleContainersToMappingWithContainersLegacy:containerClass:",  *(void *)(a1 + 40),  objc_msgSend(*(id *)(a1 + 48), "containerClass"));
}

uint64_t __82__MCMCodeSigningMapping_migrateCachedCodeSigningInfoFromBundleContainersToMapping__block_invoke_3( uint64_t a1)
{
  return objc_msgSend( *(id *)(a1 + 32),  "_onQueue_migrateCachedCodeSigningInfoFromBundleContainerToMappingWithInfo:identifier:containerClass:",  *(void *)(a1 + 40),  *(void *)(a1 + 48),  objc_msgSend(*(id *)(a1 + 56), "containerClass"));
}

void __88__MCMCodeSigningMapping__onQueue_migrateDataFromLegacyEntitlementsFileToCodeSigningFile__block_invoke( uint64_t a1,  void *a2,  void *a3)
{
  v38[1] = *MEMORY[0x1895F89C0];
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(*(void *)(a1 + 64) + 8LL);
  id v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = 0LL;

  id v9 = v5;
  id v10 = v6;
  [*(id *)(a1 + 32) codeSigningMappingDB];
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v12 = *(void *)(*(void *)(a1 + 64) + 8LL);
  id obj = *(id *)(v12 + 40);
  [v11 codeSigningEntryWithIdentifier:v9 error:&obj];
  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_storeStrong((id *)(v12 + 40), obj);

  if (v13 && ([v13 isInvalid] & 1) == 0)
  {
    container_log_handle_for_category();
    uint64_t v19 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)__int128 buf = 138412290;
      id v34 = v9;
      _os_log_impl( &dword_188846000,  v19,  OS_LOG_TYPE_DEFAULT,  "Already have code signing info for %@.  No need to migrate legacy entitlements.",  buf,  0xCu);
    }
  }

  else
  {
    [*(id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40) domain];
    uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue();
    if ([v14 isEqualToString:@"MCMErrorDomain"]
      && [*(id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40) code] == 67)
    {

LABEL_7:
      container_log_handle_for_category();
      id v16 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)__int128 buf = 138412290;
        id v34 = v9;
        _os_log_impl(&dword_188846000, v16, OS_LOG_TYPE_DEFAULT, "Migrating legacy entitlements for %@", buf, 0xCu);
      }

      id v17 = objc_alloc(&OBJC_CLASS___MCMCodeSigningEntry);
      __int16 v37 = @"com.apple.MobileContainerManager.Entitlements";
      v38[0] = v10;
      [MEMORY[0x189603F68] dictionaryWithObjects:v38 forKeys:&v37 count:1];
      id v18 = (void *)objc_claimAutoreleasedReturnValue();
      uint64_t v19 = -[MCMCodeSigningEntry initWithCodeSigningInfo:andDataContainerClass:]( v17,  "initWithCodeSigningInfo:andDataContainerClass:",  v18,  0LL);

      [*(id *)(a1 + 40) objectForKeyedSubscript:v9];
      id v20 = (void *)objc_claimAutoreleasedReturnValue();

      if (v20)
      {
        [*(id *)(a1 + 40) objectForKeyedSubscript:v9];
        __int16 v21 = (void *)objc_claimAutoreleasedReturnValue();
        -[os_log_s setChildBundleIdentifiers:](v19, "setChildBundleIdentifiers:", v21);
      }

      [*(id *)(a1 + 48) objectForKeyedSubscript:v9];
      uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue();

      if (v22) {
        -[os_log_s setPlaceholder:](v19, "setPlaceholder:", 1LL);
      }
      [*(id *)(a1 + 56) objectForKeyedSubscript:v9];
      uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue();
      int v24 = [v23 BOOLValue];

      if (v24) {
        -[os_log_s setRegisteredByCaller:](v19, "setRegisteredByCaller:", 1LL);
      }
      else {
        -[os_log_s setInvalid:](v19, "setInvalid:", 1LL);
      }
      [*(id *)(a1 + 32) codeSigningMappingDB];
      uint64_t v26 = (void *)objc_claimAutoreleasedReturnValue();
      uint64_t v27 = *(void *)(*(void *)(a1 + 64) + 8LL);
      id v31 = *(id *)(v27 + 40);
      char v28 = [v26 addCodeSigningEntry:v19 withIdentifier:v9 error:&v31];
      objc_storeStrong((id *)(v27 + 40), v31);

      if ((v28 & 1) == 0)
      {
        container_log_handle_for_category();
        uint64_t v29 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
        {
          uint64_t v30 = *(void *)(*(void *)(*(void *)(a1 + 64) + 8LL) + 40LL);
          *(_DWORD *)__int128 buf = 138412546;
          id v34 = v9;
          __int16 v35 = 2112;
          uint64_t v36 = v30;
          _os_log_error_impl( &dword_188846000,  v29,  OS_LOG_TYPE_ERROR,  "Failed to write migrated legacy info to DB for %@ : %@",  buf,  0x16u);
        }
      }

      goto LABEL_24;
    }

    char v15 = [v13 isInvalid];

    if ((v15 & 1) != 0) {
      goto LABEL_7;
    }
    container_log_handle_for_category();
    uint64_t v19 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      uint64_t v25 = *(void *)(*(void *)(*(void *)(a1 + 64) + 8LL) + 40LL);
      *(_DWORD *)__int128 buf = 138412546;
      id v34 = v9;
      __int16 v35 = 2112;
      uint64_t v36 = v25;
      _os_log_error_impl( &dword_188846000,  v19,  OS_LOG_TYPE_ERROR,  "Error retrieving entry from DB with identifier %@ : %@",  buf,  0x16u);
    }
  }

uint64_t __67__MCMCodeSigningMapping_migrateAppGroupIdsFromDataContainersToFile__block_invoke(uint64_t a1)
{
  return objc_msgSend( *(id *)(a1 + 32),  "_onQueue_migrateAppGroupIdsFromDataContainersToFileUsingContainers:",  *(void *)(a1 + 40));
}

void __71__MCMCodeSigningMapping__onQueue_migrateFromMappingFileToDBIfNecessary__block_invoke( uint64_t a1,  void *a2,  void *a3)
{
  uint64_t v23 = *MEMORY[0x1895F89C0];
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = (void *)MEMORY[0x1895CE3A8]();
  id v8 = v5;
  id v9 = v6;
  [*(id *)(a1 + 32) codeSigningMappingDB];
  id v10 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v11 = *(void *)(*(void *)(a1 + 40) + 8LL);
  id obj = *(id *)(v11 + 40);
  char v12 = [v10 addCodeSigningEntry:v9 withIdentifier:v8 error:&obj];
  objc_storeStrong((id *)(v11 + 40), obj);

  if ((v12 & 1) != 0)
  {
    uint64_t v13 = a1 + 56;
  }

  else
  {
    container_log_handle_for_category();
    uint64_t v14 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      uint64_t v17 = *(void *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 40LL);
      *(_DWORD *)__int128 buf = 138412546;
      id v20 = v8;
      __int16 v21 = 2112;
      uint64_t v22 = v17;
      _os_log_error_impl( &dword_188846000,  v14,  OS_LOG_TYPE_ERROR,  "Failed to migrate code signing entry for %@ : %@",  buf,  0x16u);
    }

    uint64_t v15 = *(void *)(*(void *)(a1 + 40) + 8LL);
    id v16 = *(void **)(v15 + 40);
    *(void *)(v15 + 40) = 0LL;

    uint64_t v13 = a1 + 48;
  }

  ++*(_WORD *)(*(void *)(*(void *)v13 + 8LL) + 24LL);

  objc_autoreleasePoolPop(v7);
}

uint64_t __95__MCMCodeSigningMapping_initWithUserIdentityCache_queue_mappingDB_childParentMapCache_library___block_invoke( uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_onQueue_migrateFromMappingFileToDBIfNecessary");
}

+ (id)codeSignMappingWithError:(id *)a3
{
  Class v26 = (Class)a1;
  uint64_t v41 = *MEMORY[0x1895F89C0];
  uint64_t v33 = 0LL;
  id v34 = &v33;
  uint64_t v35 = 0x3032000000LL;
  uint64_t v36 = __Block_byref_object_copy__3872;
  __int16 v37 = __Block_byref_object_dispose__3873;
  id v38 = 0LL;
  id v3 = containermanager_copy_global_configuration();
  [v3 managedPathRegistry];
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 containermanagerLibrary];
  id v5 = (void *)objc_claimAutoreleasedReturnValue();

  dispatch_queue_t v6 = dispatch_queue_create("com.apple.MobileContainerManager.EntitlementQueue", 0LL);
  [v5 url];
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue();
  [v7 URLByAppendingPathComponent:@"containers" isDirectory:0];
  id v8 = (void *)objc_claimAutoreleasedReturnValue();
  [v8 URLByAppendingPathExtension:@"sqlite3"];
  id v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v9)
  {
    container_log_handle_for_category();
    uint64_t v13 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT))
    {
      LOWORD(multiuser_flags) = 0;
      _os_log_fault_impl( &dword_188846000,  v13,  OS_LOG_TYPE_FAULT,  "Failed to get global library url.",  (uint8_t *)&multiuser_flags,  2u);
    }

    id v12 = 0LL;
    id v14 = 0LL;
    goto LABEL_14;
  }

  uint32_t multiuser_flags = 0;
  host_t v10 = MEMORY[0x1895CE2D0]();
  if (host_get_multiuser_config_flags(v10, &multiuser_flags) || (multiuser_flags & 0x80000000) == 0)
  {
    id v32 = 0LL;
    -[objc_class _moveDBIfNeededFromURL:queue:error:](v26, "_moveDBIfNeededFromURL:queue:error:", v9, v6, &v32, v26);
    id v12 = (id)objc_claimAutoreleasedReturnValue();
    id v15 = v32;
    uint64_t v11 = v15;
    if (v12) {
      goto LABEL_10;
    }
    if (v15)
    {
      container_log_handle_for_category();
      uint64_t v25 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_FAULT))
      {
        uint32_t multiuser_flags = 138412290;
        id v40 = v11;
        _os_log_fault_impl( &dword_188846000,  v25,  OS_LOG_TYPE_FAULT,  "Failed to move database: error = %@",  (uint8_t *)&multiuser_flags,  0xCu);
      }
    }
  }

  else
  {
    uint64_t v11 = 0LL;
  }

  id v12 = v9;
LABEL_10:

  id v16 = containermanager_copy_global_configuration();
  [v16 libraryRepair];
  uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue();
  id v31 = 0LL;
  v28[0] = MEMORY[0x1895F87A8];
  v28[1] = 3221225472LL;
  v28[2] = __50__MCMCodeSigningMapping_codeSignMappingWithError___block_invoke;
  v28[3] = &unk_18A29D3B8;
  id v18 = v6;
  uint64_t v29 = v18;
  uint64_t v30 = &v33;
  [v17 fixAndRetryIfPermissionsErrorWithURL:v12 error:&v31 duringBlock:v28];
  id v14 = v31;

  if (v34[5])
  {
    uint64_t v19 = objc_alloc(&OBJC_CLASS___MCMChildParentMapCache);
    uint64_t v13 = -[MCMChildParentMapCache initWithDB:queue:](v19, "initWithDB:queue:", v34[5], v18);
    id v20 = objc_alloc(v26);
    +[MCMUserIdentitySharedCache sharedInstance](&OBJC_CLASS___MCMUserIdentitySharedCache, "sharedInstance");
    __int16 v21 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v22 = (void *)[v20 initWithUserIdentityCache:v21 queue:v18 mappingDB:v34[5] childParentMapCache:v13 library:v5];

    goto LABEL_15;
  }

  container_log_handle_for_category();
  uint64_t v13 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT))
  {
    uint32_t multiuser_flags = 138412290;
    id v40 = v14;
    _os_log_fault_impl( &dword_188846000,  v13,  OS_LOG_TYPE_FAULT,  "Failed to initialize database; error = %@",
      (uint8_t *)&multiuser_flags,
      0xCu);
  }

+ (id)_moveDBIfNeededFromURL:(id)a3 queue:(id)a4 error:(id *)a5
{
  uint64_t v69 = *MEMORY[0x1895F89C0];
  id v6 = a3;
  id v48 = a4;
  uint64_t v59 = 0LL;
  __int16 v60 = &v59;
  uint64_t v61 = 0x3032000000LL;
  __int16 v62 = __Block_byref_object_copy__3872;
  BOOL v63 = __Block_byref_object_dispose__3873;
  id v64 = 0LL;
  +[MCMUserIdentitySharedCache sharedInstance](&OBJC_CLASS___MCMUserIdentitySharedCache, "sharedInstance");
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue();
  [v7 defaultUserIdentity];
  id v8 = (void *)objc_claimAutoreleasedReturnValue();
  [v7 managedUserPathRegistryForUserIdentity:v8];
  id v9 = (void *)objc_claimAutoreleasedReturnValue();

  [v9 containermanagerUserLibrary];
  host_t v10 = (void *)objc_claimAutoreleasedReturnValue();
  [v10 url];
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue();
  id v12 = v11;
  if (!v11)
  {
    id v32 = (void *)[objc_alloc(NSString) initWithFormat:&stru_18A29E970];
    *(void *)uint64_t v65 = @"FunctionName";
    [NSString stringWithUTF8String:"+[MCMCodeSigningMapping _moveDBIfNeededFromURL:queue:error:]_block_invoke"];
    uint64_t v33 = (void *)objc_claimAutoreleasedReturnValue();
    *(void *)__int128 buf = v33;
    *(void *)&uint8_t buf[8] = &unk_18A2BDE88;
    uint64_t v34 = *MEMORY[0x1896075E0];
    *(void *)&v65[8] = @"SourceFileLine";
    *(void *)&v65[16] = v34;
    *(void *)&buf[16] = v32;
    [MEMORY[0x189603F68] dictionaryWithObjects:buf forKeys:v65 count:3];
    uint64_t v35 = (void *)objc_claimAutoreleasedReturnValue();

    uint64_t v36 = [MEMORY[0x189607870] errorWithDomain:@"MCMErrorDomain" code:132 userInfo:v35];

    __int16 v37 = (void *)v60[5];
    v60[5] = v36;

    container_log_handle_for_category();
    id v14 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)__int128 buf = 0;
      _os_log_fault_impl(&dword_188846000, v14, OS_LOG_TYPE_FAULT, "Failed to get user library url.", buf, 2u);
    }

    goto LABEL_12;
  }

  [v11 URLByAppendingPathComponent:@"references" isDirectory:0];
  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue();
  [v13 URLByAppendingPathExtension:@"sqlite3"];
  id v14 = (os_log_s *)objc_claimAutoreleasedReturnValue();

  char v58 = 0;
  +[MCMFileManager defaultManager](&OBJC_CLASS___MCMFileManager, "defaultManager");
  id v15 = (void *)objc_claimAutoreleasedReturnValue();
  id v16 = (id *)(v60 + 5);
  id obj = (id)v60[5];
  char v17 = [v15 itemAtURL:v6 exists:&v58 isDirectory:0 error:&obj];
  objc_storeStrong(v16, obj);

  if ((v17 & 1) == 0)
  {
    container_log_handle_for_category();
    id v38 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v38, OS_LOG_TYPE_FAULT))
    {
      uint64_t v44 = v60[5];
      *(_DWORD *)__int128 buf = 138412546;
      *(void *)&uint8_t buf[4] = v6;
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = v44;
      _os_log_fault_impl( &dword_188846000,  v38,  OS_LOG_TYPE_FAULT,  "Failed to check if old database exists at [%@], error = %@",  buf,  0x16u);
    }

LABEL_12:
    __int16 v21 = 0LL;
LABEL_19:

    goto LABEL_20;
  }

  if (!v58)
  {
LABEL_18:
    __int16 v21 = v14;
    goto LABEL_19;
  }

  +[MCMFileManager defaultManager](&OBJC_CLASS___MCMFileManager, "defaultManager");
  id v18 = (void *)objc_claimAutoreleasedReturnValue();
  [v18 removeItemAtURL:v14 error:0];

  -[os_log_s URLByDeletingPathExtension](v14, "URLByDeletingPathExtension");
  uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue();
  [v19 URLByAppendingPathExtension:@"sqlite3-wal"];
  id v47 = (void *)objc_claimAutoreleasedReturnValue();

  +[MCMFileManager defaultManager](&OBJC_CLASS___MCMFileManager, "defaultManager");
  id v20 = (void *)objc_claimAutoreleasedReturnValue();
  [v20 removeItemAtURL:v47 error:0];

  *(void *)__int128 buf = 0LL;
  *(void *)&uint8_t buf[8] = buf;
  *(void *)&buf[16] = 0x2020000000LL;
  char v68 = 0;
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = __60__MCMCodeSigningMapping__moveDBIfNeededFromURL_queue_error___block_invoke;
  block[3] = &unk_18A29D3E0;
  __int128 v55 = buf;
  __int16 v21 = (os_log_s *)v6;
  __int16 v52 = v21;
  uint64_t v22 = v14;
  id v53 = v22;
  dispatch_queue_t v54 = (dispatch_queue_t)v48;
  __int128 v56 = &v59;
  dispatch_sync(v54, block);
  uint64_t v46 = v22;
  if (!*(_BYTE *)(*(void *)&buf[8] + 24LL))
  {
    container_log_handle_for_category();
    char v28 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v28, OS_LOG_TYPE_FAULT)) {
      goto LABEL_16;
    }
    uint64_t v39 = v60[5];
    *(_DWORD *)uint64_t v65 = 138412802;
    *(void *)&v65[4] = v21;
    *(_WORD *)&v65[12] = 2112;
    *(void *)&v65[14] = v22;
    *(_WORD *)&v65[22] = 2112;
    uint64_t v66 = v39;
    id v40 = "Failed to move database from [%@] to [%@], error = %@";
    uint64_t v41 = v28;
    uint32_t v42 = 32;
LABEL_27:
    _os_log_fault_impl(&dword_188846000, v41, OS_LOG_TYPE_FAULT, v40, v65, v42);
    goto LABEL_16;
  }

  id v23 = v6;
  +[MCMFileManager defaultManager](&OBJC_CLASS___MCMFileManager, "defaultManager", v46);
  int v24 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v25 = (id *)(v60 + 5);
  id v50 = (id)v60[5];
  char v26 = [v24 removeItemAtURL:v21 error:&v50];
  objc_storeStrong(v25, v50);
  id v6 = v23;

  if ((v26 & 1) != 0)
  {
    -[os_log_s URLByDeletingPathExtension](v21, "URLByDeletingPathExtension");
    uint64_t v27 = (void *)objc_claimAutoreleasedReturnValue();
    [v27 URLByAppendingPathExtension:@"sqlite3-wal"];
    char v28 = (os_log_s *)objc_claimAutoreleasedReturnValue();

    +[MCMFileManager defaultManager](&OBJC_CLASS___MCMFileManager, "defaultManager");
    uint64_t v29 = (void *)objc_claimAutoreleasedReturnValue();
    [v29 removeItemAtURL:v28 error:0];

    char v30 = 0;
    char v31 = 1;
    goto LABEL_17;
  }

  container_log_handle_for_category();
  char v28 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v28, OS_LOG_TYPE_FAULT))
  {
    uint64_t v45 = v60[5];
    *(_DWORD *)uint64_t v65 = 138412546;
    *(void *)&v65[4] = v21;
    *(_WORD *)&v65[12] = 2112;
    *(void *)&v65[14] = v45;
    id v40 = "Failed to delete database from [%@], error = %@";
    uint64_t v41 = v28;
    uint32_t v42 = 22;
    goto LABEL_27;
  }

void __60__MCMCodeSigningMapping__moveDBIfNeededFromURL_queue_error___block_invoke(void *a1)
{
  obj[1] = *(id *)MEMORY[0x1895F89C0];
  uint64_t v2 = a1[4];
  uint64_t v3 = a1[5];
  uint64_t v4 = a1[6];
  uint64_t v5 = *(void *)(a1[8] + 8LL);
  obj[0] = *(id *)(v5 + 40);
  BOOL v6 = +[MCMSQLiteDB moveDBWithURL:toURL:queue:error:]( &OBJC_CLASS___MCMSQLiteDB,  "moveDBWithURL:toURL:queue:error:",  v2,  v3,  v4,  obj);
  objc_storeStrong((id *)(v5 + 40), obj[0]);
  *(_BYTE *)(*(void *)(a1[7] + 8LL) + 24LL) = v6;
}

BOOL __50__MCMCodeSigningMapping_codeSignMappingWithError___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v16 = *MEMORY[0x1895F89C0];
  id v5 = a2;
  BOOL v6 = *(dispatch_queue_s **)(a1 + 32);
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = __50__MCMCodeSigningMapping_codeSignMappingWithError___block_invoke_2;
  block[3] = &unk_18A29D390;
  id v13 = v5;
  __int128 v11 = *(_OWORD *)(a1 + 32);
  id v7 = (id)v11;
  __int128 v14 = v11;
  uint64_t v15 = a3;
  id v8 = v5;
  dispatch_sync(v6, block);
  BOOL v9 = *(void *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 40LL) != 0LL;

  return v9;
}

void __50__MCMCodeSigningMapping_codeSignMappingWithError___block_invoke_2(void *a1)
{
  uint64_t v2 = -[MCMSQLiteDB initWithURL:queue:error:]( objc_alloc(&OBJC_CLASS___MCMSQLiteDB),  "initWithURL:queue:error:",  a1[4],  a1[5],  a1[7]);
  uint64_t v3 = *(void *)(a1[6] + 8LL);
  uint64_t v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

@end