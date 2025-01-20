@interface PFCloudKitExporter
- (PFCloudKitExporter)initWithOptions:(id)a3 request:(id)a4 monitor:(id)a5 workQueue:(id)a6;
- (uint64_t)updateMetadataForSavedZones:(void *)a3 error:;
- (void)checkForZonesNeedingExport;
- (void)dealloc;
- (void)exportIfNecessary;
- (void)exportIfNecessaryWithCompletion:(void *)a1;
- (void)finishExportWithResult:(void *)a1;
@end

@implementation PFCloudKitExporter

- (PFCloudKitExporter)initWithOptions:(id)a3 request:(id)a4 monitor:(id)a5 workQueue:(id)a6
{
  v12.receiver = self;
  v12.super_class = (Class)&OBJC_CLASS___PFCloudKitExporter;
  v10 = -[PFCloudKitExporter init](&v12, sel_init);
  if (v10)
  {
    v10->_monitor = (PFCloudKitStoreMonitor *)a5;
    v10->_options = (PFCloudKitExporterOptions *)[a3 copy];
    v10->_workQueue = (OS_dispatch_queue *)a6;
    if (a6) {
      dispatch_retain((dispatch_object_t)a6);
    }
    v10->_request = (NSCloudKitMirroringRequest *)a4;
    objc_storeWeak((id *)&v10->_delegate, 0LL);
    v10->_exportContext = -[PFCloudKitExportContext initWithOptions:]( objc_alloc(&OBJC_CLASS___PFCloudKitExportContext),  "initWithOptions:",  v10->_options);
    v10->_operationIDToResult = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x189603FC8]);
  }

  return v10;
}

- (void)dealloc
{
  workQueue = (dispatch_object_s *)self->_workQueue;
  if (workQueue) {
    dispatch_release(workQueue);
  }

  self->_exportCompletionBlock = 0LL;
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___PFCloudKitExporter;
  -[PFCloudKitExporter dealloc](&v4, sel_dealloc);
}

