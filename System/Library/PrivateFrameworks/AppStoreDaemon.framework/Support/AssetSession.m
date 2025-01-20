@interface AssetSession
- (AssetSession)init;
- (void)URLSession:(id)a3 _willRetryBackgroundDataTask:(id)a4 withError:(id)a5;
- (void)URLSession:(id)a3 dataTask:(id)a4 didReceiveData:(id)a5;
- (void)URLSession:(id)a3 dataTask:(id)a4 didReceiveResponse:(id)a5 completionHandler:(id)a6;
- (void)URLSession:(id)a3 task:(id)a4 _alternatePathAvailable:(int)a5;
- (void)URLSession:(id)a3 task:(id)a4 _willSendRequestForEstablishedConnection:(id)a5 completionHandler:(id)a6;
- (void)URLSession:(id)a3 task:(id)a4 didCompleteWithError:(id)a5;
- (void)URLSession:(id)a3 task:(id)a4 didFinishCollectingMetrics:(id)a5;
@end

@implementation AssetSession

- (AssetSession)init
{
  v12.receiver = self;
  v12.super_class = (Class)&OBJC_CLASS___AssetSession;
  v2 = -[AssetSession init](&v12, "init");
  if (v2)
  {
    dispatch_queue_attr_t v3 = dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v4 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v3);
    dispatch_queue_t v5 = dispatch_queue_create("com.apple.appstored.AssetSession", v4);
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

- (void)URLSession:(id)a3 dataTask:(id)a4 didReceiveData:(id)a5
{
  id v6 = a4;
  id v7 = a5;
  id v8 = sub_1001BAC70((uint64_t)&OBJC_CLASS___AssetTaskInfo, v6);
  uint64_t v9 = objc_claimAutoreleasedReturnValue(v8);
  uint64_t v10 = ASDLogHandleForCategory(10LL);
  v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
  objc_super v12 = v11;
  if (v9)
  {
    BOOL v13 = os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG);

    if (v13)
    {
      uint64_t v15 = ASDLogHandleForCategory(10LL);
      v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(v15);
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
      {
        id v37 = objc_getProperty((id)v9, v17, 56LL, 1);
        v38 = (char *)[v6 countOfBytesReceived] + *(void *)(v9 + 112);
        v39 = (char *)[v6 countOfBytesExpectedToReceive] + *(void *)(v9 + 112);
        *(_DWORD *)buf = 138412802;
        id v45 = v37;
        __int16 v46 = 2048;
        v47 = v38;
        __int16 v48 = 2048;
        v49 = v39;
        _os_log_debug_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_DEBUG,  "[%@] %{iec-bytes}lld/%{iec-bytes}lld",  buf,  0x20u);
      }
    }

    id v18 = objc_getProperty((id)v9, v14, 80LL, 1);
    objc_msgSend( v18,  "setCompletedUnitCount:",  (char *)objc_msgSend(v7, "length") + (void)objc_msgSend(v18, "completedUnitCount"));

    double v19 = *(double *)(v9 + 160);
    *(CFAbsoluteTime *)(v9 + 160) = CFAbsoluteTimeGetCurrent();
    if (v19 > 0.0)
    {
      double v20 = (double)(unint64_t)[v7 length] / (*(double *)(v9 + 160) - v19);
      double v21 = fmin(*(double *)(v9 + 152), v20);
      *(double *)(v9 + 144) = fmax(*(double *)(v9 + 144), v20);
      *(double *)(v9 + 152) = v21;
    }

    id WeakRetained = objc_loadWeakRetained((id *)(v9 + 88));
    v23 = (void (**)(void, void, void, void))objc_claimAutoreleasedReturnValue([WeakRetained progress]);

    if (v23) {
      ((void (**)(void, uint64_t, char *, char *))v23)[2]( v23,  1,  (char *)[v6 countOfBytesReceived] + *(void *)(v9 + 112),  (char *)objc_msgSend(v6, "countOfBytesExpectedToReceive") + *(void *)(v9 + 112));
    }
    dispatch_semaphore_t v24 = dispatch_semaphore_create(0LL);
    id Property = objc_getProperty((id)v9, v25, 96LL, 1);
    v28 = Property;
    if (Property) {
      id Property = objc_getProperty(Property, v27, 64LL, 1);
    }
    id v29 = Property;

    v40[0] = _NSConcreteStackBlock;
    v40[1] = 3221225472LL;
    v40[2] = sub_1002BAC7C;
    v40[3] = &unk_1003F1258;
    id v30 = v6;
    id v41 = v30;
    id v31 = (id)v9;
    id v42 = v31;
    v32 = v24;
    v43 = v32;
    [v29 consumeData:v7 withCompletionHandler:v40];
    dispatch_time_t v33 = dispatch_time(0LL, 300000000000LL);
    if (dispatch_semaphore_wait(v32, v33))
    {
      uint64_t v34 = ASDErrorWithDescription( @"AssetErrorDomain",  9LL,  @"Data consumer failed to process data within allotted time");
      v35 = (void *)objc_claimAutoreleasedReturnValue(v34);
      objc_setProperty_atomic(v31, v36, v35, 40LL);

      [v30 cancel];
    }
  }

  else
  {
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      id v45 = v6;
      _os_log_error_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_ERROR,  "Untracked task: %{public}@ canceling after receiving data",  buf,  0xCu);
    }

    [v6 cancel];
  }
}

