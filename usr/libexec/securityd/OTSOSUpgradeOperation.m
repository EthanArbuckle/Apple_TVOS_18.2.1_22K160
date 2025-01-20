@interface OTSOSUpgradeOperation
- (AAFAnalyticsEventSecurity)eventS;
- (NSArray)peerPreapprovedSPKIs;
- (NSOperation)finishedOp;
- (OTDeviceInformation)deviceInfo;
- (OTOperationDependencies)deps;
- (OTSOSUpgradeOperation)initWithDependencies:(id)a3 intendedState:(id)a4 ckksConflictState:(id)a5 errorState:(id)a6 deviceInfo:(id)a7 policyOverride:(id)a8;
- (OTUpdateTrustedDeviceListOperation)updateOp;
- (OctagonStateString)ckksConflictState;
- (OctagonStateString)intendedState;
- (OctagonStateString)nextState;
- (TPPolicyVersion)policyOverride;
- (id)persistentKeyRef:(__SecKey *)a3 error:(id *)a4;
- (void)afterPreflight;
- (void)afterPrepare;
- (void)afterSuccessfulAllowList;
- (void)afterUpdate;
- (void)groupStart;
- (void)handlePrepareErrors:(id)a3 nextExpectedState:(id)a4;
- (void)proceedWithKeys:(id)a3 pendingTLKShares:(id)a4;
- (void)requestSilentEscrowUpdate;
- (void)setCkksConflictState:(id)a3;
- (void)setDeps:(id)a3;
- (void)setDeviceInfo:(id)a3;
- (void)setEventS:(id)a3;
- (void)setFinishedOp:(id)a3;
- (void)setNextState:(id)a3;
- (void)setPeerPreapprovedSPKIs:(id)a3;
- (void)setUpdateOp:(id)a3;
@end

@implementation OTSOSUpgradeOperation

- (OTSOSUpgradeOperation)initWithDependencies:(id)a3 intendedState:(id)a4 ckksConflictState:(id)a5 errorState:(id)a6 deviceInfo:(id)a7 policyOverride:(id)a8
{
  id v23 = a3;
  id v22 = a4;
  id v21 = a5;
  id v15 = a6;
  id v16 = a7;
  id v17 = a8;
  v24.receiver = self;
  v24.super_class = (Class)&OBJC_CLASS___OTSOSUpgradeOperation;
  v18 = -[CKKSGroupOperation init](&v24, "init");
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->super._internalSuccesses, a3);
    objc_storeStrong((id *)&v19->super._finishOperation, a4);
    objc_storeStrong((id *)&v19->super._startOperation, a6);
    objc_storeStrong((id *)&v19->_intendedState, a5);
    objc_storeStrong((id *)&v19->_nextState, a7);
    objc_storeStrong((id *)&v19->super._queue, a8);
  }

  return v19;
}

- (id)persistentKeyRef:(__SecKey *)a3 error:(id *)a4
{
  id v9 = 0LL;
  int v5 = SecKeyCopyPersistentRef(a3, &v9);
  if (v5)
  {
    if (a4)
    {
      NSErrorDomain v6 = NSOSStatusErrorDomain;
      uint64_t v7 = v5;
LABEL_7:
      *a4 = (id)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  v6,  v7,  0LL));
    }
  }

  else if (a4 && v9)
  {
    NSErrorDomain v6 = NSOSStatusErrorDomain;
    uint64_t v7 = -25300LL;
    goto LABEL_7;
  }

  return v9;
}

