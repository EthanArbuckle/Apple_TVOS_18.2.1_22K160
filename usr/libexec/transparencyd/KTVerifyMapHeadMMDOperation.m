@interface KTVerifyMapHeadMMDOperation
- (BOOL)handlePendingMapHeadMMDs:(id)a3 error:(id *)a4;
- (KTOperationDependencies)deps;
- (KTVerifyMapHeadMMDOperation)initWithDependencies:(id)a3 opId:(id)a4;
- (NSMutableDictionary)errors;
- (NSMutableDictionary)failedSMHs;
- (NSOperation)finishedOp;
- (NSUUID)backgroundOpId;
- (id)verifyMapHeadMMDs:(id)a3 application:(id)a4 error:(id *)a5;
- (void)groupStart;
- (void)setBackgroundOpId:(id)a3;
- (void)setDeps:(id)a3;
- (void)setErrors:(id)a3;
- (void)setFailedSMHs:(id)a3;
- (void)setFinishedOp:(id)a3;
@end

@implementation KTVerifyMapHeadMMDOperation

- (KTVerifyMapHeadMMDOperation)initWithDependencies:(id)a3 opId:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)&OBJC_CLASS___KTVerifyMapHeadMMDOperation;
  v9 = -[KTGroupOperation init](&v14, "init");
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->super._startOperation, a3);
    -[KTVerifyMapHeadMMDOperation setBackgroundOpId:](v10, "setBackgroundOpId:", v8);
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
    -[KTVerifyMapHeadMMDOperation setErrors:](v10, "setErrors:", v11);

    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
    -[KTVerifyMapHeadMMDOperation setFailedSMHs:](v10, "setFailedSMHs:", v12);

    -[KTGroupOperation setName:](v10, "setName:", @"SmhMMD");
  }

  return v10;
}

