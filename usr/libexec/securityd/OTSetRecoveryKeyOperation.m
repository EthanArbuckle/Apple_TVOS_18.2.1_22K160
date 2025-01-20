@interface OTSetRecoveryKeyOperation
- (NSData)voucher;
- (NSData)voucherSig;
- (NSOperation)finishOp;
- (NSString)recoveryKey;
- (NSString)salt;
- (OTOperationDependencies)deps;
- (OTSetRecoveryKeyOperation)initWithDependencies:(id)a3 recoveryKey:(id)a4;
- (void)groupStart;
- (void)proceedWithKeys:(id)a3 salt:(id)a4;
- (void)setDeps:(id)a3;
- (void)setFinishOp:(id)a3;
- (void)setRecoveryKey:(id)a3;
- (void)setSalt:(id)a3;
- (void)setVoucher:(id)a3;
- (void)setVoucherSig:(id)a3;
@end

@implementation OTSetRecoveryKeyOperation

- (OTSetRecoveryKeyOperation)initWithDependencies:(id)a3 recoveryKey:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)&OBJC_CLASS___OTSetRecoveryKeyOperation;
  v9 = -[CKKSGroupOperation init](&v12, "init");
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_salt, a3);
    objc_storeStrong((id *)&v10->super._finishOperation, a4);
  }

  return v10;
}

- (void)groupStart
{
  v3 = objc_alloc_init(&OBJC_CLASS___NSOperation);
  -[OTSetRecoveryKeyOperation setFinishOp:](self, "setFinishOp:", v3);

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[OTSetRecoveryKeyOperation finishOp](self, "finishOp"));
  -[CKKSGroupOperation dependOnBeforeGroupFinished:](self, "dependOnBeforeGroupFinished:", v4);

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[OTSetRecoveryKeyOperation deps](self, "deps"));
  v6 = (void *)objc_claimAutoreleasedReturnValue([v5 activeAccount]);
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 altDSID]);

  if (v7)
  {
    id v8 = v7;
    *(void *)location = 0xAAAAAAAAAAAAAAAALL;
    objc_initWeak((id *)location, self);
    v9 = objc_alloc(&OBJC_CLASS___OTFetchCKKSKeysOperation);
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[OTSetRecoveryKeyOperation deps](self, "deps"));
    v11 = -[OTFetchCKKSKeysOperation initWithDependencies:refetchNeeded:]( v9,  "initWithDependencies:refetchNeeded:",  v10,  0LL);

    -[CKKSGroupOperation runBeforeGroupFinished:](self, "runBeforeGroupFinished:", v11);
    v20[0] = _NSConcreteStackBlock;
    v20[1] = 3221225472LL;
    v20[2] = sub_10009229C;
    v20[3] = &unk_100291A60;
    objc_copyWeak(&v23, (id *)location);
    objc_super v12 = v11;
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
      v17 = (void *)objc_claimAutoreleasedReturnValue(-[OTSetRecoveryKeyOperation deps](self, "deps"));
      v18 = (void *)objc_claimAutoreleasedReturnValue([v17 activeAccount]);
      *(_DWORD *)location = 138412290;
      *(void *)&location[4] = v18;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "No configured altDSID: %@", location, 0xCu);
    }

    v19 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:description:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:description:",  @"com.apple.security.octagon",  59LL,  @"No altDSID configured"));
    -[CKKSResultOperation setError:](self, "setError:", v19);

    id v13 = (id)objc_claimAutoreleasedReturnValue(-[OTSetRecoveryKeyOperation finishOp](self, "finishOp"));
    -[CKKSGroupOperation runBeforeGroupFinished:](self, "runBeforeGroupFinished:", v13);
  }
}

- (void)proceedWithKeys:(id)a3 salt:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[OTSetRecoveryKeyOperation deps](self, "deps"));
  v9 = (void *)objc_claimAutoreleasedReturnValue([v8 cuttlefishXPCWrapper]);
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[OTSetRecoveryKeyOperation deps](self, "deps"));
  v11 = (void *)objc_claimAutoreleasedReturnValue([v10 activeAccount]);
  objc_super v12 = (void *)objc_claimAutoreleasedReturnValue(-[OTSetRecoveryKeyOperation recoveryKey](self, "recoveryKey"));
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472LL;
  v13[2] = sub_100092064;
  v13[3] = &unk_10028FE18;
  objc_copyWeak(&v14, &location);
  [v9 setRecoveryKeyWithSpecificUser:v11 recoveryKey:v12 salt:v7 ckksKeys:v6 reply:v13];

  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);
}

- (NSString)salt
{
  return (NSString *)&self->super._startOperation->super.super.isa;
}

- (void)setSalt:(id)a3
{
}

- (NSString)recoveryKey
{
  return (NSString *)&self->super._finishOperation->super.super.isa;
}

- (void)setRecoveryKey:(id)a3
{
}

- (NSData)voucher
{
  return (NSData *)self->super._queue;
}

- (void)setVoucher:(id)a3
{
}

- (NSData)voucherSig
{
  return (NSData *)self->super._internalSuccesses;
}

- (void)setVoucherSig:(id)a3
{
}

- (OTOperationDependencies)deps
{
  return (OTOperationDependencies *)objc_getProperty(self, a2, 160LL, 1);
}

- (void)setDeps:(id)a3
{
}

- (NSOperation)finishOp
{
  return (NSOperation *)objc_getProperty(self, a2, 168LL, 1);
}

- (void)setFinishOp:(id)a3
{
}

- (void).cxx_destruct
{
}

@end