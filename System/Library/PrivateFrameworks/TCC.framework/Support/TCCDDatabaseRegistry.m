@interface TCCDDatabaseRegistry
+ (char)getRegistryDir;
+ (id)stringFromBacktrace;
- (BOOL)checkIfAlreadySetUp:(BOOL)a3;
- (BOOL)checkIfKnownDBAtPath:(const char *)a3 isKnown:(BOOL *)a4;
- (BOOL)checkRegistryVersion:(BOOL)a3;
- (BOOL)registryDBUnavailable;
- (OS_dispatch_queue)registryQueue;
- (TCCDDatabaseRegistry)init;
- (id)dumpState;
- (id)fetchAllKnownDBEntries;
- (id)registryEntryFromStep:(sqlite3_stmt *)a3;
- (int)commitDB;
- (int)createDBWithSQL:(const char *)a3 atPath:(const char *)a4 withFilename:(const char *)a5;
- (int)evalDB:(const char *)a3 locked:(BOOL)a4 bind:(id)a5 step:(id)a6;
- (int)executeWithTransaction:(id)a3;
- (int)extendedErrorCode;
- (int)getVersion;
- (int)registerNewDBAtPath:(const char *)a3;
- (int)setupDB;
- (int)version;
- (sqlite3)registryDBHandle;
- (void)closeDB;
- (void)handleDBErrorAndForceCrash:(BOOL)a3;
- (void)notifyRegistryChanged;
- (void)setRegistryDBHandle:(sqlite3 *)a3;
@end

@implementation TCCDDatabaseRegistry

- (TCCDDatabaseRegistry)init
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___TCCDDatabaseRegistry;
  v2 = -[TCCDDatabaseRegistry init](&v6, "init");
  if (v2)
  {
    dispatch_queue_t v3 = dispatch_queue_create("com.apple.tcc.registry_queue", 0LL);
    registryQueue = v2->_registryQueue;
    v2->_registryQueue = (OS_dispatch_queue *)v3;

    if (!v3) {
      sub_10003C1D0();
    }
    v2->_registryDBHandle = 0LL;
    v2->_extendedErrorCode = 0;
    *(_WORD *)&v2->_isSetup = 0;
  }

  return v2;
}

- (int)getVersion
{
  return self->_version;
}

+ (char)getRegistryDir
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[TCCDPlatform currentPlatform](&OBJC_CLASS___TCCDPlatform, "currentPlatform"));
  dispatch_queue_t v3 = (void *)objc_claimAutoreleasedReturnValue([v2 server]);
  v4 = (void *)objc_claimAutoreleasedReturnValue([v3 stateDirectory]);

  if (!v4) {
    sub_10003C1E8();
  }
  id v5 = v4;
  objc_super v6 = strdup((const char *)[v5 UTF8String]);
  if (!v6) {
    sub_10003C200();
  }
  v7 = v6;

  return v7;
}

+ (id)stringFromBacktrace
{
  int v2 = backtrace(v8, 1024);
  dispatch_queue_t v3 = backtrace_symbols(v8, v2);
  v4 = objc_alloc_init(&OBJC_CLASS___NSMutableString);
  if (v3)
  {
    if (v2 >= 1)
    {
      for (unint64_t i = 0LL; i != v2; -[NSMutableString appendFormat:](v4, "appendFormat:", v6, v3[i++]))
      {
        if (!v3[i]) {
          break;
        }
        objc_super v6 = i >= (v2 - 1) ? @"%s" : @"%s\n";
      }
    }

    free(v3);
  }

  return v4;
}

