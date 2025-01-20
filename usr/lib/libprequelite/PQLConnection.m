@interface PQLConnection
+ (void)initialize;
- (BOOL)_execute:(id)a3 mustSucceed:(BOOL)a4 bindings:(char *)a5;
- (BOOL)_executeStmt:(id)a3 mustSucceed:(BOOL)a4 preparationTime:(unint64_t)a5;
- (BOOL)_fullSync;
- (BOOL)_incrementalVacuum:(unint64_t)a3;
- (BOOL)_performWithFlags:(unsigned int)a3 action:(id)a4 whenFlushed:(id)a5;
- (BOOL)backupToURL:(id)a3 progress:(id)a4;
- (BOOL)close:(id *)a3;
- (BOOL)crashIfUsedAfterClose;
- (BOOL)destroyDatabaseWithError:(id *)a3;
- (BOOL)execute:(id)a3;
- (BOOL)execute:(id)a3 args:(char *)a4;
- (BOOL)executeRaw:(id)a3;
- (BOOL)executeSwift:(id)a3 error:(id *)a4;
- (BOOL)groupInTransaction:(id)a3;
- (BOOL)incrementalVacuum:(int64_t)a3;
- (BOOL)isBatchSuspended;
- (BOOL)isInBatch;
- (BOOL)isInTransaction;
- (BOOL)isTraced;
- (BOOL)openAtURL:(id)a3 sharedCache:(BOOL)a4 error:(id *)a5;
- (BOOL)openAtURL:(id)a3 withFlags:(int)a4 error:(id *)a5;
- (BOOL)performWithFlags:(unsigned int)a3 action:(id)a4;
- (BOOL)performWithFlags:(unsigned int)a3 action:(id)a4 whenFlushed:(id)a5;
- (BOOL)registerFunction:(id)a3 nArgs:(int)a4 handler:(id)a5;
- (BOOL)setUserVersion:(int64_t)a3;
- (BOOL)setupPragmas;
- (BOOL)shouldUseWALJournalMode;
- (NSError)lastError;
- (NSString)debugDescription;
- (NSString)label;
- (NSURL)url;
- (OS_dispatch_queue)serialQueue;
- (PQLConnection)init;
- (double)currentOperationDuration;
- (id)_description:(BOOL)a3;
- (id)_newStatementForBuilder:(id)a3 preparationTime:(unint64_t *)a4;
- (id)_newStatementForFormat:(id)a3 preparationTime:(unint64_t *)a4 arguments:(char *)a5;
- (id)autoRollbackHandler;
- (id)busyHandler;
- (id)description;
- (id)didFinishBatchingHook;
- (id)fetch:(id)a3;
- (id)fetch:(id)a3 args:(char *)a4;
- (id)fetchObject:(id)a3 sql:(id)a4;
- (id)fetchObject:(id)a3 sql:(id)a4 args:(char *)a5;
- (id)fetchObjectOfClass:(Class)a3 initializer:(SEL)a4 sql:(id)a5;
- (id)fetchObjectOfClass:(Class)a3 initializer:(SEL)a4 sql:(id)a5 args:(char *)a6;
- (id)fetchObjectOfClass:(Class)a3 sql:(id)a4;
- (id)fetchObjectOfClass:(Class)a3 sql:(id)a4 args:(char *)a5;
- (id)fetchObjectOfClassSwift:(Class)a3 query:(id)a4 error:(id *)a5;
- (id)fetchObjectSwift:(id)a3 query:(id)a4 error:(id *)a5;
- (id)fetchSwift:(id)a3 error:(id *)a4;
- (id)lockedHandler;
- (id)postFlushHook;
- (id)preFlushHook;
- (id)profilingHook;
- (id)profilingHookV2;
- (id)sqliteErrorHandler;
- (id)userVersion;
- (id)willBeginBatchingHook;
- (int)_vacuumMode;
- (int)batchTransactionType;
- (int64_t)autovacuumableSpaceInBytes;
- (int64_t)changes;
- (int64_t)lastInsertedRowID;
- (sqlite3)dbHandle;
- (unint64_t)statementCacheMaxCount;
- (unint64_t)synchronousMode;
- (void)_batchStartIfNeeded:(int)a3;
- (void)_batchStopIfNeeded;
- (void)_clearCleanupCacheQueueIfNeeded;
- (void)_clearStatementCache;
- (void)_createCacheIfNeeded;
- (void)_fireFlushNotifications;
- (void)_resetState;
- (void)_vacuumIfNeeded;
- (void)assertOnQueue;
- (void)dealloc;
- (void)flush;
- (void)forceBatchStart;
- (void)groupInBatch:(id)a3;
- (void)makeNextFlushBarrierFSync;
- (void)makeNextFlushFullSync;
- (void)setAutoRollbackHandler:(id)a3;
- (void)setBatchTransactionType:(int)a3;
- (void)setBusyHandler:(id)a3;
- (void)setCrashIfUsedAfterClose:(BOOL)a3;
- (void)setDidFinishBatchingHook:(id)a3;
- (void)setLabel:(id)a3;
- (void)setLastError:(id)a3;
- (void)setLockedHandler:(id)a3;
- (void)setPostFlushHook:(id)a3;
- (void)setPreFlushHook:(id)a3;
- (void)setProfilingHook:(id)a3;
- (void)setProfilingHookV2:(id)a3;
- (void)setShouldUseWALJournalMode:(BOOL)a3;
- (void)setSqliteErrorHandler:(id)a3;
- (void)setStatementCacheMaxCount:(unint64_t)a3;
- (void)setSynchronousMode:(unint64_t)a3;
- (void)setTraced:(BOOL)a3;
- (void)setWillBeginBatchingHook:(id)a3;
- (void)useBatchingOnTargetQueue:(id)a3 delay:(double)a4 changeCount:(int)a5;
- (void)useBatchingOnTargetQueue:(id)a3 withPolicyHandler:(id)a4;
- (void)useBatchingWithDelay:(double)a3 changeCount:(int)a4;
- (void)useBatchingWithPolicyHandler:(id)a3;
- (void)useSerialQueue;
- (void)useSerialQueueWithTarget:(id)a3;
@end

@implementation PQLConnection

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    uint64_t v2 = [objc_alloc(MEMORY[0x1896078B8]) initWithOptions:2 capacity:0];
    v3 = (void *)gPQLConnections;
    gPQLConnections = v2;

    if (initialize_onceToken != -1) {
      dispatch_once(&initialize_onceToken, &__block_literal_global_2);
    }
  }

- (PQLConnection)init
{
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___PQLConnection;
  uint64_t v2 = -[PQLConnection init](&v5, sel_init);
  v3 = v2;
  if (v2)
  {
    -[PQLConnection setBusyHandler:](v2, "setBusyHandler:", &__block_literal_global_4);
    -[PQLConnection setAutoRollbackHandler:](v3, "setAutoRollbackHandler:", &__block_literal_global_11);
    v3->_shouldUseWALJournalMode = 1;
    pthread_mutex_lock(&gPQLMutex);
    [(id)gPQLConnections addObject:v3];
    pthread_mutex_unlock(&gPQLMutex);
  }

  return v3;
}

uint64_t __21__PQLConnection_init__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v21 = *MEMORY[0x1895F89C0];
  id v4 = a2;
  id v5 = objc_alloc_init(MEMORY[0x189607940]);
  [v5 appendFormat:@"busy handler called (%d) %@", a3, v4];
  pthread_mutex_lock(&gPQLMutex);
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  id v6 = (id)gPQLConnections;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v14 objects:v20 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v15;
    do
    {
      for (uint64_t i = 0LL; i != v8; ++i)
      {
        if (*(void *)v15 != v9) {
          objc_enumerationMutation(v6);
        }
        [*(id *)(*((void *)&v14 + 1) + 8 * i) description];
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        [v5 appendFormat:@"\n > %@", v11];
      }

      uint64_t v8 = [v6 countByEnumeratingWithState:&v14 objects:v20 count:16];
    }

    while (v8);
  }

  if (pql_pred != -1) {
    dispatch_once_f(&pql_pred, 0LL, (dispatch_function_t)_pql_log_init);
  }
  v12 = (os_log_s *)pql_log;
  if (os_log_type_enabled((os_log_t)pql_log, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412290;
    id v19 = v5;
    _os_log_impl(&dword_18895A000, v12, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
  }

  pthread_mutex_unlock(&gPQLMutex);
  sqlite3_sleep(10);

  return 1LL;
}

uint64_t __21__PQLConnection_init__block_invoke_9(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return [MEMORY[0x189603F70] raise:*MEMORY[0x189603A58], @"Sqlite rollbacked transaction [%@] because of unrecoverable error [%@], aborting.", a3, a4 format];
}

- (id)_description:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = objc_alloc_init(MEMORY[0x189607940]);
  uint64_t v6 = objc_opt_class();
  label = (const __CFString *)self->_label;
  BOOL v8 = label == 0LL;
  if (!label) {
    label = &stru_18A2BFC08;
  }
  uint64_t v9 = " ";
  if (v8) {
    uint64_t v9 = "";
  }
  [v5 appendFormat:@"<%@:%p %@%s{batch:%d:%d txn:%d", v6, self, label, v9, self->_batchStarted != 0, self->_skipBatchStop, self->_savePointLevel];
  db = self->_db;
  if (db && v3)
  {
    objc_msgSend(v5, "appendFormat:", @" auto-commit:%d}>", sqlite3_get_autocommit(db));
    stmt = sqlite3_next_stmt(self->_db, 0LL);
    if (stmt)
    {
      v12 = stmt;
      LODWORD(v13) = 0;
      LODWORD(v14) = 0;
      do
      {
        uint64_t v14 = (v14 + 1);
        if (sqlite3_stmt_busy(v12)) {
          uint64_t v13 = (v13 + 1);
        }
        else {
          uint64_t v13 = v13;
        }
        v12 = sqlite3_next_stmt(self->_db, v12);
      }

      while (v12);
      objc_msgSend(v5, "appendFormat:", @" %d prepared statements", v14);
      if ((_DWORD)v13)
      {
        objc_msgSend(v5, "appendFormat:", @", %d busy:", v13);
        __int128 v15 = sqlite3_next_stmt(self->_db, 0LL);
        if (v15)
        {
          __int128 v16 = v15;
          do
          {
            if (sqlite3_stmt_busy(v16)) {
              objc_msgSend(v5, "appendFormat:", @"\n    %s", sqlite3_sql(v16));
            }
            __int128 v16 = sqlite3_next_stmt(self->_db, v16);
          }

          while (v16);
        }
      }
    }
  }

  else
  {
    [v5 appendString:@"}>"];
  }

  return v5;
}

- (NSString)debugDescription
{
  return (NSString *)-[PQLConnection _description:](self, "_description:", 1LL);
}

- (id)description
{
  return -[PQLConnection _description:](self, "_description:", 0LL);
}

- (void)_resetState
{
  __assert_rtn("-[PQLConnection _resetState]", "PQLConnection.m", 213, "_db == nil");
}

- (void)dealloc
{
  stmtCacheSource = self->_stmtCacheSource;
  if (stmtCacheSource)
  {
    dispatch_source_cancel((dispatch_source_t)stmtCacheSource);
    id v4 = self->_stmtCacheSource;
    self->_stmtCacheSource = 0LL;
  }

  preparedStatements = self->_preparedStatements;
  if (preparedStatements)
  {
    while (cache_destroy(preparedStatements) == 35)
    {
      sleep(1u);
      preparedStatements = self->_preparedStatements;
    }

    self->_preparedStatements = 0LL;
  }

  uint64_t v6 = self->_stmtCacheCleanupQueue;
  objc_sync_enter(v6);
  -[NSMutableArray removeAllObjects](self->_stmtCacheCleanupQueue, "removeAllObjects");
  stmtCacheCleanupQueue = self->_stmtCacheCleanupQueue;
  self->_stmtCacheCleanupQueue = 0LL;

  objc_sync_exit(v6);
  if (self->_db) {
    -[PQLConnection close:](self, "close:", 0LL);
  }
  -[PQLConnection _resetState](self, "_resetState");
  serialQueue = self->_serialQueue;
  self->_serialQueue = 0LL;

  targetQueue = self->_targetQueue;
  self->_targetQueue = 0LL;

  label = self->_label;
  self->_label = 0LL;

  v11.receiver = self;
  v11.super_class = (Class)&OBJC_CLASS___PQLConnection;
  -[PQLConnection dealloc](&v11, sel_dealloc);
}

