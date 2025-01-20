@interface KTSetOptInStateOperation
- (KTOperationDependencies)deps;
- (KTOptInStateHolder)optInStates;
- (KTSetOptInStateOperation)initWithDependenics:(id)a3 intendedState:(id)a4 errorState:(id)a5 optinStates:(id)a6;
- (KTStateString)errorState;
- (KTStateString)intendedState;
- (KTStateString)nextState;
- (NSMutableDictionary)optInResult;
- (NSString)applicationId;
- (id)notificationKey;
- (id)optInKey;
- (id)verifyResponse:(id)a3 uri:(id)a4 expectedState:(BOOL)a5;
- (unint64_t)decodeAndVerifyOptInOutResponse:(id)a3 optInOutState:(BOOL)a4 optInOutTime:(id *)a5 error:(id *)a6;
- (unint64_t)decodeAndVerifySMT:(id)a3 optInOutState:(BOOL)a4 optInOutTime:(id *)a5 error:(id *)a6;
- (void)clearCoreFollowUp;
- (void)clearFailureEvents;
- (void)clearOptInStateAndPushToCloud;
- (void)groupStart;
- (void)notifyOptInStatusChanged;
- (void)processResponse:(id)a3 watcher:(id)a4 finishOp:(id)a5;
- (void)setApplicationId:(id)a3;
- (void)setDeps:(id)a3;
- (void)setErrorState:(id)a3;
- (void)setIntendedState:(id)a3;
- (void)setKVSSMTTime:(id)a3 forState:(BOOL)a4;
- (void)setNextState:(id)a3;
- (void)setOptInResult:(id)a3;
- (void)setOptInStates:(id)a3;
@end

@implementation KTSetOptInStateOperation

- (KTSetOptInStateOperation)initWithDependenics:(id)a3 intendedState:(id)a4 errorState:(id)a5 optinStates:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v18.receiver = self;
  v18.super_class = (Class)&OBJC_CLASS___KTSetOptInStateOperation;
  v14 = -[KTGroupOperation init](&v18, "init");
  v15 = v14;
  if (v14)
  {
    -[KTSetOptInStateOperation setDeps:](v14, "setDeps:", v10);
    -[KTSetOptInStateOperation setOptInStates:](v15, "setOptInStates:", v13);
    -[KTSetOptInStateOperation setIntendedState:](v15, "setIntendedState:", v11);
    -[KTSetOptInStateOperation setErrorState:](v15, "setErrorState:", v12);
    -[KTSetOptInStateOperation setOptInStates:](v15, "setOptInStates:", v13);
    v16 = v15;
  }

  return v15;
}

- (id)verifyResponse:(id)a3 uri:(id)a4 expectedState:(BOOL)a5
{
  BOOL v5 = a5;
  id v16 = 0LL;
  id v17 = 0LL;
  id v8 = a4;
  unint64_t v9 = -[KTSetOptInStateOperation decodeAndVerifyOptInOutResponse:optInOutState:optInOutTime:error:]( self,  "decodeAndVerifyOptInOutResponse:optInOutState:optInOutTime:error:",  a3,  v5,  &v17,  &v16);
  id v10 = v17;
  id v11 = v16;
  id v12 = objc_alloc_init(&OBJC_CLASS___KTSetOptInResult);
  -[KTSetOptInResult setSuccess:](v12, "setSuccess:", v9 == 1);
  -[KTSetOptInResult setUri:](v12, "setUri:", v8);

  id v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", v5));
  -[KTSetOptInResult setOptInStatus:](v12, "setOptInStatus:", v13);

  -[KTSetOptInResult setOptInDate:](v12, "setOptInDate:", v10);
  -[KTSetOptInResult setError:](v12, "setError:", v11);
  if (qword_1002EEE60 != -1) {
    dispatch_once(&qword_1002EEE60, &stru_1002892D8);
  }
  v14 = (os_log_s *)qword_1002EEE68;
  if (os_log_type_enabled((os_log_t)qword_1002EEE68, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    v19 = v12;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_INFO, "verified response returned: %@", buf, 0xCu);
  }

  return v12;
}

