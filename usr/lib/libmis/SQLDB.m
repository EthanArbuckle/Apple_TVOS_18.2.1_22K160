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
  uint64_t v39 = *MEMORY[0x1895F89C0];
  id v7 = a3;
  v35.receiver = self;
  v35.super_class = (Class)&OBJC_CLASS___SQLDB;
  v8 = -[SQLDB init](&v35, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_url, a3);
    dispatch_semaphore_t v10 = dispatch_semaphore_create(1LL);
    transactionSem = v9->_transactionSem;
    v9->_transactionSem = (OS_dispatch_semaphore *)v10;

    if (!v9->_transactionSem) {
      goto LABEL_16;
    }
    url = v9->_url;
    ppDb = 0LL;
    if (v4) {
      int v16 = 65537;
    }
    else {
      int v16 = 65542;
    }
    id v17 = objc_msgSend_path(url, v12, v13, v14);
    v21 = (const char *)objc_msgSend_UTF8String(v17, v18, v19, v20);
    int v22 = sqlite3_open_v2(v21, &ppDb, v16, 0LL);

    if (v22)
    {
      sub_184068378();
      v26 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 67109120;
        int v38 = v22;
        _os_log_error_impl(&dword_18404B000, v26, OS_LOG_TYPE_ERROR, "Error opening DB: %d", buf, 8u);
      }
    }

    db = ppDb;
    v9->_db = ppDb;
    if (!db
      || (!v4
        ? (objc_msgSend_setupPermissions(v9, v23, v24, v25), BOOL v28 = sqlite3_db_readonly(v9->_db, 0) == 1, db = v9->_db)
        : (sqlite3 *)(BOOL v28 = 1),
          (v9->_readonly = v28, sqlite3_busy_timeout(db, 300000), !v9->_readonly)
       && (objc_msgSend_executeQuery_withBind_withResults_( v9,  v29,  (uint64_t)@"PRAGMA journal_mode = WAL",  0,  0),  objc_msgSend_executeQuery_withBind_withResults_( v9,  v30,  (uint64_t)@"PRAGMA foreign_keys = ON",  0,  0),  (objc_msgSend_setupSchema(v9, v31, v32, v33) & 1) == 0)))
    {
LABEL_16:

      v9 = 0LL;
    }
  }

  return v9;
}

- (SQLDB)initWithDatabaseURL:(id)a3
{
  return (SQLDB *)MEMORY[0x189616718](self, sel_initWithDatabaseURL_asReadOnly_, a3, 0LL);
}

