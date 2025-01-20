@interface PFCloudKitImporterZoneChangedWorkItem
- (BOOL)commitMetadataChangesWithContext:(id)a3 forStore:(id)a4 error:(id *)a5;
- (BOOL)updateMetadataForAccumulatedChangesInContext:(id)a3 inStore:(id)a4 error:(id *)a5;
- (PFCloudKitImporterZoneChangedWorkItem)initWithChangedRecordZoneIDs:(id)a3 options:(id)a4 request:(id)a5;
- (id)description;
- (void)dealloc;
- (void)executeImportOperationsAndAccumulateRecordsWithManagedObjectContext:(id)a3 completion:(id)a4;
@end

@implementation PFCloudKitImporterZoneChangedWorkItem

- (PFCloudKitImporterZoneChangedWorkItem)initWithChangedRecordZoneIDs:(id)a3 options:(id)a4 request:(id)a5
{
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___PFCloudKitImporterZoneChangedWorkItem;
  v6 = -[PFCloudKitImportRecordsWorkItem initWithOptions:request:](&v8, sel_initWithOptions_request_, a4, a5);
  if (v6)
  {
    v6->_changedRecordZoneIDs = (NSArray *)a3;
    v6->_fetchedZoneIDToChangeToken = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x189603FC8]);
    v6->_fetchedZoneIDToMoreComing = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x189603FC8]);
  }

  return v6;
}

- (void)dealloc
{
  self->_changedRecordZoneIDs = 0LL;
  self->_fetchedZoneIDToChangeToken = 0LL;

  self->_fetchedZoneIDToMoreComing = 0LL;
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___PFCloudKitImporterZoneChangedWorkItem;
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
  [v7 appendFormat:@" {\n%@\n}", self->_changedRecordZoneIDs];
  return v7;
}

