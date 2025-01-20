@interface PDPaymentOffersManager
- (PDPaymentOffersManager)initWithPushNotificationManager:(id)a3 paymentWebServiceCoordinator:(id)a4 databaseManager:(id)a5;
- (id)_endpointMetadataForPassUniqueID:(id)a3 type:(unint64_t)a4;
- (id)paymentOfferCatalog;
- (id)paymentRewardsBalanceWithIdentifier:(id)a3;
- (id)paymentRewardsBalancesWithPassUniqueIdentifier:(id)a3;
- (id)paymentRewardsRedemptionsForPassUniqueIdentifier:(id)a3 limit:(int64_t)a4;
- (id)pushNotificationTopics;
- (void)_accessObserversWithHandler:(id)a3;
- (void)_addPaymentOffersManagerFetchRequest:(id)a3;
- (void)_executeFetchRequest:(id)a3 completion:(id)a4;
- (void)_executeNextPaymentOffersManagerFetchIfPossibleForRequestIdentifier:(id)a3;
- (void)_managerFetch_paymentOffersCatalogWithRequest:(id)a3 completion:(id)a4;
- (void)_updateCatalogAfterPassChangeEvent;
- (void)_updateCatalogFetchScheduledTaskIfNecessary;
- (void)_updatePaymentOffersCatalogFromPush:(BOOL)a3 completion:(id)a4;
- (void)_updatePushTopics;
- (void)_updateRewardsBalanceFetchScheduledTaskIfNecessary:(id)a3;
- (void)dealloc;
- (void)deleteIssuerInstallmentTransactionsForPassUniqueID:(id)a3 completion:(id)a4;
- (void)handlePushNotificationForTopic:(id)a3 userInfo:(id)a4;
- (void)insertOrUpdatePaymentRewardsRedemption:(id)a3 withPassUniqueIdentifier:(id)a4;
- (void)issuerInstallmentTransactionsForPassUniqueID:(id)a3 completion:(id)a4;
- (void)issuerInstallmentTransactionsForTransactionSourceIdentifiers:(id)a3 paymentHashes:(id)a4 completion:(id)a5;
- (void)noteAccountDeleted;
- (void)passAdded:(id)a3;
- (void)passRemoved:(id)a3;
- (void)paymentRewardsRedemptionsForPassUniqueIdentifier:(id)a3 paymentHashes:(id)a4 completion:(id)a5;
- (void)paymentWebServiceCoordinatorWebServiceDidChange:(id)a3;
- (void)performScheduledActivityWithIdentifier:(id)a3 activityCriteria:(id)a4;
- (void)registerObserver:(id)a3;
- (void)removePaymentOffersCatalog;
- (void)unregisterObserver:(id)a3;
- (void)updatePaymentOffersCatalogWithCompletion:(id)a3;
- (void)updatePaymentRewardsBalancesWithPassUniqueIdentifier:(id)a3 completion:(id)a4;
- (void)updatePaymentRewardsRedemptionsWithPassUniqueIdentifier:(id)a3 limit:(int64_t)a4 completion:(id)a5;
@end

@implementation PDPaymentOffersManager

