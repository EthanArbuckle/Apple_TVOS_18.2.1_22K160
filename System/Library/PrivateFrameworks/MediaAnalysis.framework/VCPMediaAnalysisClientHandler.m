@interface VCPMediaAnalysisClientHandler
+ (id)clientHandlerWithXPCConnection:(id)a3;
+ (id)errorForStatus:(int)a3 withDescription:(id)a4;
+ (unint64_t)disablePhotosPostCaptureProcessing;
- (VCPMediaAnalysisClientHandler)init;
- (VCPMediaAnalysisClientHandler)initWithXPCConnection:(id)a3;
- (id).cxx_construct;
- (id)assetWithIdentifier:(id)a3 identifierType:(unint64_t)a4 fromPhotoLibraryWithURL:(id)a5 error:(id *)a6;
- (int64_t)consumeSandboxExtension:(id)a3 url:(id)a4;
- (void)_resetPECFailureVersionForPhotoLibrary:(id)a3;
- (void)_resetProcessingStatusForTaskID:(unint64_t)a3 andPhotoLibrary:(id)a4;
- (void)cancelAllRequests;
- (void)cancelBackgroundActivityWithReply:(id)a3;
- (void)cancelRequest:(int)a3;
- (void)currentOutstandingTasksWithReply:(id)a3;
- (void)downloadVideoEncoderIfNeededWithReply:(id)a3;
- (void)notifyLibraryAvailableAtURL:(id)a3;
- (void)queryAssetsPendingDeferredProcessingWithPhotoLibraryURL:(id)a3 andReply:(id)a4;
- (void)queryAutoCounterOptInStatus:(int)a3 withPhotoLibraryURL:(id)a4 personLocalIdentifiers:(id)a5 andReply:(id)a6;
- (void)queryImagePriority1MCEnableDateWithPhotoLibraryURL:(id)a3 reply:(id)a4;
- (void)queryPerformanceMeasurementsWithReply:(id)a3;
- (void)queryUserSafetyEnablement:(id)a3;
- (void)queryVUIndexAssetCountForType:(int64_t)a3 photoLibraryURL:(id)a4 reply:(id)a5;
- (void)queryVUIndexLastFullModeClusterDateWithPhotoLibraryURL:(id)a3 reply:(id)a4;
- (void)requestAssetAnalysis:(int)a3 forLocalIdentifiers:(id)a4 fromPhotoLibraryWithURL:(id)a5 withOptions:(id)a6 analysisTypes:(unint64_t)a7 withReply:(id)a8;
- (void)requestAssetAnalysis:(int)a3 forPhotoLibraryURL:(id)a4 withLocalIdentifiers:(id)a5 realTime:(BOOL)a6 withReply:(id)a7;
- (void)requestAssetProcessing:(int)a3 withTaskID:(unint64_t)a4 forLocalIdentifiers:(id)a5 fromPhotoLibraryWithURL:(id)a6 withOptions:(id)a7 andReply:(id)a8;
- (void)requestAutoCounterAccuracyCalculation:(int)a3 withPhotoLibraryURL:(id)a4 andReply:(id)a5;
- (void)requestAutoCounterAccuracyCalculation:(int)a3 withPhotoLibraryURL:(id)a4 clusterStateURL:(id)a5 groundTruthURL:(id)a6 andReply:(id)a7;
- (void)requestAutoCounterSIMLValidation:(int)a3 withPhotoLibraryURL:(id)a4 simlGroundTruthURL:(id)a5 andReply:(id)a6;
- (void)requestClusterCacheValidation:(int)a3 withPhotoLibraryURL:(id)a4 andReply:(id)a5;
- (void)requestDeferredProcessingTypes:(id)a3 forAssetsWithLocalIdentifiers:(id)a4 withPhotoLibraryURL:(id)a5 andReply:(id)a6;
- (void)requestDumpAutoCounter:(int)a3 withPhotoLibraryURL:(id)a4 andReply:(id)a5;
- (void)requestFaceCandidatesforKeyFace:(int)a3 withPersonsWithLocalIdentifiers:(id)a4 andPhotoLibraryURL:(id)a5 andReply:(id)a6;
- (void)requestForceDeferredProcessing:(int)a3 andReply:(id)a4;
- (void)requestIdentificationOfFacesWithLocalIdentifiers:(id)a3 fromPhotoLibraryWithURL:(id)a4 withRequestID:(int)a5 andReply:(id)a6;
- (void)requestImageProcessing:(id)a3 forAssetURL:(id)a4 withSandboxToken:(id)a5 identifier:(id)a6 requestID:(int)a7 andReply:(id)a8;
- (void)requestImageProcessing:(id)a3 forAssetWithCloudIdentifier:(id)a4 requestID:(int)a5 andReply:(id)a6;
- (void)requestImageProcessing:(id)a3 forAssetWithIdentifier:(id)a4 identifierType:(unint64_t)a5 fromPhotoLibraryWithURL:(id)a6 requestID:(int)a7 andReply:(id)a8;
- (void)requestImageProcessing:(id)a3 forIOSurface:(id)a4 withOrientation:(unsigned int)a5 assetLocalIdentifier:(id)a6 photoLibraryURL:(id)a7 requestID:(int)a8 andReply:(id)a9;
- (void)requestImageProcessing:(id)a3 forIOSurface:(id)a4 withOrientation:(unsigned int)a5 identifier:(id)a6 requestID:(int)a7 andReply:(id)a8;
- (void)requestImageProcessing:(id)a3 forImageData:(id)a4 withUniformTypeIdentifier:(id)a5 identifier:(id)a6 requestID:(int)a7 andReply:(id)a8;
- (void)requestImageProcessingWithCloudIdentifierRequests:(id)a3 requestID:(int)a4 andReply:(id)a5;
- (void)requestLibraryProcessing:(int)a3 withTaskID:(unint64_t)a4 forPhotoLibraryURL:(id)a5 withOptions:(id)a6 andReply:(id)a7;
- (void)requestMediaAnalysisDatabaseAccessSandboxExtensionWithPhotoLibraryURL:(id)a3 andReply:(id)a4;
- (void)requestMultiModalPrewarming:(id)a3 requestID:(int)a4 reply:(id)a5;
- (void)requestOTAMaintenance:(int)a3 options:(id)a4 reply:(id)a5;
- (void)requestOptInAutoCounter:(int)a3 withPhotoLibraryURL:(id)a4 persons:(id)a5 andReply:(id)a6;
- (void)requestPersonPreferenceForPhotoLibraryURL:(id)a3 andReply:(id)a4;
- (void)requestPersonPromoterStatus:(int)a3 withAdvancedFlag:(BOOL)a4 andPhotoLibraryURL:(id)a5 andReply:(id)a6;
- (void)requestProcessing:(id)a3 multiModalInputs:(id)a4 requestID:(int)a5 reply:(id)a6;
- (void)requestProcessingTypes:(unint64_t)a3 forAssetsWithLocalIdentifiers:(id)a4 fromPhotoLibraryWithURL:(id)a5 withRequestID:(int)a6 andReply:(id)a7;
- (void)requestRebuildPersons:(int)a3 withLocalIdentifiers:(id)a4 andPhotoLibraryURL:(id)a5 andReply:(id)a6;
- (void)requestRecentsProcessing:(int)a3 withTaskID:(unint64_t)a4 photoLibraryWithURL:(id)a5 reply:(id)a6;
- (void)requestReclusterFaces:(int)a3 withPhotoLibraryURL:(id)a4 andReply:(id)a5;
- (void)requestResetFaceClassificationModel:(int)a3 withPhotoLibraryURL:(id)a4 andReply:(id)a5;
- (void)requestResetFaceClusteringState:(int)a3 withPhotoLibraryURL:(id)a4 andReply:(id)a5;
- (void)requestResetPersons:(int)a3 withPhotoLibraryURL:(id)a4 andReply:(id)a5;
- (void)requestResetPetClassificationModel:(int)a3 withPhotoLibraryURL:(id)a4 andReply:(id)a5;
- (void)requestStaticStickerScoring:(int)a3 photoLibraryURL:(id)a4 options:(id)a5 reply:(id)a6;
- (void)requestSuggestedMePersonIdentifier:(int)a3 withContext:(id)a4 andPhotoLibraryURL:(id)a5 andReply:(id)a6;
- (void)requestSuggestedPersons:(int)a3 withPersonWithLocalIdentifier:(id)a4 toBeConfirmedPersonSuggestions:(id)a5 toBeRejectedPersonSuggestions:(id)a6 andPhotoLibraryURL:(id)a7 andReply:(id)a8;
- (void)requestTextPrewarming:(id)a3 requestID:(int)a4 reply:(id)a5;
- (void)requestTextProcessing:(id)a3 textInputs:(id)a4 requestID:(int)a5 reply:(id)a6;
- (void)requestURLAssetAnalysis:(int)a3 forAssetWithResourcePaths:(id)a4 withOptions:(id)a5 analysisTypes:(unint64_t)a6 sandboxTokens:(id)a7 withReply:(id)a8;
- (void)requestUpdateKeyFacesOfPersons:(int)a3 withLocalIdentifiers:(id)a4 andForceUpdate:(BOOL)a5 andPhotoLibraryURL:(id)a6 andReply:(id)a7;
- (void)requestVIPModelStorageFilepathForPhotoLibraryURL:(id)a3 forModelType:(unint64_t)a4 andReply:(id)a5;
- (void)requestVideoFramesProcessing:(int)a3 withTaskID:(unint64_t)a4 frames:(id)a5 options:(id)a6 andReply:(id)a7;
- (void)requestVideoProcessing:(id)a3 asset:(id)a4 requestID:(int)a5 isIncremental:(BOOL)a6 reply:(id)a7;
- (void)requestVideoProcessing:(id)a3 assetIdentifier:(id)a4 identifierType:(unint64_t)a5 photoLibraryURL:(id)a6 requestID:(int)a7 isIncremental:(BOOL)a8 reply:(id)a9;
- (void)requestVideoProcessing:(id)a3 assetURL:(id)a4 sandboxToken:(id)a5 identifier:(id)a6 requestID:(int)a7 reply:(id)a8;
- (void)requestVisionCacheStorageDirectoryURLForPhotoLibraryURL:(id)a3 reply:(id)a4;
- (void)submitSpotlightAssetURL:(id)a3 uniqueIdentifier:(id)a4 bundleIdentifier:(id)a5 typeIdentifier:(id)a6 sandboxToken:(id)a7 reply:(id)a8;
@end

@implementation VCPMediaAnalysisClientHandler

- (VCPMediaAnalysisClientHandler)init
{
  return 0LL;
}

- (VCPMediaAnalysisClientHandler)initWithXPCConnection:(id)a3
{
  id v47 = a3;
  v56.receiver = self;
  v56.super_class = (Class)&OBJC_CLASS___VCPMediaAnalysisClientHandler;
  v5 = -[VCPMediaAnalysisClientHandler init](&v56, "init");
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

    v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSXPCInterface interfaceWithProtocol:]( &OBJC_CLASS___NSXPCInterface,  "interfaceWithProtocol:",  &OBJC_PROTOCOL___VCPMediaAnalysisServerProtocol));
    +[MADServicePrivate configureServerInterface:](&OBJC_CLASS___MADServicePrivate, "configureServerInterface:", v10);
    v60[0] = objc_opt_class(&OBJC_CLASS___NSArray);
    v60[1] = objc_opt_class(&OBJC_CLASS___IOSurface);
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v60, 2LL));
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](&OBJC_CLASS___NSSet, "setWithArray:", v11));
    [v10 setClasses:v12 forSelector:"requestVideoFramesProcessing:withTaskID:frames:options:andReply:" argumentIndex:2 ofReply:0];

    [*p_connection setExportedInterface:v10];
    id v13 = *p_connection;
    v53[0] = _NSConcreteStackBlock;
    v53[1] = 3221225472LL;
    v53[2] = sub_10004F2EC;
    v53[3] = &unk_1001B99F0;
    objc_copyWeak(&v54, &location);
    [v13 setInterruptionHandler:v53];
    id v14 = *p_connection;
    v51[0] = _NSConcreteStackBlock;
    v51[1] = 3221225472LL;
    v51[2] = sub_10004F3A0;
    v51[3] = &unk_1001B99F0;
    objc_copyWeak(&v52, &location);
    [v14 setInvalidationHandler:v51];
    dispatch_queue_t v15 = dispatch_queue_create("com.apple.mediaanalysisd.clientmanagment", 0LL);
    managementQueue = v6->_managementQueue;
    v6->_managementQueue = (OS_dispatch_queue *)v15;

    uint64_t v17 = objc_claimAutoreleasedReturnValue([*p_connection remoteObjectProxy]);
    clientProxy = v6->_clientProxy;
    v6->_clientProxy = (VCPMediaAnalysisClientProtocol *)v17;

    uint64_t v19 = objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
    taskIDMapping = v6->_taskIDMapping;
    v6->_taskIDMapping = (NSMutableDictionary *)v19;

    CFTypeRef v49 = 0LL;
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

    CFStringRef v23 = SecTaskCopySigningIdentifier(value, (CFErrorRef *)&cf);
    clientBundleID = v6->_clientBundleID;
    v6->_clientBundleID = &v23->isa;

    v25 = p_secTask->value_;
    if (v49)
    {
      CFRelease(v49);
      CFTypeRef v49 = 0LL;
    }

    uint64_t v26 = SecTaskCopyTeamIdentifier(v25, &v49);
    clientTeamID = v6->_clientTeamID;
    v6->_clientTeamID = (NSString *)v26;

    if (cf)
    {
      uint64_t v28 = MediaAnalysisLogLevel(v28, v29);
      if ((int)v28 >= 4)
      {
        uint64_t v30 = VCPLogInstance(v28, v29);
        v31 = (os_log_s *)objc_claimAutoreleasedReturnValue(v30);
        os_log_type_t v32 = VCPLogToOSLogType[4];
        if (os_log_type_enabled(v31, v32))
        {
          *(_DWORD *)buf = 138412290;
          *(void *)&buf[4] = cf;
          _os_log_impl( (void *)&_mh_execute_header,  v31,  v32,  "[MAClientHandler] Failed to query client bundle ID (%@)",  buf,  0xCu);
        }
      }
    }

    if (v49)
    {
      uint64_t v28 = MediaAnalysisLogLevel(v28, v29);
      if ((int)v28 >= 4)
      {
        uint64_t v33 = VCPLogInstance(v28, v29);
        v34 = (os_log_s *)objc_claimAutoreleasedReturnValue(v33);
        os_log_type_t v35 = VCPLogToOSLogType[4];
        if (os_log_type_enabled(v34, v35))
        {
          *(_DWORD *)buf = 138412290;
          *(void *)&buf[4] = v49;
          _os_log_impl( (void *)&_mh_execute_header,  v34,  v35,  "[MAClientHandler] Failed to query client team ID (%@)",  buf,  0xCu);
        }
      }
    }

    uint64_t v36 = MediaAnalysisLogLevel(v28, v29);
    if ((int)v36 >= 6)
    {
      uint64_t v38 = VCPLogInstance(v36, v37);
      v39 = (os_log_s *)objc_claimAutoreleasedReturnValue(v38);
      os_log_type_t v40 = VCPLogToOSLogType[6];
      if (os_log_type_enabled(v39, v40))
      {
        v41 = v6->_clientBundleID;
        v42 = v6->_clientTeamID;
        *(_DWORD *)buf = 138412546;
        *(void *)&buf[4] = v41;
        __int16 v58 = 2112;
        v59 = v42;
        _os_log_impl( (void *)&_mh_execute_header,  v39,  v40,  "[MAClientHandler] Client BundleID: %@ TeamID: %@",  buf,  0x16u);
      }
    }

    v6->_userSafetyEntitled = +[MADUserSafetySettings isTaskEntitled:]( &OBJC_CLASS___MADUserSafetySettings,  "isTaskEntitled:",  p_secTask->value_);
    v43 = -[MADServiceClientTaskQueuingScheduler initWithClientBundleID:]( objc_alloc(&OBJC_CLASS___MADServiceClientTaskQueuingScheduler),  "initWithClientBundleID:",  v6->_clientBundleID);
    queuingTaskScheduler = v6->_queuingTaskScheduler;
    v6->_queuingTaskScheduler = v43;

    v45 = v6;
    sub_10000421C(&v49);
    sub_10000421C(&cf);
    objc_destroyWeak(&v52);
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

+ (id)errorForStatus:(int)a3 withDescription:(id)a4
{
  id v5 = (__CFString *)a4;
  v7 = v5;
  if (a3 == -128)
  {
    id v8 = @"[MAClientHandler] Analysis was canceled";
  }

  else
  {
    if (!a3)
    {
      v9 = 0LL;
      goto LABEL_14;
    }

    if (a3 == -50) {
      id v5 = (__CFString *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"[MAClientHandler] Invalid parameter - %@",  v5));
    }
    else {
      id v5 = (__CFString *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"[MAClientHandler] Analysis failed - %@",  v5));
    }
    id v8 = v5;
  }

  uint64_t v10 = MediaAnalysisLogLevel(v5, v6);
  if ((int)v10 >= 3)
  {
    uint64_t v12 = VCPLogInstance(v10, v11);
    id v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
    os_log_type_t v14 = VCPLogToOSLogType[3];
    if (os_log_type_enabled(v13, v14))
    {
      *(_DWORD *)buf = 138412290;
      v20 = v8;
      _os_log_impl((void *)&_mh_execute_header, v13, v14, "%@", buf, 0xCu);
    }
  }

  NSErrorUserInfoKey v17 = NSLocalizedDescriptionKey;
  v18 = v8;
  dispatch_queue_t v15 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v18,  &v17,  1LL));
  v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"MediaAnalysisService",  a3,  v15));

LABEL_14:
  return v9;
}

- (void)requestMediaAnalysisDatabaseAccessSandboxExtensionWithPhotoLibraryURL:(id)a3 andReply:(id)a4
{
  id v5 = a3;
  uint64_t v6 = (void (**)(id, void *))a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[VCPPhotoLibraryManager sharedManager](&OBJC_CLASS___VCPPhotoLibraryManager, "sharedManager"));
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 photoLibraryWithURL:v5]);

  if (v8)
  {
    id v11 = objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "vcp_mediaAnalysisDirectory"));
    id v12 = [v11 UTF8String];
    uint64_t v13 = sandbox_extension_issue_file(APP_SANDBOX_READ_WRITE, v12, 0LL);
    dispatch_queue_t v15 = (void *)v13;
    if (v13)
    {
      uint64_t v16 = MediaAnalysisLogLevel(v13, v14);
      if ((int)v16 >= 7)
      {
        uint64_t v18 = VCPLogInstance(v16, v17);
        uint64_t v19 = (os_log_s *)objc_claimAutoreleasedReturnValue(v18);
        os_log_type_t v20 = VCPLogToOSLogType[7];
        if (os_log_type_enabled(v19, v20))
        {
          int v33 = 138412290;
          id v34 = v11;
          _os_log_impl( (void *)&_mh_execute_header,  v19,  v20,  "[MAClientHandler] Issuing sandbox extension for %@",  (uint8_t *)&v33,  0xCu);
        }
      }

      v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", v15));
      v6[2](v6, v21);

      free(v15);
    }

    else
    {
      uint64_t v28 = MediaAnalysisLogLevel(0LL, v14);
      if ((int)v28 >= 4)
      {
        uint64_t v30 = VCPLogInstance(v28, v29);
        v31 = (os_log_s *)objc_claimAutoreleasedReturnValue(v30);
        os_log_type_t v32 = VCPLogToOSLogType[4];
        if (os_log_type_enabled(v31, v32))
        {
          int v33 = 138412290;
          id v34 = v11;
          _os_log_impl( (void *)&_mh_execute_header,  v31,  v32,  "[MAClientHandler] Failed to issue sandbox extension on %@",  (uint8_t *)&v33,  0xCu);
        }
      }

      v6[2](v6, 0LL);
    }
  }

  else
  {
    uint64_t v22 = MediaAnalysisLogLevel(v9, v10);
    if ((int)v22 >= 4)
    {
      uint64_t v24 = VCPLogInstance(v22, v23);
      v25 = (os_log_s *)objc_claimAutoreleasedReturnValue(v24);
      os_log_type_t v26 = VCPLogToOSLogType[4];
      if (os_log_type_enabled(v25, v26))
      {
        v27 = (void *)objc_claimAutoreleasedReturnValue([v5 path]);
        int v33 = 138412290;
        id v34 = v27;
        _os_log_impl( (void *)&_mh_execute_header,  v25,  v26,  "[MAClientHandler] Failed to open Photos Library at %@; cannot issue sandbox extension",
          (uint8_t *)&v33,
          0xCu);
      }
    }

    v6[2](v6, 0LL);
  }
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
    memset(v29, 0, sizeof(v29));
  }
  uint64_t v10 = sandbox_check_by_audit_token(v29, "file-read*", SANDBOX_CHECK_NO_REPORT | 1u);
  if ((_DWORD)v10 == -1)
  {
    uint64_t v18 = MediaAnalysisLogLevel(v10, v11);
    if ((int)v18 >= 3)
    {
      uint64_t v20 = VCPLogInstance(v18, v19);
      dispatch_queue_t v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v20);
      os_log_type_t v16 = VCPLogToOSLogType[3];
      if (os_log_type_enabled(v15, v16))
      {
        *(_DWORD *)buf = 136315138;
        id v31 = v8;
        uint64_t v17 = "[MAClientHandler] Failed to check for client read access to file %s";
        goto LABEL_12;
      }

- (void)requestImageProcessing:(id)a3 forIOSurface:(id)a4 withOrientation:(unsigned int)a5 identifier:(id)a6 requestID:(int)a7 andReply:(id)a8
{
  uint64_t v9 = *(void *)&a7;
  uint64_t v11 = *(void *)&a5;
  id v14 = a3;
  dispatch_queue_t v15 = (__IOSurface *)a4;
  id v41 = a6;
  os_log_type_t v16 = (void (**)(id, void, void *))a8;
  uint64_t v18 = MediaAnalysisLogLevel(v16, v17);
  if ((int)v18 >= 6)
  {
    uint64_t v20 = VCPLogInstance(v18, v19);
    int64_t v21 = (os_log_s *)objc_claimAutoreleasedReturnValue(v20);
    os_log_type_t v22 = VCPLogToOSLogType[6];
    if (os_log_type_enabled(v21, v22))
    {
      *(_DWORD *)buf = 67109120;
      *(_DWORD *)&uint8_t buf[4] = v9;
      _os_log_impl( (void *)&_mh_execute_header,  v21,  v22,  "[MAClientHandler] Received on-demand image processing request (CVPixelBuffer) with MADRequestID %d",  buf,  8u);
    }
  }

  uint64_t v23 = objc_autoreleasePoolPush();
  os_log_type_t v40 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Request: %d Identifier: %@",  v9,  v41));
  uint64_t v24 = VCPSignPostLog(v40);
  uint64_t v25 = (os_log_s *)objc_claimAutoreleasedReturnValue(v24);
  os_signpost_id_t v26 = os_signpost_id_generate(v25);

  uint64_t v28 = VCPSignPostLog(v27);
  uint64_t v29 = (os_log_s *)objc_claimAutoreleasedReturnValue(v28);
  uint64_t v30 = v29;
  if (v26 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v29))
  {
    *(_DWORD *)buf = 138412290;
    *(void *)&uint8_t buf[4] = v40;
    _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v30,  OS_SIGNPOST_INTERVAL_BEGIN,  v26,  "VCPMediaAnalysisClientHandler_IOSurface",  "%@",  buf,  0xCu);
  }

  *(void *)buf = 0LL;
  CVReturn v31 = CVPixelBufferCreateWithIOSurface(0LL, v15, 0LL, (CVPixelBufferRef *)buf);
  if (v31)
  {
    NSErrorUserInfoKey v51 = NSLocalizedDescriptionKey;
    os_log_type_t v32 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"[MAClientHandler] Failed to create CVPixelBuffer from specified IOSurface"));
    id v52 = v32;
    int v33 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v52,  &v51,  1LL));
    id v34 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  NSOSStatusErrorDomain,  v31,  v33));
    v16[2](v16, 0LL, v34);
  }

  else
  {
    os_log_type_t v32 = (void *)objc_claimAutoreleasedReturnValue( +[VCPMADServiceImageAsset assetWithPixelBuffer:orientation:identifier:clientBundleID:clientTeamID:]( &OBJC_CLASS___VCPMADServiceImageAsset,  "assetWithPixelBuffer:orientation:identifier:clientBundleID:clientTeamID:",  *(void *)buf,  v11,  v41,  self->_clientBundleID,  self->_clientTeamID));
    BOOL v35 = self->_userSafetyEntitled
       && +[MADUserSafetySettings isEnabledForTask:]( &OBJC_CLASS___MADUserSafetySettings,  "isEnabledForTask:",  self->_secTask.value_);
    [v32 setUserSafetyEligible:v35];
    v44[0] = _NSConcreteStackBlock;
    v44[1] = 3221225472LL;
    v44[2] = sub_10005012C;
    v44[3] = &unk_1001BB4F8;
    int v50 = v9;
    os_signpost_id_t v48 = v26;
    id v36 = v40;
    id v45 = v36;
    uint64_t v49 = 0LL;
    uint64_t v37 = v16;
    id v47 = v37;
    id v46 = v14;
    uint64_t v38 = (void *)objc_claimAutoreleasedReturnValue( +[VCPMADServiceImageProcessingTask taskWithRequests:forAsset:cancelBlock:andCompletionHandler:]( &OBJC_CLASS___VCPMADServiceImageProcessingTask,  "taskWithRequests:forAsset:cancelBlock:andCompletionHandler:",  v46,  v32,  &stru_1001BB4D0,  v44));
    [v38 setSignpostPayload:v36];
    queuingTaskScheduler = self->_queuingTaskScheduler;
    v42[0] = _NSConcreteStackBlock;
    v42[1] = 3221225472LL;
    v42[2] = sub_1000502D8;
    v42[3] = &unk_1001B9A60;
    v43 = v37;
    -[MADServiceClientTaskQueuingScheduler submitClientTask:withRequestID:schedulingErrorHandler:]( queuingTaskScheduler,  "submitClientTask:withRequestID:schedulingErrorHandler:",  v38,  (int)v9,  v42);

    int v33 = v45;
  }

  sub_10000421C((const void **)buf);
  objc_autoreleasePoolPop(v23);
}

- (void)requestImageProcessing:(id)a3 forAssetURL:(id)a4 withSandboxToken:(id)a5 identifier:(id)a6 requestID:(int)a7 andReply:(id)a8
{
  uint64_t v9 = *(void *)&a7;
  id v14 = a3;
  id v43 = a4;
  id v15 = a5;
  id v44 = a6;
  v42 = (void (**)(id, void, void *))a8;
  uint64_t v17 = MediaAnalysisLogLevel(v42, v16);
  if ((int)v17 >= 6)
  {
    uint64_t v19 = VCPLogInstance(v17, v18);
    uint64_t v20 = (os_log_s *)objc_claimAutoreleasedReturnValue(v19);
    os_log_type_t v21 = VCPLogToOSLogType[6];
    if (os_log_type_enabled(v20, v21))
    {
      *(_DWORD *)buf = 67109120;
      LODWORD(v59) = v9;
      _os_log_impl( (void *)&_mh_execute_header,  v20,  v21,  "[MAClientHandler] Received on-demand image processing request (URL) with MADRequestID %d",  buf,  8u);
    }
  }

  os_log_type_t v22 = objc_autoreleasePoolPush();
  id v41 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Request: %d Identifier: %@",  v9,  v44));
  id v40 = v15;
  uint64_t v23 = VCPSignPostLog(v41);
  uint64_t v24 = (os_log_s *)objc_claimAutoreleasedReturnValue(v23);
  os_signpost_id_t v25 = os_signpost_id_generate(v24);

  uint64_t v27 = VCPSignPostLog(v26);
  uint64_t v28 = (os_log_s *)objc_claimAutoreleasedReturnValue(v27);
  uint64_t v29 = v28;
  if (v25 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v28))
  {
    *(_DWORD *)buf = 138412290;
    v59 = v41;
    _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v29,  OS_SIGNPOST_INTERVAL_BEGIN,  v25,  "VCPMediaAnalysisClientHandler_URL",  "%@",  buf,  0xCu);
  }

  int64_t v30 = -[VCPMediaAnalysisClientHandler consumeSandboxExtension:url:](self, "consumeSandboxExtension:url:", v15, v43);
  if (v30 < 0)
  {
    NSErrorUserInfoKey v56 = NSLocalizedDescriptionKey;
    CVReturn v31 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"[MAClientHandler] Failed to consume sandbox extension"));
    v57 = v31;
    int v33 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v57,  &v56,  1LL));
    id v34 = v40;
    BOOL v35 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  NSOSStatusErrorDomain,  -50LL,  v33));
    v42[2](v42, 0LL, v35);
  }

  else
  {
    CVReturn v31 = (void *)objc_claimAutoreleasedReturnValue( +[VCPMADServiceImageAsset assetWithURL:identifier:clientBundleID:clientTeamID:]( &OBJC_CLASS___VCPMADServiceImageAsset,  "assetWithURL:identifier:clientBundleID:clientTeamID:",  v43,  v44,  self->_clientBundleID,  self->_clientTeamID));
    BOOL v32 = self->_userSafetyEntitled
       && +[MADUserSafetySettings isEnabledForTask:]( &OBJC_CLASS___MADUserSafetySettings,  "isEnabledForTask:",  self->_secTask.value_);
    [v31 setUserSafetyEligible:v32];
    v48[0] = _NSConcreteStackBlock;
    v48[1] = 3221225472LL;
    v48[2] = sub_100050814;
    v48[3] = &unk_1001BB540;
    int v55 = v9;
    os_signpost_id_t v52 = v25;
    id v36 = v41;
    id v49 = v36;
    uint64_t v53 = 0LL;
    uint64_t v37 = v42;
    id v51 = v37;
    id v50 = v14;
    int64_t v54 = v30;
    uint64_t v38 = (void *)objc_claimAutoreleasedReturnValue( +[VCPMADServiceImageProcessingTask taskWithRequests:forAsset:cancelBlock:andCompletionHandler:]( &OBJC_CLASS___VCPMADServiceImageProcessingTask,  "taskWithRequests:forAsset:cancelBlock:andCompletionHandler:",  v50,  v31,  &stru_1001BB518,  v48));
    [v38 setSignpostPayload:v36];
    queuingTaskScheduler = self->_queuingTaskScheduler;
    v45[0] = _NSConcreteStackBlock;
    v45[1] = 3221225472LL;
    v45[2] = sub_1000509C8;
    v45[3] = &unk_1001B9AD0;
    id v46 = v37;
    int64_t v47 = v30;
    -[MADServiceClientTaskQueuingScheduler submitClientTask:withRequestID:schedulingErrorHandler:]( queuingTaskScheduler,  "submitClientTask:withRequestID:schedulingErrorHandler:",  v38,  (int)v9,  v45);

    id v34 = v40;
    int v33 = v49;
  }

  objc_autoreleasePoolPop(v22);
}

