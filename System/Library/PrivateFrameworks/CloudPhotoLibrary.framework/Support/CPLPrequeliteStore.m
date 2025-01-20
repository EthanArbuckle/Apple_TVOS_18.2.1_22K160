@interface CPLPrequeliteStore
+ (BOOL)shouldDoCleanUpImmediately;
+ (BOOL)shouldPreventWipeOnUpgrade;
+ (BOOL)shouldWarnUserBeforeWipeOnUpgrade;
+ (id)_wipeStoreMarkerURLWithCloudLibraryStateStorageURL:(id)a3;
+ (void)_writeStoreMarkerAtURL:(id)a3 reason:(id)a4;
+ (void)setShouldDoCleanUpImmediately:(BOOL)a3;
+ (void)setShouldPreventWipeOnUpgrade:(BOOL)a3;
+ (void)setShouldWarnUserBeforeWipeOnUpgrade:(BOOL)a3;
+ (void)wipeStoreAtNextOpeningWithCloudLibraryStorageURL:(id)a3 reason:(id)a4;
- (BOOL)_closeWipeAndReOpenWithReason:(id)a3 warnUserIfPossible:(BOOL)a4 createRadar:(BOOL)a5 error:(id *)a6;
- (BOOL)_fix22666940;
- (BOOL)_fixStoreAfterAnyVersionChange;
- (BOOL)_hasDeactivateMarker;
- (BOOL)_initializeDB;
- (BOOL)_openWithError:(id *)a3;
- (BOOL)_performWithFlags:(unsigned int)a3 action:(id)a4;
- (BOOL)_postUpgradeToVersion:(int64_t)a3;
- (BOOL)_setupDBIfNeeded;
- (BOOL)_setupPragmasAndFunctions;
- (BOOL)_upgradeDB:(int64_t)a3;
- (BOOL)_upgradeToVersion:(int64_t)a3;
- (BOOL)_wipeIfDeactivated:(int64_t)a3 didWipeDatabase:(BOOL *)a4 error:(id *)a5;
- (BOOL)addGlobalVariable:(id)a3 defaultValue:(id)a4 error:(id *)a5;
- (BOOL)closeWithError:(id *)a3;
- (BOOL)createStoragesDynamically:(id)a3 error:(id *)a4;
- (BOOL)deleteDynamicallyCreatedStorages:(id)a3 error:(id *)a4;
- (BOOL)executePostOpenWithError:(id *)a3;
- (BOOL)hasStoredChangeSessionUpdate;
- (BOOL)hasTable:(id)a3;
- (BOOL)isClientInSyncWithClientCache;
- (BOOL)markDatabaseAsDeactivatedWithError:(id *)a3;
- (BOOL)openWithError:(id *)a3;
- (BOOL)performPostUpgradeMigrationsWithError:(id *)a3;
- (BOOL)resetValueForGlobalVariable:(id)a3 error:(id *)a4;
- (BOOL)setShouldUpdateDisabledFeaturesWithError:(id *)a3;
- (BOOL)setValue:(id)a3 forGlobalVariable:(id)a4 error:(id *)a5;
- (BOOL)shouldUpdateDisabledFeatures;
- (BOOL)storeChangeSessionUpdate:(id)a3 error:(id *)a4;
- (BOOL)storeClientCacheIdentifier:(id)a3 error:(id *)a4;
- (BOOL)storeClientIsInSyncWithClientCacheWithError:(id *)a3;
- (BOOL)storeClientIsNotInSyncWithClientCacheWithError:(id *)a3;
- (BOOL)storeDerivativesFilter:(id)a3 error:(id *)a4;
- (BOOL)storeDisabledFeatures:(id)a3 error:(id *)a4;
- (BOOL)storeLastQuarantineCountReportDate:(id)a3 error:(id *)a4;
- (BOOL)storeLibraryVersion:(id)a3 withError:(id *)a4;
- (BOOL)storePushPullGatekeepers:(id)a3 error:(id *)a4;
- (BOOL)storeUserIdentifier:(id)a3 error:(id *)a4;
- (BOOL)table:(id)a3 hasColumnWithName:(id)a4;
- (BOOL)table:(id)a3 hasRecordsMatchingQuery:(id)a4;
- (BOOL)tableHasRecords:(id)a3;
- (BOOL)updateLibraryOptions:(unint64_t)a3 error:(id *)a4;
- (CPLChangeSessionUpdate)storedChangeSessionUpdate;
- (CPLPrequeliteStore)initWithAbstractObject:(id)a3;
- (Class)_userIdentifierClass;
- (NSArray)pushPullGatekeepers;
- (NSDate)libraryCreationDate;
- (NSString)description;
- (NSURL)deactivateMarkerURL;
- (id)_corruptionMarkerURL;
- (id)_transactionStatsDescription;
- (id)_wipeReasonFromCorruptionInfo:(id)a3;
- (id)_wipeStoreMarkerURL;
- (id)clientCache;
- (id)clientCacheIdentifier;
- (id)cloudCache;
- (id)corruptionInfo;
- (id)createNewClientCacheIdentifier;
- (id)createNewLibraryVersion;
- (id)derivativesFilter;
- (id)disabledFeatures;
- (id)lastQuarantineCountReportDate;
- (id)libraryVersion;
- (id)pqlConnection;
- (id)redactedDescription;
- (id)status;
- (id)transientPullRepository;
- (id)userIdentifier;
- (id)valueForGlobalVariable:(id)a3;
- (id)wipeReason;
- (int64_t)_sizeInBytes;
- (unint64_t)libraryOptions;
- (unint64_t)table:(id)a3 countOfRecordsMatchingQuery:(id)a4;
- (unint64_t)tableCountOfRecords:(id)a3;
- (void)_addPostUpgradeMigration:(id)a3;
- (void)_cacheValue:(id)a3 forVariable:(id)a4;
- (void)_closeUpgradeJournal;
- (void)_deleteCorruptionInfo;
- (void)_deleteWipeReason;
- (void)_markLibraryAsCorruptedWithInfo:(id)a3;
- (void)_notifyVacuumDidComplete;
- (void)_openUpgradeJournal;
- (void)_scheduleClientCacheDrop;
- (void)_scheduleClientCacheDropIfNecessary;
- (void)_setupProfilingHooks;
- (void)_unsetupProfilingHooks;
- (void)_vacuum:(int64_t)a3 withInitialDatabaseSize:(int64_t)a4;
- (void)_wipeBeforeOpeningIfNecessary;
- (void)_wipeWithReason:(id)a3;
- (void)blockWriteTransactionsWithCompletionHandler:(id)a3;
- (void)emergencyClose;
- (void)markAsCorrupted;
- (void)performBarrier;
- (void)performBarrierTransaction:(id)a3 withBlock:(id)a4;
- (void)performReadTransaction:(id)a3 withBlock:(id)a4;
- (void)performWriteTransaction:(id)a3 withBlock:(id)a4 completionHandler:(id)a5;
- (void)recordUpgradeEvent:(id)a3;
- (void)recordUpgradeEvent:(id)a3 arguments:(char *)a4;
- (void)startVacuumWithCompletionHandler:(id)a3;
- (void)stopVacuum;
- (void)table:(id)a3 enumerateCountGroupedByProperty:(id)a4 block:(id)a5;
- (void)table:(id)a3 enumerateCountGroupedByUnsignedIntegerProperty:(id)a4 block:(id)a5;
- (void)triggerResetAfterUpgrade:(unint64_t)a3 withReason:(id)a4;
- (void)wipeStoreAtNextOpeningWithReason:(id)a3 completionBlock:(id)a4;
- (void)writeTransactionDidFail;
- (void)writeTransactionDidSucceed;
@end

@implementation CPLPrequeliteStore

- (void)_addPostUpgradeMigration:(id)a3
{
  id v4 = a3;
  id v8 = v4;
  if (!self->_postUpgradeMigrations)
  {
    v5 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
    postUpgradeMigrations = self->_postUpgradeMigrations;
    self->_postUpgradeMigrations = v5;

    id v4 = v8;
  }

  v7 = (void *)objc_claimAutoreleasedReturnValue([v4 migrationDescription]);
  -[CPLPrequeliteStore recordUpgradeEvent:](self, "recordUpgradeEvent:", @"Will need to perform %@", v7);

  -[NSMutableArray addObject:](self->_postUpgradeMigrations, "addObject:", v8);
}

+ (BOOL)shouldPreventWipeOnUpgrade
{
  int has_internal_content = os_variant_has_internal_content("com.apple.cpl.preventwipe");
  if (has_internal_content)
  {
    if ((byte_1002A3A88 & 1) == 0)
    {
      v3 = -[NSUserDefaults initWithSuiteName:]( objc_alloc(&OBJC_CLASS___NSUserDefaults),  "initWithSuiteName:",  @"com.apple.TVPhotos");
      byte_1002A3A89 = -[NSUserDefaults BOOLForKey:](v3, "BOOLForKey:", @"com.apple.Photos.PreventRebuild");
      byte_1002A3A88 = 1;
    }

    LOBYTE(has_internal_content) = byte_1002A3A89 != 0;
  }

  return has_internal_content;
}

+ (void)setShouldPreventWipeOnUpgrade:(BOOL)a3
{
  byte_1002A3A89 = a3;
  byte_1002A3A88 = 1;
}

+ (BOOL)shouldWarnUserBeforeWipeOnUpgrade
{
  return byte_1002A3A8A;
}

+ (void)setShouldWarnUserBeforeWipeOnUpgrade:(BOOL)a3
{
  byte_1002A3A8A = a3;
}

+ (void)setShouldDoCleanUpImmediately:(BOOL)a3
{
  byte_1002A3A8B = a3;
}

+ (BOOL)shouldDoCleanUpImmediately
{
  return byte_1002A3A8B;
}

- (CPLPrequeliteStore)initWithAbstractObject:(id)a3
{
  v86.receiver = self;
  v86.super_class = (Class)&OBJC_CLASS___CPLPrequeliteStore;
  v3 = -[CPLPrequeliteStore initWithAbstractObject:](&v86, "initWithAbstractObject:", a3);
  id v4 = v3;
  if (v3)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[CPLPrequeliteStore abstractObject](v3, "abstractObject"));
    v6 = (void *)objc_claimAutoreleasedReturnValue([v5 engineLibrary]);
    v7 = (void *)objc_claimAutoreleasedReturnValue([v6 cloudLibraryStateStorageURL]);

    id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 URLByAppendingPathComponent:@"store.cloudphotodb" isDirectory:0]);
    v9 = (NSURL *)[v8 copy];
    dbURL = v4->_dbURL;
    v4->_dbURL = v9;

    uint64_t v12 = CPLCopyDefaultSerialQueueAttributes(v11);
    v13 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v12);
    dispatch_queue_t v14 = dispatch_queue_create("com.apple.cplenginestore.sqlite", v13);
    queue = v4->_queue;
    v4->_queue = (OS_dispatch_queue *)v14;

    uint64_t v17 = CPLCopyDefaultSerialQueueAttributes(v16);
    v18 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v17);
    dispatch_queue_t v19 = dispatch_queue_create_with_target_V2( "com.apple.cplenginestore.sqlite.write",  v18,  (dispatch_queue_t)v4->_queue);
    writeQueue = v4->_writeQueue;
    v4->_writeQueue = (OS_dispatch_queue *)v19;

    v4->_emergencyCloseLock._os_unfair_lock_opaque = 0;
    uint64_t v22 = CPLCopyDefaultSerialQueueAttributes(v21);
    v23 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v22);
    dispatch_queue_t v24 = dispatch_queue_create("com.apple.cplenginestore.sqlite.vacuum", v23);
    vacuumQueue = v4->_vacuumQueue;
    v4->_vacuumQueue = (OS_dispatch_queue *)v24;

    v26 = objc_alloc_init(&OBJC_CLASS___NSMutableSet);
    modifiedVariables = v4->_modifiedVariables;
    v4->_modifiedVariables = v26;

    v28 = objc_alloc_init(&OBJC_CLASS___NSObject);
    id globalVariableCacheIdentifier = v4->_globalVariableCacheIdentifier;
    v4->_id globalVariableCacheIdentifier = v28;

    uint64_t v30 = objc_claimAutoreleasedReturnValue(+[CPLPrequeliteTable tableWithName:](&OBJC_CLASS___CPLPrequeliteTable, "tableWithName:", @"globals"));
    globals = v4->_globals;
    v4->_globals = (CPLPrequeliteTable *)v30;

    v32 = (void *)objc_claimAutoreleasedReturnValue(+[CPLPrequeliteType stringType](&OBJC_CLASS___CPLPrequeliteType, "stringType"));
    uint64_t v33 = objc_claimAutoreleasedReturnValue( +[CPLPrequeliteVariable variableWithName:type:]( &OBJC_CLASS___CPLPrequeliteVariable,  "variableWithName:type:",  @"libraryVersion",  v32));
    libraryVersionVar = v4->_libraryVersionVar;
    v4->_libraryVersionVar = (CPLPrequeliteVariable *)v33;

    v35 = (void *)objc_claimAutoreleasedReturnValue(+[CPLPrequeliteType dataType](&OBJC_CLASS___CPLPrequeliteType, "dataType"));
    uint64_t v36 = objc_claimAutoreleasedReturnValue( +[CPLPrequeliteVariable variableWithName:type:]( &OBJC_CLASS___CPLPrequeliteVariable,  "variableWithName:type:",  @"userIdentifier",  v35));
    userIdentifierVar = v4->_userIdentifierVar;
    v4->_userIdentifierVar = (CPLPrequeliteVariable *)v36;

    v38 = (void *)objc_claimAutoreleasedReturnValue(+[CPLPrequeliteType dateType](&OBJC_CLASS___CPLPrequeliteType, "dateType"));
    uint64_t v39 = objc_claimAutoreleasedReturnValue( +[CPLPrequeliteVariable variableWithName:type:]( &OBJC_CLASS___CPLPrequeliteVariable,  "variableWithName:type:",  @"lastQuarantineCountReportDate",  v38));
    lastQuarantineCountReportDateVar = v4->_lastQuarantineCountReportDateVar;
    v4->_lastQuarantineCountReportDateVar = (CPLPrequeliteVariable *)v39;

    v41 = (void *)objc_claimAutoreleasedReturnValue(+[CPLPrequeliteType stringType](&OBJC_CLASS___CPLPrequeliteType, "stringType"));
    uint64_t v42 = objc_claimAutoreleasedReturnValue( +[CPLPrequeliteVariable variableWithName:type:]( &OBJC_CLASS___CPLPrequeliteVariable,  "variableWithName:type:",  @"clientCacheIdentifier",  v41));
    clientCacheIdentifierVar = v4->_clientCacheIdentifierVar;
    v4->_clientCacheIdentifierVar = (CPLPrequeliteVariable *)v42;

    v44 = (void *)objc_claimAutoreleasedReturnValue(+[CPLPrequeliteType stringType](&OBJC_CLASS___CPLPrequeliteType, "stringType"));
    uint64_t v45 = objc_claimAutoreleasedReturnValue( +[CPLPrequeliteVariable variableWithName:type:]( &OBJC_CLASS___CPLPrequeliteVariable,  "variableWithName:type:",  @"clientCacheIdentifierClientSide",  v44));
    clientCacheIdentifierAsKnownByClient = v4->_clientCacheIdentifierAsKnownByClient;
    v4->_clientCacheIdentifierAsKnownByClient = (CPLPrequeliteVariable *)v45;

    v47 = (void *)objc_claimAutoreleasedReturnValue(+[CPLPrequeliteType dateType](&OBJC_CLASS___CPLPrequeliteType, "dateType"));
    uint64_t v48 = objc_claimAutoreleasedReturnValue( +[CPLPrequeliteVariable variableWithName:type:]( &OBJC_CLASS___CPLPrequeliteVariable,  "variableWithName:type:",  @"libraryCreationDate",  v47));
    libraryCreationDateVar = v4->_libraryCreationDateVar;
    v4->_libraryCreationDateVar = (CPLPrequeliteVariable *)v48;

    v50 = (void *)objc_claimAutoreleasedReturnValue(+[CPLPrequeliteType dataType](&OBJC_CLASS___CPLPrequeliteType, "dataType"));
    uint64_t v51 = objc_claimAutoreleasedReturnValue( +[CPLPrequeliteVariable variableWithName:type:]( &OBJC_CLASS___CPLPrequeliteVariable,  "variableWithName:type:",  @"changeSessionUpdate",  v50));
    changeSessionUpdateVar = v4->_changeSessionUpdateVar;
    v4->_changeSessionUpdateVar = (CPLPrequeliteVariable *)v51;

    v53 = (void *)objc_claimAutoreleasedReturnValue(+[CPLPrequeliteType dataType](&OBJC_CLASS___CPLPrequeliteType, "dataType"));
    uint64_t v54 = objc_claimAutoreleasedReturnValue( +[CPLPrequeliteVariable variableWithName:type:]( &OBJC_CLASS___CPLPrequeliteVariable,  "variableWithName:type:",  @"pushPullGatekeeper",  v53));
    pushPullGatekeepersVar = v4->_pushPullGatekeepersVar;
    v4->_pushPullGatekeepersVar = (CPLPrequeliteVariable *)v54;

    v56 = (void *)objc_claimAutoreleasedReturnValue(+[CPLPrequeliteType integerType](&OBJC_CLASS___CPLPrequeliteType, "integerType"));
    uint64_t v57 = objc_claimAutoreleasedReturnValue( +[CPLPrequeliteVariable variableWithName:type:]( &OBJC_CLASS___CPLPrequeliteVariable,  "variableWithName:type:",  @"libraryOptions",  v56));
    libraryOptionsVar = v4->_libraryOptionsVar;
    v4->_libraryOptionsVar = (CPLPrequeliteVariable *)v57;

    v59 = (void *)objc_claimAutoreleasedReturnValue(+[CPLPrequeliteType integerType](&OBJC_CLASS___CPLPrequeliteType, "integerType"));
    uint64_t v60 = objc_claimAutoreleasedReturnValue( +[CPLPrequeliteVariable variableWithName:type:]( &OBJC_CLASS___CPLPrequeliteVariable,  "variableWithName:type:",  @"shouldUpdateDisabledFeatures",  v59));
    shouldUpdateDisabledFeaturesVar = v4->_shouldUpdateDisabledFeaturesVar;
    v4->_shouldUpdateDisabledFeaturesVar = (CPLPrequeliteVariable *)v60;

    v62 = (void *)objc_claimAutoreleasedReturnValue(+[CPLPrequeliteType dataType](&OBJC_CLASS___CPLPrequeliteType, "dataType"));
    uint64_t v63 = objc_claimAutoreleasedReturnValue( +[CPLPrequeliteVariable variableWithName:type:]( &OBJC_CLASS___CPLPrequeliteVariable,  "variableWithName:type:",  @"disabledFeatures",  v62));
    disabledFeaturesDataVar = v4->_disabledFeaturesDataVar;
    v4->_disabledFeaturesDataVar = (CPLPrequeliteVariable *)v63;

    v65 = (void *)objc_claimAutoreleasedReturnValue(+[CPLPrequeliteType dataType](&OBJC_CLASS___CPLPrequeliteType, "dataType"));
    uint64_t v66 = objc_claimAutoreleasedReturnValue( +[CPLPrequeliteVariable variableWithName:type:]( &OBJC_CLASS___CPLPrequeliteVariable,  "variableWithName:type:",  @"derivativesFilter",  v65));
    derivativesFilterVar = v4->_derivativesFilterVar;
    v4->_derivativesFilterVar = (CPLPrequeliteVariable *)v66;

    v68 = (void *)objc_claimAutoreleasedReturnValue(+[CPLPrequeliteType integerType](&OBJC_CLASS___CPLPrequeliteType, "integerType"));
    uint64_t v69 = objc_claimAutoreleasedReturnValue( +[CPLPrequeliteVariable variableWithName:type:]( &OBJC_CLASS___CPLPrequeliteVariable,  "variableWithName:type:",  @"deactivated",  v68));
    deactivatedVar = v4->_deactivatedVar;
    v4->_deactivatedVar = (CPLPrequeliteVariable *)v69;

    v71 = (void *)objc_claimAutoreleasedReturnValue(+[CPLPrequeliteType stringType](&OBJC_CLASS___CPLPrequeliteType, "stringType"));
    uint64_t v72 = objc_claimAutoreleasedReturnValue( +[CPLPrequeliteVariable variableWithName:type:]( &OBJC_CLASS___CPLPrequeliteVariable,  "variableWithName:type:",  @"mainScopeIdentifier",  v71));
    mainScopeIdentifierVar = v4->_mainScopeIdentifierVar;
    v4->_mainScopeIdentifierVar = (CPLPrequeliteVariable *)v72;

    -[CPLPrequeliteVariable setShouldNotCacheValue:](v4->_mainScopeIdentifierVar, "setShouldNotCacheValue:", 1LL);
    uint64_t v74 = CPLCopyDefaultSerialQueueAttributes( -[CPLPrequeliteVariable setShouldNotCacheValue:]( v4->_changeSessionUpdateVar,  "setShouldNotCacheValue:",  1LL));
    v75 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v74);
    dispatch_queue_t v76 = dispatch_queue_create("com.apple.cplenginestore.sqlite.clientsync", v75);
    isClientInSyncWithClientCacheQueue = v4->_isClientInSyncWithClientCacheQueue;
    v4->_isClientInSyncWithClientCacheQueue = (OS_dispatch_queue *)v76;

    v4->_upgradeEventJournal = -1;
    v78 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](&OBJC_CLASS___NSUserDefaults, "standardUserDefaults"));
    v4->_showStatsForAllTransactions = [v78 BOOLForKey:@"CPLShowStatsForAllTransactions"];

    if (v4->_showStatsForAllTransactions)
    {
      v4->_shouldProfile = 1;
    }

    else
    {
      char has_internal_content = os_variant_has_internal_content("com.apple.cpl.sqlprofile");
      v4->_shouldProfile = has_internal_content;
    }

    if (v4->_showStatsForAllTransactions)
    {
      if (!_CPLSilentLogging)
      {
        id v80 = sub_10015409C();
        v81 = (os_log_s *)objc_claimAutoreleasedReturnValue(v80);
        if (os_log_type_enabled(v81, OS_LOG_TYPE_DEFAULT))
        {
          v85[0] = 0;
          v82 = "Will logs statistics for all transactions";
LABEL_12:
          _os_log_impl((void *)&_mh_execute_header, v81, OS_LOG_TYPE_DEFAULT, v82, (uint8_t *)v85, 2u);
          goto LABEL_13;
        }

        goto LABEL_13;
      }
    }

    else if (!_CPLSilentLogging)
    {
      id v83 = sub_10015409C();
      v81 = (os_log_s *)objc_claimAutoreleasedReturnValue(v83);
      if (os_log_type_enabled(v81, OS_LOG_TYPE_DEFAULT))
      {
        v85[0] = 0;
        v82 = "Will try to catch long transactions";
        goto LABEL_12;
      }

- (void)triggerResetAfterUpgrade:(unint64_t)a3 withReason:(id)a4
{
  id v7 = a4;
  if (self->_didWipeLibrary) {
    goto LABEL_2;
  }
  if (!_CPLSilentLogging)
  {
    id v8 = sub_10015409C();
    v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134218242;
      unint64_t v15 = a3;
      __int16 v16 = 2112;
      id v17 = v7;
      _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "Was requested to schedule a reset (option #%lu) after upgrade for reason '%@'",  buf,  0x16u);
    }
  }

  -[CPLPrequeliteStore recordUpgradeEvent:]( self,  "recordUpgradeEvent:",  @"Reset option %ld requested. Reason: %@",  a3,  v7);
  if (!self->_needsToReset)
  {
    self->_needsToReset = 1;
    self->_unint64_t resetOption = a3;
    uint64_t v12 = (NSString *)[v7 copy];
    resetReason = self->_resetReason;
    self->_resetReason = v12;

    goto LABEL_2;
  }

  unint64_t resetOption = self->_resetOption;
  if (!resetOption)
  {
    if (a3 - 1 > 1) {
      goto LABEL_2;
    }
LABEL_20:
    objc_storeStrong((id *)&self->_resetReason, a4);
    self->_unint64_t resetOption = a3;
    goto LABEL_2;
  }

  if (resetOption == 3)
  {
    if (a3 == 3) {
      goto LABEL_2;
    }
    goto LABEL_20;
  }

  if (resetOption == 1 && a3 == 2) {
    goto LABEL_20;
  }
