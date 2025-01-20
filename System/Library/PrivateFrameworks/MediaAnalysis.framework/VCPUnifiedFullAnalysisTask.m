@interface VCPUnifiedFullAnalysisTask
+ (id)taskWithPhotoLibrary:(id)a3 options:(id)a4;
- (VCPUnifiedFullAnalysisTask)initWithPhotoLibrary:(id)a3 options:(id)a4;
- (int)mainInternal;
- (int)performProcessingForProviderType:(int64_t)a3 progressReporter:(id)a4;
- (unint64_t)assetCountForMediaAnalysisTaskWithMediaType:(int64_t)a3 mediaSubtypes:(unint64_t)a4;
@end

@implementation VCPUnifiedFullAnalysisTask

- (VCPUnifiedFullAnalysisTask)initWithPhotoLibrary:(id)a3 options:(id)a4
{
  id v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)&OBJC_CLASS___VCPUnifiedFullAnalysisTask;
  v8 = -[VCPTask initWithPhotoLibrary:](&v11, "initWithPhotoLibrary:", a3);
  v9 = v8;
  if (v8) {
    objc_storeStrong(&v8->super._progressHandler, a4);
  }

  return v9;
}

+ (id)taskWithPhotoLibrary:(id)a3 options:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [objc_alloc((Class)objc_opt_class(a1)) initWithPhotoLibrary:v6 options:v7];

  return v8;
}

- (int)performProcessingForProviderType:(int64_t)a3 progressReporter:(id)a4
{
  id v6 = a4;
  id v7 = objc_autoreleasePoolPush();
  id v8 = objc_alloc(&OBJC_CLASS___MADTaskCoordinator);
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[VCPTask photoLibrary](self, "photoLibrary"));
  v41 = v9;
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v41, 1LL));
  objc_super v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", a3));
  v40 = v11;
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v40, 1LL));
  id progressHandler = self->super._progressHandler;
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[VCPTask cancel](self, "cancel"));
  v15 = -[MADTaskCoordinator initWithPhotoLibraries:taskProviderTypes:options:cancelBlock:progressReporter:]( v8,  "initWithPhotoLibraries:taskProviderTypes:options:cancelBlock:progressReporter:",  v10,  v12,  progressHandler,  v14,  v6);

  if (!v15)
  {
    uint64_t v27 = MediaAnalysisLogLevel(v16, v17);
    if ((int)v27 < 3)
    {
      int v20 = -18;
      goto LABEL_18;
    }

    uint64_t v29 = VCPLogInstance(v27, v28);
    v24 = (os_log_s *)objc_claimAutoreleasedReturnValue(v29);
    os_log_type_t v30 = VCPLogToOSLogType[3];
    if (os_log_type_enabled(v24, v30))
    {
      int v38 = 138412290;
      id v39 = (id)objc_opt_class(self);
      id v31 = v39;
      _os_log_impl( (void *)&_mh_execute_header,  v24,  v30,  "[%@] Failed to create task coordinator",  (uint8_t *)&v38,  0xCu);
    }

    int v20 = -18;
    goto LABEL_15;
  }

  id v18 = (id)-[MADTaskCoordinator run](v15, "run");
  int v20 = (int)v18;
  if ((_DWORD)v18)
  {
    if ((_DWORD)v18 == -128)
    {
      uint64_t v21 = MediaAnalysisLogLevel(v18, v19);
      if ((int)v21 < 3)
      {
        int v20 = -128;
        goto LABEL_18;
      }

      uint64_t v23 = VCPLogInstance(v21, v22);
      v24 = (os_log_s *)objc_claimAutoreleasedReturnValue(v23);
      os_log_type_t v25 = VCPLogToOSLogType[3];
      if (os_log_type_enabled(v24, v25))
      {
        int v38 = 138412290;
        id v39 = (id)objc_opt_class(self);
        id v26 = v39;
        _os_log_impl((void *)&_mh_execute_header, v24, v25, "[%@] Processing canceled", (uint8_t *)&v38, 0xCu);
      }

      int v20 = -128;
      goto LABEL_15;
    }

    uint64_t v32 = MediaAnalysisLogLevel(v18, v19);
    if ((int)v32 >= 3)
    {
      uint64_t v34 = VCPLogInstance(v32, v33);
      v24 = (os_log_s *)objc_claimAutoreleasedReturnValue(v34);
      os_log_type_t v35 = VCPLogToOSLogType[3];
      if (os_log_type_enabled(v24, v35))
      {
        int v38 = 138412290;
        id v39 = (id)objc_opt_class(self);
        id v36 = v39;
        _os_log_impl((void *)&_mh_execute_header, v24, v35, "[%@] Processing failed", (uint8_t *)&v38, 0xCu);
      }

- (unint64_t)assetCountForMediaAnalysisTaskWithMediaType:(int64_t)a3 mediaSubtypes:(unint64_t)a4
{
  if (a3 == 2)
  {
    uint64_t v8 = 1LL;
    v9 = @"kind == %d";
    goto LABEL_12;
  }

  if (a3 == 1)
  {
    if ((a4 & 8) == 0)
    {
      uint64_t v7 = objc_claimAutoreleasedReturnValue( +[NSPredicate predicateWithFormat:]( &OBJC_CLASS___NSPredicate,  "predicateWithFormat:",  @"kind == %d && kindSubtype != %d",  0LL,  2LL));
LABEL_13:
      uint64_t v16 = (void *)v7;
      id v18 = (void *)objc_claimAutoreleasedReturnValue(-[VCPTask photoLibrary](self, "photoLibrary"));
      unint64_t v17 = (unint64_t)objc_msgSend(v18, "vcp_assetCountWithInternalPredicate:forTaskID:", v16, 1);

      id progressHandler = self->super._progressHandler;
      if (!progressHandler
        || (int v20 = (void *)objc_claimAutoreleasedReturnValue([progressHandler objectForKeyedSubscript:VCPTurboProcessing_ImageOnlyKey]),
            unsigned __int8 v21 = [v20 BOOLValue],
            v20,
            (v21 & 1) == 0))
      {
        unint64_t v22 = (a4 >> 3) & 1;
        if (a3 != 1) {
          LOBYTE(v22) = 1;
        }
        v17 <<= v22;
      }

      goto LABEL_18;
    }

    uint64_t v8 = 2LL;
    v9 = @"kindSubtype == %d";
LABEL_12:
    uint64_t v7 = objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](&OBJC_CLASS___NSPredicate, "predicateWithFormat:", v9, v8));
    goto LABEL_13;
  }

  uint64_t v10 = MediaAnalysisLogLevel(self, a2);
  if ((int)v10 >= 3)
  {
    uint64_t v12 = VCPLogInstance(v10, v11);
    v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
    os_log_type_t v14 = VCPLogToOSLogType[3];
    if (os_log_type_enabled(v13, v14))
    {
      *(_DWORD *)buf = 138412546;
      id v25 = (id)objc_opt_class(self);
      __int16 v26 = 2048;
      int64_t v27 = a3;
      id v15 = v25;
      _os_log_impl((void *)&_mh_execute_header, v13, v14, "[%@] Unsupported mediaType %lu.", buf, 0x16u);
    }
  }

  uint64_t v16 = 0LL;
  unint64_t v17 = 0LL;
LABEL_18:

  return v17;
}

