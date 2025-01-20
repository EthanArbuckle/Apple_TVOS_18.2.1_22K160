@interface AssetSession
+ (id)defaultSession;
+ (void)obliterateBackgroundSessionsAndHandleEventStream;
- (AssetSession)init;
- (AssetSession)initWithConfiguration:(id)a3;
- (NSURLSessionConfiguration)configuration;
- (id)_findSessionUsingTaskInfo:(id)a3 withProperties:(id)a4;
- (id)assetPromiseWithRequest:(id)a3;
- (void)URLSession:(id)a3 _willRetryBackgroundDataTask:(id)a4 withError:(id)a5;
- (void)URLSession:(id)a3 dataTask:(id)a4 didReceiveData:(id)a5;
- (void)URLSession:(id)a3 dataTask:(id)a4 didReceiveResponse:(id)a5 completionHandler:(id)a6;
- (void)URLSession:(id)a3 task:(id)a4 _willSendRequestForEstablishedConnection:(id)a5 completionHandler:(id)a6;
- (void)URLSession:(id)a3 task:(id)a4 didCompleteWithError:(id)a5;
- (void)URLSession:(id)a3 task:(id)a4 didFinishCollectingMetrics:(id)a5;
- (void)_completeNetworkActivityWithReason:(int)a3 usingTaskInfo:(id)a4;
- (void)_finishPromiseUsingTaskInfo:(id)a3;
- (void)_prepareDataConsumerUsingTaskInfo:(id)a3;
- (void)_prepareRequestUsingTaskInfo:(id)a3;
- (void)_reportMetricsForTaskInfo:(id)a3 withCompletionError:(id)a4;
- (void)_retryTaskUsingTaskInfo:(id)a3;
- (void)_startNetworkActivityUsingTaskInfo:(id)a3 withTask:(id)a4;
- (void)_startTaskUsingTaskInfo:(id)a3 withRequest:(id)a4;
@end

@implementation AssetSession

+ (id)defaultSession
{
  if (qword_10032E738 != -1) {
    dispatch_once(&qword_10032E738, &stru_1002E8F88);
  }
  return (id)qword_10032E740;
}

- (AssetSession)init
{
  v12.receiver = self;
  v12.super_class = (Class)&OBJC_CLASS___AssetSession;
  v2 = -[AssetSession init](&v12, "init");
  if (v2)
  {
    dispatch_queue_attr_t v3 = dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v4 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v3);
    dispatch_queue_t v5 = dispatch_queue_create("com.apple.storekit.AssetSession", v4);
    dispatchQueue = v2->_dispatchQueue;
    v2->_dispatchQueue = (OS_dispatch_queue *)v5;

    v7 = objc_alloc_init(&OBJC_CLASS___NSOperationQueue);
    delegateQueue = v2->_delegateQueue;
    v2->_delegateQueue = v7;

    -[NSOperationQueue setUnderlyingQueue:](v2->_delegateQueue, "setUnderlyingQueue:", v2->_dispatchQueue);
    v9 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    sessions = v2->_sessions;
    v2->_sessions = v9;
  }

  return v2;
}

- (AssetSession)initWithConfiguration:(id)a3
{
  id v4 = a3;
  dispatch_queue_t v5 = -[AssetSession init](self, "init");
  if (v5)
  {
    uint64_t v6 = objc_claimAutoreleasedReturnValue( +[NSURLSession sessionWithConfiguration:delegate:delegateQueue:]( &OBJC_CLASS___NSURLSession,  "sessionWithConfiguration:delegate:delegateQueue:",  v4,  v5,  v5->_delegateQueue));
    session = v5->_session;
    v5->_session = (NSURLSession *)v6;
  }

  return v5;
}

- (NSURLSessionConfiguration)configuration
{
  return -[NSURLSession configuration](self->_session, "configuration");
}

+ (void)obliterateBackgroundSessionsAndHandleEventStream
{
  v2 = (const char *)kNSURLSessionLaunchOnDemandNotificationName;
  dispatch_queue_global_t global_queue = dispatch_get_global_queue(17LL, 0LL);
  id v4 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(global_queue);
  xpc_set_event_stream_handler(v2, v4, &stru_1002E8FC8);

  +[NSURLSession _obliterateAllBackgroundSessionsWithCompletionHandler:]( &OBJC_CLASS___NSURLSession,  "_obliterateAllBackgroundSessionsWithCompletionHandler:",  &stru_1002E8FE8);
}

- (id)assetPromiseWithRequest:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_opt_class(&OBJC_CLASS___AssetRequest);
  if ((objc_opt_isKindOfClass(v4, v5) & 1) != 0) {
    uint64_t v6 = (AssetRequestProperties *)[v4 copyRequestProperties];
  }
  else {
    uint64_t v6 = objc_alloc_init(&OBJC_CLASS___AssetRequestProperties);
  }
  v7 = v6;
  v8 = objc_alloc_init(&OBJC_CLASS___AssetTaskInfo);
  -[AssetTaskInfo setRequest:](v8, "setRequest:", v4);
  -[AssetTaskInfo setProperties:](v8, "setProperties:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[AssetRequestProperties requestUUID](v7, "requestUUID"));
  -[AssetTaskInfo setSignpostId:](v8, "setSignpostId:", objc_msgSend(v9, "lib_signpostId"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[AssetRequestProperties logKey](v7, "logKey"));

  if (v10)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[AssetRequestProperties logKey](v7, "logKey"));
    objc_super v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "lib_logUUID"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%@/%@", v11, v12));
    -[AssetTaskInfo setLogKey:](v8, "setLogKey:", v13);
  }

  else
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "lib_logUUID"));
    -[AssetTaskInfo setLogKey:](v8, "setLogKey:", v11);
  }

  v14 = (void *)objc_claimAutoreleasedReturnValue( +[NSProgress progressWithTotalUnitCount:]( &OBJC_CLASS___NSProgress,  "progressWithTotalUnitCount:",  -[AssetRequestProperties expectedContentLength](v7, "expectedContentLength")));
  -[AssetTaskInfo setProgress:](v8, "setProgress:", v14);

  v15 = objc_alloc(&OBJC_CLASS___AssetPromise);
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472LL;
  v20[2] = sub_10004A810;
  v20[3] = &unk_1002E9038;
  v21 = v8;
  id v22 = v4;
  v23 = self;
  id v16 = v4;
  v17 = v8;
  v18 = -[AssetPromise initWithRequestID:promiseBlock:](v15, "initWithRequestID:promiseBlock:", v9, v20);
  -[AssetTaskInfo setPromise:](v17, "setPromise:", v18);

  return v18;
}

- (void)URLSession:(id)a3 dataTask:(id)a4 didReceiveData:(id)a5
{
  id v6 = a4;
  id v7 = a5;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[AssetTaskInfo taskInfoForTask:](&OBJC_CLASS___AssetTaskInfo, "taskInfoForTask:", v6));
  if (v8)
  {
    if (qword_10032E790 != -1) {
      dispatch_once(&qword_10032E790, &stru_1002E91C0);
    }
    if (os_log_type_enabled((os_log_t)off_100328588, OS_LOG_TYPE_DEBUG))
    {
      if (qword_10032E790 != -1) {
        dispatch_once(&qword_10032E790, &stru_1002E91C0);
      }
      v9 = off_100328588;
      if (os_log_type_enabled((os_log_t)off_100328588, OS_LOG_TYPE_DEBUG)) {
        sub_100260BCC(v9, v8, v6);
      }
    }

    v10 = (void *)objc_claimAutoreleasedReturnValue([v8 progress]);
    objc_msgSend( v10,  "setCompletedUnitCount:",  (char *)objc_msgSend(v7, "length") + (void)objc_msgSend(v10, "completedUnitCount"));

    v11 = (void *)objc_claimAutoreleasedReturnValue([v8 promise]);
    objc_super v12 = (void (**)(void, void, void, void))objc_claimAutoreleasedReturnValue([v11 progress]);

    if (v12) {
      ((void (**)(void, uint64_t, char *, char *))v12)[2]( v12,  1,  (char *)[v6 countOfBytesReceived] + (void)objc_msgSend(v8, "requestOffset"),  (char *)objc_msgSend(v6, "countOfBytesExpectedToReceive") + (void)objc_msgSend(v8, "requestOffset"));
    }
    dispatch_semaphore_t v13 = dispatch_semaphore_create(0LL);
    v14 = (void *)objc_claimAutoreleasedReturnValue([v8 properties]);
    v15 = (void *)objc_claimAutoreleasedReturnValue([v14 dataConsumer]);

    v22[0] = _NSConcreteStackBlock;
    v22[1] = 3221225472LL;
    v22[2] = sub_10004AF1C;
    v22[3] = &unk_1002E9060;
    id v16 = v6;
    id v23 = v16;
    id v17 = v8;
    id v24 = v17;
    v18 = v13;
    v25 = v18;
    [v15 consumeData:v7 withCompletionHandler:v22];
    dispatch_time_t v19 = dispatch_time(0LL, 300000000000LL);
    if (dispatch_semaphore_wait(v18, v19))
    {
      uint64_t v20 = ASDErrorWithDescription( @"AssetErrorDomain",  9LL,  @"Data consumer failed to process data within allotted time");
      v21 = (void *)objc_claimAutoreleasedReturnValue(v20);
      [v17 setError:v21];

      [v16 cancel];
    }
  }

  else
  {
    if (qword_10032E790 != -1) {
      dispatch_once(&qword_10032E790, &stru_1002E91C0);
    }
    if (os_log_type_enabled((os_log_t)off_100328588, OS_LOG_TYPE_ERROR)) {
      sub_100260B68();
    }
    [v6 cancel];
  }
}