- (NSURL)walURL
{
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_lastPathComponent(self->_url, v6, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_stringWithFormat_(NSString, v10, (uint64_t)@"%@-wal", v11, v9);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_URLByAppendingPathComponent_(v5, v13, (uint64_t)v12, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSURL *)v15;
}

- (NSURL)shmURL
{
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_lastPathComponent(self->_url, v6, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_stringWithFormat_(NSString, v10, (uint64_t)@"%@-shm", v11, v9);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_URLByAppendingPathComponent_(v5, v13, (uint64_t)v12, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSURL *)v15;
}

- (BOOL)setupSchema
{
  int v2 = objc_msgSend_executeQuery_withBind_withResults_( self,  a2,  (uint64_t)@"CREATE TABLE IF NOT EXISTS settings(name TEXT, value TEXT, PRIMARY KEY (name))",  0,  0);
  if (v2)
  {
    sub_184068378();
    uint64_t v3 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v5 = 0;
      _os_log_error_impl(&dword_18404B000, v3, OS_LOG_TYPE_ERROR, "Database failed to initialize.", v5, 2u);
    }
  }

  return v2 == 0;
}

- (void)setupPermissions
{
  id v8 = objc_msgSend_path(self->_url, a2, v2, v3);
  uint64_t v7 = (const char *)objc_msgSend_UTF8String(v8, v4, v5, v6);
  sub_18406F5B0(v7, 384);
}

- (void)dealloc
{
  db = self->_db;
  if (db) {
    sqlite3_close(db);
  }
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___SQLDB;
  -[SQLDB dealloc](&v4, sel_dealloc);
}

- (int)executeQuery:(id)a3 withBind:(id)a4 withResults:(id)a5
{
  id v8 = a5;
  v12[0] = MEMORY[0x1895F87A8];
  v12[1] = 3221225472LL;
  v12[2] = sub_184061E24;
  v12[3] = &unk_189DAB4F8;
  id v13 = v8;
  id v9 = v8;
  LODWORD(a4) = objc_msgSend_executeQuery_withBind_withCancellableResults_(self, v10, (uint64_t)a3, (uint64_t)a4, v12);

  return (int)a4;
}

- (int)executeQuery:(id)a3 withBind:(id)a4 withCancellableResults:(id)a5
{
  uint64_t v75 = *MEMORY[0x1895F89C0];
  id v8 = a3;
  id v9 = (void (**)(id, sqlite3_stmt *))a4;
  dispatch_semaphore_t v10 = (uint64_t (**)(id, sqlite3_stmt *, void *))a5;
  ppStmt = 0LL;
  db = self->_db;
  id v12 = v8;
  int v16 = (const char *)objc_msgSend_UTF8String(v12, v13, v14, v15);
  int v17 = sqlite3_prepare_v2(db, v16, -1, &ppStmt, 0LL);
  if (v17)
  {
    int v18 = v17;
    sub_184068378();
    uint64_t v19 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      v63 = sqlite3_errmsg(self->_db);
      int v64 = sqlite3_errcode(self->_db);
      *(_DWORD *)buf = 136315394;
      *(void *)v74 = v63;
      *(_WORD *)&v74[8] = 1024;
      *(_DWORD *)&v74[10] = v64;
      _os_log_error_impl(&dword_18404B000, v19, OS_LOG_TYPE_ERROR, "SQL error '%s' (%1d)", buf, 0x12u);
    }

    sub_184068378();
    uint64_t v20 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 67109378;
      *(_DWORD *)v74 = v18;
      *(_WORD *)&v74[4] = 2112;
      *(void *)&v74[6] = v12;
      _os_log_error_impl(&dword_18404B000, v20, OS_LOG_TYPE_ERROR, "Prepare error (%d) on query: %@", buf, 0x12u);
    }

    v21 = (void *)MEMORY[0x189604A60];
LABEL_39:
  }

  else
  {
    if (v9) {
      v9[2](v9, ppStmt);
    }
    if (v10 && (int v22 = ppStmt, (v23 = sqlite3_column_count(ppStmt)) != 0))
    {
      int v26 = v23;
      objc_msgSend_dictionaryWithCapacity_(MEMORY[0x189603FC8], v24, 2 * v23, v25);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      if (v26 >= 1)
      {
        v69 = self;
        id v70 = v12;
        v71 = v9;
        uint64_t v27 = 0LL;
        do
        {
          BOOL v28 = sqlite3_column_origin_name(v22, v27);
          v29 = sqlite3_column_name(v22, v27);
          v30 = sqlite3_column_table_name(v22, v27);
          if (v28 && v30)
          {
            objc_msgSend_stringWithUTF8String_(NSString, v31, (uint64_t)v30, v32);
            uint64_t v33 = (void *)objc_claimAutoreleasedReturnValue();
            if (objc_msgSend_hasSuffix_(v33, v34, (uint64_t)@"s", v35))
            {
              uint64_t v39 = objc_msgSend_length(v33, v36, v37, v38);
              uint64_t v42 = objc_msgSend_substringToIndex_(v33, v40, v39 - 1, v41);

              uint64_t v33 = (void *)v42;
            }

            objc_msgSend_numberWithInt_(MEMORY[0x189607968], v36, v27, v38);
            v43 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_stringWithFormat_(NSString, v44, (uint64_t)@"%@_%s", v45, v33, v28);
            v46 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_setObject_forKeyedSubscript_(v21, v47, (uint64_t)v43, (uint64_t)v46);
          }

          if (v29)
          {
            objc_msgSend_numberWithInt_(MEMORY[0x189607968], v31, v27, v32);
            v48 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_stringWithUTF8String_(NSString, v49, (uint64_t)v29, v50);
            v51 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_setObject_forKeyedSubscript_(v21, v52, (uint64_t)v48, (uint64_t)v51);
          }

          uint64_t v27 = (v27 + 1);
        }

        while (v26 != (_DWORD)v27);
        id v12 = v70;
        id v9 = v71;
        self = v69;
      }
    }

    else
    {
      v21 = (void *)MEMORY[0x189604A60];
    }

    do
    {
      int v53 = sqlite3_step(ppStmt);
      int v18 = v53;
      if ((v53 - 102) <= 0xFFFFFFFD)
      {
        sub_184068378();
        v56 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v56, OS_LOG_TYPE_ERROR))
        {
          v67 = sqlite3_errmsg(self->_db);
          int v68 = sqlite3_errcode(self->_db);
          *(_DWORD *)buf = 136315394;
          *(void *)v74 = v67;
          *(_WORD *)&v74[8] = 1024;
          *(_DWORD *)&v74[10] = v68;
          _os_log_error_impl(&dword_18404B000, v56, OS_LOG_TYPE_ERROR, "SQL error '%s' (%1d)", buf, 0x12u);
        }

        sub_184068378();
        uint64_t v20 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 67109378;
          *(_DWORD *)v74 = v18;
          *(_WORD *)&v74[4] = 2112;
          *(void *)&v74[6] = v12;
          _os_log_error_impl(&dword_18404B000, v20, OS_LOG_TYPE_ERROR, "Step error (%d) on query: %@", buf, 0x12u);
        }

        goto LABEL_39;
      }

      BOOL v54 = v53 == 100;
      char v55 = 1;
      if (v10 && v18 == 100)
      {
        char v55 = v10[2](v10, ppStmt, v21);
        BOOL v54 = 1;
      }
    }

    while (v54 && (v55 & 1) != 0);
    if (v54) {
      int v18 = 100;
    }
    if (((!v54 | v55) & 1) == 0)
    {
      sub_184068378();
      uint64_t v20 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl(&dword_18404B000, v20, OS_LOG_TYPE_ERROR, "Query canceled", buf, 2u);
      }

      int v18 = 4;
      goto LABEL_39;
    }
  }

  int v57 = v18;
  if (ppStmt)
  {
    int v57 = sqlite3_finalize(ppStmt);
    if (v57)
    {
      sub_184068378();
      v58 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v58, OS_LOG_TYPE_ERROR))
      {
        v65 = sqlite3_errmsg(self->_db);
        int v66 = sqlite3_errcode(self->_db);
        *(_DWORD *)buf = 136315394;
        *(void *)v74 = v65;
        *(_WORD *)&v74[8] = 1024;
        *(_DWORD *)&v74[10] = v66;
        _os_log_error_impl(&dword_18404B000, v58, OS_LOG_TYPE_ERROR, "SQL error '%s' (%1d)", buf, 0x12u);
      }

      sub_184068378();
      v59 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v59, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 67109378;
        *(_DWORD *)v74 = v57;
        *(_WORD *)&v74[4] = 2112;
        *(void *)&v74[6] = v12;
        _os_log_error_impl(&dword_18404B000, v59, OS_LOG_TYPE_ERROR, "Finalize error (%d) on query: %@", buf, 0x12u);
      }
    }
  }

  if (v18 == 101) {
    int v60 = v57;
  }
  else {
    int v60 = v18;
  }
  if (v18) {
    int v61 = v60;
  }
  else {
    int v61 = v57;
  }

  return v61;
}

