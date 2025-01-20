@interface PFCloudKitImporterFetchRecordsWorkItem
- (PFCloudKitImporterFetchRecordsWorkItem)initWithOptions:(id)a3 request:(id)a4;
- (id)createMirroringResultForRequest:(id)a3 storeIdentifier:(id)a4 success:(BOOL)a5 madeChanges:(BOOL)a6 error:(id)a7;
- (id)description;
- (id)entityNameToAttributesToUpdate;
- (id)entityNameToRelationshipsToUpdate;
- (void)dealloc;
- (void)executeImportOperationsAndAccumulateRecordsWithManagedObjectContext:(id)a3 completion:(id)a4;
@end

@implementation PFCloudKitImporterFetchRecordsWorkItem

- (PFCloudKitImporterFetchRecordsWorkItem)initWithOptions:(id)a3 request:(id)a4
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___PFCloudKitImporterFetchRecordsWorkItem;
  v4 = -[PFCloudKitImportRecordsWorkItem initWithOptions:request:](&v6, sel_initWithOptions_request_, a3, a4);
  if (v4)
  {
    v4->_updatedObjectIDs = (NSMutableArray *)objc_alloc_init(MEMORY[0x189603FA8]);
    v4->_failedObjectIDsToError = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x189603FC8]);
    v4->_recordIDToObjectID = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x189603FC8]);
    v4->_operationsToExecute = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x189603FC8]);
  }

  return v4;
}

- (void)dealloc
{
  self->_updatedObjectIDs = 0LL;
  self->_failedObjectIDsToError = 0LL;

  self->_recordIDToObjectID = 0LL;
  self->_operationsToExecute = 0LL;
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___PFCloudKitImporterFetchRecordsWorkItem;
  -[PFCloudKitImportRecordsWorkItem dealloc](&v3, sel_dealloc);
}

- (id)description
{
  id v3 = objc_alloc(MEMORY[0x189607940]);
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  if (self) {
    request = self->super.super._request;
  }
  else {
    request = 0LL;
  }
  v7 = (void *)[v3 initWithFormat:@"<%@: %p - %@>", v5, self, request];
  [v7 appendFormat:@" { %@ %@ %@ %@ }", self->_updatedObjectIDs, self->_failedObjectIDsToError, self->_recordIDToObjectID, self->_operationsToExecute];
  return v7;
}

