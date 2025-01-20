@interface NSStagedMigrationManager
- (BOOL)_shouldAttemptStagedMigrationWithStoreModelVersionChecksum:(id)a3 coordinatorModelVersionChecksum:(id)a4 error:(id *)a5;
- (NSArray)stages;
- (NSPersistentContainer)container;
- (NSStagedMigrationManager)initWithMigrationStages:(NSArray *)stages;
- (int64_t)_findCurrentMigrationStageFromModelChecksum:(id)a3;
- (void)dealloc;
- (void)setContainer:(id)a3;
@end

@implementation NSStagedMigrationManager

- (NSStagedMigrationManager)initWithMigrationStages:(NSArray *)stages
{
  uint64_t v70 = *MEMORY[0x1895F89C0];
  uint64_t v5 = objc_msgSend((id)objc_msgSend(MEMORY[0x189604010], "setWithArray:"), "count");
  if (v5 != -[NSArray count](stages, "count"))
  {

    v39 = (void *)MEMORY[0x189603F70];
    uint64_t v40 = *MEMORY[0x189603A60];
    v41 = @"Duplicate lightweight migration stages detected.";
    uint64_t v42 = 0LL;
LABEL_66:
    objc_exception_throw((id)[v39 exceptionWithName:v40 reason:v41 userInfo:v42]);
    return (NSStagedMigrationManager *)-[NSStagedMigrationManager _findCurrentMigrationStageFromModelChecksum:]( v43,  v44,  v45);
  }

  v50 = self;
  if (!self) {
    goto LABEL_63;
  }
  id v6 = objc_alloc_init(MEMORY[0x189603FC8]);
  id v7 = objc_alloc_init(MEMORY[0x189603FC8]);
  id v8 = objc_alloc_init(MEMORY[0x189603FC8]);
  __int128 v59 = 0u;
  __int128 v60 = 0u;
  __int128 v61 = 0u;
  __int128 v62 = 0u;
  uint64_t v51 = -[NSArray countByEnumeratingWithState:objects:count:]( stages,  "countByEnumeratingWithState:objects:count:",  &v59,  v69,  16LL);
  v49 = stages;
  if (!v51)
  {
    id v27 = 0LL;
    char v26 = 1;
    goto LABEL_42;
  }

  id v48 = 0LL;
  uint64_t v9 = *(void *)v60;
LABEL_5:
  uint64_t v10 = 0LL;
  while (1)
  {
    if (*(void *)v60 != v9) {
      objc_enumerationMutation(stages);
    }
    v11 = *(void **)(*((void *)&v59 + 1) + 8 * v10);
    context = (void *)MEMORY[0x186E3E5D8]();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      __int128 v57 = 0u;
      __int128 v58 = 0u;
      __int128 v55 = 0u;
      __int128 v56 = 0u;
      v12 = (void *)[v11 versionChecksums];
      uint64_t v13 = [v12 countByEnumeratingWithState:&v55 objects:&v65 count:16];
      if (v13)
      {
        uint64_t v14 = v13;
        uint64_t v15 = *(void *)v56;
        uint64_t v47 = v9;
        while (2)
        {
          for (uint64_t i = 0LL; i != v14; ++i)
          {
            if (*(void *)v56 != v15) {
              objc_enumerationMutation(v12);
            }
            uint64_t v17 = *(void *)(*((void *)&v55 + 1) + 8 * i);
            if ([v6 objectForKey:v17]
              || [v7 objectForKey:v17]
              || [v8 objectForKey:v17])
            {
              objc_autoreleasePoolPop(context);
              goto LABEL_37;
            }

            [v6 setObject:v17 forKey:v17];
          }

          uint64_t v14 = [v12 countByEnumeratingWithState:&v55 objects:&v65 count:16];
          stages = v49;
          uint64_t v9 = v47;
          if (v14) {
            continue;
          }
          break;
        }
      }

      goto LABEL_23;
    }

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0) {
      break;
    }
LABEL_23:
    objc_autoreleasePoolPop(context);
