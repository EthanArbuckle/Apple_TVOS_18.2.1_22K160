@interface PDSpotlightIndexer
+ (BOOL)isIndexingAvailable;
- (BOOL)_supportsCardInformationItemForPass:(id)a3;
- (BOOL)databaseWillRestore;
- (BOOL)hasCompletedIndexingSetup;
- (BOOL)isIndexing;
- (BOOL)performingOperation;
- (BOOL)performingOverallIndexing;
- (BOOL)resetPending;
- (BOOL)willRequireIndexing;
- (NSCountedSet)initiatedTransactionFetches;
- (NSHashTable)observers;
- (NSMutableArray)resetCompletions;
- (OS_dispatch_queue)indexAccessQueue;
- (PDDatabaseManager)databaseManager;
- (PDPaymentWebServiceCoordinator)paymentWebServiceCoordinator;
- (PDPeerPaymentWebServiceCoordinator)peerPaymentWebServiceCoordinator;
- (PDSpotlightIndexer)initWithDatabaseManager:(id)a3 transactionReceiptFileManager:(id)a4 paymentWebServiceCoordinator:(id)a5 peerPaymentWebServiceCoordinator:(id)a6 databaseRecreated:(BOOL)a7;
- (PDTransactionReceiptFileManager)receiptFileManager;
- (PDWorldRegionAggregator)worldRegionAggregator;
- (PKCancelable)indexingOperation;
- (PKCancelable)metadataOperation;
- (PKContactResolver)contactResolver;
- (id)_processMissingTransactionswithIdentifiers:(id)a3 spotlightItems:(id)a4 itemsToDelete:(id)a5 regions:(id *)a6 tags:(id *)a7;
- (id)featuresCompletion;
- (id)updateRegionWithIdentifier:(id)a3 localizedName:(id)a4 boundingRegion:(id *)a5 mapsIdentifier:(unint64_t)a6 providerIdentifier:(int)a7;
- (id)worldRegionAggregatorCompletion;
- (os_unfair_lock_s)lockObservers;
- (os_unfair_lock_s)lockOperation;
- (os_unfair_lock_s)lockSuggestions;
- (void)_accessObserversWithHandler:(id)a3;
- (void)_checkConsistencyForItemsOfType:(unint64_t)a3 withCompletion:(id)a4;
- (void)_checkConsistencyWithCompletion:(id)a3;
- (void)_cleanupIndexingState;
- (void)_indexedItemCountsWithCompletion:(id)a3;
- (void)_indexingCompleted;
- (void)_indexingStarted;
- (void)_performIndexingOperationsWithOrigin:(unint64_t)a3;
- (void)_performQueryWithQueryString:(id)a3 completion:(id)a4;
- (void)_queue_completeReset;
- (void)_queue_fetchFinanceKitAccountsMetadataWithCompletion:(id)a3;
- (void)_queue_fetchFinanceKitTransactionsMetadataWithCompletion:(id)a3;
- (void)_queue_fetchPassesMetadataWithCompletion:(id)a3;
- (void)_queue_fetchTransactionsMetadataWithCompletion:(id)a3;
- (void)_setupXPCActivity;
- (void)_updateFinHealthAccountEvent:(id)a3 deferFeatureComputation:(BOOL)a4 completion:(id)a5;
- (void)accountManager:(id)a3 didAddAccount:(id)a4;
- (void)accountManager:(id)a3 didAddAccountEvent:(id)a4;
- (void)accountManager:(id)a3 didRemoveAccount:(id)a4;
- (void)accountManager:(id)a3 didUpdateAccount:(id)a4 oldAccount:(id)a5;
- (void)accountManager:(id)a3 didUpdateAccountEvent:(id)a4;
- (void)addObserver:(id)a3;
- (void)databaseRestored;
- (void)deleteAllFinHealthDataWithCompletion:(id)a3;
- (void)passAddedOrUpdated:(id)a3;
- (void)passDidDisappear:(id)a3;
- (void)paymentWebServiceCoordinator:(id)a3 didDownloadTransactionReceipt:(id)a4 forTransactionWithIdentifier:(id)a5;
- (void)peerPaymentAccountDidUpdate:(id)a3;
- (void)performScheduledActivityWithIdentifier:(id)a3 activityCriteria:(id)a4;
- (void)placemarkFound:(id)a3 forTransaction:(id)a4;
- (void)reindexAllContent;
- (void)reindexContentForIdentifiers:(id)a3;
- (void)removeObserver:(id)a3;
- (void)resetCoordinatesForAllRegions;
- (void)resetRegions;
- (void)resetWithCompletion:(id)a3;
- (void)setContactResolver:(id)a3;
- (void)setDatabaseWillRestore:(BOOL)a3;
- (void)setFeaturesCompletion:(id)a3;
- (void)setHasCompletedIndexingSetup:(BOOL)a3;
- (void)setIndexingOperation:(id)a3;
- (void)setInitiatedTransactionFetches:(id)a3;
- (void)setLockObservers:(os_unfair_lock_s)a3;
- (void)setLockOperation:(os_unfair_lock_s)a3;
- (void)setLockSuggestions:(os_unfair_lock_s)a3;
- (void)setMetadataOperation:(id)a3;
- (void)setObservers:(id)a3;
- (void)setPerformingOperation:(BOOL)a3;
- (void)setPerformingOverallIndexing:(BOOL)a3;
- (void)setResetCompletions:(id)a3;
- (void)setResetPending:(BOOL)a3;
- (void)setWillRequireIndexing:(BOOL)a3;
- (void)setWorldRegionAggregator:(id)a3;
- (void)setWorldRegionAggregatorCompletion:(id)a3;
- (void)statusWithCompletion:(id)a3;
- (void)transactionFetchCompletedForPassUniqueID:(id)a3;
- (void)transactionFetchInitiatedForPassUniqueID:(id)a3;
- (void)transactionSourceIdentifier:(id)a3 didReceiveTransaction:(id)a4 oldTransaction:(id)a5;
- (void)transactionSourceIdentifier:(id)a3 didRemoveTransactionWithIdentifier:(id)a4;
- (void)triggerIndexing;
- (void)worldRegionProcessingCompletedWithSuccess:(BOOL)a3;
@end

@implementation PDSpotlightIndexer

