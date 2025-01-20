@interface IDSOpportunisticCache
- (BOOL)addData:(id)a3 withError:(id *)a4;
- (BOOL)clearKeychainWithError:(id *)a3;
- (BOOL)removeDataWithIdentifier:(id)a3 serviceName:(id)a4 withError:(id *)a5;
- (BOOL)saveOpportunisticCache:(id)a3 withError:(id *)a4;
- (IDSFrequentURISuggester)uriSuggester;
- (IDSKeychainWrapper)keychainWrapper;
- (IDSOpportunisticCache)init;
- (IDSOpportunisticCache)initWithKeychainWrapper:(id)a3 uriSuggester:(id)a4;
- (NSMutableDictionary)keychainCache;
- (id)dataForService:(id)a3 identifier:(id)a4;
- (id)description;
- (id)fetchOpportunisticCacheWithError:(id *)a3;
- (id)selectDataForDestination:(id)a3;
- (int64_t)accessCount;
- (void)copyCacheWithBlock:(id)a3;
- (void)limitDataInDictionary:(id)a3 forService:(id)a4;
- (void)mergeKeychainCacheDataIntoDictionary:(id)a3 forService:(id)a4;
- (void)mergeKeychainCacheIntoDictionary:(id)a3;
- (void)selectServicesForKeychainCacheFromDictionary:(id)a3;
- (void)setAccessCount:(int64_t)a3;
- (void)setKeychainCache:(id)a3;
- (void)setKeychainWrapper:(id)a3;
- (void)setUriSuggester:(id)a3;
- (void)syncCacheWithKeychain;
@end

@implementation IDSOpportunisticCache

- (IDSOpportunisticCache)init
{
  v3 = objc_alloc_init(&OBJC_CLASS___IDSKeychainWrapper);
  v4 = objc_alloc_init(&OBJC_CLASS___IDSFrequentURISuggester);
  v5 = -[IDSOpportunisticCache initWithKeychainWrapper:uriSuggester:]( self,  "initWithKeychainWrapper:uriSuggester:",  v3,  v4);

  return v5;
}

- (IDSOpportunisticCache)initWithKeychainWrapper:(id)a3 uriSuggester:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)&OBJC_CLASS___IDSOpportunisticCache;
  v9 = -[IDSOpportunisticCache init](&v14, "init");
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_keychainWrapper, a3);
    v11 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    keychainCache = v10->_keychainCache;
    v10->_keychainCache = v11;

    objc_storeStrong((id *)&v10->_uriSuggester, a4);
    v10->_accessCount = 20LL;
  }

  return v10;
}

- (id)fetchOpportunisticCacheWithError:(id *)a3
{
  keychainWrapper = self->_keychainWrapper;
  id v20 = 0LL;
  v5 = (void *)objc_claimAutoreleasedReturnValue( -[IDSKeychainWrapper dataForIdentifier:error:]( keychainWrapper,  "dataForIdentifier:error:",  @"OpportunisticCache",  &v20));
  id v7 = v20;
  if (v7 && !+[IDSKeychainWrapper isItemNotFoundError:](&OBJC_CLASS___IDSKeychainWrapper, "isItemNotFoundError:", v7))
  {
    v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog opportunistic](&OBJC_CLASS___IDSFoundationLog, "opportunistic"));
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v22 = v7;
      _os_log_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_DEFAULT,  "Failed to load keychain. Can't sync cache with keychain. {error: %@}",  buf,  0xCu);
    }

    objc_super v14 = 0LL;
  }

  else
  {
    if (!v5) {
      goto LABEL_8;
    }
    uint64_t v8 = objc_opt_class(&OBJC_CLASS___NSMutableDictionary, v6);
    uint64_t v10 = objc_opt_class(&OBJC_CLASS___NSString, v9);
    v12 = +[NSSet setWithObjects:]( &OBJC_CLASS___NSSet,  "setWithObjects:",  v8,  v10,  objc_opt_class(&OBJC_CLASS___IDSOpportunisticData, v11),  0LL);
    v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
    id v19 = 0LL;
    objc_super v14 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue( +[NSKeyedUnarchiver unarchivedObjectOfClasses:fromData:error:]( &OBJC_CLASS___NSKeyedUnarchiver,  "unarchivedObjectOfClasses:fromData:error:",  v13,  v5,  &v19));
    id v15 = v19;

    if (v15)
    {
      v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog opportunistic](&OBJC_CLASS___IDSFoundationLog, "opportunistic"));
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        id v22 = v15;
        _os_log_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_DEFAULT,  "Error unarchiving -- dropping {unarchiveError: %@}",  buf,  0xCu);
      }

      goto LABEL_8;
    }

    if (!v14) {
LABEL_8:
    }
      objc_super v14 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  }

  if (a3) {
    *a3 = v7;
  }

  return v14;
}

