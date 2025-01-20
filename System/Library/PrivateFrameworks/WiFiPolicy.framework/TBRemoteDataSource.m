@interface TBRemoteDataSource
- (OS_dispatch_queue)queue;
- (TBRemoteDataSource)init;
- (unint64_t)type;
- (void)_captureTileFetchError:(id)a3 tileKey:(id)a4 duration:(double)a5 trigger:(unint64_t)a6;
- (void)_executeNetworkFetchRequest:(id)a3;
- (void)_fetchTilesForTileItems:(id)a3 completionHandler:(id)a4 trigger:(unint64_t)a5;
- (void)_fetchTilesWithRequest:(id)a3;
- (void)_submitNetworkSearch:(id)a3 completion:(id)a4;
- (void)_writeSearchTileToFile:(id)a3;
- (void)executeFetchRequest:(id)a3;
- (void)setQueue:(id)a3;
@end

@implementation TBRemoteDataSource

- (TBRemoteDataSource)init
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___TBRemoteDataSource;
  v2 = -[TBRemoteDataSource init](&v6, sel_init);
  if (!v2)
  {
    fprintf( (FILE *)*MEMORY[0x1895F89D0],  "AssertMacros: %s, %s file: %s, line: %d, value: %lld\n",  "self",  ",  "/Library/Caches/com.apple.xbs/Sources/WiFiPolicy/frameworks/Sources/ThreeBars/Data Sources/TBRemoteDataSource.m"",  38,  0LL);
LABEL_6:

    return 0LL;
  }

  dispatch_queue_t v3 = dispatch_queue_create("com.apple.wifi.threebars.service", MEMORY[0x1895F8AF8]);
  queue = v2->_queue;
  v2->_queue = (OS_dispatch_queue *)v3;

  if (!v2->_queue)
  {
    fprintf( (FILE *)*MEMORY[0x1895F89D0],  "AssertMacros: %s, %s file: %s, line: %d, value: %lld\n",  "_queue",  ",  "/Library/Caches/com.apple.xbs/Sources/WiFiPolicy/frameworks/Sources/ThreeBars/Data Sources/TBRemoteDataSource.m"",  41,  0LL);
    goto LABEL_6;
  }

  return v2;
}

- (unint64_t)type
{
  return 1LL;
}

- (void)_submitNetworkSearch:(id)a3 completion:(id)a4
{
  v13[1] = *MEMORY[0x1895F89C0];
  objc_super v6 = (void *)MEMORY[0x18960F3F0];
  id v7 = a4;
  id v8 = a3;
  [v6 sharedService];
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = v8;
  [MEMORY[0x189603F18] arrayWithObjects:v13 count:1];
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  [v9 ticketForWiFiQualityNetworkServiceRequest:v10];
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = -[TBRemoteDataSource queue](self, "queue");
  [v11 submitNetworkSearchWithCompletionQueue:v12 completion:v7];
}

- (void)executeFetchRequest:(id)a3
{
  id v4 = a3;
  [v4 descriptor];
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v6 = [v5 type];

  switch(v6)
  {
    case 3LL:
      -[TBRemoteDataSource _executeTileFetchRequest:](self, "_executeTileFetchRequest:", v4);
      break;
    case 2LL:
      -[TBRemoteDataSource _executeLocationFetchRequest:](self, "_executeLocationFetchRequest:", v4);
      break;
    case 1LL:
      -[TBRemoteDataSource _executeNetworkFetchRequest:](self, "_executeNetworkFetchRequest:", v4);
      break;
    default:
      v7.receiver = self;
      v7.super_class = (Class)&OBJC_CLASS___TBRemoteDataSource;
      -[TBDataSource executeFetchRequest:](&v7, sel_executeFetchRequest_, v4);
      break;
  }
}

- (void)_executeNetworkFetchRequest:(id)a3
{
  v18[1] = *MEMORY[0x1895F89C0];
  id v4 = a3;
  [v4 descriptor];
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  [v5 remoteRequest];
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    v15[0] = 0LL;
    v15[1] = v15;
    v15[2] = 0x3032000000LL;
    v15[3] = __Block_byref_object_copy__1;
    v15[4] = __Block_byref_object_dispose__1;
    id v16 = (id)os_transaction_create();
    uint64_t v7 = mach_absolute_time();
    v11[0] = MEMORY[0x1895F87A8];
    v11[1] = 3221225472LL;
    v11[2] = __50__TBRemoteDataSource__executeNetworkFetchRequest___block_invoke;
    v11[3] = &unk_18A16CF60;
    uint64_t v14 = v7;
    v11[4] = self;
    id v12 = v4;
    v13 = v15;
    -[TBRemoteDataSource _submitNetworkSearch:completion:](self, "_submitNetworkSearch:completion:", v6, v11);

    _Block_object_dispose(v15, 8);
  }

  else
  {
    uint64_t v17 = *MEMORY[0x1896075E0];
    v18[0] = @"remoteRequest property is nil";
    [MEMORY[0x189603F68] dictionaryWithObjects:v18 forKeys:&v17 count:1];
    id v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = +[TBError fetchMissingParametersErrorWithUserInfo:]( &OBJC_CLASS___TBError,  "fetchMissingParametersErrorWithUserInfo:",  v8);
    NSLog( @"%s: failed to create GEOWiFiQualityNetworkSearch",  "-[TBRemoteDataSource _executeNetworkFetchRequest:]");
    v10 = +[TBErrorFetchResponse responseWithError:](&OBJC_CLASS___TBErrorFetchResponse, "responseWithError:", v9);
    [v4 handleResponse:v10];
  }
}

