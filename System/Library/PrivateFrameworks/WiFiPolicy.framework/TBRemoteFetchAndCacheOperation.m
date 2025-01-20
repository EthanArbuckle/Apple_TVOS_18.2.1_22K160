@interface TBRemoteFetchAndCacheOperation
- (BOOL)isFinished;
- (BOOL)isReady;
- (TBFetchRequest)fetchRequest;
- (TBFetchResponse)response;
- (TBRemoteFetchAndCacheDataSource)dataSource;
- (TBRemoteFetchAndCacheOperation)initWithFetchRequest:(id)a3 dataSource:(id)a4;
- (id)name;
- (void)finish;
- (void)setDataSource:(id)a3;
- (void)setFetchRequest:(id)a3;
- (void)setResponse:(id)a3;
- (void)start;
@end

@implementation TBRemoteFetchAndCacheOperation

- (TBRemoteFetchAndCacheOperation)initWithFetchRequest:(id)a3 dataSource:(id)a4
{
  v6 = (TBFetchRequest *)a3;
  v7 = (TBRemoteFetchAndCacheDataSource *)a4;
  v13.receiver = self;
  v13.super_class = (Class)&OBJC_CLASS___TBRemoteFetchAndCacheOperation;
  v8 = -[NSOperation init](&v13, sel_init);
  fetchRequest = v8->_fetchRequest;
  v8->_fetchRequest = v6;
  v10 = v6;

  dataSource = v8->_dataSource;
  v8->_dataSource = v7;

  return v8;
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

  objc_initWeak(&location, self);
  v5 = -[TBRemoteFetchAndCacheOperation fetchRequest](self, "fetchRequest");
  v6 = (void *)[v5 copyWithZone:0];

  v9[0] = MEMORY[0x1895F87A8];
  v9[1] = 3221225472LL;
  v9[2] = __39__TBRemoteFetchAndCacheOperation_start__block_invoke;
  v9[3] = &unk_18A16EA40;
  objc_copyWeak(&v10, &location);
  v9[4] = self;
  [v6 setResultsHandler:v9];
  v7 = -[TBRemoteFetchAndCacheOperation dataSource](self, "dataSource");
  [v7 fetchDataSource];
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  [v8 executeFetchRequest:v6];

  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);
}

void __39__TBRemoteFetchAndCacheOperation_start__block_invoke(uint64_t a1, void *a2, void *a3, uint64_t a4)
{
  id v7 = a2;
  id v8 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained dataSource];
  id v10 = (void *)objc_claimAutoreleasedReturnValue();
  [v10 cacheProvider];
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v18 = MEMORY[0x1895F87A8];
  uint64_t v19 = 3221225472LL;
  v20 = __39__TBRemoteFetchAndCacheOperation_start__block_invoke_2;
  v21 = &unk_18A16EA18;
  id v12 = v7;
  id v22 = v12;
  id v13 = v8;
  id v23 = v13;
  char v25 = a4;
  objc_copyWeak(&v24, (id *)(a1 + 40));
  [v11 cacheFetchResponse:v12 completionHandler:&v18];

  objc_msgSend(*(id *)(a1 + 32), "fetchRequest", v18, v19, v20, v21);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  [v14 resultsHandler];
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (v15)
  {
    [*(id *)(a1 + 32) fetchRequest];
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    [v16 resultsHandler];
    v17 = (void (**)(void, void, void, void))objc_claimAutoreleasedReturnValue();
    ((void (**)(void, id, void, uint64_t))v17)[2](v17, v12, 0LL, a4);
  }

  objc_destroyWeak(&v24);
}

void __39__TBRemoteFetchAndCacheOperation_start__block_invoke_2(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 40);
  if (v2) {
    (*(void (**)(void))(v2 + 16))();
  }
  if (*(_BYTE *)(a1 + 56))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    v4 = (id *)(a1 + 48);
    id WeakRetained = objc_loadWeakRetained(v4);
    [WeakRetained setResponse:v3];

    NSLog(@"%s: finishing caching response", "-[TBRemoteFetchAndCacheOperation start]_block_invoke_2");
    id v6 = objc_loadWeakRetained(v4);
    [v6 finish];
  }

- (void)finish
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSDate timeIntervalSinceNow](self->_start, "timeIntervalSinceNow");
  NSLog(@"%@ finished.  Elapsed: %.2f seconds.", v3, -v4);

  -[TBRemoteFetchAndCacheOperation willChangeValueForKey:](self, "willChangeValueForKey:", @"isFinished");
  self->_finished = 1;
  -[TBRemoteFetchAndCacheOperation didChangeValueForKey:](self, "didChangeValueForKey:", @"isFinished");
}

- (id)name
{
  uint64_t v2 = (objc_class *)objc_opt_class();
  return NSStringFromClass(v2);
}

- (TBFetchResponse)response
{
  return self->_response;
}

- (void)setResponse:(id)a3
{
}

- (TBFetchRequest)fetchRequest
{
  return self->_fetchRequest;
}

- (void)setFetchRequest:(id)a3
{
}

- (TBRemoteFetchAndCacheDataSource)dataSource
{
  return self->_dataSource;
}

- (void)setDataSource:(id)a3
{
}

- (void).cxx_destruct
{
}

@end