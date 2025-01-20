@interface OTJoinWithVoucherOperation
- (NSData)voucherData;
- (NSData)voucherSig;
- (NSOperation)finishedOp;
- (NSString)peerID;
- (OTJoinWithVoucherOperation)initWithDependencies:(id)a3 intendedState:(id)a4 ckksConflictState:(id)a5 errorState:(id)a6;
- (OTOperationDependencies)deps;
- (OctagonStateString)ckksConflictState;
- (OctagonStateString)intendedState;
- (OctagonStateString)nextState;
- (void)groupStart;
- (void)proceedWithPendingTLKShares:(id)a3;
- (void)setCkksConflictState:(id)a3;
- (void)setDeps:(id)a3;
- (void)setFinishedOp:(id)a3;
- (void)setNextState:(id)a3;
- (void)setPeerID:(id)a3;
- (void)setVoucherData:(id)a3;
- (void)setVoucherSig:(id)a3;
@end

@implementation OTJoinWithVoucherOperation

- (OTJoinWithVoucherOperation)initWithDependencies:(id)a3 intendedState:(id)a4 ckksConflictState:(id)a5 errorState:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v21.receiver = self;
  v21.super_class = (Class)&OBJC_CLASS___OTJoinWithVoucherOperation;
  v15 = -[CKKSGroupOperation init](&v21, "init");
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_nextState, a3);
    objc_storeStrong((id *)&v16->super._startOperation, a4);
    objc_storeStrong((id *)&v16->super._finishOperation, a6);
    objc_storeStrong((id *)&v16->_voucherData, a5);
    intendedState = v16->_intendedState;
    v16->_intendedState = 0LL;

    queue = v16->super._queue;
    v16->super._queue = 0LL;

    internalSuccesses = v16->super._internalSuccesses;
    v16->super._internalSuccesses = 0LL;
  }

  return v16;
}

- (void)groupStart
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[OTJoinWithVoucherOperation deps](self, "deps"));
  v4 = (void *)objc_claimAutoreleasedReturnValue([v3 stateHolder]);
  id v18 = 0LL;
  v5 = (void *)objc_claimAutoreleasedReturnValue([v4 loadOrCreateAccountMetadata:&v18]);
  id v6 = v18;

  uint64_t v7 = objc_claimAutoreleasedReturnValue([v5 voucher]);
  if (v7
    && (v8 = (void *)v7,
        v9 = (void *)objc_claimAutoreleasedReturnValue([v5 voucherSignature]),
        v9,
        v8,
        v9)
    && !v6)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue([v5 voucher]);
    -[OTJoinWithVoucherOperation setVoucherData:](self, "setVoucherData:", v10);

    id v11 = (void *)objc_claimAutoreleasedReturnValue([v5 voucherSignature]);
    -[OTJoinWithVoucherOperation setVoucherSig:](self, "setVoucherSig:", v11);

    id v12 = sub_10001267C("octagon");
    id v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      id v14 = (void *)objc_claimAutoreleasedReturnValue(-[OTJoinWithVoucherOperation voucherData](self, "voucherData"));
      *(_DWORD *)buf = 138412290;
      id v20 = v14;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "joining with a voucher: %@", buf, 0xCu);
    }

    v15 = (void *)objc_claimAutoreleasedReturnValue([v5 getTLKSharesPairedWithVoucher]);
    -[OTJoinWithVoucherOperation proceedWithPendingTLKShares:](self, "proceedWithPendingTLKShares:", v15);
  }

  else
  {
    v16 = sub_10001267C("octagon");
    v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v20 = v6;
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "No voucher available: %@", buf, 0xCu);
    }

    -[CKKSResultOperation setError:](self, "setError:", v6);
  }
}

