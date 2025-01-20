@interface TBDataSourceMediator
- (NSOperationQueue)fetchQueue;
- (TBCoreDataSource)local;
- (TBDataSource)remote;
- (TBDataSourceMediator)initWithLocalStoreDescriptor:(id)a3;
- (TBDataSourceMediator)initWithLocalStoreDescriptor:(id)a3 remoteStore:(id)a4;
- (void)executeFetchRequest:(id)a3;
- (void)prune3BarsNetworks:(unint64_t)a3 completionHandler:(id)a4;
- (void)removeAllWithCompletionHandler:(id)a3;
- (void)removeWithFetchRequest:(id)a3;
- (void)setFetchQueue:(id)a3;
- (void)setLocal:(id)a3;
- (void)setRemote:(id)a3;
@end

@implementation TBDataSourceMediator

- (TBDataSourceMediator)initWithLocalStoreDescriptor:(id)a3 remoteStore:(id)a4
{
  v6 = (TBDataSource *)a4;
  v17.receiver = self;
  v17.super_class = (Class)&OBJC_CLASS___TBDataSourceMediator;
  id v7 = a3;
  v8 = -[TBDataSourceMediator init](&v17, sel_init);
  v9 = objc_alloc(&OBJC_CLASS___TBCoreDataSource);
  uint64_t v10 = -[TBCoreDataSource initWithStoreDescriptor:](v9, "initWithStoreDescriptor:", v7, v17.receiver, v17.super_class);

  local = v8->_local;
  v8->_local = (TBCoreDataSource *)v10;

  remote = v8->_remote;
  v8->_remote = v6;
  v13 = v6;

  v14 = (NSOperationQueue *)objc_alloc_init(MEMORY[0x189607988]);
  fetchQueue = v8->_fetchQueue;
  v8->_fetchQueue = v14;

  return v8;
}

- (TBDataSourceMediator)initWithLocalStoreDescriptor:(id)a3
{
  id v4 = a3;
  v5 = objc_alloc_init(&OBJC_CLASS___TBRemoteDataSource);
  v6 = -[TBDataSourceMediator initWithLocalStoreDescriptor:remoteStore:]( self,  "initWithLocalStoreDescriptor:remoteStore:",  v4,  v5);

  return v6;
}

- (void)executeFetchRequest:(id)a3
{
  id v21 = a3;
  NSLog(@"%s: executing fetch request %@", "-[TBDataSourceMediator executeFetchRequest:]", v21);
  if ([v21 sourcePolicy] == 2)
  {
    if ([v21 cacheable])
    {
      id v4 = objc_alloc(&OBJC_CLASS___TBRemoteFetchAndCacheDataSource);
      v5 = -[TBDataSourceMediator remote](self, "remote");
      v6 = -[TBDataSourceMediator local](self, "local");
      id v7 = -[TBRemoteFetchAndCacheDataSource initWithFetchDataSource:cacheProvider:]( v4,  "initWithFetchDataSource:cacheProvider:",  v5,  v6);

      v8 = -[TBRemoteFetchAndCacheOperation initWithFetchRequest:dataSource:]( objc_alloc(&OBJC_CLASS___TBRemoteFetchAndCacheOperation),  "initWithFetchRequest:dataSource:",  v21,  v7);
LABEL_6:
      v15 = -[TBDataSourceMediator fetchQueue](self, "fetchQueue");
      [v15 addOperation:v8];

LABEL_11:
      return;
    }

    remote = (TBCoreDataSource *)self->_remote;
LABEL_10:
    -[TBCoreDataSource executeFetchRequest:](remote, "executeFetchRequest:", v21);
    goto LABEL_11;
  }

  if ([v21 sourcePolicy] == 3)
  {
    v9 = objc_alloc(&OBJC_CLASS___TBPreferLocalFetchDataSource);
    -[TBDataSourceMediator local](self, "local");
    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = -[TBDataSourceMediator remote](self, "remote");
    v12 = -[TBDataSourceMediator local](self, "local");
    id v7 = -[TBPreferLocalFetchDataSource initWithLocalDataSource:remoteDataSource:cacheProvider:]( v9,  "initWithLocalDataSource:remoteDataSource:cacheProvider:",  v10,  v11,  v12);

    v13 = objc_alloc(&OBJC_CLASS___TBPreferLocalFetchOperation);
    v14 = -[TBDataSourceMediator fetchQueue](self, "fetchQueue");
    v8 = -[TBPreferLocalFetchOperation initWithFetchRequest:dataSource:fetchQueue:]( v13,  "initWithFetchRequest:dataSource:fetchQueue:",  v21,  v7,  v14);

    goto LABEL_6;
  }

  if ([v21 sourcePolicy] == 1)
  {
    remote = self->_local;
    goto LABEL_10;
  }

  [MEMORY[0x189603F70] exceptionWithName:*MEMORY[0x189603A58] reason:@"Unhandled source policy" userInfo:0];
  id v17 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v17);
  -[TBDataSourceMediator removeWithFetchRequest:](v18, v19, v20);
}

- (void)removeWithFetchRequest:(id)a3
{
  id v4 = a3;
  NSLog(@"%s: removing with fetch request %@", "-[TBDataSourceMediator removeWithFetchRequest:]", v4);
  local = self->_local;
  v7[0] = MEMORY[0x1895F87A8];
  v7[1] = 3221225472LL;
  v7[2] = __47__TBDataSourceMediator_removeWithFetchRequest___block_invoke;
  v7[3] = &unk_18A16D930;
  id v8 = v4;
  id v6 = v4;
  -[TBCoreDataSource removeWithFetchRequest:completionHandler:]( local,  "removeWithFetchRequest:completionHandler:",  v6,  v7);
}

void __47__TBDataSourceMediator_removeWithFetchRequest___block_invoke(uint64_t a1)
{
  v2 = (void (**)(id, TBLocalFetchResponse *, void, uint64_t))objc_claimAutoreleasedReturnValue();
  v1 = -[TBLocalFetchResponse initWithResults:entityDescription:]( objc_alloc(&OBJC_CLASS___TBLocalFetchResponse),  "initWithResults:entityDescription:",  0LL,  0LL);
  v2[2](v2, v1, 0LL, 1LL);
}

- (void)removeAllWithCompletionHandler:(id)a3
{
  id v4 = a3;
  NSLog(@"%s: removing all", "-[TBDataSourceMediator removeAllWithCompletionHandler:]");
  -[TBCoreDataSource removeAllWithCompletionHandler:](self->_local, "removeAllWithCompletionHandler:", v4);
}

- (void)prune3BarsNetworks:(unint64_t)a3 completionHandler:(id)a4
{
  id v6 = a4;
  NSLog( @"%s: prune local store, sizeLimit: %lu bytes",  "-[TBDataSourceMediator prune3BarsNetworks:completionHandler:]",  a3);
  -[TBCoreDataSource prune3BarsNetworks:completionHandler:]( self->_local,  "prune3BarsNetworks:completionHandler:",  a3,  v6);
}

- (TBCoreDataSource)local
{
  return self->_local;
}

- (void)setLocal:(id)a3
{
}

- (TBDataSource)remote
{
  return self->_remote;
}

- (void)setRemote:(id)a3
{
}

- (NSOperationQueue)fetchQueue
{
  return self->_fetchQueue;
}

- (void)setFetchQueue:(id)a3
{
}

- (void).cxx_destruct
{
}

@end