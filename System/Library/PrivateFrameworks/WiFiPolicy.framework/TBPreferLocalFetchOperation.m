@interface TBPreferLocalFetchOperation
- (BOOL)_doResults:(id)a3 satisfyFetchRequest:(id)a4 keysToFetchRemotely:(id *)a5 satisfiedKeys:(id *)a6;
- (BOOL)isFinished;
- (BOOL)isReady;
- (NSArray)remoteKeysToFetch;
- (NSArray)satisfiedLocalKeys;
- (NSOperationQueue)fetchQueue;
- (TBFetchRequest)fetchRequest;
- (TBFetchRequest)fetchRequestCopy;
- (TBFetchResponse)response;
- (TBPreferLocalFetchDataSource)dataSource;
- (TBPreferLocalFetchOperation)initWithFetchRequest:(id)a3 dataSource:(id)a4 fetchQueue:(id)a5;
- (id)_tileItemsFromTileKeys:(id)a3;
- (id)name;
- (void)_captureCacheEventWithStatus:(unint64_t)a3 userInfo:(id)a4 error:(id)a5 type:(unint64_t)a6;
- (void)_fetchLocal;
- (void)_fetchRemote;
- (void)_mergeLocalAndRemoteResults:(id)a3;
- (void)finish;
- (void)finishAndCallCompletionWithResponse:(id)a3;
- (void)setDataSource:(id)a3;
- (void)setFetchQueue:(id)a3;
- (void)setFetchRequest:(id)a3;
- (void)setFetchRequestCopy:(id)a3;
- (void)setRemoteKeysToFetch:(id)a3;
- (void)setResponse:(id)a3;
- (void)setSatisfiedLocalKeys:(id)a3;
- (void)start;
@end

@implementation TBPreferLocalFetchOperation

- (TBPreferLocalFetchOperation)initWithFetchRequest:(id)a3 dataSource:(id)a4 fetchQueue:(id)a5
{
  v8 = (TBFetchRequest *)a3;
  v9 = (TBPreferLocalFetchDataSource *)a4;
  v10 = (NSOperationQueue *)a5;
  v18.receiver = self;
  v18.super_class = (Class)&OBJC_CLASS___TBPreferLocalFetchOperation;
  v11 = -[NSOperation init](&v18, sel_init);
  fetchRequest = v11->_fetchRequest;
  v11->_fetchRequest = v8;
  v13 = v8;

  dataSource = v11->_dataSource;
  v11->_dataSource = v9;
  v15 = v9;

  fetchQueue = v11->_fetchQueue;
  v11->_fetchQueue = v10;

  return v11;
}

- (BOOL)isFinished
{
  return self->_finished;
}

- (BOOL)isReady
{
  return 1;
}

- (void)start
{
  self->_finished = 0;
  [MEMORY[0x189603F50] date];
  v3 = (NSDate *)objc_claimAutoreleasedReturnValue();
  start = self->_start;
  self->_start = v3;
  v5 = -[TBPreferLocalFetchOperation fetchRequest](self, "fetchRequest");
  v6 = (void *)[v5 copyWithZone:0];
  -[TBPreferLocalFetchOperation setFetchRequestCopy:](self, "setFetchRequestCopy:", v6);

  -[TBPreferLocalFetchOperation _fetchLocal](self, "_fetchLocal");
}

