@interface OTDetermineCDPCapableAccountStatusOperation
- (NSOperation)finishedOp;
- (OTDetermineCDPCapableAccountStatusOperation)initWithDependencies:(id)a3 stateIfCDPCapable:(id)a4 stateIfNotCDPCapable:(id)a5 stateIfNoAccount:(id)a6 errorState:(id)a7;
- (OTOperationDependencies)deps;
- (OctagonStateString)intendedState;
- (OctagonStateString)nextState;
- (OctagonStateString)stateIfNoAccount;
- (OctagonStateString)stateIfNotCDPCapable;
- (void)groupStart;
- (void)setDeps:(id)a3;
- (void)setFinishedOp:(id)a3;
- (void)setNextState:(id)a3;
- (void)setStateIfNoAccount:(id)a3;
- (void)setStateIfNotCDPCapable:(id)a3;
@end

@implementation OTDetermineCDPCapableAccountStatusOperation

- (OTDetermineCDPCapableAccountStatusOperation)initWithDependencies:(id)a3 stateIfCDPCapable:(id)a4 stateIfNotCDPCapable:(id)a5 stateIfNoAccount:(id)a6 errorState:(id)a7
{
  id v20 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  v21.receiver = self;
  v21.super_class = (Class)&OBJC_CLASS___OTDetermineCDPCapableAccountStatusOperation;
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
  v3 = objc_alloc_init(&OBJC_CLASS___NSOperation);
  -[OTDetermineCDPCapableAccountStatusOperation setFinishedOp:](self, "setFinishedOp:", v3);

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[OTDetermineCDPCapableAccountStatusOperation finishedOp](self, "finishedOp"));
  -[CKKSGroupOperation dependOnBeforeGroupFinished:](self, "dependOnBeforeGroupFinished:", v4);

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[OTDetermineCDPCapableAccountStatusOperation deps](self, "deps"));
  v6 = (void *)objc_claimAutoreleasedReturnValue([v5 activeAccount]);
  v7 = (__CFString *)objc_claimAutoreleasedReturnValue([v6 altDSID]);

  if (v7) {
    goto LABEL_2;
  }
  objc_super v21 = sub_10001267C("octagon");
  v22 = (os_log_s *)objc_claimAutoreleasedReturnValue(v21);
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
  {
    v23 = (void *)objc_claimAutoreleasedReturnValue(-[OTDetermineCDPCapableAccountStatusOperation deps](self, "deps"));
    v24 = (__CFString *)objc_claimAutoreleasedReturnValue([v23 activeAccount]);
    *(_DWORD *)buf = 138412290;
    v56 = v24;
    _os_log_impl( (void *)&_mh_execute_header,  v22,  OS_LOG_TYPE_DEFAULT,  "iCloud account is not present or not configured: %@",  buf,  0xCu);
  }

  v48 = (void *)objc_claimAutoreleasedReturnValue(-[OTDetermineCDPCapableAccountStatusOperation deps](self, "deps"));
  v25 = (void *)objc_claimAutoreleasedReturnValue([v48 accountsAdapter]);
  v26 = (void *)objc_claimAutoreleasedReturnValue(-[OTDetermineCDPCapableAccountStatusOperation deps](self, "deps"));
  v27 = (void *)objc_claimAutoreleasedReturnValue([v26 personaAdapter]);
  v28 = (void *)objc_claimAutoreleasedReturnValue(-[OTDetermineCDPCapableAccountStatusOperation deps](self, "deps"));
  v29 = (void *)objc_claimAutoreleasedReturnValue([v28 containerName]);
  v30 = (void *)objc_claimAutoreleasedReturnValue(-[OTDetermineCDPCapableAccountStatusOperation deps](self, "deps"));
  v31 = (void *)objc_claimAutoreleasedReturnValue([v30 contextID]);
  id v54 = 0LL;
  v19 = (__CFString *)objc_claimAutoreleasedReturnValue( [v25 findAccountForCurrentThread:v27 optionalAltDSID:0 cloudkitContainerName:v29 octagonContextID:v31 error:&v54]);
  v18 = (__CFString *)v54;

  if (v19)
  {
    v32 = (void *)objc_claimAutoreleasedReturnValue(-[__CFString altDSID](v19, "altDSID"));

    if (v32)
    {
      if (!v18)
      {
        v7 = (__CFString *)objc_claimAutoreleasedReturnValue(-[__CFString altDSID](v19, "altDSID"));

LABEL_2:
        v8 = sub_10001267C("octagon");
        v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
        if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          v56 = v7;
          _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "iCloud account(altDSID %@) is configured; checking if account is CDP capable",
            buf,
            0xCu);
        }

        v10 = (void *)objc_claimAutoreleasedReturnValue(-[OTDetermineCDPCapableAccountStatusOperation deps](self, "deps"));
        v11 = (void *)objc_claimAutoreleasedReturnValue([v10 authKitAdapter]);
        unsigned int v12 = [v11 accountIsCDPCapableByAltDSID:v7];

        id v13 = sub_10001267C("octagon");
        id v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
        {
          id v15 = @"not capable";
          if (v12) {
            id v15 = @"capable";
          }
          *(_DWORD *)buf = 138412290;
          v56 = v15;
          _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Account is %@", buf, 0xCu);
        }

        id v16 = (void *)objc_claimAutoreleasedReturnValue(-[OTDetermineCDPCapableAccountStatusOperation deps](self, "deps"));
        v17 = (void *)objc_claimAutoreleasedReturnValue([v16 stateHolder]);
        v50[0] = _NSConcreteStackBlock;
        v50[1] = 3221225472LL;
        v50[2] = sub_100135F60;
        v50[3] = &unk_100290340;
        char v52 = v12;
        v18 = v7;
        v51 = v18;
        id v49 = 0LL;
        [v17 persistAccountChanges:v50 error:&v49];
        v19 = (__CFString *)v49;

        if (v12) {
          uint64_t v20 = objc_claimAutoreleasedReturnValue(-[OTDetermineCDPCapableAccountStatusOperation intendedState](self, "intendedState"));
        }
        else {
          uint64_t v20 = objc_claimAutoreleasedReturnValue(-[OTDetermineCDPCapableAccountStatusOperation stateIfNotCDPCapable](self, "stateIfNotCDPCapable"));
        }
        v33 = (void *)v20;
        -[OTDetermineCDPCapableAccountStatusOperation setNextState:](self, "setNextState:", v20);

        if (v19)
        {
          v34 = sub_10001267C("SecError");
          v35 = (os_log_s *)objc_claimAutoreleasedReturnValue(v34);
          if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            v56 = v19;
            _os_log_impl( (void *)&_mh_execute_header,  v35,  OS_LOG_TYPE_DEFAULT,  "octagon: unable to save new account state: %@",  buf,  0xCu);
          }
        }

        v36 = (void *)objc_claimAutoreleasedReturnValue(-[OTDetermineCDPCapableAccountStatusOperation finishedOp](self, "finishedOp"));
        -[CKKSGroupOperation runBeforeGroupFinished:](self, "runBeforeGroupFinished:", v36);

        v37 = v51;
        goto LABEL_29;
      }
    }
  }

  v38 = sub_10001267C("SecError");
  v39 = (os_log_s *)objc_claimAutoreleasedReturnValue(v38);
  if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
  {
    v40 = (void *)objc_claimAutoreleasedReturnValue(-[OTDetermineCDPCapableAccountStatusOperation deps](self, "deps"));
    v41 = (__CFString *)objc_claimAutoreleasedReturnValue([v40 contextID]);
    *(_DWORD *)buf = 138412546;
    v56 = v41;
    __int16 v57 = 2112;
    v58 = v18;
    _os_log_impl( (void *)&_mh_execute_header,  v39,  OS_LOG_TYPE_DEFAULT,  "octagon-account: unable to determine active account(%@); assuming no account is present: %@",
      buf,
      0x16u);
  }

  v42 = (void *)objc_claimAutoreleasedReturnValue(-[OTDetermineCDPCapableAccountStatusOperation deps](self, "deps"));
  v43 = (void *)objc_claimAutoreleasedReturnValue([v42 stateHolder]);
  id v53 = 0LL;
  [v43 persistAccountChanges:&stru_100290318 error:&v53];
  v37 = (__CFString *)v53;

  if (v37)
  {
    v44 = sub_10001267C("SecError");
    v45 = (os_log_s *)objc_claimAutoreleasedReturnValue(v44);
    if (os_log_type_enabled(v45, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v56 = v37;
      _os_log_impl( (void *)&_mh_execute_header,  v45,  OS_LOG_TYPE_DEFAULT,  "octagon: unable to save new account state: %@",  buf,  0xCu);
    }
  }

  v46 = (void *)objc_claimAutoreleasedReturnValue(-[OTDetermineCDPCapableAccountStatusOperation stateIfNoAccount](self, "stateIfNoAccount"));
  -[OTDetermineCDPCapableAccountStatusOperation setNextState:](self, "setNextState:", v46);

  v47 = (void *)objc_claimAutoreleasedReturnValue(-[OTDetermineCDPCapableAccountStatusOperation finishedOp](self, "finishedOp"));
  -[CKKSGroupOperation runBeforeGroupFinished:](self, "runBeforeGroupFinished:", v47);

LABEL_29:
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

- (OctagonStateString)stateIfNotCDPCapable
{
  return (OctagonStateString *)objc_getProperty(self, a2, 152LL, 1);
}

- (void)setStateIfNotCDPCapable:(id)a3
{
}

- (OctagonStateString)stateIfNoAccount
{
  return (OctagonStateString *)objc_getProperty(self, a2, 160LL, 1);
}

- (void)setStateIfNoAccount:(id)a3
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