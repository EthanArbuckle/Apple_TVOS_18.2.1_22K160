@interface GKDatabaseConnection
+ (GKDatabaseConnection)connectionWithDatabasePath:(id)a3;
- (GKDatabaseConnection)initWithDatabasePath:(id)a3;
- (NSString)path;
- (OS_dispatch_queue)databaseQueue;
- (int)getStatement:(sqlite3_stmt *)a3 forSQL:(id)a4;
- (sqlite3)database;
- (void)checkAndOpenDatabase;
- (void)close;
- (void)dealloc;
- (void)open;
- (void)performAsync:(id)a3;
- (void)performAsyncTransaction:(id)a3 handler:(id)a4;
- (void)performSync:(id)a3;
- (void)setDatabase:(sqlite3 *)a3;
- (void)setDatabaseQueue:(id)a3;
- (void)setPath:(id)a3;
@end

@implementation GKDatabaseConnection

+ (GKDatabaseConnection)connectionWithDatabasePath:(id)a3
{
  id v3 = a3;
  v4 = -[GKDatabaseConnection initWithDatabasePath:]( objc_alloc(&OBJC_CLASS___GKDatabaseConnection),  "initWithDatabasePath:",  v3);

  return v4;
}

- (GKDatabaseConnection)initWithDatabasePath:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)&OBJC_CLASS___GKDatabaseConnection;
  v5 = -[GKDatabaseConnection init](&v12, "init");
  if (v5)
  {
    dispatch_queue_t v6 = dispatch_queue_create("com.apple.gamecenter.GKDatabaseConnection", 0LL);
    databaseQueue = v5->_databaseQueue;
    v5->_databaseQueue = (OS_dispatch_queue *)v6;

    v5->_stmtCache = CFDictionaryCreateMutable(kCFAllocatorDefault, 0LL, &kCFTypeDictionaryKeyCallBacks, 0LL);
    -[GKDatabaseConnection setPath:](v5, "setPath:", v4);
    id v8 = -[GKDatabaseConnection open](v5, "open");
    if (!v5->_database)
    {
      v9 = (os_log_s *)os_log_GKGeneral;
      if (!os_log_GKGeneral)
      {
        id v10 = (id)GKOSLoggers(v8);
        v9 = (os_log_s *)os_log_GKGeneral;
      }

      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
        sub_1000B7668();
      }

      v5 = 0LL;
    }
  }

  return v5;
}

- (void)checkAndOpenDatabase
{
  if (!self->_database)
  {
    id v3 = -[GKDatabaseConnection open](self, "open");
    if (!self->_database)
    {
      id v4 = (os_log_s *)os_log_GKGeneral;
      if (!os_log_GKGeneral)
      {
        id v5 = (id)GKOSLoggers(v3);
        id v4 = (os_log_s *)os_log_GKGeneral;
      }

      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
        sub_1000B7668();
      }
    }
  }

- (void)dealloc
{
  if (self->_database) {
    -[GKDatabaseConnection close](self, "close");
  }
  stmtCache = self->_stmtCache;
  if (stmtCache) {
    CFRelease(stmtCache);
  }
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___GKDatabaseConnection;
  -[GKDatabaseConnection dealloc](&v4, "dealloc");
}

- (int)getStatement:(sqlite3_stmt *)a3 forSQL:(id)a4
{
  id v6 = a4;
  Value = (sqlite3_stmt *)CFDictionaryGetValue(self->_stmtCache, v6);
  ppStmt = Value;
  if (Value)
  {
LABEL_2:
    uint64_t v8 = sqlite3_reset(Value);
    uint64_t v9 = v8;
    if ((_DWORD)v8)
    {
      id v10 = (void *)os_log_GKGeneral;
      if (!os_log_GKGeneral)
      {
        id v11 = (id)GKOSLoggers(v8);
        id v10 = (void *)os_log_GKGeneral;
      }

      if (os_log_type_enabled((os_log_t)v10, OS_LOG_TYPE_DEBUG)) {
        sub_1000B7694((uint64_t)v6, v10, v9);
      }
      ppStmt = 0LL;
    }

    goto LABEL_13;
  }

  database = self->_database;
  id v13 = v6;
  uint64_t v14 = sqlite3_prepare_v2( database,  (const char *)[v13 UTF8String],  (int)objc_msgSend(v13, "lengthOfBytesUsingEncoding:", 4),  &ppStmt,  0);
  if (!(_DWORD)v14)
  {
    CFDictionarySetValue(self->_stmtCache, v13, ppStmt);
    Value = ppStmt;
    goto LABEL_2;
  }

  uint64_t v9 = v14;
  v15 = (void *)os_log_GKGeneral;
  if (!os_log_GKGeneral)
  {
    id v16 = (id)GKOSLoggers(v14);
    v15 = (void *)os_log_GKGeneral;
  }

  if (os_log_type_enabled((os_log_t)v15, OS_LOG_TYPE_DEBUG)) {
    sub_1000B7738((uint64_t)v13, v15, v9);
  }
LABEL_13:
  *a3 = ppStmt;

  return v9;
}