- (void)_fetchLocal
{
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  [v3 descriptor];
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ([v4 type] == 1) {
    uint64_t v5 = 1LL;
  }
  else {
    uint64_t v5 = 2LL;
  }
  v6 = -[TBPreferLocalFetchOperation fetchRequestCopy](self, "fetchRequestCopy");
  objc_initWeak(&from, v6);

  uint64_t v7 = MEMORY[0x1895F87A8];
  v15[0] = MEMORY[0x1895F87A8];
  v15[1] = 3221225472LL;
  v15[2] = __42__TBPreferLocalFetchOperation__fetchLocal__block_invoke;
  v15[3] = &unk_18A16E0C0;
  objc_copyWeak(&v16, &location);
  objc_copyWeak(&v17, &from);
  v8 = -[TBPreferLocalFetchOperation fetchRequestCopy](self, "fetchRequestCopy");
  [v8 setPreferLocalHandler:v15];

  objc_copyWeak(v14, &location);
  v14[1] = (id)v5;
  v9 = -[TBPreferLocalFetchOperation fetchRequestCopy]( self,  "fetchRequestCopy",  v7,  3221225472LL,  __42__TBPreferLocalFetchOperation__fetchLocal__block_invoke_2,  &unk_18A16E0E8);
  [v9 setResultsHandler:&v13];
  v10 = -[TBPreferLocalFetchOperation dataSource](self, "dataSource");
  [v10 localDataSource];
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = -[TBPreferLocalFetchOperation fetchRequestCopy](self, "fetchRequestCopy");
  [v11 executeFetchRequest:v12];

  objc_destroyWeak(v14);
  objc_destroyWeak(&v17);
  objc_destroyWeak(&v16);
  objc_destroyWeak(&from);
  objc_destroyWeak(&location);
}

uint64_t __42__TBPreferLocalFetchOperation__fetchLocal__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v6 = objc_loadWeakRetained((id *)(a1 + 40));
  id v13 = 0LL;
  id v14 = 0LL;
  uint64_t v7 = [WeakRetained _doResults:v3 satisfyFetchRequest:v6 keysToFetchRemotely:&v14 satisfiedKeys:&v13];
  id v8 = v14;
  id v9 = v13;

  if ((v7 & 1) != 0)
  {
    NSLog( @"%s: request is fully satisified by local results (count %lu)",  "-[TBPreferLocalFetchOperation _fetchLocal]_block_invoke",  [v3 count]);
  }

  else
  {
    NSLog( @"%s: request unsatisfied with local results",  "-[TBPreferLocalFetchOperation _fetchLocal]_block_invoke");
    id v10 = objc_loadWeakRetained(v4);
    [v10 setRemoteKeysToFetch:v8];

    NSLog(@"keys needed to fetch remotely %@", v8);
    id v11 = objc_loadWeakRetained(v4);
    [v11 setSatisfiedLocalKeys:v9];

    NSLog(@"satisifed local keys %@", v9);
  }

  return v7;
}

void __42__TBPreferLocalFetchOperation__fetchLocal__block_invoke_2(uint64_t a1, void *a2)
{
  id v24 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained fetchRequest];
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  char v5 = objc_opt_respondsToSelector();

  if ((v5 & 1) != 0)
  {
    id v6 = objc_loadWeakRetained((id *)(a1 + 32));
    [v6 fetchRequest];
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue();
    [v7 userInfo];
    id v8 = (void *)objc_claimAutoreleasedReturnValue();
  }

  else
  {
    id v8 = 0LL;
  }

  [v24 error];
  id v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    [v24 error];
    id v10 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v11 = [v10 code];

    if (v11 == 102)
    {
      uint64_t v12 = 3LL;
    }

    else
    {
      [v24 error];
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      uint64_t v20 = [v19 code];

      if (v20 == 103) {
        uint64_t v12 = 2LL;
      }
      else {
        uint64_t v12 = 4LL;
      }
    }

    [v24 error];
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    NSLog(@"%s: local fetch error %@", "-[TBPreferLocalFetchOperation _fetchLocal]_block_invoke_2", v21);

    id v22 = objc_loadWeakRetained((id *)(a1 + 32));
    [v24 error];
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    [v22 _captureCacheEventWithStatus:v12 userInfo:v8 error:v23 type:*(void *)(a1 + 40)];

    id v18 = objc_loadWeakRetained((id *)(a1 + 32));
    [v18 _fetchRemote];
  }

  else
  {
    id v13 = objc_loadWeakRetained((id *)(a1 + 32));
    [v13 setResponse:v24];

    [v24 results];
    id v14 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v15 = [v14 count];
    [v24 tiles];
    id v16 = (void *)objc_claimAutoreleasedReturnValue();
    NSLog( @"%s: results (%d) tiles (%d) found in local cache",  "-[TBPreferLocalFetchOperation _fetchLocal]_block_invoke_2",  v15,  [v16 count]);

    id v17 = objc_loadWeakRetained((id *)(a1 + 32));
    [v17 _captureCacheEventWithStatus:1 userInfo:v8 error:0 type:*(void *)(a1 + 40)];

    id v18 = objc_loadWeakRetained((id *)(a1 + 32));
    [v18 finishAndCallCompletionWithResponse:v24];
  }
}

