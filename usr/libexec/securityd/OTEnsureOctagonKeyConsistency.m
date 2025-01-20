@interface OTEnsureOctagonKeyConsistency
- (NSOperation)finishOp;
- (OTEnsureOctagonKeyConsistency)initWithDependencies:(id)a3 intendedState:(id)a4 errorState:(id)a5;
- (OTOperationDependencies)deps;
- (OctagonStateString)intendedState;
- (OctagonStateString)nextState;
- (void)groupStart;
- (void)setDeps:(id)a3;
- (void)setFinishOp:(id)a3;
- (void)setNextState:(id)a3;
@end

@implementation OTEnsureOctagonKeyConsistency

- (OTEnsureOctagonKeyConsistency)initWithDependencies:(id)a3 intendedState:(id)a4 errorState:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)&OBJC_CLASS___OTEnsureOctagonKeyConsistency;
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
  v3 = sub_10001267C("octagon-sos");
  v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "Beginning ensuring Octagon keys are set properly in SOS",  buf,  2u);
  }

  v5 = objc_alloc_init(&OBJC_CLASS___NSOperation);
  -[OTEnsureOctagonKeyConsistency setFinishOp:](self, "setFinishOp:", v5);

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[OTEnsureOctagonKeyConsistency finishOp](self, "finishOp"));
  -[CKKSGroupOperation dependOnBeforeGroupFinished:](self, "dependOnBeforeGroupFinished:", v6);

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[OTEnsureOctagonKeyConsistency deps](self, "deps"));
  v8 = (void *)objc_claimAutoreleasedReturnValue([v7 sosAdapter]);
  unsigned __int8 v9 = [v8 sosEnabled];

  if ((v9 & 1) != 0)
  {
    id v10 = (void *)objc_claimAutoreleasedReturnValue(-[OTEnsureOctagonKeyConsistency deps](self, "deps"));
    id v11 = (void *)objc_claimAutoreleasedReturnValue([v10 sosAdapter]);
    id v74 = 0LL;
    v12 = (void *)objc_claimAutoreleasedReturnValue([v11 currentSOSSelf:&v74]);
    v13 = (OctagonCKKSPeerAdapter *)v74;

    if (!v12 || v13)
    {
      v25 = sub_10001267C("octagon-sos");
      v26 = (os_log_s *)objc_claimAutoreleasedReturnValue(v25);
      if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v78 = v13;
        _os_log_impl( (void *)&_mh_execute_header,  v26,  OS_LOG_TYPE_DEFAULT,  "Failed to get the current SOS self: %@",  buf,  0xCu);
      }

      -[CKKSResultOperation setError:](self, "setError:", v13);
      v19 = (OctagonCKKSPeerAdapter *)objc_claimAutoreleasedReturnValue(-[OTEnsureOctagonKeyConsistency finishOp](self, "finishOp"));
      -[CKKSGroupOperation runBeforeGroupFinished:](self, "runBeforeGroupFinished:", v19);
      goto LABEL_42;
    }

    v14 = sub_10001267C("octagon");
    objc_super v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_DEFAULT,  "Fetched SOS Self! Fetching Octagon Adapter now.",  buf,  2u);
    }

    v16 = (void *)objc_claimAutoreleasedReturnValue(-[OTEnsureOctagonKeyConsistency deps](self, "deps"));
    v17 = (void *)objc_claimAutoreleasedReturnValue([v16 stateHolder]);
    id v73 = 0LL;
    v18 = (void *)objc_claimAutoreleasedReturnValue([v17 getEgoPeerID:&v73]);
    v19 = (OctagonCKKSPeerAdapter *)v73;

    if (v19)
    {
      v20 = sub_10001267C("octagon");
      v21 = (os_log_s *)objc_claimAutoreleasedReturnValue(v20);
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v78 = v19;
        _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "failed to get peer id: %@", buf, 0xCu);
      }

      -[CKKSResultOperation setError:](self, "setError:", v19);
      v22 = (OctagonCKKSPeerAdapter *)objc_claimAutoreleasedReturnValue(-[OTEnsureOctagonKeyConsistency finishOp](self, "finishOp"));
      -[CKKSGroupOperation runBeforeGroupFinished:](self, "runBeforeGroupFinished:", v22);
      goto LABEL_41;
    }

    v70 = v12;
    v27 = objc_alloc(&OBJC_CLASS___OctagonCKKSPeerAdapter);
    v28 = (void *)objc_claimAutoreleasedReturnValue(-[OTEnsureOctagonKeyConsistency deps](self, "deps"));
    v29 = (void *)objc_claimAutoreleasedReturnValue([v28 activeAccount]);
    v30 = (void *)objc_claimAutoreleasedReturnValue(-[OTEnsureOctagonKeyConsistency deps](self, "deps"));
    v31 = (void *)objc_claimAutoreleasedReturnValue([v30 personaAdapter]);
    v32 = (void *)objc_claimAutoreleasedReturnValue(-[OTEnsureOctagonKeyConsistency deps](self, "deps"));
    v33 = (void *)objc_claimAutoreleasedReturnValue([v32 cuttlefishXPCWrapper]);
    v69 = v18;
    v22 = -[OctagonCKKSPeerAdapter initWithPeerID:specificUser:personaAdapter:cuttlefishXPC:]( v27,  "initWithPeerID:specificUser:personaAdapter:cuttlefishXPC:",  v18,  v29,  v31,  v33);

    v34 = sub_10001267C("octagon");
    v35 = (os_log_s *)objc_claimAutoreleasedReturnValue(v34);
    if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v78 = v22;
      _os_log_impl( (void *)&_mh_execute_header,  v35,  OS_LOG_TYPE_DEFAULT,  "Fetched SOS Self! Fetching Octagon Adapter now: %@",  buf,  0xCu);
    }

    id v72 = 0LL;
    v36 = (void *)objc_claimAutoreleasedReturnValue(-[OctagonCKKSPeerAdapter fetchSelfPeers:](v22, "fetchSelfPeers:", &v72));
    v37 = (OctagonCKKSPeerAdapter *)v72;
    v38 = v37;
    if (!v36 || v37)
    {
      v50 = sub_10001267C("octagon");
      v51 = (os_log_s *)objc_claimAutoreleasedReturnValue(v50);
      v19 = 0LL;
      if (os_log_type_enabled(v51, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v78 = v38;
        _os_log_impl( (void *)&_mh_execute_header,  v51,  OS_LOG_TYPE_DEFAULT,  "failed to retrieve self peers: %@",  buf,  0xCu);
      }

      -[CKKSResultOperation setError:](self, "setError:", v38);
      v40 = (void *)objc_claimAutoreleasedReturnValue(-[OTEnsureOctagonKeyConsistency finishOp](self, "finishOp"));
      -[CKKSGroupOperation runBeforeGroupFinished:](self, "runBeforeGroupFinished:", v40);
      v12 = v70;
      goto LABEL_40;
    }

    v39 = (void *)objc_claimAutoreleasedReturnValue([v36 currentSelf]);
    v40 = v39;
    v19 = 0LL;
    if (!v39)
    {
      v58 = sub_10001267C("octagon");
      v59 = (os_log_s *)objc_claimAutoreleasedReturnValue(v58);
      if (os_log_type_enabled(v59, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v59, OS_LOG_TYPE_DEFAULT, "failed to retrieve current self", buf, 2u);
      }

      NSErrorUserInfoKey v75 = NSLocalizedDescriptionKey;
      v76 = @"failed to retrieve current self";
      v60 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v76,  &v75,  1LL));
      v61 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"com.apple.security.octagon",  38LL,  v60));
      -[CKKSResultOperation setError:](self, "setError:", v61);

      v62 = (void *)objc_claimAutoreleasedReturnValue(-[OTEnsureOctagonKeyConsistency finishOp](self, "finishOp"));
      -[CKKSGroupOperation runBeforeGroupFinished:](self, "runBeforeGroupFinished:", v62);
      v12 = v70;
      v18 = v69;
      goto LABEL_39;
    }

    v41 = (void *)objc_claimAutoreleasedReturnValue([v39 publicSigningKey]);
    v42 = (void *)objc_claimAutoreleasedReturnValue([v41 keyData]);

    v43 = (void *)objc_claimAutoreleasedReturnValue([v40 publicEncryptionKey]);
    v68 = (void *)objc_claimAutoreleasedReturnValue([v43 keyData]);

    v44 = (void *)objc_claimAutoreleasedReturnValue([v70 publicSigningKey]);
    uint64_t v45 = objc_claimAutoreleasedReturnValue([v44 keyData]);

    v46 = (void *)objc_claimAutoreleasedReturnValue([v70 publicEncryptionKey]);
    uint64_t v47 = objc_claimAutoreleasedReturnValue([v46 keyData]);

    v66 = (void *)v45;
    v67 = v42;
    v65 = (void *)v47;
    if ([v42 isEqualToData:v45]
      && ([v68 isEqualToData:v47] & 1) != 0)
    {
      v48 = sub_10001267C("octagon");
      v49 = (os_log_s *)objc_claimAutoreleasedReturnValue(v48);
      if (os_log_type_enabled(v49, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v49, OS_LOG_TYPE_DEFAULT, "SOS and Octagon keys match!", buf, 2u);
      }

      v18 = v69;
      v38 = 0LL;
    }

    else
    {
      v64 = v36;
      v52 = sub_10001267C("octagon");
      v53 = (os_log_s *)objc_claimAutoreleasedReturnValue(v52);
      if (os_log_type_enabled(v53, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v53,  OS_LOG_TYPE_DEFAULT,  "SOS and Octagon signing keys do NOT match! updating SOS",  buf,  2u);
      }

      v54 = (void *)objc_claimAutoreleasedReturnValue(-[OTEnsureOctagonKeyConsistency deps](self, "deps"));
      v55 = (void *)objc_claimAutoreleasedReturnValue([v54 sosAdapter]);
      id v71 = 0LL;
      unsigned __int8 v56 = [v55 updateOctagonKeySetWithAccount:v40 error:&v71];
      v49 = (os_log_s *)v71;

      v38 = 0LL;
      if ((v56 & 1) == 0)
      {
        -[CKKSResultOperation setError:](self, "setError:", v49);
        v63 = (void *)objc_claimAutoreleasedReturnValue(-[OTEnsureOctagonKeyConsistency finishOp](self, "finishOp"));
        -[CKKSGroupOperation runBeforeGroupFinished:](self, "runBeforeGroupFinished:", v63);

        v18 = v69;
        v36 = v64;
        goto LABEL_38;
      }

      v18 = v69;
      v36 = v64;
    }

    v57 = (void *)objc_claimAutoreleasedReturnValue(-[OTEnsureOctagonKeyConsistency intendedState](self, "intendedState"));
    -[OTEnsureOctagonKeyConsistency setNextState:](self, "setNextState:", v57);

    v49 = (os_log_s *)objc_claimAutoreleasedReturnValue(-[OTEnsureOctagonKeyConsistency finishOp](self, "finishOp"));
    -[CKKSGroupOperation runBeforeGroupFinished:](self, "runBeforeGroupFinished:", v49);
LABEL_38:

    v12 = v70;
    v62 = v67;
LABEL_39:

LABEL_40:
LABEL_41:

LABEL_42:
    goto LABEL_43;
  }

  NSErrorUserInfoKey v79 = NSLocalizedDescriptionKey;
  v80 = @"sos adapter not enabled";
  v23 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v80,  &v79,  1LL));
  v24 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"com.apple.security.octagon",  39LL,  v23));
  -[CKKSResultOperation setError:](self, "setError:", v24);

  v13 = (OctagonCKKSPeerAdapter *)objc_claimAutoreleasedReturnValue(-[OTEnsureOctagonKeyConsistency finishOp](self, "finishOp"));
  -[CKKSGroupOperation runBeforeGroupFinished:](self, "runBeforeGroupFinished:", v13);
LABEL_43:
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

- (NSOperation)finishOp
{
  return (NSOperation *)objc_getProperty(self, a2, 152LL, 1);
}

- (void)setFinishOp:(id)a3
{
}

- (void).cxx_destruct
{
}

@end