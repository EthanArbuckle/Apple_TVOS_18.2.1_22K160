@interface OTPrepareOperation
- (NSData)permanentInfo;
- (NSData)permanentInfoSig;
- (NSData)stableInfo;
- (NSData)stableInfoSig;
- (NSOperation)finishedOp;
- (NSString)peerID;
- (OTAccountSettings)accountSettings;
- (OTDeviceInformation)deviceInfo;
- (OTOperationDependencies)deps;
- (OTPrepareOperation)initWithDependencies:(id)a3 intendedState:(id)a4 errorState:(id)a5 deviceInfo:(id)a6 policyOverride:(id)a7 accountSettings:(id)a8 epoch:(unint64_t)a9;
- (OctagonStateString)intendedState;
- (OctagonStateString)nextState;
- (TPPolicyVersion)policyOverride;
- (unint64_t)epoch;
- (void)groupStart;
- (void)setAccountSettings:(id)a3;
- (void)setDeps:(id)a3;
- (void)setDeviceInfo:(id)a3;
- (void)setEpoch:(unint64_t)a3;
- (void)setFinishedOp:(id)a3;
- (void)setNextState:(id)a3;
- (void)setPeerID:(id)a3;
- (void)setPermanentInfo:(id)a3;
- (void)setPermanentInfoSig:(id)a3;
- (void)setPolicyOverride:(id)a3;
- (void)setStableInfo:(id)a3;
- (void)setStableInfoSig:(id)a3;
@end

@implementation OTPrepareOperation

- (OTPrepareOperation)initWithDependencies:(id)a3 intendedState:(id)a4 errorState:(id)a5 deviceInfo:(id)a6 policyOverride:(id)a7 accountSettings:(id)a8 epoch:(unint64_t)a9
{
  id v16 = a3;
  id v17 = a4;
  id v24 = a5;
  id v23 = a6;
  id v22 = a7;
  id v18 = a8;
  v25.receiver = self;
  v25.super_class = (Class)&OBJC_CLASS___OTPrepareOperation;
  v19 = -[CKKSGroupOperation init](&v25, "init");
  v20 = v19;
  if (v19)
  {
    objc_storeStrong((id *)&v19->_stableInfo, a3);
    objc_storeStrong((id *)&v20->super._internalSuccesses, a6);
    v20->super._queue = (OS_dispatch_queue *)a9;
    objc_storeStrong((id *)&v20->super._startOperation, a4);
    objc_storeStrong((id *)&v20->super._finishOperation, a5);
    objc_storeStrong((id *)&v20->_permanentInfo, a7);
    objc_storeStrong((id *)&v20->_permanentInfoSig, a8);
  }

  return v20;
}