- (void)handleDBErrorAndForceCrash:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(+[TCCDDatabaseRegistry stringFromBacktrace](&OBJC_CLASS___TCCDDatabaseRegistry, "stringFromBacktrace"));
  objc_super v6 = sqlite3_errmsg(-[TCCDDatabaseRegistry registryDBHandle](self, "registryDBHandle"));
  if (asprintf(&v13, "database error: %s", v6) != -1)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[TCCDPlatform currentPlatform](&OBJC_CLASS___TCCDPlatform, "currentPlatform"));
    v8 = (void *)objc_claimAutoreleasedReturnValue([v7 server]);
    v9 = (os_log_s *)objc_claimAutoreleasedReturnValue([v8 logHandle]);

    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      v12 = "";
      *(_DWORD *)buf = 136446722;
      if (v3) {
        v12 = " aborting...";
      }
      v15 = v13;
      __int16 v16 = 2080;
      v17 = v12;
      __int16 v18 = 2112;
      v19 = v5;
      _os_log_error_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, "%{public}s%s\n%@", buf, 0x20u);
    }
  }

  int v10 = sqlite3_errcode(-[TCCDDatabaseRegistry registryDBHandle](self, "registryDBHandle"));
  sqlite3_close(-[TCCDDatabaseRegistry registryDBHandle](self, "registryDBHandle"));
  -[TCCDDatabaseRegistry setRegistryDBHandle:](self, "setRegistryDBHandle:", 0LL);
  if (v10 == 26 || v10 == 11)
  {
    v11 = +[TCCDDatabaseRegistry getRegistryDir](&OBJC_CLASS___TCCDDatabaseRegistry, "getRegistryDir");
    removefile(v11, 0LL, 3u);
    free(v11);
  }

  if (v3) {
    sub_10003C218();
  }
}

- (int)evalDB:(const char *)a3 locked:(BOOL)a4 bind:(id)a5 step:(id)a6
{
  BOOL v7 = a4;
  id v10 = a5;
  id v11 = a6;
  uint64_t v24 = 0LL;
  v25 = &v24;
  uint64_t v26 = 0x2020000000LL;
  int v27 = 0;
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472LL;
  v19[2] = sub_100003588;
  v19[3] = &unk_100064C18;
  v19[4] = self;
  v22 = &v24;
  v23 = a3;
  id v12 = v10;
  id v20 = v12;
  id v13 = v11;
  id v21 = v13;
  v14 = objc_retainBlock(v19);
  v15 = v14;
  if (v7)
  {
    ((void (*)(void *))v14[2])(v14);
  }

  else
  {
    __int16 v16 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[TCCDDatabaseRegistry registryQueue](self, "registryQueue"));
    dispatch_sync(v16, v15);
  }

  int v17 = *((_DWORD *)v25 + 6);

  _Block_object_dispose(&v24, 8);
  return v17;
}

