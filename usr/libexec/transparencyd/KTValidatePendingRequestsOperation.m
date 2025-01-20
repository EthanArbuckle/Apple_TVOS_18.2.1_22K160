@interface KTValidatePendingRequestsOperation
- (KTOperationDependencies)deps;
- (KTValidatePendingRequestsOperation)initWithApplication:(id)a3 dependencies:(id)a4 opId:(id)a5;
- (NSMutableArray)errors;
- (NSMutableArray)requestIds;
- (NSMutableArray)serverHints;
- (NSOperation)finishedOp;
- (NSString)application;
- (NSUUID)backgroundOpId;
- (OS_dispatch_group)fetchGroup;
- (OS_dispatch_queue)fetchQueue;
- (id)createChainOfErrorsFromRequestFailures:(id)a3;
- (id)createErrorFromRequestFailure:(id)a3 underlyingError:(id)a4;
- (id)failExpiredRequest:(id)a3 error:(id)a4;
- (void)groupStart;
- (void)handleKTRequest:(id)a3 queryRequest:(id)a4 queryResponse:(id)a5 completionHandler:(id)a6;
- (void)handleKTRequestDownload:(id)a3 context:(id)a4;
- (void)saveRequestFailure:(id)a3 failure:(id)a4;
- (void)setApplication:(id)a3;
- (void)setBackgroundOpId:(id)a3;
- (void)setDeps:(id)a3;
- (void)setErrors:(id)a3;
- (void)setFetchGroup:(id)a3;
- (void)setFetchQueue:(id)a3;
- (void)setFinishedOp:(id)a3;
- (void)setRequestIds:(id)a3;
- (void)setServerHints:(id)a3;
@end

@implementation KTValidatePendingRequestsOperation

- (KTValidatePendingRequestsOperation)initWithApplication:(id)a3 dependencies:(id)a4 opId:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v21.receiver = self;
  v21.super_class = (Class)&OBJC_CLASS___KTValidatePendingRequestsOperation;
  v12 = -[KTGroupOperation init](&v21, "init");
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->super._startOperation, a4);
    objc_storeStrong((id *)&v13->super._queue, a3);
    -[KTValidatePendingRequestsOperation setBackgroundOpId:](v13, "setBackgroundOpId:", v11);
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
    -[KTValidatePendingRequestsOperation setErrors:](v13, "setErrors:", v14);

    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
    -[KTValidatePendingRequestsOperation setRequestIds:](v13, "setRequestIds:", v15);

    v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
    -[KTValidatePendingRequestsOperation setServerHints:](v13, "setServerHints:", v16);

    dispatch_queue_attr_t v17 = dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v18 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v17);
    dispatch_queue_t v19 = dispatch_queue_create("VerifyInclusion_FetchWaiter", v18);
    -[KTValidatePendingRequestsOperation setFetchQueue:](v13, "setFetchQueue:", v19);

    -[KTGroupOperation setName:](v13, "setName:", @"KTRequest");
  }

  return v13;
}

- (void)groupStart
{
  if (qword_1002E6400 != -1) {
    dispatch_once(&qword_1002E6400, &stru_100277060);
  }
  v3 = (os_log_s *)qword_1002E6408;
  if (os_log_type_enabled((os_log_t)qword_1002E6408, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEBUG, "ValidatePendingRequests: start", buf, 2u);
  }

  v4 = objc_alloc_init(&OBJC_CLASS___NSOperation);
  -[KTValidatePendingRequestsOperation setFinishedOp:](self, "setFinishedOp:", v4);

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[KTValidatePendingRequestsOperation finishedOp](self, "finishedOp"));
  -[KTGroupOperation dependOnBeforeGroupFinished:](self, "dependOnBeforeGroupFinished:", v5);

  *(void *)buf = 0LL;
  objc_initWeak((id *)buf, self);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[KTValidatePendingRequestsOperation deps](self, "deps"));
  v7 = (void *)objc_claimAutoreleasedReturnValue([v6 contextStore]);
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[KTValidatePendingRequestsOperation application](self, "application"));
  id v9 = (void *)objc_claimAutoreleasedReturnValue(-[KTValidatePendingRequestsOperation deps](self, "deps"));
  id v10 = (void *)objc_claimAutoreleasedReturnValue([v9 logClient]);
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472LL;
  v11[2] = sub_10000E88C;
  v11[3] = &unk_100277130;
  objc_copyWeak(&v12, (id *)buf);
  [v7 contextForApplication:v8 logClient:v10 fetchState:1 completionHandler:v11];

  objc_destroyWeak(&v12);
  objc_destroyWeak((id *)buf);
}

