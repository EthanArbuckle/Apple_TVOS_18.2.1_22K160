@interface MADComputeServiceClientHandler
+ (id)clientHandlerWithXPCConnection:(id)a3;
- (MADComputeServiceClientHandler)initWithXPCConnection:(id)a3;
- (void)_storeComputeServiceRequests:(id)a3 assetURLs:(id)a4 extensionData:(id)a5 resultDirectoryURL:(id)a6 resultExtensionData:(id)a7 requestID:(id)a8;
- (void)_storeComputeServiceRequests:(id)a3 localIdentifiers:(id)a4 photoLibraryURL:(id)a5 resultDirectoryURL:(id)a6 resultExtensionData:(id)a7 requestID:(id)a8;
- (void)cancelAllRequests;
- (void)cancelWithRequestID:(id)a3;
- (void)removeWithRequestID:(id)a3 reply:(id)a4;
- (void)requestProcessing:(id)a3 assetURLs:(id)a4 extensionData:(id)a5 resultDirectoryURL:(id)a6 resultExtensionData:(id)a7 requestID:(id)a8 reply:(id)a9;
- (void)requestProcessing:(id)a3 localIdentifiers:(id)a4 photoLibraryURL:(id)a5 resultDirectoryURL:(id)a6 resultExtensionData:(id)a7 requestID:(id)a8 reply:(id)a9;
- (void)resumeWithRequestID:(id)a3 reply:(id)a4;
- (void)scheduleProcessing:(id)a3 assetURLs:(id)a4 extensionData:(id)a5 resultDirectoryURL:(id)a6 resultExtensionData:(id)a7 requestID:(id)a8 reply:(id)a9;
- (void)scheduleProcessing:(id)a3 localIdentifiers:(id)a4 photoLibraryURL:(id)a5 resultDirectoryURL:(id)a6 resultExtensionData:(id)a7 requestID:(id)a8 reply:(id)a9;
@end

@implementation MADComputeServiceClientHandler

