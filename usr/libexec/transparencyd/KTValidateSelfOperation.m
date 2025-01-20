@interface KTValidateSelfOperation
- (BOOL)hasDeviceErrorForUri:(id)a3;
- (BOOL)isOptInSelfValidation;
- (BOOL)validateOptInStatusWithAccountKey:(id)a3 error:(id *)a4;
- (KTAccountKeyProtocol)accountKeyServer;
- (KTOperationDependencies)deps;
- (KTSelfVerificationInfo)selfInfo;
- (KTValidateSelfOperation)initWithApplication:(id)a3 dependencies:(id)a4 isOptInSelfValidation:(BOOL)a5;
- (NSDate)expectedResolutionDate;
- (NSMutableDictionary)cachedTimes;
- (NSMutableDictionary)selfErrors;
- (NSMutableDictionary)selfResults;
- (NSMutableDictionary)transparentDatas;
- (NSOperation)finishedOp;
- (NSString)application;
- (OS_dispatch_queue)uriQueue;
- (id)ktLogData:(id)a3 accountKey:(id)a4;
- (void)fillStatus;
- (void)groupStart;
- (void)handleOperationResults:(id)a3;
- (void)setAccountKeyServer:(id)a3;
- (void)setApplication:(id)a3;
- (void)setCachedTimes:(id)a3;
- (void)setDeps:(id)a3;
- (void)setFinishedOp:(id)a3;
- (void)setIsOptInSelfValidation:(BOOL)a3;
- (void)setSelfErrors:(id)a3;
- (void)setSelfInfo:(id)a3;
- (void)setSelfResults:(id)a3;
- (void)setTransparentDatas:(id)a3;
- (void)setUriQueue:(id)a3;
@end

@implementation KTValidateSelfOperation

- (KTValidateSelfOperation)initWithApplication:(id)a3 dependencies:(id)a4 isOptInSelfValidation:(BOOL)a5
{
  BOOL v5 = a5;
  id v9 = a3;
  id v10 = a4;
  v23.receiver = self;
  v23.super_class = (Class)&OBJC_CLASS___KTValidateSelfOperation;
  v11 = -[KTGroupOperation init](&v23, "init");
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)(v11 + 134), a4);
    objc_storeStrong((id *)(v12 + 142), a3);
    dispatch_queue_attr_t v13 = dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v14 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v13);
    dispatch_queue_t v15 = dispatch_queue_create("ValidateSelf_URIWaiter", v14);
    [v12 setUriQueue:v15];

    v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
    [v12 setTransparentDatas:v16];

    v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
    [v12 setSelfErrors:v17];

    v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
    [v12 setSelfResults:v18];

    v19 = (void *)objc_claimAutoreleasedReturnValue([v10 accountKeyService]);
    v20 = (void *)objc_claimAutoreleasedReturnValue([v19 accountKeyService:v9]);
    [v12 setAccountKeyServer:v20];

    v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
    [v12 setCachedTimes:v21];

    [v12 setIsOptInSelfValidation:v5];
  }

  return (KTValidateSelfOperation *)v12;
}

- (void)groupStart
{
  v3 = objc_alloc_init(&OBJC_CLASS___NSOperation);
  -[KTValidateSelfOperation setFinishedOp:](self, "setFinishedOp:", v3);

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[KTValidateSelfOperation finishedOp](self, "finishedOp"));
  -[KTGroupOperation dependOnBeforeGroupFinished:](self, "dependOnBeforeGroupFinished:", v4);

  if (qword_1002E6470 != -1) {
    dispatch_once(&qword_1002E6470, &stru_100278508);
  }
  BOOL v5 = (os_log_s *)qword_1002E6478;
  if (os_log_type_enabled((os_log_t)qword_1002E6478, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "ValidateSelf: start", buf, 2u);
  }

  *(void *)buf = 0LL;
  objc_initWeak((id *)buf, self);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[KTValidateSelfOperation deps](self, "deps"));
  v7 = (void *)objc_claimAutoreleasedReturnValue([v6 smDataStore]);
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[KTValidateSelfOperation application](self, "application"));
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472LL;
  v9[2] = sub_100021EAC;
  v9[3] = &unk_1002787D0;
  objc_copyWeak(&v10, (id *)buf);
  [v7 fetchSelfVerificationInfoForApplication:v8 complete:v9];

  objc_destroyWeak(&v10);
  objc_destroyWeak((id *)buf);
}

