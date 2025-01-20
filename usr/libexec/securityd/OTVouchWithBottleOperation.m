@interface OTVouchWithBottleOperation
- (BOOL)saveVoucher;
- (NSData)entropy;
- (NSData)voucher;
- (NSData)voucherSig;
- (NSOperation)finishedOp;
- (NSString)bottleID;
- (NSString)bottleSalt;
- (OTOperationDependencies)deps;
- (OTVouchWithBottleOperation)initWithDependencies:(id)a3 intendedState:(id)a4 errorState:(id)a5 bottleID:(id)a6 entropy:(id)a7 bottleSalt:(id)a8 saveVoucher:(BOOL)a9;
- (OctagonStateString)intendedState;
- (OctagonStateString)nextState;
- (void)groupStart;
- (void)proceedWithFilteredTLKShares:(id)a3;
- (void)proceedWithPeerID:(id)a3 refetchWasNeeded:(BOOL)a4;
- (void)setBottleID:(id)a3;
- (void)setBottleSalt:(id)a3;
- (void)setDeps:(id)a3;
- (void)setEntropy:(id)a3;
- (void)setFinishedOp:(id)a3;
- (void)setNextState:(id)a3;
- (void)setVoucher:(id)a3;
- (void)setVoucherSig:(id)a3;
@end

@implementation OTVouchWithBottleOperation

- (OTVouchWithBottleOperation)initWithDependencies:(id)a3 intendedState:(id)a4 errorState:(id)a5 bottleID:(id)a6 entropy:(id)a7 bottleSalt:(id)a8 saveVoucher:(BOOL)a9
{
  id v16 = a3;
  id v24 = a4;
  id v23 = a5;
  id v22 = a6;
  id v17 = a7;
  id v18 = a8;
  v25.receiver = self;
  v25.super_class = (Class)&OBJC_CLASS___OTVouchWithBottleOperation;
  v19 = -[CKKSGroupOperation init](&v25, "init");
  v20 = v19;
  if (v19)
  {
    objc_storeStrong((id *)(v19 + 190), a3);
    objc_storeStrong((id *)(v20 + 134), a4);
    objc_storeStrong((id *)(v20 + 142), a5);
    objc_storeStrong((id *)(v20 + 150), a6);
    objc_storeStrong((id *)(v20 + 158), a7);
    objc_storeStrong((id *)(v20 + 166), a8);
    v20[128] = a9;
  }

  return (OTVouchWithBottleOperation *)v20;
}

- (void)groupStart
{
  v3 = sub_10001267C("octagon");
  v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[OTVouchWithBottleOperation bottleID](self, "bottleID"));
    *(_DWORD *)buf = 138412290;
    *(void *)&buf[4] = v5;
    _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "creating voucher using a bottle with escrow record id: %@",  buf,  0xCu);
  }

  v6 = objc_alloc_init(&OBJC_CLASS___NSOperation);
  -[OTVouchWithBottleOperation setFinishedOp:](self, "setFinishedOp:", v6);

  uint64_t v7 = objc_claimAutoreleasedReturnValue(-[OTVouchWithBottleOperation finishedOp](self, "finishedOp"));
  -[CKKSGroupOperation dependOnBeforeGroupFinished:](self, "dependOnBeforeGroupFinished:", v7);

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[OTVouchWithBottleOperation bottleSalt](self, "bottleSalt"));
  LOBYTE(v7) = v8 == 0LL;

  if ((v7 & 1) == 0)
  {
    v9 = sub_10001267C("octagon");
    v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      v11 = (void *)objc_claimAutoreleasedReturnValue(-[OTVouchWithBottleOperation bottleSalt](self, "bottleSalt"));
      *(_DWORD *)buf = 138412290;
      *(void *)&buf[4] = v11;
      _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "using passed in altdsid, altdsid is: %@",  buf,  0xCu);
    }

    goto LABEL_8;
  }

  v12 = (void *)objc_claimAutoreleasedReturnValue(-[OTVouchWithBottleOperation deps](self, "deps"));
  v13 = (void *)objc_claimAutoreleasedReturnValue([v12 activeAccount]);
  v10 = (os_log_s *)objc_claimAutoreleasedReturnValue([v13 altDSID]);

  if (v10)
  {
    -[OTVouchWithBottleOperation setBottleSalt:](self, "setBottleSalt:", v10);
LABEL_8:

    *(void *)buf = 0xAAAAAAAAAAAAAAAALL;
    objc_initWeak((id *)buf, self);
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[OTVouchWithBottleOperation deps](self, "deps"));
    v15 = (void *)objc_claimAutoreleasedReturnValue([v14 cuttlefishXPCWrapper]);
    id v16 = (void *)objc_claimAutoreleasedReturnValue(-[OTVouchWithBottleOperation deps](self, "deps"));
    id v17 = (void *)objc_claimAutoreleasedReturnValue([v16 activeAccount]);
    id v18 = (void *)objc_claimAutoreleasedReturnValue(-[OTVouchWithBottleOperation bottleID](self, "bottleID"));
    v25[0] = _NSConcreteStackBlock;
    v25[1] = 3221225472LL;
    v25[2] = sub_10006C120;
    v25[3] = &unk_1002843C8;
    objc_copyWeak(&v26, (id *)buf);
    [v15 preflightVouchWithBottleWithSpecificUser:v17 bottleID:v18 reply:v25];

    objc_destroyWeak(&v26);
    objc_destroyWeak((id *)buf);
    return;
  }

  v19 = sub_10001267C("authkit");
  v20 = (os_log_s *)objc_claimAutoreleasedReturnValue(v19);
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
  {
    v21 = (void *)objc_claimAutoreleasedReturnValue(-[OTVouchWithBottleOperation deps](self, "deps"));
    id v22 = (void *)objc_claimAutoreleasedReturnValue([v21 activeAccount]);
    *(_DWORD *)buf = 138412290;
    *(void *)&buf[4] = v22;
    _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "No configured altDSID: %@", buf, 0xCu);
  }

  id v23 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:description:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:description:",  @"com.apple.security.octagon",  59LL,  @"No altDSID configured"));
  -[CKKSResultOperation setError:](self, "setError:", v23);

  id v24 = (void *)objc_claimAutoreleasedReturnValue(-[OTVouchWithBottleOperation finishedOp](self, "finishedOp"));
  -[CKKSGroupOperation runBeforeGroupFinished:](self, "runBeforeGroupFinished:", v24);
}