- (PDSpotlightIndexer)initWithDatabaseManager:(id)a3 transactionReceiptFileManager:(id)a4 paymentWebServiceCoordinator:(id)a5 peerPaymentWebServiceCoordinator:(id)a6 databaseRecreated:(BOOL)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a6;
  v34.receiver = self;
  v34.super_class = (Class)&OBJC_CLASS___PDSpotlightIndexer;
  v15 = -[PDSpotlightIndexer init](&v34, "init");
  v16 = v15;
  if (v15)
  {
    v15->_databaseWillRestore = a7;
    objc_storeStrong((id *)&v15->_databaseManager, a3);
    dispatch_queue_attr_t v17 = dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v18 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v17);
    dispatch_queue_attr_t v19 = dispatch_queue_attr_make_with_qos_class(v18, QOS_CLASS_UTILITY, 0);
    v20 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v19);

    dispatch_queue_t v21 = dispatch_queue_create("com.apple.passd.PDSpotlightIndexer.indexAccess", v20);
    indexAccessQueue = v16->_indexAccessQueue;
    v16->_indexAccessQueue = (OS_dispatch_queue *)v21;

    *(void *)&v16->_lockOperation._os_unfair_lock_opaque = 0LL;
    v16->_lockSuggestions._os_unfair_lock_opaque = 0;
    uint64_t v23 = objc_claimAutoreleasedReturnValue( +[NSHashTable pk_weakObjectsHashTableUsingPointerPersonality]( &OBJC_CLASS___NSHashTable,  "pk_weakObjectsHashTableUsingPointerPersonality"));
    observers = v16->_observers;
    v16->_observers = (NSHashTable *)v23;

    v25 = -[PDWorldRegionAggregator initWithDatabaseManager:]( objc_alloc(&OBJC_CLASS___PDWorldRegionAggregator),  "initWithDatabaseManager:",  v12);
    worldRegionAggregator = v16->_worldRegionAggregator;
    v16->_worldRegionAggregator = v25;

    -[PDWorldRegionAggregator addObserver:](v16->_worldRegionAggregator, "addObserver:", v16);
    objc_storeStrong((id *)&v16->_receiptFileManager, a4);
    v27 = (void *)objc_claimAutoreleasedReturnValue( +[PKPeerPaymentCounterpartHandleFormatter requiredContactKeys]( &OBJC_CLASS___PKPeerPaymentCounterpartHandleFormatter,  "requiredContactKeys"));
    v28 = objc_alloc_init(&OBJC_CLASS___CNContactStore);
    v29 = -[PKContactResolver initWithContactStore:keysToFetch:]( objc_alloc(&OBJC_CLASS___PKContactResolver),  "initWithContactStore:keysToFetch:",  v28,  v27);
    contactResolver = v16->_contactResolver;
    v16->_contactResolver = v29;

    v31 = objc_alloc_init(&OBJC_CLASS___NSCountedSet);
    initiatedTransactionFetches = v16->_initiatedTransactionFetches;
    v16->_initiatedTransactionFetches = v31;

    objc_storeStrong((id *)&v16->_peerPaymentWebServiceCoordinator, a6);
    -[PDPeerPaymentWebServiceCoordinator registerObserver:]( v16->_peerPaymentWebServiceCoordinator,  "registerObserver:",  v16);
  }

  return v16;
}

- (void)_setupXPCActivity
{
  uint64_t Object = PKLogFacilityTypeGetObject(19LL);
  v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Scheduling spotlight indexing activity", v5, 2u);
  }

  dispatch_async((dispatch_queue_t)self->_indexAccessQueue, &stru_100659678);
}

- (void)_cleanupIndexingState
{
  uint64_t Object = PKLogFacilityTypeGetObject(19LL);
  v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Cleaning up spotlight indexing state", buf, 2u);
  }

  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472LL;
  v10[2] = sub_1003902B0;
  v10[3] = &unk_1006596A0;
  v10[4] = self;
  v5 = objc_retainBlock(v10);
  ((void (*)(void *, void, uint64_t))v5[2])(v5, 0LL, 6LL);
  ((void (*)(void *, uint64_t, uint64_t))v5[2])(v5, 4LL, 3LL);
  uint64_t v6 = ((uint64_t (*)(void *, uint64_t, uint64_t))v5[2])(v5, 1LL, 11LL);
  if (PKWalletFinanceKitTransactionsEnabled(v6))
  {
    ((void (*)(void *, uint64_t, uint64_t))v5[2])(v5, 5LL, 1LL);
    ((void (*)(void *, uint64_t, uint64_t))v5[2])(v5, 6LL, 1LL);
  }

  -[PDDatabaseManager resetIndexingItems](self->_databaseManager, "resetIndexingItems");
  -[PDDatabaseManager resetVerifyingItems](self->_databaseManager, "resetVerifyingItems");
  if ((id)-[PDDatabaseManager indexingMetadataVersionForType:]( self->_databaseManager,  "indexingMetadataVersionForType:",  2LL) != (id)1)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "Region version changed: reindexing required",  buf,  2u);
    }

    -[PDDatabaseManager deleteAllRegions](self->_databaseManager, "deleteAllRegions");
    -[PDDatabaseManager updateIndexingMetadataStatus:version:forType:]( self->_databaseManager,  "updateIndexingMetadataStatus:version:forType:",  2LL,  1LL,  2LL);
    os_unfair_lock_lock(&self->_lockOperation);
    self->_willRequireIndexing = 1;
    os_unfair_lock_unlock(&self->_lockOperation);
  }

  if (PDSpotlighIndexNeedsIndexing())
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Needs full reindexing", buf, 2u);
    }

    -[PDDatabaseManager markAllIndexedContentForReindexing]( self->_databaseManager,  "markAllIndexedContentForReindexing");
    PDSetSpotlightIndexNeedsIndexing(0LL);
    os_unfair_lock_lock(&self->_lockOperation);
    self->_willRequireIndexing = 1;
    os_unfair_lock_unlock(&self->_lockOperation);
  }

  os_unfair_lock_lock(&self->_lockOperation);
  if (!self->_willRequireIndexing)
  {
    if ((id)-[PDDatabaseManager spotlightIndexingVersion](self->_databaseManager, "spotlightIndexingVersion") != (id)4)
    {
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        v9 = "Indexing version changed: reindexing required";
        goto LABEL_21;
      }

+ (BOOL)isIndexingAvailable
{
  return 0;
}

- (void)reindexAllContent
{
  unsigned __int8 v3 = objc_msgSend((id)objc_opt_class(self, a2), "isIndexingAvailable");
  uint64_t Object = PKLogFacilityTypeGetObject(19LL);
  v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
  BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);
  if ((v3 & 1) != 0)
  {
    if (v6)
    {
      *(_WORD *)v7 = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Mark all content for reindexing", v7, 2u);
    }

    -[PDDatabaseManager markAllIndexedContentForReindexing]( self->_databaseManager,  "markAllIndexedContentForReindexing");
    -[PDSpotlightIndexer _indexingStarted](self, "_indexingStarted");
    -[PDSpotlightIndexer _performIndexingOperationsWithOrigin:](self, "_performIndexingOperationsWithOrigin:", 1LL);
  }

  else
  {
    if (v6)
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "Cannot index entries. Spotlight indexing is not available.",  buf,  2u);
    }
  }

