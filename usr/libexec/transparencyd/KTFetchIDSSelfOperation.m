@interface KTFetchIDSSelfOperation
+ (id)lastSelfIDSFetch:(id)a3;
- (KTFetchIDSSelfOperation)initWithApplication:(id)a3 dependencies:(id)a4 intendedState:(id)a5 errorState:(id)a6;
- (KTOperationDependencies)deps;
- (KTStateString)intendedState;
- (KTStateString)nextState;
- (NSOperation)finishedOp;
- (NSString)application;
- (void)groupStart;
- (void)setApplication:(id)a3;
- (void)setDeps:(id)a3;
- (void)setFinishedOp:(id)a3;
- (void)setNextState:(id)a3;
@end

@implementation KTFetchIDSSelfOperation

- (KTFetchIDSSelfOperation)initWithApplication:(id)a3 dependencies:(id)a4 intendedState:(id)a5 errorState:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v18.receiver = self;
  v18.super_class = (Class)&OBJC_CLASS___KTFetchIDSSelfOperation;
  v15 = -[KTGroupOperation init](&v18, "init");
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->super._queue, a4);
    objc_storeStrong((id *)&v16->super._internalSuccesses, a3);
    objc_storeStrong((id *)&v16->super._startOperation, a5);
    objc_storeStrong((id *)&v16->super._finishOperation, a6);
  }

  return v16;
}

+ (id)lastSelfIDSFetch:(id)a3
{
  v3 = (void *)objc_claimAutoreleasedReturnValue([a3 smDataStore]);
  v4 = (void *)objc_claimAutoreleasedReturnValue([v3 getSettingsDate:@"KTIDSLastSelfFetch"]);

  return v4;
}

- (void)groupStart
{
  v3 = objc_alloc_init(&OBJC_CLASS___NSOperation);
  -[KTFetchIDSSelfOperation setFinishedOp:](self, "setFinishedOp:", v3);

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[KTFetchIDSSelfOperation finishedOp](self, "finishedOp"));
  -[KTGroupOperation dependOnBeforeGroupFinished:](self, "dependOnBeforeGroupFinished:", v4);

  id location = 0LL;
  objc_initWeak(&location, self);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[KTFetchIDSSelfOperation deps](self, "deps"));
  v6 = (void *)objc_claimAutoreleasedReturnValue([v5 idsOperations]);
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[KTFetchIDSSelfOperation application](self, "application"));
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = sub_10018AB64;
  v8[3] = &unk_100286A48;
  objc_copyWeak(&v9, &location);
  [v6 fetchSelfVerificationInfo:v7 completionBlock:v8];

  objc_destroyWeak(&v9);
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