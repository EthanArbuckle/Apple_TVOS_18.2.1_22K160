@interface MADPhotosFullTaskProvider
+ (id)name;
+ (unint64_t)taskID;
- (BOOL)assetsDownloadAllowed;
- (BOOL)bypassDownload;
- (BOOL)checkCompatibilityForAsset:(id)a3;
- (MADPhotosFullTaskProvider)initWithPhotoLibrary:(id)a3 cancelBlock:(id)a4 progressReporter:(id)a5 mediaType:(int64_t)a6 mediaSubtype:(unint64_t)a7 imageOnlyAnalysis:(BOOL)a8;
- (id)assetPriorities;
- (id)assetTaskWithAnalysisDatabase:(id)a3;
- (id)logDescription;
- (id)mediaTypePredicatesString;
- (id)nextAssetProcessingTask;
- (id)nextClusterProcessingTask;
- (id)nextDownloadAssetProcessingTask;
- (unint64_t)batchAssetCount;
- (unint64_t)iterations;
- (unint64_t)photosMediaProcessingTaskID;
- (unint64_t)priority;
- (unint64_t)processingStatusTaskID;
- (void)increaseProcessedJobCountByOne;
- (void)retireTask:(id)a3;
@end

@implementation MADPhotosFullTaskProvider

+ (id)name
{
  return @"Full";
}

+ (unint64_t)taskID
{
  return 1LL;
}

- (unint64_t)priority
{
  if (self->_imageOnlyAnalysis) {
    uint64_t v3 = 10LL;
  }
  else {
    uint64_t v3 = 0LL;
  }
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MADPhotosTaskProvider photoLibrary](self, "photoLibrary"));
  unsigned int v5 = [v4 isSystemPhotoLibrary];

  if (v5) {
    return v3 + 2;
  }
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[MADPhotosTaskProvider photoLibrary](self, "photoLibrary"));
  unsigned int v8 = objc_msgSend(v7, "vcp_isSyndicationLibrary");

  return v3 | v8;
}

- (unint64_t)iterations
{
  if (self->_imageOnlyAnalysis) {
    return 30LL;
  }
  else {
    return 1LL;
  }
}

- (unint64_t)batchAssetCount
{
  if (self->_imageOnlyAnalysis) {
    return 100LL;
  }
  else {
    return 10LL;
  }
}

- (unint64_t)processingStatusTaskID
{
  if (self->_imageOnlyAnalysis) {
    return 255LL;
  }
  else {
    return 1LL;
  }
}

- (unint64_t)photosMediaProcessingTaskID
{
  if (self->_imageOnlyAnalysis) {
    return 17LL;
  }
  else {
    return 1LL;
  }
}

- (BOOL)checkCompatibilityForAsset:(id)a3
{
  id v4 = a3;
  unsigned int v5 = v4;
  if (self->_imageOnlyAnalysis
    || (v7 = self->_mediaType, id v8 = [v4 mediaType], (id)v7 == v8)
    && (id v8 = objc_msgSend(v5, "mad_isNonLivePhotoImage"), !(_DWORD)v8))
  {
    BOOL v6 = 1;
  }

  else
  {
    uint64_t v10 = MediaAnalysisLogLevel(v8, v9);
    if ((int)v10 >= 3)
    {
      uint64_t v12 = VCPLogInstance(v10, v11);
      v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
      os_log_type_t v14 = VCPLogToOSLogType[3];
      if (os_log_type_enabled(v13, v14))
      {
        logPrefix = self->_logPrefix;
        v16 = (void *)objc_claimAutoreleasedReturnValue([v5 localIdentifier]);
        id v17 = [v5 mediaType];
        id v18 = [v5 mediaSubtypes];
        int64_t mediaType = self->_mediaType;
        unint64_t mediaSubtype = self->_mediaSubtype;
        int v22 = 138413570;
        v23 = logPrefix;
        __int16 v24 = 2112;
        v25 = v16;
        __int16 v26 = 2048;
        id v27 = v17;
        __int16 v28 = 2048;
        id v29 = v18;
        __int16 v30 = 2048;
        int64_t v31 = mediaType;
        __int16 v32 = 2048;
        unint64_t v33 = mediaSubtype;
        _os_log_impl( (void *)&_mh_execute_header,  v13,  v14,  "[%@][%@] Incompatible asset(mediaType %ld, mediaSubtypes %ld) for taskProvider(mediaType %ld, mediaSubtypes %ld)",  (uint8_t *)&v22,  0x3Eu);
      }
    }

    BOOL v6 = 0;
  }

  return v6;
}

