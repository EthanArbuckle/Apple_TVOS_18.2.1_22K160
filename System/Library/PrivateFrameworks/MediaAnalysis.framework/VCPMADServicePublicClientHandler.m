@interface VCPMADServicePublicClientHandler
+ (id)clientHandlerWithXPCConnection:(id)a3;
- (VCPMADServicePublicClientHandler)init;
- (VCPMADServicePublicClientHandler)initWithXPCConnection:(id)a3;
- (id).cxx_construct;
- (int64_t)consumeSandboxExtension:(id)a3 url:(id)a4;
- (void)cancelAllRequests;
- (void)cancelRequest:(int)a3;
- (void)currentOutstandingTasksWithReply:(id)a3;
- (void)queryUserSafetyEnablement:(id)a3;
- (void)requestImageProcessing:(id)a3 forAssetURL:(id)a4 withSandboxToken:(id)a5 identifier:(id)a6 requestID:(int)a7 andReply:(id)a8;
- (void)requestImageProcessing:(id)a3 forIOSurface:(id)a4 withOrientation:(unsigned int)a5 identifier:(id)a6 requestID:(int)a7 andReply:(id)a8;
- (void)requestMultiModalPrewarming:(id)a3 requestID:(int)a4 reply:(id)a5;
- (void)requestProcessing:(id)a3 multiModalInputs:(id)a4 requestID:(int)a5 reply:(id)a6;
- (void)requestTextPrewarming:(id)a3 requestID:(int)a4 reply:(id)a5;
- (void)requestTextProcessing:(id)a3 textInputs:(id)a4 requestID:(int)a5 reply:(id)a6;
- (void)requestVideoProcessing:(id)a3 assetURL:(id)a4 sandboxToken:(id)a5 identifier:(id)a6 requestID:(int)a7 reply:(id)a8;
- (void)submitSpotlightAssetURL:(id)a3 uniqueIdentifier:(id)a4 bundleIdentifier:(id)a5 typeIdentifier:(id)a6 sandboxToken:(id)a7 reply:(id)a8;
@end

@implementation VCPMADServicePublicClientHandler

- (VCPMADServicePublicClientHandler)init
{
  return 0LL;
}

