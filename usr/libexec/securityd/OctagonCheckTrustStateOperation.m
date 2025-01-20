@interface OctagonCheckTrustStateOperation
- (NSOperation)finishedOp;
- (OTOperationDependencies)deps;
- (OctagonCheckTrustStateOperation)initWithDependencies:(id)a3 intendedState:(id)a4 errorState:(id)a5;
- (OctagonStateString)intendedState;
- (OctagonStateString)nextState;
- (void)afterTPHTrustState:(id)a3 trustedPeers:(id)a4;
- (void)groupStart;
- (void)setDeps:(id)a3;
- (void)setFinishedOp:(id)a3;
- (void)setNextState:(id)a3;
@end

@implementation OctagonCheckTrustStateOperation

- (OctagonCheckTrustStateOperation)initWithDependencies:(id)a3 intendedState:(id)a4 errorState:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)&OBJC_CLASS___OctagonCheckTrustStateOperation;
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
  v3 = objc_alloc_init(&OBJC_CLASS___NSOperation);
  -[OctagonCheckTrustStateOperation setFinishedOp:](self, "setFinishedOp:", v3);

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[OctagonCheckTrustStateOperation finishedOp](self, "finishedOp"));
  -[CKKSGroupOperation dependOnBeforeGroupFinished:](self, "dependOnBeforeGroupFinished:", v4);

  id location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[OctagonCheckTrustStateOperation deps](self, "deps"));
  v6 = (void *)objc_claimAutoreleasedReturnValue([v5 cuttlefishXPCWrapper]);
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[OctagonCheckTrustStateOperation deps](self, "deps"));
  v8 = (void *)objc_claimAutoreleasedReturnValue([v7 activeAccount]);
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472LL;
  v9[2] = sub_100136F08;
  v9[3] = &unk_100290370;
  objc_copyWeak(&v10, &location);
  [v6 fetchTrustStateWithSpecificUser:v8 reply:v9];

  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);
}

- (void)afterTPHTrustState:(id)a3 trustedPeers:(id)a4
{
  id v5 = a3;
  if ([v5 memberChanges])
  {
    v6 = sub_10001267C("octagon");
    v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Member list changed", buf, 2u);
    }

    v8 = (void *)objc_claimAutoreleasedReturnValue(-[OctagonCheckTrustStateOperation deps](self, "deps"));
    id v9 = (void *)objc_claimAutoreleasedReturnValue([v8 octagonAdapter]);
    [v9 sendTrustedPeerSetChangedUpdate];
  }

  id v10 = (void *)objc_claimAutoreleasedReturnValue(-[OctagonCheckTrustStateOperation deps](self, "deps"));
  id v11 = (void *)objc_claimAutoreleasedReturnValue([v10 stateHolder]);
  id v100 = 0LL;
  v12 = (void *)objc_claimAutoreleasedReturnValue([v11 loadOrCreateAccountMetadata:&v100]);
  id v13 = v100;

  if (v13)
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[OctagonCheckTrustStateOperation deps](self, "deps"));
    objc_super v15 = (void *)objc_claimAutoreleasedReturnValue([v14 lockStateTracker]);
    unsigned int v16 = [v15 isLockedError:v13];

    v17 = sub_10001267C("SecError");
    v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(v17);
    BOOL v19 = os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT);
    if (!v16)
    {
      if (v19)
      {
        *(_DWORD *)buf = 138412290;
        id v102 = v13;
        _os_log_impl( (void *)&_mh_execute_header,  v18,  OS_LOG_TYPE_DEFAULT,  "octagon-consistency: Unable to fetch current account state. Can't ensure consistency: %@",  buf,  0xCu);
      }

      goto LABEL_93;
    }

    if (v19)
    {
      *(_DWORD *)buf = 138412290;
      id v102 = v13;
      _os_log_impl( (void *)&_mh_execute_header,  v18,  OS_LOG_TYPE_DEFAULT,  "octagon-consistency: Unable to fetch current account state due to lock state: %@",  buf,  0xCu);
    }

    v20 = @"WaitForClassCUnlock";
LABEL_92:
    -[OctagonCheckTrustStateOperation setNextState:](self, "setNextState:", v20);