- (void)URLSession:(id)a3 dataTask:(id)a4 didReceiveResponse:(id)a5 completionHandler:(id)a6
{
  id v9 = a4;
  id v10 = a5;
  id v11 = a6;
  uint64_t v13 = sub_1001FF33C((uint64_t)v10, v12);
  id v14 = sub_1001BAC70((uint64_t)&OBJC_CLASS___AssetTaskInfo, v9);
  uint64_t v15 = objc_claimAutoreleasedReturnValue(v14);
  uint64_t v16 = ASDLogHandleForCategory(10LL);
  v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);
  id v18 = v17;
  if (v15)
  {
    os_signpost_id_t v19 = *(void *)(v15 + 128);
    if (v19 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v17))
    {
      id v21 = objc_getProperty((id)v15, v20, 56LL, 1);
      *(_DWORD *)buf = 138543618;
      id v126 = v21;
      __int16 v127 = 2050;
      uint64_t v128 = v13;
      _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v18,  OS_SIGNPOST_INTERVAL_BEGIN,  v19,  "Download/Transfer",  " uuid=%{public, signpost.description:attribute}@  status=%{public, signpost.description:attribute}ld ",  buf,  0x16u);
    }

    uint64_t v22 = ASDLogHandleForCategory(10LL);
    v23 = (os_log_s *)objc_claimAutoreleasedReturnValue(v22);
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      id v25 = objc_getProperty((id)v15, v24, 56LL, 1);
      *(_DWORD *)buf = 138412546;
      id v126 = v25;
      __int16 v127 = 2114;
      uint64_t v128 = (uint64_t)v10;
      _os_log_impl( (void *)&_mh_execute_header,  v23,  OS_LOG_TYPE_DEFAULT,  "[%@] Received response: %{public}@",  buf,  0x16u);
    }

    id v27 = objc_getProperty((id)v15, v26, 56LL, 1);
    v28 = (void *)objc_claimAutoreleasedReturnValue( +[KeepAlive keepAliveWithFormat:]( KeepAlive,  "keepAliveWithFormat:",  @"com.apple.appstored.AssetTask:%@-%lu",  v27,  [v9 taskIdentifier]));
    objc_setProperty_atomic((id)v15, v29, v28, 48LL);

    id v31 = sub_10020F15C(v10, v30);
    v32 = (void *)objc_claimAutoreleasedReturnValue(v31);
    dispatch_time_t v33 = v32;
    if (v32 && [v32 length])
    {
      uint64_t v34 = ASDLogHandleForCategory(10LL);
      v35 = (os_log_s *)objc_claimAutoreleasedReturnValue(v34);
      if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
      {
        id v37 = objc_getProperty((id)v15, v36, 56LL, 1);
        *(_DWORD *)buf = 138412802;
        id v126 = v37;
        __int16 v127 = 2114;
        uint64_t v128 = (uint64_t)v9;
        __int16 v129 = 2114;
        uint64_t v130 = (uint64_t)v33;
        _os_log_impl( (void *)&_mh_execute_header,  v35,  OS_LOG_TYPE_DEFAULT,  "[%@] Task: %{public}@ CDNUUID: %{public}@",  buf,  0x20u);
      }
    }

    v38 = (void *)objc_claimAutoreleasedReturnValue([v9 _incompleteTaskMetrics]);
    objc_setProperty_atomic((id)v15, v39, v38, 64LL);

    if (v13 > 399)
    {
      switch(v13)
      {
        case 416LL:
          uint64_t v70 = ASDLogHandleForCategory(31LL);
          v71 = (os_log_s *)objc_claimAutoreleasedReturnValue(v70);
          v72 = v71;
          os_signpost_id_t v73 = *(void *)(v15 + 128);
          if (v73 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v71))
          {
            id v75 = objc_getProperty((id)v15, v74, 56LL, 1);
            *(_DWORD *)buf = 138543618;
            id v126 = v75;
            __int16 v127 = 2050;
            uint64_t v128 = 416LL;
            _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v72,  OS_SIGNPOST_EVENT,  v73,  "RequestRange",  " uuid=%{public, signpost.description:attribute}@  status=%{public, signpost.description:attribute}ld ",  buf,  0x16u);
          }

          if ((*(_BYTE *)(v15 + 9) & 1) != 0
            || (id v77 = objc_getProperty((id)v15, v76, 56LL, 1),
                v78 = (void *)objc_claimAutoreleasedReturnValue([v77 description]),
                unsigned int v79 = [v78 hasPrefix:@"SYS"],
                v78,
                v77,
                !v79))
          {
            uint64_t v103 = ASDLogHandleForCategory(10LL);
            v104 = (os_log_s *)objc_claimAutoreleasedReturnValue(v103);
            if (os_log_type_enabled(v104, OS_LOG_TYPE_ERROR))
            {
              id v115 = objc_getProperty((id)v15, v105, 56LL, 1);
              *(_DWORD *)buf = 138412802;
              id v126 = v115;
              __int16 v127 = 2114;
              uint64_t v128 = (uint64_t)v9;
              __int16 v129 = 2048;
              uint64_t v130 = 416LL;
              _os_log_error_impl( (void *)&_mh_execute_header,  v104,  OS_LOG_TYPE_ERROR,  "[%@] Truncate and restart task: %{public}@ after receiving status code: %ld",  buf,  0x20u);
            }

            id Property = objc_getProperty((id)v15, v106, 96LL, 1);
            v109 = Property;
            if (Property) {
              id Property = objc_getProperty(Property, v108, 64LL, 1);
            }
            id v110 = Property;

            v116[0] = _NSConcreteStackBlock;
            v116[1] = 3221225472LL;
            v116[2] = sub_1002BC434;
            v116[3] = &unk_1003F12F8;
            v116[4] = self;
            id v117 = (id)v15;
            id v118 = v9;
            id v119 = v11;
            [v110 truncateWithCompletionHandler:v116];

            goto LABEL_63;
          }

          *(_BYTE *)(v15 + 9) = 1;
          *(void *)(v15 + 16) = 1LL;
          break;
        case 408LL:
          uint64_t v80 = ASDLogHandleForCategory(31LL);
          v81 = (os_log_s *)objc_claimAutoreleasedReturnValue(v80);
          v82 = v81;
          os_signpost_id_t v83 = *(void *)(v15 + 128);
          if (v83 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v81))
          {
            id v85 = objc_getProperty((id)v15, v84, 56LL, 1);
            *(_DWORD *)buf = 138543618;
            id v126 = v85;
            __int16 v127 = 2050;
            uint64_t v128 = 408LL;
            _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v82,  OS_SIGNPOST_EVENT,  v83,  "RequestTimeout",  " uuid=%{public, signpost.description:attribute}@  status=%{public, signpost.description:attribute}ld ",  buf,  0x16u);
          }

          uint64_t v86 = ASDLogHandleForCategory(10LL);
          v87 = (os_log_s *)objc_claimAutoreleasedReturnValue(v86);
          if (os_log_type_enabled(v87, OS_LOG_TYPE_ERROR))
          {
            id v113 = objc_getProperty((id)v15, v88, 56LL, 1);
            *(_DWORD *)buf = 138412802;
            id v126 = v113;
            __int16 v127 = 2114;
            uint64_t v128 = (uint64_t)v9;
            __int16 v129 = 2048;
            uint64_t v130 = 408LL;
            _os_log_error_impl( (void *)&_mh_execute_header,  v87,  OS_LOG_TYPE_ERROR,  "[%@] Restarting task: %{public}@ after receiving status code: %ld",  buf,  0x20u);
          }

          *(void *)(v15 + 16) = 1LL;
          break;
        case 403LL:
          uint64_t v57 = ASDLogHandleForCategory(31LL);
          v58 = (os_log_s *)objc_claimAutoreleasedReturnValue(v57);
          v59 = v58;
          os_signpost_id_t v60 = *(void *)(v15 + 128);
          if (v60 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v58))
          {
            id v62 = objc_getProperty((id)v15, v61, 56LL, 1);
            *(_DWORD *)buf = 138543618;
            id v126 = v62;
            __int16 v127 = 2050;
            uint64_t v128 = 403LL;
            _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v59,  OS_SIGNPOST_EVENT,  v60,  "RequestExpired",  " uuid=%{public, signpost.description:attribute}@  status=%{public, signpost.description:attribute}ld ",  buf,  0x16u);
          }

          uint64_t v63 = ASDLogHandleForCategory(10LL);
          v64 = (os_log_s *)objc_claimAutoreleasedReturnValue(v63);
          if (os_log_type_enabled(v64, OS_LOG_TYPE_ERROR))
          {
            id v112 = objc_getProperty((id)v15, v65, 56LL, 1);
            *(_DWORD *)buf = 138412802;
            id v126 = v112;
            __int16 v127 = 2114;
            uint64_t v128 = (uint64_t)v9;
            __int16 v129 = 2048;
            uint64_t v130 = 403LL;
            _os_log_error_impl( (void *)&_mh_execute_header,  v64,  OS_LOG_TYPE_ERROR,  "[%@] Canceling task: %{public}@ after receiving status code: %ld",  buf,  0x20u);
          }

          uint64_t v66 = ASDErrorWithDescription(@"AssetErrorDomain", 6LL, @"Asset URL has expired");
          v67 = (void *)objc_claimAutoreleasedReturnValue(v66);
          objc_setProperty_atomic((id)v15, v68, v67, 40LL);

          break;
        default:
          uint64_t v89 = ASDLogHandleForCategory(31LL);
          v90 = (os_log_s *)objc_claimAutoreleasedReturnValue(v89);
          v91 = v90;
          os_signpost_id_t v92 = *(void *)(v15 + 128);
          if (v92 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v90))
          {
            id v94 = objc_getProperty((id)v15, v93, 56LL, 1);
            *(_DWORD *)buf = 138543618;
            id v126 = v94;
            __int16 v127 = 2050;
            uint64_t v128 = v13;
            _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v91,  OS_SIGNPOST_EVENT,  v92,  "RequestStatus",  " uuid=%{public, signpost.description:attribute}@  status=%{public, signpost.description:attribute}ld ",  buf,  0x16u);
          }

          uint64_t v95 = ASDLogHandleForCategory(10LL);
          v96 = (os_log_s *)objc_claimAutoreleasedReturnValue(v95);
          if (os_log_type_enabled(v96, OS_LOG_TYPE_ERROR))
          {
            id v114 = objc_getProperty((id)v15, v97, 56LL, 1);
            *(_DWORD *)buf = 138412802;
            id v126 = v114;
            __int16 v127 = 2114;
            uint64_t v128 = (uint64_t)v9;
            __int16 v129 = 2048;
            uint64_t v130 = v13;
            _os_log_error_impl( (void *)&_mh_execute_header,  v96,  OS_LOG_TYPE_ERROR,  "[%@] Canceling task: %{public}@ after receiving invalid status code: %ld",  buf,  0x20u);
          }

          v98 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"AssetErrorDomain",  v13 + 1000,  0LL));
          uint64_t v100 = ASDErrorWithUnderlyingErrorAndDescription(v98, @"AssetErrorDomain", 7LL, v99);
          v101 = (void *)objc_claimAutoreleasedReturnValue(v100);
          objc_setProperty_atomic((id)v15, v102, v101, 40LL);

          (*((void (**)(id, void))v11 + 2))(v11, 0LL);
          goto LABEL_63;
      }

      (*((void (**)(id, void))v11 + 2))(v11, 0LL);
    }

    else
    {
      v40 = (void *)objc_claimAutoreleasedReturnValue([v9 currentRequest]);
      id v41 = sub_100273BF0(v40);

      if (!v41 || v13 == 206)
      {
        id WeakRetained = objc_loadWeakRetained((id *)(v15 + 88));
        id v56 = (id)objc_claimAutoreleasedReturnValue([WeakRetained progress]);

        if (v56) {
          (*((void (**)(id, void, void, char *))v56 + 2))( v56,  0,  *(void *)(v15 + 112),  (char *)[v9 countOfBytesExpectedToReceive] + *(void *)(v15 + 112));
        }
        (*((void (**)(id, uint64_t))v11 + 2))(v11, 1LL);
      }

      else
      {
        uint64_t v42 = ASDLogHandleForCategory(31LL);
        v43 = (os_log_s *)objc_claimAutoreleasedReturnValue(v42);
        v44 = v43;
        os_signpost_id_t v45 = *(void *)(v15 + 128);
        if (v45 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v43))
        {
          id v47 = objc_getProperty((id)v15, v46, 56LL, 1);
          *(_DWORD *)buf = 138543618;
          id v126 = v47;
          __int16 v127 = 2050;
          uint64_t v128 = v13;
          _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v44,  OS_SIGNPOST_EVENT,  v45,  "ConsumerReset",  " uuid=%{public, signpost.description:attribute}@  status=%{public, signpost.description:attribute}ld ",  buf,  0x16u);
        }

        uint64_t v48 = ASDLogHandleForCategory(10LL);
        v49 = (os_log_s *)objc_claimAutoreleasedReturnValue(v48);
        if (os_log_type_enabled(v49, OS_LOG_TYPE_ERROR))
        {
          id v111 = objc_getProperty((id)v15, v50, 56LL, 1);
          *(_DWORD *)buf = 138412802;
          id v126 = v111;
          __int16 v127 = 2114;
          uint64_t v128 = (uint64_t)v9;
          __int16 v129 = 2048;
          uint64_t v130 = v13;
          _os_log_error_impl( (void *)&_mh_execute_header,  v49,  OS_LOG_TYPE_ERROR,  "[%@] Resetting data consumer for task: %{public}@ after receiving status code: %ld",  buf,  0x20u);
        }

        id v52 = objc_getProperty((id)v15, v51, 96LL, 1);
        v54 = v52;
        if (v52) {
          id v52 = objc_getProperty(v52, v53, 64LL, 1);
        }
        id v55 = v52;

        v120[0] = _NSConcreteStackBlock;
        v120[1] = 3221225472LL;
        v120[2] = sub_1002BBC94;
        v120[3] = &unk_1003F12D0;
        v120[4] = self;
        id v121 = v55;
        id v122 = (id)v15;
        id v123 = v9;
        id v124 = v11;
        id v56 = v55;
        [v56 truncateWithCompletionHandler:v120];
      }
    }

