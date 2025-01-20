@interface OTVouchWithRerollOperation
- (BOOL)saveVoucher;
- (NSData)voucher;
- (NSData)voucherSig;
- (NSOperation)finishOp;
- (NSString)oldPeerID;
- (NSString)peerID;
- (OTOperationDependencies)deps;
- (OTVouchWithRerollOperation)initWithDependencies:(id)a3 intendedState:(id)a4 errorState:(id)a5 saveVoucher:(BOOL)a6;
- (OctagonStateString)intendedState;
- (OctagonStateString)nextState;
- (TPSyncingPolicy)syncingPolicy;
- (void)groupStart;
- (void)proceedWithFilteredTLKShares:(id)a3;
- (void)setDeps:(id)a3;
- (void)setFinishOp:(id)a3;
- (void)setNextState:(id)a3;
- (void)setOldPeerID:(id)a3;
- (void)setPeerID:(id)a3;
- (void)setSyncingPolicy:(id)a3;
- (void)setVoucher:(id)a3;
- (void)setVoucherSig:(id)a3;
@end

@implementation OTVouchWithRerollOperation

- (OTVouchWithRerollOperation)initWithDependencies:(id)a3 intendedState:(id)a4 errorState:(id)a5 saveVoucher:(BOOL)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  v17.receiver = self;
  v17.super_class = (Class)&OBJC_CLASS___OTVouchWithRerollOperation;
  v14 = -[CKKSGroupOperation init](&v17, "init");
  v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)(v14 + 166), a3);
    objc_storeStrong((id *)(v15 + 134), a4);
    objc_storeStrong((id *)(v15 + 142), a5);
    v15[128] = a6;
  }

  return (OTVouchWithRerollOperation *)v15;
}

- (void)groupStart
{
  v3 = sub_10001267C("octagon");
  v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "creating voucher for reroll", buf, 2u);
  }

  v5 = objc_alloc_init(&OBJC_CLASS___NSOperation);
  -[OTVouchWithRerollOperation setFinishOp:](self, "setFinishOp:", v5);

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[OTVouchWithRerollOperation finishOp](self, "finishOp"));
  -[CKKSGroupOperation dependOnBeforeGroupFinished:](self, "dependOnBeforeGroupFinished:", v6);

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[OTVouchWithRerollOperation deps](self, "deps"));
  v8 = (void *)objc_claimAutoreleasedReturnValue([v7 stateHolder]);
  id v24 = 0LL;
  v9 = (void *)objc_claimAutoreleasedReturnValue([v8 loadOrCreateAccountMetadata:&v24]);
  id v10 = v24;

  if (v10)
  {
    id v11 = sub_10001267C("SecError");
    id v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      *(void *)&buf[4] = v10;
      _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEFAULT,  "octagon: Error loading account metadata: %@",  buf,  0xCu);
    }

    -[CKKSResultOperation setError:](self, "setError:", v10);
    id v13 = (void *)objc_claimAutoreleasedReturnValue(-[OTVouchWithRerollOperation finishOp](self, "finishOp"));
    -[CKKSGroupOperation runBeforeGroupFinished:](self, "runBeforeGroupFinished:", v13);
  }

  else
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue([v9 peerID]);
    -[OTVouchWithRerollOperation setPeerID:](self, "setPeerID:", v14);

    v15 = (void *)objc_claimAutoreleasedReturnValue([v9 oldPeerID]);
    -[OTVouchWithRerollOperation setOldPeerID:](self, "setOldPeerID:", v15);

    v16 = (void *)objc_claimAutoreleasedReturnValue([v9 getTPSyncingPolicy]);
    -[OTVouchWithRerollOperation setSyncingPolicy:](self, "setSyncingPolicy:", v16);

    *(void *)buf = 0xAAAAAAAAAAAAAAAALL;
    objc_initWeak((id *)buf, self);
    objc_super v17 = (void *)objc_claimAutoreleasedReturnValue(-[OTVouchWithRerollOperation deps](self, "deps"));
    v18 = (void *)objc_claimAutoreleasedReturnValue([v17 cuttlefishXPCWrapper]);
    v19 = (void *)objc_claimAutoreleasedReturnValue(-[OTVouchWithRerollOperation deps](self, "deps"));
    v20 = (void *)objc_claimAutoreleasedReturnValue([v19 activeAccount]);
    v21 = (void *)objc_claimAutoreleasedReturnValue(-[OTVouchWithRerollOperation peerID](self, "peerID"));
    v22[0] = _NSConcreteStackBlock;
    v22[1] = 3221225472LL;
    v22[2] = sub_1000AC5F8;
    v22[3] = &unk_10028FE18;
    objc_copyWeak(&v23, (id *)buf);
    [v18 fetchRecoverableTLKSharesWithSpecificUser:v20 peerID:v21 reply:v22];

    objc_destroyWeak(&v23);
    objc_destroyWeak((id *)buf);
  }
}

- (void)proceedWithFilteredTLKShares:(id)a3
{
  id v4 = a3;
  id location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[OTVouchWithRerollOperation deps](self, "deps"));
  v6 = (void *)objc_claimAutoreleasedReturnValue([v5 cuttlefishXPCWrapper]);
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[OTVouchWithRerollOperation deps](self, "deps"));
  v8 = (void *)objc_claimAutoreleasedReturnValue([v7 activeAccount]);
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[OTVouchWithRerollOperation oldPeerID](self, "oldPeerID"));
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472LL;
  v11[2] = sub_1000AC1B4;
  v11[3] = &unk_100285618;
  objc_copyWeak(&v13, &location);
  id v10 = v4;
  id v12 = v10;
  [v6 vouchWithRerollWithSpecificUser:v8 oldPeerID:v9 tlkShares:v10 reply:v11];

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

- (NSOperation)finishOp
{
  return (NSOperation *)objc_getProperty(self, a2, 174LL, 1);
}

- (void)setFinishOp:(id)a3
{
}

- (NSString)peerID
{
  return (NSString *)objc_getProperty(self, a2, 182LL, 1);
}

- (void)setPeerID:(id)a3
{
}

- (NSString)oldPeerID
{
  return (NSString *)objc_getProperty(self, a2, 190LL, 1);
}

- (void)setOldPeerID:(id)a3
{
}

- (TPSyncingPolicy)syncingPolicy
{
  return (TPSyncingPolicy *)objc_getProperty(self, a2, 198LL, 1);
}

- (void)setSyncingPolicy:(id)a3
{
}

- (void).cxx_destruct
{
}

@end