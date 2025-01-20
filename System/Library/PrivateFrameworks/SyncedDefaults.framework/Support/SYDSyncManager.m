@interface SYDSyncManager
+ (BOOL)shouldIgnoreFetchError:(id)a3;
- (BOOL)alwaysSaveRecordZones;
- (BOOL)hasPendingChangesToUpload;
- (BOOL)initializeSyncEngineWithError:(id *)a3;
- (BOOL)isAutomaticSyncingEnabled;
- (BOOL)isIdentityLostError:(id)a3;
- (BOOL)removeObjectForKey:(id)a3 inStoreWithIdentifier:(id)a4 error:(id *)a5;
- (BOOL)removeObjectForKey:(id)a3 inStoreWithIdentifier:(id)a4 excludeFromChangeTracking:(BOOL)a5 didRemoveValue:(BOOL *)a6 error:(id *)a7;
- (BOOL)removeObjectForKey:(id)a3 inStoreWithIdentifier:(id)a4 excludeFromChangeTracking:(BOOL)a5 error:(id *)a6;
- (BOOL)setObject:(id)a3 forKey:(id)a4 inStoreWithIdentifier:(id)a5 error:(id *)a6;
- (BOOL)setObject:(id)a3 forKey:(id)a4 inStoreWithIdentifier:(id)a5 excludeFromChangeTracking:(BOOL)a6 enforceQuota:(BOOL)a7 didChangeValue:(BOOL *)a8 error:(id *)a9;
- (BOOL)setObject:(id)a3 forKey:(id)a4 inStoreWithIdentifier:(id)a5 excludeFromChangeTracking:(BOOL)a6 enforceQuota:(BOOL)a7 error:(id *)a8;
- (BOOL)shouldRetryAfterModifyError:(id)a3;
- (BOOL)shouldSyncStoreWithIdentifier:(id)a3;
- (BOOL)useSyncAnchor;
- (BOOL)useUUIDRecordNames;
- (BOOL)validateKey:(id)a3 error:(id *)a4;
- (CKContainer)container;
- (CKSyncEngine)engine;
- (NSMutableArray)pendingDeletedRecordIDs;
- (NSMutableArray)pendingFetchedRecords;
- (NSMutableSet)storeIdentifiersWithChangedValuesDuringFetchChanges;
- (NSString)description;
- (NSString)personaUniqueString;
- (OS_dispatch_queue)callbackQueue;
- (OS_dispatch_queue)queue;
- (SYDCoreDataStore)coreDataStore;
- (SYDSyncManager)initWithContainer:(id)a3 coreDataStore:(id)a4 storeType:(int64_t)a5 testConfiguration:(id)a6;
- (SYDSyncManagerDelegate)delegate;
- (SYDTestConfiguration)testConfiguration;
- (id)engineWithError:(id *)a3;
- (id)newRecordNameForKey:(id)a3;
- (id)objectForKey:(id)a3 inStoreWithIdentifier:(id)a4 error:(id *)a5;
- (id)recordIDForKey:(id)a3 inStoreWithIdentifier:(id)a4;
- (id)recordToSaveForRecordID:(id)a3 error:(id *)a4;
- (id)syncEngine:(id)a3 nextFetchChangesOptionsForContext:(id)a4;
- (id)syncEngine:(id)a3 nextRecordZoneChangeBatchForContext:(id)a4;
- (id)syncEngine:(id)a3 relatedApplicationBundleIdentifiersForZoneIDs:(id)a4 recordIDs:(id)a5;
- (int)mobileKeybagNotifyToken;
- (int64_t)storeType;
- (unint64_t)maxPendingFetchedRecords;
- (void)_markZoneForDeletionOnManateeFailureForRecordZoneID:(id)a3;
- (void)_queue_resetSyncEngine;
- (void)addKeyValueRecordIDsToSave:(id)a3 recordIDsToDelete:(id)a4 storeIdentifier:(id)a5;
- (void)addPendingDatabaseChanges:(id)a3 storeIdentifier:(id)a4;
- (void)addSyncAnchorRecordIDToSaveIfNecessaryForStoreIdentifier:(id)a3;
- (void)dealloc;
- (void)deduplicateRecordForKeyValue:(id)a3 withNewlyFetchedRecord:(id)a4;
- (void)deleteDataFromCloudWithCompletionHandler:(id)a3;
- (void)deleteDataFromDisk;
- (void)didDeleteRecordWithID:(id)a3;
- (void)didDeleteRecordZoneWithID:(id)a3;
- (void)didEndFetchingChanges;
- (void)didFailToDeleteRecordWithID:(id)a3 error:(id)a4;
- (void)didFailToFetchChangesForRecordZoneID:(id)a3 error:(id)a4;
- (void)didFailToSaveRecord:(id)a3 error:(id)a4;
- (void)didFetchRecord:(id)a3;
- (void)didFetchRecordDeletion:(id)a3 recordType:(id)a4;
- (void)didSaveKeyValueRecord:(id)a3;
- (void)didSaveRecord:(id)a3;
- (void)failedToSaveKeyValueRecord:(id)a3 error:(id)a4;
- (void)fetchChangesFromCloudForAllStoresWithCompletionHandler:(id)a3;
- (void)fetchChangesFromCloudForStoreIdentifiers:(id)a3 group:(id)a4 completionHandler:(id)a5;
- (void)handleSyncEngineStateUpdate:(id)a3;
- (void)markAllKeyValuesAsNeedingToBeUploaded;
- (void)markAllKeyValuesAsNeedingToBeUploadedForStoreWithIdentifier:(id)a3;
- (void)processFetchedRecords:(id)a3 deletedRecordIDs:(id)a4;
- (void)processPendingFetchedRecordsWithReason:(id)a3;
- (void)registerForFirstUnlockNotificationsIfNecessary;
- (void)resetSyncEngine;
- (void)resetSyncEngineWithContainer:(id)a3;
- (void)savePendingChangesToCloudForAllStoresWithCompletionHandler:(id)a3;
- (void)savePendingChangesToCloudForStoreIdentifiers:(id)a3 group:(id)a4 completionHandler:(id)a5;
- (void)saveSyncAnchorSystemFieldsRecord:(id)a3;
- (void)setAlwaysSaveRecordZones:(BOOL)a3;
- (void)setAutomaticSyncingEnabled:(BOOL)a3;
- (void)setCallbackQueue:(id)a3;
- (void)setContainer:(id)a3;
- (void)setCoreDataStore:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setMaxPendingFetchedRecords:(unint64_t)a3;
- (void)setMobileKeybagNotifyToken:(int)a3;
- (void)setPendingDeletedRecordIDs:(id)a3;
- (void)setPendingFetchedRecords:(id)a3;
- (void)setPersonaUniqueString:(id)a3;
- (void)setQueue:(id)a3;
- (void)setStoreIdentifiersWithChangedValuesDuringFetchChanges:(id)a3;
- (void)setStoreType:(int64_t)a3;
- (void)syncEngine:(id)a3 accountChangedFromUserRecordID:(id)a4 toUserRecordID:(id)a5;
- (void)syncEngine:(id)a3 handleEvent:(id)a4;
- (void)synchronizeAllStoresWithCompletionHandler:(id)a3;
- (void)synchronizeStoreWithIdentifier:(id)a3 completionHandler:(id)a4;
- (void)synchronizeStoresWithIdentifiers:(id)a3 completionHandler:(id)a4;
- (void)willBeginFetchingChanges;
- (void)zoneWithIDWasPurged:(id)a3;
@end

@implementation SYDSyncManager

- (SYDSyncManager)initWithContainer:(id)a3 coreDataStore:(id)a4 storeType:(int64_t)a5 testConfiguration:(id)a6
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a6;
  if (v12)
  {
    if (v13) {
      goto LABEL_3;
    }
  }

  else
  {
    v44 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"));
    v45 = (objc_class *)objc_opt_class(self);
    v46 = NSStringFromClass(v45);
    v50 = (void *)objc_claimAutoreleasedReturnValue(v46);
    [v44 handleFailureInMethod:a2, self, @"SYDSyncManager.m", 70, @"Must specify a container for %@", v50 object file lineNumber description];

    if (v13) {
      goto LABEL_3;
    }
  }

  v47 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"));
  v48 = (objc_class *)objc_opt_class(self);
  v49 = NSStringFromClass(v48);
  v51 = (void *)objc_claimAutoreleasedReturnValue(v49);
  [v47 handleFailureInMethod:a2, self, @"SYDSyncManager.m", 71, @"Must specify a database URL for %@", v51 object file lineNumber description];

LABEL_3:
  v52.receiver = self;
  v52.super_class = (Class)&OBJC_CLASS___SYDSyncManager;
  v15 = -[SYDSyncManager init](&v52, "init");
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_coreDataStore, a4);
    objc_storeStrong((id *)&v16->_container, a3);
    v16->_storeType = a5;
    objc_storeStrong((id *)&v16->_testConfiguration, a6);
    if (sub_10000BF78())
    {
      v17 = (void *)objc_claimAutoreleasedReturnValue(+[UMUserPersona currentPersona](&OBJC_CLASS___UMUserPersona, "currentPersona"));
      v18 = (void *)objc_claimAutoreleasedReturnValue([v17 userPersonaUniqueString]);
      v19 = (NSString *)[v18 copy];
      personaUniqueString = v16->_personaUniqueString;
      v16->_personaUniqueString = v19;
    }

    v21 = (void *)objc_claimAutoreleasedReturnValue([v12 containerIdentifier]);
    v22 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"com.apple.kvs.sync-manager.%@",  v21));

    id v23 = v22;
    v24 = (const char *)[v23 UTF8String];
    dispatch_queue_attr_t v25 = dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v26 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v25);
    dispatch_queue_t v27 = dispatch_queue_create(v24, v26);
    queue = v16->_queue;
    v16->_queue = (OS_dispatch_queue *)v27;

    id v29 = objc_claimAutoreleasedReturnValue([v23 stringByAppendingString:@".callback"]);
    v30 = (const char *)[v29 UTF8String];
    dispatch_queue_attr_t v31 = dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v32 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v31);
    dispatch_queue_t v33 = dispatch_queue_create(v30, v32);
    callbackQueue = v16->_callbackQueue;
    v16->_callbackQueue = (OS_dispatch_queue *)v33;

    uint64_t v35 = objc_claimAutoreleasedReturnValue(+[NSMutableSet set](&OBJC_CLASS___NSMutableSet, "set"));
    storeIdentifiersWithChangedValuesDuringFetchChanges = v16->_storeIdentifiersWithChangedValuesDuringFetchChanges;
    v16->_storeIdentifiersWithChangedValuesDuringFetchChanges = (NSMutableSet *)v35;

    uint64_t v37 = objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
    pendingFetchedRecords = v16->_pendingFetchedRecords;
    v16->_pendingFetchedRecords = (NSMutableArray *)v37;

    uint64_t v39 = objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
    pendingDeletedRecordIDs = v16->_pendingDeletedRecordIDs;
    v16->_pendingDeletedRecordIDs = (NSMutableArray *)v39;

    v16->_maxPendingFetchedRecords = 50LL;
    -[SYDSyncManager initializeSyncEngineWithError:](v16, "initializeSyncEngineWithError:", 0LL);
    -[SYDSyncManager registerForFirstUnlockNotificationsIfNecessary]( v16,  "registerForFirstUnlockNotificationsIfNecessary");
    id v41 = SYDGetCloudKitLog();
    v42 = (os_log_s *)objc_claimAutoreleasedReturnValue(v41);
    if (os_log_type_enabled(v42, OS_LOG_TYPE_DEBUG)) {
      sub_10002D6F4();
    }
  }

  return v16;
}

- (void)dealloc
{
  if (-[SYDSyncManager mobileKeybagNotifyToken](self, "mobileKeybagNotifyToken") != -1) {
    notify_cancel(-[SYDSyncManager mobileKeybagNotifyToken](self, "mobileKeybagNotifyToken"));
  }
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___SYDSyncManager;
  -[SYDSyncManager dealloc](&v3, "dealloc");
}

- (NSString)description
{
  objc_super v3 = (objc_class *)objc_opt_class(self);
  v4 = NSStringFromClass(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[SYDSyncManager container](self, "container"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[SYDSyncManager coreDataStore](self, "coreDataStore"));
  v8 = sub_10000B838(-[SYDSyncManager storeType](self, "storeType"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableString stringWithFormat:]( &OBJC_CLASS___NSMutableString,  "stringWithFormat:",  @"<%@: %p; container=%@ coreDataStore=%@ storeType=%@",
                    v5,
                    self,
                    v6,
                    v7,
                    v9));

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[SYDSyncManager personaUniqueString](self, "personaUniqueString"));
  [v10 appendFormat:@" personaUniqueString=%@", v11];

  [v10 appendString:@">"];
  return (NSString *)v10;
}

