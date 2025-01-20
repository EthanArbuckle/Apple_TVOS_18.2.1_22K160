@interface AKSQLiteExecutor
+ (id)_databaseQueue;
+ (void)performBlock:(id)a3;
+ (void)performBlockAndWait:(id)a3;
- (AKSQLiteExecutor)initWithDatabasePath:(id)a3 migrationController:(id)a4;
- (AKSQLiteMigration)migrator;
- (BOOL)_finalizeStatement:(sqlite3_stmt *)a3 error:(id *)a4;
- (BOOL)_handleDatabaseFailureError:(id *)a3;
- (BOOL)_unsafe_openDatabase:(id *)a3;
- (BOOL)openDatabase:(id *)a3;
- (BOOL)performQuery:(id)a3;
- (BOOL)performQuery:(id)a3 error:(id *)a4;
- (BOOL)performQuery:(id)a3 rowHandler:(id)a4;
- (BOOL)shouldAutomaticallyMigrate;
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
- (void)_unsafe_wipeDatabase:(id *)a3;
- (void)closeDatabase;
- (void)commitTransaction;
- (void)dealloc;
- (void)openTransaction;
- (void)performTransactionBlockAndWait:(id)a3;
- (void)rollbackTransaction;
- (void)setMigrator:(id)a3;
- (void)setShouldAutomaticallyMigrate:(BOOL)a3;
- (void)wipeDatabase:(id *)a3;
@end

@implementation AKSQLiteExecutor

- (AKSQLiteExecutor)initWithDatabasePath:(id)a3 migrationController:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v9 = -[AKSQLiteExecutor init](self, "init");
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_databasePath, a3);
    v10->_shouldAutomaticallyMigrate = 1;
    objc_storeStrong((id *)&v10->_migrator, a4);
  }

  return v10;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___AKSQLiteExecutor;
  -[AKSQLiteExecutor dealloc](&v3, "dealloc");
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
  +[NSXPCConnection beginTransaction](&OBJC_CLASS___NSXPCConnection, "beginTransaction");
  id v6 = objc_msgSend((id)objc_opt_class(a1, v5), "_databaseQueue");
  id v7 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(v6);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10007E584;
  block[3] = &unk_1001C78D0;
  id v10 = v4;
  id v8 = v4;
  dispatch_async(v7, block);
}

+ (void)performBlockAndWait:(id)a3
{
  id v4 = a3;
  +[NSXPCConnection beginTransaction](&OBJC_CLASS___NSXPCConnection, "beginTransaction");
  id v6 = objc_msgSend((id)objc_opt_class(a1, v5), "_databaseQueue");
  id v7 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(v6);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10007E64C;
  block[3] = &unk_1001C78D0;
  id v10 = v4;
  id v8 = v4;
  dispatch_sync(v7, block);
}

+ (id)_databaseQueue
{
  if (qword_10020F4C8 != -1) {
    dispatch_once(&qword_10020F4C8, &stru_1001C9AE0);
  }
  return (id)qword_10020F4C0;
}

- (void)performTransactionBlockAndWait:(id)a3
{
  id v4 = (void (**)(void))a3;
  -[AKSQLiteExecutor openTransaction](self, "openTransaction");
  v4[2](v4);

  -[AKSQLiteExecutor commitTransaction](self, "commitTransaction");
}

- (void)openTransaction
{
}

- (void)commitTransaction
{
  if (-[AKSQLiteExecutor _executeQuery:](self, "_executeQuery:", @"COMMIT TRANSACTION")) {
    -[AKSQLiteExecutor rollbackTransaction](self, "rollbackTransaction");
  }
}

- (void)rollbackTransaction
{
}

- (int)_executeQuery:(id)a3
{
  id v4 = a3;
  uint64_t v5 = _AKLogSystemQuery();
  id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
    sub_100139CF4();
  }

  errmsg = 0LL;
  database = self->_database;
  id v8 = v4;
  int v9 = sqlite3_exec(database, (const char *)[v8 UTF8String], 0, 0, &errmsg);
  if (errmsg)
  {
    uint64_t v10 = _AKLogSystemQuery();
    v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      sub_100139C84();
    }

    sqlite3_free(errmsg);
  }

  return v9;
}

