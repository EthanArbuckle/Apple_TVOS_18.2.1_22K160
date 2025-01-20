@interface VSUserAccountManager
- (id)groupedDeveloperAccounts:(id)a3;
- (void)fetchDeveloperUserAccountsWithCompletion:(id)a3;
@end

@implementation VSUserAccountManager

- (void)fetchDeveloperUserAccountsWithCompletion:(id)a3
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = sub_44C4;
  v4[3] = &unk_8248;
  v5 = self;
  id v6 = a3;
  id v3 = v6;
  -[VSUserAccountManager queryUserAccountsWithOptions:completion:]( v5,  "queryUserAccountsWithOptions:completion:",  1LL,  v4);
}

- (id)groupedDeveloperAccounts:(id)a3
{
  id v3 = a3;
  v4 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  __int128 v33 = 0u;
  __int128 v34 = 0u;
  __int128 v35 = 0u;
  __int128 v36 = 0u;
  id v5 = v3;
  id v6 = [v5 countByEnumeratingWithState:&v33 objects:v39 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v34;
    do
    {
      for (i = 0LL; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v34 != v8) {
          objc_enumerationMutation(v5);
        }
        v10 = *(void **)(*((void *)&v33 + 1) + 8LL * (void)i);
        v11 = (void *)objc_claimAutoreleasedReturnValue([v10 sourceIdentifier]);
        v12 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](v4, "objectForKeyedSubscript:", v11));

        if (([v10 isSignedOut] & 1) == 0)
        {
          if (v12)
          {
            [v12 addObject:v10];
          }

          else
          {
            v38 = v10;
            v13 = (void *)objc_claimAutoreleasedReturnValue( +[NSArray arrayWithObjects:count:]( &OBJC_CLASS___NSArray,  "arrayWithObjects:count:",  &v38,  1LL));
            id v14 = [v13 mutableCopy];
            v15 = (void *)objc_claimAutoreleasedReturnValue([v10 sourceIdentifier]);
            -[NSMutableDictionary setObject:forKeyedSubscript:](v4, "setObject:forKeyedSubscript:", v14, v15);
          }
        }
      }

      id v7 = [v5 countByEnumeratingWithState:&v33 objects:v39 count:16];
    }

    while (v7);
  }

  v27 = v5;

  v28 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  __int128 v29 = 0u;
  __int128 v30 = 0u;
  __int128 v31 = 0u;
  __int128 v32 = 0u;
  v16 = v4;
  id v17 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:]( v16,  "countByEnumeratingWithState:objects:count:",  &v29,  v37,  16LL);
  if (v17)
  {
    id v18 = v17;
    uint64_t v19 = *(void *)v30;
    do
    {
      for (j = 0LL; j != v18; j = (char *)j + 1)
      {
        if (*(void *)v30 != v19) {
          objc_enumerationMutation(v16);
        }
        uint64_t v21 = *(void *)(*((void *)&v29 + 1) + 8LL * (void)j);
        v22 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](v16, "objectForKeyedSubscript:", v21));
        v23 = (void *)objc_claimAutoreleasedReturnValue( +[NSPredicate predicateWithFormat:]( &OBJC_CLASS___NSPredicate,  "predicateWithFormat:",  @"%K == TRUE",  @"isDeveloperCreated"));
        v24 = (void *)objc_claimAutoreleasedReturnValue([v22 filteredArrayUsingPredicate:v23]);
        if (![v24 count]) {
          -[NSMutableArray addObject:](v28, "addObject:", v21);
        }
      }

      id v18 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:]( v16,  "countByEnumeratingWithState:objects:count:",  &v29,  v37,  16LL);
    }

    while (v18);
  }

  -[NSMutableDictionary removeObjectsForKeys:](v16, "removeObjectsForKeys:", v28);
  id v25 = -[NSMutableDictionary copy](v16, "copy");

  return v25;
}

@end