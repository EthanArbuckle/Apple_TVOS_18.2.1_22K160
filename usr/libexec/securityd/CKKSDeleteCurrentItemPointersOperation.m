@interface CKKSDeleteCurrentItemPointersOperation
- (CKKSDeleteCurrentItemPointersOperation)initWithCKKSOperationDependencies:(id)a3 viewState:(id)a4 accessGroup:(id)a5 identifiers:(id)a6 ckoperationGroup:(id)a7;
- (CKKSKeychainViewState)viewState;
- (CKKSOperationDependencies)deps;
- (CKModifyRecordsOperation)modifyRecordsOperation;
- (CKOperationGroup)ckoperationGroup;
- (NSArray)identifiers;
- (NSString)accessGroup;
- (void)groupStart;
- (void)setAccessGroup:(id)a3;
- (void)setCkoperationGroup:(id)a3;
- (void)setDeps:(id)a3;
- (void)setIdentifiers:(id)a3;
- (void)setModifyRecordsOperation:(id)a3;
@end

@implementation CKKSDeleteCurrentItemPointersOperation

- (CKKSDeleteCurrentItemPointersOperation)initWithCKKSOperationDependencies:(id)a3 viewState:(id)a4 accessGroup:(id)a5 identifiers:(id)a6 ckoperationGroup:(id)a7
{
  id v20 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  v21.receiver = self;
  v21.super_class = (Class)&OBJC_CLASS___CKKSDeleteCurrentItemPointersOperation;
  v17 = -[CKKSGroupOperation init](&v21, "init");
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->super._internalSuccesses, a3);
    objc_storeStrong((id *)&v18->super._startOperation, a4);
    objc_storeStrong((id *)&v18->_viewState, a5);
    objc_storeStrong((id *)&v18->_modifyRecordsOperation, a6);
    objc_storeStrong((id *)&v18->super._queue, a7);
  }

  return v18;
}

- (void)groupStart
{
  id location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSDeleteCurrentItemPointersOperation deps](self, "deps"));
  v4 = (void *)objc_claimAutoreleasedReturnValue([v3 personaAdapter]);
  [v4 prepareThreadForKeychainAPIUseForPersonaIdentifier:0];

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSDeleteCurrentItemPointersOperation deps](self, "deps"));
  v6 = (void *)objc_claimAutoreleasedReturnValue([v5 databaseProvider]);
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_10011D9B8;
  v7[3] = &unk_100290258;
  v7[4] = self;
  objc_copyWeak(&v8, &location);
  [v6 dispatchSyncWithSQLTransaction:v7];

  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);
}

- (CKKSKeychainViewState)viewState
{
  return (CKKSKeychainViewState *)objc_getProperty(self, a2, 128LL, 1);
}

- (CKModifyRecordsOperation)modifyRecordsOperation
{
  return (CKModifyRecordsOperation *)objc_getProperty(self, a2, 136LL, 1);
}

- (void)setModifyRecordsOperation:(id)a3
{
}

- (CKOperationGroup)ckoperationGroup
{
  return (CKOperationGroup *)objc_getProperty(self, a2, 144LL, 1);
}

- (void)setCkoperationGroup:(id)a3
{
}

- (CKKSOperationDependencies)deps
{
  return (CKKSOperationDependencies *)objc_getProperty(self, a2, 152LL, 1);
}

- (void)setDeps:(id)a3
{
}

- (NSString)accessGroup
{
  return (NSString *)objc_getProperty(self, a2, 160LL, 1);
}

- (void)setAccessGroup:(id)a3
{
}

- (NSArray)identifiers
{
  return (NSArray *)objc_getProperty(self, a2, 168LL, 1);
}

- (void)setIdentifiers:(id)a3
{
}

- (void).cxx_destruct
{
}

@end