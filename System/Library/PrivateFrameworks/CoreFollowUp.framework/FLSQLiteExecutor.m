@interface FLSQLiteExecutor
+ (id)_databaseQueue;
+ (void)performBlock:(id)a3;
+ (void)performBlockAndWait:(id)a3;
- (BOOL)_finalizeStatement:(sqlite3_stmt *)a3 error:(id *)a4;
- (BOOL)_handleDatabaseFailureError:(id *)a3;
- (BOOL)_unsafe_openDatabase:(id *)a3;
- (BOOL)openDatabase:(id *)a3;
- (BOOL)performQuery:(id)a3;
- (BOOL)performQuery:(id)a3 error:(id *)a4;
- (BOOL)performQuery:(id)a3 rowHandler:(id)a4;
- (BOOL)shouldAutomaticallyMigrate;
- (FLSQLiteExecutor)initWithDatabasePath:(id)a3;
- (NSString)databasePath;
- (id)_currentDataBaseError;
- (int)_executeQuery:(id)a3;
- (int)_unsafe_createDataBase;
- (int64_t)performInsertQuery:(id)a3;
- (int64_t)performInsertQuery:(id)a3 error:(id *)a4;
- (sqlite3)database;
- (sqlite3_stmt)_prepareStatementForQuery:(id)a3 error:(id *)a4;
- (void)_printStatement:(sqlite3_stmt *)a3;
- (void)_stepThroughRowsWithQuery:(id)a3 statement:(sqlite3_stmt *)a4;
- (void)_unsafe_closeDatabase;
- (void)_unsafe_wipeDatabase;
- (void)closeDatabase;
- (void)commitTransaction;
- (void)openTransaction;
- (void)performTransactionBlockAndWait:(id)a3;
- (void)rollbackTransaction;
- (void)setShouldAutomaticallyMigrate:(BOOL)a3;
- (void)wipeDatabase;
@end

@implementation FLSQLiteExecutor

- (FLSQLiteExecutor)initWithDatabasePath:(id)a3
{
  id v5 = a3;
  v6 = -[FLSQLiteExecutor init](self, "init");
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_databasePath, a3);
    v7->_shouldAutomaticallyMigrate = 1;
  }

  return v7;
}

- (sqlite3)database
{
  return self->_database;
}

- (NSString)databasePath
{
  return self->_databasePath;
}

+ (void)performBlock:(id)a3
{
  id v4 = a3;
  id v5 = (void *)os_transaction_create("com.apple.followup.sql");
  id v6 = [(id)objc_opt_class(a1) _databaseQueue];
  v7 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(v6);
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472LL;
  v10[2] = sub_100003860;
  v10[3] = &unk_100018590;
  id v11 = v5;
  id v12 = v4;
  id v8 = v5;
  id v9 = v4;
  dispatch_async(v7, v10);
}

+ (void)performBlockAndWait:(id)a3
{
  id v4 = a3;
  id v5 = (void *)os_transaction_create("com.apple.followup.sql");
  id v6 = [(id)objc_opt_class(a1) _databaseQueue];
  v7 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(v6);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100003934;
  block[3] = &unk_100018590;
  id v11 = v5;
  id v12 = v4;
  id v8 = v5;
  id v9 = v4;
  dispatch_sync(v7, block);
}

+ (id)_databaseQueue
{
  if (qword_10001E370 != -1) {
    dispatch_once(&qword_10001E370, &stru_1000185D0);
  }
  return (id)qword_10001E368;
}

- (void)performTransactionBlockAndWait:(id)a3
{
  id v4 = (void (**)(void))a3;
  -[FLSQLiteExecutor openTransaction](self, "openTransaction");
  v4[2](v4);

  -[FLSQLiteExecutor commitTransaction](self, "commitTransaction");
}

- (void)openTransaction
{
}

- (void)commitTransaction
{
  if (-[FLSQLiteExecutor _executeQuery:](self, "_executeQuery:", @"COMMIT TRANSACTION")) {
    -[FLSQLiteExecutor rollbackTransaction](self, "rollbackTransaction");
  }
}

- (void)rollbackTransaction
{
}