LABEL_93:
    id v58 = (id)objc_claimAutoreleasedReturnValue(-[OctagonCheckTrustStateOperation finishedOp](self, "finishedOp"));
    -[CKKSGroupOperation runBeforeGroupFinished:](self, "runBeforeGroupFinished:", v58);
    goto LABEL_94;
  }

  if (([v5 peerStatus] & 4) != 0
    || ([v5 peerStatus] & 0x20) != 0)
  {
    char v21 = 1;
    uint64_t v22 = 1LL;
  }

  else if (([v5 peerStatus] & 0x40) != 0 {
         || ([v5 peerStatus] & 2) != 0
  }
         || ([v5 peerStatus] & 1) != 0)
  {
    char v21 = 0;
    uint64_t v22 = 2LL;
  }

  else
  {
    char v21 = 0;
    uint64_t v22 = 0LL;
  }

  v23 = sub_10001267C("octagon-consistency");
  v24 = (os_log_s *)objc_claimAutoreleasedReturnValue(v23);
  if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v25 = TPPeerStatusToString([v5 peerStatus]);
    id v26 = (id)objc_claimAutoreleasedReturnValue(v25);
    v27 = *(&off_1002903B0 + v22);
    *(_DWORD *)buf = 138412546;
    id v102 = v26;
    __int16 v103 = 2112;
    v104 = v27;
    _os_log_impl( (void *)&_mh_execute_header,  v24,  OS_LOG_TYPE_DEFAULT,  "TPH's trust state (%@) is considered %@",  buf,  0x16u);
  }

  unsigned int v28 = [v12 trustState];
  if ((_DWORD)v22 == v28)
  {
    v29 = sub_10001267C("octagon-consistency");
    v30 = (os_log_s *)objc_claimAutoreleasedReturnValue(v29);
    if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v31 = TPPeerStatusToString([v5 peerStatus]);
      v32 = (void *)objc_claimAutoreleasedReturnValue(v31);
      *(_DWORD *)buf = 138412290;
      id v102 = v32;
      _os_log_impl( (void *)&_mh_execute_header,  v30,  OS_LOG_TYPE_DEFAULT,  "TPH peer status matches cache: (%@)",  buf,  0xCu);
    }

    v33 = (void *)objc_claimAutoreleasedReturnValue(+[CKKSAnalytics logger](&OBJC_CLASS___CKKSAnalytics, "logger"));
    [v33 logSuccessForEventNamed:@"OctagonEventCheckTrustState"];
  }

  else
  {
    v34 = sub_10001267C("SecError");
    v35 = (os_log_s *)objc_claimAutoreleasedReturnValue(v34);
    if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
    {
      id v36 = [v12 trustState];
      if (v36 >= 3) {
        v37 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"(unknown: %i)",  v36));
      }
      else {
        v37 = *(&off_1002903B0 + v36);
      }
      id v38 = v37;
      v39 = *(&off_1002903B0 + v22);
      *(_DWORD *)buf = 138412546;
      id v102 = v38;
      __int16 v103 = 2112;
      v104 = v39;
      _os_log_impl( (void *)&_mh_execute_header,  v35,  OS_LOG_TYPE_DEFAULT,  "octagon-consistency: Locally cached status (%@) does not match TPH's current peer status (%@)",  buf,  0x16u);
    }

    unsigned int v40 = [v12 trustState];
    char v41 = v21 ^ 1;
    if (v40 != 2) {
      char v41 = 1;
    }
    if ((v41 & 1) == 0)
    {
      v42 = (void *)objc_claimAutoreleasedReturnValue(+[CKKSAnalytics logger](&OBJC_CLASS___CKKSAnalytics, "logger"));
      [v42 logHardFailureForEventNamed:@"OctagonEventCheckTrustState" withAttributes:0];
    }

    [v12 setTrustState:v22];
  }

  v43 = (void *)objc_claimAutoreleasedReturnValue([v5 peerID]);
  v44 = (void *)objc_claimAutoreleasedReturnValue([v12 peerID]);
  if ([v43 isEqualToString:v44])
  {

    goto LABEL_39;
  }

  v48 = (void *)objc_claimAutoreleasedReturnValue([v5 peerID]);
  if (v48)
  {

LABEL_46:
    v50 = sub_10001267C("SecError");
    v51 = (os_log_s *)objc_claimAutoreleasedReturnValue(v50);
    if (os_log_type_enabled(v51, OS_LOG_TYPE_DEFAULT))
    {
      v52 = (void *)objc_claimAutoreleasedReturnValue([v12 peerID]);
      v53 = (void *)objc_claimAutoreleasedReturnValue([v5 peerID]);
      *(_DWORD *)buf = 138412546;
      id v102 = v52;
      __int16 v103 = 2112;
      v104 = v53;
      _os_log_impl( (void *)&_mh_execute_header,  v51,  OS_LOG_TYPE_DEFAULT,  "octagon-consistency: Locally cached peer ID (%@) does not match TPH's current peer ID (%@)",  buf,  0x16u);
    }

    v54 = (void *)objc_claimAutoreleasedReturnValue([v5 peerID]);
    [v12 setPeerID:v54];

    goto LABEL_49;
  }

  v49 = (void *)objc_claimAutoreleasedReturnValue([v12 peerID]);

  if (v49) {
    goto LABEL_46;
  }
