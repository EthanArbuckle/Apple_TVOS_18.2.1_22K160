@interface MTIDCompositeSecretStore
- (MTIDCompositeSecretStore)init;
- (NSMutableDictionary)stores;
- (id)debugInfo;
- (id)maintainSchemes:(id)a3 options:(id)a4;
- (id)resetSchemes:(id)a3 options:(id)a4;
- (id)schemesGroupedByStore:(id)a3;
- (id)secretForScheme:(id)a3 options:(id)a4;
- (id)secretStoreForScheme:(id)a3;
- (id)storeKeyForScheme:(id)a3;
- (id)syncForSchemes:(id)a3 options:(id)a4;
- (void)clearLocalData;
- (void)setStores:(id)a3;
@end

@implementation MTIDCompositeSecretStore

- (MTIDCompositeSecretStore)init
{
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___MTIDCompositeSecretStore;
  v2 = -[MTIDCompositeSecretStore init](&v5, "init");
  if (v2)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableDictionary dictionaryWithCapacity:]( &OBJC_CLASS___NSMutableDictionary,  "dictionaryWithCapacity:",  4LL));
    -[MTIDCompositeSecretStore setStores:](v2, "setStores:", v3);
  }

  return v2;
}

- (id)storeKeyForScheme:(id)a3
{
  id v3 = a3;
  id v4 = [v3 idType];
  objc_super v5 = @"Local";
  if (v4 == (id)2) {
    objc_super v5 = @"Cloud";
  }
  v6 = v5;
  v7 = (void *)objc_claimAutoreleasedReturnValue([v3 containerIdentifier]);

  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%@-%@", v6, v7));
  return v8;
}

- (id)secretStoreForScheme:(id)a3
{
  id v4 = a3;
  objc_super v5 = self;
  objc_sync_enter(v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[MTIDCompositeSecretStore storeKeyForScheme:](v5, "storeKeyForScheme:", v4));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[MTIDCompositeSecretStore stores](v5, "stores"));
  v8 = (void *)objc_claimAutoreleasedReturnValue([v7 objectForKeyedSubscript:v6]);

  if (v8)
  {
    v9 = v8;
  }

  else
  {
    v10 = objc_alloc(&OBJC_CLASS___MTIDCloudKitStore);
    v11 = (void *)objc_claimAutoreleasedReturnValue([v4 containerIdentifier]);
    v9 = -[MTIDCloudKitStore initWithContainerIdentifer:enableSync:]( v10,  "initWithContainerIdentifer:enableSync:",  v11,  [v4 idType] == (id)2);

    v12 = (void *)objc_claimAutoreleasedReturnValue(-[MTIDCompositeSecretStore stores](v5, "stores"));
    [v12 setObject:v9 forKeyedSubscript:v6];
  }

  objc_sync_exit(v5);
  return v9;
}

- (id)schemesGroupedByStore:(id)a3
{
  id v4 = a3;
  objc_super v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableDictionary dictionaryWithCapacity:]( &OBJC_CLASS___NSMutableDictionary,  "dictionaryWithCapacity:",  1LL));
  __int128 v18 = 0u;
  __int128 v19 = 0u;
  __int128 v20 = 0u;
  __int128 v21 = 0u;
  id v6 = v4;
  id v7 = [v6 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v19;
    do
    {
      for (i = 0LL; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v19 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void *)(*((void *)&v18 + 1) + 8LL * (void)i);
        v12 = (void *)objc_claimAutoreleasedReturnValue(-[MTIDCompositeSecretStore storeKeyForScheme:](self, "storeKeyForScheme:", v11, (void)v18));
        v13 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKeyedSubscript:v12]);
        v14 = v13;
        if (v13) {
          id v15 = v13;
        }
        else {
          id v15 = (id)objc_claimAutoreleasedReturnValue( +[NSMutableArray arrayWithCapacity:]( NSMutableArray,  "arrayWithCapacity:",  [v6 count]));
        }
        v16 = v15;

        [v16 addObject:v11];
        [v5 setObject:v16 forKeyedSubscript:v12];
      }

      id v8 = [v6 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }

    while (v8);
  }

  return v5;
}

