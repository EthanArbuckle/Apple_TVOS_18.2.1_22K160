@interface KTChangeOptInStateOperation
- (KTChangeOptInStateOperation)initWithDependenics:(id)a3 intendedState:(id)a4 errorState:(id)a5 optinStates:(id)a6;
- (KTOperationDependencies)deps;
- (KTOptInStateHolder)optInStates;
- (KTStateString)errorState;
- (KTStateString)intendedState;
- (KTStateString)nextState;
- (NSOperation)finishedOp;
- (void)evalCurrentOptInState:(BOOL)a3 optInStateError:(id)a4;
- (void)groupStart;
- (void)setDeps:(id)a3;
- (void)setErrorState:(id)a3;
- (void)setFinishedOp:(id)a3;
- (void)setIntendedState:(id)a3;
- (void)setNextState:(id)a3;
- (void)setOptInStates:(id)a3;
@end

@implementation KTChangeOptInStateOperation

- (KTChangeOptInStateOperation)initWithDependenics:(id)a3 intendedState:(id)a4 errorState:(id)a5 optinStates:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v18.receiver = self;
  v18.super_class = (Class)&OBJC_CLASS___KTChangeOptInStateOperation;
  v14 = -[KTGroupOperation init](&v18, "init");
  v15 = v14;
  if (v14)
  {
    -[KTChangeOptInStateOperation setDeps:](v14, "setDeps:", v10);
    -[KTChangeOptInStateOperation setOptInStates:](v15, "setOptInStates:", v13);
    -[KTChangeOptInStateOperation setIntendedState:](v15, "setIntendedState:", v11);
    -[KTChangeOptInStateOperation setErrorState:](v15, "setErrorState:", v12);
    v16 = v15;
  }

  return v15;
}