- (void)executeImportOperationsAndAccumulateRecordsWithManagedObjectContext:(id)a3 completion:(id)a4
{
  uint64_t v89 = *MEMORY[0x1895F89C0];
  if (self) {
    options = self->super.super._options;
  }
  else {
    options = 0LL;
  }
  objc_super v8 = options;
  v9 = v8;
  if (v8)
  {
    v48 = v8->_database;
    monitor = v9->_monitor;
    if (monitor)
    {
      id WeakRetained = objc_loadWeakRetained((id *)&monitor->_monitoredCoordinator);
      uint64_t v11 = (uint64_t)v9->_monitor;
      goto LABEL_6;
    }
  }

  else
  {
    v48 = 0LL;
  }

  id WeakRetained = 0LL;
  uint64_t v11 = 0LL;
LABEL_6:
  v47 = v9;
  v49 = (void *)-[PFCloudKitStoreMonitor retainedMonitoredStore](v11);
  if (v49)
  {
    v41 = (void (**)(id, void *))a4;
    id v46 = objc_alloc_init(MEMORY[0x189603FC8]);
    uint64_t v81 = 0LL;
    v82 = &v81;
    uint64_t v83 = 0x2020000000LL;
    char v84 = 1;
    uint64_t v75 = 0LL;
    v76 = &v75;
    uint64_t v77 = 0x3052000000LL;
    v78 = __Block_byref_object_copy__38;
    v79 = __Block_byref_object_dispose__38;
    uint64_t v80 = 0LL;
    __int128 v71 = 0u;
    __int128 v72 = 0u;
    __int128 v73 = 0u;
    __int128 v74 = 0u;
    v42 = self;
    obj = self->_changedRecordZoneIDs;
    uint64_t v12 = -[NSArray countByEnumeratingWithState:objects:count:]( obj,  "countByEnumeratingWithState:objects:count:",  &v71,  v88,  16LL);
    if (v12)
    {
      uint64_t v44 = *(void *)v72;
      do
      {
        uint64_t v13 = 0LL;
        do
        {
          if (*(void *)v72 != v44) {
            objc_enumerationMutation(obj);
          }
          uint64_t v14 = *(void *)(*((void *)&v71 + 1) + 8 * v13);
          id location = 0LL;
          p_id location = &location;
          uint64_t v67 = 0x3052000000LL;
          v68 = __Block_byref_object_copy__38;
          v69 = __Block_byref_object_dispose__38;
          uint64_t v70 = 0LL;
          v64[0] = MEMORY[0x1895F87A8];
          v64[1] = 3221225472LL;
          v64[2] = __120__PFCloudKitImporterZoneChangedWorkItem_executeImportOperationsAndAccumulateRecordsWithManagedObjectContext_completion___block_invoke;
          v64[3] = &unk_189EAAE80;
          v64[4] = v14;
          v64[5] = v48;
          v64[6] = v49;
          v64[7] = a3;
          v64[8] = &location;
          v64[9] = &v81;
          v64[10] = &v75;
          [a3 performBlockAndWait:v64];
          if (!*((_BYTE *)v82 + 24))
          {
            _Block_object_dispose(&location, 8);
            v9 = v47;
            goto LABEL_37;
          }

          id v15 = objc_alloc_init((Class)getCloudKitCKFetchRecordZoneChangesConfigurationClass[0]());
          [v15 setPreviousServerChangeToken:p_location[5]];

          p_location[5] = 0LL;
          uint64_t v16 = [v49 configurationName];
          v17 = (void *)[WeakRetained managedObjectModel];
          if (v47) {
            v18 = v47->_options;
          }
          else {
            v18 = 0LL;
          }
          id v19 = +[PFCloudKitSerializer newSetOfRecordKeysForEntitiesInConfiguration:inManagedObjectModel:includeCKAssetsForFileBackedFutures:]( (uint64_t)&OBJC_CLASS___PFCloudKitSerializer,  v16,  v17,  -[NSCloudKitMirroringDelegateOptions automaticallyDownloadFileBackedFutures]( v18,  "automaticallyDownloadFileBackedFutures"));
          v20 = (void *)objc_msgSend(objc_alloc(MEMORY[0x189603FA8]), "initWithCapacity:", objc_msgSend(v19, "count"));
          __int128 v62 = 0u;
          __int128 v63 = 0u;
          __int128 v60 = 0u;
          __int128 v61 = 0u;
          uint64_t v21 = [v19 countByEnumeratingWithState:&v60 objects:v87 count:16];
          if (v21)
          {
            uint64_t v22 = *(void *)v61;
            do
            {
              for (uint64_t i = 0LL; i != v21; ++i)
              {
                if (*(void *)v61 != v22) {
                  objc_enumerationMutation(v19);
                }
                [v20 addObject:*(void *)(*((void *)&v60 + 1) + 8 * i)];
              }

              uint64_t v21 = [v19 countByEnumeratingWithState:&v60 objects:v87 count:16];
            }

            while (v21);
          }

          [v15 setDesiredKeys:v20];
          [v46 setObject:v15 forKey:v14];

          _Block_object_dispose(&location, 8);
          ++v13;
        }

        while (v13 != v12);
        uint64_t v24 = -[NSArray countByEnumeratingWithState:objects:count:]( obj,  "countByEnumeratingWithState:objects:count:",  &v71,  v88,  16LL);
        uint64_t v12 = v24;
        v9 = v47;
      }

      while (v24);
    }

id __120__PFCloudKitImporterZoneChangedWorkItem_executeImportOperationsAndAccumulateRecordsWithManagedObjectContext_completion___block_invoke( uint64_t a1)
{
  v5[5] = *(id *)MEMORY[0x1895F89C0];
  v5[0] = 0LL;
  v2 = +[NSCKRecordZoneMetadata zoneMetadataForZoneID:inDatabaseWithScope:forStore:inContext:error:]( (uint64_t)NSCKRecordZoneMetadata,  *(void **)(a1 + 32),  [*(id *)(a1 + 40) databaseScope],  *(void *)(a1 + 48),  *(void **)(a1 + 56),  (uint64_t)v5);
  if (v2)
  {
    id result = (id)-[NSManagedObject currentChangeToken](v2, "currentChangeToken");
    uint64_t v4 = *(void *)(a1 + 64);
  }

  else
  {
    *(_BYTE *)(*(void *)(*(void *)(a1 + 72) + 8LL) + 24LL) = 0;
    id result = v5[0];
    uint64_t v4 = *(void *)(a1 + 80);
  }

  *(void *)(*(void *)(v4 + 8) + 40LL) = result;
  return result;
}

void __120__PFCloudKitImporterZoneChangedWorkItem_executeImportOperationsAndAccumulateRecordsWithManagedObjectContext_completion___block_invoke_2( uint64_t a1,  uint64_t a2,  void *a3)
{
  if (a3)
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    if (WeakRetained)
    {
      v6 = WeakRetained;
      char v5 = objc_msgSend( (id)objc_msgSend((id)objc_msgSend(a3, "recordID"), "recordName"),  "hasPrefix:",  @"CD_FAKE_");
      id WeakRetained = v6;
      if ((v5 & 1) == 0)
      {
        [v6 addUpdatedRecord:a3];
        id WeakRetained = v6;
      }
    }
  }

void __120__PFCloudKitImporterZoneChangedWorkItem_executeImportOperationsAndAccumulateRecordsWithManagedObjectContext_completion___block_invoke_3( uint64_t a1,  uint64_t a2,  uint64_t a3)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v6 = WeakRetained;
    -[PFCloudKitImportRecordsWorkItem addDeletedRecordID:ofType:]((uint64_t)WeakRetained, a2, a3);
    id WeakRetained = v6;
  }
}

