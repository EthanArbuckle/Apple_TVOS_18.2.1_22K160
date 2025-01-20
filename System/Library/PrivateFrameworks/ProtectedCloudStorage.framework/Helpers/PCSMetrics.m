@interface PCSMetrics
+ (id)metrics;
- (BOOL)addKeyWithDSID:(id)a3 service:(unsigned int)a4 publicKey:(id)a5;
- (BOOL)markKeyNegativeWithDSID:(id)a3 service:(unsigned int)a4;
- (BOOL)setupDatabase;
- (NSUserDefaults)settings;
- (OS_os_log)log;
- (PCSMetrics)init;
- (id)databaseURL;
- (id)keyRegistryCallback;
- (id)markNegativeCallback;
- (int)updateCurrentWState:(_PCSIdentitySetData *)a3;
- (sqlite3)db;
- (sqlite3_stmt)addKeyStmt;
- (sqlite3_stmt)getKeyStmt;
- (sqlite3_stmt)markKeyStmt;
- (unsigned)getKeyInfoWithDSID:(id)a3 service:(unsigned int)a4 publicKey:(id)a5;
- (void)addIdentityInfoToHealthSummary:(id)a3 dsid:(id)a4 wState:(int)a5;
- (void)addMetricsToHealthSummary:(id)a3 withIdentitySet:(_PCSIdentitySetData *)a4;
- (void)dealloc;
- (void)setAddKeyStmt:(sqlite3_stmt *)a3;
- (void)setDb:(sqlite3 *)a3;
- (void)setGetKeyStmt:(sqlite3_stmt *)a3;
- (void)setLog:(id)a3;
- (void)setMarkKeyStmt:(sqlite3_stmt *)a3;
- (void)setSettings:(id)a3;
- (void)storeEventTimestamp:(unint64_t)a3;
@end

@implementation PCSMetrics

- (PCSMetrics)init
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___PCSMetrics;
  v2 = -[PCSMetrics init](&v6, "init");
  if (v2)
  {
    os_log_t v3 = os_log_create("com.apple.ProtectedCloudStorage", "PCSMetrics");
    -[PCSMetrics setLog:](v2, "setLog:", v3);

    v4 = objc_alloc_init(&OBJC_CLASS___NSUserDefaults);
    -[PCSMetrics setSettings:](v2, "setSettings:", v4);

    if (!-[PCSMetrics setupDatabase](v2, "setupDatabase"))
    {

      return 0LL;
    }
  }

  return v2;
}

- (void)dealloc
{
  int v3 = sqlite3_close(-[PCSMetrics db](self, "db"));
  if (v3) {
    sub_1000179E4(v3);
  }
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___PCSMetrics;
  -[PCSMetrics dealloc](&v4, "dealloc");
}

+ (id)metrics
{
  if (qword_10002BD88 != -1) {
    dispatch_once(&qword_10002BD88, &stru_100024E38);
  }
  return (id)qword_10002BD90;
}

- (void)addMetricsToHealthSummary:(id)a3 withIdentitySet:(_PCSIdentitySetData *)a4
{
  id v24 = a3;
  objc_super v6 = (void *)objc_claimAutoreleasedReturnValue(-[PCSMetrics settings](self, "settings"));
  v7 = (void *)objc_claimAutoreleasedReturnValue([v6 fuzzyDaysSinceKey:kPCSSettingStingrayRoll]);
  [v24 setObject:v7 forKeyedSubscript:@"rollSettingDays"];

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[PCSMetrics settings](self, "settings"));
  v9 = (void *)objc_claimAutoreleasedReturnValue([v8 fuzzyDaysSinceKey:@"timestampWEnable"]);
  [v24 setObject:v9 forKeyedSubscript:@"wEnableThisDeviceDays"];

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[PCSMetrics settings](self, "settings"));
  v11 = (void *)objc_claimAutoreleasedReturnValue([v10 fuzzyDaysSinceKey:@"timestampWDisable"]);
  [v24 setObject:v11 forKeyedSubscript:@"wDisableThisDeviceDays"];

  v12 = (void *)objc_claimAutoreleasedReturnValue(-[PCSMetrics settings](self, "settings"));
  v13 = (void *)objc_claimAutoreleasedReturnValue([v12 fuzzyDaysSinceKey:@"timestampKeyrollSuccess"]);
  [v24 setObject:v13 forKeyedSubscript:@"keyrollSucceededDays"];

  v14 = (void *)objc_claimAutoreleasedReturnValue(-[PCSMetrics settings](self, "settings"));
  v15 = (void *)objc_claimAutoreleasedReturnValue([v14 fuzzyDaysSinceKey:@"timestampKeyrollAttempted"]);
  [v24 setObject:v15 forKeyedSubscript:@"keyrollAttemptedDays"];

  v16 = (void *)objc_claimAutoreleasedReturnValue(-[PCSMetrics settings](self, "settings"));
  v17 = (void *)objc_claimAutoreleasedReturnValue([v16 fuzzyDaysSinceKey:@"timestampObserveWEnable"]);
  [v24 setObject:v17 forKeyedSubscript:@"wEnableObservedDays"];

  v18 = (void *)objc_claimAutoreleasedReturnValue(-[PCSMetrics settings](self, "settings"));
  v19 = (void *)objc_claimAutoreleasedReturnValue([v18 fuzzyDaysSinceKey:@"timestampObserveWDisable"]);
  [v24 setObject:v19 forKeyedSubscript:@"wDisableObservedDays"];

  uint64_t v20 = -[PCSMetrics updateCurrentWState:](self, "updateCurrentWState:", a4);
  v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", v20));
  [v24 setObject:v21 forKeyedSubscript:@"wState"];

  v22 = (void *)objc_claimAutoreleasedReturnValue(-[PCSMetrics settings](self, "settings"));
  v23 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithInt:]( NSNumber,  "numberWithInt:",  [v22 tristateForBoolKey:@"initialWState"]));
  [v24 setObject:v23 forKeyedSubscript:@"initialWState"];

  -[PCSMetrics addIdentityInfoToHealthSummary:dsid:wState:]( self,  "addIdentityInfoToHealthSummary:dsid:wState:",  v24,  _PCSIdentitySetGetDSID(a4),  v20);
}

