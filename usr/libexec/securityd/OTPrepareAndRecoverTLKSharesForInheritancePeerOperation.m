@interface OTPrepareAndRecoverTLKSharesForInheritancePeerOperation
- (NSData)permanentInfo;
- (NSData)permanentInfoSig;
- (NSData)stableInfo;
- (NSData)stableInfoSig;
- (NSOperation)finishOp;
- (NSString)peerID;
- (NSString)salt;
- (OTDeviceInformation)deviceInfo;
- (OTInheritanceKey)ik;
- (OTOperationDependencies)deps;
- (OTPrepareAndRecoverTLKSharesForInheritancePeerOperation)initWithDependencies:(id)a3 intendedState:(id)a4 errorState:(id)a5 ik:(id)a6 deviceInfo:(id)a7 policyOverride:(id)a8 isInheritedAccount:(BOOL)a9 epoch:(unint64_t)a10;
- (OctagonStateString)intendedState;
- (OctagonStateString)nextState;
- (TPPolicyVersion)policyOverride;
- (TrustedPeersHelperCustodianRecoveryKey)tphcrk;
- (unint64_t)epoch;
- (void)groupStart;
- (void)proceedWithFilteredTLKShares:(id)a3;
- (void)setDeps:(id)a3;
- (void)setDeviceInfo:(id)a3;
- (void)setEpoch:(unint64_t)a3;
- (void)setFinishOp:(id)a3;
- (void)setIk:(id)a3;
- (void)setNextState:(id)a3;
- (void)setPeerID:(id)a3;
- (void)setPermanentInfo:(id)a3;
- (void)setPermanentInfoSig:(id)a3;
- (void)setPolicyOverride:(id)a3;
- (void)setSalt:(id)a3;
- (void)setStableInfo:(id)a3;
- (void)setStableInfoSig:(id)a3;
- (void)setTphcrk:(id)a3;
@end

@implementation OTPrepareAndRecoverTLKSharesForInheritancePeerOperation

- (OTPrepareAndRecoverTLKSharesForInheritancePeerOperation)initWithDependencies:(id)a3 intendedState:(id)a4 errorState:(id)a5 ik:(id)a6 deviceInfo:(id)a7 policyOverride:(id)a8 isInheritedAccount:(BOOL)a9 epoch:(unint64_t)a10
{
  id v17 = a3;
  id v18 = a4;
  id v19 = a5;
  id v25 = a6;
  id v24 = a7;
  id v23 = a8;
  v26.receiver = self;
  v26.super_class = (Class)&OBJC_CLASS___OTPrepareAndRecoverTLKSharesForInheritancePeerOperation;
  v20 = -[CKKSGroupOperation init](&v26, "init");
  v21 = v20;
  if (v20)
  {
    objc_storeStrong((id *)&v20->_permanentInfoSig, a3);
    objc_storeStrong((id *)&v21->super._startOperation, a4);
    objc_storeStrong((id *)&v21->super._finishOperation, a5);
    objc_storeStrong((id *)&v21->_stableInfo, a6);
    objc_storeStrong((id *)&v21->super._internalSuccesses, a7);
    v21->super._queue = (OS_dispatch_queue *)a10;
    objc_storeStrong((id *)&v21->super._startOperation, a4);
    objc_storeStrong((id *)&v21->super._finishOperation, a5);
    objc_storeStrong((id *)&v21->_permanentInfo, a8);
  }

  return v21;
}