- (void)URLSession:(id)a3 _willRetryBackgroundDataTask:(id)a4 withError:(id)a5
{
  id v6 = a4;
  id v7 = a5;
  id v8 = sub_1001BAC70((uint64_t)&OBJC_CLASS___AssetTaskInfo, v6);
  uint64_t v9 = objc_claimAutoreleasedReturnValue(v8);
  uint64_t v10 = v9;
  if (v9)
  {
    char v11 = *(_BYTE *)(v9 + 9);
    uint64_t v12 = ASDLogHandleForCategory(10LL);
    uint64_t v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
    BOOL v14 = os_log_type_enabled(v13, OS_LOG_TYPE_ERROR);
    if ((v11 & 1) != 0)
    {
      if (v14)
      {
        id v36 = objc_getProperty((id)v10, v15, 56LL, 1);
        int v37 = 138412802;
        id v38 = v36;
        __int16 v39 = 2114;
        id v40 = v6;
        __int16 v41 = 2114;
        id v42 = v7;
        _os_log_error_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_ERROR,  "[%@] Retry scheduled for task: %{public}@ error: %{public}@",  (uint8_t *)&v37,  0x20u);
      }

      uint64_t v28 = ASDLogHandleForCategory(31LL);
      SEL v29 = (os_log_s *)objc_claimAutoreleasedReturnValue(v28);
      id v25 = v29;
      os_signpost_id_t v30 = *(void *)(v10 + 128);
      if (v30 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v29))
      {
        id v32 = objc_getProperty((id)v10, v31, 56LL, 1);
        id v33 = sub_100298F48(v7);
        uint64_t v34 = (void *)objc_claimAutoreleasedReturnValue(v33);
        int v37 = 138543618;
        id v38 = v32;
        __int16 v39 = 2114;
        id v40 = v34;
        _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v25,  OS_SIGNPOST_EVENT,  v30,  "WillRetry",  " uuid=%{public, signpost.description:attribute}@  error=%{public, signpost.description:attribute}@ ",  (uint8_t *)&v37,  0x16u);
      }
    }

    else
    {
      if (v14)
      {
        id v35 = objc_getProperty((id)v10, v15, 56LL, 1);
        int v37 = 138412802;
        id v38 = v35;
        __int16 v39 = 2114;
        id v40 = v6;
        __int16 v41 = 2114;
        id v42 = v7;
        _os_log_error_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_ERROR,  "[%@] Canceling task: %{public}@ after cache request failed with error: %{public}@",  (uint8_t *)&v37,  0x20u);
      }

      uint64_t v16 = ASDLogHandleForCategory(31LL);
      v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);
      id v18 = v17;
      os_signpost_id_t v19 = *(void *)(v10 + 128);
      if (v19 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v17))
      {
        id v21 = objc_getProperty((id)v10, v20, 56LL, 1);
        id v22 = sub_100298F48(v7);
        v23 = (void *)objc_claimAutoreleasedReturnValue(v22);
        int v37 = 138543618;
        id v38 = v21;
        __int16 v39 = 2114;
        id v40 = v23;
        _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v18,  OS_SIGNPOST_EVENT,  v19,  "CacheFail",  " uuid=%{public, signpost.description:attribute}@  error=%{public, signpost.description:attribute}@ ",  (uint8_t *)&v37,  0x16u);
      }

      *(void *)(v10 + 16) = 1LL;
      *(_BYTE *)(v10 + 9) = 1;
      id v25 = (os_log_s *)objc_getProperty((id)v10, v24, 136LL, 1);
      -[os_log_s cancel](v25, "cancel");
    }
  }

  else
  {
    uint64_t v26 = ASDLogHandleForCategory(10LL);
    id v27 = (os_log_s *)objc_claimAutoreleasedReturnValue(v26);
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
    {
      int v37 = 138543362;
      id v38 = v6;
      _os_log_error_impl( (void *)&_mh_execute_header,  v27,  OS_LOG_TYPE_ERROR,  "Untracked task: %{public}@ canceling after will retry",  (uint8_t *)&v37,  0xCu);
    }

    [v6 cancel];
  }
}

