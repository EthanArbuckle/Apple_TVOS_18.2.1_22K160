@interface CKKSHealTLKSharesOperation
+ (id)createMissingKeyShares:(id)a3 peers:(id)a4 databaseProvider:(id)a5 error:(id *)a6;
+ (id)createMissingKeyShares:(id)a3 trustStates:(id)a4 databaseProvider:(id)a5 error:(id *)a6;
+ (id)filterTrustedPeers:(id)a3 missingTLKSharesFor:(id)a4 databaseProvider:(id)a5 error:(id *)a6;
- (BOOL)areNewSharesSufficient:(id)a3 trustStates:(id)a4 error:(id *)a5;
- (BOOL)cloudkitWriteFailures;
- (BOOL)failedDueToEssentialTrustState;
- (BOOL)failedDueToLockState;
- (CKKSHealTLKSharesOperation)init;
- (CKKSHealTLKSharesOperation)initWithDependencies:(id)a3 intendedState:(id)a4 errorState:(id)a5;
- (CKKSOperationDependencies)deps;
- (CKKSResultOperation)setResultStateOperation;
- (NSHashTable)ckOperations;
- (OctagonStateString)intendedState;
- (OctagonStateString)nextState;
- (void)checkAndHealTLKShares:(id)a3 currentTrustStates:(id)a4;
- (void)groupStart;
- (void)setCkOperations:(id)a3;
- (void)setCloudkitWriteFailures:(BOOL)a3;
- (void)setDeps:(id)a3;
- (void)setFailedDueToEssentialTrustState:(BOOL)a3;
- (void)setFailedDueToLockState:(BOOL)a3;
- (void)setNextState:(id)a3;
- (void)setSetResultStateOperation:(id)a3;
@end

@implementation CKKSHealTLKSharesOperation

- (CKKSHealTLKSharesOperation)init
{
  return 0LL;
}

- (CKKSHealTLKSharesOperation)initWithDependencies:(id)a3 intendedState:(id)a4 errorState:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v17.receiver = self;
  v17.super_class = (Class)&OBJC_CLASS___CKKSHealTLKSharesOperation;
  v12 = -[CKKSGroupOperation init](&v17, "init");
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)(v12 + 150), a3);
    objc_storeStrong((id *)(v13 + 142), a5);
    objc_storeStrong((id *)(v13 + 134), a4);
    v13[128] = 0;
    v13[129] = 0;
    v13[130] = 0;
    uint64_t v14 = objc_claimAutoreleasedReturnValue(+[NSHashTable weakObjectsHashTable](&OBJC_CLASS___NSHashTable, "weakObjectsHashTable"));
    v15 = *(void **)(v13 + 158);
    *(void *)(v13 + 158) = v14;
  }

  return (CKKSHealTLKSharesOperation *)v13;
}

- (void)groupStart
{
  id location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSHealTLKSharesOperation deps](self, "deps"));
  v3 = (void *)objc_claimAutoreleasedReturnValue([v2 personaAdapter]);
  [v3 prepareThreadForKeychainAPIUseForPersonaIdentifier:0];

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSHealTLKSharesOperation deps](self, "deps"));
  v5 = (void *)objc_claimAutoreleasedReturnValue([v4 syncingPolicy]);
  LODWORD(v3) = [v5 isInheritedAccount];

  if ((_DWORD)v3)
  {
    v6 = sub_10001267C("ckksshare");
    v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "Account is inherited, bailing out of healing TLKShares",  buf,  2u);
    }

    v8 = (AAFAnalyticsEventSecurity *)objc_claimAutoreleasedReturnValue(-[CKKSHealTLKSharesOperation intendedState](self, "intendedState"));
    -[CKKSHealTLKSharesOperation setNextState:](self, "setNextState:", v8);
  }

  else
  {
    id v9 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSHealTLKSharesOperation deps](self, "deps"));
    id v10 = (void *)objc_claimAutoreleasedReturnValue([v9 overallLaunch]);
    [v10 addEvent:@"heal-tlk-shares-begin"];

    id v11 = objc_alloc(&OBJC_CLASS___AAFAnalyticsEventSecurity);
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSHealTLKSharesOperation deps](self, "deps"));
    v13 = (void *)objc_claimAutoreleasedReturnValue([v12 activeAccount]);
    uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue([v13 altDSID]);
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSHealTLKSharesOperation deps](self, "deps"));
    id v16 = [v15 sendMetric];
    objc_super v17 = -[AAFAnalyticsEventSecurity initWithCKKSMetrics:altDSID:eventName:testsAreEnabled:category:sendMetric:]( v11,  "initWithCKKSMetrics:altDSID:eventName:testsAreEnabled:category:sendMetric:",  &__NSDictionary0__struct,  v14,  kSecurityRTCEventNameHealTLKShares,  0LL,  kSecurityRTCEventCategoryAccountDataAccessRecovery,  v16);

    v48[0] = _NSConcreteStackBlock;
    v48[1] = 3221225472LL;
    v48[2] = sub_100161B80;
    v48[3] = &unk_100290E58;
    v39 = &v50;
    objc_copyWeak(&v50, &location);
    v41 = v17;
    v49 = v41;
    v18 = (void *)objc_claimAutoreleasedReturnValue( +[CKKSResultOperation named:withBlockTakingSelf:]( &OBJC_CLASS___CKKSResultOperation,  "named:withBlockTakingSelf:",  @"determine-next-state",  v48));
    -[CKKSHealTLKSharesOperation setSetResultStateOperation:](self, "setSetResultStateOperation:", v18);

    v19 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSHealTLKSharesOperation deps](self, "deps"));
    v42 = (void *)objc_claimAutoreleasedReturnValue([v19 currentTrustStates]);

    __int128 v46 = 0u;
    __int128 v47 = 0u;
    __int128 v44 = 0u;
    __int128 v45 = 0u;
    v20 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSHealTLKSharesOperation deps](self, "deps"));
    v21 = (void *)objc_claimAutoreleasedReturnValue([v20 activeManagedViews]);

    uint64_t v22 = 0LL;
    id v23 = [v21 countByEnumeratingWithState:&v44 objects:v56 count:16];
    if (v23)
    {
      uint64_t v24 = *(void *)v45;
      do
      {
        for (i = 0LL; i != v23; i = (char *)i + 1)
        {
          if (*(void *)v45 != v24) {
            objc_enumerationMutation(v21);
          }
          v26 = *(void **)(*((void *)&v44 + 1) + 8LL * (void)i);
          v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "viewKeyHierarchyState", v39));
          unsigned __int8 v28 = [v27 isEqualToString:@"ready"];

          if ((v28 & 1) != 0)
          {
            -[CKKSHealTLKSharesOperation checkAndHealTLKShares:currentTrustStates:]( self,  "checkAndHealTLKShares:currentTrustStates:",  v26,  v42);
            uint64_t v22 = (v22 + 1);
          }

          else
          {
            v29 = (void *)objc_claimAutoreleasedReturnValue([v26 zoneID]);
            v30 = (void *)objc_claimAutoreleasedReturnValue([v29 zoneName]);
            id v31 = sub_1000AA6AC(@"ckksshare", v30);
            v32 = (os_log_s *)objc_claimAutoreleasedReturnValue(v31);

            if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138412290;
              v55 = v26;
              _os_log_impl( (void *)&_mh_execute_header,  v32,  OS_LOG_TYPE_ERROR,  "View key state is %@; not checking TLK share validity",
                buf,
                0xCu);
            }
          }
        }

        id v23 = [v21 countByEnumeratingWithState:&v44 objects:v56 count:16];
      }

      while (v23);
    }

    uint64_t v52 = kSecurityRTCFieldNumViews;
    v33 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", v22));
    v53 = v33;
    v34 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v53,  &v52,  1LL));
    -[AAFAnalyticsEventSecurity addMetrics:](v41, "addMetrics:", v34);

    if (-[CKKSHealTLKSharesOperation failedDueToLockState](self, "failedDueToLockState"))
    {
      v35 = -[OctagonPendingFlag initWithFlag:conditions:]( objc_alloc(&OBJC_CLASS___OctagonPendingFlag),  "initWithFlag:conditions:",  @"key_process_requested",  1LL);
      v36 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSHealTLKSharesOperation deps](self, "deps"));
      v37 = (void *)objc_claimAutoreleasedReturnValue([v36 flagHandler]);
      [v37 handlePendingFlag:v35];
    }

    v38 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSHealTLKSharesOperation setResultStateOperation](self, "setResultStateOperation", v39));
    -[CKKSGroupOperation runBeforeGroupFinished:](self, "runBeforeGroupFinished:", v38);

    objc_destroyWeak(v40);
    v8 = v41;
  }

  objc_destroyWeak(&location);
}

