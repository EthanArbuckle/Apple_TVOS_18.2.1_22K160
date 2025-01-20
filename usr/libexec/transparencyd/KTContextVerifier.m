@interface KTContextVerifier
+ (BOOL)verifyLoggableDataSignatures:(id)a3 accountKey:(id)a4 error:(id *)a5;
+ (BOOL)verifyServerLoggableDatas:(id)a3 againstSyncedLoggableDatas:(id)a4 cloudDevices:(id)a5 error:(id *)a6;
+ (int64_t)verifyDeviceMutation:(id)a3 mapLeaf:(id)a4;
+ (int64_t)verifyOptInOutMutationMerged:(id)a3 mapLeaf:(id)a4 pendingAccountAdds:(id)a5;
+ (int64_t)verifyOptInOutWithExtMerged:(id)a3 accountKeyHash:(id)a4 mapLeaf:(id)a5 pendingAccountAdds:(id)a6;
- (BOOL)areSMTsOverMMD:(id)a3;
- (BOOL)failSMTsIfOverMMD:(id)a3 proof:(id)a4 underlyingError:(id)a5 errorCode:(int64_t)a6 analyticsData:(id)a7;
- (BOOL)failSMTsIfOverMMD:(id)a3 proof:(id)a4 underlyingError:(id)a5 errorCode:(int64_t)a6 savePendingError:(BOOL)a7 analyticsData:(id)a8;
- (BOOL)failSMTsIfOverMMD:(id)a3 skipOptInOut:(BOOL)a4 proof:(id)a5 underlyingError:(id)a6 errorCode:(int64_t)a7 analyticsData:(id)a8;
- (BOOL)setInclusionVerifiedState:(unint64_t)a3 logEntry:(id)a4 failure:(id)a5 error:(id *)a6;
- (BOOL)setInclusionVerifiedState:(unint64_t)a3 perApplicationTreeLogEntry:(id)a4 failure:(id)a5 error:(id *)a6;
- (BOOL)setInclusionVerifiedState:(unint64_t)a3 topLevelTreeLogEntry:(id)a4 failure:(id)a5 error:(id *)a6;
- (BOOL)verifyKTSMTsMerged:(id)a3 mapLeaf:(id)a4 analyticsData:(id)a5;
- (BOOL)verifyKTSMTsMerged:(id)a3 queryResponse:(id)a4 uri:(id)a5;
- (BOOL)verifyRevisionLogInclusionProofResponse:(id)a3 receivedRevisions:(id)a4 error:(id *)a5;
- (KTApplicationPublicKeyStore)applicationKeyStore;
- (KTContext)context;
- (KTContextVerifier)initWithApplicationKeyStore:(id)a3 dataStore:(id)a4 applicationID:(id)a5;
- (KTContextVerifier)initWithApplicationKeyStore:(id)a3 dataStore:(id)a4 applicationID:(id)a5 context:(id)a6;
- (KTLogClient)logClient;
- (NSString)applicationID;
- (TransparencyManagedDataStore)dataStore;
- (id)createChainOfErrorsFromSMTFailures:(id)a3;
- (id)createChainOfErrorsFromSTHFailures:(id)a3 type:(unint64_t)a4;
- (id)createErrorFromSMTFailure:(id)a3 underlyingError:(id)a4;
- (id)createErrorFromSTHFailure:(id)a3 underlyingError:(id)a4;
- (id)createTransparentDataFromQueryInfo:(id)a3 error:(id *)a4;
- (id)failExpiredSTHsForType:(unint64_t)a3 error:(id *)a4;
- (id)verifyKTSMTSignatures:(id)a3 error:(id *)a4;
- (id)verifySTHs:(id)a3 error:(id *)a4;
- (unint64_t)checkBatchQueryResponseFreshness:(id)a3 receiptDate:(id)a4 error:(id *)a5;
- (unint64_t)checkQueryInfoFreshness:(id)a3 receiptDate:(id)a4 error:(id *)a5;
- (unint64_t)checkQueryResponseFreshness:(id)a3 receiptDate:(id)a4 error:(id *)a5;
- (unint64_t)checkResponseFreshness:(id)a3 smh:(id)a4 receiptDate:(id)a5 error:(id *)a6;
- (unint64_t)checkServerStatus:(int)a3 error:(id *)a4;
- (unint64_t)checkServerStatus:(int)a3 isInsert:(BOOL)a4 error:(id *)a5;
- (unint64_t)handleBatchQueryResponse:(id)a3 queryRequest:(id)a4 receiptDate:(id)a5 fetchId:(id)a6 error:(id *)a7 queryInfoHandler:(id)a8;
- (unint64_t)handleBatchQueryResponse:(id)a3 queryRequest:(id)a4 receiptDate:(id)a5 fetchId:(id)a6 error:(id *)a7 transparentDataHandler:(id)a8;
- (unint64_t)handleInsertResponse:(id)a3 uri:(id)a4 fetchId:(id)a5 error:(id *)a6 transparentDataHandler:(id)a7;
- (unint64_t)handleQueryResponse:(id)a3 queryRequest:(id)a4 receiptDate:(id)a5 fetchId:(id)a6 error:(id *)a7 rawDataHandler:(id)a8;
- (unint64_t)handleQueryResponse:(id)a3 queryRequest:(id)a4 receiptDate:(id)a5 fetchId:(id)a6 error:(id *)a7 transparentDataHandler:(id)a8;
- (unint64_t)verifyAccountKeyWitness:(id)a3 accountKey:(id)a4 error:(id *)a5;
- (unint64_t)verifyConsistencyProofResponse:(id)a3 startRevision:(int64_t)a4 receivedRevisions:(id)a5 error:(id *)a6;
- (unint64_t)verifyInclusionProof:(id)a3 mapLeaf:(id *)a4 error:(id *)a5;
- (unint64_t)verifyLogConsistencyResponse:(id)a3 startRevision:(int64_t)a4 receivedRevisions:(id)a5 forwards:(BOOL)a6 serverHint:(id)a7 error:(id *)a8;
- (unint64_t)verifyRevisionLogProofLogEntry:(id)a3 patSTH:(id *)a4 error:(id *)a5;
- (unint64_t)verifyRevisionLogTopLevelProof:(id)a3 patSTH:(id)a4 error:(id *)a5;
- (unint64_t)verifySMTTimestamps:(id)a3 receiptDate:(id)a4 error:(id *)a5;
- (unint64_t)verifySMTs:(id)a3 uri:(id)a4 serverHint:(id)a5 error:(id *)a6;
- (unint64_t)verifyUriWitness:(id)a3 uri:(id)a4 error:(id *)a5;
- (void)checkBatchQueryResponseEpochs:(id)a3;
- (void)checkHeadEpoch:(id)a3;
- (void)checkQueryResponseEpochs:(id)a3;
- (void)deleteSMT:(id)a3 error:(id)a4;
- (void)processSTHsFromGossipPeers:(id)a3 verifier:(id)a4 error:(id *)a5;
- (void)reportVerifySMTFailure:(id)a3 analyticsData:(id)a4 error:(id)a5;
- (void)reportVerifySMTFailure:(id)a3 analyticsData:(id)a4 uri:(id)a5 receiptServerHint:(id)a6 error:(id)a7;
- (void)setApplicationID:(id)a3;
- (void)setApplicationKeyStore:(id)a3;
- (void)setContext:(id)a3;
- (void)setDataStore:(id)a3;
- (void)setLogClient:(id)a3;
@end

@implementation KTContextVerifier

- (unint64_t)checkBatchQueryResponseFreshness:(id)a3 receiptDate:(id)a4 error:(id *)a5
{
  id v8 = a4;
  v9 = (void *)objc_claimAutoreleasedReturnValue([a3 smh]);
  unint64_t v10 = -[KTContextVerifier checkResponseFreshness:smh:receiptDate:error:]( self,  "checkResponseFreshness:smh:receiptDate:error:",  0LL,  v9,  v8,  a5);

  return v10;
}

- (unint64_t)checkQueryInfoFreshness:(id)a3 receiptDate:(id)a4 error:(id *)a5
{
  id v8 = a4;
  v9 = (void *)objc_claimAutoreleasedReturnValue([a3 pendingSmtsArray]);
  unint64_t v10 = -[KTContextVerifier checkResponseFreshness:smh:receiptDate:error:]( self,  "checkResponseFreshness:smh:receiptDate:error:",  v9,  0LL,  v8,  a5);

  return v10;
}

- (void)checkBatchQueryResponseEpochs:(id)a3
{
  id v18 = a3;
  unsigned int v4 = [v18 hasPerApplicationTreeEntry];
  v5 = v18;
  if (v4)
  {
    uint64_t v6 = objc_claimAutoreleasedReturnValue([v18 perApplicationTreeEntry]);
    v5 = v18;
    if (v6)
    {
      v7 = (void *)v6;
      id v8 = (void *)objc_claimAutoreleasedReturnValue([v18 perApplicationTreeEntry]);
      if (![v8 hasSlh])
      {
LABEL_6:

        v5 = v18;
        goto LABEL_7;
      }

      v9 = (void *)objc_claimAutoreleasedReturnValue([v18 perApplicationTreeEntry]);
      unint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([v9 slh]);

      v5 = v18;
      if (v10)
      {
        v7 = (void *)objc_claimAutoreleasedReturnValue([v18 perApplicationTreeEntry]);
        id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 slh]);
        -[KTContextVerifier checkHeadEpoch:](self, "checkHeadEpoch:", v8);
        goto LABEL_6;
      }
    }
  }

