@interface ADExperimentManager
+ (BOOL)logAssetSetExperiment:(id)a3 trialData:(id)a4 experimentsEmitted:(id)a5;
+ (id)abExperimentFromExperimentAllocationStatus:(id)a3;
+ (id)assetSets;
+ (id)configurationForInvocationFeedback;
+ (id)configurationForSiriVOXSounds;
+ (id)configurationForSiriVOXTapToSiriBehavior;
+ (id)expExperimentFromExperimentAllocationStatus:(id)a3;
+ (id)expExperimentWithExperimentIdentifiers:(id)a3 status:(int)a4 trialNamespace:(id)a5;
+ (id)experimentIdentifiersTrialProject:(id)a3 trialNamespace:(id)a4;
+ (id)filterExperiments:(id)a3 experimentsEmitted:(id)a4 namespaceAssetSet:(id)a5;
+ (id)getActiveABExperimentsFromProvider:(id)a3 environment:(int)a4 retries:(unint64_t)a5;
+ (id)getActiveEXPExperimentsFromProvider:(id)a3 environment:(int)a4 retries:(unint64_t)a5;
+ (id)getAllEXPExperimentsFromProvider:(id)a3 cursor:(id)a4 environment:(int)a5 fromDate:(id)a6 retries:(unint64_t)a7 experimentsEmitted:(id)a8 namespaceAssetSet:(id)a9;
+ (id)namespaceAssetSet:(id)a3;
+ (id)serverConfigurationInfoForVoiceSelectionExperiment;
+ (id)sharedManager;
+ (id)treatmentAllocationStatusToString:(int)a3;
+ (int)treatmentAllocationStatusFromAllocationStatusType:(unsigned __int8)a3;
+ (void)emitUpdatedExperiments:(id)a3;
+ (void)tracerAllocationsWithQueue:(id)a3;
- (ADExperimentManager)init;
- (BOOL)_isEndingGroupIdentifier:(id)a3 validForConfiguration:(id)a4;
- (id)_buildConfigurationsByIdentifier;
- (id)_buildContext;
- (id)_buildServerConfigurationInfosByIdentifier;
- (id)_createExperimentForExperimentConfiguration:(id)a3 experimentIdentifier:(id)a4;
- (id)_experimentForExperimentConfiguration:(id)a3;
- (id)_experimentIdentifierForConfigurationIdentifier:(id)a3;
- (id)_experimentOverrideForExperimentConfiguration:(id)a3;
- (id)_fallbackConfigurationForEndedExperimentWithIdentifier:(id)a3 experimentState:(id)a4;
- (id)_fetchCachedServerConfigurationForConfigurationInfo:(id)a3;
- (id)_fetchDictionaryWithFileURL:(id)a3;
- (id)_getConfigurationsByIdentifier;
- (id)_getContext;
- (id)_getExperimentStateForServerConfigurationInfo:(id)a3;
- (id)_getServerConfigurationInfosByIdentifier;
- (id)_groupOverrideIdentifierForExperimentConfiguration:(id)a3;
- (id)configurations;
- (id)context;
- (unint64_t)_experimentGroupHashForExperimentConfiguration:(id)a3 experimentIdentifier:(id)a4;
- (void)_logDidVendExperiment:(id)a3 fetchDetails:(id)a4 error:(id)a5;
- (void)_remoteFetchConfigMetadataWithServerConfigurationInfo:(id)a3 completion:(id)a4;
- (void)_resolveDataTaskForURLSession:(id)a3 URL:(id)a4 completion:(id)a5;
- (void)_serverConfigurationForServerConfigurationInfo:(id)a3 completion:(id)a4;
- (void)_setExperimentIdentifier:(id)a3 forConfigurationIdentifier:(id)a4;
- (void)_setExperimentState:(id)a3 forServerConfigurationInfo:(id)a4;
- (void)_storeServerConfig:(id)a3 completion:(id)a4;
- (void)getConfigurationsWithCompletion:(id)a3;
- (void)getContextWithCompletion:(id)a3;
- (void)getExperimentForConfigurationIdentifier:(id)a3 completion:(id)a4;
- (void)resetExperimentForConfigurationIdentifier:(id)a3 completion:(id)a4;
- (void)synchronizeExperimentConfigurationsIfApplicableWithCompletion:(id)a3;
@end

@implementation ADExperimentManager

+ (id)serverConfigurationInfoForVoiceSelectionExperiment
{
  id v2 = objc_alloc(&OBJC_CLASS___AFExperimentServerConfigurationInfo);
  v3 = (void *)objc_claimAutoreleasedReturnValue( +[NSURL URLWithString:]( &OBJC_CLASS___NSURL,  "URLWithString:",  @"https://configuration.apple.com/configurations/internetservices/cloudkit/siri-1.0.plist"));
  id v4 = [v2 initWithConfigurationIdentifier:@"08a8a2c8" configurationURL:v3 maxTimeToSync:345600.0];

  return v4;
}

+ (id)assetSets
{
  if (qword_100578000 != -1) {
    dispatch_once(&qword_100578000, &stru_1004F43C8);
  }
  return [(id)qword_100577FF8 copy];
}

+ (id)namespaceAssetSet:(id)a3
{
  if (!a3) {
    return 0LL;
  }
  id v3 = a3;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  v6[2] = sub_100196948;
  v6[3] = &unk_1004F43F0;
  id v4 = objc_opt_new(&OBJC_CLASS___NSMutableDictionary);
  v7 = v4;
  [v3 enumerateKeysAndObjectsUsingBlock:v6];

  return v4;
}

+ (void)tracerAllocationsWithQueue:(id)a3
{
  id v4 = a3;
  v5 = (os_log_s *)AFSiriLogContextConnection;
  if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    v12 = "+[ADExperimentManager(Tracer) tracerAllocationsWithQueue:]";
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "%s ", buf, 0xCu);
  }

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[ADDaemon sharedDaemon](&OBJC_CLASS___ADDaemon, "sharedDaemon"));
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = sub_100195DA8;
  v8[3] = &unk_1004FD0A0;
  id v9 = v4;
  id v10 = a1;
  id v7 = v4;
  [v6 scheduleUnlockedWork:v8];
}

+ (id)experimentIdentifiersTrialProject:(id)a3 trialNamespace:(id)a4
{
  id v5 = a4;
  id v6 = +[TRIProject projectIdFromName:](&OBJC_CLASS___TRIProject, "projectIdFromName:", a3);
  if ((_DWORD)v6 && (id v7 = v6, TRIProject_ProjectId_IsValidValue()))
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[TRIClient clientWithIdentifier:](&OBJC_CLASS___TRIClient, "clientWithIdentifier:", v7));
    id v9 = (void *)objc_claimAutoreleasedReturnValue([v8 experimentIdentifiersWithNamespaceName:v5]);
  }

  else
  {
    id v9 = 0LL;
  }

  return v9;
}

+ (id)getActiveABExperimentsFromProvider:(id)a3 environment:(int)a4 retries:(unint64_t)a5
{
  uint64_t v6 = *(void *)&a4;
  id v23 = a3;
  v8 = (os_log_s *)AFSiriLogContextConnection;
  if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    v31 = "+[ADExperimentManager(Tracer) getActiveABExperimentsFromProvider:environment:retries:]";
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "%s ", buf, 0xCu);
  }

  if (v23)
  {
    id v9 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
    id v10 = (void *)objc_claimAutoreleasedReturnValue(+[ADExperimentManager assetSets](&OBJC_CLASS___ADExperimentManager, "assetSets"));
    v11 = (void *)objc_claimAutoreleasedReturnValue( +[ADExperimentManager namespaceAssetSet:]( &OBJC_CLASS___ADExperimentManager,  "namespaceAssetSet:",  v10));

    id v12 = 0LL;
    unint64_t v13 = 1LL;
    *(void *)&__int128 v14 = 136316162LL;
    __int128 v22 = v14;
    do
    {
      -[NSMutableArray removeAllObjects](v9, "removeAllObjects", v22);

      id v29 = 0LL;
      v24[0] = _NSConcreteStackBlock;
      v24[1] = 3221225472LL;
      v24[2] = sub_100195A40;
      v24[3] = &unk_1004F4468;
      id v27 = a1;
      id v15 = v11;
      id v25 = v15;
      int v28 = v6;
      v16 = v9;
      v26 = v16;
      [v23 enumerateActiveExperimentsForEnvironment:v6 error:&v29 block:v24];
      id v12 = v29;
      if (v12)
      {
        v17 = (os_log_s *)AFSiriLogContextConnection;
        if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = v22;
          v31 = "+[ADExperimentManager(Tracer) getActiveABExperimentsFromProvider:environment:retries:]";
          __int16 v32 = 1024;
          int v33 = v6;
          __int16 v34 = 2048;
          unint64_t v35 = v13;
          __int16 v36 = 2048;
          unint64_t v37 = a5 + 1;
          __int16 v38 = 2112;
          id v39 = v12;
          _os_log_error_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_ERROR,  "%s Error enumerating active AB experiments for environment %d. Execution %lu of %lu tries. Error: %@",  buf,  0x30u);
        }
      }

      if (!v12) {
        break;
      }
    }

    while (v13++ <= a5);
    if (v12) {
      v19 = 0LL;
    }
    else {
      v19 = v16;
    }
    v20 = v19;
  }

  else
  {
    v20 = 0LL;
  }

  return v20;
}