- (MADPhotosFullTaskProvider)initWithPhotoLibrary:(id)a3 cancelBlock:(id)a4 progressReporter:(id)a5 mediaType:(int64_t)a6 mediaSubtype:(unint64_t)a7 imageOnlyAnalysis:(BOOL)a8
{
  BOOL v8 = a8;
  id v14 = a3;
  id v15 = a4;
  id v29 = a5;
  v30.receiver = self;
  v30.super_class = (Class)&OBJC_CLASS___MADPhotosFullTaskProvider;
  v16 = -[MADPhotosTaskProvider initWithPhotoLibrary:cancelBlock:](&v30, "initWithPhotoLibrary:cancelBlock:", v14, v15);
  id v17 = v16;
  if (v16)
  {
    v16->_int64_t mediaType = a6;
    v16->_unint64_t mediaSubtype = a7;
    v16->_imageOnlyAnalysis = v8;
    objc_storeStrong((id *)&v16->_progressReporter, a5);
    id v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "vcp_description"));
    v19 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"[%@][%@]",  v18,  objc_opt_class(v17));
    uint64_t v20 = objc_claimAutoreleasedReturnValue(v19);
    logPrefix = v17->_logPrefix;
    v17->_logPrefix = (NSString *)v20;

    atomic_store(0, (unsigned __int8 *)&v17->_shouldPerformClustering);
    int64_t mediaType = v17->_mediaType;
    if (mediaType == 2)
    {
      __int16 v26 = &stru_1001BE5A8;
      if (v8) {
        __int16 v26 = @"|ImageOnly";
      }
      uint64_t v25 = objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"Full|Movie%@", v26));
      goto LABEL_13;
    }

    if (mediaType == 1)
    {
      v23 = @"Image";
      if (v17->_mediaSubtype == 8) {
        v23 = @"LivePhoto";
      }
      if (v17->_mediaSubtype == 8 && v8) {
        __int16 v24 = @"|ImageOnly";
      }
      else {
        __int16 v24 = &stru_1001BE5A8;
      }
      uint64_t v25 = objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"Full|%@%@", v23, v24));
LABEL_13:
      logDescription = v17->_logDescription;
      v17->_logDescription = (NSString *)v25;
    }
  }

  return v17;
}

- (id)mediaTypePredicatesString
{
  return +[VCPDatabaseWriter assetTypePredicatesStringWithMediaType:mediaSubtypes:imageOnlyAnalysis:]( &OBJC_CLASS___VCPDatabaseWriter,  "assetTypePredicatesStringWithMediaType:mediaSubtypes:imageOnlyAnalysis:",  self->_mediaType,  self->_mediaSubtype,  self->_imageOnlyAnalysis);
}

- (void)increaseProcessedJobCountByOne
{
  progressReporter = self->_progressReporter;
  if (progressReporter) {
    -[VCPProgressReporter increaseProcessedJobCountByOne](progressReporter, "increaseProcessedJobCountByOne");
  }
}

- (BOOL)bypassDownload
{
  return self->_imageOnlyAnalysis;
}

