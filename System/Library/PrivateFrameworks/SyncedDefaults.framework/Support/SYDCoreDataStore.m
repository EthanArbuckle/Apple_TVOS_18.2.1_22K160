@interface SYDCoreDataStore
+ (BOOL)isCorruptionError:(id)a3;
+ (BOOL)isInvalidTokenError:(id)a3;
+ (id)managedObjectModel;
- (BOOL)_queue_handleCorruptionIfNecessaryFromError:(id)a3 inPersistentStoreCoordinator:(id)a4;
- (BOOL)_saveKeyValue:(id)a3 inStoreWithIdentifier:(id)a4 excludeFromChangeTracking:(BOOL)a5 enforceQuota:(BOOL)a6 forceCreateNewRow:(BOOL)a7 error:(id *)a8;
- (BOOL)_saveKeyValues:(id)a3 excludeFromChangeTracking:(BOOL)a4 enforceQuota:(BOOL)a5 forceCreateNewRow:(BOOL)a6 error:(id *)a7;
- (BOOL)clearServerSystemFieldsRecordsForAllKeyValuesInStoreWithIdentifier:(id)a3 error:(id *)a4;
- (BOOL)clearServerSystemFieldsRecordsForAllStoresWithError:(id *)a3;
- (BOOL)deleteDataForAllStoresWithError:(id *)a3;
- (BOOL)deleteDataForStoreWithIdentifier:(id)a3 error:(id *)a4;
- (BOOL)deleteDataForStoresMatchingPredicate:(id)a3 context:(id)a4 error:(id *)a5;
- (BOOL)didMigrateFromPlistsWithError:(id *)a3;
- (BOOL)removeKeyValueForKey:(id)a3 inStoreWithIdentifier:(id)a4 excludeFromChangeTracking:(BOOL)a5 error:(id *)a6;
- (BOOL)removeKeyValueForRecordName:(id)a3 inStoreWithIdentifier:(id)a4 error:(id *)a5;
- (BOOL)saveContext:(id)a3 reason:(id)a4 includingTransactionContext:(BOOL)a5 error:(id *)a6;
- (BOOL)saveDeprecatedSyncEngineMetadata:(id)a3 error:(id *)a4;
- (BOOL)saveKeyValue:(id)a3 inStoreWithIdentifier:(id)a4 error:(id *)a5;
- (BOOL)saveKeyValue:(id)a3 inStoreWithIdentifier:(id)a4 excludeFromChangeTracking:(BOOL)a5 enforceQuota:(BOOL)a6 error:(id *)a7;
- (BOOL)saveKeyValues:(id)a3 excludeFromChangeTracking:(BOOL)a4 enforceQuota:(BOOL)a5 error:(id *)a6;
- (BOOL)saveServerSyncAnchorSystemFieldsRecordData:(id)a3 forStoreWithIdentifier:(id)a4 error:(id *)a5;
- (BOOL)saveSyncEngineStateSerialization:(id)a3 error:(id *)a4;
- (BOOL)saveTransaction:(id *)a3;
- (BOOL)setACAccountIdentifier:(id)a3 error:(id *)a4;
- (BOOL)setDidMigrateFromPlists:(BOOL)a3 error:(id *)a4;
- (BOOL)setFailedMigrationCount:(signed __int16)a3 error:(id *)a4;
- (BOOL)shouldLogValues;
- (NSCache)contexts;
- (NSLock)contextsLock;
- (NSManagedObjectContext)transactionContext;
- (NSPersistentContainer)_persistentContainer;
- (NSString)fileProtectionType;
- (NSURL)URL;
- (OS_dispatch_queue)persistentContainerQueue;
- (SYDCoreDataStore)initWithURL:(id)a3;
- (SYDCoreDataStore)initWithURL:(id)a3 fileProtectionType:(id)a4;
- (SYDCoreDataStore)initWithURL:(id)a3 fileProtectionType:(id)a4 persistentContainer:(id)a5 isTransactional:(BOOL)a6;
- (id)_contextForStoreIdentifier:(id)a3 persistentContainer:(id)a4;
- (id)acAccountIdentifierWithError:(id *)a3;
- (id)allRecordNamesInStoreWithIdentifier:(id)a3 error:(id *)a4;
- (id)allStoreIdentifiersWithError:(id *)a3;
- (id)changedKeysForStoreIdentifier:(id)a3 sinceChangeToken:(id)a4 error:(id *)a5;
- (id)contextForStoreIdentifier:(id)a3 error:(id *)a4;
- (id)currentChangeTokenForStoreIdentifier:(id)a3 error:(id *)a4;
- (id)deprecatedSyncEngineMetadataWithError:(id *)a3;
- (id)description;
- (id)dictionaryRepresentationForStoreWithIdentifier:(id)a3 error:(id *)a4;
- (id)keyValueForKey:(id)a3 inStoreWithIdentifier:(id)a4 createIfNecessary:(BOOL)a5 error:(id *)a6;
- (id)keyValueForRecordName:(id)a3 inStoreWithIdentifier:(id)a4 error:(id *)a5;
- (id)keyValueFromManagedKeyValue:(id)a3 inStoreWithIdentifier:(id)a4;
- (id)keyValuesForKeyIDs:(id)a3 createIfNecessary:(BOOL)a4 error:(id *)a5;
- (id)managedDatabaseCreateIfNecessary:(BOOL)a3 inContext:(id)a4 error:(id *)a5;
- (id)managedKeyValueWithRecordName:(id)a3 inStoreWithIdentifier:(id)a4 inContext:(id)a5 error:(id *)a6;
- (id)managedKeyValuesForKeyIDs:(id)a3 inContext:(id)a4 error:(id *)a5;
- (id)managedKeyValuesMatchingPredicate:(id)a3 inContext:(id)a4 error:(id *)a5;
- (id)managedStoreWithIdentifier:(id)a3 createIfNecessary:(BOOL)a4 inContext:(id)a5 error:(id *)a6;
- (id)persistentContainerWithError:(id *)a3;
- (id)serverSyncAnchorSystemFieldsRecordDataForStoreWithIdentifier:(id)a3 error:(id *)a4;
- (id)syncEngineStateSerializationWithError:(id *)a3;
- (id)transactionalStoreWithError:(id *)a3;
- (signed)failedMigrationCountWithError:(id *)a3;
- (unint64_t)fileSizeBytes;
- (unint64_t)numberOfKeyValuesInStoreWithIdentifier:(id)a3 error:(id *)a4;
- (void)_queue_destroyPersistentStoreInPersistentStoreCoordinator:(id)a3;
- (void)clearContexts;
- (void)dealloc;
- (void)destroyPersistentStore;
- (void)handleCorruptionIfNecessaryFromError:(id)a3 inPersistentStoreCoordinator:(id)a4;
- (void)setContexts:(id)a3;
- (void)setContextsLock:(id)a3;
- (void)setFileProtectionType:(id)a3;
- (void)setPersistentContainerQueue:(id)a3;
- (void)setShouldLogValues:(BOOL)a3;
- (void)setTransactionContext:(id)a3;
- (void)setURL:(id)a3;
- (void)set_persistentContainer:(id)a3;
- (void)transactionStoreDidSave:(id)a3;
@end

@implementation SYDCoreDataStore

- (SYDCoreDataStore)initWithURL:(id)a3
{
  return -[SYDCoreDataStore initWithURL:fileProtectionType:]( self,  "initWithURL:fileProtectionType:",  a3,  NSFileProtectionCompleteUntilFirstUserAuthentication);
}

- (SYDCoreDataStore)initWithURL:(id)a3 fileProtectionType:(id)a4
{
  return -[SYDCoreDataStore initWithURL:fileProtectionType:persistentContainer:isTransactional:]( self,  "initWithURL:fileProtectionType:persistentContainer:isTransactional:",  a3,  a4,  0LL,  0LL);
}

- (SYDCoreDataStore)initWithURL:(id)a3 fileProtectionType:(id)a4 persistentContainer:(id)a5 isTransactional:(BOOL)a6
{
  BOOL v6 = a6;
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  if (!v12)
  {
    v30 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"));
    v31 = (objc_class *)objc_opt_class(self);
    v32 = NSStringFromClass(v31);
    v34 = (void *)objc_claimAutoreleasedReturnValue(v32);
    [v30 handleFailureInMethod:a2, self, @"SYDCoreDataStore.m", 72, @"Cannot initialize %@ with a nil URL", v34 object file lineNumber description];
  }

  v35.receiver = self;
  v35.super_class = (Class)&OBJC_CLASS___SYDCoreDataStore;
  v15 = -[SYDCoreDataStore init](&v35, "init");
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_URL, a3);
    objc_storeStrong((id *)&v16->_fileProtectionType, a4);
    dispatch_queue_attr_t v17 = dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v18 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v17);
    dispatch_queue_t v19 = dispatch_queue_create("com.apple.kvs.coredata.persistent-container", v18);
    persistentContainerQueue = v16->_persistentContainerQueue;
    v16->_persistentContainerQueue = (OS_dispatch_queue *)v19;

    objc_storeStrong((id *)&v16->__persistentContainer, a5);
    v21 = objc_alloc_init(&OBJC_CLASS___NSCache);
    contexts = v16->_contexts;
    v16->_contexts = v21;

    v23 = objc_alloc_init(&OBJC_CLASS___NSLock);
    contextsLock = v16->_contextsLock;
    v16->_contextsLock = v23;

    if (v6)
    {
      if (!v16->__persistentContainer)
      {
        v33 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"));
        [v33 handleFailureInMethod:a2 object:v16 file:@"SYDCoreDataStore.m" lineNumber:84 description:@"Cannot create a transactional context without a persistent container"];
      }

      uint64_t v25 = objc_claimAutoreleasedReturnValue( -[SYDCoreDataStore _contextForStoreIdentifier:persistentContainer:]( v16,  "_contextForStoreIdentifier:persistentContainer:",  0LL));
      transactionContext = v16->_transactionContext;
      v16->_transactionContext = (NSManagedObjectContext *)v25;
    }

    else
    {
      transactionContext = (NSManagedObjectContext *)objc_claimAutoreleasedReturnValue( +[NSNotificationCenter defaultCenter]( &OBJC_CLASS___NSNotificationCenter,  "defaultCenter"));
      -[NSManagedObjectContext addObserver:selector:name:object:]( transactionContext,  "addObserver:selector:name:object:",  v16,  "transactionStoreDidSave:",  @"TransactionStoreDidSave",  0LL);
    }
  }

  id v27 = SYDGetCoreDataLog();
  v28 = (os_log_s *)objc_claimAutoreleasedReturnValue(v27);
  if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG)) {
    sub_100032874();
  }

  return v16;
}

- (void)dealloc
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___SYDCoreDataStore;
  -[SYDCoreDataStore dealloc](&v4, "dealloc");
}

- (id)description
{
  v3 = (objc_class *)objc_opt_class(self);
  objc_super v4 = NSStringFromClass(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  BOOL v6 = (void *)objc_claimAutoreleasedReturnValue(-[SYDCoreDataStore URL](self, "URL"));
  v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"<%@: %p; url=%@>",
                   v5,
                   self,
                   v6));

  return v7;
}