+ (id)getActiveEXPExperimentsFromProvider:(id)a3 environment:(int)a4 retries:(unint64_t)a5
{
  uint64_t v6 = *(void *)&a4;
  id v23 = a3;
  v8 = (os_log_s *)AFSiriLogContextConnection;
  if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    v31 = "+[ADExperimentManager(Tracer) getActiveEXPExperimentsFromProvider:environment:retries:]";
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "%s ", buf, 0xCu);
  }

  if (v23)
  {
    id v9 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
    id v10 = (void *)objc_claimAutoreleasedReturnValue(+[ADExperimentManager assetSets](&OBJC_CLASS___ADExperimentManager, "assetSets"));
    v11 = (void *)objc_claimAutoreleasedReturnValue( +[ADExperimentManager namespaceAssetSet:]( &OBJC_CLASS___ADExperimentManager,  "namespaceAssetSet:",  v10));

    id v12 = 0LL;
    unint64_t v13 = 1LL;
    *(void *)&__int128 v14 = 136316162LL;
    __int128 v22 = v14;
    do
    {
      -[NSMutableArray removeAllObjects](v9, "removeAllObjects", v22);

      id v29 = 0LL;
      v24[0] = _NSConcreteStackBlock;
      v24[1] = 3221225472LL;
      v24[2] = sub_100195654;
      v24[3] = &unk_1004F4468;
      id v27 = a1;
      id v15 = v11;
      id v25 = v15;
      int v28 = v6;
      v16 = v9;
      v26 = v16;
      [v23 enumerateActiveExperimentsForEnvironment:v6 error:&v29 block:v24];
      id v12 = v29;
      if (v12)
      {
        v17 = (os_log_s *)AFSiriLogContextConnection;
        if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = v22;
          v31 = "+[ADExperimentManager(Tracer) getActiveEXPExperimentsFromProvider:environment:retries:]";
          __int16 v32 = 1024;
          int v33 = v6;
          __int16 v34 = 2048;
          unint64_t v35 = v13;
          __int16 v36 = 2048;
          unint64_t v37 = a5 + 1;
          __int16 v38 = 2112;
          id v39 = v12;
          _os_log_error_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_ERROR,  "%s Error enumerating EXP active experiments for environment %d. Execution %lu of %lu tries. Error: %@",  buf,  0x30u);
        }
      }

      if (!v12) {
        break;
      }
    }

    while (v13++ <= a5);
    if (v12) {
      v19 = 0LL;
    }
    else {
      v19 = v16;
    }
    v20 = v19;
  }

  else
  {
    v20 = 0LL;
  }

  return v20;
}

+ (id)getAllEXPExperimentsFromProvider:(id)a3 cursor:(id)a4 environment:(int)a5 fromDate:(id)a6 retries:(unint64_t)a7 experimentsEmitted:(id)a8 namespaceAssetSet:(id)a9
{
  uint64_t v12 = *(void *)&a5;
  id v15 = a3;
  id v31 = a4;
  id v16 = a6;
  id v17 = a8;
  id v18 = a9;
  v19 = (os_log_s *)AFSiriLogContextConnection;
  if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    id v39 = "+[ADExperimentManager(Tracer) getAllEXPExperimentsFromProvider:cursor:environment:fromDate:retries:experiments"
          "Emitted:namespaceAssetSet:]";
    _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_INFO, "%s ", buf, 0xCu);
  }

  if (v15)
  {
    id v29 = v18;
    id v30 = v17;
    v20 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
    id v21 = 0LL;
    unint64_t v22 = 1LL;
    do
    {
      -[NSMutableArray removeAllObjects](v20, "removeAllObjects", v29, v30);

      id v37 = 0LL;
      v32[0] = _NSConcreteStackBlock;
      v32[1] = 3221225472LL;
      v32[2] = sub_100195438;
      v32[3] = &unk_1004F4490;
      id v35 = a1;
      id v33 = v16;
      int v36 = v12;
      id v23 = v20;
      __int16 v34 = v23;
      id v24 =  [v15 enumerateExperimentStatusesForEnvironment:v12 startingFromCursor:v31 error:&v37 block:v32];
      id v21 = v37;
      if (v21)
      {
        id v25 = (os_log_s *)AFSiriLogContextConnection;
        if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136316162;
          id v39 = "+[ADExperimentManager(Tracer) getAllEXPExperimentsFromProvider:cursor:environment:fromDate:retries:exper"
                "imentsEmitted:namespaceAssetSet:]";
          __int16 v40 = 1024;
          int v41 = v12;
          __int16 v42 = 2048;
          unint64_t v43 = v22;
          __int16 v44 = 2048;
          unint64_t v45 = a7 + 1;
          __int16 v46 = 2112;
          id v47 = v21;
          _os_log_error_impl( (void *)&_mh_execute_header,  v25,  OS_LOG_TYPE_ERROR,  "%s Error enumerating updated EXP experiments for environment %d. Execution %lu of %lu tries. Error: %@",  buf,  0x30u);
        }
      }

      if (!v21) {
        break;
      }
    }

    while (v22++ <= a7);
    if (v21)
    {
      id v27 = 0LL;
      id v18 = v29;
      id v17 = v30;
    }

    else
    {
      id v18 = v29;
      id v17 = v30;
      id v27 = (void *)objc_claimAutoreleasedReturnValue([a1 filterExperiments:v23 experimentsEmitted:v30 namespaceAssetSet:v29]);
    }
  }

  else
  {
    id v27 = 0LL;
  }

  return v27;
}

+ (id)abExperimentFromExperimentAllocationStatus:(id)a3
{
  if (a3)
  {
    id v3 = a3;
    id v4 = objc_alloc_init(&OBJC_CLASS___SAABTestExperiment);
    id v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( NSString,  "stringWithFormat:",  @"%d",  [v3 deploymentId]));
    [v4 setDeploymentId:v5];

    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue([v3 experimentId]);
    id v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%@", v6));
    [v4 setExperimentId:v7];

    v8 = (void *)objc_claimAutoreleasedReturnValue([v3 treatmentId]);
    id v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%@", v8));
    [v4 setTreatmentId:v9];
  }

  else
  {
    id v4 = 0LL;
  }

  return v4;
}