- (void)open
{
  p_database = &self->_database;
  uint64_t v4 = sqlite3_open_v2( -[NSString cStringUsingEncoding:](self->_path, "cStringUsingEncoding:", 4LL),  &self->_database,  6,  0LL);
  if ((_DWORD)v4)
  {
    uint64_t v5 = v4;
    if ((_DWORD)v4 != 23 && (_DWORD)v4 != 14)
    {
      if (!os_log_GKGeneral) {
        id v17 = (id)GKOSLoggers(v4);
      }
      v18 = (os_log_s *)os_log_GKTrace;
      if (os_log_type_enabled(os_log_GKTrace, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 67109120;
        *(_DWORD *)&buf[4] = v5;
        _os_log_impl( (void *)&_mh_execute_header,  v18,  OS_LOG_TYPE_INFO,  "GKDatabaseConnection can't open database due to rc=%d, throwing exception",  buf,  8u);
      }

      sqlite3_close(*p_database);
      v19 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"failed to open database (%d)",  v5));
      id v20 = (id)objc_claimAutoreleasedReturnValue( +[NSException exceptionWithName:reason:userInfo:]( &OBJC_CLASS___NSException,  "exceptionWithName:reason:userInfo:",  @"GKDatabaseInaccessibleException",  v19,  0LL));

      objc_exception_throw(v20);
LABEL_36:
      __break(1u);
      return;
    }

    if (!os_log_GKGeneral) {
      id v7 = (id)GKOSLoggers(v4);
    }
    uint64_t v8 = (os_log_s *)os_log_GKTrace;
    if (os_log_type_enabled(os_log_GKTrace, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 67109120;
      *(_DWORD *)&buf[4] = v5;
      _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_INFO,  "GKDatabaseConnection can't open database due to rc=%d",  buf,  8u);
    }

    sqlite3_close(*p_database);
    *p_database = 0LL;
  }

  else if (!-[NSString isEqualToString:](self->_path, "isEqualToString:", @":memory:"))
  {
    *(void *)buf = 0LL;
    v40 = buf;
    uint64_t v41 = 0x2020000000LL;
    uint64_t v32 = 0LL;
    v33 = &v32;
    uint64_t v34 = 0x2020000000LL;
    v31[0] = 0LL;
    v31[1] = v31;
    v31[2] = 0x2020000000LL;
    uint64_t v29 = 0LL;
    v30[0] = &v29;
    v30[1] = 0x2020000000LL;
    v30[2] = 0LL;
    v27[0] = _NSConcreteStackBlock;
    v27[1] = 3221225472LL;
    v27[2] = sub_1000B6A8C;
    v27[3] = &unk_100270B70;
    v27[4] = self;
    v27[5] = buf;
    v27[6] = &v32;
    v27[7] = &v29;
    v27[8] = v31;
    int v28 = 0;
    id v9 = -[GKDatabaseConnection performSync:](self, "performSync:", v27);
    int v10 = *((_DWORD *)v33 + 6);
    if (v10 == 5)
    {
      if (!os_log_GKGeneral) {
        id v11 = (id)GKOSLoggers(v9);
      }
      objc_super v12 = (os_log_s *)os_log_GKTrace;
      BOOL v13 = os_log_type_enabled(os_log_GKTrace, OS_LOG_TYPE_INFO);
      if (v13)
      {
        int v14 = *((_DWORD *)v33 + 6);
        *(_DWORD *)v35 = 67109120;
        int v36 = v14;
        _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_INFO,  "GKDatabaseConnection couldn't exec on the database due to rc2=%d - closing and returning",  v35,  8u);
      }

      if (!os_log_GKGeneral) {
        id v15 = (id)GKOSLoggers(v13);
      }
      id v16 = (os_log_s *)os_log_GKError;
      if (os_log_type_enabled(os_log_GKError, OS_LOG_TYPE_ERROR)) {
        sub_1000B77DC((uint64_t)v30, v16);
      }
      sqlite3_close(*p_database);
      *p_database = 0LL;
    }

    else if (*((_DWORD *)v40 + 6) | v10)
    {
      if (!os_log_GKGeneral) {
        id v21 = (id)GKOSLoggers(v9);
      }
      v22 = (os_log_s *)os_log_GKTrace;
      if (os_log_type_enabled(os_log_GKTrace, OS_LOG_TYPE_INFO))
      {
        int v23 = *((_DWORD *)v40 + 6);
        int v24 = *((_DWORD *)v33 + 6);
        *(_DWORD *)v35 = 67109376;
        int v36 = v23;
        __int16 v37 = 1024;
        int v38 = v24;
        _os_log_impl( (void *)&_mh_execute_header,  v22,  OS_LOG_TYPE_INFO,  "GKDatabaseConnection couldn't exec on the database due to rc1=%d or rc2=%d - closing and throwing an exception",  v35,  0xEu);
      }

      sqlite3_close(*p_database);
      v25 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"failed to set pragmas for database connection.(%d %d)",  *((unsigned int *)v40 + 6),  *((unsigned int *)v33 + 6)));
      id v26 = (id)objc_claimAutoreleasedReturnValue( +[NSException exceptionWithName:reason:userInfo:]( &OBJC_CLASS___NSException,  "exceptionWithName:reason:userInfo:",  @"GKDatabaseInaccessibleException",  v25,  0LL));

      objc_exception_throw(v26);
      goto LABEL_36;
    }

    _Block_object_dispose(&v29, 8);
    _Block_object_dispose(v31, 8);
    _Block_object_dispose(&v32, 8);
    _Block_object_dispose(buf, 8);
  }

