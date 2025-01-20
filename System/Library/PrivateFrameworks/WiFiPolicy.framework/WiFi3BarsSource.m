@interface WiFi3BarsSource
- (NSMutableDictionary)networks;
- (NSURL)storeURL;
- (OS_dispatch_queue)queue;
- (TBDataSourceMediator)sourceMediator;
- (WiFi3BarsSource)initWithChangeHandler:(id)a3 localStoreType:(unint64_t)a4;
- (WiFi3BarsTileFetcher)tileFetcher;
- (id)_descriptorForType:(unint64_t)a3;
- (id)_matchSearchBSSIDs:(id)a3 toResponse:(id)a4;
- (id)changeHandler;
- (id)relevancyHandler;
- (id)relevantNetworks;
- (unint64_t)cacheExpirationInDays;
- (void)_handleRemoteFetchResponse:(id)a3;
- (void)fetch3BarsNetworksFor:(id)a3;
- (void)fetch3BarsNetworksForLocation:(id)a3 forceRemote:(BOOL)a4 trigger:(unint64_t)a5 completionHandler:(id)a6;
- (void)fetch3BarsNetworksPredictedForLocation:(id)a3 duration:(double)a4 maxLocations:(unint64_t)a5 completionHandler:(id)a6;
- (void)fetchCandidateNetworksMatchingBSSIDs:(id)a3 completionHandler:(id)a4;
- (void)forceFetch3BarsNetworkMatchingBSSID:(id)a3 completionHandler:(id)a4;
- (void)prune3BarsNetworks:(unint64_t)a3 completionHandler:(id)a4;
- (void)setCacheExpirationInDays:(unint64_t)a3;
- (void)setChangeHandler:(id)a3;
- (void)setNetworks:(id)a3;
- (void)setQueue:(id)a3;
- (void)setRelevancyHandler:(id)a3;
- (void)setSourceMediator:(id)a3;
- (void)setStoreURL:(id)a3;
- (void)setTileFetcher:(id)a3;
- (void)submitCacheAnalyticsEvent;
@end

@implementation WiFi3BarsSource

- (WiFi3BarsSource)initWithChangeHandler:(id)a3 localStoreType:(unint64_t)a4
{
  uint64_t v31 = *MEMORY[0x1895F89C0];
  id v6 = a3;
  v26.receiver = self;
  v26.super_class = (Class)&OBJC_CLASS___WiFi3BarsSource;
  v7 = -[WiFi3BarsSource init](&v26, sel_init);
  if (!v7) {
    goto LABEL_17;
  }
  if (v6)
  {
    uint64_t v8 = MEMORY[0x1895BA9F4](v6);
    id changeHandler = v7->changeHandler;
    v7->id changeHandler = (id)v8;
  }

  dispatch_queue_t v10 = dispatch_queue_create("com.apple.wifi.3bars-source", MEMORY[0x1895F8AF8]);
  queue = v7->_queue;
  v7->_queue = (OS_dispatch_queue *)v10;

  if (!v7->_queue) {
    goto LABEL_17;
  }
  v12 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x189603FC8]);
  networks = v7->_networks;
  v7->_networks = v12;

  if (!v7->_networks) {
    goto LABEL_17;
  }
  v14 = -[WiFi3BarsSource _descriptorForType:](v7, "_descriptorForType:", a4);
  if (!v14)
  {
    if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v28 = "-[WiFi3BarsSource initWithChangeHandler:localStoreType:]";
      _os_log_impl(&dword_187EBF000, MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEFAULT, "%s: store descriptor is nil", buf, 0xCu);
    }

- (void)fetch3BarsNetworksFor:(id)a3
{
}