- (int)createDBWithSQL:(const char *)a3 atPath:(const char *)a4 withFilename:(const char *)a5
{
  filename = 0LL;
  v9 = (os_log_s *)mkpath_np(a4, 0x1C0u);
  id v10 = v9;
  if ((_DWORD)v9 && (_DWORD)v9 != 17)
  {
    __int16 v16 = (void *)objc_claimAutoreleasedReturnValue(+[TCCDPlatform currentPlatform](&OBJC_CLASS___TCCDPlatform, "currentPlatform"));
    int v17 = (void *)objc_claimAutoreleasedReturnValue([v16 server]);
    __int16 v18 = (os_log_s *)objc_claimAutoreleasedReturnValue([v17 logHandle]);

    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
      sub_10003C370((uint64_t)a4, (uint64_t)v10, v18);
    }
  }

  else
  {
    ppDb = -[TCCDDatabaseRegistry registryDBHandle](self, "registryDBHandle");
    if (sqlite3_open_v2(filename, &ppDb, 4227078, 0LL))
    {
      id v11 = (void *)objc_claimAutoreleasedReturnValue(+[TCCDPlatform currentPlatform](&OBJC_CLASS___TCCDPlatform, "currentPlatform"));
      id v12 = (void *)objc_claimAutoreleasedReturnValue([v11 server]);
      id v13 = (os_log_s *)objc_claimAutoreleasedReturnValue([v12 logHandle]);

      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
        sub_10003C3F8(self, v13);
      }

      self->_registryDBHandle = ppDb;
      if (-[TCCDDatabaseRegistry registryDBHandle](self, "registryDBHandle"))
      {
        uint64_t v14 = objc_opt_self(self);
        v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
        LODWORD(v10) = sqlite3_errcode((sqlite3 *)[v15 registryDBHandle]);
      }

      else
      {
        LODWORD(v10) = 12;
      }
    }

    else if (sqlite3_exec(ppDb, "PRAGMA foreign_keys=ON;", 0LL, 0LL, 0LL) {
           || sqlite3_exec(ppDb, "BEGIN", 0LL, 0LL, 0LL)
    }
           || sqlite3_exec(ppDb, a3, 0LL, 0LL, 0LL))
    {
      -[TCCDDatabaseRegistry handleDBErrorAndForceCrash:](self, "handleDBErrorAndForceCrash:", 0LL);
    }

    else
    {
      id v21 = (void *)objc_claimAutoreleasedReturnValue(+[TCCDPlatform currentPlatform](&OBJC_CLASS___TCCDPlatform, "currentPlatform"));
      v22 = (void *)objc_claimAutoreleasedReturnValue([v21 server]);
      id v10 = (os_log_s *)objc_claimAutoreleasedReturnValue([v22 logHandle]);

      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136446210;
        uint64_t v26 = filename;
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "using database: %{public}s", buf, 0xCu);
      }

      LODWORD(v10) = 0;
    }

    v19 = filename;
    self->_registryDBHandle = ppDb;
    if (v19) {
      free(v19);
    }
  }

  return (int)v10;
}

- (id)registryEntryFromStep:(sqlite3_stmt *)a3
{
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  id v5 = +[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", sqlite3_column_text(a3, 0));
  objc_super v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  [v4 setObject:v6 forKeyedSubscript:@"kTCCDDatabaseRegistryPathKey"];

  BOOL v7 = +[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", sqlite3_column_double(a3, 1));
  v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  [v4 setObject:v8 forKeyedSubscript:@"kTCCDDatabaseRegistryFirstSeenKey"];

  v9 = +[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", sqlite3_column_double(a3, 2));
  id v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
  [v4 setObject:v10 forKeyedSubscript:@"kTCCDDatabaseRegistryLastSeenKey"];

  id v11 = +[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", sqlite3_column_int(a3, 3));
  id v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
  [v4 setObject:v12 forKeyedSubscript:@"kTCCDDatabaseRegistryTrustedKey"];

  return v4;
}

- (int)registerNewDBAtPath:(const char *)a3
{
  id v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate now](&OBJC_CLASS___NSDate, "now"));
  [v5 timeIntervalSince1970];
  uint64_t v7 = v6;

  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472LL;
  v9[2] = sub_100003BB8;
  v9[3] = &unk_100064C40;
  v9[6] = v7;
  v9[4] = self;
  v9[5] = a3;
  return -[TCCDDatabaseRegistry evalDB:locked:bind:step:]( self,  "evalDB:locked:bind:step:",  "INSERT OR REPLACE INTO registry (abs_path, first_seen, last_seen, trusted)VALUES (?,?,?,?)",  0LL,  v9,  0LL);
}

- (id)dumpState
{
  uint64_t v15 = 0LL;
  __int16 v16 = &v15;
  uint64_t v17 = 0x3032000000LL;
  __int16 v18 = sub_100003D9C;
  v19 = sub_100003DAC;
  id v20 = &stru_100066238;
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472LL;
  v14[2] = sub_100003DB4;
  v14[3] = &unk_100064C68;
  v14[4] = &v15;
  uint64_t v2 = -[TCCDDatabaseRegistry evalDB:locked:bind:step:]( self,  "evalDB:locked:bind:step:",  "SELECT * FROM registry",  0LL,  0LL,  v14);
  if ((_DWORD)v2)
  {
    BOOL v3 = (void *)objc_claimAutoreleasedReturnValue(+[TCCDPlatform currentPlatform](&OBJC_CLASS___TCCDPlatform, "currentPlatform"));
    v4 = (void *)objc_claimAutoreleasedReturnValue([v3 server]);
    id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue([v4 logHandle]);

    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      sub_10003C498(v2, v5, v6, v7, v8, v9, v10, v11);
    }

    id v12 = &stru_100066238;
  }

  else
  {
    id v12 = (__CFString *)(id)v16[5];
  }

  _Block_object_dispose(&v15, 8);

  return v12;
}

- (BOOL)checkIfKnownDBAtPath:(const char *)a3 isKnown:(BOOL *)a4
{
  *a4 = 0;
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472LL;
  v12[2] = sub_100003FD8;
  v12[3] = &unk_100064C90;
  v12[4] = self;
  v12[5] = a3;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472LL;
  v11[2] = sub_100004028;
  v11[3] = &unk_100064CB0;
  v11[4] = a4;
  v11[5] = a3;
  uint64_t v6 = -[TCCDDatabaseRegistry evalDB:locked:bind:step:]( self,  "evalDB:locked:bind:step:",  [@"SELECT * FROM registry WHERE abs_path = ?" UTF8String],  0,  v12,  v11);
  if ((_DWORD)v6)
  {
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(+[TCCDPlatform currentPlatform](&OBJC_CLASS___TCCDPlatform, "currentPlatform"));
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v7 server]);
    uint64_t v9 = (os_log_s *)objc_claimAutoreleasedReturnValue([v8 logHandle]);

    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      sub_10003C4FC((uint64_t)a3, v6, v9);
    }

    *a4 = 0;
  }

  return (_DWORD)v6 == 0;
}

