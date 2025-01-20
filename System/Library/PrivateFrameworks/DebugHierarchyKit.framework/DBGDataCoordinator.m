@interface DBGDataCoordinator
+ (id)coordinatorWithDataSourceConnection:(id)a3;
- (BOOL)shouldStoreCompletedRequests;
- (DBGDataCoordinator)initWithDataSourceConnection:(id)a3;
- (DBGDataSourceConnection)dataSourceConnection;
- (DBGSnapshotManager)snapshotManager;
- (DebugHierarchyRequest)executingRequest;
- (NSArray)snapshotTransformers;
- (NSMutableArray)completedRequests;
- (NSMutableArray)enqueuedRequests;
- (NSMutableArray)snapshotTransformerStore;
- (void)_performNextRequest;
- (void)addSnapshotTransformer:(id)a3;
- (void)cancelAllRequests;
- (void)cancelRequest:(id)a3;
- (void)didReceiveData:(id)a3 forRequest:(id)a4;
- (void)performRequest:(id)a3;
- (void)setDataSourceConnection:(id)a3;
- (void)setEnqueuedRequests:(id)a3;
- (void)setExecutingRequest:(id)a3;
- (void)setShouldStoreCompletedRequests:(BOOL)a3;
- (void)setSnapshotManager:(id)a3;
- (void)setSnapshotTransformerStore:(id)a3;
@end

@implementation DBGDataCoordinator

+ (id)coordinatorWithDataSourceConnection:(id)a3
{
  id v4 = a3;
  id v5 = [objc_alloc((Class)a1) initWithDataSourceConnection:v4];

  return v5;
}

- (DBGDataCoordinator)initWithDataSourceConnection:(id)a3
{
  id v5 = a3;
  v13.receiver = self;
  v13.super_class = (Class)&OBJC_CLASS___DBGDataCoordinator;
  v6 = -[DBGDataCoordinator init](&v13, "init");
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_dataSourceConnection, a3);
    -[DBGDataSourceConnection setDelegate:](v7->_dataSourceConnection, "setDelegate:", v7);
    uint64_t v8 = objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
    enqueuedRequests = v7->_enqueuedRequests;
    v7->_enqueuedRequests = (NSMutableArray *)v8;

    v7->_shouldStoreCompletedRequests = 0;
    uint64_t v10 = objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
    completedRequests = v7->_completedRequests;
    v7->_completedRequests = (NSMutableArray *)v10;
  }

  return v7;
}