void __50__TBRemoteDataSource__executeNetworkFetchRequest___block_invoke(void *a1, void *a2, void *a3)
{
  id v17 = a2;
  id v5 = a3;
  uint64_t v6 = mach_absolute_time();
  double v7 = MachTimeToSecs(v6 - a1[7]);
  if (v5)
  {
    NSLog(@"%s: error %@", "-[TBRemoteDataSource _executeNetworkFetchRequest:]_block_invoke", v5);
    +[TBErrorFetchResponse remoteResponseWithError:](&OBJC_CLASS___TBErrorFetchResponse, "remoteResponseWithError:", v5);
    id v8 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v9 = 0LL;
  }

  else
  {
    +[TBNetworkRemoteFetchResponse responseWithNetworkSearchResults:]( &OBJC_CLASS___TBNetworkRemoteFetchResponse,  "responseWithNetworkSearchResults:",  v17);
    id v8 = (void *)objc_claimAutoreleasedReturnValue();
    [v8 results];
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v9 = [v10 count];

    [v8 results];
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    NSLog( @"%s: fetched %lu results in %gs",  "-[TBRemoteDataSource _executeNetworkFetchRequest:]_block_invoke",  [v11 count],  *(void *)&v7);
  }

  id v12 = (void *)a1[4];
  uint64_t v13 = a1[5];
  [v8 error];
  uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue();
  [v12 submitAnalyticsEventForFetchRequest:v13 duration:v14 error:v9 resultCount:v7];

  [(id)a1[5] handleResponse:v8];
  uint64_t v15 = *(void *)(a1[6] + 8LL);
  id v16 = *(void **)(v15 + 40);
  *(void *)(v15 + 40) = 0LL;
}

- (void)_fetchTilesWithRequest:(id)a3
{
  v22[1] = *MEMORY[0x1895F89C0];
  id v4 = a3;
  [v4 descriptor];
  id v5 = (void *)objc_claimAutoreleasedReturnValue();
  [v5 tileItems];
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    if ((objc_opt_respondsToSelector() & 1) != 0
      && ([v4 userInfo],
          double v7 = (void *)objc_claimAutoreleasedReturnValue(),
          [v7 objectForKeyedSubscript:@"trigger"],
          id v8 = (void *)objc_claimAutoreleasedReturnValue(),
          v8,
          v7,
          v8))
    {
      [v4 userInfo];
      uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue();
      [v9 objectForKeyedSubscript:@"trigger"];
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      uint64_t v11 = [v10 unsignedIntegerValue];
    }

    else
    {
      uint64_t v11 = 0LL;
    }

    -[TBRemoteDataSource queue](self, "queue");
    id v12 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1895F87A8];
    block[1] = 3221225472LL;
    block[2] = __45__TBRemoteDataSource__fetchTilesWithRequest___block_invoke;
    block[3] = &unk_18A16CFB0;
    id v17 = v6;
    v18 = self;
    id v19 = v4;
    uint64_t v20 = v11;
    dispatch_async(v12, block);

    uint64_t v13 = v17;
  }

  else
  {
    uint64_t v21 = *MEMORY[0x1896075E0];
    v22[0] = @"tileItem property is nil";
    [MEMORY[0x189603F68] dictionaryWithObjects:v22 forKeys:&v21 count:1];
    uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue();
    +[TBError fetchMissingParametersErrorWithUserInfo:]( &OBJC_CLASS___TBError,  "fetchMissingParametersErrorWithUserInfo:",  v14);
    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue();

    NSLog(@"%s: failed to create tile key fetches", "-[TBRemoteDataSource _fetchTilesWithRequest:]");
    +[TBErrorFetchResponse responseWithError:](&OBJC_CLASS___TBErrorFetchResponse, "responseWithError:", v13);
    uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue();
    [v4 handleResponse:v15];
  }
}