- (MADComputeServiceClientHandler)initWithXPCConnection:(id)a3
{
  id v44 = a3;
  v56.receiver = self;
  v56.super_class = (Class)&OBJC_CLASS___MADComputeServiceClientHandler;
  v5 = -[MADComputeServiceClientHandler init](&v56, "init");
  v6 = v5;
  if (v5)
  {
    p_connection = (id *)&v5->_connection;
    objc_storeStrong((id *)&v5->_connection, a3);
    [*p_connection setExportedObject:v6];
    v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSXPCInterface interfaceWithProtocol:]( &OBJC_CLASS___NSXPCInterface,  "interfaceWithProtocol:",  &OBJC_PROTOCOL___MADComputeServiceClientProtocol));
    [*p_connection setRemoteObjectInterface:v8];

    v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSXPCInterface interfaceWithProtocol:]( &OBJC_CLASS___NSXPCInterface,  "interfaceWithProtocol:",  &OBJC_PROTOCOL___MADComputeServiceServerProtocol));
    [*p_connection setExportedInterface:v9];

    v10 = (void *)objc_claimAutoreleasedReturnValue([*p_connection remoteObjectInterface]);
    +[MADComputeService configureClientInterface:](&OBJC_CLASS___MADComputeService, "configureClientInterface:", v10);

    v11 = (void *)objc_claimAutoreleasedReturnValue([*p_connection exportedInterface]);
    +[MADComputeService configureServerInterface:](&OBJC_CLASS___MADComputeService, "configureServerInterface:", v11);

    objc_initWeak(&location, v6);
    id v12 = *p_connection;
    v52[0] = _NSConcreteStackBlock;
    v52[1] = 3221225472LL;
    v52[2] = sub_10008CDB8;
    v52[3] = &unk_1001BC2A8;
    v13 = v6;
    v53 = v13;
    objc_copyWeak(&v54, &location);
    [v12 setInterruptionHandler:v52];
    id v14 = *p_connection;
    v49[0] = _NSConcreteStackBlock;
    v49[1] = 3221225472LL;
    v49[2] = sub_10008CE84;
    v49[3] = &unk_1001BC2A8;
    v15 = v13;
    v50 = v15;
    objc_copyWeak(&v51, &location);
    [v14 setInvalidationHandler:v49];
    uint64_t v16 = objc_claimAutoreleasedReturnValue([*p_connection synchronousRemoteObjectProxyWithErrorHandler:&stru_1001BC2C8]);
    clientProxy = v15->_clientProxy;
    v15->_clientProxy = (MADComputeServiceClientProtocol *)v16;

    dispatch_group_t v18 = dispatch_group_create();
    resultsHandlerGroup = v15->_resultsHandlerGroup;
    v15->_resultsHandlerGroup = (OS_dispatch_group *)v18;

    v47 = 0LL;
    CFTypeRef cf = 0LL;
    if (*p_connection) {
      [*p_connection auditToken];
    }
    else {
      memset(&token, 0, sizeof(token));
    }
    SecTaskRef v20 = SecTaskCreateWithAuditToken(0LL, &token);
    SecTaskRef v46 = v20;
    if (cf)
    {
      CFRelease(cf);
      CFTypeRef cf = 0LL;
    }

    CFStringRef v21 = SecTaskCopySigningIdentifier(v20, (CFErrorRef *)&cf);
    clientBundleID = v15->_clientBundleID;
    v15->_clientBundleID = &v21->isa;

    SecTaskRef v23 = v46;
    if (v47)
    {
      CFRelease(v47);
      v47 = 0LL;
    }

    uint64_t v24 = SecTaskCopyTeamIdentifier(v23, &v47);
    clientTeamID = v15->_clientTeamID;
    v15->_clientTeamID = (NSString *)v24;

    if (cf)
    {
      uint64_t v26 = MediaAnalysisLogLevel(v26, v27);
      if ((int)v26 >= 4)
      {
        uint64_t v28 = VCPLogInstance(v26, v27);
        v29 = (os_log_s *)objc_claimAutoreleasedReturnValue(v28);
        os_log_type_t v30 = VCPLogToOSLogType[4];
        if (os_log_type_enabled(v29, v30))
        {
          *(_DWORD *)buf = 138412290;
          CFTypeRef v58 = cf;
          _os_log_impl( (void *)&_mh_execute_header,  v29,  v30,  "[MADComputeServiceClientHandler] Failed to query client bundle ID (%@)",  buf,  0xCu);
        }
      }
    }

    if (v47)
    {
      uint64_t v26 = MediaAnalysisLogLevel(v26, v27);
      if ((int)v26 >= 4)
      {
        uint64_t v31 = VCPLogInstance(v26, v27);
        v32 = (os_log_s *)objc_claimAutoreleasedReturnValue(v31);
        os_log_type_t v33 = VCPLogToOSLogType[4];
        if (os_log_type_enabled(v32, v33))
        {
          *(_DWORD *)buf = 138412290;
          CFTypeRef v58 = v47;
          _os_log_impl( (void *)&_mh_execute_header,  v32,  v33,  "[MADComputeServiceClientHandler] Failed to query client team ID (%@)",  buf,  0xCu);
        }
      }
    }

    uint64_t v34 = MediaAnalysisLogLevel(v26, v27);
    if ((int)v34 >= 6)
    {
      uint64_t v36 = VCPLogInstance(v34, v35);
      v37 = (os_log_s *)objc_claimAutoreleasedReturnValue(v36);
      os_log_type_t v38 = VCPLogToOSLogType[6];
      if (os_log_type_enabled(v37, v38))
      {
        v39 = v15->_clientBundleID;
        v40 = v15->_clientTeamID;
        *(_DWORD *)buf = 138412546;
        CFTypeRef v58 = v39;
        __int16 v59 = 2112;
        v60 = v40;
        _os_log_impl( (void *)&_mh_execute_header,  v37,  v38,  "[MADComputeServiceClientHandler] Client BundleID: %@ TeamID: %@",  buf,  0x16u);
      }
    }

    v41 = -[MADServiceClientTaskQueuingScheduler initWithClientBundleID:]( objc_alloc(&OBJC_CLASS___MADServiceClientTaskQueuingScheduler),  "initWithClientBundleID:",  v15->_clientBundleID);
    queuingTaskScheduler = v15->_queuingTaskScheduler;
    v15->_queuingTaskScheduler = v41;

    sub_10000421C((const void **)&v46);
    sub_10000421C(&v47);
    sub_10000421C(&cf);
    objc_destroyWeak(&v51);

    objc_destroyWeak(&v54);
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

