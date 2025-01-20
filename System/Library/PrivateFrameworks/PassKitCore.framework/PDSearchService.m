@interface PDSearchService
- (BOOL)_currentQuerySupportsCategory:(int64_t)a3;
- (BOOL)_currentQuerySupportsDateTokenWithStartDate:(id)a3 endDate:(id)a4;
- (BOOL)_currentQuerySupportsPeerPaymentSubTypeToken:(int64_t)a3;
- (BOOL)_currentQuerySupportsRewardsToken:(id)a3;
- (BOOL)_currentQuerySupportsTagToken:(id)a3;
- (BOOL)_currentQuerySupportsTransactionSourceToken:(unint64_t)a3;
- (BOOL)_currentQuerySupportsTransactionStatusToken:(int64_t)a3;
- (BOOL)_currentQuerySupportsTransactionTypeToken:(int64_t)a3;
- (PDAccountManager)accountManager;
- (PDDatabaseManager)databaseManager;
- (PDFamilyCircleManager)familyCircleManager;
- (PDSearchService)initWithConnection:(id)a3;
- (PDSearchService)initWithConnection:(id)a3 server:(id)a4;
- (PDSpotlightIndexer)indexer;
- (id)_transactionRequestForCurrentFilters;
- (id)createCurrentNotificationRegistrationState;
- (void)_addWord:(id)a3 forEntry:(id)a4;
- (void)_buildInvertedIndexWithCompletion:(id)a3;
- (void)_indexString:(id)a3 forEntry:(id)a4;
- (void)_queue_performCurrentQuery;
- (void)_sendInvalidationCallback;
- (void)accountManager:(id)a3 accountUsersChanged:(id)a4 oldUsers:(id)a5 accountIdentifier:(id)a6;
- (void)activated;
- (void)canProvideFullResultsWithCompletion:(id)a3;
- (void)cancelQueryWithIdentifier:(id)a3;
- (void)dispatchSearchRequestBlock:(id)a3 errorBlock:(id)a4;
- (void)handleNotificationWithName:(id)a3 event:(id)a4 forStream:(int64_t)a5;
- (void)hasSearchableContentForQuery:(id)a3 withCompletion:(id)a4;
- (void)indexedItemsWithIdentifiers:(id)a3;
- (void)indexingCompleted;
- (void)indexingStarted;
- (void)regionsWithCompletion:(id)a3;
- (void)resetRegionsCoordinatesWithCompletion:(id)a3;
- (void)resetRegionsWithCompletion:(id)a3;
- (void)searchWithQuery:(id)a3;
- (void)setAccountManager:(id)a3;
- (void)setDatabaseManager:(id)a3;
- (void)setFamilyCircleManager:(id)a3;
- (void)setIndexer:(id)a3;
- (void)transactionSourceIdentifier:(id)a3 didReceiveTransaction:(id)a4 oldTransaction:(id)a5;
- (void)transactionSourceIdentifier:(id)a3 didRemoveTransactionWithIdentifier:(id)a4;
- (void)transactionsMissingRegionsWithCompletion:(id)a3;
- (void)updateRegionWithIdentifier:(id)a3 localizedName:(id)a4 boundingRegion:(id *)a5 mapsIdentifier:(unint64_t)a6 providerIdentifier:(int)a7 completion:(id)a8;
@end

@implementation PDSearchService

- (PDSearchService)initWithConnection:(id)a3
{
  return 0LL;
}

- (PDSearchService)initWithConnection:(id)a3 server:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v30.receiver = self;
  v30.super_class = (Class)&OBJC_CLASS___PDSearchService;
  v8 = -[PDSearchService initWithConnection:](&v30, "initWithConnection:", v6);
  v9 = v8;
  if (v8)
  {
    v8->_lockPendingInvalidationCallback._os_unfair_lock_opaque = 0;
    v8->_lock._os_unfair_lock_opaque = 0;
    v10 = -[PKEntitlementWhitelist initWithConnection:]( objc_alloc(&OBJC_CLASS___PKEntitlementWhitelist),  "initWithConnection:",  v6);
    whitelist = v9->_whitelist;
    v9->_whitelist = v10;

    v9->_entitledForSearchUse = -[PKEntitlementWhitelist searchAllAccess]( v9->_whitelist,  "searchAllAccess");
    v12 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
    queries = v9->_queries;
    v9->_queries = v12;

    v14 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    accountUsers = v9->_accountUsers;
    v9->_accountUsers = v14;

    dispatch_queue_attr_t v16 = dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v17 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v16);
    dispatch_queue_t v18 = dispatch_queue_create("com.apple.passd.search.work", v17);
    workQueue = v9->_workQueue;
    v9->_workQueue = (OS_dispatch_queue *)v18;

    uint64_t v20 = sub_10002A820((uint64_t)v7);
    v21 = (void *)objc_claimAutoreleasedReturnValue(v20);
    uint64_t v22 = sub_100016B74((uint64_t)v21);
    uint64_t v23 = objc_claimAutoreleasedReturnValue(v22);
    notificationStreamManager = v9->_notificationStreamManager;
    v9->_notificationStreamManager = (PDNotificationStreamManager *)v23;

    uint64_t v25 = PKSearchServiceClientInterface();
    v26 = (void *)objc_claimAutoreleasedReturnValue(v25);
    [v6 setRemoteObjectInterface:v26];

    uint64_t v27 = PKSearchServiceDaemonInterface();
    v28 = (void *)objc_claimAutoreleasedReturnValue(v27);
    [v6 setExportedInterface:v28];

    [v6 setExportedObject:v9];
  }

  return v9;
}

- (void)activated
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___PDSearchService;
  -[PDSearchService activated](&v3, "activated");
}

- (void)setIndexer:(id)a3
{
  v5 = (PDSpotlightIndexer *)a3;
  p_indexer = &self->_indexer;
  indexer = self->_indexer;
  v8 = v5;
  if (indexer != v5)
  {
    if (indexer) {
      -[PDSpotlightIndexer removeObserver:](indexer, "removeObserver:", self);
    }
    objc_storeStrong((id *)&self->_indexer, a3);
    if (*p_indexer)
    {
      -[PDSpotlightIndexer addObserver:](*p_indexer, "addObserver:", self);
      -[PDSpotlightIndexer triggerIndexing](*p_indexer, "triggerIndexing");
    }
  }
}

