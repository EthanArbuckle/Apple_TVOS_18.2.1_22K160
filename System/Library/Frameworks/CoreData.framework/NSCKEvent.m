@interface NSCKEvent
+ (NSString)entityPath;
+ (uint64_t)beginEventForRequest:(uint64_t)a3 withMonitor:(void *)a4 error:;
+ (uint64_t)finishEventForResult:(uint64_t)a3 withMonitor:(void *)a4 error:;
@end

@implementation NSCKEvent

+ (NSString)entityPath
{
  v2 = (void *)NSString;
  id v3 = +[PFCloudKitMetadataModel ancillaryModelNamespace]( &OBJC_CLASS___PFCloudKitMetadataModel,  "ancillaryModelNamespace");
  v4 = (objc_class *)objc_opt_class();
  return (NSString *)[v2 stringWithFormat:@"%@/%@", v3, NSStringFromClass(v4)];
}

+ (uint64_t)beginEventForRequest:(uint64_t)a3 withMonitor:(void *)a4 error:
{
  uint64_t v35 = *MEMORY[0x1895F89C0];
  objc_opt_self();
  uint64_t v25 = 0LL;
  v26 = &v25;
  uint64_t v27 = 0x3052000000LL;
  v28 = __Block_byref_object_copy__10;
  v29 = __Block_byref_object_dispose__10;
  uint64_t v30 = 0LL;
  uint64_t v19 = 0LL;
  v20 = &v19;
  uint64_t v21 = 0x3052000000LL;
  v22 = __Block_byref_object_copy__10;
  v23 = __Block_byref_object_dispose__10;
  uint64_t v24 = 0LL;
  v18[0] = MEMORY[0x1895F87A8];
  v18[1] = 3221225472LL;
  v18[2] = __52__NSCKEvent_beginEventForRequest_withMonitor_error___block_invoke;
  v18[3] = &unk_189EA7A60;
  v18[4] = a3;
  v18[5] = a2;
  v18[6] = &v25;
  v18[7] = &v19;
  -[PFCloudKitStoreMonitor performBlock:](a3, (uint64_t)v18);
  if (!v26[5])
  {
    id v9 = (id)v20[5];
    if (v9)
    {
      if (a4) {
        *a4 = v9;
      }
    }

    else
    {
      uint64_t v10 = [NSString stringWithUTF8String:"Illegal attempt to return an error without one in %s:%d"];
      _NSCoreDataLog( 17LL,  v10,  v11,  v12,  v13,  v14,  v15,  v16,  (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Persistence/NSCKEvent.m");
      v17 = (os_log_s *)__pflogFaultLog;
      if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 136315394;
        v32 = "/Library/Caches/com.apple.xbs/Sources/Persistence/NSCKEvent.m";
        __int16 v33 = 1024;
        int v34 = 92;
        _os_log_fault_impl( &dword_186681000,  v17,  OS_LOG_TYPE_FAULT,  "CoreData: Illegal attempt to return an error without one in %s:%d",  buf,  0x12u);
      }
    }
  }

  v20[5] = 0LL;
  uint64_t v7 = v26[5];
  _Block_object_dispose(&v19, 8);
  _Block_object_dispose(&v25, 8);
  return v7;
}

void __52__NSCKEvent_beginEventForRequest_withMonitor_error___block_invoke(uint64_t a1)
{
  v10[1] = *MEMORY[0x1895F89C0];
  v2 = (void *)-[PFCloudKitStoreMonitor retainedMonitoredStore](*(void *)(a1 + 32));
  if (v2)
  {
    id v3 = -[PFCloudKitStoreMonitor newBackgroundContextForMonitoredCoordinator](*(void *)(a1 + 32));
    -[NSManagedObjectContext setTransactionAuthor:]( v3,  "setTransactionAuthor:",  @"NSCloudKitMirroringDelegate.event");
    v7[0] = MEMORY[0x1895F87A8];
    v7[1] = 3221225472LL;
    v7[2] = __52__NSCKEvent_beginEventForRequest_withMonitor_error___block_invoke_2;
    v7[3] = &unk_189EA7960;
    uint64_t v4 = *(void *)(a1 + 40);
    v7[4] = v3;
    v7[5] = v4;
    v7[6] = v2;
    __int128 v8 = *(_OWORD *)(a1 + 48);
    -[NSManagedObjectContext performBlockAndWait:](v3, "performBlockAndWait:", v7);
  }

  else
  {
    id v5 = objc_alloc(MEMORY[0x189607870]);
    uint64_t v6 = *MEMORY[0x189607460];
    uint64_t v9 = *MEMORY[0x1896075F0];
    v10[0] = [NSString stringWithFormat:@"Request '%@' was cancelled because the store was removed from the coordinator.", objc_msgSend(*(id *)(a1 + 40), "requestIdentifier")];
    *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) = objc_msgSend( v5,  "initWithDomain:code:userInfo:",  v6,  134407,  objc_msgSend( MEMORY[0x189603F68],  "dictionaryWithObjects:forKeys:count:",  v10,  &v9,  1));
  }
}

