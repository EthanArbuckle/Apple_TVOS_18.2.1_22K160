@interface RMMigrationEngine
- (BOOL)_migrateWithActions:(id)a3 error:(id *)a4;
- (BOOL)_writeProcessedActions:(id)a3 error:(id *)a4;
- (BOOL)migrateOnStartupReturningError:(id *)a3;
- (BOOL)migrateWithCoreDataReturningError:(id *)a3;
- (id)_coreDataActions;
- (id)_fixFilePermissionsAndReadDataForURL:(id)a3;
- (id)_readMigrationStateReturningError:(id *)a3;
- (id)_readProcessedActionsReturningError:(id *)a3;
- (id)_startupActions;
@end

@implementation RMMigrationEngine

- (BOOL)migrateOnStartupReturningError:(id *)a3
{
  v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[RMLog migrationEngine](&OBJC_CLASS___RMLog, "migrationEngine"));
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v9 = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Starting to migrate on startup", v9, 2u);
  }

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[RMMigrationEngine _startupActions](self, "_startupActions"));
  BOOL v7 = -[RMMigrationEngine _migrateWithActions:error:](self, "_migrateWithActions:error:", v6, a3);

  return v7;
}

- (BOOL)migrateWithCoreDataReturningError:(id *)a3
{
  v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[RMLog migrationEngine](&OBJC_CLASS___RMLog, "migrationEngine"));
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v9 = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Starting to migrate with CoreData", v9, 2u);
  }

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[RMMigrationEngine _coreDataActions](self, "_coreDataActions"));
  BOOL v7 = -[RMMigrationEngine _migrateWithActions:error:](self, "_migrateWithActions:error:", v6, a3);

  return v7;
}

- (BOOL)_migrateWithActions:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v56 = 0LL;
  v43 = self;
  BOOL v7 = (void *)objc_claimAutoreleasedReturnValue( -[RMMigrationEngine _readProcessedActionsReturningError:]( self,  "_readProcessedActionsReturningError:",  &v56));
  id v8 = v56;
  id v9 = v8;
  if (v7)
  {
    v40 = a4;
    v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableSet setWithCapacity:]( NSMutableSet,  "setWithCapacity:",  [v7 count]));
    __int128 v52 = 0u;
    __int128 v53 = 0u;
    __int128 v54 = 0u;
    __int128 v55 = 0u;
    v41 = v7;
    id v11 = v7;
    id v12 = [v11 countByEnumeratingWithState:&v52 objects:v62 count:16];
    if (v12)
    {
      id v13 = v12;
      uint64_t v14 = *(void *)v53;
      do
      {
        for (i = 0LL; i != v13; i = (char *)i + 1)
        {
          if (*(void *)v53 != v14) {
            objc_enumerationMutation(v11);
          }
          v16 = (void *)objc_claimAutoreleasedReturnValue( [*(id *)(*((void *)&v52 + 1) + 8 * (void)i) objectForKeyedSubscript:@"Identifier"]);
          [v10 addObject:v16];
        }

        id v13 = [v11 countByEnumeratingWithState:&v52 objects:v62 count:16];
      }

      while (v13);
    }

    v17 = (void **)&APSEnvironmentDevelopment_ptr;
    v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[RMLog migrationEngine](&OBJC_CLASS___RMLog, "migrationEngine"));
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG)) {
      sub_10004AE34(v10);
    }

    v19 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[RMLog migrationEngine](&OBJC_CLASS___RMLog, "migrationEngine"));
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG)) {
      sub_10004ADB4(v6);
    }

    __int128 v50 = 0u;
    __int128 v51 = 0u;
    __int128 v48 = 0u;
    __int128 v49 = 0u;
    id v42 = v6;
    id v20 = v6;
    id v21 = [v20 countByEnumeratingWithState:&v48 objects:v61 count:16];
    if (v21)
    {
      id v22 = v21;
      uint64_t v45 = *(void *)v49;
      id obj = v20;
      while (2)
      {
        for (j = 0LL; j != v22; j = (char *)j + 1)
        {
          if (*(void *)v49 != v45) {
            objc_enumerationMutation(obj);
          }
          v24 = *(void **)(*((void *)&v48 + 1) + 8LL * (void)j);
          v25 = (void *)objc_claimAutoreleasedReturnValue([v24 identifier]);
          unsigned int v26 = [v10 containsObject:v25];
          v27 = v17;
          v28 = (os_log_s *)objc_claimAutoreleasedReturnValue([v17[124] migrationEngine]);
          v29 = v28;
          if (v26)
          {
            if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 138543362;
              v60 = v25;
              _os_log_debug_impl( (void *)&_mh_execute_header,  v29,  OS_LOG_TYPE_DEBUG,  "Already processed migration action: %{public}@",  buf,  0xCu);
            }
          }

          else
          {
            if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138543362;
              v60 = v25;
              _os_log_impl( (void *)&_mh_execute_header,  v29,  OS_LOG_TYPE_DEFAULT,  "Processing migration action: %{public}@",  buf,  0xCu);
            }

            id v47 = v9;
            unsigned __int8 v30 = [v24 executeReturningError:&v47];
            id v31 = v47;

            v32 = (os_log_s *)objc_claimAutoreleasedReturnValue([v27[124] migrationEngine]);
            v33 = v32;
            if ((v30 & 1) == 0)
            {
              if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR)) {
                sub_10004AD38();
              }

              BOOL v7 = v41;
              id v6 = v42;
              v38 = v40;
              if (!v40 || !v31) {
                goto LABEL_44;
              }
LABEL_43:
              id v31 = v31;
              id *v38 = v31;
LABEL_44:

              BOOL v37 = 0;
              id v9 = v31;
              v36 = (os_log_s *)obj;
              goto LABEL_45;
            }

            if (os_log_type_enabled(v32, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 138543362;
              v60 = v25;
              _os_log_debug_impl( (void *)&_mh_execute_header,  v33,  OS_LOG_TYPE_DEBUG,  "Processed migration action: %{public}@",  buf,  0xCu);
            }

            v57[0] = @"Identifier";
            v57[1] = @"Timestamp";
            v58[0] = v25;
            uint64_t v34 = objc_claimAutoreleasedReturnValue(+[NSDate now](&OBJC_CLASS___NSDate, "now"));
            v58[1] = v34;
            v35 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v58,  v57,  2LL));
            [v11 addObject:v35];

            id v46 = v31;
            LOBYTE(v34) = -[RMMigrationEngine _writeProcessedActions:error:]( v43,  "_writeProcessedActions:error:",  v11,  &v46);
            id v9 = v46;

            if ((v34 & 1) == 0)
            {
              v38 = v40;
              if (v40)
              {
                id v31 = v9;
                BOOL v7 = v41;
                id v6 = v42;
                if (v9) {
                  goto LABEL_43;
                }
              }

              else
              {
                id v31 = v9;
                BOOL v7 = v41;
                id v6 = v42;
              }

              goto LABEL_44;
            }
          }

          v17 = v27;
        }

        id v20 = obj;
        id v22 = [obj countByEnumeratingWithState:&v48 objects:v61 count:16];
        if (v22) {
          continue;
        }
        break;
      }
    }

    v36 = (os_log_s *)objc_claimAutoreleasedReturnValue([v17[124] migrationEngine]);
    BOOL v37 = 1;
    if (os_log_type_enabled(v36, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v36, OS_LOG_TYPE_INFO, "Finished migrating", buf, 2u);
    }

    BOOL v7 = v41;
    id v6 = v42;
