@interface PDWorldRegionAggregator
- (BOOL)_hasRegionsOrTransactionsToProcess;
- (BOOL)_hasTransactionsToProcess;
- (BOOL)isProcessing;
- (BOOL)willRequireProcessing;
- (PDWorldRegionAggregator)initWithDatabaseManager:(id)a3;
- (id)_worldRegionFromPlacemark:(id)a3 orAddress:(id)a4;
- (id)updateRegionWithIdentifier:(id)a3 localizedName:(id)a4 boundingRegion:(id *)a5 mapsIdentifier:(unint64_t)a6 providerIdentifier:(int)a7;
- (id)updateRegionWithIdentifier:(id)a3 localizedName:(id)a4 localeIdentifier:(id)a5 boundingRegion:(id *)a6 mapsIdentifier:(unint64_t)a7 providerIdentifier:(int)a8;
- (void)_accessObserversWithHandler:(id)a3;
- (void)_associateTransaction:(id)a3 toRegion:(id)a4;
- (void)_cleanupRegionsWithCompletion:(id)a3;
- (void)_processMissingLocalizedContent:(id)a3 completion:(id)a4;
- (void)_processMissingLocalizedContentWithCompletion:(id)a3;
- (void)_processRemainingTransactionsWithCompletion:(id)a3;
- (void)_processTransaction:(id)a3 completion:(id)a4;
- (void)addObserver:(id)a3;
- (void)placemarkFound:(id)a3 forTransaction:(id)a4;
- (void)removeObserver:(id)a3;
- (void)transactionSourceIdentifier:(id)a3 didReceiveTransaction:(id)a4 oldTransaction:(id)a5;
- (void)triggerAggregatorWithTriggerOrigin:(unint64_t)a3;
@end

@implementation PDWorldRegionAggregator

- (PDWorldRegionAggregator)initWithDatabaseManager:(id)a3
{
  id v5 = a3;
  if (PKIsPhone(v5, v6))
  {
    v15.receiver = self;
    v15.super_class = (Class)&OBJC_CLASS___PDWorldRegionAggregator;
    v7 = -[PDWorldRegionAggregator init](&v15, "init");
    v8 = v7;
    if (v7)
    {
      objc_storeStrong((id *)&v7->_databaseManager, a3);
      v9 = objc_alloc_init(&OBJC_CLASS___CLGeocoder);
      geocoder = v8->_geocoder;
      v8->_geocoder = v9;

      v8->_lockOperation._os_unfair_lock_opaque = 0;
      v8->_lockObservers._os_unfair_lock_opaque = 0;
      uint64_t v11 = objc_claimAutoreleasedReturnValue( +[NSHashTable pk_weakObjectsHashTableUsingPointerPersonality]( &OBJC_CLASS___NSHashTable,  "pk_weakObjectsHashTableUsingPointerPersonality"));
      observers = v8->_observers;
      v8->_observers = (NSHashTable *)v11;

      v8->_willRequireProcessing = -[PDWorldRegionAggregator _hasRegionsOrTransactionsToProcess]( v8,  "_hasRegionsOrTransactionsToProcess");
    }

    self = v8;
    v13 = self;
  }

  else
  {
    v13 = 0LL;
  }

  return v13;
}

- (BOOL)_hasRegionsOrTransactionsToProcess
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSLocale currentLocale](&OBJC_CLASS___NSLocale, "currentLocale"));
  v4 = (void *)objc_claimAutoreleasedReturnValue([v3 localeIdentifier]);

  if (-[PDDatabaseManager hasRegionsMissingLocalizedContentForLocaleIdentifier:]( self->_databaseManager,  "hasRegionsMissingLocalizedContentForLocaleIdentifier:",  v4))
  {
    BOOL v5 = 1;
  }

  else
  {
    BOOL v5 = -[PDWorldRegionAggregator _hasTransactionsToProcess](self, "_hasTransactionsToProcess");
  }

  return v5;
}

- (BOOL)_hasTransactionsToProcess
{
  return -[PDDatabaseManager hasTransactionsMissingWorldRegionEligibleForProcessing]( self->_databaseManager,  "hasTransactionsMissingWorldRegionEligibleForProcessing");
}