- (void)requestImageProcessing:(id)a3 forImageData:(id)a4 withUniformTypeIdentifier:(id)a5 identifier:(id)a6 requestID:(int)a7 andReply:(id)a8
{
  uint64_t v9 = *(void *)&a7;
  id v45 = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = a6;
  id v46 = a8;
  uint64_t v18 = MediaAnalysisLogLevel(v46, v17);
  if ((int)v18 >= 6)
  {
    uint64_t v20 = VCPLogInstance(v18, v19);
    os_log_type_t v21 = (os_log_s *)objc_claimAutoreleasedReturnValue(v20);
    os_log_type_t v22 = VCPLogToOSLogType[6];
    if (os_log_type_enabled(v21, v22))
    {
      *(_DWORD *)buf = 67109120;
      LODWORD(v57) = v9;
      _os_log_impl( (void *)&_mh_execute_header,  v21,  v22,  "[MAClientHandler] Received on-demand image processing request (ImageData) with MADRequestID %d",  buf,  8u);
    }
  }

  uint64_t v23 = objc_autoreleasePoolPush();
  uint64_t v24 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Request: %d Identifier: %@",  v9,  v16));
  uint64_t v25 = VCPSignPostLog(v24);
  uint64_t v26 = (os_log_s *)objc_claimAutoreleasedReturnValue(v25);
  os_signpost_id_t v27 = os_signpost_id_generate(v26);

  uint64_t v29 = VCPSignPostLog(v28);
  int64_t v30 = (os_log_s *)objc_claimAutoreleasedReturnValue(v29);
  CVReturn v31 = v30;
  if (v27 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v30))
  {
    *(_DWORD *)buf = 138412290;
    v57 = v24;
    _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v31,  OS_SIGNPOST_INTERVAL_BEGIN,  v27,  "VCPMediaAnalysisClientHandler_URL",  "%@",  buf,  0xCu);
  }

  BOOL v32 = (void *)objc_claimAutoreleasedReturnValue( +[VCPMADServiceImageAsset assetWithImageData:uniformTypeIdentifier:identifier:clientBundleID:clientTeamID:]( &OBJC_CLASS___VCPMADServiceImageAsset,  "assetWithImageData:uniformTypeIdentifier:identifier:clientBundleID:clientTeamID:",  v14,  v15,  v16,  self->_clientBundleID,  self->_clientTeamID));
  id v43 = v16;
  id v44 = v15;
  v42 = v32;
  BOOL v33 = self->_userSafetyEntitled
     && +[MADUserSafetySettings isEnabledForTask:]( &OBJC_CLASS___MADUserSafetySettings,  "isEnabledForTask:",  self->_secTask.value_);
  [v32 setUserSafetyEligible:v33];
  v49[0] = _NSConcreteStackBlock;
  v49[1] = 3221225472LL;
  v49[2] = sub_100050E78;
  v49[3] = &unk_1001BB4F8;
  int v55 = v9;
  os_signpost_id_t v53 = v27;
  id v34 = v24;
  id v50 = v34;
  uint64_t v54 = 0LL;
  id v35 = v46;
  id v52 = v35;
  id v36 = v45;
  id v51 = v36;
  uint64_t v37 = (void *)objc_claimAutoreleasedReturnValue( +[VCPMADServiceImageProcessingTask taskWithRequests:forAsset:cancelBlock:andCompletionHandler:]( &OBJC_CLASS___VCPMADServiceImageProcessingTask,  "taskWithRequests:forAsset:cancelBlock:andCompletionHandler:",  v36,  v32,  &stru_1001BB560,  v49));
  uint64_t v38 = v14;
  [v37 setSignpostPayload:v34];
  queuingTaskScheduler = self->_queuingTaskScheduler;
  uint64_t v40 = (int)v9;
  v47[0] = _NSConcreteStackBlock;
  v47[1] = 3221225472LL;
  v47[2] = sub_100051024;
  v47[3] = &unk_1001B9A60;
  id v41 = v35;
  id v48 = v41;
  -[MADServiceClientTaskQueuingScheduler submitClientTask:withRequestID:schedulingErrorHandler:]( queuingTaskScheduler,  "submitClientTask:withRequestID:schedulingErrorHandler:",  v37,  v40,  v47);

  objc_autoreleasePoolPop(v23);
}

- (id)assetWithIdentifier:(id)a3 identifierType:(unint64_t)a4 fromPhotoLibraryWithURL:(id)a5 error:(id *)a6
{
  id v9 = a3;
  id v10 = a5;
  uint64_t v11 = v10;
  if (v9)
  {
    if (a4 == 2 && !v10)
    {
      uint64_t v12 = objc_claimAutoreleasedReturnValue( +[PHPhotoLibrary wellKnownPhotoLibraryURLForIdentifier:]( &OBJC_CLASS___PHPhotoLibrary,  "wellKnownPhotoLibraryURLForIdentifier:",  3LL));
      uint64_t v14 = MediaAnalysisLogLevel(v12, v13);
      if ((int)v14 >= 7)
      {
        uint64_t v16 = VCPLogInstance(v14, v15);
        uint64_t v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);
        os_log_type_t v18 = VCPLogToOSLogType[7];
        if (os_log_type_enabled(v17, v18))
        {
          *(_DWORD *)buf = 138412290;
          uint64_t v58 = v12;
          _os_log_impl( (void *)&_mh_execute_header,  v17,  v18,  "[MAClientHandler] Fetch Syndication Photo library at %@",  buf,  0xCu);
        }
      }

      uint64_t v11 = (void *)v12;
    }

    uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue(+[VCPPhotoLibraryManager sharedManager](&OBJC_CLASS___VCPPhotoLibraryManager, "sharedManager"));
    uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue([v19 photoLibraryWithURL:v11]);

    if (!v20)
    {
      if (!a6)
      {
        BOOL v33 = 0LL;
        goto LABEL_37;
      }

      NSErrorUserInfoKey v55 = NSLocalizedDescriptionKey;
      uint64_t v28 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"[MAClientHandler] Specified Photo Library is invalid (%@)",  v11));
      NSErrorUserInfoKey v56 = v28;
      id v34 = (id)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v56,  &v55,  1LL));
      id v35 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  NSOSStatusErrorDomain,  -50LL,  v34));
      id v36 = *a6;
      *a6 = v35;

LABEL_35:
      BOOL v33 = 0LL;
      goto LABEL_36;
    }

    uint64_t v23 = MediaAnalysisLogLevel(v21, v22);
    if ((int)v23 >= 7)
    {
      uint64_t v25 = VCPLogInstance(v23, v24);
      uint64_t v26 = (os_log_s *)objc_claimAutoreleasedReturnValue(v25);
      os_log_type_t v27 = VCPLogToOSLogType[7];
      if (os_log_type_enabled(v26, v27))
      {
        *(_DWORD *)buf = 138412290;
        uint64_t v58 = (uint64_t)v9;
        _os_log_impl( (void *)&_mh_execute_header,  v26,  v27,  "[MAClientHandler] Fetching Photos asset with identifier %@",  buf,  0xCu);
      }
    }

    uint64_t v28 = (void *)objc_claimAutoreleasedReturnValue( +[PHFetchOptions fetchOptionsWithInclusiveDefaultsForPhotoLibrary:]( &OBJC_CLASS___PHFetchOptions,  "fetchOptionsWithInclusiveDefaultsForPhotoLibrary:",  v20));
    [v28 setIncludeHiddenAssets:1];
    [v28 setIncludeTrashedAssets:1];
    [v28 setIncludeGuestAssets:1];
    v54[0] = PHAssetPropertySetCharacterRecognition;
    v54[1] = PHAssetPropertySetMediaAnalysis;
    v54[2] = PHAssetPropertySetOriginalMetadata;
    v54[3] = PHAssetPropertySetPhotoIris;
    v54[4] = PHAssetPropertySetSceneAnalysis;
    v54[5] = PHAssetPropertySetVisualSearch;
    v54[6] = PHAssetPropertySetPhotosInfoPanelExtended;
    uint64_t v29 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v54, 7LL));
    [v28 addFetchPropertySets:v29];

    if (a4 == 1)
    {
      id v52 = v9;
      int64_t v30 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v52, 1LL));
      uint64_t v31 = objc_claimAutoreleasedReturnValue( +[PHAsset fetchAssetsWithCloudIdentifiers:options:]( &OBJC_CLASS___PHAsset,  "fetchAssetsWithCloudIdentifiers:options:",  v30,  v28));
    }

    else if (a4)
    {
      if (a4 != 2)
      {
        id v34 = 0LL;
        goto LABEL_26;
      }

      id v51 = v9;
      int64_t v30 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v51, 1LL));
      uint64_t v31 = objc_claimAutoreleasedReturnValue( +[PHAsset fetchAssetsWithSyndicationIdentifiers:options:]( &OBJC_CLASS___PHAsset,  "fetchAssetsWithSyndicationIdentifiers:options:",  v30,  v28));
    }

    else
    {
      id v53 = v9;
      int64_t v30 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v53, 1LL));
      uint64_t v31 = objc_claimAutoreleasedReturnValue( +[PHAsset fetchAssetsWithLocalIdentifiers:options:]( &OBJC_CLASS___PHAsset,  "fetchAssetsWithLocalIdentifiers:options:",  v30,  v28));
    }

    id v34 = (id)v31;

LABEL_26:
    if ([v34 count])
    {
      id v37 = [v34 count];
      if ((unint64_t)v37 >= 2)
      {
        uint64_t v39 = MediaAnalysisLogLevel(v37, v38);
        if ((int)v39 >= 4)
        {
          uint64_t v41 = VCPLogInstance(v39, v40);
          v42 = (os_log_s *)objc_claimAutoreleasedReturnValue(v41);
          os_log_type_t v43 = VCPLogToOSLogType[4];
          if (os_log_type_enabled(v42, v43))
          {
            *(_DWORD *)buf = 138412290;
            uint64_t v58 = (uint64_t)v9;
            _os_log_impl( (void *)&_mh_execute_header,  v42,  v43,  "[MAClientHandler] Fetch returned multiple assets for identifier (%@)",  buf,  0xCu);
          }
        }
      }

      BOOL v33 = (void *)objc_claimAutoreleasedReturnValue([v34 firstObject]);
      goto LABEL_36;
    }

    if (a6)
    {
      NSErrorUserInfoKey v49 = NSLocalizedDescriptionKey;
      id v44 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"[MAClientHandler] Specified identifier not found (%@)",  v9));
      id v50 = v44;
      id v45 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v50,  &v49,  1LL));
      id v46 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  NSOSStatusErrorDomain,  -50LL,  v45));
      id v47 = *a6;
      *a6 = v46;
    }

    goto LABEL_35;
  }

  if (a6)
  {
    NSErrorUserInfoKey v59 = NSLocalizedDescriptionKey;
    uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"[MAClientHandler] Specified nil identifier"));
    v60 = v20;
    uint64_t v28 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v60,  &v59,  1LL));
    BOOL v32 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  NSOSStatusErrorDomain,  -50LL,  v28));
    BOOL v33 = 0LL;
    id v34 = *a6;
    *a6 = v32;
LABEL_36:

LABEL_37:
    goto LABEL_38;
  }

  BOOL v33 = 0LL;
LABEL_38:

  return v33;
}

- (void)requestImageProcessing:(id)a3 forAssetWithIdentifier:(id)a4 identifierType:(unint64_t)a5 fromPhotoLibraryWithURL:(id)a6 requestID:(int)a7 andReply:(id)a8
{
  uint64_t v9 = *(void *)&a7;
  id v14 = a3;
  id v15 = a4;
  id v39 = a6;
  id v40 = a8;
  uint64_t v17 = MediaAnalysisLogLevel(v40, v16);
  if ((int)v17 >= 6)
  {
    uint64_t v19 = VCPLogInstance(v17, v18);
    uint64_t v20 = (os_log_s *)objc_claimAutoreleasedReturnValue(v19);
    os_log_type_t v21 = VCPLogToOSLogType[6];
    if (os_log_type_enabled(v20, v21))
    {
      *(_DWORD *)buf = 67109120;
      *(_DWORD *)&uint8_t buf[4] = v9;
      _os_log_impl( (void *)&_mh_execute_header,  v20,  v21,  "[MAClientHandler] Received on-demand image processing request (Photos) with MADRequestID %d",  buf,  8u);
    }
  }

  uint64_t v22 = objc_autoreleasePoolPush();
  uint64_t v38 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Request: %d Identifier: (%lu)%@",  v9,  a5,  v15));
  uint64_t v23 = VCPSignPostLog(v38);
  uint64_t v24 = (os_log_s *)objc_claimAutoreleasedReturnValue(v23);
  os_signpost_id_t v25 = os_signpost_id_generate(v24);

  uint64_t v27 = VCPSignPostLog(v26);
  uint64_t v28 = (os_log_s *)objc_claimAutoreleasedReturnValue(v27);
  uint64_t v29 = v28;
  if (v25 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v28))
  {
    *(_DWORD *)buf = 138412290;
    *(void *)&uint8_t buf[4] = v38;
    _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v29,  OS_SIGNPOST_INTERVAL_BEGIN,  v25,  "VCPMediaAnalysisClientHandler_PHAsset",  "%@",  buf,  0xCu);
  }

  *(void *)buf = 0LL;
  int64_t v30 = (void *)objc_claimAutoreleasedReturnValue( -[VCPMediaAnalysisClientHandler assetWithIdentifier:identifierType:fromPhotoLibraryWithURL:error:]( self,  "assetWithIdentifier:identifierType:fromPhotoLibraryWithURL:error:",  v15,  a5,  v39,  buf));
  if (v30)
  {
    id v37 = v14;
    uint64_t v31 = (void *)objc_claimAutoreleasedReturnValue( +[VCPMADServiceImageAsset assetWithPhotosAsset:clientBundleID:clientTeamID:]( &OBJC_CLASS___VCPMADServiceImageAsset,  "assetWithPhotosAsset:clientBundleID:clientTeamID:",  v30,  self->_clientBundleID,  self->_clientTeamID));
    BOOL v32 = self->_userSafetyEntitled
       && +[MADUserSafetySettings isEnabledForTask:]( &OBJC_CLASS___MADUserSafetySettings,  "isEnabledForTask:",  self->_secTask.value_);
    [v31 setUserSafetyEligible:v32];
    v43[0] = _NSConcreteStackBlock;
    v43[1] = 3221225472LL;
    v43[2] = sub_100051B68;
    v43[3] = &unk_1001BB4F8;
    int v49 = v9;
    os_signpost_id_t v47 = v25;
    id v33 = v38;
    id v44 = v33;
    uint64_t v48 = 0LL;
    id v34 = v40;
    id v46 = v34;
    id v45 = v37;
    id v35 = (void *)objc_claimAutoreleasedReturnValue( +[VCPMADServiceImageProcessingTask taskWithRequests:forAsset:cancelBlock:andCompletionHandler:]( &OBJC_CLASS___VCPMADServiceImageProcessingTask,  "taskWithRequests:forAsset:cancelBlock:andCompletionHandler:",  v45,  v31,  &stru_1001BB580,  v43));
    [v35 setSignpostPayload:v33];
    queuingTaskScheduler = self->_queuingTaskScheduler;
    v41[0] = _NSConcreteStackBlock;
    v41[1] = 3221225472LL;
    v41[2] = sub_100051D14;
    v41[3] = &unk_1001B9A60;
    id v42 = v34;
    -[MADServiceClientTaskQueuingScheduler submitClientTask:withRequestID:schedulingErrorHandler:]( queuingTaskScheduler,  "submitClientTask:withRequestID:schedulingErrorHandler:",  v35,  (int)v9,  v41);

    id v14 = v37;
  }

  else
  {
    (*((void (**)(id, void, void))v40 + 2))(v40, 0LL, *(void *)buf);
  }

  objc_autoreleasePoolPop(v22);
}

- (void)requestImageProcessing:(id)a3 forIOSurface:(id)a4 withOrientation:(unsigned int)a5 assetLocalIdentifier:(id)a6 photoLibraryURL:(id)a7 requestID:(int)a8 andReply:(id)a9
{
  uint64_t v9 = *(void *)&a8;
  uint64_t v12 = *(void *)&a5;
  id v15 = a3;
  surface = (__IOSurface *)a4;
  id v16 = a6;
  id v44 = a7;
  uint64_t v17 = (void (**)(id, void, void *))a9;
  uint64_t v19 = MediaAnalysisLogLevel(v17, v18);
  if ((int)v19 >= 6)
  {
    uint64_t v21 = VCPLogInstance(v19, v20);
    uint64_t v22 = (os_log_s *)objc_claimAutoreleasedReturnValue(v21);
    os_log_type_t v23 = VCPLogToOSLogType[6];
    if (os_log_type_enabled(v22, v23))
    {
      *(_DWORD *)buf = 67109120;
      *(_DWORD *)&uint8_t buf[4] = v9;
      _os_log_impl( (void *)&_mh_execute_header,  v22,  v23,  "[MAClientHandler] Received on-demand image processing request (Photos+IOSurface) with MADRequestID %d",  buf,  8u);
    }
  }

  context = objc_autoreleasePoolPush();
  id v42 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Request: %d Identifier: %@",  v9,  v16));
  uint64_t v24 = VCPSignPostLog(v42);
  os_signpost_id_t v25 = (os_log_s *)objc_claimAutoreleasedReturnValue(v24);
  os_signpost_id_t v26 = os_signpost_id_generate(v25);

  uint64_t v28 = VCPSignPostLog(v27);
  uint64_t v29 = (os_log_s *)objc_claimAutoreleasedReturnValue(v28);
  int64_t v30 = v29;
  if (v26 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v29))
  {
    *(_DWORD *)buf = 138412290;
    *(void *)&uint8_t buf[4] = v42;
    _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v30,  OS_SIGNPOST_INTERVAL_BEGIN,  v26,  "VCPMediaAnalysisClientHandler_PHAsset",  "%@",  buf,  0xCu);
  }

  *(void *)buf = 0LL;
  uint64_t v31 = (void *)objc_claimAutoreleasedReturnValue( -[VCPMediaAnalysisClientHandler assetWithIdentifier:identifierType:fromPhotoLibraryWithURL:error:]( self,  "assetWithIdentifier:identifierType:fromPhotoLibraryWithURL:error:",  v16,  0LL,  v44,  buf));
  if (v31)
  {
    CVPixelBufferRef pixelBufferOut = 0LL;
    CVReturn v32 = CVPixelBufferCreateWithIOSurface(0LL, surface, 0LL, &pixelBufferOut);
    if (v32)
    {
      NSErrorUserInfoKey v55 = NSLocalizedDescriptionKey;
      id v33 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"[MAClientHandler] Failed to create CVPixelBuffer from specified IOSurface"));
      NSErrorUserInfoKey v56 = v33;
      id v34 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v56,  &v55,  1LL));
      id v35 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  NSOSStatusErrorDomain,  v32,  v34));
      v17[2](v17, 0LL, v35);
    }

    else
    {
      id v33 = (void *)objc_claimAutoreleasedReturnValue( +[VCPMADServiceImageAsset assetWithPhotosAsset:pixelBuffer:orientation:clientBundleID:clientTeamID:]( &OBJC_CLASS___VCPMADServiceImageAsset,  "assetWithPhotosAsset:pixelBuffer:orientation:clientBundleID:clientTeamID:",  v31,  pixelBufferOut,  v12,  self->_clientBundleID,  self->_clientTeamID));
      BOOL v36 = self->_userSafetyEntitled
         && +[MADUserSafetySettings isEnabledForTask:]( &OBJC_CLASS___MADUserSafetySettings,  "isEnabledForTask:",  self->_secTask.value_);
      [v33 setUserSafetyEligible:v36];
      v47[0] = _NSConcreteStackBlock;
      v47[1] = 3221225472LL;
      v47[2] = sub_1000522C8;
      v47[3] = &unk_1001BB4F8;
      int v53 = v9;
      os_signpost_id_t v51 = v26;
      id v37 = v42;
      id v48 = v37;
      uint64_t v52 = 0LL;
      uint64_t v38 = v17;
      id v50 = v38;
      id v49 = v15;
      id v39 = (void *)objc_claimAutoreleasedReturnValue( +[VCPMADServiceImageProcessingTask taskWithRequests:forAsset:cancelBlock:andCompletionHandler:]( &OBJC_CLASS___VCPMADServiceImageProcessingTask,  "taskWithRequests:forAsset:cancelBlock:andCompletionHandler:",  v49,  v33,  &stru_1001BB5A0,  v47));
      [v39 setSignpostPayload:v37];
      queuingTaskScheduler = self->_queuingTaskScheduler;
      v45[0] = _NSConcreteStackBlock;
      v45[1] = 3221225472LL;
      v45[2] = sub_100052474;
      v45[3] = &unk_1001B9A60;
      id v46 = v38;
      -[MADServiceClientTaskQueuingScheduler submitClientTask:withRequestID:schedulingErrorHandler:]( queuingTaskScheduler,  "submitClientTask:withRequestID:schedulingErrorHandler:",  v39,  (int)v9,  v45);

      id v34 = v48;
    }

    sub_10000421C((const void **)&pixelBufferOut);
  }

  else
  {
    v17[2](v17, 0LL, *(void **)buf);
  }

  objc_autoreleasePoolPop(context);
}

- (void)requestImageProcessing:(id)a3 forAssetWithCloudIdentifier:(id)a4 requestID:(int)a5 andReply:(id)a6
{
  uint64_t v7 = *(void *)&a5;
  id v10 = a3;
  id v59 = a4;
  id v58 = a6;
  uint64_t v12 = MediaAnalysisLogLevel(v58, v11);
  if ((int)v12 >= 6)
  {
    uint64_t v14 = VCPLogInstance(v12, v13);
    id v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
    os_log_type_t v16 = VCPLogToOSLogType[6];
    if (os_log_type_enabled(v15, v16))
    {
      *(_DWORD *)buf = 67109120;
      LODWORD(v74) = v7;
      _os_log_impl( (void *)&_mh_execute_header,  v15,  v16,  "[MAClientHandler] Received on-demand image processing request (Photos) with MADRequestID %d",  buf,  8u);
    }
  }

  context = objc_autoreleasePoolPush();
  v57 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Request: %d Identifier: %@",  v7,  v59));
  uint64_t v17 = VCPSignPostLog(v57);
  uint64_t v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(v17);
  os_signpost_id_t v19 = os_signpost_id_generate(v18);

  uint64_t v21 = VCPSignPostLog(v20);
  uint64_t v22 = (os_log_s *)objc_claimAutoreleasedReturnValue(v21);
  os_log_type_t v23 = v22;
  if (v19 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v22))
  {
    *(_DWORD *)buf = 138412290;
    id v74 = v57;
    _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v23,  OS_SIGNPOST_INTERVAL_BEGIN,  v19,  "VCPMediaAnalysisClientHandler_PHAsset",  "%@",  buf,  0xCu);
  }

  uint64_t v24 = (void *)objc_claimAutoreleasedReturnValue(+[PHPhotoLibrary vcp_defaultPhotoLibrary](&OBJC_CLASS___PHPhotoLibrary, "vcp_defaultPhotoLibrary"));
  id v25 = objc_msgSend(v24, "vcp_isCPLEnabled");
  if ((v25 & 1) != 0)
  {
    id v72 = 0LL;
    uint64_t v27 = MediaAnalysisLogLevel(v25, v26);
    if ((int)v27 >= 7)
    {
      uint64_t v29 = VCPLogInstance(v27, v28);
      int64_t v30 = (os_log_s *)objc_claimAutoreleasedReturnValue(v29);
      os_log_type_t v31 = VCPLogToOSLogType[7];
      if (os_log_type_enabled(v30, v31))
      {
        *(_DWORD *)buf = 138412546;
        id v74 = v59;
        __int16 v75 = 1024;
        int v76 = v7;
        _os_log_impl( (void *)&_mh_execute_header,  v30,  v31,  "[MAClientHandler] Process asset (%@) for MADRequestID %d",  buf,  0x12u);
      }
    }

    CVReturn v32 = (void *)objc_claimAutoreleasedReturnValue([v24 photoLibraryURL]);
    id v33 = (void *)objc_claimAutoreleasedReturnValue( -[VCPMediaAnalysisClientHandler assetWithIdentifier:identifierType:fromPhotoLibraryWithURL:error:]( self,  "assetWithIdentifier:identifierType:fromPhotoLibraryWithURL:error:",  v59,  1LL,  v32,  &v72));

    if (v33)
    {
      NSErrorUserInfoKey v55 = (void *)objc_claimAutoreleasedReturnValue( +[VCPMADServiceImageAsset assetWithPhotosAsset:clientBundleID:clientTeamID:]( &OBJC_CLASS___VCPMADServiceImageAsset,  "assetWithPhotosAsset:clientBundleID:clientTeamID:",  v33,  self->_clientBundleID,  self->_clientTeamID));
      BOOL v36 = self->_userSafetyEntitled
         && +[MADUserSafetySettings isEnabledForTask:]( &OBJC_CLASS___MADUserSafetySettings,  "isEnabledForTask:",  self->_secTask.value_);
      [v55 setUserSafetyEligible:v36];
      v64[0] = _NSConcreteStackBlock;
      v64[1] = 3221225472LL;
      v64[2] = sub_100052BD8;
      v64[3] = &unk_1001BB5E8;
      int v71 = v7;
      os_signpost_id_t v69 = v19;
      id v50 = v57;
      id v65 = v50;
      uint64_t v70 = 0LL;
      id v51 = v59;
      id v66 = v51;
      id v52 = v58;
      id v68 = v52;
      id v67 = v10;
      int v53 = (void *)objc_claimAutoreleasedReturnValue( +[VCPMADServiceImageProcessingTask taskWithRequests:forAsset:cancelBlock:andCompletionHandler:]( &OBJC_CLASS___VCPMADServiceImageProcessingTask,  "taskWithRequests:forAsset:cancelBlock:andCompletionHandler:",  v67,  v55,  &stru_1001BB5C0,  v64));
      [v53 setSignpostPayload:v50];
      queuingTaskScheduler = self->_queuingTaskScheduler;
      v60[0] = _NSConcreteStackBlock;
      v60[1] = 3221225472LL;
      void v60[2] = sub_100052E90;
      v60[3] = &unk_1001BB610;
      id v61 = v51;
      int v63 = v7;
      id v62 = v52;
      -[MADServiceClientTaskQueuingScheduler submitClientTask:withRequestID:schedulingErrorHandler:]( queuingTaskScheduler,  "submitClientTask:withRequestID:schedulingErrorHandler:",  v53,  (int)v7,  v60);
    }

    else
    {
      uint64_t v45 = MediaAnalysisLogLevel(v34, v35);
      if ((int)v45 >= 3)
      {
        uint64_t v47 = VCPLogInstance(v45, v46);
        id v48 = (os_log_s *)objc_claimAutoreleasedReturnValue(v47);
        os_log_type_t v49 = VCPLogToOSLogType[3];
        if (os_log_type_enabled(v48, v49))
        {
          *(_DWORD *)buf = 138412802;
          id v74 = v59;
          __int16 v75 = 1024;
          int v76 = v7;
          __int16 v77 = 2112;
          id v78 = v72;
          _os_log_impl( (void *)&_mh_execute_header,  v48,  v49,  "[MAClientHandler] Failed to fetch asset (%@) for MADRequestID %d - %@",  buf,  0x1Cu);
        }
      }

      (*((void (**)(id, void, id))v58 + 2))(v58, 0LL, v72);
    }
  }

  else
  {
    uint64_t v37 = MediaAnalysisLogLevel(v25, v26);
    if ((int)v37 >= 3)
    {
      uint64_t v39 = VCPLogInstance(v37, v38);
      id v40 = (os_log_s *)objc_claimAutoreleasedReturnValue(v39);
      os_log_type_t v41 = VCPLogToOSLogType[3];
      if (os_log_type_enabled(v40, v41))
      {
        *(_DWORD *)buf = 67109120;
        LODWORD(v74) = v7;
        _os_log_impl( (void *)&_mh_execute_header,  v40,  v41,  "[MAClientHandler] iCloud photo library is not enabled for MADRequestID %d",  buf,  8u);
      }
    }

    NSErrorUserInfoKey v79 = NSLocalizedDescriptionKey;
    id v42 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"iCloud photo library is not enabled"));
    v80 = v42;
    os_log_type_t v43 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v80,  &v79,  1LL));
    id v44 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  NSOSStatusErrorDomain,  -18LL,  v43));
    (*((void (**)(id, void, void *))v58 + 2))(v58, 0LL, v44);
  }

  objc_autoreleasePoolPop(context);
}