- (void)_createCacheIfNeeded
{
  p_preparedStatements = &self->_preparedStatements;
  if (!self->_preparedStatements)
  {
    attrs.version = 2;
    attrs.key_hash_cb = (cache_key_hash_cb_t)__PQLCacheKeyHash;
    attrs.key_is_equal_cb = (cache_key_is_equal_cb_t)__PQLCacheKeyEqual;
    attrs.key_retain_cb = (cache_key_retain_cb_t)__PQLCacheKeyRetain;
    attrs.key_release_cb = (cache_release_cb_t)__PQLCacheKeyRelease;
    attrs.value_release_cb = (cache_release_cb_t)__PQLCacheValueRelease;
    attrs.value_make_nonpurgeable_cb = 0LL;
    attrs.value_make_purgeable_cb = 0LL;
    attrs.user_data = self;
    attrs.value_retain_cb = (cache_value_retain_cb_t)__PQLCacheValueRetain;
    id v3 = [NSString stringWithFormat:@"com.apple.sqlite.%@", self->_label];
    if (cache_create((const char *)[v3 UTF8String], &attrs, p_preparedStatements))
    {
      if (pql_pred != -1) {
        dispatch_once_f(&pql_pred, 0LL, (dispatch_function_t)_pql_log_init);
      }
      id v4 = (os_log_s *)pql_log;
      if (os_log_type_enabled((os_log_t)pql_log, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl( &dword_18895A000,  v4,  OS_LOG_TYPE_ERROR,  "Unable to create preprared cache for statements",  buf,  2u);
      }
    }
  }

- (double)currentOperationDuration
{
  if (!self->_currentStmtStart) {
    return 0.0;
  }
  uint64_t v2 = mach_absolute_time() - self->_currentStmtStart;
  if (timeInSeconds_once != -1) {
    dispatch_once(&timeInSeconds_once, &__block_literal_global);
  }
  return *(double *)&timeInSeconds_factor * (double)v2;
}

- (unint64_t)statementCacheMaxCount
{
  return cache_get_count_hint();
}

- (void)setStatementCacheMaxCount:(unint64_t)a3
{
}

- (void)useSerialQueueWithTarget:(id)a3
{
  id v4 = (dispatch_queue_s *)a3;
  if (!self->_serialQueue)
  {
    dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    id v5 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue();
    -[PQLConnection _createCacheIfNeeded](self, "_createCacheIfNeeded");
    uint64_t v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x189603FA8]);
    stmtCacheCleanupQueue = self->_stmtCacheCleanupQueue;
    self->_stmtCacheCleanupQueue = v6;

    name = (const char *)cache_get_name();
    uint64_t v9 = (OS_dispatch_queue *)dispatch_queue_create_with_target_V2(name, v5, v4);
    serialQueue = self->_serialQueue;
    self->_serialQueue = v9;

    objc_super v11 = (OS_dispatch_queue *)v4;
    if (!v4) {
      objc_super v11 = self->_serialQueue;
    }
    objc_storeStrong((id *)&self->_targetQueue, v11);
    v12 = (OS_dispatch_source *)dispatch_source_create( MEMORY[0x1895F8B20],  0LL,  0LL,  (dispatch_queue_t)self->_serialQueue);
    stmtCacheSource = self->_stmtCacheSource;
    self->_stmtCacheSource = v12;

    objc_initWeak(&location, self);
    uint64_t v14 = self->_stmtCacheSource;
    v16[0] = MEMORY[0x1895F87A8];
    v16[1] = 3221225472LL;
    v16[2] = __42__PQLConnection_useSerialQueueWithTarget___block_invoke;
    v16[3] = &unk_18A2BF8A0;
    objc_copyWeak(&v17, &location);
    dispatch_block_t v15 = dispatch_block_create_with_qos_class(DISPATCH_BLOCK_ENFORCE_QOS_CLASS, QOS_CLASS_BACKGROUND, 0, v16);
    dispatch_source_set_event_handler((dispatch_source_t)v14, v15);

    dispatch_resume((dispatch_object_t)self->_stmtCacheSource);
    objc_destroyWeak(&v17);
    objc_destroyWeak(&location);
  }

  self->_useQueue = 1;
}

void __42__PQLConnection_useSerialQueueWithTarget___block_invoke(uint64_t a1)
{
  uint64_t v2 = (void *)MEMORY[0x1895CF1AC]();
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v4 = WeakRetained;
  if (WeakRetained) {
    [WeakRetained _clearCleanupCacheQueueIfNeeded];
  }

  objc_autoreleasePoolPop(v2);
}

- (void)useSerialQueue
{
}

- (void)useBatchingOnTargetQueue:(id)a3 delay:(double)a4 changeCount:(int)a5
{
  id v9 = a3;
  id v10 = v9;
  BOOL v11 = a4 <= 0.0 && a5 <= 0;
  id v14 = v9;
  if (v11)
  {
    [MEMORY[0x1896077D8] currentHandler];
    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue();
    [v13 handleFailureInMethod:a2, self, @"PQLConnection.m", 383, @"Invalid parameter not satisfying: %@", @"count > 0 || delay > 0" object file lineNumber description];

    id v10 = v14;
  }

  if (self->_useQueue) {
    dispatch_assert_queue_V2((dispatch_queue_t)self->_targetQueue);
  }
  else {
    -[PQLConnection useSerialQueueWithTarget:](self, "useSerialQueueWithTarget:", v10);
  }
  self->_useBatching = 1;
  self->_batchingChangesLimit = a5;
  self->_batchingPeriod = a4;
  id batchingPolicyHandler = self->_batchingPolicyHandler;
  self->_id batchingPolicyHandler = 0LL;
}

- (void)useBatchingWithDelay:(double)a3 changeCount:(int)a4
{
}

- (void)useBatchingOnTargetQueue:(id)a3 withPolicyHandler:(id)a4
{
  if (self->_useQueue)
  {
    targetQueue = self->_targetQueue;
    id v7 = a4;
    dispatch_assert_queue_V2((dispatch_queue_t)targetQueue);
  }

  else
  {
    id v9 = a4;
    -[PQLConnection useSerialQueueWithTarget:](self, "useSerialQueueWithTarget:", a3);
  }

  self->_useBatching = 1;
  self->_batchingChangesLimit = 0;
  self->_batchingPeriod = 0.0;
  id v10 = (void *)[a4 copy];

  id batchingPolicyHandler = self->_batchingPolicyHandler;
  self->_id batchingPolicyHandler = v10;
}

- (void)useBatchingWithPolicyHandler:(id)a3
{
}

- (void)assertOnQueue
{
  if (self->_useQueue) {
    dispatch_assert_queue_V2((dispatch_queue_t)self->_targetQueue);
  }
}