- (int64_t)performInsertQuery:(id)a3
{
  id v4 = (void *)objc_claimAutoreleasedReturnValue(+[AKSQLiteQuery queryWithString:](&OBJC_CLASS___AKSQLiteQuery, "queryWithString:", a3));
  int64_t v5 = -[AKSQLiteExecutor performInsertQuery:error:](self, "performInsertQuery:error:", v4, 0LL);

  return v5;
}

- (BOOL)performQuery:(id)a3
{
  return -[AKSQLiteExecutor performQuery:rowHandler:](self, "performQuery:rowHandler:", a3, 0LL);
}

- (BOOL)performQuery:(id)a3 rowHandler:(id)a4
{
  id v6 = a4;
  id v7 = (void *)objc_claimAutoreleasedReturnValue(+[AKSQLiteQuery queryWithString:](&OBJC_CLASS___AKSQLiteQuery, "queryWithString:", a3));
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472LL;
  v10[2] = sub_10007E984;
  v10[3] = &unk_1001C9B08;
  id v11 = v6;
  id v8 = v6;
  [v7 setRowHandler:v10];
  LOBYTE(self) = -[AKSQLiteExecutor performQuery:error:](self, "performQuery:error:", v7, 0LL);

  return (char)self;
}

- (BOOL)performQuery:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v13 = 0LL;
  if (-[AKSQLiteExecutor _unsafe_openDatabase:](self, "_unsafe_openDatabase:", &v13)
    && (id v7 = -[AKSQLiteExecutor _prepareStatementForQuery:error:](self, "_prepareStatementForQuery:error:", v6, a4)) != 0LL
    && ((id v8 = v7, v9 = (void *)objc_claimAutoreleasedReturnValue([v6 bindHandler]), v9, !v9)
     || (uint64_t v10 = (void (**)(void, void))objc_claimAutoreleasedReturnValue([v6 bindHandler]),
         ((void (**)(void, sqlite3_stmt *))v10)[2](v10, v8),
         v10,
         ([v6 bindingFailure] & 1) == 0)))
  {
    -[AKSQLiteExecutor _printStatement:](self, "_printStatement:", v8);
    -[AKSQLiteExecutor _stepThroughRowsWithQuery:statement:](self, "_stepThroughRowsWithQuery:statement:", v6, v8);
    BOOL v11 = -[AKSQLiteExecutor _finalizeStatement:error:](self, "_finalizeStatement:error:", v8, a4);
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
  if (!-[AKSQLiteExecutor _unsafe_openDatabase:](self, "_unsafe_openDatabase:", a4)) {
    goto LABEL_9;
  }
  id v7 = -[AKSQLiteExecutor _prepareStatementForQuery:error:](self, "_prepareStatementForQuery:error:", v6, a4);
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

  -[AKSQLiteExecutor _printStatement:](self, "_printStatement:", v8);
  int64_t v11 = sqlite3_step(v8) == 101 ? sqlite3_last_insert_rowid(self->_database) : -1LL;
  if (!-[AKSQLiteExecutor _finalizeStatement:error:](self, "_finalizeStatement:error:", v8, a4)) {
LABEL_9:
  }
    int64_t v11 = -1LL;

  return v11;
}

- (void)_printStatement:(sqlite3_stmt *)a3
{
  objc_super v3 = sqlite3_expanded_sql(a3);
  if (v3)
  {
    id v4 = v3;
    uint64_t v5 = _AKLogSystemQuery();
    id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
      sub_100139D54();
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
      id v7 = (void (**)(void, void, void))objc_claimAutoreleasedReturnValue([v5 rowHandler]);
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
  -[AKSQLiteExecutor _handleDatabaseFailureError:](self, "_handleDatabaseFailureError:", a4);
  return 0LL;
}

- (BOOL)_finalizeStatement:(sqlite3_stmt *)a3 error:(id *)a4
{
  int v6 = sqlite3_finalize(a3);
  if (v6)
  {
    -[AKSQLiteExecutor _handleDatabaseFailureError:](self, "_handleDatabaseFailureError:", a4);
  }

  else
  {
    uint64_t v7 = sqlite3_changes(self->_database);
    uint64_t v8 = _AKLogSystemQuery();
    int v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
      sub_100139DB4(v7, v9, v10, v11, v12, v13, v14, v15);
    }
  }

  return v6 == 0;
}

