@interface MSDSession
- (BOOL)getIsFileDownload;
- (BOOL)isDownloadPaused;
- (MSDSession)init;
- (MSDSession)initWithCellularAccess:(BOOL)a3;
- (MSDSessionTaskManager)taskManager;
- (NSURLSession)session;
- (OS_dispatch_queue)demuxQueue;
- (id)getServerErrorMessage:(id)a3 withDefault:(id)a4;
- (id)parseResponseHeader:(id)a3 statusCode:(int64_t)a4;
- (int64_t)requestTimeoutCount;
- (unint64_t)signpostId;
- (void)URLSession:(id)a3 dataTask:(id)a4 didReceiveData:(id)a5;
- (void)URLSession:(id)a3 dataTask:(id)a4 didReceiveResponse:(id)a5 completionHandler:(id)a6;
- (void)URLSession:(id)a3 task:(id)a4 didCompleteWithError:(id)a5;
- (void)URLSession:(id)a3 task:(id)a4 didFinishCollectingMetrics:(id)a5;
- (void)URLSession:(id)a3 task:(id)a4 didReceiveChallenge:(id)a5 completionHandler:(id)a6;
- (void)URLSession:(id)a3 task:(id)a4 willPerformHTTPRedirection:(id)a5 newRequest:(id)a6 completionHandler:(id)a7;
- (void)authenticate:(id)a3 forTask:(id)a4 completion:(id)a5;
- (void)dispatchSessionTask:(id)a3;
- (void)dispatchSessionTask:(id)a3 withError:(id *)a4;
- (void)handleDownloadAborted:(id)a3;
- (void)handleDownloadPaused:(id)a3;
- (void)invalidate;
- (void)launchTaskWithInfo:(id)a3;
- (void)logDownloadTaskLaunch:(id)a3;
- (void)retrySessionTask:(id)a3;
- (void)setDemuxQueue:(id)a3;
- (void)setIsDownloadPaused:(BOOL)a3;
- (void)setRequestTimeoutCount:(int64_t)a3;
- (void)setSession:(id)a3;
- (void)setSignpostId:(unint64_t)a3;
- (void)setTaskManager:(id)a3;
@end

@implementation MSDSession

- (MSDSession)init
{
  return -[MSDSession initWithCellularAccess:](self, "initWithCellularAccess:", 1LL);
}

- (MSDSession)initWithCellularAccess:(BOOL)a3
{
  BOOL v3 = a3;
  v28.receiver = self;
  v28.super_class = (Class)&OBJC_CLASS___MSDSession;
  v4 = -[MSDSession init](&v28, "init");
  if (v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSURLSessionConfiguration defaultSessionConfiguration]( &OBJC_CLASS___NSURLSessionConfiguration,  "defaultSessionConfiguration"));
    [v5 setURLCache:0];
    [v5 setRequestCachePolicy:1];
    objc_msgSend(v5, "set_timingDataOptions:", 2);
    [v5 setAllowsCellularAccess:v3];
    v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSURLSession sessionWithConfiguration:delegate:delegateQueue:]( &OBJC_CLASS___NSURLSession,  "sessionWithConfiguration:delegate:delegateQueue:",  v5,  v4,  0LL));
    -[MSDSession setSession:](v4, "setSession:", v6);

    v7 = (void *)objc_claimAutoreleasedReturnValue(-[MSDSession session](v4, "session"));
    if (v7)
    {
      v8 = objc_alloc_init(&OBJC_CLASS___MSDSessionTaskManager);
      -[MSDSession setTaskManager:](v4, "setTaskManager:", v8);

      dispatch_queue_t v9 = dispatch_queue_create("com.apple.msdconnection-demux", &_dispatch_queue_attr_concurrent);
      -[MSDSession setDemuxQueue:](v4, "setDemuxQueue:", v9);

      -[MSDSession setRequestTimeoutCount:](v4, "setRequestTimeoutCount:", 0LL);
      -[MSDSession setIsDownloadPaused:](v4, "setIsDownloadPaused:", 0LL);
      id v10 = sub_10003AAAC();
      v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
      -[MSDSession setSignpostId:](v4, "setSignpostId:", os_signpost_id_generate(v11));

      objc_initWeak(&location, v4);
      if (-[MSDSession getIsFileDownload](v4, "getIsFileDownload"))
      {
        v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
        v24[0] = _NSConcreteStackBlock;
        v24[1] = 3221225472LL;
        v24[2] = sub_10008C6BC;
        v24[3] = &unk_1000FACC8;
        v13 = v4;
        v25 = v13;
        objc_copyWeak(&v26, &location);
        id v14 =  [v12 addObserverForName:@"MSDNotificationPauseDownload" object:0 queue:0 usingBlock:v24];

        v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
        v21[0] = _NSConcreteStackBlock;
        v21[1] = 3221225472LL;
        v21[2] = sub_10008C7AC;
        v21[3] = &unk_1000FACC8;
        v22 = v13;
        objc_copyWeak(&v23, &location);
        id v16 =  [v15 addObserverForName:@"MSDNotificationAbortDownload" object:0 queue:0 usingBlock:v21];

        objc_destroyWeak(&v23);
        objc_destroyWeak(&v26);
      }

      v17 = v4;
      objc_destroyWeak(&location);
    }

    else
    {
      id v18 = sub_10003A95C();
      v19 = (os_log_s *)objc_claimAutoreleasedReturnValue(v18);
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
        sub_1000A051C();
      }

      v17 = 0LL;
    }
  }

  else
  {
    v17 = 0LL;
  }

  return v17;
}

- (void)invalidate
{
  id v2 = (id)objc_claimAutoreleasedReturnValue(-[MSDSession session](self, "session"));
  [v2 invalidateAndCancel];
}

