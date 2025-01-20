@interface _LSServerSettingsStore
+ (BOOL)supportsSecureCoding;
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (BOOL)resetUserElectionsWithError:(id *)a3;
- (BOOL)setUserElection:(unsigned __int8)a3 forExtensionKey:(id)a4 error:(id *)a5;
- (NSXPCListener)listener;
- (_LSServerSettingsStore)init;
- (id)settingsStoreConfigurationForProcessWithAuditToken:(id *)a3;
- (void)_internalQueue_initializeDatabase;
- (void)_internalQueue_insertIdentifier:(id)a3 userElection:(unsigned __int8)a4;
- (void)_internalQueue_insertIdentifier:(id)a3 userElection:(unsigned __int8)a4 timestamp:(double)a5;
- (void)_internalQueue_loadDatabase;
- (void)_internalQueue_loadPluginKitDatabase;
- (void)_internalQueue_resetUserElection;
- (void)postSettingsChangeNotification;
- (void)resetUserElectionsWithReply:(id)a3;
- (void)setUserElection:(unsigned __int8)a3 forExtensionKey:(id)a4 reply:(id)a5;
- (void)userElectionForExtensionKey:(id)a3 reply:(id)a4;
@end

@implementation _LSServerSettingsStore

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (_LSServerSettingsStore)init
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS____LSServerSettingsStore;
  v2 = -[_LSInProcessSettingsStore init](&v6, sel_init);
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x189607B50] anonymousListener];
    listener = v2->_listener;
    v2->_listener = (NSXPCListener *)v3;

    -[NSXPCListener setDelegate:](v2->_listener, "setDelegate:", v2);
    -[NSXPCListener resume](v2->_listener, "resume");
  }

  return v2;
}

- (id)settingsStoreConfigurationForProcessWithAuditToken:(id *)a3
{
  v4 = objc_alloc(&OBJC_CLASS___LSSettingsStoreConfiguration);
  v5 = -[_LSServerSettingsStore listener](self, "listener");
  [v5 endpoint];
  objc_super v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[LSSettingsStoreConfiguration initWithEndpoint:](v4, "initWithEndpoint:", v6);

  return v7;
}

- (BOOL)setUserElection:(unsigned __int8)a3 forExtensionKey:(id)a4 error:(id *)a5
{
  id v7 = a4;
  -[_LSInProcessSettingsStore internalQueue](self, "internalQueue");
  v8 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = __64___LSServerSettingsStore_setUserElection_forExtensionKey_error___block_invoke;
  block[3] = &unk_189D76A78;
  block[4] = self;
  id v12 = v7;
  unsigned __int8 v13 = a3;
  id v9 = v7;
  dispatch_sync(v8, block);

  return 1;
}

- (BOOL)resetUserElectionsWithError:(id *)a3
{
  v4 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = __54___LSServerSettingsStore_resetUserElectionsWithError___block_invoke;
  block[3] = &unk_189D741C8;
  block[4] = self;
  dispatch_sync(v4, block);

  return 1;
}

- (void)_internalQueue_loadDatabase
{
  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_183E58000, log, OS_LOG_TYPE_DEBUG, "Initializing election database", v1, 2u);
}

- (void)_internalQueue_loadPluginKitDatabase
{
  uint64_t v3 = *MEMORY[0x1895F89C0];
  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_4_3(&dword_183E58000, v0, v1, "Loading legacy user election database from: '%@'", v2);
  OUTLINED_FUNCTION_1();
}

- (void)_internalQueue_initializeDatabase
{
  uint64_t v7 = *MEMORY[0x1895F89C0];
  uint64_t v3 = *a1;
  v4[0] = 67109378;
  v4[1] = a2;
  __int16 v5 = 2080;
  uint64_t v6 = v3;
  _os_log_error_impl(&dword_183E58000, log, OS_LOG_TYPE_ERROR, "SQLite result: %d error: '%s'", (uint8_t *)v4, 0x12u);
  OUTLINED_FUNCTION_1();
}