- (void)addIdentityInfoToHealthSummary:(id)a3 dsid:(id)a4 wState:(int)a5
{
  id v8 = a3;
  id v9 = a4;
  uint64_t v37 = 0LL;
  v38 = &v37;
  uint64_t v39 = 0x2020000000LL;
  uint64_t v40 = 0LL;
  uint64_t v33 = 0LL;
  v34 = &v33;
  uint64_t v35 = 0x2020000000LL;
  uint64_t v36 = 0LL;
  uint64_t v29 = 0LL;
  v30 = &v29;
  uint64_t v31 = 0x2020000000LL;
  uint64_t v32 = 0LL;
  uint64_t NoRollStingrayServiceTypes = _PCSServiceItemsGetNoRollStingrayServiceTypes();
  v17 = _NSConcreteStackBlock;
  uint64_t v18 = 3221225472LL;
  v19 = sub_10000D34C;
  uint64_t v20 = &unk_100024E88;
  id v11 = (id)objc_claimAutoreleasedReturnValue(NoRollStingrayServiceTypes);
  id v21 = v11;
  id v12 = v9;
  int v28 = a5;
  id v22 = v12;
  v23 = self;
  v25 = &v37;
  v26 = &v33;
  v27 = &v29;
  id v13 = v8;
  id v24 = v13;
  PCSServiceItemsGetEachName(&v17);
  v14 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedLong:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedLong:",  v38[3],  v17,  v18,  v19,  v20));
  [v13 setObject:v14 forKeyedSubscript:@"currentInStingray"];

  v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLong:](&OBJC_CLASS___NSNumber, "numberWithUnsignedLong:", v34[3]));
  [v13 setObject:v15 forKeyedSubscript:@"currentMarkedForRolling"];

  v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLong:](&OBJC_CLASS___NSNumber, "numberWithUnsignedLong:", v30[3]));
  [v13 setObject:v16 forKeyedSubscript:@"currentWasMarkedForRolling"];

  _Block_object_dispose(&v29, 8);
  _Block_object_dispose(&v33, 8);
  _Block_object_dispose(&v37, 8);
}

- (int)updateCurrentWState:(_PCSIdentitySetData *)a3
{
  CFTypeRef cf = 0LL;
  if (a3)
  {
    uint64_t v4 = PCSIdentitySetIsWalrusWithForceFetch(a3, 1LL, &cf);
    CFTypeRef v5 = cf;
    if (cf)
    {
      LODWORD(v4) = -1;
LABEL_14:
      CFTypeRef cf = 0LL;
      CFRelease(v5);
      return v4;
    }

    objc_super v6 = (void *)objc_claimAutoreleasedReturnValue(-[PCSMetrics settings](self, "settings"));
    v7 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKey:@"initialWState"]);

    if (!v7)
    {
      id v8 = (void *)objc_claimAutoreleasedReturnValue(-[PCSMetrics settings](self, "settings"));
      [v8 setBool:v4 forKey:@"initialWState"];
    }

    id v9 = (void *)objc_claimAutoreleasedReturnValue(-[PCSMetrics settings](self, "settings"));
    unsigned int v10 = [v9 tristateForBoolKey:@"knownWState"];

    if (v10 == -1 || ((v4 ^ (v10 == 0)) & 1) == 0)
    {
      id v11 = (void *)objc_claimAutoreleasedReturnValue(-[PCSMetrics settings](self, "settings"));
      [v11 setBool:v4 forKey:@"knownWState"];

      if ((_DWORD)v4) {
        uint64_t v12 = 5LL;
      }
      else {
        uint64_t v12 = 6LL;
      }
      -[PCSMetrics storeEventTimestamp:](self, "storeEventTimestamp:", v12);
    }

    CFTypeRef v5 = cf;
    if (cf) {
      goto LABEL_14;
    }
  }

  else
  {
    LODWORD(v4) = -1;
  }

  return v4;
}

