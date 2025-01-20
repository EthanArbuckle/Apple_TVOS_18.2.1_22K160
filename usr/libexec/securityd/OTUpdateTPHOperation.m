@interface OTUpdateTPHOperation
- (BOOL)forceRefetch;
- (NSOperation)finishedOp;
- (OTOperationDependencies)deps;
- (OTUpdateTPHOperation)initWithDependencies:(id)a3 intendedState:(id)a4 peerUnknownState:(id)a5 determineCDPState:(id)a6 errorState:(id)a7 forceRefetch:(BOOL)a8 retryFlag:(id)a9;
- (OctagonFlagString)retryFlag;
- (OctagonStateString)determineCDPState;
- (OctagonStateString)intendedState;
- (OctagonStateString)nextState;
- (OctagonStateString)peerUnknownState;
- (void)groupStart;
- (void)setDeps:(id)a3;
- (void)setDetermineCDPState:(id)a3;
- (void)setFinishedOp:(id)a3;
- (void)setForceRefetch:(BOOL)a3;
- (void)setNextState:(id)a3;
- (void)setPeerUnknownState:(id)a3;
- (void)setRetryFlag:(id)a3;
@end

@implementation OTUpdateTPHOperation

- (OTUpdateTPHOperation)initWithDependencies:(id)a3 intendedState:(id)a4 peerUnknownState:(id)a5 determineCDPState:(id)a6 errorState:(id)a7 forceRefetch:(BOOL)a8 retryFlag:(id)a9
{
  id v24 = a3;
  id v23 = a4;
  id v22 = a5;
  id v15 = a6;
  id v16 = a7;
  id v17 = a9;
  v25.receiver = self;
  v25.super_class = (Class)&OBJC_CLASS___OTUpdateTPHOperation;
  v18 = -[CKKSGroupOperation init](&v25, "init");
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)(v18 + 150), a3);
    objc_storeStrong((id *)(v19 + 142), a4);
    objc_storeStrong((id *)(v19 + 134), a7);
    objc_storeStrong((id *)(v19 + 158), a5);
    objc_storeStrong((id *)(v19 + 166), a6);
    v19[128] = a8;
    objc_storeStrong((id *)(v19 + 182), a9);
  }

  return (OTUpdateTPHOperation *)v19;
}

