@interface TBCoreDataSource
- (BOOL)_canSupportRequest:(id)a3;
- (BOOL)hasStorageError;
- (NSManagedObjectContext)context;
- (TBCoreDataSource)initWithStoreDescriptor:(id)a3;
- (TBCoreDataStoreDescriptor)descriptor;
- (TBPersistenceManager)persistenceManager;
- (unint64_t)cacheExpirationInDays;
- (unint64_t)type;
- (void)_createNewNetwork:(id)a3 tile:(id)a4 withMOC:(id)a5;
- (void)_createNewNetworkFromDictionary:(id)a3 withMOC:(id)a4;
- (void)_executeFetchRequest:(id)a3;
- (void)_executePreferLocalFetchRequest:(id)a3;
- (void)cacheFetchResponse:(id)a3 completionHandler:(id)a4;
- (void)executeFetchRequest:(id)a3;
- (void)importObjectsWithArray:(id)a3 completionHandler:(id)a4;
- (void)prune3BarsNetworks:(unint64_t)a3 completionHandler:(id)a4;
- (void)removeAllWithCompletionHandler:(id)a3;
- (void)removeWithFetchRequest:(id)a3 completionHandler:(id)a4;
- (void)setCacheExpirationInDays:(unint64_t)a3;
- (void)setContext:(id)a3;
- (void)setDescriptor:(id)a3;
- (void)setHasStorageError:(BOOL)a3;
- (void)setPersistenceManager:(id)a3;
@end

@implementation TBCoreDataSource

- (TBCoreDataSource)initWithStoreDescriptor:(id)a3
{
  v4 = (TBCoreDataStoreDescriptor *)a3;
  v33.receiver = self;
  v33.super_class = (Class)&OBJC_CLASS___TBCoreDataSource;
  v5 = -[TBCoreDataSource init](&v33, sel_init);
  descriptor = v5->_descriptor;
  v5->_descriptor = v4;
  v7 = v4;

  id v8 = objc_alloc(MEMORY[0x189602510]);
  v9 = -[TBCoreDataStoreDescriptor modelURL](v7, "modelURL");
  v10 = (void *)[v8 initWithContentsOfURL:v9];

  v11 = -[TBPersistenceManager initWithManagedObjectModel:storeDescriptor:]( objc_alloc(&OBJC_CLASS___TBPersistenceManager),  "initWithManagedObjectModel:storeDescriptor:",  v10,  v7);
  persistenceManager = v5->_persistenceManager;
  v5->_persistenceManager = v11;

  v13 = v5->_persistenceManager;
  uint64_t v14 = MEMORY[0x1895F87A8];
  v31[0] = MEMORY[0x1895F87A8];
  v31[1] = 3221225472LL;
  v31[2] = __44__TBCoreDataSource_initWithStoreDescriptor___block_invoke;
  v31[3] = &unk_18A16D930;
  v15 = v5;
  v32 = v15;
  -[TBPersistenceManager addPersistentStorage:completionHandler:]( v13,  "addPersistentStorage:completionHandler:",  v7,  v31);
  v16 = -[TBCoreDataStoreDescriptor modelURL](v7, "modelURL");
  NSLog(@"%s: object model at URL: %@", "-[TBCoreDataSource initWithStoreDescriptor:]", v16);
  v17 = -[TBCoreDataStoreDescriptor storeURL](v7, "storeURL");
  NSLog(@"%s: store URL: %@", "-[TBCoreDataSource initWithStoreDescriptor:]", v17);

  v18 = (NSManagedObjectContext *)[objc_alloc(MEMORY[0x189602500]) initWithConcurrencyType:1];
  [MEMORY[0x189602520] mergeByPropertyObjectTrumpMergePolicy];
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSManagedObjectContext setMergePolicy:](v18, "setMergePolicy:", v19);
  v20 = -[TBPersistenceManager persistenceCoordinator](v5->_persistenceManager, "persistenceCoordinator");
  -[NSManagedObjectContext setPersistentStoreCoordinator:](v18, "setPersistentStoreCoordinator:", v20);

  [MEMORY[0x1896079D8] processInfo];
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  [v21 processName];
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSManagedObjectContext setTransactionAuthor:](v18, "setTransactionAuthor:", v22);

  context = v15->_context;
  v15->_context = v18;
  v24 = v18;

  v29[0] = v14;
  v29[1] = 3221225472LL;
  v29[2] = __44__TBCoreDataSource_initWithStoreDescriptor___block_invoke_2;
  v29[3] = &unk_18A16D800;
  v25 = v15;
  v30 = v25;
  +[WCAFetchWiFiBehaviorParameters fetchWiFiBehaviorWithCompletion:]( &OBJC_CLASS___WCAFetchWiFiBehaviorParameters,  "fetchWiFiBehaviorWithCompletion:",  v29);
  v26 = v30;
  v27 = v25;

  return v27;
}

void __44__TBCoreDataSource_initWithStoreDescriptor___block_invoke(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    NSLog( @"%s: add the persistent storage error %@",  "-[TBCoreDataSource initWithStoreDescriptor:]_block_invoke",  a2);
    *(_BYTE *)(*(void *)(a1 + 32) + 16LL) = 1;
  }

void __44__TBCoreDataSource_initWithStoreDescriptor___block_invoke_2(uint64_t a1, void *a2)
{
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v5 = v3;
    [v3 valueForKey:@"kWiFiCoreDataSourceExpirationDays"];
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    *(void *)(*(void *)(a1 + 32) + 24) = (int)[v4 intValue];

    v3 = v5;
  }

  else
  {
    *(void *)(*(void *)(a1 + 32) + 24LL) = 7LL;
  }
}

- (unint64_t)type
{
  return 0LL;
}

- (void)executeFetchRequest:(id)a3
{
  id v4 = a3;
  if ([v4 sourcePolicy] == 3) {
    -[TBCoreDataSource _executePreferLocalFetchRequest:](self, "_executePreferLocalFetchRequest:", v4);
  }
  else {
    -[TBCoreDataSource _executeFetchRequest:](self, "_executeFetchRequest:", v4);
  }
}

- (void)_executePreferLocalFetchRequest:(id)a3
{
  id v4 = a3;
  [v4 descriptor];
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  [v5 preferLocalFetchDescriptor];
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  [v6 fetchRequest];
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[TBCoreDataSource context](self, "context");
  id v8 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1895F87A8];
  v11[1] = 3221225472LL;
  v11[2] = __52__TBCoreDataSource__executePreferLocalFetchRequest___block_invoke;
  v11[3] = &unk_18A16D218;
  v11[4] = self;
  id v12 = v7;
  id v13 = v4;
  id v9 = v4;
  id v10 = v7;
  [v8 performBlock:v11];
}