- (BOOL)hasDeviceErrorForUri:(id)a3
{
  id v4 = a3;
  BOOL v5 = (void *)objc_claimAutoreleasedReturnValue(-[KTValidateSelfOperation selfInfo](self, "selfInfo"));
  v6 = (void *)objc_claimAutoreleasedReturnValue([v5 uriToServerLoggableDatas]);
  v7 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKeyedSubscript:v4]);

  if (v7)
  {
    __int128 v15 = 0u;
    __int128 v16 = 0u;
    __int128 v13 = 0u;
    __int128 v14 = 0u;
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "serverLoggableDatas", 0));
    id v9 = [v8 countByEnumeratingWithState:&v13 objects:v17 count:16];
    if (v9)
    {
      uint64_t v10 = *(void *)v14;
      while (2)
      {
        for (i = 0LL; i != v9; i = (char *)i + 1)
        {
          if (*(void *)v14 != v10) {
            objc_enumerationMutation(v8);
          }
          if (![*(id *)(*((void *)&v13 + 1) + 8 * (void)i) result])
          {
            LOBYTE(v9) = 1;
            goto LABEL_12;
          }
        }

        id v9 = [v8 countByEnumeratingWithState:&v13 objects:v17 count:16];
        if (v9) {
          continue;
        }
        break;
      }
    }