- (int)transaction:(id)a3
{
  return MEMORY[0x189616718](self, sel_transaction_immediate_, a3, 0LL);
}

- (int)transaction:(id)a3 immediate:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v6 = (unsigned int (**)(void))a3;
  dispatch_semaphore_wait((dispatch_semaphore_t)self->_transactionSem, 0xFFFFFFFFFFFFFFFFLL);
  if (v4) {
    int v8 = objc_msgSend_executeQuery_withBind_withResults_( self,  v7,  (uint64_t)@"begin immediate transaction",  0,  0);
  }
  else {
    int v8 = objc_msgSend_executeQuery_withBind_withResults_(self, v7, (uint64_t)@"begin transaction", 0, 0);
  }
  int v9 = v8;
  if (!v8)
  {
    if (v6[2](v6)
      && !objc_msgSend_executeQuery_withBind_withResults_( self,  v10,  (uint64_t)@"end transaction",  0,  0))
    {
      int v9 = 0;
    }

    else
    {
      int v9 = objc_msgSend_executeQuery_withBind_withResults_(self, v10, (uint64_t)@"rollback transaction", 0, 0);
    }
  }

  dispatch_semaphore_signal((dispatch_semaphore_t)self->_transactionSem);

  return v9;
}

- (int)checkpoint
{
  return sqlite3_wal_checkpoint_v2(self->_db, 0LL, 3, 0LL, 0LL);
}