void __52__TBCoreDataSource__executePreferLocalFetchRequest___block_invoke(uint64_t a1)
{
  v21[1] = *MEMORY[0x1895F89C0];
  [*(id *)(a1 + 32) context];
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v3 = *(void *)(a1 + 40);
  id v17 = 0LL;
  [v2 executeFetchRequest:v3 error:&v17];
  id v4 = (void *)objc_claimAutoreleasedReturnValue();
  id v5 = v17;

  if (v5)
  {
    NSLog(@"%s: error %@", "-[TBCoreDataSource _executePreferLocalFetchRequest:]_block_invoke", v5);
    v6 = *(void **)(a1 + 48);
    +[TBErrorFetchResponse responseWithError:](&OBJC_CLASS___TBErrorFetchResponse, "responseWithError:", v5);
    v7 = (TBError *)objc_claimAutoreleasedReturnValue();
    [v6 handleResponse:v7];
LABEL_11:

    goto LABEL_12;
  }

  if (![v4 count])
  {
    id v10 = objc_alloc(&OBJC_CLASS___TBError);
    uint64_t v20 = *MEMORY[0x1896075E0];
    v21[0] = @"pref local cache doesn't satisfy request (0 results)";
    [MEMORY[0x189603F68] dictionaryWithObjects:v21 forKeys:&v20 count:1];
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    id v12 = v10;
    uint64_t v13 = 103LL;
LABEL_10:
    v7 = -[TBError initWithType:userInfo:](v12, "initWithType:userInfo:", v13, v11);

    v15 = *(void **)(a1 + 48);
    v16 = +[TBErrorFetchResponse responseWithError:](&OBJC_CLASS___TBErrorFetchResponse, "responseWithError:", v7);
    [v15 handleResponse:v16];

    goto LABEL_11;
  }

  if ((objc_opt_respondsToSelector() & 1) != 0) {
    [*(id *)(a1 + 48) handlePreferLocalResponse:v4];
  }
  [*(id *)(a1 + 48) preferLocalHandler];
  id v8 = (uint64_t (**)(void, void))objc_claimAutoreleasedReturnValue();
  int v9 = ((uint64_t (**)(void, void *))v8)[2](v8, v4);

  if (!v9)
  {
    uint64_t v14 = objc_alloc(&OBJC_CLASS___TBError);
    uint64_t v18 = *MEMORY[0x1896075E0];
    v19 = @"pref local cache doesn't satisfy request (1 or more missing results)";
    [MEMORY[0x189603F68] dictionaryWithObjects:&v19 forKeys:&v18 count:1];
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    id v12 = v14;
    uint64_t v13 = 102LL;
    goto LABEL_10;
  }

  NSLog( @"%s: local results satisfy request (count %lu)",  "-[TBCoreDataSource _executePreferLocalFetchRequest:]_block_invoke",  [v4 count]);
  [*(id *)(a1 + 32) _executeFetchRequest:*(void *)(a1 + 48)];
LABEL_12:
}

- (void)_executeFetchRequest:(id)a3
{
  v40[1] = *MEMORY[0x1895F89C0];
  id v4 = a3;
  if (-[TBCoreDataSource _canSupportRequest:](self, "_canSupportRequest:", v4))
  {
    if (-[TBCoreDataSource hasStorageError](self, "hasStorageError"))
    {
      id v5 = objc_alloc(&OBJC_CLASS___TBError);
      uint64_t v37 = *MEMORY[0x1896075E0];
      v38 = @"Failed to add persistent store.";
      [MEMORY[0x189603F68] dictionaryWithObjects:&v38 forKeys:&v37 count:1];
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = -[TBError initWithType:userInfo:](v5, "initWithType:userInfo:", 104LL, v6);

      +[TBErrorFetchResponse responseWithError:](&OBJC_CLASS___TBErrorFetchResponse, "responseWithError:", v7);
      id v8 = (void *)objc_claimAutoreleasedReturnValue();
      [v4 handleResponse:v8];
    }

    else
    {
      [v4 descriptor];
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      [v11 localFetchDescriptor];
      id v12 = (void *)objc_claimAutoreleasedReturnValue();
      [v12 fetchRequest];
      v7 = (TBError *)objc_claimAutoreleasedReturnValue();

      if (v7)
      {
        uint64_t v13 = mach_absolute_time();
        uint64_t v31 = 0LL;
        v32 = &v31;
        uint64_t v33 = 0x2020000000LL;
        uint64_t v34 = 0LL;
        uint64_t v25 = 0LL;
        v26 = &v25;
        uint64_t v27 = 0x3032000000LL;
        v28 = __Block_byref_object_copy__4;
        v29 = __Block_byref_object_dispose__4;
        id v30 = 0LL;
        [v4 descriptor];
        uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue();
        BOOL v15 = [v14 type] == 1;

        if (v15)
        {
          -[TBError setResultType:](v7, "setResultType:", 2LL);
          -[TBError setPropertiesToFetch:](v7, "setPropertiesToFetch:", &unk_18A1B5768);
          -[TBError setAllocationType:](v7, "setAllocationType:", 1LL);
          v16 = -[TBCoreDataSource context](self, "context");
          v24[0] = MEMORY[0x1895F87A8];
          v24[1] = 3221225472LL;
          v24[2] = __41__TBCoreDataSource__executeFetchRequest___block_invoke;
          v24[3] = &unk_18A16D958;
          id v17 = v24;
          v24[4] = self;
          v24[5] = v7;
          v24[7] = &v25;
          v24[6] = v4;
          v24[8] = &v31;
          [v16 performBlockAndWait:v24];
        }

        else
        {
          v16 = -[TBCoreDataSource context](self, "context");
          v23[0] = MEMORY[0x1895F87A8];
          v23[1] = 3221225472LL;
          v23[2] = __41__TBCoreDataSource__executeFetchRequest___block_invoke_2;
          v23[3] = &unk_18A16D980;
          id v17 = v23;
          v23[4] = self;
          v23[5] = v7;
          v23[6] = v4;
          v23[7] = &v31;
          [v16 performBlockAndWait:v23];
        }

        uint64_t v21 = mach_absolute_time();
        double v22 = MachTimeToSecs(v21 - v13);
        NSLog( @"%s: fetched %lu results in %gs",  "-[TBCoreDataSource _executeFetchRequest:]",  v32[3],  *(void *)&v22);
        -[TBDataSource submitAnalyticsEventForFetchRequest:duration:error:resultCount:]( self,  "submitAnalyticsEventForFetchRequest:duration:error:resultCount:",  v4,  v26[5],  v32[3],  v22);
        _Block_object_dispose(&v25, 8);

        _Block_object_dispose(&v31, 8);
      }

      else
      {
        uint64_t v35 = *MEMORY[0x1896075E0];
        v36 = @"localFetchDescriptor is nil";
        [MEMORY[0x189603F68] dictionaryWithObjects:&v36 forKeys:&v35 count:1];
        uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = +[TBError fetchMissingParametersErrorWithUserInfo:]( &OBJC_CLASS___TBError,  "fetchMissingParametersErrorWithUserInfo:",  v18);
        +[TBErrorFetchResponse responseWithError:](&OBJC_CLASS___TBErrorFetchResponse, "responseWithError:", v19);
        uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue();
        [v4 handleResponse:v20];
      }
    }
  }

  else
  {
    uint64_t v39 = *MEMORY[0x1896075E0];
    v40[0] = @"unhandled fetch request type";
    [MEMORY[0x189603F68] dictionaryWithObjects:v40 forKeys:&v39 count:1];
    int v9 = (void *)objc_claimAutoreleasedReturnValue();
    +[TBError fetchMissingParametersErrorWithUserInfo:]( &OBJC_CLASS___TBError,  "fetchMissingParametersErrorWithUserInfo:",  v9);
    v7 = (TBError *)objc_claimAutoreleasedReturnValue();

    +[TBErrorFetchResponse responseWithError:](&OBJC_CLASS___TBErrorFetchResponse, "responseWithError:", v7);
    id v10 = (void *)objc_claimAutoreleasedReturnValue();
    [v4 handleResponse:v10];
  }
}

