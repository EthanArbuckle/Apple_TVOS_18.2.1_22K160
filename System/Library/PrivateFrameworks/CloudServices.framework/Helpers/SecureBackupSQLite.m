@interface SecureBackupSQLite
+ (sqlite3)openDBWithURL:(id)a3 truncate:(BOOL)a4;
- (BOOL)addItem:(id)a3 withKey:(id)a4 forClass:(id)a5 error:(id *)a6;
- (BOOL)removeItemWithKey:(id)a3 error:(id *)a4;
- (BOOL)sqliteExec:(id)a3;
- (NSData)keybag;
- (NSData)keybagDigest;
- (NSData)manifestHash;
- (NSString)recordID;
- (NSURL)url;
- (SecureBackupSQLite)initWithURL:(id)a3 recordID:(id)a4;
- (id)sqliteErrorForDB:(sqlite3 *)a3;
- (int64_t)sqliteExecInteger:(id)a3;
- (sqlite3)db;
- (void)closeDB;
- (void)enumerateKeysAndItemsUsingBlock:(id)a3;
- (void)resetDBWithKeybag:(id)a3;
- (void)setDb:(sqlite3 *)a3;
- (void)setRecordID:(id)a3;
@end

@implementation SecureBackupSQLite

+ (sqlite3)openDBWithURL:(id)a3 truncate:(BOOL)a4
{
  ppDb = 0LL;
  id v4 = a3;
  uint64_t v5 = sqlite3_open_v2((const char *)[v4 fileSystemRepresentation], &ppDb, 6, 0);
  if ((_DWORD)v5)
  {
    uint64_t v6 = CloudServicesLog(v5);
    v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      sub_100043994((uint64_t)v4, &ppDb);
    }
  }

  else
  {
    uint64_t factor = _sqlite3_maintain_load_factor(ppDb, 0LL);
    if ((_DWORD)factor)
    {
      int v9 = factor;
      uint64_t v10 = CloudServicesLog(factor);
      v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
        sub_10004391C((uint64_t)v4, v9, v11);
      }
    }

    v17 = 0LL;
    uint64_t v12 = sqlite3_exec( ppDb,  "pragma journal_mode = WAL;CREATE TABLE IF NOT EXISTS items(hash BLOB PRIMARY KEY NOT NULL,class TEXT NOT NUL"
            "L, data BLOB NOT NULL);CREATE TABLE IF NOT EXISTS keybag(digest BLOB PRIMARY KEY NOT NULL,recordID TEXT NOT"
            " NULL,data BLOB NOT NULL,timestamp DATETIME DEFAULT CURRENT_TIMESTAMP);",
            0LL,
            0LL,
            (char **)&v17);
    if (!(_DWORD)v12)
    {
      v15 = ppDb;
      goto LABEL_14;
    }

    uint64_t v13 = CloudServicesLog(v12);
    v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      sub_1000438B0();
    }

    sqlite3_free(v17);
  }

  sqlite3_close(ppDb);
  v15 = 0LL;
LABEL_14:

  return v15;
}

- (SecureBackupSQLite)initWithURL:(id)a3 recordID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v17.receiver = self;
  v17.super_class = (Class)&OBJC_CLASS___SecureBackupSQLite;
  v8 = -[SecureBackupSQLite init](&v17, "init");
  if (!v8) {
    goto LABEL_9;
  }
  int v9 = (void *)objc_claimAutoreleasedReturnValue([v6 URLByAppendingPathComponent:@"backup"]);
  uint64_t v10 = objc_claimAutoreleasedReturnValue([v9 URLByAppendingPathExtension:@"sqlite3"]);
  url = v8->_url;
  v8->_url = (NSURL *)v10;

  if (v8->_url)
  {
    uint64_t v13 = (sqlite3 *)objc_msgSend((id)objc_opt_class(v8, v12), "openDBWithURL:truncate:", v8->_url, 0);
    v8->_db = v13;
    if (v8->_url && v13 != 0LL)
    {
      objc_storeStrong((id *)&v8->_recordID, a4);
LABEL_9:
      v15 = v8;
      goto LABEL_10;
    }
  }

  v15 = 0LL;
