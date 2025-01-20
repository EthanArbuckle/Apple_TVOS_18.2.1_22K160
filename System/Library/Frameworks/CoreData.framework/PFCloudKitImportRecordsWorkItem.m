@interface PFCloudKitImportRecordsWorkItem
- (BOOL)applyAccumulatedChangesToStore:(id)a3 inManagedObjectContext:(id)a4 withStoreMonitor:(id)a5 madeChanges:(BOOL *)a6 error:(id *)a7;
- (BOOL)checkForActiveImportOperationInStore:(void *)a3 inManagedObjectContext:(uint64_t *)a4 error:;
- (BOOL)commitMetadataChangesWithContext:(id)a3 forStore:(id)a4 error:(id *)a5;
- (BOOL)updateMetadataForAccumulatedChangesInContext:(id)a3 inStore:(id)a4 error:(id *)a5;
- (NSString)description;
- (PFCloudKitImportRecordsWorkItem)initWithOptions:(id)a3 request:(id)a4;
- (id)cloudKitSerializer:(id)a3 safeSaveURLForAsset:(id)a4;
- (id)createMirroringResultForRequest:(id)a3 storeIdentifier:(id)a4 success:(BOOL)a5 madeChanges:(BOOL)a6 error:(id)a7;
- (id)entityNameToAttributesToUpdate;
- (id)entityNameToRelationshipsToUpdate;
- (void)addDeletedRecordID:(uint64_t)a3 ofType:;
- (void)addUpdatedRecord:(id)a3;
- (void)checkAndApplyChangesIfNeeded:(uint64_t)a1;
- (void)cloudKitSerializer:(id)a3 failedToUpdateRelationship:(id)a4 withError:(id)a5;
- (void)dealloc;
- (void)doWorkForStore:(id)a3 inMonitor:(id)a4 completion:(id)a5;
- (void)executeImportOperationsAndAccumulateRecordsWithManagedObjectContext:(id)a3 completion:(id)a4;
- (void)fetchOperationFinishedWithError:(uint64_t)a3 completion:;
- (void)removeDownloadedAssetFiles;
@end

@implementation PFCloudKitImportRecordsWorkItem

- (PFCloudKitImportRecordsWorkItem)initWithOptions:(id)a3 request:(id)a4
{
  v11.receiver = self;
  v11.super_class = (Class)&OBJC_CLASS___PFCloudKitImportRecordsWorkItem;
  v5 = -[PFCloudKitImporterWorkItem initWithOptions:request:](&v11, sel_initWithOptions_request_, a3, a4);
  if (v5)
  {
    v5->_importOperationIdentifier = (NSUUID *)objc_alloc_init(MEMORY[0x189607AB8]);
    v5->_assetPathToSafeSaveURL = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x189603FC8]);
    v5->_updatedRecords = (NSMutableArray *)objc_alloc_init(MEMORY[0x189603FA8]);
    v5->_recordTypeToDeletedRecordID = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x189603FC8]);
    v5->_allRecordIDs = (NSMutableArray *)objc_alloc_init(MEMORY[0x189603FA8]);
    v5->_totalOperationBytes = 0LL;
    v5->_currentOperationBytes = 0LL;
    v5->_countUpdatedRecords = 0LL;
    v5->_countDeletedRecords = 0LL;
    v5->_encounteredErrors = (NSMutableArray *)objc_alloc_init(MEMORY[0x189603FA8]);
    v5->_failedRelationships = (NSMutableArray *)objc_alloc_init(MEMORY[0x189603FA8]);
    v6 = objc_alloc(&OBJC_CLASS___PFCloudKitFetchedRecordBytesMetric);
    if (a3) {
      v7 = (void *)*((void *)a3 + 3);
    }
    else {
      v7 = 0LL;
    }
    v5->_fetchedRecordBytesMetric = -[PFCloudKitSizeMetric initWithContainerIdentifier:]( v6,  "initWithContainerIdentifier:",  [v7 containerIdentifier]);
    v8 = objc_alloc(&OBJC_CLASS___PFCloudKitFetchedAssetBytesMetric);
    if (a3) {
      v9 = (void *)*((void *)a3 + 3);
    }
    else {
      v9 = 0LL;
    }
    v5->_fetchedAssetBytesMetric = -[PFCloudKitSizeMetric initWithContainerIdentifier:]( v8,  "initWithContainerIdentifier:",  [v9 containerIdentifier]);
    v5->_incrementalResults = (NSMutableArray *)objc_alloc_init(MEMORY[0x189603FA8]);
    v5->_unknownItemRecordIDs = (NSMutableArray *)objc_alloc_init(MEMORY[0x189603FA8]);
    v5->_updatedShares = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x189603FC8]);
  }

  return v5;
}

- (void)dealloc
{
  self->_importOperationIdentifier = 0LL;
  self->_assetPathToSafeSaveURL = 0LL;

  self->_updatedRecords = 0LL;
  self->_recordTypeToDeletedRecordID = 0LL;

  self->_allRecordIDs = 0LL;
  self->_encounteredErrors = 0LL;

  self->_failedRelationships = 0LL;
  self->_fetchedRecordBytesMetric = 0LL;

  self->_fetchedAssetBytesMetric = 0LL;
  self->_incrementalResults = 0LL;

  self->_unknownItemRecordIDs = 0LL;
  self->_updatedShares = 0LL;
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___PFCloudKitImportRecordsWorkItem;
  -[PFCloudKitImporterWorkItem dealloc](&v3, sel_dealloc);
}

- (NSString)description
{
  id v3 = objc_alloc(MEMORY[0x189607940]);
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  if (self) {
    request = self->super._request;
  }
  else {
    request = 0LL;
  }
  return (NSString *)(id)[v3 initWithFormat:@"<%@: %p - %@>", v5, self, request];
}

- (void)doWorkForStore:(id)a3 inMonitor:(id)a4 completion:(id)a5
{
  v15[1] = *MEMORY[0x1895F89C0];
  v8 = -[PFCloudKitStoreMonitor newBackgroundContextForMonitoredCoordinator]((uint64_t)a4);
  if (self
    && (request = self->super._request) != 0LL
    && ((-[CKSchedulerActivity shouldDefer](request->super._schedulerActivity, "shouldDefer") & 1) != 0
     || request->super._deferredByBackgroundTimeout))
  {
    if (a5)
    {
      v10 = (void *)MEMORY[0x189607870];
      uint64_t v14 = *MEMORY[0x1896075F0];
      v15[0] = @"The request was aborted because it was deferred by the system.";
      uint64_t v11 = [MEMORY[0x189603F68] dictionaryWithObjects:v15 forKeys:&v14 count:1];
      id v12 = -[PFCloudKitImportRecordsWorkItem createMirroringResultForRequest:storeIdentifier:success:madeChanges:error:]( self,  "createMirroringResultForRequest:storeIdentifier:success:madeChanges:error:",  self->super._request,  [a3 identifier],  0,  0,  objc_msgSend(v10, "errorWithDomain:code:userInfo:", *MEMORY[0x189607460], 134419, v11));
      (*((void (**)(id, id))a5 + 2))(a5, v12);
    }
  }

  else
  {
    v13[0] = MEMORY[0x1895F87A8];
    v13[1] = 3221225472LL;
    v13[2] = __71__PFCloudKitImportRecordsWorkItem_doWorkForStore_inMonitor_completion___block_invoke;
    v13[3] = &unk_189EA7A38;
    v13[4] = v8;
    v13[5] = self;
    v13[6] = a3;
    -[NSManagedObjectContext performBlockAndWait:](v8, "performBlockAndWait:", v13);
    -[PFCloudKitImportRecordsWorkItem executeImportOperationsAndAccumulateRecordsWithManagedObjectContext:completion:]( self,  "executeImportOperationsAndAccumulateRecordsWithManagedObjectContext:completion:",  v8,  a5);
  }
}

