@interface OTFetchViewsOperation
- (BOOL)isInheritedAccount;
- (OTFetchViewsOperation)initWithDependencies:(id)a3 intendedState:(id)a4 errorState:(id)a5;
- (OTOperationDependencies)deps;
- (OctagonStateString)intendedState;
- (OctagonStateString)nextState;
- (void)groupStart;
- (void)setDeps:(id)a3;
- (void)setIsInheritedAccount:(BOOL)a3;
- (void)setNextState:(id)a3;
@end

@implementation OTFetchViewsOperation

- (OTFetchViewsOperation)initWithDependencies:(id)a3 intendedState:(id)a4 errorState:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)&OBJC_CLASS___OTFetchViewsOperation;
  v12 = -[CKKSGroupOperation init](&v15, "init");
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)(v12 + 150), a3);
    objc_storeStrong((id *)(v13 + 134), a4);
    objc_storeStrong((id *)(v13 + 142), a5);
  }

  return (OTFetchViewsOperation *)v13;
}

- (void)groupStart
{
  v3 = sub_10001267C("octagon");
  v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "fetching views", buf, 2u);
  }

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[OTFetchViewsOperation deps](self, "deps"));
  v6 = (void *)objc_claimAutoreleasedReturnValue([v5 stateHolder]);
  id v18 = 0LL;
  v7 = (void *)objc_claimAutoreleasedReturnValue([v6 loadOrCreateAccountMetadata:&v18]);
  id v8 = v18;

  if (!v7 || v8)
  {
    id v9 = sub_10001267C("octagon-ckks");
    id v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      *(void *)&buf[4] = v8;
      _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "Failed to load account metadata: %@",  buf,  0xCu);
    }
  }

  else
  {
    -[OTFetchViewsOperation setIsInheritedAccount:]( self,  "setIsInheritedAccount:",  [v7 isInheritedAccount]);
  }

  *(void *)buf = 0xAAAAAAAAAAAAAAAALL;
  objc_initWeak((id *)buf, self);
  id v11 = (void *)objc_claimAutoreleasedReturnValue(-[OTFetchViewsOperation deps](self, "deps"));
  v12 = (void *)objc_claimAutoreleasedReturnValue([v11 cuttlefishXPCWrapper]);
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[OTFetchViewsOperation deps](self, "deps"));
  v14 = (void *)objc_claimAutoreleasedReturnValue([v13 activeAccount]);
  BOOL v15 = -[OTFetchViewsOperation isInheritedAccount](self, "isInheritedAccount");
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472LL;
  v16[2] = sub_1000E2A2C;
  v16[3] = &unk_100285D90;
  objc_copyWeak(&v17, (id *)buf);
  [v12 fetchCurrentPolicyWithSpecificUser:v14 modelIDOverride:0 isInheritedAccount:v15 reply:v16];

  objc_destroyWeak(&v17);
  objc_destroyWeak((id *)buf);
}

- (OctagonStateString)intendedState
{
  return (OctagonStateString *)objc_getProperty(self, a2, 134LL, 1);
}

- (OctagonStateString)nextState
{
  return (OctagonStateString *)objc_getProperty(self, a2, 142LL, 1);
}

- (void)setNextState:(id)a3
{
}

- (BOOL)isInheritedAccount
{
  return (uint64_t)self->super._startOperation & 1;
}

- (void)setIsInheritedAccount:(BOOL)a3
{
  LOBYTE(self->super._startOperation) = a3;
}

- (OTOperationDependencies)deps
{
  return (OTOperationDependencies *)objc_getProperty(self, a2, 150LL, 1);
}

- (void)setDeps:(id)a3
{
}

- (void).cxx_destruct
{
}

@end