- (PDPaymentOffersManager)initWithPushNotificationManager:(id)a3 paymentWebServiceCoordinator:(id)a4 databaseManager:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v27.receiver = self;
  v27.super_class = (Class)&OBJC_CLASS___PDPaymentOffersManager;
  v12 = -[PDPaymentOffersManager init](&v27, "init");
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_pushNotificationManager, a3);
    objc_storeStrong((id *)&v13->_paymentWebServiceCoordinator, a4);
    -[PDPaymentWebServiceCoordinator registerObserver:](v13->_paymentWebServiceCoordinator, "registerObserver:", v13);
    objc_storeStrong((id *)&v13->_databaseManager, a5);
    v13->_lockPushTopics._os_unfair_lock_opaque = 0;
    dispatch_queue_attr_t v14 = dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v15 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v14);
    dispatch_queue_t v16 = dispatch_queue_create("com.apple.passd.PDPaymentOffersManager.work", v15);
    workQueue = v13->_workQueue;
    v13->_workQueue = (OS_dispatch_queue *)v16;

    dispatch_queue_t v18 = dispatch_queue_create("com.apple.passd.PDPaymentOffersManager.reply", v15);
    replyQueue = v13->_replyQueue;
    v13->_replyQueue = (OS_dispatch_queue *)v18;

    -[PDPushNotificationManager registerConsumer:](v13->_pushNotificationManager, "registerConsumer:", v13);
    -[PDPaymentOffersManager _updatePushTopics](v13, "_updatePushTopics");
    uint64_t v20 = objc_claimAutoreleasedReturnValue( +[NSHashTable pk_weakObjectsHashTableUsingPointerPersonality]( &OBJC_CLASS___NSHashTable,  "pk_weakObjectsHashTableUsingPointerPersonality"));
    observers = v13->_observers;
    v13->_observers = (NSHashTable *)v20;

    v13->_lockObservers._os_unfair_lock_opaque = 0;
    v22 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    fetchRequests = v13->_fetchRequests;
    v13->_fetchRequests = v22;

    v24 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    currentRequests = v13->_currentRequests;
    v13->_currentRequests = v24;

    v13->_fetchRequestLock._os_unfair_lock_opaque = 0;
    PDScheduledActivityClientRegister(@"PaymentOffersClientIdentifier", v13, v13->_workQueue);
  }

  return v13;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___PDPaymentOffersManager;
  -[PDPaymentOffersManager dealloc](&v3, "dealloc");
}

- (id)paymentOfferCatalog
{
  return -[PDDatabaseManager paymentOfferCatalog](self->_databaseManager, "paymentOfferCatalog");
}

- (void)removePaymentOffersCatalog
{
}

- (void)updatePaymentOffersCatalogWithCompletion:(id)a3
{
}

- (void)_updatePaymentOffersCatalogFromPush:(BOOL)a3 completion:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  v7 = -[PDPaymentOffersManagerCatalogFetchRequest initWithFromPush:completion:]( objc_alloc(&OBJC_CLASS___PDPaymentOffersManagerCatalogFetchRequest),  "initWithFromPush:completion:",  v4,  v6);

  -[PDPaymentOffersManager _addPaymentOffersManagerFetchRequest:](self, "_addPaymentOffersManagerFetchRequest:", v7);
}

- (void)_managerFetch_paymentOffersCatalogWithRequest:(id)a3 completion:(id)a4
{
  id v5 = a4;
  id v6 = v5;
  if (v5)
  {
    workQueue = self->_workQueue;
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472LL;
    v8[2] = sub_1003E39C4;
    v8[3] = &unk_10063AC90;
    v8[4] = self;
    id v9 = v5;
    dispatch_async((dispatch_queue_t)workQueue, v8);
  }
}

- (void)issuerInstallmentTransactionsForPassUniqueID:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v7)
  {
    workQueue = self->_workQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_1003E4020;
    block[3] = &unk_100639AF0;
    block[4] = self;
    id v10 = v6;
    id v11 = v7;
    dispatch_async((dispatch_queue_t)workQueue, block);
  }
}

- (void)issuerInstallmentTransactionsForTransactionSourceIdentifiers:(id)a3 paymentHashes:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (v10)
  {
    workQueue = self->_workQueue;
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472LL;
    v12[2] = sub_1003E41B0;
    v12[3] = &unk_10063B440;
    v12[4] = self;
    id v13 = v8;
    id v14 = v9;
    id v15 = v10;
    dispatch_async((dispatch_queue_t)workQueue, v12);
  }
}

- (void)deleteIssuerInstallmentTransactionsForPassUniqueID:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v7)
  {
    workQueue = self->_workQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_1003E431C;
    block[3] = &unk_100639AF0;
    block[4] = self;
    id v10 = v6;
    id v11 = v7;
    dispatch_async((dispatch_queue_t)workQueue, block);
  }
}