- (void)groupStart
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[KTSetOptInStateOperation errorState](self, "errorState"));
  -[KTSetOptInStateOperation setNextState:](self, "setNextState:", v3);

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[KTSetOptInStateOperation optInStates](self, "optInStates"));
  BOOL v5 = (void *)objc_claimAutoreleasedReturnValue([v4 currentTarget]);
  -[KTSetOptInStateOperation setApplicationId:](self, "setApplicationId:", v5);

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[KTSetOptInStateOperation optInStates](self, "optInStates"));
  v7 = (void *)objc_claimAutoreleasedReturnValue([v6 targetOptInStates]);
  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[KTSetOptInStateOperation applicationId](self, "applicationId"));
  unint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([v7 objectForKeyedSubscript:v8]);

  if (v9)
  {
    id v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSBlockOperation blockOperationWithBlock:]( &OBJC_CLASS___NSBlockOperation,  "blockOperationWithBlock:",  &stru_100289318));
    -[KTGroupOperation dependOnBeforeGroupFinished:](self, "dependOnBeforeGroupFinished:", v10);
    id v11 = objc_alloc_init(&OBJC_CLASS___KTIDSOpsOptInOutData);
    id v12 = (void *)objc_claimAutoreleasedReturnValue(-[KTSetOptInStateOperation applicationId](self, "applicationId"));
    -[KTIDSOpsOptInOutData setKtApplication:](v11, "setKtApplication:", v12);

    id v13 = [v9 targetState];
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[KTSetOptInStateOperation deps](self, "deps"));
    v15 = (void *)objc_claimAutoreleasedReturnValue([v14 cloudRecords]);
    id v16 = (void *)objc_claimAutoreleasedReturnValue(-[KTSetOptInStateOperation applicationId](self, "applicationId"));
    id v17 = (void *)objc_claimAutoreleasedReturnValue(-[KTIDSOpsOptInOutData optInStatus](v11, "optInStatus"));
    id v52 = 0LL;
    v43 = (void *)objc_claimAutoreleasedReturnValue( objc_msgSend( v15,  "storeOptInIntentForApplication:state:overwrite:error:",  v16,  objc_msgSend(v17, "BOOLValue"),  1,  &v52));
    id v41 = v52;

    objc_super v18 = (void *)objc_claimAutoreleasedReturnValue(-[KTSetOptInStateOperation deps](self, "deps"));
    v19 = (void *)objc_claimAutoreleasedReturnValue([v18 cloudRecords]);
    v20 = (void *)objc_claimAutoreleasedReturnValue(-[KTSetOptInStateOperation applicationId](self, "applicationId"));
    id v51 = 0LL;
    v21 = (void *)objc_claimAutoreleasedReturnValue([v19 deleteOptInIntentForApplication:v20 error:&v51]);
    id v39 = v51;

    v22 = (void *)objc_claimAutoreleasedReturnValue(-[KTSetOptInStateOperation deps](self, "deps"));
    v23 = (void *)objc_claimAutoreleasedReturnValue([v22 accountKeyService]);
    v24 = (void *)objc_claimAutoreleasedReturnValue(-[KTSetOptInStateOperation applicationId](self, "applicationId"));
    v44 = (void *)objc_claimAutoreleasedReturnValue([v23 accountKeyService:v24]);

    id v50 = 0LL;
    v25 = (void *)objc_claimAutoreleasedReturnValue([v44 publicPublicKey:&v50]);
    id v42 = v50;
    -[KTIDSOpsOptInOutData setPublicAccountKey:](v11, "setPublicAccountKey:", v25);

    v26 = (void *)objc_claimAutoreleasedReturnValue(-[KTIDSOpsOptInOutData publicAccountKey](v11, "publicAccountKey"));
    LODWORD(v25) = v26 == 0LL;

    if ((_DWORD)v25)
    {
      if (qword_1002EEE60 != -1) {
        dispatch_once(&qword_1002EEE60, &stru_100289338);
      }
      v27 = (os_log_s *)qword_1002EEE68;
      if (os_log_type_enabled((os_log_t)qword_1002EEE68, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412546;
        *(void *)&uint8_t buf[4] = v44;
        __int16 v56 = 2112;
        id v57 = v42;
        _os_log_impl( (void *)&_mh_execute_header,  v27,  OS_LOG_TYPE_ERROR,  "Cloud not get account key from service %@, this is not going to end well: %@",  buf,  0x16u);
      }
    }

    v28 = (void *)objc_claimAutoreleasedReturnValue(-[KTSetOptInStateOperation applicationId](self, "applicationId", v39));
    v53 = v28;
    v54 = v11;
    v29 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v54,  &v53,  1LL));

    v30 = objc_alloc(&OBJC_CLASS___SendOptInUpdateRequestOperation);
    v31 = (void *)objc_claimAutoreleasedReturnValue(-[KTSetOptInStateOperation deps](self, "deps"));
    v32 = -[SendOptInUpdateRequestOperation initWithDependenics:optInRequest:]( v30,  "initWithDependenics:optInRequest:",  v31,  v29);

    *(void *)buf = 0LL;
    objc_initWeak((id *)buf, self);
    v45[0] = _NSConcreteStackBlock;
    v45[1] = 3221225472LL;
    v45[2] = sub_1001BE1F4;
    v45[3] = &unk_100279B98;
    objc_copyWeak(&v49, (id *)buf);
    v33 = v32;
    v46 = v33;
    id v47 = v9;
    id v34 = v10;
    id v48 = v34;
    v35 = (void *)objc_claimAutoreleasedReturnValue( +[KTResultOperation named:withBlock:]( &OBJC_CLASS___KTResultOperation,  "named:withBlock:",  @"set-opt-io",  v45));
    -[KTResultOperation addSuccessDependency:](v33, "addSuccessDependency:", v43);
    [v35 addDependency:v33];
    [v21 addSuccessDependency:v35];
    -[KTGroupOperation runBeforeGroupFinished:](self, "runBeforeGroupFinished:", v43);
    -[KTGroupOperation runBeforeGroupFinished:](self, "runBeforeGroupFinished:", v33);
    -[KTGroupOperation runBeforeGroupFinished:](self, "runBeforeGroupFinished:", v35);
    -[KTGroupOperation runBeforeGroupFinished:](self, "runBeforeGroupFinished:", v21);

    objc_destroyWeak(&v49);
    objc_destroyWeak((id *)buf);
  }

  else
  {
    if (qword_1002EEE60 != -1) {
      dispatch_once(&qword_1002EEE60, &stru_1002892F8);
    }
    v36 = (void *)qword_1002EEE68;
    if (os_log_type_enabled((os_log_t)qword_1002EEE68, OS_LOG_TYPE_ERROR))
    {
      v37 = v36;
      v38 = (void *)objc_claimAutoreleasedReturnValue(-[KTSetOptInStateOperation applicationId](self, "applicationId"));
      *(_DWORD *)buf = 138412290;
      *(void *)&uint8_t buf[4] = v38;
      _os_log_impl( (void *)&_mh_execute_header,  v37,  OS_LOG_TYPE_ERROR,  "Warning: no target application available: %@",  buf,  0xCu);
    }

    id v34 = (id)objc_claimAutoreleasedReturnValue(-[KTSetOptInStateOperation optInStates](self, "optInStates"));
    [v34 setCurrentTarget:0];
  }
}

