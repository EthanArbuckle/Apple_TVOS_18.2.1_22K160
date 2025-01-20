@interface OTResetCKKSZonesLackingTLKsOperation
- (NSOperation)finishedOp;
- (OTOperationDependencies)deps;
- (OTResetCKKSZonesLackingTLKsOperation)initWithDependencies:(id)a3 intendedState:(id)a4 errorState:(id)a5;
- (OctagonStateString)intendedState;
- (OctagonStateString)nextState;
- (void)groupStart;
- (void)proceedWithKeys:(id)a3 incompleteKeySets:(id)a4;
- (void)resetViews:(id)a3;
- (void)setDeps:(id)a3;
- (void)setFinishedOp:(id)a3;
- (void)setNextState:(id)a3;
@end

@implementation OTResetCKKSZonesLackingTLKsOperation

- (OTResetCKKSZonesLackingTLKsOperation)initWithDependencies:(id)a3 intendedState:(id)a4 errorState:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)&OBJC_CLASS___OTResetCKKSZonesLackingTLKsOperation;
  v12 = -[CKKSGroupOperation init](&v15, "init");
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->super._queue, a3);
    objc_storeStrong((id *)&v13->super._finishOperation, a4);
    objc_storeStrong((id *)&v13->super._startOperation, a5);
  }

  return v13;
}

- (void)groupStart
{
  v3 = sub_10001267C("octagon");
  v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "Checking if any CKKS zones need resetting",  buf,  2u);
  }

  *(void *)buf = 0xAAAAAAAAAAAAAAAALL;
  objc_initWeak((id *)buf, self);
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472LL;
  v15[2] = sub_1000A7F80;
  v15[3] = &unk_100291A38;
  objc_copyWeak(&v16, (id *)buf);
  v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSBlockOperation blockOperationWithBlock:]( &OBJC_CLASS___NSBlockOperation,  "blockOperationWithBlock:",  v15));
  -[OTResetCKKSZonesLackingTLKsOperation setFinishedOp:](self, "setFinishedOp:", v5);

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[OTResetCKKSZonesLackingTLKsOperation finishedOp](self, "finishedOp"));
  -[CKKSGroupOperation dependOnBeforeGroupFinished:](self, "dependOnBeforeGroupFinished:", v6);

  v7 = objc_alloc(&OBJC_CLASS___OTFetchCKKSKeysOperation);
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[OTResetCKKSZonesLackingTLKsOperation deps](self, "deps"));
  id v9 = -[OTFetchCKKSKeysOperation initWithDependencies:refetchNeeded:]( v7,  "initWithDependencies:refetchNeeded:",  v8,  0LL);

  -[CKKSGroupOperation runBeforeGroupFinished:](self, "runBeforeGroupFinished:", v9);
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472LL;
  v12[2] = sub_1000A8060;
  v12[3] = &unk_100290FC8;
  objc_copyWeak(&v14, (id *)buf);
  id v10 = v9;
  v13 = v10;
  id v11 = (void *)objc_claimAutoreleasedReturnValue( +[CKKSResultOperation named:withBlock:]( &OBJC_CLASS___CKKSResultOperation,  "named:withBlock:",  @"continue-ckks-resets",  v12));
  [v11 addDependency:v10];
  -[CKKSGroupOperation runBeforeGroupFinished:](self, "runBeforeGroupFinished:", v11);

  objc_destroyWeak(&v14);
  objc_destroyWeak(&v16);
  objc_destroyWeak((id *)buf);
}

- (void)proceedWithKeys:(id)a3 incompleteKeySets:(id)a4
{
  v24 = self;
  id v4 = a4;
  v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](&OBJC_CLASS___NSMutableSet, "set"));
  __int128 v26 = 0u;
  __int128 v27 = 0u;
  __int128 v28 = 0u;
  __int128 v29 = 0u;
  id v5 = v4;
  id v6 = [v5 countByEnumeratingWithState:&v26 objects:v32 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v27;
    do
    {
      for (i = 0LL; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v27 != v8) {
          objc_enumerationMutation(v5);
        }
        id v10 = *(void **)(*((void *)&v26 + 1) + 8LL * (void)i);
        id v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "error", v24));

        if (v11)
        {
          v12 = sub_10001267C("octagon-ckks");
          v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
          if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            v31 = v10;
            _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_DEFAULT,  "Error loading key set %@; not attempting reset",
              buf,
              0xCu);
          }

- (void)resetViews:(id)a3
{
  id v4 = a3;
  id v5 = sub_10001267C("octagon-ckks");
  id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v21 = v4;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Resetting CKKS view %@", buf, 0xCu);
  }

  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[OTResetCKKSZonesLackingTLKsOperation deps](self, "deps"));
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v7 ckks]);
  id v9 = (void *)objc_claimAutoreleasedReturnValue([v8 rpcResetCloudKit:v4 reply:&stru_100284EE8]);

  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472LL;
  v18[2] = sub_1000A7E68;
  v18[3] = &unk_1002927F0;
  id v19 = v4;
  id v10 = v4;
  id v11 = (void *)objc_claimAutoreleasedReturnValue( +[CKKSResultOperation named:withBlock:]( &OBJC_CLASS___CKKSResultOperation,  "named:withBlock:",  @"wait-for-ckks-reset",  v18));
  id v12 = [v11 timeout:120000000000];
  [v11 addDependency:v9];
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSGroupOperation operationQueue](self, "operationQueue"));
  [v13 addOperation:v11];

  uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue(-[OTResetCKKSZonesLackingTLKsOperation finishedOp](self, "finishedOp"));
  [v14 addDependency:v11];

  objc_super v15 = (void *)objc_claimAutoreleasedReturnValue(-[OTResetCKKSZonesLackingTLKsOperation intendedState](self, "intendedState"));
  -[OTResetCKKSZonesLackingTLKsOperation setNextState:](self, "setNextState:", v15);

  id v16 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSGroupOperation operationQueue](self, "operationQueue"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(-[OTResetCKKSZonesLackingTLKsOperation finishedOp](self, "finishedOp"));
  [v16 addOperation:v17];
}

- (OctagonStateString)nextState
{
  return (OctagonStateString *)objc_getProperty(self, a2, 128LL, 1);
}

- (void)setNextState:(id)a3
{
}

- (OctagonStateString)intendedState
{
  return (OctagonStateString *)objc_getProperty(self, a2, 136LL, 1);
}

- (OTOperationDependencies)deps
{
  return (OTOperationDependencies *)objc_getProperty(self, a2, 144LL, 1);
}

- (void)setDeps:(id)a3
{
}

- (NSOperation)finishedOp
{
  return (NSOperation *)objc_getProperty(self, a2, 152LL, 1);
}

- (void)setFinishedOp:(id)a3
{
}

- (void).cxx_destruct
{
}

@end