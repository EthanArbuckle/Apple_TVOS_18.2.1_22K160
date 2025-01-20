@interface OTVouchWithRecoveryKeyOperation
- (BOOL)saveVoucher;
- (NSData)voucher;
- (NSData)voucherSig;
- (NSOperation)finishOp;
- (NSString)recoveryKey;
- (NSString)salt;
- (OTOperationDependencies)deps;
- (OTVouchWithRecoveryKeyOperation)initWithDependencies:(id)a3 intendedState:(id)a4 errorState:(id)a5 recoveryKey:(id)a6 saveVoucher:(BOOL)a7;
- (OctagonStateString)intendedState;
- (OctagonStateString)nextState;
- (void)groupStart;
- (void)proceedWithFilteredTLKShares:(id)a3;
- (void)proceedWithRecoveryKeyID:(id)a3;
- (void)setDeps:(id)a3;
- (void)setFinishOp:(id)a3;
- (void)setNextState:(id)a3;
- (void)setRecoveryKey:(id)a3;
- (void)setSalt:(id)a3;
- (void)setVoucher:(id)a3;
- (void)setVoucherSig:(id)a3;
@end

@implementation OTVouchWithRecoveryKeyOperation

- (OTVouchWithRecoveryKeyOperation)initWithDependencies:(id)a3 intendedState:(id)a4 errorState:(id)a5 recoveryKey:(id)a6 saveVoucher:(BOOL)a7
{
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = a6;
  v20.receiver = self;
  v20.super_class = (Class)&OBJC_CLASS___OTVouchWithRecoveryKeyOperation;
  v17 = -[CKKSGroupOperation init](&v20, "init");
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)(v17 + 166), a3);
    objc_storeStrong((id *)(v18 + 134), a4);
    objc_storeStrong((id *)(v18 + 142), a5);
    objc_storeStrong((id *)(v18 + 182), a6);
    v18[128] = a7;
  }

  return (OTVouchWithRecoveryKeyOperation *)v18;
}

- (void)groupStart
{
  v3 = sub_10001267C("octagon");
  v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "creating voucher using a recovery key", buf, 2u);
  }

  v5 = objc_alloc_init(&OBJC_CLASS___NSOperation);
  -[OTVouchWithRecoveryKeyOperation setFinishOp:](self, "setFinishOp:", v5);

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[OTVouchWithRecoveryKeyOperation finishOp](self, "finishOp"));
  -[CKKSGroupOperation dependOnBeforeGroupFinished:](self, "dependOnBeforeGroupFinished:", v6);

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[OTVouchWithRecoveryKeyOperation deps](self, "deps"));
  v8 = (void *)objc_claimAutoreleasedReturnValue([v7 activeAccount]);
  v9 = (void *)objc_claimAutoreleasedReturnValue([v8 altDSID]);

  if (v9)
  {
    -[OTVouchWithRecoveryKeyOperation setSalt:](self, "setSalt:", v9);
    *(void *)buf = 0xAAAAAAAAAAAAAAAALL;
    objc_initWeak((id *)buf, self);
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[OTVouchWithRecoveryKeyOperation deps](self, "deps"));
    v11 = (void *)objc_claimAutoreleasedReturnValue([v10 cuttlefishXPCWrapper]);
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[OTVouchWithRecoveryKeyOperation deps](self, "deps"));
    id v13 = (void *)objc_claimAutoreleasedReturnValue([v12 activeAccount]);
    id v14 = (void *)objc_claimAutoreleasedReturnValue(-[OTVouchWithRecoveryKeyOperation recoveryKey](self, "recoveryKey"));
    id v15 = (void *)objc_claimAutoreleasedReturnValue(-[OTVouchWithRecoveryKeyOperation salt](self, "salt"));
    v22[0] = _NSConcreteStackBlock;
    v22[1] = 3221225472LL;
    v22[2] = sub_1000AB888;
    v22[3] = &unk_1002855C8;
    objc_copyWeak(&v23, (id *)buf);
    [v11 preflightVouchWithRecoveryKeyWithSpecificUser:v13 recoveryKey:v14 salt:v15 reply:v22];

    objc_destroyWeak(&v23);
    objc_destroyWeak((id *)buf);
  }

  else
  {
    id v16 = sub_10001267C("authkit");
    v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      v18 = (void *)objc_claimAutoreleasedReturnValue(-[OTVouchWithRecoveryKeyOperation deps](self, "deps"));
      v19 = (void *)objc_claimAutoreleasedReturnValue([v18 activeAccount]);
      *(_DWORD *)buf = 138412290;
      *(void *)&buf[4] = v19;
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "No configured altDSID: %@", buf, 0xCu);
    }

    objc_super v20 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:description:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:description:",  @"com.apple.security.octagon",  59LL,  @"No altDSID configured"));
    -[CKKSResultOperation setError:](self, "setError:", v20);

    v21 = (void *)objc_claimAutoreleasedReturnValue(-[OTVouchWithRecoveryKeyOperation finishOp](self, "finishOp"));
    -[CKKSGroupOperation runBeforeGroupFinished:](self, "runBeforeGroupFinished:", v21);
  }
}