LABEL_2:
}

- (BOOL)_initializeDB
{
  if (!_CPLSilentLogging)
  {
    id v3 = sub_10015409C();
    id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412290;
      id v8 = self;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEBUG, "Initializing %@", buf, 0xCu);
    }
  }

  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  v6[2] = sub_100154370;
  v6[3] = &unk_1002474D0;
  v6[4] = self;
  return -[CPLPrequeliteStore _performWithFlags:action:](self, "_performWithFlags:action:", 10LL, v6);
}

- (id)_transactionStatsDescription
{
  id v3 = -[NSMutableDictionary count](self->_transactionStatistics, "count");
  if (!v3) {
    return @"no SQL statements";
  }
  id v4 = -[NSMutableArray initWithCapacity:](objc_alloc(&OBJC_CLASS___NSMutableArray), "initWithCapacity:", v3);
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary allValues](self->_transactionStatistics, "allValues", 0LL));
  v6 = (void *)objc_claimAutoreleasedReturnValue([v5 sortedArrayUsingSelector:"compare:"]);

  id v7 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v15;
    do
    {
      for (i = 0LL; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v15 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(*((void *)&v14 + 1) + 8 * (void)i) description]);
        -[NSMutableArray addObject:](v4, "addObject:", v11);
      }

      id v8 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }

    while (v8);
  }

  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray componentsJoinedByString:](v4, "componentsJoinedByString:", @"\n  "));
  return v12;
}

- (void)_setupProfilingHooks
{
  if (!self->_transactionStatistics)
  {
    id v3 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    transactionStatistics = self->_transactionStatistics;
    self->_transactionStatistics = v3;

    objc_initWeak(&location, self);
    db = self->_db;
    uint64_t v12 = _NSConcreteStackBlock;
    uint64_t v13 = 3221225472LL;
    __int128 v14 = sub_100154CDC;
    __int128 v15 = &unk_1002474F8;
    objc_copyWeak(&v16, &location);
    -[PQLConnection setProfilingHook:](db, "setProfilingHook:", &v12);
    int v6 = sqlite3_trace_v2( (sqlite3 *)-[PQLConnection dbHandle](self->_db, "dbHandle", v12, v13, v14, v15),  2u,  (int (__cdecl *)(unsigned int, void *, void *, void *))sub_10015505C,  self);
    if (v6) {
      BOOL v7 = _CPLSilentLogging == 0;
    }
    else {
      BOOL v7 = 0;
    }
    if (v7)
    {
      id v8 = sub_10015409C();
      uint64_t v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        id v10 = -[PQLConnection dbHandle](self->_db, "dbHandle");
        uint64_t v11 = sqlite3_errstr(v6);
        *(_DWORD *)buf = 134218242;
        id v19 = v10;
        __int16 v20 = 2080;
        uint64_t v21 = v11;
        _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_ERROR,  "Failed to setup SQL tracing on %p hook: %s",  buf,  0x16u);
      }
    }

    objc_destroyWeak(&v16);
    objc_destroyWeak(&location);
  }

- (void)_unsetupProfilingHooks
{
  if (self->_transactionStatistics)
  {
    -[PQLConnection setProfilingHook:](self->_db, "setProfilingHook:", 0LL);
    sqlite3_trace_v2((sqlite3 *)-[PQLConnection dbHandle](self->_db, "dbHandle"), 2u, 0LL, 0LL);
    transactionStatistics = self->_transactionStatistics;
    self->_transactionStatistics = 0LL;
  }

- (BOOL)_performWithFlags:(unsigned int)a3 action:(id)a4
{
  uint64_t v4 = *(void *)&a3;
  id v6 = a4;
  if (self->_shouldProfile)
  {
    double Current = CFAbsoluteTimeGetCurrent();
    unsigned __int8 v8 = -[PQLConnection performWithFlags:action:](self->_db, "performWithFlags:action:", v4, v6);
    CFAbsoluteTime v9 = CFAbsoluteTimeGetCurrent();
    double v10 = v9 - Current;
    if (self->_transactionStatistics)
    {
      if (!self->_showStatsForAllTransactions && v10 <= 10.0)
      {
        if (v9 - self->_lastLongTransactionDate > 3600.0)
        {
          if (!_CPLSilentLogging)
          {
            id v17 = sub_10015501C();
            v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(v17);
            if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
            {
              LOWORD(v20) = 0;
              _os_log_impl( (void *)&_mh_execute_header,  v18,  OS_LOG_TYPE_DEFAULT,  "No other long transactions did happen for a long time, stop monitoring long transactions",  (uint8_t *)&v20,  2u);
            }
          }

          -[CPLPrequeliteStore _unsetupProfilingHooks](self, "_unsetupProfilingHooks");
        }
      }

      else
      {
        self->_lastLongTransactionDate = v9;
        if (!_CPLSilentLogging)
        {
          id v12 = sub_10015501C();
          uint64_t v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
          if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
          {
            __int128 v14 = (void *)objc_claimAutoreleasedReturnValue(-[CPLPrequeliteStore _transactionStatsDescription](self, "_transactionStatsDescription"));
            int v20 = 134218242;
            double v21 = v10;
            __int16 v22 = 2114;
            v23 = v14;
            _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_DEFAULT,  "Transaction took %.3fs. Sorted statements:\n  %{public}@",  (uint8_t *)&v20,  0x16u);
          }
        }
      }

      -[NSMutableDictionary removeAllObjects](self->_transactionStatistics, "removeAllObjects");
    }

    else if (v10 > 10.0)
    {
      self->_lastLongTransactionDate = v9;
      if (!_CPLSilentLogging)
      {
        id v15 = sub_10015501C();
        id v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(v15);
        if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
        {
          int v20 = 134217984;
          double v21 = v10;
          _os_log_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_DEFAULT,  "Detected a long transaction (%.3fs) - start monitoring all long transactions",  (uint8_t *)&v20,  0xCu);
        }
      }

      -[CPLPrequeliteStore _setupProfilingHooks](self, "_setupProfilingHooks");
    }
  }

  else
  {
    unsigned __int8 v8 = -[PQLConnection performWithFlags:action:](self->_db, "performWithFlags:action:", v4, v6);
  }

  return v8 & 1;
}

