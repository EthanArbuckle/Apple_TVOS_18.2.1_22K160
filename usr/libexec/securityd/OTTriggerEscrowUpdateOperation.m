@interface OTTriggerEscrowUpdateOperation
- (NSOperation)finishedOp;
- (OTOperationDependencies)deps;
- (OTTriggerEscrowUpdateOperation)initWithDependencies:(id)a3 intendedState:(id)a4 errorState:(id)a5;
- (OctagonStateString)intendedState;
- (OctagonStateString)nextState;
- (void)groupStart;
- (void)setDeps:(id)a3;
- (void)setFinishedOp:(id)a3;
- (void)setNextState:(id)a3;
@end

@implementation OTTriggerEscrowUpdateOperation

- (OTTriggerEscrowUpdateOperation)initWithDependencies:(id)a3 intendedState:(id)a4 errorState:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)&OBJC_CLASS___OTTriggerEscrowUpdateOperation;
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
  v3 = sub_10001267C("octagon");
  v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Triggering escrow update", buf, 2u);
  }

  v5 = objc_alloc_init(&OBJC_CLASS___NSOperation);
  -[OTTriggerEscrowUpdateOperation setFinishedOp:](self, "setFinishedOp:", v5);

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[OTTriggerEscrowUpdateOperation finishedOp](self, "finishedOp"));
  -[CKKSGroupOperation dependOnBeforeGroupFinished:](self, "dependOnBeforeGroupFinished:", v6);

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[OTTriggerEscrowUpdateOperation deps](self, "deps"));
  id v20 = 0LL;
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(objc_msgSend(v7, "escrowRequestClass"), "request:", &v20));
  id v9 = v20;

  if (!v8 || v9)
  {
    v14 = sub_10001267C("octagon-sos");
    objc_super v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v22 = v9;
      _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_DEFAULT,  "Unable to acquire a EscrowRequest object: %@",  buf,  0xCu);
    }

    v16 = (void *)objc_claimAutoreleasedReturnValue(-[OTTriggerEscrowUpdateOperation finishedOp](self, "finishedOp"));
    -[CKKSGroupOperation runBeforeGroupFinished:](self, "runBeforeGroupFinished:", v16);

    -[CKKSResultOperation setError:](self, "setError:", v9);
  }

  else
  {
    id v19 = 0LL;
    [v8 triggerEscrowUpdate:@"octagon-sos" error:&v19];
    id v9 = v19;
    id v10 = (void *)objc_claimAutoreleasedReturnValue(+[CKKSAnalytics logger](&OBJC_CLASS___CKKSAnalytics, "logger"));
    [v10 logResultForEvent:@"OctagonEventUpgradeSilentEscrow" hardFailure:1 result:v9];

    id v11 = sub_10001267C("octagon-sos");
    v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
    BOOL v13 = os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT);
    if (v9)
    {
      if (v13)
      {
        *(_DWORD *)buf = 138412290;
        id v22 = v9;
        _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEFAULT,  "Unable to request silent escrow update: %@",  buf,  0xCu);
      }

      -[CKKSResultOperation setError:](self, "setError:", v9);
    }

    else
    {
      if (v13)
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Requested silent escrow update", buf, 2u);
      }

      v17 = (void *)objc_claimAutoreleasedReturnValue(-[OTTriggerEscrowUpdateOperation intendedState](self, "intendedState"));
      -[OTTriggerEscrowUpdateOperation setNextState:](self, "setNextState:", v17);
    }

    v18 = (void *)objc_claimAutoreleasedReturnValue(-[OTTriggerEscrowUpdateOperation finishedOp](self, "finishedOp"));
    -[CKKSGroupOperation runBeforeGroupFinished:](self, "runBeforeGroupFinished:", v18);
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