- (id)readSetting:(id)a3
{
  id v4 = a3;
  uint64_t v13 = 0LL;
  uint64_t v14 = &v13;
  uint64_t v15 = 0x3032000000LL;
  int v16 = sub_184061C90;
  int v17 = sub_184061CA0;
  id v18 = 0LL;
  uint64_t v5 = MEMORY[0x1895F87A8];
  v11[0] = MEMORY[0x1895F87A8];
  v11[1] = 3221225472LL;
  v11[2] = sub_184061D98;
  v11[3] = &unk_189DAB520;
  id v6 = v4;
  id v12 = v6;
  v10[0] = v5;
  v10[1] = 3221225472LL;
  v10[2] = sub_184061DD4;
  v10[3] = &unk_189DAB548;
  v10[4] = &v13;
  objc_msgSend_executeQuery_withBind_withResults_( self,  v7,  (uint64_t)@"SELECT value FROM settings WHERE name = ?1",  (uint64_t)v11,  v10);
  id v8 = (id)v14[5];

  _Block_object_dispose(&v13, 8);
  return v8;
}

- (void)setSetting:(id)a3 toValue:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v11[0] = MEMORY[0x1895F87A8];
  v11[1] = 3221225472LL;
  v11[2] = sub_184061D34;
  v11[3] = &unk_189DAB570;
  id v12 = v6;
  id v13 = v7;
  id v8 = v7;
  id v9 = v6;
  objc_msgSend_executeQuery_withBind_withResults_( self,  v10,  (uint64_t)@"INSERT OR REPLACE INTO settings (name, value) VALUES (?1, ?2)",  (uint64_t)v11,  0);
}

- (void)deleteSetting:(id)a3
{
  id v4 = a3;
  v7[0] = MEMORY[0x1895F87A8];
  v7[1] = 3221225472LL;
  v7[2] = sub_184061CF8;
  v7[3] = &unk_189DAB520;
  id v8 = v4;
  id v5 = v4;
  objc_msgSend_executeQuery_withBind_withResults_( self,  v6,  (uint64_t)@"DELETE FROM settings WHERE name = ?1",  (uint64_t)v7,  0);
}

- (unint64_t)tableRowCount:(id)a3
{
  uint64_t v28 = *MEMORY[0x1895F89C0];
  id v4 = a3;
  uint64_t v18 = 0LL;
  uint64_t v19 = &v18;
  uint64_t v20 = 0x3032000000LL;
  v21 = sub_184061C90;
  int v22 = sub_184061CA0;
  id v23 = 0LL;
  objc_msgSend_stringWithFormat_(NSString, v5, (uint64_t)@"SELECT COUNT(*) FROM %@", v6, v4);
  id v7 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = MEMORY[0x1895F87A8];
  v17[1] = 3221225472LL;
  v17[2] = sub_184061CA8;
  v17[3] = &unk_189DAB548;
  v17[4] = &v18;
  int v12 = objc_msgSend_executeQuery_withBind_withResults_(self, v8, (uint64_t)v7, 0, v17);
  if (v12)
  {
    sub_184068378();
    id v13 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      id v25 = v4;
      __int16 v26 = 1024;
      int v27 = v12;
      _os_log_error_impl(&dword_18404B000, v13, OS_LOG_TYPE_ERROR, "Unable to table row count for %@: %d", buf, 0x12u);
    }
  }

  uint64_t v14 = (void *)v19[5];
  if (v14) {
    unint64_t v15 = objc_msgSend_unsignedIntegerValue(v14, v9, v10, v11);
  }
  else {
    unint64_t v15 = 0LL;
  }

  _Block_object_dispose(&v18, 8);
  return v15;
}

- (id)lastInsertRowID
{
  uint64_t v2 = (void *)MEMORY[0x189607968];
  sqlite3_int64 insert_rowid = sqlite3_last_insert_rowid(self->_db);
  return (id)objc_msgSend_numberWithLongLong_(v2, v4, insert_rowid, v5);
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

+ (id)databaseWithURL:(id)a3
{
  uint64_t v13 = *MEMORY[0x1895F89C0];
  id v4 = a3;
  sub_184068378();
  uint64_t v5 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v11 = 138412290;
    id v12 = v4;
    _os_log_impl(&dword_18404B000, v5, OS_LOG_TYPE_DEFAULT, "DB being loaded from %@", (uint8_t *)&v11, 0xCu);
  }

  id v6 = objc_alloc((Class)a1);
  id v9 = (void *)objc_msgSend_initWithDatabaseURL_(v6, v7, (uint64_t)v4, v8);

  return v9;
}

@end