- (void)reindexContentForIdentifiers:(id)a3
{
  id v4 = a3;
  unsigned __int8 v6 = objc_msgSend((id)objc_opt_class(self, v5), "isIndexingAvailable");
  uint64_t Object = PKLogFacilityTypeGetObject(19LL);
  id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
  BOOL v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);
  if ((v6 & 1) != 0)
  {
    if (v9)
    {
      *(_DWORD *)buf = 134217984;
      id v18 = [v4 count];
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Mark %ld item(s) for reindexing", buf, 0xCu);
    }

    databaseManager = self->_databaseManager;
    v11 = _NSConcreteStackBlock;
    uint64_t v12 = 3221225472LL;
    id v13 = sub_1003906E4;
    id v14 = &unk_1006455C8;
    v15 = (os_log_s *)v4;
    v16 = self;
    -[PDDatabaseManager performTransactionWithBlock:](databaseManager, "performTransactionWithBlock:", &v11);
    os_unfair_lock_lock(&self->_lockOperation);
    self->_willRequireIndexing = 1;
    os_unfair_lock_unlock(&self->_lockOperation);
    -[PDSpotlightIndexer _performIndexingOperationsWithOrigin:]( self,  "_performIndexingOperationsWithOrigin:",  1LL,  v11,  v12,  v13,  v14);
    id v8 = v15;
  }

  else if (v9)
  {
    *(_WORD *)buf = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "Cannot index entries. Spotlight indexing is not available.",  buf,  2u);
  }
}

- (void)resetWithCompletion:(id)a3
{
  id v4 = a3;
  if (objc_msgSend((id)objc_opt_class(self, v5), "isIndexingAvailable"))
  {
    p_lockOperation = &self->_lockOperation;
    os_unfair_lock_lock(&self->_lockOperation);
    resetCompletions = self->_resetCompletions;
    if (resetCompletions)
    {
      id v8 = objc_retainBlock(v4);
      -[NSMutableArray addObject:](resetCompletions, "addObject:", v8);

      os_unfair_lock_unlock(p_lockOperation);
    }

    else
    {
      v11 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
      uint64_t v12 = self->_resetCompletions;
      self->_resetCompletions = v11;

      id v13 = self->_resetCompletions;
      id v14 = objc_retainBlock(v4);
      -[NSMutableArray addObject:](v13, "addObject:", v14);

      os_unfair_lock_unlock(&self->_lockOperation);
      -[PDSpotlightIndexer _indexingStarted](self, "_indexingStarted");
    }
  }

  else
  {
    uint64_t Object = PKLogFacilityTypeGetObject(19LL);
    v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v15 = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "Cannot delete index entries. Spotlight indexing is not available.",  v15,  2u);
    }
  }
}

- (void)_queue_completeReset
{
  p_lockOperation = &self->_lockOperation;
  os_unfair_lock_lock(&self->_lockOperation);
  self->_performingOperation = 1;
  self->_hasCompletedIndexingSetup = 0;
  os_unfair_lock_unlock(p_lockOperation);
  -[PDDatabaseManager resetIndexedContent](self->_databaseManager, "resetIndexedContent");
}

- (void)triggerIndexing
{
}

- (BOOL)willRequireIndexing
{
  p_lockOperation = &self->_lockOperation;
  os_unfair_lock_lock(&self->_lockOperation);
  if (self->_willRequireIndexing) {
    BOOL v4 = 1;
  }
  else {
    BOOL v4 = -[PDWorldRegionAggregator willRequireProcessing](self->_worldRegionAggregator, "willRequireProcessing");
  }
  os_unfair_lock_unlock(p_lockOperation);
  return v4;
}

- (BOOL)isIndexing
{
  v2 = self;
  p_lockOperation = &self->_lockOperation;
  os_unfair_lock_lock(&self->_lockOperation);
  LOBYTE(v2) = v2->_performingOverallIndexing;
  os_unfair_lock_unlock(p_lockOperation);
  return (char)v2;
}

- (void)_indexingStarted
{
  p_lockOperation = &self->_lockOperation;
  os_unfair_lock_lock(&self->_lockOperation);
  BOOL performingOverallIndexing = self->_performingOverallIndexing;
  self->_BOOL performingOverallIndexing = 1;
  os_unfair_lock_unlock(p_lockOperation);
  if (!performingOverallIndexing) {
    -[PDSpotlightIndexer _accessObserversWithHandler:](self, "_accessObserversWithHandler:", &stru_1006596E0);
  }
}

- (void)_indexingCompleted
{
  p_lockOperation = &self->_lockOperation;
  os_unfair_lock_lock(&self->_lockOperation);
  BOOL performingOverallIndexing = self->_performingOverallIndexing;
  self->_BOOL performingOverallIndexing = 0;
  self->_willRequireIndexing = 0;
  os_unfair_lock_unlock(p_lockOperation);
  if (performingOverallIndexing) {
    -[PDSpotlightIndexer _accessObserversWithHandler:](self, "_accessObserversWithHandler:", &stru_100659700);
  }
}

- (void)_checkConsistencyWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init(&OBJC_CLASS___PKAsyncUnaryOperationComposer);
  uint64_t Object = PKLogFacilityTypeGetObject(19LL);
  v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "Marking any missing items as needing reindexing...",  buf,  2u);
  }

  *(void *)buf = 0LL;
  v24 = buf;
  uint64_t v25 = 0x2020000000LL;
  char v26 = 0;
  __int128 v19 = 0u;
  __int128 v20 = 0u;
  __int128 v21 = 0u;
  __int128 v22 = 0u;
  id v8 = [&off_1006911C0 countByEnumeratingWithState:&v19 objects:v27 count:16];
  if (v8)
  {
    uint64_t v9 = *(void *)v20;
    do
    {
      for (i = 0LL; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v20 != v9) {
          objc_enumerationMutation(&off_1006911C0);
        }
        uint64_t v11 = *(void *)(*((void *)&v19 + 1) + 8LL * (void)i);
        v18[0] = _NSConcreteStackBlock;
        v18[1] = 3221225472LL;
        v18[2] = sub_100390E4C;
        v18[3] = &unk_10063B5A8;
        v18[4] = self;
        v18[5] = v11;
        v18[6] = buf;
        [v5 addOperation:v18];
      }

      id v8 = [&off_1006911C0 countByEnumeratingWithState:&v19 objects:v27 count:16];
    }

    while (v8);
  }

  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSNull null](&OBJC_CLASS___NSNull, "null"));
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472LL;
  v15[2] = sub_100390F38;
  v15[3] = &unk_100647710;
  dispatch_queue_attr_t v17 = buf;
  id v13 = v4;
  id v16 = v13;
  id v14 = [v5 evaluateWithInput:v12 completion:v15];

  _Block_object_dispose(buf, 8);
}

