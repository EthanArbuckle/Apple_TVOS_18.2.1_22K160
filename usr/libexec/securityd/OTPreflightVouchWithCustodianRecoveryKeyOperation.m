@interface OTPreflightVouchWithCustodianRecoveryKeyOperation
- (NSOperation)finishOp;
- (NSString)salt;
- (OTOperationDependencies)deps;
- (OTPreflightVouchWithCustodianRecoveryKeyOperation)initWithDependencies:(id)a3 intendedState:(id)a4 errorState:(id)a5 tphcrk:(id)a6;
- (OctagonStateString)intendedState;
- (OctagonStateString)nextState;
- (TrustedPeersHelperCustodianRecoveryKey)tphcrk;
- (void)groupStart;
- (void)setDeps:(id)a3;
- (void)setFinishOp:(id)a3;
- (void)setNextState:(id)a3;
- (void)setSalt:(id)a3;
- (void)setTphcrk:(id)a3;
@end

@implementation OTPreflightVouchWithCustodianRecoveryKeyOperation

- (OTPreflightVouchWithCustodianRecoveryKeyOperation)initWithDependencies:(id)a3 intendedState:(id)a4 errorState:(id)a5 tphcrk:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v18.receiver = self;
  v18.super_class = (Class)&OBJC_CLASS___OTPreflightVouchWithCustodianRecoveryKeyOperation;
  v15 = -[CKKSGroupOperation init](&v18, "init");
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->super._queue, a3);
    objc_storeStrong((id *)&v16->super._startOperation, a4);
    objc_storeStrong((id *)&v16->super._finishOperation, a5);
    objc_storeStrong((id *)&v16->_nextState, a6);
  }

  return v16;
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
  -[OTPreflightVouchWithCustodianRecoveryKeyOperation setFinishOp:](self, "setFinishOp:", v5);

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[OTPreflightVouchWithCustodianRecoveryKeyOperation finishOp](self, "finishOp"));
  -[CKKSGroupOperation dependOnBeforeGroupFinished:](self, "dependOnBeforeGroupFinished:", v6);

  *(void *)buf = 0xAAAAAAAAAAAAAAAALL;
  objc_initWeak((id *)buf, self);
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[OTPreflightVouchWithCustodianRecoveryKeyOperation deps](self, "deps"));
  v8 = (void *)objc_claimAutoreleasedReturnValue([v7 cuttlefishXPCWrapper]);
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[OTPreflightVouchWithCustodianRecoveryKeyOperation deps](self, "deps"));
  v10 = (void *)objc_claimAutoreleasedReturnValue([v9 activeAccount]);
  id v11 = (void *)objc_claimAutoreleasedReturnValue(-[OTPreflightVouchWithCustodianRecoveryKeyOperation tphcrk](self, "tphcrk"));
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472LL;
  v12[2] = sub_1000C9738;
  v12[3] = &unk_1002855C8;
  objc_copyWeak(&v13, (id *)buf);
  [v8 preflightVouchWithCustodianRecoveryKeyWithSpecificUser:v10 crk:v11 reply:v12];

  objc_destroyWeak(&v13);
  objc_destroyWeak((id *)buf);
}

- (OctagonStateString)intendedState
{
  return (OctagonStateString *)objc_getProperty(self, a2, 128LL, 1);
}

- (OctagonStateString)nextState
{
  return (OctagonStateString *)objc_getProperty(self, a2, 136LL, 1);
}

- (void)setNextState:(id)a3
{
}

- (OTOperationDependencies)deps
{
  return (OTOperationDependencies *)objc_getProperty(self, a2, 144LL, 1);
}

- (void)setDeps:(id)a3
{
}

- (NSString)salt
{
  return (NSString *)objc_getProperty(self, a2, 152LL, 1);
}

- (void)setSalt:(id)a3
{
}

- (NSOperation)finishOp
{
  return (NSOperation *)objc_getProperty(self, a2, 160LL, 1);
}

- (void)setFinishOp:(id)a3
{
}

- (TrustedPeersHelperCustodianRecoveryKey)tphcrk
{
  return (TrustedPeersHelperCustodianRecoveryKey *)objc_getProperty(self, a2, 168LL, 1);
}

- (void)setTphcrk:(id)a3
{
}

- (void).cxx_destruct
{
}

@end