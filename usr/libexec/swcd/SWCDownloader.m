@interface SWCDownloader
- (SWCDownloader)init;
- (SWCDownloaderDelegate)delegate;
- (id)_URLRequestWithDomain:(id)a3 downloadRoute:(unsigned __int8)a4;
- (id)_replaceTaskState:(id)a3;
- (id)_sessionForTaskState:(id)a3;
- (id)_taskStateForDomain:(id)a3 downloadRoute:(unsigned __int8)a4;
- (unint64_t)_maximumActiveTaskCountForSessionID:(unsigned __int8)a3;
- (unsigned)_sessionIDForTaskState:(id)a3;
- (void)URLSession:(id)a3 dataTask:(id)a4 didReceiveData:(id)a5;
- (void)URLSession:(id)a3 dataTask:(id)a4 didReceiveResponse:(id)a5 completionHandler:(id)a6;
- (void)URLSession:(id)a3 task:(id)a4 didCompleteWithError:(id)a5;
- (void)URLSession:(id)a3 task:(id)a4 didReceiveChallenge:(id)a5 completionHandler:(id)a6;
- (void)URLSession:(id)a3 task:(id)a4 willPerformHTTPRedirection:(id)a5 newRequest:(id)a6 completionHandler:(id)a7;
- (void)_downloadAASAFileForDomain:(id)a3 applicationIdentifier:(id)a4 downloadRoute:(unsigned __int8)a5 discretionary:(BOOL)a6 completionHandlers:(id)a7;
- (void)_enumerateTaskStatesUsingBlock:(id)a3;
- (void)_invokeCompletionHandlerForState:(id)a3 JSONObject:(id)a4 error:(id)a5;
- (void)_processDownloadedDataForState:(id)a3;
- (void)_resumePendingTasks;
- (void)downloadAASAFileForDomain:(id)a3 applicationIdentifier:(id)a4 completionHandler:(id)a5;
- (void)downloadAASAFileForDomain:(id)a3 applicationIdentifier:(id)a4 downloadRoute:(unsigned __int8)a5 completionHandler:(id)a6;
- (void)enumerateActiveAASAFileDownloadsWithBlock:(id)a3;
- (void)receiveSIGTERMSignal;
- (void)setDelegate:(id)a3;
- (void)updateAASAFileForDomain:(id)a3 applicationIdentifier:(id)a4 completionHandler:(id)a5;
- (void)updateAASAFileForDomain:(id)a3 applicationIdentifier:(id)a4 downloadRoute:(unsigned __int8)a5 completionHandler:(id)a6;
@end

@implementation SWCDownloader

- (SWCDownloader)init
{
  v13.receiver = self;
  v13.super_class = (Class)&OBJC_CLASS___SWCDownloader;
  v2 = -[SWCDownloader init](&v13, "init");
  if (v2)
  {
    v3 = objc_autoreleasePoolPush();
    v4 = objc_alloc_init(&OBJC_CLASS___NSOperationQueue);
    queue = v2->_queue;
    v2->_queue = v4;

    -[NSOperationQueue setMaxConcurrentOperationCount:](v2->_queue, "setMaxConcurrentOperationCount:", 1LL);
    v6 = -[NSString initWithFormat:](objc_alloc(&OBJC_CLASS___NSString), "initWithFormat:", @"SWC download queue");
    -[NSOperationQueue setName:](v2->_queue, "setName:", v6);

    dispatch_queue_attr_t v7 = dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v8 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v7);
    dispatch_queue_t v9 = dispatch_queue_create("SWC download queue (U)", v8);

    if (v9) {
      -[NSOperationQueue setUnderlyingQueue:](v2->_queue, "setUnderlyingQueue:", v9);
    }

    uint64_t v10 = objc_claimAutoreleasedReturnValue(+[NSMapTable weakToStrongObjectsMapTable](&OBJC_CLASS___NSMapTable, "weakToStrongObjectsMapTable"));
    allTaskStates = v2->_allTaskStates;
    v2->_allTaskStates = (NSMapTable *)v10;

    objc_autoreleasePoolPop(v3);
  }

  return v2;
}

- (void)receiveSIGTERMSignal
{
  v3 = (void *)os_transaction_create("com.apple.swc.dl.SIGTERM", a2);
  v4 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[NSOperationQueue underlyingQueue](self->_queue, "underlyingQueue"));
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  v6[2] = sub_100003EF8;
  v6[3] = &unk_1000307A0;
  v6[4] = self;
  id v7 = v3;
  id v5 = v3;
  dispatch_async(v4, v6);
}

- (void)downloadAASAFileForDomain:(id)a3 applicationIdentifier:(id)a4 completionHandler:(id)a5
{
  id v10 = a3;
  id v8 = a4;
  id v9 = a5;
  -[SWCDownloader downloadAASAFileForDomain:applicationIdentifier:downloadRoute:completionHandler:]( self,  "downloadAASAFileForDomain:applicationIdentifier:downloadRoute:completionHandler:",  v10,  v8,  [v10 modeOfOperation] != 0,  v9);
}

- (void)downloadAASAFileForDomain:(id)a3 applicationIdentifier:(id)a4 downloadRoute:(unsigned __int8)a5 completionHandler:(id)a6
{
  uint64_t v8 = a5;
  id v11 = a3;
  id v12 = a4;
  id v13 = a6;
  v14 = v13;
  if (v13)
  {
    id v6 = objc_retainBlock(v13);
    id v16 = v6;
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v16, 1LL));
  }

  else
  {
    v15 = 0LL;
  }

  -[SWCDownloader _downloadAASAFileForDomain:applicationIdentifier:downloadRoute:discretionary:completionHandlers:]( self,  "_downloadAASAFileForDomain:applicationIdentifier:downloadRoute:discretionary:completionHandlers:",  v11,  v12,  v8,  0LL,  v15);
  if (v14)
  {
  }
}

- (void)updateAASAFileForDomain:(id)a3 applicationIdentifier:(id)a4 completionHandler:(id)a5
{
  id v10 = a3;
  id v8 = a4;
  id v9 = a5;
  -[SWCDownloader updateAASAFileForDomain:applicationIdentifier:downloadRoute:completionHandler:]( self,  "updateAASAFileForDomain:applicationIdentifier:downloadRoute:completionHandler:",  v10,  v8,  [v10 modeOfOperation] != 0,  v9);
}