- (VCPMADServicePublicClientHandler)initWithXPCConnection:(id)a3
{
  id v40 = a3;
  v49.receiver = self;
  v49.super_class = (Class)&OBJC_CLASS___VCPMADServicePublicClientHandler;
  v5 = -[VCPMADServicePublicClientHandler init](&v49, "init");
  v6 = v5;
  if (v5)
  {
    p_connection = (id *)&v5->_connection;
    objc_storeStrong((id *)&v5->_connection, a3);
    objc_initWeak(&location, v6);
    [*p_connection setExportedObject:v6];
    id v8 = *p_connection;
    v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSXPCInterface interfaceWithProtocol:]( &OBJC_CLASS___NSXPCInterface,  "interfaceWithProtocol:",  &OBJC_PROTOCOL___VCPMediaAnalysisClientProtocol));
    [v8 setRemoteObjectInterface:v9];

    v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSXPCInterface interfaceWithProtocol:]( &OBJC_CLASS___NSXPCInterface,  "interfaceWithProtocol:",  &OBJC_PROTOCOL___VCPMADServicePublicServerProtocol));
    +[MADServicePublic configureServerInterface:](&OBJC_CLASS___MADServicePublic, "configureServerInterface:", v10);
    [*p_connection setExportedInterface:v10];
    id v11 = *p_connection;
    v46[0] = _NSConcreteStackBlock;
    v46[1] = 3221225472LL;
    v46[2] = sub_100005968;
    v46[3] = &unk_1001B99F0;
    objc_copyWeak(&v47, &location);
    [v11 setInterruptionHandler:v46];
    id v12 = *p_connection;
    v44[0] = _NSConcreteStackBlock;
    v44[1] = 3221225472LL;
    v44[2] = sub_100005A1C;
    v44[3] = &unk_1001B99F0;
    objc_copyWeak(&v45, &location);
    [v12 setInvalidationHandler:v44];
    dispatch_queue_t v13 = dispatch_queue_create("VCPMADServicePublicClientHandler", 0LL);
    managementQueue = v6->_managementQueue;
    v6->_managementQueue = (OS_dispatch_queue *)v13;

    uint64_t v15 = objc_claimAutoreleasedReturnValue([*p_connection remoteObjectProxy]);
    clientProxy = v6->_clientProxy;
    v6->_clientProxy = (VCPMediaAnalysisClientProtocol *)v15;

    CFTypeRef v42 = 0LL;
    CFTypeRef cf = 0LL;
    if (*p_connection) {
      [*p_connection auditToken];
    }
    else {
      memset(&token, 0, sizeof(token));
    }
    *(void *)buf = SecTaskCreateWithAuditToken(0LL, &token);
    p_secTask = &v6->_secTask;
    sub_100005B10((const void **)&v6->_secTask.value_, (const void **)buf);
    sub_10000421C((const void **)buf);
    value = v6->_secTask.value_;
    if (cf)
    {
      CFRelease(cf);
      CFTypeRef cf = 0LL;
    }

    CFStringRef v19 = SecTaskCopySigningIdentifier(value, (CFErrorRef *)&cf);
    clientBundleID = v6->_clientBundleID;
    v6->_clientBundleID = &v19->isa;

    v21 = p_secTask->value_;
    if (v42)
    {
      CFRelease(v42);
      CFTypeRef v42 = 0LL;
    }

    uint64_t v22 = SecTaskCopyTeamIdentifier(v21, &v42);
    clientTeamID = v6->_clientTeamID;
    v6->_clientTeamID = (NSString *)v22;

    if (cf)
    {
      uint64_t v24 = MediaAnalysisLogLevel(v24, v25);
      if ((int)v24 >= 4)
      {
        uint64_t v26 = VCPLogInstance();
        v27 = (os_log_s *)objc_claimAutoreleasedReturnValue(v26);
        os_log_type_t v28 = VCPLogToOSLogType[4];
        if (os_log_type_enabled(v27, v28))
        {
          *(_DWORD *)buf = 138412290;
          *(void *)&buf[4] = cf;
          _os_log_impl( (void *)&_mh_execute_header,  v27,  v28,  "[MAClientHandler] Failed to query client bundle ID (%@)",  buf,  0xCu);
        }
      }
    }

    if (v42)
    {
      uint64_t v24 = MediaAnalysisLogLevel(v24, v25);
      if ((int)v24 >= 4)
      {
        uint64_t v29 = VCPLogInstance();
        v30 = (os_log_s *)objc_claimAutoreleasedReturnValue(v29);
        os_log_type_t v31 = VCPLogToOSLogType[4];
        if (os_log_type_enabled(v30, v31))
        {
          *(_DWORD *)buf = 138412290;
          *(void *)&buf[4] = v42;
          _os_log_impl( (void *)&_mh_execute_header,  v30,  v31,  "[MAClientHandler] Failed to query client team ID (%@)",  buf,  0xCu);
        }
      }
    }

    if ((int)MediaAnalysisLogLevel(v24, v25) >= 6)
    {
      uint64_t v32 = VCPLogInstance();
      v33 = (os_log_s *)objc_claimAutoreleasedReturnValue(v32);
      os_log_type_t v34 = VCPLogToOSLogType[6];
      if (os_log_type_enabled(v33, v34))
      {
        v35 = v6->_clientBundleID;
        v36 = v6->_clientTeamID;
        *(_DWORD *)buf = 138412546;
        *(void *)&buf[4] = v35;
        __int16 v51 = 2112;
        v52 = v36;
        _os_log_impl( (void *)&_mh_execute_header,  v33,  v34,  "[MAClientHandler] Client BundleID: %@ TeamID: %@",  buf,  0x16u);
      }
    }

    v6->_userSafetyEntitled = +[MADUserSafetySettings isTaskEntitled:]( &OBJC_CLASS___MADUserSafetySettings,  "isTaskEntitled:",  p_secTask->value_);
    v37 = -[MADServiceClientTaskQueuingScheduler initWithClientBundleID:]( objc_alloc(&OBJC_CLASS___MADServiceClientTaskQueuingScheduler),  "initWithClientBundleID:",  v6->_clientBundleID);
    queuingTaskScheduler = v6->_queuingTaskScheduler;
    v6->_queuingTaskScheduler = v37;

    sub_10000421C(&v42);
    sub_10000421C(&cf);
    objc_destroyWeak(&v45);
    objc_destroyWeak(&v47);

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