- (id)fetchAllKnownDBEntries
{
  uint64_t v17 = _NSConcreteStackBlock;
  uint64_t v18 = 3221225472LL;
  v19 = sub_100004270;
  id v20 = &unk_100064CD8;
  id v21 = self;
  uint64_t v2 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  v22 = v2;
  uint64_t v3 = -[TCCDDatabaseRegistry evalDB:locked:bind:step:]( v21,  "evalDB:locked:bind:step:",  "SELECT * FROM registry",  0LL,  0LL,  &v17);
  if ((_DWORD)v3)
  {
    uint64_t v4 = v3;
    id v5 = (void *)objc_claimAutoreleasedReturnValue( +[TCCDPlatform currentPlatform]( &OBJC_CLASS___TCCDPlatform,  "currentPlatform",  v17,  v18,  v19,  v20,  v21));
    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue([v5 server]);
    uint64_t v7 = (os_log_s *)objc_claimAutoreleasedReturnValue([v6 logHandle]);

    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      sub_10003C56C(v4, v7, v8, v9, v10, v11, v12, v13);
    }
  }

  uint64_t v14 = v22;
  uint64_t v15 = v2;

  return v15;
}

- (int)setupDB
{
  if (-[TCCDDatabaseRegistry registryDBUnavailable](self, "registryDBUnavailable")) {
    return 1;
  }
  uint64_t v4 = +[TCCDDatabaseRegistry getRegistryDir](&OBJC_CLASS___TCCDDatabaseRegistry, "getRegistryDir");
  if (-[TCCDDatabaseRegistry createDBWithSQL:atPath:withFilename:]( self,  "createDBWithSQL:atPath:withFilename:",  "CREATE TABLE IF NOT EXISTS admin (key TEXT PRIMARY KEY NOT NULL, value INTEGER NOT NULL);INSERT OR IGNORE INTO "
         "admin VALUES ('version', 0);INSERT OR IGNORE INTO admin VALUES ('setup', 0);CREATE TABLE IF NOT EXISTS registry"
         "(   abs_path    TEXT    NOT NULL,     first_seen  REAL    NOT NULL,     last_seen   REAL    NOT NULL,     tru"
         "sted     INTEGER NOT NULL,      PRIMARY KEY (abs_path));",
         v4,
         "REG.db")
    || (v17[0] = _NSConcreteStackBlock,
        v17[1] = 3221225472LL,
        v17[2] = sub_1000045F4,
        v17[3] = &unk_100064D00,
        v17[4] = self,
        -[TCCDDatabaseRegistry evalDB:locked:bind:step:]( self,  "evalDB:locked:bind:step:",  "SELECT value FROM admin WHERE key = 'version'",  1LL,  0LL,  v17)))
  {
LABEL_5:
    free(v4);
    return 0;
  }

  if (!-[TCCDDatabaseRegistry version](self, "version"))
  {
    if (!sqlite3_exec(-[TCCDDatabaseRegistry registryDBHandle](self, "registryDBHandle"), "COMMIT", 0LL, 0LL, 0LL))
    {
      uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue(+[TCCDPlatform currentPlatform](&OBJC_CLASS___TCCDPlatform, "currentPlatform"));
      uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue([v13 server]);
      uint64_t v15 = (os_log_s *)objc_claimAutoreleasedReturnValue([v14 logHandle]);

      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        unsigned int v16 = -[TCCDDatabaseRegistry version](self, "version");
        *(_DWORD *)buf = 67109120;
        unsigned int v19 = v16;
        _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "using registry version: %d", buf, 8u);
      }

      goto LABEL_5;
    }

    -[TCCDDatabaseRegistry handleDBErrorAndForceCrash:](self, "handleDBErrorAndForceCrash:", 0LL);
    free(v4);
    int v3 = 1;