- (void)updateAASAFileForDomain:(id)a3 applicationIdentifier:(id)a4 downloadRoute:(unsigned __int8)a5 completionHandler:(id)a6
{
  uint64_t v8 = a5;
  id v11 = a3;
  id v12 = a4;
  id v13 = a6;
  v14 = v13;
  if (v13)
  {
    id v6 = objc_retainBlock(v13);
    id v16 = v6;
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v16, 1LL));
  }

  else
  {
    v15 = 0LL;
  }

  -[SWCDownloader _downloadAASAFileForDomain:applicationIdentifier:downloadRoute:discretionary:completionHandlers:]( self,  "_downloadAASAFileForDomain:applicationIdentifier:downloadRoute:discretionary:completionHandlers:",  v11,  v12,  v8,  1LL,  v15);
  if (v14)
  {
  }
}

- (void)enumerateActiveAASAFileDownloadsWithBlock:(id)a3
{
  id v4 = a3;
  id v5 = objc_autoreleasePoolPush();
  id v6 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[NSOperationQueue underlyingQueue](self->_queue, "underlyingQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100004354;
  block[3] = &unk_1000307F0;
  block[4] = self;
  id v7 = v4;
  id v9 = v7;
  dispatch_sync(v6, block);

  objc_autoreleasePoolPop(v5);
}

- (void)URLSession:(id)a3 task:(id)a4 didReceiveChallenge:(id)a5 completionHandler:(id)a6
{
  id v9 = a4;
  id v10 = a5;
  id v11 = (void (**)(id, uint64_t, void *))a6;
  id v12 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[NSOperationQueue underlyingQueue](self->_queue, "underlyingQueue"));
  dispatch_assert_queue_V2(v12);

  allTaskStates = self->_allTaskStates;
  v14 = (void *)objc_claimAutoreleasedReturnValue([v9 taskDescription]);
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[NSMapTable objectForKey:](allTaskStates, "objectForKey:", v14));

  if (v15)
  {
    id v16 = (void *)objc_claimAutoreleasedReturnValue([v10 protectionSpace]);
    v17 = (void *)objc_claimAutoreleasedReturnValue([v16 authenticationMethod]);
    unsigned int v18 = [v17 isEqualToString:NSURLAuthenticationMethodServerTrust];

    if (!v18)
    {
      v25 = 0LL;
      uint64_t v27 = 1LL;
LABEL_28:

      goto LABEL_29;
    }

    id v19 = [v16 serverTrust];
    if (!v19)
    {
      if (qword_100037168 != -1) {
        dispatch_once(&qword_100037168, &stru_1000308F8);
      }
      v28 = (os_log_s *)qword_100037160;
      if (os_log_type_enabled((os_log_t)qword_100037160, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412546;
        id v41 = v16;
        __int16 v42 = 2112;
        v43 = v15;
        _os_log_error_impl( (void *)&_mh_execute_header,  v28,  OS_LOG_TYPE_ERROR,  "Failed to get server trust from %@ for task %@",  buf,  0x16u);
      }

      v29 = objc_alloc(&OBJC_CLASS___NSError);
      v38[0] = @"Line";
      v38[1] = @"Function";
      v39[0] = &off_100032578;
      id v24 = (id)objc_claimAutoreleasedReturnValue( +[NSString stringWithUTF8String:]( &OBJC_CLASS___NSString,  "stringWithUTF8String:",  "-[SWCDownloader URLSession:task:didReceiveChallenge:completionHandler:]"));
      v39[1] = v24;
      v30 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v39,  v38,  2LL));
      v31 = -[NSError initWithDomain:code:userInfo:](v29, "initWithDomain:code:userInfo:", _SWCErrorDomain, 101LL, v30);
      -[SWCDownloader _invokeCompletionHandlerForState:JSONObject:error:]( self,  "_invokeCompletionHandlerForState:JSONObject:error:",  v15,  0LL,  v31);

      goto LABEL_26;
    }

    v20 = (void *)objc_claimAutoreleasedReturnValue([v15 domain]);
    unsigned __int8 v21 = [v20 modeOfOperation];

    v22 = (void *)objc_claimAutoreleasedReturnValue(+[SWCSecurityGuard sharedSecurityGuard](&OBJC_CLASS___SWCSecurityGuard, "sharedSecurityGuard"));
    id v37 = 0LL;
    unsigned int v23 = [v22 verifyTrust:v19 allowInstalledRootCertificates:v21 & 1 error:&v37];
    id v24 = v37;

    if (v23)
    {
      v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSURLCredential credentialForTrust:](&OBJC_CLASS___NSURLCredential, "credentialForTrust:", v19));
      if (v25)
      {
        if (qword_100037168 != -1) {
          dispatch_once(&qword_100037168, &stru_1000308F8);
        }
        v26 = (os_log_s *)qword_100037160;
        if (os_log_type_enabled((os_log_t)qword_100037160, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412546;
          id v41 = v10;
          __int16 v42 = 2112;
          v43 = v15;
          _os_log_impl( (void *)&_mh_execute_header,  v26,  OS_LOG_TYPE_INFO,  "Successfully got credential for challenge %@ for task %@",  buf,  0x16u);
        }

        uint64_t v27 = 0LL;
        goto LABEL_27;
      }

      if (qword_100037168 != -1) {
        dispatch_once(&qword_100037168, &stru_1000308F8);
      }
      uint64_t v36 = qword_100037160;
      if (!os_log_type_enabled((os_log_t)qword_100037160, OS_LOG_TYPE_ERROR)) {
        goto LABEL_25;
      }
      *(_DWORD *)buf = 138412546;
      id v41 = v19;
      __int16 v42 = 2112;
      v43 = v15;
      v33 = "Failed to get credential from server trust %@ for task %@";
      v34 = (os_log_s *)v36;
      uint32_t v35 = 22;
    }

    else
    {
      if (qword_100037168 != -1) {
        dispatch_once(&qword_100037168, &stru_1000308F8);
      }
      uint64_t v32 = qword_100037160;
      if (!os_log_type_enabled((os_log_t)qword_100037160, OS_LOG_TYPE_ERROR)) {
        goto LABEL_25;
      }
      *(_DWORD *)buf = 138412802;
      id v41 = v19;
      __int16 v42 = 2112;
      v43 = v15;
      __int16 v44 = 2114;
      id v45 = v24;
      v33 = "Failed to verify server trust %@ for task %@: %{public}@";
      v34 = (os_log_s *)v32;
      uint32_t v35 = 32;
    }

    _os_log_error_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_ERROR, v33, buf, v35);
LABEL_25:
    -[SWCDownloader _invokeCompletionHandlerForState:JSONObject:error:]( self,  "_invokeCompletionHandlerForState:JSONObject:error:",  v15,  0LL,  v24);
LABEL_26:
    v25 = 0LL;
    uint64_t v27 = 2LL;