- (unint64_t)handleBatchQueryResponse:(id)a3 queryRequest:(id)a4 receiptDate:(id)a5 fetchId:(id)a6 error:(id *)a7 queryInfoHandler:(id)a8
{
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  id v18 = (void (**)(id, void *, void, id))a8;
  unint64_t v19 = -[KTContextVerifier checkServerStatus:error:](self, "checkServerStatus:error:", [v14 status], a7);
  if (v19 != 1)
  {
    unint64_t v26 = v19;
    if (qword_1002EE820 != -1) {
      dispatch_once(&qword_1002EE820, &stru_100283718);
    }
    v27 = (void *)qword_1002EE828;
    if (os_log_type_enabled((os_log_t)qword_1002EE828, OS_LOG_TYPE_ERROR))
    {
      v28 = v27;
      *(_DWORD *)buf = 138543618;
      uint64_t v89 = (uint64_t)v17;
      __int16 v90 = 1024;
      LODWORD(v91) = [v14 status];
      _os_log_impl( (void *)&_mh_execute_header,  v28,  OS_LOG_TYPE_ERROR,  "BatchQueryResponse for fetchId %{public}@ server error: %d",  buf,  0x12u);
    }

    goto LABEL_25;
  }

  -[KTContextVerifier checkBatchQueryResponseEpochs:](self, "checkBatchQueryResponseEpochs:", v14);
  v20 = (void *)objc_claimAutoreleasedReturnValue(-[KTContextVerifier context](self, "context"));
  unsigned __int8 v21 = [v20 ready:a7];

  if ((v21 & 1) != 0)
  {
    unint64_t v22 = -[KTContextVerifier checkBatchQueryResponseFreshness:receiptDate:error:]( self,  "checkBatchQueryResponseFreshness:receiptDate:error:",  v14,  v16,  a7);
    if (v22 == 1)
    {
      id v23 = objc_msgSend(v14, "queryInfoArray_Count");
      if (v23 > objc_msgSend(v15, "uriArray_Count"))
      {
        id v24 = (id)objc_claimAutoreleasedReturnValue( +[TransparencyError errorWithDomain:code:description:]( &OBJC_CLASS___TransparencyError,  "errorWithDomain:code:description:",  @"TransparencyErrorVerify",  -326LL,  @"More query infos in response than in request for fetchId %@, aborting validation and deleting record",  v17));
        if (qword_1002EE820 != -1) {
          dispatch_once(&qword_1002EE820, &stru_100283778);
        }
        v25 = (os_log_s *)qword_1002EE828;
        if (os_log_type_enabled((os_log_t)qword_1002EE828, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138543362;
          uint64_t v89 = (uint64_t)v17;
          _os_log_impl( (void *)&_mh_execute_header,  v25,  OS_LOG_TYPE_ERROR,  "More query infos in response than in request for fetchId %{public}@, aborting validation and deleting record",  buf,  0xCu);
        }

        unint64_t v26 = 0LL;
        if (a7 && v24)
        {
          id v24 = v24;
          unint64_t v26 = 0LL;
          *a7 = v24;
        }

        goto LABEL_26;
      }

      v32 = objc_alloc(&OBJC_CLASS___TransparencyMapInclusionProofVerifier);
      v33 = (void *)objc_claimAutoreleasedReturnValue(-[KTContextVerifier applicationKeyStore](self, "applicationKeyStore"));
      v34 = (void *)objc_claimAutoreleasedReturnValue(-[KTContextVerifier applicationID](self, "applicationID"));
      v35 = -[TransparencyMapInclusionProofVerifier initWithKeyStore:application:]( v32,  "initWithKeyStore:application:",  v33,  v34);

      v75 = v35;
      [v14 setVerifier:v35];
      v36 = (void *)objc_claimAutoreleasedReturnValue(-[KTContextVerifier dataStore](self, "dataStore"));
      [v14 setDataStore:v36];

      v37 = (void *)objc_claimAutoreleasedReturnValue(-[KTContextVerifier context](self, "context"));
      v38 = (void *)objc_claimAutoreleasedReturnValue([v37 optInServer]);
      [v14 setOptInServer:v38];

      id v87 = 0LL;
      unint64_t v26 = (unint64_t)[v14 verifyWithError:&v87];
      id v77 = v87;
      id v78 = v17;
      id v81 = v16;
      if (v26 == 1)
      {
        if (objc_msgSend(v14, "queryInfoArray_Count"))
        {
          uint64_t v39 = 0LL;
          uint64_t v74 = kTransparencyResponseMetadataKeyServerHint;
          v73 = v18;
          id v79 = v15;
          while (1)
          {
            v40 = (void *)objc_claimAutoreleasedReturnValue([v14 queryInfoArray]);
            v41 = (void *)objc_claimAutoreleasedReturnValue([v40 objectAtIndexedSubscript:v39]);

            v42 = (void *)objc_claimAutoreleasedReturnValue([v15 uriArray]);
            v43 = (void *)objc_claimAutoreleasedReturnValue([v42 objectAtIndexedSubscript:v39]);

            id v44 = [v41 status];
            id v86 = 0LL;
            unint64_t v45 = -[KTContextVerifier checkServerStatus:error:](self, "checkServerStatus:error:", v44, &v86);
            id v46 = v86;
            v47 = v46;
            if (v45 == 1) {
              break;
            }
            v18[2](v18, v43, 0LL, v46);
            id v49 = v47;
LABEL_65:
          }

          id v85 = v46;
          unint64_t v48 = -[KTContextVerifier checkQueryInfoFreshness:receiptDate:error:]( self,  "checkQueryInfoFreshness:receiptDate:error:",  v41,  v81,  &v85);
          id v49 = v85;

          if (v48 != 1)
          {
            if (qword_1002EE820 != -1) {
              dispatch_once(&qword_1002EE820, &stru_1002837B8);
            }
            id v15 = v79;
            v56 = (os_log_s *)qword_1002EE828;
            if (os_log_type_enabled((os_log_t)qword_1002EE828, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 141558274;
              uint64_t v89 = 1752392040LL;
              __int16 v90 = 2112;
              id v91 = v43;
              _os_log_impl( (void *)&_mh_execute_header,  v56,  OS_LOG_TYPE_ERROR,  "QueryInfo for %{mask.hash}@ is outside MMD",  buf,  0x16u);
            }

            v18[2](v18, v43, 0LL, v49);
            goto LABEL_65;
          }

          v50 = (void *)objc_claimAutoreleasedReturnValue([v41 uriWitness]);
          id v84 = v49;
          unint64_t v51 = -[KTContextVerifier verifyUriWitness:uri:error:](self, "verifyUriWitness:uri:error:", v50, v43, &v84);
          id v80 = v84;

          if (v51 != 1)
          {
            if (qword_1002EE820 != -1) {
              dispatch_once(&qword_1002EE820, &stru_1002837D8);
            }
            id v15 = v79;
            v57 = (os_log_s *)qword_1002EE828;
            if (os_log_type_enabled((os_log_t)qword_1002EE828, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 141558530;
              uint64_t v89 = 1752392040LL;
              __int16 v90 = 2112;
              id v91 = v43;
              __int16 v92 = 2114;
              id v93 = v78;
              _os_log_impl( (void *)&_mh_execute_header,  v57,  OS_LOG_TYPE_ERROR,  "URIWitness verification failed for %{mask.hash}@ fetchId %{public}@",  buf,  0x20u);
            }

            id v49 = v80;
            v18[2](v18, v43, 0LL, v80);
            goto LABEL_65;
          }

          v52 = (void *)objc_claimAutoreleasedReturnValue([v14 metadata]);
          uint64_t v53 = objc_claimAutoreleasedReturnValue([v52 objectForKeyedSubscript:v74]);

          v76 = (void *)v53;
          if (objc_msgSend(v41, "pendingSmtsArray_Count"))
          {
            v54 = (void *)objc_claimAutoreleasedReturnValue([v41 pendingSmtsArray]);
            id v83 = v80;
            unint64_t v55 = -[KTContextVerifier verifySMTs:uri:serverHint:error:]( self,  "verifySMTs:uri:serverHint:error:",  v54,  v43,  v53,  &v83);
            id v49 = v83;

            if (v55 != 1)
            {
              id v15 = v79;
              id v18 = v73;
              if (qword_1002EE820 != -1) {
                dispatch_once(&qword_1002EE820, &stru_1002837F8);
              }
              v66 = (os_log_s *)qword_1002EE828;
              if (os_log_type_enabled((os_log_t)qword_1002EE828, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 141558530;
                uint64_t v89 = 1752392040LL;
                __int16 v90 = 2112;
                id v91 = v43;
                __int16 v92 = 2114;
                id v93 = v78;
                _os_log_impl( (void *)&_mh_execute_header,  v66,  OS_LOG_TYPE_ERROR,  "Pending SMT verification failed for %{mask.hash}@ fetchId %{public}@",  buf,  0x20u);
              }

              v73[2](v73, v43, 0LL, v49);
              goto LABEL_63;
            }

            id v80 = v49;
            id v15 = v79;
            id v18 = v73;
          }

          else
          {
            id v15 = v79;
          }

          if (![v41 hasMapEntry])
          {
            id v49 = v80;
            v64 = v76;
            goto LABEL_52;
          }

          v58 = (void *)objc_claimAutoreleasedReturnValue([v41 mapEntry]);
          v71 = objc_alloc(&OBJC_CLASS___TransparencyMapEntryVerifier);
          v69 = (void *)objc_claimAutoreleasedReturnValue([v58 index]);
          v59 = (void *)objc_claimAutoreleasedReturnValue(-[KTContextVerifier applicationKeyStore](self, "applicationKeyStore"));
          v60 = (void *)objc_claimAutoreleasedReturnValue([v59 appSthKeyStore]);
          v61 = -[TransparencyMapEntryVerifier initWithPositon:trustedKeyStore:]( v71,  "initWithPositon:trustedKeyStore:",  v69,  v60);

          v70 = v61;
          [v58 setVerifier:v61];
          v62 = (void *)objc_claimAutoreleasedReturnValue(-[KTContextVerifier dataStore](self, "dataStore"));
          [v58 setDataStore:v62];

          v63 = (void *)objc_claimAutoreleasedReturnValue([v14 verifiableSmh]);
          [v58 setSmh:v63];

          v64 = v76;
          [v58 setMetadataValue:v76 key:v74];
          id v82 = v80;
          v72 = v58;
          id v65 = [v58 verifyWithError:&v82];
          id v49 = v82;

          if (v65 == (id)1)
          {

            id v15 = v79;
            id v18 = v73;
LABEL_52:
            ((void (**)(id, void *, void *, id))v18)[2](v18, v43, v41, 0LL);
LABEL_64:

            goto LABEL_65;
          }

          id v18 = v73;
          if (qword_1002EE820 != -1) {
            dispatch_once(&qword_1002EE820, &stru_100283818);
          }
          id v15 = v79;
          v67 = (os_log_s *)qword_1002EE828;
          if (os_log_type_enabled((os_log_t)qword_1002EE828, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 141558530;
            uint64_t v89 = 1752392040LL;
            __int16 v90 = 2112;
            id v91 = v43;
            __int16 v92 = 2114;
            id v93 = v78;
            _os_log_impl( (void *)&_mh_execute_header,  v67,  OS_LOG_TYPE_ERROR,  "MapEntry verification failed for %{mask.hash}@ fetchId %{public}@",  buf,  0x20u);
          }

          v73[2](v73, v43, 0LL, v49);

LABEL_63:
          v64 = v76;
          goto LABEL_64;
        }
      }

      else
      {
        if (qword_1002EE820 != -1) {
          dispatch_once(&qword_1002EE820, &stru_100283798);
        }
        v68 = (os_log_s *)qword_1002EE828;
        if (os_log_type_enabled((os_log_t)qword_1002EE828, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138543618;
          uint64_t v89 = (uint64_t)v17;
          __int16 v90 = 2112;
          id v91 = v77;
          _os_log_impl( (void *)&_mh_execute_header,  v68,  OS_LOG_TYPE_ERROR,  "Proof validation failed for fetchId %{public}@: %@",  buf,  0x16u);
        }

        if (a7 && v77) {
          *a7 = v77;
        }
      }

- (id)createTransparentDataFromQueryInfo:(id)a3 error:(id *)a4
{
  id v6 = a3;
  if (![v6 hasMapEntry]
    || (v7 = (void *)objc_claimAutoreleasedReturnValue([v6 mapEntry]),
        id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 mapLeaf]),
        id v9 = [v8 length],
        v8,
        v7,
        !v9))
  {
    v12 = 0LL;
    goto LABEL_6;
  }

  unint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([v6 mapEntry]);
  unsigned int v11 = (void *)objc_claimAutoreleasedReturnValue([v10 mapLeaf]);
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[IdsMapLeaf parseFromData:error:](&OBJC_CLASS___IdsMapLeaf, "parseFromData:error:", v11, a4));

  if (v12)
  {
LABEL_6:
    id v14 = objc_alloc(&OBJC_CLASS___KTTransparentData);
    id v15 = (void *)objc_claimAutoreleasedReturnValue([v6 uriWitness]);
    id v16 = (void *)objc_claimAutoreleasedReturnValue([v15 output]);
    id v17 = (void *)objc_claimAutoreleasedReturnValue([v6 pendingSmtsArray]);
    uint64_t v13 = -[KTTransparentData initWithUriVRFOutput:mapLeaf:pendingSMTs:error:]( v14,  "initWithUriVRFOutput:mapLeaf:pendingSMTs:error:",  v16,  v12,  v17,  a4);

    id v18 = (void *)objc_claimAutoreleasedReturnValue(-[KTContextVerifier applicationKeyStore](self, "applicationKeyStore"));
    unint64_t v19 = (void *)objc_claimAutoreleasedReturnValue( +[NSDate dateWithTimeIntervalSince1970:]( NSDate,  "dateWithTimeIntervalSince1970:",  (double)(unint64_t)[v18 patLogBeginningMs] / 1000.0));
    -[KTTransparentData setCurrentTreeEpochBeginDate:](v13, "setCurrentTreeEpochBeginDate:", v19);

    goto LABEL_7;
  }

  uint64_t v13 = 0LL;
LABEL_7:

  return v13;
}

- (unint64_t)handleBatchQueryResponse:(id)a3 queryRequest:(id)a4 receiptDate:(id)a5 fetchId:(id)a6 error:(id *)a7 transparentDataHandler:(id)a8
{
  id v14 = a5;
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472LL;
  v20[2] = sub_10013D5A8;
  v20[3] = &unk_100283880;
  v20[4] = self;
  id v21 = a6;
  id v22 = v14;
  id v23 = a8;
  id v15 = v14;
  id v16 = v23;
  id v17 = v21;
  unint64_t v18 = -[KTContextVerifier handleBatchQueryResponse:queryRequest:receiptDate:fetchId:error:queryInfoHandler:]( self,  "handleBatchQueryResponse:queryRequest:receiptDate:fetchId:error:queryInfoHandler:",  a3,  a4,  v15,  v17,  a7,  v20);

  return v18;
}

- (unint64_t)verifySMTTimestamps:(id)a3 receiptDate:(id)a4 error:(id *)a5
{
  id v7 = a3;
  id v8 = a4;
  __int128 v24 = 0u;
  __int128 v25 = 0u;
  __int128 v26 = 0u;
  __int128 v27 = 0u;
  id v9 = v7;
  id v10 = [v9 countByEnumeratingWithState:&v24 objects:v28 count:16];
  if (v10)
  {
    id v11 = v10;
    uint64_t v12 = *(void *)v25;
    uint64_t v13 = kKTMaximumMergeDelayMs;
    while (2)
    {
      for (i = 0LL; i != v11; i = (char *)i + 1)
      {
        if (*(void *)v25 != v12) {
          objc_enumerationMutation(v9);
        }
        id v15 = (void *)objc_claimAutoreleasedReturnValue( +[SignedMutationTimestamp signedTypeWithObject:]( &OBJC_CLASS___SignedMutationTimestamp,  "signedTypeWithObject:",  *(void *)(*((void *)&v24 + 1) + 8LL * (void)i),  (void)v24));
        id v16 = (void *)objc_claimAutoreleasedReturnValue([v15 parsedMutationWithError:a5]);
        id v17 = v16;
        if (!v16) {
          goto LABEL_16;
        }
        double v18 = (double)((unint64_t)[v16 mutationMs] + v13);
        [v8 timeIntervalSince1970];
        if (v19 * 1000.0 > v18)
        {
          id v21 = (void *)objc_claimAutoreleasedReturnValue( +[TransparencyError errorWithDomain:code:description:]( &OBJC_CLASS___TransparencyError,  "errorWithDomain:code:description:",  @"TransparencyErrorVerify",  -307LL,  @"SMT timestamp more than MMD ago"));
          id v22 = v21;
          if (a5 && v21) {
            *a5 = v21;
          }

LABEL_16:
          unint64_t v20 = 0LL;
          goto LABEL_17;
        }
      }

      id v11 = [v9 countByEnumeratingWithState:&v24 objects:v28 count:16];
      unint64_t v20 = 1LL;
      if (v11) {
        continue;
      }
      break;
    }
  }

  else
  {
    unint64_t v20 = 1LL;
  }

- (unint64_t)verifySMTs:(id)a3 uri:(id)a4 serverHint:(id)a5 error:(id *)a6
{
  id v10 = a3;
  id v28 = a4;
  id v29 = a5;
  __int128 v42 = 0u;
  __int128 v43 = 0u;
  __int128 v44 = 0u;
  __int128 v45 = 0u;
  id obj = v10;
  id v11 = [obj countByEnumeratingWithState:&v42 objects:v46 count:16];
  if (v11)
  {
    uint64_t v27 = *(void *)v43;
    unint64_t v25 = 1LL;
    while (2)
    {
      for (i = 0LL; i != v11; i = (char *)i + 1)
      {
        if (*(void *)v43 != v27) {
          objc_enumerationMutation(obj);
        }
        uint64_t v13 = *(void *)(*((void *)&v42 + 1) + 8LL * (void)i);
        id v14 = (void *)objc_claimAutoreleasedReturnValue(-[KTContextVerifier applicationKeyStore](self, "applicationKeyStore", v25));
        id v15 = (void *)objc_claimAutoreleasedReturnValue([v14 appSmtKeyStore]);
        id v16 = (void *)objc_claimAutoreleasedReturnValue([v15 signatureVerifier]);
        id v17 = (void *)objc_claimAutoreleasedReturnValue(-[KTContextVerifier dataStore](self, "dataStore"));
        double v18 = (void *)objc_claimAutoreleasedReturnValue( +[SignedMutationTimestamp signedTypeWithObject:verifier:dataStore:]( &OBJC_CLASS___SignedMutationTimestamp,  "signedTypeWithObject:verifier:dataStore:",  v13,  v16,  v17));

        double v19 = (void *)objc_claimAutoreleasedReturnValue(-[KTContextVerifier applicationID](self, "applicationID"));
        [v18 setApplication:v19];

        id v20 = [v18 verifyWithError:a6];
        if (v20 != (id)1)
        {

          unint64_t v25 = (unint64_t)v20;
          goto LABEL_15;
        }

        uint64_t v36 = 0LL;
        v37 = &v36;
        uint64_t v38 = 0x3032000000LL;
        uint64_t v39 = sub_100186D74;
        v40 = sub_100186D84;
        id v41 = 0LL;
        id v21 = (void *)objc_claimAutoreleasedReturnValue(-[KTContextVerifier dataStore](self, "dataStore"));
        v30[0] = _NSConcreteStackBlock;
        v30[1] = 3221225472LL;
        v30[2] = sub_100186D8C;
        v30[3] = &unk_1002867C0;
        id v22 = v18;
        id v31 = v22;
        v32 = self;
        id v33 = v28;
        id v34 = v29;
        v35 = &v36;
        [v21 performBlockAndWait:v30];

        if (a6)
        {
          id v23 = (void *)v37[5];
          if (v23) {
            *a6 = v23;
          }
        }

        _Block_object_dispose(&v36, 8);
      }

      id v11 = [obj countByEnumeratingWithState:&v42 objects:v46 count:16];
      if (v11) {
        continue;
      }
      break;
    }
  }

  else
  {
    unint64_t v25 = 1LL;
  }

- (void)reportVerifySMTFailure:(id)a3 analyticsData:(id)a4 uri:(id)a5 receiptServerHint:(id)a6 error:(id)a7
{
  id v32 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  id v15 = a7;
  id v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  unsigned int v17 = +[TransparencyAnalytics hasInternalDiagnostics]( &OBJC_CLASS___TransparencyAnalytics,  "hasInternalDiagnostics");
  unsigned int v18 = v17;
  if (v12 && v17) {
    [v16 addEntriesFromDictionary:v12];
  }
  if (v18)
  {
    double v19 = (void *)objc_claimAutoreleasedReturnValue( +[SignedObjectHolder parseFromData:error:]( &OBJC_CLASS___SignedMutationTimestamp,  "parseFromData:error:",  v32,  0LL));
    id v20 = v19;
    if (v19)
    {
      id v31 = self;
      id v21 = (void *)objc_claimAutoreleasedReturnValue([v19 signature]);
      id v22 = (void *)objc_claimAutoreleasedReturnValue([v21 signature]);
      id v23 = (void *)objc_claimAutoreleasedReturnValue([v22 base64EncodedStringWithOptions:0]);
      [v16 setObject:v23 forKeyedSubscript:@"sig"];

      __int128 v24 = (void *)objc_claimAutoreleasedReturnValue([v20 parsedMutationWithError:0]);
      unint64_t v25 = v24;
      if (v24)
      {
        __int128 v26 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedLongLong:]( NSNumber,  "numberWithUnsignedLongLong:",  [v24 mutationMs]));
        [v16 setObject:v26 forKeyedSubscript:@"ms"];
      }

      self = v31;
    }

    if (v13) {
      [v16 setObject:v13 forKeyedSubscript:@"uri"];
    }
    if (v14) {
      [v16 setObject:v14 forKeyedSubscript:@"rSH"];
    }
  }

  uint64_t v27 = (void *)objc_claimAutoreleasedReturnValue(+[TransparencyAnalytics logger](&OBJC_CLASS___TransparencyAnalytics, "logger"));
  id v28 = (void *)objc_claimAutoreleasedReturnValue(-[KTContextVerifier applicationID](self, "applicationID"));
  id v29 = (void *)objc_claimAutoreleasedReturnValue( +[TransparencyAnalytics formatEventName:application:]( &OBJC_CLASS___TransparencyAnalytics,  "formatEventName:application:",  @"VerifySmtInclusionEvent",  v28));
  if ([v16 count]) {
    v30 = v16;
  }
  else {
    v30 = 0LL;
  }
  [v27 logResultForEvent:v29 hardFailure:1 result:v15 withAttributes:v30];
}

- (void)reportVerifySMTFailure:(id)a3 analyticsData:(id)a4 error:(id)a5
{
}

- (BOOL)areSMTsOverMMD:(id)a3
{
  __int128 v11 = 0u;
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  id v3 = a3;
  id v4 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v4)
  {
    uint64_t v5 = *(void *)v12;
    uint64_t v6 = kKTMaximumMergeDelayMs;
    while (2)
    {
      for (i = 0LL; i != v4; i = (char *)i + 1)
      {
        if (*(void *)v12 != v5) {
          objc_enumerationMutation(v3);
        }
        double v8 = (double)((unint64_t)objc_msgSend( *(id *)(*((void *)&v11 + 1) + 8 * (void)i),  "getUnsigned:",  "mutationMs",  (void)v11)
                    + v6);
        +[NSDate kt_currentTimeMs](&OBJC_CLASS___NSDate, "kt_currentTimeMs");
        if (v9 > v8)
        {
          LOBYTE(v4) = 1;
          goto LABEL_11;
        }
      }

      id v4 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
      if (v4) {
        continue;
      }
      break;
    }
  }

- (id)createErrorFromSMTFailure:(id)a3 underlyingError:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 errorDomain]);
  id v8 = [v6 errorCode];

  double v9 = (void *)objc_claimAutoreleasedReturnValue( +[TransparencyError errorWithDomain:code:underlyingError:description:]( &OBJC_CLASS___TransparencyError,  "errorWithDomain:code:underlyingError:description:",  v7,  v8,  v5,  0LL));
  return v9;
}

- (id)createChainOfErrorsFromSMTFailures:(id)a3
{
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  id v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "allObjects", 0));
  id v5 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v5)
  {
    id v6 = v5;
    id v7 = 0LL;
    uint64_t v8 = *(void *)v13;
    do
    {
      double v9 = 0LL;
      id v10 = v7;
      do
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(v4);
        }
        id v7 = (void *)objc_claimAutoreleasedReturnValue( -[KTContextVerifier createErrorFromSMTFailure:underlyingError:]( self,  "createErrorFromSMTFailure:underlyingError:",  *(void *)(*((void *)&v12 + 1) + 8LL * (void)v9),  v10));

        double v9 = (char *)v9 + 1;
        id v10 = v7;
      }

      while (v6 != v9);
      id v6 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }

    while (v6);
  }

  else
  {
    id v7 = 0LL;
  }

  return v7;
}