- (void)executeImportOperationsAndAccumulateRecordsWithManagedObjectContext:(id)a3 completion:(id)a4
{
  uint64_t v72 = *MEMORY[0x1895F89C0];
  if (self) {
    options = self->super.super._options;
  }
  else {
    options = 0LL;
  }
  objc_super v6 = options;
  v43 = v6;
  if (v6) {
    database = v6->_database;
  }
  else {
    database = 0LL;
  }
  v42 = database;
  p_isa = &self->super.super.super.isa;
  if (self)
  {
    p_isa = &self->super.super._options->super.isa;
    request = self->super.super._request;
    if (p_isa) {
      p_isa = (void *)p_isa[2];
    }
  }

  else
  {
    request = 0LL;
  }

  v44 = p_isa;
  uint64_t v67 = 0LL;
  v68 = &v67;
  uint64_t v69 = 0x2020000000LL;
  char v70 = 1;
  uint64_t v61 = 0LL;
  v62 = &v61;
  uint64_t v63 = 0x3052000000LL;
  v64 = __Block_byref_object_copy__29;
  v65 = __Block_byref_object_dispose__29;
  uint64_t v66 = 0LL;
  id v45 = objc_alloc_init(MEMORY[0x189603FA8]);
  id v10 = objc_alloc_init(MEMORY[0x189603FA8]);
  uint64_t v11 = MEMORY[0x1895F87A8];
  v60[0] = MEMORY[0x1895F87A8];
  v60[1] = 3221225472LL;
  v60[2] = __121__PFCloudKitImporterFetchRecordsWorkItem_executeImportOperationsAndAccumulateRecordsWithManagedObjectContext_completion___block_invoke;
  v60[3] = &unk_189EAA4E8;
  v60[4] = v44;
  v60[5] = request;
  id v48 = v10;
  v60[6] = v10;
  v60[7] = a3;
  v60[8] = self;
  v60[9] = v45;
  v60[10] = &v61;
  v60[11] = &v67;
  -[PFCloudKitStoreMonitor performBlock:]((uint64_t)v44, (uint64_t)v60);
  if (*((_BYTE *)v68 + 24))
  {
    __int128 v58 = 0u;
    __int128 v59 = 0u;
    __int128 v56 = 0u;
    __int128 v57 = 0u;
    if (self)
    {
      v12 = self->super.super._request;
      if (v12) {
        unint64_t requestCompletionBlock = (unint64_t)v12[1].super._requestCompletionBlock;
      }
      else {
        unint64_t requestCompletionBlock = 0LL;
      }
      id v14 = objc_alloc_init(MEMORY[0x189603FA8]);
      if ([v45 count] <= requestCompletionBlock)
      {
        if ([v45 count]) {
          [v14 addObject:v45];
        }
      }

      else
      {
        uint64_t v15 = 0LL;
        uint64_t v16 = 0LL;
        do
        {
          unint64_t v17 = [v45 count];
          unint64_t v18 = v16 + requestCompletionBlock;
          unint64_t v19 = requestCompletionBlock;
          if (v16 + requestCompletionBlock > v17) {
            unint64_t v19 = v15 + [v45 count];
          }
          objc_msgSend(v14, "addObject:", objc_msgSend(v45, "subarrayWithRange:", v16, v19));
          v15 -= requestCompletionBlock;
          v16 += requestCompletionBlock;
        }

        while (v18 < [v45 count]);
      }

      id obj = v14;
      uint64_t v23 = [obj countByEnumeratingWithState:&v56 objects:v71 count:16];
    }

    else
    {
      id obj = 0LL;
      uint64_t v23 = [0 countByEnumeratingWithState:&v56 objects:v71 count:16];
    }

    uint64_t v24 = v23;
    if (v23)
    {
      uint64_t v25 = *(void *)v57;
      do
      {
        uint64_t v26 = 0LL;
        do
        {
          if (*(void *)v57 != v25) {
            objc_enumerationMutation(obj);
          }
          uint64_t v27 = *(void *)(*((void *)&v56 + 1) + 8 * v26);
          id v28 = objc_alloc_init((Class)getCloudKitCKFetchRecordsOperationClass[0]());
          uint64_t v29 = [v28 operationID];
          if (-[NSCloudKitMirroringRequest options](request, "options")) {
            -[NSCloudKitMirroringRequestOptions applyToOperation:]( (uint64_t)-[NSCloudKitMirroringRequest options](request, "options"),  v28);
          }
          [v28 setRecordIDs:v27];
          [v28 setDesiredKeys:v48];
          v55[0] = v11;
          v55[1] = 3221225472LL;
          v55[2] = __121__PFCloudKitImporterFetchRecordsWorkItem_executeImportOperationsAndAccumulateRecordsWithManagedObjectContext_completion___block_invoke_5;
          v55[3] = &unk_189EAA510;
          v55[4] = request;
          [v28 setPerRecordProgressBlock:v55];
          objc_initWeak(&location, self);
          v52[0] = v11;
          v52[1] = 3221225472LL;
          v52[2] = __121__PFCloudKitImporterFetchRecordsWorkItem_executeImportOperationsAndAccumulateRecordsWithManagedObjectContext_completion___block_invoke_6;
          v52[3] = &unk_189EAA538;
          objc_copyWeak(&v53, &location);
          [v28 setPerRecordCompletionBlock:v52];
          v50[0] = v11;
          v50[1] = 3221225472LL;
          v50[2] = __121__PFCloudKitImporterFetchRecordsWorkItem_executeImportOperationsAndAccumulateRecordsWithManagedObjectContext_completion___block_invoke_7;
          v50[3] = &unk_189EAA560;
          objc_copyWeak(&v51, &location);
          v50[4] = v29;
          v50[5] = a4;
          [v28 setFetchRecordsCompletionBlock:v50];
          -[NSMutableDictionary setObject:forKey:](self->_operationsToExecute, "setObject:forKey:", v28, v29);

          objc_destroyWeak(&v51);
          objc_destroyWeak(&v53);
          objc_destroyWeak(&location);
          ++v26;
        }

        while (v24 != v26);
        uint64_t v24 = [obj countByEnumeratingWithState:&v56 objects:v71 count:16];
      }

      while (v24);
    }

    if (-[NSMutableDictionary count](self->_operationsToExecute, "count"))
    {
      if (v43) {
        v30 = v43->_database;
      }
      else {
        v30 = 0LL;
      }
      -[CKDatabase addOperation:]( v30,  "addOperation:",  objc_msgSend( (id)-[NSMutableDictionary allValues](self->_operationsToExecute, "allValues"),  "objectAtIndexedSubscript:",  0));
    }

    else if (a4)
    {
      v31 = (void *)MEMORY[0x186E3E5D8]();
      else {
        uint64_t v32 = __ckLoggingOverride;
      }
      uint64_t v33 = [@"CoreData+CloudKit: %s(%d): " stringByAppendingString:@"Fetch records request did not match any records in the store: %@\n%@"];
      -[NSCloudKitMirroringImportRequest objectIDsToFetch](request, "objectIDsToFetch");
      _NSCoreDataLog( v32,  v33,  v34,  v35,  v36,  v37,  v38,  v39,  (uint64_t)"-[PFCloudKitImporterFetchRecordsWorkItem executeImportOperationsAndAccumulateRecordsWithManagedObjectCo ntext:completion:]");
      objc_autoreleasePoolPop(v31);
      if (v44) {
        uint64_t v40 = v44[6];
      }
      else {
        uint64_t v40 = 0LL;
      }
      id v41 = -[PFCloudKitImporterFetchRecordsWorkItem createMirroringResultForRequest:storeIdentifier:success:madeChanges:error:]( self,  "createMirroringResultForRequest:storeIdentifier:success:madeChanges:error:",  self->super.super._request,  v40,  1LL,  0LL,  0LL);
      (*((void (**)(id, id))a4 + 2))(a4, v41);
    }
  }

  else if (a4)
  {
    if (self) {
      v20 = self->super.super._request;
    }
    else {
      v20 = 0LL;
    }
    if (v44) {
      uint64_t v21 = v44[6];
    }
    else {
      uint64_t v21 = 0LL;
    }
    id v22 = -[PFCloudKitImporterFetchRecordsWorkItem createMirroringResultForRequest:storeIdentifier:success:madeChanges:error:]( self,  "createMirroringResultForRequest:storeIdentifier:success:madeChanges:error:",  v20,  v21,  0LL,  0LL,  v62[5]);
    (*((void (**)(id, id))a4 + 2))(a4, v22);
  }

  v62[5] = 0LL;
  _Block_object_dispose(&v61, 8);
  _Block_object_dispose(&v67, 8);
}

