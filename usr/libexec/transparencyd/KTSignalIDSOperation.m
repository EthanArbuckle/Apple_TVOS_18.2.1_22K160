@interface KTSignalIDSOperation
- (KTOperationDependencies)deps;
- (KTSMSelfValidationResult)selfValidationResult;
- (KTSignalIDSOperation)initWithDependencies:(id)a3 intendedState:(id)a4 errorState:(id)a5 selfValidationResult:(id)a6 stateMachine:(id)a7;
- (KTStateMachine)stateMachine;
- (KTStateString)intendedState;
- (KTStateString)nextState;
- (NSOperation)finishedOp;
- (void)groupStart;
- (void)setDeps:(id)a3;
- (void)setFinishedOp:(id)a3;
- (void)setNextState:(id)a3;
- (void)setSelfValidationResult:(id)a3;
- (void)setStateMachine:(id)a3;
@end

@implementation KTSignalIDSOperation

- (KTSignalIDSOperation)initWithDependencies:(id)a3 intendedState:(id)a4 errorState:(id)a5 selfValidationResult:(id)a6 stateMachine:(id)a7
{
  id v20 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  v21.receiver = self;
  v21.super_class = (Class)&OBJC_CLASS___KTSignalIDSOperation;
  v17 = -[KTGroupOperation init](&v21, "init");
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->super._queue, a3);
    objc_storeStrong((id *)&v18->super._startOperation, a4);
    objc_storeStrong((id *)&v18->super._finishOperation, a5);
    objc_storeStrong((id *)&v18->_intendedState, a6);
    objc_storeStrong((id *)&v18->super._internalSuccesses, a7);
  }

  return v18;
}

- (void)groupStart
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[KTSignalIDSOperation selfValidationResult](self, "selfValidationResult"));
  -[KTSignalIDSOperation setSelfValidationResult:](self, "setSelfValidationResult:", 0LL);
  uint64_t v4 = objc_claimAutoreleasedReturnValue([v3 application]);
  v5 = (void *)v4;
  v6 = (void *)kKTApplicationIdentifierIDS;
  if (v4) {
    v6 = (void *)v4;
  }
  id v7 = v6;

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[KTSignalIDSOperation deps](self, "deps"));
  v9 = (void *)objc_claimAutoreleasedReturnValue([v8 publicKeyStore]);
  v10 = (void *)objc_claimAutoreleasedReturnValue([v9 applicationPublicKeyStore:v7]);

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[KTSignalIDSOperation deps](self, "deps"));
  v12 = (void *)objc_claimAutoreleasedReturnValue([v11 stateMonitor]);
  unsigned int v13 = objc_msgSend(v12, "treeStateUnstable:logBeginTime:", v7, objc_msgSend(v10, "patLogBeginningMs"));

  if (v13)
  {
    if (qword_1002EECD0 != -1) {
      dispatch_once(&qword_1002EECD0, &stru_100287250);
    }
    id v14 = (os_log_s *)qword_1002EECD8;
    if (os_log_type_enabled((os_log_t)qword_1002EECD8, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_INFO,  "KTSignalIDSOperation skipping repair trigger due to unstable tree state",  buf,  2u);
    }
  }

  else
  {
    id v15 = objc_alloc_init(&OBJC_CLASS___NSOperation);
    -[KTSignalIDSOperation setFinishedOp:](self, "setFinishedOp:", v15);

    id v16 = (void *)objc_claimAutoreleasedReturnValue(-[KTSignalIDSOperation finishedOp](self, "finishedOp"));
    -[KTGroupOperation dependOnBeforeGroupFinished:](self, "dependOnBeforeGroupFinished:", v16);

    *(void *)buf = 0LL;
    objc_initWeak((id *)buf, self);
    v17 = (void *)objc_claimAutoreleasedReturnValue(-[KTSignalIDSOperation deps](self, "deps"));
    v18 = (void *)objc_claimAutoreleasedReturnValue([v17 idsOperations]);
    v19[0] = _NSConcreteStackBlock;
    v19[1] = 3221225472LL;
    v19[2] = sub_100194D64;
    v19[3] = &unk_100287278;
    objc_copyWeak(&v20, (id *)buf);
    [v18 triggerIDSCheck:v7 selfValidationResult:v3 complete:v19];

    objc_destroyWeak(&v20);
    objc_destroyWeak((id *)buf);
  }
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

- (KTStateMachine)stateMachine
{
  return (KTStateMachine *)objc_getProperty(self, a2, 144LL, 1);
}

- (void)setStateMachine:(id)a3
{
}

- (KTSMSelfValidationResult)selfValidationResult
{
  return (KTSMSelfValidationResult *)objc_getProperty(self, a2, 152LL, 1);
}

- (void)setSelfValidationResult:(id)a3
{
}

- (NSOperation)finishedOp
{
  return (NSOperation *)objc_getProperty(self, a2, 160LL, 1);
}

- (void)setFinishedOp:(id)a3
{
}

- (void).cxx_destruct
{
}

@end