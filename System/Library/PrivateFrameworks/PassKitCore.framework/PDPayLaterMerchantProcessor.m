@interface PDPayLaterMerchantProcessor
- (BOOL)_canUpdateMapsDataForPayLaterFinancingPlan:(id)a3 configurations:(id *)a4;
- (PDPayLaterMerchantProcessor)initWithMapsBrandAndMerchantUpdater:(id)a3 databaseManager:(id)a4;
- (id)_mapsBrandAndMerchantForFinancingPlan:(id)a3;
- (void)_accessObserversWithHandler:(id)a3;
- (void)_lookupMapsBrandAndMerchantForFinancingPlan:(id)a3 completion:(id)a4;
- (void)_scheduleActivityWithIdentifier:(id)a3;
- (void)_updateScheduledActivityIfNeccessary;
- (void)performScheduledActivityWithIdentifier:(id)a3 activityCriteria:(id)a4;
- (void)processFinancingPlans:(id)a3;
- (void)registerObserver:(id)a3;
- (void)reprocessPayLaterFinancingPlansForMerchantCleanupWithWindow:(double)a3 completion:(id)a4;
- (void)unregisterObserver:(id)a3;
@end

@implementation PDPayLaterMerchantProcessor

- (PDPayLaterMerchantProcessor)initWithMapsBrandAndMerchantUpdater:(id)a3 databaseManager:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v20.receiver = self;
  v20.super_class = (Class)&OBJC_CLASS___PDPayLaterMerchantProcessor;
  v9 = -[PDPayLaterMerchantProcessor init](&v20, "init");
  v10 = v9;
  if (v9)
  {
    *(void *)&v9->_lock._os_unfair_lock_opaque = 0LL;
    uint64_t v11 = objc_claimAutoreleasedReturnValue( +[NSHashTable pk_weakObjectsHashTableUsingPointerPersonality]( &OBJC_CLASS___NSHashTable,  "pk_weakObjectsHashTableUsingPointerPersonality"));
    observers = v10->_observers;
    v10->_observers = (NSHashTable *)v11;

    objc_storeStrong((id *)&v10->_mapsBrandAndMerchantUpdater, a3);
    objc_storeStrong((id *)&v10->_databaseManager, a4);
    v13 = objc_alloc_init(&OBJC_CLASS___NSMutableSet);
    processingFinancingPlanIdentifiers = v10->_processingFinancingPlanIdentifiers;
    v10->_processingFinancingPlanIdentifiers = v13;

    dispatch_queue_attr_t v15 = dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v16 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v15);
    dispatch_queue_t v17 = dispatch_queue_create("com.apple.passd.PDPayLaterMerchantProcessor.work", v16);
    workQueue = v10->_workQueue;
    v10->_workQueue = (OS_dispatch_queue *)v17;

    PDScheduledActivityClientRegister(@"PayLaterMerchantProcessorClientIdentifier", v10, v10->_workQueue);
    -[PDPayLaterMerchantProcessor _updateScheduledActivityIfNeccessary](v10, "_updateScheduledActivityIfNeccessary");
  }

  return v10;
}

- (void)processFinancingPlans:(id)a3
{
  id v4 = a3;
  if ([v4 count])
  {
    id v17 = v4;
    v18 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
    __int128 v22 = 0u;
    __int128 v23 = 0u;
    __int128 v24 = 0u;
    __int128 v25 = 0u;
    id obj = v4;
    id v5 = [obj countByEnumeratingWithState:&v22 objects:v26 count:16];
    if (v5)
    {
      id v6 = v5;
      uint64_t v7 = *(void *)v23;
      do
      {
        for (i = 0LL; i != v6; i = (char *)i + 1)
        {
          if (*(void *)v23 != v7) {
            objc_enumerationMutation(obj);
          }
          v9 = *(void **)(*((void *)&v22 + 1) + 8LL * (void)i);
          v10 = (void *)objc_claimAutoreleasedReturnValue([v9 planIdentifier]);
          if (v10)
          {
            uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([v9 merchant]);
            uint64_t v12 = objc_claimAutoreleasedReturnValue([v11 mapsMerchant]);
            uint64_t v13 = objc_claimAutoreleasedReturnValue([v11 mapsBrand]);
            if (([v11 requiresMerchantReprocessing] & 1) != 0 || !(v12 | v13))
            {
              os_unfair_lock_lock(&self->_lock);
              if ((-[NSMutableSet containsObject:]( self->_processingFinancingPlanIdentifiers,  "containsObject:",  v10) & 1) != 0)
              {
                os_unfair_lock_unlock(&self->_lock);
              }

              else
              {
                -[NSMutableSet addObject:](self->_processingFinancingPlanIdentifiers, "addObject:", v10);
                os_unfair_lock_unlock(&self->_lock);
                v20[0] = _NSConcreteStackBlock;
                v20[1] = 3221225472LL;
                v20[2] = sub_10025BE1C;
                v20[3] = &unk_1006392B0;
                v20[4] = self;
                id v21 = v10;
                -[PDPayLaterMerchantProcessor _lookupMapsBrandAndMerchantForFinancingPlan:completion:]( self,  "_lookupMapsBrandAndMerchantForFinancingPlan:completion:",  v9,  v20);
              }
            }

            else
            {
              v14 = (void *)objc_claimAutoreleasedReturnValue( -[PDPayLaterMerchantProcessor _mapsBrandAndMerchantForFinancingPlan:]( self,  "_mapsBrandAndMerchantForFinancingPlan:",  v9));
              -[NSMutableArray addObjectsFromArray:](v18, "addObjectsFromArray:", v14);
            }
          }
        }

        id v6 = [obj countByEnumeratingWithState:&v22 objects:v26 count:16];
      }

      while (v6);
    }

    if (-[NSMutableArray count](v18, "count"))
    {
      mapsBrandAndMerchantUpdater = self->_mapsBrandAndMerchantUpdater;
      id v16 = -[NSMutableArray copy](v18, "copy");
      -[PDMapsBrandAndMerchantUpdater updateMapsDataForConfigurations:]( mapsBrandAndMerchantUpdater,  "updateMapsDataForConfigurations:",  v16);
    }

    id v4 = v17;
  }
}