- (void)URLSession:(id)a3 dataTask:(id)a4 didReceiveResponse:(id)a5 completionHandler:(id)a6
{
  id v9 = a4;
  id v10 = a5;
  id v11 = a6;
  uint64_t v12 = (uint64_t)objc_msgSend(v10, "asset_statusCode");
  dispatch_semaphore_t v13 = (void *)objc_claimAutoreleasedReturnValue(+[AssetTaskInfo taskInfoForTask:](&OBJC_CLASS___AssetTaskInfo, "taskInfoForTask:", v9));
  if (v13)
  {
    v68 = self;
    if (qword_10032E790 != -1) {
      dispatch_once(&qword_10032E790, &stru_1002E91C0);
    }
    v14 = off_100328588;
    v15 = (char *)[v13 signpostId];
    if ((unint64_t)(v15 - 1) <= 0xFFFFFFFFFFFFFFFDLL)
    {
      os_signpost_id_t v16 = (os_signpost_id_t)v15;
      if (os_signpost_enabled((os_log_t)v14))
      {
        id v17 = (void *)objc_claimAutoreleasedReturnValue([v13 logKey]);
        *(_DWORD *)buf = 138543618;
        v79 = v17;
        __int16 v80 = 2050;
        uint64_t v81 = v12;
        _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  (os_log_t)v14,  OS_SIGNPOST_INTERVAL_BEGIN,  v16,  "Download/Transfer",  " uuid=%{public, signpost.description:attribute}@  status=%{public, signpost.description:attribute}ld ",  buf,  0x16u);
      }
    }

    if (qword_10032E790 != -1) {
      dispatch_once(&qword_10032E790, &stru_1002E91C0);
    }
    v18 = off_100328588;
    if (os_log_type_enabled((os_log_t)off_100328588, OS_LOG_TYPE_DEFAULT))
    {
      dispatch_time_t v19 = v18;
      uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue([v13 logKey]);
      *(_DWORD *)buf = 138543618;
      v79 = v20;
      __int16 v80 = 2114;
      uint64_t v81 = (uint64_t)v10;
      _os_log_impl( (void *)&_mh_execute_header,  v19,  OS_LOG_TYPE_DEFAULT,  "[%{public}@] Received response: %{public}@",  buf,  0x16u);
    }

    v21 = (void *)objc_claimAutoreleasedReturnValue([v13 logKey]);
    id v22 = (void *)objc_claimAutoreleasedReturnValue( +[KeepAlive keepAliveWithFormat:]( KeepAlive,  "keepAliveWithFormat:",  @"com.apple.storekit.AssetTask:%@-%lu",  v21,  [v9 taskIdentifier]));
    [v13 setKeepAlive:v22];

    id v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "asset_cdnUUID"));
    id v24 = v23;
    if (v23 && [v23 length])
    {
      if (qword_10032E790 != -1) {
        dispatch_once(&qword_10032E790, &stru_1002E91C0);
      }
      v25 = off_100328588;
      if (os_log_type_enabled((os_log_t)off_100328588, OS_LOG_TYPE_DEFAULT))
      {
        v26 = v25;
        v27 = (void *)objc_claimAutoreleasedReturnValue([v13 logKey]);
        *(_DWORD *)buf = 138543874;
        v79 = v27;
        __int16 v80 = 2114;
        uint64_t v81 = (uint64_t)v9;
        __int16 v82 = 2114;
        uint64_t v83 = (uint64_t)v24;
        _os_log_impl( (void *)&_mh_execute_header,  v26,  OS_LOG_TYPE_DEFAULT,  "[%{public}@] Task: %{public}@ CDNUUID: %{public}@",  buf,  0x20u);
      }
    }

    if (v12 > 399)
    {
      switch(v12)
      {
        case 416LL:
          if (qword_10032E790 != -1) {
            dispatch_once(&qword_10032E790, &stru_1002E91C0);
          }
          v45 = off_100328588;
          v46 = (char *)[v13 signpostId];
          if ((unint64_t)(v46 - 1) <= 0xFFFFFFFFFFFFFFFDLL)
          {
            os_signpost_id_t v47 = (os_signpost_id_t)v46;
            if (os_signpost_enabled((os_log_t)v45))
            {
              v48 = (void *)objc_claimAutoreleasedReturnValue([v13 logKey]);
              *(_DWORD *)buf = 138543618;
              v79 = v48;
              __int16 v80 = 2050;
              uint64_t v81 = 416LL;
              _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  (os_log_t)v45,  OS_SIGNPOST_EVENT,  v47,  "RequestRange",  " uuid=%{public, signpost.description:attribute}@  status=%{public, signpost.description:attribute}ld ",  buf,  0x16u);
            }
          }

          if (qword_10032E790 != -1) {
            dispatch_once(&qword_10032E790, &stru_1002E91C0);
          }
          if (os_log_type_enabled((os_log_t)off_100328588, OS_LOG_TYPE_ERROR)) {
            sub_100260E40();
          }
          v49 = (void *)objc_claimAutoreleasedReturnValue([v13 properties]);
          v50 = (void *)objc_claimAutoreleasedReturnValue([v49 dataConsumer]);

          v69[0] = _NSConcreteStackBlock;
          v69[1] = 3221225472LL;
          v69[2] = sub_10004C754;
          v69[3] = &unk_1002E7478;
          v69[4] = v68;
          id v70 = v13;
          id v71 = v9;
          id v72 = v11;
          [v50 truncateWithCompletionHandler:v69];

          goto LABEL_83;
        case 408LL:
          if (qword_10032E790 != -1) {
            dispatch_once(&qword_10032E790, &stru_1002E91C0);
          }
          v51 = off_100328588;
          v52 = (char *)[v13 signpostId];
          if ((unint64_t)(v52 - 1) <= 0xFFFFFFFFFFFFFFFDLL)
          {
            os_signpost_id_t v53 = (os_signpost_id_t)v52;
            if (os_signpost_enabled((os_log_t)v51))
            {
              v54 = (void *)objc_claimAutoreleasedReturnValue([v13 logKey]);
              *(_DWORD *)buf = 138543618;
              v79 = v54;
              __int16 v80 = 2050;
              uint64_t v81 = 408LL;
              _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  (os_log_t)v51,  OS_SIGNPOST_EVENT,  v53,  "RequestTimeout",  " uuid=%{public, signpost.description:attribute}@  status=%{public, signpost.description:attribute}ld ",  buf,  0x16u);
            }
          }

          if (qword_10032E790 != -1) {
            dispatch_once(&qword_10032E790, &stru_1002E91C0);
          }
          if (os_log_type_enabled((os_log_t)off_100328588, OS_LOG_TYPE_ERROR)) {
            sub_100260DB4();
          }
          [v13 setAction:1];
          break;
        case 403LL:
          if (qword_10032E790 != -1) {
            dispatch_once(&qword_10032E790, &stru_1002E91C0);
          }
          v38 = off_100328588;
          v39 = (char *)[v13 signpostId];
          if ((unint64_t)(v39 - 1) <= 0xFFFFFFFFFFFFFFFDLL)
          {
            os_signpost_id_t v40 = (os_signpost_id_t)v39;
            if (os_signpost_enabled((os_log_t)v38))
            {
              v41 = (void *)objc_claimAutoreleasedReturnValue([v13 logKey]);
              *(_DWORD *)buf = 138543618;
              v79 = v41;
              __int16 v80 = 2050;
              uint64_t v81 = 403LL;
              _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  (os_log_t)v38,  OS_SIGNPOST_EVENT,  v40,  "RequestExpired",  " uuid=%{public, signpost.description:attribute}@  status=%{public, signpost.description:attribute}ld ",  buf,  0x16u);
            }
          }

          if (qword_10032E790 != -1) {
            dispatch_once(&qword_10032E790, &stru_1002E91C0);
          }
          if (os_log_type_enabled((os_log_t)off_100328588, OS_LOG_TYPE_ERROR)) {
            sub_100260D28();
          }
          uint64_t v42 = ASDErrorWithDescription(@"AssetErrorDomain", 6LL, @"Asset URL has expired");
          v43 = (void *)objc_claimAutoreleasedReturnValue(v42);
          [v13 setError:v43];

          break;
        default:
          if (qword_10032E790 != -1) {
            dispatch_once(&qword_10032E790, &stru_1002E91C0);
          }
          v55 = off_100328588;
          v56 = (char *)[v13 signpostId];
          if ((unint64_t)(v56 - 1) <= 0xFFFFFFFFFFFFFFFDLL)
          {
            os_signpost_id_t v57 = (os_signpost_id_t)v56;
            if (os_signpost_enabled((os_log_t)v55))
            {
              v58 = (void *)objc_claimAutoreleasedReturnValue([v13 logKey]);
              *(_DWORD *)buf = 138543618;
              v79 = v58;
              __int16 v80 = 2050;
              uint64_t v81 = v12;
              _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  (os_log_t)v55,  OS_SIGNPOST_EVENT,  v57,  "RequestStatus",  " uuid=%{public, signpost.description:attribute}@  status=%{public, signpost.description:attribute}ld ",  buf,  0x16u);
            }
          }

          if (qword_10032E790 != -1) {
            dispatch_once(&qword_10032E790, &stru_1002E91C0);
          }
          v59 = off_100328588;
          if (os_log_type_enabled((os_log_t)off_100328588, OS_LOG_TYPE_ERROR))
          {
            v66 = v59;
            v67 = (void *)objc_claimAutoreleasedReturnValue([v13 logKey]);
            *(_DWORD *)buf = 138543874;
            v79 = v67;
            __int16 v80 = 2114;
            uint64_t v81 = (uint64_t)v9;
            __int16 v82 = 2048;
            uint64_t v83 = v12;
            _os_log_error_impl( (void *)&_mh_execute_header,  v66,  OS_LOG_TYPE_ERROR,  "[%{public}@] Canceling task: %{public}@ after receiving invalid status code: %ld",  buf,  0x20u);
          }

          v60 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"AssetErrorDomain",  v12 + 1000,  0LL));
          uint64_t v62 = ASDErrorWithUnderlyingErrorAndDescription(v60, @"AssetErrorDomain", 7LL, v61);
          v63 = (void *)objc_claimAutoreleasedReturnValue(v62);
          [v13 setError:v63];

          (*((void (**)(id, void))v11 + 2))(v11, 0LL);
          goto LABEL_83;
      }

      (*((void (**)(id, void))v11 + 2))(v11, 0LL);
    }

    else
    {
      v28 = (void *)objc_claimAutoreleasedReturnValue([v9 currentRequest]);
      id v29 = objc_msgSend(v28, "asset_rangeOffset");

      if (!v29 || v12 == 206)
      {
        v44 = (void *)objc_claimAutoreleasedReturnValue([v13 promise]);
        v37 = (void (**)(id, void, id, char *))objc_claimAutoreleasedReturnValue([v44 progress]);

        if (v37) {
          v37[2]( v37,  0,  [v13 requestOffset],  (char *)objc_msgSend(v9, "countOfBytesExpectedToReceive") + (void)objc_msgSend(v13, "requestOffset"));
        }
        (*((void (**)(id, uint64_t))v11 + 2))(v11, 1LL);
      }

      else
      {
        if (qword_10032E790 != -1) {
          dispatch_once(&qword_10032E790, &stru_1002E91C0);
        }
        v30 = off_100328588;
        v31 = (char *)[v13 signpostId];
        if ((unint64_t)(v31 - 1) <= 0xFFFFFFFFFFFFFFFDLL)
        {
          os_signpost_id_t v32 = (os_signpost_id_t)v31;
          if (os_signpost_enabled((os_log_t)v30))
          {
            v33 = (void *)objc_claimAutoreleasedReturnValue([v13 logKey]);
            *(_DWORD *)buf = 138543618;
            v79 = v33;
            __int16 v80 = 2050;
            uint64_t v81 = v12;
            _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  (os_log_t)v30,  OS_SIGNPOST_EVENT,  v32,  "ConsumerReset",  " uuid=%{public, signpost.description:attribute}@  status=%{public, signpost.description:attribute}ld ",  buf,  0x16u);
          }
        }

        if (qword_10032E790 != -1) {
          dispatch_once(&qword_10032E790, &stru_1002E91C0);
        }
        v34 = off_100328588;
        if (os_log_type_enabled((os_log_t)off_100328588, OS_LOG_TYPE_ERROR))
        {
          v64 = v34;
          v65 = (void *)objc_claimAutoreleasedReturnValue([v13 logKey]);
          *(_DWORD *)buf = 138543874;
          v79 = v65;
          __int16 v80 = 2114;
          uint64_t v81 = (uint64_t)v9;
          __int16 v82 = 2048;
          uint64_t v83 = v12;
          _os_log_error_impl( (void *)&_mh_execute_header,  v64,  OS_LOG_TYPE_ERROR,  "[%{public}@] Resetting data consumer for task: %{public}@ after receiving status code: %ld",  buf,  0x20u);
        }

        v35 = (void *)objc_claimAutoreleasedReturnValue([v13 properties]);
        v36 = (void *)objc_claimAutoreleasedReturnValue([v35 dataConsumer]);

        v73[0] = _NSConcreteStackBlock;
        v73[1] = 3221225472LL;
        v73[2] = sub_10004BF48;
        v73[3] = &unk_1002E7108;
        v73[4] = v68;
        id v74 = v36;
        id v75 = v13;
        id v76 = v9;
        id v77 = v11;
        v37 = v36;
        [v37 truncateWithCompletionHandler:v73];
      }
    }