- (void)launchTaskWithInfo:(id)a3
{
  id v4 = a3;
  id v5 = -[MSDSessionTask initFromTaskInfo:](objc_alloc(&OBJC_CLASS___MSDSessionTask), "initFromTaskInfo:", v4);

  v6 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[MSDSession demuxQueue](self, "demuxQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10008C980;
  block[3] = &unk_1000F94E0;
  block[4] = self;
  id v9 = v5;
  id v7 = v5;
  dispatch_sync(v6, block);
}

- (BOOL)getIsFileDownload
{
  return 0;
}

- (void)authenticate:(id)a3 forTask:(id)a4 completion:(id)a5
{
}

- (void)URLSession:(id)a3 dataTask:(id)a4 didReceiveResponse:(id)a5 completionHandler:(id)a6
{
  id v9 = a4;
  id v10 = a5;
  v11 = (void (**)(id, void))a6;
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[MSDSession taskManager](self, "taskManager"));
  v13 = (void *)objc_claimAutoreleasedReturnValue([v12 getSessionTask:v9]);

  if (!v13)
  {
    id v40 = sub_10003A95C();
    v37 = (os_log_s *)objc_claimAutoreleasedReturnValue(v40);
    if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR)) {
      sub_1000A0548();
    }
    id v16 = 0LL;
    v20 = 0LL;
    goto LABEL_26;
  }

  uint64_t v15 = objc_opt_class(&OBJC_CLASS___NSHTTPURLResponse, v14);
  if ((objc_opt_isKindOfClass(v10, v15) & 1) == 0)
  {
    id v41 = sub_10003A95C();
    v42 = (os_log_s *)objc_claimAutoreleasedReturnValue(v41);
    if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR)) {
      sub_1000A05A8();
    }

    BOOL v28 = 0;
    v20 = 0LL;
    id v16 = 0LL;
    goto LABEL_20;
  }

  id v16 = v10;
  v17 = (void *)objc_claimAutoreleasedReturnValue([v13 info]);
  id v18 = (void *)objc_claimAutoreleasedReturnValue([v17 savePath]);

  if (v18)
  {
    if ([v16 statusCode] != (id)200 && objc_msgSend(v16, "statusCode") != (id)206)
    {
      BOOL v28 = [v16 statusCode] == (id)416;
      if ([v16 statusCode] == (id)403 || objc_msgSend(v16, "statusCode") == (id)404) {
        [v13 setState:3];
      }
      v20 = 0LL;
      goto LABEL_20;
    }

    v19 = (void *)objc_claimAutoreleasedReturnValue([v16 allHeaderFields]);
    v20 = (void *)objc_claimAutoreleasedReturnValue([v19 objectForKey:@"Content-Range"]);

    if (!v20)
    {
      id v29 = sub_10003A95C();
      v30 = (os_log_s *)objc_claimAutoreleasedReturnValue(v29);
      if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
      {
        v31 = (void *)objc_claimAutoreleasedReturnValue([v13 info]);
        v32 = (void *)objc_claimAutoreleasedReturnValue([v31 savePath]);
        int v43 = 138543618;
        id v44 = v32;
        __int16 v45 = 2114;
        v46 = @"Content-Range";
        _os_log_impl( (void *)&_mh_execute_header,  v30,  OS_LOG_TYPE_DEFAULT,  "HTTP response header for %{public}@ does not contain key %{public}@; cannot proceed with download",
          (uint8_t *)&v43,
          0x16u);
      }

      v20 = 0LL;
      BOOL v28 = 1;
      goto LABEL_20;
    }

    v21 = (void *)objc_claimAutoreleasedReturnValue([v13 contentRange]);
    [v21 processServerRangeResponse:v20];

    v22 = (void *)objc_claimAutoreleasedReturnValue([v13 contentRange]);
    unsigned int v23 = [v22 isDownloadComplete];

    if (v23)
    {
      id v24 = sub_10003A95C();
      v25 = (os_log_s *)objc_claimAutoreleasedReturnValue(v24);
      if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
      {
        id v26 = (void *)objc_claimAutoreleasedReturnValue([v13 info]);
        v27 = (void *)objc_claimAutoreleasedReturnValue([v26 savePath]);
        int v43 = 138543362;
        id v44 = v27;
        _os_log_impl( (void *)&_mh_execute_header,  v25,  OS_LOG_TYPE_DEFAULT,  "Download for %{public}@ is already complete, no need to continue with download task",  (uint8_t *)&v43,  0xCu);
      }

      BOOL v28 = 0;
LABEL_20:
      if (v28)
      {
        v33 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
        v34 = (void *)objc_claimAutoreleasedReturnValue([v13 info]);
        v35 = (void *)objc_claimAutoreleasedReturnValue([v34 savePath]);
        [v33 removeItemAtPath:v35 error:0];

        [v13 resetFileHandle];
      }

      id v36 = sub_10003A95C();
      v37 = (os_log_s *)objc_claimAutoreleasedReturnValue(v36);
      if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
      {
        id v38 = [v16 statusCode];
        unsigned int v39 = [v13 state];
        int v43 = 134218240;
        id v44 = v38;
        __int16 v45 = 1024;
        LODWORD(v46) = v39 == 2;
        _os_log_impl( (void *)&_mh_execute_header,  v37,  OS_LOG_TYPE_DEFAULT,  "Cancelling download task on status code: %ld; should retry=%d",
          (uint8_t *)&v43,
          0x12u);
      }

- (void)URLSession:(id)a3 dataTask:(id)a4 didReceiveData:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = objc_autoreleasePoolPush();
  v12 = (void *)objc_claimAutoreleasedReturnValue([v9 response]);
  id v13 = [v12 statusCode];
  uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue(-[MSDSession taskManager](self, "taskManager"));
  uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue([v14 getSessionTask:v9]);

  if (!v15)
  {
    id v20 = sub_10003A95C();
    v21 = (os_log_s *)objc_claimAutoreleasedReturnValue(v20);
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
      sub_1000A0548();
    }
    id v19 = 0LL;
    goto LABEL_15;
  }

  id v16 = (void *)objc_claimAutoreleasedReturnValue([v15 info]);
  v17 = (void *)objc_claimAutoreleasedReturnValue([v16 savePath]);
  if (!v17)
  {

LABEL_8:
    id v19 = (id)objc_claimAutoreleasedReturnValue([v15 outData]);
    [v19 appendData:v10];
    goto LABEL_9;
  }

  if (v13 != (id)206 && v13 != (id)200) {
    goto LABEL_8;
  }
  id v18 = (void *)objc_claimAutoreleasedReturnValue([v15 fileHandle]);
  id v23 = 0LL;
  [v18 writeData:v10 error:&v23];
  id v19 = v23;

  if (v19)
  {
    [v15 setError:v19];
    id v22 = sub_10003A95C();
    v21 = (os_log_s *)objc_claimAutoreleasedReturnValue(v22);
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
      sub_1000A05D4(v15, (uint64_t)v19, v21);
    }
LABEL_15:

    [v9 cancel];
    goto LABEL_9;
  }

  id v19 = (id)objc_claimAutoreleasedReturnValue([v15 contentRange]);
  objc_msgSend(v19, "appendDownloadedFileSize:", objc_msgSend(v10, "length"));