- (void)_internalQueue_insertIdentifier:(id)a3 userElection:(unsigned __int8)a4
{
  unsigned int v4 = a4;
  uint64_t v15 = *MEMORY[0x1895F89C0];
  id v7 = a3;
  -[_LSInProcessSettingsStore internalQueue](self, "internalQueue");
  v8 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v8);

  if (sqlite3_prepare_v2( -[_LSInProcessSettingsStore database](self, "database"),  "INSERT OR REPLACE INTO Election (identifier, userElection) VALUES (?, ?)",  -1,  &ppStmt,  0LL))
  {
    _LSExtensionsLog();
    id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      v10 = sqlite3_errmsg(-[_LSInProcessSettingsStore database](self, "database"));
      -[_LSInProcessSettingsStore _internalQueue_selectUserElectionForIdentifier:].cold.2((uint64_t)v10, (uint64_t)v14);
    }
  }

  else
  {
    sqlite3_bind_text(ppStmt, 1, (const char *)[v7 UTF8String], -1, 0);
    sqlite3_bind_int(ppStmt, 2, v4);
  }

  int v11 = sqlite3_step(ppStmt);
  if (v11 != 8 && v11 != 101)
  {
    [MEMORY[0x1896077D8] currentHandler];
    id v12 = (void *)objc_claimAutoreleasedReturnValue();
    [v12 handleFailureInMethod:a2, self, @"LSSettingsStore.mm", 501, @"failed to set user election to '%d' for extension record: %@", v4, v7 object file lineNumber description];
  }

  sqlite3_finalize(ppStmt);
}

- (void)_internalQueue_insertIdentifier:(id)a3 userElection:(unsigned __int8)a4 timestamp:(double)a5
{
  unsigned int v6 = a4;
  uint64_t v16 = *MEMORY[0x1895F89C0];
  id v9 = a3;
  -[_LSInProcessSettingsStore internalQueue](self, "internalQueue");
  v10 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v10);

  if (sqlite3_prepare_v2( -[_LSInProcessSettingsStore database](self, "database"),  "INSERT OR REPLACE INTO LegacyElection (identifier, userElection, pkTimestamp) VALUES (?, ?, ?)",  -1,  &ppStmt,  0LL))
  {
    _LSExtensionsLog();
    int v11 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      id v12 = sqlite3_errmsg(-[_LSInProcessSettingsStore database](self, "database"));
      -[_LSInProcessSettingsStore _internalQueue_selectUserElectionForIdentifier:].cold.2((uint64_t)v12, (uint64_t)v15);
    }
  }

  else
  {
    sqlite3_bind_text(ppStmt, 1, (const char *)[v9 UTF8String], -1, 0);
    sqlite3_bind_int64(ppStmt, 2, v6);
    sqlite3_bind_double(ppStmt, 3, (double)(int)a5);
  }

  if (sqlite3_step(ppStmt) != 101)
  {
    [MEMORY[0x1896077D8] currentHandler];
    unsigned __int8 v13 = (void *)objc_claimAutoreleasedReturnValue();
    [v13 handleFailureInMethod:a2, self, @"LSSettingsStore.mm", 525, @"failed to import user elcection '%ld' for extension record: %@", v6, v9 object file lineNumber description];
  }

  sqlite3_finalize(ppStmt);
}

- (void)_internalQueue_resetUserElection
{
  uint64_t v11 = *MEMORY[0x1895F89C0];
  -[_LSInProcessSettingsStore internalQueue](self, "internalQueue");
  unsigned int v4 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v4);

  if (sqlite3_prepare_v2( -[_LSInProcessSettingsStore database](self, "database"),  "DELETE FROM Election",  -1,  &ppStmt,  0LL))
  {
    _LSExtensionsLog();
    __int16 v5 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      unsigned int v6 = sqlite3_errmsg(-[_LSInProcessSettingsStore database](self, "database"));
      -[_LSInProcessSettingsStore _internalQueue_selectUserElectionForIdentifier:].cold.2((uint64_t)v6, (uint64_t)v10);
    }
  }

  int v7 = sqlite3_step(ppStmt);
  if (v7 != 8 && v7 != 101)
  {
    [MEMORY[0x1896077D8] currentHandler];
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    [v8 handleFailureInMethod:a2 object:self file:@"LSSettingsStore.mm" lineNumber:545 description:@"failed to reset user election"];
  }

  sqlite3_finalize(ppStmt);
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v6 = a4;
  int v7 = v6;
  listener = self->_listener;
  if (listener == a3)
  {
    [v6 setExportedObject:self];
    [MEMORY[0x189607B48] interfaceWithProtocol:&unk_18C693600];
    id v9 = (void *)objc_claimAutoreleasedReturnValue();
    [v7 setExportedInterface:v9];

    [v7 resume];
  }

  return listener == a3;
}