+ (id)filterExperiments:(id)a3 experimentsEmitted:(id)a4 namespaceAssetSet:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  v54 = objc_opt_new(&OBJC_CLASS___NSMutableArray);
  __int128 v55 = 0u;
  __int128 v56 = 0u;
  __int128 v57 = 0u;
  __int128 v58 = 0u;
  id obj = v7;
  id v10 = [obj countByEnumeratingWithState:&v55 objects:v67 count:16];
  if (v10)
  {
    id v12 = v10;
    uint64_t v13 = *(void *)v56;
    *(void *)&__int128 v11 = 136315906LL;
    __int128 v51 = v11;
    v52 = v8;
    do
    {
      for (i = 0LL; i != v12; i = (char *)i + 1)
      {
        if (*(void *)v56 != v13) {
          objc_enumerationMutation(obj);
        }
        id v15 = *(void **)(*((void *)&v55 + 1) + 8LL * (void)i);
        id v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "experimentNamespace", v51));
        uint64_t v17 = objc_claimAutoreleasedReturnValue([v9 objectForKeyedSubscript:v16]);
        if (v17)
        {
          id v18 = (void *)v17;
          unsigned int v19 = [v15 allocationStatus];

          if (v19 == 2)
          {
            v20 = (void *)objc_claimAutoreleasedReturnValue(+[UAFAssetSetManager sharedManager](&OBJC_CLASS___UAFAssetSetManager, "sharedManager"));
            id v21 = (void *)objc_claimAutoreleasedReturnValue([v9 objectForKeyedSubscript:v16]);
            unint64_t v22 = (void *)objc_claimAutoreleasedReturnValue([v20 retrieveAssetSet:v21 usages:0]);

            uint64_t v23 = objc_claimAutoreleasedReturnValue([v22 experimentId]);
            if (!v23
              || (id v24 = (void *)v23,
                  id v25 = (void *)objc_claimAutoreleasedReturnValue([v22 experimentId]),
                  unsigned __int8 v26 = [v25 isEqualToString:&stru_1004FECA0],
                  v25,
                  v24,
                  (v26 & 1) != 0))
            {
              id v27 = (void *)AFSiriLogContextConnection;
              if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
              {
                int v28 = v27;
                id v29 = (void *)objc_claimAutoreleasedReturnValue([v15 experimentNamespace]);
                id v30 = (void *)objc_claimAutoreleasedReturnValue([v15 experimentId]);
                *(_DWORD *)buf = 136315650;
                v60 = "+[ADExperimentManager(Tracer) filterExperiments:experimentsEmitted:namespaceAssetSet:]";
                __int16 v61 = 2112;
                v62 = v29;
                __int16 v63 = 2112;
                v64 = v30;
                id v31 = v28;
                __int16 v32 = "%s AssetSet namespace %@ Trial experiment %@ activated. AssetSet experiment not activated.";
                goto LABEL_15;
              }

              goto LABEL_16;
            }

            id v8 = v52;
            id v33 = (void *)objc_claimAutoreleasedReturnValue([v52 objectForKey:v16]);

            if (v33)
            {
              __int16 v34 = (void *)AFSiriLogContextConnection;
              if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
              {
                int v28 = v34;
                id v29 = (void *)objc_claimAutoreleasedReturnValue([v15 experimentNamespace]);
                id v30 = (void *)objc_claimAutoreleasedReturnValue([v15 experimentId]);
                *(_DWORD *)buf = 136315650;
                v60 = "+[ADExperimentManager(Tracer) filterExperiments:experimentsEmitted:namespaceAssetSet:]";
                __int16 v61 = 2112;
                v62 = v29;
                __int16 v63 = 2112;
                v64 = v30;
                id v31 = v28;
                __int16 v32 = "%s AssetSet namespace %@ Trial experiment %@ activated. AssetSet experiment activated. Logging already emitted.";
LABEL_15:
                _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_INFO, v32, buf, 0x20u);
              }

+ (id)expExperimentFromExperimentAllocationStatus:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v5 = objc_alloc_init(&OBJC_CLASS___EXPSchemaEXPTrialExperiment);
    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue([v4 experimentId]);
    [v5 setExperimentId:v6];

    id v7 = objc_alloc(&OBJC_CLASS___NSUUID);
    id v8 = (void *)objc_claimAutoreleasedReturnValue([v4 treatmentId]);
    id v9 = -[NSUUID initWithUUIDString:](v7, "initWithUUIDString:", v8);

    id v10 = [[SISchemaUUID alloc] initWithNSUUID:v9];
    [v5 setTreatmentId:v10];

    objc_msgSend(v5, "setDeploymentId:", (int)objc_msgSend(v4, "deploymentId"));
    objc_msgSend( v5,  "setAllocationStatus:",  objc_msgSend(a1, "treatmentAllocationStatusFromAllocationStatusType:", objc_msgSend(v4, "type")));
    __int128 v11 = (void *)objc_claimAutoreleasedReturnValue([v4 namespaces]);
    id v12 = [v11 count];

    if (v12)
    {
      uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue([v4 namespaces]);
      __int128 v14 = (void *)objc_claimAutoreleasedReturnValue([v13 firstObject]);

      id v15 = (void *)objc_claimAutoreleasedReturnValue([v14 name]);
      [v5 setExperimentNamespace:v15];

      objc_msgSend(v5, "setCompatibilityVersion:", objc_msgSend(v14, "compatibilityVersion"));
    }

    id v16 = (void *)objc_claimAutoreleasedReturnValue([v4 date]);
    [v16 timeIntervalSince1970];
    [v5 setLastUpdatedAtInMs:(unint64_t)(v17 * 1000.0)];
  }

  else
  {
    id v5 = 0LL;
  }

  return v5;
}

+ (id)expExperimentWithExperimentIdentifiers:(id)a3 status:(int)a4 trialNamespace:(id)a5
{
  id v5 = 0LL;
  if (a3 && a5)
  {
    uint64_t v6 = *(void *)&a4;
    id v8 = a5;
    id v9 = a3;
    id v5 = objc_alloc_init(&OBJC_CLASS___EXPSchemaEXPTrialExperiment);
    id v10 = (void *)objc_claimAutoreleasedReturnValue([v9 experimentId]);
    [v5 setExperimentId:v10];

    __int128 v11 = objc_alloc(&OBJC_CLASS___NSUUID);
    id v12 = (void *)objc_claimAutoreleasedReturnValue([v9 treatmentId]);
    uint64_t v13 = -[NSUUID initWithUUIDString:](v11, "initWithUUIDString:", v12);

    id v14 = [[SISchemaUUID alloc] initWithNSUUID:v13];
    [v5 setTreatmentId:v14];

    LODWORD(v14) = [v9 deploymentId];
    [v5 setDeploymentId:(int)v14];
    [v5 setAllocationStatus:v6];
    [v5 setExperimentNamespace:v8];

    id v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
    [v15 timeIntervalSince1970];
    [v5 setLastUpdatedAtInMs:(unint64_t)(v16 * 1000.0)];
  }

  return v5;
}

+ (int)treatmentAllocationStatusFromAllocationStatusType:(unsigned __int8)a3
{
  id v4 = (os_log_s *)AFSiriLogContextConnection;
  int result = os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_ERROR);
  if (result)
  {
    int v5 = 136315138;
    uint64_t v6 = "+[ADExperimentManager(Tracer) treatmentAllocationStatusFromAllocationStatusType:]";
    _os_log_error_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_ERROR,  "%s Allocation Status Type Unknown",  (uint8_t *)&v5,  0xCu);
    return 0;
  }

  return result;
}

+ (id)treatmentAllocationStatusToString:(int)a3
{
  else {
    return *(&off_1004F44B0 + (a3 - 1));
  }
}

