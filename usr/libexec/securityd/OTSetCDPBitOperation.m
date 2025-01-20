@interface OTSetCDPBitOperation
- (NSOperation)finishedOp;
- (OTOperationDependencies)deps;
- (OTSetCDPBitOperation)initWithDependencies:(id)a3 intendedState:(id)a4 errorState:(id)a5;
- (OctagonStateString)intendedState;
- (OctagonStateString)nextState;
- (void)groupStart;
- (void)setDeps:(id)a3;
- (void)setFinishedOp:(id)a3;
- (void)setNextState:(id)a3;
@end

@implementation OTSetCDPBitOperation

- (OTSetCDPBitOperation)initWithDependencies:(id)a3 intendedState:(id)a4 errorState:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)&OBJC_CLASS___OTSetCDPBitOperation;
  v12 = -[CKKSGroupOperation init](&v15, "init");
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->super._queue, a3);
    objc_storeStrong((id *)&v13->super._startOperation, a4);
    objc_storeStrong((id *)&v13->super._finishOperation, a5);
  }

  return v13;
}

- (void)groupStart
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[OTSetCDPBitOperation deps](self, "deps"));
  v4 = (void *)objc_claimAutoreleasedReturnValue([v3 stateHolder]);
  id v9 = 0LL;
  [v4 persistAccountChanges:&stru_1002847F0 error:&v9];
  id v5 = v9;

  v6 = sub_10001267C("octagon-cdp-status");
  v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
  BOOL v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);
  if (v5)
  {
    if (v8)
    {
      *(_DWORD *)buf = 138412290;
      id v11 = v5;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Unable to set CDP bit: %@", buf, 0xCu);
    }
  }

  else
  {
    if (v8)
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Successfully set CDP bit", buf, 2u);
    }

    v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(-[OTSetCDPBitOperation intendedState](self, "intendedState"));
    -[OTSetCDPBitOperation setNextState:](self, "setNextState:", v7);
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