- (void)_checkConsistencyForItemsOfType:(unint64_t)a3 withCompletion:(id)a4
{
}

- (void)_performIndexingOperationsWithOrigin:(unint64_t)a3
{
  uint64_t Object = PKLogFacilityTypeGetObject(19LL);
  unsigned __int8 v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 134217984;
    *(void *)((char *)&buf + 4) = a3;
    _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "Performing indexing operations with origin %lu",  (uint8_t *)&buf,  0xCu);
  }

  unsigned __int8 v7 = -[PDSpotlightIndexer willRequireIndexing](self, "willRequireIndexing");
  os_unfair_lock_lock(&self->_lockOperation);
  if (self->_performingOperation)
  {
    os_unfair_lock_unlock(&self->_lockOperation);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(buf) = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "Indexing operations cancelled, we're already performing operations",  (uint8_t *)&buf,  2u);
    }
  }

  else
  {
    self->_performingOperation = 1;
    os_unfair_lock_unlock(&self->_lockOperation);
    if ((v7 & 1) != 0) {
      -[PDSpotlightIndexer _indexingStarted](self, "_indexingStarted");
    }
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(buf) = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "Indexing operation pending",  (uint8_t *)&buf,  2u);
    }

    *(void *)&__int128 buf = 0LL;
    *((void *)&buf + 1) = &buf;
    uint64_t v22 = 0x3032000000LL;
    uint64_t v23 = sub_100391304;
    v24 = sub_100391314;
    id v25 = (id)PDOSTransactionCreate("PDSpotlightIndexer.indexing");
    v20[0] = _NSConcreteStackBlock;
    v20[1] = 3221225472LL;
    v20[2] = sub_10039131C;
    v20[3] = &unk_100659778;
    v20[5] = &buf;
    v20[6] = a3;
    v20[4] = self;
    id v8 = objc_retainBlock(v20);
    uint64_t v9 = v8;
    if (a3 == 2)
    {
      indexAccessQueue = self->_indexAccessQueue;
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472LL;
      block[2] = sub_100391FB0;
      block[3] = &unk_10063A830;
      uint64_t v11 = (id *)&v19;
      __int128 v19 = v8;
      uint64_t v12 = v8;
      dispatch_async((dispatch_queue_t)indexAccessQueue, block);
    }

    else
    {
      dispatch_time_t v13 = dispatch_time(0LL, 5000000000LL);
      id v14 = self->_indexAccessQueue;
      v16[0] = _NSConcreteStackBlock;
      v16[1] = 3221225472LL;
      v16[2] = sub_100391FBC;
      v16[3] = &unk_10063A830;
      uint64_t v11 = &v17;
      dispatch_queue_attr_t v17 = v9;
      id v15 = v9;
      dispatch_after(v13, (dispatch_queue_t)v14, v16);
    }

    _Block_object_dispose(&buf, 8);
  }

- (void)statusWithCompletion:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    os_unfair_lock_lock(&self->_lockOperation);
    BOOL v5 = self->_metadataOperation != 0LL;
    BOOL v6 = self->_indexingOperation != 0LL;
    os_unfair_lock_unlock(&self->_lockOperation);
    v33 = (void *)objc_claimAutoreleasedReturnValue( -[PDDatabaseManager indexerItemCountsOfType:]( self->_databaseManager,  "indexerItemCountsOfType:",  0LL));
    v31 = (void *)objc_claimAutoreleasedReturnValue( -[PDDatabaseManager indexerItemCountsOfType:]( self->_databaseManager,  "indexerItemCountsOfType:",  4LL));
    v30 = (void *)objc_claimAutoreleasedReturnValue( -[PDDatabaseManager indexerItemCountsOfType:]( self->_databaseManager,  "indexerItemCountsOfType:",  1LL));
    v29 = (void *)objc_claimAutoreleasedReturnValue( -[PDDatabaseManager indexerItemCountsOfType:]( self->_databaseManager,  "indexerItemCountsOfType:",  5LL));
    v28 = (void *)objc_claimAutoreleasedReturnValue( -[PDDatabaseManager indexerItemCountsOfType:]( self->_databaseManager,  "indexerItemCountsOfType:",  6LL));
    unsigned __int8 v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSLocale currentLocale](&OBJC_CLASS___NSLocale, "currentLocale"));
    id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 localeIdentifier]);

    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue( -[PDDatabaseManager regionsMissingLocalizedContentForLocaleIdentifier:]( self->_databaseManager,  "regionsMissingLocalizedContentForLocaleIdentifier:",  v8));
    id v27 = [v9 count];

    v10 = (void *)objc_claimAutoreleasedReturnValue( -[PDDatabaseManager regionsOfType:localeIdentifier:]( self->_databaseManager,  "regionsOfType:localeIdentifier:",  0LL,  v8));
    id v26 = [v10 count];

    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue( -[PDDatabaseManager regionsOfType:localeIdentifier:]( self->_databaseManager,  "regionsOfType:localeIdentifier:",  1LL,  v8));
    id v25 = [v11 count];

    v32 = v4;
    uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue( -[PDDatabaseManager regionsOfType:localeIdentifier:]( self->_databaseManager,  "regionsOfType:localeIdentifier:",  2LL,  v8));
    id v24 = [v12 count];

    dispatch_time_t v13 = (void *)objc_claimAutoreleasedReturnValue( -[PDDatabaseManager regionsOfType:localeIdentifier:]( self->_databaseManager,  "regionsOfType:localeIdentifier:",  3LL,  v8));
    id v14 = [v13 count];

    id v15 = (void *)objc_claimAutoreleasedReturnValue( -[PDDatabaseManager regionsOfType:localeIdentifier:]( self->_databaseManager,  "regionsOfType:localeIdentifier:",  4LL,  v8));
    id v16 = [v15 count];

    dispatch_queue_attr_t v17 = (void *)objc_claimAutoreleasedReturnValue( -[PDDatabaseManager transactionsMissingWorldRegionWithLimit:onlyEligibleForProcessing:]( self->_databaseManager,  "transactionsMissingWorldRegionWithLimit:onlyEligibleForProcessing:",  0LL,  0LL));
    id v18 = [v17 count];

    v34[0] = _NSConcreteStackBlock;
    v34[1] = 3221225472LL;
    v34[2] = sub_1003922BC;
    v34[3] = &unk_1006597A0;
    BOOL v48 = v5;
    BOOL v49 = v6;
    id v35 = v33;
    id v36 = v31;
    id v37 = v30;
    id v38 = v29;
    id v39 = v28;
    id v41 = v26;
    id v42 = v25;
    id v43 = v24;
    id v44 = v14;
    id v4 = v32;
    id v45 = v16;
    id v46 = v27;
    id v47 = v18;
    id v40 = v32;
    id v19 = v28;
    id v20 = v29;
    id v21 = v30;
    id v22 = v31;
    id v23 = v33;
    -[PDSpotlightIndexer _indexedItemCountsWithCompletion:](self, "_indexedItemCountsWithCompletion:", v34);
  }
}