LABEL_10:

  return v15;
}

- (id)sqliteErrorForDB:(sqlite3 *)a3
{
  id v4 = +[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", sqlite3_errmsg(a3));
  uint64_t v5 = objc_claimAutoreleasedReturnValue(v4);
  id v6 = (void *)v5;
  if (v5)
  {
    NSErrorUserInfoKey v11 = NSLocalizedDescriptionKey;
    uint64_t v12 = v5;
    id v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v12,  &v11,  1LL));
  }

  else
  {
    id v7 = 0LL;
  }

  v8 = +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  kSecureBackupErrorDomain,  sqlite3_errcode(a3),  v7);
  int v9 = (void *)objc_claimAutoreleasedReturnValue(v8);

  return v9;
}

- (BOOL)addItem:(id)a3 withKey:(id)a4 forClass:(id)a5 error:(id *)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  ppStmt = 0LL;
  uint64_t v13 = -[SecureBackupSQLite db](self, "db");
  uint64_t v14 = sqlite3_prepare_v2(v13, "INSERT OR IGNORE INTO items (hash, class, data) VALUES (?, ?, ?);", -1, &ppStmt, 0LL);
  if ((_DWORD)v14)
  {
    uint64_t v15 = CloudServicesLog(v14);
    v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(v15);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
      sub_100043BF8();
    }
    goto LABEL_22;
  }

  objc_super v17 = ppStmt;
  id v18 = v11;
  uint64_t v19 = sqlite3_bind_blob64(v17, 1, [v18 bytes], (sqlite3_uint64)objc_msgSend(v18, "length"), 0);
  if ((_DWORD)v19)
  {
    uint64_t v20 = CloudServicesLog(v19);
    v21 = (os_log_s *)objc_claimAutoreleasedReturnValue(v20);
    if (!os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
      goto LABEL_17;
    }
    goto LABEL_6;
  }

  uint64_t v22 = sqlite3_bind_text(ppStmt, 2, (const char *)[v12 UTF8String], -1, 0);
  if ((_DWORD)v22)
  {
    uint64_t v23 = CloudServicesLog(v22);
    v21 = (os_log_s *)objc_claimAutoreleasedReturnValue(v23);
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
      sub_100043B7C();
    }
    goto LABEL_17;
  }

  v24 = ppStmt;
  id v25 = v10;
  uint64_t v26 = sqlite3_bind_blob64(v24, 3, [v25 bytes], (sqlite3_uint64)objc_msgSend(v25, "length"), 0);
  if ((_DWORD)v26)
  {
    uint64_t v27 = CloudServicesLog(v26);
    v21 = (os_log_s *)objc_claimAutoreleasedReturnValue(v27);
    if (!os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
LABEL_17:

      BOOL v29 = 0;
      if (a6) {
        *a6 = (id)objc_claimAutoreleasedReturnValue(-[SecureBackupSQLite sqliteErrorForDB:](self, "sqliteErrorForDB:", v13));
      }
      goto LABEL_19;
    }

- (BOOL)removeItemWithKey:(id)a3 error:(id *)a4
{
  id v6 = a3;
  ppStmt = 0LL;
  id v7 = -[SecureBackupSQLite db](self, "db");
  uint64_t v8 = sqlite3_prepare_v2(v7, "DELETE FROM items where hash = ?;", -1, &ppStmt, 0LL);
  if ((_DWORD)v8)
  {
    uint64_t v9 = CloudServicesLog(v8);
    id v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      sub_100043D08();
    }
    goto LABEL_20;
  }

  id v11 = ppStmt;
  id v12 = v6;
  uint64_t v13 = sqlite3_bind_blob64(v11, 1, [v12 bytes], (sqlite3_uint64)objc_msgSend(v12, "length"), 0);
  if ((_DWORD)v13)
  {
    uint64_t v14 = CloudServicesLog(v13);
    uint64_t v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      sub_100043B00();
    }
  }

  else
  {
    uint64_t v16 = sqlite3_step(ppStmt);
    if ((_DWORD)v16 == 101)
    {
      uint64_t v17 = sqlite3_changes(v7);
      if ((_DWORD)v17 != 1)
      {
        uint64_t v18 = CloudServicesLog(v17);
        uint64_t v19 = (os_log_s *)objc_claimAutoreleasedReturnValue(v18);
        if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
          sub_100043C74((uint64_t)v12, self);
        }
      }

      BOOL v20 = 1;
      goto LABEL_17;
    }

    uint64_t v21 = CloudServicesLog(v16);
    uint64_t v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v21);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      sub_100043A84();
    }
  }

  BOOL v20 = 0;
  if (a4) {
    *a4 = (id)objc_claimAutoreleasedReturnValue(-[SecureBackupSQLite sqliteErrorForDB:](self, "sqliteErrorForDB:", v7));
  }