void __121__PFCloudKitImporterFetchRecordsWorkItem_executeImportOperationsAndAccumulateRecordsWithManagedObjectContext_completion___block_invoke( uint64_t a1)
{
  v19[1] = *MEMORY[0x1895F89C0];
  uint64_t v2 = *(void *)(a1 + 32);
  if (v2)
  {
    id WeakRetained = objc_loadWeakRetained((id *)(v2 + 32));
    uint64_t v4 = *(void *)(a1 + 32);
  }

  else
  {
    uint64_t v4 = 0LL;
    id WeakRetained = 0LL;
  }

  v5 = (void *)-[PFCloudKitStoreMonitor retainedMonitoredStore](v4);
  if (v5)
  {
    uint64_t v6 = objc_msgSend((id)objc_msgSend(*(id *)(a1 + 40), "entityNameToAttributesToFetch"), "count");
    uint64_t v7 = MEMORY[0x1895F87A8];
    if (v6)
    {
      v8 = (void *)[*(id *)(a1 + 40) entityNameToAttributesToFetch];
      v17[0] = v7;
      v17[1] = 3221225472LL;
      v17[2] = __121__PFCloudKitImporterFetchRecordsWorkItem_executeImportOperationsAndAccumulateRecordsWithManagedObjectContext_completion___block_invoke_2;
      v17[3] = &unk_189EA8958;
      v17[4] = *(void *)(a1 + 48);
      [v8 enumerateKeysAndObjectsUsingBlock:v17];
    }

    else
    {
      id v11 = +[PFCloudKitSerializer newSetOfRecordKeysForEntitiesInConfiguration:inManagedObjectModel:includeCKAssetsForFileBackedFutures:]( (uint64_t)PFCloudKitSerializer,  [v5 configurationName],  (void *)objc_msgSend((id)objc_msgSend(v5, "persistentStoreCoordinator"), "managedObjectModel"),  1);
      objc_msgSend(*(id *)(a1 + 48), "addObjectsFromArray:", objc_msgSend(v11, "allObjects"));
    }

    v13[0] = v7;
    v13[1] = 3221225472LL;
    v13[2] = __121__PFCloudKitImporterFetchRecordsWorkItem_executeImportOperationsAndAccumulateRecordsWithManagedObjectContext_completion___block_invoke_4;
    v13[3] = &unk_189EAA4C0;
    v13[4] = *(void *)(a1 + 40);
    v13[5] = v5;
    __int128 v12 = *(_OWORD *)(a1 + 72);
    __int128 v14 = *(_OWORD *)(a1 + 56);
    __int128 v15 = v12;
    uint64_t v16 = *(void *)(a1 + 88);
    [(id)v14 performBlockAndWait:v13];
  }

  else
  {
    *(_BYTE *)(*(void *)(*(void *)(a1 + 88) + 8LL) + 24LL) = 0;
    id v9 = objc_alloc(MEMORY[0x189607870]);
    uint64_t v18 = *MEMORY[0x1896075F0];
    v19[0] = [NSString stringWithFormat:@"Request '%@' was cancelled because the store was removed from the coordinator.", objc_msgSend(*(id *)(a1 + 40), "requestIdentifier")];
    uint64_t v10 = [MEMORY[0x189603F68] dictionaryWithObjects:v19 forKeys:&v18 count:1];
    *(void *)(*(void *)(*(void *)(a1 + 80) + 8) + 40) = [v9 initWithDomain:*MEMORY[0x189607460] code:134407 userInfo:v10];
  }
}