- (void)_addPaymentOffersManagerFetchRequest:(id)a3
{
  BOOL v4 = (NSMutableArray *)a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray requestIdentifier](v4, "requestIdentifier"));
  uint64_t Object = PKLogFacilityTypeGetObject(6LL);
  id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v21 = v4;
    _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "Payment Offers manager request incoming %@",  buf,  0xCu);
  }

  os_unfair_lock_lock(&self->_fetchRequestLock);
  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](self->_fetchRequests, "objectForKey:", v5));
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  __int128 v18 = 0u;
  __int128 v19 = 0u;
  id v9 = v8;
  id v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v9,  "countByEnumeratingWithState:objects:count:",  &v16,  v24,  16LL);
  if (v10)
  {
    id v11 = v10;
    uint64_t v12 = *(void *)v17;
    while (2)
    {
      for (i = 0LL; i != v11; i = (char *)i + 1)
      {
        if (*(void *)v17 != v12) {
          objc_enumerationMutation(v9);
        }
        id v14 = *(void **)(*((void *)&v16 + 1) + 8LL * (void)i);
        if (objc_msgSend(v14, "coalesceWithRequest:", v4, (void)v16))
        {
          if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412546;
            v21 = v4;
            __int16 v22 = 2112;
            v23 = v14;
            _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "Payment offers manager request coalesced %@ onto existing request %@",  buf,  0x16u);
          }

          id v7 = (os_log_s *)v4;
          id v15 = v9;
          goto LABEL_20;
        }
      }

      id v11 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v9,  "countByEnumeratingWithState:objects:count:",  &v16,  v24,  16LL);
      if (v11) {
        continue;
      }
      break;
    }
  }

  if (v4)
  {
    id v15 = v9;
    if (!v9)
    {
      id v15 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
      -[NSMutableDictionary setObject:forKey:](self->_fetchRequests, "setObject:forKey:", v15, v5);
    }

    -[NSMutableArray addObject:](v15, "addObject:", v4, (void)v16);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v21 = v4;
      _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "Payment offers manager request queued %@",  buf,  0xCu);
    }

    id v9 = v4;
LABEL_20:

    id v9 = v15;
  }

  os_unfair_lock_unlock(&self->_fetchRequestLock);
  -[PDPaymentOffersManager _executeNextPaymentOffersManagerFetchIfPossibleForRequestIdentifier:]( self,  "_executeNextPaymentOffersManagerFetchIfPossibleForRequestIdentifier:",  v5);
}

- (void)_executeNextPaymentOffersManagerFetchIfPossibleForRequestIdentifier:(id)a3
{
  id v4 = a3;
  os_unfair_lock_lock(&self->_fetchRequestLock);
  uint64_t v5 = objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](self->_currentRequests, "objectForKey:", v4));
  if (v5)
  {
    id v6 = (void *)v5;
    os_unfair_lock_unlock(&self->_fetchRequestLock);
  }

  else
  {
    id v7 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](self->_fetchRequests, "objectForKey:", v4));
    uint64_t v8 = objc_claimAutoreleasedReturnValue([v7 firstObject]);
    if (v8)
    {
      id v9 = (void *)v8;
      [v7 removeObjectAtIndex:0];
      currentRequests = self->_currentRequests;
      id v11 = v9;
      -[NSMutableDictionary setObject:forKey:](currentRequests, "setObject:forKey:", v11, v4);

      os_unfair_lock_unlock(&self->_fetchRequestLock);
      v12[0] = _NSConcreteStackBlock;
      v12[1] = 3221225472LL;
      v12[2] = sub_1003E4774;
      v12[3] = &unk_1006392B0;
      v12[4] = self;
      id v13 = v4;
      -[PDPaymentOffersManager _executeFetchRequest:completion:](self, "_executeFetchRequest:completion:", v11, v12);
    }

    else
    {

      os_unfair_lock_unlock(&self->_fetchRequestLock);
    }
  }
}

- (void)_executeFetchRequest:(id)a3 completion:(id)a4
{
  id v6 = a3;
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472LL;
  v14[2] = sub_1003E493C;
  v14[3] = &unk_10063AC90;
  v14[4] = self;
  id v7 = a4;
  id v15 = v7;
  uint64_t v8 = objc_retainBlock(v14);
  uint64_t Object = PKLogFacilityTypeGetObject(6LL);
  id v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v17 = v6;
    _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "Payment offers manager request started %@",  buf,  0xCu);
  }

  if (![v6 requestType])
  {
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472LL;
    v11[2] = sub_1003E49C0;
    v11[3] = &unk_10065CBA8;
    id v12 = v6;
    id v13 = v8;
    -[PDPaymentOffersManager _managerFetch_paymentOffersCatalogWithRequest:completion:]( self,  "_managerFetch_paymentOffersCatalogWithRequest:completion:",  v12,  v11);
  }
}