- (id)keyValueForKey:(id)a3 inStoreWithIdentifier:(id)a4 createIfNecessary:(BOOL)a5 error:(id *)a6
{
  BOOL v7 = a5;
  id v10 = a3;
  id v11 = a4;
  id v12 = SYDGetCoreDataLog();
  id v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 141558787;
    uint64_t v29 = 1752392040LL;
    __int16 v30 = 2113;
    id v31 = v10;
    __int16 v32 = 2112;
    id v33 = v11;
    __int16 v34 = 1024;
    BOOL v35 = v7;
    _os_log_debug_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_DEBUG,  "Fetching keyValue for key <(%{private, mask.hash}@)> in store <(%@)> create=%d",  buf,  0x26u);
  }

  if (v10)
  {
    if ([v11 length])
    {
      id v14 = -[SYDKeyID initWithKey:storeIdentifier:]( objc_alloc(&OBJC_CLASS____TtC13syncdefaultsd8SYDKeyID),  "initWithKey:storeIdentifier:",  v10,  v11);
      uint64_t v25 = v14;
      v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v25, 1LL));
      v16 = (void *)objc_claimAutoreleasedReturnValue( -[SYDCoreDataStore keyValuesForKeyIDs:createIfNecessary:error:]( self,  "keyValuesForKeyIDs:createIfNecessary:error:",  v15,  v7,  a6));

      if ((unint64_t)[v16 count] >= 2)
      {
        id v17 = SYDGetCoreDataLog();
        v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(v17);
        if (os_log_type_enabled(v18, OS_LOG_TYPE_FAULT)) {
          sub_100032900();
        }
      }

      dispatch_queue_t v19 = (void *)objc_claimAutoreleasedReturnValue([v16 allValues]);
      v20 = (void *)objc_claimAutoreleasedReturnValue([v19 firstObject]);
    }

    else
    {
      id v22 = SYDGetCoreDataLog();
      v23 = (os_log_s *)objc_claimAutoreleasedReturnValue(v22);
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR)) {
        sub_1000328D4();
      }

      if (!a6)
      {
        v20 = 0LL;
        goto LABEL_18;
      }

      NSErrorUserInfoKey v26 = NSLocalizedDescriptionKey;
      id v27 = @"Trying to access a key value with an empty store identifier";
      id v14 = (_TtC13syncdefaultsd8SYDKeyID *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v27,  &v26,  1LL));
      v20 = 0LL;
      *a6 = (id)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"SyncedDefaults",  2222LL,  v14));
    }
  }

  else
  {
    id v21 = SYDGetCoreDataLog();
    id v14 = (_TtC13syncdefaultsd8SYDKeyID *)objc_claimAutoreleasedReturnValue(v21);
    if (os_log_type_enabled((os_log_t)v14, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)v14,  OS_LOG_TYPE_INFO,  "Trying to access key value for nil key",  buf,  2u);
    }

    v20 = 0LL;
  }

LABEL_18:
  return v20;
}

- (id)keyValuesForKeyIDs:(id)a3 createIfNecessary:(BOOL)a4 error:(id *)a5
{
  dispatch_queue_t v19 = self;
  id v6 = a3;
  uint64_t v33 = 0LL;
  __int16 v34 = &v33;
  uint64_t v35 = 0x3032000000LL;
  v36 = sub_100021258;
  v37 = sub_100021268;
  v38 = objc_opt_new(&OBJC_CLASS___NSMutableDictionary);
  uint64_t v27 = 0LL;
  v28 = &v27;
  uint64_t v29 = 0x3032000000LL;
  __int16 v30 = sub_100021258;
  id v31 = sub_100021268;
  id v32 = 0LL;
  BOOL v7 = objc_opt_new(&OBJC_CLASS___NSMutableDictionary);
  __int128 v25 = 0u;
  __int128 v26 = 0u;
  __int128 v23 = 0u;
  __int128 v24 = 0u;
  id v8 = v6;
  id v9 = [v8 countByEnumeratingWithState:&v23 objects:v39 count:16];
  if (v9)
  {
    uint64_t v10 = *(void *)v24;
    do
    {
      for (i = 0LL; i != v9; i = (char *)i + 1)
      {
        if (*(void *)v24 != v10) {
          objc_enumerationMutation(v8);
        }
        id v12 = *(void **)(*((void *)&v23 + 1) + 8LL * (void)i);
        id v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "storeIdentifier", v19));
        id v14 = (NSMutableSet *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](v7, "objectForKeyedSubscript:", v13));

        if (!v14)
        {
          id v14 = objc_opt_new(&OBJC_CLASS___NSMutableSet);
          v15 = (void *)objc_claimAutoreleasedReturnValue([v12 storeIdentifier]);
          -[NSMutableDictionary setObject:forKeyedSubscript:](v7, "setObject:forKeyedSubscript:", v14, v15);
        }

        -[NSMutableSet addObject:](v14, "addObject:", v12);
      }

      id v9 = [v8 countByEnumeratingWithState:&v23 objects:v39 count:16];
    }

    while (v9);
  }

  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472LL;
  v21[2] = sub_100021270;
  v21[3] = &unk_10004D5C0;
  v21[4] = v19;
  v21[5] = &v27;
  BOOL v22 = a4;
  v21[6] = &v33;
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](v7, "enumerateKeysAndObjectsUsingBlock:", v21);
  if (v28[5])
  {
    v16 = (void *)v34[5];
    v34[5] = 0LL;
  }

  if (a5) {
    *a5 = (id) v28[5];
  }
  id v17 = objc_msgSend((id)v34[5], "copy", v19);

  _Block_object_dispose(&v27, 8);
  _Block_object_dispose(&v33, 8);

  return v17;
}

- (id)keyValueForRecordName:(id)a3 inStoreWithIdentifier:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = SYDGetCoreDataLog();
  id v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
    sub_1000329C0();
  }

  uint64_t v31 = 0LL;
  id v32 = &v31;
  uint64_t v33 = 0x3032000000LL;
  __int16 v34 = sub_100021258;
  uint64_t v35 = sub_100021268;
  id v36 = 0LL;
  uint64_t v25 = 0LL;
  __int128 v26 = &v25;
  uint64_t v27 = 0x3032000000LL;
  v28 = sub_100021258;
  uint64_t v29 = sub_100021268;
  id v30 = 0LL;
  id obj = 0LL;
  id v12 = (void *)objc_claimAutoreleasedReturnValue( -[SYDCoreDataStore contextForStoreIdentifier:error:]( self,  "contextForStoreIdentifier:error:",  v9,  &obj));
  objc_storeStrong(&v30, obj);
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472LL;
  v18[2] = sub_10002194C;
  v18[3] = &unk_10004D5E8;
  v18[4] = self;
  id v13 = v8;
  id v19 = v13;
  id v14 = v9;
  id v20 = v14;
  id v15 = v12;
  id v21 = v15;
  BOOL v22 = &v25;
  __int128 v23 = &v31;
  [v15 performBlockAndWait:v18];
  if (a5) {
    *a5 = (id) v26[5];
  }
  id v16 = (id)v32[5];

  _Block_object_dispose(&v25, 8);
  _Block_object_dispose(&v31, 8);

  return v16;
}

- (id)keyValueFromManagedKeyValue:(id)a3 inStoreWithIdentifier:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  if (!v7)
  {
    uint64_t v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"));
    [v25 handleFailureInMethod:a2, self, @"SYDCoreDataStore.m", 221, @"Trying load a nil key in store <(%@)>", v8 object file lineNumber description];
  }

  if (![v8 length])
  {
    __int128 v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"));
    [v26 handleFailureInMethod:a2 object:self file:@"SYDCoreDataStore.m" lineNumber:222 description:@"Trying to load without a store identifier"];
  }

  id v9 = (void *)objc_claimAutoreleasedReturnValue([v7 store]);
  id v10 = (void *)objc_claimAutoreleasedReturnValue([v9 identifier]);
  id v11 = [v10 length];

  if (v11)
  {
    id v12 = objc_alloc(&OBJC_CLASS___SYDKeyValue);
    id v13 = (void *)objc_claimAutoreleasedReturnValue([v7 key]);
    id v14 = (void *)objc_claimAutoreleasedReturnValue([v7 store]);
    id v15 = (void *)objc_claimAutoreleasedReturnValue([v14 identifier]);
    id v16 = -[SYDKeyValue initWithKey:storeIdentifier:](v12, "initWithKey:storeIdentifier:", v13, v15);
  }

  else
  {
    id v17 = SYDGetCoreDataLog();
    v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(v17);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG)) {
      sub_100032AE0(v7, (uint64_t)v8, v18);
    }

    id v19 = objc_alloc(&OBJC_CLASS___SYDKeyValue);
    id v13 = (void *)objc_claimAutoreleasedReturnValue([v7 key]);
    id v16 = -[SYDKeyValue initWithKey:storeIdentifier:](v19, "initWithKey:storeIdentifier:", v13, v8);
  }

  id v20 = (void *)objc_claimAutoreleasedReturnValue([v7 value]);
  id v21 = (void *)objc_claimAutoreleasedReturnValue([v7 valueModificationDate]);
  -[SYDKeyValue setValue:withModificationDate:](v16, "setValue:withModificationDate:", v20, v21);

  BOOL v22 = (void *)objc_claimAutoreleasedReturnValue([v7 recordName]);
  -[SYDKeyValue setRecordName:](v16, "setRecordName:", v22);

  __int128 v23 = (void *)objc_claimAutoreleasedReturnValue([v7 serverSystemFieldsRecordData]);
  -[SYDKeyValue setServerSystemFieldsRecordData:](v16, "setServerSystemFieldsRecordData:", v23);

  return v16;
}

- (BOOL)saveKeyValue:(id)a3 inStoreWithIdentifier:(id)a4 excludeFromChangeTracking:(BOOL)a5 enforceQuota:(BOOL)a6 error:(id *)a7
{
  return -[SYDCoreDataStore _saveKeyValue:inStoreWithIdentifier:excludeFromChangeTracking:enforceQuota:forceCreateNewRow:error:]( self,  "_saveKeyValue:inStoreWithIdentifier:excludeFromChangeTracking:enforceQuota:forceCreateNewRow:error:",  a3,  a4,  a5,  a6,  0LL,  a7);
}

- (BOOL)_saveKeyValue:(id)a3 inStoreWithIdentifier:(id)a4 excludeFromChangeTracking:(BOOL)a5 enforceQuota:(BOOL)a6 forceCreateNewRow:(BOOL)a7 error:(id *)a8
{
  BOOL v9 = a7;
  BOOL v10 = a6;
  BOOL v11 = a5;
  id v15 = a3;
  id v16 = a4;
  if (!v15)
  {
    id v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"));
    id v21 = (objc_class *)objc_opt_class(&OBJC_CLASS___SYDKeyValue);
    BOOL v22 = NSStringFromClass(v21);
    __int128 v23 = (void *)objc_claimAutoreleasedReturnValue(v22);
    [v20 handleFailureInMethod:a2, self, @"SYDCoreDataStore.m", 244, @"Trying to save a nil %@ in %@", v23, v16 object file lineNumber description];
  }

  if (![v16 length])
  {
    __int128 v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"));
    [v24 handleFailureInMethod:a2 object:self file:@"SYDCoreDataStore.m" lineNumber:245 description:@"Trying to save without a store identifier"];
  }

  id v25 = v15;
  id v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v25, 1LL));
  BOOL v18 = -[SYDCoreDataStore _saveKeyValues:excludeFromChangeTracking:enforceQuota:forceCreateNewRow:error:]( self,  "_saveKeyValues:excludeFromChangeTracking:enforceQuota:forceCreateNewRow:error:",  v17,  v11,  v10,  v9,  a8);

  return v18;
}

