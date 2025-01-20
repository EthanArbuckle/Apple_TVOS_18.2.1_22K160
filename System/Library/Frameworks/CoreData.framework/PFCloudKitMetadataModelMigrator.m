@interface PFCloudKitMetadataModelMigrator
- (BOOL)checkAndPerformMigrationIfNecessary:(uint64_t *)a1;
- (BOOL)checkForCorruptedRecordMetadataInStore:(void *)a3 inManagedObjectContext:(void *)a4 error:;
- (BOOL)cleanUpAfterClientMigrationWithStore:(void *)a3 andContext:(void *)a4 error:;
- (BOOL)computeAncillaryEntityPrimaryKeyTableEntriesForStore:(void *)a3 error:;
- (PFCloudKitMetadataModelMigrator)initWithStore:(id)a3 metadataContext:(id)a4 databaseScope:(int64_t)a5 metricsClient:(id)a6;
- (uint64_t)checkForOrphanedMirroredRelationshipsInStore:(void *)a3 inManagedObjectContext:(void *)a4 error:;
- (void)addMigrationStatementForAddingAttribute:(_BYTE *)a1 toContext:(uint64_t)a2 inStore:(void *)a3;
- (void)dealloc;
@end

@implementation PFCloudKitMetadataModelMigrator

- (PFCloudKitMetadataModelMigrator)initWithStore:(id)a3 metadataContext:(id)a4 databaseScope:(int64_t)a5 metricsClient:(id)a6
{
  v13.receiver = self;
  v13.super_class = (Class)&OBJC_CLASS___PFCloudKitMetadataModelMigrator;
  v10 = -[PFCloudKitMetadataModelMigrator init](&v13, sel_init);
  if (v10)
  {
    v10->_store = (NSSQLCore *)a3;
    v11 = (NSManagedObjectContext *)a4;
    v10->_metadataContext = v11;
    -[NSManagedObjectContext setTransactionAuthor:]( v11,  "setTransactionAuthor:",  @"NSCloudKitMirroringDelegate.migration");
    v10->_context = objc_alloc_init(&OBJC_CLASS___PFCloudKitMetadataMigrationContext);
    v10->_databaseScope = a5;
    v10->_metricsClient = (PFCloudKitMetricsClient *)a6;
  }

  return v10;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___PFCloudKitMetadataModelMigrator;
  -[PFCloudKitMetadataModelMigrator dealloc](&v3, sel_dealloc);
}

uint64_t __70__PFCloudKitMetadataModelMigrator_prepareContextWithConnection_error___block_invoke( uint64_t a1,  uint64_t a2,  uint64_t a3,  _BYTE *a4)
{
  uint64_t result = [*(id *)(a1 + 32) entityNamed:a2];
  if (a3)
  {
    int v8 = *(_DWORD *)(a3 + 184);
    if (result)
    {
LABEL_3:
      int v9 = *(_DWORD *)(result + 184);
      goto LABEL_4;
    }
  }

  else
  {
    int v8 = 0;
    if (result) {
      goto LABEL_3;
    }
  }

  int v9 = 0;
LABEL_4:
  if (v8 != v9)
  {
    *(_BYTE *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL) = 1;
    *a4 = 1;
  }

  return result;
}

