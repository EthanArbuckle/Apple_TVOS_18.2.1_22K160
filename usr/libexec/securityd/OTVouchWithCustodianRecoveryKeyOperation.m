@interface OTVouchWithCustodianRecoveryKeyOperation
- (BOOL)saveVoucher;
- (NSData)voucher;
- (NSData)voucherSig;
- (NSOperation)finishOp;
- (NSString)salt;
- (OTCustodianRecoveryKey)crk;
- (OTOperationDependencies)deps;
- (OTVouchWithCustodianRecoveryKeyOperation)initWithDependencies:(id)a3 intendedState:(id)a4 errorState:(id)a5 custodianRecoveryKey:(id)a6 saveVoucher:(BOOL)a7;
- (OctagonStateString)intendedState;
- (OctagonStateString)nextState;
- (TrustedPeersHelperCustodianRecoveryKey)tphcrk;
- (void)groupStart;
- (void)proceedWithFilteredTLKShares:(id)a3;
- (void)proceedWithRecoveryKeyID:(id)a3;
- (void)setCrk:(id)a3;
- (void)setDeps:(id)a3;
- (void)setFinishOp:(id)a3;
- (void)setNextState:(id)a3;
- (void)setSalt:(id)a3;
- (void)setTphcrk:(id)a3;
- (void)setVoucher:(id)a3;
- (void)setVoucherSig:(id)a3;
@end

@implementation OTVouchWithCustodianRecoveryKeyOperation

- (OTVouchWithCustodianRecoveryKeyOperation)initWithDependencies:(id)a3 intendedState:(id)a4 errorState:(id)a5 custodianRecoveryKey:(id)a6 saveVoucher:(BOOL)a7
{
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = a6;
  v20.receiver = self;
  v20.super_class = (Class)&OBJC_CLASS___OTVouchWithCustodianRecoveryKeyOperation;
  v17 = -[CKKSGroupOperation init](&v20, "init");
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)(v17 + 166), a3);
    objc_storeStrong((id *)(v18 + 134), a4);
    objc_storeStrong((id *)(v18 + 142), a5);
    objc_storeStrong((id *)(v18 + 174), a6);
    v18[128] = a7;
  }

  return (OTVouchWithCustodianRecoveryKeyOperation *)v18;
}