- (BOOL)saveKeyValues:(id)a3 excludeFromChangeTracking:(BOOL)a4 enforceQuota:(BOOL)a5 error:(id *)a6
{
  return -[SYDCoreDataStore _saveKeyValues:excludeFromChangeTracking:enforceQuota:forceCreateNewRow:error:]( self,  "_saveKeyValues:excludeFromChangeTracking:enforceQuota:forceCreateNewRow:error:",  a3,  a4,  a5,  0LL,  a6);
}

- (BOOL)_saveKeyValues:(id)a3 excludeFromChangeTracking:(BOOL)a4 enforceQuota:(BOOL)a5 forceCreateNewRow:(BOOL)a6 error:(id *)a7
{
  id v20 = self;
  id v8 = a3;
  uint64_t v32 = 0LL;
  uint64_t v33 = &v32;
  uint64_t v34 = 0x3032000000LL;
  uint64_t v35 = sub_100021258;
  id v36 = sub_100021268;
  id v37 = 0LL;
  BOOL v9 = objc_opt_new(&OBJC_CLASS___NSMutableDictionary);
  __int128 v30 = 0u;
  __int128 v31 = 0u;
  __int128 v28 = 0u;
  __int128 v29 = 0u;
  id v10 = v8;
  id v11 = [v10 countByEnumeratingWithState:&v28 objects:v38 count:16];
  if (v11)
  {
    uint64_t v12 = *(void *)v29;
    do
    {
      for (i = 0LL; i != v11; i = (char *)i + 1)
      {
        if (*(void *)v29 != v12) {
          objc_enumerationMutation(v10);
        }
        id v14 = *(void **)(*((void *)&v28 + 1) + 8LL * (void)i);
        id v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "storeIdentifier", v20));
        id v16 = (NSMutableArray *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](v9, "objectForKeyedSubscript:", v15));

        if (!v16)
        {
          id v16 = objc_opt_new(&OBJC_CLASS___NSMutableArray);
          id v17 = (void *)objc_claimAutoreleasedReturnValue([v14 storeIdentifier]);
          -[NSMutableDictionary setObject:forKeyedSubscript:](v9, "setObject:forKeyedSubscript:", v16, v17);
        }

        -[NSMutableArray addObject:](v16, "addObject:", v14);
      }

      id v11 = [v10 countByEnumeratingWithState:&v28 objects:v38 count:16];
    }

    while (v11);
  }

  v24[0] = _NSConcreteStackBlock;
  v24[1] = 3221225472LL;
  v24[2] = sub_1000220CC;
  v24[3] = &unk_10004D638;
  v24[4] = v20;
  v24[5] = &v32;
  BOOL v25 = a4;
  BOOL v26 = a6;
  BOOL v27 = a5;
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](v9, "enumerateKeysAndObjectsUsingBlock:", v24);
  if (a7) {
    *a7 = (id) v33[5];
  }
  BOOL v18 = v33[5] == 0;

  _Block_object_dispose(&v32, 8);
  return v18;
}

- (BOOL)saveKeyValue:(id)a3 inStoreWithIdentifier:(id)a4 error:(id *)a5
{
  return -[SYDCoreDataStore saveKeyValue:inStoreWithIdentifier:excludeFromChangeTracking:enforceQuota:error:]( self,  "saveKeyValue:inStoreWithIdentifier:excludeFromChangeTracking:enforceQuota:error:",  a3,  a4,  0LL,  0LL,  a5);
}

- (BOOL)removeKeyValueForKey:(id)a3 inStoreWithIdentifier:(id)a4 excludeFromChangeTracking:(BOOL)a5 error:(id *)a6
{
  BOOL v7 = a5;
  id v11 = a3;
  id v12 = a4;
  if (!v11)
  {
    BOOL v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"));
    [v22 handleFailureInMethod:a2 object:self file:@"SYDCoreDataStore.m" lineNumber:362 description:@"Trying to remove a value for a nil key"];
  }

  if (![v12 length])
  {
    __int128 v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"));
    [v23 handleFailureInMethod:a2 object:self file:@"SYDCoreDataStore.m" lineNumber:363 description:@"Trying to remove without a store identifier"];
  }

  id v13 = SYDGetCoreDataLog();
  id v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG)) {
    sub_100032C38();
  }

  uint64_t v31 = 0LL;
  uint64_t v32 = &v31;
  uint64_t v33 = 0x3032000000LL;
  uint64_t v34 = sub_100021258;
  uint64_t v35 = sub_100021268;
  id v36 = 0LL;
  id obj = 0LL;
  id v15 = (void *)objc_claimAutoreleasedReturnValue( -[SYDCoreDataStore contextForStoreIdentifier:error:]( self,  "contextForStoreIdentifier:error:",  v12,  &obj));
  objc_storeStrong(&v36, obj);
  if (v7) {
    id v16 = @"no-change-tracking";
  }
  else {
    id v16 = 0LL;
  }
  [v15 setTransactionAuthor:v16];
  v24[0] = _NSConcreteStackBlock;
  v24[1] = 3221225472LL;
  v24[2] = sub_100022DA0;
  v24[3] = &unk_10004D660;
  id v17 = v11;
  id v25 = v17;
  id v18 = v12;
  id v26 = v18;
  BOOL v27 = self;
  id v19 = v15;
  id v28 = v19;
  __int128 v29 = &v31;
  [v19 performBlockAndWait:v24];
  if (a6) {
    *a6 = (id) v32[5];
  }
  BOOL v20 = v32[5] == 0;

  _Block_object_dispose(&v31, 8);
  return v20;
}

- (BOOL)removeKeyValueForRecordName:(id)a3 inStoreWithIdentifier:(id)a4 error:(id *)a5
{
  id v9 = a3;
  id v10 = a4;
  if (!v9)
  {
    id v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"));
    [v19 handleFailureInMethod:a2 object:self file:@"SYDCoreDataStore.m" lineNumber:394 description:@"Trying to remove a value for a nil record name"];
  }

  if (![v10 length])
  {
    BOOL v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"));
    [v20 handleFailureInMethod:a2 object:self file:@"SYDCoreDataStore.m" lineNumber:395 description:@"Trying to remove without a store identifier"];
  }

  id v11 = SYDGetCoreDataLog();
  id v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
    sub_100032DBC();
  }

  uint64_t v27 = 0LL;
  id v28 = &v27;
  uint64_t v29 = 0x3032000000LL;
  __int128 v30 = sub_100021258;
  uint64_t v31 = sub_100021268;
  id v32 = 0LL;
  id obj = 0LL;
  id v13 = (void *)objc_claimAutoreleasedReturnValue( -[SYDCoreDataStore contextForStoreIdentifier:error:]( self,  "contextForStoreIdentifier:error:",  v10,  &obj));
  objc_storeStrong(&v32, obj);
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472LL;
  v21[2] = sub_1000231B0;
  v21[3] = &unk_10004D660;
  v21[4] = self;
  id v14 = v9;
  id v22 = v14;
  id v15 = v10;
  id v23 = v15;
  id v16 = v13;
  id v24 = v16;
  id v25 = &v27;
  [v16 performBlockAndWait:v21];
  if (a5) {
    *a5 = (id) v28[5];
  }
  BOOL v17 = v28[5] == 0;

  _Block_object_dispose(&v27, 8);
  return v17;
}

- (id)serverSyncAnchorSystemFieldsRecordDataForStoreWithIdentifier:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v7 = SYDGetCoreDataLog();
  id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
    sub_100032EDC();
  }

  uint64_t v26 = 0LL;
  uint64_t v27 = &v26;
  uint64_t v28 = 0x3032000000LL;
  uint64_t v29 = sub_100021258;
  __int128 v30 = sub_100021268;
  id v31 = 0LL;
  uint64_t v20 = 0LL;
  id v21 = &v20;
  uint64_t v22 = 0x3032000000LL;
  id v23 = sub_100021258;
  id v24 = sub_100021268;
  id v25 = 0LL;
  id obj = 0LL;
  id v9 = (void *)objc_claimAutoreleasedReturnValue( -[SYDCoreDataStore contextForStoreIdentifier:error:]( self,  "contextForStoreIdentifier:error:",  v6,  &obj));
  objc_storeStrong(&v25, obj);
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472LL;
  v14[2] = sub_100023484;
  v14[3] = &unk_10004CF78;
  v14[4] = self;
  id v10 = v6;
  id v15 = v10;
  id v11 = v9;
  id v16 = v11;
  BOOL v17 = &v20;
  id v18 = &v26;
  [v11 performBlockAndWait:v14];
  if (a4) {
    *a4 = (id) v21[5];
  }
  id v12 = (id)v27[5];

  _Block_object_dispose(&v20, 8);
  _Block_object_dispose(&v26, 8);

  return v12;
}

- (BOOL)saveServerSyncAnchorSystemFieldsRecordData:(id)a3 forStoreWithIdentifier:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = SYDGetCoreDataLog();
  id v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
  BOOL v12 = os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG);
  if (v8)
  {
    if (v12) {
      sub_100033028();
    }
  }

  else if (v12)
  {
    sub_100032FC8();
  }

  uint64_t v25 = 0LL;
  uint64_t v26 = &v25;
  uint64_t v27 = 0x3032000000LL;
  uint64_t v28 = sub_100021258;
  uint64_t v29 = sub_100021268;
  id v30 = 0LL;
  id obj = 0LL;
  id v13 = (void *)objc_claimAutoreleasedReturnValue( -[SYDCoreDataStore contextForStoreIdentifier:error:]( self,  "contextForStoreIdentifier:error:",  v9,  &obj));
  objc_storeStrong(&v30, obj);
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472LL;
  v19[2] = sub_100023734;
  v19[3] = &unk_10004D688;
  v19[4] = self;
  id v14 = v9;
  id v20 = v14;
  id v15 = v13;
  id v21 = v15;
  id v23 = &v25;
  id v16 = v8;
  id v22 = v16;
  [v15 performBlockAndWait:v19];
  if (a5) {
    *a5 = (id) v26[5];
  }
  BOOL v17 = v26[5] == 0;

  _Block_object_dispose(&v25, 8);
  return v17;
}

- (BOOL)deleteDataForStoreWithIdentifier:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v13 = 0LL;
  id v7 = (void *)objc_claimAutoreleasedReturnValue( -[SYDCoreDataStore contextForStoreIdentifier:error:]( self,  "contextForStoreIdentifier:error:",  v6,  &v13));
  id v8 = v13;
  if (v7)
  {
    id v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSPredicate predicateWithFormat:]( &OBJC_CLASS___NSPredicate,  "predicateWithFormat:",  @"identifier == %@",  v6));
    id v12 = v8;
    -[SYDCoreDataStore deleteDataForStoresMatchingPredicate:context:error:]( self,  "deleteDataForStoresMatchingPredicate:context:error:",  v9,  v7,  &v12);
    id v10 = v12;

    id v8 = v10;
  }

  if (a4) {
    *a4 = v8;
  }

  return v8 == 0LL;
}

