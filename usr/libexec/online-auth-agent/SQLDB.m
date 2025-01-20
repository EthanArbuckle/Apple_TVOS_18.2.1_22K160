@interface SQLDB
+ (id)databaseWithURL:(id)a3;
- (BOOL)setupSchema;
- (NSURL)dbURL;
- (NSURL)shmURL;
- (NSURL)walURL;
- (SQLDB)init;
- (SQLDB)initWithDatabaseURL:(id)a3;
- (SQLDB)initWithDatabaseURL:(id)a3 asReadOnly:(BOOL)a4;
- (double)totalSizeMB;
- (id)lastInsertRowID;
- (id)readSetting:(id)a3;
- (int)checkpoint;
- (int)executeQuery:(id)a3 withBind:(id)a4 withCancellableResults:(id)a5;
- (int)executeQuery:(id)a3 withBind:(id)a4 withResults:(id)a5;
- (int)transaction:(id)a3;
- (int)transaction:(id)a3 immediate:(BOOL)a4;
- (unint64_t)tableRowCount:(id)a3;
- (void)dealloc;
- (void)deleteSetting:(id)a3;
- (void)setSetting:(id)a3 toValue:(id)a4;
- (void)setupPermissions;
@end

@implementation SQLDB

- (SQLDB)init
{
  return 0LL;
}

- (SQLDB)initWithDatabaseURL:(id)a3 asReadOnly:(BOOL)a4
{
  BOOL v4 = a4;
  id v7 = a3;
  v15.receiver = self;
  v15.super_class = (Class)&OBJC_CLASS___SQLDB;
  v8 = -[SQLDB init](&v15, "init");
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_url, a3);
    dispatch_semaphore_t v10 = dispatch_semaphore_create(1LL);
    transactionSem = v9->_transactionSem;
    v9->_transactionSem = (OS_dispatch_semaphore *)v10;

    if (!v9->_transactionSem) {
      goto LABEL_9;
    }
    db = sub_1000064EC(v9->_url, v4);
    v9->_db = db;
    if (!db) {
      goto LABEL_9;
    }
    if (v4)
    {
      BOOL v13 = 1;
    }

    else
    {
      -[SQLDB setupPermissions](v9, "setupPermissions");
      BOOL v13 = sub_100006580(v9->_db, 0LL);
      db = v9->_db;
    }

    v9->_readonly = v13;
    sqlite3_busy_timeout(db, 300000);
    if (!v9->_readonly)
    {
      -[SQLDB executeQuery:withBind:withResults:]( v9,  "executeQuery:withBind:withResults:",  @"PRAGMA journal_mode = WAL",  0LL,  0LL);
      -[SQLDB executeQuery:withBind:withResults:]( v9,  "executeQuery:withBind:withResults:",  @"PRAGMA foreign_keys = ON",  0LL,  0LL);
      if (!-[SQLDB setupSchema](v9, "setupSchema"))
      {
LABEL_9:

        v9 = 0LL;
      }
    }
  }

  return v9;
}

- (SQLDB)initWithDatabaseURL:(id)a3
{
  return -[SQLDB initWithDatabaseURL:asReadOnly:](self, "initWithDatabaseURL:asReadOnly:", a3, 0LL);
}

+ (id)databaseWithURL:(id)a3
{
  id v4 = a3;
  id v5 = sub_10000A08C();
  v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 138412290;
    id v10 = v4;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "DB being loaded from %@", (uint8_t *)&v9, 0xCu);
  }

  id v7 = [objc_alloc((Class)a1) initWithDatabaseURL:v4];
  return v7;
}

- (NSURL)walURL
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[NSURL URLByDeletingLastPathComponent](self->_url, "URLByDeletingLastPathComponent"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[NSURL lastPathComponent](self->_url, "lastPathComponent"));
  id v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%@-wal", v4));
  v6 = (void *)objc_claimAutoreleasedReturnValue([v3 URLByAppendingPathComponent:v5]);

  return (NSURL *)v6;
}

