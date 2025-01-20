@interface VCPHomeKitAnalysisClientHandler
+ (id)clientHandlerWithXPCConnection:(id)a3;
+ (id)errorForStatus:(int)a3 withDescription:(id)a4;
- (VCPHomeKitAnalysisClientHandler)init;
- (VCPHomeKitAnalysisClientHandler)initWithXPCConnection:(id)a3;
- (void)cancelAllRequests;
- (void)cancelRequest:(int)a3;
- (void)logStatusForRequest:(int)a3 withError:(id)a4;
- (void)requestAnalysis:(unint64_t)a3 ofFragmentData:(id)a4 withRequestID:(int)a5 properties:(id)a6 andReply:(id)a7;
- (void)requestAnalysis:(unint64_t)a3 ofFragmentSurface:(id)a4 withRequestID:(int)a5 properties:(id)a6 andReply:(id)a7;
- (void)requestResidentMaintenance:(int)a3 withOptions:(id)a4 andReply:(id)a5;
@end

@implementation VCPHomeKitAnalysisClientHandler

- (VCPHomeKitAnalysisClientHandler)init
{
  return 0LL;
}

- (VCPHomeKitAnalysisClientHandler)initWithXPCConnection:(id)a3
{
  id v5 = a3;
  v39.receiver = self;
  v39.super_class = (Class)&OBJC_CLASS___VCPHomeKitAnalysisClientHandler;
  v6 = -[VCPHomeKitAnalysisClientHandler init](&v39, "init");
  v7 = v6;
  if (v6)
  {
    p_connection = (id *)&v6->_connection;
    objc_storeStrong((id *)&v6->_connection, a3);
    objc_initWeak(&location, v7);
    [*p_connection setExportedObject:v7];
    v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSXPCInterface interfaceWithProtocol:]( &OBJC_CLASS___NSXPCInterface,  "interfaceWithProtocol:",  &OBJC_PROTOCOL___VCPHomeKitAnalysisServerProtocol));
    uint64_t v45 = 0LL;
    v46 = &v45;
    uint64_t v47 = 0x2050000000LL;
    v10 = (void *)qword_1001E63E8;
    uint64_t v48 = qword_1001E63E8;
    if (!qword_1001E63E8)
    {
      v40 = _NSConcreteStackBlock;
      uint64_t v41 = 3221225472LL;
      v42 = sub_10001A510;
      v43 = &unk_1001B9F10;
      v44 = &v45;
      sub_10001A510((uint64_t)&v40);
      v10 = (void *)v46[3];
    }

    v11 = v10;
    _Block_object_dispose(&v45, 8);
    id v12 = objc_alloc_init(v11);
    v13 = (void *)objc_claimAutoreleasedReturnValue([v12 expectedClasses]);

    [v9 setClasses:v13 forSelector:"requestAnalysis:ofFragmentData:withRequestID:properties:andReply:" argumentIndex:3 ofReply:0];
    [v9 setClasses:v13 forSelector:"requestAnalysis:ofFragmentData:withRequestID:properties:andReply:" argumentIndex:0 ofReply:1];
    [v9 setClasses:v13 forSelector:"requestAnalysis:ofFragmentSurface:withRequestID:properties:andReply:" argumentIndex:3 ofReply:0];
    [v9 setClasses:v13 forSelector:"requestAnalysis:ofFragmentSurface:withRequestID:properties:andReply:" argumentIndex:0 ofReply:1];
    uint64_t v45 = 0LL;
    v46 = &v45;
    uint64_t v47 = 0x2050000000LL;
    v14 = (void *)qword_1001E63F8;
    uint64_t v48 = qword_1001E63F8;
    if (!qword_1001E63F8)
    {
      v40 = _NSConcreteStackBlock;
      uint64_t v41 = 3221225472LL;
      v42 = sub_10001A610;
      v43 = &unk_1001B9F10;
      v44 = &v45;
      sub_10001A610((uint64_t)&v40);
      v14 = (void *)v46[3];
    }

    id v15 = v14;
    _Block_object_dispose(&v45, 8);
    v16 = (void *)objc_claimAutoreleasedReturnValue([v15 allowedClasses]);
    [v9 setClasses:v16 forSelector:"requestResidentMaintenance:withOptions:andReply:" argumentIndex:1 ofReply:0];

    [*p_connection setExportedInterface:v9];
    id v17 = *p_connection;
    v18 = (void *)objc_claimAutoreleasedReturnValue( +[NSXPCInterface interfaceWithProtocol:]( &OBJC_CLASS___NSXPCInterface,  "interfaceWithProtocol:",  &OBJC_PROTOCOL___VCPHomeKitAnalysisClientProtocol));
    [v17 setRemoteObjectInterface:v18];

    id v19 = *p_connection;
    v36[0] = _NSConcreteStackBlock;
    v36[1] = 3221225472LL;
    v36[2] = sub_10001826C;
    v36[3] = &unk_1001B99F0;
    objc_copyWeak(&v37, &location);
    [v19 setInterruptionHandler:v36];
    id v20 = *p_connection;
    v30 = _NSConcreteStackBlock;
    uint64_t v31 = 3221225472LL;
    v32 = sub_100018324;
    v33 = &unk_1001BA188;
    objc_copyWeak(&v35, &location);
    v21 = v7;
    v34 = v21;
    [v20 setInvalidationHandler:&v30];
    uint64_t v22 = objc_claimAutoreleasedReturnValue(objc_msgSend(*p_connection, "remoteObjectProxy", v30, v31, v32, v33));
    clientProxy = v21->_clientProxy;
    v21->_clientProxy = (VCPHomeKitAnalysisClientProtocol *)v22;

    dispatch_queue_t v24 = dispatch_queue_create("com.apple.mediaanalysisd.homekitclientmanagment", 0LL);
    managementQueue = v21->_managementQueue;
    v21->_managementQueue = (OS_dispatch_queue *)v24;

    uint64_t v26 = objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
    taskIDMapping = v21->_taskIDMapping;
    v21->_taskIDMapping = (NSMutableDictionary *)v26;

    v28 = v21;
    objc_destroyWeak(&v35);
    objc_destroyWeak(&v37);

    objc_destroyWeak(&location);
  }

  return v7;
}