- (void)groupStart
{
  v3 = sub_10001267C("octagon");
  v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "creating inheritance peer and recovering shares using an inheritance key",  buf,  2u);
  }

  v5 = objc_alloc_init(&OBJC_CLASS___NSOperation);
  -[OTPrepareAndRecoverTLKSharesForInheritancePeerOperation setFinishOp:](self, "setFinishOp:", v5);

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[OTPrepareAndRecoverTLKSharesForInheritancePeerOperation finishOp](self, "finishOp"));
  -[CKKSGroupOperation dependOnBeforeGroupFinished:](self, "dependOnBeforeGroupFinished:", v6);

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[OTPrepareAndRecoverTLKSharesForInheritancePeerOperation ik](self, "ik"));
  v8 = (void *)objc_claimAutoreleasedReturnValue([v7 recoveryKeyData]);
  v42 = (void *)objc_claimAutoreleasedReturnValue([v8 base64EncodedStringWithOptions:0]);

  -[OTPrepareAndRecoverTLKSharesForInheritancePeerOperation setSalt:](self, "setSalt:", &stru_100294B48);
  v9 = objc_alloc(&OBJC_CLASS___TrustedPeersHelperCustodianRecoveryKey);
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[OTPrepareAndRecoverTLKSharesForInheritancePeerOperation ik](self, "ik"));
  v11 = (void *)objc_claimAutoreleasedReturnValue([v10 uuid]);
  v12 = (void *)objc_claimAutoreleasedReturnValue([v11 UUIDString]);
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[OTPrepareAndRecoverTLKSharesForInheritancePeerOperation salt](self, "salt"));
  v14 = -[TrustedPeersHelperCustodianRecoveryKey initWithUUID:encryptionKey:signingKey:recoveryString:salt:kind:]( v9,  "initWithUUID:encryptionKey:signingKey:recoveryString:salt:kind:",  v12,  0LL,  0LL,  v42,  v13,  2LL);
  -[OTPrepareAndRecoverTLKSharesForInheritancePeerOperation setTphcrk:](self, "setTphcrk:", v14);

  *(void *)buf = 0LL;
  v49 = buf;
  uint64_t v50 = 0x3032000000LL;
  v51 = sub_1000CB96C;
  v52 = sub_1000CB97C;
  id v53 = 0LL;
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[OTPrepareAndRecoverTLKSharesForInheritancePeerOperation deps](self, "deps"));
  v16 = (void *)objc_claimAutoreleasedReturnValue([v15 stateHolder]);
  id v46 = 0LL;
  v47[0] = _NSConcreteStackBlock;
  v47[1] = 3221225472LL;
  v47[2] = sub_1000CB984;
  v47[3] = &unk_100285640;
  v47[4] = buf;
  unsigned __int8 v17 = [v16 persistAccountChanges:v47 error:&v46];
  id v43 = v46;

  if (v43) {
    unsigned __int8 v18 = 0;
  }
  else {
    unsigned __int8 v18 = v17;
  }
  if ((v18 & 1) == 0)
  {
    id v19 = sub_10001267C("SecError");
    v20 = (os_log_s *)objc_claimAutoreleasedReturnValue(v19);
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)v54 = 138412290;
      *(void *)&v54[4] = v43;
      _os_log_impl( (void *)&_mh_execute_header,  v20,  OS_LOG_TYPE_DEFAULT,  "octagon: failed to save 'se' state: %@",  v54,  0xCu);
    }
  }

  *(void *)v54 = 0xAAAAAAAAAAAAAAAALL;
  objc_initWeak((id *)v54, self);
  v41 = (void *)objc_claimAutoreleasedReturnValue(-[OTPrepareAndRecoverTLKSharesForInheritancePeerOperation deps](self, "deps"));
  v36 = (void *)objc_claimAutoreleasedReturnValue([v41 cuttlefishXPCWrapper]);
  v40 = (void *)objc_claimAutoreleasedReturnValue(-[OTPrepareAndRecoverTLKSharesForInheritancePeerOperation deps](self, "deps"));
  v35 = (void *)objc_claimAutoreleasedReturnValue([v40 activeAccount]);
  unint64_t v31 = -[OTPrepareAndRecoverTLKSharesForInheritancePeerOperation epoch](self, "epoch");
  v39 = (void *)objc_claimAutoreleasedReturnValue(-[OTPrepareAndRecoverTLKSharesForInheritancePeerOperation deviceInfo](self, "deviceInfo"));
  v34 = (void *)objc_claimAutoreleasedReturnValue([v39 machineID]);
  v38 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](&OBJC_CLASS___NSUUID, "UUID"));
  v33 = (void *)objc_claimAutoreleasedReturnValue([v38 UUIDString]);
  v37 = (void *)objc_claimAutoreleasedReturnValue(-[OTPrepareAndRecoverTLKSharesForInheritancePeerOperation deviceInfo](self, "deviceInfo"));
  v32 = (void *)objc_claimAutoreleasedReturnValue([v37 modelID]);
  v21 = (void *)objc_claimAutoreleasedReturnValue(-[OTPrepareAndRecoverTLKSharesForInheritancePeerOperation deviceInfo](self, "deviceInfo"));
  v22 = (void *)objc_claimAutoreleasedReturnValue([v21 deviceName]);
  id v23 = (void *)objc_claimAutoreleasedReturnValue(-[OTPrepareAndRecoverTLKSharesForInheritancePeerOperation deviceInfo](self, "deviceInfo"));
  id v24 = (void *)objc_claimAutoreleasedReturnValue([v23 serialNumber]);
  id v25 = (void *)objc_claimAutoreleasedReturnValue(-[OTPrepareAndRecoverTLKSharesForInheritancePeerOperation deviceInfo](self, "deviceInfo"));
  objc_super v26 = (void *)objc_claimAutoreleasedReturnValue([v25 osVersion]);
  v27 = (void *)objc_claimAutoreleasedReturnValue(-[OTPrepareAndRecoverTLKSharesForInheritancePeerOperation policyOverride](self, "policyOverride"));
  uint64_t v28 = *((void *)v49 + 5);
  v29 = (void *)objc_claimAutoreleasedReturnValue(-[OTPrepareAndRecoverTLKSharesForInheritancePeerOperation tphcrk](self, "tphcrk"));
  v44[0] = _NSConcreteStackBlock;
  v44[1] = 3221225472LL;
  v44[2] = sub_1000CB9C8;
  v44[3] = &unk_100285668;
  objc_copyWeak(&v45, (id *)v54);
  LODWORD(v30) = 0;
  [v36 prepareInheritancePeerWithSpecificUser:v35 epoch:v31 machineID:v34 bottleSalt:&stru_100294B48 bottleID:v33 modelID:v32 deviceName:v22 serialNumber:v24 osVersion :v26 policyVersion:v27 policySecrets:0 syncUserControllableViews:v30 secureElementIdentity:v28 signingPrivKeyPersistentRef:0 encPrivKeyP ersistentRef:0 crk:v29 reply:v44];

  objc_destroyWeak(&v45);
  objc_destroyWeak((id *)v54);

  _Block_object_dispose(buf, 8);
}

