@interface _NSXPCStoreUtilities
+ (_PFResultArray)_decodeBufferResultSetData:(void *)a3 forFetchRequest:(uint64_t)a4 options:(uint64_t)a5 store:(uint64_t)a6 context:(uint64_t)a7 rowCacheRows:(uint64_t *)a8 error:;
+ (id)_decodeResultSetData:(NSFetchRequest *)a3 forFetchRequest:(uint64_t)a4 options:(NSPersistentStore *)a5 store:(NSManagedObjectContext *)a6 context:(void *)a7 rowCacheRows:(void *)a8 error:;
+ (id)newSecureArchivedDataWithRootObject:(uint64_t)a1;
+ (uint64_t)classesForErrorArchive;
+ (uint64_t)classesForFetchArchive;
+ (uint64_t)classesForSaveArchive;
+ (uint64_t)decodeSecureArchivedData:(uint64_t)a3 usingDelegate:(uint64_t)a4 classes:;
+ (uint64_t)newUserInfoFromException:(uint64_t)a1;
+ (void)logMessage:(uint64_t)a3 forComponent:(uint64_t)a4;
@end

@implementation _NSXPCStoreUtilities

+ (uint64_t)classesForFetchArchive
{
  if (!classesForFetchArchive_archiveClasses)
  {
    id v0 = objc_alloc(MEMORY[0x189603FE0]);
    uint64_t v1 = objc_opt_class();
    uint64_t v2 = objc_opt_class();
    uint64_t v3 = objc_opt_class();
    uint64_t v4 = objc_opt_class();
    uint64_t v5 = objc_opt_class();
    uint64_t v6 = objc_opt_class();
    uint64_t v7 = objc_opt_class();
    uint64_t v8 = objc_opt_class();
    uint64_t v9 = objc_opt_class();
    v10 = (void *)objc_msgSend(v0, "initWithObjects:", v1, v2, v3, v4, v5, v6, v7, v8, v9, objc_opt_class(), 0);
    Class v11 = NSClassFromString((NSString *)@"_NSPredicateUtilities");
    objc_msgSend( v10,  "unionSet:",  -[objc_class _compoundPredicateClassesForSecureCoding]( NSClassFromString((NSString *)@"_NSPredicateUtilities"),  "_compoundPredicateClassesForSecureCoding"));
    objc_msgSend( v10,  "unionSet:",  -[objc_class _extendedExpressionClassesForSecureCoding](v11, "_extendedExpressionClassesForSecureCoding"));
    objc_msgSend( v10,  "unionSet:",  -[objc_class _operatorClassesForSecureCoding](v11, "_operatorClassesForSecureCoding"));
    objc_msgSend( v10,  "unionSet:",  -[objc_class _constantValueClassesForSecureCoding](v11, "_constantValueClassesForSecureCoding"));
    [v10 addObject:NSClassFromString((NSString *)@"NSBoundedByPredicateOperator")];
    objc_msgSend( v10,  "addObjectsFromArray:",  +[NSKnownKeysDictionary classesForArchiving](NSKnownKeysDictionary, "classesForArchiving"));
    Class v12 = NSClassFromString((NSString *)@"_NSXPCStoreObjectIDArrayConstantValueExpression");
    if (v12) {
      [v10 addObject:v12];
    }
    v13 = (void *)[objc_alloc(MEMORY[0x189604010]) initWithSet:v10];

    while (!__ldaxr((unint64_t *)&classesForFetchArchive_archiveClasses))
    {
    }

    __clrex();
  }

  return classesForFetchArchive_archiveClasses;
}

+ (id)newSecureArchivedDataWithRootObject:(uint64_t)a1
{
  uint64_t v3 = (void *)[objc_alloc(MEMORY[0x1896078F8]) initRequiringSecureCoding:1];
  [v3 setDelegate:objc_opt_class()];
  [v3 encodeObject:a2 forKey:@"root"];
  [v3 finishEncoding];
  id v4 = (id)[v3 encodedData];

  return v4;
}

