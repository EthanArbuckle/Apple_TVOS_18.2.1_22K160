@interface OTSOSUpdatePreapprovalsOperation
- (NSOperation)finishedOp;
- (OTOperationDependencies)deps;
- (OTSOSUpdatePreapprovalsOperation)initWithDependencies:(id)a3 intendedState:(id)a4 sosNotPresentState:(id)a5 errorState:(id)a6;
- (OctagonStateString)intendedState;
- (OctagonStateString)nextState;
- (OctagonStateString)sosNotPresentState;
- (void)groupStart;
- (void)setDeps:(id)a3;
- (void)setFinishedOp:(id)a3;
- (void)setNextState:(id)a3;
- (void)setSosNotPresentState:(id)a3;
@end

@implementation OTSOSUpdatePreapprovalsOperation

- (OTSOSUpdatePreapprovalsOperation)initWithDependencies:(id)a3 intendedState:(id)a4 sosNotPresentState:(id)a5 errorState:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v18.receiver = self;
  v18.super_class = (Class)&OBJC_CLASS___OTSOSUpdatePreapprovalsOperation;
  v15 = -[CKKSGroupOperation init](&v18, "init");
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->super._internalSuccesses, a3);
    objc_storeStrong((id *)&v16->super._finishOperation, a4);
    objc_storeStrong((id *)&v16->super._queue, a5);
    objc_storeStrong((id *)&v16->super._startOperation, a6);
  }

  return v16;
}

- (void)groupStart
{
  id location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[OTSOSUpdatePreapprovalsOperation deps](self, "deps"));
  v4 = (void *)objc_claimAutoreleasedReturnValue([v3 sosAdapter]);
  unsigned __int8 v5 = [v4 sosEnabled];

  if ((v5 & 1) != 0)
  {
    v27[0] = _NSConcreteStackBlock;
    v27[1] = 3221225472LL;
    v27[2] = sub_1000AA2B8;
    v27[3] = &unk_100291A38;
    objc_copyWeak(&v28, &location);
    v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSBlockOperation blockOperationWithBlock:]( &OBJC_CLASS___NSBlockOperation,  "blockOperationWithBlock:",  v27));
    -[OTSOSUpdatePreapprovalsOperation setFinishedOp:](self, "setFinishedOp:", v6);

    v7 = (void *)objc_claimAutoreleasedReturnValue(-[OTSOSUpdatePreapprovalsOperation finishedOp](self, "finishedOp"));
    -[CKKSGroupOperation dependOnBeforeGroupFinished:](self, "dependOnBeforeGroupFinished:", v7);

    v8 = (void *)objc_claimAutoreleasedReturnValue(-[OTSOSUpdatePreapprovalsOperation deps](self, "deps"));
    v9 = (void *)objc_claimAutoreleasedReturnValue([v8 sosAdapter]);
    id v26 = 0LL;
    v10 = (void *)objc_claimAutoreleasedReturnValue( +[OTSOSAdapterHelpers peerPublicSigningKeySPKIsForCircle:error:]( &OBJC_CLASS___OTSOSAdapterHelpers,  "peerPublicSigningKeySPKIsForCircle:error:",  v9,  &v26));
    id v11 = v26;

    if (!v10 || v11)
    {
      v20 = sub_10001267C("SecError");
      v21 = (os_log_s *)objc_claimAutoreleasedReturnValue(v20);
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        id v31 = v11;
        _os_log_impl( (void *)&_mh_execute_header,  v21,  OS_LOG_TYPE_DEFAULT,  "octagon-sos: Can't fetch trusted peers; stopping preapproved key update: %@",
          buf,
          0xCu);
      }

      -[CKKSResultOperation setError:](self, "setError:", v11);
      v22 = (void *)objc_claimAutoreleasedReturnValue(-[OTSOSUpdatePreapprovalsOperation sosNotPresentState](self, "sosNotPresentState"));
      -[OTSOSUpdatePreapprovalsOperation setNextState:](self, "setNextState:", v22);

      v23 = (void *)objc_claimAutoreleasedReturnValue(-[OTSOSUpdatePreapprovalsOperation finishedOp](self, "finishedOp"));
      -[CKKSGroupOperation runBeforeGroupFinished:](self, "runBeforeGroupFinished:", v23);
    }

    else
    {
      id v12 = sub_10001267C("octagon-sos");
      id v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        id v31 = v10;
        _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_DEFAULT,  "Updating SOS preapproved keys to %@",  buf,  0xCu);
      }

      id v14 = (void *)objc_claimAutoreleasedReturnValue(-[OTSOSUpdatePreapprovalsOperation deps](self, "deps"));
      v15 = (void *)objc_claimAutoreleasedReturnValue([v14 cuttlefishXPCWrapper]);
      v16 = (void *)objc_claimAutoreleasedReturnValue(-[OTSOSUpdatePreapprovalsOperation deps](self, "deps"));
      v17 = (void *)objc_claimAutoreleasedReturnValue([v16 activeAccount]);
      v24[0] = _NSConcreteStackBlock;
      v24[1] = 3221225472LL;
      v24[2] = sub_1000AA4A8;
      v24[3] = &unk_100284F60;
      objc_copyWeak(&v25, &location);
      [v15 setPreapprovedKeysWithSpecificUser:v17 preapprovedKeys:v10 reply:v24];

      objc_destroyWeak(&v25);
    }

    objc_destroyWeak(&v28);
  }

  else
  {
    objc_super v18 = sub_10001267C("octagon-sos");
    v19 = (os_log_s *)objc_claimAutoreleasedReturnValue(v18);
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "SOS not enabled on this platform?", buf, 2u);
    }
  }

  objc_destroyWeak(&location);
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

- (OctagonStateString)sosNotPresentState
{
  return (OctagonStateString *)objc_getProperty(self, a2, 144LL, 1);
}

- (void)setSosNotPresentState:(id)a3
{
}

- (OTOperationDependencies)deps
{
  return (OTOperationDependencies *)objc_getProperty(self, a2, 152LL, 1);
}

- (void)setDeps:(id)a3
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