LABEL_45:
  }

  else
  {
    BOOL v37 = 0;
    if (a4 && v8)
    {
      id v9 = v8;
      BOOL v37 = 0;
      *a4 = v9;
    }
  }

  return v37;
}

- (id)_startupActions
{
  v2 = objc_opt_new(&OBJC_CLASS___RMMigrationSystemContainer);
  v7[0] = v2;
  v3 = objc_opt_new(&OBJC_CLASS___RMMigrationStatusPath);
  v7[1] = v3;
  v4 = objc_opt_new(&OBJC_CLASS___RMMigrationExcludeFromBackup);
  v7[2] = v4;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v7, 3LL));

  return v5;
}

- (id)_coreDataActions
{
  v2 = objc_opt_new(&OBJC_CLASS___RMMigrationSupervised);
  v6[0] = v2;
  v3 = objc_opt_new(&OBJC_CLASS___RMMigrationConfigurationUI);
  v6[1] = v3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v6, 2LL));

  return v4;
}

- (id)_readProcessedActionsReturningError:(id *)a3
{
  id v15 = 0LL;
  v4 = (void *)objc_claimAutoreleasedReturnValue( -[RMMigrationEngine _readMigrationStateReturningError:]( self,  "_readMigrationStateReturningError:",  &v15));
  id v5 = v15;
  id v6 = v5;
  if (v4)
  {
    BOOL v7 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:@"ProcessedActions"]);
    if (v7)
    {
      uint64_t v8 = objc_opt_class(&OBJC_CLASS___NSArray);
      if ((objc_opt_isKindOfClass(v7, v8) & 1) == 0)
      {
        id v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[RMLog migrationEngine](&OBJC_CLASS___RMLog, "migrationEngine"));
        if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
          sub_10004AEAC();
        }

        if (a3)
        {
          id v12 = (void *)objc_claimAutoreleasedReturnValue(+[RMErrorUtilities createInternalError](&OBJC_CLASS___RMErrorUtilities, "createInternalError"));
          id v13 = v12;
          if (v12) {
            *a3 = v12;
          }
        }

        v10 = 0LL;
        goto LABEL_17;
      }

      id v9 = (NSMutableArray *)[v7 mutableCopy];
    }

    else
    {
      id v9 = objc_opt_new(&OBJC_CLASS___NSMutableArray);
    }

    v10 = v9;
LABEL_17:

    goto LABEL_18;
  }

  v10 = 0LL;
  if (a3 && v5)
  {
    v10 = 0LL;
    *a3 = v5;
  }