- (void)checkAndHealTLKShares:(id)a3 currentTrustStates:(id)a4
{
  id v6 = a3;
  id v126 = a4;
  uint64_t v171 = 0LL;
  v172 = &v171;
  uint64_t v173 = 0x3032000000LL;
  v174 = sub_10016144C;
  v175 = sub_10016145C;
  id v176 = 0LL;
  val = self;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSHealTLKSharesOperation deps](self, "deps"));
  v8 = (void *)objc_claimAutoreleasedReturnValue([v7 databaseProvider]);
  v168[0] = _NSConcreteStackBlock;
  v168[1] = 3221225472LL;
  v168[2] = sub_100161464;
  v168[3] = &unk_1002916D0;
  v170 = &v171;
  id v134 = v6;
  id v169 = v134;
  [v8 dispatchSyncWithReadOnlySQLTransaction:v168];

  id v9 = (void *)objc_claimAutoreleasedReturnValue([(id)v172[5] error]);
  if (v9)
  {
    [v134 setViewKeyHierarchyState:@"unhealthy"];
    id v10 = (void *)objc_claimAutoreleasedReturnValue([v134 zoneID]);
    id v11 = (void *)objc_claimAutoreleasedReturnValue([v10 zoneName]);
    id v12 = sub_1000AA6AC(@"ckksshare", v11);
    v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);

    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_ERROR,  "couldn't load current keys: can't fix TLK shares",  buf,  2u);
    }

    goto LABEL_83;
  }

  uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue([v134 zoneID]);
  v15 = (void *)objc_claimAutoreleasedReturnValue([v14 zoneName]);
  id v16 = sub_1000AA6AC(@"ckksshare", v15);
  objc_super v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);

  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v18 = v172[5];
    *(_DWORD *)buf = 138412290;
    *(void *)&uint8_t buf[4] = v18;
    _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "Key set is %@", buf, 0xCu);
  }

  v19 = (void *)objc_claimAutoreleasedReturnValue([v134 zoneID]);
  v20 = (void *)objc_claimAutoreleasedReturnValue([v19 zoneName]);
  +[CKKSPowerCollection CKKSPowerEvent:zone:]( &OBJC_CLASS___CKKSPowerCollection,  "CKKSPowerEvent:zone:",  @"TLKShareProcessing",  v20);

  v21 = objc_alloc(&OBJC_CLASS___AAFAnalyticsEventSecurity);
  uint64_t v22 = kSecurityRTCFieldIsLocked;
  uint64_t v188 = kSecurityRTCFieldIsLocked;
  v189 = &__kCFBooleanFalse;
  id v23 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v189,  &v188,  1LL));
  uint64_t v24 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSHealTLKSharesOperation deps](val, "deps"));
  v25 = (void *)objc_claimAutoreleasedReturnValue([v24 activeAccount]);
  v26 = (void *)objc_claimAutoreleasedReturnValue([v25 altDSID]);
  v27 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSHealTLKSharesOperation deps](val, "deps"));
  [v27 sendMetric];
  uint64_t v124 = kSecurityRTCEventCategoryAccountDataAccessRecovery;
  v132 = -[AAFAnalyticsEventSecurity initWithCKKSMetrics:altDSID:eventName:testsAreEnabled:category:sendMetric:]( v21,  "initWithCKKSMetrics:altDSID:eventName:testsAreEnabled:category:sendMetric:",  v23,  v26,  kSecurityRTCEventNameCreateMissingTLKShares,  0LL);

  unsigned __int8 v28 = objc_autoreleasePoolPush();
  v29 = (void *)objc_claimAutoreleasedReturnValue([(id)v172[5] tlk]);
  id v167 = 0LL;
  unsigned int v30 = [v29 loadKeyMaterialFromKeychain:&v167];
  id v31 = v167;
  if (v31) {
    unsigned int v32 = 0;
  }
  else {
    unsigned int v32 = v30;
  }

  if ((v32 & 1) == 0)
  {
    v33 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSHealTLKSharesOperation deps](val, "deps"));
    v34 = (void *)objc_claimAutoreleasedReturnValue([v33 lockStateTracker]);
    unsigned int v35 = [v34 isLockedError:v31];

    if (v35)
    {
      v36 = (void *)objc_claimAutoreleasedReturnValue([v134 zoneID]);
      v37 = (void *)objc_claimAutoreleasedReturnValue([v36 zoneName]);
      id v38 = sub_1000AA6AC(@"ckksshare", v37);
      v39 = (os_log_s *)objc_claimAutoreleasedReturnValue(v38);

      if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        *(void *)&uint8_t buf[4] = v31;
        _os_log_impl( (void *)&_mh_execute_header,  v39,  OS_LOG_TYPE_ERROR,  "Keychain is locked: can't fix shares yet: %@",  buf,  0xCu);
      }

      -[CKKSHealTLKSharesOperation setFailedDueToLockState:](val, "setFailedDueToLockState:", 1LL);
      uint64_t v186 = v22;
      v187 = &__kCFBooleanTrue;
      v40 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v187,  &v186,  1LL));
      -[AAFAnalyticsEventSecurity addMetrics:](v132, "addMetrics:", v40);
    }

    else
    {
      v41 = (void *)objc_claimAutoreleasedReturnValue([v134 zoneID]);
      v42 = (void *)objc_claimAutoreleasedReturnValue([v41 zoneName]);
      id v43 = sub_1000AA6AC(@"ckksshare", v42);
      __int128 v44 = (os_log_s *)objc_claimAutoreleasedReturnValue(v43);

      if (os_log_type_enabled(v44, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        *(void *)&uint8_t buf[4] = v31;
        _os_log_impl( (void *)&_mh_execute_header,  v44,  OS_LOG_TYPE_ERROR,  "couldn't load current tlk from keychain: %@",  buf,  0xCu);
      }

      [v134 setViewKeyHierarchyState:@"unhealthy"];
    }

    +[SecurityAnalyticsReporterRTC sendMetricWithEvent:success:error:]( &OBJC_CLASS___SecurityAnalyticsReporterRTC,  "sendMetricWithEvent:success:error:",  v132,  0LL,  v31);
  }

  objc_autoreleasePoolPop(v28);
  if (!v32) {
    goto LABEL_82;
  }
  v127 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](&OBJC_CLASS___NSMutableSet, "set"));
  __int128 v165 = 0u;
  __int128 v166 = 0u;
  __int128 v163 = 0u;
  __int128 v164 = 0u;
  id obj = v126;
  id v45 = [obj countByEnumeratingWithState:&v163 objects:v185 count:16];
  if (!v45) {
    goto LABEL_50;
  }
  uint64_t v130 = *(void *)v164;
  do
  {
    for (i = 0LL; i != v45; i = (char *)i + 1)
    {
      if (*(void *)v164 != v130) {
        objc_enumerationMutation(obj);
      }
      __int128 v47 = *(void **)(*((void *)&v163 + 1) + 8LL * (void)i);
      v48 = objc_autoreleasePoolPush();
      uint64_t v49 = v172[5];
      id v50 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSHealTLKSharesOperation deps](val, "deps"));
      v51 = (void *)objc_claimAutoreleasedReturnValue([v50 databaseProvider]);
      id v162 = 0LL;
      uint64_t v52 = (void *)objc_claimAutoreleasedReturnValue( +[CKKSHealTLKSharesOperation createMissingKeyShares:peers:databaseProvider:error:]( &OBJC_CLASS___CKKSHealTLKSharesOperation,  "createMissingKeyShares:peers:databaseProvider:error:",  v49,  v47,  v51,  &v162));
      id v53 = v162;

      if (v52 && !v53)
      {
        [v127 unionSet:v52];
LABEL_36:
        int v60 = 1;
        goto LABEL_47;
      }

      v54 = (void *)objc_claimAutoreleasedReturnValue([(id)v172[5] tlk]);
      v55 = (void *)objc_claimAutoreleasedReturnValue([v54 zoneName]);
      id v56 = sub_1000AA6AC(@"ckksshare", v55);
      v57 = (os_log_s *)objc_claimAutoreleasedReturnValue(v56);

      if (os_log_type_enabled(v57, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412546;
        *(void *)&uint8_t buf[4] = v47;
        *(_WORD *)&buf[12] = 2112;
        *(void *)&buf[14] = v53;
        _os_log_impl( (void *)&_mh_execute_header,  v57,  OS_LOG_TYPE_DEFAULT,  "Unable to create shares for trust set %@: %@",  buf,  0x16u);
      }

      +[SecurityAnalyticsReporterRTC sendMetricWithEvent:success:error:]( &OBJC_CLASS___SecurityAnalyticsReporterRTC,  "sendMetricWithEvent:success:error:",  v132,  0LL,  v53);
      v58 = (void *)objc_claimAutoreleasedReturnValue([v53 domain]);
      if ([v58 isEqualToString:@"com.apple.security.trustedpeers.container"]
        && [v53 code] == (id)1)
      {
        goto LABEL_35;
      }

      v59 = (void *)objc_claimAutoreleasedReturnValue([v53 domain]);
      if ([v59 isEqualToString:@"CKKSErrorDomain"]
        && [v53 code] == (id)52)
      {

LABEL_35:
        goto LABEL_39;
      }

      v61 = (void *)objc_claimAutoreleasedReturnValue([v53 domain]);
      if (([v61 isEqualToString:@"CKKSErrorDomain"] & 1) == 0)
      {

LABEL_43:
        v67 = (void *)objc_claimAutoreleasedReturnValue([v134 zoneID]);
        v68 = (void *)objc_claimAutoreleasedReturnValue([v67 zoneName]);
        id v69 = sub_1000AA6AC(@"ckksshare", v68);
        v70 = (os_log_s *)objc_claimAutoreleasedReturnValue(v69);

        if (os_log_type_enabled(v70, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          *(void *)&uint8_t buf[4] = 0LL;
          _os_log_impl((void *)&_mh_execute_header, v70, OS_LOG_TYPE_ERROR, "Unable to create shares: %@", buf, 0xCu);
        }

        [v134 setViewKeyHierarchyState:@"unhealthy"];
        goto LABEL_46;
      }

      BOOL v62 = [v53 code] == (id)24;

      if (!v62) {
        goto LABEL_43;
      }
LABEL_39:
      v63 = (void *)objc_claimAutoreleasedReturnValue([v134 zoneID]);
      v64 = (void *)objc_claimAutoreleasedReturnValue([v63 zoneName]);
      id v65 = sub_1000AA6AC(@"ckksshare", v64);
      v66 = (os_log_s *)objc_claimAutoreleasedReturnValue(v65);

      if (os_log_type_enabled(v66, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        *(void *)&uint8_t buf[4] = 0LL;
        _os_log_impl( (void *)&_mh_execute_header,  v66,  OS_LOG_TYPE_ERROR,  "Unable to create shares due to some trust issue: %@",  buf,  0xCu);
      }

      [v134 setViewKeyHierarchyState:@"waitfortrust"];
      -[CKKSHealTLKSharesOperation setFailedDueToEssentialTrustState:](val, "setFailedDueToEssentialTrustState:", 1LL);
LABEL_46:
      +[SecurityAnalyticsReporterRTC sendMetricWithEvent:success:error:]( &OBJC_CLASS___SecurityAnalyticsReporterRTC,  "sendMetricWithEvent:success:error:",  v132,  0LL,  0LL);
      int v60 = 0;
LABEL_47:

      objc_autoreleasePoolPop(v48);
      if (!v60) {
        goto LABEL_81;
      }
    }

    id v45 = [obj countByEnumeratingWithState:&v163 objects:v185 count:16];
  }

  while (v45);
LABEL_50:

  if ([v127 count])
  {
    uint64_t v183 = kSecurityRTCFieldNewTLKShares;
    v71 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInteger:]( NSNumber,  "numberWithUnsignedInteger:",  [v127 count]));
    v184 = v71;
    v72 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v184,  &v183,  1LL));
    -[AAFAnalyticsEventSecurity addMetrics:](v132, "addMetrics:", v72);

    +[SecurityAnalyticsReporterRTC sendMetricWithEvent:success:error:]( &OBJC_CLASS___SecurityAnalyticsReporterRTC,  "sendMetricWithEvent:success:error:",  v132,  1LL,  0LL);
    v73 = (void *)objc_claimAutoreleasedReturnValue([v127 allObjects]);
    [(id)v172[5] setPendingTLKShares:v73];

    uint64_t v74 = v172[5];
    id v161 = 0LL;
    unsigned __int8 v75 = -[CKKSHealTLKSharesOperation areNewSharesSufficient:trustStates:error:]( val,  "areNewSharesSufficient:trustStates:error:",  v74,  obj,  &v161);
    id obj = v161;
    if (obj) {
      unsigned __int8 v76 = 0;
    }
    else {
      unsigned __int8 v76 = v75;
    }
    if ((v76 & 1) != 0)
    {
      *(void *)buf = 0LL;
      *(void *)&buf[8] = buf;
      *(void *)&buf[16] = 0x2020000000LL;
      int v182 = 0;
      v159[0] = 0LL;
      v159[1] = v159;
      v159[2] = 0x2020000000LL;
      char v160 = 1;
      v77 = objc_alloc(&OBJC_CLASS___AAFAnalyticsEventSecurity);
      uint64_t v179 = kSecurityRTCFieldIsPrioritized;
      v180 = &__kCFBooleanFalse;
      v78 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v180,  &v179,  1LL));
      v79 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSHealTLKSharesOperation deps](val, "deps"));
      v80 = (void *)objc_claimAutoreleasedReturnValue([v79 activeAccount]);
      v81 = (void *)objc_claimAutoreleasedReturnValue([v80 altDSID]);
      v82 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSHealTLKSharesOperation deps](val, "deps"));
      id v83 = [v82 sendMetric];
      v125 = -[AAFAnalyticsEventSecurity initWithCKKSMetrics:altDSID:eventName:testsAreEnabled:category:sendMetric:]( v77,  "initWithCKKSMetrics:altDSID:eventName:testsAreEnabled:category:sendMetric:",  v78,  v81,  kSecurityRTCEventNameUploadMissingTLKShares,  0LL,  v124,  v83);

      v84 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
      __int128 v157 = 0u;
      __int128 v158 = 0u;
      __int128 v155 = 0u;
      __int128 v156 = 0u;
      id v85 = v127;
      id v86 = [v85 countByEnumeratingWithState:&v155 objects:v178 count:16];
      if (v86)
      {
        uint64_t v87 = *(void *)v156;
        do
        {
          for (j = 0LL; j != v86; j = (char *)j + 1)
          {
            if (*(void *)v156 != v87) {
              objc_enumerationMutation(v85);
            }
            v89 = *(void **)(*((void *)&v155 + 1) + 8LL * (void)j);
            v90 = (void *)objc_claimAutoreleasedReturnValue([v134 zoneID]);
            v91 = (void *)objc_claimAutoreleasedReturnValue([v89 CKRecordWithZoneID:v90]);
            -[NSMutableArray addObject:](v84, "addObject:", v91);
          }

          id v86 = [v85 countByEnumeratingWithState:&v155 objects:v178 count:16];
        }

        while (v86);
      }

      for (uint64_t k = 0LL; ; ++k)
      {
        uint64_t v92 = 1000 * k;
        v93 = (void *)objc_claimAutoreleasedReturnValue([v134 zoneID]);
        v94 = (void *)objc_claimAutoreleasedReturnValue([v93 zoneName]);
        v95 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"heal-tlkshares-%@",  v94));
        v150[0] = _NSConcreteStackBlock;
        v150[1] = 3221225472LL;
        v150[2] = sub_1001614E8;
        v150[3] = &unk_100290E90;
        id v96 = v85;
        id v151 = v96;
        uint64_t v154 = 1000 * k;
        v97 = v125;
        v152 = v97;
        v153 = v159;
        id obja = (id)objc_claimAutoreleasedReturnValue( +[CKKSResultOperation named:withBlock:]( &OBJC_CLASS___CKKSResultOperation,  "named:withBlock:",  v95,  v150));

        -[CKKSGroupOperation dependOnBeforeGroupFinished:](val, "dependOnBeforeGroupFinished:", obja);
        v98 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
        v99 = (char *)[v96 count];
        else {
          uint64_t v100 = (uint64_t)&v99[-v92];
        }
        v101 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray subarrayWithRange:](v84, "subarrayWithRange:", v92, v100));
        __int128 v148 = 0u;
        __int128 v149 = 0u;
        __int128 v146 = 0u;
        __int128 v147 = 0u;
        id v102 = v101;
        id v103 = [v102 countByEnumeratingWithState:&v146 objects:v177 count:16];
        if (v103)
        {
          uint64_t v104 = *(void *)v147;
          do
          {
            for (m = 0LL; m != v103; m = (char *)m + 1)
            {
              if (*(void *)v147 != v104) {
                objc_enumerationMutation(v102);
              }
              v106 = *(void **)(*((void *)&v146 + 1) + 8LL * (void)m);
              v107 = (void *)objc_claimAutoreleasedReturnValue([v106 recordID]);
              -[NSMutableDictionary setObject:forKeyedSubscript:](v98, "setObject:forKeyedSubscript:", v106, v107);
            }

            id v103 = [v102 countByEnumeratingWithState:&v146 objects:v177 count:16];
          }

          while (v103);
        }

        v108 = -[CKModifyRecordsOperation initWithRecordsToSave:recordIDsToDelete:]( objc_alloc(&OBJC_CLASS___CKModifyRecordsOperation),  "initWithRecordsToSave:recordIDsToDelete:",  v102,  0LL);
        -[CKModifyRecordsOperation setAtomic:](v108, "setAtomic:", 1LL);
        -[CKModifyRecordsOperation setLongLived:](v108, "setLongLived:", 0LL);
        v109 = (void *)objc_claimAutoreleasedReturnValue(-[CKModifyRecordsOperation configuration](v108, "configuration"));
        [v109 setIsCloudKitSupportOperation:1];

        -[CKModifyRecordsOperation setQualityOfService:](v108, "setQualityOfService:", 25LL);
        v144[0] = _NSConcreteStackBlock;
        v144[1] = 3221225472LL;
        v144[2] = sub_100161540;
        v144[3] = &unk_100290EB8;
        id v110 = v134;
        id v145 = v110;
        -[CKModifyRecordsOperation setPerRecordSaveBlock:](v108, "setPerRecordSaveBlock:", v144);
        id location = (id)0xAAAAAAAAAAAAAAAALL;
        objc_initWeak(&location, val);
        v135[0] = _NSConcreteStackBlock;
        v135[1] = 3221225472LL;
        v135[2] = sub_1001616A8;
        v135[3] = &unk_100290F08;
        objc_copyWeak(&v142, &location);
        id v136 = v110;
        v140 = buf;
        v141 = v159;
        v137 = v97;
        v111 = v98;
        v138 = v111;
        id v112 = obja;
        id v139 = v112;
        -[CKModifyRecordsOperation setModifyRecordsCompletionBlock:](v108, "setModifyRecordsCompletionBlock:", v135);
        v113 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSHealTLKSharesOperation ckOperations](val, "ckOperations"));
        -[CKModifyRecordsOperation linearDependencies:](v108, "linearDependencies:", v113);

        v114 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSHealTLKSharesOperation setResultStateOperation](val, "setResultStateOperation"));
        [v114 addDependency:v112];

        v115 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSHealTLKSharesOperation deps](val, "deps"));
        v116 = (void *)objc_claimAutoreleasedReturnValue([v115 ckdatabase]);
        [v116 addOperation:v108];

        objc_destroyWeak(&v142);
        objc_destroyWeak(&location);
      }

      _Block_object_dispose(v159, 8);
      _Block_object_dispose(buf, 8);
      id obj = 0LL;
    }

    else
    {
      v120 = (void *)objc_claimAutoreleasedReturnValue([v134 zoneID]);
      v121 = (void *)objc_claimAutoreleasedReturnValue([v120 zoneName]);
      id v122 = sub_1000AA6AC(@"ckksshare", v121);
      v123 = (os_log_s *)objc_claimAutoreleasedReturnValue(v122);

      if (os_log_type_enabled(v123, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        *(void *)&uint8_t buf[4] = obj;
        _os_log_impl( (void *)&_mh_execute_header,  v123,  OS_LOG_TYPE_DEFAULT,  "New shares won't resolve the share issue; erroring to avoid infinite loops: %@",
          buf,
          0xCu);
      }

      [v134 setViewKeyHierarchyState:@"error"];
    }
  }

  else
  {
    v117 = (void *)objc_claimAutoreleasedReturnValue([v134 zoneID]);
    v118 = (void *)objc_claimAutoreleasedReturnValue([v117 zoneName]);
    id v119 = sub_1000AA6AC(@"ckksshare", v118);
    id obj = (id)objc_claimAutoreleasedReturnValue(v119);

    if (os_log_type_enabled((os_log_t)obj, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)obj,  OS_LOG_TYPE_DEFAULT,  "Don't believe we need to change any TLKShares, stopping",  buf,  2u);
    }
  }

