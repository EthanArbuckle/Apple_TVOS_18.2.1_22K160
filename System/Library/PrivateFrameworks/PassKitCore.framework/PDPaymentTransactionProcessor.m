@interface PDPaymentTransactionProcessor
- (BOOL)_canUpdateMapsDataForTransaction:(id)a3;
- (BOOL)isActive;
- (PDPaymentTransactionProcessor)initWithMapsBrandAndMerchantUpdater:(id)a3 paymentWebServiceCoordinator:(id)a4;
- (PDPaymentTransactionProcessor)initWithQueue:(id)a3 mapsBrandAndMerchantUpdater:(id)a4 paymentWebServiceCoordinator:(id)a5;
- (PDPaymentTransactionProcessorDataSource)dataSource;
- (PKUsageNotificationServer)usageNotificationServer;
- (id)_pendingLocationUpdateItemForTransaction:(id)a3;
- (id)_pendingMerchantCleanupItemForTransaction:(id)a3;
- (id)_pendingReverseGeocodeUpdateItemForTransaction:(id)a3;
- (id)_pendingStationsUpdateItemForTransaction:(id)a3;
- (void)_abortUpdatingLocationForAllBackgroundLocationUpdateItems;
- (void)_abortUpdatingLocationForAllLocationUpdateItems;
- (void)_abortUpdatingLocationForLocationUpdateItem:(id)a3;
- (void)_accessObserversWithHandler:(id)a3;
- (void)_beginMerchantCleanupIfPossible;
- (void)_beginProcessingPaymentTransaction:(id)a3 forTransactionSourceIdentifier:(id)a4 skipLocation:(BOOL)a5;
- (void)_beginReverseGeocodingIfPossible;
- (void)_continueUpdatingLocationForTransactionUpdateItem:(id)a3;
- (void)_markTransactionAsFullyProcessedAndNotifyDelegate:(id)a3 forTransactionSourceIdentifier:(id)a4;
- (void)_processForLocalMCCLookup:(id)a3;
- (void)_processItemForMerchantCleanup:(id)a3 clearingAttempt:(BOOL)a4;
- (void)_processItemForStationsCleanup:(id)a3;
- (void)_processPaymentTransaction:(id)a3 forTransactionSourceIdentifier:(id)a4;
- (void)_processPaymentTransactionForDemoMode:(id)a3 forTransactionSourceIdentifier:(id)a4;
- (void)_processPaymentTransactionForLocationUpdate:(id)a3 forTransactionSourceIdentifier:(id)a4;
- (void)_processPaymentTransactionForMapsData:(id)a3 forTransactionSourceIdentifier:(id)a4;
- (void)_processPaymentTransactionForMerchantCleanup:(id)a3 forTransactionSourceIdentifier:(id)a4 clearingAttempt:(BOOL)a5;
- (void)_processPaymentTransactionForStationsUpdate:(id)a3 forTransactionSourceIdentifier:(id)a4;
- (void)_reportTransactionWithFinalLocation:(id)a3;
- (void)_startUpdatingBackgroundLocationIfPossible;
- (void)_startUpdatingLocationIfPossible;
- (void)_stopUpdatingLocationIfPossible;
- (void)_updateActiveState;
- (void)_updateLocation:(id)a3 forLocationUpdateItem:(id)a4 andMarkAsProcessed:(BOOL)a5;
- (void)locationManager:(id)a3 didFailWithError:(id)a4;
- (void)locationManager:(id)a3 didUpdateLocations:(id)a4;
- (void)processPaymentTransaction:(id)a3 forTransactionSourceIdentifier:(id)a4;
- (void)processPaymentTransactionConfigurations:(id)a3;
- (void)registerObserver:(id)a3;
- (void)setDataSource:(id)a3;
- (void)setUsageNotificationServer:(id)a3;
- (void)unregisterObserver:(id)a3;
@end

@implementation PDPaymentTransactionProcessor

- (PDPaymentTransactionProcessor)initWithMapsBrandAndMerchantUpdater:(id)a3 paymentWebServiceCoordinator:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = PDDefaultQueue();
  v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
  v10 = -[PDPaymentTransactionProcessor initWithQueue:mapsBrandAndMerchantUpdater:paymentWebServiceCoordinator:]( self,  "initWithQueue:mapsBrandAndMerchantUpdater:paymentWebServiceCoordinator:",  v9,  v7,  v6);

  return v10;
}

- (PDPaymentTransactionProcessor)initWithQueue:(id)a3 mapsBrandAndMerchantUpdater:(id)a4 paymentWebServiceCoordinator:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v42.receiver = self;
  v42.super_class = (Class)&OBJC_CLASS___PDPaymentTransactionProcessor;
  v11 = -[PDPaymentTransactionProcessor init](&v42, "init");
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_paymentWebServiceCoordinator, a5);
    v12->_itemsLock._os_unfair_lock_opaque = 0;
    objc_storeStrong((id *)&v12->_mapsBrandAndMerchantUpdater, a4);
    v13 = objc_alloc_init(&OBJC_CLASS___NSMutableSet);
    locationUpdateItems = v12->_locationUpdateItems;
    v12->_locationUpdateItems = v13;

    v15 = objc_alloc_init(&OBJC_CLASS___NSMutableSet);
    backgroundLocationUpdateItems = v12->_backgroundLocationUpdateItems;
    v12->_backgroundLocationUpdateItems = v15;

    v17 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
    reverseGeocodeItems = v12->_reverseGeocodeItems;
    v12->_reverseGeocodeItems = v17;

    v19 = objc_alloc_init(&OBJC_CLASS___NSMutableSet);
    stationsUpdateItems = v12->_stationsUpdateItems;
    v12->_stationsUpdateItems = v19;

    v21 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
    merchantCleanupItems = v12->_merchantCleanupItems;
    v12->_merchantCleanupItems = v21;

    v23 = objc_alloc_init(&OBJC_CLASS___CLGeocoder);
    geocoder = v12->_geocoder;
    v12->_geocoder = v23;

    dispatch_queue_t v25 = dispatch_queue_create("com.apple.passd.PDPaymentTransactionProcessor.reply", 0LL);
    replyQueue = v12->_replyQueue;
    v12->_replyQueue = (OS_dispatch_queue *)v25;

    v27 = objc_alloc(&OBJC_CLASS___CLLocationManager);
    uint64_t v28 = PKPassKitCoreBundle();
    v29 = (void *)objc_claimAutoreleasedReturnValue(v28);
    v30 = (void *)objc_claimAutoreleasedReturnValue([v29 bundlePath]);
    v31 = -[CLLocationManager initWithEffectiveBundlePath:delegate:onQueue:]( v27,  "initWithEffectiveBundlePath:delegate:onQueue:",  v30,  v12,  v8);
    locationManager = v12->_locationManager;
    v12->_locationManager = v31;

    -[CLLocationManager setDesiredAccuracy:](v12->_locationManager, "setDesiredAccuracy:", kCLLocationAccuracyBest);
    v33 = objc_alloc(&OBJC_CLASS___CLLocationManager);
    uint64_t v34 = PKMerchantLookupBundle();
    v35 = (void *)objc_claimAutoreleasedReturnValue(v34);
    v36 = (void *)objc_claimAutoreleasedReturnValue([v35 bundlePath]);
    v37 = -[CLLocationManager initWithEffectiveBundlePath:delegate:onQueue:]( v33,  "initWithEffectiveBundlePath:delegate:onQueue:",  v36,  v12,  v8);
    backgroundMerchantLocationManager = v12->_backgroundMerchantLocationManager;
    v12->_backgroundMerchantLocationManager = v37;

    -[CLLocationManager setDesiredAccuracy:]( v12->_backgroundMerchantLocationManager,  "setDesiredAccuracy:",  kCLLocationAccuracyBest);
    v12->_observersLock._os_unfair_lock_opaque = 0;
    uint64_t v39 = objc_claimAutoreleasedReturnValue( +[NSHashTable pk_weakObjectsHashTableUsingPointerPersonality]( &OBJC_CLASS___NSHashTable,  "pk_weakObjectsHashTableUsingPointerPersonality"));
    observers = v12->_observers;
    v12->_observers = (NSHashTable *)v39;
  }

  return v12;
}

- (void)processPaymentTransaction:(id)a3 forTransactionSourceIdentifier:(id)a4
{
  id v8 = a3;
  id v6 = a4;
  if (v8)
  {
    id v7 = [v8 updateReasonIsInitialDownload];
    if ((v7 & 1) == 0)
    {
      if ((PKHandsOnDemoModeEnabled(v7) & 1) != 0) {
        -[PDPaymentTransactionProcessor _processPaymentTransactionForDemoMode:forTransactionSourceIdentifier:]( self,  "_processPaymentTransactionForDemoMode:forTransactionSourceIdentifier:",  v8,  v6);
      }
      else {
        -[PDPaymentTransactionProcessor _processPaymentTransaction:forTransactionSourceIdentifier:]( self,  "_processPaymentTransaction:forTransactionSourceIdentifier:",  v8,  v6);
      }
    }
  }
}

