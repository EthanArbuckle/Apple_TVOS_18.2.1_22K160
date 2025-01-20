@interface CKKSLocalResetOperation
- (CKKSLocalResetOperation)initWithDependencies:(id)a3 intendedState:(id)a4 errorState:(id)a5;
- (CKKSOperationDependencies)deps;
- (OctagonStateString)intendedState;
- (OctagonStateString)nextState;
- (void)main;
- (void)onqueuePerformLocalReset;
- (void)setDeps:(id)a3;
- (void)setNextState:(id)a3;
@end

@implementation CKKSLocalResetOperation

- (CKKSLocalResetOperation)initWithDependencies:(id)a3 intendedState:(id)a4 errorState:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)&OBJC_CLASS___CKKSLocalResetOperation;
  v12 = -[CKKSResultOperation init](&v15, "init");
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->super._timeoutQueue, a3);
    objc_storeStrong((id *)&v13->super._successDependencies, a4);
    objc_storeStrong((id *)&v13->super._descriptionUnderlyingError, a5);
    -[CKKSLocalResetOperation setName:](v13, "setName:", @"ckks-local-reset");
  }

  return v13;
}

- (void)main
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSLocalResetOperation deps](self, "deps"));
  v4 = (void *)objc_claimAutoreleasedReturnValue([v3 personaAdapter]);
  [v4 prepareThreadForKeychainAPIUseForPersonaIdentifier:0];

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSLocalResetOperation deps](self, "deps"));
  v6 = (void *)objc_claimAutoreleasedReturnValue([v5 databaseProvider]);
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_1000A2B04;
  v7[3] = &unk_100290F80;
  v7[4] = self;
  [v6 dispatchSyncWithSQLTransaction:v7];
}

