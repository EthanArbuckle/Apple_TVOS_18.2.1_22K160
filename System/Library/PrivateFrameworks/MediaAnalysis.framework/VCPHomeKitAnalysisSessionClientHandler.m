@interface VCPHomeKitAnalysisSessionClientHandler
+ (id)clientHandlerWithXPCConnection:(id)a3;
- (VCPHomeKitAnalysisSessionClientHandler)init;
- (VCPHomeKitAnalysisSessionClientHandler)initWithXPCConnection:(id)a3;
- (void)analyzer:(id)a3 didAnalyzeFragment:(id)a4;
- (void)analyzer:(id)a3 didProduceResult:(id)a4;
- (void)cancelAllRequests;
- (void)processMessageWithOptions:(id)a3 andReply:(id)a4;
- (void)processVideoFragmentAssetData:(id)a3 withOptions:(id)a4 andReply:(id)a5;
- (void)startSessionWithProperties:(id)a3 andReply:(id)a4;
@end

@implementation VCPHomeKitAnalysisSessionClientHandler

- (VCPHomeKitAnalysisSessionClientHandler)init
{
  return 0LL;
}

- (VCPHomeKitAnalysisSessionClientHandler)initWithXPCConnection:(id)a3
{
  id v5 = a3;
  v40.receiver = self;
  v40.super_class = (Class)&OBJC_CLASS___VCPHomeKitAnalysisSessionClientHandler;
  v6 = -[VCPHomeKitAnalysisSessionClientHandler init](&v40, "init");
  v7 = v6;
  if (v6)
  {
    p_connection = (id *)&v6->_connection;
    objc_storeStrong((id *)&v6->_connection, a3);
    id v9 = VCPTransactionWithName((uint64_t)@"VCPMediaAnalysisClientHandler-requestAssetAnalysis");
    uint64_t v10 = objc_claimAutoreleasedReturnValue(v9);
    transaction = v7->_transaction;
    v7->_transaction = (OS_os_transaction *)v10;

    [*p_connection setExportedObject:v7];
    id v34 = v5;
    v12 = (void *)objc_claimAutoreleasedReturnValue( +[NSXPCInterface interfaceWithProtocol:]( &OBJC_CLASS___NSXPCInterface,  "interfaceWithProtocol:",  &OBJC_PROTOCOL___VCPHomeKitAnalysisSessionServerProtocol));
    v13 = (void *)objc_claimAutoreleasedReturnValue( +[NSXPCInterface interfaceWithProtocol:]( &OBJC_CLASS___NSXPCInterface,  "interfaceWithProtocol:",  &OBJC_PROTOCOL___VCPHomeKitAnalysisSessionClientProtocol));
    id v14 = [sub_10001BBDC() allowedClasses];
    v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
    [v12 setClasses:v15 forSelector:"processVideoFragmentAssetData:withOptions:andReply:" argumentIndex:1 ofReply:0];
    [v12 setClasses:v15 forSelector:"processVideoFragmentAssetData:withOptions:andReply:" argumentIndex:0 ofReply:1];
    [v12 setClasses:v15 forSelector:"processMessageWithOptions:andReply:" argumentIndex:0 ofReply:0];
    [v12 setClasses:v15 forSelector:"processMessageWithOptions:andReply:" argumentIndex:0 ofReply:1];
    [v12 setClasses:v15 forSelector:"startSessionWithProperties:andReply:" argumentIndex:0 ofReply:0];
    [v13 setClasses:v15 forSelector:"processResults:withReply:" argumentIndex:0 ofReply:0];
    [*p_connection setExportedInterface:v12];
    [*p_connection setRemoteObjectInterface:v13];
    objc_initWeak(&location, v7);
    id v16 = *p_connection;
    v37[0] = _NSConcreteStackBlock;
    v37[1] = 3221225472LL;
    v37[2] = sub_10001BC90;
    v37[3] = &unk_1001B99F0;
    objc_copyWeak(&v38, &location);
    [v16 setInterruptionHandler:v37];
    id v17 = *p_connection;
    v35[0] = _NSConcreteStackBlock;
    v35[1] = 3221225472LL;
    v35[2] = sub_10001BD98;
    v35[3] = &unk_1001B99F0;
    objc_copyWeak(&v36, &location);
    [v17 setInvalidationHandler:v35];
    uint64_t v18 = objc_claimAutoreleasedReturnValue([*p_connection remoteObjectProxy]);
    clientProxy = v7->_clientProxy;
    v7->_clientProxy = (VCPHomeKitAnalysisSessionClientProtocol *)v18;

    dispatch_queue_t v20 = dispatch_queue_create("com.apple.mediaanalysisd.homekitclientmanagment", 0LL);
    managementQueue = v7->_managementQueue;
    v7->_managementQueue = (OS_dispatch_queue *)v20;

    dispatch_queue_t v22 = dispatch_queue_create("com.apple.mediaanalysisd.homekitclienttask", 0LL);
    taskQueue = v7->_taskQueue;
    v7->_taskQueue = (OS_dispatch_queue *)v22;

    dispatch_group_t v24 = dispatch_group_create();
    runningFragmentGroup = v7->_runningFragmentGroup;
    v7->_runningFragmentGroup = (OS_dispatch_group *)v24;

    dispatch_group_t v26 = dispatch_group_create();
    runningMessageGroup = v7->_runningMessageGroup;
    v7->_runningMessageGroup = (OS_dispatch_group *)v26;

    uint64_t v28 = objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
    taskIDMapping = v7->_taskIDMapping;
    v7->_taskIDMapping = (NSMutableDictionary *)v28;

    analyzer = v7->_analyzer;
    v7->_analyzer = 0LL;

    v7->_nextTaskID = 1LL;
    v31 = objc_alloc_init(&OBJC_CLASS___MADScopedWatchdog);
    scopedWatchdog = v7->_scopedWatchdog;
    v7->_scopedWatchdog = v31;

    objc_destroyWeak(&v36);
    objc_destroyWeak(&v38);
    objc_destroyWeak(&location);

    id v5 = v34;
  }

  return v7;
}