LABEL_18:
    self->_registryDBUnavailable = 1;
    self->_extendedErrorCode = sqlite3_extended_errcode(-[TCCDDatabaseRegistry registryDBHandle](self, "registryDBHandle"));
    sqlite3_close(-[TCCDDatabaseRegistry registryDBHandle](self, "registryDBHandle"));
    self->_registryDBHandle = 0LL;
    return v3;
  }

  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(+[TCCDPlatform currentPlatform](&OBJC_CLASS___TCCDPlatform, "currentPlatform"));
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([v6 server]);
  uint64_t v8 = (os_log_s *)objc_claimAutoreleasedReturnValue([v7 logHandle]);

  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    unsigned int v9 = -[TCCDDatabaseRegistry version](self, "version");
    *(_DWORD *)buf = 67109376;
    unsigned int v19 = v9;
    __int16 v20 = 1024;
    int v21 = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "Downgrading registry from version %d to %d",  buf,  0xEu);
  }

  sqlite3_close(-[TCCDDatabaseRegistry registryDBHandle](self, "registryDBHandle"));
  -[TCCDDatabaseRegistry setRegistryDBHandle:](self, "setRegistryDBHandle:", 0LL);
  if (removefile(v4, 0LL, 3u))
  {
    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(+[TCCDPlatform currentPlatform](&OBJC_CLASS___TCCDPlatform, "currentPlatform"));
    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([v10 server]);
    uint64_t v12 = (os_log_s *)objc_claimAutoreleasedReturnValue([v11 logHandle]);

    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      sub_10003C5D0();
    }

    int v3 = 1;
  }

  else
  {
    int v3 = -[TCCDDatabaseRegistry setupDB](self, "setupDB");
  }

  -[TCCDDatabaseRegistry notifyRegistryChanged](self, "notifyRegistryChanged");
  free(v4);
  if (v3) {
    goto LABEL_18;
  }
  return v3;
}

