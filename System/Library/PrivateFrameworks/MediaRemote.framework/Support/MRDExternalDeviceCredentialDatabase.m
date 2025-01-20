@interface MRDExternalDeviceCredentialDatabase
- (BOOL)clearExpiredTokenRecords;
- (BOOL)saveTokenRecord:(id)a3;
- (MRDExternalDeviceCredentialDatabase)init;
- (MRDExternalDeviceCredentialDatabase)initWithPath:(id)a3;
- (NSArray)tokenRecords;
- (NSString)path;
- (id)_loadTokenRecords;
- (void)_initializeDatabaseSchema;
- (void)_openDatabase;
- (void)_validateDatabase;
- (void)dealloc;
@end

@implementation MRDExternalDeviceCredentialDatabase

- (MRDExternalDeviceCredentialDatabase)initWithPath:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)&OBJC_CLASS___MRDExternalDeviceCredentialDatabase;
  v5 = -[MRDExternalDeviceCredentialDatabase init](&v10, "init");
  if (v5)
  {
    v6 = (NSString *)[v4 copy];
    path = v5->_path;
    v5->_path = v6;

    tokenRecords = v5->_tokenRecords;
    v5->_tokenRecords = 0LL;

    -[MRDExternalDeviceCredentialDatabase _openDatabase](v5, "_openDatabase");
    -[MRDExternalDeviceCredentialDatabase _validateDatabase](v5, "_validateDatabase");
    -[MRDExternalDeviceCredentialDatabase clearExpiredTokenRecords](v5, "clearExpiredTokenRecords");
  }

  return v5;
}

- (MRDExternalDeviceCredentialDatabase)init
{
  return -[MRDExternalDeviceCredentialDatabase initWithPath:](self, "initWithPath:", 0LL);
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___MRDExternalDeviceCredentialDatabase;
  -[MRDExternalDeviceCredentialDatabase dealloc](&v3, "dealloc");
}

- (NSArray)tokenRecords
{
  tokenRecords = self->_tokenRecords;
  if (!tokenRecords)
  {
    id v4 = (void *)objc_claimAutoreleasedReturnValue(-[MRDExternalDeviceCredentialDatabase _loadTokenRecords](self, "_loadTokenRecords"));
    v5 = (NSMutableArray *)[v4 mutableCopy];
    v6 = self->_tokenRecords;
    self->_tokenRecords = v5;

    tokenRecords = self->_tokenRecords;
  }

  return (NSArray *)-[NSMutableArray copy](tokenRecords, "copy");
}

- (BOOL)saveTokenRecord:(id)a3
{
  id v4 = a3;
  if (!v4)
  {
    BOOL v11 = 0;
    goto LABEL_27;
  }

  ppStmt = 0LL;
  int v5 = sqlite3_prepare_v2( self->_dbHandle,  "INSERT INTO auth_tokens (device_id, auth_token, date_created, expiration_date) VALUES (?, ?, ?, ?);",
         -1,
         &ppStmt,
         0LL);
  if (!v5)
  {
    v12 = ppStmt;
    v13 = (void *)objc_claimAutoreleasedReturnValue([v4 deviceID]);
    int v7 = sub_10005D2DC(v12, 1, v13);

    if (!v7) {
      goto LABEL_20;
    }
    v14 = ppStmt;
    v15 = (void *)objc_claimAutoreleasedReturnValue([v4 token]);
    int v7 = sub_10005D2DC(v14, 2, v15);

    if (!v7) {
      goto LABEL_20;
    }
    v16 = ppStmt;
    v17 = (void *)objc_claimAutoreleasedReturnValue([v4 dateCreated]);
    [v17 timeIntervalSince1970];
    int v7 = sqlite3_bind_int64(v16, 3, (uint64_t)v18);

    if (v7)
    {
      uint64_t v20 = _MRLogForCategory(0LL, v19);
      v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v20);
      if (!os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_6;
      }
      *(_WORD *)v34 = 0;
      objc_super v10 = "Error binding statement to database query";
    }

    else
    {
      v21 = ppStmt;
      v22 = (void *)objc_claimAutoreleasedReturnValue([v4 expirationDate]);
      [v22 timeIntervalSince1970];
      int v7 = sqlite3_bind_int64(v21, 4, (uint64_t)v23);

      if (v7)
      {
        uint64_t v25 = _MRLogForCategory(0LL, v24);
        v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v25);
        if (!os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT)) {
          goto LABEL_6;
        }
        *(_WORD *)v34 = 0;
        objc_super v10 = "Error binding statement to database query";
      }

      else
      {
        int v26 = sqlite3_step(ppStmt);
        int v7 = v26;
        if (!v26 || v26 == 101)
        {
          tokenRecords = self->_tokenRecords;
          if (tokenRecords) {
            -[NSMutableArray addObject:](tokenRecords, "addObject:", v4);
          }
          goto LABEL_20;
        }

        uint64_t v33 = _MRLogForCategory(0LL, v27);
        v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v33);
        if (!os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT)) {
          goto LABEL_6;
        }
        *(_WORD *)v34 = 0;
        objc_super v10 = "Error executing statement to insert auth token";
      }
    }

    goto LABEL_5;
  }

  int v7 = v5;
  uint64_t v8 = _MRLogForCategory(0LL, v6);
  v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v34 = 0;
    objc_super v10 = "Error preparing statement to insert auth token";