LABEL_17:
  uint64_t v22 = sqlite3_finalize(ppStmt);
  if (!(_DWORD)v22) {
    goto LABEL_22;
  }
  uint64_t v23 = CloudServicesLog(v22);
  id v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v23);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
    sub_100043A08();
  }
LABEL_20:

  BOOL v20 = 0;
  if (a4) {
    *a4 = (id)objc_claimAutoreleasedReturnValue(-[SecureBackupSQLite sqliteErrorForDB:](self, "sqliteErrorForDB:", v7));
  }
LABEL_22:

  return v20;
}

- (NSData)manifestHash
{
  ppStmt = 0LL;
  uint64_t v2 = sqlite3_prepare_v2( -[SecureBackupSQLite db](self, "db"),  "SELECT hash from items ORDER BY hash;",
         -1,
         &ppStmt,
         0LL);
  if ((_DWORD)v2)
  {
    uint64_t v3 = CloudServicesLog(v2);
    id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      sub_100043D08();
    }
    uint64_t v5 = 0LL;
LABEL_18:

    return (NSData *)v5;
  }

  uint64_t v5 = objc_alloc_init(&OBJC_CLASS___NSMutableData);
  while (1)
  {
    uint64_t v6 = sqlite3_step(ppStmt);
    if ((_DWORD)v6 == 100)
    {
      id v7 = sqlite3_column_blob(ppStmt, 0);
      if (v7) {
        -[NSMutableData appendBytes:length:](v5, "appendBytes:length:", v7, sqlite3_column_bytes(ppStmt, 0));
      }
    }

    else if ((_DWORD)v6 == 101)
    {
      goto LABEL_15;
    }
  }

  uint64_t v8 = CloudServicesLog(v6);
  uint64_t v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
    sub_100043A84();
  }

LABEL_15:
  uint64_t v10 = sqlite3_finalize(ppStmt);
  if ((_DWORD)v10)
  {
    uint64_t v11 = CloudServicesLog(v10);
    id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      sub_100043A08();
    }
    goto LABEL_18;
  }

  return (NSData *)v5;
}