- (BOOL)willRequireProcessing
{
  v2 = self;
  p_lockOperation = &self->_lockOperation;
  os_unfair_lock_lock(&self->_lockOperation);
  LOBYTE(v2) = v2->_willRequireProcessing;
  os_unfair_lock_unlock(p_lockOperation);
  return (char)v2;
}

- (void)placemarkFound:(id)a3 forTransaction:(id)a4
{
  id v8 = a4;
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue( -[PDWorldRegionAggregator _worldRegionFromPlacemark:orAddress:]( self,  "_worldRegionFromPlacemark:orAddress:",  a3,  0LL));
  if (v8 && v6)
  {
    -[PDWorldRegionAggregator _associateTransaction:toRegion:](self, "_associateTransaction:toRegion:", v8, v6);
    os_unfair_lock_lock(&self->_lockOperation);
    if (self->_willRequireProcessing) {
      BOOL v7 = 1;
    }
    else {
      BOOL v7 = -[PDWorldRegionAggregator _hasRegionsOrTransactionsToProcess](self, "_hasRegionsOrTransactionsToProcess");
    }
    self->_willRequireProcessing = v7;
    os_unfair_lock_unlock(&self->_lockOperation);
  }
}

- (void)transactionSourceIdentifier:(id)a3 didReceiveTransaction:(id)a4 oldTransaction:(id)a5
{
  p_lockOperation = &self->_lockOperation;
  os_unfair_lock_lock(&self->_lockOperation);
  if (self->_willRequireProcessing) {
    BOOL v7 = 1;
  }
  else {
    BOOL v7 = -[PDWorldRegionAggregator _hasTransactionsToProcess](self, "_hasTransactionsToProcess");
  }
  self->_willRequireProcessing = v7;
  os_unfair_lock_unlock(p_lockOperation);
}

- (id)updateRegionWithIdentifier:(id)a3 localizedName:(id)a4 localeIdentifier:(id)a5 boundingRegion:(id *)a6 mapsIdentifier:(unint64_t)a7 providerIdentifier:(int)a8
{
  double v14 = v11;
  double v15 = v10;
  double v16 = v9;
  double v17 = v8;
  id v21 = a3;
  id v22 = a4;
  id v23 = a5;
  v24 = (void *)objc_claimAutoreleasedReturnValue( -[PDDatabaseManager worldRegionWithIdentifier:localeIdentifier:]( self->_databaseManager,  "worldRegionWithIdentifier:localeIdentifier:",  v21,  0LL));
  v25 = v24;
  if (v24)
  {
    [v24 setLocalizedName:v22];
    objc_msgSend(v25, "setDisplayRegion:", v17, v16, v15, v14);
    [v25 setMuid:a6];
    [v25 setResultProviderIdentifier:a7];
    if (v23) {
      [v25 setLocaleIdentifier:v23];
    }
    -[PDDatabaseManager updateSingleRegion:](self->_databaseManager, "updateSingleRegion:", v25);
  }

  v26 = (void *)objc_claimAutoreleasedReturnValue( -[PDDatabaseManager worldRegionWithIdentifier:localeIdentifier:]( self->_databaseManager,  "worldRegionWithIdentifier:localeIdentifier:",  v21,  v23));

  return v26;
}

- (id)updateRegionWithIdentifier:(id)a3 localizedName:(id)a4 boundingRegion:(id *)a5 mapsIdentifier:(unint64_t)a6 providerIdentifier:(int)a7
{
  return -[PDWorldRegionAggregator updateRegionWithIdentifier:localizedName:localeIdentifier:boundingRegion:mapsIdentifier:providerIdentifier:]( self,  "updateRegionWithIdentifier:localizedName:localeIdentifier:boundingRegion:mapsIdentifier:providerIdentifier:",  a3,  a4,  0LL,  a5,  a6);
}

- (BOOL)isProcessing
{
  v2 = self;
  p_lockOperation = &self->_lockOperation;
  os_unfair_lock_lock(&self->_lockOperation);
  LOBYTE(v2) = v2->_addingOrLocalizingRegions;
  os_unfair_lock_unlock(p_lockOperation);
  return (char)v2;
}