- (void)groupStart
{
  id location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  v3 = objc_alloc(&OBJC_CLASS___AAFAnalyticsEventSecurity);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[OTSOSUpgradeOperation deps](self, "deps"));
  uint64_t v5 = objc_claimAutoreleasedReturnValue([v4 activeAccount]);
  NSErrorDomain v6 = (void *)objc_claimAutoreleasedReturnValue([(id)v5 altDSID]);
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(-[OTSOSUpgradeOperation deps](self, "deps"));
  v8 = (void *)objc_claimAutoreleasedReturnValue([v7 flowID]);
  id v9 = (void *)objc_claimAutoreleasedReturnValue(-[OTSOSUpgradeOperation deps](self, "deps"));
  v10 = (void *)objc_claimAutoreleasedReturnValue([v9 deviceSessionID]);
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[OTSOSUpgradeOperation deps](self, "deps"));
  LOBYTE(v90) = [v11 permittedToSendMetrics];
  v12 = -[AAFAnalyticsEventSecurity initWithKeychainCircleMetrics:altDSID:flowID:deviceSessionID:eventName:testsAreEnabled:canSendMetrics:category:]( v3,  "initWithKeychainCircleMetrics:altDSID:flowID:deviceSessionID:eventName:testsAreEnabled:canSendMetrics:category:",  0LL,  v6,  v8,  v10,  kSecurityRTCEventNamePreApprovedJoin,  0LL,  v90,  kSecurityRTCEventCategoryAccountDataAccessRecovery);
  -[OTSOSUpgradeOperation setEventS:](self, "setEventS:", v12);

  v13 = (void *)objc_claimAutoreleasedReturnValue(-[OTSOSUpgradeOperation deps](self, "deps"));
  v14 = (void *)objc_claimAutoreleasedReturnValue([v13 sosAdapter]);
  LOBYTE(v5) = [v14 sosEnabled];

  id v15 = sub_10001267C("octagon-sos");
  id v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(v15);
  BOOL v17 = os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT);
  if ((v5 & 1) != 0)
  {
    if (v17)
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "Attempting SOS upgrade", buf, 2u);
    }

    v18 = (void *)objc_claimAutoreleasedReturnValue(-[OTSOSUpgradeOperation deps](self, "deps"));
    v19 = (void *)objc_claimAutoreleasedReturnValue([v18 sosAdapter]);
    id v126 = 0LL;
    unsigned int v20 = [v19 circleStatus:&v126];
    id v21 = (__CFString *)v126;

    if (v21 || v20 == -1)
    {
      v32 = sub_10001267C("octagon-sos");
      v33 = (os_log_s *)objc_claimAutoreleasedReturnValue(v32);
      if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v129 = v21;
        _os_log_impl( (void *)&_mh_execute_header,  v33,  OS_LOG_TYPE_DEFAULT,  "Error fetching circle status: %@",  buf,  0xCu);
      }

      -[OTSOSUpgradeOperation setNextState:](self, "setNextState:", @"BecomeUntrusted");
      v25 = (__CFString *)objc_claimAutoreleasedReturnValue(-[OTSOSUpgradeOperation eventS](self, "eventS"));
      v34 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:description:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:description:",  @"com.apple.security.octagon",  71LL,  @"Device not in SOS circle"));
      +[SecurityAnalyticsReporterRTC sendMetricWithEvent:success:error:]( &OBJC_CLASS___SecurityAnalyticsReporterRTC,  "sendMetricWithEvent:success:error:",  v25,  0LL,  v34);
    }

    else
    {
      id v22 = (void *)objc_claimAutoreleasedReturnValue(-[OTSOSUpgradeOperation deps](self, "deps"));
      id v23 = (void *)objc_claimAutoreleasedReturnValue([v22 stateHolder]);
      id v125 = 0LL;
      unsigned __int8 v24 = [v23 persistAccountChanges:&stru_100286448 error:&v125];
      v25 = (__CFString *)v125;

      if (v25) {
        unsigned __int8 v26 = 0;
      }
      else {
        unsigned __int8 v26 = v24;
      }
      if ((v26 & 1) == 0)
      {
        v27 = sub_10001267C("SecError");
        v28 = (os_log_s *)objc_claimAutoreleasedReturnValue(v27);
        if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          v129 = v25;
          _os_log_impl( (void *)&_mh_execute_header,  v28,  OS_LOG_TYPE_DEFAULT,  "octagon: failed to save 'attempted join' state: %@",  buf,  0xCu);
        }
      }

      if (v20)
      {
        v29 = sub_10001267C("octagon-sos");
        v30 = (os_log_s *)objc_claimAutoreleasedReturnValue(v29);
        if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
        {
          if (v20 + 1 > 4) {
            v31 = @"kSOSCCError";
          }
          else {
            v31 = off_100291C60[v20 + 1];
          }
          *(_DWORD *)buf = 138412290;
          v129 = v31;
          _os_log_impl( (void *)&_mh_execute_header,  v30,  OS_LOG_TYPE_DEFAULT,  "Device is not in SOS circle (state: %@), quitting SOS upgrade",  buf,  0xCu);
        }

        -[OTSOSUpgradeOperation setNextState:](self, "setNextState:", @"BecomeUntrusted");
        v34 = (void *)objc_claimAutoreleasedReturnValue(-[OTSOSUpgradeOperation eventS](self, "eventS"));
        v38 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:description:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:description:",  @"com.apple.security.octagon",  71LL,  @"Device not in SOS circle"));
        +[SecurityAnalyticsReporterRTC sendMetricWithEvent:success:error:]( &OBJC_CLASS___SecurityAnalyticsReporterRTC,  "sendMetricWithEvent:success:error:",  v34,  0LL,  v38);
        id v21 = 0LL;
      }

      else
      {
        v35 = (void *)objc_claimAutoreleasedReturnValue(-[OTSOSUpgradeOperation deps](self, "deps"));
        v36 = (void *)objc_claimAutoreleasedReturnValue([v35 sosAdapter]);
        id v124 = 0LL;
        v34 = (void *)objc_claimAutoreleasedReturnValue([v36 currentSOSSelf:&v124]);
        id v21 = (__CFString *)v124;

        if (!v34 || v21)
        {
          v75 = sub_10001267C("octagon-sos");
          v76 = (os_log_s *)objc_claimAutoreleasedReturnValue(v75);
          if (os_log_type_enabled(v76, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            v129 = v21;
            _os_log_impl( (void *)&_mh_execute_header,  v76,  OS_LOG_TYPE_DEFAULT,  "Failed to get the current SOS self: %@",  buf,  0xCu);
          }

          -[OTSOSUpgradeOperation handlePrepareErrors:nextExpectedState:]( self,  "handlePrepareErrors:nextExpectedState:",  v21,  @"BecomeUntrusted");
          v38 = (void *)objc_claimAutoreleasedReturnValue(-[OTSOSUpgradeOperation eventS](self, "eventS"));
          +[SecurityAnalyticsReporterRTC sendMetricWithEvent:success:error:]( &OBJC_CLASS___SecurityAnalyticsReporterRTC,  "sendMetricWithEvent:success:error:",  v38,  0LL,  v21);
        }

        else
        {
          v37 = (void *)objc_claimAutoreleasedReturnValue([v34 signingKey]);
          id v123 = 0LL;
          v38 = (void *)objc_claimAutoreleasedReturnValue( -[OTSOSUpgradeOperation persistentKeyRef:error:]( self,  "persistentKeyRef:error:",  [v37 _secKey],  &v123));
          id v21 = (__CFString *)v123;

          if (v38)
          {
            v39 = (void *)objc_claimAutoreleasedReturnValue([v34 encryptionKey]);
            v122 = v21;
            v40 = (void *)objc_claimAutoreleasedReturnValue( -[OTSOSUpgradeOperation persistentKeyRef:error:]( self,  "persistentKeyRef:error:",  [v39 _secKey],  &v122));
            v114 = v122;

            if (v40)
            {
              v120[0] = _NSConcreteStackBlock;
              v120[1] = 3221225472LL;
              v120[2] = sub_1000F6FE0;
              v120[3] = &unk_100291A38;
              objc_copyWeak(&v121, &location);
              v41 = (void *)objc_claimAutoreleasedReturnValue( +[NSBlockOperation blockOperationWithBlock:]( &OBJC_CLASS___NSBlockOperation,  "blockOperationWithBlock:",  v120));
              -[OTSOSUpgradeOperation setFinishedOp:](self, "setFinishedOp:", v41);

              v42 = (void *)objc_claimAutoreleasedReturnValue(-[OTSOSUpgradeOperation finishedOp](self, "finishedOp"));
              -[CKKSGroupOperation dependOnBeforeGroupFinished:](self, "dependOnBeforeGroupFinished:", v42);

              v43 = (void *)objc_claimAutoreleasedReturnValue(-[OTSOSUpgradeOperation deps](self, "deps"));
              v44 = (void *)objc_claimAutoreleasedReturnValue([v43 stateHolder]);
              id v119 = 0LL;
              v112 = (void *)objc_claimAutoreleasedReturnValue([v44 loadOrCreateAccountMetadata:&v119]);
              v113 = (__CFString *)v119;

              if (v112)
              {
                uint64_t v110 = objc_claimAutoreleasedReturnValue([v112 parsedSecureElementIdentity]);
                v45 = sub_10001267C("octagon-sos");
                v46 = (os_log_s *)objc_claimAutoreleasedReturnValue(v45);
                if (os_log_type_enabled(v46, OS_LOG_TYPE_DEFAULT))
                {
                  *(_WORD *)buf = 0;
                  _os_log_impl( (void *)&_mh_execute_header,  v46,  OS_LOG_TYPE_DEFAULT,  "Fetching trusted peers from SOS",  buf,  2u);
                }

                v47 = (void *)objc_claimAutoreleasedReturnValue(-[OTSOSUpgradeOperation deps](self, "deps"));
                v48 = (void *)objc_claimAutoreleasedReturnValue([v47 sosAdapter]);
                id v118 = 0LL;
                v49 = (void *)objc_claimAutoreleasedReturnValue( +[OTSOSAdapterHelpers peerPublicSigningKeySPKIsForCircle:error:]( &OBJC_CLASS___OTSOSAdapterHelpers,  "peerPublicSigningKeySPKIsForCircle:error:",  v48,  &v118));
                v111 = (__CFString *)v118;
                -[OTSOSUpgradeOperation setPeerPreapprovedSPKIs:](self, "setPeerPreapprovedSPKIs:", v49);

                v50 = (void *)objc_claimAutoreleasedReturnValue(-[OTSOSUpgradeOperation peerPreapprovedSPKIs](self, "peerPreapprovedSPKIs"));
                v51 = sub_10001267C("octagon-sos");
                v52 = (os_log_s *)objc_claimAutoreleasedReturnValue(v51);
                BOOL v53 = os_log_type_enabled(v52, OS_LOG_TYPE_DEFAULT);
                if (v50)
                {
                  if (v53)
                  {
                    v54 = (__CFString *)objc_claimAutoreleasedReturnValue(-[OTSOSUpgradeOperation peerPreapprovedSPKIs](self, "peerPreapprovedSPKIs"));
                    *(_DWORD *)buf = 138412290;
                    v129 = v54;
                    _os_log_impl( (void *)&_mh_execute_header,  v52,  OS_LOG_TYPE_DEFAULT,  "SOS preapproved keys are %@",  buf,  0xCu);
                  }

                  v55 = (void *)objc_claimAutoreleasedReturnValue(-[OTSOSUpgradeOperation deps](self, "deps"));
                  v56 = (void *)objc_claimAutoreleasedReturnValue([v55 activeAccount]);
                  v57 = (void *)objc_claimAutoreleasedReturnValue([v56 altDSID]);

                  if (v57)
                  {
                    id v101 = v57;
                    v58 = (void *)objc_claimAutoreleasedReturnValue(-[OTSOSUpgradeOperation deps](self, "deps"));
                    v59 = (void *)objc_claimAutoreleasedReturnValue([v58 sosAdapter]);
                    id v117 = 0LL;
                    unsigned int v94 = [v59 safariViewSyncingEnabled:&v117];
                    v109 = (__CFString *)v117;

                    if (v109)
                    {
                      v60 = sub_10001267C("octagon-sos");
                      v61 = (os_log_s *)objc_claimAutoreleasedReturnValue(v60);
                      if (os_log_type_enabled(v61, OS_LOG_TYPE_DEFAULT))
                      {
                        *(_DWORD *)buf = 138412290;
                        v129 = v109;
                        _os_log_impl( (void *)&_mh_execute_header,  v61,  OS_LOG_TYPE_DEFAULT,  "Unable to check safari view status: %@",  buf,  0xCu);
                      }
                    }

                    v62 = sub_10001267C("octagon-sos");
                    v63 = (os_log_s *)objc_claimAutoreleasedReturnValue(v62);
                    if (os_log_type_enabled(v63, OS_LOG_TYPE_DEFAULT))
                    {
                      v64 = @"disabled";
                      if (v94) {
                        v64 = @"enabled";
                      }
                      *(_DWORD *)buf = 138412290;
                      v129 = v64;
                      _os_log_impl( (void *)&_mh_execute_header,  v63,  OS_LOG_TYPE_DEFAULT,  "Safari view is: %@",  buf,  0xCu);
                    }

                    v65 = (void *)objc_claimAutoreleasedReturnValue(-[OTSOSUpgradeOperation deps](self, "deps"));
                    v99 = (void *)objc_claimAutoreleasedReturnValue([v65 cuttlefishXPCWrapper]);
                    v66 = (void *)objc_claimAutoreleasedReturnValue(-[OTSOSUpgradeOperation deps](self, "deps"));
                    v100 = (void *)objc_claimAutoreleasedReturnValue([v66 activeAccount]);
                    v108 = (void *)objc_claimAutoreleasedReturnValue(-[OTSOSUpgradeOperation deviceInfo](self, "deviceInfo"));
                    id v93 = [v108 epoch];
                    v107 = (void *)objc_claimAutoreleasedReturnValue(-[OTSOSUpgradeOperation deviceInfo](self, "deviceInfo"));
                    v97 = (void *)objc_claimAutoreleasedReturnValue([v107 machineID]);
                    v106 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](&OBJC_CLASS___NSUUID, "UUID"));
                    v96 = (void *)objc_claimAutoreleasedReturnValue([v106 UUIDString]);
                    v105 = (void *)objc_claimAutoreleasedReturnValue(-[OTSOSUpgradeOperation deviceInfo](self, "deviceInfo"));
                    v98 = (void *)objc_claimAutoreleasedReturnValue([v105 modelID]);
                    v104 = (void *)objc_claimAutoreleasedReturnValue(-[OTSOSUpgradeOperation deviceInfo](self, "deviceInfo"));
                    v95 = (void *)objc_claimAutoreleasedReturnValue([v104 deviceName]);
                    uint64_t v67 = objc_opt_self(self);
                    v103 = (void *)objc_claimAutoreleasedReturnValue(v67);
                    v102 = (void *)objc_claimAutoreleasedReturnValue([v103 deviceInfo]);
                    v68 = (void *)objc_claimAutoreleasedReturnValue([v102 serialNumber]);
                    v69 = (void *)objc_claimAutoreleasedReturnValue(-[OTSOSUpgradeOperation deviceInfo](self, "deviceInfo"));
                    v70 = (void *)objc_claimAutoreleasedReturnValue([v69 osVersion]);
                    v71 = (void *)objc_claimAutoreleasedReturnValue(-[OTSOSUpgradeOperation policyOverride](self, "policyOverride"));
                    v92 = v66;
                    if (v94) {
                      int v72 = 2;
                    }
                    else {
                      int v72 = 1;
                    }
                    v115[0] = _NSConcreteStackBlock;
                    v115[1] = 3221225472LL;
                    v115[2] = sub_1000F7244;
                    v115[3] = &unk_100286470;
                    objc_copyWeak(&v116, &location);
                    LODWORD(v91) = v72;
                    [v99 prepareWithSpecificUser:v100 epoch:v93 machineID:v97 bottleSalt:v101 bottleID:v96 modelID:v98 deviceName:v95 serialNumber:v68 osVers ion:v70 policyVersion:v71 policySecrets:0 syncUserControllableViews:v91 secureElementIdentity:v110 setting:0 signingPri vKeyPersistentRef:v38 encPrivKeyPersistentRef:v40 reply:v115];

                    objc_destroyWeak(&v116);
                    v73 = v101;
                    v74 = v101;
                  }

                  else
                  {
                    v85 = sub_10001267C("authkit");
                    v86 = (os_log_s *)objc_claimAutoreleasedReturnValue(v85);
                    if (os_log_type_enabled(v86, OS_LOG_TYPE_DEFAULT))
                    {
                      v87 = (void *)objc_claimAutoreleasedReturnValue(-[OTSOSUpgradeOperation deps](self, "deps"));
                      v88 = (__CFString *)objc_claimAutoreleasedReturnValue([v87 activeAccount]);
                      *(_DWORD *)buf = 138412290;
                      v129 = v88;
                      _os_log_impl( (void *)&_mh_execute_header,  v86,  OS_LOG_TYPE_DEFAULT,  "No configured altDSID: %@",  buf,  0xCu);
                    }

                    v89 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:description:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:description:",  @"com.apple.security.octagon",  59LL,  @"No altDSID configured"));
                    -[CKKSResultOperation setError:](self, "setError:", v89);

                    v73 = (void *)objc_claimAutoreleasedReturnValue(-[OTSOSUpgradeOperation finishedOp](self, "finishedOp"));
                    -[CKKSGroupOperation runBeforeGroupFinished:](self, "runBeforeGroupFinished:", v73);
                    v74 = 0LL;
                  }
                }

                else
                {
                  if (v53)
                  {
                    *(_DWORD *)buf = 138412290;
                    v129 = v111;
                    _os_log_impl( (void *)&_mh_execute_header,  v52,  OS_LOG_TYPE_DEFAULT,  "Unable to fetch SOS preapproved keys: %@",  buf,  0xCu);
                  }

                  -[CKKSResultOperation setError:](self, "setError:", v111);
                  v74 = (void *)objc_claimAutoreleasedReturnValue(-[OTSOSUpgradeOperation finishedOp](self, "finishedOp"));
                  -[CKKSGroupOperation runBeforeGroupFinished:](self, "runBeforeGroupFinished:", v74);
                }

                v84 = (void *)v110;
              }

              else
              {
                if (!v113) {
                  v113 = (__CFString *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  kCFErrorDomainOSStatus,  -67671LL,  0LL));
                }
                v82 = sub_10001267C("SecError");
                v83 = (os_log_s *)objc_claimAutoreleasedReturnValue(v82);
                if (os_log_type_enabled(v83, OS_LOG_TYPE_DEFAULT))
                {
                  *(_DWORD *)buf = 138412290;
                  v129 = v113;
                  _os_log_impl( (void *)&_mh_execute_header,  v83,  OS_LOG_TYPE_DEFAULT,  "failed to retrieve account object: %@",  buf,  0xCu);
                }

                -[CKKSResultOperation setError:](self, "setError:", v113);
                v84 = (void *)objc_claimAutoreleasedReturnValue(-[OTSOSUpgradeOperation finishedOp](self, "finishedOp"));
                -[CKKSGroupOperation runBeforeGroupFinished:](self, "runBeforeGroupFinished:", v84);
              }

              objc_destroyWeak(&v121);
            }

            else
            {
              v79 = sub_10001267C("octagon-sos");
              v80 = (os_log_s *)objc_claimAutoreleasedReturnValue(v79);
              if (os_log_type_enabled(v80, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 138412290;
                v129 = v114;
                _os_log_impl( (void *)&_mh_execute_header,  v80,  OS_LOG_TYPE_DEFAULT,  "Failed to get the persistent ref for our SOS encryption key: %@",  buf,  0xCu);
              }

              -[OTSOSUpgradeOperation handlePrepareErrors:nextExpectedState:]( self,  "handlePrepareErrors:nextExpectedState:",  v114,  @"BecomeUntrusted");
              v81 = (void *)objc_claimAutoreleasedReturnValue(-[OTSOSUpgradeOperation eventS](self, "eventS"));
              +[SecurityAnalyticsReporterRTC sendMetricWithEvent:success:error:]( &OBJC_CLASS___SecurityAnalyticsReporterRTC,  "sendMetricWithEvent:success:error:",  v81,  0LL,  v114);

              v40 = 0LL;
            }

            id v21 = (__CFString *)v114;
          }

          else
          {
            v77 = sub_10001267C("octagon-sos");
            v78 = (os_log_s *)objc_claimAutoreleasedReturnValue(v77);
            if (os_log_type_enabled(v78, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412290;
              v129 = v21;
              _os_log_impl( (void *)&_mh_execute_header,  v78,  OS_LOG_TYPE_DEFAULT,  "Failed to get the persistent ref for our SOS signing key: %@",  buf,  0xCu);
            }

            -[OTSOSUpgradeOperation handlePrepareErrors:nextExpectedState:]( self,  "handlePrepareErrors:nextExpectedState:",  v21,  @"BecomeUntrusted");
            v40 = (void *)objc_claimAutoreleasedReturnValue(-[OTSOSUpgradeOperation eventS](self, "eventS"));
            +[SecurityAnalyticsReporterRTC sendMetricWithEvent:success:error:]( &OBJC_CLASS___SecurityAnalyticsReporterRTC,  "sendMetricWithEvent:success:error:",  v40,  0LL,  v21);
          }
        }
      }
    }
  }

  else
  {
    if (v17)
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "SOS not enabled on this platform?", buf, 2u);
    }

    -[OTSOSUpgradeOperation setNextState:](self, "setNextState:", @"BecomeUntrusted");
    id v21 = (__CFString *)objc_claimAutoreleasedReturnValue(-[OTSOSUpgradeOperation eventS](self, "eventS"));
    v25 = (__CFString *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:description:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:description:",  @"com.apple.security.octagon",  70LL,  @"SOS not enabled on this platform"));
    +[SecurityAnalyticsReporterRTC sendMetricWithEvent:success:error:]( &OBJC_CLASS___SecurityAnalyticsReporterRTC,  "sendMetricWithEvent:success:error:",  v21,  0LL,  v25);
  }

  objc_destroyWeak(&location);
}