- (NSURL)shmURL
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[NSURL URLByDeletingLastPathComponent](self->_url, "URLByDeletingLastPathComponent"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[NSURL lastPathComponent](self->_url, "lastPathComponent"));
  id v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%@-shm", v4));
  v6 = (void *)objc_claimAutoreleasedReturnValue([v3 URLByAppendingPathComponent:v5]);

  return (NSURL *)v6;
}

- (BOOL)setupSchema
{
  unsigned int v2 = -[SQLDB executeQuery:withBind:withResults:]( self,  "executeQuery:withBind:withResults:",  @"CREATE TABLE IF NOT EXISTS settings(name TEXT, value TEXT, PRIMARY KEY (name))",  0LL,  0LL);
  if (v2)
  {
    id v3 = sub_10000A08C();
    id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      sub_1000335E4(v4, v5, v6, v7, v8, v9, v10, v11);
    }
  }

  return v2 == 0;
}

- (void)setupPermissions
{
  id v2 = objc_claimAutoreleasedReturnValue(-[NSURL path](self->_url, "path"));
  sub_10000659C((const char *)[v2 UTF8String]);
}

- (void)dealloc
{
  db = self->_db;
  if (db) {
    sqlite3_close(db);
  }
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___SQLDB;
  -[SQLDB dealloc](&v4, "dealloc");
}

- (int)executeQuery:(id)a3 withBind:(id)a4 withResults:(id)a5
{
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472LL;
  v10[2] = sub_1000058C8;
  v10[3] = &unk_100045330;
  id v11 = a5;
  id v8 = v11;
  LODWORD(a4) = -[SQLDB executeQuery:withBind:withCancellableResults:]( self,  "executeQuery:withBind:withCancellableResults:",  a3,  a4,  v10);

  return (int)a4;
}

- (int)executeQuery:(id)a3 withBind:(id)a4 withCancellableResults:(id)a5
{
  id v8 = a3;
  uint64_t v9 = (void (**)(id, sqlite3_stmt *))a4;
  uint64_t v10 = (uint64_t (**)(id, sqlite3_stmt *, void *))a5;
  ppStmt = 0LL;
  db = self->_db;
  p_db = &self->_db;
  id v13 = v8;
  int v14 = sqlite3_prepare_v2(db, (const char *)[v13 UTF8String], -1, &ppStmt, 0);
  if (v14)
  {
    int v15 = v14;
    id v16 = sub_10000A08C();
    v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
      sub_100033680(p_db, v17);
    }

    id v18 = sub_10000A08C();
    v19 = (os_log_s *)objc_claimAutoreleasedReturnValue(v18);
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
      sub_100033730();
    }
    v20 = &__NSDictionary0__struct;
