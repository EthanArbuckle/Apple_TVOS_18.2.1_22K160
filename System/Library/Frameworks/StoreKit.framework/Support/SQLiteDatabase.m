@interface SQLiteDatabase
- (BOOL)connectionNeedsResetForCorruption:(id)a3;
- (BOOL)connectionNeedsResetForReopen:(id)a3;
- (BOOL)tableExists:(id)a3;
- (SQLiteDatabase)initWithConnection:(id)a3;
- (SQLiteDatabase)initWithConnectionOptions:(id)a3;
- (void)_modifyUsingTransactionClass:(Class)a3 withBlock:(id)a4;
- (void)_performMigrationIfNeededForStore:(id)a3;
- (void)_readUsingSession:(id)a3 withBlock:(id)a4;
- (void)_reentrantSafePerformBlock:(id)a3;
- (void)assertOnTransactionQueue;
- (void)modifyStore:(id)a3 usingTransaction:(id)a4;
- (void)modifyStore:(id)a3 usingTransactionClass:(Class)a4 withBlock:(id)a5;
- (void)readStore:(id)a3 usingSession:(id)a4;
- (void)verifyDatabaseIntegrity;
@end

@implementation SQLiteDatabase

- (SQLiteDatabase)initWithConnection:(id)a3
{
  id v5 = a3;
  v14.receiver = self;
  v14.super_class = (Class)&OBJC_CLASS___SQLiteDatabase;
  id v6 = -[SQLiteDatabase init](&v14, "init");
  if (v6)
  {
    dispatch_queue_attr_t v7 = dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v8 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v7);
    dispatch_queue_t v9 = dispatch_queue_create("com.apple.storekit.SQLiteDatabase", v8);
    v10 = (void *)*((void *)v6 + 2);
    *((void *)v6 + 2) = v9;

    dispatch_queue_set_specific(*((dispatch_queue_t *)v6 + 2), "_SQLiteDispatchQueueTag", v6, 0LL);
    uint64_t v11 = objc_claimAutoreleasedReturnValue(+[NSHashTable hashTableWithOptions:](&OBJC_CLASS___NSHashTable, "hashTableWithOptions:", 258LL));
    v12 = (void *)*((void *)v6 + 3);
    *((void *)v6 + 3) = v11;

    objc_storeStrong((id *)v6 + 1, a3);
    [*((id *)v6 + 1) setDelegate:v6];
  }

  return (SQLiteDatabase *)v6;
}

- (SQLiteDatabase)initWithConnectionOptions:(id)a3
{
  id v4 = a3;
  id v5 = -[SQLiteConnection initWithOptions:](objc_alloc(&OBJC_CLASS___SQLiteConnection), "initWithOptions:", v4);

  -[SQLiteConnection open](v5, "open");
  id v6 = -[SQLiteDatabase initWithConnection:](self, "initWithConnection:", v5);

  return v6;
}

- (void)assertOnTransactionQueue
{
}

- (void)modifyStore:(id)a3 usingTransaction:(id)a4
{
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_10003F9EC;
  v7[3] = &unk_1002E74A0;
  v8 = self;
  id v9 = a3;
  id v10 = a4;
  id v5 = v10;
  id v6 = v9;
  -[SQLiteDatabase _reentrantSafePerformBlock:](v8, "_reentrantSafePerformBlock:", v7);
}

- (void)modifyStore:(id)a3 usingTransactionClass:(Class)a4 withBlock:(id)a5
{
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472LL;
  v9[2] = sub_10003FAF4;
  v9[3] = &unk_1002E8B38;
  id v10 = self;
  id v11 = a3;
  id v12 = a5;
  Class v13 = a4;
  id v7 = v12;
  id v8 = v11;
  -[SQLiteDatabase _reentrantSafePerformBlock:](v10, "_reentrantSafePerformBlock:", v9);
}

- (void)readStore:(id)a3 usingSession:(id)a4
{
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_10003FBC8;
  v7[3] = &unk_1002E74A0;
  id v8 = self;
  id v9 = a3;
  id v10 = a4;
  id v5 = v10;
  id v6 = v9;
  -[SQLiteDatabase _reentrantSafePerformBlock:](v8, "_reentrantSafePerformBlock:", v7);
}

- (BOOL)connectionNeedsResetForReopen:(id)a3
{
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_transactionQueue);
  if (qword_10032E490 != -1) {
    dispatch_once(&qword_10032E490, &stru_1002E8B80);
  }
  id v5 = (void *)qword_10032E478;
  if (os_log_type_enabled((os_log_t)qword_10032E478, OS_LOG_TYPE_ERROR)) {
    sub_10025FB58(v5, v4);
  }
  NSResetHashTable(self->_migratedStores);

  return 1;
}