- (void)groupStart
{
  if (qword_1002E64A0 != -1) {
    dispatch_once(&qword_1002E64A0, &stru_100278C98);
  }
  v3 = (os_log_s *)qword_1002E64A8;
  if (os_log_type_enabled((os_log_t)qword_1002E64A8, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEBUG, "VerifyMapHeadMMD: start", buf, 2u);
  }

  id v60 = 0LL;
  unsigned __int8 v4 = -[KTVerifyMapHeadMMDOperation handlePendingMapHeadMMDs:error:]( self,  "handlePendingMapHeadMMDs:error:",  kKTApplicationIdentifierIDS,  &v60);
  id v5 = v60;
  v6 = v5;
  if ((v4 & 1) == 0)
  {
    if (v5)
    {
      if (qword_1002E64A0 != -1) {
        dispatch_once(&qword_1002E64A0, &stru_100278CB8);
      }
      id v7 = (os_log_s *)qword_1002E64A8;
      if (os_log_type_enabled((os_log_t)qword_1002E64A8, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        id v66 = v6;
        _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_ERROR,  "Verify IDS Map Head MMDs failed: %@",  buf,  0xCu);
      }
    }

    -[KTResultOperation setError:](self, "setError:", v6);
  }

  id v59 = v6;
  unsigned __int8 v8 = -[KTVerifyMapHeadMMDOperation handlePendingMapHeadMMDs:error:]( self,  "handlePendingMapHeadMMDs:error:",  kKTApplicationIdentifierIDSMultiplex,  &v59);
  id v9 = v59;

  if ((v8 & 1) == 0)
  {
    if (v9)
    {
      if (qword_1002E64A0 != -1) {
        dispatch_once(&qword_1002E64A0, &stru_100278CD8);
      }
      v10 = (os_log_s *)qword_1002E64A8;
      if (os_log_type_enabled((os_log_t)qword_1002E64A8, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        id v66 = v9;
        _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_ERROR,  "Verify MP Map Head MMDs failed: %@",  buf,  0xCu);
      }
    }

    id v9 = 0LL;
  }

  id v58 = v9;
  unsigned __int8 v11 = -[KTVerifyMapHeadMMDOperation handlePendingMapHeadMMDs:error:]( self,  "handlePendingMapHeadMMDs:error:",  kKTApplicationIdentifierIDSFaceTime,  &v58);
  id v12 = v58;

  if ((v11 & 1) == 0)
  {
    if (v12)
    {
      if (qword_1002E64A0 != -1) {
        dispatch_once(&qword_1002E64A0, &stru_100278CF8);
      }
      v13 = (os_log_s *)qword_1002E64A8;
      if (os_log_type_enabled((os_log_t)qword_1002E64A8, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        id v66 = v12;
        _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_ERROR,  "Verify FT Map Head MMDs failed: %@",  buf,  0xCu);
      }
    }

    id v12 = 0LL;
  }

  objc_super v14 = (void *)objc_claimAutoreleasedReturnValue(-[KTVerifyMapHeadMMDOperation errors](self, "errors"));
  id v15 = [v14 count];

  if (v15)
  {
    id v47 = v12;
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[KTVerifyMapHeadMMDOperation errors](self, "errors"));
    v17 = (void *)objc_claimAutoreleasedReturnValue([v16 allKeys]);

    v46 = v17;
    v18 = (void *)objc_claimAutoreleasedReturnValue([v17 componentsJoinedByString:@","]);
    uint64_t v19 = objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"SMH MMDs failed for applications: %@",  v18));

    v63[0] = NSMultipleUnderlyingErrorsKey;
    v20 = (void *)objc_claimAutoreleasedReturnValue(-[KTVerifyMapHeadMMDOperation errors](self, "errors"));
    v21 = (void *)objc_claimAutoreleasedReturnValue([v20 allValues]);
    v63[1] = NSLocalizedDescriptionKey;
    v64[0] = v21;
    v45 = (void *)v19;
    v64[1] = v19;
    uint64_t v22 = objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v64,  v63,  2LL));

    v44 = (void *)v22;
    v23 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"TransparencyErrorVerify",  -383LL,  v22));
    -[KTResultOperation setError:](self, "setError:", v23);

    v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableString string](&OBJC_CLASS___NSMutableString, "string"));
    __int128 v54 = 0u;
    __int128 v55 = 0u;
    __int128 v56 = 0u;
    __int128 v57 = 0u;
    id obj = (id)objc_claimAutoreleasedReturnValue(-[KTVerifyMapHeadMMDOperation failedSMHs](self, "failedSMHs"));
    id v25 = [obj countByEnumeratingWithState:&v54 objects:v62 count:16];
    if (v25)
    {
      id v26 = v25;
      uint64_t v49 = *(void *)v55;
      do
      {
        for (i = 0LL; i != v26; i = (char *)i + 1)
        {
          if (*(void *)v55 != v49) {
            objc_enumerationMutation(obj);
          }
          uint64_t v28 = *(void *)(*((void *)&v54 + 1) + 8LL * (void)i);
          [v24 appendFormat:@"%@:", v28];
          __int128 v52 = 0u;
          __int128 v53 = 0u;
          __int128 v50 = 0u;
          __int128 v51 = 0u;
          v29 = self;
          v30 = (void *)objc_claimAutoreleasedReturnValue(-[KTVerifyMapHeadMMDOperation failedSMHs](self, "failedSMHs"));
          v31 = (void *)objc_claimAutoreleasedReturnValue([v30 objectForKeyedSubscript:v28]);

          id v32 = [v31 countByEnumeratingWithState:&v50 objects:v61 count:16];
          if (v32)
          {
            id v33 = v32;
            uint64_t v34 = *(void *)v51;
            do
            {
              for (j = 0LL; j != v33; j = (char *)j + 1)
              {
                if (*(void *)v51 != v34) {
                  objc_enumerationMutation(v31);
                }
                v36 = (void *)objc_claimAutoreleasedReturnValue( [*(id *)(*((void *)&v50 + 1) + 8 * (void)j) base64EncodedStringWithOptions:0]);
                [v24 appendFormat:@"%@;", v36];
              }

              id v33 = [v31 countByEnumeratingWithState:&v50 objects:v61 count:16];
            }

            while (v33);
          }

          self = v29;
        }

        id v26 = [obj countByEnumeratingWithState:&v54 objects:v62 count:16];
      }

      while (v26);
    }

    v37 = (void *)objc_claimAutoreleasedReturnValue(-[KTVerifyMapHeadMMDOperation backgroundOpId](self, "backgroundOpId"));
    v38 = (void *)objc_claimAutoreleasedReturnValue(-[KTVerifyMapHeadMMDOperation deps](self, "deps"));
    v39 = self;
    v40 = (void *)objc_claimAutoreleasedReturnValue([v38 smDataStore]);
    v41 = (void *)objc_claimAutoreleasedReturnValue(-[KTVerifyMapHeadMMDOperation name](v39, "name"));
    v42 = (void *)objc_claimAutoreleasedReturnValue(-[KTResultOperation error](v39, "error"));
    +[KTBackgroundSystemValidationOperation addErrorToBackgroundOp:smDataStore:failureDataString:type:serverHint:failure:]( &OBJC_CLASS___KTBackgroundSystemValidationOperation,  "addErrorToBackgroundOp:smDataStore:failureDataString:type:serverHint:failure:",  v37,  v40,  v24,  v41,  0LL,  v42);

    id v12 = v47;
  }

  if (qword_1002E64A0 != -1) {
    dispatch_once(&qword_1002E64A0, &stru_100278D18);
  }
  v43 = (os_log_s *)qword_1002E64A8;
  if (os_log_type_enabled((os_log_t)qword_1002E64A8, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v43, OS_LOG_TYPE_DEBUG, "VerifyMapHeadMMD: end", buf, 2u);
  }
}