- (void)fillStatus
{
  v2 = self;
  __int128 v41 = 0u;
  __int128 v42 = 0u;
  __int128 v43 = 0u;
  __int128 v44 = 0u;
  id obj = (id)objc_claimAutoreleasedReturnValue(-[KTValidateSelfOperation selfResults](self, "selfResults"));
  id v39 = [obj countByEnumeratingWithState:&v41 objects:v51 count:16];
  v40 = v2;
  if (v39)
  {
    uint64_t v37 = *(void *)v42;
    v38 = 0LL;
    uint64_t v4 = 2LL;
    *(void *)&__int128 v3 = 141558530LL;
    __int128 v35 = v3;
    do
    {
      BOOL v5 = 0LL;
      do
      {
        if (*(void *)v42 != v37) {
          objc_enumerationMutation(obj);
        }
        uint64_t v6 = *(void *)(*((void *)&v41 + 1) + 8LL * (void)v5);
        v7 = (void *)objc_claimAutoreleasedReturnValue(-[KTValidateSelfOperation selfResults](v2, "selfResults", v35));
        v8 = (void *)objc_claimAutoreleasedReturnValue([v7 objectForKeyedSubscript:v6]);

        id v9 = [v8 unsignedIntegerValue];
        uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(-[KTValidateSelfOperation selfInfo](v2, "selfInfo"));
        v11 = (void *)objc_claimAutoreleasedReturnValue([v10 uriToServerLoggableDatas]);
        v12 = (void *)objc_claimAutoreleasedReturnValue([v11 objectForKeyedSubscript:v6]);
        __int128 v13 = (void *)objc_claimAutoreleasedReturnValue([v12 serverLoggableDatas]);

        if (v9 == (id)1)
        {
          uint64_t v14 = 0LL;
        }

        else if (v9)
        {
          uint64_t v14 = 2LL;
        }

        else if (-[KTValidateSelfOperation hasDeviceErrorForUri:](v40, "hasDeviceErrorForUri:", v6))
        {
          uint64_t v14 = 1LL;
        }

        else
        {
          __int128 v15 = (void *)objc_claimAutoreleasedReturnValue(-[KTValidateSelfOperation selfErrors](v40, "selfErrors"));
          __int128 v16 = (void *)objc_claimAutoreleasedReturnValue([v15 objectForKeyedSubscript:@"optIn"]);

          if (v16) {
            uint64_t v14 = 4LL;
          }
          else {
            uint64_t v14 = 3LL;
          }
        }

        if (qword_1002E6470 != -1) {
          dispatch_once(&qword_1002E6470, &stru_1002787F0);
        }
        v17 = (void *)qword_1002E6478;
        if (os_log_type_enabled((os_log_t)qword_1002E6478, OS_LOG_TYPE_DEFAULT))
        {
          v18 = v17;
          v19 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInteger:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedInteger:",  v14));
          *(_DWORD *)buf = v35;
          uint64_t v46 = 1752392040LL;
          __int16 v47 = 2112;
          uint64_t v48 = v6;
          __int16 v49 = 2112;
          v50 = v19;
          _os_log_impl( (void *)&_mh_execute_header,  v18,  OS_LOG_TYPE_DEFAULT,  "ValidateSelf fillStatus: %{mask.hash}@ has uriStatus %@",  buf,  0x20u);
        }

        if (dword_100246430[v14] <= dword_100246430[v4])
        {
          id v20 = v13;

          v38 = v20;
          uint64_t v4 = v14;
        }

        v2 = v40;

        BOOL v5 = (char *)v5 + 1;
      }

      while (v39 != v5);
      id v39 = [obj countByEnumeratingWithState:&v41 objects:v51 count:16];
    }

    while (v39);
  }

  else
  {
    v38 = 0LL;
    uint64_t v4 = 2LL;
  }

  if (qword_1002E6470 != -1) {
    dispatch_once(&qword_1002E6470, &stru_100278810);
  }
  v21 = (void *)qword_1002E6478;
  if (os_log_type_enabled((os_log_t)qword_1002E6478, OS_LOG_TYPE_DEFAULT))
  {
    v22 = v21;
    objc_super v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInteger:", v4));
    *(_DWORD *)buf = 138412290;
    uint64_t v46 = (uint64_t)v23;
    _os_log_impl( (void *)&_mh_execute_header,  v22,  OS_LOG_TYPE_DEFAULT,  "ValidateSelf fillStatus: setting selfStatus to %@",  buf,  0xCu);

    v2 = v40;
  }

  v24 = v2;
  v25 = (void *)objc_claimAutoreleasedReturnValue(-[KTValidateSelfOperation deps](v2, "deps"));
  v26 = (void *)objc_claimAutoreleasedReturnValue([v25 stateMonitor]);
  [v26 setSelfStatus:v4];

  v27 = (void *)objc_claimAutoreleasedReturnValue(-[KTValidateSelfOperation deps](v24, "deps"));
  v28 = (void *)objc_claimAutoreleasedReturnValue([v27 stateMonitor]);
  [v28 setSelfDevices:v38];

  v29 = (void *)objc_claimAutoreleasedReturnValue(-[KTValidateSelfOperation deps](v24, "deps"));
  v30 = (void *)objc_claimAutoreleasedReturnValue([v29 stateMonitor]);
  v31 = (void *)objc_claimAutoreleasedReturnValue([v30 statusFilled]);
  [v31 fulfill];

  v32 = -[KTPendingFlag initWithFlag:delayInSeconds:]( objc_alloc(&OBJC_CLASS___KTPendingFlag),  "initWithFlag:delayInSeconds:",  @"StatusUpdate",  1.0);
  v33 = (void *)objc_claimAutoreleasedReturnValue(-[KTValidateSelfOperation deps](v24, "deps"));
  v34 = (void *)objc_claimAutoreleasedReturnValue([v33 flagHandler]);
  [v34 handlePendingFlag:v32];
}

- (BOOL)validateOptInStatusWithAccountKey:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[KTValidateSelfOperation transparentDatas](self, "transparentDatas"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[KTValidateSelfOperation ktLogData:accountKey:](self, "ktLogData:accountKey:", v7, v6));

  id v9 = (void *)objc_claimAutoreleasedReturnValue(-[KTValidateSelfOperation deps](self, "deps"));
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([v9 cloudRecords]);
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[KTValidateSelfOperation application](self, "application"));
  id v17 = 0LL;
  v12 = (void *)objc_claimAutoreleasedReturnValue([v10 evaluateKTLogData:v8 application:v11 error:&v17]);
  id v13 = v17;

  if (v12)
  {
    if (qword_1002E6470 != -1) {
      dispatch_once(&qword_1002E6470, &stru_100278850);
    }
    uint64_t v14 = (os_log_s *)qword_1002E6478;
    if (os_log_type_enabled((os_log_t)qword_1002E6478, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v19 = v12;
      _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_DEFAULT,  "evaluateKTLogData eval result: %@",  buf,  0xCu);
    }
  }

  else
  {
    if (qword_1002E6470 != -1) {
      dispatch_once(&qword_1002E6470, &stru_100278830);
    }
    __int128 v15 = (os_log_s *)qword_1002E6478;
    if (os_log_type_enabled((os_log_t)qword_1002E6478, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v19 = v13;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_ERROR, "evaluateKTLogData failure: %@", buf, 0xCu);
    }

    if (a4 && v13) {
      *a4 = v13;
    }
  }

  return v12 != 0LL;
}