- (NSData)keybagDigest
{
  ppStmt = 0LL;
  uint64_t v2 = sqlite3_prepare_v2(-[SecureBackupSQLite db](self, "db"), "SELECT digest from keybag;", -1, &ppStmt, 0LL);
  if ((_DWORD)v2)
  {
    uint64_t v3 = CloudServicesLog(v2);
    id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      sub_100043D84();
    }
    uint64_t v5 = 0LL;
LABEL_16:

    return v5;
  }

  uint64_t v6 = sqlite3_step(ppStmt);
  if ((_DWORD)v6 == 100)
  {
    uint64_t v5 = (NSData *)sqlite3_column_blob(ppStmt, 0);
    if (v5) {
      uint64_t v5 = -[NSData initWithBytes:length:]( objc_alloc(&OBJC_CLASS___NSData),  "initWithBytes:length:",  v5,  sqlite3_column_bytes(ppStmt, 0));
    }
  }

  else
  {
    if ((_DWORD)v6 != 101)
    {
      uint64_t v7 = CloudServicesLog(v6);
      uint64_t v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
        sub_100043A84();
      }
    }

    uint64_t v5 = 0LL;
  }

  uint64_t v9 = sqlite3_finalize(ppStmt);
  if ((_DWORD)v9)
  {
    uint64_t v10 = CloudServicesLog(v9);
    id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      sub_100043A08();
    }
    goto LABEL_16;
  }

  return v5;
}

- (NSData)keybag
{
  ppStmt = 0LL;
  uint64_t v2 = sqlite3_prepare_v2(-[SecureBackupSQLite db](self, "db"), "SELECT data from keybag;", -1, &ppStmt, 0LL);
  if ((_DWORD)v2)
  {
    uint64_t v3 = CloudServicesLog(v2);
    id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      sub_100043E0C();
    }
    uint64_t v5 = 0LL;
LABEL_16:

    return v5;
  }

  uint64_t v6 = sqlite3_step(ppStmt);
  if ((_DWORD)v6 == 100)
  {
    uint64_t v5 = (NSData *)sqlite3_column_blob(ppStmt, 0);
    if (v5) {
      uint64_t v5 = -[NSData initWithBytes:length:]( objc_alloc(&OBJC_CLASS___NSData),  "initWithBytes:length:",  v5,  sqlite3_column_bytes(ppStmt, 0));
    }
  }

  else
  {
    if ((_DWORD)v6 != 101)
    {
      uint64_t v7 = CloudServicesLog(v6);
      uint64_t v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
        sub_100043A84();
      }
    }

    uint64_t v5 = 0LL;
  }

  uint64_t v9 = sqlite3_finalize(ppStmt);
  if ((_DWORD)v9)
  {
    uint64_t v10 = CloudServicesLog(v9);
    id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      sub_100043A08();
    }
    goto LABEL_16;
  }

  return v5;
}

- (void)enumerateKeysAndItemsUsingBlock:(id)a3
{
  id v4 = (void (**)(id, NSData *, NSString *, NSData *))a3;
  ppStmt = 0LL;
  uint64_t v5 = sqlite3_prepare_v2( -[SecureBackupSQLite db](self, "db"),  "SELECT hash, class, data from items;",
         -1,
         &ppStmt,
         0LL);
  if ((_DWORD)v5)
  {
    uint64_t v6 = CloudServicesLog(v5);
    uint64_t v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      sub_100043D08();
    }
LABEL_22:

    goto LABEL_23;
  }

  for (uint64_t i = sqlite3_step(ppStmt); (i - 102) >= 0xFFFFFFFE; uint64_t i = sqlite3_step(ppStmt))
  {
    if ((_DWORD)i == 100)
    {
      uint64_t v9 = (NSData *)sqlite3_column_blob(ppStmt, 0);
      if (v9) {
        uint64_t v9 = -[NSData initWithBytes:length:]( objc_alloc(&OBJC_CLASS___NSData),  "initWithBytes:length:",  v9,  sqlite3_column_bytes(ppStmt, 0));
      }
      uint64_t v10 = (NSString *)sqlite3_column_text(ppStmt, 1);
      if (v10) {
        uint64_t v10 = -[NSString initWithUTF8String:](objc_alloc(&OBJC_CLASS___NSString), "initWithUTF8String:", v10);
      }
      uint64_t v11 = (NSData *)sqlite3_column_blob(ppStmt, 2);
      if (v11) {
        uint64_t v11 = -[NSData initWithBytes:length:]( objc_alloc(&OBJC_CLASS___NSData),  "initWithBytes:length:",  v11,  sqlite3_column_bytes(ppStmt, 2));
      }
      v4[2](v4, v9, v10, v11);
    }

    else if ((_DWORD)i == 101)
    {
      goto LABEL_19;
    }
  }

  uint64_t v12 = CloudServicesLog(i);
  uint64_t v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
  if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
    sub_100043A84();
  }