- (BOOL)_fix22666940
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[CPLPrequeliteStore abstractObject](self, "abstractObject"));
  uint64_t v45 = self;
  uint64_t v4 = objc_claimAutoreleasedReturnValue(-[CPLPrequeliteStore clientCache](self, "clientCache"));
  v5 = (void *)objc_claimAutoreleasedReturnValue([v3 cloudCache]);
  uint64_t v6 = objc_claimAutoreleasedReturnValue([v5 platformObject]);

  BOOL v7 = (void *)objc_claimAutoreleasedReturnValue([v3 idMapping]);
  v52 = (void *)objc_claimAutoreleasedReturnValue([v7 platformObject]);

  unsigned __int8 v8 = (void *)objc_claimAutoreleasedReturnValue([v3 remappedRecords]);
  v44 = (void *)objc_claimAutoreleasedReturnValue([v8 platformObject]);

  __int128 v56 = 0u;
  __int128 v57 = 0u;
  __int128 v54 = 0u;
  __int128 v55 = 0u;
  v46 = (void *)v4;
  CFAbsoluteTime v9 = (void *)v4;
  double v10 = (void *)v6;
  id obj = (id)objc_claimAutoreleasedReturnValue([v9 _badContainerRelationsIdentifiers]);
  uint64_t v11 = (char *)[obj countByEnumeratingWithState:&v54 objects:v58 count:16];
  unsigned __int8 v12 = v11 == 0LL;
  if (!v11)
  {
LABEL_36:

    goto LABEL_37;
  }

  uint64_t v13 = v11;
  BOOL v41 = v11 == 0LL;
  uint64_t v42 = v3;
  v47 = 0LL;
  __int128 v14 = 0LL;
  uint64_t v15 = *(void *)v55;
  uint64_t v51 = CPLPrimaryScopeIdentifier;
  do
  {
    id v16 = 0LL;
    uint64_t v17 = -(uint64_t)v14;
    v43 = &v13[(void)v14];
    uint64_t v48 = -(uint64_t)v14;
    v49 = v13;
    do
    {
      if (*(void *)v55 != v15) {
        objc_enumerationMutation(obj);
      }
      v18 = *(void **)(*((void *)&v54 + 1) + 8LL * (void)v16);
      id v19 = objc_autoreleasePoolPush();
      if ((char *)v17 == v16 && !_CPLSilentLogging)
      {
        id v20 = sub_10015409C();
        double v21 = (os_log_s *)objc_claimAutoreleasedReturnValue(v20);
        if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl( (void *)&_mh_execute_header,  v21,  OS_LOG_TYPE_DEFAULT,  "Found some bad container relations to fix",  buf,  2u);
        }
      }

      if (v18)
      {
        id v22 = v18;
        v23 = -[CPLScopedIdentifier initWithScopeIdentifier:identifier:]( objc_alloc(&OBJC_CLASS___CPLScopedIdentifier),  "initWithScopeIdentifier:identifier:",  v51,  v22);
      }

      else
      {
        v23 = 0LL;
      }

      dispatch_queue_t v24 = (void *)objc_claimAutoreleasedReturnValue([v52 cloudScopedIdentifierForLocalScopedIdentifier:v23 isFinal:buf]);

      if (v24)
      {
        v25 = (void *)objc_claimAutoreleasedReturnValue([v24 identifier]);
        v26 = (void *)objc_claimAutoreleasedReturnValue([v10 _relatedIdentifierForRecordWithIdentifier:v25]);

        if (v26)
        {
          uint64_t v27 = v15;
          v28 = objc_alloc(&OBJC_CLASS___CPLScopedIdentifier);
          v29 = (void *)objc_claimAutoreleasedReturnValue([v24 identifier]);
          uint64_t v30 = v10;
          v31 = (void *)objc_claimAutoreleasedReturnValue([v10 _relatedIdentifierForRecordWithIdentifier:v29]);
          v32 = -[CPLScopedIdentifier initWithScopeIdentifier:identifier:]( v28,  "initWithScopeIdentifier:identifier:",  v51,  v31);

          if (!v32) {
            goto LABEL_20;
          }
          uint64_t v33 = (void *)objc_claimAutoreleasedReturnValue([v52 localScopedIdentifierForCloudScopedIdentifier:v32 isFinal:buf]);
          if (v33) {
            goto LABEL_18;
          }
          uint64_t v36 = (void *)objc_claimAutoreleasedReturnValue([v44 realScopedIdentifierForRemappedScopedIdentifier:v32]);
          double v10 = v30;
          if (v36)
          {
            uint64_t v37 = objc_claimAutoreleasedReturnValue([v52 localScopedIdentifierForCloudScopedIdentifier:v36 isFinal:buf]);
            if (v37)
            {
              uint64_t v33 = (void *)v37;
              if ([v46 hasRecordWithScopedIdentifier:v37])
              {
                -[CPLPrequeliteStore recordUpgradeEvent:]( v45,  "recordUpgradeEvent:",  @"FIX: Cloud %@'s item: %@ => %@",  v24,  v32,  v36);
                unsigned int v38 = [v30 remapAllRecordsWithPreviousScopedIdentifier:v32 newScopedIdentifier:v36 error:0];

                if (!v38)
                {

LABEL_35:
                  objc_autoreleasePoolPop(v19);
                  id v3 = v42;
                  double v10 = v30;
                  unsigned __int8 v12 = v41;
                  goto LABEL_36;
                }

- (void)_scheduleClientCacheDrop
{
  if (self->_hasScheduledClientCacheDrop) {
    sub_10019A730((uint64_t)a2, (uint64_t)self);
  }
  self->_hasScheduledClientCacheDrop = 1;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  v6[2] = sub_100155AAC;
  v6[3] = &unk_10023DC70;
  v6[4] = self;
  id v3 = objc_retainBlock(v6);
  uint64_t v4 = v3;
  if (byte_1002A3A8B)
  {
    ((void (*)(void *))v3[2])(v3);
  }

  else
  {
    dispatch_time_t v5 = dispatch_time(0LL, 10000000000LL);
    dispatch_after(v5, (dispatch_queue_t)self->_queue, v4);
  }
}

- (void)_scheduleClientCacheDropIfNecessary
{
  if (!self->_hasScheduledClientCacheDrop)
  {
    id v3 = -[PQLConnection cplFetchObjectOfClass:sql:]( self->_db,  "cplFetchObjectOfClass:sql:",  objc_opt_class(&OBJC_CLASS___NSString),  @"SELECT name FROM sqlite_master WHERE type='table' AND name='clientCache'");

    if (v3)
    {
      if (!_CPLSilentLogging)
      {
        id v4 = sub_10015409C();
        dispatch_time_t v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
        if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)uint64_t v6 = 0;
          _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "Client cache has not been properly dropped yet. Scheduling it soon",  v6,  2u);
        }
      }

      -[CPLPrequeliteStore _scheduleClientCacheDrop](self, "_scheduleClientCacheDrop");
    }
  }

- (BOOL)_upgradeToVersion:(int64_t)a3
{
  clientCacheMigrator = self->_clientCacheMigrator;
  if (a3 >= 64 && clientCacheMigrator)
  {
    uint64_t v6 = 0LL;
LABEL_7:
    self->_clientCacheMigrator = v6;

    goto LABEL_8;
  }

  if (a3 <= 63 && !clientCacheMigrator)
  {
    uint64_t v6 = -[CPLPrequeliteClientCacheMigrator initWithStore:]( objc_alloc(&OBJC_CLASS___CPLPrequeliteClientCacheMigrator),  "initWithStore:",  self);
    clientCacheMigrator = self->_clientCacheMigrator;
    goto LABEL_7;
  }

- (BOOL)_postUpgradeToVersion:(int64_t)a3
{
  if (a3 > 81)
  {
    switch(a3)
    {
      case 'R':
        id v15 = objc_autoreleasePoolPush();
        id v16 = &OBJC_CLASS___CPLStoreMigrationAssistant_101386451;
        break;
      case 'V':
        id v15 = objc_autoreleasePoolPush();
        id v16 = &OBJC_CLASS___CPLStoreMigrationAssistant_107137447;
        break;
      case 'W':
        dispatch_time_t v5 = objc_alloc(&OBJC_CLASS___CPLStoreMigrationAssistant_110019222);
        uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(-[CPLPrequeliteStore abstractObject](self, "abstractObject"));
        BOOL v7 = -[CPLStoreMigrationAssistant_110019222 initWithStore:](v5, "initWithStore:", v6);

        -[CPLPrequeliteStore _addPostUpgradeMigration:](self, "_addPostUpgradeMigration:", v7);
LABEL_21:

        return 1;
      default:
        return 1;
    }

    id v17 = objc_alloc(v16);
    v18 = (void *)objc_claimAutoreleasedReturnValue(-[CPLPrequeliteStore abstractObject](self, "abstractObject"));
    id v19 = [v17 initWithStore:v18];

    -[CPLPrequeliteStore _addPostUpgradeMigration:](self, "_addPostUpgradeMigration:", v19);
    objc_autoreleasePoolPop(v15);
    return 1;
  }

  if (a3 == 31)
  {
    self->_mustMigratePushQueue = 1;
    return 1;
  }

  if (a3 != 40)
  {
    if (a3 == 63)
    {
      clientCacheMigrator = self->_clientCacheMigrator;
      self->_clientCacheMigrator = 0LL;

      -[CPLPrequeliteStore _scheduleClientCacheDrop](self, "_scheduleClientCacheDrop");
    }

    return 1;
  }

  if (self->_mustFix22666940) {
    -[CPLPrequeliteStore _fix22666940](self, "_fix22666940");
  }
  if (self->_mustMigratePushQueue)
  {
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(-[CPLPrequeliteStore abstractObject](self, "abstractObject"));
    BOOL v7 = (CPLStoreMigrationAssistant_110019222 *)objc_claimAutoreleasedReturnValue([v8 resourceStorage]);

    id v9 = -[CPLStoreMigrationAssistant_110019222 shouldCheckFilesForUpload](v7, "shouldCheckFilesForUpload");
    -[CPLStoreMigrationAssistant_110019222 setShouldCheckFilesForUpload:](v7, "setShouldCheckFilesForUpload:", 0LL);
    uint64_t v10 = -[CPLPrequeliteFlattentPipelineMigrator initWithStore:]( objc_alloc(&OBJC_CLASS___CPLPrequeliteFlattentPipelineMigrator),  "initWithStore:",  self);
    BOOL v11 = -[CPLPrequeliteFlattentPipelineMigrator migrate](v10, "migrate");
    if (!v11)
    {
      if (!_CPLSilentLogging)
      {
        uint64_t v12 = __CPLGenericOSLogDomain(v11);
        uint64_t v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
        if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
        {
          unsigned __int8 v14 = (void *)objc_claimAutoreleasedReturnValue(-[CPLPrequeliteFlattentPipelineMigrator lastError](v10, "lastError"));
          int v21 = 138412290;
          id v22 = v14;
          _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_ERROR,  "Failed to migrate to new pipeline (will trigger a reset sync): %@",  (uint8_t *)&v21,  0xCu);
        }
      }

      -[CPLPrequeliteStore triggerResetAfterUpgrade:withReason:]( self,  "triggerResetAfterUpgrade:withReason:",  0LL,  @"failed to migrate to flat push pipeline");
    }

    -[CPLStoreMigrationAssistant_110019222 setShouldCheckFilesForUpload:](v7, "setShouldCheckFilesForUpload:", v9);

    goto LABEL_21;
  }

  return 1;
}

- (BOOL)_fixStoreAfterAnyVersionChange
{
  __int128 v31 = 0u;
  __int128 v32 = 0u;
  __int128 v33 = 0u;
  __int128 v34 = 0u;
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[CPLPrequeliteStore abstractObject](self, "abstractObject"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 storages]);

  id v5 = [v4 countByEnumeratingWithState:&v31 objects:v39 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v32;
LABEL_3:
    uint64_t v8 = 0LL;
    while (1)
    {
      if (*(void *)v32 != v7) {
        objc_enumerationMutation(v4);
      }
      id v9 = *(void **)(*((void *)&v31 + 1) + 8 * v8);
      id v10 = (id)objc_claimAutoreleasedReturnValue([v9 platformObject]);

      if (v6 == (id)++v8)
      {
        id v6 = [v4 countByEnumeratingWithState:&v31 objects:v39 count:16];
        if (v6) {
          goto LABEL_3;
        }
        goto LABEL_9;
      }
    }

    if (_CPLSilentLogging)
    {
      LOBYTE(v13) = 0;
      goto LABEL_16;
    }

    id v14 = sub_10015409C();
    id v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      id v16 = (void *)objc_claimAutoreleasedReturnValue(-[PQLConnection lastCPLError](self->_db, "lastCPLError"));
      id v17 = (void *)objc_claimAutoreleasedReturnValue([v16 localizedDescription]);
      *(_DWORD *)buf = 138412546;
      id v36 = v9;
      __int16 v37 = 2112;
      unsigned int v38 = v17;
      _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_ERROR,  "Unable to fix %@ after version change: %@",  buf,  0x16u);
    }

    LOBYTE(v13) = 0;
  }

  else
  {
LABEL_9:

    globals = self->_globals;
    uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(-[CPLPrequeliteVariable variableName](self->_mainScopeIdentifierVar, "variableName"));
    LOBYTE(globals) = -[CPLPrequeliteStore table:hasColumnWithName:](self, "table:hasColumnWithName:", globals, v12);

    if ((globals & 1) != 0)
    {
      LOBYTE(v13) = 1;
      return v13;
    }

    id v4 = (void *)objc_claimAutoreleasedReturnValue(-[CPLPrequeliteStore pqlConnection](self, "pqlConnection"));
    id v19 = [v4 fetchObjectOfClass:objc_opt_class(NSString) sql:@"SELECT universeName FROM globals"];
    uint64_t v20 = v19;
    uint64_t v21 = CPLPrimaryScopeIdentifier;
    if (v19) {
      id v22 = v19;
    }
    else {
      id v22 = (void *)CPLPrimaryScopeIdentifier;
    }
    id v10 = v22;

    unsigned int v23 = [v10 isEqualToString:v21];
    if ((v23 & 1) != 0)
    {
      unsigned int v24 = v23;
      if (!_CPLSilentLogging)
      {
        id v25 = sub_10015409C();
        __int16 v26 = (os_log_s *)objc_claimAutoreleasedReturnValue(v25);
        if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          id v36 = v10;
          _os_log_impl( (void *)&_mh_execute_header,  v26,  OS_LOG_TYPE_DEFAULT,  "Add new mainScopeIdentifier column. Store is considered created for mainScopeIdentifier %@",  buf,  0xCu);
        }
      }

      unsigned int v13 = -[CPLPrequeliteStore addGlobalVariable:defaultValue:error:]( self,  "addGlobalVariable:defaultValue:error:",  self->_mainScopeIdentifierVar,  v10,  0LL);

      if ((v24 & v13) != 1) {
        return v13;
      }
      id v4 = (void *)objc_claimAutoreleasedReturnValue(-[CPLPrequeliteStore abstractObject](self, "abstractObject"));
      id v10 = (id)objc_claimAutoreleasedReturnValue([v4 engineLibrary]);
      id v15 = (os_log_s *)objc_claimAutoreleasedReturnValue([v10 store]);
      id v27 = (void *)objc_claimAutoreleasedReturnValue(-[os_log_s scopes](v15, "scopes"));
      LOBYTE(v13) = [v27 clearAllQuotaFlagsForMainScopeWithReason:@"fix store after any version change" error:0];
    }

    else
    {
      if (!_CPLSilentLogging)
      {
        id v28 = sub_10015409C();
        v29 = (os_log_s *)objc_claimAutoreleasedReturnValue(v28);
        if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          id v36 = v10;
          _os_log_impl( (void *)&_mh_execute_header,  v29,  OS_LOG_TYPE_ERROR,  "Database is bound to %@ and need to be wiped before opening",  buf,  0xCu);
        }
      }

      id v30 = 0LL;
      LOBYTE(v13) = -[CPLPrequeliteStore _closeWipeAndReOpenWithReason:warnUserIfPossible:createRadar:error:]( self,  "_closeWipeAndReOpenWithReason:warnUserIfPossible:createRadar:error:",  @"upgrading parallel universe database",  0LL,  0LL,  &v30);
      id v15 = (os_log_s *)v30;
      if ((v13 & 1) == 0) {
        [v4 setLastError:v15];
      }
    }
  }

LABEL_16:
  return v13;
}

- (BOOL)performPostUpgradeMigrationsWithError:(id *)a3
{
  if (self->_postUpgradeMigrations)
  {
    -[CPLPrequeliteStore _openUpgradeJournal](self, "_openUpgradeJournal");
    __int128 v43 = 0u;
    __int128 v44 = 0u;
    __int128 v41 = 0u;
    __int128 v42 = 0u;
    id obj = self->_postUpgradeMigrations;
    id v39 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( obj,  "countByEnumeratingWithState:objects:count:",  &v41,  v49,  16LL);
    if (v39)
    {
      unsigned __int8 v35 = a3;
      id v5 = 0LL;
      uint64_t v38 = *(void *)v42;
      id v6 = &_CPLSilentLogging;
      while (2)
      {
        uint64_t v7 = 0LL;
        uint64_t v8 = v5;
        do
        {
          if (*(void *)v42 != v38) {
            objc_enumerationMutation(obj);
          }
          id v9 = *(void **)(*((void *)&v41 + 1) + 8LL * (void)v7);
          id v10 = objc_autoreleasePoolPush();
          if (!*v6)
          {
            id v11 = sub_10015409C();
            uint64_t v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
            if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
            {
              unsigned int v13 = (void *)objc_claimAutoreleasedReturnValue([v9 migrationDescription]);
              *(_DWORD *)buf = 138412290;
              v46 = v13;
              _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Start migration '%@'", buf, 0xCu);
            }
          }

          id v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
          id v15 = (void *)objc_claimAutoreleasedReturnValue(+[CPLDateFormatter stringFromDate:](&OBJC_CLASS___CPLDateFormatter, "stringFromDate:", v14));
          id v16 = (void *)objc_claimAutoreleasedReturnValue([v9 migrationDescription]);
          -[CPLPrequeliteStore recordUpgradeEvent:]( self,  "recordUpgradeEvent:",  @"%@: Performing migration '%@'",  v15,  v16);

          id v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
          id v40 = v8;
          unsigned __int8 v18 = [v9 performMigrationWithError:&v40];
          id v5 = v40;

          if ((v18 & 1) == 0 && v5)
          {
            if (!*v6)
            {
              id v30 = sub_10015409C();
              __int128 v31 = (os_log_s *)objc_claimAutoreleasedReturnValue(v30);
              if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
              {
                __int128 v32 = (void *)objc_claimAutoreleasedReturnValue([v9 migrationDescription]);
                *(_DWORD *)buf = 138412546;
                v46 = v32;
                __int16 v47 = 2112;
                id v48 = v5;
                _os_log_impl( (void *)&_mh_execute_header,  v31,  OS_LOG_TYPE_ERROR,  "Migration '%@' failed: %@",  buf,  0x16u);
              }
            }

            -[PQLConnection setLastError:](self->_db, "setLastError:", v5);

            objc_autoreleasePoolPop(v10);
            BOOL v29 = 0;
            a3 = v35;
            goto LABEL_27;
          }

          unsigned __int8 v37 = v18;
          id v19 = v10;
          id v20 = v5;
          uint64_t v21 = v6;
          id v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
          unsigned int v23 = (void *)objc_claimAutoreleasedReturnValue(+[CPLDateFormatter stringFromDate:](&OBJC_CLASS___CPLDateFormatter, "stringFromDate:", v22));
          unsigned int v24 = (void *)objc_claimAutoreleasedReturnValue([v9 migrationDescription]);
          [v17 timeIntervalSinceNow];
          -[CPLPrequeliteStore recordUpgradeEvent:]( self,  "recordUpgradeEvent:",  @"%@: Performed migration '%@' in %.1fs: Done",  v23,  v24,  -v25);

          id v6 = v21;
          id v5 = v20;
          if (!*v6)
          {
            id v26 = sub_10015409C();
            id v27 = (os_log_s *)objc_claimAutoreleasedReturnValue(v26);
            if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
            {
              id v28 = (void *)objc_claimAutoreleasedReturnValue([v9 migrationDescription]);
              *(_DWORD *)buf = 138412290;
              v46 = v28;
              _os_log_impl( (void *)&_mh_execute_header,  v27,  OS_LOG_TYPE_DEFAULT,  "Migration '%@' completed successfully",  buf,  0xCu);
            }
          }

          objc_autoreleasePoolPop(v19);
          uint64_t v7 = (char *)v7 + 1;
          uint64_t v8 = v20;
        }

        while (v39 != v7);
        id v39 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( obj,  "countByEnumeratingWithState:objects:count:",  &v41,  v49,  16LL);
        if (v39) {
          continue;
        }
        break;
      }

      a3 = v35;
      BOOL v29 = v37;
    }

    else
    {
      id v5 = 0LL;
      BOOL v29 = 1;
    }

- (void)_wipeWithReason:(id)a3
{
  id v4 = (NSString *)[a3 copy];
  wipeReason = self->_wipeReason;
  self->_wipeReason = v4;

  self->_didWipeLibrary = 1;
  -[CPLSimpleUpgradeHistory resetVersionHasChanged](self->_history, "resetVersionHasChanged");
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[CPLPrequeliteStore abstractObject](self, "abstractObject"));
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([v6 engineLibrary]);
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v7 cloudLibraryStateStorageURL]);

  id v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
  id v15 = 0LL;
  unsigned __int8 v10 = [v9 removeItemAtURL:v8 error:&v15];
  id v11 = v15;

  if ((v10 & 1) == 0 && !_CPLSilentLogging)
  {
    id v12 = sub_10015409C();
    unsigned int v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      id v14 = (void *)objc_claimAutoreleasedReturnValue([v8 path]);
      *(_DWORD *)buf = 138412546;
      id v17 = v14;
      __int16 v18 = 2112;
      id v19 = v11;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_ERROR, "Error trying to delete %@: %@", buf, 0x16u);
    }
  }
}

- (NSURL)deactivateMarkerURL
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CPLPrequeliteStore abstractObject](self, "abstractObject"));
  id v3 = (void *)objc_claimAutoreleasedReturnValue([v2 engineLibrary]);
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 clientLibraryBaseURL]);
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 URLByDeletingLastPathComponent]);
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 URLByAppendingPathComponent:@"disableICloudPhotos" isDirectory:0]);

  return (NSURL *)v6;
}

- (BOOL)_hasDeactivateMarker
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[CPLPrequeliteStore deactivateMarkerURL](self, "deactivateMarkerURL"));
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 path]);
  unsigned __int8 v6 = [v3 fileExistsAtPath:v5];

  return v6;
}

- (BOOL)_closeWipeAndReOpenWithReason:(id)a3 warnUserIfPossible:(BOOL)a4 createRadar:(BOOL)a5 error:(id *)a6
{
  BOOL v7 = a5;
  BOOL v8 = a4;
  unsigned __int8 v10 = (CPLPrequelitePreventWipeNotification *)a3;
  BOOL failInsteadOfWipe = self->_failInsteadOfWipe;
  unsigned __int8 v12 = -[CPLPrequeliteStore _hasDeactivateMarker](self, "_hasDeactivateMarker");
  if (failInsteadOfWipe && (v12 & 1) == 0)
  {
    if (!_CPLSilentLogging)
    {
      id v13 = sub_10015409C();
      id v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        __int128 v43 = v10;
        _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_ERROR,  "Trying to wipe database for reason '%@' but we were asked to prevent wipes",  buf,  0xCu);
      }
    }

    id v15 = (CPLPrequelitePreventWipeNotification *)objc_claimAutoreleasedReturnValue( +[CPLErrors preventWipeErrorWithReason:preventedByUser:]( &OBJC_CLASS___CPLErrors,  "preventWipeErrorWithReason:preventedByUser:",  v10,  0LL));
    -[PQLConnection setLastError:](self->_db, "setLastError:", v15);
    if (a6)
    {
      id v15 = v15;
      BOOL v16 = 0;
      *a6 = v15;
      goto LABEL_43;
    }