- (void)groupStart
{
  v3 = sub_10001267C("octagon");
  v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "creating voucher using a custodian recovery key",  buf,  2u);
  }

  v5 = objc_alloc_init(&OBJC_CLASS___NSOperation);
  -[OTVouchWithCustodianRecoveryKeyOperation setFinishOp:](self, "setFinishOp:", v5);

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[OTVouchWithCustodianRecoveryKeyOperation finishOp](self, "finishOp"));
  -[CKKSGroupOperation dependOnBeforeGroupFinished:](self, "dependOnBeforeGroupFinished:", v6);

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[OTVouchWithCustodianRecoveryKeyOperation deps](self, "deps"));
  v8 = (void *)objc_claimAutoreleasedReturnValue([v7 activeAccount]);
  v9 = (void *)objc_claimAutoreleasedReturnValue([v8 altDSID]);

  if (v9)
  {
    -[OTVouchWithCustodianRecoveryKeyOperation setSalt:](self, "setSalt:", v9);
    v10 = objc_alloc(&OBJC_CLASS___TrustedPeersHelperCustodianRecoveryKey);
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[OTVouchWithCustodianRecoveryKeyOperation crk](self, "crk"));
    v12 = (void *)objc_claimAutoreleasedReturnValue([v11 uuid]);
    id v13 = (void *)objc_claimAutoreleasedReturnValue([v12 UUIDString]);
    id v14 = (void *)objc_claimAutoreleasedReturnValue(-[OTVouchWithCustodianRecoveryKeyOperation crk](self, "crk"));
    id v15 = (void *)objc_claimAutoreleasedReturnValue([v14 recoveryString]);
    id v16 = (void *)objc_claimAutoreleasedReturnValue(-[OTVouchWithCustodianRecoveryKeyOperation salt](self, "salt"));
    v17 = -[TrustedPeersHelperCustodianRecoveryKey initWithUUID:encryptionKey:signingKey:recoveryString:salt:kind:]( v10,  "initWithUUID:encryptionKey:signingKey:recoveryString:salt:kind:",  v13,  0LL,  0LL,  v15,  v16,  1LL);
    -[OTVouchWithCustodianRecoveryKeyOperation setTphcrk:](self, "setTphcrk:", v17);

    *(void *)buf = 0xAAAAAAAAAAAAAAAALL;
    objc_initWeak((id *)buf, self);
    v18 = (void *)objc_claimAutoreleasedReturnValue(-[OTVouchWithCustodianRecoveryKeyOperation deps](self, "deps"));
    v19 = (void *)objc_claimAutoreleasedReturnValue([v18 cuttlefishXPCWrapper]);
    objc_super v20 = (void *)objc_claimAutoreleasedReturnValue(-[OTVouchWithCustodianRecoveryKeyOperation deps](self, "deps"));
    v21 = (void *)objc_claimAutoreleasedReturnValue([v20 activeAccount]);
    v22 = (void *)objc_claimAutoreleasedReturnValue(-[OTVouchWithCustodianRecoveryKeyOperation tphcrk](self, "tphcrk"));
    v29[0] = _NSConcreteStackBlock;
    v29[1] = 3221225472LL;
    v29[2] = sub_1000CA8DC;
    v29[3] = &unk_1002855C8;
    objc_copyWeak(&v30, (id *)buf);
    [v19 preflightVouchWithCustodianRecoveryKeyWithSpecificUser:v21 crk:v22 reply:v29];

    objc_destroyWeak(&v30);
    objc_destroyWeak((id *)buf);
  }

  else
  {
    v23 = sub_10001267C("authkit");
    v24 = (os_log_s *)objc_claimAutoreleasedReturnValue(v23);
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
    {
      v25 = (void *)objc_claimAutoreleasedReturnValue(-[OTVouchWithCustodianRecoveryKeyOperation deps](self, "deps"));
      v26 = (void *)objc_claimAutoreleasedReturnValue([v25 activeAccount]);
      *(_DWORD *)buf = 138412290;
      *(void *)&buf[4] = v26;
      _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, "No configured altDSID: %@", buf, 0xCu);
    }

    v27 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:description:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:description:",  @"com.apple.security.octagon",  59LL,  @"No altDSID configured"));
    -[CKKSResultOperation setError:](self, "setError:", v27);

    v28 = (void *)objc_claimAutoreleasedReturnValue(-[OTVouchWithCustodianRecoveryKeyOperation finishOp](self, "finishOp"));
    -[CKKSGroupOperation runBeforeGroupFinished:](self, "runBeforeGroupFinished:", v28);
  }
}

- (void)proceedWithRecoveryKeyID:(id)a3
{
  id v4 = a3;
  id location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[OTVouchWithCustodianRecoveryKeyOperation deps](self, "deps"));
  v6 = (void *)objc_claimAutoreleasedReturnValue([v5 cuttlefishXPCWrapper]);
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[OTVouchWithCustodianRecoveryKeyOperation deps](self, "deps"));
  v8 = (void *)objc_claimAutoreleasedReturnValue([v7 activeAccount]);
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472LL;
  v9[2] = sub_1000CA664;
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
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[OTVouchWithCustodianRecoveryKeyOperation deps](self, "deps"));
  v6 = (void *)objc_claimAutoreleasedReturnValue([v5 cuttlefishXPCWrapper]);
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[OTVouchWithCustodianRecoveryKeyOperation deps](self, "deps"));
  v8 = (void *)objc_claimAutoreleasedReturnValue([v7 activeAccount]);
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[OTVouchWithCustodianRecoveryKeyOperation tphcrk](self, "tphcrk"));
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472LL;
  v11[2] = sub_1000CA220;
  v11[3] = &unk_100285618;
  objc_copyWeak(&v13, &location);
  id v10 = v4;
  id v12 = v10;
  [v6 vouchWithCustodianRecoveryKeyWithSpecificUser:v8 crk:v9 tlkShares:v10 reply:v11];

  objc_destroyWeak(&v13);
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

- (OTCustodianRecoveryKey)crk
{
  return (OTCustodianRecoveryKey *)objc_getProperty(self, a2, 174LL, 1);
}

- (void)setCrk:(id)a3
{
}

- (NSString)salt
{
  return (NSString *)objc_getProperty(self, a2, 182LL, 1);
}

- (void)setSalt:(id)a3
{
}

- (NSOperation)finishOp
{
  return (NSOperation *)objc_getProperty(self, a2, 190LL, 1);
}

- (void)setFinishOp:(id)a3
{
}

- (TrustedPeersHelperCustodianRecoveryKey)tphcrk
{
  return (TrustedPeersHelperCustodianRecoveryKey *)objc_getProperty(self, a2, 198LL, 1);
}

- (void)setTphcrk:(id)a3
{
}

- (void).cxx_destruct
{
}

@end