+ (id)clientHandlerWithXPCConnection:(id)a3
{
  id v4 = a3;
  id v5 = [objc_alloc((Class)objc_opt_class(a1)) initWithXPCConnection:v4];

  return v5;
}

- (void)startSessionWithProperties:(id)a3 andReply:(id)a4
{
  id v6 = a3;
  v7 = (void (**)(id, void *))a4;
  if (self->_analyzer)
  {
    NSErrorUserInfoKey v25 = NSLocalizedDescriptionKey;
    v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Session already started"));
    dispatch_group_t v26 = v8;
    id v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v26,  &v25,  1LL));
    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  NSOSStatusErrorDomain,  -18LL,  v9));
    v7[2](v7, v10);

    id v11 = 0LL;
  }

  else
  {
    id v22 = 0LL;
    id v12 = [sub_10001BBDC() analyzerWithOptions:v6 error:&v22];
    v13 = (HMIVideoAnalyzer *)objc_claimAutoreleasedReturnValue(v12);
    id v11 = v22;
    analyzer = self->_analyzer;
    self->_analyzer = v13;

    id v16 = self->_analyzer;
    if (v16)
    {
      -[HMIVideoAnalyzer setDelegate:](v16, "setDelegate:", self);
    }

    else
    {
      uint64_t v17 = MediaAnalysisLogLevel(0LL, v15);
      if ((int)v17 >= 3)
      {
        uint64_t v19 = VCPLogInstance(v17, v18);
        dispatch_queue_t v20 = (os_log_s *)objc_claimAutoreleasedReturnValue(v19);
        os_log_type_t v21 = VCPLogToOSLogType[3];
        if (os_log_type_enabled(v20, v21))
        {
          *(_DWORD *)buf = 138412290;
          id v24 = v11;
          _os_log_impl((void *)&_mh_execute_header, v20, v21, "Error: failed to create HMIVideoAnalyzer: %@", buf, 0xCu);
        }
      }
    }

    v7[2](v7, v11);
  }
}