- (id)_wipeReasonFromCorruptionInfo:(id)a3
{
  id v3 = a3;
  uint64_t v4 = objc_opt_class(&OBJC_CLASS___NSDictionary);
  if ((objc_opt_isKindOfClass(v3, v4) & 1) == 0) {
    goto LABEL_6;
  }
  id v5 = (__CFString *)objc_claimAutoreleasedReturnValue([v3 objectForKeyedSubscript:@"comment"]);
  uint64_t v6 = objc_opt_class(&OBJC_CLASS___NSString);
  if ((objc_opt_isKindOfClass(v5, v6) & 1) == 0)
  {

LABEL_6:
    id v5 = @"corrupted database";
    goto LABEL_7;
  }

  if (!v5) {
    goto LABEL_6;
  }
LABEL_7:

  return v5;
}

- (void)_wipeBeforeOpeningIfNecessary
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[CPLPrequeliteStore corruptionInfo](self, "corruptionInfo"));
  if (v3)
  {
    if (!_CPLSilentLogging)
    {
      id v4 = sub_10015409C();
      id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      {
        int v10 = 138412290;
        id v11 = v3;
        _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_ERROR,  "Database has been marked as corrupted - wiping everything - corruption info: %@",  (uint8_t *)&v10,  0xCu);
      }
    }

    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(-[CPLPrequeliteStore _wipeReasonFromCorruptionInfo:](self, "_wipeReasonFromCorruptionInfo:", v3));
    -[CPLPrequeliteStore _wipeWithReason:](self, "_wipeWithReason:", v6);

    -[CPLPrequeliteStore _deleteCorruptionInfo](self, "_deleteCorruptionInfo");
  }

  BOOL v7 = (void *)objc_claimAutoreleasedReturnValue(-[CPLPrequeliteStore wipeReason](self, "wipeReason"));
  if (v7)
  {
    if (!_CPLSilentLogging)
    {
      id v8 = sub_10015409C();
      id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        int v10 = 138412290;
        id v11 = v7;
        _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_ERROR,  "CPL has been requested to wipe database: %@",  (uint8_t *)&v10,  0xCu);
      }
    }

    -[CPLPrequeliteStore _wipeWithReason:](self, "_wipeWithReason:", v7);
    -[CPLPrequeliteStore _deleteWipeReason](self, "_deleteWipeReason");
  }
}

- (BOOL)_wipeIfDeactivated:(int64_t)a3 didWipeDatabase:(BOOL *)a4 error:(id *)a5
{
  if (a3 < 50
    || self->_reentrencyGuard
    || (id v8 = (void *)objc_claimAutoreleasedReturnValue( -[CPLPrequeliteStore valueForGlobalVariable:]( self,  "valueForGlobalVariable:",  self->_deactivatedVar)),  v9 = [v8 integerValue],  v8,  !v9))
  {
    *a4 = 0;
    return 1;
  }

  else
  {
    if (!_CPLSilentLogging)
    {
      id v10 = sub_10015409C();
      id v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)id v13 = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_ERROR,  "Database has been marked as deactivated - wiping everything",  v13,  2u);
      }
    }

    *a4 = 1;
    return -[CPLPrequeliteStore _closeWipeAndReOpenWithReason:warnUserIfPossible:createRadar:error:]( self,  "_closeWipeAndReOpenWithReason:warnUserIfPossible:createRadar:error:",  @"wiping database because it has been marked as deactivated but not deleted afterwards",  0LL,  0LL,  a5);
  }

- (BOOL)_upgradeDB:(int64_t)a3
{
  if (self->_reentrencyGuard)
  {
    if (!_CPLSilentLogging)
    {
      id v5 = sub_10015409C();
      uint64_t v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_ERROR,  "Re-opening database triggered an upgrade again. Bailing out.",  buf,  2u);
      }
    }

    return 0;
  }

  if (a3 < 0)
  {
    if (!_CPLSilentLogging)
    {
      id v12 = sub_10015409C();
      id v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 134217984;
        int64_t v36 = a3;
        _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_ERROR,  "Database in version %lld is too old. Wiping everything. This will require a reset sync.",  buf,  0xCu);
      }
    }

    -[CPLPrequeliteStore recordUpgradeEvent:]( self,  "recordUpgradeEvent:",  @"Will need to wipe everything because the current version is really too old.");
    id v14 = @"wiping everything because the current version is really too old";
    id v15 = self;
    BOOL v16 = 0LL;
    return -[CPLPrequeliteStore _closeWipeAndReOpenWithReason:warnUserIfPossible:createRadar:error:]( v15,  "_closeWipeAndReOpenWithReason:warnUserIfPossible:createRadar:error:",  v14,  v16,  0LL,  0LL);
  }

  if ((unint64_t)(a3 - 93) <= 0xFFFFFFFFFFFFFFB2LL)
  {
    if ((unint64_t)a3 <= 0xF)
    {
      if (_CPLSilentLogging)
      {
        id v10 = @"wiping database because the current version is really too old";
        id v11 = @"Will need to wipe database because the current version is really too old.";
        goto LABEL_40;
      }

      id v30 = sub_10015409C();
      id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v30);
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 134217984;
        int64_t v36 = a3;
        _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_ERROR,  "Database in version %lld is too old. Let's clear it and request a reset sync.",  buf,  0xCu);
      }

      id v10 = @"wiping database because the current version is really too old";
      id v11 = @"Will need to wipe database because the current version is really too old.";
    }

    else
    {
      if (_CPLSilentLogging)
      {
        id v10 = @"wiping database because the current version is too new";
        id v11 = @"Will need to wipe database because the current version is too new.";
        goto LABEL_40;
      }

      id v8 = sub_10015409C();
      id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 134217984;
        int64_t v36 = a3;
        _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_ERROR,  "Database in version %lld is too new for this engine. Let's clear it, request a reset sync and cross our fingers.",  buf,  0xCu);
      }

      id v10 = @"wiping database because the current version is too new";
      id v11 = @"Will need to wipe database because the current version is too new.";
    }

LABEL_40:
    -[CPLPrequeliteStore recordUpgradeEvent:](self, "recordUpgradeEvent:", v11);
    id v15 = self;
    id v14 = v10;
    BOOL v16 = (unint64_t)a3 > 0xF;
    return -[CPLPrequeliteStore _closeWipeAndReOpenWithReason:warnUserIfPossible:createRadar:error:]( v15,  "_closeWipeAndReOpenWithReason:warnUserIfPossible:createRadar:error:",  v14,  v16,  0LL,  0LL);
  }

  if (!_CPLSilentLogging)
  {
    id v17 = sub_10015409C();
    __int16 v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(v17);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412802;
      int64_t v36 = (int64_t)self;
      __int16 v37 = 2048;
      int64_t v38 = a3;
      __int16 v39 = 2048;
      int64_t v40 = 92LL;
      _os_log_impl( (void *)&_mh_execute_header,  v18,  OS_LOG_TYPE_DEBUG,  "Upgrading %@ from version %lld to %lld",  buf,  0x20u);
    }
  }

  id v19 = (void *)objc_claimAutoreleasedReturnValue(-[CPLPrequeliteStore abstractObject](self, "abstractObject"));
  id v20 = (void *)objc_claimAutoreleasedReturnValue([v19 storages]);

  if (a3 <= 92) {
    int64_t v21 = 92LL;
  }
  else {
    int64_t v21 = a3;
  }
  do
  {
    if (v21 == a3)
    {
      BOOL v7 = 1;
      goto LABEL_34;
    }

    ++a3;
    id v22 = objc_autoreleasePoolPush();
    v32[0] = _NSConcreteStackBlock;
    v32[1] = 3221225472LL;
    v32[2] = sub_100157988;
    v32[3] = &unk_100247540;
    v32[4] = self;
    int64_t v34 = a3;
    id v33 = v20;
    unsigned __int8 v23 = -[CPLPrequeliteStore _performWithFlags:action:](self, "_performWithFlags:action:", 10LL, v32);

    objc_autoreleasePoolPop(v22);
  }

  while ((v23 & 1) != 0);
  if (!_CPLSilentLogging)
  {
    id v24 = sub_10015409C();
    double v25 = (os_log_s *)objc_claimAutoreleasedReturnValue(v24);
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412802;
      int64_t v36 = (int64_t)self;
      __int16 v37 = 2048;
      int64_t v38 = a3 - 1;
      __int16 v39 = 2048;
      int64_t v40 = a3;
      _os_log_impl( (void *)&_mh_execute_header,  v25,  OS_LOG_TYPE_ERROR,  "Failed to upgrade %@ from version %lld to %lld - will need to wipe the database",  buf,  0x20u);
    }
  }

  -[CPLPrequeliteStore recordUpgradeEvent:]( self,  "recordUpgradeEvent:",  @"Will need to wipe everything because failed to upgrade from version %lld to %lld.",  a3 - 1,  a3);
  id v26 = (void *)objc_claimAutoreleasedReturnValue(-[PQLConnection lastCPLError](self->_db, "lastCPLError"));
  id v27 = objc_alloc(&OBJC_CLASS___NSString);
  id v28 = (void *)objc_claimAutoreleasedReturnValue([v26 domain]);
  BOOL v29 = -[NSString initWithFormat:]( v27,  "initWithFormat:",  @"wiping everything because database failed to upgrade from version %lld to %lld (%@/%ld)",  a3 - 1,  a3,  v28,  [v26 code]);

  BOOL v7 = -[CPLPrequeliteStore _closeWipeAndReOpenWithReason:warnUserIfPossible:createRadar:error:]( self,  "_closeWipeAndReOpenWithReason:warnUserIfPossible:createRadar:error:",  v29,  1LL,  1LL,  0LL);
LABEL_34:

  return v7;
}

- (void)_openUpgradeJournal
{
  if (self->_upgradeEventJournal != -1) {
    sub_10019A7E8((uint64_t)a2, (uint64_t)self);
  }
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[CPLPrequeliteStore abstractObject](self, "abstractObject"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 engineLibrary]);
  id v6 = (id)objc_claimAutoreleasedReturnValue([v4 cloudLibraryStateStorageURL]);

  id v5 = objc_claimAutoreleasedReturnValue([v6 URLByAppendingPathComponent:@"cpl-upgrade-events.log"]);
  self->_upgradeEventJournal = open((const char *)[v5 fileSystemRepresentation], 521, 420);
}

- (void)_closeUpgradeJournal
{
  int upgradeEventJournal = self->_upgradeEventJournal;
  if (upgradeEventJournal != -1)
  {
    close(upgradeEventJournal);
    self->_int upgradeEventJournal = -1;
  }

- (BOOL)_setupDBIfNeeded
{
  self->_configuringDB = 1;
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[PQLConnection userVersion](self->_db, "userVersion"));
  id v4 = [v3 longLongValue];

  if (!v4)
  {
    LOBYTE(v5) = -[CPLPrequeliteStore _initializeDB](self, "_initializeDB");
LABEL_26:
    self->_configuringDB = 0;
    return v5;
  }

  char v26 = 0;
  BOOL v5 = -[CPLPrequeliteStore _wipeIfDeactivated:didWipeDatabase:error:]( self,  "_wipeIfDeactivated:didWipeDatabase:error:",  v4,  &v26,  0LL);
  if (v5)
  {
    if (v26 || v4 == (id)92)
    {
      if (!v26
        && -[CPLSimpleUpgradeHistory versionHasChanged](self->_history, "versionHasChanged")
        && !-[CPLPrequeliteStore _fixStoreAfterAnyVersionChange](self, "_fixStoreAfterAnyVersionChange"))
      {
        goto LABEL_24;
      }
    }

    else
    {
      -[CPLPrequeliteStore _openUpgradeJournal](self, "_openUpgradeJournal");
      id v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
      BOOL v7 = (void *)objc_claimAutoreleasedReturnValue(+[CPLDateFormatter stringFromDate:](&OBJC_CLASS___CPLDateFormatter, "stringFromDate:", v6));
      -[CPLPrequeliteStore recordUpgradeEvent:]( self,  "recordUpgradeEvent:",  @"%@: Upgrading from %lld to %lld...",  v7,  v4,  92LL);

      -[CPLSimpleUpgradeHistory noteDatabaseWasUpgradedToVersion:fromVersion:]( self->_history,  "noteDatabaseWasUpgradedToVersion:fromVersion:",  92LL,  v4);
      self->_BOOL failInsteadOfWipe = [(id)objc_opt_class(self) shouldPreventWipeOnUpgrade];
      unsigned __int8 v8 = -[CPLPrequeliteStore _upgradeDB:](self, "_upgradeDB:", v4);
      self->_BOOL failInsteadOfWipe = 0;
      if ((v8 & 1) == 0)
      {
        id v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
        unsigned __int8 v23 = (void *)objc_claimAutoreleasedReturnValue(+[CPLDateFormatter stringFromDate:](&OBJC_CLASS___CPLDateFormatter, "stringFromDate:", v22));
        id v24 = (void *)objc_claimAutoreleasedReturnValue(-[PQLConnection lastCPLError](self->_db, "lastCPLError"));
        -[CPLPrequeliteStore recordUpgradeEvent:]( self,  "recordUpgradeEvent:",  @"%@: Upgrade from %lld to %lld: Failed (%@)",  v23,  v4,  92LL,  v24);

        -[CPLPrequeliteStore _closeUpgradeJournal](self, "_closeUpgradeJournal");
LABEL_24:
        unsigned int v21 = 0;
        goto LABEL_25;
      }

      -[PQLConnection setUserVersion:](self->_db, "setUserVersion:", 92LL);
      id v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
      id v10 = (void *)objc_claimAutoreleasedReturnValue(+[CPLDateFormatter stringFromDate:](&OBJC_CLASS___CPLDateFormatter, "stringFromDate:", v9));
      -[CPLPrequeliteStore recordUpgradeEvent:]( self,  "recordUpgradeEvent:",  @"%@: Upgrade from %lld to %lld: Done",  v10,  v4,  92LL);

      unsigned __int8 v11 = -[CPLPrequeliteStore _fixStoreAfterAnyVersionChange](self, "_fixStoreAfterAnyVersionChange");
      -[CPLPrequeliteStore _closeUpgradeJournal](self, "_closeUpgradeJournal");
      if ((v11 & 1) == 0) {
        goto LABEL_24;
      }
    }

    id v12 = (void *)objc_claimAutoreleasedReturnValue(-[CPLPrequeliteStore abstractObject](self, "abstractObject"));
    id v13 = (void *)objc_claimAutoreleasedReturnValue([v12 mainScopeIdentifier]);

    unint64_t v14 = v13;
    id v15 = (void *)objc_claimAutoreleasedReturnValue( -[CPLPrequeliteStore valueForGlobalVariable:]( self,  "valueForGlobalVariable:",  self->_mainScopeIdentifierVar));
    unint64_t v16 = (unint64_t)v15;
    if (v14 && v15)
    {
      unsigned __int8 v17 = [(id)v14 isEqual:v15];

      if ((v17 & 1) == 0)
      {
LABEL_15:
        if (!_CPLSilentLogging)
        {
          id v18 = sub_10015409C();
          id v19 = (os_log_s *)objc_claimAutoreleasedReturnValue(v18);
          if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
          {
            id v20 = (void *)objc_claimAutoreleasedReturnValue( -[CPLPrequeliteStore valueForGlobalVariable:]( self,  "valueForGlobalVariable:",  self->_mainScopeIdentifierVar));
            *(_DWORD *)buf = 138412546;
            id v28 = v20;
            __int16 v29 = 2112;
            unint64_t v30 = v14;
            _os_log_impl( (void *)&_mh_execute_header,  v19,  OS_LOG_TYPE_ERROR,  "Main scope identifier has changed (from %@ to %@)",  buf,  0x16u);
          }
        }

        unsigned int v21 = -[CPLPrequeliteStore _closeWipeAndReOpenWithReason:warnUserIfPossible:createRadar:error:]( self,  "_closeWipeAndReOpenWithReason:warnUserIfPossible:createRadar:error:",  @"main scope identifier has changed",  1LL,  0LL,  0LL);
        goto LABEL_22;
      }
    }

    else
    {

      if (v14 | v16) {
        goto LABEL_15;
      }
    }

    unsigned int v21 = 1;
LABEL_22:

LABEL_25:
    LOBYTE(v5) = v21 != 0;
    goto LABEL_26;
  }

  return v5;
}

- (id)_corruptionMarkerURL
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CPLPrequeliteStore abstractObject](self, "abstractObject"));
  id v3 = (void *)objc_claimAutoreleasedReturnValue([v2 engineLibrary]);
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 cloudLibraryStateStorageURL]);

  BOOL v5 = (void *)objc_claimAutoreleasedReturnValue([v4 URLByAppendingPathComponent:@"corruption_marker"]);
  return v5;
}

- (id)corruptionInfo
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CPLPrequeliteStore _corruptionMarkerURL](self, "_corruptionMarkerURL"));
  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v2 path]);
  unsigned int v5 = [v3 fileExistsAtPath:v4];

  if (v5)
  {
    id v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithContentsOfURL:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithContentsOfURL:",  v2));
    if (!v6) {
      id v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithContentsOfURL:encoding:error:]( &OBJC_CLASS___NSString,  "stringWithContentsOfURL:encoding:error:",  v2,  4LL,  0LL));
    }
  }

  else
  {
    id v6 = 0LL;
  }

  return v6;
}