LABEL_39:
  v45 = sub_10001267C("octagon-consistency");
  v46 = (os_log_s *)objc_claimAutoreleasedReturnValue(v45);
  if (os_log_type_enabled(v46, OS_LOG_TYPE_DEFAULT))
  {
    v47 = (void *)objc_claimAutoreleasedReturnValue([v5 peerID]);
    *(_DWORD *)buf = 138412290;
    id v102 = v47;
    _os_log_impl((void *)&_mh_execute_header, v46, OS_LOG_TYPE_DEFAULT, "TPH peer ID matches cache: (%@)", buf, 0xCu);
  }

  if ((_DWORD)v22 == v28)
  {
LABEL_54:
    v61 = (void *)objc_claimAutoreleasedReturnValue([v5 osVersion]);

    if (v61)
    {
      v62 = (void *)objc_claimAutoreleasedReturnValue(-[OctagonCheckTrustStateOperation deps](self, "deps"));
      v63 = (void *)objc_claimAutoreleasedReturnValue([v62 deviceInformationAdapter]);
      v64 = (void *)objc_claimAutoreleasedReturnValue([v63 osVersion]);

      if (v64)
      {
        v65 = (void *)objc_claimAutoreleasedReturnValue([v5 osVersion]);
        unsigned __int8 v66 = [v64 isEqualToString:v65];

        if ((v66 & 1) == 0)
        {
          v67 = -[OctagonPendingFlag initWithFlag:conditions:]( objc_alloc(&OBJC_CLASS___OctagonPendingFlag),  "initWithFlag:conditions:",  @"recd_push",  1LL);
          v68 = (void *)objc_claimAutoreleasedReturnValue(-[OctagonCheckTrustStateOperation deps](self, "deps"));
          v69 = (void *)objc_claimAutoreleasedReturnValue([v68 flagHandler]);
          [v69 handlePendingFlag:v67];
        }
      }
    }

    uint64_t v70 = objc_claimAutoreleasedReturnValue([v12 peerID]);
    if (v70)
    {
      v71 = (void *)v70;
      unsigned int v72 = [v12 trustState];

      if (v72 == 2)
      {
        v73 = sub_10001267C("octagon");
        v74 = (os_log_s *)objc_claimAutoreleasedReturnValue(v73);
        if (os_log_type_enabled(v74, OS_LOG_TYPE_DEFAULT))
        {
          v75 = (void *)objc_claimAutoreleasedReturnValue([v12 peerID]);
          *(_DWORD *)buf = 138412290;
          id v102 = v75;
          _os_log_impl( (void *)&_mh_execute_header,  v74,  OS_LOG_TYPE_DEFAULT,  "Appear to be trusted for peer %@; ensuring correct state",
            buf,
            0xCu);
        }

        v76 = &off_100290398;
        goto LABEL_91;
      }
    }

    v77 = (void *)objc_claimAutoreleasedReturnValue(-[OctagonCheckTrustStateOperation deps](self, "deps"));
    v78 = (void *)objc_claimAutoreleasedReturnValue([v77 sosAdapter]);
    if ([v78 sosEnabled])
    {
      unsigned int v79 = [v12 trustState];

      if (v79 != 2)
      {
        v80 = sub_10001267C("octagon");
        v74 = (os_log_s *)objc_claimAutoreleasedReturnValue(v80);
        if (os_log_type_enabled(v74, OS_LOG_TYPE_DEFAULT))
        {
          v81 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "trustStateAsString:", objc_msgSend(v12, "trustState")));
          *(_DWORD *)buf = 138412290;
          id v102 = v81;
          _os_log_impl( (void *)&_mh_execute_header,  v74,  OS_LOG_TYPE_DEFAULT,  "Have iCloud account but not trusted in Octagon yet: %@; attempting SOS upgrade",
            buf,
            0xCu);
        }

        v76 = &off_1002903A0;
        goto LABEL_91;
      }
    }

    else
    {
    }

    unsigned int v89 = [v12 trustState];
    v90 = sub_10001267C("octagon");
    v74 = (os_log_s *)objc_claimAutoreleasedReturnValue(v90);
    BOOL v91 = os_log_type_enabled(v74, OS_LOG_TYPE_DEFAULT);
    if (v89 == 2)
    {
      if (v91)
      {
        id v92 = [v12 trustState];
        if (v92 >= 3) {
          v93 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"(unknown: %i)",  v92));
        }
        else {
          v93 = *(&off_1002903B0 + v92);
        }
        *(_DWORD *)buf = 138412290;
        id v102 = v93;
        v96 = "Unknown trust state (%@). Assuming untrusted...";
LABEL_89:
        _os_log_impl((void *)&_mh_execute_header, v74, OS_LOG_TYPE_DEFAULT, v96, buf, 0xCu);
      }
    }

    else if (v91)
    {
      id v95 = [v12 trustState];
      if (v95 >= 3) {
        v93 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"(unknown: %i)",  v95));
      }
      else {
        v93 = *(&off_1002903B0 + v95);
      }
      *(_DWORD *)buf = 138412290;
      id v102 = v93;
      v96 = "Have iCloud account but not trusted in Octagon (%@)";
      goto LABEL_89;
    }

    v76 = &off_1002903A8;
LABEL_91:

    v20 = *v76;
    goto LABEL_92;
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