@interface OTRecreateInheritanceKeyOperation
- (NSOperation)finishOp;
- (NSUUID)uuid;
- (OTInheritanceKey)ik;
- (OTInheritanceKey)oldIK;
- (OTOperationDependencies)deps;
- (OTRecreateInheritanceKeyOperation)initWithUUID:(id)a3 oldIK:(id)a4 dependencies:(id)a5;
- (void)groupStart;
- (void)proceedWithKeys:(id)a3 salt:(id)a4;
- (void)setDeps:(id)a3;
- (void)setFinishOp:(id)a3;
- (void)setIk:(id)a3;
- (void)setOldIK:(id)a3;
- (void)setUuid:(id)a3;
@end

@implementation OTRecreateInheritanceKeyOperation

- (OTRecreateInheritanceKeyOperation)initWithUUID:(id)a3 oldIK:(id)a4 dependencies:(id)a5
{
  v8 = (NSUUID *)a3;
  id v9 = a4;
  id v10 = a5;
  v14.receiver = self;
  v14.super_class = (Class)&OBJC_CLASS___OTRecreateInheritanceKeyOperation;
  v11 = -[CKKSGroupOperation init](&v14, "init");
  if (v11)
  {
    v12 = v8;
    if (!v8) {
      v12 = objc_alloc_init(&OBJC_CLASS___NSUUID);
    }
    objc_storeStrong((id *)&v11->super._queue, v12);
    if (!v8) {

    }
    objc_storeStrong((id *)&v11->super._internalSuccesses, a4);
    objc_storeStrong((id *)&v11->super._finishOperation, a5);
  }

  return v11;
}

- (void)groupStart
{
  v3 = objc_alloc_init(&OBJC_CLASS___NSOperation);
  -[OTRecreateInheritanceKeyOperation setFinishOp:](self, "setFinishOp:", v3);

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[OTRecreateInheritanceKeyOperation finishOp](self, "finishOp"));
  -[CKKSGroupOperation dependOnBeforeGroupFinished:](self, "dependOnBeforeGroupFinished:", v4);

  id location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  v5 = objc_alloc(&OBJC_CLASS___OTFetchCKKSKeysOperation);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[OTRecreateInheritanceKeyOperation deps](self, "deps"));
  v7 = -[OTFetchCKKSKeysOperation initWithDependencies:refetchNeeded:]( v5,  "initWithDependencies:refetchNeeded:",  v6,  0LL);

  -[CKKSGroupOperation runBeforeGroupFinished:](self, "runBeforeGroupFinished:", v7);
  id v10 = _NSConcreteStackBlock;
  uint64_t v11 = 3221225472LL;
  v12 = sub_100094710;
  v13 = &unk_100291A60;
  objc_copyWeak(&v16, &location);
  v8 = v7;
  objc_super v14 = v8;
  v15 = &stru_100294B48;
  id v9 = (void *)objc_claimAutoreleasedReturnValue( +[CKKSResultOperation named:withBlock:]( &OBJC_CLASS___CKKSResultOperation,  "named:withBlock:",  @"setting-recovery-tlks",  &v10));
  objc_msgSend(v9, "addDependency:", v8, v10, v11, v12, v13);
  -[CKKSGroupOperation runBeforeGroupFinished:](self, "runBeforeGroupFinished:", v9);

  objc_destroyWeak(&v16);
  objc_destroyWeak(&location);
}

- (void)proceedWithKeys:(id)a3 salt:(id)a4
{
  id v24 = a3;
  id v6 = a4;
  id location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  v7 = objc_alloc(&OBJC_CLASS___OTInheritanceKey);
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[OTRecreateInheritanceKeyOperation uuid](self, "uuid"));
  id v9 = (void *)objc_claimAutoreleasedReturnValue(-[OTRecreateInheritanceKeyOperation oldIK](self, "oldIK"));
  id v27 = 0LL;
  id v10 = -[OTInheritanceKey initWithUUID:oldIK:error:](v7, "initWithUUID:oldIK:error:", v8, v9, &v27);
  id v11 = v27;
  -[OTRecreateInheritanceKeyOperation setIk:](self, "setIk:", v10);

  v12 = (void *)objc_claimAutoreleasedReturnValue(-[OTRecreateInheritanceKeyOperation ik](self, "ik"));
  BOOL v13 = v12 == 0LL;

  if (v13)
  {
    v22 = sub_10001267C("SecError");
    v23 = (os_log_s *)objc_claimAutoreleasedReturnValue(v22);
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v30 = v11;
      _os_log_impl( (void *)&_mh_execute_header,  v23,  OS_LOG_TYPE_DEFAULT,  "octagon: failed to recreate inheritance key: %@",  buf,  0xCu);
    }

    -[CKKSResultOperation setError:](self, "setError:", v11);
    id v16 = (void *)objc_claimAutoreleasedReturnValue(-[OTRecreateInheritanceKeyOperation finishOp](self, "finishOp"));
    -[CKKSGroupOperation runBeforeGroupFinished:](self, "runBeforeGroupFinished:", v16);
  }

  else
  {
    objc_super v14 = (void *)objc_claimAutoreleasedReturnValue(-[OTRecreateInheritanceKeyOperation ik](self, "ik"));
    v15 = (void *)objc_claimAutoreleasedReturnValue([v14 recoveryKeyData]);
    id v16 = (void *)objc_claimAutoreleasedReturnValue([v15 base64EncodedStringWithOptions:0]);

    v17 = (void *)objc_claimAutoreleasedReturnValue(-[OTRecreateInheritanceKeyOperation deps](self, "deps"));
    v18 = (void *)objc_claimAutoreleasedReturnValue([v17 cuttlefishXPCWrapper]);
    v19 = (void *)objc_claimAutoreleasedReturnValue(-[OTRecreateInheritanceKeyOperation deps](self, "deps"));
    v20 = (void *)objc_claimAutoreleasedReturnValue([v19 activeAccount]);
    v21 = (void *)objc_claimAutoreleasedReturnValue(-[OTRecreateInheritanceKeyOperation uuid](self, "uuid"));
    v25[0] = _NSConcreteStackBlock;
    v25[1] = 3221225472LL;
    v25[2] = sub_1000944D8;
    v25[3] = &unk_100284948;
    objc_copyWeak(&v26, &location);
    [v18 createCustodianRecoveryKeyWithSpecificUser:v20 recoveryKey:v16 salt:v6 ckksKeys:v24 uuid:v21 kind:2 reply:v25];

    objc_destroyWeak(&v26);
  }

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

- (NSUUID)uuid
{
  return (NSUUID *)objc_getProperty(self, a2, 144LL, 1);
}

- (void)setUuid:(id)a3
{
}

- (OTInheritanceKey)oldIK
{
  return (OTInheritanceKey *)objc_getProperty(self, a2, 152LL, 1);
}

- (void)setOldIK:(id)a3
{
}

- (NSOperation)finishOp
{
  return (NSOperation *)objc_getProperty(self, a2, 160LL, 1);
}

- (void)setFinishOp:(id)a3
{
}

- (void).cxx_destruct
{
}

@end