- (void)URLSession:(id)a3 _willRetryBackgroundDataTask:(id)a4 withError:(id)a5
{
  id v6 = a4;
  id v7 = a5;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[AssetTaskInfo taskInfoForTask:](&OBJC_CLASS___AssetTaskInfo, "taskInfoForTask:", v6));
  id v9 = v8;
  if (v8)
  {
    if ([v8 ignoreAssetCache])
    {
      if (qword_10032E790 != -1) {
        dispatch_once(&qword_10032E790, &stru_1002E91C0);
      }
      id v10 = off_100328588;
      if (os_log_type_enabled((os_log_t)off_100328588, OS_LOG_TYPE_ERROR))
      {
        id v22 = v10;
        id v23 = (void *)objc_claimAutoreleasedReturnValue([v9 logKey]);
        int v26 = 138543874;
        v27 = v23;
        __int16 v28 = 2114;
        id v29 = v6;
        __int16 v30 = 2114;
        id v31 = v7;
        _os_log_error_impl( (void *)&_mh_execute_header,  v22,  OS_LOG_TYPE_ERROR,  "[%{public}@] Retry scheduled for task: %{public}@ error: %{public}@",  (uint8_t *)&v26,  0x20u);
      }

      if (qword_10032E790 != -1) {
        dispatch_once(&qword_10032E790, &stru_1002E91C0);
      }
      id v11 = off_100328588;
      uint64_t v12 = (char *)[v9 signpostId];
      if ((unint64_t)(v12 - 1) <= 0xFFFFFFFFFFFFFFFDLL)
      {
        os_signpost_id_t v13 = (os_signpost_id_t)v12;
        if (os_signpost_enabled((os_log_t)v11))
        {
          v14 = (void *)objc_claimAutoreleasedReturnValue([v9 logKey]);
          v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "lib_shortDescription"));
          int v26 = 138543618;
          v27 = v14;
          __int16 v28 = 2114;
          id v29 = v15;
          _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  (os_log_t)v11,  OS_SIGNPOST_EVENT,  v13,  "WillRetry",  " uuid=%{public, signpost.description:attribute}@  error=%{public, signpost.description:attribute}@ ",  (uint8_t *)&v26,  0x16u);
        }
      }
    }

    else
    {
      if (qword_10032E790 != -1) {
        dispatch_once(&qword_10032E790, &stru_1002E91C0);
      }
      os_signpost_id_t v16 = off_100328588;
      if (os_log_type_enabled((os_log_t)off_100328588, OS_LOG_TYPE_ERROR))
      {
        id v24 = v16;
        v25 = (void *)objc_claimAutoreleasedReturnValue([v9 logKey]);
        int v26 = 138543874;
        v27 = v25;
        __int16 v28 = 2114;
        id v29 = v6;
        __int16 v30 = 2114;
        id v31 = v7;
        _os_log_error_impl( (void *)&_mh_execute_header,  v24,  OS_LOG_TYPE_ERROR,  "[%{public}@] Canceling task: %{public}@ after cache request failed with error: %{public}@",  (uint8_t *)&v26,  0x20u);
      }

      if (qword_10032E790 != -1) {
        dispatch_once(&qword_10032E790, &stru_1002E91C0);
      }
      id v17 = off_100328588;
      v18 = (char *)[v9 signpostId];
      if ((unint64_t)(v18 - 1) <= 0xFFFFFFFFFFFFFFFDLL)
      {
        os_signpost_id_t v19 = (os_signpost_id_t)v18;
        if (os_signpost_enabled((os_log_t)v17))
        {
          uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue([v9 logKey]);
          v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "lib_shortDescription"));
          int v26 = 138543618;
          v27 = v20;
          __int16 v28 = 2114;
          id v29 = v21;
          _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  (os_log_t)v17,  OS_SIGNPOST_EVENT,  v19,  "CacheFail",  " uuid=%{public, signpost.description:attribute}@  error=%{public, signpost.description:attribute}@ ",  (uint8_t *)&v26,  0x16u);
        }
      }

      [v9 setAction:1];
      [v9 setIgnoreAssetCache:1];
      id v11 = (void *)objc_claimAutoreleasedReturnValue([v9 task]);
      [v11 cancel];
    }
  }

  else
  {
    if (qword_10032E790 != -1) {
      dispatch_once(&qword_10032E790, &stru_1002E91C0);
    }
    if (os_log_type_enabled((os_log_t)off_100328588, OS_LOG_TYPE_ERROR)) {
      sub_100260F70();
    }
    [v6 cancel];
  }
}