- (int)_executeQuery:(id)a3
{
  id v4 = a3;
  uint64_t v5 = _FLLogSystemQuery();
  id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v15 = v4;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Executing query: %@", buf, 0xCu);
  }

  errmsg = 0LL;
  database = self->_database;
  id v8 = v4;
  int v9 = sqlite3_exec(database, (const char *)[v8 UTF8String], 0, 0, &errmsg);
  if (errmsg)
  {
    uint64_t v10 = _FLLogSystemQuery();
    id v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      id v15 = v8;
      __int16 v16 = 2080;
      v17 = errmsg;
      _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "SQL Exec %@ failed with error %s.",  buf,  0x16u);
    }

    sqlite3_free(errmsg);
  }

  return v9;
}

- (int64_t)performInsertQuery:(id)a3
{
  id v4 = (void *)objc_claimAutoreleasedReturnValue(+[FLSQLiteQuery queryWithString:](&OBJC_CLASS___FLSQLiteQuery, "queryWithString:", a3));
  int64_t v5 = -[FLSQLiteExecutor performInsertQuery:error:](self, "performInsertQuery:error:", v4, 0LL);

  return v5;
}

- (BOOL)performQuery:(id)a3
{
  return -[FLSQLiteExecutor performQuery:rowHandler:](self, "performQuery:rowHandler:", a3, 0LL);
}

- (BOOL)performQuery:(id)a3 rowHandler:(id)a4
{
  id v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[FLSQLiteQuery queryWithString:](&OBJC_CLASS___FLSQLiteQuery, "queryWithString:", a3));
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472LL;
  v10[2] = sub_100003CD8;
  v10[3] = &unk_1000185F8;
  id v11 = v6;
  id v8 = v6;
  [v7 setRowHandler:v10];
  LOBYTE(self) = -[FLSQLiteExecutor performQuery:error:](self, "performQuery:error:", v7, 0LL);

  return (char)self;
}

- (BOOL)performQuery:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v13 = 0LL;
  if (-[FLSQLiteExecutor _unsafe_openDatabase:](self, "_unsafe_openDatabase:", &v13)
    && (v7 = -[FLSQLiteExecutor _prepareStatementForQuery:error:](self, "_prepareStatementForQuery:error:", v6, a4)) != 0LL)
  {
    id v8 = v7;
    int v9 = (void *)objc_claimAutoreleasedReturnValue([v6 bindHandler]);

    if (v9)
    {
      uint64_t v10 = (void (**)(void, void))objc_claimAutoreleasedReturnValue([v6 bindHandler]);
      ((void (**)(void, sqlite3_stmt *))v10)[2](v10, v8);
    }

    -[FLSQLiteExecutor _printStatement:](self, "_printStatement:", v8);
    -[FLSQLiteExecutor _stepThroughRowsWithQuery:statement:](self, "_stepThroughRowsWithQuery:statement:", v6, v8);
    BOOL v11 = -[FLSQLiteExecutor _finalizeStatement:error:](self, "_finalizeStatement:error:", v8, a4);
  }

  else
  {
    BOOL v11 = 0;
  }

  return v11;
}

- (int64_t)performInsertQuery:(id)a3 error:(id *)a4
{
  id v6 = a3;
  if (!-[FLSQLiteExecutor _unsafe_openDatabase:](self, "_unsafe_openDatabase:", a4)) {
    goto LABEL_9;
  }
  v7 = -[FLSQLiteExecutor _prepareStatementForQuery:error:](self, "_prepareStatementForQuery:error:", v6, a4);
  if (!v7) {
    goto LABEL_9;
  }
  id v8 = v7;
  int v9 = (void *)objc_claimAutoreleasedReturnValue([v6 bindHandler]);

  if (v9)
  {
    uint64_t v10 = (void (**)(void, void))objc_claimAutoreleasedReturnValue([v6 bindHandler]);
    ((void (**)(void, sqlite3_stmt *))v10)[2](v10, v8);
  }

  -[FLSQLiteExecutor _printStatement:](self, "_printStatement:", v8);
  int64_t v11 = sqlite3_step(v8) == 101 ? sqlite3_last_insert_rowid(self->_database) : -1LL;
  if (!-[FLSQLiteExecutor _finalizeStatement:error:](self, "_finalizeStatement:error:", v8, a4)) {
LABEL_9:
  }
    int64_t v11 = -1LL;

  return v11;
}