- (void)userElectionForExtensionKey:(id)a3 reply:(id)a4
{
  id v7 = a3;
  id v6 = a4;
  (*((void (**)(id, void, void))v6 + 2))( v6,  -[_LSInProcessSettingsStore userElectionForExtensionKey:](self, "userElectionForExtensionKey:", v7),  0LL);
}

- (void)setUserElection:(unsigned __int8)a3 forExtensionKey:(id)a4 reply:(id)a5
{
  uint64_t v6 = a3;
  id v8 = a4;
  id v9 = (void (**)(id, id))a5;
  [MEMORY[0x189607B30] currentConnection];
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v11 = v10;
  if (v10) {
    [v10 auditToken];
  }
  else {
    memset(v15, 0, sizeof(v15));
  }

  if (_LSCheckEntitlementForAuditToken((uint64_t)v15, @"com.apple.private.extensionkit.extension-management"))
  {
    id v14 = 0LL;
    BOOL v12 = -[_LSServerSettingsStore setUserElection:forExtensionKey:error:]( self,  "setUserElection:forExtensionKey:error:",  v6,  v8,  &v14);
    id v13 = v14;
    if (v12) {
      -[_LSServerSettingsStore postSettingsChangeNotification](self, "postSettingsChangeNotification");
    }
    v9[2](v9, v13);
  }

  else
  {
    _LSMakeNSErrorImpl( (void *)*MEMORY[0x189607670],  -54LL,  (uint64_t)"-[_LSServerSettingsStore setUserElection:forExtensionKey:reply:]",  585LL,  0LL);
    id v13 = (id)objc_claimAutoreleasedReturnValue();
    v9[2](v9, v13);
  }
}

- (void)resetUserElectionsWithReply:(id)a3
{
  unsigned int v4 = (void (**)(id, id))a3;
  [MEMORY[0x189607B30] currentConnection];
  __int16 v5 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v6 = v5;
  if (v5) {
    [v5 auditToken];
  }
  else {
    memset(v10, 0, sizeof(v10));
  }

  if (_LSCheckEntitlementForAuditToken((uint64_t)v10, @"com.apple.private.extensionkit.extension-management"))
  {
    id v9 = 0LL;
    BOOL v7 = -[_LSServerSettingsStore resetUserElectionsWithError:](self, "resetUserElectionsWithError:", &v9);
    id v8 = v9;
    if (v7) {
      -[_LSServerSettingsStore postSettingsChangeNotification](self, "postSettingsChangeNotification");
    }
    v4[2](v4, v8);
  }

  else
  {
    _LSMakeNSErrorImpl( (void *)*MEMORY[0x189607670],  -54LL,  (uint64_t)"-[_LSServerSettingsStore resetUserElectionsWithReply:]",  599LL,  0LL);
    id v8 = (id)objc_claimAutoreleasedReturnValue();
    v4[2](v4, v8);
  }
}

- (void)postSettingsChangeNotification
{
  SharedInstance = (void *)__LSDefaultsGetSharedInstance();
  [SharedInstance settingsUpdateNotificationNameForUserID:geteuid()];
  uint64_t v3 = (LaunchServices::notifyd::NotifyToken *)objc_claimAutoreleasedReturnValue();
  _LSDefaultLog();
  unsigned int v4 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
    _LSDatabaseCommit_cold_1();
  }

  LaunchServices::notifyd::NotifyToken::Post(v3, v5);
}

- (NSXPCListener)listener
{
  return (NSXPCListener *)objc_getProperty(self, a2, 48LL, 1);
}

- (void).cxx_destruct
{
}

@end