- (void)afterPrepare
{
  id location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[OTSOSUpgradeOperation deps](self, "deps"));
  v4 = (void *)objc_claimAutoreleasedReturnValue([v3 cuttlefishXPCWrapper]);
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[OTSOSUpgradeOperation deps](self, "deps"));
  NSErrorDomain v6 = (void *)objc_claimAutoreleasedReturnValue([v5 activeAccount]);
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(-[OTSOSUpgradeOperation peerPreapprovedSPKIs](self, "peerPreapprovedSPKIs"));
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = sub_1000F6E14;
  v8[3] = &unk_100286498;
  objc_copyWeak(&v9, &location);
  [v4 preflightPreapprovedJoinWithSpecificUser:v6 preapprovedKeys:v7 reply:v8];

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

- (void)afterPreflight
{
  id location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  v3 = objc_alloc(&OBJC_CLASS___OTUpdateTrustedDeviceListOperation);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[OTSOSUpgradeOperation deps](self, "deps"));
  uint64_t v5 = -[OTUpdateTrustedDeviceListOperation initWithDependencies:intendedState:listUpdatesState:errorState:retryFlag:]( v3,  "initWithDependencies:intendedState:listUpdatesState:errorState:retryFlag:",  v4,  @"Ready",  @"Ready",  @"Error",  0LL);
  -[OTSOSUpgradeOperation setUpdateOp:](self, "setUpdateOp:", v5);

  NSErrorDomain v6 = (void *)objc_claimAutoreleasedReturnValue(-[OTSOSUpgradeOperation updateOp](self, "updateOp"));
  [v6 setLogForUpgrade:1];

  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(-[OTSOSUpgradeOperation updateOp](self, "updateOp"));
  -[CKKSGroupOperation runBeforeGroupFinished:](self, "runBeforeGroupFinished:", v7);

  v10 = _NSConcreteStackBlock;
  uint64_t v11 = 3221225472LL;
  v12 = sub_1000F6DE8;
  v13 = &unk_100291A38;
  objc_copyWeak(&v14, &location);
  v8 = (void *)objc_claimAutoreleasedReturnValue( +[CKKSResultOperation named:withBlock:]( &OBJC_CLASS___CKKSResultOperation,  "named:withBlock:",  @"after-update",  &v10));
  id v9 = (void *)objc_claimAutoreleasedReturnValue(-[OTSOSUpgradeOperation updateOp](self, "updateOp", v10, v11, v12, v13));
  [v8 addDependency:v9];

  -[CKKSGroupOperation runBeforeGroupFinished:](self, "runBeforeGroupFinished:", v8);
  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);
}

