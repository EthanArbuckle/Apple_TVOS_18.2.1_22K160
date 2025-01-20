@interface OTJoinSOSAfterCKKSFetchOperation
- (NSOperation)finishedOp;
- (OTJoinSOSAfterCKKSFetchOperation)initWithDependencies:(id)a3 intendedState:(id)a4 errorState:(id)a5;
- (OTOperationDependencies)operationDependencies;
- (OctagonStateString)intendedState;
- (OctagonStateString)nextState;
- (void)groupStart;
- (void)proceedAfterFetch;
- (void)setFinishedOp:(id)a3;
- (void)setNextState:(id)a3;
- (void)setOperationDependencies:(id)a3;
@end

@implementation OTJoinSOSAfterCKKSFetchOperation

- (OTJoinSOSAfterCKKSFetchOperation)initWithDependencies:(id)a3 intendedState:(id)a4 errorState:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)&OBJC_CLASS___OTJoinSOSAfterCKKSFetchOperation;
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
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[OTJoinSOSAfterCKKSFetchOperation operationDependencies](self, "operationDependencies"));
  v4 = (void *)objc_claimAutoreleasedReturnValue([v3 sosAdapter]);
  unsigned __int8 v5 = [v4 sosEnabled];

  v6 = sub_10001267C("octagon-sos");
  v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
  BOOL v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);
  if ((v5 & 1) != 0)
  {
    if (v8)
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "joining SOS", buf, 2u);
    }

    id v9 = objc_alloc_init(&OBJC_CLASS___NSOperation);
    -[OTJoinSOSAfterCKKSFetchOperation setFinishedOp:](self, "setFinishedOp:", v9);

    id v10 = (void *)objc_claimAutoreleasedReturnValue(-[OTJoinSOSAfterCKKSFetchOperation finishedOp](self, "finishedOp"));
    -[CKKSGroupOperation dependOnBeforeGroupFinished:](self, "dependOnBeforeGroupFinished:", v10);

    id v11 = objc_alloc(&OBJC_CLASS___OTWaitOnPriorityViews);
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[OTJoinSOSAfterCKKSFetchOperation operationDependencies](self, "operationDependencies"));
    v13 = -[OTWaitOnPriorityViews initWithDependencies:](v11, "initWithDependencies:", v12);

    id v14 = -[CKKSResultOperation timeout:](v13, "timeout:", 10000000000LL);
    -[CKKSGroupOperation runBeforeGroupFinished:](self, "runBeforeGroupFinished:", v13);
    *(void *)buf = 0xAAAAAAAAAAAAAAAALL;
    objc_initWeak((id *)buf, self);
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472LL;
    v16[2] = sub_10006CA7C;
    v16[3] = &unk_100291A38;
    objc_copyWeak(&v17, (id *)buf);
    objc_super v15 = (void *)objc_claimAutoreleasedReturnValue( +[CKKSResultOperation named:withBlock:]( &OBJC_CLASS___CKKSResultOperation,  "named:withBlock:",  @"join-sos-after-fetch",  v16));
    [v15 addDependency:v13];
    -[CKKSGroupOperation runBeforeGroupFinished:](self, "runBeforeGroupFinished:", v15);

    objc_destroyWeak(&v17);
    objc_destroyWeak((id *)buf);
  }

  else
  {
    if (v8)
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "SOS not enabled on this platform?", buf, 2u);
    }

    v13 = (OTWaitOnPriorityViews *)objc_claimAutoreleasedReturnValue(-[OTJoinSOSAfterCKKSFetchOperation intendedState](self, "intendedState"));
    -[OTJoinSOSAfterCKKSFetchOperation setNextState:](self, "setNextState:", v13);
  }
}

- (void)proceedAfterFetch
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[OTJoinSOSAfterCKKSFetchOperation operationDependencies](self, "operationDependencies"));
  v4 = (void *)objc_claimAutoreleasedReturnValue([v3 sosAdapter]);
  id v27 = 0LL;
  unsigned int v5 = [v4 joinAfterRestore:&v27];
  id v6 = v27;

  if (!v6
    || [v6 code] != (id)1
    || (v7 = (void *)objc_claimAutoreleasedReturnValue([v6 domain]),
        unsigned int v8 = [v7 isEqualToString:kSOSErrorDomain],
        v7,
        !v8))
  {
    id v10 = (void *)objc_claimAutoreleasedReturnValue(-[OTJoinSOSAfterCKKSFetchOperation operationDependencies](self, "operationDependencies"));
    id v11 = (void *)objc_claimAutoreleasedReturnValue([v10 sosAdapter]);
    id v26 = 0LL;
    unsigned int v12 = [v11 circleStatus:&v26];
    id v9 = v26;

    if (v9 && [v9 code] == (id)1)
    {
      v13 = (void *)objc_claimAutoreleasedReturnValue([v9 domain]);
      if ([v13 isEqualToString:kSOSErrorDomain])
      {

        goto LABEL_22;
      }
    }

    if (v12 != -1)
    {
      if (v6 || ((v5 ^ 1) & 1) != 0 || v12 == 2 || v12 == 1)
      {
        id v14 = (void *)objc_claimAutoreleasedReturnValue(-[OTJoinSOSAfterCKKSFetchOperation operationDependencies](self, "operationDependencies"));
        objc_super v15 = (void *)objc_claimAutoreleasedReturnValue([v14 sosAdapter]);
        id v25 = 0LL;
        unsigned int v16 = [v15 resetToOffering:&v25];
        id v17 = v25;

        v18 = sub_10001267C("octagon-sos");
        v19 = (os_log_s *)objc_claimAutoreleasedReturnValue(v18);
        if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 67109378;
          unsigned int v29 = v16;
          __int16 v30 = 2112;
          id v31 = v17;
          _os_log_impl( (void *)&_mh_execute_header,  v19,  OS_LOG_TYPE_DEFAULT,  "SOSCCResetToOffering complete: %d %@",  buf,  0x12u);
        }

        char v20 = v17 ? 0 : v16;
        if ((v20 & 1) == 0)
        {
          -[CKKSResultOperation setError:](self, "setError:", v17);
          v24 = (void *)objc_claimAutoreleasedReturnValue(-[OTJoinSOSAfterCKKSFetchOperation finishedOp](self, "finishedOp"));
          -[CKKSGroupOperation runBeforeGroupFinished:](self, "runBeforeGroupFinished:", v24);

          goto LABEL_26;
        }
      }

      v21 = (void *)objc_claimAutoreleasedReturnValue(-[OTJoinSOSAfterCKKSFetchOperation intendedState](self, "intendedState"));
      -[OTJoinSOSAfterCKKSFetchOperation setNextState:](self, "setNextState:", v21);

LABEL_25:
      id v17 = (id)objc_claimAutoreleasedReturnValue(-[OTJoinSOSAfterCKKSFetchOperation finishedOp](self, "finishedOp"));
      -[CKKSGroupOperation runBeforeGroupFinished:](self, "runBeforeGroupFinished:", v17);
LABEL_26:

      goto LABEL_27;
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