- (void)_printStatement:(sqlite3_stmt *)a3
{
  v3 = sqlite3_expanded_sql(a3);
  if (v3)
  {
    id v4 = v3;
    uint64_t v5 = _FLLogSystemQuery();
    id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      int v7 = 136315138;
      id v8 = v4;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Executing query: %s", (uint8_t *)&v7, 0xCu);
    }

    sqlite3_free(v4);
  }

- (void)_stepThroughRowsWithQuery:(id)a3 statement:(sqlite3_stmt *)a4
{
  id v5 = a3;
  while (sqlite3_step(a4) == 100)
  {
    id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 rowHandler]);

    if (v6)
    {
      char v8 = 0;
      int v7 = (void (**)(void, void, void))objc_claimAutoreleasedReturnValue([v5 rowHandler]);
      ((void (**)(void, sqlite3_stmt *, char *))v7)[2](v7, a4, &v8);

      if (v8) {
        break;
      }
    }
  }
}

- (sqlite3_stmt)_prepareStatementForQuery:(id)a3 error:(id *)a4
{
  database = self->_database;
  id v7 = objc_claimAutoreleasedReturnValue([a3 queryString]);
  LODWORD(database) = sqlite3_prepare_v2(database, (const char *)[v7 UTF8String], -1, &ppStmt, 0);

  if (!(_DWORD)database) {
    return ppStmt;
  }
  -[FLSQLiteExecutor _handleDatabaseFailureError:](self, "_handleDatabaseFailureError:", a4);
  return 0LL;
}

- (BOOL)_finalizeStatement:(sqlite3_stmt *)a3 error:(id *)a4
{
  int v6 = sqlite3_finalize(a3);
  if (v6)
  {
    -[FLSQLiteExecutor _handleDatabaseFailureError:](self, "_handleDatabaseFailureError:", a4);
  }

  else
  {
    int v7 = sqlite3_changes(self->_database);
    uint64_t v8 = _FLLogSystemQuery();
    int v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v11[0] = 67109120;
      v11[1] = v7;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Rows changed: %d", (uint8_t *)v11, 8u);
    }
  }

  return v6 == 0;
}

- (BOOL)_handleDatabaseFailureError:(id *)a3
{
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[FLSQLiteExecutor _currentDataBaseError](self, "_currentDataBaseError"));
  if (v5)
  {
    uint64_t v6 = _FLLogSystemQuery();
    int v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      int v14 = 138412290;
      id v15 = v5;
      _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "Database error detected: %@",  (uint8_t *)&v14,  0xCu);
    }

    if (a3) {
      *a3 = v5;
    }
  }

  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v5 userInfo]);
  int v9 = (void *)objc_claimAutoreleasedReturnValue([v8 objectForKeyedSubscript:@"FLSQLErrorCode"]);
  unint64_t v10 = (unint64_t)[v9 integerValue];

  if (v10 <= 0x1A)
  {
    if (((1LL << v10) & 0x5000800) != 0)
    {
      uint64_t v11 = _FLLogSystemQuery();
      id v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        int v14 = 138412290;
        id v15 = v5;
        _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEFAULT,  "Database corruption detected: %@",  (uint8_t *)&v14,  0xCu);
      }

      -[FLSQLiteExecutor _unsafe_closeDatabase](self, "_unsafe_closeDatabase");
      -[FLSQLiteExecutor _unsafe_wipeDatabase](self, "_unsafe_wipeDatabase");
    }

    else if (((1LL << v10) & 0x4400) != 0)
    {
      -[FLSQLiteExecutor _unsafe_closeDatabase](self, "_unsafe_closeDatabase");
    }
  }

  return v5 != 0LL;
}

