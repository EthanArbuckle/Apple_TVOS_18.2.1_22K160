@interface NSCKRecordZoneMoveReceipt
+ (NSString)entityPath;
+ (id)countMoveReceiptsInStore:(id)a3 matchingPredicate:(id)a4 withManagedObjectContext:(id)a5 error:(id *)a6;
+ (id)moveReceiptsMatchingRecordIDs:(id)a3 inManagedObjectContext:(id)a4 persistentStore:(id)a5 error:(id *)a6;
+ (uint64_t)_fetchReceiptsMatchingSubPredicates:(void *)a3 inManagedObjectContext:(uint64_t)a4 persistentStore:(uint64_t)a5 error:;
- (id)createRecordIDForMovedRecord;
@end

@implementation NSCKRecordZoneMoveReceipt

+ (NSString)entityPath
{
  v2 = (void *)NSString;
  id v3 = +[PFCloudKitMetadataModel ancillaryModelNamespace]( &OBJC_CLASS___PFCloudKitMetadataModel,  "ancillaryModelNamespace");
  v4 = (objc_class *)objc_opt_class();
  return (NSString *)[v2 stringWithFormat:@"%@/%@", v3, NSStringFromClass(v4)];
}

- (id)createRecordIDForMovedRecord
{
  id v3 = (void *)objc_msgSend( objc_alloc(getCloudKitCKRecordZoneIDClass()),  "initWithZoneName:ownerName:",  -[NSCKRecordZoneMoveReceipt zoneName](self, "zoneName"),  -[NSCKRecordZoneMoveReceipt ownerName](self, "ownerName"));
  v4 = (void *)objc_msgSend( objc_alloc(getCloudKitCKRecordIDClass()),  "initWithRecordName:zoneID:",  -[NSCKRecordZoneMoveReceipt recordName](self, "recordName"),  v3);

  return v4;
}