- (BOOL)_handleDatabaseFailureError:(id *)a3
{
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[AKSQLiteExecutor _currentDataBaseError](self, "_currentDataBaseError"));
  if (v5)
  {
    uint64_t v6 = _AKLogSystemQuery();
    uint64_t v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      sub_100139E78();
    }

    if (a3) {
      *a3 = v5;
    }
  }

  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v5 userInfo]);
  int v9 = (void *)objc_claimAutoreleasedReturnValue([v8 objectForKeyedSubscript:@"AKSQLErrorCode"]);
  unint64_t v10 = (unint64_t)[v9 integerValue];

  if (v10 <= 0x1A)
  {
    if (((1LL << v10) & 0x5000800) != 0)
    {
      uint64_t v11 = _AKLogSystemQuery();
      uint64_t v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
        sub_100139E18();
      }

      -[AKSQLiteExecutor _unsafe_closeDatabase](self, "_unsafe_closeDatabase");
      -[AKSQLiteExecutor _unsafe_wipeDatabase:](self, "_unsafe_wipeDatabase:", 0LL);
    }

    else if (((1LL << v10) & 0x4400) != 0)
    {
      -[AKSQLiteExecutor _unsafe_closeDatabase](self, "_unsafe_closeDatabase");
    }
  }

  return v5 != 0LL;
}

- (id)_currentDataBaseError
{
  uint64_t v3 = sqlite3_errcode(self->_database);
  uint64_t v5 = v3;
  uint64_t v6 = +[NSString stringWithUTF8String:]( &OBJC_CLASS___NSString,  "stringWithUTF8String:",  sqlite3_errmsg(self->_database));
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  uint64_t v8 = AKSQLErrorDomain;
  v13[0] = NSLocalizedFailureErrorKey;
  v13[1] = @"AKSQLErrorCode";
  v14[0] = v7;
  int v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", v5));
  v14[1] = v9;
  unint64_t v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v14,  v13,  2LL));
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  v8,  -6001LL,  v10));

  return v11;
}

- (BOOL)openDatabase:(id *)a3
{
  uint64_t v13 = 0LL;
  uint64_t v14 = &v13;
  uint64_t v15 = 0x2020000000LL;
  char v16 = 0;
  uint64_t v7 = 0LL;
  uint64_t v8 = &v7;
  uint64_t v9 = 0x3032000000LL;
  unint64_t v10 = sub_10007F108;
  uint64_t v11 = sub_10007F118;
  id v12 = 0LL;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  v6[2] = sub_10007F120;
  v6[3] = &unk_1001C9B30;
  v6[4] = self;
  v6[5] = &v13;
  v6[6] = &v7;
  +[AKSQLiteExecutor performBlockAndWait:](&OBJC_CLASS___AKSQLiteExecutor, "performBlockAndWait:", v6);
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
  id v5 = objc_msgSend((id)objc_opt_class(self, a2), "_databaseQueue");
  uint64_t v6 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(v5);
  dispatch_assert_queue_V2(v6);

  if (self->_database) {
    return 1;
  }
  uint64_t v8 = -[AKSQLiteExecutor _unsafe_createDataBase](self, "_unsafe_createDataBase");
  if (!(_DWORD)v8)
  {
    -[AKSQLiteExecutor performQuery:rowHandler:](self, "performQuery:rowHandler:", @"pragma foreign_keys=on", 0LL);
    if (self->_shouldAutomaticallyMigrate)
    {
      migrator = self->_migrator;
      if (migrator)
      {
        -[AKSQLiteMigration setExecutor:](migrator, "setExecutor:", self);
        -[AKSQLiteMigration migrateSchemaIfNecessary](self->_migrator, "migrateSchemaIfNecessary");
      }

      else
      {
        uint64_t v13 = _AKLogSystem(0LL);
        uint64_t v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
        if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
          sub_100139ED8(v14);
        }
      }
    }

    return 1;
  }

  if (a3)
  {
    uint64_t v9 = AKSQLErrorDomain;
    uint64_t v15 = @"AKSQLErrorCode";
    unint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", v8));
    char v16 = v10;
    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v16,  &v15,  1LL));
    *a3 = (id)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  v9,  -6001LL,  v11));
  }

  return 0;
}