- (void)URLSession:(id)a3 task:(id)a4 didCompleteWithError:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  id v9 = (void *)objc_claimAutoreleasedReturnValue(+[AssetTaskInfo taskInfoForTask:](&OBJC_CLASS___AssetTaskInfo, "taskInfoForTask:", v7));
  if (v9)
  {
    if (qword_10032E790 != -1) {
      dispatch_once(&qword_10032E790, &stru_1002E91C0);
    }
    id v10 = off_100328588;
    id v11 = (char *)[v9 signpostId];
    if ((unint64_t)(v11 - 1) <= 0xFFFFFFFFFFFFFFFDLL)
    {
      os_signpost_id_t v12 = (os_signpost_id_t)v11;
      if (os_signpost_enabled((os_log_t)v10))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  (os_log_t)v10,  OS_SIGNPOST_INTERVAL_END,  v12,  "Download/Transfer",  "",  buf,  2u);
      }
    }

    if (qword_10032E790 != -1) {
      dispatch_once(&qword_10032E790, &stru_1002E91C0);
    }
    os_signpost_id_t v13 = off_100328588;
    if (os_log_type_enabled((os_log_t)off_100328588, OS_LOG_TYPE_DEFAULT))
    {
      v14 = v13;
      v15 = (void *)objc_claimAutoreleasedReturnValue([v9 logKey]);
      *(_DWORD *)buf = 138543618;
      __int16 v28 = v15;
      __int16 v29 = 2114;
      id v30 = v7;
      _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_DEFAULT,  "[%{public}@] Completed task: %{public}@",  buf,  0x16u);
    }

    id v16 = [v9 action];
    if (v8 && !v16)
    {
      if (([v9 ignoreAssetCache] & 1) == 0)
      {
        if (qword_10032E790 != -1) {
          dispatch_once(&qword_10032E790, &stru_1002E91C0);
        }
        if (os_log_type_enabled((os_log_t)off_100328588, OS_LOG_TYPE_ERROR)) {
          sub_100261054();
        }
        [v9 setIgnoreAssetCache:1];
        [v9 setAction:1];
      }

      id v17 = (void *)objc_claimAutoreleasedReturnValue([v9 error]);

      if (!v17) {
        [v9 setError:v8];
      }
      -[AssetSession _completeNetworkActivityWithReason:usingTaskInfo:]( self,  "_completeNetworkActivityWithReason:usingTaskInfo:",  3LL,  v9);
    }

    v18 = (void *)objc_claimAutoreleasedReturnValue([v9 error]);
    -[AssetSession _reportMetricsForTaskInfo:withCompletionError:]( self,  "_reportMetricsForTaskInfo:withCompletionError:",  v9,  v18);

    os_signpost_id_t v19 = (void *)objc_claimAutoreleasedReturnValue([v9 properties]);
    uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue([v19 dataConsumer]);

    if (v8 && [v9 action] != (id)2)
    {
      -[AssetSession _completeNetworkActivityWithReason:usingTaskInfo:]( self,  "_completeNetworkActivityWithReason:usingTaskInfo:",  4LL,  v9);
      v23[0] = _NSConcreteStackBlock;
      v23[1] = 3221225472LL;
      v23[2] = sub_10004D388;
      v23[3] = &unk_1002E79F8;
      v23[4] = self;
      v21 = &v24;
      id v24 = v9;
      [v20 suspendWithCompletionHandler:v23];
    }

    else
    {
      -[AssetSession _completeNetworkActivityWithReason:usingTaskInfo:]( self,  "_completeNetworkActivityWithReason:usingTaskInfo:",  2LL,  v9);
      v25[0] = _NSConcreteStackBlock;
      v25[1] = 3221225472LL;
      v25[2] = sub_10004D23C;
      v25[3] = &unk_1002E79F8;
      v25[4] = self;
      v21 = &v26;
      id v26 = v9;
      [v20 finishWithCompletionHandler:v25];
    }
  }

  else
  {
    if (qword_10032E790 != -1) {
      dispatch_once(&qword_10032E790, &stru_1002E91C0);
    }
    id v22 = (os_log_s *)off_100328588;
    if (os_log_type_enabled((os_log_t)off_100328588, OS_LOG_TYPE_ERROR)) {
      sub_100260FD4((uint64_t)v7, (uint64_t)v8, v22);
    }
  }
}

- (void)URLSession:(id)a3 task:(id)a4 didFinishCollectingMetrics:(id)a5
{
  id v6 = a4;
  id v7 = a5;
  id v8 = (void *)objc_claimAutoreleasedReturnValue(+[AssetTaskInfo taskInfoForTask:](&OBJC_CLASS___AssetTaskInfo, "taskInfoForTask:", v6));
  if (v8)
  {
    if (qword_10032E790 != -1) {
      dispatch_once(&qword_10032E790, &stru_1002E91C0);
    }
    id v9 = off_100328588;
    if (os_log_type_enabled((os_log_t)off_100328588, OS_LOG_TYPE_INFO))
    {
      id v10 = v9;
      id v11 = (void *)objc_claimAutoreleasedReturnValue([v8 logKey]);
      *(_DWORD *)buf = 138543874;
      id v33 = v11;
      __int16 v34 = 2114;
      double v35 = *(double *)&v6;
      __int16 v36 = 2114;
      id v37 = v7;
      _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_INFO,  "[%{public}@] Collected metrics for task: %{public}@ metrics: %{public}@",  buf,  0x20u);
    }

    id v26 = v6;
    __int128 v29 = 0u;
    __int128 v30 = 0u;
    __int128 v27 = 0u;
    __int128 v28 = 0u;
    os_signpost_id_t v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "transactionMetrics", v7));
    id v13 = [v12 countByEnumeratingWithState:&v27 objects:v31 count:16];
    if (v13)
    {
      id v14 = v13;
      uint64_t v15 = *(void *)v28;
      do
      {
        id v16 = 0LL;
        do
        {
          if (*(void *)v28 != v15) {
            objc_enumerationMutation(v12);
          }
          id v17 = *(void **)(*((void *)&v27 + 1) + 8LL * (void)v16);
          v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "lib_responseInterval"));
          if (v18)
          {
            if (qword_10032E790 != -1) {
              dispatch_once(&qword_10032E790, &stru_1002E91C0);
            }
            os_signpost_id_t v19 = off_100328588;
            if (os_log_type_enabled((os_log_t)off_100328588, OS_LOG_TYPE_DEFAULT))
            {
              uint64_t v20 = v19;
              v21 = (void *)objc_claimAutoreleasedReturnValue([v8 logKey]);
              double v22 = (double)(uint64_t)[v17 countOfResponseBodyBytesReceived];
              [v18 duration];
              *(_DWORD *)buf = 138543618;
              id v33 = v21;
              __int16 v34 = 2048;
              double v35 = v22 / v23;
              _os_log_impl( (void *)&_mh_execute_header,  v20,  OS_LOG_TYPE_DEFAULT,  "[%{public}@] Response body bytes received speed: %.0f",  buf,  0x16u);
            }
          }

          id v16 = (char *)v16 + 1;
        }

        while (v14 != v16);
        id v14 = [v12 countByEnumeratingWithState:&v27 objects:v31 count:16];
      }

      while (v14);
    }

    id v7 = v25;
    [v8 setMetrics:v25];
    id v6 = v26;
  }

  else
  {
    if (qword_10032E790 != -1) {
      dispatch_once(&qword_10032E790, &stru_1002E91C0);
    }
    id v24 = (os_log_s *)off_100328588;
    if (os_log_type_enabled((os_log_t)off_100328588, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138543362;
      id v33 = v6;
      _os_log_impl( (void *)&_mh_execute_header,  v24,  OS_LOG_TYPE_INFO,  "Untracked task: %{public}@ did finish collecting metrics",  buf,  0xCu);
    }
  }
}