- (BOOL)failSMTsIfOverMMD:(id)a3 proof:(id)a4 underlyingError:(id)a5 errorCode:(int64_t)a6 savePendingError:(BOOL)a7 analyticsData:(id)a8
{
  BOOL v49 = a7;
  id v11 = a3;
  id v12 = a5;
  id v13 = a8;
  __int128 v58 = 0u;
  __int128 v59 = 0u;
  __int128 v60 = 0u;
  __int128 v61 = 0u;
  id obj = v11;
  id v14 = [v11 countByEnumeratingWithState:&v58 objects:v68 count:16];
  if (v14)
  {
    id v15 = v14;
    char v16 = 0;
    uint64_t v17 = *(void *)v59;
    uint64_t v54 = kKTMaximumMergeDelayMs;
    uint64_t v47 = kTransparencyResponseMetadataKeyServerHint;
    unsigned int v18 = self;
    uint64_t v51 = *(void *)v59;
    v52 = v13;
    int64_t v48 = a6;
    while (1)
    {
      double v19 = 0LL;
      id v50 = v15;
      do
      {
        if (*(void *)v59 != v17) {
          objc_enumerationMutation(obj);
        }
        id v20 = *(void **)(*((void *)&v58 + 1) + 8LL * (void)v19);
        if ([v20 mergeResult] == (id)2)
        {
          double v21 = (double)((unint64_t)[v20 getUnsigned:"mutationMs"] + v54);
          +[NSDate kt_currentTimeMs](&OBJC_CLASS___NSDate, "kt_currentTimeMs");
          if (v22 <= v21)
          {
            if (!v49) {
              goto LABEL_26;
            }
            v40 = (void *)objc_claimAutoreleasedReturnValue([v20 receiptServerHint]);
            v57 = (void *)objc_claimAutoreleasedReturnValue( +[TransparencyError errorWithDomain:code:underlyingError:description:]( &OBJC_CLASS___TransparencyError,  "errorWithDomain:code:underlyingError:description:",  @"TransparencyErrorVerify",  a6,  v12,  @"SMT verification failure before MMD for %@",  v40));

            if (qword_1002EEC30 != -1) {
              dispatch_once(&qword_1002EEC30, &stru_100286800);
            }
            id v41 = (void *)qword_1002EEC38;
            if (os_log_type_enabled((os_log_t)qword_1002EEC38, OS_LOG_TYPE_INFO))
            {
              __int128 v42 = v41;
              __int128 v43 = (void *)objc_claimAutoreleasedReturnValue([v20 receiptServerHint]);
              *(_DWORD *)buf = 138543874;
              v63 = v43;
              __int16 v64 = 2112;
              id v65 = v57;
              __int16 v66 = 2112;
              id v67 = v12;
              _os_log_impl( (void *)&_mh_execute_header,  v42,  OS_LOG_TYPE_INFO,  "SMT verification failure before MMD for %{public}@, error: %@, underlyingError: %@",  buf,  0x20u);
            }

            unsigned int v18 = self;
          }

          else
          {
            id v23 = (void *)objc_claimAutoreleasedReturnValue([v20 failures]);
            uint64_t v24 = objc_claimAutoreleasedReturnValue( -[KTContextVerifier createChainOfErrorsFromSMTFailures:]( v18,  "createChainOfErrorsFromSMTFailures:",  v23));

            uint64_t v53 = (void *)v24;
            unint64_t v25 = (void *)objc_claimAutoreleasedReturnValue( +[TransparencyError errorWithError:underlyingError:]( &OBJC_CLASS___TransparencyError,  "errorWithError:underlyingError:",  v12,  v24));
            __int128 v26 = (void *)objc_claimAutoreleasedReturnValue([v20 receiptServerHint]);
            v57 = (void *)objc_claimAutoreleasedReturnValue( +[TransparencyError errorWithDomain:code:underlyingError:description:]( &OBJC_CLASS___TransparencyError,  "errorWithDomain:code:underlyingError:description:",  @"TransparencyErrorVerify",  a6,  v25,  @"SMT verification failure after MMD for %@",  v26));

            if (qword_1002EEC30 != -1) {
              dispatch_once(&qword_1002EEC30, &stru_1002867E0);
            }
            id v13 = v52;
            uint64_t v27 = (void *)qword_1002EEC38;
            if (os_log_type_enabled((os_log_t)qword_1002EEC38, OS_LOG_TYPE_ERROR))
            {
              id v28 = v27;
              id v29 = (void *)objc_claimAutoreleasedReturnValue([v20 receiptServerHint]);
              *(_DWORD *)buf = 138543874;
              v63 = v29;
              __int16 v64 = 2112;
              id v65 = v57;
              __int16 v66 = 2112;
              id v67 = v12;
              _os_log_impl( (void *)&_mh_execute_header,  v28,  OS_LOG_TYPE_ERROR,  "SMT verification failure after MMD for %{public}@, error: %@, underlyingError: %@",  buf,  0x20u);
            }

            [v20 setMergeResult:0];
            if ([v20 signatureResult] == (id)2) {
              [v20 setSignatureResult:0];
            }
            v30 = (void *)objc_claimAutoreleasedReturnValue([v20 smt]);
            id v31 = (void *)objc_claimAutoreleasedReturnValue([v20 uri]);
            id v32 = (void *)objc_claimAutoreleasedReturnValue([v20 receiptServerHint]);
            -[KTContextVerifier reportVerifySMTFailure:analyticsData:uri:receiptServerHint:error:]( v18,  "reportVerifySMTFailure:analyticsData:uri:receiptServerHint:error:",  v30,  v52,  v31,  v32,  v57);

            id v33 = (void *)objc_claimAutoreleasedReturnValue([v52 objectForKeyedSubscript:@"opUUID"]);
            if (v33)
            {
              id v34 = -[NSUUID initWithUUIDString:](objc_alloc(&OBJC_CLASS___NSUUID), "initWithUUIDString:", v33);
              v35 = (void *)objc_claimAutoreleasedReturnValue([v52 objectForKeyedSubscript:v47]);
              uint64_t v36 = (void *)objc_claimAutoreleasedReturnValue(-[KTContextVerifier context](v18, "context"));
              id v37 = v12;
              uint64_t v38 = (void *)objc_claimAutoreleasedReturnValue([v36 stateMachine]);
              uint64_t v39 = (void *)objc_claimAutoreleasedReturnValue([v20 smt]);
              [v38 notifyBackgroundValidationFailure:v34 data:v39 type:@"SmtInclusion" serverHint:v35 failure:v57];

              id v12 = v37;
              unsigned int v18 = self;
              id v13 = v52;

              a6 = v48;
            }

            char v16 = 1;
            id v15 = v50;
          }

          if (v57)
          {
            __int128 v44 = (void *)objc_claimAutoreleasedReturnValue(-[KTContextVerifier dataStore](v18, "dataStore"));
            __int128 v45 = (void *)objc_claimAutoreleasedReturnValue([v44 createSignedMutationTimestampsFailure]);

            unsigned int v18 = self;
            [v45 setErrorCode:a6];
            [v45 setErrorDomain:@"TransparencyErrorVerify"];
            [v45 setMutation:v20];
          }

          uint64_t v17 = v51;
        }

- (BOOL)failSMTsIfOverMMD:(id)a3 proof:(id)a4 underlyingError:(id)a5 errorCode:(int64_t)a6 analyticsData:(id)a7
{
  return -[KTContextVerifier failSMTsIfOverMMD:proof:underlyingError:errorCode:savePendingError:analyticsData:]( self,  "failSMTsIfOverMMD:proof:underlyingError:errorCode:savePendingError:analyticsData:",  a3,  a4,  a5,  a6,  1LL,  a7);
}

- (void)deleteSMT:(id)a3 error:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(-[KTContextVerifier dataStore](self, "dataStore"));
  [v8 deleteObject:v7];

  id v9 = (id)objc_claimAutoreleasedReturnValue([v7 smt]);
  -[KTContextVerifier reportVerifySMTFailure:analyticsData:error:]( self,  "reportVerifySMTFailure:analyticsData:error:",  v9,  0LL,  v6);
}

- (id)verifyKTSMTSignatures:(id)a3 error:(id *)a4
{
  id v5 = a3;
  id v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  __int128 v52 = 0u;
  __int128 v53 = 0u;
  __int128 v54 = 0u;
  __int128 v55 = 0u;
  id v7 = v5;
  id v48 = [v7 countByEnumeratingWithState:&v52 objects:v59 count:16];
  if (!v48) {
    goto LABEL_40;
  }
  uint64_t v47 = *(void *)v53;
  uint64_t v45 = kTransparencyErrorDecode;
  __int128 v44 = self;
  id v42 = v7;
  while (2)
  {
    uint64_t v8 = 0LL;
    do
    {
      if (*(void *)v53 != v47) {
        objc_enumerationMutation(v7);
      }
      id v9 = *(void **)(*((void *)&v52 + 1) + 8LL * (void)v8);
      id v10 = objc_autoreleasePoolPush();
      id v11 = (void *)objc_claimAutoreleasedReturnValue([v9 smt]);

      if (!v11)
      {
        id v19 = 0LL;
LABEL_15:
        id v23 = (void *)objc_claimAutoreleasedReturnValue([v9 smt]);
        [v6 addObject:v23];

        uint64_t v24 = (void *)objc_claimAutoreleasedReturnValue( +[TransparencyError errorWithDomain:code:underlyingError:description:]( &OBJC_CLASS___TransparencyError,  "errorWithDomain:code:underlyingError:description:",  v45,  -72LL,  v19,  @"SMT from DB failed to parse"));
        -[KTContextVerifier deleteSMT:error:](self, "deleteSMT:error:", v9, v24);

        if (qword_1002EEC30 != -1) {
          dispatch_once(&qword_1002EEC30, &stru_100286820);
        }
        unint64_t v25 = (os_log_s *)qword_1002EEC38;
        if (os_log_type_enabled((os_log_t)qword_1002EEC38, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          id v58 = v19;
          _os_log_impl( (void *)&_mh_execute_header,  v25,  OS_LOG_TYPE_ERROR,  "SMT from DB failed to parse: %@",  buf,  0xCu);
        }

        goto LABEL_29;
      }

      id v12 = (void *)objc_claimAutoreleasedReturnValue([v9 smt]);
      id v51 = 0LL;
      id v13 = (void *)objc_claimAutoreleasedReturnValue( +[SignedObjectHolder parseFromData:error:]( &OBJC_CLASS___SignedMutationTimestamp,  "parseFromData:error:",  v12,  &v51));
      id v14 = v51;

      if (!v13)
      {
        id v19 = v14;
        goto LABEL_15;
      }

      id v46 = v10;
      id v15 = (void *)objc_claimAutoreleasedReturnValue(-[KTContextVerifier applicationKeyStore](self, "applicationKeyStore"));
      char v16 = (void *)objc_claimAutoreleasedReturnValue([v15 appSmtKeyStore]);
      uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue([v16 signatureVerifier]);
      [v13 setVerifier:v17];

      id v50 = v14;
      id v18 = [v13 verifyWithError:&v50];
      id v19 = v50;

      if (v18)
      {
        if (v18 != (id)1)
        {
          if (v18 == (id)2)
          {
            v56 = v9;
            id v20 = (void *)objc_claimAutoreleasedReturnValue( +[NSArray arrayWithObjects:count:]( &OBJC_CLASS___NSArray,  "arrayWithObjects:count:",  &v56,  1LL));
            unsigned int v21 = -[KTContextVerifier failSMTsIfOverMMD:proof:underlyingError:errorCode:analyticsData:]( self,  "failSMTsIfOverMMD:proof:underlyingError:errorCode:analyticsData:",  v20,  0LL,  v19,  -64LL,  0LL);

            if (v21)
            {
              double v22 = (void *)objc_claimAutoreleasedReturnValue([v9 smt]);
              [v6 addObject:v22];
            }

            else
            {

              id v19 = v13;
            }

            id v10 = v46;
            goto LABEL_29;
          }

          goto LABEL_22;
        }

        uint64_t v27 = (void *)objc_claimAutoreleasedReturnValue([v9 receiptTime]);
        [v27 timeIntervalSinceNow];
        double v29 = -v28;

        __int128 v26 = (void *)objc_claimAutoreleasedReturnValue(+[TransparencyAnalytics logger](&OBJC_CLASS___TransparencyAnalytics, "logger"));
        v30 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", v29));
        id v31 = v6;
        id v32 = (void *)objc_claimAutoreleasedReturnValue(-[KTContextVerifier applicationID](v44, "applicationID"));
        id v33 = (void *)objc_claimAutoreleasedReturnValue( +[TransparencyAnalytics formatEventName:application:]( &OBJC_CLASS___TransparencyAnalytics,  "formatEventName:application:",  @"VerifySMTTime",  v32));
        [v26 logMetric:v30 withName:v33];

        self = v44;
        id v6 = v31;
        id v7 = v42;
      }

      else
      {
        __int128 v26 = (void *)objc_claimAutoreleasedReturnValue([v9 smt]);
        [v6 addObject:v26];
      }

LABEL_22:
      [v9 setUnsigned:"signatureResult" value:v18];
      id v34 = (void *)objc_claimAutoreleasedReturnValue(-[KTContextVerifier dataStore](self, "dataStore"));
      id v49 = 0LL;
      unsigned __int8 v35 = [v34 persistAndRefaultObject:v9 error:&v49];
      id v36 = v49;

      if ((v35 & 1) == 0)
      {
        if (qword_1002EEC30 != -1) {
          dispatch_once(&qword_1002EEC30, &stru_100286840);
        }
        id v37 = (os_log_s *)qword_1002EEC38;
        if (os_log_type_enabled((os_log_t)qword_1002EEC38, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          id v58 = v36;
          _os_log_impl( (void *)&_mh_execute_header,  v37,  OS_LOG_TYPE_ERROR,  "failed to persist signature verified SMTS: %@",  buf,  0xCu);
        }

        if (v36)
        {
          uint64_t v38 = (void *)objc_claimAutoreleasedReturnValue(-[KTContextVerifier dataStore](v44, "dataStore"));
          [v38 reportCoreDataPersistEventForLocation:@"handlePendingSigSMTs" underlyingError:v36];

          if (!v19) {
            id v19 = v36;
          }
        }

        objc_autoreleasePoolPop(v46);
        goto LABEL_40;
      }

      id v10 = v46;
      if (a4 && v19) {
        *a4 = v19;
      }

      self = v44;
LABEL_29:

      objc_autoreleasePoolPop(v10);
      uint64_t v8 = (char *)v8 + 1;
    }

    while (v48 != v8);
    id v48 = [v7 countByEnumeratingWithState:&v52 objects:v59 count:16];
    if (v48) {
      continue;
    }
    break;
  }

+ (int64_t)verifyDeviceMutation:(id)a3 mapLeaf:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if ([v5 mutationType] != 1
    && [v5 mutationType] != 2
    && [v5 mutationType] != 4
    && [v5 mutationType] != 5)
  {
    int64_t v10 = -71LL;
    goto LABEL_23;
  }

  if (![v5 hasOptInExtension]
    || (id v7 = (void *)objc_claimAutoreleasedReturnValue([v5 getOptInOutWithExt]),
        uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v5 idsDeviceMutation]),
        id v9 = (void *)objc_claimAutoreleasedReturnValue([v8 accountKeyHash]),
        int64_t v10 = +[KTContextVerifier verifyOptInOutWithExtMerged:accountKeyHash:mapLeaf:pendingAccountAdds:]( &OBJC_CLASS___KTContextVerifier,  "verifyOptInOutWithExtMerged:accountKeyHash:mapLeaf:pendingAccountAdds:",  v7,  v9,  v6,  0LL),  v9,  v8,  v7,  !v10))
  {
    id v11 = (void *)objc_claimAutoreleasedReturnValue([v5 idsDeviceMutation]);
    id v12 = (void *)objc_claimAutoreleasedReturnValue([v11 accountKeyHash]);
    id v13 = (void *)objc_claimAutoreleasedReturnValue([v5 idsDeviceMutation]);
    id v14 = (void *)objc_claimAutoreleasedReturnValue([v13 deviceIdHash]);
    id v15 = (void *)objc_claimAutoreleasedReturnValue([v5 idsDeviceMutation]);
    id v16 = [v15 appVersion];
    uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue([v5 idsDeviceMutation]);
    id v18 = (void *)objc_claimAutoreleasedReturnValue([v17 clientDataHash]);
    id v19 = (void *)objc_claimAutoreleasedReturnValue( [v6 recordForAccountKeyHash:v12 deviceIdHash:v14 appVersion:v16 clientDataHash:v18]);

    if (v19)
    {
      id v20 = [v19 markedForDeletionMs];
      unsigned int v21 = [v5 mutationType];
      if (v20)
      {
        if (v21 == 4 || v21 == 1)
        {
          id v22 = [v19 markedForDeletionMs];
          if (v22 <= [v5 mutationMs])
          {
            int64_t v10 = -70LL;
LABEL_22:

            goto LABEL_23;
          }
        }
      }

      else if (v21 != 1 && [v5 mutationType] != 4)
      {
        id v26 = [v19 addedMs];
        if (v26 < [v5 mutationMs])
        {
          int64_t v10 = -69LL;
          goto LABEL_22;
        }
      }
    }

    else if ([v5 mutationType] == 1 || objc_msgSend(v5, "mutationType") == 4)
    {
      uint64_t v23 = objc_claimAutoreleasedReturnValue([v5 idsDeviceMutation]);
      uint64_t v24 = (void *)objc_claimAutoreleasedReturnValue([(id)v23 accountKeyHash]);
      unint64_t v25 = (void *)objc_claimAutoreleasedReturnValue([v6 accountForAccountKeyHash:v24]);

      LOBYTE(v23) = objc_msgSend(v25, "hasOptInAfter:", objc_msgSend(v5, "mutationMs"));
      if ((v23 & 1) == 0)
      {
        int64_t v10 = -68LL;
        goto LABEL_22;
      }
    }

    int64_t v10 = 0LL;
    goto LABEL_22;
  }

+ (int64_t)verifyOptInOutMutationMerged:(id)a3 mapLeaf:(id)a4 pendingAccountAdds:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  id v9 = a3;
  int64_t v10 = -[OptInOutWithExt initWithMutation:](objc_alloc(&OBJC_CLASS___OptInOutWithExt), "initWithMutation:", v9);
  id v11 = (void *)objc_claimAutoreleasedReturnValue([v9 accountKeyHash]);

  int64_t v12 = +[KTContextVerifier verifyOptInOutWithExtMerged:accountKeyHash:mapLeaf:pendingAccountAdds:]( &OBJC_CLASS___KTContextVerifier,  "verifyOptInOutWithExtMerged:accountKeyHash:mapLeaf:pendingAccountAdds:",  v10,  v11,  v8,  v7);
  return v12;
}

+ (int64_t)verifyOptInOutWithExtMerged:(id)a3 accountKeyHash:(id)a4 mapLeaf:(id)a5 pendingAccountAdds:(id)a6
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a6;
  int64_t v12 = (void *)objc_claimAutoreleasedReturnValue([a5 accountForAccountKeyHash:v10]);
  if ((v12 || [v11 containsObject:v10])
    && ((objc_msgSend(v12, "isActive:", objc_msgSend(v9, "timestampMs")) & 1) != 0
     || [v11 containsObject:v10]))
  {
    id v34 = 0LL;
    id v13 = (void *)objc_claimAutoreleasedReturnValue([v12 sortedOptInOutHistory:&v34]);
    id v14 = v34;
    if (v13)
    {
      int64_t v15 = -287LL;
      if ([v13 count] && !v14)
      {
        __int128 v32 = 0u;
        __int128 v33 = 0u;
        __int128 v30 = 0u;
        __int128 v31 = 0u;
        id v16 = (void *)objc_claimAutoreleasedReturnValue([v13 reverseObjectEnumerator]);
        uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue([v16 allObjects]);

        id v18 = [v17 countByEnumeratingWithState:&v30 objects:v35 count:16];
        if (v18)
        {
          id v19 = v18;
          double v28 = 0LL;
          id v29 = v11;
          uint64_t v20 = *(void *)v31;
          while (2)
          {
            for (i = 0LL; i != v19; i = (char *)i + 1)
            {
              if (*(void *)v31 != v20) {
                objc_enumerationMutation(v17);
              }
              id v22 = *(void **)(*((void *)&v30 + 1) + 8LL * (void)i);
              id v23 = objc_msgSend(v22, "timestampMs", v28, v29);
              if (v23 == [v9 timestampMs])
              {
                unsigned int v24 = [v22 optIn];
                if (v24 == [v9 optIn])
                {
                  int64_t v15 = 0LL;
                  goto LABEL_27;
                }
              }

              else
              {
                id v25 = [v22 timestampMs];
                if (v25 < [v9 timestampMs])
                {
                  unsigned int v26 = [v22 optIn];
                  else {
                    int64_t v15 = 0LL;
                  }
                  goto LABEL_27;
                }

                [v22 timestampMs];
                [v9 timestampMs];
              }
            }

            id v19 = [v17 countByEnumeratingWithState:&v30 objects:v35 count:16];
            if (v19) {
              continue;
            }
            break;
          }

          int64_t v15 = -288LL;
LABEL_27:
          id v14 = v28;
          id v11 = v29;
        }

        else
        {
          int64_t v15 = -288LL;
        }
      }
    }

    else
    {
      int64_t v15 = -287LL;
    }
  }

  else
  {
    int64_t v15 = 0LL;
  }

  return v15;
}

- (BOOL)failSMTsIfOverMMD:(id)a3 skipOptInOut:(BOOL)a4 proof:(id)a5 underlyingError:(id)a6 errorCode:(int64_t)a7 analyticsData:(id)a8
{
  BOOL v12 = a4;
  id v13 = a3;
  id v14 = a5;
  id v15 = a6;
  id v16 = a8;
  id v17 = [v13 mutableCopy];
  if (v12)
  {
    id v33 = v16;
    id v34 = v15;
    int64_t v35 = a7;
    id v36 = v14;
    __int128 v44 = 0u;
    __int128 v45 = 0u;
    __int128 v42 = 0u;
    __int128 v43 = 0u;
    id v37 = v13;
    id obj = v13;
    id v18 = [obj countByEnumeratingWithState:&v42 objects:v48 count:16];
    if (v18)
    {
      id v19 = v18;
      uint64_t v20 = *(void *)v43;
      uint64_t v21 = kTransparencyErrorDecode;
      do
      {
        id v22 = 0LL;
        do
        {
          if (*(void *)v43 != v20) {
            objc_enumerationMutation(obj);
          }
          id v23 = *(void **)(*((void *)&v42 + 1) + 8LL * (void)v22);
          id v24 = (id)objc_claimAutoreleasedReturnValue([v23 smt]);

          if (v24
            && (id v25 = (void *)objc_claimAutoreleasedReturnValue([v23 smt]),
                id v41 = 0LL,
                v26 = (void *)objc_claimAutoreleasedReturnValue( +[SignedObjectHolder parseFromData:error:]( &OBJC_CLASS___SignedMutationTimestamp,  "parseFromData:error:",  v25,  &v41)),  id v24 = v41,  v25,  v26))
          {
            id v40 = v24;
            uint64_t v27 = (void *)objc_claimAutoreleasedReturnValue([v26 parsedMutationWithError:&v40]);
            id v28 = v40;

            if ([v27 mutationType] == 3
              || [v27 mutationType] == 6)
            {
              [v17 removeObject:v23];
              [v23 setMergeResult:1];
            }

            id v24 = v28;
          }

          else
          {
            [v17 removeObject:v23];
            id v29 = (void *)objc_claimAutoreleasedReturnValue( +[TransparencyError errorWithDomain:code:underlyingError:description:]( &OBJC_CLASS___TransparencyError,  "errorWithDomain:code:underlyingError:description:",  v21,  -72LL,  v24,  @"SMT from DB failed to parse"));
            -[KTContextVerifier deleteSMT:error:](self, "deleteSMT:error:", v23, v29);

            if (qword_1002EEC30 != -1) {
              dispatch_once(&qword_1002EEC30, &stru_100286860);
            }
            __int128 v30 = (os_log_s *)qword_1002EEC38;
            if (os_log_type_enabled((os_log_t)qword_1002EEC38, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138412290;
              id v47 = v24;
              _os_log_impl( (void *)&_mh_execute_header,  v30,  OS_LOG_TYPE_ERROR,  "SMT from DB failed to parse: %@",  buf,  0xCu);
            }
          }

          id v22 = (char *)v22 + 1;
        }

        while (v19 != v22);
        id v19 = [obj countByEnumeratingWithState:&v42 objects:v48 count:16];
      }

      while (v19);
    }

    id v14 = v36;
    id v13 = v37;
    id v15 = v34;
    a7 = v35;
    id v16 = v33;
  }

  BOOL v31 = -[KTContextVerifier failSMTsIfOverMMD:proof:underlyingError:errorCode:analyticsData:]( self,  "failSMTsIfOverMMD:proof:underlyingError:errorCode:analyticsData:",  v17,  v14,  v15,  a7,  v16);

  return v31;
}

- (BOOL)verifyKTSMTsMerged:(id)a3 mapLeaf:(id)a4 analyticsData:(id)a5
{
  id v8 = a3;
  id v63 = a4;
  id v62 = a5;
  __int128 v61 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  __int128 v73 = 0u;
  __int128 v74 = 0u;
  __int128 v75 = 0u;
  __int128 v76 = 0u;
  id v9 = v8;
  id v10 = [v9 countByEnumeratingWithState:&v73 objects:v86 count:16];
  if (v10)
  {
    id v11 = v10;
    id v12 = 0LL;
    uint64_t v13 = 1LL;
    uint64_t v69 = *(void *)v74;
    uint64_t v67 = kTransparencyErrorDecode;
    id v65 = v9;
    while (1)
    {
      id v14 = 0LL;
      id v66 = v11;
      do
      {
        if (*(void *)v74 != v69) {
          objc_enumerationMutation(v9);
        }
        id v15 = *(void **)(*((void *)&v73 + 1) + 8LL * (void)v14);
        id v16 = (void *)objc_claimAutoreleasedReturnValue([v15 smt]);

        if (v16)
        {
          uint64_t v68 = v13;
          id v17 = (void *)objc_claimAutoreleasedReturnValue([v15 smt]);
          id v72 = v12;
          id v18 = (void *)objc_claimAutoreleasedReturnValue( +[SignedObjectHolder parseFromData:error:]( &OBJC_CLASS___SignedMutationTimestamp,  "parseFromData:error:",  v17,  &v72));
          id v19 = v72;

          if (v18)
          {
            id v71 = v19;
            uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue([v18 parsedMutationWithError:&v71]);
            id v12 = v71;

            if (v20)
            {
              int64_t v21 = -71LL;
              switch([v20 mutationType])
              {
                case 0u:
                  goto LABEL_31;
                case 1u:
                case 4u:
                  int64_t v22 = +[KTContextVerifier verifyDeviceMutation:mapLeaf:]( &OBJC_CLASS___KTContextVerifier,  "verifyDeviceMutation:mapLeaf:",  v20,  v63);
                  if (!v22) {
                    goto LABEL_32;
                  }
                  int64_t v21 = v22;
                  id v23 = (void *)objc_claimAutoreleasedReturnValue([v20 idsDeviceMutation]);
                  id v24 = (void *)objc_claimAutoreleasedReturnValue([v23 accountKeyHash]);

                  if (v24)
                  {
                    id v25 = (void *)objc_claimAutoreleasedReturnValue([v20 idsDeviceMutation]);
                    unsigned int v26 = (void *)objc_claimAutoreleasedReturnValue([v25 accountKeyHash]);
                    [v61 addObject:v26];
                  }

- (BOOL)verifyKTSMTsMerged:(id)a3 queryResponse:(id)a4 uri:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (v8 && [v8 count])
  {
    id v11 = (void *)objc_claimAutoreleasedReturnValue([v9 metadata]);
    uint64_t v12 = kTransparencyResponseMetadataKeyServerHint;
    uint64_t v13 = objc_claimAutoreleasedReturnValue([v11 objectForKeyedSubscript:kTransparencyResponseMetadataKeyServerHint]);

    id v14 = (void *)objc_claimAutoreleasedReturnValue([v9 metadata]);
    uint64_t v15 = objc_claimAutoreleasedReturnValue([v14 objectForKeyedSubscript:@"APS"]);

    if (v13 | v15)
    {
      id v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
      id v17 = v16;
      if (v13) {
        [v16 setObject:v13 forKey:v12];
      }
      if (v15) {
        [v17 setObject:&__kCFBooleanTrue forKey:@"APS"];
      }
    }

    else
    {
      id v17 = 0LL;
    }

    if ([v9 status] == 1)
    {
      uint64_t v44 = v15;
      id v18 = objc_alloc(&OBJC_CLASS___TransparencyMapInclusionProofVerifier);
      id v19 = (void *)objc_claimAutoreleasedReturnValue(-[KTContextVerifier applicationKeyStore](self, "applicationKeyStore"));
      uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue(-[KTContextVerifier applicationID](self, "applicationID"));
      int64_t v21 = -[TransparencyMapInclusionProofVerifier initWithKeyStore:application:]( v18,  "initWithKeyStore:application:",  v19,  v20);

      int64_t v22 = (void *)objc_claimAutoreleasedReturnValue([v9 inclusionProof]);
      __int128 v43 = v21;
      [v22 setVerifier:v21];

      id v23 = (void *)objc_claimAutoreleasedReturnValue([v9 inclusionProof]);
      id v24 = (void *)objc_claimAutoreleasedReturnValue(-[KTContextVerifier dataStore](self, "dataStore"));
      [v23 setDataStore:v24];

      id v25 = (void *)objc_claimAutoreleasedReturnValue([v9 inclusionProof]);
      unsigned int v26 = (void *)objc_claimAutoreleasedReturnValue([v9 metadata]);
      uint64_t v27 = (void *)objc_claimAutoreleasedReturnValue([v26 objectForKeyedSubscript:v12]);
      [v25 setMetadataValue:v27 key:v12];

      id v28 = (void *)objc_claimAutoreleasedReturnValue([v9 inclusionProof]);
      id v46 = 0LL;
      id v29 = [v28 verifyWithError:&v46];
      id v30 = v46;

      BOOL v31 = (void *)objc_claimAutoreleasedReturnValue([v9 inclusionProof]);
      __int128 v32 = v31;
      if (v29 == (id)1)
      {
        id v45 = v30;
        uint64_t v33 = objc_claimAutoreleasedReturnValue([v31 mapLeafWithError:&v45]);
        id v34 = v45;

        if (v33)
        {
          LOBYTE(self) = -[KTContextVerifier verifyKTSMTsMerged:mapLeaf:analyticsData:]( self,  "verifyKTSMTsMerged:mapLeaf:analyticsData:",  v8,  v33,  v17);
          __int128 v32 = (void *)v33;
          id v30 = v34;
        }

        else
        {
          id v38 = v34;
          id v42 = v34;
          id v39 = (void *)objc_claimAutoreleasedReturnValue([v9 inclusionProof]);
          id v40 = (void *)objc_claimAutoreleasedReturnValue([v39 data]);
          LODWORD(self) = !-[KTContextVerifier failSMTsIfOverMMD:proof:underlyingError:errorCode:analyticsData:]( self,  "failSMTsIfOverMMD:proof:underlyingError:errorCode:analyticsData:",  v8,  v40,  v38,  -79LL,  v17);

          __int128 v32 = 0LL;
          id v30 = v42;
        }
      }

      else
      {
        id v37 = (void *)objc_claimAutoreleasedReturnValue([v31 data]);
        LODWORD(self) = !-[KTContextVerifier failSMTsIfOverMMD:proof:underlyingError:errorCode:analyticsData:]( self,  "failSMTsIfOverMMD:proof:underlyingError:errorCode:analyticsData:",  v8,  v37,  v30,  -67LL,  v17);
      }

      uint64_t v15 = v44;
    }

    else
    {
      id v30 = (id)objc_claimAutoreleasedReturnValue( +[TransparencyError errorWithDomain:code:description:]( TransparencyError,  "errorWithDomain:code:description:",  kTransparencyErrorServer,  (int)[v9 status],  @"Query response indicates server failure: %d",  objc_msgSend(v9, "status")));
      BOOL v35 = [v9 status] == 7;
      id v36 = (void *)objc_claimAutoreleasedReturnValue([v9 data]);
      LODWORD(self) = !-[KTContextVerifier failSMTsIfOverMMD:skipOptInOut:proof:underlyingError:errorCode:analyticsData:]( self,  "failSMTsIfOverMMD:skipOptInOut:proof:underlyingError:errorCode:analyticsData:",  v8,  v35,  v36,  v30,  -306LL,  v17);
    }
  }

  else
  {
    LOBYTE(self) = 1;
  }

  return (char)self;
}

- (KTContextVerifier)initWithApplicationKeyStore:(id)a3 dataStore:(id)a4 applicationID:(id)a5 context:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v18.receiver = self;
  v18.super_class = (Class)&OBJC_CLASS___KTContextVerifier;
  uint64_t v15 = -[KTContextVerifier init](&v18, "init");
  id v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_applicationID, a5);
    objc_storeStrong((id *)&v16->_applicationKeyStore, a3);
    objc_storeStrong((id *)&v16->_dataStore, a4);
    objc_storeWeak((id *)&v16->_context, v14);
  }

  return v16;
}

- (KTContextVerifier)initWithApplicationKeyStore:(id)a3 dataStore:(id)a4 applicationID:(id)a5
{
  return -[KTContextVerifier initWithApplicationKeyStore:dataStore:applicationID:context:]( self,  "initWithApplicationKeyStore:dataStore:applicationID:context:",  a3,  a4,  a5,  0LL);
}

- (unint64_t)checkServerStatus:(int)a3 isInsert:(BOOL)a4 error:(id *)a5
{
  BOOL v6 = a3 == 3 && a4;
  unint64_t result = 1LL;
  if (a3 != 1 && !v6)
  {
    uint64_t v8 = *(void *)&a3;
    if (a5) {
      *a5 = (id)objc_claimAutoreleasedReturnValue( +[TransparencyError errorWithDomain:code:description:]( &OBJC_CLASS___TransparencyError,  "errorWithDomain:code:description:",  kTransparencyErrorServer,  a3,  @"Query response indicates server failure: %d",  *(void *)&a3));
    }
    if (qword_1002EEC40 != -1) {
      dispatch_once(&qword_1002EEC40, &stru_100286920);
    }
    id v9 = (os_log_s *)qword_1002EEC48;
    if (os_log_type_enabled((os_log_t)qword_1002EEC48, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 67109120;
      int v12 = v8;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, "Response indicates server failure: %d", buf, 8u);
    }

    id v10 = (void *)objc_claimAutoreleasedReturnValue(-[KTContextVerifier applicationKeyStore](self, "applicationKeyStore"));
    [v10 triggerRefreshFromServerStatus:v8];

    return 2LL * ((_DWORD)v8 == 5);
  }

  return result;
}

- (unint64_t)checkServerStatus:(int)a3 error:(id *)a4
{
  return -[KTContextVerifier checkServerStatus:isInsert:error:]( self,  "checkServerStatus:isInsert:error:",  *(void *)&a3,  0LL,  a4);
}

- (unint64_t)checkResponseFreshness:(id)a3 smh:(id)a4 receiptDate:(id)a5 error:(id *)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  if (!v12) {
    id v12 = (id)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
  }
  if (![v10 count]
    || (unint64_t v13 = -[KTContextVerifier verifySMTTimestamps:receiptDate:error:]( self,  "verifySMTTimestamps:receiptDate:error:",  v10,  v12,  a6),  v13 == 1))
  {
    uint64_t v14 = objc_claimAutoreleasedReturnValue([v11 object]);
    if (v14 && (uint64_t v15 = (void *)v14, v16 = [v11 hasSignature], v15, v16))
    {
      id v17 = (void *)objc_claimAutoreleasedReturnValue(-[KTContextVerifier applicationKeyStore](self, "applicationKeyStore"));
      objc_super v18 = (void *)objc_claimAutoreleasedReturnValue([v17 appSthKeyStore]);
      id v19 = (void *)objc_claimAutoreleasedReturnValue([v18 signatureVerifier]);
      uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue(-[KTContextVerifier dataStore](self, "dataStore"));
      int64_t v21 = (void *)objc_claimAutoreleasedReturnValue( +[SignedMapHead signedTypeWithObject:verifier:dataStore:]( &OBJC_CLASS___SignedMapHead,  "signedTypeWithObject:verifier:dataStore:",  v11,  v19,  v20));

      int64_t v22 = (void *)objc_claimAutoreleasedReturnValue(-[KTContextVerifier applicationKeyStore](self, "applicationKeyStore"));
      objc_msgSend(v21, "setOverrideBeginTime:", objc_msgSend(v22, "patLogBeginningMs"));

      [v12 timeIntervalSinceReferenceDate];
      unint64_t v13 = (unint64_t)objc_msgSend(v21, "verifyMMD:error:", a6);
    }

    else
    {
      unint64_t v13 = 1LL;
    }
  }

  return v13;
}

+ (BOOL)verifyServerLoggableDatas:(id)a3 againstSyncedLoggableDatas:(id)a4 cloudDevices:(id)a5 error:(id *)a6
{
  id v8 = a3;
  id v49 = a4;
  id v9 = a5;
  __int128 v61 = 0u;
  __int128 v62 = 0u;
  __int128 v63 = 0u;
  __int128 v64 = 0u;
  id obj = v8;
  id v10 = [v8 countByEnumeratingWithState:&v61 objects:v70 count:16];
  id v53 = v10;
  if (!v10)
  {
    char v43 = 1;
    goto LABEL_48;
  }

  id v50 = 0LL;
  char v46 = 1;
  uint64_t v52 = *(void *)v62;
  *(void *)&__int128 v11 = 138412546LL;
  __int128 v45 = v11;
  id v48 = v9;
  do
  {
    id v12 = 0LL;
    do
    {
      if (*(void *)v62 != v52) {
        objc_enumerationMutation(obj);
      }
      unint64_t v13 = *(void **)(*((void *)&v61 + 1) + 8LL * (void)v12);
      uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "deviceID", v45));
      uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue([v13 clientData]);
      unsigned int v16 = (void *)objc_claimAutoreleasedReturnValue([v9 fetchSyncedLoggableDataByPushToken:v14 registrationData:v15]);

      if ([v9 disableKTSyncabledKVSStore])
      {
        if (v16) {
          goto LABEL_40;
        }
        uint64_t v17 = -101LL;
LABEL_30:
        unsigned __int8 v56 = v16;
        if (a6 && *a6) {
          id v18 = *a6;
        }
        else {
          id v18 = 0LL;
        }
        BOOL v31 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
        __int128 v32 = (void *)objc_claimAutoreleasedReturnValue([v13 clientData]);
        uint64_t v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "kt_hexString"));
        [v31 setObject:v33 forKeyedSubscript:@"clientData"];

        id v34 = (void *)objc_claimAutoreleasedReturnValue([v13 deviceID]);
        BOOL v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v34, "kt_hexString"));
        [v31 setObject:v35 forKeyedSubscript:@"deviceID"];

        uint64_t v36 = objc_claimAutoreleasedReturnValue( +[TransparencyError errorWithDomain:code:errorLevel:underlyingError:userinfo:description:]( &OBJC_CLASS___TransparencyError,  "errorWithDomain:code:errorLevel:underlyingError:userinfo:description:",  @"TransparencyErrorVerify",  v17,  4LL,  v18,  v31,  @"IDS server data missing from syncedData"));
        if (qword_1002EEC40 != -1) {
          dispatch_once(&qword_1002EEC40, &stru_100286940);
        }
        id v37 = (void *)qword_1002EEC48;
        if (os_log_type_enabled((os_log_t)qword_1002EEC48, OS_LOG_TYPE_ERROR))
        {
          id v38 = v37;
          id v39 = (void *)objc_claimAutoreleasedReturnValue([v13 deviceID]);
          id v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v39, "kt_hexString"));
          double v41 = (void *)objc_claimAutoreleasedReturnValue([v13 clientData]);
          __int128 v55 = v12;
          id v42 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v41, "kt_hexString"));
          *(_DWORD *)buf = v45;
          id v66 = v40;
          __int16 v67 = 2112;
          uint64_t v68 = v42;
          _os_log_impl( (void *)&_mh_execute_header,  v38,  OS_LOG_TYPE_ERROR,  "IDS server data (deviceId: %@, clientData: %@) missing from syncedData",  buf,  0x16u);

          id v12 = v55;
        }

        [v13 setNotInSyncedData:1];
        [v13 setResult:0];
        [v13 setFailure:v36];

        char v46 = 0;
        id v50 = (id)v36;