LABEL_9:

  objc_autoreleasePoolPop(v11);
}

- (void)URLSession:(id)a3 task:(id)a4 didReceiveChallenge:(id)a5 completionHandler:(id)a6
{
  id v9 = a4;
  id v10 = a5;
  v11 = (void (**)(id, uint64_t, void))a6;
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[MSDSession taskManager](self, "taskManager"));
  id v13 = (void *)objc_claimAutoreleasedReturnValue([v12 getSessionTask:v9]);

  if (v13)
  {
    uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue([v10 protectionSpace]);
    uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue([v14 authenticationMethod]);

    id v16 = sub_10003A95C();
    v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG)) {
      sub_1000A06D4(v13);
    }

    if ([v15 isEqualToString:NSURLAuthenticationMethodServerTrust])
    {
      -[MSDSession authenticate:forTask:completion:](self, "authenticate:forTask:completion:", v10, v13, v11);
    }

    else
    {
      id v20 = sub_10003A95C();
      v21 = (os_log_s *)objc_claimAutoreleasedReturnValue(v20);
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
        sub_1000A0674();
      }

      v11[2](v11, 2LL, 0LL);
    }
  }

  else
  {
    id v18 = sub_10003A95C();
    id v19 = (os_log_s *)objc_claimAutoreleasedReturnValue(v18);
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      int v22 = 138543362;
      id v23 = v9;
      _os_log_impl( (void *)&_mh_execute_header,  v19,  OS_LOG_TYPE_DEFAULT,  "Untracked task: %{public}@; canceling...",
        (uint8_t *)&v22,
        0xCu);
    }

    v11[2](v11, 2LL, 0LL);
  }
}

- (void)URLSession:(id)a3 task:(id)a4 willPerformHTTPRedirection:(id)a5 newRequest:(id)a6 completionHandler:(id)a7
{
  id v10 = a4;
  id v11 = a6;
  v12 = (void (**)(id, void *))a7;
  id v13 = (void *)objc_claimAutoreleasedReturnValue(-[MSDSession taskManager](self, "taskManager"));
  uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue([v13 getSessionTask:v10]);

  if (v14)
  {
    [v14 setRedirected:1];
    uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue([v11 URL]);
    id v16 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableURLRequest requestWithURL:cachePolicy:timeoutInterval:]( &OBJC_CLASS___NSMutableURLRequest,  "requestWithURL:cachePolicy:timeoutInterval:",  v15,  1LL,  30.0));

    v17 = (void *)objc_claimAutoreleasedReturnValue([v14 info]);
    id v18 = (void *)objc_claimAutoreleasedReturnValue([v17 savePath]);

    if (v18)
    {
      id v19 = (void *)objc_claimAutoreleasedReturnValue([v14 contentRange]);
      id v20 = (void *)objc_claimAutoreleasedReturnValue([v19 getRangeHeaderForDownload]);

      if (v20) {
        [v16 setValue:v20 forHTTPHeaderField:@"Range"];
      }
    }

    v12[2](v12, v16);
  }

  else
  {
    id v21 = sub_10003A95C();
    int v22 = (os_log_s *)objc_claimAutoreleasedReturnValue(v21);
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      int v23 = 138543362;
      id v24 = v10;
      _os_log_impl( (void *)&_mh_execute_header,  v22,  OS_LOG_TYPE_DEFAULT,  "Untracked task: %{public}@; canceling...",
        (uint8_t *)&v23,
        0xCu);
    }

    [v10 cancel];
    v12[2](v12, 0LL);
  }
}