- (BOOL)deleteDataForAllStoresWithError:(id *)a3
{
  id v11 = 0LL;
  v5 = (void *)objc_claimAutoreleasedReturnValue( -[SYDCoreDataStore contextForStoreIdentifier:error:]( self,  "contextForStoreIdentifier:error:",  0LL,  &v11));
  id v6 = v11;
  id v7 = v6;
  if (v5)
  {
    id v10 = v6;
    -[SYDCoreDataStore deleteDataForStoresMatchingPredicate:context:error:]( self,  "deleteDataForStoresMatchingPredicate:context:error:",  0LL,  v5,  &v10);
    id v8 = v10;

    id v7 = v8;
  }

  if (a3) {
    *a3 = v7;
  }

  return v7 == 0LL;
}

- (BOOL)deleteDataForStoresMatchingPredicate:(id)a3 context:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = SYDGetCoreDataLog();
  id v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
    sub_1000330B4();
  }

  uint64_t v20 = 0LL;
  id v21 = &v20;
  uint64_t v22 = 0x3032000000LL;
  id v23 = sub_100021258;
  id v24 = sub_100021268;
  id v25 = 0LL;
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472LL;
  v16[2] = sub_100023B40;
  v16[3] = &unk_10004CF10;
  id v12 = v8;
  id v17 = v12;
  id v13 = v9;
  id v18 = v13;
  id v19 = &v20;
  [v13 performBlockAndWait:v16];
  -[SYDCoreDataStore clearContexts](self, "clearContexts");
  if (a5) {
    *a5 = (id) v21[5];
  }
  BOOL v14 = v21[5] == 0;

  _Block_object_dispose(&v20, 8);
  return v14;
}

- (id)allRecordNamesInStoreWithIdentifier:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  uint64_t v21 = 0LL;
  uint64_t v22 = &v21;
  uint64_t v23 = 0x3032000000LL;
  id v24 = sub_100021258;
  id v25 = sub_100021268;
  id v26 = 0LL;
  id obj = 0LL;
  id v8 = (void *)objc_claimAutoreleasedReturnValue( -[SYDCoreDataStore contextForStoreIdentifier:error:]( self,  "contextForStoreIdentifier:error:",  v6,  &obj));
  objc_storeStrong(&v26, obj);
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472LL;
  v15[2] = sub_100023DB4;
  v15[3] = &unk_10004D6B0;
  id v9 = v6;
  id v16 = v9;
  id v10 = v8;
  id v17 = v10;
  id v19 = &v21;
  id v11 = v7;
  id v18 = v11;
  [v10 performBlockAndWait:v15];
  if (a4) {
    *a4 = (id) v22[5];
  }
  id v12 = v18;
  id v13 = v11;

  _Block_object_dispose(&v21, 8);
  return v13;
}

- (id)allStoreIdentifiersWithError:(id *)a3
{
  id v5 = SYDGetCoreDataLog();
  id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
    sub_100033294();
  }

  id v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](&OBJC_CLASS___NSMutableSet, "set"));
  uint64_t v21 = 0LL;
  uint64_t v22 = &v21;
  uint64_t v23 = 0x3032000000LL;
  id v24 = sub_100021258;
  id v25 = sub_100021268;
  id v26 = 0LL;
  id obj = 0LL;
  id v8 = (void *)objc_claimAutoreleasedReturnValue( -[SYDCoreDataStore contextForStoreIdentifier:error:]( self,  "contextForStoreIdentifier:error:",  0LL,  &obj));
  objc_storeStrong(&v26, obj);
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472LL;
  v15[2] = sub_1000241FC;
  v15[3] = &unk_10004D6D8;
  id v9 = v8;
  id v19 = &v21;
  id v16 = v9;
  id v17 = self;
  id v10 = v7;
  id v18 = v10;
  [v9 performBlockAndWait:v15];
  id v11 = SYDGetCoreDataLog();
  id v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
    sub_100033234();
  }

  if (a3) {
    *a3 = (id) v22[5];
  }
  id v13 = (void *)objc_claimAutoreleasedReturnValue([v10 allObjects]);

  _Block_object_dispose(&v21, 8);
  return v13;
}

- (BOOL)clearServerSystemFieldsRecordsForAllKeyValuesInStoreWithIdentifier:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v7 = SYDGetCoreDataLog();
  id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
    sub_100033354();
  }

  uint64_t v19 = 0LL;
  uint64_t v20 = &v19;
  uint64_t v21 = 0x3032000000LL;
  uint64_t v22 = sub_100021258;
  uint64_t v23 = sub_100021268;
  id v24 = 0LL;
  id obj = 0LL;
  id v9 = (void *)objc_claimAutoreleasedReturnValue( -[SYDCoreDataStore contextForStoreIdentifier:error:]( self,  "contextForStoreIdentifier:error:",  v6,  &obj));
  objc_storeStrong(&v24, obj);
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472LL;
  v14[2] = sub_100024604;
  v14[3] = &unk_10004D700;
  v14[4] = self;
  id v10 = v6;
  id v15 = v10;
  id v11 = v9;
  id v16 = v11;
  id v17 = &v19;
  [v11 performBlockAndWait:v14];
  -[SYDCoreDataStore clearContexts](self, "clearContexts");
  if (a4) {
    *a4 = (id) v20[5];
  }
  BOOL v12 = v20[5] == 0;

  _Block_object_dispose(&v19, 8);
  return v12;
}

- (unint64_t)numberOfKeyValuesInStoreWithIdentifier:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v24 = 0LL;
  id v25 = &v24;
  uint64_t v26 = 0x2020000000LL;
  uint64_t v27 = 0LL;
  uint64_t v18 = 0LL;
  uint64_t v19 = &v18;
  uint64_t v20 = 0x3032000000LL;
  uint64_t v21 = sub_100021258;
  uint64_t v22 = sub_100021268;
  id v23 = 0LL;
  id obj = 0LL;
  id v7 = (void *)objc_claimAutoreleasedReturnValue( -[SYDCoreDataStore contextForStoreIdentifier:error:]( self,  "contextForStoreIdentifier:error:",  v6,  &obj));
  objc_storeStrong(&v23, obj);
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472LL;
  v12[2] = sub_100024A3C;
  v12[3] = &unk_10004CB28;
  id v8 = v6;
  id v13 = v8;
  id v15 = &v24;
  id v9 = v7;
  id v14 = v9;
  id v16 = &v18;
  [v9 performBlockAndWait:v12];
  if (a4) {
    *a4 = (id) v19[5];
  }
  unint64_t v10 = v25[3];

  _Block_object_dispose(&v18, 8);
  _Block_object_dispose(&v24, 8);

  return v10;
}

- (id)currentChangeTokenForStoreIdentifier:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v7 = SYDGetCoreDataLog();
  id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
    sub_100033568();
  }

  uint64_t v25 = 0LL;
  uint64_t v26 = &v25;
  uint64_t v27 = 0x3032000000LL;
  uint64_t v28 = sub_100021258;
  uint64_t v29 = sub_100021268;
  id v30 = 0LL;
  uint64_t v19 = 0LL;
  uint64_t v20 = &v19;
  uint64_t v21 = 0x3032000000LL;
  uint64_t v22 = sub_100021258;
  id v23 = sub_100021268;
  id v24 = 0LL;
  id obj = 0LL;
  id v9 = (void *)objc_claimAutoreleasedReturnValue(-[SYDCoreDataStore persistentContainerWithError:](self, "persistentContainerWithError:", &obj));
  objc_storeStrong(&v30, obj);
  unint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([v9 persistentStoreCoordinator]);

  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472LL;
  v14[2] = sub_100024CDC;
  v14[3] = &unk_10004D728;
  id v11 = v10;
  id v15 = v11;
  id v16 = &v25;
  id v17 = &v19;
  [v11 performBlockAndWait:v14];
  if (a4) {
    *a4 = (id) v26[5];
  }
  id v12 = (id)v20[5];

  _Block_object_dispose(&v19, 8);
  _Block_object_dispose(&v25, 8);

  return v12;
}

- (id)changedKeysForStoreIdentifier:(id)a3 sinceChangeToken:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = SYDGetCoreDataLog();
  id v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
    sub_1000336A0();
  }

  uint64_t v34 = 0LL;
  uint64_t v35 = &v34;
  uint64_t v36 = 0x3032000000LL;
  id v37 = sub_100021258;
  v38 = sub_100021268;
  id v39 = 0LL;
  uint64_t v28 = 0LL;
  uint64_t v29 = &v28;
  uint64_t v30 = 0x3032000000LL;
  id v31 = sub_100021258;
  id v32 = sub_100021268;
  id v33 = 0LL;
  id obj = 0LL;
  id v12 = (void *)objc_claimAutoreleasedReturnValue( -[SYDCoreDataStore contextForStoreIdentifier:error:]( self,  "contextForStoreIdentifier:error:",  v8,  &obj));
  objc_storeStrong(&v39, obj);
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472LL;
  v20[2] = sub_100025188;
  v20[3] = &unk_10004D750;
  id v13 = v9;
  id v21 = v13;
  uint64_t v25 = &v34;
  id v14 = v8;
  id v22 = v14;
  id v15 = v12;
  id v23 = v15;
  id v24 = self;
  uint64_t v26 = &v28;
  [v15 performBlockAndWait:v20];
  if (a5) {
    *a5 = (id) v35[5];
  }
  if (!v35[5])
  {
    id v16 = SYDGetCoreDataLog();
    id v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG)) {
      sub_100033654((uint64_t)v14, (uint64_t)v40, (uint64_t)[(id)v29[5] count], v17);
    }
  }

  id v18 = (id)v29[5];

  _Block_object_dispose(&v28, 8);
  _Block_object_dispose(&v34, 8);

  return v18;
}

- (BOOL)clearServerSystemFieldsRecordsForAllStoresWithError:(id *)a3
{
  id v5 = SYDGetCoreDataLog();
  id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
    sub_100033AB8();
  }

  uint64_t v15 = 0LL;
  id v16 = &v15;
  uint64_t v17 = 0x3032000000LL;
  id v18 = sub_100021258;
  uint64_t v19 = sub_100021268;
  id v20 = 0LL;
  id obj = 0LL;
  id v7 = (void *)objc_claimAutoreleasedReturnValue( -[SYDCoreDataStore contextForStoreIdentifier:error:]( self,  "contextForStoreIdentifier:error:",  0LL,  &obj));
  objc_storeStrong(&v20, obj);
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472LL;
  v11[2] = sub_100025F74;
  v11[3] = &unk_10004CA60;
  id v8 = v7;
  id v12 = v8;
  id v13 = &v15;
  [v8 performBlockAndWait:v11];
  -[SYDCoreDataStore clearContexts](self, "clearContexts");
  if (a3) {
    *a3 = (id) v16[5];
  }
  BOOL v9 = v16[5] == 0;

  _Block_object_dispose(&v15, 8);
  return v9;
}

- (BOOL)setACAccountIdentifier:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v17 = 0LL;
  id v18 = &v17;
  uint64_t v19 = 0x3032000000LL;
  id v20 = sub_100021258;
  id v21 = sub_100021268;
  id v22 = 0LL;
  id obj = 0LL;
  id v7 = (void *)objc_claimAutoreleasedReturnValue( -[SYDCoreDataStore contextForStoreIdentifier:error:]( self,  "contextForStoreIdentifier:error:",  0LL,  &obj));
  objc_storeStrong(&v22, obj);
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472LL;
  v12[2] = sub_100026378;
  v12[3] = &unk_10004D6B0;
  void v12[4] = self;
  id v8 = v7;
  id v13 = v8;
  uint64_t v15 = &v17;
  id v9 = v6;
  id v14 = v9;
  [v8 performBlockAndWait:v12];
  if (a4) {
    *a4 = (id) v18[5];
  }
  BOOL v10 = v18[5] == 0;

  _Block_object_dispose(&v17, 8);
  return v10;
}