- (int64_t)consumeSandboxExtension:(id)a3 url:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [v7 fileSystemRepresentation];
  connection = self->_connection;
  if (connection) {
    -[NSXPCConnection auditToken](connection, "auditToken");
  }
  else {
    memset(v23, 0, sizeof(v23));
  }
  uint64_t v10 = sandbox_check_by_audit_token(v23, "file-read*", SANDBOX_CHECK_NO_REPORT | 1u);
  if ((_DWORD)v10 == -1)
  {
    if ((int)MediaAnalysisLogLevel(v10, v11) >= 3)
    {
      uint64_t v16 = VCPLogInstance();
      dispatch_queue_t v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);
      os_log_type_t v14 = VCPLogToOSLogType[3];
      if (os_log_type_enabled(v13, v14))
      {
        *(_DWORD *)buf = 136315138;
        id v25 = v8;
        uint64_t v15 = "[MADServicePublic] Failed to check for client read access to file %s";
        goto LABEL_12;
      }

- (void)requestImageProcessing:(id)a3 forIOSurface:(id)a4 withOrientation:(unsigned int)a5 identifier:(id)a6 requestID:(int)a7 andReply:(id)a8
{
  uint64_t v9 = *(void *)&a7;
  uint64_t v11 = *(void *)&a5;
  id v14 = a3;
  uint64_t v15 = (__IOSurface *)a4;
  id v38 = a6;
  uint64_t v16 = (void (**)(id, void, void *))a8;
  if ((int)MediaAnalysisLogLevel(v16, v17) >= 6)
  {
    uint64_t v18 = VCPLogInstance();
    uint64_t v19 = (os_log_s *)objc_claimAutoreleasedReturnValue(v18);
    os_log_type_t v20 = VCPLogToOSLogType[6];
    if (os_log_type_enabled(v19, v20))
    {
      *(_DWORD *)buf = 67109120;
      *(_DWORD *)&uint8_t buf[4] = v9;
      _os_log_impl( (void *)&_mh_execute_header,  v19,  v20,  "[MADServicePublic] Received on-demand image processing request (CVPixelBuffer) with MADRequestID %d",  buf,  8u);
    }
  }

  os_log_type_t v21 = objc_autoreleasePoolPush();
  v37 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Request: %d Identifier: %@",  v9,  v38));
  uint64_t v22 = VCPSignPostLog();
  v23 = (os_log_s *)objc_claimAutoreleasedReturnValue(v22);
  os_signpost_id_t v24 = os_signpost_id_generate(v23);

  uint64_t v25 = VCPSignPostLog();
  uint64_t v26 = (os_log_s *)objc_claimAutoreleasedReturnValue(v25);
  v27 = v26;
  if (v24 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v26))
  {
    *(_DWORD *)buf = 138412290;
    *(void *)&uint8_t buf[4] = v37;
    _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v27,  OS_SIGNPOST_INTERVAL_BEGIN,  v24,  "VCPMADServicePublicClientHandler_IOSurface",  "%@",  buf,  0xCu);
  }

  *(void *)buf = 0LL;
  CVReturn v28 = CVPixelBufferCreateWithIOSurface(0LL, v15, 0LL, (CVPixelBufferRef *)buf);
  if (v28)
  {
    NSErrorUserInfoKey v47 = NSLocalizedDescriptionKey;
    uint64_t v29 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"[MADServicePublic] Failed to create CVPixelBuffer from specified IOSurface"));
    v48 = v29;
    v30 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v48,  &v47,  1LL));
    os_log_type_t v31 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  NSOSStatusErrorDomain,  v28,  v30));
    v16[2](v16, 0LL, v31);
  }

  else
  {
    uint64_t v29 = (void *)objc_claimAutoreleasedReturnValue( +[VCPMADServiceImageAsset assetWithPixelBuffer:orientation:identifier:clientBundleID:clientTeamID:]( &OBJC_CLASS___VCPMADServiceImageAsset,  "assetWithPixelBuffer:orientation:identifier:clientBundleID:clientTeamID:",  *(void *)buf,  v11,  v38,  self->_clientBundleID,  self->_clientTeamID));
    BOOL v32 = self->_userSafetyEntitled
       && +[MADUserSafetySettings isEnabledForTask:]( &OBJC_CLASS___MADUserSafetySettings,  "isEnabledForTask:",  self->_secTask.value_);
    [v29 setUserSafetyEligible:v32];
    v41[0] = _NSConcreteStackBlock;
    v41[1] = 3221225472LL;
    v41[2] = sub_100006310;
    v41[3] = &unk_1001B9A38;
    os_signpost_id_t v45 = v24;
    id v33 = v37;
    id v42 = v33;
    uint64_t v46 = 0LL;
    os_log_type_t v34 = v16;
    id v44 = v34;
    id v43 = v14;
    v35 = (void *)objc_claimAutoreleasedReturnValue( +[VCPMADServiceImageProcessingTask taskWithRequests:forAsset:cancelBlock:andCompletionHandler:]( &OBJC_CLASS___VCPMADServiceImageProcessingTask,  "taskWithRequests:forAsset:cancelBlock:andCompletionHandler:",  v43,  v29,  &stru_1001B9A10,  v41));
    [v35 setSignpostPayload:v33];
    queuingTaskScheduler = self->_queuingTaskScheduler;
    v39[0] = _NSConcreteStackBlock;
    v39[1] = 3221225472LL;
    v39[2] = sub_10000644C;
    v39[3] = &unk_1001B9A60;
    id v40 = v34;
    -[MADServiceClientTaskQueuingScheduler submitClientTask:withRequestID:schedulingErrorHandler:]( queuingTaskScheduler,  "submitClientTask:withRequestID:schedulingErrorHandler:",  v35,  (int)v9,  v39);

    v30 = v42;
  }

  sub_10000421C((const void **)buf);
  objc_autoreleasePoolPop(v21);
}