- (void)reprocessPayLaterFinancingPlansForMerchantCleanupWithWindow:(double)a3 completion:(id)a4
{
  id v6 = a4;
  workQueue = self->_workQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10025BEE4;
  block[3] = &unk_10063AEB0;
  double v11 = a3;
  block[4] = self;
  id v10 = v6;
  id v8 = v6;
  dispatch_async((dispatch_queue_t)workQueue, block);
}

- (void)performScheduledActivityWithIdentifier:(id)a3 activityCriteria:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t Object = PKLogFacilityTypeGetObject(14LL);
  v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    int v13 = 138412290;
    id v14 = v6;
    _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "PDPayLaterMerchantProcessor starting activity: %@",  (uint8_t *)&v13,  0xCu);
  }

  id v10 = (__CFString *)v6;
  double v11 = v10;
  if (v10 == @"PayLaterMerchantReprocessing"
    || v10
    && (unsigned int v12 = -[__CFString isEqualToString:]( v10,  "isEqualToString:",  @"PayLaterMerchantReprocessing"),  v11,  v12))
  {
    -[PDPayLaterMerchantProcessor reprocessPayLaterFinancingPlansForMerchantCleanupWithWindow:completion:]( self,  "reprocessPayLaterFinancingPlansForMerchantCleanupWithWindow:completion:",  0LL,  2419200.0);
    -[PDPayLaterMerchantProcessor _updateScheduledActivityIfNeccessary](self, "_updateScheduledActivityIfNeccessary");
  }
}

- (void)_updateScheduledActivityIfNeccessary
{
  if (-[PDDatabaseManager hasAnyAccountWithType:](self->_databaseManager, "hasAnyAccountWithType:", 2LL))
  {
    if ((PDScheduledActivityExists( @"PayLaterMerchantProcessorClientIdentifier",  @"PayLaterMerchantReprocessing") & 1) == 0) {
      -[PDPayLaterMerchantProcessor _scheduleActivityWithIdentifier:]( self,  "_scheduleActivityWithIdentifier:",  @"PayLaterMerchantReprocessing");
    }
  }

  else
  {
    PDScheduledActivityRemove(@"PayLaterMerchantProcessorClientIdentifier", @"PayLaterMerchantReprocessing");
    uint64_t Object = PKLogFacilityTypeGetObject(14LL);
    id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v5 = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "Not scheduling PayLaterMerchantReprocessing since there are no pay later account on device",  v5,  2u);
    }
  }

- (void)_scheduleActivityWithIdentifier:(id)a3
{
  id v3 = a3;
  uint64_t v4 = PKRandomIntegerInRange(18LL, 36LL);
  uint64_t v5 = PKRandomIntegerInRange(0LL, 60LL);
  id v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 dateByAddingTimeInterval:(double)v5 * 60.0 + (double)v4 * 3600.0]);

  id v8 = (void *)objc_claimAutoreleasedReturnValue( +[PDScheduledActivityCriteria maintenanceActivityCriteriaWithStartDate:]( &OBJC_CLASS___PDScheduledActivityCriteria,  "maintenanceActivityCriteriaWithStartDate:",  v7));
  [v8 setRepeating:0];
  [v8 setRequireNetworkConnectivity:1];
  [v8 setRequireScreenSleep:1];
  [v8 setRequireMainsPower:1];
  PDScheduledActivityRegister(@"PayLaterMerchantProcessorClientIdentifier", v3, v8);
  uint64_t Object = PKLogFacilityTypeGetObject(14LL);
  id v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    int v11 = 138412546;
    id v12 = v3;
    __int16 v13 = 2112;
    id v14 = v7;
    _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "Scheduled %@ with start time %@",  (uint8_t *)&v11,  0x16u);
  }
}