- (int)mainInternal
{
  uint64_t v3 = MediaAnalysisLogLevel(self, a2);
  if ((int)v3 >= 6)
  {
    uint64_t v5 = VCPLogInstance(v3, v4);
    id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
    os_log_type_t v7 = VCPLogToOSLogType[6];
    if (os_log_type_enabled(v6, v7))
    {
      *(_DWORD *)uint64_t v29 = 138412290;
      *(void *)&v29[4] = objc_opt_class(self);
      id v8 = *(id *)&v29[4];
      _os_log_impl((void *)&_mh_execute_header, v6, v7, "[%@] Processing assets...", v29, 0xCu);
    }
  }

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[VCPTask progressHandler](self, "progressHandler", *(_OWORD *)v29));
  BOOL v10 = v9 == 0LL;

  if (v10)
  {
    id v15 = 0LL;
  }

  else
  {
    unint64_t v11 = -[VCPUnifiedFullAnalysisTask assetCountForMediaAnalysisTaskWithMediaType:mediaSubtypes:]( self,  "assetCountForMediaAnalysisTaskWithMediaType:mediaSubtypes:",  1LL,  0LL);
    unint64_t v12 = -[VCPUnifiedFullAnalysisTask assetCountForMediaAnalysisTaskWithMediaType:mediaSubtypes:]( self,  "assetCountForMediaAnalysisTaskWithMediaType:mediaSubtypes:",  1LL,  8LL);
    unint64_t v13 = -[VCPUnifiedFullAnalysisTask assetCountForMediaAnalysisTaskWithMediaType:mediaSubtypes:]( self,  "assetCountForMediaAnalysisTaskWithMediaType:mediaSubtypes:",  2LL,  0LL);
    os_log_type_t v14 = (void *)objc_claimAutoreleasedReturnValue(-[VCPTask progressHandler](self, "progressHandler"));
    id v15 = (void *)objc_claimAutoreleasedReturnValue( +[VCPProgressReporter reporterWithIntervalSeconds:andTotalJobCount:andBlock:]( &OBJC_CLASS___VCPProgressReporter,  "reporterWithIntervalSeconds:andTotalJobCount:andBlock:",  10LL,  v12 + v11 + v13,  v14));
  }

  int v16 = -[VCPUnifiedFullAnalysisTask performProcessingForProviderType:progressReporter:]( self,  "performProcessingForProviderType:progressReporter:",  4LL,  v15);
  if (!v16)
  {
    unint64_t v17 = (void *)objc_claimAutoreleasedReturnValue( [self->super._progressHandler objectForKeyedSubscript:VCPTurboProcessing_ImageOnlyKey]);
    unsigned __int8 v18 = [v17 BOOLValue];

    if ((v18 & 1) != 0
      || (v19 = -[VCPUnifiedFullAnalysisTask performProcessingForProviderType:progressReporter:]( self,  "performProcessingForProviderType:progressReporter:",  5LL,  v15),  (int v16 = v19) == 0))
    {
      uint64_t v21 = MediaAnalysisLogLevel(v19, v20);
      if ((int)v21 >= 6)
      {
        uint64_t v23 = VCPLogInstance(v21, v22);
        v24 = (os_log_s *)objc_claimAutoreleasedReturnValue(v23);
        os_log_type_t v25 = VCPLogToOSLogType[6];
        if (os_log_type_enabled(v24, v25))
        {
          __int16 v26 = (void *)objc_opt_class(self);
          *(_DWORD *)uint64_t v29 = 138412290;
          *(void *)&v29[4] = v26;
          id v27 = v26;
          _os_log_impl((void *)&_mh_execute_header, v24, v25, "[%@] Processing assets done.", v29, 0xCu);
        }
      }

      int v16 = 0;
    }
  }

  return v16;
}

- (void).cxx_destruct
{
}

@end