- (void)URLSession:(id)a3 task:(id)a4 didCompleteWithError:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  id v9 = sub_1001BAC70((uint64_t)&OBJC_CLASS___AssetTaskInfo, v7);
  uint64_t v10 = objc_claimAutoreleasedReturnValue(v9);
  uint64_t v11 = ASDLogHandleForCategory(10LL);
  uint64_t v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
  uint64_t v13 = v12;
  if (v10)
  {
    os_signpost_id_t v14 = *(void *)(v10 + 128);
    if (v14 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v12))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v13,  OS_SIGNPOST_INTERVAL_END,  v14,  "Download/Transfer",  "",  buf,  2u);
    }

    uint64_t v15 = ASDLogHandleForCategory(10LL);
    uint64_t v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(v15);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      id v18 = objc_getProperty((id)v10, v17, 56LL, 1);
      *(_DWORD *)buf = 138412546;
      *(void *)&uint8_t buf[4] = v18;
      *(_WORD *)&buf[12] = 2114;
      *(void *)&buf[14] = v7;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "[%@] Completed task: %{public}@", buf, 0x16u);
    }

    if (!v8 || *(void *)(v10 + 16)) {
      goto LABEL_24;
    }
    double v20 = (void *)objc_claimAutoreleasedReturnValue([v8 userInfo]);
    id v21 = (void *)objc_claimAutoreleasedReturnValue([v20 objectForKeyedSubscript:NSURLErrorBackgroundTaskCancelledReasonKey]);

    if ((objc_opt_respondsToSelector(v21, "integerValue") & 1) != 0 && [v21 integerValue] == (id)2)
    {
      uint64_t v23 = ASDLogHandleForCategory(10LL);
      SEL v24 = (os_log_s *)objc_claimAutoreleasedReturnValue(v23);
      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
      {
        id v88 = objc_getProperty((id)v10, v25, 56LL, 1);
        *(_DWORD *)buf = 138412546;
        *(void *)&uint8_t buf[4] = v88;
        *(_WORD *)&buf[12] = 2114;
        *(void *)&buf[14] = v8;
        _os_log_error_impl( (void *)&_mh_execute_header,  v24,  OS_LOG_TYPE_ERROR,  "[%@] Restarting request after task cancelled due to insufficient system resources: %{public}@",  buf,  0x16u);
      }
    }

    else
    {
      if ((*(_BYTE *)(v10 + 9) & 1) != 0)
      {
LABEL_21:
        id v29 = objc_getProperty((id)v10, v22, 40LL, 1);

        if (!v29)
        {
          uint64_t v30 = ASDErrorWithSafeUserInfo(v8);
          id v31 = (void *)objc_claimAutoreleasedReturnValue(v30);
          objc_setProperty_atomic((id)v10, v32, v31, 40LL);
        }

        sub_1002BD480((uint64_t)self, 3LL, (void *)v10);

LABEL_24:
        id v33 = objc_getProperty((id)v10, v19, 40LL, 1);
        uint64_t v34 = (id *)(id)v10;
        id v35 = v33;
        id v36 = (void *)&unk_10038A000;
        if (self)
        {
          id v37 = sub_1002EB2A0((uint64_t)&OBJC_CLASS___Device);
          id v38 = (void *)objc_claimAutoreleasedReturnValue(v37);
          unsigned __int8 v39 = [v38 isHRNMode];

          if ((v39 & 1) == 0)
          {
            id v40 = objc_alloc(&OBJC_CLASS___AMSMetricsLoadURLContext);
            id v42 = objc_getProperty(v34, v41, 136LL, 1);
            id v44 = objc_getProperty(v34, v43, 64LL, 1);
            id v45 = [v40 initWithTask:v42 metrics:v44];

            id v36 = &unk_10038A000;
            id v46 = sub_100255630((uint64_t)&OBJC_CLASS___URLBag);
            id v47 = (void *)objc_claimAutoreleasedReturnValue(v46);
            [v45 setBag:v47];

            [v45 setError:v35];
            id WeakRetained = objc_loadWeakRetained(v34 + 15);
            [v45 setSession:WeakRetained];

            v49 = (void *)objc_claimAutoreleasedReturnValue( +[AMSMetricsLoadURLEvent shouldCollectMetricsPromiseForContext:]( &OBJC_CLASS___AMSMetricsLoadURLEvent,  "shouldCollectMetricsPromiseForContext:",  v45));
            *(void *)buf = _NSConcreteStackBlock;
            *(void *)&buf[8] = 3221225472LL;
            *(void *)&buf[16] = sub_1002BE66C;
            uint64_t v95 = &unk_1003F1348;
            v96 = v34;
            id v97 = v45;
            id v50 = v45;
            [v49 resultWithCompletion:buf];
          }
        }

        id Property = objc_getProperty(v34, v51, 96LL, 1);
        v54 = Property;
        if (Property) {
          id Property = objc_getProperty(Property, v53, 64LL, 1);
        }
        uint64_t v13 = (os_log_s *)Property;

        if (v8 && *(void *)(v10 + 16) != 2LL)
        {
          sub_1002BD480((uint64_t)self, 4LL, v34);
          v90[0] = _NSConcreteStackBlock;
          v90[1] = v36[185];
          v90[2] = sub_1002BDAA4;
          v90[3] = &unk_1003E9B18;
          v90[4] = self;
          id v75 = (id *)&v91;
          v91 = v34;
          -[os_log_s suspendWithCompletionHandler:](v13, "suspendWithCompletionHandler:", v90);
        }

        else
        {
          sub_1002BD480((uint64_t)self, 2LL, v34);
          id v55 = v34;
          id v57 = v8;
          if (self)
          {
            v58 = objc_getProperty(v55, v56, 96LL, 1);
            v59 = v58;
            if (v58 && v58[3])
            {
              id v89 = v7;
              os_signpost_id_t v60 = objc_opt_new(&OBJC_CLASS___NSMutableDictionary);
              v61 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", v59[3]));
              -[NSMutableDictionary setObject:forKeyedSubscript:]( v60,  "setObject:forKeyedSubscript:",  v61,  @"downloadSource");

              id v62 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithInteger:]( &OBJC_CLASS___NSNumber,  "numberWithInteger:",  vcvtpd_s64_f64((double)(unint64_t)v59[11] / 1000.0)));
              -[NSMutableDictionary setObject:forKeyedSubscript:]( v60,  "setObject:forKeyedSubscript:",  v62,  @"expectedContentLength");

              uint64_t v63 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithInteger:]( &OBJC_CLASS___NSNumber,  "numberWithInteger:",  vcvtpd_s64_f64((double)(unint64_t)v55[3] / 1000.0)));
              -[NSMutableDictionary setObject:forKeyedSubscript:]( v60,  "setObject:forKeyedSubscript:",  v63,  @"receivedContentLength");

              v64 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithInteger:]( &OBJC_CLASS___NSNumber,  "numberWithInteger:",  vcvtpd_s64_f64((double)(unint64_t)v55[14] / 1000.0)));
              -[NSMutableDictionary setObject:forKeyedSubscript:]( v60,  "setObject:forKeyedSubscript:",  v64,  @"resumptionOffset");

              v65 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithInteger:]( &OBJC_CLASS___NSNumber,  "numberWithInteger:",  vcvtpd_s64_f64((double)(unint64_t)v59[20] / 1000.0)));
              -[NSMutableDictionary setObject:forKeyedSubscript:]( v60,  "setObject:forKeyedSubscript:",  v65,  @"contentRange");

              uint64_t v66 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", (_BYTE)v55[1] & 1));
              -[NSMutableDictionary setObject:forKeyedSubscript:]( v60,  "setObject:forKeyedSubscript:",  v66,  @"cacheServerLocated");

              v67 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithBool:]( &OBJC_CLASS___NSNumber,  "numberWithBool:",  *((_BYTE *)v55 + 9) & 1));
              -[NSMutableDictionary setObject:forKeyedSubscript:]( v60,  "setObject:forKeyedSubscript:",  v67,  @"cacheServerIgnored");

              if (v8) {
                SEL v68 = &__kCFBooleanFalse;
              }
              else {
                SEL v68 = &__kCFBooleanTrue;
              }
              -[NSMutableDictionary setObject:forKeyedSubscript:]( v60,  "setObject:forKeyedSubscript:",  v68,  @"success");
              if (v8)
              {
                id v69 = sub_100298CBC(v57);
                uint64_t v70 = (void *)objc_claimAutoreleasedReturnValue(v69);
                -[NSMutableDictionary setObject:forKeyedSubscript:]( v60,  "setObject:forKeyedSubscript:",  v70,  @"error");
              }

              sub_10030F080((uint64_t)&OBJC_CLASS___Analytics, v60, 31LL);

              id v7 = v89;
            }
          }

          id v72 = objc_getProperty(v55, v71, 56LL, 1);
          id v74 = objc_getProperty(v55, v73, 64LL, 1);
          +[QALogger linearDownloadWithLogKey:metrics:throughputMin:throughputMax:]( &OBJC_CLASS____TtC9appstored8QALogger,  "linearDownloadWithLogKey:metrics:throughputMin:throughputMax:",  v72,  v74,  *((double *)v55 + 19),  *((double *)v55 + 18));

          v92[0] = _NSConcreteStackBlock;
          v92[1] = 3221225472LL;
          v92[2] = sub_1002BD500;
          v92[3] = &unk_1003E9B18;
          v92[4] = self;
          id v75 = (id *)&v93;
          v93 = v55;
          -[os_log_s finishWithCompletionHandler:](v13, "finishWithCompletionHandler:", v92);
        }

        sessions = self->_sessions;
        id v78 = objc_getProperty(v34, v77, 32LL, 1);
        unsigned int v79 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](sessions, "objectForKeyedSubscript:", v78));
        uint64_t v80 = sub_1002B4F5C(v79);

        uint64_t v81 = ASDLogHandleForCategory(10LL);
        v82 = (os_log_s *)objc_claimAutoreleasedReturnValue(v81);
        if (os_log_type_enabled(v82, OS_LOG_TYPE_DEBUG))
        {
          id v84 = objc_getProperty(v34, v83, 56LL, 1);
          id v86 = objc_getProperty(v34, v85, 32LL, 1);
          *(_DWORD *)buf = 138412802;
          *(void *)&uint8_t buf[4] = v84;
          *(_WORD *)&buf[12] = 2114;
          *(void *)&buf[14] = v86;
          *(_WORD *)&buf[22] = 2048;
          uint64_t v95 = (void *)v80;
          _os_log_debug_impl( (void *)&_mh_execute_header,  v82,  OS_LOG_TYPE_DEBUG,  "[%@] Ended active task in session: %{public}@, now %llu active tasks.",  buf,  0x20u);
        }

        goto LABEL_46;
      }

      uint64_t v26 = ASDLogHandleForCategory(10LL);
      id v27 = (os_log_s *)objc_claimAutoreleasedReturnValue(v26);
      if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
      {
        id v87 = objc_getProperty((id)v10, v28, 56LL, 1);
        *(_DWORD *)buf = 138412546;
        *(void *)&uint8_t buf[4] = v87;
        *(_WORD *)&buf[12] = 2114;
        *(void *)&buf[14] = v8;
        _os_log_error_impl( (void *)&_mh_execute_header,  v27,  OS_LOG_TYPE_ERROR,  "[%@] Encountered failure while using local cache, restarting using original request: %{public}@",  buf,  0x16u);
      }

      *(_BYTE *)(v10 + 9) = 1;
    }

    *(void *)(v10 + 16) = 1LL;
    goto LABEL_21;
  }

  if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138543618;
    *(void *)&uint8_t buf[4] = v7;
    *(_WORD *)&buf[12] = 2114;
    *(void *)&buf[14] = v8;
    _os_log_error_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_ERROR,  "Untracked task: %{public}@ completed with error: %{public}@",  buf,  0x16u);
  }

