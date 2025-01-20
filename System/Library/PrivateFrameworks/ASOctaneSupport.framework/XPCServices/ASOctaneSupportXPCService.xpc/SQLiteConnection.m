@interface SQLiteConnection
- (BOOL)_close;
- (BOOL)_executeStatement:(id)a3 error:(id *)a4;
- (BOOL)_executeWithError:(id *)a3 usingBlock:(id)a4;
- (BOOL)_open;
- (BOOL)_performResetAfterCorruptionError;
- (BOOL)_resetAfterCorruptionError;
- (BOOL)_resetAfterIOError;
- (BOOL)addFunction:(id)a3;
- (BOOL)executePreparedStatement:(id)a3 error:(id *)a4;
- (BOOL)executePreparedStatement:(id)a3 error:(id *)a4 bindings:(id)a5;
- (BOOL)executeStatement:(id)a3 error:(id *)a4;
- (BOOL)executeStatement:(id)a3 error:(id *)a4 bindings:(id)a5;
- (BOOL)finalizePreparedStatement:(id)a3 error:(id *)a4;
- (BOOL)isInMemoryDatabase;
- (BOOL)performSavepoint:(id)a3;
- (BOOL)removeFunction:(id)a3;
- (BOOL)removeFunctionNamed:(id)a3 withArgumentCount:(int64_t)a4;
- (BOOL)tableExists:(id)a3;
- (BOOL)truncate;
- (NSError)currentError;
- (SQLiteConnection)initWithOptions:(id)a3;
- (SQLiteConnectionDelegate)delegate;
- (SQLiteConnectionOptions)options;
- (id)_prepareStatement:(id)a3 error:(id *)a4;
- (id)_statementForPreparedStatement:(id)a3 error:(id *)a4;
- (id)_verifiedStatementForPreparedStatement:(id)a3 error:(id *)a4;
- (id)_verifiedStatementForSQL:(id)a3 error:(id *)a4;
- (id)prepareStatement:(id)a3 error:(id *)a4;
- (int64_t)lastChangeCount;
- (void)_finalizeAllStatements;
- (void)_flushAfterTransactionBlocks;
- (void)dealloc;
- (void)dispatchAfterTransaction:(id)a3;
- (void)executePreparedQuery:(id)a3 withResults:(id)a4;
- (void)executeQuery:(id)a3 withResults:(id)a4;
- (void)performTransaction:(id)a3;
- (void)setDelegate:(id)a3;
@end

@implementation SQLiteConnection

- (SQLiteConnection)initWithOptions:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)&OBJC_CLASS___SQLiteConnection;
  v5 = -[SQLiteConnection init](&v11, "init");
  if (v5)
  {
    v6 = (SQLiteConnectionOptions *)[v4 copy];
    options = v5->_options;
    v5->_options = v6;

    uint64_t v8 = objc_claimAutoreleasedReturnValue(+[NSMapTable strongToStrongObjectsMapTable](&OBJC_CLASS___NSMapTable, "strongToStrongObjectsMapTable"));
    preparedStatements = v5->_preparedStatements;
    v5->_preparedStatements = (NSMapTable *)v8;
  }

  return v5;
}

- (void)dealloc
{
  if (self->_database)
  {
    if (qword_1002BAF38 != -1) {
      dispatch_once(&qword_1002BAF38, &stru_10026F9D0);
    }
    v3 = (void *)qword_1002A8888;
    if (os_log_type_enabled((os_log_t)qword_1002A8888, OS_LOG_TYPE_FAULT)) {
      sub_1001EBDE4((uint64_t)self, v3);
    }
    sqlite3_close_v2(self->_database);
  }

  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___SQLiteConnection;
  -[SQLiteConnection dealloc](&v4, "dealloc");
}

- (void)dispatchAfterTransaction:(id)a3
{
  id v4 = a3;
  id v10 = v4;
  if (self->_transactionDepth)
  {
    if (!self->_afterTransactionBlocks)
    {
      v5 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
      afterTransactionBlocks = self->_afterTransactionBlocks;
      self->_afterTransactionBlocks = v5;
    }

    id v7 = [v10 copy];
    uint64_t v8 = self->_afterTransactionBlocks;
    id v9 = objc_retainBlock(v7);
    -[NSMutableArray addObject:](v8, "addObject:", v9);
  }

  else
  {
    (*((void (**)(id))v4 + 2))(v4);
  }
}

