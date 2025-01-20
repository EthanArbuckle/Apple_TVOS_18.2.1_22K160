@interface MLDDatabaseIntegrityCheckOperation
- (MLDDatabaseIntegrityCheck)check;
- (MLDDatabaseIntegrityCheckOperation)initWithDatabasePath:(id)a3 repairFaults:(BOOL)a4;
- (NSError)error;
- (NSString)databasePath;
- (id)_createSQLiteErrorWithCode:(int)a3 description:(id)a4;
- (void)main;
@end

@implementation MLDDatabaseIntegrityCheckOperation

- (MLDDatabaseIntegrityCheckOperation)initWithDatabasePath:(id)a3 repairFaults:(BOOL)a4
{
  id v6 = a3;
  v11.receiver = self;
  v11.super_class = (Class)&OBJC_CLASS___MLDDatabaseIntegrityCheckOperation;
  v7 = -[MLDDatabaseIntegrityCheckOperation init](&v11, "init");
  if (v7)
  {
    id v8 = [v6 copy];
    v9 = *(void **)&v7->super._private1;
    *(void *)&v7->super._private1 = v8;

    LOBYTE(v7->super._private) = a4;
  }

  return v7;
}

- (void)main
{
  v2 = self;
  ppDb = 0LL;
  uint64_t v3 = sqlite3_open_v2( (const char *)[*(id *)&self->super._private1 fileSystemRepresentation],  &ppDb,  16777218,  0);
  if ((_DWORD)v3)
  {
    id v4 = (id)objc_claimAutoreleasedReturnValue( -[MLDDatabaseIntegrityCheckOperation _createSQLiteErrorWithCode:description:]( v2,  "_createSQLiteErrorWithCode:description:",  v3,  @"failed to open DB file"));
  }

  else
  {
    v5 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
    uint64_t v6 = sqlite3_exec( ppDb,  "pragma integrity_check",  (int (__cdecl *)(void *, int, char **, char **))sub_100015334,  v5,  0LL);
    if ((_DWORD)v6)
    {
      id v4 = (id)objc_claimAutoreleasedReturnValue( -[MLDDatabaseIntegrityCheckOperation _createSQLiteErrorWithCode:description:]( v2,  "_createSQLiteErrorWithCode:description:",  v6,  @"failed to collect integrity check results"));
    }

    else
    {
      v42 = v2;
      v43 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
      v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSRegularExpression regularExpressionWithPattern:options:error:]( &OBJC_CLASS___NSRegularExpression,  "regularExpressionWithPattern:options:error:",  @"index (\\w+)",  0LL,  0LL));
      __int128 v49 = 0u;
      __int128 v50 = 0u;
      __int128 v51 = 0u;
      __int128 v52 = 0u;
      v41 = v5;
      id v8 = v5;
      id v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v8,  "countByEnumeratingWithState:objects:count:",  &v49,  v59,  16LL);
      if (v9)
      {
        id v10 = v9;
        uint64_t v11 = *(void *)v50;
        v12 = (objc_class *)&selRef_endTransaction_shouldCommit_withCompletionHandler_;
        do
        {
          for (i = 0LL; i != v10; i = (char *)i + 1)
          {
            if (*(void *)v50 != v11) {
              objc_enumerationMutation(v8);
            }
            v14 = *(void **)(*((void *)&v49 + 1) + 8LL * (void)i);
            if (([v14 isEqualToString:@"ok"] & 1) == 0)
            {
              v15 = (void *)objc_claimAutoreleasedReturnValue( objc_msgSend( v7,  "firstMatchInString:options:range:",  v14,  0,  0,  objc_msgSend(v14, "length")));
              v16 = v15;
              if (v15 && (unint64_t)[v15 numberOfRanges] >= 2)
              {
                v17 = v8;
                v18 = v12;
                v19 = v7;
                id v20 = [v16 rangeAtIndex:1];
                v22 = (MLDIndexIntegrityFault *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "substringWithRange:", v20, v21));
                v23 = -[MLDIndexIntegrityFault initWithIndex:]( objc_alloc(&OBJC_CLASS___MLDIndexIntegrityFault),  "initWithIndex:",  v22);
                v24 = os_log_create("com.apple.amp.medialibraryd", "Default");
                if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
                {
                  *(_DWORD *)buf = 138543362;
                  v55 = v23;
                  _os_log_impl( (void *)&_mh_execute_header,  v24,  OS_LOG_TYPE_DEFAULT,  "[DatabaseIntegrityCheck] Encountered index fault: %{public}@",  buf,  0xCu);
                }

                -[NSMutableArray addObject:](v43, "addObject:", v23);
                v7 = v19;
                v12 = v18;
                id v8 = v17;
              }

              else
              {
                v22 = (MLDIndexIntegrityFault *)[objc_alloc(v12 + 220) initWithFaultString:v14];
                v25 = os_log_create("com.apple.amp.medialibraryd", "Default");
                if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
                {
                  *(_DWORD *)buf = 138543362;
                  v55 = v22;
                  _os_log_impl( (void *)&_mh_execute_header,  v25,  OS_LOG_TYPE_DEFAULT,  "[DatabaseIntegrityCheck] Encountered unknown fault: %{public}@",  buf,  0xCu);
                }

                -[NSMutableArray addObject:](v43, "addObject:", v22);
              }
            }
          }

          id v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v8,  "countByEnumeratingWithState:objects:count:",  &v49,  v59,  16LL);
        }

        while (v10);
      }

      v26 = os_log_create("com.apple.amp.medialibraryd", "Default");
      if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
      {
        v27 = (MLDIndexIntegrityFault *)-[NSMutableArray count](v43, "count");
        *(_DWORD *)buf = 134217984;
        v55 = v27;
        _os_log_impl( (void *)&_mh_execute_header,  v26,  OS_LOG_TYPE_DEFAULT,  "Integrity check found %lu faults with database file",  buf,  0xCu);
      }

      v2 = v42;
      if (LOBYTE(v42->super._private))
      {
        __int128 v47 = 0u;
        __int128 v48 = 0u;
        __int128 v45 = 0u;
        __int128 v46 = 0u;
        v28 = v43;
        id v29 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v28,  "countByEnumeratingWithState:objects:count:",  &v45,  v58,  16LL);
        if (v29)
        {
          id v30 = v29;
          id v4 = 0LL;
          uint64_t v31 = *(void *)v46;
          while (2)
          {
            v32 = 0LL;
            v33 = v4;
            do
            {
              if (*(void *)v46 != v31) {
                objc_enumerationMutation(v28);
              }
              v34 = *(MLDIndexIntegrityFault **)(*((void *)&v45 + 1) + 8LL * (void)v32);
              id v44 = v33;
              unsigned __int8 v35 = -[MLDIndexIntegrityFault attemptRecoveryUsingHandle:withError:]( v34,  "attemptRecoveryUsingHandle:withError:",  ppDb,  &v44);
              id v4 = v44;

              if ((v35 & 1) == 0)
              {
                v37 = os_log_create("com.apple.amp.medialibraryd", "Default");
                if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
                {
                  *(_DWORD *)buf = 138543618;
                  v55 = v34;
                  __int16 v56 = 2114;
                  id v57 = v4;
                  _os_log_impl( (void *)&_mh_execute_header,  v37,  OS_LOG_TYPE_DEFAULT,  "Failed to repair integrity fault %{public}@. err=%{public}@",  buf,  0x16u);
                }

                goto LABEL_40;
              }

              v32 = (char *)v32 + 1;
              v33 = v4;
            }

            while (v30 != v32);
            id v30 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v28,  "countByEnumeratingWithState:objects:count:",  &v45,  v58,  16LL);
            if (v30) {
              continue;
            }
            break;
          }

          os_log_t v36 = sub_1000037E0();
          v28 = (NSMutableArray *)objc_claimAutoreleasedReturnValue(v36);
          v5 = v41;
          if (os_log_type_enabled((os_log_t)v28, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)v28,  OS_LOG_TYPE_DEFAULT,  "Successfully repaired integrity faults",  buf,  2u);
          }
        }

        else
        {
          id v4 = 0LL;
LABEL_40:
          v5 = v41;
        }
      }

      else
      {
        id v4 = 0LL;
        v5 = v41;
      }

      v38 = objc_alloc_init(&OBJC_CLASS___MLDDatabaseIntegrityCheck);
      v39 = *(void **)&v42->_repairFaults;
      *(void *)&v42->_repairFaults = v38;

      [*(id *)&v42->_repairFaults setDatabasePath:*(void *)&v42->super._private1];
      [*(id *)&v42->_repairFaults setFaults:v43];
    }
  }

  if (ppDb)
  {
    sqlite3_close_v2(ppDb);
    ppDb = 0LL;
  }

  databasePath = v2->_databasePath;
  v2->_databasePath = (NSString *)v4;
}

- (id)_createSQLiteErrorWithCode:(int)a3 description:(id)a4
{
  uint64_t v4 = a3;
  NSErrorUserInfoKey v9 = NSLocalizedDescriptionKey;
  id v10 = a4;
  id v5 = a4;
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v10,  &v9,  1LL));
  v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"NSSQLiteErrorDomain",  v4,  v6));

  return v7;
}

- (NSString)databasePath
{
  return *(NSString **)&self->super._private1;
}

- (MLDDatabaseIntegrityCheck)check
{
  return *(MLDDatabaseIntegrityCheck **)&self->_repairFaults;
}

- (NSError)error
{
  return (NSError *)self->_databasePath;
}

- (void).cxx_destruct
{
}

@end