- (void)fetch3BarsNetworksForLocation:(id)a3 forceRemote:(BOOL)a4 trigger:(unint64_t)a5 completionHandler:(id)a6
{
  BOOL v8 = a4;
  uint64_t v39 = *MEMORY[0x1895F89C0];
  id v10 = a3;
  id v11 = a6;
  if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v38 = "-[WiFi3BarsSource fetch3BarsNetworksForLocation:forceRemote:trigger:completionHandler:]";
    _os_log_impl(&dword_187EBF000, MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEFAULT, "%s", buf, 0xCu);
  }

  [MEMORY[0x189603F50] date];
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "dateByAddingDays:", --[WiFi3BarsSource cacheExpirationInDays](self, "cacheExpirationInDays"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = objc_alloc(&OBJC_CLASS___TBLocationFetchRequestDescriptor);
  [v10 coordinate];
  double v16 = v15;
  [v10 coordinate];
  double v18 = v17;
  if (a5 == 1)
  {
    +[TBDefaults nearbyTileSearchRadius](&OBJC_CLASS___TBDefaults, "nearbyTileSearchRadius");
    uint64_t v20 = -[TBLocationFetchRequestDescriptor initWithLatitude:longitude:radius:maxCacheAge:]( v14,  "initWithLatitude:longitude:radius:maxCacheAge:",  v13,  v16,  v18,  v19);
  }

  else
  {
    uint64_t v20 = -[TBLocationFetchRequestDescriptor initWithLatitude:longitude:maxCacheAge:]( v14,  "initWithLatitude:longitude:maxCacheAge:",  v13,  v16,  v17);
  }

  v21 = (void *)v20;
  if (v8) {
    uint64_t v22 = 2LL;
  }
  else {
    uint64_t v22 = 3LL;
  }
  v23 = +[TBLocationFetchRequest fetchRequestWithDescriptor:sourcePolicy:cacheable:]( &OBJC_CLASS___TBLocationFetchRequest,  "fetchRequestWithDescriptor:sourcePolicy:cacheable:",  v20,  v22,  1LL);
  v35[0] = @"trigger";
  [MEMORY[0x189607968] numberWithUnsignedInteger:a5];
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v35[1] = @"tileKey";
  v36[0] = v24;
  objc_msgSend(MEMORY[0x189607968], "numberWithUnsignedLongLong:", objc_msgSend(v21, "primaryTileKey"));
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v36[1] = v25;
  [MEMORY[0x189603F68] dictionaryWithObjects:v36 forKeys:v35 count:2];
  objc_super v26 = (void *)objc_claimAutoreleasedReturnValue();
  [v23 setUserInfo:v26];

  uint64_t v29 = MEMORY[0x1895F87A8];
  uint64_t v30 = 3221225472LL;
  uint64_t v31 = __87__WiFi3BarsSource_fetch3BarsNetworksForLocation_forceRemote_trigger_completionHandler___block_invoke;
  v32 = &unk_18A16E7F8;
  v33 = self;
  id v34 = v11;
  id v27 = v11;
  [v23 setResultsHandler:&v29];
  v28 = -[WiFi3BarsSource sourceMediator](self, "sourceMediator", v29, v30, v31, v32, v33);
  [v28 executeFetchRequest:v23];
}

void __87__WiFi3BarsSource_fetch3BarsNetworksForLocation_forceRemote_trigger_completionHandler___block_invoke( uint64_t a1,  void *a2,  void *a3,  int a4)
{
  id v10 = a2;
  id v7 = a3;
  BOOL v8 = v7;
  if (v7) {
    (*((void (**)(id))v7 + 2))(v7);
  }
  [*(id *)(a1 + 32) _handleRemoteFetchResponse:v10];
  if (a4)
  {
    uint64_t v9 = *(void *)(a1 + 40);
    if (v9) {
      (*(void (**)(uint64_t, id))(v9 + 16))(v9, v10);
    }
  }
}

- (void)_handleRemoteFetchResponse:(id)a3
{
  uint64_t v16 = *MEMORY[0x1895F89C0];
  id v3 = a3;
  [v3 error];
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
  {
    [v3 tiles];
    id v7 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v8 = [v7 count];

    BOOL v9 = os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEFAULT);
    if (v8)
    {
      if (!v9) {
        goto LABEL_11;
      }
      [v3 tiles];
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      int v12 = 136315394;
      v13 = "-[WiFi3BarsSource _handleRemoteFetchResponse:]";
      __int16 v14 = 2048;
      uint64_t v15 = [v5 count];
      id v10 = (os_log_s *)MEMORY[0x1895F8DA0];
      id v11 = "%s: Fetched %lu tiles";
    }

    else
    {
      if (!v9) {
        goto LABEL_11;
      }
      [v3 results];
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      int v12 = 136315394;
      v13 = "-[WiFi3BarsSource _handleRemoteFetchResponse:]";
      __int16 v14 = 2048;
      uint64_t v15 = [v5 count];
      id v10 = (os_log_s *)MEMORY[0x1895F8DA0];
      id v11 = "%s: Fetched %lu results";
    }

    _os_log_impl(&dword_187EBF000, v10, OS_LOG_TYPE_DEFAULT, v11, (uint8_t *)&v12, 0x16u);
    goto LABEL_10;
  }

  if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEFAULT))
  {
    [v3 error];
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    id v6 = [v5 description];
    int v12 = 136315394;
    v13 = "-[WiFi3BarsSource _handleRemoteFetchResponse:]";
    __int16 v14 = 2080;
    uint64_t v15 = [v6 UTF8String];
    _os_log_impl( &dword_187EBF000,  MEMORY[0x1895F8DA0],  OS_LOG_TYPE_DEFAULT,  "%s: Failed fetch with error %s\n",  (uint8_t *)&v12,  0x16u);

LABEL_10:
  }

