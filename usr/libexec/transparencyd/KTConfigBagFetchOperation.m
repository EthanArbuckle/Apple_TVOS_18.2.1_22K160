@interface KTConfigBagFetchOperation
- (KTConfigBagFetchOperation)initWithDependencies:(id)a3 intendedState:(id)a4 errorState:(id)a5 triggerInterface:(id)a6;
- (KTOperationDependencies)deps;
- (KTSMTriggerInterface)triggerInterface;
- (KTStateString)intendedState;
- (KTStateString)nextState;
- (NSOperation)finishedOp;
- (void)groupStart;
- (void)setDeps:(id)a3;
- (void)setFinishedOp:(id)a3;
- (void)setNextState:(id)a3;
- (void)setTriggerInterface:(id)a3;
@end

@implementation KTConfigBagFetchOperation

- (KTConfigBagFetchOperation)initWithDependencies:(id)a3 intendedState:(id)a4 errorState:(id)a5 triggerInterface:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v18.receiver = self;
  v18.super_class = (Class)&OBJC_CLASS___KTConfigBagFetchOperation;
  v15 = -[KTGroupOperation init](&v18, "init");
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->super._queue, a3);
    objc_storeStrong((id *)&v16->super._startOperation, a4);
    objc_storeStrong((id *)&v16->super._finishOperation, a5);
    objc_storeStrong((id *)&v16->_intendedState, a6);
  }

  return v16;
}

- (void)groupStart
{
  v3 = objc_alloc_init(&OBJC_CLASS___NSOperation);
  -[KTConfigBagFetchOperation setFinishedOp:](self, "setFinishedOp:", v3);

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[KTConfigBagFetchOperation finishedOp](self, "finishedOp"));
  -[KTGroupOperation dependOnBeforeGroupFinished:](self, "dependOnBeforeGroupFinished:", v4);

  id location = 0LL;
  objc_initWeak(&location, self);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[KTConfigBagFetchOperation deps](self, "deps"));
  v6 = (void *)objc_claimAutoreleasedReturnValue([v5 logClient]);
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_100162154;
  v7[3] = &unk_1002836F8;
  objc_copyWeak(&v8, &location);
  [v6 configureFromNetwork:v7];

  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);
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

- (KTSMTriggerInterface)triggerInterface
{
  return (KTSMTriggerInterface *)objc_getProperty(self, a2, 152LL, 1);
}

- (void)setTriggerInterface:(id)a3
{
}

- (void).cxx_destruct
{
}

@end