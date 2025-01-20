@interface STStatusServerTransactionManager
- (STLocalStatusServer)server;
- (STStatusServerTransactionManager)initWithServer:(id)a3;
- (void)systemStatusServer:(id)a3 publishedDomainsDidChange:(id)a4;
@end

@implementation STStatusServerTransactionManager

- (STStatusServerTransactionManager)initWithServer:(id)a3
{
  id v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)&OBJC_CLASS___STStatusServerTransactionManager;
  v6 = -[STStatusServerTransactionManager init](&v11, "init");
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_server, a3);
    [v5 setDelegate:v7];
    v8 = objc_alloc_init(&OBJC_CLASS___BSMutableIntegerMap);
    transactionsByDomain = v7->_transactionsByDomain;
    v7->_transactionsByDomain = v8;
  }

  return v7;
}

- (void)systemStatusServer:(id)a3 publishedDomainsDidChange:(id)a4
{
  id v5 = a4;
  if (self) {
    transactionsByDomain = self->_transactionsByDomain;
  }
  else {
    transactionsByDomain = 0LL;
  }
  v7 = transactionsByDomain;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[BSMutableIntegerMap allKeys](v7, "allKeys"));
  id v9 = sub_100002A9C(v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue(v9);

  v33 = v5;
  id v11 = sub_100002A9C(v5);
  v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
  id v13 = [v10 mutableCopy];
  [v13 minusSet:v12];
  v31 = v12;
  id v14 = [v12 mutableCopy];
  v32 = v10;
  [v14 minusSet:v10];
  __int128 v40 = 0u;
  __int128 v41 = 0u;
  __int128 v38 = 0u;
  __int128 v39 = 0u;
  id v15 = v13;
  id v16 = [v15 countByEnumeratingWithState:&v38 objects:v43 count:16];
  if (v16)
  {
    id v17 = v16;
    uint64_t v18 = *(void *)v39;
    do
    {
      for (i = 0LL; i != v17; i = (char *)i + 1)
      {
        if (*(void *)v39 != v18) {
          objc_enumerationMutation(v15);
        }
        -[BSMutableIntegerMap removeObjectForKey:]( v7,  "removeObjectForKey:",  [*(id *)(*((void *)&v38 + 1) + 8 * (void)i) integerValue]);
      }

      id v17 = [v15 countByEnumeratingWithState:&v38 objects:v43 count:16];
    }

    while (v17);
  }

  __int128 v36 = 0u;
  __int128 v37 = 0u;
  __int128 v34 = 0u;
  __int128 v35 = 0u;
  id v20 = v14;
  id v21 = [v20 countByEnumeratingWithState:&v34 objects:v42 count:16];
  if (v21)
  {
    id v22 = v21;
    uint64_t v23 = *(void *)v35;
    do
    {
      for (j = 0LL; j != v22; j = (char *)j + 1)
      {
        if (*(void *)v35 != v23) {
          objc_enumerationMutation(v20);
        }
        id v25 = [*(id *)(*((void *)&v34 + 1) + 8 * (void)j) integerValue];
        uint64_t v26 = STSystemStatusDescriptionForDomain();
        v27 = (void *)objc_claimAutoreleasedReturnValue(v26);
        v28 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"publishing %@ data",  v27));

        id v29 = v28;
        v30 = (void *)os_transaction_create([v29 UTF8String]);
        -[BSMutableIntegerMap setObject:forKey:](v7, "setObject:forKey:", v30, v25);
      }

      id v22 = [v20 countByEnumeratingWithState:&v34 objects:v42 count:16];
    }

    while (v22);
  }
}

- (STLocalStatusServer)server
{
  return self->_server;
}

- (void).cxx_destruct
{
}

@end