- (void)fetch3BarsNetworksPredictedForLocation:(id)a3 duration:(double)a4 maxLocations:(unint64_t)a5 completionHandler:(id)a6
{
  id v10 = a3;
  id v11 = a6;
  -[WiFi3BarsSource queue](self, "queue");
  int v12 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = __98__WiFi3BarsSource_fetch3BarsNetworksPredictedForLocation_duration_maxLocations_completionHandler___block_invoke;
  block[3] = &unk_18A16E870;
  block[4] = self;
  id v16 = v10;
  double v19 = a4;
  id v17 = v11;
  unint64_t v18 = a5;
  id v13 = v11;
  id v14 = v10;
  dispatch_async(v12, block);
}

void __98__WiFi3BarsSource_fetch3BarsNetworksPredictedForLocation_duration_maxLocations_completionHandler___block_invoke( uint64_t a1)
{
  v2 = dispatch_group_create();
  objc_initWeak(&location, *(id *)(a1 + 32));
  dispatch_group_enter(v2);
  uint64_t v3 = MEMORY[0x1895F87A8];
  v17[0] = MEMORY[0x1895F87A8];
  v17[1] = 3221225472LL;
  v17[2] = __98__WiFi3BarsSource_fetch3BarsNetworksPredictedForLocation_duration_maxLocations_completionHandler___block_invoke_2;
  v17[3] = &unk_18A16E848;
  v19[1] = *(id *)(a1 + 56);
  v4 = v2;
  unint64_t v18 = v4;
  objc_copyWeak(v19, &location);
  v5 = (void *)MEMORY[0x1895BA9F4](v17);
  [MEMORY[0x18960DB18] defaultManager];
  id v6 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v7 = *(void *)(a1 + 40);
  [MEMORY[0x189603F50] date];
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
  [v6 fetchNextPredictedLocationsOfInterestFromLocation:v7 startDate:v8 timeInterval:v5 withHandler:*(double *)(a1 + 64)];

  if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_187EBF000, MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEFAULT, "Querying current location", buf, 2u);
  }

  dispatch_group_enter(v4);
  id v9 = objc_loadWeakRetained(&location);
  uint64_t v10 = *(void *)(a1 + 40);
  v14[0] = v3;
  v14[1] = 3221225472LL;
  v14[2] = __98__WiFi3BarsSource_fetch3BarsNetworksPredictedForLocation_duration_maxLocations_completionHandler___block_invoke_18;
  v14[3] = &unk_18A16E820;
  id v11 = v4;
  uint64_t v15 = v11;
  [v9 fetch3BarsNetworksForLocation:v10 forceRemote:0 trigger:2 completionHandler:v14];

  dispatch_time_t v12 = dispatch_time(0LL, 3600000000000LL);
  dispatch_group_wait(v11, v12);
  uint64_t v13 = *(void *)(a1 + 48);
  if (v13) {
    (*(void (**)(void))(v13 + 16))();
  }

  objc_destroyWeak(v19);
  objc_destroyWeak(&location);
}

