@interface PFCloudKitImporter
- (PFCloudKitImporter)initWithOptions:(id)a3 request:(id)a4;
- (void)dealloc;
- (void)importIfNecessaryWithCompletion:(uint64_t)a1;
- (void)processWorkItemsWithCompletion:(uint64_t)a1;
@end

@implementation PFCloudKitImporter

- (PFCloudKitImporter)initWithOptions:(id)a3 request:(id)a4
{
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___PFCloudKitImporter;
  v6 = -[PFCloudKitImporter init](&v8, sel_init);
  if (v6)
  {
    v6->_options = (PFCloudKitImporterOptions *)[a3 copy];
    v6->_request = (NSCloudKitMirroringImportRequest *)a4;
    v6->_workItemResults = (NSMutableArray *)objc_alloc_init(MEMORY[0x189603FA8]);
    v6->_totalImportedBytes = 0LL;
  }

  return v6;
}

- (void)dealloc
{
  self->_options = 0LL;
  self->_request = 0LL;

  self->_workItems = 0LL;
  self->_workItemResults = 0LL;

  self->_updatedDatabaseChangeToken = 0LL;
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___PFCloudKitImporter;
  -[PFCloudKitImporter dealloc](&v3, sel_dealloc);
}

- (void)importIfNecessaryWithCompletion:(uint64_t)a1
{
  if (a1)
  {
    uint64_t v2 = *(void *)(a1 + 8);
    if (v2) {
      uint64_t v2 = *(void *)(v2 + 16);
    }
    v3[0] = MEMORY[0x1895F87A8];
    v3[1] = 3221225472LL;
    v3[2] = __54__PFCloudKitImporter_importIfNecessaryWithCompletion___block_invoke;
    v3[3] = &unk_189EA95D8;
    v3[4] = v2;
    v3[5] = a1;
    v3[6] = a2;
    -[PFCloudKitStoreMonitor performBlock:](v2, (uint64_t)v3);
  }

void __54__PFCloudKitImporter_importIfNecessaryWithCompletion___block_invoke(uint64_t *a1)
{
  uint64_t v99 = *MEMORY[0x1895F89C0];
  uint64_t v2 = (void *)-[PFCloudKitStoreMonitor retainedMonitoredStore](a1[4]);
  v54 = a1;
  if (v2)
  {
    uint64_t v3 = a1[5];
    uint64_t v4 = *(void *)(v3 + 16);
    if (v4)
    {
      if (([*(id *)(v4 + 64) shouldDefer] & 1) != 0 || *(_BYTE *)(v4 + 40))
      {
        v5 = (void *)MEMORY[0x189607870];
        uint64_t v94 = *MEMORY[0x1896075F0];
        v95 = @"The request was aborted because it was deferred by the system.";
        uint64_t v6 = [MEMORY[0x189603F68] dictionaryWithObjects:&v95 forKeys:&v94 count:1];
        uint64_t v7 = [v5 errorWithDomain:*MEMORY[0x189607460] code:134419 userInfo:v6];
        objc_super v8 = objc_alloc(&OBJC_CLASS___NSCloudKitMirroringResult);
        uint64_t v9 = a1[4];
        if (v9) {
          uint64_t v10 = *(void *)(v9 + 48);
        }
        else {
          uint64_t v10 = 0LL;
        }
        v11 = -[NSCloudKitMirroringResult initWithRequest:storeIdentifier:success:madeChanges:error:]( v8,  "initWithRequest:storeIdentifier:success:madeChanges:error:",  *(void *)(a1[5] + 16),  v10,  0LL,  0LL,  v7);
        (*(void (**)(void))(a1[6] + 16))();

        goto LABEL_26;
      }

      uint64_t v3 = a1[5];
    }

    v49 = v2;
    uint64_t v19 = *(void *)(v3 + 8);
    if (v19) {
      v20 = *(void **)(v19 + 8);
    }
    else {
      v20 = 0LL;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v21 = -[PFCloudKitImporterFetchRecordsWorkItem initWithOptions:request:]( objc_alloc(&OBJC_CLASS___PFCloudKitImporterFetchRecordsWorkItem),  "initWithOptions:request:",  *(void *)(a1[5] + 8),  *(void *)(a1[5] + 16));
      *(void *)(a1[5] + 24) = objc_msgSend(objc_alloc(MEMORY[0x189603F18]), "initWithObjects:", v21, 0);
      -[PFCloudKitImporter processWorkItemsWithCompletion:](a1[5], a1[6]);
    }

    else if ([v20 databaseScope] == 2 || objc_msgSend(v20, "databaseScope") == 3)
    {
      uint64_t v88 = 0LL;
      v89 = &v88;
      uint64_t v90 = 0x2020000000LL;
      char v91 = 1;
      uint64_t v82 = 0LL;
      v83 = &v82;
      uint64_t v84 = 0x3052000000LL;
      v85 = __Block_byref_object_copy__23;
      v86 = __Block_byref_object_dispose__23;
      uint64_t v87 = 0LL;
      uint64_t v76 = 0LL;
      v77 = &v76;
      uint64_t v78 = 0x3052000000LL;
      v79 = __Block_byref_object_copy__23;
      v80 = __Block_byref_object_dispose__23;
      uint64_t v81 = 0LL;
      v22 = -[PFCloudKitStoreMonitor newBackgroundContextForMonitoredCoordinator](a1[4]);
      uint64_t v23 = MEMORY[0x1895F87A8];
      v75[0] = MEMORY[0x1895F87A8];
      v75[1] = 3221225472LL;
      v75[2] = __54__PFCloudKitImporter_importIfNecessaryWithCompletion___block_invoke_6;
      v75[3] = &unk_189EA76C0;
      v75[4] = a1[5];
      v75[5] = v2;
      v75[7] = &v76;
      v75[6] = v22;
      v75[8] = &v82;
      v75[9] = &v88;
      -[NSManagedObjectContext performBlockAndWait:](v22, "performBlockAndWait:", v75);
      if (*((_BYTE *)v89 + 24))
      {
        v24 = objc_alloc_init(&OBJC_CLASS___PFCloudKitImportDatabaseContext);
        id v25 = objc_alloc_init((Class)getCloudKitCKFetchDatabaseChangesOperationClass[0]());
        [v25 setPreviousServerChangeToken:v77[5]];
        -[NSCloudKitMirroringRequestOptions applyToOperation:]([*(id *)(a1[5] + 16) options], v25);
        v74[0] = v23;
        v74[1] = 3221225472LL;
        v74[2] = __54__PFCloudKitImporter_importIfNecessaryWithCompletion___block_invoke_2;
        v74[3] = &unk_189EA9B00;
        v74[4] = v24;
        [v25 setRecordZoneWithIDChangedBlock:v74];
        v73[0] = v23;
        v73[1] = 3221225472LL;
        v73[2] = __54__PFCloudKitImporter_importIfNecessaryWithCompletion___block_invoke_3;
        v73[3] = &unk_189EA9B00;
        v73[4] = v24;
        [v25 setRecordZoneWithIDWasDeletedBlock:v73];
        v72[0] = v23;
        v72[1] = 3221225472LL;
        v72[2] = __54__PFCloudKitImporter_importIfNecessaryWithCompletion___block_invoke_4;
        v72[3] = &unk_189EA9B00;
        v72[4] = v24;
        [v25 setRecordZoneWithIDWasPurgedBlock:v72];
        v71[0] = v23;
        v71[1] = 3221225472LL;
        v71[2] = __54__PFCloudKitImporter_importIfNecessaryWithCompletion___block_invoke_5;
        v71[3] = &unk_189EA9B28;
        v71[4] = v24;
        [v25 setChangeTokenUpdatedBlock:v71];
        v70[0] = v23;
        v70[1] = 3221225472LL;
        v70[2] = __54__PFCloudKitImporter_importIfNecessaryWithCompletion___block_invoke_6;
        v70[3] = &unk_189EA9B00;
        v70[4] = v24;
        [v25 setRecordZoneWithIDWasDeletedDueToUserEncryptedDataResetBlock:v70];
        objc_initWeak(&location, (id)a1[5]);
        v67[0] = v23;
        v67[1] = 3221225472LL;
        v67[2] = __54__PFCloudKitImporter_importIfNecessaryWithCompletion___block_invoke_7;
        v67[3] = &unk_189EA9B50;
        objc_copyWeak(&v68, &location);
        uint64_t v26 = a1[6];
        v67[4] = v24;
        v67[5] = v26;
        [v25 setFetchDatabaseChangesCompletionBlock:v67];
        [v20 addOperation:v25];

        objc_destroyWeak(&v68);
        objc_destroyWeak(&location);
      }

      else
      {
        v27 = objc_alloc(&OBJC_CLASS___NSCloudKitMirroringResult);
        uint64_t v28 = a1[4];
        if (v28) {
          uint64_t v29 = *(void *)(v28 + 48);
        }
        else {
          uint64_t v29 = 0LL;
        }
        v30 = -[NSCloudKitMirroringResult initWithRequest:storeIdentifier:success:madeChanges:error:]( v27,  "initWithRequest:storeIdentifier:success:madeChanges:error:",  *(void *)(a1[5] + 16),  v29,  0LL,  0LL,  v83[5]);
        (*(void (**)(void))(a1[6] + 16))();
      }

      v83[5] = 0LL;
      v77[5] = 0LL;
      _Block_object_dispose(&v76, 8);
      _Block_object_dispose(&v82, 8);
      _Block_object_dispose(&v88, 8);
    }

    else
    {
      if ([v20 databaseScope] != 1) {
        goto LABEL_26;
      }
      uint64_t v31 = a1[4];
      if (v31) {
        id WeakRetained = objc_loadWeakRetained((id *)(v31 + 32));
      }
      else {
        id WeakRetained = 0LL;
      }
      uint64_t v33 = [v2 configurationName];
      if (v33) {
        v34 = (const __CFString *)v33;
      }
      else {
        v34 = @"PF_DEFAULT_CONFIGURATION_NAME";
      }
      id v35 = objc_alloc_init(MEMORY[0x189603FE0]);
      id v53 = objc_alloc_init(MEMORY[0x189603FA8]);
      v48 = WeakRetained;
      __int128 v63 = 0u;
      __int128 v64 = 0u;
      __int128 v65 = 0u;
      __int128 v66 = 0u;
      obuint64_t j = (id)objc_msgSend((id)objc_msgSend(WeakRetained, "managedObjectModel"), "entitiesForConfiguration:", v34);
      uint64_t v52 = [obj countByEnumeratingWithState:&v63 objects:v98 count:16];
      if (v52)
      {
        char v36 = 0;
        uint64_t v51 = *(void *)v64;
        do
        {
          for (uint64_t i = 0LL; i != v52; ++i)
          {
            if (*(void *)v64 != v51) {
              objc_enumerationMutation(obj);
            }
            v38 = *(void **)(*((void *)&v63 + 1) + 8 * i);
            objc_msgSend( v35,  "addObject:",  +[PFCloudKitSerializer recordTypeForEntity:]((uint64_t)PFCloudKitSerializer, (uint64_t)v38));
            if ((v36 & 1) != 0)
            {
              char v36 = 1;
            }

            else
            {
              __int128 v61 = 0u;
              __int128 v62 = 0u;
              __int128 v59 = 0u;
              __int128 v60 = 0u;
              v39 = (void *)[v38 relationshipsByName];
              char v36 = 0;
              uint64_t v40 = [v39 countByEnumeratingWithState:&v59 objects:v97 count:16];
              if (v40)
              {
                uint64_t v41 = *(void *)v60;
                do
                {
                  for (uint64_t j = 0LL; j != v40; ++j)
                  {
                    if (*(void *)v60 != v41) {
                      objc_enumerationMutation(v39);
                    }
                    v43 = (void *)objc_msgSend( (id)objc_msgSend(v38, "relationshipsByName"),  "objectForKey:",  *(void *)(*((void *)&v59 + 1) + 8 * j));
                    if ([v43 isToMany]
                      && objc_msgSend((id)objc_msgSend(v43, "inverseRelationship"), "isToMany"))
                    {
                      [v35 addObject:@"CDMR"];
                      char v36 = 1;
                    }
                  }

                  uint64_t v40 = [v39 countByEnumeratingWithState:&v59 objects:v97 count:16];
                }

                while (v40);
              }
            }
          }

          uint64_t v52 = [obj countByEnumeratingWithState:&v63 objects:v98 count:16];
        }

        while (v52);
      }

      __int128 v57 = 0u;
      __int128 v58 = 0u;
      __int128 v55 = 0u;
      __int128 v56 = 0u;
      uint64_t v44 = [v35 countByEnumeratingWithState:&v55 objects:v96 count:16];
      if (v44)
      {
        uint64_t v45 = *(void *)v56;
        do
        {
          for (uint64_t k = 0LL; k != v44; ++k)
          {
            if (*(void *)v56 != v45) {
              objc_enumerationMutation(v35);
            }
            id v47 = -[PFCloudKitCKQueryBackedImportWorkItem initForRecordType:withOptions:request:]( objc_alloc(&OBJC_CLASS___PFCloudKitCKQueryBackedImportWorkItem),  "initForRecordType:withOptions:request:",  *(void *)(*((void *)&v55 + 1) + 8 * k),  *(void *)(v54[5] + 8),  *(void *)(v54[5] + 16));
            [v53 addObject:v47];
          }

          uint64_t v44 = [v35 countByEnumeratingWithState:&v55 objects:v96 count:16];
        }

        while (v44);
      }

      *(void *)(v54[5] + 24) = [v53 copy];
      -[PFCloudKitImporter processWorkItemsWithCompletion:](v54[5], v54[6]);
    }

    uint64_t v2 = v49;
  }

  else if (a1[6])
  {
    v12 = (void *)MEMORY[0x189607870];
    uint64_t v92 = *MEMORY[0x1896075F0];
    uint64_t v93 = [NSString stringWithFormat:@"Request '%@' was cancelled because the store was removed from the coordinator.", objc_msgSend(*(id *)(a1[5] + 16), "requestIdentifier")];
    uint64_t v13 = [MEMORY[0x189603F68] dictionaryWithObjects:&v93 forKeys:&v92 count:1];
    uint64_t v14 = [v12 errorWithDomain:*MEMORY[0x189607460] code:134407 userInfo:v13];
    v15 = objc_alloc(&OBJC_CLASS___NSCloudKitMirroringResult);
    uint64_t v16 = a1[4];
    if (v16) {
      uint64_t v17 = *(void *)(v16 + 48);
    }
    else {
      uint64_t v17 = 0LL;
    }
    v18 = -[NSCloudKitMirroringResult initWithRequest:storeIdentifier:success:madeChanges:error:]( v15,  "initWithRequest:storeIdentifier:success:madeChanges:error:",  *(void *)(a1[5] + 16),  v17,  0LL,  0LL,  v14);
    (*(void (**)(void))(a1[6] + 16))();
  }

- (void)processWorkItemsWithCompletion:(uint64_t)a1
{
  if (a1)
  {
    uint64_t v4 = (void *)MEMORY[0x186E3E5D8]();
    else {
      uint64_t v5 = __ckLoggingOverride;
    }
    uint64_t v6 = [@"CoreData+CloudKit: %s(%d): " stringByAppendingString:@"%@: Processing work items: %@"];
    _NSCoreDataLog(v5, v6, v7, v8, v9, v10, v11, v12, (uint64_t)"-[PFCloudKitImporter processWorkItemsWithCompletion:]");
    objc_autoreleasePoolPop(v4);
    uint64_t v13 = *(void **)(a1 + 8);
    if (v13) {
      uint64_t v13 = (void *)v13[2];
    }
    uint64_t v14 = v13;
    if ([*(id *)(a1 + 24) count]
      && (id v15 = (id)[*(id *)(a1 + 24) objectAtIndex:0],
          uint64_t v16 = (void *)[*(id *)(a1 + 24) mutableCopy],
          [v16 removeObjectAtIndex:0],
          *(id *)(a1 + 24),
          *(void *)(a1 + 24) = [v16 copy],
          v16,
          v15))
    {
      v21[0] = MEMORY[0x1895F87A8];
      v21[1] = 3221225472LL;
      v21[2] = __53__PFCloudKitImporter_processWorkItemsWithCompletion___block_invoke;
      v21[3] = &unk_189EA97A8;
      v21[4] = v14;
      v21[5] = a1;
      v21[6] = v15;
      uint64_t v17 = v21;
      v18 = &v22;
    }

    else
    {
      id v15 = 0LL;
      v19[0] = MEMORY[0x1895F87A8];
      v19[1] = 3221225472LL;
      v19[2] = __53__PFCloudKitImporter_processWorkItemsWithCompletion___block_invoke_4;
      v19[3] = &unk_189EA95D8;
      v19[4] = v14;
      v19[5] = a1;
      uint64_t v17 = v19;
      v18 = &v20;
    }

    uint64_t *v18 = a2;
    -[PFCloudKitStoreMonitor performBlock:]((uint64_t)v14, (uint64_t)v17);
  }

id __54__PFCloudKitImporter_importIfNecessaryWithCompletion___block_invoke_6(uint64_t a1)
{
  uint64_t v2 = *(void *)(*(void *)(a1 + 32) + 8LL);
  if (v2) {
    uint64_t v3 = *(void **)(v2 + 8);
  }
  else {
    uint64_t v3 = 0LL;
  }
  id result = (id)-[NSManagedObject currentChangeToken]( +[NSCKDatabaseMetadata databaseMetadataForScope:forStore:inContext:error:]( (uint64_t)NSCKDatabaseMetadata,  [v3 databaseScope],  *(void *)(a1 + 40),  *(void **)(a1 + 48),  *(void *)(*(void *)(a1 + 64) + 8) + 40),  "currentChangeToken");
  *(void *)(*(void *)(*(void *)(a1 + 56) + 8LL) + 40LL) = result;
  if (*(void *)(*(void *)(*(void *)(a1 + 64) + 8LL) + 40LL))
  {
    uint64_t v5 = (void *)MEMORY[0x186E3E5D8]();
    uint64_t v6 = __ckLoggingOverride;
    uint64_t v7 = [@"CoreData+CloudKit: %s(%d): " stringByAppendingString:@"Failed to fetch metadata for database: %@"];
    _NSCoreDataLog( v6 != 0,  v7,  v8,  v9,  v10,  v11,  v12,  v13,  (uint64_t)"-[PFCloudKitImporter importIfNecessaryWithCompletion:]_block_invoke");
    objc_autoreleasePoolPop(v5);
    id result = *(id *)(*(void *)(*(void *)(a1 + 64) + 8LL) + 40LL);
    *(_BYTE *)(*(void *)(*(void *)(a1 + 72) + 8LL) + 24LL) = 0;
  }

  return result;
}

uint64_t __54__PFCloudKitImporter_importIfNecessaryWithCompletion___block_invoke_2( uint64_t result,  uint64_t a2)
{
  uint64_t v2 = *(void *)(result + 32);
  if (v2) {
    return [*(id *)(v2 + 8) addObject:a2];
  }
  return result;
}

uint64_t __54__PFCloudKitImporter_importIfNecessaryWithCompletion___block_invoke_3( uint64_t result,  uint64_t a2)
{
  uint64_t v2 = *(void *)(result + 32);
  if (v2) {
    return [*(id *)(v2 + 16) addObject:a2];
  }
  return result;
}

uint64_t __54__PFCloudKitImporter_importIfNecessaryWithCompletion___block_invoke_4( uint64_t result,  uint64_t a2)
{
  uint64_t v2 = *(void *)(result + 32);
  if (v2) {
    return [*(id *)(v2 + 24) addObject:a2];
  }
  return result;
}

void __54__PFCloudKitImporter_importIfNecessaryWithCompletion___block_invoke_5(uint64_t a1, char *newValue)
{
  uint64_t v2 = *(void **)(a1 + 32);
  if (v2) {
    objc_setProperty_nonatomic(v2, newValue, newValue, 40LL);
  }
}

uint64_t __54__PFCloudKitImporter_importIfNecessaryWithCompletion___block_invoke_6( uint64_t result,  uint64_t a2)
{
  uint64_t v2 = *(void *)(result + 32);
  if (v2) {
    return [*(id *)(v2 + 32) addObject:a2];
  }
  return result;
}

void __54__PFCloudKitImporter_importIfNecessaryWithCompletion___block_invoke_7( uint64_t a1,  void *a2,  uint64_t a3,  uint64_t a4)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  id v8 = *(id *)(a1 + 32);
  uint64_t v10 = v8;
  if (WeakRetained)
  {
    if (v8) {
      objc_setProperty_nonatomic(v8, v9, a2, 40LL);
    }
    uint64_t v11 = WeakRetained[1];
    if (v11) {
      uint64_t v12 = *(dispatch_queue_s **)(v11 + 32);
    }
    else {
      uint64_t v12 = 0LL;
    }
    v14[0] = MEMORY[0x1895F87A8];
    v14[1] = 3221225472LL;
    v14[2] = __54__PFCloudKitImporter_importIfNecessaryWithCompletion___block_invoke_8;
    v14[3] = &unk_189EA97A8;
    v14[4] = WeakRetained;
    v14[5] = v10;
    uint64_t v13 = *(void *)(a1 + 40);
    v14[6] = a4;
    v14[7] = v13;
    dispatch_async(v12, v14);
  }
}

void __54__PFCloudKitImporter_importIfNecessaryWithCompletion___block_invoke_8(uint64_t a1)
{
  uint64_t v2 = *(id *)(a1 + 32);
  if (v2)
  {
    uint64_t v4 = *(void *)(a1 + 48);
    uint64_t v3 = *(void *)(a1 + 56);
    v21 = v2;
    if (!v4)
    {
      uint64_t v19 = *(void *)(a1 + 40);
      uint64_t v20 = (void *)v2[1];
      if (v20) {
        uint64_t v20 = (void *)v20[2];
      }
      v18 = v20;
      v22[0] = MEMORY[0x1895F87A8];
      v22[1] = 3221225472LL;
      v22[2] = __70__PFCloudKitImporter_databaseFetchFinishWithContext_error_completion___block_invoke;
      v22[3] = &unk_189EA97A8;
      v22[4] = v18;
      v22[5] = v21;
      v22[6] = v19;
      v22[7] = v3;
      -[PFCloudKitStoreMonitor performBlock:]((uint64_t)v18, (uint64_t)v22);
      goto LABEL_11;
    }

    uint64_t v5 = (void *)MEMORY[0x186E3E5D8]();
    BOOL v6 = __ckLoggingOverride != 0;
    uint64_t v7 = [@"CoreData+CloudKit: %s(%d): " stringByAppendingString:@"%@: Database fetch for request: %@ failed with error: %@"];
    _NSCoreDataLog( v6,  v7,  v8,  v9,  v10,  v11,  v12,  v13,  (uint64_t)"-[PFCloudKitImporter databaseFetchFinishWithContext:error:completion:]");
    objc_autoreleasePoolPop(v5);
    uint64_t v2 = v21;
    if (v3)
    {
      uint64_t v14 = objc_alloc(&OBJC_CLASS___NSCloudKitMirroringResult);
      uint64_t v15 = v21[1];
      if (v15 && (uint64_t v16 = *(void *)(v15 + 16)) != 0) {
        uint64_t v17 = *(void *)(v16 + 48);
      }
      else {
        uint64_t v17 = 0LL;
      }
      v18 = -[NSCloudKitMirroringResult initWithRequest:storeIdentifier:success:madeChanges:error:]( v14,  "initWithRequest:storeIdentifier:success:madeChanges:error:",  v21[2],  v17,  0LL,  0LL,  v4);
      (*(void (**)(uint64_t, NSCloudKitMirroringResult *))(v3 + 16))(v3, v18);
LABEL_11:

      uint64_t v2 = v21;
    }
  }
}

void __70__PFCloudKitImporter_databaseFetchFinishWithContext_error_completion___block_invoke(void *a1)
{
  uint64_t v109 = *MEMORY[0x1895F89C0];
  uint64_t v2 = (void *)-[PFCloudKitStoreMonitor retainedMonitoredStore](a1[4]);
  if (v2)
  {
    v74 = -[PFCloudKitStoreMonitor newBackgroundContextForMonitoredCoordinator](a1[4]);
    uint64_t v3 = *(void *)(a1[5] + 8LL);
    if (v3) {
      uint64_t v4 = *(void **)(v3 + 8);
    }
    else {
      uint64_t v4 = 0LL;
    }
    uint64_t v5 = [v4 databaseScope];
    uint64_t v83 = 0LL;
    uint64_t v84 = &v83;
    uint64_t v85 = 0x2020000000LL;
    char v86 = 1;
    uint64_t v77 = 0LL;
    uint64_t v78 = &v77;
    uint64_t v79 = 0x3052000000LL;
    v80 = __Block_byref_object_copy__23;
    uint64_t v81 = __Block_byref_object_dispose__23;
    uint64_t v6 = MEMORY[0x1895F87A8];
    uint64_t v82 = 0LL;
    v76[0] = MEMORY[0x1895F87A8];
    v76[1] = 3221225472LL;
    v76[2] = __70__PFCloudKitImporter_databaseFetchFinishWithContext_error_completion___block_invoke_2;
    v76[3] = &unk_189EA9B78;
    v76[4] = v2;
    v76[5] = v74;
    v76[6] = a1[6];
    v76[7] = &v83;
    v76[8] = &v77;
    v76[9] = v5;
    -[NSManagedObjectContext performBlockAndWait:](v74, "performBlockAndWait:", v76);
    if (*((_BYTE *)v84 + 24))
    {
      BOOL v7 = -[PFCloudKitImportDatabaseContext hasWorkToDo](a1[6]);
      uint64_t v8 = (void *)MEMORY[0x186E3E5D8]();
      unint64_t v9 = __ckLoggingOverride;
      if (!v7)
      {
        uint64_t v41 = [@"CoreData+CloudKit: %s(%d): " stringByAppendingString:@"%@: Import request finished with no work to do: %@"];
        if (v9 >= 0x10) {
          uint64_t v48 = 16LL;
        }
        else {
          uint64_t v48 = v9;
        }
        _NSCoreDataLog( v48,  v41,  v42,  v43,  v44,  v45,  v46,  v47,  (uint64_t)"-[PFCloudKitImporter databaseFetchFinishWithContext:error:completion:]_block_invoke");
        objc_autoreleasePoolPop(v8);
        v75[0] = v6;
        v75[1] = 3221225472LL;
        v75[2] = __70__PFCloudKitImporter_databaseFetchFinishWithContext_error_completion___block_invoke_3;
        v75[3] = &unk_189EA9290;
        uint64_t v49 = a1[6];
        v75[4] = a1[5];
        v75[5] = v2;
        v75[6] = v74;
        v75[7] = v49;
        v75[8] = &v83;
        v75[9] = &v77;
        -[NSManagedObjectContext performBlockAndWait:](v74, "performBlockAndWait:", v75);
        if (a1[7])
        {
          v50 = objc_alloc(&OBJC_CLASS___NSCloudKitMirroringResult);
          uint64_t v51 = a1[4];
          if (v51) {
            uint64_t v52 = *(void *)(v51 + 48);
          }
          else {
            uint64_t v52 = 0LL;
          }
          id v53 = -[NSCloudKitMirroringResult initWithRequest:storeIdentifier:success:madeChanges:error:]( v50,  "initWithRequest:storeIdentifier:success:madeChanges:error:",  *(void *)(a1[5] + 16LL),  v52,  1LL,  0LL,  0LL);
          (*(void (**)(void))(a1[7] + 16LL))();
        }

        goto LABEL_74;
      }

      uint64_t v10 = [@"CoreData+CloudKit: %s(%d): " stringByAppendingString:@"%@: Import request finished: %@ - %@"];
      if (v9 >= 0x10) {
        uint64_t v17 = 16LL;
      }
      else {
        uint64_t v17 = v9;
      }
      _NSCoreDataLog( v17,  v10,  v11,  v12,  v13,  v14,  v15,  v16,  (uint64_t)"-[PFCloudKitImporter databaseFetchFinishWithContext:error:completion:]_block_invoke");
      objc_autoreleasePoolPop(v8);
      v18 = (void *)a1[6];
      if (v18) {
        v18 = (void *)v18[5];
      }
      *(void *)(a1[5] + 40LL) = v18;
      uint64_t v19 = (void *)a1[5];
      if (v19)
      {
        uint64_t v20 = a1[6];
        uint64_t v72 = a1[7];
        id v21 = objc_alloc_init(MEMORY[0x189603FA8]);
        uint64_t v73 = v20;
        if (v20)
        {
          if (![*(id *)(v20 + 8) count])
          {
            __int128 v97 = 0u;
            __int128 v98 = 0u;
            __int128 v95 = 0u;
            __int128 v96 = 0u;
LABEL_47:
            __int128 v56 = *(void **)(v20 + 16);
LABEL_48:
            uint64_t v57 = [v56 countByEnumeratingWithState:&v95 objects:v107 count:16];
            if (v57)
            {
              uint64_t v58 = *(void *)v96;
              do
              {
                for (uint64_t i = 0LL; i != v57; ++i)
                {
                  if (*(void *)v96 != v58) {
                    objc_enumerationMutation(v56);
                  }
                  __int128 v60 = -[PFCloudKitImporterZoneDeletedWorkItem initWithDeletedRecordZoneID:options:request:]( objc_alloc(&OBJC_CLASS___PFCloudKitImporterZoneDeletedWorkItem),  "initWithDeletedRecordZoneID:options:request:",  *(void *)(*((void *)&v95 + 1) + 8 * i),  v19[1],  v19[2]);
                  [v21 addObject:v60];
                }

                uint64_t v57 = [v56 countByEnumeratingWithState:&v95 objects:v107 count:16];
              }

              while (v57);
            }

            __int128 v93 = 0u;
            __int128 v94 = 0u;
            __int128 v91 = 0u;
            __int128 v92 = 0u;
            if (v73) {
              __int128 v61 = *(void **)(v73 + 24);
            }
            else {
              __int128 v61 = 0LL;
            }
            uint64_t v62 = [v61 countByEnumeratingWithState:&v91 objects:v106 count:16];
            if (v62)
            {
              uint64_t v63 = *(void *)v92;
              do
              {
                for (uint64_t j = 0LL; j != v62; ++j)
                {
                  if (*(void *)v92 != v63) {
                    objc_enumerationMutation(v61);
                  }
                  __int128 v65 = -[PFCloudKitImporterZonePurgedWorkItem initWithPurgedRecordZoneID:options:request:]( objc_alloc(&OBJC_CLASS___PFCloudKitImporterZonePurgedWorkItem),  "initWithPurgedRecordZoneID:options:request:",  *(void *)(*((void *)&v91 + 1) + 8 * j),  v19[1],  v19[2]);
                  [v21 addObject:v65];
                }

                uint64_t v62 = [v61 countByEnumeratingWithState:&v91 objects:v106 count:16];
              }

              while (v62);
            }

            __int128 v89 = 0u;
            __int128 v90 = 0u;
            __int128 v87 = 0u;
            __int128 v88 = 0u;
            if (v73) {
              __int128 v66 = *(void **)(v73 + 32);
            }
            else {
              __int128 v66 = 0LL;
            }
            uint64_t v67 = [v66 countByEnumeratingWithState:&v87 objects:v105 count:16];
            if (v67)
            {
              uint64_t v68 = *(void *)v88;
              do
              {
                for (uint64_t k = 0LL; k != v67; ++k)
                {
                  if (*(void *)v88 != v68) {
                    objc_enumerationMutation(v66);
                  }
                  v70 = -[PFCloudKitImporterZoneDeletedWorkItem initWithDeletedRecordZoneID:options:request:]( objc_alloc(&OBJC_CLASS___PFCloudKitImporterZoneDeletedWorkItem),  "initWithDeletedRecordZoneID:options:request:",  *(void *)(*((void *)&v87 + 1) + 8 * k),  v19[1],  v19[2]);
                  [v21 addObject:v70];
                }

                uint64_t v67 = [v66 countByEnumeratingWithState:&v87 objects:v105 count:16];
              }

              while (v67);
            }

            v19[3] = [v21 copy];
            -[PFCloudKitImporter processWorkItemsWithCompletion:]((uint64_t)v19, v72);

            goto LABEL_74;
          }

          uint64_t v22 = *(void **)(v20 + 8);
        }

        else
        {
          if (![0 count])
          {
            __int128 v56 = 0LL;
            __int128 v97 = 0u;
            __int128 v98 = 0u;
            __int128 v95 = 0u;
            __int128 v96 = 0u;
            goto LABEL_48;
          }

          uint64_t v22 = 0LL;
          uint64_t v20 = 0LL;
        }

        if ((unint64_t)[v22 count] < 0x191)
        {
          v54 = objc_alloc(&OBJC_CLASS___PFCloudKitImporterZoneChangedWorkItem);
          if (v20) {
            __int128 v55 = *(void **)(v20 + 8);
          }
          else {
            __int128 v55 = 0LL;
          }
          uint64_t v23 = -[PFCloudKitImporterZoneChangedWorkItem initWithChangedRecordZoneIDs:options:request:]( v54,  "initWithChangedRecordZoneIDs:options:request:",  [v55 allObjects],  v19[1],  v19[2]);
          [v21 addObject:v23];
        }

        else
        {
          uint64_t v23 = (PFCloudKitImporterZoneChangedWorkItem *)objc_alloc_init(MEMORY[0x189603FA8]);
          __int128 v101 = 0u;
          __int128 v102 = 0u;
          __int128 v99 = 0u;
          __int128 v100 = 0u;
          if (v20) {
            v24 = *(void **)(v20 + 8);
          }
          else {
            v24 = 0LL;
          }
          uint64_t v25 = [v24 countByEnumeratingWithState:&v99 objects:v108 count:16];
          v71 = v2;
          if (v25)
          {
            uint64_t v26 = *(void *)v100;
            do
            {
              for (uint64_t m = 0LL; m != v25; ++m)
              {
                if (*(void *)v100 != v26) {
                  objc_enumerationMutation(v24);
                }
                -[PFCloudKitImporterZoneChangedWorkItem addObject:]( v23,  "addObject:",  *(void *)(*((void *)&v99 + 1) + 8 * m));
                if (-[PFCloudKitImporterZoneChangedWorkItem count](v23, "count") == 400)
                {
                  uint64_t v28 = -[PFCloudKitImporterZoneChangedWorkItem initWithChangedRecordZoneIDs:options:request:]( objc_alloc(&OBJC_CLASS___PFCloudKitImporterZoneChangedWorkItem),  "initWithChangedRecordZoneIDs:options:request:",  v23,  v19[1],  v19[2]);
                  [v21 addObject:v28];

                  uint64_t v23 = (PFCloudKitImporterZoneChangedWorkItem *)objc_alloc_init(MEMORY[0x189603FA8]);
                }
              }

              uint64_t v25 = [v24 countByEnumeratingWithState:&v99 objects:v108 count:16];
            }

            while (v25);
          }

          uint64_t v2 = v71;
          uint64_t v20 = v73;
          if (-[PFCloudKitImporterZoneChangedWorkItem count](v23, "count"))
          {
            uint64_t v29 = -[PFCloudKitImporterZoneChangedWorkItem initWithChangedRecordZoneIDs:options:request:]( objc_alloc(&OBJC_CLASS___PFCloudKitImporterZoneChangedWorkItem),  "initWithChangedRecordZoneIDs:options:request:",  v23,  v19[1],  v19[2]);
            [v21 addObject:v29];
          }
        }

        __int128 v97 = 0u;
        __int128 v98 = 0u;
        __int128 v95 = 0u;
        __int128 v96 = 0u;
        if (!v20)
        {
          __int128 v56 = 0LL;
          goto LABEL_48;
        }

        goto LABEL_47;
      }
    }

    else
    {
      v37 = objc_alloc(&OBJC_CLASS___NSCloudKitMirroringResult);
      uint64_t v38 = a1[4];
      if (v38) {
        uint64_t v39 = *(void *)(v38 + 48);
      }
      else {
        uint64_t v39 = 0LL;
      }
      uint64_t v40 = -[NSCloudKitMirroringResult initWithRequest:storeIdentifier:success:madeChanges:error:]( v37,  "initWithRequest:storeIdentifier:success:madeChanges:error:",  *(void *)(a1[5] + 16LL),  v39,  0LL,  0LL,  v78[5]);
      (*(void (**)(void))(a1[7] + 16LL))();
    }

id __70__PFCloudKitImporter_databaseFetchFinishWithContext_error_completion___block_invoke_2(uint64_t a1)
{
  v22[1] = *MEMORY[0x1895F89C0];
  v20[0] = 0LL;
  uint64_t v2 = +[NSFetchRequest fetchRequestWithEntityName:]( &OBJC_CLASS___NSFetchRequest,  "fetchRequestWithEntityName:",  +[NSCKRecordZoneMetadata entityPath](&OBJC_CLASS___NSCKRecordZoneMetadata, "entityPath"));
  -[NSFetchRequest setPredicate:]( v2,  "setPredicate:",  [MEMORY[0x1896079C8] predicateWithFormat:@"needsImport = YES AND database.databaseScopeNuuint64_t m = %@ AND (needsNewShareInvitation = NO OR needsNewShareInvitation = NULL)", objc_msgSend(MEMORY[0x189607968], "numberWithInteger:", *(void *)(a1 + 72))]);
  v22[0] = *(void *)(a1 + 32);
  -[NSFetchRequest setAffectedStores:]( v2,  "setAffectedStores:",  [MEMORY[0x189603F18] arrayWithObjects:v22 count:1]);
  -[NSFetchRequest setReturnsObjectsAsFaults:](v2, "setReturnsObjectsAsFaults:", 0LL);
  uint64_t v3 = (void *)[*(id *)(a1 + 40) executeFetchRequest:v2 error:v20];
  uint64_t v4 = v3;
  if (v3)
  {
    __int128 v18 = 0u;
    __int128 v19 = 0u;
    __int128 v16 = 0u;
    __int128 v17 = 0u;
    id result = (id)[v3 countByEnumeratingWithState:&v16 objects:v21 count:16];
    id v6 = result;
    if (result)
    {
      uint64_t v7 = *(void *)v17;
      do
      {
        uint64_t v8 = 0LL;
        do
        {
          if (*(void *)v17 != v7) {
            objc_enumerationMutation(v4);
          }
          unint64_t v9 = *(void **)(*((void *)&v16 + 1) + 8LL * (void)v8);
          uint64_t v10 = -[NSCKRecordZoneMetadata createRecordZoneID](v9);
          if ([v9 needsImport])
          {
            uint64_t v11 = *(void *)(a1 + 48);
            uint64_t v12 = v11 ? *(void **)(v11 + 16) : 0LL;
            if (([v12 containsObject:v10] & 1) == 0)
            {
              uint64_t v13 = *(void *)(a1 + 48);
              if (v13) {
                uint64_t v14 = *(void **)(v13 + 24);
              }
              else {
                uint64_t v14 = 0LL;
              }
              if (([v14 containsObject:v10] & 1) == 0)
              {
                uint64_t v15 = *(void *)(a1 + 48);
                if (v15) {
                  [*(id *)(v15 + 8) addObject:v10];
                }
              }
            }
          }

          uint64_t v8 = (char *)v8 + 1;
        }

        while (v6 != v8);
        id result = (id)[v4 countByEnumeratingWithState:&v16 objects:v21 count:16];
        id v6 = result;
      }

      while (result);
    }
  }

  else
  {
    *(_BYTE *)(*(void *)(*(void *)(a1 + 56) + 8LL) + 24LL) = 0;
    id result = v20[0];
    *(void *)(*(void *)(*(void *)(a1 + 64) + 8LL) + 40LL) = result;
  }

  return result;
}

void __70__PFCloudKitImporter_databaseFetchFinishWithContext_error_completion___block_invoke_3(uint64_t a1)
{
  v17[5] = *MEMORY[0x1895F89C0];
  v17[0] = 0LL;
  uint64_t v2 = *(void *)(*(void *)(a1 + 32) + 8LL);
  if (v2) {
    uint64_t v3 = *(void **)(v2 + 8);
  }
  else {
    uint64_t v3 = 0LL;
  }
  uint64_t v4 = +[NSCKDatabaseMetadata databaseMetadataForScope:forStore:inContext:error:]( (uint64_t)NSCKDatabaseMetadata,  [v3 databaseScope],  *(void *)(a1 + 40),  *(void **)(a1 + 48),  (uint64_t)v17);
  uint64_t v5 = v4;
  if (!v4
    || ((uint64_t v6 = *(void *)(a1 + 56)) == 0 ? (v7 = 0LL) : (v7 = *(void *)(v6 + 40)),
        -[NSManagedObject setCurrentChangeToken:](v4, "setCurrentChangeToken:", v7),
        -[NSManagedObject setLastFetchDate:](v5, "setLastFetchDate:", [MEMORY[0x189603F50] date]),
        ([*(id *)(a1 + 48) save:v17] & 1) == 0))
  {
    uint64_t v8 = (void *)MEMORY[0x186E3E5D8]();
    uint64_t v9 = __ckLoggingOverride;
    uint64_t v10 = [@"CoreData+CloudKit: %s(%d): " stringByAppendingString:@"%@: Error fetching database metadata update for request: %@\n%@"];
    _NSCoreDataLog( v9 != 0,  v10,  v11,  v12,  v13,  v14,  v15,  v16,  (uint64_t)"-[PFCloudKitImporter databaseFetchFinishWithContext:error:completion:]_block_invoke_3");
    objc_autoreleasePoolPop(v8);
  }

void __53__PFCloudKitImporter_processWorkItemsWithCompletion___block_invoke(void *a1)
{
  v32[1] = *MEMORY[0x1895F89C0];
  uint64_t v2 = a1[4];
  if (v2)
  {
    id WeakRetained = objc_loadWeakRetained((id *)(v2 + 32));
    uint64_t v4 = a1[4];
  }

  else
  {
    uint64_t v4 = 0LL;
    id WeakRetained = 0LL;
  }

  uint64_t v5 = (void *)-[PFCloudKitStoreMonitor retainedMonitoredStore](v4);
  if (v5)
  {
    uint64_t v6 = (void *)a1[5];
    if (v6)
    {
      uint64_t v7 = v6[2];
      if (v7)
      {
        if (([*(id *)(v7 + 64) shouldDefer] & 1) != 0 || *(_BYTE *)(v7 + 40))
        {
          uint64_t v8 = (void *)MEMORY[0x189607870];
          uint64_t v31 = *MEMORY[0x1896075F0];
          v32[0] = @"The request was aborted because it was deferred by the system.";
          uint64_t v9 = [MEMORY[0x189603F68] dictionaryWithObjects:v32 forKeys:&v31 count:1];
          uint64_t v10 = [v8 errorWithDomain:*MEMORY[0x189607460] code:134419 userInfo:v9];
          uint64_t v11 = objc_alloc(&OBJC_CLASS___NSCloudKitMirroringResult);
          uint64_t v12 = a1[4];
          if (v12) {
            uint64_t v13 = *(void *)(v12 + 48);
          }
          else {
            uint64_t v13 = 0LL;
          }
          uint64_t v14 = -[NSCloudKitMirroringResult initWithRequest:storeIdentifier:success:madeChanges:error:]( v11,  "initWithRequest:storeIdentifier:success:madeChanges:error:",  *(void *)(a1[5] + 16LL),  v13,  0LL,  0LL,  v10);
          (*(void (**)(void))(a1[7] + 16LL))();

          goto LABEL_16;
        }

        uint64_t v6 = (void *)a1[5];
      }
    }

    objc_initWeak(&location, v6);
    uint64_t v23 = (void *)a1[6];
    uint64_t v22 = a1 + 6;
    uint64_t v24 = *((void *)v22 - 2);
    v25[0] = MEMORY[0x1895F87A8];
    v25[1] = 3221225472LL;
    v25[2] = __53__PFCloudKitImporter_processWorkItemsWithCompletion___block_invoke_2;
    v25[3] = &unk_189EA9BA0;
    objc_copyWeak(&v27, &location);
    __int128 v26 = *v22;
    [v23 doWorkForStore:v5 inMonitor:v24 completion:v25];
    objc_destroyWeak(&v27);
    objc_destroyWeak(&location);
    goto LABEL_16;
  }

  uint64_t v15 = (void *)MEMORY[0x189607870];
  uint64_t v29 = *MEMORY[0x1896075F0];
  uint64_t v30 = [NSString stringWithFormat:@"Request '%@' was cancelled because the store was removed from the coordinator.", objc_msgSend(*(id *)(a1[5] + 16), "requestIdentifier")];
  uint64_t v16 = [MEMORY[0x189603F68] dictionaryWithObjects:&v30 forKeys:&v29 count:1];
  uint64_t v17 = [v15 errorWithDomain:*MEMORY[0x189607460] code:134407 userInfo:v16];
  __int128 v18 = objc_alloc(&OBJC_CLASS___NSCloudKitMirroringResult);
  uint64_t v19 = a1[4];
  if (v19) {
    uint64_t v20 = *(void *)(v19 + 48);
  }
  else {
    uint64_t v20 = 0LL;
  }
  id v21 = -[NSCloudKitMirroringResult initWithRequest:storeIdentifier:success:madeChanges:error:]( v18,  "initWithRequest:storeIdentifier:success:madeChanges:error:",  *(void *)(a1[5] + 16LL),  v20,  0LL,  0LL,  v17);
  (*(void (**)(void))(a1[7] + 16LL))();

LABEL_16:
}

void __53__PFCloudKitImporter_processWorkItemsWithCompletion___block_invoke_2(uint64_t a1, uint64_t a2)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  uint64_t v5 = WeakRetained;
  if (WeakRetained)
  {
    uint64_t v6 = *((void *)WeakRetained + 1);
    if (v6) {
      uint64_t v7 = *(dispatch_queue_s **)(v6 + 32);
    }
    else {
      uint64_t v7 = 0LL;
    }
    v10[0] = MEMORY[0x1895F87A8];
    v10[1] = 3221225472LL;
    v10[2] = __53__PFCloudKitImporter_processWorkItemsWithCompletion___block_invoke_3;
    v10[3] = &unk_189EA97A8;
    uint64_t v8 = *(void *)(a1 + 32);
    uint64_t v9 = *(void *)(a1 + 40);
    v10[4] = v5;
    v10[5] = v8;
    v10[6] = a2;
    v10[7] = v9;
    dispatch_async(v7, v10);
  }
}

void __53__PFCloudKitImporter_processWorkItemsWithCompletion___block_invoke_3(uint64_t a1)
{
  uint64_t v2 = (void *)MEMORY[0x186E3E5D8]();
  id v3 = *(id *)(a1 + 32);
  if (v3)
  {
    int8x16_t v4 = *(int8x16_t *)(a1 + 40);
    uint64_t v5 = *(void *)(a1 + 56);
    v6[0] = MEMORY[0x1895F87A8];
    v6[1] = 3221225472LL;
    v6[2] = __61__PFCloudKitImporter_workItemFinished_withResult_completion___block_invoke;
    v6[3] = &unk_189EA97A8;
    v6[4] = v3;
    int8x16_t v7 = vextq_s8(v4, v4, 8uLL);
    uint64_t v8 = v5;
    +[_PFRoutines wrapBlockInGuardedAutoreleasePool:]( &OBJC_CLASS____PFRoutines,  "wrapBlockInGuardedAutoreleasePool:",  v6);
  }

  objc_autoreleasePoolPop(v2);
}

void __53__PFCloudKitImporter_processWorkItemsWithCompletion___block_invoke_4(uint64_t *a1)
{
  v1 = a1;
  uint64_t v86 = *MEMORY[0x1895F89C0];
  uint64_t v2 = (void *)-[PFCloudKitStoreMonitor retainedMonitoredStore](a1[4]);
  if (!v2)
  {
    uint64_t v30 = (void *)MEMORY[0x189607870];
    uint64_t v79 = *MEMORY[0x1896075F0];
    uint64_t v80 = [NSString stringWithFormat:@"Request '%@' was cancelled because the store was removed from the coordinator.", objc_msgSend(*(id *)(v1[5] + 16), "requestIdentifier")];
    uint64_t v31 = [MEMORY[0x189603F68] dictionaryWithObjects:&v80 forKeys:&v79 count:1];
    uint64_t v32 = [v30 errorWithDomain:*MEMORY[0x189607460] code:134407 userInfo:v31];
    uint64_t v33 = objc_alloc(&OBJC_CLASS___NSCloudKitMirroringResult);
    uint64_t v34 = v1[4];
    if (v34) {
      uint64_t v35 = *(void *)(v34 + 48);
    }
    else {
      uint64_t v35 = 0LL;
    }
    char v36 = -[NSCloudKitMirroringResult initWithRequest:storeIdentifier:success:madeChanges:error:]( v33,  "initWithRequest:storeIdentifier:success:madeChanges:error:",  *(void *)(v1[5] + 16),  v35,  0LL,  0LL,  v32);
    (*(void (**)(void))(v1[6] + 16))();

    goto LABEL_48;
  }

  id v3 = -[PFCloudKitStoreMonitor newBackgroundContextForMonitoredCoordinator](v1[4]);
  uint64_t v75 = 0LL;
  uint64_t v76 = &v75;
  uint64_t v77 = 0x2020000000LL;
  char v78 = 1;
  uint64_t v69 = 0LL;
  v70 = &v69;
  uint64_t v71 = 0x3052000000LL;
  uint64_t v72 = __Block_byref_object_copy__23;
  uint64_t v73 = __Block_byref_object_dispose__23;
  uint64_t v74 = 0LL;
  uint64_t v63 = 0LL;
  __int128 v64 = &v63;
  uint64_t v65 = 0x3052000000LL;
  __int128 v66 = __Block_byref_object_copy__23;
  uint64_t v67 = __Block_byref_object_dispose__23;
  uint64_t v68 = 0LL;
  if ((unint64_t)[*(id *)(v1[5] + 32) count] < 2)
  {
    if ([*(id *)(v1[5] + 32) count] == 1)
    {
      char v37 = objc_msgSend((id)objc_msgSend(*(id *)(v1[5] + 32), "lastObject"), "success");
      *((_BYTE *)v76 + 24) = v37;
      uint64_t v38 = objc_msgSend((id)objc_msgSend(*(id *)(v1[5] + 32), "lastObject"), "madeChanges");
      id v39 = (id)objc_msgSend((id)objc_msgSend(*(id *)(v1[5] + 32), "lastObject"), "error");
      void v70[5] = (uint64_t)v39;
      id v40 = (id)[*(id *)(v1[5] + 32) lastObject];
      v64[5] = (uint64_t)v40;
    }

    else
    {
      uint64_t v38 = 0LL;
    }

    goto LABEL_32;
  }

  __int128 v55 = v3;
  id v57 = objc_alloc_init(MEMORY[0x189603FA8]);
  __int128 v61 = 0u;
  __int128 v62 = 0u;
  __int128 v59 = 0u;
  __int128 v60 = 0u;
  int8x16_t v4 = *(void **)(v1[5] + 32);
  uint64_t v5 = [v4 countByEnumeratingWithState:&v59 objects:v85 count:16];
  __int128 v56 = v1;
  char v6 = 0;
  if (v5)
  {
    uint64_t v7 = *(void *)v60;
    do
    {
      for (uint64_t i = 0LL; i != v5; ++i)
      {
        if (*(void *)v60 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void **)(*((void *)&v59 + 1) + 8 * i);
        if (([v9 success] & 1) == 0)
        {
          *((_BYTE *)v76 + 24) = 0;
          if ([v9 error])
          {
            objc_msgSend(v57, "addObject:", objc_msgSend(v9, "error"));
          }

          else
          {
            uint64_t v10 = [NSString stringWithUTF8String:"Work item result failed but did not include an error: %@"];
            _NSCoreDataLog(17LL, v10, v11, v12, v13, v14, v15, v16, (uint64_t)v9);
            uint64_t v17 = (os_log_s *)__pflogFaultLog;
            if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
            {
              *(_DWORD *)buf = 138412290;
              uint64_t v84 = v9;
              _os_log_fault_impl( &dword_186681000,  v17,  OS_LOG_TYPE_FAULT,  "CoreData: Work item result failed but did not include an error: %@",  buf,  0xCu);
            }
          }
        }

        uint64_t v18 = objc_opt_class();
        if (v18 != objc_opt_class())
        {
          uint64_t v19 = [NSString stringWithUTF8String:"The importer needs to be taught how to merge results of different types when dealing with multiple work items: %@"];
          _NSCoreDataLog(17LL, v19, v20, v21, v22, v23, v24, v25, (uint64_t)v9);
          __int128 v26 = (os_log_s *)__pflogFaultLog;
          if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
          {
            *(_DWORD *)buf = 138412290;
            uint64_t v84 = v9;
            _os_log_fault_impl( &dword_186681000,  v26,  OS_LOG_TYPE_FAULT,  "CoreData: The importer needs to be taught how to merge results of different types when dealing with multip le work items: %@",  buf,  0xCu);
          }
        }
      }

      uint64_t v5 = [v4 countByEnumeratingWithState:&v59 objects:v85 count:16];
    }

    while (v5);
  }

  v1 = v56;
  if ((unint64_t)[v57 count] >= 2)
  {
    *((_BYTE *)v76 + 24) = 0;
    id v27 = objc_alloc(MEMORY[0x189607870]);
    uint64_t v81 = @"NSDetailedErrors";
    id v82 = v57;
    uint64_t v28 = [MEMORY[0x189603F68] dictionaryWithObjects:&v82 forKeys:&v81 count:1];
    id v29 = (id)[v27 initWithDomain:*MEMORY[0x189607460] code:134404 userInfo:v28];
LABEL_30:
    void v70[5] = (uint64_t)v29;
    goto LABEL_31;
  }

  if ([v57 count] == 1)
  {
    *((_BYTE *)v76 + 24) = 0;
    id v29 = (id)[v57 lastObject];
    goto LABEL_30;
  }

void __53__PFCloudKitImporter_processWorkItemsWithCompletion___block_invoke_59(uint64_t a1)
{
  v15[5] = *(id *)MEMORY[0x1895F89C0];
  v15[0] = 0LL;
  uint64_t v2 = *(void *)(*(void *)(a1 + 32) + 8LL);
  if (v2) {
    id v3 = *(void **)(v2 + 8);
  }
  else {
    id v3 = 0LL;
  }
  int8x16_t v4 = +[NSCKDatabaseMetadata databaseMetadataForScope:forStore:inContext:error:]( (uint64_t)NSCKDatabaseMetadata,  [v3 databaseScope],  *(void *)(a1 + 40),  *(void **)(a1 + 48),  (uint64_t)v15);
  uint64_t v5 = v4;
  if (!v4
    || (-[NSManagedObject setCurrentChangeToken:]( v4,  "setCurrentChangeToken:",  *(void *)(*(void *)(a1 + 32) + 40)),  -[NSManagedObject setLastFetchDate:](v5, "setLastFetchDate:", [MEMORY[0x189603F50] date]),  (objc_msgSend(*(id *)(a1 + 48), "save:", v15) & 1) == 0))
  {
    char v6 = (void *)MEMORY[0x186E3E5D8]();
    uint64_t v7 = __ckLoggingOverride;
    uint64_t v8 = [@"CoreData+CloudKit: %s(%d): " stringByAppendingString:@"%@: Error fetching database metadata update for request: %@\n%@"];
    _NSCoreDataLog( v7 != 0,  v8,  v9,  v10,  v11,  v12,  v13,  v14,  (uint64_t)"-[PFCloudKitImporter processWorkItemsWithCompletion:]_block_invoke");
    objc_autoreleasePoolPop(v6);
    *(_BYTE *)(*(void *)(*(void *)(a1 + 56) + 8LL) + 24LL) = 0;
    *(void *)(*(void *)(*(void *)(a1 + 64) + 8LL) + 40LL) = v15[0];

    *(void *)(*(void *)(*(void *)(a1 + 72) + 8LL) + 40LL) = 0LL;
  }

uint64_t __61__PFCloudKitImporter_workItemFinished_withResult_completion___block_invoke(uint64_t a1)
{
  if ([*(id *)(a1 + 40) success])
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      uint64_t v2 = *(void *)(a1 + 48);
      if (v2)
      {
        uint64_t v3 = *(void *)(v2 + 64);
        if (v3) {
          int8x16_t v4 = *(void **)(v3 + 24);
        }
        else {
          int8x16_t v4 = 0LL;
        }
        uint64_t v5 = [v4 unsignedIntegerValue];
      }

      else
      {
        uint64_t v5 = 0LL;
      }

      *(void *)(*(void *)(a1 + 32) + 48LL) += v5;
    }

    return -[PFCloudKitImporter processWorkItemsWithCompletion:](*(void *)(a1 + 32), *(void *)(a1 + 56));
  }

  else
  {
    uint64_t result = *(void *)(a1 + 56);
    if (result) {
      return (*(uint64_t (**)(uint64_t, void))(result + 16))(result, *(void *)(a1 + 40));
    }
  }

  return result;
}

@end