- (void)processPaymentTransactionConfigurations:(id)a3
{
  id v3 = a3;
  id v4 = [v3 count];
  if (v4 && (PKHandsOnDemoModeEnabled(v4) & 1) == 0)
  {
    -[PDMapsBrandAndMerchantUpdater beginCoalesingMapsDataRequests]( self->_mapsBrandAndMerchantUpdater,  "beginCoalesingMapsDataRequests");
    __int128 v21 = 0u;
    __int128 v22 = 0u;
    __int128 v19 = 0u;
    __int128 v20 = 0u;
    id v17 = v3;
    id v5 = v3;
    id v6 = [v5 countByEnumeratingWithState:&v19 objects:v25 count:16];
    if (v6)
    {
      id v7 = v6;
      uint64_t v8 = *(void *)v20;
      do
      {
        for (i = 0LL; i != v7; i = (char *)i + 1)
        {
          if (*(void *)v20 != v8) {
            objc_enumerationMutation(v5);
          }
          id v10 = *(void **)(*((void *)&v19 + 1) + 8LL * (void)i);
          v11 = objc_autoreleasePoolPush();
          v12 = (void *)objc_claimAutoreleasedReturnValue([v10 transactionIdentifier]);
          id WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
          v14 = (void *)objc_claimAutoreleasedReturnValue([WeakRetained paymentTransactionForIdentifier:v12]);

          if (v14)
          {
            objc_msgSend(v14, "addUpdateReasons:", objc_msgSend(v10, "updateReasons"));
            v15 = (os_log_s *)objc_claimAutoreleasedReturnValue([v14 transactionSourceIdentifier]);
            -[PDPaymentTransactionProcessor _processPaymentTransaction:forTransactionSourceIdentifier:]( self,  "_processPaymentTransaction:forTransactionSourceIdentifier:",  v14,  v15);
          }

          else
          {
            uint64_t Object = PKLogFacilityTypeGetObject(23LL);
            v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
            if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412290;
              v24 = v12;
              _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_DEFAULT,  "Error: Cannot process transaction %@ since there is no transaction in the local database",  buf,  0xCu);
            }
          }

          objc_autoreleasePoolPop(v11);
        }

        id v7 = [v5 countByEnumeratingWithState:&v19 objects:v25 count:16];
      }

      while (v7);
    }

    -[PDMapsBrandAndMerchantUpdater endCoalesingMapsDataRequests]( self->_mapsBrandAndMerchantUpdater,  "endCoalesingMapsDataRequests");
    id v3 = v17;
  }
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
  id v4 = a3;
  if (v4)
  {
    os_unfair_lock_lock(&self->_observersLock);
    id v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSHashTable allObjects](self->_observers, "allObjects"));
    os_unfair_lock_unlock(&self->_observersLock);
    replyQueue = self->_replyQueue;
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472LL;
    v8[2] = sub_10040DD88;
    v8[3] = &unk_10063AC90;
    id v9 = v5;
    id v10 = v4;
    id v7 = v5;
    dispatch_async((dispatch_queue_t)replyQueue, v8);
  }
}

- (void)locationManager:(id)a3 didUpdateLocations:(id)a4
{
  id v6 = (CLLocationManager *)a3;
  id v7 = a4;
  os_unfair_lock_lock(&self->_itemsLock);
  if (self->_locationManager == v6)
  {
    uint64_t v9 = 2LL;
  }

  else
  {
    if (self->_backgroundMerchantLocationManager != v6)
    {
      id v8 = 0LL;
      goto LABEL_7;
    }

    uint64_t v9 = 3LL;
  }

  id v8 = -[objc_class copy]((&self->super.isa)[v9], "copy");
LABEL_7:
  os_unfair_lock_unlock(&self->_itemsLock);
  id v10 = (void *)objc_claimAutoreleasedReturnValue([v7 lastObject]);

  uint64_t Object = PKLogFacilityTypeGetObject(23LL);
  v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    __int128 v21 = v10;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "New Location Update: %@", buf, 0xCu);
  }

  v14 = _NSConcreteStackBlock;
  uint64_t v15 = 3221225472LL;
  v16 = sub_10040E004;
  id v17 = &unk_10065EB50;
  v18 = self;
  id v19 = v10;
  id v13 = v10;
  [v8 enumerateObjectsUsingBlock:&v14];
  -[PDPaymentTransactionProcessor _stopUpdatingLocationIfPossible]( self,  "_stopUpdatingLocationIfPossible",  v14,  v15,  v16,  v17,  v18);
}

- (void)locationManager:(id)a3 didFailWithError:(id)a4
{
  id v6 = (CLLocationManager *)a3;
  id v7 = a4;
  if ([v7 code])
  {
    if (self->_locationManager == v6)
    {
      -[PDPaymentTransactionProcessor _abortUpdatingLocationForAllLocationUpdateItems]( self,  "_abortUpdatingLocationForAllLocationUpdateItems");
    }

    else if (self->_backgroundMerchantLocationManager == v6)
    {
      -[PDPaymentTransactionProcessor _abortUpdatingLocationForAllBackgroundLocationUpdateItems]( self,  "_abortUpdatingLocationForAllBackgroundLocationUpdateItems");
    }

    uint64_t Object = PKLogFacilityTypeGetObject(23LL);
    uint64_t v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      int v15 = 138412290;
      id v16 = v7;
      _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "Location Manager Failed With Error: %@",  (uint8_t *)&v15,  0xCu);
    }
  }

  else
  {
    uint64_t v8 = PKLogFacilityTypeGetObject(23LL);
    uint64_t v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v11 = (objc_class *)objc_opt_class(self, v10);
      v12 = NSStringFromClass(v11);
      id v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
      int v15 = 138412546;
      id v16 = v13;
      __int16 v17 = 2112;
      v18 = v6;
      _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "%@: Location Manager %@ unable to retreve location, will retry.",  (uint8_t *)&v15,  0x16u);
    }
  }
}

- (void)_processPaymentTransactionForDemoMode:(id)a3 forTransactionSourceIdentifier:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([v6 hasTransactionSource])
  {
    dispatch_time_t v8 = dispatch_time(0LL, 2000000000LL);
    id v9 = PDDefaultQueue();
    uint64_t v10 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(v9);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_10040E42C;
    block[3] = &unk_100639350;
    id v12 = v6;
    id v13 = self;
    id v14 = v7;
    dispatch_after(v8, v10, block);
  }
}

- (void)_markTransactionAsFullyProcessedAndNotifyDelegate:(id)a3 forTransactionSourceIdentifier:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = v6;
  if ([v8 processedForLocation]
    && ([v8 processedForStations] & 1) != 0)
  {
    unsigned __int8 v9 = [v8 processedForMerchantCleanup];

    if ((v9 & 1) != 0) {
      goto LABEL_7;
    }
  }

  else
  {
  }

  [v8 setProcessedForLocation:1];
  [v8 setProcessedForStations:1];
  [v8 setProcessedForMerchantCleanup:1];
  [v8 addUpdateReasons:128];
LABEL_7:
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472LL;
  v12[2] = sub_10040E7A4;
  v12[3] = &unk_10065EB78;
  id v13 = v8;
  id v14 = v7;
  id v10 = v7;
  id v11 = v8;
  -[PDPaymentTransactionProcessor _accessObserversWithHandler:](self, "_accessObserversWithHandler:", v12);
}

- (void)_beginProcessingPaymentTransaction:(id)a3 forTransactionSourceIdentifier:(id)a4 skipLocation:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a3;
  id v9 = a4;
  unsigned int v10 = -[PDPaymentTransactionProcessor _canUpdateMapsDataForTransaction:]( self,  "_canUpdateMapsDataForTransaction:",  v8);
  if (v5 && ([v8 processedForLocation] & 1) == 0)
  {
    int v11 = 1;
    [v8 setProcessedForLocation:1];
    [v8 addUpdateReasons:128];
  }

  else
  {
    int v11 = 0;
  }

  if (([v8 processedForLocation] & 1) == 0)
  {
    -[PDPaymentTransactionProcessor _processPaymentTransactionForLocationUpdate:forTransactionSourceIdentifier:]( self,  "_processPaymentTransactionForLocationUpdate:forTransactionSourceIdentifier:",  v8,  v9);
    goto LABEL_9;
  }

  id v12 = (void *)objc_claimAutoreleasedReturnValue( -[PDPaymentTransactionProcessor _pendingReverseGeocodeUpdateItemForTransaction:]( self,  "_pendingReverseGeocodeUpdateItemForTransaction:",  v8));

  if (v12)
  {
    id v13 = (void *)objc_claimAutoreleasedReturnValue( -[PDPaymentTransactionProcessor _pendingReverseGeocodeUpdateItemForTransaction:]( self,  "_pendingReverseGeocodeUpdateItemForTransaction:",  v8));
    [v13 setPaymentTransaction:v8];

    goto LABEL_9;
  }

  if (([v8 processedForStations] & 1) == 0)
  {
    -[PDPaymentTransactionProcessor _processPaymentTransactionForStationsUpdate:forTransactionSourceIdentifier:]( self,  "_processPaymentTransactionForStationsUpdate:forTransactionSourceIdentifier:",  v8,  v9);
    goto LABEL_9;
  }

  if (([v8 processedForMerchantCleanup] & 1) == 0)
  {
    __int16 v17 = self;
    id v18 = v8;
    id v19 = v9;
    uint64_t v20 = 0LL;
LABEL_20:
    -[PDPaymentTransactionProcessor _processPaymentTransactionForMerchantCleanup:forTransactionSourceIdentifier:clearingAttempt:]( v17,  "_processPaymentTransactionForMerchantCleanup:forTransactionSourceIdentifier:clearingAttempt:",  v18,  v19,  v20);
    goto LABEL_9;
  }

  if ([v8 requiresMerchantReprocessing])
  {
    unint64_t v14 = (unint64_t)[v8 transactionStatus];
    if (([v8 updateReasons] & 8) != 0)
    {
      uint64_t Object = PKLogFacilityTypeGetObject(23LL);
      dispatch_queue_t v25 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
      if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v25,  OS_LOG_TYPE_DEFAULT,  "Not reprocessing for merchant cleanup since transaction came from device data changes",  buf,  2u);
      }
    }

    else if ((v14 & 0xFFFFFFFFFFFFFFFDLL) == 1)
    {
      uint64_t v15 = PKLogFacilityTypeGetObject(23LL);
      id v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(v15);
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_DEFAULT,  "Reprocessing merchant cleanup for cleared transaction with no Maps match",  buf,  2u);
      }

      __int16 v17 = self;
      id v18 = v8;
      id v19 = v9;
      uint64_t v20 = 1LL;
      goto LABEL_20;
    }

    if (v10)
    {
      uint64_t v26 = PKLogFacilityTypeGetObject(23LL);
      v27 = (os_log_s *)objc_claimAutoreleasedReturnValue(v26);
      if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v27,  OS_LOG_TYPE_DEFAULT,  "Processing maps merchant and brand data.",  buf,  2u);
      }

      -[PDPaymentTransactionProcessor _processPaymentTransactionForMapsData:forTransactionSourceIdentifier:]( self,  "_processPaymentTransactionForMapsData:forTransactionSourceIdentifier:",  v8,  v9);
    }

    if (v11)
    {
      uint64_t v28 = PKLogFacilityTypeGetObject(23LL);
      v29 = (os_log_s *)objc_claimAutoreleasedReturnValue(v28);
      if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
      {
        v30 = (void *)objc_claimAutoreleasedReturnValue([v8 identifier]);
        *(_DWORD *)buf = 138412290;
        v41 = v30;
        _os_log_impl( (void *)&_mh_execute_header,  v29,  OS_LOG_TYPE_DEFAULT,  "Cannot reprocess transaction %@",  buf,  0xCu);
      }

      v37[0] = _NSConcreteStackBlock;
      v37[1] = 3221225472LL;
      v37[2] = sub_10040EBCC;
      v37[3] = &unk_10065EB78;
      id v38 = v8;
      id v39 = v9;
      -[PDPaymentTransactionProcessor _accessObserversWithHandler:](self, "_accessObserversWithHandler:", v37);

      v23 = v38;
      goto LABEL_38;
    }
  }

  else
  {
    if (v10)
    {
      uint64_t v21 = PKLogFacilityTypeGetObject(23LL);
      __int128 v22 = (os_log_s *)objc_claimAutoreleasedReturnValue(v21);
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v22,  OS_LOG_TYPE_DEFAULT,  "Processing maps merchant and brand data.",  buf,  2u);
      }

      -[PDPaymentTransactionProcessor _processPaymentTransactionForMapsData:forTransactionSourceIdentifier:]( self,  "_processPaymentTransactionForMapsData:forTransactionSourceIdentifier:",  v8,  v9);
    }

    if (v11)
    {
      v31 = _NSConcreteStackBlock;
      uint64_t v32 = 3221225472LL;
      v33 = sub_10040EBD8;
      uint64_t v34 = &unk_10065EB78;
      id v35 = v8;
      id v36 = v9;
      -[PDPaymentTransactionProcessor _accessObserversWithHandler:](self, "_accessObserversWithHandler:", &v31);

      v23 = v35;
LABEL_38:
    }
  }

