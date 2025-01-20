@interface AFAnalyzer
+ (id)analyzer;
- (double)_measureTimeToLoadURL:(id)a3 withMethod:(id)a4;
- (id)_addressToPingForHost:(id)a3;
- (id)_resultForCommand:(const char *)a3;
- (void)_getDefaultGateway:(id *)a3 iface:(id *)a4;
- (void)_handleMessage:(id)a3;
- (void)_logAnalysisForURL:(id)a3 failedIFaceIndex:(id)a4 sendBufferSize:(id)a5 isUserFailure:(BOOL)a6 isWWANPreferred:(BOOL)a7 isRetrySuccess:(BOOL)a8;
- (void)_pingHost:(id)a3 time:(double *)a4 sentPackets:(int64_t *)a5 droppedPackets:(int64_t *)a6;
- (void)_startAnalysisWithMessage:(id)a3;
- (void)runAnalysis;
- (void)runAnalyzerService;
@end

@implementation AFAnalyzer

- (id)_resultForCommand:(const char *)a3
{
  v4 = popen(a3, "r");
  if (v4)
  {
    v5 = v4;
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableString string](&OBJC_CLASS___NSMutableString, "string"));
    while (!feof(v5))
    {
      int64_t v7 = fread(&v13, 1uLL, 0x200uLL, v5);
      if (v7 >= 1)
      {
        v8 = -[NSString initWithBytes:length:encoding:]( objc_alloc(&OBJC_CLASS___NSString),  "initWithBytes:length:encoding:",  &v13,  v7,  4LL);
        if (v8) {
          [v6 appendString:v8];
        }
      }
    }

    pclose(v5);
  }

  else
  {
    v9 = (void *)AFSiriLogContextAnalysis;
    if (os_log_type_enabled(AFSiriLogContextAnalysis, OS_LOG_TYPE_INFO))
    {
      v10 = v9;
      int v11 = *__error();
      int v13 = 136315650;
      v14 = "-[AFAnalyzer _resultForCommand:]";
      __int16 v15 = 1024;
      int v16 = v11;
      __int16 v17 = 2080;
      v18 = a3;
      _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_INFO,  "%s Unable to run (%d): %s",  (uint8_t *)&v13,  0x1Cu);
    }

    v6 = 0LL;
  }

  return v6;
}

- (void)_getDefaultGateway:(id *)a3 iface:(id *)a4
{
  *(_OWORD *)v22 = xmmword_100009D18;
  uint64_t v23 = 1LL;
  if (sysctl(v22, 6u, 0LL, &__size, 0LL, 0LL) < 0 || (v6 = (unsigned __int16 *)malloc(__size)) == 0LL)
  {
    id v9 = 0LL;
    id v19 = 0LL;
    if (!a3) {
      goto LABEL_28;
    }
    goto LABEL_27;
  }

  int64_t v7 = v6;
  if (sysctl(v22, 6u, v6, &__size, 0LL, 0LL) < 0
    || (unint64_t v8 = (unint64_t)v7 + __size, v7 >= (unsigned __int16 *)((char *)v7 + __size)))
  {
    id v9 = 0LL;
LABEL_32:
    id v19 = 0LL;
  }

  else
  {
    id v9 = 0LL;
    v10 = v7;
    while (1)
    {

      if (v10 && (*((_DWORD *)v10 + 2) & 0x20002) == 2 && (v10[11] & 1) == 0 && *((_BYTE *)v10 + 93) == 2)
      {
        uint64_t v11 = 0LL;
        v12 = v10 + 46;
        unsigned int v13 = *((_DWORD *)v10 + 3);
        do
        {
          if (((v13 >> v11) & 1) != 0)
          {
            uint64_t v14 = ((*v12 - 1) & 0xFFFFFFFC) + 4LL;
            if (!*v12) {
              uint64_t v14 = 4LL;
            }
            __int16 v15 = v12;
            v12 += v14;
          }

          else
          {
            __int16 v15 = 0LL;
          }

          *(void *)&v26[8 * v11++] = v15;
        }

        while (v11 != 8);
        if (*(_BYTE *)(v27 + 1) == 2
          && (*(void *)v24 = 0LL, v25 = 0LL, (int v16 = inet_ntop(2, (const void *)(v27 + 4), v24, 0x10u)) != 0LL))
        {
          id v17 = (id)objc_claimAutoreleasedReturnValue( +[NSString stringWithUTF8String:]( &OBJC_CLASS___NSString,  "stringWithUTF8String:",  v16));
        }

        else
        {
          id v17 = 0LL;
        }

        v20 = sub_10000793C(v10[2]);
        id v18 = (id)objc_claimAutoreleasedReturnValue(v20);
      }

      else
      {
        id v17 = 0LL;
        id v18 = 0LL;
      }

      id v19 = v17;
      id v9 = v18;
      if (v19) {
        break;
      }
      v10 = (unsigned __int16 *)((char *)v10 + *v10);
    }
  }

  free(v7);
  if (a3) {
LABEL_27:
  }
    *a3 = v19;
LABEL_28:
  if (a4) {
    *a4 = v9;
  }
}

