@interface GKNetworkRequestManagerSessionDelegate
- (GKNetworkRequestManager)networkManager;
- (GKNetworkRequestManagerSessionDelegate)initWithNetworkManager:(id)a3;
- (void)URLSession:(id)a3 downloadTask:(id)a4 didFinishDownloadingToURL:(id)a5;
- (void)URLSession:(id)a3 downloadTask:(id)a4 didResumeAtOffset:(int64_t)a5 expectedTotalBytes:(int64_t)a6;
- (void)URLSession:(id)a3 task:(id)a4 _willSendRequestForEstablishedConnection:(id)a5 completionHandler:(id)a6;
- (void)URLSession:(id)a3 task:(id)a4 didCompleteWithError:(id)a5;
- (void)URLSession:(id)a3 task:(id)a4 didFinishCollectingMetrics:(id)a5;
@end

@implementation GKNetworkRequestManagerSessionDelegate

- (GKNetworkRequestManagerSessionDelegate)initWithNetworkManager:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___GKNetworkRequestManagerSessionDelegate;
  v5 = -[GKNetworkRequestManagerSessionDelegate init](&v8, "init");
  v6 = v5;
  if (v5) {
    objc_storeWeak((id *)&v5->_networkManager, v4);
  }

  return v6;
}

- (void)URLSession:(id)a3 downloadTask:(id)a4 didResumeAtOffset:(int64_t)a5 expectedTotalBytes:(int64_t)a6
{
  id v9 = a3;
  id v10 = a4;
  v11 = objc_autoreleasePoolPush();
  v13 = v11;
  if (!os_log_GKGeneral) {
    id v14 = (id)GKOSLoggers(v11, v12);
  }
  v15 = (os_log_s *)os_log_GKDaemon;
  if (os_log_type_enabled(os_log_GKDaemon, OS_LOG_TYPE_INFO))
  {
    int v16 = 134218754;
    int64_t v17 = a5;
    __int16 v18 = 2048;
    int64_t v19 = a6;
    __int16 v20 = 2112;
    id v21 = v9;
    __int16 v22 = 2112;
    id v23 = v10;
    _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_INFO,  "GKNetworkRequestManager Download resumed at offset %lld bytes out of an expected %lld bytes. Session %@ task %@\n",  (uint8_t *)&v16,  0x2Au);
  }

  objc_autoreleasePoolPop(v13);
}