- (void)_storeComputeServiceRequests:(id)a3 assetURLs:(id)a4 extensionData:(id)a5 resultDirectoryURL:(id)a6 resultExtensionData:(id)a7 requestID:(id)a8
{
  id v29 = a3;
  id v14 = a4;
  id v34 = a5;
  id v32 = a6;
  id v33 = a7;
  id v35 = a8;
  unint64_t v30 = 0LL;
  os_log_type_t type = VCPLogToOSLogType[6];
  while (v30 < (unint64_t)[v29 count])
  {
    context = objc_autoreleasePoolPush();
    v15 = (void *)objc_claimAutoreleasedReturnValue([v29 objectAtIndexedSubscript:v30]);
    for (unint64_t i = 0; i < (unint64_t)[v14 count]; ++i)
    {
      v17 = objc_autoreleasePoolPush();
      dispatch_group_t v18 = (void *)objc_claimAutoreleasedReturnValue([v14 objectAtIndexedSubscript:i]);
      v19 = (void *)objc_claimAutoreleasedReturnValue([v34 objectAtIndexedSubscript:i]);
      clientBundleID = self->_clientBundleID;
      id v36 = 0LL;
      CFStringRef v21 = (void *)objc_claimAutoreleasedReturnValue( +[MADManagedRequest entryWithRequestID:bundleIdentifier:sourceIdentifier:assetIdentifier:assetURL:assetURLExtension:resultDirectoryURL:resultDirectoryURLExtension:request:error:]( &OBJC_CLASS___MADManagedRequest,  "entryWithRequestID:bundleIdentifier:sourceIdentifier:assetIdentifier:assetURL:assetURLExtension: resultDirectoryURL:resultDirectoryURLExtension:request:error:",  v35,  clientBundleID,  @"FileSystem",  0LL,  v18,  v19,  v32,  v33,  v15,  &v36));
      id v22 = v36;
      uint64_t v24 = MediaAnalysisLogLevel(v22, v23);
      if ((int)v24 >= 6)
      {
        uint64_t v26 = VCPLogInstance(v24, v25);
        uint64_t v27 = (os_log_s *)objc_claimAutoreleasedReturnValue(v26);
        if (os_log_type_enabled(v27, type))
        {
          *(_DWORD *)buf = 138412290;
          os_log_type_t v38 = v21;
          _os_log_impl( (void *)&_mh_execute_header,  v27,  type,  "[MADComputeServiceClientHandler] Added to schedule with MADRequest %@",  buf,  0xCu);
        }
      }

      objc_autoreleasePoolPop(v17);
    }

    objc_autoreleasePoolPop(context);
    ++v30;
  }
}

- (void)_storeComputeServiceRequests:(id)a3 localIdentifiers:(id)a4 photoLibraryURL:(id)a5 resultDirectoryURL:(id)a6 resultExtensionData:(id)a7 requestID:(id)a8
{
  id v31 = a3;
  id v14 = a4;
  id v35 = a5;
  id v33 = a6;
  id v34 = a7;
  id v36 = a8;
  unint64_t v32 = 0LL;
  os_log_type_t v15 = VCPLogToOSLogType[6];
  while (v32 < (unint64_t)[v31 count])
  {
    context = objc_autoreleasePoolPush();
    uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue([v31 objectAtIndexedSubscript:v32]);
    for (unint64_t i = 0; i < (unint64_t)[v14 count]; ++i)
    {
      dispatch_group_t v18 = objc_autoreleasePoolPush();
      v19 = (void *)objc_claimAutoreleasedReturnValue([v14 objectAtIndexedSubscript:i]);
      clientBundleID = self->_clientBundleID;
      CFStringRef v21 = (void *)objc_claimAutoreleasedReturnValue([v35 path]);
      id v37 = 0LL;
      id v22 = (void *)objc_claimAutoreleasedReturnValue( +[MADManagedRequest entryWithRequestID:bundleIdentifier:sourceIdentifier:assetIdentifier:assetURL:assetURLExtension:resultDirectoryURL:resultDirectoryURLExtension:request:error:]( &OBJC_CLASS___MADManagedRequest,  "entryWithRequestID:bundleIdentifier:sourceIdentifier:assetIdentifier:assetURL:assetURLExtension: resultDirectoryURL:resultDirectoryURLExtension:request:error:",  v36,  clientBundleID,  v21,  v19,  0LL,  0LL,  v33,  v34,  v16,  &v37));
      id v23 = v37;

      uint64_t v26 = MediaAnalysisLogLevel(v24, v25);
      if ((int)v26 >= 6)
      {
        uint64_t v28 = VCPLogInstance(v26, v27);
        id v29 = (os_log_s *)objc_claimAutoreleasedReturnValue(v28);
        if (os_log_type_enabled(v29, v15))
        {
          *(_DWORD *)buf = 138412290;
          v39 = v22;
          _os_log_impl( (void *)&_mh_execute_header,  v29,  v15,  "[MADComputeServiceClientHandler] Added to schedule with MADRequest %@",  buf,  0xCu);
        }
      }

      objc_autoreleasePoolPop(v18);
    }

    objc_autoreleasePoolPop(context);
    ++v32;
  }
}