- (void)executePreparedQuery:(id)a3 withResults:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(id, SQLiteQueryResults *, id))a4;
  id v11 = 0LL;
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue( -[SQLiteConnection _verifiedStatementForPreparedStatement:error:]( self,  "_verifiedStatementForPreparedStatement:error:",  v6,  &v11));
  id v9 = v11;
  if (v8) {
    id v10 = -[SQLiteQueryResults initWithStatement:]( objc_alloc(&OBJC_CLASS___SQLiteQueryResults),  "initWithStatement:",  v8);
  }
  else {
    id v10 = 0LL;
  }
  v7[2](v7, v10, v9);
  [v8 clearBindings];
  [v8 reset];
}

- (BOOL)executePreparedStatement:(id)a3 error:(id *)a4
{
  return -[SQLiteConnection executePreparedStatement:error:bindings:]( self,  "executePreparedStatement:error:bindings:",  a3,  a4,  0LL);
}

- (BOOL)executePreparedStatement:(id)a3 error:(id *)a4 bindings:(id)a5
{
  uint64_t v8 = (void (**)(id, void *))a5;
  id v15 = 0LL;
  id v9 = (void *)objc_claimAutoreleasedReturnValue( -[SQLiteConnection _verifiedStatementForPreparedStatement:error:]( self,  "_verifiedStatementForPreparedStatement:error:",  a3,  &v15));
  id v10 = v15;
  if (v9)
  {
    if (v8) {
      v8[2](v8, v9);
    }
    id v14 = v10;
    BOOL v11 = -[SQLiteConnection _executeStatement:error:](self, "_executeStatement:error:", v9, &v14);
    id v12 = v14;

    if (v8) {
      [v9 clearBindings];
    }
    id v10 = v12;
  }

  else
  {
    BOOL v11 = 0;
  }

  [v9 reset];
  if (a4 && !v11) {
    *a4 = v10;
  }

  return v11;
}

- (void)executeQuery:(id)a3 withResults:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(id, SQLiteQueryResults *, id))a4;
  id v12 = 0LL;
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(-[SQLiteConnection _verifiedStatementForSQL:error:](self, "_verifiedStatementForSQL:error:", v6, &v12));
  id v9 = v12;
  id v10 = -[SQLitePreparedStatement initWithConnection:SQL:]( objc_alloc(&OBJC_CLASS___SQLitePreparedStatement),  "initWithConnection:SQL:",  self->_database,  v6);
  if (v10) {
    -[NSMapTable setObject:forKey:](self->_preparedStatements, "setObject:forKey:", v8, v10);
  }
  if (v8) {
    BOOL v11 = -[SQLiteQueryResults initWithStatement:]( objc_alloc(&OBJC_CLASS___SQLiteQueryResults),  "initWithStatement:",  v8);
  }
  else {
    BOOL v11 = 0LL;
  }
  v7[2](v7, v11, v9);
  [v8 finalizeStatement];
  if (v10) {
    -[NSMapTable removeObjectForKey:](self->_preparedStatements, "removeObjectForKey:", v10);
  }
}

- (BOOL)executeStatement:(id)a3 error:(id *)a4
{
  return -[SQLiteConnection executeStatement:error:bindings:](self, "executeStatement:error:bindings:", a3, a4, 0LL);
}