LABEL_39:

        unsigned int v16 = v56;
        goto LABEL_40;
      }

      __int128 v54 = v12;
      unsigned __int8 v56 = v16;
      __int128 v59 = 0u;
      __int128 v60 = 0u;
      __int128 v57 = 0u;
      __int128 v58 = 0u;
      id v18 = v49;
      id v19 = [v18 countByEnumeratingWithState:&v57 objects:v69 count:16];
      if (v19)
      {
        id v20 = v19;
        uint64_t v21 = *(void *)v58;
        uint64_t v17 = -101LL;
        while (2)
        {
          for (i = 0LL; i != v20; i = (char *)i + 1)
          {
            if (*(void *)v58 != v21) {
              objc_enumerationMutation(v18);
            }
            id v23 = *(void **)(*((void *)&v57 + 1) + 8LL * (void)i);
            id v24 = (void *)objc_claimAutoreleasedReturnValue([v13 deviceID]);
            id v25 = (void *)objc_claimAutoreleasedReturnValue([v23 deviceID]);
            unsigned int v26 = [v24 isEqualToData:v25];

            uint64_t v27 = (void *)objc_claimAutoreleasedReturnValue([v13 clientData]);
            id v28 = (void *)objc_claimAutoreleasedReturnValue([v23 clientData]);
            unsigned int v29 = [v27 isEqualToData:v28];

            int v30 = v26 ^ 1;
            if (((v26 ^ 1) & 1) == 0 && (v29 & 1) != 0)
            {
              id v9 = v48;
              id v12 = v54;
              goto LABEL_39;
            }

            if ((v30 & v29) != 1 || v17 == -88)
            {
              if (((v30 | v29) & 1) != 0 || v17 == -87)
              {
                if (v26 | v29) {
                  uint64_t v17 = -89LL;
                }
              }

              else
              {
                uint64_t v17 = -88LL;
              }
            }

            else
            {
              uint64_t v17 = -87LL;
            }
          }

          id v20 = [v18 countByEnumeratingWithState:&v57 objects:v69 count:16];
          if (v20) {
            continue;
          }
          break;
        }
      }

      else
      {
        uint64_t v17 = -101LL;
      }

      id v9 = v48;
      id v12 = v54;
      unsigned int v16 = v56;
      if (!v56) {
        goto LABEL_30;
      }
LABEL_40:

      id v12 = (char *)v12 + 1;
    }

    while (v12 != v53);
    id v53 = [obj countByEnumeratingWithState:&v61 objects:v70 count:16];
  }

  while (v53);
  if (a6)
  {
    id v10 = v50;
    if (v50)
    {
      id v10 = v50;
      *a6 = v10;
    }
  }

  else
  {
    id v10 = v50;
  }

  char v43 = v46;
LABEL_48:

  return v43 & 1;
}