- (void)URLSession:(id)a3 task:(id)a4 _willSendRequestForEstablishedConnection:(id)a5 completionHandler:(id)a6
{
  id v8 = a5;
  id v9 = a6;
  id v10 = v8;
  +[GKStoreBag addAuthHeadersToRequest:](&OBJC_CLASS___GKStoreBag, "addAuthHeadersToRequest:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue([v10 valueForHTTPHeaderField:@"x-gk-sap-signature"]);
  v22[0] = _NSConcreteStackBlock;
  v22[1] = 3221225472LL;
  v22[2] = sub_1000A8E64;
  v22[3] = &unk_10026B148;
  id v23 = v10;
  id v12 = v23;
  id v24 = v12;
  id v13 = v9;
  id v25 = v13;
  id v14 = objc_retainBlock(v22);
  v15 = (void (**)(void))v14;
  if (v11)
  {
    int v16 = (void *)objc_claimAutoreleasedReturnValue(-[GKNetworkRequestManagerSessionDelegate networkManager](self, "networkManager"));
    if (v16)
    {
      v19[0] = _NSConcreteStackBlock;
      v19[1] = 3221225472LL;
      v19[2] = sub_1000A8F68;
      v19[3] = &unk_100270538;
      id v20 = v12;
      id v21 = v15;
      [v16 getFairPlaySession:v19];
    }

    else
    {
      if (!os_log_GKGeneral) {
        id v17 = (id)GKOSLoggers(0LL);
      }
      __int16 v18 = (os_log_s *)os_log_GKError;
      if (os_log_type_enabled(os_log_GKError, OS_LOG_TYPE_ERROR)) {
        sub_1000A9E30(v18);
      }
      v15[2](v15);
    }
  }

  else
  {
    ((void (*)(void *))v14[2])(v14);
  }
}

- (void)URLSession:(id)a3 task:(id)a4 didCompleteWithError:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = objc_autoreleasePoolPush();
  id v12 = (void *)objc_claimAutoreleasedReturnValue([v9 response]);
  p_networkManager = &self->_networkManager;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_networkManager);

  if (!v9 || !WeakRetained)
  {
    if (!os_log_GKGeneral) {
      id v20 = (id)GKOSLoggers(v15);
    }
    id v21 = (os_log_s *)os_log_GKDaemon;
    if (os_log_type_enabled(os_log_GKDaemon, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412546;
      id v85 = v8;
      __int16 v86 = 2112;
      id v87 = v9;
      _os_log_impl( (void *)&_mh_execute_header,  v21,  OS_LOG_TYPE_INFO,  "GKNetworkRequestManager Download manager or task is nil. Session %@ task %@",  buf,  0x16u);
    }

    goto LABEL_82;
  }

  if (!v10 || (id v15 = [v10 code], v15 != (id)-999))
  {
    if (!v12)
    {
      if (!os_log_GKGeneral) {
        id v37 = (id)GKOSLoggers(v15);
      }
      v38 = (os_log_s *)os_log_GKDaemon;
      if (os_log_type_enabled(os_log_GKDaemon, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        id v85 = v8;
        _os_log_impl( (void *)&_mh_execute_header,  v38,  OS_LOG_TYPE_INFO,  "GKNetworkRequestManager Session %@ Task completed but repsonse was nil, going to retry",  buf,  0xCu);
      }

      __int16 v18 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[GKNetworkRequestManager dictionaryFromTaskDescription:]( &OBJC_CLASS___GKNetworkRequestManager,  "dictionaryFromTaskDescription:",  v9));
      v39 = (void *)objc_claimAutoreleasedReturnValue([v9 originalRequest]);
      int64_t v19 = (void *)objc_claimAutoreleasedReturnValue( +[GKNetworkRequestManager taskWithRequest:description:session:]( &OBJC_CLASS___GKNetworkRequestManager,  "taskWithRequest:description:session:",  v39,  v18,  v8));

      [v19 resume];
      goto LABEL_29;
    }

    __int16 v22 = (void *)objc_claimAutoreleasedReturnValue(+[GKNetworkRequestManager uuidFromTask:](&OBJC_CLASS___GKNetworkRequestManager, "uuidFromTask:", v9));
    if (v22)
    {
      id v23 = objc_loadWeakRetained((id *)p_networkManager);
      id v24 = (void *)objc_claimAutoreleasedReturnValue([v23 resultsLocation]);
      id v25 = (void *)objc_claimAutoreleasedReturnValue([v23 pathToTempFile:v24 fileName:v22]);

      id v26 = objc_loadWeakRetained((id *)p_networkManager);
      v27 = (void *)objc_claimAutoreleasedReturnValue([v26 resultsLocation]);
      v83 = (void *)objc_claimAutoreleasedReturnValue([v26 filePathToTempFile:v27 fileName:v22]);

      v28 = v25;
      if (v25)
      {
        v29 = (void *)objc_claimAutoreleasedReturnValue([v25 absoluteString]);
        v30 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithContentsOfFile:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithContentsOfFile:",  v29));

        if (v30)
        {
          v31 = v30;
          v78 = v22;
          v32 = (void *)objc_claimAutoreleasedReturnValue([v30 objectForKey:@"status"]);
          id v33 = [v32 longValue];

          v81 = v31;
          uint64_t v34 = objc_claimAutoreleasedReturnValue([v31 objectForKey:@"message"]);
          v82 = (__CFString *)v34;
          v28 = v25;
          uint64_t v80 = (uint64_t)v33;
          if (v33)
          {
            if (!os_log_GKGeneral) {
              id v35 = (id)GKOSLoggers(v34);
            }
            v36 = (os_log_s *)os_log_GKDaemon;
            if (os_log_type_enabled(os_log_GKDaemon, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 134217984;
              id v85 = v33;
              _os_log_impl( (void *)&_mh_execute_header,  v36,  OS_LOG_TYPE_INFO,  "GKNetworkRequestManager serverError %ld",  buf,  0xCu);
            }
          }

          __int16 v22 = v78;
          if (v82)
          {
LABEL_34:
            v40 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
            v41 = (void *)objc_claimAutoreleasedReturnValue([v83 path]);
            [v40 removeItemAtPath:v41 error:0];

            v42 = (char *)[v12 statusCode];
            if (v42 == (char *)520)
            {
              id v43 = objc_loadWeakRetained((id *)p_networkManager);
              [v43 handleRetryAfter:v9];
LABEL_81:

              goto LABEL_82;
            }

            BOOL v46 = v42 != (char *)401 && v42 != (char *)200 && v42 != (char *)413 && (unint64_t)(v42 - 433) > 1;
            v77 = v28;
            if (v46 || v80 != 5000)
            {
              BOOL v61 = v42 != (char *)200 && v42 != (char *)304 && v42 != (char *)206;
              if (!v10 && !v61 && v80 < 1) {
                goto LABEL_76;
              }
              v98[0] = @"statusCode";
              v62 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", v42));
              v99[0] = v62;
              v98[1] = @"serverResult";
              v63 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLong:](&OBJC_CLASS___NSNumber, "numberWithLong:", v80));
              v98[2] = @"serverMessage";
              v99[1] = v63;
              v99[2] = v82;
              id v43 = (id)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v99,  v98,  3LL));

              if (!os_log_GKGeneral) {
                id v65 = (id)GKOSLoggers(v64);
              }
              v66 = (os_log_s *)os_log_GKDaemon;
              if (os_log_type_enabled(os_log_GKDaemon, OS_LOG_TYPE_INFO))
              {
                *(_DWORD *)buf = 138412290;
                id v85 = v43;
                _os_log_impl( (void *)&_mh_execute_header,  v66,  OS_LOG_TYPE_INFO,  "GKNetworkRequestManager sending event %@",  buf,  0xCu);
              }

              v67 = (void *)objc_claimAutoreleasedReturnValue(+[GKReporter reporter](&OBJC_CLASS___GKReporter, "reporter"));
              [v67 reportEvent:GKReporterDomainNetworkRequests type:GKNetworkRequestFailure payload:v43];

              v28 = v77;
            }

            else
            {
              id v43 = (id)objc_claimAutoreleasedReturnValue( +[GKNetworkRequestManager dictionaryFromTaskDescription:]( &OBJC_CLASS___GKNetworkRequestManager,  "dictionaryFromTaskDescription:",  v9));
              v47 = (void *)objc_claimAutoreleasedReturnValue([v43 objectForKeyedSubscript:@"_gkAuthRetries"]);
              uint64_t v48 = (uint64_t)[v47 longValue];

              if (v48 <= 9)
              {
                uint64_t v50 = v48 + 1;
                if (!os_log_GKGeneral) {
                  id v51 = (id)GKOSLoggers(v49);
                }
                v52 = (void *)os_log_GKDaemon;
                if (os_log_type_enabled(os_log_GKDaemon, OS_LOG_TYPE_INFO))
                {
                  v53 = v52;
                  v54 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", v50));
                  *(_DWORD *)buf = 138412546;
                  id v85 = v54;
                  __int16 v86 = 2112;
                  id v87 = v43;
                  _os_log_impl( (void *)&_mh_execute_header,  v53,  OS_LOG_TYPE_INFO,  "GKNetworkRequestManager auth failure, retry %@: for request: %@",  buf,  0x16u);
                }

                v55 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", v50));
                [v43 setObject:v55 forKeyedSubscript:@"_gkAuthRetries"];

                v56 = (void *)objc_claimAutoreleasedReturnValue([v9 originalRequest]);
                +[GKStoreBag addAuthHeadersToRequest:](&OBJC_CLASS___GKStoreBag, "addAuthHeadersToRequest:", v56);

                v57 = (void *)objc_claimAutoreleasedReturnValue([v9 originalRequest]);
                v58 = (void *)objc_claimAutoreleasedReturnValue( +[GKNetworkRequestManager taskWithRequest:description:session:]( &OBJC_CLASS___GKNetworkRequestManager,  "taskWithRequest:description:session:",  v57,  v43,  v8));

                [v58 resume];
                v28 = v77;
                goto LABEL_81;
              }

              if (!os_log_GKGeneral) {
                id v68 = (id)GKOSLoggers(v49);
              }
              v69 = (os_log_s *)os_log_GKDaemon;
              v28 = v77;
              if (os_log_type_enabled(os_log_GKDaemon, OS_LOG_TYPE_INFO))
              {
                *(_DWORD *)buf = 138412290;
                id v85 = v43;
                _os_log_impl( (void *)&_mh_execute_header,  v69,  OS_LOG_TYPE_INFO,  "GKNetworkRequestManager request exceeded maximum amount of auth retries: %@",  buf,  0xCu);
              }
            }

LABEL_76:
            if (!os_log_GKGeneral) {
              id v70 = (id)GKOSLoggers(v42);
            }
            v71 = (void *)os_log_GKDaemon;
            if (os_log_type_enabled(os_log_GKDaemon, OS_LOG_TYPE_INFO))
            {
              v79 = v22;
              log = v71;
              v75 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithInteger:]( NSNumber,  "numberWithInteger:",  [v12 statusCode]));
              v72 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLong:](&OBJC_CLASS___NSNumber, "numberWithLong:", v80));
              v73 = (void *)objc_claimAutoreleasedReturnValue( +[GKNetworkRequestManager dictionaryFromTaskDescription:]( &OBJC_CLASS___GKNetworkRequestManager,  "dictionaryFromTaskDescription:",  v9));
              v74 = (void *)objc_claimAutoreleasedReturnValue([v12 allHeaderFields]);
              *(_DWORD *)buf = 138413826;
              id v85 = v9;
              __int16 v86 = 2112;
              id v87 = v75;
              __int16 v88 = 2112;
              v89 = v72;
              __int16 v90 = 2112;
              id v91 = v10;
              __int16 v92 = 2112;
              v93 = v73;
              __int16 v94 = 2112;
              v95 = v74;
              __int16 v96 = 2112;
              v97 = v81;
              _os_log_impl( (void *)&_mh_execute_header,  log,  OS_LOG_TYPE_INFO,  "GKNetworkRequestManager Task completed: %@ code:%@ serverCode:%@ error: %@ descriptor: %@ , headers: %@ resultsPlist: %@",  buf,  0x48u);

              __int16 v22 = v79;
              v28 = v77;
            }

            id v43 = objc_loadWeakRetained((id *)p_networkManager);
            [v43 handleTaskFinished:v9];
            goto LABEL_81;
          }
        }

        else
        {
          uint64_t v80 = -1LL;
          v81 = 0LL;
          v28 = v25;
        }

