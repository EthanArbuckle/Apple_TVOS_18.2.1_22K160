@interface OTPreloadOctagonKeysOperation
- (NSOperation)finishOp;
- (OTOperationDependencies)deps;
- (OTPreloadOctagonKeysOperation)initWithDependencies:(id)a3 intendedState:(id)a4 errorState:(id)a5;
- (OctagonStateString)intendedState;
- (OctagonStateString)nextState;
- (void)groupStart;
- (void)setDeps:(id)a3;
- (void)setFinishOp:(id)a3;
- (void)setNextState:(id)a3;
@end

@implementation OTPreloadOctagonKeysOperation

- (OTPreloadOctagonKeysOperation)initWithDependencies:(id)a3 intendedState:(id)a4 errorState:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)&OBJC_CLASS___OTPreloadOctagonKeysOperation;
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
  v3 = sub_10001267C("octagon-preload-keys");
  v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "Beginning operation that preloads the SOSAccount with newly created Octagon Keys",  buf,  2u);
  }

  v5 = objc_alloc_init(&OBJC_CLASS___NSOperation);
  -[OTPreloadOctagonKeysOperation setFinishOp:](self, "setFinishOp:", v5);

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[OTPreloadOctagonKeysOperation finishOp](self, "finishOp"));
  -[CKKSGroupOperation dependOnBeforeGroupFinished:](self, "dependOnBeforeGroupFinished:", v6);

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[OTPreloadOctagonKeysOperation deps](self, "deps"));
  v8 = (void *)objc_claimAutoreleasedReturnValue([v7 sosAdapter]);
  unsigned __int8 v9 = [v8 sosEnabled];

  if ((v9 & 1) != 0)
  {
    id v10 = (void *)objc_claimAutoreleasedReturnValue(-[OTPreloadOctagonKeysOperation deps](self, "deps"));
    id v11 = (void *)objc_claimAutoreleasedReturnValue([v10 octagonAdapter]);
    id v30 = 0LL;
    v12 = (void *)objc_claimAutoreleasedReturnValue([v11 fetchSelfPeers:&v30]);
    id v13 = v30;

    if (!v12 || v13)
    {
      v22 = sub_10001267C("octagon-preload-keys");
      v23 = (os_log_s *)objc_claimAutoreleasedReturnValue(v22);
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        id v34 = v13;
        _os_log_impl( (void *)&_mh_execute_header,  v23,  OS_LOG_TYPE_DEFAULT,  "failed to retrieve self peers: %@",  buf,  0xCu);
      }

      -[CKKSResultOperation setError:](self, "setError:", v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue(-[OTPreloadOctagonKeysOperation finishOp](self, "finishOp"));
      -[CKKSGroupOperation runBeforeGroupFinished:](self, "runBeforeGroupFinished:", v14);
    }

    else
    {
      v14 = (void *)objc_claimAutoreleasedReturnValue([v12 currentSelf]);
      if (v14)
      {
        objc_super v15 = (void *)objc_claimAutoreleasedReturnValue(-[OTPreloadOctagonKeysOperation deps](self, "deps"));
        v16 = (void *)objc_claimAutoreleasedReturnValue([v15 sosAdapter]);
        id v29 = 0LL;
        unsigned __int8 v17 = [v16 preloadOctagonKeySetOnAccount:v14 error:&v29];
        id v18 = v29;

        if ((v17 & 1) != 0)
        {
          v19 = (void *)objc_claimAutoreleasedReturnValue(-[OTPreloadOctagonKeysOperation intendedState](self, "intendedState"));
          -[OTPreloadOctagonKeysOperation setNextState:](self, "setNextState:", v19);
        }

        else
        {
          -[CKKSResultOperation setError:](self, "setError:", v18);
        }

        v28 = (void *)objc_claimAutoreleasedReturnValue(-[OTPreloadOctagonKeysOperation finishOp](self, "finishOp"));
        -[CKKSGroupOperation runBeforeGroupFinished:](self, "runBeforeGroupFinished:", v28);
      }

      else
      {
        v24 = sub_10001267C("octagon-preload-keys");
        v25 = (os_log_s *)objc_claimAutoreleasedReturnValue(v24);
        if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl( (void *)&_mh_execute_header,  v25,  OS_LOG_TYPE_DEFAULT,  "failed to retrieve current self",  buf,  2u);
        }

        NSErrorUserInfoKey v31 = NSLocalizedDescriptionKey;
        v32 = @"failed to retrieve current self";
        v26 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v32,  &v31,  1LL));
        v27 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"com.apple.security.octagon",  38LL,  v26));
        -[CKKSResultOperation setError:](self, "setError:", v27);

        id v18 = (id)objc_claimAutoreleasedReturnValue(-[OTPreloadOctagonKeysOperation finishOp](self, "finishOp"));
        -[CKKSGroupOperation runBeforeGroupFinished:](self, "runBeforeGroupFinished:", v18);
      }
    }
  }

  else
  {
    NSErrorUserInfoKey v35 = NSLocalizedDescriptionKey;
    v36 = @"sos adapter not enabled";
    v20 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v36,  &v35,  1LL));
    v21 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"com.apple.security.octagon",  39LL,  v20));
    -[CKKSResultOperation setError:](self, "setError:", v21);

    id v13 = (id)objc_claimAutoreleasedReturnValue(-[OTPreloadOctagonKeysOperation finishOp](self, "finishOp"));
    -[CKKSGroupOperation runBeforeGroupFinished:](self, "runBeforeGroupFinished:", v13);
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