- (BOOL)initializeSyncEngineWithError:(id *)a3
{
  v4 = self;
  objc_sync_enter(v4);
  coreDataStore = v4->_coreDataStore;
  id v27 = 0LL;
  v6 = (void *)objc_claimAutoreleasedReturnValue( -[SYDCoreDataStore syncEngineStateSerializationWithError:]( coreDataStore,  "syncEngineStateSerializationWithError:",  &v27));
  unint64_t v7 = (unint64_t)v27;
  if (v6)
  {
    id v26 = (id)v7;
    id v8 = +[NSKeyedUnarchiver unarchivedObjectOfClass:fromData:error:]( &OBJC_CLASS___NSKeyedUnarchiver,  "unarchivedObjectOfClass:fromData:error:",  objc_opt_class(&OBJC_CLASS___CKSyncEngineStateSerialization),  v6,  &v26);
    uint64_t v9 = objc_claimAutoreleasedReturnValue(v8);
    id v10 = v26;

    if (v10)
    {
      id v11 = SYDGetCloudKitLog();
      id v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
        sub_10002D7E8();
      }

LABEL_14:
      id v15 = SYDGetCloudKitLog();
      v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(v15);
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
        sub_10002D788();
      }
      BOOL v17 = 0;
      goto LABEL_20;
    }

    unint64_t v7 = 0LL;
  }

  else
  {
    uint64_t v9 = 0LL;
  }

  id v10 = (id)v7;
  if (!(v7 | v9))
  {
    id v13 = v4->_coreDataStore;
    id v25 = 0LL;
    id v14 = (void *)objc_claimAutoreleasedReturnValue( -[SYDCoreDataStore deprecatedSyncEngineMetadataWithError:]( v13,  "deprecatedSyncEngineMetadataWithError:",  &v25));
    id v10 = v25;
    if (v14) {
      uint64_t v9 = -[CKSyncEngineStateSerialization initWithDeprecatedData:]( objc_alloc(&OBJC_CLASS___CKSyncEngineStateSerialization),  "initWithDeprecatedData:",  v14);
    }
    else {
      uint64_t v9 = 0LL;
    }
  }

  if (v10) {
    goto LABEL_14;
  }
  id v18 = SYDGetCloudKitLog();
  v19 = (os_log_s *)objc_claimAutoreleasedReturnValue(v18);
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG)) {
    sub_10002D75C();
  }

  v20 = objc_alloc(&OBJC_CLASS___CKSyncEngineConfiguration);
  v21 = (void *)objc_claimAutoreleasedReturnValue(-[CKContainer privateCloudDatabase](v4->_container, "privateCloudDatabase"));
  v16 = -[CKSyncEngineConfiguration initWithDatabase:stateSerialization:delegate:]( v20,  "initWithDatabase:stateSerialization:delegate:",  v21,  v9,  v4);

  -[os_log_s setApsMachServiceName:](v16, "setApsMachServiceName:", @"com.apple.aps.kvsd");
  v22 = -[CKSyncEngine initWithConfiguration:](objc_alloc(&OBJC_CLASS___CKSyncEngine), "initWithConfiguration:", v16);
  engine = v4->_engine;
  v4->_engine = v22;

  id v10 = 0LL;
  BOOL v17 = 1;
LABEL_20:

  if (a3) {
    *a3 = v10;
  }

  objc_sync_exit(v4);
  return v17;
}

- (CKSyncEngine)engine
{
  id v8 = 0LL;
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[SYDSyncManager engineWithError:](self, "engineWithError:", &v8));
  id v3 = v8;
  v4 = v3;
  if (!v2 || v3)
  {
    id v5 = SYDGetCloudKitLog();
    v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT)) {
      sub_10002D848();
    }
  }

  return (CKSyncEngine *)v2;
}

- (id)engineWithError:(id *)a3
{
  v4 = self;
  objc_sync_enter(v4);
  engine = v4->_engine;
  if (!engine)
  {
    -[SYDSyncManager initializeSyncEngineWithError:](v4, "initializeSyncEngineWithError:", a3);
    engine = v4->_engine;
  }

  v6 = engine;
  objc_sync_exit(v4);

  return v6;
}

- (BOOL)validateKey:(id)a3 error:(id *)a4
{
  id v5 = a3;
  v6 = v5;
  if (v5 && [v5 length])
  {
    LOBYTE(a4) = 1;
  }

  else if (a4)
  {
    unint64_t v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Invalid key parameter provided"));
    NSErrorUserInfoKey v10 = NSLocalizedDescriptionKey;
    id v11 = v7;
    id v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v11,  &v10,  1LL));
    *a4 = (id)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"SyncedDefaults",  2222LL,  v8));

    LOBYTE(a4) = 0;
  }

  return (char)a4;
}

- (BOOL)useUUIDRecordNames
{
  return (char *)-[SYDSyncManager storeType](self, "storeType") - 1 < (char *)3;
}

- (BOOL)useSyncAnchor
{
  return (char *)-[SYDSyncManager storeType](self, "storeType") - 4 < (char *)0xFFFFFFFFFFFFFFFDLL;
}

- (BOOL)shouldSyncStoreWithIdentifier:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_claimAutoreleasedReturnValue(-[SYDSyncManager delegate](self, "delegate"));
  if (v5
    && (v6 = (void *)v5,
        unint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(-[SYDSyncManager delegate](self, "delegate")),
        char v8 = objc_opt_respondsToSelector(v7, "syncManager:shouldSyncStoreWithIdentifier:"),
        v7,
        v6,
        (v8 & 1) != 0))
  {
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(-[SYDSyncManager delegate](self, "delegate"));
    unsigned __int8 v10 = [v9 syncManager:self shouldSyncStoreWithIdentifier:v4];
  }

  else
  {
    unsigned __int8 v10 = 1;
  }

  return v10;
}

- (id)objectForKey:(id)a3 inStoreWithIdentifier:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  if (-[SYDSyncManager validateKey:error:](self, "validateKey:error:", v8, a5))
  {
    uint64_t v24 = 0LL;
    id v25 = &v24;
    uint64_t v26 = 0x3032000000LL;
    id v27 = sub_10000F194;
    v28 = sub_10000F1A4;
    id v29 = 0LL;
    uint64_t v18 = 0LL;
    v19 = &v18;
    uint64_t v20 = 0x3032000000LL;
    v21 = sub_10000F194;
    v22 = sub_10000F1A4;
    id v23 = 0LL;
    unsigned __int8 v10 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[SYDSyncManager queue](self, "queue"));
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_10000F1AC;
    block[3] = &unk_10004CF78;
    block[4] = self;
    id v14 = v8;
    id v15 = v9;
    v16 = &v24;
    BOOL v17 = &v18;
    dispatch_sync(v10, block);

    if (a5) {
      *a5 = (id) v25[5];
    }
    id v11 = (id)v19[5];

    _Block_object_dispose(&v18, 8);
    _Block_object_dispose(&v24, 8);
  }

  else
  {
    id v11 = 0LL;
  }

  return v11;
}

- (BOOL)setObject:(id)a3 forKey:(id)a4 inStoreWithIdentifier:(id)a5 excludeFromChangeTracking:(BOOL)a6 enforceQuota:(BOOL)a7 error:(id *)a8
{
  return -[SYDSyncManager setObject:forKey:inStoreWithIdentifier:excludeFromChangeTracking:enforceQuota:didChangeValue:error:]( self,  "setObject:forKey:inStoreWithIdentifier:excludeFromChangeTracking:enforceQuota:didChangeValue:error:",  a3,  a4,  a5,  a6,  a7,  0LL,  a8);
}

- (BOOL)setObject:(id)a3 forKey:(id)a4 inStoreWithIdentifier:(id)a5 excludeFromChangeTracking:(BOOL)a6 enforceQuota:(BOOL)a7 didChangeValue:(BOOL *)a8 error:(id *)a9
{
  BOOL v11 = a6;
  id v15 = a3;
  id v16 = a4;
  id v17 = a5;
  if (!-[SYDSyncManager validateKey:error:](self, "validateKey:error:", v16, a9)) {
    goto LABEL_11;
  }
  if (!v15)
  {
    unsigned __int8 v19 = -[SYDSyncManager removeObjectForKey:inStoreWithIdentifier:excludeFromChangeTracking:didRemoveValue:error:]( self,  "removeObjectForKey:inStoreWithIdentifier:excludeFromChangeTracking:didRemoveValue:error:",  v16,  v17,  v11,  a8,  a9);
    goto LABEL_12;
  }

  if (!+[NSPropertyListSerialization propertyList:isValidForFormat:]( &OBJC_CLASS___NSPropertyListSerialization,  "propertyList:isValidForFormat:",  v15,  200LL))
  {
    uint64_t v20 = (objc_class *)objc_opt_class(v15);
    v21 = NSStringFromClass(v20);
    v22 = (void *)objc_claimAutoreleasedReturnValue(v21);
    +[NSException raise:format:]( &OBJC_CLASS___NSException,  "raise:format:",  NSInvalidArgumentException,  @"Attempted to insert invalid value '%@' of class '%@'",  v15,  v22);

LABEL_11:
    unsigned __int8 v19 = 0;
    goto LABEL_12;
  }

  uint64_t v39 = 0LL;
  v40 = &v39;
  uint64_t v41 = 0x2020000000LL;
  char v42 = 0;
  uint64_t v33 = 0LL;
  v34 = &v33;
  uint64_t v35 = 0x3032000000LL;
  v36 = sub_10000F194;
  uint64_t v37 = sub_10000F1A4;
  id v38 = 0LL;
  uint64_t v18 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[SYDSyncManager queue](self, "queue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10000F618;
  block[3] = &unk_10004CFA0;
  id v25 = v15;
  id v26 = v16;
  id v27 = v17;
  v28 = self;
  id v29 = &v33;
  v30 = &v39;
  BOOL v31 = v11;
  BOOL v32 = a7;
  dispatch_sync(v18, block);

  if (a9) {
    *a9 = (id) v34[5];
  }
  if (a8) {
    *a8 = *((_BYTE *)v40 + 24);
  }
  unsigned __int8 v19 = v34[5] == 0;

  _Block_object_dispose(&v33, 8);
  _Block_object_dispose(&v39, 8);
LABEL_12:

  return v19;
}

- (BOOL)setObject:(id)a3 forKey:(id)a4 inStoreWithIdentifier:(id)a5 error:(id *)a6
{
  return -[SYDSyncManager setObject:forKey:inStoreWithIdentifier:excludeFromChangeTracking:enforceQuota:error:]( self,  "setObject:forKey:inStoreWithIdentifier:excludeFromChangeTracking:enforceQuota:error:",  a3,  a4,  a5,  1LL,  1LL,  a6);
}

- (BOOL)removeObjectForKey:(id)a3 inStoreWithIdentifier:(id)a4 excludeFromChangeTracking:(BOOL)a5 error:(id *)a6
{
  return -[SYDSyncManager removeObjectForKey:inStoreWithIdentifier:excludeFromChangeTracking:didRemoveValue:error:]( self,  "removeObjectForKey:inStoreWithIdentifier:excludeFromChangeTracking:didRemoveValue:error:",  a3,  a4,  a5,  0LL,  a6);
}

- (BOOL)removeObjectForKey:(id)a3 inStoreWithIdentifier:(id)a4 excludeFromChangeTracking:(BOOL)a5 didRemoveValue:(BOOL *)a6 error:(id *)a7
{
  id v12 = a3;
  id v13 = a4;
  if (-[SYDSyncManager validateKey:error:](self, "validateKey:error:", v12, a7))
  {
    uint64_t v30 = 0LL;
    BOOL v31 = &v30;
    uint64_t v32 = 0x2020000000LL;
    char v33 = 0;
    uint64_t v24 = 0LL;
    id v25 = &v24;
    uint64_t v26 = 0x3032000000LL;
    id v27 = sub_10000F194;
    v28 = sub_10000F1A4;
    id v29 = 0LL;
    id v14 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[SYDSyncManager queue](self, "queue"));
    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472LL;
    v17[2] = sub_10000FDBC;
    v17[3] = &unk_10004CFC8;
    id v18 = v12;
    id v19 = v13;
    uint64_t v20 = self;
    v21 = &v24;
    v22 = &v30;
    BOOL v23 = a5;
    dispatch_sync(v14, v17);

    if (a7) {
      *a7 = (id) v25[5];
    }
    if (a6) {
      *a6 = *((_BYTE *)v31 + 24);
    }
    BOOL v15 = v25[5] == 0;

    _Block_object_dispose(&v24, 8);
    _Block_object_dispose(&v30, 8);
  }

  else
  {
    BOOL v15 = 0;
  }

  return v15;
}

- (BOOL)removeObjectForKey:(id)a3 inStoreWithIdentifier:(id)a4 error:(id *)a5
{
  return -[SYDSyncManager removeObjectForKey:inStoreWithIdentifier:excludeFromChangeTracking:error:]( self,  "removeObjectForKey:inStoreWithIdentifier:excludeFromChangeTracking:error:",  a3,  a4,  1LL,  a5);
}

- (void)synchronizeStoreWithIdentifier:(id)a3 completionHandler:(id)a4
{
  id v10 = a3;
  id v6 = a4;
  unint64_t v7 = -[NSMutableArray initWithObjects:](objc_alloc(&OBJC_CLASS___NSMutableArray), "initWithObjects:", v10, 0LL);
  unsigned __int8 v8 = [v10 isEqualToString:@"com.apple.sbd3"];
  id v9 = @"com.apple.security.cloudkeychainproxy3";
  if ((v8 & 1) != 0) {
    goto LABEL_4;
  }
  if ([v10 isEqualToString:@"com.apple.security.cloudkeychainproxy3"])
  {
    id v9 = @"com.apple.sbd3";
LABEL_4:
    -[NSMutableArray addObject:](v7, "addObject:", v9);
  }

  -[SYDSyncManager synchronizeStoresWithIdentifiers:completionHandler:]( self,  "synchronizeStoresWithIdentifiers:completionHandler:",  v7,  v6);
}

- (void)synchronizeStoresWithIdentifiers:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  unsigned __int8 v8 = _os_activity_create( (void *)&_mh_execute_header,  "kvs/sync-store",  (os_activity_t)&_os_activity_current,  OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
  os_activity_scope_enter(v8, &state);
  id v9 = SYDGetCloudKitLog();
  id v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
    sub_10002DDFC();
  }

  BOOL v11 = objc_alloc_init(&OBJC_CLASS___CKOperationGroup);
  -[CKOperationGroup setName:](v11, "setName:", @"ManualSync");
  id v12 = (void *)objc_claimAutoreleasedReturnValue( +[NSSet setWithObjects:]( &OBJC_CLASS___NSSet,  "setWithObjects:",  @"com.apple.sbd3",  @"com.apple.security.cloudkeychainproxy3",  0LL));
  id v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](&OBJC_CLASS___NSSet, "setWithArray:", v6));
  unsigned int v14 = [v12 intersectsSet:v13];

  if (v14)
  {
    BOOL v15 = (void *)objc_claimAutoreleasedReturnValue(-[CKOperationGroup defaultConfiguration](v11, "defaultConfiguration"));
    [v15 setIsCloudKitSupportOperation:1];
  }

  v27[0] = 0LL;
  v27[1] = v27;
  v27[2] = 0x3032000000LL;
  v27[3] = sub_10000F194;
  v27[4] = sub_10000F1A4;
  id v28 = 0LL;
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472LL;
  v20[2] = sub_1000103F0;
  v20[3] = &unk_10004D018;
  uint64_t v26 = v27;
  id v16 = v8;
  v21 = v16;
  id v17 = v7;
  id v25 = v17;
  v22 = self;
  id v18 = v6;
  id v23 = v18;
  id v19 = v11;
  uint64_t v24 = v19;
  -[SYDSyncManager fetchChangesFromCloudForStoreIdentifiers:group:completionHandler:]( self,  "fetchChangesFromCloudForStoreIdentifiers:group:completionHandler:",  v18,  v19,  v20);

  _Block_object_dispose(v27, 8);
  os_activity_scope_leave(&state);
}