- (id)assetPriorities
{
  if (self->_imageOnlyAnalysis) {
    return &off_1001C9048;
  }
  int64_t mediaType = self->_mediaType;
  if (mediaType == 2) {
    return &off_1001C9078;
  }
  if (mediaType == 1 && self->_mediaSubtype == 8) {
    return &off_1001C9060;
  }
  if ((int)MediaAnalysisLogLevel(self, a2) >= 3)
  {
    uint64_t v5 = VCPLogInstance();
    BOOL v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
    os_log_type_t v7 = VCPLogToOSLogType[3];
    if (os_log_type_enabled(v6, v7))
    {
      logPrefix = self->_logPrefix;
      logDescription = self->_logDescription;
      int64_t v10 = self->_mediaType;
      unint64_t mediaSubtype = self->_mediaSubtype;
      BOOL imageOnlyAnalysis = self->_imageOnlyAnalysis;
      int v13 = 138413314;
      id v14 = logPrefix;
      __int16 v15 = 2112;
      v16 = logDescription;
      __int16 v17 = 2048;
      int64_t v18 = v10;
      __int16 v19 = 2048;
      unint64_t v20 = mediaSubtype;
      __int16 v21 = 1024;
      BOOL v22 = imageOnlyAnalysis;
      _os_log_impl( (void *)&_mh_execute_header,  v6,  v7,  "%@[%@] Invalid task provider, mediaType %lu, mediaSubtype %lu, imageOnly %d",  (uint8_t *)&v13,  0x30u);
    }
  }

  return 0LL;
}

- (BOOL)assetsDownloadAllowed
{
  if (self->_imageOnlyAnalysis)
  {
    uint64_t v3 = MediaAnalysisLogLevel(self, a2);
    if ((int)v3 >= 7)
    {
      uint64_t v5 = VCPLogInstance(v3, v4);
      BOOL v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
      os_log_type_t v7 = VCPLogToOSLogType[7];
      if (os_log_type_enabled(v6, v7))
      {
        logPrefix = self->_logPrefix;
        logDescription = self->_logDescription;
        int v24 = 138412546;
        uint64_t v25 = logPrefix;
        __int16 v26 = 2112;
        id v27 = logDescription;
        int64_t v10 = " %@[%@] Asset downloading is not allowed: image only analysis";
LABEL_12:
        _os_log_impl((void *)&_mh_execute_header, v6, v7, v10, (uint8_t *)&v24, 0x16u);
        goto LABEL_13;
      }

      goto LABEL_13;
    }
  }

  else
  {
    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(-[MADPhotosTaskProvider photoLibrary](self, "photoLibrary"));
    unsigned __int8 v12 = objc_msgSend(v11, "vcp_isCPLEnabled");

    uint64_t v15 = MediaAnalysisLogLevel(v13, v14);
    if ((v12 & 1) != 0)
    {
      if ((int)v15 >= 7)
      {
        uint64_t v17 = VCPLogInstance(v15, v16);
        BOOL v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v17);
        os_log_type_t v7 = VCPLogToOSLogType[7];
        if (os_log_type_enabled(v6, v7))
        {
          int64_t v18 = self->_logPrefix;
          __int16 v19 = self->_logDescription;
          int v24 = 138412546;
          uint64_t v25 = v18;
          __int16 v26 = 2112;
          id v27 = v19;
          int64_t v10 = " %@[%@] Asset downloading is not allowed: tvos";
          goto LABEL_12;
        }

- (id)assetTaskWithAnalysisDatabase:(id)a3
{
  id v4 = a3;
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[MADPhotosTaskProvider photoLibrary](self, "photoLibrary"));
  progressReporter = self->_progressReporter;
  int64_t mediaType = self->_mediaType;
  unint64_t mediaSubtype = self->_mediaSubtype;
  BOOL imageOnlyAnalysis = self->_imageOnlyAnalysis;
  LOBYTE(v12) = -[MADPhotosFullTaskProvider assetsDownloadAllowed](self, "assetsDownloadAllowed");
  int64_t v10 = (void *)objc_claimAutoreleasedReturnValue( +[MADPhotosFullAssetProcessingTask taskWithAnalysisDatabase:photoLibrary:progressReporter:mediaType:mediaSubtype:imageOnlyAnalysis:downloadAllowed:]( &OBJC_CLASS___MADPhotosFullAssetProcessingTask,  "taskWithAnalysisDatabase:photoLibrary:progressReporter:mediaType:mediaSubtype:imageOnlyAnalysis:downloadAllowed:",  v4,  v5,  progressReporter,  mediaType,  mediaSubtype,  imageOnlyAnalysis,  v12));

  return v10;
}

- (id)nextAssetProcessingTask
{
  uint64_t v3 = objc_alloc_init(&OBJC_CLASS___VCPTimeMeasurement);
  -[VCPTimeMeasurement start](v3, "start");
  v16.receiver = self;
  v16.super_class = (Class)&OBJC_CLASS___MADPhotosFullTaskProvider;
  id v4 = -[MADPhotosTaskProvider nextAssetProcessingTask](&v16, "nextAssetProcessingTask");
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  -[VCPTimeMeasurement stop](v3, "stop");
  BOOL v6 = VCPCoreAnalyticsFieldForFull(self->_imageOnlyAnalysis, self->_mediaType, self->_mediaSubtype, 0LL);
  os_log_type_t v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  if (v7)
  {
    BOOL v8 = (void *)objc_claimAutoreleasedReturnValue( +[VCPMADCoreAnalyticsManager sharedManager]( &OBJC_CLASS___VCPMADCoreAnalyticsManager,  "sharedManager"));
    -[VCPTimeMeasurement elapsedTimeSeconds](v3, "elapsedTimeSeconds");
    objc_msgSend( v8,  "accumulateDoubleValue:forField:andEvent:",  v7,  @"com.apple.mediaanalysisd.FullAnalysisRunSession");
  }

  if (v5)
  {
    uint64_t v9 = objc_opt_class(&OBJC_CLASS___MADPhotosAssetProcessingTask);
    uint64_t isKindOfClass = objc_opt_isKindOfClass(v5, v9);
    if ((isKindOfClass & 1) != 0)
    {
      self->_fetchedP1AssetCount += (unint64_t)[v5 p1AssetCount];
    }

    else
    {
      uint64_t v12 = VCPLogInstance(isKindOfClass, v11);
      uint64_t v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
      if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT)) {
        sub_10009176C((uint64_t)self, v13);
      }
    }

    id v14 = v5;
  }

  return v5;
}