- (void)processMessageWithOptions:(id)a3 andReply:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  -[MADScopedWatchdog pet](self->_scopedWatchdog, "pet");
  taskQueue = (dispatch_queue_s *)self->_taskQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10001C218;
  block[3] = &unk_1001BA400;
  id v12 = v6;
  id v13 = v7;
  block[4] = self;
  id v9 = v6;
  id v10 = v7;
  dispatch_async(taskQueue, block);
}

- (void)processVideoFragmentAssetData:(id)a3 withOptions:(id)a4 andReply:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v12 = MediaAnalysisLogLevel(v10, v11);
  if ((int)v12 >= 6)
  {
    uint64_t v14 = VCPLogInstance(v12, v13);
    uint64_t v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
    os_log_type_t v16 = VCPLogToOSLogType[6];
    if (os_log_type_enabled(v15, v16))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v15, v16, "Received request to analyze movie", buf, 2u);
    }
  }

  unint64_t nextTaskID = self->_nextTaskID;
  self->_unint64_t nextTaskID = nextTaskID + 1;
  v37[0] = _NSConcreteStackBlock;
  v37[1] = 3221225472LL;
  v37[2] = sub_10001C6E4;
  v37[3] = &unk_1001BA490;
  void v37[4] = self;
  unint64_t v39 = nextTaskID;
  id v18 = v10;
  id v38 = v18;
  uint64_t v19 = objc_retainBlock(v37);
  *(void *)buf = 0LL;
  id v34 = buf;
  uint64_t v35 = 0x2020000000LL;
  char v36 = 0;
  managementQueue = (dispatch_queue_s *)self->_managementQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10001CC88;
  block[3] = &unk_1001BA4B8;
  block[4] = self;
  unint64_t v32 = nextTaskID;
  id v21 = v18;
  id v30 = v21;
  v31 = buf;
  dispatch_sync(managementQueue, block);
  if (!v34[24])
  {
    taskQueue = (dispatch_queue_s *)self->_taskQueue;
    v23[0] = _NSConcreteStackBlock;
    v23[1] = 3221225472LL;
    v23[2] = sub_10001CF00;
    v23[3] = &unk_1001BA530;
    v23[4] = self;
    unint64_t v28 = nextTaskID;
    id v26 = v21;
    id v24 = v8;
    id v25 = v9;
    v27 = v19;
    dispatch_async(taskQueue, v23);
  }

  _Block_object_dispose(buf, 8);
}

- (void)analyzer:(id)a3 didProduceResult:(id)a4
{
}

- (void)analyzer:(id)a3 didAnalyzeFragment:(id)a4
{
  if ((int)MediaAnalysisLogLevel(self, a2, a3, a4) >= 4)
  {
    uint64_t v4 = VCPLogInstance();
    id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
    os_log_type_t v6 = VCPLogToOSLogType[4];
    if (os_log_type_enabled(v5, v6))
    {
      *(_WORD *)id v7 = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, v6, "Method not implemented", v7, 2u);
    }
  }

- (void)cancelAllRequests
{
  uint64_t v3 = MediaAnalysisLogLevel(self, a2);
  if ((int)v3 >= 6)
  {
    uint64_t v5 = VCPLogInstance(v3, v4);
    os_log_type_t v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
    os_log_type_t v7 = VCPLogToOSLogType[6];
    if (os_log_type_enabled(v6, v7))
    {
      id v8 = (void *)objc_claimAutoreleasedReturnValue(-[VCPHomeKitAnalysisSessionClientHandler description](self, "description"));
      LODWORD(buf) = 138412290;
      *(void *)((char *)&buf + 4) = v8;
      _os_log_impl((void *)&_mh_execute_header, v6, v7, "Service %@ to cancel requests", (uint8_t *)&buf, 0xCu);
    }
  }

  *(void *)&__int128 buf = 0LL;
  *((void *)&buf + 1) = &buf;
  uint64_t v23 = 0x3032000000LL;
  id v24 = sub_10001D848;
  id v25 = sub_10001D858;
  id v26 = 0LL;
  managementQueue = (dispatch_queue_s *)self->_managementQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10001D860;
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