- (id)_readMigrationStateReturningError:(id *)a3
{
  id v5 = (void *)objc_claimAutoreleasedReturnValue( +[RMLocations migrationStatusFileURLCreateIfNeeded:]( &OBJC_CLASS___RMLocations,  "migrationStatusFileURLCreateIfNeeded:",  0LL));
  id v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
  BOOL v7 = (void *)objc_claimAutoreleasedReturnValue([v5 path]);
  unsigned int v8 = [v6 fileExistsAtPath:v7 isDirectory:0];

  if (v8)
  {
    id v26 = 0LL;
    id v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSData dataWithContentsOfURL:options:error:]( &OBJC_CLASS___NSData,  "dataWithContentsOfURL:options:error:",  v5,  0LL,  &v26));
    id v10 = v26;
    id v11 = v10;
    if (v9
      || [v10 code] == (id)257
      && (id v9 = (void *)objc_claimAutoreleasedReturnValue( -[RMMigrationEngine _fixFilePermissionsAndReadDataForURL:]( self,  "_fixFilePermissionsAndReadDataForURL:",  v5))) != 0LL)
    {
      id v25 = 0LL;
      id v12 = (void *)objc_claimAutoreleasedReturnValue( +[NSPropertyListSerialization propertyListWithData:options:format:error:]( &OBJC_CLASS___NSPropertyListSerialization,  "propertyListWithData:options:format:error:",  v9,  0LL,  0LL,  &v25));
      id v13 = v25;

      if (v12)
      {
        id v14 = v12;
      }

      else
      {
        v23 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[RMLog migrationEngine](&OBJC_CLASS___RMLog, "migrationEngine"));
        if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR)) {
          sub_10004AF6C();
        }

        if (a3 && v13) {
          *a3 = v13;
        }
      }
    }

    else
    {
      id v22 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[RMLog migrationEngine](&OBJC_CLASS___RMLog, "migrationEngine"));
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
        sub_10004AF0C();
      }

      id v12 = 0LL;
      if (a3 && v11)
      {
        id v13 = v11;
        id v12 = 0LL;
        *a3 = v13;
      }

      else
      {
        id v13 = v11;
      }
    }
  }

  else
  {
    id v13 = (id)objc_claimAutoreleasedReturnValue(+[RMLog migrationEngine](&OBJC_CLASS___RMLog, "migrationEngine"));
    if (os_log_type_enabled((os_log_t)v13, OS_LOG_TYPE_DEBUG)) {
      sub_10004AFCC((os_log_s *)v13, v15, v16, v17, v18, v19, v20, v21);
    }
    id v12 = &__NSDictionary0__struct;
  }

  return v12;
}

- (BOOL)_writeProcessedActions:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v25 = 0LL;
  BOOL v7 = (void *)objc_claimAutoreleasedReturnValue( -[RMMigrationEngine _readMigrationStateReturningError:]( self,  "_readMigrationStateReturningError:",  &v25));
  id v8 = v25;
  id v9 = v8;
  if (v7)
  {
    id v10 = [v7 mutableCopy];
    [v10 setObject:v6 forKeyedSubscript:@"ProcessedActions"];
    id v11 = (void *)objc_claimAutoreleasedReturnValue( +[RMLocations migrationStatusFileURLCreateIfNeeded:]( &OBJC_CLASS___RMLocations,  "migrationStatusFileURLCreateIfNeeded:",  1LL));
    id v24 = v9;
    unsigned __int8 v12 = objc_msgSend(v10, "rm_atomicWriteToURL:error:", v11, &v24);
    id v13 = v24;

    id v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[RMLog migrationEngine](&OBJC_CLASS___RMLog, "migrationEngine"));
    uint64_t v15 = v14;
    if ((v12 & 1) != 0)
    {
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG)) {
        sub_10004B000(v15, v16, v17, v18, v19, v20, v21, v22);
      }
    }

    else
    {
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
        sub_10004B034();
      }

      if (a4 && v13) {
        *a4 = v13;
      }
    }
  }

  else
  {
    unsigned __int8 v12 = 0;
    if (a4 && v8)
    {
      id v13 = v8;
      unsigned __int8 v12 = 0;
      *a4 = v13;
    }

    else
    {
      id v13 = v8;
    }
  }

  return v12;
}

- (id)_fixFilePermissionsAndReadDataForURL:(id)a3
{
  id v3 = a3;
  if (+[RMLocations fixFilePermissionsForURL:]( &OBJC_CLASS___RMLocations,  "fixFilePermissionsForURL:",  v3))
  {
    id v8 = 0LL;
    v4 = (void *)objc_claimAutoreleasedReturnValue( +[NSData dataWithContentsOfURL:options:error:]( &OBJC_CLASS___NSData,  "dataWithContentsOfURL:options:error:",  v3,  0LL,  &v8));
    id v5 = v8;
    if (!v4)
    {
      id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[RMLog migrationEngine](&OBJC_CLASS___RMLog, "migrationEngine"));
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
        sub_10004B094();
      }
    }
  }

  else
  {
    v4 = 0LL;
  }

  return v4;
}

@end