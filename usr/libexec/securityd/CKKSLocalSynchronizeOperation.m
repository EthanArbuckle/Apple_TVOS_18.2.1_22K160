@interface CKKSLocalSynchronizeOperation
- (CKKSKeychainView)ckks;
- (CKKSLocalSynchronizeOperation)init;
- (CKKSLocalSynchronizeOperation)initWithCKKSKeychainView:(id)a3 operationDependencies:(id)a4;
- (CKKSOperationDependencies)deps;
- (int)restartCount;
- (void)groupStart;
- (void)setCkks:(id)a3;
- (void)setDeps:(id)a3;
- (void)setRestartCount:(int)a3;
@end

@implementation CKKSLocalSynchronizeOperation

- (CKKSLocalSynchronizeOperation)init
{
  return 0LL;
}

- (CKKSLocalSynchronizeOperation)initWithCKKSKeychainView:(id)a3 operationDependencies:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)&OBJC_CLASS___CKKSLocalSynchronizeOperation;
  v8 = -[CKKSGroupOperation init](&v12, "init");
  v9 = v8;
  if (v8)
  {
    objc_storeWeak((id *)(v8 + 132), v6);
    *((_DWORD *)v9 + 32) = 0;
    objc_storeStrong((id *)(v9 + 140), a4);
    v10 = (void *)objc_claimAutoreleasedReturnValue([v6 holdLocalSynchronizeOperation]);
    [v9 addNullableDependency:v10];
  }

  return (CKKSLocalSynchronizeOperation *)v9;
}

- (void)groupStart
{
  id location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSLocalSynchronizeOperation deps](self, "deps"));
  v4 = (void *)objc_claimAutoreleasedReturnValue([v3 personaAdapter]);
  [v4 prepareThreadForKeychainAPIUseForPersonaIdentifier:0];

  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  v6[2] = sub_100084B70;
  v6[3] = &unk_1002846C0;
  v6[4] = self;
  id v5 = (id)objc_claimAutoreleasedReturnValue(-[CKKSLocalSynchronizeOperation ckks](self, "ckks"));
  id v7 = v5;
  objc_copyWeak(&v8, &location);
  [v5 dispatchSyncWithSQLTransaction:v6];
  objc_destroyWeak(&v8);

  objc_destroyWeak(&location);
}

- (CKKSKeychainView)ckks
{
  return (CKKSKeychainView *)objc_autoreleaseReturnValue(objc_loadWeakRetained((id *)((char *)&self->super._startOperation
                                                                                    + 4)));
}

- (void)setCkks:(id)a3
{
}

- (CKKSOperationDependencies)deps
{
  return (CKKSOperationDependencies *)objc_getProperty(self, a2, 140LL, 1);
}

- (void)setDeps:(id)a3
{
}

- (int)restartCount
{
  return (int)self->super._startOperation;
}

- (void)setRestartCount:(int)a3
{
  LODWORD(self->super._startOperation) = a3;
}

- (void).cxx_destruct
{
}

@end