- (void)groupStart
{
  if (qword_1002EEF00 != -1) {
    dispatch_once(&qword_1002EEF00, &stru_100289D68);
  }
  v3 = (void *)qword_1002EEF08;
  if (os_log_type_enabled((os_log_t)qword_1002EEF08, OS_LOG_TYPE_DEBUG))
  {
    v4 = v3;
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[KTChangeOptInStateOperation optInStates](self, "optInStates"));
    v6 = (void *)objc_claimAutoreleasedReturnValue([v5 targetOptInStates]);
    unsigned int v7 = [v6 count];
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[KTChangeOptInStateOperation optInStates](self, "optInStates"));
    v9 = (void *)objc_claimAutoreleasedReturnValue([v8 currentTarget]);
    *(_DWORD *)buf = 67109378;
    unsigned int v40 = v7;
    __int16 v41 = 2112;
    v42 = v9;
    _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEBUG,  "KTChangeOptInStateOperation: start %d/%@",  buf,  0x12u);
  }

  id v10 = (void *)objc_claimAutoreleasedReturnValue(-[KTChangeOptInStateOperation optInStates](self, "optInStates"));
  id v11 = (void *)objc_claimAutoreleasedReturnValue([v10 targetOptInStates]);
  id v12 = [v11 count];

  if (v12)
  {
    id v13 = (void *)objc_claimAutoreleasedReturnValue(-[KTChangeOptInStateOperation optInStates](self, "optInStates"));
    v14 = (void *)objc_claimAutoreleasedReturnValue([v13 currentTarget]);

    if (v14)
    {
      if (qword_1002EEF00 != -1) {
        dispatch_once(&qword_1002EEF00, &stru_100289D88);
      }
      v15 = (os_log_s *)qword_1002EEF08;
      if (os_log_type_enabled((os_log_t)qword_1002EEF08, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_ERROR,  "KTChangeOptInStateOperation: already have a target pending",  buf,  2u);
      }
    }

    v16 = (void *)objc_claimAutoreleasedReturnValue(-[KTChangeOptInStateOperation optInStates](self, "optInStates"));
    v17 = (void *)objc_claimAutoreleasedReturnValue([v16 targetOptInStates]);
    objc_super v18 = (void *)objc_claimAutoreleasedReturnValue([v17 allKeys]);
    v19 = (void *)objc_claimAutoreleasedReturnValue([v18 firstObject]);
    v20 = (void *)objc_claimAutoreleasedReturnValue(-[KTChangeOptInStateOperation optInStates](self, "optInStates"));
    [v20 setCurrentTarget:v19];

    v21 = objc_alloc_init(&OBJC_CLASS___NSOperation);
    -[KTChangeOptInStateOperation setFinishedOp:](self, "setFinishedOp:", v21);

    v22 = (void *)objc_claimAutoreleasedReturnValue(-[KTChangeOptInStateOperation finishedOp](self, "finishedOp"));
    -[KTGroupOperation dependOnBeforeGroupFinished:](self, "dependOnBeforeGroupFinished:", v22);

    v23 = (void *)objc_claimAutoreleasedReturnValue(-[KTChangeOptInStateOperation deps](self, "deps"));
    v24 = (void *)objc_claimAutoreleasedReturnValue([v23 cloudRecords]);
    LODWORD(v18) = [v24 enforceCKOptInRecords];

    if ((_DWORD)v18)
    {
      v25 = (void *)objc_claimAutoreleasedReturnValue(-[KTChangeOptInStateOperation deps](self, "deps"));
      v26 = (void *)objc_claimAutoreleasedReturnValue([v25 cloudRecords]);
      v27 = (void *)objc_claimAutoreleasedReturnValue(-[KTChangeOptInStateOperation optInStates](self, "optInStates"));
      v28 = (void *)objc_claimAutoreleasedReturnValue([v27 currentTarget]);
      id v38 = 0LL;
      v29 = (void *)objc_claimAutoreleasedReturnValue([v26 getAggregateOptInStateForApplication:v28 error:&v38]);
      id v30 = v38;

      if (v30)
      {
        if ([v30 code] == (id)9)
        {
          v31 = (void *)objc_claimAutoreleasedReturnValue([v30 domain]);
          unsigned int v32 = [v31 isEqual:@"com.apple.Transparency"];

          if (v32)
          {

            id v30 = 0LL;
          }
        }

        BOOL v33 = 0LL;
      }

      else
      {
        BOOL v33 = [v29 state] == (id)1;
      }

      -[KTChangeOptInStateOperation evalCurrentOptInState:optInStateError:]( self,  "evalCurrentOptInState:optInStateError:",  v33,  v30);
    }

    else
    {
      id v30 = (id)objc_claimAutoreleasedReturnValue(-[KTChangeOptInStateOperation optInStates](self, "optInStates"));
      v34 = (void *)objc_claimAutoreleasedReturnValue([v30 currentTarget]);
      v35 = (void *)objc_claimAutoreleasedReturnValue(-[KTChangeOptInStateOperation deps](self, "deps"));
      v36 = (void *)objc_claimAutoreleasedReturnValue([v35 kvs]);
      v37[0] = _NSConcreteStackBlock;
      v37[1] = 3221225472LL;
      v37[2] = sub_1001C8AEC;
      v37[3] = &unk_10027A9C0;
      v37[4] = self;
      +[KTOptInManagerServer optInManagerOptInState:sync:store:complete:]( &OBJC_CLASS___KTOptInManagerServer,  "optInManagerOptInState:sync:store:complete:",  v34,  1LL,  v36,  v37);
    }
  }