void __41__TBCoreDataSource__executeFetchRequest___block_invoke(uint64_t a1)
{
  uint64_t v40 = *MEMORY[0x1895F89C0];
  [*(id *)(a1 + 32) context];
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v3 = *(void *)(a1 + 40);
  uint64_t v4 = *(void *)(*(void *)(a1 + 56) + 8LL);
  id obj = *(id *)(v4 + 40);
  [v2 executeFetchRequest:v3 error:&obj];
  id v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_storeStrong((id *)(v4 + 40), obj);

  uint64_t v6 = *(void *)(*(void *)(*(void *)(a1 + 56) + 8LL) + 40LL);
  if (v6)
  {
    NSLog( @"%s: failed fetch for access points with error %@",  "-[TBCoreDataSource _executeFetchRequest:]_block_invoke",  v6);
    v7 = *(void **)(a1 + 48);
    +[TBErrorFetchResponse responseWithError:]( &OBJC_CLASS___TBErrorFetchResponse,  "responseWithError:",  *(void *)(*(void *)(*(void *)(a1 + 56) + 8LL) + 40LL));
    id v8 = (void *)objc_claimAutoreleasedReturnValue();
    [v7 handleResponse:v8];
  }

  else
  {
    +[TBNetworkMO fetchRequest](&OBJC_CLASS___TBNetworkMO, "fetchRequest");
    id v8 = (void *)objc_claimAutoreleasedReturnValue();
    int v9 = (void *)MEMORY[0x1896079C8];
    [v5 valueForKey:@"network"];
    id v10 = (void *)objc_claimAutoreleasedReturnValue();
    [v9 predicateWithFormat:@"self IN %@", v10];
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    [v8 setPredicate:v11];

    [v8 setReturnsObjectsAsFaults:0];
    [*(id *)(a1 + 32) context];
    id v12 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v13 = *(void *)(*(void *)(a1 + 56) + 8LL);
    id v37 = *(id *)(v13 + 40);
    [v12 executeFetchRequest:v8 error:&v37];
    uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_storeStrong((id *)(v13 + 40), v37);

    uint64_t v15 = *(void *)(*(void *)(*(void *)(a1 + 56) + 8LL) + 40LL);
    if (!v14 || v15)
    {
      NSLog( @"%s: failed fetch for networks with error %@",  "-[TBCoreDataSource _executeFetchRequest:]_block_invoke",  v15);
      v28 = *(void **)(a1 + 48);
      v16 = +[TBErrorFetchResponse responseWithError:]( &OBJC_CLASS___TBErrorFetchResponse,  "responseWithError:",  *(void *)(*(void *)(*(void *)(a1 + 56) + 8LL) + 40LL));
      [v28 handleResponse:v16];
    }

    else
    {
      v29 = v14;
      id v30 = v8;
      [MEMORY[0x189603FC8] dictionary];
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      __int128 v33 = 0u;
      __int128 v34 = 0u;
      __int128 v35 = 0u;
      __int128 v36 = 0u;
      uint64_t v31 = v5;
      id v32 = v5;
      uint64_t v17 = [v32 countByEnumeratingWithState:&v33 objects:v39 count:16];
      if (v17)
      {
        uint64_t v18 = v17;
        uint64_t v19 = *(void *)v34;
        do
        {
          for (uint64_t i = 0LL; i != v18; ++i)
          {
            if (*(void *)v34 != v19) {
              objc_enumerationMutation(v32);
            }
            uint64_t v21 = *(void **)(*((void *)&v33 + 1) + 8 * i);
            [v21 objectForKey:@"bssid"];
            double v22 = (void *)objc_claimAutoreleasedReturnValue();
            [v21 objectForKey:@"network"];
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            [*(id *)(a1 + 32) context];
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            [v24 objectWithID:v23];
            uint64_t v25 = (void *)objc_claimAutoreleasedReturnValue();
            [v16 setObject:v25 forKey:v22];
          }

          uint64_t v18 = [v32 countByEnumeratingWithState:&v33 objects:v39 count:16];
        }

        while (v18);
      }

      *(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = [v16 count];
      v26 = *(void **)(a1 + 48);
      +[TBLocalFetchResponse responseWithResultsByBSSID:]( &OBJC_CLASS___TBLocalFetchResponse,  "responseWithResultsByBSSID:",  v16);
      uint64_t v27 = (void *)objc_claimAutoreleasedReturnValue();
      [v26 handleResponse:v27];

      id v8 = v30;
      id v5 = v31;
      uint64_t v14 = v29;
    }
  }
}

void __41__TBCoreDataSource__executeFetchRequest___block_invoke_2(uint64_t a1)
{
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v3 = *(void *)(a1 + 40);
  id v10 = 0LL;
  [v2 executeFetchRequest:v3 error:&v10];
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue();
  id v5 = v10;

  if (v5)
  {
    NSLog(@"%s: error %@", "-[TBCoreDataSource _executeFetchRequest:]_block_invoke_2", v5);
    uint64_t v6 = *(void **)(a1 + 48);
    v7 = +[TBErrorFetchResponse responseWithError:](&OBJC_CLASS___TBErrorFetchResponse, "responseWithError:", v5);
    [v6 handleResponse:v7];
  }

  else
  {
    *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = [v4 count];
    id v8 = *(void **)(a1 + 48);
    [*(id *)(a1 + 40) entity];
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v9 = +[TBLocalFetchResponse responseWithResults:entityDescription:]( &OBJC_CLASS___TBLocalFetchResponse,  "responseWithResults:entityDescription:",  v4,  v7);
    [v8 handleResponse:v9];

    id v5 = (id)v9;
  }
}

- (BOOL)_canSupportRequest:(id)a3
{
  id v3 = a3;
  [v3 descriptor];
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ([v4 type] == 1)
  {
    BOOL v5 = 1;
  }

  else
  {
    [v3 descriptor];
    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
    if ([v6 type] == 2)
    {
      BOOL v5 = 1;
    }

    else
    {
      [v3 descriptor];
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      BOOL v5 = [v7 type] == 3;
    }
  }

  return v5;
}

- (void)cacheFetchResponse:(id)a3 completionHandler:(id)a4
{
  uint64_t v128 = *MEMORY[0x1895F89C0];
  id v5 = a3;
  v71 = (void (**)(id, void *))a4;
  v66 = v5;
  NSLog(@"%s: caching response %@", "-[TBCoreDataSource cacheFetchResponse:completionHandler:]", v5);
  v65 = (void *)os_transaction_create();
  [v5 error];
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    [v5 error];
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    NSLog(@"%s: error %@", "-[TBCoreDataSource cacheFetchResponse:completionHandler:]", v7);

    if (v71)
    {
      [v5 error];
      id v8 = (void *)objc_claimAutoreleasedReturnValue();
      v71[2](v71, v8);
    }
  }

  else
  {
    v64 = (void *)[objc_alloc(MEMORY[0x189602500]) initWithConcurrencyType:1];
    -[TBCoreDataSource persistenceManager](self, "persistenceManager");
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue();
    [v9 persistenceCoordinator];
    id v10 = (void *)objc_claimAutoreleasedReturnValue();
    [v64 setPersistentStoreCoordinator:v10];

    [MEMORY[0x189603F50] date];
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "dateByAddingDays:", --[TBCoreDataSource cacheExpirationInDays](self, "cacheExpirationInDays"));
    v63 = (void *)objc_claimAutoreleasedReturnValue();

    [v66 tiles];
    id v12 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v13 = [v12 count];

    if (v13)
    {
      [MEMORY[0x1896079C8] predicateWithFormat:@"(created < %@)", v63];
      v62 = (void *)objc_claimAutoreleasedReturnValue();
      +[TBTileMO removeTilesUsingPredicate:moc:](&OBJC_CLASS___TBTileMO, "removeTilesUsingPredicate:moc:", v62, v64);
      uint64_t v14 = (void *)MEMORY[0x189603FA8];
      [v66 tiles];
      uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "arrayWithCapacity:", objc_msgSend(v15, "count"));
      v70 = (void *)objc_claimAutoreleasedReturnValue();

      __int128 v122 = 0u;
      __int128 v123 = 0u;
      __int128 v120 = 0u;
      __int128 v121 = 0u;
      [v66 tiles];
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      uint64_t v17 = [v16 countByEnumeratingWithState:&v120 objects:v127 count:16];
      if (v17)
      {
        uint64_t v18 = *(void *)v121;
        do
        {
          for (uint64_t i = 0LL; i != v17; ++i)
          {
            if (*(void *)v121 != v18) {
              objc_enumerationMutation(v16);
            }
            uint64_t v20 = (void *)MEMORY[0x189607968];
            [*(id *)(*((void *)&v120 + 1) + 8 * i) tile];
            uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v20, "numberWithLongLong:", objc_msgSend(v21, "key"));
            double v22 = (void *)objc_claimAutoreleasedReturnValue();
            [v70 addObject:v22];
          }

          uint64_t v17 = [v16 countByEnumeratingWithState:&v120 objects:v127 count:16];
        }

        while (v17);
      }

      [MEMORY[0x1896079C8] predicateWithFormat:@"(key IN %@)", v70];
      v61 = (void *)objc_claimAutoreleasedReturnValue();
      +[TBTileMO removeTilesUsingPredicate:moc:](&OBJC_CLASS___TBTileMO, "removeTilesUsingPredicate:moc:", v61, v64);
      v118[0] = MEMORY[0x1895F87A8];
      v118[1] = 3221225472LL;
      v118[2] = __57__TBCoreDataSource_cacheFetchResponse_completionHandler___block_invoke;
      v118[3] = &unk_18A16C770;
      id v23 = v64;
      id v119 = v23;
      [v23 performBlockAndWait:v118];
      [v66 tiles];
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      uint64_t v75 = [v24 count];

      __int128 v116 = 0u;
      __int128 v117 = 0u;
      __int128 v114 = 0u;
      __int128 v115 = 0u;
      [v66 tiles];
      id obj = (id)objc_claimAutoreleasedReturnValue();
      uint64_t v69 = [obj countByEnumeratingWithState:&v114 objects:v126 count:16];
      if (v69)
      {
        uint64_t v78 = 0LL;
        uint64_t v68 = *(void *)v115;
        do
        {
          uint64_t v25 = 0LL;
          do
          {
            if (*(void *)v115 != v68)
            {
              uint64_t v26 = v25;
              objc_enumerationMutation(obj);
              uint64_t v25 = v26;
            }

            uint64_t v72 = v25;
            uint64_t v27 = *(void **)(*((void *)&v114 + 1) + 8 * v25);
            context = (void *)MEMORY[0x1895BA820]();
            [v27 tile];
            v28 = (void *)objc_claimAutoreleasedReturnValue();
            v29 = +[TBTileMO generateNewTileObjectFromMOC:](&OBJC_CLASS___TBTileMO, "generateNewTileObjectFromMOC:", v23);
            objc_msgSend(v29, "setKey:", objc_msgSend(v28, "key"));
            [MEMORY[0x189603F50] date];
            id v30 = (void *)objc_claimAutoreleasedReturnValue();
            [v29 setCreated:v30];

            if ((objc_opt_respondsToSelector() & 1) != 0)
            {
              [v28 etag];
              uint64_t v31 = (void *)objc_claimAutoreleasedReturnValue();
              [v29 setEtag:v31];
            }

            else
            {
              NSLog( @"%s: tile (%@) doesn't respond to etag",  "-[TBCoreDataSource cacheFetchResponse:completionHandler:]",  v28);
            }

            [v27 networks];
            id v32 = (void *)objc_claimAutoreleasedReturnValue();
            uint64_t v33 = [v32 count];
            NSLog( @"%s: %ld results for tile[%ld] (key: %ld) available",  "-[TBCoreDataSource cacheFetchResponse:completionHandler:]",  v33,  v78++,  [v28 key]);
            uint64_t v108 = 0LL;
            v109 = &v108;
            uint64_t v110 = 0x3032000000LL;
            v111 = __Block_byref_object_copy__4;
            v112 = __Block_byref_object_dispose__4;
            id v113 = 0LL;
            if (v33)
            {
              if (v33 >= 1)
              {
                uint64_t v34 = 0LL;
                unint64_t v35 = 1LL;
                do
                {
                  [v32 objectAtIndexedSubscript:v34];
                  __int128 v36 = (void *)objc_claimAutoreleasedReturnValue();
                  -[TBCoreDataSource _createNewNetwork:tile:withMOC:]( self,  "_createNewNetwork:tile:withMOC:",  v36,  v29,  v23);
                  uint64_t v37 = v34 + 1;
                  if (100 * (v35 / 0x64) - 1 == v34 || v33 - 1 == v34)
                  {
                    NSLog( @"%s: Saving entries %ld of %ld",  "-[TBCoreDataSource cacheFetchResponse:completionHandler:]",  v34 + 1,  v33);
                    v98[0] = MEMORY[0x1895F87A8];
                    v98[1] = 3221225472LL;
                    v98[2] = __57__TBCoreDataSource_cacheFetchResponse_completionHandler___block_invoke_3;
                    v98[3] = &unk_18A16D9A8;
                    id v99 = v23;
                    v100 = &v108;
                    uint64_t v101 = v78;
                    uint64_t v102 = v75;
                    [v99 performBlockAndWait:v98];
                  }

                  ++v35;
                  ++v34;
                }

                while (v33 != v37);
              }
            }

            else
            {
              NSLog( @"%s: saving empty tile (key: %ld)",  "-[TBCoreDataSource cacheFetchResponse:completionHandler:]",  [v28 key]);
              v103[0] = MEMORY[0x1895F87A8];
              v103[1] = 3221225472LL;
              v103[2] = __57__TBCoreDataSource_cacheFetchResponse_completionHandler___block_invoke_2;
              v103[3] = &unk_18A16D9A8;
              id v104 = v23;
              v105 = &v108;
              uint64_t v106 = v78;
              uint64_t v107 = v75;
              [v104 performBlockAndWait:v103];
            }

            if (v71 && v78 == v75) {
              v71[2](v71, (void *)v109[5]);
            }
            _Block_object_dispose(&v108, 8);

            objc_autoreleasePoolPop(context);
            uint64_t v25 = v72 + 1;
          }

          while (v72 + 1 != v69);
          uint64_t v69 = [obj countByEnumeratingWithState:&v114 objects:v126 count:16];
        }

        while (v69);
      }
    }

    else
    {
      [v66 results];
      uint64_t v39 = (void *)objc_claimAutoreleasedReturnValue();
      uint64_t v40 = [v39 count];

      if (v40)
      {
        [MEMORY[0x189603FE0] set];
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        __int128 v96 = 0u;
        __int128 v97 = 0u;
        __int128 v94 = 0u;
        __int128 v95 = 0u;
        [v66 results];
        contexta = (void *)objc_claimAutoreleasedReturnValue();
        uint64_t v79 = [contexta countByEnumeratingWithState:&v94 objects:v125 count:16];
        if (v79)
        {
          uint64_t v76 = *(void *)v95;
          do
          {
            for (uint64_t j = 0LL; j != v79; ++j)
            {
              if (*(void *)v95 != v76) {
                objc_enumerationMutation(contexta);
              }
              v43 = *(void **)(*((void *)&v94 + 1) + 8 * j);
              __int128 v90 = 0u;
              __int128 v91 = 0u;
              __int128 v92 = 0u;
              __int128 v93 = 0u;
              [v43 accessPoints];
              v44 = (void *)objc_claimAutoreleasedReturnValue();
              uint64_t v45 = [v44 countByEnumeratingWithState:&v90 objects:v124 count:16];
              if (v45)
              {
                uint64_t v46 = *(void *)v91;
                do
                {
                  for (uint64_t k = 0LL; k != v45; ++k)
                  {
                    if (*(void *)v91 != v46) {
                      objc_enumerationMutation(v44);
                    }
                    v48 = *(void **)(*((void *)&v90 + 1) + 8 * k);
                    [v48 BSSID];
                    v49 = (void *)objc_claimAutoreleasedReturnValue();

                    if (v49)
                    {
                      [v48 BSSID];
                      v50 = (void *)objc_claimAutoreleasedReturnValue();
                      [v41 addObject:v50];
                    }

                    else
                    {
                      NSLog( @"%s: null BSSID for network %@",  "-[TBCoreDataSource cacheFetchResponse:completionHandler:]",  v43);
                    }
                  }

                  uint64_t v45 = [v44 countByEnumeratingWithState:&v90 objects:v124 count:16];
                }

                while (v45);
              }
            }

            uint64_t v79 = [contexta countByEnumeratingWithState:&v94 objects:v125 count:16];
          }

          while (v79);
        }
        v80 = +[TBAccessPointMO fetchRequest](&OBJC_CLASS___TBAccessPointMO, "fetchRequest");
        [v41 bssidPredicate];
        v51 = (void *)objc_claimAutoreleasedReturnValue();
        [v80 setPredicate:v51];

        v52 = (void *)[objc_alloc(MEMORY[0x1896024B0]) initWithFetchRequest:v80];
        v87[0] = MEMORY[0x1895F87A8];
        v87[1] = 3221225472LL;
        v87[2] = __57__TBCoreDataSource_cacheFetchResponse_completionHandler___block_invoke_4;
        v87[3] = &unk_18A16C748;
        id v53 = v64;
        id v88 = v53;
        id v77 = v52;
        id v89 = v77;
        [v53 performBlockAndWait:v87];
        [v66 results];
        v54 = (void *)objc_claimAutoreleasedReturnValue();
        uint64_t v55 = [v54 count];
        NSLog(@"%s: %ld results available", "-[TBCoreDataSource cacheFetchResponse:completionHandler:]", v55);
        uint64_t v56 = v55 - 1;
        if (v55 >= 1)
        {
          uint64_t v57 = 0LL;
          unint64_t v58 = 1LL;
          do
          {
            [v54 objectAtIndexedSubscript:v57];
            v59 = (void *)objc_claimAutoreleasedReturnValue();
            -[TBCoreDataSource _createNewNetwork:tile:withMOC:](self, "_createNewNetwork:tile:withMOC:", v59, 0LL, v53);
            uint64_t v60 = v57 + 1;
            if (v56 == v57 || 100 * (v58 / 0x64) - 1 == v57)
            {
              NSLog( @"%s: Saving entries %ld of %ld",  "-[TBCoreDataSource cacheFetchResponse:completionHandler:]",  v57 + 1,  v55);
              uint64_t v108 = 0LL;
              v109 = &v108;
              uint64_t v110 = 0x3032000000LL;
              v111 = __Block_byref_object_copy__4;
              v112 = __Block_byref_object_dispose__4;
              id v113 = 0LL;
              v82[0] = MEMORY[0x1895F87A8];
              v82[1] = 3221225472LL;
              v82[2] = __57__TBCoreDataSource_cacheFetchResponse_completionHandler___block_invoke_5;
              v82[3] = &unk_18A16D9A8;
              id v83 = v53;
              v84 = &v108;
              uint64_t v85 = v57 + 1;
              uint64_t v86 = v55;
              [v83 performBlockAndWait:v82];
              if (v71 && v56 == v57) {
                v71[2](v71, (void *)v109[5]);
              }

              _Block_object_dispose(&v108, 8);
            }

            ++v58;
            ++v57;
          }

          while (v55 != v60);
        }
      }

      else
      {
        NSLog( @"%s: empty results in response %@",  "-[TBCoreDataSource cacheFetchResponse:completionHandler:]",  v66);
        if (v71) {
          v71[2](v71, 0LL);
        }
      }
    }
  }
}