LABEL_27:

    goto LABEL_28;
  }

  v25 = 0LL;
  uint64_t v27 = 2LL;
LABEL_29:

  v11[2](v11, v27, v25);
}

- (void)URLSession:(id)a3 task:(id)a4 willPerformHTTPRedirection:(id)a5 newRequest:(id)a6 completionHandler:(id)a7
{
  id v10 = a4;
  id v11 = a6;
  id v12 = (void (**)(id, void))a7;
  id v13 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[NSOperationQueue underlyingQueue](self->_queue, "underlyingQueue"));
  dispatch_assert_queue_V2(v13);

  allTaskStates = self->_allTaskStates;
  v15 = (void *)objc_claimAutoreleasedReturnValue([v10 taskDescription]);
  id v16 = (void *)objc_claimAutoreleasedReturnValue(-[NSMapTable objectForKey:](allTaskStates, "objectForKey:", v15));

  if (v16)
  {
    v17 = (void *)objc_claimAutoreleasedReturnValue([v11 URL]);
    unsigned int v18 = (void *)objc_claimAutoreleasedReturnValue([v17 scheme]);

    if (v18 && ![v18 caseInsensitiveCompare:@"https"])
    {
      if (qword_100037168 != -1) {
        dispatch_once(&qword_100037168, &stru_1000308F8);
      }
      id v19 = (os_log_s *)(id)qword_100037160;
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
      {
        id v24 = (void *)objc_claimAutoreleasedReturnValue([v10 originalRequest]);
        v25 = (void *)objc_claimAutoreleasedReturnValue([v24 URL]);
        v26 = (void *)objc_claimAutoreleasedReturnValue([v11 URL]);
        int v27 = 138412802;
        v28 = v25;
        __int16 v29 = 2112;
        v30 = v26;
        __int16 v31 = 2112;
        uint64_t v32 = v16;
        _os_log_debug_impl( (void *)&_mh_execute_header,  v19,  OS_LOG_TYPE_DEBUG,  "Allowing redirect '%@' -> '%@' for task %@",  (uint8_t *)&v27,  0x20u);
      }

      id v20 = v11;
    }

    else
    {
      if (qword_100037168 != -1) {
        dispatch_once(&qword_100037168, &stru_1000308F8);
      }
      id v19 = (os_log_s *)(id)qword_100037160;
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      {
        unsigned __int8 v21 = (void *)objc_claimAutoreleasedReturnValue([v10 originalRequest]);
        v22 = (void *)objc_claimAutoreleasedReturnValue([v21 URL]);
        unsigned int v23 = (void *)objc_claimAutoreleasedReturnValue([v11 URL]);
        int v27 = 138412802;
        v28 = v22;
        __int16 v29 = 2112;
        v30 = v23;
        __int16 v31 = 2112;
        uint64_t v32 = v16;
        _os_log_error_impl( (void *)&_mh_execute_header,  v19,  OS_LOG_TYPE_ERROR,  "Denying redirect '%@' -> '%@' for task %@ because the new URL has a bad scheme",  (uint8_t *)&v27,  0x20u);
      }

      id v20 = 0LL;
    }

    ((void (**)(id, id))v12)[2](v12, v20);
  }

  else
  {
    v12[2](v12, 0LL);
  }
}

- (void)URLSession:(id)a3 dataTask:(id)a4 didReceiveResponse:(id)a5 completionHandler:(id)a6
{
  id v9 = a4;
  id v10 = a5;
  id v11 = (void (**)(id, uint64_t))a6;
  id v12 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[NSOperationQueue underlyingQueue](self->_queue, "underlyingQueue"));
  dispatch_assert_queue_V2(v12);

  allTaskStates = self->_allTaskStates;
  v14 = (void *)objc_claimAutoreleasedReturnValue([v9 taskDescription]);
  v15 = (__CFString *)objc_claimAutoreleasedReturnValue(-[NSMapTable objectForKey:](allTaskStates, "objectForKey:", v14));

  if (v15)
  {
    if (qword_100037168 != -1) {
      dispatch_once(&qword_100037168, &stru_1000308F8);
    }
    id v16 = (os_log_s *)(id)qword_100037160;
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
    {
      id v41 = (char *)objc_claimAutoreleasedReturnValue([v10 URL]);
      *(_DWORD *)buf = 138412546;
      v59 = v41;
      __int16 v60 = 2112;
      v61 = (char *)v15;
      _os_log_debug_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_DEBUG,  "Received URL '%@' response start for task %@",  buf,  0x16u);
    }

    v17 = (void *)objc_claimAutoreleasedReturnValue(-[__CFString buffer](v15, "buffer"));
    [v17 setLength:0];

    uint64_t v18 = objc_opt_class(&OBJC_CLASS___NSHTTPURLResponse);
    if ((objc_opt_isKindOfClass(v10, v18) & 1) == 0)
    {
      if (qword_100037168 != -1) {
        dispatch_once(&qword_100037168, &stru_1000308F8);
      }
      id v19 = (os_log_s *)(id)qword_100037160;
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      {
        v43 = (char *)objc_claimAutoreleasedReturnValue([v10 URL]);
        __int16 v44 = (objc_class *)objc_opt_class(v10);
        id v45 = NSStringFromClass(v44);
        v46 = (char *)objc_claimAutoreleasedReturnValue(v45);
        *(_DWORD *)buf = 138412802;
        v59 = v43;
        __int16 v60 = 2112;
        v61 = (char *)v15;
        __int16 v62 = 2114;
        v63 = v46;
        _os_log_error_impl( (void *)&_mh_execute_header,  v19,  OS_LOG_TYPE_ERROR,  "Request for '%@' for task %@ denied because it is not an HTTP response (%{public}@)",  buf,  0x20u);
      }

      uint64_t v23 = 0LL;
      goto LABEL_51;
    }

    id v19 = (os_log_s *)v10;
    v55 = (char *)-[os_log_s statusCode](v19, "statusCode");
    id v20 = (__CFString *)objc_claimAutoreleasedReturnValue( -[os_log_s valueForHTTPHeaderField:]( v19,  "valueForHTTPHeaderField:",  @"Apple-Failure-Reason"));
    unsigned __int8 v21 = (void *)objc_claimAutoreleasedReturnValue( -[os_log_s valueForHTTPHeaderField:]( v19,  "valueForHTTPHeaderField:",  @"Apple-Failure-Details"));
    if ([v21 length])
    {
      if (-[__CFString length](v20, "length")) {
        v22 = (__CFString *)objc_claimAutoreleasedReturnValue( -[__CFString stringByAppendingFormat:]( v20,  "stringByAppendingFormat:",  @" -- %@",  v21));
      }
      else {
        v22 = v21;
      }
      id v24 = v22;
    }

    else
    {
      id v24 = v20;
    }

    v25 = v24;
    if (!-[__CFString length](v24, "length"))
    {

      v25 = @"unknown";
    }

    unsigned int v26 = -[__CFString downloadRoute](v15, "downloadRoute");
    unint64_t v27 = (unint64_t)(v55 - 400);
    if (v26)
    {
      if (v27 <= 0x63)
      {
        v28 = objc_alloc(&OBJC_CLASS___NSError);
        v56[0] = @"Line";
        v56[1] = @"Function";
        v57[0] = &off_1000325A8;
        __int16 v29 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithUTF8String:]( &OBJC_CLASS___NSString,  "stringWithUTF8String:",  "-[SWCDownloader URLSession:dataTask:didReceiveResponse:completionHandler:]"));
        v57[1] = v29;
        v30 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v57,  v56,  2LL));
        __int16 v31 = (__CFString *)v25;
        uint64_t v32 = -[NSError initWithDomain:code:userInfo:](v28, "initWithDomain:code:userInfo:", @"HTTP", v55, v30);
        -[__CFString setCancellationError:](v15, "setCancellationError:", v32);

        if (qword_100037168 != -1) {
          dispatch_once(&qword_100037168, &stru_1000308F8);
        }
        v33 = (os_log_s *)(id)qword_100037160;
        if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
        {
          v47 = (char *)objc_claimAutoreleasedReturnValue(-[os_log_s URL](v19, "URL"));
          v48 = sub_100003CA0((uint64_t)-[__CFString downloadRoute](v15, "downloadRoute"));
          v49 = (char *)objc_claimAutoreleasedReturnValue(v48);
          *(_DWORD *)buf = 138413058;
          v59 = v47;
          __int16 v60 = 2048;
          v61 = v55;
          __int16 v62 = 2114;
          v63 = v49;
          __int16 v64 = 2112;
          v65 = v15;
          _os_log_error_impl( (void *)&_mh_execute_header,  v33,  OS_LOG_TYPE_ERROR,  "Request for '%@' denied due to HTTP status %lli on route %{public}@ for task %@",  buf,  0x2Au);
        }