- (void)requestImageProcessing:(id)a3 forAssetURL:(id)a4 withSandboxToken:(id)a5 identifier:(id)a6 requestID:(int)a7 andReply:(id)a8
{
  uint64_t v9 = *(void *)&a7;
  id v14 = a3;
  id v40 = a4;
  id v15 = a5;
  id v41 = a6;
  v39 = (void (**)(id, void, void *))a8;
  if ((int)MediaAnalysisLogLevel(v39, v16) >= 6)
  {
    uint64_t v17 = VCPLogInstance();
    uint64_t v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(v17);
    os_log_type_t v19 = VCPLogToOSLogType[6];
    if (os_log_type_enabled(v18, v19))
    {
      *(_DWORD *)buf = 67109120;
      LODWORD(v55) = v9;
      _os_log_impl( (void *)&_mh_execute_header,  v18,  v19,  "[MADServicePublic] Received on-demand image processing request (URL) with MADRequestID %d",  buf,  8u);
    }
  }

  os_log_type_t v20 = objc_autoreleasePoolPush();
  id v38 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Request: %d Identifier: %@",  v9,  v41));
  id v37 = v15;
  uint64_t v21 = VCPSignPostLog();
  uint64_t v22 = (os_log_s *)objc_claimAutoreleasedReturnValue(v21);
  os_signpost_id_t v23 = os_signpost_id_generate(v22);

  uint64_t v24 = VCPSignPostLog();
  uint64_t v25 = (os_log_s *)objc_claimAutoreleasedReturnValue(v24);
  uint64_t v26 = v25;
  if (v23 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v25))
  {
    *(_DWORD *)buf = 138412290;
    v55 = v38;
    _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v26,  OS_SIGNPOST_INTERVAL_BEGIN,  v23,  "VCPMADServicePublicClientHandler_URL",  "%@",  buf,  0xCu);
  }

  int64_t v27 = -[VCPMADServicePublicClientHandler consumeSandboxExtension:url:](self, "consumeSandboxExtension:url:", v15, v40);
  if (v27 < 0)
  {
    NSErrorUserInfoKey v52 = NSLocalizedDescriptionKey;
    CVReturn v28 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"[MADServicePublic] Failed to consume sandbox extension"));
    v53 = v28;
    v30 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v53,  &v52,  1LL));
    os_log_type_t v31 = v37;
    BOOL v32 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  NSOSStatusErrorDomain,  -50LL,  v30));
    v39[2](v39, 0LL, v32);
  }

  else
  {
    CVReturn v28 = (void *)objc_claimAutoreleasedReturnValue( +[VCPMADServiceImageAsset assetWithURL:identifier:clientBundleID:clientTeamID:]( &OBJC_CLASS___VCPMADServiceImageAsset,  "assetWithURL:identifier:clientBundleID:clientTeamID:",  v40,  v41,  self->_clientBundleID,  self->_clientTeamID));
    BOOL v29 = self->_userSafetyEntitled
       && +[MADUserSafetySettings isEnabledForTask:]( &OBJC_CLASS___MADUserSafetySettings,  "isEnabledForTask:",  self->_secTask.value_);
    [v28 setUserSafetyEligible:v29];
    v45[0] = _NSConcreteStackBlock;
    v45[1] = 3221225472LL;
    v45[2] = sub_100006984;
    v45[3] = &unk_1001B9AA8;
    os_signpost_id_t v49 = v23;
    id v33 = v38;
    id v46 = v33;
    uint64_t v50 = 0LL;
    os_log_type_t v34 = v39;
    id v48 = v34;
    id v47 = v14;
    int64_t v51 = v27;
    v35 = (void *)objc_claimAutoreleasedReturnValue( +[VCPMADServiceImageProcessingTask taskWithRequests:forAsset:cancelBlock:andCompletionHandler:]( &OBJC_CLASS___VCPMADServiceImageProcessingTask,  "taskWithRequests:forAsset:cancelBlock:andCompletionHandler:",  v47,  v28,  &stru_1001B9A80,  v45));
    [v35 setSignpostPayload:v33];
    queuingTaskScheduler = self->_queuingTaskScheduler;
    v42[0] = _NSConcreteStackBlock;
    v42[1] = 3221225472LL;
    v42[2] = sub_100006AC8;
    v42[3] = &unk_1001B9AD0;
    id v43 = v34;
    int64_t v44 = v27;
    -[MADServiceClientTaskQueuingScheduler submitClientTask:withRequestID:schedulingErrorHandler:]( queuingTaskScheduler,  "submitClientTask:withRequestID:schedulingErrorHandler:",  v35,  (int)v9,  v42);

    os_log_type_t v31 = v37;
    v30 = v46;
  }

  objc_autoreleasePoolPop(v20);
}