- (unint64_t)verifyUriWitness:(id)a3 uri:(id)a4 error:(id *)a5
{
  id v8 = a4;
  id v9 = a3;
  id v10 = [v9 type];
  __int128 v11 = (void *)objc_claimAutoreleasedReturnValue(-[KTApplicationPublicKeyStore vrfKey](self->_applicationKeyStore, "vrfKey"));
  id v12 = (void *)objc_claimAutoreleasedReturnValue( +[TransparencyVRFVerifier verifierOfType:key:]( &OBJC_CLASS___TransparencyVRFVerifier,  "verifierOfType:key:",  v10,  v11));

  [v9 setVerifier:v12];
  unint64_t v13 = (void *)objc_claimAutoreleasedReturnValue([v8 dataUsingEncoding:4]);
  [v9 setMessage:v13];

  id v14 = [v9 verifyWithError:a5];
  if (v14 != (id)1)
  {
    if (a5) {
      *a5 = (id)objc_claimAutoreleasedReturnValue( +[TransparencyError errorWithDomain:code:underlyingError:description:]( &OBJC_CLASS___TransparencyError,  "errorWithDomain:code:underlyingError:description:",  @"TransparencyErrorVerify",  -104LL,  *a5,  @"URI VRF witness failed for %@",  v8));
    }
    if (qword_1002EEC40 != -1) {
      dispatch_once(&qword_1002EEC40, &stru_100286960);
    }
    uint64_t v15 = (os_log_s *)qword_1002EEC48;
    if (os_log_type_enabled((os_log_t)qword_1002EEC48, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v18 = v8;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_ERROR, "URI VRF witness failed for %@", buf, 0xCu);
    }
  }

  return (unint64_t)v14;
}

- (unint64_t)verifyAccountKeyWitness:(id)a3 accountKey:(id)a4 error:(id *)a5
{
  id v8 = a4;
  id v9 = a3;
  id v10 = [v9 type];
  __int128 v11 = (void *)objc_claimAutoreleasedReturnValue(-[KTApplicationPublicKeyStore vrfKey](self->_applicationKeyStore, "vrfKey"));
  id v12 = (void *)objc_claimAutoreleasedReturnValue( +[TransparencyVRFVerifier verifierOfType:key:]( &OBJC_CLASS___TransparencyVRFVerifier,  "verifierOfType:key:",  v10,  v11));

  [v9 setVerifier:v12];
  [v9 setMessage:v8];
  id v13 = [v9 verifyWithError:a5];

  if (v13 != (id)1)
  {
    if (a5) {
      *a5 = (id)objc_claimAutoreleasedReturnValue( +[TransparencyError errorWithDomain:code:underlyingError:description:]( &OBJC_CLASS___TransparencyError,  "errorWithDomain:code:underlyingError:description:",  @"TransparencyErrorVerify",  -77LL,  *a5,  @"AccountKey VRF witness failed for %@",  v8));
    }
    if (qword_1002EEC40 != -1) {
      dispatch_once(&qword_1002EEC40, &stru_100286980);
    }
    id v14 = (os_log_s *)qword_1002EEC48;
    if (os_log_type_enabled((os_log_t)qword_1002EEC48, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v17 = v8;
      _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_ERROR,  "AccountKey VRF witness failed for %@",  buf,  0xCu);
    }
  }

  return (unint64_t)v13;
}

+ (BOOL)verifyLoggableDataSignatures:(id)a3 accountKey:(id)a4 error:(id *)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  __int128 v33 = 0u;
  __int128 v34 = 0u;
  __int128 v35 = 0u;
  __int128 v36 = 0u;
  id v10 = v7;
  id v11 = [v10 countByEnumeratingWithState:&v33 objects:v39 count:16];
  BOOL v12 = v11 == 0LL;
  if (!v11)
  {
    id v14 = 0LL;
    id v25 = v10;
LABEL_20:

    goto LABEL_21;
  }

  id v13 = v11;
  unsigned int v29 = a5;
  BOOL v30 = v11 == 0LL;
  BOOL v31 = v9;
  id v14 = 0LL;
  uint64_t v15 = *(void *)v34;
  char v16 = 1;
  do
  {
    id v17 = v10;
    for (i = 0LL; i != v13; i = (char *)i + 1)
    {
      if (*(void *)v34 != v15) {
        objc_enumerationMutation(v17);
      }
      id v19 = *(void **)(*((void *)&v33 + 1) + 8LL * (void)i);
      id v32 = 0LL;
      unsigned __int8 v20 = objc_msgSend(v19, "verifySignatureWithAccountKey:error:", v8, &v32, v29);
      id v21 = v32;
      if ((v20 & 1) == 0)
      {
        [v19 setResult:0];
        [v19 setFailure:v21];
        int64_t v22 = (void *)objc_claimAutoreleasedReturnValue([v19 deviceID]);
        id v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "kt_hexString"));
        [v31 setObject:v21 forKeyedSubscript:v23];

        id v24 = v21;
        char v16 = 0;
        id v14 = v24;
      }
    }

    id v10 = v17;
    id v13 = [v17 countByEnumeratingWithState:&v33 objects:v39 count:16];
  }

  while (v13);

  if ((v16 & 1) == 0)
  {
    id v9 = v31;
    if (v31)
    {
      id v37 = @"loggableDataErrors";
      id v38 = v31;
      id v25 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v38,  &v37,  1LL));
    }

    else
    {
      id v25 = 0LL;
    }

    unsigned int v26 = (void *)objc_claimAutoreleasedReturnValue([v14 domain]);
    uint64_t v27 = (void *)objc_claimAutoreleasedReturnValue( +[TransparencyError errorWithDomain:code:userInfo:]( TransparencyError,  "errorWithDomain:code:userInfo:",  v26,  [v14 code],  v25));

    BOOL v12 = v30;
    if (v29 && v27) {
      id *v29 = v27;
    }

    goto LABEL_20;
  }

  BOOL v12 = 1;
  id v9 = v31;
LABEL_21:

  return v12;
}

- (KTApplicationPublicKeyStore)applicationKeyStore
{
  return (KTApplicationPublicKeyStore *)objc_getProperty(self, a2, 8LL, 1);
}

- (void)setApplicationKeyStore:(id)a3
{
}

- (TransparencyManagedDataStore)dataStore
{
  return (TransparencyManagedDataStore *)objc_getProperty(self, a2, 16LL, 1);
}

- (void)setDataStore:(id)a3
{
}

- (NSString)applicationID
{
  return (NSString *)objc_getProperty(self, a2, 24LL, 1);
}

- (void)setApplicationID:(id)a3
{
}

- (KTContext)context
{
  return (KTContext *)objc_loadWeakRetained((id *)&self->_context);
}

- (void)setContext:(id)a3
{
}

- (KTLogClient)logClient
{
  return (KTLogClient *)objc_getProperty(self, a2, 40LL, 1);
}

- (void)setLogClient:(id)a3
{
}

- (void).cxx_destruct
{
}

- (unint64_t)checkQueryResponseFreshness:(id)a3 receiptDate:(id)a4 error:(id *)a5
{
  id v8 = a4;
  id v9 = a3;
  id v10 = (void *)objc_claimAutoreleasedReturnValue([v9 pendingSmtsArray]);
  id v11 = (void *)objc_claimAutoreleasedReturnValue([v9 inclusionProof]);

  BOOL v12 = (void *)objc_claimAutoreleasedReturnValue([v11 mapEntry]);
  id v13 = (void *)objc_claimAutoreleasedReturnValue([v12 smh]);
  unint64_t v14 = -[KTContextVerifier checkResponseFreshness:smh:receiptDate:error:]( self,  "checkResponseFreshness:smh:receiptDate:error:",  v10,  v13,  v8,  a5);

  return v14;
}

- (void)checkQueryResponseEpochs:(id)a3
{
  id v18 = a3;
  unsigned int v4 = [v18 hasInclusionProof];
  id v5 = v18;
  if (v4)
  {
    BOOL v6 = (void *)objc_claimAutoreleasedReturnValue([v18 inclusionProof]);

    id v5 = v18;
    if (v6)
    {
      id v7 = (void *)objc_claimAutoreleasedReturnValue([v18 inclusionProof]);
      if ([v7 hasPerApplicationTreeEntry])
      {
        uint64_t v8 = objc_claimAutoreleasedReturnValue([v7 perApplicationTreeEntry]);
        if (v8)
        {
          id v9 = (void *)v8;
          id v10 = (void *)objc_claimAutoreleasedReturnValue([v7 perApplicationTreeEntry]);
          if (![v10 hasSlh])
          {
LABEL_8:

            goto LABEL_9;
          }

          id v11 = (void *)objc_claimAutoreleasedReturnValue([v7 perApplicationTreeEntry]);
          BOOL v12 = (void *)objc_claimAutoreleasedReturnValue([v11 slh]);

          if (v12)
          {
            id v9 = (void *)objc_claimAutoreleasedReturnValue([v7 perApplicationTreeEntry]);
            id v10 = (void *)objc_claimAutoreleasedReturnValue([v9 slh]);
            -[KTContextVerifier checkHeadEpoch:](self, "checkHeadEpoch:", v10);
            goto LABEL_8;
          }
        }
      }

- (unint64_t)verifyInclusionProof:(id)a3 mapLeaf:(id *)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = objc_alloc(&OBJC_CLASS___TransparencyMapInclusionProofVerifier);
  id v10 = (void *)objc_claimAutoreleasedReturnValue(-[KTContextVerifier applicationKeyStore](self, "applicationKeyStore"));
  id v11 = (void *)objc_claimAutoreleasedReturnValue(-[KTContextVerifier applicationID](self, "applicationID"));
  BOOL v12 = -[TransparencyMapInclusionProofVerifier initWithKeyStore:application:]( v9,  "initWithKeyStore:application:",  v10,  v11);

  [v8 setVerifier:v12];
  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue(-[KTContextVerifier dataStore](self, "dataStore"));
  [v8 setDataStore:v13];

  unint64_t v14 = (void *)objc_claimAutoreleasedReturnValue(-[KTContextVerifier context](self, "context"));
  uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue([v14 optInServer]);
  [v8 setOptInServer:v15];

  unint64_t v16 = (unint64_t)[v8 verifyWithError:a5];
  if (v16 == 1)
  {
    if (a4)
    {
      id v17 = (id)objc_claimAutoreleasedReturnValue([v8 mapLeafWithError:a5]);
      *a4 = v17;
      unint64_t v16 = v17 != 0LL;
    }

    else
    {
      unint64_t v16 = 1LL;
    }
  }

  return v16;
}

- (unint64_t)handleQueryResponse:(id)a3 queryRequest:(id)a4 receiptDate:(id)a5 fetchId:(id)a6 error:(id *)a7 rawDataHandler:(id)a8
{
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  id v18 = (void (**)(id, void *, void *, id, void *, void))a8;
  unint64_t v19 = -[KTContextVerifier checkServerStatus:error:](self, "checkServerStatus:error:", [v14 status], a7);
  if (v19 == 1)
  {
    -[KTContextVerifier checkQueryResponseEpochs:](self, "checkQueryResponseEpochs:", v14);
    unsigned __int8 v20 = (void *)objc_claimAutoreleasedReturnValue(-[KTContextVerifier context](self, "context"));
    unsigned __int8 v21 = [v20 ready:a7];

    if ((v21 & 1) != 0)
    {
      unint64_t v22 = -[KTContextVerifier checkQueryResponseFreshness:receiptDate:error:]( self,  "checkQueryResponseFreshness:receiptDate:error:",  v14,  v16,  a7);
      if (v22 == 1)
      {
        id v23 = (void *)objc_claimAutoreleasedReturnValue([v14 uriWitness]);
        id v24 = (void *)objc_claimAutoreleasedReturnValue([v15 uri]);
        unint64_t v25 = -[KTContextVerifier verifyUriWitness:uri:error:](self, "verifyUriWitness:uri:error:", v23, v24, a7);

        if (v25 == 1)
        {
          unsigned int v26 = (void *)objc_claimAutoreleasedReturnValue([v14 metadata]);
          uint64_t v27 = kTransparencyResponseMetadataKeyServerHint;
          id v49 = (void *)objc_claimAutoreleasedReturnValue([v26 objectForKeyedSubscript:kTransparencyResponseMetadataKeyServerHint]);

          if ([v14 hasInclusionProof]
            && (id v28 = (void *)objc_claimAutoreleasedReturnValue([v14 inclusionProof]),
                v28,
                v28))
          {
            unsigned int v29 = (void *)objc_claimAutoreleasedReturnValue([v14 inclusionProof]);
            [v29 setMetadataValue:v49 key:v27];

            BOOL v30 = (void *)objc_claimAutoreleasedReturnValue([v14 inclusionProof]);
            id v50 = 0LL;
            unint64_t v25 = -[KTContextVerifier verifyInclusionProof:mapLeaf:error:]( self,  "verifyInclusionProof:mapLeaf:error:",  v30,  &v50,  a7);
            id v48 = v50;

            if (v25 != 1)
            {
              if (qword_1002EED50 != -1) {
                dispatch_once(&qword_1002EED50, &stru_100287FD0);
              }
              BOOL v31 = (os_log_s *)qword_1002EED58;
              if (os_log_type_enabled((os_log_t)qword_1002EED58, OS_LOG_TYPE_ERROR))
              {
                if (a7) {
                  id v32 = *a7;
                }
                else {
                  id v32 = 0LL;
                }
                *(_DWORD *)buf = 138543618;
                id v52 = v17;
                __int16 v53 = 2112;
                uint64_t v54 = (uint64_t)v32;
                _os_log_impl( (void *)&_mh_execute_header,  v31,  OS_LOG_TYPE_ERROR,  "QueryResponse for fetchId %{public}@ failed inclusion proof verification: %@",  buf,  0x16u);
              }

              __int128 v45 = v48;
LABEL_42:

              goto LABEL_43;
            }
          }

          else
          {
            id v48 = 0LL;
          }

          if (objc_msgSend(v14, "pendingSmtsArray_Count")
            && (id v39 = (void *)objc_claimAutoreleasedReturnValue([v14 pendingSmtsArray]),
                id v40 = (void *)objc_claimAutoreleasedReturnValue([v15 uri]),
                unint64_t v25 = -[KTContextVerifier verifySMTs:uri:serverHint:error:]( self,  "verifySMTs:uri:serverHint:error:",  v39,  v40,  v49,  a7),  v40,  v39,  v25 != 1))
          {
            if (qword_1002EED50 != -1) {
              dispatch_once(&qword_1002EED50, &stru_100287FF0);
            }
            char v46 = (os_log_s *)qword_1002EED58;
            __int128 v45 = v48;
            if (os_log_type_enabled((os_log_t)qword_1002EED58, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138543362;
              id v52 = v17;
              _os_log_impl( (void *)&_mh_execute_header,  v46,  OS_LOG_TYPE_ERROR,  "Pending SMT verification failed for fetchId %{public}@",  buf,  0xCu);
            }
          }

          else
          {
            double v41 = (void *)objc_claimAutoreleasedReturnValue([v15 uri]);
            id v42 = (void *)objc_claimAutoreleasedReturnValue([v14 uriWitness]);
            char v43 = (void *)objc_claimAutoreleasedReturnValue([v42 output]);
            uint64_t v44 = (void *)objc_claimAutoreleasedReturnValue([v14 pendingSmtsArray]);
            __int128 v45 = v48;
            v18[2](v18, v41, v43, v48, v44, 0LL);

            unint64_t v25 = 1LL;
          }

          goto LABEL_42;
        }

        if (qword_1002EED50 != -1) {
          dispatch_once(&qword_1002EED50, &stru_100287FB0);
        }
        id v37 = (void *)qword_1002EED58;
        if (os_log_type_enabled((os_log_t)qword_1002EED58, OS_LOG_TYPE_ERROR))
        {
          __int128 v34 = v37;
          id v38 = (void *)objc_claimAutoreleasedReturnValue([v15 uri]);
          *(_DWORD *)buf = 138543874;
          id v52 = v17;
          __int16 v53 = 2160;
          uint64_t v54 = 1752392040LL;
          __int16 v55 = 2112;
          unsigned __int8 v56 = v38;
          _os_log_impl( (void *)&_mh_execute_header,  v34,  OS_LOG_TYPE_ERROR,  "QueryResponse for fetchId %{public}@ failed uri witness verification: %{mask.hash}@",  buf,  0x20u);

          goto LABEL_17;
        }
      }

      else
      {
        unint64_t v25 = v22;
        if (qword_1002EED50 != -1) {
          dispatch_once(&qword_1002EED50, &stru_100287F90);
        }
        __int128 v36 = (os_log_s *)qword_1002EED58;
        if (os_log_type_enabled((os_log_t)qword_1002EED58, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138543362;
          id v52 = v17;
          _os_log_impl( (void *)&_mh_execute_header,  v36,  OS_LOG_TYPE_ERROR,  "QueryResponse for fetchId %{public}@ exceeded MMD",  buf,  0xCu);
        }
      }
    }

    else
    {
      if (qword_1002EED50 != -1) {
        dispatch_once(&qword_1002EED50, &stru_100287F70);
      }
      __int128 v35 = (os_log_s *)qword_1002EED58;
      if (os_log_type_enabled((os_log_t)qword_1002EED58, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543362;
        id v52 = v17;
        _os_log_impl( (void *)&_mh_execute_header,  v35,  OS_LOG_TYPE_ERROR,  "QueryResponse for fetchId %{public}@ waiting for keystore refresh",  buf,  0xCu);
      }

      unint64_t v25 = 2LL;
    }
  }

  else
  {
    unint64_t v25 = v19;
    if (qword_1002EED50 != -1) {
      dispatch_once(&qword_1002EED50, &stru_100287F50);
    }
    __int128 v33 = (void *)qword_1002EED58;
    if (os_log_type_enabled((os_log_t)qword_1002EED58, OS_LOG_TYPE_ERROR))
    {
      __int128 v34 = v33;
      *(_DWORD *)buf = 138543618;
      id v52 = v17;
      __int16 v53 = 1024;
      LODWORD(v54) = [v14 status];
      _os_log_impl( (void *)&_mh_execute_header,  v34,  OS_LOG_TYPE_ERROR,  "QueryResponse for fetchId %{public}@ server error: %d",  buf,  0x12u);
LABEL_17:
    }
  }

- (unint64_t)handleQueryResponse:(id)a3 queryRequest:(id)a4 receiptDate:(id)a5 fetchId:(id)a6 error:(id *)a7 transparentDataHandler:(id)a8
{
  id v14 = a5;
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472LL;
  v20[2] = sub_1001A6120;
  v20[3] = &unk_100288058;
  v20[4] = self;
  id v21 = a6;
  id v22 = v14;
  id v23 = a8;
  id v15 = v14;
  id v16 = v23;
  id v17 = v21;
  unint64_t v18 = -[KTContextVerifier handleQueryResponse:queryRequest:receiptDate:fetchId:error:rawDataHandler:]( self,  "handleQueryResponse:queryRequest:receiptDate:fetchId:error:rawDataHandler:",  a3,  a4,  v15,  v17,  a7,  v20);

  return v18;
}

- (unint64_t)handleInsertResponse:(id)a3 uri:(id)a4 fetchId:(id)a5 error:(id *)a6 transparentDataHandler:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = (void (**)(id, id, id, void))a7;
  unint64_t v16 = -[KTContextVerifier checkServerStatus:isInsert:error:]( self,  "checkServerStatus:isInsert:error:",  [v12 status],  1,  a6);
  if (v16 == 1)
  {
    id v17 = (void *)objc_claimAutoreleasedReturnValue(-[KTContextVerifier context](self, "context"));
    unsigned __int8 v18 = [v17 ready:a6];

    if ((v18 & 1) != 0)
    {
      unint64_t v19 = (void *)objc_claimAutoreleasedReturnValue([v12 uriWitness]);
      unint64_t v20 = -[KTContextVerifier verifyUriWitness:uri:error:](self, "verifyUriWitness:uri:error:", v19, v13, a6);

      if (v20 == 1)
      {
        id v21 = (void *)objc_claimAutoreleasedReturnValue([v12 smt]);
        char v46 = v21;
        id v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v46, 1LL));
        id v23 = (void *)objc_claimAutoreleasedReturnValue([v12 serverEventInfo]);
        unint64_t v20 = -[KTContextVerifier verifySMTs:uri:serverHint:error:]( self,  "verifySMTs:uri:serverHint:error:",  v22,  v13,  v23,  a6);

        if (v20 == 1)
        {
          char v43 = objc_alloc(&OBJC_CLASS___KTTransparentData);
          id v24 = (void *)objc_claimAutoreleasedReturnValue([v12 uriWitness]);
          unint64_t v25 = (void *)objc_claimAutoreleasedReturnValue([v24 output]);
          unsigned int v26 = (void *)objc_claimAutoreleasedReturnValue([v12 smt]);
          __int128 v45 = v26;
          uint64_t v27 = (void *)objc_claimAutoreleasedReturnValue( +[NSArray arrayWithObjects:count:]( &OBJC_CLASS___NSArray,  "arrayWithObjects:count:",  &v45,  1LL));
          uint64_t v44 = -[KTTransparentData initWithUriVRFOutput:mapLeaf:pendingSMTs:error:]( v43,  "initWithUriVRFOutput:mapLeaf:pendingSMTs:error:",  v25,  0LL,  v27,  a6);

          id v28 = (void *)objc_claimAutoreleasedReturnValue(-[KTContextVerifier applicationKeyStore](self, "applicationKeyStore"));
          unsigned int v29 = (void *)objc_claimAutoreleasedReturnValue( +[NSDate dateWithTimeIntervalSince1970:]( NSDate,  "dateWithTimeIntervalSince1970:",  (double)(unint64_t)[v28 patLogBeginningMs] / 1000.0));
          -[KTTransparentData setCurrentTreeEpochBeginDate:](v44, "setCurrentTreeEpochBeginDate:", v29);

          if (v44)
          {
            if (-[KTTransparentData verifyServerInvariantsAt:error:](v44, "verifyServerInvariantsAt:error:", 0LL, a6))
            {
              v15[2](v15, v13, v44, 0LL);
              unint64_t v20 = 1LL;
LABEL_42:

              goto LABEL_43;
            }

            if (qword_1002EED60 != -1) {
              dispatch_once(&qword_1002EED60, &stru_100288118);
            }
            id v38 = (os_log_s *)qword_1002EED68;
            if (!os_log_type_enabled((os_log_t)qword_1002EED68, OS_LOG_TYPE_ERROR))
            {
LABEL_41:
              unint64_t v20 = 0LL;
              goto LABEL_42;
            }

            if (a6) {
              id v40 = *a6;
            }
            else {
              id v40 = 0LL;
            }
            *(_DWORD *)buf = 138543618;
            id v48 = v14;
            __int16 v49 = 2112;
            uint64_t v50 = (uint64_t)v40;
            double v41 = "InsertResponse for fetchId %{public}@ failed server invariant verification: %@";
          }

          else
          {
            if (qword_1002EED60 != -1) {
              dispatch_once(&qword_1002EED60, &stru_1002880F8);
            }
            id v38 = (os_log_s *)qword_1002EED68;
            if (!os_log_type_enabled((os_log_t)qword_1002EED68, OS_LOG_TYPE_ERROR)) {
              goto LABEL_41;
            }
            if (a6) {
              id v39 = *a6;
            }
            else {
              id v39 = 0LL;
            }
            *(_DWORD *)buf = 138543618;
            id v48 = v14;
            __int16 v49 = 2112;
            uint64_t v50 = (uint64_t)v39;
            double v41 = "InsertResponse for fetchId %{public}@ failed to build transparentData: %@";
          }

          _os_log_impl((void *)&_mh_execute_header, v38, OS_LOG_TYPE_ERROR, v41, buf, 0x16u);
          goto LABEL_41;
        }

        if (qword_1002EED60 != -1) {
          dispatch_once(&qword_1002EED60, &stru_1002880D8);
        }
        uint64_t v37 = qword_1002EED68;
        if (os_log_type_enabled((os_log_t)qword_1002EED68, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138543362;
          id v48 = v14;
          __int128 v34 = "Pending SMT verification failed for fetchId %{public}@";
          __int128 v35 = (os_log_s *)v37;
          uint32_t v36 = 12;
          goto LABEL_25;
        }
      }

      else
      {
        if (qword_1002EED60 != -1) {
          dispatch_once(&qword_1002EED60, &stru_1002880B8);
        }
        uint64_t v33 = qword_1002EED68;
        if (os_log_type_enabled((os_log_t)qword_1002EED68, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138543874;
          id v48 = v14;
          __int16 v49 = 2160;
          uint64_t v50 = 1752392040LL;
          __int16 v51 = 2112;
          id v52 = v13;
          __int128 v34 = "InsertResponse for fetchId %{public}@ failed uri witness verification: %{mask.hash}@";
          __int128 v35 = (os_log_s *)v33;
          uint32_t v36 = 32;
LABEL_25:
          _os_log_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_ERROR, v34, buf, v36);
        }
      }
    }

    else
    {
      if (qword_1002EED60 != -1) {
        dispatch_once(&qword_1002EED60, &stru_100288098);
      }
      id v32 = (os_log_s *)qword_1002EED68;
      if (os_log_type_enabled((os_log_t)qword_1002EED68, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543362;
        id v48 = v14;
        _os_log_impl( (void *)&_mh_execute_header,  v32,  OS_LOG_TYPE_ERROR,  "InsertResponse for fetchId %{public}@ waiting for keystore refresh",  buf,  0xCu);
      }

      unint64_t v20 = 2LL;
    }
  }

  else
  {
    unint64_t v20 = v16;
    if (qword_1002EED60 != -1) {
      dispatch_once(&qword_1002EED60, &stru_100288078);
    }
    BOOL v30 = (void *)qword_1002EED68;
    if (os_log_type_enabled((os_log_t)qword_1002EED68, OS_LOG_TYPE_ERROR))
    {
      BOOL v31 = v30;
      *(_DWORD *)buf = 138543618;
      id v48 = v14;
      __int16 v49 = 1024;
      LODWORD(v50) = [v12 status];
      _os_log_impl( (void *)&_mh_execute_header,  v31,  OS_LOG_TYPE_ERROR,  "InsertResponse for fetchId %{public}@ server error: %d",  buf,  0x12u);
    }
  }

- (id)createErrorFromSTHFailure:(id)a3 underlyingError:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 errorDomain]);
  id v8 = [v6 errorCode];

  id v9 = (void *)objc_claimAutoreleasedReturnValue( +[TransparencyError errorWithDomain:code:underlyingError:description:]( &OBJC_CLASS___TransparencyError,  "errorWithDomain:code:underlyingError:description:",  v7,  v8,  v5,  0LL));
  return v9;
}

- (id)createChainOfErrorsFromSTHFailures:(id)a3 type:(unint64_t)a4
{
  id v6 = a3;
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  __int128 v18 = 0u;
  __int128 v19 = 0u;
  id v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "allObjects", 0));
  id v8 = [v7 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v8)
  {
    id v9 = v8;
    id v10 = 0LL;
    uint64_t v11 = *(void *)v17;
    do
    {
      for (i = 0LL; i != v9; i = (char *)i + 1)
      {
        if (*(void *)v17 != v11) {
          objc_enumerationMutation(v7);
        }
        id v13 = *(void **)(*((void *)&v16 + 1) + 8LL * (void)i);
        if ([v13 verificationType] == (id)a4)
        {
          uint64_t v14 = objc_claimAutoreleasedReturnValue( -[KTContextVerifier createErrorFromSTHFailure:underlyingError:]( self,  "createErrorFromSTHFailure:underlyingError:",  v13,  v10));

          id v10 = (void *)v14;
        }
      }

      id v9 = [v7 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }

    while (v9);
  }

  else
  {
    id v10 = 0LL;
  }

  return v10;
}

- (id)failExpiredSTHsForType:(unint64_t)a3 error:(id *)a4
{
  uint64_t v21 = 0LL;
  id v22 = &v21;
  uint64_t v23 = 0x3032000000LL;
  id v24 = sub_1001B4098;
  unint64_t v25 = sub_1001B40A8;
  id v26 = 0LL;
  id v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  id v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSDate dateWithTimeIntervalSinceNow:]( &OBJC_CLASS___NSDate,  "dateWithTimeIntervalSinceNow:",  (double)(uint64_t)-kKTMaximumSTHProofDelay));
  id v9 = (void *)objc_claimAutoreleasedReturnValue(-[KTContextVerifier dataStore](self, "dataStore"));
  id v10 = (void *)objc_claimAutoreleasedReturnValue(-[KTContextVerifier applicationID](self, "applicationID"));
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472LL;
  v16[2] = sub_1001B40B0;
  v16[3] = &unk_100288B90;
  unint64_t v19 = a3;
  unint64_t v20 = a4;
  v16[4] = self;
  __int128 v18 = &v21;
  id v11 = v7;
  id v17 = v11;
  [v9 performForPendingSTHs:v10 olderThan:v8 type:a3 error:a4 block:v16];

  if (a4)
  {
    id v12 = (void *)v22[5];
    if (v12) {
      *a4 = v12;
    }
  }

  if ([v11 count]) {
    id v13 = v11;
  }
  else {
    id v13 = 0LL;
  }
  id v14 = v13;

  _Block_object_dispose(&v21, 8);
  return v14;
}

