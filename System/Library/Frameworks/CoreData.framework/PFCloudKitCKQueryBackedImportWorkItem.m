@interface PFCloudKitCKQueryBackedImportWorkItem
- (BOOL)applyAccumulatedChangesToStore:(id)a3 inManagedObjectContext:(id)a4 withStoreMonitor:(id)a5 madeChanges:(BOOL *)a6 error:(id *)a7;
- (BOOL)commitMetadataChangesWithContext:(id)a3 forStore:(id)a4 error:(id *)a5;
- (BOOL)updateMetadataForAccumulatedChangesInContext:(id)a3 inStore:(id)a4 error:(id *)a5;
- (id)description;
- (id)initForRecordType:(id)a3 withOptions:(id)a4 request:(id)a5;
- (void)addUpdatedRecord:(id)a3;
- (void)dealloc;
- (void)executeImportOperationsAndAccumulateRecordsWithManagedObjectContext:(id)a3 completion:(id)a4;
@end

@implementation PFCloudKitCKQueryBackedImportWorkItem

- (id)initForRecordType:(id)a3 withOptions:(id)a4 request:(id)a5
{
  v10.receiver = self;
  v10.super_class = (Class)&OBJC_CLASS___PFCloudKitCKQueryBackedImportWorkItem;
  v7 = -[PFCloudKitImportRecordsWorkItem initWithOptions:request:](&v10, sel_initWithOptions_request_, a4, a5);
  if (v7)
  {
    v7->_recordType = (NSString *)a3;
    if (a4) {
      v8 = (void *)*((void *)a4 + 3);
    }
    else {
      v8 = 0LL;
    }
    v7->_zoneIDToQuery = (CKRecordZoneID *)+[PFCloudKitSerializer defaultRecordZoneIDForDatabaseScope:]( PFCloudKitSerializer,  "defaultRecordZoneIDForDatabaseScope:",  [v8 databaseScope]);
  }

  return v7;
}

- (void)dealloc
{
  self->_maxModificationDate = 0LL;
  self->_queryCursor = 0LL;

  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___PFCloudKitCKQueryBackedImportWorkItem;
  -[PFCloudKitImportRecordsWorkItem dealloc](&v3, sel_dealloc);
}

- (id)description
{
  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS___PFCloudKitCKQueryBackedImportWorkItem;
  objc_super v3 = (void *)objc_msgSend( objc_alloc(MEMORY[0x189607940]),  "initWithString:",  -[PFCloudKitImportRecordsWorkItem description](&v7, sel_description));
  v4 = v3;
  maxModificationDate = self->_maxModificationDate;
  if (!maxModificationDate) {
    maxModificationDate = (NSDate *)@"nil";
  }
  [v3 appendFormat:@" { %@:%@:%@ }", self->_zoneIDToQuery, self->_recordType, maxModificationDate];
  return v4;
}