- (id)_addressToPingForHost:(id)a3
{
  if (!a3) {
    goto LABEL_10;
  }
  memset(&v12, 0, sizeof(v12));
  *(void *)&v12.ai_family = 0x200000002LL;
  int v3 = getaddrinfo( (const char *)objc_msgSend( a3, "UTF8String", *(_OWORD *)&v12.ai_flags, 0, 0, 0, 0), 0, &v12, &v13);
  if (v3)
  {
    int v4 = v3;
    v5 = (void *)AFSiriLogContextAnalysis;
    if (os_log_type_enabled(AFSiriLogContextAnalysis, OS_LOG_TYPE_INFO))
    {
      v6 = v5;
      int64_t v7 = gai_strerror(v4);
      *(_DWORD *)buf = 136315394;
      __int16 v15 = "-[AFAnalyzer _addressToPingForHost:]";
      __int16 v16 = 2080;
      id v17 = v7;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "%s Couldn't getaddrinfo %s", buf, 0x16u);
    }

    goto LABEL_10;
  }

  unint64_t v8 = v13;
  if (!v13)
  {
LABEL_10:
    v10 = 0LL;
    return v10;
  }

  id v9 = v13;
  while (v9->ai_family != 2)
  {
    id v9 = v9->ai_next;
    if (!v9)
    {
      v10 = 0LL;
      goto LABEL_13;
    }
  }

  v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSData dataWithBytes:length:]( &OBJC_CLASS___NSData,  "dataWithBytes:length:",  v9->ai_addr,  v9->ai_addrlen));
  unint64_t v8 = v13;
  if (!v13) {
    return v10;
  }
LABEL_13:
  freeaddrinfo(v8);
  return v10;
}

