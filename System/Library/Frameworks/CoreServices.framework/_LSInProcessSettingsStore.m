@interface _LSInProcessSettingsStore
- (OS_dispatch_queue)internalQueue;
- (_LSInProcessSettingsStore)init;
- (sqlite3)database;
- (unsigned)_internalQueue_selectUserElectionForIdentifier:(id)a3;
- (unsigned)userElectionForExtensionKey:(id)a3;
- (void)_internalQueue_loadDatabase;
- (void)_internalQueue_purgeDatabase;
- (void)dealloc;
- (void)setDatabase:(sqlite3 *)a3;
@end

@implementation _LSInProcessSettingsStore

- (_LSInProcessSettingsStore)init
{
  v13.receiver = self;
  v13.super_class = (Class)&OBJC_CLASS____LSInProcessSettingsStore;
  id v2 = -[LSSettingsStore _init](&v13, sel__init);
  if (v2)
  {
    dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v3 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue();
    dispatch_queue_t v4 = dispatch_queue_create("com.apple.launchservices._LSSettingsInProcessStore", v3);
    v5 = (void *)*((void *)v2 + 5);
    *((void *)v2 + 5) = v4;

    dispatch_source_t v6 = dispatch_source_create(MEMORY[0x1895F8B78], 0LL, 0LL, *((dispatch_queue_t *)v2 + 5));
    v7 = (void *)*((void *)v2 + 3);
    *((void *)v2 + 3) = v6;

    objc_initWeak(&location, v2);
    v8 = (dispatch_source_s *)*((void *)v2 + 3);
    v10[0] = MEMORY[0x1895F87A8];
    v10[1] = 3221225472LL;
    v10[2] = __33___LSInProcessSettingsStore_init__block_invoke;
    v10[3] = &unk_189D771B0;
    objc_copyWeak(&v11, &location);
    dispatch_source_set_event_handler(v8, v10);
    dispatch_source_set_timer(*((dispatch_source_t *)v2 + 3), 0xFFFFFFFFFFFFFFFFLL, 0xFFFFFFFFFFFFFFFFLL, 0x3B9ACA00uLL);
    dispatch_resume(*((dispatch_object_t *)v2 + 3));
    objc_destroyWeak(&v11);
    objc_destroyWeak(&location);
  }

  return (_LSInProcessSettingsStore *)v2;
}

- (void)_internalQueue_purgeDatabase
{
  if (self->_database)
  {
    _LSExtensionsLog();
    v3 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)dispatch_queue_t v4 = 0;
      _os_log_impl(&dword_183E58000, v3, OS_LOG_TYPE_INFO, "Jettisoning elections database", v4, 2u);
    }

    sqlite3_close(self->_database);
    self->_database = 0LL;
  }

- (void)dealloc
{
  database = self->_database;
  if (database)
  {
    sqlite3_close(database);
    self->_database = 0LL;
  }

  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS____LSInProcessSettingsStore;
  -[_LSInProcessSettingsStore dealloc](&v4, sel_dealloc);
}

- (unsigned)userElectionForExtensionKey:(id)a3
{
  id v4 = a3;
  uint64_t v13 = 0LL;
  v14 = &v13;
  uint64_t v15 = 0x2020000000LL;
  char v16 = 0;
  -[_LSInProcessSettingsStore internalQueue](self, "internalQueue");
  v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = __57___LSInProcessSettingsStore_userElectionForExtensionKey___block_invoke;
  block[3] = &unk_189D74C20;
  v12 = &v13;
  block[4] = self;
  id v6 = v4;
  id v11 = v6;
  dispatch_sync(v5, block);

  _LSExtensionsLog();
  v7 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
    -[_LSInProcessSettingsStore userElectionForExtensionKey:].cold.1();
  }

  unsigned __int8 v8 = *((_BYTE *)v14 + 24);
  _Block_object_dispose(&v13, 8);

  return v8;
}

- (void)_internalQueue_loadDatabase
{
  uint64_t v7 = *MEMORY[0x1895F89C0];
  [(id)__LSDefaultsGetSharedInstance() settingsStoreFileURL];
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  _LSExtensionsLog();
  id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)id v6 = 138412290;
    *(void *)&v6[4] = v3;
    _os_log_impl(&dword_183E58000, v4, OS_LOG_TYPE_INFO, "Loading readonly user election database from: '%@'", v6, 0xCu);
  }

  *(void *)id v6 = 0LL;
  id v5 = v3;
  sqlite3_open_v2((const char *)[v5 fileSystemRepresentation], (sqlite3 **)v6, 1, 0);
  self->_database = *(sqlite3 **)v6;
}

- (sqlite3)database
{
  v3 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  if (!self->_database) {
    -[_LSInProcessSettingsStore _internalQueue_loadDatabase](self, "_internalQueue_loadDatabase");
  }
  dbCloseTimer = self->_dbCloseTimer;
  dispatch_time_t v5 = dispatch_time(0LL, 1000000000LL);
  dispatch_source_set_timer((dispatch_source_t)dbCloseTimer, v5, 0xFFFFFFFFFFFFFFFFLL, 0x3B9ACA00uLL);
  return self->_database;
}

- (unsigned)_internalQueue_selectUserElectionForIdentifier:(id)a3
{
  uint64_t v12 = *MEMORY[0x1895F89C0];
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_internalQueue);
  if (sqlite3_prepare_v2( -[_LSInProcessSettingsStore database](self, "database"),  "select userElection from(select identifier, userElection , 0 as legacy from Election UNION SELECT identifier, userElection, 1 as legacy from LegacyElection) where identifier = ? ORDER BY identifier, legacy limit 1",  -1,  &ppStmt,  0LL))
  {
    _LSExtensionsLog();
    dispatch_time_t v5 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      id v6 = sqlite3_errmsg(-[_LSInProcessSettingsStore database](self, "database"));
      -[_LSInProcessSettingsStore _internalQueue_selectUserElectionForIdentifier:].cold.2((uint64_t)v6, (uint64_t)v11);
    }
  }

  else
  {
    sqlite3_bind_text(ppStmt, 1, (const char *)[v4 UTF8String], -1, 0);
  }

  if (sqlite3_step(ppStmt) == 100) {
    unsigned __int8 v7 = sqlite3_column_int(ppStmt, 0);
  }
  else {
    unsigned __int8 v7 = 0;
  }
  sqlite3_finalize(ppStmt);
  _LSExtensionsLog();
  unsigned __int8 v8 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
    -[_LSInProcessSettingsStore _internalQueue_selectUserElectionForIdentifier:].cold.1();
  }

  return v7;
}

- (void)setDatabase:(sqlite3 *)a3
{
  self->_database = a3;
}

- (OS_dispatch_queue)internalQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 40LL, 1);
}

- (void).cxx_destruct
{
}

- (void)userElectionForExtensionKey:.cold.1()
{
}

- (void)_internalQueue_selectUserElectionForIdentifier:.cold.1()
{
}

- (void)_internalQueue_selectUserElectionForIdentifier:(uint64_t)a1 .cold.2( uint64_t a1,  uint64_t a2)
{
}

@end