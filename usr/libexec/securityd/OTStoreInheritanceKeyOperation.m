@interface OTStoreInheritanceKeyOperation
- (NSOperation)finishOp;
- (OTInheritanceKey)ik;
- (OTOperationDependencies)deps;
- (OTStoreInheritanceKeyOperation)initWithIK:(id)a3 dependencies:(id)a4;
- (void)groupStart;
- (void)proceedWithKeys:(id)a3;
- (void)setDeps:(id)a3;
- (void)setFinishOp:(id)a3;
- (void)setIk:(id)a3;
@end

@implementation OTStoreInheritanceKeyOperation

- (OTStoreInheritanceKeyOperation)initWithIK:(id)a3 dependencies:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)&OBJC_CLASS___OTStoreInheritanceKeyOperation;
  v9 = -[CKKSGroupOperation init](&v12, "init");
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->super._startOperation, a3);
    objc_storeStrong((id *)&v10->super._finishOperation, a4);
  }

  return v10;
}

- (void)groupStart
{
  v3 = objc_alloc_init(&OBJC_CLASS___NSOperation);
  -[OTStoreInheritanceKeyOperation setFinishOp:](self, "setFinishOp:", v3);

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[OTStoreInheritanceKeyOperation finishOp](self, "finishOp"));
  -[CKKSGroupOperation dependOnBeforeGroupFinished:](self, "dependOnBeforeGroupFinished:", v4);

  id location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  v5 = objc_alloc(&OBJC_CLASS___OTFetchCKKSKeysOperation);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[OTStoreInheritanceKeyOperation deps](self, "deps"));
  id v7 = -[OTFetchCKKSKeysOperation initWithDependencies:refetchNeeded:]( v5,  "initWithDependencies:refetchNeeded:",  v6,  0LL);

  -[CKKSGroupOperation runBeforeGroupFinished:](self, "runBeforeGroupFinished:", v7);
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472LL;
  v10[2] = sub_100093E00;
  v10[3] = &unk_100290FC8;
  objc_copyWeak(&v12, &location);
  id v8 = v7;
  v11 = v8;
  v9 = (void *)objc_claimAutoreleasedReturnValue( +[CKKSResultOperation named:withBlock:]( &OBJC_CLASS___CKKSResultOperation,  "named:withBlock:",  @"setting-recovery-tlks",  v10));
  [v9 addDependency:v8];
  -[CKKSGroupOperation runBeforeGroupFinished:](self, "runBeforeGroupFinished:", v9);

  objc_destroyWeak(&v12);
  objc_destroyWeak(&location);
}

- (void)proceedWithKeys:(id)a3
{
  id v4 = a3;
  id location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[OTStoreInheritanceKeyOperation ik](self, "ik"));
  v6 = (void *)objc_claimAutoreleasedReturnValue([v5 recoveryKeyData]);
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 base64EncodedStringWithOptions:0]);

  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[OTStoreInheritanceKeyOperation deps](self, "deps"));
  v9 = (void *)objc_claimAutoreleasedReturnValue([v8 cuttlefishXPCWrapper]);
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[OTStoreInheritanceKeyOperation deps](self, "deps"));
  v11 = (void *)objc_claimAutoreleasedReturnValue([v10 activeAccount]);
  id v12 = (void *)objc_claimAutoreleasedReturnValue(-[OTStoreInheritanceKeyOperation ik](self, "ik"));
  v13 = (void *)objc_claimAutoreleasedReturnValue([v12 uuid]);
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472LL;
  v14[2] = sub_100093BC8;
  v14[3] = &unk_100284948;
  objc_copyWeak(&v15, &location);
  [v9 createCustodianRecoveryKeyWithSpecificUser:v11 recoveryKey:v7 salt:&stru_100294B48 ckksKeys:v4 uuid:v13 kind:2 reply:v14];

  objc_destroyWeak(&v15);
  objc_destroyWeak(&location);
}

- (OTInheritanceKey)ik
{
  return (OTInheritanceKey *)objc_getProperty(self, a2, 128LL, 1);
}

- (void)setIk:(id)a3
{
}

- (OTOperationDependencies)deps
{
  return (OTOperationDependencies *)objc_getProperty(self, a2, 136LL, 1);
}

- (void)setDeps:(id)a3
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