- (id)ktLogData:(id)a3 accountKey:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472LL;
  v12[2] = sub_100024750;
  v12[3] = &unk_100278878;
  id v13 = v5;
  id v7 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  id v14 = v7;
  id v8 = v5;
  [v6 enumerateKeysAndObjectsUsingBlock:v12];

  id v9 = v14;
  id v10 = v7;

  return v10;
}

- (void)handleOperationResults:(id)a3
{
  uint64_t v46 = (void (**)(id, uint64_t, id, void *, void *))a3;
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(-[KTValidateSelfOperation selfInfo](self, "selfInfo"));
  if (v4)
  {
    id v5 = (void *)objc_claimAutoreleasedReturnValue(-[KTValidateSelfOperation transparentDatas](self, "transparentDatas"));
    if ([v5 count])
    {
      id v6 = (void *)objc_claimAutoreleasedReturnValue(-[KTValidateSelfOperation selfResults](self, "selfResults"));
      id v7 = [v6 count];

      if (v7)
      {
        id v47 = objc_alloc_init(&OBJC_CLASS___KTSelfValidationDiagnostics);
        id v8 = (void *)objc_claimAutoreleasedReturnValue(-[KTValidateSelfOperation selfInfo](self, "selfInfo"));
        id v9 = (void *)objc_claimAutoreleasedReturnValue([v8 diagnosticsJsonDictionary]);
        [v47 setKtSelfVerificationInfoDiagnosticsJson:v9];

        id v10 = (void *)objc_claimAutoreleasedReturnValue(-[KTValidateSelfOperation selfInfo](self, "selfInfo"));
        v11 = (void *)objc_claimAutoreleasedReturnValue([v10 selfDeviceID]);
        v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "kt_hexString"));
        [v47 setPushToken:v12];

        id v13 = (void *)objc_claimAutoreleasedReturnValue(-[KTValidateSelfOperation accountKeyServer](self, "accountKeyServer"));
        LODWORD(v11) = [v13 haveIdentity];

        if ((_DWORD)v11)
        {
          *(void *)buf = 0LL;
          *(void *)&uint8_t buf[8] = buf;
          *(void *)&buf[16] = 0x3032000000LL;
          v66 = sub_100025084;
          v67 = sub_100025094;
          id v68 = 0LL;
          uint64_t v58 = 0LL;
          v59 = &v58;
          uint64_t v60 = 0x3032000000LL;
          v61 = sub_100025084;
          v62 = sub_100025094;
          id v63 = 0LL;
          id v14 = (void *)objc_claimAutoreleasedReturnValue(-[KTValidateSelfOperation accountKeyServer](self, "accountKeyServer"));
          v57[0] = _NSConcreteStackBlock;
          v57[1] = 3221225472LL;
          v57[2] = sub_10002509C;
          v57[3] = &unk_1002788C0;
          v57[4] = buf;
          v57[5] = &v58;
          [v14 signData:0 completionBlock:v57];

          if (*(void *)(*(void *)&buf[8] + 40LL) && v59[5])
          {
            objc_msgSend(v47, "setRawAccountKey:");
            [v47 setAccountKey:v59[5]];
          }

          _Block_object_dispose(&v58, 8);

          _Block_object_dispose(buf, 8);
        }

        v51 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
        v52 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
        __int128 v55 = 0u;
        __int128 v56 = 0u;
        __int128 v53 = 0u;
        __int128 v54 = 0u;
        __int128 v15 = (void *)objc_claimAutoreleasedReturnValue(-[KTValidateSelfOperation selfInfo](self, "selfInfo"));
        id obj = (id)objc_claimAutoreleasedReturnValue([v15 uriToServerLoggableDatas]);

        id v16 = [obj countByEnumeratingWithState:&v53 objects:v64 count:16];
        if (v16)
        {
          uint64_t v49 = 1LL;
          uint64_t v50 = *(void *)v54;
          do
          {
            for (i = 0LL; i != v16; i = (char *)i + 1)
            {
              if (*(void *)v54 != v50) {
                objc_enumerationMutation(obj);
              }
              uint64_t v18 = *(void *)(*((void *)&v53 + 1) + 8LL * (void)i);
              id v19 = (void *)objc_claimAutoreleasedReturnValue(-[KTValidateSelfOperation selfInfo](self, "selfInfo"));
              id v20 = (void *)objc_claimAutoreleasedReturnValue([v19 uriToServerLoggableDatas]);
              v21 = (void *)objc_claimAutoreleasedReturnValue([v20 objectForKeyedSubscript:v18]);

              v22 = (void *)objc_claimAutoreleasedReturnValue(-[KTValidateSelfOperation application](self, "application"));
              objc_super v23 = (void *)objc_claimAutoreleasedReturnValue( +[TransparencyApplication addApplicationPrefixForIdentifier:uri:]( &OBJC_CLASS___TransparencyApplication,  "addApplicationPrefixForIdentifier:uri:",  v22,  v18));

              id v24 = objc_alloc_init(&OBJC_CLASS___KTSelfValidationURIDiagnostics);
              v25 = (void *)objc_claimAutoreleasedReturnValue([v21 diagnosticsJsonDictionary]);
              [v24 setKtVerificationInfoDiagnosticsJson:v25];

              v26 = (void *)objc_claimAutoreleasedReturnValue([v21 serverLoggableDatas]);
              +[KTLoggableData combineLoggableDatasForUI:byAdding:]( &OBJC_CLASS___KTLoggableData,  "combineLoggableDatasForUI:byAdding:",  v52,  v26);

              v27 = (void *)objc_claimAutoreleasedReturnValue(-[KTValidateSelfOperation selfResults](self, "selfResults"));
              v28 = (void *)objc_claimAutoreleasedReturnValue([v27 objectForKeyedSubscript:v23]);

              signed int v29 = [v28 intValue];
              v30 = @"OK";
              switch(v29)
              {
                case 0:
                  uint64_t v49 = v29;
                  v30 = @"Failed";
                  break;
                case 1:
                  break;
                case 2:
                  uint64_t v49 = v29;
                  v30 = @"Pending";
                  break;
                case 3:
                  v30 = @"Ignored";
                  break;
                default:
                  uint64_t v49 = 0LL;
                  v30 = @"Unknown";
                  break;
              }

              [v24 setResult:v30];
              v31 = (void *)objc_claimAutoreleasedReturnValue(-[KTValidateSelfOperation cachedTimes](self, "cachedTimes"));
              v32 = (void *)objc_claimAutoreleasedReturnValue([v31 objectForKeyedSubscript:v23]);
              [v24 setRequestTime:v32];

              v33 = (void *)objc_claimAutoreleasedReturnValue(-[KTValidateSelfOperation selfErrors](self, "selfErrors"));
              v34 = (void *)objc_claimAutoreleasedReturnValue([v33 objectForKeyedSubscript:v23]);

              if (v34) {
                [v24 setError:v34];
              }
              __int128 v35 = (void *)objc_claimAutoreleasedReturnValue(-[KTValidateSelfOperation transparentDatas](self, "transparentDatas"));
              v36 = (void *)objc_claimAutoreleasedReturnValue([v35 objectForKeyedSubscript:v23]);

              uint64_t v37 = (void *)objc_claimAutoreleasedReturnValue([v36 diagnosticsJsonDictionary]);
              [v24 setTransparentDataDiagnosticsJson:v37];

              [v51 setObject:v24 forKeyedSubscript:v23];
            }

            id v16 = [obj countByEnumeratingWithState:&v53 objects:v64 count:16];
          }

          while (v16);
        }

        else
        {
          uint64_t v49 = 1LL;
        }

        [v47 setUriToDiagnostics:v51];
        __int128 v44 = (void *)objc_claimAutoreleasedReturnValue([v52 allValues]);
        v45 = (void *)objc_claimAutoreleasedReturnValue(-[KTResultOperation error](self, "error"));
        v46[2](v46, v49, v47, v44, v45);

        goto LABEL_32;
      }
    }

    else
    {
    }
  }

  if (qword_1002E6470 != -1) {
    dispatch_once(&qword_1002E6470, &stru_100278898);
  }
  v38 = (void *)qword_1002E6478;
  if (os_log_type_enabled((os_log_t)qword_1002E6478, OS_LOG_TYPE_DEFAULT))
  {
    id v39 = v38;
    v40 = (void *)objc_claimAutoreleasedReturnValue(-[KTValidateSelfOperation selfInfo](self, "selfInfo"));
    __int128 v41 = (void *)objc_claimAutoreleasedReturnValue(-[KTValidateSelfOperation transparentDatas](self, "transparentDatas"));
    unsigned int v42 = [v41 count];
    __int128 v43 = (void *)objc_claimAutoreleasedReturnValue(-[KTValidateSelfOperation selfResults](self, "selfResults"));
    *(_DWORD *)buf = 138412802;
    *(void *)&uint8_t buf[4] = v40;
    *(_WORD *)&buf[12] = 1024;
    *(_DWORD *)&buf[14] = v42;
    *(_WORD *)&buf[18] = 1024;
    *(_DWORD *)&buf[20] = [v43 count];
    _os_log_impl( (void *)&_mh_execute_header,  v39,  OS_LOG_TYPE_DEFAULT,  "missing inputdata: selfinfo: %@ transparentDatas: %d selfResults: %d",  buf,  0x18u);
  }

  id v47 = (id)objc_claimAutoreleasedReturnValue(-[KTResultOperation error](self, "error"));
  v46[2](v46, 0LL, 0LL, 0LL, v47);