- (void)_processPaymentTransaction:(id)a3 forTransactionSourceIdentifier:(id)a4
{
  id v6 = (__CFString *)a3;
  id v7 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
  id v9 = (void *)objc_claimAutoreleasedReturnValue([WeakRetained paymentApplicationForTransactionSource:v7]);

  if (!v9)
  {
    unsigned int v15 = -[PDPaymentTransactionProcessor _canUpdateMapsDataForTransaction:]( self,  "_canUpdateMapsDataForTransaction:",  v6);
    uint64_t Object = PKLogFacilityTypeGetObject(23LL);
    __int16 v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
    BOOL v18 = os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT);
    if (v15)
    {
      if (v18)
      {
        int v53 = 138412290;
        v54 = v6;
        _os_log_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_DEFAULT,  "Processing transaction for maps brand and merchant data since the transaction doesn't have a Payment Application: %@",  (uint8_t *)&v53,  0xCu);
      }

LABEL_12:
      -[PDPaymentTransactionProcessor _processPaymentTransactionForMapsData:forTransactionSourceIdentifier:]( self,  "_processPaymentTransactionForMapsData:forTransactionSourceIdentifier:",  v6,  v7);
      goto LABEL_61;
    }

    if (v18)
    {
      int v53 = 138412290;
      v54 = v6;
      _os_log_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_DEFAULT,  "Processing Not Permitted For Transaction without Payment Application: %@",  (uint8_t *)&v53,  0xCu);
    }

LABEL_19:
    uint64_t v21 = self;
    __int128 v22 = v6;
    id v23 = v7;
LABEL_20:
    -[PDPaymentTransactionProcessor _markTransactionAsFullyProcessedAndNotifyDelegate:forTransactionSourceIdentifier:]( v21,  "_markTransactionAsFullyProcessedAndNotifyDelegate:forTransactionSourceIdentifier:",  v22,  v23);
    goto LABEL_61;
  }

  if (!v7)
  {
    uint64_t v19 = PKLogFacilityTypeGetObject(23LL);
    uint64_t v20 = (os_log_s *)objc_claimAutoreleasedReturnValue(v19);
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      int v53 = 138412290;
      v54 = v6;
      _os_log_impl( (void *)&_mh_execute_header,  v20,  OS_LOG_TYPE_DEFAULT,  "Processing Not Permitted For Transaction without a Transaction Source Identifier: %@",  (uint8_t *)&v53,  0xCu);
    }

    uint64_t v21 = self;
    __int128 v22 = v6;
    id v23 = 0LL;
    goto LABEL_20;
  }

  id v10 = -[__CFString effectiveTransactionSource](v6, "effectiveTransactionSource");
  unint64_t v12 = (unint64_t)v10;
  switch((unint64_t)v10)
  {
    case 0uLL:
    case 4uLL:
      unsigned int v24 = -[__CFString requiresMerchantReprocessing](v6, "requiresMerchantReprocessing");
      dispatch_queue_t v25 = (char *)-[__CFString transactionType](v6, "transactionType");
      if (v25 == (char *)3)
      {
        if (-[__CFString peerPaymentPaymentMode](v6, "peerPaymentPaymentMode") == (id)2)
        {
          unsigned int v52 = -[__CFString originatedByDevice](v6, "originatedByDevice");
          uint64_t v26 = v52 ^ 1;
          if (((v24 | v52) & 1) != 0) {
            goto LABEL_47;
          }
        }

        else
        {
LABEL_22:
          if ((v24 & 1) != 0)
          {
LABEL_46:
            uint64_t v26 = 1LL;
LABEL_47:
            v40 = self;
            v41 = v6;
            id v42 = v7;
            uint64_t v43 = v26;
            goto LABEL_60;
          }

          uint64_t v26 = 1LL;
        }
      }

      else
      {
        uint64_t v26 = 1LL;
        if (v24) {
          goto LABEL_47;
        }
      }

      if ((unint64_t)-[__CFString transactionType](v6, "transactionType") <= 1)
      {
        uint64_t v27 = objc_claimAutoreleasedReturnValue(-[__CFString dpanIdentifier](v6, "dpanIdentifier"));
        if (!v27
          || (uint64_t v28 = (void *)v27,
              id v29 = objc_loadWeakRetained((id *)&self->_dataSource),
              v30 = (void *)objc_claimAutoreleasedReturnValue([v29 paymentApplicationForDPANIdentifier:v28]),
              v29,
              v30,
              v28,
              v30))
        {
LABEL_52:
          -[__CFString setRequiresMerchantReprocessing:](v6, "setRequiresMerchantReprocessing:", 1LL);
          id v48 = objc_loadWeakRetained((id *)&self->_dataSource);
          v49 = (void *)objc_claimAutoreleasedReturnValue(-[__CFString identifier](v6, "identifier"));
          [v48 updateRequiresMerchantReprocessing:1 forTransactionWithIdentifier:v49];

          -[PDPaymentTransactionProcessor _beginProcessingPaymentTransaction:forTransactionSourceIdentifier:skipLocation:]( self,  "_beginProcessingPaymentTransaction:forTransactionSourceIdentifier:skipLocation:",  v6,  v7,  v26);
        }
      }

      goto LABEL_53;
    case 1uLL:
    case 2uLL:
    case 3uLL:
      goto LABEL_40;
    case 5uLL:
      if ((PKIsPhone(v10, v11) & 1) != 0) {
        goto LABEL_5;
      }
LABEL_40:
      if (!-[PDPaymentTransactionProcessor _canUpdateMapsDataForTransaction:]( self,  "_canUpdateMapsDataForTransaction:",  v6)) {
        goto LABEL_53;
      }
      goto LABEL_12;
    case 6uLL:
    case 8uLL:
LABEL_5:
      char HasAuthenticationRequest = PKPaymentTransactionHasAuthenticationRequest(v6);
      unsigned int v14 = -[PDPaymentTransactionProcessor _canUpdateMapsDataForTransaction:]( self,  "_canUpdateMapsDataForTransaction:",  v6);
      if ((HasAuthenticationRequest & 1) == 0)
      {
        uint64_t v31 = PKLogFacilityTypeGetObject(23LL);
        uint64_t v32 = (os_log_s *)objc_claimAutoreleasedReturnValue(v31);
        v33 = &off_1004D6000;
        if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
        {
          int v53 = 138412290;
          v54 = v6;
          _os_log_impl( (void *)&_mh_execute_header,  v32,  OS_LOG_TYPE_DEFAULT,  "Beginning processing for transaction: %@",  (uint8_t *)&v53,  0xCu);
        }

        if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
        {
          unsigned int v34 = -[__CFString requiresLocation](v6, "requiresLocation");
          id v35 = @"NO";
          if (v34) {
            id v35 = @"YES";
          }
          int v53 = 138412290;
          v54 = v35;
          _os_log_impl( (void *)&_mh_execute_header,  v32,  OS_LOG_TYPE_DEFAULT,  "requiresLocation: %@",  (uint8_t *)&v53,  0xCu);
        }

        unsigned __int8 v36 = -[__CFString requiresLocation](v6, "requiresLocation");
        if ((v36 & 1) != 0 || (v12 | 4) == 5)
        {
          v33 = (char **__ptr32 *)objc_claimAutoreleasedReturnValue(-[__CFString questions](v6, "questions"));
          BOOL v37 = [v33 count] != 0;
          if ((v36 & 1) != 0) {
            goto LABEL_58;
          }
        }

        else
        {
          BOOL v37 = 1LL;
        }

        if ((v12 | 4) != 5)
        {
LABEL_59:
          v40 = self;
          v41 = v6;
          id v42 = v7;
          uint64_t v43 = v37;
          goto LABEL_60;
        }

- (void)_updateActiveState
{
  p_itemsLock = &self->_itemsLock;
  os_unfair_lock_lock(&self->_itemsLock);
  if (-[NSMutableSet count](self->_locationUpdateItems, "count")) {
    BOOL v4 = 0;
  }
  else {
    BOOL v4 = -[NSMutableSet count](self->_backgroundLocationUpdateItems, "count") == 0LL;
  }
  id v5 = -[NSMutableArray count](self->_reverseGeocodeItems, "count");
  unint64_t v6 = (unint64_t)-[NSMutableSet count](self->_stationsUpdateItems, "count");
  unint64_t v7 = (unint64_t)-[NSMutableArray count](self->_merchantCleanupItems, "count");
  os_unfair_lock_unlock(p_itemsLock);
  BOOL v8 = (v6 | v7) != 0;
  if (v5) {
    BOOL v8 = 1;
  }
  int v9 = !v4 || v8;
  if (!self->_active && v9)
  {
    self->_active = 1;
    uint64_t Object = PKLogFacilityTypeGetObject(23LL);
    uint64_t v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "Activating transaction processor...",  buf,  2u);
    }

    __int16 v17 = _NSConcreteStackBlock;
    unint64_t v12 = sub_10040F340;
    id v13 = &v17;
LABEL_20:
    v13[1] = (void **)3221225472LL;
    v13[2] = (void **)v12;
    v13[3] = (void **)&unk_10065EBA0;
    v13[4] = (void **)&self->super.isa;
    -[PDPaymentTransactionProcessor _accessObserversWithHandler:](self, "_accessObserversWithHandler:", v16);
    return;
  }

  if (!self->_active) {
    LOBYTE(v9) = 1;
  }
  if ((v9 & 1) == 0)
  {
    self->_active = 0;
    uint64_t v14 = PKLogFacilityTypeGetObject(23LL);
    unsigned int v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_DEFAULT,  "Deactivating transaction processor...",  buf,  2u);
    }

    id v16 = _NSConcreteStackBlock;
    unint64_t v12 = sub_10040F38C;
    id v13 = &v16;
    goto LABEL_20;
  }