- (BOOL)_doResults:(id)a3 satisfyFetchRequest:(id)a4 keysToFetchRemotely:(id *)a5 satisfiedKeys:(id *)a6
{
  uint64_t v32 = *MEMORY[0x1895F89C0];
  id v9 = a3;
  id v10 = a4;
  [v10 descriptor];
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue();
  if ([v11 type] == 2)
  {
  }

  else
  {
    [v10 descriptor];
    uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v13 = [v12 type];

    if (v13 != 3)
    {
      BOOL v25 = [v9 count] != 0;
      goto LABEL_20;
    }
  }

  [MEMORY[0x189603FE0] set];
  id v14 = (void *)objc_claimAutoreleasedReturnValue();
  __int128 v27 = 0u;
  __int128 v28 = 0u;
  __int128 v29 = 0u;
  __int128 v30 = 0u;
  objc_msgSend(v10, "descriptor", 0);
  uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue();
  [v15 tileItems];
  id v16 = (void *)objc_claimAutoreleasedReturnValue();

  uint64_t v17 = [v16 countByEnumeratingWithState:&v27 objects:v31 count:16];
  if (v17)
  {
    uint64_t v18 = v17;
    uint64_t v19 = *(void *)v28;
    do
    {
      for (uint64_t i = 0LL; i != v18; ++i)
      {
        if (*(void *)v28 != v19) {
          objc_enumerationMutation(v16);
        }
        [*(id *)(*((void *)&v27 + 1) + 8 * i) key];
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        [v14 addObject:v21];
      }

      uint64_t v18 = [v16 countByEnumeratingWithState:&v27 objects:v31 count:16];
    }

    while (v18);
  }

  [v9 valueForKey:@"key"];
  id v22 = (void *)objc_claimAutoreleasedReturnValue();
  if (v22)
  {
    [MEMORY[0x189604010] setWithArray:v22];
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    [v14 minusSet:v23];

    uint64_t v24 = [v14 count];
    BOOL v25 = v24 == 0;
    if (a5 && v24)
    {
      [v14 allObjects];
      *a5 = (id)objc_claimAutoreleasedReturnValue();
    }

    if (a6) {
      *a6 = v22;
    }
  }

  else
  {
    BOOL v25 = 0;
  }

LABEL_20:
  return v25;
}