- (void)_updatePushTopics
{
  id v6 = (id)objc_claimAutoreleasedReturnValue( -[PDPaymentWebServiceCoordinator paymentOffersServicePushTopics]( self->_paymentWebServiceCoordinator,  "paymentOffersServicePushTopics"));
  os_unfair_lock_lock(&self->_lockPushTopics);
  id v3 = -[NSSet copy](self->_pushTopics, "copy");
  id v4 = (NSSet *)[v6 copy];
  pushTopics = self->_pushTopics;
  self->_pushTopics = v4;

  os_unfair_lock_unlock(&self->_lockPushTopics);
  if ((PKEqualObjects(v3, v6) & 1) == 0) {
    -[PDPushNotificationManager recalculatePushTopics](self->_pushNotificationManager, "recalculatePushTopics");
  }
}

- (id)pushNotificationTopics
{
  p_lockPushTopics = &self->_lockPushTopics;
  os_unfair_lock_lock(&self->_lockPushTopics);
  id v4 = self->_pushTopics;
  os_unfair_lock_unlock(p_lockPushTopics);
  uint64_t Object = PKLogFacilityTypeGetObject(6LL);
  id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 138412290;
    id v10 = v4;
    _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "Payment Offers push topics: %@",  (uint8_t *)&v9,  0xCu);
  }

  id v7 = -[NSSet copy](v4, "copy");
  return v7;
}

- (void)handlePushNotificationForTopic:(id)a3 userInfo:(id)a4
{
  id v6 = (PDPaymentOffersManagerPushPayload *)a3;
  id v7 = (PDPaymentOffersManagerPushPayload *)a4;
  uint64_t Object = PKLogFacilityTypeGetObject(6LL);
  int v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    int v13 = 138412546;
    id v14 = v6;
    __int16 v15 = 2112;
    __int128 v16 = v7;
    _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "Payment Offers Received push for push topic: %@. userInfo: %@",  (uint8_t *)&v13,  0x16u);
  }

  os_unfair_lock_lock(&self->_lockPushTopics);
  unsigned int v10 = -[NSSet containsObject:](self->_pushTopics, "containsObject:", v6);
  os_unfair_lock_unlock(&self->_lockPushTopics);
  if (v10)
  {
    id v11 = -[PDPaymentOffersManagerPushPayload initWithDictionary:]( objc_alloc(&OBJC_CLASS___PDPaymentOffersManagerPushPayload),  "initWithDictionary:",  v7);
    BOOL v12 = os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT);
    if (v11)
    {
      if (v12)
      {
        int v13 = 138412290;
        id v14 = v11;
        _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "Payment Offers push payload defined: %@",  (uint8_t *)&v13,  0xCu);
      }

      if ((id)-[PDPaymentOffersManagerPushPayload endpoint](v11, "endpoint") == (id)1) {
        -[PDPaymentOffersManager _updatePaymentOffersCatalogFromPush:completion:]( self,  "_updatePaymentOffersCatalogFromPush:completion:",  1LL,  &stru_10065CBE8);
      }
    }

    else
    {
      if (v12)
      {
        int v13 = 138412290;
        id v14 = v7;
        _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "Error: Payment Offers push payload is not defined properly %@",  (uint8_t *)&v13,  0xCu);
      }
    }
  }
}

- (void)registerObserver:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    os_unfair_lock_lock(&self->_lockObservers);
    -[NSHashTable addObject:](self->_observers, "addObject:", v4);
    os_unfair_lock_unlock(&self->_lockObservers);
  }
}

- (void)unregisterObserver:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    os_unfair_lock_lock(&self->_lockObservers);
    -[NSHashTable removeObject:](self->_observers, "removeObject:", v4);
    os_unfair_lock_unlock(&self->_lockObservers);
  }
}