void __45__TBRemoteDataSource__fetchTilesWithRequest___block_invoke(uint64_t a1)
{
  uint64_t v14 = mach_absolute_time();
  [*(id *)(a1 + 32) allObjects];
  uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue();
  [MEMORY[0x189603FE0] set];
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  unint64_t v3 = [*(id *)(a1 + 32) count];
  NSLog(@"%s: fetching %lu tiles", "-[TBRemoteDataSource _fetchTilesWithRequest:]_block_invoke", v3);
  unint64_t v4 = 0LL;
  unint64_t v5 = 1LL;
  do
  {
    if (v4 < v3)
    {
      [v15 objectAtIndexedSubscript:v4];
      uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
      [v2 addObject:v6];
    }

    unint64_t v7 = v4 + 1;
    if (v3 - 1 == v4 || 10 * (v5 / 0xA) - 1 == v4)
    {
      id v8 = dispatch_group_create();
      dispatch_group_enter(v8);
      uint64_t v9 = *(void **)(a1 + 40);
      v16[0] = MEMORY[0x1895F87A8];
      v16[1] = 3221225472LL;
      v16[2] = __45__TBRemoteDataSource__fetchTilesWithRequest___block_invoke_2;
      v16[3] = &unk_18A16CF88;
      id v10 = v2;
      id v17 = v10;
      unint64_t v21 = v7;
      unint64_t v22 = v3;
      id v18 = *(id *)(a1 + 48);
      id v19 = v8;
      uint64_t v11 = *(void *)(a1 + 40);
      uint64_t v23 = v14;
      uint64_t v20 = v11;
      uint64_t v12 = *(void *)(a1 + 56);
      uint64_t v13 = v8;
      [v9 _fetchTilesForTileItems:v10 completionHandler:v16 trigger:v12];
      dispatch_group_wait(v13, 0xFFFFFFFFFFFFFFFFLL);
    }

    ++v5;
    unint64_t v4 = v7;
  }

  while (v7 <= v3);
}

void __45__TBRemoteDataSource__fetchTilesWithRequest___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  [*(id *)(a1 + 32) removeAllObjects];
  uint64_t v4 = *(void *)(a1 + 64);
  uint64_t v5 = *(void *)(a1 + 72);
  [*(id *)(a1 + 40) resultsHandler];
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    [*(id *)(a1 + 40) resultsHandler];
    unint64_t v7 = (void (**)(void, void, void, void))objc_claimAutoreleasedReturnValue();
    v13[0] = MEMORY[0x1895F87A8];
    v13[1] = 3221225472LL;
    void v13[2] = __45__TBRemoteDataSource__fetchTilesWithRequest___block_invoke_3;
    v13[3] = &unk_18A16C770;
    id v14 = *(id *)(a1 + 48);
    ((void (**)(void, id, void *, BOOL))v7)[2](v7, v3, v13, v4 == v5);

    if (v4 == v5)
    {
      uint64_t v8 = mach_absolute_time();
      double v9 = MachTimeToSecs(v8 - *(void *)(a1 + 80));
      id v10 = *(void **)(a1 + 56);
      uint64_t v11 = *(void *)(a1 + 40);
      [v3 error];
      uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue();
      [v10 submitAnalyticsEventForFetchRequest:v11 duration:v12 error:*(void *)(a1 + 72) resultCount:v9];
    }
  }

  else
  {
    dispatch_group_leave(*(dispatch_group_t *)(a1 + 48));
  }
}

void __45__TBRemoteDataSource__fetchTilesWithRequest___block_invoke_3(uint64_t a1)
{
}

