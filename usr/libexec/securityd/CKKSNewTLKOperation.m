@interface CKKSNewTLKOperation
- (BOOL)rollTLKIfPresent;
- (CKKSNewTLKOperation)init;
- (CKKSNewTLKOperation)initWithDependencies:(id)a3 rollTLKIfPresent:(BOOL)a4 preexistingPendingKeySets:(id)a5 intendedState:(id)a6 errorState:(id)a7;
- (CKKSOperationDependencies)deps;
- (NSDictionary)keysets;
- (NSDictionary)previousPendingKeySets;
- (OctagonStateString)intendedState;
- (OctagonStateString)nextState;
- (void)cancel;
- (void)groupStart;
- (void)setKeysets:(id)a3;
- (void)setNextState:(id)a3;
- (void)setPreviousPendingKeySets:(id)a3;
- (void)setRollTLKIfPresent:(BOOL)a3;
@end

@implementation CKKSNewTLKOperation

- (CKKSNewTLKOperation)init
{
  return 0LL;
}

- (CKKSNewTLKOperation)initWithDependencies:(id)a3 rollTLKIfPresent:(BOOL)a4 preexistingPendingKeySets:(id)a5 intendedState:(id)a6 errorState:(id)a7
{
  id v13 = a3;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  v37.receiver = self;
  v37.super_class = (Class)&OBJC_CLASS___CKKSNewTLKOperation;
  v17 = -[CKKSGroupOperation init](&v37, "init");
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)(v17 + 150), a3);
    v18[128] = a4;
    if (v14)
    {
      id v29 = v16;
      id v30 = v15;
      id v31 = a7;
      id v32 = v13;
      v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
      __int128 v33 = 0u;
      __int128 v34 = 0u;
      __int128 v35 = 0u;
      __int128 v36 = 0u;
      v20 = (void *)objc_claimAutoreleasedReturnValue([v14 allKeys]);
      id v21 = [v20 countByEnumeratingWithState:&v33 objects:v38 count:16];
      if (v21)
      {
        id v22 = v21;
        uint64_t v23 = *(void *)v34;
        do
        {
          for (i = 0LL; i != v22; i = (char *)i + 1)
          {
            if (*(void *)v34 != v23) {
              objc_enumerationMutation(v20);
            }
            uint64_t v25 = *(void *)(*((void *)&v33 + 1) + 8LL * (void)i);
            v26 = (void *)objc_claimAutoreleasedReturnValue([v14 objectForKeyedSubscript:v25]);
          }

          id v22 = [v20 countByEnumeratingWithState:&v33 objects:v38 count:16];
        }

        while (v22);
      }

      v27 = *(void **)(v18 + 166);
      *(void *)(v18 + 166) = v19;
      a7 = v31;
      id v13 = v32;
      id v16 = v29;
      id v15 = v30;
    }

    else
    {
      v27 = *(void **)(v18 + 166);
      *(void *)(v18 + 166) = 0LL;
    }

    objc_storeStrong((id *)(v18 + 134), a6);
    objc_storeStrong((id *)(v18 + 142), a7);
  }

  return (CKKSNewTLKOperation *)v18;
}