LABEL_5:
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, v10, v34, 2u);
  }

- (BOOL)clearExpiredTokenRecords
{
  ppStmt = 0LL;
  int v3 = sqlite3_prepare_v2(self->_dbHandle, "DELETE FROM auth_tokens WHERE expiration_date < ?;", -1, &ppStmt, 0LL);
  if (!v3)
  {
    int v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
    uint64_t v8 = ppStmt;
    [v7 timeIntervalSince1970];
    int v10 = sqlite3_bind_int64(v8, 1, (uint64_t)v9);
    if (v10)
    {
      int v5 = v10;
      uint64_t v12 = _MRLogForCategory(0LL, v11);
      tokenRecords = (NSMutableArray *)objc_claimAutoreleasedReturnValue(v12);
      if (!os_log_type_enabled((os_log_t)tokenRecords, OS_LOG_TYPE_DEFAULT))
      {
LABEL_11:

        goto LABEL_12;
      }

      *(_WORD *)v22 = 0;
      v14 = "Failed to bind date param";
    }

    else
    {
      int v15 = sqlite3_step(ppStmt);
      int v5 = v15;
      if (!v15 || v15 == 101)
      {
        tokenRecords = self->_tokenRecords;
        self->_tokenRecords = 0LL;
        goto LABEL_11;
      }

      uint64_t v21 = _MRLogForCategory(0LL, v16);
      tokenRecords = (NSMutableArray *)objc_claimAutoreleasedReturnValue(v21);
      if (!os_log_type_enabled((os_log_t)tokenRecords, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_11;
      }
      *(_WORD *)v22 = 0;
      v14 = "Error executing statement to delete expired tokens";
    }

    _os_log_impl((void *)&_mh_execute_header, (os_log_t)tokenRecords, OS_LOG_TYPE_DEFAULT, v14, v22, 2u);
    goto LABEL_11;
  }

  int v5 = v3;
  uint64_t v6 = _MRLogForCategory(0LL, v4);
  int v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled((os_log_t)v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v22 = 0;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)v7,  OS_LOG_TYPE_DEFAULT,  "Error preparing statement to delete expired auth tokens",  v22,  2u);
  }

- (void)_openDatabase
{
  int v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(-[NSString stringByDeletingLastPathComponent](self->_path, "stringByDeletingLastPathComponent"));
  if (([v3 fileExistsAtPath:v4] & 1) == 0)
  {
    uint64_t v15 = 0LL;
    [v3 createDirectoryAtPath:v4 withIntermediateDirectories:1 attributes:0 error:&v15];
  }

  p_dbHandle = &self->_dbHandle;
  sqlite3_open_v2( -[NSString fileSystemRepresentation](self->_path, "fileSystemRepresentation"),  &self->_dbHandle,  6,  0LL);
  dbHandle = self->_dbHandle;
  int v14 = 1;
  if (sqlite3_file_control(dbHandle, 0LL, 10, &v14))
  {
    uint64_t v8 = _MRLogForCategory(0LL, v7);
    double v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v13 = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "WARNING: could not enable WAL option on database file",  v13,  2u);
    }
  }

  if (sqlite3_exec(*p_dbHandle, "PRAGMA journal_mode=WAL", 0LL, 0LL, 0LL))
  {
    uint64_t v11 = _MRLogForCategory(0LL, v10);
    uint64_t v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v13 = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEFAULT,  "WARNING: could not enable WAL option on database connection",  v13,  2u);
    }
  }
}