void __120__PFCloudKitImporterZoneChangedWorkItem_executeImportOperationsAndAccumulateRecordsWithManagedObjectContext_completion___block_invoke_4( uint64_t a1,  uint64_t a2,  uint64_t a3)
{
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (a3 && WeakRetained)
  {
    id v6 = WeakRetained;
    [WeakRetained[20] setObject:a3 forKey:a2];
    -[PFCloudKitImportRecordsWorkItem checkAndApplyChangesIfNeeded:]((uint64_t)v6, a3);
    id WeakRetained = v6;
  }
}

void __120__PFCloudKitImporterZoneChangedWorkItem_executeImportOperationsAndAccumulateRecordsWithManagedObjectContext_completion___block_invoke_5( uint64_t a1,  uint64_t a2,  uint64_t a3,  uint64_t a4,  uint64_t a5,  uint64_t a6)
{
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    uint64_t v11 = WeakRetained;
    if (a6)
    {
      [WeakRetained[11] addObject:a6];
    }

    else
    {
      if (a3)
      {
        [WeakRetained[20] setObject:a3 forKey:a2];
        id WeakRetained = v11;
      }

      objc_msgSend(WeakRetained[21], "setObject:forKey:", objc_msgSend(MEMORY[0x189607968], "numberWithBool:", a5), a2);
    }

    id WeakRetained = v11;
  }
}

void __120__PFCloudKitImporterZoneChangedWorkItem_executeImportOperationsAndAccumulateRecordsWithManagedObjectContext_completion___block_invoke_6( uint64_t a1,  uint64_t a2)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    id v5 = WeakRetained;
    -[PFCloudKitImportRecordsWorkItem fetchOperationFinishedWithError:completion:]( (uint64_t)WeakRetained,  a2,  *(void *)(a1 + 32));
    id WeakRetained = v5;
  }
}