uint64_t __121__PFCloudKitImporterFetchRecordsWorkItem_executeImportOperationsAndAccumulateRecordsWithManagedObjectContext_completion___block_invoke_2( uint64_t a1,  uint64_t a2,  void *a3)
{
  v4[0] = MEMORY[0x1895F87A8];
  v4[1] = 3221225472LL;
  v4[2] = __121__PFCloudKitImporterFetchRecordsWorkItem_executeImportOperationsAndAccumulateRecordsWithManagedObjectContext_completion___block_invoke_3;
  v4[3] = &unk_189EAA498;
  v4[4] = *(void *)(a1 + 32);
  return [a3 enumerateObjectsUsingBlock:v4];
}

void __121__PFCloudKitImporterFetchRecordsWorkItem_executeImportOperationsAndAccumulateRecordsWithManagedObjectContext_completion___block_invoke_3( uint64_t a1,  void *a2)
{
  id v3 = +[PFCloudKitSerializer newSetOfRecordKeysForAttribute:includeCKAssetsForFileBackedFutures:]( (uint64_t)&OBJC_CLASS___PFCloudKitSerializer,  a2,  1);
  objc_msgSend(*(id *)(a1 + 32), "addObjectsFromArray:", objc_msgSend(v3, "allObjects"));
}