- (BOOL)executeStatement:(id)a3 error:(id *)a4 bindings:(id)a5
{
  uint64_t v8 = (void (**)(id, void *))a5;
  id v17 = 0LL;
  id v9 = a3;
  id v10 = (void *)objc_claimAutoreleasedReturnValue(-[SQLiteConnection _verifiedStatementForSQL:error:](self, "_verifiedStatementForSQL:error:", v9, &v17));
  id v11 = v17;
  id v12 = -[SQLitePreparedStatement initWithConnection:SQL:]( objc_alloc(&OBJC_CLASS___SQLitePreparedStatement),  "initWithConnection:SQL:",  self->_database,  v9);

  if (v12) {
    -[NSMapTable setObject:forKey:](self->_preparedStatements, "setObject:forKey:", v10, v12);
  }
  if (!v10)
  {
    BOOL v13 = 0;
    if (!a4) {
      goto LABEL_13;
    }
    goto LABEL_11;
  }

  if (v8) {
    v8[2](v8, v10);
  }
  id v16 = v11;
  BOOL v13 = -[SQLiteConnection _executeStatement:error:](self, "_executeStatement:error:", v10, &v16);
  id v14 = v16;

  [v10 finalizeStatement];
  if (v12) {
    -[NSMapTable removeObjectForKey:](self->_preparedStatements, "removeObjectForKey:", v12);
  }
  id v11 = v14;
  if (a4)
  {
LABEL_11:
    if (!v13) {
      *a4 = v11;
    }
  }

- (BOOL)finalizePreparedStatement:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v13 = 0LL;
  id v7 = (void *)objc_claimAutoreleasedReturnValue( -[SQLiteConnection _verifiedStatementForPreparedStatement:error:]( self,  "_verifiedStatementForPreparedStatement:error:",  v6,  &v13));
  id v8 = v13;
  if (!v7)
  {
    BOOL v9 = 0;
    if (!a4) {
      goto LABEL_9;
    }
    goto LABEL_7;
  }

  BOOL v9 = sub_100013D98([v7 finalizeStatement]);
  if (!v9)
  {
    id v10 = sub_100013AF8(self->_database);
    uint64_t v11 = objc_claimAutoreleasedReturnValue(v10);

    id v8 = (id)v11;
  }

  -[NSMapTable removeObjectForKey:](self->_preparedStatements, "removeObjectForKey:", v6);
  if (a4)
  {
LABEL_7:
    if (!v9) {
      *a4 = v8;
    }
  }

- (int64_t)lastChangeCount
{
  if (-[SQLiteConnection _open](self, "_open")) {
    return sqlite3_changes(self->_database);
  }
  else {
    return 0LL;
  }
}

- (BOOL)performSavepoint:(id)a3
{
  id v4 = (unsigned int (**)(void))a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](&OBJC_CLASS___NSUUID, "UUID"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 UUIDString]);
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 stringByReplacingOccurrencesOfString:@"-" withString:&stru_100294B70]);
  id v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"SP_%@", v7));

  BOOL v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"SAVEPOINT %@", v8));
  LODWORD(v6) = -[SQLiteConnection executeStatement:error:](self, "executeStatement:error:", v9, 0LL);

  if (!(_DWORD)v6) {
    goto LABEL_5;
  }
  if (!v4[2](v4))
  {
    id v12 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"ROLLBACK TRANSACTION TO SAVEPOINT %@",  v8));
    -[SQLiteConnection executeStatement:error:](self, "executeStatement:error:", v12, 0LL);

LABEL_5:
    BOOL v11 = 0;
    goto LABEL_6;
  }

  id v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"RELEASE SAVEPOINT %@",  v8));
  BOOL v11 = -[SQLiteConnection executeStatement:error:](self, "executeStatement:error:", v10, 0LL);

LABEL_6:
  return v11;
}

- (void)performTransaction:(id)a3
{
  id v4 = (uint64_t (**)(void))a3;
  int64_t transactionDepth = self->_transactionDepth;
  if (transactionDepth < 1)
  {
    if (!-[SQLiteConnection executeStatement:error:]( self,  "executeStatement:error:",  @"BEGIN DEFERRED TRANSACTION",  0LL)) {
      goto LABEL_12;
    }
    self->_int64_t transactionDepth = 1LL;
    self->_transactionWantsRollback = 0;
  }

  else
  {
    self->_int64_t transactionDepth = transactionDepth + 1;
  }

  os_variant_has_internal_content("com.apple.storekitd");
  int v6 = v4[2](v4);
  int64_t v7 = self->_transactionDepth;
  int v8 = v6 ^ 1;
  if (self->_transactionWantsRollback) {
    int v8 = 1;
  }
  self->_transactionWantsRollback = v8;
  int64_t v9 = v7 - 1;
  self->_int64_t transactionDepth = v9;
  if (!v9)
  {
    if (v8) {
      id v10 = @"ROLLBACK TRANSACTION";
    }
    else {
      id v10 = @"COMMIT TRANSACTION";
    }
    -[SQLiteConnection executeStatement:error:](self, "executeStatement:error:", v10, 0LL);
    -[SQLiteConnection _flushAfterTransactionBlocks](self, "_flushAfterTransactionBlocks");
  }

- (id)prepareStatement:(id)a3 error:(id *)a4
{
  id v6 = a3;
  if (!-[SQLiteConnection _open](self, "_open"))
  {
    id v8 = (id)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"SQLiteErrorDomain",  -7700LL,  0LL));
    int64_t v9 = 0LL;
    if (!a4) {
      goto LABEL_10;
    }
    goto LABEL_8;
  }

  id v11 = 0LL;
  int64_t v7 = (void *)objc_claimAutoreleasedReturnValue(-[SQLiteConnection _prepareStatement:error:](self, "_prepareStatement:error:", v6, &v11));
  id v8 = v11;
  if (v7)
  {
    int64_t v9 = -[SQLitePreparedStatement initWithConnection:SQL:]( objc_alloc(&OBJC_CLASS___SQLitePreparedStatement),  "initWithConnection:SQL:",  self,  v6);
    -[NSMapTable setObject:forKey:](self->_preparedStatements, "setObject:forKey:", v7, v9);
  }

  else
  {
    int64_t v9 = 0LL;
  }

  if (a4)
  {
LABEL_8:
    if (!v9) {
      *a4 = v8;
    }
  }