- (void)_pingHost:(id)a3 time:(double *)a4 sentPackets:(int64_t *)a5 droppedPackets:(int64_t *)a6
{
  id v8 = a3;
  id v9 = (void *)objc_claimAutoreleasedReturnValue(-[AFAnalyzer _addressToPingForHost:](self, "_addressToPingForHost:", v8));
  if (v9)
  {
    unsigned __int16 v10 = arc4random_uniform(0xFFFFu);
    int v11 = socket(2, 2, 1);
    if ((v11 & 0x80000000) == 0)
    {
      unsigned int v12 = v11;
      unsigned int v13 = (os_log_s *)AFSiriLogContextAnalysis;
      if (os_log_type_enabled(AFSiriLogContextAnalysis, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315650;
        *(void *)&uint8_t buf[4] = "-[AFAnalyzer _pingHost:time:sentPackets:droppedPackets:]";
        *(_WORD *)&buf[12] = 2112;
        *(void *)&buf[14] = v8;
        *(_WORD *)&buf[22] = 1024;
        LODWORD(v64) = v10;
        _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "%s Pinging %@ using id %d", buf, 0x1Cu);
      }

      id v15 = objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString, "stringWithFormat:", @"ping.queue.%d", v10));
      __int16 v16 = dispatch_queue_create((const char *)[v15 UTF8String], 0);

      v30 = a6;
      dispatch_semaphore_t v17 = dispatch_semaphore_create(0LL);
      dispatch_source_t v18 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_read, v12, 0LL, v16);
      uint64_t v59 = 0LL;
      v60 = &v59;
      uint64_t v61 = 0x2020000000LL;
      int v62 = 0;
      uint64_t v55 = 0LL;
      v56 = (double *)&v55;
      uint64_t v57 = 0x2020000000LL;
      uint64_t v58 = 0LL;
      handler[0] = _NSConcreteStackBlock;
      handler[1] = 3221225472LL;
      handler[2] = sub_100007FA4;
      handler[3] = &unk_10000C6E8;
      unsigned int v52 = v12;
      id v19 = v9;
      unsigned __int16 v54 = v10;
      id v48 = v19;
      v50 = &v59;
      v51 = &v55;
      int v53 = 5;
      v20 = v18;
      v49 = v20;
      dispatch_source_set_event_handler(v20, handler);
      v44[0] = _NSConcreteStackBlock;
      v44[1] = 3221225472LL;
      v44[2] = sub_10000834C;
      v44[3] = &unk_10000C710;
      v21 = v17;
      v45 = v21;
      unsigned int v46 = v12;
      dispatch_source_set_cancel_handler(v20, v44);
      dispatch_resume(v20);
      v42[0] = 0LL;
      v42[1] = v42;
      v42[2] = 0x2020000000LL;
      __int16 v43 = 0;
      *(void *)buf = 0LL;
      *(void *)&buf[8] = buf;
      *(void *)&buf[16] = 0x3032000000LL;
      v64 = sub_100008374;
      v65 = sub_10000839C;
      id v66 = 0LL;
      v33[0] = _NSConcreteStackBlock;
      v33[1] = 3221225472LL;
      v33[2] = sub_1000083A4;
      v33[3] = &unk_10000C738;
      v22 = v20;
      v34 = v22;
      unsigned __int16 v41 = v10;
      id v35 = v19;
      v37 = v42;
      unsigned int v39 = v12;
      int v40 = 5;
      uint64_t v23 = v16;
      v36 = v23;
      v38 = buf;
      id v24 = [v33 copy];
      id v25 = objc_retainBlock(v24);
      v26 = *(void **)(*(void *)&buf[8] + 40LL);
      *(void *)(*(void *)&buf[8] + 40LL) = v25;

      dispatch_async(v23, v24);
      dispatch_time_t v27 = dispatch_time(0LL, 10000000000LL);
      dispatch_semaphore_wait(v21, v27);
      dispatch_source_cancel(v22);
      if (a4)
      {
        int v28 = *((_DWORD *)v60 + 6);
        if (v28 < 1) {
          double v29 = -1.0;
        }
        else {
          double v29 = v56[3] / (double)v28;
        }
        *a4 = v29;
      }

      if (a5) {
        *a5 = 5LL;
      }
      if (v30) {
        int64_t *v30 = 5LL - *((int *)v60 + 6);
      }

      _Block_object_dispose(buf, 8);
      _Block_object_dispose(v42, 8);

      _Block_object_dispose(&v55, 8);
      _Block_object_dispose(&v59, 8);
    }
  }

  else
  {
    uint64_t v14 = (os_log_s *)AFSiriLogContextAnalysis;
    if (os_log_type_enabled(AFSiriLogContextAnalysis, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315394;
      *(void *)&uint8_t buf[4] = "-[AFAnalyzer _pingHost:time:sentPackets:droppedPackets:]";
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = v8;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_INFO, "%s Couldn't find addr for host %@", buf, 0x16u);
    }
  }
}