- (void)performRequest:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    if (DebugHierarchyPOIOSLog___dvt_lazy_init_predicate != -1) {
      dispatch_once(&DebugHierarchyPOIOSLog___dvt_lazy_init_predicate, &__block_literal_global_2);
    }
    id v5 = (os_log_s *)(id)DebugHierarchyPOIOSLog___dvt_lazy_init_variable;
    pid_t v6 = getpid();
    if ((v6 - 1) <= 0xFFFFFFFD)
    {
      pid_t v7 = v6;
      if (os_signpost_enabled(v5))
      {
        uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v4 name]);
        int v24 = 138543362;
        v25 = v8;
        _os_signpost_emit_with_name_impl( &dword_0,  v5,  OS_SIGNPOST_EVENT,  v7,  "Equeue Request",  "%{public}@",  (uint8_t *)&v24,  0xCu);
      }
    }

    v9 = (void *)objc_claimAutoreleasedReturnValue(-[DBGDataCoordinator enqueuedRequests](self, "enqueuedRequests"));
    unsigned __int8 v10 = [v9 containsObject:v4];

    if ((v10 & 1) == 0)
    {
      v11 = (void *)objc_claimAutoreleasedReturnValue(-[DBGDataCoordinator enqueuedRequests](self, "enqueuedRequests"));
      v12 = (char *)[v11 count];

      if (![v4 priority])
      {
        v15 = (void *)objc_claimAutoreleasedReturnValue(-[DBGDataCoordinator enqueuedRequests](self, "enqueuedRequests"));
        id v16 = [v15 count];

        if (v16)
        {
          v17 = (void *)objc_claimAutoreleasedReturnValue(-[DBGDataCoordinator enqueuedRequests](self, "enqueuedRequests"));
          id v18 = [v17 count];

          if (v18)
          {
            v19 = 0LL;
            do
            {
              v20 = (void *)objc_claimAutoreleasedReturnValue(-[DBGDataCoordinator enqueuedRequests](self, "enqueuedRequests"));
              v21 = (void *)objc_claimAutoreleasedReturnValue([v20 objectAtIndexedSubscript:v19]);

              ++v19;
              v22 = (void *)objc_claimAutoreleasedReturnValue(-[DBGDataCoordinator enqueuedRequests](self, "enqueuedRequests"));
              v23 = (char *)[v22 count];
            }

            while (v23 > v19);
          }
        }
      }

      -[DBGDataCoordinator willChangeValueForKey:](self, "willChangeValueForKey:", @"enqueuedRequests");
      objc_super v13 = (void *)objc_claimAutoreleasedReturnValue(-[DBGDataCoordinator enqueuedRequests](self, "enqueuedRequests"));
      [v13 insertObject:v4 atIndex:v12];

      -[DBGDataCoordinator didChangeValueForKey:](self, "didChangeValueForKey:", @"enqueuedRequests");
    }

    v14 = (void *)objc_claimAutoreleasedReturnValue(-[DBGDataCoordinator executingRequest](self, "executingRequest"));

    if (!v14) {
      -[DBGDataCoordinator _performNextRequest](self, "_performNextRequest");
    }
  }
}

- (void)_performNextRequest
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[DBGDataCoordinator enqueuedRequests](self, "enqueuedRequests"));
  id v6 = (id)objc_claimAutoreleasedReturnValue([v3 firstObject]);

  if (v6)
  {
    -[DBGDataCoordinator willChangeValueForKey:](self, "willChangeValueForKey:", @"enqueuedRequests");
    id v4 = (void *)objc_claimAutoreleasedReturnValue(-[DBGDataCoordinator enqueuedRequests](self, "enqueuedRequests"));
    [v4 removeObjectAtIndex:0];

    -[DBGDataCoordinator didChangeValueForKey:](self, "didChangeValueForKey:", @"enqueuedRequests");
    -[DBGDataCoordinator setExecutingRequest:](self, "setExecutingRequest:", v6);
    id v5 = (void *)objc_claimAutoreleasedReturnValue(-[DBGDataCoordinator dataSourceConnection](self, "dataSourceConnection"));
    [v5 performRequest:v6];
  }
}

- (void)cancelRequest:(id)a3
{
  id v8 = a3;
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[DBGDataCoordinator executingRequest](self, "executingRequest"));
  unsigned int v5 = [v4 isEqual:v8];

  if (v5)
  {
    id v6 = (void *)objc_claimAutoreleasedReturnValue(-[DBGDataCoordinator executingRequest](self, "executingRequest"));
    [v6 cancel];

    -[DBGDataCoordinator setExecutingRequest:](self, "setExecutingRequest:", 0LL);
  }

  else
  {
    -[DBGDataCoordinator willChangeValueForKey:](self, "willChangeValueForKey:", @"enqueuedRequests");
    pid_t v7 = (void *)objc_claimAutoreleasedReturnValue(-[DBGDataCoordinator enqueuedRequests](self, "enqueuedRequests"));
    [v7 removeObject:v8];

    -[DBGDataCoordinator didChangeValueForKey:](self, "didChangeValueForKey:", @"enqueuedRequests");
    [v8 cancel];
  }
}