- (void)handlePrepareErrors:(id)a3 nextExpectedState:(id)a4
{
  id v6 = a3;
  uint64_t v7 = (__CFString *)a4;
  v8 = sub_10001267C("octagon-sos");
  id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    int v14 = 138412290;
    id v15 = v6;
    _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "handling prepare error: %@",  (uint8_t *)&v14,  0xCu);
  }

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[OTSOSUpgradeOperation deps](self, "deps"));
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([v10 lockStateTracker]);
  unsigned int v12 = [v11 isLockedError:v6];

  if (v12) {
    v13 = @"WaitForUnlock";
  }
  else {
    v13 = v7;
  }
  -[OTSOSUpgradeOperation setNextState:](self, "setNextState:", v13);
  -[CKKSResultOperation setError:](self, "setError:", v6);
}

- (void)afterUpdate
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[OTSOSUpgradeOperation updateOp](self, "updateOp"));
  v4 = (void *)objc_claimAutoreleasedReturnValue([v3 error]);

  if (v4)
  {
    uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[OTSOSUpgradeOperation updateOp](self, "updateOp"));
    id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 error]);
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(-[OTSOSUpgradeOperation nextState](self, "nextState"));
    -[OTSOSUpgradeOperation handlePrepareErrors:nextExpectedState:]( self,  "handlePrepareErrors:nextExpectedState:",  v6,  v7);

    id v10 = (id)objc_claimAutoreleasedReturnValue(-[OTSOSUpgradeOperation finishedOp](self, "finishedOp"));
    -[CKKSGroupOperation runBeforeGroupFinished:](self, "runBeforeGroupFinished:", v10);
  }

  else
  {
    v8 = sub_10001267C("octagon-sos");
    id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "Successfully saved machineID allow-list",  buf,  2u);
    }

    -[OTSOSUpgradeOperation afterSuccessfulAllowList](self, "afterSuccessfulAllowList");
  }

