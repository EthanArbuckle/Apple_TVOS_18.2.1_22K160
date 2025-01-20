@interface OTEstablishOperation
- (NSOperation)finishedOp;
- (NSString)peerID;
- (OTEstablishOperation)initWithDependencies:(id)a3 intendedState:(id)a4 ckksConflictState:(id)a5 errorState:(id)a6;
- (OTOperationDependencies)operationDependencies;
- (OctagonStateString)ckksConflictState;
- (OctagonStateString)intendedState;
- (OctagonStateString)nextState;
- (void)groupStart;
- (void)proceedWithKeys:(id)a3 pendingTLKShares:(id)a4;
- (void)setCkksConflictState:(id)a3;
- (void)setFinishedOp:(id)a3;
- (void)setNextState:(id)a3;
- (void)setOperationDependencies:(id)a3;
- (void)setPeerID:(id)a3;
@end

@implementation OTEstablishOperation

- (OTEstablishOperation)initWithDependencies:(id)a3 intendedState:(id)a4 ckksConflictState:(id)a5 errorState:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v18.receiver = self;
  v18.super_class = (Class)&OBJC_CLASS___OTEstablishOperation;
  v15 = -[CKKSGroupOperation init](&v18, "init");
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->super._internalSuccesses, a3);
    objc_storeStrong((id *)&v16->super._startOperation, a4);
    objc_storeStrong((id *)&v16->super._queue, a6);
    objc_storeStrong((id *)&v16->_intendedState, a5);
  }

  return v16;
}

- (void)groupStart
{
  v3 = sub_10001267C("octagon");
  v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Beginning an establish operation", buf, 2u);
  }

  *(void *)buf = 0xAAAAAAAAAAAAAAAALL;
  objc_initWeak((id *)buf, self);
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472LL;
  v15[2] = sub_10007ACD8;
  v15[3] = &unk_100291A38;
  objc_copyWeak(&v16, (id *)buf);
  v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSBlockOperation blockOperationWithBlock:]( &OBJC_CLASS___NSBlockOperation,  "blockOperationWithBlock:",  v15));
  -[OTEstablishOperation setFinishedOp:](self, "setFinishedOp:", v5);

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[OTEstablishOperation finishedOp](self, "finishedOp"));
  -[CKKSGroupOperation dependOnBeforeGroupFinished:](self, "dependOnBeforeGroupFinished:", v6);

  v7 = objc_alloc(&OBJC_CLASS___OTFetchCKKSKeysOperation);
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[OTEstablishOperation operationDependencies](self, "operationDependencies"));
  v9 = -[OTFetchCKKSKeysOperation initWithDependencies:refetchNeeded:]( v7,  "initWithDependencies:refetchNeeded:",  v8,  0LL);

  -[CKKSGroupOperation runBeforeGroupFinished:](self, "runBeforeGroupFinished:", v9);
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472LL;
  v12[2] = sub_10007ADB8;
  v12[3] = &unk_100290FC8;
  objc_copyWeak(&v14, (id *)buf);
  v10 = v9;
  id v13 = v10;
  id v11 = (void *)objc_claimAutoreleasedReturnValue( +[CKKSResultOperation named:withBlock:]( &OBJC_CLASS___CKKSResultOperation,  "named:withBlock:",  @"establish-with-keys",  v12));
  [v11 addDependency:v10];
  -[CKKSGroupOperation runBeforeGroupFinished:](self, "runBeforeGroupFinished:", v11);

  objc_destroyWeak(&v14);
  objc_destroyWeak(&v16);
  objc_destroyWeak((id *)buf);
}