- (void)evalCurrentOptInState:(BOOL)a3 optInStateError:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  unsigned int v7 = (void *)objc_claimAutoreleasedReturnValue(-[KTChangeOptInStateOperation optInStates](self, "optInStates"));
  v8 = (void *)objc_claimAutoreleasedReturnValue([v7 currentTarget]);

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[KTChangeOptInStateOperation optInStates](self, "optInStates"));
  id v10 = (void *)objc_claimAutoreleasedReturnValue([v9 targetOptInStates]);
  id v11 = (void *)objc_claimAutoreleasedReturnValue([v10 objectForKeyedSubscript:v8]);

  if (!v11)
  {
    if (qword_1002EEF00 != -1) {
      dispatch_once(&qword_1002EEF00, &stru_100289DA8);
    }
    v17 = (os_log_s *)qword_1002EEF08;
    if (os_log_type_enabled((os_log_t)qword_1002EEF08, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      *(void *)v50 = v8;
      _os_log_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_ERROR,  "Warning: no target application available: %@",  buf,  0xCu);
    }

    objc_super v18 = (void *)objc_claimAutoreleasedReturnValue(-[KTChangeOptInStateOperation optInStates](self, "optInStates"));
    [v18 setCurrentTarget:0];

    v16 = (void *)objc_claimAutoreleasedReturnValue(-[KTChangeOptInStateOperation errorState](self, "errorState"));
    -[KTChangeOptInStateOperation setNextState:](self, "setNextState:", v16);
    goto LABEL_18;
  }

  if (qword_1002EEF00 != -1) {
    dispatch_once(&qword_1002EEF00, &stru_100289DC8);
  }
  id v12 = (void *)qword_1002EEF08;
  if (os_log_type_enabled((os_log_t)qword_1002EEF08, OS_LOG_TYPE_DEFAULT))
  {
    id v13 = v12;
    *(_DWORD *)buf = 67109634;
    *(_DWORD *)v50 = [v11 targetState];
    *(_WORD *)&v50[4] = 2112;
    *(void *)&v50[6] = v8;
    __int16 v51 = 1024;
    BOOL v52 = v4;
    _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_DEFAULT,  "Changing state %d for application: %@ (current state: %d)",  buf,  0x18u);
  }

  if (v6)
  {
    if (qword_1002EEF00 != -1) {
      dispatch_once(&qword_1002EEF00, &stru_100289DE8);
    }
    v14 = (os_log_s *)qword_1002EEF08;
    if (os_log_type_enabled((os_log_t)qword_1002EEF08, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      *(void *)v50 = v6;
      _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_ERROR,  "Warning: changing state despite error in getOptInState: %@",  buf,  0xCu);
    }

    v15 = (void *)objc_claimAutoreleasedReturnValue(-[KTChangeOptInStateOperation errorState](self, "errorState"));
    -[KTChangeOptInStateOperation setNextState:](self, "setNextState:", v15);

    [v11 setError:v6];
LABEL_12:
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[KTChangeOptInStateOperation optInStates](self, "optInStates"));
    [v16 completedCurrentTarget];
LABEL_18:

LABEL_19:
    id v19 = (id)objc_claimAutoreleasedReturnValue(-[KTGroupOperation operationQueue](self, "operationQueue"));
    v20 = (void *)objc_claimAutoreleasedReturnValue(-[KTChangeOptInStateOperation finishedOp](self, "finishedOp"));
    [v19 addOperation:v20];
    goto LABEL_20;
  }

  id v21 = [v11 targetState];
  if (v21 == (id)1)
  {
    if (!v4) {
      goto LABEL_24;
    }
LABEL_29:
    if (qword_1002EEF00 != -1) {
      dispatch_once(&qword_1002EEF00, &stru_100289E08);
    }
    id v30 = (void *)qword_1002EEF08;
    if (os_log_type_enabled((os_log_t)qword_1002EEF08, OS_LOG_TYPE_DEFAULT))
    {
      v31 = v30;
      unsigned int v32 = (void *)objc_claimAutoreleasedReturnValue(-[KTChangeOptInStateOperation optInStates](self, "optInStates"));
      BOOL v33 = (void *)objc_claimAutoreleasedReturnValue([v32 currentTarget]);
      *(_DWORD *)buf = 138543362;
      *(void *)v50 = v33;
      _os_log_impl( (void *)&_mh_execute_header,  v31,  OS_LOG_TYPE_DEFAULT,  "State target accomplished state, change for %{public}@",  buf,  0xCu);
    }

    v34 = (void *)objc_claimAutoreleasedReturnValue(-[KTChangeOptInStateOperation deps](self, "deps"));
    v35 = (void *)objc_claimAutoreleasedReturnValue([v34 stateMonitor]);
    [v35 setOptInState:v4 everOptIn:1];

    v36 = (void *)objc_claimAutoreleasedReturnValue(-[KTChangeOptInStateOperation intendedState](self, "intendedState"));
    -[KTChangeOptInStateOperation setNextState:](self, "setNextState:", v36);

    goto LABEL_12;
  }

  if (!v21 && !v4) {
    goto LABEL_29;
  }