+ (uint64_t)classesForSaveArchive
{
  if (!classesForSaveArchive_archiveClasses)
  {
    id v21 = objc_alloc(MEMORY[0x189603FE0]);
    uint64_t v20 = objc_opt_class();
    uint64_t v19 = objc_opt_class();
    uint64_t v18 = objc_opt_class();
    uint64_t v17 = objc_opt_class();
    uint64_t v16 = objc_opt_class();
    uint64_t v15 = objc_opt_class();
    uint64_t v14 = objc_opt_class();
    uint64_t v0 = objc_opt_class();
    uint64_t v1 = objc_opt_class();
    uint64_t v2 = objc_opt_class();
    uint64_t v3 = objc_opt_class();
    uint64_t v4 = objc_opt_class();
    uint64_t v5 = objc_opt_class();
    uint64_t v6 = objc_opt_class();
    uint64_t v7 = objc_opt_class();
    uint64_t v8 = objc_opt_class();
    uint64_t v9 = objc_opt_class();
    v10 = (void *)objc_msgSend( v21,  "initWithObjects:",  v20,  v19,  v18,  v17,  v16,  v15,  v14,  v0,  v1,  v2,  v3,  v4,  v5,  v6,  v7,  v8,  v9,  objc_opt_class(),  0);
    objc_msgSend( v10,  "addObjectsFromArray:",  +[NSKnownKeysDictionary classesForArchiving](NSKnownKeysDictionary, "classesForArchiving"));
    objc_msgSend( v10,  "unionSet:",  -[objc_class _constantValueClassesForSecureCoding]( NSClassFromString((NSString *)@"_NSPredicateUtilities"),  "_constantValueClassesForSecureCoding"));
    Class v11 = (void *)[objc_alloc(MEMORY[0x189604010]) initWithSet:v10];

    while (!__ldaxr((unint64_t *)&classesForSaveArchive_archiveClasses))
    {
    }

    __clrex();
  }

  return classesForSaveArchive_archiveClasses;
}

+ (void)logMessage:(uint64_t)a3 forComponent:(uint64_t)a4
{
  if (a2) {
    NSLog( (NSString *)@"%@",  [NSString stringWithFormat:@"CoreData: XPC: %@", a2]);
  }
  else {
    _NSCoreDataLog( 8LL,  (uint64_t)@"Someone tried to log something but failed because they didn't tell me what to log.",  v10,  v11,  v12,  v13,  v14,  v15,  a9);
  }
}

+ (uint64_t)classesForErrorArchive
{
  if (!classesForErrorArchive_archiveClasses)
  {
    id v0 = objc_alloc(MEMORY[0x189603FE0]);
    uint64_t v1 = objc_opt_class();
    uint64_t v2 = objc_opt_class();
    uint64_t v3 = (void *)objc_msgSend(v0, "initWithObjects:", v1, v2, objc_opt_class(), 0);
    [v3 unionSet:+[_NSXPCStoreUtilities classesForSaveArchive]()];
    [v3 unionSet:+[_NSXPCStoreUtilities classesForFetchArchive]()];
    uint64_t v4 = (void *)[objc_alloc(MEMORY[0x189604010]) initWithSet:v3];

    while (!__ldaxr((unint64_t *)&classesForErrorArchive_archiveClasses))
    {
    }

    __clrex();
  }

  return classesForErrorArchive_archiveClasses;
}

+ (uint64_t)decodeSecureArchivedData:(uint64_t)a3 usingDelegate:(uint64_t)a4 classes:
{
  uint64_t v7 = (void *)[objc_alloc(MEMORY[0x189607908]) initForReadingFromData:a2 error:0];
  [v7 setDelegate:a3];
  uint64_t v8 = [v7 decodeObjectOfClasses:a4 forKey:@"root"];

  return v8;
}

+ (uint64_t)newUserInfoFromException:(uint64_t)a1
{
  id v3 = objc_alloc_init(MEMORY[0x189603FC8]);
  objc_msgSend(v3, "setValue:forKey:", objc_msgSend(a2, "name"), @"exception name");
  objc_msgSend(v3, "setValue:forKey:", objc_msgSend(a2, "reason"), @"exception reason");
  if (objc_msgSend((id)objc_msgSend(a2, "userInfo"), "valueForKey:", @"NSSQLiteErrorDomain")) {
    objc_msgSend( v3,  "setObject:forKey:",  objc_msgSend((id)objc_msgSend(a2, "userInfo"), "valueForKey:", @"NSSQLiteErrorDomain"),  @"NSSQLiteErrorDomain");
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0) {
    [v3 setValue:MEMORY[0x189604A88] forKey:@"controlled exception"];
  }
  _NSCoreDataLog(8LL, (uint64_t)@"Error: Exception raised: %@", v4, v5, v6, v7, v8, v9, (uint64_t)a2);
  uint64_t v10 = [a2 callStackSymbols];
  _NSCoreDataLog(8LL, (uint64_t)@"Error: Callstack: %@", v11, v12, v13, v14, v15, v16, v10);
  uint64_t v17 = [a2 userInfo];
  _NSCoreDataLog(8LL, (uint64_t)@"Error: UserInfo: %@", v18, v19, v20, v21, v22, v23, v17);
  uint64_t v24 = objc_msgSend(objc_alloc(MEMORY[0x189603F68]), "initWithObjectsAndKeys:", v3, @"exception info", 0);

  return v24;
}