- (void)_fetchRemote
{
  uint64_t v3 = -[TBPreferLocalFetchOperation remoteKeysToFetch](self, "remoteKeysToFetch");
  if (!v3) {
    goto LABEL_6;
  }
  v4 = (void *)v3;
  -[TBPreferLocalFetchOperation fetchRequest](self, "fetchRequest");
  char v5 = (void *)objc_claimAutoreleasedReturnValue();
  [v5 descriptor];
  id v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ([v6 type] != 2)
  {
    -[TBPreferLocalFetchOperation fetchRequest](self, "fetchRequest");
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue();
    [v7 descriptor];
    id v8 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v9 = [v8 type];

    if (v9 == 3) {
      goto LABEL_5;
    }
LABEL_6:
    v23 = objc_alloc(&OBJC_CLASS___TBRemoteFetchAndCacheDataSource);
    -[TBPreferLocalFetchOperation dataSource](self, "dataSource");
    uint64_t v24 = (void *)objc_claimAutoreleasedReturnValue();
    [v24 remoteDataSource];
    BOOL v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = -[TBPreferLocalFetchOperation dataSource](self, "dataSource");
    [v26 cacheProvider];
    __int128 v27 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v11 = -[TBRemoteFetchAndCacheDataSource initWithFetchDataSource:cacheProvider:]( v23,  "initWithFetchDataSource:cacheProvider:",  v25,  v27);

    __int128 v28 = objc_alloc(&OBJC_CLASS___TBRemoteFetchAndCacheOperation);
    -[TBPreferLocalFetchOperation fetchRequest](self, "fetchRequest");
    __int128 v29 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v12 = -[TBRemoteFetchAndCacheOperation initWithFetchRequest:dataSource:]( v28,  "initWithFetchRequest:dataSource:",  v29,  v11);

    -[NSOperation addDependency:](self, "addDependency:", v12);
    -[TBPreferLocalFetchOperation fetchQueue](self, "fetchQueue");
    __int128 v30 = (void *)objc_claimAutoreleasedReturnValue();
    [v30 addOperation:v12];

    objc_initWeak(&location, self);
    objc_initWeak(&from, v12);
    v31[0] = MEMORY[0x1895F87A8];
    v31[1] = 3221225472LL;
    v31[2] = __43__TBPreferLocalFetchOperation__fetchRemote__block_invoke_2;
    v31[3] = &unk_18A16E110;
    objc_copyWeak(&v32, &location);
    objc_copyWeak(&v33, &from);
    -[TBTileFetchRequestDescriptor setCompletionBlock:](v12, "setCompletionBlock:", v31);
    objc_destroyWeak(&v33);
    objc_destroyWeak(&v32);
    objc_destroyWeak(&from);
    objc_destroyWeak(&location);
    goto LABEL_7;
  }

LABEL_5:
  -[TBPreferLocalFetchOperation remoteKeysToFetch](self, "remoteKeysToFetch");
  id v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[TBPreferLocalFetchOperation _tileItemsFromTileKeys:](self, "_tileItemsFromTileKeys:", v10);
  uint64_t v11 = (TBRemoteFetchAndCacheDataSource *)objc_claimAutoreleasedReturnValue();

  uint64_t v12 = -[TBTileFetchRequestDescriptor initWithTileItems:]( objc_alloc(&OBJC_CLASS___TBTileFetchRequestDescriptor),  "initWithTileItems:",  v11);
  -[TBPreferLocalFetchOperation fetchRequest](self, "fetchRequest");
  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue();
  +[TBTileFetchRequest fetchRequestWithDescriptor:sourcePolicy:cacheable:]( TBTileFetchRequest,  "fetchRequestWithDescriptor:sourcePolicy:cacheable:",  v12,  2,  [v13 cacheable]);
  id v14 = (void *)objc_claimAutoreleasedReturnValue();

  uint64_t v15 = objc_alloc(&OBJC_CLASS___TBRemoteFetchAndCacheDataSource);
  -[TBPreferLocalFetchOperation dataSource](self, "dataSource");
  id v16 = (void *)objc_claimAutoreleasedReturnValue();
  [v16 remoteDataSource];
  uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[TBPreferLocalFetchOperation dataSource](self, "dataSource");
  uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue();
  [v18 cacheProvider];
  uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v20 = -[TBRemoteFetchAndCacheDataSource initWithFetchDataSource:cacheProvider:]( v15,  "initWithFetchDataSource:cacheProvider:",  v17,  v19);

  v21 = -[TBRemoteFetchAndCacheOperation initWithFetchRequest:dataSource:]( objc_alloc(&OBJC_CLASS___TBRemoteFetchAndCacheOperation),  "initWithFetchRequest:dataSource:",  v14,  v20);
  -[NSOperation addDependency:](self, "addDependency:", v21);
  -[TBPreferLocalFetchOperation fetchQueue](self, "fetchQueue");
  id v22 = (void *)objc_claimAutoreleasedReturnValue();
  [v22 addOperation:v21];

  objc_initWeak(&location, self);
  objc_initWeak(&from, v21);
  v34[0] = MEMORY[0x1895F87A8];
  v34[1] = 3221225472LL;
  v34[2] = __43__TBPreferLocalFetchOperation__fetchRemote__block_invoke;
  v34[3] = &unk_18A16E110;
  objc_copyWeak(&v35, &location);
  objc_copyWeak(&v36, &from);
  -[NSOperation setCompletionBlock:](v21, "setCompletionBlock:", v34);
  objc_destroyWeak(&v36);
  objc_destroyWeak(&v35);
  objc_destroyWeak(&from);
  objc_destroyWeak(&location);

LABEL_7:
}