- (void)_batchStartIfNeeded:(int)a3
{
  uint64_t v21 = *MEMORY[0x1895F89C0];
  if (self->_useQueue) {
    dispatch_assert_queue_V2((dispatch_queue_t)self->_targetQueue);
  }
  if (!self->_useBatching || self->_batchStarted) {
    -[PQLConnection _batchStartIfNeeded:].cold.1();
  }
  else {
    id v5 = off_18A2BFA28[a3];
  }
  if (-[PQLConnection _execute:mustSucceed:bindings:](self, "_execute:mustSucceed:bindings:", v5, 1LL, 0LL))
  {
    willBeginBatchingHook = (void (**)(id, PQLConnection *))self->_willBeginBatchingHook;
    if (willBeginBatchingHook) {
      willBeginBatchingHook[2](willBeginBatchingHook, self);
    }
    id v7 = (OS_os_transaction *)os_transaction_create();
    batchStarted = self->_batchStarted;
    self->_batchStarted = v7;

    if (pql_pred != -1) {
      dispatch_once_f(&pql_pred, 0LL, (dispatch_function_t)_pql_log_init);
    }
    id v9 = (os_log_s *)pql_log;
    if (os_log_type_enabled((os_log_t)pql_log, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412290;
      v20 = self;
      _os_log_impl(&dword_18895A000, v9, OS_LOG_TYPE_DEBUG, "Starting database batch on %@", buf, 0xCu);
    }

    self->_batchingChangesCount = sqlite3_total_changes(self->_db);
    double batchingPeriod = self->_batchingPeriod;
    if (batchingPeriod > 0.0)
    {
      unint64_t v11 = 1000000 * (unint64_t)(batchingPeriod * 1000.0);
      v12 = dispatch_source_create(MEMORY[0x1895F8B78], 0LL, 0LL, (dispatch_queue_t)self->_serialQueue);
      dispatch_time_t v13 = dispatch_time(0LL, v11);
      dispatch_source_set_timer(v12, v13, 0xFFFFFFFFFFFFFFFFLL, v11 / 0xA);
      block[0] = MEMORY[0x1895F87A8];
      block[1] = 3221225472LL;
      block[2] = __37__PQLConnection__batchStartIfNeeded___block_invoke;
      block[3] = &unk_18A2BF8C8;
      block[4] = self;
      dispatch_block_t v14 = dispatch_block_create_with_qos_class(DISPATCH_BLOCK_INHERIT_QOS_CLASS, QOS_CLASS_BACKGROUND, 0, block);
      dispatch_source_set_event_handler(v12, v14);

      dispatch_resume(v12);
      batchingTimer = self->_batchingTimer;
      self->_batchingTimer = (OS_dispatch_source *)v12;
      __int128 v16 = v12;
    }

    id batchingPolicyHandler = (void (**)(id, PQLConnection *, uint64_t))self->_batchingPolicyHandler;
    if (batchingPolicyHandler) {
      batchingPolicyHandler[2](batchingPolicyHandler, self, 4294967294LL);
    }
  }

void __37__PQLConnection__batchStartIfNeeded___block_invoke(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1895F89C0];
  uint64_t v2 = (void *)MEMORY[0x1895CF1AC]();
  if (pql_pred != -1) {
    dispatch_once_f(&pql_pred, 0LL, (dispatch_function_t)_pql_log_init);
  }
  id v3 = (os_log_s *)pql_log;
  if (os_log_type_enabled((os_log_t)pql_log, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v4 = *(void *)(a1 + 32);
    int v5 = 138412290;
    uint64_t v6 = v4;
    _os_log_impl( &dword_18895A000,  v3,  OS_LOG_TYPE_DEBUG,  "Flushing database batch for timer on %@",  (uint8_t *)&v5,  0xCu);
  }

  [*(id *)(a1 + 32) flush];
  objc_autoreleasePoolPop(v2);
}

- (void)forceBatchStart
{
  if (!self->_db)
  {
    if (!self->_crashIfUsedAfterClose)
    {
      [MEMORY[0x189607870] errorWithSqliteCode:21 andMessage:@"connection is closed"];
      uint64_t v7 = (NSError *)objc_claimAutoreleasedReturnValue();
      lastError = self->_lastError;
      self->_lastError = v7;
      goto LABEL_8;
    }

    [MEMORY[0x1896077D8] currentHandler];
    uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue();
    [v4 handleFailureInMethod:a2 object:self file:@"PQLConnection.m" lineNumber:488 description:@"Connection has been used after close (or before open)"];
  }

  int v5 = self;
  lastError = (NSError *)v5;
  if (v5->_useBatching && !v5->_batchStarted)
  {
    BOOL v8 = (NSError *)v5;
    -[PQLConnection _batchStartIfNeeded:](v5, "_batchStartIfNeeded:", v5->_batchTransactionType);
    lastError = v8;
  }

- (void)_batchStopIfNeeded
{
}

- (void)_fireFlushNotifications
{
}

void __40__PQLConnection__fireFlushNotifications__block_invoke(uint64_t a1)
{
  uint64_t v14 = *MEMORY[0x1895F89C0];
  uint64_t v2 = (void *)MEMORY[0x1895CF1AC]();
  ++*(_DWORD *)(*(void *)(a1 + 32) + 40LL);
  __int128 v9 = 0u;
  __int128 v10 = 0u;
  __int128 v11 = 0u;
  __int128 v12 = 0u;
  id v3 = *(id *)(a1 + 40);
  uint64_t v4 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v10;
    do
    {
      for (uint64_t i = 0LL; i != v5; ++i)
      {
        if (*(void *)v10 != v6) {
          objc_enumerationMutation(v3);
        }
        if (*(void *)(*(void *)(a1 + 32) + 16LL)) {
          uint64_t v8 = *(void *)(a1 + 32);
        }
        else {
          uint64_t v8 = 0LL;
        }
        (*(void (**)(void, uint64_t))(*(void *)(*((void *)&v9 + 1) + 8 * i) + 16LL))( *(void *)(*((void *)&v9 + 1) + 8 * i),  v8);
      }

      uint64_t v5 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }

    while (v5);
  }

  --*(_DWORD *)(*(void *)(a1 + 32) + 40LL);
  objc_autoreleasePoolPop(v2);
}

- (int)_vacuumMode
{
  id v2 = -[PQLConnection fetch:](self, "fetch:", @"PRAGMA auto_vacuum");
  if ([v2 next])
  {
    [v2 stringAtIndex:0];
    id v3 = (void *)objc_claimAutoreleasedReturnValue();
    [v3 lowercaseString];
    uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue();

    if ([v4 isEqualToString:@"incremental"])
    {
      int v5 = 2;
    }

    else if ([v4 isEqualToString:@"full"])
    {
      int v5 = 1;
    }

    else if ([v4 isEqualToString:@"off"])
    {
      int v5 = 0;
    }

    else
    {
      int v6 = [v4 intValue];
      if (v6 >= 2) {
        int v7 = 2;
      }
      else {
        int v7 = v6;
      }
      int v5 = v7 & ~(v7 >> 31);
    }
  }

  else
  {
    int v5 = 0;
  }

  return v5;
}

- (BOOL)_incrementalVacuum:(unint64_t)a3
{
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue();
  db = self->_db;
  id v6 = v4;
  int v7 = sqlite3_exec(db, (const char *)[v6 UTF8String], 0, 0, 0);
  if (v7)
  {
    if (pql_pred != -1) {
      dispatch_once_f(&pql_pred, 0LL, (dispatch_function_t)_pql_log_init);
    }
    uint64_t v8 = (os_log_s *)pql_log;
    if (os_log_type_enabled((os_log_t)pql_log, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_18895A000, v8, OS_LOG_TYPE_DEFAULT, "warning: Incremental vacuum failed", buf, 2u);
    }
  }

  --self->_suspendCaching;

  return v7 == 0;
}

- (void)_vacuumIfNeeded
{
}

- (BOOL)_fullSync
{
  uint64_t v27 = *MEMORY[0x1895F89C0];
  self->_currentStmtStart = mach_absolute_time();
  int v3 = sqlite3_wal_checkpoint_v2(self->_db, "main", 1, 0LL, 0LL);
  self->_currentStmtStart = 0LL;
  if (v3)
  {
    [MEMORY[0x189607870] errorForDB:self->_db];
    uint64_t v4 = (NSError *)objc_claimAutoreleasedReturnValue();
    lastError = self->_lastError;
    self->_lastError = v4;

LABEL_3:
    (*((void (**)(void))self->_autoRollbackHandler + 2))();
    return 0;
  }

  if (pql_pred != -1) {
    dispatch_once_f(&pql_pred, 0LL, (dispatch_function_t)_pql_log_init);
  }
  int v7 = (os_log_s *)pql_log;
  if (os_log_type_enabled((os_log_t)pql_log, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v8 = "full";
    if (!self->_needsFullSync) {
      uint64_t v8 = "barrier";
    }
    int v21 = 136315394;
    v22 = (PQLConnection *)v8;
    __int16 v23 = 2112;
    v24 = self;
    _os_log_impl(&dword_18895A000, v7, OS_LOG_TYPE_DEBUG, "%s fsyncing %@", (uint8_t *)&v21, 0x16u);
  }

  int v9 = open(-[NSURL fileSystemRepresentation](self->_url, "fileSystemRepresentation"), 0);
  if (v9 < 0)
  {
    [MEMORY[0x189607870] errorWithDomain:*MEMORY[0x189607688] code:*__error() userInfo:0];
    __int128 v12 = (NSError *)objc_claimAutoreleasedReturnValue();
    dispatch_time_t v13 = self->_lastError;
    self->_lastError = v12;

    if (pql_pred != -1) {
      dispatch_once_f(&pql_pred, 0LL, (dispatch_function_t)_pql_log_init);
    }
    uint64_t v14 = (os_log_s *)pql_log;
    if (os_log_type_enabled((os_log_t)pql_log, OS_LOG_TYPE_ERROR))
    {
      dispatch_block_t v15 = self->_lastError;
      int v21 = 138412546;
      v22 = self;
      __int16 v23 = 2112;
      v24 = (PQLConnection *)v15;
      _os_log_impl( &dword_18895A000,  v14,  OS_LOG_TYPE_ERROR,  "Failed to open the db for fsync %@ - %@",  (uint8_t *)&v21,  0x16u);
    }

    goto LABEL_3;
  }

  int v10 = v9;
  if (self->_needsFullSync) {
    int v11 = fcntl(v9, 51);
  }
  else {
    int v11 = fcntl(v9, 85);
  }
  if (v11 < 0)
  {
    [MEMORY[0x189607870] errorWithDomain:*MEMORY[0x189607688] code:*__error() userInfo:0];
    __int128 v16 = (NSError *)objc_claimAutoreleasedReturnValue();
    id v17 = self->_lastError;
    self->_lastError = v16;

    if (pql_pred != -1) {
      dispatch_once_f(&pql_pred, 0LL, (dispatch_function_t)_pql_log_init);
    }
    v18 = (os_log_s *)pql_log;
    if (os_log_type_enabled((os_log_t)pql_log, OS_LOG_TYPE_ERROR))
    {
      id v19 = "F_FULLFSYNC";
      v20 = self->_lastError;
      if (!self->_needsFullSync) {
        id v19 = "F_BARRIERFSYNC";
      }
      int v21 = 136315650;
      v22 = (PQLConnection *)v19;
      __int16 v23 = 2112;
      v24 = self;
      __int16 v25 = 2112;
      v26 = v20;
      _os_log_impl(&dword_18895A000, v18, OS_LOG_TYPE_ERROR, "Failed to %s the db for %@ - %@", (uint8_t *)&v21, 0x20u);
    }

    (*((void (**)(void))self->_autoRollbackHandler + 2))();
    close(v10);
    return 0;
  }

  close(v10);
  return 1;
}

- (void)flush
{
  uint64_t v24 = *MEMORY[0x1895F89C0];
  if (self->_useQueue) {
    dispatch_assert_queue_V2((dispatch_queue_t)self->_targetQueue);
  }
  if (self->_savePointLevel)
  {
    [MEMORY[0x1896077D8] currentHandler];
    int v21 = (void *)objc_claimAutoreleasedReturnValue();
    [v21 handleFailureInMethod:a2 object:self file:@"PQLConnection.m" lineNumber:734 description:@"-flush is invalid when in a savepoint"];
  }

  if (!self->_db)
  {
    if (!self->_crashIfUsedAfterClose)
    {
      [MEMORY[0x189607870] errorWithSqliteCode:21 andMessage:@"connection is closed"];
      id v19 = (NSError *)objc_claimAutoreleasedReturnValue();
      lastError = self->_lastError;
      self->_lastError = v19;

      return;
    }

    [MEMORY[0x1896077D8] currentHandler];
    uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue();
    [v4 handleFailureInMethod:a2 object:self file:@"PQLConnection.m" lineNumber:736 description:@"Connection has been used after close (or before open)"];
  }

  if (self->_batchStarted)
  {
    int v5 = (void *)MEMORY[0x1895CF1AC]();
    id v6 = self->_batchStarted;
    batchingTimer = self->_batchingTimer;
    if (batchingTimer)
    {
      dispatch_source_cancel((dispatch_source_t)batchingTimer);
      uint64_t v8 = self->_batchingTimer;
      self->_batchingTimer = 0LL;
    }

    id batchingPolicyHandler = (void (**)(id, PQLConnection *, uint64_t))self->_batchingPolicyHandler;
    if (batchingPolicyHandler) {
      batchingPolicyHandler[2](batchingPolicyHandler, self, 0xFFFFFFFFLL);
    }
    ++self->_skipBatchStop;
    preFlushHook = (void (**)(id, PQLConnection *))self->_preFlushHook;
    if (preFlushHook) {
      preFlushHook[2](preFlushHook, self);
    }
    if (-[PQLConnection _execute:mustSucceed:bindings:]( self,  "_execute:mustSucceed:bindings:",  @"commit",  1LL,  0LL))
    {
      if (self->_needsFullSync || self->_needsBarrierFSync)
      {
        if (-[PQLConnection synchronousMode](self, "synchronousMode") != 2) {
          -[PQLConnection _fullSync](self, "_fullSync");
        }
        *(_WORD *)&self->_needsFullSync = 0;
      }

      batchStarted = self->_batchStarted;
      self->_batchStarted = 0LL;

      didFinishBatchingHook = (void (**)(id, PQLConnection *))self->_didFinishBatchingHook;
      if (didFinishBatchingHook) {
        didFinishBatchingHook[2](didFinishBatchingHook, self);
      }
      if (pql_pred != -1) {
        dispatch_once_f(&pql_pred, 0LL, (dispatch_function_t)_pql_log_init);
      }
      dispatch_time_t v13 = (os_log_s *)pql_log;
      if (os_log_type_enabled((os_log_t)pql_log, OS_LOG_TYPE_DEBUG))
      {
        int v22 = 138412290;
        __int16 v23 = self;
        _os_log_impl(&dword_18895A000, v13, OS_LOG_TYPE_DEBUG, "Flushed %@", (uint8_t *)&v22, 0xCu);
      }

      if ((self->_vacuumTracker & 0x80000000) == 0) {
        -[PQLConnection _vacuumIfNeeded](self, "_vacuumIfNeeded");
      }
      postFlushHook = (void (**)(id, PQLConnection *))self->_postFlushHook;
      if (postFlushHook) {
        postFlushHook[2](postFlushHook, self);
      }
    }

    else
    {
      dispatch_block_t v15 = self->_batchStarted;
      self->_batchStarted = 0LL;

      __int128 v16 = (void (**)(id, PQLConnection *))self->_didFinishBatchingHook;
      if (v16) {
        v16[2](v16, self);
      }
      flushNotifications = self->_flushNotifications;
      self->_flushNotifications = 0LL;

      if ((self->_vacuumTracker & 0x80000000) == 0) {
        -[PQLConnection _vacuumIfNeeded](self, "_vacuumIfNeeded");
      }
    }

    --self->_skipBatchStop;
    objc_opt_self();
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    if (v18)
    {

      id v6 = 0LL;
    }

    self->_batchingChangesCount = sqlite3_total_changes(self->_db);
    if (self->_flushNotifications) {
      -[PQLConnection _fireFlushNotifications](self, "_fireFlushNotifications");
    }

    objc_autoreleasePoolPop(v5);
  }

- (void)makeNextFlushBarrierFSync
{
  if (self->_useQueue) {
    dispatch_assert_queue_V2((dispatch_queue_t)self->_targetQueue);
  }
  if (!self->_needsFullSync && !self->_needsBarrierFSync)
  {
    -[PQLConnection forceBatchStart](self, "forceBatchStart");
    self->_needsBarrierFSync = 1;
  }

- (void)makeNextFlushFullSync
{
  if (self->_useQueue) {
    dispatch_assert_queue_V2((dispatch_queue_t)self->_targetQueue);
  }
  if (!self->_needsFullSync)
  {
    -[PQLConnection forceBatchStart](self, "forceBatchStart");
    self->_needsFullSync = 1;
  }

- (BOOL)_performWithFlags:(unsigned int)a3 action:(id)a4 whenFlushed:(id)a5
{
  char v6 = a3;
  int v9 = (unsigned int (**)(id, PQLConnection *))a4;
  id v10 = a5;
  uint64_t v11 = -[NSMutableArray count](self->_flushNotifications, "count");
  if (!self->_db)
  {
    if (!self->_crashIfUsedAfterClose)
    {
      [MEMORY[0x189607870] errorWithSqliteCode:21 andMessage:@"connection is closed"];
      v49 = (NSError *)objc_claimAutoreleasedReturnValue();
      lastError = self->_lastError;
      self->_lastError = v49;

      int v21 = 0LL;
      int v22 = 0LL;
      v47 = 0LL;
      v20 = 0LL;
      BOOL v40 = 0;
      goto LABEL_72;
    }

    [MEMORY[0x1896077D8] currentHandler];
    __int128 v12 = (void *)objc_claimAutoreleasedReturnValue();
    [v12 handleFailureInMethod:a2 object:self file:@"PQLConnection.m" lineNumber:858 description:@"Connection has been used after close (or before open)"];
  }

  if (self->_useQueue) {
    dispatch_assert_queue_V2((dispatch_queue_t)self->_targetQueue);
  }
  if ((v6 & 0x20) != 0) {
    -[PQLConnection flush](self, "flush");
  }
  if (v10)
  {
    if (self->_useBatching) {
      v6 |= 4u;
    }
    if (!self->_useQueue)
    {
      [MEMORY[0x1896077D8] currentHandler];
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      [v54 handleFailureInMethod:a2 object:self file:@"PQLConnection.m" lineNumber:869 description:@"completion handler passed and no serial Queue in use"];
    }

    if ((v6 & 0xC) == 0)
    {
      [MEMORY[0x1896077D8] currentHandler];
      dispatch_time_t v13 = (void *)objc_claimAutoreleasedReturnValue();
      uint64_t v14 = v13;
      dispatch_block_t v15 = @"flush notification makes no sense without batching or savepoints";
      SEL v16 = a2;
      id v17 = self;
      uint64_t v18 = 871LL;
LABEL_80:
      [v13 handleFailureInMethod:v16 object:v17 file:@"PQLConnection.m" lineNumber:v18 description:v15];
    }
  }

  else if ((v6 & 4) != 0 && !self->_useBatching)
  {
    [MEMORY[0x1896077D8] currentHandler];
    dispatch_time_t v13 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v14 = v13;
    dispatch_block_t v15 = @"PerformSuspendBatch makes no sense if batching isn't in use";
    SEL v16 = a2;
    id v17 = self;
    uint64_t v18 = 873LL;
    goto LABEL_80;
  }

  int v19 = v6 & 0xC;
  if ((v6 & 0xC) != 0)
  {
    if (self->_useBatching || self->_savePointLevel)
    {
      v20 = 0LL;
    }

    else
    {
      willBeginBatchingHook = (void (**)(id, PQLConnection *))self->_willBeginBatchingHook;
      if (willBeginBatchingHook) {
        willBeginBatchingHook[2](willBeginBatchingHook, self);
      }
      v20 = (void *)os_transaction_create();
    }

    ++self->_skipBatchStop;
    if ((v6 & 2) != 0) {
      goto LABEL_22;
    }
  }

  else
  {
    v20 = 0LL;
    if ((v6 & 2) != 0) {
LABEL_22:
    }
      ++self->_suspendCaching;
  }

  if ((v6 & 8) != 0)
  {
    uint64_t savePointLevel = self->_savePointLevel;
    uint64_t v24 = v9;
    if (savePointLevel > 4)
    {
      objc_msgSend( NSString,  "stringWithFormat:",  @"savepoint savepoint_%d",  self->_savePointLevel);
      int v21 = (__CFString *)objc_claimAutoreleasedReturnValue();
      objc_msgSend( NSString,  "stringWithFormat:",  @"rollback to savepoint savepoint_%d",  self->_savePointLevel);
      int v22 = (__CFString *)objc_claimAutoreleasedReturnValue();
      int v19 = v6 & 0xC;
      objc_msgSend( NSString,  "stringWithFormat:",  @"release savepoint savepoint_%d",  self->_savePointLevel);
      __int16 v25 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }

    else
    {
      int v21 = _performWithFlags_action_whenFlushed__start_list[savePointLevel];
      int v22 = _performWithFlags_action_whenFlushed__rollback_list[self->_savePointLevel];
      __int16 v25 = _performWithFlags_action_whenFlushed__release_list[self->_savePointLevel];
    }

    v57 = v25;
    v26 = self;
    p_isa = (id *)&v26->super.isa;
    if (v26->_useBatching && !v26->_batchStarted) {
      -[PQLConnection _batchStartIfNeeded:](v26, "_batchStartIfNeeded:", v26->_batchTransactionType);
    }

    if (![p_isa _execute:v21 mustSucceed:1 bindings:0])
    {
      int v9 = v24;
      goto LABEL_51;
    }

    int v55 = v19;
    uint64_t v56 = v11;
    v28 = v21;
    id v29 = v10;
    ++self->_savePointLevel;
    v30 = v24;
    char v31 = v24[2](v24, (PQLConnection *)p_isa);
    id v32 = p_isa[31];
    if ((v31 & 1) == 0) {
      [p_isa _execute:v22 mustSucceed:1 bindings:0];
    }
    --self->_savePointLevel;
    char v33 = [p_isa _execute:v57 mustSucceed:1 bindings:0] & v31;
    id v34 = p_isa[31];
    p_isa[31] = v32;

    int v9 = v30;
    id v10 = v29;
    int v21 = v28;
    uint64_t v11 = v56;
    int v19 = v55;
    if ((v33 & 1) == 0)
    {
LABEL_51:
      uint64_t v41 = -[NSMutableArray count](self->_flushNotifications, "count");
      if (v41 != v11) {
        -[NSMutableArray removeObjectsInRange:](self->_flushNotifications, "removeObjectsInRange:", v11, v41 - v11);
      }
      BOOL v40 = 0;
      if ((v6 & 2) == 0) {
        goto LABEL_55;
      }
      goto LABEL_54;
    }
  }

  else
  {
    int v21 = 0LL;
    int v22 = 0LL;
    v57 = 0LL;
    if (!v9[2](v9, self)) {
      goto LABEL_51;
    }
  }

  if (v10)
  {
    if (self->_batchStarted || self->_savePointLevel)
    {
      int v35 = v19;
      flushNotifications = self->_flushNotifications;
      if (!flushNotifications)
      {
        v37 = (NSMutableArray *)objc_opt_new();
        v38 = self->_flushNotifications;
        self->_flushNotifications = v37;

        flushNotifications = self->_flushNotifications;
      }

      v39 = (void *)MEMORY[0x1895CF32C](v10);
      -[NSMutableArray addObject:](flushNotifications, "addObject:", v39);

      int v19 = v35;
    }

    else
    {
      if (self->_flushNotifications) {
        -[PQLConnection _performWithFlags:action:whenFlushed:].cold.1();
      }
      int v52 = v19;
      serialQueue = self->_serialQueue;
      block[0] = MEMORY[0x1895F87A8];
      block[1] = 3221225472LL;
      block[2] = __54__PQLConnection__performWithFlags_action_whenFlushed___block_invoke;
      block[3] = &unk_18A2BF990;
      block[4] = self;
      id v59 = v10;
      dispatch_async((dispatch_queue_t)serialQueue, block);

      int v19 = v52;
    }
  }

  BOOL v40 = 1;
  if ((v6 & 2) == 0) {
    goto LABEL_55;
  }
LABEL_54:
  --self->_suspendCaching;
LABEL_55:
  if (v19)
  {
    objc_opt_self();
    v42 = (void *)objc_claimAutoreleasedReturnValue();

    if (v42)
    {
      if (self->_flushNotifications) {
        -[PQLConnection _fireFlushNotifications](self, "_fireFlushNotifications");
      }

      didFinishBatchingHook = (void (**)(id, PQLConnection *))self->_didFinishBatchingHook;
      if (didFinishBatchingHook) {
        didFinishBatchingHook[2](didFinishBatchingHook, self);
      }
      v20 = 0LL;
    }

    --self->_skipBatchStop;
  }

  v44 = self;
  v45 = v44;
  if (v44->_useBatching && v44->_batchStarted && !v44->_skipBatchStop) {
    -[PQLConnection _batchStopIfNeeded](v44, "_batchStopIfNeeded");
  }

  char v46 = !v40;
  if ((v6 & 0x10) == 0) {
    char v46 = 1;
  }
  if ((v46 & 1) == 0)
  {
    -[PQLConnection flush](v45, "flush");
    BOOL v40 = 1;
  }

  v47 = v57;
LABEL_72:

  return v40;
}

void __54__PQLConnection__performWithFlags_action_whenFlushed___block_invoke(uint64_t a1)
{
  id v2 = (void *)MEMORY[0x1895CF1AC]();
  ++*(_DWORD *)(*(void *)(a1 + 32) + 40LL);
  if (*(void *)(*(void *)(a1 + 32) + 16LL)) {
    uint64_t v3 = *(void *)(a1 + 32);
  }
  else {
    uint64_t v3 = 0LL;
  }
  (*(void (**)(void, uint64_t))(*(void *)(a1 + 40) + 16LL))(*(void *)(a1 + 40), v3);
  --*(_DWORD *)(*(void *)(a1 + 32) + 40LL);
  objc_autoreleasePoolPop(v2);
}

- (BOOL)isBatchSuspended
{
  if (self->_useQueue) {
    dispatch_assert_queue_V2((dispatch_queue_t)self->_targetQueue);
  }
  return self->_skipBatchStop > 0;
}

- (void)groupInBatch:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1895F87A8];
  v6[1] = 3221225472LL;
  v6[2] = __30__PQLConnection_groupInBatch___block_invoke;
  v6[3] = &unk_18A2BF9B8;
  id v7 = v4;
  id v5 = v4;
  -[PQLConnection _performWithFlags:action:whenFlushed:](self, "_performWithFlags:action:whenFlushed:", 4LL, v6, 0LL);
}

uint64_t __30__PQLConnection_groupInBatch___block_invoke(uint64_t a1)
{
  return 1LL;
}

- (BOOL)groupInTransaction:(id)a3
{
  return -[PQLConnection _performWithFlags:action:whenFlushed:]( self,  "_performWithFlags:action:whenFlushed:",  8LL,  a3,  0LL);
}

- (BOOL)performWithFlags:(unsigned int)a3 action:(id)a4 whenFlushed:(id)a5
{
  uint64_t v6 = *(void *)&a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v20 = 0LL;
  int v21 = &v20;
  uint64_t v22 = 0x2020000000LL;
  if ((v6 & 1) != 0)
  {
    if (!self->_useQueue)
    {
      [MEMORY[0x1896077D8] currentHandler];
      uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue();
      [v14 handleFailureInMethod:a2 object:self file:@"PQLConnection.m" lineNumber:1000 description:@"PerformOnSerialQueue asked with no serial Queue in use"];
    }

    serialQueue = self->_serialQueue;
    block[0] = MEMORY[0x1895F87A8];
    block[1] = 3221225472LL;
    block[2] = __53__PQLConnection_performWithFlags_action_whenFlushed___block_invoke;
    block[3] = &unk_18A2BF9E0;
    uint64_t v18 = &v20;
    block[4] = self;
    int v19 = v6;
    id v16 = v9;
    id v17 = v10;
    dispatch_sync((dispatch_queue_t)serialQueue, block);

    BOOL v11 = *((_BYTE *)v21 + 24) != 0;
  }

  else
  {
    BOOL v11 = -[PQLConnection _performWithFlags:action:whenFlushed:]( self,  "_performWithFlags:action:whenFlushed:",  v6,  v9,  v10);
    *((_BYTE *)v21 + 24) = v11;
  }

  _Block_object_dispose(&v20, 8);

  return v11;
}

uint64_t __53__PQLConnection_performWithFlags_action_whenFlushed___block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) _performWithFlags:*(unsigned int *)(a1 + 64) action:*(void *)(a1 + 40) whenFlushed:*(void *)(a1 + 48)];
  *(_BYTE *)(*(void *)(*(void *)(a1 + 56) + 8LL) + 24LL) = result;
  return result;
}

- (BOOL)performWithFlags:(unsigned int)a3 action:(id)a4
{
  uint64_t v4 = *(void *)&a3;
  id v7 = a4;
  uint64_t v16 = 0LL;
  id v17 = &v16;
  uint64_t v18 = 0x2020000000LL;
  if ((v4 & 1) != 0)
  {
    if (!self->_useQueue)
    {
      [MEMORY[0x1896077D8] currentHandler];
      BOOL v11 = (void *)objc_claimAutoreleasedReturnValue();
      [v11 handleFailureInMethod:a2 object:self file:@"PQLConnection.m" lineNumber:1016 description:@"PerformOnSerialQueue asked with no serial Queue in use"];
    }

    serialQueue = self->_serialQueue;
    v12[0] = MEMORY[0x1895F87A8];
    v12[1] = 3221225472LL;
    v12[2] = __41__PQLConnection_performWithFlags_action___block_invoke;
    v12[3] = &unk_18A2BFA08;
    uint64_t v14 = &v16;
    v12[4] = self;
    int v15 = v4;
    id v13 = v7;
    dispatch_sync((dispatch_queue_t)serialQueue, v12);

    BOOL v8 = *((_BYTE *)v17 + 24) != 0;
  }

  else
  {
    BOOL v8 = -[PQLConnection _performWithFlags:action:whenFlushed:]( self,  "_performWithFlags:action:whenFlushed:",  v4,  v7,  0LL);
    *((_BYTE *)v17 + 24) = v8;
  }

  _Block_object_dispose(&v16, 8);

  return v8;
}

uint64_t __41__PQLConnection_performWithFlags_action___block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) _performWithFlags:*(unsigned int *)(a1 + 56) action:*(void *)(a1 + 40) whenFlushed:0];
  *(_BYTE *)(*(void *)(*(void *)(a1 + 48) + 8LL) + 24LL) = result;
  return result;
}