- (BOOL)areNewSharesSufficient:(id)a3 trustStates:(id)a4 error:(id *)a5
{
  id v35 = a3;
  __int128 v37 = 0u;
  __int128 v38 = 0u;
  __int128 v39 = 0u;
  __int128 v40 = 0u;
  id obj = a4;
  id v8 = [obj countByEnumeratingWithState:&v37 objects:v43 count:16];
  if (v8)
  {
    id v9 = v8;
    unsigned int v32 = a5;
    uint64_t v10 = *(void *)v38;
    p_superclass = &OBJC_CLASS___CKKSProcessReceivedKeysOperation.superclass;
LABEL_3:
    uint64_t v12 = 0LL;
    id v33 = v9;
    while (1)
    {
      if (*(void *)v38 != v10) {
        objc_enumerationMutation(obj);
      }
      v13 = *(void **)(*((void *)&v37 + 1) + 8 * v12);
      uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSHealTLKSharesOperation deps](self, "deps"));
      v15 = (void *)objc_claimAutoreleasedReturnValue([v14 databaseProvider]);
      id v36 = 0LL;
      id v16 = (void *)objc_claimAutoreleasedReturnValue( [p_superclass + 39 filterTrustedPeers:v13 missingTLKSharesFor:v35 databaseProvider:v15 error:&v36]);
      id v17 = v36;

      if (v16) {
        BOOL v18 = v17 == 0LL;
      }
      else {
        BOOL v18 = 0;
      }
      if (!v18)
      {
        if ([v13 essential])
        {
          if (v32)
          {
            id v17 = v17;
            id *v32 = v17;
          }

          goto LABEL_23;
        }

        uint64_t v19 = v10;
        v20 = p_superclass;
        v21 = self;
        uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue([v35 tlk]);
        id v23 = (void *)objc_claimAutoreleasedReturnValue([v22 zoneName]);
        id v24 = sub_1000AA6AC(@"ckksshare", v23);
        v25 = (os_log_s *)objc_claimAutoreleasedReturnValue(v24);

        if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          v42 = v13;
          _os_log_impl( (void *)&_mh_execute_header,  v25,  OS_LOG_TYPE_DEFAULT,  "Failed to find peers for nonessential system: %@",  buf,  0xCu);
        }

        self = v21;
        p_superclass = v20;
        uint64_t v10 = v19;
        id v9 = v33;
      }

      if ([v16 count])
      {
        v27 = (void *)objc_claimAutoreleasedReturnValue([v35 tlk]);
        unsigned __int8 v28 = (void *)objc_claimAutoreleasedReturnValue([v27 zoneName]);
        id v29 = sub_1000AA6AC(@"ckksshare", v28);
        unsigned int v30 = (os_log_s *)objc_claimAutoreleasedReturnValue(v29);

        if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          v42 = v16;
          _os_log_impl( (void *)&_mh_execute_header,  v30,  OS_LOG_TYPE_DEFAULT,  "New share set is missing shares for peers: %@",  buf,  0xCu);
        }