LABEL_19:
  uint64_t v14 = sqlite3_finalize(ppStmt);
  if ((_DWORD)v14)
  {
    uint64_t v15 = CloudServicesLog(v14);
    uint64_t v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v15);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      sub_100043A08();
    }
    goto LABEL_22;
  }

- (BOOL)sqliteExec:(id)a3
{
  id v4 = a3;
  uint64_t v5 = CloudServicesLog(v4);
  uint64_t v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    uint64_t v17 = "-[SecureBackupSQLite sqliteExec:]";
    __int16 v18 = 2112;
    id v19 = v4;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%s: %@", buf, 0x16u);
  }

  errmsg = 0LL;
  uint64_t v7 = -[SecureBackupSQLite db](self, "db");
  id v8 = v4;
  uint64_t v9 = sqlite3_exec(v7, (const char *)[v8 UTF8String], 0, 0, &errmsg);
  int v10 = v9;
  if ((_DWORD)v9)
  {
    uint64_t v11 = CloudServicesLog(v9);
    uint64_t v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue(-[SecureBackupSQLite url](self, "url"));
      *(_DWORD *)buf = 138412802;
      uint64_t v17 = (const char *)v8;
      __int16 v18 = 2112;
      id v19 = v14;
      __int16 v20 = 2080;
      uint64_t v21 = errmsg;
      _os_log_error_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "%@ on %@ failed: %s", buf, 0x20u);
    }

    sqlite3_free(errmsg);
  }

  return v10 == 0;
}

- (void)resetDBWithKeybag:(id)a3
{
  id v4 = a3;
  errmsg = 0LL;
  uint64_t v5 = -[SecureBackupSQLite db](self, "db");
  uint64_t v6 = sqlite3_exec(v5, "DROP TABLE items; DROP TABLE keybag;", 0LL, 0LL, &errmsg);
  if (!(_DWORD)v6)
  {
    uint64_t v9 = sqlite3_exec( v5,  "pragma journal_mode = WAL;CREATE TABLE IF NOT EXISTS items(hash BLOB PRIMARY KEY NOT NULL,class TEXT NOT NULL"
           ", data BLOB NOT NULL);CREATE TABLE IF NOT EXISTS keybag(digest BLOB PRIMARY KEY NOT NULL,recordID TEXT NOT N"
           "ULL,data BLOB NOT NULL,timestamp DATETIME DEFAULT CURRENT_TIMESTAMP);",
           0LL,
           0LL,
           &errmsg);
    if ((_DWORD)v9)
    {
      uint64_t v10 = CloudServicesLog(v9);
      id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
        sub_100043F1C();
      }
      goto LABEL_7;
    }

    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([v4 sha1Digest]);
    pStmt = 0LL;
    uint64_t v12 = sqlite3_prepare_v2(v5, "INSERT INTO keybag (digest, recordID, data) VALUES (?, ?, ?);", -1, &pStmt, 0LL);
    if ((_DWORD)v12)
    {
      uint64_t v13 = CloudServicesLog(v12);
      uint64_t v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
        sub_100043BF8();
      }

LABEL_34:
      goto LABEL_8;
    }

    uint64_t v15 = pStmt;
    id v16 = v11;
    uint64_t v17 = sqlite3_bind_blob64(v15, 1, [v16 bytes], (sqlite3_uint64)objc_msgSend(v16, "length"), 0);
    if ((_DWORD)v17)
    {
      uint64_t v18 = CloudServicesLog(v17);
      id v19 = (os_log_s *)objc_claimAutoreleasedReturnValue(v18);
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
LABEL_15:
      }
        sub_100043B00();
    }

    else
    {
      __int16 v20 = pStmt;
      id v21 = objc_claimAutoreleasedReturnValue(-[SecureBackupSQLite recordID](self, "recordID"));
      LODWORD(v20) = sqlite3_bind_text(v20, 2, (const char *)[v21 UTF8String], -1, 0);

      if ((_DWORD)v20)
      {
        uint64_t v23 = CloudServicesLog(v22);
        id v19 = (os_log_s *)objc_claimAutoreleasedReturnValue(v23);
        if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
          sub_100043B7C();
        }
        goto LABEL_25;
      }

      v24 = pStmt;
      id v25 = v4;
      uint64_t v26 = sqlite3_bind_blob64(v24, 3, [v25 bytes], (sqlite3_uint64)objc_msgSend(v25, "length"), 0);
      if ((_DWORD)v26)
      {
        uint64_t v27 = CloudServicesLog(v26);
        id v19 = (os_log_s *)objc_claimAutoreleasedReturnValue(v27);
        if (!os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
          goto LABEL_25;
        }
        goto LABEL_15;
      }

      uint64_t v28 = sqlite3_step(pStmt);
      if ((_DWORD)v28 == 101) {
        goto LABEL_26;
      }
      uint64_t v29 = CloudServicesLog(v28);
      id v19 = (os_log_s *)objc_claimAutoreleasedReturnValue(v29);
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
        sub_100043A84();
      }
    }