- (void)groupStart
{
  v3 = sub_10001267C("octagon");
  v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(buf) = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "preparing an identity", (uint8_t *)&buf, 2u);
  }

  v5 = objc_alloc(&OBJC_CLASS___AAFAnalyticsEventSecurity);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[OTPrepareOperation deps](self, "deps"));
  v7 = (void *)objc_claimAutoreleasedReturnValue([v6 activeAccount]);
  v8 = (void *)objc_claimAutoreleasedReturnValue([v7 altDSID]);
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[OTPrepareOperation deps](self, "deps"));
  v10 = (void *)objc_claimAutoreleasedReturnValue([v9 flowID]);
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[OTPrepareOperation deps](self, "deps"));
  v12 = (void *)objc_claimAutoreleasedReturnValue([v11 deviceSessionID]);
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[OTPrepareOperation deps](self, "deps"));
  LOBYTE(v63) = [v13 permittedToSendMetrics];
  v80 = -[AAFAnalyticsEventSecurity initWithKeychainCircleMetrics:altDSID:flowID:deviceSessionID:eventName:testsAreEnabled:canSendMetrics:category:]( v5,  "initWithKeychainCircleMetrics:altDSID:flowID:deviceSessionID:eventName:testsAreEnabled:canSendMetrics:category:",  0LL,  v8,  v10,  v12,  kSecurityRTCEventNamePrepareIdentityInTPH,  0LL,  v63,  kSecurityRTCEventCategoryAccountDataAccessRecovery);

  v14 = objc_alloc_init(&OBJC_CLASS___NSOperation);
  -[OTPrepareOperation setFinishedOp:](self, "setFinishedOp:", v14);

  v15 = (void *)objc_claimAutoreleasedReturnValue(-[OTPrepareOperation finishedOp](self, "finishedOp"));
  -[CKKSGroupOperation dependOnBeforeGroupFinished:](self, "dependOnBeforeGroupFinished:", v15);

  id v16 = (void *)objc_claimAutoreleasedReturnValue(-[OTPrepareOperation deps](self, "deps"));
  id v17 = (void *)objc_claimAutoreleasedReturnValue([v16 activeAccount]);
  v81 = (void *)objc_claimAutoreleasedReturnValue([v17 altDSID]);

  if (v81)
  {
    id v79 = v81;
    id location = (id)0xAAAAAAAAAAAAAAAALL;
    objc_initWeak(&location, self);
    id v18 = (void *)objc_claimAutoreleasedReturnValue(-[OTPrepareOperation deps](self, "deps"));
    v19 = (void *)objc_claimAutoreleasedReturnValue([v18 sosAdapter]);
    unsigned int v20 = [v19 sosEnabled];

    if (!v20)
    {
      v71 = 0LL;
      v77 = 0LL;
LABEL_26:
      *(void *)&__int128 buf = 0LL;
      *((void *)&buf + 1) = &buf;
      uint64_t v91 = 0x3032000000LL;
      v92 = sub_100086890;
      v93 = sub_1000868A0;
      id v94 = 0LL;
      v41 = (void *)objc_claimAutoreleasedReturnValue(-[OTPrepareOperation deps](self, "deps"));
      v42 = (void *)objc_claimAutoreleasedReturnValue([v41 stateHolder]);
      id v85 = 0LL;
      v86[0] = _NSConcreteStackBlock;
      v86[1] = 3221225472LL;
      v86[2] = sub_1000868A8;
      v86[3] = &unk_100285640;
      v86[4] = &buf;
      unsigned __int8 v43 = [v42 persistAccountChanges:v86 error:&v85];
      id v78 = v85;

      if (v78) {
        unsigned __int8 v44 = 0;
      }
      else {
        unsigned __int8 v44 = v43;
      }
      if ((v44 & 1) == 0)
      {
        v45 = sub_10001267C("SecError");
        v46 = (os_log_s *)objc_claimAutoreleasedReturnValue(v45);
        if (os_log_type_enabled(v46, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)v89 = 138412290;
          *(void *)&v89[4] = v78;
          _os_log_impl( (void *)&_mh_execute_header,  v46,  OS_LOG_TYPE_DEFAULT,  "octagon: failed to save 'attempted join' state: %@",  v89,  0xCu);
        }
      }

      v47 = sub_10001267C("octagon");
      v48 = (os_log_s *)objc_claimAutoreleasedReturnValue(v47);
      if (os_log_type_enabled(v48, OS_LOG_TYPE_DEFAULT))
      {
        v49 = (void *)objc_claimAutoreleasedReturnValue(-[OTPrepareOperation accountSettings](self, "accountSettings"));
        *(_DWORD *)v89 = 138412290;
        *(void *)&v89[4] = v49;
        _os_log_impl((void *)&_mh_execute_header, v48, OS_LOG_TYPE_DEFAULT, "preparing identity with %@", v89, 0xCu);
      }

      v76 = (void *)objc_claimAutoreleasedReturnValue(-[OTPrepareOperation deps](self, "deps"));
      v70 = (void *)objc_claimAutoreleasedReturnValue([v76 cuttlefishXPCWrapper]);
      v75 = (void *)objc_claimAutoreleasedReturnValue(-[OTPrepareOperation deps](self, "deps"));
      v69 = (void *)objc_claimAutoreleasedReturnValue([v75 activeAccount]);
      unint64_t v65 = -[OTPrepareOperation epoch](self, "epoch");
      v74 = (void *)objc_claimAutoreleasedReturnValue(-[OTPrepareOperation deviceInfo](self, "deviceInfo"));
      v67 = (void *)objc_claimAutoreleasedReturnValue([v74 machineID]);
      v73 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](&OBJC_CLASS___NSUUID, "UUID"));
      v66 = (void *)objc_claimAutoreleasedReturnValue([v73 UUIDString]);
      v72 = (void *)objc_claimAutoreleasedReturnValue(-[OTPrepareOperation deviceInfo](self, "deviceInfo"));
      v68 = (void *)objc_claimAutoreleasedReturnValue([v72 modelID]);
      v50 = (void *)objc_claimAutoreleasedReturnValue(-[OTPrepareOperation deviceInfo](self, "deviceInfo"));
      v51 = (void *)objc_claimAutoreleasedReturnValue([v50 deviceName]);
      v52 = (void *)objc_claimAutoreleasedReturnValue(-[OTPrepareOperation deviceInfo](self, "deviceInfo"));
      v53 = (void *)objc_claimAutoreleasedReturnValue([v52 serialNumber]);
      v54 = (void *)objc_claimAutoreleasedReturnValue(-[OTPrepareOperation deviceInfo](self, "deviceInfo"));
      v55 = (void *)objc_claimAutoreleasedReturnValue([v54 osVersion]);
      v56 = (void *)objc_claimAutoreleasedReturnValue(-[OTPrepareOperation policyOverride](self, "policyOverride"));
      uint64_t v57 = *(void *)(*((void *)&buf + 1) + 40LL);
      v58 = (void *)objc_claimAutoreleasedReturnValue(-[OTPrepareOperation accountSettings](self, "accountSettings"));
      v82[0] = _NSConcreteStackBlock;
      v82[1] = 3221225472LL;
      v82[2] = sub_1000868F8;
      v82[3] = &unk_1002846E8;
      objc_copyWeak(&v84, &location);
      v83 = v80;
      LODWORD(v64) = 3;
      [v70 prepareWithSpecificUser:v69 epoch:v65 machineID:v67 bottleSalt:v79 bottleID:v66 modelID:v68 deviceName:v51 serialNumber:v53 osVersion:v55 policyVers ion:v56 policySecrets:0 syncUserControllableViews:v64 secureElementIdentity:v57 setting:v58 signingPrivKeyPersistentRef:v71 encPrivKey PersistentRef:v77 reply:v82];

      objc_destroyWeak(&v84);
      _Block_object_dispose(&buf, 8);

      objc_destroyWeak(&location);
      goto LABEL_36;
    }

    v21 = sub_10001267C("octagon-sos");
    id v22 = (os_log_s *)objc_claimAutoreleasedReturnValue(v21);
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(buf) = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v22,  OS_LOG_TYPE_DEFAULT,  "Investigating use of Octagon keys from SOS identity",  (uint8_t *)&buf,  2u);
    }

    id v23 = (void *)objc_claimAutoreleasedReturnValue(-[OTPrepareOperation deps](self, "deps"));
    id v24 = (void *)objc_claimAutoreleasedReturnValue([v23 sosAdapter]);
    id v87 = 0LL;
    objc_super v25 = (void *)objc_claimAutoreleasedReturnValue([v24 currentSOSSelf:&v87]);
    id v26 = v87;

    if (!v25 || v26)
    {
      v37 = sub_10001267C("octagon-sos");
      v38 = (os_log_s *)objc_claimAutoreleasedReturnValue(v37);
      if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
      {
        LODWORD(buf) = 138412290;
        *(void *)((char *)&buf + 4) = v26;
        _os_log_impl( (void *)&_mh_execute_header,  v38,  OS_LOG_TYPE_DEFAULT,  "Failed to get the current SOS self: %@",  (uint8_t *)&buf,  0xCu);
      }
    }

    else
    {
      *(void *)&__int128 buf = 0LL;
      v27 = (void *)objc_claimAutoreleasedReturnValue([v25 signingKey]);
      int v28 = SecKeyCopyPersistentRef([v27 _secKey], &buf);

      if (v28 || !(void)buf)
      {
        v39 = sub_10001267C("octagon-sos");
        v40 = (os_log_s *)objc_claimAutoreleasedReturnValue(v39);
        if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)v89 = 67109120;
          *(_DWORD *)&v89[4] = v28;
          _os_log_impl( (void *)&_mh_execute_header,  v40,  OS_LOG_TYPE_DEFAULT,  "Failed to get the persistent ref for our SOS signing key: %d",  v89,  8u);
        }
      }

      else
      {
        *(void *)v89 = 0LL;
        v29 = (void *)objc_claimAutoreleasedReturnValue([v25 encryptionKey]);
        int v30 = SecKeyCopyPersistentRef([v29 _secKey], v89);

        if (!v30)
        {
          v77 = *(void **)v89;
          if (*(void *)v89)
          {
            v71 = (void *)buf;
LABEL_25:

            goto LABEL_26;
          }
        }

        v59 = sub_10001267C("octagon-sos");
        v60 = (os_log_s *)objc_claimAutoreleasedReturnValue(v59);
        if (os_log_type_enabled(v60, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)v95 = 67109120;
          int v96 = v30;
          _os_log_impl( (void *)&_mh_execute_header,  v60,  OS_LOG_TYPE_DEFAULT,  "Failed to get the persistent ref for our SOS encryption key: %d",  v95,  8u);
        }

        v61 = (const void *)buf;
        if ((void)buf)
        {
          *(void *)&__int128 buf = 0LL;
          CFRelease(v61);
        }

        v62 = *(const void **)v89;
        if (*(void *)v89)
        {
          *(void *)v89 = 0LL;
          CFRelease(v62);
          v71 = 0LL;
          v77 = 0LL;
          goto LABEL_25;
        }
      }
    }

    v71 = 0LL;
    v77 = 0LL;
    goto LABEL_25;
  }

  v31 = sub_10001267C("authkit");
  v32 = (os_log_s *)objc_claimAutoreleasedReturnValue(v31);
  if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
  {
    v33 = (void *)objc_claimAutoreleasedReturnValue(-[OTPrepareOperation deps](self, "deps"));
    v34 = (void *)objc_claimAutoreleasedReturnValue([v33 activeAccount]);
    LODWORD(buf) = 138412290;
    *(void *)((char *)&buf + 4) = v34;
    _os_log_impl( (void *)&_mh_execute_header,  v32,  OS_LOG_TYPE_DEFAULT,  "No configured altDSID: %@",  (uint8_t *)&buf,  0xCu);
  }

  v35 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:description:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:description:",  @"com.apple.security.octagon",  59LL,  @"No altDSID configured"));
  -[CKKSResultOperation setError:](self, "setError:", v35);

  v36 = (void *)objc_claimAutoreleasedReturnValue(-[OTPrepareOperation finishedOp](self, "finishedOp"));
  -[CKKSGroupOperation runBeforeGroupFinished:](self, "runBeforeGroupFinished:", v36);

  id v79 = (id)objc_claimAutoreleasedReturnValue(-[CKKSResultOperation error](self, "error"));
  +[SecurityAnalyticsReporterRTC sendMetricWithEvent:success:error:]( &OBJC_CLASS___SecurityAnalyticsReporterRTC,  "sendMetricWithEvent:success:error:",  v80,  0LL,  v79);
LABEL_36:
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

- (OTAccountSettings)accountSettings
{
  return (OTAccountSettings *)objc_getProperty(self, a2, 208LL, 1);
}

- (void)setAccountSettings:(id)a3
{
}

- (OTOperationDependencies)deps
{
  return (OTOperationDependencies *)objc_getProperty(self, a2, 216LL, 1);
}

- (void)setDeps:(id)a3
{
}

- (NSOperation)finishedOp
{
  return (NSOperation *)objc_getProperty(self, a2, 224LL, 1);
}

- (void)setFinishedOp:(id)a3
{
}

- (void).cxx_destruct
{
}

@end