- (void)_lookupMapsBrandAndMerchantForFinancingPlan:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [[PKPayLaterMerchantLookupSource alloc] initWithFinancingPlan:v6];
  id v9 = [[PKMerchantLookupRequest alloc] initWithSource:v8];
  uint64_t Object = PKLogFacilityTypeGetObject(14LL);
  int v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    id v12 = (void *)objc_claimAutoreleasedReturnValue([v6 planIdentifier]);
    *(_DWORD *)buf = 138412290;
    objc_super v20 = v12;
    _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "Looking up maps data for financing plan id %@",  buf,  0xCu);
  }

  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472LL;
  v15[2] = sub_10025C5E8;
  v15[3] = &unk_10064FF70;
  id v16 = v6;
  id v17 = self;
  id v18 = v7;
  id v13 = v7;
  id v14 = v6;
  [v9 startLookupWithCompletion:v15];
}

- (id)_mapsBrandAndMerchantForFinancingPlan:(id)a3
{
  id v8 = 0LL;
  unsigned int v3 = -[PDPayLaterMerchantProcessor _canUpdateMapsDataForPayLaterFinancingPlan:configurations:]( self,  "_canUpdateMapsDataForPayLaterFinancingPlan:configurations:",  a3,  &v8);
  id v4 = v8;
  uint64_t v5 = v4;
  id v6 = 0LL;
  if (v3) {
    id v6 = v4;
  }

  return v6;
}

- (BOOL)_canUpdateMapsDataForPayLaterFinancingPlan:(id)a3 configurations:(id *)a4
{
  id v5 = a3;
  id v6 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  id v16 = 0LL;
  unsigned __int8 v7 = +[PDMapsBrandAndMerchantUpdater canUpdateMapsBrandForPayLaterFinancingPlan:outConfiguration:]( &OBJC_CLASS___PDMapsBrandAndMerchantUpdater,  "canUpdateMapsBrandForPayLaterFinancingPlan:outConfiguration:",  v5,  &v16);
  id v8 = v16;
  -[NSMutableArray safelyAddObject:](v6, "safelyAddObject:", v8);

  id v15 = 0LL;
  unsigned __int8 v9 = +[PDMapsBrandAndMerchantUpdater canUpdateMapsMerchantForPayLaterFinancingPlan:outConfiguration:]( &OBJC_CLASS___PDMapsBrandAndMerchantUpdater,  "canUpdateMapsMerchantForPayLaterFinancingPlan:outConfiguration:",  v5,  &v15);

  id v10 = v15;
  -[NSMutableArray safelyAddObject:](v6, "safelyAddObject:", v10);

  char v13 = PKIsPhone(v11, v12);
  if (a4) {
    *a4 = -[NSMutableArray copy](v6, "copy");
  }

  return v13 & (v7 | v9);
}

- (void)registerObserver:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    os_unfair_lock_lock(&self->_observersLock);
    -[NSHashTable addObject:](self->_observers, "addObject:", v4);
    os_unfair_lock_unlock(&self->_observersLock);
  }
}

- (void)unregisterObserver:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    os_unfair_lock_lock(&self->_observersLock);
    -[NSHashTable removeObject:](self->_observers, "removeObject:", v4);
    os_unfair_lock_unlock(&self->_observersLock);
  }
}

- (void)_accessObserversWithHandler:(id)a3
{
  id v4 = (void (**)(id, void))a3;
  if (v4)
  {
    p_observersLock = &self->_observersLock;
    os_unfair_lock_lock(&self->_observersLock);
    id v6 = (void *)objc_claimAutoreleasedReturnValue(-[NSHashTable allObjects](self->_observers, "allObjects"));
    os_unfair_lock_unlock(p_observersLock);
    __int128 v14 = 0u;
    __int128 v15 = 0u;
    __int128 v12 = 0u;
    __int128 v13 = 0u;
    id v7 = v6;
    id v8 = [v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
    if (v8)
    {
      id v9 = v8;
      uint64_t v10 = *(void *)v13;
      do
      {
        uint64_t v11 = 0LL;
        do
        {
          if (*(void *)v13 != v10) {
            objc_enumerationMutation(v7);
          }
          v4[2](v4, *(void *)(*((void *)&v12 + 1) + 8LL * (void)v11));
          uint64_t v11 = (char *)v11 + 1;
        }

        while (v9 != v11);
        id v9 = [v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
      }

      while (v9);
    }
  }
}

- (void).cxx_destruct
{
}

@end