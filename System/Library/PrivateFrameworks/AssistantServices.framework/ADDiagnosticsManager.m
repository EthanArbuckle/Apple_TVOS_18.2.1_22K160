@interface ADDiagnosticsManager
- (ADDiagnosticsManager)initWithQueue:(id)a3;
- (void)URLSession:(id)a3 dataTask:(id)a4 didReceiveResponse:(id)a5 completionHandler:(id)a6;
- (void)updateLatencyDiagnosticConfiguration:(id)a3 completion:(id)a4;
@end

@implementation ADDiagnosticsManager

- (ADDiagnosticsManager)initWithQueue:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___ADDiagnosticsManager;
  v6 = -[ADDiagnosticsManager init](&v9, "init");
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_queue, a3);
  }

  return v7;
}

- (void)updateLatencyDiagnosticConfiguration:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v31 = a4;
  v7 = dispatch_group_create();
  v34 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSURLSessionConfiguration ephemeralSessionConfiguration]( &OBJC_CLASS___NSURLSessionConfiguration,  "ephemeralSessionConfiguration"));
  objc_super v9 = self;
  v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSURLSession sessionWithConfiguration:delegate:delegateQueue:]( &OBJC_CLASS___NSURLSession,  "sessionWithConfiguration:delegate:delegateQueue:",  v8,  self,  0LL));

  __int128 v49 = 0u;
  __int128 v50 = 0u;
  __int128 v47 = 0u;
  __int128 v48 = 0u;
  v32 = v6;
  id obj = (id)objc_claimAutoreleasedReturnValue([v6 diagnosticActions]);
  id v11 = [obj countByEnumeratingWithState:&v47 objects:v55 count:16];
  if (v11)
  {
    id v12 = v11;
    uint64_t v13 = *(void *)v48;
    do
    {
      for (i = 0LL; i != v12; i = (char *)i + 1)
      {
        if (*(void *)v48 != v13) {
          objc_enumerationMutation(obj);
        }
        v15 = *(void **)(*((void *)&v47 + 1) + 8LL * (void)i);
        v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "uri", v31));
        v17 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableURLRequest requestWithURL:]( &OBJC_CLASS___NSMutableURLRequest,  "requestWithURL:",  v16));
        v18 = (void *)objc_claimAutoreleasedReturnValue([v15 verb]);
        [v17 setHTTPMethod:v18];
        v19 = (os_log_s *)AFSiriLogContextDaemon;
        if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 136315394;
          v52 = "-[ADDiagnosticsManager updateLatencyDiagnosticConfiguration:completion:]";
          __int16 v53 = 2112;
          v54 = v17;
          _os_log_impl( (void *)&_mh_execute_header,  v19,  OS_LOG_TYPE_INFO,  "%s Dispatching diagnostic request: %@",  buf,  0x16u);
        }

        dispatch_group_enter(v7);
        v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSProcessInfo processInfo](&OBJC_CLASS___NSProcessInfo, "processInfo"));
        [v20 systemUptime];
        uint64_t v22 = v21;

        v39[0] = _NSConcreteStackBlock;
        v39[1] = 3221225472LL;
        v39[2] = sub_100125A2C;
        v39[3] = &unk_1004F2210;
        id v40 = v17;
        id v41 = v16;
        id v42 = v18;
        uint64_t v46 = v22;
        v43 = v7;
        v44 = v9;
        v45 = v34;
        id v23 = v18;
        id v24 = v16;
        id v25 = v17;
        v26 = (void *)objc_claimAutoreleasedReturnValue([v10 dataTaskWithRequest:v25 completionHandler:v39]);
        [v26 resume];
      }

      id v12 = [obj countByEnumeratingWithState:&v47 objects:v55 count:16];
    }

    while (v12);
  }

  queue = (dispatch_queue_s *)v9->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100125C94;
  block[3] = &unk_1004FD9E0;
  id v37 = v10;
  id v38 = v31;
  v36 = v34;
  id v28 = v10;
  id v29 = v31;
  v30 = v34;
  dispatch_group_notify(v7, queue, block);
}

- (void)URLSession:(id)a3 dataTask:(id)a4 didReceiveResponse:(id)a5 completionHandler:(id)a6
{
}

- (void).cxx_destruct
{
}

@end