- (unint64_t)verifyLogConsistencyResponse:(id)a3 startRevision:(int64_t)a4 receivedRevisions:(id)a5 forwards:(BOOL)a6 serverHint:(id)a7 error:(id *)a8
{
  BOOL v10 = a6;
  id v14 = a3;
  id v15 = a5;
  id v16 = a7;
  id v17 = objc_alloc(&OBJC_CLASS___TransparencyConsistencyProofVerifier);
  __int128 v18 = (void *)objc_claimAutoreleasedReturnValue(-[KTContextVerifier applicationKeyStore](self, "applicationKeyStore"));
  unint64_t v19 = (void *)objc_claimAutoreleasedReturnValue([v18 appSthKeyStore]);
  unint64_t v20 = -[TransparencyConsistencyProofVerifier initWithTrustedKeyStore:](v17, "initWithTrustedKeyStore:", v19);

  [v14 setVerifier:v20];
  uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue(-[KTContextVerifier dataStore](self, "dataStore"));
  [v14 setDataStore:v21];

  id v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLongLong:](&OBJC_CLASS___NSNumber, "numberWithLongLong:", a4));
  [v14 setStartRevision:v22];

  [v14 setMetadataValue:v16 key:kTransparencyResponseMetadataKeyServerHint];
  [v14 setForwards:v10];
  uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue(-[KTContextVerifier context](self, "context"));
  id v24 = (void *)objc_claimAutoreleasedReturnValue([v23 optInServer]);
  [v14 setOptInServer:v24];

  unint64_t v25 = (void *)objc_claimAutoreleasedReturnValue(-[KTContextVerifier context](self, "context"));
  id v26 = (void *)objc_claimAutoreleasedReturnValue([v25 followUp]);
  [v14 setFollowUp:v26];

  if ([v14 hasStartSlh])
  {
    uint64_t v27 = (void *)objc_claimAutoreleasedReturnValue([v14 startSlh]);

    if (v27)
    {
      id v28 = (void *)objc_claimAutoreleasedReturnValue([v14 startSlh]);
      unsigned int v29 = (void *)objc_claimAutoreleasedReturnValue(+[SignedLogHead signedTypeWithObject:](&OBJC_CLASS___SignedLogHead, "signedTypeWithObject:", v28));

      if (v15)
      {
        BOOL v30 = (void *)objc_claimAutoreleasedReturnValue([v29 parsedLogHead]);
        BOOL v31 = v30;
        if (v30)
        {
          id v32 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedLongLong:]( NSNumber,  "numberWithUnsignedLongLong:",  [v30 revision]));
          [v15 addObject:v32];
        }
      }

      uint64_t v33 = (void *)objc_claimAutoreleasedReturnValue([v14 startSlh]);
      -[KTContextVerifier checkHeadEpoch:](self, "checkHeadEpoch:", v33);
    }
  }

  if ([v14 hasEndSlh])
  {
    __int128 v34 = (void *)objc_claimAutoreleasedReturnValue([v14 endSlh]);

    if (v34)
    {
      __int128 v35 = (void *)objc_claimAutoreleasedReturnValue([v14 endSlh]);
      uint32_t v36 = (void *)objc_claimAutoreleasedReturnValue(+[SignedLogHead signedTypeWithObject:](&OBJC_CLASS___SignedLogHead, "signedTypeWithObject:", v35));

      if (v15)
      {
        uint64_t v37 = (void *)objc_claimAutoreleasedReturnValue([v36 parsedLogHead]);
        id v38 = v37;
        if (v37)
        {
          id v39 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedLongLong:]( NSNumber,  "numberWithUnsignedLongLong:",  [v37 revision]));
          [v15 addObject:v39];
        }
      }

      id v40 = (void *)objc_claimAutoreleasedReturnValue([v14 endSlh]);
      -[KTContextVerifier checkHeadEpoch:](self, "checkHeadEpoch:", v40);
    }
  }

  id v41 = [v14 verifyWithError:a8];

  return (unint64_t)v41;
}

- (unint64_t)verifyConsistencyProofResponse:(id)a3 startRevision:(int64_t)a4 receivedRevisions:(id)a5 error:(id *)a6
{
  id v10 = a3;
  id v53 = a5;
  id v11 = (void *)objc_claimAutoreleasedReturnValue([v10 metadata]);
  id v12 = (void *)objc_claimAutoreleasedReturnValue([v11 objectForKeyedSubscript:kTransparencyResponseMetadataKeyServerHint]);

  LODWORD(v11) = [v10 application];
  unsigned int v13 = [v10 logType];
  if ((_DWORD)v11)
  {
    if (v13 != 2
      || (id v14 = (void *)objc_claimAutoreleasedReturnValue(-[KTContextVerifier applicationID](self, "applicationID")),
          id v15 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithInt:]( NSNumber,  "numberWithInt:",  [v10 application])),  v16 = (void *)objc_claimAutoreleasedReturnValue( +[TransparencyApplication applicationIdentifierForValue:]( TransparencyApplication,  "applicationIdentifierForValue:",  v15)),  v17 = objc_msgSend(v14, "isEqualToString:", v16),  v16,  v15,  v14,  (v17 & 1) == 0))
    {
      if (a6) {
        *a6 = (id)objc_claimAutoreleasedReturnValue( +[TransparencyError errorWithDomain:code:description:]( &OBJC_CLASS___TransparencyError,  "errorWithDomain:code:description:",  kTransparencyErrorDecode,  -187LL,  @"LogConsistencyResponse for wrong application or tree"));
      }
      if (qword_1002EEDE0 != -1) {
        dispatch_once(&qword_1002EEDE0, &stru_100288BD0);
      }
      __int128 v18 = v53;
      unint64_t v19 = (os_log_s *)qword_1002EEDE8;
      if (!os_log_type_enabled((os_log_t)qword_1002EEDE8, OS_LOG_TYPE_ERROR)) {
        goto LABEL_39;
      }
      __int16 v54 = 0;
      unint64_t v20 = "LogConsistencyResponse for wrong application or tree";
      uint64_t v21 = (uint8_t *)&v54;
LABEL_38:
      _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_ERROR, v20, v21, 2u);
