@interface VCPMediaAnalysisDaemon
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (VCPMediaAnalysisDaemon)init;
- (int)run:(int)a3 argv:(const char *)a4;
- (void)registerClient:(id)a3 forPhotoLibraryURL:(id)a4 withReply:(id)a5;
- (void)registerPhotosTasks;
- (void)storeAnalysis:(id)a3 forAsset:(id)a4 fromPhotoLibraryURL:(id)a5 withReply:(id)a6;
@end

@implementation VCPMediaAnalysisDaemon

- (VCPMediaAnalysisDaemon)init
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___VCPMediaAnalysisDaemon;
  v2 = -[VCPMediaAnalysisDaemon init](&v6, "init");
  if (v2)
  {
    uint64_t v3 = objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
    analysisClients = v2->_analysisClients;
    v2->_analysisClients = (NSMutableArray *)v3;
  }

  return v2;
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  objc_super v6 = (NSXPCListener *)a3;
  v7 = (const void **)a4;
  v9 = v7;
  if (self->_publicServiceListener != v6)
  {
    if ((int)MediaAnalysisLogLevel(v7, v8) >= 7)
    {
      uint64_t v10 = VCPLogInstance();
      v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
      os_log_type_t v12 = VCPLogToOSLogType[7];
      if (os_log_type_enabled(v11, v12))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v11, v12, "Checking client entitlements...", buf, 2u);
      }
    }

    if (v9) {
      [v9 auditToken];
    }
    else {
      memset(&token, 0, sizeof(token));
    }
    SecTaskRef v13 = SecTaskCreateWithAuditToken(0LL, &token);
    SecTaskRef v46 = v13;
    if (!v13)
    {
      if ((int)MediaAnalysisLogLevel(0LL, v14) >= 4)
      {
        uint64_t v24 = VCPLogInstance();
        v25 = (os_log_s *)objc_claimAutoreleasedReturnValue(v24);
        os_log_type_t v26 = VCPLogToOSLogType[4];
        if (os_log_type_enabled(v25, v26))
        {
          *(_WORD *)buf = 0;
          _os_log_impl( (void *)&_mh_execute_header,  v25,  v26,  "Failed to query client entitlements; denying connection",
            buf,
            2u);
        }
      }

      goto LABEL_41;
    }

    CFErrorRef error = 0LL;
    CFTypeID TypeID = (CFTypeID)SecTaskCopyValueForEntitlement(v13, @"com.apple.mediaanalysisd.client", &error);
    CFTypeRef cf1 = (CFTypeRef)TypeID;
    if (error)
    {
      if ((int)MediaAnalysisLogLevel(TypeID, v16) >= 4)
      {
        uint64_t v17 = VCPLogInstance();
        v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(v17);
        os_log_type_t v19 = VCPLogToOSLogType[4];
        if (os_log_type_enabled(v18, v19))
        {
          *(_DWORD *)buf = 138412290;
          CFErrorRef v48 = error;
          v20 = "Failed to copy value for entitlement (%@)";
          v21 = v18;
          os_log_type_t v22 = v19;
          uint32_t v23 = 12;
LABEL_38:
          _os_log_impl((void *)&_mh_execute_header, v21, v22, v20, buf, v23);
          goto LABEL_39;
        }

        goto LABEL_39;
      }

      goto LABEL_40;
    }

    if (!TypeID
      || (v27 = CFGetTypeID((CFTypeRef)TypeID), CFTypeID TypeID = CFBooleanGetTypeID(), v27 != TypeID)
      || (CFTypeID TypeID = CFEqual(cf1, kCFBooleanTrue), !(_DWORD)TypeID))
    {
      if ((int)MediaAnalysisLogLevel(TypeID, v16) >= 4)
      {
        uint64_t v32 = VCPLogInstance();
        v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(v32);
        os_log_type_t v33 = VCPLogToOSLogType[4];
        if (os_log_type_enabled(v18, v33))
        {
          *(_WORD *)buf = 0;
          v20 = "Client not entitled; denying connection";
          v21 = v18;
          os_log_type_t v22 = v33;
          uint32_t v23 = 2;
          goto LABEL_38;
        }

- (void)storeAnalysis:(id)a3 forAsset:(id)a4 fromPhotoLibraryURL:(id)a5 withReply:(id)a6
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  os_log_type_t v12 = (void (**)(void))a6;
  if ((int)MediaAnalysisLogLevel(v12, v13) >= 6)
  {
    uint64_t v14 = VCPLogInstance();
    v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
    os_log_type_t v16 = VCPLogToOSLogType[6];
    if (os_log_type_enabled(v15, v16))
    {
      uint64_t v17 = MediaAnalysisTypeDescription(objc_msgSend(v9, "vcp_types"));
      v18 = (void *)objc_claimAutoreleasedReturnValue(v17);
      *(_DWORD *)buf = 138412546;
      id v46 = v10;
      __int16 v47 = 2112;
      CFErrorRef v48 = v18;
      _os_log_impl( (void *)&_mh_execute_header,  v15,  v16,  "  [%@] Received storage request with analysis types: (%@)",  buf,  0x16u);
    }
  }

  os_log_type_t v19 = (void *)objc_claimAutoreleasedReturnValue(+[VCPPhotoLibraryManager sharedManager](&OBJC_CLASS___VCPPhotoLibraryManager, "sharedManager"));
  v20 = (void *)objc_claimAutoreleasedReturnValue([v19 photoLibraryWithURL:v11]);

  if (!v20)
  {
    uint64_t v23 = MediaAnalysisLogLevel(v21, v22);
    if ((int)v23 >= 3)
    {
      uint64_t v32 = VCPLogInstance();
      os_log_type_t v33 = (os_log_s *)objc_claimAutoreleasedReturnValue(v32);
      os_log_type_t v34 = VCPLogToOSLogType[3];
      if (os_log_type_enabled(v33, v34))
      {
        v35 = (void *)objc_claimAutoreleasedReturnValue([v11 path]);
        *(_DWORD *)buf = 138412290;
        id v46 = v35;
        _os_log_impl( (void *)&_mh_execute_header,  v33,  v34,  " Failed to open Photos Library at %@; cannot store analysis",
          buf,
          0xCu);
      }
    }

    goto LABEL_23;
  }

  uint64_t v23 = objc_claimAutoreleasedReturnValue( +[VCPDatabaseManager sharedDatabaseForPhotoLibrary:]( &OBJC_CLASS___VCPDatabaseManager,  "sharedDatabaseForPhotoLibrary:",  v20));
  v25 = (void *)v23;
  if (!v23) {
    goto LABEL_23;
  }
  os_log_type_t v26 = (void *)objc_claimAutoreleasedReturnValue( +[PHAsset vcp_fetchOptionsForLibrary:forTaskID:]( &OBJC_CLASS___PHAsset,  "vcp_fetchOptionsForLibrary:forTaskID:",  v20,  1LL));
  id v44 = v10;
  CFTypeID v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v44, 1LL));
  uint64_t v28 = (void *)objc_claimAutoreleasedReturnValue( +[PHAsset fetchAssetsWithLocalIdentifiers:options:]( &OBJC_CLASS___PHAsset,  "fetchAssetsWithLocalIdentifiers:options:",  v27,  v26));

  if ([v28 count] == (id)1)
  {
    v29 = (void *)objc_claimAutoreleasedReturnValue([v28 objectAtIndexedSubscript:0]);
    unsigned int v30 = [v25 storeAnalysisForAsset:v29 analysis:v9];

    if (v30 == -108 || v30 == -36)
    {
      unsigned int v31 = v30;
    }

    else
    {
      unsigned int v31 = v30;
      if (v30 != -23) {
        unsigned int v31 = 0;
      }
    }

    if (v30 == -108 || v30 == -36 || v30 == -23)
    {
      int v36 = v31;
    }

    else
    {
      unsigned int v40 = [v25 commit];
      if (v40 == -108 || v40 == -36)
      {
        int v36 = v40;
      }

      else
      {
        int v36 = v40;
        if (v40 != -23) {
          int v36 = v31;
        }
      }

      if (v40 != -108
        && v40 != -36
        && v40 != -23
        && +[VCPVideoCNNAnalyzer isMUBackboneEnabled]( &OBJC_CLASS___VCPVideoCNNAnalyzer,  "isMUBackboneEnabled"))
      {
        os_log_type_t v42 = (void *)objc_claimAutoreleasedReturnValue([v28 objectAtIndexedSubscript:0]);
        uint64_t v41 = (void *)objc_claimAutoreleasedReturnValue([v42 localIdentifier]);
        v43 = (void *)objc_claimAutoreleasedReturnValue( +[VSKAsset mad_assetsWithLocalIdentifier:mediaAnalysisResults:]( &OBJC_CLASS___VSKAsset,  "mad_assetsWithLocalIdentifier:mediaAnalysisResults:",  v41,  v9));

        if ([v43 count]) {
          +[MADVectorDatabaseUtilities updateWithAssetsEmbeddings:photoLibrary:cancelBlock:error:]( &OBJC_CLASS___MADVectorDatabaseUtilities,  "updateWithAssetsEmbeddings:photoLibrary:cancelBlock:error:",  v43,  v20,  &stru_1001B98F8,  0LL);
        }
      }
    }
  }

  else
  {
    int v36 = -18;
  }

  if (v36)
  {
LABEL_23:
    if ((int)MediaAnalysisLogLevel(v23, v24) >= 6)
    {
      uint64_t v37 = VCPLogInstance();
      v38 = (os_log_s *)objc_claimAutoreleasedReturnValue(v37);
      os_log_type_t v39 = VCPLogToOSLogType[6];
      if (os_log_type_enabled(v38, v39))
      {
        *(_DWORD *)buf = 138412290;
        id v46 = v10;
        _os_log_impl((void *)&_mh_execute_header, v38, v39, "  [%@] Failed to store analysis", buf, 0xCu);
      }
    }
  }

  v12[2](v12);
}