LABEL_49:
        uint64_t v23 = 0LL;
        goto LABEL_50;
      }

      __int16 v31 = (__CFString *)v25;
      if (qword_100037168 != -1) {
        dispatch_once(&qword_100037168, &stru_1000308F8);
      }
      v39 = (os_log_s *)qword_100037160;
      if (os_log_type_enabled((os_log_t)qword_100037160, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 134218242;
        v59 = v55;
        __int16 v60 = 2112;
        v61 = (char *)v15;
        v40 = "Proceeding with response (status: %lli) for task %@";
LABEL_43:
        _os_log_debug_impl((void *)&_mh_execute_header, v39, OS_LOG_TYPE_DEBUG, v40, buf, 0x16u);
      }
    }

    else
    {
      if (v27 < 0xC8)
      {
        v54 = objc_alloc(&OBJC_CLASS___NSError);
        v69[0] = &off_100032590;
        v68[0] = @"Line";
        v68[1] = @"Function";
        v53 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithUTF8String:]( &OBJC_CLASS___NSString,  "stringWithUTF8String:",  "-[SWCDownloader URLSession:dataTask:didReceiveResponse:completionHandler:]"));
        v69[1] = v53;
        v69[2] = v25;
        v68[2] = NSDebugDescriptionErrorKey;
        v68[3] = NSUnderlyingErrorKey;
        v34 = objc_alloc(&OBJC_CLASS___NSError);
        v66[1] = @"Function";
        v67[0] = &off_100032590;
        v66[0] = @"Line";
        v52 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithUTF8String:]( &OBJC_CLASS___NSString,  "stringWithUTF8String:",  "-[SWCDownloader URLSession:dataTask:didReceiveResponse:completionHandler:]"));
        v67[1] = v52;
        v51 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v67,  v66,  2LL));
        uint32_t v35 = -[NSError initWithDomain:code:userInfo:](v34, "initWithDomain:code:userInfo:", @"HTTP", v55);
        v69[3] = v35;
        uint64_t v36 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v69,  v68,  4LL));
        __int16 v31 = (__CFString *)v25;
        id v37 = -[NSError initWithDomain:code:userInfo:](v54, "initWithDomain:code:userInfo:", _SWCErrorDomain, 7LL, v36);
        -[__CFString setCancellationError:](v15, "setCancellationError:", v37);

        if (qword_100037168 != -1) {
          dispatch_once(&qword_100037168, &stru_1000308F8);
        }
        v38 = (os_log_s *)(id)qword_100037160;
        if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
        {
          v50 = (char *)objc_claimAutoreleasedReturnValue(-[os_log_s URL](v19, "URL"));
          *(_DWORD *)buf = 138413058;
          v59 = v50;
          __int16 v60 = 2112;
          v61 = (char *)v15;
          __int16 v62 = 2048;
          v63 = v55;
          __int16 v64 = 2114;
          v65 = v25;
          _os_log_error_impl( (void *)&_mh_execute_header,  v38,  OS_LOG_TYPE_ERROR,  "Request for '%@' for task %@ denied because the CDN told us to stop with HTTP status %lli: %{public}@",  buf,  0x2Au);
        }

        goto LABEL_49;
      }

      __int16 v31 = (__CFString *)v25;
      if ((unint64_t)(v55 - 200) >= 0x64)
      {
        if (qword_100037168 != -1) {
          dispatch_once(&qword_100037168, &stru_1000308F8);
        }
        __int16 v42 = (os_log_s *)qword_100037160;
        if (os_log_type_enabled((os_log_t)qword_100037160, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 134218242;
          v59 = v55;
          __int16 v60 = 2112;
          v61 = (char *)v15;
          _os_log_error_impl( (void *)&_mh_execute_header,  v42,  OS_LOG_TYPE_ERROR,  "CDN sent an unexpected HTTP status %lli (ignoring) for task %@",  buf,  0x16u);
        }

        goto LABEL_49;
      }

      if (qword_100037168 != -1) {
        dispatch_once(&qword_100037168, &stru_1000308F8);
      }
      v39 = (os_log_s *)qword_100037160;
      if (os_log_type_enabled((os_log_t)qword_100037160, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 134218242;
        v59 = v55;
        __int16 v60 = 2112;
        v61 = (char *)v15;
        v40 = "Proceeding: CDN gave HTTP status %lli for task %@";
        goto LABEL_43;
      }
    }

    uint64_t v23 = 1LL;
LABEL_50:

LABEL_51:
    goto LABEL_52;
  }

  uint64_t v23 = 0LL;