- (id)_currentDataBaseError
{
  uint64_t v3 = sqlite3_errcode(self->_database);
  uint64_t v5 = v3;
  uint64_t v6 = +[NSString stringWithUTF8String:]( &OBJC_CLASS___NSString,  "stringWithUTF8String:",  sqlite3_errmsg(self->_database));
  int v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  uint64_t v8 = FLErrorDomain;
  v13[0] = NSLocalizedFailureErrorKey;
  v13[1] = @"FLSQLErrorCode";
  v14[0] = v7;
  int v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", v5));
  v14[1] = v9;
  unint64_t v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v14,  v13,  2LL));
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  v8,  1664LL,  v10));

  return v11;
}

- (BOOL)openDatabase:(id *)a3
{
  uint64_t v13 = 0LL;
  int v14 = &v13;
  uint64_t v15 = 0x2020000000LL;
  char v16 = 0;
  uint64_t v7 = 0LL;
  uint64_t v8 = &v7;
  uint64_t v9 = 0x3032000000LL;
  unint64_t v10 = sub_10000456C;
  uint64_t v11 = sub_10000457C;
  id v12 = 0LL;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  v6[2] = sub_100004584;
  v6[3] = &unk_100018620;
  v6[4] = self;
  v6[5] = &v13;
  v6[6] = &v7;
  +[FLSQLiteExecutor performBlockAndWait:](&OBJC_CLASS___FLSQLiteExecutor, "performBlockAndWait:", v6);
  if (a3) {
    *a3 = (id) v8[5];
  }
  char v4 = *((_BYTE *)v14 + 24);
  _Block_object_dispose(&v7, 8);

  _Block_object_dispose(&v13, 8);
  return v4;
}

- (BOOL)_unsafe_openDatabase:(id *)a3
{
  id v5 = [(id)objc_opt_class(self) _databaseQueue];
  uint64_t v6 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(v5);
  dispatch_assert_queue_V2(v6);

  if (self->_database) {
    return 1;
  }
  uint64_t v8 = -[FLSQLiteExecutor _unsafe_createDataBase](self, "_unsafe_createDataBase");
  if (!(_DWORD)v8)
  {
    -[FLSQLiteExecutor performQuery:rowHandler:](self, "performQuery:rowHandler:", @"pragma foreign_keys=on", 0LL);
    if (-[FLSQLiteExecutor shouldAutomaticallyMigrate](self, "shouldAutomaticallyMigrate"))
    {
      id v12 = -[FLStoreMigrator initWithExecutor:](objc_alloc(&OBJC_CLASS___FLStoreMigrator), "initWithExecutor:", self);
      -[FLStoreMigrator migrateSchemeIfNecessary](v12, "migrateSchemeIfNecessary");
    }

    else
    {
      uint64_t v13 = _FLLogSystemQuery();
      id v12 = (FLStoreMigrator *)objc_claimAutoreleasedReturnValue(v13);
      if (os_log_type_enabled((os_log_t)v12, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)int v14 = 0;
        _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)v12,  OS_LOG_TYPE_DEFAULT,  "Migration was suppressed...",  v14,  2u);
      }
    }

    return 1;
  }

  if (a3)
  {
    uint64_t v9 = FLErrorDomain;
    uint64_t v15 = @"FLSQLErrorCode";
    unint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", v8));
    char v16 = v10;
    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v16,  &v15,  1LL));
    *a3 = (id)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  v9,  1664LL,  v11));
  }

  return 0;
}