- (void)synchronizeAllStoresWithCompletionHandler:(id)a3
{
  id v4 = a3;
  id v5 = SYDGetCloudKitLog();
  id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
    sub_10002DE8C();
  }

  v11[0] = 0LL;
  v11[1] = v11;
  v11[2] = 0x3032000000LL;
  v11[3] = sub_10000F194;
  v11[4] = sub_10000F1A4;
  id v12 = 0LL;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = sub_100010720;
  v8[3] = &unk_10004D068;
  id v10 = v11;
  v8[4] = self;
  id v7 = v4;
  id v9 = v7;
  -[SYDSyncManager fetchChangesFromCloudForAllStoresWithCompletionHandler:]( self,  "fetchChangesFromCloudForAllStoresWithCompletionHandler:",  v8);

  _Block_object_dispose(v11, 8);
}

- (void)savePendingChangesToCloudForAllStoresWithCompletionHandler:(id)a3
{
}

- (void)savePendingChangesToCloudForStoreIdentifiers:(id)a3 group:(id)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v48 = 0LL;
  BOOL v11 = (void *)objc_claimAutoreleasedReturnValue(-[SYDSyncManager engineWithError:](self, "engineWithError:", &v48));
  id v12 = v48;
  id v13 = v12;
  if (v11 && !v12)
  {
    id v14 = [v8 count];
    id v15 = SYDGetCloudKitLog();
    id v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(v15);
    BOOL v17 = os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG);
    id v34 = v8;
    if (v14)
    {
      if (v17) {
        sub_10002DF44(v8, v16);
      }

      id v18 = -[NSMutableSet initWithCapacity:]( [NSMutableSet alloc],  "initWithCapacity:",  [v8 count]);
      __int128 v41 = 0u;
      __int128 v42 = 0u;
      __int128 v43 = 0u;
      __int128 v44 = 0u;
      id v16 = (os_log_s *)v8;
      id v19 = -[os_log_s countByEnumeratingWithState:objects:count:]( v16,  "countByEnumeratingWithState:objects:count:",  &v41,  v49,  16LL);
      if (v19)
      {
        id v20 = v19;
        id v33 = v9;
        uint64_t v21 = *(void *)v42;
        do
        {
          for (i = 0LL; i != v20; i = (char *)i + 1)
          {
            if (*(void *)v42 != v21) {
              objc_enumerationMutation(v16);
            }
            id v23 = sub_10000CE94(*(void **)(*((void *)&v41 + 1) + 8LL * (void)i));
            uint64_t v24 = (void *)objc_claimAutoreleasedReturnValue(v23);
            -[NSMutableSet addObject:](v18, "addObject:", v24);
          }

          id v20 = -[os_log_s countByEnumeratingWithState:objects:count:]( v16,  "countByEnumeratingWithState:objects:count:",  &v41,  v49,  16LL);
        }

        while (v20);
        id v9 = v33;
      }
    }

    else
    {
      if (v17) {
        sub_10002DF18();
      }
      id v18 = 0LL;
    }

    v39[0] = _NSConcreteStackBlock;
    v39[1] = 3221225472LL;
    v39[2] = sub_100010BF0;
    v39[3] = &unk_10004D0E0;
    v39[4] = self;
    id v40 = v10;
    id v28 = objc_retainBlock(v39);
    id v29 = -[CKSyncEngineSendChangesScope initWithZoneIDs:]( objc_alloc(&OBJC_CLASS___CKSyncEngineSendChangesScope),  "initWithZoneIDs:",  v18);
    uint64_t v30 = -[CKSyncEngineSendChangesOptions initWithScope:]( objc_alloc(&OBJC_CLASS___CKSyncEngineSendChangesOptions),  "initWithScope:",  v29);
    -[CKSyncEngineSendChangesOptions setOperationGroup:](v30, "setOperationGroup:", v9);
    v35[0] = _NSConcreteStackBlock;
    v35[1] = 3221225472LL;
    v35[2] = sub_100010D94;
    v35[3] = &unk_10004D130;
    v35[4] = self;
    id v36 = v11;
    uint64_t v37 = v30;
    id v38 = v28;
    BOOL v31 = v28;
    uint64_t v32 = v30;
    [v36 sendChangesWithOptions:v32 completionHandler:v35];

    id v8 = v34;
    goto LABEL_22;
  }

  id v25 = SYDGetCloudKitLog();
  uint64_t v26 = (os_log_s *)objc_claimAutoreleasedReturnValue(v25);
  if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR)) {
    sub_10002DEB8();
  }

  if (v10)
  {
    id v27 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[SYDSyncManager callbackQueue](self, "callbackQueue"));
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_100010BE0;
    block[3] = &unk_10004D090;
    v47 = (NSMutableSet *)v10;
    id v46 = v13;
    dispatch_async(v27, block);

    id v18 = v47;
LABEL_22:
  }
}

- (void)fetchChangesFromCloudForAllStoresWithCompletionHandler:(id)a3
{
}

- (void)fetchChangesFromCloudForStoreIdentifiers:(id)a3 group:(id)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v41 = 0LL;
  BOOL v11 = (void *)objc_claimAutoreleasedReturnValue(-[SYDSyncManager engineWithError:](self, "engineWithError:", &v41));
  id v12 = v41;
  id v13 = v12;
  if (v11 && !v12)
  {
    id v14 = [v8 count];
    id v15 = SYDGetCloudKitLog();
    id v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(v15);
    BOOL v17 = os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG);
    if (v14)
    {
      if (v17) {
        sub_10002E0E4(v8, v16);
      }

      id v18 = -[NSMutableSet initWithCapacity:]( [NSMutableSet alloc],  "initWithCapacity:",  [v8 count]);
      __int128 v34 = 0u;
      __int128 v35 = 0u;
      __int128 v36 = 0u;
      __int128 v37 = 0u;
      id v16 = (os_log_s *)v8;
      id v19 = -[os_log_s countByEnumeratingWithState:objects:count:]( v16,  "countByEnumeratingWithState:objects:count:",  &v34,  v42,  16LL);
      if (v19)
      {
        id v20 = v19;
        id v30 = v9;
        id v31 = v8;
        uint64_t v21 = *(void *)v35;
        do
        {
          for (i = 0LL; i != v20; i = (char *)i + 1)
          {
            if (*(void *)v35 != v21) {
              objc_enumerationMutation(v16);
            }
            id v23 = sub_10000CE94(*(void **)(*((void *)&v34 + 1) + 8LL * (void)i));
            uint64_t v24 = (void *)objc_claimAutoreleasedReturnValue(v23);
            -[NSMutableSet addObject:](v18, "addObject:", v24);
          }

          id v20 = -[os_log_s countByEnumeratingWithState:objects:count:]( v16,  "countByEnumeratingWithState:objects:count:",  &v34,  v42,  16LL);
        }

        while (v20);
        id v9 = v30;
        id v8 = v31;
      }
    }

    else
    {
      if (v17) {
        sub_10002E0B8();
      }
      id v18 = 0LL;
    }

    id v28 = -[CKSyncEngineFetchChangesScope initWithZoneIDs:]( objc_alloc(&OBJC_CLASS___CKSyncEngineFetchChangesScope),  "initWithZoneIDs:",  v18);
    id v29 = -[CKSyncEngineFetchChangesOptions initWithScope:]( objc_alloc(&OBJC_CLASS___CKSyncEngineFetchChangesOptions),  "initWithScope:",  v28);
    -[CKSyncEngineFetchChangesOptions setOperationGroup:](v29, "setOperationGroup:", v9);
    v32[0] = _NSConcreteStackBlock;
    v32[1] = 3221225472LL;
    v32[2] = sub_100011214;
    v32[3] = &unk_10004D158;
    v32[4] = self;
    id v33 = v10;
    [v11 fetchChangesWithOptions:v29 completionHandler:v32];

    goto LABEL_22;
  }

  id v25 = SYDGetCloudKitLog();
  uint64_t v26 = (os_log_s *)objc_claimAutoreleasedReturnValue(v25);
  if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR)) {
    sub_10002E058();
  }

  if (v10)
  {
    id v27 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[SYDSyncManager callbackQueue](self, "callbackQueue"));
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_100011204;
    block[3] = &unk_10004D090;
    id v40 = (NSMutableSet *)v10;
    id v39 = v13;
    dispatch_async(v27, block);

    id v18 = v40;
LABEL_22:
  }
}

+ (BOOL)shouldIgnoreFetchError:(id)a3
{
  id v4 = a3;
  uint64_t v11 = 0LL;
  id v12 = &v11;
  uint64_t v13 = 0x2020000000LL;
  char v14 = 1;
  id v5 = [v4 code];
  if (v5 == (id)2)
  {
    id v7 = (void *)objc_claimAutoreleasedReturnValue([v4 userInfo]);
    id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 objectForKeyedSubscript:CKPartialErrorsByItemIDKey]);

    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472LL;
    v10[2] = sub_100011548;
    v10[3] = &unk_10004D180;
    v10[4] = &v11;
    v10[5] = a1;
    [v8 enumerateKeysAndObjectsUsingBlock:v10];

    BOOL v6 = *((_BYTE *)v12 + 24) != 0;
  }

  else if (v5 == (id)26 || v5 == (id)28)
  {
    BOOL v6 = 1;
    *((_BYTE *)v12 + 24) = 1;
  }

  else
  {
    BOOL v6 = 0;
    *((_BYTE *)v12 + 24) = 0;
  }

  _Block_object_dispose(&v11, 8);

  return v6;
}

- (BOOL)shouldRetryAfterModifyError:(id)a3
{
  id v4 = a3;
  uint64_t v11 = 0LL;
  id v12 = &v11;
  uint64_t v13 = 0x2020000000LL;
  char v14 = 0;
  id v5 = [v4 code];
  if (v5 == (id)2)
  {
    id v7 = (void *)objc_claimAutoreleasedReturnValue([v4 userInfo]);
    id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 objectForKeyedSubscript:CKPartialErrorsByItemIDKey]);

    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472LL;
    v10[2] = sub_1000116C0;
    v10[3] = &unk_10004D1A8;
    v10[4] = self;
    v10[5] = &v11;
    [v8 enumerateKeysAndObjectsUsingBlock:v10];

    BOOL v6 = *((_BYTE *)v12 + 24) != 0;
  }

  else if (v5 == (id)14 || v5 == (id)26)
  {
    BOOL v6 = 1;
    *((_BYTE *)v12 + 24) = 1;
  }

  else
  {
    BOOL v6 = 0;
    *((_BYTE *)v12 + 24) = 0;
  }

  _Block_object_dispose(&v11, 8);

  return v6;
}

- (void)deleteDataFromCloudWithCompletionHandler:(id)a3
{
  id v4 = a3;
  id v5 = SYDGetCloudKitLog();
  BOOL v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    uint64_t v13 = self;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "Deleting data from cloud for %@", buf, 0xCu);
  }

  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[SYDSyncManager engine](self, "engine"));
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 database]);
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472LL;
  v10[2] = sub_100011824;
  v10[3] = &unk_10004D1F8;
  v10[4] = self;
  id v11 = v4;
  id v9 = v4;
  [v8 fetchAllRecordZonesWithCompletionHandler:v10];
}

- (id)recordIDForKey:(id)a3 inStoreWithIdentifier:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[SYDSyncManager coreDataStore](self, "coreDataStore"));
  id v9 = (void *)objc_claimAutoreleasedReturnValue([v8 keyValueForKey:v7 inStoreWithIdentifier:v6 createIfNecessary:0 error:0]);

  id v10 = (void *)objc_claimAutoreleasedReturnValue([v9 recordID]);
  return v10;
}

- (void)setAutomaticSyncingEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = (id)objc_claimAutoreleasedReturnValue(-[SYDSyncManager engine](self, "engine"));
  [v4 setAutomaticSyncingEnabled:v3];
}

- (BOOL)isAutomaticSyncingEnabled
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[SYDSyncManager engine](self, "engine"));
  unsigned __int8 v3 = [v2 isAutomaticSyncingEnabled];

  return v3;
}

- (BOOL)hasPendingChangesToUpload
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[SYDSyncManager engine](self, "engine"));
  unsigned __int8 v3 = (void *)objc_claimAutoreleasedReturnValue([v2 state]);

  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 pendingRecordZoneChanges]);
  if ([v4 count])
  {
    BOOL v5 = 1;
  }

  else
  {
    id v6 = (void *)objc_claimAutoreleasedReturnValue([v3 pendingDatabaseChanges]);
    BOOL v5 = [v6 count] != 0;
  }

  return v5;
}

- (id)newRecordNameForKey:(id)a3
{
  id v4 = a3;
  if (-[SYDSyncManager useUUIDRecordNames](self, "useUUIDRecordNames"))
  {
    BOOL v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](&OBJC_CLASS___NSUUID, "UUID"));
    id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 UUIDString]);
    id v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@%@",  @"KeyValue:",  v6));
  }

  else
  {
    id v7 = (void *)objc_claimAutoreleasedReturnValue( +[SYDKeyValue recordNameForUnencryptedKey:]( &OBJC_CLASS___SYDKeyValue,  "recordNameForUnencryptedKey:",  v4));
  }

  return v7;
}