- (void)_indexedItemCountsWithCompletion:(id)a3
{
  id v4 = a3;
  v27[0] = 0LL;
  v27[1] = v27;
  v27[2] = 0x2020000000LL;
  v27[3] = 0LL;
  v26[0] = 0LL;
  v26[1] = v26;
  v26[2] = 0x2020000000LL;
  v26[3] = 0LL;
  v25[0] = 0LL;
  v25[1] = v25;
  v25[2] = 0x2020000000LL;
  v25[3] = 0LL;
  v23[0] = 0LL;
  v23[1] = v23;
  v23[2] = 0x3032000000LL;
  v23[3] = sub_100391304;
  v23[4] = sub_100391314;
  id v24 = 0LL;
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472LL;
  v16[2] = sub_10039295C;
  v16[3] = &unk_100659818;
  id v5 = objc_alloc_init(&OBJC_CLASS___PKAsyncUnaryOperationComposer);
  id v17 = v5;
  id v18 = self;
  id v19 = v27;
  id v20 = v26;
  id v21 = v25;
  id v22 = v23;
  BOOL v6 = objc_retainBlock(v16);
  ((void (*)(void *, void, uint64_t))v6[2])(v6, PKTransactionDataTypeIdentifier, 1LL);
  ((void (*)(void *, void, void))v6[2])(v6, PKPassDataTypeIdentifier, 0LL);
  ((void (*)(void *, void, uint64_t))v6[2])(v6, PKPassDetailDataTypeIdentifier, 4LL);
  unsigned __int8 v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNull null](&OBJC_CLASS___NSNull, "null"));
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472LL;
  v10[2] = sub_100392B7C;
  v10[3] = &unk_100659840;
  id v8 = v4;
  id v11 = v8;
  uint64_t v12 = v27;
  dispatch_time_t v13 = v26;
  id v14 = v25;
  id v15 = v23;
  id v9 = [v5 evaluateWithInput:v7 completion:v10];

  _Block_object_dispose(v23, 8);
  _Block_object_dispose(v25, 8);
  _Block_object_dispose(v26, 8);
  _Block_object_dispose(v27, 8);
}

- (void)_performQueryWithQueryString:(id)a3 completion:(id)a4
{
  if (a4) {
    (*((void (**)(id, void, void))a4 + 2))(a4, 0LL, 0LL);
  }
}

- (void)resetRegions
{
  *(_WORD *)&self->_hasCompletedIndexingSetup = 256;
  uint64_t Object = PKLogFacilityTypeGetObject(19LL);
  id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Region reset requested.", v5, 2u);
  }

  os_unfair_lock_unlock(&self->_lockOperation);
  -[PDSpotlightIndexer resetWithCompletion:](self, "resetWithCompletion:", &stru_100659860);
}

- (void)resetCoordinatesForAllRegions
{
  self->_hasCompletedIndexingSetup = 0;
  os_unfair_lock_unlock(&self->_lockOperation);
}

- (void)_queue_fetchPassesMetadataWithCompletion:(id)a3
{
  id v4 = (void (**)(id, void))a3;
  uint64_t v21 = 0LL;
  id v22 = &v21;
  uint64_t v23 = 0x2020000000LL;
  unint64_t v24 = -[PDDatabaseManager indexingMetadataStatusForType:]( self->_databaseManager,  "indexingMetadataStatusForType:",  0LL);
  uint64_t v17 = 0LL;
  id v18 = &v17;
  uint64_t v19 = 0x2020000000LL;
  unint64_t v20 = -[PDDatabaseManager indexingMetadataStatusForType:]( self->_databaseManager,  "indexingMetadataStatusForType:",  4LL);
  uint64_t v5 = v22[3];
  BOOL v6 = v5 == 0;
  unsigned __int8 v7 = v18;
  uint64_t v8 = v18[3];
  BOOL v9 = v8 == 0;
  if (v5) {
    BOOL v10 = v8 == 0;
  }
  else {
    BOOL v10 = 1;
  }
  if (v10)
  {
    -[PDSpotlightIndexer _indexingStarted](self, "_indexingStarted");
    databaseManager = self->_databaseManager;
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472LL;
    v13[2] = sub_100392EAC;
    v13[3] = &unk_100659888;
    BOOL v15 = v6;
    v13[4] = self;
    v13[5] = &v21;
    BOOL v16 = v9;
    v13[6] = &v17;
    __int128 v14 = xmmword_1004D7840;
    -[PDDatabaseManager performTransactionWithBlock:](databaseManager, "performTransactionWithBlock:", v13);
    if (!v4) {
      goto LABEL_12;
    }
  }

  else
  {
    v22[3] = 2LL;
    v7[3] = 2LL;
    if (!v4) {
      goto LABEL_12;
    }
  }

  uint64_t v12 = v22[3];
  if (v12 == 2) {
    uint64_t v12 = v18[3];
  }
  v4[2](v4, v12);
LABEL_12:
  _Block_object_dispose(&v17, 8);
  _Block_object_dispose(&v21, 8);
}

- (void)_queue_fetchFinanceKitTransactionsMetadataWithCompletion:(id)a3
{
  if (a3) {
    (*((void (**)(id, uint64_t))a3 + 2))(a3, 2LL);
  }
}

- (void)_queue_fetchFinanceKitAccountsMetadataWithCompletion:(id)a3
{
  if (a3) {
    (*((void (**)(id, uint64_t))a3 + 2))(a3, 2LL);
  }
}

- (void)_queue_fetchTransactionsMetadataWithCompletion:(id)a3
{
  id v4 = (void (**)(id, uint64_t))a3;
  uint64_t v13 = 0LL;
  __int128 v14 = &v13;
  uint64_t v15 = 0x2020000000LL;
  unint64_t v16 = -[PDDatabaseManager indexingMetadataStatusForType:]( self->_databaseManager,  "indexingMetadataStatusForType:",  1LL);
  if (v14[3])
  {
    v14[3] = 2LL;
    if (v4) {
      v4[2](v4, 2LL);
    }
  }

  else
  {
    -[PDSpotlightIndexer _indexingStarted](self, "_indexingStarted");
    uint64_t Object = PKLogFacilityTypeGetObject(19LL);
    BOOL v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)__int128 buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Updating transactions metadata", buf, 2u);
    }

    v14[3] = 1LL;
    -[PDDatabaseManager updateIndexingMetadataStatus:version:forType:]( self->_databaseManager,  "updateIndexingMetadataStatus:version:forType:",  1LL,  11LL,  1LL);
    databaseManager = self->_databaseManager;
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472LL;
    v8[2] = sub_100393278;
    v8[3] = &unk_1006598D0;
    v8[4] = self;
    BOOL v10 = &v13;
    uint64_t v11 = 11LL;
    BOOL v9 = v4;
    -[PDDatabaseManager allPassTransactionIdentifiersWithBatchHandler:]( databaseManager,  "allPassTransactionIdentifiersWithBatchHandler:",  v8);
  }

  _Block_object_dispose(&v13, 8);
}