- (void)_processPaymentTransactionForLocationUpdate:(id)a3 forTransactionSourceIdentifier:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (([v6 processedForLocation] & 1) == 0)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
    int v9 = (void *)objc_claimAutoreleasedReturnValue([WeakRetained paymentApplicationForTransactionSource:v7]);

    uint64_t Object = PKLogFacilityTypeGetObject(23LL);
    uint64_t v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      int v29 = 138412546;
      id v30 = v6;
      __int16 v31 = 2112;
      uint64_t v32 = v9;
      _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "Processing Transaction For Location: %@, Payment Application: %@",  (uint8_t *)&v29,  0x16u);
    }

    unint64_t v12 = (PDPaymentTransactionProcessorItem *)objc_claimAutoreleasedReturnValue( -[PDPaymentTransactionProcessor _pendingLocationUpdateItemForTransaction:]( self,  "_pendingLocationUpdateItemForTransaction:",  v6));
    if (v12)
    {
      id v13 = v12;
      -[PDPaymentTransactionProcessorItem setPaymentTransaction:](v12, "setPaymentTransaction:", v6);
LABEL_26:

      goto LABEL_27;
    }

    id v13 = objc_alloc_init(&OBJC_CLASS___PDPaymentTransactionProcessorItem);
    id v14 = [v6 effectiveTransactionSource];
    -[PDPaymentTransactionProcessorItem setPaymentTransaction:](v13, "setPaymentTransaction:", v6);
    -[PDPaymentTransactionProcessorItem setTransactionSourceIdentifier:](v13, "setTransactionSourceIdentifier:", v7);
    -[PDPaymentTransactionProcessorItem setUseBackgroundLocation:](v13, "setUseBackgroundLocation:", v14 == (id)5);
    id v15 = [v9 paymentNetworkIdentifier];
    if (v15 == (id)117 && (id v15 = [v6 transactionType], v15 == (id)2))
    {
      id v15 = [v6 transitType];
      BOOL v17 = v15 != (id)3;
    }

    else
    {
      BOOL v17 = 0;
    }

    if (v14 == (id)5) {
      int v18 = PKMerchantLookupLocationServicesEnabled();
    }
    else {
      int v18 = PKLocationServicesEnabled(v15, v16);
    }
    if (((v17 | v18 ^ 1) & 1) != 0)
    {
      if (!v17) {
        PKAnalyticsSendEvent(PKAggDKeyPaymentTransactionProcessingLocationServicesEnabled, &off_100691478);
      }
      -[PDPaymentTransactionProcessor _updateLocation:forLocationUpdateItem:andMarkAsProcessed:]( self,  "_updateLocation:forLocationUpdateItem:andMarkAsProcessed:",  0LL,  v13,  1LL);
      goto LABEL_26;
    }

    PKAnalyticsSendEvent(PKAggDKeyPaymentTransactionProcessingLocationServicesEnabled, &off_100691450);
    uint64_t v19 = 7LL;
    if (v14 == (id)5) {
      uint64_t v19 = 8LL;
    }
    uint64_t v20 = (&self->super.isa)[v19];
    uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue(-[objc_class location](v20, "location"));
    if (sub_10040E0F0(v21, v20, v6))
    {
      -[PDPaymentTransactionProcessorItem setFoundOptimalLocation:](v13, "setFoundOptimalLocation:", 1LL);
      __int128 v22 = self;
      id v23 = v21;
    }

    else
    {
      unsigned int v24 = (void *)objc_claimAutoreleasedReturnValue([v6 transactionDate]);
      [v24 timeIntervalSinceNow];
      double v26 = fabs(v25);

      if (v26 <= 300.0)
      {
        -[PDPaymentTransactionProcessor _continueUpdatingLocationForTransactionUpdateItem:]( self,  "_continueUpdatingLocationForTransactionUpdateItem:",  v13);
        if (!sub_10040F6D4(v21, v20, v6)) {
          goto LABEL_25;
        }
        __int128 v22 = self;
        id v23 = v21;
        uint64_t v27 = v13;
        uint64_t v28 = 0LL;
LABEL_24:
        -[PDPaymentTransactionProcessor _updateLocation:forLocationUpdateItem:andMarkAsProcessed:]( v22,  "_updateLocation:forLocationUpdateItem:andMarkAsProcessed:",  v23,  v27,  v28);
LABEL_25:

        goto LABEL_26;
      }

      __int128 v22 = self;
      id v23 = 0LL;
    }

    uint64_t v27 = v13;
    uint64_t v28 = 1LL;
    goto LABEL_24;
  }

- (void)_continueUpdatingLocationForTransactionUpdateItem:(id)a3
{
  id v6 = a3;
  os_unfair_lock_lock(&self->_itemsLock);
  unsigned int v4 = [v6 useBackgroundLocation];
  uint64_t v5 = 2LL;
  if (v4) {
    uint64_t v5 = 3LL;
  }
  -[objc_class addObject:]((&self->super.isa)[v5], "addObject:", v6);
  os_unfair_lock_unlock(&self->_itemsLock);
  if ([v6 useBackgroundLocation]) {
    -[PDPaymentTransactionProcessor _startUpdatingBackgroundLocationIfPossible]( self,  "_startUpdatingBackgroundLocationIfPossible");
  }
  else {
    -[PDPaymentTransactionProcessor _startUpdatingLocationIfPossible](self, "_startUpdatingLocationIfPossible");
  }
}

- (void)_updateLocation:(id)a3 forLocationUpdateItem:(id)a4 andMarkAsProcessed:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a3;
  id v9 = a4;
  id v10 = (void *)objc_claimAutoreleasedReturnValue([v9 transactionSourceIdentifier]);
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([v9 paymentTransaction]);
  if ([v11 processedForLocation])
  {
    unint64_t v12 = v8;
    goto LABEL_37;
  }

  [v11 setProcessedForLocation:v5];
  [v11 addUpdateReasons:128];
  if (v8)
  {
    unsigned int v13 = [v9 useBackgroundLocation];
    uint64_t v14 = 7LL;
    if (v13) {
      uint64_t v14 = 8LL;
    }
    id v15 = -[objc_class _limitsPrecision]((&self->super.isa)[v14], "_limitsPrecision");
    [v11 setLocation:v8];
    uint64_t Object = PKLogFacilityTypeGetObject(23LL);
    BOOL v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "Transaction Location saved", buf, 2u);
    }

    [v11 setCoarseLocation:v15];
    goto LABEL_11;
  }

  if (v5)
  {
    uint64_t v18 = PKLogFacilityTypeGetObject(23LL);
    BOOL v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v18);