- (BOOL)updateMetadataForAccumulatedChangesInContext:(id)a3 inStore:(id)a4 error:(id *)a5
{
  uint64_t v49 = *MEMORY[0x1895F89C0];
  v43 = 0LL;
  __int128 v39 = 0u;
  __int128 v40 = 0u;
  __int128 v41 = 0u;
  __int128 v42 = 0u;
  fetchedZoneIDToChangeToken = self->_fetchedZoneIDToChangeToken;
  uint64_t v9 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:]( fetchedZoneIDToChangeToken,  "countByEnumeratingWithState:objects:count:",  &v39,  v48,  16LL);
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v40;
    do
    {
      uint64_t v12 = 0LL;
      do
      {
        if (*(void *)v40 != v11) {
          objc_enumerationMutation(fetchedZoneIDToChangeToken);
        }
        uint64_t v13 = *(void **)(*((void *)&v39 + 1) + 8 * v12);
        options = self->super.super._options;
        if (options) {
          database = options->_database;
        }
        else {
          database = 0LL;
        }
        uint64_t v16 = +[NSCKRecordZoneMetadata zoneMetadataForZoneID:inDatabaseWithScope:forStore:inContext:error:]( (uint64_t)&OBJC_CLASS___NSCKRecordZoneMetadata,  v13,  -[CKDatabase databaseScope](database, "databaseScope"),  (uint64_t)a4,  a3,  (uint64_t)&v43);
        if (v43)
        {
          id v19 = (void *)MEMORY[0x186E3E5D8](v16);
          BOOL v20 = __ckLoggingOverride != 0;
          uint64_t v21 = [@"CoreData+CloudKit: %s(%d): " stringByAppendingString:@"Unable to fetch zone metadata for zone: %@\n%@"];
          _NSCoreDataLog( v20,  v21,  v22,  v23,  v24,  v25,  v26,  v27,  (uint64_t)"-[PFCloudKitImporterZoneChangedWorkItem updateMetadataForAccumulatedChangesInContext:inStore:error:]");
          objc_autoreleasePoolPop(v19);
          goto LABEL_16;
        }

        -[NSManagedObject setCurrentChangeToken:]( v16,  "setCurrentChangeToken:",  -[NSMutableDictionary objectForKey:](self->_fetchedZoneIDToChangeToken, "objectForKey:", v13));
        ++v12;
      }

      while (v10 != v12);
      uint64_t v17 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:]( fetchedZoneIDToChangeToken,  "countByEnumeratingWithState:objects:count:",  &v39,  v48,  16LL);
      uint64_t v10 = v17;
    }

    while (v17);
  }

  v38.receiver = self;
  v38.super_class = (Class)&OBJC_CLASS___PFCloudKitImporterZoneChangedWorkItem;
  if (!-[PFCloudKitImportRecordsWorkItem updateMetadataForAccumulatedChangesInContext:inStore:error:]( &v38,  sel_updateMetadataForAccumulatedChangesInContext_inStore_error_,  a3,  a4,  &v43))
  {
LABEL_16:
    if (v43)
    {
      if (a5)
      {
        LOBYTE(v18) = 0;
        *a5 = v43;
        return v18;
      }
    }

    else
    {
      uint64_t v28 = [NSString stringWithUTF8String:"Illegal attempt to return an error without one in %s:%d"];
      _NSCoreDataLog( 17LL,  v28,  v29,  v30,  v31,  v32,  v33,  v34,  (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Persistence/PFCloudKitImporterZoneChangedWorkItem.m");
      v35 = (os_log_s *)__pflogFaultLog;
      BOOL v18 = os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT);
      if (!v18) {
        return v18;
      }
      *(_DWORD *)buf = 136315394;
      v45 = "/Library/Caches/com.apple.xbs/Sources/Persistence/PFCloudKitImporterZoneChangedWorkItem.m";
      __int16 v46 = 1024;
      int v47 = 284;
      _os_log_fault_impl( &dword_186681000,  v35,  OS_LOG_TYPE_FAULT,  "CoreData: Illegal attempt to return an error without one in %s:%d",  buf,  0x12u);
    }

    LOBYTE(v18) = 0;
    return v18;
  }

  LOBYTE(v18) = 1;
  return v18;
}