void __98__WiFi3BarsSource_fetch3BarsNetworksPredictedForLocation_duration_maxLocations_completionHandler___block_invoke_2( uint64_t a1,  void *a2,  void *a3)
{
  uint64_t v37 = *MEMORY[0x1895F89C0];
  id v5 = a2;
  id v6 = a3;
  uint64_t v26 = [v5 count];
  if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    v35[0] = v26;
    _os_log_impl( &dword_187EBF000,  MEMORY[0x1895F8DA0],  OS_LOG_TYPE_DEFAULT,  "[predictedLocationsOfInterest count] <%ld>",  buf,  0xCu);
  }

  if (!v6 && v26)
  {
    id v25 = v5;
    __int128 v32 = 0u;
    __int128 v33 = 0u;
    __int128 v30 = 0u;
    __int128 v31 = 0u;
    id v7 = v5;
    uint64_t v8 = [v7 countByEnumeratingWithState:&v30 objects:v36 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      unint64_t v10 = 0LL;
      uint64_t v11 = *(void *)v31;
      id v27 = v7;
      do
      {
        for (uint64_t i = 0LL; i != v9; ++i)
        {
          if (*(void *)v31 != v11) {
            objc_enumerationMutation(v7);
          }
          uint64_t v13 = *(void **)(*((void *)&v30 + 1) + 8 * i);
          id v14 = (void *)MEMORY[0x1895BA820]();
          if (v10 < *(void *)(a1 + 48))
          {
            [v13 confidence];
            if (v15 >= 0.5)
            {
              dispatch_group_enter(*(dispatch_group_t *)(a1 + 32));
              [v13 locationOfInterest];
              id v16 = (void *)objc_claimAutoreleasedReturnValue();
              id v17 = objc_alloc(MEMORY[0x1896056D8]);
              [v16 location];
              unint64_t v18 = (void *)objc_claimAutoreleasedReturnValue();
              [v18 latitude];
              double v20 = v19;
              [v16 location];
              v21 = (void *)objc_claimAutoreleasedReturnValue();
              [v21 longitude];
              v23 = (void *)[v17 initWithLatitude:v20 longitude:v22];

              if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 67109376;
                LODWORD(v35[0]) = v10 + 1;
                WORD2(v35[0]) = 2048;
                *(void *)((char *)v35 + 6) = v26;
                _os_log_impl( &dword_187EBF000,  MEMORY[0x1895F8DA0],  OS_LOG_TYPE_DEFAULT,  "Querying predicted location %d/%ld",  buf,  0x12u);
              }

              id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
              v28[0] = MEMORY[0x1895F87A8];
              v28[1] = 3221225472LL;
              v28[2] = __98__WiFi3BarsSource_fetch3BarsNetworksPredictedForLocation_duration_maxLocations_completionHandler___block_invoke_14;
              v28[3] = &unk_18A16E820;
              id v29 = *(id *)(a1 + 32);
              [WeakRetained fetch3BarsNetworksForLocation:v23 forceRemote:0 trigger:3 completionHandler:v28];

              ++v10;
              id v7 = v27;
            }
          }

          objc_autoreleasePoolPop(v14);
        }

        uint64_t v9 = [v7 countByEnumeratingWithState:&v30 objects:v36 count:16];
      }

      while (v9);
    }

    id v6 = 0LL;
    id v5 = v25;
  }

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void __98__WiFi3BarsSource_fetch3BarsNetworksPredictedForLocation_duration_maxLocations_completionHandler___block_invoke_14( uint64_t a1)
{
}

void __98__WiFi3BarsSource_fetch3BarsNetworksPredictedForLocation_duration_maxLocations_completionHandler___block_invoke_18( uint64_t a1)
{
}

- (void)prune3BarsNetworks:(unint64_t)a3 completionHandler:(id)a4
{
  id v6 = a4;
  -[WiFi3BarsSource sourceMediator](self, "sourceMediator");
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  [v7 prune3BarsNetworks:a3 completionHandler:v6];
}