- (void)handleKTRequestDownload:(id)a3 context:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id location = 0LL;
  objc_initWeak(&location, self);
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = sub_10000F248;
  v8[3] = &unk_1002771A0;
  objc_copyWeak(&v9, &location);
  [v7 fetchQueryForKTRequest:v6 userInitiated:0 completionHandler:v8];
  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

- (void)handleKTRequest:(id)a3 queryRequest:(id)a4 queryResponse:(id)a5 completionHandler:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  id location = 0LL;
  objc_initWeak(&location, self);
  v24 = v10;
  v14 = (void *)objc_claimAutoreleasedReturnValue([v10 requestId]);
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[KTValidatePendingRequestsOperation deps](self, "deps"));
  v16 = (void *)objc_claimAutoreleasedReturnValue([v15 contextStore]);
  dispatch_queue_attr_t v17 = (void *)objc_claimAutoreleasedReturnValue(-[KTValidatePendingRequestsOperation application](self, "application"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(-[KTValidatePendingRequestsOperation deps](self, "deps"));
  dispatch_queue_t v19 = (void *)objc_claimAutoreleasedReturnValue([v18 logClient]);
  v25[0] = _NSConcreteStackBlock;
  v25[1] = 3221225472LL;
  v25[2] = sub_10000F8A4;
  v25[3] = &unk_100277230;
  objc_copyWeak(&v30, &location);
  id v20 = v14;
  id v26 = v20;
  id v21 = v13;
  id v29 = v21;
  id v22 = v11;
  id v27 = v22;
  id v23 = v12;
  id v28 = v23;
  [v16 contextForApplication:v17 logClient:v19 fetchState:1 completionHandler:v25];

  objc_destroyWeak(&v30);
  objc_destroyWeak(&location);
}

- (id)failExpiredRequest:(id)a3 error:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([v6 isDeleted])
  {
    v8 = -[NSUUID initWithUUIDBytes:](objc_alloc(&OBJC_CLASS___NSUUID), "initWithUUIDBytes:", &unk_1002463E0);
  }

  else
  {
    [v6 requestTime];
    CFAbsoluteTime v10 = v9 + (double)kKTMaximumMergeDelayMs / 1000.0;
    if (v10 >= CFAbsoluteTimeGetCurrent())
    {
      v8 = 0LL;
    }

    else
    {
      id v11 = (void *)objc_claimAutoreleasedReturnValue([v6 failures]);
      id v12 = (void *)objc_claimAutoreleasedReturnValue( -[KTValidatePendingRequestsOperation createChainOfErrorsFromRequestFailures:]( self,  "createChainOfErrorsFromRequestFailures:",  v11));

      id v13 = (void *)objc_claimAutoreleasedReturnValue( +[TransparencyError errorWithError:underlyingError:]( &OBJC_CLASS___TransparencyError,  "errorWithError:underlyingError:",  v7,  v12));
      v14 = (void *)objc_claimAutoreleasedReturnValue( +[TransparencyError errorWithDomain:code:underlyingError:description:]( &OBJC_CLASS___TransparencyError,  "errorWithDomain:code:underlyingError:description:",  @"TransparencyErrorVerify",  -213LL,  v13,  @"failed to download query response for request"));

      if (qword_1002E6400 != -1) {
        dispatch_once(&qword_1002E6400, &stru_100277250);
      }
      v15 = (void *)qword_1002E6408;
      if (os_log_type_enabled((os_log_t)qword_1002E6408, OS_LOG_TYPE_ERROR))
      {
        v16 = v15;
        dispatch_queue_attr_t v17 = (void *)objc_claimAutoreleasedReturnValue([v6 requestId]);
        int v26 = 138543874;
        id v27 = v17;
        __int16 v28 = 2112;
        id v29 = v14;
        __int16 v30 = 2112;
        id v31 = v7;
        _os_log_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_ERROR,  "ValidatePendingRequests: Request validation failed after MMD for requestId %{public}@, error: %@, underlyingError: %@",  (uint8_t *)&v26,  0x20u);
      }

      v18 = (void *)objc_claimAutoreleasedReturnValue(-[KTValidatePendingRequestsOperation deps](self, "deps"));
      dispatch_queue_t v19 = (void *)objc_claimAutoreleasedReturnValue([v18 dataStore]);
      id v20 = (void *)objc_claimAutoreleasedReturnValue([v19 createRequestFailure]);

      [v20 setErrorCode:-213];
      [v20 setErrorDomain:@"TransparencyErrorVerify"];
      [v20 setRequest:v6];
      [v6 setVerificationResult:0];
      id v21 = (void *)objc_claimAutoreleasedReturnValue(+[TransparencyAnalytics logger](&OBJC_CLASS___TransparencyAnalytics, "logger"));
      id v22 = [v6 type];
      id v23 = (void *)objc_claimAutoreleasedReturnValue(-[KTValidatePendingRequestsOperation application](self, "application"));
      v24 = (void *)objc_claimAutoreleasedReturnValue( +[KTContext validateEventName:application:]( &OBJC_CLASS___KTContext,  "validateEventName:application:",  v22,  v23));
      [v21 logResultForEvent:v24 hardFailure:1 result:v14];

      v8 = (NSUUID *)objc_claimAutoreleasedReturnValue([v6 requestId]);
    }
  }

  return v8;
}