LABEL_23:
        BOOL v26 = 0;
        goto LABEL_24;
      }

      if (v9 == (id)++v12)
      {
        id v9 = [obj countByEnumeratingWithState:&v37 objects:v43 count:16];
        if (v9) {
          goto LABEL_3;
        }
        break;
      }
    }
  }

  BOOL v26 = 1;
LABEL_24:

  return v26;
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

- (CKKSOperationDependencies)deps
{
  return (CKKSOperationDependencies *)objc_getProperty(self, a2, 150LL, 1);
}

- (void)setDeps:(id)a3
{
}

- (NSHashTable)ckOperations
{
  return (NSHashTable *)objc_getProperty(self, a2, 158LL, 1);
}

- (void)setCkOperations:(id)a3
{
}

- (CKKSResultOperation)setResultStateOperation
{
  return (CKKSResultOperation *)objc_getProperty(self, a2, 166LL, 1);
}

- (void)setSetResultStateOperation:(id)a3
{
}

- (BOOL)cloudkitWriteFailures
{
  return (uint64_t)self->super._startOperation & 1;
}

- (void)setCloudkitWriteFailures:(BOOL)a3
{
  LOBYTE(self->super._startOperation) = a3;
}

- (BOOL)failedDueToLockState
{
  return BYTE1(self->super._startOperation) & 1;
}