- (id)acAccountIdentifierWithError:(id *)a3
{
  uint64_t v20 = 0LL;
  id v21 = &v20;
  uint64_t v22 = 0x3032000000LL;
  id v23 = sub_100021258;
  id v24 = sub_100021268;
  id v25 = 0LL;
  uint64_t v14 = 0LL;
  uint64_t v15 = &v14;
  uint64_t v16 = 0x3032000000LL;
  uint64_t v17 = sub_100021258;
  id v18 = sub_100021268;
  id v19 = 0LL;
  id obj = 0LL;
  id v5 = (void *)objc_claimAutoreleasedReturnValue( -[SYDCoreDataStore contextForStoreIdentifier:error:]( self,  "contextForStoreIdentifier:error:",  0LL,  &obj));
  objc_storeStrong(&v19, obj);
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472LL;
  v9[2] = sub_1000265E0;
  v9[3] = &unk_10004D778;
  v9[4] = self;
  id v6 = v5;
  id v10 = v6;
  id v11 = &v14;
  id v12 = &v20;
  [v6 performBlockAndWait:v9];
  if (a3) {
    *a3 = (id) v15[5];
  }
  id v7 = (id)v21[5];

  _Block_object_dispose(&v14, 8);
  _Block_object_dispose(&v20, 8);

  return v7;
}

- (BOOL)setDidMigrateFromPlists:(BOOL)a3 error:(id *)a4
{
  id v7 = SYDGetCoreDataLog();
  id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
    sub_100033C5C();
  }

  uint64_t v18 = 0LL;
  id v19 = &v18;
  uint64_t v20 = 0x3032000000LL;
  id v21 = sub_100021258;
  uint64_t v22 = sub_100021268;
  id v23 = 0LL;
  id obj = 0LL;
  id v9 = (void *)objc_claimAutoreleasedReturnValue( -[SYDCoreDataStore contextForStoreIdentifier:error:]( self,  "contextForStoreIdentifier:error:",  0LL,  &obj));
  objc_storeStrong(&v23, obj);
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472LL;
  v13[2] = sub_1000267C8;
  v13[3] = &unk_10004D7A0;
  v13[4] = self;
  id v10 = v9;
  id v14 = v10;
  uint64_t v15 = &v18;
  BOOL v16 = a3;
  [v10 performBlockAndWait:v13];
  if (a4) {
    *a4 = (id) v19[5];
  }
  BOOL v11 = v19[5] == 0;

  _Block_object_dispose(&v18, 8);
  return v11;
}

- (BOOL)didMigrateFromPlistsWithError:(id *)a3
{
  uint64_t v20 = 0LL;
  id v21 = &v20;
  uint64_t v22 = 0x2020000000LL;
  char v23 = 0;
  uint64_t v14 = 0LL;
  uint64_t v15 = &v14;
  uint64_t v16 = 0x3032000000LL;
  uint64_t v17 = sub_100021258;
  uint64_t v18 = sub_100021268;
  id v19 = 0LL;
  id obj = 0LL;
  id v5 = (void *)objc_claimAutoreleasedReturnValue( -[SYDCoreDataStore contextForStoreIdentifier:error:]( self,  "contextForStoreIdentifier:error:",  0LL,  &obj));
  objc_storeStrong(&v19, obj);
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472LL;
  v9[2] = sub_100026A4C;
  v9[3] = &unk_10004D778;
  v9[4] = self;
  id v6 = v5;
  id v10 = v6;
  BOOL v11 = &v14;
  id v12 = &v20;
  [v6 performBlockAndWait:v9];
  if (a3) {
    *a3 = (id) v15[5];
  }
  char v7 = *((_BYTE *)v21 + 24);

  _Block_object_dispose(&v14, 8);
  _Block_object_dispose(&v20, 8);
  return v7;
}

- (BOOL)setFailedMigrationCount:(signed __int16)a3 error:(id *)a4
{
  id v7 = SYDGetCoreDataLog();
  id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
    sub_100033D84();
  }

  uint64_t v18 = 0LL;
  id v19 = &v18;
  uint64_t v20 = 0x3032000000LL;
  id v21 = sub_100021258;
  uint64_t v22 = sub_100021268;
  id v23 = 0LL;
  id obj = 0LL;
  id v9 = (void *)objc_claimAutoreleasedReturnValue( -[SYDCoreDataStore contextForStoreIdentifier:error:]( self,  "contextForStoreIdentifier:error:",  0LL,  &obj));
  objc_storeStrong(&v23, obj);
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472LL;
  v13[2] = sub_100026C28;
  v13[3] = &unk_10004D7C8;
  v13[4] = self;
  id v10 = v9;
  id v14 = v10;
  uint64_t v15 = &v18;
  signed __int16 v16 = a3;
  [v10 performBlockAndWait:v13];
  if (a4) {
    *a4 = (id) v19[5];
  }
  BOOL v11 = v19[5] == 0;

  _Block_object_dispose(&v18, 8);
  return v11;
}

- (signed)failedMigrationCountWithError:(id *)a3
{
  uint64_t v20 = 0LL;
  id v21 = &v20;
  uint64_t v22 = 0x2020000000LL;
  __int16 v23 = 0;
  uint64_t v14 = 0LL;
  uint64_t v15 = &v14;
  uint64_t v16 = 0x3032000000LL;
  uint64_t v17 = sub_100021258;
  uint64_t v18 = sub_100021268;
  id v19 = 0LL;
  id obj = 0LL;
  id v5 = (void *)objc_claimAutoreleasedReturnValue( -[SYDCoreDataStore contextForStoreIdentifier:error:]( self,  "contextForStoreIdentifier:error:",  0LL,  &obj));
  objc_storeStrong(&v19, obj);
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472LL;
  v9[2] = sub_100026EAC;
  v9[3] = &unk_10004D778;
  v9[4] = self;
  id v6 = v5;
  id v10 = v6;
  BOOL v11 = &v14;
  id v12 = &v20;
  [v6 performBlockAndWait:v9];
  if (a3) {
    *a3 = (id) v15[5];
  }
  signed __int16 v7 = *((_WORD *)v21 + 12);

  _Block_object_dispose(&v14, 8);
  _Block_object_dispose(&v20, 8);
  return v7;
}

- (id)dictionaryRepresentationForStoreWithIdentifier:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v7 = SYDGetCoreDataLog();
  id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
    sub_100033EAC();
  }

  uint64_t v27 = 0LL;
  uint64_t v28 = &v27;
  uint64_t v29 = 0x3032000000LL;
  uint64_t v30 = sub_100021258;
  id v31 = sub_100021268;
  id v32 = 0LL;
  uint64_t v21 = 0LL;
  uint64_t v22 = &v21;
  uint64_t v23 = 0x3032000000LL;
  id v24 = sub_100021258;
  id v25 = sub_100021268;
  id v26 = 0LL;
  id obj = 0LL;
  id v9 = (void *)objc_claimAutoreleasedReturnValue( -[SYDCoreDataStore contextForStoreIdentifier:error:]( self,  "contextForStoreIdentifier:error:",  v6,  &obj));
  objc_storeStrong(&v26, obj);
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472LL;
  v14[2] = sub_100027100;
  v14[3] = &unk_10004D7F0;
  id v10 = v6;
  uint64_t v18 = &v21;
  id v15 = v10;
  uint64_t v16 = self;
  id v11 = v9;
  id v17 = v11;
  id v19 = &v27;
  [v11 performBlockAndWait:v14];
  if (!v28[5] && !v22[5])
  {
    v28[5] = (uint64_t)&__NSDictionary0__struct;
  }

  if (a4) {
    *a4 = (id) v22[5];
  }
  id v12 = (id)v28[5];

  _Block_object_dispose(&v21, 8);
  _Block_object_dispose(&v27, 8);

  return v12;
}

- (BOOL)saveSyncEngineStateSerialization:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v7 = SYDGetCoreDataLog();
  id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
    sub_100033F6C(v6, v8);
  }

  uint64_t v19 = 0LL;
  uint64_t v20 = &v19;
  uint64_t v21 = 0x3032000000LL;
  uint64_t v22 = sub_100021258;
  uint64_t v23 = sub_100021268;
  id v24 = 0LL;
  id obj = 0LL;
  id v9 = (void *)objc_claimAutoreleasedReturnValue( -[SYDCoreDataStore contextForStoreIdentifier:error:]( self,  "contextForStoreIdentifier:error:",  0LL,  &obj));
  objc_storeStrong(&v24, obj);
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472LL;
  v14[2] = sub_100027784;
  v14[3] = &unk_10004D6B0;
  void v14[4] = self;
  id v10 = v9;
  id v15 = v10;
  id v17 = &v19;
  id v11 = v6;
  id v16 = v11;
  [v10 performBlockAndWait:v14];
  if (a4) {
    *a4 = (id) v20[5];
  }
  BOOL v12 = v20[5] == 0;

  _Block_object_dispose(&v19, 8);
  return v12;
}

- (id)syncEngineStateSerializationWithError:(id *)a3
{
  id v5 = SYDGetCoreDataLog();
  id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
    sub_100033FE0();
  }

  uint64_t v22 = 0LL;
  uint64_t v23 = &v22;
  uint64_t v24 = 0x3032000000LL;
  id v25 = sub_100021258;
  id v26 = sub_100021268;
  id v27 = 0LL;
  uint64_t v16 = 0LL;
  id v17 = &v16;
  uint64_t v18 = 0x3032000000LL;
  uint64_t v19 = sub_100021258;
  uint64_t v20 = sub_100021268;
  id v21 = 0LL;
  id obj = 0LL;
  id v7 = (void *)objc_claimAutoreleasedReturnValue( -[SYDCoreDataStore contextForStoreIdentifier:error:]( self,  "contextForStoreIdentifier:error:",  0LL,  &obj));
  objc_storeStrong(&v21, obj);
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472LL;
  v11[2] = sub_1000279C8;
  v11[3] = &unk_10004D778;
  void v11[4] = self;
  id v8 = v7;
  id v12 = v8;
  id v13 = &v16;
  uint64_t v14 = &v22;
  [v8 performBlockAndWait:v11];
  if (a3) {
    *a3 = (id) v17[5];
  }
  id v9 = (id)v23[5];

  _Block_object_dispose(&v16, 8);
  _Block_object_dispose(&v22, 8);

  return v9;
}

- (BOOL)saveDeprecatedSyncEngineMetadata:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v7 = SYDGetCoreDataLog();
  id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
    sub_10003400C(v6, v8);
  }

  uint64_t v19 = 0LL;
  uint64_t v20 = &v19;
  uint64_t v21 = 0x3032000000LL;
  uint64_t v22 = sub_100021258;
  uint64_t v23 = sub_100021268;
  id v24 = 0LL;
  id obj = 0LL;
  id v9 = (void *)objc_claimAutoreleasedReturnValue( -[SYDCoreDataStore contextForStoreIdentifier:error:]( self,  "contextForStoreIdentifier:error:",  0LL,  &obj));
  objc_storeStrong(&v24, obj);
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472LL;
  v14[2] = sub_100027BD0;
  v14[3] = &unk_10004D6B0;
  void v14[4] = self;
  id v10 = v9;
  id v15 = v10;
  id v17 = &v19;
  id v11 = v6;
  id v16 = v11;
  [v10 performBlockAndWait:v14];
  if (a4) {
    *a4 = (id) v20[5];
  }
  BOOL v12 = v20[5] == 0;

  _Block_object_dispose(&v19, 8);
  return v12;
}