LABEL_52:

  v11[2](v11, v23);
}

- (void)URLSession:(id)a3 task:(id)a4 didCompleteWithError:(id)a5
{
  id v12 = a4;
  id v7 = a5;
  uint64_t v8 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[NSOperationQueue underlyingQueue](self->_queue, "underlyingQueue"));
  dispatch_assert_queue_V2(v8);

  allTaskStates = self->_allTaskStates;
  id v10 = (void *)objc_claimAutoreleasedReturnValue([v12 taskDescription]);
  id v11 = (void *)objc_claimAutoreleasedReturnValue(-[NSMapTable objectForKey:](allTaskStates, "objectForKey:", v10));

  if (v11)
  {
    if (v7) {
      -[SWCDownloader _invokeCompletionHandlerForState:JSONObject:error:]( self,  "_invokeCompletionHandlerForState:JSONObject:error:",  v11,  0LL,  v7);
    }
    else {
      -[SWCDownloader _processDownloadedDataForState:](self, "_processDownloadedDataForState:", v11);
    }
  }
}

- (void)URLSession:(id)a3 dataTask:(id)a4 didReceiveData:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  id v9 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[NSOperationQueue underlyingQueue](self->_queue, "underlyingQueue"));
  dispatch_assert_queue_V2(v9);

  allTaskStates = self->_allTaskStates;
  id v11 = (void *)objc_claimAutoreleasedReturnValue([v7 taskDescription]);
  id v12 = (void *)objc_claimAutoreleasedReturnValue(-[NSMapTable objectForKey:](allTaskStates, "objectForKey:", v11));

  if (v12)
  {
    id v13 = (void *)objc_claimAutoreleasedReturnValue([v12 buffer]);
    [v13 appendData:v8];

    v14 = (void *)objc_claimAutoreleasedReturnValue([v12 buffer]);
    id v15 = [v14 length];

    if ((unint64_t)v15 > 0x20000)
    {
      if (qword_100037168 != -1) {
        dispatch_once(&qword_100037168, &stru_1000308F8);
      }
      id v16 = (os_log_s *)qword_100037160;
      if (os_log_type_enabled((os_log_t)qword_100037160, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v28 = v12;
        _os_log_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_DEFAULT,  "Data for task %@ exceeded maximum length",  buf,  0xCu);
      }

      v17 = -[NSString initWithFormat:]( objc_alloc(&OBJC_CLASS___NSString),  "initWithFormat:",  @"Data exceeded maximum length of %zu bytes.",  0x20000LL);
      uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue([v12 task]);
      id v19 = (void *)objc_claimAutoreleasedReturnValue([v18 response]);

      if (v19 && (uint64_t)[v19 expectedContentLength] >= 1)
      {
        id v20 = -[NSString initWithFormat:]( [NSString alloc],  "initWithFormat:",  @"Data exceeded maximum length of %zu bytes (server said it would be %lld bytes.)",  0x20000,  [v19 expectedContentLength]);

        v17 = v20;
      }

      unsigned __int8 v21 = objc_alloc(&OBJC_CLASS___NSError);
      v26[0] = &off_1000325C0;
      v25[0] = @"Line";
      v25[1] = @"Function";
      v22 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithUTF8String:]( &OBJC_CLASS___NSString,  "stringWithUTF8String:",  "-[SWCDownloader URLSession:dataTask:didReceiveData:]"));
      v25[2] = NSDebugDescriptionErrorKey;
      v26[1] = v22;
      v26[2] = v17;
      uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v26,  v25,  3LL));
      id v24 = -[NSError initWithDomain:code:userInfo:]( v21,  "initWithDomain:code:userInfo:",  NSURLErrorDomain,  -1103LL,  v23);
      [v12 cancelTaskWithError:v24];
    }
  }
}

- (SWCDownloaderDelegate)delegate
{
  return (SWCDownloaderDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  for (uint64_t i = 5LL; i != 1; --i)
    objc_storeStrong((id *)&(&self->super.isa)[i], 0LL);
  objc_storeStrong((id *)&self->_queue, 0LL);
}

- (unsigned)_sessionIDForTaskState:(id)a3
{
  id v3 = a3;
  unsigned int v4 = [v3 downloadRoute];
  unsigned int v5 = [v3 isDiscretionary];
  unsigned __int8 v6 = v4 == 0;

  if (v5) {
    return v6 | 2;
  }
  else {
    return v6;
  }
}

- (id)_sessionForTaskState:(id)a3
{
  unsigned int v5 = objc_autoreleasePoolPush();
  unsigned int v6 = -[SWCDownloader _sessionIDForTaskState:](self, "_sessionIDForTaskState:", a3);
  sessions = self->_sessions;
  id v8 = self->_sessions[v6];
  if (!v8)
  {
    unsigned int v9 = v6;
    id v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSURLSessionConfiguration ephemeralSessionConfiguration]( &OBJC_CLASS___NSURLSessionConfiguration,  "ephemeralSessionConfiguration"));
    [v10 setHTTPCookieAcceptPolicy:1];
    [v10 setHTTPCookieStorage:0];
    [v10 setHTTPShouldSetCookies:0];
    [v10 setRequestCachePolicy:1];
    [v10 setURLCredentialStorage:0];
    [v10 setURLCache:0];
    [v10 setAllowsCellularAccess:1];
    id v11 = (void *)objc_claimAutoreleasedReturnValue(+[_SWCPrefs sharedPrefs](&OBJC_CLASS____SWCPrefs, "sharedPrefs"));
    objc_msgSend(v10, "set_performsEVCertCheck:", objc_msgSend(v11, "verifyExtendedValidation"));

    if ((v9 & 1) != 0) {
      [v10 setWaitsForConnectivity:1];
    }
    if ((v9 & 2) != 0) {
      [v10 setDiscretionary:1];
    }
    uint64_t v12 = objc_claimAutoreleasedReturnValue( +[NSURLSession sessionWithConfiguration:delegate:delegateQueue:]( &OBJC_CLASS___NSURLSession,  "sessionWithConfiguration:delegate:delegateQueue:",  v10,  self,  self->_queue));
    id v13 = sessions[v9];
    sessions[v9] = (NSURLSession *)v12;

    id v8 = sessions[v9];
  }

  v14 = v8;
  objc_autoreleasePoolPop(v5);
  return v14;
}

- (unint64_t)_maximumActiveTaskCountForSessionID:(unsigned __int8)a3
{
  if (a3 > 3u) {
    return 1LL;
  }
  else {
    return qword_100028910[(char)a3];
  }
}