- (void)requestImageProcessingWithCloudIdentifierRequests:(id)a3 requestID:(int)a4 andReply:(id)a5
{
  uint64_t v6 = *(void *)&a4;
  id v8 = a3;
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
      int v46 = v6;
      _os_log_impl( (void *)&_mh_execute_header,  v14,  v15,  "[MAClientHandler] Received on-demand image processing request (Photos) with MADRequestID %d",  buf,  8u);
    }
  }

  os_log_type_t v16 = (void *)objc_claimAutoreleasedReturnValue(+[PHPhotoLibrary vcp_defaultPhotoLibrary](&OBJC_CLASS___PHPhotoLibrary, "vcp_defaultPhotoLibrary"));
  id v17 = objc_msgSend(v16, "vcp_isCPLEnabled");
  if ((v17 & 1) != 0)
  {
    id v33 = v9;
    id v34 = v8;
    os_signpost_id_t v19 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"MADRequestID: %d",  v6));
    clientBundleID = self->_clientBundleID;
    clientTeamID = self->_clientTeamID;
    v39[0] = _NSConcreteStackBlock;
    v39[1] = 3221225472LL;
    v39[2] = sub_1000533C0;
    v39[3] = &unk_1001BB658;
    int v42 = v6;
    id v22 = v9;
    id v41 = v22;
    id v23 = v8;
    id v40 = v23;
    uint64_t v24 = (void *)objc_claimAutoreleasedReturnValue( +[VCPMADServiceImageProcessingTaskBatch taskWithCloudIdentifierRequests:photoLibrary:clientBundleID:clientTeamID:cancelBlock:andCompletionHandler:]( &OBJC_CLASS___VCPMADServiceImageProcessingTaskBatch,  "taskWithCloudIdentifierRequests:photoLibrary:clientBundleID:clientTeamID:cancelBlock:andCompletionHandler:",  v23,  v16,  clientBundleID,  clientTeamID,  &stru_1001BB630,  v39));
    [v24 setSignpostPayload:v19];
    queuingTaskScheduler = self->_queuingTaskScheduler;
    v35[0] = _NSConcreteStackBlock;
    v35[1] = 3221225472LL;
    v35[2] = sub_100053550;
    v35[3] = &unk_1001BB610;
    id v36 = v23;
    int v38 = v6;
    id v37 = v22;
    -[MADServiceClientTaskQueuingScheduler submitClientTask:withRequestID:schedulingErrorHandler:]( queuingTaskScheduler,  "submitClientTask:withRequestID:schedulingErrorHandler:",  v24,  (int)v6,  v35);

    id v9 = v33;
    id v8 = v34;

    uint64_t v26 = v41;
  }

  else
  {
    uint64_t v27 = MediaAnalysisLogLevel(v17, v18);
    if ((int)v27 >= 3)
    {
      uint64_t v29 = VCPLogInstance(v27, v28);
      int64_t v30 = (os_log_s *)objc_claimAutoreleasedReturnValue(v29);
      os_log_type_t v31 = VCPLogToOSLogType[3];
      if (os_log_type_enabled(v30, v31))
      {
        *(_DWORD *)buf = 67109120;
        int v46 = v6;
        _os_log_impl( (void *)&_mh_execute_header,  v30,  v31,  "[MAClientHandler] iCloud photo library is not enabled for MADRequestID %d",  buf,  8u);
      }
    }

    NSErrorUserInfoKey v43 = NSLocalizedDescriptionKey;
    os_signpost_id_t v19 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"iCloud photo library is not enabled"));
    id v44 = v19;
    uint64_t v26 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v44,  &v43,  1LL));
    CVReturn v32 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  NSOSStatusErrorDomain,  -18LL,  v26));
    (*((void (**)(id, void, void *))v9 + 2))(v9, 0LL, v32);
  }
}

- (void)requestVideoProcessing:(id)a3 asset:(id)a4 requestID:(int)a5 isIncremental:(BOOL)a6 reply:(id)a7
{
  BOOL v8 = a6;
  uint64_t v9 = *(void *)&a5;
  id v12 = a3;
  id v13 = a4;
  id v32 = a7;
  id v34 = v13;
  uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue([v13 identifier]);
  id v33 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Request: %d Identifier: %@",  v9,  v14));

  uint64_t v16 = VCPSignPostLog(v15);
  id v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);
  os_signpost_id_t v18 = os_signpost_id_generate(v17);

  uint64_t v20 = VCPSignPostLog(v19);
  uint64_t v21 = (os_log_s *)objc_claimAutoreleasedReturnValue(v20);
  id v22 = v21;
  if (v18 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v21))
  {
    *(_DWORD *)buf = 138412290;
    id v48 = v33;
    _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v22,  OS_SIGNPOST_INTERVAL_BEGIN,  v18,  "VCPMediaAnalysisClientHandler_VideoE2E",  "%@",  buf,  0xCu);
  }

  v45[0] = _NSConcreteStackBlock;
  v45[1] = 3221225472LL;
  v45[2] = sub_1000539F0;
  v45[3] = &unk_1001B9AF8;
  void v45[4] = self;
  int v46 = v9;
  id v23 = objc_retainBlock(v45);
  if (v8)
  {
    v43[0] = _NSConcreteStackBlock;
    v43[1] = 3221225472LL;
    v43[2] = sub_100053A0C;
    v43[3] = &unk_1001BB680;
    void v43[4] = self;
    int v44 = v9;
    uint64_t v24 = objc_retainBlock(v43);
  }

  else
  {
    uint64_t v24 = 0LL;
  }

  v37[0] = _NSConcreteStackBlock;
  v37[1] = 3221225472LL;
  v37[2] = sub_100053A38;
  v37[3] = &unk_1001BB6C8;
  int v42 = v9;
  os_signpost_id_t v40 = v18;
  id v25 = v33;
  id v38 = v25;
  uint64_t v41 = 0LL;
  id v26 = v32;
  id v39 = v26;
  uint64_t v27 = (void *)objc_claimAutoreleasedReturnValue( +[MADServiceVideoProcessingTask taskWithRequests:forAsset:cancelBlock:progressHandler:resultHandler:andCompletionHandler:]( &OBJC_CLASS___MADServiceVideoProcessingTask,  "taskWithRequests:forAsset:cancelBlock:progressHandler:resultHandler:andCompletionHandler:",  v12,  v13,  &stru_1001BB6A0,  v23,  v24,  v37));
  uint64_t v28 = v12;
  [v27 setSignpostPayload:v25];
  queuingTaskScheduler = self->_queuingTaskScheduler;
  uint64_t v30 = (int)v9;
  v35[0] = _NSConcreteStackBlock;
  v35[1] = 3221225472LL;
  v35[2] = sub_100053BFC;
  v35[3] = &unk_1001B9A60;
  id v31 = v26;
  id v36 = v31;
  -[MADServiceClientTaskQueuingScheduler submitClientTask:withRequestID:schedulingErrorHandler:]( queuingTaskScheduler,  "submitClientTask:withRequestID:schedulingErrorHandler:",  v27,  v30,  v35);
}

- (void)requestVideoProcessing:(id)a3 assetURL:(id)a4 sandboxToken:(id)a5 identifier:(id)a6 requestID:(int)a7 reply:(id)a8
{
  uint64_t v9 = *(void *)&a7;
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  os_signpost_id_t v18 = (void (**)(id, void, void *))a8;
  int64_t v19 = -[VCPMediaAnalysisClientHandler consumeSandboxExtension:url:](self, "consumeSandboxExtension:url:", v16, v15);
  if (v19 < 0)
  {
    NSErrorUserInfoKey v27 = NSLocalizedDescriptionKey;
    uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"[MAClientHandler] Failed to consume sandbox extension"));
    uint64_t v28 = v20;
    id v22 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v28,  &v27,  1LL));
    id v23 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  NSOSStatusErrorDomain,  -50LL,  v22));
    v18[2](v18, 0LL, v23);
  }

  else
  {
    uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue( +[MADServiceVideoAsset assetWithURL:identifier:clientBundleID:clientTeamID:]( &OBJC_CLASS___MADServiceVideoAsset,  "assetWithURL:identifier:clientBundleID:clientTeamID:",  v15,  v17,  self->_clientBundleID,  self->_clientTeamID));
    BOOL v21 = self->_userSafetyEntitled
       && +[MADUserSafetySettings isEnabledForTask:]( &OBJC_CLASS___MADUserSafetySettings,  "isEnabledForTask:",  self->_secTask.value_);
    [v20 setUserSafetyEligible:v21];
    v24[0] = _NSConcreteStackBlock;
    v24[1] = 3221225472LL;
    v24[2] = sub_100053EBC;
    v24[3] = &unk_1001BB6F0;
    int64_t v26 = v19;
    id v25 = v18;
    -[VCPMediaAnalysisClientHandler requestVideoProcessing:asset:requestID:isIncremental:reply:]( self,  "requestVideoProcessing:asset:requestID:isIncremental:reply:",  v14,  v20,  v9,  0LL,  v24);
    id v22 = v25;
  }
}

- (void)requestVideoProcessing:(id)a3 assetIdentifier:(id)a4 identifierType:(unint64_t)a5 photoLibraryURL:(id)a6 requestID:(int)a7 isIncremental:(BOOL)a8 reply:(id)a9
{
  BOOL v9 = a8;
  uint64_t v10 = *(void *)&a7;
  id v15 = a3;
  id v16 = (void (**)(id, void, id))a9;
  id v20 = 0LL;
  id v17 = (void *)objc_claimAutoreleasedReturnValue( -[VCPMediaAnalysisClientHandler assetWithIdentifier:identifierType:fromPhotoLibraryWithURL:error:]( self,  "assetWithIdentifier:identifierType:fromPhotoLibraryWithURL:error:",  a4,  a5,  a6,  &v20));
  if (v17)
  {
    os_signpost_id_t v18 = (void *)objc_claimAutoreleasedReturnValue( +[MADServiceVideoAsset assetWithPhotosAsset:clientBundleID:clientTeamID:]( &OBJC_CLASS___MADServiceVideoAsset,  "assetWithPhotosAsset:clientBundleID:clientTeamID:",  v17,  self->_clientBundleID,  self->_clientTeamID));
    BOOL v19 = self->_userSafetyEntitled
       && +[MADUserSafetySettings isEnabledForTask:]( &OBJC_CLASS___MADUserSafetySettings,  "isEnabledForTask:",  self->_secTask.value_);
    [v18 setUserSafetyEligible:v19];
    -[VCPMediaAnalysisClientHandler requestVideoProcessing:asset:requestID:isIncremental:reply:]( self,  "requestVideoProcessing:asset:requestID:isIncremental:reply:",  v15,  v18,  v10,  v9,  v16);
  }

  else
  {
    v16[2](v16, 0LL, v20);
  }
}

- (void)requestVisionCacheStorageDirectoryURLForPhotoLibraryURL:(id)a3 reply:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v65 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"[MAClientHandler][VUGalleryDirectoryURLAccess]"));
  uint64_t v8 = MediaAnalysisLogLevel(v65, v7);
  if ((int)v8 >= 5)
  {
    uint64_t v10 = VCPLogInstance(v8, v9);
    uint64_t v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
    os_log_type_t v12 = VCPLogToOSLogType[5];
    if (os_log_type_enabled(v11, v12))
    {
      *(_DWORD *)buf = 138412546;
      int v76 = v65;
      __int16 v77 = 2112;
      id v78 = v5;
      _os_log_impl( (void *)&_mh_execute_header,  v11,  v12,  "%@ Received request for vision cache storage directory URL (%@)",  buf,  0x16u);
    }
  }

  if (v5)
  {
    id v13 = (void *)objc_claimAutoreleasedReturnValue(+[VCPPhotoLibraryManager sharedManager](&OBJC_CLASS___VCPPhotoLibraryManager, "sharedManager"));
    id v14 = (void *)objc_claimAutoreleasedReturnValue([v13 photoLibraryWithURL:v5]);

    if (v14) {
      goto LABEL_7;
    }
  }

  else
  {
    uint64_t v15 = objc_claimAutoreleasedReturnValue(+[PHPhotoLibrary vcp_defaultPhotoLibrary](&OBJC_CLASS___PHPhotoLibrary, "vcp_defaultPhotoLibrary"));
    id v14 = (void *)v15;
    if (v15)
    {
LABEL_7:
      v64 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "vcp_visionCacheStorageDirectoryURL"));
      id v17 = (void *)objc_claimAutoreleasedReturnValue([v64 URLByAppendingPathComponent:@"VUIndex.sqlite"]);
      if (!v17)
      {
        NSErrorUserInfoKey v71 = NSLocalizedDescriptionKey;
        BOOL v21 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@ Failed to query VUIndex URL for library %@",  v65,  v5));
        id v72 = v21;
        int v63 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v72,  &v71,  1LL));
        id v22 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  NSOSStatusErrorDomain,  -18LL));
        (*((void (**)(id, void, void, void *))v6 + 2))(v6, 0LL, 0LL, v22);
LABEL_41:

        goto LABEL_42;
      }

      id v66 = 0LL;
      id v18 = [[VUWGallery alloc] initWithPath:v17 error:&v66];
      id v19 = v66;
      BOOL v21 = v19;
      int v63 = v18;
      if (v18)
      {
        id v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "vcp_visionCacheStorageDirectoryURL"));
        uint64_t v24 = MediaAnalysisLogLevel(v22, v23);
        if ((int)v24 >= 7)
        {
          uint64_t v26 = VCPLogInstance(v24, v25);
          NSErrorUserInfoKey v27 = (os_log_s *)objc_claimAutoreleasedReturnValue(v26);
          os_log_type_t v28 = VCPLogToOSLogType[7];
          if (os_log_type_enabled(v27, v28))
          {
            *(_DWORD *)buf = 138412546;
            int v76 = v65;
            __int16 v77 = 2112;
            id v78 = v22;
            _os_log_impl( (void *)&_mh_execute_header,  v27,  v28,  "%@ Creating sandbox extension for directory %@",  buf,  0x16u);
          }
        }

        id v29 = objc_claimAutoreleasedReturnValue([v22 path]);
        id v30 = [v29 UTF8String];
        id v31 = (void *)sandbox_extension_issue_file(APP_SANDBOX_READ_WRITE, v30, SANDBOX_EXTENSION_DEFAULT);

        if (v31)
        {
          id v34 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", v31));
          free(v31);
          if ([v34 length])
          {
            id v35 = v34;
            id v36 = [v35 UTF8String];
            id v37 = v35;
            id v38 = +[NSData dataWithBytes:length:]( NSData,  "dataWithBytes:length:",  v36,  strlen((const char *)[v37 UTF8String]) + 1);
            id v39 = (void *)objc_claimAutoreleasedReturnValue(v38);

            if (v39)
            {
              uint64_t v40 = MediaAnalysisLogLevel(v32, v33);
              if ((int)v40 >= 7)
              {
                uint64_t v42 = VCPLogInstance(v40, v41);
                NSErrorUserInfoKey v43 = (os_log_s *)objc_claimAutoreleasedReturnValue(v42);
                os_log_type_t v44 = VCPLogToOSLogType[7];
                if (os_log_type_enabled(v43, v44))
                {
                  *(_DWORD *)buf = 138412290;
                  int v76 = v65;
                  _os_log_impl( (void *)&_mh_execute_header,  v43,  v44,  "%@ Returning sandbox extension for vision cache storage directory URL ...",  buf,  0xCu);
                }
              }

              (*((void (**)(id, void *, void *, void))v6 + 2))(v6, v22, v39, 0LL);
              goto LABEL_40;
            }
          }

          else
          {
          }
        }

        uint64_t v56 = MediaAnalysisLogLevel(v32, v33);
        if ((int)v56 >= 3)
        {
          uint64_t v58 = VCPLogInstance(v56, v57);
          id v59 = (os_log_s *)objc_claimAutoreleasedReturnValue(v58);
          os_log_type_t v60 = VCPLogToOSLogType[3];
          if (os_log_type_enabled(v59, v60))
          {
            *(_DWORD *)buf = 138412290;
            int v76 = v65;
            _os_log_impl((void *)&_mh_execute_header, v59, v60, "%@ Failed to generate sandbox extension", buf, 0xCu);
          }
        }

        NSErrorUserInfoKey v67 = NSLocalizedDescriptionKey;
        NSErrorUserInfoKey v55 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@ Failed to generate sandbox extension",  v65));
        id v68 = v55;
        id v61 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v68,  &v67,  1LL));
        id v62 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  NSOSStatusErrorDomain,  -18LL,  v61));
        (*((void (**)(id, void, void, void *))v6 + 2))(v6, 0LL, 0LL, v62);

        id v39 = 0LL;
      }

      else
      {
        uint64_t v50 = MediaAnalysisLogLevel(v19, v20);
        if ((int)v50 >= 3)
        {
          uint64_t v52 = VCPLogInstance(v50, v51);
          int v53 = (os_log_s *)objc_claimAutoreleasedReturnValue(v52);
          os_log_type_t v54 = VCPLogToOSLogType[3];
          if (os_log_type_enabled(v53, v54))
          {
            *(_DWORD *)buf = 138412546;
            int v76 = v65;
            __int16 v77 = 2112;
            id v78 = v14;
            _os_log_impl( (void *)&_mh_execute_header,  v53,  v54,  "%@ Failed to obtain gallery for Photo Library (%@)",  buf,  0x16u);
          }
        }

        NSErrorUserInfoKey v69 = NSLocalizedDescriptionKey;
        id v22 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@ Failed to obtain Gallery for Photo Library",  v65));
        uint64_t v70 = v22;
        id v39 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v70,  &v69,  1LL));
        NSErrorUserInfoKey v55 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  NSOSStatusErrorDomain,  -18LL,  v39));
        (*((void (**)(id, void, void, void *))v6 + 2))(v6, 0LL, 0LL, v55);
      }

LABEL_40:
      goto LABEL_41;
    }
  }

  uint64_t v45 = MediaAnalysisLogLevel(v15, v16);
  if ((int)v45 >= 3)
  {
    uint64_t v47 = VCPLogInstance(v45, v46);
    id v48 = (os_log_s *)objc_claimAutoreleasedReturnValue(v47);
    os_log_type_t v49 = VCPLogToOSLogType[3];
    if (os_log_type_enabled(v48, v49))
    {
      *(_DWORD *)buf = 138412546;
      int v76 = v65;
      __int16 v77 = 2112;
      id v78 = v5;
      _os_log_impl( (void *)&_mh_execute_header,  v48,  v49,  "%@ Failed to obtain specified Photo Library (%@)",  buf,  0x16u);
    }
  }

  NSErrorUserInfoKey v73 = NSLocalizedDescriptionKey;
  v64 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@ Failed to obtain specified Photo Library",  v65));
  id v74 = v64;
  id v17 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v74,  &v73,  1LL));
  BOOL v21 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  NSOSStatusErrorDomain,  -18LL,  v17));
  (*((void (**)(id, void, void, void *))v6 + 2))(v6, 0LL, 0LL, v21);
LABEL_42:
}

- (void)queryVUIndexAssetCountForType:(int64_t)a3 photoLibraryURL:(id)a4 reply:(id)a5
{
  id v7 = a4;
  NSErrorUserInfoKey v55 = (void (**)(id, id, void))a5;
  uint64_t v56 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"[MAClientHandler][VUGalleryAssetCount]"));
  uint64_t v9 = MediaAnalysisLogLevel(v56, v8);
  if ((int)v9 >= 5)
  {
    uint64_t v11 = VCPLogInstance(v9, v10);
    os_log_type_t v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
    os_log_type_t v13 = VCPLogToOSLogType[5];
    if (os_log_type_enabled(v12, v13))
    {
      *(_DWORD *)buf = 138412802;
      id v59 = v56;
      __int16 v60 = 1024;
      *(_DWORD *)id v61 = a3;
      *(_WORD *)&v61[4] = 2112;
      *(void *)&v61[6] = v7;
      _os_log_impl( (void *)&_mh_execute_header,  v12,  v13,  "%@ Received request to query VU index asset count for type %d (%@)",  buf,  0x1Cu);
    }
  }

  if (v7)
  {
    id v14 = (void *)objc_claimAutoreleasedReturnValue(+[VCPPhotoLibraryManager sharedManager](&OBJC_CLASS___VCPPhotoLibraryManager, "sharedManager"));
    uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue([v14 photoLibraryWithURL:v7]);

    if (v15) {
      goto LABEL_7;
    }
  }

  else
  {
    uint64_t v16 = objc_claimAutoreleasedReturnValue(+[PHPhotoLibrary vcp_defaultPhotoLibrary](&OBJC_CLASS___PHPhotoLibrary, "vcp_defaultPhotoLibrary"));
    uint64_t v15 = (void *)v16;
    if (v16)
    {
LABEL_7:
      os_log_type_t v54 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "vcp_visionCacheStorageDirectoryURL"));
      id v18 = (void *)objc_claimAutoreleasedReturnValue([v54 URLByAppendingPathComponent:@"VUIndex.sqlite"]);
      if (v18)
      {
        id v57 = 0LL;
        id v19 = [[VUWGallery alloc] initWithPath:v18 error:&v57];
        id v20 = v57;
        id v22 = v20;
        if (v19)
        {
          uint64_t v23 = VCPSignPostLog(v20);
          uint64_t v24 = (os_log_s *)objc_claimAutoreleasedReturnValue(v23);
          os_signpost_id_t v25 = os_signpost_id_generate(v24);

          uint64_t v27 = VCPSignPostLog(v26);
          os_log_type_t v28 = (os_log_s *)objc_claimAutoreleasedReturnValue(v27);
          id v29 = v28;
          if (v25 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v28))
          {
            *(_DWORD *)buf = 67109120;
            LODWORD(v59) = a3;
            _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v29,  OS_SIGNPOST_INTERVAL_BEGIN,  v25,  "VCPMediaAnalysisClientHandler_VUGalleryAssetCountForType",  "%d",  buf,  8u);
          }

          id v30 = [v19 assetCountForType:a3];
          uint64_t v31 = VCPSignPostLog(v30);
          uint64_t v32 = (os_log_s *)objc_claimAutoreleasedReturnValue(v31);
          uint64_t v33 = v32;
          if (v25 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v32))
          {
            *(_DWORD *)buf = 67109120;
            LODWORD(v59) = a3;
            _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v33,  OS_SIGNPOST_INTERVAL_END,  v25,  "VCPMediaAnalysisClientHandler_VUGalleryAssetCountForType",  "%d",  buf,  8u);
          }

          uint64_t v36 = MediaAnalysisLogLevel(v34, v35);
          if ((int)v36 >= 7)
          {
            uint64_t v38 = VCPLogInstance(v36, v37);
            id v39 = (os_log_s *)objc_claimAutoreleasedReturnValue(v38);
            os_log_type_t v40 = VCPLogToOSLogType[7];
            if (os_log_type_enabled(v39, v40))
            {
              *(_DWORD *)buf = 138413058;
              id v59 = v56;
              __int16 v60 = 1024;
              *(_DWORD *)id v61 = a3;
              *(_WORD *)&v61[4] = 2112;
              *(void *)&v61[6] = v7;
              __int16 v62 = 1024;
              int v63 = (int)v30;
              _os_log_impl( (void *)&_mh_execute_header,  v39,  v40,  "%@ Queried asset count for type %d for Photo Library (%@): %d",  buf,  0x22u);
            }
          }

          v55[2](v55, v30, 0LL);
          goto LABEL_33;
        }

        uint64_t v47 = MediaAnalysisLogLevel(v20, v21);
        if ((int)v47 >= 3)
        {
          uint64_t v49 = VCPLogInstance(v47, v48);
          uint64_t v50 = (os_log_s *)objc_claimAutoreleasedReturnValue(v49);
          os_log_type_t v51 = VCPLogToOSLogType[3];
          if (os_log_type_enabled(v50, v51))
          {
            *(_DWORD *)buf = 138412546;
            id v59 = v56;
            __int16 v60 = 2112;
            *(void *)id v61 = v7;
            _os_log_impl( (void *)&_mh_execute_header,  v50,  v51,  "%@ Failed to obtain VU gallery for Photo Library (%@)",  buf,  0x16u);
          }
        }

        NSErrorUserInfoKey v64 = NSLocalizedDescriptionKey;
        uint64_t v46 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@ Failed to obtain VU gallery for Photo Library (%@)",  v56,  v7));
        id v65 = v46;
        uint64_t v52 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v65,  &v64,  1LL));
        int v53 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  NSOSStatusErrorDomain,  -18LL,  v52));
        ((void (**)(id, id, void *))v55)[2](v55, 0LL, v53);
      }

      else
      {
        NSErrorUserInfoKey v66 = NSLocalizedDescriptionKey;
        id v22 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@ Failed to query VUIndex URL for library %@",  v56,  v7));
        NSErrorUserInfoKey v67 = v22;
        id v19 = (id)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v67,  &v66,  1LL));
        uint64_t v46 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  NSOSStatusErrorDomain,  -18LL,  v19));
        ((void (**)(id, id, void *))v55)[2](v55, 0LL, v46);
      }

LABEL_33:
      goto LABEL_34;
    }
  }

  uint64_t v41 = MediaAnalysisLogLevel(v16, v17);
  if ((int)v41 >= 3)
  {
    uint64_t v43 = VCPLogInstance(v41, v42);
    os_log_type_t v44 = (os_log_s *)objc_claimAutoreleasedReturnValue(v43);
    os_log_type_t v45 = VCPLogToOSLogType[3];
    if (os_log_type_enabled(v44, v45))
    {
      *(_DWORD *)buf = 138412546;
      id v59 = v56;
      __int16 v60 = 2112;
      *(void *)id v61 = v7;
      _os_log_impl( (void *)&_mh_execute_header,  v44,  v45,  "%@ Failed to obtain specified Photo Library (%@)",  buf,  0x16u);
    }
  }

  NSErrorUserInfoKey v68 = NSLocalizedDescriptionKey;
  os_log_type_t v54 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@ Failed to obtain specified Photo Library (%@)",  v56,  v7));
  NSErrorUserInfoKey v69 = v54;
  id v18 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v69,  &v68,  1LL));
  id v22 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  NSOSStatusErrorDomain,  -18LL,  v18));
  ((void (**)(id, id, void *))v55)[2](v55, 0LL, v22);
LABEL_34:
}