LABEL_39:
  }

  else
  {
    if (v9) {
      v9[2](v9, ppStmt);
    }
    if (v10 && (v21 = ppStmt, (int v22 = sqlite3_column_count(ppStmt)) != 0))
    {
      int v23 = v22;
      v20 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableDictionary dictionaryWithCapacity:]( &OBJC_CLASS___NSMutableDictionary,  "dictionaryWithCapacity:",  2 * v22));
      if (v23 >= 1)
      {
        id v57 = v13;
        v58 = v9;
        uint64_t v24 = 0LL;
        do
        {
          v25 = sqlite3_column_origin_name(v21, v24);
          v26 = sqlite3_column_name(v21, v24);
          v27 = sqlite3_column_table_name(v21, v24);
          if (v25 && v27)
          {
            v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", v27));
            if ([v28 hasSuffix:@"s"])
            {
              uint64_t v29 = objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "substringToIndex:", (char *)objc_msgSend(v28, "length") - 1));

              v28 = (void *)v29;
            }

            v30 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", v24));
            v31 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@_%s",  v28,  v25));
            [v20 setObject:v30 forKeyedSubscript:v31];
          }

          if (v26)
          {
            v32 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", v24));
            v33 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", v26));
            [v20 setObject:v32 forKeyedSubscript:v33];
          }

          uint64_t v24 = (v24 + 1);
        }

        while (v23 != (_DWORD)v24);
        id v13 = v57;
        uint64_t v9 = v58;
      }
    }

    else
    {
      v20 = &__NSDictionary0__struct;
    }

    do
    {
      int v34 = sqlite3_step(ppStmt);
      int v15 = v34;
      if ((v34 - 102) <= 0xFFFFFFFD)
      {
        id v45 = sub_10000A08C();
        v46 = (os_log_s *)objc_claimAutoreleasedReturnValue(v45);
        if (os_log_type_enabled(v46, OS_LOG_TYPE_ERROR))
        {
          v55 = sqlite3_errmsg(*p_db);
          int v56 = sqlite3_errcode(*p_db);
          *(_DWORD *)buf = 136315394;
          *(void *)v61 = v55;
          *(_WORD *)&v61[8] = 1024;
          *(_DWORD *)&v61[10] = v56;
          _os_log_error_impl((void *)&_mh_execute_header, v46, OS_LOG_TYPE_ERROR, "SQL error '%s' (%1d)", buf, 0x12u);
        }

        id v47 = sub_10000A08C();
        v19 = (os_log_s *)objc_claimAutoreleasedReturnValue(v47);
        if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 67109378;
          *(_DWORD *)v61 = v15;
          *(_WORD *)&v61[4] = 2112;
          *(void *)&v61[6] = v13;
          _os_log_error_impl( (void *)&_mh_execute_header,  v19,  OS_LOG_TYPE_ERROR,  "Step error (%d) on query: %@",  buf,  0x12u);
        }

        goto LABEL_39;
      }

      BOOL v35 = v34 == 100;
      char v36 = 1;
      if (v10 && v15 == 100)
      {
        char v36 = v10[2](v10, ppStmt, v20);
        BOOL v35 = 1;
      }
    }

    while (v35 && (v36 & 1) != 0);
    if (v35) {
      int v15 = 100;
    }
    if (((!v35 | v36) & 1) == 0)
    {
      id v37 = sub_10000A08C();
      v19 = (os_log_s *)objc_claimAutoreleasedReturnValue(v37);
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
        sub_1000336FC(v19, v38, v39, v40, v41, v42, v43, v44);
      }
      int v15 = 4;
      goto LABEL_39;
    }
  }

  int v48 = v15;
  if (ppStmt)
  {
    int v48 = sqlite3_finalize(ppStmt);
    if (v48)
    {
      id v49 = sub_10000A08C();
      v50 = (os_log_s *)objc_claimAutoreleasedReturnValue(v49);
      if (os_log_type_enabled(v50, OS_LOG_TYPE_ERROR)) {
        sub_100033680(p_db, v50);
      }

      id v51 = sub_10000A08C();
      v52 = (os_log_s *)objc_claimAutoreleasedReturnValue(v51);
      if (os_log_type_enabled(v52, OS_LOG_TYPE_ERROR)) {
        sub_100033618();
      }
    }
  }

  if (v15 == 101) {
    int v53 = v48;
  }
  else {
    int v53 = v15;
  }
  if (v15) {
    int v48 = v53;
  }

  return v48;
}

- (int)transaction:(id)a3
{
  return -[SQLDB transaction:immediate:](self, "transaction:immediate:", a3, 0LL);
}