void __57__TBCoreDataSource_cacheFetchResponse_completionHandler___block_invoke(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  id v5 = 0LL;
  [v2 save:&v5];
  id v3 = v5;
  uint64_t v4 = v3;
  if (v3) {
    NSLog(@"save error %@", v3);
  }
  [*(id *)(a1 + 32) reset];
}

void __57__TBCoreDataSource_cacheFetchResponse_completionHandler___block_invoke_2(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8LL);
  id obj = *(id *)(v3 + 40);
  [v2 save:&obj];
  objc_storeStrong((id *)(v3 + 40), obj);
  if (*(void *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 40LL)) {
    NSLog(@"save error %@", *(void *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 40LL));
  }
  if (*(void *)(a1 + 48) == *(void *)(a1 + 56)) {
    [*(id *)(a1 + 32) reset];
  }
}

void __57__TBCoreDataSource_cacheFetchResponse_completionHandler___block_invoke_3(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8LL);
  id obj = *(id *)(v3 + 40);
  [v2 save:&obj];
  objc_storeStrong((id *)(v3 + 40), obj);
  if (*(void *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 40LL)) {
    NSLog(@"save error %@", *(void *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 40LL));
  }
  if (*(void *)(a1 + 48) == *(void *)(a1 + 56)) {
    [*(id *)(a1 + 32) reset];
  }
}