- (void)setFailedDueToLockState:(BOOL)a3
{
  BYTE1(self->super._startOperation) = a3;
}

- (BOOL)failedDueToEssentialTrustState
{
  return BYTE2(self->super._startOperation) & 1;
}

- (void)setFailedDueToEssentialTrustState:(BOOL)a3
{
  BYTE2(self->super._startOperation) = a3;
}

- (void).cxx_destruct
{
}

+ (id)createMissingKeyShares:(id)a3 trustStates:(id)a4 databaseProvider:(id)a5 error:(id *)a6
{
  id v32 = a3;
  id v9 = a4;
  id v10 = a5;
  __int128 v38 = 0u;
  __int128 v39 = 0u;
  __int128 v40 = 0u;
  __int128 v41 = 0u;
  id obj = v9;
  id v11 = [v9 countByEnumeratingWithState:&v38 objects:v46 count:16];
  if (v11)
  {
    id v12 = v11;
    id v31 = a6;
    id v34 = 0LL;
    id v13 = 0LL;
    uint64_t v14 = *(void *)v39;
    v15 = v32;
    do
    {
      for (i = 0LL; i != v12; i = (char *)i + 1)
      {
        if (*(void *)v39 != v14) {
          objc_enumerationMutation(obj);
        }
        uint64_t v17 = *(void *)(*((void *)&v38 + 1) + 8LL * (void)i);
        id v37 = 0LL;
        BOOL v18 = (void *)objc_claimAutoreleasedReturnValue([a1 createMissingKeyShares:v15 peers:v17 databaseProvider:v10 error:&v37]);
        id v19 = v37;
        v20 = v19;
        if (v18) {
          BOOL v21 = v19 == 0LL;
        }
        else {
          BOOL v21 = 0;
        }
        if (v21)
        {
          if (v13)
          {
            uint64_t v29 = objc_claimAutoreleasedReturnValue([v13 setByAddingObjectsFromSet:v18]);

            id v13 = (id)v29;
          }

          else
          {
            id v13 = v18;
          }
        }

        else
        {
          id v35 = v13;
          id v22 = v12;
          uint64_t v23 = v14;
          id v24 = v10;
          v25 = (void *)objc_claimAutoreleasedReturnValue([v15 tlk]);
          BOOL v26 = (void *)objc_claimAutoreleasedReturnValue([v25 zoneName]);
          id v27 = sub_1000AA6AC(@"ckksshare", v26);
          unsigned __int8 v28 = (os_log_s *)objc_claimAutoreleasedReturnValue(v27);

          if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412546;
            uint64_t v43 = v17;
            __int16 v44 = 2112;
            id v45 = v20;
            _os_log_impl( (void *)&_mh_execute_header,  v28,  OS_LOG_TYPE_DEFAULT,  "Unable to create shares for trust set %@: %@",  buf,  0x16u);
          }

          if (!v34) {
            id v34 = v20;
          }
          id v10 = v24;
          v15 = v32;
          uint64_t v14 = v23;
          id v12 = v22;
          id v13 = v35;
        }
      }

      id v12 = [obj countByEnumeratingWithState:&v38 objects:v46 count:16];
    }

    while (v12);
    if (v13)
    {
      id v11 = v34;
    }

    else
    {
      id v11 = v34;
      if (v31 && v34)
      {
        id v11 = v34;
        id v13 = 0LL;
        *id v31 = v11;
      }
    }
  }

  else
  {
    id v13 = 0LL;
    v15 = v32;
  }

  return v13;
}

