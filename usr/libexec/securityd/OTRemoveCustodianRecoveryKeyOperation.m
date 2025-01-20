@interface OTRemoveCustodianRecoveryKeyOperation
- (NSOperation)finishOp;
- (NSUUID)uuid;
- (OTOperationDependencies)deps;
- (OTRemoveCustodianRecoveryKeyOperation)initWithUUID:(id)a3 dependencies:(id)a4;
- (void)groupStart;
- (void)setDeps:(id)a3;
- (void)setFinishOp:(id)a3;
- (void)setUuid:(id)a3;
@end

@implementation OTRemoveCustodianRecoveryKeyOperation

- (OTRemoveCustodianRecoveryKeyOperation)initWithUUID:(id)a3 dependencies:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)&OBJC_CLASS___OTRemoveCustodianRecoveryKeyOperation;
  v9 = -[CKKSGroupOperation init](&v12, "init");
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->super._finishOperation, a3);
    objc_storeStrong((id *)&v10->super._startOperation, a4);
  }

  return v10;
}

- (void)groupStart
{
  v3 = objc_alloc_init(&OBJC_CLASS___NSOperation);
  -[OTRemoveCustodianRecoveryKeyOperation setFinishOp:](self, "setFinishOp:", v3);

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[OTRemoveCustodianRecoveryKeyOperation finishOp](self, "finishOp"));
  -[CKKSGroupOperation dependOnBeforeGroupFinished:](self, "dependOnBeforeGroupFinished:", v4);

  id location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[OTRemoveCustodianRecoveryKeyOperation deps](self, "deps"));
  v6 = (void *)objc_claimAutoreleasedReturnValue([v5 cuttlefishXPCWrapper]);
  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[OTRemoveCustodianRecoveryKeyOperation deps](self, "deps"));
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 activeAccount]);
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[OTRemoveCustodianRecoveryKeyOperation uuid](self, "uuid"));
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472LL;
  v10[2] = sub_1000A8384;
  v10[3] = &unk_1002915E0;
  objc_copyWeak(&v11, &location);
  [v6 removeCustodianRecoveryKeyWithSpecificUser:v8 uuid:v9 reply:v10];

  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);
}

- (OTOperationDependencies)deps
{
  return (OTOperationDependencies *)objc_getProperty(self, a2, 128LL, 1);
}

- (void)setDeps:(id)a3
{
}

- (NSUUID)uuid
{
  return (NSUUID *)objc_getProperty(self, a2, 136LL, 1);
}

- (void)setUuid:(id)a3
{
}

- (NSOperation)finishOp
{
  return (NSOperation *)objc_getProperty(self, a2, 144LL, 1);
}

- (void)setFinishOp:(id)a3
{
}

- (void).cxx_destruct
{
}

@end