- (void)storeEventTimestamp:(unint64_t)a3
{
  objc_super v6 = objc_alloc_init(&OBJC_CLASS___NSUserDefaults);
  if (a3 - 1 > 5) {
    uint64_t v4 = 0LL;
  }
  else {
    uint64_t v4 = (uint64_t)*(&off_100024F48 + a3 - 1);
  }
  CFTypeRef v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate now](&OBJC_CLASS___NSDate, "now"));
  -[NSUserDefaults setObject:forKey:](v6, "setObject:forKey:", v5, v4);
}

- (id)keyRegistryCallback
{
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472LL;
  v3[2] = sub_10000D9BC;
  v3[3] = &unk_100024F00;
  v3[4] = self;
  return objc_retainBlock(v3);
}

- (id)markNegativeCallback
{
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472LL;
  v3[2] = sub_10000DB6C;
  v3[3] = &unk_100024F28;
  v3[4] = self;
  return objc_retainBlock(v3);
}

- (id)databaseURL
{
  int v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
  id v9 = 0LL;
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue([v3 URLForDirectory:14 inDomain:1 appropriateForURL:0 create:0 error:&v9]);
  id v5 = v9;

  if (v4)
  {
    objc_super v6 = (void *)objc_claimAutoreleasedReturnValue([v4 URLByAppendingPathComponent:@"com.apple.ProtectedCloudStorage"]);

    v7 = (void *)objc_claimAutoreleasedReturnValue([v6 URLByAppendingPathComponent:@"metrics.db"]);
  }

  else
  {
    objc_super v6 = (void *)objc_claimAutoreleasedReturnValue(-[PCSMetrics log](self, "log"));
    if (os_log_type_enabled((os_log_t)v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v11 = v5;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)v6,  OS_LOG_TYPE_DEFAULT,  "failed to locate Application Support directory: %@",  buf,  0xCu);
    }

    v7 = 0LL;
  }

  return v7;
}

- (BOOL)setupDatabase
{
  int v3 = (void *)objc_claimAutoreleasedReturnValue(-[PCSMetrics databaseURL](self, "databaseURL"));
  uint64_t v4 = v3;
  if (v3)
  {
    id v5 = v3;
    objc_super v6 = (const char *)[v5 fileSystemRepresentation];
    if (v6)
    {
      if (sqlite3_open_v2(v6, &self->_db, 6, 0LL))
      {
        v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(-[PCSMetrics log](self, "log"));
        if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412546;
          id v16 = v5;
          __int16 v17 = 2080;
          uint64_t v18 = (void *)sqlite3_errmsg(-[PCSMetrics db](self, "db"));
          _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "opening %@ failed: %s", buf, 0x16u);
        }
      }

      else
      {
        int factor = _sqlite3_maintain_load_factor(-[PCSMetrics db](self, "db"), 0LL);
        if (factor)
        {
          int v9 = factor;
          unsigned int v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(-[PCSMetrics log](self, "log"));
          if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412546;
            id v16 = v5;
            __int16 v17 = 1024;
            LODWORD(v18) = v9;
            _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "_sqlite3_maintain_load_factor for %@ failed: %d",  buf,  0x12u);
          }
        }

        errmsg = 0LL;
        if (sqlite3_exec( -[PCSMetrics db](self, "db"),  "PRAGMA journal_mode = WAL;CREATE TABLE IF NOT EXISTS keys(    dsid TEXT NOT NULL,    service INTEGER NOT "
               "NULL,    pubkey TEXT NOT NULL,    marked INTEGER NOT NULL DEFAULT 0,    PRIMARY KEY (dsid, service, pubkey));",
               0LL,
               0LL,
               &errmsg))
        {
          id v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(-[PCSMetrics log](self, "log"));
          if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412546;
            id v16 = v5;
            __int16 v17 = 2080;
            uint64_t v18 = errmsg;
            _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "table create for %@ failed: %s",  buf,  0x16u);
          }

          sqlite3_free(errmsg);
        }

        else if (!sqlite3_prepare_v2( -[PCSMetrics db](self, "db"),  "INSERT OR IGNORE INTO keys (dsid, service, pubkey) VALUES (?, ?, ?);", {
                     -1,
        }
                     &self->_addKeyStmt,
                     0LL)
               && !sqlite3_prepare_v2( -[PCSMetrics db](self, "db"),  "UPDATE keys SET marked=? WHERE dsid=? AND service=?;",
                     -1,
                     &self->_markKeyStmt,
                     0LL))
        {
          BOOL v12 = sqlite3_prepare_v2( -[PCSMetrics db](self, "db"),  "SELECT marked FROM keys WHERE dsid=? AND service=? AND pubkey=?;",
                  -1,
                  &self->_getKeyStmt,
                  0LL) == 0;
          goto LABEL_18;
        }
      }
    }
  }

  BOOL v12 = 0;