- (int)_unsafe_createDataBase
{
  id v3 = [(id)objc_opt_class(self) _databaseQueue];
  char v4 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(v3);
  dispatch_assert_queue_V2(v4);

  uint64_t v5 = _FLLogSystemQuery();
  uint64_t v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    databasePath = self->_databasePath;
    int v26 = 138412290;
    v27 = (FLSQLiteExecutor *)databasePath;
    _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "Attempting to open database at path: %@",  (uint8_t *)&v26,  0xCu);
  }

  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(-[NSString stringByDeletingLastPathComponent](self->_databasePath, "stringByDeletingLastPathComponent"));
  if (v8)
  {
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
    unsigned __int8 v10 = [v9 fileExistsAtPath:v8];

    if ((v10 & 1) == 0)
    {
      uint64_t v13 = _FLLogSystem(v11, v12);
      int v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG)) {
        sub_10000E4EC(v14);
      }

      uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
      [v15 createDirectoryAtPath:v8 withIntermediateDirectories:1 attributes:0 error:0];
    }
  }

  int v16 = sqlite3_open_v2(-[NSString UTF8String](self->_databasePath, "UTF8String"), &self->_database, 4194310, 0LL);
  uint64_t v17 = _FLLogSystemQuery();
  v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(v17);
  BOOL v19 = os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT);
  if (v16)
  {
    if (v19)
    {
      v20 = self->_databasePath;
      int v26 = 138412546;
      v27 = self;
      __int16 v28 = 2112;
      v29 = v20;
      v21 = "%@: Failed to open file at path %@";
      v22 = v18;
      uint32_t v23 = 22;
LABEL_13:
      _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, v21, (uint8_t *)&v26, v23);
    }
  }

  else if (v19)
  {
    v24 = self->_databasePath;
    int v26 = 138412290;
    v27 = (FLSQLiteExecutor *)v24;
    v21 = "Database opened at path: %@";
    v22 = v18;
    uint32_t v23 = 12;
    goto LABEL_13;
  }

  return v16;
}

- (void)wipeDatabase
{
  uint64_t v3 = _FLLogSystemQuery(self, a2);
  char v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    databasePath = self->_databasePath;
    *(_DWORD *)buf = 138412290;
    uint64_t v8 = databasePath;
    _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "Attempting to wipe database at path: %@",  buf,  0xCu);
  }

  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  v6[2] = sub_100004A98;
  v6[3] = &unk_100018648;
  v6[4] = self;
  +[FLSQLiteExecutor performBlockAndWait:](&OBJC_CLASS___FLSQLiteExecutor, "performBlockAndWait:", v6);
}

- (void)_unsafe_wipeDatabase
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
  databasePath = self->_databasePath;
  p_databasePath = (uint64_t *)&self->_databasePath;
  id v13 = 0LL;
  unsigned __int8 v6 = [v3 removeItemAtPath:databasePath error:&v13];
  id v7 = v13;

  if ((v6 & 1) != 0)
  {
    uint64_t v10 = _FLLogSystem(v8, v9);
    uint64_t v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
      sub_10000E52C(p_databasePath, v11);
    }
  }

  else
  {
    uint64_t v12 = _FLLogSystemQuery(v8, v9);
    uint64_t v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v15 = v7;
      _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "Failed to wipe database with error: %@",  buf,  0xCu);
    }
  }
}

- (void)closeDatabase
{
  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472LL;
  v2[2] = sub_100004C10;
  v2[3] = &unk_100018648;
  v2[4] = self;
  +[FLSQLiteExecutor performBlockAndWait:](&OBJC_CLASS___FLSQLiteExecutor, "performBlockAndWait:", v2);
}

- (void)_unsafe_closeDatabase
{
  id v3 = [(id)objc_opt_class(self) _databaseQueue];
  char v4 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(v3);
  dispatch_assert_queue_V2(v4);

  if (self->_database)
  {
    uint64_t v7 = _FLLogSystemQuery(v5, v6);
    uint64_t v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      databasePath = self->_databasePath;
      int v15 = 138412290;
      int v16 = databasePath;
      _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "Closing database at path: %@",  (uint8_t *)&v15,  0xCu);
    }

    uint64_t v10 = sqlite3_close(self->_database);
    int v11 = v10;
    uint64_t v13 = _FLLogSystemQuery(v10, v12);
    int v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      int v15 = 67109120;
      LODWORD(v16) = v11;
      _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_DEFAULT,  "Closed database with result: %d",  (uint8_t *)&v15,  8u);
    }

    self->_database = 0LL;
  }

- (BOOL)shouldAutomaticallyMigrate
{
  return self->_shouldAutomaticallyMigrate;
}

- (void)setShouldAutomaticallyMigrate:(BOOL)a3
{
  self->_shouldAutomaticallyMigrate = a3;
}

- (void).cxx_destruct
{
}

@end