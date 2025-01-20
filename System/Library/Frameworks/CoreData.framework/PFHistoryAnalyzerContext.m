@interface PFHistoryAnalyzerContext
- (BOOL)finishProcessing:(id *)a3;
- (BOOL)processChange:(id)a3 error:(id *)a4;
- (BOOL)processTransaction:(id)a3 error:(id *)a4;
- (BOOL)reset:(id *)a3;
- (BOOL)resetStateForObjectID:(id)a3 error:(id *)a4;
- (PFHistoryAnalyzerContext)initWithOptions:(id)a3;
- (id)analyzerStateForChangedObjectID:(id)a3 error:(id *)a4;
- (id)fetchSortedStates:(id *)a3;
- (id)newAnalyzerStateForChange:(id)a3 error:(id *)a4;
- (void)dealloc;
@end

@implementation PFHistoryAnalyzerContext

- (PFHistoryAnalyzerContext)initWithOptions:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___PFHistoryAnalyzerContext;
  v4 = -[PFHistoryAnalyzerContext init](&v6, sel_init);
  if (v4)
  {
    v4->_objectIDToState = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x189603FC8]);
    v4->_processedTransactionIDs = (NSMutableSet *)objc_alloc_init(MEMORY[0x189603FE0]);
    v4->_options = (PFHistoryAnalyzerOptions *)a3;
  }

  return v4;
}

- (void)dealloc
{
  self->_sortedStates = 0LL;
  self->_finalHistoryToken = 0LL;

  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___PFHistoryAnalyzerContext;
  -[PFHistoryAnalyzerContext dealloc](&v3, sel_dealloc);
}

- (BOOL)reset:(id *)a3
{
  self->_objectIDToState = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x189603FC8]);

  self->_processedTransactionIDs = (NSMutableSet *)objc_alloc_init(MEMORY[0x189603FE0]);
  self->_sortedStates = 0LL;
  self->_isFinished = 0;

  self->_finalHistoryToken = 0LL;
  return 1;
}