- (void)_deleteCorruptionInfo
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CPLPrequeliteStore _corruptionMarkerURL](self, "_corruptionMarkerURL"));
  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
  id v10 = 0LL;
  unsigned __int8 v4 = [v3 removeItemAtURL:v2 error:&v10];
  id v5 = v10;
  if ((v4 & 1) != 0)
  {
LABEL_6:

    goto LABEL_7;
  }

  id v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
  unsigned __int8 v7 = [v6 cplIsFileDoesNotExistError:v5];

  if ((v7 & 1) == 0 && !_CPLSilentLogging)
  {
    id v8 = sub_10015409C();
    id v3 = (void *)objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled((os_log_t)v3, OS_LOG_TYPE_ERROR))
    {
      id v9 = (void *)objc_claimAutoreleasedReturnValue([v2 path]);
      *(_DWORD *)buf = 138412546;
      id v12 = v9;
      __int16 v13 = 2112;
      id v14 = v5;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)v3,  OS_LOG_TYPE_ERROR,  "Failed to remove corruption info at %@: %@",  buf,  0x16u);
    }

    goto LABEL_6;
  }

- (BOOL)markDatabaseAsDeactivatedWithError:(id *)a3
{
  return -[CPLPrequeliteStore setValue:forGlobalVariable:error:]( self,  "setValue:forGlobalVariable:error:",  &off_10025A440,  self->_deactivatedVar,  a3);
}

- (BOOL)_setupPragmasAndFunctions
{
  return -[PQLConnection cplRegisterIndexSetMatch](self->_db, "cplRegisterIndexSetMatch");
}

- (void)_markLibraryAsCorruptedWithInfo:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[CPLPrequeliteStore _corruptionMarkerURL](self, "_corruptionMarkerURL"));
  [v4 writeToURL:v5 atomically:1];

  id v7 = (id)objc_claimAutoreleasedReturnValue(-[CPLPrequeliteStore abstractObject](self, "abstractObject"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v7 engineLibrary]);
  [v6 reportLibraryCorrupted];
}

- (BOOL)_openWithError:(id *)a3
{
  id v5 = objc_alloc_init(&OBJC_CLASS___PQLConnection);
  db = self->_db;
  self->_db = v5;

  objc_initWeak(&location, self);
  objc_initWeak(&from, self->_db);
  id v7 = self->_db;
  v76[0] = _NSConcreteStackBlock;
  v76[1] = 3221225472LL;
  v76[2] = sub_100158FFC;
  v76[3] = &unk_100247568;
  objc_copyWeak(&v77, &location);
  v78[1] = (id)a2;
  objc_copyWeak(v78, &from);
  -[PQLConnection setSqliteErrorHandler:](v7, "setSqliteErrorHandler:", v76);
  id v8 = self->_db;
  id v9 = (void *)objc_claimAutoreleasedReturnValue(-[PQLConnection sqliteErrorHandler](v8, "sqliteErrorHandler"));
  -[PQLConnection setAutoRollbackHandler:](v8, "setAutoRollbackHandler:", v9);

  id v10 = (void *)objc_claimAutoreleasedReturnValue(-[NSURL URLByDeletingLastPathComponent](self->_dbURL, "URLByDeletingLastPathComponent"));
  unsigned __int8 v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
  id v12 = (void *)objc_claimAutoreleasedReturnValue([v10 path]);
  unsigned __int8 v13 = [v11 fileExistsAtPath:v12];

  if ((v13 & 1) == 0)
  {
    id v75 = 0LL;
    unsigned __int8 v14 = [v11 createDirectoryAtURL:v10 withIntermediateDirectories:0 attributes:0 error:&v75];
    id v15 = v75;
    if ((v14 & 1) != 0)
    {
      if (!_CPLSilentLogging)
      {
        id v16 = sub_10015409C();
        unsigned __int8 v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);
        if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
        {
          id v18 = (void *)objc_claimAutoreleasedReturnValue([v10 path]);
          *(_DWORD *)buf = 138412290;
          v82 = v18;
          _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEBUG, "Created store folder at %@", buf, 0xCu);
        }
      }
    }

    else
    {
      if (!_CPLSilentLogging)
      {
        id v19 = sub_10015409C();
        id v20 = (os_log_s *)objc_claimAutoreleasedReturnValue(v19);
        if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
        {
          unsigned int v21 = (void *)objc_claimAutoreleasedReturnValue([v10 path]);
          *(_DWORD *)buf = 138412546;
          v82 = v21;
          __int16 v83 = 2112;
          id v84 = v15;
          _os_log_impl( (void *)&_mh_execute_header,  v20,  OS_LOG_TYPE_ERROR,  "Can't create store folder at %@: %@",  buf,  0x16u);
        }
      }

      if (v15) {
        goto LABEL_29;
      }
    }
  }

  id v22 = self->_db;
  dbURL = self->_dbURL;
  id v74 = 0LL;
  unsigned __int8 v24 = -[PQLConnection openAtURL:sharedCache:error:]( v22,  "openAtURL:sharedCache:error:",  dbURL,  0LL,  &v74);
  id v15 = v74;
  if ((v24 & 1) != 0)
  {
    if (self->_showStatsForAllTransactions) {
      -[CPLPrequeliteStore _setupProfilingHooks](self, "_setupProfilingHooks");
    }
  }

  else
  {
    if (!_CPLSilentLogging)
    {
      id v25 = sub_10015409C();
      char v26 = (os_log_s *)objc_claimAutoreleasedReturnValue(v25);
      if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
      {
        id v27 = (void *)objc_claimAutoreleasedReturnValue(-[NSURL path](self->_dbURL, "path"));
        *(_DWORD *)buf = 138412546;
        v82 = v27;
        __int16 v83 = 2112;
        id v84 = v15;
        _os_log_impl( (void *)&_mh_execute_header,  v26,  OS_LOG_TYPE_ERROR,  "Can't open store at %@: %@: error",  buf,  0x16u);
      }
    }

    id v28 = self->_db;
    self->_db = 0LL;

    if (v15) {
      goto LABEL_29;
    }
  }

  if (-[PQLConnection setupPragmas](self->_db, "setupPragmas")
    && -[CPLPrequeliteStore _setupPragmasAndFunctions](self, "_setupPragmasAndFunctions"))
  {
    if (-[CPLPrequeliteStore _setupDBIfNeeded](self, "_setupDBIfNeeded")) {
      goto LABEL_30;
    }
    id v15 = (id)objc_claimAutoreleasedReturnValue(-[PQLConnection lastCPLError](self->_db, "lastCPLError"));
    if (v15)
    {
LABEL_29:
      char v30 = 0;
      goto LABEL_44;
    }

    uint64_t v29 = objc_claimAutoreleasedReturnValue( +[CPLErrors underlyingErrorWithReason:]( &OBJC_CLASS___CPLErrors,  "underlyingErrorWithReason:",  @"Impossible to setup database"));
  }

  else
  {
    uint64_t v29 = objc_claimAutoreleasedReturnValue(-[PQLConnection lastCPLError](self->_db, "lastCPLError"));
  }

  id v15 = (id)v29;
  if (v29) {
    goto LABEL_29;
  }
LABEL_30:
  id v31 = (void *)objc_claimAutoreleasedReturnValue(-[CPLPrequeliteStore clientCacheIdentifier](self, "clientCacheIdentifier"));
  __int128 v32 = (void *)objc_claimAutoreleasedReturnValue( -[CPLPrequeliteStore valueForGlobalVariable:]( self,  "valueForGlobalVariable:",  self->_clientCacheIdentifierAsKnownByClient));
  unint64_t v33 = v31;
  unint64_t v34 = v32;
  id v35 = (void *)v34;
  if (!v33 || !v34)
  {
    BOOL v40 = (v33 | v34) != 0;

    if (v40) {
      goto LABEL_33;
    }
LABEL_38:
    if (_CPLSilentLogging)
    {
      BOOL v39 = 1;
      goto LABEL_43;
    }

    id v41 = sub_10015409C();
    int64_t v38 = (os_log_s *)objc_claimAutoreleasedReturnValue(v41);
    if (os_log_type_enabled(v38, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v38, OS_LOG_TYPE_DEBUG, "Client is in sync with client cache", buf, 2u);
    }

    BOOL v39 = 1;
    goto LABEL_42;
  }

  unsigned __int8 v36 = [(id)v33 isEqual:v34];

  if ((v36 & 1) != 0) {
    goto LABEL_38;
  }
LABEL_33:
  if (_CPLSilentLogging)
  {
    BOOL v39 = 0;
    goto LABEL_43;
  }

  id v37 = sub_10015409C();
  int64_t v38 = (os_log_s *)objc_claimAutoreleasedReturnValue(v37);
  if (os_log_type_enabled(v38, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v38,  OS_LOG_TYPE_DEBUG,  "Client is not in sync with client cache",  buf,  2u);
  }

  BOOL v39 = 0;
LABEL_42:

LABEL_43:
  self->_isClientInSyncWithClientCache = v39;

  id v15 = 0LL;
  char v30 = 1;
LABEL_44:
  __int128 v42 = (NSDate *)objc_claimAutoreleasedReturnValue( -[CPLPrequeliteStore valueForGlobalVariable:]( self,  "valueForGlobalVariable:",  self->_libraryCreationDateVar));
  libraryCreationDate = self->_libraryCreationDate;
  self->_libraryCreationDate = v42;

  if ((v30 & 1) == 0)
  {
    v49 = (void *)objc_claimAutoreleasedReturnValue(-[CPLPrequeliteStore corruptionInfo](self, "corruptionInfo"));
    if (v49)
    {
      if (!_CPLSilentLogging)
      {
        id v50 = sub_10015409C();
        uint64_t v51 = (os_log_s *)objc_claimAutoreleasedReturnValue(v50);
        if (os_log_type_enabled(v51, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          v82 = v49;
          _os_log_impl( (void *)&_mh_execute_header,  v51,  OS_LOG_TYPE_ERROR,  "Library has been marked as corrupted. Can't open. Extra information:\n%@",  buf,  0xCu);
        }
      }

      uint64_t v52 = objc_claimAutoreleasedReturnValue( +[CPLErrors cplErrorWithCode:description:]( &OBJC_CLASS___CPLErrors,  "cplErrorWithCode:description:",  3LL,  @"Library is corrupted"));

      id v15 = (id)v52;
    }

    if (a3) {
      *a3 = v15;
    }

    goto LABEL_78;
  }

  if (!-[CPLSimpleUpgradeHistory versionHasChanged](self->_history, "versionHasChanged"))
  {
    v53 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](&OBJC_CLASS___NSUserDefaults, "standardUserDefaults"));
    unsigned int v54 = [v53 BOOLForKey:@"CPLAlwaysCheckDisabledFeatures"];

    if (v54)
    {
      if (!_CPLSilentLogging)
      {
        id v55 = sub_10015409C();
        __int128 v56 = (os_log_s *)objc_claimAutoreleasedReturnValue(v55);
        if (os_log_type_enabled(v56, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl( (void *)&_mh_execute_header,  v56,  OS_LOG_TYPE_DEFAULT,  "Will request an update of disabled features (at each launch)",  buf,  2u);
        }
      }

      if (!-[CPLPrequeliteStore setShouldUpdateDisabledFeaturesWithError:]( self,  "setShouldUpdateDisabledFeaturesWithError:",  a3)) {
        goto LABEL_77;
      }
    }

    goto LABEL_70;
  }

  __int128 v44 = (void *)objc_claimAutoreleasedReturnValue(-[CPLPrequeliteStore disabledFeatures](self, "disabledFeatures"));
  if (![v44 count])
  {

    goto LABEL_70;
  }

  if (!_CPLSilentLogging)
  {
    id v45 = sub_10015409C();
    v46 = (os_log_s *)objc_claimAutoreleasedReturnValue(v45);
    if (os_log_type_enabled(v46, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v47 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v44, "componentsJoinedByString:", @", "));
      *(_DWORD *)buf = 138412290;
      v82 = v47;
      _os_log_impl( (void *)&_mh_execute_header,  v46,  OS_LOG_TYPE_DEFAULT,  "Previously disabled features: %@ - will request an update of disabled features",  buf,  0xCu);
    }
  }

  unsigned __int8 v48 = -[CPLPrequeliteStore setShouldUpdateDisabledFeaturesWithError:]( self,  "setShouldUpdateDisabledFeaturesWithError:",  a3);

  if ((v48 & 1) != 0)
  {
LABEL_70:
    if (!-[CPLSimpleUpgradeHistory versionHasChanged](self->_history, "versionHasChanged"))
    {
      __int128 v57 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](&OBJC_CLASS___NSUserDefaults, "standardUserDefaults"));
      unsigned int v58 = [v57 BOOLForKey:@"CPLAlwaysReidentifyScopes"];

      if (!v58) {
        goto LABEL_87;
      }
    }

    v59 = (void *)objc_claimAutoreleasedReturnValue(-[CPLPrequeliteStore abstractObject](self, "abstractObject"));
    uint64_t v60 = (void *)objc_claimAutoreleasedReturnValue([v59 scopes]);
    v61 = (void *)objc_claimAutoreleasedReturnValue([v60 platformObject]);

    unsigned __int8 v62 = [v61 forceIdentifyUknownScopesWithError:a3];
    if ((v62 & 1) != 0)
    {
LABEL_87:
      if (!self->_reentrencyGuard && self->_didWipeLibrary)
      {
        uint64_t v63 = (void *)objc_claimAutoreleasedReturnValue(-[CPLPrequeliteStore abstractObject](self, "abstractObject"));
        [v63 noteOtherResetEvent:@"wipe" cause:self->_wipeReason];

        v64 = (void *)objc_claimAutoreleasedReturnValue(-[CPLPrequeliteStore abstractObject](self, "abstractObject"));
        v65 = (void *)objc_claimAutoreleasedReturnValue([v64 engineLibrary]);
        [v65 notifyAttachedObjectsPullQueueIsFull];

        wipeReason = self->_wipeReason;
        self->_wipeReason = 0LL;

        self->_didWipeLibrary = 0;
      }

      v67 = (PQLConnection *)objc_claimAutoreleasedReturnValue(-[CPLPrequeliteStore abstractObject](self, "abstractObject"));
      v68 = (void *)objc_claimAutoreleasedReturnValue(-[PQLConnection engineLibrary](v67, "engineLibrary"));
      uint64_t v69 = (void *)objc_claimAutoreleasedReturnValue([v68 libraryIdentifier]);
      +[CPLPrequelitePreventWipeNotification resetNotificationForLibraryIdentifier:]( &OBJC_CLASS___CPLPrequelitePreventWipeNotification,  "resetNotificationForLibraryIdentifier:",  v69);

      id v15 = 0LL;
      BOOL v70 = 1;
      goto LABEL_80;
    }
  }

- (BOOL)openWithError:(id *)a3
{
  id v5 = objc_alloc(&OBJC_CLASS___CPLSimpleUpgradeHistory);
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[CPLPrequeliteStore abstractObject](self, "abstractObject"));
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 engineLibrary]);
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 libraryIdentifier]);
  id v9 = -[CPLSimpleUpgradeHistory initWithLibraryIdentifier:](v5, "initWithLibraryIdentifier:", v8);
  history = self->_history;
  self->_history = v9;

  id v20 = 0LL;
  BOOL v11 = -[CPLPrequeliteStore _openWithError:](self, "_openWithError:", &v20);
  id v12 = v20;
  if (v11)
  {
    if (!_CPLSilentLogging)
    {
      id v13 = sub_10015409C();
      unsigned __int8 v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        id v15 = (void *)objc_claimAutoreleasedReturnValue(-[PQLConnection userVersion](self->_db, "userVersion"));
        id v16 = [v15 longLongValue];
        *(_DWORD *)buf = 134217984;
        id v22 = v16;
        _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_DEFAULT,  "Opened storage with version %lld",  buf,  0xCu);
      }
    }

    -[CPLPrequeliteStore _scheduleClientCacheDropIfNecessary](self, "_scheduleClientCacheDropIfNecessary");
  }

  else
  {
    if (!_CPLSilentLogging)
    {
      id v17 = sub_10015409C();
      id v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(v17);
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        id v22 = v12;
        _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_ERROR, "Failed to open database: %@", buf, 0xCu);
      }
    }

    if (a3) {
      *a3 = v12;
    }
  }

  return v11;
}

- (BOOL)executePostOpenWithError:(id *)a3
{
  if (self->_needsToReset)
  {
    id v5 = (void *)objc_claimAutoreleasedReturnValue(-[CPLPrequeliteStore abstractObject](self, "abstractObject"));
    id v6 = v5;
    switch(self->_resetOption)
    {
      case 0uLL:
        unsigned __int8 v7 = [v5 resetLocalSyncStateWithCause:self->_resetReason error:a3];
        goto LABEL_9;
      case 1uLL:
        unsigned __int8 v7 = [v5 resetCompleteSyncStateWithCause:self->_resetReason error:a3];
        goto LABEL_9;
      case 2uLL:
        unsigned __int8 v7 = [v5 resetCompleteSyncStateIncludingIDMappingWithCause:self->_resetReason error:a3];
        goto LABEL_9;
      case 3uLL:
        unsigned __int8 v7 = [v5 resetSyncAnchorWithCause:self->_resetReason error:a3];
LABEL_9:
        BOOL v8 = v7;
        break;
      default:
        BOOL v8 = 1;
        break;
    }
  }

  else
  {
    BOOL v8 = 1;
  }

  self->_needsToReset = 0;
  resetReason = self->_resetReason;
  self->_resetReason = 0LL;

  self->_unint64_t resetOption = 0LL;
  return v8;
}

- (void)performReadTransaction:(id)a3 withBlock:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  queue = self->_queue;
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472LL;
  v14[2] = sub_100159978;
  v14[3] = &unk_10023DB10;
  v14[4] = self;
  id v15 = v6;
  id v16 = v7;
  id v9 = v14;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10015ECB8;
  block[3] = &unk_10023DBC8;
  id v18 = v9;
  id v10 = queue;
  id v11 = v7;
  id v12 = v6;
  dispatch_block_t v13 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
  dispatch_async(v10, v13);
}

- (void)performWriteTransaction:(id)a3 withBlock:(id)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = (void *)objc_claimAutoreleasedReturnValue([v8 blocker]);
  id v12 = v11;
  if (v11) {
    dispatch_block_t v13 = (OS_dispatch_queue *)objc_claimAutoreleasedReturnValue([v11 bypassQueue]);
  }
  else {
    dispatch_block_t v13 = self->_writeQueue;
  }
  unsigned __int8 v14 = v13;
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472LL;
  v21[2] = sub_100159E38;
  v21[3] = &unk_10023F068;
  v21[4] = self;
  id v22 = v8;
  id v23 = v10;
  id v24 = v9;
  id v15 = v21;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10015ECB8;
  block[3] = &unk_10023DBC8;
  id v26 = v15;
  id v16 = v14;
  id v17 = v9;
  id v18 = v10;
  id v19 = v8;
  dispatch_block_t v20 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
  dispatch_async(v16, v20);
}