- (void)setTraced:(BOOL)a3
{
  BOOL v3 = a3;
  if (self->_useQueue) {
    dispatch_assert_queue_V2((dispatch_queue_t)self->_targetQueue);
  }
  db = self->_db;
  if (db)
  {
    if (v3)
    {
      uint64_t v6 = (int (__cdecl *)(unsigned int, void *, void *, void *))db_trace;
      unsigned int v7 = 1;
    }

    else
    {
      unsigned int v7 = 0;
      uint64_t v6 = 0LL;
    }

    sqlite3_trace_v2(db, v7, v6, self);
  }

  self->_traced = v3;
}

- (void)_clearCleanupCacheQueueIfNeeded
{
  obj = self->_stmtCacheCleanupQueue;
  objc_sync_enter(obj);
  -[NSMutableArray removeAllObjects](self->_stmtCacheCleanupQueue, "removeAllObjects");
  objc_sync_exit(obj);
}

- (void)_clearStatementCache
{
  if (self->_serialQueue)
  {
    preparedStatements = self->_preparedStatements;
    if (preparedStatements) {
      cache_remove_all(preparedStatements);
    }
  }

  -[PQLConnection _clearCleanupCacheQueueIfNeeded](self, "_clearCleanupCacheQueueIfNeeded");
}