void __57__TBCoreDataSource_cacheFetchResponse_completionHandler___block_invoke_4(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  uint64_t v1 = *(void *)(a1 + 40);
  id v6 = 0LL;
  id v3 = (id)[v2 executeRequest:v1 error:&v6];
  id v4 = v6;
  id v5 = v4;
  if (v4) {
    NSLog( @"%s: ap delete error %@",  "-[TBCoreDataSource cacheFetchResponse:completionHandler:]_block_invoke_4",  v4);
  }
}

void __57__TBCoreDataSource_cacheFetchResponse_completionHandler___block_invoke_5(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8LL);
  id obj = *(id *)(v3 + 40);
  [v2 save:&obj];
  objc_storeStrong((id *)(v3 + 40), obj);
  if (*(void *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 40LL)) {
    NSLog(@"save error %@", *(void *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 40LL));
  }
  if (*(void *)(a1 + 48) == *(void *)(a1 + 56)) {
    [*(id *)(a1 + 32) reset];
  }
}

- (void)removeAllWithCompletionHandler:(id)a3
{
  id v4 = a3;
  id v5 = (void *)os_transaction_create();
  id v6 = (void *)[objc_alloc(MEMORY[0x189602500]) initWithConcurrencyType:1];
  v7 = -[TBCoreDataSource persistenceManager](self, "persistenceManager");
  [v7 persistenceCoordinator];
  id v8 = (void *)objc_claimAutoreleasedReturnValue();
  [v6 setPersistentStoreCoordinator:v8];

  NSLog(@"%s: removing all", "-[TBCoreDataSource removeAllWithCompletionHandler:]");
  +[TBNetworkMO removeAllNetworksInMOC:](&OBJC_CLASS___TBNetworkMO, "removeAllNetworksInMOC:", v6);
  +[TBTileMO removeAllTilesInMOC:](&OBJC_CLASS___TBTileMO, "removeAllTilesInMOC:", v6);
  v11[0] = MEMORY[0x1895F87A8];
  v11[1] = 3221225472LL;
  v11[2] = __51__TBCoreDataSource_removeAllWithCompletionHandler___block_invoke;
  v11[3] = &unk_18A16D150;
  id v12 = v6;
  id v13 = v4;
  id v9 = v4;
  id v10 = v6;
  [v10 performBlockAndWait:v11];
}