- (void)blockWriteTransactionsWithCompletionHandler:(id)a3
{
  id v4 = a3;
  writeQueue = self->_writeQueue;
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472LL;
  v10[2] = sub_10015A21C;
  v10[3] = &unk_10023E058;
  v10[4] = self;
  id v11 = v4;
  id v6 = v10;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10015ECB8;
  block[3] = &unk_10023DBC8;
  id v13 = v6;
  id v7 = writeQueue;
  id v8 = v4;
  dispatch_block_t v9 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
  dispatch_async(v7, v9);
}

- (BOOL)closeWithError:(id *)a3
{
  unsigned __int8 v4 = -[PQLConnection close:](self->_db, "close:", a3);
  db = self->_db;
  self->_db = 0LL;

  return v4;
}

- (void)performBarrierTransaction:(id)a3 withBlock:(id)a4
{
  id v5 = a4;
  queue = self->_queue;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472LL;
  v11[2] = sub_10015A3AC;
  v11[3] = &unk_10023DBC8;
  id v12 = v5;
  id v7 = v11;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10015ECB8;
  block[3] = &unk_10023DBC8;
  id v14 = v7;
  id v8 = queue;
  id v9 = v5;
  dispatch_block_t v10 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
  dispatch_async(v8, v10);
}

- (void)performBarrier
{
}

- (unint64_t)libraryOptions
{
  v2 = (void *)objc_claimAutoreleasedReturnValue( -[CPLPrequeliteStore valueForGlobalVariable:]( self,  "valueForGlobalVariable:",  self->_libraryOptionsVar));
  id v3 = [v2 integerValue];

  return (unint64_t)v3;
}

- (BOOL)updateLibraryOptions:(unint64_t)a3 error:(id *)a4
{
  unint64_t v7 = -[CPLPrequeliteStore libraryOptions](self, "libraryOptions");
  unint64_t v8 = v7;
  if ((v7 & ~a3) != 0)
  {
    id v16 = -[NSString initWithFormat:]( objc_alloc(&OBJC_CLASS___NSString),  "initWithFormat:",  @"downgrading library options from 0x%lx to 0x%lx",  v7,  a3);
    if ([(id)objc_opt_class(self) shouldPreventWipeOnUpgrade]
      && !-[CPLPrequeliteStore _hasDeactivateMarker](self, "_hasDeactivateMarker"))
    {
      if (a4) {
        *a4 = (id)objc_claimAutoreleasedReturnValue( +[CPLErrors preventWipeErrorWithReason:preventedByUser:]( &OBJC_CLASS___CPLErrors,  "preventWipeErrorWithReason:preventedByUser:",  v16,  0LL));
      }
    }

    else if (a4)
    {
      uint64_t v18 = CPLErrorWipeReasonKey;
      id v19 = v16;
      id v17 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v19,  &v18,  1LL));
      *a4 = (id)objc_claimAutoreleasedReturnValue( +[CPLErrors cplErrorWithCode:underlyingError:userInfo:description:]( &OBJC_CLASS___CPLErrors,  "cplErrorWithCode:underlyingError:userInfo:description:",  2003LL,  0LL,  v17,  @"Downgrading options of a library (from 0x%lx to 0x%lx)",  v8,  a3));
    }
  }

  else
  {
    unint64_t v9 = a3 & ~v7;
    if (!v9) {
      return 1;
    }
    dispatch_block_t v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInteger:", a3));
    unsigned int v11 = -[CPLPrequeliteStore setValue:forGlobalVariable:error:]( self,  "setValue:forGlobalVariable:error:",  v10,  self->_libraryOptionsVar,  a4);

    if (v11)
    {
      id v12 = (void *)objc_claimAutoreleasedReturnValue(-[CPLPrequeliteStore abstractObject](self, "abstractObject"));
      id v13 = (void *)objc_claimAutoreleasedReturnValue([v12 scopes]);
      unsigned __int8 v14 = [v13 upgradeScopesWithNewLibraryOptions:v9 error:a4];

      return v14;
    }
  }

  return 0;
}

- (id)libraryVersion
{
  return -[CPLPrequeliteStore valueForGlobalVariable:](self, "valueForGlobalVariable:", self->_libraryVersionVar);
}

- (BOOL)storeLibraryVersion:(id)a3 withError:(id *)a4
{
  return -[CPLPrequeliteStore setValue:forGlobalVariable:error:]( self,  "setValue:forGlobalVariable:error:",  a3,  self->_libraryVersionVar,  a4);
}

- (id)createNewLibraryVersion
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](&OBJC_CLASS___NSUUID, "UUID"));
  id v3 = (void *)objc_claimAutoreleasedReturnValue([v2 UUIDString]);

  return v3;
}

- (id)pqlConnection
{
  return self->_db;
}

- (void)_cacheValue:(id)a3 forVariable:(id)a4
{
  modifiedVariables = self->_modifiedVariables;
  id v7 = a4;
  id v8 = a3;
  -[NSMutableSet addObject:](modifiedVariables, "addObject:", v7);
  [v7 setCachedValue:v8 forIdentifier:self->_globalVariableCacheIdentifier];
}

- (BOOL)addGlobalVariable:(id)a3 defaultValue:(id)a4 error:(id *)a5
{
  id v8 = (CPLPrequeliteStore *)a3;
  id v9 = a4;
  if (!_CPLSilentLogging)
  {
    id v10 = sub_10015409C();
    unsigned int v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    {
      id v12 = (void *)objc_claimAutoreleasedReturnValue(-[CPLPrequeliteStore type](v8, "type"));
      *(_DWORD *)buf = 138413058;
      uint64_t v29 = self;
      __int16 v30 = 2112;
      id v31 = v8;
      __int16 v32 = 2112;
      id v33 = v12;
      __int16 v34 = 2112;
      id v35 = v9;
      _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEBUG,  "%@ adding global variable %@ (%@ - default:%@)",  buf,  0x2Au);
    }
  }

  db = self->_db;
  unsigned __int8 v14 = (void *)objc_claimAutoreleasedReturnValue(-[CPLPrequeliteStore columnDefinition](v8, "columnDefinition"));
  LODWORD(db) = -[PQLConnection cplExecute:](db, "cplExecute:", @"ALTER TABLE globals ADD COLUMN %@", v14);

  if ((_DWORD)db)
  {
    unint64_t v15 = (unint64_t)v9;
    id v16 = (void *)objc_claimAutoreleasedReturnValue(-[CPLPrequeliteStore defaultValue](v8, "defaultValue"));
    unint64_t v17 = (unint64_t)v16;
    if (v15 && v16)
    {
      unsigned __int8 v18 = [(id)v15 isEqual:v16];

      if ((v18 & 1) != 0) {
        goto LABEL_12;
      }
    }

    else
    {

      if (!(v15 | v17))
      {
LABEL_12:
        -[CPLPrequeliteStore _cacheValue:forVariable:](self, "_cacheValue:forVariable:", v15, v8);
        BOOL v21 = 1;
        goto LABEL_20;
      }
    }

    id v19 = self->_db;
    dispatch_block_t v20 = (void *)objc_claimAutoreleasedReturnValue(-[CPLPrequeliteStore bindableValueForValue:](v8, "bindableValueForValue:", v15));
    LOBYTE(v19) = -[PQLConnection cplExecute:](v19, "cplExecute:", @"UPDATE globals SET %@ = %@", v8, v20);
  }

  if (!_CPLSilentLogging)
  {
    id v22 = sub_10015409C();
    id v23 = (os_log_s *)objc_claimAutoreleasedReturnValue(v22);
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      id v24 = (CPLPrequeliteStore *)objc_claimAutoreleasedReturnValue(-[CPLPrequeliteStore type](v8, "type"));
      id v25 = (void *)objc_claimAutoreleasedReturnValue(-[PQLConnection lastCPLError](self->_db, "lastCPLError"));
      *(_DWORD *)buf = 138413058;
      uint64_t v29 = v8;
      __int16 v30 = 2112;
      id v31 = v24;
      __int16 v32 = 2112;
      id v33 = v9;
      __int16 v34 = 2112;
      id v35 = v25;
      _os_log_impl( (void *)&_mh_execute_header,  v23,  OS_LOG_TYPE_ERROR,  "Unable to add global variable %@ (%@ - default: %@) to database: %@",  buf,  0x2Au);
    }
  }

  if (a5)
  {
    id v26 = (id)objc_claimAutoreleasedReturnValue(-[PQLConnection lastCPLError](self->_db, "lastCPLError"));
    BOOL v21 = 0;
    *a5 = v26;
  }

  else
  {
    BOOL v21 = 0;
  }

- (BOOL)setValue:(id)a3 forGlobalVariable:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  db = self->_db;
  unsigned int v11 = (void *)objc_claimAutoreleasedReturnValue([v9 bindableValueForValue:v8]);
  unsigned __int8 v12 = -[PQLConnection cplExecute:](db, "cplExecute:", @"UPDATE globals SET %@ = %@", v9, v11);

  if ((v12 & 1) != 0)
  {
    -[CPLPrequeliteStore _cacheValue:forVariable:](self, "_cacheValue:forVariable:", v8, v9);
  }

  else if (a5)
  {
    *a5 = (id)objc_claimAutoreleasedReturnValue(-[PQLConnection lastCPLError](self->_db, "lastCPLError"));
  }

  return v12;
}

- (id)valueForGlobalVariable:(id)a3
{
  id v4 = a3;
  if ([v4 hasCachedValueForIdentifier:self->_globalVariableCacheIdentifier])
  {
    id v5 = (id)objc_claimAutoreleasedReturnValue([v4 cachedValueForIdentifier:self->_globalVariableCacheIdentifier]);
  }

  else
  {
    db = self->_db;
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472LL;
    v9[2] = sub_10015AB5C;
    v9[3] = &unk_100247278;
    id v7 = v4;
    id v10 = v7;
    id v5 = -[PQLConnection cplFetchObject:sql:](db, "cplFetchObject:sql:", v9, @"SELECT %@ FROM globals", v7);
    -[CPLPrequeliteStore _cacheValue:forVariable:](self, "_cacheValue:forVariable:", v5, v7);
  }

  return v5;
}

- (BOOL)resetValueForGlobalVariable:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 defaultValue]);
  LOBYTE(a4) = -[CPLPrequeliteStore setValue:forGlobalVariable:error:]( self,  "setValue:forGlobalVariable:error:",  v7,  v6,  a4);

  return (char)a4;
}

- (Class)_userIdentifierClass
{
  Class userIdentifierClass = self->_userIdentifierClass;
  if (!userIdentifierClass)
  {
    id v5 = (void *)objc_claimAutoreleasedReturnValue(-[CPLPrequeliteStore abstractObject](self, "abstractObject"));
    id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 engineLibrary]);
    id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 transport]);
    self->_Class userIdentifierClass = (Class)[v7 userIdentifierClass];

    Class userIdentifierClass = self->_userIdentifierClass;
    if (!userIdentifierClass) {
      sub_10019A8F8((uint64_t)a2, (uint64_t)self);
    }
  }

  return userIdentifierClass;
}

- (id)userIdentifier
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue( -[CPLPrequeliteStore valueForGlobalVariable:]( self,  "valueForGlobalVariable:",  self->_userIdentifierVar));
  if (v3)
  {
    id v4 = (void *)objc_claimAutoreleasedReturnValue( +[NSKeyedUnarchiver cpl_safeUnarchiveObjectWithData:class:]( &OBJC_CLASS___NSKeyedUnarchiver,  "cpl_safeUnarchiveObjectWithData:class:",  v3,  -[CPLPrequeliteStore _userIdentifierClass](self, "_userIdentifierClass")));
    if (!v4)
    {
      id v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](&OBJC_CLASS___NSUUID, "UUID"));
      id v4 = (void *)objc_claimAutoreleasedReturnValue([v5 UUIDString]);

      if (!_CPLSilentLogging)
      {
        id v6 = sub_10015409C();
        id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
        if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
        {
          int v9 = 138412290;
          id v10 = v4;
          _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_ERROR,  "Can't decode user identifier, will use a fake user identifier (%@) and we will reset everything",  (uint8_t *)&v9,  0xCu);
        }
      }
    }
  }

  else
  {
    id v4 = 0LL;
  }

  return v4;
}

- (BOOL)storeUserIdentifier:(id)a3 error:(id *)a4
{
  id v7 = a3;
  if (v7)
  {
    id v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSKeyedArchiver cpl_archivedDataWithRootObject:]( &OBJC_CLASS___NSKeyedArchiver,  "cpl_archivedDataWithRootObject:",  v7));
    if (!v8) {
      sub_10019A9B0((uint64_t)v7, (uint64_t)a2, (uint64_t)self);
    }
  }

  else
  {
    id v8 = 0LL;
  }

  userIdentifierVar = self->_userIdentifierVar;
  id v15 = 0LL;
  BOOL v10 = -[CPLPrequeliteStore setValue:forGlobalVariable:error:]( self,  "setValue:forGlobalVariable:error:",  v8,  userIdentifierVar,  &v15);
  id v11 = v15;
  if (!v10)
  {
    if (!_CPLSilentLogging)
    {
      id v12 = sub_10015409C();
      id v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412546;
        id v17 = v7;
        __int16 v18 = 2112;
        id v19 = v11;
        _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_ERROR,  "Can't save user identifier %@: %@",  buf,  0x16u);
      }
    }

    if (a4) {
      *a4 = v11;
    }
  }

  return v10;
}

- (id)lastQuarantineCountReportDate
{
  v2 = (void *)objc_claimAutoreleasedReturnValue( -[CPLPrequeliteStore valueForGlobalVariable:]( self,  "valueForGlobalVariable:",  self->_lastQuarantineCountReportDateVar));
  id v3 = v2;
  if (v2) {
    id v4 = v2;
  }
  else {
    id v4 = (id)objc_claimAutoreleasedReturnValue(+[NSDate distantPast](&OBJC_CLASS___NSDate, "distantPast"));
  }
  id v5 = v4;

  return v5;
}

- (BOOL)storeLastQuarantineCountReportDate:(id)a3 error:(id *)a4
{
  return -[CPLPrequeliteStore setValue:forGlobalVariable:error:]( self,  "setValue:forGlobalVariable:error:",  a3,  self->_lastQuarantineCountReportDateVar,  a4);
}

- (id)clientCacheIdentifier
{
  return -[CPLPrequeliteStore valueForGlobalVariable:](self, "valueForGlobalVariable:", self->_clientCacheIdentifierVar);
}

- (BOOL)storeClientCacheIdentifier:(id)a3 error:(id *)a4
{
  return -[CPLPrequeliteStore setValue:forGlobalVariable:error:]( self,  "setValue:forGlobalVariable:error:",  a3,  self->_clientCacheIdentifierVar,  a4);
}

- (id)createNewClientCacheIdentifier
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](&OBJC_CLASS___NSUUID, "UUID"));
  id v3 = (void *)objc_claimAutoreleasedReturnValue([v2 UUIDString]);

  return v3;
}

- (BOOL)storeClientIsInSyncWithClientCacheWithError:(id *)a3
{
  if (self->_isClientInSyncWithClientCache) {
    return 1;
  }
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[CPLPrequeliteStore clientCacheIdentifier](self, "clientCacheIdentifier"));
  LODWORD(a3) = -[CPLPrequeliteStore setValue:forGlobalVariable:error:]( self,  "setValue:forGlobalVariable:error:",  v5,  self->_clientCacheIdentifierAsKnownByClient,  a3);

  if ((_DWORD)a3)
  {
    id v6 = (void *)objc_claimAutoreleasedReturnValue(-[CPLPrequeliteStore abstractObject](self, "abstractObject"));
    id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 engineLibrary]);
    id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 scheduler]);
    [v8 noteClientIsInSyncWithClientCache];

    isClientInSyncWithClientCacheQueue = self->_isClientInSyncWithClientCacheQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_10015B198;
    block[3] = &unk_10023DC70;
    void block[4] = self;
    dispatch_sync((dispatch_queue_t)isClientInSyncWithClientCacheQueue, block);
    return 1;
  }

  return 0;
}

- (BOOL)storeClientIsNotInSyncWithClientCacheWithError:(id *)a3
{
  if (!self->_isClientInSyncWithClientCache) {
    return 1;
  }
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[CPLPrequeliteStore abstractObject](self, "abstractObject"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 engineLibrary]);
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 scheduler]);
  [v7 noteClientIsNotInSyncWithClientCache];

  isClientInSyncWithClientCacheQueue = self->_isClientInSyncWithClientCacheQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10015B304;
  block[3] = &unk_10023DC70;
  void block[4] = self;
  dispatch_sync((dispatch_queue_t)isClientInSyncWithClientCacheQueue, block);
  return -[CPLPrequeliteStore setValue:forGlobalVariable:error:]( self,  "setValue:forGlobalVariable:error:",  0LL,  self->_clientCacheIdentifierAsKnownByClient,  a3);
}

