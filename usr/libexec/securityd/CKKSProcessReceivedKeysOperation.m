@interface CKKSProcessReceivedKeysOperation
- (BOOL)allowFullRefetchResult;
- (CKKSOperationDependencies)deps;
- (CKKSProcessReceivedKeysOperation)initWithDependencies:(id)a3 allowFullRefetchResult:(BOOL)a4 intendedState:(id)a5 errorState:(id)a6;
- (OctagonStateString)intendedState;
- (OctagonStateString)nextState;
- (id)checkExistingKeyHierarchy:(id)a3 zoneID:(id)a4 currentTrustStates:(id)a5 error:(id *)a6;
- (id)processRemoteKeys:(id)a3 viewState:(id)a4 currentTrustStates:(id)a5 error:(id *)a6;
- (void)main;
- (void)setAllowFullRefetchResult:(BOOL)a3;
- (void)setDeps:(id)a3;
- (void)setNextState:(id)a3;
@end

@implementation CKKSProcessReceivedKeysOperation

- (CKKSProcessReceivedKeysOperation)initWithDependencies:(id)a3 allowFullRefetchResult:(BOOL)a4 intendedState:(id)a5 errorState:(id)a6
{
  id v11 = a3;
  id v12 = a5;
  id v13 = a6;
  v17.receiver = self;
  v17.super_class = (Class)&OBJC_CLASS___CKKSProcessReceivedKeysOperation;
  v14 = -[CKKSResultOperation init](&v17, "init");
  v15 = v14;
  if (v14)
  {
    objc_storeStrong(&v14->super._finishingBlock, a3);
    LOBYTE(v15->super._descriptionUnderlyingError) = a4;
    objc_storeStrong((id *)&v15->super._successDependencies, a5);
    objc_storeStrong((id *)&v15->super._timeoutQueue, a6);
  }

  return v15;
}