void __51__TBCoreDataSource_removeAllWithCompletionHandler___block_invoke(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  id v6 = 0LL;
  [v2 save:&v6];
  id v3 = v6;
  id v4 = v3;
  if (v3) {
    NSLog(@"save error %@", v3);
  }
  [*(id *)(a1 + 32) reset];
  uint64_t v5 = *(void *)(a1 + 40);
  if (v5) {
    (*(void (**)(uint64_t, void *))(v5 + 16))(v5, v4);
  }
}

- (void)prune3BarsNetworks:(unint64_t)a3 completionHandler:(id)a4
{
  id v6 = a4;
  v7 = -[TBCoreDataStoreDescriptor storeURL](self->_descriptor, "storeURL");
  [v7 path];
  id v8 = (void *)objc_claimAutoreleasedReturnValue();

  [MEMORY[0x1896078A8] defaultManager];
  id v9 = (void *)objc_claimAutoreleasedReturnValue();
  id v15 = 0LL;
  [v9 attributesOfItemAtPath:v8 error:&v15];
  id v10 = (void *)objc_claimAutoreleasedReturnValue();
  id v11 = v15;

  if (v10) {
    BOOL v12 = v11 == 0LL;
  }
  else {
    BOOL v12 = 0;
  }
  if (v12)
  {
    [v10 objectForKey:*MEMORY[0x189607548]];
    id v13 = (void *)objc_claimAutoreleasedReturnValue();
    unint64_t v14 = [v13 longLongValue];
    if (v14 > a3)
    {
      NSLog(@"Local store size %llu bytes exceeds imposed limit of %lu bytes, purging entire store", v14, a3);
      -[TBCoreDataSource removeAllWithCompletionHandler:](self, "removeAllWithCompletionHandler:", v6);
    }
  }

  else
  {
    NSLog(@"Failed to get attributes for storeURL with error %@", v11);
  }
}

- (void)removeWithFetchRequest:(id)a3 completionHandler:(id)a4
{
  v23[1] = *MEMORY[0x1895F89C0];
  id v5 = a3;
  [v5 descriptor];
  id v6 = (void *)objc_claimAutoreleasedReturnValue();
  [v6 localFetchDescriptor];
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  [v7 fetchRequest];
  id v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    NSLog( @"%s: removing all matching fetch request %@",  "-[TBCoreDataSource removeWithFetchRequest:completionHandler:]",  v8);
    id v9 = (void *)[objc_alloc(MEMORY[0x1896024B0]) initWithFetchRequest:v8];
    id v10 = (void *)[objc_alloc(MEMORY[0x189602500]) initWithConcurrencyType:1];
    -[TBCoreDataSource persistenceManager](self, "persistenceManager");
    id v11 = (void *)objc_claimAutoreleasedReturnValue();
    [v11 persistenceCoordinator];
    BOOL v12 = (void *)objc_claimAutoreleasedReturnValue();
    [v10 setPersistentStoreCoordinator:v12];

    v18[0] = MEMORY[0x1895F87A8];
    v18[1] = 3221225472LL;
    v18[2] = __61__TBCoreDataSource_removeWithFetchRequest_completionHandler___block_invoke;
    v18[3] = &unk_18A16D218;
    id v19 = v10;
    id v20 = v9;
    id v21 = v8;
    id v13 = v9;
    id v14 = v10;
    [v14 performBlockAndWait:v18];
  }

  else
  {
    uint64_t v22 = *MEMORY[0x1896075E0];
    v23[0] = @"localFetchDescriptor is nil";
    [MEMORY[0x189603F68] dictionaryWithObjects:v23 forKeys:&v22 count:1];
    id v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = +[TBError fetchMissingParametersErrorWithUserInfo:]( &OBJC_CLASS___TBError,  "fetchMissingParametersErrorWithUserInfo:",  v15);
    +[TBErrorFetchResponse responseWithError:](&OBJC_CLASS___TBErrorFetchResponse, "responseWithError:", v16);
    uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue();
    [v5 handleResponse:v17];
  }
}

void __61__TBCoreDataSource_removeWithFetchRequest_completionHandler___block_invoke(uint64_t a1)
{
  v2 = (void *)MEMORY[0x1895BA820]();
  id v3 = *(void **)(a1 + 32);
  uint64_t v4 = *(void *)(a1 + 40);
  id v10 = 0LL;
  id v5 = (id)[v3 executeRequest:v4 error:&v10];
  id v6 = v10;
  v7 = v6;
  if (v6)
  {
    NSLog(@"%s: error %@", "-[TBCoreDataSource removeWithFetchRequest:completionHandler:]_block_invoke", v6);
  }

  else
  {
    [*(id *)(a1 + 48) entityName];
    id v8 = (void *)objc_claimAutoreleasedReturnValue();
    [*(id *)(a1 + 48) predicate];
    id v9 = (void *)objc_claimAutoreleasedReturnValue();
    NSLog( @"%s: Removed items (%@) that match supplied predicate <%@>",  "-[TBCoreDataSource removeWithFetchRequest:completionHandler:]_block_invoke",  v8,  v9);
  }

  objc_autoreleasePoolPop(v2);
}