- (void)processResponse:(id)a3 watcher:(id)a4 finishOp:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  if ([v8 success])
  {
    id v12 = (void *)objc_claimAutoreleasedReturnValue([v8 serverSMTByURI]);
    id v13 = [v12 count];

    if (v13)
    {
      v14 = (void *)objc_claimAutoreleasedReturnValue([v8 serverSMTByURI]);
      v109[0] = _NSConcreteStackBlock;
      v109[1] = 3221225472LL;
      v109[2] = sub_1001BF1E0;
      v109[3] = &unk_100289380;
      v109[4] = self;
      id v110 = v9;
      id v111 = v11;
      [v14 enumerateKeysAndObjectsUsingBlock:v109];
    }

    else
    {
      v24 = (void *)objc_claimAutoreleasedReturnValue([v8 serverProvidedSMT]);
      v25 = (void *)objc_claimAutoreleasedReturnValue( -[KTSetOptInStateOperation verifyResponse:uri:expectedState:]( self,  "verifyResponse:uri:expectedState:",  v24,  0,  [v9 targetState] != 0));

      [v11 setObject:v25 forKeyedSubscript:&stru_10028E390];
    }

    if (qword_1002EEE60 != -1) {
      dispatch_once(&qword_1002EEE60, &stru_1002893A0);
    }
    v95 = v9;
    v26 = (os_log_s *)qword_1002EEE68;
    if (os_log_type_enabled((os_log_t)qword_1002EEE68, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412290;
      id v113 = v11;
      _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEBUG, "OptIn result: %@", buf, 0xCu);
    }

    -[KTSetOptInStateOperation setOptInResult:](self, "setOptInResult:", v11);
    v96 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
    v97 = (KTPendingFlag *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
    __int128 v105 = 0u;
    __int128 v106 = 0u;
    __int128 v107 = 0u;
    __int128 v108 = 0u;
    v27 = (void *)objc_claimAutoreleasedReturnValue([v11 objectEnumerator]);
    id v28 = [v27 countByEnumeratingWithState:&v105 objects:v119 count:16];
    v98 = self;
    if (v28)
    {
      id v29 = v28;
      char v30 = 0;
      uint64_t v31 = *(void *)v106;
      do
      {
        for (i = 0LL; i != v29; i = (char *)i + 1)
        {
          if (*(void *)v106 != v31) {
            objc_enumerationMutation(v27);
          }
          v33 = *(void **)(*((void *)&v105 + 1) + 8LL * (void)i);
          if (([v33 success] & 1) == 0)
          {
            id v34 = (void *)objc_claimAutoreleasedReturnValue([v33 error]);

            if (v34)
            {
              v35 = (void *)objc_claimAutoreleasedReturnValue([v33 error]);
              [v96 addObject:v35];
            }

            v36 = (void *)objc_claimAutoreleasedReturnValue([v33 uri]);

            if (v36)
            {
              v37 = (void *)objc_claimAutoreleasedReturnValue([v33 uri]);
              -[KTPendingFlag addObject:](v97, "addObject:", v37);
            }

            char v30 = 1;
          }
        }

        id v29 = [v27 countByEnumeratingWithState:&v105 objects:v119 count:16];
      }

      while (v29);

      self = v98;
      if ((v30 & 1) != 0)
      {
        v38 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
        v15 = v96;
        [v38 setObject:v96 forKeyedSubscript:NSMultipleUnderlyingErrorsKey];
        [v38 setObject:v97 forKeyedSubscript:@"uris"];
        v99 = v38;
        id v39 = (void *)objc_claimAutoreleasedReturnValue( +[TransparencyError errorWithDomain:code:underlyingError:userinfo:description:]( &OBJC_CLASS___TransparencyError,  "errorWithDomain:code:underlyingError:userinfo:description:",  @"TransparencyErrorVerify",  -361LL,  0LL,  v38,  @"Failed validation uri"));
        -[KTResultOperation setError:](v98, "setError:", v39);

        id v9 = v95;
        if (qword_1002EEE60 != -1) {
          dispatch_once(&qword_1002EEE60, &stru_1002893C0);
        }
        id v40 = (void *)qword_1002EEE68;
        if (!os_log_type_enabled((os_log_t)qword_1002EEE68, OS_LOG_TYPE_ERROR)) {
          goto LABEL_78;
        }
        v23 = v40;
        id v41 = (void *)objc_claimAutoreleasedReturnValue(-[KTResultOperation error](v98, "error"));
        *(_DWORD *)buf = 138412290;
        id v113 = v41;
        _os_log_impl( (void *)&_mh_execute_header,  v23,  OS_LOG_TYPE_ERROR,  "Failed to change opt-in state due to IDS opt-in failure: %@",  buf,  0xCu);

LABEL_34:
LABEL_78:

        goto LABEL_79;
      }
    }

    else
    {
    }

    id v42 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInteger:]( NSNumber,  "numberWithUnsignedInteger:",  [v95 targetState]));
    v43 = (void *)objc_claimAutoreleasedReturnValue(-[KTSetOptInStateOperation optInStates](self, "optInStates"));
    v44 = (void *)objc_claimAutoreleasedReturnValue([v43 currentStates]);
    v45 = (void *)objc_claimAutoreleasedReturnValue(-[KTSetOptInStateOperation applicationId](self, "applicationId"));
    [v44 setObject:v42 forKeyedSubscript:v45];

    -[KTSetOptInStateOperation clearCoreFollowUp](self, "clearCoreFollowUp");
    -[KTSetOptInStateOperation clearFailureEvents](self, "clearFailureEvents");
    if (qword_1002EEE60 != -1) {
      dispatch_once(&qword_1002EEE60, &stru_1002893E0);
    }
    v46 = (void *)qword_1002EEE68;
    if (os_log_type_enabled((os_log_t)qword_1002EEE68, OS_LOG_TYPE_DEFAULT))
    {
      id v47 = v46;
      id v48 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInteger:]( NSNumber,  "numberWithUnsignedInteger:",  [v95 targetState]));
      id v49 = (void *)objc_claimAutoreleasedReturnValue(-[KTSetOptInStateOperation applicationId](self, "applicationId"));
      *(_DWORD *)buf = 138543618;
      id v113 = v48;
      __int16 v114 = 2114;
      v115 = v49;
      _os_log_impl( (void *)&_mh_execute_header,  v47,  OS_LOG_TYPE_DEFAULT,  "changing opt-in state to %{public}@ for %{public}@",  buf,  0x16u);
    }

    v94 = v10;
    id v92 = v8;
    v99 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
    __int128 v101 = 0u;
    __int128 v102 = 0u;
    __int128 v103 = 0u;
    __int128 v104 = 0u;
    v93 = v11;
    id v50 = (void *)objc_claimAutoreleasedReturnValue([v11 objectEnumerator]);
    id v51 = [v50 countByEnumeratingWithState:&v101 objects:v118 count:16];
    if (v51)
    {
      id v52 = v51;
      v53 = 0LL;
      uint64_t v54 = *(void *)v102;
      do
      {
        for (j = 0LL; j != v52; j = (char *)j + 1)
        {
          if (*(void *)v102 != v54) {
            objc_enumerationMutation(v50);
          }
          __int16 v56 = *(void **)(*((void *)&v101 + 1) + 8LL * (void)j);
          id v57 = (void *)objc_claimAutoreleasedReturnValue([v56 uri]);

          if (v57)
          {
            v58 = (void *)objc_claimAutoreleasedReturnValue(-[KTSetOptInStateOperation applicationId](self, "applicationId"));
            v59 = (void *)objc_claimAutoreleasedReturnValue([v56 uri]);
            v60 = (void *)objc_claimAutoreleasedReturnValue( +[TransparencyApplication addApplicationPrefixForIdentifier:uri:]( &OBJC_CLASS___TransparencyApplication,  "addApplicationPrefixForIdentifier:uri:",  v58,  v59));

            v61 = (void *)objc_claimAutoreleasedReturnValue([v56 optInDate]);
            [v99 setObject:v61 forKeyedSubscript:v60];

            if (!v53
              || (v62 = (void *)objc_claimAutoreleasedReturnValue([v56 optInDate]),
                  id v63 = [v62 compare:v53],
                  v62,
                  v63 == (id)-1LL))
            {
              uint64_t v64 = objc_claimAutoreleasedReturnValue([v56 optInDate]);

              v53 = (void *)v64;
            }

            self = v98;
          }
        }

        id v52 = [v50 countByEnumeratingWithState:&v101 objects:v118 count:16];
      }

      while (v52);
    }

    else
    {
      v53 = 0LL;
    }

    v65 = (void *)objc_claimAutoreleasedReturnValue(-[KTSetOptInStateOperation deps](self, "deps"));
    v66 = (void *)objc_claimAutoreleasedReturnValue([v65 cloudRecords]);

    id v8 = v92;
    if (v66)
    {
      v67 = (void *)objc_claimAutoreleasedReturnValue(-[KTSetOptInStateOperation deps](self, "deps"));
      v68 = (void *)objc_claimAutoreleasedReturnValue([v67 cloudRecords]);
      v69 = (void *)objc_claimAutoreleasedReturnValue(-[KTSetOptInStateOperation applicationId](self, "applicationId"));
      id v9 = v95;
      id v100 = 0LL;
      v70 = (void *)objc_claimAutoreleasedReturnValue( objc_msgSend( v68,  "storeOptInForApplication:uris:state:error:",  v69,  v99,  objc_msgSend(v95, "targetState") != 0,  &v100));
      id v71 = v100;

      if (v70)
      {
        [v94 addDependency:v70];
        -[KTGroupOperation runBeforeGroupFinished:](self, "runBeforeGroupFinished:", v70);
      }

      if (v71)
      {
        if (qword_1002EEE60 != -1) {
          dispatch_once(&qword_1002EEE60, &stru_100289400);
        }
        v72 = (os_log_s *)qword_1002EEE68;
        if (os_log_type_enabled((os_log_t)qword_1002EEE68, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          id v113 = v71;
          _os_log_impl( (void *)&_mh_execute_header,  v72,  OS_LOG_TYPE_ERROR,  "storeOptInForApplication failed %@",  buf,  0xCu);
        }

        -[KTResultOperation setError:](self, "setError:", v71);
      }
    }

    else
    {
      id v71 = 0LL;
      id v9 = v95;
    }

    if (qword_1002EEE60 != -1) {
      dispatch_once(&qword_1002EEE60, &stru_100289420);
    }
    v73 = (void *)qword_1002EEE68;
    if (os_log_type_enabled((os_log_t)qword_1002EEE68, OS_LOG_TYPE_DEFAULT))
    {
      v74 = v73;
      v75 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInteger:]( NSNumber,  "numberWithUnsignedInteger:",  [v9 targetState]));
      v76 = (void *)objc_claimAutoreleasedReturnValue(-[KTSetOptInStateOperation applicationId](self, "applicationId"));
      v77 = (void *)objc_claimAutoreleasedReturnValue([v99 allKeys]);
      v78 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v77, "componentsJoinedByString:", @", "));
      *(_DWORD *)buf = 138543874;
      id v113 = v75;
      __int16 v114 = 2114;
      v115 = v76;
      __int16 v116 = 2112;
      v117 = v78;
      _os_log_impl( (void *)&_mh_execute_header,  v74,  OS_LOG_TYPE_DEFAULT,  "changing peer opt-in state to %{public}@ for %{public}@ for %@",  buf,  0x20u);

      self = v98;
    }

    v79 = (void *)objc_claimAutoreleasedReturnValue(-[KTSetOptInStateOperation deps](self, "deps"));
    v80 = (void *)objc_claimAutoreleasedReturnValue([v79 dataStore]);
    BOOL v81 = [v9 targetState] != 0;
    v82 = (void *)objc_claimAutoreleasedReturnValue([v99 allKeys]);
    v83 = (void *)objc_claimAutoreleasedReturnValue(-[KTSetOptInStateOperation applicationId](self, "applicationId"));
    [v80 setCachedPeerOptInState:v81 uris:v82 application:v83];

    if ([v9 targetState] == (id)1)
    {
      v84 = (void *)objc_claimAutoreleasedReturnValue(-[KTSetOptInStateOperation deps](v98, "deps"));
      v85 = (void *)objc_claimAutoreleasedReturnValue([v84 dataStore]);
      v86 = (void *)objc_claimAutoreleasedReturnValue(-[KTSetOptInStateOperation applicationId](v98, "applicationId"));
      [v85 removeFailuresOnOptIn:v86];
    }

    if (v53)
    {
      -[KTSetOptInStateOperation setKVSSMTTime:forState:]( v98,  "setKVSSMTTime:forState:",  v53,  [v9 targetState] != 0);
    }

    else
    {
      if (qword_1002EEE60 != -1) {
        dispatch_once(&qword_1002EEE60, &stru_100289440);
      }
      v87 = (os_log_s *)qword_1002EEE68;
      if (os_log_type_enabled((os_log_t)qword_1002EEE68, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        id v113 = v93;
        _os_log_impl((void *)&_mh_execute_header, v87, OS_LOG_TYPE_ERROR, "no KVS smt timestamp: %@", buf, 0xCu);
      }
    }

    -[KTSetOptInStateOperation notifyOptInStatusChanged](v98, "notifyOptInStatusChanged");
    v88 = -[KTPendingFlag initWithFlag:delayInSeconds:]( objc_alloc(&OBJC_CLASS___KTPendingFlag),  "initWithFlag:delayInSeconds:",  @"StatusUpdate",  0.0);
    v89 = (void *)objc_claimAutoreleasedReturnValue(-[KTSetOptInStateOperation deps](v98, "deps"));
    v90 = (void *)objc_claimAutoreleasedReturnValue([v89 flagHandler]);
    [v90 handlePendingFlag:v88];

    v91 = (void *)objc_claimAutoreleasedReturnValue(-[KTSetOptInStateOperation intendedState](v98, "intendedState"));
    -[KTSetOptInStateOperation setNextState:](v98, "setNextState:", v91);

    id v11 = v93;
    id v10 = v94;
    v15 = v96;
    goto LABEL_78;
  }

  v15 = (void *)objc_claimAutoreleasedReturnValue([v8 error]);
  if (qword_1002EEE60 != -1) {
    dispatch_once(&qword_1002EEE60, &stru_100289358);
  }
  id v16 = (void *)qword_1002EEE68;
  if (os_log_type_enabled((os_log_t)qword_1002EEE68, OS_LOG_TYPE_ERROR))
  {
    id v17 = v16;
    objc_super v18 = (void *)objc_claimAutoreleasedReturnValue([v8 error]);
    *(_DWORD *)buf = 138412290;
    id v113 = v18;
    _os_log_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_ERROR,  "failed to change opt-in state due to IDS opt-in failure: %@",  buf,  0xCu);
  }

  v19 = (void *)objc_claimAutoreleasedReturnValue( +[TransparencyError errorWithDomain:code:underlyingError:description:]( &OBJC_CLASS___TransparencyError,  "errorWithDomain:code:underlyingError:description:",  kTransparencyErrorInternal,  -290LL,  v15,  @"IDS failed to change opt-in state for KT"));
  -[KTResultOperation setError:](self, "setError:", v19);

  if ([v15 code] == (id)-8101)
  {
    v20 = (void *)objc_claimAutoreleasedReturnValue([v15 domain]);
    unsigned int v21 = [v20 isEqual:IDSKeyTransparencyErrorDomain];

    if (v21)
    {
      v22 = -[KTPendingFlag initWithFlag:conditions:delayInSeconds:]( objc_alloc(&OBJC_CLASS___KTPendingFlag),  "initWithFlag:conditions:delayInSeconds:",  @"CheckAccountSignatures",  2LL,  1.0);
      v99 = (void *)objc_claimAutoreleasedReturnValue(-[KTSetOptInStateOperation deps](self, "deps"));
      v23 = (os_log_s *)objc_claimAutoreleasedReturnValue([v99 flagHandler]);
      v97 = v22;
      -[os_log_s handlePendingFlag:](v23, "handlePendingFlag:", v22);
      goto LABEL_34;
    }
  }