+ (id)moveReceiptsMatchingRecordIDs:(id)a3 inManagedObjectContext:(id)a4 persistentStore:(id)a5 error:(id *)a6
{
  uint64_t v37 = *MEMORY[0x1895F89C0];
  uint64_t v29 = 0LL;
  v30 = &v29;
  uint64_t v31 = 0x2020000000LL;
  char v32 = 1;
  uint64_t v23 = 0LL;
  v24 = &v23;
  uint64_t v25 = 0x3052000000LL;
  v26 = __Block_byref_object_copy__18;
  v27 = __Block_byref_object_dispose__18;
  uint64_t v28 = 0LL;
  id v10 = objc_alloc_init(MEMORY[0x189603FA8]);
  if ([a3 count])
  {
    v22[0] = MEMORY[0x1895F87A8];
    v22[1] = 3221225472LL;
    v22[2] = __104__NSCKRecordZoneMoveReceipt_moveReceiptsMatchingRecordIDs_inManagedObjectContext_persistentStore_error___block_invoke;
    v22[3] = &unk_189EA91E0;
    v22[4] = a3;
    v22[5] = a4;
    v22[6] = a5;
    v22[7] = v10;
    v22[8] = &v23;
    v22[9] = &v29;
    [a4 performBlockAndWait:v22];
  }

  id v11 = v10;
  if (!*((_BYTE *)v30 + 24))
  {
    id v12 = (id)v24[5];
    if (v12)
    {
      if (a6)
      {
        id v10 = 0LL;
        *a6 = v12;
        goto LABEL_10;
      }
    }

    else
    {
      uint64_t v13 = [NSString stringWithUTF8String:"Illegal attempt to return an error without one in %s:%d"];
      _NSCoreDataLog( 17LL,  v13,  v14,  v15,  v16,  v17,  v18,  v19,  (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Persistence/NSCKRecordZoneMoveReceipt.m");
      v20 = (os_log_s *)__pflogFaultLog;
      if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 136315394;
        v34 = "/Library/Caches/com.apple.xbs/Sources/Persistence/NSCKRecordZoneMoveReceipt.m";
        __int16 v35 = 1024;
        int v36 = 88;
        _os_log_fault_impl( &dword_186681000,  v20,  OS_LOG_TYPE_FAULT,  "CoreData: Illegal attempt to return an error without one in %s:%d",  buf,  0x12u);
      }
    }

    id v10 = 0LL;
  }

void __104__NSCKRecordZoneMoveReceipt_moveReceiptsMatchingRecordIDs_inManagedObjectContext_persistentStore_error___block_invoke( uint64_t a1)
{
  uint64_t v19 = *MEMORY[0x1895F89C0];
  v2 = (void *)[MEMORY[0x189603FA8] array];
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  id obj = *(id *)(a1 + 32);
  uint64_t v3 = [obj countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v15;
    while (2)
    {
      for (uint64_t i = 0LL; i != v4; ++i)
      {
        if (*(void *)v15 != v5) {
          objc_enumerationMutation(obj);
        }
        v7 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        v8 = (void *)MEMORY[0x186E3E5D8]();
        [v2 addObject:objc_msgSend( MEMORY[0x1896079C8], "predicateWithFormat:", @"recordName = %@ AND zoneName = %@ AND ownerName = %@", objc_msgSend(v7, "recordName"), objc_msgSend((id)objc_msgSend(v7, "zoneID"), "zoneName"), objc_msgSend((id)objc_msgSend(v7, "zoneID"), "ownerName"))];
        if ((unint64_t)[v2 count] >= 0x64)
        {
          uint64_t v9 = +[NSCKRecordZoneMoveReceipt _fetchReceiptsMatchingSubPredicates:inManagedObjectContext:persistentStore:error:]( (uint64_t)&OBJC_CLASS___NSCKRecordZoneMoveReceipt,  (uint64_t)v2,  *(void **)(a1 + 40),  *(void *)(a1 + 48),  *(void *)(*(void *)(a1 + 64) + 8LL) + 40LL);
          if (!v9)
          {
            *(_BYTE *)(*(void *)(*(void *)(a1 + 72) + 8LL) + 24LL) = 0;
            id v10 = *(id *)(*(void *)(*(void *)(a1 + 64) + 8LL) + 40LL);
            objc_autoreleasePoolPop(v8);
            goto LABEL_13;
          }

          [*(id *)(a1 + 56) addObjectsFromArray:v9];
        }

        objc_autoreleasePoolPop(v8);
      }

      uint64_t v4 = [obj countByEnumeratingWithState:&v14 objects:v18 count:16];
      if (v4) {
        continue;
      }
      break;
    }
  }

+ (uint64_t)_fetchReceiptsMatchingSubPredicates:(void *)a3 inManagedObjectContext:(uint64_t)a4 persistentStore:(uint64_t)a5 error:
{
  v11[1] = *MEMORY[0x1895F89C0];
  objc_opt_self();
  uint64_t v9 = +[NSFetchRequest fetchRequestWithEntityName:]( &OBJC_CLASS___NSFetchRequest,  "fetchRequestWithEntityName:",  +[NSCKRecordZoneMoveReceipt entityPath](&OBJC_CLASS___NSCKRecordZoneMoveReceipt, "entityPath"));
  v11[0] = a4;
  -[NSFetchRequest setAffectedStores:]( v9,  "setAffectedStores:",  [MEMORY[0x189603F18] arrayWithObjects:v11 count:1]);
  -[NSFetchRequest setPredicate:]( v9,  "setPredicate:",  [MEMORY[0x189607820] orPredicateWithSubpredicates:a2]);
  return [a3 executeFetchRequest:v9 error:a5];
}

+ (id)countMoveReceiptsInStore:(id)a3 matchingPredicate:(id)a4 withManagedObjectContext:(id)a5 error:(id *)a6
{
  v14[1] = *MEMORY[0x1895F89C0];
  id v10 = +[NSFetchRequest fetchRequestWithEntityName:]( &OBJC_CLASS___NSFetchRequest,  "fetchRequestWithEntityName:",  +[NSCKRecordZoneMoveReceipt entityPath](&OBJC_CLASS___NSCKRecordZoneMoveReceipt, "entityPath"));
  v14[0] = a3;
  -[NSFetchRequest setAffectedStores:]( v10,  "setAffectedStores:",  [MEMORY[0x189603F18] arrayWithObjects:v14 count:1]);
  -[NSFetchRequest setPredicate:](v10, "setPredicate:", a4);
  -[NSFetchRequest setResultType:](v10, "setResultType:", 4LL);
  if (a5)
  {
    -[NSManagedObjectContext _countForFetchRequest_:error:]((uint64_t)a5, v10, a6);
    uint64_t v12 = v11;
    if (v11 == 0x7FFFFFFFFFFFFFFFLL) {
      return 0LL;
    }
  }

  else
  {
    uint64_t v12 = 0LL;
  }

  return (id)[MEMORY[0x189607968] numberWithUnsignedInteger:v12];
}

@end