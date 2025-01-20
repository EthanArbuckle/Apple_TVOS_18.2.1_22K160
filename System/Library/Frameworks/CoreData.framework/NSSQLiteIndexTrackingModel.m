@interface NSSQLiteIndexTrackingModel
+ (id)ancillaryModelNamespace;
+ (id)newModelForFrameworkVersion:;
+ (unint64_t)ancillaryEntityOffset;
+ (void)_invalidateStaticCaches;
+ (void)initialize;
+ (void)updateIndexStatistics:(uint64_t)a3 usingConnection:(void *)a4 model:;
@end

@implementation NSSQLiteIndexTrackingModel

+ (void)initialize
{
  if ((id)objc_opt_class() == a1) {
    objc_opt_self();
  }
}

+ (void)_invalidateStaticCaches
{
  _MergedGlobals_84 = 0LL;
}

+ (id)newModelForFrameworkVersion:
{
  uint64_t v0 = objc_opt_self();
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = __58__NSSQLiteIndexTrackingModel_newModelForFrameworkVersion___block_invoke;
  block[3] = &unk_189EA7758;
  block[4] = v0;
  if (qword_18C4ABB18 != -1) {
    dispatch_once(&qword_18C4ABB18, block);
  }
  return (id)_MergedGlobals_84;
}

uint64_t __58__NSSQLiteIndexTrackingModel_newModelForFrameworkVersion___block_invoke(uint64_t a1)
{
  v7[4] = *MEMORY[0x1895F89C0];
  v2 = objc_alloc_init(&OBJC_CLASS___NSEntityDescription);
  v3 = (objc_class *)objc_opt_self();
  -[NSEntityDescription setName:](v2, "setName:", NSStringFromClass(v3));
  v7[0] = makeAttribute((uint64_t)@"indexName", 700LL);
  v7[1] = makeAttribute((uint64_t)@"executionCount", 300LL);
  v7[2] = makeAttribute((uint64_t)@"instructionCount", 300LL);
  v7[3] = makeAttribute((uint64_t)@"rowCount", 300LL);
  -[NSEntityDescription setProperties:]( v2,  "setProperties:",  [MEMORY[0x189603F18] arrayWithObjects:v7 count:4]);
  _MergedGlobals_84 = objc_alloc_init(&OBJC_CLASS___NSManagedObjectModel);
  objc_msgSend( (id)_MergedGlobals_84,  "_setModelsReferenceIDOffset:",  objc_msgSend(*(id *)(a1 + 32), "ancillaryEntityOffset"));
  v6 = v2;
  uint64_t v4 = [MEMORY[0x189603F18] arrayWithObjects:&v6 count:1];
  [(id)_MergedGlobals_84 setEntities:v4];
  return [(id)_MergedGlobals_84 _setIsEditable:0];
}

+ (void)updateIndexStatistics:(uint64_t)a3 usingConnection:(void *)a4 model:
{
  uint64_t v37 = *MEMORY[0x1895F89C0];
  objc_opt_self();
  if (a4) {
    a4 = (void *)a4[3];
  }
  v6 = (objc_class *)objc_opt_class();
  v7 = (id *)[a4 objectForKeyedSubscript:NSStringFromClass(v6)];
  v8 = v7;
  if (v7)
  {
    uint64_t v28 = [v7 tableName];
    uint64_t v9 = objc_msgSend((id)objc_msgSend(v8[5], "objectForKey:", @"executionCount"), "columnName");
    uint64_t v10 = objc_msgSend((id)objc_msgSend(v8[5], "objectForKey:", @"rowCount"), "columnName");
    uint64_t v11 = objc_msgSend((id)objc_msgSend(v8[5], "objectForKey:", @"instructionCount"), "columnName");
    uint64_t v27 = objc_msgSend((id)objc_msgSend(v8[5], "objectForKey:", @"indexName"), "columnName");
    __int128 v33 = 0u;
    __int128 v34 = 0u;
    __int128 v31 = 0u;
    __int128 v32 = 0u;
    v12 = (void *)[a2 allValues];
    uint64_t v13 = [v12 countByEnumeratingWithState:&v31 objects:v36 count:16];
    if (v13)
    {
      id obj = v12;
      uint64_t v26 = *(void *)v32;
      do
      {
        uint64_t v30 = v13;
        for (uint64_t i = 0LL; i != v30; ++i)
        {
          if (*(void *)v32 != v26) {
            objc_enumerationMutation(obj);
          }
          v15 = -[NSSQLiteStatement initWithEntity:sqlString:]( [NSSQLiteStatement alloc],  "initWithEntity:sqlString:",  0,  [NSString stringWithFormat:@"UPDATE OR IGNORE %@ SET %@ = %@ + %lld, %@ = %@ + %lld, %@ = %@ + %lld WHERE %@ = '%@'", v28, v9, v9, objc_msgSend(*(id *)(*((void *)&v31 + 1) + 8 * i), "executionCount"), v10, v10, objc_msgSend(*(id *)(*((void *)&v31 + 1) + 8 * i), "rowCount"), v11, v11, objc_msgSend(*(id *)(*((void *)&v31 + 1) + 8 * i), "instructionCount"), v27, objc_msgSend( (id)objc_msgSend(*(id *)(*((void *)&v31 + 1) + 8 * i), "indexName"), "uppercaseString")]);
          -[NSSQLiteConnection prepareAndExecuteSQLStatement:](a3, v15);
        }

        uint64_t v13 = [obj countByEnumeratingWithState:&v31 objects:v36 count:16];
      }

      while (v13);
    }
  }

  else
  {
    uint64_t v16 = [NSString stringWithUTF8String:"Couldn't find NSSQLiteIndexStatistics entity"];
    _NSCoreDataLog(17LL, v16, v17, v18, v19, v20, v21, v22, v24);
    v23 = (os_log_s *)__pflogFaultLog;
    if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_fault_impl( &dword_186681000,  v23,  OS_LOG_TYPE_FAULT,  "CoreData: Couldn't find NSSQLiteIndexStatistics entity",  buf,  2u);
    }
  }
}

+ (unint64_t)ancillaryEntityOffset
{
  return 18000LL;
}

+ (id)ancillaryModelNamespace
{
  return @"SQLiteIndexTracking";
}

@end