- (id)nextDownloadAssetProcessingTask
{
  if (self->_imageOnlyAnalysis)
  {
    if ((int)MediaAnalysisLogLevel(self, a2) >= 6)
    {
      uint64_t v3 = VCPLogInstance();
      id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
      os_log_type_t v5 = VCPLogToOSLogType[6];
      if (os_log_type_enabled(v4, v5))
      {
        logPrefix = self->_logPrefix;
        logDescription = self->_logDescription;
        *(_DWORD *)buf = 138412546;
        uint64_t v12 = logPrefix;
        __int16 v13 = 2112;
        id v14 = logDescription;
        _os_log_impl((void *)&_mh_execute_header, v4, v5, "%@[%@] Image only analysis; skip download task", buf, 0x16u);
      }
    }

    return 0LL;
  }

  else
  {
    v10.receiver = self;
    v10.super_class = (Class)&OBJC_CLASS___MADPhotosFullTaskProvider;
    id v9 = -[MADPhotosTaskProvider nextDownloadAssetProcessingTask](&v10, "nextDownloadAssetProcessingTask");
    return (id)objc_claimAutoreleasedReturnValue(v9);
  }

- (id)nextClusterProcessingTask
{
  unsigned __int8 v2 = atomic_load((unsigned __int8 *)&self->_shouldPerformClustering);
  if ((v2 & 1) == 0) {
    return 0LL;
  }
  atomic_store(0, (unsigned __int8 *)&self->_shouldPerformClustering);
  os_log_type_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[MADPhotosTaskProvider photoLibrary](self, "photoLibrary"));
  BOOL v6 = (void *)objc_claimAutoreleasedReturnValue( +[MADPhotosFullClusterProcessingTask taskWithPhotoLibrary:]( &OBJC_CLASS___MADPhotosFullClusterProcessingTask,  "taskWithPhotoLibrary:",  v5));

  unsigned __int8 v9 = atomic_load((unsigned __int8 *)&self->_isFullImageP1Processed);
  if ((v9 & 1) != 0)
  {
    objc_super v10 = (void *)objc_claimAutoreleasedReturnValue(-[MADPhotosTaskProvider photoLibrary](self, "photoLibrary"));
    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue( +[VCPDatabaseManager sharedDatabaseForPhotoLibrary:]( &OBJC_CLASS___VCPDatabaseManager,  "sharedDatabaseForPhotoLibrary:",  v10));

    if (![v11 valueForKey:VCPKeyValueMediaAnalysisImagePriority1LastFullModeClusterTimestamp]) {
      [v6 setRequiresProgressQuery:1];
    }
  }

  uint64_t v12 = MediaAnalysisLogLevel(v7, v8);
  if ((int)v12 >= 6)
  {
    uint64_t v14 = VCPLogInstance(v12, v13);
    uint64_t v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
    os_log_type_t v16 = VCPLogToOSLogType[6];
    if (os_log_type_enabled(v15, v16))
    {
      logPrefix = self->_logPrefix;
      logDescription = self->_logDescription;
      unsigned int v19 = [v6 requiresProgressQuery];
      uint64_t v20 = @"without";
      int v21 = 138412802;
      BOOL v22 = logPrefix;
      __int16 v23 = 2112;
      if (v19) {
        uint64_t v20 = @"with";
      }
      int v24 = logDescription;
      __int16 v25 = 2112;
      __int16 v26 = v20;
      _os_log_impl( (void *)&_mh_execute_header,  v15,  v16,  "%@[%@] Requesting cluster processing %@ progress query from Photos database",  (uint8_t *)&v21,  0x20u);
    }
  }

  return v6;
}