+ (BOOL)logAssetSetExperiment:(id)a3 trialData:(id)a4 experimentsEmitted:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  uint64_t v10 = objc_claimAutoreleasedReturnValue([v8 objectForKeyedSubscript:@"TrialProject"]);
  if (v10)
  {
    __int128 v11 = (void *)v10;
    id v12 = (void *)objc_claimAutoreleasedReturnValue([v8 objectForKeyedSubscript:@"TrialNamespace"]);

    if (v12)
    {
      uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue(+[UAFAssetSetManager sharedManager](&OBJC_CLASS___UAFAssetSetManager, "sharedManager"));
      id v14 = (void *)objc_claimAutoreleasedReturnValue([v13 retrieveAssetSet:v7 usages:0]);

      id v15 = (void *)objc_claimAutoreleasedReturnValue([v8 objectForKeyedSubscript:@"TrialProject"]);
      double v16 = (void *)objc_claimAutoreleasedReturnValue([v8 objectForKeyedSubscript:@"TrialNamespace"]);
      double v17 = (void *)objc_claimAutoreleasedReturnValue( +[ADExperimentManager experimentIdentifiersTrialProject:trialNamespace:]( &OBJC_CLASS___ADExperimentManager,  "experimentIdentifiersTrialProject:trialNamespace:",  v15,  v16));

      id v18 = (void *)AFSiriLogContextConnection;
      if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
      {
        unsigned int v19 = v18;
        v20 = (void *)objc_claimAutoreleasedReturnValue([v8 objectForKeyedSubscript:@"TrialNamespace"]);
        id v21 = (void *)objc_claimAutoreleasedReturnValue([v14 experimentId]);
        unint64_t v22 = (void *)objc_claimAutoreleasedReturnValue([v17 experimentId]);
        uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue([v17 treatmentId]);
        *(_DWORD *)buf = 136316674;
        v82 = "+[ADExperimentManager(Tracer) logAssetSetExperiment:trialData:experimentsEmitted:]";
        __int16 v83 = 2112;
        id v84 = v7;
        __int16 v85 = 2112;
        v86 = v20;
        __int16 v87 = 2112;
        v88 = v21;
        __int16 v89 = 2112;
        v90 = v22;
        __int16 v91 = 2112;
        v92 = v23;
        __int16 v93 = 1024;
        unsigned int v94 = [v17 deploymentId];
        _os_log_impl( (void *)&_mh_execute_header,  v19,  OS_LOG_TYPE_INFO,  "%s AssetSet %@ (%@), experimentId %@. Trial info: experimentId %@, treatmentId %@, deploymentId %d",  buf,  0x44u);
      }

      uint64_t v24 = objc_claimAutoreleasedReturnValue([v14 experimentId]);
      if (v24
        && (id v25 = (void *)v24,
            unsigned __int8 v26 = (void *)objc_claimAutoreleasedReturnValue([v14 experimentId]),
            unsigned int v27 = [v26 isEqualToString:&stru_1004FECA0],
            v26,
            v25,
            !v27))
      {
        int v29 = 0;
      }

      else
      {
        int v28 = (void *)objc_claimAutoreleasedReturnValue([v17 experimentId]);

        if (!v28)
        {
          __int128 v55 = (void *)AFSiriLogContextConnection;
          if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
          {
            __int128 v56 = v55;
            __int128 v57 = (void *)objc_claimAutoreleasedReturnValue([v8 objectForKeyedSubscript:@"TrialNamespace"]);
            *(_DWORD *)buf = 136315650;
            v82 = "+[ADExperimentManager(Tracer) logAssetSetExperiment:trialData:experimentsEmitted:]";
            __int16 v83 = 2112;
            id v84 = v7;
            __int16 v85 = 2112;
            v86 = v57;
            _os_log_impl( (void *)&_mh_execute_header,  v56,  OS_LOG_TYPE_INFO,  "%s AssetSet %@ (%@), experiment not activated. Trial experiment not activated",  buf,  0x20u);
          }

          BOOL v34 = 0;
          goto LABEL_39;
        }

        int v29 = 1;
      }

      id v35 = (void *)objc_claimAutoreleasedReturnValue([v8 objectForKeyedSubscript:@"TrialNamespace"]);
      int v36 = (void *)objc_claimAutoreleasedReturnValue([v9 objectForKey:v35]);

      if (v29 && !v36)
      {
        id v37 = (void *)AFSiriLogContextConnection;
        if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
        {
          __int16 v38 = v37;
          id v39 = (void *)objc_claimAutoreleasedReturnValue([v8 objectForKeyedSubscript:@"TrialNamespace"]);
          uint64_t v40 = (void *)objc_claimAutoreleasedReturnValue([v17 experimentId]);
          *(_DWORD *)buf = 136315906;
          v82 = "+[ADExperimentManager(Tracer) logAssetSetExperiment:trialData:experimentsEmitted:]";
          __int16 v83 = 2112;
          id v84 = v7;
          __int16 v85 = 2112;
          v86 = v39;
          __int16 v87 = 2112;
          v88 = v40;
          _os_log_impl( (void *)&_mh_execute_header,  v38,  OS_LOG_TYPE_INFO,  "%s AssetSet %@ (%@), experiment not activated. Trial experiment %@ activated",  buf,  0x2Au);

LABEL_36:
          goto LABEL_37;
        }

        goto LABEL_37;
      }

      if (v36) {
        int v41 = v29;
      }
      else {
        int v41 = 0;
      }
      if (v41 == 1)
      {
        uint64_t v42 = (void *)AFSiriLogContextConnection;
        if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
        {
          unint64_t v43 = v42;
          unsigned int v44 = (void *)objc_claimAutoreleasedReturnValue([v8 objectForKeyedSubscript:@"TrialNamespace"]);
          unint64_t v45 = (void *)objc_claimAutoreleasedReturnValue([v17 experimentId]);
          *(_DWORD *)buf = 136315906;
          v82 = "+[ADExperimentManager(Tracer) logAssetSetExperiment:trialData:experimentsEmitted:]";
          __int16 v83 = 2112;
          id v84 = v7;
          __int16 v85 = 2112;
          v86 = v44;
          __int16 v87 = 2112;
          v88 = v45;
          _os_log_impl( (void *)&_mh_execute_header,  v43,  OS_LOG_TYPE_INFO,  "%s AssetSet %@ (%@), experiment deactivated, Trial experiment %@ activated",  buf,  0x2Au);
        }

        __int16 v46 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
        id v47 = (void *)objc_claimAutoreleasedReturnValue([v8 objectForKeyedSubscript:@"TrialNamespace"]);
        v48 = (void *)objc_claimAutoreleasedReturnValue( +[ADExperimentManager expExperimentWithExperimentIdentifiers:status:trialNamespace:]( &OBJC_CLASS___ADExperimentManager,  "expExperimentWithExperimentIdentifiers:status:trialNamespace:",  v17,  3LL,  v47));

        -[NSMutableArray addObject:](v46, "addObject:", v48);
        +[ADExperimentManager emitUpdatedExperiments:]( &OBJC_CLASS___ADExperimentManager,  "emitUpdatedExperiments:",  v46);
        v49 = (void *)AFSiriLogContextConnection;
        if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
        {
          v50 = v49;
          v80 = v36;
          __int128 v51 = (void *)objc_claimAutoreleasedReturnValue([v8 objectForKeyedSubscript:@"TrialNamespace"]);
          v52 = (void *)objc_claimAutoreleasedReturnValue([v17 experimentId]);
          *(_DWORD *)buf = 136315906;
          v82 = "+[ADExperimentManager(Tracer) logAssetSetExperiment:trialData:experimentsEmitted:]";
          __int16 v83 = 2112;
          id v84 = v7;
          __int16 v85 = 2112;
          v86 = v51;
          __int16 v87 = 2112;
          v88 = v52;
          _os_log_impl( (void *)&_mh_execute_header,  v50,  OS_LOG_TYPE_INFO,  "%s AssetSet %@ (%@), experiment %@ deactivated, logging emitted",  buf,  0x2Au);

          int v36 = v80;
        }

        v53 = (void *)objc_claimAutoreleasedReturnValue([v8 objectForKeyedSubscript:@"TrialNamespace"]);
        [v9 removeObjectForKey:v53];

        v54 = (void *)objc_claimAutoreleasedReturnValue(+[ADPreferences sharedPreferences](&OBJC_CLASS___ADPreferences, "sharedPreferences"));
        [v54 setExperimentsUAFEmitted:v9];
      }

      else
      {
        __int128 v58 = (void *)objc_claimAutoreleasedReturnValue([v14 experimentId]);
        v59 = (void *)objc_claimAutoreleasedReturnValue([v17 experimentId]);
        unsigned __int8 v60 = [v58 isEqualToString:v59];

        if ((v60 & 1) == 0)
        {
          __int16 v65 = (void *)AFSiriLogContextConnection;
          if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
          {
            __int16 v38 = v65;
            v66 = (void *)objc_claimAutoreleasedReturnValue([v8 objectForKeyedSubscript:@"TrialNamespace"]);
            v67 = (void *)objc_claimAutoreleasedReturnValue([v14 experimentId]);
            v68 = (void *)objc_claimAutoreleasedReturnValue([v17 experimentId]);
            *(_DWORD *)buf = 136316162;
            v82 = "+[ADExperimentManager(Tracer) logAssetSetExperiment:trialData:experimentsEmitted:]";
            __int16 v83 = 2112;
            id v84 = v7;
            __int16 v85 = 2112;
            v86 = v66;
            __int16 v87 = 2112;
            v88 = v67;
            __int16 v89 = 2112;
            v90 = v68;
            _os_log_impl( (void *)&_mh_execute_header,  v38,  OS_LOG_TYPE_INFO,  "%s AssetSet %@ (%@), experiment %@ doesn't match Trial experiment %@",  buf,  0x34u);

            goto LABEL_36;
          }

+ (void)emitUpdatedExperiments:(id)a3
{
  id v3 = a3;
  id v4 = v3;
  if (v3)
  {
    if ([v3 count])
    {
      id v5 = objc_alloc_init(&OBJC_CLASS___EXPSiriSchemaEXPAllocationChangelogSnapshot);
      [v5 setAllocations:v4];
      id v6 = objc_alloc_init(&OBJC_CLASS___EXPSiriSchemaEXPSiriClientEvent);
      [v6 setAllocationChangelogSnapshot:v5];
      id v7 = (void *)objc_claimAutoreleasedReturnValue(+[AssistantSiriAnalytics sharedStream](&OBJC_CLASS___AssistantSiriAnalytics, "sharedStream"));
      [v7 emitMessage:v6];

      id v8 = (void *)AFSiriLogContextConnection;
      if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
      {
        id v9 = v8;
        int v11 = 136315394;
        id v12 = "+[ADExperimentManager(Tracer) emitUpdatedExperiments:]";
        __int16 v13 = 2048;
        id v14 = [v4 count];
        _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_INFO,  "%s Snapshot of all Siri updated experiments emitted. Total: %lu",  (uint8_t *)&v11,  0x16u);
      }
    }

    else
    {
      uint64_t v10 = (os_log_s *)AFSiriLogContextConnection;
      if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
      {
        int v11 = 136315138;
        id v12 = "+[ADExperimentManager(Tracer) emitUpdatedExperiments:]";
        _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_INFO,  "%s No Siri updated experiments to emit",  (uint8_t *)&v11,  0xCu);
      }
    }
  }
}

- (ADExperimentManager)init
{
  v10.receiver = self;
  v10.super_class = (Class)&OBJC_CLASS___ADExperimentManager;
  id v2 = -[ADExperimentManager init](&v10, "init");
  if (v2)
  {
    dispatch_queue_attr_t v3 = dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    id v4 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v3);
    dispatch_queue_attr_t v5 = dispatch_queue_attr_make_with_qos_class(v4, QOS_CLASS_USER_INITIATED, 0);
    id v6 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v5);

    dispatch_queue_t v7 = dispatch_queue_create("com.apple.assistant.experiment-manager", v6);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v7;
  }

  return v2;
}