- (BOOL)truncate
{
  if (-[SQLiteConnectionOptions isReadOnly](self->_options, "isReadOnly") || !-[SQLiteConnection _open](self, "_open")) {
    return 0;
  }
  -[SQLiteConnection _finalizeAllStatements](self, "_finalizeAllStatements");
  int v6 = 129;
  int v3 = sqlite3_file_control(self->_database, 0LL, 101, &v6);
  BOOL v4 = v3 == 0;
  if (!v3)
  {
    sqlite3_close(self->_database);
    self->_database = 0LL;
  }

  return v4;
}

- (BOOL)tableExists:(id)a3
{
  uint64_t v9 = 0LL;
  id v10 = &v9;
  uint64_t v11 = 0x2020000000LL;
  char v12 = 0;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  v6[2] = sub_100012340;
  v6[3] = &unk_10026F618;
  id v4 = a3;
  id v7 = v4;
  id v8 = &v9;
  -[SQLiteConnection executeQuery:withResults:]( self,  "executeQuery:withResults:",  @"SELECT name FROM sqlite_master where name = ?",  v6);
  LOBYTE(self) = *((_BYTE *)v10 + 24);

  _Block_object_dispose(&v9, 8);
  return (char)self;
}

- (BOOL)addFunction:(id)a3
{
  id v4 = a3;
  if (self->_database)
  {
    if (qword_1002BAF38 != -1) {
      dispatch_once(&qword_1002BAF38, &stru_10026F9D0);
    }
    v5 = (os_log_s *)qword_1002A8888;
    if (os_log_type_enabled((os_log_t)qword_1002A8888, OS_LOG_TYPE_FAULT)) {
      sub_1001EC020(v5, v6, v7, v8, v9, v10, v11, v12);
    }
  }

  else
  {
    if (qword_1002BAF38 != -1) {
      dispatch_once(&qword_1002BAF38, &stru_10026F9D0);
    }
    id v13 = (void *)qword_1002A8888;
    if (os_log_type_enabled((os_log_t)qword_1002A8888, OS_LOG_TYPE_FAULT)) {
      sub_1001EBF9C((uint64_t)self, v13);
    }
  }

  return 0;
}

- (BOOL)removeFunction:(id)a3
{
  id v3 = a3;
  if (qword_1002BAF38 != -1) {
    dispatch_once(&qword_1002BAF38, &stru_10026F9D0);
  }
  id v4 = (os_log_s *)qword_1002A8888;
  if (os_log_type_enabled((os_log_t)qword_1002A8888, OS_LOG_TYPE_FAULT)) {
    sub_1001EC020(v4, v5, v6, v7, v8, v9, v10, v11);
  }

  return 0;
}