- (void)URLSession:(id)a3 task:(id)a4 _willSendRequestForEstablishedConnection:(id)a5 completionHandler:(id)a6
{
  id v8 = a4;
  id v9 = a5;
  id v10 = (void (**)(id, void))a6;
  id v11 = (void *)objc_claimAutoreleasedReturnValue(+[AssetTaskInfo taskInfoForTask:](&OBJC_CLASS___AssetTaskInfo, "taskInfoForTask:", v8));
  if (v11)
  {
    if (qword_10032E790 != -1) {
      dispatch_once(&qword_10032E790, &stru_1002E91C0);
    }
    os_signpost_id_t v12 = off_100328588;
    id v13 = (char *)[v11 signpostId];
    if ((unint64_t)(v13 - 1) <= 0xFFFFFFFFFFFFFFFDLL)
    {
      os_signpost_id_t v14 = (os_signpost_id_t)v13;
      if (os_signpost_enabled((os_log_t)v12))
      {
        uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue([v11 logKey]);
        int v21 = 138543362;
        double v22 = v15;
        _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  (os_log_t)v12,  OS_SIGNPOST_EVENT,  v14,  "TaskConnecting",  " uuid=%{public, signpost.description:attribute}@ ",  (uint8_t *)&v21,  0xCu);
      }
    }

    if (qword_10032E790 != -1) {
      dispatch_once(&qword_10032E790, &stru_1002E91C0);
    }
    id v16 = off_100328588;
    BOOL v17 = os_log_type_enabled((os_log_t)off_100328588, OS_LOG_TYPE_DEFAULT);
    id v18 = v9;
    if (v17)
    {
      os_signpost_id_t v19 = v16;
      uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue([v11 logKey]);
      int v21 = 138543618;
      double v22 = v20;
      __int16 v23 = 2114;
      id v24 = v8;
      _os_log_impl( (void *)&_mh_execute_header,  v19,  OS_LOG_TYPE_DEFAULT,  "[%{public}@] Task: %{public}@ will send request",  (uint8_t *)&v21,  0x16u);

      id v18 = v9;
    }
  }

  else
  {
    if (qword_10032E790 != -1) {
      dispatch_once(&qword_10032E790, &stru_1002E91C0);
    }
    if (os_log_type_enabled((os_log_t)off_100328588, OS_LOG_TYPE_ERROR)) {
      sub_1002611E0();
    }
    id v18 = 0LL;
  }

  ((void (**)(id, id))v10)[2](v10, v18);
}

- (void)_completeNetworkActivityWithReason:(int)a3 usingTaskInfo:(id)a4
{
  uint64_t v4 = *(void *)&a3;
  id v7 = a4;
  uint64_t v5 = objc_claimAutoreleasedReturnValue([v7 networkActivity]);
  id v6 = (void *)v5;
  if (v5)
  {
    nw_activity_complete_with_reason(v5, v4);
    [v7 setNetworkActivity:0];
  }
}

- (id)_findSessionUsingTaskInfo:(id)a3 withProperties:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSURLSessionConfiguration asset_configurationIdentifierUsingProperties:]( &OBJC_CLASS___NSURLSessionConfiguration,  "asset_configurationIdentifierUsingProperties:",  v7));
  [v6 setConfigurationID:v8];
  id v9 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_sessions, "objectForKeyedSubscript:", v8));
  uint64_t v10 = objc_claimAutoreleasedReturnValue([v9 maximumWatchCellularTransferSize]);
  if (v10)
  {
    id v11 = (void *)v10;
    os_signpost_id_t v12 = (void *)objc_claimAutoreleasedReturnValue([v9 maximumWatchCellularTransferSize]);
    id v13 = [v12 unsignedLongLongValue];
    id v14 = [v7 expectedContentLength];

    if (v13 < v14)
    {
      if (qword_10032E790 != -1) {
        dispatch_once(&qword_10032E790, &stru_1002E91C0);
      }
      uint64_t v15 = off_100328588;
      if (os_log_type_enabled((os_log_t)off_100328588, OS_LOG_TYPE_DEFAULT))
      {
        id v16 = v15;
        BOOL v17 = (void *)objc_claimAutoreleasedReturnValue([v6 logKey]);
        id v18 = (void *)objc_claimAutoreleasedReturnValue([v9 maximumWatchCellularTransferSize]);
        *(_DWORD *)buf = 138543874;
        os_signpost_id_t v40 = v17;
        __int16 v41 = 2048;
        uint64_t v42 = (const char *)[v18 unsignedLongLongValue];
        __int16 v43 = 2048;
        id v44 = [v7 expectedContentLength];
        _os_log_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_DEFAULT,  "[%{public}@] Creating new session because download exceeds maximum watch cellular transfer size for existing s ession (Max: %lld, Download: %lld)",  buf,  0x20u);
      }

      goto LABEL_15;
    }
  }

  if (!v9)
  {
LABEL_15:
    id v29 = [v7 discretionaryType];
    if (v29) {
      uint64_t v30 = objc_claimAutoreleasedReturnValue( +[NSURLSessionConfiguration asset_backgroundSessionConfigurationUsingProperties:]( &OBJC_CLASS___NSURLSessionConfiguration,  "asset_backgroundSessionConfigurationUsingProperties:",  v7));
    }
    else {
      uint64_t v30 = objc_claimAutoreleasedReturnValue( +[NSURLSessionConfiguration asset_ephemeralSessionConfigurationUsingProperties:]( &OBJC_CLASS___NSURLSessionConfiguration,  "asset_ephemeralSessionConfigurationUsingProperties:",  v7));
    }
    __int128 v27 = (void *)v30;
    __int128 v28 = (void *)objc_claimAutoreleasedReturnValue( +[NSURLSession sessionWithConfiguration:delegate:delegateQueue:]( &OBJC_CLASS___NSURLSession,  "sessionWithConfiguration:delegate:delegateQueue:",  v30,  self,  self->_delegateQueue));
    id v31 = (void *)objc_claimAutoreleasedReturnValue([v7 maximumWatchCellularTransferSize]);
    id v9 = (void *)objc_claimAutoreleasedReturnValue( +[CachedURLSession cachedSession:maximumWatchCellularTransferSize:]( &OBJC_CLASS___CachedURLSession,  "cachedSession:maximumWatchCellularTransferSize:",  v28,  v31));
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_sessions, "setObject:forKeyedSubscript:", v9, v8);

    if (qword_10032E790 != -1) {
      dispatch_once(&qword_10032E790, &stru_1002E91C0);
    }
    os_signpost_id_t v32 = off_100328588;
    if (os_log_type_enabled((os_log_t)off_100328588, OS_LOG_TYPE_DEFAULT))
    {
      id v33 = v32;
      __int16 v34 = (void *)objc_claimAutoreleasedReturnValue([v6 logKey]);
      if (v29) {
        double v35 = "background";
      }
      else {
        double v35 = "ephemeral";
      }
      __int16 v36 = (void *)objc_claimAutoreleasedReturnValue([v27 identifier]);
      *(_DWORD *)buf = 138544130;
      os_signpost_id_t v40 = v34;
      __int16 v41 = 2080;
      uint64_t v42 = v35;
      __int16 v43 = 2114;
      id v44 = v36;
      __int16 v45 = 2114;
      v46 = v8;
      _os_log_impl( (void *)&_mh_execute_header,  v33,  OS_LOG_TYPE_DEFAULT,  "[%{public}@] Created new %s session with identifier: %{public}@ (%{public}@)",  buf,  0x2Au);
    }

    goto LABEL_25;
  }

  if (qword_10032E790 != -1) {
    dispatch_once(&qword_10032E790, &stru_1002E91C0);
  }
  os_signpost_id_t v19 = off_100328588;
  if (os_log_type_enabled((os_log_t)off_100328588, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v20 = v19;
    int v21 = (void *)objc_claimAutoreleasedReturnValue([v6 logKey]);
    double v22 = (void *)objc_claimAutoreleasedReturnValue([v9 session]);
    __int16 v23 = (void *)objc_claimAutoreleasedReturnValue([v22 configuration]);
    id v24 = (char *)objc_claimAutoreleasedReturnValue([v23 identifier]);
    *(_DWORD *)buf = 138543874;
    os_signpost_id_t v40 = v21;
    __int16 v41 = 2114;
    uint64_t v42 = v24;
    __int16 v43 = 2114;
    id v44 = v8;
    _os_log_impl( (void *)&_mh_execute_header,  v20,  OS_LOG_TYPE_DEFAULT,  "[%{public}@] Reusing existing session with identifier: %{public}@ (%{public}@)",  buf,  0x20u);
  }

  v25 = (void *)objc_claimAutoreleasedReturnValue([v9 session]);
  id v26 = (void *)objc_claimAutoreleasedReturnValue([v25 configuration]);
  __int128 v27 = (void *)objc_claimAutoreleasedReturnValue([v26 identifier]);

  if (v27)
  {
    __int128 v28 = (void *)objc_claimAutoreleasedReturnValue([v27 stringByAppendingFormat:@" (%@)", v8]);
    [v6 setConfigurationID:v28];
LABEL_25:
  }

  id v37 = (void *)objc_claimAutoreleasedReturnValue([v9 session]);
  return v37;
}