- (void)setAccountManager:(id)a3
{
  v5 = (PDAccountManager *)a3;
  accountManager = self->_accountManager;
  if (accountManager != v5)
  {
    id v7 = v5;
    if (accountManager) {
      -[PDAccountManager unregisterObserver:](accountManager, "unregisterObserver:", self);
    }
    objc_storeStrong((id *)&self->_accountManager, a3);
    -[PDAccountManager registerObserver:](self->_accountManager, "registerObserver:", self);
    v5 = v7;
  }
}

- (void)dispatchSearchRequestBlock:(id)a3 errorBlock:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = (void (**)(void, void))v7;
  if (!v6)
  {
    if (!v7) {
      goto LABEL_11;
    }
    uint64_t v10 = PKSearchErrorDomain;
    uint64_t v11 = 2LL;
LABEL_10:
    v14 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  v10,  v11,  0LL));
    ((void (**)(void, void *))v8)[2](v8, v14);

    goto LABEL_11;
  }

  if (self->_entitledForSearchUse)
  {
    workQueue = self->_workQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_10024081C;
    block[3] = &unk_10063A830;
    id v17 = v6;
    dispatch_async((dispatch_queue_t)workQueue, block);

    goto LABEL_11;
  }

  uint64_t Object = PKLogFacilityTypeGetObject(0LL);
  v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v15 = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_DEFAULT,  "Client is not entitled for search service",  v15,  2u);
  }

  if (v8)
  {
    uint64_t v10 = PKSearchErrorDomain;
    uint64_t v11 = 1LL;
    goto LABEL_10;
  }

- (void)canProvideFullResultsWithCompletion:(id)a3
{
  v4 = (void (**)(id, uint64_t))a3;
  if (v4)
  {
    id v7 = v4;
    os_unfair_lock_lock(&self->_lock);
    BOOL hasSentResults = self->_hasSentResults;
    os_unfair_lock_unlock(&self->_lock);
    if (hasSentResults)
    {
      uint64_t v6 = 1LL;
    }

    else if (-[PDSpotlightIndexer isIndexing](self->_indexer, "isIndexing"))
    {
      uint64_t v6 = 0LL;
    }

    else
    {
      uint64_t v6 = -[PDSpotlightIndexer willRequireIndexing](self->_indexer, "willRequireIndexing") ^ 1;
    }

    v7[2](v7, v6);
    v4 = v7;
  }
}

- (void)hasSearchableContentForQuery:(id)a3 withCompletion:(id)a4
{
  id v10 = a3;
  uint64_t v6 = (void (**)(id, BOOL))a4;
  if (v6)
  {
    if ([v10 domain] == (id)1
      && (databaseManager = self->_databaseManager,
          v8 = (void *)objc_claimAutoreleasedReturnValue([v10 passUniqueIdentifier]),
          v9 = (void *)objc_claimAutoreleasedReturnValue( -[PDDatabaseManager allAssociatedTransactionSourceIdentifiersForPassUniqueIdentifier:]( databaseManager,  "allAssociatedTransactionSourceIdentifiersForPassUniqueIdentifier:",  v8)),  v8,  v9))
    {
      v6[2]( v6,  -[PDDatabaseManager hasAnyTransactionsForTransactionSourceIdentifiers:]( self->_databaseManager,  "hasAnyTransactionsForTransactionSourceIdentifiers:",  v9));
    }

    else
    {
      v6[2](v6, -[PDDatabaseManager hasAnyTransactions](self->_databaseManager, "hasAnyTransactions"));
    }
  }
}

- (void)searchWithQuery:(id)a3
{
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue([v4 identifier]);
  os_unfair_lock_lock(&self->_lock);
  BOOL hasSentResults = self->_hasSentResults;
  os_unfair_lock_unlock(&self->_lock);
  if (!hasSentResults)
  {
    if (-[PDSpotlightIndexer isIndexing](self->_indexer, "isIndexing")
      || -[PDSpotlightIndexer willRequireIndexing](self->_indexer, "willRequireIndexing"))
    {
      id v7 = (void *)objc_claimAutoreleasedReturnValue(-[PDSearchService remoteObjectProxy](self, "remoteObjectProxy"));
      v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  PKSearchErrorDomain,  5LL,  0LL));
      [v7 searchDidCompleteWithError:v8 forIdentifier:v5];

      goto LABEL_6;
    }

    os_unfair_lock_lock(&self->_lock);
    self->_BOOL hasSentResults = 1;
    os_unfair_lock_unlock(&self->_lock);
  }

  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472LL;
  v11[2] = sub_100240B50;
  v11[3] = &unk_100639350;
  v11[4] = self;
  id v12 = v5;
  id v13 = v4;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472LL;
  v9[2] = sub_100240BFC;
  v9[3] = &unk_1006489C0;
  v9[4] = self;
  id v10 = v12;
  -[PDSearchService dispatchSearchRequestBlock:errorBlock:](self, "dispatchSearchRequestBlock:errorBlock:", v11, v9);

LABEL_6:
}