+ (id)clientHandlerWithXPCConnection:(id)a3
{
  id v4 = a3;
  id v5 = [objc_alloc((Class)objc_opt_class(a1)) initWithXPCConnection:v4];

  return v5;
}

+ (id)errorForStatus:(int)a3 withDescription:(id)a4
{
  id v5 = (__CFString *)a4;
  v7 = v5;
  switch(a3)
  {
    case -128:
      v8 = @"[MAHomeKitClientHandler] Analysis was canceled";
      break;
    case 0:
      v9 = 0LL;
      goto LABEL_13;
    case -50:
      v8 = @"[MAHomeKitClientHandler] Invalid request ID";
      break;
    default:
      id v5 = (__CFString *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"[MAHomeKitClientHandler] Analysis failed - %@",  v5));
      v8 = v5;
      break;
  }

  uint64_t v10 = MediaAnalysisLogLevel(v5, v6);
  if ((int)v10 >= 3)
  {
    uint64_t v12 = VCPLogInstance(v10, v11);
    v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
    os_log_type_t v14 = VCPLogToOSLogType[3];
    if (os_log_type_enabled(v13, v14))
    {
      *(_DWORD *)buf = 138412290;
      id v20 = v8;
      _os_log_impl((void *)&_mh_execute_header, v13, v14, "%@", buf, 0xCu);
    }
  }

  NSErrorUserInfoKey v17 = NSLocalizedDescriptionKey;
  v18 = v8;
  id v15 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v18,  &v17,  1LL));
  v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"HomeKitAnalysisService",  a3,  v15));

LABEL_13:
  return v9;
}