- (void)_finishPromiseUsingTaskInfo:(id)a3
{
  id v3 = a3;
  if (qword_10032E790 != -1) {
    dispatch_once(&qword_10032E790, &stru_1002E91C0);
  }
  uint64_t v4 = off_100328588;
  uint64_t v5 = (char *)[v3 signpostId];
  if ((unint64_t)(v5 - 1) <= 0xFFFFFFFFFFFFFFFDLL)
  {
    os_signpost_id_t v6 = (os_signpost_id_t)v5;
    if (os_signpost_enabled((os_log_t)v4))
    {
      LOWORD(v20) = 0;
      _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  (os_log_t)v4,  OS_SIGNPOST_INTERVAL_END,  v6,  "Download",  "",  (uint8_t *)&v20,  2u);
    }
  }

  [v3 setKeepAlive:0];
  if (qword_10032E790 != -1) {
    dispatch_once(&qword_10032E790, &stru_1002E91C0);
  }
  id v7 = off_100328588;
  if (os_log_type_enabled((os_log_t)off_100328588, OS_LOG_TYPE_DEFAULT))
  {
    id v8 = v7;
    id v9 = (void *)objc_claimAutoreleasedReturnValue([v3 logKey]);
    int v20 = 138543362;
    int v21 = v9;
    _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "[%{public}@] Finishing asset promise",  (uint8_t *)&v20,  0xCu);
  }

  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([v3 promise]);
  if ([v10 isFinished])
  {
    if (([v10 isCancelled] & 1) == 0)
    {
      if (qword_10032E790 != -1) {
        dispatch_once(&qword_10032E790, &stru_1002E91C0);
      }
      id v11 = off_100328588;
      if (os_log_type_enabled((os_log_t)off_100328588, OS_LOG_TYPE_FAULT)) {
        sub_100261244(v11);
      }
    }
  }

  else
  {
    os_signpost_id_t v12 = objc_alloc_init(&OBJC_CLASS___AssetResult);
    -[AssetResult setBytesReceived:](v12, "setBytesReceived:", [v3 bytesReceived]);
    id v13 = (void *)objc_claimAutoreleasedReturnValue([v3 properties]);
    id v14 = (void *)objc_claimAutoreleasedReturnValue([v13 dataConsumer]);
    -[AssetResult setDataConsumer:](v12, "setDataConsumer:", v14);

    uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue([v3 error]);
    -[AssetResult setError:](v12, "setError:", v15);

    id v16 = (void *)objc_claimAutoreleasedReturnValue([v3 metrics]);
    -[AssetResult setMetrics:](v12, "setMetrics:", v16);

    [v10 finishWithResult:v12];
    if (qword_10032E790 != -1) {
      dispatch_once(&qword_10032E790, &stru_1002E91C0);
    }
    BOOL v17 = off_100328588;
    if (os_log_type_enabled((os_log_t)off_100328588, OS_LOG_TYPE_DEFAULT))
    {
      id v18 = v17;
      os_signpost_id_t v19 = (void *)objc_claimAutoreleasedReturnValue([v3 logKey]);
      int v20 = 138543362;
      int v21 = v19;
      _os_log_impl( (void *)&_mh_execute_header,  v18,  OS_LOG_TYPE_DEFAULT,  "[%{public}@] Finished asset promise",  (uint8_t *)&v20,  0xCu);
    }
  }

  +[AssetTaskInfo removeTaskInfo:](&OBJC_CLASS___AssetTaskInfo, "removeTaskInfo:", v3);
}

- (void)_reportMetricsForTaskInfo:(id)a3 withCompletionError:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = objc_alloc(&OBJC_CLASS___AMSMetricsLoadURLContext);
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v5 task]);
  id v9 = (void *)objc_claimAutoreleasedReturnValue([v5 metrics]);
  id v10 = [v7 initWithTask:v8 metrics:v9];

  id v11 = (void *)objc_claimAutoreleasedReturnValue(+[Bag defaultBag](&OBJC_CLASS____TtC9storekitd3Bag, "defaultBag"));
  [v10 setBag:v11];

  [v10 setError:v6];
  os_signpost_id_t v12 = (void *)objc_claimAutoreleasedReturnValue([v5 session]);
  [v10 setSession:v12];

  if (+[AMSMetricsLoadURLEvent shouldCollectMetricsForContext:]( &OBJC_CLASS___AMSMetricsLoadURLEvent,  "shouldCollectMetricsForContext:",  v10))
  {
    if (qword_10032E790 != -1) {
      dispatch_once(&qword_10032E790, &stru_1002E91C0);
    }
    id v13 = off_100328588;
    id v14 = (char *)[v5 signpostId];
    if ((unint64_t)(v14 - 1) <= 0xFFFFFFFFFFFFFFFDLL)
    {
      os_signpost_id_t v15 = (os_signpost_id_t)v14;
      if (os_signpost_enabled((os_log_t)v13))
      {
        id v16 = (void *)objc_claimAutoreleasedReturnValue([v5 logKey]);
        int v22 = 138543362;
        __int16 v23 = v16;
        _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  (os_log_t)v13,  OS_SIGNPOST_EVENT,  v15,  "RecordMetrics",  " uuid=%{public, signpost.description:attribute}@ ",  (uint8_t *)&v22,  0xCu);
      }
    }

    if (qword_10032E790 != -1) {
      dispatch_once(&qword_10032E790, &stru_1002E91C0);
    }
    BOOL v17 = off_100328588;
    if (os_log_type_enabled((os_log_t)off_100328588, OS_LOG_TYPE_DEFAULT))
    {
      id v18 = v17;
      os_signpost_id_t v19 = (void *)objc_claimAutoreleasedReturnValue([v5 logKey]);
      int v22 = 138543362;
      __int16 v23 = v19;
      _os_log_impl( (void *)&_mh_execute_header,  v18,  OS_LOG_TYPE_DEFAULT,  "[%{public}@] Recording LoadURL Metrics",  (uint8_t *)&v22,  0xCu);
    }

    id v20 = [[AMSMetricsLoadURLEvent alloc] initWithContext:v10];
    int v21 = (void *)objc_claimAutoreleasedReturnValue( +[AMSMetrics lib_sharedInstanceWithContainerId:]( &OBJC_CLASS___AMSMetrics,  "lib_sharedInstanceWithContainerId:",  @"com.apple.storekitd"));
    [v21 enqueueEvent:v20];
  }
}

- (void)_retryTaskUsingTaskInfo:(id)a3
{
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (qword_10032E790 != -1) {
    dispatch_once(&qword_10032E790, &stru_1002E91C0);
  }
  id v5 = off_100328588;
  id v6 = (char *)[v4 signpostId];
  if ((unint64_t)(v6 - 1) <= 0xFFFFFFFFFFFFFFFDLL)
  {
    os_signpost_id_t v7 = (os_signpost_id_t)v6;
    if (os_signpost_enabled((os_log_t)v5))
    {
      id v8 = (void *)objc_claimAutoreleasedReturnValue([v4 logKey]);
      *(_DWORD *)buf = 138543362;
      id v18 = v8;
      _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  (os_log_t)v5,  OS_SIGNPOST_EVENT,  v7,  "Retry",  " uuid=%{public, signpost.description:attribute}@ ",  buf,  0xCu);
    }
  }

  if (qword_10032E790 != -1) {
    dispatch_once(&qword_10032E790, &stru_1002E91C0);
  }
  id v9 = off_100328588;
  if (os_log_type_enabled((os_log_t)off_100328588, OS_LOG_TYPE_DEFAULT))
  {
    id v10 = v9;
    id v11 = (void *)objc_claimAutoreleasedReturnValue([v4 logKey]);
    *(_DWORD *)buf = 138543362;
    id v18 = v11;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "[%{public}@] Retrying request", buf, 0xCu);
  }

  [v4 setAction:0];
  [v4 setError:0];
  [v4 setKeepAlive:0];
  os_signpost_id_t v12 = (void *)objc_claimAutoreleasedReturnValue([v4 properties]);
  id v13 = (void *)objc_claimAutoreleasedReturnValue([v12 dataConsumer]);

  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472LL;
  v15[2] = sub_10004E80C;
  v15[3] = &unk_1002E79F8;
  v15[4] = self;
  id v16 = v4;
  id v14 = v4;
  [v13 resetWithCompletionHandler:v15];
}