- (id)optInKey
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[KTSetOptInStateOperation applicationId](self, "applicationId"));
  v3 = (void *)objc_claimAutoreleasedReturnValue( +[KTOptInManagerServer optInKeyForApplication:]( &OBJC_CLASS___KTOptInManagerServer,  "optInKeyForApplication:",  v2));

  return v3;
}

- (id)notificationKey
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[KTSetOptInStateOperation applicationId](self, "applicationId"));
  v3 = (void *)objc_claimAutoreleasedReturnValue( +[KTOptInManager notificationKeyForApplication:]( &OBJC_CLASS___KTOptInManager,  "notificationKeyForApplication:",  v2));

  return v3;
}

- (void)clearOptInStateAndPushToCloud
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[KTSetOptInStateOperation deps](self, "deps"));
  v4 = (void *)objc_claimAutoreleasedReturnValue([v3 cloudRecords]);
  BOOL v5 = (void *)objc_claimAutoreleasedReturnValue(-[KTSetOptInStateOperation applicationId](self, "applicationId"));
  id v11 = 0LL;
  [v4 clearOptInStateForURI:0 application:v5 error:&v11];
  id v6 = v11;

  if (v6)
  {
    if (qword_1002EEE60 != -1) {
      dispatch_once(&qword_1002EEE60, &stru_100289460);
    }
    v7 = (os_log_s *)qword_1002EEE68;
    if (os_log_type_enabled((os_log_t)qword_1002EEE68, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v13 = v6;
      _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_ERROR,  "Opt-in reset failed clear all states: error: %@",  buf,  0xCu);
    }
  }

  id v8 = -[KTPendingFlag initWithFlag:conditions:]( objc_alloc(&OBJC_CLASS___KTPendingFlag),  "initWithFlag:conditions:",  @"CloudKitOutgoing",  2LL);
  id v9 = (void *)objc_claimAutoreleasedReturnValue(-[KTSetOptInStateOperation deps](self, "deps"));
  id v10 = (void *)objc_claimAutoreleasedReturnValue([v9 flagHandler]);
  [v10 handlePendingFlag:v8];
}