- (void)cancelQueryWithIdentifier:(id)a3
{
  id v4 = a3;
  os_unfair_lock_lock(&self->_lock);
  v5 = self->_currentQueryIdentifier;
  uint64_t v6 = (NSString *)v4;
  id v7 = v6;
  if (v5 == v6)
  {
  }

  else
  {
    if (!v6 || !v5)
    {

LABEL_11:
      queries = self->_queries;
      v16[0] = _NSConcreteStackBlock;
      v16[1] = 3221225472LL;
      v16[2] = sub_100240E74;
      v16[3] = &unk_10064ED40;
      id v12 = v7;
      id v17 = v12;
      id v13 = -[NSMutableArray indexOfObjectPassingTest:](queries, "indexOfObjectPassingTest:", v16);
      if (v13 == (id)0x7FFFFFFFFFFFFFFFLL)
      {
        v14 = 0LL;
      }

      else
      {
        -[NSMutableArray removeObjectAtIndex:](self->_queries, "removeObjectAtIndex:", v13);
        v14 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  PKSearchErrorDomain,  4LL,  0LL));
      }

      os_unfair_lock_unlock(&self->_lock);
      if (v14)
      {
        v15 = (void *)objc_claimAutoreleasedReturnValue(-[PDSearchService remoteObjectProxy](self, "remoteObjectProxy"));
        [v15 searchDidCompleteWithError:v14 forIdentifier:v12];
      }

      goto LABEL_16;
    }

    unsigned int v8 = -[NSString isEqualToString:](v5, "isEqualToString:", v6);

    if (!v8) {
      goto LABEL_11;
    }
  }

  uint64_t Object = PKLogFacilityTypeGetObject(18LL);
  id v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v19 = v7;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Search query %@ will be aborted", buf, 0xCu);
  }

  self->_shouldAbortCurrentQuery = 1;
  os_unfair_lock_unlock(&self->_lock);
LABEL_16:
}

- (void)updateRegionWithIdentifier:(id)a3 localizedName:(id)a4 boundingRegion:(id *)a5 mapsIdentifier:(unint64_t)a6 providerIdentifier:(int)a7 completion:(id)a8
{
  id v12 = *(void **)&a7;
  int v13 = a6;
  uint64_t v15 = v11;
  uint64_t v16 = v10;
  uint64_t v17 = v9;
  uint64_t v18 = v8;
  v25[0] = _NSConcreteStackBlock;
  v25[1] = 3221225472LL;
  v25[2] = sub_100241044;
  v25[3] = &unk_10064ED68;
  v26 = self;
  id v27 = a3;
  id v28 = a4;
  uint64_t v30 = v18;
  uint64_t v31 = v17;
  uint64_t v32 = v16;
  uint64_t v33 = v15;
  v34 = a5;
  int v35 = v13;
  id v29 = v12;
  v23[0] = _NSConcreteStackBlock;
  v23[1] = 3221225472LL;
  v23[2] = sub_1002410B0;
  v23[3] = &unk_1006424D0;
  id v24 = v29;
  id v20 = v29;
  id v21 = v28;
  id v22 = v27;
  -[PDSearchService dispatchSearchRequestBlock:errorBlock:](v26, "dispatchSearchRequestBlock:errorBlock:", v25, v23);
}

- (void)_queue_performCurrentQuery
{
  p_currentQuery = (id *)&self->_currentQuery;
  if (self->_currentQuery)
  {
    int v4 = PKSearchDetailedLoggingEnabledInWallet();
    uint64_t Object = PKLogFacilityTypeGetObject(18LL);
    uint64_t v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
    BOOL v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
    if (v4)
    {
      if (v7)
      {
        id v8 = *p_currentQuery;
        int v15 = 138412290;
        id v16 = v8;
        _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "Search query started: %@",  (uint8_t *)&v15,  0xCu);
      }
    }

    else if (v7)
    {
      uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([*p_currentQuery identifier]);
      int v15 = 138412290;
      id v16 = v9;
      _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "Search query started:  %@",  (uint8_t *)&v15,  0xCu);
    }

    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(-[PDSearchService remoteObjectProxy](self, "remoteObjectProxy"));
    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  PKSearchErrorDomain,  3LL,  0LL));
    id v12 = (void *)objc_claimAutoreleasedReturnValue([*p_currentQuery identifier]);
    [v10 searchDidCompleteWithError:v11 forIdentifier:v12];

    os_unfair_lock_lock(&self->_lock);
    int v13 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray lastObject](self->_queries, "lastObject"));
    if (v13)
    {
      -[NSMutableArray removeObject:](self->_queries, "removeObject:", v13);
      objc_storeStrong(p_currentQuery, v13);
      -[PDSearchService _queue_performCurrentQuery](self, "_queue_performCurrentQuery");
    }

    else
    {
      id v14 = *p_currentQuery;
      id *p_currentQuery = 0LL;
    }

    os_unfair_lock_unlock(&self->_lock);
  }

- (BOOL)_currentQuerySupportsTransactionTypeToken:(int64_t)a3
{
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[PKSearchQuery transactionTypes](self->_currentQuery, "transactionTypes"));
  id v6 = [v5 count];

  if (v6) {
    return 0;
  }
  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[PDSearchService _transactionRequestForCurrentFilters](self, "_transactionRequestForCurrentFilters"));
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", a3));
  int v13 = v9;
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v13, 1LL));
  [v8 setTransactionTypes:v10];

  [v8 setLimit:1];
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(-[PDDatabaseManager transactionsForRequest:](self->_databaseManager, "transactionsForRequest:", v8));
  BOOL v7 = [v11 count] != 0;

  return v7;
}

- (BOOL)_currentQuerySupportsTransactionSourceToken:(unint64_t)a3
{
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[PKSearchQuery transactionSources](self->_currentQuery, "transactionSources"));
  id v6 = [v5 count];

  if (v6) {
    return 0;
  }
  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[PDSearchService _transactionRequestForCurrentFilters](self, "_transactionRequestForCurrentFilters"));
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInteger:", a3));
  int v13 = v9;
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v13, 1LL));
  [v8 setTransactionSources:v10];

  [v8 setLimit:1];
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(-[PDDatabaseManager transactionsForRequest:](self->_databaseManager, "transactionsForRequest:", v8));
  BOOL v7 = [v11 count] != 0;

  return v7;
}