LABEL_28:
    if (++v10 == v51)
    {
      uint64_t v25 = -[NSArray countByEnumeratingWithState:objects:count:]( stages,  "countByEnumeratingWithState:objects:count:",  &v59,  v69,  16LL);
      uint64_t v51 = v25;
      if (!v25)
      {
        char v26 = 1;
        goto LABEL_38;
      }

      goto LABEL_5;
    }
  }

  v54 = 0LL;
  objc_msgSend((id)objc_msgSend(v11, "currentModel"), "resolve:", &v54);
  v18 = v54;
  if (v54)
  {
    uint64_t v19 = v9;
    goto LABEL_25;
  }

  uint64_t v19 = v9;
  uint64_t v20 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(v11, "currentModel"), "resolvedModel"), "versionChecksum");
  objc_msgSend((id)objc_msgSend(v11, "nextModel"), "resolve:", &v54);
  v18 = v54;
  if (v54)
  {
LABEL_25:
    id v48 = v18;
    BOOL v21 = 0;
  }

  else
  {
    uint64_t v22 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(v11, "nextModel"), "resolvedModel"), "versionChecksum");
    uint64_t v46 = [v7 objectForKey:v20];
    [v7 setObject:v20 forKey:v20];
    uint64_t v23 = [v8 objectForKey:v22];
    [v8 setObject:v22 forKey:v22];
    if ([v6 objectForKey:v20]
      || (v24 = v22, BOOL v21 = (v23 | v46) == 0, [v6 objectForKey:v24]))
    {
      BOOL v21 = 0;
    }

    stages = v49;
  }

  objc_msgSend((id)objc_msgSend(v11, "currentModel"), "unresolve");
  objc_msgSend((id)objc_msgSend(v11, "nextModel"), "unresolve");
  objc_autoreleasePoolPop(context);
  if (v21)
  {
    uint64_t v9 = v19;
    goto LABEL_28;
  }

- (int64_t)_findCurrentMigrationStageFromModelChecksum:(id)a3
{
  uint64_t v30 = *MEMORY[0x1895F89C0];
  __int128 v23 = 0u;
  __int128 v24 = 0u;
  __int128 v25 = 0u;
  __int128 v26 = 0u;
  stages = self->_stages;
  uint64_t v6 = -[NSArray countByEnumeratingWithState:objects:count:]( stages,  "countByEnumeratingWithState:objects:count:",  &v23,  v29,  16LL);
  int64_t v7 = 0x7FFFFFFFFFFFFFFFLL;
  if (v6)
  {
    uint64_t v8 = v6;
    uint64_t v9 = *(void *)v24;
    while (2)
    {
      for (uint64_t i = 0LL; i != v8; ++i)
      {
        if (*(void *)v24 != v9) {
          objc_enumerationMutation(stages);
        }
        v11 = *(void **)(*((void *)&v23 + 1) + 8 * i);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          if (objc_msgSend((id)objc_msgSend(v11, "versionChecksums"), "indexOfObject:", a3) != 0x7FFFFFFFFFFFFFFFLL) {
            return -[NSArray indexOfObject:](self->_stages, "indexOfObject:", v11);
          }
        }

        else
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            if (objc_msgSend( (id)objc_msgSend((id)objc_msgSend(v11, "currentModel"), "versionChecksum"),  "isEqual:",  a3)) {
              return -[NSArray indexOfObject:](self->_stages, "indexOfObject:", v11);
            }
            if (objc_msgSend( (id)objc_msgSend((id)objc_msgSend(v11, "nextModel"), "versionChecksum"),  "isEqual:",  a3)) {
              return -[NSArray indexOfObject:](self->_stages, "indexOfObject:", v11) + 1;
            }
          }

          else
          {
            uint64_t v12 = [NSString stringWithUTF8String:"I don't know how to handle this type of migration stage %@"];
            uint64_t v13 = objc_opt_class();
            _NSCoreDataLog(17LL, v12, v14, v15, v16, v17, v18, v19, v13);
            uint64_t v20 = (os_log_s *)__pflogFaultLog;
            if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
            {
              uint64_t v21 = objc_opt_class();
              *(_DWORD *)buf = 138412290;
              uint64_t v28 = v21;
              _os_log_fault_impl( &dword_186681000,  v20,  OS_LOG_TYPE_FAULT,  "CoreData: I don't know how to handle this type of migration stage %@",  buf,  0xCu);
            }
          }
        }
      }

      uint64_t v8 = -[NSArray countByEnumeratingWithState:objects:count:]( stages,  "countByEnumeratingWithState:objects:count:",  &v23,  v29,  16LL);
      if (v8) {
        continue;
      }
      break;
    }

    return 0x7FFFFFFFFFFFFFFFLL;
  }

  return v7;
}