- (void)fetchCandidateNetworksMatchingBSSIDs:(id)a3 completionHandler:(id)a4
{
  uint64_t v25 = *MEMORY[0x1895F89C0];
  id v6 = a3;
  id v7 = a4;
  if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    *(void *)&uint8_t buf[4] = "-[WiFi3BarsSource fetchCandidateNetworksMatchingBSSIDs:completionHandler:]";
    *(_WORD *)&buf[12] = 2048;
    *(void *)&buf[14] = [v6 count];
    _os_log_impl( &dword_187EBF000,  MEMORY[0x1895F8DA0],  OS_LOG_TYPE_DEFAULT,  "%s: fetching candidates for %lu BSSIDS",  buf,  0x16u);
  }

  *(void *)buf = 0LL;
  *(void *)&buf[8] = buf;
  *(void *)&uint8_t buf[16] = 0x3032000000LL;
  double v22 = __Block_byref_object_copy__8;
  v23 = __Block_byref_object_dispose__8;
  id v24 = (id)os_transaction_create();
  uint64_t v8 = -[TBNetworkFetchRequestDescriptor initWithBSSIDs:]( objc_alloc(&OBJC_CLASS___TBNetworkFetchRequestDescriptor),  "initWithBSSIDs:",  v6);
  +[TBNetworkFetchRequest fetchRequestWithDescriptor:sourcePolicy:]( &OBJC_CLASS___TBNetworkFetchRequest,  "fetchRequestWithDescriptor:sourcePolicy:",  v8,  1LL);
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue();
  [v9 setUserInfo:&unk_18A1B5AD8];
  uint64_t v13 = MEMORY[0x1895F87A8];
  uint64_t v14 = 3221225472LL;
  double v15 = __74__WiFi3BarsSource_fetchCandidateNetworksMatchingBSSIDs_completionHandler___block_invoke;
  id v16 = &unk_18A16E898;
  id v17 = self;
  id v10 = v6;
  id v18 = v10;
  id v11 = v7;
  id v19 = v11;
  double v20 = buf;
  [v9 setResultsHandler:&v13];
  -[WiFi3BarsSource sourceMediator](self, "sourceMediator", v13, v14, v15, v16, v17);
  dispatch_time_t v12 = (void *)objc_claimAutoreleasedReturnValue();
  [v12 executeFetchRequest:v9];

  _Block_object_dispose(buf, 8);
}

void __74__WiFi3BarsSource_fetchCandidateNetworksMatchingBSSIDs_completionHandler___block_invoke( uint64_t a1,  void *a2)
{
  uint64_t v15 = *MEMORY[0x1895F89C0];
  id v3 = a2;
  [v3 error];
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEFAULT))
    {
      [v3 error];
      id v5 = (void *)objc_claimAutoreleasedReturnValue();
      int v11 = 136315394;
      dispatch_time_t v12 = "-[WiFi3BarsSource fetchCandidateNetworksMatchingBSSIDs:completionHandler:]_block_invoke";
      __int16 v13 = 2112;
      uint64_t v14 = v5;
      _os_log_impl( &dword_187EBF000,  MEMORY[0x1895F8DA0],  OS_LOG_TYPE_DEFAULT,  "%s: fetch error %@",  (uint8_t *)&v11,  0x16u);
    }

    id v6 = 0LL;
  }

  else
  {
    [*(id *)(a1 + 32) _matchSearchBSSIDs:*(void *)(a1 + 40) toResponse:v3];
    id v6 = (void *)objc_claimAutoreleasedReturnValue();
  }

  uint64_t v7 = *(void *)(a1 + 48);
  [v3 error];
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, void *, void *))(v7 + 16))(v7, v6, v8);

  uint64_t v9 = *(void *)(*(void *)(a1 + 56) + 8LL);
  id v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = 0LL;
}

