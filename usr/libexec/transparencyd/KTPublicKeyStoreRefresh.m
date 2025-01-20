@interface KTPublicKeyStoreRefresh
- (BOOL)isInitialFetch;
- (KTOperationDependencies)deps;
- (KTPublicKeyStoreRefresh)initWithDependencies:(id)a3 initialFetch:(BOOL)a4 intendedState:(id)a5 errorState:(id)a6;
- (KTStateString)intendedState;
- (KTStateString)nextState;
- (NSOperation)finishedOp;
- (void)groupStart;
- (void)setDeps:(id)a3;
- (void)setFinishedOp:(id)a3;
- (void)setIsInitialFetch:(BOOL)a3;
- (void)setNextState:(id)a3;
@end

@implementation KTPublicKeyStoreRefresh

- (KTPublicKeyStoreRefresh)initWithDependencies:(id)a3 initialFetch:(BOOL)a4 intendedState:(id)a5 errorState:(id)a6
{
  id v11 = a3;
  id v12 = a5;
  id v13 = a6;
  v18.receiver = self;
  v18.super_class = (Class)&OBJC_CLASS___KTPublicKeyStoreRefresh;
  v14 = -[KTGroupOperation init](&v18, "init");
  v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)(v14 + 142), a3);
    v15[120] = a4;
    objc_storeStrong((id *)(v15 + 126), a6);
    objc_storeStrong((id *)(v15 + 134), a5);
    v16 = v15;
  }

  return (KTPublicKeyStoreRefresh *)v15;
}

- (void)groupStart
{
  if (-[KTPublicKeyStoreRefresh isInitialFetch](self, "isInitialFetch")
    && (v3 = (void *)objc_claimAutoreleasedReturnValue(-[KTPublicKeyStoreRefresh deps](self, "deps")),
        v4 = (void *)objc_claimAutoreleasedReturnValue([v3 publicKeyStore]),
        unsigned int v5 = [v4 initiallyFetched],
        v4,
        v3,
        v5))
  {
    id v21 = (id)objc_claimAutoreleasedReturnValue(-[KTPublicKeyStoreRefresh intendedState](self, "intendedState"));
    -[KTPublicKeyStoreRefresh setNextState:](self, "setNextState:", v21);
  }

  else
  {
    if (qword_1002EE9D8 != -1) {
      dispatch_once(&qword_1002EE9D8, &stru_100283E28);
    }
    v6 = (void *)qword_1002EE9E0;
    if (os_log_type_enabled((os_log_t)qword_1002EE9E0, OS_LOG_TYPE_ERROR))
    {
      v7 = v6;
      v8 = (void *)objc_claimAutoreleasedReturnValue(-[KTPublicKeyStoreRefresh deps](self, "deps"));
      v9 = (void *)objc_claimAutoreleasedReturnValue([v8 publicKeyStore]);
      *(_DWORD *)buf = 138412290;
      *(void *)&buf[4] = v9;
      _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_ERROR,  "Fetching public key store because disk key store (%@) not ready",  buf,  0xCu);
    }

    v10 = objc_alloc_init(&OBJC_CLASS___NSOperation);
    -[KTPublicKeyStoreRefresh setFinishedOp:](self, "setFinishedOp:", v10);

    id v11 = (void *)objc_claimAutoreleasedReturnValue(-[KTPublicKeyStoreRefresh finishedOp](self, "finishedOp"));
    [v11 setName:@"KTPublicKeyStoreFetch"];

    id v12 = (void *)objc_claimAutoreleasedReturnValue(-[KTPublicKeyStoreRefresh finishedOp](self, "finishedOp"));
    -[KTGroupOperation dependOnBeforeGroupFinished:](self, "dependOnBeforeGroupFinished:", v12);

    *(void *)buf = 0LL;
    objc_initWeak((id *)buf, self);
    id v13 = (void *)objc_claimAutoreleasedReturnValue(-[KTPublicKeyStoreRefresh deps](self, "deps"));
    v14 = (void *)objc_claimAutoreleasedReturnValue([v13 publicKeyStore]);
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[KTPublicKeyStoreRefresh deps](self, "deps"));
    v16 = (void *)objc_claimAutoreleasedReturnValue([v15 logClient]);
    v17 = (void *)objc_claimAutoreleasedReturnValue(-[KTPublicKeyStoreRefresh deps](self, "deps"));
    objc_super v18 = (void *)objc_claimAutoreleasedReturnValue([v17 dataStore]);
    v19 = (void *)objc_claimAutoreleasedReturnValue(-[KTPublicKeyStoreRefresh deps](self, "deps"));
    v20 = (void *)objc_claimAutoreleasedReturnValue([v19 contextStore]);
    v22[0] = _NSConcreteStackBlock;
    v22[1] = 3221225472LL;
    v22[2] = sub_10014B148;
    v22[3] = &unk_1002836F8;
    objc_copyWeak(&v23, (id *)buf);
    [v14 updatePublicKeyStores:v16 diskStore:v18 contextStore:v20 complete:v22];

    objc_destroyWeak(&v23);
    objc_destroyWeak((id *)buf);
  }

- (KTStateString)nextState
{
  return (KTStateString *)objc_getProperty(self, a2, 126LL, 1);
}

- (void)setNextState:(id)a3
{
}

- (KTStateString)intendedState
{
  return (KTStateString *)objc_getProperty(self, a2, 134LL, 1);
}

- (KTOperationDependencies)deps
{
  return (KTOperationDependencies *)objc_getProperty(self, a2, 142LL, 1);
}

- (void)setDeps:(id)a3
{
}

- (BOOL)isInitialFetch
{
  return (uint64_t)self->super._startOperation & 1;
}

- (void)setIsInitialFetch:(BOOL)a3
{
  LOBYTE(self->super._startOperation) = a3;
}

- (NSOperation)finishedOp
{
  return (NSOperation *)objc_getProperty(self, a2, 150LL, 1);
}

- (void)setFinishedOp:(id)a3
{
}

- (void).cxx_destruct
{
}

@end