- (void)requestProcessing:(id)a3 assetURLs:(id)a4 extensionData:(id)a5 resultDirectoryURL:(id)a6 resultExtensionData:(id)a7 requestID:(id)a8 reply:(id)a9
{
  id v42 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  id v43 = a7;
  id v18 = a8;
  id v37 = (void (**)(id, void *))a9;
  v54[0] = _NSConcreteStackBlock;
  v54[1] = 3221225472LL;
  v54[2] = sub_10008DBA4;
  v54[3] = &unk_1001BC2F0;
  v54[4] = self;
  id v19 = v18;
  id v55 = v19;
  v40 = objc_retainBlock(v54);
  v52[0] = _NSConcreteStackBlock;
  v52[1] = 3221225472LL;
  v52[2] = sub_10008DBB8;
  v52[3] = &unk_1001BC340;
  void v52[4] = self;
  id v44 = v19;
  id v53 = v44;
  v41 = objc_retainBlock(v52);
  id v20 = [v15 count];
  BOOL v21 = v20 == [v16 count];
  id v22 = v44;
  if (!v21)
  {
    NSErrorUserInfoKey v56 = NSLocalizedDescriptionKey;
    id v23 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Asset URLs and sandbox extension data count mismatches!"));
    v57 = v23;
    uint64_t v24 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v57,  &v56,  1LL));
    uint64_t v25 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  NSOSStatusErrorDomain,  -18LL,  v24));

    v37[2](v37, v25);
    id v22 = v44;
  }

  uint64_t v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate now](&OBJC_CLASS___NSDate, "now"));
  -[MADComputeServiceClientHandler _storeComputeServiceRequests:assetURLs:extensionData:resultDirectoryURL:resultExtensionData:requestID:]( self,  "_storeComputeServiceRequests:assetURLs:extensionData:resultDirectoryURL:resultExtensionData:requestID:",  v42,  v15,  v16,  v17,  v43,  v22);
  for (unint64_t i = 0; i < (unint64_t)[v15 count]; ++i)
  {
    uint64_t v28 = (void *)objc_claimAutoreleasedReturnValue([v15 objectAtIndexedSubscript:i]);
    id v29 = (void *)objc_claimAutoreleasedReturnValue([v16 objectAtIndexedSubscript:i]);
    _CFURLAttachSecurityScopeToFileURL(v28, v29);
  }

  _CFURLAttachSecurityScopeToFileURL(v17, v43);
  v47[0] = _NSConcreteStackBlock;
  v47[1] = 3221225472LL;
  v47[2] = sub_10008E094;
  v47[3] = &unk_1001BC368;
  v47[4] = self;
  id v30 = v26;
  id v48 = v30;
  id v38 = v42;
  id v49 = v38;
  id v39 = v15;
  id v50 = v39;
  id v31 = v37;
  id v51 = v31;
  unint64_t v32 = objc_retainBlock(v47);
  id v33 = (void *)objc_claimAutoreleasedReturnValue( +[MADComputeServiceProcessingTask taskWithRequests:requestID:assetURLs:resultDirectoryURL:cancelBlock:progressHandler:resultsHandler:completionHandler:]( &OBJC_CLASS___MADComputeServiceProcessingTask,  "taskWithRequests:requestID:assetURLs:resultDirectoryURL:cancelBlock:progressHandler:resultsHandler:c ompletionHandler:",  v38,  v44,  v39,  v17,  0LL,  v40,  v41,  v32));
  queuingTaskScheduler = self->_queuingTaskScheduler;
  id v35 = [v44 hash];
  v45[0] = _NSConcreteStackBlock;
  v45[1] = 3221225472LL;
  v45[2] = sub_10008E410;
  v45[3] = &unk_1001B9A60;
  id v36 = v31;
  SecTaskRef v46 = v36;
  -[MADServiceClientTaskQueuingScheduler submitClientTask:withRequestID:schedulingErrorHandler:]( queuingTaskScheduler,  "submitClientTask:withRequestID:schedulingErrorHandler:",  v33,  v35,  v45);
}