id __121__PFCloudKitImporterFetchRecordsWorkItem_executeImportOperationsAndAccumulateRecordsWithManagedObjectContext_completion___block_invoke_4( uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x1895F89C0];
  id v2 = +[NSCKRecordMetadata metadataForObjectIDs:inStore:withManagedObjectContext:error:]( (uint64_t)NSCKRecordMetadata,  [*(id *)(a1 + 32) objectIDsToFetch],  *(void *)(a1 + 40),  *(void **)(a1 + 48),  (void *)(*(void *)(*(void *)(a1 + 72) + 8) + 40));
  id v3 = v2;
  if (v2)
  {
    __int128 v13 = 0u;
    __int128 v14 = 0u;
    __int128 v11 = 0u;
    __int128 v12 = 0u;
    id result = (id)[v2 countByEnumeratingWithState:&v11 objects:v15 count:16];
    id v5 = result;
    if (result)
    {
      uint64_t v6 = *(void *)v12;
      do
      {
        uint64_t v7 = 0LL;
        do
        {
          if (*(void *)v12 != v6) {
            objc_enumerationMutation(v3);
          }
          v8 = *(void **)(*((void *)&v11 + 1) + 8LL * (void)v7);
          id v9 = (void *)-[NSCKRecordMetadata createRecordID](v8);
          uint64_t v10 = -[NSCKRecordMetadata createObjectIDForLinkedRow](v8);
          [*(id *)(*(void *)(a1 + 56) + 168) setObject:v10 forKey:v9];
          [*(id *)(a1 + 64) addObject:v9];

          uint64_t v7 = (char *)v7 + 1;
        }

        while (v5 != v7);
        id result = (id)[v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
        id v5 = result;
      }

      while (result);
    }
  }

  else
  {
    *(_BYTE *)(*(void *)(*(void *)(a1 + 80) + 8LL) + 24LL) = 0;
    return *(id *)(*(void *)(*(void *)(a1 + 72) + 8LL) + 40LL);
  }

  return result;
}

void __121__PFCloudKitImporterFetchRecordsWorkItem_executeImportOperationsAndAccumulateRecordsWithManagedObjectContext_completion___block_invoke_5( uint64_t a1)
{
  id v2 = (void *)MEMORY[0x186E3E5D8]();
  else {
    uint64_t v3 = __ckLoggingOverride;
  }
  uint64_t v4 = [@"CoreData+CloudKit: %s(%d): " stringByAppendingString:@"%@ '%@': %@ %f"];
  id v5 = (objc_class *)objc_opt_class();
  NSStringFromClass(v5);
  [*(id *)(a1 + 32) requestIdentifier];
  _NSCoreDataLog( v3,  v4,  v6,  v7,  v8,  v9,  v10,  v11,  (uint64_t)"-[PFCloudKitImporterFetchRecordsWorkItem executeImportOperationsAndAccumulateRecordsWithManagedObjectContex t:completion:]_block_invoke_5");
  objc_autoreleasePoolPop(v2);
}

void __121__PFCloudKitImporterFetchRecordsWorkItem_executeImportOperationsAndAccumulateRecordsWithManagedObjectContext_completion___block_invoke_6( uint64_t a1,  void *a2,  uint64_t a3,  uint64_t a4)
{
  uint64_t v43 = *MEMORY[0x1895F89C0];
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v8 = WeakRetained;
  if (WeakRetained)
  {
    uint64_t v38 = WeakRetained;
    if (a4)
    {
      uint64_t v9 = (void *)MEMORY[0x186E3E5D8]();
      BOOL v10 = __ckLoggingOverride != 0;
      uint64_t v11 = [@"CoreData+CloudKit: %s(%d): " stringByAppendingString:@"%@ encountered error while fetching record %@\n%@"];
      _NSCoreDataLog( v10,  v11,  v12,  v13,  v14,  v15,  v16,  v17,  (uint64_t)"-[PFCloudKitImporterFetchRecordsWorkItem fetchFinishedForRecord:withID:error:]");
      objc_autoreleasePoolPop(v9);
      uint64_t v8 = v38;
      if (a3)
      {
        uint64_t v18 = [v38[21] objectForKey:a3];
        if (v18)
        {
          [v38[20] setObject:a4 forKey:v18];
LABEL_14:
          uint64_t v8 = v38;
          goto LABEL_15;
        }

        uint64_t v21 = [NSString stringWithUTF8String:"Fetch operation was notified about a recordID that finished with an error that doesn't have an objectID: %@ - %@"];
        _NSCoreDataLog(17LL, v21, v22, v23, v24, v25, v26, v27, a3);
        id v28 = (os_log_s *)__pflogFaultLog;
        BOOL v29 = os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT);
        uint64_t v8 = v38;
        if (v29)
        {
          *(_DWORD *)buf = 138412546;
          uint64_t v40 = a3;
          __int16 v41 = 2112;
          uint64_t v42 = a4;
          _os_log_fault_impl( &dword_186681000,  v28,  OS_LOG_TYPE_FAULT,  "CoreData: Fetch operation was notified about a recordID that finished with an error that doesn't have an objectID: %@ - %@",  buf,  0x16u);
          goto LABEL_14;
        }
      }
    }

    else
    {
      char v19 = objc_msgSend( (id)objc_msgSend((id)objc_msgSend(a2, "recordID"), "recordName"),  "hasPrefix:",  @"CD_FAKE_");
      uint64_t v8 = v38;
      if ((v19 & 1) == 0)
      {
        uint64_t v20 = [v38[21] objectForKey:a3];
        if (v20)
        {
          [v38[19] addObject:v20];
        }

        else
        {
          uint64_t v30 = [NSString stringWithUTF8String:"Fetch operation was notified about an updated recordID that finished that doesn't have an objectID: %@"];
          _NSCoreDataLog(17LL, v30, v31, v32, v33, v34, v35, v36, a3);
          uint64_t v37 = (os_log_s *)__pflogFaultLog;
          if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
          {
            *(_DWORD *)buf = 138412290;
            uint64_t v40 = a3;
            _os_log_fault_impl( &dword_186681000,  v37,  OS_LOG_TYPE_FAULT,  "CoreData: Fetch operation was notified about an updated recordID that finished that doesn't have an objectID: %@",  buf,  0xCu);
          }
        }

        [v38 addUpdatedRecord:a2];
        goto LABEL_14;
      }
    }
  }

