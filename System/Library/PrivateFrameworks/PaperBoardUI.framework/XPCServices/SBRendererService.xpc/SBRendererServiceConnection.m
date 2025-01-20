@interface SBRendererServiceConnection
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (PBUIRenderService)renderService;
- (SBImageAnalysisServer)analysisServer;
- (SBRendererServiceConnection)initWithRenderService:(id)a3 snapshotServer:(id)a4 analysisServer:(id)a5;
- (SBSnapshotServer)snapshotServer;
- (id)activateWithListener:(id)a3;
- (id)executeAnalysisRequest:(id)a3 error:(id *)a4;
- (id)executeAnalysisRequest:(id)a3 reply:(id)a4;
- (void)cachedSnapshotForRequest:(id)a3 reply:(id)a4;
- (void)cancelRequest:(id)a3;
- (void)checkinWithReply:(id)a3;
- (void)executeSnapshotRequest:(id)a3 reply:(id)a4;
- (void)fetchColorSpaceNameWithReply:(id)a3;
- (void)renderRequest:(id)a3 reply:(id)a4;
- (void)service_warmup:(id)a3;
@end

@implementation SBRendererServiceConnection

- (SBRendererServiceConnection)initWithRenderService:(id)a3 snapshotServer:(id)a4 analysisServer:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v12 = -[SBRendererServiceConnection init](self, "init");
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_renderService, a3);
    objc_storeStrong((id *)&v13->_snapshotServer, a4);
    objc_storeStrong((id *)&v13->_analysisServer, a5);
  }

  return v13;
}

- (id)activateWithListener:(id)a3
{
  id v5 = a3;
  if (v5)
  {
    v6 = v5;
    [v5 setDelegate:self];
    [v6 activate];
    v7 = self;
    id v8 = objc_alloc(&OBJC_CLASS___BSSimpleAssertion);
    id v9 = (void *)objc_claimAutoreleasedReturnValue([v6 description]);
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472LL;
    v14[2] = sub_1000067AC;
    v14[3] = &unk_10000C560;
    v14[4] = v7;
    id v15 = v6;
    id v10 = v6;
    id v11 = [v8 initWithIdentifier:v9 forReason:@"SBRendererServiceConnection stay-alive" invalidationBlock:v14];

    return v11;
  }

  else
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Invalid condition not satisfying: %@",  @"listener"));
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_100008170(a2, (uint64_t)self, (uint64_t)v13);
    }
    id result = (id) _bs_set_crash_log_message([v13 UTF8String]);
    __break(0);
  }

  return result;
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v5 = a4;
  v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSXPCInterface interfaceWithProtocol:]( &OBJC_CLASS___NSXPCInterface,  "interfaceWithProtocol:",  &OBJC_PROTOCOL___SBMultiplexRendererService));
  v7 = (void *)objc_claimAutoreleasedReturnValue( +[PBUICARemoteRenderer secureCodableRequestClasses]( &OBJC_CLASS___PBUICARemoteRenderer,  "secureCodableRequestClasses"));
  [v6 setClasses:v7 forSelector:"renderRequest:reply:" argumentIndex:0 ofReply:0];

  id v8 = (void *)objc_claimAutoreleasedReturnValue( +[SBSnapshotServer secureCodableRequestClasses]( &OBJC_CLASS___SBSnapshotServer,  "secureCodableRequestClasses"));
  [v6 setClasses:v8 forSelector:"executeSnapshotRequest:reply:" argumentIndex:0 ofReply:0];

  id v9 = (void *)objc_claimAutoreleasedReturnValue( +[SBSnapshotServer secureCodableRequestClasses]( &OBJC_CLASS___SBSnapshotServer,  "secureCodableRequestClasses"));
  [v6 setClasses:v9 forSelector:"cachedSnapshotForRequest:reply:" argumentIndex:0 ofReply:0];

  id v10 = (void *)objc_claimAutoreleasedReturnValue( +[SBImageAnalysisServer secureCodableRequestClasses]( &OBJC_CLASS___SBImageAnalysisServer,  "secureCodableRequestClasses"));
  [v6 setClasses:v10 forSelector:"executeAnalysisRequest:reply:" argumentIndex:0 ofReply:0];

  id v11 = (void *)objc_claimAutoreleasedReturnValue( +[SBImageAnalysisServer secureCodableResponseClasses]( &OBJC_CLASS___SBImageAnalysisServer,  "secureCodableResponseClasses"));
  [v6 setClasses:v11 forSelector:"executeAnalysisRequest:reply:" argumentIndex:0 ofReply:1];

  v12 = (void *)objc_claimAutoreleasedReturnValue( +[SBImageAnalysisServer secureCodableResponseClasses]( &OBJC_CLASS___SBImageAnalysisServer,  "secureCodableResponseClasses"));
  [v6 setClasses:v12 forSelector:"executeAnalysisRequest:reply:" argumentIndex:1 ofReply:1];

  v13 = (void *)objc_claimAutoreleasedReturnValue( +[SBImageAnalysisServer secureCodableRequestClasses]( &OBJC_CLASS___SBImageAnalysisServer,  "secureCodableRequestClasses"));
  [v6 setClasses:v13 forSelector:"executeAnalysisRequest:error:" argumentIndex:0 ofReply:0];

  v14 = (void *)objc_claimAutoreleasedReturnValue( +[SBImageAnalysisServer secureCodableRequestClasses]( &OBJC_CLASS___SBImageAnalysisServer,  "secureCodableRequestClasses"));
  [v6 setClasses:v14 forSelector:"executeAnalysisRequest:error:" argumentIndex:1 ofReply:0];

  id v15 = (void *)objc_claimAutoreleasedReturnValue( +[SBImageAnalysisServer secureCodableRequestClasses]( &OBJC_CLASS___SBImageAnalysisServer,  "secureCodableRequestClasses"));
  [v6 setClasses:v15 forSelector:"cancelRequest:" argumentIndex:0 ofReply:0];

  [v5 setExportedInterface:v6];
  [v5 setExportedObject:self];
  [v5 activate];
  id v16 = SBRSLogXPC();
  v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    v19[0] = 67109120;
    v19[1] = [v5 processIdentifier];
    _os_log_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_DEFAULT,  "Accepting connection from PID=%d",  (uint8_t *)v19,  8u);
  }

  return 1;
}