- (void)queryVUIndexLastFullModeClusterDateWithPhotoLibraryURL:(id)a3 reply:(id)a4
{
  id v5 = a3;
  id v6 = (void (**)(id, void *, void))a4;
  id v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"[MAClientHandler][VUFullModeClusterDate]"));
  uint64_t v9 = MediaAnalysisLogLevel(v7, v8);
  if ((int)v9 >= 5)
  {
    uint64_t v11 = VCPLogInstance(v9, v10);
    os_log_type_t v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
    os_log_type_t v13 = VCPLogToOSLogType[5];
    if (os_log_type_enabled(v12, v13))
    {
      *(_DWORD *)buf = 138412546;
      uint64_t v36 = v7;
      __int16 v37 = 2112;
      id v38 = v5;
      _os_log_impl( (void *)&_mh_execute_header,  v12,  v13,  "%@ Received request to query VU last full-mode cluster date (%@)",  buf,  0x16u);
    }
  }

  if (v5)
  {
    id v14 = (void *)objc_claimAutoreleasedReturnValue(+[VCPPhotoLibraryManager sharedManager](&OBJC_CLASS___VCPPhotoLibraryManager, "sharedManager"));
    uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue([v14 photoLibraryWithURL:v5]);

    if (v15)
    {
LABEL_7:
      id v18 = (void *)objc_claimAutoreleasedReturnValue( +[VCPDatabaseManager sharedDatabaseForPhotoLibrary:]( &OBJC_CLASS___VCPDatabaseManager,  "sharedDatabaseForPhotoLibrary:",  v15));
      uint64_t v19 = VCPKeyValueMediaAnalysisImagePriority1LastFullModeClusterTimestamp;
      if ([v18 keyExistsInKeyValueStore:VCPKeyValueMediaAnalysisImagePriority1LastFullModeClusterTimestamp]) {
        id v20 = (void *)objc_claimAutoreleasedReturnValue( +[NSDate dateWithTimeIntervalSinceReferenceDate:]( NSDate,  "dateWithTimeIntervalSinceReferenceDate:",  (double)(uint64_t)[v18 valueForKey:v19]));
      }
      else {
        id v20 = 0LL;
      }
      id v27 = +[VCPDatabaseManager releaseSharedDatabaseForPhotoLibrary:]( &OBJC_CLASS___VCPDatabaseManager,  "releaseSharedDatabaseForPhotoLibrary:",  v15);
      uint64_t v29 = MediaAnalysisLogLevel(v27, v28);
      if ((int)v29 >= 7)
      {
        uint64_t v31 = VCPLogInstance(v29, v30);
        uint64_t v32 = (os_log_s *)objc_claimAutoreleasedReturnValue(v31);
        os_log_type_t v33 = VCPLogToOSLogType[7];
        if (os_log_type_enabled(v32, v33))
        {
          uint64_t v34 = @"is";
          *(_DWORD *)buf = 138413058;
          uint64_t v36 = v7;
          if (!v20) {
            uint64_t v34 = @"is NOT";
          }
          __int16 v37 = 2112;
          id v38 = v5;
          __int16 v39 = 2112;
          os_log_type_t v40 = v34;
          __int16 v41 = 2112;
          uint64_t v42 = v20;
          _os_log_impl( (void *)&_mh_execute_header,  v32,  v33,  "%@ VU index for Photo Library (%@) %@ full-mode clustered (last clustered date: %@)",  buf,  0x2Au);
        }
      }

      v6[2](v6, v20, 0LL);
      goto LABEL_23;
    }
  }

  else
  {
    uint64_t v16 = objc_claimAutoreleasedReturnValue(+[PHPhotoLibrary vcp_defaultPhotoLibrary](&OBJC_CLASS___PHPhotoLibrary, "vcp_defaultPhotoLibrary"));
    uint64_t v15 = (void *)v16;
    if (v16) {
      goto LABEL_7;
    }
  }

  uint64_t v21 = MediaAnalysisLogLevel(v16, v17);
  if ((int)v21 >= 3)
  {
    uint64_t v23 = VCPLogInstance(v21, v22);
    uint64_t v24 = (os_log_s *)objc_claimAutoreleasedReturnValue(v23);
    os_log_type_t v25 = VCPLogToOSLogType[3];
    if (os_log_type_enabled(v24, v25))
    {
      *(_DWORD *)buf = 138412546;
      uint64_t v36 = v7;
      __int16 v37 = 2112;
      id v38 = v5;
      _os_log_impl( (void *)&_mh_execute_header,  v24,  v25,  "%@ Failed to obtain specified Photo Library (%@)",  buf,  0x16u);
    }
  }

  NSErrorUserInfoKey v43 = NSLocalizedDescriptionKey;
  id v18 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@ Failed to obtain specified Photo Library (%@)",  v7,  v5));
  os_log_type_t v44 = v18;
  id v20 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v44,  &v43,  1LL));
  uint64_t v26 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  NSOSStatusErrorDomain,  -18LL,  v20));
  ((void (**)(id, void *, void *))v6)[2](v6, 0LL, v26);

LABEL_23:
}

- (void)queryImagePriority1MCEnableDateWithPhotoLibraryURL:(id)a3 reply:(id)a4
{
  id v5 = a3;
  id v6 = (void (**)(id, void *, void))a4;
  id v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"[MAClientHandler][ImagePriority1MCEnableDate]"));
  uint64_t v9 = MediaAnalysisLogLevel(v7, v8);
  if ((int)v9 >= 5)
  {
    uint64_t v11 = VCPLogInstance(v9, v10);
    os_log_type_t v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
    os_log_type_t v13 = VCPLogToOSLogType[5];
    if (os_log_type_enabled(v12, v13))
    {
      *(_DWORD *)buf = 138412546;
      uint64_t v36 = v7;
      __int16 v37 = 2112;
      id v38 = v5;
      _os_log_impl( (void *)&_mh_execute_header,  v12,  v13,  "%@ Received request to query image priority 1 MC enable date (%@)",  buf,  0x16u);
    }
  }

  if (v5)
  {
    id v14 = (void *)objc_claimAutoreleasedReturnValue(+[VCPPhotoLibraryManager sharedManager](&OBJC_CLASS___VCPPhotoLibraryManager, "sharedManager"));
    uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue([v14 photoLibraryWithURL:v5]);

    if (v15)
    {
LABEL_7:
      id v18 = (void *)objc_claimAutoreleasedReturnValue( +[VCPDatabaseManager sharedDatabaseForPhotoLibrary:]( &OBJC_CLASS___VCPDatabaseManager,  "sharedDatabaseForPhotoLibrary:",  v15));
      uint64_t v19 = VCPKeyValueMediaAnalysisImagePriority1MCEnableTimestamp;
      if ([v18 keyExistsInKeyValueStore:VCPKeyValueMediaAnalysisImagePriority1MCEnableTimestamp]) {
        id v20 = (void *)objc_claimAutoreleasedReturnValue( +[NSDate dateWithTimeIntervalSinceReferenceDate:]( NSDate,  "dateWithTimeIntervalSinceReferenceDate:",  (double)(uint64_t)[v18 valueForKey:v19]));
      }
      else {
        id v20 = 0LL;
      }
      id v27 = +[VCPDatabaseManager releaseSharedDatabaseForPhotoLibrary:]( &OBJC_CLASS___VCPDatabaseManager,  "releaseSharedDatabaseForPhotoLibrary:",  v15);
      uint64_t v29 = MediaAnalysisLogLevel(v27, v28);
      if ((int)v29 >= 7)
      {
        uint64_t v31 = VCPLogInstance(v29, v30);
        uint64_t v32 = (os_log_s *)objc_claimAutoreleasedReturnValue(v31);
        os_log_type_t v33 = VCPLogToOSLogType[7];
        if (os_log_type_enabled(v32, v33))
        {
          uint64_t v34 = @"is";
          *(_DWORD *)buf = 138413058;
          uint64_t v36 = v7;
          if (!v20) {
            uint64_t v34 = @"is NOT";
          }
          __int16 v37 = 2112;
          id v38 = v5;
          __int16 v39 = 2112;
          os_log_type_t v40 = v34;
          __int16 v41 = 2112;
          uint64_t v42 = v20;
          _os_log_impl( (void *)&_mh_execute_header,  v32,  v33,  "%@ Photo Library (%@) %@ image priority 1 MC enabled (enabled date: %@)",  buf,  0x2Au);
        }
      }

      v6[2](v6, v20, 0LL);
      goto LABEL_23;
    }
  }

  else
  {
    uint64_t v16 = objc_claimAutoreleasedReturnValue(+[PHPhotoLibrary vcp_defaultPhotoLibrary](&OBJC_CLASS___PHPhotoLibrary, "vcp_defaultPhotoLibrary"));
    uint64_t v15 = (void *)v16;
    if (v16) {
      goto LABEL_7;
    }
  }

  uint64_t v21 = MediaAnalysisLogLevel(v16, v17);
  if ((int)v21 >= 3)
  {
    uint64_t v23 = VCPLogInstance(v21, v22);
    uint64_t v24 = (os_log_s *)objc_claimAutoreleasedReturnValue(v23);
    os_log_type_t v25 = VCPLogToOSLogType[3];
    if (os_log_type_enabled(v24, v25))
    {
      *(_DWORD *)buf = 138412546;
      uint64_t v36 = v7;
      __int16 v37 = 2112;
      id v38 = v5;
      _os_log_impl( (void *)&_mh_execute_header,  v24,  v25,  "%@ Failed to obtain specified Photo Library (%@)",  buf,  0x16u);
    }
  }

  NSErrorUserInfoKey v43 = NSLocalizedDescriptionKey;
  id v18 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@ Failed to obtain specified Photo Library (%@)",  v7,  v5));
  os_log_type_t v44 = v18;
  id v20 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v44,  &v43,  1LL));
  uint64_t v26 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  NSOSStatusErrorDomain,  -18LL,  v20));
  ((void (**)(id, void *, void *))v6)[2](v6, 0LL, v26);

LABEL_23:
}

- (void)queryPerformanceMeasurementsWithReply:(id)a3
{
  id v4 = (void (**)(id, void *))a3;
  Measurements = (void *)VCPPerformance_QueryMeasurements();
  v4[2](v4, Measurements);
}

- (void)queryUserSafetyEnablement:(id)a3
{
  id v4 = (void (**)(id, void, void *))a3;
  if (!self->_userSafetyEntitled)
  {
    NSErrorUserInfoKey v9 = NSLocalizedDescriptionKey;
    id v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Client not entitled to query User Safety enablement"));
    uint64_t v10 = v5;
    id v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v10,  &v9,  1LL));
    id v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  NSOSStatusErrorDomain,  -18LL,  v6));
    v4[2](v4, 0LL, v7);
  }

  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInteger:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedInteger:",  +[MADUserSafetySettings policyForTask:]( &OBJC_CLASS___MADUserSafetySettings,  "policyForTask:",  self->_secTask.value_)));
  ((void (**)(id, void *, void *))v4)[2](v4, v8, 0LL);
}

- (void)requestOTAMaintenance:(int)a3 options:(id)a4 reply:(id)a5
{
  uint64_t v8 = (void (**)(id, void *))a5;
  id v6 = [(id)objc_opt_class(self) errorForStatus:4294967292 withDescription:@"Operation is not supported on this system"];
  id v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  v8[2](v8, v7);
}

- (void)submitSpotlightAssetURL:(id)a3 uniqueIdentifier:(id)a4 bundleIdentifier:(id)a5 typeIdentifier:(id)a6 sandboxToken:(id)a7 reply:(id)a8
{
  uint64_t v8 = (void (**)(id, void *))a8;
  uint64_t v10 = MediaAnalysisLogLevel(v8, v9);
  if ((int)v10 >= 3)
  {
    uint64_t v12 = VCPLogInstance(v10, v11);
    os_log_type_t v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
    os_log_type_t v14 = VCPLogToOSLogType[3];
    if (os_log_type_enabled(v13, v14))
    {
      *(_WORD *)id v18 = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v13,  v14,  "[Spotlight] Unsupported platform for Spotlight processing",  v18,  2u);
    }
  }

  NSErrorUserInfoKey v19 = NSLocalizedDescriptionKey;
  uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"[Spotlight] Unsupported platform for Spotlight processing"));
  id v20 = v15;
  uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v20,  &v19,  1LL));
  uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  NSOSStatusErrorDomain,  -50LL,  v16));
  v8[2](v8, v17);
}

- (void)requestTextPrewarming:(id)a3 requestID:(int)a4 reply:(id)a5
{
  uint64_t v6 = *(void *)&a4;
  id v8 = a3;
  id v9 = a5;
  uint64_t v11 = MediaAnalysisLogLevel(v9, v10);
  if ((int)v11 >= 6)
  {
    uint64_t v13 = VCPLogInstance(v11, v12);
    os_log_type_t v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
    os_log_type_t v15 = VCPLogToOSLogType[6];
    if (os_log_type_enabled(v14, v15))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v14, v15, "[MADService] Received text pre-warming request", buf, 2u);
    }
  }

  uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"Request: %d", v6));
  uint64_t v17 = VCPSignPostLog(v16);
  id v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(v17);
  os_signpost_id_t v19 = os_signpost_id_generate(v18);

  uint64_t v21 = VCPSignPostLog(v20);
  uint64_t v22 = (os_log_s *)objc_claimAutoreleasedReturnValue(v21);
  uint64_t v23 = v22;
  if (v19 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v22))
  {
    *(_DWORD *)buf = 138412290;
    __int16 v39 = v16;
    _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v23,  OS_SIGNPOST_INTERVAL_BEGIN,  v19,  "VCPMediaAnalysisClientHandler_TextPrewarmingE2E",  "%@",  buf,  0xCu);
  }

  id v24 = objc_alloc(&OBJC_CLASS___MADServiceTextPrewarmingTask);
  v33[0] = _NSConcreteStackBlock;
  v33[1] = 3221225472LL;
  v33[2] = sub_1000560DC;
  v33[3] = &unk_1001B9B88;
  os_signpost_id_t v36 = v19;
  id v25 = v16;
  id v34 = v25;
  uint64_t v37 = 0LL;
  id v26 = v9;
  id v35 = v26;
  id v27 = [v24 initWithRequests:v8 cancelBlock:&stru_1001BB710 completionHandler:v33];
  [v27 setSignpostPayload:v25];
  queuingTaskScheduler = self->_queuingTaskScheduler;
  uint64_t v29 = (int)v6;
  v31[0] = _NSConcreteStackBlock;
  v31[1] = 3221225472LL;
  v31[2] = sub_1000561FC;
  v31[3] = &unk_1001B9A60;
  id v30 = v26;
  id v32 = v30;
  -[MADServiceClientTaskQueuingScheduler submitClientTask:withRequestID:schedulingErrorHandler:]( queuingTaskScheduler,  "submitClientTask:withRequestID:schedulingErrorHandler:",  v27,  v29,  v31);
}

- (void)requestTextProcessing:(id)a3 textInputs:(id)a4 requestID:(int)a5 reply:(id)a6
{
  uint64_t v7 = *(void *)&a5;
  id v34 = a3;
  id v10 = a4;
  id v11 = a6;
  uint64_t v13 = MediaAnalysisLogLevel(v11, v12);
  if ((int)v13 >= 6)
  {
    uint64_t v15 = VCPLogInstance(v13, v14);
    uint64_t v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(v15);
    os_log_type_t v17 = VCPLogToOSLogType[6];
    if (os_log_type_enabled(v16, v17))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v16, v17, "[MADService] Received text processing request", buf, 2u);
    }
  }

  id v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"Request: %d", v7));
  uint64_t v19 = VCPSignPostLog(v18);
  uint64_t v20 = (os_log_s *)objc_claimAutoreleasedReturnValue(v19);
  os_signpost_id_t v21 = os_signpost_id_generate(v20);

  uint64_t v23 = VCPSignPostLog(v22);
  id v24 = (os_log_s *)objc_claimAutoreleasedReturnValue(v23);
  id v25 = v24;
  if (v21 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v24))
  {
    *(_DWORD *)buf = 138412290;
    NSErrorUserInfoKey v43 = v18;
    _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v25,  OS_SIGNPOST_INTERVAL_BEGIN,  v21,  "VCPMediaAnalysisClientHandler_TextProcessingE2E",  "%@",  buf,  0xCu);
  }

  id v26 = (void *)objc_claimAutoreleasedReturnValue( +[MADServiceTextAsset assetWithTextInputs:clientBundleID:clientTeamID:]( &OBJC_CLASS___MADServiceTextAsset,  "assetWithTextInputs:clientBundleID:clientTeamID:",  v10,  self->_clientBundleID,  self->_clientTeamID));
  id v27 = objc_alloc(&OBJC_CLASS___MADServiceTextProcessingTask);
  v37[0] = _NSConcreteStackBlock;
  v37[1] = 3221225472LL;
  v37[2] = sub_100056594;
  v37[3] = &unk_1001B9BD0;
  os_signpost_id_t v40 = v21;
  id v28 = v18;
  id v38 = v28;
  uint64_t v41 = 0LL;
  id v29 = v11;
  id v39 = v29;
  id v30 = [v27 initWithRequests:v34 asset:v26 cancelBlock:&stru_1001BB730 completionHandler:v37];
  [v30 setSignpostPayload:v28];
  queuingTaskScheduler = self->_queuingTaskScheduler;
  uint64_t v32 = (int)v7;
  v35[0] = _NSConcreteStackBlock;
  v35[1] = 3221225472LL;
  v35[2] = sub_1000566D4;
  v35[3] = &unk_1001B9A60;
  id v33 = v29;
  id v36 = v33;
  -[MADServiceClientTaskQueuingScheduler submitClientTask:withRequestID:schedulingErrorHandler:]( queuingTaskScheduler,  "submitClientTask:withRequestID:schedulingErrorHandler:",  v30,  v32,  v35);
}

- (void)requestMultiModalPrewarming:(id)a3 requestID:(int)a4 reply:(id)a5
{
  uint64_t v6 = *(void *)&a4;
  id v8 = a3;
  id v9 = a5;
  uint64_t v11 = MediaAnalysisLogLevel(v9, v10);
  if ((int)v11 >= 6)
  {
    uint64_t v13 = VCPLogInstance(v11, v12);
    uint64_t v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
    os_log_type_t v15 = VCPLogToOSLogType[6];
    if (os_log_type_enabled(v14, v15))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v14,  v15,  "[MADService] Received multi-modal pre-warming request",  buf,  2u);
    }
  }

  uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"Request: %d", v6));
  uint64_t v17 = VCPSignPostLog(v16);
  id v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(v17);
  os_signpost_id_t v19 = os_signpost_id_generate(v18);

  uint64_t v21 = VCPSignPostLog(v20);
  uint64_t v22 = (os_log_s *)objc_claimAutoreleasedReturnValue(v21);
  uint64_t v23 = v22;
  if (v19 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v22))
  {
    *(_DWORD *)buf = 138412290;
    id v39 = v16;
    _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v23,  OS_SIGNPOST_INTERVAL_BEGIN,  v19,  "VCPMediaAnalysisClientHandler_MultiModalPrewarmingE2E",  "%@",  buf,  0xCu);
  }

  id v24 = objc_alloc(&OBJC_CLASS___MADMultiModalPrewarmingTask);
  v33[0] = _NSConcreteStackBlock;
  v33[1] = 3221225472LL;
  v33[2] = sub_1000569EC;
  v33[3] = &unk_1001B9B88;
  os_signpost_id_t v36 = v19;
  id v25 = v16;
  id v34 = v25;
  uint64_t v37 = 0LL;
  id v26 = v9;
  id v35 = v26;
  id v27 = [v24 initWithRequests:v8 cancelBlock:&stru_1001BB750 completionHandler:v33];
  [v27 setSignpostPayload:v25];
  queuingTaskScheduler = self->_queuingTaskScheduler;
  uint64_t v29 = (int)v6;
  v31[0] = _NSConcreteStackBlock;
  v31[1] = 3221225472LL;
  v31[2] = sub_100056B0C;
  v31[3] = &unk_1001B9A60;
  id v30 = v26;
  id v32 = v30;
  -[MADServiceClientTaskQueuingScheduler submitClientTask:withRequestID:schedulingErrorHandler:]( queuingTaskScheduler,  "submitClientTask:withRequestID:schedulingErrorHandler:",  v27,  v29,  v31);
}

- (void)requestProcessing:(id)a3 multiModalInputs:(id)a4 requestID:(int)a5 reply:(id)a6
{
  uint64_t v7 = *(void *)&a5;
  id v33 = a3;
  id v10 = a4;
  id v11 = a6;
  uint64_t v13 = MediaAnalysisLogLevel(v11, v12);
  if ((int)v13 >= 6)
  {
    uint64_t v15 = VCPLogInstance(v13, v14);
    uint64_t v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(v15);
    os_log_type_t v17 = VCPLogToOSLogType[6];
    if (os_log_type_enabled(v16, v17))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v16,  v17,  "[MAClientHandler] Received multi-modal processing request",  buf,  2u);
    }
  }

  id v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"Request: %d", v7));
  uint64_t v19 = VCPSignPostLog(v18);
  uint64_t v20 = (os_log_s *)objc_claimAutoreleasedReturnValue(v19);
  os_signpost_id_t v21 = os_signpost_id_generate(v20);

  uint64_t v23 = VCPSignPostLog(v22);
  id v24 = (os_log_s *)objc_claimAutoreleasedReturnValue(v23);
  id v25 = v24;
  if (v21 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v24))
  {
    *(_DWORD *)buf = 138412290;
    uint64_t v42 = v18;
    _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v25,  OS_SIGNPOST_INTERVAL_BEGIN,  v21,  "VCPMediaAnalysisClientHandler_MultiModalProcessingE2E",  "%@",  buf,  0xCu);
  }

  id v26 = objc_alloc(&OBJC_CLASS___MADMultiModalProcessingTask);
  v36[0] = _NSConcreteStackBlock;
  v36[1] = 3221225472LL;
  v36[2] = sub_100056E44;
  v36[3] = &unk_1001B9BD0;
  os_signpost_id_t v39 = v21;
  id v27 = v18;
  id v37 = v27;
  uint64_t v40 = 0LL;
  id v28 = v11;
  id v38 = v28;
  id v29 = [v26 initWithRequests:v33 inputs:v10 cancelBlock:&stru_1001BB770 completionHandler:v36];
  [v29 setSignpostPayload:v27];
  queuingTaskScheduler = self->_queuingTaskScheduler;
  uint64_t v31 = (int)v7;
  v34[0] = _NSConcreteStackBlock;
  v34[1] = 3221225472LL;
  v34[2] = sub_100056F84;
  v34[3] = &unk_1001B9A60;
  id v32 = v28;
  id v35 = v32;
  -[MADServiceClientTaskQueuingScheduler submitClientTask:withRequestID:schedulingErrorHandler:]( queuingTaskScheduler,  "submitClientTask:withRequestID:schedulingErrorHandler:",  v29,  v31,  v34);
}

+ (unint64_t)disablePhotosPostCaptureProcessing
{
  return 1LL;
}

- (void)requestURLAssetAnalysis:(int)a3 forAssetWithResourcePaths:(id)a4 withOptions:(id)a5 analysisTypes:(unint64_t)a6 sandboxTokens:(id)a7 withReply:(id)a8
{
  id v12 = a4;
  id v72 = a5;
  id v77 = a7;
  id v76 = a8;
  uint64_t v14 = MediaAnalysisLogLevel(v76, v13);
  if ((int)v14 >= 5)
  {
    uint64_t v16 = VCPLogInstance(v14, v15);
    os_log_type_t v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);
    os_log_type_t v18 = VCPLogToOSLogType[5];
    if (os_log_type_enabled(v17, v18))
    {
      uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue([v12 firstObject]);
      *(_DWORD *)buf = 67109378;
      *(_DWORD *)&uint8_t buf[4] = a3;
      LOWORD(v103) = 2112;
      *(void *)((char *)&v103 + 2) = v19;
      _os_log_impl( (void *)&_mh_execute_header,  v17,  v18,  "[MAClientHandler] Received MADRequestID %d to analyze asset %@",  buf,  0x12u);
    }
  }

  *(void *)buf = 0LL;
  *(void *)&__int128 v103 = buf;
  *((void *)&v103 + 1) = 0x3032000000LL;
  v104 = sub_1000579F8;
  v105 = sub_100057A08;
  id v20 = VCPTransactionWithName((uint64_t)@"VCPMediaAnalysisClientHandler-requestURLAssetAnalysis");
  id v106 = (id)objc_claimAutoreleasedReturnValue(v20);
  id v21 = [v77 count];
  if (v21 == [v12 count])
  {
    __int16 v75 = (__CFString *)objc_claimAutoreleasedReturnValue( +[NSMutableArray arrayWithCapacity:]( NSMutableArray,  "arrayWithCapacity:",  [v12 count]));
    id v22 = (id)objc_claimAutoreleasedReturnValue( +[NSMutableArray arrayWithCapacity:]( NSMutableArray,  "arrayWithCapacity:",  [v12 count]));
    unint64_t v23 = 0LL;
    os_log_type_t type = VCPLogToOSLogType[7];
    os_log_type_t v74 = VCPLogToOSLogType[3];
    while (1)
    {
      if (v23 >= (unint64_t)[v12 count])
      {
        v88[0] = _NSConcreteStackBlock;
        v88[1] = 3221225472LL;
        v88[2] = sub_100057A10;
        v88[3] = &unk_1001BB7E8;
        v88[4] = self;
        __int16 v75 = v75;
        v89 = v75;
        id v63 = v22;
        id v90 = v63;
        int v93 = a3;
        id v64 = v76;
        id v91 = v64;
        v92 = buf;
        id v65 = objc_retainBlock(v88);
        v86[0] = _NSConcreteStackBlock;
        v86[1] = 3221225472LL;
        v86[2] = sub_100057EB0;
        v86[3] = &unk_1001B9AF8;
        v86[4] = self;
        int v87 = a3;
        NSErrorUserInfoKey v66 = objc_retainBlock(v86);
        managementQueue = (dispatch_queue_s *)self->_managementQueue;
        block[0] = _NSConcreteStackBlock;
        block[1] = 3221225472LL;
        block[2] = sub_100057ECC;
        block[3] = &unk_1001BB810;
        block[4] = self;
        int v85 = a3;
        id v81 = v64;
        id v22 = v63;
        id v79 = v22;
        id v80 = v72;
        id v82 = v66;
        id v83 = v65;
        unint64_t v84 = a6;
        NSErrorUserInfoKey v68 = v65;
        NSErrorUserInfoKey v69 = v66;
        dispatch_sync(managementQueue, block);

        goto LABEL_34;
      }

      id v24 = objc_autoreleasePoolPush();
      id v25 = (void *)objc_claimAutoreleasedReturnValue([v12 objectAtIndexedSubscript:v23]);
      id v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL fileURLWithPath:](&OBJC_CLASS___NSURL, "fileURLWithPath:", v25));

      id v27 = (void *)objc_claimAutoreleasedReturnValue([v77 objectAtIndexedSubscript:v23]);
      int64_t v28 = -[VCPMediaAnalysisClientHandler consumeSandboxExtension:url:]( self,  "consumeSandboxExtension:url:",  v27,  v26);

      if (v28 < 0)
      {
        uint64_t v50 = MediaAnalysisLogLevel(v29, v30);
        if ((int)v50 >= 3)
        {
          uint64_t v52 = VCPLogInstance(v50, v51);
          int v53 = (os_log_s *)objc_claimAutoreleasedReturnValue(v52);
          if (os_log_type_enabled(v53, v74))
          {
            *(_DWORD *)v100 = 138412290;
            v101 = @"[MAClientHandler] Failed to consume sandbox extension";
            _os_log_impl((void *)&_mh_execute_header, v53, v74, "%@", v100, 0xCu);
          }
        }

        NSErrorUserInfoKey v96 = NSLocalizedDescriptionKey;
        uint64_t v40 = (__CFString *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@",  @"[MAClientHandler] Failed to consume sandbox extension"));
        v97 = v40;
        uint64_t v47 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v97,  &v96,  1LL));
        uint64_t v48 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  NSOSStatusErrorDomain,  -50LL,  v47));
        (*((void (**)(id, void, void *))v76 + 2))(v76, 0LL, v48);
      }

      else
      {
        uint64_t v31 = MediaAnalysisLogLevel(v29, v30);
        if ((int)v31 >= 7)
        {
          uint64_t v33 = VCPLogInstance(v31, v32);
          id v34 = (os_log_s *)objc_claimAutoreleasedReturnValue(v33);
          if (os_log_type_enabled(v34, type))
          {
            id v35 = (__CFString *)objc_claimAutoreleasedReturnValue([v12 objectAtIndexedSubscript:v23]);
            *(_DWORD *)v100 = 138412290;
            v101 = v35;
            _os_log_impl( (void *)&_mh_execute_header,  v34,  type,  "[MAClientHandler] Consuming sandbox extension for %@",  v100,  0xCu);
          }
        }

        os_signpost_id_t v36 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLongLong:](&OBJC_CLASS___NSNumber, "numberWithLongLong:", v28));
        -[__CFString addObject:](v75, "addObject:", v36);

        [v22 addObject:v26];
        id v37 = (void *)objc_claimAutoreleasedReturnValue([v12 objectAtIndexedSubscript:v23]);
        uint64_t v38 = FigSandboxRegisterURLWithProcess( +[NSURL fileURLWithPath:](&OBJC_CLASS___NSURL, "fileURLWithPath:", v37),  1LL,  1LL);

        if (!(_DWORD)v38)
        {
          char v54 = 1;
          goto LABEL_26;
        }

        os_signpost_id_t v39 = (void *)objc_claimAutoreleasedReturnValue([v12 objectAtIndexedSubscript:v23]);
        uint64_t v40 = (__CFString *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"[MAClientHandler] Failed to register sandbox extension (%@) to CoreMedia (%d)",  v39,  v38));

        uint64_t v43 = MediaAnalysisLogLevel(v41, v42);
        if ((int)v43 >= 3)
        {
          uint64_t v45 = VCPLogInstance(v43, v44);
          uint64_t v46 = (os_log_s *)objc_claimAutoreleasedReturnValue(v45);
          if (os_log_type_enabled(v46, v74))
          {
            *(_DWORD *)v100 = 138412290;
            v101 = v40;
            _os_log_impl((void *)&_mh_execute_header, v46, v74, "%@", v100, 0xCu);
          }
        }

        NSErrorUserInfoKey v94 = NSLocalizedDescriptionKey;
        uint64_t v47 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%@", v40));
        v95 = v47;
        uint64_t v48 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v95,  &v94,  1LL));
        uint64_t v49 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  NSOSStatusErrorDomain,  -50LL,  v48));
        (*((void (**)(id, void, void *))v76 + 2))(v76, 0LL, v49);
      }

      char v54 = 0;
