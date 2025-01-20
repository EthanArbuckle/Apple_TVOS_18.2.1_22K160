@interface PFCloudKitHistoryAnalyzerContext
- (BOOL)_flushPendingAnalyzerStates:(uint64_t)a1;
- (BOOL)finishProcessing:(id *)a3;
- (BOOL)processChange:(id)a3 error:(id *)a4;
- (BOOL)reset:(id *)a3;
- (BOOL)resetStateForObjectID:(id)a3 error:(id *)a4;
- (PFCloudKitHistoryAnalyzerContext)initWithOptions:(id)a3 managedObjectContext:(id)a4 store:(id)a5;
- (id)fetchSortedStates:(id *)a3;
- (id)newAnalyzerStateForChange:(id)a3 error:(id *)a4;
- (void)dealloc;
@end

@implementation PFCloudKitHistoryAnalyzerContext

- (PFCloudKitHistoryAnalyzerContext)initWithOptions:(id)a3 managedObjectContext:(id)a4 store:(id)a5
{
  uint64_t v34 = *MEMORY[0x1895F89C0];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    uint64_t v9 = [NSString stringWithUTF8String:"Attempt to initialize PFCloudKitHistoryAnalyzerContext with options that aren't PFCloudKitHistoryAnalyzerOptions: %@"];
    _NSCoreDataLog(17LL, v9, v10, v11, v12, v13, v14, v15, (uint64_t)a3);
    v16 = (os_log_s *)__pflogFaultLog;
    if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v33 = a3;
      _os_log_fault_impl( &dword_186681000,  v16,  OS_LOG_TYPE_FAULT,  "CoreData: Attempt to initialize PFCloudKitHistoryAnalyzerContext with options that aren't PFCloudKitHistoryAnalyzerOptions: %@",  buf,  0xCu);
    }
  }

  v30.receiver = self;
  v30.super_class = (Class)&OBJC_CLASS___PFCloudKitHistoryAnalyzerContext;
  v17 = -[PFHistoryAnalyzerContext initWithOptions:](&v30, sel_initWithOptions_, a3);
  if (v17)
  {
    v17->_managedObjectContext = (NSManagedObjectContext *)a4;
    v17->_resetChangedObjectIDs = (NSMutableSet *)objc_alloc_init(MEMORY[0x189603FE0]);
    v17->_entityIDToChangedPrimaryKeySet = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x189603FC8]);
    v18 = (void *)MEMORY[0x186E3E5D8]();
    id v19 = objc_alloc_init(MEMORY[0x189603FE0]);
    v20 = (void *)objc_msgSend( (id)objc_msgSend((id)objc_msgSend(a4, "persistentStoreCoordinator"), "managedObjectModel"),  "entitiesForConfiguration:",  objc_msgSend(a5, "configurationName"));
    __int128 v26 = 0u;
    __int128 v27 = 0u;
    __int128 v28 = 0u;
    __int128 v29 = 0u;
    uint64_t v21 = [v20 countByEnumeratingWithState:&v26 objects:v31 count:16];
    if (v21)
    {
      uint64_t v22 = v21;
      uint64_t v23 = *(void *)v27;
      do
      {
        uint64_t v24 = 0LL;
        do
        {
          if (*(void *)v27 != v23) {
            objc_enumerationMutation(v20);
          }
          objc_msgSend(v19, "addObject:", objc_msgSend(*(id *)(*((void *)&v26 + 1) + 8 * v24++), "name"));
        }

        while (v22 != v24);
        uint64_t v22 = [v20 countByEnumeratingWithState:&v26 objects:v31 count:16];
      }

      while (v22);
    }

    v17->_configuredEntityNames = (NSSet *)[v19 copy];

    objc_autoreleasePoolPop(v18);
    v17->_store = (NSSQLCore *)a5;
  }

  return v17;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___PFCloudKitHistoryAnalyzerContext;
  -[PFHistoryAnalyzerContext dealloc](&v3, sel_dealloc);
}

