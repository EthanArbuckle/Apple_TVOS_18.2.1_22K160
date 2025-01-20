@interface KTVerifyRevisionInclusionOperation
- (BOOL)downloadInclusionProofChunk:(id)a3 application:(id)a4 downloadType:(unint64_t)a5 error:(id *)a6;
- (BOOL)downloadInclusionProofsForRevisions:(id)a3 application:(id)a4 downloadType:(unint64_t)a5 error:(id *)a6;
- (BOOL)verifyInclusion:(id)a3 error:(id *)a4;
- (BOOL)verifySMHInclusion:(id)a3 logBeginMs:(unint64_t)a4 error:(id *)a5;
- (BOOL)verifySTHInclusion:(id)a3 logBeginMs:(unint64_t)a4 error:(id *)a5;
- (KTOperationDependencies)deps;
- (KTVerifyRevisionInclusionOperation)initWithDependencies:(id)a3 opId:(id)a4;
- (NSMutableDictionary)errors;
- (NSMutableDictionary)failedRevs;
- (NSMutableDictionary)serverHints;
- (NSOperation)finishedOp;
- (NSUUID)backgroundOpId;
- (OS_dispatch_group)fetchGroup;
- (OS_dispatch_queue)fetchQueue;
- (void)groupStart;
- (void)setBackgroundOpId:(id)a3;
- (void)setDeps:(id)a3;
- (void)setErrors:(id)a3;
- (void)setFailedRevs:(id)a3;
- (void)setFetchGroup:(id)a3;
- (void)setFetchQueue:(id)a3;
- (void)setFinishedOp:(id)a3;
- (void)setServerHints:(id)a3;
@end

@implementation KTVerifyRevisionInclusionOperation

- (KTVerifyRevisionInclusionOperation)initWithDependencies:(id)a3 opId:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v18.receiver = self;
  v18.super_class = (Class)&OBJC_CLASS___KTVerifyRevisionInclusionOperation;
  v9 = -[KTGroupOperation init](&v18, "init");
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->super._startOperation, a3);
    -[KTVerifyRevisionInclusionOperation setBackgroundOpId:](v10, "setBackgroundOpId:", v8);
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
    -[KTVerifyRevisionInclusionOperation setErrors:](v10, "setErrors:", v11);

    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
    -[KTVerifyRevisionInclusionOperation setFailedRevs:](v10, "setFailedRevs:", v12);

    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
    -[KTVerifyRevisionInclusionOperation setServerHints:](v10, "setServerHints:", v13);

    dispatch_queue_attr_t v14 = dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v15 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v14);
    dispatch_queue_t v16 = dispatch_queue_create("VerifyInclusion_FetchWaiter", v15);
    -[KTVerifyRevisionInclusionOperation setFetchQueue:](v10, "setFetchQueue:", v16);

    -[KTGroupOperation setName:](v10, "setName:", @"RevInclusion");
  }

  return v10;
}

