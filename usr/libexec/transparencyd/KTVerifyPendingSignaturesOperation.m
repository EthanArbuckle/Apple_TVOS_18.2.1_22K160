@interface KTVerifyPendingSignaturesOperation
- (BOOL)verifyHeadsWithPendingSignatures:(id)a3 error:(id *)a4;
- (BOOL)verifySMTsWithPendingSignatures:(id)a3 error:(id *)a4;
- (KTOperationDependencies)deps;
- (KTVerifyPendingSignaturesOperation)initWithDependencies:(id)a3 opId:(id)a4;
- (NSMutableDictionary)errors;
- (NSMutableDictionary)failedSigs;
- (NSOperation)finishedOp;
- (NSUUID)backgroundOpId;
- (void)groupStart;
- (void)setBackgroundOpId:(id)a3;
- (void)setDeps:(id)a3;
- (void)setErrors:(id)a3;
- (void)setFailedSigs:(id)a3;
- (void)setFinishedOp:(id)a3;
@end

@implementation KTVerifyPendingSignaturesOperation

- (KTVerifyPendingSignaturesOperation)initWithDependencies:(id)a3 opId:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)&OBJC_CLASS___KTVerifyPendingSignaturesOperation;
  v9 = -[KTGroupOperation init](&v14, "init");
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->super._startOperation, a3);
    -[KTVerifyPendingSignaturesOperation setBackgroundOpId:](v10, "setBackgroundOpId:", v8);
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
    -[KTVerifyPendingSignaturesOperation setErrors:](v10, "setErrors:", v11);

    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
    -[KTVerifyPendingSignaturesOperation setFailedSigs:](v10, "setFailedSigs:", v12);

    -[KTGroupOperation setName:](v10, "setName:", @"Signature");
  }

  return v10;
}