- (BOOL)isClientInSyncWithClientCache
{
  uint64_t v6 = 0LL;
  id v7 = &v6;
  uint64_t v8 = 0x2020000000LL;
  isClientInSyncWithClientCacheQueue = self->_isClientInSyncWithClientCacheQueue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_10015B41C;
  v5[3] = &unk_10023DD58;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync((dispatch_queue_t)isClientInSyncWithClientCacheQueue, v5);
  char v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (BOOL)storePushPullGatekeepers:(id)a3 error:(id *)a4
{
  id v6 = a3;
  self->_hasCachedPushPullGatekeepers = 1;
  self->_hasModifiedPushPullGatekeepers = 1;
  if (![v6 count])
  {
    cachedPushPullGatekeepers = self->_cachedPushPullGatekeepers;
    self->_cachedPushPullGatekeepers = 0LL;

    if (-[CPLPrequeliteStore setValue:forGlobalVariable:error:]( self,  "setValue:forGlobalVariable:error:",  0LL,  self->_pushPullGatekeepersVar,  a4))
    {
      goto LABEL_13;
    }

- (NSArray)pushPullGatekeepers
{
  v2 = self;
  if (self->_hasCachedPushPullGatekeepers) {
    return self->_cachedPushPullGatekeepers;
  }
  self->_hasCachedPushPullGatekeepers = 1;
  self->_hasModifiedPushPullGatekeepers = 0;
  id v4 = (void *)objc_claimAutoreleasedReturnValue( -[CPLPrequeliteStore valueForGlobalVariable:]( self,  "valueForGlobalVariable:",  self->_pushPullGatekeepersVar));
  if ([v4 length])
  {
    id v33 = 0LL;
    id v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSPropertyListSerialization propertyListWithData:options:format:error:]( &OBJC_CLASS___NSPropertyListSerialization,  "propertyListWithData:options:format:error:",  v4,  0LL,  0LL,  &v33));
    id v6 = (objc_class *)v33;
    id v7 = v6;
    if (v5)
    {
      __int128 v25 = (NSArray *)v6;
      __int128 v27 = v4;
      __int128 v28 = -[NSMutableArray initWithCapacity:]( [NSMutableArray alloc],  "initWithCapacity:",  [v5 count]);
      __int128 v26 = v2;
      id v8 = (void *)objc_claimAutoreleasedReturnValue(-[CPLPrequeliteStore abstractObject](v2, "abstractObject"));
      __int128 v29 = 0u;
      __int128 v30 = 0u;
      __int128 v31 = 0u;
      __int128 v32 = 0u;
      id v24 = v5;
      id v9 = v5;
      id v10 = [v9 countByEnumeratingWithState:&v29 objects:v34 count:16];
      if (!v10) {
        goto LABEL_24;
      }
      id v11 = v10;
      uint64_t v12 = *(void *)v30;
      while (1)
      {
        for (i = 0LL; i != v11; i = (char *)i + 1)
        {
          if (*(void *)v30 != v12) {
            objc_enumerationMutation(v9);
          }
          unsigned __int8 v14 = *(NSString **)(*((void *)&v29 + 1) + 8LL * (void)i);
          Class v15 = NSClassFromString(v14);
          if (v15
            && (id v16 = v15,
                -[objc_class isSubclassOfClass:]( v15,  "isSubclassOfClass:",  objc_opt_class(&OBJC_CLASS___CPLPushPullGatekeeper))))
          {
            id v17 = (os_log_s *)[[v16 alloc] initWithStore:v8];
            if (v17)
            {
              -[NSMutableArray addObject:](v28, "addObject:", v17);
            }

            else if (!_CPLSilentLogging)
            {
              id v19 = sub_10015409C();
              unsigned __int8 v20 = (os_log_s *)objc_claimAutoreleasedReturnValue(v19);
              if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 138412290;
                unsigned __int8 v36 = v16;
                _os_log_impl( (void *)&_mh_execute_header,  v20,  OS_LOG_TYPE_DEFAULT,  "Ignoring push/pull gatekeeper %@",  buf,  0xCu);
              }
            }
          }

          else
          {
            if (_CPLSilentLogging) {
              continue;
            }
            id v18 = sub_10015409C();
            id v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v18);
            if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138543362;
              unsigned __int8 v36 = (objc_class *)v14;
              _os_log_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_ERROR,  "Invalid push/pull gatekeeper class: %{public}@",  buf,  0xCu);
            }
          }
        }

        id v11 = [v9 countByEnumeratingWithState:&v29 objects:v34 count:16];
        if (!v11)
        {
LABEL_24:

          BOOL v21 = v28;
          if (-[NSMutableArray count](v28, "count"))
          {
            objc_storeStrong((id *)&v26->_cachedPushPullGatekeepers, v28);

            id v4 = v27;
            cachedPushPullGatekeepers = v25;
            goto LABEL_33;
          }

          v2 = v26;
          id v4 = v27;
          id v5 = v24;
          id v7 = (objc_class *)v25;
LABEL_30:

          goto LABEL_31;
        }
      }
    }

    if (!_CPLSilentLogging)
    {
      id v23 = sub_10015409C();
      BOOL v21 = (NSMutableArray *)objc_claimAutoreleasedReturnValue(v23);
      if (os_log_type_enabled((os_log_t)v21, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        unsigned __int8 v36 = v7;
        _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)v21,  OS_LOG_TYPE_ERROR,  "Invalid plist for push/pull gatekeepers: %@",  buf,  0xCu);
      }

      goto LABEL_30;
    }

- (BOOL)hasStoredChangeSessionUpdate
{
  if (self->_hasCachedChangeSessionUpdate) {
    return self->_cachedChangeSessionUpdate != 0LL;
  }
  id v3 = -[PQLConnection fetchObjectOfClass:sql:]( self->_db,  "fetchObjectOfClass:sql:",  objc_opt_class(&OBJC_CLASS___NSNumber),  @"SELECT count(*) FROM globals WHERE %@ IS NOT NULL",  self->_changeSessionUpdateVar);
  BOOL v2 = [v3 unsignedIntegerValue] != 0;

  return v2;
}

- (CPLChangeSessionUpdate)storedChangeSessionUpdate
{
  if (self->_hasCachedChangeSessionUpdate) {
    return self->_cachedChangeSessionUpdate;
  }
  id v4 = objc_autoreleasePoolPush();
  id v5 = (void *)objc_claimAutoreleasedReturnValue( -[CPLPrequeliteStore valueForGlobalVariable:]( self,  "valueForGlobalVariable:",  self->_changeSessionUpdateVar));
  if (!v5) {
    goto LABEL_9;
  }
  id v6 = +[NSKeyedUnarchiver cpl_safeUnarchiveObjectWithData:class:]( &OBJC_CLASS___NSKeyedUnarchiver,  "cpl_safeUnarchiveObjectWithData:class:",  v5,  objc_opt_class(&OBJC_CLASS___CPLChangeSessionUpdate));
  id v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  if (!v7)
  {
    if (!_CPLSilentLogging)
    {
      id v8 = sub_10015409C();
      id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)id v10 = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_ERROR,  "Can't decode stored change session update",  v10,  2u);
      }
    }

- (BOOL)storeChangeSessionUpdate:(id)a3 error:(id *)a4
{
  id v8 = a3;
  id v9 = objc_autoreleasePoolPush();
  if (v8)
  {
    uint64_t v10 = objc_claimAutoreleasedReturnValue( +[NSKeyedArchiver cpl_archivedDataWithRootObject:]( &OBJC_CLASS___NSKeyedArchiver,  "cpl_archivedDataWithRootObject:",  v8));
    if (!v10) {
      sub_10019AB54((uint64_t)v8, (uint64_t)a2, (uint64_t)self);
    }
    id v11 = (void *)v10;
    changeSessionUpdateVar = self->_changeSessionUpdateVar;
    id v20 = 0LL;
    unsigned __int8 v13 = -[CPLPrequeliteStore setValue:forGlobalVariable:error:]( self,  "setValue:forGlobalVariable:error:",  v10,  changeSessionUpdateVar,  &v20);
    id v14 = v20;

    objc_autoreleasePoolPop(v9);
    if ((v13 & 1) != 0) {
      goto LABEL_4;
    }
  }

  else
  {
    id v16 = self->_changeSessionUpdateVar;
    id v19 = 0LL;
    unsigned __int8 v17 = -[CPLPrequeliteStore setValue:forGlobalVariable:error:]( self,  "setValue:forGlobalVariable:error:",  0LL,  v16,  &v19);
    id v14 = v19;
    objc_autoreleasePoolPop(v9);
    if ((v17 & 1) != 0)
    {
LABEL_4:
      BOOL v15 = 1;
      self->_hasCachedChangeSessionUpdate = 1;
      objc_storeStrong((id *)&self->_cachedChangeSessionUpdate, a3);
      goto LABEL_9;
    }
  }

  if (a4)
  {
    id v14 = v14;
    BOOL v15 = 0;
    *a4 = v14;
  }

  else
  {
    BOOL v15 = 0;
  }

- (BOOL)shouldUpdateDisabledFeatures
{
  BOOL v2 = (void *)objc_claimAutoreleasedReturnValue( -[CPLPrequeliteStore valueForGlobalVariable:]( self,  "valueForGlobalVariable:",  self->_shouldUpdateDisabledFeaturesVar));
  unsigned __int8 v3 = [v2 BOOLValue];

  return v3;
}

- (BOOL)setShouldUpdateDisabledFeaturesWithError:(id *)a3
{
  return -[CPLPrequeliteStore setValue:forGlobalVariable:error:]( self,  "setValue:forGlobalVariable:error:",  &off_10025A440,  self->_shouldUpdateDisabledFeaturesVar,  a3);
}

- (BOOL)storeDisabledFeatures:(id)a3 error:(id *)a4
{
  id v6 = a3;
  if ([v6 count])
  {
    id v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSPropertyListSerialization dataWithPropertyList:format:options:error:]( &OBJC_CLASS___NSPropertyListSerialization,  "dataWithPropertyList:format:options:error:",  v6,  200LL,  0LL,  a4));
    if (!v7) {
      goto LABEL_7;
    }
  }

  else
  {
    id v7 = 0LL;
  }

  if (!-[CPLPrequeliteStore setValue:forGlobalVariable:error:]( self,  "setValue:forGlobalVariable:error:",  v7,  self->_disabledFeaturesDataVar,  a4))
  {
LABEL_7:
    BOOL v8 = 0;
    goto LABEL_8;
  }

  BOOL v8 = -[CPLPrequeliteStore setValue:forGlobalVariable:error:]( self,  "setValue:forGlobalVariable:error:",  &off_10025A428,  self->_shouldUpdateDisabledFeaturesVar,  0LL);
LABEL_8:

  return v8;
}

- (id)disabledFeatures
{
  BOOL v2 = (void *)objc_claimAutoreleasedReturnValue( -[CPLPrequeliteStore valueForGlobalVariable:]( self,  "valueForGlobalVariable:",  self->_disabledFeaturesDataVar));
  if (v2)
  {
    unsigned __int8 v3 = (void *)objc_claimAutoreleasedReturnValue( +[NSPropertyListSerialization propertyListWithData:options:format:error:]( &OBJC_CLASS___NSPropertyListSerialization,  "propertyListWithData:options:format:error:",  v2,  0LL,  0LL,  0LL));
    uint64_t v4 = objc_opt_class(&OBJC_CLASS___NSArray);
    if ((objc_opt_isKindOfClass(v3, v4) & 1) != 0) {
      goto LABEL_5;
    }
  }

  unsigned __int8 v3 = 0LL;
LABEL_5:
  if (v3) {
    id v5 = v3;
  }
  else {
    id v5 = &__NSArray0__struct;
  }
  id v6 = v5;

  return v6;
}

- (id)derivativesFilter
{
  BOOL v2 = (void *)objc_claimAutoreleasedReturnValue( -[CPLPrequeliteStore valueForGlobalVariable:]( self,  "valueForGlobalVariable:",  self->_derivativesFilterVar));
  if (v2)
  {
    id v3 = +[NSKeyedUnarchiver cpl_safeUnarchiveObjectWithData:class:]( &OBJC_CLASS___NSKeyedUnarchiver,  "cpl_safeUnarchiveObjectWithData:class:",  v2,  objc_opt_class(&OBJC_CLASS___CPLDerivativesFilter));
    uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  }

  else
  {
    uint64_t v4 = 0LL;
  }

  return v4;
}

- (BOOL)storeDerivativesFilter:(id)a3 error:(id *)a4
{
  id v7 = a3;
  uint64_t v8 = objc_claimAutoreleasedReturnValue( +[NSKeyedArchiver cpl_archivedDataWithRootObject:]( &OBJC_CLASS___NSKeyedArchiver,  "cpl_archivedDataWithRootObject:",  v7));
  if (!v8) {
    sub_10019AC34((uint64_t)v7, (uint64_t)a2, (uint64_t)self);
  }
  id v9 = (void *)v8;
  BOOL v10 = -[CPLPrequeliteStore setValue:forGlobalVariable:error:]( self,  "setValue:forGlobalVariable:error:",  v8,  self->_derivativesFilterVar,  a4);

  return v10;
}

+ (id)_wipeStoreMarkerURLWithCloudLibraryStateStorageURL:(id)a3
{
  return [a3 URLByAppendingPathComponent:@"wipe_marker"];
}

- (id)_wipeStoreMarkerURL
{
  BOOL v2 = (void *)objc_claimAutoreleasedReturnValue(-[CPLPrequeliteStore abstractObject](self, "abstractObject"));
  id v3 = (void *)objc_claimAutoreleasedReturnValue([v2 engineLibrary]);
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue([v3 cloudLibraryStateStorageURL]);
  id v5 = (void *)objc_claimAutoreleasedReturnValue( +[CPLPrequeliteStore _wipeStoreMarkerURLWithCloudLibraryStateStorageURL:]( &OBJC_CLASS___CPLPrequeliteStore,  "_wipeStoreMarkerURLWithCloudLibraryStateStorageURL:",  v4));

  return v5;
}

+ (void)_writeStoreMarkerAtURL:(id)a3 reason:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v5 path]);
  unsigned __int8 v9 = [v7 fileExistsAtPath:v8];

  if ((v9 & 1) == 0)
  {
    id v17 = 0LL;
    unsigned __int8 v10 = [v6 writeToURL:v5 atomically:1 encoding:4 error:&v17];
    id v11 = v17;
    if ((v10 & 1) != 0)
    {
      if (!_CPLSilentLogging)
      {
        id v12 = sub_10015409C();
        unsigned __int8 v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
        if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
        {
          id v14 = (void *)objc_claimAutoreleasedReturnValue([v5 URLByDeletingLastPathComponent]);
          BOOL v15 = (void *)objc_claimAutoreleasedReturnValue([v14 path]);
          *(_DWORD *)buf = 138412546;
          id v19 = v15;
          __int16 v20 = 2114;
          id v21 = v6;
          _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_DEFAULT,  "Will wipe CPL database at %@ at next launch: %{public}@",  buf,  0x16u);

LABEL_9:
          goto LABEL_10;
        }

        goto LABEL_10;
      }
    }

    else if (!_CPLSilentLogging)
    {
      id v16 = sub_10015409C();
      unsigned __int8 v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        id v14 = (void *)objc_claimAutoreleasedReturnValue([v5 path]);
        *(_DWORD *)buf = 138412802;
        id v19 = v14;
        __int16 v20 = 2114;
        id v21 = v6;
        __int16 v22 = 2112;
        id v23 = v11;
        _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_ERROR,  "Failed to store wipe marker at %@ (reason: %{public}@): %@",  buf,  0x20u);
        goto LABEL_9;
      }

+ (void)wipeStoreAtNextOpeningWithCloudLibraryStorageURL:(id)a3 reason:(id)a4
{
  id v6 = a4;
  id v7 = (id)objc_claimAutoreleasedReturnValue([a1 _wipeStoreMarkerURLWithCloudLibraryStateStorageURL:a3]);
  [a1 _writeStoreMarkerAtURL:v7 reason:v6];
}

- (id)wipeReason
{
  BOOL v2 = (void *)objc_claimAutoreleasedReturnValue(-[CPLPrequeliteStore _wipeStoreMarkerURL](self, "_wipeStoreMarkerURL"));
  id v3 = -[NSString initWithContentsOfURL:encoding:error:]( objc_alloc(&OBJC_CLASS___NSString),  "initWithContentsOfURL:encoding:error:",  v2,  4LL,  0LL);
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue( +[NSCharacterSet whitespaceAndNewlineCharacterSet]( &OBJC_CLASS___NSCharacterSet,  "whitespaceAndNewlineCharacterSet"));
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSString stringByTrimmingCharactersInSet:](v3, "stringByTrimmingCharactersInSet:", v4));

  return v5;
}

- (void)_deleteWipeReason
{
  BOOL v2 = (void *)objc_claimAutoreleasedReturnValue(-[CPLPrequeliteStore _wipeStoreMarkerURL](self, "_wipeStoreMarkerURL"));
  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
  id v10 = 0LL;
  unsigned __int8 v4 = [v3 removeItemAtURL:v2 error:&v10];
  id v5 = v10;
  if ((v4 & 1) != 0)
  {
LABEL_6:

    goto LABEL_7;
  }

  id v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
  unsigned __int8 v7 = [v6 cplIsFileDoesNotExistError:v5];

  if ((v7 & 1) == 0 && !_CPLSilentLogging)
  {
    id v8 = sub_10015409C();
    id v3 = (void *)objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled((os_log_t)v3, OS_LOG_TYPE_ERROR))
    {
      unsigned __int8 v9 = (void *)objc_claimAutoreleasedReturnValue([v2 path]);
      *(_DWORD *)buf = 138412546;
      id v12 = v9;
      __int16 v13 = 2112;
      id v14 = v5;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)v3,  OS_LOG_TYPE_ERROR,  "Failed to remove wipe reason at %@: %@",  buf,  0x16u);
    }

    goto LABEL_6;
  }

- (void)wipeStoreAtNextOpeningWithReason:(id)a3 completionBlock:(id)a4
{
  id v6 = (void (**)(void))a4;
  id v7 = a3;
  id v8 = (id)objc_claimAutoreleasedReturnValue(-[CPLPrequeliteStore _wipeStoreMarkerURL](self, "_wipeStoreMarkerURL"));
  +[CPLPrequeliteStore _writeStoreMarkerAtURL:reason:]( &OBJC_CLASS___CPLPrequeliteStore,  "_writeStoreMarkerAtURL:reason:",  v8,  v7);

  v6[2](v6);
}

- (void)writeTransactionDidSucceed
{
}