- (BOOL)_currentQuerySupportsTransactionStatusToken:(int64_t)a3
{
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[PKSearchQuery transactionStatuses](self->_currentQuery, "transactionStatuses"));
  id v6 = [v5 count];

  if (v6) {
    return 0;
  }
  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[PDSearchService _transactionRequestForCurrentFilters](self, "_transactionRequestForCurrentFilters"));
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", a3));
  id v14 = v9;
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v14, 1LL));

  if (!a3)
  {
    uint64_t v11 = objc_claimAutoreleasedReturnValue([v10 arrayByAddingObject:&off_100690470]);

    uint64_t v10 = (void *)v11;
  }

  [v8 setTransactionStatuses:v10];
  [v8 setLimit:1];
  id v12 = (void *)objc_claimAutoreleasedReturnValue(-[PDDatabaseManager transactionsForRequest:](self->_databaseManager, "transactionsForRequest:", v8));
  BOOL v7 = [v12 count] != 0;

  return v7;
}

- (BOOL)_currentQuerySupportsPeerPaymentSubTypeToken:(int64_t)a3
{
  uint64_t v5 = objc_claimAutoreleasedReturnValue(-[PKSearchQuery peerPaymentSubTypeToken](self->_currentQuery, "peerPaymentSubTypeToken"));
  if (v5)
  {
    id v6 = (void *)v5;
    BOOL v7 = 0;
  }

  else
  {
    if (!self->_currentQueryIncludesCash) {
      return 0;
    }
    id v6 = (void *)objc_claimAutoreleasedReturnValue(-[PDSearchService _transactionRequestForCurrentFilters](self, "_transactionRequestForCurrentFilters"));
    [v6 setPeerPaymentSubType:a3];
    [v6 setLimit:1];
    id v8 = (void *)objc_claimAutoreleasedReturnValue(-[PDDatabaseManager transactionsForRequest:](self->_databaseManager, "transactionsForRequest:", v6));
    BOOL v7 = [v8 count] != 0;
  }

  return v7;
}

- (BOOL)_currentQuerySupportsRewardsToken:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_claimAutoreleasedReturnValue(-[PKSearchQuery rewardsToken](self->_currentQuery, "rewardsToken"));
  if (v5)
  {
    id v6 = (void *)v5;
    BOOL v7 = 0;
  }

  else
  {
    if (self->_currentQueryIncludesCash)
    {
      BOOL v7 = 0;
      goto LABEL_6;
    }

    id v6 = (void *)objc_claimAutoreleasedReturnValue(-[PDSearchService _transactionRequestForCurrentFilters](self, "_transactionRequestForCurrentFilters"));
    objc_msgSend(v6, "setRewardsValueUnit:", objc_msgSend(v4, "rewardsValueUnit"));
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([v4 rewardsValue]);
    [v6 setRewardsValue:v9];

    [v6 setLimit:1];
    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(-[PDDatabaseManager transactionsForRequest:](self->_databaseManager, "transactionsForRequest:", v6));
    BOOL v7 = [v10 count] != 0;
  }

LABEL_6:
  return v7;
}

- (BOOL)_currentQuerySupportsTagToken:(id)a3
{
  id v4 = a3;
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[PDSearchService _transactionRequestForCurrentFilters](self, "_transactionRequestForCurrentFilters"));
  id v6 = objc_alloc(&OBJC_CLASS___NSSet);
  BOOL v7 = (void *)objc_claimAutoreleasedReturnValue([v4 tag]);

  id v8 = -[NSSet initWithObjects:](v6, "initWithObjects:", v7, 0LL);
  [v5 setTags:v8];

  [v5 setLimit:1];
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(-[PDDatabaseManager transactionsForRequest:](self->_databaseManager, "transactionsForRequest:", v5));
  LOBYTE(v8) = [v9 count] != 0;

  return (char)v8;
}

- (BOOL)_currentQuerySupportsDateTokenWithStartDate:(id)a3 endDate:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[PDSearchService _transactionRequestForCurrentFilters](self, "_transactionRequestForCurrentFilters"));
  [v8 setStartDate:v7];

  [v8 setEndDate:v6];
  [v8 setLimit:1];
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(-[PDDatabaseManager transactionsForRequest:](self->_databaseManager, "transactionsForRequest:", v8));
  LOBYTE(self) = [v9 count] != 0;

  return (char)self;
}

- (BOOL)_currentQuerySupportsCategory:(int64_t)a3
{
  uint64_t v5 = objc_claimAutoreleasedReturnValue(-[PKSearchQuery categoryToken](self->_currentQuery, "categoryToken"));
  if (v5
    || (uint64_t v5 = objc_claimAutoreleasedReturnValue(-[PKSearchQuery merchantToken](self->_currentQuery, "merchantToken"))) != 0)
  {
    id v6 = (void *)v5;
    BOOL v7 = 0;
  }

  else
  {
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(-[PKSearchQuery transactionTypes](self->_currentQuery, "transactionTypes"));
    id v10 = [v9 count];

    if (v10) {
      return 0;
    }
    id v6 = (void *)objc_claimAutoreleasedReturnValue(-[PDSearchService _transactionRequestForCurrentFilters](self, "_transactionRequestForCurrentFilters"));
    [v6 setMerchantCategory:a3];
    [v6 setLimit:1];
    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(-[PDDatabaseManager transactionsForRequest:](self->_databaseManager, "transactionsForRequest:", v6));
    BOOL v7 = [v11 count] != 0;
  }

  return v7;
}