LABEL_11:
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      double v45 = *(double *)&v11;
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "Transaction Location Updated: %@", buf, 0xCu);
    }

    PKAnalyticsSendEvent(PKAggDKeyPaymentTransactionProcessingHasLocation, 0LL);
    id WeakRetained = objc_loadWeakRetained((id *)&self->_usageNotificationServer);
    [WeakRetained notifyPaymentPassUsedWithTransactionInfo:v11];

    unsigned int v38 = _NSConcreteStackBlock;
    uint64_t v39 = 3221225472LL;
    v40 = sub_10040FCC4;
    v41 = &unk_10065EB78;
    id v42 = v11;
    id v43 = v10;
    -[PDPaymentTransactionProcessor _accessObserversWithHandler:](self, "_accessObserversWithHandler:", &v38);
  }

  unint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "location", v38, v39, v40, v41));

  if (v5)
  {
    if (v9)
    {
      os_unfair_lock_lock(&self->_itemsLock);
      unsigned int v22 = [v9 useBackgroundLocation];
      uint64_t v23 = 2LL;
      if (v22) {
        uint64_t v23 = 3LL;
      }
      -[objc_class removeObject:]((&self->super.isa)[v23], "removeObject:", v9);
      os_unfair_lock_unlock(&self->_itemsLock);
    }

    if (v12)
    {
      unsigned int v24 = [v9 foundOptimalLocation];
      double v25 = &PKAggDKeyPaymentTransactionProcessingOptimalLocation;
      if (!v24) {
        double v25 = &PKAggDKeyPaymentTransactionProcessingNonOptimalLocation;
      }
      PKAnalyticsSendEvent(*v25, 0LL);
      uint64_t v26 = PKLogFacilityTypeGetObject(23LL);
      uint64_t v27 = (os_log_s *)objc_claimAutoreleasedReturnValue(v26);
      if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v28 = (void *)objc_claimAutoreleasedReturnValue([v11 identifier]);
        *(_DWORD *)buf = 138412290;
        double v45 = *(double *)&v28;
        _os_log_impl( (void *)&_mh_execute_header,  v27,  OS_LOG_TYPE_DEFAULT,  "Reverse geocoding final location update: %@",  buf,  0xCu);
      }

      if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
      {
        int v29 = (void *)objc_claimAutoreleasedReturnValue([v11 transactionDate]);
        id v30 = (void *)objc_claimAutoreleasedReturnValue([v12 timestamp]);
        [v29 timeIntervalSinceDate:v30];
        *(_DWORD *)buf = 134217984;
        double v45 = fabs(v31);
        _os_log_impl( (void *)&_mh_execute_header,  v27,  OS_LOG_TYPE_DEFAULT,  "Transaction/Location Delta: %.1f",  buf,  0xCu);
      }

      uint64_t v32 = PKGreenTeaLogger();
      uint64_t CTGreenTeaOsLogHandle = getCTGreenTeaOsLogHandle(v32);
      unsigned int v34 = (os_log_s *)objc_claimAutoreleasedReturnValue(CTGreenTeaOsLogHandle);
      id v35 = v34;
      if (v34 && os_log_type_enabled(v34, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v35,  OS_LOG_TYPE_INFO,  "Transmitting transaction location for reverse geocoding",  buf,  2u);
      }

      unsigned __int8 v36 = (void *)objc_claimAutoreleasedReturnValue( -[PDPaymentTransactionProcessor _pendingReverseGeocodeUpdateItemForTransaction:]( self,  "_pendingReverseGeocodeUpdateItemForTransaction:",  v11));
      BOOL v37 = v36;
      if (v36)
      {
        [v36 setPaymentTransaction:v11];
      }

      else
      {
        os_unfair_lock_lock(&self->_itemsLock);
        -[NSMutableArray addObject:](self->_reverseGeocodeItems, "addObject:", v9);
        os_unfair_lock_unlock(&self->_itemsLock);
      }

      -[PDPaymentTransactionProcessor _beginReverseGeocodingIfPossible](self, "_beginReverseGeocodingIfPossible");
    }

    else
    {
      -[PDPaymentTransactionProcessor _processItemForStationsCleanup:](self, "_processItemForStationsCleanup:", v9);
      -[PDPaymentTransactionProcessor _updateActiveState](self, "_updateActiveState");
    }

    -[PDPaymentTransactionProcessor _reportTransactionWithFinalLocation:]( self,  "_reportTransactionWithFinalLocation:",  v11);
  }

- (void)_reportTransactionWithFinalLocation:(id)a3
{
  id v25 = a3;
  id v3 = -[NSMutableDictionary initWithCapacity:]( objc_alloc(&OBJC_CLASS___NSMutableDictionary),  "initWithCapacity:",  12LL);
  if ([v25 transactionType] == (id)2)
  {
    uint64_t v4 = (uint64_t)[v25 transitType];
    if (v4 <= 512)
    {
      BOOL v5 = @"bus";
      switch(v4)
      {
        case 0LL:
          BOOL v5 = @"unknownTransitType";
          break;
        case 1LL:
          BOOL v5 = @"transit";
          break;
        case 2LL:
          BOOL v5 = @"metro";
          break;
        case 3LL:
          break;
        case 4LL:
          BOOL v5 = @"train";
          break;
        case 5LL:
          BOOL v5 = @"other";
          break;
        case 6LL:
          BOOL v5 = @"special";
          break;
        case 7LL:
          BOOL v5 = @"lightrail";
          break;
        case 8LL:
          BOOL v5 = @"cableCar";
          break;
        default:
          switch(v4)
          {
            case 257LL:
              BOOL v5 = @"shinkansen";
              break;
            case 258LL:
              BOOL v5 = @"maglev";
              break;
            case 259LL:
              BOOL v5 = @"taxi";
              break;
            case 260LL:
              BOOL v5 = @"ferry";
              break;
            case 261LL:
              BOOL v5 = @"bike";
              break;
            default:
LABEL_18:
              BOOL v5 = @"unknown";
              break;
          }

          break;
      }
    }

    else
    {
      switch(v4)
      {
        case 513LL:
          BOOL v5 = @"deposit";
          break;
        case 514LL:
          BOOL v5 = @"refund";
          break;
        case 515LL:
          BOOL v5 = @"purchase";
          break;
        case 516LL:
          BOOL v5 = @"withdrawal";
          break;
        case 517LL:
          BOOL v5 = @"cardRead";
          break;
        case 518LL:
          BOOL v5 = @"renewal";
          break;
        default:
          if (v4 == 1025)
          {
            BOOL v5 = @"greenCar";
          }

          else
          {
            if (v4 != 1026) {
              goto LABEL_18;
            }
            BOOL v5 = @"metroUpgrade";
          }

          break;
      }
    }

    -[NSMutableDictionary setObject:forKeyedSubscript:](v3, "setObject:forKeyedSubscript:", v5, @"transitType");
    id v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInteger:]( NSNumber,  "numberWithUnsignedInteger:",  [v25 transitModifiers]));
    -[NSMutableDictionary setObject:forKeyedSubscript:]( v3,  "setObject:forKeyedSubscript:",  v6,  @"transitModifiers");
  }

  id v7 = [v25 transactionStatus];
  uint64_t v9 = PKPaymentTransactionStatusToString(v7, v8);
  id v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
  -[NSMutableDictionary setObject:forKeyedSubscript:]( v3,  "setObject:forKeyedSubscript:",  v10,  @"transactionStatus");

  uint64_t v11 = PKPaymentTransactionTypeToString([v25 transactionType]);
  unint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
  -[NSMutableDictionary setObject:forKeyedSubscript:](v3, "setObject:forKeyedSubscript:", v12, @"transactionType");

  unsigned int v13 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithInteger:]( NSNumber,  "numberWithInteger:",  [v25 technologyType]));
  -[NSMutableDictionary setObject:forKeyedSubscript:](v3, "setObject:forKeyedSubscript:", v13, @"technologyType");

  id v14 = [v25 transactionSource];
  else {
    id v15 = *(&off_10065EE88 + (void)v14);
  }
  id v16 = -[NSMutableDictionary setObject:forKeyedSubscript:]( v3,  "setObject:forKeyedSubscript:",  v15,  @"transactionSource");
  uint64_t v18 = PKLocationServicesEnabled(v16, v17);
  uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", v18));
  -[NSMutableDictionary setObject:forKeyedSubscript:]( v3,  "setObject:forKeyedSubscript:",  v19,  @"locationServicesEnabled");

  if ((_DWORD)v18)
  {
    uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue([v25 location]);
    [v20 horizontalAccuracy];
    uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:"));
    -[NSMutableDictionary setObject:forKeyedSubscript:]( v3,  "setObject:forKeyedSubscript:",  v21,  @"horizontalAccuracy");

    unsigned int v22 = (void *)objc_claimAutoreleasedReturnValue([v20 timestamp]);
    uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue([v25 transactionDate]);
    [v22 timeIntervalSinceDate:v23];
    unsigned int v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:"));
    -[NSMutableDictionary setObject:forKeyedSubscript:](v3, "setObject:forKeyedSubscript:", v24, @"timeAccuracy");
  }

  -[NSMutableDictionary setObject:forKeyedSubscript:]( v3,  "setObject:forKeyedSubscript:",  PKAnalyticsReportEventTypePaymentTransactionUpdatedForLocation,  PKAnalyticsReportEventKey);
  +[PKAnalyticsReporter sendSingularEvent:](&OBJC_CLASS___PKAnalyticsReporter, "sendSingularEvent:", v3);
}

- (void)_abortUpdatingLocationForLocationUpdateItem:(id)a3
{
  id v11 = a3;
  unsigned int v4 = [v11 useBackgroundLocation];
  uint64_t v5 = 7LL;
  if (v4) {
    uint64_t v5 = 8LL;
  }
  id v6 = (&self->super.isa)[v5];
  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[objc_class location](v6, "location"));
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v11 paymentTransaction]);
  BOOL v9 = sub_10040F6D4(v7, v6, v8);

  if (v9)
  {
    id v10 = v7;
  }

  else
  {
    PKAnalyticsSendEvent(PKAggDKeyPaymentTransactionProcessingLocationTimedOut, 0LL);
    id v10 = 0LL;
  }

  -[PDPaymentTransactionProcessor _updateLocation:forLocationUpdateItem:andMarkAsProcessed:]( self,  "_updateLocation:forLocationUpdateItem:andMarkAsProcessed:",  v10,  v11,  1LL);
}

- (void)_abortUpdatingLocationForAllLocationUpdateItems
{
  p_itemsLock = &self->_itemsLock;
  os_unfair_lock_lock(&self->_itemsLock);
  id v4 = -[NSMutableSet copy](self->_locationUpdateItems, "copy");
  os_unfair_lock_unlock(p_itemsLock);
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_100410254;
  v5[3] = &unk_10065EBC8;
  v5[4] = self;
  [v4 enumerateObjectsUsingBlock:v5];
  -[PDPaymentTransactionProcessor _stopUpdatingLocationIfPossible](self, "_stopUpdatingLocationIfPossible");
}

- (void)_abortUpdatingLocationForAllBackgroundLocationUpdateItems
{
  p_itemsLock = &self->_itemsLock;
  os_unfair_lock_lock(&self->_itemsLock);
  id v4 = -[NSMutableSet copy](self->_backgroundLocationUpdateItems, "copy");
  os_unfair_lock_unlock(p_itemsLock);
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_1004102EC;
  v5[3] = &unk_10065EBC8;
  v5[4] = self;
  [v4 enumerateObjectsUsingBlock:v5];
  -[PDPaymentTransactionProcessor _stopUpdatingLocationIfPossible](self, "_stopUpdatingLocationIfPossible");
}