- (void)_fetchTilesForTileItems:(id)a3 completionHandler:(id)a4 trigger:(unint64_t)a5
{
  uint64_t v40 = *MEMORY[0x1895F89C0];
  id v7 = a3;
  id v21 = a4;
  v37[0] = 0LL;
  v37[1] = v37;
  v37[2] = 0x3032000000LL;
  v37[3] = __Block_byref_object_copy__1;
  v37[4] = __Block_byref_object_dispose__1;
  id v38 = objc_alloc_init(MEMORY[0x189603FE0]);
  uint64_t v8 = dispatch_group_create();
  __int128 v33 = 0u;
  __int128 v34 = 0u;
  __int128 v35 = 0u;
  __int128 v36 = 0u;
  id obj = v7;
  uint64_t v9 = [obj countByEnumeratingWithState:&v33 objects:v39 count:16];
  if (v9)
  {
    uint64_t v23 = *(void *)v34;
    do
    {
      uint64_t v10 = 0LL;
      do
      {
        if (*(void *)v34 != v23) {
          objc_enumerationMutation(obj);
        }
        uint64_t v11 = *(void **)(*((void *)&v33 + 1) + 8 * v10);
        dispatch_group_enter(v8);
        uint64_t v12 = mach_absolute_time();
        [MEMORY[0x18960F3F0] sharedService];
        uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue();
        [v11 key];
        id v14 = (void *)objc_claimAutoreleasedReturnValue();
        [v14 stringValue];
        uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue();
        [v11 etag];
        id v16 = (void *)objc_claimAutoreleasedReturnValue();
        [v13 ticketForWiFiQualityTileLoadForKey:v15 eTag:v16];
        id v17 = (void *)objc_claimAutoreleasedReturnValue();

        -[TBRemoteDataSource queue](self, "queue");
        id v18 = (void *)objc_claimAutoreleasedReturnValue();
        v28[0] = MEMORY[0x1895F87A8];
        v28[1] = 3221225472LL;
        v28[2] = __72__TBRemoteDataSource__fetchTilesForTileItems_completionHandler_trigger___block_invoke;
        v28[3] = &unk_18A16CFD8;
        uint64_t v31 = v12;
        unint64_t v32 = a5;
        v28[4] = self;
        v30 = v37;
        v29 = v8;
        [v17 submitTileLoadWithCompletionQueue:v18 completion:v28];

        ++v10;
      }

      while (v9 != v10);
      uint64_t v9 = [obj countByEnumeratingWithState:&v33 objects:v39 count:16];
    }

    while (v9);
  }

  -[TBRemoteDataSource queue](self, "queue");
  id v19 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = __72__TBRemoteDataSource__fetchTilesForTileItems_completionHandler_trigger___block_invoke_2;
  block[3] = &unk_18A16D000;
  v27 = v37;
  void block[4] = self;
  id v26 = v21;
  id v20 = v21;
  dispatch_group_notify(v8, v19, block);

  _Block_object_dispose(v37, 8);
}

void __72__TBRemoteDataSource__fetchTilesForTileItems_completionHandler_trigger___block_invoke( uint64_t a1,  void *a2,  char a3,  void *a4,  void *a5,  void *a6)
{
  id v22 = a2;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  id v14 = v13;
  if ((a3 & 1) != 0)
  {
    if (!v13)
    {
      uint64_t v15 = 2LL;
LABEL_9:
      id v19 = -[TBRemoteFetchTileItem initWithTile:status:etag:error:]( objc_alloc(&OBJC_CLASS___TBRemoteFetchTileItem),  "initWithTile:status:etag:error:",  v11,  v15,  v12,  0LL);
      id v20 = *(id *)(a1 + 32);
      objc_sync_enter(v20);
      [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) addObject:v19];
      goto LABEL_10;
    }

void __72__TBRemoteDataSource__fetchTilesForTileItems_completionHandler_trigger___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 40);
  +[TBTileRemoteFetchResponse responseWithTileItems:]( &OBJC_CLASS___TBTileRemoteFetchResponse,  "responseWithTileItems:",  *(void *)(*(void *)(*(void *)(a1 + 48) + 8LL) + 40LL));
  id v3 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, void *))(v2 + 16))(v2, v3);

  id obj = *(id *)(a1 + 32);
  objc_sync_enter(obj);
  [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) removeAllObjects];
  objc_sync_exit(obj);
}

- (void)_writeSearchTileToFile:(id)a3
{
  id v3 = (void *)MEMORY[0x1896078F8];
  uint64_t v10 = 0LL;
  id v4 = a3;
  [v3 archivedDataWithRootObject:v4 requiringSecureCoding:1 error:&v10];
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v6 = (void *)NSString;
  uint64_t v7 = [v4 tileKey];

  objc_msgSend(v6, "stringWithFormat:", @"/tmp/tile_%llu", v7, v10);
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
  [MEMORY[0x189604030] fileURLWithPath:v8];
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue();
  [v5 writeToURL:v9 atomically:1];
}

- (void)_captureTileFetchError:(id)a3 tileKey:(id)a4 duration:(double)a5 trigger:(unint64_t)a6
{
  uint64_t v9 = (void *)MEMORY[0x189607968];
  id v10 = a4;
  id v11 = a3;
  [v9 numberWithDouble:a5];
  id v13 = (id)objc_claimAutoreleasedReturnValue();
  +[TBFetchAnalyticsEvent fetchEventWithSource:type:trigger:duration:requestCount:resultCount:error:tileKey:]( &OBJC_CLASS___TBFetchAnalyticsEvent,  "fetchEventWithSource:type:trigger:duration:requestCount:resultCount:error:tileKey:",  2LL,  3LL,  a6,  v13,  &unk_18A1B37E0,  0LL,  v11,  v10);
  id v12 = (void *)objc_claimAutoreleasedReturnValue();

  +[TBAnalytics captureEvent:](&OBJC_CLASS___TBAnalytics, "captureEvent:", v12);
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
}

- (void).cxx_destruct
{
}

@end