- (id)_processMissingTransactionswithIdentifiers:(id)a3 spotlightItems:(id)a4 itemsToDelete:(id)a5 regions:(id *)a6 tags:(id *)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v27 = (id)objc_claimAutoreleasedReturnValue( -[PDDatabaseManager paymentTransactionsWithIdentifiers:regions:tags:]( self->_databaseManager,  "paymentTransactionsWithIdentifiers:regions:tags:",  v12,  a6,  a7));
  id v15 = objc_msgSend(v27, "pk_createSetByApplyingBlock:", &stru_100659910);
  v29 = v12;
  id v16 = [v12 mutableCopy];
  v28 = v15;
  [v16 minusSet:v15];
  __int128 v32 = 0u;
  __int128 v33 = 0u;
  __int128 v30 = 0u;
  __int128 v31 = 0u;
  id v17 = v16;
  id v18 = [v17 countByEnumeratingWithState:&v30 objects:v36 count:16];
  if (v18)
  {
    id v19 = v18;
    uint64_t v20 = *(void *)v31;
    do
    {
      for (i = 0LL; i != v19; i = (char *)i + 1)
      {
        if (*(void *)v31 != v20) {
          objc_enumerationMutation(v17);
        }
        uint64_t v22 = *(void *)(*((void *)&v30 + 1) + 8LL * (void)i);
        uint64_t Object = PKLogFacilityTypeGetObject(19LL);
        unint64_t v24 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
        if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)__int128 buf = 138412290;
          uint64_t v35 = v22;
          _os_log_impl( (void *)&_mh_execute_header,  v24,  OS_LOG_TYPE_DEFAULT,  "Transaction %@ no longer exists, delete from indexing",  buf,  0xCu);
        }

        id v25 = (void *)objc_claimAutoreleasedReturnValue([v13 objectForKey:v22]);
        if (v25)
        {
          [v14 addObject:v25];
        }

        else
        {
          if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)__int128 buf = 138412290;
            uint64_t v35 = v22;
            _os_log_impl( (void *)&_mh_execute_header,  v24,  OS_LOG_TYPE_DEFAULT,  "Transaction %@ not matched to a spotlight item, could not delete",  buf,  0xCu);
          }
        }
      }

      id v19 = [v17 countByEnumeratingWithState:&v30 objects:v36 count:16];
    }

    while (v19);
  }

  return v27;
}

- (BOOL)_supportsCardInformationItemForPass:(id)a3
{
  id v4 = a3;
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([v4 paymentPass]);

  if (v5)
  {
    BOOL v6 = (void *)objc_claimAutoreleasedReturnValue([v4 paymentPass]);
    databaseManager = self->_databaseManager;
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v6 associatedAccountServiceAccountIdentifier]);
    BOOL v9 = (void *)objc_claimAutoreleasedReturnValue(-[PDDatabaseManager accountWithIdentifier:](databaseManager, "accountWithIdentifier:", v8));

    if ([v9 feature] == (id)2) {
      unsigned __int8 v10 = [v9 supportsShowVirtualCard];
    }
    else {
      unsigned __int8 v10 = 0;
    }
  }

  else
  {
    unsigned __int8 v10 = 0;
  }

  return v10;
}

- (void)passAddedOrUpdated:(id)a3
{
}

- (void)passDidDisappear:(id)a3
{
  id v4 = a3;
  unsigned int v6 = objc_msgSend((id)objc_opt_class(self, v5), "isIndexingAvailable");
  uint64_t Object = PKLogFacilityTypeGetObject(0LL);
  uint64_t v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v10[0] = 67109378;
    v10[1] = v6;
    __int16 v11 = 2112;
    id v12 = v4;
    _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "PDSpotlightIndexer passDidDisappear isIndexingAvailable: %d; pass: %@",
      (uint8_t *)v10,
      0x12u);
  }

  if (v4) {
    unsigned int v9 = v6;
  }
  else {
    unsigned int v9 = 0;
  }
  if (v9 == 1) {
    -[PDSpotlightIndexer _performIndexingOperationsWithOrigin:](self, "_performIndexingOperationsWithOrigin:", 1LL);
  }
}

- (void)transactionFetchInitiatedForPassUniqueID:(id)a3
{
  id v6 = a3;
  unsigned int v5 = objc_msgSend((id)objc_opt_class(self, v4), "isIndexingAvailable");
  if (v6 && v5)
  {
    os_unfair_lock_lock(&self->_lockSuggestions);
    -[NSCountedSet addObject:](self->_initiatedTransactionFetches, "addObject:", v6);
    os_unfair_lock_unlock(&self->_lockSuggestions);
  }
}

- (void)transactionFetchCompletedForPassUniqueID:(id)a3
{
  id v4 = a3;
  uint64_t Object = PKLogFacilityTypeGetObject(19LL);
  id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v12 = 138412290;
    id v13 = v4;
    _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "PDSpotlightIndexer transactionFetchCompletedForPassUniqueID: %@",  (uint8_t *)&v12,  0xCu);
  }

  unsigned int v8 = objc_msgSend((id)objc_opt_class(self, v7), "isIndexingAvailable");
  if (v4 && v8)
  {
    unsigned int v9 = (void *)objc_claimAutoreleasedReturnValue( -[PDDatabaseManager associatedAccountIdentifierForPassWithUniqueIdentifier:]( self->_databaseManager,  "associatedAccountIdentifierForPassWithUniqueIdentifier:",  v4));

    if (v9)
    {
      unsigned __int8 v10 = (void *)objc_claimAutoreleasedReturnValue(-[PDDatabaseManager dbPeerPaymentAccount](self->_databaseManager, "dbPeerPaymentAccount"));
      __int16 v11 = (void *)objc_claimAutoreleasedReturnValue([v10 associatedPassUniqueID]);

      if (v11) {
        -[PDDatabaseManager updateIndexerItemsWithDomainIdentifier:type:status:error:]( self->_databaseManager,  "updateIndexerItemsWithDomainIdentifier:type:status:error:",  v11,  1LL,  0LL,  0LL);
      }
    }

    os_unfair_lock_lock(&self->_lockSuggestions);
    -[NSCountedSet removeObject:](self->_initiatedTransactionFetches, "removeObject:", v4);
    os_unfair_lock_unlock(&self->_lockSuggestions);
    -[PDSpotlightIndexer triggerIndexing](self, "triggerIndexing");
  }
}