- (void)markAllKeyValuesAsNeedingToBeUploaded
{
  unsigned __int8 v3 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[SYDSyncManager queue](self, "queue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100011E48;
  block[3] = &unk_10004CA38;
  void block[4] = self;
  dispatch_sync(v3, block);
}

- (void)markAllKeyValuesAsNeedingToBeUploadedForStoreWithIdentifier:(id)a3
{
  id v4 = a3;
  BOOL v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[SYDSyncManager queue](self, "queue"));
  dispatch_assert_queue_V2(v5);

  id v6 = SYDGetCloudKitLog();
  id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
    sub_10002E408();
  }

  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[SYDSyncManager coreDataStore](self, "coreDataStore"));
  id v31 = 0LL;
  id v9 = (void *)objc_claimAutoreleasedReturnValue([v8 allRecordNamesInStoreWithIdentifier:v4 error:&v31]);
  id v10 = v31;

  if (v10)
  {
    id v11 = SYDGetCloudKitLog();
    id v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      sub_10002E3A8();
    }
  }

  else
  {
    id v25 = self;
    uint64_t v13 = sub_10000CE94(v4);
    id v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
    char v14 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableArray arrayWithCapacity:]( NSMutableArray,  "arrayWithCapacity:",  [v9 count]));
    __int128 v27 = 0u;
    __int128 v28 = 0u;
    __int128 v29 = 0u;
    __int128 v30 = 0u;
    uint64_t v26 = v9;
    id v15 = v9;
    id v16 = [v15 countByEnumeratingWithState:&v27 objects:v36 count:16];
    if (v16)
    {
      id v17 = v16;
      uint64_t v18 = *(void *)v28;
      do
      {
        for (i = 0LL; i != v17; i = (char *)i + 1)
        {
          if (*(void *)v28 != v18) {
            objc_enumerationMutation(v15);
          }
          id v20 = *(void **)(*((void *)&v27 + 1) + 8LL * (void)i);
          uint64_t v21 = (char *)[v20 length];
          if ((unint64_t)(v21 - 256) > 0xFFFFFFFFFFFFFF00LL)
          {
            uint64_t v24 = -[CKRecordID initWithRecordName:zoneID:]( objc_alloc(&OBJC_CLASS___CKRecordID),  "initWithRecordName:zoneID:",  v20,  v12);
            [v14 addObject:v24];
          }

          else
          {
            v22 = v21;
            id v23 = SYDGetCloudKitLog();
            uint64_t v24 = (CKRecordID *)objc_claimAutoreleasedReturnValue(v23);
            if (os_log_type_enabled((os_log_t)v24, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 134218242;
              id v33 = v22;
              __int16 v34 = 2112;
              id v35 = v4;
              _os_log_error_impl( (void *)&_mh_execute_header,  (os_log_t)v24,  OS_LOG_TYPE_ERROR,  "Excluding key from cloud storage due to key length of (%ld) UTF-16 code units in store (%@)",  buf,  0x16u);
            }
          }
        }

        id v17 = [v15 countByEnumeratingWithState:&v27 objects:v36 count:16];
      }

      while (v17);
    }

    if ([v14 count]) {
      -[SYDSyncManager addKeyValueRecordIDsToSave:recordIDsToDelete:storeIdentifier:]( v25,  "addKeyValueRecordIDsToSave:recordIDsToDelete:storeIdentifier:",  v14,  0LL,  v4);
    }

    id v10 = 0LL;
    id v9 = v26;
  }
}

- (void)addPendingDatabaseChanges:(id)a3 storeIdentifier:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (-[SYDSyncManager shouldSyncStoreWithIdentifier:](self, "shouldSyncStoreWithIdentifier:", v7))
  {
    id v8 = (void *)objc_claimAutoreleasedReturnValue(-[SYDSyncManager engine](self, "engine"));
    id v9 = (void *)objc_claimAutoreleasedReturnValue([v8 state]);
    [v9 addPendingDatabaseChanges:v6];
  }

  else
  {
    id v10 = SYDGetCloudKitLog();
    id v8 = (void *)objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled((os_log_t)v8, OS_LOG_TYPE_DEBUG)) {
      sub_10002E46C();
    }
  }
}

- (void)addKeyValueRecordIDsToSave:(id)a3 recordIDsToDelete:(id)a4 storeIdentifier:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (-[SYDSyncManager shouldSyncStoreWithIdentifier:](self, "shouldSyncStoreWithIdentifier:", v10))
  {
    id v47 = v10;
    id v11 = -[NSMutableArray initWithCapacity:]( [NSMutableArray alloc],  "initWithCapacity:",  (char *)[v8 count] + (void)objc_msgSend(v9, "count"));
    __int128 v66 = 0u;
    __int128 v67 = 0u;
    __int128 v68 = 0u;
    __int128 v69 = 0u;
    id v49 = v8;
    id v12 = v8;
    id v13 = [v12 countByEnumeratingWithState:&v66 objects:v74 count:16];
    if (v13)
    {
      id v14 = v13;
      uint64_t v15 = *(void *)v67;
      do
      {
        id v16 = 0LL;
        do
        {
          if (*(void *)v67 != v15) {
            objc_enumerationMutation(v12);
          }
          id v17 = -[CKSyncEnginePendingRecordZoneChange initWithRecordID:type:]( objc_alloc(&OBJC_CLASS___CKSyncEnginePendingRecordZoneChange),  "initWithRecordID:type:",  *(void *)(*((void *)&v66 + 1) + 8LL * (void)v16),  0LL);
          -[NSMutableArray addObject:](v11, "addObject:", v17);

          id v16 = (char *)v16 + 1;
        }

        while (v14 != v16);
        id v14 = [v12 countByEnumeratingWithState:&v66 objects:v74 count:16];
      }

      while (v14);
    }

    __int128 v64 = 0u;
    __int128 v65 = 0u;
    __int128 v62 = 0u;
    __int128 v63 = 0u;
    id v48 = v9;
    id v18 = v9;
    id v19 = [v18 countByEnumeratingWithState:&v62 objects:v73 count:16];
    if (v19)
    {
      id v20 = v19;
      uint64_t v21 = *(void *)v63;
      do
      {
        v22 = 0LL;
        do
        {
          if (*(void *)v63 != v21) {
            objc_enumerationMutation(v18);
          }
          id v23 = -[CKSyncEnginePendingRecordZoneChange initWithRecordID:type:]( objc_alloc(&OBJC_CLASS___CKSyncEnginePendingRecordZoneChange),  "initWithRecordID:type:",  *(void *)(*((void *)&v62 + 1) + 8LL * (void)v22),  1LL);
          -[NSMutableArray addObject:](v11, "addObject:", v23);

          v22 = (char *)v22 + 1;
        }

        while (v20 != v22);
        id v20 = [v18 countByEnumeratingWithState:&v62 objects:v73 count:16];
      }

      while (v20);
    }

    uint64_t v24 = (void *)objc_claimAutoreleasedReturnValue(-[SYDSyncManager engine](self, "engine"));
    id v25 = (void *)objc_claimAutoreleasedReturnValue([v24 state]);
    [v25 addPendingRecordZoneChanges:v11];

    uint64_t v26 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableSet setWithCapacity:]( NSMutableSet,  "setWithCapacity:",  (char *)[v12 count] + (void)objc_msgSend(v18, "count")));
    __int128 v58 = 0u;
    __int128 v59 = 0u;
    __int128 v60 = 0u;
    __int128 v61 = 0u;
    id v27 = v12;
    id v28 = [v27 countByEnumeratingWithState:&v58 objects:v72 count:16];
    if (v28)
    {
      id v29 = v28;
      uint64_t v30 = *(void *)v59;
      do
      {
        id v31 = 0LL;
        do
        {
          if (*(void *)v59 != v30) {
            objc_enumerationMutation(v27);
          }
          uint64_t v32 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(*((void *)&v58 + 1) + 8 * (void)v31) zoneID]);
          id v33 = (void *)objc_claimAutoreleasedReturnValue([v32 zoneName]);
          [v26 addObject:v33];

          id v31 = (char *)v31 + 1;
        }

        while (v29 != v31);
        id v29 = [v27 countByEnumeratingWithState:&v58 objects:v72 count:16];
      }

      while (v29);
    }

    __int128 v56 = 0u;
    __int128 v57 = 0u;
    __int128 v54 = 0u;
    __int128 v55 = 0u;
    id v34 = v18;
    id v35 = [v34 countByEnumeratingWithState:&v54 objects:v71 count:16];
    if (v35)
    {
      id v36 = v35;
      uint64_t v37 = *(void *)v55;
      do
      {
        id v38 = 0LL;
        do
        {
          if (*(void *)v55 != v37) {
            objc_enumerationMutation(v34);
          }
          id v39 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(*((void *)&v54 + 1) + 8 * (void)v38) zoneID]);
          id v40 = (void *)objc_claimAutoreleasedReturnValue([v39 zoneName]);
          [v26 addObject:v40];

          id v38 = (char *)v38 + 1;
        }

        while (v36 != v38);
        id v36 = [v34 countByEnumeratingWithState:&v54 objects:v71 count:16];
      }

      while (v36);
    }

    __int128 v52 = 0u;
    __int128 v53 = 0u;
    __int128 v50 = 0u;
    __int128 v51 = 0u;
    id v41 = v26;
    id v42 = [v41 countByEnumeratingWithState:&v50 objects:v70 count:16];
    id v9 = v48;
    if (v42)
    {
      id v43 = v42;
      uint64_t v44 = *(void *)v51;
      do
      {
        v45 = 0LL;
        do
        {
          if (*(void *)v51 != v44) {
            objc_enumerationMutation(v41);
          }
          -[SYDSyncManager addSyncAnchorRecordIDToSaveIfNecessaryForStoreIdentifier:]( self,  "addSyncAnchorRecordIDToSaveIfNecessaryForStoreIdentifier:",  *(void *)(*((void *)&v50 + 1) + 8LL * (void)v45));
          v45 = (char *)v45 + 1;
        }

        while (v43 != v45);
        id v43 = [v41 countByEnumeratingWithState:&v50 objects:v70 count:16];
      }

      while (v43);
    }

    id v8 = v49;
    id v10 = v47;
  }

  else
  {
    id v46 = SYDGetCloudKitLog();
    id v11 = (NSMutableArray *)objc_claimAutoreleasedReturnValue(v46);
    if (os_log_type_enabled((os_log_t)v11, OS_LOG_TYPE_DEBUG)) {
      sub_10002E4D0();
    }
  }
}

- (void)addSyncAnchorRecordIDToSaveIfNecessaryForStoreIdentifier:(id)a3
{
  id v4 = a3;
  if (!-[SYDSyncManager shouldSyncStoreWithIdentifier:](self, "shouldSyncStoreWithIdentifier:", v4))
  {
    id v11 = SYDGetCloudKitLog();
    id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
      sub_10002E534();
    }
    goto LABEL_6;
  }

  if (-[SYDSyncManager useSyncAnchor](self, "useSyncAnchor"))
  {
    BOOL v5 = sub_10000CF48(v4);
    id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
    id v7 = (void *)objc_claimAutoreleasedReturnValue(-[SYDSyncManager engine](self, "engine"));
    id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 state]);
    id v9 = -[CKSyncEnginePendingRecordZoneChange initWithRecordID:type:]( objc_alloc(&OBJC_CLASS___CKSyncEnginePendingRecordZoneChange),  "initWithRecordID:type:",  v6,  0LL);
    id v12 = v9;
    id v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v12, 1LL));
    [v8 addPendingRecordZoneChanges:v10];

LABEL_6:
  }
}

- (void)resetSyncEngine
{
  unsigned __int8 v3 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[SYDSyncManager queue](self, "queue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000129B0;
  block[3] = &unk_10004CA38;
  void block[4] = self;
  dispatch_sync(v3, block);
}

- (void)resetSyncEngineWithContainer:(id)a3
{
  id v4 = a3;
  BOOL v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[SYDSyncManager queue](self, "queue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100012A50;
  block[3] = &unk_10004CA88;
  id v8 = v4;
  id v9 = self;
  id v6 = v4;
  dispatch_sync(v5, block);
}

- (void)_queue_resetSyncEngine
{
  unsigned __int8 v3 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[SYDSyncManager queue](self, "queue"));
  dispatch_assert_queue_V2(v3);

  id v4 = SYDGetCloudKitLog();
  BOOL v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    sub_10002E600();
  }

  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[SYDSyncManager coreDataStore](self, "coreDataStore"));
  [v6 saveSyncEngineStateSerialization:0 error:0];

  engine = self->_engine;
  self->_engine = 0LL;

  -[SYDSyncManager initializeSyncEngineWithError:](self, "initializeSyncEngineWithError:", 0LL);
}