- (void)cancelAllRequests
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[DBGDataCoordinator executingRequest](self, "executingRequest"));
  -[DBGDataCoordinator cancelRequest:](self, "cancelRequest:", v3);

  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[DBGDataCoordinator enqueuedRequests](self, "enqueuedRequests"));
  id v5 = [v4 copy];

  __int128 v13 = 0u;
  __int128 v14 = 0u;
  __int128 v11 = 0u;
  __int128 v12 = 0u;
  id v6 = v5;
  id v7 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v12;
    do
    {
      unsigned __int8 v10 = 0LL;
      do
      {
        if (*(void *)v12 != v9) {
          objc_enumerationMutation(v6);
        }
        -[DBGDataCoordinator cancelRequest:]( self,  "cancelRequest:",  *(void *)(*((void *)&v11 + 1) + 8LL * (void)v10),  (void)v11);
        unsigned __int8 v10 = (char *)v10 + 1;
      }

      while (v8 != v10);
      id v8 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }

    while (v8);
  }
}

- (void)addSnapshotTransformer:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[DBGDataCoordinator snapshotTransformerStore](self, "snapshotTransformerStore"));

  if (!v5)
  {
    id v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithCapacity:](&OBJC_CLASS___NSMutableArray, "arrayWithCapacity:", 1LL));
    -[DBGDataCoordinator setSnapshotTransformerStore:](self, "setSnapshotTransformerStore:", v6);
  }

  id v7 = (id)objc_claimAutoreleasedReturnValue(-[DBGDataCoordinator snapshotTransformerStore](self, "snapshotTransformerStore"));
  [v7 addObject:v4];
}

- (NSArray)snapshotTransformers
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[DBGDataCoordinator snapshotTransformerStore](self, "snapshotTransformerStore"));
  id v3 = [v2 copy];

  return (NSArray *)v3;
}

- (void)didReceiveData:(id)a3 forRequest:(id)a4
{
  id v9 = a4;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[DBGDataCoordinator executingRequest](self, "executingRequest"));
  unsigned int v6 = [v9 isEqual:v5];

  if (v6)
  {
    unsigned int v7 = -[DBGDataCoordinator shouldStoreCompletedRequests](self, "shouldStoreCompletedRequests");
    if (v9 && v7)
    {
      id v8 = (void *)objc_claimAutoreleasedReturnValue(-[DBGDataCoordinator completedRequests](self, "completedRequests"));
      [v8 addObject:v9];
    }

    -[DBGDataCoordinator setExecutingRequest:](self, "setExecutingRequest:", 0LL);
    -[DBGDataCoordinator _performNextRequest](self, "_performNextRequest");
  }
}

- (DBGSnapshotManager)snapshotManager
{
  return (DBGSnapshotManager *)objc_loadWeakRetained((id *)&self->_snapshotManager);
}

- (void)setSnapshotManager:(id)a3
{
}

- (DBGDataSourceConnection)dataSourceConnection
{
  return (DBGDataSourceConnection *)objc_getProperty(self, a2, 24LL, 1);
}

- (void)setDataSourceConnection:(id)a3
{
}

- (BOOL)shouldStoreCompletedRequests
{
  return self->_shouldStoreCompletedRequests;
}

- (void)setShouldStoreCompletedRequests:(BOOL)a3
{
  self->_shouldStoreCompletedRequests = a3;
}

- (NSMutableArray)completedRequests
{
  return (NSMutableArray *)objc_getProperty(self, a2, 32LL, 1);
}

- (NSMutableArray)snapshotTransformerStore
{
  return (NSMutableArray *)objc_getProperty(self, a2, 40LL, 1);
}

- (void)setSnapshotTransformerStore:(id)a3
{
}

- (NSMutableArray)enqueuedRequests
{
  return (NSMutableArray *)objc_getProperty(self, a2, 48LL, 1);
}

- (void)setEnqueuedRequests:(id)a3
{
}

- (DebugHierarchyRequest)executingRequest
{
  return (DebugHierarchyRequest *)objc_getProperty(self, a2, 56LL, 1);
}

- (void)setExecutingRequest:(id)a3
{
}

- (void).cxx_destruct
{
}

@end