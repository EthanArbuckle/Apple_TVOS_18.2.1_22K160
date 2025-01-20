@interface VCPRealTimeAnalysisClientHandler
+ (id)clientHandlerWithXPCConnection:(id)a3;
- (VCPRealTimeAnalysisClientHandler)init;
- (VCPRealTimeAnalysisClientHandler)initWithXPCConnection:(id)a3;
- (void)requestAnalysis:(unint64_t)a3 ofIOSurface:(id)a4 withProperties:(id)a5 withReply:(id)a6;
@end

@implementation VCPRealTimeAnalysisClientHandler

- (VCPRealTimeAnalysisClientHandler)init
{
  return 0LL;
}

- (VCPRealTimeAnalysisClientHandler)initWithXPCConnection:(id)a3
{
  id v5 = a3;
  v26.receiver = self;
  v26.super_class = (Class)&OBJC_CLASS___VCPRealTimeAnalysisClientHandler;
  v6 = -[VCPRealTimeAnalysisClientHandler init](&v26, "init");
  if (v6)
  {
    id v7 = VCPTransactionWithName((uint64_t)@"VCPRealTimeAnalysisClientHandler");
    uint64_t v8 = objc_claimAutoreleasedReturnValue(v7);
    transaction = v6->_transaction;
    v6->_transaction = (OS_os_transaction *)v8;

    objc_storeStrong((id *)&v6->_connection, a3);
    -[NSXPCConnection setExportedObject:](v6->_connection, "setExportedObject:", v6);
    connection = v6->_connection;
    v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSXPCInterface interfaceWithProtocol:]( &OBJC_CLASS___NSXPCInterface,  "interfaceWithProtocol:",  &OBJC_PROTOCOL___VCPRealTimeAnalysisServerProtocol));
    -[NSXPCConnection setExportedInterface:](connection, "setExportedInterface:", v11);

    v12 = v6->_connection;
    v13 = (void *)objc_claimAutoreleasedReturnValue( +[NSXPCInterface interfaceWithProtocol:]( &OBJC_CLASS___NSXPCInterface,  "interfaceWithProtocol:",  &OBJC_PROTOCOL___VCPRealTimeAnalysisClientProtocol));
    -[NSXPCConnection setRemoteObjectInterface:](v12, "setRemoteObjectInterface:", v13);

    -[NSXPCConnection setInterruptionHandler:](v6->_connection, "setInterruptionHandler:", &stru_1001BE188);
    objc_initWeak(&location, v6);
    v14 = v6->_connection;
    v20 = _NSConcreteStackBlock;
    uint64_t v21 = 3221225472LL;
    v22 = sub_10012DEA0;
    v23 = &unk_1001B99F0;
    objc_copyWeak(&v24, &location);
    -[NSXPCConnection setInvalidationHandler:](v14, "setInvalidationHandler:", &v20);
    uint64_t v15 = objc_claimAutoreleasedReturnValue(-[NSXPCConnection remoteObjectProxy](v6->_connection, "remoteObjectProxy", v20, v21, v22, v23));
    clientProxy = v6->_clientProxy;
    v6->_clientProxy = (VCPRealTimeAnalysisClientProtocol *)v15;

    v6->_totalFaceDetectedFrames = 0;
    v17 = objc_alloc_init(&OBJC_CLASS___MADScopedWatchdog);
    scopedWatchdog = v6->_scopedWatchdog;
    v6->_scopedWatchdog = v17;

    objc_destroyWeak(&v24);
    objc_destroyWeak(&location);
  }

  return v6;
}

+ (id)clientHandlerWithXPCConnection:(id)a3
{
  id v4 = a3;
  id v5 = [objc_alloc((Class)objc_opt_class(a1)) initWithXPCConnection:v4];

  return v5;
}

- (void)requestAnalysis:(unint64_t)a3 ofIOSurface:(id)a4 withProperties:(id)a5 withReply:(id)a6
{
  v10 = (__IOSurface *)a4;
  id v11 = a5;
  v12 = (void (**)(id, void, void *))a6;
  uint64_t v14 = MediaAnalysisLogLevel(v12, v13);
  if ((int)v14 >= 7)
  {
    uint64_t v16 = VCPLogInstance(v14, v15);
    v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);
    os_log_type_t v18 = VCPLogToOSLogType[7];
    if (os_log_type_enabled(v17, v18))
    {
      *(_DWORD *)buf = 67109120;
      *(_DWORD *)&buf[4] = a3;
      _os_log_impl((void *)&_mh_execute_header, v17, v18, "Received frame analysis request (%x)", buf, 8u);
    }
  }

  *(void *)buf = 0LL;
  v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  if (!a3) {
    goto LABEL_21;
  }
  uint64_t v20 = CVPixelBufferCreateWithIOSurface(kCFAllocatorDefault, v10, 0LL, (CVPixelBufferRef *)buf);
  int v23 = v20;
  if (!(_DWORD)v20)
  {
    if ((a3 & 1) != 0)
    {
      contentAnalysis = self->_contentAnalysis;
      if (!contentAnalysis)
      {
        v30 = (VCPContentAnalysis *)objc_claimAutoreleasedReturnValue( +[VCPContentAnalysis contentAnalysis]( &OBJC_CLASS___VCPContentAnalysis,  "contentAnalysis"));
        v31 = self->_contentAnalysis;
        self->_contentAnalysis = v30;

        contentAnalysis = self->_contentAnalysis;
        if (!contentAnalysis)
        {
          uint64_t v53 = MediaAnalysisLogLevel(0LL, v32);
          if ((int)v53 >= 3)
          {
            uint64_t v55 = VCPLogInstance(v53, v54);
            v56 = (os_log_s *)objc_claimAutoreleasedReturnValue(v55);
            os_log_type_t v57 = VCPLogToOSLogType[3];
            if (os_log_type_enabled(v56, v57))
            {
              *(_WORD *)v63 = 0;
              _os_log_impl((void *)&_mh_execute_header, v56, v57, "Failed to create content analysis", v63, 2u);
            }

            goto LABEL_44;
          }

- (void).cxx_destruct
{
}

@end