- (BOOL)_shouldAttemptStagedMigrationWithStoreModelVersionChecksum:(id)a3 coordinatorModelVersionChecksum:(id)a4 error:(id *)a5
{
  uint64_t v56 = *MEMORY[0x1895F89C0];
  __int128 v43 = 0u;
  __int128 v44 = 0u;
  __int128 v45 = 0u;
  __int128 v46 = 0u;
  obuint64_t j = self->_stages;
  uint64_t v9 = -[NSArray countByEnumeratingWithState:objects:count:]( obj,  "countByEnumeratingWithState:objects:count:",  &v43,  v55,  16LL);
  if (!v9)
  {
    uint64_t v29 = 0x7FFFFFFFFFFFFFFFLL;
    uint64_t v13 = 0x7FFFFFFFFFFFFFFFLL;
    uint64_t v12 = 0x7FFFFFFFFFFFFFFFLL;
    goto LABEL_24;
  }

  uint64_t v10 = v9;
  v39 = a5;
  uint64_t v11 = *(void *)v44;
  uint64_t v12 = 0x7FFFFFFFFFFFFFFFLL;
  NSUInteger v40 = 0x7FFFFFFFFFFFFFFFLL;
  NSUInteger v41 = 0x7FFFFFFFFFFFFFFFLL;
  uint64_t v13 = 0x7FFFFFFFFFFFFFFFLL;
  do
  {
    for (uint64_t i = 0LL; i != v10; ++i)
    {
      if (*(void *)v44 != v11) {
        objc_enumerationMutation(obj);
      }
      uint64_t v15 = *(void **)(*((void *)&v43 + 1) + 8 * i);
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        uint64_t v13 = objc_msgSend((id)objc_msgSend(v15, "versionChecksums"), "indexOfObject:", a3);
        if (v13 != 0x7FFFFFFFFFFFFFFFLL) {
          NSUInteger v40 = -[NSArray indexOfObject:](self->_stages, "indexOfObject:", v15);
        }
        uint64_t v16 = objc_msgSend((id)objc_msgSend(v15, "versionChecksums"), "indexOfObject:", a4);
        uint64_t v12 = 0x7FFFFFFFFFFFFFFFLL;
        if (v16 != 0x7FFFFFFFFFFFFFFFLL)
        {
          uint64_t v17 = v16;
          NSUInteger v41 = -[NSArray indexOfObject:](self->_stages, "indexOfObject:", v15);
          uint64_t v12 = v17;
        }
      }

      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          if (objc_msgSend( (id)objc_msgSend((id)objc_msgSend(v15, "currentModel"), "versionChecksum"),  "isEqual:",  a3)) {
            NSUInteger v40 = -[NSArray indexOfObject:](self->_stages, "indexOfObject:", v15);
          }
          if ((objc_msgSend((id)objc_msgSend((id)objc_msgSend(v15, "currentModel"), "versionChecksum"), "isEqual:", a4) & 1) != 0
            || objc_msgSend( (id)objc_msgSend((id)objc_msgSend(v15, "nextModel"), "versionChecksum"),  "isEqual:",  a4))
          {
            NSUInteger v41 = -[NSArray indexOfObject:](self->_stages, "indexOfObject:", v15);
          }
        }

        else
        {
          uint64_t v18 = [NSString stringWithUTF8String:"I don't know how to handle this type of migration stage %@"];
          uint64_t v19 = objc_opt_class();
          _NSCoreDataLog(17LL, v18, v20, v21, v22, v23, v24, v25, v19);
          __int128 v26 = (os_log_s *)__pflogFaultLog;
          if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
          {
            uint64_t v27 = objc_opt_class();
            *(_DWORD *)buf = 138412290;
            uint64_t v54 = v27;
            _os_log_fault_impl( &dword_186681000,  v26,  OS_LOG_TYPE_FAULT,  "CoreData: I don't know how to handle this type of migration stage %@",  buf,  0xCu);
          }
        }
      }
    }

    uint64_t v10 = -[NSArray countByEnumeratingWithState:objects:count:]( obj,  "countByEnumeratingWithState:objects:count:",  &v43,  v55,  16LL);
  }

  while (v10);
  uint64_t v28 = v41;
  if (v41 == 0x7FFFFFFFFFFFFFFFLL)
  {
    a5 = v39;
    uint64_t v29 = v40;
LABEL_24:
    uint64_t v30 = *MEMORY[0x189607460];
    uint64_t v51 = *MEMORY[0x1896075E0];
    v52 = @"Cannot use staged migration with an unknown coordinator model version.";
    uint64_t v31 = (void *)objc_msgSend( MEMORY[0x189607870],  "errorWithDomain:code:userInfo:",  v30,  134504,  objc_msgSend(MEMORY[0x189603F68], "dictionaryWithObjects:forKeys:count:", &v52, &v51, 1));
    BOOL v32 = 0;
    uint64_t v28 = 0x7FFFFFFFFFFFFFFFLL;
    goto LABEL_26;
  }

  uint64_t v31 = 0LL;
  BOOL v32 = 1;
  a5 = v39;
  uint64_t v29 = v40;