- (void)_validateDatabase
{
  dbHandle = self->_dbHandle;
  ppStmt = 0LL;
  if (sqlite3_prepare_v2(dbHandle, "PRAGMA user_version;", -1, &ppStmt, 0LL))
  {
    uint64_t v5 = _MRLogForCategory(0LL, v4);
    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
    if (!os_log_type_enabled((os_log_t)v6, OS_LOG_TYPE_DEFAULT))
    {
LABEL_5:

      unint64_t v8 = 0LL;
      goto LABEL_6;
    }

    *(_DWORD *)buf = 136315138;
    *(void *)&buf[4] = "PRAGMA user_version;";
    uint64_t v7 = "Error preparing database statement: %s";
LABEL_4:
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)v6, OS_LOG_TYPE_DEFAULT, v7, buf, 0xCu);
    goto LABEL_5;
  }

  int v13 = sqlite3_step(ppStmt);
  unint64_t v8 = 0LL;
  if (v13 && v13 != 101)
  {
    if (v13 == 100)
    {
      unint64_t v8 = sqlite3_column_int64(ppStmt, 0);
      goto LABEL_6;
    }

    uint64_t v15 = _MRLogForCategory(0LL, v14);
    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(v15);
    if (!os_log_type_enabled((os_log_t)v6, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_5;
    }
    *(_DWORD *)buf = 136315138;
    *(void *)&buf[4] = "PRAGMA user_version;";
    uint64_t v7 = "Error stepping database statement: %s";
    goto LABEL_4;
  }

- (void)_initializeDatabaseSchema
{
    0LL,
    0LL,
    0LL);
  int v3 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"PRAGMA user_version = %d",  1LL));
  dbHandle = self->_dbHandle;
  id v5 = v3;
  sqlite3_exec(dbHandle, (const char *)[v5 UTF8String], 0, 0, 0);
}

- (id)_loadTokenRecords
{
  int v3 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  ppStmt = 0LL;
  if (sqlite3_prepare_v2( self->_dbHandle,  "SELECT auth_token, date_created, expiration_date, device_id FROM auth_tokens;",
         -1,
         &ppStmt,
         0LL))
  {
    uint64_t v5 = _MRLogForCategory(0LL, v4);
    uint64_t v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v27 = 0;
      uint64_t v7 = "Error reading from auth token database";
      unint64_t v8 = (uint8_t *)&v27;
LABEL_12:
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, v7, v8, 2u);
      goto LABEL_13;
    }

    goto LABEL_13;
  }

  while (1)
  {
    do
      int v9 = sqlite3_step(ppStmt);
    while (!v9);
    if (v9 != 100) {
      break;
    }
    uint64_t v11 = objc_alloc_init(&OBJC_CLASS___MRDMutableExternalDeviceAuthTokenRecord);
    uint64_t v12 = +[NSString stringWithUTF8String:]( &OBJC_CLASS___NSString,  "stringWithUTF8String:",  sqlite3_column_text(ppStmt, 0));
    int v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
    -[MRDMutableExternalDeviceAuthTokenRecord setToken:](v11, "setToken:", v13);

    uint64_t v14 = +[NSDate dateWithTimeIntervalSince1970:]( &OBJC_CLASS___NSDate,  "dateWithTimeIntervalSince1970:",  (double)sqlite3_column_int64(ppStmt, 1));
    uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
    -[MRDMutableExternalDeviceAuthTokenRecord setDateCreated:](v11, "setDateCreated:", v15);

    uint64_t v16 = +[NSDate dateWithTimeIntervalSince1970:]( &OBJC_CLASS___NSDate,  "dateWithTimeIntervalSince1970:",  (double)sqlite3_column_int64(ppStmt, 2));
    uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue(v16);
    -[MRDMutableExternalDeviceAuthTokenRecord setExpirationDate:](v11, "setExpirationDate:", v17);

    uint64_t v18 = sqlite3_column_text(ppStmt, 3);
    if (v18)
    {
      uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", v18));
      -[MRDMutableExternalDeviceAuthTokenRecord setDeviceID:](v11, "setDeviceID:", v19);
    }

    -[NSMutableArray addObject:](v3, "addObject:", v11);
  }

  if (v9 != 101)
  {
    uint64_t v20 = _MRLogForCategory(0LL, v10);
    uint64_t v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v20);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      uint64_t v7 = "Error stepping database statement";
      unint64_t v8 = buf;
      goto LABEL_12;
    }

- (NSString)path
{
  return self->_path;
}

- (void).cxx_destruct
{
}

@end