- (void)logStatusForRequest:(int)a3 withError:(id)a4
{
  id v5 = a4;
  v7 = v5;
  if (v5)
  {
    id v8 = [v5 code];
    if (v8 == (id)-128LL)
    {
      uint64_t v10 = MediaAnalysisLogLevel(-128LL, v9);
      if ((int)v10 >= 6)
      {
        uint64_t v12 = VCPLogInstance(v10, v11);
        v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
        os_log_type_t v14 = VCPLogToOSLogType[6];
        if (os_log_type_enabled(v13, v14))
        {
          int v24 = 67109120;
          int v25 = a3;
          id v15 = "Request %d canceled";
LABEL_9:
          _os_log_impl((void *)&_mh_execute_header, v13, v14, v15, (uint8_t *)&v24, 8u);
          goto LABEL_13;
        }

        goto LABEL_13;
      }
    }

    else
    {
      uint64_t v19 = MediaAnalysisLogLevel(v8, v9);
      if ((int)v19 >= 3)
      {
        uint64_t v21 = VCPLogInstance(v19, v20);
        v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v21);
        os_log_type_t v22 = VCPLogToOSLogType[3];
        if (os_log_type_enabled(v13, v22))
        {
          v23 = (void *)objc_claimAutoreleasedReturnValue([v7 description]);
          int v24 = 67109378;
          int v25 = a3;
          __int16 v26 = 2112;
          v27 = v23;
          _os_log_impl((void *)&_mh_execute_header, v13, v22, "Request %d failed (%@)", (uint8_t *)&v24, 0x12u);
        }

        goto LABEL_13;
      }
    }
  }

  else
  {
    uint64_t v16 = MediaAnalysisLogLevel(0LL, v6);
    if ((int)v16 >= 6)
    {
      uint64_t v18 = VCPLogInstance(v16, v17);
      v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v18);
      os_log_type_t v14 = VCPLogToOSLogType[6];
      if (os_log_type_enabled(v13, v14))
      {
        int v24 = 67109120;
        int v25 = a3;
        id v15 = "Request %d completed";
        goto LABEL_9;
      }

- (void)requestAnalysis:(unint64_t)a3 ofFragmentData:(id)a4 withRequestID:(int)a5 properties:(id)a6 andReply:(id)a7
{
  id v11 = a4;
  id v12 = a6;
  id v13 = a7;
  uint64_t v15 = MediaAnalysisLogLevel(v13, v14);
  if ((int)v15 >= 6)
  {
    uint64_t v17 = VCPLogInstance(v15, v16);
    uint64_t v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(v17);
    os_log_type_t v19 = VCPLogToOSLogType[6];
    if (os_log_type_enabled(v18, v19))
    {
      *(_DWORD *)buf = 67109120;
      *(_DWORD *)&uint8_t buf[4] = a5;
      _os_log_impl((void *)&_mh_execute_header, v18, v19, "Received request %d to analyze movie", buf, 8u);
    }
  }

  uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue(+[VCPWatchdog sharedWatchdog](&OBJC_CLASS___VCPWatchdog, "sharedWatchdog"));
  [v20 pet];

  *(void *)buf = 0LL;
  uint64_t v45 = buf;
  uint64_t v46 = 0x3032000000LL;
  uint64_t v47 = sub_100018AF8;
  uint64_t v48 = sub_100018B08;
  id v21 = VCPTransactionWithName((uint64_t)@"VCPMediaAnalysisClientHandler-requestAssetAnalysis");
  id v49 = (id)objc_claimAutoreleasedReturnValue(v21);
  v42[0] = _NSConcreteStackBlock;
  v42[1] = 3221225472LL;
  v42[2] = sub_100018B10;
  v42[3] = &unk_1001B9AF8;
  v42[4] = self;
  int v43 = a5;
  os_log_type_t v22 = objc_retainBlock(v42);
  v38[0] = _NSConcreteStackBlock;
  v38[1] = 3221225472LL;
  v38[2] = sub_100018B2C;
  v38[3] = &unk_1001BA1D8;
  v38[4] = self;
  int v41 = a5;
  id v23 = v13;
  id v39 = v23;
  v40 = buf;
  int v24 = objc_retainBlock(v38);
  managementQueue = (dispatch_queue_s *)self->_managementQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100018DDC;
  block[3] = &unk_1001BA200;
  int v37 = a5;
  block[4] = self;
  id v32 = v11;
  id v33 = v12;
  id v34 = v23;
  id v35 = v22;
  id v36 = v24;
  __int16 v26 = v24;
  v27 = v22;
  id v28 = v12;
  id v29 = v11;
  id v30 = v23;
  dispatch_sync(managementQueue, block);

  _Block_object_dispose(buf, 8);
}

- (void)requestAnalysis:(unint64_t)a3 ofFragmentSurface:(id)a4 withRequestID:(int)a5 properties:(id)a6 andReply:(id)a7
{
  id v11 = a4;
  id v12 = a6;
  id v13 = a7;
  uint64_t v15 = MediaAnalysisLogLevel(v13, v14);
  if ((int)v15 >= 6)
  {
    uint64_t v17 = VCPLogInstance(v15, v16);
    uint64_t v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(v17);
    os_log_type_t v19 = VCPLogToOSLogType[6];
    if (os_log_type_enabled(v18, v19))
    {
      *(_DWORD *)buf = 67109120;
      *(_DWORD *)&uint8_t buf[4] = a5;
      _os_log_impl((void *)&_mh_execute_header, v18, v19, "Received request %d to analyze movie", buf, 8u);
    }
  }

  uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue(+[VCPWatchdog sharedWatchdog](&OBJC_CLASS___VCPWatchdog, "sharedWatchdog"));
  [v20 pet];

  *(void *)buf = 0LL;
  uint64_t v45 = buf;
  uint64_t v46 = 0x3032000000LL;
  uint64_t v47 = sub_100018AF8;
  uint64_t v48 = sub_100018B08;
  id v21 = VCPTransactionWithName((uint64_t)@"VCPMediaAnalysisClientHandler-requestAssetAnalysis");
  id v49 = (id)objc_claimAutoreleasedReturnValue(v21);
  v42[0] = _NSConcreteStackBlock;
  v42[1] = 3221225472LL;
  v42[2] = sub_100019314;
  v42[3] = &unk_1001B9AF8;
  v42[4] = self;
  int v43 = a5;
  os_log_type_t v22 = objc_retainBlock(v42);
  v38[0] = _NSConcreteStackBlock;
  v38[1] = 3221225472LL;
  v38[2] = sub_100019330;
  v38[3] = &unk_1001BA1D8;
  v38[4] = self;
  int v41 = a5;
  id v23 = v13;
  id v39 = v23;
  v40 = buf;
  int v24 = objc_retainBlock(v38);
  managementQueue = (dispatch_queue_s *)self->_managementQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000195E0;
  block[3] = &unk_1001BA200;
  int v37 = a5;
  block[4] = self;
  id v32 = v11;
  id v33 = v12;
  id v34 = v23;
  id v35 = v22;
  id v36 = v24;
  __int16 v26 = v24;
  v27 = v22;
  id v28 = v12;
  id v29 = v11;
  id v30 = v23;
  dispatch_sync(managementQueue, block);

  _Block_object_dispose(buf, 8);
}

- (void)requestResidentMaintenance:(int)a3 withOptions:(id)a4 andReply:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  uint64_t v11 = MediaAnalysisLogLevel(v9, v10);
  if ((int)v11 >= 6)
  {
    uint64_t v13 = VCPLogInstance(v11, v12);
    uint64_t v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
    os_log_type_t v15 = VCPLogToOSLogType[6];
    if (os_log_type_enabled(v14, v15))
    {
      *(_DWORD *)buf = 67109120;
      *(_DWORD *)&uint8_t buf[4] = a3;
      _os_log_impl((void *)&_mh_execute_header, v14, v15, "Received resident maintenance request (%d)", buf, 8u);
    }
  }

  uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue(+[VCPWatchdog sharedWatchdog](&OBJC_CLASS___VCPWatchdog, "sharedWatchdog"));
  [v16 pet];

  *(void *)buf = 0LL;
  id v32 = buf;
  uint64_t v33 = 0x3032000000LL;
  id v34 = sub_100018AF8;
  id v35 = sub_100018B08;
  id v17 = VCPTransactionWithName((uint64_t)@"com.apple.mediaanalysisd.home.maintenance");
  id v36 = (id)objc_claimAutoreleasedReturnValue(v17);
  v27[0] = _NSConcreteStackBlock;
  v27[1] = 3221225472LL;
  v27[2] = sub_100019A90;
  v27[3] = &unk_1001BA1D8;
  int v30 = a3;
  v27[4] = self;
  id v28 = v9;
  id v29 = buf;
  id v18 = v9;
  os_log_type_t v19 = objc_retainBlock(v27);
  managementQueue = (dispatch_queue_s *)self->_managementQueue;
  v23[0] = _NSConcreteStackBlock;
  v23[1] = 3221225472LL;
  v23[2] = sub_100019C44;
  v23[3] = &unk_1001BA248;
  int v26 = a3;
  id v24 = v8;
  id v25 = v19;
  v23[4] = self;
  id v21 = v8;
  os_log_type_t v22 = v19;
  dispatch_sync(managementQueue, v23);

  _Block_object_dispose(buf, 8);
}