- (void)executeSnapshotRequest:(id)a3 reply:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v11 = _NSConcreteStackBlock;
  uint64_t v12 = 3221225472LL;
  v13 = sub_100006B4C;
  v14 = &unk_10000C588;
  id v15 = objc_opt_new(&OBJC_CLASS___BSAtomicSignal);
  id v16 = v6;
  id v8 = v6;
  id v9 = v15;
  id v10 = objc_retainBlock(&v11);
  -[SBSnapshotServer executeSnapshotRequest:reply:]( self->_snapshotServer,  "executeSnapshotRequest:reply:",  v7,  v10,  v11,  v12,  v13,  v14);
}

- (void)cachedSnapshotForRequest:(id)a3 reply:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v11 = _NSConcreteStackBlock;
  uint64_t v12 = 3221225472LL;
  v13 = sub_100006C84;
  v14 = &unk_10000C588;
  id v15 = objc_opt_new(&OBJC_CLASS___BSAtomicSignal);
  id v16 = v6;
  id v8 = v6;
  id v9 = v15;
  id v10 = objc_retainBlock(&v11);
  -[SBSnapshotServer cachedSnapshotForRequest:reply:]( self->_snapshotServer,  "cachedSnapshotForRequest:reply:",  v7,  v10,  v11,  v12,  v13,  v14);
}

- (id)executeAnalysisRequest:(id)a3 reply:(id)a4
{
  id v6 = a4;
  uint64_t v7 = dword_100012078++;
  id v8 = a3;
  CFAbsoluteTime Current = CFAbsoluteTimeGetCurrent();
  id v10 = SBRSLogXPC();
  id v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
    sub_10000826C(v7, v11, v12, v13, v14, v15, v16, v17);
  }

  analysisServer = self->_analysisServer;
  v22[0] = _NSConcreteStackBlock;
  v22[1] = 3221225472LL;
  v22[2] = sub_100006DE8;
  v22[3] = &unk_10000C5B0;
  id v23 = v6;
  int v25 = v7;
  CFAbsoluteTime v24 = Current;
  id v19 = v6;
  v20 = (void *)objc_claimAutoreleasedReturnValue( -[SBImageAnalysisServer executeAnalysisRequest:reply:]( analysisServer,  "executeAnalysisRequest:reply:",  v8,  v22));

  return v20;
}

- (void)cancelRequest:(id)a3
{
  id v4 = a3;
  CFAbsoluteTimeGetCurrent();
  id v5 = SBRSLogXPC();
  id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
    sub_100008414();
  }

  -[SBImageAnalysisServer cancelRequest:](self->_analysisServer, "cancelRequest:", v4);
  id v7 = SBRSLogXPC();
  id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
    sub_100008384();
  }
}

- (id)executeAnalysisRequest:(id)a3 error:(id *)a4
{
  id v6 = a3;
  CFAbsoluteTimeGetCurrent();
  id v7 = SBRSLogXPC();
  id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
    sub_100008518();
  }

  id v9 = (void *)objc_claimAutoreleasedReturnValue( -[SBImageAnalysisServer executeAnalysisRequest:error:]( self->_analysisServer,  "executeAnalysisRequest:error:",  v6,  a4));
  id v10 = SBRSLogXPC();
  id v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
    sub_100008488();
  }

  return v9;
}

- (void)fetchColorSpaceNameWithReply:(id)a3
{
}

- (void)renderRequest:(id)a3 reply:(id)a4
{
}

- (void)checkinWithReply:(id)a3
{
}

- (void)service_warmup:(id)a3
{
}

- (PBUIRenderService)renderService
{
  return self->_renderService;
}

- (SBImageAnalysisServer)analysisServer
{
  return self->_analysisServer;
}

- (SBSnapshotServer)snapshotServer
{
  return self->_snapshotServer;
}

- (void).cxx_destruct
{
}

@end