- (id)_taskStateForDomain:(id)a3 downloadRoute:(unsigned __int8)a4
{
  id v6 = a3;
  uint64_t v15 = 0LL;
  id v16 = &v15;
  uint64_t v17 = 0x3032000000LL;
  uint64_t v18 = sub_1000068B8;
  id v19 = sub_1000068C8;
  id v20 = 0LL;
  id v7 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[NSOperationQueue underlyingQueue](self->_queue, "underlyingQueue"));
  dispatch_assert_queue_V2(v7);

  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472LL;
  v11[2] = sub_1000068D0;
  v11[3] = &unk_100030818;
  unsigned __int8 v14 = a4;
  id v8 = v6;
  id v12 = v8;
  id v13 = &v15;
  -[SWCDownloader _enumerateTaskStatesUsingBlock:](self, "_enumerateTaskStatesUsingBlock:", v11);
  id v9 = (id)v16[5];

  _Block_object_dispose(&v15, 8);
  return v9;
}

- (void)_downloadAASAFileForDomain:(id)a3 applicationIdentifier:(id)a4 downloadRoute:(unsigned __int8)a5 discretionary:(BOOL)a6 completionHandlers:(id)a7
{
  id v13 = a3;
  id v14 = a4;
  id v15 = a7;
  id v16 = objc_alloc(&OBJC_CLASS___NSString);
  uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue([v13 redactedDescription]);
  uint64_t v18 = -[NSString initWithFormat:](v16, "initWithFormat:", @"com.apple.swc.dl.begin-%@", v17);
  id v19 = -[NSString UTF8String](v18, "UTF8String");
  unsigned __int8 v21 = (void *)os_transaction_create(v19, v20);

  v22 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[NSOperationQueue underlyingQueue](self->_queue, "underlyingQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100006B34;
  block[3] = &unk_100030840;
  block[4] = self;
  id v28 = v13;
  unsigned __int8 v33 = a5;
  BOOL v34 = a6;
  id v29 = v15;
  id v30 = v14;
  id v31 = v21;
  SEL v32 = a2;
  id v23 = v21;
  id v24 = v14;
  id v25 = v15;
  id v26 = v13;
  dispatch_async(v22, block);
}

- (id)_URLRequestWithDomain:(id)a3 downloadRoute:(unsigned __int8)a4
{
  unsigned int v4 = a4;
  id v5 = a3;
  id v6 = objc_autoreleasePoolPush();
  id v7 = objc_alloc_init(&OBJC_CLASS___NSURLComponents);
  -[NSURLComponents setScheme:](v7, "setScheme:", @"https");
  if (v4)
  {
    if (v4 == 1)
    {
      id v8 = (void *)objc_claimAutoreleasedReturnValue([v5 host]);
      -[NSURLComponents setHost:](v7, "setHost:", v8);

      id v9 = (void *)objc_claimAutoreleasedReturnValue([v5 port]);
      -[NSURLComponents setPort:](v7, "setPort:", v9);

      -[NSURLComponents setPath:](v7, "setPath:", @"/.well-known/apple-app-site-association");
    }

    else
    {
      if (qword_100037168 != -1) {
        dispatch_once(&qword_100037168, &stru_1000308F8);
      }
      id v16 = (os_log_s *)qword_100037160;
      if (os_log_type_enabled((os_log_t)qword_100037160, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 134217984;
        uint64_t v26 = v4;
        _os_log_fault_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_FAULT,  "Unknown download route %llu: this is a bug in SWC.",  buf,  0xCu);
      }
    }

    id v14 = 0LL;
  }

  else
  {
    -[NSURLComponents setHost:](v7, "setHost:", @"app-site-association.cdn-apple.com");
    id v10 = [@"/a/v1/" mutableCopy];
    id v11 = (void *)objc_claimAutoreleasedReturnValue([v5 host]);
    [v10 appendString:v11];

    uint64_t v12 = objc_claimAutoreleasedReturnValue([v5 port]);
    id v13 = (void *)v12;
    if (v12) {
      [v10 appendFormat:@":%@", v12];
    }

    -[NSURLComponents setPath:](v7, "setPath:", v10);
    id v14 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    id v15 = (void *)objc_claimAutoreleasedReturnValue([v5 host]);
    -[NSMutableDictionary setObject:forKeyedSubscript:]( v14,  "setObject:forKeyedSubscript:",  v15,  @"Apple-Proxied-Domain-Name");
  }

  uint64_t v17 = objc_alloc(&OBJC_CLASS___NSMutableURLRequest);
  uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue(-[NSURLComponents URL](v7, "URL"));
  id v19 = -[NSMutableURLRequest initWithURL:](v17, "initWithURL:", v18);

  v23[0] = _NSConcreteStackBlock;
  v23[1] = 3221225472LL;
  v23[2] = sub_1000075EC;
  v23[3] = &unk_100030868;
  uint64_t v20 = v19;
  id v24 = v20;
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](v14, "enumerateKeysAndObjectsUsingBlock:", v23);
  if (v4) {
    _CFURLRequestSetAllowedProtocolTypes( -[NSMutableURLRequest _CFURLRequest](v20, "_CFURLRequest"), 1LL);
  }
  -[NSMutableURLRequest setCachePolicy:](v20, "setCachePolicy:", 1LL);
  -[NSMutableURLRequest setHTTPShouldHandleCookies:](v20, "setHTTPShouldHandleCookies:", 0LL);
  id v21 = -[NSMutableURLRequest copy](v20, "copy");

  objc_autoreleasePoolPop(v6);
  return v21;
}

- (void)_enumerateTaskStatesUsingBlock:(id)a3
{
  unsigned int v4 = (void (**)(id, uint64_t, unsigned __int8 *))a3;
  id v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[NSOperationQueue underlyingQueue](self->_queue, "underlyingQueue"));
  dispatch_assert_queue_V2(v5);

  unsigned __int8 v16 = 0;
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[NSMapTable objectEnumerator](self->_allTaskStates, "objectEnumerator", 0LL));
  id v7 = [v6 countByEnumeratingWithState:&v12 objects:v17 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v13;
LABEL_3:
    uint64_t v9 = 0LL;
    while (1)
    {
      if (*(void *)v13 != v8) {
        objc_enumerationMutation(v6);
      }
      uint64_t v10 = *(void *)(*((void *)&v12 + 1) + 8 * v9);
      id v11 = objc_autoreleasePoolPush();
      v4[2](v4, v10, &v16);
      LODWORD(v10) = v16;
      objc_autoreleasePoolPop(v11);
      if ((_DWORD)v10) {
        break;
      }
      if (v7 == (id)++v9)
      {
        id v7 = [v6 countByEnumeratingWithState:&v12 objects:v17 count:16];
        if (v7) {
          goto LABEL_3;
        }
        break;
      }
    }
  }
}