- (void)transactionSourceIdentifier:(id)a3 didRemoveTransactionWithIdentifier:(id)a4
{
  id v8 = (id)objc_claimAutoreleasedReturnValue( -[PDDatabaseManager passUniqueIdentifierForTransactionSourceIdentifier:includingAccountUsers:]( self->_databaseManager,  "passUniqueIdentifierForTransactionSourceIdentifier:includingAccountUsers:",  a3,  1LL));
  unsigned int v7 = objc_msgSend((id)objc_opt_class(self, v6), "isIndexingAvailable");
  if (a4 && v7 && v8) {
    -[PDSpotlightIndexer _performIndexingOperationsWithOrigin:](self, "_performIndexingOperationsWithOrigin:", 1LL);
  }
}

- (void)transactionSourceIdentifier:(id)a3 didReceiveTransaction:(id)a4 oldTransaction:(id)a5
{
  id v7 = a4;
  id v8 = (void *)objc_claimAutoreleasedReturnValue( -[PDDatabaseManager passUniqueIdentifierForTransactionSourceIdentifier:includingAccountUsers:]( self->_databaseManager,  "passUniqueIdentifierForTransactionSourceIdentifier:includingAccountUsers:",  a3,  1LL));
  unsigned int v10 = objc_msgSend((id)objc_opt_class(self, v9), "isIndexingAvailable");
  if (v7 && v10 && v8)
  {
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472LL;
    v12[2] = sub_100393B4C;
    v12[3] = &unk_10063B720;
    unsigned __int8 v13 = [v7 updateReasonIsInitialDownload];
    v12[4] = self;
    __int16 v11 = objc_retainBlock(v12);
    ((void (*)(void))v11[2])();
  }
}

- (void)accountManager:(id)a3 didAddAccountEvent:(id)a4
{
  id v5 = a4;
  id v6 = [v5 updateReasonIsInitialDownload];
  if ([v5 type] == (id)4)
  {
    uint64_t Object = PKLogFacilityTypeGetObject(19LL);
    id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)__int128 buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Added Account Event of type dispute", buf, 2u);
    }

    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472LL;
    v9[2] = sub_100393C44;
    v9[3] = &unk_10063B720;
    char v10 = (char)v6;
    v9[4] = self;
    -[PDSpotlightIndexer _updateFinHealthAccountEvent:deferFeatureComputation:completion:]( self,  "_updateFinHealthAccountEvent:deferFeatureComputation:completion:",  v5,  v6,  v9);
  }
}

- (void)accountManager:(id)a3 didUpdateAccountEvent:(id)a4
{
  id v5 = a4;
  id v6 = [v5 updateReasonIsInitialDownload];
  if ([v5 type] == (id)4)
  {
    uint64_t Object = PKLogFacilityTypeGetObject(19LL);
    id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)__int128 buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "Updated Account Event of type dispute",  buf,  2u);
    }

    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472LL;
    v9[2] = sub_100393D3C;
    v9[3] = &unk_10063B720;
    char v10 = (char)v6;
    v9[4] = self;
    -[PDSpotlightIndexer _updateFinHealthAccountEvent:deferFeatureComputation:completion:]( self,  "_updateFinHealthAccountEvent:deferFeatureComputation:completion:",  v5,  v6,  v9);
  }
}

- (void)accountManager:(id)a3 didAddAccount:(id)a4
{
  id v5 = a4;
  uint64_t Object = PKLogFacilityTypeGetObject(19LL);
  id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    id v8 = (void *)objc_claimAutoreleasedReturnValue([v5 accountIdentifier]);
    int v9 = 138412290;
    char v10 = v8;
    _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "PDSpotlightIndexer: Received received add account: %@",  (uint8_t *)&v9,  0xCu);
  }

  -[PDSpotlightIndexer _processAccountUpdate:didRemove:](self, "_processAccountUpdate:didRemove:", v5, 0LL);
}

- (void)accountManager:(id)a3 didUpdateAccount:(id)a4 oldAccount:(id)a5
{
  id v6 = a4;
  uint64_t Object = PKLogFacilityTypeGetObject(19LL);
  id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = (void *)objc_claimAutoreleasedReturnValue([v6 accountIdentifier]);
    int v10 = 138412290;
    __int16 v11 = v9;
    _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "PDSpotlightIndexer: Received received update account: %@",  (uint8_t *)&v10,  0xCu);
  }

  -[PDSpotlightIndexer _processAccountUpdate:didRemove:](self, "_processAccountUpdate:didRemove:", v6, 0LL);
}

- (void)accountManager:(id)a3 didRemoveAccount:(id)a4
{
  id v5 = a4;
  uint64_t Object = PKLogFacilityTypeGetObject(19LL);
  id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    id v8 = (void *)objc_claimAutoreleasedReturnValue([v5 accountIdentifier]);
    int v9 = 138412290;
    int v10 = v8;
    _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "PDSpotlightIndexer: Received received remove account: %@",  (uint8_t *)&v9,  0xCu);
  }

  -[PDSpotlightIndexer _processAccountUpdate:didRemove:](self, "_processAccountUpdate:didRemove:", v5, 1LL);
}

- (void)peerPaymentAccountDidUpdate:(id)a3
{
  uint64_t Object = PKLogFacilityTypeGetObject(19LL);
  id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = (void *)objc_claimAutoreleasedReturnValue([a3 identifier]);
    int v7 = 138412290;
    id v8 = v6;
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "PDSpotlightIndexer: Received received update peer payment account: %@",  (uint8_t *)&v7,  0xCu);
  }
}

- (void)paymentWebServiceCoordinator:(id)a3 didDownloadTransactionReceipt:(id)a4 forTransactionWithIdentifier:(id)a5
{
  id v9 = (id)objc_claimAutoreleasedReturnValue( -[PDDatabaseManager passUniqueIdentifierForTransactionWithIdentifier:]( self->_databaseManager,  "passUniqueIdentifierForTransactionWithIdentifier:",  a5,  a4));
  unsigned int v8 = objc_msgSend((id)objc_opt_class(self, v7), "isIndexingAvailable");
  if (a5 && v8 && v9) {
    -[PDSpotlightIndexer _performIndexingOperationsWithOrigin:](self, "_performIndexingOperationsWithOrigin:", 1LL);
  }
}

- (void)performScheduledActivityWithIdentifier:(id)a3 activityCriteria:(id)a4
{
}

- (void)deleteAllFinHealthDataWithCompletion:(id)a3
{
  if (a3) {
    (*((void (**)(id))a3 + 2))(a3);
  }
}