void __43__TBPreferLocalFetchOperation__fetchRemote__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v2 = objc_loadWeakRetained((id *)(a1 + 40));
  [v2 response];
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue();
  [WeakRetained _mergeLocalAndRemoteResults:v3];
}

void __43__TBPreferLocalFetchOperation__fetchRemote__block_invoke_2(id *a1)
{
  v1 = a1;
  id WeakRetained = objc_loadWeakRetained(a1 + 5);
  [WeakRetained response];
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue();
  v1 += 4;
  id v4 = objc_loadWeakRetained(v1);
  [v4 setResponse:v3];

  id v5 = objc_loadWeakRetained(v1);
  [v5 finish];
}

- (void)_mergeLocalAndRemoteResults:(id)a3
{
  id v4 = a3;
  uint64_t v5 = -[TBPreferLocalFetchOperation satisfiedLocalKeys](self, "satisfiedLocalKeys");
  if (!v5) {
    goto LABEL_6;
  }
  id v6 = (void *)v5;
  -[TBPreferLocalFetchOperation fetchRequest](self, "fetchRequest");
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue();
  [v7 descriptor];
  id v8 = (void *)objc_claimAutoreleasedReturnValue();
  if ([v8 type] != 2)
  {
    -[TBPreferLocalFetchOperation fetchRequest](self, "fetchRequest");
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue();
    [v9 descriptor];
    id v10 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v11 = [v10 type];

    if (v11 == 3) {
      goto LABEL_5;
    }
LABEL_6:
    -[TBPreferLocalFetchOperation finishAndCallCompletionWithResponse:]( self,  "finishAndCallCompletionWithResponse:",  v4);
    goto LABEL_7;
  }

LABEL_5:
  -[TBPreferLocalFetchOperation satisfiedLocalKeys](self, "satisfiedLocalKeys");
  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue();
  NSLog( @"%s: fetching remaining satisfied local keys %@",  "-[TBPreferLocalFetchOperation _mergeLocalAndRemoteResults:]",  v12);

  -[TBPreferLocalFetchOperation satisfiedLocalKeys](self, "satisfiedLocalKeys");
  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[TBPreferLocalFetchOperation _tileItemsFromTileKeys:](self, "_tileItemsFromTileKeys:", v13);
  id v14 = (void *)objc_claimAutoreleasedReturnValue();

  uint64_t v15 = -[TBTileFetchRequestDescriptor initWithTileItems:]( objc_alloc(&OBJC_CLASS___TBTileFetchRequestDescriptor),  "initWithTileItems:",  v14);
  +[TBTileFetchRequest fetchRequestWithDescriptor:sourcePolicy:cacheable:]( &OBJC_CLASS___TBTileFetchRequest,  "fetchRequestWithDescriptor:sourcePolicy:cacheable:",  v15,  1LL,  0LL);
  id v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_initWeak(&location, self);
  v19[0] = MEMORY[0x1895F87A8];
  v19[1] = 3221225472LL;
  v19[2] = __59__TBPreferLocalFetchOperation__mergeLocalAndRemoteResults___block_invoke;
  v19[3] = &unk_18A16E138;
  id v20 = v4;
  objc_copyWeak(&v21, &location);
  [v16 setResultsHandler:v19];
  -[TBPreferLocalFetchOperation dataSource](self, "dataSource");
  uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue();
  [v17 localDataSource];
  uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue();
  [v18 executeFetchRequest:v16];

  objc_destroyWeak(&v21);
  objc_destroyWeak(&location);

LABEL_7:
}

void __59__TBPreferLocalFetchOperation__mergeLocalAndRemoteResults___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v5 = objc_alloc_init(&OBJC_CLASS___TBMutableTileFetchResponse);
  -[TBMutableTileFetchResponse addResponse:](v5, "addResponse:", *(void *)(a1 + 32));
  -[TBMutableTileFetchResponse addResponse:](v5, "addResponse:", v3);

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained finishAndCallCompletionWithResponse:v5];
}