- (void)_accessObserversWithHandler:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    os_unfair_lock_lock(&self->_lockObservers);
    uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSHashTable allObjects](self->_observers, "allObjects"));
    os_unfair_lock_unlock(&self->_lockObservers);
    replyQueue = self->_replyQueue;
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472LL;
    v8[2] = sub_1003E4F04;
    v8[3] = &unk_10063AC90;
    id v9 = v5;
    id v10 = v4;
    id v7 = v5;
    dispatch_async((dispatch_queue_t)replyQueue, v8);
  }
}

- (void)passAdded:(id)a3
{
  uint64_t Object = PKLogFacilityTypeGetObject(6LL);
  id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    id v7 = a3;
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v7 organizationName]);
    id v9 = (void *)objc_claimAutoreleasedReturnValue([v7 primaryAccountIdentifier]);
    id v10 = (void *)objc_claimAutoreleasedReturnValue([v7 uniqueID]);

    int v11 = 138413058;
    id v12 = a3;
    __int16 v13 = 2112;
    id v14 = v8;
    __int16 v15 = 2112;
    __int128 v16 = v9;
    __int16 v17 = 2112;
    __int128 v18 = v10;
    _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "PDPaymentOffersManager passAdded: %@, %@, %@, %@",  (uint8_t *)&v11,  0x2Au);
  }

  -[PDPaymentOffersManager _updateCatalogAfterPassChangeEvent](self, "_updateCatalogAfterPassChangeEvent");
}

- (void)passRemoved:(id)a3
{
  id v4 = a3;
  uint64_t Object = PKLogFacilityTypeGetObject(6LL);
  id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    id v7 = (void *)objc_claimAutoreleasedReturnValue([v4 organizationName]);
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v4 primaryAccountIdentifier]);
    id v9 = (void *)objc_claimAutoreleasedReturnValue([v4 uniqueID]);
    int v11 = 138413058;
    id v12 = v4;
    __int16 v13 = 2112;
    id v14 = v7;
    __int16 v15 = 2112;
    __int128 v16 = v8;
    __int16 v17 = 2112;
    __int128 v18 = v9;
    _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "PDPaymentOffersManager passRemoved: %@, %@, %@, %@",  (uint8_t *)&v11,  0x2Au);
  }

  -[PDPaymentOffersManager _updateCatalogAfterPassChangeEvent](self, "_updateCatalogAfterPassChangeEvent");
  if (!-[PDDatabaseManager hasSecureElementPassesOfType:](self->_databaseManager, "hasSecureElementPassesOfType:", 1LL))
  {
    PKSharedCacheSetBoolForKey(0LL, PKSharedCacheHasEverMadeIssuerInstallmentTransaction);
    PKSharedCacheSetBoolForKey(0LL, PKSharedCacheHasEverMadePayWithRewardsTransaction);
    id v10 = (void *)objc_claimAutoreleasedReturnValue([v4 uniqueID]);
    PKSetHasSeenPaymentOfferInstallmentPartnerExplanationScreen(0LL, v10);
  }
}

- (void)_updateCatalogAfterPassChangeEvent
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[PDDatabaseManager paymentOfferCatalog](self->_databaseManager, "paymentOfferCatalog"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 lastUpdated]);

  if (v4
    && (uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date")),
        [v5 timeIntervalSinceDate:v4],
        double v7 = v6,
        v5,
        v7 <= 120.0))
  {
    -[PDPaymentOffersManager _updateCatalogFetchScheduledTaskIfNecessary]( self,  "_updateCatalogFetchScheduledTaskIfNecessary");
  }

  else
  {
    uint64_t Object = PKLogFacilityTypeGetObject(6LL);
    id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v10 = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "PDPaymentOffersManager updating catalog now because of a pass change",  v10,  2u);
    }

    -[PDPaymentOffersManager _updatePaymentOffersCatalogFromPush:completion:]( self,  "_updatePaymentOffersCatalogFromPush:completion:",  0LL,  &stru_10065CC08);
  }
}

- (void)noteAccountDeleted
{
}

