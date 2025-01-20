@interface OTCreateCustodianRecoveryKeyOperation
- (NSOperation)finishOp;
- (NSUUID)uuid;
- (OTCreateCustodianRecoveryKeyOperation)initWithUUID:(id)a3 dependencies:(id)a4;
- (OTCustodianRecoveryKey)crk;
- (OTOperationDependencies)deps;
- (void)groupStart;
- (void)proceedWithKeys:(id)a3 salt:(id)a4;
- (void)setCrk:(id)a3;
- (void)setDeps:(id)a3;
- (void)setFinishOp:(id)a3;
- (void)setUuid:(id)a3;
@end

@implementation OTCreateCustodianRecoveryKeyOperation

- (OTCreateCustodianRecoveryKeyOperation)initWithUUID:(id)a3 dependencies:(id)a4
{
  v6 = (NSUUID *)a3;
  id v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)&OBJC_CLASS___OTCreateCustodianRecoveryKeyOperation;
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
  -[OTCreateCustodianRecoveryKeyOperation setFinishOp:](self, "setFinishOp:", v3);

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[OTCreateCustodianRecoveryKeyOperation finishOp](self, "finishOp"));
  -[CKKSGroupOperation dependOnBeforeGroupFinished:](self, "dependOnBeforeGroupFinished:", v4);

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[OTCreateCustodianRecoveryKeyOperation deps](self, "deps"));
  v6 = (void *)objc_claimAutoreleasedReturnValue([v5 activeAccount]);
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 altDSID]);

  if (v7)
  {
    id v8 = v7;
    *(void *)location = 0xAAAAAAAAAAAAAAAALL;
    objc_initWeak((id *)location, self);
    v9 = objc_alloc(&OBJC_CLASS___OTFetchCKKSKeysOperation);
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[OTCreateCustodianRecoveryKeyOperation deps](self, "deps"));
    objc_super v11 = -[OTFetchCKKSKeysOperation initWithDependencies:refetchNeeded:]( v9,  "initWithDependencies:refetchNeeded:",  v10,  0LL);

    -[CKKSGroupOperation runBeforeGroupFinished:](self, "runBeforeGroupFinished:", v11);
    v20[0] = _NSConcreteStackBlock;
    v20[1] = 3221225472LL;
    v20[2] = sub_100092E50;
    v20[3] = &unk_100291A60;
    objc_copyWeak(&v23, (id *)location);
    v12 = v11;
    v21 = v12;
    id v13 = v8;
    id v22 = v13;
    v14 = (void *)objc_claimAutoreleasedReturnValue( +[CKKSResultOperation named:withBlock:]( &OBJC_CLASS___CKKSResultOperation,  "named:withBlock:",  @"setting-recovery-tlks",  v20));
    [v14 addDependency:v12];
    -[CKKSGroupOperation runBeforeGroupFinished:](self, "runBeforeGroupFinished:", v14);

    objc_destroyWeak(&v23);
    objc_destroyWeak((id *)location);
  }

  else
  {
    v15 = sub_10001267C("authkit");
    v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(v15);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      v17 = (void *)objc_claimAutoreleasedReturnValue(-[OTCreateCustodianRecoveryKeyOperation deps](self, "deps"));
      v18 = (void *)objc_claimAutoreleasedReturnValue([v17 activeAccount]);
      *(_DWORD *)location = 138412290;
      *(void *)&location[4] = v18;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "No configured altDSID: %@", location, 0xCu);
    }

    v19 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:description:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:description:",  @"com.apple.security.octagon",  59LL,  @"No altDSID configured"));
    -[CKKSResultOperation setError:](self, "setError:", v19);

    id v13 = (id)objc_claimAutoreleasedReturnValue(-[OTCreateCustodianRecoveryKeyOperation finishOp](self, "finishOp"));
    -[CKKSGroupOperation runBeforeGroupFinished:](self, "runBeforeGroupFinished:", v13);
  }
}

- (void)proceedWithKeys:(id)a3 salt:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  v21 = 0LL;
  id v8 = (void *)SecPasswordGenerate(1LL, &v21, 0LL);
  if (v8)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[OTCreateCustodianRecoveryKeyOperation deps](self, "deps"));
    v10 = (void *)objc_claimAutoreleasedReturnValue([v9 cuttlefishXPCWrapper]);
    objc_super v11 = (void *)objc_claimAutoreleasedReturnValue(-[OTCreateCustodianRecoveryKeyOperation deps](self, "deps"));
    v12 = (void *)objc_claimAutoreleasedReturnValue([v11 activeAccount]);
    id v13 = (void *)objc_claimAutoreleasedReturnValue(-[OTCreateCustodianRecoveryKeyOperation uuid](self, "uuid"));
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472LL;
    v18[2] = sub_1000929F0;
    v18[3] = &unk_100284920;
    objc_copyWeak(&v20, &location);
    id v19 = v8;
    [v10 createCustodianRecoveryKeyWithSpecificUser:v12 recoveryKey:v19 salt:v7 ckksKeys:v6 uuid:v13 kind:1 reply:v18];

    objc_destroyWeak(&v20);
  }

  else
  {
    v14 = sub_10001267C("SecError");
    v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v24 = v21;
      _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_DEFAULT,  "octagon: failed to create string: %@",  buf,  0xCu);
    }

    v16 = v21;
    -[CKKSResultOperation setError:](self, "setError:", v21);

    v17 = (void *)objc_claimAutoreleasedReturnValue(-[OTCreateCustodianRecoveryKeyOperation finishOp](self, "finishOp"));
    -[CKKSGroupOperation runBeforeGroupFinished:](self, "runBeforeGroupFinished:", v17);
  }

  objc_destroyWeak(&location);
}

- (OTCustodianRecoveryKey)crk
{
  return (OTCustodianRecoveryKey *)objc_getProperty(self, a2, 128LL, 1);
}

- (void)setCrk:(id)a3
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