- (id)configurations
{
  uint64_t v6 = 0LL;
  dispatch_queue_t v7 = &v6;
  uint64_t v8 = 0x3032000000LL;
  id v9 = sub_1001A6AAC;
  objc_super v10 = sub_1001A6ABC;
  id v11 = 0LL;
  queue = (dispatch_queue_s *)self->_queue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_1001A6B50;
  v5[3] = &unk_1004FCDB0;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

- (void)getConfigurationsWithCompletion:(id)a3
{
  id v4 = a3;
  dispatch_queue_attr_t v5 = v4;
  if (v4)
  {
    queue = (dispatch_queue_s *)self->_queue;
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472LL;
    v7[2] = sub_1001A6AFC;
    v7[3] = &unk_1004FD990;
    v7[4] = self;
    id v8 = v4;
    dispatch_async(queue, v7);
  }
}

- (id)context
{
  uint64_t v6 = 0LL;
  dispatch_queue_t v7 = &v6;
  uint64_t v8 = 0x3032000000LL;
  id v9 = sub_1001A6AAC;
  objc_super v10 = sub_1001A6ABC;
  id v11 = 0LL;
  queue = (dispatch_queue_s *)self->_queue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_1001A6AC4;
  v5[3] = &unk_1004FCDB0;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

- (void)getContextWithCompletion:(id)a3
{
  id v4 = a3;
  dispatch_queue_attr_t v5 = v4;
  if (v4)
  {
    queue = (dispatch_queue_s *)self->_queue;
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472LL;
    v7[2] = sub_1001A6A68;
    v7[3] = &unk_1004FD990;
    v7[4] = self;
    id v8 = v4;
    dispatch_async(queue, v7);
  }
}

- (void)synchronizeExperimentConfigurationsIfApplicableWithCompletion:(id)a3
{
  id v4 = (void (**)(id, void))a3;
  __int128 v23 = 0u;
  __int128 v24 = 0u;
  __int128 v25 = 0u;
  __int128 v26 = 0u;
  dispatch_queue_attr_t v5 = (void *)objc_claimAutoreleasedReturnValue( -[ADExperimentManager _getServerConfigurationInfosByIdentifier]( self,  "_getServerConfigurationInfosByIdentifier"));
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue([v5 allValues]);

  id obj = v6;
  id v7 = [v6 countByEnumeratingWithState:&v23 objects:v31 count:16];
  if (!v7) {
    goto LABEL_19;
  }
  id v8 = v7;
  uint64_t v9 = *(void *)v24;
  while (2)
  {
    for (i = 0LL; i != v8; i = (char *)i + 1)
    {
      if (*(void *)v24 != v9) {
        objc_enumerationMutation(obj);
      }
      id v11 = *(void **)(*((void *)&v23 + 1) + 8LL * (void)i);
      id v12 = (void *)objc_claimAutoreleasedReturnValue( -[ADExperimentManager _getExperimentStateForServerConfigurationInfo:]( self,  "_getExperimentStateForServerConfigurationInfo:",  v11));
      if (!v12)
      {
        id v14 = (void *)AFSiriLogContextDaemon;
        if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
        {
          id v15 = v14;
          double v16 = (void *)objc_claimAutoreleasedReturnValue([v11 configurationIdentifier]);
          *(_DWORD *)buf = 136315394;
          int v28 = "-[ADExperimentManager synchronizeExperimentConfigurationsIfApplicableWithCompletion:]";
          __int16 v29 = 2112;
          id v30 = v16;
          _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_INFO,  "%s Not Synchronizing experiment %@ since user is not yet a participant.",  buf,  0x16u);
        }

        __int16 v13 = 0LL;
        goto LABEL_16;
      }

      __int16 v13 = v12;
      if ([v12 didEnd])
      {
        double v17 = (void *)AFSiriLogContextDaemon;
        if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
        {
          id v18 = v17;
          unsigned int v19 = (void *)objc_claimAutoreleasedReturnValue([v11 configurationIdentifier]);
          *(_DWORD *)buf = 136315394;
          int v28 = "-[ADExperimentManager synchronizeExperimentConfigurationsIfApplicableWithCompletion:]";
          __int16 v29 = 2112;
          id v30 = v19;
          _os_log_impl( (void *)&_mh_execute_header,  v18,  OS_LOG_TYPE_INFO,  "%s Not synchronizing. %@ experiment ended",  buf,  0x16u);
        }

- (void)getExperimentForConfigurationIdentifier:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v7)
  {
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472LL;
    v15[2] = sub_1001A64C4;
    v15[3] = &unk_1004F4F18;
    id v16 = (id)objc_claimAutoreleasedReturnValue(+[NSDate now](&OBJC_CLASS___NSDate, "now"));
    double v17 = self;
    id v18 = v7;
    id v8 = v16;
    uint64_t v9 = objc_retainBlock(v15);
    queue = (dispatch_queue_s *)self->_queue;
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472LL;
    v12[2] = sub_1001A6610;
    v12[3] = &unk_1004FD9E0;
    v12[4] = self;
    id v13 = v6;
    id v14 = v9;
    id v11 = v9;
    dispatch_async(queue, v12);
  }
}

- (void)_logDidVendExperiment:(id)a3 fetchDetails:(id)a4 error:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472LL;
  v12[2] = sub_1001A62C4;
  v12[3] = &unk_1004F4F68;
  id v13 = a5;
  id v14 = v7;
  id v15 = v8;
  id v9 = v8;
  id v10 = v7;
  id v11 = v13;
  AnalyticsSendEventLazy(@"com.apple.siri.experiment.vended", v12);
}

- (id)_getConfigurationsByIdentifier
{
  configurationsByIdentifier = self->_configurationsByIdentifier;
  if (!configurationsByIdentifier)
  {
    id v4 = (NSDictionary *)objc_claimAutoreleasedReturnValue( -[ADExperimentManager _buildConfigurationsByIdentifier]( self,  "_buildConfigurationsByIdentifier"));
    dispatch_queue_attr_t v5 = self->_configurationsByIdentifier;
    self->_configurationsByIdentifier = v4;

    configurationsByIdentifier = self->_configurationsByIdentifier;
  }

  return configurationsByIdentifier;
}

- (id)_getServerConfigurationInfosByIdentifier
{
  serverConfigurationInfoByIdentifier = self->_serverConfigurationInfoByIdentifier;
  if (!serverConfigurationInfoByIdentifier)
  {
    id v4 = (NSDictionary *)objc_claimAutoreleasedReturnValue( -[ADExperimentManager _buildServerConfigurationInfosByIdentifier]( self,  "_buildServerConfigurationInfosByIdentifier"));
    dispatch_queue_attr_t v5 = self->_serverConfigurationInfoByIdentifier;
    self->_serverConfigurationInfoByIdentifier = v4;

    serverConfigurationInfoByIdentifier = self->_serverConfigurationInfoByIdentifier;
  }

  return serverConfigurationInfoByIdentifier;
}

- (id)_buildConfigurationsByIdentifier
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue( +[ADExperimentManager configurationForSiriVOXSounds]( &OBJC_CLASS___ADExperimentManager,  "configurationForSiriVOXSounds"));
  v29[0] = v2;
  id v3 = (void *)objc_claimAutoreleasedReturnValue( +[ADExperimentManager configurationForSiriVOXTapToSiriBehavior]( &OBJC_CLASS___ADExperimentManager,  "configurationForSiriVOXTapToSiriBehavior"));
  v29[1] = v3;
  id v4 = (void *)objc_claimAutoreleasedReturnValue( +[ADExperimentManager configurationForInvocationFeedback]( &OBJC_CLASS___ADExperimentManager,  "configurationForInvocationFeedback"));
  v29[2] = v4;
  dispatch_queue_attr_t v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v29, 3LL));

  id v6 = -[NSMutableDictionary initWithCapacity:]( [NSMutableDictionary alloc],  "initWithCapacity:",  [v5 count]);
  __int128 v20 = 0u;
  __int128 v21 = 0u;
  __int128 v22 = 0u;
  __int128 v23 = 0u;
  id v7 = v5;
  id v8 = [v7 countByEnumeratingWithState:&v20 objects:v28 count:16];
  if (v8)
  {
    id v10 = v8;
    uint64_t v11 = *(void *)v21;
    *(void *)&__int128 v9 = 136315394LL;
    __int128 v19 = v9;
    do
    {
      for (i = 0LL; i != v10; i = (char *)i + 1)
      {
        if (*(void *)v21 != v11) {
          objc_enumerationMutation(v7);
        }
        id v13 = *(void **)(*((void *)&v20 + 1) + 8LL * (void)i);
        id v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "identifier", v19, (void)v20));
        if (v14)
        {
          id v15 = (void *)objc_claimAutoreleasedReturnValue([v13 controlGroup]);
          if (v15)
          {
            -[NSMutableDictionary setObject:forKey:](v6, "setObject:forKey:", v13, v14);
          }

          else
          {
            double v17 = (os_log_s *)AFSiriLogContextDaemon;
            if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = v19;
              __int128 v25 = "-[ADExperimentManager _buildConfigurationsByIdentifier]";
              __int16 v26 = 2112;
              unsigned int v27 = v13;
              _os_log_error_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_ERROR,  "%s %@ has no control group.",  buf,  0x16u);
            }
          }
        }

        else
        {
          id v16 = (os_log_s *)AFSiriLogContextDaemon;
          if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = v19;
            __int128 v25 = "-[ADExperimentManager _buildConfigurationsByIdentifier]";
            __int16 v26 = 2112;
            unsigned int v27 = v13;
            _os_log_error_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_ERROR,  "%s %@ has no identifier.",  buf,  0x16u);
          }
        }
      }

      id v10 = [v7 countByEnumeratingWithState:&v20 objects:v28 count:16];
    }

    while (v10);
  }

  return v6;
}