- (void)_startUpdatingLocationIfPossible
{
  if (PKLocationServicesEnabled(self, a2))
  {
    uint64_t Object = PKLogFacilityTypeGetObject(23LL);
    id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Starting Location Updates...", buf, 2u);
    }

    -[CLLocationManager startUpdatingLocation](self->_locationManager, "startUpdatingLocation");
    locationUpdateTimeoutTimer = self->_locationUpdateTimeoutTimer;
    if (locationUpdateTimeoutTimer) {
      dispatch_source_cancel((dispatch_source_t)locationUpdateTimeoutTimer);
    }
    id v6 = PDDefaultQueue();
    id v7 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(v6);
    uint64_t v8 = (OS_dispatch_source *)dispatch_source_create( (dispatch_source_type_t)&_dispatch_source_type_timer,  0LL,  0LL,  v7);
    BOOL v9 = self->_locationUpdateTimeoutTimer;
    self->_locationUpdateTimeoutTimer = v8;

    id v10 = self->_locationUpdateTimeoutTimer;
    dispatch_time_t v11 = dispatch_time(0LL, (uint64_t)(PKLocationAssertionGracePeriod * 1000000000.0));
    dispatch_source_set_timer((dispatch_source_t)v10, v11, 0xFFFFFFFFFFFFFFFFLL, 0x5F5E100uLL);
    unint64_t v12 = self->_locationUpdateTimeoutTimer;
    handler[0] = _NSConcreteStackBlock;
    handler[1] = 3221225472LL;
    handler[2] = sub_100410438;
    handler[3] = &unk_100639300;
    handler[4] = self;
    dispatch_source_set_event_handler((dispatch_source_t)v12, handler);
    dispatch_resume((dispatch_object_t)self->_locationUpdateTimeoutTimer);
  }

- (void)_startUpdatingBackgroundLocationIfPossible
{
  if (PKMerchantLookupLocationServicesEnabled(self, a2))
  {
    uint64_t Object = PKLogFacilityTypeGetObject(23LL);
    id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "Starting Background Location Updates...",  buf,  2u);
    }

    -[CLLocationManager startUpdatingLocation](self->_backgroundMerchantLocationManager, "startUpdatingLocation");
    backgroundLocationUpdateTimer = self->_backgroundLocationUpdateTimer;
    if (backgroundLocationUpdateTimer) {
      dispatch_source_cancel((dispatch_source_t)backgroundLocationUpdateTimer);
    }
    id v6 = PDDefaultQueue();
    id v7 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(v6);
    uint64_t v8 = (OS_dispatch_source *)dispatch_source_create( (dispatch_source_type_t)&_dispatch_source_type_timer,  0LL,  0LL,  v7);
    BOOL v9 = self->_backgroundLocationUpdateTimer;
    self->_backgroundLocationUpdateTimer = v8;

    id v10 = self->_backgroundLocationUpdateTimer;
    dispatch_time_t v11 = dispatch_time(0LL, (uint64_t)(PKLocationAssertionGracePeriod * 1000000000.0));
    dispatch_source_set_timer((dispatch_source_t)v10, v11, 0xFFFFFFFFFFFFFFFFLL, 0x5F5E100uLL);
    unint64_t v12 = self->_backgroundLocationUpdateTimer;
    handler[0] = _NSConcreteStackBlock;
    handler[1] = 3221225472LL;
    handler[2] = sub_1004105EC;
    handler[3] = &unk_100639300;
    handler[4] = self;
    dispatch_source_set_event_handler((dispatch_source_t)v12, handler);
    dispatch_resume((dispatch_object_t)self->_backgroundLocationUpdateTimer);
  }

- (void)_stopUpdatingLocationIfPossible
{
  p_itemsLock = &self->_itemsLock;
  os_unfair_lock_lock(&self->_itemsLock);
  id v4 = -[NSMutableSet count](self->_locationUpdateItems, "count");
  id v5 = -[NSMutableSet count](self->_backgroundLocationUpdateItems, "count");
  os_unfair_lock_unlock(p_itemsLock);
  if (!v4)
  {
    uint64_t Object = PKLogFacilityTypeGetObject(23LL);
    id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Stopping Location Updates...", buf, 2u);
    }

    -[CLLocationManager stopUpdatingLocation](self->_locationManager, "stopUpdatingLocation");
    locationUpdateTimeoutTimer = self->_locationUpdateTimeoutTimer;
    if (locationUpdateTimeoutTimer)
    {
      dispatch_source_cancel((dispatch_source_t)locationUpdateTimeoutTimer);
      BOOL v9 = self->_locationUpdateTimeoutTimer;
      self->_locationUpdateTimeoutTimer = 0LL;
    }
  }

  if (!v5)
  {
    uint64_t v10 = PKLogFacilityTypeGetObject(23LL);
    dispatch_time_t v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v14 = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "Stopping Background Location Updates...",  v14,  2u);
    }

    -[CLLocationManager stopUpdatingLocation](self->_backgroundMerchantLocationManager, "stopUpdatingLocation");
    backgroundLocationUpdateTimer = self->_backgroundLocationUpdateTimer;
    if (backgroundLocationUpdateTimer)
    {
      dispatch_source_cancel((dispatch_source_t)backgroundLocationUpdateTimer);
      unsigned int v13 = self->_backgroundLocationUpdateTimer;
      self->_backgroundLocationUpdateTimer = 0LL;
    }
  }

- (void)_beginReverseGeocodingIfPossible
{
  if (!-[CLGeocoder isGeocoding](self->_geocoder, "isGeocoding"))
  {
    os_unfair_lock_lock(&self->_itemsLock);
    id v3 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray firstObject](self->_reverseGeocodeItems, "firstObject"));
    id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 paymentTransaction]);
    id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 location]);

    os_unfair_lock_unlock(&self->_itemsLock);
    geocoder = self->_geocoder;
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472LL;
    v8[2] = sub_10041086C;
    v8[3] = &unk_1006501F8;
    void v8[4] = self;
    id v9 = v5;
    id v7 = v5;
    -[CLGeocoder reverseGeocodeLocation:completionHandler:]( geocoder,  "reverseGeocodeLocation:completionHandler:",  v7,  v8);
  }

- (id)_pendingReverseGeocodeUpdateItemForTransaction:(id)a3
{
  id v4 = a3;
  p_itemsLock = &self->_itemsLock;
  os_unfair_lock_lock(&self->_itemsLock);
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v4 identifier]);
  __int128 v21 = 0u;
  __int128 v22 = 0u;
  __int128 v23 = 0u;
  __int128 v24 = 0u;
  id v7 = self->_reverseGeocodeItems;
  id v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v7,  "countByEnumeratingWithState:objects:count:",  &v21,  v27,  16LL);
  if (v8)
  {
    id v9 = v8;
    id v20 = v4;
    uint64_t v10 = *(void *)v22;
    while (2)
    {
      for (i = 0LL; i != v9; i = (char *)i + 1)
      {
        if (*(void *)v22 != v10) {
          objc_enumerationMutation(v7);
        }
        unint64_t v12 = *(void **)(*((void *)&v21 + 1) + 8LL * (void)i);
        unsigned int v13 = (void *)objc_claimAutoreleasedReturnValue([v12 paymentTransaction]);
        id v14 = (void *)objc_claimAutoreleasedReturnValue([v13 identifier]);
        int v15 = PKEqualObjects(v6, v14);

        if (v15)
        {
          uint64_t Object = PKLogFacilityTypeGetObject(23LL);
          uint64_t v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
          if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            uint64_t v26 = v6;
            _os_log_impl( (void *)&_mh_execute_header,  v18,  OS_LOG_TYPE_DEFAULT,  "Found pending reverse geocode update item for transaction identifier: %@",  buf,  0xCu);
          }

          id v16 = v12;
          goto LABEL_13;
        }
      }

      id v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v7,  "countByEnumeratingWithState:objects:count:",  &v21,  v27,  16LL);
      if (v9) {
        continue;
      }
      break;
    }

    id v16 = 0LL;
LABEL_13:
    id v4 = v20;
  }

  else
  {
    id v16 = 0LL;
  }

  os_unfair_lock_unlock(p_itemsLock);
  return v16;
}

- (void)_processPaymentTransactionForStationsUpdate:(id)a3 forTransactionSourceIdentifier:(id)a4
{
  id v9 = a3;
  id v6 = a4;
  id v7 = (PDPaymentTransactionProcessorItem *)objc_claimAutoreleasedReturnValue( -[PDPaymentTransactionProcessor _pendingStationsUpdateItemForTransaction:]( self,  "_pendingStationsUpdateItemForTransaction:",  v9));
  if (v7)
  {
    id v8 = v7;
    -[PDPaymentTransactionProcessorItem setPaymentTransaction:](v7, "setPaymentTransaction:", v9);
  }

  else
  {
    id v8 = objc_alloc_init(&OBJC_CLASS___PDPaymentTransactionProcessorItem);
    -[PDPaymentTransactionProcessorItem setPaymentTransaction:](v8, "setPaymentTransaction:", v9);
    -[PDPaymentTransactionProcessorItem setTransactionSourceIdentifier:](v8, "setTransactionSourceIdentifier:", v6);
  }

  -[PDPaymentTransactionProcessor _processItemForStationsCleanup:](self, "_processItemForStationsCleanup:", v8);
}