- (id)_matchSearchBSSIDs:(id)a3 toResponse:(id)a4
{
  uint64_t v57 = *MEMORY[0x1895F89C0];
  id v5 = a3;
  id v6 = a4;
  id v29 = objc_alloc_init(MEMORY[0x189603FC8]);
  if ((objc_opt_respondsToSelector() & 1) == 0
    || ([v6 resultsByBSSID],
        uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(),
        uint64_t v8 = [v7 count],
        v7,
        !v8))
  {
    __int128 v50 = 0u;
    __int128 v51 = 0u;
    __int128 v48 = 0u;
    __int128 v49 = 0u;
    id v28 = v5;
    obuint64_t j = v5;
    uint64_t v34 = [obj countByEnumeratingWithState:&v48 objects:v56 count:16];
    if (!v34) {
      goto LABEL_33;
    }
    id v31 = v6;
    uint64_t v32 = *(void *)v49;
    while (1)
    {
      for (uint64_t i = 0LL; i != v34; ++i)
      {
        if (*(void *)v49 != v32) {
          objc_enumerationMutation(obj);
        }
        int v11 = *(void **)(*((void *)&v48 + 1) + 8 * i);
        objc_msgSend(v11, "reformatBSSID", v28);
        dispatch_time_t v12 = (void *)objc_claimAutoreleasedReturnValue();
        __int128 v44 = 0u;
        __int128 v45 = 0u;
        __int128 v46 = 0u;
        __int128 v47 = 0u;
        [v6 results];
        __int16 v13 = (WiFi3BarsNetwork *)objc_claimAutoreleasedReturnValue();
        uint64_t v38 = -[WiFi3BarsNetwork countByEnumeratingWithState:objects:count:]( v13,  "countByEnumeratingWithState:objects:count:",  &v44,  v55,  16LL);
        if (!v38)
        {
          uint64_t v26 = 0LL;
          goto LABEL_29;
        }

        __int128 v33 = v11;
        uint64_t v35 = i;
        v36 = v13;
        uint64_t v39 = 0LL;
        uint64_t v37 = *(void *)v45;
        do
        {
          for (uint64_t j = 0LL; j != v38; ++j)
          {
            if (*(void *)v45 != v37) {
              objc_enumerationMutation(v36);
            }
            uint64_t v15 = *(void **)(*((void *)&v44 + 1) + 8 * j);
            __int128 v40 = 0u;
            __int128 v41 = 0u;
            __int128 v42 = 0u;
            __int128 v43 = 0u;
            [v15 accessPoints];
            id v16 = (void *)objc_claimAutoreleasedReturnValue();
            uint64_t v17 = [v16 countByEnumeratingWithState:&v40 objects:v54 count:16];
            if (v17)
            {
              uint64_t v18 = v17;
              uint64_t v19 = *(void *)v41;
              while (2)
              {
                for (uint64_t k = 0LL; k != v18; ++k)
                {
                  if (*(void *)v41 != v19) {
                    objc_enumerationMutation(v16);
                  }
                  v21 = *(void **)(*((void *)&v40 + 1) + 8 * k);
                  double v22 = (void *)MEMORY[0x1895BA820]();
                  [v21 BSSID];
                  v23 = (void *)objc_claimAutoreleasedReturnValue();
                  int v24 = [v23 isEqualToString:v12];

                  if (v24)
                  {
                    id v25 = v15;

                    objc_autoreleasePoolPop(v22);
                    uint64_t v39 = v25;
                    goto LABEL_24;
                  }

                  objc_autoreleasePoolPop(v22);
                }

                uint64_t v18 = [v16 countByEnumeratingWithState:&v40 objects:v54 count:16];
                if (v18) {
                  continue;
                }
                break;
              }
            }

void __49__WiFi3BarsSource__matchSearchBSSIDs_toResponse___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  id v6 = a2;
  uint64_t v7 = -[WiFi3BarsNetwork initWithNetwork:](objc_alloc(&OBJC_CLASS___WiFi3BarsNetwork), "initWithNetwork:", v5);

  [*(id *)(a1 + 32) setObject:v7 forKey:v6];
}

- (void)forceFetch3BarsNetworkMatchingBSSID:(id)a3 completionHandler:(id)a4
{
  uint64_t v25 = *MEMORY[0x1895F89C0];
  id v6 = a3;
  id v7 = a4;
  if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315650;
    double v20 = "-[WiFi3BarsSource forceFetch3BarsNetworkMatchingBSSID:completionHandler:]";
    __int16 v21 = 2160;
    uint64_t v22 = 1752392040LL;
    __int16 v23 = 2112;
    id v24 = v6;
    _os_log_impl( &dword_187EBF000,  MEMORY[0x1895F8DA0],  OS_LOG_TYPE_DEFAULT,  "%s: fetching 3bars network for %{mask.hash}@",  buf,  0x20u);
  }

  objc_msgSend(MEMORY[0x189604010], "setWithObjects:", v6, 0);
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
  [MEMORY[0x189603F50] date];
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "dateByAddingDays:", --[WiFi3BarsSource cacheExpirationInDays](self, "cacheExpirationInDays"));
  id v10 = (void *)objc_claimAutoreleasedReturnValue();

  int v11 = -[TBNetworkFetchRequestDescriptor initWithBSSIDs:maxCacheAge:]( objc_alloc(&OBJC_CLASS___TBNetworkFetchRequestDescriptor),  "initWithBSSIDs:maxCacheAge:",  v8,  v10);
  +[TBNetworkFetchRequest fetchRequestWithDescriptor:sourcePolicy:cacheable:]( &OBJC_CLASS___TBNetworkFetchRequest,  "fetchRequestWithDescriptor:sourcePolicy:cacheable:",  v11,  3LL,  1LL);
  dispatch_time_t v12 = (void *)objc_claimAutoreleasedReturnValue();
  [v12 setUserInfo:&unk_18A1B5B00];
  v16[0] = MEMORY[0x1895F87A8];
  v16[1] = 3221225472LL;
  v16[2] = __73__WiFi3BarsSource_forceFetch3BarsNetworkMatchingBSSID_completionHandler___block_invoke;
  v16[3] = &unk_18A16E8E8;
  v16[4] = self;
  id v17 = v8;
  id v18 = v7;
  id v13 = v7;
  id v14 = v8;
  [v12 setResultsHandler:v16];
  -[WiFi3BarsSource sourceMediator](self, "sourceMediator");
  uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue();
  [v15 executeFetchRequest:v12];
}

void __73__WiFi3BarsSource_forceFetch3BarsNetworkMatchingBSSID_completionHandler___block_invoke( uint64_t a1,  void *a2)
{
  uint64_t v14 = *MEMORY[0x1895F89C0];
  id v3 = a2;
  v4 = (void *)objc_opt_new();
  [v3 error];
  id v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEFAULT))
    {
      [v3 error];
      id v6 = (void *)objc_claimAutoreleasedReturnValue();
      int v10 = 136315394;
      int v11 = "-[WiFi3BarsSource forceFetch3BarsNetworkMatchingBSSID:completionHandler:]_block_invoke";
      __int16 v12 = 2112;
      id v13 = v6;
      _os_log_impl( &dword_187EBF000,  MEMORY[0x1895F8DA0],  OS_LOG_TYPE_DEFAULT,  "%s: fetch error %@",  (uint8_t *)&v10,  0x16u);
    }

    id v7 = 0LL;
  }

  else
  {
    [*(id *)(a1 + 32) _matchSearchBSSIDs:*(void *)(a1 + 40) toResponse:v3];
    id v7 = (void *)objc_claimAutoreleasedReturnValue();
  }

  [v4 setResults:v7];
  uint64_t v8 = *(void *)(a1 + 48);
  if (v8)
  {
    [v3 error];
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *, void *))(v8 + 16))(v8, v4, v9);
  }
}

