@interface TBLocalFetchResponse
+ (id)responseWithResults:(id)a3 entityDescription:(id)a4;
+ (id)responseWithResultsByBSSID:(id)a3;
- (NSArray)results;
- (NSDictionary)resultsByBSSID;
- (NSError)error;
- (NSSet)tiles;
- (TBLocalFetchResponse)initWithResults:(id)a3 entityDescription:(id)a4;
- (TBLocalFetchResponse)initWithResultsByBSSID:(id)a3;
- (void)setResults:(id)a3;
- (void)setResultsByBSSID:(id)a3;
@end

@implementation TBLocalFetchResponse

+ (id)responseWithResults:(id)a3 entityDescription:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  v7 = -[TBLocalFetchResponse initWithResults:entityDescription:]( objc_alloc(&OBJC_CLASS___TBLocalFetchResponse),  "initWithResults:entityDescription:",  v6,  v5);

  return v7;
}

+ (id)responseWithResultsByBSSID:(id)a3
{
  id v3 = a3;
  v4 = -[TBLocalFetchResponse initWithResultsByBSSID:]( objc_alloc(&OBJC_CLASS___TBLocalFetchResponse),  "initWithResultsByBSSID:",  v3);

  return v4;
}

- (TBLocalFetchResponse)initWithResultsByBSSID:(id)a3
{
  id v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)&OBJC_CLASS___TBLocalFetchResponse;
  id v6 = -[TBLocalFetchResponse init](&v11, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_resultsByBSSID, a3);
    uint64_t v8 = [v5 allValues];
    results = v7->_results;
    v7->_results = (NSArray *)v8;
  }

  return v7;
}

- (TBLocalFetchResponse)initWithResults:(id)a3 entityDescription:(id)a4
{
  uint64_t v54 = *MEMORY[0x1895F89C0];
  id v6 = a3;
  id v7 = a4;
  v51.receiver = self;
  v51.super_class = (Class)&OBJC_CLASS___TBLocalFetchResponse;
  uint64_t v8 = -[TBLocalFetchResponse init](&v51, sel_init);
  v9 = v8;
  if (v7 && v8)
  {
    [v7 name];
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    +[TBAccessPointMO entityName](&OBJC_CLASS___TBAccessPointMO, "entityName");
    objc_super v11 = (void *)objc_claimAutoreleasedReturnValue();
    int v12 = [v10 isEqualToString:v11];

    if (v12)
    {
      [MEMORY[0x189603FC8] dictionary];
      v13 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
      [MEMORY[0x189603FA8] array];
      v14 = (NSArray *)objc_claimAutoreleasedReturnValue();
      __int128 v47 = 0u;
      __int128 v48 = 0u;
      __int128 v49 = 0u;
      __int128 v50 = 0u;
      id v42 = v6;
      id v15 = v6;
      uint64_t v16 = [v15 countByEnumeratingWithState:&v47 objects:v53 count:16];
      if (v16)
      {
        uint64_t v17 = v16;
        uint64_t v18 = *(void *)v48;
        do
        {
          for (uint64_t i = 0LL; i != v17; ++i)
          {
            if (*(void *)v48 != v18) {
              objc_enumerationMutation(v15);
            }
            v20 = *(void **)(*((void *)&v47 + 1) + 8 * i);
            [v20 network];
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            -[NSArray addObject:](v14, "addObject:", v21);

            [v20 network];
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            [v20 BSSID];
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            -[NSDictionary setObject:forKey:](v13, "setObject:forKey:", v22, v23);
          }

          uint64_t v17 = [v15 countByEnumeratingWithState:&v47 objects:v53 count:16];
        }

        while (v17);
      }

      results = v9->_results;
      v9->_results = v14;
      tiles = v14;

      resultsByBSSID = v9->_resultsByBSSID;
      v9->_resultsByBSSID = v13;

      id v6 = v42;
      goto LABEL_23;
    }

    [v7 name];
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = +[TBNetworkMO entityName](&OBJC_CLASS___TBNetworkMO, "entityName");
    int v29 = [v27 isEqualToString:v28];

    if (v29)
    {
      v30 = (NSArray *)v6;
      tiles = v9->_results;
      v9->_results = v30;
LABEL_23:

      goto LABEL_24;
    }

    [v7 name];
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = +[TBTileMO entityName](&OBJC_CLASS___TBTileMO, "entityName");
    int v33 = [v31 isEqualToString:v32];

    if (v33)
    {
      [MEMORY[0x189603FE0] set];
      v34 = (NSSet *)objc_claimAutoreleasedReturnValue();
      __int128 v43 = 0u;
      __int128 v44 = 0u;
      __int128 v45 = 0u;
      __int128 v46 = 0u;
      id v35 = v6;
      uint64_t v36 = [v35 countByEnumeratingWithState:&v43 objects:v52 count:16];
      if (v36)
      {
        uint64_t v37 = v36;
        uint64_t v38 = *(void *)v44;
        do
        {
          for (uint64_t j = 0LL; j != v37; ++j)
          {
            if (*(void *)v44 != v38) {
              objc_enumerationMutation(v35);
            }
            v40 = -[TBLocalFetchTileItem initWithTile:error:]( objc_alloc(&OBJC_CLASS___TBLocalFetchTileItem),  "initWithTile:error:",  *(void *)(*((void *)&v43 + 1) + 8 * j),  0LL);
            -[NSSet addObject:](v34, "addObject:", v40);
          }

          uint64_t v37 = [v35 countByEnumeratingWithState:&v43 objects:v52 count:16];
        }

        while (v37);
      }

      tiles = (NSArray *)v9->_tiles;
      v9->_tiles = v34;
      goto LABEL_23;
    }
  }

- (NSError)error
{
  return self->error;
}

- (NSSet)tiles
{
  return self->_tiles;
}

- (NSArray)results
{
  return self->_results;
}

- (void)setResults:(id)a3
{
}

- (NSDictionary)resultsByBSSID
{
  return self->_resultsByBSSID;
}

- (void)setResultsByBSSID:(id)a3
{
}

- (void).cxx_destruct
{
}

@end