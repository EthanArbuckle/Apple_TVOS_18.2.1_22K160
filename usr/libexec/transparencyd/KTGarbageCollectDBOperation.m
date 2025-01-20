@interface KTGarbageCollectDBOperation
- (KTGarbageCollectDBOperation)initWithDependencies:(id)a3;
- (KTOperationDependencies)deps;
- (void)garbageCollectHeads:(id)a3 error:(id *)a4;
- (void)groupStart;
- (void)setDeps:(id)a3;
@end

@implementation KTGarbageCollectDBOperation

- (KTGarbageCollectDBOperation)initWithDependencies:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___KTGarbageCollectDBOperation;
  v6 = -[KTGroupOperation init](&v9, "init");
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->super._startOperation, a3);
  }

  return v7;
}

- (void)garbageCollectHeads:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[KTGarbageCollectDBOperation deps](self, "deps"));
  v8 = (void *)objc_claimAutoreleasedReturnValue([v7 publicKeyStore]);
  objc_super v9 = (void *)objc_claimAutoreleasedReturnValue([v8 applicationPublicKeyStore:v6]);

  id v10 = [v9 patLogBeginningMs];
  uint64_t v11 = kKTApplicationIdentifierTLT;
  if ([v6 isEqual:kKTApplicationIdentifierTLT])
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[KTGarbageCollectDBOperation deps](self, "deps"));
    v13 = (void *)objc_claimAutoreleasedReturnValue([v12 publicKeyStore]);
    v14 = (void *)objc_claimAutoreleasedReturnValue([v13 tltKeyStore]);

    id v10 = [v14 tltLogBeginningMs];
    objc_super v9 = v14;
  }

  v15 = (void *)objc_claimAutoreleasedReturnValue( +[NSDate dateWithTimeIntervalSinceNow:]( &OBJC_CLASS___NSDate,  "dateWithTimeIntervalSinceNow:",  (double)(uint64_t)-kKTMaximumSTHLifetime));
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[KTGarbageCollectDBOperation deps](self, "deps"));
  v17 = (void *)objc_claimAutoreleasedReturnValue([v16 dataStore]);
  [v17 garbageCollectSTHs:v6 logBeginMs:v10 olderThanDate:v15 error:a4];

  if (([v6 isEqual:v11] & 1) == 0)
  {
    v18 = (void *)objc_claimAutoreleasedReturnValue(-[KTGarbageCollectDBOperation deps](self, "deps"));
    v19 = (void *)objc_claimAutoreleasedReturnValue([v18 dataStore]);
    id v20 = objc_msgSend(v19, "newestMapRevision:logBeginMs:error:", v6, objc_msgSend(v9, "patLogBeginningMs"), a4);

    if (a4 && *a4)
    {
      if (qword_1002E6420 != -1) {
        dispatch_once(&qword_1002E6420, &stru_100277898);
      }
      v21 = (os_log_s *)qword_1002E6428;
      if (os_log_type_enabled((os_log_t)qword_1002E6428, OS_LOG_TYPE_ERROR))
      {
        id v22 = *a4;
        int v26 = 138412546;
        id v27 = v6;
        __int16 v28 = 2112;
        id v29 = v22;
        _os_log_impl( (void *)&_mh_execute_header,  v21,  OS_LOG_TYPE_ERROR,  "garbageCollectHeads failed to get newest map revision for %@: %@",  (uint8_t *)&v26,  0x16u);
      }
    }

    v23 = (void *)objc_claimAutoreleasedReturnValue( +[NSDate dateWithTimeIntervalSinceNow:]( &OBJC_CLASS___NSDate,  "dateWithTimeIntervalSinceNow:",  (double)(uint64_t)-kKTMaximumSMHLifetime));
    v24 = (void *)objc_claimAutoreleasedReturnValue(-[KTGarbageCollectDBOperation deps](self, "deps"));
    v25 = (void *)objc_claimAutoreleasedReturnValue([v24 dataStore]);
    objc_msgSend( v25,  "garbageCollectSMHs:logBeginMs:olderThanRevision:olderThanDate:error:",  v6,  objc_msgSend(v9, "patLogBeginningMs"),  v20,  v23,  a4);
  }
}