- (BOOL)computeAncillaryEntityPrimaryKeyTableEntriesForStore:(void *)a3 error:
{
  uint64_t v26 = *MEMORY[0x1895F89C0];
  if (!a1) {
    return 0LL;
  }
  uint64_t v18 = 0LL;
  v19 = &v18;
  uint64_t v20 = 0x2020000000LL;
  char v21 = 1;
  v17[0] = MEMORY[0x1895F87A8];
  v17[1] = 3221225472LL;
  v17[2] = __94__PFCloudKitMetadataModelMigrator_computeAncillaryEntityPrimaryKeyTableEntriesForStore_error___block_invoke;
  v17[3] = &unk_189EA99D8;
  v17[4] = a2;
  v17[5] = &v18;
  v5 = -[NSSQLBlockRequestContext initWithBlock:context:sqlCore:]( objc_alloc(&OBJC_CLASS___NSSQLBlockRequestContext),  "initWithBlock:context:sqlCore:",  v17,  0LL,  a2);
  -[NSSQLCore dispatchRequest:withRetries:](a2, v5, 0LL);

  if (!*((_BYTE *)v19 + 24))
  {
    id v8 = 0LL;
    if (v8)
    {
      if (a3) {
        *a3 = v8;
      }
    }

    else
    {
      uint64_t v9 = [NSString stringWithUTF8String:"Illegal attempt to return an error without one in %s:%d"];
      _NSCoreDataLog( 17LL,  v9,  v10,  v11,  v12,  v13,  v14,  v15,  (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Persistence/PFCloudKitMetadataModelMigrator.m");
      v16 = (os_log_s *)__pflogFaultLog;
      if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 136315394;
        v23 = "/Library/Caches/com.apple.xbs/Sources/Persistence/PFCloudKitMetadataModelMigrator.m";
        __int16 v24 = 1024;
        int v25 = 1267;
        _os_log_fault_impl( &dword_186681000,  v16,  OS_LOG_TYPE_FAULT,  "CoreData: Illegal attempt to return an error without one in %s:%d",  buf,  0x12u);
      }
    }
  }

  BOOL v6 = *((_BYTE *)v19 + 24) != 0;
  _Block_object_dispose(&v18, 8);
  return v6;
}

void __70__PFCloudKitMetadataModelMigrator_prepareContextWithConnection_error___block_invoke_2(void *a1)
{
  v29[1] = *MEMORY[0x1895F89C0];
  v27[0] = 0LL;
  v29[0] = @"PFCloudKitMetadataFrameworkVersionKey";
  v2 = (void *)objc_msgSend( +[NSCKMetadataEntry entriesForKeys:onlyFetchingProperties:fromStore:inManagedObjectContext:error:]( (uint64_t)NSCKMetadataEntry,  objc_msgSend(MEMORY[0x189603F18], "arrayWithObjects:count:", v29, 1),  &unk_189F0B388,  *(void *)(a1[4] + 8),  *(void **)(a1[4] + 16),  (uint64_t)v27),  "objectForKey:",  @"PFCloudKitMetadataFrameworkVersionKey");
  objc_super v3 = (void *)v27[0];
  if (v27[0])
  {
    *(_BYTE *)(*(void *)(a1[5] + 8LL) + 24LL) = 0;
    *(void *)(*(void *)(a1[6] + 8LL) + 40LL) = v3;
  }

  else if (v2)
  {
    v5 = (void *)[v2 integerValue];
    BOOL v6 = *(void **)(a1[4] + 24LL);
    if (v6)
    {
      objc_setProperty_nonatomic(v6, v4, v5, 80LL);
      uint64_t v7 = *(void *)(a1[4] + 24LL);
      if (v7) {
        BOOL v6 = *(void **)(v7 + 80);
      }
      else {
        BOOL v6 = 0LL;
      }
    }

    uint64_t v8 = objc_msgSend(v6, "integerValue", v5);
    uint64_t v9 = *(void *)(a1[4] + 24LL);
    if (v9 && (*(_BYTE *)(v9 + 33) = v8 < 940, (uint64_t v10 = *(void *)(a1[4] + 24LL)) != 0)) {
      uint64_t v11 = *(void **)(v10 + 80);
    }
    else {
      uint64_t v11 = 0LL;
    }
    uint64_t v12 = [v11 integerValue];
    uint64_t v13 = *(void *)(a1[4] + 24LL);
    if (v13 && (*(_BYTE *)(v13 + 37) = v12 < 1028, (uint64_t v14 = *(void *)(a1[4] + 24LL)) != 0)) {
      uint64_t v15 = *(void **)(v14 + 80);
    }
    else {
      uint64_t v15 = 0LL;
    }
    uint64_t v16 = [v15 integerValue];
    uint64_t v17 = *(void *)(a1[4] + 24LL);
    if (v17 && (*(_BYTE *)(v17 + 39) = v16 < 1244, (uint64_t v18 = *(void *)(a1[4] + 24LL)) != 0)) {
      v19 = *(void **)(v18 + 80);
    }
    else {
      v19 = 0LL;
    }
    uint64_t v20 = [v19 integerValue];
    uint64_t v21 = *(void *)(a1[4] + 24LL);
    if (v21) {
      *(_BYTE *)(v21 + 40) = v20 < 1336;
    }
  }

  if (*(_BYTE *)(*(void *)(a1[5] + 8LL) + 24LL))
  {
    v28 = @"PFCloudKitMetadataModelVersionHashesKey";
    v22 = (void *)objc_msgSend( +[NSCKMetadataEntry entriesForKeys:onlyFetchingProperties:fromStore:inManagedObjectContext:error:]( (uint64_t)NSCKMetadataEntry,  objc_msgSend(MEMORY[0x189603F18], "arrayWithObjects:count:", &v28, 1),  &unk_189F0B3A0,  *(void *)(a1[4] + 8),  *(void **)(a1[4] + 16),  (uint64_t)v27),  "objectForKey:",  @"PFCloudKitMetadataModelVersionHashesKey");
    v23 = (void *)v27[0];
    if (v27[0])
    {
      *(_BYTE *)(*(void *)(a1[5] + 8LL) + 24LL) = 0;
      *(void *)(*(void *)(a1[6] + 8LL) + 40LL) = v23;
    }

    else
    {
      int v25 = (void *)[v22 transformedValue];
      uint64_t v26 = *(void **)(a1[4] + 24LL);
      if (v26) {
        objc_setProperty_nonatomic(v26, v24, v25, 88LL);
      }
    }
  }

- (void)addMigrationStatementForAddingAttribute:(_BYTE *)a1 toContext:(uint64_t)a2 inStore:(void *)a3
{
  BOOL v6 = (void *)[a1 entity];
  uint64_t v7 = objc_alloc(&OBJC_CLASS___NSSQLiteStatement);
  uint64_t v8 = -[NSSQLiteStatement initWithEntity:sqlString:]( v7,  "initWithEntity:sqlString:",  v6,  [NSString stringWithFormat:@"ALTER TABLE %@ ADD COLUMN %@ %@", objc_msgSend(v6, "tableName"), objc_msgSend(a1, "columnName"), -[NSSQLiteAdapter typeStringForColumn:]((const __CFString *)objc_msgSend(a3, "adapter"), a1)]);
  if (a2)
  {
    uint64_t v9 = v8;
    [*(id *)(a2 + 8) addObject:v8];
    uint64_t v8 = v9;
    *(_BYTE *)(a2 + 32) = 1;
  }
}

void __79__PFCloudKitMetadataModelMigrator_calculateMigrationStepsWithConnection_error___block_invoke( uint64_t a1)
{
  id v2 = objc_alloc(getCloudKitCKRecordZoneIDClass());
  objc_super v3 = (void *)[v2 initWithZoneName:@"com.apple.coredata.cloudkit.zone" ownerName:getCloudKitCKCurrentUserDefaultName()];
  v4 = +[NSFetchRequest fetchRequestWithEntityName:]( &OBJC_CLASS___NSFetchRequest,  "fetchRequestWithEntityName:",  +[NSCKRecordZoneMetadata entityPath](&OBJC_CLASS___NSCKRecordZoneMetadata, "entityPath"));
  -[NSFetchRequest setPredicate:]( v4,  "setPredicate:",  [MEMORY[0x1896079C8] predicateWithFormat:@"ckRecordZoneName = %@ AND ckOwnerName = %@", objc_msgSend(v3, "zoneName"), objc_msgSend(v3, "ownerName")]);
  -[NSFetchRequest setResultType:](v4, "setResultType:", 4LL);
  -[NSFetchRequest setPropertiesToFetch:](v4, "setPropertiesToFetch:", &unk_189F0B3D0);
  uint64_t v5 = *(void *)(*(void *)(a1 + 32) + 16LL);
  if (v5)
  {
    -[NSManagedObjectContext _countForFetchRequest_:error:]( v5,  v4,  (id *)(*(void *)(*(void *)(a1 + 48) + 8LL) + 40LL));
    if (v6 == 0x7FFFFFFFFFFFFFFFLL)
    {
      *(_BYTE *)(*(void *)(*(void *)(a1 + 56) + 8LL) + 24LL) = 0;
      id v7 = *(id *)(*(void *)(*(void *)(a1 + 48) + 8LL) + 40LL);
    }

    else if (v6 >= 2)
    {
      uint64_t v8 = objc_alloc(&OBJC_CLASS___NSSQLiteStatement);
      uint64_t v9 = -[NSSQLiteStatement initWithEntity:sqlString:]( v8,  "initWithEntity:sqlString:",  0,  [NSString stringWithFormat:@"DELETE FROM %@", objc_msgSend(*(id *)(a1 + 40), "tableName")]);
      uint64_t v10 = *(void *)(*(void *)(a1 + 32) + 24LL);
      if (v10)
      {
        [*(id *)(v10 + 8) addObject:v9];
        *(_BYTE *)(v10 + 32) = 1;
      }
    }
  }
}

void __69__PFCloudKitMetadataModelMigrator_commitMigrationMetadataAndCleanup___block_invoke(uint64_t a1)
{
  uint64_t v203 = *MEMORY[0x1895F89C0];
  if (!+[_PFRoutines _isInMemoryStore:]( (uint64_t)&OBJC_CLASS____PFRoutines,  *(unsigned __int8 **)(*(void *)(a1 + 32) + 8LL)))
  {
    v196[0] = 0LL;
    if (([*(id *)(*(void *)(a1 + 32) + 16) setQueryGenerationFromToken:0 error:v196] & 1) == 0)
    {
      v1 = (void *)MEMORY[0x186E3E5D8]();
      uint64_t v2 = __ckLoggingOverride;
      uint64_t v3 = [@"CoreData+CloudKit: %s(%d): " stringByAppendingString:@"%@: Unable to set query generation on moc: %@"];
      _NSCoreDataLog( v2 != 0,  v3,  v4,  v5,  v6,  v7,  v8,  v9,  (uint64_t)"-[PFCloudKitMetadataModelMigrator commitMigrationMetadataAndCleanup:]_block_invoke");
      objc_autoreleasePoolPop(v1);
    }
  }

  id v172 = 0LL;
  if (!+[NSCKMetadataEntry updateOrInsertMetadataEntryWithKey:BOOLValue:forStore:intoManagedObjectContext:error:]( (uint64_t)&OBJC_CLASS___NSCKMetadataEntry,  (uint64_t)@"PFCloudKitMetadataModelMigratorMigrationBeganCommitKey",  1,  *(void *)(*(void *)(a1 + 32) + 8LL),  *(void **)(*(void *)(a1 + 32) + 16LL),  &v172)
    || ([*(id *)(*(void *)(a1 + 32) + 16) save:&v172] & 1) == 0)
  {
    *(_BYTE *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL) = 0;
    *(void *)(*(void *)(*(void *)(a1 + 48) + 8LL) + 40LL) = v172;
  }

  if (!*(_BYTE *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL)) {
    return;
  }
  if (!+[_PFRoutines _isInMemoryStore:]( (uint64_t)&OBJC_CLASS____PFRoutines,  *(unsigned __int8 **)(*(void *)(a1 + 32) + 8LL)))
  {
    v196[0] = 0LL;
    if ((objc_msgSend( *(id *)(*(void *)(a1 + 32) + 16),  "setQueryGenerationFromToken:error:",  +[NSQueryGenerationToken currentQueryGenerationToken]( NSQueryGenerationToken,  "currentQueryGenerationToken"),  v196) & 1) == 0)
    {
      uint64_t v10 = (void *)MEMORY[0x186E3E5D8]();
      uint64_t v11 = __ckLoggingOverride;
      uint64_t v12 = [@"CoreData+CloudKit: %s(%d): " stringByAppendingString:@"%@: Unable to set query generation on moc: %@"];
      _NSCoreDataLog( v11 != 0,  v12,  v13,  v14,  v15,  v16,  v17,  v18,  (uint64_t)"-[PFCloudKitMetadataModelMigrator commitMigrationMetadataAndCleanup:]_block_invoke");
      objc_autoreleasePoolPop(v10);
    }
  }

  uint64_t v19 = +[NSCKMetadataEntry entryForKey:fromStore:inManagedObjectContext:error:]( (uint64_t)&OBJC_CLASS___NSCKMetadataEntry,  (uint64_t)@"PFCloudKitMetadataFrameworkVersionKey",  *(void *)(*(void *)(a1 + 32) + 8LL),  *(void **)(*(void *)(a1 + 32) + 16LL),  (uint64_t)&v172);
  id v20 = v172;
  if (v172
    || (uint64_t v21 = (void *)v19,
        v22 = (void *)+[NSCKMetadataEntry entryForKey:fromStore:inManagedObjectContext:error:]( (uint64_t)&OBJC_CLASS___NSCKMetadataEntry,  (uint64_t)@"PFCloudKitMetadataModelVersionHashesKey",  *(void *)(*(void *)(a1 + 32) + 8LL),  *(void **)(*(void *)(a1 + 32) + 16LL),  (uint64_t)&v172),  (id v20 = v172) != 0LL))
  {
    *(_BYTE *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL) = 0;
    id v23 = v20;
    goto LABEL_14;
  }

  uint64_t v39 = [v22 transformedValue];
  if (!v39
    || ((uint64_t v40 = *(void *)(*(void *)(a1 + 32) + 24LL)) == 0 ? (v41 = 0LL) : (v41 = *(void **)(v40 + 48)),
        (objc_msgSend((id)objc_msgSend(v41, "entityVersionHashesByName"), "isEqual:", v39) & 1) == 0))
  {
    if (!-[PFCloudKitMetadataModelMigrator computeAncillaryEntityPrimaryKeyTableEntriesForStore:error:]( *(void *)(a1 + 32),  *(void *)(*(void *)(a1 + 32) + 8LL),  &v172))
    {
      *(_BYTE *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL) = 0;
      *(void *)(*(void *)(*(void *)(a1 + 48) + 8LL) + 40LL) = v172;
    }
  }

  uint64_t v42 = *(void *)(a1 + 40);
  if (*(_BYTE *)(*(void *)(v42 + 8) + 24LL))
  {
    uint64_t v43 = *(void *)(*(void *)(a1 + 32) + 24LL);
    v44 = v43 ? *(void **)(v43 + 48) : 0LL;
    uint64_t v45 = +[NSCKMetadataEntry updateOrInsertMetadataEntryWithKey:transformedValue:forStore:intoManagedObjectContext:error:]( (uint64_t)NSCKMetadataEntry,  (uint64_t)@"PFCloudKitMetadataModelVersionHashesKey",  [v44 entityVersionHashesByName],  *(void *)(*(void *)(a1 + 32) + 8),  *(void **)(*(void *)(a1 + 32) + 16),  &v172);
    uint64_t v42 = *(void *)(a1 + 40);
    if (!v45)
    {
      *(_BYTE *)(*(void *)(v42 + 8) + 24LL) = 0;
      *(void *)(*(void *)(*(void *)(a1 + 48) + 8LL) + 40LL) = v172;
      uint64_t v42 = *(void *)(a1 + 40);
    }
  }

  if (!*(_BYTE *)(*(void *)(v42 + 8) + 24LL)) {
    return;
  }
  if (v21)
  {
    unint64_t v46 = objc_msgSend((id)objc_msgSend(v21, "integerValue"), "unsignedIntegerValue");
    BOOL v47 = (unint64_t)objc_msgSend((id)objc_msgSend(v21, "integerValue"), "unsignedIntegerValue") < 0x3B1;
    BOOL v148 = (unint64_t)objc_msgSend((id)objc_msgSend(v21, "integerValue"), "unsignedIntegerValue") < 0x3B3;
    if (v46 > 0x399) {
      goto LABEL_55;
    }
  }

  else
  {
    BOOL v148 = 0;
    BOOL v47 = 1;
  }

  v48 = -[NSCloudKitMirroringDelegatePreJazzkonMetadata initWithStore:]( objc_alloc(&OBJC_CLASS___NSCloudKitMirroringDelegatePreJazzkonMetadata),  "initWithStore:",  *(void *)(*(void *)(a1 + 32) + 8LL));
  if (!-[NSCloudKitMirroringDelegatePreJazzkonMetadata load:]((uint64_t)v48, &v172))
  {
LABEL_52:
    *(_BYTE *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL) = 0;
    id v51 = v172;
    goto LABEL_53;
  }

  v49 = +[NSCKDatabaseMetadata databaseMetadataForScope:forStore:inContext:error:]( (uint64_t)&OBJC_CLASS___NSCKDatabaseMetadata,  *(void *)(*(void *)(a1 + 32) + 32LL),  *(void *)(*(void *)(a1 + 32) + 8LL),  *(void **)(*(void *)(a1 + 32) + 16LL),  (uint64_t)&v172);
  id v50 = v172;
  if (!v172)
  {
    v83 = v49;
    -[NSManagedObject setCurrentChangeToken:]( v49,  "setCurrentChangeToken:",  -[NSCloudKitMirroringDelegatePreJazzkonMetadata changeTokenForDatabaseScope:]( (uint64_t)v48,  *(void *)(*(void *)(a1 + 32) + 32LL)));
    -[NSManagedObject setHasSubscription:]( v83,  "setHasSubscription:",  -[NSCloudKitMirroringDelegatePreJazzkonMetadata hasInitializedDatabaseSubscription]((uint64_t)v48));
    if (*(void *)(*(void *)(a1 + 32) + 32LL) == 2LL)
    {
      id v84 = +[PFCloudKitSerializer defaultRecordZoneIDForDatabaseScope:]( &OBJC_CLASS___PFCloudKitSerializer,  "defaultRecordZoneIDForDatabaseScope:",  2LL);
      v85 = +[NSCKRecordZoneMetadata zoneMetadataForZoneID:inDatabaseWithScope:forStore:inContext:error:]( (uint64_t)&OBJC_CLASS___NSCKRecordZoneMetadata,  v84,  *(void *)(*(void *)(a1 + 32) + 32LL),  *(void *)(*(void *)(a1 + 32) + 8LL),  *(void **)(*(void *)(a1 + 32) + 16LL),  (uint64_t)&v172);
      id v86 = v172;
      if (v172)
      {
        *(_BYTE *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL) = 0;
        *(void *)(*(void *)(*(void *)(a1 + 48) + 8LL) + 40LL) = v86;
      }

      else
      {
        v143 = v85;
        -[NSManagedObject setHasSubscription:]( v85,  "setHasSubscription:",  -[NSCloudKitMirroringDelegatePreJazzkonMetadata hasInitializedZoneSubscription]((uint64_t)v48));
        -[NSManagedObject setCurrentChangeToken:]( v143,  "setCurrentChangeToken:",  -[NSCloudKitMirroringDelegatePreJazzkonMetadata changeTokenForZoneWithID:inDatabaseWithScope:]( (id *)&v48->super.isa,  v84,  *(void *)(*(void *)(a1 + 32) + 32LL)));
        -[NSManagedObject setHasRecordZone:](v143, "setHasRecordZone:", 0LL);
      }
    }

    if (*(_BYTE *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL))
    {
      if (-[NSCloudKitMirroringDelegatePreJazzkonMetadata lastHistoryToken]((uint64_t)v48))
      {
        uint64_t v144 = -[NSCloudKitMirroringDelegatePreJazzkonMetadata lastHistoryToken]((uint64_t)v48);
        if (!+[NSCKMetadataEntry updateOrInsertMetadataEntryWithKey:transformedValue:forStore:intoManagedObjectContext:error:]( (uint64_t)&OBJC_CLASS___NSCKMetadataEntry,  (uint64_t)@"NSCloudKitMirroringDelegateLastHistoryTokenKey",  v144,  *(void *)(*(void *)(a1 + 32) + 8LL),  *(void **)(*(void *)(a1 + 32) + 16LL),  &v172))
        {
          *(_BYTE *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL) = 0;
          *(void *)(*(void *)(*(void *)(a1 + 48) + 8LL) + 40LL) = v172;
        }
      }
    }

    if (*(_BYTE *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL))
    {
      if (-[NSCloudKitMirroringDelegatePreJazzkonMetadata ckIdentityRecordName]((id *)&v48->super.isa))
      {
        v145 = -[NSCloudKitMirroringDelegatePreJazzkonMetadata ckIdentityRecordName]((id *)&v48->super.isa);
        if (!+[NSCKMetadataEntry updateOrInsertMetadataEntryWithKey:stringValue:forStore:intoManagedObjectContext:error:]( (uint64_t)&OBJC_CLASS___NSCKMetadataEntry,  (uint64_t)@"NSCloudKitMirroringDelegateCKIdentityRecordNameDefaultsKey",  (uint64_t)v145,  *(void *)(*(void *)(a1 + 32) + 8LL),  *(void **)(*(void *)(a1 + 32) + 16LL),  &v172))
        {
          *(_BYTE *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL) = 0;
          *(void *)(*(void *)(*(void *)(a1 + 48) + 8LL) + 40LL) = v172;
        }
      }
    }

    if (!*(_BYTE *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL)) {
      goto LABEL_54;
    }
    char v146 = -[NSCloudKitMirroringDelegatePreJazzkonMetadata hasCheckedCKIdentity]((uint64_t)v48);
    if (+[NSCKMetadataEntry updateOrInsertMetadataEntryWithKey:BOOLValue:forStore:intoManagedObjectContext:error:]( (uint64_t)&OBJC_CLASS___NSCKMetadataEntry,  (uint64_t)@"NSCloudKitMirroringDelegateCheckedCKIdentityDefaultsKey",  v146,  *(void *)(*(void *)(a1 + 32) + 8LL),  *(void **)(*(void *)(a1 + 32) + 16LL),  &v172))
    {
      goto LABEL_54;
    }

    goto LABEL_52;
  }

  *(_BYTE *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL) = 0;
  id v51 = v50;
LABEL_53:
  *(void *)(*(void *)(*(void *)(a1 + 48) + 8LL) + 40LL) = v51;
LABEL_54:

LABEL_55:
  int v52 = *(unsigned __int8 *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL);
  if (*(_BYTE *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL) && v47)
  {
    uint64_t v53 = MEMORY[0x186E3E5D8]();
    id v152 = objc_alloc_init(MEMORY[0x189603FC8]);
    v54 = +[NSFetchRequest fetchRequestWithEntityName:]( &OBJC_CLASS___NSFetchRequest,  "fetchRequestWithEntityName:",  +[NSCKRecordZoneMetadata entityPath](&OBJC_CLASS___NSCKRecordZoneMetadata, "entityPath"));
    -[NSFetchRequest setRelationshipKeyPathsForPrefetching:]( v54,  "setRelationshipKeyPathsForPrefetching:",  &unk_189F0B478);
    -[NSFetchRequest setReturnsObjectsAsFaults:](v54, "setReturnsObjectsAsFaults:", 0LL);
    uint64_t v189 = *(void *)(*(void *)(a1 + 32) + 8LL);
    -[NSFetchRequest setAffectedStores:]( v54,  "setAffectedStores:",  [MEMORY[0x189603F18] arrayWithObjects:&v189 count:1]);
    v55 = (void *)[*(id *)(*(void *)(a1 + 32) + 16) executeFetchRequest:v54 error:&v172];
    context = (void *)v53;
    if (v55
      && (v56 = +[NSCKDatabaseMetadata databaseMetadataForScope:forStore:inContext:error:]( (uint64_t)&OBJC_CLASS___NSCKDatabaseMetadata,  *(void *)(*(void *)(a1 + 32) + 32LL),  *(void *)(*(void *)(a1 + 32) + 8LL),  *(void **)(*(void *)(a1 + 32) + 16LL),  (uint64_t)&v172)) != 0LL)
    {
      v149 = v56;
      __int128 v170 = 0u;
      __int128 v171 = 0u;
      __int128 v168 = 0u;
      __int128 v169 = 0u;
      uint64_t v57 = [v55 countByEnumeratingWithState:&v168 objects:v188 count:16];
      if (v57)
      {
        uint64_t v58 = *(void *)v169;
        do
        {
          uint64_t v59 = 0LL;
          uint64_t v150 = v57;
          do
          {
            if (*(void *)v169 != v58) {
              objc_enumerationMutation(v55);
            }
            v60 = *(void **)(*((void *)&v168 + 1) + 8 * v59);
            if (objc_msgSend((id)objc_msgSend(v60, "ckOwnerName"), "length")
              && objc_msgSend((id)objc_msgSend(v60, "ckRecordZoneName"), "length"))
            {
              v61 = -[NSCKRecordZoneMetadata createRecordZoneID](v60);
              uint64_t v62 = [v152 objectForKey:v61];
              if (v62)
              {
                v63 = (void *)objc_msgSend((id)objc_msgSend(v60, "mirroredRelationships"), "copy");
                __int128 v166 = 0u;
                __int128 v167 = 0u;
                __int128 v164 = 0u;
                __int128 v165 = 0u;
                uint64_t v64 = [v63 countByEnumeratingWithState:&v164 objects:v187 count:16];
                if (v64)
                {
                  uint64_t v65 = *(void *)v165;
                  do
                  {
                    for (uint64_t i = 0LL; i != v64; ++i)
                    {
                      if (*(void *)v165 != v65) {
                        objc_enumerationMutation(v63);
                      }
                      [*(id *)(*((void *)&v164 + 1) + 8 * i) setRecordZone:v62];
                    }

                    uint64_t v64 = [v63 countByEnumeratingWithState:&v164 objects:v187 count:16];
                  }

                  while (v64);
                }

                v67 = (void *)objc_msgSend((id)objc_msgSend(v60, "records"), "copy");
                __int128 v162 = 0u;
                __int128 v163 = 0u;
                __int128 v160 = 0u;
                __int128 v161 = 0u;
                uint64_t v68 = [v67 countByEnumeratingWithState:&v160 objects:v186 count:16];
                if (v68)
                {
                  uint64_t v69 = *(void *)v161;
                  do
                  {
                    for (uint64_t j = 0LL; j != v68; ++j)
                    {
                      if (*(void *)v161 != v69) {
                        objc_enumerationMutation(v67);
                      }
                      [*(id *)(*((void *)&v160 + 1) + 8 * j) setRecordZone:v62];
                    }

                    uint64_t v68 = [v67 countByEnumeratingWithState:&v160 objects:v186 count:16];
                  }

                  while (v68);
                }

                uint64_t v57 = v150;
                [*(id *)(*(void *)(a1 + 32) + 16) deleteObject:v60];
              }

              else
              {
                [v60 setDatabase:v149];
                [v152 setObject:v60 forKey:v61];
              }
            }

            else
            {
              [*(id *)(*(void *)(a1 + 32) + 16) deleteObject:v60];
            }

            ++v59;
          }

          while (v59 != v57);
          uint64_t v57 = [v55 countByEnumeratingWithState:&v168 objects:v188 count:16];
        }

        while (v57);
      }
    }

    else
    {
      *(_BYTE *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL) = 0;
      *(void *)(*(void *)(*(void *)(a1 + 48) + 8LL) + 40LL) = v172;
    }

    objc_autoreleasePoolPop(context);
    int v52 = *(unsigned __int8 *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL);
  }

  if (v52
    && [*(id *)(*(void *)(a1 + 32) + 16) hasChanges]
    && ([*(id *)(*(void *)(a1 + 32) + 16) save:&v172] & 1) == 0)
  {
    *(_BYTE *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL) = 0;
    *(void *)(*(void *)(*(void *)(a1 + 48) + 8LL) + 40LL) = v172;
  }

  uint64_t v87 = *(void *)(a1 + 40);
  if (!*(_BYTE *)(*(void *)(v87 + 8) + 24LL)) {
    goto LABEL_168;
  }
  uint64_t v88 = *(void *)(a1 + 32);
  uint64_t v89 = *(void *)(v88 + 24);
  if (v89)
  {
    if (*(_BYTE *)(v89 + 35))
    {
      id v90 = +[PFCloudKitSerializer defaultRecordZoneIDForDatabaseScope:]( &OBJC_CLASS___PFCloudKitSerializer,  "defaultRecordZoneIDForDatabaseScope:",  *(void *)(v88 + 32));
      v91 = +[NSCKRecordZoneMetadata zoneMetadataForZoneID:inDatabaseWithScope:forStore:inContext:error:]( (uint64_t)&OBJC_CLASS___NSCKRecordZoneMetadata,  v90,  *(void *)(*(void *)(a1 + 32) + 32LL),  *(void *)(*(void *)(a1 + 32) + 8LL),  *(void **)(*(void *)(a1 + 32) + 16LL),  (uint64_t)&v172);
      if (-[NSManagedObject isInserted](v91, "isInserted")) {
        *(_BYTE *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = [*(id *)(*(void *)(a1 + 32) + 16) save:&v172];
      }
      if (*(_BYTE *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL))
      {
        v92 = -[NSFetchRequest initWithEntityName:]( objc_alloc(&OBJC_CLASS___NSFetchRequest),  "initWithEntityName:",  +[NSCKMirroredRelationship entityPath](&OBJC_CLASS___NSCKMirroredRelationship, "entityPath"));
        uint64_t v185 = *(void *)(*(void *)(a1 + 32) + 8LL);
        -[NSFetchRequest setAffectedStores:]( v92,  "setAffectedStores:",  [MEMORY[0x189603F18] arrayWithObjects:&v185 count:1]);
        -[NSFetchRequest setFetchBatchSize:](v92, "setFetchBatchSize:", 500LL);
        uint64_t v93 = *(void *)(a1 + 32);
        v94 = *(void **)(v93 + 16);
        v158[0] = MEMORY[0x1895F87A8];
        v158[1] = 3221225472LL;
        v158[2] = __69__PFCloudKitMetadataModelMigrator_commitMigrationMetadataAndCleanup___block_invoke_2;
        v158[3] = &unk_189EAB898;
        v158[4] = v91;
        v158[5] = v93;
        int8x16_t v159 = vextq_s8(*(int8x16_t *)(a1 + 40), *(int8x16_t *)(a1 + 40), 8uLL);
        +[_PFRoutines efficientlyEnumerateManagedObjectsInFetchRequest:usingManagedObjectContext:andApplyBlock:]( (uint64_t)&OBJC_CLASS____PFRoutines,  (uint64_t)v92,  v94,  (uint64_t)v158);
      }

      uint64_t v87 = *(void *)(a1 + 40);
      if (!*(_BYTE *)(*(void *)(v87 + 8) + 24LL)) {
        goto LABEL_168;
      }
    }
  }

  uint64_t v95 = *(void *)(*(void *)(a1 + 32) + 24LL);
  if (!v95 || !*(_BYTE *)(v95 + 38)) {
    goto LABEL_138;
  }
  v96 = (void *)MEMORY[0x186E3E5D8]();
  v97 = +[NSFetchRequest fetchRequestWithEntityName:]( &OBJC_CLASS___NSFetchRequest,  "fetchRequestWithEntityName:",  +[NSCKHistoryAnalyzerState entityPath](&OBJC_CLASS___NSCKHistoryAnalyzerState, "entityPath"));
  -[NSFetchRequest setPredicate:]( v97,  "setPredicate:",  [MEMORY[0x1896079C8] predicateWithFormat:@"entityId = 0"]);
  uint64_t v98 = *(void *)(*(void *)(a1 + 32) + 16LL);
  if (v98)
  {
    -[NSManagedObjectContext _countForFetchRequest_:error:]( v98,  v97,  (id *)(*(void *)(*(void *)(a1 + 48) + 8LL) + 40LL));
    if (v99)
    {
      if (v99 == 0x7FFFFFFFFFFFFFFFLL)
      {
        *(_BYTE *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL) = 0;
        id v100 = *(id *)(*(void *)(*(void *)(a1 + 48) + 8LL) + 40LL);
        goto LABEL_133;
      }

      v101 = (void *)MEMORY[0x186E3E5D8]();
      unint64_t v102 = __ckLoggingOverride;
      uint64_t v103 = objc_msgSend( @"CoreData+CloudKit: %s(%d): ",  "stringByAppendingString:",  @"Found %lu corrupt analyzed history rows, purging.");
      if (v102 >= 3) {
        uint64_t v110 = 3LL;
      }
      else {
        uint64_t v110 = v102;
      }
      _NSCoreDataLog( v110,  v103,  v104,  v105,  v106,  v107,  v108,  v109,  (uint64_t)"-[PFCloudKitMetadataModelMigrator commitMigrationMetadataAndCleanup:]_block_invoke");
      objc_autoreleasePoolPop(v101);
      v111 = -[NSBatchDeleteRequest initWithFetchRequest:]( objc_alloc(&OBJC_CLASS___NSBatchDeleteRequest),  "initWithFetchRequest:",  +[NSFetchRequest fetchRequestWithEntityName:]( &OBJC_CLASS___NSFetchRequest,  "fetchRequestWithEntityName:",  +[NSCKHistoryAnalyzerState entityPath](&OBJC_CLASS___NSCKHistoryAnalyzerState, "entityPath")));
      -[NSBatchDeleteRequest setResultType:](v111, "setResultType:", 0LL);
      if (objc_msgSend( (id)objc_msgSend( (id)objc_msgSend( *(id *)(*(void *)(a1 + 32) + 16),  "executeRequest:error:",  v111,  *(void *)(*(void *)(a1 + 48) + 8) + 40),  "result"),  "BOOLValue"))
      {
        uint64_t v112 = +[NSCKMetadataEntry entryForKey:fromStore:inManagedObjectContext:error:]( (uint64_t)&OBJC_CLASS___NSCKMetadataEntry,  (uint64_t)@"NSCloudKitMirroringDelegateLastHistoryTokenKey",  *(void *)(*(void *)(a1 + 32) + 8LL),  *(void **)(*(void *)(a1 + 32) + 16LL),  *(void *)(*(void *)(a1 + 48) + 8LL) + 40LL);
        if (v112)
        {
          [*(id *)(*(void *)(a1 + 32) + 16) deleteObject:v112];
LABEL_132:

          goto LABEL_133;
        }

        if (!*(void *)(*(void *)(*(void *)(a1 + 48) + 8LL) + 40LL)) {
          goto LABEL_132;
        }
      }

      *(_BYTE *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL) = 0;
      id v113 = *(id *)(*(void *)(*(void *)(a1 + 48) + 8LL) + 40LL);
      goto LABEL_132;
    }
  }

uint64_t __69__PFCloudKitMetadataModelMigrator_commitMigrationMetadataAndCleanup___block_invoke_2( void *a1,  void *a2,  void *a3,  _BYTE *a4)
{
  uint64_t v19 = *MEMORY[0x1895F89C0];
  if (!a2)
  {
    *(_BYTE *)(*(void *)(a1[7] + 8LL) + 24LL) = 0;
    uint64_t result = a3;
    uint64_t v13 = a1 + 6;
    goto LABEL_15;
  }

  __int128 v16 = 0u;
  __int128 v17 = 0u;
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  uint64_t v7 = [a2 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v15;
    do
    {
      for (uint64_t i = 0LL; i != v8; ++i)
      {
        if (*(void *)v15 != v9) {
          objc_enumerationMutation(a2);
        }
        uint64_t v11 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        if (![v11 recordZone]) {
          [v11 setRecordZone:a1[4]];
        }
      }

      uint64_t v8 = [a2 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }

    while (v8);
  }

  uint64_t result = [*(id *)(a1[5] + 16) hasChanges];
  if ((_DWORD)result)
  {
    uint64_t v13 = a1 + 6;
    uint64_t result = [*(id *)(a1[5] + 16) save:*(void *)(a1[6] + 8) + 40];
    if ((result & 1) == 0)
    {
      *(_BYTE *)(*(void *)(a1[7] + 8LL) + 24LL) = 0;
      uint64_t result = (uint64_t)*(id *)(*(void *)(a1[6] + 8LL) + 40LL);
LABEL_15:
      *(void *)(*(void *)(*v13 + 8LL) + 40LL) = result;
      *a4 = 1;
    }
  }

  return result;
}

- (uint64_t)checkForOrphanedMirroredRelationshipsInStore:(void *)a3 inManagedObjectContext:(void *)a4 error:
{
  uint64_t v61 = *MEMORY[0x1895F89C0];
  if (!a1) {
    return 0LL;
  }
  id v55 = 0LL;
  id v5 = (id)[a2 persistentStoreCoordinator];
  uint64_t v6 = +[NSFetchRequest fetchRequestWithEntityName:]( &OBJC_CLASS___NSFetchRequest,  "fetchRequestWithEntityName:",  +[NSCKMirroredRelationship entityPath](&OBJC_CLASS___NSCKMirroredRelationship, "entityPath"));
  -[NSFetchRequest setPropertiesToFetch:](v6, "setPropertiesToFetch:", &unk_189F0B4A8);
  -[NSFetchRequest setPropertiesToGroupBy:](v6, "setPropertiesToGroupBy:", &unk_189F0B4C0);
  -[NSFetchRequest setResultType:](v6, "setResultType:", 2LL);
  uint64_t v7 = [a3 executeFetchRequest:v6 error:&v55];
  if (v7)
  {
    uint64_t v8 = (void *)v7;
    uint64_t v9 = (void *)[v5 managedObjectModel];
    __int128 v51 = 0u;
    __int128 v52 = 0u;
    __int128 v53 = 0u;
    __int128 v54 = 0u;
    uint64_t v50 = [v8 countByEnumeratingWithState:&v51 objects:v60 count:16];
    if (v50)
    {
      unint64_t v46 = v9;
      uint64_t v43 = a4;
      id v44 = v5;
      uint64_t v10 = *(void *)v52;
      uint64_t v45 = v8;
      while (2)
      {
        for (uint64_t i = 0LL; i != v50; ++i)
        {
          if (*(void *)v52 != v10) {
            objc_enumerationMutation(v8);
          }
          uint64_t v12 = *(void **)(*((void *)&v51 + 1) + 8 * i);
          uint64_t v13 = (void *)MEMORY[0x186E3E5D8]();
          uint64_t v14 = [v12 objectForKeyedSubscript:@"cdEntityName"];
          uint64_t v15 = [v12 objectForKeyedSubscript:@"relationshipName"];
          if (!objc_msgSend( (id)objc_msgSend( (id)objc_msgSend((id)objc_msgSend(v9, "entitiesByName"), "objectForKeyedSubscript:", v14),  "relationshipsByName"),  "objectForKeyedSubscript:",  v15))
          {
            v49 = v13;
            __int128 v16 = +[NSFetchRequest fetchRequestWithEntityName:]( &OBJC_CLASS___NSFetchRequest,  "fetchRequestWithEntityName:",  +[NSCKMirroredRelationship entityPath](&OBJC_CLASS___NSCKMirroredRelationship, "entityPath"));
            -[NSFetchRequest setPredicate:]( v16,  "setPredicate:",  [MEMORY[0x1896079C8] predicateWithFormat:@"cdEntityName = %@ AND relationshipName = %@", v14, v15]);
            __int128 v17 = -[NSBatchDeleteRequest initWithFetchRequest:]( objc_alloc(&OBJC_CLASS___NSBatchDeleteRequest),  "initWithFetchRequest:",  v16);
            -[NSBatchDeleteRequest setResultType:](v17, "setResultType:", 2LL);
            uint64_t v18 = [a3 executeRequest:v17 error:&v55];
            if (!v18)
            {
              id v32 = v55;

              objc_autoreleasePoolPop(v13);
              a4 = v43;
              id v5 = v44;
              goto LABEL_19;
            }

            uint64_t v19 = (void *)v18;
            context = (void *)MEMORY[0x186E3E5D8]();
            uint64_t v20 = v10;
            else {
              uint64_t v21 = __ckLoggingOverride;
            }
            uint64_t v22 = [@"CoreData+CloudKit: %s(%d): " stringByAppendingString:@"%@ deleted %@ mirrored relationship entries because %@:%@ is no longer in the managed object model of this store: %@"];
            [v19 result];
            uint64_t v23 = v21;
            uint64_t v10 = v20;
            _NSCoreDataLog( v23,  v22,  v24,  v25,  v26,  v27,  v28,  v29,  (uint64_t)"-[PFCloudKitMetadataModelMigrator checkForOrphanedMirroredRelationshipsInStore:inManagedObjectContext:error:]");
            uint64_t v8 = v45;
            uint64_t v9 = v46;
            objc_autoreleasePoolPop(context);

            uint64_t v13 = v49;
          }

          objc_autoreleasePoolPop(v13);
        }

        uint64_t v50 = [v8 countByEnumeratingWithState:&v51 objects:v60 count:16];
        if (v50) {
          continue;
        }
        break;
      }

      uint64_t v30 = 1LL;
      id v5 = v44;
    }

    else
    {
      uint64_t v30 = 1LL;
    }

    goto LABEL_26;
  }

  id v31 = v55;
LABEL_19:
  id v33 = v55;
  if (!v33)
  {
    uint64_t v34 = [NSString stringWithUTF8String:"Illegal attempt to return an error without one in %s:%d"];
    _NSCoreDataLog( 17LL,  v34,  v35,  v36,  v37,  v38,  v39,  v40,  (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Persistence/PFCloudKitMetadataModelMigrator.m");
    v41 = (os_log_s *)__pflogFaultLog;
    if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 136315394;
      uint64_t v57 = "/Library/Caches/com.apple.xbs/Sources/Persistence/PFCloudKitMetadataModelMigrator.m";
      __int16 v58 = 1024;
      int v59 = 1476;
      _os_log_fault_impl( &dword_186681000,  v41,  OS_LOG_TYPE_FAULT,  "CoreData: Illegal attempt to return an error without one in %s:%d",  buf,  0x12u);
    }

    goto LABEL_24;
  }

  if (!a4)
  {
LABEL_24:
    uint64_t v30 = 0LL;
    goto LABEL_26;
  }

  uint64_t v30 = 0LL;
  *a4 = v33;
LABEL_26:

  return v30;
}

- (BOOL)checkForCorruptedRecordMetadataInStore:(void *)a3 inManagedObjectContext:(void *)a4 error:
{
  v60[1] = *MEMORY[0x1895F89C0];
  if (!a1) {
    return 0LL;
  }
  uint64_t v51 = 0LL;
  __int128 v52 = &v51;
  uint64_t v53 = 0x2020000000LL;
  char v54 = 1;
  uint64_t v45 = 0LL;
  unint64_t v46 = &v45;
  uint64_t v47 = 0x3052000000LL;
  v48 = __Block_byref_object_copy__48;
  v49 = __Block_byref_object_dispose__48;
  uint64_t v50 = 0LL;
  uint64_t v7 = objc_msgSend((id)objc_msgSend(a3, "persistentStoreCoordinator"), "managedObjectModel");
  uint64_t v8 = +[NSFetchRequest fetchRequestWithEntityName:]( &OBJC_CLASS___NSFetchRequest,  "fetchRequestWithEntityName:",  +[NSCKRecordMetadata entityPath](&OBJC_CLASS___NSCKRecordMetadata, "entityPath"));
  -[NSFetchRequest setFetchBatchSize:](v8, "setFetchBatchSize:", 500LL);
  -[NSFetchRequest setPropertiesToFetch:](v8, "setPropertiesToFetch:", &unk_189F0B508);
  v60[0] = a2;
  -[NSFetchRequest setAffectedStores:]( v8,  "setAffectedStores:",  [MEMORY[0x189603F18] arrayWithObjects:v60 count:1]);
  uint64_t v41 = 0LL;
  uint64_t v42 = &v41;
  uint64_t v43 = 0x2020000000LL;
  char v44 = 0;
  v40[0] = MEMORY[0x1895F87A8];
  v40[1] = 3221225472LL;
  v40[2] = __103__PFCloudKitMetadataModelMigrator_checkForCorruptedRecordMetadataInStore_inManagedObjectContext_error___block_invoke;
  v40[3] = &unk_189EABBF8;
  v40[4] = a2;
  v40[5] = v7;
  v40[6] = &v41;
  v40[7] = &v51;
  v40[8] = &v45;
  +[_PFRoutines efficientlyEnumerateManagedObjectsInFetchRequest:usingManagedObjectContext:andApplyBlock:]( (uint64_t)&OBJC_CLASS____PFRoutines,  (uint64_t)v8,  a3,  (uint64_t)v40);
  if (!*((_BYTE *)v52 + 24)) {
    goto LABEL_11;
  }
  if (*((_BYTE *)v42 + 24))
  {
    uint64_t v9 = -[NSBatchDeleteRequest initWithFetchRequest:]( objc_alloc(&OBJC_CLASS___NSBatchDeleteRequest),  "initWithFetchRequest:",  +[NSFetchRequest fetchRequestWithEntityName:]( &OBJC_CLASS___NSFetchRequest,  "fetchRequestWithEntityName:",  +[NSCKRecordMetadata entityPath](&OBJC_CLASS___NSCKRecordMetadata, "entityPath")));
    -[NSBatchDeleteRequest setResultType:](v9, "setResultType:", 0LL);
    uint64_t v59 = a2;
    -[NSPersistentStoreRequest setAffectedStores:]( v9,  "setAffectedStores:",  [MEMORY[0x189603F18] arrayWithObjects:&v59 count:1]);
    int v10 = objc_msgSend( (id)objc_msgSend((id)objc_msgSend(a3, "executeRequest:error:", v9, v46 + 5), "result"),  "BOOLValue");
    uint64_t v11 = (void *)MEMORY[0x186E3E5D8]();
    unint64_t v12 = __ckLoggingOverride;
    if (v10)
    {
      uint64_t v13 = [@"CoreData+CloudKit: %s(%d): " stringByAppendingString:@"Successfully purged record metadata during migration due to corrupted metadatas."];
      uint64_t v20 = v12 >= 0x10 ? 16LL : v12;
      _NSCoreDataLog( v20,  v13,  v14,  v15,  v16,  v17,  v18,  v19,  (uint64_t)"-[PFCloudKitMetadataModelMigrator checkForCorruptedRecordMetadataInStore:inManagedObjectContext:error:]");
      objc_autoreleasePoolPop(v11);
      *((_BYTE *)v52 + 24) = 1;
    }

    else
    {
      uint64_t v21 = [@"CoreData+CloudKit: %s(%d): " stringByAppendingString:@"Failed to purged corrupted record metadata during migration: %@"];
      _NSCoreDataLog( v12 != 0,  v21,  v22,  v23,  v24,  v25,  v26,  v27,  (uint64_t)"-[PFCloudKitMetadataModelMigrator checkForCorruptedRecordMetadataInStore:inManagedObjectContext:error:]");
      objc_autoreleasePoolPop(v11);
      *((_BYTE *)v52 + 24) = 0;
      id v28 = (id)v46[5];
    }

    if (!*((_BYTE *)v52 + 24))
    {
LABEL_11:
      id v29 = (id)v46[5];
      if (v29)
      {
        if (a4) {
          *a4 = v29;
        }
      }

      else
      {
        uint64_t v30 = [NSString stringWithUTF8String:"Illegal attempt to return an error without one in %s:%d"];
        _NSCoreDataLog( 17LL,  v30,  v31,  v32,  v33,  v34,  v35,  v36,  (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Persistence/PFCloudKitMetadataModelMigrator.m");
        uint64_t v37 = (os_log_s *)__pflogFaultLog;
        if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
        {
          *(_DWORD *)buf = 136315394;
          v56 = "/Library/Caches/com.apple.xbs/Sources/Persistence/PFCloudKitMetadataModelMigrator.m";
          __int16 v57 = 1024;
          int v58 = 1763;
          _os_log_fault_impl( &dword_186681000,  v37,  OS_LOG_TYPE_FAULT,  "CoreData: Illegal attempt to return an error without one in %s:%d",  buf,  0x12u);
        }
      }
    }
  }

  v46[5] = 0LL;
  BOOL v38 = *((_BYTE *)v52 + 24) != 0;
  _Block_object_dispose(&v41, 8);
  _Block_object_dispose(&v45, 8);
  _Block_object_dispose(&v51, 8);
  return v38;
}

- (BOOL)cleanUpAfterClientMigrationWithStore:(void *)a3 andContext:(void *)a4 error:
{
  uint64_t v58 = *MEMORY[0x1895F89C0];
  if (!a1) {
    return 0LL;
  }
  uint64_t v47 = 0LL;
  v48 = &v47;
  uint64_t v49 = 0x2020000000LL;
  char v50 = 1;
  uint64_t v41 = 0LL;
  uint64_t v42 = &v41;
  uint64_t v43 = 0x3052000000LL;
  char v44 = __Block_byref_object_copy__48;
  uint64_t v45 = __Block_byref_object_dispose__48;
  uint64_t v46 = 0LL;
  id v6 = objc_alloc(MEMORY[0x189603FA8]);
  uint64_t v7 = (void *)[a2 model];
  if (v7) {
    uint64_t v7 = (void *)v7[4];
  }
  uint64_t v8 = (void *)objc_msgSend(v6, "initWithCapacity:", objc_msgSend(v7, "count"));
  id v9 = objc_alloc(MEMORY[0x189603FE0]);
  int v10 = (void *)[a2 model];
  if (v10) {
    int v10 = (void *)v10[4];
  }
  uint64_t v11 = (void *)objc_msgSend(v9, "initWithCapacity:", objc_msgSend(v10, "count"));
  __int128 v39 = 0u;
  __int128 v40 = 0u;
  __int128 v37 = 0u;
  __int128 v38 = 0u;
  uint64_t v12 = [a2 model];
  if (v12) {
    uint64_t v13 = *(void **)(v12 + 32);
  }
  else {
    uint64_t v13 = 0LL;
  }
  uint64_t v14 = [v13 countByEnumeratingWithState:&v37 objects:v57 count:16];
  if (v14)
  {
    uint64_t v15 = *(void *)v38;
    do
    {
      uint64_t v16 = 0LL;
      do
      {
        if (*(void *)v38 != v15) {
          objc_enumerationMutation(v13);
        }
        uint64_t v17 = *(unsigned int **)(*((void *)&v37 + 1) + 8 * v16);
        if (v17) {
          uint64_t v18 = v17[46];
        }
        else {
          uint64_t v18 = 0LL;
        }
        objc_msgSend(v8, "addObject:", objc_msgSend(MEMORY[0x189607968], "numberWithUnsignedInt:", v18));
        objc_msgSend(v11, "addObject:", objc_msgSend(v17, "name"));
        ++v16;
      }

      while (v14 != v16);
      uint64_t v19 = [v13 countByEnumeratingWithState:&v37 objects:v57 count:16];
      uint64_t v14 = v19;
    }

    while (v19);
  }

  uint64_t v20 = -[NSFetchRequest initWithEntityName:]( objc_alloc(&OBJC_CLASS___NSFetchRequest),  "initWithEntityName:",  +[NSCKRecordMetadata entityPath](&OBJC_CLASS___NSCKRecordMetadata, "entityPath"));
  -[NSFetchRequest setPredicate:]( v20,  "setPredicate:",  [MEMORY[0x1896079C8] predicateWithFormat:@"NOT (entityId IN %@)", v8]);
  uint64_t v21 = -[NSBatchDeleteRequest initWithFetchRequest:]( objc_alloc(&OBJC_CLASS___NSBatchDeleteRequest),  "initWithFetchRequest:",  v20);
  -[NSBatchDeleteRequest setResultType:](v21, "setResultType:", 0LL);
  v56 = a2;
  -[NSPersistentStoreRequest setAffectedStores:]( v21,  "setAffectedStores:",  [MEMORY[0x189603F18] arrayWithObjects:&v56 count:1]);
  if (objc_msgSend( (id)objc_msgSend((id)objc_msgSend(a3, "executeRequest:error:", v21, v42 + 5), "result"),  "BOOLValue"))
  {
    uint64_t v22 = -[NSFetchRequest initWithEntityName:]( objc_alloc(&OBJC_CLASS___NSFetchRequest),  "initWithEntityName:",  +[NSCKMirroredRelationship entityPath](&OBJC_CLASS___NSCKMirroredRelationship, "entityPath"));
    -[NSFetchRequest setFetchBatchSize:](v22, "setFetchBatchSize:", 500LL);
    -[NSFetchRequest setPropertiesToFetch:](v22, "setPropertiesToFetch:", &unk_189F0B520);
    id v55 = a2;
    -[NSFetchRequest setAffectedStores:]( v22,  "setAffectedStores:",  [MEMORY[0x189603F18] arrayWithObjects:&v55 count:1]);
    v36[0] = MEMORY[0x1895F87A8];
    v36[1] = 3221225472LL;
    v36[2] = __89__PFCloudKitMetadataModelMigrator_cleanUpAfterClientMigrationWithStore_andContext_error___block_invoke;
    v36[3] = &unk_189EABBA8;
    v36[4] = v11;
    v36[5] = a2;
    v36[6] = a3;
    v36[7] = &v41;
    v36[8] = &v47;
    +[_PFRoutines efficientlyEnumerateManagedObjectsInFetchRequest:usingManagedObjectContext:andApplyBlock:]( (uint64_t)&OBJC_CLASS____PFRoutines,  (uint64_t)v22,  a3,  (uint64_t)v36);
  }

  else
  {
    *((_BYTE *)v48 + 24) = 0;
    id v23 = (id)v42[5];
  }

  if (!*((_BYTE *)v48 + 24))
  {
    id v26 = (id)v42[5];
    if (v26)
    {
      if (a4) {
        *a4 = v26;
      }
    }

    else
    {
      uint64_t v27 = [NSString stringWithUTF8String:"Illegal attempt to return an error without one in %s:%d"];
      _NSCoreDataLog( 17LL,  v27,  v28,  v29,  v30,  v31,  v32,  v33,  (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Persistence/PFCloudKitMetadataModelMigrator.m");
      uint64_t v34 = (os_log_s *)__pflogFaultLog;
      if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 136315394;
        __int128 v52 = "/Library/Caches/com.apple.xbs/Sources/Persistence/PFCloudKitMetadataModelMigrator.m";
        __int16 v53 = 1024;
        int v54 = 1840;
        _os_log_fault_impl( &dword_186681000,  v34,  OS_LOG_TYPE_FAULT,  "CoreData: Illegal attempt to return an error without one in %s:%d",  buf,  0x12u);
      }
    }
  }

  v42[5] = 0LL;
  BOOL v24 = *((_BYTE *)v48 + 24) != 0;
  _Block_object_dispose(&v41, 8);
  _Block_object_dispose(&v47, 8);
  return v24;
}

- (BOOL)checkAndPerformMigrationIfNecessary:(uint64_t *)a1
{
  uint64_t v89 = *MEMORY[0x1895F89C0];
  if (!a1) {
    return 0LL;
  }
  uint64_t v52 = 0LL;
  __int16 v53 = &v52;
  uint64_t v54 = 0x2020000000LL;
  char v55 = 0;
  uint64_t v46 = 0LL;
  uint64_t v47 = &v46;
  uint64_t v48 = 0x3052000000LL;
  uint64_t v49 = __Block_byref_object_copy__48;
  char v50 = __Block_byref_object_dispose__48;
  uint64_t v51 = 0LL;
  uint64_t v4 = MEMORY[0x1895F87A8];
  v45[0] = MEMORY[0x1895F87A8];
  v45[1] = 3221225472LL;
  v45[2] = __71__PFCloudKitMetadataModelMigrator_checkAndPerformMigrationIfNecessary___block_invoke;
  v45[3] = &unk_189EABB58;
  v45[4] = a1;
  v45[5] = &v52;
  v45[6] = &v46;
  id v5 = -[NSSQLBlockRequestContext initWithBlock:context:sqlCore:]( objc_alloc(&OBJC_CLASS___NSSQLBlockRequestContext),  "initWithBlock:context:sqlCore:",  v45,  0LL,  a1[1]);
  -[NSSQLCore dispatchRequest:withRetries:](a1[1], v5, 0LL);

  if (!*((_BYTE *)v53 + 24)) {
    goto LABEL_18;
  }
  id v6 = v47;
  uint64_t v63 = 0LL;
  uint64_t v64 = &v63;
  uint64_t v65 = 0x2020000000LL;
  char v66 = 1;
  uint64_t v57 = 0LL;
  uint64_t v58 = &v57;
  uint64_t v59 = 0x3052000000LL;
  v60 = __Block_byref_object_copy__48;
  uint64_t v61 = __Block_byref_object_dispose__48;
  uint64_t v62 = 0LL;
  uint64_t v7 = (void *)a1[2];
  v56[0] = v4;
  v56[1] = 3221225472LL;
  v56[2] = __69__PFCloudKitMetadataModelMigrator_commitMigrationMetadataAndCleanup___block_invoke;
  v56[3] = &unk_189EA8D40;
  v56[4] = a1;
  v56[5] = &v63;
  v56[6] = &v57;
  [v7 performBlockAndWait:v56];
  if (!*((_BYTE *)v64 + 24)) {
    goto LABEL_12;
  }
  if (a1[4] == 2)
  {
    uint64_t v8 = (void *)a1[1];
    id v9 = v58;
    uint64_t v73 = 0LL;
    uint64_t v74 = &v73;
    uint64_t v75 = 0x2020000000LL;
    char v76 = 1;
    uint64_t v67 = 0LL;
    uint64_t v68 = &v67;
    uint64_t v69 = 0x3052000000LL;
    v70 = __Block_byref_object_copy__48;
    uint64_t v71 = __Block_byref_object_dispose__48;
    uint64_t v72 = 0LL;
    id v10 = (id)[v8 persistentStoreCoordinator];
    uint64_t v11 = -[NSManagedObjectContext initWithConcurrencyType:]( objc_alloc(&OBJC_CLASS___NSManagedObjectContext),  "initWithConcurrencyType:",  1LL);
    -[NSManagedObjectContext setMergePolicy:](v11, "setMergePolicy:", NSMergeByPropertyObjectTrumpMergePolicy);
    -[NSManagedObjectContext setPersistentStoreCoordinator:](v11, "setPersistentStoreCoordinator:", v10);
    -[NSManagedObjectContext _setAllowAncillaryEntities:](v11, "_setAllowAncillaryEntities:", 1LL);
    *(void *)buf = v4;
    *(void *)&buf[8] = 3221225472LL;
    *(void *)&buf[16] = __85__PFCloudKitMetadataModelMigrator_checkForRecordMetadataZoneCorruptionInStore_error___block_invoke;
    id v82 = &unk_189EABB80;
    v83 = a1;
    id v84 = v8;
    uint64_t v87 = &v67;
    uint64_t v88 = &v73;
    v85 = v11;
    id v86 = v10;
    -[NSManagedObjectContext performBlockAndWait:](v11, "performBlockAndWait:", buf);

    if (!*((_BYTE *)v74 + 24))
    {
      id v12 = (id)v68[5];
      if (v12)
      {
        v9[5] = (uint64_t)v12;
      }

      else
      {
        uint64_t v13 = [NSString stringWithUTF8String:"Illegal attempt to return an error without one in %s:%d"];
        _NSCoreDataLog( 17LL,  v13,  v14,  v15,  v16,  v17,  v18,  v19,  (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Persistence/PFCloudKitMetadataModelMigrator.m");
        uint64_t v20 = (os_log_s *)__pflogFaultLog;
        if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
        {
          *(_DWORD *)uint64_t v77 = 136315394;
          v78 = "/Library/Caches/com.apple.xbs/Sources/Persistence/PFCloudKitMetadataModelMigrator.m";
          __int16 v79 = 1024;
          int v80 = 1427;
          _os_log_fault_impl( &dword_186681000,  v20,  OS_LOG_TYPE_FAULT,  "CoreData: Illegal attempt to return an error without one in %s:%d",  v77,  0x12u);
        }
      }
    }

    v68[5] = 0LL;
    int v21 = *((unsigned __int8 *)v74 + 24);
    _Block_object_dispose(&v67, 8);
    _Block_object_dispose(&v73, 8);
    *((_BYTE *)v64 + 24) = v21;
    if (!v21)
    {
      id v22 = (id)v58[5];
      if (!*((_BYTE *)v64 + 24))
      {
LABEL_12:
        id v23 = (id)v58[5];
        if (v23)
        {
          v6[5] = (uint64_t)v23;
        }

        else
        {
          uint64_t v24 = [NSString stringWithUTF8String:"Illegal attempt to return an error without one in %s:%d"];
          _NSCoreDataLog( 17LL,  v24,  v25,  v26,  v27,  v28,  v29,  v30,  (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Persistence/PFCloudKitMetadataModelMigrator.m");
          uint64_t v31 = (os_log_s *)__pflogFaultLog;
          if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
          {
            *(_DWORD *)buf = 136315394;
            *(void *)&uint8_t buf[4] = "/Library/Caches/com.apple.xbs/Sources/Persistence/PFCloudKitMetadataModelMigrator.m";
            *(_WORD *)&buf[12] = 1024;
            *(_DWORD *)&buf[14] = 1146;
            _os_log_fault_impl( &dword_186681000,  v31,  OS_LOG_TYPE_FAULT,  "CoreData: Illegal attempt to return an error without one in %s:%d",  buf,  0x12u);
          }
        }
      }
    }
  }

  v58[5] = 0LL;
  int v32 = *((unsigned __int8 *)v64 + 24);
  _Block_object_dispose(&v57, 8);
  _Block_object_dispose(&v63, 8);
  *((_BYTE *)v53 + 24) = v32;
  if (!v32)
  {
    id v33 = (id)v47[5];
    if (!*((_BYTE *)v53 + 24))
    {
LABEL_18:
      id v34 = (id)v47[5];
      if (v34)
      {
        if (a2) {
          *a2 = v34;
        }
      }

      else
      {
        uint64_t v35 = [NSString stringWithUTF8String:"Illegal attempt to return an error without one in %s:%d"];
        _NSCoreDataLog( 17LL,  v35,  v36,  v37,  v38,  v39,  v40,  v41,  (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Persistence/PFCloudKitMetadataModelMigrator.m");
        uint64_t v42 = (os_log_s *)__pflogFaultLog;
        if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
        {
          *(_DWORD *)buf = 136315394;
          *(void *)&uint8_t buf[4] = "/Library/Caches/com.apple.xbs/Sources/Persistence/PFCloudKitMetadataModelMigrator.m";
          *(_WORD *)&buf[12] = 1024;
          *(_DWORD *)&buf[14] = 1189;
          _os_log_fault_impl( &dword_186681000,  v42,  OS_LOG_TYPE_FAULT,  "CoreData: Illegal attempt to return an error without one in %s:%d",  buf,  0x12u);
        }
      }
    }
  }

  v47[5] = 0LL;
  BOOL v43 = *((_BYTE *)v53 + 24) != 0;
  _Block_object_dispose(&v46, 8);
  _Block_object_dispose(&v52, 8);
  return v43;
}

void __71__PFCloudKitMetadataModelMigrator_checkAndPerformMigrationIfNecessary___block_invoke( void *a1,  uint64_t a2)
{
  uint64_t v453 = *MEMORY[0x1895F89C0];
  *(_BYTE *)(*(void *)(a1[5] + 8LL) + 24LL) = 1;
  uint64_t v2 = (uint64_t *)a1[4];
  if (a2) {
    uint64_t v3 = *(void **)(a2 + 24);
  }
  else {
    uint64_t v3 = 0LL;
  }
  if (!v2) {
    goto LABEL_386;
  }
  uint64_t v4 = *(void *)(a1[6] + 8LL);
  *(void *)&__int128 v425 = 0LL;
  *((void *)&v425 + 1) = &v425;
  *(void *)&__int128 v426 = 0x2020000000LL;
  BYTE8(v426) = 1;
  uint64_t v440 = 0LL;
  v441 = &v440;
  uint64_t v442 = 0x3052000000LL;
  v443 = __Block_byref_object_copy__48;
  v444 = __Block_byref_object_dispose__48;
  uint64_t v445 = 0LL;
  uint64_t PFBundleVersion = (void *)+[_PFRoutines _getPFBundleVersionNumber]();
  id v6 = +[PFCloudKitMetadataModel newMetadataModelForFrameworkVersion:]( (uint64_t)&OBJC_CLASS___PFCloudKitMetadataModel,  PFBundleVersion);
  uint64_t v8 = -[NSSQLModel initWithManagedObjectModel:]( objc_alloc(&OBJC_CLASS___NSSQLModel),  "initWithManagedObjectModel:",  v6);
  id v9 = (void *)v2[3];
  if (v9)
  {
    objc_setProperty_nonatomic(v9, v7, v6, 48LL);
    uint64_t v11 = (void *)v2[3];
    if (v11) {
      objc_setProperty_nonatomic(v11, v10, v8, 56LL);
    }
  }

  v422[0] = 0;
  id v12 = +[PFCloudKitMetadataModel identifyModelForStore:withConnection:hasOldMetadataTables:]( (uint64_t)&OBJC_CLASS___PFCloudKitMetadataModel,  v2[1],  v3,  v422);
  uint64_t v14 = -[NSSQLModel initWithManagedObjectModel:]( objc_alloc(&OBJC_CLASS___NSSQLModel),  "initWithManagedObjectModel:",  v12);
  uint64_t v15 = (void *)v2[3];
  if (v15)
  {
    objc_setProperty_nonatomic(v15, v13, v12, 64LL);
    uint64_t v17 = (void *)v2[3];
    if (v17)
    {
      objc_setProperty_nonatomic(v17, v16, v14, 72LL);
      uint64_t v18 = v2[3];
      if (v18) {
        *(_BYTE *)(v18 + 34) = v422[0];
      }
    }
  }

  if (objc_msgSend( (id)objc_msgSend((id)v2[1], "metadata"),  "objectForKey:",  @"PFCloudKitMetadataNeedsZoneFetchAfterClientMigrationKey"))
  {
    uint64_t v19 = v2[3];
    if (v19) {
      *(_BYTE *)(v19 + 36) = 1;
    }
  }

  uint64_t v20 = (objc_class *)objc_opt_class();
  uint64_t v21 = objc_msgSend(-[NSSQLModel entityNamed:](v8, "entityNamed:", NSStringFromClass(v20)), "tableName");
  if (v3 && (-[NSSQLiteConnection _hasTableWithName:isTemp:]((uint64_t)v3, v21, 0) & 1) != 0)
  {
    *(void *)v423 = 0LL;
    *(void *)&v423[8] = v423;
    *(void *)&v423[16] = 0x2020000000LL;
    char v424 = 0;
    if (v8) {
      entitiesByName = v8->_entitiesByName;
    }
    else {
      entitiesByName = 0LL;
    }
    uint64_t v23 = MEMORY[0x1895F87A8];
    *(void *)&__int128 v429 = MEMORY[0x1895F87A8];
    *((void *)&v429 + 1) = 3221225472LL;
    *(void *)&__int128 v430 = __70__PFCloudKitMetadataModelMigrator_prepareContextWithConnection_error___block_invoke;
    *((void *)&v430 + 1) = &unk_189EABB08;
    *(void *)&__int128 v431 = v14;
    *((void *)&v431 + 1) = v423;
    uint64_t v24 = -[NSKnownKeysDictionary enumerateKeysAndObjectsUsingBlock:]( entitiesByName,  "enumerateKeysAndObjectsUsingBlock:",  &v429);
    if (*(_BYTE *)(*(void *)&v423[8] + 24LL))
    {
      uint64_t v25 = (void *)MEMORY[0x186E3E5D8](v24);
      unint64_t v26 = __ckLoggingOverride;
      uint64_t v27 = objc_msgSend( @"CoreData+CloudKit: %s(%d): ",  "stringByAppendingString:",  @"Migration discovered mutated entity IDs, precomputing z_ent changes.");
      uint64_t v34 = v26 >= 0x10 ? 16LL : v26;
      _NSCoreDataLog( v34,  v27,  v28,  v29,  v30,  v31,  v32,  v33,  (uint64_t)"-[PFCloudKitMetadataModelMigrator prepareContextWithConnection:error:]");
      objc_autoreleasePoolPop(v25);
      BOOL v35 = -[PFCloudKitMetadataModelMigrator computeAncillaryEntityPrimaryKeyTableEntriesForStore:error:]( (uint64_t)v2,  v2[1],  v441 + 5);
      *(_BYTE *)(*((void *)&v425 + 1) + 24LL) = v35;
      if (!v35) {
        id v36 = (id)v441[5];
      }
    }

    uint64_t v37 = (void *)v2[2];
    *(void *)v446 = v23;
    *(void *)&v446[8] = 3221225472LL;
    *(void *)&v446[16] = __70__PFCloudKitMetadataModelMigrator_prepareContextWithConnection_error___block_invoke_2;
    v447 = &unk_189EA8D40;
    v448 = v2;
    v449 = (id *)&v425;
    v450 = &v440;
    [v37 performBlockAndWait:v446];
    _Block_object_dispose(v423, 8);
  }

  else
  {
    uint64_t v38 = v2[3];
    if (v38)
    {
      *(_BYTE *)(v38 + 33) = 1;
      uint64_t v39 = v2[3];
      if (v39) {
        *(_BYTE *)(v39 + 37) = 1;
      }
    }
  }

  if (!*(_BYTE *)(*((void *)&v425 + 1) + 24LL))
  {
    id v40 = (id)v441[5];
    if (v40)
    {
      *(void *)(v4 + 40) = v40;
    }

    else
    {
      uint64_t v41 = [NSString stringWithUTF8String:"Illegal attempt to return an error without one in %s:%d"];
      _NSCoreDataLog( 17LL,  v41,  v42,  v43,  v44,  v45,  v46,  v47,  (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Persistence/PFCloudKitMetadataModelMigrator.m");
      uint64_t v48 = (os_log_s *)__pflogFaultLog;
      if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)v423 = 136315394;
        *(void *)&v423[4] = "/Library/Caches/com.apple.xbs/Sources/Persistence/PFCloudKitMetadataModelMigrator.m";
        *(_WORD *)&v423[12] = 1024;
        *(_DWORD *)&v423[14] = 184;
        _os_log_fault_impl( &dword_186681000,  v48,  OS_LOG_TYPE_FAULT,  "CoreData: Illegal attempt to return an error without one in %s:%d",  v423,  0x12u);
      }
    }
  }

  v441[5] = 0LL;
  int v49 = *(unsigned __int8 *)(*((void *)&v425 + 1) + 24LL);
  _Block_object_dispose(&v440, 8);
  _Block_object_dispose(&v425, 8);
  if (!v49) {
    goto LABEL_386;
  }
  uint64_t v50 = a1[4];
  if (a2)
  {
    uint64_t v51 = *(void **)(a2 + 24);
    if (!v50) {
      goto LABEL_386;
    }
  }

  else
  {
    uint64_t v51 = 0LL;
    if (!v50) {
      goto LABEL_386;
    }
  }

  uint64_t v339 = *(void *)(a1[6] + 8LL);
  uint64_t v407 = 0LL;
  v408 = &v407;
  uint64_t v409 = 0x2020000000LL;
  char v410 = 1;
  uint64_t v401 = 0LL;
  v402 = &v401;
  uint64_t v403 = 0x3052000000LL;
  v404 = __Block_byref_object_copy__48;
  v405 = __Block_byref_object_dispose__48;
  uint64_t v406 = 0LL;
  uint64_t v52 = *(void *)(v50 + 24);
  v347 = v51;
  if (!v52)
  {
    __int128 v399 = 0u;
    __int128 v400 = 0u;
    __int128 v397 = 0u;
    __int128 v398 = 0u;
    goto LABEL_50;
  }

  if (!*(_BYTE *)(v52 + 34))
  {
    __int128 v399 = 0u;
    __int128 v400 = 0u;
    __int128 v397 = 0u;
    __int128 v398 = 0u;
LABEL_48:
    uint64_t v58 = *(void *)(v52 + 56);
    if (v58) {
      uint64_t v52 = *(void *)(v58 + 32);
    }
    else {
      uint64_t v52 = 0LL;
    }
    goto LABEL_50;
  }

  __int16 v53 = (NSSQLiteStatement *)[v51 adapter];
  __int128 v411 = 0u;
  __int128 v412 = 0u;
  __int128 v413 = 0u;
  __int128 v414 = 0u;
  uint64_t v54 = [&unk_189F0B4D8 countByEnumeratingWithState:&v411 objects:v446 count:16];
  if (v54)
  {
    uint64_t v55 = *(void *)v412;
    do
    {
      for (uint64_t i = 0LL; i != v54; ++i)
      {
        if (*(void *)v412 != v55) {
          objc_enumerationMutation(&unk_189F0B4D8);
        }
        uint64_t v57 = -[NSSQLiteAdapter newDropTableStatementForTableNamed:](v53, *(void *)(*((void *)&v411 + 1) + 8 * i));
        [*(id *)(v52 + 8) addObject:v57];
        *(_BYTE *)(v52 + 32) = 1;
      }

      uint64_t v54 = [&unk_189F0B4D8 countByEnumeratingWithState:&v411 objects:v446 count:16];
    }

    while (v54);
  }

  uint64_t v52 = *(void *)(v50 + 24);
  __int128 v399 = 0u;
  __int128 v400 = 0u;
  __int128 v397 = 0u;
  __int128 v398 = 0u;
  uint64_t v51 = v347;
  if (v52) {
    goto LABEL_48;
  }
LABEL_50:
  uint64_t v59 = [(id)v52 countByEnumeratingWithState:&v397 objects:&v440 count:16];
  if (v59)
  {
    uint64_t v348 = *(void *)v398;
    uint64_t v344 = v52;
    do
    {
      uint64_t v349 = 0LL;
      uint64_t v345 = v59;
      do
      {
        if (*(void *)v398 != v348) {
          objc_enumerationMutation((id)v52);
        }
        if (!*((_BYTE *)v408 + 24)) {
          goto LABEL_354;
        }
        v60 = *(id **)(*((void *)&v397 + 1) + 8 * v349);
        uint64_t v61 = [v60 tableName];
        if (!v51 || (-[NSSQLiteConnection _hasTableWithName:isTemp:]((uint64_t)v51, v61, 0) & 1) == 0)
        {
          uint64_t v67 = *(void *)(v50 + 24);
          if (!v67) {
            goto LABEL_161;
          }
LABEL_159:
          [*(id *)(v67 + 16) addObject:v60];
          __int128 v155 = (_BYTE *)(v67 + 32);
LABEL_160:
          *__int128 v155 = 1;
          goto LABEL_161;
        }

        if (!-[NSSQLiteConnection _tableHasRows:]((BOOL)v51, [v60 tableName]))
        {
          uint64_t v68 = -[NSSQLiteAdapter newDropTableStatementForTableNamed:]( (NSSQLiteStatement *)[v51 adapter],  objc_msgSend(v60, "tableName"));
          uint64_t v69 = *(void *)(v50 + 24);
          if (v69)
          {
            [*(id *)(v69 + 8) addObject:v68];
            *(_BYTE *)(v69 + 32) = 1;
          }

          uint64_t v67 = *(void *)(v50 + 24);
          if (v67) {
            goto LABEL_159;
          }
          goto LABEL_161;
        }

        id v62 = -[NSSQLiteConnection fetchTableCreationSQLContaining:](v51, (void *)[v60 tableName]);
        __int128 v414 = 0u;
        __int128 v413 = 0u;
        __int128 v412 = 0u;
        __int128 v411 = 0u;
        uint64_t v63 = [v62 countByEnumeratingWithState:&v411 objects:v446 count:16];
        if (v63)
        {
          uint64_t v64 = *(void *)v412;
LABEL_61:
          uint64_t v65 = 0LL;
          while (1)
          {
            if (*(void *)v412 != v64) {
              objc_enumerationMutation(v62);
            }
            char v66 = *(void **)(*((void *)&v411 + 1) + 8 * v65);
            if (objc_msgSend( (id)objc_msgSend(v66, "objectAtIndex:", 0),  "isEqualToString:",  objc_msgSend(v60, "tableName"))) {
              break;
            }
            if (v63 == ++v65)
            {
              uint64_t v63 = [v62 countByEnumeratingWithState:&v411 objects:v446 count:16];
              if (v63) {
                goto LABEL_61;
              }
              goto LABEL_75;
            }
          }

          id v351 = (id)[v66 objectAtIndex:1];
          if (v351) {
            goto LABEL_78;
          }
        }

void __94__PFCloudKitMetadataModelMigrator_computeAncillaryEntityPrimaryKeyTableEntriesForStore_error___block_invoke( uint64_t a1,  uint64_t a2)
{
  uint64_t v39 = *MEMORY[0x1895F89C0];
  if (a2) {
    uint64_t v3 = *(void **)(a2 + 24);
  }
  else {
    uint64_t v3 = 0LL;
  }
  id v4 = objc_alloc_init(MEMORY[0x189603FA8]);
  id v5 = (NSSQLiteStatement *)[v3 adapter];
  uint64_t v26 = a1;
  uint64_t v6 = objc_msgSend( (id)objc_msgSend(*(id *)(a1 + 32), "ancillarySQLModels"),  "objectForKey:",  @"NSPersistentStoreMirroringDelegateOptionKey");
  __int128 v35 = 0u;
  __int128 v36 = 0u;
  __int128 v33 = 0u;
  __int128 v34 = 0u;
  if (v6) {
    uint64_t v7 = *(void **)(v6 + 32);
  }
  else {
    uint64_t v7 = 0LL;
  }
  uint64_t v8 = [v7 countByEnumeratingWithState:&v33 objects:v38 count:16];
  if (v8)
  {
    uint64_t v28 = *(void *)v34;
    obuint64_t j = v7;
    do
    {
      uint64_t v9 = 0LL;
      do
      {
        if (*(void *)v34 != v28) {
          objc_enumerationMutation(obj);
        }
        id v10 = *(unsigned int **)(*((void *)&v33 + 1) + 8 * v9);
        uint64_t v11 = objc_alloc(&OBJC_CLASS___NSSQLiteStatement);
        if (v10) {
          uint64_t v12 = v10[46];
        }
        else {
          uint64_t v12 = 0LL;
        }
        uint64_t v13 = -[NSSQLiteStatement initWithEntity:sqlString:]( v11,  "initWithEntity:sqlString:",  0,  [NSString stringWithFormat:@"DELETE FROM %@ WHERE Z_ENT = %@", @"Z_PRIMARYKEY", objc_msgSend(MEMORY[0x189607968], "numberWithUnsignedInt:", v12)]);
        [v4 addObject:v13];

        uint64_t v14 = -[NSSQLiteAdapter newPrimaryKeyInitializeStatementForEntity:withInitialMaxPK:](v5, (uint64_t)v10, 0LL);
        [v4 addObject:v14];

        uint64_t v15 = [v10 tableName];
        if (v3 && -[NSSQLiteConnection _hasTableWithName:isTemp:]((uint64_t)v3, v15, 0))
        {
          uint64_t v16 = -[NSSQLiteAdapter newSimplePrimaryKeyUpdateStatementForEntity:](v5, v10);
          [v4 addObject:v16];

          uint64_t v17 = objc_alloc(&OBJC_CLASS___NSSQLiteStatement);
          uint64_t v18 = (void *)NSString;
          uint64_t v19 = [v10 tableName];
          if (v10) {
            uint64_t v20 = v10[46];
          }
          else {
            uint64_t v20 = 0LL;
          }
          uint64_t v21 = -[NSSQLiteStatement initWithEntity:sqlString:]( v17,  "initWithEntity:sqlString:",  0,  [v18 stringWithFormat:@"UPDATE %@ SET Z_ENT = %@", v19, objc_msgSend(MEMORY[0x189607968], "numberWithUnsignedInt:", v20)]);
          [v4 addObject:v21];
        }

        ++v9;
      }

      while (v8 != v9);
      uint64_t v22 = [obj countByEnumeratingWithState:&v33 objects:v38 count:16];
      uint64_t v8 = v22;
    }

    while (v22);
  }

  -[NSSQLiteConnection connect]((uint64_t)v3);
  -[NSSQLiteConnection beginTransaction]((uint64_t)v3);
  __int128 v31 = 0u;
  __int128 v32 = 0u;
  __int128 v29 = 0u;
  __int128 v30 = 0u;
  uint64_t v23 = [v4 countByEnumeratingWithState:&v29 objects:v37 count:16];
  if (v23)
  {
    uint64_t v24 = *(void *)v30;
    do
    {
      for (uint64_t i = 0LL; i != v23; ++i)
      {
        if (*(void *)v30 != v24) {
          objc_enumerationMutation(v4);
        }
        -[NSSQLiteConnection prepareAndExecuteSQLStatement:]((uint64_t)v3, *(void **)(*((void *)&v29 + 1) + 8 * i));
      }

      uint64_t v23 = [v4 countByEnumeratingWithState:&v29 objects:v37 count:16];
    }

    while (v23);
  }

  -[NSSQLiteConnection commitTransaction]((uint64_t)v3);
  *(_BYTE *)(*(void *)(*(void *)(v26 + 40) + 8LL) + 24LL) = 1;
  -[NSSQLiteConnection endFetchAndRecycleStatement:]((uint64_t)v3, 0);
}

void __85__PFCloudKitMetadataModelMigrator_checkForRecordMetadataZoneCorruptionInStore_error___block_invoke( uint64_t a1)
{
  v34[1] = *MEMORY[0x1895F89C0];
  id v2 = objc_alloc(getCloudKitCKRecordZoneIDClass());
  uint64_t v3 = (void *)[v2 initWithZoneName:@"com.apple.coredata.cloudkit.zone" ownerName:getCloudKitCKCurrentUserDefaultName()];
  id v4 = +[NSCKRecordZoneMetadata zoneMetadataForZoneID:inDatabaseWithScope:forStore:inContext:error:]( (uint64_t)&OBJC_CLASS___NSCKRecordZoneMetadata,  v3,  *(void *)(*(void *)(a1 + 32) + 32LL),  *(void *)(a1 + 40),  *(void **)(a1 + 48),  *(void *)(*(void *)(a1 + 64) + 8LL) + 40LL);
  if (v4)
  {
    id v5 = v4;
    if (-[NSManagedObject isInserted](v4, "isInserted"))
    {
      *(_BYTE *)(*(void *)(*(void *)(a1 + 72) + 8) + 24) = [*(id *)(a1 + 48) save:*(void *)(*(void *)(a1 + 64) + 8) + 40];
      if (!*(_BYTE *)(*(void *)(*(void *)(a1 + 72) + 8LL) + 24LL)) {
        id v6 = *(id *)(*(void *)(*(void *)(a1 + 64) + 8LL) + 40LL);
      }
    }

    if (*(_BYTE *)(*(void *)(*(void *)(a1 + 72) + 8LL) + 24LL))
    {
      uint64_t v7 = -[NSManagedObject objectID](v5, "objectID");
      uint64_t v8 = +[NSFetchRequest fetchRequestWithEntityName:]( &OBJC_CLASS___NSFetchRequest,  "fetchRequestWithEntityName:",  +[NSCKRecordMetadata entityPath](&OBJC_CLASS___NSCKRecordMetadata, "entityPath"));
      -[NSFetchRequest setRelationshipKeyPathsForPrefetching:]( v8,  "setRelationshipKeyPathsForPrefetching:",  &unk_189F0B490);
      v34[0] = *(void *)(a1 + 40);
      -[NSFetchRequest setAffectedStores:]( v8,  "setAffectedStores:",  [MEMORY[0x189603F18] arrayWithObjects:v34 count:1]);
      -[NSFetchRequest setFetchBatchSize:](v8, "setFetchBatchSize:", 200LL);
      uint64_t v9 = *(void **)(a1 + 48);
      v22[0] = MEMORY[0x1895F87A8];
      v22[1] = 3221225472LL;
      v22[2] = __85__PFCloudKitMetadataModelMigrator_checkForRecordMetadataZoneCorruptionInStore_error___block_invoke_2;
      v22[3] = &unk_189EAB898;
      v22[4] = v9;
      v22[5] = v7;
      __int128 v23 = *(_OWORD *)(a1 + 64);
      +[_PFRoutines efficientlyEnumerateManagedObjectsInFetchRequest:usingManagedObjectContext:andApplyBlock:]( (uint64_t)&OBJC_CLASS____PFRoutines,  (uint64_t)v8,  v9,  (uint64_t)v22);
    }
  }

  else
  {
    *(_BYTE *)(*(void *)(*(void *)(a1 + 72) + 8LL) + 24LL) = 0;
    id v10 = *(id *)(*(void *)(*(void *)(a1 + 64) + 8LL) + 40LL);
  }

  uint64_t v11 = *(void *)(*(void *)(a1 + 32) + 24LL);
  if (v11 && *(_BYTE *)(v11 + 37))
  {
    uint64_t v12 = *(void **)(a1 + 56);
    uint64_t v33 = *(void *)(a1 + 40);
    uint64_t v13 = (void *)objc_msgSend( v12,  "currentPersistentHistoryTokenFromStores:",  objc_msgSend(MEMORY[0x189603F18], "arrayWithObjects:count:", &v33, 1));
    uint64_t v14 = v13
        ? (void *)objc_msgSend( (id)objc_msgSend(v13, "storeTokens"),  "objectForKey:",  objc_msgSend(*(id *)(a1 + 40), "identifier"))
        : &unk_189F04650;
    if (*(_BYTE *)(*(void *)(*(void *)(a1 + 72) + 8LL) + 24LL))
    {
      uint64_t v15 = -[NSBatchUpdateRequest initWithEntityName:]( objc_alloc(&OBJC_CLASS___NSBatchUpdateRequest),  "initWithEntityName:",  +[NSCKRecordMetadata entityPath](&OBJC_CLASS___NSCKRecordMetadata, "entityPath"));
      -[NSBatchUpdateRequest setPredicate:]( v15,  "setPredicate:",  [MEMORY[0x1896079C8] predicateWithFormat:@"ckRecordSystemFields == NULL"]);
      v31[0] = @"needsUpload";
      v32[0] = [MEMORY[0x189607878] expressionForConstantValue:MEMORY[0x189604A88]];
      v31[1] = @"pendingExportTransactionNumber";
      v32[1] = [MEMORY[0x189607878] expressionForConstantValue:v14];
      -[NSBatchUpdateRequest setPropertiesToUpdate:]( v15,  "setPropertiesToUpdate:",  [MEMORY[0x189603F68] dictionaryWithObjects:v32 forKeys:v31 count:2]);
      uint64_t v30 = *(void *)(a1 + 40);
      -[NSPersistentStoreRequest setAffectedStores:]( v15,  "setAffectedStores:",  [MEMORY[0x189603F18] arrayWithObjects:&v30 count:1]);
      -[NSBatchUpdateRequest setResultType:](v15, "setResultType:", 0LL);
      if ((objc_msgSend( (id)objc_msgSend( (id)objc_msgSend( *(id *)(a1 + 48),  "executeRequest:error:",  v15,  *(void *)(*(void *)(a1 + 64) + 8) + 40),  "result"),  "BOOLValue") & 1) == 0)
      {
        *(_BYTE *)(*(void *)(*(void *)(a1 + 72) + 8LL) + 24LL) = 0;
        id v16 = *(id *)(*(void *)(*(void *)(a1 + 64) + 8LL) + 40LL);
      }

      if (*(_BYTE *)(*(void *)(*(void *)(a1 + 72) + 8LL) + 24LL))
      {
        uint64_t v17 = -[NSBatchUpdateRequest initWithEntityName:]( objc_alloc(&OBJC_CLASS___NSBatchUpdateRequest),  "initWithEntityName:",  +[NSCKRecordMetadata entityPath](&OBJC_CLASS___NSCKRecordMetadata, "entityPath"));
        -[NSBatchUpdateRequest setPredicate:]( v17,  "setPredicate:",  [MEMORY[0x1896079C8] predicateWithFormat:@"ckRecordSystemFields != NULL"]);
        uint64_t v28 = @"lastExportedTransactionNumber";
        uint64_t v29 = [MEMORY[0x189607878] expressionForConstantValue:v14];
        -[NSBatchUpdateRequest setPropertiesToUpdate:]( v17,  "setPropertiesToUpdate:",  [MEMORY[0x189603F68] dictionaryWithObjects:&v29 forKeys:&v28 count:1]);
        -[NSBatchUpdateRequest setResultType:](v17, "setResultType:", 0LL);
        uint64_t v27 = *(void *)(a1 + 40);
        -[NSPersistentStoreRequest setAffectedStores:]( v17,  "setAffectedStores:",  [MEMORY[0x189603F18] arrayWithObjects:&v27 count:1]);
        if ((objc_msgSend( (id)objc_msgSend( (id)objc_msgSend( *(id *)(a1 + 48),  "executeRequest:error:",  v17,  *(void *)(*(void *)(a1 + 64) + 8) + 40),  "result"),  "BOOLValue") & 1) == 0)
        {
          *(_BYTE *)(*(void *)(*(void *)(a1 + 72) + 8LL) + 24LL) = 0;
          id v18 = *(id *)(*(void *)(*(void *)(a1 + 64) + 8LL) + 40LL);
        }
      }
    }
  }

  uint64_t v19 = *(void *)(*(void *)(a1 + 32) + 24LL);
  if (v19 && *(_BYTE *)(v19 + 39) && *(_BYTE *)(*(void *)(*(void *)(a1 + 72) + 8LL) + 24LL))
  {
    uint64_t v20 = -[NSBatchUpdateRequest initWithEntityName:]( objc_alloc(&OBJC_CLASS___NSBatchUpdateRequest),  "initWithEntityName:",  +[NSCKRecordZoneMetadata entityPath](&OBJC_CLASS___NSCKRecordZoneMetadata, "entityPath"));
    -[NSBatchUpdateRequest setPredicate:]( v20,  "setPredicate:",  [MEMORY[0x1896079C8] predicateWithFormat:@"needsNewShareInvitation == NULL"]);
    uint64_t v25 = @"needsNewShareInvitation";
    uint64_t v26 = [MEMORY[0x189607878] expressionForConstantValue:MEMORY[0x189604A80]];
    -[NSBatchUpdateRequest setPropertiesToUpdate:]( v20,  "setPropertiesToUpdate:",  [MEMORY[0x189603F68] dictionaryWithObjects:&v26 forKeys:&v25 count:1]);
    -[NSBatchUpdateRequest setResultType:](v20, "setResultType:", 0LL);
    uint64_t v24 = *(void *)(a1 + 40);
    -[NSPersistentStoreRequest setAffectedStores:]( v20,  "setAffectedStores:",  [MEMORY[0x189603F18] arrayWithObjects:&v24 count:1]);
    if ((objc_msgSend( (id)objc_msgSend( (id)objc_msgSend( *(id *)(a1 + 48),  "executeRequest:error:",  v20,  *(void *)(*(void *)(a1 + 64) + 8) + 40),  "result"),  "BOOLValue") & 1) == 0)
    {
      *(_BYTE *)(*(void *)(*(void *)(a1 + 72) + 8LL) + 24LL) = 0;
      id v21 = *(id *)(*(void *)(*(void *)(a1 + 64) + 8LL) + 40LL);
    }
  }
}

uint64_t __85__PFCloudKitMetadataModelMigrator_checkForRecordMetadataZoneCorruptionInStore_error___block_invoke_2( uint64_t a1,  void *a2,  void *a3,  _BYTE *a4)
{
  uint64_t v5 = a1;
  uint64_t v44 = *MEMORY[0x1895F89C0];
  if (!a2)
  {
    *(_BYTE *)(*(void *)(*(void *)(a1 + 56) + 8LL) + 24LL) = 0;
    uint64_t result = a3;
    *(void *)(*(void *)(*(void *)(v5 + 48) + 8LL) + 40LL) = result;
LABEL_23:
    *a4 = 1;
    return result;
  }

  uint64_t v7 = [*(id *)(a1 + 32) existingObjectWithID:*(void *)(a1 + 40) error:*(void *)(*(void *)(a1 + 48) + 8) + 40];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v35 = v5;
    __int128 v36 = a4;
    __int128 v39 = 0u;
    __int128 v40 = 0u;
    __int128 v37 = 0u;
    __int128 v38 = 0u;
    uint64_t v9 = [a2 countByEnumeratingWithState:&v37 objects:v43 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v38;
      do
      {
        for (uint64_t i = 0LL; i != v10; ++i)
        {
          if (*(void *)v38 != v11) {
            objc_enumerationMutation(a2);
          }
          uint64_t v13 = *(void **)(*((void *)&v37 + 1) + 8 * i);
          uint64_t v14 = (void *)MEMORY[0x186E3E5D8]();
          uint64_t v15 = (void *)[v13 recordZone];
          if (![v15 ckRecordZoneName] || objc_msgSend(v15, "isDeleted"))
          {
            id v16 = (void *)MEMORY[0x186E3E5D8]();
            else {
              uint64_t v17 = __ckLoggingOverride;
            }
            uint64_t v18 = [@"CoreData+CloudKit: %s(%d): " stringByAppendingString:@"Found corrupt zone on record metadata: %@"];
            [v13 objectID];
            _NSCoreDataLog( v17,  v18,  v19,  v20,  v21,  v22,  v23,  v24,  (uint64_t)"-[PFCloudKitMetadataModelMigrator checkForRecordMetadataZoneCorruptionInStore:error:]_block_invoke_2");
            objc_autoreleasePoolPop(v16);
            [v13 setRecordZone:v8];
          }

          objc_autoreleasePoolPop(v14);
        }

        uint64_t v10 = [a2 countByEnumeratingWithState:&v37 objects:v43 count:16];
      }

      while (v10);
    }

    uint64_t v5 = v35;
    uint64_t result = [*(id *)(v35 + 32) save:*(void *)(*(void *)(v35 + 48) + 8) + 40];
    a4 = v36;
    if ((result & 1) == 0)
    {
      *(_BYTE *)(*(void *)(*(void *)(v35 + 56) + 8LL) + 24LL) = 0;
      uint64_t result = (uint64_t)*(id *)(*(void *)(*(void *)(v35 + 48) + 8LL) + 40LL);
    }
  }

  else
  {
    uint64_t v26 = [NSString stringWithUTF8String:"Failed to refresh zone for assignment during corrupt zone cleanup: %@"];
    _NSCoreDataLog(17LL, v26, v27, v28, v29, v30, v31, v32, *(void *)(*(void *)(*(void *)(v5 + 48) + 8LL) + 40LL));
    uint64_t v33 = (os_log_s *)__pflogFaultLog;
    if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
    {
      uint64_t v34 = *(void *)(*(void *)(*(void *)(v5 + 48) + 8LL) + 40LL);
      *(_DWORD *)__int128 buf = 138412290;
      uint64_t v42 = v34;
      _os_log_fault_impl( &dword_186681000,  v33,  OS_LOG_TYPE_FAULT,  "CoreData: Failed to refresh zone for assignment during corrupt zone cleanup: %@",  buf,  0xCu);
    }

    uint64_t result = (uint64_t)*(id *)(*(void *)(*(void *)(v5 + 48) + 8LL) + 40LL);
    *(_BYTE *)(*(void *)(*(void *)(v5 + 56) + 8LL) + 24LL) = 0;
  }

  if (!*(_BYTE *)(*(void *)(*(void *)(v5 + 56) + 8LL) + 24LL)) {
    goto LABEL_23;
  }
  return result;
}

void __107__PFCloudKitMetadataModelMigrator_migrateMetadataForObjectsInStore_toNSCKRecordMetadataUsingContext_error___block_invoke( void *a1,  void *a2,  void *a3,  _BYTE *a4)
{
  uint64_t v5 = a1;
  uint64_t v50 = *MEMORY[0x1895F89C0];
  if (!a2)
  {
    *(_BYTE *)(*(void *)(a1[8] + 8LL) + 24LL) = 0;
    *(void *)(*(void *)(a1[7] + 8LL) + 40LL) = a3;
LABEL_28:
    *a4 = 1;
    return;
  }

  uint64_t v6 = a1[4];
  if (!v6)
  {
LABEL_27:
    *(_BYTE *)(*(void *)(v5[8] + 8LL) + 24LL) = 0;
    id v34 = *(id *)(*(void *)(v5[7] + 8LL) + 40LL);
    goto LABEL_28;
  }

  uint64_t v8 = (void *)a1[5];
  uint64_t v9 = (void *)a1[6];
  uint64_t v10 = *(void *)(a1[7] + 8LL);
  uint64_t v44 = 0LL;
  id v11 = +[PFCloudKitSerializer defaultRecordZoneIDForDatabaseScope:]( &OBJC_CLASS___PFCloudKitSerializer,  "defaultRecordZoneIDForDatabaseScope:",  *(void *)(v6 + 32));
  uint64_t v12 = (void *)[objc_alloc(getCloudKitCKRecordZoneClass()) initWithZoneID:v11];
  id v13 = +[NSCKRecordMetadata createMapOfMetadataMatchingObjectIDs:inStore:inManagedObjectContext:error:]( (uint64_t)NSCKRecordMetadata,  (void *)[a2 valueForKey:@"objectID"],  v8,  v9,  &v44);
  uint64_t v14 = [v8 mirroringDelegate];
  if (!v13)
  {

LABEL_22:
    if (v44)
    {
      *(void *)(v10 + 40) = v44;
    }

    else
    {
      uint64_t v26 = [NSString stringWithUTF8String:"Illegal attempt to return an error without one in %s:%d"];
      _NSCoreDataLog( 17LL,  v26,  v27,  v28,  v29,  v30,  v31,  v32,  (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Persistence/PFCloudKitMetadataModelMigrator.m");
      uint64_t v33 = (os_log_s *)__pflogFaultLog;
      if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)__int128 buf = 136315394;
        uint64_t v46 = "/Library/Caches/com.apple.xbs/Sources/Persistence/PFCloudKitMetadataModelMigrator.m";
        __int16 v47 = 1024;
        int v48 = 1580;
        _os_log_fault_impl( &dword_186681000,  v33,  OS_LOG_TYPE_FAULT,  "CoreData: Illegal attempt to return an error without one in %s:%d",  buf,  0x12u);
      }
    }

    goto LABEL_27;
  }

  uint64_t v15 = v14;
  __int128 v39 = v11;
  __int128 v37 = a4;
  __int128 v38 = v9;
  uint64_t v35 = v10;
  __int128 v36 = v5;
  __int128 v42 = 0u;
  __int128 v43 = 0u;
  __int128 v40 = 0u;
  __int128 v41 = 0u;
  uint64_t v16 = [a2 countByEnumeratingWithState:&v40 objects:v49 count:16];
  if (v16)
  {
    uint64_t v17 = v16;
    uint64_t v18 = *(void *)v41;
    do
    {
      uint64_t v19 = 0LL;
      do
      {
        if (*(void *)v41 != v18) {
          objc_enumerationMutation(a2);
        }
        uint64_t v20 = *(void **)(*((void *)&v40 + 1) + 8 * v19);
        if (!objc_msgSend(v13, "objectForKey:", objc_msgSend(v20, "objectID")))
        {
          if (v15) {
            uint64_t v21 = *(void **)(v15 + 8);
          }
          else {
            uint64_t v21 = 0LL;
          }
          id v22 = +[NSCKRecordMetadata insertMetadataForObject:setRecordName:inZoneWithID:recordNamePrefix:error:]( NSCKRecordMetadata,  "insertMetadataForObject:setRecordName:inZoneWithID:recordNamePrefix:error:",  v20,  [v21 preserveLegacyRecordMetadataBehavior],  objc_msgSend(v12, "zoneID"),  0,  &v44);
          id v23 = (id)[v20 valueForKey:@"ckRecordSystemFields"];
          [v22 setCkRecordSystemFields:v23];
        }

        [v20 setValue:0 forKey:@"ckRecordSystemFields"];
        ++v19;
      }

      while (v17 != v19);
      uint64_t v24 = [a2 countByEnumeratingWithState:&v40 objects:v49 count:16];
      uint64_t v17 = v24;
    }

    while (v24);
  }

  if (![v38 hasChanges])
  {

    return;
  }

  char v25 = [v38 save:&v44];

  uint64_t v5 = v36;
  a4 = v37;
  uint64_t v10 = v35;
  if ((v25 & 1) == 0) {
    goto LABEL_22;
  }
}

void __149__PFCloudKitMetadataModelMigrator_addMigrationStatementsToDeleteDuplicateMirroredRelationshipsToContext_withManagedObjectContext_andSQLEntity_error___block_invoke( uint64_t a1)
{
  v59[2] = *MEMORY[0x1895F89C0];
  id v2 = +[NSFetchRequest fetchRequestWithEntityName:]( &OBJC_CLASS___NSFetchRequest,  "fetchRequestWithEntityName:",  +[NSCKMirroredRelationship entityPath](&OBJC_CLASS___NSCKMirroredRelationship, "entityPath"));
  uint64_t v3 = objc_alloc_init(&OBJC_CLASS___NSExpressionDescription);
  -[NSPropertyDescription setName:](v3, "setName:", @"count");
  -[NSExpressionDescription setExpression:]( v3,  "setExpression:",  [MEMORY[0x189607878] expressionWithFormat:@"ckRecordID.@count"]);
  -[NSExpressionDescription setExpressionResultType:](v3, "setExpressionResultType:", 300LL);
  v59[0] = @"ckRecordID";
  v59[1] = v3;
  __int128 v43 = v3;
  -[NSFetchRequest setPropertiesToFetch:]( v2,  "setPropertiesToFetch:",  [MEMORY[0x189603F18] arrayWithObjects:v59 count:2]);
  -[NSFetchRequest setPropertiesToGroupBy:](v2, "setPropertiesToGroupBy:", &unk_189F0B4F0);
  -[NSFetchRequest setResultType:](v2, "setResultType:", 2LL);
  id v4 = (void *)[*(id *)(a1 + 32) executeFetchRequest:v2 error:*(void *)(*(void *)(a1 + 56) + 8) + 40];
  if (v4)
  {
    uint64_t v5 = v4;
    __int128 v55 = 0u;
    __int128 v56 = 0u;
    __int128 v53 = 0u;
    __int128 v54 = 0u;
    uint64_t v6 = [v4 countByEnumeratingWithState:&v53 objects:v58 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v54;
      uint64_t v44 = *(void *)v54;
      uint64_t v45 = v5;
      do
      {
        uint64_t v9 = 0LL;
        uint64_t v46 = v7;
        do
        {
          if (*(void *)v54 != v8) {
            objc_enumerationMutation(v5);
          }
          uint64_t v10 = *(void **)(*((void *)&v53 + 1) + 8 * v9);
          if (objc_msgSend((id)objc_msgSend(v10, "objectForKey:", @"count"), "integerValue") >= 2)
          {
            id v11 = (void *)MEMORY[0x186E3E5D8]();
            uint64_t v12 = [v10 objectForKey:@"ckRecordID"];
            if (v12)
            {
              uint64_t v13 = v12;
              context = v11;
              uint64_t v14 = +[NSFetchRequest fetchRequestWithEntityName:]( &OBJC_CLASS___NSFetchRequest,  "fetchRequestWithEntityName:",  +[NSCKMirroredRelationship entityPath](&OBJC_CLASS___NSCKMirroredRelationship, "entityPath"));
              uint64_t v42 = v13;
              -[NSFetchRequest setPredicate:]( v14,  "setPredicate:",  [MEMORY[0x1896079C8] predicateWithFormat:@"ckRecordID = %@"]);
              -[NSFetchRequest setResultType:](v14, "setResultType:", 1LL);
              uint64_t v15 = [*(id *)(a1 + 32) executeFetchRequest:v14 error:*(void *)(*(void *)(a1 + 56) + 8) + 40];
              if (!v15)
              {
                *(_BYTE *)(*(void *)(*(void *)(a1 + 64) + 8LL) + 24LL) = 0;
                id v41 = *(id *)(*(void *)(*(void *)(a1 + 56) + 8LL) + 40LL);
                objc_autoreleasePoolPop(v11);
                goto LABEL_37;
              }

              uint64_t v16 = (void *)v15;
              uint64_t v17 = a1;
              id v18 = objc_alloc_init(MEMORY[0x189603FA8]);
              __int128 v49 = 0u;
              __int128 v50 = 0u;
              __int128 v51 = 0u;
              __int128 v52 = 0u;
              uint64_t v19 = [v16 countByEnumeratingWithState:&v49 objects:v57 count:16];
              if (v19)
              {
                uint64_t v20 = v19;
                uint64_t v21 = 0LL;
                uint64_t v22 = *(void *)v50;
                do
                {
                  for (uint64_t i = 0LL; i != v20; ++i)
                  {
                    if (*(void *)v50 != v22) {
                      objc_enumerationMutation(v16);
                    }
                    if (v21) {
                      objc_msgSend( v18,  "addObject:",  objc_msgSend( MEMORY[0x189607968],  "numberWithLongLong:",  objc_msgSend(*(id *)(*((void *)&v49 + 1) + 8 * i), "_referenceData64")));
                    }
                    else {
                      uint64_t v21 = *(void *)(*((void *)&v49 + 1) + 8 * i);
                    }
                  }

                  uint64_t v20 = [v16 countByEnumeratingWithState:&v49 objects:v57 count:16];
                }

                while (v20);
              }

              a1 = v17;
              uint64_t v8 = v44;
              if ([v18 count])
              {
                uint64_t v24 = objc_alloc(&OBJC_CLASS___NSSQLiteStatement);
                char v25 = (void *)NSString;
                uint64_t v26 = [*(id *)(v17 + 40) tableName];
                uint64_t v27 = *(void *)(v17 + 40);
                if (v27) {
                  uint64_t v28 = *(void **)(v27 + 128);
                }
                else {
                  uint64_t v28 = 0LL;
                }
                [v28 columnName];
                uint64_t v42 = v26;
                uint64_t v29 = -[NSSQLiteStatement initWithEntity:sqlString:]( v24,  "initWithEntity:sqlString:",  0,  [v25 stringWithFormat:@"DELETE FROM %@ WHERE %@ IN %@"]);
                uint64_t v30 = *(void *)(v17 + 48);
                if (v30)
                {
                  [*(id *)(v30 + 8) addObject:v29];
                  *(_BYTE *)(v30 + 32) = 1;
                }
              }

              uint64_t v5 = v45;
              uint64_t v7 = v46;
              id v11 = context;
            }

            else
            {
              uint64_t v31 = [NSString stringWithUTF8String:"Found mirrored relationships without a recordID."];
              _NSCoreDataLog(17LL, v31, v32, v33, v34, v35, v36, v37, v42);
              __int128 v38 = (os_log_s *)__pflogFaultLog;
              if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
              {
                *(_WORD *)__int128 buf = 0;
                _os_log_fault_impl( &dword_186681000,  v38,  OS_LOG_TYPE_FAULT,  "CoreData: Found mirrored relationships without a recordID.",  buf,  2u);
              }
            }

            objc_autoreleasePoolPop(v11);
          }

          ++v9;
        }

        while (v9 != v7);
        uint64_t v39 = [v5 countByEnumeratingWithState:&v53 objects:v58 count:16];
        uint64_t v7 = v39;
      }

      while (v39);
    }
  }

  else
  {
    *(_BYTE *)(*(void *)(*(void *)(a1 + 64) + 8LL) + 24LL) = 0;
    id v40 = *(id *)(*(void *)(*(void *)(a1 + 56) + 8LL) + 40LL);
  }

void __103__PFCloudKitMetadataModelMigrator_checkForCorruptedRecordMetadataInStore_inManagedObjectContext_error___block_invoke( uint64_t a1,  void *a2,  void *a3,  _BYTE *a4)
{
  uint64_t v39 = *MEMORY[0x1895F89C0];
  if (a2)
  {
    __int128 v36 = 0u;
    __int128 v37 = 0u;
    __int128 v34 = 0u;
    __int128 v35 = 0u;
    uint64_t v6 = [a2 countByEnumeratingWithState:&v34 objects:v38 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v35;
      while (2)
      {
        uint64_t v9 = 0LL;
        do
        {
          if (*(void *)v35 != v8) {
            objc_enumerationMutation(a2);
          }
          uint64_t v10 = *(void **)(*((void *)&v34 + 1) + 8 * v9);
          unint64_t v11 = objc_msgSend((id)objc_msgSend(v10, "entityId"), "unsignedIntegerValue");
          uint64_t v12 = [*(id *)(a1 + 32) model];
          if (v12) {
            unint64_t v13 = *(unsigned int *)(v12 + 64);
          }
          else {
            unint64_t v13 = 0LL;
          }
          if (v11 > v13)
          {
            uint64_t v15 = (void *)MEMORY[0x186E3E5D8]();
            else {
              uint64_t v16 = __ckLoggingOverride;
            }
            uint64_t v17 = [@"CoreData+CloudKit: %s(%d): " stringByAppendingString:@"Found record metadata that points to missing entity: %@"];
            _NSCoreDataLog( v16,  v17,  v18,  v19,  v20,  v21,  v22,  v23,  (uint64_t)"-[PFCloudKitMetadataModelMigrator checkForCorruptedRecordMetadataInStore:inManagedObjectContext:e rror:]_block_invoke");
            objc_autoreleasePoolPop(v15);
            *(_BYTE *)(*(void *)(*(void *)(a1 + 48) + 8LL) + 24LL) = 1;
            return;
          }

          if (!objc_msgSend( (id)objc_msgSend(*(id *)(a1 + 32), "model"),  "entityForID:",  objc_msgSend((id)objc_msgSend(v10, "entityId"), "unsignedLongValue")))
          {
            uint64_t v24 = (void *)MEMORY[0x186E3E5D8]();
            else {
              uint64_t v25 = __ckLoggingOverride;
            }
            uint64_t v26 = [@"CoreData+CloudKit: %s(%d): " stringByAppendingString:@"Found record metadata that points to missing entity: %@"];
            goto LABEL_32;
          }

          if (objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "configurationName"), "length")
            && (objc_msgSend( (id)objc_msgSend(*(id *)(a1 + 32), "configurationName"),  "isEqualToString:",  @"PF_DEFAULT_CONFIGURATION_NAME") & 1) == 0 && (objc_msgSend( (id)objc_msgSend( *(id *)(a1 + 40),  "entitiesForConfiguration:",  objc_msgSend(*(id *)(a1 + 32), "configurationName")),  "containsObject:",  objc_msgSend( (id)objc_msgSend(*(id *)(a1 + 40), "entitiesByName"),  "objectForKey:",  objc_msgSend( (id)objc_msgSend( (id)objc_msgSend(*(id *)(a1 + 32), "model"),  "entityForID:",  objc_msgSend((id)objc_msgSend(v10, "entityId"), "unsignedLongValue")),  "name"))) & 1) == 0)
          {
            uint64_t v24 = (void *)MEMORY[0x186E3E5D8]();
            else {
              uint64_t v25 = __ckLoggingOverride;
            }
            uint64_t v26 = [@"CoreData+CloudKit: %s(%d): " stringByAppendingString:@"Found record metadata that points to an entity that is no longer part of the store's configuration: %@"];
LABEL_32:
            _NSCoreDataLog( v25,  v26,  v27,  v28,  v29,  v30,  v31,  v32,  (uint64_t)"-[PFCloudKitMetadataModelMigrator checkForCorruptedRecordMetadataInStore:inManagedObjectContext:e rror:]_block_invoke");
            objc_autoreleasePoolPop(v24);
            *(_BYTE *)(*(void *)(*(void *)(a1 + 48) + 8LL) + 24LL) = 1;
            *a4 = 1;
            return;
          }

          ++v9;
        }

        while (v7 != v9);
        uint64_t v14 = [a2 countByEnumeratingWithState:&v34 objects:v38 count:16];
        uint64_t v7 = v14;
        if (v14) {
          continue;
        }
        break;
      }
    }
  }

  else
  {
    *(_BYTE *)(*(void *)(*(void *)(a1 + 56) + 8LL) + 24LL) = 0;
    *a4 = 1;
    *(void *)(*(void *)(*(void *)(a1 + 64) + 8LL) + 40LL) = a3;
  }

void __89__PFCloudKitMetadataModelMigrator_cleanUpAfterClientMigrationWithStore_andContext_error___block_invoke( uint64_t a1,  void *a2,  void *a3,  _BYTE *a4,  _BYTE *a5)
{
  uint64_t v23 = *MEMORY[0x1895F89C0];
  if (a2)
  {
    id v9 = objc_alloc_init(MEMORY[0x189603FA8]);
    __int128 v17 = 0u;
    __int128 v18 = 0u;
    __int128 v19 = 0u;
    __int128 v20 = 0u;
    uint64_t v10 = [a2 countByEnumeratingWithState:&v17 objects:v22 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v18;
      do
      {
        for (uint64_t i = 0LL; i != v11; ++i)
        {
          if (*(void *)v18 != v12) {
            objc_enumerationMutation(a2);
          }
          uint64_t v14 = *(void **)(*((void *)&v17 + 1) + 8 * i);
          if (!objc_msgSend(*(id *)(a1 + 32), "containsObject:", objc_msgSend(v14, "cdEntityName"))
            || (objc_msgSend(*(id *)(a1 + 32), "containsObject:", objc_msgSend(v14, "relatedEntityName")) & 1) == 0)
          {
            objc_msgSend(v9, "addObject:", objc_msgSend(v14, "objectID"));
          }
        }

        uint64_t v11 = [a2 countByEnumeratingWithState:&v17 objects:v22 count:16];
      }

      while (v11);
    }

    if ([v9 count])
    {
      uint64_t v15 = -[NSBatchDeleteRequest initWithObjectIDs:]( objc_alloc(&OBJC_CLASS___NSBatchDeleteRequest),  "initWithObjectIDs:",  v9);
      -[NSBatchDeleteRequest setResultType:](v15, "setResultType:", 0LL);
      uint64_t v21 = *(void *)(a1 + 40);
      -[NSPersistentStoreRequest setAffectedStores:]( v15,  "setAffectedStores:",  [MEMORY[0x189603F18] arrayWithObjects:&v21 count:1]);
      if ((objc_msgSend( (id)objc_msgSend( (id)objc_msgSend( *(id *)(a1 + 48),  "executeRequest:error:",  v15,  *(void *)(*(void *)(a1 + 56) + 8) + 40),  "result"),  "BOOLValue") & 1) == 0)
      {
        *(_BYTE *)(*(void *)(*(void *)(a1 + 64) + 8LL) + 24LL) = 0;
        id v16 = *(id *)(*(void *)(*(void *)(a1 + 56) + 8LL) + 40LL);
        a5 = a4;
      }

      *a5 = 1;
    }
  }

  else
  {
    *(void *)(*(void *)(*(void *)(a1 + 56) + 8LL) + 40LL) = a3;
    *(_BYTE *)(*(void *)(*(void *)(a1 + 64) + 8LL) + 24LL) = 0;
    *a4 = 1;
  }

@end