- (void)retireTask:(id)a3
{
  id v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)&OBJC_CLASS___MADPhotosFullTaskProvider;
  -[MADPhotosTaskProvider retireTask:](&v19, "retireTask:", v4);
  uint64_t v5 = objc_opt_class(&OBJC_CLASS___MADPhotosAssetProcessingTask);
  if ((objc_opt_isKindOfClass(v4, v5) & 1) != 0)
  {
    id v6 = [v4 p1AssetCount];
    if (v6)
    {
      unint64_t v7 = (unint64_t)v6 + self->_retiredP1AssetCount;
      self->_retiredP1AssetCount = v7;
      if (self->_imageOnlyAnalysis && v7 == self->_fetchedP1AssetCount)
      {
        unint64_t v8 = -[MADPhotosTaskProvider currentAssetPriority](self, "currentAssetPriority");
        if (v8 != 1)
        {
          uint64_t v10 = MediaAnalysisLogLevel(v8, v9);
          if ((int)v10 >= 6)
          {
            uint64_t v12 = VCPLogInstance(v10, v11);
            uint64_t v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
            os_log_type_t v14 = VCPLogToOSLogType[6];
            if (os_log_type_enabled(v13, v14))
            {
              logPrefix = self->_logPrefix;
              logDescription = self->_logDescription;
              *(_DWORD *)buf = 138412546;
              int v21 = logPrefix;
              __int16 v22 = 2112;
              __int16 v23 = logDescription;
              _os_log_impl( (void *)&_mh_execute_header,  v13,  v14,  "%@[%@] All image-only P1 assets processed",  buf,  0x16u);
            }
          }

          atomic_store(1u, (unsigned __int8 *)&self->_isFullImageP1Processed);
        }
      }
    }
  }

  uint64_t v17 = objc_opt_class(&OBJC_CLASS___MADAssetProcessingTask);
  if ((objc_opt_isKindOfClass(v4, v17) & 1) != 0
    || (uint64_t v18 = objc_opt_class(&OBJC_CLASS___MADDownloadAssetProcessingTask), (objc_opt_isKindOfClass(v4, v18) & 1) != 0))
  {
    atomic_store(1u, (unsigned __int8 *)&self->_shouldPerformClustering);
  }
}

- (id)logDescription
{
  return self->_logDescription;
}

- (void).cxx_destruct
{
}

@end