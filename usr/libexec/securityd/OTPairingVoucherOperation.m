@interface OTPairingVoucherOperation
- (NSData)permanentInfo;
- (NSData)permanentInfoSig;
- (NSData)stableInfo;
- (NSData)stableInfoSig;
- (NSData)voucher;
- (NSData)voucherSig;
- (NSOperation)finishedOp;
- (NSString)peerID;
- (OTDeviceInformation)deviceInfo;
- (OTOperationDependencies)operationDependencies;
- (OTPairingVoucherOperation)initWithDependencies:(id)a3 intendedState:(id)a4 errorState:(id)a5 deviceInfo:(id)a6 peerID:(id)a7 permanentInfo:(id)a8 permanentInfoSig:(id)a9 stableInfo:(id)a10 stableInfoSig:(id)a11;
- (OctagonStateString)intendedState;
- (OctagonStateString)nextState;
- (void)groupStart;
- (void)proceedWithKeys:(id)a3;
- (void)setDeviceInfo:(id)a3;
- (void)setFinishedOp:(id)a3;
- (void)setNextState:(id)a3;
- (void)setOperationDependencies:(id)a3;
- (void)setPeerID:(id)a3;
- (void)setPermanentInfo:(id)a3;
- (void)setPermanentInfoSig:(id)a3;
- (void)setStableInfo:(id)a3;
- (void)setStableInfoSig:(id)a3;
- (void)setVoucher:(id)a3;
- (void)setVoucherSig:(id)a3;
@end

@implementation OTPairingVoucherOperation

- (OTPairingVoucherOperation)initWithDependencies:(id)a3 intendedState:(id)a4 errorState:(id)a5 deviceInfo:(id)a6 peerID:(id)a7 permanentInfo:(id)a8 permanentInfoSig:(id)a9 stableInfo:(id)a10 stableInfoSig:(id)a11
{
  id v30 = a3;
  id v29 = a4;
  id v28 = a5;
  id obj = a6;
  id v27 = a6;
  id v26 = a7;
  id v25 = a8;
  id v24 = a9;
  id v23 = a10;
  id v18 = a11;
  v31.receiver = self;
  v31.super_class = (Class)&OBJC_CLASS___OTPairingVoucherOperation;
  v19 = -[CKKSGroupOperation init](&v31, "init");
  v20 = v19;
  if (v19)
  {
    objc_storeStrong((id *)&v19->super._startOperation, a4);
    objc_storeStrong((id *)&v20->super._finishOperation, a5);
    objc_storeStrong((id *)&v20->_stableInfoSig, a3);
    objc_storeStrong((id *)&v20->super._queue, a7);
    objc_storeStrong((id *)&v20->super._internalSuccesses, a8);
    objc_storeStrong((id *)&v20->_intendedState, a9);
    objc_storeStrong((id *)&v20->_nextState, a10);
    objc_storeStrong((id *)&v20->_peerID, a11);
    objc_storeStrong((id *)&v20->_permanentInfo, obj);
  }

  return v20;
}

- (void)groupStart
{
  v3 = sub_10001267C("octagon");
  v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "creating voucher", buf, 2u);
  }

  v5 = objc_alloc_init(&OBJC_CLASS___NSOperation);
  -[OTPairingVoucherOperation setFinishedOp:](self, "setFinishedOp:", v5);

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[OTPairingVoucherOperation finishedOp](self, "finishedOp"));
  -[CKKSGroupOperation dependOnBeforeGroupFinished:](self, "dependOnBeforeGroupFinished:", v6);

  *(void *)buf = 0xAAAAAAAAAAAAAAAALL;
  objc_initWeak((id *)buf, self);
  v7 = objc_alloc(&OBJC_CLASS___AAFAnalyticsEventSecurity);
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[OTPairingVoucherOperation operationDependencies](self, "operationDependencies"));
  v9 = (void *)objc_claimAutoreleasedReturnValue([v8 activeAccount]);
  v10 = (void *)objc_claimAutoreleasedReturnValue([v9 altDSID]);
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[OTPairingVoucherOperation operationDependencies](self, "operationDependencies"));
  v12 = (void *)objc_claimAutoreleasedReturnValue([v11 flowID]);
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[OTPairingVoucherOperation operationDependencies](self, "operationDependencies"));
  v14 = (void *)objc_claimAutoreleasedReturnValue([v13 deviceSessionID]);
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[OTPairingVoucherOperation operationDependencies](self, "operationDependencies"));
  LOBYTE(v23) = [v15 permittedToSendMetrics];
  v16 = -[AAFAnalyticsEventSecurity initWithKeychainCircleMetrics:altDSID:flowID:deviceSessionID:eventName:testsAreEnabled:canSendMetrics:category:]( v7,  "initWithKeychainCircleMetrics:altDSID:flowID:deviceSessionID:eventName:testsAreEnabled:canSendMetrics:category:",  0LL,  v10,  v12,  v14,  kSecurityRTCEventNameCKKSTlkFetch,  0LL,  v23,  kSecurityRTCEventCategoryAccountDataAccessRecovery);

  v17 = objc_alloc(&OBJC_CLASS___OTFetchCKKSKeysOperation);
  id v18 = (void *)objc_claimAutoreleasedReturnValue(-[OTPairingVoucherOperation operationDependencies](self, "operationDependencies"));
  v19 = -[OTFetchCKKSKeysOperation initWithDependencies:refetchNeeded:]( v17,  "initWithDependencies:refetchNeeded:",  v18,  0LL);

  -[CKKSGroupOperation runBeforeGroupFinished:](self, "runBeforeGroupFinished:", v19);
  v24[0] = _NSConcreteStackBlock;
  v24[1] = 3221225472LL;
  v24[2] = sub_10012790C;
  v24[3] = &unk_100291A60;
  objc_copyWeak(&v27, (id *)buf);
  v20 = v19;
  id v25 = v20;
  v21 = v16;
  id v26 = v21;
  v22 = (void *)objc_claimAutoreleasedReturnValue( +[CKKSResultOperation named:withBlock:]( &OBJC_CLASS___CKKSResultOperation,  "named:withBlock:",  @"vouch-with-keys",  v24));
  [v22 addDependency:v20];
  -[CKKSGroupOperation runBeforeGroupFinished:](self, "runBeforeGroupFinished:", v22);

  objc_destroyWeak(&v27);
  objc_destroyWeak((id *)buf);
}