- (BOOL)openAtURL:(id)a3 withFlags:(int)a4 error:(id *)a5
{
  uint64_t v19 = *MEMORY[0x1895F89C0];
  id v10 = a3;
  objc_storeStrong((id *)&self->_url, a3);
  p_db = &self->_db;
  if (self->_db)
  {
    [MEMORY[0x1896077D8] currentHandler];
    uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue();
    [v16 handleFailureInMethod:a2 object:self file:@"PQLConnection.m" lineNumber:1094 description:@"-openAtURL called twice"];
  }

  int v12 = sqlite3_open_v2(-[NSURL fileSystemRepresentation](self->_url, "fileSystemRepresentation"), &self->_db, a4, 0LL);
  if (v12)
  {
    if (*p_db)
    {
      if (a5)
      {
        objc_msgSend(MEMORY[0x189607870], "errorForDB:");
        *a5 = (id)objc_claimAutoreleasedReturnValue();
      }

      -[PQLConnection close:](self, "close:", 0LL);
    }

    else if (a5)
    {
      [MEMORY[0x189607870] errorWithDomain:@"SqliteErrorDomain" code:v12 userInfo:0];
      *a5 = (id)objc_claimAutoreleasedReturnValue();
    }

    -[PQLConnection _resetState](self, "_resetState");
  }

  else
  {
    if (sqlite3_busy_handler(*p_db, (int (__cdecl *)(void *, int))__PQLBusyHandlerFunction, self))
    {
      if (pql_pred != -1) {
        dispatch_once_f(&pql_pred, 0LL, (dispatch_function_t)_pql_log_init);
      }
      id v13 = (os_log_s *)pql_log;
      if (os_log_type_enabled((os_log_t)pql_log, OS_LOG_TYPE_ERROR))
      {
        LOWORD(v17) = 0;
        _os_log_impl(&dword_18895A000, v13, OS_LOG_TYPE_ERROR, "Can't set busy handler", (uint8_t *)&v17, 2u);
      }
    }

    if (self->_traced)
    {
      if (pql_pred != -1) {
        dispatch_once_f(&pql_pred, 0LL, (dispatch_function_t)_pql_log_init);
      }
      uint64_t v14 = (os_log_s *)pql_log;
      if (os_log_type_enabled((os_log_t)pql_log, OS_LOG_TYPE_DEBUG))
      {
        int v17 = 138412290;
        uint64_t v18 = self;
        _os_log_impl(&dword_18895A000, v14, OS_LOG_TYPE_DEBUG, "opened %@", (uint8_t *)&v17, 0xCu);
      }

      -[PQLConnection setTraced:](self, "setTraced:", self->_traced);
    }

    -[PQLConnection _clearStatementCache](self, "_clearStatementCache");
  }

  return v12 == 0;
}

- (BOOL)openAtURL:(id)a3 sharedCache:(BOOL)a4 error:(id *)a5
{
  if (a4) {
    uint64_t v5 = 131078LL;
  }
  else {
    uint64_t v5 = 262150LL;
  }
  return -[PQLConnection openAtURL:withFlags:error:](self, "openAtURL:withFlags:error:", a3, v5, a5);
}

- (BOOL)destroyDatabaseWithError:(id *)a3
{
  int v22 = 0;
  if (!self->_db)
  {
    if (!self->_crashIfUsedAfterClose)
    {
      [MEMORY[0x189607870] errorWithSqliteCode:21 andMessage:@"connection is closed"];
      uint64_t v20 = (NSError *)objc_claimAutoreleasedReturnValue();
      lastError = self->_lastError;
      self->_lastError = v20;

      return 0;
    }

    [MEMORY[0x1896077D8] currentHandler];
    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
    [v6 handleFailureInMethod:a2 object:self file:@"PQLConnection.m" lineNumber:1132 description:@"Connection has been used after close (or before open)"];
  }

  id v7 = -[PQLConnection fetchObjectOfClass:sql:]( self,  "fetchObjectOfClass:sql:",  objc_opt_class(),  @"PRAGMA page_size");
  int v8 = 0;
  *((void *)&v9 + 1) = [v7 integerValue];
  *(void *)&__int128 v9 = *((void *)&v9 + 1) - 1024LL;
  switch((unint64_t)(v9 >> 10))
  {
    case 0uLL:
      int v8 = 16;
      goto LABEL_9;
    case 1uLL:
      int v8 = 32;
      goto LABEL_9;
    case 3uLL:
      int v8 = 48;
      goto LABEL_9;
    case 7uLL:
      int v8 = 64;
LABEL_9:
      int v22 = v8;
      break;
    default:
      break;
  }

  id v10 = -[PQLConnection fetchObjectOfClass:sql:]( self,  "fetchObjectOfClass:sql:",  objc_opt_class(),  @"PRAGMA journal_mode");
  [v10 lowercaseString];
  BOOL v11 = (void *)objc_claimAutoreleasedReturnValue();
  int v12 = [v11 isEqualToString:@"wal"];

  if (v12)
  {
    v8 |= 1u;
    int v22 = v8;
  }

  int v13 = -[PQLConnection _vacuumMode](self, "_vacuumMode");
  if (v13 == 2)
  {
    int v14 = v8 | 0xC;
  }

  else if (v13 == 1)
  {
    int v14 = v8 | 8;
  }

  else
  {
    if (v13) {
      goto LABEL_19;
    }
    int v14 = v8 | 4;
  }

  int v22 = v14;
LABEL_19:
  int v15 = sqlite3_file_control(self->_db, 0LL, 101, &v22);
  BOOL v16 = v15 == 0;
  if (v15)
  {
    [MEMORY[0x189607870] errorForDB:self->_db];
    int v17 = (NSError *)objc_claimAutoreleasedReturnValue();
    uint64_t v18 = self->_lastError;
    self->_lastError = v17;

    if (a3) {
      *a3 = self->_lastError;
    }
  }

  return v16;
}