- (void)URLSession:(id)a3 task:(id)a4 didCompleteWithError:(id)a5
{
  id v7 = a4;
  id v119 = a5;
  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[MSDSession taskManager](self, "taskManager"));
  id v9 = (void *)objc_claimAutoreleasedReturnValue([v8 getSessionTask:v7]);

  id v10 = (void *)objc_claimAutoreleasedReturnValue([v7 response]);
  uint64_t v11 = (uint64_t)[v10 statusCode];
  v12 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  if (!v9)
  {
    id v32 = sub_10003A95C();
    v33 = (os_log_s *)objc_claimAutoreleasedReturnValue(v32);
    if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      uint64_t v126 = (uint64_t)v7;
      _os_log_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_DEFAULT, "Untracked task: %{public}@ done.", buf, 0xCu);
    }

    id v29 = 0LL;
    goto LABEL_77;
  }

  if (!-[MSDSession getIsFileDownload](self, "getIsFileDownload") || [v9 state] != 1)
  {
    if ([v119 code] == (id)-999 && objc_msgSend(v9, "state") != 3)
    {
      v113 = v10;
      v116 = v12;
      id v36 = (void *)objc_claimAutoreleasedReturnValue([v9 info]);
      uint64_t v37 = objc_claimAutoreleasedReturnValue([v36 savePath]);
      if (v37)
      {
        id v38 = (void *)v37;
        uint64_t v39 = v11;
        id v40 = (void *)objc_claimAutoreleasedReturnValue([v9 contentRange]);
        unsigned int v41 = [v40 isDownloadComplete];

        uint64_t v11 = v39;
        if (v41)
        {
          id v42 = sub_10003A95C();
          int v43 = (os_log_s *)objc_claimAutoreleasedReturnValue(v42);
          if (os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT))
          {
            id v44 = (void *)objc_claimAutoreleasedReturnValue([v9 info]);
            __int16 v45 = (void *)objc_claimAutoreleasedReturnValue([v44 description]);
            v46 = (void *)objc_claimAutoreleasedReturnValue([v9 info]);
            v47 = (void *)objc_claimAutoreleasedReturnValue([v46 savePath]);
            *(_DWORD *)buf = 138543618;
            uint64_t v126 = (uint64_t)v45;
            __int16 v127 = 2114;
            id v128 = v47;
            _os_log_impl( (void *)&_mh_execute_header,  v43,  OS_LOG_TYPE_DEFAULT,  "SessionTask %{public}@ for file %{public}@ is cancelled but it is already complete, ignoring cancellation",  buf,  0x16u);

            uint64_t v11 = v39;
          }

          id v29 = 0LL;
          int v30 = 0;
          BOOL v31 = 0;
          id v10 = v113;
          v12 = v116;
          goto LABEL_61;
        }
      }

      else
      {
      }

      v60 = (void *)objc_claimAutoreleasedReturnValue([v9 error]);
      if (v60) {
        id v61 = (id)objc_claimAutoreleasedReturnValue([v9 error]);
      }
      else {
        id v61 = v119;
      }
      id v29 = v61;
      id v10 = v113;

      int v30 = 0;
      BOOL v31 = [v9 state] == 2;
      goto LABEL_46;
    }

    if (!v10)
    {
      if (v119)
      {
        v117 = self;
        id v34 = v7;
        v35 = v12;
        id v29 = v119;
        BOOL v31 = 1;
LABEL_58:
        id v68 = sub_10003A95C();
        v69 = (os_log_s *)objc_claimAutoreleasedReturnValue(v68);
        if (os_log_type_enabled(v69, OS_LOG_TYPE_DEFAULT))
        {
          v114 = v10;
          v70 = (void *)objc_claimAutoreleasedReturnValue([v9 info]);
          uint64_t v71 = v11;
          v72 = (void *)objc_claimAutoreleasedReturnValue([v70 description]);
          v73 = (void *)objc_claimAutoreleasedReturnValue([v29 localizedDescription]);
          id v74 = [v29 code];
          *(_DWORD *)buf = 138543874;
          uint64_t v126 = (uint64_t)v72;
          __int16 v127 = 2114;
          id v128 = v73;
          __int16 v129 = 2048;
          id v130 = v74;
          _os_log_impl( (void *)&_mh_execute_header,  v69,  OS_LOG_TYPE_DEFAULT,  "Session task %{public}@ did fail with error: %{public}@(0x%tx)",  buf,  0x20u);

          id v10 = v114;
          uint64_t v11 = v71;
        }

        int v30 = 0;
        v12 = v35;
        id v7 = v34;
        self = v117;
        goto LABEL_61;
      }

      v48 = 0LL;
      id v58 = sub_10003A95C();
      v59 = (os_log_s *)objc_claimAutoreleasedReturnValue(v58);
      if (os_log_type_enabled(v59, OS_LOG_TYPE_DEBUG)) {
        sub_1000A0754();
      }

      v56 = (void *)objc_claimAutoreleasedReturnValue( -[MSDSession getServerErrorMessage:withDefault:]( self,  "getServerErrorMessage:withDefault:",  v9,  @"Unexpected server response."));
      v120 = 0LL;
      sub_100087610(&v120, 3727744512LL, (uint64_t)v56);
      v57 = v120;
LABEL_56:
      id v29 = v57;

      BOOL v31 = 1;
      if (v29) {
        goto LABEL_57;
      }
      goto LABEL_52;
    }

    if (v11 <= 205)
    {
      BOOL v31 = 0;
      id v29 = 0LL;
      int v30 = 1;
      goto LABEL_53;
    }

    if (v11 > 403)
    {
      if (v11 != 404)
      {
        if (v11 == 408)
        {
          v48 = v10;
          v56 = (void *)objc_claimAutoreleasedReturnValue( -[MSDSession getServerErrorMessage:withDefault:]( self,  "getServerErrorMessage:withDefault:",  v9,  @"Connection with server is broken."));
          v122 = 0LL;
          sub_100087610(&v122, 3727740931LL, (uint64_t)v56);
          v57 = v122;
          goto LABEL_56;
        }

        goto LABEL_53;
      }

      v48 = v10;
      v49 = (void *)objc_claimAutoreleasedReturnValue( -[MSDSession getServerErrorMessage:withDefault:]( self,  "getServerErrorMessage:withDefault:",  v9,  @"Requested asset not found"));
      v123 = 0LL;
      sub_100087610(&v123, 3727740934LL, (uint64_t)v49);
      v50 = v123;
      goto LABEL_51;
    }

    if (v11 != 206)
    {
      if (v11 != 403)
      {
LABEL_53:
        v48 = v10;
        id v66 = sub_10003A95C();
        v67 = (os_log_s *)objc_claimAutoreleasedReturnValue(v66);
        if (os_log_type_enabled(v67, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 134217984;
          uint64_t v126 = v11;
          _os_log_impl( (void *)&_mh_execute_header,  v67,  OS_LOG_TYPE_DEFAULT,  "Unrecognized status code %ld; will attempt to retry task",
            buf,
            0xCu);
        }

        v56 = (void *)objc_claimAutoreleasedReturnValue( -[MSDSession getServerErrorMessage:withDefault:]( self,  "getServerErrorMessage:withDefault:",  v9,  @"Unexpected server response."));
        v121 = 0LL;
        sub_100087610(&v121, 3727744512LL, (uint64_t)v56);
        v57 = v121;
        goto LABEL_56;
      }

      v48 = v10;
      v49 = (void *)objc_claimAutoreleasedReturnValue( -[MSDSession getServerErrorMessage:withDefault:]( self,  "getServerErrorMessage:withDefault:",  v9,  @"Cannot authenticate with server."));
      v124 = 0LL;
      sub_100087610(&v124, 3727740933LL, (uint64_t)v49);
      v50 = v124;
LABEL_51:
      id v29 = v50;

      BOOL v31 = 0;
      if (v29)
      {
LABEL_57:
        v117 = self;
        id v34 = v7;
        v35 = v12;
        id v10 = v48;
        goto LABEL_58;
      }

- (void)URLSession:(id)a3 task:(id)a4 didFinishCollectingMetrics:(id)a5
{
}

- (void)handleDownloadPaused:(id)a3
{
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue([a3 userInfo]);
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 objectForKey:@"kMSDDownloadPausedKey"]);
  id v5 = [v4 BOOLValue];

  id v6 = sub_10003A95C();
  id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    id v76 = self;
    __int16 v77 = 1024;
    LODWORD(v78) = (_DWORD)v5;
    _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "%{public}@: Session received background download paused notification; pause=%d",
      buf,
      0x12u);
  }

  if ((_DWORD)v5 == -[MSDSession isDownloadPaused](self, "isDownloadPaused"))
  {
    id v33 = sub_10003A95C();
    id v34 = (os_log_s *)objc_claimAutoreleasedReturnValue(v33);
    if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      id v76 = self;
      __int16 v77 = 1024;
      LODWORD(v78) = (_DWORD)v5;
      _os_log_impl( (void *)&_mh_execute_header,  v34,  OS_LOG_TYPE_DEFAULT,  "%{public}@: downloadPaused = %d, ignoring notification...",  buf,  0x12u);
    }

    id v13 = v34;
  }

  else
  {
    -[MSDSession setIsDownloadPaused:](self, "setIsDownloadPaused:", v5);
    id v8 = (void *)objc_claimAutoreleasedReturnValue(-[MSDSession taskManager](self, "taskManager"));
    id v9 = v8;
    if ((_DWORD)v5)
    {
      id v10 = (void *)objc_claimAutoreleasedReturnValue([v8 getTaskInState:0]);

      id v11 = sub_10003A95C();
      v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
        sub_1000A078C((uint64_t)self, v10);
      }

      __int128 v72 = 0u;
      __int128 v73 = 0u;
      __int128 v70 = 0u;
      __int128 v71 = 0u;
      id v13 = v10;
      id obj = -[os_log_s countByEnumeratingWithState:objects:count:]( v13,  "countByEnumeratingWithState:objects:count:",  &v70,  v79,  16LL);
      if (obj)
      {
        uint64_t v62 = *(void *)v71;
        do
        {
          for (i = 0LL; i != obj; i = (char *)i + 1)
          {
            if (*(void *)v71 != v62) {
              objc_enumerationMutation(v13);
            }
            id v15 = *(void **)(*((void *)&v70 + 1) + 8LL * (void)i);
            id v16 = sub_10003A95C();
            BOOL v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);
            if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
            {
              id v18 = (void *)objc_claimAutoreleasedReturnValue([v15 info]);
              uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue([v18 description]);
              *(_DWORD *)buf = 138543618;
              id v76 = self;
              __int16 v77 = 2114;
              v78 = v19;
              _os_log_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_DEFAULT,  "%{public}@: Canceling task %{public}@",  buf,  0x16u);
            }

            id v20 = sub_10003AAAC();
            id v21 = (os_log_s *)objc_claimAutoreleasedReturnValue(v20);
            unint64_t v22 = -[MSDSession signpostId](self, "signpostId");
            if (v22 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
            {
              os_signpost_id_t v23 = v22;
              if (os_signpost_enabled(v21))
              {
                os_signpost_id_t v24 = (void *)objc_claimAutoreleasedReturnValue([v15 info]);
                v25 = (MSDSession *)objc_claimAutoreleasedReturnValue([v24 description]);
                id v26 = (void *)objc_claimAutoreleasedReturnValue([v15 info]);
                v27 = (void *)objc_claimAutoreleasedReturnValue([v26 savePath]);
                *(_DWORD *)buf = 138412546;
                id v76 = v25;
                __int16 v77 = 2112;
                v78 = v27;
                _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v21,  OS_SIGNPOST_EVENT,  v23,  "Pause Session Task",  "Pause Session Task: %{xcode:string}@ with save path: %{xcode:string}@",  buf,  0x16u);
              }
            }

            [v15 setState:1];
            BOOL v28 = (void *)objc_claimAutoreleasedReturnValue([v15 task]);
            [v28 cancel];

            if (os_variant_has_internal_content("com.apple.mobilestoredemod"))
            {
              id v29 = (void *)objc_claimAutoreleasedReturnValue([v15 info]);
              int v30 = (void *)objc_claimAutoreleasedReturnValue([v29 savePath]);
              BOOL v31 = (void *)objc_claimAutoreleasedReturnValue([v15 contentRange]);
              [v31 setFileDownloading:v30];

              id v32 = (void *)objc_claimAutoreleasedReturnValue([v15 contentRange]);
              [v32 pushToTestLog:0];
            }
          }

          id obj = -[os_log_s countByEnumeratingWithState:objects:count:]( v13,  "countByEnumeratingWithState:objects:count:",  &v70,  v79,  16LL);
        }

        while (obj);
      }
    }

    else
    {
      v35 = (void *)objc_claimAutoreleasedReturnValue([v8 getTaskInState:1]);

      id v36 = sub_10003A95C();
      uint64_t v37 = (os_log_s *)objc_claimAutoreleasedReturnValue(v36);
      if (os_log_type_enabled(v37, OS_LOG_TYPE_DEBUG)) {
        sub_1000A07F8((uint64_t)self, v35);
      }

      __int128 v68 = 0u;
      __int128 v69 = 0u;
      __int128 v66 = 0u;
      __int128 v67 = 0u;
      id obja = v35;
      id v38 = [obja countByEnumeratingWithState:&v66 objects:v74 count:16];
      if (v38)
      {
        id v40 = v38;
        uint64_t v41 = *(void *)v67;
        id v42 = "%{public}@: Relaunching task %{public}@ to resume";
        *(void *)&__int128 v39 = 138412546LL;
        __int128 v60 = v39;
        do
        {
          int v43 = 0LL;
          id v61 = v40;
          do
          {
            if (*(void *)v67 != v41) {
              objc_enumerationMutation(obja);
            }
            id v44 = *(void **)(*((void *)&v66 + 1) + 8LL * (void)v43);
            __int16 v45 = (void *)objc_claimAutoreleasedReturnValue(-[MSDSession taskManager](self, "taskManager", v60));
            [v45 removeSessionTask:v44];

            [v44 setState:0];
            [v44 setCurrentRetry:0];
            id v46 = sub_10003A95C();
            v47 = (os_log_s *)objc_claimAutoreleasedReturnValue(v46);
            if (os_log_type_enabled(v47, OS_LOG_TYPE_DEFAULT))
            {
              v48 = (void *)objc_claimAutoreleasedReturnValue([v44 info]);
              v49 = (void *)objc_claimAutoreleasedReturnValue([v48 description]);
              *(_DWORD *)buf = 138543618;
              id v76 = self;
              __int16 v77 = 2114;
              v78 = v49;
              _os_log_impl((void *)&_mh_execute_header, v47, OS_LOG_TYPE_DEFAULT, v42, buf, 0x16u);
            }

            id v50 = sub_10003AAAC();
            v51 = (os_log_s *)objc_claimAutoreleasedReturnValue(v50);
            unint64_t v52 = -[MSDSession signpostId](self, "signpostId");
            if (v52 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
            {
              os_signpost_id_t v53 = v52;
              if (os_signpost_enabled(v51))
              {
                v54 = (void *)objc_claimAutoreleasedReturnValue([v44 info]);
                uint64_t v55 = v41;
                v56 = (MSDSession *)objc_claimAutoreleasedReturnValue([v54 description]);
                v57 = v42;
                id v58 = (void *)objc_claimAutoreleasedReturnValue([v44 info]);
                v59 = (void *)objc_claimAutoreleasedReturnValue([v58 savePath]);
                *(_DWORD *)buf = v60;
                id v76 = v56;
                __int16 v77 = 2112;
                v78 = v59;
                _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v51,  OS_SIGNPOST_EVENT,  v53,  "Resume Session Task",  "Resuming Session Task: %{xcode:string}@ with save path: %{xcode:string}@",  buf,  0x16u);

                id v42 = v57;
                uint64_t v41 = v55;
                id v40 = v61;
              }
            }

            -[MSDSession dispatchSessionTask:](self, "dispatchSessionTask:", v44);
            int v43 = (char *)v43 + 1;
          }

          while (v40 != v43);
          id v40 = [obja countByEnumeratingWithState:&v66 objects:v74 count:16];
        }

        while (v40);
      }

      id v13 = (os_log_s *)obja;
    }
  }
}