- (void)main
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSProcessReceivedKeysOperation deps](self, "deps"));
  v3 = (void *)objc_claimAutoreleasedReturnValue([v2 personaAdapter]);
  [v3 prepareThreadForKeychainAPIUseForPersonaIdentifier:0];

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSProcessReceivedKeysOperation deps](self, "deps"));
  v53 = (void *)objc_claimAutoreleasedReturnValue([v4 databaseProvider]);

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSProcessReceivedKeysOperation deps](self, "deps"));
  v52 = (void *)objc_claimAutoreleasedReturnValue([v5 currentTrustStates]);

  v6 = objc_alloc(&OBJC_CLASS___AAFAnalyticsEventSecurity);
  uint64_t v98 = kSecurityRTCFieldNumViews;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSProcessReceivedKeysOperation deps](self, "deps"));
  v8 = (void *)objc_claimAutoreleasedReturnValue([v7 activeManagedViews]);
  v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInteger:]( NSNumber,  "numberWithUnsignedInteger:",  [v8 count]));
  v99 = v9;
  v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v99,  &v98,  1LL));
  id v11 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSProcessReceivedKeysOperation deps](self, "deps"));
  id v12 = (void *)objc_claimAutoreleasedReturnValue([v11 activeAccount]);
  id v13 = (void *)objc_claimAutoreleasedReturnValue([v12 altDSID]);
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSProcessReceivedKeysOperation deps](self, "deps"));
  id v15 = [v14 sendMetric];
  v54 = -[AAFAnalyticsEventSecurity initWithCKKSMetrics:altDSID:eventName:testsAreEnabled:category:sendMetric:]( v6,  "initWithCKKSMetrics:altDSID:eventName:testsAreEnabled:category:sendMetric:",  v10,  v13,  kSecurityRTCEventNameProcessReceivedKeys,  0LL,  kSecurityRTCEventCategoryAccountDataAccessRecovery,  v15);

  uint64_t v87 = 0LL;
  v88 = &v87;
  uint64_t v89 = 0x2020000000LL;
  char v90 = 1;
  uint64_t v83 = 0LL;
  v84 = &v83;
  uint64_t v85 = 0x2020000000LL;
  int v86 = 0;
  __int128 v79 = 0u;
  __int128 v80 = 0u;
  __int128 v81 = 0u;
  __int128 v82 = 0u;
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSProcessReceivedKeysOperation deps](self, "deps"));
  id obj = (id)objc_claimAutoreleasedReturnValue([v16 activeManagedViews]);

  id v17 = [obj countByEnumeratingWithState:&v79 objects:v97 count:16];
  if (v17)
  {
    uint64_t v51 = *(void *)v80;
    *(void *)&__int128 v18 = 138412546LL;
    __int128 v49 = v18;
    do
    {
      v19 = 0LL;
      do
      {
        if (*(void *)v80 != v51) {
          objc_enumerationMutation(obj);
        }
        v20 = *(void **)(*((void *)&v79 + 1) + 8LL * (void)v19);
        uint64_t v73 = 0LL;
        v74 = &v73;
        uint64_t v75 = 0x3032000000LL;
        v76 = sub_10015AFC4;
        v77 = sub_10015AFD4;
        id v78 = 0LL;
        v71[0] = 0LL;
        v71[1] = v71;
        v71[2] = 0x3032000000LL;
        v71[3] = sub_10015AFC4;
        v71[4] = sub_10015AFD4;
        id v72 = 0LL;
        uint64_t v65 = 0LL;
        v66 = &v65;
        uint64_t v67 = 0x3032000000LL;
        v68 = sub_10015AFC4;
        v69 = sub_10015AFD4;
        id v70 = 0LL;
        v57[0] = _NSConcreteStackBlock;
        v57[1] = 3221225472LL;
        v57[2] = sub_10015AFDC;
        v57[3] = &unk_100290DD0;
        v57[4] = self;
        v57[5] = v20;
        v60 = &v87;
        v21 = v54;
        v58 = v21;
        v61 = &v83;
        v62 = &v73;
        id v22 = v52;
        id v59 = v22;
        v63 = v71;
        v64 = &v65;
        [v53 dispatchSyncWithSQLTransaction:v57];
        v23 = (void *)v74[5];
        if (!v23 || [v23 isEqualToString:@"ready"])
        {
          v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "zoneID", v49));
          v25 = (void *)objc_claimAutoreleasedReturnValue([v24 zoneName]);
          id v26 = sub_1000AA6AC(@"ckkskey", v25);
          v27 = (os_log_s *)objc_claimAutoreleasedReturnValue(v26);

          if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG))
          {
            *(_WORD *)buf = 0;
            _os_log_debug_impl( (void *)&_mh_execute_header,  v27,  OS_LOG_TYPE_DEBUG,  "Checking consistency of key hierarchy",  buf,  2u);
          }

          uint64_t v28 = v66[5];
          v29 = (void *)objc_claimAutoreleasedReturnValue([v20 zoneID]);
          id v56 = 0LL;
          uint64_t v30 = objc_claimAutoreleasedReturnValue( -[CKKSProcessReceivedKeysOperation checkExistingKeyHierarchy:zoneID:currentTrustStates:error:]( self,  "checkExistingKeyHierarchy:zoneID:currentTrustStates:error:",  v28,  v29,  v22,  &v56));
          id v31 = v56;
          v32 = (void *)v74[5];
          v74[5] = v30;

          -[AAFAnalyticsEventSecurity populateUnderlyingErrorsStartingWithRootError:]( v21,  "populateUnderlyingErrorsStartingWithRootError:",  v31);
          v33 = (void *)objc_claimAutoreleasedReturnValue([v20 zoneID]);
          v34 = (void *)objc_claimAutoreleasedReturnValue([v33 zoneName]);
          id v35 = sub_1000AA6AC(@"ckkskey", v34);
          v36 = (os_log_s *)objc_claimAutoreleasedReturnValue(v35);

          if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
          {
            uint64_t v37 = v74[5];
            *(_DWORD *)buf = v49;
            uint64_t v94 = v37;
            __int16 v95 = 2112;
            id v96 = v31;
            _os_log_impl( (void *)&_mh_execute_header,  v36,  OS_LOG_TYPE_DEFAULT,  "Key hierarchy is '%@' (error: %@)",  buf,  0x16u);
          }
        }

        objc_msgSend(v20, "setViewKeyHierarchyState:", v74[5], v49);

        _Block_object_dispose(&v65, 8);
        _Block_object_dispose(v71, 8);

        _Block_object_dispose(&v73, 8);
        v19 = (char *)v19 + 1;
      }

      while (v17 != v19);
      id v17 = [obj countByEnumeratingWithState:&v79 objects:v97 count:16];
    }

    while (v17);
  }

  v38 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSProcessReceivedKeysOperation deps](self, "deps"));
  v39 = (void *)objc_claimAutoreleasedReturnValue([v38 activeManagedViews]);
  if ([v39 count])
  {
    unint64_t v40 = *((int *)v84 + 6);
    v41 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSProcessReceivedKeysOperation deps](self, "deps"));
    v42 = (void *)objc_claimAutoreleasedReturnValue([v41 activeManagedViews]);
    unint64_t v43 = (unint64_t)[v42 count];

    unint64_t v44 = v40 / v43;
  }

  else
  {
    unint64_t v44 = 0LL;
  }

  v91[0] = kSecurityRTCFieldAvgRemoteKeys;
  v45 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", v44));
  v91[1] = kSecurityRTCFieldTotalRemoteKeys;
  v92[0] = v45;
  v46 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", *((unsigned int *)v84 + 6)));
  v92[1] = v46;
  v47 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v92,  v91,  2LL));
  -[AAFAnalyticsEventSecurity addMetrics:](v54, "addMetrics:", v47);

  +[SecurityAnalyticsReporterRTC sendMetricWithEvent:success:error:]( &OBJC_CLASS___SecurityAnalyticsReporterRTC,  "sendMetricWithEvent:success:error:",  v54,  *((unsigned __int8 *)v88 + 24),  0LL);
  v48 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSProcessReceivedKeysOperation intendedState](self, "intendedState"));
  -[CKKSProcessReceivedKeysOperation setNextState:](self, "setNextState:", v48);

  _Block_object_dispose(&v83, 8);
  _Block_object_dispose(&v87, 8);
}