- (BOOL)saveOpportunisticCache:(id)a3 withError:(id *)a4
{
  id v6 = a3;
  if (!v6)
  {
    keychainWrapper = self->_keychainWrapper;
    id v13 = 0LL;
    -[IDSKeychainWrapper removeDataForIdentifier:dataProtectionClass:error:]( keychainWrapper,  "removeDataForIdentifier:dataProtectionClass:error:",  @"OpportunisticCache",  2LL,  &v13);
    id v8 = v13;
    if (!a4) {
      goto LABEL_10;
    }
    goto LABEL_9;
  }

  id v15 = 0LL;
  id v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSKeyedArchiver archivedDataWithRootObject:requiringSecureCoding:error:]( &OBJC_CLASS___NSKeyedArchiver,  "archivedDataWithRootObject:requiringSecureCoding:error:",  v6,  0LL,  &v15));
  id v8 = v15;
  if (v7)
  {
    uint64_t v9 = self->_keychainWrapper;
    id v14 = v8;
    -[IDSKeychainWrapper saveData:forIdentifier:allowSync:dataProtectionClass:error:]( v9,  "saveData:forIdentifier:allowSync:dataProtectionClass:error:",  v7,  @"OpportunisticCache",  0LL,  2LL,  &v14);
    uint64_t v10 = (os_log_s *)v8;
    id v8 = v14;
  }

  else
  {
    uint64_t v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog opportunistic](&OBJC_CLASS___IDSFoundationLog, "opportunistic"));
    if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT)) {
      sub_100693BE0((uint64_t)v8, (uint64_t)v6, v10);
    }
  }

  if (a4) {
LABEL_9:
  }
    *a4 = v8;
LABEL_10:

  return v8 != 0LL;
}

- (void)copyCacheWithBlock:(id)a3
{
  v16 = (void (**)(id, NSMutableDictionary *))a3;
  v18 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  __int128 v25 = 0u;
  __int128 v26 = 0u;
  __int128 v27 = 0u;
  __int128 v28 = 0u;
  id obj = (id)objc_claimAutoreleasedReturnValue(-[IDSOpportunisticCache fetchOpportunisticCacheWithError:](self, "fetchOpportunisticCacheWithError:", 0LL));
  id v19 = [obj countByEnumeratingWithState:&v25 objects:v30 count:16];
  if (v19)
  {
    uint64_t v17 = *(void *)v26;
    do
    {
      for (i = 0LL; i != v19; i = (char *)i + 1)
      {
        if (*(void *)v26 != v17) {
          objc_enumerationMutation(obj);
        }
        uint64_t v5 = *(void *)(*((void *)&v25 + 1) + 8LL * (void)i);
        id v6 = (void *)objc_claimAutoreleasedReturnValue([obj objectForKeyedSubscript:v5]);
        id v7 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
        __int128 v21 = 0u;
        __int128 v22 = 0u;
        __int128 v23 = 0u;
        __int128 v24 = 0u;
        id v8 = v6;
        id v9 = [v8 countByEnumeratingWithState:&v21 objects:v29 count:16];
        if (v9)
        {
          id v10 = v9;
          uint64_t v11 = *(void *)v22;
          do
          {
            for (j = 0LL; j != v10; j = (char *)j + 1)
            {
              if (*(void *)v22 != v11) {
                objc_enumerationMutation(v8);
              }
              uint64_t v13 = *(void *)(*((void *)&v21 + 1) + 8LL * (void)j);
              id v14 = (void *)objc_claimAutoreleasedReturnValue([v8 objectForKeyedSubscript:v13]);
              id v15 = [v14 copy];
              -[NSMutableDictionary setObject:forKeyedSubscript:](v7, "setObject:forKeyedSubscript:", v15, v13);
            }

            id v10 = [v8 countByEnumeratingWithState:&v21 objects:v29 count:16];
          }

          while (v10);
        }

        -[NSMutableDictionary setObject:forKeyedSubscript:](v18, "setObject:forKeyedSubscript:", v7, v5);
      }

      id v19 = [obj countByEnumeratingWithState:&v25 objects:v30 count:16];
    }

    while (v19);
  }

  v16[2](v16, v18);
}