void __121__PFCloudKitImporterFetchRecordsWorkItem_executeImportOperationsAndAccumulateRecordsWithManagedObjectContext_completion___block_invoke_7( uint64_t a1,  uint64_t a2,  void *a3)
{
  uint64_t v40 = *MEMORY[0x1895F89C0];
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    uint64_t v7 = *(void *)(a1 + 32);
    uint64_t v6 = *(void *)(a1 + 40);
    uint64_t v30 = WeakRetained;
    uint64_t v8 = (void *)MEMORY[0x186E3E5D8]();
    unint64_t v9 = 0x18C4A5000uLL;
    [v30[22] removeObjectForKey:v7];
    if (a3)
    {
      BOOL v10 = (void *)[a3 domain];
      if ([v10 isEqualToString:getCloudKitCKErrorDomain()]
        && [a3 code] == 2)
      {
        BOOL v29 = v8;
        uint64_t v11 = (void *)[a3 userInfo];
        uint64_t v12 = (void *)[v11 objectForKey:getCloudKitCKPartialErrorsByItemIDKey[0]()];
        __int128 v31 = 0u;
        __int128 v32 = 0u;
        __int128 v33 = 0u;
        __int128 v34 = 0u;
        uint64_t v13 = [v12 countByEnumeratingWithState:&v31 objects:v39 count:16];
        if (v13)
        {
          uint64_t v14 = v13;
          uint64_t v15 = *(void *)v32;
          do
          {
            for (uint64_t i = 0LL; i != v14; ++i)
            {
              if (*(void *)v32 != v15) {
                objc_enumerationMutation(v12);
              }
              uint64_t v17 = *(void *)(*((void *)&v31 + 1) + 8 * i);
              uint64_t v18 = [v30[21] objectForKey:v17];
              if (v18)
              {
                objc_msgSend(v30[20], "setObject:forKey:", objc_msgSend(v12, "objectForKey:", v17), v18);
              }

              else
              {
                uint64_t v19 = [NSString stringWithUTF8String:"Fetch operation was notified via partial failure about a recordID that doesn't have an objectID: %@ - %@"];
                _NSCoreDataLog(17LL, v19, v20, v21, v22, v23, v24, v25, v17);
                uint64_t v26 = (os_log_s *)__pflogFaultLog;
                if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
                {
                  *(_DWORD *)buf = 138412546;
                  uint64_t v36 = v17;
                  __int16 v37 = 2112;
                  uint64_t v38 = a3;
                  _os_log_fault_impl( &dword_186681000,  v26,  OS_LOG_TYPE_FAULT,  "CoreData: Fetch operation was notified via partial failure about a recordID that doesn't have an objectID: %@ - %@",  buf,  0x16u);
                }
              }
            }

            uint64_t v14 = [v12 countByEnumeratingWithState:&v31 objects:v39 count:16];
          }

          while (v14);
        }

        -[PFCloudKitImportRecordsWorkItem checkAndApplyChangesIfNeeded:]((uint64_t)v30, 0LL);
        uint64_t v8 = v29;
        unint64_t v9 = 0x18C4A5000LL;
      }

      else
      {
        [v30[11] addObject:a3];
      }
    }

    else
    {
      -[PFCloudKitImportRecordsWorkItem checkAndApplyChangesIfNeeded:]((uint64_t)v30, 0LL);
    }

    if ([*(id *)((char *)v30 + *(int *)(v9 + 1396)) count])
    {
      uint64_t v27 = v30[1];
      if (v27) {
        id v28 = (void *)v27[1];
      }
      else {
        id v28 = 0LL;
      }
      objc_msgSend( v28,  "addOperation:",  objc_msgSend( (id)objc_msgSend(*(id *)((char *)v30 + *(int *)(v9 + 1396)), "allValues"),  "objectAtIndexedSubscript:",  0));
    }

    else
    {
      -[PFCloudKitImportRecordsWorkItem fetchOperationFinishedWithError:completion:]((uint64_t)v30, 0LL, v6);
    }

    objc_autoreleasePoolPop(v8);
    id WeakRetained = v30;
  }
}