- (BOOL)commitMetadataChangesWithContext:(id)a3 forStore:(id)a4 error:(id *)a5
{
  uint64_t v50 = *MEMORY[0x1895F89C0];
  uint64_t v44 = 0LL;
  objc_super v8 = (void *)objc_msgSend( objc_alloc(MEMORY[0x189603FE0]),  "initWithArray:",  -[NSMutableDictionary allKeys](self->_fetchedZoneIDToChangeToken, "allKeys"));
  id obj = v8;
  objc_msgSend(v8, "addObjectsFromArray:", -[NSMutableDictionary allKeys](self->_fetchedZoneIDToMoreComing, "allKeys"));
  __int128 v42 = 0u;
  __int128 v43 = 0u;
  __int128 v40 = 0u;
  __int128 v41 = 0u;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v40 objects:v49 count:16];
  if (v9)
  {
    uint64_t v10 = *(void *)v41;
    do
    {
      uint64_t v11 = 0LL;
      do
      {
        if (*(void *)v41 != v10) {
          objc_enumerationMutation(obj);
        }
        options = self->super.super._options;
        if (options) {
          database = options->_database;
        }
        else {
          database = 0LL;
        }
        uint64_t v14 = *(void **)(*((void *)&v40 + 1) + 8 * v11);
        id v15 = +[NSCKRecordZoneMetadata zoneMetadataForZoneID:inDatabaseWithScope:forStore:inContext:error:]( (uint64_t)&OBJC_CLASS___NSCKRecordZoneMetadata,  v14,  -[CKDatabase databaseScope](database, "databaseScope"),  (uint64_t)a4,  a3,  (uint64_t)&v44);
        if (v44)
        {
          id v19 = (void *)MEMORY[0x186E3E5D8](v15);
          uint64_t v20 = __ckLoggingOverride;
          objc_super v8 = obj;
          uint64_t v21 = [@"CoreData+CloudKit: %s(%d): " stringByAppendingString:@"Unable to fetch zone metadata for zone: %@\n%@"];
          _NSCoreDataLog( v20 != 0,  v21,  v22,  v23,  v24,  v25,  v26,  v27,  (uint64_t)"-[PFCloudKitImporterZoneChangedWorkItem commitMetadataChangesWithContext:forStore:error:]");
          objc_autoreleasePoolPop(v19);
          BOOL v18 = 0;
          goto LABEL_15;
        }

        uint64_t v16 = v15;
        -[NSManagedObject setCurrentChangeToken:]( v15,  "setCurrentChangeToken:",  -[NSMutableDictionary objectForKey:](self->_fetchedZoneIDToChangeToken, "objectForKey:", v14));
        -[NSManagedObject setNeedsImport:]( v16,  "setNeedsImport:",  objc_msgSend( (id)-[NSMutableDictionary objectForKey:](self->_fetchedZoneIDToMoreComing, "objectForKey:", v14),  "BOOLValue"));
        -[NSManagedObject setLastFetchDate:](v16, "setLastFetchDate:", [MEMORY[0x189603F50] date]);
        ++v11;
      }

      while (v9 != v11);
      objc_super v8 = obj;
      uint64_t v17 = [obj countByEnumeratingWithState:&v40 objects:v49 count:16];
      uint64_t v9 = v17;
    }

    while (v17);
  }

  v39.receiver = self;
  v39.super_class = (Class)&OBJC_CLASS___PFCloudKitImporterZoneChangedWorkItem;
  BOOL v18 = -[PFCloudKitImportRecordsWorkItem commitMetadataChangesWithContext:forStore:error:]( &v39,  sel_commitMetadataChangesWithContext_forStore_error_,  a3,  a4,  &v44);
LABEL_15:

  if (!v18)
  {
    if (v44)
    {
      if (a5) {
        *a5 = v44;
      }
    }

    else
    {
      uint64_t v28 = [NSString stringWithUTF8String:"Illegal attempt to return an error without one in %s:%d"];
      _NSCoreDataLog( 17LL,  v28,  v29,  v30,  v31,  v32,  v33,  v34,  (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Persistence/PFCloudKitImporterZoneChangedWorkItem.m");
      v35 = (os_log_s *)__pflogFaultLog;
      if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 136315394;
        __int16 v46 = "/Library/Caches/com.apple.xbs/Sources/Persistence/PFCloudKitImporterZoneChangedWorkItem.m";
        __int16 v47 = 1024;
        int v48 = 329;
        _os_log_fault_impl( &dword_186681000,  v35,  OS_LOG_TYPE_FAULT,  "CoreData: Illegal attempt to return an error without one in %s:%d",  buf,  0x12u);
      }
    }
  }

  return v18;
}

@end