- (id)_transactionRequestForCurrentFilters
{
  id v3 = objc_alloc_init(&OBJC_CLASS___PKPaymentTransactionRequest);
  [v3 setTransactionSourceIdentifiers:self->_currentTransactionSourceIdentifiers];
  [v3 setTransactionTypes:self->_currentTransactionTypes];
  [v3 setTransactionSources:self->_currentTransactionSources];
  [v3 setTransactionStatuses:self->_currentTransactionStatuses];
  [v3 setRegions:self->_currentRegions];
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[PKSearchQuery merchantToken](self->_currentQuery, "merchantToken"));
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([v4 group]);
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 merchant]);
  [v3 setMerchant:v6];

  BOOL v7 = (void *)objc_claimAutoreleasedReturnValue(-[PKSearchQuery categoryToken](self->_currentQuery, "categoryToken"));
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 group]);
  objc_msgSend(v3, "setMerchantCategory:", objc_msgSend(v8, "merchantCategory"));

  [v3 setStartDate:self->_currentStartDate];
  [v3 setEndDate:self->_currentEndDate];
  [v3 setDateOrder:1];
  [v3 setAmount:self->_currentAmount];
  [v3 setAmountComparison:self->_currentAmountComparison];
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(-[PKSearchQuery rewardsToken](self->_currentQuery, "rewardsToken"));
  id v10 = (void *)objc_claimAutoreleasedReturnValue([v9 rewardsValue]);
  [v3 setRewardsValue:v10];

  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(-[PKSearchQuery rewardsToken](self->_currentQuery, "rewardsToken"));
  objc_msgSend(v3, "setRewardsValueUnit:", objc_msgSend(v11, "rewardsValueUnit"));

  id v12 = (void *)objc_claimAutoreleasedReturnValue(-[PKSearchQuery peerPaymentSubTypeToken](self->_currentQuery, "peerPaymentSubTypeToken"));
  objc_msgSend(v3, "setPeerPaymentSubType:", objc_msgSend(v12, "subType"));

  [v3 setTags:self->_currentTags];
  [v3 setCurrencyCode:@"USD"];
  return v3;
}