- (void)requestProcessing:(id)a3 localIdentifiers:(id)a4 photoLibraryURL:(id)a5 resultDirectoryURL:(id)a6 resultExtensionData:(id)a7 requestID:(id)a8 reply:(id)a9
{
  id v15 = a3;
  id v16 = a4;
  id v17 = a5;
  id v18 = a6;
  id v19 = a7;
  id v20 = a8;
  id v37 = a9;
  v49[0] = _NSConcreteStackBlock;
  v49[1] = 3221225472LL;
  v49[2] = sub_10008E7B8;
  v49[3] = &unk_1001BC2F0;
  void v49[4] = self;
  id v21 = v20;
  id v50 = v21;
  id v39 = objc_retainBlock(v49);
  v47[0] = _NSConcreteStackBlock;
  v47[1] = 3221225472LL;
  v47[2] = sub_10008E7CC;
  v47[3] = &unk_1001BC390;
  v47[4] = self;
  id v22 = v21;
  id v48 = v22;
  id v38 = objc_retainBlock(v47);
  id v35 = v18;
  id v36 = v17;
  id v34 = v19;
  id v33 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate now](&OBJC_CLASS___NSDate, "now"));
  -[MADComputeServiceClientHandler _storeComputeServiceRequests:localIdentifiers:photoLibraryURL:resultDirectoryURL:resultExtensionData:requestID:]( self,  "_storeComputeServiceRequests:localIdentifiers:photoLibraryURL:resultDirectoryURL:resultExtensionData:requestID:",  v15,  v16,  v17,  v18,  v19,  v22);
  _CFURLAttachSecurityScopeToFileURL(v18, v19);
  v42[0] = _NSConcreteStackBlock;
  v42[1] = 3221225472LL;
  v42[2] = sub_10008ECA8;
  v42[3] = &unk_1001BC368;
  v42[4] = self;
  id v23 = v33;
  id v43 = v23;
  id v24 = v15;
  id v44 = v24;
  id v25 = v16;
  id v45 = v25;
  id v26 = v18;
  id v27 = v37;
  id v46 = v27;
  uint64_t v28 = objc_retainBlock(v42);
  id v29 = (void *)objc_claimAutoreleasedReturnValue( +[MADComputeServiceProcessingTask taskWithRequests:requestID:localIdentifiers:photoLibraryURL:resultDirectoryURL:cancelBlock:progressHandler:resultsHandler:completionHandler:]( &OBJC_CLASS___MADComputeServiceProcessingTask,  "taskWithRequests:requestID:localIdentifiers:photoLibraryURL:resultDirectoryURL:cancelBlock:progressH andler:resultsHandler:completionHandler:",  v24,  v22,  v25,  v17,  v26,  0LL,  v39,  v38,  v28));
  queuingTaskScheduler = self->_queuingTaskScheduler;
  id v31 = [v22 hash];
  v40[0] = _NSConcreteStackBlock;
  v40[1] = 3221225472LL;
  v40[2] = sub_10008F024;
  v40[3] = &unk_1001B9A60;
  id v32 = v27;
  id v41 = v32;
  -[MADServiceClientTaskQueuingScheduler submitClientTask:withRequestID:schedulingErrorHandler:]( queuingTaskScheduler,  "submitClientTask:withRequestID:schedulingErrorHandler:",  v29,  v31,  v40);
}