LABEL_26:
  if (v29 == 0x7FFFFFFFFFFFFFFFLL) {
    goto LABEL_35;
  }
  if (v12 == 0x7FFFFFFFFFFFFFFFLL || v13 == 0x7FFFFFFFFFFFFFFFLL)
  {
    if (v28 >= v29) {
      goto LABEL_35;
    }
    unint64_t v33 = (void *)MEMORY[0x189607870];
    uint64_t v34 = *MEMORY[0x189607460];
    uint64_t v49 = *MEMORY[0x1896075E0];
    v50 = @"A store file cannot be migrated backwards with staged migration.";
    uint64_t v35 = (void *)MEMORY[0x189603F68];
    v36 = &v50;
    uint64_t v37 = &v49;
    goto LABEL_34;
  }

  if (v28 <= v29 && v12 < v13)
  {
    unint64_t v33 = (void *)MEMORY[0x189607870];
    uint64_t v34 = *MEMORY[0x189607460];
    uint64_t v47 = *MEMORY[0x1896075E0];
    id v48 = @"A store file cannot be migrated backwards with staged migration.";
    uint64_t v35 = (void *)MEMORY[0x189603F68];
    v36 = &v48;
    uint64_t v37 = &v47;
LABEL_34:
    uint64_t v31 = (void *)objc_msgSend( v33,  "errorWithDomain:code:userInfo:",  v34,  134506,  objc_msgSend(v35, "dictionaryWithObjects:forKeys:count:", v36, v37, 1));
    BOOL v32 = 0;
  }

- (void)dealloc
{
  self->_stages = 0LL;
  self->_container = 0LL;
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___NSStagedMigrationManager;
  -[NSStagedMigrationManager dealloc](&v3, sel_dealloc);
}

- (NSArray)stages
{
  return (NSArray *)objc_getProperty(self, a2, 8LL, 1);
}

- (NSPersistentContainer)container
{
  return (NSPersistentContainer *)objc_getProperty(self, a2, 16LL, 1);
}

- (void)setContainer:(id)a3
{
}

@end