- (void)requestSilentEscrowUpdate
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[OTSOSUpgradeOperation deps](self, "deps"));
  id v12 = 0LL;
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(objc_msgSend(v2, "escrowRequestClass"), "request:", &v12));
  v4 = (os_log_s *)v12;

  if (!v3 || v4)
  {
    id v10 = sub_10001267C("octagon-sos");
    uint64_t v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      int v14 = v4;
      id v9 = "Unable to acquire a EscrowRequest object: %@";
      goto LABEL_8;
    }

- (void)afterSuccessfulAllowList
{
  id location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  v3 = objc_alloc(&OBJC_CLASS___OTFetchCKKSKeysOperation);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[OTSOSUpgradeOperation deps](self, "deps"));
  uint64_t v5 = -[OTFetchCKKSKeysOperation initWithDependencies:refetchNeeded:]( v3,  "initWithDependencies:refetchNeeded:",  v4,  0LL);

  -[CKKSGroupOperation runBeforeGroupFinished:](self, "runBeforeGroupFinished:", v5);
  id v6 = sub_10001267C("octagon-sos");
  uint64_t v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Fetching keys from CKKS", buf, 2u);
  }

  id v10 = _NSConcreteStackBlock;
  uint64_t v11 = 3221225472LL;
  id v12 = sub_1000F6D7C;
  v13 = &unk_100290FC8;
  objc_copyWeak(&v15, &location);
  BOOL v8 = v5;
  int v14 = v8;
  id v9 = (void *)objc_claimAutoreleasedReturnValue( +[CKKSResultOperation named:withBlock:]( &OBJC_CLASS___CKKSResultOperation,  "named:withBlock:",  @"sos-upgrade-with-keys",  &v10));
  objc_msgSend(v9, "addDependency:", v8, v10, v11, v12, v13);
  -[CKKSGroupOperation runBeforeGroupFinished:](self, "runBeforeGroupFinished:", v9);

  objc_destroyWeak(&v15);
  objc_destroyWeak(&location);
}