- (void)syncEngine:(id)a3 handleEvent:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (id)objc_claimAutoreleasedReturnValue(-[SYDSyncManager engine](self, "engine"));

  if (v8 == v6)
  {
    id v9 = SYDGetCloudKitLog();
    id v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
      sub_10002E664();
    }

    switch((unint64_t)[v7 type])
    {
      case 0uLL:
        id v11 = (void *)objc_claimAutoreleasedReturnValue([v7 stateUpdateEvent]);
        id v12 = (void *)objc_claimAutoreleasedReturnValue([v11 stateSerialization]);
        -[SYDSyncManager handleSyncEngineStateUpdate:](self, "handleSyncEngineStateUpdate:", v12);
        goto LABEL_66;
      case 1uLL:
        id v11 = (void *)objc_claimAutoreleasedReturnValue([v7 accountChangeEvent]);
        id v12 = (void *)objc_claimAutoreleasedReturnValue([v11 previousUser]);
        id v13 = (void *)objc_claimAutoreleasedReturnValue([v11 currentUser]);
        -[SYDSyncManager syncEngine:accountChangedFromUserRecordID:toUserRecordID:]( self,  "syncEngine:accountChangedFromUserRecordID:toUserRecordID:",  v6,  v12,  v13);
        goto LABEL_65;
      case 2uLL:
        id v11 = (void *)objc_claimAutoreleasedReturnValue([v7 fetchedDatabaseChangesEvent]);
        __int128 v80 = 0u;
        __int128 v81 = 0u;
        __int128 v82 = 0u;
        __int128 v83 = 0u;
        id v12 = (void *)objc_claimAutoreleasedReturnValue([v11 deletions]);
        id v14 = [v12 countByEnumeratingWithState:&v80 objects:v90 count:16];
        if (v14)
        {
          id v15 = v14;
          uint64_t v16 = *(void *)v81;
          do
          {
            for (i = 0LL; i != v15; i = (char *)i + 1)
            {
              if (*(void *)v81 != v16) {
                objc_enumerationMutation(v12);
              }
              id v18 = *(void **)(*((void *)&v80 + 1) + 8LL * (void)i);
              if ([v18 reason] == (id)1)
              {
                id v19 = (void *)objc_claimAutoreleasedReturnValue([v18 zoneID]);
                -[SYDSyncManager zoneWithIDWasPurged:](self, "zoneWithIDWasPurged:", v19);
              }
            }

            id v15 = [v12 countByEnumeratingWithState:&v80 objects:v90 count:16];
          }

          while (v15);
        }

        goto LABEL_66;
      case 3uLL:
        id v11 = (void *)objc_claimAutoreleasedReturnValue([v7 fetchedRecordZoneChangesEvent]);
        __int128 v76 = 0u;
        __int128 v77 = 0u;
        __int128 v78 = 0u;
        __int128 v79 = 0u;
        id v20 = (void *)objc_claimAutoreleasedReturnValue([v11 modifications]);
        id v21 = [v20 countByEnumeratingWithState:&v76 objects:v89 count:16];
        if (v21)
        {
          id v22 = v21;
          uint64_t v23 = *(void *)v77;
          do
          {
            for (j = 0LL; j != v22; j = (char *)j + 1)
            {
              if (*(void *)v77 != v23) {
                objc_enumerationMutation(v20);
              }
              -[SYDSyncManager didFetchRecord:]( self,  "didFetchRecord:",  *(void *)(*((void *)&v76 + 1) + 8LL * (void)j));
            }

            id v22 = [v20 countByEnumeratingWithState:&v76 objects:v89 count:16];
          }

          while (v22);
        }

        __int128 v74 = 0u;
        __int128 v75 = 0u;
        __int128 v72 = 0u;
        __int128 v73 = 0u;
        id v12 = (void *)objc_claimAutoreleasedReturnValue([v11 deletions]);
        id v25 = [v12 countByEnumeratingWithState:&v72 objects:v88 count:16];
        if (v25)
        {
          id v26 = v25;
          uint64_t v27 = *(void *)v73;
          do
          {
            for (k = 0LL; k != v26; k = (char *)k + 1)
            {
              if (*(void *)v73 != v27) {
                objc_enumerationMutation(v12);
              }
              id v29 = *(void **)(*((void *)&v72 + 1) + 8LL * (void)k);
              uint64_t v30 = (void *)objc_claimAutoreleasedReturnValue([v29 recordID]);
              id v31 = (void *)objc_claimAutoreleasedReturnValue([v29 recordType]);
              -[SYDSyncManager didFetchRecordDeletion:recordType:](self, "didFetchRecordDeletion:recordType:", v30, v31);
            }

            id v26 = [v12 countByEnumeratingWithState:&v72 objects:v88 count:16];
          }

          while (v26);
        }

        goto LABEL_66;
      case 4uLL:
        id v11 = (void *)objc_claimAutoreleasedReturnValue([v7 sentDatabaseChangesEvent]);
        __int128 v68 = 0u;
        __int128 v69 = 0u;
        __int128 v70 = 0u;
        __int128 v71 = 0u;
        id v12 = (void *)objc_claimAutoreleasedReturnValue([v11 deletedZoneIDs]);
        id v32 = [v12 countByEnumeratingWithState:&v68 objects:v87 count:16];
        if (v32)
        {
          id v33 = v32;
          uint64_t v34 = *(void *)v69;
          do
          {
            for (m = 0LL; m != v33; m = (char *)m + 1)
            {
              if (*(void *)v69 != v34) {
                objc_enumerationMutation(v12);
              }
              -[SYDSyncManager didDeleteRecordZoneWithID:]( self,  "didDeleteRecordZoneWithID:",  *(void *)(*((void *)&v68 + 1) + 8LL * (void)m));
            }

            id v33 = [v12 countByEnumeratingWithState:&v68 objects:v87 count:16];
          }

          while (v33);
        }

        goto LABEL_66;
      case 5uLL:
        id v11 = (void *)objc_claimAutoreleasedReturnValue([v7 sentRecordZoneChangesEvent]);
        __int128 v64 = 0u;
        __int128 v65 = 0u;
        __int128 v66 = 0u;
        __int128 v67 = 0u;
        id v36 = (void *)objc_claimAutoreleasedReturnValue([v11 savedRecords]);
        id v37 = [v36 countByEnumeratingWithState:&v64 objects:v86 count:16];
        if (v37)
        {
          id v38 = v37;
          uint64_t v39 = *(void *)v65;
          do
          {
            for (n = 0LL; n != v38; n = (char *)n + 1)
            {
              if (*(void *)v65 != v39) {
                objc_enumerationMutation(v36);
              }
              -[SYDSyncManager didSaveRecord:]( self,  "didSaveRecord:",  *(void *)(*((void *)&v64 + 1) + 8LL * (void)n));
            }

            id v38 = [v36 countByEnumeratingWithState:&v64 objects:v86 count:16];
          }

          while (v38);
        }

        __int128 v62 = 0u;
        __int128 v63 = 0u;
        __int128 v60 = 0u;
        __int128 v61 = 0u;
        id v41 = (void *)objc_claimAutoreleasedReturnValue([v11 deletedRecordIDs]);
        id v42 = [v41 countByEnumeratingWithState:&v60 objects:v85 count:16];
        if (v42)
        {
          id v43 = v42;
          uint64_t v44 = *(void *)v61;
          do
          {
            for (ii = 0LL; ii != v43; ii = (char *)ii + 1)
            {
              if (*(void *)v61 != v44) {
                objc_enumerationMutation(v41);
              }
              -[SYDSyncManager didDeleteRecordWithID:]( self,  "didDeleteRecordWithID:",  *(void *)(*((void *)&v60 + 1) + 8LL * (void)ii));
            }

            id v43 = [v41 countByEnumeratingWithState:&v60 objects:v85 count:16];
          }

          while (v43);
        }

        __int128 v58 = 0u;
        __int128 v59 = 0u;
        __int128 v56 = 0u;
        __int128 v57 = 0u;
        id v46 = (void *)objc_claimAutoreleasedReturnValue([v11 failedRecordSaves]);
        id v47 = [v46 countByEnumeratingWithState:&v56 objects:v84 count:16];
        if (v47)
        {
          id v48 = v47;
          uint64_t v49 = *(void *)v57;
          do
          {
            for (jj = 0LL; jj != v48; jj = (char *)jj + 1)
            {
              if (*(void *)v57 != v49) {
                objc_enumerationMutation(v46);
              }
              __int128 v51 = *(void **)(*((void *)&v56 + 1) + 8LL * (void)jj);
              __int128 v52 = (void *)objc_claimAutoreleasedReturnValue([v51 record]);
              __int128 v53 = (void *)objc_claimAutoreleasedReturnValue([v51 error]);
              -[SYDSyncManager didFailToSaveRecord:error:](self, "didFailToSaveRecord:error:", v52, v53);
            }

            id v48 = [v46 countByEnumeratingWithState:&v56 objects:v84 count:16];
          }

          while (v48);
        }

        id v12 = (void *)objc_claimAutoreleasedReturnValue([v11 failedRecordDeletes]);
        v55[0] = _NSConcreteStackBlock;
        v55[1] = 3221225472LL;
        v55[2] = sub_100013238;
        v55[3] = &unk_10004D220;
        v55[4] = self;
        [v12 enumerateKeysAndObjectsUsingBlock:v55];
        goto LABEL_66;
      case 6uLL:
        -[SYDSyncManager willBeginFetchingChanges](self, "willBeginFetchingChanges");
        break;
      case 8uLL:
        id v11 = (void *)objc_claimAutoreleasedReturnValue([v7 didFetchRecordZoneChangesEvent]);
        __int128 v54 = (void *)objc_claimAutoreleasedReturnValue([v11 error]);

        if (!v54) {
          goto LABEL_67;
        }
        id v12 = (void *)objc_claimAutoreleasedReturnValue([v11 zoneID]);
        id v13 = (void *)objc_claimAutoreleasedReturnValue([v11 error]);
        -[SYDSyncManager didFailToFetchChangesForRecordZoneID:error:]( self,  "didFailToFetchChangesForRecordZoneID:error:",  v12,  v13);
LABEL_65:

LABEL_66:
LABEL_67:

        break;
      case 9uLL:
        -[SYDSyncManager didEndFetchingChanges](self, "didEndFetchingChanges");
        break;
      default:
        break;
    }
  }
}

- (void)syncEngine:(id)a3 accountChangedFromUserRecordID:(id)a4 toUserRecordID:(id)a5
{
  id v7 = a5;
  id v8 = v7;
  if (!a4 && v7)
  {
    id v9 = SYDGetCloudKitLog();
    id v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      int v11 = 138412290;
      id v12 = v8;
      _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_INFO,  "Detected a newUserRecordID: %@ Marking everything to be re-uploaded",  (uint8_t *)&v11,  0xCu);
    }

    -[SYDSyncManager markAllKeyValuesAsNeedingToBeUploaded](self, "markAllKeyValuesAsNeedingToBeUploaded");
  }
}

- (void)didFailToFetchChangesForRecordZoneID:(id)a3 error:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[SYDSyncManager queue](self, "queue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000133CC;
  block[3] = &unk_10004CB78;
  id v12 = v6;
  id v13 = v7;
  id v14 = self;
  id v9 = v7;
  id v10 = v6;
  dispatch_sync(v8, block);
}

- (BOOL)isIdentityLostError:(id)a3
{
  id v4 = a3;
  uint64_t v11 = 0LL;
  id v12 = &v11;
  uint64_t v13 = 0x2020000000LL;
  char v14 = 0;
  id v5 = [v4 code];
  if (v5 == (id)2)
  {
    id v7 = (void *)objc_claimAutoreleasedReturnValue([v4 userInfo]);
    id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 objectForKeyedSubscript:CKPartialErrorsByItemIDKey]);

    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472LL;
    v10[2] = sub_1000135C4;
    v10[3] = &unk_10004D1A8;
    v10[4] = self;
    void v10[5] = &v11;
    [v8 enumerateKeysAndObjectsUsingBlock:v10];

    BOOL v6 = *((_BYTE *)v12 + 24) != 0;
  }

  else if (v5 == (id)112)
  {
    BOOL v6 = 1;
    *((_BYTE *)v12 + 24) = 1;
  }

  else
  {
    BOOL v6 = 0;
    *((_BYTE *)v12 + 24) = 0;
  }

  _Block_object_dispose(&v11, 8);

  return v6;
}

- (void)_markZoneForDeletionOnManateeFailureForRecordZoneID:(id)a3
{
  id v4 = a3;
  id v5 = SYDGetCloudKitLog();
  BOOL v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    id v13 = v4;
    _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_INFO,  "Missing Manatee identity fetching %@, deleting the zone now",  buf,  0xCu);
  }

  id v7 = (void *)objc_claimAutoreleasedReturnValue([v4 zoneName]);
  id v8 = -[CKSyncEnginePendingZoneDelete initWithZoneID:]( objc_alloc(&OBJC_CLASS___CKSyncEnginePendingZoneDelete),  "initWithZoneID:",  v4);
  uint64_t v11 = v8;
  id v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v11, 1LL));
  -[SYDSyncManager addPendingDatabaseChanges:storeIdentifier:]( self,  "addPendingDatabaseChanges:storeIdentifier:",  v9,  v7);

  id v10 = (void *)objc_claimAutoreleasedReturnValue(-[SYDSyncManager coreDataStore](self, "coreDataStore"));
  [v10 clearServerSystemFieldsRecordsForAllKeyValuesInStoreWithIdentifier:v7 error:0];
}

- (id)syncEngine:(id)a3 nextRecordZoneChangeBatchForContext:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (id)objc_claimAutoreleasedReturnValue(-[SYDSyncManager engine](self, "engine"));

  if (v8 == v6)
  {
    id v29 = self;
    id v10 = (void *)objc_claimAutoreleasedReturnValue([v7 options]);
    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([v10 scope]);

    id v12 = SYDGetCloudKitLog();
    id v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG)) {
      sub_10002E6EC();
    }
    id v30 = v7;

    char v14 = objc_opt_new(&OBJC_CLASS___NSMutableArray);
    __int128 v33 = 0u;
    __int128 v34 = 0u;
    __int128 v35 = 0u;
    __int128 v36 = 0u;
    id v15 = (void *)objc_claimAutoreleasedReturnValue([v6 state]);
    uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue([v15 pendingRecordZoneChanges]);

    id v17 = [v16 countByEnumeratingWithState:&v33 objects:v37 count:16];
    if (v17)
    {
      id v18 = v17;
      uint64_t v19 = *(void *)v34;
      do
      {
        for (i = 0LL; i != v18; i = (char *)i + 1)
        {
          if (*(void *)v34 != v19) {
            objc_enumerationMutation(v16);
          }
          id v21 = *(void **)(*((void *)&v33 + 1) + 8LL * (void)i);
          id v22 = (void *)objc_claimAutoreleasedReturnValue([v21 recordID]);
          unsigned int v23 = [v11 containsRecordID:v22];

          if (v23) {
            -[NSMutableArray addObject:](v14, "addObject:", v21);
          }
        }

        id v18 = [v16 countByEnumeratingWithState:&v33 objects:v37 count:16];
      }

      while (v18);
    }

    uint64_t v24 = objc_opt_new(&OBJC_CLASS___NSMutableArray);
    id v25 = objc_alloc(&OBJC_CLASS___CKSyncEngineRecordZoneChangeBatch);
    v31[0] = _NSConcreteStackBlock;
    v31[1] = 3221225472LL;
    v31[2] = sub_1000139D4;
    v31[3] = &unk_10004D248;
    v31[4] = v29;
    id v32 = v24;
    id v26 = v24;
    id v9 = -[CKSyncEngineRecordZoneChangeBatch initWithPendingChanges:recordProvider:]( v25,  "initWithPendingChanges:recordProvider:",  v14,  v31);
    uint64_t v27 = (void *)objc_claimAutoreleasedReturnValue([v6 state]);
    [v27 removePendingRecordZoneChanges:v26];

    id v7 = v30;
  }

  else
  {
    id v9 = 0LL;
  }

  return v9;
}