void __71__PFCloudKitImportRecordsWorkItem_doWorkForStore_inMonitor_completion___block_invoke(uint64_t a1)
{
  uint64_t v17 = *MEMORY[0x1895F89C0];
  uint64_t v14 = 0LL;
  v2 = +[NSEntityDescription insertNewObjectForEntityForName:inManagedObjectContext:]( &OBJC_CLASS___NSEntityDescription,  "insertNewObjectForEntityForName:inManagedObjectContext:",  +[NSCKImportOperation entityPath](),  *(void *)(a1 + 32));
  id v3 = v2;
  uint64_t v4 = *(void *)(a1 + 40);
  if (v4) {
    uint64_t v5 = *(void *)(v4 + 32);
  }
  else {
    uint64_t v5 = 0LL;
  }
  -[NSManagedObject setOperationUUID:](v2, "setOperationUUID:", v5);
  -[NSManagedObject setImportDate:](v3, "setImportDate:", [MEMORY[0x189603F50] date]);
  [*(id *)(a1 + 32) assignObject:v3 toPersistentStore:*(void *)(a1 + 48)];
  if (([*(id *)(a1 + 32) save:&v14] & 1) == 0)
  {
    uint64_t v6 = [NSString stringWithUTF8String:"Failed to save import operation: %@"];
    _NSCoreDataLog(17LL, v6, v7, v8, v9, v10, v11, v12, v14);
    v13 = (os_log_s *)__pflogFaultLog;
    if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 138412290;
      uint64_t v16 = v14;
      _os_log_fault_impl( &dword_186681000,  v13,  OS_LOG_TYPE_FAULT,  "CoreData: Failed to save import operation: %@",  buf,  0xCu);
    }
  }

- (void)executeImportOperationsAndAccumulateRecordsWithManagedObjectContext:(id)a3 completion:(id)a4
{
}

