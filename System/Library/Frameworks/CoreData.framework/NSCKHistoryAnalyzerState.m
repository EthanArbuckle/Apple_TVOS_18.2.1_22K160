@interface NSCKHistoryAnalyzerState
+ (NSString)entityPath;
+ (uint64_t)countAnalyzerStatesInStore:(uint64_t)a3 withManagedObjectContext:(id *)a4 error:;
+ (uint64_t)purgeAnalyzedHistoryFromStore:(void *)a3 withManagedObjectContext:(void *)a4 error:;
- (NSDictionary)tombstone;
- (NSManagedObjectID)analyzedObjectID;
- (int64_t)finalChangeType;
- (int64_t)originalChangeType;
- (void)mergeWithState:(id)a3;
- (void)updateWithChange:(id)a3;
@end

@implementation NSCKHistoryAnalyzerState

+ (NSString)entityPath
{
  v2 = (void *)NSString;
  id v3 = +[PFCloudKitMetadataModel ancillaryModelNamespace]( &OBJC_CLASS___PFCloudKitMetadataModel,  "ancillaryModelNamespace");
  v4 = (objc_class *)objc_opt_class();
  return (NSString *)[v2 stringWithFormat:@"%@/%@", v3, NSStringFromClass(v4)];
}

- (NSManagedObjectID)analyzedObjectID
{
  uint64_t v26 = *MEMORY[0x1895F89C0];
  unint64_t v3 = objc_msgSend((id)-[NSCKHistoryAnalyzerState entityId](self, "entityId"), "unsignedLongValue");
  uint64_t v4 = objc_msgSend((id)-[NSCKHistoryAnalyzerState entityPK](self, "entityPK"), "integerValue");
  if (!v3)
  {
    uint64_t v8 = [NSString stringWithUTF8String:"Cannot create objectID: called before the record has the necessary properties: %@"];
    _NSCoreDataLog(17LL, v8, v9, v10, v11, v12, v13, v14, (uint64_t)self);
    v15 = (os_log_s *)__pflogFaultLog;
    if (!os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT)) {
      goto LABEL_8;
    }
    *(_DWORD *)buf = 138412290;
    v25 = self;
    goto LABEL_11;
  }

  uint64_t v5 = v4;
  v6 = -[NSManagedObjectID persistentStore](-[NSManagedObject objectID](self, "objectID"), "persistentStore");
  v7 = (void *)_sqlCoreLookupSQLEntityForEntityID(v6, v3);
  if (v7)
  {
    if (v5 >= 1)
    {
      v7 = (void *)-[NSPersistentStore newObjectIDForEntity:pk:](v6, "newObjectIDForEntity:pk:", v7, v5);
      return (NSManagedObjectID *)v7;
    }

    uint64_t v16 = [NSString stringWithUTF8String:"Cannot create objectID: called before the record has the necessary properties: %@"];
    _NSCoreDataLog(17LL, v16, v17, v18, v19, v20, v21, v22, (uint64_t)self);
    v15 = (os_log_s *)__pflogFaultLog;
    if (!os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
    {
LABEL_8:
      v7 = 0LL;
      return (NSManagedObjectID *)v7;
    }

    *(_DWORD *)buf = 138412290;
    v25 = self;
LABEL_11:
    _os_log_fault_impl( &dword_186681000,  v15,  OS_LOG_TYPE_FAULT,  "CoreData: Cannot create objectID: called before the record has the necessary properties: %@",  buf,  0xCu);
    goto LABEL_8;
  }

  return (NSManagedObjectID *)v7;
}

- (void)mergeWithState:(id)a3
{
  uint64_t v17 = *MEMORY[0x1895F89C0];
  if (objc_msgSend( (id)objc_msgSend(a3, "originalTransactionNumber"),  "compare:",  -[NSCKHistoryAnalyzerState originalTransactionNumber](self, "originalTransactionNumber")) == -1 || objc_msgSend( (id)objc_msgSend(a3, "originalTransactionNumber"),  "compare:",  -[NSCKHistoryAnalyzerState finalTransactionNumber](self, "finalTransactionNumber")) == -1 || objc_msgSend( (id)objc_msgSend(a3, "originalTransactionNumber"),  "compare:",  -[NSCKHistoryAnalyzerState finalTransactionNumber](self, "finalTransactionNumber")) == -1 || objc_msgSend( (id)objc_msgSend(a3, "finalTransactionNumber"),  "compare:",  -[NSCKHistoryAnalyzerState finalTransactionNumber](self, "finalTransactionNumber")) == -1)
  {
    uint64_t v5 = [NSString stringWithUTF8String:"History analysis corruption detected. State is behind (or overlaps) this copy but is attempting to be merged. %@ / %@"];
    _NSCoreDataLog(17LL, v5, v6, v7, v8, v9, v10, v11, (uint64_t)a3);
    uint64_t v12 = (os_log_s *)__pflogFaultLog;
    if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 138412546;
      id v14 = a3;
      __int16 v15 = 2112;
      uint64_t v16 = self;
      _os_log_fault_impl( &dword_186681000,  v12,  OS_LOG_TYPE_FAULT,  "CoreData: History analysis corruption detected. State is behind (or overlaps) this copy but is attempting to be merged. %@ / %@",  buf,  0x16u);
    }
  }

  -[NSManagedObject setValue:forKey:]( self,  "setValue:forKey:",  [a3 finalTransactionNumber],  @"finalTransactionNumber");
  -[NSManagedObject setValue:forKey:]( self,  "setValue:forKey:",  [a3 finalChangeAuthor],  @"finalChangeAuthor");
  -[NSCKHistoryAnalyzerState setFinalChangeTypeNum:]( self,  "setFinalChangeTypeNum:",  objc_msgSend(MEMORY[0x189607968], "numberWithInteger:", objc_msgSend(a3, "finalChangeType")));
}