- (void)triggerAggregatorWithTriggerOrigin:(unint64_t)a3
{
  if ((PKLocationServicesEnabled(self, a2) & 1) != 0)
  {
    BOOL v5 = a3 == 2;
    os_unfair_lock_lock(&self->_lockOperation);
    if (self->_performingOperation)
    {
      if (a3 == 2) {
        self->_operationUserInitiated = v5;
      }
      os_unfair_lock_unlock(&self->_lockOperation);
    }

    else
    {
      self->_performingOperation = 1;
      self->_operationUserInitiated = v5;
      os_unfair_lock_unlock(&self->_lockOperation);
      uint64_t Object = PKLogFacilityTypeGetObject(18LL);
      double v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Aggregation operation starting", buf, 2u);
      }

      *(void *)buf = 0LL;
      double v16 = buf;
      uint64_t v17 = 0x3032000000LL;
      v18 = sub_10032A208;
      v19 = sub_10032A218;
      id v20 = (id)PDOSTransactionCreate("PDWorldRegionAggregator.aggregation_operation");
      if (a3 == 2) {
        id v10 = PDDefaultQueue();
      }
      else {
        id v10 = PDUtilityQueue();
      }
      double v11 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(v10);
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472LL;
      block[2] = sub_10032A220;
      block[3] = &unk_100657248;
      BOOL v13 = a3 == 2;
      BOOL v14 = a3 == 0;
      block[4] = self;
      block[5] = buf;
      dispatch_async(v11, block);

      _Block_object_dispose(buf, 8);
    }
  }

  else
  {
    uint64_t v6 = PKLogFacilityTypeGetObject(18LL);
    BOOL v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "Skipping region aggregation, location services disabled.",  buf,  2u);
    }

    os_unfair_lock_lock(&self->_lockOperation);
    *(_WORD *)&self->_addingOrLocalizingRegions = 0;
    os_unfair_lock_unlock(&self->_lockOperation);
    -[PDWorldRegionAggregator _accessObserversWithHandler:](self, "_accessObserversWithHandler:", &stru_1006571D0);
  }

- (void)_cleanupRegionsWithCompletion:(id)a3
{
  id v5 = a3;
  -[PDDatabaseManager deleteRegionsWithNoMatchingTransactions]( self->_databaseManager,  "deleteRegionsWithNoMatchingTransactions");
  v4 = v5;
  if (v5)
  {
    (*((void (**)(id))v5 + 2))(v5);
    v4 = v5;
  }
}

- (void)_processMissingLocalizedContentWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSLocale currentLocale](&OBJC_CLASS___NSLocale, "currentLocale"));
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue([v5 localeIdentifier]);

  BOOL v7 = (void *)objc_claimAutoreleasedReturnValue( -[PDDatabaseManager regionsMissingLocalizedContentForLocaleIdentifier:]( self->_databaseManager,  "regionsMissingLocalizedContentForLocaleIdentifier:",  v6));
  uint64_t Object = PKLogFacilityTypeGetObject(18LL);
  double v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 134217984;
    *(void *)((char *)&buf + 4) = [v7 count];
    _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "Localizing content for %ld regions",  (uint8_t *)&buf,  0xCu);
  }

  if ([v7 count])
  {
    os_unfair_lock_lock(&self->_lockOperation);
    self->_addingOrLocalizingRegions = 1;
    os_unfair_lock_unlock(&self->_lockOperation);
    -[PDWorldRegionAggregator _accessObserversWithHandler:](self, "_accessObserversWithHandler:", &stru_100657268);
  }

  *(void *)&__int128 buf = 0LL;
  *((void *)&buf + 1) = &buf;
  uint64_t v29 = 0x2020000000LL;
  char v30 = 1;
  id v10 = objc_alloc_init(&OBJC_CLASS___PKAsyncUnaryOperationComposer);
  __int128 v25 = 0u;
  __int128 v26 = 0u;
  __int128 v23 = 0u;
  __int128 v24 = 0u;
  id v11 = v7;
  id v12 = [v11 countByEnumeratingWithState:&v23 objects:v27 count:16];
  if (v12)
  {
    uint64_t v13 = *(void *)v24;
    do
    {
      for (i = 0LL; i != v12; i = (char *)i + 1)
      {
        if (*(void *)v24 != v13) {
          objc_enumerationMutation(v11);
        }
        uint64_t v15 = *(void *)(*((void *)&v23 + 1) + 8LL * (void)i);
        v22[0] = _NSConcreteStackBlock;
        v22[1] = 3221225472LL;
        v22[2] = sub_10032ABA4;
        v22[3] = &unk_10063B5A8;
        v22[4] = self;
        v22[5] = v15;
        v22[6] = &buf;
        [v10 addOperation:v22];
      }

      id v12 = [v11 countByEnumeratingWithState:&v23 objects:v27 count:16];
    }

    while (v12);
  }

  double v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSNull null](&OBJC_CLASS___NSNull, "null"));
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472LL;
  v19[2] = sub_10032AC98;
  v19[3] = &unk_100639778;
  id v17 = v4;
  id v20 = v17;
  p___int128 buf = &buf;
  id v18 = [v10 evaluateWithInput:v16 completion:v19];

  _Block_object_dispose(&buf, 8);
}