- (void)requestVideoProcessing:(id)a3 assetURL:(id)a4 sandboxToken:(id)a5 identifier:(id)a6 requestID:(int)a7 reply:(id)a8
{
  uint64_t v9 = *(void *)&a7;
  id v14 = a3;
  id v37 = a4;
  id v36 = a5;
  id v15 = a6;
  v35 = (void (**)(id, void, void *))a8;
  id v33 = v15;
  os_log_type_t v34 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Request: %d Identifier: %@",  v9,  v15));
  uint64_t v16 = VCPSignPostLog();
  uint64_t v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);
  os_signpost_id_t v18 = os_signpost_id_generate(v17);

  uint64_t v19 = VCPSignPostLog();
  os_log_type_t v20 = (os_log_s *)objc_claimAutoreleasedReturnValue(v19);
  uint64_t v21 = v20;
  if (v18 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v20))
  {
    *(_DWORD *)buf = 138412290;
    NSErrorUserInfoKey v52 = v34;
    _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v21,  OS_SIGNPOST_INTERVAL_BEGIN,  v18,  "VCPMADServicePublicClientHandler_VideoE2E",  "%@",  buf,  0xCu);
  }

  int64_t v22 = -[VCPMADServicePublicClientHandler consumeSandboxExtension:url:](self, "consumeSandboxExtension:url:", v36, v37);
  if (v22 < 0)
  {
    NSErrorUserInfoKey v49 = NSLocalizedDescriptionKey;
    uint64_t v26 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"[MADServicePublic] Failed to consume sandbox extension"));
    uint64_t v50 = v26;
    int64_t v27 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v50,  &v49,  1LL));
    CVReturn v28 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  NSOSStatusErrorDomain,  -50LL,  v27));
    v35[2](v35, 0LL, v28);
  }

  else
  {
    v47[0] = _NSConcreteStackBlock;
    v47[1] = 3221225472LL;
    v47[2] = sub_100006FDC;
    v47[3] = &unk_1001B9AF8;
    v47[4] = self;
    int v48 = v9;
    os_signpost_id_t v23 = objc_retainBlock(v47);
    uint64_t v24 = (void *)objc_claimAutoreleasedReturnValue( +[MADServiceVideoAsset assetWithURL:identifier:clientBundleID:clientTeamID:]( &OBJC_CLASS___MADServiceVideoAsset,  "assetWithURL:identifier:clientBundleID:clientTeamID:",  v37,  v33,  self->_clientBundleID,  self->_clientTeamID));
    BOOL v25 = self->_userSafetyEntitled
       && +[MADUserSafetySettings isEnabledForTask:]( &OBJC_CLASS___MADUserSafetySettings,  "isEnabledForTask:",  self->_secTask.value_);
    [v24 setUserSafetyEligible:v25];
    v41[0] = _NSConcreteStackBlock;
    v41[1] = 3221225472LL;
    v41[2] = sub_100007000;
    v41[3] = &unk_1001B9B40;
    os_signpost_id_t v44 = v18;
    id v29 = v34;
    id v42 = v29;
    uint64_t v45 = 0LL;
    v30 = v35;
    id v43 = v30;
    int64_t v46 = v22;
    os_log_type_t v31 = (void *)objc_claimAutoreleasedReturnValue( +[MADServiceVideoProcessingTask taskWithRequests:forAsset:cancelBlock:progressHandler:resultHandler:andCompletionHandler:]( &OBJC_CLASS___MADServiceVideoProcessingTask,  "taskWithRequests:forAsset:cancelBlock:progressHandler:resultHandler:andCompletionHandler:",  v14,  v24,  &stru_1001B9B18,  v23,  0LL,  v41));
    [v31 setSignpostPayload:v29];
    queuingTaskScheduler = self->_queuingTaskScheduler;
    v38[0] = _NSConcreteStackBlock;
    v38[1] = 3221225472LL;
    v38[2] = sub_10000715C;
    v38[3] = &unk_1001B9AD0;
    v39 = v30;
    int64_t v40 = v22;
    -[MADServiceClientTaskQueuingScheduler submitClientTask:withRequestID:schedulingErrorHandler:]( queuingTaskScheduler,  "submitClientTask:withRequestID:schedulingErrorHandler:",  v31,  (int)v9,  v38);
  }
}

- (void)currentOutstandingTasksWithReply:(id)a3
{
  id v4 = (void (**)(id, unint64_t))a3;
  v4[2]( v4,  -[MADServiceClientTaskQueuingScheduler currentOutstandingTasks]( self->_queuingTaskScheduler,  "currentOutstandingTasks"));
}