- (id)secretForScheme:(id)a3 options:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[MTIDCompositeSecretStore secretStoreForScheme:](self, "secretStoreForScheme:", v7));
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([v8 secretForScheme:v7 options:v6]);

  return v9;
}

- (id)resetSchemes:(id)a3 options:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  __int128 v21 = v6;
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(-[MTIDCompositeSecretStore schemesGroupedByStore:](self, "schemesGroupedByStore:", v6));
  __int128 v22 = 0u;
  __int128 v23 = 0u;
  __int128 v24 = 0u;
  __int128 v25 = 0u;
  id v10 = [v9 countByEnumeratingWithState:&v22 objects:v26 count:16];
  if (v10)
  {
    id v11 = v10;
    uint64_t v12 = *(void *)v23;
    do
    {
      for (i = 0LL; i != v11; i = (char *)i + 1)
      {
        if (*(void *)v23 != v12) {
          objc_enumerationMutation(v9);
        }
        v14 = (void *)objc_claimAutoreleasedReturnValue( [v9 objectForKeyedSubscript:*(void *)(*((void *)&v22 + 1) + 8 * (void)i)]);
        id v15 = (void *)objc_claimAutoreleasedReturnValue([v14 firstObject]);
        v16 = (void *)objc_claimAutoreleasedReturnValue(-[MTIDCompositeSecretStore secretStoreForScheme:](self, "secretStoreForScheme:", v15));

        v17 = (void *)objc_claimAutoreleasedReturnValue([v16 resetSchemes:v14 options:v7]);
        [v8 addObject:v17];
      }

      id v11 = [v9 countByEnumeratingWithState:&v22 objects:v26 count:16];
    }

    while (v11);
  }

  if ([v8 count])
  {
    __int128 v18 = (void *)objc_claimAutoreleasedReturnValue(+[MTPromise promiseWithAll:](&OBJC_CLASS___MTPromise, "promiseWithAll:", v8));
    __int128 v19 = (void *)objc_claimAutoreleasedReturnValue([v18 thenWithBlock:&stru_100020E08]);
  }

  else
  {
    __int128 v19 = (void *)objc_claimAutoreleasedReturnValue(+[MTPromise promiseWithResult:](&OBJC_CLASS___MTPromise, "promiseWithResult:", &__kCFBooleanTrue));
  }

  return v19;
}

- (id)maintainSchemes:(id)a3 options:(id)a4
{
  id v6 = a3;
  id v21 = a4;
  id v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  __int128 v20 = v6;
  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[MTIDCompositeSecretStore schemesGroupedByStore:](self, "schemesGroupedByStore:", v6));
  __int128 v22 = 0u;
  __int128 v23 = 0u;
  __int128 v24 = 0u;
  __int128 v25 = 0u;
  id v9 = [v8 countByEnumeratingWithState:&v22 objects:v26 count:16];
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v23;
    do
    {
      for (i = 0LL; i != v10; i = (char *)i + 1)
      {
        if (*(void *)v23 != v11) {
          objc_enumerationMutation(v8);
        }
        v13 = (void *)objc_claimAutoreleasedReturnValue( [v8 objectForKeyedSubscript:*(void *)(*((void *)&v22 + 1) + 8 * (void)i)]);
        v14 = (void *)objc_claimAutoreleasedReturnValue([v13 firstObject]);
        id v15 = (void *)objc_claimAutoreleasedReturnValue(-[MTIDCompositeSecretStore secretStoreForScheme:](self, "secretStoreForScheme:", v14));

        if ((objc_opt_respondsToSelector(v15, "maintainSchemes:options:") & 1) != 0)
        {
          v16 = (void *)objc_claimAutoreleasedReturnValue([v15 maintainSchemes:v13 options:v21]);
          [v7 addObject:v16];
        }
      }

      id v10 = [v8 countByEnumeratingWithState:&v22 objects:v26 count:16];
    }

    while (v10);
  }

  if ([v7 count])
  {
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[MTPromise promiseWithAll:](&OBJC_CLASS___MTPromise, "promiseWithAll:", v7));
    __int128 v18 = (void *)objc_claimAutoreleasedReturnValue([v17 thenWithBlock:&stru_100020E28]);
  }

  else
  {
    __int128 v18 = (void *)objc_claimAutoreleasedReturnValue(+[MTPromise promiseWithResult:](&OBJC_CLASS___MTPromise, "promiseWithResult:", &__kCFBooleanTrue));
  }

  return v18;
}