- (void)_buildInvertedIndexWithCompletion:(id)a3
{
  v132 = (void (**)(void))a3;
  id v4 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  invertedIndex = self->_invertedIndex;
  self->_invertedIndex = v4;

  for (uint64_t i = 0LL; i != 8; ++i)
  {
    if (i)
    {
      uint64_t v7 = PKLocalizedStringFromMerchantCategory(i);
      id v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
      if (v8)
      {
        uint64_t v9 = objc_alloc_init(&OBJC_CLASS___PDSearchServiceInvertedIndexEntry);
        -[PDSearchServiceInvertedIndexEntry setType:](v9, "setType:", 0LL);
        -[PDSearchServiceInvertedIndexEntry setCategory:](v9, "setCategory:", i);
        -[PDSearchService _addWord:forEntry:](self, "_addWord:forEntry:", v8, v9);
      }
    }
  }

  id v10 = objc_alloc_init(&OBJC_CLASS___PDSearchServiceInvertedIndexEntry);
  -[PDSearchServiceInvertedIndexEntry setType:](v10, "setType:", 1LL);
  -[PDSearchServiceInvertedIndexEntry setTransactionType:](v10, "setTransactionType:", 10LL);
  uint64_t v11 = PKLocalizedPaymentString(@"TRANSACTION_TYPE_PAYMENT");
  id v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
  -[PDSearchService _addWord:forEntry:](self, "_addWord:forEntry:", v12, v10);

  int v13 = objc_alloc_init(&OBJC_CLASS___PDSearchServiceInvertedIndexEntry);
  -[PDSearchServiceInvertedIndexEntry setType:](v13, "setType:", 1LL);
  -[PDSearchServiceInvertedIndexEntry setTransactionType:](v13, "setTransactionType:", 11LL);
  uint64_t v14 = PKLocalizedPaymentString(@"TRANSACTION_TYPE_INTEREST_CHARGE");
  int v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
  -[PDSearchService _addWord:forEntry:](self, "_addWord:forEntry:", v15, v13);

  id v16 = objc_alloc_init(&OBJC_CLASS___PDSearchServiceInvertedIndexEntry);
  -[PDSearchServiceInvertedIndexEntry setType:](v16, "setType:", 1LL);
  -[PDSearchServiceInvertedIndexEntry setTransactionType:](v16, "setTransactionType:", 1LL);
  uint64_t v17 = PKLocalizedPaymentString(@"PAYMENT_TRANSACTION_REFUND");
  uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue(v17);
  -[PDSearchService _addWord:forEntry:](self, "_addWord:forEntry:", v18, v16);

  v19 = objc_alloc_init(&OBJC_CLASS___PDSearchServiceInvertedIndexEntry);
  -[PDSearchServiceInvertedIndexEntry setType:](v19, "setType:", 1LL);
  -[PDSearchServiceInvertedIndexEntry setTransactionType:](v19, "setTransactionType:", 0LL);
  uint64_t v20 = PKLocalizedPaymentString(@"PAYMENT_TRANSACTION_PURCHASE");
  id v21 = (void *)objc_claimAutoreleasedReturnValue(v20);
  -[PDSearchService _addWord:forEntry:](self, "_addWord:forEntry:", v21, v19);

  id v22 = objc_alloc_init(&OBJC_CLASS___PDSearchServiceInvertedIndexEntry);
  -[PDSearchServiceInvertedIndexEntry setType:](v22, "setType:", 1LL);
  -[PDSearchServiceInvertedIndexEntry setTransactionType:](v22, "setTransactionType:", 5LL);
  uint64_t v23 = PKLocalizedPaymentString(@"TRANSACTION_TYPE_WITHDRAWAL_GENERIC");
  id v24 = (void *)objc_claimAutoreleasedReturnValue(v23);
  -[PDSearchService _addWord:forEntry:](self, "_addWord:forEntry:", v24, v22);

  uint64_t v25 = objc_alloc_init(&OBJC_CLASS___PDSearchServiceInvertedIndexEntry);
  -[PDSearchServiceInvertedIndexEntry setType:](v25, "setType:", 1LL);
  -[PDSearchServiceInvertedIndexEntry setTransactionType:](v25, "setTransactionType:", 6LL);
  uint64_t v26 = PKLocalizedPaymentString(@"TRANSACTION_TYPE_TOP_UP");
  id v27 = (void *)objc_claimAutoreleasedReturnValue(v26);
  -[PDSearchService _addWord:forEntry:](self, "_addWord:forEntry:", v27, v25);

  id v28 = objc_alloc_init(&OBJC_CLASS___PDSearchServiceInvertedIndexEntry);
  -[PDSearchServiceInvertedIndexEntry setType:](v28, "setType:", 1LL);
  -[PDSearchServiceInvertedIndexEntry setTransactionType:](v28, "setTransactionType:", 7LL);
  uint64_t v29 = PKLocalizedPaymentString(@"TRANSACTION_TYPE_ADJUSTMENT");
  uint64_t v30 = (void *)objc_claimAutoreleasedReturnValue(v29);
  -[PDSearchService _addWord:forEntry:](self, "_addWord:forEntry:", v30, v28);

  uint64_t v31 = objc_alloc_init(&OBJC_CLASS___PDSearchServiceInvertedIndexEntry);
  -[PDSearchServiceInvertedIndexEntry setType:](v31, "setType:", 1LL);
  -[PDSearchServiceInvertedIndexEntry setTransactionType:](v31, "setTransactionType:", 13LL);
  uint64_t v32 = PKLocalizedBeekmanString(@"APPLE_CARD_INSTALLMENTS_SEARCH");
  uint64_t v33 = (void *)objc_claimAutoreleasedReturnValue(v32);
  -[PDSearchService _addWord:forEntry:](self, "_addWord:forEntry:", v33, v31);

  v34 = objc_alloc_init(&OBJC_CLASS___PDSearchServiceInvertedIndexEntry);
  -[PDSearchServiceInvertedIndexEntry setType:](v34, "setType:", 3LL);
  -[PDSearchServiceInvertedIndexEntry setTransactionSource:](v34, "setTransactionSource:", 6LL);
  uint64_t v35 = PKLocalizedFeatureString(@"TRANSACTION_DETAILS_VIRTUAL_CARD", 2LL);
  v36 = (void *)objc_claimAutoreleasedReturnValue(v35);
  -[PDSearchService _addWord:forEntry:](self, "_addWord:forEntry:", v36, v34);

  v37 = objc_alloc_init(&OBJC_CLASS___PDSearchServiceInvertedIndexEntry);
  -[PDSearchServiceInvertedIndexEntry setType:](v37, "setType:", 3LL);
  -[PDSearchServiceInvertedIndexEntry setTransactionSource:](v37, "setTransactionSource:", 5LL);
  uint64_t v38 = PKLocalizedFeatureString(@"TRANSACTION_DETAILS_PHYSICAL_CARD", 2LL);
  v39 = (void *)objc_claimAutoreleasedReturnValue(v38);
  -[PDSearchService _addWord:forEntry:](self, "_addWord:forEntry:", v39, v37);

  v40 = objc_alloc_init(&OBJC_CLASS___PDSearchServiceInvertedIndexEntry);
  -[PDSearchServiceInvertedIndexEntry setType:](v40, "setType:", 2LL);
  -[PDSearchServiceInvertedIndexEntry setTransactionStatus:](v40, "setTransactionStatus:", 0LL);
  uint64_t v41 = PKLocalizedPaymentString(@"PAYMENT_TRANSACTION_PENDING");
  v42 = (void *)objc_claimAutoreleasedReturnValue(v41);
  -[PDSearchService _addWord:forEntry:](self, "_addWord:forEntry:", v42, v40);

  v43 = objc_alloc_init(&OBJC_CLASS___PDSearchServiceInvertedIndexEntry);
  -[PDSearchServiceInvertedIndexEntry setType:](v43, "setType:", 2LL);
  -[PDSearchServiceInvertedIndexEntry setTransactionStatus:](v43, "setTransactionStatus:", 2LL);
  uint64_t v44 = PKLocalizedPaymentString(@"PAYMENT_TRANSACTION_DECLINED");
  v45 = (void *)objc_claimAutoreleasedReturnValue(v44);
  -[PDSearchService _addWord:forEntry:](self, "_addWord:forEntry:", v45, v43);

  v46 = objc_alloc_init(&OBJC_CLASS___PDSearchServiceInvertedIndexEntry);
  -[PDSearchServiceInvertedIndexEntry setType:](v46, "setType:", 2LL);
  -[PDSearchServiceInvertedIndexEntry setTransactionStatus:](v46, "setTransactionStatus:", 5LL);
  uint64_t v47 = PKLocalizedPaymentString(@"PAYMENT_TRANSACTION_CANCELED");
  v48 = (void *)objc_claimAutoreleasedReturnValue(v47);
  -[PDSearchService _addWord:forEntry:](self, "_addWord:forEntry:", v48, v46);

  v49 = objc_alloc_init(&OBJC_CLASS___PDSearchServiceInvertedIndexEntry);
  -[PDSearchServiceInvertedIndexEntry setType:](v49, "setType:", 2LL);
  -[PDSearchServiceInvertedIndexEntry setTransactionStatus:](v49, "setTransactionStatus:", 6LL);
  uint64_t v50 = PKLocalizedPaymentString(@"PAYMENT_TRANSACTION_REJECTED");
  v51 = (void *)objc_claimAutoreleasedReturnValue(v50);
  -[PDSearchService _addWord:forEntry:](self, "_addWord:forEntry:", v51, v49);

  v52 = objc_alloc_init(&OBJC_CLASS___PDSearchServiceInvertedIndexEntry);
  -[PDSearchServiceInvertedIndexEntry setType:](v52, "setType:", 2LL);
  -[PDSearchServiceInvertedIndexEntry setTransactionStatus:](v52, "setTransactionStatus:", 7LL);
  uint64_t v53 = PKLocalizedPaymentString(@"PAYMENT_TRANSACTION_EXPIRED");
  v54 = (void *)objc_claimAutoreleasedReturnValue(v53);
  -[PDSearchService _addWord:forEntry:](self, "_addWord:forEntry:", v54, v52);

  v55 = objc_alloc_init(&OBJC_CLASS___PDSearchServiceInvertedIndexEntry);
  -[PDSearchServiceInvertedIndexEntry setType:](v55, "setType:", 7LL);
  -[PDSearchServiceInvertedIndexEntry setPeerPaymentSubType:](v55, "setPeerPaymentSubType:", 1LL);
  uint64_t v56 = PKLocalizedPeerPaymentString(@"TRANSACTION_DETAILS_AMOUNT_LINE_ITEM_TOTAL_SENT");
  v57 = (void *)objc_claimAutoreleasedReturnValue(v56);
  -[PDSearchService _addWord:forEntry:](self, "_addWord:forEntry:", v57, v55);

  v58 = objc_alloc_init(&OBJC_CLASS___PDSearchServiceInvertedIndexEntry);
  -[PDSearchServiceInvertedIndexEntry setType:](v58, "setType:", 7LL);
  -[PDSearchServiceInvertedIndexEntry setPeerPaymentSubType:](v58, "setPeerPaymentSubType:", 2LL);
  uint64_t v59 = PKLocalizedPeerPaymentString(@"TRANSACTION_DETAILS_AMOUNT_LINE_ITEM_TOTAL_RECEIVED");
  v60 = (void *)objc_claimAutoreleasedReturnValue(v59);
  -[PDSearchService _addWord:forEntry:](self, "_addWord:forEntry:", v60, v58);

  v61 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
  v62 = (void *)objc_claimAutoreleasedReturnValue( -[PDDatabaseManager transactionsForTransactionSourceIdentifiers:withTransactionSource:withBackingData:startDate:endDate:orderedByDate:limit:]( self->_databaseManager,  "transactionsForTransactionSourceIdentifiers:withTransactionSource:withBackingData:startDate:endDate: orderedByDate:limit:",  self->_currentTransactionSourceIdentifiers,  0LL,  0LL,  0LL,  0LL,  -1LL,  1LL));
  v63 = (void *)objc_claimAutoreleasedReturnValue([v62 anyObject]);
  id v64 = (id)objc_claimAutoreleasedReturnValue([v63 transactionDate]);

  if (!v64) {
    id v64 = v61;
  }
  v136 = objc_alloc_init(&OBJC_CLASS___NSDateFormatter);
  -[NSDateFormatter setLocalizedDateFormatFromTemplate:](v136, "setLocalizedDateFormatFromTemplate:", @"yyyy");
  v65 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  years = self->_years;
  self->_years = v65;

  uint64_t v67 = PKStartOfYear(v64);
  v68 = (void *)objc_claimAutoreleasedReturnValue(v67);
  if ([v68 compare:v61] == (id)-1)
  {
    do
    {
      -[NSMutableArray addObject:](self->_years, "addObject:", v68);
      uint64_t Year = PKStartOfNextYear(v68);
      v69 = (void *)objc_claimAutoreleasedReturnValue(Year);

      v68 = v69;
    }

    while ([v69 compare:v61] == (id)-1);
  }

  else
  {
    v69 = v68;
  }

  v138 = self;
  v133 = v64;
  v134 = v61;
  v131 = v69;
  if (-[NSMutableArray count](self->_years, "count"))
  {
    v71 = (char *)-[NSMutableArray count](self->_years, "count") - 1;
    if ((uint64_t)v71 >= 0)
    {
      uint64_t v72 = 0LL;
      while (1)
      {
        v73 = v58;
        v74 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray objectAtIndex:](self->_years, "objectAtIndex:", v71));
        v58 = objc_alloc_init(&OBJC_CLASS___PDSearchServiceInvertedIndexEntry);

        -[PDSearchServiceInvertedIndexEntry setType:](v58, "setType:", 6LL);
        -[PDSearchServiceInvertedIndexEntry setDate:](v58, "setDate:", v74);
        v75 = (void *)objc_claimAutoreleasedReturnValue(-[NSDateFormatter stringFromDate:](v136, "stringFromDate:", v74));
        -[PDSearchService _addWord:forEntry:](self, "_addWord:forEntry:", v75, v58);

        if (!v72) {
          break;
        }
        if (v72 == 1)
        {
          v76 = @"SEARCH_LAST_YEAR";
LABEL_19:
          uint64_t v77 = PKLocalizedString(&v76->isa);
          v78 = (void *)objc_claimAutoreleasedReturnValue(v77);
          -[PDSearchService _addWord:forEntry:](self, "_addWord:forEntry:", v78, v58);
        }

        ++v72;
      }

      v76 = @"SEARCH_THIS_YEAR";
      goto LABEL_19;
    }
  }