- (id)relevantNetworks
{
  return 0LL;
}

- (void)submitCacheAnalyticsEvent
{
  uint64_t v24 = *MEMORY[0x1895F89C0];
  v2 = -[WiFi3BarsSource sourceMediator](self, "sourceMediator");
  [v2 local];
  id v3 = (void *)objc_claimAutoreleasedReturnValue();
  [v3 context];
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    +[TBTileMO fetchRequest](&OBJC_CLASS___TBTileMO, "fetchRequest");
    id v5 = (void *)objc_claimAutoreleasedReturnValue();
    [v5 setIncludesSubentities:0];
    +[TBTileMO fetchRequest](&OBJC_CLASS___TBTileMO, "fetchRequest");
    id v6 = (void *)objc_claimAutoreleasedReturnValue();
    [v6 setIncludesSubentities:0];
    [MEMORY[0x189603F50] date];
    id v7 = (void *)objc_claimAutoreleasedReturnValue();
    [v7 dateByAddingDays:-1];
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();

    [MEMORY[0x1896079C8] predicateWithFormat:@"created > %@", v8];
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue();
    [v6 setPredicate:v9];

    id v17 = 0LL;
    uint64_t v10 = [v4 countForFetchRequest:v5 error:&v17];
    id v11 = v17;
    if (v10 == 0x7FFFFFFFFFFFFFFFLL)
    {
      if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315394;
        uint64_t v19 = "-[WiFi3BarsSource submitCacheAnalyticsEvent]";
        __int16 v20 = 2112;
        uint64_t v21 = (uint64_t)v11;
        _os_log_impl( &dword_187EBF000,  MEMORY[0x1895F8DA0],  OS_LOG_TYPE_DEFAULT,  "%s: error fetching all tiles %@",  buf,  0x16u);
      }
    }

    else
    {
      id v16 = 0LL;
      uint64_t v12 = [v4 countForFetchRequest:v6 error:&v16];
      id v13 = v16;
      BOOL v14 = os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEFAULT);
      if (v12 == 0x7FFFFFFFFFFFFFFFLL)
      {
        if (v14)
        {
          *(_DWORD *)buf = 136315394;
          uint64_t v19 = "-[WiFi3BarsSource submitCacheAnalyticsEvent]";
          __int16 v20 = 2112;
          uint64_t v21 = (uint64_t)v11;
          _os_log_impl( &dword_187EBF000,  MEMORY[0x1895F8DA0],  OS_LOG_TYPE_DEFAULT,  "%s: error fetching last day tiles %@",  buf,  0x16u);
        }
      }

      else
      {
        if (v14)
        {
          *(_DWORD *)buf = 136315650;
          uint64_t v19 = "-[WiFi3BarsSource submitCacheAnalyticsEvent]";
          __int16 v20 = 2048;
          uint64_t v21 = v10;
          __int16 v22 = 2048;
          uint64_t v23 = v12;
          _os_log_impl( &dword_187EBF000,  MEMORY[0x1895F8DA0],  OS_LOG_TYPE_DEFAULT,  "%s: allCount: %lu lastDayCount: %lu",  buf,  0x20u);
        }

        +[TBCacheAnalyticsEvent cacheEventWithTotalCount:last24HoursCount:]( &OBJC_CLASS___TBCacheAnalyticsEvent,  "cacheEventWithTotalCount:last24HoursCount:",  v10,  v12);
        uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue();
        +[TBAnalytics captureEvent:](&OBJC_CLASS___TBAnalytics, "captureEvent:", v15);
      }
    }
  }

  else if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    uint64_t v19 = "-[WiFi3BarsSource submitCacheAnalyticsEvent]";
    _os_log_impl(&dword_187EBF000, MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEFAULT, "%s: unable to get moc", buf, 0xCu);
  }
}