- (void)setKVSSMTTime:(id)a3 forState:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[KTSetOptInStateOperation applicationId](self, "applicationId"));
  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[KTSetOptInStateOperation deps](self, "deps"));
  id v9 = (void *)objc_claimAutoreleasedReturnValue([v8 kvs]);
  id v28 = 0LL;
  id v10 = (void *)objc_claimAutoreleasedReturnValue( +[KTOptInManagerServer getOptInHistory:store:error:]( &OBJC_CLASS___KTOptInManagerServer,  "getOptInHistory:store:error:",  v7,  v9,  &v28));
  id v11 = v28;

  if (v11)
  {
    id v12 = (void *)objc_claimAutoreleasedReturnValue(-[KTSetOptInStateOperation deps](self, "deps"));
    id v13 = (void *)objc_claimAutoreleasedReturnValue([v12 logger]);
    [v13 logResultForEvent:@"optInHistory" hardFailure:1 result:v11];

    if (qword_1002EEE60 != -1) {
      dispatch_once(&qword_1002EEE60, &stru_100289480);
    }
    v14 = (os_log_s *)qword_1002EEE68;
    if (os_log_type_enabled((os_log_t)qword_1002EEE68, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v31 = v11;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_ERROR, "getOptInHistory failed with %@", buf, 0xCu);
    }
  }

  else
  {
    dispatch_semaphore_t v15 = dispatch_semaphore_create(0LL);
    id v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithArray:](&OBJC_CLASS___NSMutableArray, "arrayWithArray:", v10));
    v29[0] = v6;
    id v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", v4));
    v29[1] = v17;
    objc_super v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v29, 2LL));
    [v16 addObject:v18];

    v19 = (void *)objc_claimAutoreleasedReturnValue(-[KTSetOptInStateOperation deps](self, "deps"));
    v20 = (void *)objc_claimAutoreleasedReturnValue([v19 kvs]);
    unsigned int v21 = (void *)objc_claimAutoreleasedReturnValue(-[KTSetOptInStateOperation optInKey](self, "optInKey"));
    [v20 setObject:v16 forKey:v21];

    v22 = (void *)objc_claimAutoreleasedReturnValue(-[KTSetOptInStateOperation deps](self, "deps"));
    v23 = (void *)objc_claimAutoreleasedReturnValue([v22 kvs]);
    v26[0] = _NSConcreteStackBlock;
    v26[1] = 3221225472LL;
    v26[2] = sub_1001BF900;
    v26[3] = &unk_100276D88;
    v26[4] = self;
    dispatch_semaphore_t v27 = v15;
    v24 = v15;
    [v23 forceSync:v26];

    dispatch_time_t v25 = dispatch_time(0LL, 30000000000LL);
    dispatch_semaphore_wait(v24, v25);
  }
}

