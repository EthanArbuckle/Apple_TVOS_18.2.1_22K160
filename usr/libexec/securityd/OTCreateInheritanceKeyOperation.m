@interface OTCreateInheritanceKeyOperation
- (NSOperation)finishOp;
- (NSUUID)uuid;
- (OTCreateInheritanceKeyOperation)initWithUUID:(id)a3 dependencies:(id)a4;
- (OTInheritanceKey)ik;
- (OTOperationDependencies)deps;
- (void)groupStart;
- (void)proceedWithKeys:(id)a3 salt:(id)a4;
- (void)setDeps:(id)a3;
- (void)setFinishOp:(id)a3;
- (void)setIk:(id)a3;
- (void)setUuid:(id)a3;
@end

@implementation OTCreateInheritanceKeyOperation

- (OTCreateInheritanceKeyOperation)initWithUUID:(id)a3 dependencies:(id)a4
{
  v6 = (NSUUID *)a3;
  id v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)&OBJC_CLASS___OTCreateInheritanceKeyOperation;
  v8 = -[CKKSGroupOperation init](&v11, "init");
  if (v8)
  {
    v9 = v6;
    if (!v6) {
      v9 = objc_alloc_init(&OBJC_CLASS___NSUUID);
    }
    objc_storeStrong((id *)&v8->super._queue, v9);
    if (!v6) {

    }
    objc_storeStrong((id *)&v8->super._finishOperation, a4);
  }

  return v8;
}

- (void)groupStart
{
  v3 = objc_alloc_init(&OBJC_CLASS___NSOperation);
  -[OTCreateInheritanceKeyOperation setFinishOp:](self, "setFinishOp:", v3);

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[OTCreateInheritanceKeyOperation finishOp](self, "finishOp"));
  -[CKKSGroupOperation dependOnBeforeGroupFinished:](self, "dependOnBeforeGroupFinished:", v4);

  id location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  v5 = objc_alloc(&OBJC_CLASS___OTFetchCKKSKeysOperation);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[OTCreateInheritanceKeyOperation deps](self, "deps"));
  id v7 = -[OTFetchCKKSKeysOperation initWithDependencies:refetchNeeded:]( v5,  "initWithDependencies:refetchNeeded:",  v6,  0LL);

  -[CKKSGroupOperation runBeforeGroupFinished:](self, "runBeforeGroupFinished:", v7);
  v10 = _NSConcreteStackBlock;
  uint64_t v11 = 3221225472LL;
  v12 = sub_1000936F0;
  v13 = &unk_100291A60;
  objc_copyWeak(&v16, &location);
  v8 = v7;
  v14 = v8;
  v15 = &stru_100294B48;
  v9 = (void *)objc_claimAutoreleasedReturnValue( +[CKKSResultOperation named:withBlock:]( &OBJC_CLASS___CKKSResultOperation,  "named:withBlock:",  @"setting-recovery-tlks",  &v10));
  objc_msgSend(v9, "addDependency:", v8, v10, v11, v12, v13);
  -[CKKSGroupOperation runBeforeGroupFinished:](self, "runBeforeGroupFinished:", v9);

  objc_destroyWeak(&v16);
  objc_destroyWeak(&location);
}

- (void)proceedWithKeys:(id)a3 salt:(id)a4
{
  id v23 = a3;
  id v6 = a4;
  id location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  id v7 = objc_alloc(&OBJC_CLASS___OTInheritanceKey);
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[OTCreateInheritanceKeyOperation uuid](self, "uuid"));
  id v26 = 0LL;
  v9 = -[OTInheritanceKey initWithUUID:error:](v7, "initWithUUID:error:", v8, &v26);
  id v10 = v26;
  -[OTCreateInheritanceKeyOperation setIk:](self, "setIk:", v9);

  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(-[OTCreateInheritanceKeyOperation ik](self, "ik"));
  BOOL v12 = v11 == 0LL;

  if (v12)
  {
    v21 = sub_10001267C("SecError");
    v22 = (os_log_s *)objc_claimAutoreleasedReturnValue(v21);
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v29 = v10;
      _os_log_impl( (void *)&_mh_execute_header,  v22,  OS_LOG_TYPE_DEFAULT,  "octagon: failed to create inheritance key: %@",  buf,  0xCu);
    }

    -[CKKSResultOperation setError:](self, "setError:", v10);
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[OTCreateInheritanceKeyOperation finishOp](self, "finishOp"));
    -[CKKSGroupOperation runBeforeGroupFinished:](self, "runBeforeGroupFinished:", v15);
  }

  else
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[OTCreateInheritanceKeyOperation ik](self, "ik"));
    v14 = (void *)objc_claimAutoreleasedReturnValue([v13 recoveryKeyData]);
    v15 = (void *)objc_claimAutoreleasedReturnValue([v14 base64EncodedStringWithOptions:0]);

    id v16 = (void *)objc_claimAutoreleasedReturnValue(-[OTCreateInheritanceKeyOperation deps](self, "deps"));
    v17 = (void *)objc_claimAutoreleasedReturnValue([v16 cuttlefishXPCWrapper]);
    v18 = (void *)objc_claimAutoreleasedReturnValue(-[OTCreateInheritanceKeyOperation deps](self, "deps"));
    v19 = (void *)objc_claimAutoreleasedReturnValue([v18 activeAccount]);
    v20 = (void *)objc_claimAutoreleasedReturnValue(-[OTCreateInheritanceKeyOperation uuid](self, "uuid"));
    v24[0] = _NSConcreteStackBlock;
    v24[1] = 3221225472LL;
    v24[2] = sub_1000934B8;
    v24[3] = &unk_100284948;
    objc_copyWeak(&v25, &location);
    [v17 createCustodianRecoveryKeyWithSpecificUser:v19 recoveryKey:v15 salt:v6 ckksKeys:v23 uuid:v20 kind:2 reply:v24];

    objc_destroyWeak(&v25);
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