- (BOOL)processTransaction:(id)a3 error:(id *)a4
{
  uint64_t v38 = *MEMORY[0x1895F89C0];
  id v33 = 0LL;
  uint64_t v9 = objc_msgSend(MEMORY[0x189607968], "numberWithLongLong:", objc_msgSend(a3, "transactionNumber"));
  if (-[NSMutableSet containsObject:](self->_processedTransactionIDs, "containsObject:", v9))
  {
    v26 = (void *)MEMORY[0x189603F70];
    uint64_t v27 = *MEMORY[0x189603A58];
    uint64_t v28 = [NSString stringWithFormat:@"Invalid attempt to process transaction '%@' twice.", v9, v32];
    goto LABEL_20;
  }

  if (self->_isFinished)
  {
    v26 = (void *)MEMORY[0x189603F70];
    uint64_t v27 = *MEMORY[0x189603A58];
    v29 = (void *)NSString;
    v30 = NSStringFromSelector(a2);
    uint64_t v28 = [v29 stringWithFormat:@"Invalid invocation of '%@', cannot be called after '%@'", v30, NSStringFromSelector(sel_finishProcessing_)];
LABEL_20:
    objc_exception_throw((id)[v26 exceptionWithName:v27 reason:v28 userInfo:0]);
    id v31 = v4;
    objc_exception_throw(v4);
    __break(1u);
  }

  -[NSMutableSet addObject:](self->_processedTransactionIDs, "addObject:", v9);
  v10 = (void *)[a3 changes];
  uint64_t v11 = [v10 count];
  id v12 = objc_alloc_init(MEMORY[0x1896077E8]);
  if (v11)
  {
    unint64_t v13 = 0LL;
    while (-[PFHistoryAnalyzerContext processChange:error:]( self,  "processChange:error:",  [v10 objectAtIndexedSubscript:v13],  &v33))
    {
      if (1000 * (v13 / 0x3E8) == v13)
      {

        id v12 = objc_alloc_init(MEMORY[0x1896077E8]);
      }

      if (v11 == ++v13) {
        goto LABEL_9;
      }
    }

    id v15 = v33;
    BOOL v14 = 0;
  }

  else
  {
LABEL_9:
    BOOL v14 = 1;
  }

  self->_finalHistoryToken = (NSPersistentHistoryToken *)(id)[a3 token];
  if (!v14)
  {
    id v16 = v33;
    if (v16)
    {
      if (a4) {
        *a4 = v16;
      }
    }

    else
    {
      uint64_t v17 = [NSString stringWithUTF8String:"Illegal attempt to return an error without one in %s:%d"];
      _NSCoreDataLog( 17LL,  v17,  v18,  v19,  v20,  v21,  v22,  v23,  (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Persistence/PFHistoryAnalyzerContext.m");
      v24 = (os_log_s *)__pflogFaultLog;
      if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 136315394;
        v35 = "/Library/Caches/com.apple.xbs/Sources/Persistence/PFHistoryAnalyzerContext.m";
        __int16 v36 = 1024;
        int v37 = 97;
        _os_log_fault_impl( &dword_186681000,  v24,  OS_LOG_TYPE_FAULT,  "CoreData: Illegal attempt to return an error without one in %s:%d",  buf,  0x12u);
      }
    }
  }

  return v14;
}

- (BOOL)resetStateForObjectID:(id)a3 error:(id *)a4
{
  return 1;
}

- (BOOL)processChange:(id)a3 error:(id *)a4
{
  uint64_t v26 = *MEMORY[0x1895F89C0];
  uint64_t v21 = 0LL;
  id v7 =  -[PFHistoryAnalyzerContext analyzerStateForChangedObjectID:error:]( self,  "analyzerStateForChangedObjectID:error:",  [a3 changedObjectID],  &v21);
  if (!v7)
  {
    uint64_t v11 = v21;
    if (v21) {
      goto LABEL_6;
    }
    id v12 = -[PFHistoryAnalyzerContext newAnalyzerStateForChange:error:]( self,  "newAnalyzerStateForChange:error:",  a3,  &v21);
    if (v12)
    {
      v8 = v12;
      goto LABEL_3;
    }

    uint64_t v11 = v21;
    if (v21)
    {
LABEL_6:
      if (a4)
      {
        BOOL v9 = 0;
        v8 = 0LL;
        *a4 = v11;
        goto LABEL_4;
      }
    }

    else
    {
      uint64_t v13 = [NSString stringWithUTF8String:"Illegal attempt to return an error without one in %s:%d"];
      _NSCoreDataLog( 17LL,  v13,  v14,  v15,  v16,  v17,  v18,  v19,  (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Persistence/PFHistoryAnalyzerContext.m");
      uint64_t v20 = (os_log_s *)__pflogFaultLog;
      if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 136315394;
        uint64_t v23 = "/Library/Caches/com.apple.xbs/Sources/Persistence/PFHistoryAnalyzerContext.m";
        __int16 v24 = 1024;
        int v25 = 128;
        _os_log_fault_impl( &dword_186681000,  v20,  OS_LOG_TYPE_FAULT,  "CoreData: Illegal attempt to return an error without one in %s:%d",  buf,  0x12u);
      }
    }

    BOOL v9 = 0;
    v8 = 0LL;
    goto LABEL_4;
  }

  v8 = v7;
  [v7 updateWithChange:a3];
LABEL_3:
  BOOL v9 = 1;
LABEL_4:

  return v9;
}

- (id)analyzerStateForChangedObjectID:(id)a3 error:(id *)a4
{
  return (id)-[NSMutableDictionary objectForKey:](self->_objectIDToState, "objectForKey:", a3, a4);
}

- (id)newAnalyzerStateForChange:(id)a3 error:(id *)a4
{
  objc_super v6 = -[PFHistoryAnalyzerDefaultObjectState initWithOriginalChange:]( objc_alloc(&OBJC_CLASS___PFHistoryAnalyzerDefaultObjectState),  "initWithOriginalChange:",  a3);
  -[NSMutableDictionary setObject:forKey:]( self->_objectIDToState,  "setObject:forKey:",  v6,  [a3 changedObjectID]);
  return v6;
}

- (BOOL)finishProcessing:(id *)a3
{
  id v4 = objc_alloc_init(MEMORY[0x189603FA8]);
  v5 = (void *)objc_msgSend((id)-[NSMutableDictionary allValues](self->_objectIDToState, "allValues"), "mutableCopy");
  unint64_t v6 = [v5 count];
  uint64_t v7 = MEMORY[0x1895F87A8];
  if (v6 < 2)
  {
    if ([v5 count] == 1)
    {
      v8 = (void *)[v5 lastObject];
      options = self->_options;
      if (options)
      {
        if (options->_automaticallyPruneTransientRecords)
        {
          v10 = v8;
          if (![v8 originalChangeType] && objc_msgSend(v10, "finalChangeType") == 2) {
            [v5 removeAllObjects];
          }
        }
      }
    }
  }

  else
  {
    v14[0] = MEMORY[0x1895F87A8];
    v14[1] = 3221225472LL;
    v14[2] = __45__PFHistoryAnalyzerContext_finishProcessing___block_invoke;
    v14[3] = &unk_189EABD18;
    v14[4] = self;
    v14[5] = v4;
    [v5 sortUsingComparator:v14];
    [v5 removeObjectsInArray:v4];
  }

  uint64_t v11 = (NSArray *)[v5 copy];
  self->_sortedStates = v11;
  v13[0] = v7;
  v13[1] = 3221225472LL;
  v13[2] = __45__PFHistoryAnalyzerContext_finishProcessing___block_invoke_2;
  v13[3] = &unk_189EABD40;
  v13[4] = self;
  -[NSArray enumerateObjectsUsingBlock:](v11, "enumerateObjectsUsingBlock:", v13);

  self->_isFinished = 1;
  return 1;
}

uint64_t __45__PFHistoryAnalyzerContext_finishProcessing___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v21 = *MEMORY[0x1895F89C0];
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  __int128 v18 = 0u;
  v19[0] = a2;
  v19[1] = a3;
  unint64_t v6 = (void *)objc_msgSend(MEMORY[0x189603F18], "arrayWithObjects:count:", v19, 2, 0);
  uint64_t v7 = [v6 countByEnumeratingWithState:&v15 objects:v20 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v16;
    do
    {
      for (uint64_t i = 0LL; i != v8; ++i)
      {
        if (*(void *)v16 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void *)(a1 + 32);
        if (v11)
        {
          uint64_t v12 = *(void *)(v11 + 16);
          if (v12)
          {
            if (*(_BYTE *)(v12 + 8))
            {
              uint64_t v13 = *(void **)(*((void *)&v15 + 1) + 8 * i);
              if (![v13 originalChangeType] && objc_msgSend(v13, "finalChangeType") == 2) {
                [*(id *)(a1 + 40) addObject:v13];
              }
            }
          }
        }
      }

      uint64_t v8 = [v6 countByEnumeratingWithState:&v15 objects:v20 count:16];
    }

    while (v8);
  }

  return objc_msgSend( (id)objc_msgSend(a2, "finalTransactionNumber"),  "compare:",  objc_msgSend(a3, "finalTransactionNumber"));
}

void __45__PFHistoryAnalyzerContext_finishProcessing___block_invoke_2()
{
}

- (id)fetchSortedStates:(id *)a3
{
  return self->_sortedStates;
}

@end