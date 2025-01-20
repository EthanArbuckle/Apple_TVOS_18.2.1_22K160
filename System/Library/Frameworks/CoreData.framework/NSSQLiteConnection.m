@interface NSSQLiteConnection
+ (BOOL)_rekeyPersistentStoreAtURL:(void *)a3 options:(void *)a4 withKey:(uint64_t *)a5 error:;
+ (uint64_t)_destroyPersistentStoreAtURL:(void *)a3 options:(uint64_t *)a4 error:;
+ (uint64_t)_replacePersistentStoreAtURL:(void *)a3 destinationOptions:(void *)a4 withPersistentStoreFromURL:(void *)a5 sourceOptions:(uint64_t *)a6 error:;
+ (uint64_t)openAtPath:(uint64_t)a1 withKey:(const char *)a2 handle:(void *)a3 flags:(sqlite3 *)a4 module:(int)a5 checkpointOnClose:(char)a6;
+ (uint64_t)readMagicWordFromPath:(void *)a3 options:;
+ (void)initialize;
- (BOOL)_tableHasRows:(BOOL)result;
- (BOOL)addTombstoneColumnsForRange:(unint64_t)a3;
- (BOOL)addTransactionStringColumnsToTransactionTable;
- (BOOL)databaseIsEmpty;
- (BOOL)finishDeferredLightweightMigration:(uint64_t)a1;
- (BOOL)hasHistoryRows;
- (CFMutableArrayRef)copyRawIntegerRowsForSQL:(uint64_t)a1;
- (NSSQLitePrefetchRequestCache)prefetchRequestCache;
- (NSSQLiteStatementCache)statementCacheForEntity:(uint64_t)a1;
- (dispatch_queue_s)_clearCachedStatements;
- (dispatch_queue_s)_clearOtherStatements;
- (id)_setSaveRequest:(id *)result;
- (id)adapter;
- (id)createArrayOfPrimaryKeysAndEntityIDsForRowsWithoutRecordMetadataWithEntity:(id *)a3 metadataEntity:;
- (id)fetchCreationSQLForType:(void *)a3 containing:;
- (id)fetchTableCreationSQL;
- (id)fetchTableCreationSQLContaining:(id)result;
- (id)fetchTableNames;
- (id)initAsQueryGenerationTrackingConnectionForSQLCore:(id)a3;
- (id)initForSQLCore:(id)a3;
- (id)sqlStatement;
- (int)registerCurrentQueryGenerationWithStore:(id)a3;
- (sqlite3_int64)_fetchMaxPrimaryKeyForEntity:(uint64_t)a1;
- (sqlite3_int64)fetchMaxPrimaryKeyForEntity:(sqlite3_int64)result;
- (uint64_t)_adoptQueryGenerationWithSnapshot:(uint64_t)a1;
- (uint64_t)_batchInsertThrowWithErrorCode:(int)a1 andMessage:(void *)a2 forKey:(void *)a3 andValue:(uint64_t)a4 additionalDetail:(uint64_t)a5;
- (uint64_t)_clearBindVariablesForInsertedRow;
- (uint64_t)_clearSaveGeneratedCachedStatements;
- (uint64_t)_countOfVMCachedStatements;
- (uint64_t)_createIndexesForEntities:(void *)a1;
- (uint64_t)_dropAllDATriggers;
- (uint64_t)_dropAllTriggers;
- (uint64_t)_dropKnownHistoryTrackingTables;
- (uint64_t)_dropTableWithName:(uint64_t)a1;
- (uint64_t)_ensureWalFileExists;
- (uint64_t)_hasHistoryTransactionStringTable;
- (uint64_t)_hasOldHistoryTrackingTables;
- (uint64_t)_hasOldHistoryTrackingTablesV0;
- (uint64_t)_hasOldHistoryTrackingTablesV1;
- (uint64_t)_hasPersistentHistoryTables;
- (uint64_t)_hasTableWithName:(int)a3 isTemp:;
- (uint64_t)_insertTransactionForRequestContext:(void *)a3 andStrings:;
- (uint64_t)_insertTransactionStringsForRequestContext:(sqlite3_int64)a1;
- (uint64_t)_int64ResultForSQL:(uint64_t)a1;
- (uint64_t)_registerNewQueryGenerationSnapshot:(uint64_t)a1;
- (uint64_t)_restoreBusyTimeOutSettings;
- (uint64_t)_transactionsStringAndPKsForStrings:(sqlite3_int64)a1;
- (uint64_t)_validateProperty:(void *)a1 withValue:(uint64_t)a2;
- (uint64_t)_walCheckpoint;
- (uint64_t)adoptQueryGenerationWithIdentifier:(uint64_t)result;
- (uint64_t)canConnect;
- (uint64_t)createTablesForEntities:(uint64_t)result;
- (uint64_t)createTriggersForEntities:(uint64_t)result;
- (uint64_t)dedupeRowsForUniqueConstraintsInCloudKitMetadataEntity:(uint64_t)result;
- (uint64_t)deleteRow:(uint64_t)a3 forRequestContext:;
- (uint64_t)fetchBufferResultSet:(uint64_t)a3 usingFetchPlan:;
- (uint64_t)fetchResultSet:(uint64_t)a3 usingFetchPlan:;
- (uint64_t)freeQueryGenerationWithIdentifier:(uint64_t)a1;
- (uint64_t)gatherHistoryChangesFromTable:(uint64_t)a1;
- (uint64_t)gatherObjectIDsFromTable:(uint64_t)a1;
- (uint64_t)hasAttributeChanges:(void *)a1;
- (uint64_t)hasIndexTrackingTable;
- (uint64_t)hasTransactionStringColumnsInTransactionTable;
- (uint64_t)insertArray:(uint64_t)a3 forEntity:(char)a4 includeOnConflict:;
- (uint64_t)insertRow:(uint64_t)result;
- (uint64_t)logQueryPlanForStatement:(uint64_t)a1;
- (uint64_t)numberOfTombstones;
- (uint64_t)percentageUsedByPersistentHistory;
- (uint64_t)recreateIndices;
- (uint64_t)registerMigrationUpdateFunctionWithMigrator:(uint64_t)a1;
- (uint64_t)saveCachedModel:(uint64_t)result;
- (uint64_t)selectCountWithStatement:(uint64_t)result;
- (uint64_t)setUpIndexTracking;
- (uint64_t)updateConstrainedValuesForRow:(uint64_t)result;
- (unsigned)currentQueryGenerationIdentifier;
- (void)_clearTransactionCaches;
- (void)_createInsertStatementsForEntities:(void *)a1;
- (void)_currentQueryGenerationSnapshot:(uint64_t)a1;
- (void)_dropOldHistoryTrackingTables;
- (void)_endFetch;
- (void)_ensureDatabaseOpen;
- (void)_ensureNoFetchInProgress;
- (void)_ensureNoStatementPrepared;
- (void)_ensureNoTransactionOpen;
- (void)_executeSQLString:(uint64_t)a1;
- (void)_finalizeStatement;
- (void)_forceDisconnectOnError;
- (void)_performBlock:(uint64_t)a1;
- (void)_performPostSaveTasks:(int)a3 andForceFullVacuum:;
- (void)addVMCachedStatement:(uint64_t)a1;
- (void)beginReadTransaction;
- (void)beginTransaction;
- (void)bindTempTableForBindIntarray:(uint64_t)a1;
- (void)bindTempTablesForStatementIfNecessary:(void *)result;
- (void)cacheCurrentDBStatementOn:(uint64_t)a1;
- (void)cacheUpdateConstrainedValuesStatement:(void *)key forEntity:;
- (void)cacheUpdateStatement:(void *)key forEntity:(const void *)a4 andDeltasMask:;
- (void)clearTempTablesBindingsForStatement:(uint64_t)a1;
- (void)commitTransaction;
- (void)connect;
- (void)createIndexesForEntity:(void *)a1;
- (void)createManyToManyTablesForEntity:(void *)a1;
- (void)createMetadata;
- (void)createMissingHistoryTables;
- (void)createTableForEntity:(void *)a1;
- (void)currentStats;
- (void)dealloc;
- (void)derivedAttributeUpdatedInsertedRowInTable:(uint64_t)a3 withEntityID:(uint64_t)a4 primaryKey:(uint64_t)a5 columnName:(uint64_t)a6 newValue:;
- (void)derivedAttributeUpdatedRowInTable:(uint64_t)a3 withEntityID:(uint64_t)a4 primaryKey:(uint64_t)a5 columnName:(uint64_t)a6 newValue:;
- (void)didCreateSchema;
- (void)disconnect;
- (void)dropHistoryBeforeTransactionID:(id *)a1;
- (void)dropHistoryTrackingTables;
- (void)dropIndexTrackingTable;
- (void)endFetchAndRecycleStatement:(uint64_t)a1;
- (void)execute;
- (void)executeAttributeUniquenessCheckSQLStatement:(void *)a3 returningColumns:;
- (void)executeCorrelationChangesForValue1:(sqlite3_int64)a3 value2:(sqlite3_int64)a4 value3:(sqlite3_int64)a5 value4:;
- (void)executeMulticolumnUniquenessCheckSQLStatement:(void *)a3 returningColumns:;
- (void)fetchCachedModel;
- (void)fetchMetadata;
- (void)handleCorruptedDB:(uint64_t)a1;
- (void)harvestUsedIndexes;
- (void)hasAncillaryEntitiesInHistory;
- (void)hasHistoryTransactionWithNumber:(id *)a1;
- (void)insertChanges:(uint64_t)a3 type:(uint64_t)a4 transactionID:(uint64_t)a5 context:;
- (void)insertDictionaryBlock:(id *)a3 forEntity:(int)a4 includeOnConflict:;
- (void)insertManagedObjectBlock:(void *)a3 forEntity:(int)a4 includeOnConflict:;
- (void)insertUpdates:(uint64_t)a3 transactionID:(void *)a4 updatedAttributes:;
- (void)newFetchedArray;
- (void)performAndWait:(uint64_t)a1;
- (void)prepareAndExecuteSQLStatement:(uint64_t)a1;
- (void)prepareInsertStatementForAncillaryEntity:(uint64_t)a1;
- (void)prepareInsertStatementForEntity:(uint64_t)a1 includeConstraints:(void *)a2 includeOnConflict:(int)a3 onConflictKeys:(void *)a4;
- (void)prepareSQLStatement:(uint64_t)a1;
- (void)processDeleteRequest:(sqlite3_int64)a1;
- (void)processExternalDataReferenceFilesDeletedByRequest:(uint64_t)a1;
- (void)processInsertRequest:(uint64_t)a1;
- (void)processMigrationRequestForHash:(uint64_t)a3 stageLabel:;
- (void)processSaveRequest:(sqlite3_int64)a1;
- (void)processUpdateRequest:(void *)a3 withOIDs:(void *)a4 forAttributes:;
- (void)releaseSQLStatement;
- (void)reopenQueryGenerationWithIdentifier:(void *)a3 error:;
- (void)resetSQLStatement;
- (void)rollbackTransaction;
- (void)saveMetadata:(void *)a1;
- (void)scheduleWALCheckpointAfter:(double)a3 retry:;
- (void)selectRowsWithStatement:(int)a3 cached:;
- (void)setColumnsToFetch:(void *)result;
- (void)setExclusiveLockingMode:(BOOL)a3;
- (void)setSecureDeleteMode:(uint64_t)a1;
- (void)triggerUpdatedRowInTable:(uint64_t)a3 withEntityID:(uint64_t)a4 primaryKey:columnName:newValue:;
- (void)updateRow:(uint64_t)a3 forRequestContext:;
- (void)writeCorrelationChangesFromTracker:(uint64_t)a1;
- (void)writeCorrelationDeletesFromTracker:(uint64_t)a1;
- (void)writeCorrelationInsertsFromTracker:(uint64_t)a1;
- (void)writeCorrelationMasterReordersFromTracker:(uint64_t)a1;
- (void)writeCorrelationReordersFromTracker:(uint64_t)a1;
@end

@implementation NSSQLiteConnection

- (void)performAndWait:(uint64_t)a1
{
  if (a1)
  {
    uint64_t v8 = 0LL;
    v9 = &v8;
    uint64_t v10 = 0x3052000000LL;
    v11 = __Block_byref_object_copy__28;
    v12 = __Block_byref_object_dispose__28;
    uint64_t v13 = 0LL;
    v3 = *(dispatch_queue_s **)(a1 + 8);
    if (v3)
    {
      v7[0] = MEMORY[0x1895F87A8];
      v7[1] = 3221225472LL;
      v7[2] = __37__NSSQLiteConnection_performAndWait___block_invoke;
      v7[3] = &unk_189EA77F8;
      v7[4] = a2;
      v7[5] = &v8;
      dispatch_sync(v3, v7);
    }

    else
    {
      v4 = (void *)MEMORY[0x186E3E5D8]();
      (*(void (**)(uint64_t))(a2 + 16))(a2);
      objc_autoreleasePoolPop(v4);
    }

    v5 = (void *)v9[5];
    if (v5)
    {
      id v6 = v5;
      objc_exception_throw((id)v9[5]);
      __break(1u);
    }

    else
    {
      _Block_object_dispose(&v8, 8);
    }
  }

void __37__NSSQLiteConnection_performAndWait___block_invoke(uint64_t a1)
{
  v2 = (void *)MEMORY[0x186E3E5D8]();
  (*(void (**)(void))(*(void *)(a1 + 32) + 16LL))();
  objc_autoreleasePoolPop(v2);
}

- (void)connect
{
  v198[1] = *MEMORY[0x1895F89C0];
  if (a1)
  {
    v2 = *(dispatch_queue_s **)(a1 + 8);
    if (v2) {
      dispatch_assert_queue_V2(v2);
    }
    if (!*(void *)(a1 + 24))
    {
      *(void *)(a1 + 24) = (id)[*(id *)(a1 + 16) URL];
    }

    id v3 = *(id *)(a1 + 32);
    if (!v3)
    {
      id v3 = (id)[*(id *)(a1 + 24) path];
      *(void *)(a1 + 32) = v3;
    }

    v170 = (sqlite3 **)(a1 + 72);
    if (!*(void *)(a1 + 72) && (*(_BYTE *)(a1 + 312) & 0x80) == 0)
    {
      v169 = *(void **)(a1 + 368);
      v4 = (const char *)[v3 fileSystemRepresentation];
      v5 = v4;
      uint64_t v6 = *(void *)(a1 + 16);
      if (!v6 || (*(_BYTE *)(v6 + 201) & 0x40) == 0) {
        goto LABEL_12;
      }
      if (!strcmp(v4, "/dev/null"))
      {
        int v7 = 1;
        v5 = ":memory:";
      }

      else
      {
        uint64_t v8 = (void *)[*(id *)(a1 + 32) stringByReplacingOccurrencesOfString:@"/dev/null/" withString:&stru_189EAC2E8];
        if (!v8 || (uint64_t v9 = (uint64_t)v8, ![v8 length]))
        {
LABEL_12:
          int v7 = 0;
          goto LABEL_18;
        }

        uint64_t v167 = v9;
        v5 = (const char *)[(id)objc_msgSend( NSString stringWithFormat:@"file:%@?mode=memory&cache=shared"), "fileSystemRepresentation"];
        int v7 = 1;
      }

- (void)selectRowsWithStatement:(int)a3 cached:
{
  if (result)
  {
    v5 = result;
    -[NSSQLiteConnection bindTempTablesForStatementIfNecessary:](result, a2);
    -[NSSQLiteConnection prepareSQLStatement:]((uint64_t)v5, a2);
    if (a3 && (!a2 || !a2[8])) {
      -[NSSQLiteConnection cacheCurrentDBStatementOn:]((uint64_t)v5, (sqlite3_stmt *)a2);
    }
    return (void *)[v5 execute];
  }

  return result;
}

- (void)bindTempTablesForStatementIfNecessary:(void *)result
{
  uint64_t v14 = *MEMORY[0x1895F89C0];
  if (result)
  {
    uint64_t v3 = (uint64_t)result;
    v4 = (dispatch_queue_s *)result[1];
    if (v4) {
      dispatch_assert_queue_V2(v4);
    }
    result = (void *)[a2 bindIntarrays];
    if (result)
    {
      v5 = result;
      __int128 v11 = 0u;
      __int128 v12 = 0u;
      __int128 v9 = 0u;
      __int128 v10 = 0u;
      result = (void *)[result countByEnumeratingWithState:&v9 objects:v13 count:16];
      if (result)
      {
        uint64_t v6 = result;
        uint64_t v7 = *(void *)v10;
        do
        {
          uint64_t v8 = 0LL;
          do
          {
            if (*(void *)v10 != v7) {
              objc_enumerationMutation(v5);
            }
            -[NSSQLiteConnection bindTempTableForBindIntarray:](v3, *(void **)(*((void *)&v9 + 1) + 8LL * (void)v8));
            uint64_t v8 = (void *)((char *)v8 + 1);
          }

          while (v6 != v8);
          result = (void *)[v5 countByEnumeratingWithState:&v9 objects:v13 count:16];
          uint64_t v6 = result;
        }

        while (result);
      }
    }
  }

  return result;
}

- (void)prepareSQLStatement:(uint64_t)a1
{
  v76[1] = *MEMORY[0x1895F89C0];
  if (!a1) {
    return;
  }
  uint64_t v4 = a1;
  v5 = *(dispatch_queue_s **)(a1 + 8);
  if (v5) {
    dispatch_assert_queue_V2(v5);
  }
  uint64_t v6 = *(void **)(v4 + 48);
  if (v6)
  {
    if ([v6 description]) {
      uint64_t v19 = [*(id *)(v4 + 48) description];
    }
    else {
      uint64_t v19 = [MEMORY[0x189603FE8] null];
    }
    uint64_t v4 = v19;
    _NSCoreDataLog( 1LL,  (uint64_t)@"SQL statement is still active / leaked.  sql:'%@'",  v20,  v21,  v22,  v23,  v24,  v25,  v19);
    a2 = (void *)MEMORY[0x189603F70];
    uint64_t v26 = *MEMORY[0x189603A58];
    v75 = @"Statement";
    v76[0] = v4;
    objc_exception_throw((id)objc_msgSend( MEMORY[0x189603F70],  "exceptionWithName:reason:userInfo:",  v26,  @"statement is still active",  objc_msgSend(MEMORY[0x189603F68], "dictionaryWithObjects:forKeys:count:", v76, &v75, 1)));
LABEL_18:
    dispatch_queue_s *v2 = 0LL;
    goto LABEL_19;
  }

  *(void *)(v4 + 48) = a2;
  unsigned int v73 = 0;
  -[NSSQLiteConnection _ensureDatabaseOpen]((void *)v4);
  -[NSSQLiteConnection _ensureNoFetchInProgress](v4);
  v2 = (sqlite3_stmt **)(v4 + 80);
  uint64_t v7 = *(void *)(v4 + 80);
  *(_DWORD *)(v4 + 88) = 0;
  if (v7) {
    return;
  }
  if (+[NSSQLCore debugDefault](&OBJC_CLASS___NSSQLCore, "debugDefault") >= 1)
  {
    int v8 = *(unsigned __int8 *)(v4 + 42);
    uint64_t v9 = [a2 sqlString];
    if (v8) {
      uint64_t v16 = @"\x1B[32msql: \x1B[34m\x1B[47m%@\x1B[0m";
    }
    else {
      uint64_t v16 = @"%@";
    }
    _NSCoreDataLog(6LL, (uint64_t)v16, v10, v11, v12, v13, v14, v15, v9);
  }

  if (!a2) {
    goto LABEL_18;
  }
  int v17 = (sqlite3_stmt *)a2[8];
  dispatch_queue_s *v2 = v17;
  if (!v17)
  {
LABEL_19:
    uint64_t v27 = (const char *)objc_msgSend((id)objc_msgSend(a2, "sqlString"), "UTF8String");
    int v28 = 0;
    unsigned int v71 = 0;
    unsigned int v29 = 0;
    double v30 = 0.0;
    while (1)
    {
      int v31 = 3 * v29 - 29999;
      while (2)
      {
        uint64_t v32 = sqlite3_prepare_v3(*(sqlite3 **)(v4 + 72), v27, -1, 1u, v2, (const char **)&pzTail);
        uint64_t v33 = v32;
        switch((char)v32)
        {
          case 0:
            unsigned int v18 = *(_DWORD *)(v4 + 312) | 1;
            goto LABEL_47;
          case 1:
          case 7:
          case 10:
          case 17:
          case 21:
            goto LABEL_49;
          case 5:
            if (v29 < 0x2711) {
              goto LABEL_41;
            }
            if (v29 - 10000 >= 0xB) {
              useconds_t v34 = v29 - 8899;
            }
            else {
              useconds_t v34 = v31;
            }
            goto LABEL_40;
          case 6:
            goto LABEL_37;
          case 11:
          case 26:
            goto LABEL_54;
          case 14:
            if (v28 > 2)
            {
LABEL_49:
              int v36 = v32;
              uint64_t v37 = [NSString stringWithUTF8String:sqlite3_errmsg(*(sqlite3 **)(v4 + 72))];
              if (v36 == 10 && (sqlite3_file_control(*(sqlite3 **)(v4 + 72), 0LL, 4, &v73), v73)) {
                uint64_t v38 = [NSString stringWithFormat:@"I/O error for database at %@.  SQLite error code:%d, '%@' errno:%d", *(void *)(v4 + 32), v33, v37, v73];
              }
              else {
                uint64_t v38 = [NSString stringWithFormat:@"I/O error for database at %@.  SQLite error code:%d, '%@'", *(void *)(v4 + 32), v33, v37, v70];
              }
              v39 = (void *)v38;
              if (v38)
              {
                -[NSSQLiteConnection _forceDisconnectOnError](v4);
                v72 = 0LL;
                uint64_t v40 = 256LL;
              }

              else
              {
LABEL_54:
                v39 = (void *)[NSString stringWithFormat:@"Fatal error.  The database at %@ is corrupted.  SQLite error code:%d, '%s'", *(void *)(v4 + 32), v33, sqlite3_errmsg(*(sqlite3 **)(v4 + 72))];
                uint64_t v40 = (int)v33;
                v72 = @"NSSQLiteErrorDomain";
                -[NSSQLiteConnection _forceDisconnectOnError](v4);
                if (!v39)
                {
LABEL_59:
                  uint64_t v47 = sqlite3_errmsg(*(sqlite3 **)(v4 + 72));
                  v39 = 0LL;
                  int v48 = 1;
LABEL_60:
                  if (*(_BYTE *)(v4 + 42)) {
                    uint64_t v49 = @"\x1B[31m\x1B[47mERROR:\x1B[0m\x1B[31m (%d) %s\x1B[0m";
                  }
                  else {
                    uint64_t v49 = @"(%d) %s";
                  }
                  _NSCoreDataLog(1LL, (uint64_t)v49, v41, v42, v43, v44, v45, v46, v33);
                  if (v48)
                  {
                    v39 = (void *)objc_msgSend( NSString,  "stringWithFormat:",  @"error during prepareSQL for SQL string '%s' : %s",  v27,  v47);
                    uint64_t v40 = 256LL;
                  }

                  *(_DWORD *)(v4 + 312) &= ~2u;
                  -[NSSQLiteConnection releaseSQLStatement](v4);
                  uint64_t v50 = *MEMORY[0x189603A58];
                  uint64_t v51 = (void *)MEMORY[0x189603F68];
                  uint64_t v52 = *(void *)(v4 + 32);
                  uint64_t v53 = *MEMORY[0x1896074F8];
                  uint64_t v54 = [MEMORY[0x189607968] numberWithInt:v33];
                  if (v73) {
                    uint64_t v55 = objc_msgSend(MEMORY[0x189607968], "numberWithInteger:");
                  }
                  else {
                    uint64_t v55 = 0LL;
                  }
                  id v56 = +[_NSCoreDataException exceptionWithName:code:reason:userInfo:]( (uint64_t)_NSCoreDataException,  v50,  v40,  (uint64_t)v39,  (void *)objc_msgSend( v51,  "dictionaryWithObjectsAndKeys:",  v52,  v53,  v54,  @"NSSQLiteErrorDomain",  v55,  *MEMORY[0x189607688],  0));
                  v57 = v56;
                  if (v72) {
                    -[_NSCoreDataException _setDomain:]((uint64_t)v56, v72);
                  }
                  objc_exception_throw(v57);
                }
              }

              uint64_t v47 = (const char *)[v39 UTF8String];
              int v48 = 0;
              goto LABEL_60;
            }

            ++v28;
LABEL_37:
            if (v29 <= 0xA) {
              useconds_t v34 = 3 * v29 + 1;
            }
            else {
              useconds_t v34 = v29 + 1101;
            }
LABEL_40:
            usleep(v34);
LABEL_41:
            if (v30 == 0.0 || (double Current = CFAbsoluteTimeGetCurrent(), Current <= v30))
            {
              v31 += 3;
              ++v29;
              continue;
            }

            if (v71 > 7)
            {
              uint64_t v58 = [NSString stringWithFormat:@"The database operation timed out after %.2f seconds.", Current - v30 + *(double *)(v4 + 232)];
              if (+[NSSQLCore debugDefault](&OBJC_CLASS___NSSQLCore, "debugDefault") >= 1)
              {
                if (*(_BYTE *)(v4 + 42)) {
                  uint64_t v65 = @"\x1B[31m\x1B[47mERROR:\x1B[0m\x1B[31m (%d) %@\x1B[0m";
                }
                else {
                  uint64_t v65 = @"(%d) %@";
                }
                uint64_t v69 = v58;
                _NSCoreDataLog(1LL, (uint64_t)v65, v59, v60, v61, v62, v63, v64, v33);
              }

              uint64_t v66 = [NSString stringWithFormat:@"error during SQL execution : %@", v58, v69];
              *(_DWORD *)(v4 + 312) &= ~2u;
              -[NSSQLiteConnection releaseSQLStatement](v4);
              id v67 = +[_NSCoreDataException exceptionWithName:code:reason:userInfo:]( (uint64_t)_NSCoreDataException,  *MEMORY[0x189603A58],  134090,  v66,  (void *)objc_msgSend( MEMORY[0x189603F68],  "dictionaryWithObject:forKey:",  objc_msgSend(MEMORY[0x189607968], "numberWithInt:", v33),  @"NSSQLiteErrorDomain"));
              objc_exception_throw(v67);
              -[NSSQLiteConnection _ensureDatabaseOpen](v68);
              return;
            }

            ++v29;
            double v30 = Current + *(double *)(v4 + 240);
            ++v71;
            break;
          default:
            v72 = 0LL;
            uint64_t v40 = 0LL;
            goto LABEL_59;
        }

        break;
      }
    }
  }

  unsigned int v18 = *(_DWORD *)(v4 + 312) & 0xFFFFFFFE;
LABEL_47:
  *(_DWORD *)(v4 + 312) = v18;
}

- (void)_ensureDatabaseOpen
{
  v2 = (dispatch_queue_s *)a1[1];
  if (v2) {
    dispatch_assert_queue_V2(v2);
  }
  if (!a1[9])
  {
    id v3 = +[_NSCoreDataException exceptionWithName:code:reason:userInfo:]( (uint64_t)_NSCoreDataException,  *MEMORY[0x189603A58],  134060,  (uint64_t)@"Attempted to perform an operation without an open database",  (void *)objc_msgSend(MEMORY[0x189603F68], "dictionaryWithObjectsAndKeys:", a1[4], *MEMORY[0x1896074F8], 0));
    objc_exception_throw(v3);
    -[NSSQLiteConnection _ensureNoFetchInProgress]();
  }

- (void)_ensureNoFetchInProgress
{
  v2 = *(dispatch_queue_s **)(a1 + 8);
  if (v2) {
    dispatch_assert_queue_V2(v2);
  }
  if ((*(_BYTE *)(a1 + 312) & 2) != 0)
  {
    objc_exception_throw((id)[MEMORY[0x189603F70] exceptionWithName:*MEMORY[0x189603A58] reason:@"Attempted to perform another operation with a fetch already in progress" userInfo:0]);
    -[NSSQLiteStatement sqlString](v3, v4);
  }

- (void)execute
{
  v2 = self;
  queue = (dispatch_queue_s *)self->_queue;
  if (queue) {
    dispatch_assert_queue_V2(queue);
  }
  __sqliteConnectionFlags sqliteConnectionFlags = v2->_sqliteConnectionFlags;
  if ((*(_BYTE *)&sqliteConnectionFlags & 1) == 0)
  {
    uint64_t v5 = sqlite3_reset(v2->_vmstatement);
    sqlite3_clear_bindings(v2->_vmstatement);
    __sqliteConnectionFlags sqliteConnectionFlags = v2->_sqliteConnectionFlags;
    if ((_DWORD)v5) {
      goto LABEL_101;
    }
  }

  v2->___sqliteConnectionFlags sqliteConnectionFlags = (__sqliteConnectionFlags)(*(_DWORD *)&sqliteConnectionFlags & 0xFFFFFFFE);
  uint64_t v6 = (void *)objc_msgSend(-[NSSQLiteConnection sqlStatement](v2, "sqlStatement"), "bindVariables");
  uint64_t v7 = [v6 count];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = 0LL;
    __int128 v106 = v6;
    while (1)
    {
      uint64_t v10 = (void *)[v6 objectAtIndex:v9];
      unsigned int v11 = [v10 sqlType];
      if ([v10 hasObjectValue])
      {
        uint64_t v12 = (void *)[v10 value];
        uint64_t v13 = v12;
        else {
          int v14 = 0;
        }
        uint64_t v15 = 0LL;
      }

      else
      {
        uint64_t v15 = [v10 int64];
        int v14 = 0;
        uint64_t v13 = 0LL;
      }

      if (+[NSSQLCore debugDefault](&OBJC_CLASS___NSSQLCore, "debugDefault") < 2) {
        goto LABEL_26;
      }
      if (!v13)
      {
        if (v15)
        {
          uint64_t v105 = (void *)v15;
          _NSCoreDataLog(7LL, (uint64_t)@"SQLite bind[%ld] = (int64)%qd", v16, v17, v18, v19, v20, v21, v9);
LABEL_27:
          if (v11 - 2 >= 2)
          {
            if (v11 != 1)
            {
LABEL_99:
              v2 = (NSSQLiteConnection *)MEMORY[0x189603F70];
              uint64_t v5 = *MEMORY[0x189603A58];
              uint64_t v95 = objc_msgSend( NSString,  "stringWithFormat:",  @"binding not implemented for this SQLType %d",  v11,  v105);
              v96 = v2;
              uint64_t v97 = v5;
              uint64_t v98 = 0LL;
              goto LABEL_100;
            }

            vmstatement = v2->_vmstatement;
            int v41 = v9 + 1;
            int v42 = v15;
LABEL_32:
            uint64_t v39 = sqlite3_bind_int(vmstatement, v41, v42);
            goto LABEL_46;
          }

          int v36 = v2->_vmstatement;
          int v37 = v9 + 1;
          sqlite3_int64 v38 = v15;
        }

        else
        {
          _NSCoreDataLog(7LL, (uint64_t)@"SQLite bind[%ld] = nil", v16, v17, v18, v19, v20, v21, v9);
LABEL_43:
          int v36 = v2->_vmstatement;
          int v37 = v9 + 1;
          if (v11 != 3)
          {
            uint64_t v39 = sqlite3_bind_null(v36, v37);
            goto LABEL_46;
          }

          sqlite3_int64 v38 = 0LL;
        }

- (id)sqlStatement
{
  queue = (dispatch_queue_s *)self->_queue;
  if (queue) {
    dispatch_assert_queue_V2(queue);
  }
  return self->_sqlStatement;
}

- (void)setColumnsToFetch:(void *)result
{
  if (result)
  {
    id v3 = result;
    SEL v4 = (void *)result[7];
    if (v4 != a2)
    {

      result = a2;
      v3[7] = result;
    }
  }

  return result;
}

- (uint64_t)fetchResultSet:(uint64_t)a3 usingFetchPlan:
{
  uint64_t v124 = *MEMORY[0x1895F89C0];
  if (!result) {
    return result;
  }
  uint64_t v4 = result;
  uint64_t v5 = *(dispatch_queue_s **)(result + 8);
  if (v5) {
    dispatch_assert_queue_V2(v5);
  }
  int v6 = *(_DWORD *)(a3 + 16);
  if (!v6) {
    int v6 = 0x7FFFFFFF;
  }
  int v115 = v6;
  uint64_t v7 = *(void *)(a3 + 48);
  if (v7) {
    int v111 = *(_BYTE *)(v7 + 43) & 1;
  }
  else {
LABEL_133:
  }
    int v111 = 0;
  int v8 = *(_DWORD *)(a3 + 72);
  uint64_t v117 = [*(id *)(a3 + 40) model];
  if (v115 < 1)
  {
    result = 0LL;
    goto LABEL_127;
  }

  uint64_t v9 = 0LL;
  int v10 = 0;
  int v114 = v8 & 0x18;
  char v113 = v8;
  while ((*(_BYTE *)(v4 + 312) & 2) != 0)
  {
    fetchResultSetPrepareNextRow((int *)a2);
    uint64_t v11 = *(unsigned int *)(a2 + 24);
    if ((v11 & 0x80000000) != 0)
    {
      uint64_t v12 = 0LL;
      if ((v8 & 1) == 0)
      {
LABEL_13:
        uint64_t v13 = *(void *)(a3 + 40);
        if (v13) {
          unsigned int v14 = *(_DWORD *)(v13 + 184);
        }
        else {
          unsigned int v14 = 0;
        }
        goto LABEL_20;
      }
    }

    else
    {
      uint64_t v12 = *(void *)(*(void *)(a2 + 64) + 8 * v11) + *(void *)(a2 + 32);
      if ((v8 & 1) == 0) {
        goto LABEL_13;
      }
    }

    unsigned int v15 = sqlite3_column_int(*(sqlite3_stmt **)(v4 + 80), 0);
    if (!v15)
    {
      v107 = @"The database appears corrupt.  (invalid entity key)";
LABEL_132:
      -[NSSQLiteConnection handleCorruptedDB:](v4, (uint64_t)v107);
      goto LABEL_133;
    }

    unsigned int v14 = v15;
    if (v15 == *(_DWORD *)(v4 + 92))
    {
      uint64_t v13 = *(void *)(v4 + 104);
    }

    else
    {
      uint64_t v13 = (*(uint64_t (**)(uint64_t, char *, void))(a3 + 64))(v117, sel_entityForID_, v15);
      *(void *)(v4 + 104) = v13;
      *(_DWORD *)(v4 + 92) = v14;
    }

- (void)endFetchAndRecycleStatement:(uint64_t)a1
{
  uint64_t v33 = *MEMORY[0x1895F89C0];
  if (a1)
  {
    id v3 = *(dispatch_queue_s **)(a1 + 8);
    if (v3) {
      dispatch_assert_queue_V2(v3);
    }
    context = (void *)MEMORY[0x186E3E5D8]();
    if (*(void *)(a1 + 80))
    {
      uint64_t v4 = *(void *)(a1 + 16);
      if (v4)
      {
        if ((*(_BYTE *)(v4 + 202) & 1) != 0)
        {
          uint64_t v5 = (void *)[(id)a1 sqlStatement];
          int v6 = *(dispatch_queue_s **)(a1 + 8);
          if (v6) {
            dispatch_assert_queue_V2(v6);
          }
          id v7 = objc_alloc_init(MEMORY[0x189603FA8]);
          int v8 = (void *)MEMORY[0x186E3E5D8]();
          [(id)objc_msgSend( NSString stringWithFormat:@"EXPLAIN QUERY PLAN %@", objc_msgSend(v5, "sqlString")), "UTF8String"];
          uint64_t v27 = MEMORY[0x1895F87A8];
          uint64_t v28 = 3221225472LL;
          uint64_t v29 = __45__NSSQLiteConnection_indexesUsedByStatement___block_invoke;
          uint64_t v30 = &unk_189EAA330;
          id v31 = v7;
          sqlite3_exec_b();
          objc_autoreleasePoolPop(v8);
          id v9 = v7;
          int v10 = sqlite3_stmt_status(*(sqlite3_stmt **)(a1 + 80), 4, 1);
          uint64_t v11 = *(int *)(a1 + 88);
          __int128 v23 = 0u;
          __int128 v24 = 0u;
          __int128 v25 = 0u;
          __int128 v26 = 0u;
          uint64_t v12 = [v9 countByEnumeratingWithState:&v23 objects:v32 count:16];
          if (v12)
          {
            uint64_t v13 = v12;
            uint64_t v14 = v10;
            uint64_t v15 = *(void *)v24;
            do
            {
              uint64_t v16 = 0LL;
              do
              {
                if (*(void *)v24 != v15) {
                  objc_enumerationMutation(v9);
                }
                uint64_t v17 = *(void *)(*((void *)&v23 + 1) + 8 * v16);
                uint64_t v18 = (void *)MEMORY[0x186E3E5D8]();
                unint64_t v19 = (NSSQLiteIndexStatistics *)[*(id *)(a1 + 344) objectForKeyedSubscript:v17];
                if (v19
                  || (unint64_t v19 = -[NSSQLiteIndexStatistics initWithName:storeID:]( [NSSQLiteIndexStatistics alloc],  "initWithName:storeID:",  v17,  [*(id *)(a1 + 16) identifier]),  objc_msgSend(*(id *)(a1 + 344), "setObject:forKeyedSubscript:", v19, v17),  v19,  v19))
                {
                  int64_t v20 = v19->_instructionCount + v14;
                  ++v19->_executionCount;
                  v19->_instructionCount = v20;
                  v19->_rowCount += v11;
                }

                objc_autoreleasePoolPop(v18);
                ++v16;
              }

              while (v13 != v16);
              uint64_t v13 = [v9 countByEnumeratingWithState:&v23 objects:v32 count:16];
            }

            while (v13);
          }
        }
      }
    }

    if ((*(_BYTE *)(a1 + 312) & 2) != 0)
    {
      -[NSSQLiteConnection setColumnsToFetch:]((void *)a1, 0LL);
      *(_DWORD *)(a1 + 312) &= ~2u;
      *(void *)(a1 + 100) = 0LL;
      *(void *)(a1 + 92) = 0LL;
      *(_DWORD *)(a1 + 108) = 0;
    }

    if (a2) {
      -[NSSQLiteConnection resetSQLStatement](a1);
    }
    else {
      -[NSSQLiteConnection releaseSQLStatement](a1);
    }
    objc_autoreleasePoolPop(context);
  }

- (void)releaseSQLStatement
{
  if (a1)
  {
    v2 = *(dispatch_queue_s **)(a1 + 8);
    if (v2) {
      dispatch_assert_queue_V2(v2);
    }
    -[NSSQLiteConnection _finalizeStatement](a1);
    -[NSSQLiteStatement clearCaches:](*(void **)(a1 + 48), 0);

    *(void *)(a1 + 48) = 0LL;
  }

- (void)_finalizeStatement
{
  v2 = *(dispatch_queue_s **)(a1 + 8);
  if (v2) {
    dispatch_assert_queue_V2(v2);
  }
  id v3 = *(sqlite3_stmt **)(a1 + 80);
  if (v3)
  {
    uint64_t v4 = *(sqlite3_stmt **)(a1 + 48);
    if (v4) {
      uint64_t v4 = (sqlite3_stmt *)*((void *)v4 + 8);
    }
    if (v4 == v3)
    {
      sqlite3_reset(v3);
      sqlite3_clear_bindings(*(sqlite3_stmt **)(a1 + 80));
    }

    else
    {
      sqlite3_finalize(v3);
    }

    *(void *)(a1 + 80) = 0LL;
  }

  -[NSSQLiteConnection clearTempTablesBindingsForStatement:](a1, *(void **)(a1 + 48));
  -[NSSQLiteStatement clearCaches:](*(void **)(a1 + 48), 0);
}

- (void)bindTempTableForBindIntarray:(uint64_t)a1
{
  uint64_t v53 = *MEMORY[0x1895F89C0];
  if (a1)
  {
    uint64_t v4 = *(dispatch_queue_s **)(a1 + 8);
    if (v4) {
      dispatch_assert_queue_V2(v4);
    }
    int v5 = [a2 index];
    uint64_t v51 = 0LL;
    if (v5 >= (int)[*(id *)(a1 + 304) count])
    {
      int v8 = (void *)[a2 tableName];
      [v8 UTF8String];
      uint64_t v9 = sqlite3_intarray_create();
      if ((_DWORD)v9)
      {
        uint64_t v43 = objc_msgSend( NSString,  "stringWithFormat:",  @"CoreData: SQLite: error: Failed to create intarray. SQLite error code: %d",  v9);
        size_t v44 = (void *)objc_msgSend( MEMORY[0x189603F68],  "dictionaryWithObject:forKey:",  objc_msgSend(MEMORY[0x189607968], "numberWithInt:", v9),  @"NSSQLiteErrorDomain");
        id v45 = +[_NSCoreDataException exceptionWithName:code:reason:userInfo:]( (uint64_t)&OBJC_CLASS____NSCoreDataException,  *MEMORY[0x189603A58],  134180LL,  v43,  v44);
        objc_exception_throw(v45);
        goto LABEL_33;
      }

      if (+[NSSQLCore debugDefault](&OBJC_CLASS___NSSQLCore, "debugDefault") >= 1) {
        _NSCoreDataLog(4LL, (uint64_t)@"Bound intarray %@", v10, v11, v12, v13, v14, v15, (uint64_t)v8);
      }
      uint64_t v16 = objc_alloc_init(&OBJC_CLASS___NSSQLiteIntarrayTable);
      uint64_t v18 = v16;
      if (v16)
      {
        objc_setProperty_nonatomic(v16, v17, v8, 16LL);
        v18->_intarrayTable = v51;
      }

      [*(id *)(a1 + 304) addObject:v18];
    }

    else
    {
      uint64_t v6 = [*(id *)(a1 + 304) objectAtIndex:v5];
      if (v6) {
        id v7 = *(sqlite3_intarray **)(v6 + 8);
      }
      else {
        id v7 = 0LL;
      }
      uint64_t v51 = v7;
    }

    unint64_t v19 = (void *)[a2 value];
    int64_t v20 = sqlite3_malloc(8 * [v19 count]);
    __int128 v49 = 0u;
    __int128 v50 = 0u;
    __int128 v47 = 0u;
    __int128 v48 = 0u;
    uint64_t v21 = [v19 countByEnumeratingWithState:&v47 objects:v52 count:16];
    if (v21)
    {
      int v22 = 0;
      uint64_t v23 = *(void *)v48;
      do
      {
        for (uint64_t i = 0LL; i != v21; ++i)
        {
          if (*(void *)v48 != v23) {
            objc_enumerationMutation(v19);
          }
          __int128 v25 = *(void **)(*((void *)&v47 + 1) + 8 * i);
          else {
            uint64_t v26 = [v25 _referenceData64];
          }
          v20[(v22 + i)] = v26;
          if (+[NSSQLCore debugDefault](&OBJC_CLASS___NSSQLCore, "debugDefault") >= 3) {
            _NSCoreDataLog( 7LL,  (uint64_t)@"Bound intarray value %lu at %d",  v27,  v28,  v29,  v30,  v31,  v32,  v20[(v22 + i)]);
          }
        }

        uint64_t v21 = [v19 countByEnumeratingWithState:&v47 objects:v52 count:16];
        v22 += i;
      }

      while (v21);
    }

    uint64_t v33 = sqlite3_intarray_bind();
    if (!(_DWORD)v33)
    {
      if (+[NSSQLCore debugDefault](&OBJC_CLASS___NSSQLCore, "debugDefault") >= 1) {
        _NSCoreDataLog(4LL, (uint64_t)@"Bound intarray values.", v34, v35, v36, v37, v38, v39, v46);
      }
      return;
    }

    uint64_t v40 = objc_msgSend( NSString,  "stringWithFormat:",  @"CoreData: SQLite: error: Can't bind intarray. SQLite error code: %d",  v33);
    int v41 = (void *)objc_msgSend( MEMORY[0x189603F68],  "dictionaryWithObject:forKey:",  objc_msgSend(MEMORY[0x189607968], "numberWithInt:", v33),  @"NSSQLiteErrorDomain");
    id v42 = +[_NSCoreDataException exceptionWithName:code:reason:userInfo:]( (uint64_t)&OBJC_CLASS____NSCoreDataException,  *MEMORY[0x189603A58],  134180LL,  v40,  v41);
    objc_exception_throw(v42);
LABEL_33:
    __break(1u);
  }

- (NSSQLiteStatementCache)statementCacheForEntity:(uint64_t)a1
{
  if (!a1) {
    return 0LL;
  }
  uint64_t v4 = *(dispatch_queue_s **)(a1 + 8);
  if (v4) {
    dispatch_assert_queue_V2(v4);
  }
  if (!a2) {
    return 0LL;
  }
  int v5 = (NSSQLiteStatementCache *)[*(id *)(a1 + 200) objectForKey:a2];
  if (!v5)
  {
    int v5 = -[NSSQLiteStatementCache initWithEntity:]( objc_alloc(&OBJC_CLASS___NSSQLiteStatementCache),  "initWithEntity:",  a2);
    CFDictionarySetValue(*(CFMutableDictionaryRef *)(a1 + 200), a2, v5);
  }

  return v5;
}

- (void)resetSQLStatement
{
  v2 = *(dispatch_queue_s **)(a1 + 8);
  if (v2) {
    dispatch_assert_queue_V2(v2);
  }
  id v3 = *(sqlite3_stmt **)(a1 + 80);
  if (v3)
  {
    sqlite3_reset(v3);
    sqlite3_clear_bindings(*(sqlite3_stmt **)(a1 + 80));
    *(void *)(a1 + 80) = 0LL;
  }

  -[NSSQLiteConnection clearTempTablesBindingsForStatement:](a1, *(void **)(a1 + 48));

  *(void *)(a1 + 48) = 0LL;
}

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    objc_opt_self();
    objc_opt_class();
  }

+ (uint64_t)openAtPath:(uint64_t)a1 withKey:(const char *)a2 handle:(void *)a3 flags:(sqlite3 *)a4 module:(int)a5 checkpointOnClose:(char)a6
{
  ppDb = 0LL;
  uint64_t v11 = sqlite3_open_v2(a2, &ppDb, a5, 0LL);
  if (ppDb)
  {
    if ((a6 & 1) == 0)
    {
      uint64_t v26 = 1LL;
      uint64_t v12 = sqlite3_db_config(ppDb, 1006);
      if ((_DWORD)v12)
      {
        if (!(_DWORD)v11) {
          _NSCoreDataLog( 1LL,  (uint64_t)@"sqlite3_db_config for SQLITE_DBCONFIG_NO_CKPT_ON_CLOSE failed: %d",  v13,  v14,  v15,  v16,  v17,  v18,  v12);
        }
      }
    }
  }

  if (a3)
  {
    if (!(_DWORD)v11)
    {
      [a3 bytes];
      [a3 length];
      uint64_t v11 = sqlite3_key_v2();
      if ((_DWORD)v11 == 21) {
        _NSCoreDataLog( 1LL,  (uint64_t)@"Failed to activate SQLite encryption extension",  v19,  v20,  v21,  v22,  v23,  v24,  v26);
      }
    }
  }

  *a4 = ppDb;
  return v11;
}

- (id)initForSQLCore:(id)a3
{
  v21.receiver = self;
  v21.super_class = (Class)&OBJC_CLASS___NSSQLiteConnection;
  uint64_t v4 = -[NSSQLiteConnection init](&v21, sel_init);
  if (v4)
  {
    if (objc_msgSend((id)objc_msgSend(a3, "URL"), "isFileURL")
      && (int v5 = (void *)objc_msgSend((id)objc_msgSend(a3, "URL"), "path")) != 0)
    {
      uint64_t v6 = (const __CFString *)[v5 lastPathComponent];
    }

    else
    {
      uint64_t v6 = @"nil";
    }

    id v7 = (void *)[NSString stringWithFormat:@"SQLQueue %p for %@", v4, v6];
    uint64_t v8 = [a3 _persistentStoreCoordinator];
    else {
      uint64_t v10 = 0LL;
    }
    dispatch_queue_t v11 = dispatch_queue_create((const char *)[v7 fileSystemRepresentation], v10);
    v4->_queue = (OS_dispatch_queue *)v11;
    dispatch_set_context(v11, v4);
    v4->_sqlCore = (NSSQLCore *)a3;
    v4->_useSyntaxColoredLogging = +[NSSQLCore coloredLoggingDefault](&OBJC_CLASS___NSSQLCore, "coloredLoggingDefault");
    uint64_t v12 = (const __CFAllocator *)*MEMORY[0x189604DB0];
    uint64_t v13 = (const CFDictionaryValueCallBacks *)MEMORY[0x189605250];
    v4->_vmCachedStatements = CFDictionaryCreateMutable( (CFAllocatorRef)*MEMORY[0x189604DB0],  0LL,  0LL,  MEMORY[0x189605250]);
    v4->_pragmaSettings = (NSMutableDictionary *)[objc_alloc(MEMORY[0x189603FC8]) initWithCapacity:1];
    keyCallBacks.version = *MEMORY[0x189605240];
    *(_OWORD *)&keyCallBacks.retain = *(_OWORD *)(MEMORY[0x189605240] + 8LL);
    uint64_t v14 = *(CFStringRef (__cdecl **)(const void *))(MEMORY[0x189605240] + 24LL);
    keyCallBacks.equal = 0LL;
    keyCallBacks.hash = 0LL;
    keyCallBacks.copyDescription = v14;
    v4->_cachedEntityUpdateStatements = CFDictionaryCreateMutable(v12, 0LL, &keyCallBacks, v13);
    v4->_cachedEntityConstrainedValuesUpdateStatements = CFDictionaryCreateMutable(v12, 0LL, &keyCallBacks, v13);
    v4->_statementCachesByEntity = CFDictionaryCreateMutable(v12, 0LL, &keyCallBacks, v13);
    v4->_mObjectIDsUpdatedByTriggers = (NSMutableSet *)objc_alloc_init(MEMORY[0x189603FE0]);
    v4->_mObjectIDsInsertedByDATriggers = (NSMutableArray *)objc_alloc_init(MEMORY[0x189603FA8]);
    v4->_mObjectIDsUpdatededByDATriggers = (NSMutableArray *)objc_alloc_init(MEMORY[0x189603FA8]);
    uint64_t v15 = -[NSPersistentStore options](v4->_sqlCore, "options");
    v4->_sqlCoreOptions = v15;
    v4->_timeOutOption = 0.0;
    id v16 = -[NSDictionary objectForKey:](v15, "objectForKey:", @"NSPersistentStoreTimeoutOption");
    if (v16)
    {
      [v16 doubleValue];
    }

    else
    {
      if (!BYTE1(z9dsptsiQ80etb9782fsrs98bfdle88)) {
        goto LABEL_15;
      }
      uint64_t v17 = 0x406E000000000000LL;
    }

    *(void *)&v4->_timeOutOption = v17;
LABEL_15:
    for (uint64_t i = 0LL; i != 5; ++i)
      v4->_extraBuffersForRegisteredFunctions[i] = PF_CALLOC_OBJECT_ARRAY(4LL);
    v4->_dbPathRegisteredWithBackupd = 0LL;
    *(_DWORD *)&v4->_sqliteConnectionFlags |= 0x100u;
    v4->_transactionStringName = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x189603FC8]);
    v4->_usedIndexes = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x189603FC8]);
  }

  return v4;
}

- (id)initAsQueryGenerationTrackingConnectionForSQLCore:(id)a3
{
  uint64_t v7 = 0LL;
  uint64_t v8 = &v7;
  uint64_t v9 = 0x2020000000LL;
  char v10 = 0;
  id v3 = -[NSSQLiteConnection initForSQLCore:](self, "initForSQLCore:", a3);
  uint64_t v4 = v3;
  if (v3)
  {
    v6[0] = MEMORY[0x1895F87A8];
    v6[1] = 3221225472LL;
    v6[2] = __72__NSSQLiteConnection_initAsQueryGenerationTrackingConnectionForSQLCore___block_invoke;
    v6[3] = &unk_189EA7258;
    v6[4] = v3;
    v6[5] = &v7;
    -[NSSQLiteConnection performAndWait:]((uint64_t)v3, (uint64_t)v6);
    if (!*((_BYTE *)v8 + 24))
    {

      uint64_t v4 = 0LL;
    }
  }

  if (!*((_BYTE *)v8 + 24)) {
    uint64_t v4 = 0LL;
  }
  _Block_object_dispose(&v7, 8);
  return v4;
}

void __72__NSSQLiteConnection_initAsQueryGenerationTrackingConnectionForSQLCore___block_invoke(uint64_t a1)
{
  uint64_t v25 = *MEMORY[0x1895F89C0];
  *(_DWORD *)(*(void *)(a1 + 32) + 312LL) |= 0x800u;
  *(void *)(*(void *)(a1 + 32) + 328LL) = objc_alloc_init(MEMORY[0x189603FA8]);
  uint64_t v24 = 0LL;
  id v2 = objc_alloc_init(MEMORY[0x1896077E8]);
  -[NSSQLiteConnection connect](*(void *)(a1 + 32));
  uint64_t v3 = *(void *)(a1 + 32);
  if (v3)
  {
    -[NSSQLiteConnection _hasTableWithName:isTemp:](v3, (uint64_t)@"Z_METADATA", 0);
    uint64_t v3 = *(void *)(a1 + 32);
  }

  uint64_t v4 = -[NSSQLiteConnection _ensureWalFileExists](v3);
  uint64_t v11 = v4;
  if (v4 < 41943041)
  {
    if (v4 < 0)
    {
      id v22 = +[_NSCoreDataException exceptionWithName:code:reason:userInfo:]( (uint64_t)&OBJC_CLASS____NSCoreDataException,  *MEMORY[0x189603A58],  14LL,  (uint64_t)@"failed to open journal file",  0LL);
      -[_NSCoreDataException _setDomain:]((uint64_t)v22, @"NSSQLiteErrorDomain");
      objc_exception_throw(v22);
      __break(1u);
      JUMPOUT(0x1867EFEC4LL);
    }

    uint64_t v12 = sqlite3_snapshot_recover(*(sqlite3 **)(*(void *)(a1 + 32) + 72LL), "main");
    if ((_DWORD)v12) {
      BOOL v19 = v11 == 0;
    }
    else {
      BOOL v19 = 1;
    }
    if (!v19)
    {
      _NSCoreDataLog(1LL, (uint64_t)@"sqlite3_snapshot_recover failed with %d", v13, v14, v15, v16, v17, v18, v12);
      goto LABEL_12;
    }
  }

  else
  {
    _NSCoreDataLog( 2LL,  (uint64_t)@"Force checkpointing -wal while initializing query generations due to its large size (%lld)",  v5,  v6,  v7,  v8,  v9,  v10,  v4);
    -[NSSQLiteConnection _performPostSaveTasks:andForceFullVacuum:](*(void *)(a1 + 32), 1, 0);
    -[NSSQLiteConnection _ensureWalFileExists](*(void *)(a1 + 32));
  }

  *(_DWORD *)(*(void *)(a1 + 32) + 312LL) |= 0x200u;
LABEL_12:
  -[NSSQLiteConnection _executeSQLString:](*(void *)(a1 + 32), @"pragma cache_size = 10");
  -[NSSQLiteConnection beginReadTransaction](*(void *)(a1 + 32));
  -[NSSQLiteConnection _currentQueryGenerationSnapshot:](*(void *)(a1 + 32), &v24);
  objc_super v21 = v20;
  -[NSSQLiteConnection rollbackTransaction](*(void *)(a1 + 32));
  if (v21)
  {

    *(_BYTE *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL) = 1;
  }

  [v2 drain];
  id v23 = 0LL;
  if (!*(_BYTE *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL)) {
    -[NSSQLiteConnection disconnect](*(void *)(a1 + 32));
  }
}

- (uint64_t)_ensureWalFileExists
{
  if (!a1) {
    return 0LL;
  }
  id v2 = *(sqlite3 **)(a1 + 72);
  if (!v2) {
    return -1LL;
  }
  unint64_t FileSizeFromJournalHandle = readFileSizeFromJournalHandle(v2);
  if (FileSizeFromJournalHandle <= 0x3FF)
  {
    if (*(void *)(a1 + 72))
    {
      if (+[NSPersistentStoreCoordinator _shouldDebugAllTaskAssertions]())
      {
        int v14 = 0;
        if (!sqlite3_file_control(*(sqlite3 **)(a1 + 72), 0LL, 103, &v14) && v14 >= 2)
        {
          objc_opt_self();
          uint64_t v4 = [NSString stringWithUTF8String:"A task assertion should be active when this database is locked"];
          _NSCoreDataLog(17LL, v4, v5, v6, v7, v8, v9, v10, v13);
          uint64_t v11 = (os_log_s *)__pflogFaultLog;
          if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
          {
            LOWORD(v13) = 0;
            _os_log_fault_impl( &dword_186681000,  v11,  OS_LOG_TYPE_FAULT,  "CoreData: A task assertion should be active when this database is locked",  (uint8_t *)&v13,  2u);
          }
        }
      }
    }

    -[NSSQLiteConnection _executeSQLString:](a1, @"BEGIN EXCLUSIVE");
    -[NSSQLiteConnection _executeSQLString:](a1, @"INSERT INTO Z_METADATA (Z_VERSION) VALUES (999)");
    -[NSSQLiteConnection _executeSQLString:](a1, @"DELETE FROM Z_METADATA where Z_VERSION = 999");
    -[NSSQLiteConnection _executeSQLString:](a1, @"COMMIT");
  }

  return FileSizeFromJournalHandle;
}

- (void)_performPostSaveTasks:(int)a3 andForceFullVacuum:
{
  if (a1)
  {
    uint64_t v6 = *(dispatch_queue_s **)(a1 + 8);
    if (v6) {
      dispatch_assert_queue_V2(v6);
    }
    if (*(void *)(a1 + 72) && ([*(id *)(a1 + 16) isReadOnly] & 1) == 0)
    {
      uint64_t FileSizeFromJournalHandle = readFileSizeFromJournalHandle(*(sqlite3 **)(a1 + 72));
      if (FileSizeFromJournalHandle <= 0x800000)
      {
        int v14 = 0;
        if ((a2 & 1) != 0) {
          goto LABEL_16;
        }
      }

      else
      {
        _NSCoreDataLog( 9LL,  (uint64_t)@"PostSaveMaintenance: fileSize %lld greater than prune threshold",  v8,  v9,  v10,  v11,  v12,  v13,  FileSizeFromJournalHandle);
        if (*(void *)(a1 + 296) != 0x7FFFFFFFFFFFFFFFLL) {
          *(void *)(a1 + 296) = 0LL;
        }
        int v14 = 1;
        if ((a2 & 1) != 0) {
          goto LABEL_16;
        }
      }

      if (!a3)
      {
        uint64_t v15 = *(void *)(a1 + 296);
        if (v15 == 0x7FFFFFFFFFFFFFFFLL) {
          goto LABEL_45;
        }
        uint64_t v16 = (uint64_t *)(a1 + 296);
        if (v15)
        {
          uint64_t v17 = v15 - 1;
LABEL_44:
          *uint64_t v16 = v17;
          goto LABEL_45;
        }

- (void)_executeSQLString:(uint64_t)a1
{
  if (!a1) {
    return;
  }
  uint64_t v3 = a1;
  uint64_t v4 = *(dispatch_queue_s **)(a1 + 8);
  if (v4) {
    dispatch_assert_queue_V2(v4);
  }
  context = (void *)MEMORY[0x186E3E5D8]();
  ppStmt = 0LL;
  unsigned int v68 = 0;
  -[NSSQLiteConnection _ensureDatabaseOpen]((void *)v3);
  -[NSSQLiteConnection _ensureNoStatementPrepared](v3);
  -[NSSQLiteConnection _ensureNoFetchInProgress](v3);
  if (+[NSSQLCore debugDefault](&OBJC_CLASS___NSSQLCore, "debugDefault") >= 1)
  {
    if (*(_BYTE *)(v3 + 42)) {
      uint64_t v11 = @"\x1B[32msql: \x1B[34m\x1B[47m%@\x1B[0m";
    }
    else {
      uint64_t v11 = @"%@";
    }
    _NSCoreDataLog(6LL, (uint64_t)v11, v5, v6, v7, v8, v9, v10, (uint64_t)a2);
  }

  uint64_t v12 = (const char *)[a2 UTF8String];
  int v13 = 0;
  unsigned int v65 = 0;
  unsigned int v14 = 0;
  double v15 = 0.0;
LABEL_10:
  int v16 = 3 * v14 - 29999;
  while (2)
  {
    int v17 = strlen(v12);
    uint64_t v18 = sqlite3_prepare_v2(*(sqlite3 **)(v3 + 72), v12, v17, &ppStmt, (const char **)&pzTail);
    uint64_t v19 = v18;
    switch((char)v18)
    {
      case 0:
        int v22 = 0;
        unsigned int v66 = 0;
        unsigned int v23 = 0;
        double v15 = 0.0;
LABEL_37:
        int v24 = 3 * v23 - 29999;
        while (2)
        {
          uint64_t v25 = sqlite3_step(ppStmt);
          uint64_t v19 = v25;
          switch((char)v25)
          {
            case 5:
              sqlite3_reset(ppStmt);
              if (v23 < 0x2711) {
                goto LABEL_58;
              }
              if (v23 - 10000 >= 0xB) {
                useconds_t v26 = v23 - 8899;
              }
              else {
                useconds_t v26 = v24;
              }
              goto LABEL_57;
            case 6:
              sqlite3_reset(ppStmt);
              goto LABEL_54;
            case 7:
            case 10:
            case 17:
            case 21:
              goto LABEL_82;
            case 8:
            case 9:
            case 12:
            case 13:
            case 15:
            case 16:
            case 18:
            case 19:
            case 20:
            case 22:
            case 23:
            case 24:
            case 25:
              goto LABEL_92;
            case 11:
            case 26:
              goto LABEL_88;
            case 14:
              if (v22 > 2) {
                goto LABEL_82;
              }
              ++v22;
LABEL_54:
              if (v23 <= 0xA) {
                useconds_t v26 = 3 * v23 + 1;
              }
              else {
                useconds_t v26 = v23 + 1101;
              }
LABEL_57:
              usleep(v26);
LABEL_58:
              if (v15 == 0.0 || (double Current = CFAbsoluteTimeGetCurrent(), Current <= v15))
              {
                v24 += 3;
                ++v23;
                continue;
              }

              if (v66 <= 7)
              {
                ++v23;
                double v15 = Current + *(double *)(v3 + 240);
                ++v66;
                goto LABEL_37;
              }

              break;
            default:
              if (v25 - 100 < 2)
              {
                sqlite3_finalize(ppStmt);
                objc_autoreleasePoolPop(context);
                return;
              }

              if (v25 == 1)
              {
LABEL_82:
                int v42 = v25;
                uint64_t v43 = [NSString stringWithUTF8String:sqlite3_errmsg(*(sqlite3 **)(v3 + 72))];
                if (v42 == 10) {
                  sqlite3_file_control(*(sqlite3 **)(v3 + 72), 0LL, 4, &v68);
                }
                uint64_t v44 = *(void *)(v3 + 32);
                if (v68) {
                  uint64_t v45 = [NSString stringWithFormat:@"I/O error for database at %@.  SQLite error code:%d, '%@' errno:%d", v44, v19, v43, v68];
                }
                else {
                  uint64_t v45 = [NSString stringWithFormat:@"I/O error for database at %@.  SQLite error code:%d, '%@'", v44, v19, v43, v63];
                }
                uint64_t v31 = (void *)v45;
                if (v45)
                {
                  int v67 = 0LL;
                  uint64_t v32 = 256LL;
                }

                else
                {
LABEL_88:
                  uint64_t v31 = (void *)[NSString stringWithFormat:@"Fatal error.  The database at %@ is corrupted.  SQLite error code:%d, '%s'", *(void *)(v3 + 32), v19, sqlite3_errmsg(*(sqlite3 **)(v3 + 72))];
                  uint64_t v32 = (int)v19;
                  int v67 = @"NSSQLiteErrorDomain";
                }

                sqlite3_finalize(ppStmt);
                ppStmt = 0LL;
                -[NSSQLiteConnection _forceDisconnectOnError](v3);
                if (v31)
                {
                  uint64_t v39 = (const char *)[v31 UTF8String];
                  int v40 = 0;
                  goto LABEL_94;
                }
              }

              else
              {
LABEL_92:
                uint64_t v32 = 0LL;
                int v67 = 0LL;
              }

              uint64_t v39 = sqlite3_errmsg(*(sqlite3 **)(v3 + 72));
              uint64_t v31 = 0LL;
              int v40 = 1;
LABEL_94:
              if (*(_BYTE *)(v3 + 42)) {
                int v41 = @"\x1B[31m\x1B[47mERROR:\x1B[0m\x1B[31m (%d) %s\x1B[0m";
              }
              else {
                int v41 = @"(%d) %s";
              }
              goto LABEL_97;
          }

          goto LABEL_107;
        }

      case 1:
      case 7:
      case 10:
      case 17:
      case 21:
        goto LABEL_66;
      case 5:
        if (v14 < 0x2711) {
          goto LABEL_31;
        }
        if (v14 - 10000 >= 0xB) {
          useconds_t v20 = v14 - 8899;
        }
        else {
          useconds_t v20 = v16;
        }
        goto LABEL_30;
      case 6:
        goto LABEL_27;
      case 11:
      case 26:
        goto LABEL_72;
      case 14:
        if (v13 > 2)
        {
LABEL_66:
          int v27 = v18;
          uint64_t v28 = [NSString stringWithUTF8String:sqlite3_errmsg(*(sqlite3 **)(v3 + 72))];
          if (v27 == 10) {
            sqlite3_file_control(*(sqlite3 **)(v3 + 72), 0LL, 4, &v68);
          }
          uint64_t v29 = *(void *)(v3 + 32);
          if (v68) {
            uint64_t v30 = [NSString stringWithFormat:@"I/O error for database at %@.  SQLite error code:%d, '%@' errno:%d", v29, v19, v28, v68];
          }
          else {
            uint64_t v30 = [NSString stringWithFormat:@"I/O error for database at %@.  SQLite error code:%d, '%@'", v29, v19, v28, v63];
          }
          uint64_t v31 = (void *)v30;
          if (v30)
          {
            int v67 = 0LL;
            uint64_t v32 = 256LL;
          }

          else
          {
LABEL_72:
            uint64_t v31 = (void *)[NSString stringWithFormat:@"Fatal error.  The database at %@ is corrupted.  SQLite error code:%d, '%s'", *(void *)(v3 + 32), v19, sqlite3_errmsg(*(sqlite3 **)(v3 + 72))];
            uint64_t v32 = (int)v19;
            int v67 = @"NSSQLiteErrorDomain";
          }

          sqlite3_finalize(ppStmt);
          ppStmt = 0LL;
          -[NSSQLiteConnection _forceDisconnectOnError](v3);
          if (v31)
          {
            uint64_t v39 = (const char *)[v31 UTF8String];
            int v40 = 0;
          }

          else
          {
LABEL_75:
            uint64_t v39 = sqlite3_errmsg(*(sqlite3 **)(v3 + 72));
            uint64_t v31 = 0LL;
            int v40 = 1;
          }

          if (*(_BYTE *)(v3 + 42)) {
            int v41 = @"\x1B[31m\x1B[47mERROR:\x1B[0m\x1B[31m (%d) %s\x1B[0m";
          }
          else {
            int v41 = @"(%d) %s";
          }
LABEL_97:
          _NSCoreDataLog(1LL, (uint64_t)v41, v33, v34, v35, v36, v37, v38, v19);
          if (v40)
          {
            uint64_t v31 = (void *)objc_msgSend( NSString,  "stringWithFormat:",  @"error during execution of SQL string '%s' : %s",  v12,  v39);
            uint64_t v32 = 256LL;
          }

          if (ppStmt) {
            sqlite3_finalize(ppStmt);
          }
          uint64_t v46 = *MEMORY[0x189603A58];
          __int128 v47 = (void *)MEMORY[0x189603F68];
          uint64_t v48 = *(void *)(v3 + 32);
          uint64_t v49 = *MEMORY[0x1896074F8];
          uint64_t v19 = [MEMORY[0x189607968] numberWithInt:v19];
          if (v68) {
            uint64_t v50 = objc_msgSend(MEMORY[0x189607968], "numberWithInteger:");
          }
          else {
            uint64_t v50 = 0LL;
          }
          id v51 = +[_NSCoreDataException exceptionWithName:code:reason:userInfo:]( (uint64_t)_NSCoreDataException,  v46,  v32,  (uint64_t)v31,  (void *)objc_msgSend( v47,  "dictionaryWithObjectsAndKeys:",  v48,  v49,  v19,  @"NSSQLiteErrorDomain",  v50,  *MEMORY[0x189607688],  0));
          uint64_t v3 = (uint64_t)v51;
          if (v67) {
            -[_NSCoreDataException _setDomain:]((uint64_t)v51, v67);
          }
          objc_exception_throw((id)v3);
          goto LABEL_107;
        }

        ++v13;
LABEL_27:
        if (v14 <= 0xA) {
          useconds_t v20 = 3 * v14 + 1;
        }
        else {
          useconds_t v20 = v14 + 1101;
        }
LABEL_30:
        usleep(v20);
LABEL_31:
        if (v15 == 0.0 || (double Current = CFAbsoluteTimeGetCurrent(), Current <= v15))
        {
          v16 += 3;
          ++v14;
          continue;
        }

        if (v65 <= 7)
        {
          ++v14;
          double v15 = Current + *(double *)(v3 + 240);
          ++v65;
          goto LABEL_10;
        }

- (void)beginReadTransaction
{
  if (a1)
  {
    id v2 = (void *)MEMORY[0x186E3E5D8]();
    -[NSSQLiteConnection connect](a1);
    -[NSSQLiteConnection _ensureNoTransactionOpen](a1);
    -[NSSQLiteConnection _ensureNoStatementPrepared](a1);
    uint64_t v3 = -[NSSQLiteStatement initWithEntity:sqlString:]( objc_alloc(&OBJC_CLASS___NSSQLiteStatement),  "initWithEntity:sqlString:",  0LL,  @"BEGIN TRANSACTION");
    -[NSSQLiteConnection prepareSQLStatement:](a1, v3);
    _execute(a1);
    -[NSSQLiteConnection releaseSQLStatement](a1);
    *(_BYTE *)(a1 + 41) = 1;

    if (!*(_BYTE *)(a1 + 40))
    {
      *(_BYTE *)(a1 + 40) = 1;
      objc_msgSend( (id)objc_msgSend(MEMORY[0x189607958], "defaultCenter"),  "postNotificationName:object:",  @"NSSQLConnectionBeginTransactionNotification",  a1);
    }

    objc_autoreleasePoolPop(v2);
  }

- (void)_currentQueryGenerationSnapshot:(uint64_t)a1
{
  if (!a1) {
    return;
  }
  uint64_t v4 = *(dispatch_queue_s **)(a1 + 8);
  if (v4) {
    dispatch_assert_queue_V2(v4);
  }
  uint64_t v5 = *(sqlite3 **)(a1 + 72);
  if (!v5)
  {
    objc_exception_throw((id)[MEMORY[0x189603F70] exceptionWithName:*MEMORY[0x189603A58] reason:@"database connection must not be nil here" userInfo:0]);
    -[NSSQLiteConnection rollbackTransaction](v20);
    return;
  }

  ppSnapshot = 0LL;
  int v6 = sqlite3_snapshot_get(v5, "main", &ppSnapshot);
  BOOL v7 = v6 == 0;
  if (v6 != 517 && v6 != 0)
  {
    while (1)
    {
      usleep(0x64u);
      int v6 = sqlite3_snapshot_get(*(sqlite3 **)(a1 + 72), "main", &ppSnapshot);
      BOOL v7 = v6 == 0;
    }
  }

  if (!v7)
  {
LABEL_18:
    uint64_t v9 = [MEMORY[0x189607870] errorWithDomain:@"NSSQLiteErrorDomain" code:v6 userInfo:0];
    goto LABEL_19;
  }

  uint64_t v9 = 0LL;
LABEL_19:
  if (+[NSSQLCore debugDefault](&OBJC_CLASS___NSSQLCore, "debugDefault") >= 1)
  {
    [MEMORY[0x189603F48] dataWithBytes:ppSnapshot length:48];
    [MEMORY[0x189607B18] valueWithPointer:ppSnapshot];
    _NSCoreDataLog( 4LL,  (uint64_t)@"connection %p created snapshot:\n\tss %@ value: \n\tpointer value:%@\n\tpointer: %p",  v11,  v12,  v13,  v14,  v15,  v16,  a1);
  }

  if (readFileSizeFromJournalHandle(*(sqlite3 **)(a1 + 72)))
  {
    if (ppSnapshot)
    {
      int v17 = objc_alloc(&OBJC_CLASS____PFSQLiteSnapshotWrapper);
      if (v17)
      {
        uint64_t v18 = ppSnapshot;
        v22.receiver = v17;
        v22.super_class = (Class)&OBJC_CLASS____PFSQLiteSnapshotWrapper;
        uint64_t v19 = objc_msgSendSuper2(&v22, sel_init);
        if (v19)
        {
          v19[1] = v18;
          *((_DWORD *)v19 + 5) = 1;
        }
      }
    }

    else if (a2 && v9)
    {
      *a2 = v9;
    }
  }

  else
  {
    if (a2) {
      *a2 = [MEMORY[0x189607870] errorWithDomain:*MEMORY[0x189607460] code:134181 userInfo:0];
    }
    sqlite3_snapshot_free(ppSnapshot);
  }

- (void)rollbackTransaction
{
  if (a1)
  {
    if (*(void *)(a1 + 72))
    {
      if ((*(_BYTE *)(a1 + 312) & 2) != 0)
      {
        id v2 = (void *)MEMORY[0x189603F70];
        uint64_t v3 = *MEMORY[0x189603A58];
        uint64_t v4 = NSStringFromSelector(sel_rollbackTransaction);
        uint64_t v5 = (objc_class *)objc_opt_class();
        [v2 raise:v3, @"%@ -- %@ %p: attempted to rollback a transaction while a fetch was in progress", v4, NSStringFromClass(v5), a1 format];
      }

      -[NSSQLiteConnection resetSQLStatement](a1);
      int v6 = *(NSSQLiteStatement **)(a1 + 144);
      if (!v6)
      {
        int v6 = -[NSSQLiteStatement initWithEntity:sqlString:]( objc_alloc(&OBJC_CLASS___NSSQLiteStatement),  "initWithEntity:sqlString:",  0LL,  @"ROLLBACK");
        *(void *)(a1 + 144) = v6;
      }

      -[NSSQLiteConnection prepareSQLStatement:](a1, v6);
      BOOL v7 = *(sqlite3_stmt **)(a1 + 144);
      if (v7) {
        uint64_t v8 = *((void *)v7 + 8);
      }
      else {
        uint64_t v8 = 0LL;
      }
      if (*(void *)(a1 + 80) != v8) {
        -[NSSQLiteConnection cacheCurrentDBStatementOn:](a1, v7);
      }
      _execute(a1);
      -[NSSQLiteConnection resetSQLStatement](a1);
      *(_BYTE *)(a1 + 41) = 0;
      -[NSSQLiteConnection _clearTransactionCaches](a1);
    }

    if (*(_BYTE *)(a1 + 40))
    {
      *(_BYTE *)(a1 + 40) = 0;
      objc_msgSend( (id)objc_msgSend(MEMORY[0x189607958], "defaultCenter"),  "postNotificationName:object:",  @"NSSQLConnectionRollbackTransactionNotification",  a1);
    }
  }

- (void)disconnect
{
  if (a1)
  {
    id v2 = *(dispatch_queue_s **)(a1 + 8);
    if (v2) {
      dispatch_assert_queue_V2(v2);
    }
    uint64_t v36 = 0LL;
    [*(id *)(a1 + 328) removeAllObjects];
    uint64_t v3 = (void *)+[NSPersistentStoreCoordinator _beginPowerAssertionNamed:withAssert:]( (uint64_t)&OBJC_CLASS___NSPersistentStoreCoordinator,  (uint64_t)@"CoreData: SQLite disconnection",  &v36);
    -[NSSQLiteConnection _finalizeStatement](a1);
    if (*(_BYTE *)(a1 + 40)) {
      -[NSSQLiteConnection rollbackTransaction](a1);
    }
    -[NSSQLiteConnection _clearTransactionCaches](a1);
    -[NSSQLiteConnection _clearCachedStatements]((dispatch_queue_s **)a1);
    if (!*(void *)(a1 + 72)) {
      goto LABEL_15;
    }
    if (+[NSSQLCore debugDefault](&OBJC_CLASS___NSSQLCore, "debugDefault")) {
      _NSCoreDataLog(4LL, (uint64_t)@"Disconnecting from sqlite database.", v4, v5, v6, v7, v8, v9, v35);
    }
    if ([*(id *)(a1 + 16) _persistentStoreCoordinator]
      && !objc_msgSend( (id)objc_msgSend(*(id *)(a1 + 16), "options"),  "objectForKey:",  @"NSReadOnlyPersistentStoreOption"))
    {
      uint64_t v25 = *(void *)(a1 + 16);
      if (v25)
      {
        unint64_t v26 = atomic_load((unint64_t *)(v25 + 208));
        int v27 = *(sqlite3 **)(a1 + 72);
        if (v26)
        {
          uint64_t FileSizeFromJournalHandle = readFileSizeFromJournalHandle(v27);
          if (FileSizeFromJournalHandle >= 41943041)
          {
            _NSCoreDataLog( 4LL,  (uint64_t)@"Marking -wal eligible for checkpointing in -disconnect due to its large size (%lld)",  v29,  v30,  v31,  v32,  v33,  v34,  FileSizeFromJournalHandle);
            sqlite3_db_config(*(sqlite3 **)(a1 + 72), 1006, 0LL, 0LL);
          }

          goto LABEL_11;
        }
      }

      else
      {
        int v27 = *(sqlite3 **)(a1 + 72);
      }

      sqlite3_db_config(v27, 1006, 0LL, 0LL);
    }

- (void)dealloc
{
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = __29__NSSQLiteConnection_dealloc__block_invoke;
  block[3] = &unk_189EA7758;
  block[4] = self;
  dispatch_queue_t current_queue = dispatch_get_current_queue();
  if (dispatch_get_context(current_queue) == self) {
    __29__NSSQLiteConnection_dealloc__block_invoke((uint64_t)block);
  }
  else {
    dispatch_sync((dispatch_queue_t)self->_queue, block);
  }
  dispatch_release((dispatch_object_t)self->_queue);
  self->_queue = 0LL;
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___NSSQLiteConnection;
  -[NSSQLiteConnection dealloc](&v4, sel_dealloc);
}

void __29__NSSQLiteConnection_dealloc__block_invoke(uint64_t a1)
{
  uint64_t v26 = *MEMORY[0x1895F89C0];
  id v2 = (void *)MEMORY[0x186E3E5D8]();
  uint64_t v3 = *(void *)(a1 + 32);
  objc_super v4 = *(dispatch_queue_s **)(v3 + 8);
  if (v4)
  {
    dispatch_assert_queue_V2(v4);
    uint64_t v3 = *(void *)(a1 + 32);
  }

  *(void *)(v3 + 16) = 0LL;

  *(void *)(*(void *)(a1 + 32) + 368LL) = 0LL;
  -[NSSQLiteConnection releaseSQLStatement](*(void *)(a1 + 32));

  *(void *)(*(void *)(a1 + 32) + 56LL) = 0LL;
  *(void *)(*(void *)(a1 + 32) + 64LL) = 0LL;
  uint64_t v5 = *(void *)(a1 + 32);
  if (*(void *)(v5 + 72)) {
    -[NSSQLiteConnection disconnect](v5);
  }
  for (uint64_t i = 0LL; i != 5; ++i)
  {
    uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 8 * i + 248);
    if (v7)
    {
      for (uint64_t j = 0LL; j != 32; j += 8LL)
      {
        uint64_t v9 = *(void **)(v7 + j);
        if (v9)
        {
          if ((i & 0x7FFFFFFB) == 0) {

          }
          *(void *)(v7 + j) = 0LL;
        }
      }

      PF_FREE_OBJECT_ARRAY(*(void **)(*(void *)(a1 + 32) + 8 * i + 248));
      *(void *)(*(void *)(a1 + 32) + 8 * i + 248) = 0LL;
    }
  }

  uint64_t v10 = *(void *)(a1 + 32);
  uint64_t v11 = *(void **)(v10 + 200);
  if (v11)
  {
    __int128 v23 = 0u;
    __int128 v24 = 0u;
    __int128 v21 = 0u;
    __int128 v22 = 0u;
    uint64_t v12 = [v11 countByEnumeratingWithState:&v21 objects:v25 count:16];
    if (v12)
    {
      uint64_t v13 = v12;
      uint64_t v14 = *(void *)v22;
      do
      {
        uint64_t v15 = 0LL;
        do
        {
          if (*(void *)v22 != v14) {
            objc_enumerationMutation(v11);
          }
          -[NSSQLiteStatementCache clearCachedStatements]( [*(id *)(*(void *)(a1 + 32) + 200) objectForKey:*(void *)(*((void *)&v21 + 1) + 8 * v15++)]);
        }

        while (v13 != v15);
        uint64_t v13 = [v11 countByEnumeratingWithState:&v21 objects:v25 count:16];
      }

      while (v13);
    }

    CFRelease(*(CFTypeRef *)(*(void *)(a1 + 32) + 200LL));
    uint64_t v10 = *(void *)(a1 + 32);
  }

  *(void *)(*(void *)(a1 + 32) + 208LL) = 0LL;
  *(void *)(*(void *)(a1 + 32) + 128LL) = 0LL;
  *(void *)(*(void *)(a1 + 32) + 136LL) = 0LL;
  *(void *)(*(void *)(a1 + 32) + 144LL) = 0LL;
  uint64_t v16 = *(void *)(a1 + 32);
  int v17 = *(const void **)(v16 + 152);
  if (v17)
  {
    CFRelease(v17);
    uint64_t v16 = *(void *)(a1 + 32);
  }

  *(void *)(v16 + 152) = 0LL;

  *(void *)(*(void *)(a1 + 32) + 160LL) = 0LL;
  *(void *)(*(void *)(a1 + 32) + 304LL) = 0LL;

  *(void *)(*(void *)(a1 + 32) + 216LL) = 0LL;
  *(void *)(*(void *)(a1 + 32) + 224LL) = 0LL;
  uint64_t v18 = *(void *)(a1 + 32);
  uint64_t v19 = *(const void **)(v18 + 288);
  if (v19)
  {
    CFRelease(v19);
    *(void *)(*(void *)(a1 + 32) + 288LL) = 0LL;
    uint64_t v18 = *(void *)(a1 + 32);
  }

  *(void *)(*(void *)(a1 + 32) + 176LL) = 0LL;
  *(void *)(*(void *)(a1 + 32) + 184LL) = 0LL;

  *(void *)(*(void *)(a1 + 32) + 168LL) = 0LL;
  *(void *)(*(void *)(a1 + 32) + 328LL) = 0LL;

  *(void *)(*(void *)(a1 + 32) + 336LL) = 0LL;
  *(void *)(*(void *)(a1 + 32) + 344LL) = 0LL;
  uint64_t v20 = *(void **)(*(void *)(a1 + 32) + 360LL);
  if (v20)
  {
    dispatch_block_cancel(v20);
    _Block_release(*(const void **)(*(void *)(a1 + 32) + 360LL));
    *(void *)(*(void *)(a1 + 32) + 360LL) = 0LL;
  }

  objc_autoreleasePoolPop(v2);
}

- (id)adapter
{
  return -[NSSQLCore adapter](self->_sqlCore, "adapter");
}

- (void)_performBlock:(uint64_t)a1
{
  if (a1)
  {
    uint64_t v3 = *(dispatch_queue_s **)(a1 + 8);
    if (v3)
    {
      block[0] = MEMORY[0x1895F87A8];
      block[1] = 3221225472LL;
      block[2] = __36__NSSQLiteConnection__performBlock___block_invoke;
      block[3] = &unk_189EAA1F0;
      block[4] = a2;
      dispatch_async(v3, block);
    }

    else
    {
      objc_super v4 = (void *)MEMORY[0x186E3E5D8]();
      (*(void (**)(uint64_t))(a2 + 16))(a2);
      objc_autoreleasePoolPop(v4);
      id v5 = 0LL;
    }
  }

void __36__NSSQLiteConnection__performBlock___block_invoke(uint64_t a1)
{
  id v2 = (void *)MEMORY[0x186E3E5D8]();
  (*(void (**)(void))(*(void *)(a1 + 32) + 16LL))();
  objc_autoreleasePoolPop(v2);
}

- (uint64_t)_restoreBusyTimeOutSettings
{
  double v1 = *(double *)(a1 + 232) * 0.125;
  double v2 = 30.0;
  if (v1 >= 30.0)
  {
    int v3 = 30000;
  }

  else
  {
    double v2 = 2.0;
    if (v1 >= 2.0)
    {
      double v2 = ceil(v1);
      int v3 = 1000 * vcvtpd_s64_f64(v1);
    }

    else
    {
      int v3 = 2000;
    }
  }

  *(double *)(a1 + 240) = v2;
  return sqlite3_busy_timeout(*(sqlite3 **)(a1 + 72), v3);
}

- (void)_ensureNoStatementPrepared
{
  double v2 = *(dispatch_queue_s **)(a1 + 8);
  if (v2) {
    dispatch_assert_queue_V2(v2);
  }
  if (*(void *)(a1 + 80))
  {
    objc_exception_throw((id)[MEMORY[0x189603F70] exceptionWithName:*MEMORY[0x189603A58] reason:@"Attempted to perform another operation with a statement prepared" userInfo:0]);
    -[NSSQLiteConnection _ensureNoTransactionOpen]();
  }

- (void)_ensureNoTransactionOpen
{
  double v2 = *(dispatch_queue_s **)(a1 + 8);
  if (v2) {
    dispatch_assert_queue_V2(v2);
  }
  if (*(_BYTE *)(a1 + 40))
  {
    objc_exception_throw((id)[MEMORY[0x189603F70] exceptionWithName:*MEMORY[0x189603A58] reason:@"Nested transactions are not supported" userInfo:0]);
    -[NSSQLiteConnection copyRawIntegerRowsForSQL:]();
  }

- (CFMutableArrayRef)copyRawIntegerRowsForSQL:(uint64_t)a1
{
  if (!a1) {
    return 0LL;
  }
  uint64_t v3 = a1;
  objc_super v4 = *(dispatch_queue_s **)(a1 + 8);
  if (v4) {
    dispatch_assert_queue_V2(v4);
  }
  *(_OWORD *)&callBacks.version = xmmword_189EAA210;
  *(_OWORD *)&callBacks.release = *(_OWORD *)&off_189EAA220;
  callBacks.equal = 0LL;
  CFMutableArrayRef theArray = CFArrayCreateMutable((CFAllocatorRef)*MEMORY[0x189604DB0], 0LL, &callBacks);
  context = (void *)MEMORY[0x186E3E5D8]();
  ppStmt = 0LL;
  unsigned int v132 = 0;
  -[NSSQLiteConnection connect](v3);
  -[NSSQLiteConnection _ensureNoStatementPrepared](v3);
  -[NSSQLiteConnection _ensureNoFetchInProgress](v3);
  double v5 = 0.0;
  double Current = 0.0;
  if (+[NSSQLCore debugDefault](&OBJC_CLASS___NSSQLCore, "debugDefault") >= 1)
  {
    double Current = CFAbsoluteTimeGetCurrent();
    if (*(_BYTE *)(v3 + 42)) {
      uint64_t v13 = @"\x1B[32msql: \x1B[34m\x1B[47m%@\x1B[0m";
    }
    else {
      uint64_t v13 = @"%@";
    }
    _NSCoreDataLog(6LL, (uint64_t)v13, v7, v8, v9, v10, v11, v12, (uint64_t)a2);
  }

  uint64_t v14 = (const char *)[a2 UTF8String];
  int v15 = 0;
  unsigned int v127 = 0;
  unsigned int v16 = 0;
LABEL_10:
  int v17 = 3 * v16 - 29999;
  while (2)
  {
    int v18 = strlen(v14);
    uint64_t v19 = sqlite3_prepare_v2(*(sqlite3 **)(v3 + 72), v14, v18, &ppStmt, (const char **)&pzTail);
    uint64_t v20 = v19;
    switch((char)v19)
    {
      case 0:
        if (*(void *)(v3 + 72))
        {
          if (+[NSPersistentStoreCoordinator _shouldDebugAllTaskAssertions]())
          {
            int v131 = 0;
            if (!sqlite3_file_control(*(sqlite3 **)(v3 + 72), 0LL, 103, &v131) && v131 >= 2)
            {
              objc_opt_self();
              uint64_t v23 = [NSString stringWithUTF8String:"A task assertion should be active when this database is locked"];
              _NSCoreDataLog(17LL, v23, v24, v25, v26, v27, v28, v29, v120);
              uint64_t v30 = (os_log_s *)__pflogFaultLog;
              if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
              {
                *(_WORD *)buf = 0;
                _os_log_fault_impl( &dword_186681000,  v30,  OS_LOG_TYPE_FAULT,  "CoreData: A task assertion should be active when this database is locked",  buf,  2u);
              }
            }
          }
        }

        uint64_t v31 = 0LL;
        uint64_t v32 = 0LL;
        int v33 = 0;
        int v34 = 0;
        int v128 = 0;
        int v35 = 0;
        while (2)
        {
          uint64_t v125 = v32;
          double v36 = 0.0;
LABEL_44:
          int v37 = 3 * v35 - 29999;
          while (2)
          {
            uint64_t v38 = sqlite3_step(ppStmt);
            uint64_t v20 = v38;
            if (v38 <= 0x63u)
            {
              switch((char)v38)
              {
                case 5:
                  if (!v34) {
                    sqlite3_reset(ppStmt);
                  }
                  if (v35 < 10001) {
                    goto LABEL_70;
                  }
                  else {
                    useconds_t v39 = v37;
                  }
                  goto LABEL_69;
                case 6:
                  if (!v34) {
                    sqlite3_reset(ppStmt);
                  }
                  goto LABEL_66;
                case 7:
                case 10:
                case 17:
                case 21:
                  goto LABEL_121;
                case 8:
                case 9:
                case 12:
                case 13:
                case 15:
                case 16:
                case 18:
                case 19:
                case 20:
                case 22:
                case 23:
                case 24:
                case 25:
                  goto LABEL_131;
                case 11:
                case 26:
                  goto LABEL_127;
                case 14:
                  if (v33 > 2) {
                    goto LABEL_121;
                  }
                  ++v33;
LABEL_66:
                  if (v35 > 10) {
                    useconds_t v39 = v35 + 1101;
                  }
                  else {
                    useconds_t v39 = 3 * (v35 % 11) + 1;
                  }
LABEL_69:
                  usleep(v39);
LABEL_70:
                  if (v36 == 0.0 || (double v40 = CFAbsoluteTimeGetCurrent(), v40 <= v36))
                  {
                    v37 += 3;
                    ++v35;
                    continue;
                  }

                  if (v128 <= 7)
                  {
                    ++v35;
                    double v36 = v40 + *(double *)(v3 + 240);
                    ++v128;
                    goto LABEL_44;
                  }

                  uint64_t v111 = [NSString stringWithFormat:@"The database operation timed out after %.2f seconds.", v40 - v36 + *(double *)(v3 + 232)];
                  if (+[NSSQLCore debugDefault](&OBJC_CLASS___NSSQLCore, "debugDefault") >= 1)
                  {
                    if (*(_BYTE *)(v3 + 42)) {
                      int v118 = @"\x1B[31m\x1B[47mERROR:\x1B[0m\x1B[31m (%d) %@\x1B[0m";
                    }
                    else {
                      int v118 = @"(%d) %@";
                    }
                    uint64_t v121 = v111;
                    _NSCoreDataLog(1LL, (uint64_t)v118, v112, v113, v114, v115, v116, v117, v20);
                  }

                  if (theArray) {
                    CFRelease(theArray);
                  }
                  if (ppStmt) {
                    sqlite3_finalize(ppStmt);
                  }
                  uint64_t v110 = [NSString stringWithFormat:@"error during SQL execution : %@", v111, v121];
                  break;
                default:
LABEL_121:
                  int v82 = v38;
                  uint64_t v83 = [NSString stringWithUTF8String:sqlite3_errmsg(*(sqlite3 **)(v3 + 72))];
                  if (v82 == 10) {
                    sqlite3_file_control(*(sqlite3 **)(v3 + 72), 0LL, 4, &v132);
                  }
                  uint64_t v84 = *(void *)(v3 + 32);
                  if (v132) {
                    uint64_t v85 = [NSString stringWithFormat:@"I/O error for database at %@.  SQLite error code:%d, '%@' errno:%d", v84, v20, v83, v132];
                  }
                  else {
                    uint64_t v85 = [NSString stringWithFormat:@"I/O error for database at %@.  SQLite error code:%d, '%@'", v84, v20, v83, v122];
                  }
                  uint64_t v86 = (void *)v85;
                  if (v85)
                  {
                    v129 = 0LL;
                    uint64_t v87 = 256LL;
                  }

                  else
                  {
LABEL_127:
                    uint64_t v86 = (void *)[NSString stringWithFormat:@"Fatal error.  The database at %@ is corrupted.  SQLite error code:%d, '%s'", *(void *)(v3 + 32), v20, sqlite3_errmsg(*(sqlite3 **)(v3 + 72))];
                    uint64_t v87 = (int)v20;
                    v129 = @"NSSQLiteErrorDomain";
                  }

                  sqlite3_finalize(ppStmt);
                  ppStmt = 0LL;
                  -[NSSQLiteConnection _forceDisconnectOnError](v3);
                  if (!v86) {
                    goto LABEL_132;
                  }
                  uint64_t v94 = (const char *)[v86 UTF8String];
                  int v95 = 0;
                  goto LABEL_133;
              }

              goto LABEL_168;
            }

            break;
          }

          if (v38 == 100)
          {
            uint64_t v32 = v125;
            if (!v31)
            {
              uint64_t v32 = sqlite3_column_count(ppStmt);
              int v41 = (malloc_zone_t *)_PF_Private_Malloc_Zone;
              if (!_PF_Private_Malloc_Zone) {
                int v41 = malloc_default_zone();
              }
              uint64_t v31 = malloc_zone_malloc(v41, 8uLL);
              *uint64_t v31 = (int)v32;
              CFArrayAppendValue(theArray, v31);
              int v34 = 1;
            }

            if ((int)v32 >= 1)
            {
              int v42 = (malloc_zone_t *)_PF_Private_Malloc_Zone;
              if (!_PF_Private_Malloc_Zone) {
                int v42 = malloc_default_zone();
              }
              uint64_t v43 = v32;
              uint64_t v126 = v32;
              uint64_t v31 = malloc_zone_malloc(v42, 8LL * v32);
              for (uint64_t i = 0LL; i != v43; ++i)
                v31[i] = sqlite3_column_int64(ppStmt, i);
              CFArrayAppendValue(theArray, v31);
              uint64_t v32 = v126;
            }

            continue;
          }

          break;
        }

        if (v38 != 101)
        {
LABEL_131:
          uint64_t v87 = 0LL;
          v129 = 0LL;
LABEL_132:
          uint64_t v94 = sqlite3_errmsg(*(sqlite3 **)(v3 + 72));
          uint64_t v86 = 0LL;
          int v95 = 1;
LABEL_133:
          if (*(_BYTE *)(v3 + 42)) {
            v96 = @"\x1B[31m\x1B[47mERROR:\x1B[0m\x1B[31m (%d) %s\x1B[0m";
          }
          else {
            v96 = @"(%d) %s";
          }
          _NSCoreDataLog(1LL, (uint64_t)v96, v88, v89, v90, v91, v92, v93, v20);
          if (v95)
          {
            uint64_t v86 = (void *)objc_msgSend( NSString,  "stringWithFormat:",  @"error during execution of SQL string '%s' : %s",  v14,  v94);
            uint64_t v87 = 256LL;
          }

          if (theArray) {
            CFRelease(theArray);
          }
          if (ppStmt) {
            sqlite3_finalize(ppStmt);
          }
          uint64_t v14 = (const char *)*MEMORY[0x189603A58];
          int v97 = (void *)MEMORY[0x189603F68];
          uint64_t v98 = *(void *)(v3 + 32);
          uint64_t v99 = *MEMORY[0x1896074F8];
          uint64_t v20 = [MEMORY[0x189607968] numberWithInt:v20];
          if (v132) {
            uint64_t v100 = objc_msgSend(MEMORY[0x189607968], "numberWithInteger:");
          }
          else {
            uint64_t v100 = 0LL;
          }
          uint64_t v78 = (void *)objc_msgSend( v97,  "dictionaryWithObjectsAndKeys:",  v98,  v99,  v20,  @"NSSQLiteErrorDomain",  v100,  *MEMORY[0x189607688],  0,  context);
          uint64_t v79 = (uint64_t)v14;
          uint64_t v80 = v87;
          for (uint64_t j = (uint64_t)v86; ; uint64_t j = (uint64_t)v62)
          {
            id v101 = +[_NSCoreDataException exceptionWithName:code:reason:userInfo:]( (uint64_t)&OBJC_CLASS____NSCoreDataException,  v79,  v80,  j,  v78);
            uint64_t v3 = (uint64_t)v101;
            if (v129) {
              -[_NSCoreDataException _setDomain:]((uint64_t)v101, v129);
            }
            objc_exception_throw((id)v3);
LABEL_149:
            uint64_t v63 = 0LL;
            v129 = 0LL;
LABEL_107:
            uint64_t v70 = sqlite3_errmsg(*(sqlite3 **)(v3 + 72));
            uint64_t v62 = 0LL;
            int v71 = 1;
LABEL_109:
            if (*(_BYTE *)(v3 + 42)) {
              id v72 = @"\x1B[31m\x1B[47mERROR:\x1B[0m\x1B[31m (%d) %s\x1B[0m";
            }
            else {
              id v72 = @"(%d) %s";
            }
            _NSCoreDataLog(1LL, (uint64_t)v72, v64, v65, v66, v67, v68, v69, v20);
            if (v71)
            {
              uint64_t v62 = (void *)objc_msgSend( NSString,  "stringWithFormat:",  @"error during execution of SQL string '%s' : %s",  v14,  v70);
              uint64_t v63 = 256LL;
            }

            if (ppStmt) {
              sqlite3_finalize(ppStmt);
            }
            uint64_t v14 = (const char *)&OBJC_CLASS____NSCoreDataException;
            uint64_t v73 = *MEMORY[0x189603A58];
            uint64_t v74 = (void *)MEMORY[0x189603F68];
            uint64_t v75 = *(void *)(v3 + 32);
            uint64_t v76 = *MEMORY[0x1896074F8];
            uint64_t v20 = [MEMORY[0x189607968] numberWithInt:v20];
            if (v132) {
              uint64_t v77 = objc_msgSend(MEMORY[0x189607968], "numberWithInteger:");
            }
            else {
              uint64_t v77 = 0LL;
            }
            uint64_t v78 = (void *)objc_msgSend( v74,  "dictionaryWithObjectsAndKeys:",  v75,  v76,  v20,  @"NSSQLiteErrorDomain",  v77,  *MEMORY[0x189607688],  0);
            uint64_t v79 = v73;
            uint64_t v80 = v63;
          }
        }

        CFMutableArrayRef v45 = theArray;
        if (!CFArrayGetCount(theArray))
        {
          uint64_t v46 = (malloc_zone_t *)_PF_Private_Malloc_Zone;
          if (!_PF_Private_Malloc_Zone) {
            uint64_t v46 = malloc_default_zone();
          }
          __int128 v47 = malloc_zone_malloc(v46, 8uLL);
          *__int128 v47 = 0LL;
          CFArrayAppendValue(theArray, v47);
        }

        if (+[NSSQLCore debugDefault](&OBJC_CLASS___NSSQLCore, "debugDefault") >= 1)
        {
          int v48 = *(unsigned __int8 *)(v3 + 42);
          double v55 = CFAbsoluteTimeGetCurrent() - Current;
          if (v48) {
            uint64_t v56 = @"sql execution time: \x1B[31m%.4f\x1B[0ms";
          }
          else {
            uint64_t v56 = @"sql execution time: %.4fs";
          }
          _NSCoreDataLog(4LL, (uint64_t)v56, v49, v50, v51, v52, v53, v54, *(uint64_t *)&v55);
        }

        sqlite3_finalize(ppStmt);
        objc_autoreleasePoolPop(context);
        return v45;
      case 1:
      case 7:
      case 10:
      case 17:
      case 21:
        goto LABEL_98;
      case 5:
        if (v16 < 0x2711) {
          goto LABEL_31;
        }
        if (v16 - 10000 >= 0xB) {
          useconds_t v21 = v16 - 8899;
        }
        else {
          useconds_t v21 = v17;
        }
        goto LABEL_30;
      case 6:
        goto LABEL_27;
      case 11:
      case 26:
        goto LABEL_104;
      case 14:
        if (v15 > 2)
        {
LABEL_98:
          int v58 = v19;
          uint64_t v59 = [NSString stringWithUTF8String:sqlite3_errmsg(*(sqlite3 **)(v3 + 72))];
          if (v58 == 10) {
            sqlite3_file_control(*(sqlite3 **)(v3 + 72), 0LL, 4, &v132);
          }
          uint64_t v60 = *(void *)(v3 + 32);
          if (v132) {
            uint64_t v61 = [NSString stringWithFormat:@"I/O error for database at %@.  SQLite error code:%d, '%@' errno:%d", v60, v20, v59, v132];
          }
          else {
            uint64_t v61 = [NSString stringWithFormat:@"I/O error for database at %@.  SQLite error code:%d, '%@'", v60, v20, v59, v122];
          }
          uint64_t v62 = (void *)v61;
          if (v61)
          {
            v129 = 0LL;
            uint64_t v63 = 256LL;
          }

          else
          {
LABEL_104:
            uint64_t v62 = (void *)[NSString stringWithFormat:@"Fatal error.  The database at %@ is corrupted.  SQLite error code:%d, '%s'", *(void *)(v3 + 32), v20, sqlite3_errmsg(*(sqlite3 **)(v3 + 72))];
            uint64_t v63 = (int)v20;
            v129 = @"NSSQLiteErrorDomain";
          }

          sqlite3_finalize(ppStmt);
          ppStmt = 0LL;
          -[NSSQLiteConnection _forceDisconnectOnError](v3);
          if (v62)
          {
            uint64_t v70 = (const char *)[v62 UTF8String];
            int v71 = 0;
            goto LABEL_109;
          }

          goto LABEL_107;
        }

        ++v15;
LABEL_27:
        if (v16 <= 0xA) {
          useconds_t v21 = 3 * v16 + 1;
        }
        else {
          useconds_t v21 = v16 + 1101;
        }
LABEL_30:
        usleep(v21);
LABEL_31:
        if (v5 == 0.0 || (double v22 = CFAbsoluteTimeGetCurrent(), v22 <= v5))
        {
          v17 += 3;
          ++v16;
          continue;
        }

        if (v127 <= 7)
        {
          ++v16;
          double v5 = v22 + *(double *)(v3 + 240);
          ++v127;
          goto LABEL_10;
        }

        uint64_t v102 = [NSString stringWithFormat:@"The database operation timed out after %.2f seconds.", v22 - v5 + *(double *)(v3 + 232)];
        if (+[NSSQLCore debugDefault](&OBJC_CLASS___NSSQLCore, "debugDefault") >= 1)
        {
          if (*(_BYTE *)(v3 + 42)) {
            unsigned int v109 = @"\x1B[31m\x1B[47mERROR:\x1B[0m\x1B[31m (%d) %@\x1B[0m";
          }
          else {
            unsigned int v109 = @"(%d) %@";
          }
          uint64_t v121 = v102;
          _NSCoreDataLog(1LL, (uint64_t)v109, v103, v104, v105, v106, v107, v108, v20);
        }

        if (ppStmt) {
          sqlite3_finalize(ppStmt);
        }
        uint64_t v110 = [NSString stringWithFormat:@"error during SQL execution : %@", v102, v121];
LABEL_168:
        id v119 = +[_NSCoreDataException exceptionWithName:code:reason:userInfo:]( (uint64_t)_NSCoreDataException,  *MEMORY[0x189603A58],  134090,  v110,  (void *)objc_msgSend( MEMORY[0x189603F68],  "dictionaryWithObject:forKey:",  objc_msgSend(MEMORY[0x189607968], "numberWithInt:", v20),  @"NSSQLiteErrorDomain"));
        objc_exception_throw(v119);
        return 0LL;
      default:
        goto LABEL_149;
    }
  }

- (void)_forceDisconnectOnError
{
  if (a1)
  {
    double v2 = *(dispatch_queue_s **)(a1 + 8);
    if (v2) {
      dispatch_assert_queue_V2(v2);
    }
    uint64_t v11 = 0LL;
    [*(id *)(a1 + 328) removeAllObjects];
    uint64_t v3 = (void *)+[NSPersistentStoreCoordinator _beginPowerAssertionNamed:withAssert:]( (uint64_t)&OBJC_CLASS___NSPersistentStoreCoordinator,  (uint64_t)@"CoreData: SQLite disconnection (forced error)",  &v11);
    *(_BYTE *)(a1 + 40) = 0;
    -[NSSQLiteConnection releaseSQLStatement](a1);
    -[NSSQLiteConnection _clearTransactionCaches](a1);
    -[NSSQLiteConnection _clearCachedStatements]((dispatch_queue_s **)a1);
    if (*(void *)(a1 + 72))
    {
      if (+[NSSQLCore debugDefault](&OBJC_CLASS___NSSQLCore, "debugDefault")) {
        _NSCoreDataLog( 4LL,  (uint64_t)@"Disconnecting from sqlite database due to an error.",  v4,  v5,  v6,  v7,  v8,  v9,  v10);
      }
      sqlite3_close_v2(*(sqlite3 **)(a1 + 72));
    }

    *(void *)(a1 + 304) = 0LL;
    *(_DWORD *)(a1 + 312) &= ~2u;
    *(void *)(a1 + 72) = 0LL;
    *(void *)(a1 + 80) = 0LL;
    +[NSPersistentStoreCoordinator _endPowerAssertionWithAssert:andApp:]( (uint64_t)&OBJC_CLASS___NSPersistentStoreCoordinator,  v11,  v3);
  }

- (sqlite3_int64)_fetchMaxPrimaryKeyForEntity:(uint64_t)a1
{
  if (!a1) {
    return 0LL;
  }
  uint64_t v4 = *(dispatch_queue_s **)(a1 + 8);
  if (v4) {
    dispatch_assert_queue_V2(v4);
  }
  uint64_t v5 = (void *)[objc_alloc(NSString) initWithFormat:@"SELECT MAX(%@) FROM %@", @"Z_PK", objc_msgSend(a2, "tableName")];
  if (+[NSSQLCore debugDefault](&OBJC_CLASS___NSSQLCore, "debugDefault") >= 1)
  {
    if (*(_BYTE *)(a1 + 42)) {
      uint64_t v12 = @"\x1B[32msql: \x1B[34m\x1B[47m%@\x1B[0m";
    }
    else {
      uint64_t v12 = @"%@";
    }
    _NSCoreDataLog(6LL, (uint64_t)v12, v6, v7, v8, v9, v10, v11, (uint64_t)v5);
  }

  ppStmt = 0LL;
  pzTail = 0LL;
  uint64_t v13 = (const char *)[v5 UTF8String];
  id v14 = v5;
  -[NSSQLiteConnection _ensureDatabaseOpen]((void *)a1);
  -[NSSQLiteConnection _ensureNoStatementPrepared](a1);
  -[NSSQLiteConnection _ensureNoFetchInProgress](a1);
  int v15 = strlen(v13);
  uint64_t v16 = sqlite3_prepare_v2(*(sqlite3 **)(a1 + 72), v13, v15, &ppStmt, (const char **)&pzTail);
  if ((_DWORD)v16)
  {
    unsigned int v17 = 0;
    int v18 = 1;
    while (v16 - 5 <= 1)
    {
      if (v17 >= 0xB) {
        useconds_t v19 = v17 + 1101;
      }
      else {
        useconds_t v19 = v18;
      }
      usleep(v19);
      int v20 = strlen(v13);
      uint64_t v16 = sqlite3_prepare_v2(*(sqlite3 **)(a1 + 72), v13, v20, &ppStmt, (const char **)&pzTail);
      v18 += 3;
      ++v17;
      if (!(_DWORD)v16) {
        goto LABEL_16;
      }
    }

    uint64_t v30 = *(sqlite3 **)(a1 + 72);
    uint64_t v31 = v16;
    uint64_t v32 = [NSString stringWithUTF8String:sqlite3_errmsg(v30)];
    uint64_t v33 = *MEMORY[0x189603A58];
    int v34 = (void *)objc_msgSend( MEMORY[0x189603F68],  "dictionaryWithObject:forKey:",  objc_msgSend(MEMORY[0x189607968], "numberWithInt:", v31),  @"NSSQLiteErrorDomain");
    uint64_t v35 = v33;
    double v36 = (const __CFString *)v32;
    goto LABEL_29;
  }

- (sqlite3_int64)fetchMaxPrimaryKeyForEntity:(sqlite3_int64)result
{
  if (result)
  {
    uint64_t v3 = result;
    uint64_t v4 = *(dispatch_queue_s **)(result + 8);
    if (v4) {
      dispatch_assert_queue_V2(v4);
    }
    return -[NSSQLiteConnection _fetchMaxPrimaryKeyForEntity:](v3, a2);
  }

  return result;
}

- (uint64_t)canConnect
{
  if (result)
  {
    uint64_t v1 = result;
    if (!*(void *)(result + 24))
    {
      *(void *)(result + 24) = (id)[*(id *)(result + 16) URL];
    }

    if (!*(void *)(v1 + 32)) {
      *(void *)(v1 + 32) = (id)[*(id *)(v1 + 24) path];
    }
    if (*(void *)(v1 + 72)) {
      return 1LL;
    }
    uint64_t v2 = *(void *)(v1 + 16);
    if (v2 && (*(_BYTE *)(v2 + 201) & 0x40) != 0) {
      return 1LL;
    }
    else {
      return objc_msgSend( (id)objc_msgSend(MEMORY[0x1896078A8], "defaultManager"),  "fileExistsAtPath:",  *(void *)(v1 + 32));
    }
  }

  return result;
}

- (BOOL)databaseIsEmpty
{
  if (result) {
    return stat((const char *)[*(id *)(result + 32) fileSystemRepresentation], &v2) || v2.st_size == 0;
  }
  return result;
}

+ (uint64_t)readMagicWordFromPath:(void *)a3 options:
{
  id v14 = 0LL;
  int v5 = stat(a2, &v13);
  uint64_t MagicWordFromDBHandle = 0LL;
  if (v5) {
    BOOL v7 = 0;
  }
  else {
    BOOL v7 = v13.st_size == 0;
  }
  char v8 = v7;
  if (v5 != 2 && (v8 & 1) == 0)
  {
    if (!strncmp("/dev/null", a2, 9uLL))
    {
      return 0LL;
    }

    else
    {
      Class v9 = +[NSSQLCore databaseKeyFromOptionsDictionary:]((uint64_t)&OBJC_CLASS___NSSQLCore, a3);
      int v10 = +[NSSQLiteConnection openAtPath:withKey:handle:flags:module:checkpointOnClose:]( (uint64_t)&OBJC_CLASS___NSSQLiteConnection,  a2,  v9,  &v14,  1,  0);
      uint64_t v11 = v14;
      if (v10 == 26)
      {
        uint64_t MagicWordFromDBHandle = 92LL;
        if (!v14) {
          return MagicWordFromDBHandle;
        }
        goto LABEL_19;
      }

      if (v14)
      {
        if (v10) {
          uint64_t MagicWordFromDBHandle = 92LL;
        }
        else {
          uint64_t MagicWordFromDBHandle = readMagicWordFromDBHandle(v14);
        }
LABEL_19:
        sqlite3_close_v2(v11);
        return MagicWordFromDBHandle;
      }

      return 0xFFFFFFFFLL;
    }
  }

  return MagicWordFromDBHandle;
}

- (void)createTableForEntity:(void *)a1
{
  if (a1 && a2 && !a2[20])
  {
    uint64_t v3 = -[NSSQLiteAdapter newCreateTableStatementForEntity:]((const __CFString *)[a1 adapter], a2);
    -[NSSQLiteConnection prepareAndExecuteSQLStatement:]((uint64_t)a1, v3);
  }

- (void)prepareAndExecuteSQLStatement:(uint64_t)a1
{
  if (a1)
  {
    uint64_t v4 = *(dispatch_queue_s **)(a1 + 8);
    if (v4) {
      dispatch_assert_queue_V2(v4);
    }
    if (a2)
    {
      int v5 = (void *)MEMORY[0x186E3E5D8]();
      -[NSSQLiteConnection bindTempTablesForStatementIfNecessary:]((void *)a1, a2);
      -[NSSQLiteConnection prepareSQLStatement:](a1, a2);
      if (*(void *)(a1 + 72))
      {
        if (+[NSPersistentStoreCoordinator _shouldDebugAllTaskAssertions]())
        {
          int v15 = 0;
          if (!sqlite3_file_control(*(sqlite3 **)(a1 + 72), 0LL, 103, &v15) && v15 >= 2)
          {
            objc_opt_self();
            uint64_t v6 = [NSString stringWithUTF8String:"A task assertion should be active when this database is locked"];
            _NSCoreDataLog(17LL, v6, v7, v8, v9, v10, v11, v12, v14);
            stat v13 = (os_log_s *)__pflogFaultLog;
            if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
            {
              LOWORD(v14) = 0;
              _os_log_fault_impl( &dword_186681000,  v13,  OS_LOG_TYPE_FAULT,  "CoreData: A task assertion should be active when this database is locked",  (uint8_t *)&v14,  2u);
            }
          }
        }
      }

      [(id)a1 execute];
      -[NSSQLiteConnection setColumnsToFetch:]((void *)a1, 0LL);
      *(_DWORD *)(a1 + 312) &= ~2u;
      *(void *)(a1 + 100) = 0LL;
      *(void *)(a1 + 92) = 0LL;
      *(_DWORD *)(a1 + 108) = 0;
      -[NSSQLiteConnection releaseSQLStatement](a1);
      objc_autoreleasePoolPop(v5);
    }
  }

- (void)createManyToManyTablesForEntity:(void *)a1
{
  if (a1)
  {
    uint64_t v4 = (void *)[a2 manyToManyRelationships];
    uint64_t v5 = [v4 count];
    if (v5)
    {
      uint64_t v6 = v5;
      for (uint64_t i = 0LL; i != v6; ++i)
      {
        uint64_t v8 = (__CFString *)[v4 objectAtIndex:i];
        if (v8)
        {
          uint64_t v9 = v8;
          if (v8[2].isa)
          {
            if ((void *)-[__CFString entity](v8, "entity") == a2)
            {
              uint64_t v10 = -[NSSQLiteAdapter newCreateTableStatementForManyToMany:]( (NSSQLiteStatement *)[a1 adapter],  v9);
              -[NSSQLiteConnection prepareAndExecuteSQLStatement:]((uint64_t)a1, v10);
            }
          }
        }
      }
    }
  }

- (uint64_t)_createIndexesForEntities:(void *)a1
{
  uint64_t v16 = *MEMORY[0x1895F89C0];
  __int128 v11 = 0u;
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  uint64_t result = [a2 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (result)
  {
    uint64_t v5 = result;
    uint64_t v6 = *(void *)v12;
    do
    {
      uint64_t v7 = 0LL;
      do
      {
        if (*(void *)v12 != v6) {
          objc_enumerationMutation(a2);
        }
        uint64_t v8 = *(void *)(*((void *)&v11 + 1) + 8 * v7);
        -[NSSQLiteConnection createIndexesForEntity:](a1, v8);
        if (v8)
        {
          if (![*(id *)(v8 + 152) count]) {
            goto LABEL_10;
          }
          uint64_t v9 = *(void *)(v8 + 152);
LABEL_9:
          -[NSSQLiteConnection _createIndexesForEntities:](a1, v9);
          goto LABEL_10;
        }

        uint64_t v10 = [0 count];
        uint64_t v9 = 0LL;
        if (v10) {
          goto LABEL_9;
        }
LABEL_10:
        ++v7;
      }

      while (v5 != v7);
      uint64_t result = [a2 countByEnumeratingWithState:&v11 objects:v15 count:16];
      uint64_t v5 = result;
    }

    while (result);
  }

  return result;
}

- (void)createIndexesForEntity:(void *)a1
{
  uint64_t v22 = *MEMORY[0x1895F89C0];
  if (a1)
  {
    BOOL v4 = +[NSSQLCore debugDefault](&OBJC_CLASS___NSSQLCore, "debugDefault") > 0
      || +[NSMappingModel migrationDebugLevel](&OBJC_CLASS___NSMappingModel, "migrationDebugLevel") > 0;
    uint64_t v5 = [a1 adapter];
    if (v5) {
      id v6 = -[NSSQLiteAdapter newCreateIndexStatementsForEntity:defaultIndicesOnly:](v5, a2, 0);
    }
    else {
      id v6 = 0LL;
    }
    __int128 v19 = 0u;
    __int128 v20 = 0u;
    __int128 v17 = 0u;
    __int128 v18 = 0u;
    uint64_t v13 = [v6 countByEnumeratingWithState:&v17 objects:v21 count:16];
    if (v13)
    {
      uint64_t v14 = *(void *)v18;
      do
      {
        for (uint64_t i = 0LL; i != v13; ++i)
        {
          if (*(void *)v18 != v14) {
            objc_enumerationMutation(v6);
          }
          uint64_t v16 = *(void **)(*((void *)&v17 + 1) + 8 * i);
          if (v4) {
            _NSCoreDataLog( 4LL,  (uint64_t)@"  Execute create index statement: %@",  v7,  v8,  v9,  v10,  v11,  v12,  *(void *)(*((void *)&v17 + 1) + 8 * i));
          }
          -[NSSQLiteConnection prepareAndExecuteSQLStatement:]((uint64_t)a1, v16);
        }

        uint64_t v13 = [v6 countByEnumeratingWithState:&v17 objects:v21 count:16];
      }

      while (v13);
    }
  }

- (uint64_t)createTriggersForEntities:(uint64_t)result
{
  uint64_t v55 = *MEMORY[0x1895F89C0];
  if (result)
  {
    stat v2 = (void *)result;
    BOOL v3 = +[NSSQLCore debugDefault](&OBJC_CLASS___NSSQLCore, "debugDefault") > 0
      || +[NSMappingModel migrationDebugLevel](&OBJC_CLASS___NSMappingModel, "migrationDebugLevel") > 0;
    __int128 v48 = 0u;
    __int128 v49 = 0u;
    __int128 v46 = 0u;
    __int128 v47 = 0u;
    uint64_t result = [a2 countByEnumeratingWithState:&v46 objects:v54 count:16];
    uint64_t v36 = result;
    if (result)
    {
      uint64_t v35 = *(void *)v47;
      do
      {
        uint64_t v4 = 0LL;
        do
        {
          if (*(void *)v47 != v35)
          {
            uint64_t v5 = v4;
            objc_enumerationMutation(a2);
            uint64_t v4 = v5;
          }

          uint64_t v37 = v4;
          id v6 = *(NSSQLEntity_DerivedAttributesExtension **)(*((void *)&v46 + 1) + 8 * v4);
          uint64_t v7 = -[NSSQLEntity derivedAttributesExtension](v6);
          uint64_t v8 = v7;
          if (!v7
            || (-[NSSQLEntity_DerivedAttributesExtension _generateTriggerSQL]((uint64_t)v7),
                (triggerSQL = v8->_triggerSQL) == 0LL))
          {
            uint64_t v32 = (void *)MEMORY[0x189603F70];
            uint64_t v52 = @"entity";
            uint64_t v53 = -[NSSQLEntity_DerivedAttributesExtension entityDescription](v6, "entityDescription");
            uint64_t v33 = [MEMORY[0x189603F68] dictionaryWithObjects:&v53 forKeys:&v52 count:1];
            objc_exception_throw((id)[v32 exceptionWithName:*MEMORY[0x189603A60] reason:@"Unsupported derivedAttribute" userInfo:v33]);
            __break(1u);
          }

          __int128 v44 = 0u;
          __int128 v45 = 0u;
          __int128 v42 = 0u;
          __int128 v43 = 0u;
          uint64_t v16 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( triggerSQL,  "countByEnumeratingWithState:objects:count:",  &v42,  v51,  16LL);
          if (v16)
          {
            uint64_t v17 = *(void *)v43;
            do
            {
              for (uint64_t i = 0LL; i != v16; ++i)
              {
                if (*(void *)v43 != v17) {
                  objc_enumerationMutation(triggerSQL);
                }
                __int128 v19 = *(void **)(*((void *)&v42 + 1) + 8 * i);
                if (v3) {
                  _NSCoreDataLog( 4LL,  (uint64_t)@"  Execute DA trigger creation statement: %@",  v10,  v11,  v12,  v13,  v14,  v15,  *(void *)(*((void *)&v42 + 1) + 8 * i));
                }
                -[NSSQLiteConnection prepareAndExecuteSQLStatement:]((uint64_t)v2, v19);
              }

              uint64_t v16 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( triggerSQL,  "countByEnumeratingWithState:objects:count:",  &v42,  v51,  16LL);
            }

            while (v16);
          }

          -[NSSQLiteAdapter newCreateTriggersForEntity:existingRtreeTables:]( [v2 adapter],  (id *)&v6->super.isa,  0);
          useconds_t v21 = v20;
          __int128 v40 = 0u;
          __int128 v41 = 0u;
          __int128 v38 = 0u;
          __int128 v39 = 0u;
          uint64_t v28 = [v20 countByEnumeratingWithState:&v38 objects:v50 count:16];
          if (v28)
          {
            uint64_t v29 = *(void *)v39;
            do
            {
              for (uint64_t j = 0LL; j != v28; ++j)
              {
                if (*(void *)v39 != v29) {
                  objc_enumerationMutation(v21);
                }
                uint64_t v31 = *(void **)(*((void *)&v38 + 1) + 8 * j);
                if (v3) {
                  _NSCoreDataLog( 4LL,  (uint64_t)@"  Execute trigger creation statement: %@",  v22,  v23,  v24,  v25,  v26,  v27,  *(void *)(*((void *)&v38 + 1) + 8 * j));
                }
                -[NSSQLiteConnection prepareAndExecuteSQLStatement:]((uint64_t)v2, v31);
              }

              uint64_t v28 = [v21 countByEnumeratingWithState:&v38 objects:v50 count:16];
            }

            while (v28);
          }

          uint64_t v4 = v37 + 1;
        }

        while (v37 + 1 != v36);
        uint64_t result = [a2 countByEnumeratingWithState:&v46 objects:v54 count:16];
        uint64_t v36 = result;
      }

      while (result);
    }
  }

  return result;
}

- (uint64_t)createTablesForEntities:(uint64_t)result
{
  uint64_t v23 = *MEMORY[0x1895F89C0];
  if (result)
  {
    BOOL v3 = (void *)result;
    __int128 v19 = 0u;
    __int128 v20 = 0u;
    __int128 v17 = 0u;
    __int128 v18 = 0u;
    uint64_t v4 = [a2 countByEnumeratingWithState:&v17 objects:v22 count:16];
    if (v4)
    {
      uint64_t v5 = v4;
      uint64_t v6 = *(void *)v18;
      do
      {
        for (uint64_t i = 0LL; i != v5; ++i)
        {
          if (*(void *)v18 != v6) {
            objc_enumerationMutation(a2);
          }
          uint64_t v8 = *(void **)(*((void *)&v17 + 1) + 8 * i);
          -[NSSQLiteConnection createTableForEntity:](v3, v8);
          -[NSSQLiteConnection createManyToManyTablesForEntity:](v3, v8);
        }

        uint64_t v5 = [a2 countByEnumeratingWithState:&v17 objects:v22 count:16];
      }

      while (v5);
    }

    __int128 v15 = 0u;
    __int128 v16 = 0u;
    __int128 v13 = 0u;
    __int128 v14 = 0u;
    uint64_t v9 = [a2 countByEnumeratingWithState:&v13 objects:v21 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v14;
      do
      {
        for (uint64_t j = 0LL; j != v10; ++j)
        {
          if (*(void *)v14 != v11) {
            objc_enumerationMutation(a2);
          }
          -[NSSQLiteConnection createIndexesForEntity:](v3, *(void *)(*((void *)&v13 + 1) + 8 * j));
        }

        uint64_t v10 = [a2 countByEnumeratingWithState:&v13 objects:v21 count:16];
      }

      while (v10);
    }

    return -[NSSQLiteConnection createTriggersForEntities:]((uint64_t)v3, a2);
  }

  return result;
}

- (void)createMetadata
{
  stat v2 = -[NSSQLiteAdapter newStatementWithSQLString:]( (NSSQLiteStatement *)[a1 adapter],  objc_msgSend( NSString,  "stringWithFormat:",  @"CREATE TABLE %@ (%@ INTEGER PRIMARY KEY, %@ VARCHAR(255), %@ BLOB)",  @"Z_METADATA",  @"Z_VERSION",  @"Z_UUID",  @"Z_PLIST"));
  -[NSSQLiteConnection prepareAndExecuteSQLStatement:]((uint64_t)a1, v2);
}

- (void)createMissingHistoryTables
{
  uint64_t v16 = *MEMORY[0x1895F89C0];
  if (a1)
  {
    stat v2 = (void *)MEMORY[0x186E3E5D8]();
    BOOL v3 = (void *)objc_msgSend( (id)objc_msgSend(*(id *)(a1 + 16), "ancillarySQLModels"),  "objectForKey:",  @"NSPersistentHistoryTrackingKey");
    uint64_t v4 = v3;
    if (v3) {
      BOOL v3 = (void *)v3[3];
    }
    uint64_t v5 = (void *)objc_msgSend(MEMORY[0x189603FA8], "arrayWithCapacity:", objc_msgSend(v3, "count"));
    __int128 v11 = 0u;
    __int128 v12 = 0u;
    __int128 v13 = 0u;
    __int128 v14 = 0u;
    if (v4) {
      uint64_t v4 = (void *)v4[4];
    }
    uint64_t v6 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v12;
      do
      {
        for (uint64_t i = 0LL; i != v7; ++i)
        {
          if (*(void *)v12 != v8) {
            objc_enumerationMutation(v4);
          }
          uint64_t v10 = *(void **)(*((void *)&v11 + 1) + 8 * i);
          if ((-[NSSQLiteConnection _hasTableWithName:isTemp:](a1, objc_msgSend(v10, "tableName", (void)v11), 0) & 1) == 0) {
            [v5 addObject:v10];
          }
        }

        uint64_t v7 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
      }

      while (v7);
    }

    if (objc_msgSend(v5, "count", (void)v11)) {
      -[NSSQLiteConnection createTablesForEntities:](a1, v5);
    }
    objc_autoreleasePoolPop(v2);
  }

+ (uint64_t)_replacePersistentStoreAtURL:(void *)a3 destinationOptions:(void *)a4 withPersistentStoreFromURL:(void *)a5 sourceOptions:(uint64_t *)a6 error:
{
  uint64_t v101 = *MEMORY[0x1895F89C0];
  objc_opt_self();
  __int128 v11 = (void *)[a4 path];
  __int128 v12 = (void *)[a2 path];
  __int128 v13 = (const char *)[v11 fileSystemRepresentation];
  uint64_t v14 = [v12 fileSystemRepresentation];
  if (+[_PFRoutines _isInMemoryStoreURL:]((uint64_t)&OBJC_CLASS____PFRoutines, a4))
  {
    if (a6)
    {
      __int128 v15 = (void *)MEMORY[0x189607870];
      uint64_t v16 = *MEMORY[0x189607460];
      __int128 v17 = (void *)MEMORY[0x189603F68];
      uint64_t v18 = [a4 path];
      uint64_t v19 = objc_msgSend(v17, "dictionaryWithObjectsAndKeys:", v18, *MEMORY[0x1896074F8], 0);
      __int128 v20 = v15;
      uint64_t v21 = v16;
      uint64_t v22 = 258LL;
LABEL_68:
      uint64_t v68 = [v20 errorWithDomain:v21 code:v22 userInfo:v19];
      uint64_t result = 0LL;
      *a6 = v68;
      return result;
    }

    return 0LL;
  }

  if (+[_PFRoutines _isInMemoryStoreURL:]((uint64_t)&OBJC_CLASS____PFRoutines, a2))
  {
    if (a6)
    {
      uint64_t v23 = (void *)MEMORY[0x189607870];
      uint64_t v24 = *MEMORY[0x189607460];
      uint64_t v25 = (void *)MEMORY[0x189603F68];
      uint64_t v26 = [a2 path];
      uint64_t v19 = objc_msgSend(v25, "dictionaryWithObjectsAndKeys:", v26, *MEMORY[0x1896074F8], 0);
      __int128 v20 = v23;
      uint64_t v21 = v24;
      uint64_t v22 = 514LL;
      goto LABEL_68;
    }

    return 0LL;
  }

  uint64_t v94 = (const char *)v14;
  uint64_t v27 = (__CFString *)_NSSQLiteConnectionLockProxyValueFromPragmas((void *)objc_msgSend(a5, "objectForKey:"));
  if (v27) {
    int v28 = 34;
  }
  else {
    int v28 = 2;
  }
  v96 = a5;
  uint64_t v29 = objc_msgSend(a5, "valueForKey:");
  if (v29)
  {
    uint64_t v30 = v29;
    if ([(id)*MEMORY[0x189607538] isEqualToString:v29])
    {
      v28 |= 0x400000u;
    }

    else if ([(id)*MEMORY[0x189607518] isEqualToString:v30])
    {
      v28 |= 0x300000u;
    }

    else if ([(id)*MEMORY[0x189607510] isEqualToString:v30])
    {
      v28 |= 0x200000u;
    }

    else if ([(id)*MEMORY[0x189607508] isEqualToString:v30])
    {
      v28 |= 0x100000u;
    }

    else if ([(id)*MEMORY[0x189607528] isEqualToString:v30])
    {
      v28 |= 0x700000u;
    }

    else
    {
      _NSCoreDataLog( 1LL,  (uint64_t)@"Unrecognized value '%@' passed into options for NSPersistentStoreFileProtectionKey",  v31,  v32,  v33,  v34,  v35,  v36,  v30);
    }
  }

  uint64_t v98 = 0LL;
  if (objc_msgSend((id)objc_msgSend(a4, "query"), "length"))
  {
    objc_opt_self();
    __int128 v13 = (const char *)objc_msgSend((id)objc_msgSend(a4, "absoluteString"), "fileSystemRepresentation");
  }

  Class v37 = +[NSSQLCore databaseKeyFromOptionsDictionary:]((uint64_t)&OBJC_CLASS___NSSQLCore, v96);
  int v38 = +[NSSQLiteConnection openAtPath:withKey:handle:flags:module:checkpointOnClose:]( (uint64_t)&OBJC_CLASS___NSSQLiteConnection,  v13,  v37,  &v98,  v28,  0);
  if (v38)
  {
    __int128 v39 = (void *)MEMORY[0x189607870];
    uint64_t v40 = v38;
    uint64_t v41 = objc_msgSend( MEMORY[0x189603F68],  "dictionaryWithObjectsAndKeys:",  @"Failed to open source database",  @"reason",  v11,  *MEMORY[0x1896074F8],  0);
    __int128 v42 = v39;
LABEL_26:
    uint64_t v95 = [v42 errorWithDomain:@"NSSQLiteErrorDomain" code:v40 userInfo:v41];
    int v43 = 0;
    goto LABEL_32;
  }

  __int128 v44 = v98;
  sqlite3_busy_timeout(v98, 120000);
  if (v27)
  {
    if ((-[__CFString isEqualToString:](v27, "isEqualToString:", @":auto:") & 1) == 0)
    {
      int v45 = sqlite3_exec( v44,  (const char *)[(id)objc_msgSend( NSString stringWithFormat:@"pragma lock_proxy_file='%@'", v27), "UTF8String"],  0,  0,  0);
      if (v45)
      {
        LODWORD(v40) = v45;
        sqlite3_close_v2(v44);
        uint64_t v98 = 0LL;
        __int128 v46 = (void *)MEMORY[0x189607870];
        uint64_t v40 = (int)v40;
        uint64_t v41 = objc_msgSend( MEMORY[0x189603F68],  "dictionaryWithObjectsAndKeys:",  @"Failed to set file locking on source database",  @"reason",  v27,  @"lock_proxy_file",  0);
        __int128 v42 = v46;
        goto LABEL_26;
      }
    }
  }

  uint64_t v95 = 0LL;
  int v43 = 1;
LABEL_32:
  __int128 v47 = (__CFString *)_NSSQLiteConnectionLockProxyValueFromPragmas((void *)[a3 objectForKey:@"NSSQLitePragmasOption"]);
  if (v47) {
    int v48 = 38;
  }
  else {
    int v48 = 6;
  }
  uint64_t v49 = [a3 valueForKey:@"NSPersistentStoreFileProtectionKey"];
  if (v49)
  {
    uint64_t v50 = v49;
    if ([(id)*MEMORY[0x189607538] isEqualToString:v49])
    {
      v48 |= 0x400000u;
    }

    else if ([(id)*MEMORY[0x189607518] isEqualToString:v50])
    {
      v48 |= 0x300000u;
    }

    else if ([(id)*MEMORY[0x189607510] isEqualToString:v50])
    {
      v48 |= 0x200000u;
    }

    else if ([(id)*MEMORY[0x189607508] isEqualToString:v50])
    {
      v48 |= 0x100000u;
    }

    else if ([(id)*MEMORY[0x189607528] isEqualToString:v50])
    {
      v48 |= 0x700000u;
    }

    else
    {
      _NSCoreDataLog( 1LL,  (uint64_t)@"Unrecognized value '%@' passed into options for NSPersistentStoreFileProtectionKey",  v51,  v52,  v53,  v54,  v55,  v56,  v50);
    }
  }

  int v97 = 0LL;
  if (!v43)
  {
    uint64_t v59 = v95;
    goto LABEL_60;
  }

  if (statfs((const char *)[v11 UTF8String], &v100)
    || statfs( (const char *)objc_msgSend((id)objc_msgSend(v12, "stringByDeletingLastPathComponent"), "UTF8String"),  &v99)
    || strcmp(v100.f_mntonname, v99.f_mntonname)
    || (v100.f_flags & 0x1001) != 0x1000
    || (uint64_t v57 = v98, [v12 UTF8String], _sqlite3_db_clone()))
  {
    if (objc_msgSend((id)objc_msgSend(a2, "query"), "length"))
    {
      objc_opt_self();
      int v58 = (const char *)objc_msgSend((id)objc_msgSend(a2, "absoluteString"), "fileSystemRepresentation");
    }

    else
    {
      int v58 = v94;
    }

    Class v60 = +[NSSQLCore databaseKeyFromOptionsDictionary:]((uint64_t)&OBJC_CLASS___NSSQLCore, a3);
    int v61 = +[NSSQLiteConnection openAtPath:withKey:handle:flags:module:checkpointOnClose:]( (uint64_t)&OBJC_CLASS___NSSQLiteConnection,  v58,  v60,  &v97,  v48,  1);
    if (v61)
    {
      uint64_t v62 = (void *)MEMORY[0x189607870];
      uint64_t v63 = v61;
      uint64_t v64 = objc_msgSend( MEMORY[0x189603F68],  "dictionaryWithObjectsAndKeys:",  @"Failed to open destination database",  @"reason",  v12,  *MEMORY[0x1896074F8],  0);
      uint64_t v65 = v62;
      uint64_t v66 = v63;
LABEL_59:
      uint64_t v59 = [v65 errorWithDomain:@"NSSQLiteErrorDomain" code:v66 userInfo:v64];
LABEL_60:
      if (v98) {
        sqlite3_close_v2(v98);
      }
      if (v97) {
        sqlite3_close_v2(v97);
      }
      if (a6)
      {
        if (v59)
        {
          uint64_t result = 0LL;
          *a6 = v59;
          return result;
        }

        __int128 v20 = (void *)MEMORY[0x189607870];
        uint64_t v21 = *MEMORY[0x189607460];
        uint64_t v22 = 255LL;
        uint64_t v19 = 0LL;
        goto LABEL_68;
      }

      return 0LL;
    }

    uint64_t v69 = v97;
    sqlite3_busy_timeout(v97, 120000);
    if (v47)
    {
      if ((-[__CFString isEqualToString:](v47, "isEqualToString:", @":auto:") & 1) == 0)
      {
        int v70 = sqlite3_exec( v69,  (const char *)[(id)objc_msgSend( NSString stringWithFormat:@"pragma lock_proxy_file='%@'", v47), "UTF8String"],  0,  0,  0);
        if (v70)
        {
          int v71 = v70;
          sqlite3_close_v2(v69);
          int v97 = 0LL;
          id v72 = (void *)MEMORY[0x189607870];
          uint64_t v64 = objc_msgSend( MEMORY[0x189603F68],  "dictionaryWithObjectsAndKeys:",  @"Failed to set file locking on destination database",  @"reason",  v47,  @"lock_proxy_file",  0);
          uint64_t v65 = v72;
          uint64_t v66 = v71;
          goto LABEL_59;
        }
      }
    }

    uint64_t v57 = v98;
    int v73 = sqlite3_file_control(v69, 0LL, 102, v98);
    if (v73)
    {
      uint64_t v74 = objc_msgSend( MEMORY[0x189607870],  "errorWithDomain:code:userInfo:",  @"NSSQLiteErrorDomain",  v73,  objc_msgSend( MEMORY[0x189603F68],  "dictionaryWithObjectsAndKeys:",  @"Failed to replace destination database",  @"reason",  v12,  *MEMORY[0x1896074F8],  v11,  @"Source database Path",  0));
      char v75 = 0;
      goto LABEL_77;
    }
  }

  else
  {
    uint64_t v69 = 0LL;
  }

  char v75 = 1;
  uint64_t v74 = v95;
LABEL_77:
  if (sqlite3_close_v2(v69))
  {
    uint64_t v76 = NSStringFromSelector(sel__replacePersistentStoreAtURL_destinationOptions_withPersistentStoreFromURL_sourceOptions_error_);
    _NSCoreDataLog( 1LL,  (uint64_t)@"%@ failed to close destination database %@",  v77,  v78,  v79,  v80,  v81,  v82,  (uint64_t)v76);
  }

  if (sqlite3_close_v2(v57))
  {
    uint64_t v83 = NSStringFromSelector(sel__replacePersistentStoreAtURL_destinationOptions_withPersistentStoreFromURL_sourceOptions_error_);
    _NSCoreDataLog( 1LL,  (uint64_t)@"%@ failed to close source database %@",  v84,  v85,  v86,  v87,  v88,  v89,  (uint64_t)v83);
  }

  if ((v75 & 1) == 0)
  {
    if (a6)
    {
      uint64_t result = 0LL;
      *a6 = v74;
      return result;
    }

    return 0LL;
  }

  uint64_t v90 = (void *)[v96 objectForKey:@"NSPersistentStoreUnlinkDestroyOption"];
  if (v90) {
    int v91 = [v90 BOOLValue] ^ 1;
  }
  else {
    int v91 = 1;
  }
  uint64_t v92 = (void *)[v96 objectForKey:@"NSPersistentStoreForceDestroyOption"];
  if (v92) {
    int v93 = [v92 BOOLValue] ^ 1;
  }
  else {
    int v93 = 1;
  }
  if ((v91 & v93 & 1) != 0) {
    return 1LL;
  }
  else {
    return +[NSSQLiteConnection _destroyPersistentStoreAtURL:options:error:]( (uint64_t)&OBJC_CLASS___NSSQLiteConnection,  a4,  v96,  a6);
  }
}

+ (uint64_t)_destroyPersistentStoreAtURL:(void *)a3 options:(uint64_t *)a4 error:
{
  uint64_t v113 = *MEMORY[0x1895F89C0];
  objc_opt_self();
  uint64_t v7 = (void *)[a2 path];
  uint64_t v8 = (const char *)[v7 fileSystemRepresentation];
  __int128 v11 = (const char *)objc_msgSend( (id)objc_msgSend(v7, "stringByAppendingString:", @"-journal"),  "fileSystemRepresentation");
  __int128 v12 = (const char *)objc_msgSend( (id)objc_msgSend(v7, "stringByAppendingString:", @"-wal"),  "fileSystemRepresentation");
  if (stat(v8, &v106)) {
    off_t st_size = *__error() != 2;
  }
  else {
    off_t st_size = v106.st_size;
  }
  int v14 = statfs(v8, &v109);
  BOOL v15 = (v14 | v109.f_flags & 0x1000) == 0;
  statfs v100 = (char *)v11;
  if (stat(v11, &v106)) {
    off_t v16 = *__error() != 2;
  }
  else {
    off_t v16 = v106.st_size;
  }
  uint64_t v101 = (char *)v12;
  uint64_t v102 = a4;
  uint64_t v103 = a2;
  if (stat(v12, &v106)) {
    off_t v17 = *__error() != 2;
  }
  else {
    off_t v17 = v106.st_size;
  }
  int v105 = 0;
  uint64_t v18 = (void *)[a3 objectForKey:@"NSSQLitePragmasOption"];
  uint64_t v19 = v18;
  if (v18) {
    __int128 v20 = _NSSQLiteConnectionLockProxyValueFromPragmas(v18);
  }
  else {
    __int128 v20 = 0LL;
  }
  uint64_t v21 = (void *)[v19 objectForKey:@"journal_mode"];
  if (v20) {
    BOOL v15 = 0;
  }
  if (v15) {
    goto LABEL_24;
  }
  if (!v21)
  {
    if (!byte_18C4ABDB8) {
      goto LABEL_24;
    }
    goto LABEL_23;
  }

  if (objc_msgSend(@"wal", "isEqualToString:", objc_msgSend(v21, "lowercaseString"))) {
LABEL_23:
  }
    v105 |= 1u;
LABEL_24:
  if (!st_size && !v16 && !v17 && (v105 & 1) == 0) {
    return 1LL;
  }
  int v22 = 6;
  if (v19)
  {
    if (v20) {
      int v22 = 38;
    }
    else {
      int v22 = 6;
    }
    uint64_t v23 = (void *)[v19 objectForKey:@"page_size"];
    if (v23)
    {
      uint64_t v24 = (uint64_t)v23;
      HIDWORD(v31) = [v23 intValue];
      LODWORD(v31) = HIDWORD(v31) - 1024;
      switch((v31 >> 10))
      {
        case 0u:
          int v32 = v105 | 0x10;
          goto LABEL_40;
        case 1u:
          int v32 = v105 | 0x20;
          goto LABEL_40;
        case 3u:
          int v32 = v105 | 0x30;
          goto LABEL_40;
        case 7u:
          int v32 = v105 | 0x40;
LABEL_40:
          int v105 = v32;
          break;
        default:
          _NSCoreDataLog( 5LL,  (uint64_t)@"ignoring unsupported page_size specified as truncate option: %@",  v25,  v26,  v27,  v28,  v29,  v30,  v24);
          break;
      }
    }

    uint64_t v33 = (void *)[v19 objectForKey:@"auto_vacuum"];
    if (!v33)
    {
      int v37 = v105 | 0xC;
LABEL_54:
      int v105 = v37;
      goto LABEL_55;
    }

    uint64_t v34 = v33;
    if ([v33 isNSString])
    {
      uint64_t v35 = [v34 lowercaseString];
      if (([@"incremental" isEqualToString:v35] & 1) != 0
        || ([@"2" isEqualToString:v35] & 1) != 0)
      {
        unsigned int v36 = 2;
LABEL_53:
        int v37 = v105 | dword_1868D6170[v36];
        goto LABEL_54;
      }

      if (([@"full" isEqualToString:v35] & 1) != 0
        || ([@"1" isEqualToString:v35] & 1) != 0)
      {
        unsigned int v36 = 1;
        goto LABEL_53;
      }

      if (([@"off" isEqualToString:v35] & 1) != 0
        || ([@"0" isEqualToString:v35] & 1) != 0)
      {
        unsigned int v36 = 0;
        goto LABEL_53;
      }
    }

    else
    {
      unsigned int v36 = [v34 intValue];
      if (v36 <= 2) {
        goto LABEL_53;
      }
    }

    _NSCoreDataLog( 5LL,  (uint64_t)@"unsupported auto_vacuum setting specified as truncate option: %@",  v38,  v39,  v40,  v41,  v42,  v43,  (uint64_t)v34);
  }

+ (BOOL)_rekeyPersistentStoreAtURL:(void *)a3 options:(void *)a4 withKey:(uint64_t *)a5 error:
{
  BOOL v9 = (const char *)objc_msgSend((id)objc_msgSend(a2, "path"), "fileSystemRepresentation");
  if (+[_PFRoutines _isInMemoryStoreURL:]((uint64_t)&OBJC_CLASS____PFRoutines, a2))
  {
    if (a5)
    {
      uint64_t v10 = (void *)MEMORY[0x189607870];
      uint64_t v11 = *MEMORY[0x189607460];
      uint64_t v12 = objc_msgSend( MEMORY[0x189603F68],  "dictionaryWithObjectsAndKeys:",  @"In-memory stores do not support rekeying",  *MEMORY[0x1896075E0],  0);
LABEL_14:
      uint64_t v17 = [v10 errorWithDomain:v11 code:134060 userInfo:v12];
      BOOL result = 0LL;
      *a5 = v17;
      return result;
    }

    return 0LL;
  }

  if (![a4 length])
  {
    if (a5)
    {
      uint64_t v10 = (void *)MEMORY[0x189607870];
      uint64_t v11 = *MEMORY[0x189607460];
      uint64_t v12 = objc_msgSend( MEMORY[0x189603F68],  "dictionaryWithObjectsAndKeys:",  @"New key value must not be empty",  *MEMORY[0x1896075E0],  0);
      goto LABEL_14;
    }

    return 0LL;
  }

  __int128 v13 = (void *)[a3 objectForKey:@"NSSQLitePragmasOption"];
  int v14 = 6;
  if (v13)
  {
    if (_NSSQLiteConnectionLockProxyValueFromPragmas(v13)) {
      int v14 = 38;
    }
    else {
      int v14 = 6;
    }
  }

  uint64_t v15 = [a3 valueForKey:@"NSPersistentStoreFileProtectionKey"];
  if (v15)
  {
    uint64_t v16 = v15;
    if ([(id)*MEMORY[0x189607538] isEqualToString:v15])
    {
      v14 |= 0x400000u;
    }

    else if ([(id)*MEMORY[0x189607518] isEqualToString:v16])
    {
      v14 |= 0x300000u;
    }

    else if ([(id)*MEMORY[0x189607510] isEqualToString:v16])
    {
      v14 |= 0x200000u;
    }

    else if ([(id)*MEMORY[0x189607508] isEqualToString:v16])
    {
      v14 |= 0x100000u;
    }

    else if ([(id)*MEMORY[0x189607528] isEqualToString:v16])
    {
      v14 |= 0x700000u;
    }

    else
    {
      _NSCoreDataLog( 1LL,  (uint64_t)@"Unrecognized value '%@' passed into options for NSPersistentStoreFileProtectionKey",  v19,  v20,  v21,  v22,  v23,  v24,  v16);
    }
  }

  uint64_t v35 = 0LL;
  if (objc_msgSend((id)objc_msgSend(a2, "query"), "length"))
  {
    objc_opt_self();
    BOOL v9 = (const char *)objc_msgSend((id)objc_msgSend(a2, "absoluteString"), "fileSystemRepresentation");
  }

  Class v25 = +[NSSQLCore databaseKeyFromOptionsDictionary:]((uint64_t)&OBJC_CLASS___NSSQLCore, a3);
  int v26 = +[NSSQLiteConnection openAtPath:withKey:handle:flags:module:checkpointOnClose:]( (uint64_t)&OBJC_CLASS___NSSQLiteConnection,  v9,  v25,  &v35,  v14,  1);
  if (v26 == 14)
  {
    int v27 = -6;
    while (1)
    {
      uint64_t v28 = v35;
      if (v35)
      {
        uint64_t v29 = [NSString stringWithUTF8String:sqlite3_errmsg(v35)];
        sqlite3_close_v2(v28);
        uint64_t v35 = 0LL;
      }

      else
      {
        uint64_t v29 = [NSString stringWithUTF8String:sqlite3_errstr(14)];
      }

      usleep(0x4E20u);
      if (__CFADD__(v27++, 1)) {
        break;
      }
      Class v31 = +[NSSQLCore databaseKeyFromOptionsDictionary:]((uint64_t)&OBJC_CLASS___NSSQLCore, a3);
      int v32 = +[NSSQLiteConnection openAtPath:withKey:handle:flags:module:checkpointOnClose:]( (uint64_t)&OBJC_CLASS___NSSQLiteConnection,  v9,  v31,  &v35,  v14,  1);
      if (v32 != 14)
      {
        int v33 = v32;
        goto LABEL_36;
      }
    }

    uint64_t v34 = 0LL;
    int v33 = 14;
  }

  else
  {
    int v33 = v26;
    uint64_t v29 = 0LL;
LABEL_36:
    uint64_t v34 = v35;
    if (!v33)
    {
      [a4 bytes];
      [a4 length];
      int v33 = sqlite3_rekey_v2();
      if (v33) {
        uint64_t v29 = [NSString stringWithUTF8String:sqlite3_errmsg(v34)];
      }
    }
  }

  sqlite3_close_v2(v34);
  if (a5)
  {
    if (v33) {
      *a5 = objc_msgSend( MEMORY[0x189607870],  "errorWithDomain:code:userInfo:",  *MEMORY[0x189607460],  134180,  objc_msgSend(MEMORY[0x189603F68], "dictionaryWithObjectsAndKeys:", v29, *MEMORY[0x1896075E0], 0));
    }
  }

  return v33 == 0;
}

- (void)_clearTransactionCaches
{
  uint64_t v39 = *MEMORY[0x1895F89C0];
  stat v2 = *(dispatch_queue_s **)(a1 + 8);
  if (v2) {
    dispatch_assert_queue_V2(v2);
  }
  __int128 v34 = 0u;
  __int128 v35 = 0u;
  __int128 v32 = 0u;
  __int128 v33 = 0u;
  BOOL v3 = *(void **)(a1 + 216);
  uint64_t v4 = [v3 countByEnumeratingWithState:&v32 objects:v38 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v33;
    do
    {
      for (uint64_t i = 0LL; i != v5; ++i)
      {
        if (*(void *)v33 != v6) {
          objc_enumerationMutation(v3);
        }
        Value = (void *)CFDictionaryGetValue( *(CFDictionaryRef *)(a1 + 216),  *(const void **)(*((void *)&v32 + 1) + 8 * i));
        __int128 v28 = 0u;
        __int128 v29 = 0u;
        __int128 v30 = 0u;
        __int128 v31 = 0u;
        uint64_t v9 = [Value countByEnumeratingWithState:&v28 objects:v37 count:16];
        if (v9)
        {
          uint64_t v10 = v9;
          uint64_t v11 = *(void *)v29;
          do
          {
            for (uint64_t j = 0LL; j != v10; ++j)
            {
              if (*(void *)v29 != v11) {
                objc_enumerationMutation(Value);
              }
              __int128 v13 = (void *)CFDictionaryGetValue( (CFDictionaryRef)Value,  *(const void **)(*((void *)&v28 + 1) + 8 * j));
              -[NSSQLiteStatement clearCaches:](v13, 0);
              int v14 = *(__CFDictionary **)(a1 + 152);
              if (v13) {
                BOOL v15 = v14 == 0LL;
              }
              else {
                BOOL v15 = 1;
              }
              if (!v15) {
                CFDictionaryRemoveValue(v14, v13);
              }
            }

            uint64_t v10 = [Value countByEnumeratingWithState:&v28 objects:v37 count:16];
          }

          while (v10);
        }
      }

      uint64_t v5 = [v3 countByEnumeratingWithState:&v32 objects:v38 count:16];
    }

    while (v5);
  }

  CFDictionaryRemoveAllValues(*(CFMutableDictionaryRef *)(a1 + 216));
  __int128 v26 = 0u;
  __int128 v27 = 0u;
  __int128 v24 = 0u;
  __int128 v25 = 0u;
  uint64_t v16 = *(void **)(a1 + 224);
  uint64_t v17 = [v16 countByEnumeratingWithState:&v24 objects:v36 count:16];
  if (v17)
  {
    uint64_t v18 = v17;
    uint64_t v19 = *(void *)v25;
    do
    {
      for (uint64_t k = 0LL; k != v18; ++k)
      {
        if (*(void *)v25 != v19) {
          objc_enumerationMutation(v16);
        }
        uint64_t v21 = (void *)CFDictionaryGetValue( *(CFDictionaryRef *)(a1 + 224),  *(const void **)(*((void *)&v24 + 1) + 8 * k));
        -[NSSQLiteStatement clearCaches:](v21, 0);
        uint64_t v22 = *(__CFDictionary **)(a1 + 152);
        if (v21) {
          BOOL v23 = v22 == 0LL;
        }
        else {
          BOOL v23 = 1;
        }
        if (!v23) {
          CFDictionaryRemoveValue(v22, v21);
        }
      }

      uint64_t v18 = [v16 countByEnumeratingWithState:&v24 objects:v36 count:16];
    }

    while (v18);
  }

  CFDictionaryRemoveAllValues(*(CFMutableDictionaryRef *)(a1 + 224));
}

- (void)clearTempTablesBindingsForStatement:(uint64_t)a1
{
  uint64_t v30 = *MEMORY[0x1895F89C0];
  uint64_t v4 = *(dispatch_queue_s **)(a1 + 8);
  if (v4) {
    dispatch_assert_queue_V2(v4);
  }
  BOOL result = (void *)[a2 bindIntarrays];
  if (result)
  {
    uint64_t v6 = result;
    __int128 v27 = 0u;
    __int128 v28 = 0u;
    __int128 v25 = 0u;
    __int128 v26 = 0u;
    BOOL result = (void *)[result countByEnumeratingWithState:&v25 objects:v29 count:16];
    if (result)
    {
      uint64_t v7 = result;
      uint64_t v8 = *(void *)v26;
      do
      {
        uint64_t v9 = 0LL;
        do
        {
          if (*(void *)v26 != v8) {
            objc_enumerationMutation(v6);
          }
          uint64_t v10 = *(void **)(*((void *)&v25 + 1) + 8LL * (void)v9);
          uint64_t v11 = *(dispatch_queue_s **)(a1 + 8);
          if (v11) {
            dispatch_assert_queue_V2(v11);
          }
          int v12 = [v10 index];
          if (v12 < (int)[*(id *)(a1 + 304) count])
          {
            [*(id *)(a1 + 304) objectAtIndex:v12];
            uint64_t v13 = sqlite3_intarray_bind();
            if ((_DWORD)v13)
            {
              uint64_t v20 = *MEMORY[0x189603A58];
              uint64_t v21 = v13;
              uint64_t v22 = objc_msgSend( NSString,  "stringWithFormat:",  @"CoreData: SQLite: error: Failed to clear contents of intarray. SQLite error code: %d",  v13);
              id v23 = +[_NSCoreDataException exceptionWithName:code:reason:userInfo:]( (uint64_t)_NSCoreDataException,  v20,  134180,  v22,  (void *)objc_msgSend( MEMORY[0x189603F68],  "dictionaryWithObject:forKey:",  objc_msgSend(MEMORY[0x189607968], "numberWithInt:", v21),  @"NSSQLiteErrorDomain"));
              objc_exception_throw(v23);
            }

            if (+[NSSQLCore debugDefault](&OBJC_CLASS___NSSQLCore, "debugDefault") >= 1) {
              _NSCoreDataLog(4LL, (uint64_t)@"Bound intarray values.", v14, v15, v16, v17, v18, v19, v24);
            }
          }

          uint64_t v9 = (char *)v9 + 1;
        }

        while (v7 != v9);
        BOOL result = (void *)[v6 countByEnumeratingWithState:&v25 objects:v29 count:16];
        uint64_t v7 = result;
      }

      while (result);
    }
  }

  return result;
}

- (dispatch_queue_s)_clearCachedStatements
{
  uint64_t v24 = *MEMORY[0x1895F89C0];
  if (!result) {
    return result;
  }
  uint64_t v1 = result;
  stat v2 = result[1];
  if (v2) {
    dispatch_assert_queue_V2(v2);
  }
  BOOL v3 = (const __CFDictionary *)v1[19];
  if (v3)
  {
    unint64_t Count = CFDictionaryGetCount(v3);
    unint64_t v5 = Count;
    if (Count <= 1) {
      uint64_t v6 = 1LL;
    }
    else {
      uint64_t v6 = Count;
    }
    if (Count >= 0x201) {
      uint64_t v7 = 1LL;
    }
    else {
      uint64_t v7 = v6;
    }
    uint64_t v8 = (const void **)((char *)&v19 - ((8 * v7 + 15) & 0xFFFFFFFFFFFFFFF0LL));
    if (Count >= 0x201)
    {
      uint64_t v8 = (const void **)NSAllocateScannedUncollectable();
      CFDictionaryGetKeysAndValues((CFDictionaryRef)v1[19], v8, 0LL);
    }

    else
    {
      bzero((char *)&v19 - ((8 * v7 + 15) & 0xFFFFFFFFFFFFFFF0LL), 8 * v6);
      CFDictionaryGetKeysAndValues((CFDictionaryRef)v1[19], v8, 0LL);
      if (!v5) {
        goto LABEL_23;
      }
    }

    uint64_t v9 = 0LL;
    do
    {
      uint64_t v10 = v8[v9];
      Value = (id *)CFDictionaryGetValue((CFDictionaryRef)v1[19], v10);
      if (Value && (id WeakRetained = objc_loadWeakRetained(Value + 1)) != 0LL)
      {
        uint64_t v13 = WeakRetained;
        -[NSSQLiteStatement clearCaches:](WeakRetained, 0);
      }

      else
      {
        CFDictionaryRemoveValue((CFMutableDictionaryRef)v1[19], v10);
      }

      ++v9;
    }

    while (v5 != v9);
    if (v5 >= 0x201) {
      NSZoneFree(0LL, v8);
    }
  }

- (void)beginTransaction
{
  if (a1)
  {
    stat v2 = (void *)MEMORY[0x186E3E5D8]();
    -[NSSQLiteConnection connect](a1);
    -[NSSQLiteConnection _ensureNoTransactionOpen](a1);
    -[NSSQLiteConnection _ensureNoStatementPrepared](a1);
    BOOL v3 = *(NSSQLiteStatement **)(a1 + 128);
    if (!v3)
    {
      if (*(void *)(a1 + 72))
      {
        if (+[NSPersistentStoreCoordinator _shouldDebugAllTaskAssertions]())
        {
          int v15 = 0;
          if (!sqlite3_file_control(*(sqlite3 **)(a1 + 72), 0LL, 103, &v15) && v15 >= 2)
          {
            objc_opt_self();
            uint64_t v4 = [NSString stringWithUTF8String:"A task assertion should be active when this database is locked"];
            _NSCoreDataLog(17LL, v4, v5, v6, v7, v8, v9, v10, v14);
            uint64_t v11 = (os_log_s *)__pflogFaultLog;
            if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
            {
              LOWORD(v14) = 0;
              _os_log_fault_impl( &dword_186681000,  v11,  OS_LOG_TYPE_FAULT,  "CoreData: A task assertion should be active when this database is locked",  (uint8_t *)&v14,  2u);
            }
          }
        }
      }

      BOOL v3 = -[NSSQLiteStatement initWithEntity:sqlString:]( objc_alloc(&OBJC_CLASS___NSSQLiteStatement),  "initWithEntity:sqlString:",  0LL,  @"BEGIN EXCLUSIVE");
      *(void *)(a1 + 128) = v3;
    }

    -[NSSQLiteConnection prepareSQLStatement:](a1, v3);
    int v12 = *(sqlite3_stmt **)(a1 + 128);
    if (v12) {
      uint64_t v13 = *((void *)v12 + 8);
    }
    else {
      uint64_t v13 = 0LL;
    }
    if (*(void *)(a1 + 80) != v13) {
      -[NSSQLiteConnection cacheCurrentDBStatementOn:](a1, v12);
    }
    _execute(a1);
    -[NSSQLiteConnection resetSQLStatement](a1);
    *(_BYTE *)(a1 + 41) = 0;
    if (!*(_BYTE *)(a1 + 40))
    {
      *(_BYTE *)(a1 + 40) = 1;
      objc_msgSend( (id)objc_msgSend(MEMORY[0x189607958], "defaultCenter"),  "postNotificationName:object:",  @"NSSQLConnectionBeginTransactionNotification",  a1);
    }

    objc_autoreleasePoolPop(v2);
  }

- (void)cacheCurrentDBStatementOn:(uint64_t)a1
{
  if (a1)
  {
    uint64_t v4 = *(dispatch_queue_s **)(a1 + 8);
    if (v4) {
      dispatch_assert_queue_V2(v4);
    }
    uint64_t v5 = *(sqlite3_stmt **)(a1 + 80);
    if (v5)
    {
      -[NSSQLiteStatement setCachedSQLiteStatement:forConnection:](a2, v5, a1);
      -[NSSQLiteConnection addVMCachedStatement:](a1, a2);
    }
  }

- (void)commitTransaction
{
  v28[1] = *MEMORY[0x1895F89C0];
  if (!a1) {
    return;
  }
  stat v2 = (void *)MEMORY[0x186E3E5D8]();
  if ((*(_BYTE *)(a1 + 312) & 2) != 0)
  {
    BOOL v3 = (void *)MEMORY[0x189603F70];
    uint64_t v4 = *MEMORY[0x189603A58];
    uint64_t v5 = NSStringFromSelector(sel_commitTransaction);
    uint64_t v6 = (objc_class *)objc_opt_class();
    NSStringFromClass(v6);
    uint64_t v26 = (uint64_t)v5;
    [v3 raise:v4 format:@"%@ -- %@ %p: attempted to commit a transaction while a fetch was in progress"];
  }

  if (!*(_BYTE *)(a1 + 41) && (*(_BYTE *)(a1 + 312) & 0x20) != 0)
  {
    uint64_t v7 = objc_msgSend( (id)objc_msgSend(*(id *)(a1 + 368), "objectForKey:", @"NSSQLitePragmasOption"),  "objectForKey:",  @"auto_vacuum");
    if (!v7 || (uint64_t v8 = (__CFString *)v7, [MEMORY[0x189603FE8] null] == v7))
    {
      uint64_t v8 = @"2";
    }

    else if (-[__CFString isNSString](v8, "isNSString"))
    {
      uint64_t v8 = (__CFString *)-[__CFString lowercaseString](v8, "lowercaseString");
    }

    uint64_t v9 = -[NSSQLiteConnection copyRawIntegerRowsForSQL:](a1, @"pragma auto_vacuum");
    if (v9)
    {
      uint64_t v10 = v9;
      if (CFArrayGetCount(v9) && *(void *)CFArrayGetValueAtIndex(v10, 0LL))
      {
        uint64_t v11 = *(void *)CFArrayGetValueAtIndex(v10, 1LL);
        CFRelease(v10);
        if (v11)
        {
          uint64_t v26 = (uint64_t)v8;
          CFMutableArrayRef v12 = -[NSSQLiteConnection copyRawIntegerRowsForSQL:]( a1,  (void *)[NSString stringWithFormat:@"pragma auto_vacuum=%@"]);
          if (v12) {
            CFRelease(v12);
          }
          if ([@"2" isEqualToString:v8])
          {
            uint64_t v13 = 0LL;
          }

          else
          {
            int v25 = [@"incremental" isEqualToString:v8];
            uint64_t v13 = 0x7FFFFFFFFFFFFFFFLL;
            if (v25) {
              uint64_t v13 = 0LL;
            }
          }

          goto LABEL_21;
        }
      }

      else
      {
        CFRelease(v10);
      }
    }

    uint64_t v8 = @"0";
    uint64_t v13 = 0x7FFFFFFFFFFFFFFFLL;
LABEL_21:
    *(void *)(a1 + 296) = v13;
    *(void *)buf = @"_NSAutoVacuumLevel";
    v28[0] = v8;
    -[NSSQLCore _updateAutoVacuumMetadataWithValues:]( *(unsigned __int8 **)(a1 + 16),  (void *)[MEMORY[0x189603F68] dictionaryWithObjects:v28 forKeys:buf count:1]);
    *(_DWORD *)(a1 + 312) &= ~0x20u;
  }

  -[NSSQLiteConnection _ensureNoStatementPrepared](a1);
  uint64_t v14 = *(NSSQLiteStatement **)(a1 + 136);
  if (!v14)
  {
    if (*(void *)(a1 + 72))
    {
      if (+[NSPersistentStoreCoordinator _shouldDebugAllTaskAssertions]())
      {
        LODWORD(v28[0]) = 0;
        if (!sqlite3_file_control(*(sqlite3 **)(a1 + 72), 0LL, 103, v28) && SLODWORD(v28[0]) >= 2)
        {
          objc_opt_self();
          uint64_t v15 = [NSString stringWithUTF8String:"A task assertion should be active when this database is locked"];
          _NSCoreDataLog(17LL, v15, v16, v17, v18, v19, v20, v21, v26);
          __int128 v22 = (os_log_s *)__pflogFaultLog;
          if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_fault_impl( &dword_186681000,  v22,  OS_LOG_TYPE_FAULT,  "CoreData: A task assertion should be active when this database is locked",  buf,  2u);
          }
        }
      }
    }

    uint64_t v14 = -[NSSQLiteStatement initWithEntity:sqlString:]( objc_alloc(&OBJC_CLASS___NSSQLiteStatement),  "initWithEntity:sqlString:",  0LL,  @"COMMIT");
    *(void *)(a1 + 136) = v14;
  }

  -[NSSQLiteConnection prepareSQLStatement:](a1, v14);
  id v23 = *(sqlite3_stmt **)(a1 + 136);
  if (v23) {
    uint64_t v24 = *((void *)v23 + 8);
  }
  else {
    uint64_t v24 = 0LL;
  }
  if (*(void *)(a1 + 80) != v24) {
    -[NSSQLiteConnection cacheCurrentDBStatementOn:](a1, v23);
  }
  _execute(a1);
  -[NSSQLiteConnection resetSQLStatement](a1);
  *(_BYTE *)(a1 + 41) = 0;
  -[NSSQLiteConnection _clearTransactionCaches](a1);
  if (*(_BYTE *)(a1 + 40))
  {
    *(_BYTE *)(a1 + 40) = 0;
    objc_msgSend( (id)objc_msgSend(MEMORY[0x189607958], "defaultCenter"),  "postNotificationName:object:",  @"NSSQLConnectionCommitTransactionNotification",  a1);
  }

  objc_autoreleasePoolPop(v2);
}

- (uint64_t)_clearBindVariablesForInsertedRow
{
  uint64_t v27 = *MEMORY[0x1895F89C0];
  stat v2 = *(dispatch_queue_s **)(a1 + 8);
  if (v2) {
    dispatch_assert_queue_V2(v2);
  }
  BOOL v3 = (void *)[*(id *)(a1 + 48) entity];
  uint64_t v4 = (void *)[v3 attributeColumns];
  uint64_t v5 = (const __CFArray *)[*(id *)(a1 + 48) bindVariables];
  int v6 = objc_msgSend((id)objc_msgSend(v3, "foreignEntityKeyColumns"), "count");
  __int128 v21 = 0u;
  __int128 v22 = 0u;
  unsigned int v7 = v6 + objc_msgSend((id)objc_msgSend(v3, "foreignOrderKeyColumns"), "count") + 3;
  __int128 v23 = 0u;
  __int128 v24 = 0u;
  uint64_t v8 = (void *)[v3 foreignKeyColumns];
  uint64_t v9 = [v8 countByEnumeratingWithState:&v21 objects:v26 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v22;
    do
    {
      uint64_t v12 = 0LL;
      do
      {
        if (*(void *)v22 != v11) {
          objc_enumerationMutation(v8);
        }
        v7 += objc_msgSend( (id)objc_msgSend(*(id *)(*((void *)&v21 + 1) + 8 * v12++), "toOneRelationship"),  "isConstrained") ^ 1;
      }

      while (v10 != v12);
      uint64_t v10 = [v8 countByEnumeratingWithState:&v21 objects:v26 count:16];
    }

    while (v10);
  }

  __int128 v19 = 0u;
  __int128 v20 = 0u;
  __int128 v17 = 0u;
  __int128 v18 = 0u;
  uint64_t result = [v4 countByEnumeratingWithState:&v17 objects:v25 count:16];
  if (result)
  {
    uint64_t v14 = result;
    uint64_t v15 = *(void *)v18;
    do
    {
      uint64_t v16 = 0LL;
      do
      {
        if (*(void *)v18 != v15) {
          objc_enumerationMutation(v4);
        }
        if (([*(id *)(*((void *)&v17 + 1) + 8 * v16) isConstrained] & 1) == 0) {
          objc_msgSend((id)CFArrayGetValueAtIndex(v5, v7++), "setValue:", 0);
        }
        ++v16;
      }

      while (v14 != v16);
      uint64_t result = [v4 countByEnumeratingWithState:&v17 objects:v25 count:16];
      uint64_t v14 = result;
    }

    while (result);
  }

  return result;
}

- (uint64_t)insertRow:(uint64_t)result
{
  uint64_t v85 = *MEMORY[0x1895F89C0];
  if (result)
  {
    uint64_t v62 = result;
    BOOL v3 = *(dispatch_queue_s **)(result + 8);
    if (v3) {
      dispatch_assert_queue_V2(v3);
    }
    if (!a2 || (*(_BYTE *)(a2 + 16) & 1) != 0) {
      uint64_t v4 = 0LL;
    }
    else {
      uint64_t v4 = (const void *)[*(id *)(*(void *)(a2 + 40) + 16) _storeInfo1];
    }
    uint64_t v5 = -[NSSQLiteConnection statementCacheForEntity:](v62, v4);
    Class v60 = v5;
    if (v5
      && (insertStatementCache = v5->_insertStatementCache) != 0LL
      && (cachedSQLiteStatement = insertStatementCache->_cachedSQLiteStatement) != 0LL)
    {
      if (+[NSSQLCore debugDefault](&OBJC_CLASS___NSSQLCore, "debugDefault") >= 1)
      {
        int v7 = *(unsigned __int8 *)(v62 + 42);
        uint64_t v8 = -[NSSQLiteStatement sqlString](insertStatementCache, "sqlString");
        if (v7) {
          uint64_t v15 = @"\x1B[32msql: \x1B[34m\x1B[47m%@\x1B[0m";
        }
        else {
          uint64_t v15 = @"%@";
        }
        _NSCoreDataLog(6LL, (uint64_t)v15, v9, v10, v11, v12, v13, v14, v8);
      }

      *(void *)(v62 + 48) = insertStatementCache;
      uint64_t v16 = *(dispatch_queue_s **)(v62 + 8);
      if (v16) {
        dispatch_assert_queue_V2(v16);
      }
      context = (void *)MEMORY[0x186E3E5D8]();
      if (!a2 || (*(_BYTE *)(a2 + 16) & 1) != 0) {
        __int128 v17 = 0LL;
      }
      else {
        __int128 v17 = (void *)[*(id *)(*(void *)(a2 + 40) + 16) _storeInfo1];
      }
      __int128 v21 = (void *)[v17 foreignKeyColumns];
      __int128 v22 = (void *)[v17 foreignEntityKeyColumns];
      obuint64_t j = (id)[v17 foreignOrderKeyColumns];
      id v63 = (id)[v17 attributeColumns];
      __int128 v23 = (const __CFArray *)[*(id *)(v62 + 48) bindVariables];
      ValueAtIndex = (void *)CFArrayGetValueAtIndex(v23, 0LL);
      if (a2) {
        uint64_t v25 = [*(id *)(*(void *)(a2 + 40) + 16) _referenceData64];
      }
      else {
        uint64_t v25 = 0LL;
      }
      [ValueAtIndex setInt64:v25];
      uint64_t v26 = (void *)CFArrayGetValueAtIndex(v23, 1LL);
      if (a2 && (uint64_t v27 = [*(id *)(*(void *)(a2 + 40) + 16) _storeInfo1]) != 0) {
        uint64_t v28 = *(unsigned int *)(v27 + 184);
      }
      else {
        uint64_t v28 = 0LL;
      }
      [v26 setUnsignedInt:v28];
      __int128 v29 = (void *)CFArrayGetValueAtIndex(v23, 2LL);
      if (a2) {
        uint64_t v30 = *(unsigned int *)(*(void *)(a2 + 40) + 12LL);
      }
      else {
        uint64_t v30 = 0LL;
      }
      [v29 setInt64:v30];
      __int128 v79 = 0u;
      __int128 v80 = 0u;
      __int128 v77 = 0u;
      __int128 v78 = 0u;
      uint64_t v31 = [v21 countByEnumeratingWithState:&v77 objects:v84 count:16];
      if (v31)
      {
        uint64_t v32 = *(void *)v78;
        unsigned int v33 = 3;
        do
        {
          for (uint64_t i = 0LL; i != v31; ++i)
          {
            if (*(void *)v78 != v32) {
              objc_enumerationMutation(v21);
            }
            __int128 v35 = *(void **)(*((void *)&v77 + 1) + 8 * i);
            if ((objc_msgSend((id)objc_msgSend(v35, "toOneRelationship"), "isConstrained") & 1) == 0)
            {
              uint64_t v36 = -[NSSQLRow foreignKeyForSlot:](a2, [v35 slot]);
              objc_msgSend((id)CFArrayGetValueAtIndex(v23, v33++), "setInt64:", v36);
            }
          }

          uint64_t v31 = [v21 countByEnumeratingWithState:&v77 objects:v84 count:16];
        }

        while (v31);
      }

      else
      {
        unsigned int v33 = 3;
      }

      __int128 v75 = 0u;
      __int128 v76 = 0u;
      __int128 v73 = 0u;
      __int128 v74 = 0u;
      uint64_t v37 = [v22 countByEnumeratingWithState:&v73 objects:v83 count:16];
      if (v37)
      {
        uint64_t v38 = *(void *)v74;
        do
        {
          uint64_t v39 = 0LL;
          unsigned int v40 = v33;
          do
          {
            if (*(void *)v74 != v38) {
              objc_enumerationMutation(v22);
            }
            unsigned int v41 = [*(id *)(*((void *)&v73 + 1) + 8 * v39) slot];
            if (a2) {
              uint64_t v42 = *(unsigned __int16 *)(a2
            }
                                        + _NSSQLRowInstanceSize
                                        + ((2 * *(_DWORD *)(a2 + 16)) & 0x1FFF8)
            else {
              uint64_t v42 = 0LL;
            }
            objc_msgSend((id)CFArrayGetValueAtIndex(v23, v33 + v39++), "setUnsignedInt:", v42);
          }

          while (v37 != v39);
          uint64_t v43 = [v22 countByEnumeratingWithState:&v73 objects:v83 count:16];
          uint64_t v37 = v43;
          v33 += v39;
        }

        while (v43);
        unsigned int v33 = v40 + v39;
      }

      __int128 v71 = 0u;
      __int128 v72 = 0u;
      __int128 v69 = 0u;
      __int128 v70 = 0u;
      uint64_t v44 = [obj countByEnumeratingWithState:&v69 objects:v82 count:16];
      if (v44)
      {
        uint64_t v45 = *(void *)v70;
        do
        {
          uint64_t v46 = 0LL;
          unsigned int v47 = v33;
          do
          {
            if (*(void *)v70 != v45) {
              objc_enumerationMutation(obj);
            }
            unsigned int v48 = [*(id *)(*((void *)&v69 + 1) + 8 * v46) slot];
            if (a2) {
              uint64_t v49 = *(unsigned int *)(a2 + _NSSQLRowInstanceSize + ((2 * *(_DWORD *)(a2 + 16)) & 0x1FFF8) + 4LL * v48);
            }
            else {
              uint64_t v49 = 0LL;
            }
            objc_msgSend((id)CFArrayGetValueAtIndex(v23, v33 + v46++), "setUnsignedInt:", v49);
          }

          while (v44 != v46);
          uint64_t v50 = [obj countByEnumeratingWithState:&v69 objects:v82 count:16];
          uint64_t v44 = v50;
          v33 += v46;
        }

        while (v50);
        unsigned int v33 = v47 + v46;
      }

      __int128 v67 = 0u;
      __int128 v68 = 0u;
      __int128 v65 = 0u;
      __int128 v66 = 0u;
      uint64_t v51 = [v63 countByEnumeratingWithState:&v65 objects:v81 count:16];
      if (v51)
      {
        uint64_t v52 = *(void *)v66;
        do
        {
          for (uint64_t j = 0LL; j != v51; ++j)
          {
            if (*(void *)v66 != v52) {
              objc_enumerationMutation(v63);
            }
            Class v54 = *(void **)(*((void *)&v65 + 1) + 8 * j);
            if (([v54 isConstrained] & 1) == 0)
            {
              int v55 = (void *)[v54 attributeDescription];
              if (v55 && [v55 superCompositeAttribute])
              {
                uint64_t v56 = -[NSPropertyDescription _elementPath]((__CFString *)[v54 propertyDescription]);
                CFDateRef v57 = (CFDateRef)-[__CFDate valueForKeyPath:]( -[NSSQLRow attributeValueForSlot:]((CFDateRef)a2, [v54 slot]),  "valueForKeyPath:",  v56);
              }

              else
              {
                CFDateRef v57 = -[NSSQLRow attributeValueForSlot:]((CFDateRef)a2, [v54 slot]);
              }

              objc_msgSend((id)CFArrayGetValueAtIndex(v23, v33++), "setValue:", v57);
            }
          }

          uint64_t v51 = [v63 countByEnumeratingWithState:&v65 objects:v81 count:16];
        }

        while (v51);
      }

      objc_autoreleasePoolPop(context);
      uint64_t v18 = v62;
      *(void *)(v62 + 80) = cachedSQLiteStatement;
      id v58 = *(id *)(v62 + 48);
    }

    else
    {
      uint64_t v18 = v62;
      __int128 v19 = v5;
      __int128 v20 = -[NSSQLiteAdapter newInsertStatementWithRow:]((NSSQLiteStatement *)[(id)v62 adapter], a2);
      -[NSSQLiteConnection prepareSQLStatement:](v62, v20);
      -[NSSQLiteStatement setCachedSQLiteStatement:forConnection:]( *(sqlite3_stmt **)(v18 + 48),  *(sqlite3_stmt **)(v18 + 80),  v18);
      -[NSSQLiteStatementCache cacheInsertStatement:](v19, *(void **)(v62 + 48));

      -[NSSQLiteConnection addVMCachedStatement:](v18, *(const void **)(v18 + 48));
    }

    [(id)v18 execute];
    if (!*(void *)(v18 + 80)) {
      -[NSSQLiteStatementCache cacheInsertStatement:](v60, 0LL);
    }
    -[NSSQLiteConnection _clearBindVariablesForInsertedRow](v18);
    -[NSSQLiteConnection resetSQLStatement](v18);
    uint64_t result = *(void *)(v18 + 72);
    if (result) {
      uint64_t result = sqlite3_changes((sqlite3 *)result);
    }
    *(_DWORD *)(v18 + 88) = result;
  }

  return result;
}

- (void)addVMCachedStatement:(uint64_t)a1
{
  if (a1)
  {
    uint64_t v4 = -[_PFWeakReference initWithObject:](objc_alloc(&OBJC_CLASS____PFWeakReference), "initWithObject:", a2);
    if (v4)
    {
      uint64_t v5 = v4;
      CFDictionarySetValue(*(CFMutableDictionaryRef *)(a1 + 152), a2, v4);
      uint64_t v4 = v5;
    }
  }

- (NSSQLitePrefetchRequestCache)prefetchRequestCache
{
  if (result)
  {
    uint64_t v1 = result;
    uint64_t result = (NSSQLitePrefetchRequestCache *)result[6]._length;
    if (!result)
    {
      uint64_t result = -[NSSQLitePrefetchRequestCache initWithSQLCore:]( objc_alloc(&OBJC_CLASS___NSSQLitePrefetchRequestCache),  "initWithSQLCore:",  v1->_length);
      v1[6]._length = (unint64_t)result;
    }
  }

  return result;
}

- (void)cacheUpdateStatement:(void *)key forEntity:(const void *)a4 andDeltasMask:
{
  uint64_t v8 = *(dispatch_queue_s **)(a1 + 8);
  if (v8) {
    dispatch_assert_queue_V2(v8);
  }
  Value = (__CFDictionary *)CFDictionaryGetValue(*(CFDictionaryRef *)(a1 + 216), key);
  if (Value)
  {
    CFMutableDictionaryRef v10 = Value;
    if (!a2)
    {
      CFDictionaryRemoveValue(Value, a4);
      return;
    }
  }

  else
  {
    if (!a2) {
      return;
    }
    v11.version = *MEMORY[0x189605240];
    *(_OWORD *)&v11.retain = *(_OWORD *)(MEMORY[0x189605240] + 8LL);
    v11.copyDescription = *(CFDictionaryCopyDescriptionCallBack *)(MEMORY[0x189605240] + 24LL);
    v11.equal = (CFDictionaryEqualCallBack)PFVectorEqual;
    v11.hash = (CFDictionaryHashCallBack)PFVectorHash;
    CFMutableDictionaryRef v10 = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x189604DB0], 0LL, &v11, MEMORY[0x189605250]);
    CFDictionarySetValue(*(CFMutableDictionaryRef *)(a1 + 216), key, v10);
  }

  CFDictionarySetValue(v10, a4, a2);
}

- (void)cacheUpdateConstrainedValuesStatement:(void *)key forEntity:
{
  int v6 = *(dispatch_queue_s **)(a1 + 8);
  if (v6) {
    dispatch_assert_queue_V2(v6);
  }
  int v7 = *(__CFDictionary **)(a1 + 224);
  if (value) {
    CFDictionarySetValue(v7, key, value);
  }
  else {
    CFDictionaryRemoveValue(v7, key);
  }
}

- (void)updateRow:(uint64_t)a3 forRequestContext:
{
  uint64_t v172 = *MEMORY[0x1895F89C0];
  if (a1)
  {
    uint64_t v4 = a1;
    uint64_t v5 = *(dispatch_queue_s **)(a1 + 8);
    if (v5) {
      dispatch_assert_queue_V2(v5);
    }
    if (!a2 || (*(_BYTE *)(a2 + 16) & 1) != 0) {
      key = 0LL;
    }
    else {
      key = (unsigned int *)[*(id *)(*(void *)(a2 + 40) + 16) _storeInfo1];
    }
    int v6 = (const void *)[(id)a2 objectID];
    int v7 = -[NSSQLSaveChangesRequestContext originalRowForObjectID:](a3, v6);
    if (a3) {
      uint64_t v8 = *(void **)(a3 + 32);
    }
    else {
      uint64_t v8 = 0LL;
    }
    uint64_t v9 = (void *)[v8 objectRegisteredForID:v6];
    CFMutableDictionaryRef v10 = v9;
    BOOL v11 = 0;
    if (v9 && v7)
    {
      else {
        BOOL v11 = 0;
      }
    }

    uint64_t v140 = (uint64_t)v7;
    if (!v7 || v11)
    {
      uint64_t v104 = v6;
      if ((int)-[NSSQLStoreRequestContext debugLogLevel](a3) <= 1)
      {
        if ((int)-[NSSQLStoreRequestContext debugLogLevel](a3) >= 1) {
          _NSCoreDataLog( 4LL,  (uint64_t)@"Optimistic locking failure for %@. During updateRow.  Original row = %p context version match = %d",  v124,  v125,  v126,  v127,  v128,  v129,  (uint64_t)v6);
        }
      }

      else
      {
        _NSCoreDataLog( 4LL,  (uint64_t)@"Optimistic locking failure for %@.  During updateRow.  Original row = %@ New Row = %@ context version match = %d",  v105,  v106,  v107,  v108,  v109,  v110,  (uint64_t)v6);
      }

      uint64_t v130 = &unk_189F044E8;
      if (v11)
      {
        unsigned int v131 = [v10 _versionReference];
        unint64_t v132 = v140;
        if (v140) {
          unint64_t v132 = *(unsigned int *)(*(void *)(v140 + 40) + 12LL);
        }
        if (v132 >= v131) {
          uint64_t v130 = &unk_189F04500;
        }
      }

      uint64_t v165 = v104;
      v166[0] = @"_NSCoreDataOptimisticLockingFailureConflictsKey";
      uint64_t v133 = [MEMORY[0x189603F18] arrayWithObjects:&v165 count:1];
      v166[1] = @"_NSCoreDataOptimisticLockingFailureMismatchWithObject";
      v167[0] = v133;
      v167[1] = v130;
      uint64_t v134 = [MEMORY[0x189603F68] dictionaryWithObjects:v167 forKeys:v166 count:2];
      objc_exception_throw( +[_NSCoreDataOptimisticLockingException exceptionWithName:reason:userInfo:]( &OBJC_CLASS____NSCoreDataOptimisticLockingException,  "exceptionWithName:reason:userInfo:",  *MEMORY[0x189603A58],  @"optimistic locking failure",  v134));
    }

    else
    {
      uint64_t v138 = a3;
      uint64_t v136 = (uint64_t)v6;
      if (a2) {
        uint64_t v12 = -[NSSQLRow newColumnMaskFrom:columnInclusionOptions:]((CFBitVectorRef)a2, (uint64_t)v7, 30LL);
      }
      else {
        uint64_t v12 = 0LL;
      }
      uint64_t v13 = *(dispatch_queue_s **)(v4 + 8);
      if (v13) {
        dispatch_assert_queue_V2(v13);
      }
      Value = (const __CFDictionary *)CFDictionaryGetValue(*(CFDictionaryRef *)(v4 + 216), key);
      uint64_t v139 = v4;
      if (Value
        && (uint64_t v15 = (void *)CFDictionaryGetValue(Value, v12)) != 0LL
        && (uint64_t v16 = v15, (v137 = *((void *)v15 + 8)) != 0))
      {
        if (+[NSSQLCore debugDefault](&OBJC_CLASS___NSSQLCore, "debugDefault") >= 1)
        {
          int v17 = *(unsigned __int8 *)(v4 + 42);
          uint64_t v18 = [v16 sqlString];
          if (v17) {
            uint64_t v25 = @"\x1B[32msql: \x1B[34m\x1B[47m%@\x1B[0m";
          }
          else {
            uint64_t v25 = @"%@";
          }
          _NSCoreDataLog(6LL, (uint64_t)v25, v19, v20, v21, v22, v23, v24, v18);
        }

        *(void *)(v4 + 48) = v16;
        uint64_t v26 = *(dispatch_queue_s **)(v4 + 8);
        if (v26) {
          dispatch_assert_queue_V2(v26);
        }
        context = (void *)MEMORY[0x186E3E5D8]();
        if (!a2 || (*(_BYTE *)(a2 + 16) & 1) != 0) {
          uint64_t v27 = 0LL;
        }
        else {
          uint64_t v27 = (void *)[*(id *)(*(void *)(a2 + 40) + 16) _storeInfo1];
        }
        __int128 v29 = (void *)[v27 foreignKeyColumns];
        obuint64_t j = (id)[v27 foreignEntityKeyColumns];
        id v143 = (id)[v27 foreignOrderKeyColumns];
        id v142 = (id)[v27 attributeColumns];
        uint64_t v30 = (const __CFArray *)[*(id *)(v4 + 48) bindVariables];
        __int128 v158 = 0u;
        __int128 v159 = 0u;
        __int128 v160 = 0u;
        __int128 v161 = 0u;
        uint64_t v31 = [v29 countByEnumeratingWithState:&v158 objects:v171 count:16];
        if (v31)
        {
          int v32 = 0;
          unsigned int v33 = 0;
          uint64_t v34 = *(void *)v159;
          do
          {
            uint64_t v35 = 0LL;
            int v36 = v32;
            do
            {
              if (*(void *)v159 != v34) {
                objc_enumerationMutation(v29);
              }
              uint64_t v37 = *(void **)(*((void *)&v158 + 1) + 8 * v35);
              if (CFBitVectorGetBitAtIndex(v12, (v36 + v35)))
              {
                uint64_t v38 = -[NSSQLRow foreignKeyForSlot:](a2, [v37 slot]);
                objc_msgSend((id)CFArrayGetValueAtIndex(v30, v33++), "setInt64:", v38);
              }

              ++v35;
            }

            while (v31 != v35);
            uint64_t v31 = [v29 countByEnumeratingWithState:&v158 objects:v171 count:16];
            int v32 = v36 + v35;
          }

          while (v31);
          int v39 = v36 + v35;
        }

        else
        {
          int v39 = 0;
          unsigned int v33 = 0;
        }

        __int128 v156 = 0u;
        __int128 v157 = 0u;
        __int128 v154 = 0u;
        __int128 v155 = 0u;
        uint64_t v40 = [obj countByEnumeratingWithState:&v154 objects:v170 count:16];
        if (v40)
        {
          uint64_t v41 = *(void *)v155;
          do
          {
            uint64_t v42 = 0LL;
            int v43 = v39;
            do
            {
              if (*(void *)v155 != v41) {
                objc_enumerationMutation(obj);
              }
              uint64_t v44 = *(void **)(*((void *)&v154 + 1) + 8 * v42);
              if (CFBitVectorGetBitAtIndex(v12, (v43 + v42)))
              {
                unsigned int v45 = [v44 slot];
                if (a2) {
                  uint64_t v46 = *(unsigned __int16 *)(a2
                }
                                            + _NSSQLRowInstanceSize
                                            + ((2 * *(_DWORD *)(a2 + 16)) & 0x1FFF8)
                else {
                  uint64_t v46 = 0LL;
                }
                objc_msgSend((id)CFArrayGetValueAtIndex(v30, v33++), "setUnsignedInt:", v46);
              }

              ++v42;
            }

            while (v40 != v42);
            uint64_t v47 = [obj countByEnumeratingWithState:&v154 objects:v170 count:16];
            uint64_t v40 = v47;
            int v39 = v43 + v42;
          }

          while (v47);
          int v39 = v43 + v42;
        }

        __int128 v152 = 0u;
        __int128 v153 = 0u;
        __int128 v150 = 0u;
        __int128 v151 = 0u;
        uint64_t v48 = [v143 countByEnumeratingWithState:&v150 objects:v169 count:16];
        if (v48)
        {
          uint64_t v49 = *(void *)v151;
          do
          {
            uint64_t v50 = 0LL;
            int v51 = v39;
            do
            {
              if (*(void *)v151 != v49) {
                objc_enumerationMutation(v143);
              }
              uint64_t v52 = *(void **)(*((void *)&v150 + 1) + 8 * v50);
              if (CFBitVectorGetBitAtIndex(v12, (v51 + v50)))
              {
                unsigned int v53 = [v52 slot];
                if (a2) {
                  uint64_t v54 = *(unsigned int *)(a2 + _NSSQLRowInstanceSize + ((2 * *(_DWORD *)(a2 + 16)) & 0x1FFF8) + 4LL * v53);
                }
                else {
                  uint64_t v54 = 0LL;
                }
                objc_msgSend((id)CFArrayGetValueAtIndex(v30, v33++), "setUnsignedInt:", v54);
              }

              ++v50;
            }

            while (v48 != v50);
            uint64_t v55 = [v143 countByEnumeratingWithState:&v150 objects:v169 count:16];
            uint64_t v48 = v55;
            int v39 = v51 + v50;
          }

          while (v55);
          int v39 = v51 + v50;
        }

        __int128 v148 = 0u;
        __int128 v149 = 0u;
        __int128 v146 = 0u;
        __int128 v147 = 0u;
        uint64_t v56 = [v142 countByEnumeratingWithState:&v146 objects:v168 count:16];
        if (v56)
        {
          uint64_t v57 = *(void *)v147;
          do
          {
            uint64_t v58 = 0LL;
            do
            {
              if (*(void *)v147 != v57) {
                objc_enumerationMutation(v142);
              }
              int v59 = *(void **)(*((void *)&v146 + 1) + 8 * v58);
              if (CFBitVectorGetBitAtIndex(v12, (v39 + v58)))
              {
                if ([v59 isConstrained])
                {
                  CFDateRef v60 = 0LL;
                }

                else
                {
                  int v61 = (void *)[v59 attributeDescription];
                  if (v61) {
                    BOOL v62 = [v61 superCompositeAttribute] != 0;
                  }
                  else {
                    BOOL v62 = 0;
                  }
                  CFDateRef v60 = -[NSSQLRow attributeValueForSlot:]((CFDateRef)a2, [v59 slot]);
                  if (v62) {
                    CFDateRef v60 = (CFDateRef)-[__CFDate valueForKeyPath:]( v60,  "valueForKeyPath:",  -[NSPropertyDescription _elementPath]((__CFString *)[v59 propertyDescription]));
                  }
                }

                objc_msgSend((id)CFArrayGetValueAtIndex(v30, v33++), "setValue:", v60);
              }

              ++v58;
            }

            while (v56 != v58);
            uint64_t v63 = [v142 countByEnumeratingWithState:&v146 objects:v168 count:16];
            uint64_t v56 = v63;
            v39 += v58;
          }

          while (v63);
        }

        if (v140) {
          uint64_t v64 = *(unsigned int *)(*(void *)(v140 + 40) + 12LL) + 1LL;
        }
        else {
          uint64_t v64 = 1LL;
        }
        [(id)a2 setOptLock:v64];
        ValueAtIndex = (void *)CFArrayGetValueAtIndex(v30, v33);
        if (a2)
        {
          uint64_t v66 = a2;
          uint64_t v67 = *(unsigned int *)(*(void *)(a2 + 40) + 12LL);
        }

        else
        {
          uint64_t v67 = 0LL;
          uint64_t v66 = 0LL;
        }

        BOOL v68 = v66 == 0;
        [ValueAtIndex setInt64:v67];
        __int128 v69 = (void *)CFArrayGetValueAtIndex(v30, v33 + 1);
        if (v68) {
          uint64_t v70 = 0LL;
        }
        else {
          uint64_t v70 = [*(id *)(*(void *)(a2 + 40) + 16) _referenceData64];
        }
        [v69 setInt64:v70];
        __int128 v71 = (void *)CFArrayGetValueAtIndex(v30, v33 + 2);
        if (v140) {
          uint64_t v72 = *(unsigned int *)(*(void *)(v140 + 40) + 12LL);
        }
        else {
          uint64_t v72 = 0LL;
        }
        [v71 setInt64:v72];
        objc_autoreleasePoolPop(context);
        uint64_t v4 = v139;
        *(void *)(v139 + 80) = v137;
        id v73 = *(id *)(v139 + 48);
      }

      else
      {
        uint64_t v28 = -[NSSQLiteAdapter newUpdateStatementWithRow:originalRow:withMask:]( (NSSQLiteStatement *)[(id)v4 adapter],  a2,  (uint64_t)v7,  v12);
        -[NSSQLiteConnection prepareSQLStatement:](v4, v28);
        -[NSSQLiteStatement setCachedSQLiteStatement:forConnection:]( *(sqlite3_stmt **)(v4 + 48),  *(sqlite3_stmt **)(v4 + 80),  v4);
        -[NSSQLiteConnection cacheUpdateStatement:forEntity:andDeltasMask:](v4, *(const void **)(v4 + 48), key, v12);

        -[NSSQLiteConnection addVMCachedStatement:](v4, *(const void **)(v4 + 48));
      }

      [(id)v4 execute];
      if (!*(void *)(v4 + 80)) {
        -[NSSQLiteConnection cacheUpdateStatement:forEntity:andDeltasMask:](v4, 0LL, key, v12);
      }
      __int128 v74 = *(void **)(v4 + 48);
      __int128 v75 = *(dispatch_queue_s **)(v4 + 8);
      if (v75) {
        dispatch_assert_queue_V2(v75);
      }
      __int128 v76 = (void *)[v74 entity];
      __int128 v77 = (void *)[v76 foreignKeyColumns];
      __int128 v78 = (void *)[v76 foreignEntityKeyColumns];
      __int128 v79 = (void *)[v76 foreignOrderKeyColumns];
      __int128 v80 = (void *)[v76 attributeColumns];
      uint64_t v81 = (const __CFArray *)[*(id *)(v4 + 48) bindVariables];
      __int128 v158 = 0u;
      __int128 v159 = 0u;
      __int128 v160 = 0u;
      __int128 v161 = 0u;
      unsigned int v82 = 0;
      unsigned int v83 = 0;
      uint64_t v84 = [v77 countByEnumeratingWithState:&v158 objects:v171 count:16];
      if (v84)
      {
        uint64_t v85 = *(void *)v159;
        while (1)
        {
          if (*(void *)v159 != v85) {
            objc_enumerationMutation(v77);
          }
          if (CFBitVectorGetBitAtIndex(v12, v82++)) {
            ++v83;
          }
          if (!--v84)
          {
            uint64_t v84 = [v77 countByEnumeratingWithState:&v158 objects:v171 count:16];
            if (!v84) {
              break;
            }
          }
        }
      }

      __int128 v156 = 0u;
      __int128 v157 = 0u;
      __int128 v154 = 0u;
      __int128 v155 = 0u;
      uint64_t v87 = [v78 countByEnumeratingWithState:&v154 objects:v170 count:16];
      if (v87)
      {
        uint64_t v88 = *(void *)v155;
        while (1)
        {
          if (*(void *)v155 != v88) {
            objc_enumerationMutation(v78);
          }
          if (CFBitVectorGetBitAtIndex(v12, v82++)) {
            ++v83;
          }
          if (!--v87)
          {
            uint64_t v87 = [v78 countByEnumeratingWithState:&v154 objects:v170 count:16];
            if (!v87) {
              break;
            }
          }
        }
      }

      __int128 v152 = 0u;
      __int128 v153 = 0u;
      __int128 v150 = 0u;
      __int128 v151 = 0u;
      uint64_t v90 = [v79 countByEnumeratingWithState:&v150 objects:v169 count:16];
      if (v90)
      {
        uint64_t v91 = *(void *)v151;
        while (1)
        {
          if (*(void *)v151 != v91) {
            objc_enumerationMutation(v79);
          }
          if (CFBitVectorGetBitAtIndex(v12, v82++)) {
            ++v83;
          }
          if (!--v90)
          {
            uint64_t v90 = [v79 countByEnumeratingWithState:&v150 objects:v169 count:16];
            if (!v90) {
              break;
            }
          }
        }
      }

      __int128 v148 = 0u;
      __int128 v149 = 0u;
      __int128 v146 = 0u;
      __int128 v147 = 0u;
      uint64_t v93 = [v80 countByEnumeratingWithState:&v146 objects:v168 count:16];
      if (v93)
      {
        uint64_t v94 = *(void *)v147;
        while (1)
        {
          if (*(void *)v147 != v94) {
            objc_enumerationMutation(v80);
          }
          if (CFBitVectorGetBitAtIndex(v12, v82)) {
            objc_msgSend((id)CFArrayGetValueAtIndex(v81, v83++), "setValue:", 0);
          }
          ++v82;
          if (!--v93)
          {
            uint64_t v93 = [v80 countByEnumeratingWithState:&v146 objects:v168 count:16];
            if (!v93) {
              break;
            }
          }
        }
      }

      -[NSSQLiteConnection resetSQLStatement](v139);
      uint64_t v95 = *(void *)(v139 + 16);
      if (v95 && (*(_BYTE *)(v95 + 201) & 4) != 0)
      {
        if (a2) {
          v96 = -[NSSQLRow newColumnMaskFrom:columnInclusionOptions:]((CFBitVectorRef)a2, v140, 30LL);
        }
        else {
          v96 = 0LL;
        }
        int v97 = key;
        uint64_t v98 = +[_NSPersistentHistoryChange _dataMaskForEntity:andDeltaMask:]( (uint64_t)&OBJC_CLASS____NSPersistentHistoryChange,  key,  v96);
        if (v98)
        {
          id v99 = objc_alloc(NSString);
          if (key) {
            int v97 = (unsigned int *)key[46];
          }
          if (a2) {
            uint64_t v100 = [*(id *)(*(void *)(a2 + 40) + 16) _referenceData64];
          }
          else {
            uint64_t v100 = 0LL;
          }
          uint64_t v101 = (void *)objc_msgSend(v99, "initWithFormat:", @"%u-%lld", v97, v100);
          -[NSSQLSaveChangesRequestContext addDataMask:forEntityKey:](v138, v98, (uint64_t)v101);
        }

        if (v96) {
          CFRelease(v96);
        }
      }

      if (v12) {
        CFRelease(v12);
      }
      uint64_t v102 = *(sqlite3 **)(v139 + 72);
      if (v102)
      {
        int v103 = sqlite3_changes(v102);
        *(_DWORD *)(v139 + 88) = v103;
        if (v103 == 1) {
          return;
        }
      }

      else
      {
        *(_DWORD *)(v139 + 88) = 0;
      }

      if ((int)-[NSSQLStoreRequestContext debugLogLevel](v138) <= 1)
      {
        if ((int)-[NSSQLStoreRequestContext debugLogLevel](v138) >= 1) {
          _NSCoreDataLog( 4LL,  (uint64_t)@"Optimistic locking failure for %@.  During updateRow, rows processed = %d.",  v117,  v118,  v119,  v120,  v121,  v122,  v136);
        }
      }

      else
      {
        _NSCoreDataLog( 4LL,  (uint64_t)@"Optimistic locking failure for %@.  During updateRow, rows processed = %d.  Original row = %@ New row = %@",  v111,  v112,  v113,  v114,  v115,  v116,  v136);
      }

      uint64_t v162 = v136;
      v163 = @"_NSCoreDataOptimisticLockingFailureConflictsKey";
      uint64_t v164 = [MEMORY[0x189603F18] arrayWithObjects:&v162 count:1];
      uint64_t v123 = [MEMORY[0x189603F68] dictionaryWithObjects:&v164 forKeys:&v163 count:1];
      objc_exception_throw( +[_NSCoreDataOptimisticLockingException exceptionWithName:reason:userInfo:]( &OBJC_CLASS____NSCoreDataOptimisticLockingException,  "exceptionWithName:reason:userInfo:",  *MEMORY[0x189603A58],  @"optimistic locking failure",  v123));
    }

    __break(1u);
  }

- (uint64_t)updateConstrainedValuesForRow:(uint64_t)result
{
  uint64_t v85 = *MEMORY[0x1895F89C0];
  if (result)
  {
    uint64_t v3 = result;
    uint64_t v4 = *(dispatch_queue_s **)(result + 8);
    if (v4) {
      dispatch_assert_queue_V2(v4);
    }
    if (!a2 || (*(_BYTE *)(a2 + 16) & 1) != 0) {
      uint64_t v5 = 0LL;
    }
    else {
      uint64_t v5 = (const void *)[*(id *)(*(void *)(a2 + 40) + 16) _storeInfo1];
    }
    uint64_t v67 = [(id)a2 objectID];
    int v6 = *(dispatch_queue_s **)(v3 + 8);
    if (v6) {
      dispatch_assert_queue_V2(v6);
    }
    Value = (void *)CFDictionaryGetValue(*(CFDictionaryRef *)(v3 + 224), v5);
    key = (void *)v5;
    if (!Value || (uint64_t v8 = Value, (v70 = *((void *)Value + 8)) == 0))
    {
      uint64_t v20 = (void *)v5;
      uint64_t v21 = -[NSSQLiteAdapter newConstrainedValuesUpdateStatementWithRow:]( (NSSQLiteStatement *)[(id)v3 adapter],  a2);
      -[NSSQLiteConnection prepareSQLStatement:](v3, v21);
      -[NSSQLiteStatement setCachedSQLiteStatement:forConnection:]( *(sqlite3_stmt **)(v3 + 48),  *(sqlite3_stmt **)(v3 + 80),  v3);
      -[NSSQLiteConnection cacheUpdateConstrainedValuesStatement:forEntity:](v3, *(void **)(v3 + 48), v20);

      -[NSSQLiteConnection addVMCachedStatement:](v3, *(const void **)(v3 + 48));
      goto LABEL_45;
    }

    if (+[NSSQLCore debugDefault](&OBJC_CLASS___NSSQLCore, "debugDefault") >= 1)
    {
      int v9 = *(unsigned __int8 *)(v3 + 42);
      uint64_t v10 = [v8 sqlString];
      if (v9) {
        int v17 = @"\x1B[32msql: \x1B[34m\x1B[47m%@\x1B[0m";
      }
      else {
        int v17 = @"%@";
      }
      _NSCoreDataLog(6LL, (uint64_t)v17, v11, v12, v13, v14, v15, v16, v10);
    }

    *(void *)(v3 + 48) = v8;
    uint64_t v18 = *(dispatch_queue_s **)(v3 + 8);
    if (v18) {
      dispatch_assert_queue_V2(v18);
    }
    context = (void *)MEMORY[0x186E3E5D8]();
    if (!a2 || (*(_BYTE *)(a2 + 16) & 1) != 0) {
      uint64_t v19 = 0LL;
    }
    else {
      uint64_t v19 = (void *)[*(id *)(*(void *)(a2 + 40) + 16) _storeInfo1];
    }
    uint64_t v22 = (void *)[v19 attributeColumns];
    uint64_t v23 = (void *)[v19 foreignKeyColumns];
    uint64_t v68 = v3;
    uint64_t v24 = (const __CFArray *)[*(id *)(v3 + 48) bindVariables];
    __int128 v76 = 0u;
    __int128 v77 = 0u;
    __int128 v78 = 0u;
    __int128 v79 = 0u;
    unsigned int v25 = 0;
    uint64_t v26 = [v23 countByEnumeratingWithState:&v76 objects:v84 count:16];
    if (v26)
    {
      uint64_t v27 = *(void *)v77;
      do
      {
        for (uint64_t i = 0LL; i != v26; ++i)
        {
          if (*(void *)v77 != v27) {
            objc_enumerationMutation(v23);
          }
          __int128 v29 = *(void **)(*((void *)&v76 + 1) + 8 * i);
          if (objc_msgSend((id)objc_msgSend(v29, "toOneRelationship"), "isConstrained"))
          {
            ValueAtIndex = (void *)CFArrayGetValueAtIndex(v24, v25);
            objc_msgSend(ValueAtIndex, "setInt64:", -[NSSQLRow foreignKeyForSlot:](a2, objc_msgSend(v29, "slot")));
            ++v25;
          }
        }

        uint64_t v26 = [v23 countByEnumeratingWithState:&v76 objects:v84 count:16];
      }

      while (v26);
    }

    __int128 v74 = 0u;
    __int128 v75 = 0u;
    __int128 v72 = 0u;
    __int128 v73 = 0u;
    uint64_t v31 = [v22 countByEnumeratingWithState:&v72 objects:v83 count:16];
    if (v31)
    {
      uint64_t v32 = *(void *)v73;
      do
      {
        for (uint64_t j = 0LL; j != v31; ++j)
        {
          if (*(void *)v73 != v32) {
            objc_enumerationMutation(v22);
          }
          uint64_t v34 = *(void **)(*((void *)&v72 + 1) + 8 * j);
          if ([v34 isConstrained])
          {
            CFDateRef v35 = -[NSSQLRow attributeValueForSlot:]((CFDateRef)a2, [v34 slot]);
            objc_msgSend((id)CFArrayGetValueAtIndex(v24, v25++), "setValue:", v35);
          }
        }

        uint64_t v31 = [v22 countByEnumeratingWithState:&v72 objects:v83 count:16];
      }

      while (v31);
    }

    int v36 = (void *)CFArrayGetValueAtIndex(v24, v25);
    if (!a2) {
      goto LABEL_76;
    }
    for (uint64_t k = [*(id *)(*(void *)(a2 + 40) + 16) _referenceData64]; ; uint64_t k = 0)
    {
      [v36 setInt64:k];
      objc_autoreleasePoolPop(context);
      uint64_t v3 = v68;
      *(void *)(v68 + 80) = v70;
      id v38 = *(id *)(v68 + 48);
LABEL_45:
      [(id)v3 execute];
      int v39 = key;
      if (!*(void *)(v3 + 80)) {
        -[NSSQLiteConnection cacheUpdateConstrainedValuesStatement:forEntity:](v3, 0LL, key);
      }
      uint64_t v40 = *(dispatch_queue_s **)(v3 + 8);
      if (v40) {
        dispatch_assert_queue_V2(v40);
      }
      uint64_t v41 = (void *)objc_msgSend(*(id *)(v3 + 48), "entity", v39);
      uint64_t v42 = v3;
      int v43 = (const __CFArray *)[*(id *)(v3 + 48) bindVariables];
      uint64_t v44 = (void *)[v41 foreignKeyColumns];
      __int128 v76 = 0u;
      __int128 v77 = 0u;
      __int128 v78 = 0u;
      __int128 v79 = 0u;
      unsigned int v45 = 0;
      uint64_t v46 = [v44 countByEnumeratingWithState:&v76 objects:v84 count:16];
      if (v46)
      {
        uint64_t v47 = *(void *)v77;
        do
        {
          for (uint64_t m = 0LL; m != v46; ++m)
          {
            if (*(void *)v77 != v47) {
              objc_enumerationMutation(v44);
            }
            if (objc_msgSend( (id)objc_msgSend(*(id *)(*((void *)&v76 + 1) + 8 * m), "toOneRelationship"),  "isConstrained")) {
              objc_msgSend((id)CFArrayGetValueAtIndex(v43, v45++), "setInt64:", 0);
            }
          }

          uint64_t v46 = [v44 countByEnumeratingWithState:&v76 objects:v84 count:16];
        }

        while (v46);
      }

      uint64_t v49 = (void *)[v41 attributeColumns];
      __int128 v74 = 0u;
      __int128 v75 = 0u;
      __int128 v72 = 0u;
      __int128 v73 = 0u;
      int v36 = (void *)[v49 countByEnumeratingWithState:&v72 objects:v83 count:16];
      if (v36)
      {
        uint64_t v50 = *(void *)v73;
        do
        {
          for (n = 0LL; n != v36; n = (char *)n + 1)
          {
            if (*(void *)v73 != v50) {
              objc_enumerationMutation(v49);
            }
          }

          int v36 = (void *)[v49 countByEnumeratingWithState:&v72 objects:v83 count:16];
        }

        while (v36);
      }

      objc_msgSend((id)CFArrayGetValueAtIndex(v43, v45), "setInt64:", 0);
      -[NSSQLiteConnection resetSQLStatement](v42);
      uint64_t v52 = *(sqlite3 **)(v42 + 72);
      if (v52)
      {
        uint64_t result = sqlite3_changes(v52);
        *(_DWORD *)(v42 + 88) = result;
        if ((_DWORD)result == 1) {
          return result;
        }
      }

      else
      {
        *(_DWORD *)(v42 + 88) = 0;
      }

      unsigned int v53 = (void *)objc_opt_class();
      if (+[NSSQLCore debugDefault](&OBJC_CLASS___NSSQLCore, "debugDefault") <= 1)
      {
        if (+[NSSQLCore debugDefault](&OBJC_CLASS___NSSQLCore, "debugDefault") >= 1) {
          _NSCoreDataLog( 4LL,  (uint64_t)@"Optimistic locking failure for %@.  During updateConstrainedValuesForRow, rows processed = %d.  Row was updated.",  v60,  v61,  v62,  v63,  v64,  v65,  v67);
        }
      }

      else
      {
        _NSCoreDataLog( 4LL,  (uint64_t)@"Optimistic locking failure for %@.  During updateConstrainedValuesForRow, rows processed = %d.  New Row = %@",  v54,  v55,  v56,  v57,  v58,  v59,  v67);
      }

      uint64_t v81 = @"_NSCoreDataOptimisticLockingFailureConflictsKey";
      uint64_t v80 = [(id)a2 objectID];
      uint64_t v82 = [MEMORY[0x189603F18] arrayWithObjects:&v80 count:1];
      uint64_t v66 = [MEMORY[0x189603F68] dictionaryWithObjects:&v82 forKeys:&v81 count:1];
      objc_exception_throw((id)[v53 exceptionWithName:*MEMORY[0x189603A58] reason:@"optimistic locking failure" userInfo:v66]);
      __break(1u);
LABEL_76:
      ;
    }
  }

  return result;
}

- (uint64_t)deleteRow:(uint64_t)a3 forRequestContext:
{
  v51[2] = *MEMORY[0x1895F89C0];
  if (result)
  {
    uint64_t v5 = result;
    int v6 = *(dispatch_queue_s **)(result + 8);
    if (v6) {
      dispatch_assert_queue_V2(v6);
    }
    if (!a2 || (*(_BYTE *)(a2 + 16) & 1) != 0) {
      int v7 = 0LL;
    }
    else {
      int v7 = (const void *)[*(id *)(*(void *)(a2 + 40) + 16) _storeInfo1];
    }
    uint64_t v8 = [(id)a2 objectID];
    int v9 = -[NSSQLSaveChangesRequestContext originalRowForObjectID:](a3, (const void *)[(id)a2 objectID]);
    if (a3) {
      uint64_t v10 = *(void **)(a3 + 32);
    }
    else {
      uint64_t v10 = 0LL;
    }
    uint64_t v11 = (void *)objc_msgSend(v10, "objectRegisteredForID:", objc_msgSend((id)a2, "objectID"));
    if (v11
      && v9
      && (uint64_t v12 = v11, [v11 _versionReference])
      && *(_DWORD *)(*(void *)&v9[10]._os_unfair_lock_opaque + 12) != [v12 _versionReference])
    {
      if ((int)-[NSSQLStoreRequestContext debugLogLevel](a3) <= 1)
      {
        if ((int)-[NSSQLStoreRequestContext debugLogLevel](a3) >= 1) {
          _NSCoreDataLog( 4LL,  (uint64_t)@"Optimistic locking failure for %@. During deleteRow. version match = %d",  v41,  v42,  v43,  v44,  v45,  v46,  v8);
        }
      }

      else
      {
        _NSCoreDataLog( 4LL,  (uint64_t)@"Optimistic locking failure for %@.  During deleteRow.  Original row = %@ New Row = %@ context version match = %d",  v35,  v36,  v37,  v38,  v39,  v40,  v8);
      }

      uint64_t v47 = *MEMORY[0x189603A58];
      uint64_t v49 = v8;
      v50[0] = @"_NSCoreDataOptimisticLockingFailureConflictsKey";
      uint64_t v48 = [MEMORY[0x189603F18] arrayWithObjects:&v49 count:1];
      v50[1] = @"_NSCoreDataOptimisticLockingFailureMismatchWithObject";
      v51[0] = v48;
      v51[1] = &unk_189F04500;
      objc_exception_throw( +[_NSCoreDataOptimisticLockingException exceptionWithName:reason:userInfo:]( _NSCoreDataOptimisticLockingException,  "exceptionWithName:reason:userInfo:",  v47,  @"optimistic locking failure",  [MEMORY[0x189603F68] dictionaryWithObjects:v51 forKeys:v50 count:2]));
      return -[NSSQLiteConnection writeCorrelationInsertsFromTracker:]();
    }

    else
    {
      uint64_t v13 = -[NSSQLiteConnection statementCacheForEntity:](v5, v7);
      uint64_t v14 = v13;
      if (v13
        && (deletionStatementCache = v13->_deletionStatementCache) != 0LL
        && (cachedSQLiteStatement = deletionStatementCache->_cachedSQLiteStatement) != 0LL)
      {
        if (+[NSSQLCore debugDefault](&OBJC_CLASS___NSSQLCore, "debugDefault") >= 1)
        {
          int v17 = *(unsigned __int8 *)(v5 + 42);
          uint64_t v18 = -[NSSQLiteStatement sqlString](deletionStatementCache, "sqlString");
          if (v17) {
            unsigned int v25 = @"\x1B[32msql: \x1B[34m\x1B[47m%@\x1B[0m";
          }
          else {
            unsigned int v25 = @"%@";
          }
          _NSCoreDataLog(6LL, (uint64_t)v25, v19, v20, v21, v22, v23, v24, v18);
        }

        *(void *)(v5 + 48) = deletionStatementCache;
        uint64_t v26 = *(dispatch_queue_s **)(v5 + 8);
        if (v26)
        {
          dispatch_assert_queue_V2(v26);
          deletionStatementCache = *(NSSQLiteStatement **)(v5 + 48);
        }

        id v27 = -[NSSQLiteStatement bindVariables](deletionStatementCache, "bindVariables");
        uint64_t v28 = (void *)[v27 objectAtIndex:0];
        if (a2) {
          uint64_t v29 = [*(id *)(*(void *)(a2 + 40) + 16) _referenceData64];
        }
        else {
          uint64_t v29 = 0LL;
        }
        [v28 setInt64:v29];
        uint64_t v30 = (void *)[v27 objectAtIndex:1];
        if (a2) {
          uint64_t v31 = *(unsigned int *)(*(void *)(a2 + 40) + 12LL);
        }
        else {
          uint64_t v31 = 0LL;
        }
        [v30 setInt64:v31];
        *(void *)(v5 + 80) = cachedSQLiteStatement;
        id v32 = *(id *)(v5 + 48);
      }

      else
      {
        unsigned int v33 = -[NSSQLiteAdapter newDeleteStatementWithRow:]((NSSQLiteStatement *)[(id)v5 adapter], a2);
        -[NSSQLiteConnection prepareSQLStatement:](v5, v33);
        -[NSSQLiteStatement setCachedSQLiteStatement:forConnection:]( *(sqlite3_stmt **)(v5 + 48),  *(sqlite3_stmt **)(v5 + 80),  v5);
        -[NSSQLiteStatementCache cacheDeletionStatement:](v14, *(void **)(v5 + 48));

        -[NSSQLiteConnection addVMCachedStatement:](v5, *(const void **)(v5 + 48));
      }

      [(id)v5 execute];
      if (!*(void *)(v5 + 80)) {
        -[NSSQLiteStatementCache cacheDeletionStatement:](v14, 0LL);
      }
      -[NSSQLiteConnection resetSQLStatement](v5);
      uint64_t v34 = *(sqlite3 **)(v5 + 72);
      if (v34) {
        LODWORD(v34) = sqlite3_changes(v34);
      }
      *(_DWORD *)(v5 + 88) = (_DWORD)v34;
      return (_DWORD)v34 == 1;
    }
  }

  return result;
}

- (void)writeCorrelationInsertsFromTracker:(uint64_t)a1
{
  if (a1)
  {
    uint64_t v4 = *(dispatch_queue_s **)(a1 + 8);
    if (v4) {
      dispatch_assert_queue_V2(v4);
    }
    if (a2 && *(void *)(a2 + 16))
    {
      uint64_t v5 = *(__CFString **)(a2 + 8);
      int v6 = -[NSSQLiteConnection statementCacheForEntity:]( a1,  (const void *)-[__CFString sourceEntity](v5, "sourceEntity"));
      int v7 = (__CFDictionary *)v6;
      if (v6
        && (correlationInsertCache = v6->_correlationInsertCache) != 0LL
        && (Value = (NSSQLiteStatement *)CFDictionaryGetValue(correlationInsertCache, v5)) != 0LL
        && (uint64_t v10 = Value, (cachedSQLiteStatement = Value->_cachedSQLiteStatement) != 0LL))
      {
        int v12 = 0;
        *(void *)(a1 + 80) = cachedSQLiteStatement;
      }

      else
      {
        uint64_t v10 = -[NSSQLiteAdapter newCorrelationInsertStatementForRelationship:]( (void *)[(id)a1 adapter],  v5);
        -[NSSQLiteConnection prepareSQLStatement:](a1, v10);
        -[NSSQLiteStatement setCachedSQLiteStatement:forConnection:]( (sqlite3_stmt *)v10,  *(sqlite3_stmt **)(a1 + 80),  a1);
        -[NSSQLiteStatementCache cacheCorrelationInsertStatement:forRelationship:](v7, v10, v5);

        int v12 = 1;
      }

      uint64_t v20 = 0LL;
      uint64_t v21 = &v20;
      uint64_t v22 = 0x2020000000LL;
      char v23 = 0;
      uint64_t v14 = 0LL;
      uint64_t v15 = &v14;
      uint64_t v16 = 0x3052000000LL;
      int v17 = __Block_byref_object_copy__28;
      uint64_t v18 = __Block_byref_object_dispose__28;
      uint64_t v19 = 0LL;
      v13[0] = MEMORY[0x1895F87A8];
      v13[1] = 3221225472LL;
      v13[2] = __57__NSSQLiteConnection_writeCorrelationInsertsFromTracker___block_invoke;
      v13[3] = &unk_189EAA240;
      v13[4] = a1;
      v13[5] = &v20;
      v13[6] = &v14;
      -[NSSQLCorrelationTableUpdateTracker enumerateInsertsUsingBlock:](a2, (uint64_t)v13);
      if (v12) {
        -[NSSQLiteConnection addVMCachedStatement:](a1, v10);
      }
      if (*((_BYTE *)v21 + 24))
      {
        objc_exception_throw((id)v15[5]);
        __break(1u);
      }

      else
      {
        -[NSSQLiteConnection resetSQLStatement](a1);
        _Block_object_dispose(&v14, 8);
        _Block_object_dispose(&v20, 8);
      }
    }
  }

void __57__NSSQLiteConnection_writeCorrelationInsertsFromTracker___block_invoke( uint64_t a1,  uint64_t a2,  sqlite3_int64 a3,  sqlite3_int64 a4,  sqlite3_int64 a5)
{
  if (+[NSSQLCore debugDefault](&OBJC_CLASS___NSSQLCore, "debugDefault") >= 3) {
    _NSCoreDataLog(7LL, (uint64_t)@"correlation bindings: %qu, %qu, %qu, %qu", v10, v11, v12, v13, v14, v15, a2);
  }
  -[NSSQLiteConnection executeCorrelationChangesForValue1:value2:value3:value4:](*(void *)(a1 + 32), a2, a3, a4, a5);
}

- (void)executeCorrelationChangesForValue1:(sqlite3_int64)a3 value2:(sqlite3_int64)a4 value3:(sqlite3_int64)a5 value4:
{
  if (a1)
  {
    uint64_t v10 = *(dispatch_queue_s **)(a1 + 8);
    if (v10) {
      dispatch_assert_queue_V2(v10);
    }
    int v11 = *(_DWORD *)(a1 + 312);
    if ((v11 & 1) == 0
      && (uint64_t v12 = sqlite3_reset(*(sqlite3_stmt **)(a1 + 80)),
          sqlite3_clear_bindings(*(sqlite3_stmt **)(a1 + 80)),
          int v11 = *(_DWORD *)(a1 + 312),
          (_DWORD)v12))
    {
      *(_DWORD *)(a1 + 312) = v11 & 0xFFFFFFFD;
      -[NSSQLiteConnection releaseSQLStatement](a1);
      uint64_t v19 = [NSString stringWithUTF8String:sqlite3_errmsg(*(sqlite3 **)(a1 + 72))];
      uint64_t v20 = *MEMORY[0x189603A58];
      uint64_t v15 = (void *)objc_msgSend( MEMORY[0x189603F68],  "dictionaryWithObject:forKey:",  objc_msgSend(MEMORY[0x189607968], "numberWithInt:", v12),  @"NSSQLiteErrorDomain");
      uint64_t v17 = v20;
      uint64_t v16 = (const __CFString *)v19;
    }

    else
    {
      *(_DWORD *)(a1 + 312) = v11 & 0xFFFFFFFE;
      uint64_t v13 = sqlite3_bind_int64(*(sqlite3_stmt **)(a1 + 80), 1, a2);
      if (!(_DWORD)v13)
      {
        uint64_t v13 = sqlite3_bind_int64(*(sqlite3_stmt **)(a1 + 80), 2, a3);
        if (!(_DWORD)v13)
        {
          if (!a4 || (uint64_t v13 = sqlite3_bind_int64(*(sqlite3_stmt **)(a1 + 80), 3, a4), !(_DWORD)v13))
          {
            if (!a5 || (uint64_t v13 = sqlite3_bind_int64(*(sqlite3_stmt **)(a1 + 80), 4, a5), !(_DWORD)v13))
            {
              _execute(a1);
              return;
            }
          }
        }
      }

      uint64_t v14 = *MEMORY[0x189603A58];
      uint64_t v15 = (void *)objc_msgSend( MEMORY[0x189603F68],  "dictionaryWithObject:forKey:",  objc_msgSend(MEMORY[0x189607968], "numberWithInt:", v13),  @"NSSQLiteErrorDomain");
      uint64_t v16 = @"sqlite3_bind* failed";
      uint64_t v17 = v14;
    }

    id v18 = +[_NSCoreDataException exceptionWithName:code:reason:userInfo:]( (uint64_t)&OBJC_CLASS____NSCoreDataException,  v17,  134180LL,  (uint64_t)v16,  v15);
    objc_exception_throw(v18);
  }

- (void)writeCorrelationDeletesFromTracker:(uint64_t)a1
{
  if (a1)
  {
    uint64_t v4 = *(dispatch_queue_s **)(a1 + 8);
    if (v4) {
      dispatch_assert_queue_V2(v4);
    }
    if (a2 && *(void *)(a2 + 24))
    {
      uint64_t v5 = *(__CFString **)(a2 + 8);
      int v6 = -[NSSQLiteConnection statementCacheForEntity:]( a1,  (const void *)-[__CFString sourceEntity](v5, "sourceEntity"));
      int v7 = (__CFDictionary *)v6;
      if (v6
        && (correlationDeleteCache = v6->_correlationDeleteCache) != 0LL
        && (Value = (NSSQLiteStatement *)CFDictionaryGetValue(correlationDeleteCache, v5)) != 0LL
        && (uint64_t v10 = Value, (cachedSQLiteStatement = Value->_cachedSQLiteStatement) != 0LL))
      {
        int v12 = 0;
        *(void *)(a1 + 80) = cachedSQLiteStatement;
      }

      else
      {
        uint64_t v10 = -[NSSQLiteAdapter newCorrelationDeleteStatementForRelationship:]( (void *)[(id)a1 adapter],  v5);
        -[NSSQLiteConnection prepareSQLStatement:](a1, v10);
        -[NSSQLiteStatement setCachedSQLiteStatement:forConnection:]( (sqlite3_stmt *)v10,  *(sqlite3_stmt **)(a1 + 80),  a1);
        -[NSSQLiteStatementCache cacheCorrelationDeleteStatement:forRelationship:](v7, v10, v5);

        int v12 = 1;
      }

      uint64_t v20 = 0LL;
      uint64_t v21 = &v20;
      uint64_t v22 = 0x2020000000LL;
      char v23 = 0;
      uint64_t v14 = 0LL;
      uint64_t v15 = &v14;
      uint64_t v16 = 0x3052000000LL;
      uint64_t v17 = __Block_byref_object_copy__28;
      id v18 = __Block_byref_object_dispose__28;
      uint64_t v19 = 0LL;
      v13[0] = MEMORY[0x1895F87A8];
      v13[1] = 3221225472LL;
      v13[2] = __57__NSSQLiteConnection_writeCorrelationDeletesFromTracker___block_invoke;
      v13[3] = &unk_189EAA268;
      v13[4] = a1;
      v13[5] = &v20;
      v13[6] = &v14;
      -[NSSQLCorrelationTableUpdateTracker enumerateDeletesUsingBlock:](a2, (uint64_t)v13);
      if (v12) {
        -[NSSQLiteConnection addVMCachedStatement:](a1, v10);
      }
      if (*((_BYTE *)v21 + 24))
      {
        objc_exception_throw((id)v15[5]);
        __break(1u);
      }

      else
      {
        -[NSSQLiteConnection resetSQLStatement](a1);
        _Block_object_dispose(&v14, 8);
        _Block_object_dispose(&v20, 8);
      }
    }
  }

void __57__NSSQLiteConnection_writeCorrelationDeletesFromTracker___block_invoke( uint64_t a1,  uint64_t a2,  sqlite3_int64 a3)
{
  if (+[NSSQLCore debugDefault](&OBJC_CLASS___NSSQLCore, "debugDefault") >= 3) {
    _NSCoreDataLog(7LL, (uint64_t)@"correlation bindings:  %qu, %qu", v6, v7, v8, v9, v10, v11, a2);
  }
  -[NSSQLiteConnection executeCorrelationChangesForValue1:value2:value3:value4:](*(void *)(a1 + 32), a2, a3, 0LL, 0LL);
}

- (uint64_t)_countOfVMCachedStatements
{
  v14[1] = *MEMORY[0x1895F89C0];
  if (!a1) {
    return 0LL;
  }
  stat v2 = *(const __CFDictionary **)(a1 + 152);
  if (!v2) {
    return 0LL;
  }
  unint64_t Count = CFDictionaryGetCount(v2);
  unint64_t v4 = Count;
  if (Count <= 1) {
    uint64_t v5 = 1LL;
  }
  else {
    uint64_t v5 = Count;
  }
  if (Count >= 0x201) {
    uint64_t v6 = 1LL;
  }
  else {
    uint64_t v6 = v5;
  }
  uint64_t v7 = (const void **)((char *)v14 - ((8 * v6 + 15) & 0xFFFFFFFFFFFFFFF0LL));
  if (Count >= 0x201)
  {
    uint64_t v7 = (const void **)NSAllocateScannedUncollectable();
    CFDictionaryGetKeysAndValues(*(CFDictionaryRef *)(a1 + 152), v7, 0LL);
  }

  else
  {
    bzero((char *)v14 - ((8 * v6 + 15) & 0xFFFFFFFFFFFFFFF0LL), 8 * v5);
    CFDictionaryGetKeysAndValues(*(CFDictionaryRef *)(a1 + 152), v7, 0LL);
    if (!v4) {
      return 0LL;
    }
  }

  uint64_t v8 = 0LL;
  uint64_t v9 = 0LL;
  do
  {
    uint64_t v10 = v7[v9];
    Value = (id *)CFDictionaryGetValue(*(CFDictionaryRef *)(a1 + 152), v10);
    if (Value && (id WeakRetained = objc_loadWeakRetained(Value + 1)) != 0LL)
    {
      ++v8;
    }

    else
    {
      CFDictionaryRemoveValue(*(CFMutableDictionaryRef *)(a1 + 152), v10);
    }

    ++v9;
  }

  while (v4 != v9);
  if (v4 >= 0x201) {
    NSZoneFree(0LL, v7);
  }
  return v8;
}

- (void)writeCorrelationMasterReordersFromTracker:(uint64_t)a1
{
  if (a1)
  {
    unint64_t v4 = *(dispatch_queue_s **)(a1 + 8);
    if (v4) {
      dispatch_assert_queue_V2(v4);
    }
    if (a2 && *(void *)(a2 + 32))
    {
      uint64_t v5 = *(__CFString **)(a2 + 8);
      uint64_t v6 = v5 ? (void *)[*(id *)(a2 + 8) propertyDescription] : 0;
      if ([v6 isOrdered])
      {
        uint64_t v7 = -[NSSQLiteConnection statementCacheForEntity:]( a1,  (const void *)-[__CFString sourceEntity](v5, "sourceEntity"));
        uint64_t v8 = v7;
        if (v7
          && (correlationMasterReorderCache = v7->_correlationMasterReorderCache) != 0LL
          && (Value = (NSSQLiteStatement *)CFDictionaryGetValue(correlationMasterReorderCache, v5)) != 0LL
          && (uint64_t v11 = Value, (cachedSQLiteStatement = Value->_cachedSQLiteStatement) != 0LL))
        {
          int v13 = 0;
          *(void *)(a1 + 80) = cachedSQLiteStatement;
        }

        else
        {
          uint64_t v11 = -[NSSQLiteAdapter newCorrelationMasterReorderStatementForRelationship:]( (void *)[(id)a1 adapter],  v5);
          -[NSSQLiteConnection prepareSQLStatement:](a1, v11);
          -[NSSQLiteStatement setCachedSQLiteStatement:forConnection:]( (sqlite3_stmt *)v11,  *(sqlite3_stmt **)(a1 + 80),  a1);
          -[NSSQLiteStatementCache cacheCorrelationMasterReorderStatement:forRelationship:]( (__CFDictionary *)v8,  v11,  v5);

          int v13 = 1;
        }

        uint64_t v28 = 0LL;
        uint64_t v29 = &v28;
        uint64_t v30 = 0x2020000000LL;
        char v31 = 0;
        uint64_t v22 = 0LL;
        char v23 = &v22;
        uint64_t v24 = 0x3052000000LL;
        unsigned int v25 = __Block_byref_object_copy__28;
        uint64_t v26 = __Block_byref_object_dispose__28;
        uint64_t v27 = 0LL;
        uint64_t v14 = MEMORY[0x1895F87A8];
        v21[0] = MEMORY[0x1895F87A8];
        v21[1] = 3221225472LL;
        v21[2] = __64__NSSQLiteConnection_writeCorrelationMasterReordersFromTracker___block_invoke;
        v21[3] = &unk_189EAA290;
        v21[4] = a1;
        v21[5] = &v28;
        v21[6] = &v22;
        -[NSSQLCorrelationTableUpdateTracker enumerateMasterReordersUsingBlock:](a2, (uint64_t)v21);
        if (!*((_BYTE *)v29 + 24))
        {
          if (v13) {
            -[NSSQLiteConnection addVMCachedStatement:](a1, v11);
          }
          -[NSSQLiteConnection resetSQLStatement](a1);
          if (!v5
            || (__CFString *)v5[1].length != v5
            || !objc_msgSend( (id)-[__CFString propertyDescription](v5, "propertyDescription"),  "isOrdered"))
          {
            goto LABEL_31;
          }

          if (v8
            && (correlationMasterReorderCachePart2 = v8->_correlationMasterReorderCachePart2) != 0LL
            && (uint64_t v16 = (NSSQLiteStatement *)CFDictionaryGetValue(correlationMasterReorderCachePart2, v5),
                (uint64_t v17 = v16) != 0LL)
            && (id v18 = v16->_cachedSQLiteStatement) != 0LL)
          {
            int v19 = 0;
            *(void *)(a1 + 80) = v18;
          }

          else
          {
            uint64_t v17 = -[NSSQLiteAdapter newCorrelationMasterReorderStatementPart2ForRelationship:]( (void *)[(id)a1 adapter],  v5);
            -[NSSQLiteConnection prepareSQLStatement:](a1, v17);
            -[NSSQLiteStatement setCachedSQLiteStatement:forConnection:]( (sqlite3_stmt *)v17,  *(sqlite3_stmt **)(a1 + 80),  a1);
            -[NSSQLiteStatementCache cacheCorrelationMasterReorderStatement:forRelationship:]( (__CFDictionary *)v8,  v17,  v5);

            int v19 = 1;
          }

          v20[0] = v14;
          v20[1] = 3221225472LL;
          v20[2] = __64__NSSQLiteConnection_writeCorrelationMasterReordersFromTracker___block_invoke_2;
          v20[3] = &unk_189EAA290;
          v20[4] = a1;
          v20[5] = &v28;
          v20[6] = &v22;
          -[NSSQLCorrelationTableUpdateTracker enumerateMasterReordersPart2UsingBlock:](a2, (uint64_t)v20);
          if (!*((_BYTE *)v29 + 24))
          {
            if (v19) {
              -[NSSQLiteConnection addVMCachedStatement:](a1, v17);
            }
            -[NSSQLiteConnection resetSQLStatement](a1);
LABEL_31:
            _Block_object_dispose(&v22, 8);
            _Block_object_dispose(&v28, 8);
            return;
          }
        }

        objc_exception_throw((id)v23[5]);
        __break(1u);
      }
    }
  }

void __64__NSSQLiteConnection_writeCorrelationMasterReordersFromTracker___block_invoke( uint64_t a1,  uint64_t a2,  sqlite3_int64 a3,  sqlite3_int64 a4)
{
  if (+[NSSQLCore debugDefault](&OBJC_CLASS___NSSQLCore, "debugDefault") >= 3) {
    _NSCoreDataLog(7LL, (uint64_t)@"correlation bindings: %qu, %qu, %qu", v8, v9, v10, v11, v12, v13, a2);
  }
  -[NSSQLiteConnection executeCorrelationChangesForValue1:value2:value3:value4:](*(void *)(a1 + 32), a2, a3, a4, 0LL);
}

void __64__NSSQLiteConnection_writeCorrelationMasterReordersFromTracker___block_invoke_2( uint64_t a1,  uint64_t a2,  sqlite3_int64 a3,  sqlite3_int64 a4)
{
  if (+[NSSQLCore debugDefault](&OBJC_CLASS___NSSQLCore, "debugDefault") >= 3) {
    _NSCoreDataLog(7LL, (uint64_t)@"correlation bindings: %qu, %qu, %qu", v8, v9, v10, v11, v12, v13, a2);
  }
  -[NSSQLiteConnection executeCorrelationChangesForValue1:value2:value3:value4:](*(void *)(a1 + 32), a2, a3, a4, 0LL);
}

- (void)writeCorrelationReordersFromTracker:(uint64_t)a1
{
  if (a1)
  {
    unint64_t v4 = *(dispatch_queue_s **)(a1 + 8);
    if (v4) {
      dispatch_assert_queue_V2(v4);
    }
    if (a2 && *(void *)(a2 + 40))
    {
      uint64_t v5 = *(__CFString **)(a2 + 8);
      uint64_t v6 = v5 ? (void *)[*(id *)(a2 + 8) propertyDescription] : 0;
      if (objc_msgSend((id)objc_msgSend(v6, "inverseRelationship"), "isOrdered"))
      {
        uint64_t v7 = -[NSSQLiteConnection statementCacheForEntity:]( a1,  (const void *)-[__CFString sourceEntity](v5, "sourceEntity"));
        uint64_t v8 = (__CFDictionary *)v7;
        if (v7
          && (correlationReorderCache = v7->_correlationReorderCache) != 0LL
          && (Value = (NSSQLiteStatement *)CFDictionaryGetValue(correlationReorderCache, v5)) != 0LL
          && (uint64_t v11 = Value, (cachedSQLiteStatement = Value->_cachedSQLiteStatement) != 0LL))
        {
          int v13 = 0;
          *(void *)(a1 + 80) = cachedSQLiteStatement;
        }

        else
        {
          uint64_t v11 = -[NSSQLiteAdapter newCorrelationReorderStatementForRelationship:]( (void *)[(id)a1 adapter],  v5);
          -[NSSQLiteConnection prepareSQLStatement:](a1, v11);
          -[NSSQLiteStatement setCachedSQLiteStatement:forConnection:]( (sqlite3_stmt *)v11,  *(sqlite3_stmt **)(a1 + 80),  a1);
          -[NSSQLiteStatementCache cacheCorrelationReorderStatement:forRelationship:](v8, v11, v5);

          int v13 = 1;
        }

        uint64_t v21 = 0LL;
        uint64_t v22 = &v21;
        uint64_t v23 = 0x2020000000LL;
        char v24 = 0;
        uint64_t v15 = 0LL;
        uint64_t v16 = &v15;
        uint64_t v17 = 0x3052000000LL;
        id v18 = __Block_byref_object_copy__28;
        int v19 = __Block_byref_object_dispose__28;
        uint64_t v20 = 0LL;
        v14[0] = MEMORY[0x1895F87A8];
        v14[1] = 3221225472LL;
        void v14[2] = __58__NSSQLiteConnection_writeCorrelationReordersFromTracker___block_invoke;
        v14[3] = &unk_189EAA290;
        v14[4] = a1;
        v14[5] = &v21;
        v14[6] = &v15;
        -[NSSQLCorrelationTableUpdateTracker enumerateReordersUsingBlock:](a2, (uint64_t)v14);
        if (v13) {
          -[NSSQLiteConnection addVMCachedStatement:](a1, v11);
        }
        if (*((_BYTE *)v22 + 24))
        {
          objc_exception_throw((id)v16[5]);
          __break(1u);
        }

        else
        {
          -[NSSQLiteConnection resetSQLStatement](a1);
          _Block_object_dispose(&v15, 8);
          _Block_object_dispose(&v21, 8);
        }
      }
    }
  }

void __58__NSSQLiteConnection_writeCorrelationReordersFromTracker___block_invoke( uint64_t a1,  sqlite3_int64 a2,  sqlite3_int64 a3,  uint64_t a4)
{
  if (+[NSSQLCore debugDefault](&OBJC_CLASS___NSSQLCore, "debugDefault") >= 3) {
    _NSCoreDataLog(7LL, (uint64_t)@"correlation bindings: %qu, %qu, %qu", v8, v9, v10, v11, v12, v13, a4);
  }
  -[NSSQLiteConnection executeCorrelationChangesForValue1:value2:value3:value4:](*(void *)(a1 + 32), a4, a2, a3, 0LL);
}

- (void)writeCorrelationChangesFromTracker:(uint64_t)a1
{
  if (a1)
  {
    -[NSSQLiteConnection writeCorrelationInsertsFromTracker:](a1, a2);
    -[NSSQLiteConnection writeCorrelationDeletesFromTracker:](a1, a2);
    -[NSSQLiteConnection writeCorrelationMasterReordersFromTracker:](a1, a2);
    -[NSSQLiteConnection writeCorrelationReordersFromTracker:](a1, a2);
  }

- (void)_endFetch
{
  if (result)
  {
    uint64_t v1 = result;
    uint64_t result = -[NSSQLiteConnection setColumnsToFetch:](result, 0LL);
    *((_DWORD *)v1 + 78) &= ~2u;
    *(void *)((char *)v1 + 100) = 0LL;
    *(void *)((char *)v1 + 92) = 0LL;
    *((_DWORD *)v1 + 27) = 0;
  }

  return result;
}

- (uint64_t)selectCountWithStatement:(uint64_t)result
{
  if (result)
  {
    uint64_t v3 = (void *)result;
    if (a2 && a2[40])
    {
      return 0LL;
    }

    else
    {
      -[NSSQLiteConnection bindTempTablesForStatementIfNecessary:]((void *)result, a2);
      -[NSSQLiteConnection prepareSQLStatement:]((uint64_t)v3, a2);
      [v3 execute];
      return 1LL;
    }
  }

  return result;
}

uint64_t __29__NSSQLiteConnection_execute__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) invalidate];
}

- (dispatch_queue_s)_clearOtherStatements
{
  if (result)
  {
    uint64_t v1 = (sqlite3_stmt *)result;
    stat v2 = result[1];
    if (v2) {
      dispatch_assert_queue_V2(v2);
    }
    uint64_t v3 = (sqlite3_stmt *)*((void *)v1 + 14);
    if (v3) {
      sqlite3_finalize(v3);
    }
    *((void *)v1 + 14) = 0LL;
    uint64_t result = (dispatch_queue_s **)*((void *)v1 + 15);
    if (result) {
      uint64_t result = (dispatch_queue_s **)sqlite3_finalize((sqlite3_stmt *)result);
    }
    *((void *)v1 + 15) = 0LL;
  }

  return result;
}

- (uint64_t)_clearSaveGeneratedCachedStatements
{
  uint64_t v12 = *MEMORY[0x1895F89C0];
  if (result)
  {
    uint64_t v1 = result;
    stat v2 = *(dispatch_queue_s **)(result + 8);
    if (v2) {
      dispatch_assert_queue_V2(v2);
    }
    uint64_t result = -[NSSQLiteConnection _countOfVMCachedStatements](v1);
    uint64_t v3 = *(void **)(v1 + 200);
    if (v3)
    {
      __int128 v9 = 0u;
      __int128 v10 = 0u;
      __int128 v7 = 0u;
      __int128 v8 = 0u;
      uint64_t result = [v3 countByEnumeratingWithState:&v7 objects:v11 count:16];
      if (result)
      {
        uint64_t v4 = result;
        uint64_t v5 = *(void *)v8;
        do
        {
          uint64_t v6 = 0LL;
          do
          {
            if (*(void *)v8 != v5) {
              objc_enumerationMutation(v3);
            }
            -[NSSQLiteStatementCache _clearSaveGeneratedCachedStatements]([*(id *)(v1 + 200) objectForKey:*(void *)(*((void *)&v7 + 1) + 8 * v6++)]);
          }

          while (v4 != v6);
          uint64_t result = [v3 countByEnumeratingWithState:&v7 objects:v11 count:16];
          uint64_t v4 = result;
        }

        while (result);
      }
    }
  }

  return result;
}

- (void)newFetchedArray
{
  if (!a1) {
    return 0LL;
  }
  stat v2 = *(dispatch_queue_s **)(a1 + 8);
  if (v2) {
    dispatch_assert_queue_V2(v2);
  }
  uint64_t v3 = (void *)MEMORY[0x186E3E5D8]();
  uint64_t v4 = [MEMORY[0x189603FE8] null];
  if ((*(_BYTE *)(a1 + 312) & 2) != 0)
  {
    uint64_t v6 = (_NSDataFileBackedFuture *)v4;
    uint64_t v65 = v3;
    uint64_t v66 = *(void **)(a1 + 56);
    uint64_t v7 = [v66 count];
    uint64_t v5 = (void *)[objc_alloc(MEMORY[0x189603FA8]) initWithCapacity:v7];
    if (v7)
    {
      for (uint64_t i = 0LL; v7 != i; ++i)
      {
        __int128 v9 = v6;
        if (sqlite3_column_type(*(sqlite3_stmt **)(a1 + 80), i) != 5)
        {
          __int128 v10 = (unsigned __int8 *)[v66 objectAtIndex:i];
          uint64_t v11 = *(sqlite3_stmt **)(a1 + 80);
          uint64_t v12 = *(dispatch_queue_s **)(a1 + 8);
          if (v12) {
            dispatch_assert_queue_V2(v12);
          }
          int v13 = [v10 sqlType];
          uint64_t v14 = (void *)[MEMORY[0x1896078A8] defaultManager];
          uint64_t v15 = [*(id *)(a1 + 368) objectForKey:@"NSPersistentStoreUbiquitousContentNameKey"];
          if (sqlite3_column_type(v11, i) != 5)
          {
            switch(v13)
            {
              case 0:
                if (v10)
                {
                  int v45 = v10[24];
                  if (v45 == 7 || v45 == 4) {
                    goto LABEL_34;
                  }
                }

                goto LABEL_58;
              case 1:
                LODWORD(valuePtr) = sqlite3_column_int(v11, i);
                CFNumberType v44 = kCFNumberIntType;
                goto LABEL_36;
              case 2:
              case 3:
LABEL_34:
                double valuePtr = COERCE_DOUBLE(sqlite3_column_int64(v11, i));
                CFNumberType v44 = kCFNumberLongLongType;
                goto LABEL_36;
              case 4:
                uint64_t v42 = (void *)objc_msgSend( objc_alloc(NSString),  "initWithUTF8String:",  sqlite3_column_text(v11, i));
                uint64_t v43 = (_NSDataFileBackedFuture *)[objc_alloc(MEMORY[0x189607858]) initWithString:v42];
                goto LABEL_29;
              case 5:
              case 6:
              case 9:
                uint64_t v16 = sqlite3_column_text(v11, i);
                uint64_t v17 = (_NSDataFileBackedFuture *)CFStringCreateWithCString(0LL, (const char *)v16, 0x8000100u);
                goto LABEL_37;
              case 7:
                double valuePtr = sqlite3_column_double(v11, i);
                CFNumberType v44 = kCFNumberDoubleType;
LABEL_36:
                uint64_t v17 = (_NSDataFileBackedFuture *)CFNumberCreate(0LL, v44, &valuePtr);
                goto LABEL_37;
              case 8:
                double v46 = sqlite3_column_double(v11, i);
                uint64_t v17 = (_NSDataFileBackedFuture *)CFDateCreate(0LL, v46);
                goto LABEL_37;
              case 10:
              case 17:
                id v18 = objc_alloc(MEMORY[0x189603F48]);
                int v19 = sqlite3_column_blob(v11, i);
                uint64_t v17 = (_NSDataFileBackedFuture *)objc_msgSend( v18,  "initWithBytes:length:",  v19,  sqlite3_column_bytes(v11, i));
                goto LABEL_37;
              case 11:
                if (sqlite3_column_bytes(v11, i) != 16) {
                  break;
                }
                uint64_t v17 = (_NSDataFileBackedFuture *)objc_msgSend( objc_alloc(MEMORY[0x189607AB8]),  "initWithUUIDBytes:",  sqlite3_column_blob(v11, i));
                goto LABEL_37;
              case 12:
                uint64_t v20 = sqlite3_column_text(v11, i);
                CFStringRef v21 = CFStringCreateWithCString(0LL, (const char *)v20, 0x8000100u);
                __int128 v9 = (_NSDataFileBackedFuture *)(id)[MEMORY[0x189604030] URLWithString:v21];
                uint64_t v22 = v21;
                goto LABEL_20;
              case 13:
                uint64_t v23 = sqlite3_column_text(v11, i);
                char v24 = CFStringCreateWithCString(0LL, (const char *)v23, 0x8000100u);
                ArrayBySeparatingStrings = CFStringCreateArrayBySeparatingStrings(0LL, v24, @"/");
                ValueAtIndex = (const __CFString *)CFArrayGetValueAtIndex(ArrayBySeparatingStrings, 0LL);
                SInt32 IntValue = CFStringGetIntValue(ValueAtIndex);
                uint64_t v28 = (const __CFString *)CFArrayGetValueAtIndex(ArrayBySeparatingStrings, 1LL);
                __int128 v9 = (_NSDataFileBackedFuture *)(id)objc_msgSend( MEMORY[0x189607B18],  "valueWithRange:",  IntValue,  CFStringGetIntValue(v28));
                CFRelease(v24);
                uint64_t v22 = ArrayBySeparatingStrings;
LABEL_20:
                CFRelease(v22);
                goto LABEL_38;
              case 15:
                id v40 = objc_alloc(MEMORY[0x189603F48]);
                uint64_t v41 = sqlite3_column_blob(v11, i);
                uint64_t v42 = (void *)objc_msgSend(v40, "initWithBytes:length:", v41, sqlite3_column_bytes(v11, i));
                uint64_t v43 = (_NSDataFileBackedFuture *)+[_PFRoutines retainedDecodeValue:forTransformableAttribute:]( (uint64_t)_PFRoutines,  (uint64_t)v42,  (void *)[v10 propertyDescription]);
LABEL_29:
                __int128 v9 = v43;

                goto LABEL_38;
              case 16:
                uint64_t v29 = (const char *)sqlite3_column_blob(v11, i);
                int v30 = sqlite3_column_bytes(v11, i);
                if (v30 < 1) {
                  break;
                }
                unsigned int v31 = v30;
                int v32 = *(unsigned __int8 *)v29;
                if (v32 == 3)
                {
                  uint64_t v47 = [*(id *)(a1 + 16) fileBackedFuturesDirectory];
                  uint64_t v48 = [MEMORY[0x189603F48] dataWithBytes:v29 length:v31];
                  uint64_t v49 = objc_alloc(&OBJC_CLASS____NSDataFileBackedFuture);
                  uint64_t v17 = -[_NSDataFileBackedFuture initWithStoreMetadata:directory:]( v49,  "initWithStoreMetadata:directory:",  v48,  [MEMORY[0x189604030] fileURLWithPath:v47 isDirectory:1]);
LABEL_37:
                  __int128 v9 = v17;
                  goto LABEL_38;
                }

                if (v32 == 1)
                {
                  unsigned int v33 = objc_alloc(&OBJC_CLASS____PFExternalReferenceData);
                  uint64_t v34 = *(void *)(a1 + 16);
                  if (v34) {
                    uint64_t v35 = (*(_DWORD *)(v34 + 200) >> 2) & 7;
                  }
                  else {
                    uint64_t v35 = 0LL;
                  }
                  uint64_t v36 = v31;
                  uint64_t v37 = v29;
                  uint64_t v38 = 0LL;
                  uint64_t v39 = 0LL;
LABEL_51:
                  uint64_t v17 = -[_PFExternalReferenceData initWithStoreBytes:length:externalLocation:safeguardLocation:protectionLevel:]( v33,  "initWithStoreBytes:length:externalLocation:safeguardLocation:protectionLevel:",  v37,  v36,  v38,  v39,  v35);
                  goto LABEL_37;
                }

                uint64_t v64 = v29;
                uint64_t v50 = objc_msgSend( v14,  "stringWithFileSystemRepresentation:length:",  v29 + 1,  strnlen(v29 + 1, (v30 - 1)));
                int v51 = (void *)[*(id *)(a1 + 16) externalDataReferencesDirectory];
                uint64_t v52 = *(unint64_t **)(a1 + 16);
                if (v52)
                {
                  if (!atomic_load(v52 + 21))
                  {
                    uint64_t v63 = v51;
                    [v52 externalDataReferencesDirectory];
                    int v51 = v63;
                  }

                  uint64_t v52 = (unint64_t *)atomic_load(v52 + 22);
                }

                uint64_t v54 = [v51 stringByAppendingPathComponent:v50];
                uint64_t v55 = v52;
                uint64_t v56 = v54;
                uint64_t v57 = [v55 stringByAppendingPathComponent:v50];
                if (!v15 || [v14 fileExistsAtPath:v56])
                {
                  unsigned int v33 = objc_alloc(&OBJC_CLASS____PFExternalReferenceData);
                  uint64_t v58 = *(void *)(a1 + 16);
                  if (v58) {
                    uint64_t v35 = (*(_DWORD *)(v58 + 200) >> 2) & 7;
                  }
                  else {
                    uint64_t v35 = 0LL;
                  }
                  uint64_t v37 = v64;
                  uint64_t v36 = v31;
                  uint64_t v38 = v56;
                  uint64_t v39 = v57;
                  goto LABEL_51;
                }

                break;
              default:
LABEL_58:
                id v60 = +[_NSCoreDataException exceptionWithName:code:reason:userInfo:]( (uint64_t)&OBJC_CLASS____NSCoreDataException,  *MEMORY[0x189603A58],  256LL,  (uint64_t)@"fetching not implemented for this value type",  0LL);
                objc_exception_throw(v60);
                if (v62 == 1)
                {
                  objc_begin_catch(v61);

                  objc_exception_rethrow();
                  __break(1u);
                  JUMPOUT(0x1867FA590LL);
                }

                _Unwind_Resume(v61);
                return result;
            }
          }

          __int128 v9 = 0LL;
        }

- (void)handleCorruptedDB:(uint64_t)a1
{
  if (+[NSSQLCore debugDefault](&OBJC_CLASS___NSSQLCore, "debugDefault") >= 1)
  {
    if (*(_BYTE *)(a1 + 42)) {
      __int128 v10 = @"\x1B[31m\x1B[47mERROR:\x1B[0m\x1B[31m %@\x1B[0m";
    }
    else {
      __int128 v10 = @"%@";
    }
    _NSCoreDataLog(1LL, (uint64_t)v10, v4, v5, v6, v7, v8, v9, a2);
  }

  id v11 = +[_NSCoreDataException exceptionWithName:code:reason:userInfo:]( (uint64_t)_NSCoreDataException,  *MEMORY[0x189603A58],  259,  a2,  (void *)objc_msgSend( MEMORY[0x189603F68],  "dictionaryWithObjectsAndKeys:",  *(void *)(a1 + 32),  *MEMORY[0x1896074F8],  0));
  objc_exception_throw(v11);
  -[NSSQLiteConnection currentStats](v12, v13);
}

- (void)currentStats
{
  *(_OWORD *)a2 = 0u;
  *(_OWORD *)(a2 + 16) = 0u;
  if (a1)
  {
    *(void *)pHiwtr = 0LL;
    if (sqlite3_db_status(*(sqlite3 **)(a1 + 72), 8, pHiwtr, &pHiwtr[1], 0))
    {
      uint64_t v4 = sqlite3_errmsg(*(sqlite3 **)(a1 + 72));
      _NSCoreDataLog( 1LL,  (uint64_t)@"Unable to get SQLITE_DBSTATUS_CACHE_MISS: %s (%d)\n",  v5,  v6,  v7,  v8,  v9,  v10,  (uint64_t)v4);
    }

    else
    {
      *(void *)a2 = pHiwtr[0];
    }

    *(void *)pCur = 0LL;
    if (sqlite3_db_status(*(sqlite3 **)(a1 + 72), 7, pCur, &pCur[1], 0))
    {
      id v11 = sqlite3_errmsg(*(sqlite3 **)(a1 + 72));
      _NSCoreDataLog( 1LL,  (uint64_t)@"Unable to get SQLITE_DBSTATUS_CACHE_HIT: %s (%d)\n",  v12,  v13,  v14,  v15,  v16,  v17,  (uint64_t)v11);
    }

    else
    {
      *(void *)(a2 + 8) = pCur[0];
    }

    *(void *)uint64_t v39 = 0LL;
    if (sqlite3_db_status(*(sqlite3 **)(a1 + 72), 12, v39, &v39[1], 0))
    {
      id v18 = sqlite3_errmsg(*(sqlite3 **)(a1 + 72));
      _NSCoreDataLog( 1LL,  (uint64_t)@"Unable to get SQLITE_DBSTATUS_CACHE_SPILL: %s (%d)\n",  v19,  v20,  v21,  v22,  v23,  v24,  (uint64_t)v18);
    }

    else
    {
      *(void *)(a2 + 16) = v39[0];
    }

    uint64_t v25 = *(void *)(a1 + 352);
    if (!v25)
    {
      uint64_t v26 = -[NSSQLiteAdapter newStatementWithSQLString:]( (NSSQLiteStatement *)[(id)a1 adapter],  (uint64_t)@"pragma page_size");
      id v27 = objc_alloc_init(MEMORY[0x189603FA8]);
      uint64_t v28 = -[NSSQLColumn initWithColumnName:sqlType:]( objc_alloc(&OBJC_CLASS___NSSQLColumn),  "initWithColumnName:sqlType:",  @"page_size",  2LL);
      [v27 addObject:v28];

      -[NSSQLiteConnection prepareSQLStatement:](a1, v26);
      -[NSSQLiteConnection setColumnsToFetch:]((void *)a1, v27);
      [(id)a1 execute];
      uint64_t v25 = 0LL;
      id v29 = objc_alloc_init(MEMORY[0x189603FA8]);
      while (1)
      {
        int v30 = -[NSSQLiteConnection newFetchedArray](a1);
        if (!v30) {
          break;
        }
        unsigned int v31 = v30;
        if ([v30 count] == 1)
        {
          uint64_t v32 = objc_msgSend((id)objc_msgSend(v31, "objectAtIndex:", 0), "longLongValue");
          if (+[NSSQLCore debugDefault](&OBJC_CLASS___NSSQLCore, "debugDefault") >= 1) {
            _NSCoreDataLog(4LL, (uint64_t)@"Fetched page size: %lld", v33, v34, v35, v36, v37, v38, v32);
          }
        }

        else
        {
          uint64_t v32 = v25;
        }

        uint64_t v25 = v32;
      }

      -[NSSQLiteConnection releaseSQLStatement](a1);
      -[NSSQLiteConnection setColumnsToFetch:]((void *)a1, 0LL);
      *(_DWORD *)(a1 + 312) &= ~2u;
      *(void *)(a1 + 100) = 0LL;
      *(void *)(a1 + 92) = 0LL;
      *(_DWORD *)(a1 + 108) = 0;

      *(void *)(a1 + 352) = v25;
    }

    *(void *)(a2 + 24) = v25;
  }

- (uint64_t)fetchBufferResultSet:(uint64_t)a3 usingFetchPlan:
{
  uint64_t v192 = *MEMORY[0x1895F89C0];
  if (result)
  {
    uint64_t v4 = result;
    uint64_t v5 = *(dispatch_queue_s **)(result + 8);
    if (v5) {
      dispatch_assert_queue_V2(v5);
    }
    int v6 = *(_DWORD *)(a3 + 16);
    if (!v6) {
      int v6 = 0x7FFFFFFF;
    }
    int v175 = v6;
    int v173 = *(_DWORD *)(a3 + 72);
    uint64_t v170 = [*(id *)(a3 + 40) model];
    uint64_t v7 = *(void *)(a3 + 48);
    if (v7) {
      int v174 = *(_BYTE *)(v7 + 43) & 1;
    }
    else {
      int v174 = 0;
    }
    uint64_t v8 = *(void *)(a3 + 40);
    if (v8) {
      uint64_t v9 = *(void **)(v8 + 240);
    }
    else {
      uint64_t v9 = 0LL;
    }
    uint64_t v184 = [v9 length];
    uint64_t v10 = *(void *)(a3 + 40);
    if (v10) {
      unsigned int v11 = *(_DWORD *)(v10 + 184);
    }
    else {
      unsigned int v11 = 0;
    }
    uint64_t v185 = v4;
    uint64_t v169 = a3;
    uint64_t v179 = *(uint64_t (**)(uint64_t, char *, sqlite3_int64))(a3 + 64);
    uint64_t v172 = *(void *)(a3 + 40);
    plan_for_entity = (int *)_sql_read_only_fetch_plan_for_entity((unint64_t *)v10);
    uint64_t v13 = (objc_class *)objc_opt_class();
    size_t InstanceSize = class_getInstanceSize(v13);
    if (((InstanceSize + 7) & 0xFFFFFFFFFFFFFFF8LL) + 8 * v184 + *plan_for_entity <= 0x800) {
      size_t v15 = 2048LL;
    }
    else {
      size_t v15 = ((InstanceSize + 7) & 0xFFFFFFFFFFFFFFF8LL) + 8 * v184 + *plan_for_entity;
    }
    uint64_t v190 = v15;
    uint64_t v16 = (malloc_zone_t *)_PF_Private_Malloc_Zone;
    if (!_PF_Private_Malloc_Zone) {
      uint64_t v16 = malloc_default_zone();
    }
    __int128 v188 = malloc_zone_calloc(v16, 1uLL, v15);
    if (v175 >= 1)
    {
      unsigned int v176 = 0;
      int v17 = 0;
      unint64_t v18 = v11;
      uint64_t v171 = 2 * v184;
      while (1)
      {
        if ((*(_BYTE *)(v185 + 312) & 2) == 0) {
          goto LABEL_167;
        }
        if ((v173 & 1) != 0)
        {
          unsigned int v19 = sqlite3_column_int(*(sqlite3_stmt **)(v185 + 80), 0);
          unsigned int v20 = v19;
          if (!v19)
          {
            -[NSSQLiteConnection handleCorruptedDB:]( v185,  (uint64_t)@"The database appears corrupt.  (invalid entity key)");
            goto LABEL_183;
          }

          unint64_t v18 = v19;
          if (v19 != *(_DWORD *)(v185 + 92))
          {
            uint64_t v172 = (*(uint64_t (**)(uint64_t, char *, void))(v169 + 64))(v170, sel_entityForID_, v19);
            *(void *)(v185 + 104) = v172;
            *(_DWORD *)(v185 + 92) = v20;
            plan_for_entity = (int *)_sql_read_only_fetch_plan_for_entity((unint64_t *)v172);
          }
        }

        int v177 = v17;
        __int128 v189 = plan_for_entity;
        int v21 = plan_for_entity[1];
        bzero(v188 + 2, v190 - 8);
        v188[5] = 0;
        unint64_t v178 = v18;
        *((void *)v188 + 3) = v18;
        *((void *)v188 + 4) = 0LL;
        bzero(v188 + 10, v171 * 4);
        uint64_t v22 = (char *)&v188[v171 + 10];
        unsigned int v182 = v21;
        if (v21) {
          break;
        }
        int v186 = 0;
LABEL_161:
        v188[5] = v186;
        bufferResultSetIngestRow(a2, v188, ((unint64_t)(v22 + 7) & 0xFFFFFFFFFFFFFFF8LL) - (void)v188);
        uint64_t v138 = v185;
        ++*(_DWORD *)(v185 + 88);
        int v139 = v177;
        ++v176;
        unint64_t v18 = v178;
        plan_for_entity = v189;
LABEL_162:
        _execute(v138);
        int v17 = v139 + 1;
        if (v17 == v175) {
          goto LABEL_167;
        }
      }

      unsigned int v23 = 0;
      unsigned __int8 v183 = 0;
      sqlite3_int64 v181 = 0LL;
      uint64_t v24 = 0LL;
      int v186 = 0;
      uint64_t v25 = 0LL;
      uint64_t v26 = (char *)&v188[v171 + 10];
      id v27 = v26;
      while (1)
      {
        uint64_t v22 = (char *)((unint64_t)(v27 + 7) & 0xFFFFFFFFFFFFFFF8LL);
        int v28 = LOBYTE(v189[6 * v23 + 5]);
        if (v22 - v27 >= 1) {
          *(void *)&v26[8 * (v25 - v184) - 8] += v22 - v27;
        }
        id v29 = (char *)v188;
        if ((unint64_t)((char *)v188 - v22 + v190) > 0xF)
        {
          __int128 v187 = v26;
        }

        else
        {
          v190 += 16LL;
          int v30 = (char *)bufferResultSetRealloc(v188, (unint64_t *)&v190);
          __int128 v187 = &v30[v26 - (char *)v188];
          __int128 v188 = v30;
          uint64_t v22 = (char *)((unint64_t)&v30[v27 - v29 + 7] & 0xFFFFFFFFFFFFFFF8LL);
        }

        if (v23 >= 7 && (v183 & 1) != 0)
        {
          unsigned int v31 = v24;
          if (!v24) {
            unsigned int v31 = (void *)v179([*(id *)(v185 + 16) model], sel_entityForID_, v181);
          }
          uint64_t v24 = v31;
          id v32 = +[_PFPersistentHistoryModel _retainedTombstonesForEntity:]( (uint64_t)&OBJC_CLASS____PFPersistentHistoryModel,  v31);
          int v33 = objc_msgSend( (id)objc_msgSend( (id)objc_msgSend((id)objc_msgSend(*(id *)&v189[6 * v23 + 6], "propertyDescription"), "name"),  "stringByReplacingOccurrencesOfString:withString:",  @"TOMBSTONE",  &stru_189EAC2E8),  "intValue");
          if (v33 < (int)[v32 count])
          {
            uint64_t v34 = [v32 objectAtIndexedSubscript:v33];
            if (v24) {
              uint64_t v35 = (void *)[(id)v24[5] objectForKey:v34];
            }
            else {
              uint64_t v35 = 0LL;
            }
            int v28 = [v35 sqlType];
          }
        }

        switch(v28)
        {
          case 1:
            uint64_t v66 = &v189[6 * v23];
            int v68 = v66[3];
            uint64_t v67 = v66 + 3;
            int v69 = sqlite3_column_int(*(sqlite3_stmt **)(v185 + 80), v68);
            int v70 = v69;
            __int128 v71 = &v189[6 * v23];
            int v72 = *((unsigned __int8 *)v71 + 21);
            int v73 = v71[4];
            if (v72 != 4)
            {
              uint64_t v26 = v187;
              if ((v73 & 1) != 0)
              {
                if (v69)
                {
                  *(_DWORD *)uint64_t v22 = 0;
                }

                else
                {
                  int v116 = sqlite3_column_type(*(sqlite3_stmt **)(v185 + 80), *v67);
                  *(_DWORD *)uint64_t v22 = v116 == 5;
                  if (v116 == 5) {
                    goto LABEL_118;
                  }
                }
              }

              *(_DWORD *)uint64_t v22 = v70;
              if (v172) {
                int v117 = *(_DWORD *)(v172 + 184);
              }
              else {
                int v117 = 0;
              }
              BOOL v120 = v23 == 3 && v117 == 16001 && v70 == 2;
              v183 |= v120;
              ++v186;
              uint64_t v52 = v22 + 4;
              goto LABEL_117;
            }

            uint64_t v26 = v187;
            if ((v73 & 1) != 0)
            {
              if (v69)
              {
                *(_DWORD *)uint64_t v22 = 0;
              }

              else
              {
                int v110 = sqlite3_column_type(*(sqlite3_stmt **)(v185 + 80), *v67);
                *(_DWORD *)uint64_t v22 = v110 == 5;
                if (v110 == 5)
                {
                  ++v23;
                  uint64_t v52 = v22;
                  goto LABEL_117;
                }
              }
            }

            *(void *)uint64_t v22 = v70;
            uint64_t v52 = v22 + 8;
            uint64_t v111 = &v189[6 * ++v23];
            int v113 = v111[3];
            uint64_t v112 = v111 + 3;
            sqlite3_int64 v114 = sqlite3_column_int64(*(sqlite3_stmt **)(v185 + 80), v113);
            sqlite3_int64 v115 = v114;
            if ((v189[6 * v23 + 4] & 1) != 0)
            {
              if (v114)
              {
                *(void *)uint64_t v52 = 0LL;
              }

              else
              {
                int v121 = sqlite3_column_type(*(sqlite3_stmt **)(v185 + 80), *v112);
                *(void *)uint64_t v52 = v121 == 5;
                if (v121 == 5)
                {
                  _NSCoreDataLog( 1LL,  (uint64_t)@"BufferAllocations found a bad Object ID",  v122,  v123,  v124,  v125,  v126,  v127,  v164);
                  goto LABEL_117;
                }
              }
            }

            *((void *)v22 + 1) = v115;
            uint64_t v52 = v22 + 16;
            goto LABEL_116;
          case 2:
          case 3:
            uint64_t v56 = &v189[6 * v23];
            int v58 = v56[3];
            uint64_t v57 = v56 + 3;
            sqlite3_int64 v59 = sqlite3_column_int64(*(sqlite3_stmt **)(v185 + 80), v58);
            sqlite3_int64 v60 = v59;
            if ((v189[6 * v23 + 4] & 1) == 0) {
              goto LABEL_101;
            }
            if (v59)
            {
              *(_DWORD *)uint64_t v22 = 0;
            }

            else
            {
              int v99 = sqlite3_column_type(*(sqlite3_stmt **)(v185 + 80), *v57);
              *(_DWORD *)uint64_t v22 = v99 == 5;
              if (v99 == 5) {
                goto LABEL_45;
              }
            }

- (void)setSecureDeleteMode:(uint64_t)a1
{
  if (a1)
  {
    if (a2) {
      stat v2 = @"pragma secure_delete=1";
    }
    else {
      stat v2 = @"pragma secure_delete=0";
    }
    -[NSSQLiteConnection _executeSQLString:](a1, v2);
  }

- (void)setExclusiveLockingMode:(BOOL)a3
{
  if (a3) {
    uint64_t v4 = @"pragma locking_mode=EXCLUSIVE";
  }
  else {
    uint64_t v4 = @"pragma locking_mode=NORMAL";
  }
  -[NSSQLiteConnection _executeSQLString:]((uint64_t)self, v4);
  -[NSSQLiteConnection beginTransaction]((uint64_t)self);
  -[NSSQLiteConnection commitTransaction]((uint64_t)self);
  -[NSSQLiteConnection endFetchAndRecycleStatement:]((uint64_t)self, 0);
}

- (id)fetchTableNames
{
  if (result)
  {
    uint64_t v1 = (uint64_t)result;
    stat v2 = (dispatch_queue_s *)*((void *)result + 1);
    if (v2) {
      dispatch_assert_queue_V2(v2);
    }
    uint64_t v3 = 0LL;
    char v4 = 0;
    for (int i = 3; (v4 & 1) == 0 && (i & 0x80000000) == 0; --i)
    {
      -[NSSQLiteConnection connect](v1);
      uint64_t v5 = (void *)[objc_alloc(MEMORY[0x189603FA8]) initWithCapacity:8];
      int v6 = -[NSSQLiteAdapter newStatementWithSQLString:]( (NSSQLiteStatement *)[(id)v1 adapter],  (uint64_t)@"SELECT TBL_NAME FROM SQLITE_MASTER WHERE TYPE = table ORDER BY TBL_NAME");
      uint64_t v7 = -[NSSQLColumn initWithColumnName:sqlType:]( objc_alloc(&OBJC_CLASS___NSSQLColumn),  "initWithColumnName:sqlType:",  @"TBL_NAME",  6LL);
      uint64_t v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x189603F18]), "initWithObjects:", v7, 0);
      -[NSSQLiteConnection prepareSQLStatement:](v1, v6);
      [(id)v1 execute];
      -[NSSQLiteConnection setColumnsToFetch:]((void *)v1, v8);
      while (1)
      {
        uint64_t v9 = -[NSSQLiteConnection newFetchedArray](v1);
        uint64_t v10 = v9;
        if (!v9) {
          break;
        }
        objc_msgSend(v5, "addObject:", objc_msgSend((id)objc_msgSend(v9, "objectAtIndex:", 0), "uppercaseString"));
      }

      char v4 = 1;
      -[NSSQLiteConnection releaseSQLStatement](v1);
      -[NSSQLiteConnection setColumnsToFetch:]((void *)v1, 0LL);
      *(_DWORD *)(v1 + 312) &= ~2u;
      *(void *)(v1 + 92) = 0LL;
      *(void *)(v1 + 100) = 0LL;
      *(_DWORD *)(v1 + 108) = 0;

      uint64_t v3 = v5;
    }

    return v3;
  }

  return result;
}

- (id)fetchCreationSQLForType:(void *)a3 containing:
{
  char v4 = *(dispatch_queue_s **)(a1 + 8);
  if (v4) {
    dispatch_assert_queue_V2(v4);
  }
  char v5 = 0;
  int v6 = 0LL;
  for (int i = 3; (v5 & 1) == 0 && (i & 0x80000000) == 0; --i)
  {
    uint64_t v8 = (void *)[objc_alloc(MEMORY[0x189603FA8]) initWithCapacity:8];
    uint64_t v9 = (void *)[objc_alloc(MEMORY[0x189607940]) initWithFormat:@"SELECT TBL_NAME, SQL FROM SQLITE_MASTER WHERE TYPE = \"%@\"", a2];
    if ([a3 length]) {
      [v9 appendFormat:@" AND SQL LIKE \"%%%@%%\"", a3];
    }
    [v9 appendString:@" ORDER BY TBL_NAME"];
    uint64_t v10 = -[NSSQLiteAdapter newStatementWithSQLString:]( (NSSQLiteStatement *)[(id)a1 adapter],  (uint64_t)v9);
    unsigned int v11 = -[NSSQLColumn initWithColumnName:sqlType:]( objc_alloc(&OBJC_CLASS___NSSQLColumn),  "initWithColumnName:sqlType:",  @"TBL_NAME",  6LL);
    uint64_t v12 = -[NSSQLColumn initWithColumnName:sqlType:]( objc_alloc(&OBJC_CLASS___NSSQLColumn),  "initWithColumnName:sqlType:",  @"SQL",  6LL);
    uint64_t v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x189603F18]), "initWithObjects:", v11, v12, 0);

    -[NSSQLiteConnection connect](a1);
    -[NSSQLiteConnection prepareSQLStatement:](a1, v10);
    [(id)a1 execute];
    -[NSSQLiteConnection setColumnsToFetch:]((void *)a1, v13);
    while (1)
    {
      uint64_t v14 = -[NSSQLiteConnection newFetchedArray](a1);
      size_t v15 = v14;
      if (!v14) {
        break;
      }
      if ([v14 count] == 2)
      {
        uint64_t v16 = (void *)[v15 objectAtIndex:0];
        int v17 = (void *)[v15 objectAtIndex:1];
        if ([v16 isNSString])
        {
          if ([v17 isNSString])
          {
            unint64_t v18 = (void *)objc_msgSend( objc_alloc(MEMORY[0x189603F18]),  "initWithObjects:",  objc_msgSend(v16, "uppercaseString"),  objc_msgSend(v17, "uppercaseString"),  0);
            [v8 addObject:v18];
          }
        }
      }
    }

    char v5 = 1;
    -[NSSQLiteConnection releaseSQLStatement](a1);
    -[NSSQLiteConnection setColumnsToFetch:]((void *)a1, 0LL);
    *(_DWORD *)(a1 + 312) &= ~2u;
    *(void *)(a1 + 92) = 0LL;
    *(void *)(a1 + 100) = 0LL;
    *(_DWORD *)(a1 + 108) = 0;

    int v6 = v8;
  }

  return v6;
}

- (id)fetchTableCreationSQL
{
  if (result) {
    return -[NSSQLiteConnection fetchCreationSQLForType:containing:]((uint64_t)result, (uint64_t)@"table", 0LL);
  }
  return result;
}

- (id)fetchTableCreationSQLContaining:(id)result
{
  if (result) {
    return -[NSSQLiteConnection fetchCreationSQLForType:containing:]((uint64_t)result, (uint64_t)@"table", a2);
  }
  return result;
}

- (uint64_t)_hasTableWithName:(int)a3 isTemp:
{
  if (a1)
  {
    char v5 = *(dispatch_queue_s **)(a1 + 8);
    if (v5) {
      dispatch_assert_queue_V2(v5);
    }
    context = (void *)MEMORY[0x186E3E5D8]();
    char v6 = 0;
    char v17 = 0;
    if ((*(_BYTE *)(a1 + 312) & 0x80) != 0) {
      int v7 = 1;
    }
    else {
      int v7 = 3;
    }
    if (a3) {
      uint64_t v8 = @"SQLITE_TEMP_MASTER";
    }
    else {
      uint64_t v8 = @"SQLITE_MASTER";
    }
    unint64_t v18 = v8;
    while ((v6 & 1) == 0 && (v7 & 0x80000000) == 0)
    {
      -[NSSQLiteConnection connect](a1);
      uint64_t v9 = (void *)[objc_alloc(NSString) initWithFormat:@"SELECT TBL_NAME FROM %@ WHERE TBL_NAME = '%@'", v18, a2];
      uint64_t v10 = -[NSSQLiteAdapter newStatementWithSQLString:]( (NSSQLiteStatement *)[(id)a1 adapter],  (uint64_t)v9);

      unsigned int v11 = -[NSSQLColumn initWithColumnName:sqlType:]( objc_alloc(&OBJC_CLASS___NSSQLColumn),  "initWithColumnName:sqlType:",  @"TBL_NAME",  6LL);
      uint64_t v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x189603F18]), "initWithObjects:", v11, 0);

      -[NSSQLiteConnection prepareSQLStatement:](a1, v10);
      [(id)a1 execute];
      -[NSSQLiteConnection setColumnsToFetch:]((void *)a1, v12);

      uint64_t v13 = -[NSSQLiteConnection newFetchedArray](a1);
      if (v13)
      {
        char v17 = 1;

        uint64_t v14 = v10;
        char v6 = 1;
      }

      else
      {
        char v6 = 1;
        uint64_t v14 = v10;
      }

      -[NSSQLiteConnection releaseSQLStatement](a1);
      -[NSSQLiteConnection setColumnsToFetch:]((void *)a1, 0LL);
      *(_DWORD *)(a1 + 312) &= ~2u;
      *(void *)(a1 + 92) = 0LL;
      *(void *)(a1 + 100) = 0LL;
      *(_DWORD *)(a1 + 108) = 0;

      --v7;
    }

    objc_autoreleasePoolPop(context);
  }

  else
  {
    char v17 = 0;
  }

  return v17 & 1;
}

- (void)_createInsertStatementsForEntities:(void *)a1
{
  uint64_t v61 = *MEMORY[0x1895F89C0];
  int v42 = (void *)objc_msgSend(MEMORY[0x189603FA8], "arrayWithCapacity:", objc_msgSend(a2, "count"));
  __int128 v46 = 0u;
  __int128 v47 = 0u;
  __int128 v48 = 0u;
  __int128 v49 = 0u;
  obuint64_t j = a2;
  uint64_t v40 = [a2 countByEnumeratingWithState:&v46 objects:v58 count:16];
  if (v40)
  {
    uint64_t v39 = *(void *)v47;
    do
    {
      uint64_t v3 = 0LL;
      do
      {
        if (*(void *)v47 != v39)
        {
          uint64_t v4 = v3;
          objc_enumerationMutation(obj);
          uint64_t v3 = v4;
        }

        uint64_t v43 = v3;
        uint64_t v45 = *(void *)(*((void *)&v46 + 1) + 8 * v3);
        id v5 = objc_alloc_init(MEMORY[0x189603FA8]);
        id v6 = objc_alloc_init(MEMORY[0x189603FA8]);
        id v44 = objc_alloc_init(MEMORY[0x189603FA8]);
        uint64_t v7 = v45;
        if (v45)
        {
          while (v7)
          {
            uint64_t v8 = v7;
            uint64_t v7 = *(void *)(v7 + 168);
            if (v7 == v8)
            {
              uint64_t v9 = *(void **)(v8 + 72);
              goto LABEL_10;
            }
          }
        }

        uint64_t v9 = 0LL;
LABEL_10:
        __int128 v56 = 0u;
        __int128 v57 = 0u;
        __int128 v54 = 0u;
        __int128 v55 = 0u;
        uint64_t v10 = (void *)[v9 sortedArrayUsingFunction:sortColumnsByType context:0];
        uint64_t v11 = [v10 countByEnumeratingWithState:&v54 objects:v60 count:16];
        if (v11)
        {
          uint64_t v12 = *(void *)v55;
          do
          {
            for (uint64_t i = 0LL; i != v11; ++i)
            {
              if (*(void *)v55 != v12) {
                objc_enumerationMutation(v10);
              }
              uint64_t v14 = *(void **)(*((void *)&v54 + 1) + 8 * i);
              objc_msgSend(v5, "addObject:", objc_msgSend(v14, "columnName"));
              objc_msgSend(v6, "addObject:", objc_msgSend(v14, "columnName"));
            }

            uint64_t v11 = [v10 countByEnumeratingWithState:&v54 objects:v60 count:16];
          }

          while (v11);
        }

        uint64_t v15 = [v5 componentsJoinedByString:@","];
        uint64_t v16 = [(id)v45 tableName];
        char v17 = (void *)[NSString stringWithFormat:@"_DEFERRED_TEMP__%@", v16];
        if (v45 && (*(void *)(v45 + 160) || (int v28 = *(void **)(v45 + 152)) != 0 && [v28 count]))
        {
          unint64_t v18 = (void *)[objc_alloc(MEMORY[0x189607940]) initWithString:@" WHERE "];
          [v18 appendString:v17];
          [v18 appendString:@"."];
          [v18 appendString:@"Z_ENT"];
          [v18 appendString:@" = "];
          uint64_t v19 = objc_msgSend( (id)objc_msgSend((id)objc_msgSend((id)v45, "entityDescription"), "userInfo"),  "objectForKey:",  @"NSEntityRenamingShouldRebaseKey");
          if (!v19) {
            goto LABEL_35;
          }
          __int128 v52 = 0u;
          __int128 v53 = 0u;
          __int128 v50 = 0u;
          __int128 v51 = 0u;
          unsigned int v20 = *(void **)(v45 + 152);
          uint64_t v21 = [v20 countByEnumeratingWithState:&v50 objects:v59 count:16];
          if (!v21) {
            goto LABEL_35;
          }
          uint64_t v37 = v17;
          uint64_t v38 = v15;
          uint64_t v22 = 0LL;
          uint64_t v23 = *(void *)v51;
          do
          {
            for (uint64_t j = 0LL; j != v21; ++j)
            {
              if (*(void *)v51 != v23) {
                objc_enumerationMutation(v20);
              }
              if (!(_DWORD)v22)
              {
                uint64_t v25 = *(unsigned int **)(*((void *)&v50 + 1) + 8 * j);
                int v26 = objc_msgSend((id)objc_msgSend(v25, "name"), "isEqualToString:", v19);
                if (v25) {
                  int v27 = v26;
                }
                else {
                  int v27 = 0;
                }
                if (v27 == 1) {
                  uint64_t v22 = v25[46];
                }
                else {
                  uint64_t v22 = 0LL;
                }
              }
            }

            uint64_t v21 = [v20 countByEnumeratingWithState:&v50 objects:v59 count:16];
          }

          while (v21);
          char v17 = v37;
          uint64_t v15 = v38;
          if (!(_DWORD)v22) {
LABEL_35:
          }
            uint64_t v22 = *(unsigned int *)(v45 + 184);
          objc_msgSend(v18, "appendFormat:", @"%d", v22);
        }

        else
        {
          unint64_t v18 = 0LL;
        }

        uint64_t v29 = [v6 componentsJoinedByString:@","];
        id v30 = v17;
        unsigned int v31 = (void *)[objc_alloc(MEMORY[0x189607940]) initWithString:@"INSERT INTO "];
        objc_msgSend(v31, "appendString:", objc_msgSend((id)v45, "tableName"));
        objc_msgSend(v31, "appendString:", @" (");
        [v31 appendString:v15];
        [v31 appendString:@" SELECT "]);
        [v31 appendString:v29];
        [v31 appendString:@" FROM "];
        [v31 appendString:v30];
        if (v18)
        {
          [v31 appendString:v18];
        }

        id v32 = -[NSSQLiteAdapter newStatementWithSQLString:]( (NSSQLiteStatement *)[a1 adapter],  (uint64_t)v31);
        -[NSSQLiteAdapter _useModel:]((uint64_t)v32, v44);

        [v42 addObject:v32];
        if (v45)
        {
          if (![*(id *)(v45 + 152) count]) {
            goto LABEL_46;
          }
          uint64_t v33 = *(void *)(v45 + 152);
          goto LABEL_45;
        }

        if ([0 count])
        {
          uint64_t v33 = 0LL;
LABEL_45:
          objc_msgSend(v42, "addObjectsFromArray:", -[NSSQLiteConnection _createInsertStatementsForEntities:](a1, v33));
        }

- (BOOL)finishDeferredLightweightMigration:(uint64_t)a1
{
  uint64_t v375 = *MEMORY[0x1895F89C0];
  if (a1)
  {
    uint64_t v3 = *(dispatch_queue_s **)(a1 + 8);
    if (v3) {
      dispatch_assert_queue_V2(v3);
    }
    v302 = (void *)a1;
    if (+[NSSQLCore debugDefault](&OBJC_CLASS___NSSQLCore, "debugDefault") < 1)
    {
      int v11 = +[NSMappingModel migrationDebugLevel](&OBJC_CLASS___NSMappingModel, "migrationDebugLevel");
      uint64_t v12 = getprogname();
      uint64_t v10 = v12;
      if (v11 < 1)
      {
        int v301 = 0;
        if (!v12) {
          goto LABEL_12;
        }
        goto LABEL_10;
      }
    }

    else
    {
      uint64_t v10 = getprogname();
    }

    uint64_t v13 = @"without";
    if (a2) {
      uint64_t v13 = @"with";
    }
    _NSCoreDataLog( 4LL,  (uint64_t)@"Deferred Lightweight Migration %@ all tasks",  v4,  v5,  v6,  v7,  v8,  v9,  (uint64_t)v13);
    int v301 = 1;
    if (!v10) {
      goto LABEL_12;
    }
LABEL_10:
    if (!strncmp("assetsd", v10, 7uLL) || !strncmp("photolibraryd", v10, 0xDuLL))
    {
      char v292 = 1;
      goto LABEL_14;
    }

- (void)fetchMetadata
{
  if (a1)
  {
    stat v2 = *(dispatch_queue_s **)(a1 + 8);
    if (v2) {
      dispatch_assert_queue_V2(v2);
    }
    uint64_t v3 = (void *)[MEMORY[0x189603FC8] dictionaryWithCapacity:2];
    uint64_t v4 = -[NSSQLiteAdapter newStatementWithSQLString:]( (NSSQLiteStatement *)[(id)a1 adapter],  objc_msgSend( NSString,  "stringWithFormat:",  @"SELECT %@, %@, %@ FROM %@",  @"Z_VERSION",  @"Z_UUID",  @"Z_PLIST",  @"Z_METADATA"));
    -[NSSQLiteConnection prepareSQLStatement:](a1, v4);
    [(id)a1 execute];
    uint64_t v5 = *(void **)(a1 + 64);
    if (!v5)
    {
      uint64_t v6 = -[NSSQLColumn initWithColumnName:sqlType:]( objc_alloc(&OBJC_CLASS___NSSQLColumn),  "initWithColumnName:sqlType:",  @"Z_VERSION",  1LL);
      uint64_t v7 = -[NSSQLColumn initWithColumnName:sqlType:]( objc_alloc(&OBJC_CLASS___NSSQLColumn),  "initWithColumnName:sqlType:",  @"Z_UUID",  6LL);
      uint64_t v8 = -[NSSQLColumn initWithColumnName:sqlType:]( objc_alloc(&OBJC_CLASS___NSSQLColumn),  "initWithColumnName:sqlType:",  @"Z_PLIST",  10LL);
      *(void *)(a1 + 64) = objc_msgSend(objc_alloc(MEMORY[0x189603F18]), "initWithObjects:", v6, v7, v8, 0);

      uint64_t v5 = *(void **)(a1 + 64);
    }

    -[NSSQLiteConnection setColumnsToFetch:]((void *)a1, v5);
    uint64_t v9 = -[NSSQLiteConnection newFetchedArray](a1);
    uint64_t v10 = v9;
    if (!v9) {
      goto LABEL_15;
    }
    uint64_t v11 = [v9 objectAtIndex:2];
    if (v11 != NSKeyValueCoding_NullValue)
    {
      uint64_t v12 = (void *)[v10 objectAtIndex:2];
      uint64_t v13 = (uint64_t)v12;
      if (v12)
      {
        if ([v12 length])
        {
          uint64_t v27 = 0LL;
          int v14 = (void *)[MEMORY[0x1896079E8] propertyListWithData:v13 options:0 format:0 error:&v27];
          uint64_t v21 = v14;
          if (!v14 || ([v14 isNSDictionary] & 1) == 0)
          {
            _NSCoreDataLog( 1LL,  (uint64_t)@"failure reading metadata plist with data bytes: %@",  v15,  v16,  v17,  v18,  v19,  v20,  v13);
            uint64_t v24 = v27;
            if (!v27) {
              uint64_t v24 = @"<null>";
            }
            uint64_t v25 = [NSString stringWithFormat:@"An error %@ occurred converting the metadata plist data: %@", v24, v13];
            id v26 = +[_NSCoreDataException exceptionWithName:code:reason:userInfo:]( (uint64_t)&OBJC_CLASS____NSCoreDataException,  *MEMORY[0x189603A58],  259LL,  v25,  0LL);
            objc_exception_throw(v26);
LABEL_21:
            __break(1u);
            return;
          }

          [v3 setDictionary:v21];
        }
      }
    }

    uint64_t v22 = [v10 objectAtIndex:1];
    if (v22)
    {
      [v3 setObject:v22 forKey:@"NSStoreUUID"];
LABEL_15:

      -[NSSQLiteConnection setColumnsToFetch:]((void *)a1, 0LL);
      *(_DWORD *)(a1 + 312) &= ~2u;
      *(void *)(a1 + 100) = 0LL;
      *(void *)(a1 + 92) = 0LL;
      *(_DWORD *)(a1 + 108) = 0;
      -[NSSQLiteConnection releaseSQLStatement](a1);

      return;
    }

    id v23 = +[_NSCoreDataException exceptionWithName:code:reason:userInfo:]( (uint64_t)&OBJC_CLASS____NSCoreDataException,  *MEMORY[0x189603A58],  259LL,  (uint64_t)@"Metadata table is missing database UUID.",  0LL);
    objc_exception_throw(v23);
    goto LABEL_21;
  }

- (void)saveMetadata:(void *)a1
{
  if (!a1) {
    return;
  }
  uint64_t v4 = (dispatch_queue_s *)a1[1];
  if (v4) {
    dispatch_assert_queue_V2(v4);
  }
  if ((-[__CFString isNSDictionary](a2, "isNSDictionary") & 1) == 0)
  {
    if (a2) {
      uint64_t v27 = a2;
    }
    else {
      uint64_t v27 = @"<null>";
    }
    _NSCoreDataLog(1LL, (uint64_t)@"metadata is not a dictionary: %@", v5, v6, v7, v8, v9, v10, (uint64_t)v27);
    uint64_t v28 = *MEMORY[0x189603A60];
    uint64_t v29 = [NSString stringWithFormat:@"The metadata is not a dictionary: %@", v27, v38];
LABEL_21:
    id v37 = +[_NSCoreDataException exceptionWithName:code:reason:userInfo:]( (uint64_t)&OBJC_CLASS____NSCoreDataException,  v28,  134030LL,  v29,  0LL);
    objc_exception_throw(v37);
    -[NSSQLiteConnection _dropTableWithName:]();
    return;
  }

  uint64_t v11 = -[NSSQLiteAdapter newStatementWithSQLString:]( (NSSQLiteStatement *)[a1 adapter],  objc_msgSend( NSString,  "stringWithFormat:",  @"DELETE FROM %@ WHERE %@ = ?",  @"Z_METADATA",  @"Z_VERSION"));
  uint64_t v12 = objc_alloc(&OBJC_CLASS___NSSQLBindVariable);
  uint64_t v13 = -[NSSQLBindVariable initWithValue:sqlType:propertyDescription:]( v12,  "initWithValue:sqlType:propertyDescription:",  [MEMORY[0x189607968] numberWithInt:1],  1,  0);
  -[NSSQLiteStatement addBindVariable:]((uint64_t)v11, v13);
  -[NSSQLiteConnection prepareAndExecuteSQLStatement:]((uint64_t)a1, v11);

  uint64_t v14 = -[__CFString objectForKey:](a2, "objectForKey:", @"NSStoreUUID");
  uint64_t v15 = (void *)-[__CFString mutableCopy](a2, "mutableCopy");
  [v15 removeObjectForKey:@"NSStoreUUID"];
  uint64_t v39 = 0LL;
  uint64_t v16 = (__CFString *)[MEMORY[0x1896079E8] dataWithPropertyList:v15 format:200 options:0 error:&v39];

  if (!v16)
  {
    uint64_t v16 = @"<null>";
    goto LABEL_18;
  }

  if ((-[__CFString isNSData](v16, "isNSData") & 1) == 0)
  {
LABEL_18:

    _NSCoreDataLog( 1LL,  (uint64_t)@"failure writing metadata plist with data bytes: %@",  v30,  v31,  v32,  v33,  v34,  v35,  (uint64_t)v16);
    uint64_t v28 = *MEMORY[0x189603A60];
    uint64_t v36 = v39;
    if (!v39) {
      uint64_t v36 = @"<null>";
    }
    uint64_t v29 = [NSString stringWithFormat:@"An error %@ occurred converting the metadata plist data: %@", v36, v16];
    goto LABEL_21;
  }

  uint64_t v17 = -[NSSQLiteAdapter newStatementWithSQLString:]( (NSSQLiteStatement *)[a1 adapter],  objc_msgSend( NSString,  "stringWithFormat:",  @"INSERT INTO %@ (%@, %@, %@) VALUES (?, ?, ?)",  @"Z_METADATA",  @"Z_VERSION",  @"Z_UUID",  @"Z_PLIST"));
  uint64_t v18 = -[NSSQLBindVariable initWithValue:sqlType:propertyDescription:]( objc_alloc(&OBJC_CLASS___NSSQLBindVariable),  "initWithValue:sqlType:propertyDescription:",  v14,  6LL,  0LL);
  uint64_t v19 = -[NSSQLBindVariable initWithValue:sqlType:propertyDescription:]( objc_alloc(&OBJC_CLASS___NSSQLBindVariable),  "initWithValue:sqlType:propertyDescription:",  v16,  10LL,  0LL);
  -[NSSQLiteStatement addBindVariable:]((uint64_t)v17, v13);
  -[NSSQLiteStatement addBindVariable:]((uint64_t)v17, v18);
  -[NSSQLiteStatement addBindVariable:]((uint64_t)v17, v19);
  -[NSSQLiteConnection prepareAndExecuteSQLStatement:]((uint64_t)a1, v17);
  if (+[NSSQLCore debugDefault](&OBJC_CLASS___NSSQLCore, "debugDefault") >= 2)
  {
    uint64_t v20 = -[NSSQLBindVariable value](v13, "value");
    _NSCoreDataLog( 4LL,  (uint64_t)@"Saving new meta data; versiouint64_t n = %@ ; UUID = %@",
      v21,
      v22,
      v23,
      v24,
      v25,
      v26,
      v20);
  }
}

- (uint64_t)_dropTableWithName:(uint64_t)a1
{
  if (a1)
  {
    uint64_t v4 = *(dispatch_queue_s **)(a1 + 8);
    if (v4) {
      dispatch_assert_queue_V2(v4);
    }
    char v5 = 0;
    for (int i = 3; (v5 & 1) == 0 && (i & 0x80000000) == 0; --i)
    {
      -[NSSQLiteConnection connect](a1);
      if (*(void *)(a1 + 72))
      {
        -[NSSQLiteConnection beginTransaction](a1);
        -[NSSQLiteConnection _executeSQLString:]( a1,  (void *)[NSString stringWithFormat:@"DROP TABLE IF EXISTS %@", a2]);
        -[NSSQLiteConnection commitTransaction](a1);
        char v5 = 1;
      }

      else
      {
        char v5 = 0;
      }

      -[NSSQLiteConnection endFetchAndRecycleStatement:](a1, 0);
    }
  }

  return 0LL;
}

- (id)_setSaveRequest:(id *)result
{
  if (result)
  {
    uint64_t v3 = result;

    uint64_t result = a2;
    v3[24] = result;
  }

  return result;
}

- (void)fetchCachedModel
{
  uint64_t v23 = *MEMORY[0x1895F89C0];
  if (!a1) {
    return;
  }
  stat v2 = *(dispatch_queue_s **)(a1 + 8);
  if (v2) {
    dispatch_assert_queue_V2(v2);
  }
  uint64_t v3 = [NSString stringWithFormat:@"SELECT %@ FROM %@", @"Z_CONTENT", @"Z_MODELCACHE"];
  id v4 = objc_alloc_init(MEMORY[0x1896077E8]);
  char v5 = -[NSSQLiteAdapter newStatementWithSQLString:]((NSSQLiteStatement *)[(id)a1 adapter], v3);
  -[NSSQLiteConnection prepareSQLStatement:](a1, v5);
  [(id)a1 execute];
  uint64_t v21 =  -[NSSQLColumn initWithColumnName:sqlType:]( objc_alloc(&OBJC_CLASS___NSSQLColumn),  "initWithColumnName:sqlType:",  @"Z_CONTENT",  10LL);
  -[NSSQLiteConnection setColumnsToFetch:]( (void *)a1,  (void *)[MEMORY[0x189603F18] arrayWithObjects:&v21 count:1]);
  uint64_t v6 = -[NSSQLiteConnection newFetchedArray](a1);
  uint64_t v7 = v6;
  if (!v6 || ![v6 count])
  {
    id v15 = 0LL;
LABEL_23:

    -[NSSQLiteConnection releaseSQLStatement](a1);
    -[NSSQLiteConnection setColumnsToFetch:]((void *)a1, 0LL);
    *(_DWORD *)(a1 + 312) &= ~2u;
    *(void *)(a1 + 100) = 0LL;
    *(void *)(a1 + 92) = 0LL;
    *(_DWORD *)(a1 + 108) = 0;

    [v4 drain];
    id v16 = 0LL;
    id v17 = v15;
    return;
  }

  uint64_t v8 = [v7 objectAtIndex:0];
  if (v8 == NSKeyValueCoding_NullValue || (v9 = (void *)[v7 objectAtIndex:0], (uint64_t v10 = v9) == 0))
  {
LABEL_21:
    uint64_t v11 = 0LL;
    goto LABEL_22;
  }

  uint64_t v11 = (void *)[v9 length];
  if (!v11)
  {
LABEL_22:
    id v15 = v11;
    goto LABEL_23;
  }

  if (compression_stream_init(&stream, COMPRESSION_STREAM_DECODE, COMPRESSION_ZLIB) == COMPRESSION_STATUS_OK)
  {
    uint64_t v12 = (void *)[MEMORY[0x189603FB8] data];
    stream.src_ptr = (const uint8_t *)[v10 bytes];
    stream.src_size = [v10 length];
    do
    {
      stream.dst_ptr = v22;
      stream.doff_t st_size = 1024LL;
      compression_status v13 = compression_stream_process(&stream, 1);
      if (v13 > COMPRESSION_STATUS_END)
      {
        compression_stream_destroy(&stream);
        uint64_t v18 = @"Failed to decompress model cache.";
        goto LABEL_26;
      }

      if (stream.dst_size != 1024) {
        [v12 appendBytes:v22 length:1024 - stream.dst_size];
      }
    }

    while (v13 == COMPRESSION_STATUS_OK);
    compression_stream_destroy(&stream);
    if (!v12) {
      goto LABEL_21;
    }
    uint64_t v11 = (void *)[v12 length];
    if (v11)
    {
      uint64_t v14 = [MEMORY[0x189604010] setWithObject:objc_opt_class()];
      uint64_t v11 = (void *)+[_PFRoutines unarchiveCylicGraphObjectOfClasses:fromData:error:]( (uint64_t)&OBJC_CLASS____PFRoutines,  v14,  (uint64_t)v12,  0LL);
    }

    goto LABEL_22;
  }

  uint64_t v18 = @"Could not initialize compression decoder.";
LABEL_26:
  id v19 = +[_NSCoreDataException exceptionWithName:code:reason:userInfo:]( (uint64_t)&OBJC_CLASS____NSCoreDataException,  *MEMORY[0x189603A58],  134060LL,  (uint64_t)v18,  0LL);
  objc_exception_throw(v19);
  __break(1u);
}

- (uint64_t)saveCachedModel:(uint64_t)result
{
  uint64_t v26 = *MEMORY[0x1895F89C0];
  if (result)
  {
    uint64_t v3 = (void *)result;
    id v4 = *(dispatch_queue_s **)(result + 8);
    if (v4) {
      dispatch_assert_queue_V2(v4);
    }
    id v5 = objc_alloc_init(MEMORY[0x1896077E8]);
    if ((-[NSSQLiteConnection _hasTableWithName:isTemp:]((uint64_t)v3, (uint64_t)@"Z_MODELCACHE", 0) & 1) != 0) {
      uint64_t v6 = -[NSSQLiteAdapter newStatementWithSQLString:]( (NSSQLiteStatement *)[v3 adapter],  objc_msgSend(NSString, "stringWithFormat:", @"DELETE FROM %@", @"Z_MODELCACHE"));
    }
    else {
      uint64_t v6 = -[NSSQLiteAdapter newStatementWithSQLString:]( (NSSQLiteStatement *)[v3 adapter],  objc_msgSend( NSString,  "stringWithFormat:",  @"CREATE TABLE %@ (%@ BLOB)",  @"Z_MODELCACHE",  @"Z_CONTENT"));
    }
    -[NSSQLiteConnection prepareAndExecuteSQLStatement:]((uint64_t)v3, v6);

    id v7 = objc_alloc_init(MEMORY[0x1896077E8]);
    uint64_t v8 = (void *)[MEMORY[0x1896078F8] archivedDataWithRootObject:a2 requiringSecureCoding:1 error:0];
    uint64_t v9 = v8;
    if (v8 && [v8 length])
    {
      if (compression_stream_init(&stream, COMPRESSION_STREAM_ENCODE, COMPRESSION_ZLIB))
      {
        uint64_t v22 = @"Could not initialize compression encoder.";
      }

      else
      {
        uint64_t v10 = (void *)[MEMORY[0x189603FB8] data];
        stream.src_ptr = (const uint8_t *)[v9 bytes];
        stream.src_size = [v9 length];
        while (1)
        {
          stream.dst_ptr = v25;
          stream.doff_t st_size = 1024LL;
          compression_status v11 = compression_stream_process(&stream, 1);
          if (stream.dst_size != 1024) {
            [v10 appendBytes:v25 length:1024 - stream.dst_size];
          }
          if (v11)
          {
            compression_stream_destroy(&stream);
            goto LABEL_17;
          }
        }

        compression_stream_destroy(&stream);
        uint64_t v22 = @"Failed to decompress model cache.";
      }

      id v23 = +[_NSCoreDataException exceptionWithName:code:reason:userInfo:]( (uint64_t)&OBJC_CLASS____NSCoreDataException,  *MEMORY[0x189603A58],  134060LL,  (uint64_t)v22,  0LL);
      objc_exception_throw(v23);
      __break(1u);
    }

    uint64_t v10 = 0LL;
LABEL_17:
    id v12 = v10;
    [v7 drain];
    id v13 = v10;
    if (v13)
    {
      uint64_t v14 = -[NSSQLiteAdapter newStatementWithSQLString:]( (NSSQLiteStatement *)[v3 adapter],  objc_msgSend(NSString, "stringWithFormat:", @"INSERT INTO %@ (%@) VALUES (?)"));
      id v15 = -[NSSQLBindVariable initWithValue:sqlType:propertyDescription:]( objc_alloc(&OBJC_CLASS___NSSQLBindVariable),  "initWithValue:sqlType:propertyDescription:",  v13,  10LL,  0LL);
      -[NSSQLiteStatement addBindVariable:]((uint64_t)v14, v15);
      -[NSSQLiteConnection prepareAndExecuteSQLStatement:]((uint64_t)v3, v14);
      if (+[NSSQLCore debugDefault](&OBJC_CLASS___NSSQLCore, "debugDefault") >= 2) {
        _NSCoreDataLog( 4LL,  (uint64_t)@"Saving new model cache",  v16,  v17,  v18,  v19,  v20,  v21,  (uint64_t)@"Z_MODELCACHE");
      }
    }

    return [v5 drain];
  }

  return result;
}

- (void)didCreateSchema
{
  if ((a1[312] & 0x40) != 0)
  {
    stat v2 = -[NSSQLiteAdapter newStatementWithSQLString:]( (NSSQLiteStatement *)[a1 adapter],  (uint64_t)@"pragma journal_mode=wal");
    -[NSSQLiteConnection prepareAndExecuteSQLStatement:]((uint64_t)a1, v2);
  }

- (uint64_t)recreateIndices
{
  uint64_t v38 = *MEMORY[0x1895F89C0];
  if (result)
  {
    uint64_t v1 = (id *)result;
    stat v2 = *(dispatch_queue_s **)(result + 8);
    if (v2) {
      dispatch_assert_queue_V2(v2);
    }
    if (+[NSSQLCore debugDefault](&OBJC_CLASS___NSSQLCore, "debugDefault") >= 1) {
      _NSCoreDataLog(4LL, (uint64_t)@"re-adding all missing indices", v3, v4, v5, v6, v7, v8, v22);
    }
    uint64_t v9 = (void *)[v1[2] model];
    id v10 = -[NSSQLiteConnection fetchCreationSQLForType:containing:]((uint64_t)v1, (uint64_t)@"index", 0LL);
    compression_status v11 = (void *)objc_msgSend(MEMORY[0x189603FA8], "arrayWithCapacity:", objc_msgSend(v10, "count"));
    v35[0] = MEMORY[0x1895F87A8];
    v35[1] = 3221225472LL;
    v35[2] = __37__NSSQLiteConnection_recreateIndices__block_invoke;
    v35[3] = &unk_189EAA2E0;
    v35[4] = v11;
    [v10 enumerateObjectsUsingBlock:v35];
    __int128 v33 = 0u;
    __int128 v34 = 0u;
    __int128 v31 = 0u;
    __int128 v32 = 0u;
    if (v9) {
      uint64_t v9 = (void *)v9[4];
    }
    uint64_t v12 = [v9 countByEnumeratingWithState:&v31 objects:v37 count:16];
    if (v12)
    {
      obuint64_t j = v9;
      uint64_t v24 = *(void *)v32;
      do
      {
        uint64_t v13 = 0LL;
        uint64_t v25 = v12;
        do
        {
          if (*(void *)v32 != v24) {
            objc_enumerationMutation(obj);
          }
          uint64_t v14 = *(void *)(*((void *)&v31 + 1) + 8 * v13);
          uint64_t v15 = [v1 adapter];
          if (v15) {
            id v16 = -[NSSQLiteAdapter newCreateIndexStatementsForEntity:defaultIndicesOnly:](v15, v14, 0);
          }
          else {
            id v16 = 0LL;
          }
          __int128 v29 = 0u;
          __int128 v30 = 0u;
          __int128 v27 = 0u;
          __int128 v28 = 0u;
          uint64_t v17 = [v16 countByEnumeratingWithState:&v27 objects:v36 count:16];
          uint64_t v26 = v13;
          if (v17)
          {
            uint64_t v18 = *(void *)v28;
            do
            {
              for (uint64_t i = 0LL; i != v17; ++i)
              {
                if (*(void *)v28 != v18) {
                  objc_enumerationMutation(v16);
                }
                uint64_t v20 = *(void **)(*((void *)&v27 + 1) + 8 * i);
                if ((objc_msgSend( v11,  "containsObject:",  objc_msgSend( (id)objc_msgSend(v20, "sqlString"),  "stringByReplacingOccurrencesOfString:withString:",  @"IF NOT EXISTS ",  &stru_189EAC2E8)) & 1) == 0)
                {
                  -[NSSQLiteConnection beginTransaction]((uint64_t)v1);
                  -[NSSQLiteConnection prepareAndExecuteSQLStatement:]((uint64_t)v1, v20);
                  -[NSSQLiteConnection commitTransaction]((uint64_t)v1);
                }
              }

              uint64_t v17 = [v16 countByEnumeratingWithState:&v27 objects:v36 count:16];
            }

            while (v17);
          }

          uint64_t v13 = v26 + 1;
        }

        while (v26 + 1 != v25);
        uint64_t v21 = [obj countByEnumeratingWithState:&v31 objects:v37 count:16];
        uint64_t v12 = v21;
      }

      while (v21);
    }

    -[NSSQLiteConnection endFetchAndRecycleStatement:]((uint64_t)v1, 0);

    if ((_DWORD)v12)
    {
      objc_exception_rethrow();
      __break(1u);
    }

    return 1LL;
  }

  return result;
}

uint64_t __37__NSSQLiteConnection_recreateIndices__block_invoke(uint64_t a1, void *a2)
{
  uint64_t result = [a2 count];
  if (result == 2) {
    return objc_msgSend(*(id *)(a1 + 32), "addObject:", objc_msgSend(a2, "objectAtIndexedSubscript:", 1));
  }
  return result;
}

- (uint64_t)_walCheckpoint
{
  if (!a1) {
    return 0LL;
  }
  stat v2 = *(dispatch_queue_s **)(a1 + 8);
  if (v2) {
    dispatch_assert_queue_V2(v2);
  }
  uint64_t v3 = *(sqlite3 **)(a1 + 72);
  if (v3)
  {
    int pnLog = 0;
    int pnCkpt = 0;
    sqlite3_busy_timeout(v3, 1);
    uint64_t v4 = sqlite3_wal_checkpoint_v2(*(sqlite3 **)(a1 + 72), "main", 3, &pnLog, &pnCkpt);
    uint64_t v11 = v4;
    if ((_DWORD)v4 == 6)
    {
      uint64_t v12 = @"WAL checkpoint: Database locked";
    }

    else
    {
      if ((_DWORD)v4 != 5)
      {
        if ((_DWORD)v4)
        {
          uint64_t v13 = sqlite3_errmsg(*(sqlite3 **)(a1 + 72));
          _NSCoreDataLog(1LL, (uint64_t)@"WAL checkpoint: Failed: %s", v14, v15, v16, v17, v18, v19, (uint64_t)v13);
          return v11;
        }

        _NSCoreDataLog( 9LL,  (uint64_t)@"WAL checkpoint: Database did checkpoint. Log size: %d checkpointed: %d",  v5,  v6,  v7,  v8,  v9,  v10,  pnLog);
        goto LABEL_13;
      }

      uint64_t v12 = @"WAL checkpoint: Database busy";
    }

    _NSCoreDataLog(9LL, (uint64_t)v12, v5, v6, v7, v8, v9, v10, v21);
LABEL_13:
    -[NSSQLiteConnection _restoreBusyTimeOutSettings](a1);
    return v11;
  }

  return 26LL;
}

- (void)scheduleWALCheckpointAfter:(double)a3 retry:
{
  if (a1)
  {
    uint64_t v6 = *(dispatch_queue_s **)(a1 + 8);
    if (v6) {
      dispatch_assert_queue_V2(v6);
    }
    v9[0] = 0LL;
    v9[1] = v9;
    v9[2] = 0x3052000000LL;
    v9[3] = __Block_byref_object_copy__28;
    v9[4] = __Block_byref_object_dispose__28;
    v9[5] = a1;
    if (!*(void *)(a1 + 360))
    {
      block[0] = MEMORY[0x1895F87A8];
      block[1] = 3221225472LL;
      block[2] = __55__NSSQLiteConnection_scheduleWALCheckpointAfter_retry___block_invoke;
      block[3] = &unk_189EAA308;
      block[4] = v9;
      void block[5] = a2;
      *(double *)&block[6] = a3;
      *(void *)(a1 + 360) = dispatch_block_create((dispatch_block_flags_t)0LL, block);
      dispatch_time_t v7 = dispatch_time(0LL, (uint64_t)(a3 * 1000000000.0));
      dispatch_after(v7, *(dispatch_queue_t *)(a1 + 8), *(dispatch_block_t *)(a1 + 360));
    }

    _Block_object_dispose(v9, 8);
  }

void __55__NSSQLiteConnection_scheduleWALCheckpointAfter_retry___block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 40LL) + 360LL) = 0LL;
  stat v2 = (void *)+[NSPersistentStoreCoordinator _beginPowerAssertionNamed:withAssert:]( (uint64_t)&OBJC_CLASS___NSPersistentStoreCoordinator,  (uint64_t)@"CoreData: WAL checkpoint",  &v4);
  if (readFileSizeFromJournalHandle(*(sqlite3 **)(*(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 40LL) + 72LL)) > 0x800000
    && -[NSSQLiteConnection _walCheckpoint](*(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 40LL))
     - 5 <= 1)
  {
    uint64_t v3 = *(void *)(a1 + 40);
    if (v3) {
      -[NSSQLiteConnection scheduleWALCheckpointAfter:retry:]( *(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 40LL),  v3 - 1,  *(double *)(a1 + 48));
    }
  }

  +[NSPersistentStoreCoordinator _endPowerAssertionWithAssert:andApp:]( (uint64_t)&OBJC_CLASS___NSPersistentStoreCoordinator,  v4,  v2);
}

- (uint64_t)logQueryPlanForStatement:(uint64_t)a1
{
  uint64_t v2 = a1;
  if (a1)
  {
    id v4 = objc_alloc_init(MEMORY[0x1896077E8]);
    uint64_t v5 = (const char *)objc_msgSend((id)objc_msgSend(a2, "sqlString"), "UTF8String");
    if (v5)
    {
      uint64_t v6 = sqlite3_mprintf("EXPLAIN QUERY PLAN %s", v5);
      if (v6)
      {
        dispatch_time_t v7 = (void *)objc_msgSend(MEMORY[0x189607940], "stringWithFormat:", @"SQLite: %s", v6);
        uint64_t v2 = sqlite3_prepare_v2(*(sqlite3 **)(v2 + 72), v6, -1, &ppStmt, 0LL);
        sqlite3_free(v6);
        if (!(_DWORD)v2)
        {
          while (sqlite3_step(ppStmt) == 100)
          {
            [v7 appendString:@"\n     "];
            uint64_t v14 = sqlite3_column_int(ppStmt, 0);
            uint64_t v15 = sqlite3_column_int(ppStmt, 1);
            uint64_t v16 = sqlite3_column_int(ppStmt, 2);
            objc_msgSend(v7, "appendFormat:", @"%d %d %d %s", v14, v15, v16, sqlite3_column_text(ppStmt, 3));
          }

          _NSCoreDataLog(7LL, (uint64_t)@"%@", v8, v9, v10, v11, v12, v13, (uint64_t)v7);
          sqlite3_reset(ppStmt);
          uint64_t v2 = sqlite3_finalize(ppStmt);
        }
      }

      else
      {
        uint64_t v2 = 7LL;
      }
    }

    else
    {
      uint64_t v2 = 1LL;
    }

    [v4 drain];
    id v17 = 0LL;
  }

  return v2;
}

uint64_t __45__NSSQLiteConnection_indexesUsedByStatement___block_invoke(uint64_t a1, sqlite3_stmt *a2)
{
  uint64_t v7 = *MEMORY[0x1895F89C0];
  uint64_t v3 = sqlite3_column_text(a2, 3);
  id v4 = strstr((const char *)v3, " INDEX ");
  if (v4 && sscanf(v4 + 7, "%1023s", v6)) {
    objc_msgSend(*(id *)(a1 + 32), "addObject:", objc_msgSend(NSString, "stringWithUTF8String:", v6));
  }
  return 0LL;
}

- (uint64_t)hasIndexTrackingTable
{
  if (result)
  {
    uint64_t v1 = result;
    uint64_t v2 = (void *)NSString;
    uint64_t v3 = (objc_class *)objc_opt_class();
    uint64_t v4 = [v2 stringWithFormat:@"A%@", -[NSString uppercaseString](NSStringFromClass(v3), "uppercaseString")];
    return -[NSSQLiteConnection _hasTableWithName:isTemp:](v1, v4, 0);
  }

  return result;
}

- (void)dropIndexTrackingTable
{
  if (a1)
  {
    uint64_t v2 = (NSSQLiteStatement *)[a1 adapter];
    uint64_t v3 = (void *)NSString;
    uint64_t v4 = (objc_class *)objc_opt_class();
    uint64_t v5 = [v3 stringWithFormat:@"A%@", -[NSString uppercaseString](NSStringFromClass(v4), "uppercaseString")];
    uint64_t v6 = -[NSSQLiteAdapter newDropTableStatementForTableNamed:](v2, v5);
    -[NSSQLiteConnection prepareAndExecuteSQLStatement:]((uint64_t)a1, v6);
  }

- (uint64_t)setUpIndexTracking
{
  uint64_t v46 = *MEMORY[0x1895F89C0];
  if (!a1 || ![a1[2] _persistentStoreCoordinator]) {
    return 0LL;
  }
  if ([a1[2] isReadOnly])
  {
    _NSCoreDataLog(2LL, (uint64_t)@"index tracking enabled on read-only store", v2, v3, v4, v5, v6, v7, v31);
    return 0LL;
  }

  uint64_t v9 = a1[2];
  if (v9 && (v9[202] & 1) != 0 && (-[NSSQLiteConnection hasIndexTrackingTable]((uint64_t)a1) & 1) == 0)
  {
    -[NSSQLiteConnection beginTransaction]((uint64_t)a1);
    if (!-[NSSQLiteConnection hasIndexTrackingTable]((uint64_t)a1))
    {
      uint64_t v11 = objc_msgSend( (id)objc_msgSend(a1[2], "ancillarySQLModels"),  "objectForKey:",  @"NSPersistentStoreTrackIndexUseOptionKey");
      uint64_t v12 = v11;
      if (v11) {
        uint64_t v13 = *(void **)(v11 + 24);
      }
      else {
        uint64_t v13 = 0LL;
      }
      uint64_t v14 = (objc_class *)objc_opt_class();
      __int128 v33 = (void *)[v13 objectForKeyedSubscript:NSStringFromClass(v14)];
      if (v12) {
        uint64_t v15 = *(void **)(v12 + 32);
      }
      else {
        uint64_t v15 = 0LL;
      }
      -[NSSQLiteConnection createTablesForEntities:]((uint64_t)a1, v15);
      id v16 = -[NSSQLiteConnection fetchCreationSQLForType:containing:]((uint64_t)a1, (uint64_t)@"index", 0LL);
      -[NSSQLiteConnection generatePrimaryKeysForEntity:batch:]( (sqlite3_int64)a1,  (uint64_t)v33,  [v16 count]);
      uint64_t v18 = v17;
      BOOL v19 = v17 != 0;
      uint64_t v20 = [v16 count];
      __int128 v39 = 0u;
      __int128 v40 = 0u;
      __int128 v41 = 0u;
      __int128 v42 = 0u;
      obuint64_t j = v16;
      uint64_t v21 = [v16 countByEnumeratingWithState:&v39 objects:v45 count:16];
      if (v21)
      {
        uint64_t v22 = v18 - v20 + 1;
        uint64_t v34 = *(void *)v40;
LABEL_19:
        uint64_t v23 = 0LL;
        while (1)
        {
          if (*(void *)v40 != v34) {
            objc_enumerationMutation(obj);
          }
          if (!v19) {
            break;
          }
          uint64_t v24 = strstr( (const char *)objc_msgSend( (id)objc_msgSend( *(id *)(*((void *)&v39 + 1) + 8 * v23),  "objectAtIndexedSubscript:",  1),  "UTF8String"),  " INDEX ");
          if (sscanf(v24 + 7, "%1023s", v44))
          {
            -[NSSQLiteConnection prepareInsertStatementForAncillaryEntity:]((uint64_t)a1, v33);
            __int128 v37 = 0u;
            __int128 v38 = 0u;
            __int128 v35 = 0u;
            __int128 v36 = 0u;
            uint64_t v25 = (void *)[a1[6] bindVariables];
            uint64_t v26 = [v25 countByEnumeratingWithState:&v35 objects:v43 count:16];
            if (v26)
            {
              uint64_t v27 = *(void *)v36;
              do
              {
                for (uint64_t i = 0LL; i != v26; ++i)
                {
                  if (*(void *)v36 != v27) {
                    objc_enumerationMutation(v25);
                  }
                  __int128 v29 = *(void **)(*((void *)&v35 + 1) + 8 * i);
                  int v30 = [v29 index];
                  if (v30)
                  {
                    if (v30 == 4) {
                      objc_msgSend( v29,  "setValue:",  objc_msgSend( (id)objc_msgSend(NSString, "stringWithUTF8String:", v44),  "uppercaseString"));
                    }
                  }

                  else
                  {
                    [v29 setInt64:v22++];
                  }
                }

                uint64_t v26 = [v25 countByEnumeratingWithState:&v35 objects:v43 count:16];
              }

              while (v26);
            }

            [a1 execute];
            BOOL v19 = 1;
            -[NSSQLiteConnection _clearBindVariablesForInsertedRow]((uint64_t)a1);
            -[NSSQLiteConnection releaseSQLStatement]((uint64_t)a1);
          }

          else
          {
            BOOL v19 = 1;
          }

          if (++v23 == v21)
          {
            uint64_t v21 = [obj countByEnumeratingWithState:&v39 objects:v45 count:16];
            if (v21) {
              goto LABEL_19;
            }
            goto LABEL_39;
          }
        }
      }

      else
      {
LABEL_39:
        if (v19)
        {
          uint64_t v8 = 1LL;
          -[NSSQLiteConnection commitTransaction]((uint64_t)a1);
          return v8;
        }
      }

      uint64_t v8 = 0LL;
      -[NSSQLiteConnection rollbackTransaction]((uint64_t)a1);
      return v8;
    }

    -[NSSQLiteConnection rollbackTransaction]((uint64_t)a1);
  }

  return 1LL;
}

- (void)prepareInsertStatementForAncillaryEntity:(uint64_t)a1
{
  uint64_t v4 = -[NSSQLiteConnection statementCacheForEntity:](a1, a2);
  uint64_t v5 = v4;
  if (!v4
    || (insertStatementCache = v4->_insertStatementCache) == 0LL
    || (cachedSQLiteStatement = insertStatementCache->_cachedSQLiteStatement) == 0LL)
  {
    uint64_t v18 = (void *)objc_msgSend( (id)objc_msgSend( (id)objc_msgSend( (id)objc_msgSend((id)objc_msgSend((id)a1, "adapter"), "sqlCore"),  "objectIDFactoryForPersistentHistoryEntity:",  a2),  "alloc"),  "initWithPK64:",  1);
    id v25 = (id)objc_msgSend( +[NSSQLRow allocForSQLEntity:]((uint64_t)NSSQLRow, a2),  "initWithSQLEntity:objectID:",  a2,  v18);
    BOOL v19 = -[NSSQLiteAdapter newStatementWithEntity:]((NSSQLiteStatement *)[(id)a1 adapter], (uint64_t)a2);
    uint64_t v20 = -[NSSQLiteAdapter newGeneratorWithStatement:]((void *)[(id)a1 adapter], (uint64_t)v19);
    uint64_t v21 = (const __CFString *)[a2 name];
    if (v20)
    {
      -[_NSSQLGenerator prepareInsertStatementWithRow:includeConstraints:includeOnConflict:onConflictKeys:]( (uint64_t)v20,  (uint64_t)v25,  v21 == @"TRANSACTIONSTRING",  0,  (void *)NSArray_EmptyArray);
      uint64_t v22 = (NSString *)v20[3];
      if (v19) {
        goto LABEL_12;
      }
    }

    else
    {
      uint64_t v22 = 0LL;
      if (v19)
      {
LABEL_12:
        sqlString = v19->_sqlString;
        if (sqlString != v22)
        {

          v19->_sqlString = (NSString *)-[NSString copy](v22, "copy");
        }
      }
    }

    -[NSSQLiteConnection prepareSQLStatement:](a1, v19);
    -[NSSQLiteStatement setCachedSQLiteStatement:forConnection:]( *(sqlite3_stmt **)(a1 + 48),  *(sqlite3_stmt **)(a1 + 80),  a1);
    -[NSSQLiteStatementCache cacheInsertStatement:](v5, *(void **)(a1 + 48));
    -[NSSQLiteConnection addVMCachedStatement:](a1, *(const void **)(a1 + 48));

    return;
  }

  uint64_t v24 = v5->_insertStatementCache;
  if (+[NSSQLCore debugDefault](&OBJC_CLASS___NSSQLCore, "debugDefault") >= 1)
  {
    int v8 = *(unsigned __int8 *)(a1 + 42);
    uint64_t v9 = -[NSSQLiteStatement sqlString](v24, "sqlString");
    if (v8) {
      id v16 = @"\x1B[32msql: \x1B[34m\x1B[47m%@\x1B[0m";
    }
    else {
      id v16 = @"%@";
    }
    _NSCoreDataLog(6LL, (uint64_t)v16, v10, v11, v12, v13, v14, v15, v9);
  }

  *(void *)(a1 + 48) = v24;
  *(void *)(a1 + 80) = cachedSQLiteStatement;
  uint64_t v17 = v24;
}

- (void)harvestUsedIndexes
{
  if (result)
  {
    uint64_t v1 = (void *)result[43];
    result[43] = objc_alloc_init(MEMORY[0x189603FC8]);
    return v1;
  }

  return result;
}

- (BOOL)hasHistoryRows
{
  if (result) {
    return -[NSSQLiteConnection _tableHasRows:](result, (uint64_t)@"ATRANSACTION");
  }
  return result;
}

- (BOOL)_tableHasRows:(BOOL)result
{
  if (result)
  {
    uint64_t v2 = result;
    uint64_t v3 = (void *)[objc_alloc(MEMORY[0x189607940]) initWithFormat:@"SELECT count(*) FROM (SELECT 0 FROM %@ LIMIT 1)", a2];
    uint64_t v4 = -[NSSQLiteConnection copyRawIntegerRowsForSQL:](v2, v3);
    uint64_t v5 = v4;
    if (v4)
    {
      if (CFArrayGetCount(v4) >= 1 && *(void *)CFArrayGetValueAtIndex(v5, 0LL)) {
        uint64_t v6 = *(void *)CFArrayGetValueAtIndex(v5, 1LL);
      }
      else {
        uint64_t v6 = -1LL;
      }
      CFRelease(v5);
    }

    else
    {
      uint64_t v6 = -1LL;
    }

    return v6 > 0;
  }

  return result;
}

- (uint64_t)_hasPersistentHistoryTables
{
  if (!a1) {
    return 0LL;
  }
  uint64_t v2 = (void *)MEMORY[0x186E3E5D8]();
  uint64_t v3 = 0LL;
  objc_autoreleasePoolPop(v2);
  return v3;
}

- (uint64_t)_hasHistoryTransactionStringTable
{
  if (result)
  {
    uint64_t v1 = result;
    if ((*(_DWORD *)(result + 312) & 0x400) != 0)
    {
      int v2 = *(_DWORD *)(result + 312) & 0x400;
    }

    else
    {
      if (-[NSSQLiteConnection _hasTableWithName:isTemp:]( result,  (uint64_t)@"ATRANSACTIONSTRING",  0)) {
        int v2 = 1024;
      }
      else {
        int v2 = 0;
      }
      *(_DWORD *)(v1 + 312) = *(_DWORD *)(v1 + 312) & 0xFFFFFBFF | v2;
    }

    return v2 != 0;
  }

  return result;
}

- (uint64_t)_dropKnownHistoryTrackingTables
{
  v16[3] = *MEMORY[0x1895F89C0];
  if (result)
  {
    uint64_t v1 = (void *)result;
    v16[0] = @"CHANGE";
    v16[1] = @"TRANSACTION";
    v16[2] = @"TRANSACTIONSTRING";
    __int128 v11 = 0u;
    __int128 v12 = 0u;
    __int128 v13 = 0u;
    __int128 v14 = 0u;
    obuint64_t j = (id)[MEMORY[0x189603F18] arrayWithObjects:v16 count:3];
    uint64_t result = [obj countByEnumeratingWithState:&v11 objects:v15 count:16];
    if (result)
    {
      uint64_t v2 = result;
      uint64_t v3 = *(void *)v12;
      do
      {
        uint64_t v4 = 0LL;
        do
        {
          if (*(void *)v12 != v3) {
            objc_enumerationMutation(obj);
          }
          uint64_t v5 = *(void *)(*((void *)&v11 + 1) + 8 * v4);
          uint64_t v6 = (NSSQLiteStatement *)[v1 adapter];
          uint64_t v7 = -[NSSQLiteAdapter newDropTableStatementForTableNamed:]( v6,  [NSString stringWithFormat:@"A%@", v5]);
          -[NSSQLiteConnection prepareAndExecuteSQLStatement:]((uint64_t)v1, v7);

          int v8 = (void *)[objc_alloc(NSString) initWithFormat:@"UPDATE OR FAIL %@ set %@=0 where %@ = '%@'", @"Z_PRIMARYKEY", @"Z_MAX", @"Z_NAME", v5];
          uint64_t v9 = -[NSSQLiteAdapter newStatementWithSQLString:]( (NSSQLiteStatement *)[v1 adapter],  (uint64_t)v8);

          -[NSSQLiteConnection prepareAndExecuteSQLStatement:]((uint64_t)v1, v9);
          ++v4;
        }

        while (v2 != v4);
        uint64_t result = [obj countByEnumeratingWithState:&v11 objects:v15 count:16];
        uint64_t v2 = result;
      }

      while (result);
    }
  }

  return result;
}

- (void)processSaveRequest:(sqlite3_int64)a1
{
  uint64_t v205 = *MEMORY[0x1895F89C0];
  if (!a1) {
    return;
  }
  if (!a2)
  {
    obuint64_t j = (id)-[NSSQLSavePlan newInsertedRows](0LL);
    goto LABEL_244;
  }

  uint64_t v2 = *(id **)(a2 + 96);
  obuint64_t j = (id)-[NSSQLSavePlan newInsertedRows]((uint64_t)v2);
  if (!v2)
  {
LABEL_244:
    id v129 = 0LL;
    id v130 = 0LL;
    id v149 = 0LL;
    goto LABEL_5;
  }

  id v149 = (id)[v2[6] mutableCopy];
  id v129 = (id)[v2[7] mutableCopy];
  id v130 = v2[5];
LABEL_5:
  double v125 = (void *)[objc_alloc(MEMORY[0x189603FC8]) initWithCapacity:3];
  if (![obj count]) {
    goto LABEL_28;
  }
  uint64_t v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x189603FE0]), "initWithCapacity:", objc_msgSend(obj, "count"));
  __int128 v164 = 0u;
  __int128 v165 = 0u;
  __int128 v162 = 0u;
  __int128 v163 = 0u;
  uint64_t v4 = [obj countByEnumeratingWithState:&v162 objects:v193 count:16];
  if (!v4) {
    goto LABEL_25;
  }
  uint64_t v5 = *(void *)v163;
  do
  {
    for (uint64_t i = 0LL; i != v4; ++i)
    {
      if (*(void *)v163 != v5) {
        objc_enumerationMutation(obj);
      }
      uint64_t v7 = *(void *)(*((void *)&v162 + 1) + 8 * i);
      uint64_t v8 = *(void *)(a1 + 16);
      if (v8) {
        uint64_t v9 = (void *)[*(id *)(v8 + 240) objectForKey:@"NSPersistentHistoryTrackingEntitiesToExclude"];
      }
      else {
        uint64_t v9 = 0LL;
      }
      if ([v9 count])
      {
        uint64_t v10 = *(void *)(a1 + 16);
        if (v10)
        {
          __int128 v11 = (void *)[*(id *)(v10 + 240) objectForKey:@"NSPersistentHistoryTrackingEntitiesToExclude"];
          if (v7) {
            goto LABEL_16;
          }
LABEL_20:
          __int128 v12 = 0LL;
        }

        else
        {
          __int128 v11 = 0LL;
          if (!v7) {
            goto LABEL_20;
          }
LABEL_16:
          if ((*(_BYTE *)(v7 + 16) & 1) != 0) {
            goto LABEL_20;
          }
          __int128 v12 = (void *)[*(id *)(*(void *)(v7 + 40) + 16) _storeInfo1];
        }

        if (objc_msgSend(v11, "containsObject:", objc_msgSend(v12, "name"))) {
          continue;
        }
      }

      [v3 addObject:v7];
    }

    uint64_t v4 = [obj countByEnumeratingWithState:&v162 objects:v193 count:16];
  }

  while (v4);
LABEL_25:
  if ([v3 count]) {
    [v125 setValue:v3 forKey:@"inserted"];
  }

LABEL_28:
  if ([v149 count])
  {
    uint64_t v127 = (void *)objc_msgSend(objc_alloc(MEMORY[0x189603FE0]), "initWithCapacity:", objc_msgSend(v149, "count"));
    id v145 = objc_alloc_init(MEMORY[0x189603FC8]);
    id v142 = objc_alloc_init(MEMORY[0x189603FC8]);
    if (a2) {
      uint64_t v13 = *(void *)(a2 + 96);
    }
    else {
      uint64_t v13 = 0LL;
    }
    id v131 = (id)-[NSSQLSavePlan newCorrelationTableUpdates](v13);
    __int128 v188 = 0u;
    __int128 v189 = 0u;
    __int128 v186 = 0u;
    __int128 v187 = 0u;
    uint64_t v14 = [v131 countByEnumeratingWithState:&v186 objects:v204 count:16];
    if (v14)
    {
      uint64_t v15 = *(void *)v187;
      uint64_t v16 = MEMORY[0x1895F87A8];
      do
      {
        for (uint64_t j = 0LL; j != v14; ++j)
        {
          if (*(void *)v187 != v15) {
            objc_enumerationMutation(v131);
          }
          uint64_t v18 = *(void **)(*((void *)&v186 + 1) + 8 * j);
          BOOL v19 = (void *)MEMORY[0x186E3E5D8]();
          if (v18)
          {
            if (v18[2])
            {
              v185[0] = v16;
              v185[1] = 3221225472LL;
              v185[2] = __67__NSSQLiteConnection_processRelationshipUpdates_forRequestContext___block_invoke;
              v185[3] = &unk_189EAA358;
              v185[4] = a1;
              v185[5] = v145;
              v185[6] = v18;
              -[NSSQLCorrelationTableUpdateTracker enumerateInsertsOIDsUsingBlock:]((uint64_t)v18, (uint64_t)v185);
            }

            if (v18[5])
            {
              v184[0] = v16;
              v184[1] = 3221225472LL;
              v184[2] = __67__NSSQLiteConnection_processRelationshipUpdates_forRequestContext___block_invoke_2;
              v184[3] = &unk_189EAA380;
              v184[4] = a1;
              v184[5] = v145;
              v184[6] = v18;
              v184[7] = v142;
              -[NSSQLCorrelationTableUpdateTracker enumerateReordersOIDsUsingBlock:]((uint64_t)v18, (uint64_t)v184);
            }

            if (v18[4])
            {
              v183[0] = v16;
              v183[1] = 3221225472LL;
              v183[2] = __67__NSSQLiteConnection_processRelationshipUpdates_forRequestContext___block_invoke_3;
              v183[3] = &unk_189EAA380;
              v183[4] = a1;
              v183[5] = v145;
              v183[6] = v18;
              v183[7] = v142;
              -[NSSQLCorrelationTableUpdateTracker enumerateMasterReordersOIDsUsingBlock:]((uint64_t)v18, (uint64_t)v183);
            }

            if (v18[3])
            {
              v182[0] = v16;
              v182[1] = 3221225472LL;
              v182[2] = __67__NSSQLiteConnection_processRelationshipUpdates_forRequestContext___block_invoke_4;
              v182[3] = &unk_189EAA358;
              v182[4] = a1;
              v182[5] = v145;
              v182[6] = v18;
              -[NSSQLCorrelationTableUpdateTracker enumerateDeletesOIDsUsingBlock:]((uint64_t)v18, (uint64_t)v182);
            }
          }

          objc_autoreleasePoolPop(v19);
        }

        uint64_t v14 = [v131 countByEnumeratingWithState:&v186 objects:v204 count:16];
      }

      while (v14);
    }

    __int128 v180 = 0u;
    __int128 v181 = 0u;
    __int128 v178 = 0u;
    __int128 v179 = 0u;
    if (a2 && (uint64_t v20 = *(void *)(a2 + 96)) != 0) {
      uint64_t v21 = *(void **)(v20 + 128);
    }
    else {
      uint64_t v21 = 0LL;
    }
    uint64_t v22 = [v21 countByEnumeratingWithState:&v178 objects:v203 count:16];
    if (v22)
    {
      uint64_t v23 = *(void *)v179;
      do
      {
        uint64_t v24 = 0LL;
        do
        {
          if (*(void *)v179 != v23) {
            objc_enumerationMutation(v21);
          }
          uint64_t v25 = *(void *)(*((void *)&v178 + 1) + 8 * v24);
          uint64_t v26 = (void *)MEMORY[0x186E3E5D8]();
          uint64_t v27 = (void *)[v145 objectForKey:v25];
          if (a2 && (uint64_t v28 = *(void *)(a2 + 96)) != 0) {
            __int128 v29 = *(void **)(v28 + 128);
          }
          else {
            __int128 v29 = 0LL;
          }
          uint64_t v30 = [v29 objectForKey:v25];
          if (v27) {
            [v27 unionSet:v30];
          }
          else {
            [v145 setValue:v30 forKey:v25];
          }
          objc_autoreleasePoolPop(v26);
          ++v24;
        }

        while (v22 != v24);
        uint64_t v31 = [v21 countByEnumeratingWithState:&v178 objects:v203 count:16];
        uint64_t v22 = v31;
      }

      while (v31);
    }

    __int128 v176 = 0u;
    __int128 v177 = 0u;
    __int128 v174 = 0u;
    __int128 v175 = 0u;
    uint64_t v32 = [v145 countByEnumeratingWithState:&v174 objects:&v199 count:16];
    if (v32)
    {
      uint64_t v33 = *(void *)v175;
      do
      {
        for (uint64_t k = 0LL; k != v32; ++k)
        {
          if (*(void *)v175 != v33) {
            objc_enumerationMutation(v145);
          }
          __int128 v35 = *(void **)(*((void *)&v174 + 1) + 8 * k);
          __int128 v36 = (void *)MEMORY[0x186E3E5D8]();
          __int128 v37 = (void *)_sqlEntityForEntityID( [*(id *)(a1 + 16) model],  objc_msgSend( (id)objc_msgSend( (id)objc_msgSend(v35, "componentsSeparatedByString:", @"-"),  "firstObject"),  "longLongValue"));
          __int128 v38 = +[_NSPersistentHistoryChange _propertyDataForEntity:withSetOfPropertyNames:]( (uint64_t)_NSPersistentHistoryChange,  v37,  (void *)[v145 objectForKey:v35]);
          -[NSSQLSaveChangesRequestContext addDataMask:forEntityKey:](a2, v38, (uint64_t)v35);

          objc_autoreleasePoolPop(v36);
        }

        uint64_t v32 = [v145 countByEnumeratingWithState:&v174 objects:&v199 count:16];
      }

      while (v32);
    }

    if ([v142 count])
    {
      __int128 v39 = (void *)objc_msgSend(objc_alloc(MEMORY[0x189603FC8]), "initWithCapacity:", objc_msgSend(v142, "count"));
      __int128 v172 = 0u;
      __int128 v173 = 0u;
      __int128 v170 = 0u;
      __int128 v171 = 0u;
      uint64_t v40 = [v142 countByEnumeratingWithState:&v170 objects:&v195 count:16];
      if (!v40) {
        goto LABEL_103;
      }
      uint64_t v136 = v40;
      uint64_t v126 = v39;
      uint64_t v133 = *(void *)v171;
      while (1)
      {
        for (uint64_t m = 0LL; m != (void *)v136; uint64_t m = (char *)m + 1)
        {
          if (*(void *)v171 != v133) {
            objc_enumerationMutation(v142);
          }
          __int128 v41 = *(void **)(*((void *)&v170 + 1) + 8LL * (void)m);
          context = (void *)MEMORY[0x186E3E5D8]();
          __int128 v42 = (void *)[v41 componentsSeparatedByString:@"-"];
          uint64_t v43 = _sqlEntityForEntityID( [*(id *)(a1 + 16) model],  objc_msgSend((id)objc_msgSend(v42, "firstObject"), "longLongValue"));
          uint64_t v44 = (void *)[v142 objectForKey:v41];
          if (a2 && [*(id *)(a2 + 144) objectForKey:v41])
          {
            uint64_t v44 = (void *)[MEMORY[0x189603FE0] setWithSet:v44];
            objc_msgSend( v44,  "addObjectsFromArray:",  objc_msgSend((id)objc_msgSend(v145, "objectForKey:", v41), "allObjects"));
          }

          uint64_t v45 = +[_NSPersistentHistoryChange _propertyDataForEntity:withSetOfPropertyNames:]( (uint64_t)&OBJC_CLASS____NSPersistentHistoryChange,  v43,  v44);
          -[NSSQLSaveChangesRequestContext addDataMask:forEntityKey:](a2, v45, (uint64_t)v41);

          __int128 v168 = 0u;
          __int128 v169 = 0u;
          __int128 v166 = 0u;
          __int128 v167 = 0u;
          uint64_t v46 = [v149 countByEnumeratingWithState:&v166 objects:v194 count:16];
          if (!v46) {
            goto LABEL_97;
          }
          uint64_t v47 = *(void *)v167;
          do
          {
            uint64_t v48 = 0LL;
            do
            {
              if (*(void *)v167 != v47) {
                objc_enumerationMutation(v149);
              }
              uint64_t v49 = *(void **)(*((void *)&v166 + 1) + 8 * v48);
              if (v49 && (uint64_t v50 = [*(id *)(v49[5] + 16) _storeInfo1]) != 0)
              {
                int v51 = *(_DWORD *)(v50 + 184);
                if (!v43) {
                  goto LABEL_95;
                }
              }

              else
              {
                int v51 = 0;
                if (!v43)
                {
LABEL_95:
                  int v52 = 0;
                  goto LABEL_90;
                }
              }

              int v52 = v43[46];
LABEL_90:
              if (v51 == v52)
              {
                uint64_t v53 = objc_msgSend((id)objc_msgSend(v49, "objectID"), "_referenceData64");
                if (v53 == objc_msgSend((id)objc_msgSend(v42, "lastObject"), "longLongValue")) {
                  goto LABEL_98;
                }
              }

              ++v48;
            }

            while (v46 != v48);
            uint64_t v54 = [v149 countByEnumeratingWithState:&v166 objects:v194 count:16];
            uint64_t v46 = v54;
          }

          while (v54);
LABEL_97:
          [v126 setValue:v44 forKey:v41];
LABEL_98:
          objc_autoreleasePoolPop(context);
        }

        uint64_t v136 = [v142 countByEnumeratingWithState:&v170 objects:&v195 count:16];
        if (!v136)
        {
          __int128 v39 = v126;
          goto LABEL_103;
        }
      }
    }

    __int128 v39 = 0LL;
LABEL_103:

    if (![v39 count])
    {

      __int128 v39 = 0LL;
    }

    id v146 = v39;
    __int128 v158 = 0u;
    __int128 v159 = 0u;
    __int128 v160 = 0u;
    __int128 v161 = 0u;
    uint64_t v55 = [v149 countByEnumeratingWithState:&v158 objects:v192 count:16];
    if (v55)
    {
      uint64_t v56 = *(void *)v159;
      do
      {
        uint64_t v57 = 0LL;
        do
        {
          if (*(void *)v159 != v56) {
            objc_enumerationMutation(v149);
          }
          uint64_t v58 = *(void *)(*((void *)&v158 + 1) + 8 * v57);
          sqlite3_int64 v59 = (void *)MEMORY[0x186E3E5D8]();
          uint64_t v60 = *(void *)(a1 + 16);
          if (v60) {
            double v61 = (void *)[*(id *)(v60 + 240) objectForKey:@"NSPersistentHistoryTrackingEntitiesToExclude"];
          }
          else {
            double v61 = 0LL;
          }
          if ([v61 count])
          {
            uint64_t v62 = *(void *)(a1 + 16);
            if (v62)
            {
              uint64_t v63 = (void *)[*(id *)(v62 + 240) objectForKey:@"NSPersistentHistoryTrackingEntitiesToExclude"];
              if (v58) {
                goto LABEL_115;
              }
LABEL_119:
              uint64_t v64 = 0LL;
            }

            else
            {
              uint64_t v63 = 0LL;
              if (!v58) {
                goto LABEL_119;
              }
LABEL_115:
              if ((*(_BYTE *)(v58 + 16) & 1) != 0) {
                goto LABEL_119;
              }
              uint64_t v64 = (void *)[*(id *)(*(void *)(v58 + 40) + 16) _storeInfo1];
            }

            if (objc_msgSend(v63, "containsObject:", objc_msgSend(v64, "name"))) {
              goto LABEL_128;
            }
          }

          uint64_t v65 = (void *)NSString;
          if (v58)
          {
            uint64_t v66 = [*(id *)(*(void *)(v58 + 40) + 16) _storeInfo1];
            if (v66) {
              uint64_t v67 = *(unsigned int *)(v66 + 184);
            }
            else {
              uint64_t v67 = 0LL;
            }
            uint64_t v68 = [*(id *)(*(void *)(v58 + 40) + 16) _referenceData64];
          }

          else
          {
            uint64_t v67 = 0LL;
            uint64_t v68 = 0LL;
          }

          uint64_t v69 = objc_msgSend(v65, "stringWithFormat:", @"%u-%lld", v67, v68);
          if (a2 && [*(id *)(a2 + 144) objectForKey:v69]) {
            [v127 addObject:v58];
          }
LABEL_128:
          objc_autoreleasePoolPop(v59);
          ++v57;
        }

        while (v55 != v57);
        uint64_t v70 = [v149 countByEnumeratingWithState:&v158 objects:v192 count:16];
        uint64_t v55 = v70;
      }

      while (v70);
    }

    if ([v127 count]) {
      [v125 setValue:v127 forKey:@"updated"];
    }
  }

  else
  {
    id v146 = 0LL;
  }

  if (![v129 count]) {
    goto LABEL_170;
  }
  id v143 = (id)objc_msgSend(objc_alloc(MEMORY[0x189603FE0]), "initWithCapacity:", objc_msgSend(v129, "count"));
  __int128 v156 = 0u;
  __int128 v157 = 0u;
  __int128 v154 = 0u;
  __int128 v155 = 0u;
  uint64_t v71 = [v129 countByEnumeratingWithState:&v154 objects:v191 count:16];
  if (!v71) {
    goto LABEL_165;
  }
  uint64_t v72 = *(void *)v155;
  while (2)
  {
    uint64_t v73 = 0LL;
    while (2)
    {
      if (*(void *)v155 != v72) {
        objc_enumerationMutation(v129);
      }
      uint64_t v74 = *(void *)(*((void *)&v154 + 1) + 8 * v73);
      double v75 = (void *)MEMORY[0x186E3E5D8]();
      uint64_t v76 = *(void *)(a1 + 16);
      if (v76) {
        uint64_t v77 = (void *)[*(id *)(v76 + 240) objectForKey:@"NSPersistentHistoryTrackingEntitiesToExclude"];
      }
      else {
        uint64_t v77 = 0LL;
      }
      if (![v77 count]) {
        goto LABEL_153;
      }
      uint64_t v78 = *(void *)(a1 + 16);
      if (v78)
      {
        uint64_t v79 = (void *)[*(id *)(v78 + 240) objectForKey:@"NSPersistentHistoryTrackingEntitiesToExclude"];
        if (v74) {
          goto LABEL_147;
        }
LABEL_151:
        uint64_t v80 = 0LL;
      }

      else
      {
        uint64_t v79 = 0LL;
        if (!v74) {
          goto LABEL_151;
        }
LABEL_147:
        if ((*(_BYTE *)(v74 + 16) & 1) != 0) {
          goto LABEL_151;
        }
        uint64_t v80 = (void *)[*(id *)(*(void *)(v74 + 40) + 16) _storeInfo1];
      }

      if ((objc_msgSend(v79, "containsObject:", objc_msgSend(v80, "name")) & 1) == 0)
      {
LABEL_153:
        uint64_t v81 = (void *)NSString;
        if (v74)
        {
          uint64_t v82 = [*(id *)(*(void *)(v74 + 40) + 16) _storeInfo1];
          if (v82) {
            uint64_t v83 = *(unsigned int *)(v82 + 184);
          }
          else {
            uint64_t v83 = 0LL;
          }
          uint64_t v84 = [*(id *)(*(void *)(v74 + 40) + 16) _referenceData64];
        }

        else
        {
          uint64_t v83 = 0LL;
          uint64_t v84 = 0LL;
        }

        uint64_t v85 = objc_msgSend(v81, "stringWithFormat:", @"%u-%lld", v83, v84);
        if (a2)
        {
          uint64_t v86 = v85;
          if ([*(id *)(a2 + 144) objectForKey:v85])
          {
            [v143 addObject:v74];
            [v146 removeObjectForKey:v86];
          }
        }
      }

      objc_autoreleasePoolPop(v75);
      if (v71 != ++v73) {
        continue;
      }
      break;
    }

    uint64_t v87 = [v129 countByEnumeratingWithState:&v154 objects:v191 count:16];
    uint64_t v71 = v87;
    if (v87) {
      continue;
    }
    break;
  }

- (uint64_t)_insertTransactionStringsForRequestContext:(sqlite3_int64)a1
{
  if (a2 && (uint64_t v4 = *(_BYTE **)(a2 + 32)) != 0LL && (v4[43] & 1) != 0)
  {
    uint64_t v5 = -[NSPersistentStoreCoordinator _xpcBundleIdentifier]((os_unfair_lock_s *)[v4 persistentStoreCoordinator]);
    __int128 v11 = -[NSPersistentStoreCoordinator _xpcProcessName]((os_unfair_lock_s *)[*(id *)(a2 + 32) persistentStoreCoordinator]);
    uint64_t v7 = (uint64_t)v11;
    BOOL v8 = v11 != 0LL;
    if (v5 == 0LL && v8) {
      uint64_t v5 = v11;
    }
  }

  else
  {
    uint64_t v5 = (os_unfair_lock_s *)objc_msgSend((id)objc_msgSend(MEMORY[0x1896077F8], "mainBundle"), "bundleIdentifier");
    uint64_t v6 = objc_msgSend((id)objc_msgSend(MEMORY[0x1896079D8], "processInfo"), "processName");
    uint64_t v7 = v6;
    BOOL v8 = v6 != 0;
    if (v5 == 0LL && v8) {
      uint64_t v5 = (os_unfair_lock_s *)v6;
    }
    if (!a2)
    {
      uint64_t v9 = [0 name];
      uint64_t v10 = 0LL;
      goto LABEL_11;
    }
  }

  uint64_t v9 = [*(id *)(a2 + 32) name];
  uint64_t v10 = *(void **)(a2 + 32);
LABEL_11:
  uint64_t v12 = [v10 transactionAuthor];
  uint64_t v13 = (void *)[objc_alloc(MEMORY[0x189603FC8]) initWithCapacity:4];
  uint64_t v14 = v13;
  if (v5) {
    [v13 setValue:v5 forKey:@"BUNDLEIDTS"];
  }
  if (v8) {
    [v14 setValue:v7 forKey:@"PROCESSIDTS"];
  }
  if (v9) {
    [v14 setValue:v9 forKey:@"CONTEXTNAMETS"];
  }
  if (v12) {
    [v14 setValue:v12 forKey:@"AUTHORTS"];
  }
  uint64_t v15 = -[NSSQLiteConnection _transactionsStringAndPKsForStrings:](a1, v14);

  return v15;
}

- (uint64_t)_insertTransactionForRequestContext:(void *)a3 andStrings:
{
  uint64_t v41 = *MEMORY[0x1895F89C0];
  id v7 = objc_alloc_init(MEMORY[0x1896077E8]);
  BOOL v8 = (void *)objc_msgSend( (id)objc_msgSend( (id)objc_msgSend(*(id *)(a1 + 16), "ancillarySQLModels"),  "objectForKey:",  @"NSPersistentHistoryTrackingKey"),  "entityNamed:",  @"TRANSACTION");
  -[NSSQLiteConnection generatePrimaryKeysForEntity:batch:](a1, (uint64_t)v8, 1u);
  if (!v9)
  {
    id v29 = +[_NSCoreDataException exceptionWithName:code:reason:userInfo:]( (uint64_t)&OBJC_CLASS____NSCoreDataException,  *MEMORY[0x189603A58],  134030LL,  (uint64_t)@"unable to generate primary keys for transaction",  0LL);
    objc_exception_throw(v29);
    goto LABEL_32;
  }

  uint64_t v3 = v9;
  uint64_t v31 = v7;
  uint64_t v32 = a1;
  -[NSSQLiteConnection prepareInsertStatementForAncillaryEntity:](a1, v8);
  if (!a2)
  {
LABEL_32:
    uint64_t v10 = 0LL;
    goto LABEL_4;
  }

  uint64_t v10 = *(void **)(a2 + 32);
LABEL_4:
  if (objc_msgSend((id)objc_msgSend(v10, "_queryGenerationToken"), "_isEnabled")
    && (!a2 ? (__int128 v11 = 0LL) : (__int128 v11 = *(void **)(a2 + 32)),
        (v12 = -[_NSQueryGenerationToken _generationalComponentForStore:]( [v11 _queryGenerationToken],  *(id *)(v32 + 16))) == 0 ? (uint64_t v13 = 0)
      : (uint64_t v13 = *((void *)v12 + 3)),
        objc_opt_class(),
        (objc_opt_isKindOfClass() & (v13 != 0)) == 1))
  {
    uint64_t v14 = [MEMORY[0x189603F48] dataWithBytes:*(void *)(v13 + 8) length:48];
  }

  else
  {
    uint64_t v14 = 0LL;
  }

  uint64_t v15 = [a3 valueForKey:@"AUTHORTS"];
  uint64_t v35 = [a3 valueForKey:@"BUNDLEIDTS"];
  uint64_t v34 = [a3 valueForKey:@"CONTEXTNAMETS"];
  uint64_t v30 = v8;
  uint64_t v33 = [a3 valueForKey:@"PROCESSIDTS"];
  __int128 v38 = 0u;
  __int128 v39 = 0u;
  __int128 v36 = 0u;
  __int128 v37 = 0u;
  uint64_t v16 = (void *)[*(id *)(v32 + 48) bindVariables];
  uint64_t v17 = [v16 countByEnumeratingWithState:&v36 objects:v40 count:16];
  if (v17)
  {
    uint64_t v18 = *(void *)v37;
    do
    {
      for (uint64_t i = 0LL; i != v17; ++i)
      {
        if (*(void *)v37 != v18) {
          objc_enumerationMutation(v16);
        }
        uint64_t v20 = *(void **)(*((void *)&v36 + 1) + 8 * i);
        int v21 = [v20 index];
        uint64_t v22 = (void *)v15;
        uint64_t v23 = v3;
        switch(v21)
        {
          case 0:
            goto LABEL_25;
          case 3:
            goto LABEL_24;
          case 4:
            uint64_t v22 = (void *)v35;
            goto LABEL_24;
          case 5:
            uint64_t v22 = (void *)v34;
            goto LABEL_24;
          case 6:
            uint64_t v22 = (void *)v33;
LABEL_24:
            uint64_t v23 = objc_msgSend(v22, "longLongValue", v3);
LABEL_25:
            [v20 setInt64:v23];
            break;
          case 11:
            if (v14) {
              [v20 setValue:v14];
            }
            break;
          case 12:
            uint64_t v24 = (void *)MEMORY[0x189607968];
            objc_msgSend(MEMORY[0x189603F50], "timeIntervalSinceReferenceDate", v3);
            objc_msgSend(v20, "setValue:", objc_msgSend(v24, "numberWithDouble:"));
            break;
          default:
            continue;
        }
      }

      uint64_t v17 = [v16 countByEnumeratingWithState:&v36 objects:v40 count:16];
    }

    while (v17);
  }

  [(id)v32 execute];
  if (!*(void *)(v32 + 80))
  {
    uint64_t v25 = -[NSSQLiteConnection statementCacheForEntity:](v32, v30);
    -[NSSQLiteStatementCache cacheInsertStatement:](v25, 0LL);
  }

  uint64_t v26 = (int)objc_msgSend( (id)objc_msgSend( MEMORY[0x189607968],  "numberWithLongLong:",  sqlite3_last_insert_rowid(*(sqlite3 **)(v32 + 72))),  "intValue");
  -[NSSQLiteConnection _clearBindVariablesForInsertedRow](v32);
  -[NSSQLiteConnection resetSQLStatement](v32);
  [v31 drain];
  id v27 = 0LL;
  return v26;
}

- (void)insertChanges:(uint64_t)a3 type:(uint64_t)a4 transactionID:(uint64_t)a5 context:
{
  uint64_t v79 = *MEMORY[0x1895F89C0];
  uint64_t v6 = *(dispatch_queue_s **)(a1 + 8);
  if (v6) {
    dispatch_assert_queue_V2(v6);
  }
  if (a3 == 2) {
    id v52 = objc_alloc_init(MEMORY[0x189603FC8]);
  }
  else {
    id v52 = 0LL;
  }
  id v7 = (void *)objc_msgSend( (id)objc_msgSend(*(id *)(a1 + 16), "options"),  "valueForKey:",  @"NSPersistentHistoryTrackingKey");
  if ([v7 isNSDictionary]) {
    int v56 = objc_msgSend( (id)objc_msgSend(v7, "valueForKey:", @"NSPersistentHistoryUseContextObjectsForDeletes"),  "BOOLValue");
  }
  else {
    int v56 = 0;
  }
  id v49 = objc_alloc_init(MEMORY[0x1896077E8]);
  uint64_t v57 = (void *)objc_msgSend( (id)objc_msgSend( (id)objc_msgSend(*(id *)(a1 + 16), "ancillarySQLModels"),  "objectForKey:",  @"NSPersistentHistoryTrackingKey"),  "entityNamed:",  @"CHANGE");
  -[NSSQLiteConnection generatePrimaryKeysForEntity:batch:](a1, (uint64_t)v57, [a2 count]);
  uint64_t v9 = v8;
  if (v8)
  {
    uint64_t v10 = [a2 count];
    if (a5) {
      uint64_t v50 = *(void **)(a5 + 32);
    }
    else {
      uint64_t v50 = 0LL;
    }
    __int128 v75 = 0u;
    __int128 v76 = 0u;
    __int128 v73 = 0u;
    __int128 v74 = 0u;
    uint64_t v11 = [a2 countByEnumeratingWithState:&v73 objects:v78 count:16];
    if (v11)
    {
      uint64_t v12 = v9 - v10;
      uint64_t v53 = *(void *)v74;
      uint64_t v54 = v11;
      uint64_t v64 = a5;
      do
      {
        uint64_t v61 = 0LL;
        do
        {
          if (*(void *)v74 != v53) {
            objc_enumerationMutation(a2);
          }
          uint64_t v65 = *(void *)(*((void *)&v73 + 1) + 8 * v61);
          context = (void *)MEMORY[0x186E3E5D8]();
          if (!v65 || (*(_BYTE *)(v65 + 16) & 1) != 0)
          {
            uint64_t v14 = 0LL;
          }

          else
          {
            uint64_t v13 = [*(id *)(*(void *)(v65 + 40) + 16) _storeInfo1];
            uint64_t v14 = v13;
            if (v13)
            {
              char v59 = 0;
              uint64_t v66 = *(unsigned int *)(v13 + 184);
              goto LABEL_23;
            }
          }

          uint64_t v66 = 0LL;
          char v59 = 1;
LABEL_23:
          if (a3 == 2)
          {
            id v63 = (id)objc_msgSend( v52,  "objectForKey:",  objc_msgSend(MEMORY[0x189607968], "numberWithUnsignedInt:", v66));
            if (!v63)
            {
              id v63 = +[_PFPersistentHistoryModel _retainedTombstonesForEntity:]( (uint64_t)&OBJC_CLASS____PFPersistentHistoryModel,  (void *)v14);
              if ((v59 & 1) != 0) {
                uint64_t v15 = 0LL;
              }
              else {
                uint64_t v15 = *(unsigned int *)(v14 + 184);
              }
              objc_msgSend( v52,  "setObject:forKey:",  v63,  objc_msgSend(MEMORY[0x189607968], "numberWithUnsignedInt:", v15));
            }

            if ([v63 count]) {
              int v16 = v56;
            }
            else {
              int v16 = 0;
            }
            if (v16 == 1)
            {
              uint64_t v17 = (void *)objc_msgSend(v50, "objectRegisteredForID:", objc_msgSend((id)v65, "objectID"));
              else {
                uint64_t v18 = 0LL;
              }
            }

            else
            {
              uint64_t v18 = 0LL;
            }
          }

          else
          {
            uint64_t v18 = 0LL;
            id v63 = 0LL;
          }

          -[NSSQLiteConnection prepareInsertStatementForAncillaryEntity:](a1, v57);
          __int128 v71 = 0u;
          __int128 v72 = 0u;
          __int128 v69 = 0u;
          __int128 v70 = 0u;
          BOOL v19 = (void *)[*(id *)(a1 + 48) bindVariables];
          uint64_t v20 = [v19 countByEnumeratingWithState:&v69 objects:v77 count:16];
          uint64_t v58 = v14;
          ++v12;
          if (v20)
          {
            uint64_t v21 = *(void *)v70;
            uint64_t v22 = (void *)v65;
            if (v56) {
              uint64_t v22 = v18;
            }
            uint64_t v55 = v22;
            do
            {
              uint64_t v23 = 0LL;
              do
              {
                if (*(void *)v70 != v21) {
                  objc_enumerationMutation(v19);
                }
                uint64_t v24 = *(void **)(*((void *)&v69 + 1) + 8 * v23);
                uint64_t v25 = (void *)MEMORY[0x186E3E5D8]();
                if (![v24 index])
                {
                  int v26 = [v24 sqlType];
                  uint64_t v27 = v12;
                  if (v26 == 2)
                  {
LABEL_50:
                    [v24 setInt64:v27];
                    goto LABEL_54;
                  }
                }

                if ([v24 index] != 1 && objc_msgSend(v24, "index") != 2)
                {
                  if ([v24 index] == 3)
                  {
                    int v28 = [v24 sqlType];
                    uint64_t v27 = a4;
                    if (v28 == 2) {
                      goto LABEL_50;
                    }
                  }

                  if (objc_msgSend(v24, "index", v27) == 4)
                  {
                    uint64_t v29 = [MEMORY[0x189607968] numberWithUnsignedInteger:a3];
LABEL_53:
                    [v24 setValue:v29];
                    goto LABEL_54;
                  }

                  if ([v24 index] == 5)
                  {
                    if (a3 == 1)
                    {
                      uint64_t v30 = v64;
                      id v31 = objc_alloc(NSString);
                      if (v65) {
                        uint64_t v32 = [*(id *)(*(void *)(v65 + 40) + 16) _referenceData64];
                      }
                      else {
                        uint64_t v32 = 0LL;
                      }
                      uint64_t v33 = (void *)objc_msgSend(v31, "initWithFormat:", @"%u-%lld", v66, v32);
                      if (v64) {
                        uint64_t v30 = [*(id *)(v64 + 144) objectForKey:v33];
                      }

                      [v24 setValue:v30];
                    }
                  }

                  else
                  {
                    if ([v24 index] == 6)
                    {
                      uint64_t v29 = [MEMORY[0x189607968] numberWithUnsignedInt:v66];
                      goto LABEL_53;
                    }

                    if ([v24 index] == 7)
                    {
                      uint64_t v34 = (void *)MEMORY[0x189607968];
                      if (v65) {
                        uint64_t v35 = [*(id *)(*(void *)(v65 + 40) + 16) _referenceData64];
                      }
                      else {
                        uint64_t v35 = 0LL;
                      }
                      uint64_t v29 = [v34 numberWithLongLong:v35];
                      goto LABEL_53;
                    }

                    uint64_t v36 = objc_msgSend((id)objc_msgSend(v24, "propertyDescription"), "name");
                    if (a3 == 2)
                    {
                      __int128 v37 = (void *)v36;
                      if ([v63 count])
                      {
                        if ([v37 containsString:@"TOMBSTONE"])
                        {
                          int v38 = objc_msgSend( (id)objc_msgSend( v37,  "stringByReplacingOccurrencesOfString:withString:",  @"TOMBSTONE",  &stru_189EAC2E8),  "intValue");
                          if (v38 < (int)[v63 count])
                          {
                            __int128 v39 = (void *)[v63 objectAtIndexedSubscript:v38];
                            if ((v59 & 1) != 0) {
                              uint64_t v40 = 0LL;
                            }
                            else {
                              uint64_t v40 = (void *)[*(id *)(v58 + 40) objectForKey:v39];
                            }
                            objc_msgSend(v24, "setSQLType:", objc_msgSend(v40, "sqlType"));
                            if ([v40 sqlType] == 15) {
                              objc_msgSend( v24,  "setTombstonedPropertyDescription:",  objc_msgSend(v40, "propertyDescription"));
                            }
                            uint64_t v41 = (void *)[v55 valueForKey:v39];
                            if (v41)
                            {
                              if (objc_msgSend((id)objc_msgSend(v40, "propertyDescription"), "superCompositeAttribute"))
                              {
                                __int128 v42 = (void *)[v39 componentsSeparatedByString:@"."];
                                for (unint64_t i = 1; [v42 count] > i; ++i)
                                  uint64_t v41 = (void *)objc_msgSend( v41,  "objectForKey:",  objc_msgSend(v42, "objectAtIndex:", i));
                              }

                              [v24 setValue:v41];
                            }
                          }
                        }
                      }
                    }
                  }
                }

void __67__NSSQLiteConnection_processRelationshipUpdates_forRequestContext___block_invoke( uint64_t a1,  void *a2,  void *a3)
{
  uint64_t v6 = *(void **)(*(void *)(a1 + 32) + 16LL);
  id v7 = (void *)[a2 entity];
  if (v6) {
    BOOL v8 = v7 == 0LL;
  }
  else {
    BOOL v8 = 1;
  }
  if (v8)
  {
    id v9 = objc_alloc(NSString);
    uint64_t v10 = 0LL;
  }

  else
  {
    uint64_t v10 = _sqlCoreLookupSQLEntityForEntityDescription(v6, v7);
    id v11 = objc_alloc(NSString);
    id v9 = v11;
    if (v10) {
      uint64_t v10 = *(unsigned int *)(v10 + 184);
    }
  }

  uint64_t v12 = (void *)objc_msgSend(v9, "initWithFormat:", @"%u-%lld", v10, objc_msgSend(a2, "_referenceData64"));
  uint64_t v13 = [*(id *)(a1 + 40) objectForKey:v12];
  if (v13)
  {
    uint64_t v14 = (void *)v13;
    uint64_t v15 = *(void *)(a1 + 48);
    if (v15) {
      int v16 = *(void **)(v15 + 8);
    }
    else {
      int v16 = 0LL;
    }
    objc_msgSend(v14, "addObject:", objc_msgSend(v16, "name"));
  }

  else
  {
    id v17 = objc_alloc(MEMORY[0x189603FE0]);
    uint64_t v18 = *(void *)(a1 + 48);
    if (v18) {
      BOOL v19 = *(void **)(v18 + 8);
    }
    else {
      BOOL v19 = 0LL;
    }
    uint64_t v20 = (void *)objc_msgSend(v17, "initWithObjects:", objc_msgSend(v19, "name"), 0);
    [*(id *)(a1 + 40) setValue:v20 forKey:v12];
  }

  uint64_t v21 = *(void **)(*(void *)(a1 + 32) + 16LL);
  uint64_t v22 = (void *)[a3 entity];
  if (v21 && v22)
  {
    uint64_t v23 = _sqlCoreLookupSQLEntityForEntityDescription(v21, v22);
    id v24 = objc_alloc(NSString);
    if (v23) {
      uint64_t v23 = *(unsigned int *)(v23 + 184);
    }
  }

  else
  {
    id v24 = objc_alloc(NSString);
    uint64_t v23 = 0LL;
  }

  id v35 = (id)objc_msgSend(v24, "initWithFormat:", @"%u-%lld", v23, objc_msgSend(a3, "_referenceData64"));
  uint64_t v25 = objc_msgSend(*(id *)(a1 + 40), "objectForKey:");
  if (v25)
  {
    int v26 = (void *)v25;
    uint64_t v27 = *(void *)(a1 + 48);
    if (v27 && (uint64_t v28 = *(void *)(v27 + 8)) != 0) {
      uint64_t v29 = *(void **)(v28 + 56);
    }
    else {
      uint64_t v29 = 0LL;
    }
    objc_msgSend(v26, "addObject:", objc_msgSend(v29, "name"));
  }

  else
  {
    id v30 = objc_alloc(MEMORY[0x189603FE0]);
    uint64_t v31 = *(void *)(a1 + 48);
    if (v31 && (uint64_t v32 = *(void *)(v31 + 8)) != 0) {
      uint64_t v33 = *(void **)(v32 + 56);
    }
    else {
      uint64_t v33 = 0LL;
    }
    uint64_t v34 = (void *)objc_msgSend(v30, "initWithObjects:", objc_msgSend(v33, "name"), 0);
    [*(id *)(a1 + 40) setValue:v34 forKey:v35];
  }
}

void __67__NSSQLiteConnection_processRelationshipUpdates_forRequestContext___block_invoke_2( uint64_t a1,  void *a2,  void *a3)
{
  uint64_t v6 = *(void **)(*(void *)(a1 + 32) + 16LL);
  id v7 = (void *)[a2 entity];
  if (v6) {
    BOOL v8 = v7 == 0LL;
  }
  else {
    BOOL v8 = 1;
  }
  if (v8)
  {
    id v9 = objc_alloc(NSString);
    uint64_t v10 = 0LL;
  }

  else
  {
    uint64_t v10 = _sqlCoreLookupSQLEntityForEntityDescription(v6, v7);
    id v11 = objc_alloc(NSString);
    id v9 = v11;
    if (v10) {
      uint64_t v10 = *(unsigned int *)(v10 + 184);
    }
  }

  uint64_t v12 = (void *)objc_msgSend(v9, "initWithFormat:", @"%u-%lld", v10, objc_msgSend(a2, "_referenceData64"));
  uint64_t v13 = [*(id *)(a1 + 40) objectForKey:v12];
  if (v13)
  {
    uint64_t v14 = (void *)v13;
    uint64_t v15 = *(void *)(a1 + 48);
    if (v15) {
      int v16 = *(void **)(v15 + 8);
    }
    else {
      int v16 = 0LL;
    }
    objc_msgSend(v14, "addObject:", objc_msgSend(v16, "name"));
  }

  else
  {
    id v17 = objc_alloc(MEMORY[0x189603FE0]);
    uint64_t v18 = *(void *)(a1 + 48);
    if (v18) {
      BOOL v19 = *(void **)(v18 + 8);
    }
    else {
      BOOL v19 = 0LL;
    }
    uint64_t v20 = (void *)objc_msgSend(v17, "initWithObjects:", objc_msgSend(v19, "name"), 0);
    [*(id *)(a1 + 56) setValue:v20 forKey:v12];
  }

  uint64_t v21 = *(void **)(*(void *)(a1 + 32) + 16LL);
  uint64_t v22 = (void *)[a3 entity];
  if (v21 && v22)
  {
    uint64_t v23 = _sqlCoreLookupSQLEntityForEntityDescription(v21, v22);
    id v24 = objc_alloc(NSString);
    if (v23) {
      uint64_t v23 = *(unsigned int *)(v23 + 184);
    }
  }

  else
  {
    id v24 = objc_alloc(NSString);
    uint64_t v23 = 0LL;
  }

  id v35 = (id)objc_msgSend(v24, "initWithFormat:", @"%u-%lld", v23, objc_msgSend(a3, "_referenceData64"));
  uint64_t v25 = objc_msgSend(*(id *)(a1 + 40), "objectForKey:");
  if (v25)
  {
    int v26 = (void *)v25;
    uint64_t v27 = *(void *)(a1 + 48);
    if (v27 && (uint64_t v28 = *(void *)(v27 + 8)) != 0) {
      uint64_t v29 = *(void **)(v28 + 56);
    }
    else {
      uint64_t v29 = 0LL;
    }
    objc_msgSend(v26, "addObject:", objc_msgSend(v29, "name"));
  }

  else
  {
    id v30 = objc_alloc(MEMORY[0x189603FE0]);
    uint64_t v31 = *(void *)(a1 + 48);
    if (v31 && (uint64_t v32 = *(void *)(v31 + 8)) != 0) {
      uint64_t v33 = *(void **)(v32 + 56);
    }
    else {
      uint64_t v33 = 0LL;
    }
    uint64_t v34 = (void *)objc_msgSend(v30, "initWithObjects:", objc_msgSend(v33, "name"), 0);
    [*(id *)(a1 + 56) setValue:v34 forKey:v35];
  }
}

void __67__NSSQLiteConnection_processRelationshipUpdates_forRequestContext___block_invoke_3( uint64_t a1,  void *a2,  void *a3)
{
  uint64_t v6 = *(void **)(*(void *)(a1 + 32) + 16LL);
  id v7 = (void *)[a2 entity];
  if (v6) {
    BOOL v8 = v7 == 0LL;
  }
  else {
    BOOL v8 = 1;
  }
  if (v8)
  {
    id v9 = objc_alloc(NSString);
    uint64_t v10 = 0LL;
  }

  else
  {
    uint64_t v10 = _sqlCoreLookupSQLEntityForEntityDescription(v6, v7);
    id v11 = objc_alloc(NSString);
    id v9 = v11;
    if (v10) {
      uint64_t v10 = *(unsigned int *)(v10 + 184);
    }
  }

  uint64_t v12 = (void *)objc_msgSend(v9, "initWithFormat:", @"%u-%lld", v10, objc_msgSend(a2, "_referenceData64"));
  uint64_t v13 = [*(id *)(a1 + 40) objectForKey:v12];
  if (v13)
  {
    uint64_t v14 = (void *)v13;
    uint64_t v15 = *(void *)(a1 + 48);
    if (v15 && (uint64_t v16 = *(void *)(v15 + 8)) != 0) {
      id v17 = *(void **)(v16 + 56);
    }
    else {
      id v17 = 0LL;
    }
    objc_msgSend(v14, "addObject:", objc_msgSend(v17, "name"));
  }

  else
  {
    id v18 = objc_alloc(MEMORY[0x189603FE0]);
    uint64_t v19 = *(void *)(a1 + 48);
    if (v19 && (uint64_t v20 = *(void *)(v19 + 8)) != 0) {
      uint64_t v21 = *(void **)(v20 + 56);
    }
    else {
      uint64_t v21 = 0LL;
    }
    uint64_t v22 = (void *)objc_msgSend(v18, "initWithObjects:", objc_msgSend(v21, "name"), 0);
    [*(id *)(a1 + 56) setValue:v22 forKey:v12];
  }

  uint64_t v23 = *(void **)(*(void *)(a1 + 32) + 16LL);
  id v24 = (void *)[a3 entity];
  if (v23 && v24)
  {
    uint64_t v25 = _sqlCoreLookupSQLEntityForEntityDescription(v23, v24);
    id v26 = objc_alloc(NSString);
    if (v25) {
      uint64_t v25 = *(unsigned int *)(v25 + 184);
    }
  }

  else
  {
    id v26 = objc_alloc(NSString);
    uint64_t v25 = 0LL;
  }

  id v35 = (id)objc_msgSend(v26, "initWithFormat:", @"%u-%lld", v25, objc_msgSend(a3, "_referenceData64"));
  uint64_t v27 = objc_msgSend(*(id *)(a1 + 40), "objectForKey:");
  if (v27)
  {
    uint64_t v28 = (void *)v27;
    uint64_t v29 = *(void *)(a1 + 48);
    if (v29) {
      id v30 = *(void **)(v29 + 8);
    }
    else {
      id v30 = 0LL;
    }
    objc_msgSend(v28, "addObject:", objc_msgSend(v30, "name"));
  }

  else
  {
    id v31 = objc_alloc(MEMORY[0x189603FE0]);
    uint64_t v32 = *(void *)(a1 + 48);
    if (v32) {
      uint64_t v33 = *(void **)(v32 + 8);
    }
    else {
      uint64_t v33 = 0LL;
    }
    uint64_t v34 = (void *)objc_msgSend(v31, "initWithObjects:", objc_msgSend(v33, "name"), 0);
    [*(id *)(a1 + 56) setValue:v34 forKey:v35];
  }
}

void __67__NSSQLiteConnection_processRelationshipUpdates_forRequestContext___block_invoke_4( uint64_t a1,  void *a2,  void *a3)
{
  uint64_t v6 = *(void **)(*(void *)(a1 + 32) + 16LL);
  id v7 = (void *)[a2 entity];
  if (v6) {
    BOOL v8 = v7 == 0LL;
  }
  else {
    BOOL v8 = 1;
  }
  if (v8)
  {
    id v9 = objc_alloc(NSString);
    uint64_t v10 = 0LL;
  }

  else
  {
    uint64_t v10 = _sqlCoreLookupSQLEntityForEntityDescription(v6, v7);
    id v11 = objc_alloc(NSString);
    id v9 = v11;
    if (v10) {
      uint64_t v10 = *(unsigned int *)(v10 + 184);
    }
  }

  uint64_t v12 = (void *)objc_msgSend(v9, "initWithFormat:", @"%u-%lld", v10, objc_msgSend(a2, "_referenceData64"));
  uint64_t v13 = [*(id *)(a1 + 40) objectForKey:v12];
  if (v13)
  {
    uint64_t v14 = (void *)v13;
    uint64_t v15 = *(void *)(a1 + 48);
    if (v15) {
      uint64_t v16 = *(void **)(v15 + 8);
    }
    else {
      uint64_t v16 = 0LL;
    }
    objc_msgSend(v14, "addObject:", objc_msgSend(v16, "name"));
  }

  else
  {
    id v17 = objc_alloc(MEMORY[0x189603FE0]);
    uint64_t v18 = *(void *)(a1 + 48);
    if (v18) {
      uint64_t v19 = *(void **)(v18 + 8);
    }
    else {
      uint64_t v19 = 0LL;
    }
    uint64_t v20 = (void *)objc_msgSend(v17, "initWithObjects:", objc_msgSend(v19, "name"), 0);
    [*(id *)(a1 + 40) setValue:v20 forKey:v12];
  }

  uint64_t v21 = *(void **)(*(void *)(a1 + 32) + 16LL);
  uint64_t v22 = (void *)[a3 entity];
  if (v21 && v22)
  {
    uint64_t v23 = _sqlCoreLookupSQLEntityForEntityDescription(v21, v22);
    id v24 = objc_alloc(NSString);
    if (v23) {
      uint64_t v23 = *(unsigned int *)(v23 + 184);
    }
  }

  else
  {
    id v24 = objc_alloc(NSString);
    uint64_t v23 = 0LL;
  }

  id v35 = (id)objc_msgSend(v24, "initWithFormat:", @"%u-%lld", v23, objc_msgSend(a3, "_referenceData64"));
  uint64_t v25 = objc_msgSend(*(id *)(a1 + 40), "objectForKey:");
  if (v25)
  {
    id v26 = (void *)v25;
    uint64_t v27 = *(void *)(a1 + 48);
    if (v27 && (uint64_t v28 = *(void *)(v27 + 8)) != 0) {
      uint64_t v29 = *(void **)(v28 + 56);
    }
    else {
      uint64_t v29 = 0LL;
    }
    objc_msgSend(v26, "addObject:", objc_msgSend(v29, "name"));
  }

  else
  {
    id v30 = objc_alloc(MEMORY[0x189603FE0]);
    uint64_t v31 = *(void *)(a1 + 48);
    if (v31 && (uint64_t v32 = *(void *)(v31 + 8)) != 0) {
      uint64_t v33 = *(void **)(v32 + 56);
    }
    else {
      uint64_t v33 = 0LL;
    }
    uint64_t v34 = (void *)objc_msgSend(v30, "initWithObjects:", objc_msgSend(v33, "name"), 0);
    [*(id *)(a1 + 40) setValue:v34 forKey:v35];
  }
}

- (void)processInsertRequest:(uint64_t)a1
{
  uint64_t v73 = *MEMORY[0x1895F89C0];
  if (a1)
  {
    uint64_t v4 = *(void *)(a1 + 16);
    uint64_t v5 = v4
    if (![v5 count]
      || ((uint64_t v6 = *(void *)(a1 + 16)) == 0
        ? (id v7 = 0LL)
        : (id v7 = (void *)[*(id *)(v6 + 240) objectForKey:@"NSPersistentHistoryTrackingEntitiesToExclude"]),  (objc_msgSend( v7,  "containsObject:",  objc_msgSend((id)objc_msgSend(a2, "persistentStoreRequest"), "entityName")) & 1) == 0))
    {
      if (a2) {
        uint64_t v8 = a2[11];
      }
      else {
        uint64_t v8 = 0LL;
      }
      id v9 = (void *)-[NSSQLiteConnection gatherHistoryChangesFromTable:](a1, v8);
      uint64_t v10 = (void *)[v9 valueForKey:@"inserts"];
      id v11 = (void *)[v9 valueForKey:@"updates"];
      if ([v10 count] || objc_msgSend(v11, "count"))
      {
        if (![v10 count]
          && [v11 count]
          && (-[NSSQLiteConnection hasAttributeChanges:](v11) & 1) == 0)
        {
          uint64_t v52 = [a2 persistentStoreRequest];
          _NSCoreDataLog( 9LL,  (uint64_t)@"Batch Insert resulted in updates with no updated properties - %@ - %@",  v43,  v44,  v45,  v46,  v47,  v48,  v52);
          return;
        }

        int v56 = a2;
        id v54 = (id)-[NSSQLiteConnection _insertTransactionStringsForRequestContext:](a1, (uint64_t)a2);
        uint64_t v18 = -[NSSQLiteConnection _insertTransactionForRequestContext:andStrings:](a1, (uint64_t)a2, v54);
        sqlite3_int64 v19 = a1;
        uint64_t v20 = v18;
        sqlite3_int64 v62 = v19;
        uint64_t v21 = *(dispatch_queue_s **)(v19 + 8);
        if (v21) {
          dispatch_assert_queue_V2(v21);
        }
        uint64_t v55 = v11;
        if ([v10 count])
        {
          obuint64_t j = v10;
          id v53 = objc_alloc_init(MEMORY[0x1896077E8]);
          uint64_t v60 = (void *)objc_msgSend( (id)objc_msgSend( (id)objc_msgSend(*(id *)(v62 + 16), "ancillarySQLModels"),  "objectForKey:",  @"NSPersistentHistoryTrackingKey"),  "entityNamed:",  @"CHANGE");
          -[NSSQLiteConnection generatePrimaryKeysForEntity:batch:](v62, (uint64_t)v60, [v10 count]);
          uint64_t v23 = v22;
          if (v22)
          {
            uint64_t v24 = [v10 count];
            __int128 v69 = 0u;
            __int128 v70 = 0u;
            __int128 v67 = 0u;
            __int128 v68 = 0u;
            uint64_t v25 = [v10 countByEnumeratingWithState:&v67 objects:v72 count:16];
            if (!v25) {
              goto LABEL_51;
            }
            uint64_t v26 = v23 - v24;
            uint64_t v58 = *(void *)v68;
            while (1)
            {
              uint64_t v27 = 0LL;
              uint64_t v59 = v25;
              do
              {
                if (*(void *)v68 != v58) {
                  objc_enumerationMutation(obj);
                }
                uint64_t v28 = *(void **)(*((void *)&v67 + 1) + 8 * v27);
                uint64_t v29 = (void *)MEMORY[0x186E3E5D8]();
                uint64_t v30 = _sqlCoreLookupSQLEntityForEntityDescription( *(void **)(v62 + 16),  (void *)[v28 entity]);
                uint64_t v61 = v27;
                if (v30) {
                  uint64_t v31 = *(unsigned int *)(v30 + 184);
                }
                else {
                  uint64_t v31 = 0LL;
                }
                -[NSSQLiteConnection prepareInsertStatementForAncillaryEntity:](v62, v60);
                __int128 v65 = 0u;
                __int128 v66 = 0u;
                __int128 v63 = 0u;
                __int128 v64 = 0u;
                uint64_t v32 = (void *)[*(id *)(v62 + 48) bindVariables];
                uint64_t v33 = [v32 countByEnumeratingWithState:&v63 objects:v71 count:16];
                ++v26;
                if (v33)
                {
                  uint64_t v34 = *(void *)v64;
                  do
                  {
                    for (uint64_t i = 0LL; i != v33; ++i)
                    {
                      if (*(void *)v64 != v34) {
                        objc_enumerationMutation(v32);
                      }
                      uint64_t v36 = *(void **)(*((void *)&v63 + 1) + 8 * i);
                      if (![v36 index])
                      {
                        int v37 = [v36 sqlType];
                        uint64_t v38 = v26;
                        if (v37 == 2)
                        {
LABEL_35:
                          [v36 setInt64:v38];
                          continue;
                        }
                      }

                      if ([v36 index] != 1
                        && [v36 index] != 2)
                      {
                        if ([v36 index] == 3)
                        {
                          int v39 = [v36 sqlType];
                          uint64_t v38 = v20;
                          if (v39 == 2) {
                            goto LABEL_35;
                          }
                        }

                        if (objc_msgSend(v36, "index", v38) == 4)
                        {
                          uint64_t v40 = [MEMORY[0x189607968] numberWithUnsignedInteger:0];
                        }

                        else if ([v36 index] == 6)
                        {
                          uint64_t v40 = [MEMORY[0x189607968] numberWithUnsignedInt:v31];
                        }

                        else
                        {
                          uint64_t v40 = objc_msgSend( MEMORY[0x189607968],  "numberWithLongLong:",  objc_msgSend(v28, "_referenceData64"));
                        }

                        [v36 setValue:v40];
                      }
                    }

                    uint64_t v33 = [v32 countByEnumeratingWithState:&v63 objects:v71 count:16];
                  }

                  while (v33);
                }

                [(id)v62 execute];
                if (!*(void *)(v62 + 80))
                {
                  uint64_t v41 = -[NSSQLiteConnection statementCacheForEntity:](v62, v60);
                  -[NSSQLiteStatementCache cacheInsertStatement:](v41, 0LL);
                }

                -[NSSQLiteConnection _clearBindVariablesForInsertedRow](v62);
                -[NSSQLiteConnection resetSQLStatement](v62);
                objc_autoreleasePoolPop(v29);
                uint64_t v27 = v61 + 1;
              }

              while (v61 + 1 != v59);
              uint64_t v42 = [obj countByEnumeratingWithState:&v67 objects:v72 count:16];
              uint64_t v25 = v42;
              if (!v42)
              {
LABEL_51:

                id v50 = 0LL;
                goto LABEL_61;
              }
            }
          }

          id v49 = +[_NSCoreDataException exceptionWithName:code:reason:userInfo:]( (uint64_t)&OBJC_CLASS____NSCoreDataException,  *MEMORY[0x189603A58],  134030LL,  (uint64_t)@"unable to generate primary keys",  0LL);
          objc_exception_throw(v49);
          __break(1u);
        }

        else
        {
LABEL_61:
          -[NSSQLiteConnection insertUpdates:transactionID:updatedAttributes:]( v62,  v55,  v20,  (void *)objc_msgSend( (id)objc_msgSend( (id)objc_msgSend((id)objc_msgSend(v56, "persistentStoreRequest"), "entity"),  "attributesByName"),  "allValues"));
          uint64_t v51 = [MEMORY[0x189607968] numberWithLongLong:v20];
          if (v56) {
            v56[9] = v51;
          }
        }
      }

      else
      {
        _NSCoreDataLog( 9LL,  (uint64_t)@"Batch Insert resulted in no changes - %@ - %@",  v12,  v13,  v14,  v15,  v16,  v17,  (uint64_t)v10);
      }
    }
  }

- (uint64_t)gatherHistoryChangesFromTable:(uint64_t)a1
{
  uint64_t v77 = *MEMORY[0x1895F89C0];
  if (!a1) {
    return 0LL;
  }
  if (-[NSSQLiteConnection _tableHasRows:](a1, a2))
  {
    uint64_t v3 = -[NSSQLiteAdapter newStatementWithSQLString:]( (NSSQLiteStatement *)[(id)a1 adapter],  objc_msgSend( NSString,  "stringWithFormat:",  @"SELECT ENTITYID, PRIMEKEY, TYPE,  group_concat(ATTRIBUTENAME) FROM %@ GROUP BY ENTITYID, PRIMEKEY",  a2));
    id v55 = objc_alloc_init(MEMORY[0x189603FA8]);
    uint64_t v4 = -[NSSQLColumn initWithColumnName:sqlType:]( objc_alloc(&OBJC_CLASS___NSSQLColumn),  "initWithColumnName:sqlType:",  @"ENTITYID",  2LL);
    [v55 addObject:v4];

    uint64_t v5 = -[NSSQLColumn initWithColumnName:sqlType:]( objc_alloc(&OBJC_CLASS___NSSQLColumn),  "initWithColumnName:sqlType:",  @"PRIMEKEY",  2LL);
    [v55 addObject:v5];

    uint64_t v6 = -[NSSQLColumn initWithColumnName:sqlType:]( objc_alloc(&OBJC_CLASS___NSSQLColumn),  "initWithColumnName:sqlType:",  @"TYPE",  2LL);
    [v55 addObject:v6];

    id v7 = -[NSSQLColumn initWithColumnName:sqlType:]( objc_alloc(&OBJC_CLASS___NSSQLColumn),  "initWithColumnName:sqlType:",  @"ATTRIBUTENAME",  6LL);
    [v55 addObject:v7];

    -[NSSQLiteConnection prepareSQLStatement:](a1, v3);
    -[NSSQLiteConnection setColumnsToFetch:]((void *)a1, v55);
    [(id)a1 execute];
    id v59 = objc_alloc_init(MEMORY[0x189603FA8]);
    id v54 = v3;
    id v56 = objc_alloc_init(MEMORY[0x189603FA8]);
    id v57 = objc_alloc_init(MEMORY[0x189603FA8]);
    id v53 = @"inserts";
    uint64_t v58 = (void *)[objc_alloc(MEMORY[0x189603FC8]) initWithObjectsAndKeys:v59];
    while (1)
    {
      uint64_t v8 = -[NSSQLiteConnection newFetchedArray](a1);
      if (!v8)
      {
        uint64_t v51 = [MEMORY[0x189603F68] dictionaryWithDictionary:v58];

        uint64_t v50 = v51;
        -[NSSQLiteConnection releaseSQLStatement](a1);
        -[NSSQLiteConnection setColumnsToFetch:]((void *)a1, 0LL);
        *(_DWORD *)(a1 + 312) &= ~2u;
        *(void *)(a1 + 100) = 0LL;
        *(void *)(a1 + 92) = 0LL;
        *(_DWORD *)(a1 + 108) = 0;

        return v50;
      }

      id v9 = v8;
      uint64_t v10 = (void *)MEMORY[0x186E3E5D8]();
      if ([v9 count] == 4) {
        break;
      }
      uint64_t v19 = [NSString stringWithUTF8String:"incorrect number of results"];
      _NSCoreDataLog(17LL, v19, v20, v21, v22, v23, v24, v25, (uint64_t)v53);
      uint64_t v26 = (os_log_s *)__pflogFaultLog;
      if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_fault_impl(&dword_186681000, v26, OS_LOG_TYPE_FAULT, "CoreData: incorrect number of results", buf, 2u);
      }

- (uint64_t)hasAttributeChanges:(void *)a1
{
  uint64_t v14 = *MEMORY[0x1895F89C0];
  __int128 v9 = 0u;
  __int128 v10 = 0u;
  __int128 v11 = 0u;
  __int128 v12 = 0u;
  uint64_t result = [a1 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (result)
  {
    uint64_t v3 = result;
    uint64_t v4 = *(void *)v10;
    while (2)
    {
      uint64_t v5 = 0LL;
      do
      {
        if (*(void *)v10 != v4) {
          objc_enumerationMutation(a1);
        }
        uint64_t v6 = *(void **)(*((void *)&v9 + 1) + 8 * v5);
        id v7 = (void *)MEMORY[0x186E3E5D8]();
        uint64_t v8 = (void *)[v6 lastObject];
        if ([v8 isNSString] && objc_msgSend(v8, "length"))
        {
          objc_autoreleasePoolPop(v7);
          return 1LL;
        }

        objc_autoreleasePoolPop(v7);
        ++v5;
      }

      while (v3 != v5);
      uint64_t result = [a1 countByEnumeratingWithState:&v9 objects:v13 count:16];
      uint64_t v3 = result;
      if (result) {
        continue;
      }
      break;
    }
  }

  return result;
}

- (void)insertUpdates:(uint64_t)a3 transactionID:(void *)a4 updatedAttributes:
{
  uint64_t v58 = *MEMORY[0x1895F89C0];
  uint64_t v5 = *(dispatch_queue_s **)(a1 + 8);
  if (v5) {
    dispatch_assert_queue_V2(v5);
  }
  if ([a2 count])
  {
    id v46 = objc_alloc_init(MEMORY[0x189603FC8]);
    id v35 = objc_alloc_init(MEMORY[0x1896077E8]);
    uint64_t v40 = objc_msgSend((id)objc_msgSend(a4, "valueForKey:", @"name"), "componentsJoinedByString:", @",");
    uint64_t v6 = [MEMORY[0x189607968] numberWithUnsignedInteger:1];
    id v7 = (void *)objc_msgSend( (id)objc_msgSend( (id)objc_msgSend(*(id *)(a1 + 16), "ancillarySQLModels"),  "objectForKey:",  @"NSPersistentHistoryTrackingKey"),  "entityNamed:",  @"CHANGE");
    __int128 v54 = 0u;
    __int128 v55 = 0u;
    __int128 v52 = 0u;
    __int128 v53 = 0u;
    uint64_t v8 = [a2 countByEnumeratingWithState:&v52 objects:v57 count:16];
    if (!v8) {
      goto LABEL_48;
    }
    uint64_t v37 = v7;
    uint64_t v38 = *(void *)v53;
LABEL_6:
    uint64_t v42 = 0LL;
    uint64_t v39 = v8;
LABEL_7:
    if (*(void *)v53 != v38) {
      objc_enumerationMutation(a2);
    }
    __int128 v9 = *(void **)(*((void *)&v52 + 1) + 8 * v42);
    context = (void *)MEMORY[0x186E3E5D8]();
    uint64_t v44 = (void *)[v9 firstObject];
    __int128 v10 = (void *)[v9 lastObject];
    __int128 v11 = (void *)v40;
    if ([v10 isNSString])
    {
      __int128 v11 = v10;
      if (![v10 length]) {
        __int128 v11 = (void *)v40;
      }
    }

    -[NSSQLiteConnection generatePrimaryKeysForEntity:batch:](a1, (uint64_t)v7, 1u);
    uint64_t v13 = v12;
    if (v12)
    {
      uint64_t v14 = _sqlCoreLookupSQLEntityForEntityDescription(*(void **)(a1 + 16), (void *)[v44 entity]);
      uint64_t v15 = (void *)v14;
      if (v14) {
        uint64_t v16 = *(unsigned int *)(v14 + 184);
      }
      else {
        uint64_t v16 = 0LL;
      }
      -[NSSQLiteConnection prepareInsertStatementForAncillaryEntity:](a1, v7);
      __int128 v50 = 0u;
      __int128 v51 = 0u;
      __int128 v48 = 0u;
      __int128 v49 = 0u;
      uint64_t v17 = (void *)[*(id *)(a1 + 48) bindVariables];
      uint64_t v18 = [v17 countByEnumeratingWithState:&v48 objects:v56 count:16];
      uint64_t v45 = v15;
      if (!v18) {
        goto LABEL_42;
      }
      uint64_t v19 = *(void *)v49;
      while (1)
      {
        uint64_t v20 = 0LL;
        do
        {
          if (*(void *)v49 != v19) {
            objc_enumerationMutation(v17);
          }
          uint64_t v21 = *(void **)(*((void *)&v48 + 1) + 8 * v20);
          if (![v21 index])
          {
            int v22 = [v21 sqlType];
            uint64_t v23 = v13;
            if (v22 == 2)
            {
LABEL_26:
              [v21 setInt64:v23];
              goto LABEL_38;
            }
          }

          if ([v21 index] != 1 && objc_msgSend(v21, "index") != 2)
          {
            if ([v21 index] == 3)
            {
              int v24 = [v21 sqlType];
              uint64_t v23 = a3;
              if (v24 == 2) {
                goto LABEL_26;
              }
            }

            int v25 = objc_msgSend(v21, "index", v23);
            uint64_t v26 = v6;
            if (v25 == 4) {
              goto LABEL_37;
            }
            if (objc_msgSend(v21, "index", v6) != 5 || !v11)
            {
              if ([v21 index] == 6)
              {
                uint64_t v27 = [MEMORY[0x189607968] numberWithUnsignedInt:v16];
              }

              else
              {
                uint64_t v27 = objc_msgSend(MEMORY[0x189607968], "numberWithLongLong:", objc_msgSend(v44, "_referenceData64"));
              }

              uint64_t v26 = v27;
LABEL_37:
              [v21 setValue:v26];
              goto LABEL_38;
            }

            uint64_t v26 = [v46 objectForKey:objc_msgSend(NSString, "stringWithFormat:", @"%u-%@", v16, v11)];
            if (v26) {
              goto LABEL_37;
            }
            uint64_t v28 = [v11 componentsSeparatedByString:@","];
            uint64_t v29 = +[_NSPersistentHistoryChange _propertyDataForEntity:withSetOfPropertyNames:]( (uint64_t)_NSPersistentHistoryChange,  v45,  (void *)[MEMORY[0x189604010] setWithArray:v28]);
            objc_msgSend( v46,  "setObject:forKey:",  v29,  objc_msgSend(MEMORY[0x189607968], "numberWithUnsignedInt:", v16));
            [v21 setValue:v29];
          }

- (void)processUpdateRequest:(void *)a3 withOIDs:(void *)a4 forAttributes:
{
  if (a1)
  {
    uint64_t v8 = *(void *)(a1 + 16);
    __int128 v9 = v8
    if (![v9 count]
      || ((uint64_t v10 = *(void *)(a1 + 16)) == 0
        ? (__int128 v11 = 0LL)
        : (__int128 v11 = (void *)[*(id *)(v10 + 240) objectForKey:@"NSPersistentHistoryTrackingEntitiesToExclude"]),  (objc_msgSend(v11, "containsObject:", objc_msgSend((id)objc_msgSend(a2, "request"), "entityName")) & 1) == 0))
    {
      if (-[NSSQLiteConnection hasAttributeChanges:](a3))
      {
        id v21 = (id)-[NSSQLiteConnection _insertTransactionStringsForRequestContext:](a1, (uint64_t)a2);
        uint64_t v12 = -[NSSQLiteConnection _insertTransactionForRequestContext:andStrings:](a1, (uint64_t)a2, v21);
        -[NSSQLiteConnection insertUpdates:transactionID:updatedAttributes:](a1, a3, v12, a4);
        uint64_t v13 = [MEMORY[0x189607968] numberWithLongLong:v12];
        if (a2) {
          a2[9] = v13;
        }
      }

      else
      {
        uint64_t v14 = [a2 persistentStoreRequest];
        _NSCoreDataLog( 9LL,  (uint64_t)@"Batch Update resulted in updates with no updated properties - %@ - %@",  v15,  v16,  v17,  v18,  v19,  v20,  v14);
      }
    }
  }

- (uint64_t)_hasOldHistoryTrackingTables
{
  if (result)
  {
    uint64_t v1 = result;
    if ((-[NSSQLiteConnection _hasOldHistoryTrackingTablesV0](result) & 1) != 0) {
      return 1LL;
    }
    else {
      return -[NSSQLiteConnection _hasOldHistoryTrackingTablesV1](v1);
    }
  }

  return result;
}

- (uint64_t)_hasOldHistoryTrackingTablesV0
{
  if (result)
  {
    uint64_t v1 = result;
    if ((-[NSSQLiteConnection _hasTableWithName:isTemp:](result, (uint64_t)@"ZCHANGETRACK", 0) & 1) != 0
      || (int v2 = -[NSSQLiteConnection _hasTableWithName:isTemp:](v1, (uint64_t)@"ZCHANGETRACKHISTORY", 0),
          uint64_t result = 0LL,
          v2))
    {
      errmsg = 0LL;
      uint64_t v3 = (void *)objc_opt_new();
      if (sqlite3_exec( *(sqlite3 **)(v1 + 72),  "select sql from sqlite_master where name = 'ZCHANGETRACK'",  (int (__cdecl *)(void *, int, char **, char **))sqlite3Callback,  v3,  &errmsg)
        || [v3 count] != 1)
      {
        _NSCoreDataLog( 1LL,  (uint64_t)@"Unable to determine if old history table 1 Exists - %s",  v4,  v5,  v6,  v7,  v8,  v9,  (uint64_t)errmsg);
      }

      else if (objc_msgSend( (id)objc_msgSend(v3, "firstObject"),  "containsString:",  @"ZCHANGETIMESTAMP FLOAT") {
             && objc_msgSend( (id)objc_msgSend(v3, "firstObject"),  "containsString:",  @"ZBUNDLEID VARCHAR")
      }
             && (objc_msgSend((id)objc_msgSend(v3, "firstObject"), "containsString:", @"ZCONTEXTNAME VARCHAR") & 1) != 0)
      {
        int v10 = objc_msgSend((id)objc_msgSend(v3, "firstObject"), "containsString:", @"ZPROCESSID VARCHAR");

        if (!v10)
        {
          int v17 = 0;
          return v17 != 0;
        }

        uint64_t v3 = (void *)objc_opt_new();
        if (sqlite3_exec( *(sqlite3 **)(v1 + 72),  "select sql from sqlite_master where name = 'ZCHANGETRACKHISTORY'",  (int (__cdecl *)(void *, int, char **, char **))sqlite3Callback,  v3,  &errmsg)
          || [v3 count] != 1)
        {
          _NSCoreDataLog( 1LL,  (uint64_t)@"Unable to determine if old history table 2 Exists - %s",  v11,  v12,  v13,  v14,  v15,  v16,  (uint64_t)errmsg);
        }

        else if (objc_msgSend( (id)objc_msgSend(v3, "firstObject"),  "containsString:",  @" ZCHANGETRACKHISTORYCHANGETYPE INTEGER") {
               && objc_msgSend( (id)objc_msgSend(v3, "firstObject"),  "containsString:",  @"ZCHANGETRACKHISTORYENTITY INTEGER")
        }
               && objc_msgSend( (id)objc_msgSend(v3, "firstObject"),  "containsString:",  @"ZCHANGETRACKHISTORYENTITYVERSION INTEGER")
               && objc_msgSend( (id)objc_msgSend(v3, "firstObject"),  "containsString:",  @"ZCHANGETRACKINGHISTORYTRANSACTIONID INTEGER")
               && objc_msgSend( (id)objc_msgSend(v3, "firstObject"),  "containsString:",  @"ZCHANGETRACKHISTORYTOMBSTONE BLOB"))
        {
          int v17 = objc_msgSend( (id)objc_msgSend(v3, "firstObject"),  "containsString:",  @"ZCHANGETRACKEHISTORYNTITYCOLUMNS BLOB");
LABEL_20:

          return v17 != 0;
        }
      }

      int v17 = 0;
      goto LABEL_20;
    }
  }

  return result;
}

- (uint64_t)_hasOldHistoryTrackingTablesV1
{
  if (result)
  {
    uint64_t v1 = result;
    if ((-[NSSQLiteConnection _hasTableWithName:isTemp:](result, (uint64_t)@"ZCHANGE", 0) & 1) != 0
      || (int v2 = -[NSSQLiteConnection _hasTableWithName:isTemp:](v1, (uint64_t)@"ZTRANSACTION", 0), result = 0LL, v2))
    {
      errmsg = 0LL;
      uint64_t v3 = (void *)objc_opt_new();
      if (sqlite3_exec( *(sqlite3 **)(v1 + 72),  "select sql from sqlite_master where name = 'ZCHANGE'",  (int (__cdecl *)(void *, int, char **, char **))sqlite3Callback,  v3,  &errmsg)
        || [v3 count] != 1)
      {
        _NSCoreDataLog( 1LL,  (uint64_t)@"Unable to determine if old history table 1 Exists - %s",  v4,  v5,  v6,  v7,  v8,  v9,  (uint64_t)errmsg);
      }

      else if (objc_msgSend( (id)objc_msgSend(v3, "firstObject"),  "containsString:",  @"ZENTITY INTEGER, ZENTITYPK INTEGER") {
             && objc_msgSend( (id)objc_msgSend(v3, "firstObject"),  "containsString:",  @"ZCHANGETYPE INTEGER")
      }
             && (objc_msgSend((id)objc_msgSend(v3, "firstObject"), "containsString:", @"ZCOLUMNS BLOB") & 1) != 0)
      {
        int v10 = objc_msgSend((id)objc_msgSend(v3, "firstObject"), "containsString:", @"ZTRANSACTIONID INTEGER");

        if (!v10)
        {
          int v17 = 0;
          return v17 != 0;
        }

        uint64_t v3 = (void *)objc_opt_new();
        if (sqlite3_exec( *(sqlite3 **)(v1 + 72),  "select sql from sqlite_master where name = 'ZTRANSACTION'",  (int (__cdecl *)(void *, int, char **, char **))sqlite3Callback,  v3,  &errmsg)
          || [v3 count] != 1)
        {
          _NSCoreDataLog( 1LL,  (uint64_t)@"Unable to determine if old history table 2 Exists - %s",  v11,  v12,  v13,  v14,  v15,  v16,  (uint64_t)errmsg);
        }

        else if (objc_msgSend( (id)objc_msgSend(v3, "firstObject"),  "containsString:",  @" ZBUNDLEID VARCHAR") {
               && objc_msgSend( (id)objc_msgSend(v3, "firstObject"),  "containsString:",  @"ZCONTEXTNAME VARCHAR")
        }
               && objc_msgSend( (id)objc_msgSend(v3, "firstObject"),  "containsString:",  @"ZPROCESSID VARCHAR"))
        {
          int v17 = objc_msgSend((id)objc_msgSend(v3, "firstObject"), "containsString:", @"ZTIMESTAMP FLOAT");
LABEL_18:

          return v17 != 0;
        }
      }

      int v17 = 0;
      goto LABEL_18;
    }
  }

  return result;
}

- (void)_dropOldHistoryTrackingTables
{
  if (a1)
  {
    if (-[NSSQLiteConnection _hasOldHistoryTrackingTablesV0](a1))
    {
      -[NSSQLiteConnection _executeSQLString:](a1, @"DROP TABLE ZCHANGETRACK");
      -[NSSQLiteConnection _executeSQLString:](a1, @"DROP TABLE ZCHANGETRACKHISTORY");
    }

    if (-[NSSQLiteConnection _hasOldHistoryTrackingTablesV1](a1))
    {
      -[NSSQLiteConnection _executeSQLString:](a1, @"DROP TABLE ZCHANGE");
      -[NSSQLiteConnection _executeSQLString:](a1, @"DROP TABLE ZTRANSACTION");
    }
  }

- (void)hasHistoryTransactionWithNumber:(id *)a1
{
  if (a1)
  {
    uint64_t v4 = objc_msgSend( (id)objc_msgSend( (id)objc_msgSend(a1[2], "ancillarySQLModels"),  "objectForKey:",  @"NSPersistentHistoryTrackingKey"),  "entityNamed:",  @"TRANSACTION");
    uint64_t v5 = (void *)v4;
    if (v4) {
      uint64_t v6 = (void *)[*(id *)(v4 + 40) objectForKey:@"_pk"];
    }
    else {
      uint64_t v6 = 0LL;
    }
    uint64_t v7 = (void *)[objc_alloc(NSString) initWithFormat:@"SELECT COUNT(Z_PK) FROM %@ WHERE %@ = %@", objc_msgSend(v5, "tableName"), objc_msgSend(v6, "columnName"), a2];
    uint64_t v8 = -[NSSQLiteStatement initWithEntity:sqlString:]( objc_alloc(&OBJC_CLASS___NSSQLiteStatement),  "initWithEntity:sqlString:",  v5,  v7);
    -[NSSQLiteConnection prepareSQLStatement:]((uint64_t)a1, v8);
    [a1 execute];
    uint64_t v9 = -[NSSQLiteConnection newFetchedArray]((uint64_t)a1);
    int v10 = v9;
    if (v9)
    {
      uint64_t v11 = [v9 objectAtIndex:0];
      if (v11 == NSKeyValueCoding_NullValue) {
        uint64_t v12 = 0LL;
      }
      else {
        uint64_t v12 = (void *)[v10 objectAtIndex:0];
      }
      [v12 integerValue];
    }

    -[NSSQLiteConnection endFetchAndRecycleStatement:]((uint64_t)a1, 0);
  }

- (BOOL)addTombstoneColumnsForRange:(unint64_t)a3
{
  if (a1)
  {
    uint64_t v6 = (void *)[a1[2] model];
    [a1[2] options];
    id v19 = +[_PFPersistentHistoryModel newPersistentHistorySQLModelForSQLModel:options:]( (uint64_t)&OBJC_CLASS____PFPersistentHistoryModel,  v6);
    uint64_t v7 = [v19 entityNamed:@"CHANGE"];
    BOOL v20 = v7 != 0;
    if (v7) {
      BOOL v8 = a2 >= a3;
    }
    else {
      BOOL v8 = 1;
    }
    if (!v8)
    {
      uint64_t v9 = (void *)v7;
      do
      {
        int v10 = (void *)objc_msgSend( objc_alloc(NSString),  "initWithFormat:",  @"ALTER TABLE %@ ADD Z%@%lu BLOB;",
                        [v9 tableName],
                        @"TOMBSTONE",
                        a2);
        uint64_t v11 = -[NSSQLiteAdapter newStatementWithSQLString:]( (NSSQLiteStatement *)[a1 adapter],  (uint64_t)v10);
        if (+[NSMappingModel migrationDebugLevel](&OBJC_CLASS___NSMappingModel, "migrationDebugLevel") >= 1) {
          _NSCoreDataLog( 4LL,  (uint64_t)@"Executing new tombstone column statement: %@",  v12,  v13,  v14,  v15,  v16,  v17,  (uint64_t)v11);
        }
        -[NSSQLiteConnection prepareAndExecuteSQLStatement:]((uint64_t)a1, v11);

        ++a2;
      }

      while (a3 != a2);
    }
  }

  else
  {
    return 0;
  }

  return v20;
}

- (uint64_t)numberOfTombstones
{
  uint64_t v24 = *MEMORY[0x1895F89C0];
  if (result)
  {
    uint64_t v1 = result;
    int v2 = (void *)[*(id *)(result + 16) model];
    [*(id *)(v1 + 16) options];
    id v3 = +[_PFPersistentHistoryModel newPersistentHistorySQLModelForSQLModel:options:]( (uint64_t)&OBJC_CLASS____PFPersistentHistoryModel,  v2);
    uint64_t v4 = (void *)[v3 entityNamed:@"CHANGE"];
    int v5 = 0;
    if (!-[NSSQLiteConnection _hasTableWithName:isTemp:](v1, [v4 tableName], 0))
    {
LABEL_16:

      return v5;
    }

    errmsg = 0LL;
    uint64_t v6 = (void *)objc_opt_new();
    if (sqlite3_exec( *(sqlite3 **)(v1 + 72),  (const char *)[(id)objc_msgSend( NSString stringWithFormat:@"select sql from sqlite_master where name = '%@'", objc_msgSend(v4, "tableName")), "UTF8String"],  (int (__cdecl *)(void *, int, char **, char **))sqlite3Callback,  v6,  &errmsg)
      || [v6 count] != 1)
    {
      _NSCoreDataLog( 1LL,  (uint64_t)@"Unable to determine if tombstones for change table - %s",  v7,  v8,  v9,  v10,  v11,  v12,  (uint64_t)errmsg);
    }

    else
    {
      __int128 v20 = 0u;
      __int128 v21 = 0u;
      __int128 v18 = 0u;
      __int128 v19 = 0u;
      uint64_t v13 = (void *)objc_msgSend((id)objc_msgSend(v6, "firstObject"), "componentsSeparatedByString:", @" ");
      uint64_t v14 = [v13 countByEnumeratingWithState:&v18 objects:v23 count:16];
      if (v14)
      {
        uint64_t v15 = v14;
        int v5 = 0;
        uint64_t v16 = *(void *)v19;
        do
        {
          for (uint64_t i = 0LL; i != v15; ++i)
          {
            if (*(void *)v19 != v16) {
              objc_enumerationMutation(v13);
            }
            v5 += [*(id *)(*((void *)&v18 + 1) + 8 * i) containsString:@"TOMBSTONE"];
          }

          uint64_t v15 = [v13 countByEnumeratingWithState:&v18 objects:v23 count:16];
        }

        while (v15);
        goto LABEL_15;
      }
    }

    int v5 = 0;
LABEL_15:

    goto LABEL_16;
  }

  return result;
}

- (uint64_t)hasTransactionStringColumnsInTransactionTable
{
  v25[4] = *MEMORY[0x1895F89C0];
  if (result)
  {
    uint64_t v1 = result;
    int v2 = (void *)[*(id *)(result + 16) model];
    [*(id *)(v1 + 16) options];
    id v3 = +[_PFPersistentHistoryModel newPersistentHistorySQLModelForSQLModel:options:]( (uint64_t)&OBJC_CLASS____PFPersistentHistoryModel,  v2);
    uint64_t v4 = (void *)[v3 entityNamed:@"TRANSACTION"];
    int v5 = 0;
    if (!-[NSSQLiteConnection _hasTableWithName:isTemp:](v1, [v4 tableName], 0))
    {
LABEL_16:

      return v5 == 4;
    }

    errmsg = 0LL;
    uint64_t v6 = (void *)objc_opt_new();
    if (sqlite3_exec( *(sqlite3 **)(v1 + 72),  (const char *)[(id)objc_msgSend( NSString stringWithFormat:@"select sql from sqlite_master where name = '%@'", objc_msgSend(v4, "tableName")), "UTF8String"],  (int (__cdecl *)(void *, int, char **, char **))sqlite3Callback,  v6,  &errmsg)
      || [v6 count] != 1)
    {
      _NSCoreDataLog( 1LL,  (uint64_t)@"Unable to determine if tombstones for change table - %s",  v7,  v8,  v9,  v10,  v11,  v12,  (uint64_t)errmsg);
    }

    else
    {
      v25[0] = @"AUTHORTS";
      v25[1] = @"BUNDLEIDTS";
      v25[2] = @"CONTEXTNAMETS";
      v25[3] = @"PROCESSIDTS";
      uint64_t v13 = (void *)[MEMORY[0x189603F18] arrayWithObjects:v25 count:4];
      __int128 v19 = 0u;
      __int128 v20 = 0u;
      __int128 v21 = 0u;
      __int128 v22 = 0u;
      uint64_t v14 = (void *)objc_msgSend((id)objc_msgSend(v6, "firstObject"), "componentsSeparatedByString:", @" ");
      uint64_t v15 = [v14 countByEnumeratingWithState:&v19 objects:v24 count:16];
      if (v15)
      {
        uint64_t v16 = v15;
        int v5 = 0;
        uint64_t v17 = *(void *)v20;
        do
        {
          for (uint64_t i = 0LL; i != v16; ++i)
          {
            if (*(void *)v20 != v17) {
              objc_enumerationMutation(v14);
            }
            v5 += objc_msgSend( v13,  "containsObject:",  objc_msgSend( *(id *)(*((void *)&v19 + 1) + 8 * i),  "stringByReplacingCharactersInRange:withString:",  0,  1,  &stru_189EAC2E8));
          }

          uint64_t v16 = [v14 countByEnumeratingWithState:&v19 objects:v24 count:16];
        }

        while (v16);
        goto LABEL_15;
      }
    }

    int v5 = 0;
LABEL_15:

    goto LABEL_16;
  }

  return result;
}

- (BOOL)addTransactionStringColumnsToTransactionTable
{
  v20[4] = *MEMORY[0x1895F89C0];
  if (a1)
  {
    int v2 = (void *)[a1[2] model];
    [a1[2] options];
    id v13 = +[_PFPersistentHistoryModel newPersistentHistorySQLModelForSQLModel:options:]( (uint64_t)&OBJC_CLASS____PFPersistentHistoryModel,  v2);
    uint64_t v3 = [v13 entityNamed:@"TRANSACTION"];
    BOOL v14 = v3 != 0;
    if (v3)
    {
      uint64_t v4 = (void *)v3;
      v20[0] = @"AUTHORTS";
      v20[1] = @"BUNDLEIDTS";
      v20[2] = @"CONTEXTNAMETS";
      v20[3] = @"PROCESSIDTS";
      int v5 = (void *)[MEMORY[0x189603F18] arrayWithObjects:v20 count:4];
      __int128 v15 = 0u;
      __int128 v16 = 0u;
      __int128 v17 = 0u;
      __int128 v18 = 0u;
      uint64_t v6 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
      if (v6)
      {
        uint64_t v7 = v6;
        uint64_t v8 = *(void *)v16;
        do
        {
          uint64_t v9 = 0LL;
          do
          {
            if (*(void *)v16 != v8) {
              objc_enumerationMutation(v5);
            }
            uint64_t v10 = (void *)objc_msgSend( objc_alloc(NSString),  "initWithFormat:",  @"ALTER TABLE %@ ADD Z%@ INTEGER;",
                            [v4 tableName],
                            *(void *)(*((void *)&v15 + 1) + 8 * v9));
            uint64_t v11 = -[NSSQLiteAdapter newStatementWithSQLString:]( (NSSQLiteStatement *)[a1 adapter],  (uint64_t)v10);
            -[NSSQLiteConnection prepareAndExecuteSQLStatement:]((uint64_t)a1, v11);

            ++v9;
          }

          while (v7 != v9);
          uint64_t v7 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
        }

        while (v7);
      }
    }
  }

  else
  {
    return 0;
  }

  return v14;
}

- (void)dropHistoryTrackingTables
{
  uint64_t v17 = *MEMORY[0x1895F89C0];
  if (a1)
  {
    int v2 = (void *)MEMORY[0x186E3E5D8]();
    uint64_t v3 = objc_msgSend( (id)objc_msgSend(a1[2], "ancillarySQLModels"),  "objectForKey:",  @"NSPersistentHistoryTrackingKey");
    __int128 v12 = 0u;
    __int128 v13 = 0u;
    __int128 v14 = 0u;
    __int128 v15 = 0u;
    if (v3) {
      uint64_t v4 = *(void **)(v3 + 32);
    }
    else {
      uint64_t v4 = 0LL;
    }
    uint64_t v5 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v7 = *(void *)v13;
      do
      {
        uint64_t v8 = 0LL;
        do
        {
          if (*(void *)v13 != v7) {
            objc_enumerationMutation(v4);
          }
          uint64_t v9 = *(void **)(*((void *)&v12 + 1) + 8 * v8);
          uint64_t v10 = (void *)MEMORY[0x186E3E5D8](v5);
          uint64_t v11 = -[NSSQLiteAdapter newDropTableStatementForTableNamed:]( (NSSQLiteStatement *)objc_msgSend(a1, "adapter", (void)v12),  objc_msgSend(v9, "tableName"));
          -[NSSQLiteConnection prepareAndExecuteSQLStatement:]((uint64_t)a1, v11);

          objc_autoreleasePoolPop(v10);
          ++v8;
        }

        while (v6 != v8);
        uint64_t v5 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
        uint64_t v6 = v5;
      }

      while (v5);
    }

    objc_autoreleasePoolPop(v2);
  }

- (void)hasAncillaryEntitiesInHistory
{
  if (a1)
  {
    uint64_t v2 = objc_msgSend( (id)objc_msgSend( (id)objc_msgSend(a1[2], "ancillarySQLModels"),  "objectForKey:",  @"NSPersistentHistoryTrackingKey"),  "entityNamed:",  @"CHANGE");
    uint64_t v3 = (id *)v2;
    if (v2)
    {
      uint64_t v4 = (void *)[*(id *)(v2 + 40) objectForKey:@"ENTITY"];
      uint64_t v5 = (void *)[v3[5] objectForKey:@"TRANSACTIONID"];
    }

    else
    {
      uint64_t v4 = 0LL;
      uint64_t v5 = 0LL;
    }

    uint64_t v6 = (void *)[objc_alloc(NSString) initWithFormat:@"SELECT MAX(%@) FROM %@ WHERE %@ >= 16000", objc_msgSend(v5, "columnName"), objc_msgSend(v3, "tableName"), objc_msgSend(v4, "columnName")];
    uint64_t v7 = -[NSSQLiteStatement initWithEntity:sqlString:]( objc_alloc(&OBJC_CLASS___NSSQLiteStatement),  "initWithEntity:sqlString:",  v3,  v6);
    -[NSSQLiteConnection prepareSQLStatement:]((uint64_t)a1, v7);
    [a1 execute];
    uint64_t v8 = -[NSSQLiteConnection newFetchedArray]((uint64_t)a1);
    uint64_t v9 = v8;
    if (v8)
    {
      if ([v8 count])
      {
        uint64_t v10 = [v9 objectAtIndex:0];
        if (v10 == NSKeyValueCoding_NullValue) {
          uint64_t v11 = 0LL;
        }
        else {
          uint64_t v11 = (void *)[v9 objectAtIndex:0];
        }
        id v12 = v11;
      }

      else
      {
        id v12 = 0LL;
      }
    }

    else
    {
      id v12 = 0LL;
    }

    -[NSSQLiteConnection endFetchAndRecycleStatement:]((uint64_t)a1, 0);

    id v13 = v12;
  }

- (void)dropHistoryBeforeTransactionID:(id *)a1
{
  if (a1)
  {
    uint64_t v4 = (void *)objc_msgSend( (id)objc_msgSend( (id)objc_msgSend(a1[2], "ancillarySQLModels"),  "objectForKey:",  @"NSPersistentHistoryTrackingKey"),  "entityNamed:",  @"TRANSACTION");
    uint64_t v5 = objc_msgSend( (id)objc_msgSend( (id)objc_msgSend(a1[2], "ancillarySQLModels"),  "objectForKey:",  @"NSPersistentHistoryTrackingKey"),  "entityNamed:",  @"CHANGE");
    uint64_t v6 = (void *)v5;
    if (v5) {
      uint64_t v7 = (void *)[*(id *)(v5 + 40) objectForKey:@"TRANSACTIONID"];
    }
    else {
      uint64_t v7 = 0LL;
    }
    uint64_t v8 = (void *)[objc_alloc(NSString) initWithFormat:@"DELETE FROM %@ WHERE Z_PK <= %@", objc_msgSend(v4, "tableName"), a2];
    uint64_t v9 = -[NSSQLiteAdapter newStatementWithSQLString:]((NSSQLiteStatement *)[a1 adapter], (uint64_t)v8);
    id v11 = (id)[objc_alloc(NSString) initWithFormat:@"DELETE FROM %@ WHERE %@ <= %@", objc_msgSend(v6, "tableName"), objc_msgSend(v7, "columnName"), a2];
    uint64_t v10 = -[NSSQLiteAdapter newStatementWithSQLString:]((NSSQLiteStatement *)[a1 adapter], (uint64_t)v11);
    -[NSSQLiteConnection prepareAndExecuteSQLStatement:]((uint64_t)a1, v9);
    -[NSSQLiteConnection prepareAndExecuteSQLStatement:]((uint64_t)a1, v10);
  }

- (void)processDeleteRequest:(sqlite3_int64)a1
{
  uint64_t v81 = *MEMORY[0x1895F89C0];
  if (a1)
  {
    sqlite3_int64 v2 = a1;
    uint64_t v3 = objc_msgSend( (id)objc_msgSend( (id)objc_msgSend(*(id *)(a1 + 16), "ancillarySQLModels"),  "objectForKey:",  @"NSPersistentHistoryTrackingKey"),  "entityNamed:",  @"CHANGE");
    uint64_t v4 = -[NSSQLEntity tempTableName](v3);
    if (-[NSSQLiteConnection _hasTableWithName:isTemp:](v2, v4, 1))
    {
      uint64_t v5 = -[NSSQLEntity tempTableName](v3);
      if (-[NSSQLiteConnection _tableHasRows:](v2, v5))
      {
        id v54 = (id)-[NSSQLiteConnection _insertTransactionStringsForRequestContext:](v2, a2);
        uint64_t v56 = -[NSSQLiteConnection _insertTransactionForRequestContext:andStrings:](v2, a2, v54);
        uint64_t v6 = *(dispatch_queue_s **)(v2 + 8);
        if (v6) {
          dispatch_assert_queue_V2(v6);
        }
        id v55 = objc_alloc_init(MEMORY[0x1896077E8]);
        uint64_t v7 = objc_msgSend( (id)objc_msgSend( (id)objc_msgSend(*(id *)(v2 + 16), "ancillarySQLModels"),  "objectForKey:",  @"NSPersistentHistoryTrackingKey"),  "entityNamed:",  @"CHANGE");
        uint64_t v8 = -[NSSQLEntity tempTableName](v7);
        if (-[NSSQLiteConnection _tableHasRows:](v2, v8))
        {
          if (v7) {
            uint64_t v9 = [*(id *)(v7 + 40) objectForKey:@"ENTITY"];
          }
          else {
            uint64_t v9 = 0LL;
          }
          uint64_t v10 = *(void *)(v2 + 16);
          if (v10) {
            id v11 = (void *)[*(id *)(v10 + 240) objectForKey:@"NSPersistentHistoryTrackingEntitiesToExclude"];
          }
          else {
            id v11 = 0LL;
          }
          id v12 = (objc_class *)&OBJC_CLASS___NSSQLCoreDispatchManager;
          sqlite3_int64 v60 = v2;
          if ([v11 count])
          {
            id v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x189607940]), "initWithString:", @"(");
            __int128 v52 = (void *)v9;
            uint64_t v53 = v7;
            __int128 v75 = 0u;
            __int128 v76 = 0u;
            __int128 v73 = 0u;
            __int128 v74 = 0u;
            uint64_t v14 = *(void *)(v2 + 16);
            if (v14)
            {
              obuint64_t j = (id)[*(id *)(v14 + 240) objectForKey:@"NSPersistentHistoryTrackingEntitiesToExclude"];
              uint64_t v15 = [obj countByEnumeratingWithState:&v73 objects:v80 count:16];
            }

            else
            {
              obuint64_t j = 0LL;
              uint64_t v15 = [0 countByEnumeratingWithState:&v73 objects:v80 count:16];
            }

            uint64_t v16 = v15;
            if (v15)
            {
              int v17 = 0;
              uint64_t v18 = *(void *)v74;
              do
              {
                uint64_t v19 = 0LL;
                do
                {
                  if (*(void *)v74 != v18) {
                    objc_enumerationMutation(obj);
                  }
                  uint64_t v20 = *(void *)(*((void *)&v73 + 1) + 8 * v19);
                  uint64_t v21 = objc_msgSend((id)objc_msgSend(*(id *)(v2 + 16), "model"), "entityNamed:", v20);
                  if (!v21)
                  {
                    __int128 v71 = 0u;
                    __int128 v72 = 0u;
                    __int128 v69 = 0u;
                    __int128 v70 = 0u;
                    sqlite3_int64 v2 = v60;
                    uint64_t v23 = (void *)objc_msgSend((id)objc_msgSend(*(id *)(v60 + 16), "ancillarySQLModels"), "allValues");
                    uint64_t v24 = [v23 countByEnumeratingWithState:&v69 objects:v79 count:16];
                    if (!v24) {
                      goto LABEL_24;
                    }
                    uint64_t v25 = *(void *)v70;
LABEL_28:
                    uint64_t v26 = 0LL;
                    while (1)
                    {
                      if (*(void *)v70 != v25) {
                        objc_enumerationMutation(v23);
                      }
                      uint64_t v21 = [*(id *)(*((void *)&v69 + 1) + 8 * v26) entityNamed:v20];
                      if (v21) {
                        break;
                      }
                      if (v24 == ++v26)
                      {
                        uint64_t v24 = [v23 countByEnumeratingWithState:&v69 objects:v79 count:16];
                        if (v24) {
                          goto LABEL_28;
                        }
                        goto LABEL_23;
                      }
                    }
                  }

                  uint64_t v22 = *(unsigned int *)(v21 + 184);
                  if (v17) {
                    [v13 appendFormat:@","];
                  }
                  objc_msgSend(v13, "appendFormat:", @"%lld", v22);
                  ++v17;
LABEL_23:
                  sqlite3_int64 v2 = v60;
LABEL_24:
                  ++v19;
                }

                while (v19 != v16);
                uint64_t v27 = [obj countByEnumeratingWithState:&v73 objects:v80 count:16];
                uint64_t v16 = v27;
              }

              while (v27);
            }

            [v13 appendFormat:@""]);
            uint64_t v7 = v53;
            id v12 = (objc_class *)&OBJC_CLASS___NSSQLCoreDispatchManager;
            uint64_t v28 = (void *)[objc_alloc(MEMORY[0x189607940]) initWithFormat:@"DELETE FROM %@ WHERE %@ IN %@", -[NSSQLEntity tempTableName](v53), objc_msgSend(v52, "columnName"), v13];
            uint64_t v29 = -[NSSQLiteStatement initWithEntity:sqlString:]( objc_alloc(&OBJC_CLASS___NSSQLiteStatement),  "initWithEntity:sqlString:",  0LL,  v28);
            -[NSSQLiteConnection prepareAndExecuteSQLStatement:](v2, v29);
          }

          uint64_t v30 = (void *)[objc_alloc(MEMORY[0x189607940]) initWithFormat:@"UPDATE %@ SET Z%@ = %lld", -[NSSQLEntity tempTableName](v7), @"TRANSACTIONID", v56];
          uint64_t v31 = (void *)[objc_alloc(v12 + 80) initWithEntity:0 sqlString:v30];
          -[NSSQLiteConnection prepareAndExecuteSQLStatement:](v2, v31);

          uint64_t v32 = -[NSSQLEntity tempTableName](v7);
          id v33 = (void *)[objc_alloc(MEMORY[0x189607940]) initWithString:@"SELECT count(*) FROM "];
          [v33 appendString:v32];
          id v34 = -[NSSQLiteConnection copyRawIntegerRowsForSQL:](v2, v33);
          id v35 = v34;
          if (v34)
          {
            if (CFArrayGetCount(v34) >= 1 && *(void *)CFArrayGetValueAtIndex(v35, 0LL)) {
              uint64_t v36 = *(void *)CFArrayGetValueAtIndex(v35, 1LL);
            }
            else {
              LODWORD(v36) = -1;
            }
            unsigned int obja = v36;
            CFRelease(v35);
          }

          else
          {
            unsigned int obja = -1;
          }

          id v37 = objc_alloc(MEMORY[0x189607940]);
          if (v7) {
            uint64_t v38 = *(void **)(v7 + 136);
          }
          else {
            uint64_t v38 = 0LL;
          }
          uint64_t v39 = (void *)[v37 initWithFormat:@"%@", objc_msgSend(v38, "columnName")];
          __int128 v67 = 0u;
          __int128 v68 = 0u;
          __int128 v65 = 0u;
          __int128 v66 = 0u;
          uint64_t v40 = (void *)[(id)v7 attributeColumns];
          uint64_t v41 = [v40 countByEnumeratingWithState:&v65 objects:v78 count:16];
          if (v41)
          {
            uint64_t v42 = *(void *)v66;
            do
            {
              for (uint64_t i = 0LL; i != v41; ++i)
              {
                if (*(void *)v66 != v42) {
                  objc_enumerationMutation(v40);
                }
                [v39 appendFormat:@",%@", objc_msgSend(*(id *)(*((void *)&v65 + 1) + 8 * i), "columnName")];
              }

              uint64_t v41 = [v40 countByEnumeratingWithState:&v65 objects:v78 count:16];
            }

            while (v41);
          }

          __int128 v63 = 0u;
          __int128 v64 = 0u;
          __int128 v61 = 0u;
          __int128 v62 = 0u;
          uint64_t v44 = (void *)[(id)v7 foreignKeyColumns];
          uint64_t v45 = [v44 countByEnumeratingWithState:&v61 objects:v77 count:16];
          if (v45)
          {
            uint64_t v46 = *(void *)v62;
            do
            {
              for (uint64_t j = 0LL; j != v45; ++j)
              {
                if (*(void *)v62 != v46) {
                  objc_enumerationMutation(v44);
                }
                [v39 appendFormat:@",%@", objc_msgSend(*(id *)(*((void *)&v61 + 1) + 8 * j), "columnName")];
              }

              uint64_t v45 = [v44 countByEnumeratingWithState:&v61 objects:v77 count:16];
            }

            while (v45);
          }

          __int128 v48 = (void *)[objc_alloc(MEMORY[0x189607940]) initWithFormat:@"INSERT INTO %@ (%@) SELECT %@ FROM %@", objc_msgSend((id)v7, "tableName"), v39, v39, -[NSSQLEntity tempTableName](v7)];
          __int128 v49 = (void *)[objc_alloc(v12 + 80) initWithEntity:0 sqlString:v48];
          -[NSSQLiteConnection prepareAndExecuteSQLStatement:](v2, v49);

          -[NSSQLiteConnection generatePrimaryKeysForEntity:batch:](v2, v7, obja);
        }

        [v55 drain];
        id v50 = 0LL;
        uint64_t v51 = [MEMORY[0x189607968] numberWithLongLong:v56];
        if (a2) {
          *(void *)(a2 + 72) = v51;
        }
      }
    }
  }

- (void)processMigrationRequestForHash:(uint64_t)a3 stageLabel:
{
  if (a1)
  {
    uint64_t v6 = (void *)MEMORY[0x186E3E5D8]();
    uint64_t v7 = (void *)NSString;
    if (a3) {
      uint64_t v8 = (const __CFString *)[NSString stringWithFormat:@" (stage: %@)", a3];
    }
    else {
      uint64_t v8 = &stru_189EAC2E8;
    }
    uint64_t v9 = [v7 stringWithFormat:@"com.apple.coredata.schemamigrator: lightweight migration from model with digest { %@ }%@", a2, v8];
    uint64_t v10 = objc_msgSend((id)objc_msgSend(MEMORY[0x1896077F8], "mainBundle"), "bundleIdentifier");
    uint64_t v11 = objc_msgSend((id)objc_msgSend(MEMORY[0x1896079D8], "processInfo"), "processName");
    uint64_t v12 = v11;
    if (v11) {
      BOOL v13 = v10 == 0;
    }
    else {
      BOOL v13 = 0;
    }
    if (v13) {
      uint64_t v14 = v11;
    }
    else {
      uint64_t v14 = v10;
    }
    uint64_t v15 = (void *)[objc_alloc(MEMORY[0x189603FC8]) initWithCapacity:3];
    uint64_t v16 = v15;
    if (v14) {
      [v15 setValue:v14 forKey:@"BUNDLEIDTS"];
    }
    if (v12) {
      [v16 setValue:v12 forKey:@"PROCESSIDTS"];
    }
    if (v9) {
      [v16 setValue:v9 forKey:@"AUTHORTS"];
    }
    int v17 = (void *)-[NSSQLiteConnection _transactionsStringAndPKsForStrings:](a1, v16);

    -[NSSQLiteConnection _insertTransactionForRequestContext:andStrings:](a1, 0LL, v17);
    objc_autoreleasePoolPop(v6);
  }

- (void)processExternalDataReferenceFilesDeletedByRequest:(uint64_t)a1
{
  v28[1] = *MEMORY[0x1895F89C0];
  if (a1)
  {
    if (a2)
    {
      if ((-[NSSQLiteConnection _hasTableWithName:isTemp:](a1, a2[11], 1) & 1) == 0
        || !-[NSSQLiteConnection _tableHasRows:](a1, a2[11]))
      {
        return;
      }

      uint64_t v4 = (void *)a2[16];
    }

    else
    {
      if ((-[NSSQLiteConnection _hasTableWithName:isTemp:](a1, 0LL, 1) & 1) == 0) {
        return;
      }
      BOOL v9 = -[NSSQLiteConnection _tableHasRows:](a1, 0LL);
      uint64_t v4 = 0LL;
      if (!v9) {
        return;
      }
    }

    -[NSSQLiteConnection prepareSQLStatement:]( a1,  (void *)objc_msgSend((id)objc_msgSend(v4, "objectAtIndexedSubscript:", 2), "objectAtIndexedSubscript:", 0));
    [(id)a1 execute];
    uint64_t v5 = -[NSSQLColumn initWithColumnName:sqlType:]( objc_alloc(&OBJC_CLASS___NSSQLColumn),  "initWithColumnName:sqlType:",  @"externalRef",  16LL);
    v28[0] = v5;
    -[NSSQLiteConnection setColumnsToFetch:]( (void *)a1,  (void *)[MEMORY[0x189603F18] arrayWithObjects:v28 count:1]);

    id v6 = objc_alloc_init(MEMORY[0x189603FA8]);
    while (1)
    {
      uint64_t v7 = -[NSSQLiteConnection newFetchedArray](a1);
      uint64_t v8 = v7;
      if (!v7) {
        break;
      }
      objc_msgSend(v6, "addObject:", objc_msgSend(v7, "objectAtIndexedSubscript:", 0));
    }

    -[NSSQLiteConnection setColumnsToFetch:]((void *)a1, 0LL);
    *(_DWORD *)(a1 + 312) &= ~2u;
    *(void *)(a1 + 100) = 0LL;
    *(void *)(a1 + 92) = 0LL;
    *(_DWORD *)(a1 + 108) = 0;
    -[NSSQLiteConnection releaseSQLStatement](a1);
    if (v6)
    {
      if ([v6 count])
      {
        id v10 = objc_alloc_init(MEMORY[0x189603FA8]);
        id v11 = objc_alloc_init(MEMORY[0x189603FA8]);
        __int128 v25 = 0u;
        __int128 v26 = 0u;
        __int128 v23 = 0u;
        __int128 v24 = 0u;
        uint64_t v12 = [v6 countByEnumeratingWithState:&v23 objects:v27 count:16];
        if (v12)
        {
          uint64_t v13 = *(void *)v24;
          do
          {
            for (uint64_t i = 0LL; i != v12; ++i)
            {
              if (*(void *)v24 != v13) {
                objc_enumerationMutation(v6);
              }
              uint64_t v15 = *(void **)(*((void *)&v23 + 1) + 8 * i);
              objc_opt_self();
              char isKindOfClass = objc_opt_isKindOfClass();
              int v17 = v11;
              if ((isKindOfClass & 1) != 0)
              {
                uint64_t v18 = [v15 UUID];
                int v17 = v10;
                if (!v18) {
                  continue;
                }
              }

              [v17 addObject:v15];
            }

            uint64_t v12 = [v6 countByEnumeratingWithState:&v23 objects:v27 count:16];
          }

          while (v12);
        }

        uint64_t v19 = [v10 count];
        if (a2 && v19) {
          objc_setProperty_nonatomic(a2, v20, v10, 136LL);
        }
        uint64_t v21 = [v11 count];
        if (a2)
        {
          if (v21) {
            objc_setProperty_nonatomic(a2, v22, v11, 144LL);
          }
        }
      }
    }
  }

- (uint64_t)_transactionsStringAndPKsForStrings:(sqlite3_int64)a1
{
  uint64_t v53 = *MEMORY[0x1895F89C0];
  if (![a2 count]) {
    return 0LL;
  }
  uint64_t v38 = (void *)objc_msgSend(objc_alloc(MEMORY[0x189603FC8]), "initWithCapacity:", objc_msgSend(a2, "count"));
  __int128 v43 = 0u;
  __int128 v44 = 0u;
  __int128 v45 = 0u;
  __int128 v46 = 0u;
  uint64_t v40 = a2;
  obuint64_t j = (id)[a2 allKeys];
  uint64_t v41 = [obj countByEnumeratingWithState:&v43 objects:v51 count:16];
  if (v41)
  {
    uint64_t v39 = *(void *)v44;
    uint64_t v35 = *MEMORY[0x189603A58];
    do
    {
      uint64_t v4 = 0LL;
      do
      {
        if (*(void *)v44 != v39) {
          objc_enumerationMutation(obj);
        }
        uint64_t v42 = *(void *)(*((void *)&v43 + 1) + 8 * v4);
        uint64_t v5 = objc_msgSend(v40, "objectForKey:");
        uint64_t v6 = [*(id *)(a1 + 336) objectForKey:v5];
        if (v6)
        {
          [v38 setValue:v6 forKey:v42];
        }

        else
        {
          id v37 = objc_alloc_init(MEMORY[0x1896077E8]);
          uint64_t v7 = (void *)objc_msgSend( (id)objc_msgSend( (id)objc_msgSend(*(id *)(a1 + 16), "ancillarySQLModels"),  "objectForKey:",  @"NSPersistentHistoryTrackingKey"),  "entityNamed:",  @"TRANSACTIONSTRING");
          -[NSSQLiteConnection generatePrimaryKeysForEntity:batch:](a1, (uint64_t)v7, 1u);
          uint64_t v9 = v8;
          if (!v8)
          {
            id v31 = +[_NSCoreDataException exceptionWithName:code:reason:userInfo:]( (uint64_t)&OBJC_CLASS____NSCoreDataException,  v35,  134030LL,  (uint64_t)@"unable to generate primary keys for transaction",  0LL);
            objc_exception_throw(v31);
            __break(1u);
          }

          -[NSSQLiteConnection prepareInsertStatementForAncillaryEntity:](a1, v7);
          __int128 v49 = 0u;
          __int128 v50 = 0u;
          __int128 v47 = 0u;
          __int128 v48 = 0u;
          id v10 = (void *)[*(id *)(a1 + 48) bindVariables];
          uint64_t v11 = [v10 countByEnumeratingWithState:&v47 objects:v52 count:16];
          if (v11)
          {
            uint64_t v12 = *(void *)v48;
            do
            {
              for (uint64_t i = 0LL; i != v11; ++i)
              {
                if (*(void *)v48 != v12) {
                  objc_enumerationMutation(v10);
                }
                uint64_t v14 = *(void **)(*((void *)&v47 + 1) + 8 * i);
                int v15 = [v14 index];
                if (v15)
                {
                  if (v15 == 3) {
                    [v14 setValue:v5];
                  }
                }

                else
                {
                  [v14 setInt64:v9];
                }
              }

              uint64_t v11 = [v10 countByEnumeratingWithState:&v47 objects:v52 count:16];
            }

            while (v11);
          }

          [(id)a1 execute];
          uint64_t v16 = *(sqlite3 **)(a1 + 72);
          if (v16 && sqlite3_changes(v16) >= 1) {
            int v17 = (void *)objc_msgSend( (id)objc_msgSend( MEMORY[0x189607968],  "numberWithLongLong:",  sqlite3_last_insert_rowid(*(sqlite3 **)(a1 + 72))),  "copy");
          }
          else {
            int v17 = 0LL;
          }
          if (!*(void *)(a1 + 80))
          {
            uint64_t v18 = -[NSSQLiteConnection statementCacheForEntity:](a1, v7);
            -[NSSQLiteStatementCache cacheInsertStatement:](v18, 0LL);
          }

          -[NSSQLiteConnection _clearBindVariablesForInsertedRow](a1);
          -[NSSQLiteConnection resetSQLStatement](a1);
          [v37 drain];
          id v19 = 0LL;
          if (v17) {
            goto LABEL_40;
          }
          uint64_t v20 = objc_msgSend( (id)objc_msgSend( (id)objc_msgSend(*(id *)(a1 + 16), "ancillarySQLModels"),  "objectForKey:",  @"NSPersistentHistoryTrackingKey"),  "entityNamed:",  @"TRANSACTIONSTRING");
          uint64_t v21 = (void *)v20;
          uint64_t v22 = v20 ? (void *)[*(id *)(v20 + 40) objectForKey:@"NAME"] : 0;
          __int128 v23 = (void *)[objc_alloc(NSString) initWithFormat:@"SELECT Z_PK FROM %@ WHERE %@ = ?", objc_msgSend(v21, "tableName"), objc_msgSend(v22, "columnName")];
          __int128 v24 = -[NSSQLiteStatement initWithEntity:sqlString:]( objc_alloc(&OBJC_CLASS___NSSQLiteStatement),  "initWithEntity:sqlString:",  v21,  v23);
          __int128 v25 = -[NSSQLBindVariable initWithValue:sqlType:propertyDescription:]( [NSSQLBindVariable alloc],  "initWithValue:sqlType:propertyDescription:",  v5,  5,  [v22 attributeDescription]);
          -[NSSQLiteStatement addBindVariable:]((uint64_t)v24, v25);

          -[NSSQLiteConnection prepareSQLStatement:](a1, v24);
          [(id)a1 execute];
          __int128 v26 = -[NSSQLiteConnection newFetchedArray](a1);
          uint64_t v27 = v26;
          if (v26)
          {
            if ([v26 count])
            {
              uint64_t v28 = [v27 objectAtIndex:0];
              uint64_t v29 = v28 == NSKeyValueCoding_NullValue ? 0 : (void *)[v27 objectAtIndex:0];
              id v30 = v29;
            }

            else
            {
              id v30 = 0LL;
            }
          }

          else
          {
            id v30 = 0LL;
          }

          -[NSSQLiteConnection endFetchAndRecycleStatement:](a1, 0);

          int v17 = (void *)[v30 copy];
          if (v17)
          {
LABEL_40:
            [*(id *)(a1 + 336) setValue:v17 forKey:v5];
            [v38 setValue:v17 forKey:v42];
          }
        }

        ++v4;
      }

      while (v4 != v41);
      uint64_t v32 = [obj countByEnumeratingWithState:&v43 objects:v51 count:16];
      uint64_t v41 = v32;
    }

    while (v32);
  }

  uint64_t v33 = [objc_alloc(MEMORY[0x189603F68]) initWithDictionary:v38];

  return v33;
}

- (void)prepareInsertStatementForEntity:(uint64_t)a1 includeConstraints:(void *)a2 includeOnConflict:(int)a3 onConflictKeys:(void *)a4
{
  uint64_t v8 = -[NSSQLiteConnection statementCacheForEntity:](a1, a2);
  uint64_t v9 = v8;
  if (v8)
  {
    batchInsertStatementCache = v8->_batchInsertStatementCache;
    if (batchInsertStatementCache)
    {
      cachedSQLiteStatement = batchInsertStatementCache->_cachedSQLiteStatement;
      if (cachedSQLiteStatement)
      {
        uint64_t v27 = v9->_batchInsertStatementCache;
        if (+[NSSQLCore debugDefault](&OBJC_CLASS___NSSQLCore, "debugDefault") >= 1)
        {
          int v12 = *(unsigned __int8 *)(a1 + 42);
          uint64_t v13 = -[NSSQLiteStatement sqlString](v27, "sqlString");
          if (v12) {
            uint64_t v20 = @"\x1B[32msql: \x1B[34m\x1B[47m%@\x1B[0m";
          }
          else {
            uint64_t v20 = @"%@";
          }
          _NSCoreDataLog(6LL, (uint64_t)v20, v14, v15, v16, v17, v18, v19, v13);
        }

        *(void *)(a1 + 48) = v27;
        *(void *)(a1 + 80) = cachedSQLiteStatement;
        uint64_t v21 = v27;
        return;
      }
    }
  }

  uint64_t v22 = (void *)objc_msgSend( (id)objc_msgSend( (id)objc_msgSend( (id)objc_msgSend((id)objc_msgSend((id)a1, "adapter"), "sqlCore"),  "objectIDFactoryForSQLEntity:",  a2),  "alloc"),  "initWithPK64:",  1);
  id v28 = (id)objc_msgSend( +[NSSQLRow allocForSQLEntity:]((uint64_t)NSSQLRow, a2),  "initWithSQLEntity:objectID:",  a2,  v22);
  __int128 v23 = -[NSSQLiteAdapter newStatementWithEntity:]((NSSQLiteStatement *)[(id)a1 adapter], (uint64_t)a2);
  __int128 v24 = -[NSSQLiteAdapter newGeneratorWithStatement:]((void *)[(id)a1 adapter], (uint64_t)v23);
  -[_NSSQLGenerator prepareInsertStatementWithRow:includeConstraints:includeOnConflict:onConflictKeys:]( (uint64_t)v24,  (uint64_t)v28,  1,  a3,  a4);
  if (v24)
  {
    __int128 v25 = (NSString *)v24[3];
    if (v23) {
      goto LABEL_12;
    }
  }

  else
  {
    __int128 v25 = 0LL;
    if (v23)
    {
LABEL_12:
      sqlString = v23->_sqlString;
      if (sqlString != v25)
      {

        v23->_sqlString = (NSString *)-[NSString copy](v25, "copy");
      }
    }
  }

  -[NSSQLiteConnection prepareSQLStatement:](a1, v23);
  -[NSSQLiteStatement setCachedSQLiteStatement:forConnection:]( *(sqlite3_stmt **)(a1 + 48),  *(sqlite3_stmt **)(a1 + 80),  a1);
  if ((a3 & 1) == 0) {
    -[NSSQLiteStatementCache cacheBatchInsertStatement:](v9, *(void **)(a1 + 48));
  }
  -[NSSQLiteConnection addVMCachedStatement:](a1, *(const void **)(a1 + 48));
}

- (uint64_t)insertArray:(uint64_t)a3 forEntity:(char)a4 includeOnConflict:
{
  if (!a1) {
    return 0LL;
  }
  uint64_t v8 = *(dispatch_queue_s **)(a1 + 8);
  if (v8) {
    dispatch_assert_queue_V2(v8);
  }
  uint64_t v13 = 0LL;
  uint64_t v14 = &v13;
  uint64_t v15 = 0x2020000000LL;
  uint64_t v16 = 0LL;
  v11[0] = MEMORY[0x1895F87A8];
  v11[1] = 3221225472LL;
  v11[2] = __62__NSSQLiteConnection_insertArray_forEntity_includeOnConflict___block_invoke;
  v11[3] = &unk_189EAA3D0;
  v11[5] = a3;
  v11[6] = &v13;
  v11[4] = a1;
  char v12 = a4;
  [a2 enumerateObjectsUsingBlock:v11];
  uint64_t v9 = v14[3];
  _Block_object_dispose(&v13, 8);
  return v9;
}

void __62__NSSQLiteConnection_insertArray_forEntity_includeOnConflict___block_invoke(uint64_t a1, uint64_t a2)
{
  v5[0] = 0LL;
  v5[1] = v5;
  v5[2] = 0x2020000000LL;
  char v6 = 0;
  v4[0] = MEMORY[0x1895F87A8];
  v4[1] = 3221225472LL;
  v4[2] = __62__NSSQLiteConnection_insertArray_forEntity_includeOnConflict___block_invoke_2;
  v4[3] = &unk_189EAA3A8;
  v4[4] = a2;
  v4[5] = v5;
  -[NSSQLiteConnection insertDictionaryBlock:forEntity:includeOnConflict:]( *(void *)(a1 + 32),  (uint64_t)v4,  *(id **)(a1 + 40),  *(unsigned __int8 *)(a1 + 56));
  *(void *)(*(void *)(*(void *)(a1 + 48) + 8LL) + 24LL) += v3;
  _Block_object_dispose(v5, 8);
}

BOOL __62__NSSQLiteConnection_insertArray_forEntity_includeOnConflict___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(*(void *)(a1 + 40) + 8LL);
  int v3 = *(unsigned __int8 *)(v2 + 24);
  if (!*(_BYTE *)(v2 + 24))
  {
    [a2 addEntriesFromDictionary:*(void *)(a1 + 32)];
    *(_BYTE *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL) = 1;
  }

  return v3 != 0;
}

- (void)insertDictionaryBlock:(id *)a3 forEntity:(int)a4 includeOnConflict:
{
  uint64_t v67 = *MEMORY[0x1895F89C0];
  if (a1)
  {
    uint64_t v4 = *(dispatch_queue_s **)(a1 + 8);
    if (v4) {
      dispatch_assert_queue_V2(v4);
    }
    id v40 = objc_alloc_init(MEMORY[0x1896077E8]);
    id v48 = objc_alloc_init(MEMORY[0x189603FC8]);
    obuint64_t j = (id)objc_msgSend(objc_alloc(MEMORY[0x189603FC8]), "initWithCapacity:", objc_msgSend(v48, "count"));
    char v5 = 0;
    uint64_t v43 = 0LL;
    while (1)
    {
      char v44 = v5;
      if ((v5 & 1) != 0) {
        break;
      }
      __int128 v47 = (void *)MEMORY[0x186E3E5D8]();
      [v48 removeAllObjects];
      [obj removeAllObjects];
      char v46 = (*(uint64_t (**)(uint64_t, id))(a2 + 16))(a2, v48);
      if ((v46 & 1) == 0)
      {
        char v6 = (void *)[objc_alloc(MEMORY[0x189603FC8]) initWithDictionary:v48];
        while ([v6 count])
        {
          context = (void *)MEMORY[0x186E3E5D8]();
          uint64_t v7 = +[_PFRoutines anyObjectFromCollection:]((uint64_t)&OBJC_CLASS____PFRoutines, v6);
          uint64_t v8 = (void *)[v6 objectForKey:v7];
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            __int128 v62 = 0u;
            __int128 v63 = 0u;
            __int128 v60 = 0u;
            __int128 v61 = 0u;
            uint64_t v9 = [v8 countByEnumeratingWithState:&v60 objects:v66 count:16];
            if (v9)
            {
              uint64_t v10 = *(void *)v61;
              do
              {
                for (uint64_t i = 0LL; i != v9; ++i)
                {
                  if (*(void *)v61 != v10) {
                    objc_enumerationMutation(v8);
                  }
                  uint64_t v12 = *(void *)(*((void *)&v60 + 1) + 8 * i);
                  uint64_t v13 = (void *)MEMORY[0x186E3E5D8]();
                  uint64_t v14 = [v8 objectForKey:v12];
                  [v6 setObject:v14, objc_msgSend(NSString, "stringWithFormat:", @"%@.%@", v7, v12) forKey];
                  objc_autoreleasePoolPop(v13);
                }

                uint64_t v9 = [v8 countByEnumeratingWithState:&v60 objects:v66 count:16];
              }

              while (v9);
            }
          }

          else
          {
            [obj setObject:v8 forKey:v7];
          }

          [v6 removeObjectForKey:v7];
          objc_autoreleasePoolPop(context);
        }

        __int128 v58 = 0u;
        __int128 v59 = 0u;
        __int128 v56 = 0u;
        __int128 v57 = 0u;
        uint64_t v15 = [obj countByEnumeratingWithState:&v56 objects:v65 count:16];
        if (v15)
        {
          uint64_t v16 = *(void *)v57;
          while (2)
          {
            for (uint64_t j = 0LL; j != v15; ++j)
            {
              if (*(void *)v57 != v16) {
                objc_enumerationMutation(obj);
              }
              if ((_BYTE)dword_18C4ABDC0)
              {
                uint64_t v18 = *(void *)(*((void *)&v56 + 1) + 8 * j);
                if (!a3 || ![a3[5] objectForKey:*(void *)(*((void *)&v56 + 1) + 8 * j)])
                {
                  uint64_t v33 = (void *)objc_msgSend( MEMORY[0x189603FC8],  "dictionaryWithObjectsAndKeys:",  objc_msgSend(a3, "name"),  @"NSValidationErrorObject",  v18,  @"NSValidationErrorKey",  0);
                  id v34 = +[_NSCoreDataException exceptionWithName:code:reason:userInfo:]( (uint64_t)&OBJC_CLASS____NSCoreDataException,  *MEMORY[0x189603A58],  1605LL,  (uint64_t)@"property not found for entity",  v33);
                  objc_exception_throw(v34);
                  goto LABEL_65;
                }
              }
            }

            uint64_t v15 = [obj countByEnumeratingWithState:&v56 objects:v65 count:16];
            if (v15) {
              continue;
            }
            break;
          }
        }

        -[NSSQLiteConnection generatePrimaryKeysForEntity:batch:](a1, [a3 rootEntity], 1u);
        uint64_t v20 = v19;
        if (!v19)
        {
          id v38 = +[_NSCoreDataException exceptionWithName:code:reason:userInfo:]( (uint64_t)&OBJC_CLASS____NSCoreDataException,  *MEMORY[0x189603A58],  134030LL,  (uint64_t)@"unable to generate primary keys for batch insert",  0LL);
          objc_exception_throw(v38);
LABEL_65:
          __break(1u);
          return;
        }

        -[NSSQLiteConnection prepareInsertStatementForEntity:includeConstraints:includeOnConflict:onConflictKeys:]( a1,  a3,  a4,  (void *)[obj allKeys]);
        __int128 v54 = 0u;
        __int128 v55 = 0u;
        __int128 v52 = 0u;
        __int128 v53 = 0u;
        uint64_t v21 = (void *)[*(id *)(a1 + 48) bindVariables];
        uint64_t v22 = [v21 countByEnumeratingWithState:&v52 objects:v64 count:16];
        if (v22)
        {
          uint64_t v23 = *(void *)v53;
          while (2)
          {
            for (uint64_t k = 0LL; k != v22; ++k)
            {
              if (*(void *)v53 != v23) {
                objc_enumerationMutation(v21);
              }
              __int128 v25 = *(void **)(*((void *)&v52 + 1) + 8 * k);
              if ([v25 index])
              {
                if ([v25 index] == 2)
                {
                  [v25 setUnsignedInt:1];
                }

                else
                {
                  __int128 v26 = (void *)[v25 propertyDescription];
                  uint64_t v27 = v26;
                  if (v26)
                  {
                    uint64_t v28 = objc_msgSend(obj, "objectForKey:", objc_msgSend(v26, "_qualifiedName"));
                    if (!v28 || (uint64_t v29 = objc_opt_class(), v29 == objc_opt_class()))
                    {
                      if ([v27 defaultValue])
                      {
                        if ([v27 _propertyType] == 7) {
                          uint64_t v30 = [v27 _buildDefaultValue];
                        }
                        else {
                          uint64_t v30 = [v27 defaultValue];
                        }
                        uint64_t v31 = v30;
                      }

                      else
                      {
                        if (([v27 isOptional] & 1) == 0)
                        {
                          uint64_t v35 = (void *)MEMORY[0x189603FC8];
                          uint64_t v36 = [a3 entityDescription];
                          uint64_t v37 = [v27 name];
                          -[NSSQLiteConnection _batchInsertThrowWithErrorCode:andMessage:forKey:andValue:additionalDetail:]( 1570,  @"mandatory property not set",  v27,  v28,  objc_msgSend( v35,  "dictionaryWithObjectsAndKeys:",  v36,  @"NSValidationErrorObject",  v37,  @"NSValidationErrorKey",  objc_msgSend(MEMORY[0x189603FE8], "null"),  @"NSValidationErrorValue",  0));
                          goto LABEL_65;
                        }

                        uint64_t v31 = 0LL;
                      }

                      [v25 setValue:v31];
                    }

                    else
                    {
                      -[NSSQLiteConnection _validateProperty:withValue:](v27, v28);
                      [v25 setValue:v28];
                    }
                  }
                }
              }

              else
              {
                [v25 setInt64:v20];
              }
            }

            uint64_t v22 = [v21 countByEnumeratingWithState:&v52 objects:v64 count:16];
            if (v22) {
              continue;
            }
            break;
          }
        }

        [(id)a1 execute];
        v43 += sqlite3_changes(*(sqlite3 **)(a1 + 72));
        if (!*(void *)(a1 + 80))
        {
          uint64_t v32 = -[NSSQLiteConnection statementCacheForEntity:](a1, a3);
          -[NSSQLiteStatementCache cacheBatchInsertStatement:](v32, 0LL);
        }

        -[NSSQLiteConnection _clearBindVariablesForInsertedRow](a1);
        -[NSSQLiteConnection resetSQLStatement](a1);
      }

      objc_autoreleasePoolPop(v47);
      char v5 = v46;
    }

    [v40 drain];
    id v39 = 0LL;
    if ((v44 & 1) == 0)
    {
      objc_exception_rethrow();
      goto LABEL_65;
    }
  }

- (uint64_t)_batchInsertThrowWithErrorCode:(int)a1 andMessage:(void *)a2 forKey:(void *)a3 andValue:(uint64_t)a4 additionalDetail:(uint64_t)a5
{
  uint64_t v10 = (void *)MEMORY[0x189603FC8];
  uint64_t v11 = [a3 entity];
  uint64_t v12 = [a3 name];
  if (!a4) {
    a4 = [MEMORY[0x189603FE8] null];
  }
  uint64_t v13 = (void *)objc_msgSend( v10,  "dictionaryWithObjectsAndKeys:",  v11,  @"NSValidationErrorObject",  v12,  @"NSValidationErrorKey",  a4,  @"NSValidationErrorValue",  0);
  if ([a2 length]) {
    [v13 setValue:a2 forKey:@"reason"];
  }
  uint64_t v14 = (void *)objc_msgSend( (id)objc_msgSend(MEMORY[0x189607870], "errorWithDomain:code:userInfo:", *MEMORY[0x189607460], a1, 0),  "localizedDescription");
  uint64_t v15 = (void *)objc_msgSend( (id)objc_msgSend((id)objc_msgSend(a3, "entity"), "managedObjectModel"),  "_localizationPolicy");
  uint64_t v16 = objc_msgSend(v15, "localizedEntityNameForEntity:", objc_msgSend(a3, "entity"));
  uint64_t v17 = [v15 localizedPropertyNameForProperty:a3];
  if (v16 | v17)
  {
    uint64_t v18 = v17;
    uint64_t v19 = (void *)[v14 mutableCopyWithZone:0];
    uint64_t v20 = v19;
    if (v16) {
      objc_msgSend( v19,  "replaceOccurrencesOfString:withString:options:range:",  @"%{ENTITY}@",  v16,  2,  0,  objc_msgSend(v19, "length"));
    }
    if (v18) {
      objc_msgSend( v20,  "replaceOccurrencesOfString:withString:options:range:",  @"%{PROPERTY}@",  v18,  2,  0,  objc_msgSend(v20, "length"));
    }
    id v21 = v20;
    [v13 setObject:v20 forKey:*MEMORY[0x1896075E0]];
  }

  [v13 addEntriesFromDictionary:a5];
  id v22 = +[_NSCoreDataException exceptionWithName:code:reason:userInfo:]( (uint64_t)&OBJC_CLASS____NSCoreDataException,  *MEMORY[0x189603A58],  a1,  (uint64_t)a2,  v13);
  objc_exception_throw(v22);
  return -[NSSQLiteConnection _validateProperty:withValue:]();
}

- (uint64_t)_validateProperty:(void *)a1 withValue:(uint64_t)a2
{
  uint64_t v2 = (char *)a2;
  uint64_t v33 = a2;
  if ([a1 _propertyType] != 2) {
    goto LABEL_52;
  }
  uint64_t v4 = [a1 attributeType];
  if (v4 > 599)
  {
    if (v4 <= 799)
    {
      if (v4 != 600)
      {
        if (v4 == 700 && ([v2 isNSString] & 1) != 0) {
          goto LABEL_33;
        }
        goto LABEL_21;
      }
    }

    else if (v4 != 800)
    {
      if (v4 == 900)
      {
        if ([v2 isNSDate]) {
          goto LABEL_33;
        }
      }

      else if (v4 == 1000)
      {
        if ([a1 isFileBackedFuture])
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0) {
            goto LABEL_33;
          }
        }

        else if ([v2 isNSData])
        {
          goto LABEL_33;
        }
      }

      goto LABEL_21;
    }

    goto LABEL_20;
  }

  if (v4 > 299)
  {
    if (v4 != 300 && v4 != 500) {
      goto LABEL_21;
    }
LABEL_20:
    if ([v2 isNSNumber]) {
      goto LABEL_33;
    }
    goto LABEL_21;
  }

  if (v4 == 100 || v4 == 200) {
    goto LABEL_20;
  }
LABEL_21:
  if ([a1 isFileBackedFuture])
  {
LABEL_55:
    uint64_t v7 = (void *)objc_msgSend( NSString,  "stringWithFormat:",  @"Unacceptable type of value for attribute: property = %@; desired type = %@; given type = %@; value = %@.",
                   [a1 name],
                   @"A class implementing the NSFileBackedFuture protocol",
                   objc_opt_class(),
                   v2);
    goto LABEL_58;
  }

  uint64_t v5 = [a1 _attributeValueClass];
  if (v5)
  {
    char v6 = (void *)v5;
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      if (![v2 isNSNumber]
        || ![v6 isSubclassOfClass:objc_opt_class()])
      {
        goto LABEL_57;
      }

      uint64_t v33 = objc_msgSend(MEMORY[0x189607858], "decimalNumberWithString:", objc_msgSend(v2, "stringValue"));
    }
  }

  else if (([a1 isTransient] & 1) == 0 && objc_msgSend(a1, "attributeType") != 1800)
  {
    uint64_t v7 = (void *)objc_msgSend( NSString,  "stringWithFormat:",  @"Cannot set value for attribute with undefined type: property = %@; entity = %@; value = %@",
                   [a1 name],
                   [a1 entity],
                   v2,
                   v31);
    goto LABEL_58;
  }

- (void)insertManagedObjectBlock:(void *)a3 forEntity:(int)a4 includeOnConflict:
{
  uint64_t v43 = *MEMORY[0x1895F89C0];
  if (a1)
  {
    uint64_t v5 = *(dispatch_queue_s **)(a1 + 8);
    if (v5) {
      dispatch_assert_queue_V2(v5);
    }
    id v29 = objc_alloc_init(MEMORY[0x1896077E8]);
    uint64_t v33 = 0LL;
    uint64_t v30 = a3;
    while (1)
    {
      char v6 = -[NSManagedObject initWithEntity:insertIntoManagedObjectContext:]( [NSManagedObject alloc],  "initWithEntity:insertIntoManagedObjectContext:",  [a3 entityDescription],  0);
      uint64_t v35 = v6;
      if (v6) {
        uint64_t v7 = -[NSManagedObject _newPropertiesForRetainedTypes:andCopiedTypes:preserveFaults:]( v6,  __const__newAllPropertiesWithRelationshipFaultsIntact___simple,  __const__newAllPropertiesWithRelationshipFaultsIntact___complex,  1);
      }
      else {
        uint64_t v7 = 0LL;
      }
      -[NSManagedObject _setOriginalSnapshot__:](v35, v7);

      if (((*(uint64_t (**)(uint64_t, NSManagedObject *))(a2 + 16))(a2, v35) & 1) != 0)
      {

        [v29 drain];
        id v28 = 0LL;
        return;
      }

      -[NSSQLiteConnection generatePrimaryKeysForEntity:batch:](a1, [a3 rootEntity], 1u);
      uint64_t v36 = v8;
      if (!v8) {
        break;
      }
      -[NSSQLiteConnection prepareInsertStatementForEntity:includeConstraints:includeOnConflict:onConflictKeys:]( a1,  a3,  a4,  -[NSDictionary allKeys](-[NSManagedObject changedValues](v35, "changedValues"), "allKeys"));
      __int128 v40 = 0u;
      __int128 v41 = 0u;
      __int128 v38 = 0u;
      __int128 v39 = 0u;
      uint64_t v9 = (void *)[*(id *)(a1 + 48) bindVariables];
      uint64_t v10 = [v9 countByEnumeratingWithState:&v38 objects:v42 count:16];
      if (v10)
      {
        uint64_t v11 = *(void *)v39;
        obunint64_t j = v9;
        while (2)
        {
          for (uint64_t i = 0LL; i != v10; ++i)
          {
            if (*(void *)v39 != v11) {
              objc_enumerationMutation(obj);
            }
            uint64_t v13 = *(void **)(*((void *)&v38 + 1) + 8 * i);
            if ([v13 index])
            {
              if ([v13 index] == 2)
              {
                [v13 setUnsignedInt:1];
              }

              else
              {
                uint64_t v14 = (void *)[v13 propertyDescription];
                uint64_t v15 = v14;
                if (v14)
                {
                  int v16 = (void *)objc_msgSend( (id)objc_msgSend( (id)objc_msgSend(v14, "_qualifiedName"),  "componentsSeparatedByString:",  @"."),  "mutableCopy");
                  id v17 = -[NSManagedObject valueForKey:](v35, "valueForKey:", [v16 firstObject]);
                  [v16 removeObjectAtIndex:0];
                  for (unint64_t j = 0; j < [v16 count]; ++j)
                  {
                    uint64_t v19 = [v16 objectAtIndex:j];
                    objc_opt_class();
                    if ((objc_opt_isKindOfClass() & 1) != 0) {
                      id v17 = (id)[v17 objectForKey:v19];
                    }
                  }

                  if (!v17 || (uint64_t v20 = objc_opt_class(), v20 == objc_opt_class()))
                  {
                    if ([v15 defaultValue])
                    {
                      if ([v15 _propertyType] == 7) {
                        uint64_t v21 = [v15 _buildDefaultValue];
                      }
                      else {
                        uint64_t v21 = [v15 defaultValue];
                      }
                      uint64_t v22 = v21;
                    }

                    else
                    {
                      if (([v15 isOptional] & 1) == 0)
                      {
                        uint64_t v24 = (void *)MEMORY[0x189603FC8];
                        uint64_t v25 = [v30 entityDescription];
                        uint64_t v26 = [v15 name];
                        -[NSSQLiteConnection _batchInsertThrowWithErrorCode:andMessage:forKey:andValue:additionalDetail:]( 1570,  @"mandatory property not set",  v15,  (uint64_t)v17,  objc_msgSend( v24,  "dictionaryWithObjectsAndKeys:",  v25,  @"NSValidationErrorObject",  v26,  @"NSValidationErrorKey",  objc_msgSend(MEMORY[0x189603FE8], "null"),  @"NSValidationErrorValue",  0));
                        goto LABEL_45;
                      }

                      uint64_t v22 = 0LL;
                    }

                    [v13 setValue:v22];
                  }

                  else
                  {
                    -[NSSQLiteConnection _validateProperty:withValue:](v15, (uint64_t)v17);
                    [v13 setValue:v17];
                  }
                }
              }
            }

            else
            {
              [v13 setInt64:v36];
            }
          }

          uint64_t v10 = [obj countByEnumeratingWithState:&v38 objects:v42 count:16];
          if (v10) {
            continue;
          }
          break;
        }
      }

      [(id)a1 execute];
      a3 = v30;
      v33 += sqlite3_changes(*(sqlite3 **)(a1 + 72));
      if (!*(void *)(a1 + 80))
      {
        uint64_t v23 = -[NSSQLiteConnection statementCacheForEntity:](a1, v30);
        -[NSSQLiteStatementCache cacheBatchInsertStatement:](v23, 0LL);
      }

      -[NSSQLiteConnection _clearBindVariablesForInsertedRow](a1);
      -[NSSQLiteConnection resetSQLStatement](a1);
    }

    id v27 = +[_NSCoreDataException exceptionWithName:code:reason:userInfo:]( (uint64_t)&OBJC_CLASS____NSCoreDataException,  *MEMORY[0x189603A58],  134030LL,  (uint64_t)@"unable to generate primary keys for batch insert",  0LL);
    objc_exception_throw(v27);
LABEL_45:
    __break(1u);
  }

- (uint64_t)gatherObjectIDsFromTable:(uint64_t)a1
{
  uint64_t v28 = *MEMORY[0x1895F89C0];
  if (!a1) {
    return 0LL;
  }
  if (!-[NSSQLiteConnection _tableHasRows:](a1, a2)) {
    return MEMORY[0x189604A58];
  }
  uint64_t v4 = -[NSSQLiteAdapter newStatementWithSQLString:]( (NSSQLiteStatement *)[(id)a1 adapter],  objc_msgSend(NSString, "stringWithFormat:", @"SELECT DISTINCT ENTITYID, PRIMEKEY FROM %@", a2));
  id v22 = objc_alloc_init(MEMORY[0x189603FA8]);
  uint64_t v21 = v4;
  uint64_t v5 = -[NSSQLColumn initWithColumnName:sqlType:]( objc_alloc(&OBJC_CLASS___NSSQLColumn),  "initWithColumnName:sqlType:",  @"ENTITYID",  2LL);
  [v22 addObject:v5];

  char v6 = -[NSSQLColumn initWithColumnName:sqlType:]( objc_alloc(&OBJC_CLASS___NSSQLColumn),  "initWithColumnName:sqlType:",  @"PRIMEKEY",  2LL);
  [v22 addObject:v6];

  -[NSSQLiteConnection prepareSQLStatement:](a1, v4);
  -[NSSQLiteConnection setColumnsToFetch:]((void *)a1, v22);
  [(id)a1 execute];
  id v7 = objc_alloc_init(MEMORY[0x189603FA8]);
  while (1)
  {
    uint64_t v8 = -[NSSQLiteConnection newFetchedArray](a1);
    if (!v8) {
      break;
    }
    uint64_t v9 = v8;
    if ([v8 count] == 2)
    {
      uint64_t v10 = (void *)[v9 objectAtIndex:0];
      uint64_t v11 = (void *)[v9 objectAtIndex:1];
      if ((unint64_t)[v10 unsignedLongValue] >> 7 < 0x7D)
      {
        uint64_t v16 = objc_msgSend( (id)objc_msgSend(*(id *)(a1 + 16), "model"),  "entityForID:",  objc_msgSend(v10, "unsignedLongValue"));
      }

      else
      {
        __int128 v25 = 0u;
        __int128 v26 = 0u;
        __int128 v23 = 0u;
        __int128 v24 = 0u;
        uint64_t v12 = (void *)objc_msgSend((id)objc_msgSend(*(id *)(a1 + 16), "ancillarySQLModels"), "allValues");
        uint64_t v13 = [v12 countByEnumeratingWithState:&v23 objects:v27 count:16];
        if (v13)
        {
          uint64_t v14 = *(void *)v24;
LABEL_9:
          uint64_t v15 = 0LL;
          while (1)
          {
            if (*(void *)v24 != v14) {
              objc_enumerationMutation(v12);
            }
            uint64_t v16 = objc_msgSend( *(id *)(*((void *)&v23 + 1) + 8 * v15),  "entityForID:",  objc_msgSend(v10, "unsignedLongValue"));
            if (v16) {
              break;
            }
            if (v13 == ++v15)
            {
              uint64_t v13 = [v12 countByEnumeratingWithState:&v23 objects:v27 count:16];
              uint64_t v16 = 0LL;
              if (v13) {
                goto LABEL_9;
              }
              break;
            }
          }
        }

        else
        {
          uint64_t v16 = 0LL;
        }
      }

      id v17 = (void *)objc_msgSend( *(id *)(a1 + 16),  "newObjectIDForEntity:pk:",  v16,  objc_msgSend(v11, "unsignedLongLongValue"));
      [v7 addObject:v17];
    }
  }

  uint64_t v19 = [MEMORY[0x189603F18] arrayWithArray:v7];

  uint64_t v18 = v19;
  -[NSSQLiteConnection releaseSQLStatement](a1);
  -[NSSQLiteConnection setColumnsToFetch:]((void *)a1, 0LL);
  *(_DWORD *)(a1 + 312) &= ~2u;
  *(void *)(a1 + 100) = 0LL;
  *(void *)(a1 + 92) = 0LL;
  *(_DWORD *)(a1 + 108) = 0;

  return v18;
}

- (uint64_t)_int64ResultForSQL:(uint64_t)a1
{
  uint64_t v2 = -[NSSQLiteConnection copyRawIntegerRowsForSQL:](a1, a2);
  if (!v2) {
    return 0LL;
  }
  int v3 = v2;
  if (CFArrayGetCount(v2) && *(void *)CFArrayGetValueAtIndex(v3, 0LL)) {
    uint64_t v4 = *(void *)CFArrayGetValueAtIndex(v3, 1LL);
  }
  else {
    uint64_t v4 = 0LL;
  }
  CFRelease(v3);
  return v4;
}

- (uint64_t)percentageUsedByPersistentHistory
{
  uint64_t v43 = *MEMORY[0x1895F89C0];
  if (result)
  {
    uint64_t v1 = result;
    uint64_t v2 = -[NSSQLiteConnection _int64ResultForSQL:](result, @"PRAGMA page_count");
    uint64_t v3 = -[NSSQLiteConnection _int64ResultForSQL:](v1, @"PRAGMA freelist_count");
    uint64_t v4 = v2 - v3;
    if (v2 - v3 < 1)
    {
      uint64_t v16 = [NSString stringWithUTF8String:"Percentage History calculation error. Total Pages - %lld  Free Pages - %lld"];
      _NSCoreDataLog(17LL, v16, v17, v18, v19, v20, v21, v22, v2);
      __int128 v23 = (os_log_s *)__pflogFaultLog;
      if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 134218240;
        uint64_t v40 = v2;
        __int16 v41 = 2048;
        uint64_t v42 = v3;
        _os_log_fault_impl( &dword_186681000,  v23,  OS_LOG_TYPE_FAULT,  "CoreData: Percentage History calculation error. Total Pages - %lld  Free Pages - %lld",  buf,  0x16u);
      }

      return 0LL;
    }

    else
    {
      uint64_t v5 = (void *)objc_msgSend( (id)objc_msgSend(*(id *)(v1 + 16), "ancillarySQLModels"),  "objectForKey:",  @"NSPersistentHistoryTrackingKey");
      if (v5) {
        uint64_t v5 = (void *)v5[4];
      }
      char v6 = (void *)[v5 valueForKey:@"tableName"];
      uint64_t v7 = [v6 count];
      unint64_t v8 = 0x189607000uLL;
      if (v7)
      {
        uint64_t v33 = v2 - v3;
        uint64_t v34 = v2;
        uint64_t v9 = (void *)objc_msgSend(MEMORY[0x189607940], "stringWithString:", @"(");
        __int128 v35 = 0u;
        __int128 v36 = 0u;
        __int128 v37 = 0u;
        __int128 v38 = 0u;
        uint64_t v10 = [v6 countByEnumeratingWithState:&v35 objects:buf count:16];
        if (v10)
        {
          uint64_t v11 = v10;
          uint64_t v12 = *(void *)v36;
          char v13 = 1;
          do
          {
            for (uint64_t i = 0LL; i != v11; ++i)
            {
              if (*(void *)v36 != v12) {
                objc_enumerationMutation(v6);
              }
              uint64_t v15 = *(void *)(*((void *)&v35 + 1) + 8 * i);
              if ((v13 & 1) == 0) {
                objc_msgSend(v9, "appendString:", @" , ");
              }
              [v9 appendFormat:@"'%@'", v15];
              char v13 = 0;
            }

            uint64_t v11 = [v6 countByEnumeratingWithState:&v35 objects:buf count:16];
            char v13 = 0;
          }

          while (v11);
        }

        [v9 appendString:@""]);
        uint64_t v2 = v34;
        uint64_t v4 = v33;
        unint64_t v8 = 0x189607000LL;
      }

      else
      {
        uint64_t v9 = 0LL;
      }

      __int128 v24 = (void *)objc_msgSend( objc_alloc(*(Class *)(v8 + 2368)),  "initWithFormat:",  @"SELECT sum(pageno) FROM dbstat d, sqlite_master m WHERE d.name = m.name AND d.aggregate = TRUE");
      __int128 v25 = v24;
      if (v9) {
        [v24 appendFormat:@" AND m.tbl_name IN %@", v9];
      }
      uint64_t v26 = -[NSSQLiteConnection _int64ResultForSQL:](v1, v25);

      _NSCoreDataLog( 4LL,  (uint64_t)@"Percentage History: total pages - %lld, free pages - %lld, historyPages - %lld",  v27,  v28,  v29,  v30,  v31,  v32,  v2);
      return 100 * v26 / v4;
    }
  }

  return result;
}

- (uint64_t)registerMigrationUpdateFunctionWithMigrator:(uint64_t)a1
{
  if (!a1) {
    return a1 != 0;
  }
  uint64_t v4 = *(dispatch_queue_s **)(a1 + 8);
  if (v4) {
    dispatch_assert_queue_V2(v4);
  }
  objc_exception_throw((id)[MEMORY[0x189603F70] exceptionWithName:*MEMORY[0x189603A58] reason:@"An internal error occurred while configuring migration functions in the SQLite database." userInfo:0]);
  return -[NSSQLiteConnection executeAttributeUniquenessCheckSQLStatement:returningColumns:]();
}

- (void)executeAttributeUniquenessCheckSQLStatement:(void *)a3 returningColumns:
{
  uint64_t v19 = *MEMORY[0x1895F89C0];
  if (!a1) {
    return 0LL;
  }
  char v6 = (void *)[MEMORY[0x189603FA8] array];
  -[NSSQLiteConnection prepareSQLStatement:](a1, a2);
  [(id)a1 execute];
  uint64_t v7 = (void *)[MEMORY[0x189603FA8] array];
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  uint64_t v8 = [a3 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v8)
  {
    uint64_t v9 = *(void *)v15;
    do
    {
      for (uint64_t i = 0LL; i != v8; ++i)
      {
        if (*(void *)v15 != v9) {
          objc_enumerationMutation(a3);
        }
        uint64_t v11 = *(void *)(*((void *)&v14 + 1) + 8 * i);
        if (v11 && *(_BYTE *)(v11 + 24) == 7)
        {
          [v7 addObject:*(void *)(*((void *)&v14 + 1) + 8 * i)];
          if (*(void *)(v11 + 72)) {
            objc_msgSend(v7, "addObject:");
          }
        }

        else
        {
          [v7 addObject:*(void *)(*((void *)&v14 + 1) + 8 * i)];
        }
      }

      uint64_t v8 = [a3 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }

    while (v8);
  }

  -[NSSQLiteConnection setColumnsToFetch:]((void *)a1, v7);
  while (1)
  {
    uint64_t v12 = -[NSSQLiteConnection newFetchedArray](a1);
    if (!v12) {
      break;
    }
    [v6 addObject:v12];
  }

  -[NSSQLiteConnection setColumnsToFetch:]((void *)a1, 0LL);
  *(_DWORD *)(a1 + 312) &= ~2u;
  *(void *)(a1 + 100) = 0LL;
  *(void *)(a1 + 92) = 0LL;
  *(_DWORD *)(a1 + 108) = 0;
  -[NSSQLiteConnection _finalizeStatement](a1);
  -[NSSQLiteConnection resetSQLStatement](a1);
  return v6;
}

- (void)executeMulticolumnUniquenessCheckSQLStatement:(void *)a3 returningColumns:
{
  uint64_t v19 = *MEMORY[0x1895F89C0];
  if (!a1) {
    return 0LL;
  }
  char v6 = (void *)[MEMORY[0x189603FA8] array];
  -[NSSQLiteConnection prepareSQLStatement:](a1, a2);
  [(id)a1 execute];
  uint64_t v7 = (void *)[MEMORY[0x189603FA8] array];
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  uint64_t v8 = [a3 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v8)
  {
    uint64_t v9 = *(void *)v15;
    do
    {
      for (uint64_t i = 0LL; i != v8; ++i)
      {
        if (*(void *)v15 != v9) {
          objc_enumerationMutation(a3);
        }
        uint64_t v11 = *(void *)(*((void *)&v14 + 1) + 8 * i);
        if (v11 && *(_BYTE *)(v11 + 24) == 7)
        {
          [v7 addObject:*(void *)(*((void *)&v14 + 1) + 8 * i)];
          if (*(void *)(v11 + 72)) {
            objc_msgSend(v7, "addObject:");
          }
        }

        else
        {
          [v7 addObject:*(void *)(*((void *)&v14 + 1) + 8 * i)];
        }
      }

      uint64_t v8 = [a3 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }

    while (v8);
  }

  -[NSSQLiteConnection setColumnsToFetch:]((void *)a1, v7);
  while (1)
  {
    uint64_t v12 = -[NSSQLiteConnection newFetchedArray](a1);
    if (!v12) {
      break;
    }
    [v6 addObject:v12];
  }

  -[NSSQLiteConnection setColumnsToFetch:]((void *)a1, 0LL);
  *(_DWORD *)(a1 + 312) &= ~2u;
  *(void *)(a1 + 100) = 0LL;
  *(void *)(a1 + 92) = 0LL;
  *(_DWORD *)(a1 + 108) = 0;
  -[NSSQLiteConnection _finalizeStatement](a1);
  -[NSSQLiteConnection resetSQLStatement](a1);
  return v6;
}

- (uint64_t)_adoptQueryGenerationWithSnapshot:(uint64_t)a1
{
  uint64_t v4 = *(dispatch_queue_s **)(a1 + 8);
  if (v4) {
    dispatch_assert_queue_V2(v4);
  }
  if (!a2) {
    return a2;
  }
  if (*(void *)(a1 + 72))
  {
    uint64_t v5 = [(id)a2 bytes];
    if (!v5)
    {
      uint64_t v21 = [NSString stringWithUTF8String:"sqlite3_snapshot data was unexpectedly NULL"];
      _NSCoreDataLog(17LL, v21, v22, v23, v24, v25, v26, v27, v30);
      uint64_t v28 = (os_log_s *)__pflogFaultLog;
      if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_fault_impl( &dword_186681000,  v28,  OS_LOG_TYPE_FAULT,  "CoreData: sqlite3_snapshot data was unexpectedly NULL",  buf,  2u);
      }

      return 7LL;
    }

    char v6 = (sqlite3_snapshot *)v5;
    if (+[NSSQLCore debugDefault](&OBJC_CLASS___NSSQLCore, "debugDefault") >= 1)
    {
      [MEMORY[0x189603F48] dataWithBytes:v6 length:48];
      _NSCoreDataLog( 4LL,  (uint64_t)@"connection %p adopting snapshot:\n\tss value: %@\n\tpointer value:%@\n\tpointer: %p",  v7,  v8,  v9,  v10,  v11,  v12,  a1);
    }

    a2 = sqlite3_snapshot_open(*(sqlite3 **)(a1 + 72), "main", v6);
    BOOL v19 = a2 == 0;
    if ((_DWORD)a2 != 517 && (_BYTE)a2)
    {
      while (1)
      {
        usleep(0x64u);
        a2 = sqlite3_snapshot_open(*(sqlite3 **)(a1 + 72), "main", v6);
        BOOL v19 = a2 == 0;
      }
    }

    if (v19) {
      return a2;
    }
LABEL_18:
    _NSCoreDataLog(1LL, (uint64_t)@"sqlite3_snapshot_open failed with %ld", v13, v14, v15, v16, v17, v18, a2);
    return a2;
  }

  objc_exception_throw((id)[MEMORY[0x189603F70] exceptionWithName:*MEMORY[0x189603A58] reason:@"database connection must not be nil here" userInfo:0]);
  return -[NSSQLiteConnection _registerNewQueryGenerationSnapshot:]();
}

- (uint64_t)_registerNewQueryGenerationSnapshot:(uint64_t)a1
{
  if (!a1) {
    return 0LL;
  }
  uint64_t v4 = *(dispatch_queue_s **)(a1 + 8);
  if (v4) {
    dispatch_assert_queue_V2(v4);
  }
  if ([*(id *)(a1 + 328) count])
  {
    uint64_t v5 = [*(id *)(a1 + 328) count];
    uint64_t v6 = v5;
    if (!v5) {
      return 0LL;
    }
    uint64_t v7 = 0LL;
    uint64_t v8 = v5 - 1;
    while (1)
    {
      int v9 = objc_msgSend(a2, "compare:", objc_msgSend(*(id *)(a1 + 328), "objectAtIndex:", v7));
      if (v9 < 0) {
        break;
      }
      if (v9)
      {
        if (v8 == v7) {
          [*(id *)(a1 + 328) addObject:a2];
        }
        if (v6 != ++v7) {
          continue;
        }
      }

      return 0LL;
    }

    [*(id *)(a1 + 328) insertObject:a2 atIndex:v7];
    if (v7) {
      return 0LL;
    }
    uint64_t v10 = -[NSSQLiteConnection _adoptQueryGenerationWithSnapshot:](a1, (uint64_t)a2);
    uint64_t v17 = v10;
    if (!(_DWORD)v10) {
      return v17;
    }
    goto LABEL_14;
  }

  -[NSSQLiteConnection beginReadTransaction](a1);
  [*(id *)(a1 + 328) addObject:a2];
  uint64_t v10 = -[NSSQLiteConnection _adoptQueryGenerationWithSnapshot:](a1, (uint64_t)a2);
  uint64_t v17 = v10;
  if ((_DWORD)v10) {
LABEL_14:
  }
    _NSCoreDataLog( 1LL,  (uint64_t)@"_registerNewQueryGenerationSnapshot failed to adopt query generation with error %d",  v11,  v12,  v13,  v14,  v15,  v16,  v10);
  return v17;
}

- (int)registerCurrentQueryGenerationWithStore:(id)a3
{
  return -[NSSQLiteConnection registerCurrentQueryGenerationWithStore:retries:]((uint64_t)self, (uint64_t)a3, 1LL);
}

- (uint64_t)freeQueryGenerationWithIdentifier:(uint64_t)a1
{
  uint64_t v32 = *MEMORY[0x1895F89C0];
  if (a1)
  {
    uint64_t v4 = *(dispatch_queue_s **)(a1 + 8);
    if (v4) {
      dispatch_assert_queue_V2(v4);
    }
    uint64_t v5 = *(void **)(a1 + 328);
    v30[0] = MEMORY[0x1895F87A8];
    v30[1] = 3221225472LL;
    v30[2] = __56__NSSQLiteConnection_freeQueryGenerationWithIdentifier___block_invoke;
    v30[3] = &unk_189EAA3F8;
    v30[4] = a2;
    unint64_t v6 = [v5 indexOfObjectPassingTest:v30];
    if (v6 != 0x7FFFFFFFFFFFFFFFLL)
    {
      uint64_t v7 = (unsigned int *)(id)[*(id *)(a1 + 328) objectAtIndex:v6];
      uint64_t v8 = v7;
      if (!v7) {
        goto LABEL_9;
      }
      int v9 = v7 + 4;
      do
        int v10 = __ldxr(v9);
      while (__stxr(v10 - 1, v9));
      if (v10 <= 1)
      {
LABEL_9:
        uint64_t v11 = *(void **)(a1 + 328);
        if (!v6)
        {
          if ((unint64_t)[v11 count] < 2)
          {
            [*(id *)(a1 + 328) removeObject:v8];
            uint64_t v18 = *(void *)(a1 + 16);
            if (v18) {
              -[NSGenerationalRowCache removeRowCacheForGenerationWithIdentifier:](*(void *)(v18 + 136), (uint64_t)v8);
            }
            BOOL v13 = 1;
          }

          else
          {
            for (unint64_t i = 1; i < [*(id *)(a1 + 328) count]; ++i)
            {
              uint64_t v17 = [*(id *)(a1 + 328) objectAtIndex:i];
              if (v17)
              {
              }
            }

            BOOL v19 = (void *)objc_msgSend(*(id *)(a1 + 328), "subarrayWithRange:", 0, i);
            uint64_t v20 = (void *)[*(id *)(a1 + 328) copy];
            objc_msgSend(*(id *)(a1 + 328), "removeObjectsInRange:", 0, i);
            if ([*(id *)(a1 + 328) count]
              && -[NSSQLiteConnection _adoptQueryGenerationWithSnapshot:]( a1,  [*(id *)(a1 + 328) firstObject]))
            {
              BOOL v13 = 0;
              [*(id *)(a1 + 328) setArray:v20];
            }

            else
            {
              __int128 v28 = 0u;
              __int128 v29 = 0u;
              __int128 v26 = 0u;
              __int128 v27 = 0u;
              uint64_t v21 = [v19 countByEnumeratingWithState:&v26 objects:v31 count:16];
              if (v21)
              {
                uint64_t v22 = *(void *)v27;
                do
                {
                  for (uint64_t j = 0LL; j != v21; ++j)
                  {
                    if (*(void *)v27 != v22) {
                      objc_enumerationMutation(v19);
                    }
                    uint64_t v24 = *(void *)(a1 + 16);
                    if (v24) {
                      -[NSGenerationalRowCache removeRowCacheForGenerationWithIdentifier:]( *(void *)(v24 + 136),  *(void *)(*((void *)&v26 + 1) + 8 * j));
                    }
                  }

                  uint64_t v21 = [v19 countByEnumeratingWithState:&v26 objects:v31 count:16];
                }

                while (v21);
              }

              BOOL v13 = [*(id *)(a1 + 328) count] == 0;
            }
          }

          goto LABEL_15;
        }

        if (v6 < [v11 count] - 1) {
          [*(id *)(a1 + 328) removeObject:v8];
        }
        uint64_t v12 = *(void *)(a1 + 16);
        if (v12) {
          -[NSGenerationalRowCache removeRowCacheForGenerationWithIdentifier:](*(void *)(v12 + 136), (uint64_t)v8);
        }
      }

      BOOL v13 = 0;
LABEL_15:

      if (v13)
      {
        uint64_t v14 = (void *)+[NSPersistentStoreCoordinator _beginPowerAssertionNamed:withAssert:]( (uint64_t)&OBJC_CLASS___NSPersistentStoreCoordinator,  (uint64_t)@"CoreData: WAL checkpoint",  &v25);
        -[NSSQLiteConnection rollbackTransaction](a1);
        -[NSSQLiteConnection _performPostSaveTasks:andForceFullVacuum:](a1, 0, 0);
        -[NSSQLiteConnection _ensureWalFileExists](a1);
        +[NSPersistentStoreCoordinator _endPowerAssertionWithAssert:andApp:]( (uint64_t)&OBJC_CLASS___NSPersistentStoreCoordinator,  v25,  v14);
      }
    }
  }

  return 0LL;
}

BOOL __56__NSSQLiteConnection_freeQueryGenerationWithIdentifier___block_invoke(uint64_t a1, void *a2)
{
  return [a2 compare:*(void *)(a1 + 32)] == 0;
}

- (unsigned)currentQueryGenerationIdentifier
{
  uint64_t v44 = *MEMORY[0x1895F89C0];
  if (!result) {
    return result;
  }
  uint64_t v1 = (uint64_t)result;
  uint64_t v2 = (dispatch_queue_s *)*((void *)result + 1);
  if (v2) {
    dispatch_assert_queue_V2(v2);
  }
  if (![*(id *)(v1 + 328) count])
  {
    uint64_t v41 = 0LL;
    int v4 = 5;
    do
    {
      -[NSSQLiteConnection connect](v1);
      if (-[NSSQLiteConnection _ensureWalFileExists](v1) < 0)
      {
        uint64_t v19 = 14LL;
      }

      else
      {
        -[NSSQLiteConnection beginReadTransaction](v1);
        uint64_t v41 = 0LL;
        -[NSSQLiteConnection _currentQueryGenerationSnapshot:](v1, &v41);
        uint64_t v3 = (unsigned int *)v5;
        if (v5)
        {
          uint64_t v12 = -[NSSQLiteConnection _adoptQueryGenerationWithSnapshot:](v1, v5);
          uint64_t v19 = v12;
          if (!(_DWORD)v12)
          {
            [*(id *)(v1 + 328) addObject:v3];

            goto LABEL_21;
          }

          _NSCoreDataLog( 1LL,  (uint64_t)@"currentQueryGenerationIdentifier failed to adopt currentQueryGeneration: %d",  v13,  v14,  v15,  v16,  v17,  v18,  v12);
        }

        else
        {
          _NSCoreDataLog( 1LL,  (uint64_t)@"Failed to get a currentQueryGeneration: %@",  v6,  v7,  v8,  v9,  v10,  v11,  v41);
          uint64_t v19 = 0LL;
        }

        -[NSSQLiteConnection rollbackTransaction](v1);
      }

      --v4;
    }

    while (v4);
    if (v41)
    {
      uint64_t v20 = [NSString stringWithUTF8String:"currentQueryGenerationIdentifier failed with NSError: %@"];
      _NSCoreDataLog(17LL, v20, v21, v22, v23, v24, v25, v26, v41);
      uint64_t v27 = __pflogFaultLog;
      if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 138412290;
        uint64_t v43 = v41;
        __int128 v28 = "CoreData: currentQueryGenerationIdentifier failed with NSError: %@";
        __int128 v29 = (os_log_s *)v27;
        uint32_t v30 = 12;
LABEL_27:
        _os_log_fault_impl(&dword_186681000, v29, OS_LOG_TYPE_FAULT, v28, buf, v30);
      }
    }

    else
    {
      uint64_t v31 = [NSString stringWithUTF8String:"currentQueryGenerationIdentifier failed with sqlite error: %d"];
      _NSCoreDataLog(17LL, v31, v32, v33, v34, v35, v36, v37, v19);
      uint64_t v38 = __pflogFaultLog;
      if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 67109120;
        LODWORD(v43) = v19;
        __int128 v28 = "CoreData: currentQueryGenerationIdentifier failed with sqlite error: %d";
        __int128 v29 = (os_log_s *)v38;
        uint32_t v30 = 8;
        goto LABEL_27;
      }
    }

    uint64_t v3 = 0LL;
    goto LABEL_21;
  }

  uint64_t v3 = (unsigned int *)[*(id *)(v1 + 328) lastObject];
LABEL_21:
  if (v3)
  {
    __int128 v39 = v3 + 4;
    do
      unsigned int v40 = __ldxr(v39);
    while (__stxr(v40 + 1, v39));
  }

  return v3;
}

- (uint64_t)adoptQueryGenerationWithIdentifier:(uint64_t)result
{
  if (result)
  {
    uint64_t v3 = result;
    int v4 = *(dispatch_queue_s **)(result + 8);
    if (v4) {
      dispatch_assert_queue_V2(v4);
    }
    if ((*(_BYTE *)(v3 + 313) & 2) == 0)
    {
      uint64_t v5 = sqlite3_snapshot_recover(*(sqlite3 **)(v3 + 72), "main");
      if ((_DWORD)v5 && (uint64_t v6 = v5, readFileSizeFromJournalHandle(*(sqlite3 **)(v3 + 72)) >= 1)) {
        _NSCoreDataLog(1LL, (uint64_t)@"sqlite3_snapshot_recover failed with %d", v7, v8, v9, v10, v11, v12, v6);
      }
      else {
        *(_DWORD *)(v3 + 312) |= 0x200u;
      }
    }

    return -[NSSQLiteConnection _adoptQueryGenerationWithSnapshot:](v3, a2);
  }

  return result;
}

- (void)reopenQueryGenerationWithIdentifier:(void *)a3 error:
{
  if (a1)
  {
    uint64_t v6 = *(dispatch_queue_s **)(a1 + 8);
    if (v6) {
      dispatch_assert_queue_V2(v6);
    }
    if (a2)
    {
      if (*(void *)(a1 + 72))
      {
        int v7 = *(unsigned __int8 *)(a1 + 40);
        uint64_t v8 = (sqlite3_snapshot *)[a2 bytes];
        if (v8)
        {
          if (+[NSSQLCore debugDefault](&OBJC_CLASS___NSSQLCore, "debugDefault") >= 1) {
            NSLog((NSString *)@"connection %p attempting to reopen snapshot: %p", a1, v8);
          }
          if (!v7) {
            -[NSSQLiteConnection beginReadTransaction](a1);
          }
          if ((*(_BYTE *)(a1 + 313) & 2) == 0)
          {
            uint64_t v9 = sqlite3_snapshot_recover(*(sqlite3 **)(a1 + 72), "main");
            if ((_DWORD)v9 && readFileSizeFromJournalHandle(*(sqlite3 **)(a1 + 72)) >= 1) {
              _NSCoreDataLog( 1LL,  (uint64_t)@"sqlite3_snapshot_recover failed with %d",  v10,  v11,  v12,  v13,  v14,  v15,  v9);
            }
            else {
              *(_DWORD *)(a1 + 312) |= 0x200u;
            }
          }

          while (1)
          {
            uint64_t v16 = sqlite3_snapshot_open(*(sqlite3 **)(a1 + 72), "main", v8);
            uint64_t v23 = v16;
            usleep(0x64u);
          }

          if ((_BYTE)v16)
          {
LABEL_24:
            _NSCoreDataLog( 1LL,  (uint64_t)@"Attempt to reopen sqlite3_snapshot_open failed %d",  v17,  v18,  v19,  v20,  v21,  v22,  v16);
            if (a3)
            {
              uint64_t v25 = (void *)MEMORY[0x189607870];
              uint64_t v26 = objc_msgSend( MEMORY[0x189603F68],  "dictionaryWithObjectsAndKeys:",  objc_msgSend(MEMORY[0x189607968], "numberWithInt:", v23),  @"NSSQLiteErrorDomain",  0);
              *a3 = [v25 errorWithDomain:*MEMORY[0x189607460] code:134180 userInfo:v26];
              if (v7) {
                return;
              }
            }

            else if (v7)
            {
              return;
            }

            goto LABEL_30;
          }

          -[NSSQLCore _registerNewQueryGenerationSnapshot:](*(void *)(a1 + 16), (uint64_t)a2);
          if (v7) {
            return;
          }
LABEL_30:
          -[NSSQLiteConnection rollbackTransaction](a1);
        }
      }

      else
      {
        objc_exception_throw((id)[MEMORY[0x189603F70] exceptionWithName:*MEMORY[0x189603A58] reason:@"database connection must not be nil here" userInfo:0]);
        __break(1u);
      }
    }
  }

uint64_t __40__NSSQLiteConnection__activeGenerations__block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) addObject:a2];
}

- (uint64_t)_dropAllTriggers
{
  uint64_t v13 = *MEMORY[0x1895F89C0];
  if (result)
  {
    uint64_t v1 = result;
    id v2 = -[NSSQLiteConnection fetchCreationSQLForType:containing:](result, (uint64_t)@"trigger", 0LL);
    uint64_t result = [v2 count];
    if (result)
    {
      __int128 v10 = 0u;
      __int128 v11 = 0u;
      __int128 v8 = 0u;
      __int128 v9 = 0u;
      uint64_t result = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
      if (result)
      {
        uint64_t v3 = result;
        uint64_t v4 = *(void *)v9;
        do
        {
          uint64_t v5 = 0LL;
          do
          {
            if (*(void *)v9 != v4) {
              objc_enumerationMutation(v2);
            }
            uint64_t v6 = *(void **)(*((void *)&v8 + 1) + 8 * v5);
            if ([v6 count] == 2)
            {
              int v7 = (void *)objc_msgSend((id)objc_msgSend(v6, "lastObject"), "componentsSeparatedByString:", @" ");
              if ((unint64_t)[v7 count] >= 4)
              {
                if (objc_msgSend( (id)objc_msgSend(v7, "objectAtIndexedSubscript:", 2),  "hasPrefix:",  @"Z")) {
                  -[NSSQLiteConnection _executeSQLString:]( v1,  (void *)[NSString stringWithFormat:@"DROP TRIGGER %@", objc_msgSend(v7, "objectAtIndexedSubscript:", 2)]);
                }
              }
            }

            ++v5;
          }

          while (v3 != v5);
          uint64_t result = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
          uint64_t v3 = result;
        }

        while (result);
      }
    }
  }

  return result;
}

- (uint64_t)_dropAllDATriggers
{
  uint64_t v14 = *MEMORY[0x1895F89C0];
  if (result)
  {
    uint64_t v1 = result;
    id v2 = -[NSSQLiteConnection fetchCreationSQLForType:containing:](result, (uint64_t)@"trigger", 0LL);
    uint64_t result = [v2 count];
    if (result)
    {
      __int128 v11 = 0u;
      __int128 v12 = 0u;
      __int128 v9 = 0u;
      __int128 v10 = 0u;
      uint64_t result = [v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
      if (result)
      {
        uint64_t v3 = result;
        uint64_t v4 = *(void *)v10;
        do
        {
          uint64_t v5 = 0LL;
          do
          {
            if (*(void *)v10 != v4) {
              objc_enumerationMutation(v2);
            }
            uint64_t v6 = *(void **)(*((void *)&v9 + 1) + 8 * v5);
            if ([v6 count] == 2)
            {
              int v7 = (void *)objc_msgSend((id)objc_msgSend(v6, "lastObject"), "componentsSeparatedByString:", @" ");
              if ((unint64_t)[v7 count] >= 4)
              {
                __int128 v8 = (void *)[v7 objectAtIndexedSubscript:2];
                if (([v8 hasPrefix:@"Z_DA_"] & 1) != 0
                  || [v8 hasPrefix:@"Z"]
                  && ([v8 hasPrefix:@"Z_RT_"] & 1) == 0
                  && ([v8 hasPrefix:@"ZT_"] & 1) == 0
                  && (([v8 hasSuffix:@"INSERT"] & 1) != 0
                   || ([v8 hasSuffix:@"UPDATE"] & 1) != 0
                   || ([v8 hasSuffix:@"DELETE"] & 1) != 0
                   || ([v8 hasSuffix:@"SET"] & 1) != 0
                   || [v8 hasSuffix:@"UNSET"]))
                {
                  -[NSSQLiteConnection _executeSQLString:]( v1,  (void *)[NSString stringWithFormat:@"DROP TRIGGER %@", v8]);
                }
              }
            }

            ++v5;
          }

          while (v3 != v5);
          uint64_t result = [v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
          uint64_t v3 = result;
        }

        while (result);
      }
    }
  }

  return result;
}

- (void)triggerUpdatedRowInTable:(uint64_t)a3 withEntityID:(uint64_t)a4 primaryKey:columnName:newValue:
{
  if (a1)
  {
    uint64_t v6 = objc_msgSend((id)objc_msgSend(*(id *)(a1 + 16), "model"), "entityForID:", a3);
    if (v6)
    {
      id v7 = (id)[*(id *)(a1 + 16) newObjectIDForEntity:v6 pk:a4];
      [*(id *)(a1 + 168) addObject:v7];
    }
  }

- (void)derivedAttributeUpdatedInsertedRowInTable:(uint64_t)a3 withEntityID:(uint64_t)a4 primaryKey:(uint64_t)a5 columnName:(uint64_t)a6 newValue:
{
  v13[3] = *MEMORY[0x1895F89C0];
  if (a1)
  {
    uint64_t v10 = objc_msgSend((id)objc_msgSend(*(id *)(a1 + 16), "model"), "entityForID:", a3);
    if (v10)
    {
      __int128 v11 = (void *)[*(id *)(a1 + 16) newObjectIDForEntity:v10 pk:a4];
      __int128 v12 = *(void **)(a1 + 176);
      v13[0] = v11;
      v13[1] = objc_msgSend(NSString, "stringWithFormat:", @"%s", a5);
      if (!a6) {
        a6 = [MEMORY[0x189603FE8] null];
      }
      v13[2] = a6;
      objc_msgSend(v12, "addObject:", objc_msgSend(MEMORY[0x189603F18], "arrayWithObjects:count:", v13, 3));
    }
  }

- (void)derivedAttributeUpdatedRowInTable:(uint64_t)a3 withEntityID:(uint64_t)a4 primaryKey:(uint64_t)a5 columnName:(uint64_t)a6 newValue:
{
  v13[3] = *MEMORY[0x1895F89C0];
  if (a1)
  {
    uint64_t v10 = objc_msgSend((id)objc_msgSend(*(id *)(a1 + 16), "model"), "entityForID:", a3);
    if (v10)
    {
      __int128 v11 = (void *)[*(id *)(a1 + 16) newObjectIDForEntity:v10 pk:a4];
      __int128 v12 = *(void **)(a1 + 184);
      v13[0] = v11;
      v13[1] = objc_msgSend(NSString, "stringWithFormat:", @"%s", a5);
      if (!a6) {
        a6 = [MEMORY[0x189603FE8] null];
      }
      v13[2] = a6;
      objc_msgSend(v12, "addObject:", objc_msgSend(MEMORY[0x189603F18], "arrayWithObjects:count:", v13, 3));
    }
  }

- (id)createArrayOfPrimaryKeysAndEntityIDsForRowsWithoutRecordMetadataWithEntity:(id *)a3 metadataEntity:
{
  v35[2] = *MEMORY[0x1895F89C0];
  if (!a1) {
    return 0LL;
  }
  id v32 = objc_alloc_init(MEMORY[0x189603FA8]);
  -[NSSQLiteConnection connect](a1);
  if (a2)
  {
    uint64_t v6 = (void *)a2[16];
    id v7 = (void *)a2[17];
    if (a3) {
      goto LABEL_4;
    }
LABEL_21:
    __int128 v8 = 0LL;
    __int128 v9 = 0LL;
    if (!v6) {
      goto LABEL_22;
    }
    goto LABEL_5;
  }

  uint64_t v6 = 0LL;
  id v7 = 0LL;
  if (!a3) {
    goto LABEL_21;
  }
LABEL_4:
  __int128 v8 = (void *)[a3[5] objectForKey:@"entityPK"];
  __int128 v9 = (void *)[a3[5] objectForKey:@"entityId"];
  if (!v6) {
    goto LABEL_22;
  }
LABEL_5:
  if (!v7 || !v8 || !v9)
  {
LABEL_22:
    objc_exception_throw((id)[MEMORY[0x189603F70] exceptionWithName:*MEMORY[0x189603A58] reason:@"Missing one or more columns to query record metadata for missing rows" userInfo:0]);
    __break(1u);
    JUMPOUT(0x18680C890LL);
  }

  uint64_t exception_object = objc_msgSend( (id)objc_msgSend(a2, "tableName"),  "stringByAppendingFormat:",  @".%@",  objc_msgSend(v6, "columnName"));
  uint64_t v30 = objc_msgSend( (id)objc_msgSend(a2, "tableName"),  "stringByAppendingFormat:",  @".%@",  objc_msgSend(v7, "columnName"));
  uint64_t v10 = objc_msgSend( (id)objc_msgSend(a3, "tableName"),  "stringByAppendingFormat:",  @".%@",  objc_msgSend(v8, "columnName"));
  uint64_t v11 = objc_msgSend( (id)objc_msgSend(a3, "tableName"),  "stringByAppendingFormat:",  @".%@",  objc_msgSend(v9, "columnName"));
  uint64_t v12 = [NSString stringWithFormat:@"SELECT %@, %@, %@, %@ FROM %@ LEFT JOIN %@ ON %@ = %@ AND %@ = %@", exception_object, v30, v10, v11, objc_msgSend(a2, "tableName"), objc_msgSend(a3, "tableName"), exception_object, v10, v30, v11];
  uint64_t v13 = -[NSSQLiteAdapter newStatementWithSQLString:]( (NSSQLiteStatement *)[(id)a1 adapter],  objc_msgSend( NSString,  "stringWithFormat:",  @"SELECT %@, %@ FROM (%@) WHERE %@ IS NULL AND %@ IS NULL",  objc_msgSend(v6, "columnName"),  objc_msgSend(v7, "columnName"),  v12,  objc_msgSend(v8, "columnName"),  objc_msgSend(v9, "columnName")));
  id v14 = objc_alloc_init(MEMORY[0x189603FA8]);
  uint64_t v15 = -[NSSQLColumn initWithColumnName:sqlType:]( objc_alloc(&OBJC_CLASS___NSSQLColumn),  "initWithColumnName:sqlType:",  exception_object,  2LL);
  [v14 addObject:v15];

  uint64_t v16 = -[NSSQLColumn initWithColumnName:sqlType:]( objc_alloc(&OBJC_CLASS___NSSQLColumn),  "initWithColumnName:sqlType:",  v30,  2LL);
  [v14 addObject:v16];

  -[NSSQLiteConnection _ensureDatabaseOpen]((void *)a1);
  -[NSSQLiteConnection _ensureNoStatementPrepared](a1);
  -[NSSQLiteConnection _ensureNoTransactionOpen](a1);
  -[NSSQLiteConnection _ensureNoFetchInProgress](a1);
  -[NSSQLiteConnection beginReadTransaction](a1);
  -[NSSQLiteConnection setColumnsToFetch:]((void *)a1, v14);
  -[NSSQLiteConnection prepareSQLStatement:](a1, v13);
  if (+[NSSQLCore debugDefault](&OBJC_CLASS___NSSQLCore, "debugDefault") >= 4) {
    -[NSSQLiteConnection logQueryPlanForStatement:](a1, v13);
  }
  [(id)a1 execute];
  while (1)
  {
    uint64_t v17 = -[NSSQLiteConnection newFetchedArray](a1);
    uint64_t v18 = v17;
    if (!v17) {
      break;
    }
    if ([v17 count] == 2)
    {
      uint64_t v19 = [v18 objectAtIndexedSubscript:0];
      uint64_t v20 = [v18 objectAtIndexedSubscript:1];
      v35[0] = v19;
      v35[1] = v20;
      objc_msgSend(v32, "addObject:", objc_msgSend(MEMORY[0x189603F18], "arrayWithObjects:count:", v35, 2));
    }

    else
    {
      uint64_t v21 = [NSString stringWithUTF8String:"Missing metadata query got an unexpected number of columns in the result: %@"];
      _NSCoreDataLog(17LL, v21, v22, v23, v24, v25, v26, v27, (uint64_t)v18);
      __int128 v28 = (os_log_s *)__pflogFaultLog;
      if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 138412290;
        uint64_t v34 = v18;
        _os_log_fault_impl( &dword_186681000,  v28,  OS_LOG_TYPE_FAULT,  "CoreData: Missing metadata query got an unexpected number of columns in the result: %@",  buf,  0xCu);
      }
    }
  }

  -[NSSQLiteConnection releaseSQLStatement](a1);
  -[NSSQLiteConnection setColumnsToFetch:]((void *)a1, 0LL);
  *(_DWORD *)(a1 + 312) &= ~2u;
  *(void *)(a1 + 100) = 0LL;
  *(void *)(a1 + 92) = 0LL;
  *(_DWORD *)(a1 + 108) = 0;
  -[NSSQLiteConnection rollbackTransaction](a1);

  return v32;
}

- (uint64_t)dedupeRowsForUniqueConstraintsInCloudKitMetadataEntity:(uint64_t)result
{
  uint64_t v18 = *MEMORY[0x1895F89C0];
  if (result)
  {
    uint64_t v3 = result;
    if (a2)
    {
      if ([*(id *)(a2 + 208) count])
      {
LABEL_8:
        uint64_t v13 = *(void **)(a2 + 216);
LABEL_9:
        v15[0] = MEMORY[0x1895F87A8];
        v15[1] = 3221225472LL;
        v15[2] = __77__NSSQLiteConnection_dedupeRowsForUniqueConstraintsInCloudKitMetadataEntity___block_invoke;
        v15[3] = &unk_189EA7518;
        v15[4] = v3;
        v15[5] = a2;
        return [v13 enumerateObjectsUsingBlock:v15];
      }

      uint64_t v4 = *(void **)(a2 + 216);
    }

    else
    {
      uint64_t v14 = [0 count];
      uint64_t v4 = 0LL;
      uint64_t v13 = 0LL;
      if (v14) {
        goto LABEL_9;
      }
    }

    if (![v4 count]
      && (v5 = [NSString stringWithUTF8String:"Entity marked as needing unique constraint coalescing but does not appear to be uniqued: %@"],  _NSCoreDataLog(17, v5, v6, v7, v8, v9, v10, v11, a2),  uint64_t v12 = (os_log_s *)__pflogFaultLog,  os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT)))
    {
      *(_DWORD *)buf = 138412290;
      uint64_t v17 = a2;
      _os_log_fault_impl( &dword_186681000,  v12,  OS_LOG_TYPE_FAULT,  "CoreData: Entity marked as needing unique constraint coalescing but does not appear to be uniqued: %@",  buf,  0xCu);
      if (a2) {
        goto LABEL_8;
      }
    }

    else if (a2)
    {
      goto LABEL_8;
    }

    uint64_t v13 = 0LL;
    goto LABEL_9;
  }

  return result;
}

void __77__NSSQLiteConnection_dedupeRowsForUniqueConstraintsInCloudKitMetadataEntity___block_invoke( uint64_t a1,  void *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (v2)
  {
    uint64_t v4 = *(id **)(a1 + 40);
    id v17 = objc_alloc_init(MEMORY[0x189603FA8]);
    if (v4) {
      id v5 = v4[16];
    }
    else {
      id v5 = 0LL;
    }
    [v17 addObject:v5];
    uint64_t v6 = (void *)[objc_alloc(MEMORY[0x189607940]) initWithFormat:@"SELECT %@, ", objc_msgSend((id)objc_msgSend(v17, "objectAtIndexedSubscript:", 0), "columnName")];
    id v7 = objc_alloc(MEMORY[0x189607940]);
    if (v4)
    {
      uint64_t v8 = [v4[16] columnName];
      uint64_t v9 = [v4[16] columnName];
      id v10 = v4[16];
    }

    else
    {
      uint64_t v8 = [0 columnName];
      uint64_t v9 = [0 columnName];
      id v10 = 0LL;
    }

    uint64_t v11 = (void *)[v7 initWithFormat:@"SELECT COUNT(DISTINCT(%@)) AS COUNT, MIN(%@) AS %@, ", v8, v9, objc_msgSend(v10, "columnName")];
    uint64_t v12 = (void *)[objc_alloc(MEMORY[0x189607940]) initWithString:@"GROUP BY "];
    uint64_t v13 = MEMORY[0x1895F87A8];
    v19[0] = MEMORY[0x1895F87A8];
    v19[1] = 3221225472LL;
    v19[2] = __77__NSSQLiteConnection_dedupeRowsForUniqueConstraint_inCloudKitMetadataEntity___block_invoke;
    v19[3] = &unk_189EAA448;
    v19[4] = v17;
    v19[5] = v11;
    v19[6] = v12;
    v19[7] = v6;
    [a2 enumerateObjectsUsingBlock:v19];
    [v11 appendFormat:@" FROM %@ %@ ORDER BY COUNT DESC", objc_msgSend(v4, "tableName"), v12];
    [v6 appendFormat:@" FROM (%@) WHERE COUNT > 1;", v11];
    uint64_t v14 = -[NSSQLiteStatement initWithEntity:sqlString:]( objc_alloc(&OBJC_CLASS___NSSQLiteStatement),  "initWithEntity:sqlString:",  v4,  v6);
    id v15 = objc_alloc_init(MEMORY[0x189603FA8]);
    -[NSSQLiteConnection prepareSQLStatement:](v2, v14);
    [(id)v2 execute];
    -[NSSQLiteConnection setColumnsToFetch:]((void *)v2, v17);
    while (1)
    {
      uint64_t v16 = -[NSSQLiteConnection newFetchedArray](v2);
      if (!v16) {
        break;
      }
      [v15 addObject:v16];
    }

    -[NSSQLiteConnection setColumnsToFetch:]((void *)v2, 0LL);
    *(_DWORD *)(v2 + 312) &= ~2u;
    *(void *)(v2 + 100) = 0LL;
    *(void *)(v2 + 92) = 0LL;
    *(_DWORD *)(v2 + 108) = 0;
    -[NSSQLiteConnection _finalizeStatement](v2);
    -[NSSQLiteConnection resetSQLStatement](v2);

    v18[0] = v13;
    v18[1] = 3221225472LL;
    v18[2] = __77__NSSQLiteConnection_dedupeRowsForUniqueConstraint_inCloudKitMetadataEntity___block_invoke_2;
    v18[3] = &unk_189EAA470;
    v18[4] = v4;
    v18[5] = v17;
    v18[6] = v2;
    [v15 enumerateObjectsUsingBlock:v18];
  }

uint64_t __77__NSSQLiteConnection_dedupeRowsForUniqueConstraint_inCloudKitMetadataEntity___block_invoke( id *a1,  void *a2,  uint64_t a3)
{
  if (a3)
  {
    objc_msgSend(a1[5], "appendString:", @", ");
    objc_msgSend(a1[6], "appendString:", @", ");
    objc_msgSend(a1[7], "appendString:", @", ");
  }

  objc_msgSend(a1[5], "appendString:", objc_msgSend(a2, "columnName"));
  objc_msgSend(a1[6], "appendString:", objc_msgSend(a2, "columnName"));
  return objc_msgSend(a1[7], "appendString:", objc_msgSend(a2, "columnName"));
}

void __77__NSSQLiteConnection_dedupeRowsForUniqueConstraint_inCloudKitMetadataEntity___block_invoke_2( uint64_t a1,  void *a2)
{
  id v5 = (id)[objc_alloc(MEMORY[0x189607940]) initWithFormat:@"DELETE FROM %@ WHERE ", objc_msgSend(*(id *)(a1 + 32), "tableName")];
  v6[0] = MEMORY[0x1895F87A8];
  v6[1] = 3221225472LL;
  v6[2] = __77__NSSQLiteConnection_dedupeRowsForUniqueConstraint_inCloudKitMetadataEntity___block_invoke_3;
  v6[3] = &unk_189EA7518;
  v6[4] = *(void *)(a1 + 40);
  v6[5] = v5;
  [a2 enumerateObjectsUsingBlock:v6];
  uint64_t v4 = -[NSSQLiteStatement initWithEntity:sqlString:]( objc_alloc(&OBJC_CLASS___NSSQLiteStatement),  "initWithEntity:sqlString:",  *(void *)(a1 + 32),  v5);
  -[NSSQLiteConnection prepareAndExecuteSQLStatement:](*(void *)(a1 + 48), v4);
}

void __77__NSSQLiteConnection_dedupeRowsForUniqueConstraint_inCloudKitMetadataEntity___block_invoke_3( uint64_t a1,  void *a2,  uint64_t a3)
{
  uint64_t v19 = *MEMORY[0x1895F89C0];
  uint64_t v6 = (void *)objc_msgSend(*(id *)(a1 + 32), "objectAtIndexedSubscript:");
  if (a3) {
    [*(id *)(a1 + 40) appendString:@" AND "];
  }
  if ([a2 isNSString])
  {
    [*(id *)(a1 + 40) appendFormat:@"%@ = '%@'", objc_msgSend(v6, "columnName"), a2];
  }

  else if ([a2 isNSNumber])
  {
    [*(id *)(a1 + 40) appendFormat:@"%@ = %@", objc_msgSend(v6, "columnName"), a2];
  }

  else
  {
    uint64_t v7 = [NSString stringWithUTF8String:"CloudKit: Deduping for metadata entity doesn't know how to handle this type of object yet: %@ - %@"];
    _NSCoreDataLog(17LL, v7, v8, v9, v10, v11, v12, v13, (uint64_t)v6);
    uint64_t v14 = (os_log_s *)__pflogFaultLog;
    if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 138412546;
      uint64_t v16 = v6;
      __int16 v17 = 2112;
      uint64_t v18 = a2;
      _os_log_fault_impl( &dword_186681000,  v14,  OS_LOG_TYPE_FAULT,  "CoreData: CloudKit: Deduping for metadata entity doesn't know how to handle this type of object yet: %@ - %@",  buf,  0x16u);
    }
  }

@end