@interface CKKSReloadAllItemsOperation
- (CKKSOperationDependencies)deps;
- (CKKSReloadAllItemsOperation)init;
- (CKKSReloadAllItemsOperation)initWithOperationDependencies:(id)a3;
- (void)main;
- (void)setDeps:(id)a3;
@end

@implementation CKKSReloadAllItemsOperation

- (CKKSReloadAllItemsOperation)init
{
  return 0LL;
}

- (CKKSReloadAllItemsOperation)initWithOperationDependencies:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___CKKSReloadAllItemsOperation;
  v6 = -[CKKSResultOperation init](&v9, "init");
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->super._descriptionUnderlyingError, a3);
  }

  return v7;
}

- (void)main
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSReloadAllItemsOperation deps](self, "deps"));
  v4 = (void *)objc_claimAutoreleasedReturnValue([v3 personaAdapter]);
  [v4 prepareThreadForKeychainAPIUseForPersonaIdentifier:0];

  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSReloadAllItemsOperation deps](self, "deps"));
  v6 = (void *)objc_claimAutoreleasedReturnValue([v5 databaseProvider]);

  __int128 v17 = 0u;
  __int128 v18 = 0u;
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSReloadAllItemsOperation deps](self, "deps"));
  v8 = (void *)objc_claimAutoreleasedReturnValue([v7 activeManagedViews]);

  id v9 = [v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v16;
    do
    {
      v12 = 0LL;
      do
      {
        if (*(void *)v16 != v11) {
          objc_enumerationMutation(v8);
        }
        uint64_t v13 = *(void *)(*((void *)&v15 + 1) + 8LL * (void)v12);
        v14[0] = _NSConcreteStackBlock;
        v14[1] = 3221225472LL;
        v14[2] = sub_100085788;
        v14[3] = &unk_1002904C8;
        v14[4] = self;
        v14[5] = v13;
        [v6 dispatchSyncWithSQLTransaction:v14];
        v12 = (char *)v12 + 1;
      }

      while (v10 != v12);
      id v10 = [v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }

    while (v10);
  }
}

- (CKKSOperationDependencies)deps
{
  return (CKKSOperationDependencies *)objc_getProperty(self, a2, 80LL, 1);
}

- (void)setDeps:(id)a3
{
}

- (void).cxx_destruct
{
}

@end