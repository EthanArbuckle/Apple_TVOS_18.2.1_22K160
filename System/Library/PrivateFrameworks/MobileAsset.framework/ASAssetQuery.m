@interface ASAssetQuery
+ (id)queryPredicateForProperties:(id)a3;
- (ASAssetQuery)initWithAssetType:(id)a3;
- (ASAssetQuery)initWithAssetType:(id)a3 sessionIdentifier:(id)a4;
- (BOOL)queriesLocalAssetInformationOnly;
- (MAAssetQuery)maQuery;
- (NSArray)results;
- (NSPredicate)predicate;
- (NSString)assetType;
- (NSString)sessionIdentifier;
- (double)networkTimeout;
- (id)runQueryAndReturnError:(id *)a3;
- (id)runQueryForInfoReturnError:(id *)a3;
- (void)setAssetType:(id)a3;
- (void)setMaQuery:(id)a3;
- (void)setNetworkTimeout:(double)a3;
- (void)setPredicate:(id)a3;
- (void)setQueriesLocalAssetInformationOnly:(BOOL)a3;
- (void)setResults:(id)a3;
- (void)setSessionIdentifier:(id)a3;
- (void)startQuery:(id)a3;
@end

@implementation ASAssetQuery

+ (id)queryPredicateForProperties:(id)a3
{
  v3 = (void *)MEMORY[0x189603FA8];
  id v4 = a3;
  [v3 array];
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1895F87A8];
  v9[1] = 3221225472LL;
  v9[2] = __44__ASAssetQuery_queryPredicateForProperties___block_invoke;
  v9[3] = &unk_189FFA8B8;
  id v10 = v5;
  id v6 = v5;
  [v4 enumerateKeysAndObjectsUsingBlock:v9];

  [MEMORY[0x189607820] andPredicateWithSubpredicates:v6];
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

void __44__ASAssetQuery_queryPredicateForProperties___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  [MEMORY[0x1896079C8] predicateWithFormat:@"%K == %@", a2, a3];
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  [*(id *)(a1 + 32) addObject:v4];
}

- (ASAssetQuery)initWithAssetType:(id)a3
{
  return -[ASAssetQuery initWithAssetType:sessionIdentifier:](self, "initWithAssetType:sessionIdentifier:", a3, 0LL);
}

- (ASAssetQuery)initWithAssetType:(id)a3 sessionIdentifier:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v18.receiver = self;
  v18.super_class = (Class)&OBJC_CLASS___ASAssetQuery;
  v8 = -[ASAssetQuery init](&v18, sel_init);
  v9 = v8;
  if (v8)
  {
    v8->_networkTimeout = 30.0;
    uint64_t v10 = [v6 copy];
    assetType = v9->_assetType;
    v9->_assetType = (NSString *)v10;

    uint64_t v12 = [v7 copy];
    sessionIdentifier = v9->_sessionIdentifier;
    v9->_sessionIdentifier = (NSString *)v12;

    v14 = (void *)[(id)objc_opt_new() initWithType:v6];
    -[ASAssetQuery setMaQuery:](v9, "setMaQuery:", v14);
    v15 = -[ASAssetQuery maQuery](v9, "maQuery");
    [v15 setDoNotBlockOnNetworkStatus:1];
    v16 = -[ASAssetQuery maQuery](v9, "maQuery");
    [v16 returnTypes:2];
  }

  return v9;
}

- (NSArray)results
{
  return (NSArray *)(id)-[NSArray copy](self->_results, "copy");
}