- (void)handleDownloadAborted:(id)a3
{
  id v4 = (void *)objc_claimAutoreleasedReturnValue([a3 userInfo]);
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKey:@"kMSDDownloadAbortedKey"]);
  unsigned int v6 = [v5 BOOLValue];

  id v7 = sub_10003A95C();
  id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v10 = 138543618;
    id v11 = self;
    __int16 v12 = 1024;
    unsigned int v13 = v6;
    _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "%{public}@: Session received timer expired notification; timerExpired=%d",
      (uint8_t *)&v10,
      0x12u);
  }

  if (v6)
  {
    id v9 = (void *)objc_claimAutoreleasedReturnValue(-[MSDSession taskManager](self, "taskManager"));
    [v9 cancelAndRemoveAllSessionTask];
  }

- (void)dispatchSessionTask:(id)a3 withError:(id *)a4
{
  id v6 = a3;
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 info]);
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 postData]);

  id v9 = (void *)objc_claimAutoreleasedReturnValue([v6 info]);
  int v10 = (void *)objc_claimAutoreleasedReturnValue([v9 postFile]);

  id v11 = (void *)objc_claimAutoreleasedReturnValue([v6 info]);
  uint64_t v12 = objc_claimAutoreleasedReturnValue([v11 getRequestForTimeout:30.0]);
  id v13 = [(id)v12 mutableCopy];

  unsigned __int8 v14 = (void *)objc_claimAutoreleasedReturnValue([v6 info]);
  LOBYTE(v12) = [v14 isValid];

  if ((v12 & 1) == 0)
  {
    id v36 = sub_10003A95C();
    uint64_t v37 = (os_log_s *)objc_claimAutoreleasedReturnValue(v36);
    if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR)) {
      sub_1000A0984();
    }
    goto LABEL_32;
  }

  if (!v13)
  {
    id v38 = sub_10003A95C();
    uint64_t v37 = (os_log_s *)objc_claimAutoreleasedReturnValue(v38);
    if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR)) {
      sub_1000A0864();
    }