- (BOOL)setupPragmas
{
  if (!self->_db)
  {
    if (!self->_crashIfUsedAfterClose)
    {
      [MEMORY[0x189607870] errorWithSqliteCode:21 andMessage:@"connection is closed"];
      int v12 = (NSError *)objc_claimAutoreleasedReturnValue();
      BOOL v10 = 0;
      lastError = self->_lastError;
      self->_lastError = v12;
      goto LABEL_14;
    }

    [MEMORY[0x1896077D8] currentHandler];
    uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue();
    [v4 handleFailureInMethod:a2 object:self file:@"PQLConnection.m" lineNumber:1169 description:@"Connection has been used after close (or before open)"];
  }

  if (self->_useQueue) {
    dispatch_assert_queue_V2((dispatch_queue_t)self->_targetQueue);
  }
  ++self->_suspendCaching;
  if (-[PQLConnection execute:](self, "execute:", @"PRAGMA auto_vacuum = incremental")
    && -[PQLConnection execute:](self, "execute:", @"PRAGMA page_size = 4096"))
  {
    if (self->_shouldUseWALJournalMode)
    {
      lastError = -[PQLConnection fetchObjectOfClass:sql:]( self,  "fetchObjectOfClass:sql:",  objc_opt_class(),  @"PRAGMA journal_mode = WAL");
      -[NSError lowercaseString](lastError, "lowercaseString");
      uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
      char v7 = [v6 isEqualToString:@"wal"];

      if ((v7 & 1) == 0)
      {
        [MEMORY[0x189607870] errorWithSqliteCode:2 andMessage:@"cannot set journal_mode to WAL"];
        __int128 v9 = (NSError *)objc_claimAutoreleasedReturnValue();
        id v8 = 0LL;
        goto LABEL_19;
      }

      id v8 = -[PQLConnection fetchObjectOfClass:sql:]( self,  "fetchObjectOfClass:sql:",  objc_opt_class(),  @"PRAGMA wal_autocheckpoint = 4000");
      if (([v8 isEqualToNumber:&unk_18A2C3B40] & 1) == 0)
      {
        [MEMORY[0x189607870] errorWithSqliteCode:2 andMessage:@"cannot set wal_autocheckpoint to 4000"];
        __int128 v9 = (NSError *)objc_claimAutoreleasedReturnValue();
LABEL_19:
        int v13 = self->_lastError;
        self->_lastError = v9;

        BOOL v10 = 0;
        goto LABEL_13;
      }
    }

    else
    {
      lastError = 0LL;
      id v8 = 0LL;
    }

    BOOL v10 = 1;
  }

  else
  {
    BOOL v10 = 0;
    lastError = 0LL;
    id v8 = 0LL;
  }

- (BOOL)registerFunction:(id)a3 nArgs:(int)a4 handler:(id)a5
{
  id v9 = a3;
  id v10 = a5;
  if (!self->_db)
  {
    if (!self->_crashIfUsedAfterClose)
    {
      [MEMORY[0x189607870] errorWithSqliteCode:21 andMessage:@"connection is closed"];
      uint64_t v20 = (NSError *)objc_claimAutoreleasedReturnValue();
      lastError = self->_lastError;
      self->_lastError = v20;

LABEL_11:
      BOOL v19 = 0;
      goto LABEL_12;
    }

    [MEMORY[0x1896077D8] currentHandler];
    BOOL v11 = (void *)objc_claimAutoreleasedReturnValue();
    [v11 handleFailureInMethod:a2 object:self file:@"PQLConnection.m" lineNumber:1226 description:@"Connection has been used after close (or before open)"];
  }

  if (self->_useQueue) {
    dispatch_assert_queue_V2((dispatch_queue_t)self->_targetQueue);
  }
  db = self->_db;
  int v13 = (const char *)[v9 UTF8String];
  id v14 = (id)[v10 copy];
  function_id v2 = sqlite3_create_function_v2( db,  v13,  a4,  5,  v14,  (void (__cdecl *)(sqlite3_context *, int, sqlite3_value **))pql_invoke_xfunc,  0LL,  0LL,  (void (__cdecl *)(void *))pql_destroy_xfunc);

  if (function_v2)
  {
    [MEMORY[0x189607870] errorForDB:self->_db];
    BOOL v16 = (NSError *)objc_claimAutoreleasedReturnValue();
    int v17 = self->_lastError;
    self->_lastError = v16;

    sqliteErrorHandler = (void (**)(id, PQLConnection *, void, NSError *))self->_sqliteErrorHandler;
    if (sqliteErrorHandler) {
      sqliteErrorHandler[2](sqliteErrorHandler, self, 0LL, self->_lastError);
    }
    goto LABEL_11;
  }

  BOOL v19 = 1;
LABEL_12:

  return v19;
}

- (BOOL)close:(id *)a3
{
  uint64_t v25 = *MEMORY[0x1895F89C0];
  if (self->_useQueue) {
    dispatch_assert_queue_V2((dispatch_queue_t)self->_targetQueue);
  }
  -[PQLConnection flush](self, "flush");
  -[PQLConnection _clearStatementCache](self, "_clearStatementCache");
  id batchingPolicyHandler = self->_batchingPolicyHandler;
  self->_id batchingPolicyHandler = 0LL;

  db = self->_db;
  self->_db = 0LL;
  if (sqlite3_busy_handler(db, 0LL, 0LL))
  {
    if (pql_pred != -1) {
      dispatch_once_f(&pql_pred, 0LL, (dispatch_function_t)_pql_log_init);
    }
    char v7 = (os_log_s *)pql_log;
    if (os_log_type_enabled((os_log_t)pql_log, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_18895A000, v7, OS_LOG_TYPE_ERROR, "can't clear busy handler", buf, 2u);
    }
  }

  int v8 = sqlite3_close(db);
  if (v8)
  {
    self->_db = db;
    uint64_t v9 = [MEMORY[0x189607870] errorForDB:db];
    if (pql_pred != -1) {
      dispatch_once_f(&pql_pred, 0LL, (dispatch_function_t)_pql_log_init);
    }
    id v10 = (os_log_s *)pql_log;
    if (os_log_type_enabled((os_log_t)pql_log, OS_LOG_TYPE_ERROR))
    {
      url = self->_url;
      *(_DWORD *)buf = 138412546;
      int v22 = (PQLConnection *)url;
      __int16 v23 = 2112;
      uint64_t v24 = v9;
      _os_log_impl(&dword_18895A000, v10, OS_LOG_TYPE_ERROR, "sqlite3_close(%@) failed: %@", buf, 0x16u);
    }

    uint64_t v20 = (void *)v9;
    if (v8 == 5)
    {
      stmt = sqlite3_next_stmt(self->_db, 0LL);
      if (stmt)
      {
        int v13 = stmt;
        do
        {
          if (pql_pred != -1) {
            dispatch_once_f(&pql_pred, 0LL, (dispatch_function_t)_pql_log_init);
          }
          id v14 = (void *)pql_log;
          if (os_log_type_enabled((os_log_t)pql_log, OS_LOG_TYPE_ERROR))
          {
            int v15 = self->_url;
            BOOL v16 = v14;
            int v17 = sqlite3_sql(v13);
            *(_DWORD *)buf = 138412546;
            int v22 = (PQLConnection *)v15;
            __int16 v23 = 2080;
            uint64_t v24 = (uint64_t)v17;
            _os_log_impl( &dword_18895A000,  v16,  OS_LOG_TYPE_ERROR,  "sqlite3_close(%@) fails: [%s] isn't finalized",  buf,  0x16u);
          }

          int v13 = sqlite3_next_stmt(self->_db, v13);
        }

        while (v13);
      }
    }

    if (a3) {
      *a3 = v20;
    }
  }

  else
  {
    if (self->_traced)
    {
      if (pql_pred != -1) {
        dispatch_once_f(&pql_pred, 0LL, (dispatch_function_t)_pql_log_init);
      }
      uint64_t v18 = (os_log_s *)pql_log;
      if (os_log_type_enabled((os_log_t)pql_log, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        int v22 = self;
        _os_log_impl(&dword_18895A000, v18, OS_LOG_TYPE_DEBUG, "closed %@", buf, 0xCu);
      }
    }

    -[PQLConnection _resetState](self, "_resetState");
  }

  return v8 == 0;
}

- (BOOL)backupToURL:(id)a3 progress:(id)a4
{
  uint64_t v29 = *MEMORY[0x1895F89C0];
  id v7 = a3;
  id v8 = a4;
  if (!self->_db)
  {
    if (!self->_crashIfUsedAfterClose)
    {
      [MEMORY[0x189607870] errorWithSqliteCode:21 andMessage:@"connection is closed"];
      uint64_t v20 = (NSError *)objc_claimAutoreleasedReturnValue();
      lastError = self->_lastError;
      self->_lastError = v20;

      BOOL v16 = 0;
      goto LABEL_23;
    }

    [MEMORY[0x1896077D8] currentHandler];
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue();
    [v9 handleFailureInMethod:a2 object:self file:@"PQLConnection.m" lineNumber:1285 description:@"Connection has been used after close (or before open)"];
  }

  ppDb = 0LL;
  while (1)
  {
    id v10 = [v7 path];
    [v10 UTF8String];
    int v11 = _sqlite3_db_clone();

    if (v11 != 5) {
      break;
    }
    usleep(0x186A0u);
  }

  id v12 = [v7 path];
  uint64_t v13 = sqlite3_open_v2((const char *)[v12 fileSystemRepresentation], &ppDb, 2, 0);

  if (!(_DWORD)v13)
  {
    uint64_t v13 = sqlite3_wal_checkpoint_v2(ppDb, 0LL, 2, 0LL, 0LL);
    if (!(_DWORD)v13)
    {
      uint64_t v13 = sqlite3_close(ppDb);
      ppDb = 0LL;
    }
  }

  if (self->_traced)
  {
    if (pql_pred != -1) {
      dispatch_once_f(&pql_pred, 0LL, (dispatch_function_t)_pql_log_init);
    }
    id v14 = (os_log_s *)pql_log;
    if (os_log_type_enabled((os_log_t)pql_log, OS_LOG_TYPE_DEBUG))
    {
      url = self->_url;
      *(_DWORD *)buf = 138412802;
      uint64_t v24 = url;
      __int16 v25 = 2112;
      id v26 = v7;
      __int16 v27 = 1024;
      int v28 = v13;
      _os_log_impl(&dword_18895A000, v14, OS_LOG_TYPE_DEBUG, "finished backup from %@ to %@, rc: %d", buf, 0x1Cu);
    }
  }

  if (ppDb) {
    sqlite3_close(ppDb);
  }
  BOOL v16 = (_DWORD)v13 == 0;
  if ((_DWORD)v13)
  {
    [MEMORY[0x189607870] errorWithSqliteCode:v13 andMessage:@"backup failed"];
    int v17 = (NSError *)objc_claimAutoreleasedReturnValue();
    uint64_t v18 = self->_lastError;
    self->_lastError = v17;
  }

  else
  {
    uint64_t v18 = self->_lastError;
    self->_lastError = 0LL;
  }

LABEL_23:
  return v16;
}

- (BOOL)isInBatch
{
  if (self->_useQueue) {
    dispatch_assert_queue_V2((dispatch_queue_t)self->_targetQueue);
  }
  return self->_batchStarted != 0LL;
}

- (BOOL)isInTransaction
{
  if (self->_useQueue) {
    dispatch_assert_queue_V2((dispatch_queue_t)self->_targetQueue);
  }
  return self->_savePointLevel > 0;
}

- (int64_t)lastInsertedRowID
{
  if (!self->_db)
  {
    if (!self->_crashIfUsedAfterClose)
    {
      [MEMORY[0x189607870] errorWithSqliteCode:21 andMessage:@"connection is closed"];
      uint64_t v6 = (NSError *)objc_claimAutoreleasedReturnValue();
      lastError = self->_lastError;
      self->_lastError = v6;

      return 0LL;
    }

    [MEMORY[0x1896077D8] currentHandler];
    uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue();
    [v4 handleFailureInMethod:a2 object:self file:@"PQLConnection.m" lineNumber:1359 description:@"Connection has been used after close (or before open)"];
  }

  if (self->_useQueue) {
    dispatch_assert_queue_V2((dispatch_queue_t)self->_targetQueue);
  }
  return sqlite3_last_insert_rowid(self->_db);
}

- (void)setBatchTransactionType:(int)a3
{
  if (a3 >= 3) {
    objc_msgSend( MEMORY[0x189603F70],  "raise:format:",  *MEMORY[0x189603A60],  @"invalid transactionType passed: %ld",  a3);
  }
  self->_batchTransactionType = a3;
}

- (unint64_t)synchronousMode
{
  id v2 = -[PQLConnection fetchObjectOfClass:sql:]( self,  "fetchObjectOfClass:sql:",  objc_opt_class(),  @"PRAGMA synchronous");
  unint64_t v3 = [v2 integerValue];

  return v3;
}

- (void)setSynchronousMode:(unint64_t)a3
{
  if (self->_useBatching && self->_batchStarted)
  {
    if (pql_pred != -1) {
      dispatch_once_f(&pql_pred, 0LL, (dispatch_function_t)_pql_log_init);
    }
    uint64_t v5 = (os_log_s *)pql_log;
    if (os_log_type_enabled((os_log_t)pql_log, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_18895A000, v5, OS_LOG_TYPE_FAULT, "Safety level change from within a transaction", buf, 2u);
    }
  }

  switch(a3)
  {
    case 2uLL:
      uint64_t v6 = @"PRAGMA synchronous = 2";
      goto LABEL_13;
    case 1uLL:
      uint64_t v6 = @"PRAGMA synchronous = 1";
      goto LABEL_13;
    case 0uLL:
      uint64_t v6 = @"PRAGMA synchronous = 0";
LABEL_13:
      -[PQLConnection _execute:mustSucceed:bindings:](self, "_execute:mustSucceed:bindings:", v6, 1LL, 0LL);
      return;
  }

  objc_msgSend( MEMORY[0x189603F70],  "raise:format:",  *MEMORY[0x189603A60],  @"invalid synchronousMode passed: %ld",  a3);
}

- (void)setAutoRollbackHandler:(id)a3
{
  id v4 = a3;
  id v7 = v4;
  if (!v4)
  {
    [MEMORY[0x189603F70] raise:*MEMORY[0x189603A60] format:@"autoRollbackHandler should not be nil"];
    id v4 = 0LL;
  }

  uint64_t v5 = (void *)MEMORY[0x1895CF32C](v4);
  id autoRollbackHandler = self->_autoRollbackHandler;
  self->_id autoRollbackHandler = v5;
}

- (int64_t)changes
{
  if (!self->_db)
  {
    if (!self->_crashIfUsedAfterClose)
    {
      [MEMORY[0x189607870] errorWithSqliteCode:21 andMessage:@"connection is closed"];
      uint64_t v6 = (NSError *)objc_claimAutoreleasedReturnValue();
      lastError = self->_lastError;
      self->_lastError = v6;

      return 0LL;
    }

    [MEMORY[0x1896077D8] currentHandler];
    id v4 = (void *)objc_claimAutoreleasedReturnValue();
    [v4 handleFailureInMethod:a2 object:self file:@"PQLConnection.m" lineNumber:1414 description:@"Connection has been used after close (or before open)"];
  }

  if (self->_useQueue) {
    dispatch_assert_queue_V2((dispatch_queue_t)self->_targetQueue);
  }
  int64_t result = self->_changesOverride;
  if (!result) {
    return sqlite3_changes(self->_db);
  }
  return result;
}

- (id)_newStatementForFormat:(id)a3 preparationTime:(unint64_t *)a4 arguments:(char *)a5
{
  id v9 = a3;
  self->_changesOverride = 0LL;
  if (!self->_db)
  {
    if (!self->_crashIfUsedAfterClose)
    {
      [MEMORY[0x189607870] errorWithSqliteCode:21 andMessage:@"connection is closed"];
      int v15 = (NSError *)objc_claimAutoreleasedReturnValue();
      lastError = self->_lastError;
      self->_lastError = v15;

      uint64_t v13 = 0LL;
      goto LABEL_11;
    }

    [MEMORY[0x1896077D8] currentHandler];
    id v10 = (void *)objc_claimAutoreleasedReturnValue();
    [v10 handleFailureInMethod:a2 object:self file:@"PQLConnection.m" lineNumber:1431 description:@"Connection has been used after close (or before open)"];
  }

  if (self->_useQueue) {
    dispatch_assert_queue_V2((dispatch_queue_t)self->_targetQueue);
  }
  if (self->_suspendCaching || !self->_serialQueue) {
    preparedStatements = 0LL;
  }
  else {
    preparedStatements = self->_preparedStatements;
  }
  -[PQLConnection _clearCleanupCacheQueueIfNeeded](self, "_clearCleanupCacheQueueIfNeeded");
  id v12 = self->_lastError;
  self->_lastError = 0LL;

  uint64_t v13 = -[PQLStatement initWithFormat:arguments:db:cache:preparationTime:]( objc_alloc(&OBJC_CLASS___PQLStatement),  "initWithFormat:arguments:db:cache:preparationTime:",  v9,  a5,  self,  preparedStatements,  a4);
LABEL_11:

  return v13;
}

- (BOOL)_executeStmt:(id)a3 mustSucceed:(BOOL)a4 preparationTime:(unint64_t)a5
{
  BOOL v6 = a4;
  id v8 = (sqlite3_stmt **)a3;
  -[PQLConnection assertOnQueue](self, "assertOnQueue");
  if (!v8)
  {
    BOOL v13 = 0;
    goto LABEL_25;
  }

  self->_changesOverride = 0LL;
  int autocommit = sqlite3_get_autocommit(self->_db);
  self->_currentStmtStart = mach_absolute_time();
  int v10 = sqlite3_step(v8[1]);
  int v11 = 101;
  if (v10)
  {
    int v12 = v10;
    if (v10 != 101)
    {
      if (v10 == 100)
      {
        objc_msgSend( MEMORY[0x189603F70],  "raise:format:",  *MEMORY[0x189603A60],  @"this isn't an update, you should use -select instead");
        goto LABEL_20;
      }

      [MEMORY[0x189607870] errorForDB:self->_db stmt:v8[1]];
      id v14 = (NSError *)objc_claimAutoreleasedReturnValue();
      lastError = self->_lastError;
      self->_lastError = v14;

      int v16 = sqlite3_get_autocommit(self->_db);
      if (autocommit) {
        BOOL v17 = 1;
      }
      else {
        BOOL v17 = v16 == 0;
      }
      char v18 = v17;
      if (v6 || (v18 & 1) == 0)
      {
        id autoRollbackHandler = (void (**)(id, PQLConnection *, sqlite3_stmt **, NSError *))self->_autoRollbackHandler;
      }

      else
      {
        id autoRollbackHandler = (void (**)(id, PQLConnection *, sqlite3_stmt **, NSError *))self->_sqliteErrorHandler;
        if (!autoRollbackHandler) {
          goto LABEL_19;
        }
      }

      autoRollbackHandler[2](autoRollbackHandler, self, v8, self->_lastError);
LABEL_19:
      int v11 = v12;
    }
  }

- (BOOL)_execute:(id)a3 mustSucceed:(BOOL)a4 bindings:(char *)a5
{
  BOOL v5 = a4;
  uint64_t v9 = 0LL;
  id v7 = -[PQLConnection _newStatementForFormat:preparationTime:arguments:]( self,  "_newStatementForFormat:preparationTime:arguments:",  a3,  &v9,  a5);
  LOBYTE(v5) = -[PQLConnection _executeStmt:mustSucceed:preparationTime:]( self,  "_executeStmt:mustSucceed:preparationTime:",  v7,  v5,  v9);

  return v5;
}

- (BOOL)execute:(id)a3
{
  id v4 = a3;
  BOOL v5 = self;
  BOOL v6 = v5;
  if (v5->_useBatching && !v5->_batchStarted) {
    -[PQLConnection _batchStartIfNeeded:](v5, "_batchStartIfNeeded:", v5->_batchTransactionType);
  }

  BOOL v7 = -[PQLConnection _execute:mustSucceed:bindings:](v6, "_execute:mustSucceed:bindings:", v4, 0LL, &v11);
  id v8 = v6;
  uint64_t v9 = v8;
  if (v6->_useBatching && v8->_batchStarted && !v8->_skipBatchStop) {
    -[PQLConnection _batchStopIfNeeded](v8, "_batchStopIfNeeded");
  }

  return v7;
}

- (BOOL)execute:(id)a3 args:(char *)a4
{
  id v6 = a3;
  BOOL v7 = self;
  id v8 = v7;
  if (v7->_useBatching && !v7->_batchStarted) {
    -[PQLConnection _batchStartIfNeeded:](v7, "_batchStartIfNeeded:", v7->_batchTransactionType);
  }

  BOOL v9 = -[PQLConnection _execute:mustSucceed:bindings:](v8, "_execute:mustSucceed:bindings:", v6, 0LL, a4);
  int v10 = v8;
  uint64_t v11 = v10;
  if (v8->_useBatching && v10->_batchStarted && !v10->_skipBatchStop) {
    -[PQLConnection _batchStopIfNeeded](v10, "_batchStopIfNeeded");
  }

  return v9;
}

- (BOOL)executeRaw:(id)a3
{
  id v4 = a3;
  BOOL v5 = self;
  id v6 = v5;
  if (v5->_useBatching && !v5->_batchStarted) {
    -[PQLConnection _batchStartIfNeeded:](v5, "_batchStartIfNeeded:", v5->_batchTransactionType);
  }

  BOOL v7 = -[PQLConnection _execute:mustSucceed:bindings:](v6, "_execute:mustSucceed:bindings:", v4, 0LL, 0LL);
  id v8 = v6;
  BOOL v9 = v8;
  if (v6->_useBatching && v8->_batchStarted && !v8->_skipBatchStop) {
    -[PQLConnection _batchStopIfNeeded](v8, "_batchStopIfNeeded");
  }

  return v7;
}

- (id)fetch:(id)a3
{
  v9[0] = 0LL;
  id v4 = a3;
  -[PQLConnection assertOnQueue](self, "assertOnQueue");
  v9[1] = &v10;
  id v5 = -[PQLConnection _newStatementForFormat:preparationTime:arguments:]( self,  "_newStatementForFormat:preparationTime:arguments:",  v4,  v9,  &v10);

  id v6 = objc_alloc(&OBJC_CLASS___PQLResultSet);
  BOOL v7 = -[PQLResultSet initWithStatement:usingDatabase:preparationTime:]( v6,  "initWithStatement:usingDatabase:preparationTime:",  v5,  self,  v9[0]);

  return v7;
}

- (id)fetch:(id)a3 args:(char *)a4
{
  uint64_t v11 = 0LL;
  id v6 = a3;
  -[PQLConnection assertOnQueue](self, "assertOnQueue");
  id v7 = -[PQLConnection _newStatementForFormat:preparationTime:arguments:]( self,  "_newStatementForFormat:preparationTime:arguments:",  v6,  &v11,  a4);

  id v8 = objc_alloc(&OBJC_CLASS___PQLResultSet);
  BOOL v9 = -[PQLResultSet initWithStatement:usingDatabase:preparationTime:]( v8,  "initWithStatement:usingDatabase:preparationTime:",  v7,  self,  v11);

  return v9;
}

- (id)fetchObjectOfClass:(Class)a3 initializer:(SEL)a4 sql:(id)a5 args:(char *)a6
{
  id v10 = a5;
  -[PQLConnection assertOnQueue](self, "assertOnQueue");
  uint64_t v18 = 0LL;
  id v11 = -[PQLConnection _newStatementForFormat:preparationTime:arguments:]( self,  "_newStatementForFormat:preparationTime:arguments:",  v10,  &v18,  a6);

  int v12 = objc_alloc(&OBJC_CLASS___PQLResultSet);
  BOOL v13 = -[PQLResultSet initWithStatement:usingDatabase:preparationTime:]( v12,  "initWithStatement:usingDatabase:preparationTime:",  v11,  self,  v18);
  -[PQLResultSet onlyObjectOfClass:initializer:](v13, "onlyObjectOfClass:initializer:", a3, a4);
  id v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v14)
  {
    -[PQLResultSet error](v13, "error");
    int v15 = (NSError *)objc_claimAutoreleasedReturnValue();
    lastError = self->_lastError;
    self->_lastError = v15;
  }

  return v14;
}

- (id)fetchObjectOfClass:(Class)a3 initializer:(SEL)a4 sql:(id)a5
{
  return -[PQLConnection fetchObjectOfClass:initializer:sql:args:]( self,  "fetchObjectOfClass:initializer:sql:args:",  a3,  a4,  a5,  &v6);
}

- (id)fetchObjectOfClass:(Class)a3 sql:(id)a4 args:(char *)a5
{
  return -[PQLConnection fetchObjectOfClass:initializer:sql:args:]( self,  "fetchObjectOfClass:initializer:sql:args:",  a3,  0LL,  a4,  a5);
}

- (id)fetchObjectOfClass:(Class)a3 sql:(id)a4
{
  return -[PQLConnection fetchObjectOfClass:initializer:sql:args:]( self,  "fetchObjectOfClass:initializer:sql:args:",  a3,  0LL,  a4,  &v5);
}

- (id)fetchObject:(id)a3 sql:(id)a4 args:(char *)a5
{
  id v8 = a4;
  id v9 = a3;
  -[PQLConnection assertOnQueue](self, "assertOnQueue");
  uint64_t v17 = 0LL;
  id v10 = -[PQLConnection _newStatementForFormat:preparationTime:arguments:]( self,  "_newStatementForFormat:preparationTime:arguments:",  v8,  &v17,  a5);

  id v11 = objc_alloc(&OBJC_CLASS___PQLResultSet);
  int v12 = -[PQLResultSet initWithStatement:usingDatabase:preparationTime:]( v11,  "initWithStatement:usingDatabase:preparationTime:",  v10,  self,  v17);
  -[PQLResultSet onlyObject:](v12, "onlyObject:", v9);
  BOOL v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v13)
  {
    -[PQLResultSet error](v12, "error");
    id v14 = (NSError *)objc_claimAutoreleasedReturnValue();
    lastError = self->_lastError;
    self->_lastError = v14;
  }

  return v13;
}

- (id)fetchObject:(id)a3 sql:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  -[PQLConnection assertOnQueue](self, "assertOnQueue");
  v15[0] = 0LL;
  v15[1] = &v16;
  id v8 = -[PQLConnection _newStatementForFormat:preparationTime:arguments:]( self,  "_newStatementForFormat:preparationTime:arguments:",  v6,  v15,  &v16);

  id v9 = objc_alloc(&OBJC_CLASS___PQLResultSet);
  id v10 = -[PQLResultSet initWithStatement:usingDatabase:preparationTime:]( v9,  "initWithStatement:usingDatabase:preparationTime:",  v8,  self,  v15[0]);
  -[PQLResultSet onlyObject:](v10, "onlyObject:", v7);
  id v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v11)
  {
    -[PQLResultSet error](v10, "error");
    int v12 = (NSError *)objc_claimAutoreleasedReturnValue();
    lastError = self->_lastError;
    self->_lastError = v12;
  }

  return v11;
}