LABEL_39:
      unint64_t v39 = 0LL;
      goto LABEL_40;
    }
  }

  else if (v13 != 3 {
         || (id v22 = (void *)objc_claimAutoreleasedReturnValue(-[KTContextVerifier applicationID](self, "applicationID")),
  }
             unsigned __int8 v23 = [v22 isEqualToString:kKTApplicationIdentifierTLT],
             v22,
             (v23 & 1) == 0))
  {
    if (a6) {
      *a6 = (id)objc_claimAutoreleasedReturnValue( +[TransparencyError errorWithDomain:code:description:]( &OBJC_CLASS___TransparencyError,  "errorWithDomain:code:description:",  kTransparencyErrorDecode,  -186LL,  @"LogConsistencyResponse omits application, but log type or verifier is not TLT"));
    }
    if (qword_1002EEDE0 != -1) {
      dispatch_once(&qword_1002EEDE0, &stru_100288BB0);
    }
    __int128 v18 = v53;
    unint64_t v19 = (os_log_s *)qword_1002EEDE8;
    if (!os_log_type_enabled((os_log_t)qword_1002EEDE8, OS_LOG_TYPE_ERROR)) {
      goto LABEL_39;
    }
    *(_WORD *)buf = 0;
    unint64_t v20 = "LogConsistencyResponse omits application, but log type or verifier is not TLT";
    uint64_t v21 = buf;
    goto LABEL_38;
  }

  if (!objc_msgSend(v10, "responsesArray_Count"))
  {
    unint64_t v39 = 1LL;
    goto LABEL_42;
  }

  unint64_t v24 = 0LL;
  unint64_t v52 = 0x7FFFFFFFFFFFFFFFLL;
  __int128 v18 = v53;
  do
  {
    unint64_t v25 = (void *)objc_claimAutoreleasedReturnValue([v10 responsesArray]);
    id v26 = (void *)objc_claimAutoreleasedReturnValue([v25 objectAtIndexedSubscript:v24]);

    if ([v26 hasStartSlh])
    {
      uint64_t v27 = (void *)objc_claimAutoreleasedReturnValue([v26 startSlh]);
      if (v27 && ([v26 hasEndSlh] & 1) != 0)
      {
        id v28 = (void *)objc_claimAutoreleasedReturnValue([v26 endSlh]);

        if (v28)
        {
          unsigned int v29 = (void *)objc_claimAutoreleasedReturnValue([v26 startSlh]);
          BOOL v30 = (void *)objc_claimAutoreleasedReturnValue( +[SignedLogHead signedTypeWithObject:]( &OBJC_CLASS___SignedLogHead,  "signedTypeWithObject:",  v29));

          uint64_t v50 = v30;
          BOOL v31 = (void *)objc_claimAutoreleasedReturnValue([v30 parsedLogHead]);
          id v32 = (void *)objc_claimAutoreleasedReturnValue([v26 endSlh]);
          uint64_t v33 = (void *)objc_claimAutoreleasedReturnValue( +[SignedLogHead signedTypeWithObject:]( &OBJC_CLASS___SignedLogHead,  "signedTypeWithObject:",  v32));

          __int128 v34 = (void *)objc_claimAutoreleasedReturnValue([v33 parsedLogHead]);
          __int16 v49 = v31;
          if ([v31 revision] == (id)a4)
          {
            int v35 = 1;
            unint64_t v52 = v24;
          }

          else if (v52 == 0x7FFFFFFFFFFFFFFFLL)
          {
            id v37 = [v34 revision];
            int v35 = 0;
            uint64_t v38 = 0x7FFFFFFFFFFFFFFFLL;
            if (v37 == (id)a4) {
              uint64_t v38 = v24 + 1;
            }
            unint64_t v52 = v38;
          }

          else
          {
            int v35 = 1;
          }

          __int128 v18 = v53;
          if (!v35) {
            goto LABEL_22;
          }
        }

        else
        {
          __int128 v18 = v53;
        }
      }

      else
      {
      }
    }

    unint64_t v36 = -[KTContextVerifier verifyLogConsistencyResponse:startRevision:receivedRevisions:forwards:serverHint:error:]( self,  "verifyLogConsistencyResponse:startRevision:receivedRevisions:forwards:serverHint:error:",  v26,  a4,  v18,  1LL,  v12,  a6);
    if (v36 != 1)
    {
      unint64_t v39 = v36;

      goto LABEL_40;
    }

- (id)verifySTHs:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v47 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  __int128 v54 = 0u;
  __int128 v55 = 0u;
  __int128 v56 = 0u;
  __int128 v57 = 0u;
  id v7 = v6;
  id v8 = [v7 countByEnumeratingWithState:&v54 objects:v60 count:16];
  if (!v8)
  {

    id v10 = 0LL;
    goto LABEL_38;
  }

  id v9 = v8;
  __int128 v45 = a4;
  id v10 = 0LL;
  uint64_t v48 = *(void *)v55;
  id obj = v7;
  do
  {
    id v11 = 0LL;
    do
    {
      if (*(void *)v55 != v48) {
        objc_enumerationMutation(obj);
      }
      id v12 = *(void **)(*((void *)&v54 + 1) + 8LL * (void)v11);
      unsigned int v13 = objc_autoreleasePoolPush();
      uint64_t v14 = objc_claimAutoreleasedReturnValue([v12 sth]);
      if (v14
        && (id v15 = (void *)v14, v16 = [v12 isMapHead], v15, (v16 & 1) == 0))
      {
        __int16 v49 = v13;
        __int128 v18 = &OBJC_CLASS___SignedLogHead;
        unint64_t v19 = (void *)objc_claimAutoreleasedReturnValue([v12 sth]);
        id v53 = v10;
        unint64_t v20 = &v53;
        uint64_t v21 = &v53;
      }

      else
      {
        unsigned __int8 v17 = (void *)objc_claimAutoreleasedReturnValue([v12 sth]);

        if (!v17) {
          goto LABEL_18;
        }
        __int16 v49 = v13;
        __int128 v18 = &OBJC_CLASS___SignedMapHead;
        unint64_t v19 = (void *)objc_claimAutoreleasedReturnValue([v12 sth]);
        id v52 = v10;
        unint64_t v20 = &v52;
        uint64_t v21 = &v52;
      }

      id v22 = (void *)objc_claimAutoreleasedReturnValue(-[__objc2_class parseFromData:error:](v18, "parseFromData:error:", v19, v21));
      id v23 = *v20;

      if (!v22)
      {
        id v10 = v23;
        unsigned int v13 = v49;
LABEL_18:
        unint64_t v36 = (void *)objc_claimAutoreleasedReturnValue([v12 sth]);
        [v47 addObject:v36];

        id v22 = (void *)objc_claimAutoreleasedReturnValue(-[KTContextVerifier dataStore](self, "dataStore"));
        [v22 deleteObject:v12];
        goto LABEL_32;
      }

      unint64_t v24 = (void *)objc_claimAutoreleasedReturnValue(-[KTContextVerifier applicationKeyStore](self, "applicationKeyStore"));
      unint64_t v25 = (void *)objc_claimAutoreleasedReturnValue([v24 appSthKeyStore]);
      id v26 = (void *)objc_claimAutoreleasedReturnValue([v25 signatureVerifier]);
      [v22 setVerifier:v26];

      id v51 = v23;
      id v27 = [v22 verifyWithError:&v51];
      id v10 = v51;

      [v12 setUnsigned:"signatureVerified" value:v27];
      if ([v12 signatureVerified] == (id)1)
      {
        double Current = CFAbsoluteTimeGetCurrent();
        [v12 receiptTime];
        double v30 = Current - v29;
        else {
          BOOL v31 = @"VerifySTHTime";
        }
        id v32 = (void *)objc_claimAutoreleasedReturnValue(-[KTContextVerifier applicationID](self, "applicationID"));
        uint64_t v33 = (void *)objc_claimAutoreleasedReturnValue( +[TransparencyAnalytics formatEventName:application:]( &OBJC_CLASS___TransparencyAnalytics,  "formatEventName:application:",  v31,  v32));

        __int128 v34 = (void *)objc_claimAutoreleasedReturnValue(+[TransparencyAnalytics logger](&OBJC_CLASS___TransparencyAnalytics, "logger"));
        int v35 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", v30));
        [v34 logMetric:v35 withName:v33];
      }

      else
      {
        if ([v12 signatureVerified]) {
          goto LABEL_22;
        }
        uint64_t v33 = (void *)objc_claimAutoreleasedReturnValue([v12 sth]);
        [v47 addObject:v33];
      }

LABEL_22:
      id v37 = (void *)objc_claimAutoreleasedReturnValue(-[KTContextVerifier dataStore](self, "dataStore"));
      id v50 = 0LL;
      unsigned __int8 v38 = [v37 persistAndRefaultObject:v12 error:&v50];
      id v39 = v50;

      if ((v38 & 1) != 0) {
        goto LABEL_30;
      }
      if (qword_1002EEDE0 != -1) {
        dispatch_once(&qword_1002EEDE0, &stru_100288BF0);
      }
      id v40 = (os_log_s *)qword_1002EEDE8;
      if (os_log_type_enabled((os_log_t)qword_1002EEDE8, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        id v59 = v39;
        _os_log_impl( (void *)&_mh_execute_header,  v40,  OS_LOG_TYPE_ERROR,  "failed to save signature verified STHs: %@",  buf,  0xCu);
      }

      if (!v39)
      {
LABEL_30:
        unsigned int v13 = v49;
      }

      else
      {
        unint64_t v41 = (void *)objc_claimAutoreleasedReturnValue(-[KTContextVerifier dataStore](self, "dataStore"));
        [v41 reportCoreDataPersistEventForLocation:@"verifySTHs" underlyingError:v39];

        unsigned int v13 = v49;
        if (!v10) {
          id v10 = v39;
        }
      }

LABEL_32:
      objc_autoreleasePoolPop(v13);
      id v11 = (char *)v11 + 1;
    }

    while (v9 != v11);
    id v7 = obj;
    id v9 = [obj countByEnumeratingWithState:&v54 objects:v60 count:16];
  }

  while (v9);

  if (v45 && v10)
  {
    id v10 = v10;
    *__int128 v45 = v10;
  }

- (BOOL)setInclusionVerifiedState:(unint64_t)a3 perApplicationTreeLogEntry:(id)a4 failure:(id)a5 error:(id *)a6
{
  id v10 = a4;
  id v11 = a5;
  uint64_t v50 = 0LL;
  id v51 = &v50;
  uint64_t v52 = 0x2020000000LL;
  char v53 = 1;
  id v12 = (void *)objc_claimAutoreleasedReturnValue([v10 nodeBytes]);
  unsigned int v13 = (void *)objc_claimAutoreleasedReturnValue( +[TransparencyGPBMessage parseFromData:error:]( &OBJC_CLASS___PerApplicationTreeNode,  "parseFromData:error:",  v12,  a6));

  if (!v13)
  {
    if (qword_1002EEDE0 != -1) {
      dispatch_once(&qword_1002EEDE0, &stru_100288C10);
    }
    uint64_t v14 = (os_log_s *)qword_1002EEDE8;
    if (os_log_type_enabled((os_log_t)qword_1002EEDE8, OS_LOG_TYPE_ERROR))
    {
      if (a6) {
        id v15 = *a6;
      }
      else {
        id v15 = 0LL;
      }
      LODWORD(buf) = 138412290;
      *(void *)((char *)&buf + 4) = v15;
      _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_ERROR,  "failed to parse PAT node from revision log inclusion proof: %@",  (uint8_t *)&buf,  0xCu);
    }

    *((_BYTE *)v51 + 24) = 0;
  }

  *(void *)&__int128 buf = 0LL;
  *((void *)&buf + 1) = &buf;
  uint64_t v57 = 0x3032000000LL;
  __int128 v58 = sub_1001B4098;
  id v59 = sub_1001B40A8;
  id v60 = 0LL;
  if (([v13 hasObjectMapHead] & 1) == 0)
  {
    if (qword_1002EEDE0 != -1) {
      dispatch_once(&qword_1002EEDE0, &stru_100288C30);
    }
    unsigned __int8 v16 = (os_log_s *)qword_1002EEDE8;
    if (os_log_type_enabled((os_log_t)qword_1002EEDE8, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)char v46 = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_ERROR,  "Per application tree node is missing map head",  v46,  2u);
    }

    if (a6) {
      *a6 = (id)objc_claimAutoreleasedReturnValue( +[TransparencyError errorWithDomain:code:description:]( &OBJC_CLASS___TransparencyError,  "errorWithDomain:code:description:",  @"TransparencyErrorVerify",  -203LL,  @"Per application tree node is missing map head"));
    }
    *((_BYTE *)v51 + 24) = 0;
  }

  *(void *)char v46 = 0LL;
  id v47 = v46;
  uint64_t v48 = 0x2020000000LL;
  uint64_t v49 = 0LL;
  if ([v13 hasObjectMapHead])
  {
    unsigned __int8 v17 = (void *)objc_claimAutoreleasedReturnValue(-[KTContextVerifier dataStore](self, "dataStore"));
    v36[0] = _NSConcreteStackBlock;
    v36[1] = 3221225472LL;
    v36[2] = sub_1001B5B38;
    v36[3] = &unk_100288CB8;
    id v37 = v13;
    unsigned __int8 v38 = self;
    id v39 = v10;
    p___int128 buf = &buf;
    unint64_t v44 = a3;
    id v40 = v11;
    unint64_t v42 = v46;
    __int128 v45 = a6;
    id v43 = &v50;
    [v17 performBlockAndWait:v36];
  }

  __int128 v18 = (void *)objc_claimAutoreleasedReturnValue(-[KTContextVerifier applicationID](self, "applicationID"));
  unint64_t v19 = (void *)objc_claimAutoreleasedReturnValue( +[TransparencyAnalytics formatEventName:application:]( &OBJC_CLASS___TransparencyAnalytics,  "formatEventName:application:",  @"VerifyPATInclusionProofEvent",  v18));

  if (!+[TransparencyAnalytics hasInternalDiagnostics]( &OBJC_CLASS___TransparencyAnalytics,  "hasInternalDiagnostics")
    || (unint64_t v20 = (void *)objc_claimAutoreleasedReturnValue([v10 metadata]),
        uint64_t v21 = kTransparencyResponseMetadataKeyServerHint,
        id v22 = (void *)objc_claimAutoreleasedReturnValue([v20 objectForKeyedSubscript:kTransparencyResponseMetadataKeyServerHint]),
        BOOL v23 = v22 == 0LL,
        v22,
        v20,
        v23))
  {
    id v26 = 0LL;
  }

  else
  {
    uint64_t v54 = v21;
    unint64_t v24 = (void *)objc_claimAutoreleasedReturnValue([v10 metadata]);
    unint64_t v25 = (void *)objc_claimAutoreleasedReturnValue([v24 objectForKeyedSubscript:v21]);
    __int128 v55 = v25;
    id v26 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v55,  &v54,  1LL));
  }

  id v27 = (void *)objc_claimAutoreleasedReturnValue(+[TransparencyAnalytics logger](&OBJC_CLASS___TransparencyAnalytics, "logger"));
  [v27 logResultForEvent:v19 hardFailure:a3 == 0 result:v11 withAttributes:v26];

  if (a3 == 1 && *((double *)v47 + 3) != 0.0)
  {
    double Current = CFAbsoluteTimeGetCurrent();
    double v29 = *((double *)v47 + 3);
    double v30 = (void *)objc_claimAutoreleasedReturnValue(+[TransparencyAnalytics logger](&OBJC_CLASS___TransparencyAnalytics, "logger"));
    BOOL v31 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", Current - v29));
    id v32 = (void *)objc_claimAutoreleasedReturnValue(-[KTContextVerifier applicationID](self, "applicationID"));
    uint64_t v33 = (void *)objc_claimAutoreleasedReturnValue( +[TransparencyAnalytics formatEventName:application:]( &OBJC_CLASS___TransparencyAnalytics,  "formatEventName:application:",  @"PatInclusionProofTime",  v32));
    [v30 logMetric:v31 withName:v33];
  }

  BOOL v34 = *((_BYTE *)v51 + 24) != 0;

  _Block_object_dispose(v46, 8);
  _Block_object_dispose(&buf, 8);

  _Block_object_dispose(&v50, 8);
  return v34;
}

- (BOOL)setInclusionVerifiedState:(unint64_t)a3 topLevelTreeLogEntry:(id)a4 failure:(id)a5 error:(id *)a6
{
  id v10 = a4;
  id v11 = a5;
  uint64_t v44 = 0LL;
  __int128 v45 = &v44;
  uint64_t v46 = 0x2020000000LL;
  char v47 = 1;
  id v12 = (void *)objc_claimAutoreleasedReturnValue([v10 nodeBytes]);
  unsigned int v13 = (void *)objc_claimAutoreleasedReturnValue( +[TransparencyGPBMessage parseFromData:error:]( &OBJC_CLASS___TopLevelTreeNode,  "parseFromData:error:",  v12,  a6));

  if (!v13)
  {
    if (qword_1002EEDE0 != -1) {
      dispatch_once(&qword_1002EEDE0, &stru_100288CD8);
    }
    uint64_t v14 = (os_log_s *)qword_1002EEDE8;
    if (os_log_type_enabled((os_log_t)qword_1002EEDE8, OS_LOG_TYPE_ERROR))
    {
      if (a6) {
        id v15 = *a6;
      }
      else {
        id v15 = 0LL;
      }
      LODWORD(buf) = 138412290;
      *(void *)((char *)&buf + 4) = v15;
      _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_ERROR,  "failed to parse TLT node from revision log inclusion proof: %@",  (uint8_t *)&buf,  0xCu);
    }

    *((_BYTE *)v45 + 24) = 0;
  }

  *(void *)&__int128 buf = 0LL;
  *((void *)&buf + 1) = &buf;
  uint64_t v51 = 0x3032000000LL;
  uint64_t v52 = sub_1001B4098;
  char v53 = sub_1001B40A8;
  id v54 = 0LL;
  if (([v13 hasPatHead] & 1) == 0)
  {
    if (qword_1002EEDE0 != -1) {
      dispatch_once(&qword_1002EEDE0, &stru_100288CF8);
    }
    unsigned __int8 v16 = (os_log_s *)qword_1002EEDE8;
    if (os_log_type_enabled((os_log_t)qword_1002EEDE8, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)id v40 = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_ERROR,  "Top level tree node is missing PAT head",  v40,  2u);
    }

    if (a6) {
      *a6 = (id)objc_claimAutoreleasedReturnValue( +[TransparencyError errorWithDomain:code:description:]( &OBJC_CLASS___TransparencyError,  "errorWithDomain:code:description:",  @"TransparencyErrorVerify",  -204LL,  @"Top level tree node is missing PAT head"));
    }
    *((_BYTE *)v45 + 24) = 0;
  }

  *(void *)id v40 = 0LL;
  unint64_t v41 = v40;
  uint64_t v42 = 0x2020000000LL;
  uint64_t v43 = 0LL;
  if ([v13 hasPatHead])
  {
    unsigned __int8 v17 = (void *)objc_claimAutoreleasedReturnValue(-[KTContextVerifier dataStore](self, "dataStore"));
    v32[0] = _NSConcreteStackBlock;
    v32[1] = 3221225472LL;
    v32[2] = sub_1001B65F4;
    v32[3] = &unk_100288DA0;
    id v33 = v13;
    BOOL v34 = self;
    unint64_t v38 = a3;
    id v39 = a6;
    p___int128 buf = &buf;
    unint64_t v36 = v40;
    id v37 = &v44;
    [v17 performBlockAndWait:v32];
  }

  if (!+[TransparencyAnalytics hasInternalDiagnostics]( &OBJC_CLASS___TransparencyAnalytics,  "hasInternalDiagnostics")
    || (__int128 v18 = (void *)objc_claimAutoreleasedReturnValue([v10 metadata]),
        uint64_t v19 = kTransparencyResponseMetadataKeyServerHint,
        unint64_t v20 = (void *)objc_claimAutoreleasedReturnValue([v18 objectForKeyedSubscript:kTransparencyResponseMetadataKeyServerHint]),
        BOOL v21 = v20 == 0LL,
        v20,
        v18,
        v21))
  {
    unint64_t v24 = 0LL;
  }

  else
  {
    uint64_t v48 = v19;
    id v22 = (void *)objc_claimAutoreleasedReturnValue([v10 metadata]);
    BOOL v23 = (void *)objc_claimAutoreleasedReturnValue([v22 objectForKeyedSubscript:v19]);
    uint64_t v49 = v23;
    unint64_t v24 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v49,  &v48,  1LL));
  }

  unint64_t v25 = (void *)objc_claimAutoreleasedReturnValue(+[TransparencyAnalytics logger](&OBJC_CLASS___TransparencyAnalytics, "logger"));
  [v25 logResultForEvent:@"ktTLTVerifyInclusionProofEvent" hardFailure:a3 == 0 result:v11 withAttributes:v24];

  if (a3 == 1 && *((double *)v41 + 3) != 0.0)
  {
    double Current = CFAbsoluteTimeGetCurrent();
    double v27 = *((double *)v41 + 3);
    id v28 = (void *)objc_claimAutoreleasedReturnValue(+[TransparencyAnalytics logger](&OBJC_CLASS___TransparencyAnalytics, "logger"));
    double v29 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", Current - v27));
    [v28 logMetric:v29 withName:@"ktTLTInclusionProofTime"];
  }

  BOOL v30 = *((_BYTE *)v45 + 24) != 0;

  _Block_object_dispose(v40, 8);
  _Block_object_dispose(&buf, 8);

  _Block_object_dispose(&v44, 8);
  return v30;
}

- (BOOL)setInclusionVerifiedState:(unint64_t)a3 logEntry:(id)a4 failure:(id)a5 error:(id *)a6
{
  id v10 = a4;
  id v11 = a5;
  if ([v10 logType] == 2)
  {
    unsigned __int8 v12 = -[KTContextVerifier setInclusionVerifiedState:perApplicationTreeLogEntry:failure:error:]( self,  "setInclusionVerifiedState:perApplicationTreeLogEntry:failure:error:",  a3,  v10,  v11,  a6);
  }

  else
  {
    if ([v10 logType] != 3)
    {
      BOOL v13 = 0;
      goto LABEL_7;
    }

    unsigned __int8 v12 = -[KTContextVerifier setInclusionVerifiedState:topLevelTreeLogEntry:failure:error:]( self,  "setInclusionVerifiedState:topLevelTreeLogEntry:failure:error:",  a3,  v10,  v11,  a6);
  }

  BOOL v13 = v12;
LABEL_7:

  return v13;
}