- (void)groupStart
{
  if (qword_1002E63F0 != -1) {
    dispatch_once(&qword_1002E63F0, &stru_100276E18);
  }
  v3 = (os_log_s *)qword_1002E63F8;
  if (os_log_type_enabled((os_log_t)qword_1002E63F8, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEBUG, "VerifyPendingSignatures: start", buf, 2u);
  }

  uint64_t v4 = kKTApplicationIdentifierIDS;
  id v83 = 0LL;
  unsigned __int8 v5 = -[KTVerifyPendingSignaturesOperation verifySMTsWithPendingSignatures:error:]( self,  "verifySMTsWithPendingSignatures:error:",  kKTApplicationIdentifierIDS,  &v83);
  id v6 = v83;
  if ((v5 & 1) == 0)
  {
    if (qword_1002E63F0 != -1) {
      dispatch_once(&qword_1002E63F0, &stru_100276E38);
    }
    id v7 = (os_log_s *)qword_1002E63F8;
    if (os_log_type_enabled((os_log_t)qword_1002E63F8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v89 = v6;
      _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_ERROR,  "Verify pending IDS SMT signatures failed: %@",  buf,  0xCu);
    }

    id v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%@-SMTs", v4));
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[KTVerifyPendingSignaturesOperation errors](self, "errors"));
    [v9 setObject:v6 forKeyedSubscript:v8];

    id v6 = 0LL;
  }

  id v82 = v6;
  unsigned __int8 v10 = -[KTVerifyPendingSignaturesOperation verifyHeadsWithPendingSignatures:error:]( self,  "verifyHeadsWithPendingSignatures:error:",  v4,  &v82);
  id v11 = v82;

  if ((v10 & 1) == 0)
  {
    if (qword_1002E63F0 != -1) {
      dispatch_once(&qword_1002E63F0, &stru_100276E58);
    }
    v12 = (os_log_s *)qword_1002E63F8;
    if (os_log_type_enabled((os_log_t)qword_1002E63F8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v89 = v11;
      _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_ERROR,  "Verify pending IDS Head signatures failed: %@",  buf,  0xCu);
    }

    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%@-STHs", v4));
    objc_super v14 = (void *)objc_claimAutoreleasedReturnValue(-[KTVerifyPendingSignaturesOperation errors](self, "errors"));
    [v14 setObject:v11 forKeyedSubscript:v13];

    id v11 = 0LL;
  }

  uint64_t v15 = kKTApplicationIdentifierTLT;
  id v81 = v11;
  unsigned __int8 v16 = -[KTVerifyPendingSignaturesOperation verifyHeadsWithPendingSignatures:error:]( self,  "verifyHeadsWithPendingSignatures:error:",  kKTApplicationIdentifierTLT,  &v81);
  id v17 = v81;

  if ((v16 & 1) == 0)
  {
    if (qword_1002E63F0 != -1) {
      dispatch_once(&qword_1002E63F0, &stru_100276E78);
    }
    v18 = (os_log_s *)qword_1002E63F8;
    if (os_log_type_enabled((os_log_t)qword_1002E63F8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v89 = v17;
      _os_log_impl( (void *)&_mh_execute_header,  v18,  OS_LOG_TYPE_ERROR,  "Verify pending IDS Head signatures failed: %@",  buf,  0xCu);
    }

    v19 = (void *)objc_claimAutoreleasedReturnValue(-[KTVerifyPendingSignaturesOperation errors](self, "errors"));
    [v19 setObject:v17 forKeyedSubscript:v15];

    id v17 = 0LL;
  }

  uint64_t v20 = kKTApplicationIdentifierIDSMultiplex;
  id v80 = v17;
  unsigned __int8 v21 = -[KTVerifyPendingSignaturesOperation verifySMTsWithPendingSignatures:error:]( self,  "verifySMTsWithPendingSignatures:error:",  kKTApplicationIdentifierIDSMultiplex,  &v80);
  id v22 = v80;

  if ((v21 & 1) == 0)
  {
    if (qword_1002E63F0 != -1) {
      dispatch_once(&qword_1002E63F0, &stru_100276E98);
    }
    v23 = (os_log_s *)qword_1002E63F8;
    if (os_log_type_enabled((os_log_t)qword_1002E63F8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v89 = v22;
      _os_log_impl( (void *)&_mh_execute_header,  v23,  OS_LOG_TYPE_ERROR,  "Verify pending MP SMT signatures failed: %@",  buf,  0xCu);
    }

    id v22 = 0LL;
  }

  id v79 = v22;
  unsigned __int8 v24 = -[KTVerifyPendingSignaturesOperation verifyHeadsWithPendingSignatures:error:]( self,  "verifyHeadsWithPendingSignatures:error:",  v20,  &v79);
  id v25 = v79;

  if ((v24 & 1) == 0)
  {
    if (qword_1002E63F0 != -1) {
      dispatch_once(&qword_1002E63F0, &stru_100276EB8);
    }
    v26 = (os_log_s *)qword_1002E63F8;
    if (os_log_type_enabled((os_log_t)qword_1002E63F8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v89 = v25;
      _os_log_impl( (void *)&_mh_execute_header,  v26,  OS_LOG_TYPE_ERROR,  "Verify pending MP Head signatures failed: %@",  buf,  0xCu);
    }

    id v25 = 0LL;
  }

  uint64_t v27 = kKTApplicationIdentifierIDSFaceTime;
  id v78 = v25;
  unsigned __int8 v28 = -[KTVerifyPendingSignaturesOperation verifySMTsWithPendingSignatures:error:]( self,  "verifySMTsWithPendingSignatures:error:",  kKTApplicationIdentifierIDSFaceTime,  &v78);
  id v29 = v78;

  if ((v28 & 1) == 0)
  {
    if (qword_1002E63F0 != -1) {
      dispatch_once(&qword_1002E63F0, &stru_100276ED8);
    }
    v30 = (os_log_s *)qword_1002E63F8;
    if (os_log_type_enabled((os_log_t)qword_1002E63F8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v89 = v29;
      _os_log_impl( (void *)&_mh_execute_header,  v30,  OS_LOG_TYPE_ERROR,  "Verify pending FT SMT signatures failed: %@",  buf,  0xCu);
    }

    id v29 = 0LL;
  }

  id v77 = v29;
  unsigned __int8 v31 = -[KTVerifyPendingSignaturesOperation verifyHeadsWithPendingSignatures:error:]( self,  "verifyHeadsWithPendingSignatures:error:",  v27,  &v77);
  id v32 = v77;

  if ((v31 & 1) == 0)
  {
    if (qword_1002E63F0 != -1) {
      dispatch_once(&qword_1002E63F0, &stru_100276EF8);
    }
    v33 = (os_log_s *)qword_1002E63F8;
    if (os_log_type_enabled((os_log_t)qword_1002E63F8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v89 = v32;
      _os_log_impl( (void *)&_mh_execute_header,  v33,  OS_LOG_TYPE_ERROR,  "Verify pending FT Head signatures failed: %@",  buf,  0xCu);
    }

    id v32 = 0LL;
  }

  v34 = (void *)objc_claimAutoreleasedReturnValue(-[KTVerifyPendingSignaturesOperation errors](self, "errors"));
  id v35 = [v34 count];

  if (v35)
  {
    id v66 = v32;
    v36 = (void *)objc_claimAutoreleasedReturnValue(-[KTVerifyPendingSignaturesOperation errors](self, "errors"));
    v37 = (void *)objc_claimAutoreleasedReturnValue([v36 allKeys]);

    v65 = v37;
    v38 = (void *)objc_claimAutoreleasedReturnValue([v37 componentsJoinedByString:@","]);
    uint64_t v39 = objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Pending signatures failed for applications: %@",  v38));

    v86[0] = NSMultipleUnderlyingErrorsKey;
    v40 = (void *)objc_claimAutoreleasedReturnValue(-[KTVerifyPendingSignaturesOperation errors](self, "errors"));
    v41 = (void *)objc_claimAutoreleasedReturnValue([v40 allValues]);
    v86[1] = NSLocalizedDescriptionKey;
    v87[0] = v41;
    v64 = (void *)v39;
    v87[1] = v39;
    uint64_t v42 = objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v87,  v86,  2LL));

    v63 = (void *)v42;
    v43 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"TransparencyErrorVerify",  -384LL,  v42));
    -[KTResultOperation setError:](self, "setError:", v43);

    v44 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableString string](&OBJC_CLASS___NSMutableString, "string"));
    __int128 v73 = 0u;
    __int128 v74 = 0u;
    __int128 v75 = 0u;
    __int128 v76 = 0u;
    v68 = self;
    id obj = (id)objc_claimAutoreleasedReturnValue(-[KTVerifyPendingSignaturesOperation failedSigs](self, "failedSigs"));
    id v45 = [obj countByEnumeratingWithState:&v73 objects:v85 count:16];
    if (v45)
    {
      id v46 = v45;
      uint64_t v47 = *(void *)v74;
      do
      {
        for (i = 0LL; i != v46; i = (char *)i + 1)
        {
          if (*(void *)v74 != v47) {
            objc_enumerationMutation(obj);
          }
          uint64_t v49 = *(void *)(*((void *)&v73 + 1) + 8LL * (void)i);
          [v44 appendFormat:@"%@:", v49];
          __int128 v71 = 0u;
          __int128 v72 = 0u;
          __int128 v69 = 0u;
          __int128 v70 = 0u;
          v50 = (void *)objc_claimAutoreleasedReturnValue(-[KTVerifyPendingSignaturesOperation failedSigs](v68, "failedSigs"));
          v51 = (void *)objc_claimAutoreleasedReturnValue([v50 objectForKeyedSubscript:v49]);

          id v52 = [v51 countByEnumeratingWithState:&v69 objects:v84 count:16];
          if (v52)
          {
            id v53 = v52;
            uint64_t v54 = *(void *)v70;
            do
            {
              for (j = 0LL; j != v53; j = (char *)j + 1)
              {
                if (*(void *)v70 != v54) {
                  objc_enumerationMutation(v51);
                }
                v56 = (void *)objc_claimAutoreleasedReturnValue( [*(id *)(*((void *)&v69 + 1) + 8 * (void)j) base64EncodedStringWithOptions:0]);
                [v44 appendFormat:@"%@;", v56];
              }

              id v53 = [v51 countByEnumeratingWithState:&v69 objects:v84 count:16];
            }

            while (v53);
          }
        }

        id v46 = [obj countByEnumeratingWithState:&v73 objects:v85 count:16];
      }

      while (v46);
    }

    v57 = (void *)objc_claimAutoreleasedReturnValue(-[KTVerifyPendingSignaturesOperation backgroundOpId](v68, "backgroundOpId"));
    v58 = (void *)objc_claimAutoreleasedReturnValue(-[KTVerifyPendingSignaturesOperation deps](v68, "deps"));
    v59 = (void *)objc_claimAutoreleasedReturnValue([v58 smDataStore]);
    v60 = (void *)objc_claimAutoreleasedReturnValue(-[KTVerifyPendingSignaturesOperation name](v68, "name"));
    v61 = (void *)objc_claimAutoreleasedReturnValue(-[KTResultOperation error](v68, "error"));
    +[KTBackgroundSystemValidationOperation addErrorToBackgroundOp:smDataStore:failureDataString:type:serverHint:failure:]( &OBJC_CLASS___KTBackgroundSystemValidationOperation,  "addErrorToBackgroundOp:smDataStore:failureDataString:type:serverHint:failure:",  v57,  v59,  v44,  v60,  0LL,  v61);

    id v32 = v66;
  }

  if (qword_1002E63F0 != -1) {
    dispatch_once(&qword_1002E63F0, &stru_100276F18);
  }
  v62 = (os_log_s *)qword_1002E63F8;
  if (os_log_type_enabled((os_log_t)qword_1002E63F8, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v62, OS_LOG_TYPE_DEBUG, "VerifyPendingSignatures: end", buf, 2u);
  }
}