NSPersistentCloudKitContainerEvent *__52__NSCKEvent_beginEventForRequest_withMonitor_error___block_invoke_2( uint64_t a1)
{
  uint64_t v19 = *MEMORY[0x1895F89C0];
  id v16 = 0LL;
  v2 = +[NSEntityDescription insertNewObjectForEntityForName:inManagedObjectContext:]( &OBJC_CLASS___NSEntityDescription,  "insertNewObjectForEntityForName:inManagedObjectContext:",  +[NSCKEvent entityPath](&OBJC_CLASS___NSCKEvent, "entityPath"),  *(void *)(a1 + 32));
  -[NSManagedObject setEventIdentifier:](v2, "setEventIdentifier:", [*(id *)(a1 + 40) requestIdentifier]);
  uint64_t v3 = *(void *)(a1 + 40);
  objc_opt_self();
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  uint64_t v5 = 0LL;
  if ((isKindOfClass & 1) == 0)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      uint64_t v5 = 1LL;
    }

    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        uint64_t v5 = 2LL;
      }

      else
      {
        uint64_t v6 = [NSString stringWithUTF8String:"Cannot create persistent event for request: %@"];
        _NSCoreDataLog(17LL, v6, v7, v8, v9, v10, v11, v12, v3);
        uint64_t v13 = (os_log_s *)__pflogFaultLog;
        if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
        {
          *(_DWORD *)buf = 138412290;
          uint64_t v18 = v3;
          _os_log_fault_impl( &dword_186681000,  v13,  OS_LOG_TYPE_FAULT,  "CoreData: Cannot create persistent event for request: %@",  buf,  0xCu);
        }

        uint64_t v5 = 0LL;
      }
    }
  }

  -[NSManagedObject setCloudKitEventType:](v2, "setCloudKitEventType:", v5);
  -[NSManagedObject setStartedAt:](v2, "setStartedAt:", [MEMORY[0x189603F50] date]);
  [*(id *)(a1 + 32) assignObject:v2 toPersistentStore:*(void *)(a1 + 48)];
  if ([*(id *)(a1 + 32) save:&v16])
  {
    result = -[NSPersistentCloudKitContainerEvent initWithCKEvent:]( objc_alloc(&OBJC_CLASS___NSPersistentCloudKitContainerEvent),  "initWithCKEvent:",  v2);
    uint64_t v15 = *(void *)(a1 + 56);
  }

  else
  {
    result = (NSPersistentCloudKitContainerEvent *)v16;
    uint64_t v15 = *(void *)(a1 + 64);
  }

  *(void *)(*(void *)(v15 + 8) + 40LL) = result;
  return result;
}

+ (uint64_t)finishEventForResult:(uint64_t)a3 withMonitor:(void *)a4 error:
{
  uint64_t v35 = *MEMORY[0x1895F89C0];
  objc_opt_self();
  uint64_t v25 = 0LL;
  v26 = &v25;
  uint64_t v27 = 0x3052000000LL;
  v28 = __Block_byref_object_copy__10;
  v29 = __Block_byref_object_dispose__10;
  uint64_t v30 = 0LL;
  uint64_t v19 = 0LL;
  v20 = &v19;
  uint64_t v21 = 0x3052000000LL;
  v22 = __Block_byref_object_copy__10;
  v23 = __Block_byref_object_dispose__10;
  uint64_t v24 = 0LL;
  v18[0] = MEMORY[0x1895F87A8];
  v18[1] = 3221225472LL;
  v18[2] = __52__NSCKEvent_finishEventForResult_withMonitor_error___block_invoke;
  v18[3] = &unk_189EA7A60;
  v18[4] = a3;
  v18[5] = a2;
  v18[6] = &v25;
  v18[7] = &v19;
  -[PFCloudKitStoreMonitor performBlock:](a3, (uint64_t)v18);
  if (!v26[5])
  {
    id v9 = (id)v20[5];
    if (v9)
    {
      if (a4) {
        *a4 = v9;
      }
    }

    else
    {
      uint64_t v10 = [NSString stringWithUTF8String:"Illegal attempt to return an error without one in %s:%d"];
      _NSCoreDataLog( 17LL,  v10,  v11,  v12,  v13,  v14,  v15,  v16,  (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Persistence/NSCKEvent.m");
      v17 = (os_log_s *)__pflogFaultLog;
      if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 136315394;
        v32 = "/Library/Caches/com.apple.xbs/Sources/Persistence/NSCKEvent.m";
        __int16 v33 = 1024;
        int v34 = 149;
        _os_log_fault_impl( &dword_186681000,  v17,  OS_LOG_TYPE_FAULT,  "CoreData: Illegal attempt to return an error without one in %s:%d",  buf,  0x12u);
      }
    }
  }

  v20[5] = 0LL;
  uint64_t v7 = v26[5];
  _Block_object_dispose(&v19, 8);
  _Block_object_dispose(&v25, 8);
  return v7;
}

void __52__NSCKEvent_finishEventForResult_withMonitor_error___block_invoke(uint64_t a1)
{
  v9[1] = *MEMORY[0x1895F89C0];
  v2 = (void *)-[PFCloudKitStoreMonitor retainedMonitoredStore](*(void *)(a1 + 32));
  if (v2)
  {
    uint64_t v3 = -[PFCloudKitStoreMonitor newBackgroundContextForMonitoredCoordinator](*(void *)(a1 + 32));
    -[NSManagedObjectContext setTransactionAuthor:]( v3,  "setTransactionAuthor:",  @"NSCloudKitMirroringDelegate.event");
    v6[0] = MEMORY[0x1895F87A8];
    v6[1] = 3221225472LL;
    v6[2] = __52__NSCKEvent_finishEventForResult_withMonitor_error___block_invoke_2;
    v6[3] = &unk_189EA7960;
    v6[4] = *(void *)(a1 + 40);
    v6[5] = v2;
    v6[6] = v3;
    __int128 v7 = *(_OWORD *)(a1 + 48);
    -[NSManagedObjectContext performBlockAndWait:](v3, "performBlockAndWait:", v6);
  }

  else
  {
    id v4 = objc_alloc(MEMORY[0x189607870]);
    uint64_t v5 = *MEMORY[0x189607460];
    uint64_t v8 = *MEMORY[0x1896075F0];
    v9[0] = [NSString stringWithFormat:@"Request '%@' was cancelled because the store was removed from the coordinator.", objc_msgSend((id)objc_msgSend(*(id *)(a1 + 40), "request"), "requestIdentifier")];
    *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) = objc_msgSend( v4,  "initWithDomain:code:userInfo:",  v5,  134407,  objc_msgSend( MEMORY[0x189603F68],  "dictionaryWithObjects:forKeys:count:",  v9,  &v8,  1));
  }
}