- (id)deprecatedSyncEngineMetadataWithError:(id *)a3
{
  id v5 = SYDGetCoreDataLog();
  id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
    sub_100034080();
  }

  uint64_t v22 = 0LL;
  uint64_t v23 = &v22;
  uint64_t v24 = 0x3032000000LL;
  id v25 = sub_100021258;
  id v26 = sub_100021268;
  id v27 = 0LL;
  uint64_t v16 = 0LL;
  id v17 = &v16;
  uint64_t v18 = 0x3032000000LL;
  uint64_t v19 = sub_100021258;
  uint64_t v20 = sub_100021268;
  id v21 = 0LL;
  id obj = 0LL;
  id v7 = (void *)objc_claimAutoreleasedReturnValue( -[SYDCoreDataStore contextForStoreIdentifier:error:]( self,  "contextForStoreIdentifier:error:",  0LL,  &obj));
  objc_storeStrong(&v21, obj);
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472LL;
  v11[2] = sub_100027E08;
  v11[3] = &unk_10004D778;
  void v11[4] = self;
  id v8 = v7;
  id v12 = v8;
  id v13 = &v16;
  uint64_t v14 = &v22;
  [v8 performBlockAndWait:v11];
  if (a3) {
    *a3 = (id) v17[5];
  }
  id v9 = (id)v23[5];

  _Block_object_dispose(&v16, 8);
  _Block_object_dispose(&v22, 8);

  return v9;
}

- (id)managedDatabaseCreateIfNecessary:(BOOL)a3 inContext:(id)a4 error:(id *)a5
{
  BOOL v6 = a3;
  id v8 = a4;
  id v9 = (void *)objc_claimAutoreleasedReturnValue(+[SYDManagedDatabase fetchRequest](&OBJC_CLASS___SYDManagedDatabase, "fetchRequest"));
  id v23 = 0LL;
  id v10 = (void *)objc_claimAutoreleasedReturnValue([v9 execute:&v23]);
  id v11 = v23;
  if ((unint64_t)[v10 count] >= 2)
  {
    id v12 = SYDGetCoreDataLog();
    id v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT)) {
      sub_10003416C();
    }
  }

  uint64_t v14 = objc_claimAutoreleasedReturnValue([v10 firstObject]);
  id v15 = (SYDManagedDatabase *)v14;
  if (v11)
  {
    id v16 = SYDGetCoreDataLog();
    id v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_FAULT)) {
      sub_10003410C();
    }

    uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue([v8 persistentStoreCoordinator]);
    -[SYDCoreDataStore handleCorruptionIfNecessaryFromError:inPersistentStoreCoordinator:]( self,  "handleCorruptionIfNecessaryFromError:inPersistentStoreCoordinator:",  v11,  v18);
  }

  else
  {
    if (v14) {
      BOOL v19 = 1;
    }
    else {
      BOOL v19 = !v6;
    }
    if (!v19)
    {
      id v20 = SYDGetCoreDataLog();
      id v21 = (os_log_s *)objc_claimAutoreleasedReturnValue(v20);
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG)) {
        sub_1000340AC();
      }

      id v15 = -[SYDManagedDatabase initWithContext:](objc_alloc(&OBJC_CLASS___SYDManagedDatabase), "initWithContext:", v8);
    }
  }

  if (a5) {
    *a5 = v11;
  }

  return v15;
}

- (id)managedStoreWithIdentifier:(id)a3 createIfNecessary:(BOOL)a4 inContext:(id)a5 error:(id *)a6
{
  BOOL v8 = a4;
  id v10 = a3;
  id v11 = a5;
  id v12 = (void *)objc_claimAutoreleasedReturnValue(+[SYDManagedStore fetchRequest](&OBJC_CLASS___SYDManagedStore, "fetchRequest"));
  id v13 = (void *)objc_claimAutoreleasedReturnValue( +[NSPredicate predicateWithFormat:]( &OBJC_CLASS___NSPredicate,  "predicateWithFormat:",  @"identifier == %@",  v10));
  [v12 setPredicate:v13];

  id v27 = 0LL;
  uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue([v12 execute:&v27]);
  id v15 = v27;
  if ((unint64_t)[v14 count] >= 2)
  {
    id v16 = SYDGetCoreDataLog();
    id v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_FAULT)) {
      sub_10003428C();
    }
  }

  uint64_t v18 = objc_claimAutoreleasedReturnValue([v14 firstObject]);
  BOOL v19 = (SYDManagedStore *)v18;
  if (v15)
  {
    id v20 = SYDGetCoreDataLog();
    id v21 = (os_log_s *)objc_claimAutoreleasedReturnValue(v20);
    if (os_log_type_enabled(v21, OS_LOG_TYPE_FAULT)) {
      sub_10003422C();
    }

    uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue([v11 persistentStoreCoordinator]);
    -[SYDCoreDataStore handleCorruptionIfNecessaryFromError:inPersistentStoreCoordinator:]( self,  "handleCorruptionIfNecessaryFromError:inPersistentStoreCoordinator:",  v15,  v22);
LABEL_14:

    goto LABEL_15;
  }

  if (!v18 && v8)
  {
    id v23 = SYDGetCoreDataLog();
    uint64_t v24 = (os_log_s *)objc_claimAutoreleasedReturnValue(v23);
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG)) {
      sub_1000341CC();
    }

    BOOL v19 = -[SYDManagedStore initWithContext:](objc_alloc(&OBJC_CLASS___SYDManagedStore), "initWithContext:", v11);
    -[SYDManagedStore setIdentifier:](v19, "setIdentifier:", v10);
    id v26 = 0LL;
    uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue( -[SYDCoreDataStore managedDatabaseCreateIfNecessary:inContext:error:]( self,  "managedDatabaseCreateIfNecessary:inContext:error:",  1LL,  v11,  &v26));
    id v15 = v26;
    -[SYDManagedStore setDatabase:](v19, "setDatabase:", v22);
    goto LABEL_14;
  }

- (id)managedKeyValueWithRecordName:(id)a3 inStoreWithIdentifier:(id)a4 inContext:(id)a5 error:(id *)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = (void *)objc_claimAutoreleasedReturnValue( +[NSPredicate predicateWithFormat:]( &OBJC_CLASS___NSPredicate,  "predicateWithFormat:",  @"recordName == %@",  v10));
  v32[0] = v13;
  uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue( +[NSPredicate predicateWithFormat:]( &OBJC_CLASS___NSPredicate,  "predicateWithFormat:",  @"store.identifier == %@",  v11));
  v32[1] = v14;
  id v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v32, 2LL));

  id v16 = (void *)objc_claimAutoreleasedReturnValue( +[NSCompoundPredicate andPredicateWithSubpredicates:]( &OBJC_CLASS___NSCompoundPredicate,  "andPredicateWithSubpredicates:",  v15));
  id v17 = (void *)objc_claimAutoreleasedReturnValue( -[SYDCoreDataStore managedKeyValuesMatchingPredicate:inContext:error:]( self,  "managedKeyValuesMatchingPredicate:inContext:error:",  v16,  v12,  a6));

  if ((unint64_t)[v17 count] >= 2)
  {
    id v18 = SYDGetCoreDataLog();
    BOOL v19 = (os_log_s *)objc_claimAutoreleasedReturnValue(v18);
    if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412546;
      id v29 = v10;
      __int16 v30 = 2112;
      id v31 = v11;
      _os_log_impl( (void *)&_mh_execute_header,  v19,  OS_LOG_TYPE_INFO,  "Found multiple key values for the same record name (%@) in store <(%@)>",  buf,  0x16u);
    }
  }

  id v20 = (void *)objc_claimAutoreleasedReturnValue([v17 firstObject]);
  if ([v11 length])
  {
    id v21 = 0LL;
    if (a6) {
LABEL_7:
    }
      *a6 = v21;
  }

  else
  {
    id v23 = SYDGetCoreDataLog();
    uint64_t v24 = (os_log_s *)objc_claimAutoreleasedReturnValue(v23);
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR)) {
      sub_1000328D4();
    }

    NSErrorUserInfoKey v26 = NSLocalizedDescriptionKey;
    id v27 = @"Fetched a managedKeyValue with an empty store identifier";
    id v25 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v27,  &v26,  1LL));
    id v21 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"SyncedDefaults",  2222LL,  v25));

    if (a6) {
      goto LABEL_7;
    }
  }

  return v20;
}