- (id)processRemoteKeys:(id)a3 viewState:(id)a4 currentTrustStates:(id)a5 error:(id *)a6
{
  id v193 = a3;
  id v8 = a4;
  id v190 = a5;
  uint64_t v9 = objc_claimAutoreleasedReturnValue([v8 contextID]);
  v10 = (void *)objc_claimAutoreleasedReturnValue([v8 zoneID]);
  id v11 = (void *)objc_claimAutoreleasedReturnValue([v10 zoneName]);
  id v12 = sub_1000AA6AC(@"ckkskey", v11);
  id v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);

  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412290;
    id v228 = v193;
    _os_log_debug_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEBUG, "remote keys: %@", buf, 0xCu);
  }

  v14 = (void *)objc_claimAutoreleasedReturnValue([v8 zoneID]);
  id v223 = 0LL;
  id v15 = (void *)objc_claimAutoreleasedReturnValue( +[CKKSCurrentKeyPointer tryFromDatabase:contextID:zoneID:error:]( &OBJC_CLASS___CKKSCurrentKeyPointer,  "tryFromDatabase:contextID:zoneID:error:",  @"tlk",  v9,  v14,  &v223));
  id v16 = v223;

  id v17 = (void *)objc_claimAutoreleasedReturnValue([v8 zoneID]);
  id v222 = v16;
  v191 = (void *)objc_claimAutoreleasedReturnValue( +[CKKSCurrentKeyPointer tryFromDatabase:contextID:zoneID:error:]( &OBJC_CLASS___CKKSCurrentKeyPointer,  "tryFromDatabase:contextID:zoneID:error:",  @"classA",  v9,  v17,  &v222));
  id v18 = v222;

  v19 = (void *)objc_claimAutoreleasedReturnValue([v8 zoneID]);
  id v221 = v18;
  v196 = (void *)objc_claimAutoreleasedReturnValue( +[CKKSCurrentKeyPointer tryFromDatabase:contextID:zoneID:error:]( &OBJC_CLASS___CKKSCurrentKeyPointer,  "tryFromDatabase:contextID:zoneID:error:",  @"classC",  v9,  v19,  &v221));
  id v20 = v221;

  v21 = (void *)objc_claimAutoreleasedReturnValue([v15 currentKeyUUID]);
  id v22 = (void *)v9;
  if (v21)
  {
    v23 = (void *)objc_claimAutoreleasedReturnValue([v15 currentKeyUUID]);
    v24 = (void *)objc_claimAutoreleasedReturnValue([v8 zoneID]);
    id v220 = v20;
    v195 = (void *)objc_claimAutoreleasedReturnValue( +[CKKSKey tryFromDatabaseAnyState:contextID:zoneID:error:]( &OBJC_CLASS___CKKSKey,  "tryFromDatabaseAnyState:contextID:zoneID:error:",  v23,  v9,  v24,  &v220));
    id v25 = v220;

    id v20 = v25;
  }

  else
  {
    v195 = 0LL;
  }

  id v26 = v15;

  v27 = v191;
  uint64_t v28 = (void *)objc_claimAutoreleasedReturnValue([v191 currentKeyUUID]);
  if (v28)
  {
    v29 = (void *)objc_claimAutoreleasedReturnValue([v191 currentKeyUUID]);
    uint64_t v30 = (void *)objc_claimAutoreleasedReturnValue([v8 zoneID]);
    id v219 = v20;
    v194 = (void *)objc_claimAutoreleasedReturnValue( +[CKKSKey tryFromDatabaseAnyState:contextID:zoneID:error:]( &OBJC_CLASS___CKKSKey,  "tryFromDatabaseAnyState:contextID:zoneID:error:",  v29,  v22,  v30,  &v219));
    id v31 = v219;

    id v20 = v31;
  }

  else
  {
    v194 = 0LL;
  }

  v32 = v196;
  v33 = (void *)objc_claimAutoreleasedReturnValue([v196 currentKeyUUID]);
  if (v33)
  {
    v34 = (void *)objc_claimAutoreleasedReturnValue([v196 currentKeyUUID]);
    id v35 = (void *)objc_claimAutoreleasedReturnValue([v8 zoneID]);
    id v218 = v20;
    v192 = (void *)objc_claimAutoreleasedReturnValue( +[CKKSKey tryFromDatabaseAnyState:contextID:zoneID:error:]( &OBJC_CLASS___CKKSKey,  "tryFromDatabaseAnyState:contextID:zoneID:error:",  v34,  v22,  v35,  &v218));
    id v36 = v218;

    v32 = v196;
    id v20 = v36;
  }

  else
  {
    v192 = 0LL;
  }

  if (!v26) {
    goto LABEL_51;
  }
  if (!v191) {
    goto LABEL_51;
  }
  if (!v32) {
    goto LABEL_51;
  }
  uint64_t v37 = objc_claimAutoreleasedReturnValue([v26 currentKeyUUID]);
  if (!v37) {
    goto LABEL_51;
  }
  v38 = (void *)v37;
  uint64_t v39 = objc_claimAutoreleasedReturnValue([v191 currentKeyUUID]);
  if (!v39)
  {

LABEL_51:
    id v72 = (void *)objc_claimAutoreleasedReturnValue([v8 zoneID]);
    uint64_t v73 = (void *)objc_claimAutoreleasedReturnValue([v72 zoneName]);
    id v74 = sub_1000AA6AC(@"ckkskey", v73);
    uint64_t v75 = (void *)objc_claimAutoreleasedReturnValue(v74);

    if (!os_log_type_enabled((os_log_t)v75, OS_LOG_TYPE_ERROR))
    {
LABEL_54:

      if (a6) {
        *a6 = v20;
      }
      __int128 v79 = @"unhealthy";
      __int128 v80 = @"unhealthy";
      __int128 v81 = 0LL;
      v61 = 0LL;
      goto LABEL_57;
    }

    *(_DWORD *)buf = 138413314;
    id v228 = v26;
    __int16 v229 = 2112;
    id v230 = v191;
    __int16 v231 = 2112;
    v232 = v32;
    __int16 v233 = 2112;
    id v234 = v20;
    __int16 v235 = 2112;
    id v236 = v20;
    v76 = "no current pointer for some keyclass: tlk:%@ a:%@ c:%@ %@ %@";
    v77 = (os_log_s *)v75;
    uint32_t v78 = 52;
LABEL_53:
    _os_log_impl((void *)&_mh_execute_header, v77, OS_LOG_TYPE_ERROR, v76, buf, v78);
    goto LABEL_54;
  }

  unint64_t v40 = (void *)v39;
  v41 = (void *)objc_claimAutoreleasedReturnValue([v32 currentKeyUUID]);

  if (!v41 || !v195 || !v194 || !v192) {
    goto LABEL_51;
  }
  v187 = v8;
  __int128 v216 = 0u;
  __int128 v217 = 0u;
  __int128 v214 = 0u;
  __int128 v215 = 0u;
  id v42 = v193;
  id v43 = [v42 countByEnumeratingWithState:&v214 objects:v226 count:16];
  if (!v43)
  {

LABEL_64:
    id v8 = v187;
    v91 = (void *)objc_claimAutoreleasedReturnValue([v187 zoneID]);
    v92 = (void *)objc_claimAutoreleasedReturnValue([v91 zoneName]);
    id v93 = sub_1000AA6AC(@"ckkskey", v92);
    uint64_t v75 = (void *)objc_claimAutoreleasedReturnValue(v93);

    v32 = v196;
    if (!os_log_type_enabled((os_log_t)v75, OS_LOG_TYPE_ERROR)) {
      goto LABEL_54;
    }
    *(_DWORD *)buf = 138412290;
    id v228 = v26;
    v76 = "couldn't find active TLK: %@";
    v77 = (os_log_s *)v75;
    uint32_t v78 = 12;
    goto LABEL_53;
  }

  id v44 = v43;
  v186 = v22;
  v197 = 0LL;
  uint64_t v45 = *(void *)v215;
  do
  {
    for (i = 0LL; i != v44; i = (char *)i + 1)
    {
      if (*(void *)v215 != v45) {
        objc_enumerationMutation(v42);
      }
      v47 = *(void **)(*((void *)&v214 + 1) + 8LL * (void)i);
      v48 = (void *)objc_claimAutoreleasedReturnValue([v47 uuid]);
      __int128 v49 = v26;
      v50 = (void *)objc_claimAutoreleasedReturnValue([v26 currentKeyUUID]);
      unsigned int v51 = [v48 isEqualToString:v50];

      if (v51)
      {
        if (![v47 wrapsSelf])
        {
          uint64_t v83 = (void *)objc_claimAutoreleasedReturnValue([v47 parentKeyUUID]);
          v84 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"current TLK doesn't wrap itself: %@ %@",  v47,  v83));
          uint64_t v85 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:description:underlying:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:description:underlying:",  @"CKKSErrorDomain",  18LL,  v84,  v20));

          int v86 = (void *)objc_claimAutoreleasedReturnValue([v187 zoneID]);
          uint64_t v87 = (void *)objc_claimAutoreleasedReturnValue([v86 zoneName]);
          id v88 = sub_1000AA6AC(@"ckkskey", v87);
          uint64_t v89 = (os_log_s *)objc_claimAutoreleasedReturnValue(v88);

          if (os_log_type_enabled(v89, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412290;
            id v228 = v85;
            _os_log_impl( (void *)&_mh_execute_header,  v89,  OS_LOG_TYPE_ERROR,  "Proposed TLK doesn't wrap self: %@",  buf,  0xCu);
          }

          id v22 = v186;
          id v26 = v49;
          v27 = v191;
          if (a6) {
            *a6 = v85;
          }
          __int128 v79 = @"unhealthy";
          char v90 = @"unhealthy";

          v61 = 0LL;
          id v8 = v187;
          v32 = v196;
          __int128 v81 = v197;
          goto LABEL_57;
        }

        id v52 = v47;

        v197 = v52;
      }

      id v26 = v49;
    }

    id v44 = [v42 countByEnumeratingWithState:&v214 objects:v226 count:16];
  }

  while (v44);

  id v22 = v186;
  v27 = v191;
  if (!v197) {
    goto LABEL_64;
  }
  id v213 = v20;
  unsigned __int8 v53 = [v197 validTLK:&v213];
  id v184 = v213;

  v32 = v196;
  if ((v53 & 1) == 0)
  {
    uint64_t v94 = (void *)objc_claimAutoreleasedReturnValue([v187 zoneID]);
    __int16 v95 = (void *)objc_claimAutoreleasedReturnValue([v94 zoneName]);
    id v96 = sub_1000AA6AC(@"ckkskey", v95);
    v97 = (os_log_s *)objc_claimAutoreleasedReturnValue(v96);

    if (os_log_type_enabled(v97, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      id v228 = v197;
      __int16 v229 = 2112;
      id v230 = v184;
      _os_log_impl( (void *)&_mh_execute_header,  v97,  OS_LOG_TYPE_ERROR,  "CKKS claims %@ is not a valid TLK: %@",  buf,  0x16u);
    }

    uint64_t v98 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:description:underlying:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:description:underlying:",  @"CKKSErrorDomain",  34LL,  @"invalid TLK from CloudKit",  v184));
    v99 = v98;
    id v26 = v49;
    if (a6) {
      *a6 = v98;
    }
    __int128 v79 = @"error";
    v100 = @"error";

    v61 = 0LL;
    id v20 = v184;
    id v8 = v187;
    __int128 v81 = v197;
    goto LABEL_57;
  }

  id v212 = 0LL;
  unsigned __int8 v54 = [v197 tlkMaterialPresentOrRecoverableViaTLKShareForContextID:v186 forTrustStates:v190 error:&v212];
  id v55 = v212;
  v177 = v55;
  if ((v54 & 1) == 0)
  {
    id v101 = v55;
    v102 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSProcessReceivedKeysOperation deps](self, "deps"));
    v103 = (void *)objc_claimAutoreleasedReturnValue([v102 lockStateTracker]);
    unsigned int v104 = [v103 isLockedError:v101];

    v105 = (void *)objc_claimAutoreleasedReturnValue([v187 zoneID]);
    v106 = (void *)objc_claimAutoreleasedReturnValue([v105 zoneName]);
    id v107 = sub_1000AA6AC(@"ckkskey", v106);
    v108 = (os_log_s *)objc_claimAutoreleasedReturnValue(v107);

    BOOL v109 = os_log_type_enabled(v108, OS_LOG_TYPE_DEFAULT);
    v110 = v101;
    if (v104)
    {
      id v26 = v49;
      if (v109)
      {
        *(_DWORD *)buf = 138412290;
        id v228 = v197;
        _os_log_impl( (void *)&_mh_execute_header,  v108,  OS_LOG_TYPE_DEFAULT,  "Received a TLK(%@), but keybag appears to be locked. Entering a waiting state.",  buf,  0xCu);
      }

      id v8 = v187;
      if (a6) {
        *a6 = v110;
      }
      __int128 v79 = @"waitforunlock";
      v111 = @"waitforunlock";
    }

    else
    {
      v112 = v101;
      if (v109)
      {
        *(_DWORD *)buf = 138412546;
        id v228 = v197;
        __int16 v229 = 2112;
        id v230 = v184;
        _os_log_impl( (void *)&_mh_execute_header,  v108,  OS_LOG_TYPE_DEFAULT,  "Received a TLK(%@) which we don't have in the local keychain: %@",  buf,  0x16u);
      }

      v113 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSProcessReceivedKeysOperation deps](self, "deps"));
      id v211 = 0LL;
      unsigned __int8 v114 = [v113 considerSelfTrusted:v190 error:&v211];
      id v115 = v211;

      if ((v114 & 1) != 0)
      {
        id v26 = v49;
        if (a6) {
          *a6 = v112;
        }
        v116 = &off_100290DF8;
      }

      else
      {
        v143 = (void *)objc_claimAutoreleasedReturnValue([v187 zoneID]);
        v144 = (void *)objc_claimAutoreleasedReturnValue([v143 zoneName]);
        id v145 = sub_1000AA6AC(@"ckkskey", v144);
        v146 = (os_log_s *)objc_claimAutoreleasedReturnValue(v145);

        if (os_log_type_enabled(v146, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          id v228 = v115;
          _os_log_impl( (void *)&_mh_execute_header,  v146,  OS_LOG_TYPE_DEFAULT,  "Not proceeding due to trust system failure: %@",  buf,  0xCu);
        }

        if (a6)
        {
          if (v115)
          {
            *a6 = v115;
          }

          else
          {
            id v175 = objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:description:]( &OBJC_CLASS___NSError, "errorWithDomain:code:description:", @"CKKSErrorDomain", 52LL, @"No trust states available"));
            *a6 = v175;
          }
        }

        v116 = off_100290E78;
        id v26 = v49;
      }

      id v8 = v187;
      __int128 v79 = *v116;
    }

    v61 = 0LL;
    goto LABEL_144;
  }

  __int128 v209 = 0u;
  __int128 v210 = 0u;
  __int128 v207 = 0u;
  __int128 v208 = 0u;
  id obj = v42;
  id v56 = [obj countByEnumeratingWithState:&v207 objects:v225 count:16];
  if (!v56)
  {
    v58 = 0LL;
    goto LABEL_84;
  }

  id v57 = v56;
  v58 = 0LL;
  id v181 = *(id *)v208;
  do
  {
    for (j = 0LL; j != v57; j = (char *)j + 1)
    {
      if (*(id *)v208 != v181) {
        objc_enumerationMutation(obj);
      }
      v60 = *(void **)(*((void *)&v207 + 1) + 8LL * (void)j);
      if (v60 == v197) {
        continue;
      }
      id v206 = 0LL;
      v61 = (void *)objc_claimAutoreleasedReturnValue([v60 topKeyInAnyState:&v206]);
      id v62 = v206;

      if (v62)
      {
        id v183 = v62;
LABEL_113:
        v32 = v196;
        v156 = (void *)objc_claimAutoreleasedReturnValue([v187 zoneID]);
        v157 = (void *)objc_claimAutoreleasedReturnValue([v156 zoneName]);
        id v158 = sub_1000AA6AC(@"ckkskey", v157);
        v159 = (os_log_s *)objc_claimAutoreleasedReturnValue(v158);

        if (os_log_type_enabled(v159, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412546;
          id v228 = v60;
          __int16 v229 = 2112;
          id v230 = v184;
          _os_log_impl((void *)&_mh_execute_header, v159, OS_LOG_TYPE_ERROR, "new key %@ is orphaned (%@)", buf, 0x16u);
        }

        id v26 = v49;
        if (!a6)
        {
          v162 = &off_100290E80;
          id v8 = v187;
          goto LABEL_142;
        }

        v160 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"orphaned key(%@) in hierarchy",  v61));
        id v161 = v183;
        *a6 = (id)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:description:underlying:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:description:underlying:",  @"CKKSErrorDomain",  33LL,  v160,  v183));

        v162 = &off_100290E80;
        id v8 = v187;
LABEL_143:
        __int128 v79 = *v162;

        goto LABEL_144;
      }

      v63 = (void *)objc_claimAutoreleasedReturnValue([v61 uuid]);
      v64 = (void *)objc_claimAutoreleasedReturnValue([v197 uuid]);
      unsigned __int8 v65 = [v63 isEqual:v64];

      if ((v65 & 1) == 0)
      {
        id v183 = 0LL;
        goto LABEL_113;
      }

      id v205 = 0LL;
      v66 = (void *)objc_claimAutoreleasedReturnValue([v60 unwrapViaKeyHierarchy:&v205]);
      id v67 = v205;

      if (!v66 || v67)
      {
        id v183 = v67;
        if (v67
          && (v163 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSProcessReceivedKeysOperation deps](self, "deps")),
              v164 = (void *)objc_claimAutoreleasedReturnValue([v163 lockStateTracker]),
              unsigned int v165 = [v164 isLockedError:v183],
              v164,
              v163,
              v165))
        {
          v166 = (void *)objc_claimAutoreleasedReturnValue([v187 zoneID]);
          v167 = (void *)objc_claimAutoreleasedReturnValue([v166 zoneName]);
          id v168 = sub_1000AA6AC(@"ckkskey", v167);
          v169 = (os_log_s *)objc_claimAutoreleasedReturnValue(v168);

          if (os_log_type_enabled(v169, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            id v228 = v60;
            _os_log_impl( (void *)&_mh_execute_header,  v169,  OS_LOG_TYPE_DEFAULT,  "Couldn't unwrap new key (%@), but keybag appears to be locked. Entering waitforunlock.",  buf,  0xCu);
          }

          if (a6)
          {
            id v161 = v183;
            *a6 = v161;
            v162 = off_100290DF0;
            goto LABEL_128;
          }

          v162 = off_100290DF0;
LABEL_141:
          id v26 = v49;
          id v22 = v186;
          id v8 = v187;
          v27 = v191;
          v32 = v196;
LABEL_142:
          id v161 = v183;
        }

        else
        {
          v170 = (void *)objc_claimAutoreleasedReturnValue([v187 zoneID]);
          v171 = (void *)objc_claimAutoreleasedReturnValue([v170 zoneName]);
          id v172 = sub_1000AA6AC(@"ckkskey", v171);
          v173 = (os_log_s *)objc_claimAutoreleasedReturnValue(v172);

          if (os_log_type_enabled(v173, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412546;
            id v228 = v61;
            __int16 v229 = 2112;
            id v230 = v183;
            _os_log_impl( (void *)&_mh_execute_header,  v173,  OS_LOG_TYPE_ERROR,  "new key %@ claims to wrap to TLK, but we can't unwrap it: %@",  buf,  0x16u);
          }

          if (!a6)
          {
            v162 = &off_100290E80;
            goto LABEL_141;
          }

          id v161 = v183;
          v174 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"unwrappable key(%@) in hierarchy: %@",  v61,  v183));
          *a6 = (id)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:description:underlying:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:description:underlying:",  @"CKKSErrorDomain",  33LL,  v174,  v184));

          v162 = &off_100290E80;
LABEL_128:
          id v26 = v49;
          id v22 = v186;
          id v8 = v187;
          v27 = v191;
          v32 = v196;
        }

        goto LABEL_143;
      }

      v68 = (void *)objc_claimAutoreleasedReturnValue([v187 zoneID]);
      v69 = (void *)objc_claimAutoreleasedReturnValue([v68 zoneName]);
      id v70 = sub_1000AA6AC(@"ckkskey", v69);
      v71 = (os_log_s *)objc_claimAutoreleasedReturnValue(v70);

      if (os_log_type_enabled(v71, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412546;
        id v228 = v60;
        __int16 v229 = 2112;
        id v230 = v197;
        _os_log_impl((void *)&_mh_execute_header, v71, OS_LOG_TYPE_DEFAULT, "New key %@ wraps to tlk %@", buf, 0x16u);
      }

      v58 = v61;
    }

    id v57 = [obj countByEnumeratingWithState:&v207 objects:v225 count:16];
  }

  while (v57);