- (void)_prepareDataConsumerUsingTaskInfo:(id)a3
{
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if ([v4 action] == (id)3)
  {
    if (qword_10032E790 != -1) {
      dispatch_once(&qword_10032E790, &stru_1002E91C0);
    }
    id v5 = off_100328588;
    if (os_log_type_enabled((os_log_t)off_100328588, OS_LOG_TYPE_ERROR)) {
      sub_100261358(v5);
    }
    -[AssetSession _finishPromiseUsingTaskInfo:](self, "_finishPromiseUsingTaskInfo:", v4);
  }

  else
  {
    id v6 = (void *)objc_claimAutoreleasedReturnValue([v4 properties]);
    os_signpost_id_t v7 = (void *)objc_claimAutoreleasedReturnValue([v6 dataConsumer]);

    if (v7)
    {
      v17[0] = _NSConcreteStackBlock;
      v17[1] = 3221225472LL;
      v17[2] = sub_10004EC28;
      v17[3] = &unk_1002E9178;
      v17[4] = self;
      id v18 = v4;
      [v7 prepareWithCompletionHandler:v17];
    }

    else
    {
      uint64_t v8 = ASDErrorWithDescription(@"AssetErrorDomain", 3LL, @"Data consumer is missing");
      id v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
      [v4 setError:v9];

      if (qword_10032E790 != -1) {
        dispatch_once(&qword_10032E790, &stru_1002E91C0);
      }
      id v10 = off_100328588;
      id v11 = (char *)[v4 signpostId];
      if ((unint64_t)(v11 - 1) <= 0xFFFFFFFFFFFFFFFDLL)
      {
        os_signpost_id_t v12 = (os_signpost_id_t)v11;
        if (os_signpost_enabled((os_log_t)v10))
        {
          id v13 = (void *)objc_claimAutoreleasedReturnValue([v4 logKey]);
          id v14 = (void *)objc_claimAutoreleasedReturnValue([v4 error]);
          os_signpost_id_t v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "lib_shortDescription"));
          *(_DWORD *)buf = 138543618;
          id v20 = v13;
          __int16 v21 = 2114;
          int v22 = v15;
          _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  (os_log_t)v10,  OS_SIGNPOST_EVENT,  v12,  "ConsumerError",  " uuid=%{public, signpost.description:attribute}@  error=%{public, signpost.description:attribute}@ ",  buf,  0x16u);
        }
      }

      if (qword_10032E790 != -1) {
        dispatch_once(&qword_10032E790, &stru_1002E91C0);
      }
      id v16 = off_100328588;
      if (os_log_type_enabled((os_log_t)off_100328588, OS_LOG_TYPE_ERROR)) {
        sub_1002613D8(v16);
      }
      -[AssetSession _finishPromiseUsingTaskInfo:](self, "_finishPromiseUsingTaskInfo:", v4);
    }
  }
}

- (void)_prepareRequestUsingTaskInfo:(id)a3
{
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if ([v4 action] == (id)3)
  {
    if (qword_10032E790 != -1) {
      dispatch_once(&qword_10032E790, &stru_1002E91C0);
    }
    id v5 = off_100328588;
    if (os_log_type_enabled((os_log_t)off_100328588, OS_LOG_TYPE_ERROR)) {
      sub_100261358(v5);
    }
    -[AssetSession _finishPromiseUsingTaskInfo:](self, "_finishPromiseUsingTaskInfo:", v4);
  }

  else
  {
    id v6 = (void *)objc_claimAutoreleasedReturnValue([v4 properties]);
    if (([v4 ignoreAssetCache] & 1) != 0
      || ![v6 locateAssetCache])
    {
      [v4 setIgnoreAssetCache:1];
      id v10 = (void *)objc_claimAutoreleasedReturnValue([v4 request]);
      -[AssetSession _startTaskUsingTaskInfo:withRequest:](self, "_startTaskUsingTaskInfo:withRequest:", v4, v10);
    }

    else
    {
      os_signpost_id_t v7 = (void *)objc_claimAutoreleasedReturnValue([v4 request]);
      uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v7 URL]);
      dispatchQueue = self->_dispatchQueue;
      v11[0] = _NSConcreteStackBlock;
      v11[1] = 3221225472LL;
      v11[2] = sub_10004F0A4;
      v11[3] = &unk_1002E91A0;
      v11[4] = self;
      id v12 = v4;
      ACSLocateCachingServer(v8, 0LL, dispatchQueue, v11, 30.0);
    }
  }
}

- (void)_startNetworkActivityUsingTaskInfo:(id)a3 withTask:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  os_signpost_id_t v7 = (void *)objc_claimAutoreleasedReturnValue([v5 properties]);
  id v8 = [v7 requestReason];

  uint64_t v9 = 1LL;
  switch((unint64_t)v8)
  {
    case 0uLL:
      if (qword_10032E790 != -1) {
        dispatch_once(&qword_10032E790, &stru_1002E91C0);
      }
      id v14 = off_100328588;
      if (os_log_type_enabled((os_log_t)off_100328588, OS_LOG_TYPE_ERROR)) {
        sub_1002615F8(v14);
      }
      break;
    case 1uLL:
    case 2uLL:
    case 3uLL:
    case 4uLL:
    case 6uLL:
    case 8uLL:
    case 9uLL:
      goto LABEL_2;
    case 5uLL:
      uint64_t v9 = 3LL;
      goto LABEL_2;
    case 7uLL:
      uint64_t v9 = 2LL;
LABEL_2:
      id v10 = (void *)nw_activity_create(38LL, v9);
      if (v10)
      {
        if (qword_10032E790 != -1) {
          dispatch_once(&qword_10032E790, &stru_1002E91C0);
        }
        id v11 = off_100328588;
        if (os_log_type_enabled((os_log_t)off_100328588, OS_LOG_TYPE_INFO))
        {
          id v12 = v11;
          id v13 = (void *)objc_claimAutoreleasedReturnValue([v5 logKey]);
          int v15 = 138543618;
          id v16 = v13;
          __int16 v17 = 2114;
          id v18 = v10;
          _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_INFO,  "[%{public}@] Activating network activity: %{public}@",  (uint8_t *)&v15,  0x16u);
        }

        nw_activity_activate(v10);
        objc_msgSend(v6, "set_nw_activity:", v10);
        [v5 setNetworkActivity:v10];
      }

      break;
    default:
      if (qword_10032E790 != -1) {
        dispatch_once(&qword_10032E790, &stru_1002E91C0);
      }
      if (os_log_type_enabled((os_log_t)off_100328588, OS_LOG_TYPE_ERROR)) {
        sub_100261568();
      }
      break;
  }
}