- (void)cancelRequest:(int)a3
{
  if ((int)MediaAnalysisLogLevel(self, a2) >= 6)
  {
    uint64_t v5 = VCPLogInstance();
    id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
    os_log_type_t v7 = VCPLogToOSLogType[6];
    if (os_log_type_enabled(v6, v7))
    {
      int v13 = 67109120;
      int v14 = a3;
      _os_log_impl( (void *)&_mh_execute_header,  v6,  v7,  "[MADServicePublic] Service received call to cancel task for MADRequestID %d",  (uint8_t *)&v13,  8u);
    }
  }

  id v8 = -[MADServiceClientTaskQueuingScheduler cancelTaskWithRequestID:]( self->_queuingTaskScheduler,  "cancelTaskWithRequestID:",  a3);
  if ((int)MediaAnalysisLogLevel(v8, v9) >= 6)
  {
    uint64_t v10 = VCPLogInstance();
    uint64_t v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
    os_log_type_t v12 = VCPLogToOSLogType[6];
    if (os_log_type_enabled(v11, v12))
    {
      int v13 = 67109120;
      int v14 = a3;
      _os_log_impl( (void *)&_mh_execute_header,  v11,  v12,  "[MADServicePublic] Canceled task for MADRequestID %d ",  (uint8_t *)&v13,  8u);
    }
  }

- (void)cancelAllRequests
{
  if ((int)MediaAnalysisLogLevel(self, a2) >= 6)
  {
    uint64_t v3 = VCPLogInstance();
    id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
    os_log_type_t v5 = VCPLogToOSLogType[6];
    if (os_log_type_enabled(v4, v5))
    {
      LOWORD(v11) = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v4,  v5,  "[MADServicePublic] Service received call to cancel all tasks",  (uint8_t *)&v11,  2u);
    }
  }

  unint64_t v6 = -[MADServiceClientTaskQueuingScheduler cancelAllTasks](self->_queuingTaskScheduler, "cancelAllTasks");
  if ((int)MediaAnalysisLogLevel(v6, v7) >= 6)
  {
    uint64_t v8 = VCPLogInstance();
    uint64_t v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
    os_log_type_t v10 = VCPLogToOSLogType[6];
    if (os_log_type_enabled(v9, v10))
    {
      int v11 = 134217984;
      unint64_t v12 = v6;
      _os_log_impl( (void *)&_mh_execute_header,  v9,  v10,  "[MADServicePublic] Service canceled all %lu tasks",  (uint8_t *)&v11,  0xCu);
    }
  }

- (void)queryUserSafetyEnablement:(id)a3
{
  id v4 = (void (**)(id, void, void *))a3;
  if (!self->_userSafetyEntitled)
  {
    NSErrorUserInfoKey v9 = NSLocalizedDescriptionKey;
    os_log_type_t v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Client not entitled to query User Safety enablement"));
    os_log_type_t v10 = v5;
    unint64_t v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v10,  &v9,  1LL));
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  NSOSStatusErrorDomain,  -18LL,  v6));
    v4[2](v4, 0LL, v7);
  }

  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInteger:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedInteger:",  +[MADUserSafetySettings policyForTask:]( &OBJC_CLASS___MADUserSafetySettings,  "policyForTask:",  self->_secTask.value_)));
  ((void (**)(id, void *, void *))v4)[2](v4, v8, 0LL);
}

- (void)submitSpotlightAssetURL:(id)a3 uniqueIdentifier:(id)a4 bundleIdentifier:(id)a5 typeIdentifier:(id)a6 sandboxToken:(id)a7 reply:(id)a8
{
  uint64_t v8 = (void (**)(id, void *))a8;
  if ((int)MediaAnalysisLogLevel(v8, v9) >= 3)
  {
    uint64_t v10 = VCPLogInstance();
    int v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
    os_log_type_t v12 = VCPLogToOSLogType[3];
    if (os_log_type_enabled(v11, v12))
    {
      *(_WORD *)uint64_t v16 = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v11,  v12,  "[MADServicePublic] Unsupported platform for Spotlight processing",  v16,  2u);
    }
  }

  NSErrorUserInfoKey v17 = NSLocalizedDescriptionKey;
  int v13 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"[MADServicePublic] Unsupported platform for Spotlight processing"));
  os_signpost_id_t v18 = v13;
  int v14 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v18,  &v17,  1LL));
  id v15 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  NSOSStatusErrorDomain,  -50LL,  v14));
  v8[2](v8, v15);
}