- (void)registerClient:(id)a3 forPhotoLibraryURL:(id)a4 withReply:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = (void (**)(id, void *))a5;
  id v10 = (void *)objc_claimAutoreleasedReturnValue(+[VCPPhotoLibraryManager sharedManager](&OBJC_CLASS___VCPPhotoLibraryManager, "sharedManager"));
  id v11 = (void *)objc_claimAutoreleasedReturnValue([v10 photoLibraryWithURL:v8]);

  if (v11)
  {
    id v14 = objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "vcp_mediaAnalysisDirectory"));
    id v15 = [v14 UTF8String];
    uint64_t v16 = sandbox_extension_issue_file(APP_SANDBOX_READ_WRITE, v15, 0LL);
    v18 = (void *)v16;
    if (v16)
    {
      if ((int)MediaAnalysisLogLevel(v16, v17) >= 7)
      {
        uint64_t v19 = VCPLogInstance();
        v20 = (os_log_s *)objc_claimAutoreleasedReturnValue(v19);
        os_log_type_t v21 = VCPLogToOSLogType[7];
        if (os_log_type_enabled(v20, v21))
        {
          int v30 = 138412546;
          id v31 = v14;
          __int16 v32 = 2112;
          id v33 = v7;
          _os_log_impl( (void *)&_mh_execute_header,  v20,  v21,  "Issuing sandbox extension for %@ to %@",  (uint8_t *)&v30,  0x16u);
        }
      }

      uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", v18));
      v9[2](v9, v22);

      free(v18);
    }

    else
    {
      if ((int)MediaAnalysisLogLevel(0LL, v17) >= 4)
      {
        uint64_t v27 = VCPLogInstance();
        uint64_t v28 = (os_log_s *)objc_claimAutoreleasedReturnValue(v27);
        os_log_type_t v29 = VCPLogToOSLogType[4];
        if (os_log_type_enabled(v28, v29))
        {
          int v30 = 138412546;
          id v31 = v14;
          __int16 v32 = 2112;
          id v33 = v7;
          _os_log_impl( (void *)&_mh_execute_header,  v28,  v29,  "Failed to issue sandbox extension on %@ for %@",  (uint8_t *)&v30,  0x16u);
        }
      }

      v9[2](v9, 0LL);
    }
  }

  else
  {
    if ((int)MediaAnalysisLogLevel(v12, v13) >= 4)
    {
      uint64_t v23 = VCPLogInstance();
      uint64_t v24 = (os_log_s *)objc_claimAutoreleasedReturnValue(v23);
      os_log_type_t v25 = VCPLogToOSLogType[4];
      if (os_log_type_enabled(v24, v25))
      {
        os_log_type_t v26 = (void *)objc_claimAutoreleasedReturnValue([v8 path]);
        int v30 = 138412290;
        id v31 = v26;
        _os_log_impl( (void *)&_mh_execute_header,  v24,  v25,  "Failed to open Photos Library at %@; cannot issue sandbox extension",
          (uint8_t *)&v30,
          0xCu);
      }
    }

    v9[2](v9, 0LL);
  }
}