- (void)_startTaskUsingTaskInfo:(id)a3 withRequest:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if ([v6 action] == (id)3)
  {
    if (qword_10032E790 != -1) {
      dispatch_once(&qword_10032E790, &stru_1002E91C0);
    }
    id v8 = off_100328588;
    if (os_log_type_enabled((os_log_t)off_100328588, OS_LOG_TYPE_ERROR)) {
      sub_100261358(v8);
    }
    -[AssetSession _finishPromiseUsingTaskInfo:](self, "_finishPromiseUsingTaskInfo:", v6);
  }

  else
  {
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([v6 properties]);
    id v10 = objc_alloc(&OBJC_CLASS___NSMutableURLRequest);
    id v11 = v7;
    id v12 = -[NSMutableURLRequest _initWithCFURLRequest:]( v10,  "_initWithCFURLRequest:",  [v11 _CFURLRequest]);
    id v13 = (void *)objc_claimAutoreleasedReturnValue([v12 HTTPUserAgent]);

    if (!v13)
    {
      id v14 = (void *)objc_claimAutoreleasedReturnValue(+[AMSProcessInfo currentProcess](&OBJC_CLASS___AMSProcessInfo, "currentProcess"));
      int v15 = (void *)objc_claimAutoreleasedReturnValue( +[AMSUserAgent userAgentForProcessInfo:]( &OBJC_CLASS___AMSUserAgent,  "userAgentForProcessInfo:",  v14));
      [v12 setHTTPUserAgent:v15];
    }

    if ([v6 requestOffset]) {
      objc_msgSend(v12, "asset_setRangeOffset:", objc_msgSend(v6, "requestOffset"));
    }
    id v16 = sub_1000068B8((uint64_t)[v9 requestReason]);
    uint64_t v17 = objc_claimAutoreleasedReturnValue(v16);
    if (v17) {
      [v12 setValue:v17 forHTTPHeaderField:@"Apple-Download-Type"];
    }
    if (self->_session) {
      objc_msgSend(v6, "setSession:");
    }
    id v18 = (void *)objc_claimAutoreleasedReturnValue([v6 session]);

    if (!v18)
    {
      os_signpost_id_t v19 = (void *)objc_claimAutoreleasedReturnValue( -[AssetSession _findSessionUsingTaskInfo:withProperties:]( self,  "_findSessionUsingTaskInfo:withProperties:",  v6,  v9));
      [v6 setSession:v19];
    }

    id v20 = (void *)objc_claimAutoreleasedReturnValue([v6 session]);

    if (v20)
    {
      v67 = (void *)v17;
      __int16 v21 = (void *)objc_claimAutoreleasedReturnValue([v6 session]);
      int v22 = (void *)objc_claimAutoreleasedReturnValue([v21 dataTaskWithRequest:v12]);

      if (v22)
      {
        -[AssetSession _startNetworkActivityUsingTaskInfo:withTask:]( self,  "_startNetworkActivityUsingTaskInfo:withTask:",  v6,  v22);
        id v66 = v7;
        if (qword_10032E790 != -1) {
          dispatch_once(&qword_10032E790, &stru_1002E91C0);
        }
        __int16 v23 = off_100328588;
        id v24 = (char *)[v6 signpostId];
        if ((unint64_t)(v24 - 1) <= 0xFFFFFFFFFFFFFFFDLL)
        {
          os_signpost_id_t v25 = (os_signpost_id_t)v24;
          if (os_signpost_enabled((os_log_t)v23))
          {
            id v26 = (void *)objc_claimAutoreleasedReturnValue([v6 logKey]);
            __int128 v27 = (void *)objc_claimAutoreleasedReturnValue([v11 URL]);
            *(_DWORD *)buf = 138543618;
            id v74 = v26;
            __int16 v75 = 2114;
            uint64_t v76 = (uint64_t)v27;
            _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  (os_log_t)v23,  OS_SIGNPOST_EVENT,  v25,  "TaskCreated",  " uuid=%{public, signpost.description:attribute}@  request=%{public, signpost.description:attribute}@ ",  buf,  0x16u);
          }
        }

        if (qword_10032E790 != -1) {
          dispatch_once(&qword_10032E790, &stru_1002E91C0);
        }
        __int128 v28 = off_100328588;
        if (os_log_type_enabled((os_log_t)off_100328588, OS_LOG_TYPE_DEFAULT))
        {
          id v29 = v28;
          uint64_t v30 = (void *)objc_claimAutoreleasedReturnValue([v6 logKey]);
          id v31 = (void *)objc_claimAutoreleasedReturnValue([v6 configurationID]);
          os_signpost_id_t v32 = (void *)objc_claimAutoreleasedReturnValue([v11 URL]);
          *(_DWORD *)buf = 138544130;
          id v74 = v30;
          __int16 v75 = 2114;
          uint64_t v76 = (uint64_t)v22;
          __int16 v77 = 2114;
          v78 = v31;
          __int16 v79 = 2114;
          __int16 v80 = v32;
          _os_log_impl( (void *)&_mh_execute_header,  v29,  OS_LOG_TYPE_DEFAULT,  "[%{public}@] Created task: %{public}@ in session: %{public}@ for URL: %{public}@ ",  buf,  0x2Au);
        }

        +[AssetTaskInfo recordTaskInfo:forTask:](&OBJC_CLASS___AssetTaskInfo, "recordTaskInfo:forTask:", v6, v22);
        id v33 = (void *)objc_claimAutoreleasedReturnValue([v9 taskPriority]);

        if (v33)
        {
          __int16 v34 = (void *)objc_claimAutoreleasedReturnValue([v9 taskPriority]);
          objc_msgSend(v22, "set_priority:", objc_msgSend(v34, "longLongValue"));
        }

        else
        {
          if (qword_10032E790 != -1) {
            dispatch_once(&qword_10032E790, &stru_1002E91C0);
          }
          v49 = off_100328588;
          if (os_log_type_enabled((os_log_t)off_100328588, OS_LOG_TYPE_ERROR)) {
            sub_100261820(v49);
          }
          LODWORD(v50) = 1137180672;
          [v22 setPriority:v50];
        }

        v51 = (void *)objc_claimAutoreleasedReturnValue([v9 bytesPerSecondLimit]);

        if (v51)
        {
          v52 = (void *)objc_claimAutoreleasedReturnValue([v9 bytesPerSecondLimit]);
          objc_msgSend(v22, "set_bytesPerSecondLimit:", objc_msgSend(v52, "longLongValue"));
        }

        os_signpost_id_t v53 = (void *)objc_claimAutoreleasedReturnValue([v9 loadingPriority]);

        if (v53)
        {
          v54 = (void *)objc_claimAutoreleasedReturnValue([v9 loadingPriority]);
          [v54 doubleValue];
          objc_msgSend(v22, "set_loadingPriority:");
        }

        uint64_t v55 = (uint64_t)[v9 qosClass];
        if (!(_DWORD)v55)
        {
          if (qword_10032E790 != -1) {
            dispatch_once(&qword_10032E790, &stru_1002E91C0);
          }
          v56 = off_100328588;
          if (os_log_type_enabled((os_log_t)off_100328588, OS_LOG_TYPE_ERROR)) {
            sub_1002617A0(v56);
          }
          uint64_t v55 = 17LL;
        }

        v69[0] = _NSConcreteStackBlock;
        v69[1] = 3221225472LL;
        v69[2] = sub_10004FF10;
        v69[3] = &unk_1002E9128;
        id v57 = v6;
        id v70 = v57;
        id v71 = v11;
        id v72 = v22;
        v58 = objc_retainBlock(v69);
        v59 = (void *)objc_claimAutoreleasedReturnValue([v57 properties]);
        v60 = (void *)objc_claimAutoreleasedReturnValue([v59 externalID]);

        if (v60)
        {
          v61 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(+[VoucherStore sharedInstance](&OBJC_CLASS___VoucherStore, "sharedInstance"));
          uint64_t v62 = (void *)objc_claimAutoreleasedReturnValue([v57 properties]);
          v63 = (void *)objc_claimAutoreleasedReturnValue([v62 externalID]);
          -[dispatch_queue_s usingVoucherForExternalID:applyQOSClass:executeBlock:]( v61,  "usingVoucherForExternalID:applyQOSClass:executeBlock:",  v63,  v55,  v58);
        }

        else
        {
          dispatch_queue_global_t global_queue = dispatch_get_global_queue(v55, 0LL);
          v61 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(global_queue);
          dispatch_async(v61, v58);
        }

        id v7 = v66;
      }

      else
      {
        id v43 = v7;
        if (qword_10032E790 != -1) {
          dispatch_once(&qword_10032E790, &stru_1002E91C0);
        }
        id v44 = off_100328588;
        __int16 v45 = (char *)[v6 signpostId];
        if ((unint64_t)(v45 - 1) <= 0xFFFFFFFFFFFFFFFDLL)
        {
          os_signpost_id_t v46 = (os_signpost_id_t)v45;
          if (os_signpost_enabled((os_log_t)v44))
          {
            v65 = (void *)objc_claimAutoreleasedReturnValue([v6 logKey]);
            *(_DWORD *)buf = 138543618;
            id v74 = v65;
            __int16 v75 = 2114;
            uint64_t v76 = objc_claimAutoreleasedReturnValue([v11 URL]);
            os_signpost_id_t v47 = (void *)v76;
            _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  (os_log_t)v44,  OS_SIGNPOST_EVENT,  v46,  "TaskError",  " uuid=%{public, signpost.description:attribute}@  request=%{public, signpost.description:attribute}@ ",  buf,  0x16u);
          }
        }

        if (qword_10032E790 != -1) {
          dispatch_once(&qword_10032E790, &stru_1002E91C0);
        }
        id v7 = v43;
        if (os_log_type_enabled((os_log_t)off_100328588, OS_LOG_TYPE_ERROR)) {
          sub_10026170C();
        }
        v48 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"AssetErrorDomain",  5LL,  0LL));
        [v6 setError:v48];

        -[AssetSession _finishPromiseUsingTaskInfo:](self, "_finishPromiseUsingTaskInfo:", v6);
      }

      double v35 = v67;
    }

    else
    {
      v68 = v11;
      double v35 = (void *)v17;
      id v36 = v7;
      if (qword_10032E790 != -1) {
        dispatch_once(&qword_10032E790, &stru_1002E91C0);
      }
      id v37 = off_100328588;
      v38 = (char *)[v6 signpostId];
      if ((unint64_t)(v38 - 1) <= 0xFFFFFFFFFFFFFFFDLL)
      {
        os_signpost_id_t v39 = (os_signpost_id_t)v38;
        if (os_signpost_enabled((os_log_t)v37))
        {
          os_signpost_id_t v40 = (void *)objc_claimAutoreleasedReturnValue([v6 logKey]);
          __int16 v41 = (void *)objc_claimAutoreleasedReturnValue([v68 URL]);
          *(_DWORD *)buf = 138543618;
          id v74 = v40;
          __int16 v75 = 2114;
          uint64_t v76 = (uint64_t)v41;
          _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  (os_log_t)v37,  OS_SIGNPOST_EVENT,  v39,  "SessionError",  " uuid=%{public, signpost.description:attribute}@  request=%{public, signpost.description:attribute}@ ",  buf,  0x16u);
        }
      }

      if (qword_10032E790 != -1) {
        dispatch_once(&qword_10032E790, &stru_1002E91C0);
      }
      id v7 = v36;
      if (os_log_type_enabled((os_log_t)off_100328588, OS_LOG_TYPE_ERROR)) {
        sub_100261678();
      }
      uint64_t v42 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"AssetErrorDomain",  4LL,  0LL));
      [v6 setError:v42];

      -[AssetSession _finishPromiseUsingTaskInfo:](self, "_finishPromiseUsingTaskInfo:", v6);
    }
  }
}

- (void).cxx_destruct
{
}

@end