LABEL_32:

    __int128 v39 = @"Input is invalid";
    id v40 = a4;
    uint64_t v41 = 3727744769LL;
LABEL_39:
    sub_100087610(v40, v41, (uint64_t)v39);
    goto LABEL_26;
  }

  [v6 resetData];
  id v15 = (void *)objc_claimAutoreleasedReturnValue([v6 info]);
  id v16 = (void *)objc_claimAutoreleasedReturnValue([v15 savePath]);

  if (!v16)
  {
    uint64_t v19 = 0LL;
    goto LABEL_9;
  }

  BOOL v17 = (void *)objc_claimAutoreleasedReturnValue([v6 fileHandle]);

  if (!v17)
  {
    id v44 = sub_10003A95C();
    __int16 v45 = (os_log_s *)objc_claimAutoreleasedReturnValue(v44);
    if (os_log_type_enabled(v45, OS_LOG_TYPE_ERROR)) {
      sub_1000A0958();
    }

    uint64_t v41 = 3727740944LL;
    __int128 v39 = @"Cannot write file.";
    id v40 = a4;
    goto LABEL_39;
  }

  id v18 = (void *)objc_claimAutoreleasedReturnValue([v6 contentRange]);
  uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue([v18 getRangeHeaderForDownload]);

  if (v19) {
    [v13 setValue:v19 forHTTPHeaderField:@"Range"];
  }
  -[MSDSession logDownloadTaskLaunch:](self, "logDownloadTaskLaunch:", v6);