+ (id)createMissingKeyShares:(id)a3 peers:(id)a4 databaseProvider:(id)a5 error:(id *)a6
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = (void *)objc_claimAutoreleasedReturnValue([v9 tlk]);
  id v13 = (void *)objc_claimAutoreleasedReturnValue([v9 zoneID]);
  uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue([v13 ownerName]);
  id v67 = 0LL;
  uint64_t v15 = objc_claimAutoreleasedReturnValue([v12 ensureKeyLoadedForContextID:v14 cache:0 error:&v67]);
  id v16 = v67;

  v57 = (void *)v15;
  if (v15)
  {
    id v66 = v16;
    uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue( [a1 filterTrustedPeers:v10 missingTLKSharesFor:v9 databaseProvider:v11 error:&v66]);
    id v18 = v66;

    if (v17)
    {
      int v60 = v18;
      id v51 = v11;
      id v56 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](&OBJC_CLASS___NSMutableSet, "set"));
      __int128 v62 = 0u;
      __int128 v63 = 0u;
      __int128 v64 = 0u;
      __int128 v65 = 0u;
      uint64_t v52 = v17;
      id obj = v17;
      id v59 = [obj countByEnumeratingWithState:&v62 objects:v74 count:16];
      if (v59)
      {
        uint64_t v58 = *(void *)v63;
        id v55 = v10;
        while (2)
        {
          for (i = 0LL; i != v59; i = (char *)i + 1)
          {
            if (*(void *)v63 != v58) {
              objc_enumerationMutation(obj);
            }
            v20 = *(void **)(*((void *)&v62 + 1) + 8LL * (void)i);
            BOOL v21 = (void *)objc_claimAutoreleasedReturnValue([v20 publicEncryptionKey]);

            id v22 = (void *)objc_claimAutoreleasedReturnValue([v9 tlk]);
            uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue([v22 zoneName]);
            id v24 = sub_1000AA6AC(@"ckksshare", v23);
            v25 = (os_log_s *)objc_claimAutoreleasedReturnValue(v24);

            BOOL v26 = os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT);
            if (v21)
            {
              if (v26)
              {
                id v27 = (void *)objc_claimAutoreleasedReturnValue([v9 tlk]);
                unsigned __int8 v28 = (void *)objc_claimAutoreleasedReturnValue([v10 currentSelfPeers]);
                uint64_t v29 = (void *)objc_claimAutoreleasedReturnValue([v28 currentSelf]);
                *(_DWORD *)buf = 138412802;
                id v69 = v27;
                __int16 v70 = 2112;
                id v71 = v29;
                __int16 v72 = 2112;
                v73 = v20;
                _os_log_impl( (void *)&_mh_execute_header,  v25,  OS_LOG_TYPE_DEFAULT,  "Creating share of %@ as %@ for %@",  buf,  0x20u);
              }

              unsigned int v30 = v9;
              id v31 = (void *)objc_claimAutoreleasedReturnValue([v9 tlk]);
              id v32 = (void *)objc_claimAutoreleasedReturnValue([v31 contextID]);
              id v33 = (void *)objc_claimAutoreleasedReturnValue([v10 currentSelfPeers]);
              id v34 = (void *)objc_claimAutoreleasedReturnValue([v33 currentSelf]);
              id v61 = v60;
              v25 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[CKKSTLKShareRecord share:contextID:as:to:epoch:poisoned:error:]( &OBJC_CLASS___CKKSTLKShareRecord,  "share:contextID:as:to:epoch:poisoned:error:",  v57,  v32,  v34,  v20,  -1LL,  0LL,  &v61));
              id v18 = v61;

              if (v18)
              {
                id v9 = v30;
                __int128 v46 = (void *)objc_claimAutoreleasedReturnValue([v30 tlk]);
                __int128 v47 = (void *)objc_claimAutoreleasedReturnValue([v46 zoneName]);
                id v48 = sub_1000AA6AC(@"ckksshare", v47);
                uint64_t v49 = (os_log_s *)objc_claimAutoreleasedReturnValue(v48);

                if (os_log_type_enabled(v49, OS_LOG_TYPE_ERROR))
                {
                  *(_DWORD *)buf = 138412546;
                  id v69 = v20;
                  __int16 v70 = 2112;
                  id v71 = v18;
                  _os_log_impl( (void *)&_mh_execute_header,  v49,  OS_LOG_TYPE_ERROR,  "Couldn't create new share for %@: %@",  buf,  0x16u);
                }

                id v10 = v55;
                if (a6) {
                  *a6 = v18;
                }

                id v36 = 0LL;
                id v11 = v51;
                id v35 = v56;
                goto LABEL_31;
              }

              [v56 addObject:v25];
              int v60 = 0LL;
              id v9 = v30;
              id v10 = v55;
            }

            else if (v26)
            {
              *(_DWORD *)buf = 138412290;
              id v69 = v20;
              _os_log_impl( (void *)&_mh_execute_header,  v25,  OS_LOG_TYPE_DEFAULT,  "No need to make TLK for %@; they don't have any encryption keys",
                buf,
                0xCu);
            }
          }

          id v59 = [obj countByEnumeratingWithState:&v62 objects:v74 count:16];
          if (v59) {
            continue;
          }
          break;
        }
      }

      id v35 = v56;
      id v36 = v56;
      id v11 = v51;
      id v18 = v60;