- (void)proceedWithRecoveryKeyID:(id)a3
{
  id v4 = a3;
  id location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[OTVouchWithRecoveryKeyOperation deps](self, "deps"));
  v6 = (void *)objc_claimAutoreleasedReturnValue([v5 cuttlefishXPCWrapper]);
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[OTVouchWithRecoveryKeyOperation deps](self, "deps"));
  v8 = (void *)objc_claimAutoreleasedReturnValue([v7 activeAccount]);
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472LL;
  v9[2] = sub_1000AB610;
  v9[3] = &unk_10028FE18;
  objc_copyWeak(&v10, &location);
  [v6 fetchRecoverableTLKSharesWithSpecificUser:v8 peerID:v4 reply:v9];

  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);
}

- (void)proceedWithFilteredTLKShares:(id)a3
{
  id v4 = a3;
  id location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[OTVouchWithRecoveryKeyOperation deps](self, "deps"));
  v6 = (void *)objc_claimAutoreleasedReturnValue([v5 cuttlefishXPCWrapper]);
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[OTVouchWithRecoveryKeyOperation deps](self, "deps"));
  v8 = (void *)objc_claimAutoreleasedReturnValue([v7 activeAccount]);
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[OTVouchWithRecoveryKeyOperation recoveryKey](self, "recoveryKey"));
  id v10 = (void *)objc_claimAutoreleasedReturnValue(-[OTVouchWithRecoveryKeyOperation salt](self, "salt"));
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472LL;
  v12[2] = sub_1000AB1CC;
  v12[3] = &unk_100285618;
  objc_copyWeak(&v14, &location);
  id v11 = v4;
  id v13 = v11;
  [v6 vouchWithRecoveryKeyWithSpecificUser:v8 recoveryKey:v9 salt:v10 tlkShares:v11 reply:v12];

  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);
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

- (NSData)voucher
{
  return *(NSData **)((char *)&self->super._queue + 6);
}

- (void)setVoucher:(id)a3
{
}

- (NSData)voucherSig
{
  return *(NSData **)((char *)&self->super._internalSuccesses + 6);
}

- (void)setVoucherSig:(id)a3
{
}

- (BOOL)saveVoucher
{
  return (uint64_t)self->super._startOperation & 1;
}

- (OTOperationDependencies)deps
{
  return (OTOperationDependencies *)objc_getProperty(self, a2, 166LL, 1);
}

- (void)setDeps:(id)a3
{
}

- (NSString)salt
{
  return (NSString *)objc_getProperty(self, a2, 174LL, 1);
}

- (void)setSalt:(id)a3
{
}

- (NSString)recoveryKey
{
  return (NSString *)objc_getProperty(self, a2, 182LL, 1);
}

- (void)setRecoveryKey:(id)a3
{
}

- (NSOperation)finishOp
{
  return (NSOperation *)objc_getProperty(self, a2, 190LL, 1);
}

- (void)setFinishOp:(id)a3
{
}

- (void).cxx_destruct
{
}

@end