- (void)executeImportOperationsAndAccumulateRecordsWithManagedObjectContext:(id)a3 completion:(id)a4
{
  uint64_t v52 = *MEMORY[0x1895F89C0];
  if (!self)
  {
    v21 = objc_alloc(&OBJC_CLASS___NSCloudKitMirroringResult);
    request = 0LL;
    id v9 = 0LL;
    goto LABEL_22;
  }

  uint64_t v42 = 0LL;
  v43 = &v42;
  uint64_t v44 = 0x3052000000LL;
  v45 = __Block_byref_object_copy__6;
  v46 = __Block_byref_object_dispose__6;
  uint64_t v47 = 0LL;
  uint64_t v38 = 0LL;
  v39 = &v38;
  uint64_t v40 = 0x2020000000LL;
  char v41 = 1;
  uint64_t v32 = 0LL;
  v33 = &v32;
  uint64_t v34 = 0x3052000000LL;
  v35 = __Block_byref_object_copy__6;
  v36 = __Block_byref_object_dispose__6;
  uint64_t v37 = 0LL;
  options = self->super.super._options;
  if (options) {
    monitor = options->_monitor;
  }
  else {
    monitor = 0LL;
  }
  uint64_t v8 = MEMORY[0x1895F87A8];
  location[0] = (id)MEMORY[0x1895F87A8];
  location[1] = (id)3221225472LL;
  location[2] = __101__PFCloudKitCKQueryBackedImportWorkItem_newCKQueryOperationFromMetadataInManagedObjectContext_error___block_invoke;
  location[3] = &unk_189EA7B00;
  location[4] = monitor;
  location[5] = a3;
  location[6] = self;
  location[7] = &v32;
  location[8] = &v38;
  location[9] = &v42;
  -[PFCloudKitStoreMonitor performBlock:]((uint64_t)monitor, (uint64_t)location);
  if (*((_BYTE *)v39 + 24))
  {
    id v9 = 0LL;
  }

  else
  {
    id v9 = (id)v43[5];
    if (!v9)
    {
      uint64_t v10 = [NSString stringWithUTF8String:"Illegal attempt to return an error without one in %s:%d"];
      _NSCoreDataLog( 17LL,  v10,  v11,  v12,  v13,  v14,  v15,  v16,  (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Persistence/PFCloudKitCKQueryBackedImportWorkItem.m");
      v17 = (os_log_s *)__pflogFaultLog;
      if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 136315394;
        v49 = "/Library/Caches/com.apple.xbs/Sources/Persistence/PFCloudKitCKQueryBackedImportWorkItem.m";
        __int16 v50 = 1024;
        int v51 = 190;
        _os_log_fault_impl( &dword_186681000,  v17,  OS_LOG_TYPE_FAULT,  "CoreData: Illegal attempt to return an error without one in %s:%d",  buf,  0x12u);
      }
    }

    v33[5] = 0LL;
  }

  v43[5] = 0LL;
  v18 = (void *)v33[5];
  _Block_object_dispose(&v32, 8);
  _Block_object_dispose(&v38, 8);
  _Block_object_dispose(&v42, 8);
  if (!v18)
  {
    v21 = objc_alloc(&OBJC_CLASS___NSCloudKitMirroringResult);
    v23 = self->super.super._options;
    request = self->super.super._request;
    if (v23)
    {
      v24 = v23->_monitor;
      if (v24)
      {
        storeIdentifier = v24->_storeIdentifier;
LABEL_19:
        v26 = -[NSCloudKitMirroringResult initWithRequest:storeIdentifier:success:madeChanges:error:]( v21,  "initWithRequest:storeIdentifier:success:madeChanges:error:",  request,  storeIdentifier,  0LL,  0LL,  v9);
        (*((void (**)(id, NSCloudKitMirroringResult *))a4 + 2))(a4, v26);

        v18 = 0LL;
        goto LABEL_20;
      }
    }

void __120__PFCloudKitCKQueryBackedImportWorkItem_executeImportOperationsAndAccumulateRecordsWithManagedObjectContext_completion___block_invoke( uint64_t a1,  uint64_t a2,  uint64_t a3)
{
  if (a3)
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    if (WeakRetained)
    {
      id v5 = WeakRetained;
      [WeakRetained addUpdatedRecord:a3];
      id WeakRetained = v5;
    }
  }

void __120__PFCloudKitCKQueryBackedImportWorkItem_executeImportOperationsAndAccumulateRecordsWithManagedObjectContext_completion___block_invoke_2( uint64_t a1,  void *a2,  void *a3)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    uint64_t v7 = *(void *)(a1 + 32);
    v27 = WeakRetained;
    uint64_t v8 = (void *)MEMORY[0x186E3E5D8]();
    else {
      uint64_t v9 = __ckLoggingOverride;
    }
    uint64_t v10 = [@"CoreData+CloudKit: %s(%d): " stringByAppendingString:@"%@: Finished with cursor: %@\n%@"];
    _NSCoreDataLog( v9,  v10,  v11,  v12,  v13,  v14,  v15,  v16,  (uint64_t)"-[PFCloudKitCKQueryBackedImportWorkItem queryOperationFinishedWithCursor:error:completion:]");
    objc_autoreleasePoolPop(v8);
    if (a3)
    {
      v17 = (void *)[a3 domain];
      if (![v17 isEqualToString:getCloudKitCKErrorDomain()]
        || [a3 code] != 11)
      {
        goto LABEL_12;
      }

      v18 = (void *)MEMORY[0x186E3E5D8]();
      BOOL v19 = __ckLoggingOverride != 0;
      uint64_t v20 = [@"CoreData+CloudKit: %s(%d): " stringByAppendingString:@"%@: Failed due to querying for an unknown record type (not fatal, schema needs to be initialized): %@"];
      _NSCoreDataLog( v19,  v20,  v21,  v22,  v23,  v24,  v25,  v26,  (uint64_t)"-[PFCloudKitCKQueryBackedImportWorkItem queryOperationFinishedWithCursor:error:completion:]");
      objc_autoreleasePoolPop(v18);
    }

    else if (a2)
    {
      a3 = 0LL;
      v27[21] = a2;
LABEL_12:
      -[PFCloudKitImportRecordsWorkItem fetchOperationFinishedWithError:completion:]((uint64_t)v27, (uint64_t)a3, v7);
      id WeakRetained = v27;
      goto LABEL_13;
    }

    a3 = 0LL;
    goto LABEL_12;
  }

void __101__PFCloudKitCKQueryBackedImportWorkItem_newCKQueryOperationFromMetadataInManagedObjectContext_error___block_invoke( uint64_t a1)
{
  v14[1] = *MEMORY[0x1895F89C0];
  v2 = (void *)-[PFCloudKitStoreMonitor retainedMonitoredStore](*(void *)(a1 + 32));
  if (v2)
  {
    uint64_t v3 = *(void *)(a1 + 32);
    if (v3) {
      id WeakRetained = objc_loadWeakRetained((id *)(v3 + 32));
    }
    else {
      id WeakRetained = 0LL;
    }
    v10[0] = MEMORY[0x1895F87A8];
    v10[1] = 3221225472LL;
    v10[2] = __101__PFCloudKitCKQueryBackedImportWorkItem_newCKQueryOperationFromMetadataInManagedObjectContext_error___block_invoke_2;
    v10[3] = &unk_189EA7B00;
    id v5 = *(void **)(a1 + 40);
    v10[4] = *(void *)(a1 + 48);
    v10[5] = v2;
    v10[6] = v5;
    __int128 v11 = *(_OWORD *)(a1 + 56);
    uint64_t v12 = *(void *)(a1 + 72);
    [v5 performBlockAndWait:v10];
  }

  else
  {
    *(_BYTE *)(*(void *)(*(void *)(a1 + 64) + 8LL) + 24LL) = 0;
    id v6 = objc_alloc(MEMORY[0x189607870]);
    uint64_t v7 = *MEMORY[0x189607460];
    uint64_t v13 = *MEMORY[0x1896075F0];
    uint64_t v8 = *(void *)(a1 + 48);
    if (v8) {
      uint64_t v9 = *(void **)(v8 + 16);
    }
    else {
      uint64_t v9 = 0LL;
    }
    v14[0] = [NSString stringWithFormat:@"Request '%@' was cancelled because the store was removed from the coordinator.", objc_msgSend(v9, "requestIdentifier")];
    *(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 40) = objc_msgSend( v6,  "initWithDomain:code:userInfo:",  v7,  134407,  objc_msgSend( MEMORY[0x189603F68],  "dictionaryWithObjects:forKeys:count:",  v14,  &v13,  1));
  }
}

void __101__PFCloudKitCKQueryBackedImportWorkItem_newCKQueryOperationFromMetadataInManagedObjectContext_error___block_invoke_2( uint64_t a1)
{
  v11[5] = *(id *)MEMORY[0x1895F89C0];
  v11[0] = 0LL;
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = *(void *)(v2 + 8);
  if (v3) {
    v4 = *(void **)(v3 + 8);
  }
  else {
    v4 = 0LL;
  }
  id v5 = +[NSCKRecordZoneMetadata zoneMetadataForZoneID:inDatabaseWithScope:forStore:inContext:error:]( (uint64_t)NSCKRecordZoneMetadata,  *(void **)(v2 + 176),  objc_msgSend(v4, "databaseScope", v11[0]),  *(void *)(a1 + 40),  *(void **)(a1 + 48),  (uint64_t)v11);
  if (v5
    && ((v6 = *(void *)(a1 + 32)) == 0 ? (uint64_t v7 = 0LL) : (uint64_t v7 = *(void *)(v6 + 152)),
        uint64_t v8 = +[NSCKRecordZoneQuery zoneQueryForRecordType:inZone:inStore:managedObjectContext:error:]( (uint64_t)&OBJC_CLASS___NSCKRecordZoneQuery,  v7,  v5,  *(void *)(a1 + 40),  *(void **)(a1 + 48),  (uint64_t)v11),  (v9 = v8) != 0LL))
  {
    uint64_t v10 = -[NSCKRecordZoneQuery createQueryForUpdatingRecords](v8);
    *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) = [objc_alloc((Class)getCloudKitCKQueryOperationClass[0]()) initWithQuery:v10];
    [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) setZoneID:*(void *)(*(void *)(a1 + 32) + 176)];
    objc_msgSend( *(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40),  "setCursor:",  -[NSManagedObject queryCursor](v9, "queryCursor"));
  }

  else
  {
    *(_BYTE *)(*(void *)(*(void *)(a1 + 64) + 8LL) + 24LL) = 0;
    *(void *)(*(void *)(*(void *)(a1 + 72) + 8LL) + 40LL) = v11[0];
  }

- (void)addUpdatedRecord:(id)a3
{
  v4 = self;
  if (self) {
    self = (PFCloudKitCKQueryBackedImportWorkItem *)self->super._encounteredErrors;
  }
  if (!-[PFCloudKitCKQueryBackedImportWorkItem count](self, "count"))
  {
    maxModificationDate = v4->_maxModificationDate;
    if (!maxModificationDate)
    {
      uint64_t v6 = 0LL;
      goto LABEL_8;
    }

    if (-[NSDate compare:](maxModificationDate, "compare:", [a3 modificationDate]) == NSOrderedAscending)
    {
      uint64_t v6 = v4->_maxModificationDate;
LABEL_8:

      v4->_maxModificationDate = (NSDate *)(id)[a3 modificationDate];
    }
  }

  v7.receiver = v4;
  v7.super_class = (Class)&OBJC_CLASS___PFCloudKitCKQueryBackedImportWorkItem;
  -[PFCloudKitImportRecordsWorkItem addUpdatedRecord:](&v7, sel_addUpdatedRecord_, a3);
}

- (BOOL)applyAccumulatedChangesToStore:(id)a3 inManagedObjectContext:(id)a4 withStoreMonitor:(id)a5 madeChanges:(BOOL *)a6 error:(id *)a7
{
  uint64_t v40 = *MEMORY[0x1895F89C0];
  uint64_t v30 = 0LL;
  v31 = &v30;
  uint64_t v32 = 0x3052000000LL;
  v33 = __Block_byref_object_copy__6;
  uint64_t v34 = __Block_byref_object_dispose__6;
  uint64_t v35 = 0LL;
  uint64_t v26 = 0LL;
  v27 = &v26;
  uint64_t v28 = 0x2020000000LL;
  v25.receiver = self;
  v25.super_class = (Class)&OBJC_CLASS___PFCloudKitCKQueryBackedImportWorkItem;
  unsigned __int8 v29 = -[PFCloudKitImportRecordsWorkItem applyAccumulatedChangesToStore:inManagedObjectContext:withStoreMonitor:madeChanges:error:]( &v25,  sel_applyAccumulatedChangesToStore_inManagedObjectContext_withStoreMonitor_madeChanges_error_,  a3,  a4,  a5,  a6,  &v35);
  if (*((_BYTE *)v27 + 24))
  {
    if (!a5 || !*((_BYTE *)a5 + 21))
    {
      v24[0] = MEMORY[0x1895F87A8];
      v24[1] = 3221225472LL;
      v24[2] = __130__PFCloudKitCKQueryBackedImportWorkItem_applyAccumulatedChangesToStore_inManagedObjectContext_withStoreMonitor_madeChanges_error___block_invoke;
      v24[3] = &unk_189EA7960;
      v24[4] = self;
      v24[5] = a3;
      v24[6] = a4;
      v24[7] = &v30;
      v24[8] = &v26;
      [a4 performBlockAndWait:v24];
    }
  }

  else
  {
    id v12 = (id)v31[5];
  }

  if (!*((_BYTE *)v27 + 24))
  {
    id v15 = (id)v31[5];
    if (v15)
    {
      if (a7) {
        *a7 = v15;
      }
    }

    else
    {
      uint64_t v16 = [NSString stringWithUTF8String:"Illegal attempt to return an error without one in %s:%d"];
      _NSCoreDataLog( 17LL,  v16,  v17,  v18,  v19,  v20,  v21,  v22,  (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Persistence/PFCloudKitCKQueryBackedImportWorkItem.m");
      uint64_t v23 = (os_log_s *)__pflogFaultLog;
      if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 136315394;
        uint64_t v37 = "/Library/Caches/com.apple.xbs/Sources/Persistence/PFCloudKitCKQueryBackedImportWorkItem.m";
        __int16 v38 = 1024;
        int v39 = 268;
        _os_log_fault_impl( &dword_186681000,  v23,  OS_LOG_TYPE_FAULT,  "CoreData: Illegal attempt to return an error without one in %s:%d",  buf,  0x12u);
      }
    }
  }

  v31[5] = 0LL;
  char v13 = *((_BYTE *)v27 + 24);
  _Block_object_dispose(&v26, 8);
  _Block_object_dispose(&v30, 8);
  return v13;
}

id __130__PFCloudKitCKQueryBackedImportWorkItem_applyAccumulatedChangesToStore_inManagedObjectContext_withStoreMonitor_madeChanges_error___block_invoke( uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = *(void *)(v2 + 8);
  if (v3) {
    v4 = *(void **)(v3 + 8);
  }
  else {
    v4 = 0LL;
  }
  id v5 = +[NSCKRecordZoneMetadata zoneMetadataForZoneID:inDatabaseWithScope:forStore:inContext:error:]( (uint64_t)NSCKRecordZoneMetadata,  *(void **)(v2 + 176),  [v4 databaseScope],  *(void *)(a1 + 40),  *(void **)(a1 + 48),  *(void *)(*(void *)(a1 + 56) + 8) + 40);
  if (!v5)
  {
    *(_BYTE *)(*(void *)(*(void *)(a1 + 64) + 8LL) + 24LL) = 0;
    return *(id *)(*(void *)(*(void *)(a1 + 56) + 8LL) + 40LL);
  }

  uint64_t v6 = *(void *)(a1 + 32);
  if (v6) {
    uint64_t v7 = *(void *)(v6 + 152);
  }
  else {
    uint64_t v7 = 0LL;
  }
  uint64_t v8 = +[NSCKRecordZoneQuery zoneQueryForRecordType:inZone:inStore:managedObjectContext:error:]( (uint64_t)&OBJC_CLASS___NSCKRecordZoneQuery,  v7,  v5,  *(void *)(a1 + 40),  *(void **)(a1 + 48),  *(void *)(*(void *)(a1 + 56) + 8LL) + 40LL);
  if (!v8)
  {
    *(_BYTE *)(*(void *)(*(void *)(a1 + 64) + 8LL) + 24LL) = 0;
    return *(id *)(*(void *)(*(void *)(a1 + 56) + 8LL) + 40LL);
  }

  uint64_t v9 = *(void *)(a1 + 32);
  if (v9) {
    uint64_t v10 = *(void *)(v9 + 160);
  }
  else {
    uint64_t v10 = 0LL;
  }
  -[NSManagedObject setMostRecentRecordModificationDate:](v8, "setMostRecentRecordModificationDate:", v10);
  id result = (id)[*(id *)(a1 + 48) save:*(void *)(*(void *)(a1 + 56) + 8) + 40];
  *(_BYTE *)(*(void *)(*(void *)(a1 + 64) + 8LL) + 24LL) = (_BYTE)result;
  if (!*(_BYTE *)(*(void *)(*(void *)(a1 + 64) + 8LL) + 24LL)) {
    return *(id *)(*(void *)(*(void *)(a1 + 56) + 8LL) + 40LL);
  }
  return result;
}

- (BOOL)updateMetadataForAccumulatedChangesInContext:(id)a3 inStore:(id)a4 error:(id *)a5
{
  uint64_t v32 = *MEMORY[0x1895F89C0];
  v27 = 0LL;
  zoneIDToQuery = self->_zoneIDToQuery;
  options = self->super.super._options;
  if (options) {
    database = options->_database;
  }
  else {
    database = 0LL;
  }
  id v12 = +[NSCKRecordZoneMetadata zoneMetadataForZoneID:inDatabaseWithScope:forStore:inContext:error:]( (uint64_t)&OBJC_CLASS___NSCKRecordZoneMetadata,  zoneIDToQuery,  -[CKDatabase databaseScope](database, "databaseScope"),  (uint64_t)a4,  a3,  (uint64_t)&v27);
  if (!v12
    || (char v13 = v12,
        (uint64_t v14 = +[NSCKRecordZoneQuery zoneQueryForRecordType:inZone:inStore:managedObjectContext:error:]( (uint64_t)&OBJC_CLASS___NSCKRecordZoneQuery,  (uint64_t)self->_recordType,  v12,  (uint64_t)a4,  a3,  (uint64_t)&v27)) == 0LL)
    || (id v15 = v14,
        -[NSManagedObject setQueryCursor:](v14, "setQueryCursor:", self->_queryCursor),
        -[NSManagedObject setLastFetchDate:]( v15,  "setLastFetchDate:",  -[NSManagedObject lastFetchDate](v13, "lastFetchDate")),  v26.receiver = self,  v26.super_class = (Class)&OBJC_CLASS___PFCloudKitCKQueryBackedImportWorkItem,  !-[PFCloudKitImportRecordsWorkItem updateMetadataForAccumulatedChangesInContext:inStore:error:]( &v26,  sel_updateMetadataForAccumulatedChangesInContext_inStore_error_,  a3,  a4,  a5)))
  {
    if (v27)
    {
      if (a5)
      {
        LOBYTE(v16) = 0;
        *a5 = v27;
        return v16;
      }
    }

    else
    {
      uint64_t v17 = [NSString stringWithUTF8String:"Illegal attempt to return an error without one in %s:%d"];
      _NSCoreDataLog( 17LL,  v17,  v18,  v19,  v20,  v21,  v22,  v23,  (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Persistence/PFCloudKitCKQueryBackedImportWorkItem.m");
      uint64_t v24 = (os_log_s *)__pflogFaultLog;
      BOOL v16 = os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT);
      if (!v16) {
        return v16;
      }
      *(_DWORD *)buf = 136315394;
      unsigned __int8 v29 = "/Library/Caches/com.apple.xbs/Sources/Persistence/PFCloudKitCKQueryBackedImportWorkItem.m";
      __int16 v30 = 1024;
      int v31 = 307;
      _os_log_fault_impl( &dword_186681000,  v24,  OS_LOG_TYPE_FAULT,  "CoreData: Illegal attempt to return an error without one in %s:%d",  buf,  0x12u);
    }

    LOBYTE(v16) = 0;
    return v16;
  }

  LOBYTE(v16) = 1;
  return v16;
}

- (BOOL)commitMetadataChangesWithContext:(id)a3 forStore:(id)a4 error:(id *)a5
{
  uint64_t v42 = *MEMORY[0x1895F89C0];
  v36 = 0LL;
  zoneIDToQuery = self->_zoneIDToQuery;
  options = self->super.super._options;
  if (options) {
    database = options->_database;
  }
  else {
    database = 0LL;
  }
  id v12 = +[NSCKRecordZoneMetadata zoneMetadataForZoneID:inDatabaseWithScope:forStore:inContext:error:]( (uint64_t)&OBJC_CLASS___NSCKRecordZoneMetadata,  zoneIDToQuery,  -[CKDatabase databaseScope](database, "databaseScope"),  (uint64_t)a4,  a3,  (uint64_t)&v36);
  if (!v12) {
    goto LABEL_17;
  }
  char v13 = v12;
  -[NSManagedObject setLastFetchDate:](v12, "setLastFetchDate:", [MEMORY[0x189603F50] date]);
  uint64_t v14 = +[NSCKRecordZoneQuery zoneQueryForRecordType:inZone:inStore:managedObjectContext:error:]( (uint64_t)&OBJC_CLASS___NSCKRecordZoneQuery,  (uint64_t)self->_recordType,  v13,  (uint64_t)a4,  a3,  (uint64_t)&v36);
  if (!v14) {
    goto LABEL_17;
  }
  id v15 = v14;
  -[NSManagedObject setQueryCursor:](v14, "setQueryCursor:", self->_queryCursor);
  -[NSManagedObject setLastFetchDate:](v15, "setLastFetchDate:", [MEMORY[0x189603F50] date]);
  -[NSManagedObject setNeedsImport:](v13, "setNeedsImport:", 0LL);
  __int128 v34 = 0u;
  __int128 v35 = 0u;
  __int128 v32 = 0u;
  __int128 v33 = 0u;
  BOOL v16 = (void *)-[NSManagedObject queries](v13, "queries");
  uint64_t v17 = [v16 countByEnumeratingWithState:&v32 objects:v41 count:16];
  if (v17)
  {
    uint64_t v18 = v17;
    uint64_t v19 = *(void *)v33;
    while (2)
    {
      for (uint64_t i = 0LL; i != v18; ++i)
      {
        if (*(void *)v33 != v19) {
          objc_enumerationMutation(v16);
        }
        if ([*(id *)(*((void *)&v32 + 1) + 8 * i) queryCursor])
        {
          -[NSManagedObject setNeedsImport:](v13, "setNeedsImport:", 1LL);
          goto LABEL_15;
        }
      }

      uint64_t v18 = [v16 countByEnumeratingWithState:&v32 objects:v41 count:16];
      if (v18) {
        continue;
      }
      break;
    }
  }

@end