@interface KTFetchKTSelfOperation
- (KTFetchKTSelfOperation)initWithApplication:(id)a3 dependencies:(id)a4 intendedState:(id)a5 errorState:(id)a6;
- (KTOperationDependencies)deps;
- (KTResultOperation)finishedOp;
- (KTStateString)intendedState;
- (KTStateString)nextState;
- (NSString)application;
- (OS_dispatch_queue)uriQueue;
- (void)groupStart;
- (void)setApplication:(id)a3;
- (void)setDeps:(id)a3;
- (void)setFinishedOp:(id)a3;
- (void)setNextState:(id)a3;
- (void)setUriQueue:(id)a3;
@end

@implementation KTFetchKTSelfOperation

- (KTFetchKTSelfOperation)initWithApplication:(id)a3 dependencies:(id)a4 intendedState:(id)a5 errorState:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v21.receiver = self;
  v21.super_class = (Class)&OBJC_CLASS___KTFetchKTSelfOperation;
  v15 = -[KTGroupOperation init](&v21, "init");
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->super._queue, a4);
    objc_storeStrong((id *)&v16->super._internalSuccesses, a3);
    objc_storeStrong((id *)&v16->super._startOperation, a5);
    objc_storeStrong((id *)&v16->super._finishOperation, a6);
    dispatch_queue_attr_t v17 = dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v18 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v17);
    dispatch_queue_t v19 = dispatch_queue_create("FetchKTSelf_URIWaiter", v18);
    -[KTFetchKTSelfOperation setUriQueue:](v16, "setUriQueue:", v19);
  }

  return v16;
}

- (void)groupStart
{
  id location = 0LL;
  objc_initWeak(&location, self);
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472LL;
  v10[2] = sub_10014C580;
  v10[3] = &unk_100276D20;
  objc_copyWeak(&v11, &location);
  v3 = (void *)objc_claimAutoreleasedReturnValue( +[KTResultOperation blockOperationWithBlock:]( &OBJC_CLASS___KTResultOperation,  "blockOperationWithBlock:",  v10));
  -[KTFetchKTSelfOperation setFinishedOp:](self, "setFinishedOp:", v3);

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[KTFetchKTSelfOperation finishedOp](self, "finishedOp"));
  -[KTGroupOperation dependOnBeforeGroupFinished:](self, "dependOnBeforeGroupFinished:", v4);

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[KTFetchKTSelfOperation deps](self, "deps"));
  v6 = (void *)objc_claimAutoreleasedReturnValue([v5 smDataStore]);
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[KTFetchKTSelfOperation application](self, "application"));
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = sub_10014C6DC;
  v8[3] = &unk_1002787D0;
  objc_copyWeak(&v9, &location);
  [v6 fetchSelfVerificationInfoForApplication:v7 complete:v8];

  objc_destroyWeak(&v9);
  objc_destroyWeak(&v11);
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

- (NSString)application
{
  return (NSString *)objc_getProperty(self, a2, 144LL, 1);
}

- (void)setApplication:(id)a3
{
}

- (KTResultOperation)finishedOp
{
  return (KTResultOperation *)objc_getProperty(self, a2, 152LL, 1);
}

- (void)setFinishedOp:(id)a3
{
}

- (OS_dispatch_queue)uriQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 160LL, 1);
}

- (void)setUriQueue:(id)a3
{
}

- (void).cxx_destruct
{
}

@end