- (BOOL)removeFunctionNamed:(id)a3 withArgumentCount:(int64_t)a4
{
  int v4 = a4;
  id v6 = a3;
  uint64_t v7 = v6;
  database = self->_database;
  if (database)
  {
    BOOL v9 = sqlite3_create_function_v2( database, (const char *)[v6 UTF8String], v4, 1, 0, 0, 0, 0, 0) == 0;
  }

  else
  {
    if (qword_1002BAF38 != -1) {
      dispatch_once(&qword_1002BAF38, &stru_10026F9D0);
    }
    uint64_t v10 = (void *)qword_1002A8888;
    if (os_log_type_enabled((os_log_t)qword_1002A8888, OS_LOG_TYPE_ERROR)) {
      sub_1001EC054((uint64_t)self, v10);
    }
    BOOL v9 = 0;
  }

  return v9;
}

- (NSError)currentError
{
  database = self->_database;
  if (database)
  {
    id v3 = sub_100013AF8(database);
    database = (sqlite3 *)objc_claimAutoreleasedReturnValue(v3);
  }

  return (NSError *)database;
}

- (BOOL)isInMemoryDatabase
{
  return -[SQLiteConnectionOptions isInMemoryDatabase](self->_options, "isInMemoryDatabase");
}

- (BOOL)_close
{
  if (!self->_database) {
    return 1;
  }
  if (qword_1002BAF38 != -1) {
    dispatch_once(&qword_1002BAF38, &stru_10026F9D0);
  }
  id v3 = (void *)qword_1002A8888;
  if (os_log_type_enabled((os_log_t)qword_1002A8888, OS_LOG_TYPE_DEFAULT))
  {
    int v4 = v3;
    id v6 = (void *)objc_opt_class(self, v5);
    options = self->_options;
    id v8 = v6;
    BOOL v9 = (void *)objc_claimAutoreleasedReturnValue(-[SQLiteConnectionOptions databasePath](options, "databasePath"));
    int v12 = 138543618;
    id v13 = v6;
    __int16 v14 = 2114;
    id v15 = v9;
    _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "[%{public}@]: Closing database at path: %{public}@",  (uint8_t *)&v12,  0x16u);
  }

  -[SQLiteConnection _finalizeAllStatements](self, "_finalizeAllStatements");
  if (sqlite3_close(self->_database)) {
    return 0;
  }
  afterTransactionBlocks = self->_afterTransactionBlocks;
  self->_afterTransactionBlocks = 0LL;

  self->_database = 0LL;
  self->_int64_t transactionDepth = 0LL;
  BOOL result = 1;
  self->_transactionWantsRollback = 0;
  return result;
}

- (BOOL)_executeStatement:(id)a3 error:(id *)a4
{
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472LL;
  v9[2] = sub_1000127E0;
  v9[3] = &unk_10026F988;
  id v6 = a3;
  id v10 = v6;
  BOOL v7 = -[SQLiteConnection _executeWithError:usingBlock:](self, "_executeWithError:usingBlock:", a4, v9);
  if (v7) {
    [v6 reset];
  }

  return v7;
}

- (BOOL)_executeWithError:(id *)a3 usingBlock:(id)a4
{
  id v6 = (unsigned __int8 (**)(id, _BYTE *))a4;
  char v7 = 0;
  uint64_t v8 = 0LL;
  do
  {
    BOOL v9 = objc_autoreleasePoolPush();
    unsigned __int8 v18 = 0;
    unsigned int v10 = v6[2](v6, &v18);
    if (v10 <= 0x19)
    {
      switch(v10)
      {
        case 0u:
          goto LABEL_12;
        case 5u:
        case 6u:
          if (v8 < 10)
          {
            usleep(0xF4240u);
            ++v8;
            goto LABEL_8;
          }

          uint64_t v14 = objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"SQLiteErrorDomain",  -7702LL,  0LL));
          break;
        case 0xAu:
          id v15 = sub_100013AF8(self->_database);
          int v12 = (void *)objc_claimAutoreleasedReturnValue(v15);
          objc_autoreleasePoolPop(v9);
          -[SQLiteConnection _resetAfterIOError](self, "_resetAfterIOError");
          goto LABEL_19;
        case 0xBu:
          goto LABEL_13;
        default:
          goto LABEL_16;
      }

      goto LABEL_17;
    }

    if (v10 != 100)
    {
      if (v10 == 26)
      {
LABEL_13:
        id v13 = sub_100013AF8(self->_database);
        int v12 = (void *)objc_claimAutoreleasedReturnValue(v13);
        objc_autoreleasePoolPop(v9);
        -[SQLiteConnection _resetAfterCorruptionError](self, "_resetAfterCorruptionError");
        goto LABEL_19;
      }

      if (v10 == 101)
      {
LABEL_12:
        int v12 = 0LL;
        char v7 = 1;
LABEL_18:
        objc_autoreleasePoolPop(v9);
        goto LABEL_19;
      }

- (void)_finalizeAllStatements
{
  __int128 v10 = 0u;
  __int128 v11 = 0u;
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[NSMapTable objectEnumerator](self->_preparedStatements, "objectEnumerator", 0LL));
  id v4 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v11;
    do
    {
      char v7 = 0LL;
      do
      {
        if (*(void *)v11 != v6) {
          objc_enumerationMutation(v3);
        }
        [*(id *)(*((void *)&v10 + 1) + 8 * (void)v7) finalizeStatement];
        char v7 = (char *)v7 + 1;
      }

      while (v5 != v7);
      id v5 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }

    while (v5);
  }

  -[NSMapTable removeAllObjects](self->_preparedStatements, "removeAllObjects");
  stmt = sqlite3_next_stmt(self->_database, 0LL);
  if (stmt)
  {
    BOOL v9 = stmt;
    do
    {
      sqlite3_finalize(v9);
      BOOL v9 = sqlite3_next_stmt(self->_database, v9);
    }

    while (v9);
  }