- (BOOL)verifySMTsWithPendingSignatures:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v34 = 0LL;
  id v35 = &v34;
  uint64_t v36 = 0x3032000000LL;
  v37 = sub_10000D7A4;
  v38 = sub_10000D7B4;
  id v39 = 0LL;
  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[KTVerifyPendingSignaturesOperation deps](self, "deps"));
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 publicKeyStore]);
  v9 = (void *)objc_claimAutoreleasedReturnValue([v8 applicationPublicKeyStore:v6]);

  unsigned __int8 v10 = objc_alloc(&OBJC_CLASS___KTContextVerifier);
  id v11 = (void *)objc_claimAutoreleasedReturnValue(-[KTVerifyPendingSignaturesOperation deps](self, "deps"));
  v12 = (void *)objc_claimAutoreleasedReturnValue([v11 dataStore]);
  v13 = -[KTContextVerifier initWithApplicationKeyStore:dataStore:applicationID:]( v10,  "initWithApplicationKeyStore:dataStore:applicationID:",  v9,  v12,  v6);

  objc_super v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue(-[KTVerifyPendingSignaturesOperation deps](self, "deps"));
  unsigned __int8 v16 = (void *)objc_claimAutoreleasedReturnValue([v15 dataStore]);
  id v33 = 0LL;
  v27[0] = _NSConcreteStackBlock;
  v27[1] = 3221225472LL;
  v27[2] = sub_10000D7BC;
  v27[3] = &unk_100276FC0;
  id v32 = &v34;
  id v17 = v13;
  unsigned __int8 v28 = v17;
  id v18 = v6;
  id v29 = v18;
  id v19 = v14;
  id v30 = v19;
  unsigned __int8 v31 = self;
  [v16 performForSMTsWithUnverifiedSignature:v18 error:&v33 block:v27];
  id v20 = v33;

  if (!v20)
  {
    id v22 = v35;
    if (a4)
    {
      v23 = (void *)v35[5];
      if (v23)
      {
        *a4 = v23;
        id v22 = v35;
      }
    }

    if (!v22[5])
    {
      BOOL v21 = 1;
      goto LABEL_11;
    }

    unsigned __int8 v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%@-SMTs", v18));
    id v25 = (void *)objc_claimAutoreleasedReturnValue(-[KTVerifyPendingSignaturesOperation failedSigs](self, "failedSigs"));
    [v25 setObject:v19 forKeyedSubscript:v24];

    goto LABEL_9;
  }

  if (!a4)
  {
LABEL_9:
    BOOL v21 = 0;
    goto LABEL_11;
  }

  BOOL v21 = 0;
  *a4 = v20;