- (id)_buildServerConfigurationInfosByIdentifier
{
  id v2 = -[NSMutableDictionary initWithCapacity:]( [NSMutableDictionary alloc],  "initWithCapacity:",  [&__NSArray0__struct count]);
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  id v3 = [&__NSArray0__struct countByEnumeratingWithState:&v13 objects:v21 count:16];
  if (v3)
  {
    id v5 = v3;
    uint64_t v6 = *(void *)v14;
    *(void *)&__int128 v4 = 136315394LL;
    __int128 v12 = v4;
    do
    {
      for (i = 0LL; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v14 != v6) {
          objc_enumerationMutation(&__NSArray0__struct);
        }
        id v8 = *(void **)(*((void *)&v13 + 1) + 8LL * (void)i);
        __int128 v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "configurationIdentifier", v12));
        if (v9)
        {
          -[NSMutableDictionary setObject:forKey:](v2, "setObject:forKey:", v8, v9);
        }

        else
        {
          id v10 = (os_log_s *)AFSiriLogContextDaemon;
          if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = v12;
            id v18 = "-[ADExperimentManager _buildServerConfigurationInfosByIdentifier]";
            __int16 v19 = 2112;
            __int128 v20 = v8;
            _os_log_error_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_ERROR,  "%s %@ has no identifier.",  buf,  0x16u);
          }
        }
      }

      id v5 = [&__NSArray0__struct countByEnumeratingWithState:&v13 objects:v21 count:16];
    }

    while (v5);
  }

  return v2;
}

- (id)_getContext
{
  currentContext = self->_currentContext;
  if (!currentContext)
  {
    __int128 v4 = (AFExperimentContext *)objc_claimAutoreleasedReturnValue(-[ADExperimentManager _buildContext](self, "_buildContext"));
    id v5 = self->_currentContext;
    self->_currentContext = v4;

    currentContext = self->_currentContext;
  }

  return currentContext;
}

- (id)_buildContext
{
  id v3 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  __int128 v4 = (void *)objc_claimAutoreleasedReturnValue(-[ADExperimentManager _getConfigurationsByIdentifier](self, "_getConfigurationsByIdentifier"));
  __int128 v9 = _NSConcreteStackBlock;
  uint64_t v10 = 3221225472LL;
  uint64_t v11 = sub_1001A6264;
  __int128 v12 = &unk_1004F4F90;
  __int128 v13 = self;
  __int128 v14 = v3;
  id v5 = v3;
  [v4 enumerateKeysAndObjectsUsingBlock:&v9];

  uint64_t v6 = objc_alloc(&OBJC_CLASS___AFExperimentContext);
  id v7 = -[AFExperimentContext initWithExperimentsByConfigurationIdentifier:]( v6,  "initWithExperimentsByConfigurationIdentifier:",  v5,  v9,  v10,  v11,  v12,  v13);

  return v7;
}

- (id)_experimentForExperimentConfiguration:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 identifier]);
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue( -[ADExperimentManager _experimentIdentifierForConfigurationIdentifier:]( self,  "_experimentIdentifierForConfigurationIdentifier:",  v5));

  uint64_t v7 = objc_opt_class(&OBJC_CLASS___NSString);
  uint64_t isKindOfClass = objc_opt_isKindOfClass(v6, v7);
  if ((isKindOfClass & 1) == 0)
  {
    uint64_t v9 = SiriCoreUUIDStringCreate(isKindOfClass);
    uint64_t v10 = objc_claimAutoreleasedReturnValue(v9);

    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([v4 identifier]);
    -[ADExperimentManager _setExperimentIdentifier:forConfigurationIdentifier:]( self,  "_setExperimentIdentifier:forConfigurationIdentifier:",  v10,  v11);

    uint64_t v6 = (void *)v10;
  }

  __int128 v12 = (void *)objc_claimAutoreleasedReturnValue( -[ADExperimentManager _createExperimentForExperimentConfiguration:experimentIdentifier:]( self,  "_createExperimentForExperimentConfiguration:experimentIdentifier:",  v4,  v6));

  return v12;
}

- (void)resetExperimentForConfigurationIdentifier:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1001A60D8;
  block[3] = &unk_1004FD9E0;
  block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(queue, block);
}

- (id)_experimentOverrideForExperimentConfiguration:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue( -[ADExperimentManager _groupOverrideIdentifierForExperimentConfiguration:]( self,  "_groupOverrideIdentifierForExperimentConfiguration:",  v4));
  if (!v5)
  {
    id v9 = 0LL;
LABEL_18:
    id v21 = 0LL;
    goto LABEL_19;
  }

  id v6 = (void *)objc_claimAutoreleasedReturnValue([v4 controlGroup]);
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 identifier]);
  unsigned int v8 = [v5 isEqualToString:v7];

  if (v8)
  {
    id v9 = v6;
  }

  else
  {
    __int128 v25 = 0u;
    __int128 v26 = 0u;
    __int128 v23 = 0u;
    __int128 v24 = 0u;
    id v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "experimentGroups", 0));
    id v9 = [v10 countByEnumeratingWithState:&v23 objects:v27 count:16];
    if (v9)
    {
      uint64_t v11 = *(void *)v24;
      while (2)
      {
        for (i = 0LL; i != v9; i = (char *)i + 1)
        {
          if (*(void *)v24 != v11) {
            objc_enumerationMutation(v10);
          }
          id v13 = *(void **)(*((void *)&v23 + 1) + 8LL * (void)i);
          __int128 v14 = (void *)objc_claimAutoreleasedReturnValue([v13 identifier]);
          unsigned int v15 = [v5 isEqualToString:v14];

          if (v15)
          {
            id v9 = v13;
            goto LABEL_15;
          }
        }

        id v9 = [v10 countByEnumeratingWithState:&v23 objects:v27 count:16];
        if (v9) {
          continue;
        }
        break;
      }
    }

- (id)_groupOverrideIdentifierForExperimentConfiguration:(id)a3
{
  uint64_t v3 = _AFPreferencesValueForKey([a3 identifier]);
  id v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  uint64_t v5 = objc_opt_class(&OBJC_CLASS___NSString);
  if ((objc_opt_isKindOfClass(v4, v5) & 1) != 0) {
    id v6 = v4;
  }
  else {
    id v6 = 0LL;
  }

  return v6;
}

- (id)_createExperimentForExperimentConfiguration:(id)a3 experimentIdentifier:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  unsigned int v8 = (void *)objc_claimAutoreleasedReturnValue( -[ADExperimentManager _experimentOverrideForExperimentConfiguration:]( self,  "_experimentOverrideForExperimentConfiguration:",  v6));
  id v9 = v8;
  if (v8)
  {
    id v10 = v8;
  }

  else
  {
    unint64_t v11 = -[ADExperimentManager _experimentGroupHashForExperimentConfiguration:experimentIdentifier:]( self,  "_experimentGroupHashForExperimentConfiguration:experimentIdentifier:",  v6,  v7);
    __int128 v40 = 0u;
    __int128 v41 = 0u;
    __int128 v42 = 0u;
    __int128 v43 = 0u;
    id v12 = (void *)objc_claimAutoreleasedReturnValue([v6 allGroups]);
    id v13 = [v12 countByEnumeratingWithState:&v40 objects:v47 count:16];
    if (v13)
    {
      id v14 = v13;
      unint64_t v15 = 0LL;
      uint64_t v16 = *(void *)v41;
      do
      {
        for (i = 0LL; i != v14; i = (char *)i + 1)
        {
          if (*(void *)v41 != v16) {
            objc_enumerationMutation(v12);
          }
          v15 += (unint64_t)[*(id *)(*((void *)&v40 + 1) + 8 * (void)i) allocation];
        }

        id v14 = [v12 countByEnumeratingWithState:&v40 objects:v47 count:16];
      }

      while (v14);

      if (v15) {
        unint64_t v15 = v11 % v15;
      }
    }

    else
    {

      unint64_t v15 = 0LL;
    }

    __int128 v38 = 0u;
    __int128 v39 = 0u;
    __int128 v36 = 0u;
    __int128 v37 = 0u;
    id v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "allGroups", 0));
    id v19 = [v18 countByEnumeratingWithState:&v36 objects:v46 count:16];
    if (v19)
    {
      id v20 = v19;
      unint64_t v21 = 0LL;
      uint64_t v22 = *(void *)v37;
LABEL_15:
      uint64_t v23 = 0LL;
      while (1)
      {
        if (*(void *)v37 != v22) {
          objc_enumerationMutation(v18);
        }
        __int128 v24 = *(void **)(*((void *)&v36 + 1) + 8 * v23);
        v21 += (unint64_t)[v24 allocation];
        if (v15 < v21) {
          break;
        }
        if (v20 == (id)++v23)
        {
          id v20 = [v18 countByEnumeratingWithState:&v36 objects:v46 count:16];
          if (v20) {
            goto LABEL_15;
          }
          goto LABEL_21;
        }
      }

      id v25 = v24;

      if (v25) {
        goto LABEL_29;
      }
    }

    else
    {
LABEL_21:
    }

    __int128 v26 = (os_log_s *)AFSiriLogContextUtility;
    if (os_log_type_enabled(AFSiriLogContextUtility, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      unint64_t v45 = "-[ADExperimentManager _createExperimentForExperimentConfiguration:experimentIdentifier:]";
      _os_log_error_impl( (void *)&_mh_execute_header,  v26,  OS_LOG_TYPE_ERROR,  "%s Unable to select deployment group based on allocation.",  buf,  0xCu);
    }

    unsigned int v27 = (void *)objc_claimAutoreleasedReturnValue([v6 controlGroup]);
    int v28 = v27;
    if (v27)
    {
      id v25 = v27;
    }

    else
    {
      __int16 v29 = (void *)objc_claimAutoreleasedReturnValue([v6 experimentGroups]);
      id v25 = (id)objc_claimAutoreleasedReturnValue([v29 firstObject]);
    }

LABEL_29:
    id v30 = objc_alloc(&OBJC_CLASS___AFExperiment);
    id v31 = (void *)objc_claimAutoreleasedReturnValue([v6 identifier]);
    __int16 v32 = (void *)objc_claimAutoreleasedReturnValue([v6 version]);
    id v33 = (void *)objc_claimAutoreleasedReturnValue([v25 identifier]);
    BOOL v34 = (void *)objc_claimAutoreleasedReturnValue([v25 properties]);
    id v10 = [v30 initWithConfigurationIdentifier:v31 configurationVersion:v32 deploymentGroupIdentifier:v33 deploymentGroupProperties:v34 deploymentReason:1];
  }

  return v10;
}

