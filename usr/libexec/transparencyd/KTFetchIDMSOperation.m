@interface KTFetchIDMSOperation
- (KTFetchIDMSOperation)initWithDependencies:(id)a3 specificUser:(id)a4 intendedState:(id)a5 errorState:(id)a6;
- (KTOperationDependencies)deps;
- (KTSpecificUser)specificUser;
- (KTStateString)intendedState;
- (KTStateString)nextState;
- (NSOperation)finishedOp;
- (void)groupStart;
- (void)setDeps:(id)a3;
- (void)setFinishedOp:(id)a3;
- (void)setNextState:(id)a3;
- (void)setSpecificUser:(id)a3;
@end

@implementation KTFetchIDMSOperation

- (KTFetchIDMSOperation)initWithDependencies:(id)a3 specificUser:(id)a4 intendedState:(id)a5 errorState:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v19.receiver = self;
  v19.super_class = (Class)&OBJC_CLASS___KTFetchIDMSOperation;
  v15 = -[KTGroupOperation init](&v19, "init");
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->super._queue, a3);
    objc_storeStrong((id *)&v16->_intendedState, a4);
    objc_storeStrong((id *)&v16->super._startOperation, a5);
    objc_storeStrong((id *)&v16->super._finishOperation, a6);
    v17 = v16;
  }

  return v16;
}

- (void)groupStart
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[KTFetchIDMSOperation specificUser](self, "specificUser"));

  if (v3)
  {
    v4 = objc_alloc_init(&OBJC_CLASS___NSOperation);
    -[KTFetchIDMSOperation setFinishedOp:](self, "setFinishedOp:", v4);

    v5 = objc_alloc_init(&OBJC_CLASS___KTResultOperation);
    id v6 = -[KTResultOperation timeout:](v5, "timeout:", 30000000000LL);
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[KTFetchIDMSOperation finishedOp](self, "finishedOp"));
    -[KTResultOperation addDependency:](v5, "addDependency:", v7);

    -[KTGroupOperation dependOnBeforeGroupFinished:](self, "dependOnBeforeGroupFinished:", v5);
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[KTGroupOperation operationQueue](self, "operationQueue"));
    [v8 addOperation:v5];

    id location = 0LL;
    objc_initWeak(&location, self);
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[KTFetchIDMSOperation deps](self, "deps"));
    v10 = (void *)objc_claimAutoreleasedReturnValue([v9 idmsOperations]);
    id v11 = (void *)objc_claimAutoreleasedReturnValue(-[KTFetchIDMSOperation specificUser](self, "specificUser"));
    id v12 = (void *)objc_claimAutoreleasedReturnValue([v11 altDSID]);
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472LL;
    v14[2] = sub_100161CF0;
    v14[3] = &unk_100284F68;
    objc_copyWeak(&v15, &location);
    [v10 refreshDeviceList:v12 complete:v14];

    objc_destroyWeak(&v15);
    objc_destroyWeak(&location);
  }

  else
  {
    id v13 = (id)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  kTransparencyErrorInternal,  -392LL,  0LL));
    -[KTResultOperation setError:](self, "setError:", v13);
  }

- (KTStateString)intendedState
{
  return (KTStateString *)objc_getProperty(self, a2, 120LL, 1);
}

- (KTStateString)nextState
{
  return (KTStateString *)objc_getProperty(self, a2, 128LL, 1);
}

- (void)setNextState:(id)a3
{
}

- (KTOperationDependencies)deps
{
  return (KTOperationDependencies *)objc_getProperty(self, a2, 136LL, 1);
}

- (void)setDeps:(id)a3
{
}

- (NSOperation)finishedOp
{
  return (NSOperation *)objc_getProperty(self, a2, 144LL, 1);
}

- (void)setFinishedOp:(id)a3
{
}

- (KTSpecificUser)specificUser
{
  return (KTSpecificUser *)objc_getProperty(self, a2, 152LL, 1);
}

- (void)setSpecificUser:(id)a3
{
}

- (void).cxx_destruct
{
}

@end