- (id)createMirroringResultForRequest:(id)a3 storeIdentifier:(id)a4 success:(BOOL)a5 madeChanges:(BOOL)a6 error:(id)a7
{
  BOOL v8 = a6;
  BOOL v9 = a5;
  if (a5)
  {
    uint64_t v13 = -[NSMutableDictionary count](self->_failedObjectIDsToError, "count");
    uint64_t v14 = objc_alloc(&OBJC_CLASS___NSCloudKitMirroringFetchRecordsResult);
    if (v13) {
      return -[NSCloudKitMirroringFetchRecordsResult initWithRequest:storeIdentifier:success:madeChanges:updatedObjectIDs:failedObjectIDToError:error:]( v14,  "initWithRequest:storeIdentifier:success:madeChanges:updatedObjectIDs:failedObjectIDToError:error:",  a3,  a4,  0,  v8,  self->_updatedObjectIDs,  self->_failedObjectIDsToError,  [MEMORY[0x189607870] errorWithDomain:*MEMORY[0x189607460] code:134418 userInfo:0]);
    }
  }

  else
  {
    uint64_t v14 = objc_alloc(&OBJC_CLASS___NSCloudKitMirroringFetchRecordsResult);
    if (!self)
    {
      updatedObjectIDs = 0LL;
      failedObjectIDsToError = 0LL;
      return -[NSCloudKitMirroringFetchRecordsResult initWithRequest:storeIdentifier:success:madeChanges:updatedObjectIDs:failedObjectIDToError:error:]( v14,  "initWithRequest:storeIdentifier:success:madeChanges:updatedObjectIDs:failedObjectIDToError:error:",  a3,  a4,  v9,  v8,  updatedObjectIDs,  failedObjectIDsToError,  a7);
    }
  }

  updatedObjectIDs = self->_updatedObjectIDs;
  failedObjectIDsToError = self->_failedObjectIDsToError;
  return -[NSCloudKitMirroringFetchRecordsResult initWithRequest:storeIdentifier:success:madeChanges:updatedObjectIDs:failedObjectIDToError:error:]( v14,  "initWithRequest:storeIdentifier:success:madeChanges:updatedObjectIDs:failedObjectIDToError:error:",  a3,  a4,  v9,  v8,  updatedObjectIDs,  failedObjectIDsToError,  a7);
}

- (id)entityNameToAttributesToUpdate
{
  id v2 = self;
  if (self) {
    self = (PFCloudKitImporterFetchRecordsWorkItem *)self->super.super._request;
  }
  id result = (id)objc_msgSend( (id)-[PFCloudKitImporterFetchRecordsWorkItem entityNameToAttributesToFetch]( self,  "entityNameToAttributesToFetch"),  "count");
  if (result)
  {
    if (v2) {
      request = v2->super.super._request;
    }
    else {
      request = 0LL;
    }
    return (id)-[NSCloudKitMirroringImportRequest entityNameToAttributesToFetch]( request,  "entityNameToAttributesToFetch");
  }

  return result;
}

- (id)entityNameToRelationshipsToUpdate
{
  return (id)MEMORY[0x189604A60];
}

@end