void __81__PFCloudKitImportRecordsWorkItem_newMirroringResultByApplyingAccumulatedChanges__block_invoke( uint64_t a1)
{
  uint64_t v66 = *MEMORY[0x1895F89C0];
  uint64_t v55 = 0LL;
  v56 = &v55;
  uint64_t v57 = 0x3052000000LL;
  v58 = __Block_byref_object_copy__40;
  v59 = __Block_byref_object_dispose__40;
  uint64_t v60 = 0LL;
  unsigned __int8 v54 = 0;
  uint64_t v50 = 0LL;
  v51 = &v50;
  uint64_t v52 = 0x2020000000LL;
  char v53 = 1;
  v2 = (void *)-[PFCloudKitStoreMonitor retainedMonitoredStore](*(void *)(a1 + 32));
  if (v2)
  {
    uint64_t v3 = *(void *)(a1 + 32);
    if (v3)
    {
      id WeakRetained = objc_loadWeakRetained((id *)(v3 + 32));
      uint64_t v5 = *(void *)(a1 + 32);
    }

    else
    {
      uint64_t v5 = 0LL;
      id WeakRetained = 0LL;
    }

    uint64_t v6 = -[PFCloudKitStoreMonitor newBackgroundContextForMonitoredCoordinator](v5);
    -[NSManagedObjectContext setTransactionAuthor:]( v6,  "setTransactionAuthor:",  @"NSCloudKitMirroringDelegate.import");
    int v7 = [*(id *)(a1 + 40) applyAccumulatedChangesToStore:v2 inManagedObjectContext:v6 withStoreMonitor:*(void *)(a1 + 32) madeChanges:&v54 error:v56 + 5];
    *((_BYTE *)v51 + 24) = v7;
    if (v7)
    {
      uint64_t v8 = *(void *)(a1 + 32);
      if (v8 && *(_BYTE *)(v8 + 21))
      {
        uint64_t v9 = (void *)MEMORY[0x189607870];
        uint64_t v63 = *MEMORY[0x1896075F0];
        uint64_t v10 = *(void *)(a1 + 40);
        if (v10) {
          uint64_t v11 = *(void **)(v10 + 16);
        }
        else {
          uint64_t v11 = 0LL;
        }
        uint64_t v64 = [NSString stringWithFormat:@"Request '%@' was cancelled because the store was removed from the coordinator.", objc_msgSend(v11, "requestIdentifier")];
        uint64_t v12 = [MEMORY[0x189603F68] dictionaryWithObjects:&v64 forKeys:&v63 count:1];
        uint64_t v13 = [v9 errorWithDomain:*MEMORY[0x189607460] code:134407 userInfo:v12];
        uint64_t v14 = *(void **)(a1 + 40);
        if (v14) {
          uint64_t v15 = v14[2];
        }
        else {
          uint64_t v15 = 0LL;
        }
        uint64_t v16 = objc_msgSend( v14,  "createMirroringResultForRequest:storeIdentifier:success:madeChanges:error:",  v15,  objc_msgSend(v2, "identifier"),  0,  0,  v13);
      }

      else
      {
        v49[0] = MEMORY[0x1895F87A8];
        v49[1] = 3221225472LL;
        v49[2] = __81__PFCloudKitImportRecordsWorkItem_newMirroringResultByApplyingAccumulatedChanges__block_invoke_2;
        v49[3] = &unk_189EA7960;
        v49[4] = v2;
        v49[5] = v6;
        v49[6] = *(void *)(a1 + 40);
        v49[7] = &v55;
        v49[8] = &v50;
        uint64_t v28 = -[NSManagedObjectContext performBlockAndWait:](v6, "performBlockAndWait:", v49);
        if (*((_BYTE *)v51 + 24))
        {
          v29 = (void *)MEMORY[0x186E3E5D8](v28);
          else {
            uint64_t v30 = __ckLoggingOverride;
          }
          uint64_t v31 = [@"CoreData+CloudKit: %s(%d): " stringByAppendingString:@"Finished importing changes for request: %@"];
          _NSCoreDataLog( v30,  v31,  v32,  v33,  v34,  v35,  v36,  v37,  (uint64_t)"-[PFCloudKitImportRecordsWorkItem newMirroringResultByApplyingAccumulatedChanges]_block_invoke");
          objc_autoreleasePoolPop(v29);
        }

        if (!v54)
        {
          if ([*(id *)(*(void *)(a1 + 40) + 104) count])
          {
            __int128 v47 = 0u;
            __int128 v48 = 0u;
            __int128 v45 = 0u;
            __int128 v46 = 0u;
            v41 = *(void **)(*(void *)(a1 + 40) + 104LL);
            uint64_t v42 = [v41 countByEnumeratingWithState:&v45 objects:v65 count:16];
            if (v42)
            {
              uint64_t v43 = *(void *)v46;
              while (2)
              {
                for (uint64_t i = 0LL; i != v42; ++i)
                {
                  if (*(void *)v46 != v43) {
                    objc_enumerationMutation(v41);
                  }
                  if ([*(id *)(*((void *)&v45 + 1) + 8 * i) madeChanges])
                  {
                    unsigned __int8 v54 = 1;
                    goto LABEL_26;
                  }
                }

                uint64_t v42 = [v41 countByEnumeratingWithState:&v45 objects:v65 count:16];
                if (v42) {
                  continue;
                }
                break;
              }
            }
          }
        }

- (BOOL)checkForActiveImportOperationInStore:(void *)a3 inManagedObjectContext:(uint64_t *)a4 error:
{
  v26[1] = *MEMORY[0x1895F89C0];
  if (!a1) {
    return 0LL;
  }
  uint64_t v20 = 0LL;
  unint64_t v6 = (unint64_t)+[NSCKImportOperation fetchOperationWithIdentifier:fromStore:inManagedObjectContext:error:]( (uint64_t)&OBJC_CLASS___NSCKImportOperation,  *(void *)(a1 + 32),  a2,  a3,  (uint64_t)&v20);
  uint64_t v7 = v20;
  BOOL v8 = v6 != 0;
  if (v6 | v20)
  {
    if (v6) {
      return v8;
    }
    if (v20) {
      goto LABEL_5;
    }
  }

  else
  {
    uint64_t v9 = (void *)MEMORY[0x189607870];
    uint64_t v10 = *MEMORY[0x189607460];
    uint64_t v25 = *MEMORY[0x1896075F0];
    v26[0] = [NSString stringWithFormat:@"The request '%@' was cancelled because it conflicted with another active import operation.", *(void *)(a1 + 16)];
    uint64_t v7 = objc_msgSend( v9,  "errorWithDomain:code:userInfo:",  v10,  134407,  objc_msgSend(MEMORY[0x189603F68], "dictionaryWithObjects:forKeys:count:", v26, &v25, 1));
    uint64_t v20 = v7;
    if (v7)
    {
LABEL_5:
      if (a4) {
        *a4 = v7;
      }
      return v8;
    }
  }

  uint64_t v11 = [NSString stringWithUTF8String:"Illegal attempt to return an error without one in %s:%d"];
  _NSCoreDataLog( 17LL,  v11,  v12,  v13,  v14,  v15,  v16,  v17,  (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Persistence/PFCloudKitImportRecordsWorkItem.m");
  uint64_t v18 = (os_log_s *)__pflogFaultLog;
  if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
  {
    *(_DWORD *)buf = 136315394;
    v22 = "/Library/Caches/com.apple.xbs/Sources/Persistence/PFCloudKitImportRecordsWorkItem.m";
    __int16 v23 = 1024;
    int v24 = 866;
    _os_log_fault_impl( &dword_186681000,  v18,  OS_LOG_TYPE_FAULT,  "CoreData: Illegal attempt to return an error without one in %s:%d",  buf,  0x12u);
  }

  return v8;
}

- (BOOL)applyAccumulatedChangesToStore:(id)a3 inManagedObjectContext:(id)a4 withStoreMonitor:(id)a5 madeChanges:(BOOL *)a6 error:(id *)a7
{
  uint64_t v59 = *MEMORY[0x1895F89C0];
  uint64_t v49 = 0LL;
  uint64_t v50 = &v49;
  uint64_t v51 = 0x2020000000LL;
  char v52 = 1;
  uint64_t v45 = 0LL;
  __int128 v46 = &v45;
  uint64_t v47 = 0x2020000000LL;
  char v48 = 0;
  uint64_t v39 = 0LL;
  uint64_t v40 = &v39;
  uint64_t v41 = 0x3052000000LL;
  uint64_t v42 = __Block_byref_object_copy__40;
  uint64_t v43 = __Block_byref_object_dispose__40;
  uint64_t v44 = 0LL;
  if (-[NSMutableArray count](self->_updatedRecords, "count")
    || -[NSMutableDictionary count](self->_recordTypeToDeletedRecordID, "count")
    || -[NSMutableArray count](self->_unknownItemRecordIDs, "count")
    || -[NSMutableDictionary count](self->_updatedShares, "count"))
  {
    if (a5 && *((_BYTE *)a5 + 21))
    {
      *((_BYTE *)v50 + 24) = 0;
      id v13 = objc_alloc(MEMORY[0x189607870]);
      uint64_t v53 = *MEMORY[0x1896075F0];
      uint64_t v54 = [NSString stringWithFormat:@"Request '%@' was cancelled because the store was removed from the coordinator.", -[NSCloudKitMirroringRequest requestIdentifier](self->super._request, "requestIdentifier")];
      uint64_t v14 = [MEMORY[0x189603F68] dictionaryWithObjects:&v54 forKeys:&v53 count:1];
      uint64_t v15 = [v13 initWithDomain:*MEMORY[0x189607460] code:134407 userInfo:v14];
      v40[5] = v15;
    }

    else
    {
      v38[0] = MEMORY[0x1895F87A8];
      v38[1] = 3221225472LL;
      v38[2] = __124__PFCloudKitImportRecordsWorkItem_applyAccumulatedChangesToStore_inManagedObjectContext_withStoreMonitor_madeChanges_error___block_invoke;
      v38[3] = &unk_189EA7B00;
      v38[4] = a3;
      v38[5] = a4;
      v38[6] = self;
      v38[7] = &v39;
      v38[8] = &v45;
      v38[9] = &v49;
      uint64_t v16 = [a4 performBlockAndWait:v38];
      if (*((_BYTE *)v50 + 24))
      {
        uint64_t v17 = (void *)MEMORY[0x186E3E5D8](v16);
        unint64_t v18 = __ckLoggingOverride;
        uint64_t v19 = [@"CoreData+CloudKit: %s(%d): " stringByAppendingString:@"Finished importing applying changes for request: %@"];
        if (v18 >= 3) {
          uint64_t v26 = 3LL;
        }
        else {
          uint64_t v26 = v18;
        }
        _NSCoreDataLog( v26,  v19,  v20,  v21,  v22,  v23,  v24,  v25,  (uint64_t)"-[PFCloudKitImportRecordsWorkItem applyAccumulatedChangesToStore:inManagedObjectContext:withStoreMoni tor:madeChanges:error:]");
        objc_autoreleasePoolPop(v17);
      }
    }
  }

  else
  {
    *((_BYTE *)v50 + 24) = 1;
    *((_BYTE *)v46 + 24) = 0;
  }

  *a6 = *((_BYTE *)v46 + 24);
  if (!*((_BYTE *)v50 + 24))
  {
    id v29 = (id)v40[5];
    if (v29)
    {
      if (a7) {
        *a7 = v29;
      }
    }

    else
    {
      uint64_t v30 = [NSString stringWithUTF8String:"Illegal attempt to return an error without one in %s:%d"];
      _NSCoreDataLog( 17LL,  v30,  v31,  v32,  v33,  v34,  v35,  v36,  (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Persistence/PFCloudKitImportRecordsWorkItem.m");
      uint64_t v37 = (os_log_s *)__pflogFaultLog;
      if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 136315394;
        v56 = "/Library/Caches/com.apple.xbs/Sources/Persistence/PFCloudKitImportRecordsWorkItem.m";
        __int16 v57 = 1024;
        int v58 = 536;
        _os_log_fault_impl( &dword_186681000,  v37,  OS_LOG_TYPE_FAULT,  "CoreData: Illegal attempt to return an error without one in %s:%d",  buf,  0x12u);
      }
    }
  }

  v40[5] = 0LL;
  char v27 = *((_BYTE *)v50 + 24);
  _Block_object_dispose(&v39, 8);
  _Block_object_dispose(&v45, 8);
  _Block_object_dispose(&v49, 8);
  return v27;
}

void __124__PFCloudKitImportRecordsWorkItem_applyAccumulatedChangesToStore_inManagedObjectContext_withStoreMonitor_madeChanges_error___block_invoke( uint64_t a1)
{
  uint64_t v154 = *MEMORY[0x1895F89C0];
  if (!+[_PFRoutines _isInMemoryStore:]((uint64_t)&OBJC_CLASS____PFRoutines, *(unsigned __int8 **)(a1 + 32)))
  {
    *(void *)buf = 0LL;
    if ((objc_msgSend( *(id *)(a1 + 40),  "setQueryGenerationFromToken:error:",  +[NSQueryGenerationToken currentQueryGenerationToken]( NSQueryGenerationToken,  "currentQueryGenerationToken"),  buf) & 1) == 0)
    {
      v2 = (void *)MEMORY[0x186E3E5D8]();
      uint64_t v3 = __ckLoggingOverride;
      uint64_t v4 = [@"CoreData+CloudKit: %s(%d): " stringByAppendingString:@"%@: Unable to set query generation on managedObjectContext: %@"];
      _NSCoreDataLog( v3 != 0,  v4,  v5,  v6,  v7,  v8,  v9,  v10,  (uint64_t)"-[PFCloudKitImportRecordsWorkItem applyAccumulatedChangesToStore:inManagedObjectContext:withStoreMonito r:madeChanges:error:]_block_invoke");
      objc_autoreleasePoolPop(v2);
    }
  }

  if (!-[PFCloudKitImportRecordsWorkItem checkForActiveImportOperationInStore:inManagedObjectContext:error:]( *(void *)(a1 + 48),  *(void *)(a1 + 32),  *(void **)(a1 + 40),  (uint64_t *)(*(void *)(*(void *)(a1 + 56) + 8LL) + 40LL)))
  {
    *(_BYTE *)(*(void *)(*(void *)(a1 + 72) + 8LL) + 24LL) = 0;
    v131 = 0LL;
    v133 = 0LL;
    id v63 = *(id *)(*(void *)(*(void *)(a1 + 56) + 8LL) + 40LL);
    goto LABEL_49;
  }

  v133 = objc_alloc_init(&OBJC_CLASS___PFCloudKitMetadataCache);
  uint64_t v11 = objc_alloc(&OBJC_CLASS___PFCloudKitSerializer);
  uint64_t v12 = *(void *)(a1 + 48);
  if (v12 && (uint64_t v13 = *(void *)(v12 + 8)) != 0) {
    uint64_t v14 = *(void *)(v13 + 24);
  }
  else {
    uint64_t v14 = 0LL;
  }
  uint64_t v15 = -[PFCloudKitSerializer initWithMirroringOptions:metadataCache:recordNamePrefix:]( v11,  "initWithMirroringOptions:metadataCache:recordNamePrefix:",  v14,  v133,  0LL);
  v131 = (void *)v15;
  if (v15) {
    objc_storeWeak((id *)(v15 + 32), *(id *)(a1 + 48));
  }
  uint64_t v16 = *(void *)(a1 + 48);
  uint64_t v17 = *(void *)(v16 + 80);
  uint64_t v18 = *(void *)(v16 + 8);
  if (v18) {
    uint64_t v19 = *(void *)(v18 + 24);
  }
  else {
    uint64_t v19 = 0LL;
  }
  if (!-[PFCloudKitMetadataCache cacheMetadataForObjectsWithIDs:andRecordsWithIDs:inStore:withManagedObjectContext:mirroringOptions:error:]( (id *)&v133->super.isa,  MEMORY[0x189604A58],  v17,  *(void **)(a1 + 32),  *(void **)(a1 + 40),  v19,  (void *)(*(void *)(*(void *)(a1 + 56) + 8LL) + 40LL))) {
    goto LABEL_48;
  }
  __int128 v144 = 0u;
  __int128 v145 = 0u;
  __int128 v142 = 0u;
  __int128 v143 = 0u;
  uint64_t v20 = *(void **)(*(void *)(a1 + 48) + 112LL);
  uint64_t v21 = [v20 countByEnumeratingWithState:&v142 objects:v153 count:16];
  if (v21)
  {
    uint64_t v22 = *(void *)v143;
    do
    {
      for (uint64_t i = 0LL; i != v21; ++i)
      {
        if (*(void *)v143 != v22) {
          objc_enumerationMutation(v20);
        }
        uint64_t v24 = *(void *)(*((void *)&v142 + 1) + 8 * i);
        uint64_t v25 = (void *)MEMORY[0x186E3E5D8]();
        uint64_t v26 = (void *)-[PFCloudKitMetadataCache recordMetadataForRecordID:]((uint64_t)v133, v24);
        if (v26)
        {
          uint64_t v27 = objc_msgSend( (id)objc_msgSend( (id)objc_msgSend(*(id *)(a1 + 32), "model"),  "entityForID:",  objc_msgSend((id)objc_msgSend(v26, "entityId"), "unsignedLongValue")),  "entityDescription");
          if (v27)
          {
            uint64_t v28 = +[PFCloudKitSerializer recordTypeForEntity:]((uint64_t)&OBJC_CLASS___PFCloudKitSerializer, v27);
            id v29 = (id)[*(id *)(*(void *)(a1 + 48) + 72) objectForKey:v28];
            if (!v29)
            {
              id v29 = objc_alloc_init(MEMORY[0x189603FA8]);
              [*(id *)(*(void *)(a1 + 48) + 72) setObject:v29 forKey:v28];
            }

            [v29 addObject:v24];
          }

          else
          {
            uint64_t v30 = [NSString stringWithUTF8String:"CloudKit Import: Failed to find entity for unknown item recordID: %@ - %@"];
            _NSCoreDataLog(17LL, v30, v31, v32, v33, v34, v35, v36, v24);
            uint64_t v37 = (os_log_s *)__pflogFaultLog;
            if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
            {
              *(_DWORD *)buf = 138412546;
              *(void *)&uint8_t buf[4] = v24;
              __int16 v151 = 2112;
              v152 = v26;
              _os_log_fault_impl( &dword_186681000,  v37,  OS_LOG_TYPE_FAULT,  "CoreData: CloudKit Import: Failed to find entity for unknown item recordID: %@ - %@",  buf,  0x16u);
            }
          }
        }

        objc_autoreleasePoolPop(v25);
      }

      uint64_t v21 = [v20 countByEnumeratingWithState:&v142 objects:v153 count:16];
    }

    while (v21);
  }

  v38 = (void *)MEMORY[0x186E3E5D8]();
  unint64_t v39 = __ckLoggingOverride;
  uint64_t v40 = [@"CoreData+CloudKit: %s(%d): " stringByAppendingString:@"%@ - Importing updated records:\n%@\nDeleted RecordIDs:\n%@"];
  uint64_t v47 = v39 >= 9 ? 9LL : v39;
  uint64_t v130 = *(void *)(*(void *)(a1 + 48) + 72LL);
  _NSCoreDataLog( v47,  v40,  v41,  v42,  v43,  v44,  v45,  v46,  (uint64_t)"-[PFCloudKitImportRecordsWorkItem applyAccumulatedChangesToStore:inManagedObjectContext:withStoreMonitor:ma deChanges:error:]_block_invoke");
  objc_autoreleasePoolPop(v38);
  if (!-[PFCloudKitSerializer applyUpdatedRecords:deletedRecordIDs:toStore:inManagedObjectContext:onlyUpdatingAttributes:andRelationships:madeChanges:error:]( (uint64_t)v131,  *(void *)(*(void *)(a1 + 48) + 40),  *(void *)(*(void *)(a1 + 48) + 72),  *(void *)(a1 + 32),  *(void **)(a1 + 40),  [*(id *)(a1 + 48) entityNameToAttributesToUpdate],  objc_msgSend(*(id *)(a1 + 48), "entityNameToRelationshipsToUpdate"),  *(void *)(*(void *)(a1 + 64) + 8) + 24,  (void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40)))
  {
LABEL_48:
    *(_BYTE *)(*(void *)(*(void *)(a1 + 72) + 8LL) + 24LL) = 0;
    id v64 = *(id *)(*(void *)(*(void *)(a1 + 56) + 8LL) + 40LL);
    goto LABEL_49;
  }

  *(_BYTE *)(*(void *)(*(void *)(a1 + 72) + 8) + 24) = [*(id *)(a1 + 48) updateMetadataForAccumulatedChangesInContext:*(void *)(a1 + 40) inStore:*(void *)(a1 + 32) error:*(void *)(*(void *)(a1 + 56) + 8) + 40];
  if (*(_BYTE *)(*(void *)(*(void *)(a1 + 72) + 8LL) + 24LL))
  {
    if (!*(_BYTE *)(*(void *)(*(void *)(a1 + 64) + 8LL) + 24LL)) {
      *(_BYTE *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = [*(id *)(a1 + 40) hasChanges];
    }
    if (!+[_PFRoutines _isInMemoryStore:]((uint64_t)&OBJC_CLASS____PFRoutines, *(unsigned __int8 **)(a1 + 32)))
    {
      *(void *)buf = 0LL;
      if ((objc_msgSend( *(id *)(a1 + 40),  "setQueryGenerationFromToken:error:",  +[NSQueryGenerationToken currentQueryGenerationToken]( NSQueryGenerationToken,  "currentQueryGenerationToken"),  buf) & 1) == 0)
      {
        char v48 = (void *)MEMORY[0x186E3E5D8]();
        uint64_t v49 = __ckLoggingOverride;
        uint64_t v50 = [@"CoreData+CloudKit: %s(%d): " stringByAppendingString:@"%@: Unable to set query generation on managedObjectContext: %@"];
        _NSCoreDataLog( v49 != 0,  v50,  v51,  v52,  v53,  v54,  v55,  v56,  (uint64_t)"-[PFCloudKitImportRecordsWorkItem applyAccumulatedChangesToStore:inManagedObjectContext:withStoreMoni tor:madeChanges:error:]_block_invoke");
        objc_autoreleasePoolPop(v48);
      }
    }

    __int16 v57 = +[NSCKImportOperation fetchOperationWithIdentifier:fromStore:inManagedObjectContext:error:]( (uint64_t)&OBJC_CLASS___NSCKImportOperation,  *(void *)(*(void *)(a1 + 48) + 32LL),  *(void *)(a1 + 32),  *(void **)(a1 + 40),  *(void *)(*(void *)(a1 + 56) + 8LL) + 40LL);
    if (v57)
    {
      __int128 v140 = 0u;
      __int128 v141 = 0u;
      __int128 v138 = 0u;
      __int128 v139 = 0u;
      int v58 = *(void **)(*(void *)(a1 + 48) + 96LL);
      uint64_t v59 = [v58 countByEnumeratingWithState:&v138 objects:v149 count:16];
      if (v59)
      {
        uint64_t v60 = *(void *)v139;
        do
        {
          for (uint64_t j = 0LL; j != v59; ++j)
          {
            if (*(void *)v139 != v60) {
              objc_enumerationMutation(v58);
            }
            +[NSCKImportPendingRelationship insertPendingRelationshipForFailedRelationship:forOperation:inStore:withManagedObjectContext:]( (uint64_t)&OBJC_CLASS___NSCKImportPendingRelationship,  *(void *)(*((void *)&v138 + 1) + 8 * j),  (uint64_t)v57,  *(void *)(a1 + 32),  *(void **)(a1 + 40));
          }

          uint64_t v59 = [v58 countByEnumeratingWithState:&v138 objects:v149 count:16];
        }

        while (v59);
      }

      if (([*(id *)(a1 + 40) save:*(void *)(*(void *)(a1 + 56) + 8) + 40] & 1) == 0)
      {
        if (*(void *)(*(void *)(*(void *)(a1 + 56) + 8LL) + 40LL))
        {
          *(_BYTE *)(*(void *)(*(void *)(a1 + 72) + 8LL) + 24LL) = 0;
          v115 = (void *)MEMORY[0x186E3E5D8](*(id *)(*(void *)(*(void *)(a1 + 56) + 8LL) + 40LL));
          uint64_t v116 = __ckLoggingOverride;
          uint64_t v117 = [@"CoreData+CloudKit: %s(%d): " stringByAppendingString:@"Failed to save applied changes from import: %@"];
          _NSCoreDataLog( v116 != 0,  v117,  v118,  v119,  v120,  v121,  v122,  v123,  (uint64_t)"-[PFCloudKitImportRecordsWorkItem applyAccumulatedChangesToStore:inManagedObjectContext:withStoreMo nitor:madeChanges:error:]_block_invoke");
          objc_autoreleasePoolPop(v115);
        }

        goto LABEL_89;
      }

      char v62 = 1;
    }

    else
    {
      v104 = (void *)MEMORY[0x186E3E5D8]();
      uint64_t v105 = __ckLoggingOverride;
      uint64_t v106 = [@"CoreData+CloudKit: %s(%d): " stringByAppendingString:@"Failed to fetch import operation with identifier '%@': %@"];
      uint64_t v128 = *(void *)(*(void *)(a1 + 48) + 32LL);
      uint64_t v129 = *(void *)(*(void *)(*(void *)(a1 + 56) + 8LL) + 40LL);
      _NSCoreDataLog( v105 != 0,  v106,  v107,  v108,  v109,  v110,  v111,  v112,  (uint64_t)"-[PFCloudKitImportRecordsWorkItem applyAccumulatedChangesToStore:inManagedObjectContext:withStoreMonito r:madeChanges:error:]_block_invoke");
      objc_autoreleasePoolPop(v104);
      v113 = *(void **)(*(void *)(*(void *)(a1 + 56) + 8LL) + 40LL);
      if (v113)
      {
        id v114 = v113;
        char v62 = 0;
      }

      else
      {
        id v124 = objc_alloc(MEMORY[0x189607870]);
        uint64_t v147 = *MEMORY[0x1896075F0];
        uint64_t v125 = *(void *)(a1 + 48);
        if (v125) {
          uint64_t v125 = *(void *)(v125 + 16);
        }
        uint64_t v148 = [NSString stringWithFormat:@"The request '%@' was cancelled because it conflicted with another active import operation.", v125, 425, v128, v129, v130];
        uint64_t v126 = [MEMORY[0x189603F68] dictionaryWithObjects:&v148 forKeys:&v147 count:1];
        uint64_t v127 = [v124 initWithDomain:*MEMORY[0x189607460] code:134407 userInfo:v126];
        char v62 = 0;
        *(void *)(*(void *)(*(void *)(a1 + 56) + 8LL) + 40LL) = v127;
      }
    }

    *(_BYTE *)(*(void *)(*(void *)(a1 + 72) + 8LL) + 24LL) = v62;
  }

  else
  {
    id v103 = *(id *)(*(void *)(*(void *)(a1 + 56) + 8LL) + 40LL);
  }

- (void)removeDownloadedAssetFiles
{
  uint64_t v24 = *MEMORY[0x1895F89C0];
  if (a1)
  {
    id v22 = 0LL;
    id v2 = (id)[MEMORY[0x1896078A8] defaultManager];
    __int128 v18 = 0u;
    __int128 v19 = 0u;
    __int128 v20 = 0u;
    __int128 v21 = 0u;
    uint64_t v3 = (void *)[*(id *)(a1 + 24) allValues];
    uint64_t v4 = [v3 countByEnumeratingWithState:&v18 objects:v23 count:16];
    if (v4)
    {
      uint64_t v5 = v4;
      uint64_t v6 = *(void *)v19;
      uint64_t v7 = *MEMORY[0x189607460];
      do
      {
        for (uint64_t i = 0LL; i != v5; ++i)
        {
          if (*(void *)v19 != v6) {
            objc_enumerationMutation(v3);
          }
          if (([v2 removeItemAtURL:*(void *)(*((void *)&v18 + 1) + 8 * i) error:&v22] & 1) == 0
            && (!objc_msgSend((id)objc_msgSend(v22, "domain"), "isEqualToString:", v7)
             || [v22 code] != 4))
          {
            uint64_t v9 = (void *)MEMORY[0x186E3E5D8]();
            BOOL v10 = __ckLoggingOverride != 0;
            uint64_t v11 = [@"CoreData+CloudKit: %s(%d): " stringByAppendingString:@"Unable to delete processed asset file: %@\n%@"];
            _NSCoreDataLog( v10,  v11,  v12,  v13,  v14,  v15,  v16,  v17,  (uint64_t)"-[PFCloudKitImportRecordsWorkItem removeDownloadedAssetFiles]");
            objc_autoreleasePoolPop(v9);
          }
        }

        uint64_t v5 = [v3 countByEnumeratingWithState:&v18 objects:v23 count:16];
      }

      while (v5);
    }
  }

- (BOOL)updateMetadataForAccumulatedChangesInContext:(id)a3 inStore:(id)a4 error:(id *)a5
{
  return 1;
}

- (BOOL)commitMetadataChangesWithContext:(id)a3 forStore:(id)a4 error:(id *)a5
{
  uint64_t v32 = *MEMORY[0x1895F89C0];
  uint64_t v27 = 0LL;
  if (!+[NSCKImportOperation purgeFinishedImportOperationsInStore:withManagedObjectContext:error:]( (uint64_t)&OBJC_CLASS___NSCKImportOperation,  (uint64_t)a4,  a3,  (uint64_t)&v27))
  {
    uint64_t v9 = (void *)MEMORY[0x186E3E5D8]();
    BOOL v10 = __ckLoggingOverride != 0;
    uint64_t v11 = [@"CoreData+CloudKit: %s(%d): " stringByAppendingString:@"Failed to purge mirrored relationships during import: %@"];
LABEL_6:
    _NSCoreDataLog( v10,  v11,  v12,  v13,  v14,  v15,  v16,  v17,  (uint64_t)"-[PFCloudKitImportRecordsWorkItem commitMetadataChangesWithContext:forStore:error:]");
    objc_autoreleasePoolPop(v9);
    if (v27)
    {
      if (a5)
      {
        LOBYTE(v8) = 0;
        *a5 = v27;
        return v8;
      }
    }

    else
    {
      uint64_t v18 = [NSString stringWithUTF8String:"Illegal attempt to return an error without one in %s:%d"];
      _NSCoreDataLog( 17LL,  v18,  v19,  v20,  v21,  v22,  v23,  v24,  (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Persistence/PFCloudKitImportRecordsWorkItem.m");
      uint64_t v25 = (os_log_s *)__pflogFaultLog;
      BOOL v8 = os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT);
      if (!v8) {
        return v8;
      }
      *(_DWORD *)buf = 136315394;
      id v29 = "/Library/Caches/com.apple.xbs/Sources/Persistence/PFCloudKitImportRecordsWorkItem.m";
      __int16 v30 = 1024;
      int v31 = 568;
      _os_log_fault_impl( &dword_186681000,  v25,  OS_LOG_TYPE_FAULT,  "CoreData: Illegal attempt to return an error without one in %s:%d",  buf,  0x12u);
    }

    LOBYTE(v8) = 0;
    return v8;
  }

  char v7 = [a3 save:&v27];
  LOBYTE(v8) = 1;
  if ((v7 & 1) == 0 && v27)
  {
    uint64_t v9 = (void *)MEMORY[0x186E3E5D8](1LL);
    BOOL v10 = __ckLoggingOverride != 0;
    uint64_t v11 = [@"CoreData+CloudKit: %s(%d): " stringByAppendingString:@"Failed to save changes from import: %@"];
    goto LABEL_6;
  }

  return v8;
}

- (void)addUpdatedRecord:(id)a3
{
  uint64_t v44 = *MEMORY[0x1895F89C0];
  if (!-[NSMutableArray count](self->_encounteredErrors, "count"))
  {
    uint64_t v5 = self->super._options;
    id v6 = (id)[MEMORY[0x1896078A8] defaultManager];
    char v7 = (void *)[a3 recordType];
    if ([v7 isEqualToString:getCloudKitCKRecordTypeShare[0]()])
    {
      -[NSMutableDictionary setObject:forKey:]( self->_updatedShares,  "setObject:forKey:",  a3,  objc_msgSend((id)objc_msgSend(a3, "recordID"), "zoneID"));
    }

    else
    {
      -[NSMutableArray addObject:](self->_updatedRecords, "addObject:", a3);
      -[NSMutableArray addObject:](self->_allRecordIDs, "addObject:", [a3 recordID]);
    }

    self->_totalOperationBytes += [a3 size];
    self->_currentOperationBytes += [a3 size];
    ++self->_countUpdatedRecords;
    -[PFCloudKitSizeMetric addByteSize:]((uint64_t)self->_fetchedRecordBytesMetric, [a3 size]);
    __int128 v39 = 0u;
    __int128 v40 = 0u;
    __int128 v41 = 0u;
    __int128 v42 = 0u;
    obuint64_t j = +[PFCloudKitSerializer assetsOnRecord:withOptions:]((uint64_t)&OBJC_CLASS___PFCloudKitSerializer, a3);
    uint64_t v8 = [obj countByEnumeratingWithState:&v39 objects:v43 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v40;
      do
      {
        uint64_t v11 = 0LL;
        do
        {
          if (*(void *)v40 != v10) {
            objc_enumerationMutation(obj);
          }
          uint64_t v12 = *(void **)(*((void *)&v39 + 1) + 8 * v11);
          if (v5) {
            assetStorageURL = v5->_assetStorageURL;
          }
          else {
            assetStorageURL = 0LL;
          }
          uint64_t v14 = -[NSURL URLByAppendingPathComponent:isDirectory:]( assetStorageURL,  "URLByAppendingPathComponent:isDirectory:",  objc_msgSend((id)objc_msgSend(MEMORY[0x189607AB8], "UUID"), "UUIDString"),  0);
          uint64_t v38 = 0LL;
          if (objc_msgSend(v6, "moveItemAtURL:toURL:error:", objc_msgSend(v12, "fileURL"), v14, &v38))
          {
            -[NSMutableDictionary setObject:forKey:]( self->_assetPathToSafeSaveURL,  "setObject:forKey:",  v14,  objc_msgSend((id)objc_msgSend(v12, "fileURL"), "path"));
            uint64_t v15 = (void *)objc_msgSend(v6, "attributesOfItemAtPath:error:", -[NSURL path](v14, "path"), &v38);
            if (v15)
            {
              uint64_t v16 = v15;
              self->_totalOperationBytes += [v15 fileSize];
              self->_currentOperationBytes += [v16 fileSize];
              -[PFCloudKitSizeMetric addByteSize:]( (uint64_t)self->_fetchedAssetBytesMetric,  [v16 fileSize]);
              goto LABEL_18;
            }

            uint64_t v27 = MEMORY[0x186E3E5D8]();
            BOOL v28 = __ckLoggingOverride != 0;
            uint64_t v29 = [@"CoreData+CloudKit: %s(%d): " stringByAppendingString:@"Failed to read attributes of asset file at URL: %@\n%@\n%@\n%@"];
            _NSCoreDataLog( v28,  v29,  v30,  v31,  v32,  v33,  v34,  v35,  (uint64_t)"-[PFCloudKitImportRecordsWorkItem addUpdatedRecord:]");
            uint64_t v26 = (void *)v27;
          }

          else
          {
            uint64_t v17 = MEMORY[0x186E3E5D8]();
            BOOL v18 = __ckLoggingOverride != 0;
            uint64_t v19 = [@"CoreData+CloudKit: %s(%d): " stringByAppendingString:@"Failed to copy asset to URL: %@\n%@\n%@\n%@"];
            _NSCoreDataLog( v18,  v19,  v20,  v21,  v22,  v23,  v24,  v25,  (uint64_t)"-[PFCloudKitImportRecordsWorkItem addUpdatedRecord:]");
            uint64_t v26 = (void *)v17;
          }

          objc_autoreleasePoolPop(v26);
          -[NSMutableArray addObject:](self->_encounteredErrors, "addObject:", v38);
LABEL_18:
          ++v11;
        }

        while (v9 != v11);
        uint64_t v36 = [obj countByEnumeratingWithState:&v39 objects:v43 count:16];
        uint64_t v9 = v36;
      }

      while (v36);
    }

    -[PFCloudKitImportRecordsWorkItem checkAndApplyChangesIfNeeded:]((uint64_t)self, 0LL);
  }

- (void)checkAndApplyChangesIfNeeded:(uint64_t)a1
{
  if (a1)
  {
    uint64_t v4 = *(void *)(a1 + 8);
    uint64_t v5 = v4 ? *(void **)(v4 + 24) : 0LL;
    if (objc_msgSend((id)objc_msgSend(v5, "operationMemoryThresholdBytes"), "unsignedIntegerValue")
      && ((uint64_t v7 = *(void *)(a1 + 8)) == 0 ? (v8 = 0LL) : (v8 = *(void **)(v7 + 24)),
          unint64_t v6 = *(void *)(a1 + 128),
          v6 >= objc_msgSend((id)objc_msgSend(v8, "operationMemoryThresholdBytes"), "unsignedIntegerValue"))
      || *(void *)(a1 + 128) > 0xA00000uLL
      || (unint64_t v9 = [*(id *)(a1 + 80) count], a2)
      || v9 >= 0x1F5)
    {
      uint64_t v10 = *(void *)(a1 + 8);
      if (v10) {
        uint64_t v11 = *(dispatch_queue_s **)(v10 + 32);
      }
      else {
        uint64_t v11 = 0LL;
      }
      v12[0] = MEMORY[0x1895F87A8];
      v12[1] = 3221225472LL;
      v12[2] = __64__PFCloudKitImportRecordsWorkItem_checkAndApplyChangesIfNeeded___block_invoke;
      v12[3] = &unk_189EA7648;
      v12[4] = a1;
      v12[5] = a2;
      dispatch_sync(v11, v12);
    }
  }

- (void)addDeletedRecordID:(uint64_t)a3 ofType:
{
  if (a1 && ![*(id *)(a1 + 88) count])
  {
    id v6 = (id)[*(id *)(a1 + 72) objectForKey:a3];
    if (!v6)
    {
      id v6 = objc_alloc_init(MEMORY[0x189603FA8]);
      [*(id *)(a1 + 72) setObject:v6 forKey:a3];
    }

    [v6 addObject:a2];

    [*(id *)(a1 + 80) addObject:a2];
    ++*(void *)(a1 + 144);
    -[PFCloudKitImportRecordsWorkItem checkAndApplyChangesIfNeeded:](a1, 0LL);
  }

- (void)fetchOperationFinishedWithError:(uint64_t)a3 completion:
{
  if (a1)
  {
    uint64_t v3 = *(void *)(a1 + 8);
    if (v3) {
      uint64_t v3 = *(void *)(v3 + 32);
    }
    block[0] = MEMORY[0x1895F87A8];
    block[1] = 3221225472LL;
    block[2] = __78__PFCloudKitImportRecordsWorkItem_fetchOperationFinishedWithError_completion___block_invoke;
    block[3] = &unk_189EA95D8;
    block[4] = a1;
    block[5] = a2;
    block[6] = a3;
    dispatch_async((dispatch_queue_t)v3, block);
  }

id __78__PFCloudKitImportRecordsWorkItem_fetchOperationFinishedWithError_completion___block_invoke( uint64_t *a1)
{
  uint64_t v85 = *MEMORY[0x1895F89C0];
  id v2 = objc_alloc_init(MEMORY[0x1896077E8]);
  uint64_t v3 = (void *)a1[4];
  if (v3) {
    uint64_t v3 = (void *)v3[1];
  }
  uint64_t v4 = v3;
  uint64_t v6 = a1[4];
  uint64_t v5 = (void *)a1[5];
  if (!v5)
  {
    if (![*(id *)(v6 + 88) count])
    {
      if (v4) {
        uint64_t v13 = (void *)v4[3];
      }
      else {
        uint64_t v13 = 0LL;
      }
      if ([v13 operationMemoryThresholdBytes])
      {
        uint64_t v14 = v4 ? (void *)v4[3] : 0LL;
        if ((unint64_t)objc_msgSend( (id)objc_msgSend(v14, "operationMemoryThresholdBytes"),  "unsignedLongLongValue") < *(void *)(a1[4] + 128))
        {
          uint64_t v15 = [NSString stringWithUTF8String:"Importer didn't obey operation memory threshold, finished operation with more than the threshold worth of work to do (%@ bytes): %@"];
          uint64_t v16 = [MEMORY[0x189607968] numberWithUnsignedInteger:*(void *)(a1[4] + 128)];
          _NSCoreDataLog(17LL, v15, v17, v18, v19, v20, v21, v22, v16);
          uint64_t v23 = (os_log_s *)__pflogFaultLog;
          if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
          {
            uint64_t v24 = [MEMORY[0x189607968] numberWithUnsignedInteger:*(void *)(a1[4] + 128)];
            if (v4) {
              uint64_t v25 = v4[3];
            }
            else {
              uint64_t v25 = 0LL;
            }
            *(_DWORD *)buf = 138412546;
            *(void *)&uint8_t buf[4] = v24;
            *(_WORD *)&_BYTE buf[12] = 2112;
            *(void *)&buf[14] = v25;
            _os_log_fault_impl( &dword_186681000,  v23,  OS_LOG_TYPE_FAULT,  "CoreData: Importer didn't obey operation memory threshold, finished operation with more than the threshold worth of work to do (%@ bytes): %@",  buf,  0x16u);
          }
        }
      }

      goto LABEL_9;
    }

    if ([*(id *)(a1[4] + 88) count] == 1)
    {
      uint64_t v12 = [*(id *)(a1[4] + 88) lastObject];
    }

    else
    {
      uint64_t v26 = (void *)MEMORY[0x189607870];
      uint64_t v78 = @"NSDetailedErrors";
      uint64_t v79 = *(void *)(a1[4] + 88);
      uint64_t v27 = [MEMORY[0x189603F68] dictionaryWithObjects:&v79 forKeys:&v78 count:1];
      uint64_t v12 = [v26 errorWithDomain:*MEMORY[0x189607460] code:134404 userInfo:v27];
    }

    uint64_t v5 = (void *)v12;
LABEL_26:
    int v11 = 0;
    goto LABEL_27;
  }

  if (!v6) {
    goto LABEL_26;
  }
  uint64_t v71 = 0LL;
  v72 = &v71;
  uint64_t v73 = 0x2020000000LL;
  LOBYTE(v74) = 0;
  uint64_t v7 = (void *)[v5 domain];
  if ([v7 isEqualToString:getCloudKitCKErrorDomain()] && objc_msgSend(v5, "code") == 2)
  {
    uint64_t v8 = (void *)[v5 userInfo];
    unint64_t v9 = (void *)[v8 objectForKey:getCloudKitCKPartialErrorsByItemIDKey[0]()];
    *((_BYTE *)v72 + 24) = 1;
    *(void *)buf = MEMORY[0x1895F87A8];
    *(void *)&buf[8] = 3221225472LL;
    *(void *)&buf[16] = __53__PFCloudKitImportRecordsWorkItem_handleImportError___block_invoke;
    uint64_t v81 = &unk_189EAB488;
    uint64_t v82 = (void *)v6;
    uint64_t v83 = &v71;
    [v9 enumerateKeysAndObjectsUsingBlock:buf];
  }

  int v10 = *((unsigned __int8 *)v72 + 24);
  _Block_object_dispose(&v71, 8);
  if (!v10)
  {
    int v11 = 0;
    uint64_t v5 = (void *)a1[5];
    goto LABEL_27;
  }

uint64_t __64__PFCloudKitImportRecordsWorkItem_checkAndApplyChangesIfNeeded___block_invoke(uint64_t a1)
{
  v2[0] = MEMORY[0x1895F87A8];
  v2[1] = 3221225472LL;
  v2[2] = __64__PFCloudKitImportRecordsWorkItem_checkAndApplyChangesIfNeeded___block_invoke_2;
  v2[3] = &unk_189EA7648;
  __int128 v3 = *(_OWORD *)(a1 + 32);
  return +[_PFRoutines wrapBlockInGuardedAutoreleasePool:]( &OBJC_CLASS____PFRoutines,  "wrapBlockInGuardedAutoreleasePool:",  v2);
}

id __64__PFCloudKitImportRecordsWorkItem_checkAndApplyChangesIfNeeded___block_invoke_2(uint64_t a1)
{
  id v2 = (void *)MEMORY[0x186E3E5D8]();
  else {
    uint64_t v3 = __ckLoggingOverride;
  }
  uint64_t v4 = [@"CoreData+CloudKit: %s(%d): " stringByAppendingString:@"%@: Applying accumulated changes at change token: %@"];
  _NSCoreDataLog( v3,  v4,  v5,  v6,  v7,  v8,  v9,  v10,  (uint64_t)"-[PFCloudKitImportRecordsWorkItem checkAndApplyChangesIfNeeded:]_block_invoke_2");
  objc_autoreleasePoolPop(v2);
  int v11 = *(void **)(a1 + 32);
  if (v11)
  {
    int v11 = (void *)v11[1];
    if (v11) {
      int v11 = (void *)v11[2];
    }
  }

  uint64_t v12 = v11;
  v15[0] = MEMORY[0x1895F87A8];
  v15[1] = 3221225472LL;
  void v15[2] = __64__PFCloudKitImportRecordsWorkItem_checkAndApplyChangesIfNeeded___block_invoke_3;
  v15[3] = &unk_189EA7648;
  uint64_t v13 = *(void *)(a1 + 32);
  v15[4] = v12;
  v15[5] = v13;
  -[PFCloudKitStoreMonitor performBlock:]((uint64_t)v12, (uint64_t)v15);

  *(void *)(*(void *)(a1 + 32) + 80LL) = objc_alloc_init(MEMORY[0x189603FA8]);
  *(void *)(*(void *)(a1 + 32) + 40LL) = objc_alloc_init(MEMORY[0x189603FA8]);

  *(void *)(*(void *)(a1 + 32) + 72LL) = objc_alloc_init(MEMORY[0x189603FC8]);
  *(void *)(*(void *)(a1 + 32) + 24LL) = objc_alloc_init(MEMORY[0x189603FC8]);

  *(void *)(*(void *)(a1 + 32) + 96LL) = objc_alloc_init(MEMORY[0x189603FA8]);
  *(void *)(*(void *)(a1 + 32) + 112LL) = 0LL;

  id result = objc_alloc_init(MEMORY[0x189603FC8]);
  *(void *)(*(void *)(a1 + 32) + 120LL) = result;
  return result;
}

void __64__PFCloudKitImportRecordsWorkItem_checkAndApplyChangesIfNeeded___block_invoke_3(uint64_t a1)
{
  uint64_t v53 = *MEMORY[0x1895F89C0];
  uint64_t v49 = 0LL;
  id v2 = (void *)-[PFCloudKitStoreMonitor retainedMonitoredStore](*(void *)(a1 + 32));
  if (v2)
  {
    uint64_t v3 = *(void *)(a1 + 32);
    if (v3)
    {
      id WeakRetained = objc_loadWeakRetained((id *)(v3 + 32));
      uint64_t v5 = *(void *)(a1 + 32);
    }

    else
    {
      uint64_t v5 = 0LL;
      id WeakRetained = 0LL;
    }

    uint64_t v6 = -[PFCloudKitStoreMonitor newBackgroundContextForMonitoredCoordinator](v5);
    -[NSManagedObjectContext setTransactionAuthor:]( v6,  "setTransactionAuthor:",  @"NSCloudKitMirroringDelegate.import");
    unsigned __int8 v48 = 0;
    if ([*(id *)(a1 + 40) applyAccumulatedChangesToStore:v2 inManagedObjectContext:v6 withStoreMonitor:*(void *)(a1 + 32) madeChanges:&v48 error:&v49])
    {
      v47[0] = MEMORY[0x1895F87A8];
      v47[1] = 3221225472LL;
      v47[2] = __64__PFCloudKitImportRecordsWorkItem_checkAndApplyChangesIfNeeded___block_invoke_4;
      v47[3] = &unk_189EA7648;
      uint64_t v7 = *(void *)(a1 + 40);
      v47[4] = v6;
      v47[5] = v7;
      uint64_t v8 = (void *)MEMORY[0x186E3E5D8](-[NSManagedObjectContext performBlockAndWait:](v6, "performBlockAndWait:", v47));
      else {
        uint64_t v9 = __ckLoggingOverride;
      }
      uint64_t v10 = [@"CoreData+CloudKit: %s(%d): " stringByAppendingString:@"%@: Successfully applied incremental changes during request: %@"];
      _NSCoreDataLog( v9,  v10,  v11,  v12,  v13,  v14,  v15,  v16,  (uint64_t)"-[PFCloudKitImportRecordsWorkItem checkAndApplyChangesIfNeeded:]_block_invoke");
      objc_autoreleasePoolPop(v8);
      uint64_t v17 = *(void **)(a1 + 40);
      if (v17) {
        uint64_t v18 = v17[2];
      }
      else {
        uint64_t v18 = 0LL;
      }
      uint64_t v19 = *(void *)(a1 + 32);
      if (v19) {
        uint64_t v20 = *(void *)(v19 + 48);
      }
      else {
        uint64_t v20 = 0LL;
      }
      uint64_t v21 = (void *)[v17 createMirroringResultForRequest:v18 storeIdentifier:v20 success:1 madeChanges:v48 error:0];
      [*(id *)(*(void *)(a1 + 40) + 104) addObject:v21];
      if (([v21 success] & 1) == 0)
      {
        uint64_t v22 = [NSString stringWithUTF8String:"Should tear down here and stop subsequent attempts to import from happening."];
        _NSCoreDataLog(17LL, v22, v23, v24, v25, v26, v27, v28, v46);
        uint64_t v29 = (os_log_s *)__pflogFaultLog;
        if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_fault_impl( &dword_186681000,  v29,  OS_LOG_TYPE_FAULT,  "CoreData: Should tear down here and stop subsequent attempts to import from happening.",  buf,  2u);
        }
      }
    }

    else
    {
      uint64_t v36 = (void *)MEMORY[0x186E3E5D8]();
      BOOL v37 = __ckLoggingOverride != 0;
      uint64_t v38 = [@"CoreData+CloudKit: %s(%d): " stringByAppendingString:@"%@: Failed to incrementally apply changes during request: %@\n%@"];
      _NSCoreDataLog( v37,  v38,  v39,  v40,  v41,  v42,  v43,  v44,  (uint64_t)"-[PFCloudKitImportRecordsWorkItem checkAndApplyChangesIfNeeded:]_block_invoke");
      objc_autoreleasePoolPop(v36);
      uint64_t v45 = *(void *)(a1 + 40);
      if (v45) {
        [*(id *)(v45 + 88) addObject:v49];
      }
      uint64_t v21 = 0LL;
    }
  }

  else
  {
    uint64_t v30 = (void *)MEMORY[0x189607870];
    uint64_t v50 = *MEMORY[0x1896075F0];
    uint64_t v31 = *(void *)(a1 + 40);
    if (v31) {
      uint64_t v32 = *(void **)(v31 + 16);
    }
    else {
      uint64_t v32 = 0LL;
    }
    uint64_t v51 = [NSString stringWithFormat:@"Request '%@' was cancelled because the store was removed from the coordinator.", objc_msgSend(v32, "requestIdentifier")];
    uint64_t v33 = [MEMORY[0x189603F68] dictionaryWithObjects:&v51 forKeys:&v50 count:1];
    uint64_t v34 = [v30 errorWithDomain:*MEMORY[0x189607460] code:134407 userInfo:v33];
    uint64_t v49 = v34;
    uint64_t v35 = *(void *)(a1 + 40);
    if (v35) {
      [*(id *)(v35 + 88) addObject:v34];
    }
  }
}

- (id)createMirroringResultForRequest:(id)a3 storeIdentifier:(id)a4 success:(BOOL)a5 madeChanges:(BOOL)a6 error:(id)a7
{
  return -[NSCloudKitMirroringResult initWithRequest:storeIdentifier:success:madeChanges:error:]( objc_alloc(&OBJC_CLASS___NSCloudKitMirroringResult),  "initWithRequest:storeIdentifier:success:madeChanges:error:",  a3,  a4,  a5,  a6,  a7);
}

void __53__PFCloudKitImportRecordsWorkItem_handleImportError___block_invoke( uint64_t a1,  uint64_t a2,  void *a3,  _BYTE *a4)
{
  uint64_t v21 = *MEMORY[0x1895F89C0];
  getCloudKitCKRecordIDClass();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    uint64_t v8 = (void *)[a3 domain];
    if ([v8 isEqualToString:getCloudKitCKErrorDomain()]
      && [a3 code] == 11)
    {
      [*(id *)(*(void *)(a1 + 32) + 112) addObject:a2];
      [*(id *)(*(void *)(a1 + 32) + 80) addObject:a2];
      return;
    }
  }

  else
  {
    getCloudKitCKRecordZoneIDClass();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      uint64_t v9 = [NSString stringWithUTF8String:"CloudKit Import: Failed to handle item error for unknown itemID type: %@ - %@"];
      _NSCoreDataLog(17LL, v9, v10, v11, v12, v13, v14, v15, a2);
      uint64_t v16 = (os_log_s *)__pflogFaultLog;
      if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 138412546;
        uint64_t v18 = a2;
        __int16 v19 = 2112;
        uint64_t v20 = a3;
        _os_log_fault_impl( &dword_186681000,  v16,  OS_LOG_TYPE_FAULT,  "CoreData: CloudKit Import: Failed to handle item error for unknown itemID type: %@ - %@",  buf,  0x16u);
      }
    }
  }

  *(_BYTE *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL) = 0;
  *a4 = 1;
}

- (void)cloudKitSerializer:(id)a3 failedToUpdateRelationship:(id)a4 withError:(id)a5
{
}

- (id)cloudKitSerializer:(id)a3 safeSaveURLForAsset:(id)a4
{
  return (id)-[NSMutableDictionary objectForKey:]( self->_assetPathToSafeSaveURL,  "objectForKey:",  objc_msgSend((id)objc_msgSend(a4, "fileURL", a3), "path"));
}

- (id)entityNameToAttributesToUpdate
{
  return 0LL;
}

- (id)entityNameToRelationshipsToUpdate
{
  return 0LL;
}

@end