- (void)_addWord:(id)a3 forEntry:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  -[PDSearchService _indexString:forEntry:](self, "_indexString:forEntry:", v6, v7);
  id v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSCharacterSet whitespaceCharacterSet](&OBJC_CLASS___NSCharacterSet, "whitespaceCharacterSet"));
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([v6 componentsSeparatedByCharactersInSet:v8]);

  if ((unint64_t)[v9 count] >= 2)
  {
    __int128 v18 = 0u;
    __int128 v19 = 0u;
    __int128 v16 = 0u;
    __int128 v17 = 0u;
    id v10 = v9;
    id v11 = [v10 countByEnumeratingWithState:&v16 objects:v20 count:16];
    if (v11)
    {
      id v12 = v11;
      uint64_t v13 = *(void *)v17;
      do
      {
        for (uint64_t i = 0LL; i != v12; uint64_t i = (char *)i + 1)
        {
          if (*(void *)v17 != v13) {
            objc_enumerationMutation(v10);
          }
          int v15 = *(void **)(*((void *)&v16 + 1) + 8LL * (void)i);
        }

        id v12 = [v10 countByEnumeratingWithState:&v16 objects:v20 count:16];
      }

      while (v12);
    }
  }
}

- (void)_indexString:(id)a3 forEntry:(id)a4
{
  id v6 = a4;
  id v10 = (id)objc_claimAutoreleasedReturnValue([a3 lowercaseString]);
  if ([v10 length])
  {
    unint64_t v7 = 1LL;
    do
    {
      id v8 = (void *)objc_claimAutoreleasedReturnValue([v10 substringToIndex:v7]);
      uint64_t v9 = (NSMutableArray *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](self->_invertedIndex, "objectForKey:", v8));
      if (!v9)
      {
        uint64_t v9 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
        -[NSMutableDictionary setObject:forKey:](self->_invertedIndex, "setObject:forKey:", v9, v8);
      }

      -[NSMutableArray addObject:](v9, "addObject:", v6);

      ++v7;
    }

    while (v7 <= (unint64_t)[v10 length]);
  }
}