LABEL_11:

  _Block_object_dispose(&v34, 8);
  return v21;
}

- (BOOL)verifyHeadsWithPendingSignatures:(id)a3 error:(id *)a4
{
  id v5 = a3;
  uint64_t v47 = 0LL;
  v48 = &v47;
  uint64_t v49 = 0x3032000000LL;
  v50 = sub_10000D7A4;
  v51 = sub_10000D7B4;
  id v52 = 0LL;
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[KTVerifyPendingSignaturesOperation deps](self, "deps"));
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 publicKeyStore]);
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 applicationPublicKeyStore:v5]);

  if ([v5 isEqual:kKTApplicationIdentifierTLT])
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[KTVerifyPendingSignaturesOperation deps](self, "deps"));
    unsigned __int8 v10 = (void *)objc_claimAutoreleasedReturnValue([v9 publicKeyStore]);
    uint64_t v11 = objc_claimAutoreleasedReturnValue([v10 tltKeyStore]);

    id v8 = (void *)v11;
  }

  v12 = objc_alloc(&OBJC_CLASS___KTContextVerifier);
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[KTVerifyPendingSignaturesOperation deps](self, "deps"));
  objc_super v14 = (void *)objc_claimAutoreleasedReturnValue([v13 dataStore]);
  uint64_t v15 = -[KTContextVerifier initWithApplicationKeyStore:dataStore:applicationID:]( v12,  "initWithApplicationKeyStore:dataStore:applicationID:",  v8,  v14,  v5);

  unsigned __int8 v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  id v17 = (void *)objc_claimAutoreleasedReturnValue(-[KTVerifyPendingSignaturesOperation deps](self, "deps"));
  id v18 = (void *)objc_claimAutoreleasedReturnValue([v17 dataStore]);
  id v46 = 0LL;
  v40[0] = _NSConcreteStackBlock;
  v40[1] = 3221225472LL;
  v40[2] = sub_10000DFE0;
  v40[3] = &unk_100276FC0;
  id v45 = &v47;
  id v19 = v15;
  v41 = v19;
  id v20 = v5;
  id v42 = v20;
  id v21 = v16;
  id v43 = v21;
  v44 = self;
  [v18 performForSTHsWithUnverifiedSignature:v20 error:&v46 block:v40];
  id v22 = v46;

  v23 = (id *)(v48 + 5);
  id obj = (id)v48[5];
  unsigned __int8 v24 = (void *)objc_claimAutoreleasedReturnValue(-[KTContextVerifier failExpiredSTHsForType:error:](v19, "failExpiredSTHsForType:error:", 0LL, &obj));
  objc_storeStrong(v23, obj);
  if (!v24 || ![v24 count])
  {
    if (v22)
    {
      if (a4)
      {
        BOOL v31 = 0;
        *a4 = v22;
        goto LABEL_19;
      }
    }

    else
    {
      id v32 = v48;
      if (a4)
      {
        id v33 = (void *)v48[5];
        if (v33)
        {
          *a4 = v33;
          id v32 = v48;
        }
      }

      if (!v32[5])
      {
        BOOL v31 = 1;
        goto LABEL_19;
      }

      uint64_t v34 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%@-STHs", v20));
      id v35 = (void *)objc_claimAutoreleasedReturnValue(-[KTVerifyPendingSignaturesOperation failedSigs](self, "failedSigs"));
      [v35 setObject:v21 forKeyedSubscript:v34];
    }

    BOOL v31 = 0;
    goto LABEL_19;
  }

  v37 = v8;
  id v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%@-STHs", v20));
  v26 = (void *)objc_claimAutoreleasedReturnValue(-[KTVerifyPendingSignaturesOperation deps](self, "deps"));
  uint64_t v27 = (void *)objc_claimAutoreleasedReturnValue([v26 dataStore]);
  unsigned __int8 v28 = (void *)objc_claimAutoreleasedReturnValue([v27 failedHeadSignaturesWithRevisions:v24 application:v20]);
  id v29 = (void *)objc_claimAutoreleasedReturnValue(-[KTVerifyPendingSignaturesOperation failedSigs](self, "failedSigs"));
  [v29 setObject:v28 forKeyedSubscript:v25];

  if (a4)
  {
    id v30 = (void *)v48[5];
    if (v30) {
      *a4 = v30;
    }
  }

  BOOL v31 = 0;
  id v8 = v37;
LABEL_19:

  _Block_object_dispose(&v47, 8);
  return v31;
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

- (NSMutableDictionary)failedSigs
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 152LL, 1);
}

- (void)setFailedSigs:(id)a3
{
}

- (void).cxx_destruct
{
}

@end