- (void)clearLocalData
{
  v2 = self;
  objc_sync_enter(v2);
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[MTIDCompositeSecretStore stores](v2, "stores"));
  id v4 = [v3 copy];

  objc_sync_exit(v2);
  [v4 enumerateKeysAndObjectsUsingBlock:&stru_100020E68];
}

- (id)debugInfo
{
  v2 = self;
  objc_sync_enter(v2);
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[MTIDCompositeSecretStore stores](v2, "stores"));
  id v4 = [v3 copy];

  objc_sync_exit(v2);
  id v8 = _NSConcreteStackBlock;
  uint64_t v9 = 3221225472LL;
  id v10 = sub_10001542C;
  uint64_t v11 = &unk_100020E90;
  id v12 = (id)objc_claimAutoreleasedReturnValue( +[NSMutableArray arrayWithCapacity:]( NSMutableArray,  "arrayWithCapacity:",  [v4 count]));
  id v5 = v12;
  [v4 enumerateKeysAndObjectsUsingBlock:&v8];
  v13 = @"subStores";
  id v14 = v5;
  id v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v14,  &v13,  1LL,  v8,  v9,  v10,  v11));

  return v6;
}

- (id)syncForSchemes:(id)a3 options:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  id v21 = v6;
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(-[MTIDCompositeSecretStore schemesGroupedByStore:](self, "schemesGroupedByStore:", v6));
  __int128 v22 = 0u;
  __int128 v23 = 0u;
  __int128 v24 = 0u;
  __int128 v25 = 0u;
  id v10 = [v9 countByEnumeratingWithState:&v22 objects:v26 count:16];
  if (v10)
  {
    id v11 = v10;
    uint64_t v12 = *(void *)v23;
    do
    {
      for (i = 0LL; i != v11; i = (char *)i + 1)
      {
        if (*(void *)v23 != v12) {
          objc_enumerationMutation(v9);
        }
        id v14 = (void *)objc_claimAutoreleasedReturnValue( [v9 objectForKeyedSubscript:*(void *)(*((void *)&v22 + 1) + 8 * (void)i)]);
        id v15 = (void *)objc_claimAutoreleasedReturnValue([v14 firstObject]);
        v16 = (void *)objc_claimAutoreleasedReturnValue(-[MTIDCompositeSecretStore secretStoreForScheme:](self, "secretStoreForScheme:", v15));

        v17 = (void *)objc_claimAutoreleasedReturnValue([v16 syncForSchemes:v14 options:v7]);
        if (v17) {
          [v8 addObject:v17];
        }
      }

      id v11 = [v9 countByEnumeratingWithState:&v22 objects:v26 count:16];
    }

    while (v11);
  }

  if ([v8 count])
  {
    __int128 v18 = (void *)objc_claimAutoreleasedReturnValue(+[MTPromise promiseWithAll:](&OBJC_CLASS___MTPromise, "promiseWithAll:", v8));
    __int128 v19 = (void *)objc_claimAutoreleasedReturnValue([v18 thenWithBlock:&stru_100020EB0]);
  }

  else
  {
    __int128 v19 = (void *)objc_claimAutoreleasedReturnValue(+[MTPromise promiseWithResult:](&OBJC_CLASS___MTPromise, "promiseWithResult:", &__kCFBooleanFalse));
  }

  return v19;
}

- (NSMutableDictionary)stores
{
  return self->_stores;
}

- (void)setStores:(id)a3
{
}

- (void).cxx_destruct
{
}

@end