- (BOOL)clearKeychainWithError:(id *)a3
{
  BOOL v5 = -[IDSOpportunisticCache saveOpportunisticCache:withError:](self, "saveOpportunisticCache:withError:", 0LL, a3);
  id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog opportunistic](&OBJC_CLASS___IDSFoundationLog, "opportunistic"));
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    if (a3) {
      id v7 = *a3;
    }
    else {
      id v7 = 0LL;
    }
    int v9 = 138412290;
    id v10 = v7;
    _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "Dropped opportunistic cache {err: %@}",  (uint8_t *)&v9,  0xCu);
  }

  return v5;
}

- (BOOL)addData:(id)a3 withError:(id *)a4
{
  id v6 = a3;
  id v7 = (void *)objc_claimAutoreleasedReturnValue( -[IDSOpportunisticCache fetchOpportunisticCacheWithError:]( self,  "fetchOpportunisticCacheWithError:",  a4));
  if (v7)
  {
    -[IDSOpportunisticCache mergeKeychainCacheIntoDictionary:](self, "mergeKeychainCacheIntoDictionary:", v7);
    id v8 = (void *)objc_claimAutoreleasedReturnValue([v6 serviceName]);
    int v9 = (void *)objc_claimAutoreleasedReturnValue([v7 objectForKeyedSubscript:v8]);

    if (!v9)
    {
      v18 = (void *)objc_claimAutoreleasedReturnValue([v6 data]);

      if (v18)
      {
        id v19 = objc_alloc(&OBJC_CLASS___NSMutableDictionary);
        id v20 = (void *)objc_claimAutoreleasedReturnValue([v6 identifier]);
        v36 = v20;
        id v37 = v6;
        __int128 v21 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v37,  &v36,  1LL));
        __int128 v22 = -[NSMutableDictionary initWithDictionary:](v19, "initWithDictionary:", v21);
        __int128 v23 = (void *)objc_claimAutoreleasedReturnValue([v6 serviceName]);
        [v7 setObject:v22 forKeyedSubscript:v23];
      }

- (BOOL)removeDataWithIdentifier:(id)a3 serviceName:(id)a4 withError:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = (void *)objc_claimAutoreleasedReturnValue( -[IDSOpportunisticCache fetchOpportunisticCacheWithError:]( self,  "fetchOpportunisticCacheWithError:",  a5));
  if (v10)
  {
    -[IDSOpportunisticCache mergeKeychainCacheIntoDictionary:](self, "mergeKeychainCacheIntoDictionary:", v10);
    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([v10 objectForKeyedSubscript:v9]);
    v12 = v11;
    if (v11)
    {
      uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue([v11 objectForKeyedSubscript:v8]);
      if (v13)
      {
        [v12 removeObjectForKey:v8];
        -[NSMutableDictionary setObject:forKeyedSubscript:]( self->_keychainCache,  "setObject:forKeyedSubscript:",  v12,  v9);
      }
    }

    BOOL v14 = -[IDSOpportunisticCache saveOpportunisticCache:withError:](self, "saveOpportunisticCache:withError:", v10, a5);
  }

  else
  {
    BOOL v14 = 0;
  }

  return v14;
}

- (void)syncCacheWithKeychain
{
  v3 = (void *)objc_claimAutoreleasedReturnValue( -[IDSOpportunisticCache fetchOpportunisticCacheWithError:]( self,  "fetchOpportunisticCacheWithError:",  0LL));
  if (v3)
  {
    v4 = v3;
    -[IDSOpportunisticCache mergeKeychainCacheIntoDictionary:](self, "mergeKeychainCacheIntoDictionary:", v3);
    -[IDSOpportunisticCache selectServicesForKeychainCacheFromDictionary:]( self,  "selectServicesForKeychainCacheFromDictionary:",  v4);
    self->_accessCount = 0LL;
    -[IDSOpportunisticCache saveOpportunisticCache:withError:](self, "saveOpportunisticCache:withError:", v4, 0LL);
    v3 = v4;
  }
}