- (void)close
{
  if (GKAtomicCompareAndSwap32Barrier(0LL, 1LL, &unk_1002BB568))
  {
    databaseQueue = (dispatch_queue_s *)self->_databaseQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_1000B6E50;
    block[3] = &unk_10026B670;
    block[4] = self;
    dispatch_sync(databaseQueue, block);
  }

- (void)performSync:(id)a3
{
  id v4 = a3;
  uint64_t v5 = v4;
  if (self->_database) {
    goto LABEL_7;
  }
  id v6 = (os_log_s *)os_log_GKGeneral;
  if (!os_log_GKGeneral)
  {
    id v7 = (id)GKOSLoggers(v4);
    id v6 = (os_log_s *)os_log_GKGeneral;
  }

  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
    sub_1000B7910();
  }
  -[GKDatabaseConnection open](self, "open");
  if (self->_database)
  {
LABEL_7:
    databaseQueue = (dispatch_queue_s *)self->_databaseQueue;
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472LL;
    v12[2] = sub_1000B7080;
    v12[3] = &unk_10026B030;
    v12[4] = self;
    id v13 = v5;
    id v9 = v5;
    dispatch_sync(databaseQueue, v12);
  }

  else
  {
    id v10 = (id)objc_claimAutoreleasedReturnValue( +[NSException exceptionWithName:reason:userInfo:]( &OBJC_CLASS___NSException,  "exceptionWithName:reason:userInfo:",  @"GKDatabaseInaccessibleException",  @"cannot perform operation on unopened database. Tried to re-open and failed. Restarting gamed",  0LL));
    objc_exception_throw(v10);
    sub_1000B7080(v11);
  }

- (void)performAsync:(id)a3
{
  id v4 = a3;
  uint64_t v5 = v4;
  if (self->_database) {
    goto LABEL_7;
  }
  id v6 = (os_log_s *)os_log_GKGeneral;
  if (!os_log_GKGeneral)
  {
    id v7 = (id)GKOSLoggers(v4);
    id v6 = (os_log_s *)os_log_GKGeneral;
  }

  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
    sub_1000B793C();
  }
  -[GKDatabaseConnection open](self, "open");
  if (self->_database)
  {
LABEL_7:
    databaseQueue = (dispatch_queue_s *)self->_databaseQueue;
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472LL;
    v12[2] = sub_1000B719C;
    v12[3] = &unk_10026B030;
    v12[4] = self;
    id v13 = v5;
    id v9 = v5;
    dispatch_async(databaseQueue, v12);
  }

  else
  {
    id v10 = (id)objc_claimAutoreleasedReturnValue( +[NSException exceptionWithName:reason:userInfo:]( &OBJC_CLASS___NSException,  "exceptionWithName:reason:userInfo:",  @"GKDatabaseInaccessibleException",  @"cannot perform operation on unopened database. Tried to re-open and failed. Restarting gamed",  0LL));
    objc_exception_throw(v10);
    sub_1000B719C(v11);
  }

- (void)performAsyncTransaction:(id)a3 handler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = (void (**)(void, void))v7;
  if (self->_database) {
    goto LABEL_7;
  }
  id v9 = (os_log_s *)os_log_GKGeneral;
  if (!os_log_GKGeneral)
  {
    id v10 = (id)GKOSLoggers(v7);
    id v9 = (os_log_s *)os_log_GKGeneral;
  }

  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
    sub_1000B7968();
  }
  -[GKDatabaseConnection open](self, "open");
  if (self->_database)
  {
LABEL_7:
    databaseQueue = (dispatch_queue_s *)self->_databaseQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_1000B72EC;
    block[3] = &unk_100270B98;
    block[4] = self;
    id v14 = v6;
    id v15 = v8;
    dispatch_async(databaseQueue, block);
  }

  else
  {
    objc_super v12 = (void *)objc_claimAutoreleasedReturnValue( +[NSError userErrorForServerCode:reason:]( &OBJC_CLASS___NSError,  "userErrorForServerCode:reason:",  1LL,  @"Database not available at this time"));
    ((void (**)(void, void *))v8)[2](v8, v12);
  }
}

- (NSString)path
{
  return self->_path;
}

- (void)setPath:(id)a3
{
}

- (sqlite3)database
{
  return self->_database;
}

- (void)setDatabase:(sqlite3 *)a3
{
  self->_database = a3;
}

- (OS_dispatch_queue)databaseQueue
{
  return self->_databaseQueue;
}

- (void)setDatabaseQueue:(id)a3
{
}

- (void).cxx_destruct
{
}

@end