- (void)scheduleProcessing:(id)a3 assetURLs:(id)a4 extensionData:(id)a5 resultDirectoryURL:(id)a6 resultExtensionData:(id)a7 requestID:(id)a8 reply:(id)a9
{
  id v35 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  id v18 = a7;
  id v19 = a8;
  id v20 = (void (**)(id, void, void *))a9;
  id v21 = [v15 count];
  if (v21 != [v16 count])
  {
    NSErrorUserInfoKey v42 = NSLocalizedDescriptionKey;
    id v22 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Asset URLs and sandbox extension data count mismatches!"));
    id v43 = v22;
    id v23 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v43,  &v42,  1LL));
    id v24 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  NSOSStatusErrorDomain,  -18LL,  v23));

    v20[2](v20, 0LL, v24);
  }

  -[MADComputeServiceClientHandler _storeComputeServiceRequests:assetURLs:extensionData:resultDirectoryURL:resultExtensionData:requestID:]( self,  "_storeComputeServiceRequests:assetURLs:extensionData:resultDirectoryURL:resultExtensionData:requestID:",  v35,  v15,  v16,  v17,  v18,  v19,  v35);
  id v25 = (void *)objc_claimAutoreleasedReturnValue( +[MADComputeServiceBackgroundSystemTask sharedTask]( &OBJC_CLASS___MADComputeServiceBackgroundSystemTask,  "sharedTask"));
  id v37 = 0LL;
  [v25 submitTask:&v37];
  id v26 = v37;

  if (v26)
  {
    uint64_t v29 = MediaAnalysisLogLevel(v27, v28);
    if ((int)v29 >= 3)
    {
      uint64_t v31 = VCPLogInstance(v29, v30);
      id v32 = (os_log_s *)objc_claimAutoreleasedReturnValue(v31);
      os_log_type_t v33 = VCPLogToOSLogType[3];
      if (os_log_type_enabled(v32, v33))
      {
        id v34 = (void *)objc_claimAutoreleasedReturnValue( +[MADComputeServiceBackgroundSystemTask identifier]( &OBJC_CLASS___MADComputeServiceBackgroundSystemTask,  "identifier"));
        *(_DWORD *)buf = 138412546;
        id v39 = v34;
        __int16 v40 = 2112;
        id v41 = v26;
        _os_log_impl( (void *)&_mh_execute_header,  v32,  v33,  "[MADComputeServiceClientHandler][%@] Failed to submit the BGST task with error: %@",  buf,  0x16u);
      }
    }
  }

  v20[2](v20, 1LL, 0LL);
}

- (void)scheduleProcessing:(id)a3 localIdentifiers:(id)a4 photoLibraryURL:(id)a5 resultDirectoryURL:(id)a6 resultExtensionData:(id)a7 requestID:(id)a8 reply:(id)a9
{
  id v16 = (void (**)(id, uint64_t, void))a9;
  -[MADComputeServiceClientHandler _storeComputeServiceRequests:localIdentifiers:photoLibraryURL:resultDirectoryURL:resultExtensionData:requestID:]( self,  "_storeComputeServiceRequests:localIdentifiers:photoLibraryURL:resultDirectoryURL:resultExtensionData:requestID:",  a3,  a4,  a5,  a6,  a7,  a8);
  id v17 = (void *)objc_claimAutoreleasedReturnValue( +[MADComputeServiceBackgroundSystemTask sharedTask]( &OBJC_CLASS___MADComputeServiceBackgroundSystemTask,  "sharedTask"));
  id v27 = 0LL;
  [v17 submitTask:&v27];
  id v18 = v27;

  if (v18)
  {
    uint64_t v21 = MediaAnalysisLogLevel(v19, v20);
    if ((int)v21 >= 3)
    {
      uint64_t v23 = VCPLogInstance(v21, v22);
      id v24 = (os_log_s *)objc_claimAutoreleasedReturnValue(v23);
      os_log_type_t v25 = VCPLogToOSLogType[3];
      if (os_log_type_enabled(v24, v25))
      {
        id v26 = (void *)objc_claimAutoreleasedReturnValue( +[MADComputeServiceBackgroundSystemTask identifier]( &OBJC_CLASS___MADComputeServiceBackgroundSystemTask,  "identifier"));
        *(_DWORD *)buf = 138412546;
        uint64_t v29 = v26;
        __int16 v30 = 2112;
        id v31 = v18;
        _os_log_impl( (void *)&_mh_execute_header,  v24,  v25,  "[MADComputeServiceClientHandler][%@] Failed to submit the BGST task with error: %@",  buf,  0x16u);
      }
    }
  }

  v16[2](v16, 1LL, 0LL);
}