- (id)recordToSaveForRecordID:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v7 = SYDGetCloudKitLog();
  id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
    sub_10002E8F0(v6, v8);
  }

  id v9 = (void *)objc_claimAutoreleasedReturnValue([v6 zoneID]);
  id v10 = (void *)objc_claimAutoreleasedReturnValue([v9 zoneName]);

  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([v6 recordName]);
  unsigned int v12 = [v11 isEqual:@"syncAnchor"];

  id v13 = (void *)objc_claimAutoreleasedReturnValue(-[SYDSyncManager coreDataStore](self, "coreDataStore"));
  char v14 = v13;
  if (v12)
  {
    id v31 = 0LL;
    id v15 = (void *)objc_claimAutoreleasedReturnValue([v13 serverSyncAnchorSystemFieldsRecordDataForStoreWithIdentifier:v10 error:&v31]);
    id v16 = v31;

    if (v16)
    {
      id v17 = SYDGetCloudKitLog();
      id v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(v17);
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
        sub_10002E830();
      }
LABEL_10:

      id v21 = 0LL;
      goto LABEL_11;
    }

    if (v15)
    {
      id v30 = 0LL;
      id v25 = -[NSKeyedUnarchiver initForReadingFromData:error:]( objc_alloc(&OBJC_CLASS___NSKeyedUnarchiver),  "initForReadingFromData:error:",  v15,  &v30);
      id v16 = v30;
      id v21 = -[CKRecord initWithCoder:](objc_alloc(&OBJC_CLASS___CKRecord), "initWithCoder:", v25);
      if (v16)
      {
        id v26 = SYDGetCloudKitLog();
        uint64_t v27 = (os_log_s *)objc_claimAutoreleasedReturnValue(v26);
        if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR)) {
          sub_10002E7D0();
        }
      }
    }

    else
    {
      id v21 = -[CKRecord initWithRecordType:recordID:]( objc_alloc(&OBJC_CLASS___CKRecord),  "initWithRecordType:recordID:",  @"KVSSyncAnchorRecord",  v6);
      id v16 = 0LL;
    }
  }

  else
  {
    uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue([v6 recordName]);
    id v29 = 0LL;
    id v15 = (void *)objc_claimAutoreleasedReturnValue([v14 keyValueForRecordName:v19 inStoreWithIdentifier:v10 error:&v29]);
    id v16 = v29;

    if (v16)
    {
      id v20 = SYDGetCloudKitLog();
      id v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(v20);
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
        sub_10002E890();
      }
      goto LABEL_10;
    }

    if (!v15)
    {
      id v28 = SYDGetCloudKitLog();
      id v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(v28);
      if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        id v33 = v6;
        _os_log_impl( (void *)&_mh_execute_header,  v18,  OS_LOG_TYPE_INFO,  "No keyValue for recordID %@, so we're returning nothing",  buf,  0xCu);
      }

      goto LABEL_10;
    }

    id v21 = (CKRecord *)objc_claimAutoreleasedReturnValue( objc_msgSend( v15,  "recordRepresentationForStoreType:",  -[SYDSyncManager storeType](self, "storeType")));
  }

- (void)didSaveRecord:(id)a3
{
  id v4 = a3;
  id v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[SYDSyncManager queue](self, "queue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100013E50;
  block[3] = &unk_10004CA88;
  id v8 = v4;
  id v9 = self;
  id v6 = v4;
  dispatch_sync(v5, block);
}

- (void)didSaveKeyValueRecord:(id)a3
{
  id v4 = a3;
  id v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[SYDSyncManager queue](self, "queue"));
  dispatch_assert_queue_V2(v5);

  id v6 = SYDGetCloudKitLog();
  id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
    sub_10002EB48(v4, v7);
  }

  id v8 = (void *)objc_claimAutoreleasedReturnValue([v4 recordID]);
  id v9 = (void *)objc_claimAutoreleasedReturnValue([v8 zoneID]);
  id v10 = (void *)objc_claimAutoreleasedReturnValue([v9 zoneName]);

  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(-[SYDSyncManager coreDataStore](self, "coreDataStore"));
  unsigned int v12 = (void *)objc_claimAutoreleasedReturnValue([v4 recordID]);
  id v13 = (void *)objc_claimAutoreleasedReturnValue([v12 recordName]);
  id v28 = 0LL;
  char v14 = (void *)objc_claimAutoreleasedReturnValue([v11 keyValueForRecordName:v13 inStoreWithIdentifier:v10 error:&v28]);
  id v15 = v28;

  if (v15)
  {
    id v16 = SYDGetCloudKitLog();
    id v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
      sub_10002EAE8();
    }
LABEL_6:

    goto LABEL_7;
  }

  id v20 = SYDGetCloudKitLog();
  id v21 = (os_log_s *)objc_claimAutoreleasedReturnValue(v20);
  id v17 = v21;
  if (!v14)
  {
    if (os_log_type_enabled(v21, OS_LOG_TYPE_FAULT)) {
      sub_10002E9F4(v4, v17);
    }
    id v15 = 0LL;
    goto LABEL_6;
  }

  if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
  {
    id v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "syd_shortDescription"));
    unsigned int v23 = (void *)objc_claimAutoreleasedReturnValue([v14 key]);
    *(_DWORD *)buf = 138413059;
    id v30 = v22;
    __int16 v31 = 2160;
    uint64_t v32 = 1752392040LL;
    __int16 v33 = 2113;
    __int128 v34 = v23;
    __int16 v35 = 2112;
    __int128 v36 = v10;
    _os_log_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_INFO,  "Saved record %@ for key <(%{private, mask.hash}@)> in store <(%@)>",  buf,  0x2Au);
  }

  [v14 setServerSystemFieldsRecord:v4];
  uint64_t v24 = (void *)objc_claimAutoreleasedReturnValue(-[SYDSyncManager coreDataStore](self, "coreDataStore"));
  id v27 = 0LL;
  unsigned __int8 v25 = [v24 saveKeyValue:v14 inStoreWithIdentifier:v10 excludeFromChangeTracking:0 enforceQuota:0 error:&v27];
  id v15 = v27;

  if ((v25 & 1) == 0)
  {
    id v26 = SYDGetCloudKitLog();
    id v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v26);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
      sub_10002EA88();
    }
    goto LABEL_6;
  }

- (void)didFailToSaveRecord:(id)a3 error:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[SYDSyncManager queue](self, "queue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100014364;
  block[3] = &unk_10004CB78;
  id v12 = v6;
  id v13 = v7;
  char v14 = self;
  id v9 = v7;
  id v10 = v6;
  dispatch_sync(v8, block);
}

- (void)failedToSaveKeyValueRecord:(id)a3 error:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[SYDSyncManager queue](self, "queue"));
  dispatch_assert_queue_V2(v8);

  id v9 = (void *)objc_claimAutoreleasedReturnValue([v6 recordID]);
  id v10 = (void *)objc_claimAutoreleasedReturnValue([v9 zoneID]);
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([v10 zoneName]);

  uint64_t v12 = (uint64_t)[v7 code];
  if (v12 <= 109)
  {
    switch(v12)
    {
      case 3LL:
      case 4LL:
      case 6LL:
      case 7LL:
      case 9LL:
      case 20LL:
      case 23LL:
        goto LABEL_77;
      case 11LL:
        id v13 = SYDGetCloudKitLog();
        char v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
        if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
        {
          id v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "syd_shortDescription"));
          *(_DWORD *)buf = 138412290;
          v121 = v15;
          _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_INFO,  "Unknown item saving key-value record, will re-upload %@",  buf,  0xCu);
        }

        id v16 = (void *)objc_claimAutoreleasedReturnValue(-[SYDSyncManager coreDataStore](self, "coreDataStore"));
        id v17 = (void *)objc_claimAutoreleasedReturnValue([v6 recordID]);
        id v18 = (void *)objc_claimAutoreleasedReturnValue([v17 recordName]);
        id v108 = 0LL;
        uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue([v16 keyValueForRecordName:v18 inStoreWithIdentifier:v11 error:&v108]);
        id v20 = (os_log_s *)v108;

        if (v20)
        {
          id v21 = SYDGetCloudKitLog();
          id v22 = (os_log_s *)objc_claimAutoreleasedReturnValue(v21);
          if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
            sub_10002F000();
          }
          goto LABEL_74;
        }

        if (v19)
        {
          [v19 setServerSystemFieldsRecord:0];
          __int128 v79 = (void *)objc_claimAutoreleasedReturnValue(-[SYDSyncManager coreDataStore](self, "coreDataStore"));
          id v107 = 0LL;
          unsigned int v80 = [v79 saveKeyValue:v19 inStoreWithIdentifier:v11 excludeFromChangeTracking:0 enforceQuota:0 error:&v107];
          id v20 = (os_log_s *)v107;

          if (v80)
          {
            id v22 = (os_log_s *)objc_claimAutoreleasedReturnValue([v6 recordID]);
            v117 = v22;
            __int128 v81 = (void *)objc_claimAutoreleasedReturnValue( +[NSArray arrayWithObjects:count:]( &OBJC_CLASS___NSArray,  "arrayWithObjects:count:",  &v117,  1LL));
            -[SYDSyncManager addKeyValueRecordIDsToSave:recordIDsToDelete:storeIdentifier:]( self,  "addKeyValueRecordIDsToSave:recordIDsToDelete:storeIdentifier:",  v81,  0LL,  v11);
          }

          else
          {
            id v86 = SYDGetCloudKitLog();
            id v22 = (os_log_s *)objc_claimAutoreleasedReturnValue(v86);
            if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
              sub_10002EFA0();
            }
          }

          goto LABEL_74;
        }

        id v85 = SYDGetCloudKitLog();
        id v20 = (os_log_s *)objc_claimAutoreleasedReturnValue(v85);
        if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG)) {
          sub_10002EF0C(v6, v20);
        }
        goto LABEL_75;
      case 14LL:
        id v32 = SYDGetCloudKitLog();
        __int16 v33 = (os_log_s *)objc_claimAutoreleasedReturnValue(v32);
        if (os_log_type_enabled(v33, OS_LOG_TYPE_DEBUG)) {
          sub_10002EE8C(v6, v33);
        }

        __int128 v34 = (void *)objc_claimAutoreleasedReturnValue([v6 recordType]);
        if ([v34 isEqualToString:@"KVSRecord"])
        {
        }

        else
        {
          __int128 v55 = (void *)objc_claimAutoreleasedReturnValue([v6 recordType]);
          unsigned int v56 = [v55 isEqualToString:@"EncryptedKeyValue"];

          if (!v56) {
            goto LABEL_77;
          }
        }

        __int128 v57 = (void *)objc_claimAutoreleasedReturnValue([v7 userInfo]);
        uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue([v57 objectForKeyedSubscript:CKRecordChangedErrorServerRecordKey]);

        if (v19)
        {
          unsigned int v58 = +[SYDKeyValue keyValueRecordHasAssetWithoutFile:]( &OBJC_CLASS___SYDKeyValue,  "keyValueRecordHasAssetWithoutFile:",  v19);
          id v59 = SYDGetCloudKitLog();
          __int128 v60 = (os_log_s *)objc_claimAutoreleasedReturnValue(v59);
          BOOL v61 = os_log_type_enabled(v60, OS_LOG_TYPE_DEBUG);
          if (v58)
          {
            if (v61) {
              sub_10002ED64(v6, v60);
            }

            __int128 v62 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[SYDKeyValue recordFieldKeyForValueModificationDateInStoreType:]( &OBJC_CLASS___SYDKeyValue,  "recordFieldKeyForValueModificationDateInStoreType:",  -[SYDSyncManager storeType](self, "storeType")));
            uint64_t v63 = objc_claimAutoreleasedReturnValue([v19 objectForKeyedSubscript:v62]);
            __int128 v64 = (void *)v63;
            if (!v63)
            {
              id v87 = SYDGetCloudKitLog();
              __int128 v76 = (os_log_s *)objc_claimAutoreleasedReturnValue(v87);
              if (os_log_type_enabled(v76, OS_LOG_TYPE_ERROR)) {
                sub_10002EC78();
              }
              goto LABEL_70;
            }

            v101 = v62;
            v104 = (void *)v63;
            __int128 v65 = (void *)objc_claimAutoreleasedReturnValue(-[SYDSyncManager coreDataStore](self, "coreDataStore"));
            __int128 v66 = (void *)objc_claimAutoreleasedReturnValue([v6 recordID]);
            __int128 v67 = (void *)objc_claimAutoreleasedReturnValue([v66 recordName]);
            id v110 = 0LL;
            __int128 v68 = (void *)objc_claimAutoreleasedReturnValue([v65 keyValueForRecordName:v67 inStoreWithIdentifier:v11 error:&v110]);
            v103 = (os_log_s *)v110;

            v102 = v68;
            if (v68)
            {
              __int128 v69 = (void *)objc_claimAutoreleasedReturnValue([v68 valueModificationDate]);
              id v70 = [v69 compare:v104];

              id v71 = SYDGetCloudKitLog();
              __int128 v72 = (os_log_s *)objc_claimAutoreleasedReturnValue(v71);
              __int128 v73 = v72;
              if (v70 == (id)1)
              {
                if (os_log_type_enabled(v72, OS_LOG_TYPE_INFO))
                {
                  *(_WORD *)buf = 0;
                  _os_log_impl( (void *)&_mh_execute_header,  v73,  OS_LOG_TYPE_INFO,  "Taking the server system fields record from the server record even though we don't have the server's value",  buf,  2u);
                }

                [v68 setServerSystemFieldsRecordIfNewer:v19];
                __int128 v74 = (void *)objc_claimAutoreleasedReturnValue(-[SYDSyncManager coreDataStore](self, "coreDataStore"));
                v109 = v103;
                unsigned __int8 v75 = [v74 saveKeyValue:v68 inStoreWithIdentifier:v11 excludeFromChangeTracking:0 enforceQuota:0 error:&v109];
                __int128 v76 = v109;

                if ((v75 & 1) != 0)
                {
                  __int128 v64 = v104;
                  __int128 v62 = v101;
LABEL_69:

LABEL_70:
                  goto LABEL_71;
                }

                id v97 = SYDGetCloudKitLog();
                __int128 v73 = (os_log_s *)objc_claimAutoreleasedReturnValue(v97);
                __int128 v64 = v104;
                __int128 v62 = v101;
                if (os_log_type_enabled(v73, OS_LOG_TYPE_ERROR)) {
                  sub_10002ED04();
                }
                v103 = v76;
LABEL_68:

                __int128 v76 = v103;
                goto LABEL_69;
              }

              if (os_log_type_enabled(v72, OS_LOG_TYPE_ERROR))
              {
                v98 = (void *)objc_claimAutoreleasedReturnValue([v6 recordID]);
                v100 = (os_log_s *)objc_claimAutoreleasedReturnValue([v98 recordName]);
                v99 = (void *)objc_claimAutoreleasedReturnValue([v102 valueModificationDate]);
                *(_DWORD *)buf = 138413058;
                v121 = v100;
                __int16 v122 = 2112;
                v123 = v99;
                __int16 v124 = 2112;
                __int128 v64 = v104;
                v125 = v104;
                __int16 v126 = 2112;
                v127 = v11;
                _os_log_error_impl( (void *)&_mh_execute_header,  v73,  OS_LOG_TYPE_ERROR,  "Unable to update local record recordName:%@ , keyValue.valueModificationDate:%@ , serverValueModificat ionDate:%@ in store:%@",  buf,  0x2Au);

                goto LABEL_67;
              }
            }

            else
            {
              id v88 = SYDGetCloudKitLog();
              __int128 v73 = (os_log_s *)objc_claimAutoreleasedReturnValue(v88);
              if (os_log_type_enabled(v73, OS_LOG_TYPE_ERROR)) {
                sub_10002ECA4();
              }
            }

            __int128 v64 = v104;
LABEL_67:
            __int128 v62 = v101;
            goto LABEL_68;
          }

          if (v61) {
            sub_10002EDF8(v6, v60);
          }

          v119 = v19;
          __int128 v62 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[NSArray arrayWithObjects:count:]( &OBJC_CLASS___NSArray,  "arrayWithObjects:count:",  &v119,  1LL));
          -[SYDSyncManager processFetchedRecords:deletedRecordIDs:]( self,  "processFetchedRecords:deletedRecordIDs:",  v62,  0LL);
        }

        else
        {
          id v82 = SYDGetCloudKitLog();
          __int128 v62 = (os_log_s *)objc_claimAutoreleasedReturnValue(v82);
          if (os_log_type_enabled(v62, OS_LOG_TYPE_INFO))
          {
            __int128 v83 = (void *)objc_claimAutoreleasedReturnValue([v6 recordID]);
            v84 = (os_log_s *)objc_claimAutoreleasedReturnValue(objc_msgSend(v83, "syd_shortDescription"));
            *(_DWORD *)buf = 138412290;
            v121 = v84;
            _os_log_impl( (void *)&_mh_execute_header,  v62,  OS_LOG_TYPE_INFO,  "No server record when resolving conflict saving record %@",  buf,  0xCu);
          }
        }