- (void)setCacheExpirationInDays:(unint64_t)a3
{
  uint64_t v11 = *MEMORY[0x1895F89C0];
  if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 136315394;
    uint64_t v8 = "-[WiFi3BarsSource setCacheExpirationInDays:]";
    __int16 v9 = 2048;
    unint64_t v10 = a3;
    _os_log_impl( &dword_187EBF000,  MEMORY[0x1895F8DA0],  OS_LOG_TYPE_DEFAULT,  "%s: setting new cache expiration %lu",  (uint8_t *)&v7,  0x16u);
  }

  self->_cacheExpirationInDays = a3;
  -[WiFi3BarsSource sourceMediator](self, "sourceMediator");
  id v5 = (void *)objc_claimAutoreleasedReturnValue();
  [v5 local];
  id v6 = (void *)objc_claimAutoreleasedReturnValue();
  [v6 setCacheExpirationInDays:a3];
}

- (id)_descriptorForType:(unint64_t)a3
{
  switch(a3)
  {
    case 0uLL:
      +[TBCoreDataStoreDescriptor serverStoreDescriptor]( &OBJC_CLASS___TBCoreDataStoreDescriptor,  "serverStoreDescriptor",  v3,  v4);
      id v5 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 1uLL:
      +[TBCoreDataStoreDescriptor directStoreDescriptor]( &OBJC_CLASS___TBCoreDataStoreDescriptor,  "directStoreDescriptor",  v3,  v4);
      id v5 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 2uLL:
      +[TBCoreDataStoreDescriptor clientStoreDescriptor]( &OBJC_CLASS___TBCoreDataStoreDescriptor,  "clientStoreDescriptor",  v3,  v4);
      id v5 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 3uLL:
      +[TBCoreDataStoreDescriptor tempStoreDescriptor]( &OBJC_CLASS___TBCoreDataStoreDescriptor,  "tempStoreDescriptor",  v3,  v4);
      id v5 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    default:
      id v5 = 0LL;
      break;
  }

  return v5;
}

- (id)changeHandler
{
  return self->changeHandler;
}

- (void)setChangeHandler:(id)a3
{
}

- (id)relevancyHandler
{
  return self->relevancyHandler;
}

- (void)setRelevancyHandler:(id)a3
{
}

- (unint64_t)cacheExpirationInDays
{
  return self->_cacheExpirationInDays;
}

- (NSMutableDictionary)networks
{
  return self->_networks;
}

- (void)setNetworks:(id)a3
{
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
}

- (NSURL)storeURL
{
  return self->_storeURL;
}

- (void)setStoreURL:(id)a3
{
}

- (TBDataSourceMediator)sourceMediator
{
  return self->_sourceMediator;
}

- (void)setSourceMediator:(id)a3
{
}

- (WiFi3BarsTileFetcher)tileFetcher
{
  return self->_tileFetcher;
}

- (void)setTileFetcher:(id)a3
{
}

- (void).cxx_destruct
{
}

@end