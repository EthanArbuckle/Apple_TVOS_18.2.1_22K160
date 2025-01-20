@interface PFCloudKitExportContext
- (BOOL)checkForObjectsNeedingExportInStore:(id)a3 andReturnCount:(unint64_t *)a4 withManagedObjectContext:(id)a5 error:(id *)a6;
- (BOOL)modifyRecordsOperationFinishedForStore:(uint64_t)a3 withSavedRecords:(uint64_t)a4 deletedRecordIDs:(uint64_t)a5 operationError:(void *)a6 managedObjectContext:(void *)a7 error:;
- (BOOL)processAnalyzedHistoryInStore:(id)a3 inManagedObjectContext:(id)a4 error:(id *)a5;
- (PFCloudKitExportContext)initWithOptions:(id)a3;
- (uint64_t)currentBatchExceedsThresholds:(uint64_t)result;
- (uint64_t)insertRecordMetadataForObjectIDsInBatch:(void *)a3 inManagedObjectContext:(uint64_t)a4 withPendingTransactionNumber:(void *)a5 error:;
- (void)dealloc;
- (void)newOperationBySerializingDirtyObjectsInStore:(void *)a3 inManagedObjectContext:(void *)a4 error:;
@end

@implementation PFCloudKitExportContext

- (PFCloudKitExportContext)initWithOptions:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___PFCloudKitExportContext;
  v4 = -[PFCloudKitExportContext init](&v6, sel_init);
  if (v4)
  {
    v4->_options = (PFCloudKitExporterOptions *)a3;
    v4->_totalBytes = 0LL;
    v4->_totalRecords = 0LL;
    v4->_totalRecordIDs = 0LL;
    v4->_writtenAssetURLs = (NSMutableArray *)objc_alloc_init(MEMORY[0x189603FA8]);
  }

  return v4;
}

- (void)dealloc
{
  self->_options = 0LL;
  self->_writtenAssetURLs = 0LL;
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___PFCloudKitExportContext;
  -[PFCloudKitExportContext dealloc](&v3, sel_dealloc);
}