- (void)performScheduledActivityWithIdentifier:(id)a3 activityCriteria:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t Object = PKLogFacilityTypeGetObject(6LL);
  id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    int v17 = 138412290;
    id v18 = v6;
    _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "PDPaymentOffersManager scheduled activity fired %@",  (uint8_t *)&v17,  0xCu);
  }

  id v10 = (__CFString *)v6;
  int v11 = v10;
  if (v10 == @"PaymentOffersFetchCatalog") {
    goto LABEL_6;
  }
  if (v10)
  {
    unsigned int v12 = -[__CFString isEqualToString:](v10, "isEqualToString:", @"PaymentOffersFetchCatalog");

    if (v12)
    {
LABEL_6:
      -[PDPaymentOffersManager updatePaymentOffersCatalogWithCompletion:]( self,  "updatePaymentOffersCatalogWithCompletion:",  &stru_10065CC28);
      goto LABEL_7;
    }

    __int16 v13 = v11;
    if (v13 == @"PaymentOffersFetchRewardsBalance"
      || (id v14 = v13,
          unsigned int v15 = -[__CFString isEqualToString:]( v13,  "isEqualToString:",  @"PaymentOffersFetchRewardsBalance"),  v14,  v15))
    {
      __int128 v16 = (void *)objc_claimAutoreleasedReturnValue([v7 reason]);
      if (v16)
      {
        -[PDPaymentOffersManager updatePaymentRewardsBalancesWithPassUniqueIdentifier:completion:]( self,  "updatePaymentRewardsBalancesWithPassUniqueIdentifier:completion:",  v16,  &stru_10065CC48);
        -[PDPaymentOffersManager updatePaymentRewardsRedemptionsWithPassUniqueIdentifier:limit:completion:]( self,  "updatePaymentRewardsRedemptionsWithPassUniqueIdentifier:limit:completion:",  v16,  5LL,  &stru_10065CC68);
      }

      else
      {
        if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
        {
          LOWORD(v17) = 0;
          _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "Failed updating payment rewards balance and redemptions following scheduled task, no pass identifier",  (uint8_t *)&v17,  2u);
        }
      }
    }
  }

- (void)_updateCatalogFetchScheduledTaskIfNecessary
{
  workQueue = self->_workQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1003E58A8;
  block[3] = &unk_100639300;
  block[4] = self;
  dispatch_async((dispatch_queue_t)workQueue, block);
}

- (void)_updateRewardsBalanceFetchScheduledTaskIfNecessary:(id)a3
{
  id v4 = a3;
  workQueue = self->_workQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_1003E5C24;
  v7[3] = &unk_1006392B0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async((dispatch_queue_t)workQueue, v7);
}

- (void)paymentWebServiceCoordinatorWebServiceDidChange:(id)a3
{
  workQueue = self->_workQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1003E5FB0;
  block[3] = &unk_100639300;
  block[4] = self;
  dispatch_async((dispatch_queue_t)workQueue, block);
}

- (id)_endpointMetadataForPassUniqueID:(id)a3 type:(unint64_t)a4
{
  id v6 = a3;
  id v7 = (void *)objc_claimAutoreleasedReturnValue( -[PDDatabaseManager passEndpointMetadataForPassUniqueID:type:]( self->_databaseManager,  "passEndpointMetadataForPassUniqueID:type:",  v6,  a4));
  id v8 = v7;
  if (v7) {
    id v9 = v7;
  }
  else {
    id v9 = -[PDPassEndpointMetadata initWithType:passUniqueID:]( objc_alloc(&OBJC_CLASS___PDPassEndpointMetadata),  "initWithType:passUniqueID:",  a4,  v6);
  }
  id v10 = v9;

  return v10;
}

- (void)paymentRewardsRedemptionsForPassUniqueIdentifier:(id)a3 paymentHashes:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (v10)
  {
    workQueue = self->_workQueue;
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472LL;
    v12[2] = sub_1003E6174;
    v12[3] = &unk_10063B440;
    v12[4] = self;
    id v13 = v8;
    id v14 = v9;
    id v15 = v10;
    dispatch_async((dispatch_queue_t)workQueue, v12);
  }
}