- (void)proceedWithKeys:(id)a3
{
  id v23 = a3;
  id location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  v4 = sub_10001267C("octagon");
  v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    unsigned int v6 = [v23 count];
    *(_DWORD *)buf = 67109120;
    unsigned int v28 = v6;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "vouching with %d keysets", buf, 8u);
  }

  v22 = (void *)objc_claimAutoreleasedReturnValue(-[OTPairingVoucherOperation operationDependencies](self, "operationDependencies"));
  v20 = (void *)objc_claimAutoreleasedReturnValue([v22 cuttlefishXPCWrapper]);
  v21 = (void *)objc_claimAutoreleasedReturnValue(-[OTPairingVoucherOperation operationDependencies](self, "operationDependencies"));
  v19 = (void *)objc_claimAutoreleasedReturnValue([v21 activeAccount]);
  id v18 = (void *)objc_claimAutoreleasedReturnValue(-[OTPairingVoucherOperation peerID](self, "peerID"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(-[OTPairingVoucherOperation permanentInfo](self, "permanentInfo"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[OTPairingVoucherOperation permanentInfoSig](self, "permanentInfoSig"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[OTPairingVoucherOperation stableInfo](self, "stableInfo"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[OTPairingVoucherOperation stableInfoSig](self, "stableInfoSig"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[OTPairingVoucherOperation operationDependencies](self, "operationDependencies"));
  v10 = (void *)objc_claimAutoreleasedReturnValue([v9 flowID]);
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[OTPairingVoucherOperation operationDependencies](self, "operationDependencies"));
  v12 = (void *)objc_claimAutoreleasedReturnValue([v11 deviceSessionID]);
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[OTPairingVoucherOperation operationDependencies](self, "operationDependencies"));
  unsigned __int8 v14 = [v13 permittedToSendMetrics];
  v24[0] = _NSConcreteStackBlock;
  v24[1] = 3221225472LL;
  v24[2] = sub_1001277AC;
  v24[3] = &unk_100290048;
  objc_copyWeak(&v25, &location);
  LOBYTE(v15) = v14;
  [v20 vouchWithSpecificUser:v19 peerID:v18 permanentInfo:v17 permanentInfoSig:v16 stableInfo:v7 stableInfoSig:v8 ckksKeys:v23 flowID:v10 deviceSessionID :v12 canSendMetrics:v15 reply:v24];

  objc_destroyWeak(&v25);
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

- (NSString)peerID
{
  return (NSString *)self->super._queue;
}

- (void)setPeerID:(id)a3
{
}

- (NSData)permanentInfo
{
  return (NSData *)self->super._internalSuccesses;
}

- (void)setPermanentInfo:(id)a3
{
}

- (NSData)permanentInfoSig
{
  return (NSData *)self->_intendedState;
}

- (void)setPermanentInfoSig:(id)a3
{
}

- (NSData)stableInfo
{
  return (NSData *)self->_nextState;
}

- (void)setStableInfo:(id)a3
{
}

- (NSData)stableInfoSig
{
  return (NSData *)self->_peerID;
}

- (void)setStableInfoSig:(id)a3
{
}

- (OTDeviceInformation)deviceInfo
{
  return (OTDeviceInformation *)objc_getProperty(self, a2, 184LL, 1);
}

- (void)setDeviceInfo:(id)a3
{
}

- (NSData)voucher
{
  return self->_permanentInfoSig;
}

- (void)setVoucher:(id)a3
{
}

- (NSData)voucherSig
{
  return self->_stableInfo;
}

- (void)setVoucherSig:(id)a3
{
}

- (OTOperationDependencies)operationDependencies
{
  return (OTOperationDependencies *)objc_getProperty(self, a2, 208LL, 1);
}

- (void)setOperationDependencies:(id)a3
{
}

- (NSOperation)finishedOp
{
  return (NSOperation *)objc_getProperty(self, a2, 216LL, 1);
}

- (void)setFinishedOp:(id)a3
{
}

- (void).cxx_destruct
{
}

@end