- (void)mergeKeychainCacheIntoDictionary:(id)a3
{
  id v4 = a3;
  __int128 v10 = 0u;
  __int128 v11 = 0u;
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  BOOL v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary allKeys](self->_keychainCache, "allKeys", 0LL));
  id v6 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v11;
    do
    {
      id v9 = 0LL;
      do
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v5);
        }
        -[IDSOpportunisticCache mergeKeychainCacheDataIntoDictionary:forService:]( self,  "mergeKeychainCacheDataIntoDictionary:forService:",  v4,  *(void *)(*((void *)&v10 + 1) + 8LL * (void)v9));
        id v9 = (char *)v9 + 1;
      }

      while (v7 != v9);
      id v7 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }

    while (v7);
  }
}

- (void)mergeKeychainCacheDataIntoDictionary:(id)a3 forService:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_keychainCache, "objectForKeyedSubscript:", v7));
  __int128 v22 = 0u;
  __int128 v23 = 0u;
  __int128 v24 = 0u;
  __int128 v25 = 0u;
  id obj = (id)objc_claimAutoreleasedReturnValue([v8 allKeys]);
  id v9 = [obj countByEnumeratingWithState:&v22 objects:v26 count:16];
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v23;
    do
    {
      for (i = 0LL; i != v10; i = (char *)i + 1)
      {
        if (*(void *)v23 != v11) {
          objc_enumerationMutation(obj);
        }
        uint64_t v13 = *(void *)(*((void *)&v22 + 1) + 8LL * (void)i);
        BOOL v14 = (void *)objc_claimAutoreleasedReturnValue([v8 objectForKeyedSubscript:v13]);
        id v15 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKeyedSubscript:v7]);

        if (!v15)
        {
          BOOL v16 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
          [v6 setObject:v16 forKeyedSubscript:v7];
        }

        unsigned __int8 v17 = [v14 isInvalid];
        v18 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKeyedSubscript:v7]);
        id v19 = v18;
        if ((v17 & 1) != 0)
        {
          id v20 = (void *)objc_claimAutoreleasedReturnValue([v18 objectForKeyedSubscript:v13]);

          if (!v20) {
            goto LABEL_13;
          }
          id v19 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKeyedSubscript:v7]);
          [v19 removeObjectForKey:v13];
        }

        else
        {
          [v18 setObject:v14 forKeyedSubscript:v13];
        }

LABEL_13:
      }

      id v10 = [obj countByEnumeratingWithState:&v22 objects:v26 count:16];
    }

    while (v10);
  }
}

- (void)limitDataInDictionary:(id)a3 forService:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKeyedSubscript:v6]);
  id v8 = [v7 count];

  if ((unint64_t)v8 >= 6)
  {
    do
    {
      __int128 v35 = 0u;
      __int128 v36 = 0u;
      __int128 v33 = 0u;
      __int128 v34 = 0u;
      id v9 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKeyedSubscript:v6]);
      id v10 = (void *)objc_claimAutoreleasedReturnValue([v9 allKeys]);

      id obj = v10;
      id v32 = [v10 countByEnumeratingWithState:&v33 objects:v37 count:16];
      id v11 = 0LL;
      if (v32)
      {
        uint64_t v31 = *(void *)v34;
        do
        {
          __int128 v12 = 0LL;
          do
          {
            if (*(void *)v34 != v31) {
              objc_enumerationMutation(obj);
            }
            uint64_t v13 = *(void **)(*((void *)&v33 + 1) + 8LL * (void)v12);
            if (v11)
            {
              BOOL v14 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKeyedSubscript:v6]);
              id v15 = (void *)objc_claimAutoreleasedReturnValue([v14 objectForKeyedSubscript:v13]);

              id v16 = v5;
              id v17 = v6;
              v18 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKeyedSubscript:v6]);
              id v19 = (void *)objc_claimAutoreleasedReturnValue([v18 objectForKeyedSubscript:v11]);

              id v20 = (void *)objc_claimAutoreleasedReturnValue([v15 options]);
              __int128 v21 = (void *)objc_claimAutoreleasedReturnValue([v20 expiryDate]);

              __int128 v22 = (void *)objc_claimAutoreleasedReturnValue([v19 options]);
              __int128 v23 = (void *)objc_claimAutoreleasedReturnValue([v22 expiryDate]);

              if (v21 && (!v23 || [v21 compare:v23] == (id)-1))
              {
                id v24 = v13;

                id v11 = v24;
              }

              id v5 = v16;
              id v6 = v17;
            }

            else
            {
              id v11 = v13;
            }

            __int128 v12 = (char *)v12 + 1;
          }

          while (v32 != v12);
          id v32 = [obj countByEnumeratingWithState:&v33 objects:v37 count:16];
        }

        while (v32);
      }

      __int128 v25 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKeyedSubscript:v6]);
      [v25 removeObjectForKey:v11];

      __int128 v26 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKeyedSubscript:v6]);
      id v27 = [v26 count];
    }

    while ((unint64_t)v27 > 5);
  }

  __int128 v28 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKeyedSubscript:v6]);
  id v29 = [v28 count];

  if (!v29) {
    [v5 removeObjectForKey:v6];
  }
}