- (id)userVersion
{
  return  -[PQLConnection fetchObjectOfClass:sql:]( self,  "fetchObjectOfClass:sql:",  objc_opt_class(),  @"PRAGMA user_version");
}

- (BOOL)setUserVersion:(int64_t)a3
{
  id v4 = (void *)objc_msgSend(objc_alloc(NSString), "initWithFormat:", @"PRAGMA user_version = %ld", a3);
  ++self->_suspendCaching;
  BOOL v5 = -[PQLConnection executeRaw:](self, "executeRaw:", v4);
  --self->_suspendCaching;

  return v5;
}

- (int64_t)autovacuumableSpaceInBytes
{
  id v3 = -[PQLConnection fetchObjectOfClass:sql:]( self,  "fetchObjectOfClass:sql:",  objc_opt_class(),  @"pragma freelist_count");
  id v4 = -[PQLConnection fetchObjectOfClass:sql:]( self,  "fetchObjectOfClass:sql:",  objc_opt_class(),  @"pragma page_size");
  uint64_t v5 = [v3 integerValue];
  int64_t v6 = [v4 integerValue] * v5;

  return v6;
}

- (BOOL)incrementalVacuum:(int64_t)a3
{
  id v5 = -[PQLConnection fetchObjectOfClass:sql:]( self,  "fetchObjectOfClass:sql:",  objc_opt_class(),  @"pragma page_size");
  else {
    BOOL v6 = 0;
  }

  return v6;
}