- (BOOL)processChange:(id)a3 error:(id *)a4
{
  uint64_t v30 = *MEMORY[0x1895F89C0];
  if (!-[NSSet containsObject:]( self->_configuredEntityNames,  "containsObject:",  objc_msgSend((id)objc_msgSend((id)objc_msgSend(a3, "changedObjectID"), "entity"), "name")))
  {
    uint64_t v10 = (void *)MEMORY[0x186E3E5D8]();
    else {
      uint64_t v11 = __ckLoggingOverride;
    }
    uint64_t v12 = [@"CoreData+CloudKit: %s(%d): " stringByAppendingString:@"%@: Skipping change because its entity is not in the configured set of entities for this store: %@"];
    [a3 changedObjectID];
    _NSCoreDataLog( v11,  v12,  v13,  v14,  v15,  v16,  v17,  v18,  (uint64_t)"-[PFCloudKitHistoryAnalyzerContext processChange:error:]");
    objc_autoreleasePoolPop(v10);
    return (unint64_t)-[NSMutableDictionary count](self->super._objectIDToState, "count") < 0x3E8
        || -[PFCloudKitHistoryAnalyzerContext _flushPendingAnalyzerStates:]((uint64_t)self, a4);
  }

  if ((objc_msgSend( (id)objc_msgSend((id)objc_msgSend(a3, "transaction"), "author"),  "isEqualToString:",  @"NSCloudKitMirroringDelegate.import") & 1) != 0 || (objc_msgSend( (id)objc_msgSend((id)objc_msgSend(a3, "transaction"), "contextName"),  "isEqualToString:",  @"NSCloudKitMirroringDelegate.import") & 1) != 0 || objc_msgSend( (id)objc_msgSend((id)objc_msgSend(a3, "transaction"), "author"),  "isEqualToString:",  @"NSCloudKitMirroringDelegate.reset"))
  {
    options = self->super._options;
    if (!options || !BYTE1(options[1].super.isa))
    {
      if ([a3 changeType] == 2
        && !-[PFCloudKitHistoryAnalyzerContext resetStateForObjectID:error:]( self,  "resetStateForObjectID:error:",  [a3 changedObjectID],  a4))
      {
        return 0;
      }

      return (unint64_t)-[NSMutableDictionary count](self->super._objectIDToState, "count") < 0x3E8
          || -[PFCloudKitHistoryAnalyzerContext _flushPendingAnalyzerStates:]((uint64_t)self, a4);
    }
  }

  else if ([a3 changeType] != 2 && objc_msgSend((id)objc_msgSend(a3, "updatedProperties"), "count"))
  {
    __int128 v27 = 0u;
    __int128 v28 = 0u;
    __int128 v25 = 0u;
    __int128 v26 = 0u;
    id v19 = (void *)[a3 updatedProperties];
    uint64_t v20 = [v19 countByEnumeratingWithState:&v25 objects:v29 count:16];
    if (!v20) {
      return (unint64_t)-[NSMutableDictionary count](self->super._objectIDToState, "count") < 0x3E8
    }
          || -[PFCloudKitHistoryAnalyzerContext _flushPendingAnalyzerStates:]((uint64_t)self, a4);
    uint64_t v21 = v20;
    uint64_t v22 = *(void *)v26;
LABEL_25:
    uint64_t v23 = 0LL;
    while (1)
    {
      if (*(void *)v26 != v22) {
        objc_enumerationMutation(v19);
      }
      if (!objc_msgSend( (id)objc_msgSend( (id)objc_msgSend(*(id *)(*((void *)&v25 + 1) + 8 * v23), "userInfo"),  "objectForKey:",  @"NSCloudKitMirroringDelegateIgnoredPropertyKey"),  "BOOLValue")) {
        break;
      }
      if (v21 == ++v23)
      {
        uint64_t v21 = [v19 countByEnumeratingWithState:&v25 objects:v29 count:16];
        if (v21) {
          goto LABEL_25;
        }
        if (self) {
          return (unint64_t)-[NSMutableDictionary count](self->super._objectIDToState, "count") < 0x3E8
        }
              || -[PFCloudKitHistoryAnalyzerContext _flushPendingAnalyzerStates:]((uint64_t)self, a4);
        return 0;
      }
    }
  }

  v24.receiver = self;
  v24.super_class = (Class)&OBJC_CLASS___PFCloudKitHistoryAnalyzerContext;
  unsigned __int8 v8 = -[PFHistoryAnalyzerContext processChange:error:](&v24, sel_processChange_error_, a3, a4);
  BOOL result = 0;
  if (self && (v8 & 1) != 0) {
    return (unint64_t)-[NSMutableDictionary count](self->super._objectIDToState, "count") < 0x3E8
  }
        || -[PFCloudKitHistoryAnalyzerContext _flushPendingAnalyzerStates:]((uint64_t)self, a4);
  return result;
}

