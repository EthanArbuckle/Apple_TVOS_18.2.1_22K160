@interface OTLocalCKKSResetOperation
- (NSOperation)finishedOp;
- (OTLocalCKKSResetOperation)initWithDependencies:(id)a3 intendedState:(id)a4 errorState:(id)a5;
- (OTOperationDependencies)operationDependencies;
- (OctagonStateString)intendedState;
- (OctagonStateString)nextState;
- (void)groupStart;
- (void)setFinishedOp:(id)a3;
- (void)setNextState:(id)a3;
- (void)setOperationDependencies:(id)a3;
@end

@implementation OTLocalCKKSResetOperation

- (OTLocalCKKSResetOperation)initWithDependencies:(id)a3 intendedState:(id)a4 errorState:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)&OBJC_CLASS___OTLocalCKKSResetOperation;
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
  v3 = sub_10001267C("octagon-ckks");
  v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Beginning an 'reset CKKS' operation", buf, 2u);
  }

  *(void *)buf = 0xAAAAAAAAAAAAAAAALL;
  objc_initWeak((id *)buf, self);
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472LL;
  v12[2] = sub_100186954;
  v12[3] = &unk_100291A38;
  objc_copyWeak(&v13, (id *)buf);
  v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSBlockOperation blockOperationWithBlock:]( &OBJC_CLASS___NSBlockOperation,  "blockOperationWithBlock:",  v12));
  -[OTLocalCKKSResetOperation setFinishedOp:](self, "setFinishedOp:", v5);

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[OTLocalCKKSResetOperation finishedOp](self, "finishedOp"));
  -[CKKSGroupOperation dependOnBeforeGroupFinished:](self, "dependOnBeforeGroupFinished:", v6);

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[OTLocalCKKSResetOperation operationDependencies](self, "operationDependencies"));
  v8 = (void *)objc_claimAutoreleasedReturnValue([v7 ckks]);
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472LL;
  v10[2] = sub_100186A34;
  v10[3] = &unk_1002915E0;
  objc_copyWeak(&v11, (id *)buf);
  id v9 = [v8 rpcResetLocal:0 reply:v10];

  objc_destroyWeak(&v11);
  objc_destroyWeak(&v13);
  objc_destroyWeak((id *)buf);
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

- (OTOperationDependencies)operationDependencies
{
  return (OTOperationDependencies *)objc_getProperty(self, a2, 144LL, 1);
}

- (void)setOperationDependencies:(id)a3
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