- (void)proceedWithFilteredTLKShares:(id)a3
{
  id v4 = a3;
  id location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[OTPrepareAndRecoverTLKSharesForInheritancePeerOperation deps](self, "deps"));
  v6 = (void *)objc_claimAutoreleasedReturnValue([v5 cuttlefishXPCWrapper]);
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[OTPrepareAndRecoverTLKSharesForInheritancePeerOperation deps](self, "deps"));
  v8 = (void *)objc_claimAutoreleasedReturnValue([v7 activeAccount]);
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[OTPrepareAndRecoverTLKSharesForInheritancePeerOperation tphcrk](self, "tphcrk"));
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472LL;
  v11[2] = sub_1000CB5FC;
  v11[3] = &unk_100285690;
  objc_copyWeak(&v13, &location);
  id v10 = v4;
  id v12 = v10;
  [v6 recoverTLKSharesForInheritorWithSpecificUser:v8 crk:v9 tlkShares:v10 reply:v11];

  objc_destroyWeak(&v13);
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

- (unint64_t)epoch
{
  return (unint64_t)self->super._queue;
}

- (void)setEpoch:(unint64_t)a3
{
  self->super._queue = (OS_dispatch_queue *)a3;
}

- (OTDeviceInformation)deviceInfo
{
  return (OTDeviceInformation *)objc_getProperty(self, a2, 152LL, 1);
}

- (void)setDeviceInfo:(id)a3
{
}

- (NSString)peerID
{
  return (NSString *)objc_getProperty(self, a2, 160LL, 1);
}

- (void)setPeerID:(id)a3
{
}

- (NSData)permanentInfo
{
  return (NSData *)objc_getProperty(self, a2, 168LL, 1);
}

- (void)setPermanentInfo:(id)a3
{
}

- (NSData)permanentInfoSig
{
  return (NSData *)objc_getProperty(self, a2, 176LL, 1);
}

- (void)setPermanentInfoSig:(id)a3
{
}

- (NSData)stableInfo
{
  return (NSData *)objc_getProperty(self, a2, 184LL, 1);
}

- (void)setStableInfo:(id)a3
{
}

- (NSData)stableInfoSig
{
  return (NSData *)objc_getProperty(self, a2, 192LL, 1);
}

- (void)setStableInfoSig:(id)a3
{
}

- (TPPolicyVersion)policyOverride
{
  return (TPPolicyVersion *)objc_getProperty(self, a2, 200LL, 1);
}

- (void)setPolicyOverride:(id)a3
{
}

- (OTOperationDependencies)deps
{
  return (OTOperationDependencies *)objc_getProperty(self, a2, 208LL, 1);
}

- (void)setDeps:(id)a3
{
}

- (OTInheritanceKey)ik
{
  return (OTInheritanceKey *)objc_getProperty(self, a2, 216LL, 1);
}

- (void)setIk:(id)a3
{
}

- (NSString)salt
{
  return (NSString *)objc_getProperty(self, a2, 224LL, 1);
}

- (void)setSalt:(id)a3
{
}

- (NSOperation)finishOp
{
  return (NSOperation *)objc_getProperty(self, a2, 232LL, 1);
}

- (void)setFinishOp:(id)a3
{
}

- (TrustedPeersHelperCustodianRecoveryKey)tphcrk
{
  return (TrustedPeersHelperCustodianRecoveryKey *)objc_getProperty(self, a2, 240LL, 1);
}

- (void)setTphcrk:(id)a3
{
}

- (void).cxx_destruct
{
}

@end