- (void)URLSession:(id)a3 task:(id)a4 didFinishCollectingMetrics:(id)a5
{
  id v6 = a4;
  id v7 = a5;
  id v8 = sub_1001BAC70((uint64_t)&OBJC_CLASS___AssetTaskInfo, v6);
  id v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
  uint64_t v10 = ASDLogHandleForCategory(10LL);
  uint64_t v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
  BOOL v12 = os_log_type_enabled(v11, OS_LOG_TYPE_INFO);
  if (v9)
  {
    if (v12)
    {
      id v14 = objc_getProperty(v9, v13, 56LL, 1);
      *(_DWORD *)buf = 138412802;
      id v38 = v14;
      __int16 v39 = 2114;
      unint64_t v40 = (unint64_t)v6;
      __int16 v41 = 2114;
      id v42 = v7;
      _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_INFO,  "[%@] Collected metrics for task: %{public}@ metrics: %{public}@",  buf,  0x20u);
    }

    id v31 = v6;

    __int128 v34 = 0u;
    __int128 v35 = 0u;
    __int128 v32 = 0u;
    __int128 v33 = 0u;
    id newValue = v7;
    uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue([v7 transactionMetrics]);
    id v16 = [v15 countByEnumeratingWithState:&v32 objects:v36 count:16];
    if (v16)
    {
      id v17 = v16;
      uint64_t v18 = *(void *)v33;
      do
      {
        for (i = 0LL; i != v17; i = (char *)i + 1)
        {
          if (*(void *)v33 != v18) {
            objc_enumerationMutation(v15);
          }
          double v20 = *(void **)(*((void *)&v32 + 1) + 8LL * (void)i);
          id v21 = sub_100294DF4(v20);
          id v22 = (void *)objc_claimAutoreleasedReturnValue(v21);
          if (v22)
          {
            uint64_t v23 = ASDLogHandleForCategory(10LL);
            SEL v24 = (os_log_s *)objc_claimAutoreleasedReturnValue(v23);
            if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
            {
              id v26 = objc_getProperty(v9, v25, 56LL, 1);
              double v27 = (double)(8 * (uint64_t)[v20 countOfResponseBodyBytesReceived]);
              [v22 duration];
              *(_DWORD *)buf = 138412546;
              id v38 = v26;
              __int16 v39 = 2048;
              unint64_t v40 = (unint64_t)(v27 / v28);
              _os_log_impl( (void *)&_mh_execute_header,  v24,  OS_LOG_TYPE_DEFAULT,  "[%@] Response body received speed: %{bitrate}llu",  buf,  0x16u);
            }
          }
        }

        id v17 = [v15 countByEnumeratingWithState:&v32 objects:v36 count:16];
      }

      while (v17);
    }

    id v7 = newValue;
    objc_setProperty_atomic(v9, v29, newValue, 64LL);
    id v6 = v31;
  }

  else
  {
    if (v12)
    {
      *(_DWORD *)buf = 138543362;
      id v38 = v6;
      _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_INFO,  "Untracked task: %{public}@ did finish collecting metrics",  buf,  0xCu);
    }
  }
}