- (void)_processMissingLocalizedContent:(id)a3 completion:(id)a4
{
  if (a4) {
    (*((void (**)(id, void, void))a4 + 2))(a4, 0LL, 0LL);
  }
}

- (void)_processRemainingTransactionsWithCompletion:(id)a3
{
  id v4 = a3;
  os_unfair_lock_lock(&self->_lockOperation);
  BOOL operationUserInitiated = self->_operationUserInitiated;
  os_unfair_lock_unlock(&self->_lockOperation);
  if (operationUserInitiated) {
    id v6 = PDDefaultQueue();
  }
  else {
    id v6 = PDUtilityQueue();
  }
  BOOL v7 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(v6);
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472LL;
  v9[2] = sub_10032AD94;
  v9[3] = &unk_10063AC90;
  v9[4] = self;
  id v10 = v4;
  id v8 = v4;
  dispatch_async(v7, v9);
}

- (void)_processTransaction:(id)a3 completion:(id)a4
{
  id v6 = a3;
  v33[0] = _NSConcreteStackBlock;
  v33[1] = 3221225472LL;
  v33[2] = sub_10032B278;
  v33[3] = &unk_1006572B8;
  v28 = self;
  v33[4] = self;
  id v7 = a4;
  id v34 = v7;
  id v8 = objc_retainBlock(v33);
  double v9 = (void *)objc_claimAutoreleasedReturnValue([v6 merchant]);
  id v10 = (void *)objc_claimAutoreleasedReturnValue([v9 mapsMerchant]);
  id v11 = (void *)objc_claimAutoreleasedReturnValue([v10 postalAddress]);
  id v12 = (void *)objc_claimAutoreleasedReturnValue([v6 preferredLocation]);
  uint64_t v29 = (void *)objc_claimAutoreleasedReturnValue(+[NSLocale currentLocale](&OBJC_CLASS___NSLocale, "currentLocale"));
  uint64_t Object = PKLogFacilityTypeGetObject(18LL);
  BOOL v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue([v6 identifier]);
    *(_DWORD *)__int128 buf = 138412290;
    v36 = v15;
    _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_DEFAULT,  "Finding region for transaction with identifier %@",  buf,  0xCu);
  }

  if (!v11) {
    goto LABEL_14;
  }
  __int128 v26 = v10;
  id v27 = v7;
  double v16 = (void *)objc_claimAutoreleasedReturnValue([v11 country]);
  id v17 = (void *)objc_claimAutoreleasedReturnValue([v11 ISOCountryCode]);
  id v18 = (void *)objc_claimAutoreleasedReturnValue([v29 localizedStringForCountryCode:v17]);
  id v19 = v16;
  id v20 = v18;
  id v21 = v20;
  if (v19 == v20)
  {

    goto LABEL_10;
  }

  if (!v19 || !v20)
  {

    goto LABEL_13;
  }

  id v22 = [v19 caseInsensitiveCompare:v20];

  if (v22)
  {
LABEL_13:

    id v10 = v26;
    id v7 = v27;
    goto LABEL_14;
  }