- (void)_createNewNetwork:(id)a3 tile:(id)a4 withMOC:(id)a5
{
  uint64_t v46 = *MEMORY[0x1895F89C0];
  id v7 = a3;
  id v38 = a4;
  id v8 = a5;
  context = (void *)MEMORY[0x1895BA820]();
  uint64_t v40 = v8;
  +[TBNetworkMO generateNewNetworkObjectFromMOC:](&OBJC_CLASS___TBNetworkMO, "generateNewNetworkObjectFromMOC:", v8);
  id v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setAuthMask:", objc_msgSend(v7, "authMask"));
  [v7 remoteIdentifier];
  id v10 = (void *)objc_claimAutoreleasedReturnValue();
  [v9 setIdentifier:v10];

  [v7 SSID];
  id v11 = (void *)objc_claimAutoreleasedReturnValue();
  [v9 setName:v11];

  [v7 popularityScore];
  BOOL v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setPopularityScoreValue:", objc_msgSend(v12, "score"));

  [v7 qualityScore];
  id v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setQualityScoreValue:", objc_msgSend(v13, "score"));

  objc_msgSend(v9, "setMoving:", objc_msgSend(v7, "isMoving"));
  objc_msgSend(v9, "setSuspicious:", objc_msgSend(v7, "isSuspicious"));
  objc_msgSend(v9, "setCaptive:", objc_msgSend(v7, "isCaptive"));
  objc_msgSend(v9, "setPublic:", objc_msgSend(v7, "isPublic"));
  objc_msgSend(v9, "setLowQuality:", objc_msgSend(v7, "isLowQuality"));
  [MEMORY[0x189603F50] date];
  id v14 = (void *)objc_claimAutoreleasedReturnValue();
  [v9 setCreated:v14];

  [v7 ownerIdentifiers];
  id v15 = (void *)objc_claimAutoreleasedReturnValue();
  [v9 setOwnerIdentifiers:v15];

  objc_msgSend(v9, "setType:", objc_msgSend(v7, "type"));
  objc_msgSend(v9, "setVenueGroup:", objc_msgSend(v7, "venueGroup"));
  objc_msgSend(v9, "setVenueType:", objc_msgSend(v7, "venueType"));
  v16 = objc_alloc_init(&OBJC_CLASS___TBCentroidCalculator);
  __int128 v41 = 0u;
  __int128 v42 = 0u;
  __int128 v43 = 0u;
  __int128 v44 = 0u;
  uint64_t v39 = v7;
  [v7 accessPoints];
  uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v18 = [v17 countByEnumeratingWithState:&v41 objects:v45 count:16];
  if (v18)
  {
    uint64_t v19 = v18;
    uint64_t v20 = *(void *)v42;
    do
    {
      for (uint64_t i = 0LL; i != v19; ++i)
      {
        if (*(void *)v42 != v20) {
          objc_enumerationMutation(v17);
        }
        uint64_t v22 = *(void **)(*((void *)&v41 + 1) + 8 * i);
        id v23 = (void *)MEMORY[0x1895BA820]();
        [v22 BSSID];
        v24 = (void *)objc_claimAutoreleasedReturnValue();

        if (v24)
        {
          +[TBAccessPointMO generateNewAccessPointObjectFromMOC:]( &OBJC_CLASS___TBAccessPointMO,  "generateNewAccessPointObjectFromMOC:",  v40);
          uint64_t v25 = (void *)objc_claimAutoreleasedReturnValue();
          [v22 BSSID];
          uint64_t v26 = (void *)objc_claimAutoreleasedReturnValue();
          [v25 setBssid:v26];

          [v22 latitude];
          objc_msgSend(v25, "setLat:");
          [v22 longitude];
          objc_msgSend(v25, "setLng:");
          [v22 latitude];
          double v28 = v27;
          [v22 longitude];
          -[TBCentroidCalculator addLatitude:longitude:](v16, "addLatitude:longitude:", v28, v29);
          [v22 popularityScore];
          id v30 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v25, "setPopularityScoreValue:", objc_msgSend(v30, "score"));

          [v22 qualityScore];
          uint64_t v31 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v25, "setQualityScoreValue:", objc_msgSend(v31, "score"));

          objc_msgSend(v25, "setEdge:", objc_msgSend(v22, "isEdge"));
          objc_msgSend(v25, "setTcpGood:", objc_msgSend(v22, "isTCPGood"));
          [v25 setNetwork:v9];
          [MEMORY[0x189603F50] date];
          id v32 = (void *)objc_claimAutoreleasedReturnValue();
          [v25 setCreated:v32];

          [v9 accessPoints];
          uint64_t v33 = (void *)objc_claimAutoreleasedReturnValue();
          id v34 = (id)[v33 setByAddingObject:v25];
        }

        objc_autoreleasePoolPop(v23);
      }

      uint64_t v19 = [v17 countByEnumeratingWithState:&v41 objects:v45 count:16];
    }

    while (v19);
  }

  -[TBCentroidCalculator centroid](v16, "centroid");
  double v36 = v35;
  objc_msgSend(v9, "setCentroidLat:");
  [v9 setCentroidLng:v36];
  if (v38) {
    [v38 addNetworksObject:v9];
  }

  objc_autoreleasePoolPop(context);
}

- (void)importObjectsWithArray:(id)a3 completionHandler:(id)a4
{
  v17[1] = *MEMORY[0x1895F89C0];
  id v6 = a3;
  id v7 = a4;
  if (v6 && [v6 count])
  {
    -[TBCoreDataSource context](self, "context");
    id v8 = (void *)objc_claimAutoreleasedReturnValue();
    v12[0] = MEMORY[0x1895F87A8];
    v12[1] = 3221225472LL;
    v12[2] = __61__TBCoreDataSource_importObjectsWithArray_completionHandler___block_invoke;
    v12[3] = &unk_18A16D9D0;
    id v13 = v6;
    id v14 = self;
    id v15 = v7;
    [v8 performBlock:v12];

    id v9 = v13;
  }

  else
  {
    id v10 = objc_alloc(&OBJC_CLASS___TBError);
    uint64_t v16 = *MEMORY[0x1896075E0];
    v17[0] = @"nil or empty objects to import";
    [MEMORY[0x189603F68] dictionaryWithObjects:v17 forKeys:&v16 count:1];
    id v9 = (void *)objc_claimAutoreleasedReturnValue();
    id v11 = -[TBError initWithType:userInfo:](v10, "initWithType:userInfo:", 0LL, v9);
    (*((void (**)(id, TBError *))v7 + 2))(v7, v11);
  }
}

void __61__TBCoreDataSource_importObjectsWithArray_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v20 = *MEMORY[0x1895F89C0];
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  __int128 v18 = 0u;
  id v2 = *(id *)(a1 + 32);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v16;
    do
    {
      for (uint64_t i = 0LL; i != v4; ++i)
      {
        if (*(void *)v16 != v5) {
          objc_enumerationMutation(v2);
        }
        uint64_t v7 = *(void *)(*((void *)&v15 + 1) + 8 * i);
        id v8 = *(void **)(a1 + 40);
        [v8 context];
        id v9 = (void *)objc_claimAutoreleasedReturnValue();
        [v8 _createNewNetworkFromDictionary:v7 withMOC:v9];
      }

      uint64_t v4 = [v2 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }

    while (v4);
  }

  [*(id *)(a1 + 40) context];
  id v10 = (void *)objc_claimAutoreleasedReturnValue();
  [v10 insertedObjects];
  id v11 = (void *)objc_claimAutoreleasedReturnValue();
  NSLog(@"Inserted %lu objects to local store", [v11 count]);

  [*(id *)(a1 + 40) context];
  BOOL v12 = (void *)objc_claimAutoreleasedReturnValue();
  id v14 = 0LL;
  [v12 save:&v14];
  id v13 = v14;

  if (v13) {
    NSLog( @"%s: failed to save with error %@",  "-[TBCoreDataSource importObjectsWithArray:completionHandler:]_block_invoke",  v13);
  }
  (*(void (**)(void))(*(void *)(a1 + 48) + 16LL))();
}