- (void)_updateFinHealthAccountEvent:(id)a3 deferFeatureComputation:(BOOL)a4 completion:(id)a5
{
  if (a5) {
    (*((void (**)(id))a5 + 2))(a5);
  }
}

- (void)worldRegionProcessingCompletedWithSuccess:(BOOL)a3
{
  indexAccessQueue = self->_indexAccessQueue;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = sub_1003941AC;
  v4[3] = &unk_10063B720;
  v4[4] = self;
  BOOL v5 = a3;
  dispatch_async((dispatch_queue_t)indexAccessQueue, v4);
}

- (void)placemarkFound:(id)a3 forTransaction:(id)a4
{
}

- (id)updateRegionWithIdentifier:(id)a3 localizedName:(id)a4 boundingRegion:(id *)a5 mapsIdentifier:(unint64_t)a6 providerIdentifier:(int)a7
{
  return -[PDWorldRegionAggregator updateRegionWithIdentifier:localizedName:boundingRegion:mapsIdentifier:providerIdentifier:]( self->_worldRegionAggregator,  "updateRegionWithIdentifier:localizedName:boundingRegion:mapsIdentifier:providerIdentifier:",  a3,  a4,  a5,  a6,  *(void *)&a7);
}

- (void)addObserver:(id)a3
{
  if (a3)
  {
    p_lockObservers = &self->_lockObservers;
    id v5 = a3;
    os_unfair_lock_lock(p_lockObservers);
    -[NSHashTable addObject:](self->_observers, "addObject:", v5);

    os_unfair_lock_unlock(p_lockObservers);
  }

- (void)removeObserver:(id)a3
{
  if (a3)
  {
    p_lockObservers = &self->_lockObservers;
    id v5 = a3;
    os_unfair_lock_lock(p_lockObservers);
    -[NSHashTable removeObject:](self->_observers, "removeObject:", v5);

    os_unfair_lock_unlock(p_lockObservers);
  }

- (void)_accessObserversWithHandler:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    p_lockObservers = &self->_lockObservers;
    os_unfair_lock_lock(&self->_lockObservers);
    id v6 = (void *)objc_claimAutoreleasedReturnValue(-[NSHashTable allObjects](self->_observers, "allObjects"));
    os_unfair_lock_unlock(p_lockObservers);
    id v7 = PDUtilityQueue();
    unsigned int v8 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(v7);
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472LL;
    _DWORD v10[2] = sub_100394384;
    v10[3] = &unk_10063AC90;
    id v11 = v6;
    id v12 = v4;
    id v9 = v6;
    dispatch_async(v8, v10);
  }
}

- (void)databaseRestored
{
  if (self->_databaseWillRestore)
  {
    self->_databaseWillRestore = 0;
    uint64_t Object = PKLogFacilityTypeGetObject(19LL);
    id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v5 = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "Database restored, deleting all FinHealth data",  v5,  2u);
    }

    -[PDSpotlightIndexer deleteAllFinHealthDataWithCompletion:]( self,  "deleteAllFinHealthDataWithCompletion:",  &stru_100659930);
  }

  else
  {
    __break(1u);
  }

- (PDWorldRegionAggregator)worldRegionAggregator
{
  return self->_worldRegionAggregator;
}

- (void)setWorldRegionAggregator:(id)a3
{
}

- (PKCancelable)metadataOperation
{
  return self->_metadataOperation;
}

- (void)setMetadataOperation:(id)a3
{
}

- (PKCancelable)indexingOperation
{
  return self->_indexingOperation;
}

- (void)setIndexingOperation:(id)a3
{
}

- (BOOL)performingOperation
{
  return self->_performingOperation;
}

- (void)setPerformingOperation:(BOOL)a3
{
  self->_performingOperation = a3;
}

- (BOOL)performingOverallIndexing
{
  return self->_performingOverallIndexing;
}

- (void)setPerformingOverallIndexing:(BOOL)a3
{
  self->_BOOL performingOverallIndexing = a3;
}

- (BOOL)resetPending
{
  return self->_resetPending;
}

- (void)setResetPending:(BOOL)a3
{
  self->_resetPending = a3;
}

- (NSMutableArray)resetCompletions
{
  return self->_resetCompletions;
}

- (void)setResetCompletions:(id)a3
{
}

- (BOOL)hasCompletedIndexingSetup
{
  return self->_hasCompletedIndexingSetup;
}

- (void)setHasCompletedIndexingSetup:(BOOL)a3
{
  self->_hasCompletedIndexingSetup = a3;
}

- (void)setWillRequireIndexing:(BOOL)a3
{
  self->_willRequireIndexing = a3;
}

- (os_unfair_lock_s)lockOperation
{
  return self->_lockOperation;
}

- (void)setLockOperation:(os_unfair_lock_s)a3
{
  self->_lockOperation = a3;
}

- (NSHashTable)observers
{
  return self->_observers;
}

- (void)setObservers:(id)a3
{
}

- (os_unfair_lock_s)lockObservers
{
  return self->_lockObservers;
}

- (void)setLockObservers:(os_unfair_lock_s)a3
{
  self->_lockObservers = a3;
}

- (os_unfair_lock_s)lockSuggestions
{
  return self->_lockSuggestions;
}

- (void)setLockSuggestions:(os_unfair_lock_s)a3
{
  self->_lockSuggestions = a3;
}

- (id)worldRegionAggregatorCompletion
{
  return self->_worldRegionAggregatorCompletion;
}

- (void)setWorldRegionAggregatorCompletion:(id)a3
{
}

- (id)featuresCompletion
{
  return self->_featuresCompletion;
}

- (void)setFeaturesCompletion:(id)a3
{
}

- (PKContactResolver)contactResolver
{
  return self->_contactResolver;
}

- (void)setContactResolver:(id)a3
{
}

- (NSCountedSet)initiatedTransactionFetches
{
  return self->_initiatedTransactionFetches;
}

- (void)setInitiatedTransactionFetches:(id)a3
{
}

- (BOOL)databaseWillRestore
{
  return self->_databaseWillRestore;
}

- (void)setDatabaseWillRestore:(BOOL)a3
{
  self->_databaseWillRestore = a3;
}

- (PDDatabaseManager)databaseManager
{
  return self->_databaseManager;
}

- (PDTransactionReceiptFileManager)receiptFileManager
{
  return self->_receiptFileManager;
}

- (PDPaymentWebServiceCoordinator)paymentWebServiceCoordinator
{
  return self->_paymentWebServiceCoordinator;
}

- (PDPeerPaymentWebServiceCoordinator)peerPaymentWebServiceCoordinator
{
  return self->_peerPaymentWebServiceCoordinator;
}

- (OS_dispatch_queue)indexAccessQueue
{
  return self->_indexAccessQueue;
}

- (void).cxx_destruct
{
}

@end