- (void)_processItemForStationsCleanup:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 paymentTransaction]);
  if ([v5 processedForStations])
  {
    -[PDPaymentTransactionProcessor _processItemForMerchantCleanup:clearingAttempt:]( self,  "_processItemForMerchantCleanup:clearingAttempt:",  v4,  0LL);
  }

  else
  {
    id v6 = (void *)objc_claimAutoreleasedReturnValue( -[PDPaymentTransactionProcessor _pendingStationsUpdateItemForTransaction:]( self,  "_pendingStationsUpdateItemForTransaction:",  v5));

    if (!v6)
    {
      id v7 = (id)objc_claimAutoreleasedReturnValue([v4 transactionSourceIdentifier]);
      if ([v5 transactionType] == (id)2
        || (id v8 = (void *)objc_claimAutoreleasedReturnValue([v5 startStationCode])) != 0
        && (id v9 = (void *)objc_claimAutoreleasedReturnValue([v5 endStationCode]),
            v9,
            v8,
            v9))
      {
        uint64_t Object = PKLogFacilityTypeGetObject(12LL);
        dispatch_time_t v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
        {
          unint64_t v12 = (void *)objc_claimAutoreleasedReturnValue([v5 identifier]);
          LODWORD(buf) = 138412290;
          *(void *)((char *)&buf + 4) = v12;
          _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "Processing Transaction For Stations: %@",  (uint8_t *)&buf,  0xCu);
        }

        os_unfair_lock_lock(&self->_itemsLock);
        -[NSMutableSet addObject:](self->_stationsUpdateItems, "addObject:", v4);
        os_unfair_lock_unlock(&self->_itemsLock);
        id v24 = objc_alloc_init(&OBJC_CLASS___PKAsyncUnaryOperationComposer);
        *(void *)&__int128 buf = 0LL;
        *((void *)&buf + 1) = &buf;
        uint64_t v66 = 0x3032000000LL;
        v67 = sub_100411724;
        v68 = sub_100411734;
        id v69 = (id)objc_claimAutoreleasedReturnValue([v5 stationCodeProvider]);
        unsigned int v13 = (void *)objc_claimAutoreleasedReturnValue([v5 cityCode]);

        if (v13)
        {
          v59[0] = _NSConcreteStackBlock;
          v59[1] = 3221225472LL;
          v59[2] = sub_10041173C;
          v59[3] = &unk_100639728;
          p___int128 buf = &buf;
          id v60 = v5;
          [v24 addOperation:v59];
        }

        v57[0] = 0LL;
        v57[1] = v57;
        v57[2] = 0x3032000000LL;
        v57[3] = sub_100411724;
        v57[4] = sub_100411734;
        id v58 = 0LL;
        v55[0] = 0LL;
        v55[1] = v55;
        v55[2] = 0x3032000000LL;
        v55[3] = sub_100411724;
        v55[4] = sub_100411734;
        id v56 = 0LL;
        v53[0] = 0LL;
        v53[1] = v53;
        v53[2] = 0x3032000000LL;
        v53[3] = sub_100411724;
        v53[4] = sub_100411734;
        id v54 = 0LL;
        v51[0] = 0LL;
        v51[1] = v51;
        v51[2] = 0x3032000000LL;
        v51[3] = sub_100411724;
        v51[4] = sub_100411734;
        id v52 = 0LL;
        id v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "startStationCode", v7));
        int v15 = (void *)objc_claimAutoreleasedReturnValue([v5 endStationCode]);
        v42[0] = _NSConcreteStackBlock;
        v42[1] = 3221225472LL;
        v42[2] = sub_100411BF4;
        v42[3] = &unk_10065ED30;
        v42[4] = self;
        id v46 = &buf;
        id v16 = v5;
        id v43 = v16;
        id v17 = v14;
        id v44 = v17;
        v47 = v57;
        id v18 = v15;
        id v45 = v18;
        id v48 = v53;
        v49 = v55;
        uint64_t v50 = v51;
        [v24 addOperation:v42];
        v33[0] = _NSConcreteStackBlock;
        v33[1] = 3221225472LL;
        v33[2] = sub_10041264C;
        v33[3] = &unk_10065ED80;
        BOOL v37 = v57;
        unsigned int v38 = v53;
        id v34 = v16;
        id v19 = v17;
        id v35 = v19;
        id v20 = v18;
        id v36 = v20;
        uint64_t v39 = &buf;
        v40 = v55;
        v41 = v51;
        [v24 addOperation:v33];
        __int128 v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSNull null](&OBJC_CLASS___NSNull, "null"));
        v25[0] = _NSConcreteStackBlock;
        v25[1] = 3221225472LL;
        v25[2] = sub_100412CB8;
        v25[3] = &unk_10065EDD0;
        int v29 = v57;
        id v30 = v55;
        double v31 = v53;
        uint64_t v32 = v51;
        id v26 = v4;
        uint64_t v27 = self;
        id v28 = v23;
        id v22 = [v24 evaluateWithInput:v21 completion:v25];

        id v7 = v23;
        _Block_object_dispose(v51, 8);

        _Block_object_dispose(v53, 8);
        _Block_object_dispose(v55, 8);

        _Block_object_dispose(v57, 8);
        _Block_object_dispose(&buf, 8);
      }

      else
      {
        if (([v5 processedForStations] & 1) == 0)
        {
          [v5 setProcessedForStations:1];
          [v5 addUpdateReasons:128];
        }

        v62[0] = _NSConcreteStackBlock;
        v62[1] = 3221225472LL;
        v62[2] = sub_100411718;
        v62[3] = &unk_10065EB78;
        id v63 = v5;
        id v64 = v7;
        -[PDPaymentTransactionProcessor _accessObserversWithHandler:](self, "_accessObserversWithHandler:", v62);
        -[PDPaymentTransactionProcessor _processItemForMerchantCleanup:clearingAttempt:]( self,  "_processItemForMerchantCleanup:clearingAttempt:",  v4,  0LL);

        id v24 = v63;
      }
    }
  }
}

- (void)_processPaymentTransactionForMerchantCleanup:(id)a3 forTransactionSourceIdentifier:(id)a4 clearingAttempt:(BOOL)a5
{
  BOOL v5 = a5;
  id v11 = a3;
  id v8 = a4;
  id v9 = (PDPaymentTransactionProcessorItem *)objc_claimAutoreleasedReturnValue( -[PDPaymentTransactionProcessor _pendingMerchantCleanupItemForTransaction:]( self,  "_pendingMerchantCleanupItemForTransaction:",  v11));
  if (v9)
  {
    uint64_t v10 = v9;
    -[PDPaymentTransactionProcessorItem setPaymentTransaction:](v9, "setPaymentTransaction:", v11);
  }

  else
  {
    uint64_t v10 = objc_alloc_init(&OBJC_CLASS___PDPaymentTransactionProcessorItem);
    -[PDPaymentTransactionProcessorItem setPaymentTransaction:](v10, "setPaymentTransaction:", v11);
    -[PDPaymentTransactionProcessorItem setTransactionSourceIdentifier:](v10, "setTransactionSourceIdentifier:", v8);
  }

  -[PDPaymentTransactionProcessor _processItemForMerchantCleanup:clearingAttempt:]( self,  "_processItemForMerchantCleanup:clearingAttempt:",  v10,  v5);
}

- (void)_processPaymentTransactionForMapsData:(id)a3 forTransactionSourceIdentifier:(id)a4
{
  id v11 = 0LL;
  id v5 = a3;
  +[PDMapsBrandAndMerchantUpdater canUpdateMapsBrandForTransaction:outConfiguration:]( &OBJC_CLASS___PDMapsBrandAndMerchantUpdater,  "canUpdateMapsBrandForTransaction:outConfiguration:",  v5,  &v11);
  id v6 = v11;
  id v7 = objc_alloc_init(&OBJC_CLASS___NSMutableSet);
  id v8 = v7;
  if (v6) {
    -[NSMutableSet addObject:](v7, "addObject:", v6);
  }

  id v10 = 0LL;
  +[PDMapsBrandAndMerchantUpdater canUpdateMapsMerchantForTransaction:outConfiguration:]( &OBJC_CLASS___PDMapsBrandAndMerchantUpdater,  "canUpdateMapsMerchantForTransaction:outConfiguration:",  v5,  &v10);

  id v9 = v10;
  if (v9) {
    -[NSMutableSet addObject:](v8, "addObject:", v9);
  }
  if (-[NSMutableSet count](v8, "count")) {
    -[PDMapsBrandAndMerchantUpdater updateMapsDataForConfigurations:]( self->_mapsBrandAndMerchantUpdater,  "updateMapsDataForConfigurations:",  v8);
  }
}

- (void)_processItemForMerchantCleanup:(id)a3 clearingAttempt:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 transactionSourceIdentifier]);
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v6 paymentTransaction]);
  unsigned int v9 = -[PDPaymentTransactionProcessor _canUpdateMapsDataForTransaction:](self, "_canUpdateMapsDataForTransaction:", v8);
  unsigned int v10 = [v8 processedForMerchantCleanup];
  unsigned int v11 = [v8 requiresMerchantReprocessing];
  if (v10 && !v11
    || (unint64_t v12 = (void *)objc_claimAutoreleasedReturnValue( -[PDPaymentTransactionProcessor _pendingMerchantCleanupItemForTransaction:]( self,  "_pendingMerchantCleanupItemForTransaction:",  v8)),  v12,  v12))
  {
    if (v9) {
      -[PDPaymentTransactionProcessor _processPaymentTransactionForMapsData:forTransactionSourceIdentifier:]( self,  "_processPaymentTransactionForMapsData:forTransactionSourceIdentifier:",  v8,  v7);
    }
  }

  else
  {
    unsigned int v22 = [v8 hasBackingData];
    unsigned int v13 = [v8 processedForLocation];
    id v14 = (void *)objc_claimAutoreleasedReturnValue([v8 merchant]);
    id v15 = v8;
    id v16 = (void *)objc_claimAutoreleasedReturnValue([v15 merchant]);
    unsigned __int8 v17 = [v15 hasBackingData];
    BOOL v18 = ![v16 isValid] && (v17 & 1) != 0
       || [v15 featureIdentifier] == (id)4
       && ((unint64_t)[v15 transactionType] & 0xFFFFFFFFFFFFFFFELL) == 6;

    if (([v14 isValid] & v22 & v13) == 1
      && ([v15 transactionType] == (id)15 ? (char v19 = 1) : (char v19 = v18), (v19 & 1) == 0))
    {
      PKAnalyticsSendEvent(PKAggDKeyPaymentTransactionProcessingHasMerchant, 0LL);
      [v6 setIsClearingAttempt:v4];
      uint64_t Object = PKLogFacilityTypeGetObject(23LL);
      __int128 v21 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)__int128 buf = 138412290;
        id v27 = v6;
        _os_log_impl( (void *)&_mh_execute_header,  v21,  OS_LOG_TYPE_DEFAULT,  "Adding maps lookup request for updateItem: %@",  buf,  0xCu);
      }

      os_unfair_lock_lock(&self->_itemsLock);
      -[NSMutableArray addObject:](self->_merchantCleanupItems, "addObject:", v6);
      os_unfair_lock_unlock(&self->_itemsLock);
      -[PDPaymentTransactionProcessor _beginMerchantCleanupIfPossible](self, "_beginMerchantCleanupIfPossible");
    }

    else if (v18 || [v15 transactionType] == (id)2)
    {
      if (([v15 processedForMerchantCleanup] & 1) == 0)
      {
        [v15 setProcessedForMerchantCleanup:1];
        [v15 addUpdateReasons:128];
      }

      v23[0] = _NSConcreteStackBlock;
      v23[1] = 3221225472LL;
      v23[2] = sub_100413334;
      v23[3] = &unk_10065EB78;
      id v24 = v15;
      id v25 = v7;
      -[PDPaymentTransactionProcessor _accessObserversWithHandler:](self, "_accessObserversWithHandler:", v23);
    }
  }
}