- (void)groupStart
{
  id location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  v34[0] = _NSConcreteStackBlock;
  v34[1] = 3221225472LL;
  v34[2] = sub_1000A90EC;
  v34[3] = &unk_100291A38;
  objc_copyWeak(&v35, &location);
  v3 = (void *)objc_claimAutoreleasedReturnValue( +[NSBlockOperation blockOperationWithBlock:]( &OBJC_CLASS___NSBlockOperation,  "blockOperationWithBlock:",  v34));
  -[OTUpdateTPHOperation setFinishedOp:](self, "setFinishedOp:", v3);

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[OTUpdateTPHOperation finishedOp](self, "finishedOp"));
  -[CKKSGroupOperation dependOnBeforeGroupFinished:](self, "dependOnBeforeGroupFinished:", v4);

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[OTUpdateTPHOperation deps](self, "deps"));
  v6 = (void *)objc_claimAutoreleasedReturnValue([v5 stateHolder]);
  id v33 = 0LL;
  v29 = (void *)objc_claimAutoreleasedReturnValue([v6 loadOrCreateAccountMetadata:&v33]);
  id v28 = v33;

  if (!v29 || v28)
  {
    v9 = sub_10001267C("SecError");
    v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v38 = v28;
      _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "octagon: Unable to load current metadata: %@",  buf,  0xCu);
    }

    id v24 = 0LL;
  }

  else
  {
    v7 = objc_alloc(&OBJC_CLASS___TrustedPeersHelperIntendedTPPBSecureElementIdentity);
    v8 = (os_log_s *)objc_claimAutoreleasedReturnValue([v29 parsedSecureElementIdentity]);
    id v24 = -[TrustedPeersHelperIntendedTPPBSecureElementIdentity initWithSecureElementIdentity:]( v7,  "initWithSecureElementIdentity:",  v8);
  }

  else {
    BOOL v21 = 0;
  }
  if (-[OTUpdateTPHOperation forceRefetch](self, "forceRefetch"))
  {
    v10 = sub_10001267C("octagon");
    v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Forcing a full refetch", buf, 2u);
    }
  }

  v27 = (void *)objc_claimAutoreleasedReturnValue(-[OTUpdateTPHOperation deps](self, "deps"));
  id v23 = (void *)objc_claimAutoreleasedReturnValue([v27 cuttlefishXPCWrapper]);
  v26 = (void *)objc_claimAutoreleasedReturnValue(-[OTUpdateTPHOperation deps](self, "deps"));
  id v22 = (void *)objc_claimAutoreleasedReturnValue([v26 activeAccount]);
  unsigned int v20 = -[OTUpdateTPHOperation forceRefetch](self, "forceRefetch");
  objc_super v25 = (void *)objc_claimAutoreleasedReturnValue(-[OTUpdateTPHOperation deps](self, "deps"));
  v12 = (void *)objc_claimAutoreleasedReturnValue([v25 deviceInformationAdapter]);
  v13 = (void *)objc_claimAutoreleasedReturnValue([v12 deviceName]);
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[OTUpdateTPHOperation deps](self, "deps"));
  id v15 = (void *)objc_claimAutoreleasedReturnValue([v14 deviceInformationAdapter]);
  id v16 = (void *)objc_claimAutoreleasedReturnValue([v15 serialNumber]);
  id v17 = (void *)objc_claimAutoreleasedReturnValue(-[OTUpdateTPHOperation deps](self, "deps"));
  v18 = (void *)objc_claimAutoreleasedReturnValue([v17 deviceInformationAdapter]);
  v19 = (void *)objc_claimAutoreleasedReturnValue([v18 osVersion]);
  v30[0] = _NSConcreteStackBlock;
  v30[1] = 3221225472LL;
  v30[2] = sub_1000A9400;
  v30[3] = &unk_100284F38;
  objc_copyWeak(&v31, &location);
  BOOL v32 = v21;
  [v23 updateWithSpecificUser:v22 forceRefetch:v20 deviceName:v13 serialNumber:v16 osVersion:v19 policyVersion:0 policySecrets:0 syncUserControllab leViews:0 secureElementIdentity:v24 walrusSetting:0 webAccess:0 reply:v30];

  objc_destroyWeak(&v31);
  objc_destroyWeak(&v35);
  objc_destroyWeak(&location);
}

- (OctagonStateString)nextState
{
  return (OctagonStateString *)objc_getProperty(self, a2, 134LL, 1);
}

- (void)setNextState:(id)a3
{
}

- (OctagonStateString)intendedState
{
  return (OctagonStateString *)objc_getProperty(self, a2, 142LL, 1);
}

- (OTOperationDependencies)deps
{
  return (OTOperationDependencies *)objc_getProperty(self, a2, 150LL, 1);
}

- (void)setDeps:(id)a3
{
}

- (BOOL)forceRefetch
{
  return (uint64_t)self->super._startOperation & 1;
}

- (void)setForceRefetch:(BOOL)a3
{
  LOBYTE(self->super._startOperation) = a3;
}

- (OctagonStateString)peerUnknownState
{
  return (OctagonStateString *)objc_getProperty(self, a2, 158LL, 1);
}

- (void)setPeerUnknownState:(id)a3
{
}

- (OctagonStateString)determineCDPState
{
  return (OctagonStateString *)objc_getProperty(self, a2, 166LL, 1);
}

- (void)setDetermineCDPState:(id)a3
{
}

- (NSOperation)finishedOp
{
  return (NSOperation *)objc_getProperty(self, a2, 174LL, 1);
}

- (void)setFinishedOp:(id)a3
{
}

- (OctagonFlagString)retryFlag
{
  return (OctagonFlagString *)objc_getProperty(self, a2, 182LL, 1);
}

- (void)setRetryFlag:(id)a3
{
}

- (void).cxx_destruct
{
}

@end