void __52__NSCKEvent_finishEventForResult_withMonitor_error___block_invoke_2(uint64_t a1)
{
  v35[1] = *MEMORY[0x1895F89C0];
  v30[0] = 0LL;
  uint64_t v2 = objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "request"), "requestIdentifier");
  uint64_t v4 = *(void *)(a1 + 40);
  uint64_t v3 = *(void **)(a1 + 48);
  objc_opt_self();
  uint64_t v5 = +[NSFetchRequest fetchRequestWithEntityName:]( &OBJC_CLASS___NSFetchRequest,  "fetchRequestWithEntityName:",  +[NSCKEvent entityPath](&OBJC_CLASS___NSCKEvent, "entityPath"));
  -[NSFetchRequest setPredicate:]( v5,  "setPredicate:",  [MEMORY[0x1896079C8] predicateWithFormat:@"eventIdentifier = %@", v2]);
  v35[0] = v4;
  -[NSFetchRequest setAffectedStores:]( v5,  "setAffectedStores:",  [MEMORY[0x189603F18] arrayWithObjects:v35 count:1]);
  uint64_t v6 = (void *)[v3 executeFetchRequest:v5 error:v30];
  __int128 v7 = v6;
  if (v6)
  {
    if ((unint64_t)[v6 count] >= 2)
    {
      uint64_t v8 = [NSString stringWithUTF8String:"Found multiple NSPersistentCloudKitContainerEvents for the identifier '%@'"];
      _NSCoreDataLog(17LL, v8, v9, v10, v11, v12, v13, v14, v2);
      uint64_t v15 = (os_log_s *)__pflogFaultLog;
      if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 138412290;
        uint64_t v32 = v2;
        _os_log_fault_impl( &dword_186681000,  v15,  OS_LOG_TYPE_FAULT,  "CoreData: Found multiple NSPersistentCloudKitContainerEvents for the identifier '%@'",  buf,  0xCu);
      }
    }

    uint64_t v16 = (void *)[v7 lastObject];
    if (v16)
    {
      objc_msgSend(v16, "setEndedAt:", objc_msgSend(MEMORY[0x189603F50], "date"));
      objc_msgSend(v16, "setSucceeded:", objc_msgSend(*(id *)(a1 + 32), "success"));
      objc_msgSend(v16, "setErrorDomain:", objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "error"), "domain"));
      objc_msgSend(v16, "setErrorCode:", objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "error"), "code"));
      if ([*(id *)(a1 + 48) save:v30])
      {
        v17 = -[NSPersistentCloudKitContainerEvent initWithCKEvent:]( objc_alloc(&OBJC_CLASS___NSPersistentCloudKitContainerEvent),  "initWithCKEvent:",  v16);
        uint64_t v18 = *(void *)(a1 + 56);
LABEL_12:
        *(void *)(*(void *)(v18 + 8) + 40LL) = v17;
        return;
      }

@end