- (void)regionsWithCompletion:(id)a3
{
  if (a3)
  {
    databaseManager = self->_databaseManager;
    id v4 = (void (**)(id, void *))a3;
    uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSLocale currentLocale](&OBJC_CLASS___NSLocale, "currentLocale"));
    id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 localeIdentifier]);
    id v8 = (id)objc_claimAutoreleasedReturnValue( -[PDDatabaseManager regionsMatchingName:types:localeIdentifier:]( databaseManager,  "regionsMatchingName:types:localeIdentifier:",  0LL,  0LL,  v6));

    unint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](&OBJC_CLASS___NSSet, "setWithArray:", v8));
    v4[2](v4, v7);
  }

- (void)resetRegionsWithCompletion:(id)a3
{
  id v5 = a3;
  -[PDSpotlightIndexer resetRegions](self->_indexer, "resetRegions");
  id v4 = v5;
  if (v5)
  {
    (*((void (**)(id))v5 + 2))(v5);
    id v4 = v5;
  }
}

- (void)resetRegionsCoordinatesWithCompletion:(id)a3
{
  id v5 = a3;
  -[PDSpotlightIndexer resetCoordinatesForAllRegions](self->_indexer, "resetCoordinatesForAllRegions");
  id v4 = v5;
  if (v5)
  {
    (*((void (**)(id))v5 + 2))(v5);
    id v4 = v5;
  }
}

- (void)transactionsMissingRegionsWithCompletion:(id)a3
{
  id v4 = (void (**)(id, id, id))a3;
  if (v4)
  {
    id v5 = (void *)objc_claimAutoreleasedReturnValue( -[PDDatabaseManager transactionsMissingWorldRegionWithLimit:onlyEligibleForProcessing:]( self->_databaseManager,  "transactionsMissingWorldRegionWithLimit:onlyEligibleForProcessing:",  2000LL,  0LL));
    id v6 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    __int128 v16 = 0u;
    __int128 v17 = 0u;
    __int128 v18 = 0u;
    __int128 v19 = 0u;
    id v7 = v5;
    id v8 = [v7 countByEnumeratingWithState:&v16 objects:v20 count:16];
    if (v8)
    {
      id v9 = v8;
      uint64_t v10 = *(void *)v17;
      do
      {
        for (uint64_t i = 0LL; i != v9; uint64_t i = (char *)i + 1)
        {
          if (*(void *)v17 != v10) {
            objc_enumerationMutation(v7);
          }
          id v12 = *(void **)(*((void *)&v16 + 1) + 8LL * (void)i);
          uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue( -[PDDatabaseManager lastRegionErrorForTransaction:]( self->_databaseManager,  "lastRegionErrorForTransaction:",  v12,  (void)v16));
          if (v13)
          {
            uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue([v12 identifier]);
            -[NSMutableDictionary setObject:forKey:](v6, "setObject:forKey:", v13, v14);
          }
        }

        id v9 = [v7 countByEnumeratingWithState:&v16 objects:v20 count:16];
      }

      while (v9);
    }

    id v15 = -[NSMutableDictionary copy](v6, "copy");
    v4[2](v4, v7, v15);
  }
}

- (void)accountManager:(id)a3 accountUsersChanged:(id)a4 oldUsers:(id)a5 accountIdentifier:(id)a6
{
  id v8 = a4;
  id v9 = a6;
  workQueue = self->_workQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1002430B0;
  block[3] = &unk_100639350;
  id v14 = v8;
  id v15 = self;
  id v16 = v9;
  id v11 = v9;
  id v12 = v8;
  dispatch_async((dispatch_queue_t)workQueue, block);
}

- (id)createCurrentNotificationRegistrationState
{
  v2 = objc_alloc_init(&OBJC_CLASS___PDNotificationStreamRegistrationState);
  id v3 = (void *)objc_claimAutoreleasedReturnValue( +[NSSet setWithObject:]( &OBJC_CLASS___NSSet,  "setWithObject:",  PDDarwinNotificationEventSignificantTimeChanged));
  -[PDNotificationStreamRegistrationState setNotificationNames:forStream:]( v2,  "setNotificationNames:forStream:",  v3,  0LL);

  return v2;
}

- (void)handleNotificationWithName:(id)a3 event:(id)a4 forStream:(int64_t)a5
{
  workQueue = self->_workQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1002431C8;
  block[3] = &unk_100639300;
  void block[4] = self;
  dispatch_async((dispatch_queue_t)workQueue, block);
}

- (void)transactionSourceIdentifier:(id)a3 didReceiveTransaction:(id)a4 oldTransaction:(id)a5
{
}

- (void)transactionSourceIdentifier:(id)a3 didRemoveTransactionWithIdentifier:(id)a4
{
}

- (void)indexingStarted
{
}

- (void)indexingCompleted
{
}

- (void)indexedItemsWithIdentifiers:(id)a3
{
}

- (void)_sendInvalidationCallback
{
  p_lockPendingInvalidationCallback = &self->_lockPendingInvalidationCallback;
  os_unfair_lock_lock(&self->_lockPendingInvalidationCallback);
  if (self->_pendingInvalidationCallback)
  {
    os_unfair_lock_unlock(p_lockPendingInvalidationCallback);
  }

  else
  {
    self->_pendingInvalidationCallback = 1;
    os_unfair_lock_unlock(p_lockPendingInvalidationCallback);
    dispatch_time_t v4 = dispatch_time(0LL, 3000000000LL);
    id v5 = PDUtilityQueue();
    id v6 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(v5);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_1002432D0;
    block[3] = &unk_100639300;
    void block[4] = self;
    dispatch_after(v4, v6, block);
  }

- (PDDatabaseManager)databaseManager
{
  return self->_databaseManager;
}

- (void)setDatabaseManager:(id)a3
{
}

- (PDAccountManager)accountManager
{
  return self->_accountManager;
}

- (PDFamilyCircleManager)familyCircleManager
{
  return self->_familyCircleManager;
}

- (void)setFamilyCircleManager:(id)a3
{
}

- (PDSpotlightIndexer)indexer
{
  return self->_indexer;
}

- (void).cxx_destruct
{
}

@end