- (void)URLSession:(id)a3 downloadTask:(id)a4 didFinishDownloadingToURL:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  id v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
  id v10 = (void *)objc_claimAutoreleasedReturnValue(+[GKNetworkRequestManager uuidFromTask:](&OBJC_CLASS___GKNetworkRequestManager, "uuidFromTask:", v8));

  if (v10)
  {
    id v12 = objc_loadWeakRetained((id *)&self->_networkManager);
    id v13 = (void *)objc_claimAutoreleasedReturnValue([v12 resultsLocation]);
    id v14 = (void *)objc_claimAutoreleasedReturnValue([v12 filePathToTempFile:v13 fileName:v10]);

    id v15 = (void *)objc_claimAutoreleasedReturnValue([v14 path]);
    [v9 removeItemAtPath:v15 error:0];

    id v27 = 0LL;
    LODWORD(v13) = [v9 moveItemAtURL:v7 toURL:v14 error:&v27];
    id v16 = v27;
    id v17 = v16;
    if ((_DWORD)v13)
    {
      if (!os_log_GKGeneral) {
        id v18 = (id)GKOSLoggers(v16);
      }
      int64_t v19 = (os_log_s *)os_log_GKDaemon;
      if (!os_log_type_enabled(os_log_GKDaemon, OS_LOG_TYPE_INFO)) {
        goto LABEL_16;
      }
      *(_DWORD *)buf = 138412546;
      id v29 = v7;
      __int16 v30 = 2112;
      v31 = v14;
      id v20 = "GKNetworkRequestManager moved %@ to %@";
      id v21 = v19;
      uint32_t v22 = 22;
    }

    else
    {
      if (!os_log_GKGeneral) {
        id v25 = (id)GKOSLoggers(v16);
      }
      id v26 = (os_log_s *)os_log_GKDaemon;
      if (!os_log_type_enabled(os_log_GKDaemon, OS_LOG_TYPE_INFO)) {
        goto LABEL_16;
      }
      *(_DWORD *)buf = 138412802;
      id v29 = v7;
      __int16 v30 = 2112;
      v31 = v14;
      __int16 v32 = 2112;
      id v33 = v17;
      id v20 = "GKNetworkRequestManager failed to move %@ to %@ error:%@";
      id v21 = v26;
      uint32_t v22 = 32;
    }

    _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_INFO, v20, buf, v22);