LABEL_26:

      objc_autoreleasePoolPop(v24);
      ++v23;
      if ((v54 & 1) == 0) {
        goto LABEL_34;
      }
    }
  }

  __int16 v75 = (__CFString *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( NSString,  "stringWithFormat:",  @"[MAClientHandler] Sandbox token count (%lu) does not match resource count (%lu)",  [v77 count],  objc_msgSend(v12, "count")));
  uint64_t v56 = MediaAnalysisLogLevel(v75, v55);
  if ((int)v56 >= 3)
  {
    uint64_t v58 = VCPLogInstance(v56, v57);
    id v59 = (os_log_s *)objc_claimAutoreleasedReturnValue(v58);
    os_log_type_t v60 = VCPLogToOSLogType[3];
    if (os_log_type_enabled(v59, v60))
    {
      *(_DWORD *)v100 = 138412290;
      v101 = v75;
      _os_log_impl((void *)&_mh_execute_header, v59, v60, "%@", v100, 0xCu);
    }
  }

  NSErrorUserInfoKey v98 = NSLocalizedDescriptionKey;
  id v22 = (id)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%@", v75));
  id v99 = v22;
  id v61 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v99,  &v98,  1LL));
  __int16 v62 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  NSOSStatusErrorDomain,  -50LL,  v61));
  (*((void (**)(id, void, void *))v76 + 2))(v76, 0LL, v62);

LABEL_34:
  _Block_object_dispose(buf, 8);
}

- (void)requestAssetAnalysis:(int)a3 forLocalIdentifiers:(id)a4 fromPhotoLibraryWithURL:(id)a5 withOptions:(id)a6 analysisTypes:(unint64_t)a7 withReply:(id)a8
{
  uint64_t v12 = *(void *)&a3;
  id v44 = a4;
  id v14 = a5;
  id v43 = a6;
  id v45 = a8;
  uint64_t v16 = MediaAnalysisLogLevel(v45, v15);
  if ((int)v16 >= 6)
  {
    uint64_t v18 = VCPLogInstance(v16, v17);
    uint64_t v19 = (os_log_s *)objc_claimAutoreleasedReturnValue(v18);
    os_log_type_t v20 = VCPLogToOSLogType[6];
    if (os_log_type_enabled(v19, v20))
    {
      *(_DWORD *)buf = 67109120;
      *(_DWORD *)&uint8_t buf[4] = v12;
      _os_log_impl( (void *)&_mh_execute_header,  v19,  v20,  "[MAClientHandler] Received on-demand analysis asset processing request (%d)",  buf,  8u);
    }
  }

  id v21 = (void *)objc_claimAutoreleasedReturnValue(+[VCPPhotoLibraryManager sharedManager](&OBJC_CLASS___VCPPhotoLibraryManager, "sharedManager"));
  id v22 = (void *)objc_claimAutoreleasedReturnValue([v21 photoLibraryWithURL:v14]);

  if (v22)
  {
    *(void *)buf = 0LL;
    id v61 = buf;
    uint64_t v62 = 0x3032000000LL;
    id v63 = sub_1000579F8;
    id v64 = sub_100057A08;
    id v23 = VCPTransactionWithName((uint64_t)@"VCPMediaAnalysisClientHandler-requestAssetProcessing");
    id v65 = (id)objc_claimAutoreleasedReturnValue(v23);
    v58[0] = _NSConcreteStackBlock;
    v58[1] = 3221225472LL;
    v58[2] = sub_100058654;
    v58[3] = &unk_1001B9AF8;
    v58[4] = self;
    int v59 = v12;
    uint64_t v41 = objc_retainBlock(v58);
    v54[0] = _NSConcreteStackBlock;
    v54[1] = 3221225472LL;
    v54[2] = sub_100058670;
    v54[3] = &unk_1001BA1D8;
    v54[4] = self;
    int v57 = v12;
    id v24 = v45;
    id v55 = v24;
    uint64_t v56 = buf;
    uint64_t v42 = objc_retainBlock(v54);
    id v25 = (void *)objc_claimAutoreleasedReturnValue( +[PHAsset vcp_fetchOptionsForLibrary:forTaskID:]( &OBJC_CLASS___PHAsset,  "vcp_fetchOptionsForLibrary:forTaskID:",  v22,  1LL));
    id v26 = (void *)objc_claimAutoreleasedReturnValue( +[PHAsset fetchAssetsWithLocalIdentifiers:options:]( &OBJC_CLASS___PHAsset,  "fetchAssetsWithLocalIdentifiers:options:",  v44,  v25));
    id v27 = (void *)objc_claimAutoreleasedReturnValue([v26 fetchedObjects]);
    if ([v27 count])
    {
      int64_t v28 = v26;
      uint64_t v29 = v25;
      uint64_t v30 = v22;
      id v31 = v14;
      managementQueue = self->_managementQueue;
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472LL;
      block[2] = sub_100058948;
      block[3] = &unk_1001BB810;
      block[4] = self;
      int v53 = v12;
      id v49 = v24;
      id v47 = v27;
      unint64_t v52 = a7;
      id v48 = v43;
      uint64_t v50 = v41;
      uint64_t v51 = v42;
      uint64_t v33 = (dispatch_queue_s *)managementQueue;
      id v14 = v31;
      id v22 = v30;
      id v25 = v29;
      id v26 = v28;
      dispatch_sync(v33, block);
    }

    else
    {
      uint64_t v38 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Failed to fetch localIdentifiers for asset processing MADRequestID %d",  v12));
      id v39 = [(id)objc_opt_class(self) errorForStatus:4294967246 withDescription:v38];
      uint64_t v40 = (void *)objc_claimAutoreleasedReturnValue(v39);
      (*((void (**)(id, void, void *))v24 + 2))(v24, 0LL, v40);
    }

    _Block_object_dispose(buf, 8);
  }

  else
  {
    id v34 = (void *)objc_claimAutoreleasedReturnValue([v14 path]);
    id v35 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Failed to find client specified Photos Library (%@) for MADRequestID %d",  v34,  v12));

    id v36 = [(id)objc_opt_class(self) errorForStatus:4294967246 withDescription:v35];
    id v37 = (void *)objc_claimAutoreleasedReturnValue(v36);
    (*((void (**)(id, void, void *))v45 + 2))(v45, 0LL, v37);
  }
}

- (void)requestAssetAnalysis:(int)a3 forPhotoLibraryURL:(id)a4 withLocalIdentifiers:(id)a5 realTime:(BOOL)a6 withReply:(id)a7
{
  id v41 = a4;
  id v40 = a5;
  id v12 = a7;
  uint64_t v14 = MediaAnalysisLogLevel(v12, v13);
  if ((int)v14 >= 6)
  {
    uint64_t v16 = VCPLogInstance(v14, v15);
    uint64_t v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);
    os_log_type_t v18 = VCPLogToOSLogType[6];
    if (os_log_type_enabled(v17, v18))
    {
      *(_DWORD *)buf = 67109376;
      *(_DWORD *)&uint8_t buf[4] = a3;
      *(_WORD *)&uint8_t buf[8] = 2048;
      *(void *)&buf[10] = [v40 count];
      _os_log_impl( (void *)&_mh_execute_header,  v17,  v18,  "[MAClientHandler] Received MADRequestID %d to analyze %lu assets",  buf,  0x12u);
    }
  }

  uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue(+[VCPPhotoLibraryManager sharedManager](&OBJC_CLASS___VCPPhotoLibraryManager, "sharedManager"));
  os_log_type_t v20 = (void *)objc_claimAutoreleasedReturnValue([v19 photoLibraryWithURL:v41]);

  if (v20)
  {
    *(void *)buf = 0LL;
    *(void *)&uint8_t buf[8] = buf;
    *(void *)&buf[16] = 0x3032000000LL;
    int v57 = sub_1000579F8;
    uint64_t v58 = sub_100057A08;
    id v21 = VCPTransactionWithName((uint64_t)@"VCPMediaAnalysisClientHandler-requestAssetAnalysis");
    id v59 = (id)objc_claimAutoreleasedReturnValue(v21);
    v54[0] = _NSConcreteStackBlock;
    v54[1] = 3221225472LL;
    v54[2] = sub_100059070;
    v54[3] = &unk_1001B9AF8;
    v54[4] = self;
    int v55 = a3;
    id v22 = objc_retainBlock(v54);
    v50[0] = _NSConcreteStackBlock;
    v50[1] = 3221225472LL;
    v50[2] = sub_10005908C;
    v50[3] = &unk_1001BB860;
    v50[4] = self;
    int v53 = a3;
    id v23 = v12;
    id v51 = v23;
    unint64_t v52 = buf;
    id v24 = objc_retainBlock(v50);
    managementQueue = (dispatch_queue_s *)self->_managementQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_1000593D4;
    block[3] = &unk_1001BB888;
    block[4] = self;
    int v48 = a3;
    id v45 = v23;
    id v43 = v20;
    BOOL v49 = a6;
    id v44 = v40;
    id v46 = v22;
    id v47 = v24;
    id v26 = v24;
    id v27 = v22;
    dispatch_sync(managementQueue, block);

    _Block_object_dispose(buf, 8);
  }

  else
  {
    int64_t v28 = (void *)objc_claimAutoreleasedReturnValue([v41 path]);
    uint64_t v29 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"[MAClientHandler] Failed to find client specified Photos Library (%@)",  v28));

    uint64_t v32 = MediaAnalysisLogLevel(v30, v31);
    if ((int)v32 >= 3)
    {
      uint64_t v34 = VCPLogInstance(v32, v33);
      id v35 = (os_log_s *)objc_claimAutoreleasedReturnValue(v34);
      os_log_type_t v36 = VCPLogToOSLogType[3];
      if (os_log_type_enabled(v35, v36))
      {
        *(_DWORD *)buf = 138412290;
        *(void *)&uint8_t buf[4] = v29;
        _os_log_impl((void *)&_mh_execute_header, v35, v36, "%@", buf, 0xCu);
      }
    }

    NSErrorUserInfoKey v60 = NSLocalizedDescriptionKey;
    id v37 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%@", v29));
    id v61 = v37;
    uint64_t v38 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v61,  &v60,  1LL));
    id v39 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  NSOSStatusErrorDomain,  -50LL,  v38));
    (*((void (**)(id, void, void *))v12 + 2))(v12, 0LL, v39);
  }
}

- (void)_resetPECFailureVersionForPhotoLibrary:(id)a3
{
  id v51 = a3;
  uint64_t v4 = MediaAnalysisLogLevel(v51, v3);
  if ((int)v4 >= 6)
  {
    uint64_t v6 = VCPLogInstance(v4, v5);
    uint64_t v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
    os_log_type_t v8 = VCPLogToOSLogType[6];
    if (os_log_type_enabled(v7, v8))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, v8, "[MAClientHandler] Reseting PEC Failure Versions", buf, 2u);
    }
  }

  id v50 = objc_alloc_init(&OBJC_CLASS___PHMediaProcessingAlgorithmVersionProvider);
  [v50 setVaAnalysisVersion:VCPPhotosPECProcessingVersion_Failures];
  +[PHAsset mad_sceneConfidenceThresholdForTask:](&OBJC_CLASS___PHAsset, "mad_sceneConfidenceThresholdForTask:", 16LL);
  int v10 = v9;
  id v58 = 0LL;
  id v49 = objc_msgSend( v51,  "countOfProcessedAssetsForMediaProcessingTaskID:priority:algorithmVersion:sceneConfidenceThreshold:error:",  16,  0,  v50,  &v58);
  id v11 = v58;
  id v47 = v11;
  if (!v11)
  {
    unint64_t v19 = 0LL;
    BOOL v20 = 0;
    os_log_type_t type = VCPLogToOSLogType[3];
    *(void *)&__int128 v13 = 138412290LL;
    __int128 v46 = v13;
    while (1)
    {
      id v21 = objc_autoreleasePoolPush();
      id v57 = 0LL;
      LODWORD(v22) = v10;
      id v23 = (void *)objc_claimAutoreleasedReturnValue( [v51 fetchProcessedAssetsForMediaProcessingTaskID:16 priority:0 algorithmVersion:v50 sceneConfidenceThreshold:&v57 error:v22]);
      id v24 = v57;
      id v26 = v24;
      if (!v24) {
        break;
      }
      uint64_t v27 = MediaAnalysisLogLevel(v24, v25);
      if ((int)v27 >= 3)
      {
        uint64_t v29 = VCPLogInstance(v27, v28);
        uint64_t v30 = (os_log_s *)objc_claimAutoreleasedReturnValue(v29);
        if (os_log_type_enabled(v30, type))
        {
          *(_DWORD *)buf = v46;
          id v61 = v26;
          _os_log_impl( (void *)&_mh_execute_header,  v30,  type,  "[MAClientHandler] Failed to fetch PEC Failure assets: %@",  buf,  0xCu);
        }

        BOOL v20 = 0;
        int v31 = 7;
LABEL_34:

        goto LABEL_35;
      }

      BOOL v20 = 0;
      int v31 = 7;
LABEL_35:

      objc_autoreleasePoolPop(v21);
      if (v31) {
        goto LABEL_36;
      }
    }

    uint64_t v30 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
    __int128 v55 = 0u;
    __int128 v56 = 0u;
    __int128 v53 = 0u;
    __int128 v54 = 0u;
    id v32 = v23;
    id v33 = [v32 countByEnumeratingWithState:&v53 objects:v59 count:16];
    if (v33)
    {
      uint64_t v34 = *(void *)v54;
      do
      {
        for (i = 0LL; i != v33; i = (char *)i + 1)
        {
          if (*(void *)v54 != v34) {
            objc_enumerationMutation(v32);
          }
          os_log_type_t v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((void *)&v53 + 1) + 8 * (void)i), "localIdentifier", v46));
          -[os_log_s addObject:](v30, "addObject:", v36);
        }

        id v33 = [v32 countByEnumeratingWithState:&v53 objects:v59 count:16];
      }

      while (v33);
    }

    id v52 = 0LL;
    [v51 resetStateForMediaProcessingTaskID:16 assetIdentifiers:v30 resetOptions:1 error:&v52];
    id v37 = v52;
    id v39 = v37;
    if (v37)
    {
      uint64_t v40 = MediaAnalysisLogLevel(v37, v38);
      if ((int)v40 >= 3)
      {
        uint64_t v42 = VCPLogInstance(v40, v41);
        id v43 = (os_log_s *)objc_claimAutoreleasedReturnValue(v42);
        if (os_log_type_enabled(v43, type))
        {
          *(_DWORD *)buf = v46;
          id v61 = v39;
          _os_log_impl( (void *)&_mh_execute_header,  v43,  type,  "[MAClientHandler] Error while clearing PEC Failure version: %@",  buf,  0xCu);
        }
      }

      BOOL v20 = 0;
      int v31 = 7;
    }

    else
    {
      id v44 = [v32 count];
      id v45 = [v32 count];
      int v31 = 0;
      v19 += (unint64_t)v44;
      BOOL v20 = v45 == 0LL;
    }

    goto LABEL_34;
  }

  uint64_t v14 = MediaAnalysisLogLevel(v11, v12);
  if ((int)v14 >= 3)
  {
    uint64_t v16 = VCPLogInstance(v14, v15);
    uint64_t v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);
    os_log_type_t v18 = VCPLogToOSLogType[3];
    if (os_log_type_enabled(v17, v18))
    {
      *(_DWORD *)buf = 138412290;
      id v61 = v47;
      _os_log_impl( (void *)&_mh_execute_header,  v17,  v18,  "[MAClientHandler] Failed to count PEC Failures: %@",  buf,  0xCu);
    }
  }

- (void)_resetProcessingStatusForTaskID:(unint64_t)a3 andPhotoLibrary:(id)a4
{
  id v6 = a4;
  uint64_t v8 = MediaAnalysisLogLevel(v6, v7);
  if ((int)v8 >= 6)
  {
    uint64_t v10 = VCPLogInstance(v8, v9);
    id v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
    os_log_type_t v12 = VCPLogToOSLogType[6];
    if (os_log_type_enabled(v11, v12))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v11,  v12,  "[MAClientHandler] Canceling background activity if exists to avoid dual MADB writer scenario",  buf,  2u);
    }
  }

  __int128 v13 = (void *)objc_claimAutoreleasedReturnValue(+[VCPMADTaskScheduler sharedInstance](&OBJC_CLASS___VCPMADTaskScheduler, "sharedInstance"));
  [v13 cancelBackgroundTasks];

  uint64_t v16 = MediaAnalysisLogLevel(v14, v15);
  if ((int)v16 >= 5)
  {
    uint64_t v18 = VCPLogInstance(v16, v17);
    unint64_t v19 = (os_log_s *)objc_claimAutoreleasedReturnValue(v18);
    os_log_type_t v20 = VCPLogToOSLogType[5];
    if (os_log_type_enabled(v19, v20))
    {
      uint64_t v21 = VCPTaskIDDescription(a3);
      uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(v21);
      *(_DWORD *)buf = 138412290;
      id v39 = v4;
      _os_log_impl( (void *)&_mh_execute_header,  v19,  v20,  "[MAClientHandler] Resetting processing status for %@ ...",  buf,  0xCu);
    }
  }

  double v22 = (void *)objc_claimAutoreleasedReturnValue( +[VCPDatabaseManager sharedDatabaseForPhotoLibrary:]( &OBJC_CLASS___VCPDatabaseManager,  "sharedDatabaseForPhotoLibrary:",  v6));
  int v37 = 0;
  id v23 = [v22 removeAllChangeTokensForTaskID:a3];
  if ((_DWORD)v23) {
    goto LABEL_11;
  }
  id v23 = [v22 removeAllProcessingStatusForTaskID:a3];
  if ((_DWORD)v23) {
    goto LABEL_11;
  }
  if (a3 == 1)
  {
    uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate now](&OBJC_CLASS___NSDate, "now"));
    if ([v22 ageOutBlacklistBefore:v4 count:&v37])
    {

      goto LABEL_11;
    }
  }

  id v23 = [v22 commit];
  if (a3 == 1)
  {
    BOOL v36 = (_DWORD)v23 == 0;

    if (v36) {
      goto LABEL_21;
    }
    goto LABEL_11;
  }

  if ((_DWORD)v23)
  {
LABEL_11:
    id v23 = (id)MediaAnalysisLogLevel(v23, v24);
    if ((int)v23 >= 4)
    {
      uint64_t v25 = VCPLogInstance(v23, v24);
      id v26 = (os_log_s *)objc_claimAutoreleasedReturnValue(v25);
      os_log_type_t v27 = VCPLogToOSLogType[4];
      if (os_log_type_enabled(v26, v27))
      {
        uint64_t v28 = VCPTaskIDDescription(a3);
        uint64_t v29 = (void *)objc_claimAutoreleasedReturnValue(v28);
        *(_DWORD *)buf = 138412290;
        id v39 = v29;
        _os_log_impl((void *)&_mh_execute_header, v26, v27, "[MAClientHandler] Failed to reset %@ state", buf, 0xCu);
      }
    }
  }

  if (a3 == 3)
  {
    uint64_t v30 = MediaAnalysisLogLevel(v23, v24);
    if ((int)v30 >= 5)
    {
      uint64_t v32 = VCPLogInstance(v30, v31);
      id v33 = (os_log_s *)objc_claimAutoreleasedReturnValue(v32);
      os_log_type_t v34 = VCPLogToOSLogType[5];
      if (os_log_type_enabled(v33, v34))
      {
        *(_WORD *)buf = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v33,  v34,  "[MAClientHandler] Resetting person process timestamps timestamps ...",  buf,  2u);
      }
    }

    [v22 removeKey:@"ContactIngestionTimestamp"];
    [v22 removeKey:@"HomePersonIngestionTimestamp"];
    [v22 removeKey:@"VUDeepSyncTimestamp"];
    [v22 commit];
  }

- (void)requestLibraryProcessing:(int)a3 withTaskID:(unint64_t)a4 forPhotoLibraryURL:(id)a5 withOptions:(id)a6 andReply:(id)a7
{
  uint64_t v10 = *(void *)&a3;
  id v41 = a5;
  id v40 = a6;
  id v12 = a7;
  uint64_t v14 = (void (**)(void, void))v12;
  if (a4 <= 0xC && ((1LL << a4) & 0x158E) != 0)
  {
    uint64_t v15 = MediaAnalysisLogLevel(v12, v13);
    if ((int)v15 >= 6)
    {
      uint64_t v17 = VCPLogInstance(v15, v16);
      uint64_t v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(v17);
      os_log_type_t v19 = VCPLogToOSLogType[6];
      if (os_log_type_enabled(v18, v19))
      {
        uint64_t v20 = VCPTaskIDDescription(a4);
        uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue(v20);
        *(_DWORD *)buf = 67109634;
        *(_DWORD *)&uint8_t buf[4] = v10;
        *(_WORD *)NSErrorUserInfoKey v60 = 2112;
        *(void *)&void v60[2] = v21;
        *(_WORD *)&v60[10] = 2048;
        *(void *)&v60[12] = a4;
        _os_log_impl( (void *)&_mh_execute_header,  v18,  v19,  "[MAClientHandler] Received Photos analysis MADRequestID %d for task %@(%lu)",  buf,  0x1Cu);
      }
    }

    double v22 = (void *)objc_claimAutoreleasedReturnValue(+[VCPPhotoLibraryManager sharedManager](&OBJC_CLASS___VCPPhotoLibraryManager, "sharedManager"));
    id v23 = (void *)objc_claimAutoreleasedReturnValue([v22 photoLibraryWithURL:v41]);

    if (v23)
    {
      *(void *)buf = 0LL;
      *(void *)NSErrorUserInfoKey v60 = buf;
      *(void *)&v60[8] = 0x3032000000LL;
      *(void *)&v60[16] = sub_1000579F8;
      id v61 = sub_100057A08;
      uint64_t v62 = objc_alloc_init(&OBJC_CLASS___VCPTimeMeasurement);
      [*(id *)(*(void *)v60 + 40) start];
      v57[0] = 0LL;
      v57[1] = v57;
      v57[2] = 0x3032000000LL;
      v57[3] = sub_1000579F8;
      v57[4] = sub_100057A08;
      id v24 = VCPTransactionWithName((uint64_t)@"VCPMediaAnalysisClientHandler-requestLibraryProcessing");
      id v58 = (id)objc_claimAutoreleasedReturnValue(v24);
      v55[0] = _NSConcreteStackBlock;
      v55[1] = 3221225472LL;
      v55[2] = sub_10005A3FC;
      v55[3] = &unk_1001B9AF8;
      v55[4] = self;
      int v56 = v10;
      uint64_t v25 = objc_retainBlock(v55);
      v50[0] = _NSConcreteStackBlock;
      v50[1] = 3221225472LL;
      v50[2] = sub_10005A418;
      v50[3] = &unk_1001BB8D8;
      int v54 = v10;
      v50[4] = self;
      id v52 = buf;
      id v26 = v14;
      id v51 = v26;
      __int128 v53 = v57;
      os_log_type_t v27 = objc_retainBlock(v50);
      managementQueue = (dispatch_queue_s *)self->_managementQueue;
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472LL;
      block[2] = sub_10005A774;
      block[3] = &unk_1001BB810;
      block[4] = self;
      int v49 = v10;
      id v45 = v26;
      unint64_t v48 = a4;
      id v43 = v40;
      id v44 = v23;
      id v46 = v25;
      id v47 = v27;
      uint64_t v29 = v27;
      uint64_t v30 = v25;
      dispatch_sync(managementQueue, block);

      _Block_object_dispose(v57, 8);
      _Block_object_dispose(buf, 8);
    }

    else
    {
      uint64_t v31 = (void *)objc_claimAutoreleasedReturnValue([v41 path]);
      uint64_t v32 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Unable to open specified photo library (%@)",  v31));

      id v33 = [(id)objc_opt_class(self) errorForStatus:4294967246 withDescription:v32];
      os_log_type_t v34 = (void *)objc_claimAutoreleasedReturnValue(v33);
      ((void (**)(void, void *))v14)[2](v14, v34);
    }
  }

  else
  {
    uint64_t v35 = VCPTaskIDDescription(a4);
    BOOL v36 = (void *)objc_claimAutoreleasedReturnValue(v35);
    int v37 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"MADRequestID %d requestLibraryProcessing with unsupported task %@(%lu)",  v10,  v36,  a4,  v40));

    id v38 = [(id)objc_opt_class(self) errorForStatus:4294967292 withDescription:v37];
    id v39 = (void *)objc_claimAutoreleasedReturnValue(v38);
    ((void (**)(void, void *))v14)[2](v14, v39);
  }
}

- (void)requestVideoFramesProcessing:(int)a3 withTaskID:(unint64_t)a4 frames:(id)a5 options:(id)a6 andReply:(id)a7
{
  uint64_t v10 = *(void *)&a3;
  id v12 = a5;
  id v13 = a6;
  id v14 = a7;
  uint64_t v16 = MediaAnalysisLogLevel(v14, v15);
  if ((int)v16 >= 6)
  {
    uint64_t v18 = VCPLogInstance(v16, v17);
    os_log_type_t v19 = (os_log_s *)objc_claimAutoreleasedReturnValue(v18);
    os_log_type_t v20 = VCPLogToOSLogType[6];
    if (os_log_type_enabled(v19, v20))
    {
      uint64_t v21 = VCPTaskIDDescription(a4);
      double v22 = (void *)objc_claimAutoreleasedReturnValue(v21);
      *(_DWORD *)buf = 67109634;
      *(_DWORD *)&uint8_t buf[4] = v10;
      *(_WORD *)unint64_t v48 = 2112;
      *(void *)&v48[2] = v22;
      *(_WORD *)&v48[10] = 2048;
      *(void *)&v48[12] = a4;
      _os_log_impl( (void *)&_mh_execute_header,  v19,  v20,  "[MAClientHandler] Received video frames processing MADRequestID %d for task %@(%lu)",  buf,  0x1Cu);
    }
  }

  if (a4 == 15)
  {
    if ([v12 count])
    {
      *(void *)buf = 0LL;
      *(void *)unint64_t v48 = buf;
      *(void *)&v48[8] = 0x3032000000LL;
      *(void *)&v48[16] = sub_1000579F8;
      int v49 = sub_100057A08;
      id v23 = VCPTransactionWithName((uint64_t)@"VCPMediaAnalysisClientHandler-requestVideoFramesProcessing");
      id v50 = (id)objc_claimAutoreleasedReturnValue(v23);
      v43[0] = _NSConcreteStackBlock;
      v43[1] = 3221225472LL;
      v43[2] = sub_10005B6B0;
      v43[3] = &unk_1001BA1D8;
      void v43[4] = self;
      int v46 = v10;
      id v24 = v14;
      id v44 = v24;
      id v45 = buf;
      uint64_t v25 = objc_retainBlock(v43);
      managementQueue = (dispatch_queue_s *)self->_managementQueue;
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472LL;
      block[2] = sub_10005B988;
      block[3] = &unk_1001BB9A0;
      block[4] = self;
      int v42 = v10;
      id v39 = v24;
      id v37 = v13;
      id v38 = v12;
      id v40 = v25;
      uint64_t v41 = 15LL;
      os_log_type_t v27 = v25;
      dispatch_sync(managementQueue, block);

      _Block_object_dispose(buf, 8);
    }

    else
    {
      id v33 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"No frames specified for MADRequestID %d",  v10));
      id v34 = [(id)objc_opt_class(self) errorForStatus:4294967246 withDescription:v33];
      uint64_t v35 = (void *)objc_claimAutoreleasedReturnValue(v34);
      (*((void (**)(id, void, void *))v14 + 2))(v14, 0LL, v35);
    }
  }

  else
  {
    uint64_t v28 = VCPTaskIDDescription(a4);
    uint64_t v29 = (void *)objc_claimAutoreleasedReturnValue(v28);
    uint64_t v30 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"MADRequestID %d requestVideoFramesProcessing with unsupported task %@(%lu)",  v10,  v29,  a4));

    id v31 = [(id)objc_opt_class(self) errorForStatus:4294967292 withDescription:v30];
    uint64_t v32 = (void *)objc_claimAutoreleasedReturnValue(v31);
    (*((void (**)(id, void, void *))v14 + 2))(v14, 0LL, v32);
  }
}