- (id)managedKeyValuesForKeyIDs:(id)a3 inContext:(id)a4 error:(id *)a5
{
  id v7 = a3;
  id v48 = a4;
  BOOL v8 = objc_opt_new(&OBJC_CLASS___NSMutableDictionary);
  __int128 v59 = 0u;
  __int128 v60 = 0u;
  __int128 v61 = 0u;
  __int128 v62 = 0u;
  id obj = v7;
  id v9 = [obj countByEnumeratingWithState:&v59 objects:v64 count:16];
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v60;
    do
    {
      for (i = 0LL; i != v10; i = (char *)i + 1)
      {
        if (*(void *)v60 != v11) {
          objc_enumerationMutation(obj);
        }
        id v13 = *(void **)(*((void *)&v59 + 1) + 8LL * (void)i);
        uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue([v13 storeIdentifier]);
        id v15 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](v8, "objectForKeyedSubscript:", v14));

        if (!v15)
        {
          id v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](&OBJC_CLASS___NSMutableSet, "set"));
          id v16 = (void *)objc_claimAutoreleasedReturnValue([v13 storeIdentifier]);
          -[NSMutableDictionary setObject:forKeyedSubscript:](v8, "setObject:forKeyedSubscript:", v15, v16);
        }

        id v17 = (void *)objc_claimAutoreleasedReturnValue([v13 key]);
        [v15 addObject:v17];
      }

      id v10 = [obj countByEnumeratingWithState:&v59 objects:v64 count:16];
    }

    while (v10);
  }

  v57[0] = _NSConcreteStackBlock;
  v57[1] = 3221225472LL;
  v57[2] = sub_100028900;
  v57[3] = &unk_10004D270;
  id v18 = objc_opt_new(&OBJC_CLASS___NSMutableArray);
  v58 = v18;
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](v8, "enumerateKeysAndObjectsUsingBlock:", v57);
  BOOL v19 = (void *)objc_claimAutoreleasedReturnValue( +[NSCompoundPredicate orPredicateWithSubpredicates:]( &OBJC_CLASS___NSCompoundPredicate,  "orPredicateWithSubpredicates:",  v18));
  id v56 = 0LL;
  id v20 = v48;
  id v21 = (void *)objc_claimAutoreleasedReturnValue( -[SYDCoreDataStore managedKeyValuesMatchingPredicate:inContext:error:]( self,  "managedKeyValuesMatchingPredicate:inContext:error:",  v19,  v48,  &v56));
  id v22 = v56;
  if (v22)
  {
    id v23 = SYDGetCoreDataLog();
    v49 = (os_log_s *)objc_claimAutoreleasedReturnValue(v23);
    if (os_log_type_enabled(v49, OS_LOG_TYPE_ERROR)) {
      sub_1000342EC();
    }
    uint64_t v24 = 0LL;
    goto LABEL_14;
  }

  uint64_t v24 = objc_opt_new(&OBJC_CLASS___NSMutableDictionary);
  __int128 v52 = 0u;
  __int128 v53 = 0u;
  __int128 v54 = 0u;
  __int128 v55 = 0u;
  v49 = v21;
  id v26 = -[os_log_s countByEnumeratingWithState:objects:count:]( v49,  "countByEnumeratingWithState:objects:count:",  &v52,  v63,  16LL);
  if (!v26)
  {
LABEL_14:
    id v25 = a5;
    goto LABEL_26;
  }

  id v27 = v26;
  v44 = v21;
  v45 = v19;
  v46 = v18;
  uint64_t v50 = *(void *)v53;
  do
  {
    for (j = 0LL; j != v27; j = (char *)j + 1)
    {
      if (*(void *)v53 != v50) {
        objc_enumerationMutation(v49);
      }
      id v29 = *(void **)(*((void *)&v52 + 1) + 8LL * (void)j);
      __int16 v30 = objc_alloc(&OBJC_CLASS____TtC13syncdefaultsd8SYDKeyID);
      id v31 = (void *)objc_claimAutoreleasedReturnValue([v29 key]);
      id v32 = (void *)objc_claimAutoreleasedReturnValue([v29 store]);
      id v33 = (void *)objc_claimAutoreleasedReturnValue([v32 identifier]);
      uint64_t v34 = -[SYDKeyID initWithKey:storeIdentifier:](v30, "initWithKey:storeIdentifier:", v31, v33);

      uint64_t v35 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](v24, "objectForKeyedSubscript:", v34));
      uint64_t v36 = v35;
      if (!v35) {
        goto LABEL_22;
      }
      id v37 = (void *)objc_claimAutoreleasedReturnValue([v35 valueModificationDate]);
      [v37 timeIntervalSinceNow];
      double v39 = v38;
      v40 = (void *)objc_claimAutoreleasedReturnValue([v29 valueModificationDate]);
      [v40 timeIntervalSinceNow];
      double v42 = v41;

      if (v39 < v42) {
LABEL_22:
      }
        -[NSMutableDictionary setObject:forKeyedSubscript:](v24, "setObject:forKeyedSubscript:", v29, v34);
    }

    id v27 = -[os_log_s countByEnumeratingWithState:objects:count:]( v49,  "countByEnumeratingWithState:objects:count:",  &v52,  v63,  16LL);
  }

  while (v27);
  id v25 = a5;
  id v20 = v48;
  BOOL v19 = v45;
  id v18 = v46;
  id v22 = 0LL;
  id v21 = v44;
LABEL_26:

  if (v25) {
    *id v25 = v22;
  }

  return v24;
}

- (id)managedKeyValuesMatchingPredicate:(id)a3 inContext:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = (void *)objc_claimAutoreleasedReturnValue(+[SYDManagedKeyValue fetchRequest](&OBJC_CLASS___SYDManagedKeyValue, "fetchRequest"));
  [v10 setPredicate:v8];
  uint64_t v11 = NSStringFromSelector("valueModificationDate");
  id v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
  id v13 = (void *)objc_claimAutoreleasedReturnValue( +[NSSortDescriptor sortDescriptorWithKey:ascending:]( &OBJC_CLASS___NSSortDescriptor,  "sortDescriptorWithKey:ascending:",  v12,  0LL));
  id v22 = v13;
  uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v22, 1LL));
  [v10 setSortDescriptors:v14];

  id v21 = 0LL;
  id v15 = (void *)objc_claimAutoreleasedReturnValue([v10 execute:&v21]);
  id v16 = v21;
  if (v16)
  {
    id v17 = SYDGetCoreDataLog();
    id v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(v17);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_FAULT)) {
      sub_10003434C();
    }

    BOOL v19 = (void *)objc_claimAutoreleasedReturnValue([v9 persistentStoreCoordinator]);
    -[SYDCoreDataStore handleCorruptionIfNecessaryFromError:inPersistentStoreCoordinator:]( self,  "handleCorruptionIfNecessaryFromError:inPersistentStoreCoordinator:",  v16,  v19);
  }

  if (a5) {
    *a5 = v16;
  }

  return v15;
}

- (id)contextForStoreIdentifier:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[SYDCoreDataStore transactionContext](self, "transactionContext"));

  if (v7)
  {
    id v8 = (void *)objc_claimAutoreleasedReturnValue(-[SYDCoreDataStore transactionContext](self, "transactionContext"));
  }

  else
  {
    id v9 = (void *)objc_claimAutoreleasedReturnValue(-[SYDCoreDataStore persistentContainerWithError:](self, "persistentContainerWithError:", a4));
    if (v9)
    {
      id v8 = (void *)objc_claimAutoreleasedReturnValue( -[SYDCoreDataStore _contextForStoreIdentifier:persistentContainer:]( self,  "_contextForStoreIdentifier:persistentContainer:",  v6,  v9));
    }

    else
    {
      id v10 = SYDGetCoreDataLog();
      uint64_t v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
        sub_1000343AC();
      }

      id v8 = 0LL;
    }
  }

  return v8;
}

- (id)_contextForStoreIdentifier:(id)a3 persistentContainer:(id)a4
{
  id v6 = (__CFString *)a3;
  id v7 = a4;
  id v8 = @"__no_store__";
  if (v6) {
    id v8 = v6;
  }
  id v9 = v8;
  id v10 = (void *)objc_claimAutoreleasedReturnValue(-[SYDCoreDataStore contextsLock](self, "contextsLock"));
  [v10 lock];

  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(-[SYDCoreDataStore contexts](self, "contexts"));
  id v12 = (id)objc_claimAutoreleasedReturnValue([v11 objectForKey:v9]);

  if (!v12)
  {
    id v12 = [v7 newBackgroundContext];
    [v12 setMergePolicy:NSMergeByPropertyObjectTrumpMergePolicy];
    if (v6) {
      [v12 setName:v6];
    }
    id v13 = (void *)objc_claimAutoreleasedReturnValue(-[SYDCoreDataStore contexts](self, "contexts"));
    [v13 setObject:v12 forKey:v9];
  }

  uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue(-[SYDCoreDataStore contextsLock](self, "contextsLock"));
  [v14 unlock];

  return v12;
}

- (void)clearContexts
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SYDCoreDataStore contextsLock](self, "contextsLock"));
  [v3 lock];

  objc_super v4 = (void *)objc_claimAutoreleasedReturnValue(-[SYDCoreDataStore contexts](self, "contexts"));
  [v4 removeAllObjects];

  id v5 = (id)objc_claimAutoreleasedReturnValue(-[SYDCoreDataStore contextsLock](self, "contextsLock"));
  [v5 unlock];
}

- (BOOL)saveContext:(id)a3 reason:(id)a4 includingTransactionContext:(BOOL)a5 error:(id *)a6
{
  id v10 = a3;
  id v11 = a4;
  if (a5
    || (id v12 = (id)objc_claimAutoreleasedReturnValue(-[SYDCoreDataStore transactionContext](self, "transactionContext")),
        v12,
        v12 != v10))
  {
    if (![v10 hasChanges])
    {
      id v15 = 0LL;
      if (!a6) {
        goto LABEL_28;
      }
      goto LABEL_27;
    }

    id v31 = 0LL;
    unsigned __int8 v13 = [v10 save:&v31];
    id v14 = v31;
    id v15 = v14;
    if ((v13 & 1) != 0)
    {
      id v16 = SYDGetCoreDataLog();
      id v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG)) {
        sub_10003440C();
      }
      goto LABEL_26;
    }

    id v18 = (void *)objc_claimAutoreleasedReturnValue([v14 domain]);
    unsigned int v19 = [v18 isEqualToString:NSSQLiteErrorDomain];

    if (v19)
    {
      id v20 = [v15 code];
      BOOL v21 = 0;
    }

    else
    {
      id v23 = (void *)objc_claimAutoreleasedReturnValue([v15 domain]);
      unsigned int v24 = [v23 isEqualToString:NSCocoaErrorDomain];

      if (!v24) {
        goto LABEL_21;
      }
      id v25 = (void *)objc_claimAutoreleasedReturnValue([v15 userInfo]);
      id v26 = (void *)objc_claimAutoreleasedReturnValue([v25 objectForKeyedSubscript:NSSQLiteErrorDomain]);

      objc_opt_class(&OBJC_CLASS___NSNumber);
      if ((objc_opt_isKindOfClass(v26) & 1) != 0) {
        id v20 = [v26 integerValue];
      }
      else {
        id v20 = 0LL;
      }
      BOOL v21 = [v15 code] == (id)640;
    }

    if (v20 == (id)13 || v21)
    {
      id v29 = SYDGetCoreDataLog();
      uint64_t v28 = (os_log_s *)objc_claimAutoreleasedReturnValue(v29);
      if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR)) {
        sub_10003446C();
      }
      goto LABEL_25;
    }

- (id)persistentContainerWithError:(id *)a3
{
  uint64_t v9 = 0LL;
  id v10 = &v9;
  uint64_t v11 = 0x3032000000LL;
  id v12 = sub_100021258;
  unsigned __int8 v13 = sub_100021268;
  id v14 = 0LL;
  id v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[SYDCoreDataStore persistentContainerQueue](self, "persistentContainerQueue"));
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = sub_100029174;
  v8[3] = &unk_10004CA60;
  v8[4] = self;
  v8[5] = &v9;
  dispatch_sync(v5, v8);

  if (a3) {
    *a3 = (id) v10[5];
  }
  id v6 = self->__persistentContainer;
  _Block_object_dispose(&v9, 8);

  return v6;
}

+ (id)managedObjectModel
{
  if (qword_100057AC0 != -1) {
    dispatch_once(&qword_100057AC0, &stru_10004D860);
  }
  return (id)qword_100057AB8;
}

- (void)destroyPersistentStore
{
  id v11 = 0LL;
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SYDCoreDataStore persistentContainerWithError:](self, "persistentContainerWithError:", &v11));
  id v4 = v11;
  if (v4)
  {
    id v5 = SYDGetCoreDataLog();
    id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      sub_100034850();
    }
  }

  else
  {
    if (v3)
    {
      id v7 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[SYDCoreDataStore persistentContainerQueue](self, "persistentContainerQueue"));
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472LL;
      block[2] = sub_100029918;
      block[3] = &unk_10004CA88;
      block[4] = self;
      id v10 = v3;
      dispatch_sync(v7, block);

      goto LABEL_7;
    }

    id v8 = SYDGetCoreDataLog();
    id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      sub_100034824();
    }
  }

LABEL_7:
}

- (void)_queue_destroyPersistentStoreInPersistentStoreCoordinator:(id)a3
{
  id v4 = a3;
  id v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[SYDCoreDataStore persistentContainerQueue](self, "persistentContainerQueue"));
  dispatch_assert_queue_V2(v5);

  if (v4)
  {
    id v6 = SYDGetCoreDataLog();
    id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
      sub_100034990(self, v7);
    }

    id v8 = (void *)objc_claimAutoreleasedReturnValue(-[SYDCoreDataStore URL](self, "URL"));
    id v14 = 0LL;
    unsigned __int8 v9 = [v4 destroyPersistentStoreAtURL:v8 withType:NSSQLiteStoreType options:0 error:&v14];
    id v10 = v14;

    id v11 = SYDGetCoreDataLog();
    id v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
    persistentContainer = (NSPersistentContainer *)v12;
    if ((v9 & 1) != 0)
    {
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
        sub_1000348B0(self, (os_log_s *)persistentContainer);
      }

      persistentContainer = self->__persistentContainer;
      self->__persistentContainer = 0LL;
    }

    else if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT))
    {
      sub_100034930();
    }
  }
}