LABEL_16:

    goto LABEL_17;
  }

  if (!os_log_GKGeneral) {
    id v23 = (id)GKOSLoggers(v11);
  }
  id v24 = (os_log_s *)os_log_GKDaemon;
  if (os_log_type_enabled(os_log_GKDaemon, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v24,  OS_LOG_TYPE_INFO,  "GKNetworkRequestManager cannot move file into place there was no uuid in the task description",  buf,  2u);
  }

- (void)URLSession:(id)a3 task:(id)a4 didFinishCollectingMetrics:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  id v10 = v9;
  if (!os_log_GKGeneral) {
    id v11 = (id)GKOSLoggers(v9);
  }
  id v12 = (os_log_s *)os_log_GKDaemon;
  if (os_log_type_enabled(os_log_GKDaemon, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)id v14 = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_INFO,  "GKNetworkRequestManager finished collecting metrics for background task",  v14,  2u);
  }

  id v13 = (void *)objc_claimAutoreleasedReturnValue(+[GKAMPController controller](&OBJC_CLASS___GKAMPController, "controller"));
  [v13 reportURLSessionEventWithTask:v8 metrics:v10];
}

- (GKNetworkRequestManager)networkManager
{
  return (GKNetworkRequestManager *)objc_loadWeakRetained((id *)&self->_networkManager);
}

- (void).cxx_destruct
{
}

@end