- (void)_resumePendingTasks
{
  id v3 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[NSOperationQueue underlyingQueue](self->_queue, "underlyingQueue"));
  dispatch_assert_queue_V2(v3);

  unsigned int v4 = objc_autoreleasePoolPush();
  v18[0] = 0LL;
  v18[1] = v18;
  v18[2] = 0x5812000000LL;
  v18[3] = sub_1000079F0;
  v18[4] = sub_100007A60;
  memset(&v18[5], 0, 40);
  int v19 = 1065353216;
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472LL;
  v17[2] = sub_100007A68;
  v17[3] = &unk_100030890;
  v17[4] = self;
  v17[5] = v18;
  -[SWCDownloader _enumerateTaskStatesUsingBlock:](self, "_enumerateTaskStatesUsingBlock:", v17);
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472LL;
  v14[2] = sub_100007AF8;
  v14[3] = &unk_1000308B8;
  v14[4] = self;
  unsigned __int8 v16 = v18;
  id v5 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  __int128 v15 = v5;
  -[SWCDownloader _enumerateTaskStatesUsingBlock:](self, "_enumerateTaskStatesUsingBlock:", v14);
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  __int128 v10 = 0u;
  __int128 v11 = 0u;
  id v6 = v5;
  id v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v6,  "countByEnumeratingWithState:objects:count:",  &v10,  v20,  16LL);
  if (v7)
  {
    uint64_t v8 = *(void *)v11;
    do
    {
      uint64_t v9 = 0LL;
      do
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v6);
        }
        objc_msgSend(*(id *)(*((void *)&v10 + 1) + 8 * (void)v9), "resumeTask", (void)v10);
        uint64_t v9 = (char *)v9 + 1;
      }

      while (v7 != v9);
      id v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v6,  "countByEnumeratingWithState:objects:count:",  &v10,  v20,  16LL);
    }

    while (v7);
  }

  _Block_object_dispose(v18, 8);
  sub_1000086EC((uint64_t)&v18[6]);
  objc_autoreleasePoolPop(v4);
}

- (id)_replaceTaskState:(id)a3
{
  id v5 = a3;
  id v6 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[NSOperationQueue underlyingQueue](self->_queue, "underlyingQueue"));
  dispatch_assert_queue_V2(v6);

  id v7 = objc_alloc(&OBJC_CLASS___SWCDownloadTaskState);
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v5 domain]);
  uint64_t v9 = -[SWCDownloadTaskState initWithDownloader:domain:downloadRoute:]( v7,  "initWithDownloader:domain:downloadRoute:",  self,  v8,  [v5 downloadRoute]);

  if (!v9)
  {
    uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"));
    [v20 handleFailureInMethod:a2 object:self file:@"SWCDownloader.mm" lineNumber:709 description:@"Failed to create download state object"];
  }

  __int128 v10 = (void *)objc_claimAutoreleasedReturnValue(-[SWCDownloadTaskState completionHandlers](v9, "completionHandlers"));
  __int128 v11 = (void *)objc_claimAutoreleasedReturnValue([v5 completionHandlers]);
  [v10 setArray:v11];

  __int128 v12 = (void *)objc_claimAutoreleasedReturnValue([v5 completionHandlers]);
  [v12 removeAllObjects];

  __int128 v13 = (void *)objc_claimAutoreleasedReturnValue([v5 cancellationError]);
  -[SWCDownloadTaskState setCancellationError:](v9, "setCancellationError:", v13);

  allTaskStates = self->_allTaskStates;
  __int128 v15 = (void *)objc_claimAutoreleasedReturnValue([v5 task]);
  unsigned __int8 v16 = (void *)objc_claimAutoreleasedReturnValue([v15 taskDescription]);
  -[NSMapTable removeObjectForKey:](allTaskStates, "removeObjectForKey:", v16);

  uint64_t v17 = self->_allTaskStates;
  uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue(-[SWCDownloadTaskState taskDescription](v9, "taskDescription"));
  -[NSMapTable setObject:forKey:](v17, "setObject:forKey:", v9, v18);

  [v5 cancelTaskWithError:0];
  return v9;
}

- (void)_processDownloadedDataForState:(id)a3
{
  id v4 = a3;
  id v5 = objc_autoreleasePoolPush();
  if (qword_100037168 != -1) {
    dispatch_once(&qword_100037168, &stru_1000308F8);
  }
  id v6 = (os_log_s *)(id)qword_100037160;
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    v22 = (void *)objc_claimAutoreleasedReturnValue([v4 domain]);
    id v23 = sub_100003CA0((uint64_t)[v4 downloadRoute]);
    id v24 = (void *)objc_claimAutoreleasedReturnValue(v23);
    int __buf = 138412546;
    unint64_t v27 = v22;
    __int16 v28 = 2114;
    id v29 = v24;
    _os_log_debug_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEBUG,  "Downloaded data for domain %@ (route? %{public}@)",  (uint8_t *)&__buf,  0x16u);
  }

  id v7 = (void *)objc_claimAutoreleasedReturnValue([v4 domain]);
  uint64_t v8 = (NSMutableData *)objc_claimAutoreleasedReturnValue([v4 buffer]);
  uint64_t v9 = objc_alloc(&OBJC_CLASS___NSString);
  __int128 v10 = (void *)objc_claimAutoreleasedReturnValue([v7 redactedDescription]);
  __int128 v11 = -[NSString initWithFormat:](v9, "initWithFormat:", @"com.apple.swc.aasa.read-%@", v10);
  __int128 v12 = -[NSString UTF8String](v11, "UTF8String");
  __int128 v14 = (void *)os_transaction_create(v12, v13);

  if (v8)
  {
    if (*((void *)&_SWCDiagnosticStorage + 2)
      && (__int128 v15 = (void *)objc_claimAutoreleasedReturnValue(+[_SWCPrefs sharedPrefs](&OBJC_CLASS____SWCPrefs, "sharedPrefs")),
          unsigned int v16 = [v15 isAppleInternal],
          v15,
          v16))
    {
      arc4random_buf(&__buf, 0x80uLL);
      uint64_t v17 = -[NSMutableData initWithCapacity:]( objc_alloc(&OBJC_CLASS___NSMutableData),  "initWithCapacity:",  (char *)-[NSMutableData length](v8, "length") + 128);
      -[NSMutableData appendBytes:length:](v17, "appendBytes:length:", &__buf, 128LL);
      -[NSMutableData appendData:](v17, "appendData:", v8);
    }

    else
    {
      uint64_t v17 = v8;
    }
  }

  else
  {
    uint64_t v17 = 0LL;
  }

  uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue(+[SWCSecurityGuard sharedSecurityGuard](&OBJC_CLASS___SWCSecurityGuard, "sharedSecurityGuard"));
  id v25 = 0LL;
  int v19 = (void *)objc_claimAutoreleasedReturnValue([v18 JSONObjectWithSignedJSONData:v17 error:&v25]);
  id v20 = v25;

  if (v19)
  {
    -[SWCDownloader _invokeCompletionHandlerForState:JSONObject:error:]( self,  "_invokeCompletionHandlerForState:JSONObject:error:",  v4,  v19,  0LL);
  }

  else
  {
    if (qword_100037168 != -1) {
      dispatch_once(&qword_100037168, &stru_1000308F8);
    }
    id v21 = (os_log_s *)qword_100037160;
    if (os_log_type_enabled((os_log_t)qword_100037160, OS_LOG_TYPE_ERROR))
    {
      int __buf = 138412546;
      unint64_t v27 = v7;
      __int16 v28 = 2112;
      id v29 = v20;
      _os_log_error_impl( (void *)&_mh_execute_header,  v21,  OS_LOG_TYPE_ERROR,  "Error securing JSON file for %@: %@",  (uint8_t *)&__buf,  0x16u);
    }

    -[SWCDownloader _invokeCompletionHandlerForState:JSONObject:error:]( self,  "_invokeCompletionHandlerForState:JSONObject:error:",  v4,  0LL,  v20);
  }

  objc_autoreleasePoolPop(v5);
}