LABEL_84:
  v176 = v58;

  __int128 v203 = 0u;
  __int128 v204 = 0u;
  __int128 v201 = 0u;
  __int128 v202 = 0u;
  id v178 = obj;
  id v117 = [v178 countByEnumeratingWithState:&v201 objects:v224 count:16];
  id v118 = v184;
  id v182 = v117;
  if (!v117) {
    goto LABEL_97;
  }
  uint64_t v119 = *(void *)v202;
  v120 = v184;
  while (2)
  {
    uint64_t v121 = 0LL;
    while (2)
    {
      if (*(void *)v202 != v119) {
        objc_enumerationMutation(v178);
      }
      v122 = *(void **)(*((void *)&v201 + 1) + 8 * v121);
      [v122 setState:@"local"];
      v123 = (void *)objc_claimAutoreleasedReturnValue([v122 uuid]);
      v124 = (void *)objc_claimAutoreleasedReturnValue([v191 currentKeyUUID]);
      if ([v123 isEqualToString:v124])
      {

        goto LABEL_92;
      }

      id v185 = v122;
      v125 = (void *)objc_claimAutoreleasedReturnValue([v122 uuid]);
      uint64_t v126 = v119;
      v127 = (void *)objc_claimAutoreleasedReturnValue([v196 currentKeyUUID]);
      unsigned int obja = [v125 isEqualToString:v127];

      uint64_t v119 = v126;
      v122 = v185;

      if (obja)
      {
LABEL_92:
        v200 = v120;
        v128 = &v200;
        [v122 saveToDatabaseAsOnlyCurrentKeyForClassAndState:&v200];
      }

      else
      {
        v199 = v120;
        v128 = &v199;
        [v185 saveToDatabase:&v199];
      }

      id v129 = *v128;

      id v198 = v129;
      [v122 saveKeyMaterialToKeychain:&v198];
      id v130 = v198;

      if (v130)
      {
        v147 = v122;
        v148 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSProcessReceivedKeysOperation deps](self, "deps"));
        v149 = (void *)objc_claimAutoreleasedReturnValue([v148 lockStateTracker]);
        unsigned int v150 = [v149 isLockedError:v130];

        v151 = (void *)objc_claimAutoreleasedReturnValue([v187 zoneID]);
        v152 = (void *)objc_claimAutoreleasedReturnValue([v151 zoneName]);
        id v153 = sub_1000AA6AC(@"ckkskey", v152);
        v154 = (os_log_s *)objc_claimAutoreleasedReturnValue(v153);

        id v184 = v130;
        if (v150)
        {
          if (os_log_type_enabled(v154, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412546;
            id v228 = v147;
            __int16 v229 = 2112;
            id v230 = v130;
            _os_log_impl( (void *)&_mh_execute_header,  v154,  OS_LOG_TYPE_DEFAULT,  "Couldn't save newly local key %@ keychain, due to lock state. Entering a waiting state; %@",
              buf,
              0x16u);
          }

          v155 = off_100290DF0;
        }

        else
        {
          if (os_log_type_enabled(v154, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412546;
            id v228 = v147;
            __int16 v229 = 2112;
            id v230 = v130;
            _os_log_impl( (void *)&_mh_execute_header,  v154,  OS_LOG_TYPE_ERROR,  "couldn't save newly local key %@ to database: %@",  buf,  0x16u);
          }

          v155 = &off_100290E80;
        }

        id v26 = v49;
        v32 = v196;
        if (a6) {
          *a6 = v184;
        }
        __int128 v79 = *v155;

        v61 = v176;
        id v8 = v187;
        goto LABEL_144;
      }

      v120 = 0LL;
      if (v182 != (id)++v121) {
        continue;
      }
      break;
    }

    id v131 = [v178 countByEnumeratingWithState:&v201 objects:v224 count:16];
    v120 = 0LL;
    id v118 = 0LL;
    id v182 = v131;
    if (v131) {
      continue;
    }
    break;
  }