- (BOOL)handlePendingMapHeadMMDs:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v17 = 0LL;
  v18 = &v17;
  uint64_t v19 = 0x3032000000LL;
  v20 = sub_100028248;
  v21 = sub_100028258;
  id v22 = 0LL;
  id location = 0LL;
  objc_initWeak(&location, self);
  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[KTVerifyMapHeadMMDOperation deps](self, "deps"));
  unsigned __int8 v8 = (void *)objc_claimAutoreleasedReturnValue([v7 dataStore]);
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472LL;
  v12[2] = sub_100028260;
  v12[3] = &unk_100278D60;
  objc_copyWeak(&v15, &location);
  id v9 = v6;
  id v13 = v9;
  objc_super v14 = &v17;
  [v8 performForSMHsWithUnverifiedMMD:v9 error:a4 block:v12];

  if (a4)
  {
    v10 = (void *)v18[5];
    if (v10) {
      *a4 = v10;
    }
  }

  objc_destroyWeak(&v15);
  objc_destroyWeak(&location);
  _Block_object_dispose(&v17, 8);

  return 0;
}

- (id)verifyMapHeadMMDs:(id)a3 application:(id)a4 error:(id *)a5
{
  v42 = a5;
  id v7 = a3;
  id v8 = a4;
  id v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  v45 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  v48 = self;
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[KTVerifyMapHeadMMDOperation deps](self, "deps"));
  unsigned __int8 v11 = (void *)objc_claimAutoreleasedReturnValue([v10 publicKeyStore]);
  v43 = v8;
  v46 = (void *)objc_claimAutoreleasedReturnValue([v11 applicationPublicKeyStore:v8]);

  __int128 v54 = 0u;
  __int128 v55 = 0u;
  __int128 v52 = 0u;
  __int128 v53 = 0u;
  id obj = v7;
  id v12 = [obj countByEnumeratingWithState:&v52 objects:v60 count:16];
  if (v12)
  {
    id v13 = v12;
    uint64_t v47 = *(void *)v53;
    do
    {
      objc_super v14 = 0LL;
      do
      {
        if (*(void *)v53 != v47) {
          objc_enumerationMutation(obj);
        }
        id v15 = *(void **)(*((void *)&v52 + 1) + 8LL * (void)v14);
        v16 = objc_autoreleasePoolPush();
        uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue([v15 sth]);
        id v51 = 0LL;
        v18 = (void *)objc_claimAutoreleasedReturnValue( +[SignedObjectHolder parseFromData:error:]( &OBJC_CLASS___SignedMapHead,  "parseFromData:error:",  v17,  &v51));
        id v19 = v51;

        if (v18)
        {
          v20 = (void *)objc_claimAutoreleasedReturnValue([v46 appSthKeyStore]);
          v21 = (void *)objc_claimAutoreleasedReturnValue([v20 signatureVerifier]);
          [v18 setVerifier:v21];

          [v15 receiptTime];
          id v50 = v19;
          id v22 = objc_msgSend(v18, "verifyMMD:error:", &v50);
          id v23 = v50;

          [v15 setUnsigned:"mmdVerified" value:v22];
          if (!v22)
          {
            v24 = (void *)objc_claimAutoreleasedReturnValue([v15 sth]);
            [v45 addObject:v24];

            [v9 addObject:v23];
          }

          id v25 = v9;
          id v26 = (void *)objc_claimAutoreleasedReturnValue(-[KTVerifyMapHeadMMDOperation deps](v48, "deps", v42));
          v27 = (void *)objc_claimAutoreleasedReturnValue([v26 dataStore]);
          id v49 = v23;
          unsigned __int8 v28 = [v27 persistAndRefaultObject:v15 error:&v49];
          id v19 = v49;

          if ((v28 & 1) != 0) {
            goto LABEL_16;
          }
          if (qword_1002E64A0 != -1) {
            dispatch_once(&qword_1002E64A0, &stru_100278D80);
          }
          v29 = (os_log_s *)qword_1002E64A8;
          if (os_log_type_enabled((os_log_t)qword_1002E64A8, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412290;
            id v59 = v19;
            _os_log_impl( (void *)&_mh_execute_header,  v29,  OS_LOG_TYPE_ERROR,  "VerifyMapHeadMMD: failed to save MMD verified SMHs: %@",  buf,  0xCu);
          }

          if (!v19)
          {
LABEL_16:
            id v9 = v25;
            goto LABEL_19;
          }

          v30 = (void *)objc_claimAutoreleasedReturnValue(-[KTVerifyMapHeadMMDOperation deps](v48, "deps"));
          v31 = (void *)objc_claimAutoreleasedReturnValue([v30 dataStore]);
          [v31 reportCoreDataPersistEventForLocation:@"verifyMapHeadMMDs" underlyingError:v19];

          id v9 = v25;
          id v32 = v25;
        }

        else
        {
          id v33 = (void *)objc_claimAutoreleasedReturnValue([v15 sth]);
          [v45 addObject:v33];

          uint64_t v34 = (void *)objc_claimAutoreleasedReturnValue(-[KTVerifyMapHeadMMDOperation deps](v48, "deps"));
          v35 = (void *)objc_claimAutoreleasedReturnValue([v34 dataStore]);
          [v35 deleteObject:v15];

          id v32 = v9;
        }

        objc_msgSend(v32, "addObject:", v19, v42);
LABEL_19:

        objc_autoreleasePoolPop(v16);
        objc_super v14 = (char *)v14 + 1;
      }

      while (v13 != v14);
      id v13 = [obj countByEnumeratingWithState:&v52 objects:v60 count:16];
    }

    while (v13);
  }

  if ([v9 count])
  {
    NSErrorUserInfoKey v56 = NSMultipleUnderlyingErrorsKey;
    __int128 v57 = v9;
    v36 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v57,  &v56,  1LL));
    v37 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"TransparencyErrorVerify",  -383LL,  v36));
    v38 = v37;
    if (v42 && v37) {
      id *v42 = v37;
    }
  }

  if (objc_msgSend(v45, "count", v42)) {
    v39 = v45;
  }
  else {
    v39 = 0LL;
  }
  id v40 = v39;

  return v40;
}

- (KTOperationDependencies)deps
{
  return (KTOperationDependencies *)objc_getProperty(self, a2, 120LL, 1);
}

- (void)setDeps:(id)a3
{
}

- (NSUUID)backgroundOpId
{
  return (NSUUID *)objc_getProperty(self, a2, 128LL, 1);
}

- (void)setBackgroundOpId:(id)a3
{
}

- (NSOperation)finishedOp
{
  return (NSOperation *)objc_getProperty(self, a2, 136LL, 1);
}

- (void)setFinishedOp:(id)a3
{
}

- (NSMutableDictionary)errors
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 144LL, 1);
}

- (void)setErrors:(id)a3
{
}

- (NSMutableDictionary)failedSMHs
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 152LL, 1);
}

- (void)setFailedSMHs:(id)a3
{
}

- (void).cxx_destruct
{
}

@end