- (void)updatePaymentRewardsBalancesWithPassUniqueIdentifier:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = v7;
  if (v7)
  {
    v30[0] = _NSConcreteStackBlock;
    v30[1] = 3221225472LL;
    v30[2] = sub_1003E6538;
    v30[3] = &unk_10065CC90;
    v30[4] = self;
    id v9 = v7;
    id v31 = v9;
    id v10 = objc_retainBlock(v30);
    int v11 = (void (**)(void, void))v10;
    if (v6)
    {
      unsigned int v12 = (void *)objc_claimAutoreleasedReturnValue( -[PDDatabaseManager passWithUniqueIdentifier:]( self->_databaseManager,  "passWithUniqueIdentifier:",  v6));
      id v13 = (void *)objc_claimAutoreleasedReturnValue([v12 secureElementPass]);

      if (v13)
      {
        id v14 = (void *)objc_claimAutoreleasedReturnValue([v13 primaryAccountIdentifier]);
        if (v14)
        {
          id v15 = (void *)objc_claimAutoreleasedReturnValue( -[PDDatabaseManager anyEligiblePaymentOfferRewardsCriteriaForPass:]( self->_databaseManager,  "anyEligiblePaymentOfferRewardsCriteriaForPass:",  v13));
          __int128 v16 = v15;
          if (v15
            && (int v17 = (void *)objc_claimAutoreleasedReturnValue([v15 identifier]), v17, v17))
          {
            workQueue = self->_workQueue;
            block[0] = _NSConcreteStackBlock;
            block[1] = 3221225472LL;
            block[2] = sub_1003E6724;
            block[3] = &unk_10065CD08;
            block[4] = self;
            id v24 = v13;
            v28 = v11;
            id v25 = v14;
            id v26 = v16;
            id v27 = v6;
            id v29 = v9;
            dispatch_async((dispatch_queue_t)workQueue, block);
          }

          else
          {
            uint64_t Object = PKLogFacilityTypeGetObject(48LL);
            __int16 v22 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
            if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412290;
              id v33 = v6;
              _os_log_impl( (void *)&_mh_execute_header,  v22,  OS_LOG_TYPE_DEFAULT,  "Payment Pass %@ is not eligible for rewards balance update",  buf,  0xCu);
            }

            -[PDDatabaseManager deletePaymentRewardsBalancesForPassUniqueIdentifier:]( self->_databaseManager,  "deletePaymentRewardsBalancesForPassUniqueIdentifier:",  v6);
            ((void (**)(void, const __CFString *))v11)[2]( v11,  @"There is no payment offers rewards criteria for pass");
          }
        }

        else
        {
          ((void (**)(void, const __CFString *))v11)[2]( v11,  @"Pass has no fpanIdentifier to get rewards balance");
        }
      }

      else
      {
        ((void (**)(void, const __CFString *))v11)[2]( v11,  @"Pass with passUniqueIdentifier not found");
      }
    }

    else
    {
      ((void (*)(void *, const __CFString *))v10[2])( v10,  @"No passUniqueIdentifier was provided for update rewards balance");
    }
  }

  else
  {
    uint64_t v19 = PKLogFacilityTypeGetObject(48LL);
    uint64_t v20 = (os_log_s *)objc_claimAutoreleasedReturnValue(v19);
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v20,  OS_LOG_TYPE_DEFAULT,  "No completion was provided for update rewards balance",  buf,  2u);
    }
  }
}