- (BOOL)connectionNeedsResetForCorruption:(id)a3
{
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_transactionQueue);
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 options]);
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 databasePath]);

  id v7 = (void *)objc_claimAutoreleasedReturnValue([v4 options]);
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 encryptionKeyId]);
  if (v8)
  {
  }

  else
  {
    BOOL v9 = sub_100018B94(v6);

    if (v9)
    {
      if (qword_10032E490 != -1) {
        dispatch_once(&qword_10032E490, &stru_1002E8B80);
      }
      id v10 = (os_log_s *)qword_10032E478;
      if (os_log_type_enabled((os_log_t)qword_10032E478, OS_LOG_TYPE_ERROR))
      {
        int v12 = 138543362;
        Class v13 = v6;
        _os_log_error_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_ERROR,  "Exiting after truncating corrupt database at: %{public}@",  (uint8_t *)&v12,  0xCu);
      }

      goto LABEL_7;
    }
  }

  if (qword_10032E490 != -1) {
    dispatch_once(&qword_10032E490, &stru_1002E8B80);
  }
  id v11 = (os_log_s *)qword_10032E478;
  if (os_log_type_enabled((os_log_t)qword_10032E478, OS_LOG_TYPE_ERROR))
  {
    int v12 = 138543362;
    Class v13 = v6;
    _os_log_error_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_ERROR,  "Exiting after deleting corrupt database at: %{public}@",  (uint8_t *)&v12,  0xCu);
  }

  sub_1000187C8(v6);
LABEL_7:
  exit(0);
}

- (BOOL)tableExists:(id)a3
{
  uint64_t v10 = 0LL;
  id v11 = &v10;
  uint64_t v12 = 0x2020000000LL;
  char v13 = 0;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  v6[2] = sub_10003FF24;
  v6[3] = &unk_1002E7868;
  BOOL v9 = &v10;
  id v7 = self;
  id v3 = a3;
  id v8 = v3;
  -[SQLiteDatabase _reentrantSafePerformBlock:](v7, "_reentrantSafePerformBlock:", v6);
  char v4 = *((_BYTE *)v11 + 24);

  _Block_object_dispose(&v10, 8);
  return v4;
}

- (void)verifyDatabaseIntegrity
{
  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472LL;
  v2[2] = sub_10003FFA8;
  v2[3] = &unk_1002E7958;
  v2[4] = self;
  -[SQLiteDatabase _reentrantSafePerformBlock:](self, "_reentrantSafePerformBlock:", v2);
}

- (void)_modifyUsingTransactionClass:(Class)a3 withBlock:(id)a4
{
  id v6 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_transactionQueue);
  id v7 = [[a3 alloc] initWithConnection:self->_connection];
  connection = self->_connection;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472LL;
  v11[2] = sub_1000401C4;
  v11[3] = &unk_1002E6DF0;
  id v12 = v7;
  id v13 = v6;
  id v9 = v7;
  id v10 = v6;
  -[SQLiteConnection performTransaction:](connection, "performTransaction:", v11);
}

- (void)_performMigrationIfNeededForStore:(id)a3
{
  id v4 = a3;
  migratedStores = self->_migratedStores;
  id v6 = (const void *)objc_opt_class(v4);
  if (!NSHashGet(migratedStores, v6))
  {
    uint64_t v24 = 0LL;
    v25 = &v24;
    uint64_t v26 = 0x2020000000LL;
    char v27 = 1;
    id v7 = [(id)objc_opt_class(v4) storeDescriptor];
    id v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
    id v9 = objc_alloc(&OBJC_CLASS___SQLiteDatabaseStoreSchema);
    connection = self->_connection;
    id v11 = (void *)objc_claimAutoreleasedReturnValue([v8 schemaName]);
    id v12 = -[SQLiteDatabaseStoreSchema initWithConnection:schemaName:]( v9,  "initWithConnection:schemaName:",  connection,  v11);

    id v13 = self->_connection;
    v20[0] = _NSConcreteStackBlock;
    v20[1] = 3221225472LL;
    v20[2] = sub_100040408;
    v20[3] = &unk_1002E8B60;
    v23 = &v24;
    id v14 = v4;
    id v21 = v14;
    v15 = v12;
    v22 = v15;
    -[SQLiteConnection performTransaction:](v13, "performTransaction:", v20);
    if (*((_BYTE *)v25 + 24))
    {
      v16 = self->_migratedStores;
      v17 = (const void *)objc_opt_class(v14);
      NSHashInsert(v16, v17);
    }

    else
    {
      if (qword_10032E490 != -1) {
        dispatch_once(&qword_10032E490, &stru_1002E8B80);
      }
      v18 = (os_log_s *)(id)qword_10032E478;
      if (os_log_type_enabled(v18, OS_LOG_TYPE_FAULT))
      {
        v19 = (void *)objc_claimAutoreleasedReturnValue([v8 schemaName]);
        sub_10025FC14(v19, buf, -[SQLiteDatabaseStoreSchema currentSchemaVersion](v15, "currentSchemaVersion"), v18);
      }
    }

    _Block_object_dispose(&v24, 8);
  }
}

- (void)_readUsingSession:(id)a3 withBlock:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_transactionQueue);
  connection = self->_connection;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472LL;
  v11[2] = sub_1000404FC;
  v11[3] = &unk_1002E6DF0;
  id v12 = v6;
  id v13 = v7;
  id v9 = v6;
  id v10 = v7;
  -[SQLiteConnection performTransaction:](connection, "performTransaction:", v11);
}

- (void)_reentrantSafePerformBlock:(id)a3
{
  specific = (SQLiteDatabase *)dispatch_get_specific("_SQLiteDispatchQueueTag");
  transactionQueue = self->_transactionQueue;
  block = (void (**)(void))a3;
  if (specific == self)
  {
    dispatch_assert_queue_V2((dispatch_queue_t)transactionQueue);
    block[2]();
  }

  else
  {
    dispatch_assert_queue_not_V2((dispatch_queue_t)transactionQueue);
    dispatch_sync((dispatch_queue_t)self->_transactionQueue, block);
  }
}

- (void).cxx_destruct
{
}

@end