- (void)resumeWithRequestID:(id)a3 reply:(id)a4
{
  id v6 = a3;
  id v31 = a4;
  uint64_t v8 = MediaAnalysisLogLevel(v31, v7);
  if ((int)v8 >= 6)
  {
    uint64_t v10 = VCPLogInstance(v8, v9);
    v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
    os_log_type_t v12 = VCPLogToOSLogType[6];
    if (os_log_type_enabled(v11, v12))
    {
      *(_DWORD *)buf = 138412290;
      id v43 = v6;
      _os_log_impl((void *)&_mh_execute_header, v11, v12, "[MADComputeServiceClientHandler] Resuming %@", buf, 0xCu);
    }
  }

  v40[0] = _NSConcreteStackBlock;
  v40[1] = 3221225472LL;
  v40[2] = sub_10008F8B8;
  v40[3] = &unk_1001BC2F0;
  void v40[4] = self;
  id v13 = v6;
  id v41 = v13;
  id v14 = objc_retainBlock(v40);
  v38[0] = _NSConcreteStackBlock;
  v38[1] = 3221225472LL;
  v38[2] = sub_10008F8CC;
  v38[3] = &unk_1001BC3B8;
  v38[4] = self;
  id v15 = v13;
  id v39 = v15;
  id v32 = objc_retainBlock(v38);
  v35[0] = _NSConcreteStackBlock;
  v35[1] = 3221225472LL;
  v35[2] = sub_10008FDA8;
  v35[3] = &unk_1001BC1E0;
  v35[4] = self;
  id v16 = (id)objc_claimAutoreleasedReturnValue(+[NSDate now](&OBJC_CLASS___NSDate, "now"));
  id v36 = v16;
  id v17 = v31;
  id v37 = v17;
  id v18 = objc_retainBlock(v35);
  uint64_t v19 = v14;
  uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue( +[MADComputeServiceProcessingTask taskWithRequestID:cancelBlock:progressHandler:resultsHandler:completionHandler:]( &OBJC_CLASS___MADComputeServiceProcessingTask,  "taskWithRequestID:cancelBlock:progressHandler:resultsHandler:completionHandler:",  v15,  0LL,  v14,  v32,  v18));
  queuingTaskScheduler = self->_queuingTaskScheduler;
  id v22 = [v15 hash];
  v33[0] = _NSConcreteStackBlock;
  v33[1] = 3221225472LL;
  v33[2] = sub_100090094;
  v33[3] = &unk_1001B9A60;
  id v23 = v17;
  id v34 = v23;
  id v24 = -[MADServiceClientTaskQueuingScheduler submitClientTask:withRequestID:schedulingErrorHandler:]( queuingTaskScheduler,  "submitClientTask:withRequestID:schedulingErrorHandler:",  v20,  v22,  v33);
  uint64_t v26 = MediaAnalysisLogLevel(v24, v25);
  if ((int)v26 >= 6)
  {
    uint64_t v28 = VCPLogInstance(v26, v27);
    uint64_t v29 = (os_log_s *)objc_claimAutoreleasedReturnValue(v28);
    os_log_type_t v30 = VCPLogToOSLogType[6];
    if (os_log_type_enabled(v29, v30))
    {
      *(_DWORD *)buf = 138412290;
      id v43 = v15;
      _os_log_impl((void *)&_mh_execute_header, v29, v30, "[MADComputeServiceClientHandler] Resumed %@", buf, 0xCu);
    }
  }
}

- (void)cancelAllRequests
{
  uint64_t v3 = MediaAnalysisLogLevel(self, a2);
  if ((int)v3 >= 6)
  {
    uint64_t v5 = VCPLogInstance(v3, v4);
    id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
    os_log_type_t v7 = VCPLogToOSLogType[6];
    if (os_log_type_enabled(v6, v7))
    {
      LOWORD(v15) = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v6,  v7,  "[MADComputeServiceClientHandler] Call to cancel all requests",  (uint8_t *)&v15,  2u);
    }
  }

  unint64_t v8 = -[MADServiceClientTaskQueuingScheduler cancelAllTasks](self->_queuingTaskScheduler, "cancelAllTasks");
  uint64_t v10 = MediaAnalysisLogLevel(v8, v9);
  if ((int)v10 >= 6)
  {
    uint64_t v12 = VCPLogInstance(v10, v11);
    id v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
    os_log_type_t v14 = VCPLogToOSLogType[6];
    if (os_log_type_enabled(v13, v14))
    {
      int v15 = 134217984;
      unint64_t v16 = v8;
      _os_log_impl( (void *)&_mh_execute_header,  v13,  v14,  "[MADComputeServiceClientHandler] Canceled %lu tasks",  (uint8_t *)&v15,  0xCu);
    }
  }