- (void)didDeleteRecordWithID:(id)a3
{
  id v4 = a3;
  id v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[SYDSyncManager queue](self, "queue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100015434;
  block[3] = &unk_10004CA88;
  id v8 = v4;
  id v9 = self;
  id v6 = v4;
  dispatch_sync(v5, block);
}

- (void)didFailToDeleteRecordWithID:(id)a3 error:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[SYDSyncManager queue](self, "queue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10001580C;
  block[3] = &unk_10004CA88;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_sync(v8, block);
}

- (void)didFetchRecord:(id)a3
{
  id v4 = a3;
  id v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[SYDSyncManager queue](self, "queue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000158EC;
  block[3] = &unk_10004CA88;
  id v8 = v4;
  id v9 = self;
  id v6 = v4;
  dispatch_sync(v5, block);
}

- (void)saveSyncAnchorSystemFieldsRecord:(id)a3
{
  id v4 = a3;
  id v5 = SYDGetCloudKitLog();
  id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
    sub_10002F474(v4, v6);
  }

  id v7 = -[NSKeyedArchiver initRequiringSecureCoding:]( objc_alloc(&OBJC_CLASS___NSKeyedArchiver),  "initRequiringSecureCoding:",  1LL);
  [v4 encodeSystemFieldsWithCoder:v7];
  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[NSKeyedArchiver encodedData](v7, "encodedData"));
  if (v8
    && (id v9 = (void *)objc_claimAutoreleasedReturnValue(-[NSKeyedArchiver error](v7, "error")), v9, !v9))
  {
    id v12 = (void *)objc_claimAutoreleasedReturnValue(-[SYDSyncManager coreDataStore](self, "coreDataStore"));
    id v13 = (void *)objc_claimAutoreleasedReturnValue([v4 recordID]);
    char v14 = (void *)objc_claimAutoreleasedReturnValue([v13 zoneID]);
    id v15 = (void *)objc_claimAutoreleasedReturnValue([v14 zoneName]);
    id v19 = 0LL;
    unsigned __int8 v16 = [v12 saveServerSyncAnchorSystemFieldsRecordData:v8 forStoreWithIdentifier:v15 error:&v19];
    uint64_t v11 = (os_log_s *)v19;

    if ((v16 & 1) == 0)
    {
      id v17 = SYDGetCloudKitLog();
      id v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(v17);
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
        sub_10002F414();
      }
    }
  }

  else
  {
    id v10 = SYDGetCloudKitLog();
    uint64_t v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT)) {
      sub_10002F394(v7, v11);
    }
  }
}

- (void)processPendingFetchedRecordsWithReason:(id)a3
{
  id v4 = a3;
  id v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[SYDSyncManager queue](self, "queue"));
  dispatch_assert_queue_V2(v5);

  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[SYDSyncManager pendingFetchedRecords](self, "pendingFetchedRecords"));
  if ([v6 count])
  {
  }

  else
  {
    id v7 = (void *)objc_claimAutoreleasedReturnValue(-[SYDSyncManager pendingDeletedRecordIDs](self, "pendingDeletedRecordIDs"));
    id v8 = [v7 count];

    if (!v8) {
      goto LABEL_7;
    }
  }

  id v9 = SYDGetCloudKitLog();
  id v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
    sub_10002F4F4();
  }

  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(-[SYDSyncManager pendingFetchedRecords](self, "pendingFetchedRecords"));
  id v12 = (void *)objc_claimAutoreleasedReturnValue(-[SYDSyncManager pendingDeletedRecordIDs](self, "pendingDeletedRecordIDs"));
  -[SYDSyncManager processFetchedRecords:deletedRecordIDs:](self, "processFetchedRecords:deletedRecordIDs:", v11, v12);

  id v13 = (void *)objc_claimAutoreleasedReturnValue(-[SYDSyncManager pendingFetchedRecords](self, "pendingFetchedRecords"));
  [v13 removeAllObjects];

  char v14 = (void *)objc_claimAutoreleasedReturnValue(-[SYDSyncManager pendingDeletedRecordIDs](self, "pendingDeletedRecordIDs"));
  [v14 removeAllObjects];

LABEL_7:
}

- (void)processFetchedRecords:(id)a3 deletedRecordIDs:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  id v9 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[SYDSyncManager queue](self, "queue"));
  dispatch_assert_queue_V2(v9);

  if ([v7 count] || objc_msgSend(v8, "count"))
  {
    id v10 = (void *)objc_claimAutoreleasedReturnValue(-[SYDSyncManager personaUniqueString](self, "personaUniqueString"));
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472LL;
    v13[2] = sub_100015E5C;
    v13[3] = &unk_10004D298;
    char v14 = (os_log_s *)v7;
    id v15 = self;
    SEL v17 = a2;
    id v16 = v8;
    sub_10000D00C(v10, v13);

    uint64_t v11 = v14;
  }

  else
  {
    id v12 = SYDGetCloudKitLog();
    uint64_t v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
      sub_10002F5AC();
    }
  }
}

- (void)deduplicateRecordForKeyValue:(id)a3 withNewlyFetchedRecord:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = objc_claimAutoreleasedReturnValue([v6 recordName]);
  if (v8)
  {
    id v9 = (void *)v8;
    id v10 = (void *)objc_claimAutoreleasedReturnValue([v6 recordName]);
    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([v7 recordID]);
    id v12 = (void *)objc_claimAutoreleasedReturnValue([v11 recordName]);
    unsigned __int8 v13 = [v10 isEqualToString:v12];

    if ((v13 & 1) == 0)
    {
      id v14 = SYDGetCloudKitLog();
      id v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG)) {
        sub_10002F8CC(v6, v7, v15);
      }

      id v16 = (void *)objc_claimAutoreleasedReturnValue([v6 serverSystemFieldsRecord]);
      SEL v17 = v16;
      if (v16)
      {
        id v18 = (void *)objc_claimAutoreleasedReturnValue([v16 creationDate]);
        id v19 = (void *)objc_claimAutoreleasedReturnValue([v7 creationDate]);
        id v20 = [v18 compare:v19];

        if (!v20)
        {
          id v21 = self;
          id v22 = SYDGetCloudKitLog();
          id v23 = (os_log_s *)objc_claimAutoreleasedReturnValue(v22);
          if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
          {
            *(_WORD *)buf = 0;
            _os_log_impl( (void *)&_mh_execute_header,  v23,  OS_LOG_TYPE_INFO,  "Creation dates were exactly the same when de-duplicating. Comparing record names",  buf,  2u);
          }

          uint64_t v24 = (void *)objc_claimAutoreleasedReturnValue([v17 recordID]);
          unsigned __int8 v25 = (void *)objc_claimAutoreleasedReturnValue([v24 recordName]);
          id v26 = (void *)objc_claimAutoreleasedReturnValue([v7 recordID]);
          id v27 = (void *)objc_claimAutoreleasedReturnValue([v26 recordName]);
          id v20 = [v25 compare:v27];

          self = v21;
        }

        if (v20 == (id)1)
        {
          id v38 = SYDGetCloudKitLog();
          id v39 = (os_log_s *)objc_claimAutoreleasedReturnValue(v38);
          if (os_log_type_enabled(v39, OS_LOG_TYPE_DEBUG)) {
            sub_10002F838(v7, v39);
          }

          uint64_t v30 = objc_claimAutoreleasedReturnValue([v17 recordID]);
          uint64_t v31 = objc_claimAutoreleasedReturnValue([v7 recordID]);
          id v40 = (void *)objc_claimAutoreleasedReturnValue([v7 recordID]);
          id v41 = (void *)objc_claimAutoreleasedReturnValue([v40 recordName]);
          [v6 setRecordName:v41];

          __int128 v34 = v6;
          id v35 = v7;
          goto LABEL_20;
        }

        if (v20)
        {
          if (v20 == (id)-1LL)
          {
            id v28 = SYDGetCloudKitLog();
            id v29 = (os_log_s *)objc_claimAutoreleasedReturnValue(v28);
            if (os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG)) {
              sub_10002F7A4(v17, v29);
            }

            uint64_t v30 = objc_claimAutoreleasedReturnValue([v7 recordID]);
            uint64_t v31 = objc_claimAutoreleasedReturnValue([v17 recordID]);
            id v32 = (void *)objc_claimAutoreleasedReturnValue([v17 recordID]);
            __int16 v33 = (void *)objc_claimAutoreleasedReturnValue([v32 recordName]);
            [v6 setRecordName:v33];

            __int128 v34 = v6;
            id v35 = v17;
LABEL_20:
            [v34 setServerSystemFieldsRecord:v35];
            goto LABEL_24;
          }
        }

        else
        {
          id v42 = (void *)objc_claimAutoreleasedReturnValue([v17 recordID]);
          id v43 = (void *)objc_claimAutoreleasedReturnValue([v7 recordID]);
          +[NSException raise:format:]( &OBJC_CLASS___NSException,  "raise:format:",  NSInternalInconsistencyException,  @"Trying to de-duplicate two identical records %@ and %@",  v42,  v43);
        }

        uint64_t v31 = 0LL;
      }

      else
      {
        __int128 v36 = (void *)objc_claimAutoreleasedReturnValue([v7 recordID]);
        id v37 = (void *)objc_claimAutoreleasedReturnValue([v36 recordName]);
        [v6 setRecordName:v37];

        [v6 setServerSystemFieldsRecord:v7];
        uint64_t v31 = objc_claimAutoreleasedReturnValue([v7 recordID]);
      }

      uint64_t v30 = 0LL;
LABEL_24:
      if (!(v30 | v31))
      {
LABEL_38:

        goto LABEL_39;
      }

      id v44 = SYDGetCloudKitLog();
      v45 = (os_log_s *)objc_claimAutoreleasedReturnValue(v44);
      if (os_log_type_enabled(v45, OS_LOG_TYPE_DEBUG)) {
        sub_10002F73C();
      }

      if (v31)
      {
        uint64_t v68 = v31;
        id v46 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v68, 1LL));
        if (v30)
        {
LABEL_29:
          uint64_t v67 = v30;
          id v47 = (void *)objc_claimAutoreleasedReturnValue( +[NSArray arrayWithObjects:count:]( &OBJC_CLASS___NSArray,  "arrayWithObjects:count:",  &v67,  1LL));
LABEL_32:
          uint64_t v63 = v17;
          id v48 = (void *)objc_claimAutoreleasedReturnValue([(id)v31 zoneID]);
          unsigned int v49 = (void *)objc_claimAutoreleasedReturnValue([v48 zoneName]);
          id v50 = v49;
          if (v49)
          {
            id v51 = v49;
          }

          else
          {
            BOOL v61 = self;
            id v52 = v47;
            __int128 v53 = (void *)objc_claimAutoreleasedReturnValue([(id)v30 zoneID]);
            id v51 = (id)objc_claimAutoreleasedReturnValue([v53 zoneName]);

            id v47 = v52;
            self = v61;
          }

          -[SYDSyncManager addKeyValueRecordIDsToSave:recordIDsToDelete:storeIdentifier:]( self,  "addKeyValueRecordIDsToSave:recordIDsToDelete:storeIdentifier:",  v46,  v47,  v51);
          if (v51)
          {
            v66[0] = v51;
            v65[0] = @"storeIdentifier";
            v65[1] = @"containerIdentifier";
            id v59 = (void *)objc_claimAutoreleasedReturnValue(-[SYDSyncManager container](self, "container"));
            __int128 v54 = (void *)objc_claimAutoreleasedReturnValue([v59 containerIdentifier]);
            v66[1] = v54;
            v65[2] = @"containerEnvironment";
            __int128 v60 = v47;
            __int128 v62 = v46;
            __int128 v55 = (void *)objc_claimAutoreleasedReturnValue(-[SYDSyncManager container](self, "container"));
            unsigned int v56 = (void *)objc_claimAutoreleasedReturnValue([v55 containerID]);
            __int128 v57 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithInteger:]( NSNumber,  "numberWithInteger:",  [v56 environment]));
            v66[2] = v57;
            unsigned int v58 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v66,  v65,  3LL));
            AnalyticsSendEvent(@"com.apple.kvs.deduplicate", v58);

            id v47 = v60;
            id v46 = v62;
          }

          SEL v17 = v63;
          goto LABEL_38;
        }
      }

      else
      {
        id v46 = 0LL;
        if (v30) {
          goto LABEL_29;
        }
      }

      id v47 = 0LL;
      goto LABEL_32;
    }
  }