- (unint64_t)fileSizeBytes
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[SYDCoreDataStore URL](self, "URL"));
  v3 = (void *)objc_claimAutoreleasedReturnValue([v2 lastPathComponent]);
  uint64_t v4 = objc_claimAutoreleasedReturnValue([v3 stringByAppendingString:@"-wal"]);

  id v5 = (void *)objc_claimAutoreleasedReturnValue([v2 lastPathComponent]);
  uint64_t v6 = objc_claimAutoreleasedReturnValue([v5 stringByAppendingString:@"-shm"]);

  v41[0] = v2;
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v2 URLByDeletingLastPathComponent]);
  uint64_t v28 = (void *)v4;
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 URLByAppendingPathComponent:v4]);
  v41[1] = v8;
  id v29 = v2;
  unsigned __int8 v9 = (void *)objc_claimAutoreleasedReturnValue([v2 URLByDeletingLastPathComponent]);
  id v27 = (void *)v6;
  id v10 = (void *)objc_claimAutoreleasedReturnValue([v9 URLByAppendingPathComponent:v6]);
  v41[2] = v10;
  id v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v41, 3LL));

  __int128 v34 = 0u;
  __int128 v35 = 0u;
  __int128 v32 = 0u;
  __int128 v33 = 0u;
  id v12 = v11;
  id v13 = [v12 countByEnumeratingWithState:&v32 objects:v40 count:16];
  if (v13)
  {
    id v14 = v13;
    unint64_t v15 = 0LL;
    uint64_t v16 = *(void *)v33;
    do
    {
      for (i = 0LL; i != v14; i = (char *)i + 1)
      {
        if (*(void *)v33 != v16) {
          objc_enumerationMutation(v12);
        }
        id v18 = *(void **)(*((void *)&v32 + 1) + 8LL * (void)i);
        id v30 = 0LL;
        id v31 = 0LL;
        unsigned int v19 = [v18 getResourceValue:&v31 forKey:NSURLFileSizeKey error:&v30];
        id v20 = v31;
        id v21 = v30;
        if (v19)
        {
          v15 += (unint64_t)[v20 unsignedIntegerValue];
        }

        else
        {
          id v22 = SYDGetCoreDataLog();
          id v23 = (os_log_s *)objc_claimAutoreleasedReturnValue(v22);
          if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412546;
            id v37 = v18;
            __int16 v38 = 2112;
            id v39 = v21;
            _os_log_error_impl( (void *)&_mh_execute_header,  v23,  OS_LOG_TYPE_ERROR,  "Error getting file size for %@: %@",  buf,  0x16u);
          }
        }
      }

      id v14 = [v12 countByEnumeratingWithState:&v32 objects:v40 count:16];
    }

    while (v14);
  }

  else
  {
    unint64_t v15 = 0LL;
  }

  id v24 = SYDGetCoreDataLog();
  id v25 = (os_log_s *)objc_claimAutoreleasedReturnValue(v24);
  if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG)) {
    sub_100034A10();
  }

  return v15;
}

- (id)transactionalStoreWithError:(id *)a3
{
  id v13 = 0LL;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[SYDCoreDataStore persistentContainerWithError:](self, "persistentContainerWithError:", &v13));
  id v6 = v13;
  if (v5)
  {
    id v7 = objc_alloc(&OBJC_CLASS___SYDCoreDataStore);
    id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(-[SYDCoreDataStore URL](self, "URL"));
    unsigned __int8 v9 = (void *)objc_claimAutoreleasedReturnValue(-[SYDCoreDataStore fileProtectionType](self, "fileProtectionType"));
    id v10 = -[SYDCoreDataStore initWithURL:fileProtectionType:persistentContainer:isTransactional:]( v7,  "initWithURL:fileProtectionType:persistentContainer:isTransactional:",  v8,  v9,  v5,  1LL);
  }

  else
  {
    id v11 = SYDGetCoreDataLog();
    id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      sub_100034A7C();
    }
    id v10 = 0LL;
  }

  if (a3) {
    *a3 = v6;
  }

  return v10;
}

- (BOOL)saveTransaction:(id *)a3
{
  uint64_t v15 = 0LL;
  uint64_t v16 = &v15;
  uint64_t v17 = 0x3032000000LL;
  id v18 = sub_100021258;
  unsigned int v19 = sub_100021268;
  id v20 = 0LL;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[SYDCoreDataStore transactionContext](self, "transactionContext"));

  if (v5)
  {
    id v6 = SYDGetCoreDataLog();
    id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
      sub_100034B08();
    }

    id v8 = (void *)objc_claimAutoreleasedReturnValue(-[SYDCoreDataStore transactionContext](self, "transactionContext"));
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472LL;
    v14[2] = sub_10002A01C;
    v14[3] = &unk_10004CA60;
    void v14[4] = self;
    void v14[5] = &v15;
    [v8 performBlockAndWait:v14];

    unsigned __int8 v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
    [v9 postNotificationName:@"TransactionStoreDidSave" object:self];

    if (a3) {
LABEL_5:
    }
      *a3 = (id) v16[5];
  }

  else
  {
    id v12 = SYDGetCoreDataLog();
    id v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT)) {
      sub_100034ADC();
    }

    if (a3) {
      goto LABEL_5;
    }
  }

  BOOL v10 = v16[5] == 0;
  _Block_object_dispose(&v15, 8);

  return v10;
}

- (void)transactionStoreDidSave:(id)a3
{
  id v4 = SYDGetCoreDataLog();
  id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)id v6 = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_INFO,  "A transaction store saved, clearing cached contexts",  v6,  2u);
  }

  -[SYDCoreDataStore clearContexts](self, "clearContexts");
}

- (void)handleCorruptionIfNecessaryFromError:(id)a3 inPersistentStoreCoordinator:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[SYDCoreDataStore persistentContainerQueue](self, "persistentContainerQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10002A1C4;
  block[3] = &unk_10004CB78;
  block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_sync(v8, block);
}

+ (BOOL)isCorruptionError:(id)a3
{
  id v3 = a3;
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 domain]);
  if ([v4 isEqualToString:NSCocoaErrorDomain])
  {
    id v5 = [v3 code];

    if (v5 == (id)259)
    {
      id v6 = SYDGetCoreDataLog();
      id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
      if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT)) {
        sub_100034B34();
      }
      goto LABEL_12;
    }
  }

  else
  {
  }

  id v8 = (void *)objc_claimAutoreleasedReturnValue([v3 userInfo]);
  id v9 = (void *)objc_claimAutoreleasedReturnValue([v8 objectForKeyedSubscript:NSSQLiteErrorDomain]);
  unsigned int v10 = [v9 isEqual:&off_10004FCF8];

  if (v10)
  {
    id v11 = SYDGetCoreDataLog();
    id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT)) {
      sub_100034B94();
    }
  }

  else
  {
    id v12 = (void *)objc_claimAutoreleasedReturnValue([v3 userInfo]);
    id v13 = (void *)objc_claimAutoreleasedReturnValue([v12 objectForKeyedSubscript:NSSQLiteErrorDomain]);
    unsigned int v14 = [v13 isEqual:&off_10004FD10];

    if (!v14)
    {
      BOOL v16 = 0;
      goto LABEL_13;
    }

    id v15 = SYDGetCoreDataLog();
    id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v15);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT)) {
      sub_100034BF4();
    }
  }

- (BOOL)_queue_handleCorruptionIfNecessaryFromError:(id)a3 inPersistentStoreCoordinator:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[SYDCoreDataStore persistentContainerQueue](self, "persistentContainerQueue"));
  dispatch_assert_queue_V2(v8);

  if (v6 && [(id)objc_opt_class(self) isCorruptionError:v6])
  {
    id v9 = SYDGetCoreDataLog();
    unsigned int v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT)) {
      sub_100034C54();
    }

    -[SYDCoreDataStore _queue_destroyPersistentStoreInPersistentStoreCoordinator:]( self,  "_queue_destroyPersistentStoreInPersistentStoreCoordinator:",  v7);
    id v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
    id v12 = (void *)objc_claimAutoreleasedReturnValue([v6 domain]);
    [v11 setObject:v12 forKeyedSubscript:@"errorDomain"];

    id v13 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithInteger:]( NSNumber,  "numberWithInteger:",  [v6 code]));
    [v11 setObject:v13 forKeyedSubscript:@"errorCode"];

    unsigned int v14 = (void *)objc_claimAutoreleasedReturnValue([v6 userInfo]);
    id v15 = (void *)objc_claimAutoreleasedReturnValue([v14 objectForKeyedSubscript:NSSQLiteErrorDomain]);

    if (v15)
    {
      BOOL v16 = (void *)objc_claimAutoreleasedReturnValue([v6 userInfo]);
      uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue([v16 objectForKeyedSubscript:NSSQLiteErrorDomain]);
      [v11 setObject:v17 forKeyedSubscript:@"sqliteError"];
    }

    AnalyticsSendEvent(@"com.apple.kvs.corruptDatabase", v11);

    BOOL v18 = 1;
  }

  else
  {
    BOOL v18 = 0;
  }

  return v18;
}

+ (BOOL)isInvalidTokenError:(id)a3
{
  id v3 = a3;
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 domain]);
  if (![v4 isEqualToString:NSCocoaErrorDomain])
  {

    goto LABEL_7;
  }

  if ([v3 code] != (id)134301 && objc_msgSend(v3, "code") != (id)134501)
  {
    id v7 = [v3 code];

    if (v7 == (id)4864) {
      goto LABEL_5;
    }
LABEL_7:
    BOOL v5 = 0;
    goto LABEL_8;
  }

LABEL_5:
  BOOL v5 = 1;
LABEL_8:

  return v5;
}

- (NSPersistentContainer)_persistentContainer
{
  return self->__persistentContainer;
}

- (void)set_persistentContainer:(id)a3
{
}

- (NSURL)URL
{
  return self->_URL;
}

- (void)setURL:(id)a3
{
}

- (NSString)fileProtectionType
{
  return self->_fileProtectionType;
}

- (void)setFileProtectionType:(id)a3
{
}

- (BOOL)shouldLogValues
{
  return self->_shouldLogValues;
}

- (void)setShouldLogValues:(BOOL)a3
{
  self->_shouldLogValues = a3;
}

- (OS_dispatch_queue)persistentContainerQueue
{
  return self->_persistentContainerQueue;
}

- (void)setPersistentContainerQueue:(id)a3
{
}

- (NSManagedObjectContext)transactionContext
{
  return self->_transactionContext;
}

- (void)setTransactionContext:(id)a3
{
}

- (NSCache)contexts
{
  return self->_contexts;
}

- (void)setContexts:(id)a3
{
}

- (NSLock)contextsLock
{
  return self->_contextsLock;
}

- (void)setContextsLock:(id)a3
{
}

- (void).cxx_destruct
{
}

@end