- (void)URLSession:(id)a3 task:(id)a4 _alternatePathAvailable:(int)a5
{
  id v6 = a4;
  id v7 = sub_1001BAC70((uint64_t)&OBJC_CLASS___AssetTaskInfo, v6);
  id v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  if (v8)
  {
    uint64_t v9 = ASDLogHandleForCategory(10LL);
    uint64_t v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      id v12 = objc_getProperty(v8, v11, 56LL, 1);
      int v30 = 138412802;
      id v31 = v12;
      __int16 v32 = 2114;
      id v33 = v6;
      __int16 v34 = 1024;
      int v35 = a5;
      _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_INFO,  "[%@] Task: %{public}@ has alternate path available: %u",  (uint8_t *)&v30,  0x1Cu);
    }

    if (a5 == 3
      && (id v14 = objc_getProperty(v8, v13, 96LL, 1)) != 0LL
      && (char v15 = v14[9], v14, (v15 & 1) != 0))
    {
      uint64_t v19 = ASDLogHandleForCategory(10LL);
      double v20 = (os_log_s *)objc_claimAutoreleasedReturnValue(v19);
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        id v22 = objc_getProperty(v8, v21, 56LL, 1);
        int v30 = 138412546;
        id v31 = v22;
        __int16 v32 = 2114;
        id v33 = v6;
        _os_log_impl( (void *)&_mh_execute_header,  v20,  OS_LOG_TYPE_DEFAULT,  "[%@] Task: %{public}@ restarting to take advantage of alternate path",  (uint8_t *)&v30,  0x16u);
      }

      v8[2] = 1LL;
      objc_setProperty_atomic(v8, v23, 0LL, 40LL);
      [v6 cancel];
    }

    else
    {
      uint64_t v16 = ASDLogHandleForCategory(10LL);
      id v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
      {
        BOOL v24 = a5 == 3;
        id v25 = objc_getProperty(v8, v18, 56LL, 1);
        id v27 = objc_getProperty(v8, v26, 96LL, 1);
        double v28 = v27;
        if (v27) {
          int v29 = *((_BYTE *)v27 + 9) & 1;
        }
        else {
          int v29 = 0;
        }
        int v30 = 138413058;
        id v31 = v25;
        __int16 v32 = 2114;
        id v33 = v6;
        __int16 v34 = 1024;
        int v35 = v24;
        __int16 v36 = 1024;
        int v37 = v29;
        _os_log_debug_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_DEBUG,  "[%@] Task: %{public}@ has alternate path but we are ignorning it: recommended = %{BOOL}d, allow cellular = %{BOOL}d",  (uint8_t *)&v30,  0x22u);
      }
    }
  }
}