- (void)_associateTransaction:(id)a3 toRegion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  -[PDDatabaseManager associateTransaction:toRegion:](self->_databaseManager, "associateTransaction:toRegion:", v6, v7);
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472LL;
  v10[2] = sub_10032BA78;
  v10[3] = &unk_1006572E0;
  id v11 = v6;
  id v12 = v7;
  id v8 = v7;
  id v9 = v6;
  -[PDWorldRegionAggregator _accessObserversWithHandler:](self, "_accessObserversWithHandler:", v10);
}

- (id)_worldRegionFromPlacemark:(id)a3 orAddress:(id)a4
{
  unint64_t v5 = (unint64_t)a3;
  unint64_t v6 = (unint64_t)a4;
  if (v5 | v6)
  {
    id v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSLocale currentLocale](&OBJC_CLASS___NSLocale, "currentLocale"));
    id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 localeIdentifier]);
    id v9 = (void *)objc_claimAutoreleasedReturnValue([(id)v5 ISOcountryCode]);
    id v22 = v7;
    if ((v9 || (id v9 = (void *)objc_claimAutoreleasedReturnValue([(id)v6 ISOCountryCode])) != 0)
      && [v9 length])
    {
      id v10 = objc_alloc_init(&OBJC_CLASS___PKWorldRegion);
      [v10 setLocaleIdentifier:v8];
      [v10 setAbbreviationCode:v9];
      id v11 = (void *)objc_claimAutoreleasedReturnValue([v7 localizedStringForCountryCode:v9]);
      [v10 setLocalizedName:v11];

      [v10 setType:4];
    }

    else
    {
      id v10 = 0LL;
    }

    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue([(id)v5 administrativeArea]);
    if ((v13 || (uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue([(id)v6 state])) != 0)
      && [v13 length])
    {
      id v14 = objc_alloc_init(&OBJC_CLASS___PKWorldRegion);
      [v14 setLocaleIdentifier:v8];
      [v14 setLocalizedName:v13];
      [v14 setType:3];
      if (v10) {
        [v14 setParentRegion:v10];
      }
    }

    else
    {
      id v14 = v10;
    }

    uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue([(id)v5 subAdministrativeArea]);
    if ((v15 || (uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue([(id)v6 subAdministrativeArea])) != 0)
      && [v15 length])
    {
      id v16 = objc_alloc_init(&OBJC_CLASS___PKWorldRegion);
      [v16 setLocaleIdentifier:v8];
      [v16 setLocalizedName:v15];
      [v16 setType:2];
      if (v14) {
        [v16 setParentRegion:v14];
      }
    }

    else
    {
      id v16 = v14;
    }

    id v17 = (void *)objc_claimAutoreleasedReturnValue([(id)v5 locality]);
    if ((v17 || (id v17 = (void *)objc_claimAutoreleasedReturnValue([(id)v6 city])) != 0)
      && [v17 length])
    {
      id v18 = objc_alloc_init(&OBJC_CLASS___PKWorldRegion);
      [v18 setLocaleIdentifier:v8];
      [v18 setLocalizedName:v17];
      [v18 setType:1];
      if (v16) {
        [v18 setParentRegion:v16];
      }
    }

    else
    {
      id v18 = v16;
    }

    id v19 = (void *)objc_claimAutoreleasedReturnValue([(id)v5 subLocality]);
    if ((v19 || (id v19 = (void *)objc_claimAutoreleasedReturnValue([(id)v6 subLocality])) != 0)
      && [v19 length])
    {
      id v20 = objc_alloc_init(&OBJC_CLASS___PKWorldRegion);
      [v20 setLocaleIdentifier:v8];
      [v20 setLocalizedName:v19];
      [v20 setType:0];
      if (v18) {
        [v20 setParentRegion:v18];
      }
    }

    else
    {
      id v20 = v18;
    }

    id v12 = v20;
  }

  else
  {
    id v12 = 0LL;
  }

  return v12;
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
    unint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(-[NSHashTable allObjects](self->_observers, "allObjects"));
    os_unfair_lock_unlock(p_lockObservers);
    id v7 = PDUtilityQueue();
    id v8 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(v7);
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472LL;
    v10[2] = sub_10032BF98;
    v10[3] = &unk_10063AC90;
    id v11 = v6;
    id v12 = v4;
    id v9 = v6;
    dispatch_async(v8, v10);
  }
}

- (void).cxx_destruct
{
}

@end