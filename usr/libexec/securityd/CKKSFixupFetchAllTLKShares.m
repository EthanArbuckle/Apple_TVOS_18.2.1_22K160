@interface CKKSFixupFetchAllTLKShares
- (CKKSFixupFetchAllTLKShares)initWithOperationDependencies:(id)a3 ckoperationGroup:(id)a4;
- (CKKSOperationDependencies)deps;
- (CKOperationGroup)group;
- (OctagonStateString)intendedState;
- (OctagonStateString)nextState;
- (id)description;
- (void)groupStart;
- (void)setDeps:(id)a3;
- (void)setGroup:(id)a3;
- (void)setNextState:(id)a3;
@end

@implementation CKKSFixupFetchAllTLKShares

- (CKKSFixupFetchAllTLKShares)initWithOperationDependencies:(id)a3 ckoperationGroup:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)&OBJC_CLASS___CKKSFixupFetchAllTLKShares;
  v9 = -[CKKSGroupOperation init](&v12, "init");
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->super._queue, a3);
    objc_storeStrong((id *)&v10->super._internalSuccesses, a4);
    objc_storeStrong((id *)&v10->super._startOperation, @"fixup_local_reload");
    objc_storeStrong((id *)&v10->super._finishOperation, @"error");
  }

  return v10;
}

- (id)description
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSFixupFetchAllTLKShares deps](self, "deps"));
  v3 = (void *)objc_claimAutoreleasedReturnValue([v2 views]);
  v4 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"<CKKSFixup:FetchAllTLKShares (%@)>",  v3));

  return v4;
}

- (void)groupStart
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSFixupFetchAllTLKShares deps](self, "deps"));
  v4 = (void *)objc_claimAutoreleasedReturnValue([v3 personaAdapter]);
  [v4 prepareThreadForKeychainAPIUseForPersonaIdentifier:0];

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSFixupFetchAllTLKShares deps](self, "deps"));
  v6 = (void *)objc_claimAutoreleasedReturnValue([v5 databaseProvider]);

  __int128 v17 = 0u;
  __int128 v18 = 0u;
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSFixupFetchAllTLKShares deps](self, "deps"));
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 activeManagedViews]);

  id v9 = [v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v16;
    do
    {
      objc_super v12 = 0LL;
      do
      {
        if (*(void *)v16 != v11) {
          objc_enumerationMutation(v8);
        }
        uint64_t v13 = *(void *)(*((void *)&v15 + 1) + 8LL * (void)v12);
        v14[0] = _NSConcreteStackBlock;
        v14[1] = 3221225472LL;
        v14[2] = sub_100128F38;
        v14[3] = &unk_1002904C8;
        v14[4] = self;
        v14[5] = v13;
        [v6 dispatchSyncWithSQLTransaction:v14];
        objc_super v12 = (char *)v12 + 1;
      }

      while (v10 != v12);
      id v10 = [v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }

    while (v10);
  }
}

- (OctagonStateString)intendedState
{
  return (OctagonStateString *)objc_getProperty(self, a2, 128LL, 1);
}

- (OctagonStateString)nextState
{
  return (OctagonStateString *)objc_getProperty(self, a2, 136LL, 1);
}

- (void)setNextState:(id)a3
{
}

- (CKKSOperationDependencies)deps
{
  return (CKKSOperationDependencies *)objc_getProperty(self, a2, 144LL, 1);
}

- (void)setDeps:(id)a3
{
}

- (CKOperationGroup)group
{
  return (CKOperationGroup *)objc_getProperty(self, a2, 152LL, 1);
}

- (void)setGroup:(id)a3
{
}

- (void).cxx_destruct
{
}

@end