- (void)_flushAfterTransactionBlocks
{
  afterTransactionBlocks = self->_afterTransactionBlocks;
  if (afterTransactionBlocks)
  {
    id v4 = -[NSMutableArray copy](afterTransactionBlocks, "copy");
    id v5 = self->_afterTransactionBlocks;
    self->_afterTransactionBlocks = 0LL;

    dispatch_queue_global_t global_queue = dispatch_get_global_queue(0LL, 0LL);
    char v7 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(global_queue);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_100012B60;
    block[3] = &unk_10026F7A0;
    id v10 = v4;
    id v8 = v4;
    dispatch_async(v7, block);
  }

- (BOOL)_open
{
  if (self->_database) {
    return 1;
  }
  if (qword_1002BAF38 != -1) {
    dispatch_once(&qword_1002BAF38, &stru_10026F9D0);
  }
  id v4 = (void *)qword_1002A8888;
  if (os_log_type_enabled((os_log_t)qword_1002A8888, OS_LOG_TYPE_DEFAULT))
  {
    id v5 = v4;
    char v7 = (void *)objc_opt_class(self, v6);
    options = self->_options;
    id v9 = v7;
    id v10 = (void *)objc_claimAutoreleasedReturnValue(-[SQLiteConnectionOptions databasePath](options, "databasePath"));
    *(_DWORD *)db = 138543618;
    *(void *)&db[4] = v7;
    __int16 v18 = 2114;
    v19 = v10;
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "[%{public}@]: Opening database at path: %{public}@",  db,  0x16u);
  }

  *(void *)db = 0LL;
  char v11 = 1;
  while (1)
  {
    int v12 = sub_100013BBC((sqlite3 **)db, self->_options);
    BOOL v2 = v12 == 0;
    if (!v12) {
      break;
    }
    if (v12 <= 0x1Au && ((1 << v12) & 0x4000C02) != 0)
    {
      char v14 = -[SQLiteConnection _performResetAfterCorruptionError](self, "_performResetAfterCorruptionError") & v11;
      char v11 = 0;
      if ((v14 & 1) != 0) {
        continue;
      }
    }

    return v2;
  }

  id v15 = *(sqlite3 **)db;
  self->_database = *(sqlite3 **)db;
  self->_didResetForCorruption = 0;
  sqlite3_create_function( v15,  "timestamp",  0,  1,  0LL,  (void (__cdecl *)(sqlite3_context *, int, sqlite3_value **))sub_100012E0C,  0LL,  0LL);
  return v2;
}