- (id)_tileItemsFromTileKeys:(id)a3
{
  uint64_t v19 = *MEMORY[0x1895F89C0];
  id v3 = a3;
  [MEMORY[0x189603FE0] set];
  id v4 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v5 = (void *)MEMORY[0x1895BA820]();
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  id v6 = v3;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v15;
    do
    {
      uint64_t v10 = 0LL;
      do
      {
        if (*(void *)v15 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void *)(*((void *)&v14 + 1) + 8 * v10);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          +[TBTileItemDescriptor tileItemDescriptorWithKey:]( &OBJC_CLASS___TBTileItemDescriptor,  "tileItemDescriptorWithKey:",  v11,  (void)v14);
          uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue();
          [v4 addObject:v12];
        }

        ++v10;
      }

      while (v8 != v10);
      uint64_t v8 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }

    while (v8);
  }

  objc_autoreleasePoolPop(v5);
  return v4;
}

- (void)finishAndCallCompletionWithResponse:(id)a3
{
  id v4 = a3;
  -[TBPreferLocalFetchOperation setResponse:](self, "setResponse:", v4);
  -[TBPreferLocalFetchOperation fetchRequest](self, "fetchRequest");
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue();
  [v5 resultsHandler];
  id v6 = (void (**)(void, void, void, void))objc_claimAutoreleasedReturnValue();
  ((void (**)(void, id, void, uint64_t))v6)[2](v6, v4, 0LL, 1LL);

  -[TBPreferLocalFetchOperation finish](self, "finish");
}

- (void)finish
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSDate timeIntervalSinceNow](self->_start, "timeIntervalSinceNow");
  NSLog(@"%@ finished.  Elapsed: %.2f seconds.", v3, -v4);

  -[TBPreferLocalFetchOperation willChangeValueForKey:](self, "willChangeValueForKey:", @"isFinished");
  self->_finished = 1;
  -[TBPreferLocalFetchOperation didChangeValueForKey:](self, "didChangeValueForKey:", @"isFinished");
}

- (id)name
{
  id v2 = (objc_class *)objc_opt_class();
  return NSStringFromClass(v2);
}

- (void)_captureCacheEventWithStatus:(unint64_t)a3 userInfo:(id)a4 error:(id)a5 type:(unint64_t)a6
{
  id v15 = a4;
  id v9 = a5;
  [v15 objectForKeyedSubscript:@"staleness"];
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    [v15 objectForKeyedSubscript:@"staleness"];
    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v10 = (void *)[v11 unsignedIntegerValue];
  }

  [v15 objectForKeyedSubscript:@"tileKey"];
  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    [v15 objectForKeyedSubscript:@"tileKey"];
    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v12 = (void *)[v13 unsignedIntegerValue];
  }

  +[TBCacheAnalyticsEvent cacheAnalyticsEventWithStatus:staleness:tileKey:type:error:]( &OBJC_CLASS___TBCacheAnalyticsEvent,  "cacheAnalyticsEventWithStatus:staleness:tileKey:type:error:",  a3,  v10,  v12,  a6,  v9);
  __int128 v14 = (void *)objc_claimAutoreleasedReturnValue();
  +[TBAnalytics captureEvent:](&OBJC_CLASS___TBAnalytics, "captureEvent:", v14);
}

- (TBFetchRequest)fetchRequest
{
  return self->_fetchRequest;
}

- (void)setFetchRequest:(id)a3
{
}

- (TBFetchRequest)fetchRequestCopy
{
  return self->_fetchRequestCopy;
}

- (void)setFetchRequestCopy:(id)a3
{
}

- (TBFetchResponse)response
{
  return self->_response;
}

- (void)setResponse:(id)a3
{
}

- (TBPreferLocalFetchDataSource)dataSource
{
  return self->_dataSource;
}

- (void)setDataSource:(id)a3
{
}

- (NSOperationQueue)fetchQueue
{
  return self->_fetchQueue;
}

- (void)setFetchQueue:(id)a3
{
}

- (NSArray)remoteKeysToFetch
{
  return self->_remoteKeysToFetch;
}

- (void)setRemoteKeysToFetch:(id)a3
{
}

- (NSArray)satisfiedLocalKeys
{
  return self->_satisfiedLocalKeys;
}

- (void)setSatisfiedLocalKeys:(id)a3
{
}

- (void).cxx_destruct
{
}

@end