- (int64_t)sqliteExecInteger:(id)a3
{
  id v4 = a3;
  ppStmt = 0LL;
  uint64_t v5 = -[SecureBackupSQLite db](self, "db");
  id v6 = v4;
  uint64_t v7 = sqlite3_prepare_v2(v5, (const char *)[v6 UTF8String], -1, &ppStmt, 0);
  if ((_DWORD)v7)
  {
    uint64_t v8 = CloudServicesLog(v7);
    uint64_t v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      sub_100043D08();
    }
    int64_t v10 = -1LL;
LABEL_16:

    goto LABEL_17;
  }

  int64_t v10 = -1LL;
  while (1)
  {
    uint64_t v11 = sqlite3_step(ppStmt);
    if ((_DWORD)v11 != 100) {
      goto LABEL_13;
    }
    int v12 = sqlite3_column_int(ppStmt, 0);
    int64_t v10 = v12;
    if (v12 == -1)
    {
      int64_t v10 = -1LL;
      goto LABEL_13;
    }
  }

  uint64_t v13 = CloudServicesLog(v11);
  uint64_t v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
  if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
    sub_100043A84();
  }

LABEL_13:
  uint64_t v15 = sqlite3_finalize(ppStmt);
  if ((_DWORD)v15)
  {
    uint64_t v16 = CloudServicesLog(v15);
    uint64_t v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      sub_100043A08();
    }
    goto LABEL_16;
  }

- (void)closeDB
{
  uint64_t v3 = sqlite3_close(-[SecureBackupSQLite db](self, "db"));
  if ((_DWORD)v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = CloudServicesLog(v3);
    id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      sub_100043E94(self, v4, v6);
    }
  }

  -[SecureBackupSQLite setDb:](self, "setDb:", 0LL);
}

- (sqlite3)db
{
  return self->_db;
}

- (void)setDb:(sqlite3 *)a3
{
  self->_db = a3;
}

- (NSURL)url
{
  return (NSURL *)objc_getProperty(self, a2, 16LL, 1);
}

- (NSString)recordID
{
  return (NSString *)objc_getProperty(self, a2, 24LL, 1);
}

- (void)setRecordID:(id)a3
{
}

- (void).cxx_destruct
{
}

@end