- (void)proceedWithKeys:(id)a3 pendingTLKShares:(id)a4
{
  v6 = (os_log_s *)a3;
  id v7 = a4;
  id location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[OTEstablishOperation operationDependencies](self, "operationDependencies"));
  v9 = (void *)objc_claimAutoreleasedReturnValue([v8 sosAdapter]);
  unsigned int v10 = [v9 sosEnabled];

  if (v10)
  {
    id v11 = (void *)objc_claimAutoreleasedReturnValue(-[OTEstablishOperation operationDependencies](self, "operationDependencies"));
    id v12 = (void *)objc_claimAutoreleasedReturnValue([v11 sosAdapter]);
    id v36 = 0LL;
    id v13 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[OTSOSAdapterHelpers peerPublicSigningKeySPKIsForCircle:error:]( &OBJC_CLASS___OTSOSAdapterHelpers,  "peerPublicSigningKeySPKIsForCircle:error:",  v12,  &v36));
    id v14 = (os_log_s *)v36;

    v15 = sub_10001267C("octagon-sos");
    id v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(v15);
    BOOL v17 = os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT);
    if (v13)
    {
      if (v17)
      {
        *(_DWORD *)buf = 138412290;
        v39 = v13;
        objc_super v18 = "SOS preapproved keys are %@";
LABEL_10:
        _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, v18, buf, 0xCu);
      }
    }

    else if (v17)
    {
      *(_DWORD *)buf = 138412290;
      v39 = v14;
      objc_super v18 = "Unable to fetch SOS preapproved keys: %@";
      goto LABEL_10;
    }

    goto LABEL_12;
  }

  v19 = sub_10001267C("octagon-sos");
  id v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v19);
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "SOS not enabled; no preapproved keys", buf, 2u);
  }

  id v13 = 0LL;
LABEL_12:

  v20 = (void *)objc_claimAutoreleasedReturnValue(-[OTEstablishOperation operationDependencies](self, "operationDependencies"));
  v21 = (void *)objc_claimAutoreleasedReturnValue([v20 stateHolder]);
  id v35 = 0LL;
  unsigned __int8 v22 = [v21 persistOctagonJoinAttempt:2 error:&v35];
  v23 = (os_log_s *)v35;

  if (v23) {
    unsigned __int8 v24 = 0;
  }
  else {
    unsigned __int8 v24 = v22;
  }
  if ((v24 & 1) == 0)
  {
    v25 = sub_10001267C("SecError");
    v26 = (os_log_s *)objc_claimAutoreleasedReturnValue(v25);
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v39 = v23;
      _os_log_impl( (void *)&_mh_execute_header,  v26,  OS_LOG_TYPE_DEFAULT,  "octagon: failed to save 'attempted join' state: %@",  buf,  0xCu);
    }
  }

  v27 = sub_10001267C("octagon-ckks");
  v28 = (os_log_s *)objc_claimAutoreleasedReturnValue(v27);
  if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v39 = v6;
    _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_DEFAULT, "Beginning establish with keys: %@", buf, 0xCu);
  }

  v29 = (void *)objc_claimAutoreleasedReturnValue(-[OTEstablishOperation operationDependencies](self, "operationDependencies"));
  v30 = (void *)objc_claimAutoreleasedReturnValue([v29 cuttlefishXPCWrapper]);
  v31 = (void *)objc_claimAutoreleasedReturnValue(-[OTEstablishOperation operationDependencies](self, "operationDependencies"));
  v32 = (void *)objc_claimAutoreleasedReturnValue([v31 activeAccount]);
  v33[0] = _NSConcreteStackBlock;
  v33[1] = 3221225472LL;
  v33[2] = sub_10007A8D0;
  v33[3] = &unk_1002864E8;
  objc_copyWeak(&v34, &location);
  [v30 establishWithSpecificUser:v32 ckksKeys:v6 tlkShares:v7 preapprovedKeys:v13 reply:v33];

  objc_destroyWeak(&v34);
  objc_destroyWeak(&location);
}

- (OctagonStateString)intendedState
{
  return (OctagonStateString *)objc_getProperty(self, a2, 128LL, 1);
}

- (NSString)peerID
{
  return (NSString *)&self->super._finishOperation->super.super.isa;
}

- (void)setPeerID:(id)a3
{
}

- (OctagonStateString)nextState
{
  return (OctagonStateString *)objc_getProperty(self, a2, 144LL, 1);
}

- (void)setNextState:(id)a3
{
}

- (OTOperationDependencies)operationDependencies
{
  return (OTOperationDependencies *)objc_getProperty(self, a2, 152LL, 1);
}

- (void)setOperationDependencies:(id)a3
{
}

- (OctagonStateString)ckksConflictState
{
  return (OctagonStateString *)objc_getProperty(self, a2, 160LL, 1);
}

- (void)setCkksConflictState:(id)a3
{
}

- (NSOperation)finishedOp
{
  return (NSOperation *)objc_getProperty(self, a2, 168LL, 1);
}

- (void)setFinishedOp:(id)a3
{
}

- (void).cxx_destruct
{
}

@end