- (void)clearFailureEvents
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[KTSetOptInStateOperation deps](self, "deps"));
  BOOL v4 = (void *)objc_claimAutoreleasedReturnValue([v3 dataStore]);
  BOOL v5 = (void *)objc_claimAutoreleasedReturnValue(-[KTSetOptInStateOperation applicationId](self, "applicationId"));
  id v9 = 0LL;
  unsigned __int8 v6 = [v4 clearAllFailureEvents:v5 error:&v9];
  id v7 = v9;

  if ((v6 & 1) == 0)
  {
    if (qword_1002EEE60 != -1) {
      dispatch_once(&qword_1002EEE60, &stru_1002894A0);
    }
    id v8 = (os_log_s *)qword_1002EEE68;
    if (os_log_type_enabled((os_log_t)qword_1002EEE68, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      id v11 = v7;
      _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_INFO,  "failed to clear existing failure events: %@",  buf,  0xCu);
    }
  }
}

- (void)clearCoreFollowUp
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[KTSetOptInStateOperation deps](self, "deps"));
  v3 = (void *)objc_claimAutoreleasedReturnValue([v2 followup]);
  id v7 = 0LL;
  unsigned __int8 v4 = [v3 clearAllFollowups:&v7];
  id v5 = v7;

  if ((v4 & 1) == 0)
  {
    if (qword_1002EEE60 != -1) {
      dispatch_once(&qword_1002EEE60, &stru_1002894C0);
    }
    unsigned __int8 v6 = (os_log_s *)qword_1002EEE68;
    if (os_log_type_enabled((os_log_t)qword_1002EEE68, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      id v9 = v5;
      _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_INFO,  "failed to clear existing follow ups: %@",  buf,  0xCu);
    }
  }
}

