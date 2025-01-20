@interface OTUploadNewCKKSTLKsOperation
- (NSOperation)finishedOp;
- (OTOperationDependencies)deps;
- (OTUploadNewCKKSTLKsOperation)initWithDependencies:(id)a3 intendedState:(id)a4 ckksConflictState:(id)a5 peerMissingState:(id)a6 errorState:(id)a7;
- (OctagonStateString)ckksConflictState;
- (OctagonStateString)intendedState;
- (OctagonStateString)nextState;
- (OctagonStateString)peerMissingState;
- (void)groupStart;
- (void)proceedWithKeys:(id)a3 pendingTLKShares:(id)a4;
- (void)setCkksConflictState:(id)a3;
- (void)setDeps:(id)a3;
- (void)setFinishedOp:(id)a3;
- (void)setNextState:(id)a3;
- (void)setPeerMissingState:(id)a3;
@end

@implementation OTUploadNewCKKSTLKsOperation

- (OTUploadNewCKKSTLKsOperation)initWithDependencies:(id)a3 intendedState:(id)a4 ckksConflictState:(id)a5 peerMissingState:(id)a6 errorState:(id)a7
{
  id v20 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  v21.receiver = self;
  v21.super_class = (Class)&OBJC_CLASS___OTUploadNewCKKSTLKsOperation;
  v17 = -[CKKSGroupOperation init](&v21, "init");
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->super._queue, a3);
    objc_storeStrong((id *)&v18->super._startOperation, a4);
    objc_storeStrong((id *)&v18->super._internalSuccesses, a5);
    objc_storeStrong((id *)&v18->_intendedState, a6);
    objc_storeStrong((id *)&v18->super._finishOperation, a7);
  }

  return v18;
}

- (void)groupStart
{
  v3 = sub_10001267C("octagon");
  v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "Beginning an operation to upload any pending CKKS tlks",  buf,  2u);
  }

  id location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[OTUploadNewCKKSTLKsOperation deps](self, "deps"));
  v6 = (void *)objc_claimAutoreleasedReturnValue([v5 ckks]);
  v7 = (void *)objc_claimAutoreleasedReturnValue([v6 viewsRequiringTLKUpload]);

  id v8 = [v7 count];
  v9 = sub_10001267C("octagon-ckks");
  v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
  BOOL v11 = os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT);
  if (v8)
  {
    if (v11)
    {
      *(_DWORD *)buf = 138412290;
      v30 = v7;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "CKKS needs TLK uploads for %@", buf, 0xCu);
    }

    v26[0] = _NSConcreteStackBlock;
    v26[1] = 3221225472LL;
    v26[2] = sub_100119F84;
    v26[3] = &unk_100291A38;
    objc_copyWeak(&v27, &location);
    v12 = (void *)objc_claimAutoreleasedReturnValue( +[NSBlockOperation blockOperationWithBlock:]( &OBJC_CLASS___NSBlockOperation,  "blockOperationWithBlock:",  v26));
    -[OTUploadNewCKKSTLKsOperation setFinishedOp:](self, "setFinishedOp:", v12);

    id v13 = (void *)objc_claimAutoreleasedReturnValue(-[OTUploadNewCKKSTLKsOperation finishedOp](self, "finishedOp"));
    -[CKKSGroupOperation dependOnBeforeGroupFinished:](self, "dependOnBeforeGroupFinished:", v13);

    id v14 = objc_alloc(&OBJC_CLASS___OTFetchCKKSKeysOperation);
    id v15 = (void *)objc_claimAutoreleasedReturnValue(-[OTUploadNewCKKSTLKsOperation deps](self, "deps"));
    id v16 = -[OTFetchCKKSKeysOperation initWithDependencies:viewsToFetch:]( v14,  "initWithDependencies:viewsToFetch:",  v15,  v7);

    -[CKKSGroupOperation runBeforeGroupFinished:](self, "runBeforeGroupFinished:", v16);
    id v20 = _NSConcreteStackBlock;
    uint64_t v21 = 3221225472LL;
    v22 = sub_10011A064;
    v23 = &unk_100290FC8;
    objc_copyWeak(&v25, &location);
    v17 = v16;
    v24 = v17;
    v18 = (void *)objc_claimAutoreleasedReturnValue( +[CKKSResultOperation named:withBlock:]( &OBJC_CLASS___CKKSResultOperation,  "named:withBlock:",  @"upload-tlks-with-keys",  &v20));
    objc_msgSend(v18, "addDependency:", v17, v20, v21, v22, v23);
    -[CKKSGroupOperation runBeforeGroupFinished:](self, "runBeforeGroupFinished:", v18);

    objc_destroyWeak(&v25);
    objc_destroyWeak(&v27);
  }

  else
  {
    if (v11)
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "No CKKS views need uploads", buf, 2u);
    }

    v19 = (void *)objc_claimAutoreleasedReturnValue(-[OTUploadNewCKKSTLKsOperation intendedState](self, "intendedState"));
    -[OTUploadNewCKKSTLKsOperation setNextState:](self, "setNextState:", v19);
  }

  objc_destroyWeak(&location);
}

- (void)proceedWithKeys:(id)a3 pendingTLKShares:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  if ([v6 count] || objc_msgSend(v7, "count"))
  {
    id v8 = sub_10001267C("octagon-ckks");
    v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v22 = v6;
      _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "Beginning tlk upload with keys: %@",  buf,  0xCu);
    }

    v10 = (void *)objc_claimAutoreleasedReturnValue(-[OTUploadNewCKKSTLKsOperation deps](self, "deps"));
    BOOL v11 = (void *)objc_claimAutoreleasedReturnValue([v10 cuttlefishXPCWrapper]);
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[OTUploadNewCKKSTLKsOperation deps](self, "deps"));
    id v13 = (void *)objc_claimAutoreleasedReturnValue([v12 activeAccount]);
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472LL;
    v18[2] = sub_100119D18;
    v18[3] = &unk_10028FE18;
    objc_copyWeak(&v19, &location);
    [v11 updateTLKsWithSpecificUser:v13 ckksKeys:v6 tlkShares:v7 reply:v18];

    objc_destroyWeak(&v19);
  }

  else
  {
    id v14 = sub_10001267C("octagon-ckks");
    id v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_DEFAULT,  "No CKKS views gave us TLKs to upload",  buf,  2u);
    }

    id v16 = (void *)objc_claimAutoreleasedReturnValue(-[OTUploadNewCKKSTLKsOperation intendedState](self, "intendedState"));
    -[OTUploadNewCKKSTLKsOperation setNextState:](self, "setNextState:", v16);

    v17 = (void *)objc_claimAutoreleasedReturnValue(-[OTUploadNewCKKSTLKsOperation finishedOp](self, "finishedOp"));
    -[CKKSGroupOperation runBeforeGroupFinished:](self, "runBeforeGroupFinished:", v17);
  }

  objc_destroyWeak(&location);
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

- (OctagonStateString)ckksConflictState
{
  return (OctagonStateString *)objc_getProperty(self, a2, 152LL, 1);
}

- (void)setCkksConflictState:(id)a3
{
}

- (OctagonStateString)peerMissingState
{
  return (OctagonStateString *)objc_getProperty(self, a2, 160LL, 1);
}

- (void)setPeerMissingState:(id)a3
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