- (BOOL)_flushPendingAnalyzerStates:(uint64_t)a1
{
  uint64_t v31 = *MEMORY[0x1895F89C0];
  if (!a1) {
    return 0LL;
  }
  uint64_t v21 = 0LL;
  uint64_t v22 = &v21;
  uint64_t v23 = 0x3052000000LL;
  objc_super v24 = __Block_byref_object_copy__47;
  __int128 v25 = __Block_byref_object_dispose__47;
  uint64_t v26 = 0LL;
  uint64_t v17 = 0LL;
  uint64_t v18 = &v17;
  uint64_t v19 = 0x2020000000LL;
  char v20 = 1;
  v4 = *(void **)(a1 + 56);
  v16[0] = MEMORY[0x1895F87A8];
  v16[1] = 3221225472LL;
  v16[2] = __64__PFCloudKitHistoryAnalyzerContext__flushPendingAnalyzerStates___block_invoke;
  v16[3] = &unk_189EA9058;
  v16[4] = a1;
  v16[5] = &v17;
  v16[6] = &v21;
  [v4 performBlockAndWait:v16];
  if (!*((_BYTE *)v18 + 24)
    || ([*(id *)(a1 + 24) removeAllObjects],
        [*(id *)(a1 + 40) removeAllObjects],
        [*(id *)(a1 + 72) removeAllObjects],
        [*(id *)(a1 + 80) removeAllObjects],
        !*((_BYTE *)v18 + 24)))
  {
    id v5 = (id)v22[5];
    if (v5)
    {
      if (a2) {
        *a2 = v5;
      }
    }

    else
    {
      uint64_t v6 = [NSString stringWithUTF8String:"Illegal attempt to return an error without one in %s:%d"];
      _NSCoreDataLog( 17LL,  v6,  v7,  v8,  v9,  v10,  v11,  v12,  (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Persistence/PFCloudKitHistoryAnalyzerContext.m");
      uint64_t v13 = (os_log_s *)__pflogFaultLog;
      if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 136315394;
        __int128 v28 = "/Library/Caches/com.apple.xbs/Sources/Persistence/PFCloudKitHistoryAnalyzerContext.m";
        __int16 v29 = 1024;
        int v30 = 198;
        _os_log_fault_impl( &dword_186681000,  v13,  OS_LOG_TYPE_FAULT,  "CoreData: Illegal attempt to return an error without one in %s:%d",  buf,  0x12u);
      }
    }
  }

  v22[5] = 0LL;
  BOOL v14 = *((_BYTE *)v18 + 24) != 0;
  _Block_object_dispose(&v17, 8);
  _Block_object_dispose(&v21, 8);
  return v14;
}

uint64_t __64__PFCloudKitHistoryAnalyzerContext__flushPendingAnalyzerStates___block_invoke(uint64_t result)
{
  v1 = (void *)result;
  uint64_t v67 = *MEMORY[0x1895F89C0];
  if (*(_BYTE *)(*(void *)(*(void *)(result + 40) + 8LL) + 24LL))
  {
    uint64_t v2 = *(void *)(result + 32);
    objc_super v3 = v2 ? *(void **)(v2 + 24) : 0LL;
    BOOL result = [v3 count];
    if (result)
    {
      __int128 v60 = 0u;
      __int128 v61 = 0u;
      __int128 v58 = 0u;
      __int128 v59 = 0u;
      id obj = *(id *)(v1[4] + 80LL);
      BOOL result = [obj countByEnumeratingWithState:&v58 objects:v66 count:16];
      uint64_t v47 = result;
      if (result)
      {
        uint64_t v46 = *(void *)v59;
        while (2)
        {
          uint64_t v4 = 0LL;
          do
          {
            if (*(void *)v59 != v46) {
              objc_enumerationMutation(obj);
            }
            uint64_t v5 = *(void *)(*((void *)&v58 + 1) + 8 * v4);
            uint64_t v6 = [*(id *)(v1[4] + 80) objectForKey:v5];
            uint64_t v7 = +[NSFetchRequest fetchRequestWithEntityName:]( &OBJC_CLASS___NSFetchRequest,  "fetchRequestWithEntityName:",  +[NSCKHistoryAnalyzerState entityPath](&OBJC_CLASS___NSCKHistoryAnalyzerState, "entityPath"));
            -[NSFetchRequest setPredicate:]( v7,  "setPredicate:",  [MEMORY[0x1896079C8] predicateWithFormat:@"entityId = %@ AND entityPK in %@", v5, v6]);
            uint64_t v8 = (void *)[*(id *)(v1[4] + 56) executeFetchRequest:v7 error:*(void *)(v1[6] + 8) + 40];
            if (!v8)
            {
              *(_BYTE *)(*(void *)(v1[5] + 8LL) + 24LL) = 0;
              BOOL result = (uint64_t)*(id *)(*(void *)(v1[6] + 8LL) + 40LL);
              goto LABEL_35;
            }

            uint64_t v9 = v8;
            uint64_t v48 = v4;
            __int128 v56 = 0u;
            __int128 v57 = 0u;
            __int128 v54 = 0u;
            __int128 v55 = 0u;
            uint64_t v10 = [v8 countByEnumeratingWithState:&v54 objects:v65 count:16];
            if (v10)
            {
              uint64_t v11 = v10;
              uint64_t v12 = *(void *)v55;
              do
              {
                uint64_t v13 = 0LL;
                do
                {
                  if (*(void *)v55 != v12) {
                    objc_enumerationMutation(v9);
                  }
                  BOOL v14 = *(void **)(*((void *)&v54 + 1) + 8 * v13);
                  uint64_t v15 = [v14 analyzedObjectID];
                  uint64_t v16 = v1[4];
                  if (v16) {
                    uint64_t v17 = *(void **)(v16 + 24);
                  }
                  else {
                    uint64_t v17 = 0LL;
                  }
                  id v18 = (id)[v17 objectForKey:v15];
                  if (v18)
                  {
                    [v14 mergeWithState:v18];
                    uint64_t v19 = v1[4];
                    if (v19) {
                      char v20 = *(void **)(v19 + 24);
                    }
                    else {
                      char v20 = 0LL;
                    }
                    [v20 removeObjectForKey:v15];
                  }

                  else if ([*(id *)(v1[4] + 72) containsObject:v15])
                  {
                    [*(id *)(v1[4] + 56) deleteObject:v14];
                  }

                  else
                  {
                    uint64_t v21 = [NSString stringWithUTF8String:"History parsing corruption detected. An existing analyzer state was fetched from the databas e for '%@' but it's corresponding in-memory copy is no longer present in the in-memory cache."];
                    _NSCoreDataLog(17LL, v21, v22, v23, v24, v25, v26, v27, v15);
                    __int128 v28 = (os_log_s *)__pflogFaultLog;
                    if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
                    {
                      *(_DWORD *)buf = 138412290;
                      uint64_t v64 = v15;
                      _os_log_fault_impl( &dword_186681000,  v28,  OS_LOG_TYPE_FAULT,  "CoreData: History parsing corruption detected. An existing analyzer state was fetched from the d atabase for '%@' but it's corresponding in-memory copy is no longer present in the in-memory cache.",  buf,  0xCu);
                    }
                  }

                  ++v13;
                }

                while (v11 != v13);
                uint64_t v29 = [v9 countByEnumeratingWithState:&v54 objects:v65 count:16];
                uint64_t v11 = v29;
              }

              while (v29);
            }

            uint64_t v4 = v48 + 1;
          }

          while (v48 + 1 != v47);
          BOOL result = [obj countByEnumeratingWithState:&v58 objects:v66 count:16];
          uint64_t v47 = result;
          if (result) {
            continue;
          }
          break;
        }
      }
    }
  }

- (BOOL)resetStateForObjectID:(id)a3 error:(id *)a4
{
  uint64_t v23 = *MEMORY[0x1895F89C0];
  v17.receiver = self;
  v17.super_class = (Class)&OBJC_CLASS___PFCloudKitHistoryAnalyzerContext;
  id v18 = 0LL;
  BOOL v7 = -[PFHistoryAnalyzerContext resetStateForObjectID:error:](&v17, sel_resetStateForObjectID_error_, a3, &v18);
  if (v7)
  {
    -[NSMutableSet addObject:](self->_resetChangedObjectIDs, "addObject:", a3);
  }

  else if (v18)
  {
    if (a4) {
      *a4 = v18;
    }
  }

  else
  {
    uint64_t v8 = [NSString stringWithUTF8String:"Illegal attempt to return an error without one in %s:%d"];
    _NSCoreDataLog( 17LL,  v8,  v9,  v10,  v11,  v12,  v13,  v14,  (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Persistence/PFCloudKitHistoryAnalyzerContext.m");
    uint64_t v15 = (os_log_s *)__pflogFaultLog;
    if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 136315394;
      char v20 = "/Library/Caches/com.apple.xbs/Sources/Persistence/PFCloudKitHistoryAnalyzerContext.m";
      __int16 v21 = 1024;
      int v22 = 220;
      _os_log_fault_impl( &dword_186681000,  v15,  OS_LOG_TYPE_FAULT,  "CoreData: Illegal attempt to return an error without one in %s:%d",  buf,  0x12u);
    }
  }

  return v7;
}

- (BOOL)reset:(id *)a3
{
  uint64_t v23 = *MEMORY[0x1895F89C0];
  v17.receiver = self;
  v17.super_class = (Class)&OBJC_CLASS___PFCloudKitHistoryAnalyzerContext;
  id v18 = 0LL;
  if (!-[PFHistoryAnalyzerContext reset:](&v17, sel_reset_, &v18)
    || (-[NSMutableDictionary removeAllObjects](self->_entityIDToChangedPrimaryKeySet, "removeAllObjects"),
        -[NSMutableSet removeAllObjects](self->_resetChangedObjectIDs, "removeAllObjects"),
        uint64_t v5 = -[NSBatchDeleteRequest initWithFetchRequest:]( [NSBatchDeleteRequest alloc],  "initWithFetchRequest:",  +[NSFetchRequest fetchRequestWithEntityName:]( NSFetchRequest,  "fetchRequestWithEntityName:",  +[NSCKHistoryAnalyzerState entityPath](NSCKHistoryAnalyzerState, "entityPath"))),  -[NSBatchDeleteRequest setResultType:](v5, "setResultType:", 0),  v6 = objc_msgSend( (id)-[NSPersistentStoreResult result]( -[NSManagedObjectContext executeRequest:error:]( self->_managedObjectContext,  "executeRequest:error:",  v5,  &v18),  "result"),  "BOOLValue"),  v5,  !v6))
  {
    if (v18)
    {
      if (a3)
      {
        LOBYTE(v7) = 0;
        *a3 = v18;
        return v7;
      }
    }

    else
    {
      uint64_t v8 = [NSString stringWithUTF8String:"Illegal attempt to return an error without one in %s:%d"];
      _NSCoreDataLog( 17LL,  v8,  v9,  v10,  v11,  v12,  v13,  v14,  (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Persistence/PFCloudKitHistoryAnalyzerContext.m");
      uint64_t v15 = (os_log_s *)__pflogFaultLog;
      BOOL v7 = os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT);
      if (!v7) {
        return v7;
      }
      *(_DWORD *)buf = 136315394;
      char v20 = "/Library/Caches/com.apple.xbs/Sources/Persistence/PFCloudKitHistoryAnalyzerContext.m";
      __int16 v21 = 1024;
      int v22 = 243;
      _os_log_fault_impl( &dword_186681000,  v15,  OS_LOG_TYPE_FAULT,  "CoreData: Illegal attempt to return an error without one in %s:%d",  buf,  0x12u);
    }

    LOBYTE(v7) = 0;
    return v7;
  }

  -[NSManagedObjectContext reset](self->_managedObjectContext, "reset");
  LOBYTE(v7) = 1;
  return v7;
}

- (BOOL)finishProcessing:(id *)a3
{
  uint64_t v25 = *MEMORY[0x1895F89C0];
  v19.receiver = self;
  v19.super_class = (Class)&OBJC_CLASS___PFCloudKitHistoryAnalyzerContext;
  char v20 = 0LL;
  if (!-[PFHistoryAnalyzerContext finishProcessing:](&v19, sel_finishProcessing_, &v20)
    || !-[PFCloudKitHistoryAnalyzerContext _flushPendingAnalyzerStates:]((uint64_t)self, &v20)
    || self
    && (options = self->super._options) != 0LL
    && options->_automaticallyPruneTransientRecords
    && (v6 = +[NSFetchRequest fetchRequestWithEntityName:]( NSFetchRequest,  "fetchRequestWithEntityName:",  +[NSCKHistoryAnalyzerState entityPath](NSCKHistoryAnalyzerState, "entityPath")),  -[NSFetchRequest setPredicate:]( v6,  "setPredicate:",  [MEMORY[0x1896079C8] predicateWithFormat:@"originalChangeTypeNum = %@ AND finalChangeTypeNum = %@", &unk_189F04620, &unk_189F04638]),  v7 = -[NSBatchDeleteRequest initWithFetchRequest:]( [NSBatchDeleteRequest alloc],  "initWithFetchRequest:",  v6),  -[NSBatchDeleteRequest setResultType:](v7, "setResultType:", 0),  char v8 = objc_msgSend( (id)-[NSPersistentStoreResult result]( -[NSManagedObjectContext executeRequest:error:]( self->_managedObjectContext,  "executeRequest:error:",  v7,  &v20),  "result"),  "BOOLValue"),  v7,  (v8 & 1) == 0))
  {
    if (v20)
    {
      if (a3)
      {
        LOBYTE(v9) = 0;
        *a3 = v20;
        return v9;
      }
    }

    else
    {
      uint64_t v10 = [NSString stringWithUTF8String:"Illegal attempt to return an error without one in %s:%d"];
      _NSCoreDataLog( 17LL,  v10,  v11,  v12,  v13,  v14,  v15,  v16,  (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Persistence/PFCloudKitHistoryAnalyzerContext.m");
      objc_super v17 = (os_log_s *)__pflogFaultLog;
      BOOL v9 = os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT);
      if (!v9) {
        return v9;
      }
      *(_DWORD *)buf = 136315394;
      int v22 = "/Library/Caches/com.apple.xbs/Sources/Persistence/PFCloudKitHistoryAnalyzerContext.m";
      __int16 v23 = 1024;
      int v24 = 268;
      _os_log_fault_impl( &dword_186681000,  v17,  OS_LOG_TYPE_FAULT,  "CoreData: Illegal attempt to return an error without one in %s:%d",  buf,  0x12u);
    }

    LOBYTE(v9) = 0;
    return v9;
  }

  LOBYTE(v9) = 1;
  return v9;
}

- (id)fetchSortedStates:(id *)a3
{
  v7[1] = *MEMORY[0x1895F89C0];
  uint64_t v5 = +[NSFetchRequest fetchRequestWithEntityName:]( &OBJC_CLASS___NSFetchRequest,  "fetchRequestWithEntityName:",  +[NSCKHistoryAnalyzerState entityPath](&OBJC_CLASS___NSCKHistoryAnalyzerState, "entityPath"));
  v7[0] = [MEMORY[0x189607A20] sortDescriptorWithKey:@"finalTransactionNumber" ascending:1];
  -[NSFetchRequest setSortDescriptors:]( v5,  "setSortDescriptors:",  [MEMORY[0x189603F18] arrayWithObjects:v7 count:1]);
  -[NSFetchRequest setFetchBatchSize:](v5, "setFetchBatchSize:", 200LL);
  return  -[NSManagedObjectContext executeFetchRequest:error:]( self->_managedObjectContext,  "executeFetchRequest:error:",  v5,  a3);
}

- (id)newAnalyzerStateForChange:(id)a3 error:(id *)a4
{
  v12.receiver = self;
  v12.super_class = (Class)&OBJC_CLASS___PFCloudKitHistoryAnalyzerContext;
  id v5 = -[PFHistoryAnalyzerContext newAnalyzerStateForChange:error:](&v12, sel_newAnalyzerStateForChange_error_, a3, a4);
  if (v5)
  {
    uint64_t v6 = _sqlEntityForEntityDescription( (uint64_t)-[NSSQLCore model](self->_store, "model"),  (void *)objc_msgSend((id)objc_msgSend(v5, "analyzedObjectID"), "entity"));
    if (v6) {
      uint64_t v7 = *(unsigned int *)(v6 + 184);
    }
    else {
      uint64_t v7 = 0LL;
    }
    id v8 = (id)-[NSMutableDictionary objectForKey:]( self->_entityIDToChangedPrimaryKeySet,  "objectForKey:",  [MEMORY[0x189607968] numberWithUnsignedInt:v7]);
    if (!v8)
    {
      id v8 = objc_alloc_init(MEMORY[0x189603FE0]);
      entityIDToChangedPrimaryKeySet = self->_entityIDToChangedPrimaryKeySet;
      if (v6) {
        uint64_t v10 = *(unsigned int *)(v6 + 184);
      }
      else {
        uint64_t v10 = 0LL;
      }
      -[NSMutableDictionary setObject:forKey:]( entityIDToChangedPrimaryKeySet,  "setObject:forKey:",  v8,  [MEMORY[0x189607968] numberWithUnsignedInt:v10]);
    }

    objc_msgSend( v8,  "addObject:",  objc_msgSend( MEMORY[0x189607968],  "numberWithLongLong:",  objc_msgSend((id)objc_msgSend(v5, "analyzedObjectID"), "_referenceData64")));
  }

  return v5;
}

@end