- (void)registerPhotosTasks
{
  id v2 = (id)objc_claimAutoreleasedReturnValue( +[MADPhotosSceneBackgroundSystemTask sharedTask]( &OBJC_CLASS___MADPhotosSceneBackgroundSystemTask,  "sharedTask"));
  [v2 registerTask];

  id v3 = (id)objc_claimAutoreleasedReturnValue( +[MADPhotosFullBackgroundSystemTask sharedTask]( &OBJC_CLASS___MADPhotosFullBackgroundSystemTask,  "sharedTask"));
  [v3 registerTask];

  id v4 = (id)objc_claimAutoreleasedReturnValue( +[MADPhotosFaceBackgroundSystemTask sharedTask]( &OBJC_CLASS___MADPhotosFaceBackgroundSystemTask,  "sharedTask"));
  [v4 registerTask];

  id v5 = (id)objc_claimAutoreleasedReturnValue( +[MADPhotosMaintenanceBackgroundSystemTask sharedTask]( &OBJC_CLASS___MADPhotosMaintenanceBackgroundSystemTask,  "sharedTask"));
  [v5 registerTask];

  id v6 = (id)objc_claimAutoreleasedReturnValue( +[MADProgressReporterBackgroundSystemTask sharedTask]( &OBJC_CLASS___MADProgressReporterBackgroundSystemTask,  "sharedTask"));
  [v6 registerTask];
}