LABEL_31:

      __int128 v41 = v52;
    }

    else
    {
      __int128 v41 = 0LL;
      v42 = (void *)objc_claimAutoreleasedReturnValue([v9 tlk]);
      uint64_t v43 = (void *)objc_claimAutoreleasedReturnValue([v42 zoneName]);
      id v44 = sub_1000AA6AC(@"ckksshare", v43);
      id v45 = (os_log_s *)objc_claimAutoreleasedReturnValue(v44);

      if (os_log_type_enabled(v45, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        id v69 = v18;
        _os_log_impl( (void *)&_mh_execute_header,  v45,  OS_LOG_TYPE_ERROR,  "Unable to find peers missing TLKShares: %@",  buf,  0xCu);
      }

      if (a6)
      {
        id v18 = v18;
        id v36 = 0LL;
        *a6 = v18;
      }

      else
      {
        id v36 = 0LL;
      }
    }

    id v16 = v18;
  }

  else
  {
    id v37 = (void *)objc_claimAutoreleasedReturnValue([v9 tlk]);
    __int128 v38 = (void *)objc_claimAutoreleasedReturnValue([v37 zoneName]);
    id v39 = sub_1000AA6AC(@"ckksshare", v38);
    __int128 v40 = (os_log_s *)objc_claimAutoreleasedReturnValue(v39);

    if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v69 = v16;
      _os_log_impl( (void *)&_mh_execute_header,  v40,  OS_LOG_TYPE_ERROR,  "TLK not loaded; cannot make shares for peers: %@",
        buf,
        0xCu);
    }

    if (a6)
    {
      id v16 = v16;
      id v36 = 0LL;
      *a6 = v16;
    }

    else
    {
      id v36 = 0LL;
    }
  }

  return v36;
}