- (BOOL)processAnalyzedHistoryInStore:(id)a3 inManagedObjectContext:(id)a4 error:(id *)a5
{
  uint64_t v32 = *MEMORY[0x1895F89C0];
  uint64_t v24 = 0LL;
  v25 = &v24;
  uint64_t v26 = 0x2020000000LL;
  char v27 = 1;
  uint64_t v18 = 0LL;
  v19 = &v18;
  uint64_t v20 = 0x3052000000LL;
  v21 = __Block_byref_object_copy__44;
  v22 = __Block_byref_object_dispose__44;
  uint64_t v23 = 0LL;
  v17[0] = MEMORY[0x1895F87A8];
  v17[1] = 3221225472LL;
  v17[2] = __86__PFCloudKitExportContext_processAnalyzedHistoryInStore_inManagedObjectContext_error___block_invoke;
  v17[3] = &unk_189EA8800;
  v17[4] = a3;
  v17[5] = a4;
  v17[7] = &v18;
  v17[8] = &v24;
  v17[6] = self;
  [a4 performBlockAndWait:v17];
  if (!*((_BYTE *)v25 + 24))
  {
    id v8 = (id)v19[5];
    if (v8)
    {
      if (a5) {
        *a5 = v8;
      }
    }

    else
    {
      uint64_t v9 = [NSString stringWithUTF8String:"Illegal attempt to return an error without one in %s:%d"];
      _NSCoreDataLog( 17LL,  v9,  v10,  v11,  v12,  v13,  v14,  v15,  (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Persistence/PFCloudKitExportContext.m");
      v16 = (os_log_s *)__pflogFaultLog;
      if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 136315394;
        v29 = "/Library/Caches/com.apple.xbs/Sources/Persistence/PFCloudKitExportContext.m";
        __int16 v30 = 1024;
        int v31 = 690;
        _os_log_fault_impl( &dword_186681000,  v16,  OS_LOG_TYPE_FAULT,  "CoreData: Illegal attempt to return an error without one in %s:%d",  buf,  0x12u);
      }
    }
  }

  v19[5] = 0LL;
  char v6 = *((_BYTE *)v25 + 24);
  _Block_object_dispose(&v18, 8);
  _Block_object_dispose(&v24, 8);
  return v6;
}

void __86__PFCloudKitExportContext_processAnalyzedHistoryInStore_inManagedObjectContext_error___block_invoke( uint64_t a1)
{
  uint64_t v70 = 0LL;
  v71 = &v70;
  uint64_t v72 = 0x3052000000LL;
  v73 = __Block_byref_object_copy__44;
  v74 = __Block_byref_object_dispose__44;
  uint64_t v75 = 0LL;
  uint64_t v64 = 0LL;
  v65 = &v64;
  uint64_t v66 = 0x3052000000LL;
  v67 = __Block_byref_object_copy__44;
  v68 = __Block_byref_object_dispose__44;
  uint64_t v69 = 0LL;
  v2 = (void *)+[NSCKMetadataEntry entryForKey:fromStore:inManagedObjectContext:error:]( (uint64_t)&OBJC_CLASS___NSCKMetadataEntry,  (uint64_t)@"NSCloudKitMirroringDelegateLastHistoryTokenKey",  *(void *)(a1 + 32),  *(void **)(a1 + 40),  *(void *)(*(void *)(a1 + 56) + 8LL) + 40LL);
  if (*(void *)(*(void *)(*(void *)(a1 + 56) + 8LL) + 40LL))
  {
    *(_BYTE *)(*(void *)(*(void *)(a1 + 64) + 8LL) + 24LL) = 0;
    objc_super v3 = (void *)MEMORY[0x186E3E5D8](*(id *)(*(void *)(*(void *)(a1 + 56) + 8LL) + 40LL));
    uint64_t v4 = __ckLoggingOverride;
    uint64_t v5 = [@"CoreData+CloudKit: %s(%d): " stringByAppendingString:@"Unable to read the last history token: %@"];
    _NSCoreDataLog( v4 != 0,  v5,  v6,  v7,  v8,  v9,  v10,  v11,  (uint64_t)"-[PFCloudKitExportContext processAnalyzedHistoryInStore:inManagedObjectContext:error:]_block_invoke");
    id v12 = 0LL;
    objc_autoreleasePoolPop(v3);
  }

  else
  {
    id v12 = (id)objc_msgSend( (id)objc_msgSend((id)objc_msgSend(v2, "transformedValue"), "storeTokens"),  "objectForKey:",  objc_msgSend(*(id *)(a1 + 32), "identifier"));
    if (!v12) {
      id v12 = (id)[objc_alloc(MEMORY[0x189607968]) initWithInt:0];
    }
  }

  if (*(_BYTE *)(*(void *)(*(void *)(a1 + 64) + 8LL) + 24LL))
  {
    id v13 = objc_alloc_init(MEMORY[0x189603FE0]);
    id v14 = objc_alloc_init(MEMORY[0x189603FC8]);
    v71[5] = (uint64_t)v14;
    id v15 = objc_alloc_init(MEMORY[0x189603FC8]);
    v65[5] = (uint64_t)v15;
    id v16 = objc_alloc_init(MEMORY[0x189603FE0]);
    id v17 = objc_alloc_init(MEMORY[0x189603FE0]);
    uint64_t v60 = 0LL;
    v61 = &v60;
    uint64_t v62 = 0x2020000000LL;
    uint64_t v63 = 0LL;
    v59[0] = 0LL;
    v59[1] = v59;
    v59[2] = 0x2020000000LL;
    v59[3] = 0LL;
    uint64_t v18 = +[NSFetchRequest fetchRequestWithEntityName:]( &OBJC_CLASS___NSFetchRequest,  "fetchRequestWithEntityName:",  +[NSCKHistoryAnalyzerState entityPath](&OBJC_CLASS___NSCKHistoryAnalyzerState, "entityPath"));
    -[NSFetchRequest setReturnsObjectsAsFaults:](v18, "setReturnsObjectsAsFaults:", 0LL);
    -[NSFetchRequest setPropertiesToFetch:](v18, "setPropertiesToFetch:", &unk_189F0B310);
    -[NSFetchRequest setFetchBatchSize:](v18, "setFetchBatchSize:", 200LL);
    uint64_t v19 = MEMORY[0x1895F87A8];
    v57[0] = MEMORY[0x1895F87A8];
    v57[1] = 3221225472LL;
    v57[2] = __86__PFCloudKitExportContext_processAnalyzedHistoryInStore_inManagedObjectContext_error___block_invoke_2;
    v57[3] = &unk_189EAB7F8;
    uint64_t v20 = *(void **)(a1 + 40);
    v57[4] = *(void *)(a1 + 32);
    v57[5] = v16;
    v57[10] = &v64;
    v57[11] = v59;
    v57[12] = &v70;
    v57[13] = &v60;
    v57[6] = v17;
    v57[7] = v13;
    __int128 v58 = *(_OWORD *)(a1 + 56);
    v57[8] = v20;
    v57[9] = v12;
    +[_PFRoutines efficientlyEnumerateManagedObjectsInFetchRequest:usingManagedObjectContext:andApplyBlock:]( (uint64_t)&OBJC_CLASS____PFRoutines,  (uint64_t)v18,  v20,  (uint64_t)v57);
    uint64_t v22 = *(void *)(a1 + 64);
    if (*(_BYTE *)(*(void *)(v22 + 8) + 24LL))
    {
      if (!v61[3]) {
        goto LABEL_9;
      }
      v50[0] = v19;
      v50[1] = 3221225472LL;
      v50[2] = __86__PFCloudKitExportContext_processAnalyzedHistoryInStore_inManagedObjectContext_error___block_invoke_3;
      v50[3] = &unk_189EAB7D0;
      __int128 v51 = *(_OWORD *)(a1 + 32);
      uint64_t v23 = *(void *)(a1 + 56);
      v53 = &v70;
      uint64_t v54 = v23;
      v50[4] = v12;
      id v52 = v17;
      v55 = &v60;
      uint64_t v56 = v22;
      uint64_t v21 = +[_PFRoutines wrapBlockInGuardedAutoreleasePool:]( &OBJC_CLASS____PFRoutines,  "wrapBlockInGuardedAutoreleasePool:",  v50);
      uint64_t v22 = *(void *)(a1 + 64);
      if (*(_BYTE *)(*(void *)(v22 + 8) + 24LL))
      {
LABEL_9:
        v43[0] = v19;
        v43[1] = 3221225472LL;
        v43[2] = __86__PFCloudKitExportContext_processAnalyzedHistoryInStore_inManagedObjectContext_error___block_invoke_4;
        v43[3] = &unk_189EAB7D0;
        __int128 v44 = *(_OWORD *)(a1 + 32);
        uint64_t v24 = *(void *)(a1 + 56);
        v46 = &v64;
        uint64_t v47 = v24;
        v43[4] = v12;
        id v45 = v16;
        v48 = v59;
        uint64_t v49 = v22;
        uint64_t v21 = +[_PFRoutines wrapBlockInGuardedAutoreleasePool:]( &OBJC_CLASS____PFRoutines,  "wrapBlockInGuardedAutoreleasePool:",  v43);
      }
    }

    v25 = (void *)MEMORY[0x186E3E5D8](v21);
    else {
      uint64_t v26 = __ckLoggingOverride;
    }
    uint64_t v27 = objc_msgSend( @"CoreData+CloudKit: %s(%d): ",  "stringByAppendingString:",  @"Finished processing analyzed history with %lu metadata objects to create, %lu deleted rows without metadata.");
    [v17 count];
    [v16 count];
    _NSCoreDataLog( v26,  v27,  v28,  v29,  v30,  v31,  v32,  v33,  (uint64_t)"-[PFCloudKitExportContext processAnalyzedHistoryInStore:inManagedObjectContext:error:]_block_invoke_5");
    objc_autoreleasePoolPop(v25);
    uint64_t v34 = *(void *)(a1 + 64);
    if (*(_BYTE *)(*(void *)(v34 + 8) + 24LL))
    {
      v37[0] = v19;
      v37[1] = 3221225472LL;
      v37[2] = __86__PFCloudKitExportContext_processAnalyzedHistoryInStore_inManagedObjectContext_error___block_invoke_6;
      v37[3] = &unk_189EAB910;
      v37[4] = v17;
      uint64_t v36 = *(void *)(a1 + 48);
      uint64_t v35 = *(void *)(a1 + 56);
      uint64_t v41 = v34;
      uint64_t v42 = v35;
      int8x16_t v38 = vextq_s8(*(int8x16_t *)(a1 + 32), *(int8x16_t *)(a1 + 32), 8uLL);
      uint64_t v39 = v36;
      id v40 = v12;
      +[_PFRoutines wrapBlockInGuardedAutoreleasePool:]( &OBJC_CLASS____PFRoutines,  "wrapBlockInGuardedAutoreleasePool:",  v37);
    }

    _Block_object_dispose(v59, 8);
    _Block_object_dispose(&v60, 8);
  }

  else
  {
    id v17 = 0LL;
    id v16 = 0LL;
    id v13 = 0LL;
  }

  v71[5] = 0LL;
  v65[5] = 0LL;

  _Block_object_dispose(&v64, 8);
  _Block_object_dispose(&v70, 8);
}

uint64_t __86__PFCloudKitExportContext_processAnalyzedHistoryInStore_inManagedObjectContext_error___block_invoke_2( uint64_t a1,  void *a2,  void *a3,  _BYTE *a4)
{
  uint64_t v4 = a4;
  uint64_t v56 = *MEMORY[0x1895F89C0];
  if (!a2)
  {
    *(_BYTE *)(*(void *)(*(void *)(a1 + 120) + 8LL) + 24LL) = 0;
    uint64_t result = a3;
    *(void *)(*(void *)(*(void *)(a1 + 112) + 8LL) + 40LL) = result;
    goto LABEL_39;
  }

  __int128 v51 = 0u;
  __int128 v52 = 0u;
  __int128 v49 = 0u;
  __int128 v50 = 0u;
  uint64_t v7 = [a2 countByEnumeratingWithState:&v49 objects:v55 count:16];
  if (!v7) {
    goto LABEL_28;
  }
  uint64_t v8 = v7;
  uint64_t v9 = *(void *)v50;
  do
  {
    uint64_t v10 = 0LL;
    do
    {
      if (*(void *)v50 != v9) {
        objc_enumerationMutation(a2);
      }
      uint64_t v11 = *(void **)(*((void *)&v49 + 1) + 8 * v10);
      id v12 = (void *)[v11 analyzedObjectID];
      if (!v12)
      {
        [*(id *)(a1 + 64) deleteObject:v11];
        goto LABEL_22;
      }

      id v13 = v12;
      id v14 = (void *)MEMORY[0x189607968];
      uint64_t v15 = _sqlEntityForEntityDescription( [*(id *)(a1 + 32) model],  (void *)objc_msgSend(v12, "entity"));
      if (v15) {
        uint64_t v16 = *(unsigned int *)(v15 + 184);
      }
      else {
        uint64_t v16 = 0LL;
      }
      uint64_t v17 = [v14 numberWithUnsignedInt:v16];
      uint64_t v18 = objc_msgSend(MEMORY[0x189607968], "numberWithLongLong:", objc_msgSend(v13, "_referenceData64"));
      if ([v11 finalChangeType] == 2)
      {
        id v19 = (id)[*(id *)(*(void *)(*(void *)(a1 + 80) + 8) + 40) objectForKey:v17];
        if (!v19)
        {
          id v19 = objc_alloc_init(MEMORY[0x189603FE0]);
          [*(id *)(*(void *)(*(void *)(a1 + 80) + 8) + 40) setObject:v19 forKey:v17];
        }

        [v19 addObject:v18];

        [*(id *)(a1 + 40) addObject:v13];
        uint64_t v20 = *(void *)(a1 + 88);
      }

      else
      {
        if ([v11 finalChangeType] && objc_msgSend(v11, "finalChangeType") != 1)
        {
          uint64_t v22 = [NSString stringWithUTF8String:"Unhandled persistent history change type: %@"];
          _NSCoreDataLog(17LL, v22, v23, v24, v25, v26, v27, v28, (uint64_t)v11);
          uint64_t v29 = (os_log_s *)__pflogFaultLog;
          if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
          {
            *(_DWORD *)buf = 138412290;
            uint64_t v54 = v11;
            _os_log_fault_impl( &dword_186681000,  v29,  OS_LOG_TYPE_FAULT,  "CoreData: Unhandled persistent history change type: %@",  buf,  0xCu);
          }

          goto LABEL_21;
        }

        id v21 = (id)[*(id *)(*(void *)(*(void *)(a1 + 96) + 8) + 40) objectForKey:v17];
        if (!v21)
        {
          id v21 = objc_alloc_init(MEMORY[0x189603FE0]);
          [*(id *)(*(void *)(*(void *)(a1 + 96) + 8) + 40) setObject:v21 forKey:v17];
        }

        [v21 addObject:v18];

        [*(id *)(a1 + 48) addObject:v13];
        uint64_t v20 = *(void *)(a1 + 104);
      }

      ++*(void *)(*(void *)(v20 + 8) + 24LL);
LABEL_21:
      [*(id *)(a1 + 56) addObject:v13];
LABEL_22:
      ++v10;
    }

    while (v8 != v10);
    uint64_t v30 = [a2 countByEnumeratingWithState:&v49 objects:v55 count:16];
    uint64_t v8 = v30;
  }

  while (v30);
LABEL_28:
  uint64_t result = [*(id *)(a1 + 64) hasChanges];
  if ((_DWORD)result)
  {
    uint64_t result = [*(id *)(a1 + 64) save:*(void *)(*(void *)(a1 + 112) + 8) + 40];
    if ((result & 1) == 0)
    {
      *(_BYTE *)(*(void *)(*(void *)(a1 + 120) + 8LL) + 24LL) = 0;
      uint64_t result = (uint64_t)*(id *)(*(void *)(*(void *)(a1 + 112) + 8LL) + 40LL);
    }
  }

  uint64_t v32 = *(void *)(a1 + 120);
  if (*(_BYTE *)(*(void *)(v32 + 8) + 24LL))
  {
    uint64_t v33 = *(void *)(a1 + 104);
    uint64_t v34 = MEMORY[0x1895F87A8];
    if (*(void *)(*(void *)(v33 + 8) + 24LL) >= 0x1F4uLL)
    {
      v48[0] = MEMORY[0x1895F87A8];
      v48[1] = 3221225472LL;
      v48[2] = __86__PFCloudKitExportContext_processAnalyzedHistoryInStore_inManagedObjectContext_error___block_invoke_20;
      v48[3] = &unk_189EAB7D0;
      uint64_t v35 = *(void *)(a1 + 96);
      uint64_t v36 = *(void *)(a1 + 32);
      uint64_t v37 = *(void *)(a1 + 64);
      v48[4] = *(void *)(a1 + 72);
      v48[5] = v36;
      uint64_t v38 = *(void *)(a1 + 112);
      v48[8] = v35;
      v48[9] = v38;
      uint64_t v39 = *(void *)(a1 + 48);
      v48[6] = v37;
      v48[7] = v39;
      v48[10] = v33;
      v48[11] = v32;
      uint64_t result = +[_PFRoutines wrapBlockInGuardedAutoreleasePool:]( &OBJC_CLASS____PFRoutines,  "wrapBlockInGuardedAutoreleasePool:",  v48);
      uint64_t v32 = *(void *)(a1 + 120);
    }

    uint64_t v40 = *(void *)(a1 + 88);
    if (*(void *)(*(void *)(v40 + 8) + 24LL) >= 0x1F4uLL)
    {
      v47[0] = v34;
      v47[1] = 3221225472LL;
      v47[2] = __86__PFCloudKitExportContext_processAnalyzedHistoryInStore_inManagedObjectContext_error___block_invoke_2_31;
      v47[3] = &unk_189EAB7D0;
      uint64_t v41 = *(void *)(a1 + 80);
      uint64_t v42 = *(void *)(a1 + 64);
      uint64_t v43 = *(void *)(a1 + 32);
      uint64_t v44 = *(void *)(a1 + 40);
      v47[4] = *(void *)(a1 + 72);
      v47[5] = v43;
      uint64_t v45 = *(void *)(a1 + 112);
      v47[8] = v41;
      v47[9] = v45;
      v47[6] = v42;
      v47[7] = v44;
      v47[10] = v40;
      v47[11] = v32;
      uint64_t result = +[_PFRoutines wrapBlockInGuardedAutoreleasePool:]( &OBJC_CLASS____PFRoutines,  "wrapBlockInGuardedAutoreleasePool:",  v47);
      uint64_t v32 = *(void *)(a1 + 120);
    }
  }

  uint64_t v4 = a4;
  if (!*(_BYTE *)(*(void *)(v32 + 8) + 24LL)) {
LABEL_39:
  }
    _BYTE *v4 = 1;
  return result;
}

id __86__PFCloudKitExportContext_processAnalyzedHistoryInStore_inManagedObjectContext_error___block_invoke_20( uint64_t a1)
{
  v5[3] = *MEMORY[0x1895F89C0];
  v4[0] = @"needsUpload";
  v5[0] = [MEMORY[0x189607878] expressionForConstantValue:MEMORY[0x189604A88]];
  v4[1] = @"needsCloudDelete";
  v5[1] = [MEMORY[0x189607878] expressionForConstantValue:MEMORY[0x189604A80]];
  v4[2] = @"pendingExportTransactionNumber";
  v5[2] = [MEMORY[0x189607878] expressionForConstantValue:*(void *)(a1 + 32)];
  id v2 = +[NSCKRecordMetadata batchUpdateMetadataMatchingEntityIdsAndPKs:withUpdates:inStore:withManagedObjectContext:error:]( (uint64_t)NSCKRecordMetadata,  *(void **)(*(void *)(*(void *)(a1 + 64) + 8) + 40),  [MEMORY[0x189603F68] dictionaryWithObjects:v5 forKeys:v4 count:3],  *(void *)(a1 + 40),  *(void *)(a1 + 48),  (void *)(*(void *)(*(void *)(a1 + 72) + 8) + 40));
  if (v2)
  {
    [*(id *)(a1 + 56) minusSet:v2];

    id result = objc_alloc_init(MEMORY[0x189603FC8]);
    *(void *)(*(void *)(*(void *)(a1 + 64) + 8LL) + 40LL) = result;
    *(void *)(*(void *)(*(void *)(a1 + 80) + 8LL) + 24LL) = 0LL;
  }

  else
  {
    *(_BYTE *)(*(void *)(*(void *)(a1 + 88) + 8LL) + 24LL) = 0;
    return *(id *)(*(void *)(*(void *)(a1 + 72) + 8LL) + 40LL);
  }

  return result;
}

id __86__PFCloudKitExportContext_processAnalyzedHistoryInStore_inManagedObjectContext_error___block_invoke_2_31( uint64_t a1)
{
  v6[3] = *MEMORY[0x1895F89C0];
  v5[0] = @"needsUpload";
  uint64_t v2 = MEMORY[0x189604A88];
  v6[0] = [MEMORY[0x189607878] expressionForConstantValue:MEMORY[0x189604A88]];
  v5[1] = @"needsCloudDelete";
  v6[1] = [MEMORY[0x189607878] expressionForConstantValue:v2];
  v5[2] = @"pendingExportTransactionNumber";
  v6[2] = [MEMORY[0x189607878] expressionForConstantValue:*(void *)(a1 + 32)];
  id v3 = +[NSCKRecordMetadata batchUpdateMetadataMatchingEntityIdsAndPKs:withUpdates:inStore:withManagedObjectContext:error:]( (uint64_t)NSCKRecordMetadata,  *(void **)(*(void *)(*(void *)(a1 + 64) + 8) + 40),  [MEMORY[0x189603F68] dictionaryWithObjects:v6 forKeys:v5 count:3],  *(void *)(a1 + 40),  *(void *)(a1 + 48),  (void *)(*(void *)(*(void *)(a1 + 72) + 8) + 40));
  if (v3)
  {
    [*(id *)(a1 + 56) minusSet:v3];

    id result = objc_alloc_init(MEMORY[0x189603FC8]);
    *(void *)(*(void *)(*(void *)(a1 + 64) + 8LL) + 40LL) = result;
    *(void *)(*(void *)(*(void *)(a1 + 80) + 8LL) + 24LL) = 0LL;
  }

  else
  {
    *(_BYTE *)(*(void *)(*(void *)(a1 + 88) + 8LL) + 24LL) = 0;
    return *(id *)(*(void *)(*(void *)(a1 + 72) + 8LL) + 40LL);
  }

  return result;
}

id __86__PFCloudKitExportContext_processAnalyzedHistoryInStore_inManagedObjectContext_error___block_invoke_3( uint64_t a1)
{
  void v5[3] = *MEMORY[0x1895F89C0];
  v4[0] = @"needsUpload";
  v5[0] = [MEMORY[0x189607878] expressionForConstantValue:MEMORY[0x189604A88]];
  v4[1] = @"needsCloudDelete";
  v5[1] = [MEMORY[0x189607878] expressionForConstantValue:MEMORY[0x189604A80]];
  v4[2] = @"pendingExportTransactionNumber";
  v5[2] = [MEMORY[0x189607878] expressionForConstantValue:*(void *)(a1 + 32)];
  id v2 = +[NSCKRecordMetadata batchUpdateMetadataMatchingEntityIdsAndPKs:withUpdates:inStore:withManagedObjectContext:error:]( (uint64_t)NSCKRecordMetadata,  *(void **)(*(void *)(*(void *)(a1 + 64) + 8) + 40),  [MEMORY[0x189603F68] dictionaryWithObjects:v5 forKeys:v4 count:3],  *(void *)(a1 + 40),  *(void *)(a1 + 48),  (void *)(*(void *)(*(void *)(a1 + 72) + 8) + 40));
  if (v2)
  {
    [*(id *)(a1 + 56) minusSet:v2];

    id result = objc_alloc_init(MEMORY[0x189603FC8]);
    *(void *)(*(void *)(*(void *)(a1 + 64) + 8LL) + 40LL) = result;
    *(void *)(*(void *)(*(void *)(a1 + 80) + 8LL) + 24LL) = 0LL;
  }

  else
  {
    *(_BYTE *)(*(void *)(*(void *)(a1 + 88) + 8LL) + 24LL) = 0;
    return *(id *)(*(void *)(*(void *)(a1 + 72) + 8LL) + 40LL);
  }

  return result;
}

id __86__PFCloudKitExportContext_processAnalyzedHistoryInStore_inManagedObjectContext_error___block_invoke_4( uint64_t a1)
{
  v6[3] = *MEMORY[0x1895F89C0];
  v5[0] = @"needsUpload";
  uint64_t v2 = MEMORY[0x189604A88];
  v6[0] = [MEMORY[0x189607878] expressionForConstantValue:MEMORY[0x189604A88]];
  v5[1] = @"needsCloudDelete";
  v6[1] = [MEMORY[0x189607878] expressionForConstantValue:v2];
  v5[2] = @"pendingExportTransactionNumber";
  v6[2] = [MEMORY[0x189607878] expressionForConstantValue:*(void *)(a1 + 32)];
  id v3 = +[NSCKRecordMetadata batchUpdateMetadataMatchingEntityIdsAndPKs:withUpdates:inStore:withManagedObjectContext:error:]( (uint64_t)NSCKRecordMetadata,  *(void **)(*(void *)(*(void *)(a1 + 64) + 8) + 40),  [MEMORY[0x189603F68] dictionaryWithObjects:v6 forKeys:v5 count:3],  *(void *)(a1 + 40),  *(void *)(a1 + 48),  (void *)(*(void *)(*(void *)(a1 + 72) + 8) + 40));
  if (v3)
  {
    [*(id *)(a1 + 56) minusSet:v3];

    id result = objc_alloc_init(MEMORY[0x189603FC8]);
    *(void *)(*(void *)(*(void *)(a1 + 64) + 8LL) + 40LL) = result;
    *(void *)(*(void *)(*(void *)(a1 + 80) + 8LL) + 24LL) = 0LL;
  }

  else
  {
    *(_BYTE *)(*(void *)(*(void *)(a1 + 88) + 8LL) + 24LL) = 0;
    return *(id *)(*(void *)(*(void *)(a1 + 72) + 8LL) + 40LL);
  }

  return result;
}

void __86__PFCloudKitExportContext_processAnalyzedHistoryInStore_inManagedObjectContext_error___block_invoke_6( uint64_t a1)
{
  uint64_t v129 = *MEMORY[0x1895F89C0];
  id v80 = objc_alloc_init(MEMORY[0x189603FC8]);
  id v78 = objc_alloc_init(MEMORY[0x189603FE0]);
  id obj = objc_alloc_init(MEMORY[0x189603FC8]);
  while (*(_BYTE *)(*(void *)(*(void *)(a1 + 72) + 8LL) + 24LL))
  {
    if (![*(id *)(a1 + 32) count])
    {
      if (*(_BYTE *)(*(void *)(*(void *)(a1 + 72) + 8LL) + 24LL))
      {
        __int128 v112 = 0u;
        __int128 v113 = 0u;
        __int128 v110 = 0u;
        __int128 v111 = 0u;
        uint64_t v4 = [obj countByEnumeratingWithState:&v110 objects:v128 count:16];
        if (v4)
        {
          uint64_t v72 = *(void *)v111;
LABEL_8:
          uint64_t v5 = 0LL;
          uint64_t v74 = v4;
          while (1)
          {
            if (*(void *)v111 != v72) {
              objc_enumerationMutation(obj);
            }
            uint64_t v6 = *(void *)(*((void *)&v110 + 1) + 8 * v5);
            uint64_t v7 = (void *)[obj objectForKey:v6];
            uint64_t v76 = v5;
            __int128 v108 = 0u;
            __int128 v109 = 0u;
            __int128 v106 = 0u;
            __int128 v107 = 0u;
            uint64_t v8 = [v7 countByEnumeratingWithState:&v106 objects:v127 count:16];
            if (v8)
            {
              uint64_t v9 = *(void *)v107;
LABEL_13:
              uint64_t v10 = 0LL;
              while (1)
              {
                if (*(void *)v107 != v9) {
                  objc_enumerationMutation(v7);
                }
                uint64_t v11 = *(void *)(*((void *)&v106 + 1) + 8 * v10);
                id v12 = (void *)MEMORY[0x186E3E5D8]();
                uint64_t v13 = [v7 objectForKey:v11];
                id v14 = +[NSFetchRequest fetchRequestWithEntityName:]( &OBJC_CLASS___NSFetchRequest,  "fetchRequestWithEntityName:",  v11);
                -[NSFetchRequest setPredicate:]( v14,  "setPredicate:",  [MEMORY[0x1896079C8] predicateWithFormat:@"SELF IN %@", v13]);
                -[NSFetchRequest setFetchBatchSize:](v14, "setFetchBatchSize:", 500LL);
                uint64_t v15 = *(void *)(*(void *)(a1 + 56) + 8LL);
                if (v15) {
                  uint64_t v16 = *(void **)(v15 + 16);
                }
                else {
                  uint64_t v16 = 0LL;
                }
                int v17 = [v16 preserveLegacyRecordMetadataBehavior];
                char v18 = v17;
                if (v17
                  && objc_msgSend( (id)objc_msgSend( (id)objc_msgSend( (id)objc_msgSend( (id)objc_msgSend( (id)objc_msgSend(*(id *)(a1 + 40), "persistentStoreCoordinator"),  "managedObjectModel"),  "entitiesByName"),  "objectForKey:",  v11),  "propertiesByName"),  "objectForKey:",  @"ckRecordID"))
                {
                  v126 = @"ckRecordID";
                  -[NSFetchRequest setPropertiesToFetch:]( v14,  "setPropertiesToFetch:",  [MEMORY[0x189603F18] arrayWithObjects:&v126 count:1]);
                }

                id v19 = *(void **)(a1 + 40);
                v103[0] = MEMORY[0x1895F87A8];
                v103[1] = 3221225472LL;
                v103[2] = __86__PFCloudKitExportContext_processAnalyzedHistoryInStore_inManagedObjectContext_error___block_invoke_8;
                v103[3] = &unk_189EAB848;
                char v105 = v18;
                uint64_t v20 = *(void *)(a1 + 64);
                v103[4] = v6;
                v103[5] = v20;
                int8x16_t v104 = vextq_s8(*(int8x16_t *)(a1 + 72), *(int8x16_t *)(a1 + 72), 8uLL);
                v103[6] = v19;
                +[_PFRoutines efficientlyEnumerateManagedObjectsInFetchRequest:usingManagedObjectContext:andApplyBlock:]( (uint64_t)&OBJC_CLASS____PFRoutines,  (uint64_t)v14,  v19,  (uint64_t)v103);
                int v21 = *(unsigned __int8 *)(*(void *)(*(void *)(a1 + 72) + 8LL) + 24LL);
                objc_autoreleasePoolPop(v12);
                if (!v21) {
                  break;
                }
                if (v8 == ++v10)
                {
                  uint64_t v22 = [v7 countByEnumeratingWithState:&v106 objects:v127 count:16];
                  uint64_t v8 = v22;
                  if (v22) {
                    goto LABEL_13;
                  }
                  break;
                }
              }
            }

            if (!*(_BYTE *)(*(void *)(*(void *)(a1 + 72) + 8LL) + 24LL)) {
              break;
            }
            uint64_t v5 = v76 + 1;
            if (v76 + 1 == v74)
            {
              uint64_t v4 = [obj countByEnumeratingWithState:&v110 objects:v128 count:16];
              if (v4) {
                goto LABEL_8;
              }
              goto LABEL_29;
            }
          }
        }
      }

      break;
    }

    uint64_t v2 = [*(id *)(a1 + 32) anyObject];
    [*(id *)(a1 + 32) removeObject:v2];
    v114[0] = MEMORY[0x1895F87A8];
    v114[1] = 3221225472LL;
    v114[2] = __86__PFCloudKitExportContext_processAnalyzedHistoryInStore_inManagedObjectContext_error___block_invoke_7;
    v114[3] = &unk_189EAB820;
    uint64_t v3 = *(void *)(a1 + 32);
    v114[4] = *(void *)(a1 + 40);
    v114[5] = v2;
    __int128 v115 = *(_OWORD *)(a1 + 48);
    int8x16_t v120 = vextq_s8(*(int8x16_t *)(a1 + 72), *(int8x16_t *)(a1 + 72), 8uLL);
    id v116 = obj;
    uint64_t v117 = v3;
    id v118 = v78;
    id v119 = v80;
    +[_PFRoutines wrapBlockInGuardedAutoreleasePool:]( &OBJC_CLASS____PFRoutines,  "wrapBlockInGuardedAutoreleasePool:",  v114);
  }

void __86__PFCloudKitExportContext_processAnalyzedHistoryInStore_inManagedObjectContext_error___block_invoke_7( uint64_t a1)
{
  v65[1] = *MEMORY[0x1895F89C0];
  uint64_t v2 = (void *)[*(id *)(a1 + 32) existingObjectWithID:*(void *)(a1 + 40) error:*(void *)(*(void *)(a1 + 96) + 8) + 40];
  if (v2)
  {
    uint64_t v3 = v2;
    id v4 = +[PFCloudKitSerializer createSetOfObjectIDsRelatedToObject:]((uint64_t)&OBJC_CLASS___PFCloudKitSerializer, v2);
    if (![v4 count])
    {
LABEL_48:
      objc_msgSend(*(id *)(a1 + 32), "refreshObject:mergeChanges:", v3, objc_msgSend(v3, "hasChanges"));
      goto LABEL_49;
    }

    id v5 = +[NSCKRecordZoneMetadata fetchZoneIDsAssignedToObjectsWithIDs:fromStore:inContext:error:]( &OBJC_CLASS___NSCKRecordZoneMetadata,  "fetchZoneIDsAssignedToObjectsWithIDs:fromStore:inContext:error:",  v4,  *(void *)(a1 + 48),  *(void *)(a1 + 32),  *(void *)(*(void *)(a1 + 96) + 8LL) + 40LL);
    uint64_t v6 = v5;
    if (!v5)
    {
      *(_BYTE *)(*(void *)(*(void *)(a1 + 104) + 8LL) + 24LL) = 0;
      id v16 = *(id *)(*(void *)(*(void *)(a1 + 96) + 8LL) + 40LL);
LABEL_47:

      goto LABEL_48;
    }

    id v55 = v5;
    uint64_t v56 = v3;
    if ([v5 count])
    {
      if ([v6 count] == 1)
      {
        id v7 = (id)[v6 anyObject];
LABEL_26:
        id v40 = v7;
        goto LABEL_28;
      }

      if ((unint64_t)[v6 count] < 2)
      {
        id v40 = 0LL;
        goto LABEL_28;
      }

      *(_BYTE *)(*(void *)(*(void *)(a1 + 104) + 8LL) + 24LL) = 0;
      id v31 = objc_alloc(MEMORY[0x189607870]);
      uint64_t v32 = *MEMORY[0x189607460];
      uint64_t v62 = *MEMORY[0x1896075F0];
      uint64_t v63 = [NSString stringWithFormat:@"Object graph corruption detected. Objects related to '%@' are assigned to multiple zones: %@", *(void *)(a1 + 40), v6];
      uint64_t v36 = (void *)MEMORY[0x189603F68];
      uint64_t v37 = &v63;
      uint64_t v38 = &v62;
    }

    else
    {
      uint64_t v17 = *(void *)(*(void *)(a1 + 56) + 8LL);
      if (v17) {
        char v18 = *(void **)(v17 + 8);
      }
      else {
        char v18 = 0LL;
      }
      if ([v18 databaseScope] != 3)
      {
        uint64_t v41 = *(void *)(*(void *)(a1 + 56) + 8LL);
        if (v41) {
          uint64_t v42 = *(void **)(v41 + 8);
        }
        else {
          uint64_t v42 = 0LL;
        }
        id v7 = +[PFCloudKitSerializer defaultRecordZoneIDForDatabaseScope:]( PFCloudKitSerializer,  "defaultRecordZoneIDForDatabaseScope:",  [v42 databaseScope]);
        goto LABEL_26;
      }

      id v19 = (void *)MEMORY[0x186E3E5D8]();
      BOOL v20 = __ckLoggingOverride != 0;
      uint64_t v21 = [@"CoreData+CloudKit: %s(%d): " stringByAppendingString:@"%@: %@ - Failed to assign an object to a record zone. This usually means the object exists in a shared database and must be assigned to a zone using -[%@ %@]: %@"];
      uint64_t v22 = *(void *)(a1 + 48);
      id v23 = (objc_class *)objc_opt_class();
      id v24 = NSStringFromClass(v23);
      id v54 = NSStringFromSelector(sel_shareManagedObjects_toShare_completion_);
      id v53 = v24;
      _NSCoreDataLog( v20,  v21,  v25,  v26,  v27,  v28,  v29,  v30,  (uint64_t)"-[PFCloudKitExportContext processAnalyzedHistoryInStore:inManagedObjectContext:error:]_block_invoke_7");
      objc_autoreleasePoolPop(v19);
      *(_BYTE *)(*(void *)(*(void *)(a1 + 104) + 8LL) + 24LL) = 0;
      id v31 = objc_alloc(MEMORY[0x189607870]);
      uint64_t v32 = *MEMORY[0x189607460];
      uint64_t v64 = *MEMORY[0x1896075F0];
      uint64_t v33 = (void *)NSString;
      uint64_t v34 = (objc_class *)objc_opt_class();
      uint64_t v35 = NSStringFromClass(v34);
      v65[0] = [v33 stringWithFormat:@"Failed to assign an object to a record zone. This usually means the object exists in a shared database and must be assigned to a zone using -[%@ %@]: %@", v35, NSStringFromSelector(sel_shareManagedObjects_toShare_completion_), objc_msgSend(v3, "objectID"), v22, v53, v54, v3];
      uint64_t v36 = (void *)MEMORY[0x189603F68];
      uint64_t v37 = v65;
      uint64_t v38 = &v64;
    }

    uint64_t v39 = objc_msgSend( v31,  "initWithDomain:code:userInfo:",  v32,  134060,  objc_msgSend(v36, "dictionaryWithObjects:forKeys:count:", v37, v38, 1));
    id v40 = 0LL;
    *(void *)(*(void *)(*(void *)(a1 + 96) + 8LL) + 40LL) = v39;
LABEL_28:
    if (*(_BYTE *)(*(void *)(*(void *)(a1 + 104) + 8LL) + 24LL))
    {
      id v43 = (id)[*(id *)(a1 + 64) objectForKey:v40];
      if (!v43)
      {
        id v43 = objc_alloc_init(MEMORY[0x189603FC8]);
        [*(id *)(a1 + 64) setObject:v43 forKey:v40];
      }

      id v44 = (id)objc_msgSend(v43, "objectForKey:", objc_msgSend(*(id *)(a1 + 40), "entityName"));
      if (!v44)
      {
        id v44 = objc_alloc_init(MEMORY[0x189603FE0]);
        objc_msgSend(v43, "setObject:forKey:", v44, objc_msgSend(*(id *)(a1 + 40), "entityName"));
      }

      [v44 addObject:*(void *)(a1 + 40)];

      __int128 v59 = 0u;
      __int128 v60 = 0u;
      __int128 v57 = 0u;
      __int128 v58 = 0u;
      uint64_t v45 = [v4 countByEnumeratingWithState:&v57 objects:v61 count:16];
      if (v45)
      {
        uint64_t v46 = v45;
        uint64_t v47 = *(void *)v58;
        do
        {
          for (uint64_t i = 0LL; i != v46; ++i)
          {
            if (*(void *)v58 != v47) {
              objc_enumerationMutation(v4);
            }
            __int128 v49 = *(void **)(*((void *)&v57 + 1) + 8 * i);
            if ([*(id *)(a1 + 72) containsObject:v49])
            {
              [*(id *)(a1 + 72) removeObject:v49];
              id v50 = (id)[*(id *)(a1 + 64) objectForKey:v40];
              if (!v50)
              {
                id v50 = objc_alloc_init(MEMORY[0x189603FC8]);
                [*(id *)(a1 + 64) setObject:v50 forKey:v40];
              }

              id v51 = (id)objc_msgSend(v50, "objectForKey:", objc_msgSend(v49, "entityName"));
              if (!v51)
              {
                id v51 = objc_alloc_init(MEMORY[0x189603FE0]);
                objc_msgSend(v50, "setObject:forKey:", v51, objc_msgSend(v49, "entityName"));
              }

              [v51 addObject:v49];
            }
          }

          uint64_t v46 = [v4 countByEnumeratingWithState:&v57 objects:v61 count:16];
        }

        while (v46);
      }
    }

    uint64_t v6 = v55;
    uint64_t v3 = v56;
    goto LABEL_47;
  }

  if ([*(id *)(*(void *)(*(void *)(a1 + 96) + 8) + 40) code] == 133000
    && (uint64_t v8 = (void *)[*(id *)(*(void *)(*(void *)(a1 + 96) + 8) + 40) domain],
        [v8 isEqualToString:*MEMORY[0x189607460]]))
  {
    *(void *)(*(void *)(*(void *)(a1 + 96) + 8LL) + 40LL) = 0LL;
    [*(id *)(a1 + 80) addObject:*(void *)(a1 + 40)];
    uint64_t v9 = (void *)MEMORY[0x189607968];
    uint64_t v10 = _sqlEntityForEntityDescription( [*(id *)(a1 + 48) model],  (void *)objc_msgSend(*(id *)(a1 + 40), "entity"));
    if (v10) {
      uint64_t v11 = *(unsigned int *)(v10 + 184);
    }
    else {
      uint64_t v11 = 0LL;
    }
    uint64_t v12 = [v9 numberWithUnsignedInt:v11];
    uint64_t v13 = objc_msgSend(MEMORY[0x189607968], "numberWithLongLong:", objc_msgSend(*(id *)(a1 + 40), "_referenceData64"));
    id v14 = (id)[*(id *)(a1 + 88) objectForKey:v12];
    if (!v14)
    {
      id v14 = objc_alloc_init(MEMORY[0x189603FE0]);
      [*(id *)(a1 + 88) setObject:v14 forKey:v12];
    }

    [v14 addObject:v13];
  }

  else
  {
    id v15 = *(id *)(*(void *)(*(void *)(a1 + 96) + 8LL) + 40LL);
    *(_BYTE *)(*(void *)(*(void *)(a1 + 104) + 8LL) + 24LL) = 0;
  }

uint64_t __86__PFCloudKitExportContext_processAnalyzedHistoryInStore_inManagedObjectContext_error___block_invoke_8( uint64_t a1,  void *a2,  void *a3,  _BYTE *a4)
{
  uint64_t v20 = *MEMORY[0x1895F89C0];
  if (a2)
  {
    __int128 v17 = 0u;
    __int128 v18 = 0u;
    __int128 v15 = 0u;
    __int128 v16 = 0u;
    uint64_t v7 = [a2 countByEnumeratingWithState:&v15 objects:v19 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v16;
      do
      {
        uint64_t v10 = 0LL;
        do
        {
          if (*(void *)v16 != v9) {
            objc_enumerationMutation(a2);
          }
          id v11 = +[NSCKRecordMetadata insertMetadataForObject:setRecordName:inZoneWithID:recordNamePrefix:error:]( &OBJC_CLASS___NSCKRecordMetadata,  "insertMetadataForObject:setRecordName:inZoneWithID:recordNamePrefix:error:",  *(void *)(*((void *)&v15 + 1) + 8 * v10),  *(unsigned __int8 *)(a1 + 72),  *(void *)(a1 + 32),  0LL,  *(void *)(*(void *)(a1 + 56) + 8LL) + 40LL);
          if (v11)
          {
            uint64_t v12 = v11;
            [v11 setNeedsUpload:1];
            [v12 setNeedsCloudDelete:0];
            [v12 setPendingExportTransactionNumber:*(void *)(a1 + 40)];
          }

          else
          {
            id v13 = *(id *)(*(void *)(*(void *)(a1 + 56) + 8LL) + 40LL);
            *(_BYTE *)(*(void *)(*(void *)(a1 + 64) + 8LL) + 24LL) = 0;
            *a4 = 1;
          }

          ++v10;
        }

        while (v8 != v10);
        uint64_t v8 = [a2 countByEnumeratingWithState:&v15 objects:v19 count:16];
      }

      while (v8);
    }

    uint64_t result = [*(id *)(a1 + 48) save:*(void *)(*(void *)(a1 + 56) + 8) + 40];
    if ((result & 1) == 0)
    {
      *(_BYTE *)(*(void *)(*(void *)(a1 + 64) + 8LL) + 24LL) = 0;
      uint64_t result = (uint64_t)*(id *)(*(void *)(*(void *)(a1 + 56) + 8LL) + 40LL);
      *a4 = 1;
    }
  }

  else
  {
    *a4 = 1;
    *(_BYTE *)(*(void *)(*(void *)(a1 + 64) + 8LL) + 24LL) = 0;
    uint64_t result = a3;
    *(void *)(*(void *)(*(void *)(a1 + 56) + 8LL) + 40LL) = result;
  }

  return result;
}

id __86__PFCloudKitExportContext_processAnalyzedHistoryInStore_inManagedObjectContext_error___block_invoke_9( uint64_t a1,  uint64_t a2)
{
  if (a2) {
    uint64_t v3 = *(void *)(a2 + 24);
  }
  else {
    uint64_t v3 = 0LL;
  }
  id result = -[NSSQLiteConnection createArrayOfPrimaryKeysAndEntityIDsForRowsWithoutRecordMetadataWithEntity:metadataEntity:]( v3,  *(void **)(a1 + 32),  *(id **)(a1 + 40));
  *(void *)(*(void *)(*(void *)(a1 + 48) + 8LL) + 40LL) = result;
  return result;
}

- (uint64_t)insertRecordMetadataForObjectIDsInBatch:(void *)a3 inManagedObjectContext:(uint64_t)a4 withPendingTransactionNumber:(void *)a5 error:
{
  uint64_t v54 = *MEMORY[0x1895F89C0];
  if (!a1) {
    return 0LL;
  }
  id v48 = 0LL;
  uint64_t v9 = objc_msgSend((id)objc_msgSend(a2, "lastObject"), "entity");
  if (v9)
  {
    if ((*(_BYTE *)(v9 + 120) & 4) != 0)
    {
      uint64_t v10 = *(void **)(v9 + 72);
    }

    else
    {
      do
      {
        uint64_t v10 = (void *)v9;
        uint64_t v9 = [(id)v9 superentity];
      }

      while (v9);
    }
  }

  else
  {
    uint64_t v10 = 0LL;
  }

  id v11 = +[NSFetchRequest fetchRequestWithEntityName:]( NSFetchRequest,  "fetchRequestWithEntityName:",  [v10 name]);
  -[NSFetchRequest setPredicate:]( v11,  "setPredicate:",  [MEMORY[0x1896079C8] predicateWithFormat:@"SELF in %@", a2]);
  uint64_t v12 = (void *)[a3 executeFetchRequest:v11 error:&v48];
  if (!v12)
  {
    id v30 = v48;
    goto LABEL_28;
  }

  id v13 = v12;
  __int128 v46 = 0u;
  __int128 v47 = 0u;
  __int128 v44 = 0u;
  __int128 v45 = 0u;
  uint64_t v14 = [v12 countByEnumeratingWithState:&v44 objects:v53 count:16];
  if (v14)
  {
    uint64_t v15 = v14;
    uint64_t v41 = a5;
    uint64_t v16 = *(void *)v45;
    char v42 = 1;
    do
    {
      uint64_t v17 = 0LL;
      do
      {
        if (*(void *)v45 != v16) {
          objc_enumerationMutation(v13);
        }
        uint64_t v18 = *(void *)(*((void *)&v44 + 1) + 8 * v17);
        id v19 = (void *)MEMORY[0x186E3E5D8]();
        uint64_t v20 = *(void *)(a1 + 8);
        if (v20) {
          uint64_t v21 = *(void **)(v20 + 8);
        }
        else {
          uint64_t v21 = 0LL;
        }
        id v22 = +[PFCloudKitSerializer defaultRecordZoneIDForDatabaseScope:]( PFCloudKitSerializer,  "defaultRecordZoneIDForDatabaseScope:",  [v21 databaseScope]);
        uint64_t v23 = *(void *)(a1 + 8);
        if (v23) {
          id v24 = *(void **)(v23 + 16);
        }
        else {
          id v24 = 0LL;
        }
        id v25 = +[NSCKRecordMetadata insertMetadataForObject:setRecordName:inZoneWithID:recordNamePrefix:error:]( NSCKRecordMetadata,  "insertMetadataForObject:setRecordName:inZoneWithID:recordNamePrefix:error:",  v18,  [v24 preserveLegacyRecordMetadataBehavior],  v22,  0,  &v48);
        if (v25)
        {
          uint64_t v26 = v25;
          [v25 setNeedsUpload:1];
          [v26 setPendingExportTransactionNumber:a4];
          [v26 setPendingExportChangeTypeNumber:&unk_189F045F0];
        }

        else
        {
          id v27 = v48;
          char v42 = 0;
        }

        objc_autoreleasePoolPop(v19);
        ++v17;
      }

      while (v15 != v17);
      uint64_t v28 = [v13 countByEnumeratingWithState:&v44 objects:v53 count:16];
      uint64_t v15 = v28;
    }

    while (v28);
    a5 = v41;
    if ((v42 & 1) == 0)
    {
LABEL_28:
      id v31 = v48;
      if (v31)
      {
        if (a5)
        {
          uint64_t v29 = 0LL;
          *a5 = v31;
          goto LABEL_34;
        }
      }

      else
      {
        uint64_t v32 = [NSString stringWithUTF8String:"Illegal attempt to return an error without one in %s:%d"];
        _NSCoreDataLog( 17LL,  v32,  v33,  v34,  v35,  v36,  v37,  v38,  (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Persistence/PFCloudKitExportContext.m");
        uint64_t v39 = (os_log_s *)__pflogFaultLog;
        if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
        {
          *(_DWORD *)buf = 136315394;
          id v50 = "/Library/Caches/com.apple.xbs/Sources/Persistence/PFCloudKitExportContext.m";
          __int16 v51 = 1024;
          int v52 = 1366;
          _os_log_fault_impl( &dword_186681000,  v39,  OS_LOG_TYPE_FAULT,  "CoreData: Illegal attempt to return an error without one in %s:%d",  buf,  0x12u);
        }
      }

      uint64_t v29 = 0LL;
      goto LABEL_34;
    }
  }

  uint64_t v29 = 1LL;
LABEL_34:

  return v29;
}

void __86__PFCloudKitExportContext_processAnalyzedHistoryInStore_inManagedObjectContext_error___block_invoke_10( uint64_t a1,  void *a2,  void *a3,  _BYTE *a4)
{
  uint64_t v33 = *MEMORY[0x1895F89C0];
  if (a2)
  {
    id v7 = objc_alloc_init(MEMORY[0x189603FA8]);
    __int128 v27 = 0u;
    __int128 v28 = 0u;
    __int128 v29 = 0u;
    __int128 v30 = 0u;
    uint64_t v8 = [a2 countByEnumeratingWithState:&v27 objects:v32 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v28;
      do
      {
        for (uint64_t i = 0LL; i != v9; ++i)
        {
          if (*(void *)v28 != v10) {
            objc_enumerationMutation(a2);
          }
          uint64_t v12 = (void *)[*(id *)(*((void *)&v27 + 1) + 8 * i) createRecordIDForMovedRecord];
          [v7 addObject:v12];
        }

        uint64_t v9 = [a2 countByEnumeratingWithState:&v27 objects:v32 count:16];
      }

      while (v9);
    }

    id v13 = +[NSCKMirroredRelationship fetchMirroredRelationshipsMatchingRelatingRecords:andRelatingRecordIDs:fromStore:inManagedObjectContext:error:]( (uint64_t)&OBJC_CLASS___NSCKMirroredRelationship,  MEMORY[0x189604A58],  v7,  *(void *)(a1 + 32),  *(void **)(a1 + 40),  (void *)(*(void *)(*(void *)(a1 + 48) + 8LL) + 40LL));
    if (!v13) {
      goto LABEL_18;
    }
    uint64_t v14 = v13;
    __int128 v25 = 0u;
    __int128 v26 = 0u;
    __int128 v23 = 0u;
    __int128 v24 = 0u;
    uint64_t v15 = [v13 countByEnumeratingWithState:&v23 objects:v31 count:16];
    if (v15)
    {
      uint64_t v16 = v15;
      uint64_t v17 = *(void *)v24;
      uint64_t v18 = MEMORY[0x189604A80];
      uint64_t v19 = MEMORY[0x189604A88];
      do
      {
        for (uint64_t j = 0LL; j != v16; ++j)
        {
          if (*(void *)v24 != v17) {
            objc_enumerationMutation(v14);
          }
          uint64_t v21 = *(void **)(*((void *)&v23 + 1) + 8 * j);
          [v21 setIsUploaded:v18];
          [v21 setNeedsDelete:v19];
        }

        uint64_t v16 = [v14 countByEnumeratingWithState:&v23 objects:v31 count:16];
      }

      while (v16);
    }

    if (([*(id *)(a1 + 40) save:*(void *)(*(void *)(a1 + 48) + 8) + 40] & 1) == 0)
    {
LABEL_18:
      id v22 = *(id *)(*(void *)(*(void *)(a1 + 48) + 8LL) + 40LL);
      *(_BYTE *)(*(void *)(*(void *)(a1 + 56) + 8LL) + 24LL) = 0;
      *a4 = 1;
    }
  }

  else
  {
    *(void *)(*(void *)(*(void *)(a1 + 48) + 8LL) + 40LL) = a3;
    *(_BYTE *)(*(void *)(*(void *)(a1 + 56) + 8LL) + 24LL) = 0;
    *a4 = 1;
  }

- (void)newOperationBySerializingDirtyObjectsInStore:(void *)a3 inManagedObjectContext:(void *)a4 error:
{
  uint64_t v46 = *MEMORY[0x1895F89C0];
  if (!a1) {
    return 0LL;
  }
  uint64_t v38 = 0LL;
  uint64_t v39 = &v38;
  uint64_t v40 = 0x2020000000LL;
  char v41 = 1;
  uint64_t v32 = 0LL;
  uint64_t v33 = &v32;
  uint64_t v34 = 0x3052000000LL;
  uint64_t v35 = __Block_byref_object_copy__44;
  uint64_t v36 = __Block_byref_object_dispose__44;
  uint64_t v37 = 0LL;
  uint64_t v26 = 0LL;
  __int128 v27 = &v26;
  uint64_t v28 = 0x3052000000LL;
  __int128 v29 = __Block_byref_object_copy__44;
  __int128 v30 = __Block_byref_object_dispose__44;
  uint64_t v31 = 0LL;
  uint64_t v8 = objc_alloc_init(&OBJC_CLASS___PFCloudKitOperationBatch);
  id v9 = objc_alloc_init(MEMORY[0x189603FE0]);
  v25[0] = MEMORY[0x1895F87A8];
  v25[1] = 3221225472LL;
  v25[2] = __101__PFCloudKitExportContext_newOperationBySerializingDirtyObjectsInStore_inManagedObjectContext_error___block_invoke;
  v25[3] = &unk_189EAB8C0;
  v25[4] = a2;
  v25[5] = a1;
  v25[10] = &v38;
  v25[11] = &v26;
  v25[6] = a3;
  v25[7] = v8;
  v25[8] = v9;
  v25[9] = &v32;
  [a3 performBlockAndWait:v25];
  uint64_t v10 = (void *)a1[5];
  uint64_t v11 = v27[5];
  if (v11) {
    id v12 = (id)[*(id *)(v11 + 40) copy];
  }
  else {
    id v12 = 0LL;
  }
  [v10 addObjectsFromArray:v12];
  id v13 = 0LL;
  if (*((_BYTE *)v39 + 24) && v8)
  {
    uint64_t v14 = -[NSMutableArray count](v8->_records, "count");
    if (-[NSMutableSet count](v8->_deletedRecordIDs, "count") + v14)
    {
      id v13 = (void *)objc_msgSend( objc_alloc((Class)getCloudKitCKModifyRecordsOperationClass[0]()),  "initWithRecordsToSave:recordIDsToDelete:",  v8->_records,  -[NSMutableSet allObjects](v8->_deletedRecordIDs, "allObjects"));
      a1[2] += v8->_sizeInBytes;
      a1[3] += -[NSMutableArray count](v8->_records, "count");
      a1[4] += -[NSMutableSet count](v8->_deletedRecordIDs, "count");
    }

    else
    {
      id v13 = 0LL;
    }
  }

  v27[5] = 0LL;
  if (!*((_BYTE *)v39 + 24))
  {
    id v15 = (id)v33[5];
    if (v15)
    {
      if (a4) {
        *a4 = v15;
      }
    }

    else
    {
      uint64_t v16 = [NSString stringWithUTF8String:"Illegal attempt to return an error without one in %s:%d"];
      _NSCoreDataLog( 17LL,  v16,  v17,  v18,  v19,  v20,  v21,  v22,  (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Persistence/PFCloudKitExportContext.m");
      __int128 v23 = (os_log_s *)__pflogFaultLog;
      if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 136315394;
        id v43 = "/Library/Caches/com.apple.xbs/Sources/Persistence/PFCloudKitExportContext.m";
        __int16 v44 = 1024;
        int v45 = 1039;
        _os_log_fault_impl( &dword_186681000,  v23,  OS_LOG_TYPE_FAULT,  "CoreData: Illegal attempt to return an error without one in %s:%d",  buf,  0x12u);
      }
    }

    id v13 = 0LL;
  }

  v33[5] = 0LL;
  _Block_object_dispose(&v26, 8);
  _Block_object_dispose(&v32, 8);
  _Block_object_dispose(&v38, 8);
  return v13;
}

void __101__PFCloudKitExportContext_newOperationBySerializingDirtyObjectsInStore_inManagedObjectContext_error___block_invoke( uint64_t a1)
{
  v205[1] = *MEMORY[0x1895F89C0];
  id v1 = objc_alloc_init(MEMORY[0x189603FA8]);
  uint64_t v2 = +[NSFetchRequest fetchRequestWithEntityName:]( &OBJC_CLASS___NSFetchRequest,  "fetchRequestWithEntityName:",  +[NSCKRecordMetadata entityPath](&OBJC_CLASS___NSCKRecordMetadata, "entityPath"));
  -[NSFetchRequest setReturnsObjectsAsFaults:](v2, "setReturnsObjectsAsFaults:", 0LL);
  v205[0] = *(void *)(a1 + 32);
  -[NSFetchRequest setAffectedStores:]( v2,  "setAffectedStores:",  [MEMORY[0x189603F18] arrayWithObjects:v205 count:1]);
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8LL);
  if (v3) {
    uint64_t v4 = *(void *)(v3 + 32);
  }
  else {
    uint64_t v4 = 0LL;
  }
  -[NSFetchRequest setFetchLimit:](v2, "setFetchLimit:", v4);
  -[NSFetchRequest setPropertiesToFetch:](v2, "setPropertiesToFetch:", &unk_189F0B328);
  -[NSFetchRequest setPredicate:]( v2,  "setPredicate:",  [MEMORY[0x1896079C8] predicateWithFormat:@"needsUpload = YES"]);
  id v5 = (void *)[*(id *)(a1 + 48) executeFetchRequest:v2 error:*(void *)(*(void *)(a1 + 72) + 8) + 40];
  uint64_t v6 = v5;
  if (v5)
  {
    __int128 v190 = 0u;
    __int128 v191 = 0u;
    __int128 v188 = 0u;
    __int128 v189 = 0u;
    uint64_t v7 = [v5 countByEnumeratingWithState:&v188 objects:v204 count:16];
    if (v7)
    {
      uint64_t v8 = *(void *)v189;
      do
      {
        for (uint64_t i = 0LL; i != v7; ++i)
        {
          if (*(void *)v189 != v8) {
            objc_enumerationMutation(v6);
          }
          uint64_t v10 = *(void **)(*((void *)&v188 + 1) + 8 * i);
          uint64_t v11 = (void *)MEMORY[0x186E3E5D8]();
          id v12 = -[NSCKRecordMetadata createObjectIDForLinkedRow](v10);
          [v1 addObject:v12];

          objc_autoreleasePoolPop(v11);
        }

        uint64_t v7 = [v6 countByEnumeratingWithState:&v188 objects:v204 count:16];
      }

      while (v7);
    }
  }

  else
  {
    *(_BYTE *)(*(void *)(*(void *)(a1 + 80) + 8LL) + 24LL) = 0;
    id v13 = *(id *)(*(void *)(*(void *)(a1 + 72) + 8LL) + 40LL);
  }

  if (*(_BYTE *)(*(void *)(*(void *)(a1 + 80) + 8LL) + 24LL))
  {
    v158 = objc_alloc_init(&OBJC_CLASS___PFCloudKitMetadataCache);
    uint64_t v14 = *(void *)(*(void *)(a1 + 40) + 8LL);
    if (v14) {
      uint64_t v15 = *(void *)(v14 + 16);
    }
    else {
      uint64_t v15 = 0LL;
    }
    if (-[PFCloudKitMetadataCache cacheMetadataForObjectsWithIDs:andRecordsWithIDs:inStore:withManagedObjectContext:mirroringOptions:error:]( (id *)&v158->super.isa,  v1,  MEMORY[0x189604A58],  *(void **)(a1 + 32),  *(void **)(a1 + 48),  v15,  (void *)(*(void *)(*(void *)(a1 + 72) + 8LL) + 40LL)))
    {
      uint64_t v16 = objc_alloc(&OBJC_CLASS___PFCloudKitSerializer);
      uint64_t v17 = *(void *)(*(void *)(a1 + 40) + 8LL);
      if (v17) {
        uint64_t v18 = *(void *)(v17 + 16);
      }
      else {
        uint64_t v18 = 0LL;
      }
      *(void *)(*(void *)(*(void *)(a1 + 88) + 8LL) + 40LL) = -[PFCloudKitSerializer initWithMirroringOptions:metadataCache:recordNamePrefix:]( v16,  "initWithMirroringOptions:metadataCache:recordNamePrefix:",  v18,  v158,  0LL);
      __int128 v184 = 0u;
      __int128 v185 = 0u;
      __int128 v186 = 0u;
      __int128 v187 = 0u;
      uint64_t v152 = [v6 countByEnumeratingWithState:&v184 objects:v203 count:16];
      if (v152)
      {
        uint64_t v151 = *(void *)v185;
        uint64_t v148 = *MEMORY[0x189607460];
LABEL_21:
        uint64_t v155 = 0LL;
        while (1)
        {
          if (*(void *)v185 != v151) {
            objc_enumerationMutation(v6);
          }
          uint64_t v19 = *(void **)(*((void *)&v184 + 1) + 8 * v155);
          context = (void *)MEMORY[0x186E3E5D8]();
          v154 = -[NSCKRecordMetadata createObjectIDForLinkedRow](v19);
          uint64_t v156 = +[PFCloudKitSerializer recordTypeForEntity:]( (uint64_t)PFCloudKitSerializer,  [v154 entity]);
          uint64_t v20 = (void *)-[NSCKRecordMetadata createRecordID](v19);
          uint64_t v21 = [v20 zoneID];
          if (v158
            && (uint64_t v21 = -[NSMutableSet containsObject:](v158->_mutableZoneIDs, "containsObject:", v21), (_DWORD)v21))
          {
            if ([v19 needsCloudDelete])
            {
              -[PFCloudKitOperationBatch addDeletedRecordID:forRecordOfType:](*(void *)(a1 + 56), v20, v156);
            }

            else
            {
              uint64_t v32 = (void *)[*(id *)(a1 + 48) existingObjectWithID:v154 error:*(void *)(*(void *)(a1 + 72) + 8) + 40];
              uint64_t v33 = v32;
              if (v32)
              {
                if (objc_msgSend( (id)objc_msgSend( (id)objc_msgSend((id)objc_msgSend(v32, "objectID"), "persistentStore"),  "identifier"),  "isEqualToString:",  objc_msgSend(*(id *)(a1 + 32), "identifier")))
                {
                  id v149 = objc_alloc_init(MEMORY[0x1896077E8]);
                  uint64_t v34 = *(void *)(*(void *)(*(void *)(a1 + 88) + 8LL) + 40LL);
                  if (v34) {
                    id obj = -[PFCloudKitSerializer newCKRecordsFromObject:fullyMaterializeRecords:includeRelationships:error:]( v34,  v33,  0,  1,  (void *)(*(void *)(*(void *)(a1 + 72) + 8LL) + 40LL));
                  }
                  else {
                    id obj = 0LL;
                  }
                  objc_msgSend(*(id *)(a1 + 48), "refreshObject:mergeChanges:", v33, objc_msgSend(v33, "hasChanges"));
                  if (obj)
                  {
                    __int128 v182 = 0u;
                    __int128 v183 = 0u;
                    __int128 v180 = 0u;
                    __int128 v181 = 0u;
                    uint64_t v35 = [obj countByEnumeratingWithState:&v180 objects:v202 count:16];
                    if (v35)
                    {
                      uint64_t v36 = *(void *)v181;
LABEL_39:
                      uint64_t v37 = 0LL;
                      while (1)
                      {
                        if (*(void *)v181 != v36) {
                          objc_enumerationMutation(obj);
                        }
                        uint64_t v38 = *(void *)(a1 + 56);
                        uint64_t v39 = v38 ? *(void **)(v38 + 8) : 0LL;
                        uint64_t v40 = *(void **)(*((void *)&v180 + 1) + 8 * v37);
                        if (objc_msgSend(v39, "containsObject:", objc_msgSend(v40, "recordID"))) {
                          -[PFCloudKitOperationBatch addDeletedRecordID:forRecordOfType:]( *(void *)(a1 + 56),  (void *)[v40 recordID],  v156);
                        }
                        else {
                          -[PFCloudKitOperationBatch addRecord:](*(void *)(a1 + 56), v40);
                        }
                        if ((-[PFCloudKitExportContext currentBatchExceedsThresholds:]( *(void *)(a1 + 40),  *(void *)(a1 + 56)) & 1) != 0) {
                          break;
                        }
                        if (v35 == ++v37)
                        {
                          uint64_t v41 = [obj countByEnumeratingWithState:&v180 objects:v202 count:16];
                          uint64_t v35 = v41;
                          if (v41) {
                            goto LABEL_39;
                          }
                          break;
                        }
                      }
                    }
                  }

                  else
                  {
                    *(_BYTE *)(*(void *)(*(void *)(a1 + 80) + 8LL) + 24LL) = 0;
                    id v44 = *(id *)(*(void *)(*(void *)(a1 + 72) + 8LL) + 40LL);
                  }

                  __int128 v178 = 0u;
                  __int128 v179 = 0u;
                  __int128 v176 = 0u;
                  __int128 v177 = 0u;
                  int v45 = (void *)[v19 moveReceipts];
                  uint64_t v46 = [v45 countByEnumeratingWithState:&v176 objects:v201 count:16];
                  if (v46)
                  {
                    uint64_t v47 = *(void *)v177;
                    do
                    {
                      for (uint64_t j = 0LL; j != v46; ++j)
                      {
                        if (*(void *)v177 != v47) {
                          objc_enumerationMutation(v45);
                        }
                        __int128 v49 = *(void **)(*((void *)&v176 + 1) + 8 * j);
                        if ([v49 needsCloudDelete])
                        {
                          if ((-[PFCloudKitExportContext currentBatchExceedsThresholds:]( *(void *)(a1 + 40),  *(void *)(a1 + 56)) & 1) != 0) {
                            goto LABEL_69;
                          }
                          id v50 = (void *)[v49 createRecordIDForMovedRecord];
                          -[PFCloudKitOperationBatch addDeletedRecordID:forRecordOfType:]( *(void *)(a1 + 56),  v50,  v156);
                          objc_msgSend(*(id *)(a1 + 64), "addObject:", objc_msgSend(v49, "objectID"));
                        }
                      }

                      uint64_t v46 = [v45 countByEnumeratingWithState:&v176 objects:v201 count:16];
                    }

                    while (v46);
                  }

- (uint64_t)currentBatchExceedsThresholds:(uint64_t)result
{
  if (result)
  {
    uint64_t v3 = result;
    if (a2)
    {
      uint64_t v4 = [*(id *)(a2 + 24) count];
      uint64_t v5 = [*(id *)(a2 + 8) count] + v4;
    }

    else
    {
      uint64_t v5 = 0LL;
    }

    unint64_t v6 = *(void *)(v3 + 8);
    if (v6) {
      uint64_t v7 = *(void *)(v6 + 32);
    }
    else {
      uint64_t v7 = 0LL;
    }
    if (v5 == v7) {
      return 1LL;
    }
    if (a2)
    {
      unint64_t v8 = *(void *)(a2 + 40);
      if (!v6) {
        return v8 >= v6;
      }
    }

    else
    {
      unint64_t v8 = 0LL;
      if (!v6) {
        return v8 >= v6;
      }
    }

    unint64_t v6 = *(void *)(v6 + 24);
    return v8 >= v6;
  }

  return result;
}

- (BOOL)checkForObjectsNeedingExportInStore:(id)a3 andReturnCount:(unint64_t *)a4 withManagedObjectContext:(id)a5 error:(id *)a6
{
  v34[1] = *MEMORY[0x1895F89C0];
  id v28 = 0LL;
  uint64_t v10 = (void *)+[NSCKRecordMetadata countRecordMetadataInStore:matchingPredicate:withManagedObjectContext:error:]( (uint64_t)NSCKRecordMetadata,  (uint64_t)a3,  [MEMORY[0x1896079C8] predicateWithFormat:@"needsUpload = YES"],  (uint64_t)a5,  &v28);
  if (v10)
  {
    uint64_t v11 = [v10 unsignedIntegerValue];
    id v12 = (void *)+[NSCKMirroredRelationship countMirroredRelationshipsInStore:matchingPredicate:withManagedObjectContext:error:]( (uint64_t)NSCKMirroredRelationship,  (uint64_t)a3,  [MEMORY[0x1896079C8] predicateWithFormat:@"isUploaded = NO"],  (uint64_t)a5,  &v28);
    if (v12)
    {
      uint64_t v13 = [v12 unsignedIntegerValue];
      uint64_t v14 = +[NSFetchRequest fetchRequestWithEntityName:]( &OBJC_CLASS___NSFetchRequest,  "fetchRequestWithEntityName:",  +[NSCKRecordZoneMetadata entityPath](&OBJC_CLASS___NSCKRecordZoneMetadata, "entityPath"));
      -[NSFetchRequest setPredicate:]( v14,  "setPredicate:",  [MEMORY[0x1896079C8] predicateWithFormat:@"needsShareUpdate = YES OR needsShareDelete = YES"]);
      -[NSFetchRequest setResultType:](v14, "setResultType:", 4LL);
      v34[0] = a3;
      -[NSFetchRequest setAffectedStores:]( v14,  "setAffectedStores:",  [MEMORY[0x189603F18] arrayWithObjects:v34 count:1]);
      if (a5)
      {
        -[NSManagedObjectContext _countForFetchRequest_:error:]((uint64_t)a5, v14, &v28);
        uint64_t v16 = v15;
        if (v15 == 0x7FFFFFFFFFFFFFFFLL) {
          goto LABEL_7;
        }
      }

      else
      {
        uint64_t v16 = 0LL;
      }

      uint64_t v17 = +[NSFetchRequest fetchRequestWithEntityName:]( &OBJC_CLASS___NSFetchRequest,  "fetchRequestWithEntityName:",  +[NSCKRecordZoneMoveReceipt entityPath](&OBJC_CLASS___NSCKRecordZoneMoveReceipt, "entityPath"));
      -[NSFetchRequest setPredicate:]( v17,  "setPredicate:",  [MEMORY[0x1896079C8] predicateWithFormat:@"needsCloudDelete = YES"]);
      -[NSFetchRequest setResultType:](v17, "setResultType:", 4LL);
      id v33 = a3;
      -[NSFetchRequest setAffectedStores:]( v17,  "setAffectedStores:",  [MEMORY[0x189603F18] arrayWithObjects:&v33 count:1]);
      if (a5)
      {
        -[NSManagedObjectContext _countForFetchRequest_:error:]((uint64_t)a5, v17, &v28);
        if (v18 == 0x7FFFFFFFFFFFFFFFLL) {
          goto LABEL_7;
        }
      }

      else
      {
        uint64_t v18 = 0LL;
      }

      *a4 = v13 + v11 + v16 + v18;
      LOBYTE(v18) = 1;
      return v18;
    }
  }

- (BOOL)modifyRecordsOperationFinishedForStore:(uint64_t)a3 withSavedRecords:(uint64_t)a4 deletedRecordIDs:(uint64_t)a5 operationError:(void *)a6 managedObjectContext:(void *)a7 error:
{
  uint64_t v35 = *MEMORY[0x1895F89C0];
  if (!a1) {
    return 0LL;
  }
  uint64_t v27 = 0LL;
  id v28 = &v27;
  uint64_t v29 = 0x2020000000LL;
  char v30 = 1;
  uint64_t v21 = 0LL;
  uint64_t v22 = &v21;
  uint64_t v23 = 0x3052000000LL;
  uint64_t v24 = __Block_byref_object_copy__44;
  uint64_t v25 = __Block_byref_object_dispose__44;
  uint64_t v26 = 0LL;
  v20[0] = MEMORY[0x1895F87A8];
  v20[1] = 3221225472LL;
  v20[2] = __142__PFCloudKitExportContext_modifyRecordsOperationFinishedForStore_withSavedRecords_deletedRecordIDs_operationError_managedObjectContext_error___block_invoke;
  v20[3] = &unk_189EAB910;
  v20[4] = a3;
  v20[5] = a2;
  v20[9] = &v27;
  v20[10] = &v21;
  v20[6] = a6;
  v20[7] = a1;
  v20[8] = a4;
  [a6 performBlockAndWait:v20];
  if (!*((_BYTE *)v28 + 24))
  {
    id v10 = (id)v22[5];
    uint64_t v11 = v22[5];
    if (v11)
    {
      if (a7) {
        *a7 = v11;
      }
    }

    else
    {
      uint64_t v12 = [NSString stringWithUTF8String:"Illegal attempt to return an error without one in %s:%d"];
      _NSCoreDataLog( 17LL,  v12,  v13,  v14,  v15,  v16,  v17,  v18,  (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Persistence/PFCloudKitExportContext.m");
      uint64_t v19 = (os_log_s *)__pflogFaultLog;
      if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 136315394;
        int v32 = "/Library/Caches/com.apple.xbs/Sources/Persistence/PFCloudKitExportContext.m";
        __int16 v33 = 1024;
        int v34 = 1312;
        _os_log_fault_impl( &dword_186681000,  v19,  OS_LOG_TYPE_FAULT,  "CoreData: Illegal attempt to return an error without one in %s:%d",  buf,  0x12u);
      }
    }
  }

  v22[5] = 0LL;
  BOOL v8 = *((_BYTE *)v28 + 24) != 0;
  _Block_object_dispose(&v21, 8);
  _Block_object_dispose(&v27, 8);
  return v8;
}

void __142__PFCloudKitExportContext_modifyRecordsOperationFinishedForStore_withSavedRecords_deletedRecordIDs_operationError_managedObjectContext_error___block_invoke( uint64_t a1)
{
  uint64_t v140 = *MEMORY[0x1895F89C0];
  if (*(_BYTE *)(*(void *)(*(void *)(a1 + 72) + 8LL) + 24LL))
  {
    uint64_t v104 = (void *)objc_msgSend( objc_alloc(MEMORY[0x189603FC8]),  "initWithCapacity:",  objc_msgSend(*(id *)(a1 + 32), "count"));
    id v105 = objc_alloc_init(MEMORY[0x189603FA8]);
    id obj = objc_alloc_init(MEMORY[0x189603FA8]);
    id v101 = objc_alloc_init(MEMORY[0x189603FA8]);
    __int128 v129 = 0u;
    __int128 v130 = 0u;
    __int128 v127 = 0u;
    __int128 v128 = 0u;
    uint64_t v2 = *(void **)(a1 + 32);
    uint64_t v3 = [v2 countByEnumeratingWithState:&v127 objects:v139 count:16];
    if (v3)
    {
      uint64_t v4 = *(void *)v128;
      do
      {
        for (uint64_t i = 0LL; i != v3; ++i)
        {
          if (*(void *)v128 != v4) {
            objc_enumerationMutation(v2);
          }
          unint64_t v6 = *(void **)(*((void *)&v127 + 1) + 8 * i);
          char v7 = +[PFCloudKitSerializer isMirroredRelationshipRecordType:]( (uint64_t)PFCloudKitSerializer,  (void *)[v6 recordType]);
          BOOL v8 = v105;
          if ((v7 & 1) != 0
            || (id v9 = (void *)[v6 recordType],
                int v10 = [v9 isEqualToString:getCloudKitCKRecordTypeShare[0]()],
                BOOL v8 = obj,
                v10))
          {
            [v8 addObject:v6];
          }

          else
          {
            objc_msgSend(v104, "setObject:forKey:", v6, objc_msgSend(v6, "recordID"));
          }
        }

        uint64_t v3 = [v2 countByEnumeratingWithState:&v127 objects:v139 count:16];
      }

      while (v3);
    }

    uint64_t v102 = (void *)+[NSCKRecordMetadata createMapOfMetadataMatchingRecords:andRecordIDs:inStore:withManagedObjectContext:error:]( (uint64_t)&OBJC_CLASS___NSCKRecordMetadata,  *(void **)(a1 + 32),  MEMORY[0x189604A58],  *(void **)(a1 + 40),  *(void **)(a1 + 48),  (id *)(*(void *)(*(void *)(a1 + 80) + 8LL) + 40LL));
    if (!v102)
    {
      id v43 = (void *)MEMORY[0x186E3E5D8]();
      uint64_t v44 = __ckLoggingOverride;
      uint64_t v45 = [@"CoreData+CloudKit: %s(%d): " stringByAppendingString:@"Failed to fetch record metadata for saved records: %@\n%@"];
      _NSCoreDataLog( v44 != 0,  v45,  v46,  v47,  v48,  v49,  v50,  v51,  (uint64_t)"-[PFCloudKitExportContext modifyRecordsOperationFinishedForStore:withSavedRecords:deletedRecordIDs:oper ationError:managedObjectContext:error:]_block_invoke");
      objc_autoreleasePoolPop(v43);
      *(_BYTE *)(*(void *)(*(void *)(a1 + 72) + 8LL) + 24LL) = 0;
      id v52 = *(id *)(*(void *)(*(void *)(a1 + 80) + 8LL) + 40LL);
      goto LABEL_38;
    }

    __int128 v125 = 0u;
    __int128 v126 = 0u;
    __int128 v123 = 0u;
    __int128 v124 = 0u;
    uint64_t v11 = (void *)[v104 allKeys];
    uint64_t v12 = [v11 countByEnumeratingWithState:&v123 objects:v138 count:16];
    if (v12)
    {
      uint64_t v13 = *(void *)v124;
      do
      {
        uint64_t v14 = 0LL;
        do
        {
          if (*(void *)v124 != v13) {
            objc_enumerationMutation(v11);
          }
          uint64_t v15 = *(void *)(*((void *)&v123 + 1) + 8 * v14);
          uint64_t v16 = [v104 objectForKey:v15];
          uint64_t v17 = (void *)[v102 objectForKey:v15];
          if (!v16)
          {
            uint64_t v23 = (void *)MEMORY[0x186E3E5D8](v17);
            uint64_t v24 = __ckLoggingOverride;
            uint64_t v25 = [@"CoreData+CloudKit: %s(%d): " stringByAppendingString:@"%@: Can't find record for recordID '%@' even though it was supposedly saved in these records: %@"];
            _NSCoreDataLog( v24 != 0,  v25,  v26,  v27,  v28,  v29,  v30,  v31,  (uint64_t)"-[PFCloudKitExportContext modifyRecordsOperationFinishedForStore:withSavedRecords:deletedRecordID s:operationError:managedObjectContext:error:]_block_invoke");
LABEL_28:
            objc_autoreleasePoolPop(v23);
            goto LABEL_31;
          }

          uint64_t v18 = v17;
          if (!v17)
          {
            uint64_t v23 = (void *)MEMORY[0x186E3E5D8]();
            uint64_t v32 = __ckLoggingOverride;
            uint64_t v33 = [@"CoreData+CloudKit: %s(%d): " stringByAppendingString:@"%@: Can't find metadata for recordID '%@' even though it was supposedly saved in these records: %@"];
            _NSCoreDataLog( v32 != 0,  v33,  v34,  v35,  v36,  v37,  v38,  v39,  (uint64_t)"-[PFCloudKitExportContext modifyRecordsOperationFinishedForStore:withSavedRecords:deletedRecordID s:operationError:managedObjectContext:error:]_block_invoke");
            goto LABEL_28;
          }

          [v17 setNeedsUpload:0];
          uint64_t v19 = *(void *)(*(void *)(a1 + 56) + 8LL);
          if (v19 && (uint64_t v20 = *(void *)(v19 + 16)) != 0) {
            uint64_t v21 = *(void *)(v20 + 136);
          }
          else {
            uint64_t v21 = 0LL;
          }
          id v22 = -[PFCloudKitArchivingUtilities encodeRecord:error:]( v21,  v16,  (void *)(*(void *)(*(void *)(a1 + 80) + 8LL) + 40LL));
          if (v22)
          {
            [v18 setEncodedRecord:v22];
          }

          else
          {
            *(_BYTE *)(*(void *)(*(void *)(a1 + 72) + 8LL) + 24LL) = 0;
            id v40 = *(id *)(*(void *)(*(void *)(a1 + 80) + 8LL) + 40LL);
          }

LABEL_31:
          ++v14;
        }

        while (v12 != v14);
        uint64_t v41 = [v11 countByEnumeratingWithState:&v123 objects:v138 count:16];
        uint64_t v12 = v41;
      }

      while (v41);
    }

uint64_t __142__PFCloudKitExportContext_modifyRecordsOperationFinishedForStore_withSavedRecords_deletedRecordIDs_operationError_managedObjectContext_error___block_invoke_2( uint64_t a1,  void *a2,  void *a3)
{
  uint64_t v6 = *(void *)(*(void *)(a1 + 32) + 8LL);
  if (v6 && (uint64_t v7 = *(void *)(v6 + 16)) != 0) {
    uint64_t v8 = *(void *)(v7 + 136);
  }
  else {
    uint64_t v8 = 0LL;
  }
  id v9 = -[PFCloudKitArchivingUtilities newArchivedDataForSystemFieldsOfRecord:](v8, a3);
  [a2 setCkRecordSystemFields:v9];

  return 1LL;
}

@end