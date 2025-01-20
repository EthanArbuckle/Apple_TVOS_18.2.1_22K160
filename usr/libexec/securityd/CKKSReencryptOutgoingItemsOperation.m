@interface CKKSReencryptOutgoingItemsOperation
- (CKKSKeychainView)ckks;
- (CKKSOperationDependencies)deps;
- (CKKSReencryptOutgoingItemsOperation)init;
- (CKKSReencryptOutgoingItemsOperation)initWithDependencies:(id)a3 intendedState:(id)a4 errorState:(id)a5 holdOperation:(id)a6;
- (OctagonStateString)intendedState;
- (OctagonStateString)nextState;
- (void)main;
- (void)setCkks:(id)a3;
- (void)setDeps:(id)a3;
- (void)setNextState:(id)a3;
@end

@implementation CKKSReencryptOutgoingItemsOperation

- (CKKSReencryptOutgoingItemsOperation)init
{
  return 0LL;
}

- (CKKSReencryptOutgoingItemsOperation)initWithDependencies:(id)a3 intendedState:(id)a4 errorState:(id)a5 holdOperation:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v18.receiver = self;
  v18.super_class = (Class)&OBJC_CLASS___CKKSReencryptOutgoingItemsOperation;
  v15 = -[CKKSResultOperation init](&v18, "init");
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->super._timeoutQueue, a3);
    objc_storeStrong((id *)&v16->super._descriptionUnderlyingError, a5);
    objc_storeStrong((id *)&v16->super._successDependencies, a4);
    -[CKKSReencryptOutgoingItemsOperation addNullableDependency:](v16, "addNullableDependency:", v14);
  }

  return v16;
}

- (void)main
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSReencryptOutgoingItemsOperation deps](self, "deps"));
  v4 = (void *)objc_claimAutoreleasedReturnValue([v3 personaAdapter]);
  [v4 prepareThreadForKeychainAPIUseForPersonaIdentifier:0];

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSReencryptOutgoingItemsOperation deps](self, "deps"));
  v6 = (void *)objc_claimAutoreleasedReturnValue([v5 databaseProvider]);
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_100164FEC;
  v7[3] = &unk_100290F80;
  v7[4] = self;
  [v6 dispatchSyncWithSQLTransaction:v7];
}

- (OctagonStateString)nextState
{
  return (OctagonStateString *)objc_getProperty(self, a2, 80LL, 1);
}

- (void)setNextState:(id)a3
{
}

- (OctagonStateString)intendedState
{
  return (OctagonStateString *)objc_getProperty(self, a2, 88LL, 1);
}

- (CKKSOperationDependencies)deps
{
  return (CKKSOperationDependencies *)objc_getProperty(self, a2, 96LL, 1);
}

- (void)setDeps:(id)a3
{
}

- (CKKSKeychainView)ckks
{
  return (CKKSKeychainView *)objc_loadWeakRetained(&self->super._finishingBlock);
}

- (void)setCkks:(id)a3
{
}

- (void).cxx_destruct
{
}

@end