- (double)_measureTimeToLoadURL:(id)a3 withMethod:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  int64_t v7 = (os_log_s *)AFSiriLogContextAnalysis;
  if (os_log_type_enabled(AFSiriLogContextAnalysis, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    *(void *)&uint8_t buf[4] = "-[AFAnalyzer _measureTimeToLoadURL:withMethod:]";
    *(_WORD *)&buf[12] = 2112;
    *(void *)&buf[14] = v5;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "%s Attempting to load %@", buf, 0x16u);
  }

  id v8 = -[NSMutableURLRequest initWithURL:](objc_alloc(&OBJC_CLASS___NSMutableURLRequest), "initWithURL:", v5);
  -[NSMutableURLRequest setHTTPMethod:](v8, "setHTTPMethod:", v6);
  -[NSMutableURLRequest setHTTPShouldHandleCookies:](v8, "setHTTPShouldHandleCookies:", 0LL);
  id v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSProcessInfo processInfo](&OBJC_CLASS___NSProcessInfo, "processInfo"));
  [v9 systemUptime];
  uint64_t v11 = v10;

  dispatch_semaphore_t v12 = dispatch_semaphore_create(0LL);
  *(void *)buf = 0LL;
  *(void *)&buf[8] = buf;
  *(void *)&buf[16] = 0x2020000000LL;
  unint64_t v30 = 0xBFF0000000000000LL;
  unsigned int v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSURLSession sharedSession](&OBJC_CLASS___NSURLSession, "sharedSession"));
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472LL;
  v21[2] = sub_100007F30;
  v21[3] = &unk_10000C760;
  uint64_t v23 = buf;
  uint64_t v24 = v11;
  uint64_t v14 = v12;
  v22 = v14;
  id v15 = (void *)objc_claimAutoreleasedReturnValue([v13 dataTaskWithRequest:v8 completionHandler:v21]);

  [v15 resume];
  dispatch_time_t v16 = dispatch_time(0LL, 300000000000LL);
  dispatch_semaphore_wait(v14, v16);
  dispatch_semaphore_t v17 = (os_log_s *)AFSiriLogContextAnalysis;
  if (os_log_type_enabled(AFSiriLogContextAnalysis, OS_LOG_TYPE_INFO))
  {
    else {
      dispatch_source_t v18 = @"succeeded";
    }
    *(_DWORD *)id v25 = 136315394;
    v26 = "-[AFAnalyzer _measureTimeToLoadURL:withMethod:]";
    __int16 v27 = 2112;
    int v28 = v18;
    _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_INFO, "%s URL load %@", v25, 0x16u);
  }

  double v19 = *(double *)(*(void *)&buf[8] + 24LL);

  _Block_object_dispose(buf, 8);
  return v19;
}