- (void)writeTransactionDidFail
{
  __int128 v10 = 0u;
  __int128 v11 = 0u;
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  id v3 = self->_modifiedVariables;
  id v4 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( v3,  "countByEnumeratingWithState:objects:count:",  &v10,  v14,  16LL);
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v11;
    do
    {
      id v7 = 0LL;
      do
      {
        if (*(void *)v11 != v6) {
          objc_enumerationMutation(v3);
        }
        objc_msgSend(*(id *)(*((void *)&v10 + 1) + 8 * (void)v7), "discardCachedValue", (void)v10);
        id v7 = (char *)v7 + 1;
      }

      while (v5 != v7);
      id v5 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( v3,  "countByEnumeratingWithState:objects:count:",  &v10,  v14,  16LL);
    }

    while (v5);
  }

  -[NSMutableSet removeAllObjects](self->_modifiedVariables, "removeAllObjects");
  self->_hasCachedChangeSessionUpdate = 0;
  cachedChangeSessionUpdate = self->_cachedChangeSessionUpdate;
  self->_cachedChangeSessionUpdate = 0LL;

  if (self->_hasModifiedPushPullGatekeepers)
  {
    self->_hasCachedPushPullGatekeepers = 0;
    cachedPushPullGatekeepers = self->_cachedPushPullGatekeepers;
    self->_cachedPushPullGatekeepers = 0LL;
  }

- (id)status
{
  id v3 = objc_alloc(&OBJC_CLASS___NSMutableString);
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[PQLConnection userVersion](self->_db, "userVersion"));
  id v5 = -[NSMutableString initWithFormat:](v3, "initWithFormat:", @"db version: %@", v4);

  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(-[CPLSimpleUpgradeHistory status](self->_history, "status"));
  if ([v6 length]) {
    -[NSMutableString appendFormat:](v5, "appendFormat:", @"\n%@", v6);
  }

  return v5;
}

- (void)recordUpgradeEvent:(id)a3
{
}

- (void)recordUpgradeEvent:(id)a3 arguments:(char *)a4
{
  if (self->_upgradeEventJournal != -1)
  {
    id v6 = a3;
    id v7 = -[NSString initWithFormat:arguments:](objc_alloc(&OBJC_CLASS___NSString), "initWithFormat:arguments:", v6, a4);

    __int128 v11 = v7;
    id v8 = -[NSString UTF8String](v11, "UTF8String");
    if (v8)
    {
      unsigned __int8 v9 = v8;
      size_t v10 = strlen(v8);
      write(self->_upgradeEventJournal, v9, v10);
      write(self->_upgradeEventJournal, "\n", 1uLL);
    }
  }

- (BOOL)tableHasRecords:(id)a3
{
  db = self->_db;
  id v4 = a3;
  id v5 = -[PQLConnection cplFetchObjectOfClass:sql:]( db,  "cplFetchObjectOfClass:sql:",  objc_opt_class(&OBJC_CLASS___NSNumber),  @"SELECT rowid FROM %@ LIMIT 1",  v4);

  return v5 != 0LL;
}

- (BOOL)table:(id)a3 hasRecordsMatchingQuery:(id)a4
{
  db = self->_db;
  id v6 = a4;
  id v7 = a3;
  id v8 = -[PQLConnection cplFetchObjectOfClass:sql:]( db,  "cplFetchObjectOfClass:sql:",  objc_opt_class(&OBJC_CLASS___NSNumber),  @"SELECT rowid FROM %@ WHERE %@ LIMIT 1",  v7,  v6);

  return v8 != 0LL;
}

- (unint64_t)tableCountOfRecords:(id)a3
{
  db = self->_db;
  id v4 = a3;
  id v5 = -[PQLConnection cplFetchObjectOfClass:sql:]( db,  "cplFetchObjectOfClass:sql:",  objc_opt_class(&OBJC_CLASS___NSNumber),  @"SELECT COUNT(rowid) FROM %@",  v4);

  id v6 = [v5 unsignedIntegerValue];
  return (unint64_t)v6;
}

- (unint64_t)table:(id)a3 countOfRecordsMatchingQuery:(id)a4
{
  db = self->_db;
  id v6 = a4;
  id v7 = a3;
  id v8 = -[PQLConnection cplFetchObjectOfClass:sql:]( db,  "cplFetchObjectOfClass:sql:",  objc_opt_class(&OBJC_CLASS___NSNumber),  @"SELECT COUNT(rowid) FROM %@ WHERE %@",  v7,  v6);

  id v9 = [v8 unsignedIntegerValue];
  return (unint64_t)v9;
}

- (void)table:(id)a3 enumerateCountGroupedByUnsignedIntegerProperty:(id)a4 block:(id)a5
{
  id v11 = a3;
  id v8 = (void (**)(id, void, id))a5;
  id v9 = (void *)objc_claimAutoreleasedReturnValue(+[PQLNameInjection nameWithString:](&OBJC_CLASS___PQLNameInjection, "nameWithString:", a4));
  id v10 = -[PQLConnection cplFetch:]( self->_db,  "cplFetch:",  @"SELECT %@, count(%@) FROM %@ GROUP BY %@",  v9,  v9,  v11,  v9);
  if ([v10 next])
  {
    do
      v8[2](v8, (int)[v10 intAtIndex:0], objc_msgSend(v10, "unsignedIntegerAtIndex:", 1));
    while (([v10 next] & 1) != 0);
  }
}

- (void)table:(id)a3 enumerateCountGroupedByProperty:(id)a4 block:(id)a5
{
  id v12 = a3;
  id v8 = (void (**)(id, void *, id))a5;
  id v9 = (void *)objc_claimAutoreleasedReturnValue(+[PQLNameInjection nameWithString:](&OBJC_CLASS___PQLNameInjection, "nameWithString:", a4));
  id v10 = -[PQLConnection cplFetch:]( self->_db,  "cplFetch:",  @"SELECT %@, count(%@) FROM %@ GROUP BY %@",  v9,  v9,  v12,  v9);
  if ([v10 next])
  {
    do
    {
      id v11 = (void *)objc_claimAutoreleasedReturnValue([v10 objectAtIndex:0]);
      v8[2](v8, v11, [v10 unsignedIntegerAtIndex:1]);
    }

    while (([v10 next] & 1) != 0);
  }
}

- (BOOL)table:(id)a3 hasColumnWithName:(id)a4
{
  unint64_t v6 = (unint64_t)a4;
  id v7 = -[PQLConnection fetch:](self->_db, "fetch:", @"PRAGMA table_info(%@)", a3);
  do
  {
    unsigned int v8 = [v7 next];
    if (!v8) {
      break;
    }
    id v9 = (id)objc_claimAutoreleasedReturnValue([v7 stringAtIndex:1]);
    unint64_t v10 = (unint64_t)v9;
    if (v6 && v9 && ([v9 isEqual:v6] & 1) != 0)
    {

      break;
    }
  }

  while (v6 | v10);

  return v8;
}

- (BOOL)hasTable:(id)a3
{
  id v3 = -[PQLConnection fetch:](self->_db, "fetch:", @"PRAGMA table_info(%@)", a3);
  unsigned __int8 v4 = [v3 next];

  return v4;
}

- (id)clientCache
{
  clientCacheMigrator = self->_clientCacheMigrator;
  if (!clientCacheMigrator) {
    sub_10019AD14((uint64_t)a2, (uint64_t)self);
  }
  return -[CPLPrequeliteClientCacheMigrator platformObject](clientCacheMigrator, "platformObject");
}

- (id)cloudCache
{
  BOOL v2 = (void *)objc_claimAutoreleasedReturnValue(-[CPLPrequeliteStore abstractObject](self, "abstractObject"));
  id v3 = (void *)objc_claimAutoreleasedReturnValue([v2 cloudCache]);
  unsigned __int8 v4 = (void *)objc_claimAutoreleasedReturnValue([v3 platformObject]);

  return v4;
}

- (id)transientPullRepository
{
  BOOL v2 = (void *)objc_claimAutoreleasedReturnValue(-[CPLPrequeliteStore abstractObject](self, "abstractObject"));
  id v3 = (void *)objc_claimAutoreleasedReturnValue([v2 transientPullRepository]);
  unsigned __int8 v4 = (void *)objc_claimAutoreleasedReturnValue([v3 platformObject]);

  return v4;
}

- (void)_notifyVacuumDidComplete
{
  __int128 v11 = 0u;
  __int128 v12 = 0u;
  __int128 v9 = 0u;
  __int128 v10 = 0u;
  id v3 = self->_vacuumCompletionHandlers;
  id v4 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v3,  "countByEnumeratingWithState:objects:count:",  &v9,  v13,  16LL);
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v10;
    do
    {
      id v7 = 0LL;
      do
      {
        if (*(void *)v10 != v6) {
          objc_enumerationMutation(v3);
        }
        (*(void (**)(void))(*(void *)(*((void *)&v9 + 1) + 8LL * (void)v7) + 16LL))(*(void *)(*((void *)&v9 + 1) + 8LL * (void)v7));
        id v7 = (char *)v7 + 1;
      }

      while (v5 != v7);
      id v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v3,  "countByEnumeratingWithState:objects:count:",  &v9,  v13,  16LL);
    }

    while (v5);
  }

  vacuumCompletionHandlers = self->_vacuumCompletionHandlers;
  self->_vacuumCompletionHandlers = 0LL;
}

- (int64_t)_sizeInBytes
{
  id v3 = -[PQLConnection fetchObjectOfClass:sql:]( self->_db,  "fetchObjectOfClass:sql:",  objc_opt_class(&OBJC_CLASS___NSNumber),  @"PRAGMA page_count");
  id v4 = -[PQLConnection fetchObjectOfClass:sql:]( self->_db,  "fetchObjectOfClass:sql:",  objc_opt_class(&OBJC_CLASS___NSNumber),  @"PRAGMA page_size");
  id v5 = [v3 longLongValue];
  int64_t v6 = (void)[v4 longLongValue] * (void)v5;

  return v6;
}

- (void)_vacuum:(int64_t)a3 withInitialDatabaseSize:(int64_t)a4
{
  vacuumQueue = self->_vacuumQueue;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = sub_10015D0E8;
  v8[3] = &unk_100247600;
  v8[4] = self;
  v8[5] = a3;
  v8[6] = a4;
  id v5 = v8;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10015ECB8;
  block[3] = &unk_10023DBC8;
  id v10 = v5;
  int64_t v6 = vacuumQueue;
  dispatch_block_t v7 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
  dispatch_async(v6, v7);
}

- (void)startVacuumWithCompletionHandler:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472LL;
  v10[2] = sub_10015D670;
  v10[3] = &unk_10023E058;
  v10[4] = self;
  id v11 = v4;
  int64_t v6 = v10;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10015ECB8;
  block[3] = &unk_10023DBC8;
  id v13 = v6;
  dispatch_block_t v7 = queue;
  id v8 = v4;
  dispatch_block_t v9 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
  dispatch_async(v7, v9);
}

- (void)stopVacuum
{
  queue = self->_queue;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  v6[2] = sub_10015D8F4;
  v6[3] = &unk_10023DC70;
  v6[4] = self;
  id v3 = v6;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10015ECB8;
  block[3] = &unk_10023DBC8;
  id v8 = v3;
  id v4 = queue;
  dispatch_block_t v5 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
  dispatch_async(v4, v5);
}

- (void)emergencyClose
{
  uint64_t v21 = 0LL;
  __int16 v22 = &v21;
  uint64_t v23 = 0x2020000000LL;
  char v24 = 1;
  p_emergencyCloseLock = &self->_emergencyCloseLock;
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472LL;
  id v17 = sub_10015DB90;
  id v18 = &unk_10023E658;
  id v19 = self;
  __int16 v20 = &v21;
  id v4 = v16;
  os_unfair_lock_lock(p_emergencyCloseLock);
  v17((uint64_t)v4);
  os_unfair_lock_unlock(p_emergencyCloseLock);

  if (*((_BYTE *)v22 + 24))
  {
    if (!_CPLSilentLogging)
    {
      id v5 = sub_10015409C();
      int64_t v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        queue = self->_queue;
        *(_DWORD *)buf = 138412546;
        *(void *)&uint8_t buf[4] = self;
        *(_WORD *)&buf[12] = 2112;
        *(void *)&buf[14] = queue;
        _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "Requesting emergency close of %@ - suspending %@",  buf,  0x16u);
      }
    }

    id v8 = dispatch_queue_create("com.apple.cpl.emergencyclose", 0LL);
    *(void *)buf = 0LL;
    *(void *)&buf[8] = buf;
    *(void *)&uint8_t buf[16] = 0x2020000000LL;
    char v26 = 0;
    dispatch_time_t v9 = dispatch_time(0LL, 10000000000LL);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_10015DBC0;
    block[3] = &unk_10023DD58;
    void block[4] = self;
    void block[5] = buf;
    dispatch_after(v9, v8, block);
    id v10 = self->_queue;
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472LL;
    v12[2] = sub_10015DC90;
    v12[3] = &unk_10023FAC0;
    v12[4] = self;
    id v13 = v8;
    id v14 = buf;
    id v11 = v8;
    dispatch_sync((dispatch_queue_t)v10, v12);

    _Block_object_dispose(buf, 8);
  }

  _Block_object_dispose(&v21, 8);
}

- (void)markAsCorrupted
{
  queue = self->_queue;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  v6[2] = sub_10015DE88;
  v6[3] = &unk_10023DC70;
  v6[4] = self;
  id v3 = v6;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10015ECB8;
  block[3] = &unk_10023DBC8;
  id v8 = v3;
  id v4 = queue;
  dispatch_block_t v5 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
  dispatch_async(v4, v5);
}

- (BOOL)createStoragesDynamically:(id)a3 error:(id *)a4
{
  __int128 v21 = 0u;
  __int128 v22 = 0u;
  __int128 v23 = 0u;
  __int128 v24 = 0u;
  id v7 = a3;
  id v8 = [v7 countByEnumeratingWithState:&v21 objects:v29 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v22;
    while (2)
    {
      for (i = 0LL; i != v9; i = (char *)i + 1)
      {
        if (*(void *)v22 != v10) {
          objc_enumerationMutation(v7);
        }
        __int128 v12 = *(void **)(*((void *)&v21 + 1) + 8LL * (void)i);
        id v13 = (void *)objc_claimAutoreleasedReturnValue([v12 platformObject]);
        if (([v13 createStorage] & 1) == 0)
        {
          if (!_CPLSilentLogging)
          {
            id v15 = sub_10015409C();
            id v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(v15);
            if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
            {
              id v17 = (void *)objc_claimAutoreleasedReturnValue(-[PQLConnection lastCPLError](self->_db, "lastCPLError"));
              id v18 = (void *)objc_claimAutoreleasedReturnValue([v17 localizedDescription]);
              *(_DWORD *)buf = 138412546;
              char v26 = v12;
              __int16 v27 = 2112;
              __int128 v28 = v18;
              _os_log_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_ERROR,  "Unable to initialize %@: %@",  buf,  0x16u);
            }
          }

          if (a4)
          {
            id v19 = (id)objc_claimAutoreleasedReturnValue(-[PQLConnection lastError](self->_db, "lastError"));
            BOOL v14 = 0;
            *a4 = v19;
          }

          else
          {
            BOOL v14 = 0;
          }

          goto LABEL_18;
        }
      }

      id v9 = [v7 countByEnumeratingWithState:&v21 objects:v29 count:16];
      if (v9) {
        continue;
      }
      break;
    }
  }

  BOOL v14 = 1;
LABEL_18:

  return v14;
}

- (BOOL)deleteDynamicallyCreatedStorages:(id)a3 error:(id *)a4
{
  SEL v20 = a2;
  __int128 v23 = 0u;
  __int128 v24 = 0u;
  __int128 v25 = 0u;
  __int128 v26 = 0u;
  id v4 = a3;
  id v5 = [v4 countByEnumeratingWithState:&v23 objects:v31 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v24;
    while (2)
    {
      id v8 = v4;
      for (i = 0LL; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v24 != v7) {
          objc_enumerationMutation(v8);
        }
        uint64_t v10 = *(void **)(*((void *)&v23 + 1) + 8LL * (void)i);
        id v11 = (void *)objc_claimAutoreleasedReturnValue([v10 platformObject]);
        db = self->_db;
        id v13 = (void *)objc_claimAutoreleasedReturnValue([v11 mainTable]);
        LOBYTE(db) = -[PQLConnection cplExecute:](db, "cplExecute:", @"DROP TABLE IF EXISTS %@", v13, v20);

        if ((db & 1) == 0)
        {
          id v4 = v8;
          if (!_CPLSilentLogging)
          {
            id v15 = sub_10015409C();
            id v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(v15);
            if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
            {
              id v17 = (void *)objc_claimAutoreleasedReturnValue(-[PQLConnection lastCPLError](self->_db, "lastCPLError"));
              id v18 = (void *)objc_claimAutoreleasedReturnValue([v17 localizedDescription]);
              *(_DWORD *)buf = 138412546;
              __int128 v28 = v10;
              __int16 v29 = 2112;
              __int128 v30 = v18;
              _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_ERROR, "Unable to delete %@: %@", buf, 0x16u);
            }
          }

          BOOL v14 = 0;
          if (a4) {
            *a4 = (id)objc_claimAutoreleasedReturnValue(-[PQLConnection lastError](self->_db, "lastError"));
          }
          goto LABEL_17;
        }
      }

      id v4 = v8;
      id v6 = [v8 countByEnumeratingWithState:&v23 objects:v31 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }

  BOOL v14 = 1;
LABEL_17:

  return v14;
}

- (NSString)description
{
  id v3 = objc_alloc(&OBJC_CLASS___NSString);
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[NSURL path](self->_dbURL, "path"));
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 stringByAbbreviatingWithTildeInPath]);
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[CPLPrequeliteStore abstractObject](self, "abstractObject"));
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([v6 engineLibrary]);
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 libraryIdentifier]);
  id v9 = -[NSString initWithFormat:](v3, "initWithFormat:", @"<SQLDatabase %@ - %@>", v5, v8);

  return v9;
}

- (id)redactedDescription
{
  id v3 = objc_alloc(&OBJC_CLASS___NSString);
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[NSURL path](self->_dbURL, "path"));
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 lastPathComponent]);
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[CPLPrequeliteStore abstractObject](self, "abstractObject"));
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([v6 engineLibrary]);
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 libraryIdentifier]);
  id v9 = -[NSString initWithFormat:](v3, "initWithFormat:", @"<SQLDatabase %@ - %@>", v5, v8);

  return v9;
}

- (NSDate)libraryCreationDate
{
  return (NSDate *)objc_getProperty(self, a2, 368LL, 1);
}

- (void).cxx_destruct
{
}

@end