- (void)proceedWithPendingTLKShares:(id)a3
{
  id v26 = a3;
  id location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[OTJoinWithVoucherOperation deps](self, "deps"));
  v5 = (void *)objc_claimAutoreleasedReturnValue([v4 sosAdapter]);
  unsigned int v6 = [v5 sosEnabled];

  if (v6)
  {
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(-[OTJoinWithVoucherOperation deps](self, "deps"));
    v8 = (void *)objc_claimAutoreleasedReturnValue([v7 sosAdapter]);
    id v32 = 0LL;
    v29 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[OTSOSAdapterHelpers peerPublicSigningKeySPKIsForCircle:error:]( &OBJC_CLASS___OTSOSAdapterHelpers,  "peerPublicSigningKeySPKIsForCircle:error:",  v8,  &v32));
    v9 = (os_log_s *)v32;

    v10 = sub_10001267C("octagon-sos");
    id v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
    BOOL v12 = os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT);
    if (v29)
    {
      if (v12)
      {
        *(_DWORD *)buf = 138412290;
        v35 = v29;
        id v13 = "SOS preapproved keys are %@";
LABEL_10:
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, v13, buf, 0xCu);
      }
    }

    else if (v12)
    {
      *(_DWORD *)buf = 138412290;
      v35 = v9;
      id v13 = "Unable to fetch SOS preapproved keys: %@";
      goto LABEL_10;
    }

    goto LABEL_12;
  }

  id v14 = sub_10001267C("octagon-sos");
  v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "SOS not enabled; no preapproved keys", buf, 2u);
  }

  v29 = 0LL;
LABEL_12:

  v28 = (void *)objc_claimAutoreleasedReturnValue(-[OTJoinWithVoucherOperation deps](self, "deps"));
  v25 = (void *)objc_claimAutoreleasedReturnValue([v28 cuttlefishXPCWrapper]);
  v27 = (void *)objc_claimAutoreleasedReturnValue(-[OTJoinWithVoucherOperation deps](self, "deps"));
  v24 = (void *)objc_claimAutoreleasedReturnValue([v27 activeAccount]);
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[OTJoinWithVoucherOperation voucherData](self, "voucherData"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[OTJoinWithVoucherOperation voucherSig](self, "voucherSig"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(-[OTJoinWithVoucherOperation deps](self, "deps"));
  id v18 = (void *)objc_claimAutoreleasedReturnValue([v17 flowID]);
  v19 = (void *)objc_claimAutoreleasedReturnValue(-[OTJoinWithVoucherOperation deps](self, "deps"));
  id v20 = (void *)objc_claimAutoreleasedReturnValue([v19 deviceSessionID]);
  objc_super v21 = (void *)objc_claimAutoreleasedReturnValue(-[OTJoinWithVoucherOperation deps](self, "deps"));
  unsigned __int8 v22 = [v21 permittedToSendMetrics];
  v30[0] = _NSConcreteStackBlock;
  v30[1] = 3221225472LL;
  v30[2] = sub_1000A15EC;
  v30[3] = &unk_1002864E8;
  objc_copyWeak(&v31, &location);
  LOBYTE(v23) = v22;
  [v25 joinWithSpecificUser:v24 voucherData:v15 voucherSig:v16 ckksKeys:&__NSArray0__struct tlkShares:v26 preapprovedKeys:v29 flowID:v18 deviceSessionID:v20 canSendMetrics:v23 reply:v30];

  objc_destroyWeak(&v31);
  objc_destroyWeak(&location);
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

- (NSData)voucherData
{
  return (NSData *)objc_getProperty(self, a2, 144LL, 1);
}

- (void)setVoucherData:(id)a3
{
}

- (NSData)voucherSig
{
  return (NSData *)objc_getProperty(self, a2, 152LL, 1);
}

- (void)setVoucherSig:(id)a3
{
}

- (NSString)peerID
{
  return (NSString *)objc_getProperty(self, a2, 160LL, 1);
}

- (void)setPeerID:(id)a3
{
}

- (OTOperationDependencies)deps
{
  return (OTOperationDependencies *)objc_getProperty(self, a2, 168LL, 1);
}

- (void)setDeps:(id)a3
{
}

- (OctagonStateString)ckksConflictState
{
  return (OctagonStateString *)objc_getProperty(self, a2, 176LL, 1);
}

- (void)setCkksConflictState:(id)a3
{
}

- (NSOperation)finishedOp
{
  return (NSOperation *)objc_getProperty(self, a2, 184LL, 1);
}

- (void)setFinishedOp:(id)a3
{
}

- (void).cxx_destruct
{
}

@end