- (void)groupStart
{
  if (qword_1002E6510 != -1) {
    dispatch_once(&qword_1002E6510, &stru_10027AB50);
  }
  v3 = (os_log_s *)qword_1002E6518;
  if (os_log_type_enabled((os_log_t)qword_1002E6518, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEBUG, "VerifyRevisionInclusion: start", buf, 2u);
  }

  dispatch_group_t v4 = dispatch_group_create();
  -[KTVerifyRevisionInclusionOperation setFetchGroup:](self, "setFetchGroup:", v4);

  v5 = objc_alloc_init(&OBJC_CLASS___NSOperation);
  -[KTVerifyRevisionInclusionOperation setFinishedOp:](self, "setFinishedOp:", v5);

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[KTVerifyRevisionInclusionOperation finishedOp](self, "finishedOp"));
  -[KTGroupOperation dependOnBeforeGroupFinished:](self, "dependOnBeforeGroupFinished:", v6);

  id v22 = 0LL;
  unsigned __int8 v7 = -[KTVerifyRevisionInclusionOperation verifyInclusion:error:]( self,  "verifyInclusion:error:",  kKTApplicationIdentifierIDS,  &v22);
  id v8 = v22;
  if ((v7 & 1) == 0)
  {
    if (qword_1002E6510 != -1) {
      dispatch_once(&qword_1002E6510, &stru_10027AB70);
    }
    v9 = (os_log_s *)qword_1002E6518;
    if (os_log_type_enabled((os_log_t)qword_1002E6518, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v24 = v8;
      _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_ERROR,  "Verify IDS revision inclusion failed: %@",  buf,  0xCu);
    }

    id v8 = 0LL;
  }

  id v21 = v8;
  unsigned __int8 v10 = -[KTVerifyRevisionInclusionOperation verifyInclusion:error:]( self,  "verifyInclusion:error:",  kKTApplicationIdentifierIDSFaceTime,  &v21);
  id v11 = v21;

  if ((v10 & 1) == 0)
  {
    if (qword_1002E6510 != -1) {
      dispatch_once(&qword_1002E6510, &stru_10027AB90);
    }
    v12 = (os_log_s *)qword_1002E6518;
    if (os_log_type_enabled((os_log_t)qword_1002E6518, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v24 = v11;
      _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_ERROR,  "Verify FT revision inclusion failed: %@",  buf,  0xCu);
    }

    id v11 = 0LL;
  }

  id v20 = v11;
  unsigned __int8 v13 = -[KTVerifyRevisionInclusionOperation verifyInclusion:error:]( self,  "verifyInclusion:error:",  kKTApplicationIdentifierIDSMultiplex,  &v20);
  id v14 = v20;

  if ((v13 & 1) == 0)
  {
    if (qword_1002E6510 != -1) {
      dispatch_once(&qword_1002E6510, &stru_10027ABB0);
    }
    v15 = (os_log_s *)qword_1002E6518;
    if (os_log_type_enabled((os_log_t)qword_1002E6518, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v24 = v14;
      _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_ERROR,  "Verify MP revision inclusion failed: %@",  buf,  0xCu);
    }

    id v14 = 0LL;
  }

  if (qword_1002E6510 != -1) {
    dispatch_once(&qword_1002E6510, &stru_10027ABD0);
  }
  dispatch_queue_t v16 = (os_log_s *)qword_1002E6518;
  if (os_log_type_enabled((os_log_t)qword_1002E6518, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_DEBUG,  "VerifyRevisionInclusion: waiting for fetches to finish validating",  buf,  2u);
  }

  v17 = (dispatch_group_s *)objc_claimAutoreleasedReturnValue(-[KTVerifyRevisionInclusionOperation fetchGroup](self, "fetchGroup"));
  objc_super v18 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[KTVerifyRevisionInclusionOperation fetchQueue](self, "fetchQueue"));
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472LL;
  v19[2] = sub_10004B690;
  v19[3] = &unk_100276740;
  v19[4] = self;
  dispatch_group_notify(v17, v18, v19);
}

- (BOOL)verifyInclusion:(id)a3 error:(id *)a4
{
  id v6 = a3;
  unsigned __int8 v7 = (void *)objc_claimAutoreleasedReturnValue(-[KTVerifyRevisionInclusionOperation deps](self, "deps"));
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 publicKeyStore]);
  v9 = (void *)objc_claimAutoreleasedReturnValue([v8 applicationPublicKeyStore:v6]);

  id v10 = [v9 patLogBeginningMs];
  if (-[KTVerifyRevisionInclusionOperation verifySMHInclusion:logBeginMs:error:]( self,  "verifySMHInclusion:logBeginMs:error:",  v6,  v10,  a4))
  {
    BOOL v11 = -[KTVerifyRevisionInclusionOperation verifySTHInclusion:logBeginMs:error:]( self,  "verifySTHInclusion:logBeginMs:error:",  v6,  v10,  a4);
  }

  else
  {
    BOOL v11 = 0;
  }

  return v11;
}

- (BOOL)verifySMHInclusion:(id)a3 logBeginMs:(unint64_t)a4 error:(id *)a5
{
  id v8 = a3;
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[KTVerifyRevisionInclusionOperation deps](self, "deps"));
  id v10 = (void *)objc_claimAutoreleasedReturnValue([v9 dataStore]);
  id v16 = 0LL;
  BOOL v11 = (void *)objc_claimAutoreleasedReturnValue([v10 unverifiedRevisions:v8 isMapHead:1 inclusion:1 logBeginMs:a4 error:&v16]);
  id v12 = v16;

  if (v11)
  {
    BOOL v13 = -[KTVerifyRevisionInclusionOperation downloadInclusionProofsForRevisions:application:downloadType:error:]( self,  "downloadInclusionProofsForRevisions:application:downloadType:error:",  v11,  v8,  1LL,  a5);
  }

  else if (v12)
  {
    if (qword_1002E6510 != -1) {
      dispatch_once(&qword_1002E6510, &stru_10027AC10);
    }
    v15 = (os_log_s *)qword_1002E6518;
    if (os_log_type_enabled((os_log_t)qword_1002E6518, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138543618;
      id v18 = v8;
      __int16 v19 = 2112;
      id v20 = v12;
      _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_INFO,  "failed to get inclusion unverified SMH revisions for %{public}@: %@",  buf,  0x16u);
    }

    BOOL v13 = 0;
    if (a5) {
      *a5 = v12;
    }
  }

  else
  {
    BOOL v13 = 1;
  }

  return v13;
}