- (void)updatePaymentRewardsRedemptionsWithPassUniqueIdentifier:(id)a3 limit:(int64_t)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  id v10 = v9;
  if (v9)
  {
    v35[0] = _NSConcreteStackBlock;
    v35[1] = 3221225472LL;
    v35[2] = sub_1003E6EFC;
    v35[3] = &unk_10065CC90;
    v35[4] = self;
    id v11 = v9;
    id v36 = v11;
    unsigned int v12 = objc_retainBlock(v35);
    id v13 = (void (**)(void, void))v12;
    if (v8)
    {
      id v14 = (void *)objc_claimAutoreleasedReturnValue( -[PDDatabaseManager passWithUniqueIdentifier:]( self->_databaseManager,  "passWithUniqueIdentifier:",  v8));
      id v15 = (void *)objc_claimAutoreleasedReturnValue([v14 secureElementPass]);

      if (v15)
      {
        uint64_t v16 = objc_claimAutoreleasedReturnValue([v15 primaryAccountIdentifier]);
        int v17 = (void *)v16;
        if (v16)
        {
          id v26 = (void *)v16;
          id v18 = (void *)objc_claimAutoreleasedReturnValue( -[PDDatabaseManager anyEligiblePaymentOfferRewardsCriteriaForPass:]( self->_databaseManager,  "anyEligiblePaymentOfferRewardsCriteriaForPass:",  v15));
          uint64_t v19 = v18;
          if (v18
            && (uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue([v18 identifier]), v20, v20))
          {
            workQueue = self->_workQueue;
            block[0] = _NSConcreteStackBlock;
            block[1] = 3221225472LL;
            block[2] = sub_1003E70E8;
            block[3] = &unk_10065CD80;
            block[4] = self;
            id v28 = v15;
            v32 = v13;
            id v29 = v26;
            id v30 = v19;
            int64_t v34 = a4;
            id v33 = v11;
            id v31 = v8;
            dispatch_async((dispatch_queue_t)workQueue, block);
          }

          else
          {
            uint64_t Object = PKLogFacilityTypeGetObject(48LL);
            id v25 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
            if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412290;
              id v38 = v8;
              _os_log_impl( (void *)&_mh_execute_header,  v25,  OS_LOG_TYPE_DEFAULT,  "Payment Pass %@ is not eligible for rewards redemptions update",  buf,  0xCu);
            }

            ((void (**)(void, const __CFString *))v13)[2]( v13,  @"There is no payment offers rewards criteria for pass");
          }

          int v17 = v26;
        }

        else
        {
          ((void (**)(void, const __CFString *))v13)[2]( v13,  @"Pass has no fpanIdentifier to get rewards redemptions");
        }
      }

      else
      {
        ((void (**)(void, const __CFString *))v13)[2]( v13,  @"Pass with passUniqueIdentifier not found");
      }
    }

    else
    {
      ((void (*)(void *, const __CFString *))v12[2])( v12,  @"No passUniqueIdentifier was provided for update rewards redemptions");
    }
  }

  else
  {
    uint64_t v22 = PKLogFacilityTypeGetObject(48LL);
    v23 = (os_log_s *)objc_claimAutoreleasedReturnValue(v22);
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v23,  OS_LOG_TYPE_DEFAULT,  "No completion was provided for update rewards redemptions",  buf,  2u);
    }
  }
}

- (id)paymentRewardsBalanceWithIdentifier:(id)a3
{
  return -[PDDatabaseManager paymentRewardsBalanceWithIdentifier:]( self->_databaseManager,  "paymentRewardsBalanceWithIdentifier:",  a3);
}

- (id)paymentRewardsBalancesWithPassUniqueIdentifier:(id)a3
{
  return -[PDDatabaseManager paymentRewardsBalancesForPassUniqueIdentifier:]( self->_databaseManager,  "paymentRewardsBalancesForPassUniqueIdentifier:",  a3);
}

- (id)paymentRewardsRedemptionsForPassUniqueIdentifier:(id)a3 limit:(int64_t)a4
{
  return -[PDDatabaseManager paymentRewardsRedemptionsForPassUniqueIdentifier:limit:]( self->_databaseManager,  "paymentRewardsRedemptionsForPassUniqueIdentifier:limit:",  a3,  a4);
}

- (void)insertOrUpdatePaymentRewardsRedemption:(id)a3 withPassUniqueIdentifier:(id)a4
{
  id v7 = a3;
  id v6 = a4;
  -[PDDatabaseManager insertOrUpdatePaymentRewardsRedemption:withPassUniqueIdentifier:]( self->_databaseManager,  "insertOrUpdatePaymentRewardsRedemption:withPassUniqueIdentifier:",  v7,  v6);
  if ([v7 hasOriginalTransactionDetails]
    && [v7 isInGoodStanding])
  {
    -[PDPaymentOffersManager _updateRewardsBalanceFetchScheduledTaskIfNecessary:]( self,  "_updateRewardsBalanceFetchScheduledTaskIfNecessary:",  v6);
  }
}

- (void).cxx_destruct
{
}

@end