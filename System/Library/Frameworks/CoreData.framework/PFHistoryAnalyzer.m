@interface PFHistoryAnalyzer
- (BOOL)processTransaction:(id)a3 withContext:(id)a4 error:(id *)a5;
- (PFHistoryAnalyzer)init;
- (PFHistoryAnalyzer)initWithOptions:(id)a3;
- (id)instantiateNewAnalyzerContextForChangesInStore:(id)a3;
- (uint64_t)newAnalyzerContextForStore:(uint64_t)a3 sinceLastHistoryToken:(void *)a4 inManagedObjectContext:(void *)a5 error:;
- (void)dealloc;
@end

@implementation PFHistoryAnalyzer

- (PFHistoryAnalyzer)init
{
  return -[PFHistoryAnalyzer initWithOptions:](self, "initWithOptions:", 0LL);
}

- (PFHistoryAnalyzer)initWithOptions:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS___PFHistoryAnalyzer;
  v4 = -[PFHistoryAnalyzer init](&v7, sel_init);
  if (v4)
  {
    if (a3) {
      v5 = (PFHistoryAnalyzerOptions *)[a3 copy];
    }
    else {
      v5 = objc_alloc_init(&OBJC_CLASS___PFHistoryAnalyzerOptions);
    }
    v4->_options = v5;
  }

  return v4;
}

- (void)dealloc
{
  self->_options = 0LL;
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___PFHistoryAnalyzer;
  -[PFHistoryAnalyzer dealloc](&v3, sel_dealloc);
}