- (void)notifyOptInStatusChanged
{
  id v4 = (id)objc_claimAutoreleasedReturnValue( +[NSDistributedNotificationCenter defaultCenter]( &OBJC_CLASS___NSDistributedNotificationCenter,  "defaultCenter"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[KTSetOptInStateOperation notificationKey](self, "notificationKey"));
  [v4 postNotificationName:v3 object:0 userInfo:0 deliverImmediately:1];
}

- (unint64_t)decodeAndVerifyOptInOutResponse:(id)a3 optInOutState:(BOOL)a4 optInOutTime:(id *)a5 error:(id *)a6
{
  BOOL v8 = a4;
  id v27 = 0LL;
  id v10 = (void *)objc_claimAutoreleasedReturnValue( +[TransparencyGPBMessage parseFromData:error:]( &OBJC_CLASS___OptInOutResponse,  "parseFromData:error:",  a3,  &v27));
  id v11 = v27;
  if (v10)
  {
    if ([v10 status] == 1 || objc_msgSend(v10, "status") == 3)
    {
      id v12 = (void *)objc_claimAutoreleasedReturnValue([v10 smt]);
      id v26 = 0LL;
      unint64_t v13 = -[KTSetOptInStateOperation decodeAndVerifySMT:optInOutState:optInOutTime:error:]( self,  "decodeAndVerifySMT:optInOutState:optInOutTime:error:",  v12,  v8,  a5,  &v26);
      id v14 = v26;

      if (v13 != 1)
      {
        if (qword_1002EEE60 != -1) {
          dispatch_once(&qword_1002EEE60, &stru_100289520);
        }
        dispatch_semaphore_t v15 = (void *)qword_1002EEE68;
        if (os_log_type_enabled((os_log_t)qword_1002EEE68, OS_LOG_TYPE_ERROR))
        {
          id v16 = v15;
          id v17 = (void *)objc_claimAutoreleasedReturnValue([v10 serverEventInfo]);
          *(_DWORD *)buf = 138412546;
          *(void *)id v29 = v17;
          *(_WORD *)&v29[8] = 2112;
          *(void *)&v29[10] = v14;
          _os_log_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_ERROR,  "SMT verification failed for OptInOutResponse with %@: %@",  buf,  0x16u);
        }

        if (a6 && v14) {
          *a6 = v14;
        }
      }

      id v18 = 0LL;
      goto LABEL_26;
    }

    if (qword_1002EEE60 != -1) {
      dispatch_once(&qword_1002EEE60, &stru_100289500);
    }
    unsigned int v21 = (void *)qword_1002EEE68;
    if (os_log_type_enabled((os_log_t)qword_1002EEE68, OS_LOG_TYPE_ERROR))
    {
      v22 = v21;
      unsigned int v23 = [v10 status];
      v24 = (void *)objc_claimAutoreleasedReturnValue([v10 serverEventInfo]);
      *(_DWORD *)buf = 67109378;
      *(_DWORD *)id v29 = v23;
      *(_WORD *)&v29[4] = 2112;
      *(void *)&v29[6] = v24;
      _os_log_impl( (void *)&_mh_execute_header,  v22,  OS_LOG_TYPE_ERROR,  "optInOutResponse status failure: %d. ServerHint: %@",  buf,  0x12u);
    }

    v20 = (void *)objc_claimAutoreleasedReturnValue( +[TransparencyError errorWithDomain:code:description:]( TransparencyError,  "errorWithDomain:code:description:",  kTransparencyErrorServer,  (int)[v10 status],  @"optInOutResponse status failure: %d",  objc_msgSend(v10, "status")));
  }

  else
  {
    if (qword_1002EEE60 != -1) {
      dispatch_once(&qword_1002EEE60, &stru_1002894E0);
    }
    v19 = (os_log_s *)qword_1002EEE68;
    if (os_log_type_enabled((os_log_t)qword_1002EEE68, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      *(void *)id v29 = v11;
      _os_log_impl( (void *)&_mh_execute_header,  v19,  OS_LOG_TYPE_ERROR,  "failed to parse optInOutResponse from directory server: %@",  buf,  0xCu);
    }

    v20 = (void *)objc_claimAutoreleasedReturnValue( +[TransparencyError errorWithDomain:code:underlyingError:description:]( &OBJC_CLASS___TransparencyError,  "errorWithDomain:code:underlyingError:description:",  @"TransparencyErrorVerify",  -318LL,  v11,  @"failed to parse optInOutResponse from directory server"));
  }

  id v18 = v20;
  unint64_t v13 = 0LL;
  if (a6 && v20)
  {
    id v18 = v20;
    unint64_t v13 = 0LL;
    *a6 = v18;
  }

- (unint64_t)decodeAndVerifySMT:(id)a3 optInOutState:(BOOL)a4 optInOutTime:(id *)a5 error:(id *)a6
{
  BOOL v8 = a4;
  id v10 = a3;
  id v11 = (void *)objc_claimAutoreleasedReturnValue(-[KTSetOptInStateOperation deps](self, "deps"));
  id v12 = (void *)objc_claimAutoreleasedReturnValue([v11 publicKeyStore]);
  unint64_t v13 = (void *)objc_claimAutoreleasedReturnValue(-[KTSetOptInStateOperation applicationId](self, "applicationId"));
  id v14 = (void *)objc_claimAutoreleasedReturnValue([v12 applicationPublicKeyStore:v13]);

  if (v14)
  {
    dispatch_semaphore_t v15 = (void *)objc_claimAutoreleasedReturnValue([v14 appSmtKeyStore]);
    uint64_t v16 = objc_claimAutoreleasedReturnValue([v15 signatureVerifier]);

    id v17 = (void *)objc_claimAutoreleasedReturnValue(-[KTSetOptInStateOperation deps](self, "deps"));
    id v18 = (void *)objc_claimAutoreleasedReturnValue([v17 dataStore]);
    v19 = (void *)v16;
    v20 = (void *)objc_claimAutoreleasedReturnValue( +[SignedMutationTimestamp signedTypeWithObject:verifier:dataStore:]( &OBJC_CLASS___SignedMutationTimestamp,  "signedTypeWithObject:verifier:dataStore:",  v10,  v16,  v18));

    id v59 = 0LL;
    unint64_t v21 = (unint64_t)[v20 verifyWithError:&v59];
    id v22 = v59;
    if (v21 != 1)
    {
      if (qword_1002EEE60 != -1) {
        dispatch_once(&qword_1002EEE60, &stru_100289560);
      }
      id v34 = (os_log_s *)qword_1002EEE68;
      if (os_log_type_enabled((os_log_t)qword_1002EEE68, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        id v63 = v22;
        _os_log_impl( (void *)&_mh_execute_header,  v34,  OS_LOG_TYPE_ERROR,  "failed to verify optInOut SMT from directory server: %@",  buf,  0xCu);
      }

      v35 = (void *)objc_claimAutoreleasedReturnValue( +[TransparencyError errorWithDomain:code:underlyingError:description:]( &OBJC_CLASS___TransparencyError,  "errorWithDomain:code:underlyingError:description:",  @"TransparencyErrorVerify",  -316LL,  v22,  @"failed to verify optInOut SMT from directory server"));
      id v36 = v35;
      v37 = 0LL;
      if (a6 && v35)
      {
        id v36 = v35;
        v37 = 0LL;
        *a6 = v36;
      }

      goto LABEL_60;
    }

    id v58 = 0LL;
    unsigned int v23 = (void *)objc_claimAutoreleasedReturnValue([v20 parsedMutationWithError:&v58]);
    id v56 = v58;
    id v57 = v23;
    if (!v23)
    {
      if (qword_1002EEE60 != -1) {
        dispatch_once(&qword_1002EEE60, &stru_100289580);
      }
      v37 = v56;
      v38 = (os_log_s *)qword_1002EEE68;
      if (os_log_type_enabled((os_log_t)qword_1002EEE68, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        id v63 = v56;
        _os_log_impl( (void *)&_mh_execute_header,  v38,  OS_LOG_TYPE_ERROR,  "failed to parse mutation from SMT from directory server: %@",  buf,  0xCu);
      }

      id v39 = (void *)objc_claimAutoreleasedReturnValue( +[TransparencyError errorWithDomain:code:underlyingError:description:]( &OBJC_CLASS___TransparencyError,  "errorWithDomain:code:underlyingError:description:",  @"TransparencyErrorVerify",  -316LL,  v56,  @"failed to parse mutation from SMT from directory server"));
      id v36 = v39;
      unint64_t v21 = 0LL;
      if (a6 && v39)
      {
        id v36 = v39;
        unint64_t v21 = 0LL;
        *a6 = v36;
      }

      goto LABEL_59;
    }

    unsigned int v24 = [v23 mutationType];
    if (v24 == 6)
    {
      v55 = v19;
      if (qword_1002EEE60 != -1) {
        dispatch_once(&qword_1002EEE60, &stru_1002895C0);
      }
      id v40 = (void *)qword_1002EEE68;
      if (os_log_type_enabled((os_log_t)qword_1002EEE68, OS_LOG_TYPE_DEBUG))
      {
        id v41 = v40;
        id v42 = (void *)objc_claimAutoreleasedReturnValue([v23 optInOutMutation]);
        v43 = (void *)objc_claimAutoreleasedReturnValue([v42 description]);
        *(_DWORD *)buf = 138412290;
        id v63 = v43;
        _os_log_impl( (void *)&_mh_execute_header,  v41,  OS_LOG_TYPE_DEBUG,  "decodeAndVerifySMT OptInOut_Sync: %@",  buf,  0xCu);

        unsigned int v23 = v57;
      }

      v44 = (void *)objc_claimAutoreleasedReturnValue([v23 optInOutMutation]);
      v45 = v23;
      id v31 = (id)objc_claimAutoreleasedReturnValue( +[NSDate dateWithTimeIntervalSince1970:]( NSDate,  "dateWithTimeIntervalSince1970:",  (double)((unint64_t)[v44 timestampMs] / 0x3E8)));

      v32 = (void *)objc_claimAutoreleasedReturnValue([v45 optInOutMutation]);
    }

    else
    {
      if (v24 != 3)
      {
        if (qword_1002EEE60 != -1) {
          dispatch_once(&qword_1002EEE60, &stru_1002895E0);
        }
        v37 = v56;
        v53 = (os_log_s *)qword_1002EEE68;
        if (os_log_type_enabled((os_log_t)qword_1002EEE68, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)buf = 0;
          _os_log_impl( (void *)&_mh_execute_header,  v53,  OS_LOG_TYPE_ERROR,  "mutation from directory server not optInOut",  buf,  2u);
        }

        id v51 = (id)objc_claimAutoreleasedReturnValue( +[TransparencyError errorWithDomain:code:description:]( &OBJC_CLASS___TransparencyError,  "errorWithDomain:code:description:",  @"TransparencyErrorVerify",  -314LL,  @"mutation from directory server not optInOut"));

        id v31 = 0LL;
        if (a6 && v51)
        {
          id v51 = v51;
          id v31 = 0LL;
          unint64_t v21 = 0LL;
          *a6 = v51;
        }

        else
        {
          unint64_t v21 = 0LL;
        }

        goto LABEL_58;
      }

      v55 = v19;
      if (qword_1002EEE60 != -1) {
        dispatch_once(&qword_1002EEE60, &stru_1002895A0);
      }
      dispatch_time_t v25 = (void *)qword_1002EEE68;
      if (os_log_type_enabled((os_log_t)qword_1002EEE68, OS_LOG_TYPE_DEBUG))
      {
        id v26 = v25;
        id v27 = (void *)objc_claimAutoreleasedReturnValue([v23 optInOut]);
        id v28 = (void *)objc_claimAutoreleasedReturnValue([v27 description]);
        *(_DWORD *)buf = 138412290;
        id v63 = v28;
        _os_log_impl( (void *)&_mh_execute_header,  v26,  OS_LOG_TYPE_DEBUG,  "decodeAndVerifySMT OptInOutMutation: %@",  buf,  0xCu);

        unsigned int v23 = v57;
      }

      id v29 = (void *)objc_claimAutoreleasedReturnValue([v23 optInOut]);
      char v30 = v23;
      id v31 = (id)objc_claimAutoreleasedReturnValue( +[NSDate dateWithTimeIntervalSince1970:]( NSDate,  "dateWithTimeIntervalSince1970:",  (double)((unint64_t)[v29 timestampMs] / 0x3E8)));

      v32 = (void *)objc_claimAutoreleasedReturnValue([v30 optInOut]);
    }

    v46 = v32;
    id v47 = [v32 optIn];

    if ((_DWORD)v47 == v8)
    {
      unint64_t v21 = 1LL;
      if (a5)
      {
        v19 = v55;
        if (v31)
        {
          id v31 = v31;
          *a5 = v31;
          unint64_t v21 = 1LL;
        }

        id v51 = v22;
      }

      else
      {
        id v51 = v22;
        v19 = v55;
      }

      v37 = v56;
    }

    else
    {
      v60[0] = @"mutation";
      id v48 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", v47));
      v60[1] = @"expected";
      v61[0] = v48;
      id v49 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", v8));
      v61[1] = v49;
      id v50 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v61,  v60,  2LL));

      id v51 = (id)objc_claimAutoreleasedReturnValue( +[TransparencyError errorWithDomain:code:underlyingError:userinfo:description:]( &OBJC_CLASS___TransparencyError,  "errorWithDomain:code:underlyingError:userinfo:description:",  @"TransparencyErrorVerify",  -315LL,  0LL,  v50,  @"mutation from directory server has wrong optInOut state"));
      if (qword_1002EEE60 != -1) {
        dispatch_once(&qword_1002EEE60, &stru_100289600);
      }
      v37 = v56;
      id v52 = (os_log_s *)qword_1002EEE68;
      v19 = v55;
      if (os_log_type_enabled((os_log_t)qword_1002EEE68, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        id v63 = v51;
        _os_log_impl( (void *)&_mh_execute_header,  v52,  OS_LOG_TYPE_ERROR,  "mutation from directory server has wrong optInOut %@",  buf,  0xCu);
      }

      if (a6 && v51) {
        *a6 = v51;
      }

      unint64_t v21 = 0LL;
    }

- (KTStateString)nextState
{
  return (KTStateString *)objc_getProperty(self, a2, 120LL, 1);
}

- (void)setNextState:(id)a3
{
}

- (KTStateString)intendedState
{
  return (KTStateString *)objc_getProperty(self, a2, 128LL, 1);
}

- (void)setIntendedState:(id)a3
{
}

- (NSMutableDictionary)optInResult
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 136LL, 1);
}

- (void)setOptInResult:(id)a3
{
}

- (KTOperationDependencies)deps
{
  return (KTOperationDependencies *)objc_getProperty(self, a2, 144LL, 1);
}

- (void)setDeps:(id)a3
{
}

- (KTOptInStateHolder)optInStates
{
  return (KTOptInStateHolder *)objc_getProperty(self, a2, 152LL, 1);
}

- (void)setOptInStates:(id)a3
{
}

- (NSString)applicationId
{
  return (NSString *)objc_getProperty(self, a2, 160LL, 1);
}

- (void)setApplicationId:(id)a3
{
}

- (KTStateString)errorState
{
  return (KTStateString *)objc_getProperty(self, a2, 168LL, 1);
}

- (void)setErrorState:(id)a3
{
}

- (void).cxx_destruct
{
}

@end