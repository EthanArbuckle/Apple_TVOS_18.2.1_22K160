@interface OTLocalResetOperation
- (NSOperation)finishedOp;
- (OTLocalResetOperation)initWithDependencies:(id)a3 intendedState:(id)a4 errorState:(id)a5;
- (OTOperationDependencies)deps;
- (OctagonStateString)intendedState;
- (OctagonStateString)nextState;
- (void)groupStart;
- (void)setDeps:(id)a3;
- (void)setFinishedOp:(id)a3;
- (void)setNextState:(id)a3;
@end

@implementation OTLocalResetOperation

- (OTLocalResetOperation)initWithDependencies:(id)a3 intendedState:(id)a4 errorState:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)&OBJC_CLASS___OTLocalResetOperation;
  v12 = -[CKKSGroupOperation init](&v15, "init");
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->super._startOperation, a4);
    objc_storeStrong((id *)&v13->super._finishOperation, a5);
    objc_storeStrong((id *)&v13->super._queue, a3);
  }

  return v13;
}

- (void)groupStart
{
  v3 = sub_10001267C("octagon-local-reset");
  v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Resetting local cuttlefish", buf, 2u);
  }

  v5 = objc_alloc_init(&OBJC_CLASS___NSOperation);
  -[OTLocalResetOperation setFinishedOp:](self, "setFinishedOp:", v5);

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[OTLocalResetOperation finishedOp](self, "finishedOp"));
  -[CKKSGroupOperation dependOnBeforeGroupFinished:](self, "dependOnBeforeGroupFinished:", v6);

  *(void *)buf = 0xAAAAAAAAAAAAAAAALL;
  objc_initWeak((id *)buf, self);
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[OTLocalResetOperation deps](self, "deps"));
  v8 = (void *)objc_claimAutoreleasedReturnValue([v7 cuttlefishXPCWrapper]);
  id v9 = (void *)objc_claimAutoreleasedReturnValue(-[OTLocalResetOperation deps](self, "deps"));
  id v10 = (void *)objc_claimAutoreleasedReturnValue([v9 activeAccount]);
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472LL;
  v11[2] = sub_10002E4E0;
  v11[3] = &unk_1002915E0;
  objc_copyWeak(&v12, (id *)buf);
  [v8 localResetWithSpecificUser:v10 reply:v11];

  objc_destroyWeak(&v12);
  objc_destroyWeak((id *)buf);
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