- (void)selectServicesForKeychainCacheFromDictionary:(id)a3
{
  id v9 = a3;
  -[NSMutableDictionary removeAllObjects](self->_keychainCache, "removeAllObjects");
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v9 allKeys]);
  if ([v4 count])
  {
    int v5 = 3;
    do
    {
      id v6 = objc_msgSend(v4, "objectAtIndexedSubscript:", arc4random_uniform((uint32_t)objc_msgSend(v4, "count")));
      id v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
      id v8 = (void *)objc_claimAutoreleasedReturnValue([v9 objectForKeyedSubscript:v7]);
      -[NSMutableDictionary setObject:forKeyedSubscript:](self->_keychainCache, "setObject:forKeyedSubscript:", v8, v7);

      --v5;
    }

    while (v5);
  }
}

- (id)selectDataForDestination:(id)a3
{
  id v4 = a3;
  int64_t accessCount = self->_accessCount;
  self->_int64_t accessCount = accessCount + 1;
  if (accessCount >= 19)
  {
    -[IDSOpportunisticCache syncCacheWithKeychain](self, "syncCacheWithKeychain");
    self->_int64_t accessCount = 0LL;
  }

  v48[0] = _NSConcreteStackBlock;
  v48[1] = 3221225472LL;
  v48[2] = sub_1000071D4;
  v48[3] = &unk_1008F5FA8;
  id v29 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  v49 = v29;
  id v6 = objc_retainBlock(v48);
  __int128 v35 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  __int128 v44 = 0u;
  __int128 v45 = 0u;
  __int128 v46 = 0u;
  __int128 v47 = 0u;
  id obj = (id)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary allKeys](self->_keychainCache, "allKeys"));
  id v33 = [obj countByEnumeratingWithState:&v44 objects:v52 count:16];
  if (v33)
  {
    uint64_t v31 = *(void *)v45;
    id v32 = self;
    do
    {
      uint64_t v7 = 0LL;
      do
      {
        if (*(void *)v45 != v31) {
          objc_enumerationMutation(obj);
        }
        uint64_t v34 = v7;
        id v8 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_keychainCache,  "objectForKeyedSubscript:",  *(void *)(*((void *)&v44 + 1) + 8 * v7)));
        __int128 v40 = 0u;
        __int128 v41 = 0u;
        __int128 v42 = 0u;
        __int128 v43 = 0u;
        id v9 = (void *)objc_claimAutoreleasedReturnValue([v8 allKeys]);
        id v10 = [v9 countByEnumeratingWithState:&v40 objects:v51 count:16];
        if (v10)
        {
          id v11 = v10;
          uint64_t v12 = *(void *)v41;
          do
          {
            for (i = 0LL; i != v11; i = (char *)i + 1)
            {
              if (*(void *)v41 != v12) {
                objc_enumerationMutation(v9);
              }
              BOOL v14 = (void *)objc_claimAutoreleasedReturnValue( [v8 objectForKeyedSubscript:*(void *)(*((void *)&v40 + 1) + 8 * (void)i)]);
              if ([v14 shouldSendToDestination:v4])
              {
                id v15 = (void *)objc_claimAutoreleasedReturnValue([v14 options]);
                unsigned int v16 = [v15 destinationsMustBeInContacts];

                if (v16) {
                  -[NSMutableArray addObject:](v35, "addObject:", v14);
                }
                else {
                  ((void (*)(void *, void *))v6[2])(v6, v14);
                }
              }
            }

            id v11 = [v9 countByEnumeratingWithState:&v40 objects:v51 count:16];
          }

          while (v11);
        }

        uint64_t v7 = v34 + 1;
        self = v32;
      }

      while ((id)(v34 + 1) != v33);
      id v33 = [obj countByEnumeratingWithState:&v44 objects:v52 count:16];
    }

    while (v33);
  }

  if (-[NSMutableArray count](v35, "count")
    && -[IDSFrequentURISuggester checkContactsForDestination:](self->_uriSuggester, "checkContactsForDestination:", v4))
  {
    __int128 v38 = 0u;
    __int128 v39 = 0u;
    __int128 v36 = 0u;
    __int128 v37 = 0u;
    id v17 = v35;
    id v18 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v17,  "countByEnumeratingWithState:objects:count:",  &v36,  v50,  16LL);
    if (v18)
    {
      id v19 = v18;
      uint64_t v20 = *(void *)v37;
      do
      {
        for (j = 0LL; j != v19; j = (char *)j + 1)
        {
          if (*(void *)v37 != v20) {
            objc_enumerationMutation(v17);
          }
          ((void (*)(void *, void))v6[2])(v6, *(void *)(*((void *)&v36 + 1) + 8LL * (void)j));
        }

        id v19 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v17,  "countByEnumeratingWithState:objects:count:",  &v36,  v50,  16LL);
      }

      while (v19);
    }
  }

  if (-[NSMutableDictionary count](v29, "count"))
  {
    __int128 v22 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary allKeys](v29, "allKeys"));
    id v23 = objc_msgSend(v22, "objectAtIndexedSubscript:", arc4random_uniform((uint32_t)objc_msgSend(v22, "count")));
    id v24 = (void *)objc_claimAutoreleasedReturnValue(v23);
    __int128 v25 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](v29, "objectForKeyedSubscript:", v24));
    id v26 = objc_msgSend(v25, "objectAtIndexedSubscript:", arc4random_uniform((uint32_t)objc_msgSend(v25, "count")));
    id v27 = (void *)objc_claimAutoreleasedReturnValue(v26);
  }

  else
  {
    id v27 = 0LL;
  }

  return v27;
}