- (void)exportIfNecessaryWithCompletion:(void *)a1
{
  v20[1] = *MEMORY[0x1895F89C0];
  if (a1)
  {
    if (a1[2])
    {
      uint64_t v4 = [NSString stringWithUTF8String:"exportIfNecessaryWithCompletion invoked multiple times."];
      _NSCoreDataLog(17LL, v4, v5, v6, v7, v8, v9, v10, v18);
      v11 = (os_log_s *)__pflogFaultLog;
      if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
      {
        LOWORD(v18) = 0;
        _os_log_fault_impl( &dword_186681000,  v11,  OS_LOG_TYPE_FAULT,  "CoreData: exportIfNecessaryWithCompletion invoked multiple times.",  (uint8_t *)&v18,  2u);
      }

      objc_super v12 = objc_alloc(&OBJC_CLASS___NSCloudKitMirroringResult);
      uint64_t v13 = a1[5];
      uint64_t v14 = a1[8];
      if (v14) {
        uint64_t v15 = *(void *)(v14 + 48);
      }
      else {
        uint64_t v15 = 0LL;
      }
      uint64_t v16 = *MEMORY[0x189607460];
      uint64_t v19 = *MEMORY[0x1896075F0];
      v20[0] = @"exportIfNecessaryWithCompletion called re-entrantly, this is a serious bug. Please file a feedback report.";
      v17 = -[NSCloudKitMirroringResult initWithRequest:storeIdentifier:success:madeChanges:error:]( v12,  "initWithRequest:storeIdentifier:success:madeChanges:error:",  v13,  v15,  0,  0,  objc_msgSend( MEMORY[0x189607870],  "errorWithDomain:code:userInfo:",  v16,  134410,  objc_msgSend(MEMORY[0x189603F68], "dictionaryWithObjects:forKeys:count:", v20, &v19, 1)));
      ((void (**)(void, NSCloudKitMirroringResult *))a2)[2](a2, v17);
    }

    else
    {
      a1[2] = [a2 copy];
    }

    -[PFCloudKitExporter checkForZonesNeedingExport]((uint64_t)a1);
  }

- (void)checkForZonesNeedingExport
{
  location[1] = *(id *)MEMORY[0x1895F89C0];
  uint64_t v58 = 0LL;
  v59 = &v58;
  uint64_t v60 = 0x2020000000LL;
  char v61 = 1;
  uint64_t v52 = 0LL;
  v53 = &v52;
  uint64_t v54 = 0x3052000000LL;
  v55 = __Block_byref_object_copy__32;
  v56 = __Block_byref_object_dispose__32;
  uint64_t v57 = 0LL;
  uint64_t v46 = 0LL;
  v47 = &v46;
  uint64_t v48 = 0x3052000000LL;
  v49 = __Block_byref_object_copy__32;
  v50 = __Block_byref_object_dispose__32;
  uint64_t v51 = 0LL;
  id v2 = objc_alloc_init(MEMORY[0x189603FA8]);
  id v3 = *(id *)(a1 + 64);
  uint64_t v4 = *(void *)(a1 + 40);
  if (v4 && (([*(id *)(v4 + 64) shouldDefer] & 1) != 0 || *(_BYTE *)(v4 + 40)))
  {
    *((_BYTE *)v59 + 24) = 0;
    id v5 = objc_alloc(MEMORY[0x189607870]);
    uint64_t v62 = *MEMORY[0x1896075F0];
    v63 = @"The request was aborted because it was deferred by the system.";
    uint64_t v6 = [MEMORY[0x189603F68] dictionaryWithObjects:&v63 forKeys:&v62 count:1];
    uint64_t v7 = [v5 initWithDomain:*MEMORY[0x189607460] code:134419 userInfo:v6];
    v53[5] = v7;
  }

  else
  {
    v45[0] = MEMORY[0x1895F87A8];
    v45[1] = 3221225472LL;
    v45[2] = __48__PFCloudKitExporter_checkForZonesNeedingExport__block_invoke;
    v45[3] = &unk_189EA9FD0;
    v45[4] = v3;
    v45[5] = a1;
    v45[6] = v2;
    v45[7] = &v52;
    v45[8] = &v58;
    v45[9] = &v46;
    -[PFCloudKitStoreMonitor performBlock:]((uint64_t)v3, (uint64_t)v45);
  }

  if (*((_BYTE *)v59 + 24))
  {
    if (v47[5])
    {
      uint64_t v8 = (void *)MEMORY[0x186E3E5D8]();
      else {
        uint64_t v9 = __ckLoggingOverride;
      }
      uint64_t v10 = [@"CoreData+CloudKit: %s(%d): " stringByAppendingString:@"%@: Scheduling modifyRecordZonesOperation in response to request: %@ operation: %@\n%@\n%@"];
      [(id)v47[5] recordZonesToSave];
      [(id)v47[5] recordZoneIDsToDelete];
      _NSCoreDataLog(v9, v10, v11, v12, v13, v14, v15, v16, (uint64_t)"-[PFCloudKitExporter checkForZonesNeedingExport]");
      objc_autoreleasePoolPop(v8);
      uint64_t v17 = *(void *)(a1 + 24);
      if (v17) {
        uint64_t v18 = *(void **)(v17 + 8);
      }
      else {
        uint64_t v18 = 0LL;
      }
      [v18 addOperation:v47[5]];
      goto LABEL_30;
    }

    if (![v2 count])
    {
      -[PFCloudKitExporter exportIfNecessary](a1);
      goto LABEL_30;
    }

    v23 = (void *)MEMORY[0x186E3E5D8]();
    unint64_t v24 = __ckLoggingOverride;
    uint64_t v25 = [@"CoreData+CloudKit: %s(%d): " stringByAppendingString:@"%@: Fetching record zones: %@"];
    if (v24 >= 0x10) {
      uint64_t v32 = 16LL;
    }
    else {
      uint64_t v32 = v24;
    }
    _NSCoreDataLog(v32, v25, v26, v27, v28, v29, v30, v31, (uint64_t)"-[PFCloudKitExporter fetchRecordZones:]");
    objc_autoreleasePoolPop(v23);
    uint64_t v33 = *(void *)(a1 + 40);
    if (v33 && (([*(id *)(v33 + 64) shouldDefer] & 1) != 0 || *(_BYTE *)(v33 + 40)))
    {
      id v34 = objc_alloc(MEMORY[0x189607870]);
      location[0] = *(id *)MEMORY[0x1896075F0];
      v64[0] = @"The request was aborted because it was deferred by the system.";
      uint64_t v35 = [MEMORY[0x189603F68] dictionaryWithObjects:v64 forKeys:location count:1];
      v36 = (void *)[v34 initWithDomain:*MEMORY[0x189607460] code:134419 userInfo:v35];
    }

    else
    {
      objc_initWeak(location, (id)a1);
      v41 = (void *)[objc_alloc((Class)getCloudKitCKFetchRecordZonesOperationClass[0]()) initWithRecordZoneIDs:v2];
      v64[0] = MEMORY[0x1895F87A8];
      v64[1] = 3221225472LL;
      v64[2] = __39__PFCloudKitExporter_fetchRecordZones___block_invoke;
      v64[3] = &unk_189EAA830;
      objc_copyWeak(&v65, location);
      v64[4] = a1;
      [v41 setFetchRecordZonesCompletionBlock:v64];
      objc_destroyWeak(&v65);
      objc_destroyWeak(location);
      if (v41)
      {
        uint64_t v43 = *(void *)(a1 + 24);
        if (v43) {
          v44 = *(void **)(v43 + 8);
        }
        else {
          v44 = 0LL;
        }
        [v44 addOperation:v41];
        v36 = 0LL;
        goto LABEL_27;
      }

      v36 = 0LL;
    }

    v37 = objc_alloc(&OBJC_CLASS___NSCloudKitMirroringResult);
    uint64_t v38 = *(void *)(a1 + 64);
    if (v38) {
      uint64_t v39 = *(void *)(v38 + 48);
    }
    else {
      uint64_t v39 = 0LL;
    }
    v40 = -[NSCloudKitMirroringResult initWithRequest:storeIdentifier:success:madeChanges:error:]( v37,  "initWithRequest:storeIdentifier:success:madeChanges:error:",  *(void *)(a1 + 40),  v39,  0LL,  0LL,  v36);
    -[PFCloudKitExporter finishExportWithResult:]((void *)a1, (uint64_t)v40);

    v41 = 0LL;
LABEL_27:

    goto LABEL_30;
  }

  uint64_t v19 = objc_alloc(&OBJC_CLASS___NSCloudKitMirroringResult);
  uint64_t v20 = *(void *)(a1 + 64);
  if (v20) {
    uint64_t v21 = *(void *)(v20 + 48);
  }
  else {
    uint64_t v21 = 0LL;
  }
  v22 = -[NSCloudKitMirroringResult initWithRequest:storeIdentifier:success:madeChanges:error:]( v19,  "initWithRequest:storeIdentifier:success:madeChanges:error:",  *(void *)(a1 + 40),  v21,  *((unsigned __int8 *)v59 + 24),  0LL,  v53[5]);
  -[PFCloudKitExporter finishExportWithResult:]((void *)a1, (uint64_t)v22);

LABEL_30:
  id v42 = (id)v53[5];
  v53[5] = 0LL;

  v47[5] = 0LL;
  _Block_object_dispose(&v46, 8);
  _Block_object_dispose(&v52, 8);
  _Block_object_dispose(&v58, 8);
}

void __48__PFCloudKitExporter_checkForZonesNeedingExport__block_invoke(uint64_t a1)
{
  v16[1] = *MEMORY[0x1895F89C0];
  uint64_t v2 = -[PFCloudKitStoreMonitor retainedMonitoredStore](*(void *)(a1 + 32));
  if (v2)
  {
    id v3 = (void *)v2;
    uint64_t v4 = *(void *)(a1 + 32);
    if (v4)
    {
      id WeakRetained = objc_loadWeakRetained((id *)(v4 + 32));
      uint64_t v6 = *(void *)(a1 + 32);
    }

    else
    {
      uint64_t v6 = 0LL;
      id WeakRetained = 0LL;
    }

    uint64_t v7 = -[PFCloudKitStoreMonitor newBackgroundContextForMonitoredCoordinator](v6);
    -[NSManagedObjectContext setTransactionAuthor:]( v7,  "setTransactionAuthor:",  @"NSCloudKitMirroringDelegate.export");
    v11[0] = MEMORY[0x1895F87A8];
    v11[1] = 3221225472LL;
    v11[2] = __48__PFCloudKitExporter_checkForZonesNeedingExport__block_invoke_2;
    v11[3] = &unk_189EAA740;
    v11[4] = v3;
    v11[5] = v7;
    __int128 v8 = *(_OWORD *)(a1 + 56);
    __int128 v12 = *(_OWORD *)(a1 + 40);
    __int128 v13 = v8;
    uint64_t v14 = *(void *)(a1 + 72);
    -[NSManagedObjectContext performBlockAndWait:](v7, "performBlockAndWait:", v11);
  }

  else
  {
    *(_BYTE *)(*(void *)(*(void *)(a1 + 64) + 8LL) + 24LL) = 0;
    id v9 = objc_alloc(MEMORY[0x189607870]);
    uint64_t v15 = *MEMORY[0x1896075F0];
    v16[0] = [NSString stringWithFormat:@"Request '%@' was cancelled because the store was removed from the coordinator.", objc_msgSend(*(id *)(*(void *)(a1 + 40) + 40), "requestIdentifier")];
    uint64_t v10 = [MEMORY[0x189603F68] dictionaryWithObjects:v16 forKeys:&v15 count:1];
    *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) = [v9 initWithDomain:*MEMORY[0x189607460] code:134407 userInfo:v10];
  }

void __48__PFCloudKitExporter_checkForZonesNeedingExport__block_invoke_2(uint64_t a1)
{
  uint64_t v1 = a1;
  v44[1] = *MEMORY[0x1895F89C0];
  if (!+[_PFRoutines _isInMemoryStore:]((uint64_t)&OBJC_CLASS____PFRoutines, *(unsigned __int8 **)(a1 + 32)))
  {
    location[0] = 0LL;
    if ((objc_msgSend( *(id *)(v1 + 40),  "setQueryGenerationFromToken:error:",  +[NSQueryGenerationToken currentQueryGenerationToken]( NSQueryGenerationToken,  "currentQueryGenerationToken"),  location) & 1) == 0)
    {
      uint64_t v2 = (void *)MEMORY[0x186E3E5D8]();
      BOOL v3 = __ckLoggingOverride != 0;
      uint64_t v4 = [@"CoreData+CloudKit: %s(%d): " stringByAppendingString:@"%@: Unable to set query generation on moc: %@"];
      _NSCoreDataLog( v3,  v4,  v5,  v6,  v7,  v8,  v9,  v10,  (uint64_t)"-[PFCloudKitExporter checkForZonesNeedingExport]_block_invoke_2");
      objc_autoreleasePoolPop(v2);
    }

    uint64_t v1 = a1;
  }

  uint64_t v11 = *(void *)(v1 + 48);
  if (v11 && (uint64_t v12 = *(void *)(v11 + 24)) != 0) {
    __int128 v13 = *(void **)(v12 + 16);
  }
  else {
    __int128 v13 = 0LL;
  }
  uint64_t v14 = [v13 databaseScope];
  if ((unint64_t)(v14 - 1) <= 1)
  {
    id v15 = +[PFCloudKitSerializer defaultRecordZoneIDForDatabaseScope:]( &OBJC_CLASS___PFCloudKitSerializer,  "defaultRecordZoneIDForDatabaseScope:",  v14);
    if (!+[NSCKRecordZoneMetadata zoneMetadataForZoneID:inDatabaseWithScope:forStore:inContext:error:]( (uint64_t)&OBJC_CLASS___NSCKRecordZoneMetadata,  v15,  v14,  *(void *)(a1 + 32),  *(void **)(a1 + 40),  *(void *)(*(void *)(a1 + 64) + 8LL) + 40LL))
    {
      *(_BYTE *)(*(void *)(*(void *)(a1 + 72) + 8LL) + 24LL) = 0;
      id v16 = *(id *)(*(void *)(*(void *)(a1 + 64) + 8LL) + 40LL);
    }
  }

  if (*(_BYTE *)(*(void *)(*(void *)(a1 + 72) + 8LL) + 24LL))
  {
    uint64_t v17 = +[NSFetchRequest fetchRequestWithEntityName:]( &OBJC_CLASS___NSFetchRequest,  "fetchRequestWithEntityName:",  +[NSCKRecordZoneMetadata entityPath](&OBJC_CLASS___NSCKRecordZoneMetadata, "entityPath"));
    -[NSFetchRequest setPredicate:]( v17,  "setPredicate:",  [MEMORY[0x1896079C8] predicateWithFormat:@"hasRecordZoneNum = NO AND database.databaseScopeNum = %@", objc_msgSend(MEMORY[0x189607968], "numberWithInteger:", v14)]);
    uint64_t v18 = *(void *)(*(void *)(a1 + 48) + 24LL);
    if (v18) {
      uint64_t v19 = *(void *)(v18 + 32);
    }
    else {
      uint64_t v19 = 0LL;
    }
    -[NSFetchRequest setFetchLimit:](v17, "setFetchLimit:", v19);
    -[NSFetchRequest setReturnsObjectsAsFaults:](v17, "setReturnsObjectsAsFaults:", 0LL);
    v44[0] = *(void *)(a1 + 32);
    -[NSFetchRequest setAffectedStores:]( v17,  "setAffectedStores:",  [MEMORY[0x189603F18] arrayWithObjects:v44 count:1]);
    uint64_t v20 = (void *)[*(id *)(a1 + 40) executeFetchRequest:v17 error:*(void *)(*(void *)(a1 + 64) + 8) + 40];
    uint64_t v21 = v20;
    if (v20)
    {
      if ([v20 count])
      {
        id v34 = objc_alloc_init(MEMORY[0x189603FA8]);
        __int128 v40 = 0u;
        __int128 v41 = 0u;
        __int128 v38 = 0u;
        __int128 v39 = 0u;
        uint64_t v22 = [v21 countByEnumeratingWithState:&v38 objects:v43 count:16];
        if (v22)
        {
          uint64_t v23 = *(void *)v39;
          do
          {
            for (uint64_t i = 0LL; i != v22; ++i)
            {
              if (*(void *)v39 != v23) {
                objc_enumerationMutation(v21);
              }
              uint64_t v25 = *(void **)(*((void *)&v38 + 1) + 8 * i);
              uint64_t v26 = (void *)MEMORY[0x186E3E5D8]();
              uint64_t v27 = -[NSCKRecordZoneMetadata createRecordZoneID](v25);
              uint64_t v28 = (void *)[v27 ownerName];
              if ([v28 isEqualToString:getCloudKitCKCurrentUserDefaultName()]
                && (uint64_t v29 = (void *)[v27 zoneName],
                    [v29 isEqualToString:getCloudKitCKRecordZoneDefaultName()]))
              {
                [v25 setHasRecordZone:1];
                [v25 setSupportsAtomicChanges:1];
              }

              else
              {
                uint64_t v30 = (void *)[v25 ckOwnerName];
                if ([v30 isEqualToString:getCloudKitCKCurrentUserDefaultName()])
                {
                  uint64_t v31 = (void *)[objc_alloc(getCloudKitCKRecordZoneClass()) initWithZoneID:v27];
                  [v34 addObject:v31];
                }

                else
                {
                  [*(id *)(a1 + 56) addObject:v27];
                }
              }

              objc_autoreleasePoolPop(v26);
            }

            uint64_t v22 = [v21 countByEnumeratingWithState:&v38 objects:v43 count:16];
          }

          while (v22);
        }

        if ([v34 count])
        {
          *(void *)(*(void *)(*(void *)(a1 + 80) + 8) + 40) = [objc_alloc((Class)getCloudKitCKModifyRecordZonesOperationClass[0]()) initWithRecordZonesToSave:v34 recordZoneIDsToDelete:0];
          if ([*(id *)(*(void *)(a1 + 48) + 40) options]) {
            -[NSCloudKitMirroringRequestOptions applyToOperation:]( [*(id *)(*(void *)(a1 + 48) + 40) options],  *(void **)(*(void *)(*(void *)(a1 + 80) + 8) + 40));
          }
          objc_initWeak(location, *(id *)(a1 + 48));
          v36[0] = MEMORY[0x1895F87A8];
          v36[1] = 3221225472LL;
          v36[2] = __48__PFCloudKitExporter_checkForZonesNeedingExport__block_invoke_3;
          v36[3] = &unk_189EAA718;
          objc_copyWeak(&v37, location);
          [*(id *)(*(void *)(*(void *)(a1 + 80) + 8) + 40) setModifyRecordZonesCompletionBlock:v36];
          objc_destroyWeak(&v37);
          objc_destroyWeak(location);
        }

        if ([*(id *)(a1 + 40) hasChanges])
        {
          if (([*(id *)(a1 + 40) save:*(void *)(*(void *)(a1 + 64) + 8) + 40] & 1) == 0)
          {
            *(_BYTE *)(*(void *)(*(void *)(a1 + 72) + 8LL) + 24LL) = 0;
            id v32 = *(id *)(*(void *)(*(void *)(a1 + 64) + 8LL) + 40LL);
          }
        }
      }
    }

    else
    {
      *(_BYTE *)(*(void *)(*(void *)(a1 + 72) + 8LL) + 24LL) = 0;
      id v33 = *(id *)(*(void *)(*(void *)(a1 + 64) + 8LL) + 40LL);
    }
  }

void __48__PFCloudKitExporter_checkForZonesNeedingExport__block_invoke_3( uint64_t a1,  uint64_t a2,  uint64_t a3,  uint64_t a4)
{
  id WeakRetained = (dispatch_queue_s **)objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v8 = WeakRetained;
  if (WeakRetained)
  {
    uint64_t v9 = WeakRetained[4];
    v10[0] = MEMORY[0x1895F87A8];
    v10[1] = 3221225472LL;
    v10[2] = __48__PFCloudKitExporter_checkForZonesNeedingExport__block_invoke_4;
    v10[3] = &unk_189EA8980;
    v10[4] = v8;
    v10[5] = a2;
    v10[6] = a3;
    v10[7] = a4;
    dispatch_async(v9, v10);
  }
}

void *__48__PFCloudKitExporter_checkForZonesNeedingExport__block_invoke_4(void *a1)
{
  id v2 = objc_alloc_init(MEMORY[0x1896077E8]);
  BOOL v3 = (void *)a1[4];
  if (v3)
  {
    uint64_t v4 = a1[7];
    if (v4)
    {
      uint64_t v5 = objc_alloc(&OBJC_CLASS___NSCloudKitMirroringResult);
      uint64_t v6 = v3[8];
      if (v6) {
        uint64_t v7 = *(void *)(v6 + 48);
      }
      else {
        uint64_t v7 = 0LL;
      }
      uint64_t v8 = -[NSCloudKitMirroringResult initWithRequest:storeIdentifier:success:madeChanges:error:]( v5,  "initWithRequest:storeIdentifier:success:madeChanges:error:",  v3[5],  v7,  0LL,  0LL,  v4);
      -[PFCloudKitExporter finishExportWithResult:](v3, (uint64_t)v8);
    }

    else
    {
      uint64_t v9 = a1[5];
      uint64_t v15 = 0LL;
      if (-[PFCloudKitExporter updateMetadataForSavedZones:error:]((uint64_t)v3, v9, &v15))
      {
        -[PFCloudKitExporter checkForZonesNeedingExport](v3);
      }

      else
      {
        uint64_t v10 = objc_alloc(&OBJC_CLASS___NSCloudKitMirroringResult);
        uint64_t v11 = v3[8];
        if (v11) {
          uint64_t v12 = *(void *)(v11 + 48);
        }
        else {
          uint64_t v12 = 0LL;
        }
        __int128 v13 = -[NSCloudKitMirroringResult initWithRequest:storeIdentifier:success:madeChanges:error:]( v10,  "initWithRequest:storeIdentifier:success:madeChanges:error:",  v3[5],  v12,  0LL,  0LL,  v15);
        -[PFCloudKitExporter finishExportWithResult:](v3, (uint64_t)v13);
      }
    }

    BOOL v3 = 0LL;
  }

  [v2 drain];
  return v3;
}

- (void)exportIfNecessary
{
  v24[1] = *MEMORY[0x1895F89C0];
  if (a1)
  {
    uint64_t v19 = 0LL;
    uint64_t v20 = &v19;
    uint64_t v21 = 0x2020000000LL;
    char v22 = 1;
    uint64_t v13 = 0LL;
    uint64_t v14 = &v13;
    uint64_t v15 = 0x3052000000LL;
    id v16 = __Block_byref_object_copy__32;
    uint64_t v17 = __Block_byref_object_dispose__32;
    uint64_t v18 = 0LL;
    id v2 = *(id *)(a1 + 64);
    uint64_t v3 = *(void *)(a1 + 40);
    if (v3 && (([*(id *)(v3 + 64) shouldDefer] & 1) != 0 || *(_BYTE *)(v3 + 40)))
    {
      *((_BYTE *)v20 + 24) = 0;
      id v4 = objc_alloc(MEMORY[0x189607870]);
      uint64_t v23 = *MEMORY[0x1896075F0];
      v24[0] = @"The request was aborted because it was deferred by the system.";
      uint64_t v5 = [MEMORY[0x189603F68] dictionaryWithObjects:v24 forKeys:&v23 count:1];
      uint64_t v6 = [v4 initWithDomain:*MEMORY[0x189607460] code:134419 userInfo:v5];
      v14[5] = v6;
    }

    else
    {
      v12[0] = MEMORY[0x1895F87A8];
      v12[1] = 3221225472LL;
      v12[2] = __39__PFCloudKitExporter_exportIfNecessary__block_invoke;
      v12[3] = &unk_189EA7A60;
      v12[4] = v2;
      v12[5] = a1;
      v12[6] = &v19;
      v12[7] = &v13;
      -[PFCloudKitStoreMonitor performBlock:]((uint64_t)v2, (uint64_t)v12);
    }

    if (!*((_BYTE *)v20 + 24))
    {
      uint64_t v7 = objc_alloc(&OBJC_CLASS___NSCloudKitMirroringResult);
      uint64_t v8 = *(void *)(a1 + 64);
      if (v8) {
        uint64_t v9 = *(void *)(v8 + 48);
      }
      else {
        uint64_t v9 = 0LL;
      }
      uint64_t v10 = -[NSCloudKitMirroringResult initWithRequest:storeIdentifier:success:madeChanges:error:]( v7,  "initWithRequest:storeIdentifier:success:madeChanges:error:",  *(void *)(a1 + 40),  v9,  0LL,  0LL,  v14[5]);
      -[PFCloudKitExporter finishExportWithResult:]((void *)a1, (uint64_t)v10);
    }

    id v11 = (id)v14[5];
    v14[5] = 0LL;

    _Block_object_dispose(&v13, 8);
    _Block_object_dispose(&v19, 8);
  }

- (void)finishExportWithResult:(void *)a1
{
  uint64_t v40 = *MEMORY[0x1895F89C0];
  if (a1)
  {
    id v3 = (id)[MEMORY[0x1896078A8] defaultManager];
    id v38 = 0LL;
    __int128 v34 = 0u;
    __int128 v35 = 0u;
    __int128 v36 = 0u;
    __int128 v37 = 0u;
    uint64_t v4 = a1[7];
    id v33 = a1;
    if (v4) {
      uint64_t v5 = *(void **)(v4 + 40);
    }
    else {
      uint64_t v5 = 0LL;
    }
    uint64_t v6 = [v5 countByEnumeratingWithState:&v34 objects:v39 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v35;
      uint64_t v9 = *MEMORY[0x189607460];
      do
      {
        for (uint64_t i = 0LL; i != v7; ++i)
        {
          if (*(void *)v35 != v8) {
            objc_enumerationMutation(v5);
          }
          if (([v3 removeItemAtURL:*(void *)(*((void *)&v34 + 1) + 8 * i) error:&v38] & 1) == 0
            && (!objc_msgSend((id)objc_msgSend(v38, "domain"), "isEqualToString:", v9)
             || [v38 code] != 4))
          {
            id v11 = (void *)MEMORY[0x186E3E5D8]();
            BOOL v12 = __ckLoggingOverride != 0;
            uint64_t v13 = [@"CoreData+CloudKit: %s(%d): " stringByAppendingString:@"Failed to delete asset file: %@\n%@"];
            _NSCoreDataLog( v12,  v13,  v14,  v15,  v16,  v17,  v18,  v19,  (uint64_t)"-[PFCloudKitExporter purgeWrittenAssetURLs]");
            objc_autoreleasePoolPop(v11);
          }
        }

        uint64_t v7 = [v5 countByEnumeratingWithState:&v34 objects:v39 count:16];
      }

      while (v7);
    }

    uint64_t v20 = objc_alloc(&OBJC_CLASS___PFCloudKitExportedRecordBytesMetric);
    uint64_t v21 = v33[3];
    if (v21) {
      char v22 = *(void **)(v21 + 16);
    }
    else {
      char v22 = 0LL;
    }
    uint64_t v23 = -[PFCloudKitSizeMetric initWithContainerIdentifier:]( v20,  "initWithContainerIdentifier:",  [v22 containerIdentifier]);
    unint64_t v24 = (void *)v23;
    uint64_t v25 = v33[7];
    if (v25) {
      uint64_t v26 = *(void *)(v25 + 16);
    }
    else {
      uint64_t v26 = 0LL;
    }
    -[PFCloudKitSizeMetric addByteSize:](v23, v26);
    uint64_t v27 = v33[3];
    if (v27 && (uint64_t v28 = *(void *)(v27 + 16)) != 0) {
      uint64_t v29 = *(void *)(v28 + 72);
    }
    else {
      uint64_t v29 = 0LL;
    }
    -[PFCloudKitMetricsClient logMetric:](v29, v24);

    uint64_t v30 = v33[2];
    if (v30)
    {
      (*(void (**)(uint64_t, uint64_t))(v30 + 16))(v30, a2);
      uint64_t v31 = (void *)v33[2];
    }

    else
    {
      uint64_t v31 = 0LL;
    }

    v33[2] = 0LL;
  }

void __39__PFCloudKitExporter_exportIfNecessary__block_invoke(uint64_t a1)
{
  v13[1] = *MEMORY[0x1895F89C0];
  uint64_t v2 = -[PFCloudKitStoreMonitor retainedMonitoredStore](*(void *)(a1 + 32));
  if (v2)
  {
    id v3 = (void *)v2;
    uint64_t v4 = *(void *)(a1 + 32);
    if (v4)
    {
      id WeakRetained = objc_loadWeakRetained((id *)(v4 + 32));
      uint64_t v6 = *(void *)(a1 + 32);
    }

    else
    {
      uint64_t v6 = 0LL;
      id WeakRetained = 0LL;
    }

    uint64_t v7 = -[PFCloudKitStoreMonitor newBackgroundContextForMonitoredCoordinator](v6);
    -[NSManagedObjectContext setTransactionAuthor:]( v7,  "setTransactionAuthor:",  @"NSCloudKitMirroringDelegate.export");
    -[NSManagedObjectContext _setAllowAncillaryEntities:](v7, "_setAllowAncillaryEntities:", 1LL);
    v10[0] = MEMORY[0x1895F87A8];
    v10[1] = 3221225472LL;
    v10[2] = __39__PFCloudKitExporter_exportIfNecessary__block_invoke_2;
    v10[3] = &unk_189EA7960;
    v10[4] = *(void *)(a1 + 40);
    v10[5] = v3;
    v10[6] = v7;
    __int128 v11 = *(_OWORD *)(a1 + 48);
    -[NSManagedObjectContext performBlockAndWait:](v7, "performBlockAndWait:", v10);
  }

  else
  {
    *(_BYTE *)(*(void *)(*(void *)(a1 + 48) + 8LL) + 24LL) = 0;
    id v8 = objc_alloc(MEMORY[0x189607870]);
    uint64_t v12 = *MEMORY[0x1896075F0];
    v13[0] = [NSString stringWithFormat:@"Request '%@' was cancelled because the store was removed from the coordinator.", objc_msgSend(*(id *)(*(void *)(a1 + 40) + 40), "requestIdentifier")];
    uint64_t v9 = [MEMORY[0x189603F68] dictionaryWithObjects:v13 forKeys:&v12 count:1];
    *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) = [v8 initWithDomain:*MEMORY[0x189607460] code:134407 userInfo:v9];
  }

void __39__PFCloudKitExporter_exportIfNecessary__block_invoke_2(uint64_t a1)
{
  uint64_t v1 = (void *)a1;
  v185[2] = *(id *)MEMORY[0x1895F89C0];
  v173 = 0LL;
  uint64_t v2 = *(id **)(a1 + 32);
  v170 = v2;
  if (!v2) {
    goto LABEL_74;
  }
  uint64_t v4 = *(unsigned __int8 **)(a1 + 40);
  id v3 = *(void **)(a1 + 48);
  v174[0] = 0LL;
  id v169 = objc_alloc_init(MEMORY[0x1896077E8]);
  if (!+[_PFRoutines _isInMemoryStore:]((uint64_t)&OBJC_CLASS____PFRoutines, v4))
  {
    *(void *)buf = 0LL;
    if ((objc_msgSend( v3,  "setQueryGenerationFromToken:error:",  +[NSQueryGenerationToken currentQueryGenerationToken]( NSQueryGenerationToken,  "currentQueryGenerationToken"),  buf) & 1) == 0)
    {
      uint64_t v5 = (void *)MEMORY[0x186E3E5D8]();
      uint64_t v6 = __ckLoggingOverride;
      uint64_t v7 = [@"CoreData+CloudKit: %s(%d): " stringByAppendingString:@"%@: Unable to set query generation on moc: %@"];
      _NSCoreDataLog( v6 != 0,  v7,  v8,  v9,  v10,  v11,  v12,  v13,  (uint64_t)"-[PFCloudKitExporter analyzeHistoryInStore:withManagedObjectContext:error:]");
      objc_autoreleasePoolPop(v5);
    }
  }

  uint64_t v14 = (void *)+[NSCKMetadataEntry entryForKey:fromStore:inManagedObjectContext:error:]( (uint64_t)&OBJC_CLASS___NSCKMetadataEntry,  (uint64_t)@"NSCloudKitMirroringDelegateLastHistoryTokenKey",  (uint64_t)v4,  v3,  (uint64_t)v174);
  if (v174[0])
  {
    uint64_t v15 = (void *)MEMORY[0x186E3E5D8](v174[0]);
    uint64_t v16 = __ckLoggingOverride;
    uint64_t v17 = [@"CoreData+CloudKit: %s(%d): " stringByAppendingString:@"Unable to read the last history token: %@"];
    _NSCoreDataLog( v16 != 0,  v17,  v18,  v19,  v20,  v21,  v22,  v23,  (uint64_t)"-[PFCloudKitExporter analyzeHistoryInStore:withManagedObjectContext:error:]");
    objc_autoreleasePoolPop(v15);
    BOOL v24 = 0;
    uint64_t v25 = 0LL;
  }

  else
  {
    uint64_t v25 = [v14 transformedValue];
    uint64_t v26 = (void *)+[NSCKMetadataEntry entryForKey:fromStore:inManagedObjectContext:error:]( (uint64_t)&OBJC_CLASS___NSCKMetadataEntry,  (uint64_t)@"NSCloudKitMirroringDelegateBypassHistoryOnExportKey",  (uint64_t)v4,  v3,  (uint64_t)v174);
    if (!v174[0])
    {
      int v58 = [v26 BOOLValue];
      BOOL v24 = v58;
      if (v25) {
        int v59 = v58;
      }
      else {
        int v59 = 1;
      }
      if (v59 == 1)
      {
        if (!+[NSCKMetadataEntry updateOrInsertMetadataEntryWithKey:BOOLValue:forStore:intoManagedObjectContext:error:]( (uint64_t)&OBJC_CLASS___NSCKMetadataEntry,  (uint64_t)@"NSCloudKitMirroringDelegateScanForRowsMissingFromHistoryKey",  1,  (uint64_t)v4,  v3,  v174))
        {
          id v60 = v174[0];
          goto LABEL_9;
        }
      }

      else
      {
        BOOL v24 = 0;
      }

      char v36 = 0;
      goto LABEL_10;
    }

    uint64_t v27 = (void *)MEMORY[0x186E3E5D8](v174[0]);
    uint64_t v28 = __ckLoggingOverride;
    uint64_t v29 = [@"CoreData+CloudKit: %s(%d): " stringByAppendingString:@"Unable to read the bypass entry: %@"];
    _NSCoreDataLog( v28 != 0,  v29,  v30,  v31,  v32,  v33,  v34,  v35,  (uint64_t)"-[PFCloudKitExporter analyzeHistoryInStore:withManagedObjectContext:error:]");
    objc_autoreleasePoolPop(v27);
    BOOL v24 = 0;
  }

uint64_t __39__PFCloudKitExporter_exportIfNecessary__block_invoke_3( uint64_t a1,  uint64_t a2,  void *a3,  _BYTE *a4)
{
  uint64_t result = [a3 madeChanges];
  if ((_DWORD)result)
  {
    *(_BYTE *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = 1;
    *a4 = 1;
  }

  return result;
}

void __39__PFCloudKitExporter_executeOperation___block_invoke( uint64_t a1,  uint64_t a2,  uint64_t a3,  uint64_t a4)
{
  id WeakRetained = (dispatch_queue_s **)objc_loadWeakRetained((id *)(a1 + 40));
  uint64_t v9 = WeakRetained;
  if (WeakRetained)
  {
    uint64_t v10 = WeakRetained[4];
    block[0] = MEMORY[0x1895F87A8];
    block[1] = 3221225472LL;
    block[2] = __39__PFCloudKitExporter_executeOperation___block_invoke_2;
    block[3] = &unk_189EAA790;
    uint64_t v11 = *(void *)(a1 + 32);
    block[4] = v9;
    block[5] = v11;
    block[6] = a2;
    block[7] = a3;
    block[8] = a4;
    dispatch_async(v10, block);
  }
}

id __39__PFCloudKitExporter_executeOperation___block_invoke_2(void *a1)
{
  id v2 = objc_alloc_init(MEMORY[0x1896077E8]);
  uint64_t v3 = a1[4];
  if (v3)
  {
    uint64_t v4 = a1[5];
    uint64_t v5 = a1[6];
    uint64_t v7 = a1[7];
    uint64_t v6 = a1[8];
    uint64_t v8 = (void *)MEMORY[0x186E3E5D8]();
    unint64_t v9 = __ckLoggingOverride;
    uint64_t v10 = [@"CoreData+CloudKit: %s(%d): " stringByAppendingString:@"Modify records finished: %@\n%@\n%@"];
    if (v9 >= 3) {
      uint64_t v17 = 3LL;
    }
    else {
      uint64_t v17 = v9;
    }
    _NSCoreDataLog( v17,  v10,  v11,  v12,  v13,  v14,  v15,  v16,  (uint64_t)"-[PFCloudKitExporter exportOperationFinished:withSavedRecords:deletedRecordIDs:operationError:]");
    objc_autoreleasePoolPop(v8);
    if (v6)
    {
      uint64_t v18 = objc_alloc(&OBJC_CLASS___NSCloudKitMirroringResult);
      uint64_t v19 = *(void *)(v3 + 64);
      if (v19) {
        uint64_t v20 = *(void *)(v19 + 48);
      }
      else {
        uint64_t v20 = 0LL;
      }
      uint64_t v21 = -[NSCloudKitMirroringResult initWithRequest:storeIdentifier:success:madeChanges:error:]( v18,  "initWithRequest:storeIdentifier:success:madeChanges:error:",  *(void *)(v3 + 40),  v20,  0,  [*(id *)(v3 + 8) count] != 0,  v6);
      -[PFCloudKitExporter finishExportWithResult:]((void *)v3, (uint64_t)v21);
    }

    else
    {
      uint64_t v21 = (NSCloudKitMirroringResult *)*(id *)(v3 + 64);
      v23[0] = MEMORY[0x1895F87A8];
      v23[1] = 3221225472LL;
      v23[2] = __95__PFCloudKitExporter_exportOperationFinished_withSavedRecords_deletedRecordIDs_operationError___block_invoke;
      v23[3] = &unk_189EAA808;
      v23[4] = v21;
      v23[5] = v3;
      v23[6] = v5;
      v23[7] = v7;
      v23[8] = 0LL;
      v23[9] = v4;
      -[PFCloudKitStoreMonitor performBlock:]((uint64_t)v21, (uint64_t)v23);
    }
  }

  [v2 drain];
  return 0LL;
}

void __95__PFCloudKitExporter_exportOperationFinished_withSavedRecords_deletedRecordIDs_operationError___block_invoke( uint64_t a1)
{
  v41[1] = *MEMORY[0x1895F89C0];
  uint64_t v2 = -[PFCloudKitStoreMonitor retainedMonitoredStore](*(void *)(a1 + 32));
  if (v2)
  {
    uint64_t v3 = (void *)v2;
    uint64_t v4 = *(void *)(a1 + 32);
    if (v4)
    {
      id WeakRetained = objc_loadWeakRetained((id *)(v4 + 32));
      uint64_t v6 = *(void *)(a1 + 32);
    }

    else
    {
      uint64_t v6 = 0LL;
      id WeakRetained = 0LL;
    }

    uint64_t v7 = -[PFCloudKitStoreMonitor newBackgroundContextForMonitoredCoordinator](v6);
    -[NSManagedObjectContext setMergePolicy:](v7, "setMergePolicy:", NSMergeByPropertyObjectTrumpMergePolicy);
    -[NSManagedObjectContext setTransactionAuthor:]( v7,  "setTransactionAuthor:",  @"NSCloudKitMirroringDelegate.export");
    uint64_t v36 = 0LL;
    __int128 v37 = &v36;
    uint64_t v38 = 0x2020000000LL;
    char v39 = 1;
    uint64_t v30 = 0LL;
    uint64_t v31 = &v30;
    uint64_t v32 = 0x3052000000LL;
    uint64_t v33 = __Block_byref_object_copy__32;
    uint64_t v34 = __Block_byref_object_dispose__32;
    uint64_t v35 = 0LL;
    v23[0] = MEMORY[0x1895F87A8];
    v23[1] = 3221225472LL;
    v23[2] = __95__PFCloudKitExporter_exportOperationFinished_withSavedRecords_deletedRecordIDs_operationError___block_invoke_2;
    v23[3] = &unk_189EAA7E0;
    v23[4] = *(void *)(a1 + 40);
    v23[5] = v3;
    __int128 v24 = *(_OWORD *)(a1 + 48);
    uint64_t v8 = *(void *)(a1 + 72);
    uint64_t v25 = *(void *)(a1 + 64);
    uint64_t v26 = v7;
    uint64_t v28 = &v30;
    uint64_t v29 = &v36;
    uint64_t v27 = v8;
    -[NSManagedObjectContext performBlockAndWait:](v7, "performBlockAndWait:", v23);
    unint64_t v9 = objc_alloc(&OBJC_CLASS___NSCloudKitMirroringResult);
    uint64_t v10 = *(void *)(a1 + 40);
    uint64_t v11 = *(void *)(v10 + 64);
    if (v11) {
      uint64_t v12 = *(void *)(v11 + 48);
    }
    else {
      uint64_t v12 = 0LL;
    }
    uint64_t v13 = -[NSCloudKitMirroringResult initWithRequest:storeIdentifier:success:madeChanges:error:]( v9,  "initWithRequest:storeIdentifier:success:madeChanges:error:",  *(void *)(v10 + 40),  v12,  *((unsigned __int8 *)v37 + 24),  *((unsigned __int8 *)v37 + 24),  v31[5]);
    [*(id *)(*(void *)(a1 + 40) + 8) setObject:v13 forKey:*(void *)(a1 + 72)];
    uint64_t v14 = *(void **)(a1 + 40);
    if (*((_BYTE *)v37 + 24)) {
      -[PFCloudKitExporter exportIfNecessary](v14);
    }
    else {
      -[PFCloudKitExporter finishExportWithResult:](v14, (uint64_t)v13);
    }

    v31[5] = 0LL;
    _Block_object_dispose(&v30, 8);
    _Block_object_dispose(&v36, 8);
  }

  else
  {
    uint64_t v15 = objc_alloc(&OBJC_CLASS___NSCloudKitMirroringResult);
    uint64_t v16 = *(void *)(a1 + 40);
    uint64_t v17 = *(void **)(v16 + 40);
    uint64_t v18 = *(void *)(v16 + 64);
    if (v18) {
      uint64_t v19 = *(void *)(v18 + 48);
    }
    else {
      uint64_t v19 = 0LL;
    }
    uint64_t v20 = (void *)MEMORY[0x189607870];
    uint64_t v40 = *MEMORY[0x1896075F0];
    v41[0] = [NSString stringWithFormat:@"Request '%@' was cancelled because the store was removed from the coordinator.", objc_msgSend(v17, "requestIdentifier")];
    uint64_t v21 = [MEMORY[0x189603F68] dictionaryWithObjects:v41 forKeys:&v40 count:1];
    uint64_t v22 = -[NSCloudKitMirroringResult initWithRequest:storeIdentifier:success:madeChanges:error:]( v15,  "initWithRequest:storeIdentifier:success:madeChanges:error:",  v17,  v19,  0,  0,  [v20 errorWithDomain:*MEMORY[0x189607460] code:134407 userInfo:v21]);
    -[PFCloudKitExporter finishExportWithResult:](*(void **)(a1 + 40), (uint64_t)v22);
  }

uint64_t __95__PFCloudKitExporter_exportOperationFinished_withSavedRecords_deletedRecordIDs_operationError___block_invoke_2( uint64_t a1)
{
  uint64_t v98 = *MEMORY[0x1895F89C0];
  if (!-[PFCloudKitExportContext modifyRecordsOperationFinishedForStore:withSavedRecords:deletedRecordIDs:operationError:managedObjectContext:error:]( *(void *)(*(void *)(a1 + 32) + 56LL),  *(void *)(a1 + 40),  *(void *)(a1 + 48),  *(void *)(a1 + 56),  *(void *)(a1 + 64),  *(void **)(a1 + 72),  (void *)(*(void *)(*(void *)(a1 + 88) + 8LL) + 40LL)))
  {
    uint64_t v27 = (void *)MEMORY[0x186E3E5D8]();
    uint64_t v28 = __ckLoggingOverride;
    uint64_t v29 = [@"CoreData+CloudKit: %s(%d): " stringByAppendingString:@"%@ - Failed to update metadadata after operation finished (%@): %@"];
    _NSCoreDataLog( v28 != 0,  v29,  v30,  v31,  v32,  v33,  v34,  v35,  (uint64_t)"-[PFCloudKitExporter exportOperationFinished:withSavedRecords:deletedRecordIDs:operationError:]_block_invoke_2");
LABEL_30:
    objc_autoreleasePoolPop(v27);
    goto LABEL_31;
  }

  uint64_t v76 = *(void *)(a1 + 32);
  if (!v76)
  {
LABEL_31:
    *(_BYTE *)(*(void *)(*(void *)(a1 + 96) + 8LL) + 24LL) = 0;
    return (uint64_t)*(id *)(*(void *)(*(void *)(a1 + 88) + 8LL) + 40LL);
  }

  uint64_t v2 = *(void **)(a1 + 48);
  uint64_t v1 = *(void **)(a1 + 56);
  uint64_t v3 = *(void **)(a1 + 40);
  uint64_t v4 = *(void **)(a1 + 72);
  uint64_t v73 = *(void *)(*(void *)(a1 + 88) + 8LL);
  v90[0] = 0LL;
  id v5 = objc_alloc_init(MEMORY[0x189603FC8]);
  id v6 = objc_alloc_init(MEMORY[0x189603FC8]);
  uint64_t v7 = (void *)+[NSCKRecordMetadata createMapOfMetadataMatchingRecords:andRecordIDs:inStore:withManagedObjectContext:error:]( (uint64_t)&OBJC_CLASS___NSCKRecordMetadata,  v2,  v1,  v3,  v4,  v90);
  if (!v7)
  {
    __int128 v37 = (void *)MEMORY[0x186E3E5D8]();
    uint64_t v38 = __ckLoggingOverride;
    uint64_t v39 = [@"CoreData+CloudKit: %s(%d): " stringByAppendingString:@"%@ - Failed to fetch metadata for post-export update: %@\n%@\n%@"];
    _NSCoreDataLog( v38 != 0,  v39,  v40,  v41,  v42,  v43,  v44,  v45,  (uint64_t)"-[PFCloudKitExporter updateMetadataForSavedRecords:deletedRecordIDs:inStore:withManagedObjectContext:error:]");
    objc_autoreleasePoolPop(v37);
LABEL_55:
    char v50 = 0;
    goto LABEL_56;
  }

  uint64_t v72 = v3;
  id v74 = v6;
  __int128 v88 = 0u;
  __int128 v89 = 0u;
  __int128 v86 = 0u;
  __int128 v87 = 0u;
  uint64_t v8 = [v2 countByEnumeratingWithState:&v86 objects:v97 count:16];
  if (v8)
  {
    uint64_t v9 = *(void *)v87;
    char v77 = 1;
LABEL_6:
    uint64_t v10 = 0LL;
    while (1)
    {
      if (*(void *)v87 != v9) {
        objc_enumerationMutation(v2);
      }
      uint64_t v11 = *(void **)(*((void *)&v86 + 1) + 8 * v10);
      if ((+[PFCloudKitSerializer isMirroredRelationshipRecordType:]( (uint64_t)PFCloudKitSerializer,  (void *)[v11 recordType]) & 1) == 0)
      {
        uint64_t v12 = (void *)[v11 recordType];
        if (([v12 isEqualToString:getCloudKitCKRecordTypeShare[0]()] & 1) == 0)
        {
          uint64_t v13 = (void *)objc_msgSend(v7, "objectForKey:", objc_msgSend(v11, "recordID"));
          if (v13)
          {
            uint64_t v14 = *(void *)(v76 + 24);
            if (v14 && (uint64_t v15 = *(void *)(v14 + 16)) != 0) {
              uint64_t v16 = *(void *)(v15 + 136);
            }
            else {
              uint64_t v16 = 0LL;
            }
            id v17 = -[PFCloudKitArchivingUtilities encodeRecord:error:](v16, (uint64_t)v11, v90);
            if (v17)
            {
              [v13 setEncodedRecord:v17];
              [v13 setCkRecordSystemFields:0];
            }

            else
            {
              char v77 = 0;
            }

            if ([v13 pendingExportTransactionNumber])
            {
              objc_msgSend( v13,  "setLastExportedTransactionNumber:",  objc_msgSend(v13, "pendingExportTransactionNumber"));
              [v13 setPendingExportTransactionNumber:0];
            }
          }

          else
          {
            uint64_t v18 = [NSString stringWithUTF8String:"Metadata Inconsistency: Missing metadata for record: %@"];
            _NSCoreDataLog(17LL, v18, v19, v20, v21, v22, v23, v24, (uint64_t)v11);
            uint64_t v25 = (os_log_s *)__pflogFaultLog;
            if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
            {
              *(_DWORD *)buf = 138412290;
              id v92 = (const char *)v11;
              _os_log_fault_impl( &dword_186681000,  v25,  OS_LOG_TYPE_FAULT,  "CoreData: Metadata Inconsistency: Missing metadata for record: %@",  buf,  0xCu);
            }
          }

          if ((v77 & 1) == 0) {
            break;
          }
        }
      }

      if (v8 == ++v10)
      {
        uint64_t v26 = [v2 countByEnumeratingWithState:&v86 objects:v97 count:16];
        uint64_t v8 = v26;
        if (v26) {
          goto LABEL_6;
        }
        if ((v77 & 1) != 0) {
          goto LABEL_35;
        }
        break;
      }
    }
  }

  else
  {
    char v77 = 1;
LABEL_35:
    __int128 v84 = 0u;
    __int128 v85 = 0u;
    __int128 v82 = 0u;
    __int128 v83 = 0u;
    uint64_t v46 = [v1 countByEnumeratingWithState:&v82 objects:v96 count:16];
    if (v46)
    {
      uint64_t v47 = *(void *)v83;
      do
      {
        for (uint64_t i = 0LL; i != v46; ++i)
        {
          if (*(void *)v83 != v47) {
            objc_enumerationMutation(v1);
          }
          uint64_t v49 = [v7 objectForKey:*(void *)(*((void *)&v82 + 1) + 8 * i)];
          if (v49) {
            [v4 deleteObject:v49];
          }
        }

        uint64_t v46 = [v1 countByEnumeratingWithState:&v82 objects:v96 count:16];
      }

      while (v46);
    }
  }

  char v50 = v77;
  if ((v77 & 1) == 0)
  {
    id v6 = v74;
    goto LABEL_56;
  }

  id v6 = v74;
  id v51 = +[NSCKRecordZoneMoveReceipt moveReceiptsMatchingRecordIDs:inManagedObjectContext:persistentStore:error:]( &OBJC_CLASS___NSCKRecordZoneMoveReceipt,  "moveReceiptsMatchingRecordIDs:inManagedObjectContext:persistentStore:error:",  v1,  v4,  v72,  v90);
  uint64_t v52 = v51;
  if (!v51) {
    goto LABEL_55;
  }
  __int128 v80 = 0u;
  __int128 v81 = 0u;
  __int128 v78 = 0u;
  __int128 v79 = 0u;
  uint64_t v53 = [v51 countByEnumeratingWithState:&v78 objects:v95 count:16];
  if (v53)
  {
    uint64_t v54 = *(void *)v79;
    do
    {
      for (uint64_t j = 0LL; j != v53; ++j)
      {
        if (*(void *)v79 != v54) {
          objc_enumerationMutation(v52);
        }
        [*(id *)(*((void *)&v78 + 1) + 8 * j) setNeedsCloudDelete:0];
      }

      uint64_t v53 = [v52 countByEnumeratingWithState:&v78 objects:v95 count:16];
    }

    while (v53);
  }

- (uint64_t)updateMetadataForSavedZones:(void *)a3 error:
{
  v38[1] = *MEMORY[0x1895F89C0];
  uint64_t v29 = 0LL;
  uint64_t v30 = &v29;
  uint64_t v31 = 0x2020000000LL;
  char v32 = 1;
  uint64_t v23 = 0LL;
  uint64_t v24 = &v23;
  uint64_t v25 = 0x3052000000LL;
  uint64_t v26 = __Block_byref_object_copy__32;
  uint64_t v27 = __Block_byref_object_dispose__32;
  uint64_t v28 = 0LL;
  id v6 = *(id *)(a1 + 64);
  uint64_t v7 = *(void *)(a1 + 40);
  if (v7 && (([*(id *)(v7 + 64) shouldDefer] & 1) != 0 || *(_BYTE *)(v7 + 40)))
  {
    *((_BYTE *)v30 + 24) = 0;
    id v8 = objc_alloc(MEMORY[0x189607870]);
    uint64_t v37 = *MEMORY[0x1896075F0];
    v38[0] = @"The request was aborted because it was deferred by the system.";
    uint64_t v9 = [MEMORY[0x189603F68] dictionaryWithObjects:v38 forKeys:&v37 count:1];
    uint64_t v10 = [v8 initWithDomain:*MEMORY[0x189607460] code:134419 userInfo:v9];
    v24[5] = v10;
  }

  else
  {
    v22[0] = MEMORY[0x1895F87A8];
    v22[1] = 3221225472LL;
    v22[2] = __56__PFCloudKitExporter_updateMetadataForSavedZones_error___block_invoke;
    v22[3] = &unk_189EA7960;
    v22[4] = v6;
    v22[5] = a2;
    v22[6] = a1;
    v22[7] = &v23;
    v22[8] = &v29;
    -[PFCloudKitStoreMonitor performBlock:]((uint64_t)v6, (uint64_t)v22);
  }

  if (!*((_BYTE *)v30 + 24))
  {
    id v13 = (id)v24[5];
    if (v13)
    {
      if (a3) {
        *a3 = v13;
      }
    }

    else
    {
      uint64_t v14 = [NSString stringWithUTF8String:"Illegal attempt to return an error without one in %s:%d"];
      _NSCoreDataLog( 17LL,  v14,  v15,  v16,  v17,  v18,  v19,  v20,  (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Persistence/PFCloudKitExporter.m");
      uint64_t v21 = (os_log_s *)__pflogFaultLog;
      if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 136315394;
        uint64_t v34 = "/Library/Caches/com.apple.xbs/Sources/Persistence/PFCloudKitExporter.m";
        __int16 v35 = 1024;
        int v36 = 1008;
        _os_log_fault_impl( &dword_186681000,  v21,  OS_LOG_TYPE_FAULT,  "CoreData: Illegal attempt to return an error without one in %s:%d",  buf,  0x12u);
      }
    }
  }

  v24[5] = 0LL;
  uint64_t v11 = *((unsigned __int8 *)v30 + 24);
  _Block_object_dispose(&v23, 8);
  _Block_object_dispose(&v29, 8);
  return v11;
}

void __56__PFCloudKitExporter_updateMetadataForSavedZones_error___block_invoke(uint64_t a1)
{
  v16[1] = *MEMORY[0x1895F89C0];
  uint64_t v2 = -[PFCloudKitStoreMonitor retainedMonitoredStore](*(void *)(a1 + 32));
  if (v2)
  {
    uint64_t v3 = (void *)v2;
    uint64_t v4 = *(void *)(a1 + 32);
    if (v4)
    {
      id WeakRetained = objc_loadWeakRetained((id *)(v4 + 32));
      uint64_t v6 = *(void *)(a1 + 32);
    }

    else
    {
      uint64_t v6 = 0LL;
      id WeakRetained = 0LL;
    }

    uint64_t v7 = -[PFCloudKitStoreMonitor newBackgroundContextForMonitoredCoordinator](v6);
    -[NSManagedObjectContext setTransactionAuthor:]( v7,  "setTransactionAuthor:",  @"NSCloudKitMirroringDelegate.export");
    v10[0] = MEMORY[0x1895F87A8];
    v10[1] = 3221225472LL;
    v10[2] = __56__PFCloudKitExporter_updateMetadataForSavedZones_error___block_invoke_2;
    v10[3] = &unk_189EA9290;
    __int128 v11 = *(_OWORD *)(a1 + 40);
    uint64_t v12 = v3;
    id v13 = v7;
    __int128 v14 = *(_OWORD *)(a1 + 56);
    -[NSManagedObjectContext performBlockAndWait:](v7, "performBlockAndWait:", v10);
  }

  else
  {
    *(_BYTE *)(*(void *)(*(void *)(a1 + 64) + 8LL) + 24LL) = 0;
    id v8 = objc_alloc(MEMORY[0x189607870]);
    uint64_t v15 = *MEMORY[0x1896075F0];
    v16[0] = [NSString stringWithFormat:@"Request '%@' was cancelled because the store was removed from the coordinator.", objc_msgSend(*(id *)(*(void *)(a1 + 48) + 40), "requestIdentifier")];
    uint64_t v9 = [MEMORY[0x189603F68] dictionaryWithObjects:v16 forKeys:&v15 count:1];
    *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) = [v8 initWithDomain:*MEMORY[0x189607460] code:134407 userInfo:v9];
  }

uint64_t __56__PFCloudKitExporter_updateMetadataForSavedZones_error___block_invoke_2(uint64_t a1)
{
  uint64_t v20 = *MEMORY[0x1895F89C0];
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  __int128 v18 = 0u;
  uint64_t v2 = *(void **)(a1 + 32);
  uint64_t result = [v2 countByEnumeratingWithState:&v15 objects:v19 count:16];
  uint64_t v4 = result;
  if (result)
  {
    uint64_t v5 = *(void *)v16;
    do
    {
      uint64_t v6 = 0LL;
      do
      {
        if (*(void *)v16 != v5) {
          objc_enumerationMutation(v2);
        }
        uint64_t v7 = *(void **)(*((void *)&v15 + 1) + 8 * v6);
        id v8 = (void *)[v7 zoneID];
        uint64_t v9 = *(void *)(a1 + 40);
        if (v9 && (uint64_t v10 = *(void *)(v9 + 24)) != 0) {
          __int128 v11 = *(void **)(v10 + 16);
        }
        else {
          __int128 v11 = 0LL;
        }
        uint64_t v12 = +[NSCKRecordZoneMetadata zoneMetadataForZoneID:inDatabaseWithScope:forStore:inContext:error:]( (uint64_t)NSCKRecordZoneMetadata,  v8,  [v11 databaseScope],  *(void *)(a1 + 48),  *(void **)(a1 + 56),  *(void *)(*(void *)(a1 + 64) + 8) + 40);
        if (!v12
          || (unint64_t v13 = [v7 capabilities],
              -[NSManagedObject setSupportsFetchChanges:](v12, "setSupportsFetchChanges:", v13 & 1),
              -[NSManagedObject setSupportsRecordSharing:](v12, "setSupportsRecordSharing:", (v13 >> 2) & 1),
              -[NSManagedObject setSupportsAtomicChanges:](v12, "setSupportsAtomicChanges:", (v13 >> 1) & 1),
              -[NSManagedObject setSupportsZoneSharing:](v12, "setSupportsZoneSharing:", (v13 >> 3) & 1),
              -[NSManagedObject setHasRecordZone:](v12, "setHasRecordZone:", 1LL),
              ([*(id *)(a1 + 56) save:*(void *)(*(void *)(a1 + 64) + 8) + 40] & 1) == 0))
        {
          *(_BYTE *)(*(void *)(*(void *)(a1 + 72) + 8LL) + 24LL) = 0;
          id v14 = *(id *)(*(void *)(*(void *)(a1 + 64) + 8LL) + 40LL);
        }

        ++v6;
      }

      while (v4 != v6);
      uint64_t result = [v2 countByEnumeratingWithState:&v15 objects:v19 count:16];
      uint64_t v4 = result;
    }

    while (result);
  }

  return result;
}

void __39__PFCloudKitExporter_fetchRecordZones___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  id WeakRetained = (dispatch_queue_s **)objc_loadWeakRetained((id *)(a1 + 40));
  uint64_t v7 = WeakRetained;
  if (WeakRetained)
  {
    id v8 = WeakRetained[4];
    block[0] = MEMORY[0x1895F87A8];
    block[1] = 3221225472LL;
    block[2] = __39__PFCloudKitExporter_fetchRecordZones___block_invoke_2;
    block[3] = &unk_189EA7A38;
    block[4] = *(void *)(a1 + 32);
    block[5] = a2;
    block[6] = a3;
    dispatch_async(v8, block);
  }
}

void *__39__PFCloudKitExporter_fetchRecordZones___block_invoke_2(void *a1)
{
  id v2 = objc_alloc_init(MEMORY[0x1896077E8]);
  uint64_t v3 = (void *)a1[4];
  if (v3)
  {
    uint64_t v5 = (void *)a1[5];
    uint64_t v4 = a1[6];
    uint64_t v6 = (void *)MEMORY[0x186E3E5D8]();
    unint64_t v7 = __ckLoggingOverride;
    uint64_t v8 = [@"CoreData+CloudKit: %s(%d): " stringByAppendingString:@"%@: Finished fetching record zones: %@ - %@"];
    if (v7 >= 0x10) {
      uint64_t v15 = 16LL;
    }
    else {
      uint64_t v15 = v7;
    }
    _NSCoreDataLog( v15,  v8,  v9,  v10,  v11,  v12,  v13,  v14,  (uint64_t)"-[PFCloudKitExporter fetchRecordZonesOperationFinished:operationError:]");
    objc_autoreleasePoolPop(v6);
    if (v4)
    {
      __int128 v16 = objc_alloc(&OBJC_CLASS___NSCloudKitMirroringResult);
      uint64_t v17 = v3[8];
      if (v17) {
        uint64_t v18 = *(void *)(v17 + 48);
      }
      else {
        uint64_t v18 = 0LL;
      }
      uint64_t v19 = -[NSCloudKitMirroringResult initWithRequest:storeIdentifier:success:madeChanges:error:]( v16,  "initWithRequest:storeIdentifier:success:madeChanges:error:",  v3[5],  v18,  0LL,  0LL,  v4);
      -[PFCloudKitExporter finishExportWithResult:](v3, (uint64_t)v19);
    }

    else
    {
      uint64_t v25 = 0LL;
      if (-[PFCloudKitExporter updateMetadataForSavedZones:error:]( (uint64_t)v3,  [v5 allValues],  &v25))
      {
        -[PFCloudKitExporter exportIfNecessary]((uint64_t)v3);
      }

      else
      {
        uint64_t v20 = objc_alloc(&OBJC_CLASS___NSCloudKitMirroringResult);
        uint64_t v21 = v3[8];
        if (v21) {
          uint64_t v22 = *(void *)(v21 + 48);
        }
        else {
          uint64_t v22 = 0LL;
        }
        uint64_t v23 = -[NSCloudKitMirroringResult initWithRequest:storeIdentifier:success:madeChanges:error:]( v20,  "initWithRequest:storeIdentifier:success:madeChanges:error:",  v3[5],  v22,  0LL,  0LL,  v25);
        -[PFCloudKitExporter finishExportWithResult:](v3, (uint64_t)v23);
      }
    }

    uint64_t v3 = 0LL;
  }

  [v2 drain];
  return v3;
}

- (void).cxx_destruct
{
}

@end