- (void)_logAnalysisForURL:(id)a3 failedIFaceIndex:(id)a4 sendBufferSize:(id)a5 isUserFailure:(BOOL)a6 isWWANPreferred:(BOOL)a7 isRetrySuccess:(BOOL)a8
{
  BOOL v68 = a8;
  BOOL v69 = a7;
  BOOL v70 = a6;
  id v63 = a3;
  id v67 = a4;
  id v66 = a5;
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  dispatch_semaphore_t v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", v70));
  [v11 setObject:v12 forKey:@"User Failure"];

  unsigned int v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", v69));
  [v11 setObject:v13 forKey:@"WWAN Preferred"];

  uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", v68));
  [v11 setObject:v14 forKey:@"Retry Success"];

  if (v67
    && (id v15 = sub_10000793C((signed int)[v67 intValue]),
        dispatch_time_t v16 = (void *)objc_claimAutoreleasedReturnValue(v15),
        (dispatch_semaphore_t v17 = v16) != 0LL))
  {
    else {
      uint64_t v18 = 2LL;
    }
    double v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", v18));
    [v11 setObject:v19 forKey:@"Connection Interface"];

    v20 = v17;
  }

  else
  {
    v20 = 0LL;
  }

  if (v66) {
    [v11 setObject:v66 forKey:@"Send buffer size"];
  }
  uint64_t v99 = 0LL;
  v100 = &v99;
  uint64_t v101 = 0x3032000000LL;
  v102 = sub_1000079B0;
  v103 = sub_1000079C0;
  id v104 = 0LL;
  uint64_t v93 = 0LL;
  v94 = &v93;
  uint64_t v95 = 0x3032000000LL;
  v96 = sub_1000079B0;
  v97 = sub_1000079C0;
  id v98 = 0LL;
  id v91 = 0LL;
  id v92 = 0LL;
  -[AFAnalyzer _getDefaultGateway:iface:](self, "_getDefaultGateway:iface:", &v92, &v91);
  id v64 = v92;
  id v65 = v91;
  if (![v64 length])
  {
    id v25 = (dispatch_group_s *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", 0LL));
    [v11 setObject:v25 forKey:@"Gateway availability status"];
    goto LABEL_28;
  }

  v21 = (os_log_s *)AFSiriLogContextAnalysis;
  if (os_log_type_enabled(AFSiriLogContextAnalysis, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315650;
    v106 = "-[AFAnalyzer _logAnalysisForURL:failedIFaceIndex:sendBufferSize:isUserFailure:isWWANPreferred:isRetrySuccess:]";
    __int16 v107 = 2112;
    id v108 = v64;
    __int16 v109 = 2112;
    id v110 = v65;
    _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_INFO, "%s Gateway is %@ on interface %@", buf, 0x20u);
  }

  unsigned int v22 = [v65 isEqualToString:@"pdp_ip0"];
  if (v22) {
    uint64_t v23 = 1LL;
  }
  else {
    uint64_t v23 = 2LL;
  }
  uint64_t v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", v23));
  [v11 setObject:v24 forKey:@"Gateway availability status"];

  id v25 = dispatch_group_create();
  dispatch_queue_global_t global_queue = dispatch_get_global_queue(0LL, 0LL);
  __int16 v27 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(global_queue);
  dispatch_queue_t v28 = dispatch_queue_create(0LL, 0LL);
  double v29 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000079C8;
  block[3] = &unk_10000C7B0;
  block[4] = self;
  unint64_t v30 = v28;
  v89 = v30;
  v31 = v29;
  v90 = v31;
  dispatch_group_async(v25, v27, block);
  if ((v22 & 1) == 0)
  {
    v82[0] = _NSConcreteStackBlock;
    v82[1] = 3221225472LL;
    v82[2] = sub_100007A84;
    v82[3] = &unk_10000C800;
    v82[4] = self;
    id v83 = v64;
    v86 = &v99;
    v87 = &v93;
    v84 = v30;
    v85 = v31;
    dispatch_group_async(v25, v27, v82);
  }

  v78[0] = _NSConcreteStackBlock;
  v78[1] = 3221225472LL;
  v78[2] = sub_100007B94;
  v78[3] = &unk_10000C828;
  v78[4] = self;
  id v32 = v63;
  id v79 = v32;
  v33 = v30;
  v80 = v33;
  v34 = v31;
  v81 = v34;
  dispatch_group_async(v25, v27, v78);
  id v35 = (void *)objc_claimAutoreleasedReturnValue([v32 URLByDeletingLastPathComponent]);
  v36 = (void *)objc_claimAutoreleasedReturnValue([v35 URLByAppendingPathComponent:@"salt"]);

  if (v36)
  {
    v74[0] = _NSConcreteStackBlock;
    v74[1] = 3221225472LL;
    v74[2] = sub_100007C24;
    v74[3] = &unk_10000C828;
    v74[4] = self;
    id v75 = v36;
    v76 = v33;
    v77 = v34;
    dispatch_group_async(v25, v27, v74);
  }

  dispatch_time_t v37 = dispatch_time(0LL, 20000000000LL);
  uint64_t v38 = dispatch_group_wait(v25, v37);
  unsigned int v39 = (os_log_s *)AFSiriLogContextAnalysis;
  BOOL v40 = os_log_type_enabled(AFSiriLogContextAnalysis, OS_LOG_TYPE_INFO);
  if (v38)
  {
    if (v40)
    {
      *(_DWORD *)buf = 136315138;
      v106 = "-[AFAnalyzer _logAnalysisForURL:failedIFaceIndex:sendBufferSize:isUserFailure:isWWANPreferred:isRetrySuccess:]";
      unsigned __int16 v41 = "%s Failed waiting for network";
LABEL_26:
      _os_log_impl((void *)&_mh_execute_header, v39, OS_LOG_TYPE_INFO, v41, buf, 0xCu);
    }
  }

  else if (v40)
  {
    *(_DWORD *)buf = 136315138;
    v106 = "-[AFAnalyzer _logAnalysisForURL:failedIFaceIndex:sendBufferSize:isUserFailure:isWWANPreferred:isRetrySuccess:]";
    unsigned __int16 v41 = "%s Dispatch group finished waiting";
    goto LABEL_26;
  }

  v71[0] = _NSConcreteStackBlock;
  v71[1] = 3221225472LL;
  v71[2] = sub_100007CB4;
  v71[3] = &unk_10000C850;
  v72 = v34;
  id v73 = v11;
  v42 = v34;
  dispatch_sync(v33, v71);

LABEL_28:
  __int16 v43 = (os_log_s *)AFSiriLogContextAnalysis;
  if (os_log_type_enabled(AFSiriLogContextAnalysis, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    v106 = "-[AFAnalyzer _logAnalysisForURL:failedIFaceIndex:sendBufferSize:isUserFailure:isWWANPreferred:isRetrySuccess:]";
    __int16 v107 = 2112;
    id v108 = v11;
    _os_log_impl((void *)&_mh_execute_header, v43, OS_LOG_TYPE_INFO, "%s %@", buf, 0x16u);
  }

  v44 = objc_opt_new(&OBJC_CLASS___AFDiagnosticsNetworkAnalyzerResults);
  v45 = (void *)objc_claimAutoreleasedReturnValue([v11 objectForKey:@"Connection Interface"]);
  -[AFDiagnosticsNetworkAnalyzerResults setConnectionInterface:](v44, "setConnectionInterface:", v45);

  unsigned int v46 = (void *)objc_claimAutoreleasedReturnValue([v11 objectForKey:@"Send buffer size"]);
  -[AFDiagnosticsNetworkAnalyzerResults setSendBufferBytesRemaining:](v44, "setSendBufferBytesRemaining:", v46);

  -[AFDiagnosticsNetworkAnalyzerResults setForUserRequest:](v44, "setForUserRequest:", v70);
  -[AFDiagnosticsNetworkAnalyzerResults setWwanPreferred:](v44, "setWwanPreferred:", v69);
  -[AFDiagnosticsNetworkAnalyzerResults setAnalyzedSuccessfulRetry:](v44, "setAnalyzedSuccessfulRetry:", v68);
  v47 = (void *)objc_claimAutoreleasedReturnValue([v11 objectForKey:@"Apple URL HEAD time"]);
  id v48 = (void *)objc_claimAutoreleasedReturnValue([v11 objectForKey:@"Siri URL HEAD time"]);
  v49 = (void *)objc_claimAutoreleasedReturnValue([v11 objectForKey:@"Siri Salt URL HEAD time"]);
  [v47 doubleValue];
  if (v50 >= 0.0) {
    v51 = v47;
  }
  else {
    v51 = 0LL;
  }
  -[AFDiagnosticsNetworkAnalyzerResults setKnownURLLoadDuration:](v44, "setKnownURLLoadDuration:", v51);
  [v48 doubleValue];
  if (v52 >= 0.0) {
    int v53 = v48;
  }
  else {
    int v53 = 0LL;
  }
  -[AFDiagnosticsNetworkAnalyzerResults setSiriURLLoadDuration:](v44, "setSiriURLLoadDuration:", v53);
  [v49 doubleValue];
  if (v54 >= 0.0) {
    uint64_t v55 = v49;
  }
  else {
    uint64_t v55 = 0LL;
  }
  -[AFDiagnosticsNetworkAnalyzerResults setSiriSaltURLLoadDuration:](v44, "setSiriSaltURLLoadDuration:", v55);
  v56 = (void *)objc_claimAutoreleasedReturnValue([v11 objectForKey:@"Gateway availability status"]);
  unsigned int v57 = [v56 intValue];

  if (v57 >= 3) {
    uint64_t v58 = -1LL;
  }
  else {
    uint64_t v58 = v57;
  }
  -[AFDiagnosticsNetworkAnalyzerResults setGatewayStatus:](v44, "setGatewayStatus:", v58);
  uint64_t v59 = (void *)objc_claimAutoreleasedReturnValue([v11 objectForKey:@"Gateway average ping"]);
  [v59 doubleValue];
  if (v60 >= 0.0) {
    uint64_t v61 = v59;
  }
  else {
    uint64_t v61 = 0LL;
  }
  -[AFDiagnosticsNetworkAnalyzerResults setGatewayPingDuration:](v44, "setGatewayPingDuration:", v61);
  -[AFDiagnosticsNetworkAnalyzerResults setGatewayPingsSent:](v44, "setGatewayPingsSent:", v100[5]);
  -[AFDiagnosticsNetworkAnalyzerResults setGatewayPingsDropped:](v44, "setGatewayPingsDropped:", v94[5]);
  int v62 = (void *)objc_claimAutoreleasedReturnValue(+[AFDiagnostics sharedDiagnostics](&OBJC_CLASS___AFDiagnostics, "sharedDiagnostics"));
  [v62 logNetworkAnalyzeRunWithResults:v44];

  _Block_object_dispose(&v93, 8);
  _Block_object_dispose(&v99, 8);
}

- (void)_startAnalysisWithMessage:(id)a3
{
  id v4 = a3;
  string = xpc_dictionary_get_string(v4, "url");
  if (string)
  {
    id v6 = string;
    int64_t v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", string));
    id v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:](&OBJC_CLASS___NSURL, "URLWithString:", v7));

    id v9 = (os_log_s *)AFSiriLogContextAnalysis;
    BOOL v10 = os_log_type_enabled(AFSiriLogContextAnalysis, OS_LOG_TYPE_INFO);
    if (v8)
    {
      if (v10)
      {
        int v26 = 136315394;
        __int16 v27 = "-[AFAnalyzer _startAnalysisWithMessage:]";
        __int16 v28 = 2112;
        double v29 = v8;
        _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_INFO,  "%s Attempting analysis on URL {%@}.",  (uint8_t *)&v26,  0x16u);
      }

      xpc_object_t value = xpc_dictionary_get_value(v4, "interface");
      dispatch_semaphore_t v12 = (void *)objc_claimAutoreleasedReturnValue(value);
      unsigned int v13 = v12;
      if (v12)
      {
        uint64_t v14 = +[NSNumber numberWithLongLong:](&OBJC_CLASS___NSNumber, "numberWithLongLong:", xpc_int64_get_value(v12));
        id v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
      }

      else
      {
        id v15 = 0LL;
      }

      xpc_object_t v18 = xpc_dictionary_get_value(v4, "send buffer");
      double v19 = (void *)objc_claimAutoreleasedReturnValue(v18);
      v20 = v19;
      if (v19)
      {
        v21 = +[NSNumber numberWithLongLong:](&OBJC_CLASS___NSNumber, "numberWithLongLong:", xpc_int64_get_value(v19));
        unsigned int v22 = (void *)objc_claimAutoreleasedReturnValue(v21);
      }

      else
      {
        unsigned int v22 = 0LL;
      }

      BOOL v23 = xpc_dictionary_get_BOOL(v4, "request failure");
      BOOL v24 = xpc_dictionary_get_BOOL(v4, "wwan preferred");
      -[AFAnalyzer _logAnalysisForURL:failedIFaceIndex:sendBufferSize:isUserFailure:isWWANPreferred:isRetrySuccess:]( self,  "_logAnalysisForURL:failedIFaceIndex:sendBufferSize:isUserFailure:isWWANPreferred:isRetrySuccess:",  v8,  v15,  v22,  v23,  v24,  xpc_dictionary_get_BOOL(v4, "successful retry"));
      dispatch_time_t v25 = dispatch_time(0LL, 1000000000LL);
      dispatch_after(v25, &_dispatch_main_q, &stru_10000C890);
    }

    else
    {
      if (!v10)
      {
LABEL_17:

        goto LABEL_18;
      }

      id v15 = v9;
      dispatch_semaphore_t v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", v6));
      int v26 = 136315394;
      __int16 v27 = "-[AFAnalyzer _startAnalysisWithMessage:]";
      __int16 v28 = 2112;
      double v29 = v17;
      _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_INFO,  "%s Ending analysis. Instantiating a URL for {%@} returned nil.",  (uint8_t *)&v26,  0x16u);
    }

    goto LABEL_17;
  }

  dispatch_time_t v16 = (os_log_s *)AFSiriLogContextAnalysis;
  if (os_log_type_enabled(AFSiriLogContextAnalysis, OS_LOG_TYPE_INFO))
  {
    int v26 = 136315138;
    __int16 v27 = "-[AFAnalyzer _startAnalysisWithMessage:]";
    _os_log_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_INFO,  "%s Ending analysis. Attempted analysis on a NULL URL.",  (uint8_t *)&v26,  0xCu);
  }