- (int)run:(int)a3 argv:(const char *)a4
{
  id v5 = (void *)objc_claimAutoreleasedReturnValue( +[MADComputeServiceBackgroundSystemTask sharedTask]( &OBJC_CLASS___MADComputeServiceBackgroundSystemTask,  "sharedTask"));
  [v5 registerTask];

  id v6 = objc_alloc(&OBJC_CLASS___NSXPCListener);
  id v7 = -[NSXPCListener initWithMachServiceName:](v6, "initWithMachServiceName:", MediaAnalysisPhotosServiceName);
  storageListener = self->_storageListener;
  self->_storageListener = v7;

  -[NSXPCListener setDelegate:](self->_storageListener, "setDelegate:", self);
  -[NSXPCListener resume](self->_storageListener, "resume");
  id v9 = objc_alloc(&OBJC_CLASS___NSXPCListener);
  id v10 = -[NSXPCListener initWithMachServiceName:](v9, "initWithMachServiceName:", MediaAnalysisServiceName);
  analysisListener = self->_analysisListener;
  self->_analysisListener = v10;

  -[NSXPCListener setDelegate:](self->_analysisListener, "setDelegate:", self);
  -[NSXPCListener resume](self->_analysisListener, "resume");
  uint64_t v12 = objc_alloc(&OBJC_CLASS___NSXPCListener);
  uint64_t v13 = -[NSXPCListener initWithMachServiceName:](v12, "initWithMachServiceName:", HomeKitAnalysisServiceName);
  homeKitListener = self->_homeKitListener;
  self->_homeKitListener = v13;

  -[NSXPCListener setDelegate:](self->_homeKitListener, "setDelegate:", self);
  -[NSXPCListener resume](self->_homeKitListener, "resume");
  id v15 = objc_alloc(&OBJC_CLASS___NSXPCListener);
  uint64_t v16 = -[NSXPCListener initWithMachServiceName:](v15, "initWithMachServiceName:", HomeKitSessionAnalysisServiceName);
  homeKitSessionListener = self->_homeKitSessionListener;
  self->_homeKitSessionListener = v16;

  -[NSXPCListener setDelegate:](self->_homeKitSessionListener, "setDelegate:", self);
  -[NSXPCListener resume](self->_homeKitSessionListener, "resume");
  v18 = objc_alloc(&OBJC_CLASS___NSXPCListener);
  uint64_t v19 = -[NSXPCListener initWithMachServiceName:](v18, "initWithMachServiceName:", MediaAnalysisRealTimeServiceName);
  realTimeListener = self->_realTimeListener;
  self->_realTimeListener = v19;

  -[NSXPCListener setDelegate:](self->_realTimeListener, "setDelegate:", self);
  -[NSXPCListener resume](self->_realTimeListener, "resume");
  os_log_type_t v21 = -[NSXPCListener initWithMachServiceName:]( objc_alloc(&OBJC_CLASS___NSXPCListener),  "initWithMachServiceName:",  @"com.apple.mediaanalysisd.service.public");
  publicServiceListener = self->_publicServiceListener;
  self->_publicServiceListener = v21;

  -[NSXPCListener setDelegate:](self->_publicServiceListener, "setDelegate:", self);
  -[NSXPCListener resume](self->_publicServiceListener, "resume");
  uint64_t v23 = -[NSXPCListener initWithMachServiceName:]( objc_alloc(&OBJC_CLASS___NSXPCListener),  "initWithMachServiceName:",  @"com.apple.mediaanalysisd.computeservice");
  macsListener = self->_macsListener;
  self->_macsListener = v23;

  -[NSXPCListener setDelegate:](self->_macsListener, "setDelegate:", self);
  -[NSXPCListener resume](self->_macsListener, "resume");
  os_log_type_t v25 = objc_alloc(&OBJC_CLASS___NSXPCListener);
  os_log_type_t v26 = (void *)objc_claimAutoreleasedReturnValue(+[MADEmbeddingStoreService serviceName](&OBJC_CLASS___MADEmbeddingStoreService, "serviceName"));
  uint64_t v27 = -[NSXPCListener initWithMachServiceName:](v25, "initWithMachServiceName:", v26);
  embeddingStoreListener = self->_embeddingStoreListener;
  self->_embeddingStoreListener = v27;

  -[NSXPCListener setDelegate:](self->_embeddingStoreListener, "setDelegate:", self);
  -[NSXPCListener resume](self->_embeddingStoreListener, "resume");
  id v29 = +[VCPDeviceInformation isHomePod](&OBJC_CLASS___VCPDeviceInformation, "isHomePod");
  if ((v29 & 1) != 0)
  {
    if ((int)MediaAnalysisLogLevel(v29, v30) >= 5)
    {
      uint64_t v31 = VCPLogInstance();
      __int16 v32 = (os_log_s *)objc_claimAutoreleasedReturnValue(v31);
      os_log_type_t v33 = VCPLogToOSLogType[5];
      if (os_log_type_enabled(v32, v33))
      {
        *(_DWORD *)v38 = 138412290;
        *(void *)&v38[4] = objc_opt_class(self);
        id v34 = *(id *)&v38[4];
        _os_log_impl( (void *)&_mh_execute_header,  v32,  v33,  "[%@] HomePod system; bypassing registering core activities",
          v38,
          0xCu);
      }
    }
  }

  else
  {
    -[VCPMediaAnalysisDaemon registerPhotosTasks](self, "registerPhotosTasks");
  }

  v35 = (void *)objc_claimAutoreleasedReturnValue( +[MADHomeMaintenanceBackgroundSystemTask sharedTask]( &OBJC_CLASS___MADHomeMaintenanceBackgroundSystemTask,  "sharedTask",  *(_OWORD *)v38));
  [v35 registerTask];

  int v36 = (void *)objc_claimAutoreleasedReturnValue( +[MADSchedulerBackgroundSystemTask sharedTask]( &OBJC_CLASS___MADSchedulerBackgroundSystemTask,  "sharedTask"));
  [v36 registerTask];

  CFRunLoopRun();
  return 0;
}

- (void).cxx_destruct
{
}

@end