- (void)requestTextPrewarming:(id)a3 requestID:(int)a4 reply:(id)a5
{
  uint64_t v6 = *(void *)&a4;
  id v8 = a3;
  id v9 = a5;
  if ((int)MediaAnalysisLogLevel(v9, v10) >= 6)
  {
    uint64_t v11 = VCPLogInstance();
    os_log_type_t v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
    os_log_type_t v13 = VCPLogToOSLogType[6];
    if (os_log_type_enabled(v12, v13))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v12,  v13,  "[MADServicePublic] Received text pre-warming request",  buf,  2u);
    }
  }

  int v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"Request: %d", v6));
  uint64_t v15 = VCPSignPostLog();
  uint64_t v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(v15);
  os_signpost_id_t v17 = os_signpost_id_generate(v16);

  uint64_t v18 = VCPSignPostLog();
  uint64_t v19 = (os_log_s *)objc_claimAutoreleasedReturnValue(v18);
  os_log_type_t v20 = v19;
  if (v17 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v19))
  {
    *(_DWORD *)buf = 138412290;
    id v36 = v14;
    _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v20,  OS_SIGNPOST_INTERVAL_BEGIN,  v17,  "VCPMADServicePublicClientHandler_TextPrewarmingE2E",  "%@",  buf,  0xCu);
  }

  id v21 = objc_alloc(&OBJC_CLASS___MADServiceTextPrewarmingTask);
  v30[0] = _NSConcreteStackBlock;
  v30[1] = 3221225472LL;
  v30[2] = sub_100007AE4;
  v30[3] = &unk_1001B9B88;
  os_signpost_id_t v33 = v17;
  id v22 = v14;
  id v31 = v22;
  uint64_t v34 = 0LL;
  id v23 = v9;
  id v32 = v23;
  id v24 = [v21 initWithRequests:v8 cancelBlock:&stru_1001B9B60 completionHandler:v30];
  [v24 setSignpostPayload:v22];
  queuingTaskScheduler = self->_queuingTaskScheduler;
  uint64_t v26 = (int)v6;
  v28[0] = _NSConcreteStackBlock;
  v28[1] = 3221225472LL;
  v28[2] = sub_100007C04;
  v28[3] = &unk_1001B9A60;
  id v27 = v23;
  id v29 = v27;
  -[MADServiceClientTaskQueuingScheduler submitClientTask:withRequestID:schedulingErrorHandler:]( queuingTaskScheduler,  "submitClientTask:withRequestID:schedulingErrorHandler:",  v24,  v26,  v28);
}

- (void)requestTextProcessing:(id)a3 textInputs:(id)a4 requestID:(int)a5 reply:(id)a6
{
  uint64_t v7 = *(void *)&a5;
  id v31 = a3;
  id v10 = a4;
  id v11 = a6;
  if ((int)MediaAnalysisLogLevel(v11, v12) >= 6)
  {
    uint64_t v13 = VCPLogInstance();
    int v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
    os_log_type_t v15 = VCPLogToOSLogType[6];
    if (os_log_type_enabled(v14, v15))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v14,  v15,  "[MADServicePublic] Received text processing request",  buf,  2u);
    }
  }

  uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"Request: %d", v7));
  uint64_t v17 = VCPSignPostLog();
  uint64_t v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(v17);
  os_signpost_id_t v19 = os_signpost_id_generate(v18);

  uint64_t v20 = VCPSignPostLog();
  id v21 = (os_log_s *)objc_claimAutoreleasedReturnValue(v20);
  id v22 = v21;
  if (v19 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v21))
  {
    *(_DWORD *)buf = 138412290;
    int64_t v40 = v16;
    _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v22,  OS_SIGNPOST_INTERVAL_BEGIN,  v19,  "VCPMADServicePublicClientHandler_TextProcessingE2E",  "%@",  buf,  0xCu);
  }

  id v23 = (void *)objc_claimAutoreleasedReturnValue( +[MADServiceTextAsset assetWithTextInputs:clientBundleID:clientTeamID:]( &OBJC_CLASS___MADServiceTextAsset,  "assetWithTextInputs:clientBundleID:clientTeamID:",  v10,  self->_clientBundleID,  self->_clientTeamID));
  id v24 = objc_alloc(&OBJC_CLASS___MADServiceTextProcessingTask);
  v34[0] = _NSConcreteStackBlock;
  v34[1] = 3221225472LL;
  v34[2] = sub_100007F9C;
  v34[3] = &unk_1001B9BD0;
  os_signpost_id_t v37 = v19;
  id v25 = v16;
  id v35 = v25;
  uint64_t v38 = 0LL;
  id v26 = v11;
  id v36 = v26;
  id v27 = [v24 initWithRequests:v31 asset:v23 cancelBlock:&stru_1001B9BA8 completionHandler:v34];
  [v27 setSignpostPayload:v25];
  queuingTaskScheduler = self->_queuingTaskScheduler;
  uint64_t v29 = (int)v7;
  v32[0] = _NSConcreteStackBlock;
  v32[1] = 3221225472LL;
  v32[2] = sub_1000080DC;
  v32[3] = &unk_1001B9A60;
  id v30 = v26;
  id v33 = v30;
  -[MADServiceClientTaskQueuingScheduler submitClientTask:withRequestID:schedulingErrorHandler:]( queuingTaskScheduler,  "submitClientTask:withRequestID:schedulingErrorHandler:",  v27,  v29,  v32);
}

