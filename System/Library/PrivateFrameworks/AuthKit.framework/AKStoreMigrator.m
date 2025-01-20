@interface AKStoreMigrator
- (AKSQLiteExecutor)executor;
- (AKStoreMigrator)initWithExecutor:(id)a3;
- (id)storeName;
- (unint64_t)_schemaVersion;
- (unint64_t)currentSchemaVersion;
- (void)migrateSchemaFromVersion:(unint64_t)a3;
- (void)migrateSchemaIfNecessary;
- (void)setExecutor:(id)a3;
@end

@implementation AKStoreMigrator

- (AKStoreMigrator)initWithExecutor:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___AKStoreMigrator;
  v5 = -[AKStoreMigrator init](&v8, "init");
  v6 = v5;
  if (v5) {
    objc_storeWeak((id *)&v5->_executor, v4);
  }

  return v6;
}

- (void)migrateSchemaIfNecessary
{
  v3 = -[AKStoreMigrator _schemaVersion](self, "_schemaVersion");
  if (v3 != (void *)-[AKStoreMigrator currentSchemaVersion](self, "currentSchemaVersion"))
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_executor);
    v5[0] = _NSConcreteStackBlock;
    v5[1] = 3221225472LL;
    v5[2] = sub_100092DE0;
    v5[3] = &unk_1001C9400;
    v5[4] = self;
    v5[5] = v3;
    [WeakRetained performTransactionBlockAndWait:v5];
  }

- (unint64_t)_schemaVersion
{
  uint64_t v12 = 0LL;
  v13 = &v12;
  uint64_t v14 = 0x3032000000LL;
  v15 = sub_100092FA4;
  v16 = sub_100092FB4;
  v17 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  id WeakRetained = objc_loadWeakRetained((id *)&self->_executor);
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472LL;
  v11[2] = sub_100092FBC;
  v11[3] = &unk_1001C90E0;
  v11[4] = &v12;
  [WeakRetained performQuery:@"SELECT db_version FROM version;" rowHandler:v11];

  id v4 = (void *)objc_claimAutoreleasedReturnValue([(id)v13[5] firstObject]);
  id v5 = [v4 integerValue];

  uint64_t v7 = _AKLogSystem(v6);
  objc_super v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[AKStoreMigrator storeName](self, "storeName"));
    *(_DWORD *)buf = 138412546;
    v19 = v9;
    __int16 v20 = 1024;
    int v21 = (int)v5;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Current %@ database version: %i", buf, 0x12u);
  }

  _Block_object_dispose(&v12, 8);
  return (unint64_t)v5;
}

- (void)migrateSchemaFromVersion:(unint64_t)a3
{
  int v3 = a3;
  uint64_t v4 = _AKLogSystem(self);
  id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
    sub_10013D610(v3, v5);
  }
}

- (unint64_t)currentSchemaVersion
{
  uint64_t v2 = _AKLogSystem(self);
  int v3 = (os_log_s *)objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
    sub_10013D680(v3, v4, v5, v6, v7, v8, v9, v10);
  }

  return 0LL;
}

- (id)storeName
{
  uint64_t v2 = _AKLogSystem(self);
  int v3 = (os_log_s *)objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
    sub_10013D6B0(v3, v4, v5, v6, v7, v8, v9, v10);
  }

  return @"<undefined>";
}

- (AKSQLiteExecutor)executor
{
  return (AKSQLiteExecutor *)objc_loadWeakRetained((id *)&self->_executor);
}

- (void)setExecutor:(id)a3
{
}

- (void).cxx_destruct
{
}

@end