LABEL_9:
  objc_msgSend(v6, "setCurrentRetry:", (char *)objc_msgSend(v6, "currentRetry") + 1);
  if (v8)
  {
    id v20 = (void *)objc_claimAutoreleasedReturnValue(-[MSDSession session](self, "session"));
    uint64_t v21 = objc_claimAutoreleasedReturnValue([v20 uploadTaskWithRequest:v13 fromData:v8]);
  }

  else
  {
    os_signpost_id_t v23 = (void *)objc_claimAutoreleasedReturnValue(-[MSDSession session](self, "session"));
    id v20 = v23;
    if (v10)
    {
      unint64_t v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:](&OBJC_CLASS___NSURL, "URLWithString:", v10));
      os_signpost_id_t v24 = (void *)objc_claimAutoreleasedReturnValue([v20 uploadTaskWithRequest:v13 fromFile:v22]);
      [v6 setTask:v24];

      goto LABEL_14;
    }

    uint64_t v21 = objc_claimAutoreleasedReturnValue([v23 dataTaskWithRequest:v13]);
  }

  unint64_t v22 = (void *)v21;
  [v6 setTask:v21];
LABEL_14:

  v25 = (void *)objc_claimAutoreleasedReturnValue([v6 task]);
  if (v25)
  {
    if (-[MSDSession isDownloadPaused](self, "isDownloadPaused")
      && -[MSDSession getIsFileDownload](self, "getIsFileDownload"))
    {
      id v26 = sub_10003A95C();
      v27 = (os_log_s *)objc_claimAutoreleasedReturnValue(v26);
      if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG)) {
        sub_1000A08BC(v6, v27);
      }

      id v28 = sub_10003AAAC();
      id v29 = (os_log_s *)objc_claimAutoreleasedReturnValue(v28);
      unint64_t v30 = -[MSDSession signpostId](self, "signpostId");
      if (v30 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
      {
        os_signpost_id_t v31 = v30;
        if (os_signpost_enabled(v29))
        {
          v47 = (void *)objc_claimAutoreleasedReturnValue([v6 info]);
          id v46 = (void *)objc_claimAutoreleasedReturnValue([v47 description]);
          id v32 = (void *)objc_claimAutoreleasedReturnValue([v6 info]);
          *(_DWORD *)buf = 138412546;
          v49 = v46;
          __int16 v50 = 2112;
          uint64_t v51 = objc_claimAutoreleasedReturnValue([v32 savePath]);
          id v33 = (void *)v51;
          _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v29,  OS_SIGNPOST_EVENT,  v31,  "Pause Session Task",  "Launching Session Task: %{xcode:string}@ with save path: %{xcode:string}@ as paused",  buf,  0x16u);
        }
      }

      [v6 setState:1];
    }

    else
    {
      [v6 setState:0];
      id v34 = (void *)objc_claimAutoreleasedReturnValue([v6 task]);
      [v34 resume];
    }

    v35 = (void *)objc_claimAutoreleasedReturnValue(-[MSDSession taskManager](self, "taskManager"));
    [v35 addSessionTask:v6];
  }

  else
  {
    id v42 = sub_10003A95C();
    int v43 = (os_log_s *)objc_claimAutoreleasedReturnValue(v42);
    if (os_log_type_enabled(v43, OS_LOG_TYPE_ERROR)) {
      sub_1000A0890();
    }

    sub_100087610(a4, 3727744515LL, (uint64_t)@"Cannot dispatch network task or create session");
  }

LABEL_26:
}

- (void)dispatchSessionTask:(id)a3
{
  id v4 = a3;
  id v10 = 0LL;
  -[MSDSession dispatchSessionTask:withError:](self, "dispatchSessionTask:withError:", v4, &v10);
  id v5 = v10;
  if (v5)
  {
    id v6 = (void *)objc_claimAutoreleasedReturnValue([v4 info]);
    id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 handler]);

    if (v7)
    {
      id v8 = (void *)objc_claimAutoreleasedReturnValue([v4 info]);
      id v9 = (void (**)(void, void, void))objc_claimAutoreleasedReturnValue([v8 handler]);
      ((void (**)(void, id, void))v9)[2](v9, v5, 0LL);
    }
  }
}

- (void)retrySessionTask:(id)a3
{
  id v4 = a3;
  double v5 = exp2((double)(uint64_t)[v4 currentRetry]);
  double v6 = (double)arc4random_uniform(0x1F4u) + v5 * 1000.0;
  id v7 = sub_10003A95C();
  id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    id v9 = (void *)objc_claimAutoreleasedReturnValue([v4 info]);
    id v10 = (void *)objc_claimAutoreleasedReturnValue([v9 description]);
    id v11 = (void *)objc_claimAutoreleasedReturnValue([v4 info]);
    uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue([v11 savePath]);
    id v13 = [v4 currentRetry];
    unsigned __int8 v14 = (void *)objc_claimAutoreleasedReturnValue([v4 info]);
    *(_DWORD *)buf = 138544386;
    uint64_t v21 = v10;
    __int16 v22 = 2114;
    os_signpost_id_t v23 = v12;
    __int16 v24 = 2048;
    double v25 = v6;
    __int16 v26 = 2048;
    id v27 = v13;
    __int16 v28 = 2048;
    id v29 = [v14 maxRetry];
    _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "Retrying task %{public}@ with savePath: %{public}@ after %f ms; attempt %ld/%ld...",
      buf,
      0x34u);
  }

  dispatch_time_t v15 = dispatch_time(0LL, (uint64_t)(v6 * 1000000.0));
  id v16 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[MSDSession demuxQueue](self, "demuxQueue"));
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472LL;
  v18[2] = sub_10008F008;
  v18[3] = &unk_1000F94E0;
  v18[4] = self;
  id v19 = v4;
  id v17 = v4;
  dispatch_after(v15, v16, v18);
}