- (void)saveRequestFailure:(id)a3 failure:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[KTValidatePendingRequestsOperation deps](self, "deps"));
  double v9 = (void *)objc_claimAutoreleasedReturnValue([v8 dataStore]);
  id v11 = (id)objc_claimAutoreleasedReturnValue([v9 createRequestFailure]);

  objc_msgSend(v11, "setErrorCode:", objc_msgSend(v6, "code"));
  CFAbsoluteTime v10 = (void *)objc_claimAutoreleasedReturnValue([v6 domain]);

  [v11 setErrorDomain:v10];
  [v11 setRequest:v7];
}

- (id)createChainOfErrorsFromRequestFailures:(id)a3
{
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "allObjects", 0));
  id v5 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v5)
  {
    id v6 = v5;
    id v7 = 0LL;
    uint64_t v8 = *(void *)v13;
    do
    {
      double v9 = 0LL;
      CFAbsoluteTime v10 = v7;
      do
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(v4);
        }
        id v7 = (void *)objc_claimAutoreleasedReturnValue( -[KTValidatePendingRequestsOperation createErrorFromRequestFailure:underlyingError:]( self,  "createErrorFromRequestFailure:underlyingError:",  *(void *)(*((void *)&v12 + 1) + 8LL * (void)v9),  v10));

        double v9 = (char *)v9 + 1;
        CFAbsoluteTime v10 = v7;
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

- (id)createErrorFromRequestFailure:(id)a3 underlyingError:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 errorDomain]);
  id v8 = [v6 errorCode];

  double v9 = (void *)objc_claimAutoreleasedReturnValue( +[TransparencyError errorWithDomain:code:underlyingError:description:]( &OBJC_CLASS___TransparencyError,  "errorWithDomain:code:underlyingError:description:",  v7,  v8,  v5,  0LL));
  return v9;
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

- (NSString)application
{
  return (NSString *)objc_getProperty(self, a2, 136LL, 1);
}

- (void)setApplication:(id)a3
{
}

- (NSOperation)finishedOp
{
  return (NSOperation *)objc_getProperty(self, a2, 144LL, 1);
}

- (void)setFinishedOp:(id)a3
{
}

- (OS_dispatch_group)fetchGroup
{
  return (OS_dispatch_group *)objc_getProperty(self, a2, 152LL, 1);
}

- (void)setFetchGroup:(id)a3
{
}

- (OS_dispatch_queue)fetchQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 160LL, 1);
}

- (void)setFetchQueue:(id)a3
{
}

- (NSMutableArray)errors
{
  return (NSMutableArray *)objc_getProperty(self, a2, 168LL, 1);
}

- (void)setErrors:(id)a3
{
}

- (NSMutableArray)requestIds
{
  return (NSMutableArray *)objc_getProperty(self, a2, 176LL, 1);
}

- (void)setRequestIds:(id)a3
{
}

- (NSMutableArray)serverHints
{
  return (NSMutableArray *)objc_getProperty(self, a2, 184LL, 1);
}

- (void)setServerHints:(id)a3
{
}

- (void).cxx_destruct
{
}

@end