- (void)_invokeCompletionHandlerForState:(id)a3 JSONObject:(id)a4 error:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  __int128 v11 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[NSOperationQueue underlyingQueue](self->_queue, "underlyingQueue"));
  dispatch_assert_queue_V2(v11);

  context = objc_autoreleasePoolPush();
  uint32_t v35 = (void *)objc_claimAutoreleasedReturnValue(-[SWCDownloader delegate](self, "delegate"));
  id v12 = [v8 downloadRoute];
  if (v9)
  {
    if (v35
      && (objc_opt_respondsToSelector( v35,  "downloader:didDownloadAASAFileContainingJSONObject:fromDomain:downloadRoute:") & 1) != 0)
    {
      uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue([v8 domain]);
      [v35 downloader:self didDownloadAASAFileContainingJSONObject:v9 fromDomain:v13 downloadRoute:v12];
    }

    __int128 v42 = 0u;
    __int128 v43 = 0u;
    __int128 v40 = 0u;
    __int128 v41 = 0u;
    __int128 v14 = (void *)objc_claimAutoreleasedReturnValue([v8 completionHandlers]);
    id v15 = [v14 countByEnumeratingWithState:&v40 objects:v49 count:16];
    if (v15)
    {
      uint64_t v16 = *(void *)v41;
      do
      {
        for (uint64_t i = 0LL; i != v15; uint64_t i = (char *)i + 1)
        {
          if (*(void *)v41 != v16) {
            objc_enumerationMutation(v14);
          }
          (*(void (**)(void))(*(void *)(*((void *)&v40 + 1) + 8LL * (void)i) + 16LL))();
        }

        id v15 = [v14 countByEnumeratingWithState:&v40 objects:v49 count:16];
      }

      while (v15);
    }
  }

  else
  {
    __int128 v14 = (void *)objc_claimAutoreleasedReturnValue([v8 cancellationError]);
    if ([v10 code] == (id)-999)
    {
      uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue([v10 domain]);
      unsigned int v19 = [v18 isEqual:NSURLErrorDomain];
      unsigned int v20 = v14 ? v19 : 0;

      if (v20 == 1)
      {
        if (qword_100037168 != -1) {
          dispatch_once(&qword_100037168, &stru_1000308F8);
        }
        id v21 = (os_log_s *)qword_100037160;
        if (os_log_type_enabled((os_log_t)qword_100037160, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412546;
          v46 = v14;
          __int16 v47 = 2112;
          id v48 = v10;
          _os_log_impl( (void *)&_mh_execute_header,  v21,  OS_LOG_TYPE_INFO,  "Substituting cancellation error %@ for error %@",  buf,  0x16u);
        }

        id v22 = v14;

        id v10 = v22;
      }
    }

    if (v35 && (objc_opt_respondsToSelector(v35, "downloader:failedToDownloadAASAFileFromDomain:error:") & 1) != 0)
    {
      id v23 = (void *)objc_claimAutoreleasedReturnValue([v8 domain]);
      [v35 downloader:self failedToDownloadAASAFileFromDomain:v23 error:v10];
    }

    __int128 v38 = 0u;
    __int128 v39 = 0u;
    __int128 v36 = 0u;
    __int128 v37 = 0u;
    id v24 = (void *)objc_claimAutoreleasedReturnValue([v8 completionHandlers]);
    id v25 = [v24 countByEnumeratingWithState:&v36 objects:v44 count:16];
    if (v25)
    {
      uint64_t v26 = *(void *)v37;
      do
      {
        for (j = 0LL; j != v25; j = (char *)j + 1)
        {
          if (*(void *)v37 != v26) {
            objc_enumerationMutation(v24);
          }
          (*(void (**)(void))(*(void *)(*((void *)&v36 + 1) + 8LL * (void)j) + 16LL))();
        }

        id v25 = [v24 countByEnumeratingWithState:&v36 objects:v44 count:16];
      }

      while (v25);
    }
  }

  allTaskStates = self->_allTaskStates;
  id v29 = (void *)objc_claimAutoreleasedReturnValue([v8 task]);
  id v30 = (void *)objc_claimAutoreleasedReturnValue([v29 taskDescription]);
  -[NSMapTable removeObjectForKey:](allTaskStates, "removeObjectForKey:", v30);

  if (-[NSMapTable count](self->_allTaskStates, "count"))
  {
    -[SWCDownloader _resumePendingTasks](self, "_resumePendingTasks");
  }

  else
  {
    uint64_t v31 = 0LL;
    sessions = self->_sessions;
    do
    {
      -[NSURLSession finishTasksAndInvalidate](sessions[v31], "finishTasksAndInvalidate");
      unsigned __int8 v33 = sessions[v31];
      sessions[v31] = 0LL;

      ++v31;
    }

    while (v31 != 4);
  }

  objc_autoreleasePoolPop(context);
}

@end