- (unint64_t)_experimentGroupHashForExperimentConfiguration:(id)a3 experimentIdentifier:(id)a4
{
  id v5 = a3;
  id v6 = (void *)objc_claimAutoreleasedReturnValue([a4 dataUsingEncoding:4]);
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v5 salt]);

  unsigned int v8 = (void *)objc_claimAutoreleasedReturnValue([v7 dataUsingEncoding:4]);
  uint64_t v9 = AFSecurityDigestData(v6, v8, 2LL, 0LL);
  id v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
  id v11 = [v10 hash];

  return (unint64_t)v11;
}

- (id)_experimentIdentifierForConfigurationIdentifier:(id)a3
{
  id v3 = a3;
  id v4 = (void *)objc_claimAutoreleasedReturnValue(+[ADPreferences sharedPreferences](&OBJC_CLASS___ADPreferences, "sharedPreferences"));
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 experimentIdentifierForConfigurationIdentifier:v3]);

  return v5;
}

- (void)_setExperimentIdentifier:(id)a3 forConfigurationIdentifier:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = (id)objc_claimAutoreleasedReturnValue(+[ADPreferences sharedPreferences](&OBJC_CLASS___ADPreferences, "sharedPreferences"));
  [v7 setExperimentIdentifier:v6 forConfigurationIdentifier:v5];

  [v7 synchronize];
}

- (void)_serverConfigurationForServerConfigurationInfo:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  unsigned int v8 = (void *)objc_claimAutoreleasedReturnValue( -[ADExperimentManager _getExperimentStateForServerConfigurationInfo:]( self,  "_getExperimentStateForServerConfigurationInfo:",  v6));
  if (![v8 didEnd])
  {
    [v6 maxTimeToSync];
    double v12 = v11;
    id v13 = (void *)objc_claimAutoreleasedReturnValue([v8 lastSyncDate]);
    [v13 timeIntervalSinceNow];
    double v15 = v14;

    if (v8 && v12 >= -v15)
    {
      uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue(-[ADExperimentManager _getConfigurationsByIdentifier](self, "_getConfigurationsByIdentifier"));
      double v17 = (void *)objc_claimAutoreleasedReturnValue([v6 configurationIdentifier]);
      uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([v16 objectForKey:v17]);

      if (v9)
      {
LABEL_8:
        (*((void (**)(id, void *, void, void))v7 + 2))(v7, v9, 0LL, 0LL);
        goto LABEL_9;
      }

      uint64_t v18 = objc_claimAutoreleasedReturnValue( -[ADExperimentManager _fetchCachedServerConfigurationForConfigurationInfo:]( self,  "_fetchCachedServerConfigurationForConfigurationInfo:",  v6));
      if (v18)
      {
        uint64_t v9 = (void *)v18;
        goto LABEL_8;
      }
    }

    v19[0] = _NSConcreteStackBlock;
    v19[1] = 3221225472LL;
    v19[2] = sub_1001A5BE8;
    v19[3] = &unk_1004F68A0;
    v19[4] = self;
    id v21 = v7;
    id v20 = v6;
    -[ADExperimentManager _remoteFetchConfigMetadataWithServerConfigurationInfo:completion:]( self,  "_remoteFetchConfigMetadataWithServerConfigurationInfo:completion:",  v20,  v19);

    goto LABEL_11;
  }

  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([v6 configurationIdentifier]);
  id v10 = (void *)objc_claimAutoreleasedReturnValue( -[ADExperimentManager _fallbackConfigurationForEndedExperimentWithIdentifier:experimentState:]( self,  "_fallbackConfigurationForEndedExperimentWithIdentifier:experimentState:",  v9,  v8));
  (*((void (**)(id, void *, void, void))v7 + 2))(v7, v10, 0LL, 0LL);

LABEL_9:
LABEL_11:
}

- (BOOL)_isEndingGroupIdentifier:(id)a3 validForConfiguration:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 controlGroup]);
  unsigned int v8 = (void *)objc_claimAutoreleasedReturnValue([v7 identifier]);
  unsigned __int8 v9 = [v8 isEqualToString:v5];

  if ((v9 & 1) != 0)
  {
    LOBYTE(v10) = 1;
  }

  else
  {
    __int128 v19 = 0u;
    __int128 v20 = 0u;
    __int128 v17 = 0u;
    __int128 v18 = 0u;
    double v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "experimentGroups", 0));
    id v10 = [v11 countByEnumeratingWithState:&v17 objects:v21 count:16];
    if (v10)
    {
      uint64_t v12 = *(void *)v18;
      while (2)
      {
        for (i = 0LL; i != v10; i = (char *)i + 1)
        {
          if (*(void *)v18 != v12) {
            objc_enumerationMutation(v11);
          }
          double v14 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(*((void *)&v17 + 1) + 8 * (void)i) identifier]);
          unsigned __int8 v15 = [v14 isEqualToString:v5];

          if ((v15 & 1) != 0)
          {
            LOBYTE(v10) = 1;
            goto LABEL_13;
          }
        }

        id v10 = [v11 countByEnumeratingWithState:&v17 objects:v21 count:16];
        if (v10) {
          continue;
        }
        break;
      }
    }

- (id)_fallbackConfigurationForEndedExperimentWithIdentifier:(id)a3 experimentState:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = objc_alloc(&OBJC_CLASS___AFExperimentGroup);
  unsigned int v8 = (void *)objc_claimAutoreleasedReturnValue([v5 endingGroupIdentifier]);
  id v9 = [v7 initWithIdentifier:v8 allocation:100 properties:0];

  id v10 = objc_alloc(&OBJC_CLASS___AFExperimentConfiguration);
  double v11 = (void *)objc_claimAutoreleasedReturnValue([v5 version]);

  uint64_t v12 = -[AFExperimentConfiguration initWithType:identifier:version:controlGroup:experimentGroups:salt:]( v10,  "initWithType:identifier:version:controlGroup:experimentGroups:salt:",  2LL,  v6,  v11,  v9,  &__NSArray0__struct,  @"salt");
  return v12;
}

- (void)_remoteFetchConfigMetadataWithServerConfigurationInfo:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  session = self->_session;
  if (!session)
  {
    id v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSURLSessionConfiguration ephemeralSessionConfiguration]( &OBJC_CLASS___NSURLSessionConfiguration,  "ephemeralSessionConfiguration"));
    [v9 setTimeoutIntervalForResource:15.0];
    [v9 setAllowsCellularAccess:1];
    id v10 = (NSURLSession *)objc_claimAutoreleasedReturnValue( +[NSURLSession sessionWithConfiguration:]( &OBJC_CLASS___NSURLSession,  "sessionWithConfiguration:",  v9));
    double v11 = self->_session;
    self->_session = v10;

    session = self->_session;
  }

  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue([v6 configurationURL]);
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472LL;
  v15[2] = sub_1001A55AC;
  v15[3] = &unk_1004F4FF8;
  id v16 = v6;
  id v17 = v7;
  id v13 = v6;
  id v14 = v7;
  -[ADExperimentManager _resolveDataTaskForURLSession:URL:completion:]( self,  "_resolveDataTaskForURLSession:URL:completion:",  session,  v12,  v15);
}

- (void)_resolveDataTaskForURLSession:(id)a3 URL:(id)a4 completion:(id)a5
{
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472LL;
  v9[2] = sub_1001A5594;
  v9[3] = &unk_1004F5020;
  id v10 = a5;
  id v7 = v10;
  unsigned int v8 = (void *)objc_claimAutoreleasedReturnValue([a3 dataTaskWithURL:a4 completionHandler:v9]);
  [v8 resume];
}