- (void)cancelRequest:(int)a3
{
  uint64_t v5 = MediaAnalysisLogLevel(self, a2);
  if ((int)v5 >= 6)
  {
    uint64_t v7 = VCPLogInstance(v5, v6);
    id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
    os_log_type_t v9 = VCPLogToOSLogType[6];
    if (os_log_type_enabled(v8, v9))
    {
      *(_DWORD *)buf = 67109120;
      *(_DWORD *)&uint8_t buf[4] = a3;
      _os_log_impl((void *)&_mh_execute_header, v8, v9, "Received cancel call for %d", buf, 8u);
    }
  }

  *(void *)buf = 0LL;
  id v23 = buf;
  uint64_t v24 = 0x2020000000LL;
  managementQueue = (dispatch_queue_s *)self->_managementQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10001A15C;
  block[3] = &unk_1001BA270;
  block[4] = self;
  void block[5] = buf;
  int v19 = a3;
  dispatch_sync(managementQueue, block);
  if (*((void *)v23 + 3))
  {
    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue(+[VCPMADTaskScheduler sharedInstance](&OBJC_CLASS___VCPMADTaskScheduler, "sharedInstance"));
    [v13 cancelTaskWithID:*((void *)v23 + 3)];
  }

  else
  {
    uint64_t v14 = MediaAnalysisLogLevel(v11, v12);
    uint64_t v16 = VCPLogInstance(v14, v15);
    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue(v16);
    os_log_type_t v17 = VCPLogToOSLogType[5];
    if (os_log_type_enabled((os_log_t)v13, v17))
    {
      *(_DWORD *)uint64_t v20 = 67109120;
      int v21 = a3;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)v13, v17, "Cancellation requested for unknown ID %d", v20, 8u);
    }
  }