- (void)_handleMessage:(id)a3
{
  id v5 = a3;
  string = xpc_dictionary_get_string(v5, "message");
  if (!strcmp(string, "analyze")) {
    -[AFAnalyzer _startAnalysisWithMessage:](self, "_startAnalysisWithMessage:", v5);
  }
}

- (void)runAnalyzerService
{
  int v3 = (os_log_s *)AFSiriLogContextAnalysis;
  if (os_log_type_enabled(AFSiriLogContextAnalysis, OS_LOG_TYPE_INFO))
  {
    int v4 = 136315138;
    id v5 = "-[AFAnalyzer runAnalyzerService]";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "%s Running analyzer service", (uint8_t *)&v4, 0xCu);
  }

  objc_storeStrong((id *)&qword_100010AE8, self);
  xpc_main((xpc_connection_handler_t)sub_1000076B0);
}

- (void)runAnalysis
{
  id v3 = (id)objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:](&OBJC_CLASS___NSURL, "URLWithString:", @"https://guzzoni.apple.com"));
  -[AFAnalyzer _logAnalysisForURL:failedIFaceIndex:sendBufferSize:isUserFailure:isWWANPreferred:isRetrySuccess:]( self,  "_logAnalysisForURL:failedIFaceIndex:sendBufferSize:isUserFailure:isWWANPreferred:isRetrySuccess:",  v3,  0LL,  0LL,  0LL,  0LL,  0LL);
}

+ (id)analyzer
{
  return objc_alloc_init(&OBJC_CLASS___AFAnalyzer);
}

@end