- (BOOL)_canUpdateMapsDataForTransaction:(id)a3
{
  id v3 = a3;
  unsigned int v4 = +[PDMapsBrandAndMerchantUpdater canUpdateMapsBrandForTransaction:outConfiguration:]( &OBJC_CLASS___PDMapsBrandAndMerchantUpdater,  "canUpdateMapsBrandForTransaction:outConfiguration:",  v3,  0LL);
  BOOL v5 = +[PDMapsBrandAndMerchantUpdater canUpdateMapsMerchantForTransaction:outConfiguration:]( &OBJC_CLASS___PDMapsBrandAndMerchantUpdater,  "canUpdateMapsMerchantForTransaction:outConfiguration:",  v3,  0LL);
  BOOL v6 = v5;
  else {
    LOBYTE(v8) = 0;
  }

  return v8;
}

- (void)_beginMerchantCleanupIfPossible
{
  p_itemsLock = &self->_itemsLock;
  os_unfair_lock_lock(&self->_itemsLock);
  if (self->_processingMerchantCleanupItems)
  {
    uint64_t Object = PKLogFacilityTypeGetObject(6LL);
    BOOL v5 = (void *)objc_claimAutoreleasedReturnValue(Object);
    if (!os_log_type_enabled((os_log_t)v5, OS_LOG_TYPE_DEFAULT))
    {
LABEL_5:

      os_unfair_lock_unlock(p_itemsLock);
      return;
    }

    *(_WORD *)__int128 buf = 0;
    BOOL v6 = "Currently processing a map lookup request pending. The next request will process when the current one completes.";
LABEL_4:
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)v5, OS_LOG_TYPE_DEFAULT, v6, buf, 2u);
    goto LABEL_5;
  }

  uint64_t v7 = objc_claimAutoreleasedReturnValue(-[NSMutableArray firstObject](self->_merchantCleanupItems, "firstObject"));
  if (!v7)
  {
    uint64_t v25 = PKLogFacilityTypeGetObject(6LL);
    BOOL v5 = (void *)objc_claimAutoreleasedReturnValue(v25);
    if (!os_log_type_enabled((os_log_t)v5, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_5;
    }
    *(_WORD *)__int128 buf = 0;
    BOOL v6 = "No items for a maps lookup request";
    goto LABEL_4;
  }

  unsigned int v8 = (void *)v7;
  self->_processingMerchantCleanupItems = 1;
  os_unfair_lock_unlock(p_itemsLock);
  unsigned int v9 = (void *)objc_claimAutoreleasedReturnValue([v8 paymentTransaction]);
  unsigned int v10 = (void *)objc_claimAutoreleasedReturnValue([v8 transactionSourceIdentifier]);
  id v11 = [v8 isClearingAttempt];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
  unsigned int v13 = (void *)objc_claimAutoreleasedReturnValue([WeakRetained paymentApplicationForTransactionSource:v10]);

  id v14 = [[PKTransactionMerchantLookupSource alloc] initWithTransaction:v9 paymentApplication:v13];
  [v14 setClearingAttempt:v11];
  id v15 = [[PKMerchantLookupRequest alloc] initWithSource:v14];
  uint64_t v16 = PKLogFacilityTypeGetObject(6LL);
  unsigned __int8 v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)__int128 buf = 138412546;
    id v33 = v9;
    __int16 v34 = 2112;
    id v35 = v13;
    _os_log_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_DEFAULT,  "Processing Transaction For Merchant Cleanup: %@, Payment Application: %@",  buf,  0x16u);
  }

  uint64_t v18 = PKGreenTeaLogger();
  uint64_t CTGreenTeaOsLogHandle = getCTGreenTeaOsLogHandle(v18);
  id v20 = (os_log_s *)objc_claimAutoreleasedReturnValue(CTGreenTeaOsLogHandle);
  __int128 v21 = v20;
  if (v20 && os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)__int128 buf = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v21,  OS_LOG_TYPE_INFO,  "Transmitting transaction location for maps local search",  buf,  2u);
  }

  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)__int128 buf = 138412290;
    id v33 = v15;
    _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "Starting maps lookup request: %@", buf, 0xCu);
  }

  v26[0] = _NSConcreteStackBlock;
  v26[1] = 3221225472LL;
  v26[2] = sub_1004136F4;
  v26[3] = &unk_10065EDF8;
  id v27 = v15;
  id v28 = self;
  char v31 = (char)v11;
  id v29 = v8;
  id v30 = v10;
  id v22 = v10;
  id v23 = v8;
  id v24 = v15;
  [v24 startLookupWithCompletion:v26];
}

- (void)_processForLocalMCCLookup:(id)a3
{
  id v4 = a3;
  id v10 = v4;
  if (!self->_categoryCodeMap)
  {
    BOOL v5 = objc_alloc_init(&OBJC_CLASS___PKMerchantCategoryCodeMap);
    categoryCodeMap = self->_categoryCodeMap;
    self->_categoryCodeMap = v5;

    id v4 = v10;
  }

  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([v4 paymentTransaction]);
  unsigned int v8 = (void *)objc_claimAutoreleasedReturnValue([v7 merchant]);

  uint64_t v9 = (uint64_t)[v8 industryCode];
  if (v9 >= 1) {
    objc_msgSend( v8,  "setFallbackcategory:",  -[PKMerchantCategoryCodeMap categoryForIndustryCode:](self->_categoryCodeMap, "categoryForIndustryCode:", v9));
  }
}

- (id)_pendingLocationUpdateItemForTransaction:(id)a3
{
  id v4 = a3;
  uint64_t v18 = 0LL;
  char v19 = &v18;
  uint64_t v20 = 0x3032000000LL;
  __int128 v21 = sub_100411724;
  id v22 = sub_100411734;
  id v23 = 0LL;
  p_itemsLock = &self->_itemsLock;
  os_unfair_lock_lock(&self->_itemsLock);
  locationUpdateItems = self->_locationUpdateItems;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472LL;
  v15[2] = sub_100413DCC;
  v15[3] = &unk_10065EE20;
  id v7 = v4;
  id v16 = v7;
  unsigned __int8 v17 = &v18;
  -[NSMutableSet enumerateObjectsUsingBlock:](locationUpdateItems, "enumerateObjectsUsingBlock:", v15);
  backgroundLocationUpdateItems = self->_backgroundLocationUpdateItems;
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472LL;
  v12[2] = sub_100413F00;
  v12[3] = &unk_10065EE20;
  id v9 = v7;
  id v13 = v9;
  id v14 = &v18;
  -[NSMutableSet enumerateObjectsUsingBlock:](backgroundLocationUpdateItems, "enumerateObjectsUsingBlock:", v12);
  os_unfair_lock_unlock(p_itemsLock);
  id v10 = (id)v19[5];

  _Block_object_dispose(&v18, 8);
  return v10;
}

- (id)_pendingStationsUpdateItemForTransaction:(id)a3
{
  id v4 = a3;
  uint64_t v13 = 0LL;
  id v14 = &v13;
  uint64_t v15 = 0x3032000000LL;
  id v16 = sub_100411724;
  unsigned __int8 v17 = sub_100411734;
  id v18 = 0LL;
  p_itemsLock = &self->_itemsLock;
  os_unfair_lock_lock(&self->_itemsLock);
  stationsUpdateItems = self->_stationsUpdateItems;
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472LL;
  v10[2] = sub_100414144;
  v10[3] = &unk_10065EE20;
  id v7 = v4;
  id v11 = v7;
  unint64_t v12 = &v13;
  -[NSMutableSet enumerateObjectsUsingBlock:](stationsUpdateItems, "enumerateObjectsUsingBlock:", v10);
  os_unfair_lock_unlock(p_itemsLock);
  id v8 = (id)v14[5];

  _Block_object_dispose(&v13, 8);
  return v8;
}

- (id)_pendingMerchantCleanupItemForTransaction:(id)a3
{
  id v4 = a3;
  uint64_t v13 = 0LL;
  id v14 = &v13;
  uint64_t v15 = 0x3032000000LL;
  id v16 = sub_100411724;
  unsigned __int8 v17 = sub_100411734;
  id v18 = 0LL;
  p_itemsLock = &self->_itemsLock;
  os_unfair_lock_lock(&self->_itemsLock);
  merchantCleanupItems = self->_merchantCleanupItems;
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472LL;
  v10[2] = sub_100414388;
  v10[3] = &unk_10065EE48;
  id v7 = v4;
  id v11 = v7;
  unint64_t v12 = &v13;
  -[NSMutableArray enumerateObjectsUsingBlock:](merchantCleanupItems, "enumerateObjectsUsingBlock:", v10);
  os_unfair_lock_unlock(p_itemsLock);
  id v8 = (id)v14[5];

  _Block_object_dispose(&v13, 8);
  return v8;
}

- (BOOL)isActive
{
  return self->_active;
}

- (PDPaymentTransactionProcessorDataSource)dataSource
{
  return (PDPaymentTransactionProcessorDataSource *)objc_loadWeakRetained((id *)&self->_dataSource);
}

- (void)setDataSource:(id)a3
{
}

- (PKUsageNotificationServer)usageNotificationServer
{
  return (PKUsageNotificationServer *)objc_loadWeakRetained((id *)&self->_usageNotificationServer);
}

- (void)setUsageNotificationServer:(id)a3
{
}

- (void).cxx_destruct
{
}

@end