- (void)_storeServerConfig:(id)a3 completion:(id)a4
{
  id v5 = a3;
  id v6 = (void (**)(id, void *))a4;
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v5 identifier]);
  unsigned int v8 = (void *)objc_claimAutoreleasedReturnValue([v7 stringByAppendingString:@".plist"]);

  uint64_t v11 = AFUserSupportDirectoryPath(v9, v10);
  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
  id v13 = (void *)objc_claimAutoreleasedReturnValue([v12 stringByAppendingPathComponent:v8]);
  id v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL fileURLWithPath:](&OBJC_CLASS___NSURL, "fileURLWithPath:", v13));

  if (!v14)
  {
    unsigned __int8 v15 = (os_log_s *)AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      id v25 = "-[ADExperimentManager _storeServerConfig:completion:]";
      _os_log_error_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_ERROR,  "%s Directory is unavailable for writing configuration cache",  buf,  0xCu);
    }

    id v16 = (void *)objc_claimAutoreleasedReturnValue(+[AFError errorWithCode:](&OBJC_CLASS___AFError, "errorWithCode:", 3309LL));
    v6[2](v6, v16);
  }

  id v17 = (void *)objc_claimAutoreleasedReturnValue([v5 buildDictionaryRepresentation]);
  id v23 = 0LL;
  unsigned __int8 v18 = [v17 writeToURL:v14 error:&v23];
  id v19 = v23;

  id v20 = 0LL;
  if ((v18 & 1) == 0)
  {
    id v21 = (os_log_s *)AFSiriLogContextDaemon;
    BOOL v22 = os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR);
    id v20 = v19;
    if (v22)
    {
      *(_DWORD *)buf = 136315394;
      id v25 = "-[ADExperimentManager _storeServerConfig:completion:]";
      __int16 v26 = 2114;
      id v27 = v19;
      _os_log_error_impl( (void *)&_mh_execute_header,  v21,  OS_LOG_TYPE_ERROR,  "%s Not able to write remote configuration to cache. {writeError: %{public}@}",  buf,  0x16u);
      id v20 = v19;
    }
  }

  v6[2](v6, v20);
}

- (id)_fetchCachedServerConfigurationForConfigurationInfo:(id)a3
{
  id v4 = (void *)objc_claimAutoreleasedReturnValue([a3 configurationIdentifier]);
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 stringByAppendingString:@".plist"]);

  uint64_t v8 = AFUserSupportDirectoryPath(v6, v7);
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([v9 stringByAppendingPathComponent:v5]);
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL fileURLWithPath:](&OBJC_CLASS___NSURL, "fileURLWithPath:", v10));

  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(-[ADExperimentManager _fetchDictionaryWithFileURL:](self, "_fetchDictionaryWithFileURL:", v11));
  if (v12) {
    id v13 = -[AFExperimentConfiguration initWithDictionaryRepresentation:]( objc_alloc(&OBJC_CLASS___AFExperimentConfiguration),  "initWithDictionaryRepresentation:",  v12);
  }
  else {
    id v13 = 0LL;
  }

  return v13;
}

- (id)_fetchDictionaryWithFileURL:(id)a3
{
  id v8 = 0LL;
  id v3 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithContentsOfURL:error:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithContentsOfURL:error:",  a3,  &v8));
  id v4 = v8;
  if (v4)
  {
    id v5 = (os_log_s *)AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      uint64_t v10 = "-[ADExperimentManager _fetchDictionaryWithFileURL:]";
      __int16 v11 = 2112;
      id v12 = v4;
      _os_log_error_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_ERROR,  "%s Could not deserialize configuration file %@",  buf,  0x16u);
    }

    id v6 = 0LL;
  }

  else
  {
    id v6 = v3;
  }

  return v6;
}

- (id)_getExperimentStateForServerConfigurationInfo:(id)a3
{
  id v3 = a3;
  id v4 = (void *)objc_claimAutoreleasedReturnValue(+[ADPreferences sharedPreferences](&OBJC_CLASS___ADPreferences, "sharedPreferences"));
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v3 configurationIdentifier]);

  id v6 = (void *)objc_claimAutoreleasedReturnValue([v4 getExperimentStateForConfigurationIdentifier:v5]);
  if (v6) {
    id v7 = [[AFExperimentState alloc] initWithDictionaryRepresentation:v6];
  }
  else {
    id v7 = 0LL;
  }

  return v7;
}

- (void)_setExperimentState:(id)a3 forServerConfigurationInfo:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v9 = (id)objc_claimAutoreleasedReturnValue(+[ADPreferences sharedPreferences](&OBJC_CLASS___ADPreferences, "sharedPreferences"));
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 buildDictionaryRepresentation]);

  id v8 = (void *)objc_claimAutoreleasedReturnValue([v5 configurationIdentifier]);
  [v9 setExperimentState:v7 forConfigurationIdentifier:v8];
}

- (void).cxx_destruct
{
}

+ (id)sharedManager
{
  if (qword_100578028 != -1) {
    dispatch_once(&qword_100578028, &stru_1004F4EF0);
  }
  return (id)qword_100578030;
}

+ (id)configurationForInvocationFeedback
{
  return  +[AFExperimentConfiguration newWithBuilder:]( &OBJC_CLASS___AFExperimentConfiguration,  "newWithBuilder:",  &stru_1004F6958);
}

+ (id)configurationForSiriVOXSounds
{
  id v16 = objc_alloc(&OBJC_CLASS___AFExperimentConfiguration);
  uint64_t v15 = AFSiriVOXSoundsExperimentConfigurationIdentifier;
  uint64_t v2 = AFSiriVOXSoundsExperimentGroupPropertyKeyPlaysTwoShotSound;
  uint64_t v3 = AFSiriVOXSoundsExperimentGroupPropertyKeyPlaysSessionInactiveSound;
  uint64_t v18 = AFSiriVOXSoundsExperimentGroupPropertyKeyPlaysTwoShotSound;
  uint64_t v19 = AFSiriVOXSoundsExperimentGroupPropertyKeyPlaysSessionInactiveSound;
  id v20 = &__kCFBooleanTrue;
  id v21 = &__kCFBooleanTrue;
  id v4 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v20,  &v18,  2LL));
  id v5 = [[AFExperimentGroup alloc] initWithIdentifier:@"control" allocation:0 properties:v4];

  uint64_t v18 = v2;
  uint64_t v19 = v3;
  id v20 = &__kCFBooleanFalse;
  id v21 = &__kCFBooleanFalse;
  id v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v20,  &v18,  2LL));
  id v7 = [[AFExperimentGroup alloc] initWithIdentifier:@"no_sound" allocation:0 properties:v6];

  v17[0] = v7;
  uint64_t v18 = v2;
  uint64_t v19 = v3;
  id v20 = &__kCFBooleanTrue;
  id v21 = &__kCFBooleanFalse;
  id v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v20,  &v18,  2LL));
  id v9 = [[AFExperimentGroup alloc] initWithIdentifier:@"two_shot_sound_only" allocation:100 properties:v8];

  v17[1] = v9;
  uint64_t v18 = v2;
  uint64_t v19 = v3;
  id v20 = &__kCFBooleanFalse;
  id v21 = &__kCFBooleanTrue;
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v20,  &v18,  2LL));
  id v11 = [[AFExperimentGroup alloc] initWithIdentifier:@"session_inactive_sound_only" allocation:0 properties:v10];

  v17[2] = v11;
  id v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v17, 3LL));
  id v13 = -[AFExperimentConfiguration initWithType:identifier:version:controlGroup:experimentGroups:salt:]( v16,  "initWithType:identifier:version:controlGroup:experimentGroups:salt:",  1LL,  v15,  @"1.0.4",  v5,  v12,  @"046F15EA-A8D5-4FFB-89F0-07F9861366C7");

  return v13;
}

+ (id)configurationForSiriVOXTapToSiriBehavior
{
  uint64_t v2 = objc_alloc(&OBJC_CLASS___AFExperimentConfiguration);
  uint64_t v3 = AFSiriVOXTapToSiriBehaviorExperimentConfigurationIdentifier;
  uint64_t v4 = AFSiriVOXTapToSiriBehaviorExperimentGroupPropertyKeyPlaysSound;
  uint64_t v13 = AFSiriVOXTapToSiriBehaviorExperimentGroupPropertyKeyPlaysSound;
  id v14 = &__kCFBooleanTrue;
  id v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v14,  &v13,  1LL));
  id v6 = [[AFExperimentGroup alloc] initWithIdentifier:@"control" allocation:100 properties:v5];

  uint64_t v13 = v4;
  id v14 = &__kCFBooleanFalse;
  id v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v14,  &v13,  1LL));
  id v8 = [[AFExperimentGroup alloc] initWithIdentifier:@"no_sound" allocation:0 properties:v7];

  id v12 = v8;
  id v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v12, 1LL));
  uint64_t v10 = -[AFExperimentConfiguration initWithType:identifier:version:controlGroup:experimentGroups:salt:]( v2,  "initWithType:identifier:version:controlGroup:experimentGroups:salt:",  1LL,  v3,  @"1.0.0",  v6,  v9,  @"25EDCBB2-41FF-4FB6-9518-3A60CF1E463F");

  return v10;
}

@end