- (void)requestMultiModalPrewarming:(id)a3 requestID:(int)a4 reply:(id)a5
{
  uint64_t v6 = *(void *)&a4;
  id v8 = a3;
  id v9 = a5;
  if ((int)MediaAnalysisLogLevel(v9, v10) >= 6)
  {
    uint64_t v11 = VCPLogInstance();
    uint64_t v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
    os_log_type_t v13 = VCPLogToOSLogType[6];
    if (os_log_type_enabled(v12, v13))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v12,  v13,  "[MADServicePublic] Received multi-modal pre-warming request",  buf,  2u);
    }
  }

  int v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"Request: %d", v6));
  uint64_t v15 = VCPSignPostLog();
  uint64_t v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(v15);
  os_signpost_id_t v17 = os_signpost_id_generate(v16);

  uint64_t v18 = VCPSignPostLog();
  os_signpost_id_t v19 = (os_log_s *)objc_claimAutoreleasedReturnValue(v18);
  uint64_t v20 = v19;
  if (v17 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v19))
  {
    *(_DWORD *)buf = 138412290;
    id v36 = v14;
    _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v20,  OS_SIGNPOST_INTERVAL_BEGIN,  v17,  "VCPMADServicePublicClientHandler_MultiModalPrewarmingE2E",  "%@",  buf,  0xCu);
  }

  id v21 = objc_alloc(&OBJC_CLASS___MADMultiModalPrewarmingTask);
  v30[0] = _NSConcreteStackBlock;
  v30[1] = 3221225472LL;
  v30[2] = sub_1000083F4;
  v30[3] = &unk_1001B9B88;
  os_signpost_id_t v33 = v17;
  id v22 = v14;
  id v31 = v22;
  uint64_t v34 = 0LL;
  id v23 = v9;
  id v32 = v23;
  id v24 = [v21 initWithRequests:v8 cancelBlock:&stru_1001B9BF0 completionHandler:v30];
  [v24 setSignpostPayload:v22];
  queuingTaskScheduler = self->_queuingTaskScheduler;
  uint64_t v26 = (int)v6;
  v28[0] = _NSConcreteStackBlock;
  v28[1] = 3221225472LL;
  v28[2] = sub_100008514;
  v28[3] = &unk_1001B9A60;
  id v27 = v23;
  id v29 = v27;
  -[MADServiceClientTaskQueuingScheduler submitClientTask:withRequestID:schedulingErrorHandler:]( queuingTaskScheduler,  "submitClientTask:withRequestID:schedulingErrorHandler:",  v24,  v26,  v28);
}

- (void)requestProcessing:(id)a3 multiModalInputs:(id)a4 requestID:(int)a5 reply:(id)a6
{
  uint64_t v7 = *(void *)&a5;
  id v30 = a3;
  id v10 = a4;
  id v11 = a6;
  if ((int)MediaAnalysisLogLevel(v11, v12) >= 6)
  {
    uint64_t v13 = VCPLogInstance();
    int v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
    os_log_type_t v15 = VCPLogToOSLogType[6];
    if (os_log_type_enabled(v14, v15))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v14,  v15,  "[MADServicePublic] Received multi-modal processing request",  buf,  2u);
    }
  }

  uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"Request: %d", v7));
  uint64_t v17 = VCPSignPostLog();
  uint64_t v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(v17);
  os_signpost_id_t v19 = os_signpost_id_generate(v18);

  uint64_t v20 = VCPSignPostLog();
  id v21 = (os_log_s *)objc_claimAutoreleasedReturnValue(v20);
  id v22 = v21;
  if (v19 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v21))
  {
    *(_DWORD *)buf = 138412290;
    v39 = v16;
    _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v22,  OS_SIGNPOST_INTERVAL_BEGIN,  v19,  "VCPMADServicePublicClientHandler_MultiModalProcessingE2E",  "%@",  buf,  0xCu);
  }

  id v23 = objc_alloc(&OBJC_CLASS___MADMultiModalProcessingTask);
  v33[0] = _NSConcreteStackBlock;
  v33[1] = 3221225472LL;
  v33[2] = sub_10000884C;
  v33[3] = &unk_1001B9BD0;
  os_signpost_id_t v36 = v19;
  id v24 = v16;
  id v34 = v24;
  uint64_t v37 = 0LL;
  id v25 = v11;
  id v35 = v25;
  id v26 = [v23 initWithRequests:v30 inputs:v10 cancelBlock:&stru_1001B9C10 completionHandler:v33];
  [v26 setSignpostPayload:v24];
  queuingTaskScheduler = self->_queuingTaskScheduler;
  uint64_t v28 = (int)v7;
  v31[0] = _NSConcreteStackBlock;
  v31[1] = 3221225472LL;
  v31[2] = sub_10000898C;
  v31[3] = &unk_1001B9A60;
  id v29 = v25;
  id v32 = v29;
  -[MADServiceClientTaskQueuingScheduler submitClientTask:withRequestID:schedulingErrorHandler:]( queuingTaskScheduler,  "submitClientTask:withRequestID:schedulingErrorHandler:",  v26,  v28,  v31);
}

- (void).cxx_destruct
{
}

- (id).cxx_construct
{
  *((void *)self + 4) = 0LL;
  return self;
}

@end