- (void)didFetchRecordDeletion:(id)a3 recordType:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[SYDSyncManager queue](self, "queue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000171B0;
  block[3] = &unk_10004CB78;
  id v12 = v7;
  id v13 = v6;
  id v14 = self;
  id v9 = v6;
  id v10 = v7;
  dispatch_sync(v8, block);
}

- (void)handleSyncEngineStateUpdate:(id)a3
{
  id v4 = a3;
  id v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[SYDSyncManager queue](self, "queue"));
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_100017368;
  v7[3] = &unk_10004CA88;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

- (void)didDeleteRecordZoneWithID:(id)a3
{
  id v4 = a3;
  id v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[SYDSyncManager queue](self, "queue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000174C8;
  block[3] = &unk_10004CA88;
  id v8 = v4;
  id v9 = self;
  id v6 = v4;
  dispatch_sync(v5, block);
}

- (void)zoneWithIDWasPurged:(id)a3
{
  id v4 = a3;
  id v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[SYDSyncManager queue](self, "queue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100017698;
  block[3] = &unk_10004CA88;
  id v8 = v4;
  id v9 = self;
  id v6 = v4;
  dispatch_sync(v5, block);
}

- (id)syncEngine:(id)a3 nextFetchChangesOptionsForContext:(id)a4
{
  id v6 = a3;
  id v7 = (void *)objc_claimAutoreleasedReturnValue([a4 options]);
  id v8 = (id)objc_claimAutoreleasedReturnValue(-[SYDSyncManager engine](self, "engine"));

  if (v8 == v6)
  {
    id v9 = (void *)objc_claimAutoreleasedReturnValue([v7 scope]);
    id v10 = (void *)objc_claimAutoreleasedReturnValue([v9 zoneIDs]);
    id v11 = [v10 count];

    if (v11)
    {
      id v39 = v7;
      id v12 = objc_opt_new(&OBJC_CLASS___NSMutableSet);
      __int128 v46 = 0u;
      __int128 v47 = 0u;
      __int128 v48 = 0u;
      __int128 v49 = 0u;
      id v40 = v9;
      id v13 = (void *)objc_claimAutoreleasedReturnValue([v9 zoneIDs]);
      id v14 = [v13 countByEnumeratingWithState:&v46 objects:v51 count:16];
      if (v14)
      {
        id v15 = v14;
        uint64_t v16 = *(void *)v47;
        do
        {
          for (i = 0LL; i != v15; i = (char *)i + 1)
          {
            if (*(void *)v47 != v16) {
              objc_enumerationMutation(v13);
            }
            id v18 = *(void **)(*((void *)&v46 + 1) + 8LL * (void)i);
            id v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "zoneName", v39));
            unsigned int v20 = -[SYDSyncManager shouldSyncStoreWithIdentifier:](self, "shouldSyncStoreWithIdentifier:", v19);

            if (v20) {
              -[NSMutableSet addObject:](v12, "addObject:", v18);
            }
          }

          id v15 = [v13 countByEnumeratingWithState:&v46 objects:v51 count:16];
        }

        while (v15);
      }

      id v9 = v40;
      id v21 = (void *)objc_claimAutoreleasedReturnValue([v40 zoneIDs]);
      unsigned __int8 v22 = -[NSMutableSet isEqual:](v12, "isEqual:", v21);

      if ((v22 & 1) != 0)
      {
        id v7 = v39;
LABEL_32:

        goto LABEL_33;
      }

      id v36 = SYDGetCloudKitLog();
      id v37 = (os_log_s *)objc_claimAutoreleasedReturnValue(v36);
      id v7 = v39;
      if (os_log_type_enabled(v37, OS_LOG_TYPE_DEBUG)) {
        sub_10002FBA8();
      }

      id v35 = -[CKSyncEngineFetchChangesScope initWithZoneIDs:]( objc_alloc(&OBJC_CLASS___CKSyncEngineFetchChangesScope),  "initWithZoneIDs:",  v12);
    }

    else
    {
      id v23 = (void *)objc_claimAutoreleasedReturnValue([v9 excludedZoneIDs]);
      id v24 = [v23 count];

      if (v24)
      {
LABEL_33:

        goto LABEL_34;
      }

      id v41 = v9;
      id v12 = objc_opt_new(&OBJC_CLASS___NSMutableSet);
      __int128 v42 = 0u;
      __int128 v43 = 0u;
      __int128 v44 = 0u;
      __int128 v45 = 0u;
      unsigned __int8 v25 = (void *)objc_claimAutoreleasedReturnValue([v6 state]);
      id v26 = (void *)objc_claimAutoreleasedReturnValue([v25 zoneIDsWithUnfetchedServerChanges]);

      id v27 = [v26 countByEnumeratingWithState:&v42 objects:v50 count:16];
      if (v27)
      {
        id v28 = v27;
        uint64_t v29 = *(void *)v43;
        do
        {
          for (j = 0LL; j != v28; j = (char *)j + 1)
          {
            if (*(void *)v43 != v29) {
              objc_enumerationMutation(v26);
            }
            uint64_t v31 = *(void **)(*((void *)&v42 + 1) + 8LL * (void)j);
            id v32 = (void *)objc_claimAutoreleasedReturnValue([v31 zoneName]);
            if (!-[SYDSyncManager shouldSyncStoreWithIdentifier:](self, "shouldSyncStoreWithIdentifier:", v32)) {
              -[NSMutableSet addObject:](v12, "addObject:", v31);
            }
          }

          id v28 = [v26 countByEnumeratingWithState:&v42 objects:v50 count:16];
        }

        while (v28);
      }

      if (!-[NSMutableSet count](v12, "count"))
      {
        id v9 = v41;
        goto LABEL_32;
      }

      id v33 = SYDGetCloudKitLog();
      __int128 v34 = (os_log_s *)objc_claimAutoreleasedReturnValue(v33);
      if (os_log_type_enabled(v34, OS_LOG_TYPE_DEBUG)) {
        sub_10002FB44();
      }

      id v35 = -[CKSyncEngineFetchChangesScope initWithExcludedZoneIDs:]( objc_alloc(&OBJC_CLASS___CKSyncEngineFetchChangesScope),  "initWithExcludedZoneIDs:",  v12);
      id v9 = v41;
    }

    objc_msgSend(v7, "setScope:", v35, v39);

    goto LABEL_32;
  }

- (void)willBeginFetchingChanges
{
  unsigned __int8 v3 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[SYDSyncManager queue](self, "queue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100017B88;
  block[3] = &unk_10004CA38;
  void block[4] = self;
  dispatch_async(v3, block);
}

- (void)didEndFetchingChanges
{
  unsigned __int8 v3 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[SYDSyncManager queue](self, "queue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100017C54;
  block[3] = &unk_10004CA38;
  void block[4] = self;
  dispatch_async(v3, block);
}

- (id)syncEngine:(id)a3 relatedApplicationBundleIdentifiersForZoneIDs:(id)a4 recordIDs:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  id v9 = objc_alloc_init(&OBJC_CLASS___NSMutableSet);
  __int128 v33 = 0u;
  __int128 v34 = 0u;
  __int128 v35 = 0u;
  __int128 v36 = 0u;
  id v10 = v7;
  id v11 = [v10 countByEnumeratingWithState:&v33 objects:v38 count:16];
  if (v11)
  {
    id v12 = v11;
    uint64_t v13 = *(void *)v34;
    do
    {
      id v14 = 0LL;
      do
      {
        if (*(void *)v34 != v13) {
          objc_enumerationMutation(v10);
        }
        id v15 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(*((void *)&v33 + 1) + 8 * (void)v14) zoneName]);
        -[NSMutableSet addObject:](v9, "addObject:", v15);

        id v14 = (char *)v14 + 1;
      }

      while (v12 != v14);
      id v12 = [v10 countByEnumeratingWithState:&v33 objects:v38 count:16];
    }

    while (v12);
  }

  __int128 v31 = 0u;
  __int128 v32 = 0u;
  __int128 v29 = 0u;
  __int128 v30 = 0u;
  id v16 = v8;
  id v17 = [v16 countByEnumeratingWithState:&v29 objects:v37 count:16];
  if (v17)
  {
    id v18 = v17;
    uint64_t v19 = *(void *)v30;
    do
    {
      unsigned int v20 = 0LL;
      do
      {
        if (*(void *)v30 != v19) {
          objc_enumerationMutation(v16);
        }
        id v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((void *)&v29 + 1) + 8 * (void)v20), "zoneID", (void)v29));
        unsigned __int8 v22 = (void *)objc_claimAutoreleasedReturnValue([v21 zoneName]);
        -[NSMutableSet addObject:](v9, "addObject:", v22);

        unsigned int v20 = (char *)v20 + 1;
      }

      while (v18 != v20);
      id v18 = [v16 countByEnumeratingWithState:&v29 objects:v37 count:16];
    }

    while (v18);
  }

  id v23 = (void *)objc_claimAutoreleasedReturnValue(-[SYDSyncManager delegate](self, "delegate"));
  char v24 = objc_opt_respondsToSelector(v23, "applicationIdentifiersForStoreIdentifiers:");

  if ((v24 & 1) != 0)
  {
    unsigned __int8 v25 = (void *)objc_claimAutoreleasedReturnValue(-[SYDSyncManager delegate](self, "delegate"));
    id v26 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableSet allObjects](v9, "allObjects"));
    id v27 = (void *)objc_claimAutoreleasedReturnValue([v25 applicationIdentifiersForStoreIdentifiers:v26]);
  }

  else
  {
    id v27 = 0LL;
  }

  return v27;
}

- (void)deleteDataFromDisk
{
  unsigned __int8 v3 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[SYDSyncManager queue](self, "queue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100018154;
  block[3] = &unk_10004CA38;
  void block[4] = self;
  dispatch_sync(v3, block);
}

- (void)registerForFirstUnlockNotificationsIfNecessary
{
  unsigned __int8 v3 = (void *)objc_claimAutoreleasedReturnValue(-[SYDSyncManager coreDataStore](self, "coreDataStore"));
  NSFileProtectionType v4 = (NSFileProtectionType)objc_claimAutoreleasedReturnValue([v3 fileProtectionType]);

  if (v4 != NSFileProtectionNone && !self->_engine)
  {
    id v5 = SYDGetCloudKitLog();
    id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      LOWORD(buf[0]) = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_INFO,  "Will register for first unlock notifications",  (uint8_t *)buf,  2u);
    }

    objc_initWeak(buf, self);
    id v7 = (const char *)kMobileKeyBagLockStatusNotifyToken;
    p_mobileKeybagNotifyToken = &self->_mobileKeybagNotifyToken;
    dispatch_queue_global_t global_queue = dispatch_get_global_queue(0LL, 0LL);
    id v10 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(global_queue);
    handler[0] = _NSConcreteStackBlock;
    handler[1] = 3221225472LL;
    handler[2] = sub_100018314;
    handler[3] = &unk_10004CF38;
    objc_copyWeak(&v12, buf);
    notify_register_dispatch(v7, p_mobileKeybagNotifyToken, v10, handler);

    objc_destroyWeak(&v12);
    objc_destroyWeak(buf);
  }

- (CKContainer)container
{
  return self->_container;
}

- (void)setContainer:(id)a3
{
}

- (SYDCoreDataStore)coreDataStore
{
  return self->_coreDataStore;
}

- (void)setCoreDataStore:(id)a3
{
}

- (int64_t)storeType
{
  return self->_storeType;
}

- (void)setStoreType:(int64_t)a3
{
  self->_storeType = a3;
}

- (SYDTestConfiguration)testConfiguration
{
  return self->_testConfiguration;
}

- (NSString)personaUniqueString
{
  return self->_personaUniqueString;
}

- (void)setPersonaUniqueString:(id)a3
{
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
}

- (OS_dispatch_queue)callbackQueue
{
  return self->_callbackQueue;
}

- (void)setCallbackQueue:(id)a3
{
}

- (NSMutableSet)storeIdentifiersWithChangedValuesDuringFetchChanges
{
  return self->_storeIdentifiersWithChangedValuesDuringFetchChanges;
}

- (void)setStoreIdentifiersWithChangedValuesDuringFetchChanges:(id)a3
{
}

- (NSMutableArray)pendingFetchedRecords
{
  return self->_pendingFetchedRecords;
}

- (void)setPendingFetchedRecords:(id)a3
{
}

- (NSMutableArray)pendingDeletedRecordIDs
{
  return self->_pendingDeletedRecordIDs;
}

- (void)setPendingDeletedRecordIDs:(id)a3
{
}

- (int)mobileKeybagNotifyToken
{
  return self->_mobileKeybagNotifyToken;
}

- (void)setMobileKeybagNotifyToken:(int)a3
{
  self->_mobileKeybagNotifyToken = a3;
}

- (BOOL)alwaysSaveRecordZones
{
  return self->_alwaysSaveRecordZones;
}

- (void)setAlwaysSaveRecordZones:(BOOL)a3
{
  self->_alwaysSaveRecordZones = a3;
}

- (unint64_t)maxPendingFetchedRecords
{
  return self->_maxPendingFetchedRecords;
}

- (void)setMaxPendingFetchedRecords:(unint64_t)a3
{
  self->_maxPendingFetchedRecords = a3;
}

- (SYDSyncManagerDelegate)delegate
{
  return (SYDSyncManagerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
}

@end