- (id)parseResponseHeader:(id)a3 statusCode:(int64_t)a4
{
  id v5 = a3;
  double v6 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKey:@"X-Protocol-Version"]);
  if (v7) {
    -[NSMutableDictionary setObject:forKey:](v6, "setObject:forKey:", v7, @"protocolVersion");
  }
  if (a4 == 202)
  {
    id v8 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKey:@"Retry-After"]);
    if (v8)
    {
      id v9 = v8;
      id v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", [v8 intValue]));
      -[NSMutableDictionary setObject:forKey:](v6, "setObject:forKey:", v10, @"retryAfter");
    }
  }

  return v6;
}

- (id)getServerErrorMessage:(id)a3 withDefault:(id)a4
{
  id v5 = a4;
  double v6 = (void *)objc_claimAutoreleasedReturnValue([a3 outData]);
  if (!v6)
  {
    id v9 = 0LL;
    id v8 = 0LL;
    goto LABEL_10;
  }

  id v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSJSONSerialization JSONObjectWithData:options:error:]( &OBJC_CLASS___NSJSONSerialization,  "JSONObjectWithData:options:error:",  v6,  0LL,  0LL));
  id v8 = v7;
  if (v7)
  {
    id v9 = (NSString *)objc_claimAutoreleasedReturnValue([v7 objectForKey:@"error_message"]);
    if (v9) {
      goto LABEL_7;
    }
    id v10 = (NSString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%@", v8));
  }

  else
  {
    id v10 = -[NSString initWithData:encoding:](objc_alloc(&OBJC_CLASS___NSString), "initWithData:encoding:", v6, 4LL);
  }

  id v9 = v10;
  if (!v10)
  {
LABEL_10:
    id v11 = v5;
    goto LABEL_11;
  }

- (void)logDownloadTaskLaunch:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 contentRange]);
  double v6 = (void *)objc_claimAutoreleasedReturnValue([v5 getRangeHeaderForDownload]);

  id v7 = (void *)objc_claimAutoreleasedReturnValue([v4 contentRange]);
  id v8 = [v7 downloadedBytes];

  id v9 = (void *)objc_claimAutoreleasedReturnValue([v4 contentRange]);
  id v10 = [v9 existingFileSize];

  if ((uint64_t)v8 + (uint64_t)v10 >= 1)
  {
    id v11 = sub_10003A95C();
    uint64_t v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      id v13 = (void *)objc_claimAutoreleasedReturnValue([v4 info]);
      unsigned __int8 v14 = (void *)objc_claimAutoreleasedReturnValue([v13 savePath]);
      int v21 = 138544130;
      __int16 v22 = v14;
      __int16 v23 = 2048;
      id v24 = v10;
      __int16 v25 = 2048;
      id v26 = v8;
      __int16 v27 = 2114;
      __int16 v28 = v6;
      _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEFAULT,  "File %{public}@ is partially downloaded with existing size = %ld, downloaded bytes = %ld; using range header %{public}@",
        (uint8_t *)&v21,
        0x2Au);
    }

    id v15 = sub_10003AAAC();
    id v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(v15);
    unint64_t v17 = -[MSDSession signpostId](self, "signpostId");
    if (v17 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
    {
      os_signpost_id_t v18 = v17;
      if (os_signpost_enabled(v16))
      {
        id v19 = (void *)objc_claimAutoreleasedReturnValue([v4 info]);
        id v20 = (void *)objc_claimAutoreleasedReturnValue([v19 savePath]);
        int v21 = 138413058;
        __int16 v22 = v20;
        __int16 v23 = 2048;
        id v24 = v10;
        __int16 v25 = 2048;
        id v26 = v8;
        __int16 v27 = 2112;
        __int16 v28 = v6;
        _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v16,  OS_SIGNPOST_EVENT,  v18,  "Resume Partial Download",  "Resuming partial download for: %{xcode:string}@, existing size = %{xcode:size-in-bytes}lu; downloaded bytes = "
          "%{xcode:size-in-bytes}lu; range header = %{xcode:string}@",
          (uint8_t *)&v21,
          0x2Au);
      }
    }
  }
}

- (NSURLSession)session
{
  return (NSURLSession *)objc_getProperty(self, a2, 16LL, 1);
}

- (void)setSession:(id)a3
{
}

- (BOOL)isDownloadPaused
{
  return self->_isDownloadPaused;
}

- (void)setIsDownloadPaused:(BOOL)a3
{
  self->_isDownloadPaused = a3;
}

- (MSDSessionTaskManager)taskManager
{
  return (MSDSessionTaskManager *)objc_getProperty(self, a2, 24LL, 1);
}

- (void)setTaskManager:(id)a3
{
}

- (OS_dispatch_queue)demuxQueue
{
  return self->_demuxQueue;
}

- (void)setDemuxQueue:(id)a3
{
}

- (int64_t)requestTimeoutCount
{
  return self->_requestTimeoutCount;
}

- (void)setRequestTimeoutCount:(int64_t)a3
{
  self->_requestTimeoutCount = a3;
}

- (unint64_t)signpostId
{
  return self->_signpostId;
}

- (void)setSignpostId:(unint64_t)a3
{
  self->_signpostId = a3;
}

- (void).cxx_destruct
{
}

@end