- (void)requestAssetProcessing:(int)a3 withTaskID:(unint64_t)a4 forLocalIdentifiers:(id)a5 fromPhotoLibraryWithURL:(id)a6 withOptions:(id)a7 andReply:(id)a8
{
  uint64_t v12 = *(void *)&a3;
  id v50 = a5;
  id v49 = a6;
  id v48 = a7;
  id v14 = a8;
  uint64_t v16 = MediaAnalysisLogLevel(v14, v15);
  if ((int)v16 >= 6)
  {
    uint64_t v18 = VCPLogInstance(v16, v17);
    os_log_type_t v19 = (os_log_s *)objc_claimAutoreleasedReturnValue(v18);
    os_log_type_t v20 = VCPLogToOSLogType[6];
    if (os_log_type_enabled(v19, v20))
    {
      uint64_t v21 = VCPTaskIDDescription(a4);
      double v22 = (void *)objc_claimAutoreleasedReturnValue(v21);
      *(_DWORD *)buf = 67109634;
      *(_DWORD *)&uint8_t buf[4] = v12;
      *(_WORD *)NSErrorUserInfoKey v71 = 2112;
      *(void *)&v71[2] = v22;
      *(_WORD *)&v71[10] = 2048;
      *(void *)&v71[12] = a4;
      _os_log_impl( (void *)&_mh_execute_header,  v19,  v20,  "[MAClientHandler] Received Photos asset processing MADRequestID %d for task %@(%lu)",  buf,  0x1Cu);
    }
  }

  if (a4 - 2 < 5 || a4 == 8)
  {
    if ([v50 count])
    {
      id v23 = (void *)objc_claimAutoreleasedReturnValue(+[VCPPhotoLibraryManager sharedManager](&OBJC_CLASS___VCPPhotoLibraryManager, "sharedManager"));
      id v24 = (void *)objc_claimAutoreleasedReturnValue([v23 photoLibraryWithURL:v49]);

      if (v24)
      {
        *(void *)buf = 0LL;
        *(void *)NSErrorUserInfoKey v71 = buf;
        *(void *)&v71[8] = 0x3032000000LL;
        *(void *)&v71[16] = sub_1000579F8;
        id v72 = sub_100057A08;
        id v25 = VCPTransactionWithName((uint64_t)@"VCPMediaAnalysisClientHandler-requestAssetProcessing");
        id v73 = (id)objc_claimAutoreleasedReturnValue(v25);
        v68[0] = _NSConcreteStackBlock;
        v68[1] = 3221225472LL;
        v68[2] = sub_10005C3A0;
        v68[3] = &unk_1001B9AF8;
        v68[4] = self;
        int v69 = v12;
        id v45 = objc_retainBlock(v68);
        v64[0] = _NSConcreteStackBlock;
        v64[1] = 3221225472LL;
        v64[2] = sub_10005C3BC;
        v64[3] = &unk_1001BA1D8;
        void v64[4] = self;
        int v67 = v12;
        id v26 = v14;
        id v65 = v26;
        NSErrorUserInfoKey v66 = buf;
        v62[0] = _NSConcreteStackBlock;
        v62[1] = 3221225472LL;
        v62[2] = sub_10005C6B4;
        v62[3] = &unk_1001BB9C8;
        int v46 = objc_retainBlock(v64);
        v62[4] = self;
        id v63 = v46;
        id v47 = objc_retainBlock(v62);
        uint64_t v44 = objc_claimAutoreleasedReturnValue( +[PHAsset vcp_fetchOptionsForLibrary:forTaskID:]( &OBJC_CLASS___PHAsset,  "vcp_fetchOptionsForLibrary:forTaskID:",  v24,  a4));
        os_log_type_t v27 = (void *)objc_claimAutoreleasedReturnValue( +[PHAsset fetchAssetsWithLocalIdentifiers:options:]( &OBJC_CLASS___PHAsset,  "fetchAssetsWithLocalIdentifiers:options:",  v50));
        uint64_t v28 = (void *)objc_claimAutoreleasedReturnValue([v27 fetchedObjects]);
        if ([v28 count])
        {
          managementQueue = (dispatch_queue_s *)self->_managementQueue;
          block[0] = _NSConcreteStackBlock;
          block[1] = 3221225472LL;
          block[2] = sub_10005C724;
          block[3] = &unk_1001BBA10;
          block[4] = self;
          int v61 = v12;
          id v56 = v26;
          unint64_t v60 = a4;
          id v52 = v28;
          id v57 = v45;
          id v58 = v46;
          id v53 = v50;
          id v54 = v49;
          id v59 = v47;
          id v55 = v48;
          dispatch_sync(managementQueue, block);

          uint64_t v30 = (void *)v44;
        }

        else
        {
          uint64_t v41 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Failed to fetch localIdentifiers for asset processing MADRequestID %d",  v12));
          id v42 = [(id)objc_opt_class(self) errorForStatus:4294967246 withDescription:v41];
          id v43 = (void *)objc_claimAutoreleasedReturnValue(v42);
          (*((void (**)(id, void, void *))v26 + 2))(v26, 0LL, v43);

          uint64_t v30 = (void *)v44;
        }

        _Block_object_dispose(buf, 8);
      }

      else
      {
        id v37 = (void *)objc_claimAutoreleasedReturnValue([v49 path]);
        id v38 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Failed to find client specified Photos Library (%@) for MADRequestID %d",  v37,  v12));

        id v39 = [(id)objc_opt_class(self) errorForStatus:4294967246 withDescription:v38];
        id v40 = (void *)objc_claimAutoreleasedReturnValue(v39);
        (*((void (**)(id, void, void *))v14 + 2))(v14, 0LL, v40);
      }
    }

    else
    {
      id v24 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"No localIdentifiers specified for MADRequestID %d",  v12));
      id v31 = [(id)objc_opt_class(self) errorForStatus:4294967246 withDescription:v24];
      uint64_t v32 = (void *)objc_claimAutoreleasedReturnValue(v31);
      (*((void (**)(id, void, void *))v14 + 2))(v14, 0LL, v32);
    }
  }

  else
  {
    uint64_t v33 = VCPTaskIDDescription(a4);
    id v34 = (void *)objc_claimAutoreleasedReturnValue(v33);
    id v24 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"MADRequestID %d requestAssetProcessing with unsupported task %@(%lu)",  v12,  v34,  a4));

    id v35 = [(id)objc_opt_class(self) errorForStatus:4294967292 withDescription:v24];
    BOOL v36 = (void *)objc_claimAutoreleasedReturnValue(v35);
    (*((void (**)(id, void, void *))v14 + 2))(v14, 0LL, v36);
  }
}

- (void)requestRecentsProcessing:(int)a3 withTaskID:(unint64_t)a4 photoLibraryWithURL:(id)a5 reply:(id)a6
{
  uint64_t v8 = *(void *)&a3;
  id v10 = a5;
  id v11 = a6;
  uint64_t v13 = MediaAnalysisLogLevel(v11, v12);
  if ((int)v13 >= 6)
  {
    uint64_t v15 = VCPLogInstance(v13, v14);
    uint64_t v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(v15);
    os_log_type_t v17 = VCPLogToOSLogType[6];
    if (os_log_type_enabled(v16, v17))
    {
      uint64_t v18 = VCPTaskIDDescription(a4);
      os_log_type_t v19 = (void *)objc_claimAutoreleasedReturnValue(v18);
      *(_DWORD *)buf = 67109634;
      *(_DWORD *)&uint8_t buf[4] = v8;
      *(_WORD *)int v46 = 2112;
      *(void *)&v46[2] = v19;
      *(_WORD *)&v46[10] = 2048;
      *(void *)&v46[12] = a4;
      _os_log_impl( (void *)&_mh_execute_header,  v16,  v17,  "[MAClientHandler] Received recents processing MADRequestID %d for task %@ (%lu)",  buf,  0x1Cu);
    }
  }

  if (a4 == 12)
  {
    os_log_type_t v20 = (void *)objc_claimAutoreleasedReturnValue(+[VCPPhotoLibraryManager sharedManager](&OBJC_CLASS___VCPPhotoLibraryManager, "sharedManager"));
    uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue([v20 photoLibraryWithURL:v10]);

    if (v21)
    {
      *(void *)buf = 0LL;
      *(void *)int v46 = buf;
      *(void *)&v46[8] = 0x3032000000LL;
      *(void *)&v46[16] = sub_1000579F8;
      id v47 = sub_100057A08;
      id v22 = VCPTransactionWithName((uint64_t)@"VCPMediaAnalysisClientHandler-requestRecentsProcessing");
      id v48 = (id)objc_claimAutoreleasedReturnValue(v22);
      v43[0] = _NSConcreteStackBlock;
      v43[1] = 3221225472LL;
      v43[2] = sub_10005CE78;
      v43[3] = &unk_1001B9AF8;
      void v43[4] = self;
      int v44 = v8;
      id v23 = objc_retainBlock(v43);
      v39[0] = _NSConcreteStackBlock;
      v39[1] = 3221225472LL;
      v39[2] = sub_10005CE94;
      v39[3] = &unk_1001BBA38;
      void v39[4] = self;
      int v42 = v8;
      id v24 = v11;
      id v40 = v24;
      uint64_t v41 = buf;
      id v25 = objc_retainBlock(v39);
      managementQueue = (dispatch_queue_s *)self->_managementQueue;
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472LL;
      block[2] = sub_10005D1E4;
      block[3] = &unk_1001BBA80;
      block[4] = self;
      int v38 = v8;
      id v36 = v24;
      uint64_t v37 = 12LL;
      dispatch_sync(managementQueue, block);

      _Block_object_dispose(buf, 8);
    }

    else
    {
      id v31 = (void *)objc_claimAutoreleasedReturnValue([v10 path]);
      uint64_t v32 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Failed to find client specified Photos Library (%@) for MADRequestID %d",  v31,  v8));

      id v33 = [(id)objc_opt_class(self) errorForStatus:4294967246 withDescription:v32];
      id v34 = (void *)objc_claimAutoreleasedReturnValue(v33);
      (*((void (**)(id, void *))v11 + 2))(v11, v34);
    }
  }

  else
  {
    uint64_t v27 = VCPTaskIDDescription(a4);
    uint64_t v28 = (void *)objc_claimAutoreleasedReturnValue(v27);
    uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"MADRequestID %d requestRecentsProcessing with unsupported task %@(%lu)",  v8,  v28,  a4));

    id v29 = [(id)objc_opt_class(self) errorForStatus:4294967292 withDescription:v21];
    uint64_t v30 = (void *)objc_claimAutoreleasedReturnValue(v29);
    (*((void (**)(id, void *))v11 + 2))(v11, v30);
  }
}

- (void)cancelRequest:(int)a3
{
  uint64_t v5 = MediaAnalysisLogLevel(self, a2);
  if ((int)v5 >= 6)
  {
    uint64_t v7 = VCPLogInstance(v5, v6);
    uint64_t v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
    os_log_type_t v9 = VCPLogToOSLogType[6];
    if (os_log_type_enabled(v8, v9))
    {
      *(_DWORD *)buf = 67109120;
      *(_DWORD *)&uint8_t buf[4] = a3;
      _os_log_impl( (void *)&_mh_execute_header,  v8,  v9,  "[MAClientHandler] Service received call to cancel task for MADRequestID %d",  buf,  8u);
    }
  }

  *(void *)buf = 0LL;
  id v24 = buf;
  uint64_t v25 = 0x3032000000LL;
  id v26 = sub_1000579F8;
  uint64_t v27 = sub_100057A08;
  id v28 = 0LL;
  managementQueue = (dispatch_queue_s *)self->_managementQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10005D824;
  block[3] = &unk_1001BA270;
  block[4] = self;
  void block[5] = buf;
  int v20 = a3;
  dispatch_sync(managementQueue, block);
  if (*((void *)v24 + 5))
  {
    id v11 = (void *)objc_claimAutoreleasedReturnValue(+[VCPMADTaskScheduler sharedInstance](&OBJC_CLASS___VCPMADTaskScheduler, "sharedInstance"));
    objc_msgSend(v11, "cancelTaskWithID:", objc_msgSend(*((id *)v24 + 5), "unsignedIntegerValue"));
  }

  else
  {
    id v12 = -[MADServiceClientTaskQueuingScheduler cancelTaskWithRequestID:]( self->_queuingTaskScheduler,  "cancelTaskWithRequestID:",  a3);
  }

  uint64_t v14 = MediaAnalysisLogLevel(v12, v13);
  if ((int)v14 >= 6)
  {
    uint64_t v16 = VCPLogInstance(v14, v15);
    os_log_type_t v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);
    os_log_type_t v18 = VCPLogToOSLogType[6];
    if (os_log_type_enabled(v17, v18))
    {
      *(_DWORD *)uint64_t v21 = 67109120;
      int v22 = a3;
      _os_log_impl( (void *)&_mh_execute_header,  v17,  v18,  "[MAClientHandler] Canceled task for MADRequestID %d ",  v21,  8u);
    }
  }

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
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v6,  v7,  "[MAClientHandler] Service received call to cancel all tasks",  buf,  2u);
    }
  }

  *(void *)buf = 0LL;
  id v29 = buf;
  uint64_t v30 = 0x3032000000LL;
  id v31 = sub_1000579F8;
  uint64_t v32 = sub_100057A08;
  id v33 = 0LL;
  managementQueue = (dispatch_queue_s *)self->_managementQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10005DB98;
  block[3] = &unk_1001BA030;
  block[4] = self;
  void block[5] = buf;
  dispatch_sync(managementQueue, block);
  __int128 v25 = 0u;
  __int128 v26 = 0u;
  __int128 v23 = 0u;
  __int128 v24 = 0u;
  id v9 = *((id *)v29 + 5);
  id v10 = [v9 countByEnumeratingWithState:&v23 objects:v36 count:16];
  if (v10)
  {
    uint64_t v11 = *(void *)v24;
    do
    {
      for (i = 0LL; i != v10; i = (char *)i + 1)
      {
        if (*(void *)v24 != v11) {
          objc_enumerationMutation(v9);
        }
        uint64_t v13 = *(void **)(*((void *)&v23 + 1) + 8LL * (void)i);
        uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue( +[VCPMADTaskScheduler sharedInstance]( &OBJC_CLASS___VCPMADTaskScheduler,  "sharedInstance",  (void)v23));
        objc_msgSend(v14, "cancelTaskWithID:", objc_msgSend(v13, "unsignedIntegerValue"));
      }

      id v10 = [v9 countByEnumeratingWithState:&v23 objects:v36 count:16];
    }

    while (v10);
  }

  unint64_t v15 = -[MADServiceClientTaskQueuingScheduler cancelAllTasks](self->_queuingTaskScheduler, "cancelAllTasks");
  uint64_t v17 = MediaAnalysisLogLevel(v15, v16);
  if ((int)v17 >= 6)
  {
    uint64_t v19 = VCPLogInstance(v17, v18);
    int v20 = (os_log_s *)objc_claimAutoreleasedReturnValue(v19);
    os_log_type_t v21 = VCPLogToOSLogType[6];
    if (os_log_type_enabled(v20, v21))
    {
      int v22 = (char *)[*((id *)v29 + 5) count];
      *(_DWORD *)id v34 = 134217984;
      id v35 = &v22[v15];
      _os_log_impl((void *)&_mh_execute_header, v20, v21, "[MAClientHandler] Service canceled all %lu tasks", v34, 0xCu);
    }
  }

  _Block_object_dispose(buf, 8);
}

- (void)notifyLibraryAvailableAtURL:(id)a3
{
  id v3 = a3;
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(+[VCPPhotoLibraryManager sharedManager](&OBJC_CLASS___VCPPhotoLibraryManager, "sharedManager"));
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([v4 photoLibraryWithURL:v3]);

  if (v5)
  {
    uint64_t v8 = MediaAnalysisLogLevel(v6, v7);
    if ((int)v8 >= 6)
    {
      uint64_t v10 = VCPLogInstance(v8, v9);
      uint64_t v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
      os_log_type_t v12 = VCPLogToOSLogType[6];
      if (os_log_type_enabled(v11, v12))
      {
        uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue([v5 photoLibraryURL]);
        uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue([v13 path]);
        int v20 = 138412290;
        os_log_type_t v21 = v14;
        _os_log_impl( (void *)&_mh_execute_header,  v11,  v12,  "[MAClientHandler] Added Photo Library %@",  (uint8_t *)&v20,  0xCu);
      }

- (void)cancelBackgroundActivityWithReply:(id)a3
{
  uint64_t v4 = (void (**)(id, void))a3;
  uint64_t v6 = MediaAnalysisLogLevel(v4, v5);
  if ((int)v6 >= 6)
  {
    uint64_t v8 = VCPLogInstance(v6, v7);
    uint64_t v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
    os_log_type_t v10 = VCPLogToOSLogType[6];
    if (os_log_type_enabled(v9, v10))
    {
      uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(-[VCPMediaAnalysisClientHandler description](self, "description"));
      int v13 = 138412290;
      uint64_t v14 = v11;
      _os_log_impl( (void *)&_mh_execute_header,  v9,  v10,  "[MAClientHandler] Service %@ to cancel background analysis",  (uint8_t *)&v13,  0xCu);
    }
  }

  os_log_type_t v12 = (void *)objc_claimAutoreleasedReturnValue(+[VCPMADTaskScheduler sharedInstance](&OBJC_CLASS___VCPMADTaskScheduler, "sharedInstance"));
  [v12 cancelBackgroundTasks];

  v4[2](v4, 0LL);
}

- (void)currentOutstandingTasksWithReply:(id)a3
{
  uint64_t v6 = (void (**)(id, char *))a3;
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(+[VCPMADTaskScheduler sharedInstance](&OBJC_CLASS___VCPMADTaskScheduler, "sharedInstance"));
  uint64_t v5 = (char *)[v4 currentOutstandingTasks];

  v6[2]( v6,  &v5[-[MADServiceClientTaskQueuingScheduler currentPendingTasks](self->_queuingTaskScheduler, "currentPendingTasks")]);
}

- (void)requestSuggestedPersons:(int)a3 withPersonWithLocalIdentifier:(id)a4 toBeConfirmedPersonSuggestions:(id)a5 toBeRejectedPersonSuggestions:(id)a6 andPhotoLibraryURL:(id)a7 andReply:(id)a8
{
  id v14 = a4;
  id v15 = a5;
  id v16 = a6;
  id v17 = a7;
  id v18 = a8;
  uint64_t v20 = MediaAnalysisLogLevel(v18, v19);
  if ((int)v20 >= 6)
  {
    uint64_t v22 = VCPLogInstance(v20, v21);
    __int128 v23 = (os_log_s *)objc_claimAutoreleasedReturnValue(v22);
    os_log_type_t v24 = VCPLogToOSLogType[6];
    if (os_log_type_enabled(v23, v24))
    {
      *(_DWORD *)buf = 67109378;
      *(_DWORD *)&uint8_t buf[4] = a3;
      LOWORD(v53) = 2112;
      *(void *)((char *)&v53 + 2) = v14;
      _os_log_impl( (void *)&_mh_execute_header,  v23,  v24,  "[MAClientHandler] Received requestSuggestedPersons MADRequestID %d to analyze %@",  buf,  0x12u);
    }
  }

  *(void *)buf = 0LL;
  *(void *)&__int128 v53 = buf;
  *((void *)&v53 + 1) = 0x3032000000LL;
  id v54 = sub_1000579F8;
  id v55 = sub_100057A08;
  id v25 = VCPTransactionWithName((uint64_t)@"VCPMediaAnalysisClientHandler-requestSuggestedPersons");
  id v56 = (id)objc_claimAutoreleasedReturnValue(v25);
  v50[0] = _NSConcreteStackBlock;
  v50[1] = 3221225472LL;
  v50[2] = sub_10005E2D8;
  v50[3] = &unk_1001B9AF8;
  v50[4] = self;
  int v51 = a3;
  __int128 v26 = objc_retainBlock(v50);
  v46[0] = _NSConcreteStackBlock;
  v46[1] = 3221225472LL;
  v46[2] = sub_10005E2F4;
  v46[3] = &unk_1001BBAA8;
  v46[4] = self;
  int v49 = a3;
  id v27 = v18;
  id v47 = v27;
  id v48 = buf;
  id v28 = objc_retainBlock(v46);
  managementQueue = (dispatch_queue_s *)self->_managementQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10005E5CC;
  block[3] = &unk_1001BBAD0;
  int v45 = a3;
  block[4] = self;
  id v38 = v14;
  id v39 = v15;
  id v40 = v16;
  id v41 = v17;
  id v42 = v27;
  id v43 = v26;
  id v44 = v28;
  uint64_t v30 = v28;
  id v31 = v26;
  id v32 = v17;
  id v33 = v16;
  id v34 = v15;
  id v35 = v14;
  id v36 = v27;
  dispatch_sync(managementQueue, block);

  _Block_object_dispose(buf, 8);
}

- (void)requestUpdateKeyFacesOfPersons:(int)a3 withLocalIdentifiers:(id)a4 andForceUpdate:(BOOL)a5 andPhotoLibraryURL:(id)a6 andReply:(id)a7
{
  id v12 = a4;
  id v13 = a6;
  id v14 = a7;
  uint64_t v16 = MediaAnalysisLogLevel(v14, v15);
  if ((int)v16 >= 6)
  {
    uint64_t v18 = VCPLogInstance(v16, v17);
    uint64_t v19 = (os_log_s *)objc_claimAutoreleasedReturnValue(v18);
    os_log_type_t v20 = VCPLogToOSLogType[6];
    if (os_log_type_enabled(v19, v20))
    {
      *(_DWORD *)buf = 67109378;
      *(_DWORD *)&uint8_t buf[4] = a3;
      LOWORD(v46) = 2112;
      *(void *)((char *)&v46 + 2) = v12;
      _os_log_impl( (void *)&_mh_execute_header,  v19,  v20,  "[MAClientHandler] Received requestUpdateKeyFacesOfPersons MADRequestID %d to analyze %@",  buf,  0x12u);
    }
  }

  *(void *)buf = 0LL;
  *(void *)&__int128 v46 = buf;
  *((void *)&v46 + 1) = 0x3032000000LL;
  id v47 = sub_1000579F8;
  id v48 = sub_100057A08;
  id v21 = VCPTransactionWithName((uint64_t)@"VCPMediaAnalysisClientHandler-requestUpdateKeyFacesOfPersons");
  id v49 = (id)objc_claimAutoreleasedReturnValue(v21);
  v43[0] = _NSConcreteStackBlock;
  v43[1] = 3221225472LL;
  v43[2] = sub_10005EAF4;
  v43[3] = &unk_1001B9AF8;
  void v43[4] = self;
  int v44 = a3;
  uint64_t v22 = objc_retainBlock(v43);
  v39[0] = _NSConcreteStackBlock;
  v39[1] = 3221225472LL;
  v39[2] = sub_10005EB10;
  v39[3] = &unk_1001BBB20;
  void v39[4] = self;
  int v42 = a3;
  id v23 = v14;
  id v40 = v23;
  id v41 = buf;
  os_log_type_t v24 = objc_retainBlock(v39);
  managementQueue = (dispatch_queue_s *)self->_managementQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10005EDCC;
  block[3] = &unk_1001BB888;
  int v37 = a3;
  block[4] = self;
  id v32 = v12;
  BOOL v38 = a5;
  id v33 = v13;
  id v34 = v23;
  id v35 = v22;
  id v36 = v24;
  __int128 v26 = v24;
  id v27 = v22;
  id v28 = v13;
  id v29 = v12;
  id v30 = v23;
  dispatch_sync(managementQueue, block);

  _Block_object_dispose(buf, 8);
}

- (void)requestFaceCandidatesforKeyFace:(int)a3 withPersonsWithLocalIdentifiers:(id)a4 andPhotoLibraryURL:(id)a5 andReply:(id)a6
{
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  uint64_t v14 = MediaAnalysisLogLevel(v12, v13);
  if ((int)v14 >= 6)
  {
    uint64_t v16 = VCPLogInstance(v14, v15);
    uint64_t v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);
    os_log_type_t v18 = VCPLogToOSLogType[6];
    if (os_log_type_enabled(v17, v18))
    {
      *(_DWORD *)buf = 67109378;
      *(_DWORD *)&uint8_t buf[4] = a3;
      LOWORD(v43) = 2112;
      *(void *)((char *)&v43 + 2) = v10;
      _os_log_impl( (void *)&_mh_execute_header,  v17,  v18,  "[MAClientHandler] Received requestFaceCandidatesforKeyFace MADRequestID %d to analyze %@",  buf,  0x12u);
    }
  }

  *(void *)buf = 0LL;
  *(void *)&__int128 v43 = buf;
  *((void *)&v43 + 1) = 0x3032000000LL;
  int v44 = sub_1000579F8;
  int v45 = sub_100057A08;
  id v19 = VCPTransactionWithName((uint64_t)@"VCPMediaAnalysisClientHandler-requestFaceCandidatesforKeyFace");
  id v46 = (id)objc_claimAutoreleasedReturnValue(v19);
  v40[0] = _NSConcreteStackBlock;
  v40[1] = 3221225472LL;
  v40[2] = sub_10005F2EC;
  v40[3] = &unk_1001B9AF8;
  v40[4] = self;
  int v41 = a3;
  os_log_type_t v20 = objc_retainBlock(v40);
  v36[0] = _NSConcreteStackBlock;
  v36[1] = 3221225472LL;
  v36[2] = sub_10005F308;
  v36[3] = &unk_1001BBAA8;
  void v36[4] = self;
  int v39 = a3;
  id v21 = v12;
  id v37 = v21;
  BOOL v38 = buf;
  uint64_t v22 = objc_retainBlock(v36);
  managementQueue = (dispatch_queue_s *)self->_managementQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10005F5E0;
  block[3] = &unk_1001BA200;
  int v35 = a3;
  block[4] = self;
  id v30 = v10;
  id v31 = v11;
  id v32 = v21;
  id v33 = v20;
  id v34 = v22;
  os_log_type_t v24 = v22;
  id v25 = v20;
  id v26 = v11;
  id v27 = v10;
  id v28 = v21;
  dispatch_sync(managementQueue, block);

  _Block_object_dispose(buf, 8);
}

- (void)requestResetPersons:(int)a3 withPhotoLibraryURL:(id)a4 andReply:(id)a5
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
      _os_log_impl( (void *)&_mh_execute_header,  v14,  v15,  "[MAClientHandler] Received requestResetPersons MADRequestID %d",  buf,  8u);
    }
  }

  *(void *)buf = 0LL;
  BOOL v38 = buf;
  uint64_t v39 = 0x3032000000LL;
  id v40 = sub_1000579F8;
  int v41 = sub_100057A08;
  id v16 = VCPTransactionWithName((uint64_t)@"VCPMediaAnalysisClientHandler-requestResetPersons");
  id v42 = (id)objc_claimAutoreleasedReturnValue(v16);
  v35[0] = _NSConcreteStackBlock;
  v35[1] = 3221225472LL;
  v35[2] = sub_10005FAC8;
  v35[3] = &unk_1001B9AF8;
  void v35[4] = self;
  int v36 = a3;
  uint64_t v17 = objc_retainBlock(v35);
  v31[0] = _NSConcreteStackBlock;
  v31[1] = 3221225472LL;
  v31[2] = sub_10005FAE4;
  v31[3] = &unk_1001BBB20;
  void v31[4] = self;
  int v34 = a3;
  id v18 = v9;
  id v32 = v18;
  id v33 = buf;
  id v19 = objc_retainBlock(v31);
  managementQueue = (dispatch_queue_s *)self->_managementQueue;
  v25[0] = _NSConcreteStackBlock;
  v25[1] = 3221225472LL;
  v25[2] = sub_10005FDA0;
  v25[3] = &unk_1001BBB48;
  int v30 = a3;
  v25[4] = self;
  id v26 = v8;
  id v27 = v18;
  id v28 = v17;
  id v29 = v19;
  id v21 = v19;
  uint64_t v22 = v17;
  id v23 = v8;
  id v24 = v18;
  dispatch_sync(managementQueue, v25);

  _Block_object_dispose(buf, 8);
}

- (void)requestResetFaceClassificationModel:(int)a3 withPhotoLibraryURL:(id)a4 andReply:(id)a5
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
      _os_log_impl( (void *)&_mh_execute_header,  v14,  v15,  "[MAClientHandler] Received requestResetFaceClassificationModel MADRequestID %d",  buf,  8u);
    }
  }

  *(void *)buf = 0LL;
  BOOL v38 = buf;
  uint64_t v39 = 0x3032000000LL;
  id v40 = sub_1000579F8;
  int v41 = sub_100057A08;
  id v16 = VCPTransactionWithName((uint64_t)@"VCPMediaAnalysisClientHandler-requestResetFaceClassificationModel");
  id v42 = (id)objc_claimAutoreleasedReturnValue(v16);
  v35[0] = _NSConcreteStackBlock;
  v35[1] = 3221225472LL;
  v35[2] = sub_100060288;
  v35[3] = &unk_1001B9AF8;
  void v35[4] = self;
  int v36 = a3;
  uint64_t v17 = objc_retainBlock(v35);
  v31[0] = _NSConcreteStackBlock;
  v31[1] = 3221225472LL;
  v31[2] = sub_1000602A4;
  v31[3] = &unk_1001BBB20;
  void v31[4] = self;
  int v34 = a3;
  id v18 = v9;
  id v32 = v18;
  id v33 = buf;
  id v19 = objc_retainBlock(v31);
  managementQueue = (dispatch_queue_s *)self->_managementQueue;
  v25[0] = _NSConcreteStackBlock;
  v25[1] = 3221225472LL;
  v25[2] = sub_100060560;
  v25[3] = &unk_1001BBB48;
  int v30 = a3;
  v25[4] = self;
  id v26 = v8;
  id v27 = v18;
  id v28 = v17;
  id v29 = v19;
  id v21 = v19;
  uint64_t v22 = v17;
  id v23 = v8;
  id v24 = v18;
  dispatch_sync(managementQueue, v25);

  _Block_object_dispose(buf, 8);
}