- (void)URLSession:(id)a3 task:(id)a4 _willSendRequestForEstablishedConnection:(id)a5 completionHandler:(id)a6
{
  id v8 = a4;
  id v9 = a5;
  uint64_t v10 = (void (**)(id, void))a6;
  id v11 = sub_1001BAC70((uint64_t)&OBJC_CLASS___AssetTaskInfo, v8);
  id v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
  if (v12)
  {
    uint64_t v13 = ASDLogHandleForCategory(31LL);
    id v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
    char v15 = v14;
    os_signpost_id_t v16 = v12[16];
    if (v16 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v14))
    {
      id v18 = objc_getProperty(v12, v17, 56LL, 1);
      int v25 = 138543362;
      id v26 = v18;
      _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v15,  OS_SIGNPOST_EVENT,  v16,  "TaskConnecting",  " uuid=%{public, signpost.description:attribute}@ ",  (uint8_t *)&v25,  0xCu);
    }

    uint64_t v19 = ASDLogHandleForCategory(10LL);
    double v20 = (os_log_s *)objc_claimAutoreleasedReturnValue(v19);
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      id v22 = objc_getProperty(v12, v21, 56LL, 1);
      int v25 = 138412546;
      id v26 = v22;
      __int16 v27 = 2114;
      id v28 = v8;
      _os_log_impl( (void *)&_mh_execute_header,  v20,  OS_LOG_TYPE_DEFAULT,  "[%@] Task: %{public}@ will send request",  (uint8_t *)&v25,  0x16u);
    }

    id v23 = v9;
  }

  else
  {
    uint64_t v24 = ASDLogHandleForCategory(10LL);
    double v20 = (os_log_s *)objc_claimAutoreleasedReturnValue(v24);
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      int v25 = 138543362;
      id v26 = v8;
      _os_log_error_impl( (void *)&_mh_execute_header,  v20,  OS_LOG_TYPE_ERROR,  "Untracked task: %{public}@ canceling after established connection",  (uint8_t *)&v25,  0xCu);
    }

    id v23 = 0LL;
  }

  ((void (**)(id, id))v10)[2](v10, v23);
}

- (void).cxx_destruct
{
}

@end