- (uint64_t)newAnalyzerContextForStore:(uint64_t)a3 sinceLastHistoryToken:(void *)a4 inManagedObjectContext:(void *)a5 error:
{
  uint64_t v38 = *MEMORY[0x1895F89C0];
  if (!a1) {
    return 0LL;
  }
  uint64_t v28 = 0LL;
  v29 = &v28;
  uint64_t v30 = 0x3052000000LL;
  v31 = __Block_byref_object_copy__51;
  v32 = __Block_byref_object_dispose__51;
  uint64_t v33 = 0LL;
  uint64_t v24 = 0LL;
  v25 = &v24;
  uint64_t v26 = 0x2020000000LL;
  char v27 = 1;
  uint64_t v18 = 0LL;
  v19 = &v18;
  uint64_t v20 = 0x3052000000LL;
  v21 = __Block_byref_object_copy__51;
  v22 = __Block_byref_object_dispose__51;
  uint64_t v23 = 0LL;
  v17[0] = MEMORY[0x1895F87A8];
  v17[1] = 3221225472LL;
  v17[2] = __99__PFHistoryAnalyzer_newAnalyzerContextForStore_sinceLastHistoryToken_inManagedObjectContext_error___block_invoke;
  v17[3] = &unk_189EAAE80;
  v17[4] = a1;
  v17[5] = a3;
  v17[6] = a2;
  v17[7] = a4;
  v17[8] = &v18;
  v17[9] = &v28;
  v17[10] = &v24;
  [a4 performBlockAndWait:v17];
  if (!*((_BYTE *)v25 + 24))
  {

    v19[5] = 0LL;
    id v8 = (id)v29[5];
    if (v8)
    {
      if (a5) {
        *a5 = v8;
      }
    }

    else
    {
      uint64_t v9 = [NSString stringWithUTF8String:"Illegal attempt to return an error without one in %s:%d"];
      _NSCoreDataLog( 17LL,  v9,  v10,  v11,  v12,  v13,  v14,  v15,  (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Persistence/PFHistoryAnalyzer.m");
      v16 = (os_log_s *)__pflogFaultLog;
      if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 136315394;
        v35 = "/Library/Caches/com.apple.xbs/Sources/Persistence/PFHistoryAnalyzer.m";
        __int16 v36 = 1024;
        int v37 = 133;
        _os_log_fault_impl( &dword_186681000,  v16,  OS_LOG_TYPE_FAULT,  "CoreData: Illegal attempt to return an error without one in %s:%d",  buf,  0x12u);
      }
    }
  }

  v29[5] = 0LL;
  uint64_t v6 = v19[5];
  _Block_object_dispose(&v18, 8);
  _Block_object_dispose(&v24, 8);
  _Block_object_dispose(&v28, 8);
  return v6;
}

void __99__PFHistoryAnalyzer_newAnalyzerContextForStore_sinceLastHistoryToken_inManagedObjectContext_error___block_invoke( uint64_t a1)
{
  v37[1] = *MEMORY[0x1895F89C0];
  v35[0] = 0LL;
  uint64_t v2 = *(void *)(*(void *)(a1 + 32) + 8LL);
  if (v2)
  {
    uint64_t v3 = *(void *)(v2 + 16);
    if (!v3) {
      uint64_t v3 = 20LL;
    }
  }

  else
  {
    uint64_t v3 = 20LL;
  }

  uint64_t v28 = v3;
  id v29 = *(id *)(a1 + 40);
  char v4 = 1;
  while ((v4 & 1) != 0)
  {
    v5 = (void *)MEMORY[0x186E3E5D8]();
    uint64_t v6 = +[NSPersistentHistoryChangeRequest fetchHistoryAfterToken:]( &OBJC_CLASS___NSPersistentHistoryChangeRequest,  "fetchHistoryAfterToken:",  v29);
    -[NSPersistentHistoryChangeRequest setFetchBatchSize:](v6, "setFetchBatchSize:", 20LL);
    -[NSPersistentHistoryChangeRequest setFetchLimit:](v6, "setFetchLimit:", v28);
    -[NSPersistentHistoryChangeRequest setUseQueryGenerationToken:](v6, "setUseQueryGenerationToken:", 1LL);
    -[NSPersistentHistoryChangeRequest setResultType:](v6, "setResultType:", 5LL);
    v37[0] = *(void *)(a1 + 48);
    -[NSPersistentStoreRequest setAffectedStores:]( v6,  "setAffectedStores:",  [MEMORY[0x189603F18] arrayWithObjects:v37 count:1]);
    objc_super v7 = (void *)[*(id *)(a1 + 56) executeRequest:v6 error:v35];
    if (v7)
    {
      if (!*(void *)(*(void *)(*(void *)(a1 + 64) + 8LL) + 40LL)) {
        *(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40) = [*(id *)(a1 + 32) instantiateNewAnalyzerContextForChangesInStore:*(void *)(a1 + 48)];
      }
      __int128 v33 = 0u;
      __int128 v34 = 0u;
      __int128 v31 = 0u;
      __int128 v32 = 0u;
      id v8 = (void *)[v7 result];
      uint64_t v9 = [v8 countByEnumeratingWithState:&v31 objects:v36 count:16];
      if (v9)
      {
        uint64_t v10 = *(void *)v32;
LABEL_11:
        uint64_t v11 = 0LL;
        while (1)
        {
          if (*(void *)v32 != v10) {
            objc_enumerationMutation(v8);
          }
          uint64_t v12 = *(void *)(*((void *)&v31 + 1) + 8 * v11);
          uint64_t v13 = (void *)MEMORY[0x186E3E5D8]();
          int v14 = [*(id *)(a1 + 32) processTransaction:v12 withContext:*(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40) error:*(void *)(*(void *)(a1 + 72) + 8) + 40];
          if ((v14 & 1) == 0)
          {
            if (!*(void *)(*(void *)(*(void *)(a1 + 72) + 8LL) + 40LL))
            {
              uint64_t v15 = [NSString stringWithUTF8String:"History transaction processing failed but didn't return an error"];
              _NSCoreDataLog(17LL, v15, v16, v17, v18, v19, v20, v21, v27);
              v22 = (os_log_s *)__pflogFaultLog;
              if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
              {
                *(_WORD *)buf = 0;
                _os_log_fault_impl( &dword_186681000,  v22,  OS_LOG_TYPE_FAULT,  "CoreData: History transaction processing failed but didn't return an error",  buf,  2u);
              }
            }

            *(_BYTE *)(*(void *)(*(void *)(a1 + 80) + 8LL) + 24LL) = 0;
            id v23 = *(id *)(*(void *)(*(void *)(a1 + 72) + 8LL) + 40LL);
          }

          objc_autoreleasePoolPop(v13);
          if (!v14) {
            break;
          }
          if (v9 == ++v11)
          {
            uint64_t v9 = [v8 countByEnumeratingWithState:&v31 objects:v36 count:16];
            if (v9) {
              goto LABEL_11;
            }
            break;
          }
        }
      }

      if (!*(_BYTE *)(*(void *)(*(void *)(a1 + 80) + 8LL) + 24LL)
        || (uint64_t v24 = *(void *)(*(void *)(a1 + 32) + 8LL)) != 0 && *(void *)(v24 + 16)
        || objc_msgSend((id)objc_msgSend(v7, "result"), "count") != v28)
      {
        char v4 = 0;
      }

      else
      {

        char v4 = 1;
        id v29 = (id)objc_msgSend((id)objc_msgSend((id)objc_msgSend(v7, "result"), "lastObject"), "token");
      }
    }

    else
    {
      *(_BYTE *)(*(void *)(*(void *)(a1 + 80) + 8LL) + 24LL) = 0;
      char v4 = 0;
      *(void *)(*(void *)(*(void *)(a1 + 72) + 8LL) + 40LL) = v35[0];
    }

    objc_autoreleasePoolPop(v5);
  }

  if (*(_BYTE *)(*(void *)(*(void *)(a1 + 80) + 8LL) + 24LL))
  {
    v25 = (void *)MEMORY[0x186E3E5D8]();
    if (([*(id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40) finishProcessing:*(void *)(*(void *)(a1 + 72) + 8) + 40] & 1) == 0)
    {
      *(_BYTE *)(*(void *)(*(void *)(a1 + 80) + 8LL) + 24LL) = 0;
      id v26 = *(id *)(*(void *)(*(void *)(a1 + 72) + 8LL) + 40LL);
    }

    objc_autoreleasePoolPop(v25);
  }
}

- (id)instantiateNewAnalyzerContextForChangesInStore:(id)a3
{
  return -[PFHistoryAnalyzerContext initWithOptions:]( objc_alloc(&OBJC_CLASS___PFHistoryAnalyzerContext),  "initWithOptions:",  self->_options);
}

- (BOOL)processTransaction:(id)a3 withContext:(id)a4 error:(id *)a5
{
  return [a4 processTransaction:a3 error:a5];
}

@end