LABEL_24:
  if (![v11 targetState])
  {
    -[KTChangeOptInStateOperation setNextState:](self, "setNextState:", @"SetOptIO");
    goto LABEL_19;
  }

  v22 = (void *)objc_claimAutoreleasedReturnValue(-[KTChangeOptInStateOperation deps](self, "deps"));
  v23 = (void *)objc_claimAutoreleasedReturnValue([v22 accountOperations]);
  id v48 = 0LL;
  v20 = (void *)objc_claimAutoreleasedReturnValue([v23 primaryAccount:&v48]);
  id v19 = v48;

  if (v20)
  {
    v24 = (void *)objc_claimAutoreleasedReturnValue(-[KTChangeOptInStateOperation deps](self, "deps"));
    v25 = (void *)objc_claimAutoreleasedReturnValue([v24 accountOperations]);
    unsigned __int8 v26 = [v25 eligibleForOptIn:v20];

    if ((v26 & 1) != 0)
    {
      v27 = (void *)objc_claimAutoreleasedReturnValue(-[KTChangeOptInStateOperation deps](self, "deps"));
      v28 = (void *)objc_claimAutoreleasedReturnValue([v27 idsOperations]);
      v44[0] = _NSConcreteStackBlock;
      v44[1] = 3221225472LL;
      v44[2] = sub_1001C922C;
      v44[3] = &unk_100289EB0;
      id v45 = v8;
      id v46 = v11;
      v47 = self;
      [v28 getKeyTransparencyOptInEligiblityForApplication:v45 withCompletion:v44];

      v29 = v45;
    }

    else
    {
      v29 = (void *)objc_claimAutoreleasedReturnValue( +[TransparencyError errorWithDomain:code:description:]( &OBJC_CLASS___TransparencyError,  "errorWithDomain:code:description:",  kTransparencyErrorAccount,  -160LL,  @"Account is not eligble to opt-in"));
      -[KTResultOperation setError:](self, "setError:", v29);
      [v11 setError:v29];
      unsigned int v40 = (void *)objc_claimAutoreleasedReturnValue(-[KTChangeOptInStateOperation errorState](self, "errorState"));
      -[KTChangeOptInStateOperation setNextState:](self, "setNextState:", v40);

      __int16 v41 = (void *)objc_claimAutoreleasedReturnValue(-[KTChangeOptInStateOperation optInStates](self, "optInStates"));
      [v41 completedCurrentTarget];

      v42 = (void *)objc_claimAutoreleasedReturnValue(-[KTGroupOperation operationQueue](self, "operationQueue"));
      v43 = (void *)objc_claimAutoreleasedReturnValue(-[KTChangeOptInStateOperation finishedOp](self, "finishedOp"));
      [v42 addOperation:v43];
    }
  }

  else
  {
    -[KTResultOperation setError:](self, "setError:", v19);
    [v11 setError:v19];
    v37 = (void *)objc_claimAutoreleasedReturnValue(-[KTChangeOptInStateOperation errorState](self, "errorState"));
    -[KTChangeOptInStateOperation setNextState:](self, "setNextState:", v37);

    id v38 = (void *)objc_claimAutoreleasedReturnValue(-[KTChangeOptInStateOperation optInStates](self, "optInStates"));
    [v38 completedCurrentTarget];

    v29 = (void *)objc_claimAutoreleasedReturnValue(-[KTGroupOperation operationQueue](self, "operationQueue"));
    v39 = (void *)objc_claimAutoreleasedReturnValue(-[KTChangeOptInStateOperation finishedOp](self, "finishedOp"));
    [v29 addOperation:v39];
  }

LABEL_20:
}

- (KTStateString)nextState
{
  return (KTStateString *)objc_getProperty(self, a2, 120LL, 1);
}

- (void)setNextState:(id)a3
{
}

- (KTStateString)intendedState
{
  return (KTStateString *)objc_getProperty(self, a2, 128LL, 1);
}

- (void)setIntendedState:(id)a3
{
}

- (KTOperationDependencies)deps
{
  return (KTOperationDependencies *)objc_getProperty(self, a2, 136LL, 1);
}

- (void)setDeps:(id)a3
{
}

- (NSOperation)finishedOp
{
  return (NSOperation *)objc_getProperty(self, a2, 144LL, 1);
}

- (void)setFinishedOp:(id)a3
{
}

- (KTStateString)errorState
{
  return (KTStateString *)objc_getProperty(self, a2, 152LL, 1);
}

- (void)setErrorState:(id)a3
{
}

- (KTOptInStateHolder)optInStates
{
  return (KTOptInStateHolder *)objc_getProperty(self, a2, 160LL, 1);
}

- (void)setOptInStates:(id)a3
{
}

- (void).cxx_destruct
{
}

@end