- (void)proceedWithKeys:(id)a3 pendingTLKShares:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  BOOL v8 = sub_10001267C("octagon-sos");
  id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    unsigned int v10 = [v6 count];
    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(-[OTSOSUpgradeOperation peerPreapprovedSPKIs](self, "peerPreapprovedSPKIs"));
    unsigned int v12 = [v11 count];
    *(_DWORD *)buf = 67109376;
    unsigned int v22 = v10;
    __int16 v23 = 1024;
    unsigned int v24 = v12;
    _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "Beginning SOS upgrade with %d key sets and %d SOS peers",  buf,  0xEu);
  }

  v13 = (void *)objc_claimAutoreleasedReturnValue(-[OTSOSUpgradeOperation deps](self, "deps"));
  int v14 = (void *)objc_claimAutoreleasedReturnValue([v13 cuttlefishXPCWrapper]);
  id v15 = (void *)objc_claimAutoreleasedReturnValue(-[OTSOSUpgradeOperation deps](self, "deps"));
  id v16 = (void *)objc_claimAutoreleasedReturnValue([v15 activeAccount]);
  BOOL v17 = (void *)objc_claimAutoreleasedReturnValue(-[OTSOSUpgradeOperation peerPreapprovedSPKIs](self, "peerPreapprovedSPKIs"));
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472LL;
  v18[2] = sub_1000F68B4;
  v18[3] = &unk_1002864E8;
  objc_copyWeak(&v19, &location);
  [v14 attemptPreapprovedJoinWithSpecificUser:v16 ckksKeys:v6 tlkShares:v7 preapprovedKeys:v17 reply:v18];

  objc_destroyWeak(&v19);
  objc_destroyWeak(&location);
}