- (BOOL)_performResetAfterCorruptionError
{
  p_delegate = &self->_delegate;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  char v5 = objc_opt_respondsToSelector(WeakRetained, "connectionNeedsResetForCorruption:");

  if ((v5 & 1) != 0)
  {
    if (qword_1002BAF38 != -1) {
      dispatch_once(&qword_1002BAF38, &stru_10026F9D0);
    }
    uint64_t v6 = (void *)qword_1002A8858;
    if (os_log_type_enabled((os_log_t)qword_1002A8858, OS_LOG_TYPE_ERROR)) {
      sub_1001EC0E8(v6);
    }
    id v7 = objc_loadWeakRetained((id *)p_delegate);
    unsigned __int8 v8 = [v7 connectionNeedsResetForCorruption:self];
LABEL_14:
    BOOL v9 = v8;

    return v9;
  }

  if (!-[SQLiteConnectionOptions isReadOnly](self->_options, "isReadOnly"))
  {
    if (qword_1002BAF38 != -1) {
      dispatch_once(&qword_1002BAF38, &stru_10026F9D0);
    }
    id v10 = (void *)qword_1002A8858;
    if (os_log_type_enabled((os_log_t)qword_1002A8858, OS_LOG_TYPE_ERROR)) {
      sub_1001EC178(v10, (uint64_t)self);
    }
    id v7 = (id)objc_claimAutoreleasedReturnValue(-[SQLiteConnectionOptions databasePath](self->_options, "databasePath"));
    unsigned __int8 v8 = sub_100013DB4(v7);
    goto LABEL_14;
  }

  return 0;
}

- (id)_prepareStatement:(id)a3 error:(id *)a4
{
  uint64_t v10 = 0LL;
  char v11 = &v10;
  uint64_t v12 = 0x3032000000LL;
  __int128 v13 = sub_100013070;
  char v14 = sub_100013080;
  id v15 = 0LL;
  id v6 = a3;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472LL;
  v9[2] = sub_100013088;
  v9[3] = &unk_10026F9B0;
  v9[5] = &v10;
  v9[6] = [v6 UTF8String];
  void v9[4] = self;
  -[SQLiteConnection _executeWithError:usingBlock:](self, "_executeWithError:usingBlock:", a4, v9);
  id v7 = (id)v11[5];
  _Block_object_dispose(&v10, 8);

  return v7;
}