LABEL_8:
  _Block_object_dispose(buf, 8);
}

- (void)cancelAllRequests
{
  uint64_t v3 = MediaAnalysisLogLevel(self, a2);
  if ((int)v3 >= 6)
  {
    uint64_t v5 = VCPLogInstance(v3, v4);
    uint64_t v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
    os_log_type_t v7 = VCPLogToOSLogType[6];
    if (os_log_type_enabled(v6, v7))
    {
      id v8 = (void *)objc_claimAutoreleasedReturnValue(-[VCPHomeKitAnalysisClientHandler description](self, "description"));
      LODWORD(buf) = 138412290;
      *(void *)((char *)&buf + 4) = v8;
      _os_log_impl((void *)&_mh_execute_header, v6, v7, "Service %@ to cancel requests", (uint8_t *)&buf, 0xCu);
    }
  }

  *(void *)&__int128 buf = 0LL;
  *((void *)&buf + 1) = &buf;
  uint64_t v23 = 0x3032000000LL;
  uint64_t v24 = sub_100018AF8;
  id v25 = sub_100018B08;
  id v26 = 0LL;
  managementQueue = (dispatch_queue_s *)self->_managementQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10001A464;
  block[3] = &unk_1001BA030;
  block[4] = self;
  void block[5] = &buf;
  dispatch_sync(managementQueue, block);
  __int128 v18 = 0u;
  __int128 v19 = 0u;
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  id v10 = *(id *)(*((void *)&buf + 1) + 40LL);
  id v11 = [v10 countByEnumeratingWithState:&v16 objects:v21 count:16];
  if (v11)
  {
    uint64_t v12 = *(void *)v17;
    do
    {
      for (i = 0LL; i != v11; i = (char *)i + 1)
      {
        if (*(void *)v17 != v12) {
          objc_enumerationMutation(v10);
        }
        uint64_t v14 = *(void **)(*((void *)&v16 + 1) + 8LL * (void)i);
        uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue( +[VCPMADTaskScheduler sharedInstance]( &OBJC_CLASS___VCPMADTaskScheduler,  "sharedInstance",  (void)v16));
        objc_msgSend(v15, "cancelTaskWithID:", objc_msgSend(v14, "unsignedIntegerValue"));
      }

      id v11 = [v10 countByEnumeratingWithState:&v16 objects:v21 count:16];
    }

    while (v11);
  }

  _Block_object_dispose(&buf, 8);
}

- (void).cxx_destruct
{
}

@end