- (void)groupStart
{
  if (qword_1002E6420 != -1) {
    dispatch_once(&qword_1002E6420, &stru_1002778B8);
  }
  v3 = (os_log_s *)qword_1002E6428;
  if (os_log_type_enabled((os_log_t)qword_1002E6428, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEBUG, "GarbageCollectDB: start", buf, 2u);
  }

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[KTGarbageCollectDBOperation deps](self, "deps"));
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 dataStore]);
  id v54 = 0LL;
  [v5 garbageCollectVerifications:&v54];
  id v6 = v54;

  if (v6)
  {
    if (qword_1002E6420 != -1) {
      dispatch_once(&qword_1002E6420, &stru_1002778D8);
    }
    v7 = (os_log_s *)qword_1002E6428;
    if (os_log_type_enabled((os_log_t)qword_1002E6428, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v56 = v6;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_ERROR, "garbageCollectVerifications: %@", buf, 0xCu);
    }
  }

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[KTGarbageCollectDBOperation deps](self, "deps"));
  objc_super v9 = (void *)objc_claimAutoreleasedReturnValue([v8 dataStore]);
  id v53 = 0LL;
  [v9 garbageCollectServerRPCs:&v53];
  id v10 = v53;

  if (v10)
  {
    if (qword_1002E6420 != -1) {
      dispatch_once(&qword_1002E6420, &stru_1002778F8);
    }
    uint64_t v11 = (os_log_s *)qword_1002E6428;
    if (os_log_type_enabled((os_log_t)qword_1002E6428, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v56 = v10;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_ERROR, "garbageCollectServerRPCs: %@", buf, 0xCu);
    }
  }

  v12 = (void *)objc_claimAutoreleasedReturnValue(-[KTGarbageCollectDBOperation deps](self, "deps"));
  v13 = (void *)objc_claimAutoreleasedReturnValue([v12 dataStore]);
  id v52 = 0LL;
  [v13 garbageCollectSMTs:&v52];
  id v14 = v52;

  if (v14)
  {
    if (qword_1002E6420 != -1) {
      dispatch_once(&qword_1002E6420, &stru_100277918);
    }
    v15 = (os_log_s *)qword_1002E6428;
    if (os_log_type_enabled((os_log_t)qword_1002E6428, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v56 = v14;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_ERROR, "garbageCollectSMTs: %@", buf, 0xCu);
    }
  }

  uint64_t v16 = kKTApplicationIdentifierIDS;
  id v51 = 0LL;
  -[KTGarbageCollectDBOperation garbageCollectHeads:error:]( self,  "garbageCollectHeads:error:",  kKTApplicationIdentifierIDS,  &v51);
  id v17 = v51;
  if (v17)
  {
    v18 = v17;
    if (qword_1002E6420 != -1) {
      dispatch_once(&qword_1002E6420, &stru_100277938);
    }
    v19 = (os_log_s *)qword_1002E6428;
    if (os_log_type_enabled((os_log_t)qword_1002E6428, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v56 = v18;
      _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_ERROR, "garbageCollectIDSHeads: %@", buf, 0xCu);
    }
  }

  id v50 = 0LL;
  -[KTGarbageCollectDBOperation garbageCollectHeads:error:]( self,  "garbageCollectHeads:error:",  kKTApplicationIdentifierTLT,  &v50);
  id v20 = v50;
  if (v20)
  {
    v21 = v20;
    if (qword_1002E6420 != -1) {
      dispatch_once(&qword_1002E6420, &stru_100277958);
    }
    id v22 = (os_log_s *)qword_1002E6428;
    if (os_log_type_enabled((os_log_t)qword_1002E6428, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v56 = v21;
      _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_ERROR, "garbageCollectTLTHeads: %@", buf, 0xCu);
    }
  }

  v23 = (void *)objc_claimAutoreleasedReturnValue( +[NSDate dateWithTimeIntervalSinceNow:]( &OBJC_CLASS___NSDate,  "dateWithTimeIntervalSinceNow:",  (double)(-2LL * kKTMaximumCompletedRequestLifetime)));
  v24 = (void *)objc_claimAutoreleasedReturnValue(-[KTGarbageCollectDBOperation deps](self, "deps"));
  v25 = (void *)objc_claimAutoreleasedReturnValue([v24 dataStore]);
  id v49 = 0LL;
  [v25 garbageCollectRequests:v16 olderThan:v23 error:&v49];
  id v26 = v49;

  if (v26)
  {
    if (qword_1002E6420 != -1) {
      dispatch_once(&qword_1002E6420, &stru_100277978);
    }
    id v27 = (os_log_s *)qword_1002E6428;
    if (os_log_type_enabled((os_log_t)qword_1002E6428, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v56 = v26;
      _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_ERROR, "garbageCollectIDSRequests: %@", buf, 0xCu);
    }
  }

  uint64_t v28 = kKTApplicationIdentifierIDSMultiplex;
  id v48 = 0LL;
  -[KTGarbageCollectDBOperation garbageCollectHeads:error:]( self,  "garbageCollectHeads:error:",  kKTApplicationIdentifierIDSMultiplex,  &v48);
  id v29 = v48;
  if (v29)
  {
    v30 = v29;
    if (qword_1002E6420 != -1) {
      dispatch_once(&qword_1002E6420, &stru_100277998);
    }
    v31 = (os_log_s *)qword_1002E6428;
    if (os_log_type_enabled((os_log_t)qword_1002E6428, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v56 = v30;
      _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_ERROR, "garbageCollectMPHeads: %@", buf, 0xCu);
    }
  }

  v32 = (void *)objc_claimAutoreleasedReturnValue(-[KTGarbageCollectDBOperation deps](self, "deps"));
  v33 = (void *)objc_claimAutoreleasedReturnValue([v32 dataStore]);
  id v47 = 0LL;
  [v33 garbageCollectRequests:v28 olderThan:v23 error:&v47];
  id v34 = v47;

  if (v34)
  {
    if (qword_1002E6420 != -1) {
      dispatch_once(&qword_1002E6420, &stru_1002779B8);
    }
    v35 = (os_log_s *)qword_1002E6428;
    if (os_log_type_enabled((os_log_t)qword_1002E6428, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v56 = v34;
      _os_log_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_ERROR, "garbageCollectMPRequests: %@", buf, 0xCu);
    }
  }

  uint64_t v36 = kKTApplicationIdentifierIDSFaceTime;
  id v46 = 0LL;
  -[KTGarbageCollectDBOperation garbageCollectHeads:error:]( self,  "garbageCollectHeads:error:",  kKTApplicationIdentifierIDSFaceTime,  &v46);
  id v37 = v46;
  if (v37)
  {
    v38 = v37;
    if (qword_1002E6420 != -1) {
      dispatch_once(&qword_1002E6420, &stru_1002779D8);
    }
    v39 = (os_log_s *)qword_1002E6428;
    if (os_log_type_enabled((os_log_t)qword_1002E6428, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v56 = v38;
      _os_log_impl((void *)&_mh_execute_header, v39, OS_LOG_TYPE_ERROR, "garbageCollectFTHeads: %@", buf, 0xCu);
    }
  }

  v40 = (void *)objc_claimAutoreleasedReturnValue(-[KTGarbageCollectDBOperation deps](self, "deps"));
  v41 = (void *)objc_claimAutoreleasedReturnValue([v40 dataStore]);
  id v45 = 0LL;
  [v41 garbageCollectRequests:v36 olderThan:v23 error:&v45];
  id v42 = v45;

  if (v42)
  {
    if (qword_1002E6420 != -1) {
      dispatch_once(&qword_1002E6420, &stru_1002779F8);
    }
    v43 = (os_log_s *)qword_1002E6428;
    if (os_log_type_enabled((os_log_t)qword_1002E6428, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v56 = v42;
      _os_log_impl((void *)&_mh_execute_header, v43, OS_LOG_TYPE_ERROR, "garbageCollectFTRequests: %@", buf, 0xCu);
    }
  }

  if (qword_1002E6420 != -1) {
    dispatch_once(&qword_1002E6420, &stru_100277A18);
  }
  v44 = (os_log_s *)qword_1002E6428;
  if (os_log_type_enabled((os_log_t)qword_1002E6428, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v44, OS_LOG_TYPE_DEBUG, "GarbageCollectDB: end", buf, 2u);
  }
}

- (KTOperationDependencies)deps
{
  return (KTOperationDependencies *)objc_getProperty(self, a2, 120LL, 1);
}

- (void)setDeps:(id)a3
{
}

- (void).cxx_destruct
{
}

@end