+ (id)filterTrustedPeers:(id)a3 missingTLKSharesFor:(id)a4 databaseProvider:(id)a5 error:(id *)a6
{
  id v9 = a3;
  id v169 = a4;
  id v161 = a5;
  __int128 v166 = v9;
  id v10 = (void *)objc_claimAutoreleasedReturnValue([v9 currentTrustedPeersError]);

  if (!v10)
  {
    id v16 = (void *)objc_claimAutoreleasedReturnValue([v9 currentSelfPeersError]);

    if (v16)
    {
      uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue([v169 tlk]);
      id v18 = (void *)objc_claimAutoreleasedReturnValue([v17 zoneName]);
      id v19 = sub_1000AA6AC(@"ckksshare", v18);
      v20 = (os_log_s *)objc_claimAutoreleasedReturnValue(v19);

      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      {
        BOOL v21 = (void *)objc_claimAutoreleasedReturnValue([v166 currentSelfPeersError]);
        *(_DWORD *)buf = 138412290;
        *(void *)&uint8_t buf[4] = v21;
        _os_log_impl( (void *)&_mh_execute_header,  v20,  OS_LOG_TYPE_ERROR,  "Couldn't find missing shares because self peers aren't available: %@",  buf,  0xCu);
      }

      if (a6) {
        *a6 = (id)objc_claimAutoreleasedReturnValue([v166 currentSelfPeersError]);
      }
      goto LABEL_12;
    }

    __int128 v156 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](&OBJC_CLASS___NSMutableSet, "set"));
    id v24 = (void *)objc_claimAutoreleasedReturnValue([v9 currentTrustedPeerIDs]);
    v25 = (void *)objc_claimAutoreleasedReturnValue([v9 currentSelfPeers]);
    BOOL v26 = (void *)objc_claimAutoreleasedReturnValue([v25 currentSelf]);
    id v27 = (void *)objc_claimAutoreleasedReturnValue([v26 peerID]);
    unsigned __int8 v28 = [v24 containsObject:v27];

    if ((v28 & 1) != 0)
    {
      __int128 v189 = 0u;
      __int128 v190 = 0u;
      __int128 v187 = 0u;
      __int128 v188 = 0u;
      id obj = (id)objc_claimAutoreleasedReturnValue([v166 currentTrustedPeers]);
      id v163 = [obj countByEnumeratingWithState:&v187 objects:v202 count:16];
      if (v163)
      {
        uint64_t v162 = *(void *)v188;
        do
        {
          uint64_t v29 = 0LL;
          do
          {
            if (*(void *)v188 != v162)
            {
              uint64_t v30 = v29;
              objc_enumerationMutation(obj);
              uint64_t v29 = v30;
            }

            uint64_t v164 = v29;
            v170 = *(void **)(*((void *)&v187 + 1) + 8 * v29);
            id v31 = (void *)objc_claimAutoreleasedReturnValue([v169 tlk]);
            id v32 = (void *)objc_claimAutoreleasedReturnValue([v31 zoneName]);
            unsigned __int8 v33 = [v170 shouldHaveView:v32];

            if ((v33 & 1) != 0)
            {
              *(void *)buf = 0LL;
              *(void *)&buf[8] = buf;
              *(void *)&buf[16] = 0x3032000000LL;
              v199 = sub_10016144C;
              v200 = sub_10016145C;
              id v201 = 0LL;
              uint64_t v181 = 0LL;
              int v182 = &v181;
              uint64_t v183 = 0x3032000000LL;
              v184 = sub_10016144C;
              v185 = sub_10016145C;
              id v186 = 0LL;
              if (v161)
              {
                v176[0] = _NSConcreteStackBlock;
                v176[1] = 3221225472LL;
                v176[2] = sub_100163964;
                v176[3] = &unk_100291798;
                v178 = &v181;
                v176[4] = v170;
                id v177 = v169;
                uint64_t v179 = buf;
                [v161 dispatchSyncWithReadOnlySQLTransaction:v176];
              }

              else
              {
                __int128 v38 = objc_autoreleasePoolPush();
                id v39 = (void *)objc_claimAutoreleasedReturnValue([v170 peerID]);
                __int128 v40 = (void *)objc_claimAutoreleasedReturnValue([v169 tlk]);
                __int128 v41 = (void *)objc_claimAutoreleasedReturnValue([v40 contextID]);
                v42 = (void *)objc_claimAutoreleasedReturnValue([v169 tlk]);
                uint64_t v43 = (void *)objc_claimAutoreleasedReturnValue([v42 uuid]);
                id v44 = (void *)objc_claimAutoreleasedReturnValue([v169 tlk]);
                id v45 = (void *)objc_claimAutoreleasedReturnValue([v44 zoneID]);
                __int128 v46 = (id *)(*(void *)&buf[8] + 40LL);
                id v180 = *(id *)(*(void *)&buf[8] + 40LL);
                uint64_t v47 = objc_claimAutoreleasedReturnValue( +[CKKSTLKShareRecord allFor:contextID:keyUUID:zoneID:error:]( &OBJC_CLASS___CKKSTLKShareRecord,  "allFor:contextID:keyUUID:zoneID:error:",  v39,  v41,  v43,  v45,  &v180));
                objc_storeStrong(v46, v180);
                id v48 = (void *)v182[5];
                v182[5] = v47;

                objc_autoreleasePoolPop(v38);
              }

              uint64_t v49 = (void *)v182[5];
              if (!v49 || *(void *)(*(void *)&buf[8] + 40LL))
              {
                id v50 = (void *)objc_claimAutoreleasedReturnValue([v169 tlk]);
                id v51 = (void *)objc_claimAutoreleasedReturnValue([v50 zoneName]);
                id v52 = sub_1000AA6AC(@"ckksshare", v51);
                id v53 = (os_log_s *)objc_claimAutoreleasedReturnValue(v52);

                if (os_log_type_enabled(v53, OS_LOG_TYPE_ERROR))
                {
                  v54 = *(void **)(*(void *)&buf[8] + 40LL);
                  *(_DWORD *)v191 = 138412546;
                  id v192 = v170;
                  __int16 v193 = 2112;
                  v194 = v54;
                  _os_log_impl( (void *)&_mh_execute_header,  v53,  OS_LOG_TYPE_ERROR,  "Unable to load existing TLKShares for peer (%@): %@",  v191,  0x16u);
                }

@end