- (NSString)label
{
  return self->_label;
}

- (void)setLabel:(id)a3
{
}

- (NSURL)url
{
  return self->_url;
}

- (id)lockedHandler
{
  return self->_lockedHandler;
}

- (void)setLockedHandler:(id)a3
{
}

- (id)busyHandler
{
  return self->_busyHandler;
}

- (void)setBusyHandler:(id)a3
{
}

- (id)autoRollbackHandler
{
  return self->_autoRollbackHandler;
}

- (id)sqliteErrorHandler
{
  return self->_sqliteErrorHandler;
}

- (void)setSqliteErrorHandler:(id)a3
{
}

- (id)preFlushHook
{
  return self->_preFlushHook;
}

- (void)setPreFlushHook:(id)a3
{
}

- (id)postFlushHook
{
  return self->_postFlushHook;
}

- (void)setPostFlushHook:(id)a3
{
}

- (id)profilingHook
{
  return self->_profilingHook;
}

- (void)setProfilingHook:(id)a3
{
}

- (id)profilingHookV2
{
  return self->_profilingHookV2;
}

- (void)setProfilingHookV2:(id)a3
{
}

- (id)willBeginBatchingHook
{
  return self->_willBeginBatchingHook;
}

- (void)setWillBeginBatchingHook:(id)a3
{
}

- (id)didFinishBatchingHook
{
  return self->_didFinishBatchingHook;
}

- (void)setDidFinishBatchingHook:(id)a3
{
}

- (sqlite3)dbHandle
{
  return self->_db;
}

- (OS_dispatch_queue)serialQueue
{
  return self->_serialQueue;
}

- (NSError)lastError
{
  return self->_lastError;
}

- (void)setLastError:(id)a3
{
}

- (BOOL)isTraced
{
  return self->_traced;
}

- (BOOL)crashIfUsedAfterClose
{
  return self->_crashIfUsedAfterClose;
}

- (void)setCrashIfUsedAfterClose:(BOOL)a3
{
  self->_crashIfUsedAfterClose = a3;
}

- (int)batchTransactionType
{
  return self->_batchTransactionType;
}

- (BOOL)shouldUseWALJournalMode
{
  return self->_shouldUseWALJournalMode;
}

- (void)setShouldUseWALJournalMode:(BOOL)a3
{
  self->_shouldUseWALJournalMode = a3;
}

- (void).cxx_destruct
{
}

- (id)_newStatementForBuilder:(id)a3 preparationTime:(unint64_t *)a4
{
  id v7 = a3;
  self->_changesOverride = 0LL;
  if (!self->_db)
  {
    if (!self->_crashIfUsedAfterClose)
    {
      [MEMORY[0x189607870] errorWithSqliteCode:21 andMessage:@"connection is closed"];
      BOOL v13 = (NSError *)objc_claimAutoreleasedReturnValue();
      lastError = self->_lastError;
      self->_lastError = v13;

      id v11 = 0LL;
      goto LABEL_11;
    }

    [MEMORY[0x1896077D8] currentHandler];
    id v8 = (void *)objc_claimAutoreleasedReturnValue();
    [v8 handleFailureInMethod:a2 object:self file:@"PQLConnection.m" lineNumber:1692 description:@"Connection has been used after close (or before open)"];
  }

  if (self->_useQueue) {
    dispatch_assert_queue_V2((dispatch_queue_t)self->_targetQueue);
  }
  if (self->_suspendCaching || !self->_serialQueue) {
    preparedStatements = 0LL;
  }
  else {
    preparedStatements = self->_preparedStatements;
  }
  -[PQLConnection _clearCleanupCacheQueueIfNeeded](self, "_clearCleanupCacheQueueIfNeeded");
  id v10 = self->_lastError;
  self->_lastError = 0LL;

  id v11 = -[PQLStatement initWithQueryBuilder:db:cache:preparationTime:]( objc_alloc(&OBJC_CLASS___PQLStatement),  "initWithQueryBuilder:db:cache:preparationTime:",  v7,  self,  preparedStatements,  a4);
LABEL_11:

  return v11;
}

- (BOOL)executeSwift:(id)a3 error:(id *)a4
{
  uint64_t v13 = 0LL;
  id v6 = -[PQLConnection _newStatementForBuilder:preparationTime:]( self,  "_newStatementForBuilder:preparationTime:",  a3,  &v13);
  if (!v6)
  {
    BOOL v9 = 0;
    if (!a4) {
      goto LABEL_14;
    }
    goto LABEL_12;
  }

  id v7 = self;
  id v8 = v7;
  if (v7->_useBatching && !v7->_batchStarted) {
    -[PQLConnection _batchStartIfNeeded:](v7, "_batchStartIfNeeded:", v7->_batchTransactionType);
  }

  BOOL v9 = -[PQLConnection _executeStmt:mustSucceed:preparationTime:]( v8,  "_executeStmt:mustSucceed:preparationTime:",  v6,  0LL,  v13);
  id v10 = v8;
  id v11 = v10;
  if (v8->_useBatching && v10->_batchStarted && !v10->_skipBatchStop) {
    -[PQLConnection _batchStopIfNeeded](v10, "_batchStopIfNeeded");
  }

  if (a4)
  {
LABEL_12:
    if (!v9) {
      *a4 = self->_lastError;
    }
  }

- (id)fetchSwift:(id)a3 error:(id *)a4
{
  uint64_t v12 = 0LL;
  id v6 = -[PQLConnection _newStatementForBuilder:preparationTime:]( self,  "_newStatementForBuilder:preparationTime:",  a3,  &v12);
  if (self->_useQueue) {
    dispatch_assert_queue_V2((dispatch_queue_t)self->_targetQueue);
  }
  id v7 = objc_alloc(&OBJC_CLASS___PQLResultSet);
  id v8 = -[PQLResultSet initWithStatement:usingDatabase:preparationTime:]( v7,  "initWithStatement:usingDatabase:preparationTime:",  v6,  self,  v12);
  lastError = self->_lastError;
  if (lastError)
  {
    id v10 = 0LL;
    if (a4) {
      *a4 = lastError;
    }
  }

  else
  {
    id v10 = v8;
  }

  return v10;
}

- (id)fetchObjectOfClassSwift:(Class)a3 query:(id)a4 error:(id *)a5
{
  id v8 = a4;
  if (self->_useQueue) {
    dispatch_assert_queue_V2((dispatch_queue_t)self->_targetQueue);
  }
  uint64_t v17 = 0LL;
  id v9 = -[PQLConnection _newStatementForBuilder:preparationTime:]( self,  "_newStatementForBuilder:preparationTime:",  v8,  &v17);
  id v10 = objc_alloc(&OBJC_CLASS___PQLResultSet);
  id v11 = -[PQLResultSet initWithStatement:usingDatabase:preparationTime:]( v10,  "initWithStatement:usingDatabase:preparationTime:",  v9,  self,  v17);
  -[PQLResultSet onlyObjectOfClass:initializer:](v11, "onlyObjectOfClass:initializer:", a3, 0LL);
  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v12)
  {
    -[PQLResultSet error](v11, "error");
    uint64_t v13 = (NSError *)objc_claimAutoreleasedReturnValue();
    lastError = self->_lastError;
    self->_lastError = v13;

    int v15 = self->_lastError;
    if (!v15) {
      -[PQLConnection(Swift) fetchObjectOfClassSwift:query:error:].cold.1();
    }
    if (a5) {
      *a5 = v15;
    }
  }

  return v12;
}

- (id)fetchObjectSwift:(id)a3 query:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  if (self->_useQueue) {
    dispatch_assert_queue_V2((dispatch_queue_t)self->_targetQueue);
  }
  uint64_t v18 = 0LL;
  id v10 = -[PQLConnection _newStatementForBuilder:preparationTime:]( self,  "_newStatementForBuilder:preparationTime:",  v9,  &v18);
  id v11 = objc_alloc(&OBJC_CLASS___PQLResultSet);
  uint64_t v12 = -[PQLResultSet initWithStatement:usingDatabase:preparationTime:]( v11,  "initWithStatement:usingDatabase:preparationTime:",  v10,  self,  v18);
  -[PQLResultSet onlyObject:](v12, "onlyObject:", v8);
  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v13)
  {
    -[PQLResultSet error](v12, "error");
    id v14 = (NSError *)objc_claimAutoreleasedReturnValue();
    lastError = self->_lastError;
    self->_lastError = v14;

    uint64_t v16 = self->_lastError;
    if (!v16) {
      -[PQLConnection(Swift) fetchObjectSwift:query:error:].cold.1();
    }
    if (a5) {
      *a5 = v16;
    }
  }

  return v13;
}

- (void)_batchStartIfNeeded:.cold.1()
{
}

- (void)_performWithFlags:action:whenFlushed:.cold.1()
{
  __assert_rtn( "-[PQLConnection _performWithFlags:action:whenFlushed:]",  "PQLConnection.m",  927,  "_flushNotifications == nil");
}

@end