- (void)onqueuePerformLocalReset
{
  v110 = objc_alloc(&OBJC_CLASS___AAFAnalyticsEventSecurity);
  uint64_t v129 = kSecurityRTCFieldNumViews;
  v112 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSLocalResetOperation deps](self, "deps"));
  v3 = (void *)objc_claimAutoreleasedReturnValue([v112 views]);
  v4 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInteger:]( NSNumber,  "numberWithUnsignedInteger:",  [v3 count]));
  v130 = v4;
  v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v130,  &v129,  1LL));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSLocalResetOperation deps](self, "deps"));
  v7 = (void *)objc_claimAutoreleasedReturnValue([v6 activeAccount]);
  v8 = (void *)objc_claimAutoreleasedReturnValue([v7 altDSID]);
  uint64_t v9 = kSecurityRTCEventNameLocalReset;
  uint64_t v10 = kSecurityRTCEventCategoryAccountDataAccessRecovery;
  id v11 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSLocalResetOperation deps](self, "deps"));
  v107 = -[AAFAnalyticsEventSecurity initWithCKKSMetrics:altDSID:eventName:testsAreEnabled:category:sendMetric:]( v110,  "initWithCKKSMetrics:altDSID:eventName:testsAreEnabled:category:sendMetric:",  v5,  v8,  v9,  0,  v10,  [v11 sendMetric]);

  __int128 v124 = 0u;
  __int128 v125 = 0u;
  __int128 v122 = 0u;
  __int128 v123 = 0u;
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSLocalResetOperation deps](self, "deps"));
  v13 = (void *)objc_claimAutoreleasedReturnValue([v12 views]);

  id obj = v13;
  id v111 = [v13 countByEnumeratingWithState:&v122 objects:v128 count:16];
  id v14 = 0LL;
  if (v111)
  {
    uint64_t v109 = *(void *)v123;
LABEL_3:
    uint64_t v15 = 0LL;
    while (1)
    {
      if (*(void *)v123 != v109) {
        objc_enumerationMutation(obj);
      }
      v16 = *(void **)(*((void *)&v122 + 1) + 8 * v15);
      objc_msgSend(v16, "setViewKeyHierarchyState:", @"resetlocal", v107);
      v17 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSLocalResetOperation deps](self, "deps"));
      v18 = (void *)objc_claimAutoreleasedReturnValue([v17 contextID]);
      v19 = (void *)objc_claimAutoreleasedReturnValue([v16 zoneID]);
      v20 = (void *)objc_claimAutoreleasedReturnValue([v19 zoneName]);
      v21 = (void *)objc_claimAutoreleasedReturnValue( +[CKKSZoneStateEntry contextID:zoneName:]( &OBJC_CLASS___CKKSZoneStateEntry,  "contextID:zoneName:",  v18,  v20));

      [v21 setCkzonecreated:0];
      [v21 setCkzonesubscribed:0];
      [v21 setChangeToken:0];
      [v21 setMoreRecordsInCloudKit:0];
      [v21 setLastFetchTime:0];
      [v21 setLastLocalKeychainScanTime:0];
      id v121 = v14;
      [v21 saveToDatabase:&v121];
      id v22 = v121;

      if (v22)
      {
        v23 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSResultOperation error](self, "error"));

        if (!v23)
        {
          v24 = (void *)objc_claimAutoreleasedReturnValue([v16 zoneID]);
          v25 = (void *)objc_claimAutoreleasedReturnValue([v24 zoneName]);
          id v26 = sub_1000AA6AC(@"local-reset", v25);
          v27 = (os_log_s *)objc_claimAutoreleasedReturnValue(v26);

          if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412290;
            id v127 = v22;
            _os_log_impl( (void *)&_mh_execute_header,  v27,  OS_LOG_TYPE_ERROR,  "couldn't reset zone status: %@",  buf,  0xCu);
          }

          -[CKKSResultOperation setError:](self, "setError:", v22);
          id v22 = 0LL;
        }
      }

      v28 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSLocalResetOperation deps](self, "deps"));
      v29 = (void *)objc_claimAutoreleasedReturnValue([v28 contextID]);
      v30 = (void *)objc_claimAutoreleasedReturnValue([v16 zoneID]);
      id v120 = v22;
      +[CKKSSQLDatabaseObject deleteAllWithContextID:zoneID:error:]( &OBJC_CLASS___CKKSMirrorEntry,  "deleteAllWithContextID:zoneID:error:",  v29,  v30,  &v120);
      id v31 = v120;

      if (v31)
      {
        v32 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSResultOperation error](self, "error"));

        if (!v32)
        {
          v33 = (void *)objc_claimAutoreleasedReturnValue([v16 zoneID]);
          v34 = (void *)objc_claimAutoreleasedReturnValue([v33 zoneName]);
          id v35 = sub_1000AA6AC(@"local-reset", v34);
          v36 = (os_log_s *)objc_claimAutoreleasedReturnValue(v35);

          if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412290;
            id v127 = v31;
            _os_log_impl( (void *)&_mh_execute_header,  v36,  OS_LOG_TYPE_ERROR,  "couldn't delete all CKKSMirrorEntry: %@",  buf,  0xCu);
          }

          -[CKKSResultOperation setError:](self, "setError:", v31);
          id v31 = 0LL;
        }
      }

      v37 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSLocalResetOperation deps](self, "deps"));
      v38 = (void *)objc_claimAutoreleasedReturnValue([v37 contextID]);
      v39 = (void *)objc_claimAutoreleasedReturnValue([v16 zoneID]);
      id v119 = v31;
      +[CKKSSQLDatabaseObject deleteAllWithContextID:zoneID:error:]( &OBJC_CLASS___CKKSOutgoingQueueEntry,  "deleteAllWithContextID:zoneID:error:",  v38,  v39,  &v119);
      id v40 = v119;

      if (v40)
      {
        v41 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSResultOperation error](self, "error"));

        if (!v41)
        {
          v42 = (void *)objc_claimAutoreleasedReturnValue([v16 zoneID]);
          v43 = (void *)objc_claimAutoreleasedReturnValue([v42 zoneName]);
          id v44 = sub_1000AA6AC(@"local-reset", v43);
          v45 = (os_log_s *)objc_claimAutoreleasedReturnValue(v44);

          if (os_log_type_enabled(v45, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412290;
            id v127 = v40;
            _os_log_impl( (void *)&_mh_execute_header,  v45,  OS_LOG_TYPE_ERROR,  "couldn't delete all CKKSOutgoingQueueEntry: %@",  buf,  0xCu);
          }

          -[CKKSResultOperation setError:](self, "setError:", v40);
          id v40 = 0LL;
        }
      }

      v46 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSLocalResetOperation deps](self, "deps"));
      v47 = (void *)objc_claimAutoreleasedReturnValue([v46 contextID]);
      v48 = (void *)objc_claimAutoreleasedReturnValue([v16 zoneID]);
      id v118 = v40;
      +[CKKSSQLDatabaseObject deleteAllWithContextID:zoneID:error:]( &OBJC_CLASS___CKKSIncomingQueueEntry,  "deleteAllWithContextID:zoneID:error:",  v47,  v48,  &v118);
      id v49 = v118;

      if (v49)
      {
        v50 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSResultOperation error](self, "error"));

        if (!v50)
        {
          v51 = (void *)objc_claimAutoreleasedReturnValue([v16 zoneID]);
          v52 = (void *)objc_claimAutoreleasedReturnValue([v51 zoneName]);
          id v53 = sub_1000AA6AC(@"local-reset", v52);
          v54 = (os_log_s *)objc_claimAutoreleasedReturnValue(v53);

          if (os_log_type_enabled(v54, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412290;
            id v127 = v49;
            _os_log_impl( (void *)&_mh_execute_header,  v54,  OS_LOG_TYPE_ERROR,  "couldn't delete all CKKSIncomingQueueEntry: %@",  buf,  0xCu);
          }

          -[CKKSResultOperation setError:](self, "setError:", v49);
          id v49 = 0LL;
        }
      }

      v55 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSLocalResetOperation deps](self, "deps"));
      v56 = (void *)objc_claimAutoreleasedReturnValue([v55 contextID]);
      v57 = (void *)objc_claimAutoreleasedReturnValue([v16 zoneID]);
      id v117 = v49;
      +[CKKSSQLDatabaseObject deleteAllWithContextID:zoneID:error:]( &OBJC_CLASS___CKKSKey,  "deleteAllWithContextID:zoneID:error:",  v56,  v57,  &v117);
      id v58 = v117;

      if (v58)
      {
        v59 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSResultOperation error](self, "error"));

        if (!v59)
        {
          v60 = (void *)objc_claimAutoreleasedReturnValue([v16 zoneID]);
          v61 = (void *)objc_claimAutoreleasedReturnValue([v60 zoneName]);
          id v62 = sub_1000AA6AC(@"local-reset", v61);
          v63 = (os_log_s *)objc_claimAutoreleasedReturnValue(v62);

          if (os_log_type_enabled(v63, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412290;
            id v127 = v58;
            _os_log_impl( (void *)&_mh_execute_header,  v63,  OS_LOG_TYPE_ERROR,  "couldn't delete all CKKSKey: %@",  buf,  0xCu);
          }

          -[CKKSResultOperation setError:](self, "setError:", v58);
          id v58 = 0LL;
        }
      }

      v64 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSLocalResetOperation deps](self, "deps"));
      v65 = (void *)objc_claimAutoreleasedReturnValue([v64 contextID]);
      v66 = (void *)objc_claimAutoreleasedReturnValue([v16 zoneID]);
      id v116 = v58;
      +[CKKSSQLDatabaseObject deleteAllWithContextID:zoneID:error:]( &OBJC_CLASS___CKKSTLKShareRecord,  "deleteAllWithContextID:zoneID:error:",  v65,  v66,  &v116);
      id v67 = v116;

      if (v67)
      {
        v68 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSResultOperation error](self, "error"));

        if (!v68)
        {
          v69 = (void *)objc_claimAutoreleasedReturnValue([v16 zoneID]);
          v70 = (void *)objc_claimAutoreleasedReturnValue([v69 zoneName]);
          id v71 = sub_1000AA6AC(@"local-reset", v70);
          v72 = (os_log_s *)objc_claimAutoreleasedReturnValue(v71);

          if (os_log_type_enabled(v72, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412290;
            id v127 = v67;
            _os_log_impl( (void *)&_mh_execute_header,  v72,  OS_LOG_TYPE_ERROR,  "couldn't delete all CKKSTLKShare: %@",  buf,  0xCu);
          }

          -[CKKSResultOperation setError:](self, "setError:", v67);
          id v67 = 0LL;
        }
      }

      v73 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSLocalResetOperation deps](self, "deps"));
      v74 = (void *)objc_claimAutoreleasedReturnValue([v73 contextID]);
      v75 = (void *)objc_claimAutoreleasedReturnValue([v16 zoneID]);
      id v115 = v67;
      +[CKKSSQLDatabaseObject deleteAllWithContextID:zoneID:error:]( &OBJC_CLASS___CKKSCurrentKeyPointer,  "deleteAllWithContextID:zoneID:error:",  v74,  v75,  &v115);
      id v76 = v115;

      if (v76)
      {
        v77 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSResultOperation error](self, "error"));

        if (!v77)
        {
          v78 = (void *)objc_claimAutoreleasedReturnValue([v16 zoneID]);
          v79 = (void *)objc_claimAutoreleasedReturnValue([v78 zoneName]);
          id v80 = sub_1000AA6AC(@"local-reset", v79);
          v81 = (os_log_s *)objc_claimAutoreleasedReturnValue(v80);

          if (os_log_type_enabled(v81, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412290;
            id v127 = v76;
            _os_log_impl( (void *)&_mh_execute_header,  v81,  OS_LOG_TYPE_ERROR,  "couldn't delete all CKKSCurrentKeyPointer: %@",  buf,  0xCu);
          }

          -[CKKSResultOperation setError:](self, "setError:", v76);
          id v76 = 0LL;
        }
      }

      v82 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSLocalResetOperation deps](self, "deps"));
      v83 = (void *)objc_claimAutoreleasedReturnValue([v82 contextID]);
      v84 = (void *)objc_claimAutoreleasedReturnValue([v16 zoneID]);
      id v114 = v76;
      +[CKKSSQLDatabaseObject deleteAllWithContextID:zoneID:error:]( &OBJC_CLASS___CKKSCurrentItemPointer,  "deleteAllWithContextID:zoneID:error:",  v83,  v84,  &v114);
      id v85 = v114;

      if (v85)
      {
        v86 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSResultOperation error](self, "error"));

        if (!v86)
        {
          v87 = (void *)objc_claimAutoreleasedReturnValue([v16 zoneID]);
          v88 = (void *)objc_claimAutoreleasedReturnValue([v87 zoneName]);
          id v89 = sub_1000AA6AC(@"local-reset", v88);
          v90 = (os_log_s *)objc_claimAutoreleasedReturnValue(v89);

          if (os_log_type_enabled(v90, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412290;
            id v127 = v85;
            _os_log_impl( (void *)&_mh_execute_header,  v90,  OS_LOG_TYPE_ERROR,  "couldn't delete all CKKSCurrentItemPointer: %@",  buf,  0xCu);
          }

          -[CKKSResultOperation setError:](self, "setError:", v85);
          id v85 = 0LL;
        }
      }

      v91 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSLocalResetOperation deps](self, "deps"));
      v92 = (void *)objc_claimAutoreleasedReturnValue([v91 contextID]);
      v93 = (void *)objc_claimAutoreleasedReturnValue([v16 zoneID]);
      id v113 = v85;
      +[CKKSSQLDatabaseObject deleteAllWithContextID:zoneID:error:]( &OBJC_CLASS___CKKSDeviceStateEntry,  "deleteAllWithContextID:zoneID:error:",  v92,  v93,  &v113);
      id v14 = v113;

      if (v14)
      {
        v94 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSResultOperation error](self, "error"));

        if (!v94)
        {
          v95 = (void *)objc_claimAutoreleasedReturnValue([v16 zoneID]);
          v96 = (void *)objc_claimAutoreleasedReturnValue([v95 zoneName]);
          id v97 = sub_1000AA6AC(@"local-reset", v96);
          v98 = (os_log_s *)objc_claimAutoreleasedReturnValue(v97);

          if (os_log_type_enabled(v98, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412290;
            id v127 = v14;
            _os_log_impl( (void *)&_mh_execute_header,  v98,  OS_LOG_TYPE_ERROR,  "couldn't delete all CKKSDeviceStateEntry: %@",  buf,  0xCu);
          }

          -[CKKSResultOperation setError:](self, "setError:", v14);
          id v14 = 0LL;
        }
      }

      v99 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSResultOperation error](self, "error"));

      if (v99) {
        break;
      }
      if (v111 == (id)++v15)
      {
        id v111 = [obj countByEnumeratingWithState:&v122 objects:v128 count:16];
        if (v111) {
          goto LABEL_3;
        }
        break;
      }
    }
  }

  v100 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSResultOperation error](self, "error"));
  if (v100)
  {
    v101 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSResultOperation error](self, "error"));
    v102 = v107;
    +[SecurityAnalyticsReporterRTC sendMetricWithEvent:success:error:]( &OBJC_CLASS___SecurityAnalyticsReporterRTC,  "sendMetricWithEvent:success:error:",  v107,  0LL,  v101);
  }

  else
  {
    id v103 = sub_1000AA6AC(@"local-reset", 0LL);
    v104 = (os_log_s *)objc_claimAutoreleasedReturnValue(v103);
    if (os_log_type_enabled(v104, OS_LOG_TYPE_DEFAULT))
    {
      v105 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSLocalResetOperation deps](self, "deps"));
      v106 = (void *)objc_claimAutoreleasedReturnValue([v105 views]);
      *(_DWORD *)buf = 138412290;
      id v127 = v106;
      _os_log_impl( (void *)&_mh_execute_header,  v104,  OS_LOG_TYPE_DEFAULT,  "Successfully deleted all local data for zones: %@",  buf,  0xCu);
    }

    v102 = v107;
    +[SecurityAnalyticsReporterRTC sendMetricWithEvent:success:error:]( &OBJC_CLASS___SecurityAnalyticsReporterRTC,  "sendMetricWithEvent:success:error:",  v107,  1LL,  0LL);
    v101 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSLocalResetOperation intendedState](self, "intendedState"));
    -[CKKSLocalResetOperation setNextState:](self, "setNextState:", v101);
  }
}

- (OctagonStateString)nextState
{
  return (OctagonStateString *)objc_getProperty(self, a2, 80LL, 1);
}

- (void)setNextState:(id)a3
{
}

- (OctagonStateString)intendedState
{
  return (OctagonStateString *)objc_getProperty(self, a2, 88LL, 1);
}

- (CKKSOperationDependencies)deps
{
  return (CKKSOperationDependencies *)objc_getProperty(self, a2, 96LL, 1);
}

- (void)setDeps:(id)a3
{
}

- (void).cxx_destruct
{
}

@end