- (void)requestResetPetClassificationModel:(int)a3 withPhotoLibraryURL:(id)a4 andReply:(id)a5
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
      _os_log_impl( (void *)&_mh_execute_header,  v14,  v15,  "[MAClientHandler] Received requestResetPetClassificationModel MADRequestID %d",  buf,  8u);
    }
  }

  *(void *)buf = 0LL;
  BOOL v38 = buf;
  uint64_t v39 = 0x3032000000LL;
  id v40 = sub_1000579F8;
  int v41 = sub_100057A08;
  id v16 = VCPTransactionWithName((uint64_t)@"VCPMediaAnalysisClientHandler-requestResetPetClassificationModel");
  id v42 = (id)objc_claimAutoreleasedReturnValue(v16);
  v35[0] = _NSConcreteStackBlock;
  v35[1] = 3221225472LL;
  v35[2] = sub_100060A48;
  v35[3] = &unk_1001B9AF8;
  void v35[4] = self;
  int v36 = a3;
  uint64_t v17 = objc_retainBlock(v35);
  v31[0] = _NSConcreteStackBlock;
  v31[1] = 3221225472LL;
  v31[2] = sub_100060A64;
  v31[3] = &unk_1001BBB20;
  void v31[4] = self;
  int v34 = a3;
  id v18 = v9;
  id v32 = v18;
  id v33 = buf;
  id v19 = objc_retainBlock(v31);
  managementQueue = (dispatch_queue_s *)self->_managementQueue;
  v25[0] = _NSConcreteStackBlock;
  v25[1] = 3221225472LL;
  v25[2] = sub_100060D20;
  v25[3] = &unk_1001BBB48;
  int v30 = a3;
  v25[4] = self;
  id v26 = v8;
  id v27 = v18;
  id v28 = v17;
  id v29 = v19;
  id v21 = v19;
  uint64_t v22 = v17;
  id v23 = v8;
  id v24 = v18;
  dispatch_sync(managementQueue, v25);

  _Block_object_dispose(buf, 8);
}

- (void)requestSuggestedMePersonIdentifier:(int)a3 withContext:(id)a4 andPhotoLibraryURL:(id)a5 andReply:(id)a6
{
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  uint64_t v14 = MediaAnalysisLogLevel(v12, v13);
  if ((int)v14 >= 6)
  {
    uint64_t v16 = VCPLogInstance(v14, v15);
    uint64_t v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);
    os_log_type_t v18 = VCPLogToOSLogType[6];
    if (os_log_type_enabled(v17, v18))
    {
      *(_DWORD *)buf = 67109378;
      *(_DWORD *)&uint8_t buf[4] = a3;
      LOWORD(v43) = 2112;
      *(void *)((char *)&v43 + 2) = v10;
      _os_log_impl( (void *)&_mh_execute_header,  v17,  v18,  "[MAClientHandler] Received MADRequestID requestSuggestedMePersonIdentifier %d with context %@",  buf,  0x12u);
    }
  }

  *(void *)buf = 0LL;
  *(void *)&__int128 v43 = buf;
  *((void *)&v43 + 1) = 0x3032000000LL;
  int v44 = sub_1000579F8;
  int v45 = sub_100057A08;
  id v19 = VCPTransactionWithName((uint64_t)@"VCPMediaAnalysisClientHandler-requestSuggestedMePersonIdentifier");
  id v46 = (id)objc_claimAutoreleasedReturnValue(v19);
  v40[0] = _NSConcreteStackBlock;
  v40[1] = 3221225472LL;
  v40[2] = sub_10006123C;
  v40[3] = &unk_1001B9AF8;
  v40[4] = self;
  int v41 = a3;
  os_log_type_t v20 = objc_retainBlock(v40);
  v36[0] = _NSConcreteStackBlock;
  v36[1] = 3221225472LL;
  v36[2] = sub_100061258;
  v36[3] = &unk_1001BBB70;
  void v36[4] = self;
  int v39 = a3;
  id v21 = v12;
  id v37 = v21;
  BOOL v38 = buf;
  uint64_t v22 = objc_retainBlock(v36);
  managementQueue = (dispatch_queue_s *)self->_managementQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100061530;
  block[3] = &unk_1001BA200;
  int v35 = a3;
  block[4] = self;
  id v30 = v10;
  id v31 = v11;
  id v32 = v21;
  id v33 = v20;
  id v34 = v22;
  id v24 = v22;
  id v25 = v20;
  id v26 = v11;
  id v27 = v10;
  id v28 = v21;
  dispatch_sync(managementQueue, block);

  _Block_object_dispose(buf, 8);
}

- (void)requestPersonPromoterStatus:(int)a3 withAdvancedFlag:(BOOL)a4 andPhotoLibraryURL:(id)a5 andReply:(id)a6
{
  BOOL v7 = a4;
  id v10 = a5;
  id v11 = a6;
  uint64_t v13 = MediaAnalysisLogLevel(v11, v12);
  if ((int)v13 >= 6)
  {
    uint64_t v15 = VCPLogInstance(v13, v14);
    uint64_t v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(v15);
    os_log_type_t v17 = VCPLogToOSLogType[6];
    if (os_log_type_enabled(v16, v17))
    {
      *(_DWORD *)buf = 67109120;
      int v23 = a3;
      _os_log_impl( (void *)&_mh_execute_header,  v16,  v17,  "[MAClientHandler] Received requestPersonPromoterStatus MADRequestID %d",  buf,  8u);
    }
  }

  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472LL;
  v20[2] = sub_100061914;
  v20[3] = &unk_1001B9AF8;
  v20[4] = self;
  int v21 = a3;
  os_log_type_t v18 = objc_retainBlock(v20);
  id v19 = (void *)objc_claimAutoreleasedReturnValue( +[VCPRequestPersonPromoterStatusTask taskWithAdvancedFlag:andPhotoLibraryURL:andProgressHandler:andReply:]( &OBJC_CLASS___VCPRequestPersonPromoterStatusTask,  "taskWithAdvancedFlag:andPhotoLibraryURL:andProgressHandler:andReply:",  v7,  v10,  v18,  v11));
  [v19 run];
}

- (void)requestClusterCacheValidation:(int)a3 withPhotoLibraryURL:(id)a4 andReply:(id)a5
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
      _os_log_impl( (void *)&_mh_execute_header,  v14,  v15,  "[MAClientHandler] Received requestClusterCacheValidation MADRequestID %d",  buf,  8u);
    }
  }

  *(void *)buf = 0LL;
  BOOL v38 = buf;
  uint64_t v39 = 0x3032000000LL;
  id v40 = sub_1000579F8;
  int v41 = sub_100057A08;
  id v16 = VCPTransactionWithName((uint64_t)@"VCPMediaAnalysisClientHandler-requestClusterCacheValidation");
  id v42 = (id)objc_claimAutoreleasedReturnValue(v16);
  v35[0] = _NSConcreteStackBlock;
  v35[1] = 3221225472LL;
  v35[2] = sub_100061BD0;
  v35[3] = &unk_1001B9AF8;
  void v35[4] = self;
  int v36 = a3;
  os_log_type_t v17 = objc_retainBlock(v35);
  v31[0] = _NSConcreteStackBlock;
  v31[1] = 3221225472LL;
  v31[2] = sub_100061BEC;
  v31[3] = &unk_1001BA1D8;
  void v31[4] = self;
  int v34 = a3;
  id v18 = v9;
  id v32 = v18;
  id v33 = buf;
  id v19 = objc_retainBlock(v31);
  managementQueue = (dispatch_queue_s *)self->_managementQueue;
  v25[0] = _NSConcreteStackBlock;
  v25[1] = 3221225472LL;
  v25[2] = sub_100061EC4;
  v25[3] = &unk_1001BBB48;
  int v30 = a3;
  v25[4] = self;
  id v26 = v8;
  id v27 = v18;
  id v28 = v17;
  id v29 = v19;
  int v21 = v19;
  uint64_t v22 = v17;
  id v23 = v8;
  id v24 = v18;
  dispatch_sync(managementQueue, v25);

  _Block_object_dispose(buf, 8);
}

- (void)requestResetFaceClusteringState:(int)a3 withPhotoLibraryURL:(id)a4 andReply:(id)a5
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
      _os_log_impl( (void *)&_mh_execute_header,  v14,  v15,  "Received requestResetFaceClusteringState MADRequestID %d",  buf,  8u);
    }
  }

  *(void *)buf = 0LL;
  BOOL v38 = buf;
  uint64_t v39 = 0x3032000000LL;
  id v40 = sub_1000579F8;
  int v41 = sub_100057A08;
  id v16 = VCPTransactionWithName((uint64_t)@"VCPMediaAnalysisClientHandler-requestResetFaceClusteringState");
  id v42 = (id)objc_claimAutoreleasedReturnValue(v16);
  v35[0] = _NSConcreteStackBlock;
  v35[1] = 3221225472LL;
  v35[2] = sub_1000623AC;
  v35[3] = &unk_1001B9AF8;
  void v35[4] = self;
  int v36 = a3;
  os_log_type_t v17 = objc_retainBlock(v35);
  v31[0] = _NSConcreteStackBlock;
  v31[1] = 3221225472LL;
  v31[2] = sub_1000623C8;
  v31[3] = &unk_1001BBB20;
  void v31[4] = self;
  int v34 = a3;
  id v18 = v9;
  id v32 = v18;
  id v33 = buf;
  id v19 = objc_retainBlock(v31);
  managementQueue = (dispatch_queue_s *)self->_managementQueue;
  v25[0] = _NSConcreteStackBlock;
  v25[1] = 3221225472LL;
  v25[2] = sub_100062684;
  v25[3] = &unk_1001BBB48;
  int v30 = a3;
  v25[4] = self;
  id v26 = v8;
  id v27 = v18;
  id v28 = v17;
  id v29 = v19;
  int v21 = v19;
  uint64_t v22 = v17;
  id v23 = v8;
  id v24 = v18;
  dispatch_sync(managementQueue, v25);

  _Block_object_dispose(buf, 8);
}

- (void)requestReclusterFaces:(int)a3 withPhotoLibraryURL:(id)a4 andReply:(id)a5
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
      _os_log_impl((void *)&_mh_execute_header, v14, v15, "Received requestReclusterFaces MADRequestID %d", buf, 8u);
    }
  }

  *(void *)buf = 0LL;
  BOOL v38 = buf;
  uint64_t v39 = 0x3032000000LL;
  id v40 = sub_1000579F8;
  int v41 = sub_100057A08;
  id v16 = VCPTransactionWithName((uint64_t)@"VCPMediaAnalysisClientHandler-requestReclusterFaces");
  id v42 = (id)objc_claimAutoreleasedReturnValue(v16);
  v35[0] = _NSConcreteStackBlock;
  v35[1] = 3221225472LL;
  v35[2] = sub_100062B6C;
  v35[3] = &unk_1001B9AF8;
  void v35[4] = self;
  int v36 = a3;
  os_log_type_t v17 = objc_retainBlock(v35);
  v31[0] = _NSConcreteStackBlock;
  v31[1] = 3221225472LL;
  v31[2] = sub_100062B88;
  v31[3] = &unk_1001BBB20;
  void v31[4] = self;
  int v34 = a3;
  id v18 = v9;
  id v32 = v18;
  id v33 = buf;
  id v19 = objc_retainBlock(v31);
  managementQueue = (dispatch_queue_s *)self->_managementQueue;
  v25[0] = _NSConcreteStackBlock;
  v25[1] = 3221225472LL;
  v25[2] = sub_100062E44;
  v25[3] = &unk_1001BBB48;
  int v30 = a3;
  v25[4] = self;
  id v26 = v8;
  id v27 = v18;
  id v28 = v17;
  id v29 = v19;
  int v21 = v19;
  uint64_t v22 = v17;
  id v23 = v8;
  id v24 = v18;
  dispatch_sync(managementQueue, v25);

  _Block_object_dispose(buf, 8);
}

- (void)requestRebuildPersons:(int)a3 withLocalIdentifiers:(id)a4 andPhotoLibraryURL:(id)a5 andReply:(id)a6
{
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  uint64_t v14 = MediaAnalysisLogLevel(v12, v13);
  if ((int)v14 >= 6)
  {
    uint64_t v16 = VCPLogInstance(v14, v15);
    os_log_type_t v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);
    os_log_type_t v18 = VCPLogToOSLogType[6];
    if (os_log_type_enabled(v17, v18))
    {
      *(_DWORD *)buf = 67109120;
      *(_DWORD *)&uint8_t buf[4] = a3;
      _os_log_impl((void *)&_mh_execute_header, v17, v18, "Received requestRebuildPersons MADRequestID %d", buf, 8u);
    }
  }

  *(void *)buf = 0LL;
  __int128 v43 = buf;
  uint64_t v44 = 0x3032000000LL;
  int v45 = sub_1000579F8;
  id v46 = sub_100057A08;
  id v19 = VCPTransactionWithName((uint64_t)@"VCPMediaAnalysisClientHandler-requestRebuildPersons");
  id v47 = (id)objc_claimAutoreleasedReturnValue(v19);
  v40[0] = _NSConcreteStackBlock;
  v40[1] = 3221225472LL;
  v40[2] = sub_100063354;
  v40[3] = &unk_1001B9AF8;
  v40[4] = self;
  int v41 = a3;
  os_log_type_t v20 = objc_retainBlock(v40);
  v36[0] = _NSConcreteStackBlock;
  v36[1] = 3221225472LL;
  v36[2] = sub_100063370;
  v36[3] = &unk_1001BBB20;
  void v36[4] = self;
  int v39 = a3;
  id v21 = v12;
  id v37 = v21;
  BOOL v38 = buf;
  uint64_t v22 = objc_retainBlock(v36);
  managementQueue = (dispatch_queue_s *)self->_managementQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10006362C;
  block[3] = &unk_1001BA200;
  int v35 = a3;
  block[4] = self;
  id v30 = v10;
  id v31 = v11;
  id v32 = v21;
  id v33 = v20;
  id v34 = v22;
  id v24 = v22;
  id v25 = v20;
  id v26 = v11;
  id v27 = v10;
  id v28 = v21;
  dispatch_sync(managementQueue, block);

  _Block_object_dispose(buf, 8);
}

- (void)requestPersonPreferenceForPhotoLibraryURL:(id)a3 andReply:(id)a4
{
  id v13 = a3;
  uint64_t v6 = (void (**)(id, void *, void))a4;
  BOOL v7 = (void *)objc_claimAutoreleasedReturnValue(+[VCPPhotoLibraryManager sharedManager](&OBJC_CLASS___VCPPhotoLibraryManager, "sharedManager"));
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 photoLibraryWithURL:v13]);

  if (v8)
  {
    id v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "vcp_analysisPreferences"));
    v6[2](v6, v9, 0LL);
  }

  else
  {
    id v10 = (void *)objc_claimAutoreleasedReturnValue([v13 path]);
    id v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Failed to find specified Photos Library (%@)",  v10));

    id v11 = [(id)objc_opt_class(self) errorForStatus:4294967278 withDescription:v9];
    id v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
    ((void (**)(id, void *, void *))v6)[2](v6, 0LL, v12);
  }
}

- (void)requestVIPModelStorageFilepathForPhotoLibraryURL:(id)a3 forModelType:(unint64_t)a4 andReply:(id)a5
{
  id v9 = a3;
  id v10 = (void (**)(id, void *, void *))a5;
  id v11 = (void *)objc_claimAutoreleasedReturnValue(+[VCPPhotoLibraryManager sharedManager](&OBJC_CLASS___VCPPhotoLibraryManager, "sharedManager"));
  id v12 = (void *)objc_claimAutoreleasedReturnValue([v11 photoLibraryWithURL:v9]);

  if (v12)
  {
    id v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "vcp_vipModelFilepathForVIPType:", a4));
    if (v13)
    {
      uint64_t v14 = 0LL;
    }

    else
    {
      id v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Unknown VIP model type %lu",  a4,  NSLocalizedDescriptionKey));
      os_log_type_t v20 = v11;
      uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v20,  &v19,  1LL));
      uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  NSOSStatusErrorDomain,  -50LL,  v5));
    }

    v10[2](v10, v13, v14);
    if (!v13)
    {
    }
  }

  else
  {
    uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue([v9 path]);
    uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Failed to find specified Photos Library (%@)",  v15));

    id v17 = [(id)objc_opt_class(self) errorForStatus:4294967278 withDescription:v16];
    os_log_type_t v18 = (void *)objc_claimAutoreleasedReturnValue(v17);
    v10[2](v10, 0LL, v18);
  }
}

- (void)queryAutoCounterOptInStatus:(int)a3 withPhotoLibraryURL:(id)a4 personLocalIdentifiers:(id)a5 andReply:(id)a6
{
  id v9 = a4;
  id v10 = a5;
  id v11 = (void (**)(id, id, void))a6;
  uint64_t v13 = MediaAnalysisLogLevel(v11, v12);
  if ((int)v13 >= 6)
  {
    uint64_t v15 = VCPLogInstance(v13, v14);
    uint64_t v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(v15);
    os_log_type_t v17 = VCPLogToOSLogType[6];
    if (os_log_type_enabled(v16, v17))
    {
      *(_DWORD *)buf = 67109120;
      *(_DWORD *)&uint8_t buf[4] = a3;
      _os_log_impl( (void *)&_mh_execute_header,  v16,  v17,  "[MAClientHandler] Received queryAutoCounterOptInStatus MADRequestID %d",  buf,  8u);
    }
  }

  os_log_type_t v18 = (void *)objc_claimAutoreleasedReturnValue(+[VCPPhotoLibraryManager sharedManager](&OBJC_CLASS___VCPPhotoLibraryManager, "sharedManager"));
  uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue([v18 photoLibraryWithURL:v9]);

  os_log_type_t v20 = (void *)objc_claimAutoreleasedReturnValue( +[VCPPhotosAutoCounterWorker workerWithPhotoLibrary:]( &OBJC_CLASS___VCPPhotosAutoCounterWorker,  "workerWithPhotoLibrary:",  v19));
  id v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  *(void *)buf = 0LL;
  id v48 = buf;
  uint64_t v49 = 0x3032000000LL;
  id v50 = sub_1000579F8;
  int v51 = sub_100057A08;
  id v52 = 0LL;
  v39[0] = _NSConcreteStackBlock;
  v39[1] = 3221225472LL;
  v39[2] = sub_10006400C;
  v39[3] = &unk_1001BBB98;
  id v22 = v20;
  id v40 = v22;
  id v42 = buf;
  id v23 = v21;
  id v41 = v23;
  id v24 = [v10 enumerateObjectsUsingBlock:v39];
  if (*((void *)v48 + 5))
  {
    uint64_t v26 = MediaAnalysisLogLevel(v24, v25);
    if ((int)v26 >= 3)
    {
      uint64_t v28 = VCPLogInstance(v26, v27);
      id v29 = (os_log_s *)objc_claimAutoreleasedReturnValue(v28);
      os_log_type_t v30 = VCPLogToOSLogType[3];
      if (os_log_type_enabled(v29, v30))
      {
        uint64_t v31 = *((void *)v48 + 5);
        *(_DWORD *)__int128 v43 = 67109378;
        int v44 = a3;
        __int16 v45 = 2112;
        uint64_t v46 = v31;
        _os_log_impl( (void *)&_mh_execute_header,  v29,  v30,  "[MAClientHandler] Failed to queryAutoCounterOptInStatus MADRequestID %d %@",  v43,  0x12u);
      }
    }

    id v32 = 0LL;
    uint64_t v33 = *((void *)v48 + 5);
  }

  else
  {
    uint64_t v34 = MediaAnalysisLogLevel(v24, v25);
    if ((int)v34 >= 6)
    {
      uint64_t v36 = VCPLogInstance(v34, v35);
      id v37 = (os_log_s *)objc_claimAutoreleasedReturnValue(v36);
      os_log_type_t v38 = VCPLogToOSLogType[6];
      if (os_log_type_enabled(v37, v38))
      {
        *(_DWORD *)__int128 v43 = 67109120;
        int v44 = a3;
        _os_log_impl( (void *)&_mh_execute_header,  v37,  v38,  "[MAClientHandler] Completed queryAutoCounterOptInStatus MADRequestID %d",  v43,  8u);
      }
    }

    uint64_t v33 = 0LL;
    id v32 = v23;
  }

  v11[2](v11, v32, v33);

  _Block_object_dispose(buf, 8);
}

- (void)requestOptInAutoCounter:(int)a3 withPhotoLibraryURL:(id)a4 persons:(id)a5 andReply:(id)a6
{
  id v9 = a4;
  id v10 = a5;
  id v11 = (void (**)(id, id, void))a6;
  uint64_t v13 = MediaAnalysisLogLevel(v11, v12);
  if ((int)v13 >= 6)
  {
    uint64_t v15 = VCPLogInstance(v13, v14);
    uint64_t v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(v15);
    os_log_type_t v17 = VCPLogToOSLogType[6];
    if (os_log_type_enabled(v16, v17))
    {
      *(_DWORD *)buf = 67109120;
      *(_DWORD *)&uint8_t buf[4] = a3;
      _os_log_impl( (void *)&_mh_execute_header,  v16,  v17,  "[MAClientHandler] Received requestOptInAutoCounter MADRequestID %d",  buf,  8u);
    }
  }

  os_log_type_t v18 = (void *)objc_claimAutoreleasedReturnValue(+[VCPPhotoLibraryManager sharedManager](&OBJC_CLASS___VCPPhotoLibraryManager, "sharedManager"));
  uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue([v18 photoLibraryWithURL:v9]);

  os_log_type_t v20 = (void *)objc_claimAutoreleasedReturnValue( +[VCPPhotosAutoCounterWorker workerWithPhotoLibrary:]( &OBJC_CLASS___VCPPhotosAutoCounterWorker,  "workerWithPhotoLibrary:",  v19));
  id v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  *(void *)buf = 0LL;
  id v48 = buf;
  uint64_t v49 = 0x3032000000LL;
  id v50 = sub_1000579F8;
  int v51 = sub_100057A08;
  id v52 = 0LL;
  v39[0] = _NSConcreteStackBlock;
  v39[1] = 3221225472LL;
  v39[2] = sub_100064500;
  v39[3] = &unk_1001BBC00;
  id v22 = v20;
  id v40 = v22;
  id v42 = buf;
  id v23 = v21;
  id v41 = v23;
  id v24 = [v10 enumerateObjectsUsingBlock:v39];
  if (*((void *)v48 + 5))
  {
    uint64_t v26 = MediaAnalysisLogLevel(v24, v25);
    if ((int)v26 >= 3)
    {
      uint64_t v28 = VCPLogInstance(v26, v27);
      id v29 = (os_log_s *)objc_claimAutoreleasedReturnValue(v28);
      os_log_type_t v30 = VCPLogToOSLogType[3];
      if (os_log_type_enabled(v29, v30))
      {
        uint64_t v31 = *((void *)v48 + 5);
        *(_DWORD *)__int128 v43 = 67109378;
        int v44 = a3;
        __int16 v45 = 2112;
        uint64_t v46 = v31;
        _os_log_impl( (void *)&_mh_execute_header,  v29,  v30,  "[MAClientHandler] Failed to requestOptInAutoCounter MADRequestID %d %@",  v43,  0x12u);
      }
    }

    id v32 = 0LL;
    uint64_t v33 = *((void *)v48 + 5);
  }

  else
  {
    uint64_t v34 = MediaAnalysisLogLevel(v24, v25);
    if ((int)v34 >= 6)
    {
      uint64_t v36 = VCPLogInstance(v34, v35);
      id v37 = (os_log_s *)objc_claimAutoreleasedReturnValue(v36);
      os_log_type_t v38 = VCPLogToOSLogType[6];
      if (os_log_type_enabled(v37, v38))
      {
        *(_DWORD *)__int128 v43 = 67109120;
        int v44 = a3;
        _os_log_impl( (void *)&_mh_execute_header,  v37,  v38,  "[MAClientHandler] Completed requestOptInAutoCounter MADRequestID %d",  v43,  8u);
      }
    }

    uint64_t v33 = 0LL;
    id v32 = v23;
  }

  v11[2](v11, v32, v33);

  _Block_object_dispose(buf, 8);
}

- (void)requestDumpAutoCounter:(int)a3 withPhotoLibraryURL:(id)a4 andReply:(id)a5
{
  id v7 = a4;
  id v8 = (void (**)(id, void, void *))a5;
  uint64_t v10 = MediaAnalysisLogLevel(v8, v9);
  if ((int)v10 >= 6)
  {
    uint64_t v12 = VCPLogInstance(v10, v11);
    uint64_t v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
    os_log_type_t v14 = VCPLogToOSLogType[6];
    if (os_log_type_enabled(v13, v14))
    {
      *(_DWORD *)buf = 67109120;
      int v45 = a3;
      _os_log_impl( (void *)&_mh_execute_header,  v13,  v14,  "[MAClientHandler] Received requestDumpAutoCounter MADRequestID %d",  buf,  8u);
    }
  }

  uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue(+[VCPPhotoLibraryManager sharedManager](&OBJC_CLASS___VCPPhotoLibraryManager, "sharedManager"));
  uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue([v15 photoLibraryWithURL:v7]);

  os_log_type_t v17 = (void *)objc_claimAutoreleasedReturnValue( +[VCPPhotosAutoCounterWorker workerWithPhotoLibrary:]( &OBJC_CLASS___VCPPhotosAutoCounterWorker,  "workerWithPhotoLibrary:",  v16));
  if (objc_msgSend(v16, "mad_useVUGallery"))
  {
    uint64_t v40 = 0LL;
    uint64_t v41 = 0LL;
    os_log_type_t v18 = (id *)&v40;
    uint64_t v19 = (id *)&v41;
    unsigned int v20 = [v17 exportVUGalleryClusterStates:&v41 error:&v40 extendTimeoutBlock:&stru_1001BBC20 cancelBlock:&stru_1001BBC40];
  }

  else
  {
    uint64_t v38 = 0LL;
    uint64_t v39 = 0LL;
    os_log_type_t v18 = (id *)&v38;
    uint64_t v19 = (id *)&v39;
    unsigned int v20 = [v17 exportClustersStates:&v39 error:&v38 extendTimeoutBlock:&stru_1001BBC60 cancelBlock:&stru_1001BBC80];
  }

  unsigned int v21 = v20;
  id v22 = *v19;
  id v23 = *v18;
  uint64_t v25 = v23;
  if (v21 || v23)
  {
    uint64_t v33 = MediaAnalysisLogLevel(v23, v24);
    if ((int)v33 >= 3)
    {
      uint64_t v35 = VCPLogInstance(v33, v34);
      uint64_t v36 = (os_log_s *)objc_claimAutoreleasedReturnValue(v35);
      os_log_type_t v37 = VCPLogToOSLogType[3];
      if (os_log_type_enabled(v36, v37))
      {
        *(_DWORD *)buf = 67109378;
        int v45 = a3;
        __int16 v46 = 2112;
        id v47 = v25;
        _os_log_impl( (void *)&_mh_execute_header,  v36,  v37,  "[MAClientHandler] Failed to requestDumpAutoCounter MADRequestID %d %@",  buf,  0x12u);
      }
    }

    v8[2](v8, 0LL, v25);
  }

  else
  {
    uint64_t v26 = MediaAnalysisLogLevel(0LL, v24);
    if ((int)v26 >= 6)
    {
      uint64_t v28 = VCPLogInstance(v26, v27);
      id v29 = (os_log_s *)objc_claimAutoreleasedReturnValue(v28);
      os_log_type_t v30 = VCPLogToOSLogType[6];
      if (os_log_type_enabled(v29, v30))
      {
        *(_DWORD *)buf = 67109120;
        int v45 = a3;
        _os_log_impl( (void *)&_mh_execute_header,  v29,  v30,  "[MAClientHandler] Completed requestDumpAutoCounter MADRequestID %d",  buf,  8u);
      }
    }

    uint64_t v42 = VCPMAFileURL;
    uint64_t v31 = (void *)objc_claimAutoreleasedReturnValue([v22 absoluteString]);
    __int128 v43 = v31;
    id v32 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v43,  &v42,  1LL));
    ((void (**)(id, void *, void *))v8)[2](v8, v32, 0LL);
  }
}