- (OctagonStateString)nextState
{
  return (OctagonStateString *)objc_getProperty(self, a2, 128LL, 1);
}

- (void)setNextState:(id)a3
{
}

- (OctagonStateString)intendedState
{
  return (OctagonStateString *)objc_getProperty(self, a2, 136LL, 1);
}

- (TPPolicyVersion)policyOverride
{
  return (TPPolicyVersion *)objc_getProperty(self, a2, 144LL, 1);
}

- (OTOperationDependencies)deps
{
  return (OTOperationDependencies *)objc_getProperty(self, a2, 152LL, 1);
}

- (void)setDeps:(id)a3
{
}

- (OTDeviceInformation)deviceInfo
{
  return (OTDeviceInformation *)objc_getProperty(self, a2, 160LL, 1);
}

- (void)setDeviceInfo:(id)a3
{
}

- (OctagonStateString)ckksConflictState
{
  return (OctagonStateString *)objc_getProperty(self, a2, 168LL, 1);
}

- (void)setCkksConflictState:(id)a3
{
}

- (AAFAnalyticsEventSecurity)eventS
{
  return self->_policyOverride;
}

- (void)setEventS:(id)a3
{
}

- (NSOperation)finishedOp
{
  return (NSOperation *)objc_getProperty(self, a2, 184LL, 1);
}

- (void)setFinishedOp:(id)a3
{
}

- (OTUpdateTrustedDeviceListOperation)updateOp
{
  return (OTUpdateTrustedDeviceListOperation *)objc_getProperty(self, a2, 192LL, 1);
}

- (void)setUpdateOp:(id)a3
{
}

- (NSArray)peerPreapprovedSPKIs
{
  return (NSArray *)objc_getProperty(self, a2, 200LL, 1);
}

- (void)setPeerPreapprovedSPKIs:(id)a3
{
}

- (void).cxx_destruct
{
}

@end