LABEL_32:
}

- (NSDate)expectedResolutionDate
{
  return (NSDate *)objc_getProperty(self, a2, 126LL, 1);
}

- (KTOperationDependencies)deps
{
  return (KTOperationDependencies *)objc_getProperty(self, a2, 134LL, 1);
}

- (void)setDeps:(id)a3
{
}

- (NSString)application
{
  return (NSString *)objc_getProperty(self, a2, 142LL, 1);
}

- (void)setApplication:(id)a3
{
}

- (NSOperation)finishedOp
{
  return (NSOperation *)objc_getProperty(self, a2, 150LL, 1);
}

- (void)setFinishedOp:(id)a3
{
}

- (OS_dispatch_queue)uriQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 158LL, 1);
}

- (void)setUriQueue:(id)a3
{
}

- (KTSelfVerificationInfo)selfInfo
{
  return (KTSelfVerificationInfo *)objc_getProperty(self, a2, 166LL, 1);
}

- (void)setSelfInfo:(id)a3
{
}

- (NSMutableDictionary)transparentDatas
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 174LL, 1);
}

- (void)setTransparentDatas:(id)a3
{
}

- (NSMutableDictionary)selfErrors
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 182LL, 1);
}

- (void)setSelfErrors:(id)a3
{
}

- (NSMutableDictionary)selfResults
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 190LL, 1);
}

- (void)setSelfResults:(id)a3
{
}

- (KTAccountKeyProtocol)accountKeyServer
{
  return (KTAccountKeyProtocol *)objc_getProperty(self, a2, 198LL, 1);
}

- (void)setAccountKeyServer:(id)a3
{
}

- (NSMutableDictionary)cachedTimes
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 206LL, 1);
}

- (void)setCachedTimes:(id)a3
{
}

- (BOOL)isOptInSelfValidation
{
  return (uint64_t)self->super._startOperation & 1;
}

- (void)setIsOptInSelfValidation:(BOOL)a3
{
  LOBYTE(self->super._startOperation) = a3;
}

- (void).cxx_destruct
{
}

@end