- (int)_unsafe_createDataBase
{
  id v3 = objc_msgSend((id)objc_opt_class(self, a2), "_databaseQueue");
  char v4 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(v3);
  dispatch_assert_queue_V2(v4);

  uint64_t v5 = _AKLogSystemQuery();
  uint64_t v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
    sub_10013A0B4();
  }

  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(-[NSString stringByDeletingLastPathComponent](self->_databasePath, "stringByDeletingLastPathComponent"));
  if (v7)
  {
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
    unsigned __int8 v9 = [v8 fileExistsAtPath:v7];

    if ((v9 & 1) == 0)
    {
      uint64_t v11 = _AKLogSystem(v10);
      id v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
        sub_10013A078(v12);
      }

      uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
      id v24 = 0LL;
      unsigned __int8 v14 = [v13 createDirectoryAtPath:v7 withIntermediateDirectories:1 attributes:0 error:&v24];
      id v15 = v24;

      if ((v14 & 1) == 0)
      {
        uint64_t v17 = _AKLogSystem(v16);
        v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(v17);
        if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
          sub_100139FE8(v15, v18);
        }
      }
    }
  }

  int v19 = sqlite3_open_v2(-[NSString UTF8String](self->_databasePath, "UTF8String"), &self->_database, 6, 0LL);
  uint64_t v20 = _AKLogSystemQuery();
  v21 = (os_log_s *)objc_claimAutoreleasedReturnValue(v20);
  v22 = v21;
  if (v19)
  {
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
      sub_100139F78();
    }
  }

  else if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
  {
    sub_100139F14();
  }

  return v19;
}

- (void)wipeDatabase:(id *)a3
{
  uint64_t v8 = 0LL;
  unsigned __int8 v9 = &v8;
  uint64_t v10 = 0x3032000000LL;
  uint64_t v11 = sub_10007F108;
  id v12 = sub_10007F118;
  id v13 = 0LL;
  uint64_t v5 = _AKLogSystemQuery(self, a2);
  uint64_t v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
    sub_10013A118();
  }

  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_10007F5E0;
  v7[3] = &unk_1001C9B58;
  v7[4] = self;
  v7[5] = &v8;
  +[AKSQLiteExecutor performBlockAndWait:](&OBJC_CLASS___AKSQLiteExecutor, "performBlockAndWait:", v7);
  if (a3) {
    *a3 = (id) v9[5];
  }
  _Block_object_dispose(&v8, 8);
}

- (void)_unsafe_wipeDatabase:(id *)a3
{
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
  databasePath = self->_databasePath;
  id v14 = 0LL;
  unsigned __int8 v7 = [v5 removeItemAtPath:databasePath error:&v14];
  id v8 = v14;

  if ((v7 & 1) != 0)
  {
    uint64_t v11 = _AKLogSystem(v9);
    id v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
      sub_10013A17C();
    }
  }

  else
  {
    if (a3)
    {
      id v9 = v8;
      *a3 = v9;
    }

    uint64_t v13 = _AKLogSystemQuery(v9, v10);
    id v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      sub_10013A1E0();
    }
  }
}

- (void)closeDatabase
{
  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472LL;
  v2[2] = sub_10007F764;
  v2[3] = &unk_1001C7300;
  v2[4] = self;
  +[AKSQLiteExecutor performBlockAndWait:](&OBJC_CLASS___AKSQLiteExecutor, "performBlockAndWait:", v2);
}

- (void)_unsafe_closeDatabase
{
  id v3 = objc_msgSend((id)objc_opt_class(self, a2), "_databaseQueue");
  char v4 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(v3);
  dispatch_assert_queue_V2(v4);

  if (self->_database)
  {
    uint64_t v7 = _AKLogSystemQuery(v5, v6);
    id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
      sub_10013A2A4();
    }

    uint64_t v9 = sqlite3_close(self->_database);
    uint64_t v11 = _AKLogSystemQuery(v9, v10);
    id v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
      sub_10013A240(v9, v12, v13, v14, v15, v16, v17, v18);
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

- (AKSQLiteMigration)migrator
{
  return self->_migrator;
}

- (void)setMigrator:(id)a3
{
}

- (void).cxx_destruct
{
}

@end