- (void)cancelWithRequestID:(id)a3
{
  id v4 = a3;
  uint64_t v6 = MediaAnalysisLogLevel(v4, v5);
  if ((int)v6 >= 6)
  {
    uint64_t v8 = VCPLogInstance(v6, v7);
    uint64_t v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
    os_log_type_t v10 = VCPLogToOSLogType[6];
    if (os_log_type_enabled(v9, v10))
    {
      int v18 = 138412290;
      id v19 = v4;
      _os_log_impl( (void *)&_mh_execute_header,  v9,  v10,  "[MADComputeServiceClientHandler] Canceling %@",  (uint8_t *)&v18,  0xCu);
    }
  }

  id v11 = -[MADServiceClientTaskQueuingScheduler cancelTaskWithRequestID:]( self->_queuingTaskScheduler,  "cancelTaskWithRequestID:",  [v4 hash]);
  uint64_t v13 = MediaAnalysisLogLevel(v11, v12);
  if ((int)v13 >= 6)
  {
    uint64_t v15 = VCPLogInstance(v13, v14);
    unint64_t v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(v15);
    os_log_type_t v17 = VCPLogToOSLogType[6];
    if (os_log_type_enabled(v16, v17))
    {
      int v18 = 138412290;
      id v19 = v4;
      _os_log_impl( (void *)&_mh_execute_header,  v16,  v17,  "[MADComputeServiceClientHandler] Canceled %@",  (uint8_t *)&v18,  0xCu);
    }
  }
}

- (void)removeWithRequestID:(id)a3 reply:(id)a4
{
  id v5 = a3;
  uint64_t v6 = (void (**)(id, uint64_t, void))a4;
  uint64_t v8 = MediaAnalysisLogLevel(v6, v7);
  if ((int)v8 >= 6)
  {
    uint64_t v10 = VCPLogInstance(v8, v9);
    id v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
    os_log_type_t v12 = VCPLogToOSLogType[6];
    if (os_log_type_enabled(v11, v12))
    {
      *(_DWORD *)buf = 138412290;
      id v29 = v5;
      _os_log_impl((void *)&_mh_execute_header, v11, v12, "[MADComputeServiceClientHandler] Removing %@", buf, 0xCu);
    }
  }

  id v27 = 0LL;
  uint64_t v13 = (uint64_t)+[MADManagedRequest removeRequest:error:]( &OBJC_CLASS___MADManagedRequest,  "removeRequest:error:",  v5,  &v27);
  id v14 = v27;
  unint64_t v16 = v14;
  if ((_DWORD)v13)
  {
    uint64_t v17 = MediaAnalysisLogLevel(v14, v15);
    if ((int)v17 < 6)
    {
      id v22 = 0LL;
      uint64_t v13 = 1LL;
      goto LABEL_17;
    }

    uint64_t v19 = VCPLogInstance(v17, v18);
    uint64_t v20 = (os_log_s *)objc_claimAutoreleasedReturnValue(v19);
    os_log_type_t v21 = VCPLogToOSLogType[6];
    if (os_log_type_enabled(v20, v21))
    {
      *(_DWORD *)buf = 138412290;
      id v29 = v5;
      _os_log_impl((void *)&_mh_execute_header, v20, v21, "[MADComputeServiceClientHandler] Removed %@", buf, 0xCu);
    }

    id v22 = 0LL;
  }

  else
  {
    uint64_t v23 = MediaAnalysisLogLevel(v14, v15);
    if ((int)v23 < 3)
    {
      uint64_t v13 = 0LL;
      id v22 = v16;
      goto LABEL_17;
    }

    uint64_t v25 = VCPLogInstance(v23, v24);
    uint64_t v20 = (os_log_s *)objc_claimAutoreleasedReturnValue(v25);
    os_log_type_t v26 = VCPLogToOSLogType[3];
    if (os_log_type_enabled(v20, v26))
    {
      *(_DWORD *)buf = 138412546;
      id v29 = v5;
      __int16 v30 = 2112;
      id v31 = v16;
      _os_log_impl( (void *)&_mh_execute_header,  v20,  v26,  "[MADComputeServiceClientHandler] Failed to remove %@ - %@",  buf,  0x16u);
    }

    id v22 = v16;
  }

LABEL_17:
  ((void (**)(id, uint64_t, void *))v6)[2](v6, v13, v22);
}

- (void).cxx_destruct
{
}

@end