+ (_PFResultArray)_decodeBufferResultSetData:(void *)a3 forFetchRequest:(uint64_t)a4 options:(uint64_t)a5 store:(uint64_t)a6 context:(uint64_t)a7 rowCacheRows:(uint64_t *)a8 error:
{
  uint64_t v72 = *MEMORY[0x1895F89C0];
  objc_opt_self();
  unint64_t v12 = [a2 bytes];
  unint64_t v13 = [a2 length];
  if (v13 <= 7)
  {
    uint64_t v14 = objc_msgSend( MEMORY[0x189607870],  "errorWithDomain:code:userInfo:",  *MEMORY[0x189607460],  134060,  objc_msgSend( MEMORY[0x189603F68],  "dictionaryWithObject:forKey:",  @"CoreData: XPC: Suspect response from server (bad size)",  @"Reason"));
    if (!v14)
    {
      uint64_t v15 = [NSString stringWithUTF8String:"Illegal attempt to return an error without one in %s:%d"];
      _NSCoreDataLog( 17LL,  v15,  v16,  v17,  v18,  v19,  v20,  v21,  (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Persistence/XPCStore/_NSXPCStoreUtilities.m");
      uint64_t v22 = (os_log_s *)__pflogFaultLog;
      if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 136315394;
        v69 = "/Library/Caches/com.apple.xbs/Sources/Persistence/XPCStore/_NSXPCStoreUtilities.m";
        __int16 v70 = 1024;
        int v71 = 1290;
LABEL_50:
        _os_log_fault_impl( &dword_186681000,  v22,  OS_LOG_TYPE_FAULT,  "CoreData: Illegal attempt to return an error without one in %s:%d",  buf,  0x12u);
        return 0LL;
      }

      return 0LL;
    }

    goto LABEL_12;
  }

  if (v12 >= v12 + v13)
  {
    uint64_t v14 = objc_msgSend( MEMORY[0x189607870],  "errorWithDomain:code:userInfo:",  *MEMORY[0x189607460],  134060,  objc_msgSend( MEMORY[0x189603F68],  "dictionaryWithObject:forKey:",  @"CoreData: XPC: Suspect response from server (no result)",  @"Reason"));
    if (!v14)
    {
      uint64_t v31 = [NSString stringWithUTF8String:"Illegal attempt to return an error without one in %s:%d"];
      _NSCoreDataLog( 17LL,  v31,  v32,  v33,  v34,  v35,  v36,  v37,  (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Persistence/XPCStore/_NSXPCStoreUtilities.m");
      uint64_t v22 = (os_log_s *)__pflogFaultLog;
      if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 136315394;
        v69 = "/Library/Caches/com.apple.xbs/Sources/Persistence/XPCStore/_NSXPCStoreUtilities.m";
        __int16 v70 = 1024;
        int v71 = 1306;
        goto LABEL_50;
      }

      return 0LL;
    }

    goto LABEL_12;
  }

  if (*(void *)v12 == 1LL)
  {
    if (v13 <= 0x13)
    {
      uint64_t v14 = objc_msgSend( MEMORY[0x189607870],  "errorWithDomain:code:userInfo:",  *MEMORY[0x189607460],  134060,  objc_msgSend( MEMORY[0x189603F68],  "dictionaryWithObject:forKey:",  @"CoreData: XPC: Suspect response from server (missing size)",  @"Reason"));
      if (!v14)
      {
        uint64_t v23 = [NSString stringWithUTF8String:"Illegal attempt to return an error without one in %s:%d"];
        _NSCoreDataLog( 17LL,  v23,  v24,  v25,  v26,  v27,  v28,  v29,  (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Persistence/XPCStore/_NSXPCStoreUtilities.m");
        uint64_t v22 = (os_log_s *)__pflogFaultLog;
        if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
        {
          *(_DWORD *)buf = 136315394;
          v69 = "/Library/Caches/com.apple.xbs/Sources/Persistence/XPCStore/_NSXPCStoreUtilities.m";
          __int16 v70 = 1024;
          int v71 = 1319;
          goto LABEL_50;
        }

        return 0LL;
      }

+ (id)_decodeResultSetData:(NSFetchRequest *)a3 forFetchRequest:(uint64_t)a4 options:(NSPersistentStore *)a5 store:(NSManagedObjectContext *)a6 context:(void *)a7 rowCacheRows:(void *)a8 error:
{
  v354[2] = *MEMORY[0x1895F89C0];
  objc_opt_self();
  unint64_t v15 = [a2 bytes];
  unint64_t v16 = [a2 length];
  if (v16 <= 7)
  {
    if (!a8) {
      return 0LL;
    }
    uint64_t v17 = (void *)MEMORY[0x189607870];
    uint64_t v18 = *MEMORY[0x189607460];
    uint64_t v19 = (void *)MEMORY[0x189603F68];
    uint64_t v20 = @"CoreData: XPC: Suspect response from server (bad size)";
    goto LABEL_11;
  }

  if (v15 >= v15 + v16)
  {
    if (!a8) {
      return 0LL;
    }
    uint64_t v17 = (void *)MEMORY[0x189607870];
    uint64_t v18 = *MEMORY[0x189607460];
    uint64_t v19 = (void *)MEMORY[0x189603F68];
    uint64_t v20 = @"CoreData: XPC: Suspect response from server (no result)";
    goto LABEL_11;
  }

  if (*(void *)v15 != 1LL) {
    return (id)NSArray_EmptyArray;
  }
  if (v16 <= 0x13)
  {
    if (!a8) {
      return 0LL;
    }
    uint64_t v17 = (void *)MEMORY[0x189607870];
    uint64_t v18 = *MEMORY[0x189607460];
    uint64_t v19 = (void *)MEMORY[0x189603F68];
    uint64_t v20 = @"CoreData: XPC: Suspect response from server (missing size)";
    goto LABEL_11;
  }

  if (!*(_DWORD *)(v15 + 16)) {
    return (id)NSArray_EmptyArray;
  }
  if (v16 - 16 <= 0x6F)
  {
    if (!a8) {
      return 0LL;
    }
    uint64_t v17 = (void *)MEMORY[0x189607870];
    uint64_t v18 = *MEMORY[0x189607460];
    uint64_t v19 = (void *)MEMORY[0x189603F68];
    uint64_t v20 = @"CoreData: XPC: Suspect response from server (not enough room for fetch results header)";
    goto LABEL_11;
  }

  *(double *)(v15 + 40) = (double)(unint64_t)*(double *)(v15 + 40);
  *(void *)(v15 + 96) = v15 + 128;
  uint64_t v26 = *(unsigned int *)(v15 + 52);
  if ((uint64_t)(v16 - 128) < 8 * ((v26 + 1) + v26))
  {
    if (!a8) {
      return 0LL;
    }
    uint64_t v17 = (void *)MEMORY[0x189607870];
    uint64_t v18 = *MEMORY[0x189607460];
    uint64_t v19 = (void *)MEMORY[0x189603F68];
    uint64_t v20 = @"CoreData: XPC: Suspect response from server (not enough room for buffers and sizes)";
LABEL_11:
    uint64_t v21 = [v19 dictionaryWithObject:v20 forKey:@"Reason"];
    uint64_t v22 = v17;
    uint64_t v23 = v18;
    goto LABEL_12;
  }

  uint64_t v27 = v15 + 128 + 8 * v26 + 8;
  *(void *)(v15 + 104) = v27;
  if ((_DWORD)v26)
  {
    uint64_t v28 = 0LL;
    uint64_t v29 = 8 * v26;
    uint64_t v30 = v27 + v29;
    do
    {
      *(void *)(*(void *)(v15 + 96) + v28) = v15 + *(void *)(v30 + v28);
      v28 += 8LL;
    }

    while (v29 != v28);
    uint64_t v31 = **(void **)(v15 + 96);
    *(void *)(v15 + 112) = v31;
    *(void *)(v15 + 120) = v31;
  }

  unint64_t v323 = v15 + v16;
  v313 = a7;
  *(_DWORD *)(v15 + 80) |= 2u;
  if (*(_DWORD *)(v15 + 36) >> 30) {
    unsigned int v32 = 0;
  }
  else {
    unsigned int v32 = *(_DWORD *)(v15 + 36);
  }
  uint64_t v33 = PF_ALLOCATE_OBJECT_ARRAY((int)v32);
  if (v33) {
    uint64_t v34 = v32;
  }
  else {
    uint64_t v34 = 0LL;
  }
  uint64_t v321 = v34;
  v322 = v33;
  Initialize = fetchPlanAllocateInitialize(a3, a5, a6);
  if (-[NSFetchRequest resultType](a3, "resultType") != 2
    && (-[NSFetchRequest resultType](a3, "resultType")
     || !-[NSArray count](-[NSFetchRequest propertiesToFetch](a3, "propertiesToFetch"), "count")))
  {
    v324 = (uint64_t *)a5;
    int v333 = 0;
    v337 = 0LL;
    propertyMapping = 0LL;
    unint64_t plan_for_entity = 0LL;
    id v316 = 0LL;
    v43 = 0LL;
    goto LABEL_42;
  }

  uint64_t v36 = objc_opt_class();
  uint64_t v37 = objc_opt_class();
  v38 = a5;
  if (v36 != v37) {
    v38 = (NSPersistentStore *)-[NSPersistentStore sqlCore](a5, "sqlCore");
  }
  uint64_t v39 = v38;
  if (!v39)
  {
    if (!a8) {
      return 0LL;
    }
    v349[0] = @"Reason";
    v349[1] = @"FetchRequest";
    v350[0] = @"CoreData: XPC: Store is missing core";
    if (a3) {
      v74 = -[NSFetchRequest description](a3, "description");
    }
    else {
      v74 = @"no fetch request";
    }
    v350[1] = v74;
    uint64_t v21 = [MEMORY[0x189603F68] dictionaryWithObjects:v350 forKeys:v349 count:2];
    uint64_t v22 = (void *)MEMORY[0x189607870];
    uint64_t v23 = *MEMORY[0x189607460];
LABEL_12:
    uint64_t v24 = 0LL;
    *a8 = [v22 errorWithDomain:v23 code:134060 userInfo:v21];
    return (id)v24;
  }

  size_t v40 = v39;
  v41 = (void *)-[NSFetchRequest copy](a3, "copy");
  [v41 setPredicate:0];
  v337 = (_PFFetchPlanHeader *)v40;
  v42 = (void *)-[NSSQLiteAdapter newSelectStatementWithFetchRequest:ignoreInheritance:]( -[NSPersistentStore adapter](v40, "adapter"),  v41,  0LL);
  if (!v42)
  {
    v68 = v337;
    if (a8)
    {
      v353[0] = @"Reason";
      v353[1] = @"FetchRequest";
      v354[0] = @"CoreData: XPC: Suspect fetch request failed to generate statement";
      if (v41) {
        v92 = (const __CFString *)[v41 description];
      }
      else {
        v92 = @"no fetch request";
      }
      v354[1] = v92;
      uint64_t v240 = [MEMORY[0x189603F68] dictionaryWithObjects:v354 forKeys:v353 count:2];
      *a8 = [MEMORY[0x189607870] errorWithDomain:*MEMORY[0x189607460] code:134060 userInfo:v240];
    }

    if (Initialize) {

    }
    goto LABEL_371;
  }

  v43 = (unint64_t *)v42[6];
  if (!v43)
  {
    v68 = v337;
    if (a8)
    {
      v105 = v42;
      v351[0] = @"Reason";
      v351[1] = @"FetchRequest";
      v352[0] = @"CoreData: XPC: Suspect statement generated - entity missing";
      if (v41) {
        v106 = (const __CFString *)[v41 description];
      }
      else {
        v106 = @"no fetch request";
      }
      v352[1] = v106;
      uint64_t v260 = [MEMORY[0x189603F68] dictionaryWithObjects:v352 forKeys:v351 count:2];
      *a8 = [MEMORY[0x189607870] errorWithDomain:*MEMORY[0x189607460] code:134060 userInfo:v260];
      v42 = v105;
    }

    if (Initialize)
    {
      v261 = v42;

      v42 = v261;
    }

LABEL_371:
    goto LABEL_372;
  }

  v324 = (uint64_t *)a5;
  id v316 = v42;
  Initialize->statement_entity = (NSSQLEntity *)v43;
  *(_DWORD *)&Initialize->flags &= ~1u;
  unint64_t plan_for_entity = _sql_read_only_fetch_plan_for_entity(v43);
  statement_entity = Initialize->statement_entity;
  if (statement_entity) {
    propertyMapping = statement_entity->_propertyMapping;
  }
  else {
    propertyMapping = 0LL;
  }

  int v333 = 1;
LABEL_42:
  v336 = (int *)plan_for_entity;
  uint64_t v46 = [v324 model];
  uint64_t v47 = v46;
  if (v46) {
    int v48 = *(_DWORD *)(v46 + 60);
  }
  else {
    int v48 = 0;
  }
  v320 = Initialize;
  uint64_t v49 = [v43 model];
  v304 = a6;
  if (v49) {
    int v50 = *(_DWORD *)(v49 + 60);
  }
  else {
    int v50 = 0;
  }
  if (v48 != v50)
  {
    __int128 v344 = 0u;
    __int128 v345 = 0u;
    __int128 v342 = 0u;
    __int128 v343 = 0u;
    v340 = (__CFString *)-[_PFFetchPlanHeader ancillarySQLModels](v337, "ancillarySQLModels");
    uint64_t v58 = -[__CFString countByEnumeratingWithState:objects:count:]( v340,  "countByEnumeratingWithState:objects:count:",  &v342,  v348,  16LL);
    if (!v58) {
      goto LABEL_66;
    }
    uint64_t v59 = v58;
    uint64_t v60 = *(void *)v343;
    while (1)
    {
      uint64_t v61 = 0LL;
      do
      {
        if (*(void *)v343 != v60) {
          objc_enumerationMutation(v340);
        }
        uint64_t v47 = objc_msgSend( (id)-[_PFFetchPlanHeader ancillarySQLModels](v337, "ancillarySQLModels"),  "objectForKeyedSubscript:",  *(void *)(*((void *)&v342 + 1) + 8 * v61));
        uint64_t v62 = [v43 model];
        if (v62)
        {
          __int128 v63 = &OBJC_IVAR____NSPersistentHistoryToken__storeTokens;
          int v64 = *(_DWORD *)(v62 + 60);
          if (v47) {
            goto LABEL_59;
          }
        }

        else
        {
          int v64 = 0;
          __int128 v63 = &OBJC_IVAR____NSPersistentHistoryToken__storeTokens;
          if (v47)
          {
LABEL_59:
            int v65 = *(_DWORD *)(v47 + v63[80]);
            goto LABEL_60;
          }
        }

        int v65 = 0;
LABEL_60:
        if (v64 == v65) {
          goto LABEL_47;
        }
        ++v61;
      }

      while (v59 != v61);
      uint64_t v66 = -[__CFString countByEnumeratingWithState:objects:count:]( v340,  "countByEnumeratingWithState:objects:count:",  &v342,  v348,  16LL);
      uint64_t v59 = v66;
      if (!v66)
      {
LABEL_66:
        v67 = v43;
        v68 = v320;
        v69 = v337;
        if (a8)
        {
          v347[0] = @"CoreData: XPC: Unable to find entity in model";
          v346[0] = @"Reason";
          v346[1] = @"EntityOffset";
          __int16 v70 = (void *)MEMORY[0x189607968];
          uint64_t v71 = [v67 model];
          if (v71) {
            uint64_t v72 = *(unsigned int *)(v71 + 60);
          }
          else {
            uint64_t v72 = 0LL;
          }
          v347[1] = [v70 numberWithUnsignedInt:v72];
          uint64_t v73 = [MEMORY[0x189603F68] dictionaryWithObjects:v347 forKeys:v346 count:2];
          *a8 = [MEMORY[0x189607870] errorWithDomain:*MEMORY[0x189607460] code:134060 userInfo:v73];
        }

        if (!v68) {
          return 0LL;
        }
LABEL_372:

        return 0LL;
      }
    }
  }

@end