- (void)requestAutoCounterAccuracyCalculation:(int)a3 withPhotoLibraryURL:(id)a4 andReply:(id)a5
{
  uint64_t v6 = *(void *)&a3;
  id v48 = a4;
  id v47 = (void (**)(id, id, void))a5;
  uint64_t v8 = MediaAnalysisLogLevel(v47, v7);
  if ((int)v8 >= 6)
  {
    uint64_t v10 = VCPLogInstance(v8, v9);
    uint64_t v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
    os_log_type_t v12 = VCPLogToOSLogType[6];
    if (os_log_type_enabled(v11, v12))
    {
      *(_DWORD *)buf = 67109120;
      int v59 = v6;
      _os_log_impl( (void *)&_mh_execute_header,  v11,  v12,  "[MAClientHandler] Received requestAutoCounterAccuracyCalculation MADRequestID %d",  buf,  8u);
    }
  }

  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue(+[VCPPhotoLibraryManager sharedManager](&OBJC_CLASS___VCPPhotoLibraryManager, "sharedManager"));
  os_log_type_t v14 = (void *)objc_claimAutoreleasedReturnValue([v13 photoLibraryWithURL:v48]);

  uint64_t v49 = (void *)objc_claimAutoreleasedReturnValue( +[VCPPhotosAutoCounterWorker workerWithPhotoLibrary:]( &OBJC_CLASS___VCPPhotosAutoCounterWorker,  "workerWithPhotoLibrary:",  v14));
  if (objc_msgSend(v14, "mad_useVUGallery"))
  {
    uint64_t v54 = 0LL;
    uint64_t v55 = 0LL;
    uint64_t v15 = (id *)&v54;
    uint64_t v16 = (id *)&v55;
    unsigned int v17 = [v49 exportVUGalleryClusterStates:&v55 error:&v54 extendTimeoutBlock:&stru_1001BBCA0 cancelBlock:&stru_1001BBCC0];
  }

  else
  {
    uint64_t v52 = 0LL;
    uint64_t v53 = 0LL;
    uint64_t v15 = (id *)&v52;
    uint64_t v16 = (id *)&v53;
    unsigned int v17 = [v49 exportClustersStates:&v53 error:&v52 extendTimeoutBlock:&stru_1001BBCA0 cancelBlock:&stru_1001BBCC0];
  }

  unsigned int v18 = v17;
  id v19 = *v16;
  id v20 = *v15;
  id v22 = v20;
  if (!v18 && !v20)
  {
    id v51 = 0LL;
    signed int v23 = VCPFetchPersonPromoterClusterForEvaluation(v14, &v51, &stru_1001BBCA0, &stru_1001BBCC0);
    id v24 = v51;
    uint64_t v26 = v24;
    if (v23)
    {
      uint64_t v27 = MediaAnalysisLogLevel(v24, v25);
      if ((int)v27 < 3)
      {
        id v32 = 0LL;
        goto LABEL_26;
      }

      uint64_t v29 = VCPLogInstance(v27, v28);
      os_log_type_t v30 = (os_log_s *)objc_claimAutoreleasedReturnValue(v29);
      os_log_type_t v31 = VCPLogToOSLogType[3];
      if (os_log_type_enabled(v30, v31))
      {
        *(_DWORD *)buf = 67109376;
        int v59 = v6;
        __int16 v60 = 1024;
        unsigned int v61 = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v30,  v31,  "[MAClientHandler] Failed to VCPFetchPersonPromoterClusterForEvaluation with MADRequestID %d %d",  buf,  0xEu);
      }

      id v32 = 0LL;
    }

    else
    {
      id v50 = 0LL;
      signed int v23 = [v49 calculateAndReportClusterAccuracyWithVisionClusterURL:v19 andPersonClusters:v24 results:&v50 extendTimeou tBlock:&stru_1001BBCA0 cancelBlock:&stru_1001BBCC0];
      id v38 = v50;
      id v32 = v38;
      if (!v23)
      {
        v47[2](v47, v38, 0LL);
        goto LABEL_27;
      }

      uint64_t v40 = MediaAnalysisLogLevel(v38, v39);
      uint64_t v42 = VCPLogInstance(v40, v41);
      os_log_type_t v30 = (os_log_s *)objc_claimAutoreleasedReturnValue(v42);
      os_log_type_t v43 = VCPLogToOSLogType[3];
      if (os_log_type_enabled(v30, v43))
      {
        *(_DWORD *)buf = 67109376;
        int v59 = v6;
        __int16 v60 = 1024;
        unsigned int v61 = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v30,  v43,  "[MAClientHandler] Failed to calculate Vision and Person cluster accuracy with MADRequestID %d %d",  buf,  0xEu);
      }
    }

LABEL_26:
    NSErrorUserInfoKey v56 = NSLocalizedDescriptionKey;
    int v44 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"[MAClientHandler] Failed to calculate cluster accuracy with MADRequestID %d",  v6));
    id v57 = v44;
    int v45 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v57,  &v56,  1LL));
    __int16 v46 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  NSOSStatusErrorDomain,  v23,  v45));
    ((void (**)(id, id, void *))v47)[2](v47, 0LL, v46);

    goto LABEL_27;
  }

  uint64_t v33 = MediaAnalysisLogLevel(v20, v21);
  if ((int)v33 >= 3)
  {
    uint64_t v35 = VCPLogInstance(v33, v34);
    uint64_t v36 = (os_log_s *)objc_claimAutoreleasedReturnValue(v35);
    os_log_type_t v37 = VCPLogToOSLogType[3];
    if (os_log_type_enabled(v36, v37))
    {
      *(_DWORD *)buf = 67109376;
      int v59 = v6;
      __int16 v60 = 1024;
      unsigned int v61 = v18;
      _os_log_impl( (void *)&_mh_execute_header,  v36,  v37,  "[MAClientHandler] Failed to requestAutoCounterAccuracyCalculation MADRequestID %d %d",  buf,  0xEu);
    }
  }

  uint64_t v26 = 0LL;
  id v32 = 0LL;
  ((void (**)(id, id, void *))v47)[2](v47, 0LL, v22);
LABEL_27:
}

- (void)requestAutoCounterAccuracyCalculation:(int)a3 withPhotoLibraryURL:(id)a4 clusterStateURL:(id)a5 groundTruthURL:(id)a6 andReply:(id)a7
{
  uint64_t v10 = *(void *)&a3;
  id v42 = a4;
  id v41 = a5;
  id v11 = a6;
  os_log_type_t v12 = (void (**)(id, id, void))a7;
  uint64_t v14 = MediaAnalysisLogLevel(v12, v13);
  if ((int)v14 >= 6)
  {
    uint64_t v16 = VCPLogInstance(v14, v15);
    unsigned int v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);
    os_log_type_t v18 = VCPLogToOSLogType[6];
    if (os_log_type_enabled(v17, v18))
    {
      *(_DWORD *)buf = 67109120;
      int v48 = v10;
      _os_log_impl( (void *)&_mh_execute_header,  v17,  v18,  "[MAClientHandler] Received requestAutoCounterAccuracyCalculationWithgroundTruthURL MADRequestID %d",  buf,  8u);
    }
  }

  id v19 = (void *)objc_claimAutoreleasedReturnValue(+[VCPPhotoLibraryManager sharedManager](&OBJC_CLASS___VCPPhotoLibraryManager, "sharedManager"));
  id v20 = (void *)objc_claimAutoreleasedReturnValue([v19 photoLibraryWithURL:v42]);

  uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue( +[VCPPhotosAutoCounterWorker workerWithPhotoLibrary:]( &OBJC_CLASS___VCPPhotosAutoCounterWorker,  "workerWithPhotoLibrary:",  v20));
  id v44 = 0LL;
  signed int v22 = VCPFetchPersonPromoterClusterForEvaluation(v20, &v44, &stru_1001BBCE0, &stru_1001BBD00);
  id v23 = v44;
  uint64_t v25 = v23;
  if (v22)
  {
    uint64_t v26 = MediaAnalysisLogLevel(v23, v24);
    if ((int)v26 < 3)
    {
      os_log_type_t v31 = 0LL;
      goto LABEL_16;
    }

    uint64_t v28 = VCPLogInstance(v26, v27);
    uint64_t v29 = (os_log_s *)objc_claimAutoreleasedReturnValue(v28);
    os_log_type_t v30 = VCPLogToOSLogType[3];
    if (os_log_type_enabled(v29, v30))
    {
      *(_DWORD *)buf = 67109120;
      int v48 = v10;
      _os_log_impl( (void *)&_mh_execute_header,  v29,  v30,  "[MAClientHandler] Failed in fetching unverified persons with MADRequestID %d",  buf,  8u);
    }

    os_log_type_t v31 = 0LL;
    goto LABEL_10;
  }

  id v43 = 0LL;
  signed int v22 = [v21 calculateAndReportClusterAccuracyWithVisionClusterURL:v41 andPersonClusters:v23 withGroundtruth:v11 results:&v43  extendTimeoutBlock:&stru_1001BBCE0 cancelBlock:&stru_1001BBD00];
  id v32 = v43;
  os_log_type_t v31 = v32;
  if (!v22)
  {
    v12[2](v12, v32, 0LL);
    goto LABEL_17;
  }

  uint64_t v34 = MediaAnalysisLogLevel(v32, v33);
  if ((int)v34 >= 3)
  {
    uint64_t v36 = VCPLogInstance(v34, v35);
    uint64_t v29 = (os_log_s *)objc_claimAutoreleasedReturnValue(v36);
    os_log_type_t v37 = VCPLogToOSLogType[3];
    if (os_log_type_enabled(v29, v37))
    {
      *(_DWORD *)buf = 67109120;
      int v48 = v10;
      _os_log_impl( (void *)&_mh_execute_header,  v29,  v37,  "[MAClientHandler] Failed in calculating Vision and Person cluster accuracy with MADRequestID %d",  buf,  8u);
    }

- (void)requestAutoCounterSIMLValidation:(int)a3 withPhotoLibraryURL:(id)a4 simlGroundTruthURL:(id)a5 andReply:(id)a6
{
  uint64_t v8 = *(void *)&a3;
  id v32 = a4;
  id v9 = a5;
  uint64_t v10 = (void (**)(id, void, void *))a6;
  uint64_t v12 = MediaAnalysisLogLevel(v10, v11);
  if ((int)v12 >= 6)
  {
    uint64_t v14 = VCPLogInstance(v12, v13);
    uint64_t v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
    os_log_type_t v16 = VCPLogToOSLogType[6];
    if (os_log_type_enabled(v15, v16))
    {
      *(_DWORD *)buf = 67109120;
      int v37 = v8;
      _os_log_impl( (void *)&_mh_execute_header,  v15,  v16,  "[MAClientHandler] Received requestAutoCounterSIMLValidation MADRequestID %d",  buf,  8u);
    }
  }

  unsigned int v17 = (void *)objc_claimAutoreleasedReturnValue(+[VCPPhotoLibraryManager sharedManager](&OBJC_CLASS___VCPPhotoLibraryManager, "sharedManager"));
  os_log_type_t v18 = (void *)objc_claimAutoreleasedReturnValue([v17 photoLibraryWithURL:v32]);

  id v19 = (void *)objc_claimAutoreleasedReturnValue( +[VCPPhotosAutoCounterWorker workerWithPhotoLibrary:]( &OBJC_CLASS___VCPPhotosAutoCounterWorker,  "workerWithPhotoLibrary:",  v18));
  id v33 = 0LL;
  signed int v20 = [v19 validateClusterAccuracyWithSIMLGroundtruth:v9 results:&v33 extendTimeoutBlock:&stru_1001BBD20 cancelBlock:&stru_1001BBD40];
  id v21 = v33;
  id v23 = v21;
  if (v20)
  {
    uint64_t v24 = MediaAnalysisLogLevel(v21, v22);
    if ((int)v24 >= 3)
    {
      uint64_t v26 = VCPLogInstance(v24, v25);
      uint64_t v27 = (os_log_s *)objc_claimAutoreleasedReturnValue(v26);
      os_log_type_t v28 = VCPLogToOSLogType[3];
      if (os_log_type_enabled(v27, v28))
      {
        *(_DWORD *)buf = 67109120;
        int v37 = v8;
        _os_log_impl( (void *)&_mh_execute_header,  v27,  v28,  "[MAClientHandler] Failed to validate against SIML ground truth with MADRequestID %d",  buf,  8u);
      }
    }

    NSErrorUserInfoKey v34 = NSLocalizedDescriptionKey;
    uint64_t v29 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"[MAClientHandler] Failed to validate against SIML ground truth %@ with MADRequestID %d",  v9,  v8));
    uint64_t v35 = v29;
    os_log_type_t v30 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v35,  &v34,  1LL));
    os_log_type_t v31 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  NSOSStatusErrorDomain,  v20,  v30));
    v10[2](v10, 0LL, v31);
  }

  else
  {
    ((void (**)(id, id, void *))v10)[2](v10, v21, 0LL);
  }
}

- (void)requestIdentificationOfFacesWithLocalIdentifiers:(id)a3 fromPhotoLibraryWithURL:(id)a4 withRequestID:(int)a5 andReply:(id)a6
{
  id v10 = a3;
  id v29 = a4;
  id v11 = a6;
  uint64_t v13 = MediaAnalysisLogLevel(v11, v12);
  if ((int)v13 >= 6)
  {
    uint64_t v15 = VCPLogInstance(v13, v14);
    os_log_type_t v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(v15);
    os_log_type_t v17 = VCPLogToOSLogType[6];
    if (os_log_type_enabled(v16, v17))
    {
      *(_DWORD *)buf = 67109120;
      *(_DWORD *)&uint8_t buf[4] = a5;
      _os_log_impl( (void *)&_mh_execute_header,  v16,  v17,  "[MAClientHandler] Received on-demand face identification request (%d)",  buf,  8u);
    }
  }

  context = objc_autoreleasePoolPush();
  *(void *)buf = 0LL;
  uint64_t v39 = buf;
  uint64_t v40 = 0x3032000000LL;
  id v41 = sub_1000579F8;
  id v42 = sub_100057A08;
  id v18 = VCPTransactionWithName((uint64_t)@"com.apple.mediaanalysisd.service");
  id v43 = (id)objc_claimAutoreleasedReturnValue(v18);
  v37[0] = _NSConcreteStackBlock;
  v37[1] = 3221225472LL;
  v37[2] = sub_100065C6C;
  v37[3] = &unk_1001B9F10;
  void v37[4] = buf;
  id v19 = objc_retainBlock(v37);
  v33[0] = _NSConcreteStackBlock;
  v33[1] = 3221225472LL;
  v33[2] = sub_100065C80;
  v33[3] = &unk_1001BBD68;
  int v36 = a5;
  id v20 = v11;
  id v34 = v20;
  id v21 = v19;
  id v35 = v21;
  uint64_t v22 = v10;
  id v23 = (void *)objc_claimAutoreleasedReturnValue( +[VCPPhotosFaceIdentificationTask taskWithFaceLocalIdentifiers:fromPhotoLibraryWithURL:withCompletionHandler:]( &OBJC_CLASS___VCPPhotosFaceIdentificationTask,  "taskWithFaceLocalIdentifiers:fromPhotoLibraryWithURL:withCompletionHandler:",  v10,  v29,  v33));
  queuingTaskScheduler = self->_queuingTaskScheduler;
  uint64_t v25 = a5;
  v30[0] = _NSConcreteStackBlock;
  v30[1] = 3221225472LL;
  v30[2] = sub_100065DA8;
  v30[3] = &unk_1001BBD90;
  id v26 = v20;
  id v31 = v26;
  uint64_t v27 = v21;
  id v32 = v27;
  -[MADServiceClientTaskQueuingScheduler submitClientTask:withRequestID:schedulingErrorHandler:]( queuingTaskScheduler,  "submitClientTask:withRequestID:schedulingErrorHandler:",  v23,  v25,  v30);

  _Block_object_dispose(buf, 8);
  objc_autoreleasePoolPop(context);
}

- (void)requestProcessingTypes:(unint64_t)a3 forAssetsWithLocalIdentifiers:(id)a4 fromPhotoLibraryWithURL:(id)a5 withRequestID:(int)a6 andReply:(id)a7
{
  id v27 = a4;
  id v12 = a5;
  id v13 = a7;
  uint64_t v15 = MediaAnalysisLogLevel(v13, v14);
  if ((int)v15 >= 6)
  {
    uint64_t v17 = VCPLogInstance(v15, v16);
    id v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(v17);
    os_log_type_t v19 = VCPLogToOSLogType[6];
    if (os_log_type_enabled(v18, v19))
    {
      *(_DWORD *)buf = 67109120;
      int v36 = a6;
      _os_log_impl( (void *)&_mh_execute_header,  v18,  v19,  "[MAClientHandler] Received on-demand Photos asset processing request (%d)",  buf,  8u);
    }
  }

  id v20 = objc_autoreleasePoolPush();
  v33[0] = _NSConcreteStackBlock;
  v33[1] = 3221225472LL;
  v33[2] = sub_10006608C;
  v33[3] = &unk_1001B9AF8;
  void v33[4] = self;
  int v34 = a6;
  id v21 = objc_retainBlock(v33);
  v30[0] = _NSConcreteStackBlock;
  v30[1] = 3221225472LL;
  v30[2] = sub_1000660A8;
  v30[3] = &unk_1001BBDB8;
  int v32 = a6;
  id v22 = v13;
  id v31 = v22;
  id v23 = (void *)objc_claimAutoreleasedReturnValue( +[VCPPhotosAssetProcessingTask taskWithProcessingTypes:forAssetsWithLocalIdentifiers:fromPhotoLibraryWithURL:withProgressHandler:andCompletionHandler:]( &OBJC_CLASS___VCPPhotosAssetProcessingTask,  "taskWithProcessingTypes:forAssetsWithLocalIdentifiers:fromPhotoLibraryWithURL:withProgressHandler:an dCompletionHandler:",  a3,  v27,  v12,  v21,  v30));
  queuingTaskScheduler = self->_queuingTaskScheduler;
  uint64_t v25 = a6;
  v28[0] = _NSConcreteStackBlock;
  v28[1] = 3221225472LL;
  v28[2] = sub_1000661A4;
  v28[3] = &unk_1001B9A60;
  id v26 = v22;
  id v29 = v26;
  -[MADServiceClientTaskQueuingScheduler submitClientTask:withRequestID:schedulingErrorHandler:]( queuingTaskScheduler,  "submitClientTask:withRequestID:schedulingErrorHandler:",  v23,  v25,  v28);

  objc_autoreleasePoolPop(v20);
}

- (void)requestDeferredProcessingTypes:(id)a3 forAssetsWithLocalIdentifiers:(id)a4 withPhotoLibraryURL:(id)a5 andReply:(id)a6
{
  uint64_t v6 = (void (**)(id, void *))a6;
  uint64_t v8 = MediaAnalysisLogLevel(v6, v7);
  if ((int)v8 >= 3)
  {
    uint64_t v10 = VCPLogInstance(v8, v9);
    id v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
    os_log_type_t v12 = VCPLogToOSLogType[3];
    if (os_log_type_enabled(v11, v12))
    {
      *(_WORD *)uint64_t v16 = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v11,  v12,  "[MAClientHandler] Moments deferred processing is unsupported.",  v16,  2u);
    }
  }

  NSErrorUserInfoKey v17 = NSLocalizedDescriptionKey;
  id v13 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"[MAClientHandler] Moments deferred processing is unsupported."));
  id v18 = v13;
  uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v18,  &v17,  1LL));
  uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  NSOSStatusErrorDomain,  -18LL,  v14));
  v6[2](v6, v15);
}

- (void)requestForceDeferredProcessing:(int)a3 andReply:(id)a4
{
  id v6 = a4;
  uint64_t v8 = MediaAnalysisLogLevel(v6, v7);
  if ((int)v8 >= 6)
  {
    uint64_t v10 = VCPLogInstance(v8, v9);
    id v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
    os_log_type_t v12 = VCPLogToOSLogType[6];
    if (os_log_type_enabled(v11, v12))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v11,  v12,  "[MAClientHandler] Received Moments request to force deferred processing",  buf,  2u);
    }
  }

  v25[0] = _NSConcreteStackBlock;
  v25[1] = 3221225472LL;
  v25[2] = sub_100066544;
  v25[3] = &unk_1001B9AF8;
  v25[4] = self;
  int v26 = a3;
  id v13 = objc_retainBlock(v25);
  v22[0] = _NSConcreteStackBlock;
  v22[1] = 3221225472LL;
  v22[2] = sub_100066560;
  v22[3] = &unk_1001BBDE0;
  int v24 = a3;
  id v14 = v6;
  v22[4] = self;
  id v23 = v14;
  uint64_t v15 = objc_retainBlock(v22);
  uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue( +[MADMomentsDeferredProcessingTask taskWithCancelBlock:progressHandler:andCompletionHandler:]( &OBJC_CLASS___MADMomentsDeferredProcessingTask,  "taskWithCancelBlock:progressHandler:andCompletionHandler:",  &stru_1001BBE00,  v13,  v15));
  queuingTaskScheduler = self->_queuingTaskScheduler;
  uint64_t v18 = a3;
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472LL;
  v20[2] = sub_100066748;
  v20[3] = &unk_1001B9A60;
  id v19 = v14;
  id v21 = v19;
  -[MADServiceClientTaskQueuingScheduler submitClientTask:withRequestID:schedulingErrorHandler:]( queuingTaskScheduler,  "submitClientTask:withRequestID:schedulingErrorHandler:",  v16,  v18,  v20);
}

- (void)queryAssetsPendingDeferredProcessingWithPhotoLibraryURL:(id)a3 andReply:(id)a4
{
  id v5 = a3;
  id v6 = (void (**)(id, void *, void))a4;
  uint64_t v8 = MediaAnalysisLogLevel(v6, v7);
  if ((int)v8 >= 6)
  {
    uint64_t v10 = VCPLogInstance(v8, v9);
    id v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
    os_log_type_t v12 = VCPLogToOSLogType[6];
    if (os_log_type_enabled(v11, v12))
    {
      *(_DWORD *)buf = 138412290;
      id v42 = v5;
      _os_log_impl( (void *)&_mh_execute_header,  v11,  v12,  "[MAClientHandler] Received Moments request to query scheduled assets in photo library %@",  buf,  0xCu);
    }
  }

  id v13 = (void *)objc_claimAutoreleasedReturnValue(+[VCPPhotoLibraryManager sharedManager](&OBJC_CLASS___VCPPhotoLibraryManager, "sharedManager"));
  id v14 = (void *)objc_claimAutoreleasedReturnValue([v13 photoLibraryWithURL:v5]);

  if (v14)
  {
    NSErrorUserInfoKey v17 = (void *)objc_claimAutoreleasedReturnValue( +[VCPDatabaseManager sharedDatabaseForPhotoLibrary:]( &OBJC_CLASS___VCPDatabaseManager,  "sharedDatabaseForPhotoLibrary:",  v14));
    id v36 = 0LL;
    signed int v18 = [v17 fetchAllMomentsScheduledAssets:&v36];
    id v19 = v36;
    id v21 = v19;
    if (!v18)
    {
      id v35 =  +[VCPDatabaseManager sharedDatabaseForPhotoLibrary:]( &OBJC_CLASS___VCPDatabaseManager,  "sharedDatabaseForPhotoLibrary:",  v14);
      v6[2](v6, v21, 0LL);
      goto LABEL_19;
    }

    uint64_t v22 = MediaAnalysisLogLevel(v19, v20);
    if ((int)v22 >= 3)
    {
      uint64_t v24 = VCPLogInstance(v22, v23);
      uint64_t v25 = (os_log_s *)objc_claimAutoreleasedReturnValue(v24);
      os_log_type_t v26 = VCPLogToOSLogType[3];
      if (os_log_type_enabled(v25, v26))
      {
        *(_DWORD *)buf = 138412290;
        id v42 = v5;
        _os_log_impl( (void *)&_mh_execute_header,  v25,  v26,  "[MAClientHandler] Failed to fetch scheduled assets in Photo Library %@",  buf,  0xCu);
      }
    }

    NSErrorUserInfoKey v37 = NSLocalizedDescriptionKey;
    id v27 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"[MAClientHandler] Failed to fetch scheduled assets in Photo Library %@",  v5));
    id v38 = v27;
    os_log_type_t v28 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v38,  &v37,  1LL));
    id v29 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  NSOSStatusErrorDomain,  v18,  v28));
    ((void (**)(id, void *, void *))v6)[2](v6, 0LL, v29);
  }

  else
  {
    uint64_t v30 = MediaAnalysisLogLevel(v15, v16);
    if ((int)v30 >= 3)
    {
      uint64_t v32 = VCPLogInstance(v30, v31);
      id v33 = (os_log_s *)objc_claimAutoreleasedReturnValue(v32);
      os_log_type_t v34 = VCPLogToOSLogType[3];
      if (os_log_type_enabled(v33, v34))
      {
        *(_DWORD *)buf = 138412290;
        id v42 = v5;
        _os_log_impl( (void *)&_mh_execute_header,  v33,  v34,  "[MAClientHandler] Invalid photo library URL (%@)",  buf,  0xCu);
      }
    }

    NSErrorUserInfoKey v39 = NSLocalizedDescriptionKey;
    id v21 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"[MAClientHandler] Invalid photo library URL (%@)",  v5));
    uint64_t v40 = v21;
    NSErrorUserInfoKey v17 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v40,  &v39,  1LL));
    id v27 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  NSOSStatusErrorDomain,  -50LL,  v17));
    ((void (**)(id, void *, void *))v6)[2](v6, 0LL, v27);
  }

LABEL_19:
}

- (void)downloadVideoEncoderIfNeededWithReply:(id)a3
{
  id v3 = (void (**)(id, void *))a3;
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(+[VCPMobileAssetManager sharedManager](&OBJC_CLASS___VCPMobileAssetManager, "sharedManager"));
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 retrieveAssetLocalURL:0]);

  if (v5)
  {
    uint64_t v8 = 0LL;
  }

  else
  {
    uint64_t v9 = MediaAnalysisLogLevel(v6, v7);
    if ((int)v9 >= 3)
    {
      uint64_t v11 = VCPLogInstance(v9, v10);
      os_log_type_t v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
      os_log_type_t v13 = VCPLogToOSLogType[3];
      if (os_log_type_enabled(v12, v13))
      {
        *(_WORD *)uint64_t v16 = 0;
        _os_log_impl((void *)&_mh_execute_header, v12, v13, "Video encoder mobile asset download failed", v16, 2u);
      }
    }

    NSErrorUserInfoKey v17 = NSLocalizedDescriptionKey;
    id v14 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"[MAClientHandler] Video encoder mobile asset download failed"));
    signed int v18 = v14;
    uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v18,  &v17,  1LL));
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  NSOSStatusErrorDomain,  -18LL,  v15));
  }

  v3[2](v3, v8);
}

- (void)requestStaticStickerScoring:(int)a3 photoLibraryURL:(id)a4 options:(id)a5 reply:(id)a6
{
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  uint64_t v14 = MediaAnalysisLogLevel(v12, v13);
  if ((int)v14 >= 6)
  {
    uint64_t v16 = VCPLogInstance(v14, v15);
    NSErrorUserInfoKey v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);
    os_log_type_t v18 = VCPLogToOSLogType[6];
    if (os_log_type_enabled(v17, v18))
    {
      *(_DWORD *)buf = 67109120;
      LODWORD(v43) = a3;
      _os_log_impl( (void *)&_mh_execute_header,  v17,  v18,  "[MAClientHandler] Received on-demand Photos static sticker scoring request (%d)",  buf,  8u);
    }
  }

  id v19 = objc_autoreleasePoolPush();
  uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue(+[VCPPhotoLibraryManager sharedManager](&OBJC_CLASS___VCPPhotoLibraryManager, "sharedManager"));
  id v21 = (void *)objc_claimAutoreleasedReturnValue([v20 photoLibraryWithURL:v10]);

  if (v21)
  {
    v37[0] = _NSConcreteStackBlock;
    v37[1] = 3221225472LL;
    v37[2] = sub_100067124;
    v37[3] = &unk_1001BBE28;
    int v39 = a3;
    id v24 = v12;
    id v38 = v24;
    uint64_t v25 = (void *)objc_claimAutoreleasedReturnValue( +[MADPhotosOnDemandStaticStickerScoreTask taskWithPhotoLibrary:options:completionHandler:]( &OBJC_CLASS___MADPhotosOnDemandStaticStickerScoreTask,  "taskWithPhotoLibrary:options:completionHandler:",  v21,  v11,  v37));
    queuingTaskScheduler = self->_queuingTaskScheduler;
    v35[0] = _NSConcreteStackBlock;
    v35[1] = 3221225472LL;
    v35[2] = sub_100067220;
    v35[3] = &unk_1001B9A60;
    id v36 = v24;
    -[MADServiceClientTaskQueuingScheduler submitClientTask:withRequestID:schedulingErrorHandler:]( queuingTaskScheduler,  "submitClientTask:withRequestID:schedulingErrorHandler:",  v25,  a3,  v35);

    id v27 = v38;
  }

  else
  {
    uint64_t v28 = MediaAnalysisLogLevel(v22, v23);
    if ((int)v28 >= 3)
    {
      uint64_t v30 = VCPLogInstance(v28, v29);
      uint64_t v31 = (os_log_s *)objc_claimAutoreleasedReturnValue(v30);
      os_log_type_t v32 = VCPLogToOSLogType[3];
      if (os_log_type_enabled(v31, v32))
      {
        *(_DWORD *)buf = 138412290;
        id v43 = v10;
        _os_log_impl( (void *)&_mh_execute_header,  v31,  v32,  "[MAClientHandler] Invalid photo library URL (%@)",  buf,  0xCu);
      }
    }

    NSErrorUserInfoKey v40 = NSLocalizedDescriptionKey;
    id v27 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"[MAClientHandler] Invalid photo library URL (%@)",  v10));
    id v41 = v27;
    id v33 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v41,  &v40,  1LL));
    os_log_type_t v34 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  NSOSStatusErrorDomain,  -50LL,  v33));
    (*((void (**)(id, void *))v12 + 2))(v12, v34);
  }

  objc_autoreleasePoolPop(v19);
}

- (void).cxx_destruct
{
}

- (id).cxx_construct
{
  *((void *)self + 5) = 0LL;
  return self;
}

@end