- (BOOL)verifySTHInclusion:(id)a3 logBeginMs:(unint64_t)a4 error:(id *)a5
{
  id v8 = a3;
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[KTVerifyRevisionInclusionOperation deps](self, "deps"));
  id v10 = (void *)objc_claimAutoreleasedReturnValue([v9 dataStore]);
  id v16 = 0LL;
  BOOL v11 = (void *)objc_claimAutoreleasedReturnValue([v10 unverifiedRevisions:v8 isMapHead:0 inclusion:1 logBeginMs:a4 error:&v16]);
  id v12 = v16;

  if (v11)
  {
    BOOL v13 = -[KTVerifyRevisionInclusionOperation downloadInclusionProofsForRevisions:application:downloadType:error:]( self,  "downloadInclusionProofsForRevisions:application:downloadType:error:",  v11,  v8,  2LL,  a5);
  }

  else if (v12)
  {
    if (qword_1002E6510 != -1) {
      dispatch_once(&qword_1002E6510, &stru_10027AC30);
    }
    v15 = (os_log_s *)qword_1002E6518;
    if (os_log_type_enabled((os_log_t)qword_1002E6518, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138543618;
      id v18 = v8;
      __int16 v19 = 2112;
      id v20 = v12;
      _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_INFO,  "failed to get inclusion unverified STH revisions for %{public}@: %@",  buf,  0x16u);
    }

    BOOL v13 = 0;
    if (a5) {
      *a5 = v12;
    }
  }

  else
  {
    BOOL v13 = 1;
  }

  return v13;
}