- (BOOL)_resetAfterCorruptionError
{
  if (self->_didResetForCorruption
    || (id v3 = (void *)objc_claimAutoreleasedReturnValue(-[SQLiteConnectionOptions encryptionKeyId](self->_options, "encryptionKeyId")),
        v3,
        v3))
  {
    -[SQLiteConnection _close](self, "_close");
    return -[SQLiteConnection _performResetAfterCorruptionError](self, "_performResetAfterCorruptionError");
  }

  else
  {
    self->_didResetForCorruption = 1;
    return -[SQLiteConnection _resetAfterIOError](self, "_resetAfterIOError");
  }

- (BOOL)_resetAfterIOError
{
  if (qword_1002BAF38 != -1) {
    dispatch_once(&qword_1002BAF38, &stru_10026F9D0);
  }
  id v3 = (void *)qword_1002A8858;
  if (os_log_type_enabled((os_log_t)qword_1002A8858, OS_LOG_TYPE_ERROR)) {
    sub_1001EC2CC(v3);
  }
  afterTransactionBlocks = self->_afterTransactionBlocks;
  char v5 = afterTransactionBlocks;
  int64_t transactionDepth = self->_transactionDepth;
  if (!-[SQLiteConnection _close](self, "_close") || !-[SQLiteConnection _open](self, "_open")) {
    goto LABEL_9;
  }
  if (transactionDepth)
  {
    if (sqlite3_exec(self->_database, "BEGIN DEFERRED TRANSACTION", 0LL, 0LL, 0LL))
    {
LABEL_9:
      -[SQLiteConnection _close](self, "_close");
      unsigned __int8 v7 = -[SQLiteConnection _performResetAfterCorruptionError](self, "_performResetAfterCorruptionError");
      goto LABEL_10;
    }

    objc_storeStrong((id *)&self->_afterTransactionBlocks, afterTransactionBlocks);
    self->_int64_t transactionDepth = transactionDepth;
    self->_transactionWantsRollback = 1;
  }

  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  char v10 = objc_opt_respondsToSelector(WeakRetained, "connectionNeedsResetForReopen:");

  if ((v10 & 1) != 0)
  {
    if (qword_1002BAF38 != -1) {
      dispatch_once(&qword_1002BAF38, &stru_10026F9D0);
    }
    char v11 = (void *)qword_1002A8858;
    if (os_log_type_enabled((os_log_t)qword_1002A8858, OS_LOG_TYPE_ERROR)) {
      sub_1001EC23C(v11);
    }
    id v12 = objc_loadWeakRetained((id *)&self->_delegate);
    unsigned __int8 v7 = [v12 connectionNeedsResetForReopen:self];
  }

  else
  {
    unsigned __int8 v7 = 1;
  }

- (id)_statementForPreparedStatement:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v7 = objc_claimAutoreleasedReturnValue(-[NSMapTable objectForKey:](self->_preparedStatements, "objectForKey:", v6));
  if (v7)
  {
    unsigned __int8 v8 = (void *)v7;
    id v9 = 0LL;
  }

  else
  {
    char v10 = (void *)objc_claimAutoreleasedReturnValue([v6 SQL]);
    id v12 = 0LL;
    unsigned __int8 v8 = (void *)objc_claimAutoreleasedReturnValue(-[SQLiteConnection _prepareStatement:error:](self, "_prepareStatement:error:", v10, &v12));
    id v9 = v12;

    if (v8)
    {
      -[NSMapTable setObject:forKey:](self->_preparedStatements, "setObject:forKey:", v8, v6);
    }

    else if (a4)
    {
      id v9 = v9;
      unsigned __int8 v8 = 0LL;
      *a4 = v9;
    }

    else
    {
      unsigned __int8 v8 = 0LL;
    }
  }

  return v8;
}

- (id)_verifiedStatementForPreparedStatement:(id)a3 error:(id *)a4
{
  id v6 = a3;
  if ([v6 connectionPointer] != self)
  {
    +[NSException raise:format:]( &OBJC_CLASS___NSException,  "raise:format:",  NSInvalidArgumentException,  @"Statement from a different connection");
    id v7 = 0LL;
    id v8 = 0LL;
    if (!a4) {
      goto LABEL_16;
    }
    goto LABEL_14;
  }

  if (!-[SQLiteConnection _open](self, "_open"))
  {
    id v8 = (id)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"SQLiteErrorDomain",  -7700LL,  0LL));
    id v7 = 0LL;
    if (!a4) {
      goto LABEL_16;
    }
    goto LABEL_14;
  }

  id v12 = 0LL;
  id v9 = (void *)objc_claimAutoreleasedReturnValue( -[SQLiteConnection _statementForPreparedStatement:error:]( self,  "_statementForPreparedStatement:error:",  v6,  &v12));
  id v8 = v12;
  if (v9)
  {
    if (-[SQLiteConnectionOptions isReadOnly](self->_options, "isReadOnly")
      && ([v9 isReadOnly] & 1) == 0)
    {
      uint64_t v10 = objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"SQLiteErrorDomain",  -7701LL,  0LL));

      id v7 = 0LL;
      id v8 = (id)v10;
    }

    else
    {
      id v7 = v9;
    }
  }

  else
  {
    id v7 = 0LL;
  }

  if (a4)
  {
LABEL_14:
    if (!v7) {
      *a4 = v8;
    }
  }

- (id)_verifiedStatementForSQL:(id)a3 error:(id *)a4
{
  id v6 = a3;
  if (!-[SQLiteConnection _open](self, "_open"))
  {
    id v8 = (id)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"SQLiteErrorDomain",  -7700LL,  0LL));
    id v9 = 0LL;
    if (!a4) {
      goto LABEL_13;
    }
    goto LABEL_11;
  }

  id v12 = 0LL;
  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[SQLiteConnection _prepareStatement:error:](self, "_prepareStatement:error:", v6, &v12));
  id v8 = v12;
  if (v7)
  {
    if (-[SQLiteConnectionOptions isReadOnly](self->_options, "isReadOnly")
      && ([v7 isReadOnly] & 1) == 0)
    {
      uint64_t v10 = objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"SQLiteErrorDomain",  -7701LL,  0LL));

      [v7 finalizeStatement];
      id v9 = 0LL;
      id v8 = (id)v10;
    }

    else
    {
      id v9 = v7;
    }
  }

  else
  {
    id v9 = 0LL;
  }

  if (a4)
  {
LABEL_11:
    if (!v9) {
      *a4 = v8;
    }
  }

- (SQLiteConnectionDelegate)delegate
{
  return (SQLiteConnectionDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
}

- (SQLiteConnectionOptions)options
{
  return self->_options;
}

- (void).cxx_destruct
{
}

@end