- (unint64_t)verifyRevisionLogProofLogEntry:(id)a3 patSTH:(id *)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = (void *)objc_claimAutoreleasedReturnValue(-[KTContextVerifier dataStore](self, "dataStore"));
  [v8 setDataStore:v9];

  id v10 = (void *)objc_claimAutoreleasedReturnValue(-[KTContextVerifier context](self, "context"));
  id v11 = (void *)objc_claimAutoreleasedReturnValue([v10 optInServer]);
  [v8 setOptInServer:v11];

  if ([v8 logType] == 2)
  {
    unsigned __int8 v12 = objc_alloc(&OBJC_CLASS___TransparencyLogEntryVerifier);
    BOOL v13 = (void *)objc_claimAutoreleasedReturnValue(-[KTContextVerifier applicationKeyStore](self, "applicationKeyStore"));
    uint64_t v14 = objc_claimAutoreleasedReturnValue([v13 appSthKeyStore]);
LABEL_5:
    id v15 = (void *)v14;
    unsigned __int8 v16 = -[TransparencyLogEntryVerifier initWithTrustedKeyStore:](v12, "initWithTrustedKeyStore:", v14);
    [v8 setVerifier:v16];

    id v29 = 0LL;
    id v17 = [v8 verifyWithError:&v29];
    id v18 = v29;
    if (v17 == (id)1)
    {
      unsigned int v19 = [v8 logType];
      if (a4 && v19 == 2)
      {
        unint64_t v20 = (void *)objc_claimAutoreleasedReturnValue([v8 slh]);
        *a4 = (id)objc_claimAutoreleasedReturnValue( +[SignedLogHead signedTypeWithObject:]( &OBJC_CLASS___SignedLogHead,  "signedTypeWithObject:",  v20));
      }
    }

    else
    {
      if (qword_1002EEDE0 != -1) {
        dispatch_once(&qword_1002EEDE0, &stru_100288DE0);
      }
      BOOL v21 = (os_log_s *)qword_1002EEDE8;
      if (os_log_type_enabled((os_log_t)qword_1002EEDE8, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)__int128 buf = 138412290;
        id v31 = v18;
        _os_log_impl( (void *)&_mh_execute_header,  v21,  OS_LOG_TYPE_ERROR,  "failed to verify revision proof log entry: %@",  buf,  0xCu);
      }

      if (a5 && v18) {
        *a5 = v18;
      }
    }

    id v28 = 0LL;
    unsigned __int8 v22 = -[KTContextVerifier setInclusionVerifiedState:logEntry:failure:error:]( self,  "setInclusionVerifiedState:logEntry:failure:error:",  v17,  v8,  v18,  &v28);
    id v23 = v28;
    if ((v22 & 1) == 0)
    {
      if (qword_1002EEDE0 != -1) {
        dispatch_once(&qword_1002EEDE0, &stru_100288E00);
      }
      unint64_t v24 = (os_log_s *)qword_1002EEDE8;
      if (os_log_type_enabled((os_log_t)qword_1002EEDE8, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)__int128 buf = 138412290;
        id v31 = v23;
        _os_log_impl( (void *)&_mh_execute_header,  v24,  OS_LOG_TYPE_ERROR,  "failed to set inclusion verification state for log entry: %@",  buf,  0xCu);
      }
    }

    goto LABEL_22;
  }

  if ([v8 logType] == 3)
  {
    unsigned __int8 v12 = objc_alloc(&OBJC_CLASS___TransparencyLogEntryVerifier);
    BOOL v13 = (void *)objc_claimAutoreleasedReturnValue(-[KTContextVerifier applicationKeyStore](self, "applicationKeyStore"));
    uint64_t v14 = objc_claimAutoreleasedReturnValue([v13 tltKeyStore]);
    goto LABEL_5;
  }

  if (qword_1002EEDE0 != -1) {
    dispatch_once(&qword_1002EEDE0, &stru_100288DC0);
  }
  id v26 = (void *)qword_1002EEDE8;
  if (os_log_type_enabled((os_log_t)qword_1002EEDE8, OS_LOG_TYPE_ERROR))
  {
    double v27 = v26;
    *(_DWORD *)__int128 buf = 67109120;
    LODWORD(v31) = [v8 logType];
    _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_ERROR, "Unknown log type in log entry: %d", buf, 8u);
  }

  id v17 = 0LL;
  if (a5) {
    *a5 = (id)objc_claimAutoreleasedReturnValue( +[TransparencyError errorWithDomain:code:description:]( TransparencyError,  "errorWithDomain:code:description:",  kTransparencyErrorDecode,  -205,  @"Unknown log type in log entry: %d",  [v8 logType]));
  }
LABEL_22:

  return (unint64_t)v17;
}

- (unint64_t)verifyRevisionLogTopLevelProof:(id)a3 patSTH:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = (void *)objc_claimAutoreleasedReturnValue(-[KTContextVerifier dataStore](self, "dataStore"));
  [v8 setDataStore:v10];

  id v11 = (void *)objc_claimAutoreleasedReturnValue(-[KTContextVerifier context](self, "context"));
  unsigned __int8 v12 = (void *)objc_claimAutoreleasedReturnValue([v11 optInServer]);
  [v8 setOptInServer:v12];

  BOOL v13 = objc_alloc(&OBJC_CLASS___TransparencyLogEntryVerifier);
  uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue(-[KTContextVerifier applicationKeyStore](self, "applicationKeyStore"));
  id v15 = (void *)objc_claimAutoreleasedReturnValue([v14 tltKeyStore]);
  unsigned __int8 v16 = -[TransparencyLogEntryVerifier initWithTrustedKeyStore:](v13, "initWithTrustedKeyStore:", v15);
  [v8 setVerifier:v16];

  if (v9)
  {
    id v26 = 0LL;
    id v17 = [v8 verifyTLTEntryForPerApplicationLogHead:v9 error:&v26];
    id v18 = v26;
  }

  else
  {
    id v25 = 0LL;
    id v17 = [v8 verifyWithError:&v25];
    id v18 = v25;
    id v24 = 0LL;
    unsigned __int8 v19 = -[KTContextVerifier setInclusionVerifiedState:logEntry:failure:error:]( self,  "setInclusionVerifiedState:logEntry:failure:error:",  v17,  v8,  v18,  &v24);
    id v20 = v24;
    if ((v19 & 1) == 0)
    {
      if (qword_1002EEDE0 != -1) {
        dispatch_once(&qword_1002EEDE0, &stru_100288E20);
      }
      BOOL v21 = (os_log_s *)qword_1002EEDE8;
      if (os_log_type_enabled((os_log_t)qword_1002EEDE8, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)__int128 buf = 138412290;
        id v28 = v20;
        _os_log_impl( (void *)&_mh_execute_header,  v21,  OS_LOG_TYPE_ERROR,  "failed to set inclusion verified state: %@",  buf,  0xCu);
      }
    }
  }

  if (v17 != (id)1)
  {
    if (qword_1002EEDE0 != -1) {
      dispatch_once(&qword_1002EEDE0, &stru_100288E40);
    }
    unsigned __int8 v22 = (os_log_s *)qword_1002EEDE8;
    if (os_log_type_enabled((os_log_t)qword_1002EEDE8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)__int128 buf = 138412290;
      id v28 = v18;
      _os_log_impl( (void *)&_mh_execute_header,  v22,  OS_LOG_TYPE_ERROR,  "failed to verify revision proof tlt entry: %@",  buf,  0xCu);
    }

    if (a5 && v18) {
      *a5 = v18;
    }
  }

  return (unint64_t)v17;
}

- (BOOL)verifyRevisionLogInclusionProofResponse:(id)a3 receivedRevisions:(id)a4 error:(id *)a5
{
  id v6 = a3;
  id v7 = a4;
  __int128 v54 = 0u;
  __int128 v55 = 0u;
  __int128 v56 = 0u;
  __int128 v57 = 0u;
  id obj = (id)objc_claimAutoreleasedReturnValue([v6 logEntryArray]);
  id v8 = [obj countByEnumeratingWithState:&v54 objects:v58 count:16];
  id v43 = v6;
  uint64_t v44 = v7;
  if (!v8)
  {
    id v10 = 0LL;
    goto LABEL_24;
  }

  id v9 = v8;
  id v10 = 0LL;
  uint64_t v46 = *(void *)v55;
  uint64_t v11 = kTransparencyResponseMetadataKeyServerHint;
  while (2)
  {
    unsigned __int8 v12 = 0LL;
    BOOL v13 = v10;
    do
    {
      if (*(void *)v55 != v46) {
        objc_enumerationMutation(obj);
      }
      uint64_t v14 = *(void **)(*((void *)&v54 + 1) + 8LL * (void)v12);
      if (objc_msgSend(v14, "hasSlh", v43))
      {
        id v15 = (void *)objc_claimAutoreleasedReturnValue([v14 slh]);

        if (v15)
        {
          unsigned __int8 v16 = (void *)objc_claimAutoreleasedReturnValue([v14 slh]);
          -[KTContextVerifier checkHeadEpoch:](self, "checkHeadEpoch:", v16);
        }
      }

      id v17 = (void *)objc_claimAutoreleasedReturnValue([v6 metadata]);
      id v18 = (void *)objc_claimAutoreleasedReturnValue([v17 objectForKeyedSubscript:v11]);
      [v14 setMetadataValue:v18 key:v11];

      if (v7)
      {
        unsigned __int8 v19 = (void *)objc_claimAutoreleasedReturnValue([v14 nodeBytes]);
        id v20 = [v19 length];

        if (v20)
        {
          if ([v14 logType] == 3)
          {
            BOOL v21 = (void *)objc_claimAutoreleasedReturnValue([v14 nodeBytes]);
            unsigned __int8 v22 = (void *)objc_claimAutoreleasedReturnValue( +[TransparencyGPBMessage parseFromData:error:]( &OBJC_CLASS___TopLevelTreeNode,  "parseFromData:error:",  v21,  0LL));

            id v23 = (void *)objc_claimAutoreleasedReturnValue([v22 patHead]);
            id v24 = (void *)objc_claimAutoreleasedReturnValue([v23 object]);
            id v25 = (void *)objc_claimAutoreleasedReturnValue( +[TransparencyGPBMessage parseFromData:error:]( &OBJC_CLASS___LogHead,  "parseFromData:error:",  v24,  0LL));

            id v7 = v44;
          }

          else
          {
            id v26 = (void *)objc_claimAutoreleasedReturnValue([v14 nodeBytes]);
            unsigned __int8 v22 = (void *)objc_claimAutoreleasedReturnValue( +[TransparencyGPBMessage parseFromData:error:]( &OBJC_CLASS___PerApplicationTreeNode,  "parseFromData:error:",  v26,  0LL));

            id v23 = (void *)objc_claimAutoreleasedReturnValue([v22 objectMapHead]);
            double v27 = (void *)objc_claimAutoreleasedReturnValue([v23 object]);
            id v7 = v44;
            id v25 = (void *)objc_claimAutoreleasedReturnValue( +[TransparencyGPBMessage parseFromData:error:]( &OBJC_CLASS___MapHead,  "parseFromData:error:",  v27,  0LL));
          }

          if (v25)
          {
            id v28 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedLongLong:]( NSNumber,  "numberWithUnsignedLongLong:",  [v25 revision]));
            [v7 addObject:v28];
          }

          id v6 = v43;
        }
      }

- (void)checkHeadEpoch:(id)a3
{
  unsigned int v4 = (void *)objc_claimAutoreleasedReturnValue(+[SignedLogHead signedTypeWithObject:](&OBJC_CLASS___SignedLogHead, "signedTypeWithObject:", a3));
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 parsedLogHead]);
  id v6 = v5;
  if (v5)
  {
    unsigned int v7 = [v5 logType];
    id v8 = [v6 logBeginningMs];
    id v9 = (void *)objc_claimAutoreleasedReturnValue(-[KTContextVerifier applicationKeyStore](self, "applicationKeyStore"));
    id v10 = v9;
    if (v7 == 3)
    {
      id v11 = [v9 tltLogBeginningMs];

      if (v8 > v11)
      {
        if (qword_1002EEDE0 != -1) {
          dispatch_once(&qword_1002EEDE0, &stru_100288E80);
        }
        unsigned __int8 v12 = (os_log_s *)qword_1002EEDE8;
        if (os_log_type_enabled((os_log_t)qword_1002EEDE8, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)__int128 buf = 0;
          _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEFAULT,  "TLT head has logBeginningMs after key store epoch",  buf,  2u);
        }

        BOOL v13 = (void *)objc_claimAutoreleasedReturnValue(-[KTContextVerifier applicationKeyStore](self, "applicationKeyStore"));
        uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue([v13 vrfKey]);
        [v14 setNeedsRefresh:1];

        id v15 = (void *)objc_claimAutoreleasedReturnValue(-[KTContextVerifier applicationKeyStore](self, "applicationKeyStore"));
        unsigned __int8 v16 = (void *)objc_claimAutoreleasedReturnValue([v15 appSmtKeyStore]);
        id v17 = (void *)objc_claimAutoreleasedReturnValue([v16 signatureVerifier]);
        [v17 setNeedsRefresh:1];

        id v18 = (void *)objc_claimAutoreleasedReturnValue(-[KTContextVerifier applicationKeyStore](self, "applicationKeyStore"));
        unsigned __int8 v19 = (void *)objc_claimAutoreleasedReturnValue([v18 appSthKeyStore]);
        id v20 = (void *)objc_claimAutoreleasedReturnValue([v19 signatureVerifier]);
        [v20 setNeedsRefresh:1];

        BOOL v21 = (void *)objc_claimAutoreleasedReturnValue(-[KTContextVerifier applicationKeyStore](self, "applicationKeyStore"));
        unsigned __int8 v22 = (void *)objc_claimAutoreleasedReturnValue([v21 tltKeyStore]);
LABEL_15:
        BOOL v30 = v22;
        id v31 = (void *)objc_claimAutoreleasedReturnValue([v22 signatureVerifier]);
        [v31 setNeedsRefresh:1];
      }
    }

    else
    {
      id v23 = [v9 patLogBeginningMs];

      if (v8 > v23)
      {
        if (qword_1002EEDE0 != -1) {
          dispatch_once(&qword_1002EEDE0, &stru_100288EA0);
        }
        id v24 = (os_log_s *)qword_1002EEDE8;
        if (os_log_type_enabled((os_log_t)qword_1002EEDE8, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)id v32 = 0;
          _os_log_impl( (void *)&_mh_execute_header,  v24,  OS_LOG_TYPE_DEFAULT,  "Application head has logBeginningMs after key store epoch",  v32,  2u);
        }

        id v25 = (void *)objc_claimAutoreleasedReturnValue(-[KTContextVerifier applicationKeyStore](self, "applicationKeyStore"));
        id v26 = (void *)objc_claimAutoreleasedReturnValue([v25 vrfKey]);
        [v26 setNeedsRefresh:1];

        double v27 = (void *)objc_claimAutoreleasedReturnValue(-[KTContextVerifier applicationKeyStore](self, "applicationKeyStore"));
        id v28 = (void *)objc_claimAutoreleasedReturnValue([v27 appSmtKeyStore]);
        unint64_t v29 = (void *)objc_claimAutoreleasedReturnValue([v28 signatureVerifier]);
        [v29 setNeedsRefresh:1];

        BOOL v21 = (void *)objc_claimAutoreleasedReturnValue(-[KTContextVerifier applicationKeyStore](self, "applicationKeyStore"));
        unsigned __int8 v22 = (void *)objc_claimAutoreleasedReturnValue([v21 appSthKeyStore]);
        goto LABEL_15;
      }
    }
  }
}

- (void)processSTHsFromGossipPeers:(id)a3 verifier:(id)a4 error:(id *)a5
{
  id obj = a3;
  id v37 = a4;
  __int128 v41 = 0u;
  __int128 v42 = 0u;
  __int128 v43 = 0u;
  __int128 v44 = 0u;
  id v38 = [obj countByEnumeratingWithState:&v41 objects:v47 count:16];
  if (v38)
  {
    BOOL v34 = a5;
    id v7 = 0LL;
    uint64_t v8 = *(void *)v42;
    p_vtable = &OBJC_METACLASS___TransparencyDistributedReadNotificationCenter.vtable;
    do
    {
      id v10 = 0LL;
      do
      {
        if (*(void *)v42 != v8) {
          objc_enumerationMutation(obj);
        }
        uint64_t v11 = *(void *)(*((void *)&v41 + 1) + 8LL * (void)v10);
        id v40 = 0LL;
        unsigned __int8 v12 = (void *)objc_claimAutoreleasedReturnValue([p_vtable + 132 parseFromData:v11 error:&v40]);
        id v13 = v40;
        uint64_t v14 = v13;
        if (v12) {
          BOOL v15 = v13 == 0LL;
        }
        else {
          BOOL v15 = 0;
        }
        if (v15)
        {
          BOOL v21 = (void *)objc_claimAutoreleasedReturnValue(-[KTContextVerifier applicationKeyStore](self, "applicationKeyStore"));
          unsigned __int8 v22 = (void *)objc_claimAutoreleasedReturnValue([v21 appSthKeyStore]);
          id v23 = (void *)objc_claimAutoreleasedReturnValue([v22 signatureVerifier]);
          [v12 setVerifier:v23];

          id v24 = (void *)objc_claimAutoreleasedReturnValue(-[KTContextVerifier dataStore](self, "dataStore"));
          [v12 setDataStore:v24];

          [v12 setGossip:1];
          [v12 setGossip:1];
          if (v37) {
            [v12 setVerifier:v37];
          }
          id v39 = 0LL;
          [v12 verifyWithError:&v39];
          id v25 = v39;
          if (v25)
          {
            if (qword_1002EEDE0 != -1) {
              dispatch_once(&qword_1002EEDE0, &stru_100288EE0);
            }
            id v26 = (os_log_s *)qword_1002EEDE8;
            if (os_log_type_enabled((os_log_t)qword_1002EEDE8, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)__int128 buf = 138412290;
              id v46 = v25;
              _os_log_impl( (void *)&_mh_execute_header,  v26,  OS_LOG_TYPE_ERROR,  "failed to verify gossiped sth: %@",  buf,  0xCu);
            }

            if (v7)
            {
              double v27 = (void *)objc_claimAutoreleasedReturnValue([v25 domain]);
              id v28 = p_vtable;
              uint64_t v29 = v8;
              id v30 = [v25 code];
              id v31 = (void *)objc_claimAutoreleasedReturnValue([0 description]);
              id v32 = v30;
              uint64_t v8 = v29;
              p_vtable = v28;
              uint64_t v33 = objc_claimAutoreleasedReturnValue( +[TransparencyError errorWithDomain:code:underlyingError:description:]( &OBJC_CLASS___TransparencyError,  "errorWithDomain:code:underlyingError:description:",  v27,  v32,  v7,  @"%@",  v31));

              id v7 = (id)v33;
            }

            else
            {
              id v7 = v25;
            }
          }
        }

        else
        {
          if (qword_1002EEDE0 != -1) {
            dispatch_once(&qword_1002EEDE0, &stru_100288EC0);
          }
          unsigned __int8 v16 = (os_log_s *)qword_1002EEDE8;
          if (os_log_type_enabled((os_log_t)qword_1002EEDE8, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)__int128 buf = 138412290;
            id v46 = v14;
            _os_log_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_ERROR,  "failed to parse gossiped slh: %@",  buf,  0xCu);
          }

          if (v7)
          {
            id v17 = (void *)objc_claimAutoreleasedReturnValue([v14 domain]);
            id v18 = [v14 code];
            unsigned __int8 v19 = (void *)objc_claimAutoreleasedReturnValue([v14 description]);
            uint64_t v20 = objc_claimAutoreleasedReturnValue( +[TransparencyError errorWithDomain:code:underlyingError:description:]( &OBJC_CLASS___TransparencyError,  "errorWithDomain:code:underlyingError:description:",  v17,  v18,  v7,  @"%@",  v19));

            id v7 = (id)v20;
          }

          else
          {
            id v7 = v14;
          }
        }

        id v10 = (char *)v10 + 1;
      }

      while (v38 != v10);
      id v38 = [obj countByEnumeratingWithState:&v41 objects:v47 count:16];
    }

    while (v38);
    if (v34 && v7)
    {
      id v7 = v7;
      id *v34 = v7;
    }
  }

  else
  {
    id v7 = 0LL;
  }
}

@end