- (BOOL)downloadInclusionProofsForRevisions:(id)a3 application:(id)a4 downloadType:(unint64_t)a5 error:(id *)a6
{
  id v9 = a3;
  id v10 = a4;
  if ([v9 count])
  {
    BOOL v11 = (void *)objc_claimAutoreleasedReturnValue(-[KTVerifyRevisionInclusionOperation deps](self, "deps"));
    id v12 = (void *)objc_claimAutoreleasedReturnValue([v11 logClient]);
    BOOL v13 = (void *)objc_claimAutoreleasedReturnValue( +[KTContext chunkArray:chunkSize:]( KTContext,  "chunkArray:chunkSize:",  v9,  [v12 revisionLogMaxProofs]));

    __int128 v31 = 0u;
    __int128 v32 = 0u;
    __int128 v29 = 0u;
    __int128 v30 = 0u;
    id obj = v13;
    id v14 = [obj countByEnumeratingWithState:&v29 objects:v33 count:16];
    if (v14)
    {
      id v15 = v14;
      id v25 = v9;
      id v16 = 0LL;
      uint64_t v17 = *(void *)v30;
      char v18 = 1;
      do
      {
        for (i = 0LL; i != v15; i = (char *)i + 1)
        {
          id v20 = v16;
          if (*(void *)v30 != v17) {
            objc_enumerationMutation(obj);
          }
          uint64_t v21 = *(void *)(*((void *)&v29 + 1) + 8LL * (void)i);
          id v28 = v16;
          unsigned __int8 v22 = -[KTVerifyRevisionInclusionOperation downloadInclusionProofChunk:application:downloadType:error:]( self,  "downloadInclusionProofChunk:application:downloadType:error:",  v21,  v10,  a5,  &v28,  v25);
          id v16 = v28;

          if ((v22 & 1) == 0)
          {
            char v18 = 0;
            if (a6)
            {
              if (v16)
              {
                char v18 = 0;
                *a6 = v16;
              }
            }
          }
        }

        id v15 = [obj countByEnumeratingWithState:&v29 objects:v33 count:16];
      }

      while (v15);

      id v9 = v25;
    }

    else
    {
      char v18 = 1;
    }
  }

  else
  {
    if (qword_1002E6510 != -1) {
      dispatch_once(&qword_1002E6510, &stru_10027AC50);
    }
    v23 = (os_log_s *)qword_1002E6518;
    char v18 = 1;
    if (os_log_type_enabled((os_log_t)qword_1002E6518, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412546;
      id v35 = v10;
      __int16 v36 = 2048;
      unint64_t v37 = a5;
      _os_log_impl( (void *)&_mh_execute_header,  v23,  OS_LOG_TYPE_INFO,  "Skipping revision inclusion proof request -- no revisions for %@, type %lu",  buf,  0x16u);
    }
  }

  return v18 & 1;
}

- (BOOL)downloadInclusionProofChunk:(id)a3 application:(id)a4 downloadType:(unint64_t)a5 error:(id *)a6
{
  id v10 = a3;
  id v11 = a4;
  if (a5 == 1) {
    uint64_t v12 = 2LL;
  }
  else {
    uint64_t v12 = 3LL;
  }
  BOOL v13 = (void *)objc_claimAutoreleasedReturnValue( +[TransparencyRPCRequestBuilder buildRevisionLogInclusionProofRequest:logType:revisions:error:]( &OBJC_CLASS___TransparencyRPCRequestBuilder,  "buildRevisionLogInclusionProofRequest:logType:revisions:error:",  v11,  v12,  v10,  a6));
  if (v13)
  {
    *(void *)buf = 0LL;
    unint64_t v37 = buf;
    uint64_t v38 = 0x3032000000LL;
    v39 = sub_10004C52C;
    v40 = sub_10004C53C;
    id v41 = 0LL;
    id v14 = (void *)objc_claimAutoreleasedReturnValue(-[KTVerifyRevisionInclusionOperation deps](self, "deps"));
    id v15 = (void *)objc_claimAutoreleasedReturnValue([v14 dataStore]);
    v30[0] = _NSConcreteStackBlock;
    v30[1] = 3221225472LL;
    v30[2] = sub_10004C544;
    v30[3] = &unk_10027ACD8;
    v30[4] = self;
    unint64_t v34 = a5;
    id v16 = v11;
    id v31 = v16;
    id v17 = v10;
    id v35 = a6;
    id v32 = v17;
    v33 = buf;
    [v15 performBlockAndWaitWithMoc:v30];

    char v18 = (dispatch_group_s *)objc_claimAutoreleasedReturnValue(-[KTVerifyRevisionInclusionOperation fetchGroup](self, "fetchGroup"));
    dispatch_group_enter(v18);

    id location = 0LL;
    objc_initWeak(&location, self);
    __int16 v19 = (void *)objc_claimAutoreleasedReturnValue(-[KTVerifyRevisionInclusionOperation deps](self, "deps"));
    id v20 = (void *)objc_claimAutoreleasedReturnValue([v19 logClient]);
    uint64_t v21 = *((void *)v37 + 5);
    v24[0] = _NSConcreteStackBlock;
    v24[1] = 3221225472LL;
    v24[2] = sub_10004C840;
    v24[3] = &unk_10027AD80;
    objc_copyWeak(v28, &location);
    id v25 = v16;
    v27 = buf;
    id v26 = v17;
    v28[1] = (id)a5;
    [v20 fetchRevisionLogInclusionProof:v13 uuid:v21 completionHandler:v24];

    objc_destroyWeak(v28);
    objc_destroyWeak(&location);

    _Block_object_dispose(buf, 8);
  }

  else
  {
    if (qword_1002E6510 != -1) {
      dispatch_once(&qword_1002E6510, &stru_10027AC70);
    }
    unsigned __int8 v22 = (os_log_s *)qword_1002E6518;
    if (os_log_type_enabled((os_log_t)qword_1002E6518, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v22,  OS_LOG_TYPE_ERROR,  "failed to create revision inclusion proof request",  buf,  2u);
    }
  }

  return v13 != 0LL;
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

- (OS_dispatch_group)fetchGroup
{
  return (OS_dispatch_group *)objc_getProperty(self, a2, 144LL, 1);
}

- (void)setFetchGroup:(id)a3
{
}

- (OS_dispatch_queue)fetchQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 152LL, 1);
}

- (void)setFetchQueue:(id)a3
{
}

- (NSMutableDictionary)errors
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 160LL, 1);
}

- (void)setErrors:(id)a3
{
}

- (NSMutableDictionary)failedRevs
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 168LL, 1);
}

- (void)setFailedRevs:(id)a3
{
}

- (NSMutableDictionary)serverHints
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 176LL, 1);
}

- (void)setServerHints:(id)a3
{
}

- (void).cxx_destruct
{
}

@end