- (void)proceedWithPeerID:(id)a3 refetchWasNeeded:(BOOL)a4
{
  id v5 = a3;
  id location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[OTVouchWithBottleOperation deps](self, "deps"));
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([v6 cuttlefishXPCWrapper]);
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[OTVouchWithBottleOperation deps](self, "deps"));
  v9 = (void *)objc_claimAutoreleasedReturnValue([v8 activeAccount]);
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472LL;
  v10[2] = sub_10006BEA8;
  v10[3] = &unk_10028FE18;
  objc_copyWeak(&v11, &location);
  [v7 fetchRecoverableTLKSharesWithSpecificUser:v9 peerID:v5 reply:v10];

  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);
}

- (void)proceedWithFilteredTLKShares:(id)a3
{
  id v4 = a3;
  id location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[OTVouchWithBottleOperation deps](self, "deps"));
  v6 = (void *)objc_claimAutoreleasedReturnValue([v5 cuttlefishXPCWrapper]);
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(-[OTVouchWithBottleOperation deps](self, "deps"));
  v8 = (void *)objc_claimAutoreleasedReturnValue([v7 activeAccount]);
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[OTVouchWithBottleOperation bottleID](self, "bottleID"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[OTVouchWithBottleOperation entropy](self, "entropy"));
  id v11 = (void *)objc_claimAutoreleasedReturnValue(-[OTVouchWithBottleOperation bottleSalt](self, "bottleSalt"));
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472LL;
  v13[2] = sub_10006BA64;
  v13[3] = &unk_100285618;
  objc_copyWeak(&v15, &location);
  id v12 = v4;
  id v14 = v12;
  [v6 vouchWithBottleWithSpecificUser:v8 bottleID:v9 entropy:v10 bottleSalt:v11 tlkShares:v12 reply:v13];

  objc_destroyWeak(&v15);
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

- (NSString)bottleID
{
  return *(NSString **)((char *)&self->super._queue + 6);
}

- (void)setBottleID:(id)a3
{
}

- (NSData)entropy
{
  return *(NSData **)((char *)&self->super._internalSuccesses + 6);
}

- (void)setEntropy:(id)a3
{
}

- (NSString)bottleSalt
{
  return *(NSString **)(&self->_saveVoucher + 6);
}

- (void)setBottleSalt:(id)a3
{
}

- (NSData)voucher
{
  return *(NSData **)((char *)&self->_intendedState + 6);
}

- (void)setVoucher:(id)a3
{
}

- (NSData)voucherSig
{
  return *(NSData **)((char *)&self->_nextState + 6);
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
  return (OTOperationDependencies *)objc_getProperty(self, a2, 190LL, 1);
}

- (void)setDeps:(id)a3
{
}

- (NSOperation)finishedOp
{
  return (NSOperation *)objc_getProperty(self, a2, 198LL, 1);
}

- (void)setFinishedOp:(id)a3
{
}

- (void).cxx_destruct
{
}

@end