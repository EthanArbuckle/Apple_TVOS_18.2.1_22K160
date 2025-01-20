@interface CKKSFixupResaveDeviceStateEntriesOperation
- (CKKSFixupResaveDeviceStateEntriesOperation)initWithOperationDependencies:(id)a3;
- (CKKSOperationDependencies)deps;
- (OctagonStateString)intendedState;
- (OctagonStateString)nextState;
- (id)description;
- (void)groupStart;
- (void)setDeps:(id)a3;
- (void)setNextState:(id)a3;
@end

@implementation CKKSFixupResaveDeviceStateEntriesOperation

- (CKKSFixupResaveDeviceStateEntriesOperation)initWithOperationDependencies:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___CKKSFixupResaveDeviceStateEntriesOperation;
  v6 = -[CKKSGroupOperation init](&v9, "init");
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->super._queue, a3);
    objc_storeStrong((id *)&v7->super._startOperation, @"fixup_delete_tombstones");
    objc_storeStrong((id *)&v7->super._finishOperation, @"error");
  }

  return v7;
}

- (id)description
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSFixupResaveDeviceStateEntriesOperation deps](self, "deps"));
  v3 = (void *)objc_claimAutoreleasedReturnValue([v2 views]);
  v4 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"<CKKSFixup:ResaveCDSE (%@)>",  v3));

  return v4;
}

- (void)groupStart
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSFixupResaveDeviceStateEntriesOperation deps](self, "deps"));
  v4 = (void *)objc_claimAutoreleasedReturnValue([v3 personaAdapter]);
  [v4 prepareThreadForKeychainAPIUseForPersonaIdentifier:0];

  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSFixupResaveDeviceStateEntriesOperation deps](self, "deps"));
  v6 = (void *)objc_claimAutoreleasedReturnValue([v5 databaseProvider]);

  __int128 v17 = 0u;
  __int128 v18 = 0u;
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSFixupResaveDeviceStateEntriesOperation deps](self, "deps"));
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
        v14[2] = sub_10012A380;
        v14[3] = &unk_1002904C8;
        v14[4] = v13;
        v14[5] = self;
        [v6 dispatchSyncWithSQLTransaction:v14];
        v12 = (char *)v12 + 1;
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

- (void).cxx_destruct
{
}

@end