- (void)groupStart
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSNewTLKOperation deps](self, "deps"));
  v4 = (void *)objc_claimAutoreleasedReturnValue([v3 personaAdapter]);
  [v4 prepareThreadForKeychainAPIUseForPersonaIdentifier:0];

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSNewTLKOperation deps](self, "deps"));
  uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue([v5 databaseProvider]);

  uint64_t v36 = 0LL;
  objc_super v37 = &v36;
  uint64_t v38 = 0x2020000000LL;
  char v39 = 0;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](&OBJC_CLASS___NSMutableSet, "set"));
  v33[0] = _NSConcreteStackBlock;
  v33[1] = 3221225472LL;
  v33[2] = sub_100134020;
  v33[3] = &unk_100290578;
  v33[4] = self;
  id v24 = v6;
  id v34 = v24;
  id v8 = v7;
  id v35 = v8;
  [v23 dispatchSyncWithReadOnlySQLTransaction:v33];
  __int128 v31 = 0u;
  __int128 v32 = 0u;
  __int128 v29 = 0u;
  __int128 v30 = 0u;
  id obj = v8;
  id v9 = 0LL;
  id v10 = [obj countByEnumeratingWithState:&v29 objects:v40 count:16];
  if (v10)
  {
    uint64_t v11 = *(void *)v30;
    do
    {
      for (i = 0LL; i != v10; i = (char *)i + 1)
      {
        if (*(void *)v30 != v11) {
          objc_enumerationMutation(obj);
        }
        uint64_t v13 = *(void *)(*((void *)&v29 + 1) + 8LL * (void)i);
        if (!v9)
        {
          id v14 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSNewTLKOperation deps](self, "deps"));
          id v9 = (id)objc_claimAutoreleasedReturnValue([v14 currentTrustStates]);
        }

        v25[0] = _NSConcreteStackBlock;
        v25[1] = 3221225472LL;
        v25[2] = sub_100134318;
        v25[3] = &unk_1002902F8;
        v25[4] = v13;
        v25[5] = self;
        v28 = &v36;
        id v9 = v9;
        id v26 = v9;
        id v27 = v24;
        [v23 dispatchSyncWithSQLTransaction:v25];
      }

      id v10 = [obj countByEnumeratingWithState:&v29 objects:v40 count:16];
    }

    while (v10);
  }

  if ([v24 count])
  {
    id v15 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSNewTLKOperation deps](self, "deps"));
    [v15 provideKeySets:v24];
  }

  id v16 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSResultOperation error](self, "error"));
  BOOL v17 = v16 == 0LL;

  if (v17) {
    -[CKKSNewTLKOperation setKeysets:](self, "setKeysets:", v24);
  }
  if (*((_BYTE *)v37 + 24))
  {
    v18 = -[OctagonPendingFlag initWithFlag:conditions:]( objc_alloc(&OBJC_CLASS___OctagonPendingFlag),  "initWithFlag:conditions:",  @"key_set",  1LL);
    v19 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSNewTLKOperation deps](self, "deps"));
    v20 = (void *)objc_claimAutoreleasedReturnValue([v19 flagHandler]);
    [v20 handlePendingFlag:v18];
  }

  id v21 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSNewTLKOperation intendedState](self, "intendedState"));
  -[CKKSNewTLKOperation setNextState:](self, "setNextState:", v21);

  _Block_object_dispose(&v36, 8);
}

- (void)cancel
{
  v2.receiver = self;
  v2.super_class = (Class)&OBJC_CLASS___CKKSNewTLKOperation;
  -[CKKSGroupOperation cancel](&v2, "cancel");
}

- (OctagonStateString)intendedState
{
  return (OctagonStateString *)objc_getProperty(self, a2, 134LL, 1);
}

- (OctagonStateString)nextState
{
  return (OctagonStateString *)objc_getProperty(self, a2, 142LL, 1);
}

- (void)setNextState:(id)a3
{
}

- (CKKSOperationDependencies)deps
{
  return (CKKSOperationDependencies *)objc_getProperty(self, a2, 150LL, 1);
}

- (NSDictionary)keysets
{
  return (NSDictionary *)objc_getProperty(self, a2, 158LL, 1);
}

- (void)setKeysets:(id)a3
{
}

- (BOOL)rollTLKIfPresent
{
  return (uint64_t)self->super._startOperation & 1;
}

- (void)setRollTLKIfPresent:(BOOL)a3
{
  LOBYTE(self->super._startOperation) = a3;
}

- (NSDictionary)previousPendingKeySets
{
  return (NSDictionary *)objc_getProperty(self, a2, 166LL, 1);
}

- (void)setPreviousPendingKeySets:(id)a3
{
}

- (void).cxx_destruct
{
}

@end