- (int)transaction:(id)a3 immediate:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v6 = (unsigned int (**)(void))a3;
  dispatch_semaphore_wait((dispatch_semaphore_t)self->_transactionSem, 0xFFFFFFFFFFFFFFFFLL);
  if (v4) {
    uint64_t v7 = @"begin immediate transaction";
  }
  else {
    uint64_t v7 = @"begin transaction";
  }
  int v8 = -[SQLDB executeQuery:withBind:withResults:](self, "executeQuery:withBind:withResults:", v7, 0LL, 0LL);
  if (!v8)
  {
    if (v6[2](v6)
      && !-[SQLDB executeQuery:withBind:withResults:]( self,  "executeQuery:withBind:withResults:",  @"end transaction",  0LL,  0LL))
    {
      int v8 = 0;
    }

    else
    {
      int v8 = -[SQLDB executeQuery:withBind:withResults:]( self,  "executeQuery:withBind:withResults:",  @"rollback transaction",  0LL,  0LL);
    }
  }

  dispatch_semaphore_signal((dispatch_semaphore_t)self->_transactionSem);

  return v8;
}

- (int)checkpoint
{
  return sqlite3_wal_checkpoint_v2(self->_db, 0LL, 3, 0LL, 0LL);
}

- (id)readSetting:(id)a3
{
  uint64_t v10 = 0LL;
  id v11 = &v10;
  uint64_t v12 = 0x3032000000LL;
  id v13 = sub_100005FB8;
  int v14 = sub_100005FC8;
  id v15 = 0LL;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = sub_100005FD0;
  v8[3] = &unk_100045358;
  id v4 = a3;
  id v9 = v4;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_10000600C;
  v7[3] = &unk_100045380;
  v7[4] = &v10;
  -[SQLDB executeQuery:withBind:withResults:]( self,  "executeQuery:withBind:withResults:",  @"SELECT value FROM settings WHERE name = ?1",  v8,  v7);
  id v5 = (id)v11[5];

  _Block_object_dispose(&v10, 8);
  return v5;
}

- (void)setSetting:(id)a3 toValue:(id)a4
{
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = sub_1000060F4;
  v8[3] = &unk_1000453A8;
  id v9 = a3;
  id v10 = a4;
  id v6 = v10;
  id v7 = v9;
  -[SQLDB executeQuery:withBind:withResults:]( self,  "executeQuery:withBind:withResults:",  @"INSERT OR REPLACE INTO settings (name, value) VALUES (?1, ?2)",  v8,  0LL);
}

- (void)deleteSetting:(id)a3
{
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_1000061DC;
  v5[3] = &unk_100045358;
  id v6 = a3;
  id v4 = v6;
  -[SQLDB executeQuery:withBind:withResults:]( self,  "executeQuery:withBind:withResults:",  @"DELETE FROM settings WHERE name = ?1",  v5,  0LL);
}

- (unint64_t)tableRowCount:(id)a3
{
  id v4 = a3;
  uint64_t v13 = 0LL;
  int v14 = &v13;
  uint64_t v15 = 0x3032000000LL;
  id v16 = sub_100005FB8;
  v17 = sub_100005FC8;
  id v18 = 0LL;
  id v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"SELECT COUNT(*) FROM %@",  v4));
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472LL;
  v12[2] = sub_10000636C;
  v12[3] = &unk_100045380;
  v12[4] = &v13;
  int v6 = -[SQLDB executeQuery:withBind:withResults:](self, "executeQuery:withBind:withResults:", v5, 0LL, v12);
  if (v6)
  {
    id v7 = sub_10000A08C();
    int v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      sub_100033798((uint64_t)v4, v6, v8);
    }
  }

  id v9 = (void *)v14[5];
  if (v9) {
    id v10 = [v9 unsignedIntegerValue];
  }
  else {
    id v10 = 0LL;
  }

  _Block_object_dispose(&v13, 8);
  return (unint64_t)v10;
}

- (id)lastInsertRowID
{
  return +[NSNumber numberWithLongLong:]( &OBJC_CLASS___NSNumber,  "numberWithLongLong:",  sqlite3_last_insert_rowid(self->_db));
}

- (NSURL)dbURL
{
  return self->_url;
}

- (double)totalSizeMB
{
  return self->_totalSizeMB;
}

- (void).cxx_destruct
{
}

@end