- (void)_createNewNetworkFromDictionary:(id)a3 withMOC:(id)a4
{
  uint64_t v66 = *MEMORY[0x1895F89C0];
  id v5 = a3;
  id v60 = a4;
  +[TBNetworkMO generateNewNetworkObjectFromMOC:](&OBJC_CLASS___TBNetworkMO, "generateNewNetworkObjectFromMOC:");
  id v6 = (void *)objc_claimAutoreleasedReturnValue();
  [MEMORY[0x189603F50] date];
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue();
  [v7 timeIntervalSince1970];
  [v6 setTimestamp:(uint64_t)v8];

  [MEMORY[0x189603F50] date];
  id v9 = (void *)objc_claimAutoreleasedReturnValue();
  [v6 setCreated:v9];

  [v5 objectForKeyedSubscript:@"authMask"];
  id v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    [v5 objectForKeyedSubscript:@"authMask"];
    id v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setAuthMask:", objc_msgSend(v11, "integerValue"));
  }

  [v5 objectForKeyedSubscript:@"identifier"];
  BOOL v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    [v5 objectForKeyedSubscript:@"identifier"];
    id v13 = (void *)objc_claimAutoreleasedReturnValue();
    [v6 setIdentifier:v13];
  }

  [v5 objectForKeyedSubscript:@"SSID"];
  id v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14)
  {
    [v5 objectForKeyedSubscript:@"SSID"];
    __int128 v15 = (void *)objc_claimAutoreleasedReturnValue();
    [v6 setName:v15];
  }

  [v5 objectForKeyedSubscript:@"popularityScoreValue"];
  __int128 v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (v16)
  {
    [v5 objectForKeyedSubscript:@"popularityScoreValue"];
    __int128 v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setPopularityScoreValue:", objc_msgSend(v17, "intValue"));
  }

  [v5 objectForKeyedSubscript:@"qualityScoreValue"];
  __int128 v18 = (void *)objc_claimAutoreleasedReturnValue();

  if (v18)
  {
    [v5 objectForKeyedSubscript:@"qualityScoreValue"];
    uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setQualityScoreValue:", objc_msgSend(v19, "intValue"));
  }

  [v5 objectForKeyedSubscript:@"moving"];
  uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue();

  if (v20)
  {
    [v5 objectForKeyedSubscript:@"moving"];
    id v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setMoving:", objc_msgSend(v21, "BOOLValue"));
  }

  [v5 objectForKeyedSubscript:@"suspicious"];
  uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue();

  if (v22)
  {
    [v5 objectForKeyedSubscript:@"suspicious"];
    id v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setSuspicious:", objc_msgSend(v23, "BOOLValue"));
  }

  [v5 objectForKeyedSubscript:@"captive"];
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  if (v24)
  {
    [v5 objectForKeyedSubscript:@"captive"];
    uint64_t v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setCaptive:", objc_msgSend(v25, "BOOLValue"));
  }

  [v5 objectForKeyedSubscript:@"public"];
  uint64_t v26 = (void *)objc_claimAutoreleasedReturnValue();

  if (v26)
  {
    [v5 objectForKeyedSubscript:@"public"];
    double v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setPublic:", objc_msgSend(v27, "BOOLValue"));
  }

  [v5 objectForKeyedSubscript:@"public"];
  double v28 = (void *)objc_claimAutoreleasedReturnValue();

  if (v28)
  {
    [v5 objectForKeyedSubscript:@"lowQuality"];
    double v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setLowQuality:", objc_msgSend(v29, "BOOLValue"));
  }

  [v5 objectForKeyedSubscript:@"ownerIdentifiers"];
  id v30 = (void *)objc_claimAutoreleasedReturnValue();

  if (v30)
  {
    [v5 objectForKeyedSubscript:@"ownerIdentifiers"];
    uint64_t v31 = (void *)objc_claimAutoreleasedReturnValue();
    [v6 setOwnerIdentifiers:v31];
  }

  [v5 objectForKeyedSubscript:@"type"];
  id v32 = (void *)objc_claimAutoreleasedReturnValue();

  if (v32)
  {
    [v5 objectForKeyedSubscript:@"type"];
    uint64_t v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setType:", objc_msgSend(v33, "integerValue"));
  }

  [v5 objectForKeyedSubscript:@"venueGroup"];
  id v34 = (void *)objc_claimAutoreleasedReturnValue();

  if (v34)
  {
    [v5 objectForKeyedSubscript:@"venueGroup"];
    double v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setVenueGroup:", objc_msgSend(v35, "integerValue"));
  }

  [v5 objectForKeyedSubscript:@"venueType"];
  double v36 = (void *)objc_claimAutoreleasedReturnValue();

  if (v36)
  {
    [v5 objectForKeyedSubscript:@"venueType"];
    uint64_t v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setVenueType:", objc_msgSend(v37, "intValue"));
  }

  __int128 v63 = 0u;
  __int128 v64 = 0u;
  __int128 v61 = 0u;
  __int128 v62 = 0u;
  objc_msgSend(v5, "objectForKeyedSubscript:", @"accessPoints", v5);
  id obj = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v38 = [obj countByEnumeratingWithState:&v61 objects:v65 count:16];
  if (v38)
  {
    uint64_t v39 = v38;
    uint64_t v59 = *(void *)v62;
    do
    {
      for (uint64_t i = 0LL; i != v39; ++i)
      {
        if (*(void *)v62 != v59) {
          objc_enumerationMutation(obj);
        }
        __int128 v41 = *(void **)(*((void *)&v61 + 1) + 8 * i);
        +[TBAccessPointMO generateNewAccessPointObjectFromMOC:]( &OBJC_CLASS___TBAccessPointMO,  "generateNewAccessPointObjectFromMOC:",  v60);
        __int128 v42 = (void *)objc_claimAutoreleasedReturnValue();
        [v41 objectForKeyedSubscript:@"bssid"];
        __int128 v43 = (void *)objc_claimAutoreleasedReturnValue();
        [v42 setBssid:v43];

        [v41 objectForKeyedSubscript:@"latitude"];
        __int128 v44 = (void *)objc_claimAutoreleasedReturnValue();
        [v44 doubleValue];
        objc_msgSend(v42, "setLat:");

        [v41 objectForKeyedSubscript:@"longitude"];
        uint64_t v45 = (void *)objc_claimAutoreleasedReturnValue();
        [v45 doubleValue];
        objc_msgSend(v42, "setLng:");

        [v41 objectForKeyedSubscript:@"popularityScoreValue"];
        uint64_t v46 = (void *)objc_claimAutoreleasedReturnValue();

        if (v46)
        {
          [v41 objectForKeyedSubscript:@"popularityScoreValue"];
          v47 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v42, "setPopularityScoreValue:", objc_msgSend(v47, "intValue"));
        }

        [v41 objectForKeyedSubscript:@"qualityScoreValue"];
        v48 = (void *)objc_claimAutoreleasedReturnValue();

        if (v48)
        {
          [v41 objectForKeyedSubscript:@"qualityScoreValue"];
          v49 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v42, "setQualityScoreValue:", objc_msgSend(v49, "intValue"));
        }

        [v41 objectForKeyedSubscript:@"edge"];
        v50 = (void *)objc_claimAutoreleasedReturnValue();

        if (v50)
        {
          [v41 objectForKeyedSubscript:@"edge"];
          v51 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v42, "setEdge:", objc_msgSend(v51, "BOOLValue"));
        }

        [v41 objectForKeyedSubscript:@"tcpGood"];
        v52 = (void *)objc_claimAutoreleasedReturnValue();

        if (v52)
        {
          [v41 objectForKeyedSubscript:@"tcpGood"];
          id v53 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v42, "setTcpGood:", objc_msgSend(v53, "BOOLValue"));
        }

        [v42 setNetwork:v6];
        [MEMORY[0x189603F50] date];
        v54 = (void *)objc_claimAutoreleasedReturnValue();
        [v42 setCreated:v54];

        [v6 accessPoints];
        uint64_t v55 = (void *)objc_claimAutoreleasedReturnValue();
        id v56 = (id)[v55 setByAddingObject:v42];
      }

      uint64_t v39 = [obj countByEnumeratingWithState:&v61 objects:v65 count:16];
    }

    while (v39);
  }
}

- (unint64_t)cacheExpirationInDays
{
  return self->_cacheExpirationInDays;
}

- (void)setCacheExpirationInDays:(unint64_t)a3
{
  self->_cacheExpirationInDays = a3;
}

- (NSManagedObjectContext)context
{
  return self->_context;
}

- (void)setContext:(id)a3
{
}

- (TBPersistenceManager)persistenceManager
{
  return self->_persistenceManager;
}

- (void)setPersistenceManager:(id)a3
{
}

- (TBCoreDataStoreDescriptor)descriptor
{
  return self->_descriptor;
}

- (void)setDescriptor:(id)a3
{
}

- (BOOL)hasStorageError
{
  return self->_hasStorageError;
}

- (void)setHasStorageError:(BOOL)a3
{
  self->_hasStorageError = a3;
}

- (void).cxx_destruct
{
}

@end