- (id)runQueryForInfoReturnError:(id *)a3
{
  uint64_t v48 = *MEMORY[0x1895F89C0];
  [MEMORY[0x189603FC8] dictionary];
  id v32 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v41 = 0LL;
  v42 = &v41;
  uint64_t v43 = 0x3032000000LL;
  v44 = __Block_byref_object_copy__2;
  v45 = __Block_byref_object_dispose__2;
  id v46 = 0LL;
  if (!self->_queriesLocalAssetInformationOnly)
  {
    id v4 = (void *)objc_opt_new();
    [v4 setDiscretionary:0];
    v5 = dispatch_group_create();
    dispatch_group_enter(v5);
    assetType = self->_assetType;
    v38[0] = MEMORY[0x1895F87A8];
    v38[1] = 3221225472LL;
    v38[2] = __43__ASAssetQuery_runQueryForInfoReturnError___block_invoke;
    v38[3] = &unk_189FFA8E0;
    v40 = &v41;
    id v7 = v5;
    v39 = v7;
    +[MAAsset startCatalogDownload:options:completionWithError:]( &OBJC_CLASS___MAAsset,  "startCatalogDownload:options:completionWithError:",  assetType,  v4,  v38);
    dispatch_time_t v8 = dispatch_time(0LL, (uint64_t)(self->_networkTimeout * 1000000000.0));
    dispatch_group_wait(v7, v8);
  }
  v9 = -[ASAssetQuery maQuery](self, "maQuery");
  uint64_t v10 = [v9 queryMetaDataSync];

  if (MAIsQueryResultFailure(v10))
  {
    v11 = (void *)v42[5];
    errorStringForMAQueryResult(v10);
    uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue();
    MAErrorWithUnderlying( @"com.apple.MobileAssetError.Query",  v10,  v11,  @"%@",  v13,  v14,  v15,  v16,  (uint64_t)v12);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    _ASErrorForMAError(v17);
    objc_super v18 = (void *)objc_claimAutoreleasedReturnValue();
  }

  else
  {
    objc_super v18 = 0LL;
  }
  v19 = -[ASAssetQuery maQuery](self, "maQuery");
  [v19 results];
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  BOOL v21 = v20 == 0LL;

  if (v21)
  {
    v22 = 0LL;
  }

  else
  {
    v22 = (void *)objc_opt_new();
    __int128 v36 = 0u;
    __int128 v37 = 0u;
    __int128 v34 = 0u;
    __int128 v35 = 0u;
    v23 = -[MAAssetQuery results](self->maQuery, "results");
    uint64_t v24 = [v23 countByEnumeratingWithState:&v34 objects:v47 count:16];
    if (v24)
    {
      uint64_t v25 = *(void *)v35;
      do
      {
        for (uint64_t i = 0LL; i != v24; ++i)
        {
          if (*(void *)v35 != v25) {
            objc_enumerationMutation(v23);
          }
          uint64_t v27 = *(void *)(*((void *)&v34 + 1) + 8 * i);
          v28 = (void *)MEMORY[0x1895A1E98]();
          v29 = (void *)[(id)objc_opt_new() initWithMAAsset:v27];
          [v22 addObject:v29];

          objc_autoreleasePoolPop(v28);
        }

        uint64_t v24 = [v23 countByEnumeratingWithState:&v34 objects:v47 count:16];
      }

      while (v24);
    }

    [v32 setObject:v22 forKey:@"Assets"];
  }

  -[ASAssetQuery setResults:](self, "setResults:", v22);
  if (a3)
  {
    if (v22) {
      v30 = 0LL;
    }
    else {
      v30 = v18;
    }
    *a3 = v30;
  }

  _Block_object_dispose(&v41, 8);

  return v32;
}

void __43__ASAssetQuery_runQueryForInfoReturnError___block_invoke(uint64_t a1, int a2, id obj)
{
  id v5 = obj;
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

- (id)runQueryAndReturnError:(id *)a3
{
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  id v4 = v3;
  if (v3)
  {
    [v3 objectForKey:@"Assets"];
    id v5 = (void *)objc_claimAutoreleasedReturnValue();
  }

  else
  {
    id v5 = 0LL;
  }

  return v5;
}

- (void)startQuery:(id)a3
{
  id v4 = a3;
  dispatch_get_global_queue(0LL, 0LL);
  id v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1895F87A8];
  v7[1] = 3221225472LL;
  v7[2] = __27__ASAssetQuery_startQuery___block_invoke;
  v7[3] = &unk_189FF9600;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

void __27__ASAssetQuery_startQuery___block_invoke(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  id v6 = 0LL;
  [v2 runQueryAndReturnError:&v6];
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  id v4 = v6;
  uint64_t v5 = *(void *)(a1 + 40);
  if (v5) {
    (*(void (**)(uint64_t, void *, id))(v5 + 16))(v5, v3, v4);
  }
}

- (MAAssetQuery)maQuery
{
  return self->maQuery;
}

- (void)setMaQuery:(id)a3
{
}

- (NSPredicate)predicate
{
  return self->_predicate;
}

- (void)setPredicate:(id)a3
{
}

- (BOOL)queriesLocalAssetInformationOnly
{
  return self->_queriesLocalAssetInformationOnly;
}

- (void)setQueriesLocalAssetInformationOnly:(BOOL)a3
{
  self->_queriesLocalAssetInformationOnly = a3;
}

- (void)setResults:(id)a3
{
}

- (double)networkTimeout
{
  return self->_networkTimeout;
}

- (void)setNetworkTimeout:(double)a3
{
  self->_networkTimeout = a3;
}

- (NSString)assetType
{
  return self->_assetType;
}

- (void)setAssetType:(id)a3
{
}

- (NSString)sessionIdentifier
{
  return self->_sessionIdentifier;
}

- (void)setSessionIdentifier:(id)a3
{
}

- (void).cxx_destruct
{
}

@end