- (int)executeWithTransaction:(id)a3
{
  id v4 = a3;
  uint64_t v11 = 0LL;
  uint64_t v12 = &v11;
  uint64_t v13 = 0x2020000000LL;
  int v14 = 0;
  id v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[TCCDDatabaseRegistry registryQueue](self, "registryQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100004708;
  block[3] = &unk_100064D28;
  block[4] = self;
  id v9 = v4;
  uint64_t v10 = &v11;
  id v6 = v4;
  dispatch_sync(v5, block);

  LODWORD(v4) = *((_DWORD *)v12 + 6);
  _Block_object_dispose(&v11, 8);
  return (int)v4;
}

- (BOOL)checkIfAlreadySetUp:(BOOL)a3
{
  uint64_t v10 = 0LL;
  uint64_t v11 = &v10;
  uint64_t v12 = 0x2020000000LL;
  int v13 = 0;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472LL;
  v9[2] = sub_1000048B8;
  v9[3] = &unk_100064C68;
  v9[4] = &v10;
  unsigned int v4 = -[TCCDDatabaseRegistry evalDB:locked:bind:step:]( self,  "evalDB:locked:bind:step:",  "SELECT value FROM admin WHERE key = 'setup'",  a3,  0LL,  v9);
  if (v4)
  {
    id v5 = (void *)objc_claimAutoreleasedReturnValue(+[TCCDPlatform currentPlatform](&OBJC_CLASS___TCCDPlatform, "currentPlatform"));
    id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 server]);
    uint64_t v7 = (os_log_s *)objc_claimAutoreleasedReturnValue([v6 logHandle]);

    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      sub_10003C5FC();
    }
  }

  else
  {
    self->_isSetup = *((_DWORD *)v11 + 6) != 0;
  }

  _Block_object_dispose(&v10, 8);
  return v4 == 0;
}

- (BOOL)checkRegistryVersion:(BOOL)a3
{
  uint64_t v10 = 0LL;
  uint64_t v11 = &v10;
  uint64_t v12 = 0x2020000000LL;
  int v13 = 0;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472LL;
  v9[2] = sub_100004A18;
  v9[3] = &unk_100064C68;
  v9[4] = &v10;
  unsigned int v4 = -[TCCDDatabaseRegistry evalDB:locked:bind:step:]( self,  "evalDB:locked:bind:step:",  "SELECT value FROM admin WHERE key = 'version'",  a3,  0LL,  v9);
  if (v4)
  {
    id v5 = (void *)objc_claimAutoreleasedReturnValue(+[TCCDPlatform currentPlatform](&OBJC_CLASS___TCCDPlatform, "currentPlatform"));
    id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 server]);
    uint64_t v7 = (os_log_s *)objc_claimAutoreleasedReturnValue([v6 logHandle]);

    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      sub_10003C628();
    }
  }

  else
  {
    self->_version = *((_DWORD *)v11 + 6);
  }

  _Block_object_dispose(&v10, 8);
  return v4 == 0;
}

- (int)commitDB
{
  return sqlite3_exec(-[TCCDDatabaseRegistry registryDBHandle](self, "registryDBHandle"), "COMMIT", 0LL, 0LL, 0LL);
}

- (void)closeDB
{
  int v3 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[TCCDDatabaseRegistry registryQueue](self, "registryQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100004AE0;
  block[3] = &unk_100064D50;
  block[4] = self;
  dispatch_sync(v3, block);
}

- (void)notifyRegistryChanged
{
  uint64_t v2 = notify_post("com.apple.tcc.registry.changed");
  if ((_DWORD)v2)
  {
    uint64_t v3 = v2;
    unsigned int v4 = (void *)objc_claimAutoreleasedReturnValue(+[TCCDPlatform currentPlatform](&OBJC_CLASS___TCCDPlatform, "currentPlatform"));
    id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 server]);
    id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue([v5 logHandle]);

    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      sub_10003C680(v3, v6, v7, v8, v9, v10, v11, v12);
    }
  }

- (OS_dispatch_queue)registryQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 24LL, 1);
}

- (int)version
{
  return self->_version;
}

- (BOOL)registryDBUnavailable
{
  return self->_registryDBUnavailable;
}

- (int)extendedErrorCode
{
  return self->_extendedErrorCode;
}

- (sqlite3)registryDBHandle
{
  return self->_registryDBHandle;
}

- (void)setRegistryDBHandle:(sqlite3 *)a3
{
  self->_registryDBHandle = a3;
}

- (void).cxx_destruct
{
}

@end