- (id)dataForService:(id)a3 identifier:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_keychainCache, "objectForKeyedSubscript:", v6));

  if (v8)
  {
    id v9 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_keychainCache, "objectForKeyedSubscript:", v6));
    id v10 = (void *)objc_claimAutoreleasedReturnValue([v9 objectForKeyedSubscript:v7]);
  }

  else
  {
    uint64_t v14 = 0LL;
    uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue( -[IDSOpportunisticCache fetchOpportunisticCacheWithError:]( self,  "fetchOpportunisticCacheWithError:",  &v14));
    id v9 = v12;
    if (v12)
    {
      id v10 = (void *)objc_claimAutoreleasedReturnValue([v12 objectForKeyedSubscript:v6]);

      if (v10)
      {
        uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue([v9 objectForKeyedSubscript:v6]);
        id v10 = (void *)objc_claimAutoreleasedReturnValue([v13 objectForKeyedSubscript:v7]);
      }
    }

    else
    {
      id v10 = 0LL;
    }
  }

  return v10;
}

- (id)description
{
  uint64_t v3 = objc_opt_class(self, a2);
  int64_t v4 = -[IDSOpportunisticCache accessCount](self, "accessCount");
  int v5 = (void *)objc_claimAutoreleasedReturnValue(-[IDSOpportunisticCache keychainCache](self, "keychainCache"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"<%@:%p accessCount: %lld, cache: %@>",  v3,  self,  v4,  v5));

  return v6;
}

- (NSMutableDictionary)keychainCache
{
  return self->_keychainCache;
}

- (void)setKeychainCache:(id)a3
{
}

- (int64_t)accessCount
{
  return self->_accessCount;
}

- (void)setAccessCount:(int64_t)a3
{
  self->_int64_t accessCount = a3;
}

- (IDSKeychainWrapper)keychainWrapper
{
  return self->_keychainWrapper;
}

- (void)setKeychainWrapper:(id)a3
{
}

- (IDSFrequentURISuggester)uriSuggester
{
  return self->_uriSuggester;
}

- (void)setUriSuggester:(id)a3
{
}

- (void).cxx_destruct
{
}

@end