- (void)updateWithChange:(id)a3
{
}

- (NSDictionary)tombstone
{
  uint64_t v2 = [NSString stringWithUTF8String:"Tombstones aren't supported yet for CloudKit history analysis"];
  _NSCoreDataLog(17LL, v2, v3, v4, v5, v6, v7, v8, v11);
  uint64_t v9 = (os_log_s *)__pflogFaultLog;
  if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
  {
    LOWORD(v11) = 0;
    _os_log_fault_impl( &dword_186681000,  v9,  OS_LOG_TYPE_FAULT,  "CoreData: Tombstones aren't supported yet for CloudKit history analysis",  (uint8_t *)&v11,  2u);
  }

  return 0LL;
}

- (int64_t)originalChangeType
{
  return objc_msgSend( (id)-[NSCKHistoryAnalyzerState originalChangeTypeNum](self, "originalChangeTypeNum"),  "integerValue");
}

- (int64_t)finalChangeType
{
  return objc_msgSend((id)-[NSCKHistoryAnalyzerState finalChangeTypeNum](self, "finalChangeTypeNum"), "integerValue");
}

+ (uint64_t)purgeAnalyzedHistoryFromStore:(void *)a3 withManagedObjectContext:(void *)a4 error:
{
  v23[1] = *MEMORY[0x1895F89C0];
  objc_opt_self();
  uint64_t v18 = 0LL;
  uint64_t v7 = -[NSBatchDeleteRequest initWithFetchRequest:]( objc_alloc(&OBJC_CLASS___NSBatchDeleteRequest),  "initWithFetchRequest:",  +[NSFetchRequest fetchRequestWithEntityName:]( &OBJC_CLASS___NSFetchRequest,  "fetchRequestWithEntityName:",  +[NSCKHistoryAnalyzerState entityPath](&OBJC_CLASS___NSCKHistoryAnalyzerState, "entityPath")));
  -[NSBatchDeleteRequest setResultType:](v7, "setResultType:", 0LL);
  v23[0] = a2;
  -[NSPersistentStoreRequest setAffectedStores:]( v7,  "setAffectedStores:",  [MEMORY[0x189603F18] arrayWithObjects:v23 count:1]);
  uint64_t v8 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(a3, "executeRequest:error:", v7, &v18), "result"), "BOOLValue");

  if ((v8 & 1) == 0)
  {
    if (v18)
    {
      if (a4) {
        *a4 = v18;
      }
    }

    else
    {
      uint64_t v9 = [NSString stringWithUTF8String:"Illegal attempt to return an error without one in %s:%d"];
      _NSCoreDataLog( 17LL,  v9,  v10,  v11,  v12,  v13,  v14,  v15,  (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Persistence/NSCKHistoryAnalyzerState.m");
      uint64_t v16 = (os_log_s *)__pflogFaultLog;
      if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 136315394;
        uint64_t v20 = "/Library/Caches/com.apple.xbs/Sources/Persistence/NSCKHistoryAnalyzerState.m";
        __int16 v21 = 1024;
        int v22 = 161;
        _os_log_fault_impl( &dword_186681000,  v16,  OS_LOG_TYPE_FAULT,  "CoreData: Illegal attempt to return an error without one in %s:%d",  buf,  0x12u);
      }
    }
  }

  return v8;
}

+ (uint64_t)countAnalyzerStatesInStore:(uint64_t)a3 withManagedObjectContext:(id *)a4 error:
{
  v11[1] = *MEMORY[0x1895F89C0];
  objc_opt_self();
  objc_opt_self();
  uint64_t v7 = +[NSFetchRequest fetchRequestWithEntityName:]( &OBJC_CLASS___NSFetchRequest,  "fetchRequestWithEntityName:",  +[NSCKHistoryAnalyzerState entityPath](&OBJC_CLASS___NSCKHistoryAnalyzerState, "entityPath"));
  v11[0] = a2;
  -[NSFetchRequest setAffectedStores:]( v7,  "setAffectedStores:",  [MEMORY[0x189603F18] arrayWithObjects:v11 count:1]);
  -[NSFetchRequest setPredicate:](v7, "setPredicate:", 0LL);
  -[NSFetchRequest setResultType:](v7, "setResultType:", 4LL);
  if (a3)
  {
    -[NSManagedObjectContext _countForFetchRequest_:error:](a3, v7, a4);
    uint64_t v9 = v8;
    if (v8 == 0x7FFFFFFFFFFFFFFFLL) {
      return 0LL;
    }
  }

  else
  {
    uint64_t v9 = 0LL;
  }

  return [MEMORY[0x189607968] numberWithUnsignedInteger:v9];
}

@end