- (id)checkExistingKeyHierarchy:(id)a3 zoneID:(id)a4 currentTrustStates:(id)a5 error:(id *)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  uint64_t v13 = objc_claimAutoreleasedReturnValue([v10 error]);
  if (v13)
  {
    v14 = (void *)v13;
    id v15 = (void *)objc_claimAutoreleasedReturnValue([v10 error]);
    id v16 = (void *)objc_claimAutoreleasedReturnValue([v15 domain]);
    if ([v16 isEqual:@"securityd"])
    {
      id v17 = (void *)objc_claimAutoreleasedReturnValue([v10 error]);
      id v18 = [v17 code];

      if (v18 == (id)-25300LL) {
        goto LABEL_9;
      }
    }

    else
    {
    }

    v19 = (void *)objc_claimAutoreleasedReturnValue([v11 zoneName]);
    id v20 = sub_1000AA6AC(@"ckkskey", v19);
    v21 = (os_log_s *)objc_claimAutoreleasedReturnValue(v20);

    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      id v22 = (void *)objc_claimAutoreleasedReturnValue([v10 error]);
      *(_DWORD *)buf = 138412290;
      id v124 = v22;
      _os_log_impl( (void *)&_mh_execute_header,  v21,  OS_LOG_TYPE_ERROR,  "Error examining existing key hierarchy: %@",  buf,  0xCu);
    }
  }

- (OctagonStateString)intendedState
{
  return (OctagonStateString *)objc_getProperty(self, a2, 88LL, 1);
}

- (OctagonStateString)nextState
{
  return (OctagonStateString *)objc_getProperty(self, a2, 96LL, 1);
}

- (void)setNextState:(id)a3
{
}

- (CKKSOperationDependencies)deps
{
  return (CKKSOperationDependencies *)objc_getProperty(self, a2, 104LL, 1);
}

- (void)setDeps:(id)a3
{
}

- (BOOL)allowFullRefetchResult
{
  return (uint64_t)self->super._descriptionUnderlyingError & 1;
}

- (void)setAllowFullRefetchResult:(BOOL)a3
{
  LOBYTE(self->super._descriptionUnderlyingError) = a3;
}

- (void).cxx_destruct
{
}

@end