LABEL_18:

  return v12;
}

- (BOOL)addKeyWithDSID:(id)a3 service:(unsigned int)a4 publicKey:(id)a5
{
  id v8 = a5;
  id v9 = a3;
  unsigned int v10 = -[PCSMetrics addKeyStmt](self, "addKeyStmt");
  id v11 = v9;
  BOOL v12 = (const char *)[v11 UTF8String];

  BOOL v13 = !sqlite3_bind_text(v10, 1, v12, -1, 0LL)
     && !sqlite3_bind_int64(-[PCSMetrics addKeyStmt](self, "addKeyStmt"), 2, a4)
     && !sqlite3_bind_text( -[PCSMetrics addKeyStmt](self, "addKeyStmt"), 3, (const char *)[v8 UTF8String], -1, 0)
     && sqlite3_step(-[PCSMetrics addKeyStmt](self, "addKeyStmt")) == 101;
  sqlite3_reset(-[PCSMetrics addKeyStmt](self, "addKeyStmt"));

  return v13;
}

- (BOOL)markKeyNegativeWithDSID:(id)a3 service:(unsigned int)a4
{
  id v6 = a3;
  BOOL v7 = !sqlite3_bind_int(-[PCSMetrics markKeyStmt](self, "markKeyStmt"), 1, 1)
    && !sqlite3_bind_text( -[PCSMetrics markKeyStmt](self, "markKeyStmt"), 2, (const char *)[v6 UTF8String], -1, 0)
  sqlite3_reset(-[PCSMetrics markKeyStmt](self, "markKeyStmt"));

  return v7;
}

- (unsigned)getKeyInfoWithDSID:(id)a3 service:(unsigned int)a4 publicKey:(id)a5
{
  id v8 = a5;
  id v9 = a3;
  unsigned int v10 = -[PCSMetrics getKeyStmt](self, "getKeyStmt");
  id v11 = v9;
  BOOL v12 = (const char *)[v11 UTF8String];

  if (sqlite3_bind_text(v10, 1, v12, -1, 0LL)
    || sqlite3_bind_int64(-[PCSMetrics getKeyStmt](self, "getKeyStmt"), 2, a4)
    || sqlite3_bind_text( -[PCSMetrics getKeyStmt](self, "getKeyStmt"), 3, (const char *)[v8 UTF8String], -1, 0)
    || sqlite3_step(-[PCSMetrics getKeyStmt](self, "getKeyStmt")) != 100)
  {
    unsigned int v13 = 0;
  }

  else if (sqlite3_column_int(-[PCSMetrics getKeyStmt](self, "getKeyStmt"), 0))
  {
    unsigned int v13 = 3;
  }

  else
  {
    unsigned int v13 = 1;
  }

  sqlite3_reset(-[PCSMetrics getKeyStmt](self, "getKeyStmt"));

  return v13;
}

- (OS_os_log)log
{
  return (OS_os_log *)objc_getProperty(self, a2, 8LL, 1);
}

- (void)setLog:(id)a3
{
}

- (NSUserDefaults)settings
{
  return (NSUserDefaults *)objc_getProperty(self, a2, 16LL, 1);
}

- (void)setSettings:(id)a3
{
}

- (sqlite3)db
{
  return self->_db;
}

- (void)setDb:(sqlite3 *)a3
{
  self->_db = a3;
}

- (sqlite3_stmt)addKeyStmt
{
  return self->_addKeyStmt;
}

- (void)setAddKeyStmt:(sqlite3_stmt *)a3
{
  self->_addKeyStmt = a3;
}

- (sqlite3_stmt)markKeyStmt
{
  return self->_markKeyStmt;
}

- (void)setMarkKeyStmt:(sqlite3_stmt *)a3
{
  self->_markKeyStmt = a3;
}

- (sqlite3_stmt)getKeyStmt
{
  return self->_getKeyStmt;
}

- (void)setGetKeyStmt:(sqlite3_stmt *)a3
{
  self->_getKeyStmt = a3;
}

- (void).cxx_destruct
{
}

@end