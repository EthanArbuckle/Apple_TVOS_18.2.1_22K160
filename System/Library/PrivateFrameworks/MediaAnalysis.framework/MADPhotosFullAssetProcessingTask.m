@interface MADPhotosFullAssetProcessingTask
+ (BOOL)canDoFullAnalysis:(id)a3 withResources:(id)a4;
+ (id)taskWithAnalysisDatabase:(id)a3 photoLibrary:(id)a4 progressReporter:(id)a5 mediaType:(int64_t)a6 mediaSubtype:(unint64_t)a7 imageOnlyAnalysis:(BOOL)a8 downloadAllowed:(BOOL)a9;
- (BOOL)doneFullAnalysis:(id)a3;
- (BOOL)hasAdequateAssets:(unint64_t)a3;
- (BOOL)needDownloadForAsset:(id)a3 withResources:(id)a4;
- (MADPhotosFullAssetProcessingTask)initWithAnalysisDatabase:(id)a3 photoLibrary:(id)a4 progressReporter:(id)a5 mediaType:(int64_t)a6 mediaSubtype:(unint64_t)a7 imageOnlyAnalysis:(BOOL)a8 downloadAllowed:(BOOL)a9;
- (id)assetLocalIdentifiers;
- (id)downloadResourceForAsset:(id)a3 fromResources:(id)a4;
- (int)_prepare;
- (int)_process;
- (int)_publish;
- (int)status;
- (unint64_t)_processAssetsConcurrently:(int64_t)a3;
- (unint64_t)_processAssetsSerially;
- (unint64_t)concurrentAssetCount;
- (unint64_t)count;
- (unint64_t)missingAnalysisForAsset:(id)a3 existingAnalysis:(id *)a4 resources:(id)a5 forLocalResourcesOnly:(BOOL)a6;
- (unint64_t)missingAnalysisForAsset:(id)a3 withExistingComputeSyncAnalysis:(id *)a4 resources:(id)a5 forLocalResourcesOnly:(BOOL)a6;
- (unint64_t)possibleAnalysisForAsset:(id)a3 withResources:(id)a4 forLocalResourcesOnly:(BOOL)a5;
- (void)_reportCoreAnalyticsForSession;
- (void)_reportCoreAnalyticsWithEntry:(id)a3 analyticManager:(id)a4;
- (void)addPhotosAsset:(id)a3 priority:(unint64_t)a4 previousStatus:(unint64_t)a5 attempts:(unint64_t)a6 lastAttemptDate:(id)a7;
- (void)dealloc;
- (void)download;
- (void)increaseProcessedJobCountByOne;
- (void)prepare;
- (void)process;
- (void)processAssetEntry:(id)a3;
- (void)publish;
@end

@implementation MADPhotosFullAssetProcessingTask

+ (id)taskWithAnalysisDatabase:(id)a3 photoLibrary:(id)a4 progressReporter:(id)a5 mediaType:(int64_t)a6 mediaSubtype:(unint64_t)a7 imageOnlyAnalysis:(BOOL)a8 downloadAllowed:(BOOL)a9
{
  BOOL v9 = a8;
  id v15 = a3;
  id v16 = a4;
  id v17 = a5;
  LOBYTE(v20) = a9;
  id v18 = [objc_alloc((Class)a1) initWithAnalysisDatabase:v15 photoLibrary:v16 progressReporter:v17 mediaType:a6 mediaSubtype:a7 imageOnlyAnalysis:v9 downloadAllowed:v20];

  return v18;
}

- (MADPhotosFullAssetProcessingTask)initWithAnalysisDatabase:(id)a3 photoLibrary:(id)a4 progressReporter:(id)a5 mediaType:(int64_t)a6 mediaSubtype:(unint64_t)a7 imageOnlyAnalysis:(BOOL)a8 downloadAllowed:(BOOL)a9
{
  BOOL v9 = a8;
  id v38 = a3;
  id v16 = a4;
  id v17 = a5;
  v39.receiver = self;
  v39.super_class = (Class)&OBJC_CLASS___MADPhotosFullAssetProcessingTask;
  id v18 = -[MADProcessingTask init](&v39, "init");
  if (!v18)
  {
LABEL_17:
    v31 = v18;
    goto LABEL_18;
  }

  uint64_t v19 = objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  assetEntries = v18->_assetEntries;
  v18->_assetEntries = (NSMutableArray *)v19;

  v18->_status = 0;
  objc_storeStrong((id *)&v18->_analysisDatabase, a3);
  objc_storeStrong((id *)&v18->_photoLibrary, a4);
  objc_storeStrong((id *)&v18->_progressReporter, a5);
  v18->_int64_t mediaType = a6;
  v18->_mediaSubtype = a7;
  v18->_downloadAllowed = a9;
  v18->_accumulatedVideoDurations = 0.0;
  v18->_imageOnlyAnalysis = v9;
  if (v9)
  {
    logPrefix = v18->_logPrefix;
    v24 = @"Full|ImageOnly";
LABEL_14:
    v18->_logPrefix = &v24->isa;

    uint64_t v32 = 255LL;
    if (!v18->_imageOnlyAnalysis) {
      uint64_t v32 = 1LL;
    }
    v18->_processingStatusTaskID = v32;
    dispatch_group_t v33 = dispatch_group_create();
    computeGroup = v18->_computeGroup;
    v18->_computeGroup = (OS_dispatch_group *)v33;

    dispatch_queue_t v35 = dispatch_queue_create("com.apple.mediaanalysisd.mediatype.compute", 0LL);
    computeQueue = v18->_computeQueue;
    v18->_computeQueue = (OS_dispatch_queue *)v35;

    goto LABEL_17;
  }

  if (a6 == 2)
  {
    logPrefix = v18->_logPrefix;
    v24 = @"Full|Movie";
    goto LABEL_14;
  }

  if (a6 == 1 && a7 == 8)
  {
    logPrefix = v18->_logPrefix;
    v24 = @"Full|LivePhoto";
    goto LABEL_14;
  }

  uint64_t v25 = MediaAnalysisLogLevel(v21, v22);
  if ((int)v25 >= 3)
  {
    uint64_t v27 = VCPLogInstance(v25, v26);
    v28 = (os_log_s *)objc_claimAutoreleasedReturnValue(v27);
    os_log_type_t v29 = VCPLogToOSLogType[3];
    if (os_log_type_enabled(v28, v29))
    {
      int64_t mediaType = v18->_mediaType;
      *(_DWORD *)buf = 134217984;
      int64_t v41 = mediaType;
      _os_log_impl( (void *)&_mh_execute_header,  v28,  v29,  "[MADPhotosFullAssetProcessingTask] Unsupported media type: %lu",  buf,  0xCu);
    }
  }

  v31 = 0LL;
LABEL_18:

  return v31;
}

- (void)dealloc
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[VNSession globalSession](&OBJC_CLASS___VNSession, "globalSession"));
  [v3 releaseCachedResources];

  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___MADPhotosFullAssetProcessingTask;
  -[MADPhotosFullAssetProcessingTask dealloc](&v4, "dealloc");
}

- (BOOL)hasAdequateAssets:(unint64_t)a3
{
  if (self->_imageOnlyAnalysis || self->_mediaType != 2)
  {
    v6.receiver = self;
    v3 = &v6;
  }

  else
  {
    if (self->_accumulatedVideoDurations >= 30.0) {
      return 1;
    }
    v5 = self;
    v3 = (objc_super *)&v5;
  }

  v3->super_class = (Class)&OBJC_CLASS___MADPhotosFullAssetProcessingTask;
  return -[objc_super hasAdequateAssets:](v3, "hasAdequateAssets:", a3, v5);
}

- (unint64_t)possibleAnalysisForAsset:(id)a3 withResources:(id)a4 forLocalResourcesOnly:(BOOL)a5
{
  id v8 = a3;
  id v9 = a4;
  unint64_t v10 = (unint64_t)objc_msgSend(v8, "vcp_fullAnalysisTypesForResources:", v9);
  if (self->_imageOnlyAnalysis
    && ((objc_msgSend(v8, "vcp_isLivePhoto") & 1) != 0 || objc_msgSend(v8, "isVideo")))
  {
    v10 &= 0x3000000000000uLL;
  }

  if (!a5
    && (![v8 isPhoto]
     || objc_msgSend(v9, "vcp_hasLocalPhoto:", objc_msgSend(v8, "hasAdjustments"))))
  {
    v10 |= (unint64_t)objc_msgSend(v8, "vcp_fullAnalysisTypes") & 0xFFFFFFFFFFEFFFFFLL;
  }

  return v10;
}

- (void)increaseProcessedJobCountByOne
{
  progressReporter = self->_progressReporter;
  if (progressReporter) {
    -[VCPProgressReporter increaseProcessedJobCountByOne](progressReporter, "increaseProcessedJobCountByOne");
  }
}

- (unint64_t)missingAnalysisForAsset:(id)a3 withExistingComputeSyncAnalysis:(id *)a4 resources:(id)a5 forLocalResourcesOnly:(BOOL)a6
{
  BOOL v6 = a6;
  id v10 = a3;
  id v96 = a5;
  context = objc_autoreleasePoolPush();
  v11 = (void *)objc_claimAutoreleasedReturnValue([v10 localIdentifier]);
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"[%@][FMACC]", v11));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "vcp_modificationDate"));

  if (!v13)
  {
    uint64_t v64 = MediaAnalysisLogLevel(v14, v15);
    if ((int)v64 < 5)
    {
LABEL_43:
      unint64_t v20 = 0LL;
      goto LABEL_54;
    }

    uint64_t v66 = VCPLogInstance(v64, v65);
    v67 = (os_log_s *)objc_claimAutoreleasedReturnValue(v66);
    os_log_type_t v68 = VCPLogToOSLogType[5];
    if (os_log_type_enabled(v67, v68))
    {
      *(_DWORD *)buf = 138412290;
      v98 = v12;
      _os_log_impl( (void *)&_mh_execute_header,  v67,  v68,  "%@ Asset missing modification date; skipping all analysis",
        buf,
        0xCu);
    }

- (unint64_t)missingAnalysisForAsset:(id)a3 existingAnalysis:(id *)a4 resources:(id)a5 forLocalResourcesOnly:(BOOL)a6
{
  BOOL v6 = a6;
  id v10 = a3;
  id v111 = a5;
  v11 = objc_autoreleasePoolPush();
  uint64_t v12 = objc_claimAutoreleasedReturnValue([v10 localIdentifier]);
  v112 = (void *)v12;
  v110 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"[%@][FMA]", v12));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "vcp_modificationDate"));

  context = v11;
  if (v13)
  {
    unint64_t v16 = -[MADPhotosFullAssetProcessingTask possibleAnalysisForAsset:withResources:forLocalResourcesOnly:]( self,  "possibleAnalysisForAsset:withResources:forLocalResourcesOnly:",  v10,  v111,  v6);
    unint64_t v18 = v16;
    unint64_t v109 = v16 & 0xFFFFFFFFDFFFFFFFLL;
    if ((v16 & 0xFFFFFFFFDFFFFFFFLL) != 0)
    {
      uint64_t v19 = MediaAnalysisLogLevel(v16, v17);
      uint64_t v21 = VCPLogInstance(v19, v20);
      uint64_t v22 = (os_log_s *)objc_claimAutoreleasedReturnValue(v21);
      os_log_type_t v23 = VCPLogToOSLogType[7];
      if (os_log_type_enabled(v22, v23))
      {
        uint64_t v24 = MediaAnalysisTypeShortDescription(v109);
        uint64_t v25 = (__CFString *)objc_claimAutoreleasedReturnValue(v24);
        *(_DWORD *)buf = 138412546;
        v115 = v110;
        __int16 v116 = 2112;
        v117 = v25;
        _os_log_impl((void *)&_mh_execute_header, v22, v23, "%@ Possible analysis: %@", buf, 0x16u);
      }
    }

    else
    {
      uint64_t v31 = MediaAnalysisLogLevel(v16, v17);
      uint64_t v33 = VCPLogInstance(v31, v32);
      uint64_t v22 = (os_log_s *)objc_claimAutoreleasedReturnValue(v33);
      os_log_type_t v34 = VCPLogToOSLogType[4];
      if (os_log_type_enabled(v22, v34))
      {
        dispatch_queue_t v35 = &stru_1001BE5A8;
        if (v6) {
          dispatch_queue_t v35 = @"(local only)";
        }
        *(_DWORD *)buf = 138412546;
        v115 = v110;
        __int16 v116 = 2112;
        v117 = v35;
        _os_log_impl((void *)&_mh_execute_header, v22, v34, "%@ No resource to analyze %@", buf, 0x16u);
      }
    }

    uint64_t v12 = (uint64_t)v112;
LABEL_16:
    analysisDatabase = self->_analysisDatabase;
    id v113 = 0LL;
    -[VCPDatabaseWriter analysisForAsset:analysis:](analysisDatabase, "analysisForAsset:analysis:", v12, &v113);
    id v37 = v113;
    v107 = (os_log_s *)v113;
    objc_storeStrong(a4, v37);
    if ((v18 & 0x40000) != 0)
    {
      id v40 = StripMovieCurationResultsForEligibleAsset(v10, *a4, v110);
      uint64_t v41 = (void *)objc_claimAutoreleasedReturnValue(v40);
      id v42 = *a4;
      *a4 = v41;
    }

    uint64_t v43 = v112;
    if (!*a4) {
      goto LABEL_53;
    }
    uint64_t v44 = MediaAnalysisLogLevel(v38, v39);
    if ((int)v44 >= 7)
    {
      uint64_t v46 = VCPLogInstance(v44, v45);
      int v47 = (os_log_s *)objc_claimAutoreleasedReturnValue(v46);
      os_log_type_t v48 = VCPLogToOSLogType[7];
      if (os_log_type_enabled(v47, v48))
      {
        uint64_t v49 = MediaAnalysisTypeShortDescription(objc_msgSend(*a4, "vcp_types"));
        unint64_t v50 = (__CFString *)objc_claimAutoreleasedReturnValue(v49);
        *(_DWORD *)buf = 138412546;
        v115 = v110;
        __int16 v116 = 2112;
        v117 = v50;
        _os_log_impl((void *)&_mh_execute_header, v47, v48, "%@ Existing analysis: %@", buf, 0x16u);
      }

      uint64_t v43 = v112;
    }

    unsigned int v51 = objc_msgSend(*a4, "vcp_degraded");
    id v52 = [v10 mediaType];
    v53 = (id *)&OBJC_CLASS___VCPPhotoAnalyzer_ptr;
    if (v52 != (id)1) {
      v53 = (id *)&OBJC_CLASS___VCPMovieAnalyzer_ptr;
    }
    unsigned int v54 = [*v53 canAnalyzeUndegraded:v10 withResources:v111];
    id v55 = objc_msgSend(v10, "vcp_isAnalysisValid:", *a4);
    if ((v55 & 1) != 0)
    {
      if (v51 & v54) != 1 || (id v57 = objc_msgSend(v10, "vcp_isPano"), (v57))
      {
        unint64_t v59 = (unint64_t)objc_msgSend(*a4, "vcp_types");
        unint64_t v60 = (unint64_t)objc_msgSend(*a4, "vcp_version");
        if ([v10 isVideo]
          && objc_msgSend(v10, "vcp_needsImageCaptionProcessing"))
        {
          v59 &= 0xFFFCFFFFFFFFFFFFLL;
        }

        if (self->_imageOnlyAnalysis)
        {
          os_log_type_t v61 = (void *)objc_claimAutoreleasedReturnValue([v10 mediaAnalysisProperties]);
          int v62 = [v61 mediaAnalysisImageVersion];
          else {
            unint64_t v60 = v60;
          }
        }

        uint64_t v63 = MediaAnalysisTypesUpdatedSince(v60, v10);
        unint64_t v65 = v109 & v63 & v59;
        unint64_t v66 = (v59 ^ v18) & v109;
        if (!(v65 | v66))
        {
          uint64_t v29 = v107;
          id v93 = objc_msgSend(*a4, "vcp_version");
          if ((int)v93 < MediaAnalysisVersion)
          {
            if (!self->_imageOnlyAnalysis || (id v93 = [v10 isVideo], (v93 & 1) == 0)) {
              id v93 = (id)-[VCPDatabaseWriter bumpAnalysisVersionForAsset:]( self->_analysisDatabase,  "bumpAnalysisVersionForAsset:",  v112);
            }
          }

          uint64_t v95 = MediaAnalysisLogLevel(v93, v94);
          uint64_t v97 = VCPLogInstance(v95, v96);
          uint64_t v75 = (os_log_s *)objc_claimAutoreleasedReturnValue(v97);
          os_log_type_t v98 = VCPLogToOSLogType[7];
          if (os_log_type_enabled(v75, v98))
          {
            *(_DWORD *)buf = 138412290;
            v115 = v110;
            _os_log_impl((void *)&_mh_execute_header, v75, v98, "%@ Analysis complete and up-to-date", buf, 0xCu);
          }

          goto LABEL_68;
        }

        if (((v51 | v54) & 1) != 0)
        {
          uint64_t v29 = v107;
          if (v65)
          {
            uint64_t v63 = MediaAnalysisLogLevel(v63, v64);
            if ((int)v63 >= 6)
            {
              uint64_t v67 = VCPLogInstance(v63, v64);
              os_log_type_t v68 = (os_log_s *)objc_claimAutoreleasedReturnValue(v67);
              os_log_type_t v69 = VCPLogToOSLogType[6];
              if (os_log_type_enabled(v68, v69))
              {
                uint64_t v70 = MediaAnalysisTypeShortDescription(v65);
                uint64_t v71 = (__CFString *)objc_claimAutoreleasedReturnValue(v70);
                *(_DWORD *)buf = 138412546;
                v115 = v110;
                __int16 v116 = 2112;
                v117 = v71;
                _os_log_impl( (void *)&_mh_execute_header,  v68,  v69,  "%@ Analysis outdated; need to analyze (%@)",
                  buf,
                  0x16u);
              }

              uint64_t v29 = v107;
            }
          }

          if (!v66) {
            goto LABEL_69;
          }
          uint64_t v72 = MediaAnalysisLogLevel(v63, v64);
          uint64_t v74 = VCPLogInstance(v72, v73);
          uint64_t v75 = (os_log_s *)objc_claimAutoreleasedReturnValue(v74);
          os_log_type_t v76 = VCPLogToOSLogType[6];
          if (os_log_type_enabled(v75, v76))
          {
            uint64_t v77 = MediaAnalysisTypeShortDescription(v66);
            v78 = (__CFString *)objc_claimAutoreleasedReturnValue(v77);
            *(_DWORD *)buf = 138412546;
            v115 = v110;
            __int16 v116 = 2112;
            v117 = v78;
            _os_log_impl( (void *)&_mh_execute_header,  v75,  v76,  "%@ Analysis incomplete; need to analyze (%@)",
              buf,
              0x16u);
          }

+ (BOOL)canDoFullAnalysis:(id)a3 withResources:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = objc_msgSend(v5, "vcp_fullAnalysisTypes");
  LOBYTE(v7) = v7 == objc_msgSend(v5, "vcp_fullAnalysisTypesForResources:", v6);

  return (char)v7;
}

- (BOOL)doneFullAnalysis:(id)a3
{
  id v3 = a3;
  objc_super v4 = (void *)objc_claimAutoreleasedReturnValue([v3 asset]);
  unint64_t v5 = (unint64_t)objc_msgSend(v4, "vcp_fullAnalysisTypes");

  id v6 = (void *)objc_claimAutoreleasedReturnValue([v3 analysisResults]);
  unint64_t v7 = (unint64_t)objc_msgSend(v6, "vcp_types");

  return (v5 & ~v7 & 0xFFFFFFFFFFEFFFFFLL) == 0;
}

- (BOOL)needDownloadForAsset:(id)a3 withResources:(id)a4
{
  return 0;
}

- (id)downloadResourceForAsset:(id)a3 fromResources:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "vcp_smallMovieDerivativeResource"));
  if (!v8)
  {
    uint64_t v18 = MediaAnalysisLogLevel(0LL, v7);
    if ((int)v18 >= 3)
    {
      uint64_t v20 = VCPLogInstance(v18, v19);
      uint64_t v21 = (os_log_s *)objc_claimAutoreleasedReturnValue(v20);
      os_log_type_t v22 = VCPLogToOSLogType[3];
      if (os_log_type_enabled(v21, v22))
      {
        os_log_type_t v23 = (void *)objc_claimAutoreleasedReturnValue([v5 localIdentifier]);
        *(_DWORD *)buf = 138412290;
        unint64_t v57 = (unint64_t)v23;
        _os_log_impl( (void *)&_mh_execute_header,  v21,  v22,  "[%@] Asset has no small video derivative; skipping",
          buf,
          0xCu);
      }
    }

    uint64_t v24 = MediaAnalysisLogLevel(v18, v19);
    if ((int)v24 <= 6)
    {
      os_log_type_t v29 = VCPLogToOSLogType[7];
    }

    else
    {
      uint64_t v27 = VCPLogInstance(v24, v25);
      uint64_t v28 = (os_log_s *)objc_claimAutoreleasedReturnValue(v27);
      os_log_type_t v29 = VCPLogToOSLogType[7];
      if (os_log_type_enabled(v28, v29))
      {
        os_log_type_t v30 = (void *)objc_claimAutoreleasedReturnValue([v5 localIdentifier]);
        *(_DWORD *)buf = 138412290;
        unint64_t v57 = (unint64_t)v30;
        _os_log_impl((void *)&_mh_execute_header, v28, v29, "[%@] Asset all acceptable resources:", buf, 0xCu);
      }
    }

    unint64_t v31 = 0LL;
    *(void *)&__int128 v26 = 134218242LL;
    __int128 v55 = v26;
    while (1)
    {
      id v32 = objc_msgSend(v6, "count", v55);
      uint64_t v34 = MediaAnalysisLogLevel(v32, v33);
      if ((int)v34 >= 7)
      {
        uint64_t v36 = VCPLogInstance(v34, v35);
        id v37 = (os_log_s *)objc_claimAutoreleasedReturnValue(v36);
        if (os_log_type_enabled(v37, v29))
        {
          uint64_t v38 = (void *)objc_claimAutoreleasedReturnValue([v6 objectAtIndexedSubscript:v31]);
          *(_DWORD *)buf = v55;
          unint64_t v57 = v31;
          __int16 v58 = 2112;
          unint64_t v59 = v38;
          _os_log_impl((void *)&_mh_execute_header, v37, v29, "[%lu] acceptable resource: %@", buf, 0x16u);
        }
      }

      ++v31;
    }

    goto LABEL_35;
  }

  id v9 = [v8 fileSize];
  id v10 = +[VCPDownloadManager maxSizeBytes](&OBJC_CLASS___VCPDownloadManager, "maxSizeBytes");
  if (v9 > v10)
  {
    uint64_t v12 = MediaAnalysisLogLevel(v10, v11);
    if ((int)v12 >= 7)
    {
      uint64_t v14 = VCPLogInstance(v12, v13);
      uint64_t v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
      os_log_type_t v16 = VCPLogToOSLogType[7];
      if (os_log_type_enabled(v15, v16))
      {
        uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue([v5 localIdentifier]);
        *(_DWORD *)buf = 138412290;
        unint64_t v57 = (unint64_t)v17;
        _os_log_impl( (void *)&_mh_execute_header,  v15,  v16,  "[%@] File size exceeds download threshold; skipping",
          buf,
          0xCu);
      }

- (void)addPhotosAsset:(id)a3 priority:(unint64_t)a4 previousStatus:(unint64_t)a5 attempts:(unint64_t)a6 lastAttemptDate:(id)a7
{
  id v12 = a3;
  v116.receiver = self;
  v116.super_class = (Class)&OBJC_CLASS___MADPhotosFullAssetProcessingTask;
  unint64_t v107 = a5;
  unint64_t v108 = a6;
  id v109 = a7;
  -[MADPhotosAssetProcessingTask addPhotosAsset:priority:previousStatus:attempts:lastAttemptDate:]( &v116,  "addPhotosAsset:priority:previousStatus:attempts:lastAttemptDate:",  v12,  a4,  a5,  a6);
  __int128 v114 = 0u;
  __int128 v115 = 0u;
  __int128 v112 = 0u;
  __int128 v113 = 0u;
  uint64_t v13 = self->_assetEntries;
  id v14 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v13,  "countByEnumeratingWithState:objects:count:",  &v112,  v124,  16LL);
  if (v14)
  {
    uint64_t v15 = *(void *)v113;
    while (2)
    {
      for (i = 0LL; i != v14; i = (char *)i + 1)
      {
        if (*(void *)v113 != v15) {
          objc_enumerationMutation(v13);
        }
        uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(*((void *)&v112 + 1) + 8 * (void)i) asset]);
        uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue([v17 localIdentifier]);
        uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue([v12 localIdentifier]);
        unsigned int v20 = [v18 isEqualToString:v19];

        if (v20)
        {
          uint64_t v31 = MediaAnalysisLogLevel(v21, v22);
          if ((int)v31 >= 4)
          {
            uint64_t v33 = VCPLogInstance(v31, v32);
            uint64_t v34 = (os_log_s *)objc_claimAutoreleasedReturnValue(v33);
            os_log_type_t v35 = VCPLogToOSLogType[4];
            if (os_log_type_enabled(v34, v35))
            {
              logPrefix = self->_logPrefix;
              id v37 = (void *)objc_claimAutoreleasedReturnValue([v12 localIdentifier]);
              *(_DWORD *)buf = 138412546;
              *(void *)&uint8_t buf[4] = logPrefix;
              __int16 v118 = 2112;
              v119 = v37;
              _os_log_impl( (void *)&_mh_execute_header,  v34,  v35,  "[%@][%@] Batch already contains asset; ignoring",
                buf,
                0x16u);
            }
          }

          goto LABEL_61;
        }
      }

      id v14 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v13,  "countByEnumeratingWithState:objects:count:",  &v112,  v124,  16LL);
      if (v14) {
        continue;
      }
      break;
    }
  }

  if (self->_imageOnlyAnalysis || (id v23 = objc_msgSend(v12, "vcp_isLongMovie"), !(_DWORD)v23))
  {
    uint64_t v13 = (NSMutableArray *)objc_claimAutoreleasedReturnValue( +[PHAssetResource vcp_allAcceptableResourcesForAsset:]( &OBJC_CLASS___PHAssetResource,  "vcp_allAcceptableResourcesForAsset:",  v12));
    uint64_t v38 = -[MADPhotosFullAssetProcessingTask needDownloadForAsset:withResources:]( self,  "needDownloadForAsset:withResources:",  v12,  v13);
    int v40 = v38;
    if ((_DWORD)v38)
    {
      uint64_t v38 = objc_claimAutoreleasedReturnValue( -[MADPhotosFullAssetProcessingTask downloadResourceForAsset:fromResources:]( self,  "downloadResourceForAsset:fromResources:",  v12,  v13));
      uint64_t v41 = (void *)v38;
      if (!v38)
      {
        uint64_t v42 = MediaAnalysisLogLevel(0LL, v39);
        if ((int)v42 >= 7)
        {
          uint64_t v44 = VCPLogInstance(v42, v43);
          uint64_t v45 = (os_log_s *)objc_claimAutoreleasedReturnValue(v44);
          os_log_type_t v46 = VCPLogToOSLogType[7];
          if (os_log_type_enabled(v45, v46))
          {
            uint64_t v47 = self->_logPrefix;
            uint64_t v48 = (void *)objc_claimAutoreleasedReturnValue([v12 localIdentifier]);
            *(_DWORD *)buf = 138412546;
            *(void *)&uint8_t buf[4] = v47;
            __int16 v118 = 2112;
            v119 = v48;
            _os_log_impl( (void *)&_mh_execute_header,  v45,  v46,  "[%@][%@] Can not perform the required download; ignoring",
              buf,
              0x16u);
          }
        }

        -[MADPhotosFullAssetProcessingTask increaseProcessedJobCountByOne](self, "increaseProcessedJobCountByOne");
        goto LABEL_61;
      }
    }

    else
    {
      uint64_t v41 = 0LL;
    }

    uint64_t v49 = MediaAnalysisLogLevel(v38, v39);
    uint64_t v105 = v41;
    if ((int)v49 >= 7)
    {
      uint64_t v51 = VCPLogInstance(v49, v50);
      id v52 = (os_log_s *)objc_claimAutoreleasedReturnValue(v51);
      os_log_type_t v53 = VCPLogToOSLogType[7];
      if (os_log_type_enabled(v52, v53))
      {
        unsigned int v54 = self->_logPrefix;
        __int128 v55 = (void *)objc_claimAutoreleasedReturnValue([v12 localIdentifier]);
        *(_DWORD *)buf = 138412546;
        *(void *)&uint8_t buf[4] = v54;
        __int16 v118 = 2112;
        v119 = v55;
        _os_log_impl((void *)&_mh_execute_header, v52, v53, "[%@][%@] Adding asset to processing batch ...", buf, 0x16u);
      }
    }

    id location = 0LL;
    int v106 = v40;
    uint64_t v56 = v40 ^ 1u;
    unint64_t v57 = -[MADPhotosFullAssetProcessingTask missingAnalysisForAsset:existingAnalysis:resources:forLocalResourcesOnly:]( self,  "missingAnalysisForAsset:existingAnalysis:resources:forLocalResourcesOnly:",  v12,  &location,  v13,  v56);
    unint64_t v59 = v57;
    if (v57)
    {
      uint64_t v60 = VCPSignPostLog(v57);
      os_log_type_t v61 = (os_log_s *)objc_claimAutoreleasedReturnValue(v60);
      os_signpost_id_t v62 = os_signpost_id_generate(v61);

      uint64_t v64 = VCPSignPostLog(v63);
      unint64_t v65 = (os_log_s *)objc_claimAutoreleasedReturnValue(v64);
      unint64_t v66 = v65;
      if (v62 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v65))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v66,  OS_SIGNPOST_INTERVAL_BEGIN,  v62,  "MADPhotosFullAssetProcessingTask_UnpackComputeSync",  (const char *)&unk_100199097,  buf,  2u);
      }

      os_log_type_t v104 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray mad_computeSyncResource](v13, "mad_computeSyncResource"));
      uint64_t v67 = (void *)objc_claimAutoreleasedReturnValue(-[MADProcessingTask cancelBlock](self, "cancelBlock"));
      os_log_type_t v68 = (void *)objc_claimAutoreleasedReturnValue( objc_msgSend( v104,  "mad_existingAnalysisFromComputeSyncForAsset:allowDownload:cancel:",  v12,  0,  v67));

      uint64_t v70 = VCPSignPostLog(v69);
      uint64_t v71 = (os_log_s *)objc_claimAutoreleasedReturnValue(v70);
      uint64_t v72 = v71;
      if (v62 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v71))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v72,  OS_SIGNPOST_INTERVAL_END,  v62,  "MADPhotosFullAssetProcessingTask_UnpackComputeSync",  (const char *)&unk_100199097,  buf,  2u);
      }

      BOOL v73 = v68 != 0LL;
      if (v68)
      {
        objc_storeStrong(&location, v68);
        unint64_t v59 = -[MADPhotosFullAssetProcessingTask missingAnalysisForAsset:withExistingComputeSyncAnalysis:resources:forLocalResourcesOnly:]( self,  "missingAnalysisForAsset:withExistingComputeSyncAnalysis:resources:forLocalResourcesOnly:",  v12,  &location,  v13,  v56);
        uint64_t v75 = MediaAnalysisLogLevel(v59, v74);
        if ((int)v75 >= 5)
        {
          uint64_t v77 = VCPLogInstance(v75, v76);
          v78 = (os_log_s *)objc_claimAutoreleasedReturnValue(v77);
          os_log_type_t v79 = VCPLogToOSLogType[5];
          if (os_log_type_enabled(v78, v79))
          {
            uint64_t v103 = v78;
            uint64_t v80 = self->_logPrefix;
            uint64_t v81 = (void *)objc_claimAutoreleasedReturnValue([v12 localIdentifier]);
            uint64_t v82 = MediaAnalysisTypeShortDescription(objc_msgSend(location, "vcp_types"));
            uint64_t v102 = (void *)objc_claimAutoreleasedReturnValue(v82);
            uint64_t v83 = MediaAnalysisTypeShortDescription(v59);
            uint64_t v84 = (void *)objc_claimAutoreleasedReturnValue(v83);
            *(_DWORD *)buf = 138413058;
            *(void *)&uint8_t buf[4] = v80;
            __int16 v118 = 2112;
            v119 = v81;
            __int16 v120 = 2112;
            v121 = v102;
            __int16 v122 = 2112;
            v123 = v84;
            _os_log_impl( (void *)&_mh_execute_header,  v103,  v79,  "[%@][%@] Reusing analysis results from compute sync (existing: %@, missing: %@)",  buf,  0x2Au);

            v78 = v103;
          }
        }
      }
    }

    else
    {
      BOOL v73 = 0;
    }

    int v85 = v106;
    if (v59 != VCPMAFullAnalysisTypesThumbnail) {
      int v85 = 0;
    }
    if (v85 == 1)
    {
      uint64_t v86 = MediaAnalysisLogLevel(v57, v58);
      if ((int)v86 >= 7)
      {
        uint64_t v88 = VCPLogInstance(v86, v87);
        os_log_type_t v89 = (os_log_s *)objc_claimAutoreleasedReturnValue(v88);
        os_log_type_t v90 = VCPLogToOSLogType[7];
        if (os_log_type_enabled(v89, v90))
        {
          uint64_t v91 = self->_logPrefix;
          os_log_type_t v92 = (void *)objc_claimAutoreleasedReturnValue([v12 localIdentifier]);
          *(_DWORD *)buf = 138412546;
          *(void *)&uint8_t buf[4] = v91;
          __int16 v118 = 2112;
          v119 = v92;
          _os_log_impl( (void *)&_mh_execute_header,  v89,  v90,  "[%@][%@] No analysis needs to perform; ignoring",
            buf,
            0x16u);
        }
      }

      -[MADPhotosFullAssetProcessingTask increaseProcessedJobCountByOne](self, "increaseProcessedJobCountByOne");
    }

    else
    {
      if (!self->_imageOnlyAnalysis && v59 && [v12 isVideo])
      {
        [v12 duration];
        self->_accumulatedVideoDurations = v93 + self->_accumulatedVideoDurations;
      }

      *(void *)buf = 0LL;
      uint64_t v110 = 0LL;
      analysisDatabase = self->_analysisDatabase;
      unint64_t processingStatusTaskID = self->_processingStatusTaskID;
      uint64_t v96 = (void *)objc_claimAutoreleasedReturnValue([v12 localIdentifier]);
      -[VCPDatabaseWriter fetchProcessingErrorCode:errorLine:taskID:localIndentifier:]( analysisDatabase,  "fetchProcessingErrorCode:errorLine:taskID:localIndentifier:",  buf,  &v110,  processingStatusTaskID,  v96);

      assetEntries = self->_assetEntries;
      if (v106) {
        os_log_type_t v98 = v13;
      }
      else {
        os_log_type_t v98 = 0LL;
      }
      LOBYTE(v101) = v106;
      LOBYTE(v100) = v73;
      uint64_t v99 = (void *)objc_claimAutoreleasedReturnValue( +[MADFullAssetEntry entryWithAsset:previousStatus:previousAttempts:lastAttemptDate:analysisTypes:imageOnlyAnalysis:existingAnalysis:isAnalysisFromComputeSync:downloadResource:needDownload:acceptableResources:previousErrorCode:previousErrorLine:]( &OBJC_CLASS___MADFullAssetEntry,  "entryWithAsset:previousStatus:previousAttempts:lastAttemptDate:analysisTypes:imageOnlyAnalysis:e xistingAnalysis:isAnalysisFromComputeSync:downloadResource:needDownload:acceptableResources:prev iousErrorCode:previousErrorLine:",  v12,  v107,  v108,  v109,  v59,  self->_imageOnlyAnalysis,  location,  v100,  v105,  v101,  v98,  *(void *)buf,  v110));
      -[NSMutableArray addObject:](assetEntries, "addObject:", v99);
    }

    goto LABEL_61;
  }

  uint64_t v25 = MediaAnalysisLogLevel(v23, v24);
  if ((int)v25 >= 4)
  {
    uint64_t v27 = VCPLogInstance(v25, v26);
    uint64_t v13 = (NSMutableArray *)objc_claimAutoreleasedReturnValue(v27);
    os_log_type_t v28 = VCPLogToOSLogType[4];
    if (os_log_type_enabled((os_log_t)v13, v28))
    {
      os_log_type_t v29 = self->_logPrefix;
      os_log_type_t v30 = (void *)objc_claimAutoreleasedReturnValue([v12 localIdentifier]);
      *(_DWORD *)buf = 138412546;
      *(void *)&uint8_t buf[4] = v29;
      __int16 v118 = 2112;
      v119 = v30;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)v13,  v28,  "[%@][%@] Long duration movie shall not be processed in the unified path; ignoring",
        buf,
        0x16u);
    }

- (unint64_t)count
{
  return (unint64_t)-[NSMutableArray count](self->_assetEntries, "count");
}

- (id)assetLocalIdentifiers
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](&OBJC_CLASS___NSMutableSet, "set"));
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  objc_super v4 = self->_assetEntries;
  id v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v4,  "countByEnumeratingWithState:objects:count:",  &v13,  v17,  16LL);
  if (v5)
  {
    uint64_t v6 = *(void *)v14;
    do
    {
      uint64_t v7 = 0LL;
      do
      {
        if (*(void *)v14 != v6) {
          objc_enumerationMutation(v4);
        }
        id v8 = *(void **)(*((void *)&v13 + 1) + 8LL * (void)v7);
        id v9 = objc_autoreleasePoolPush();
        id v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "asset", (void)v13));
        uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([v10 localIdentifier]);
        [v3 addObject:v11];

        objc_autoreleasePoolPop(v9);
        uint64_t v7 = (char *)v7 + 1;
      }

      while (v5 != v7);
      id v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v4,  "countByEnumeratingWithState:objects:count:",  &v13,  v17,  16LL);
    }

    while (v5);
  }

  return v3;
}

- (int)status
{
  return self->_status;
}

- (int)_prepare
{
  uint64_t v48 = objc_alloc_init(&OBJC_CLASS___VCPTimeMeasurement);
  uint64_t v2 = VCPSignPostLog(-[VCPTimeMeasurement start](v48, "start"));
  id v3 = (os_log_s *)objc_claimAutoreleasedReturnValue(v2);
  objc_super v4 = (char *)os_signpost_id_generate(v3);

  uint64_t v6 = VCPSignPostLog(v5);
  uint64_t v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
  id v8 = v7;
  unint64_t v46 = (unint64_t)(v4 - 1);
  os_signpost_id_t spid = (os_signpost_id_t)v4;
  if ((unint64_t)(v4 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v7))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v8,  OS_SIGNPOST_INTERVAL_BEGIN,  (os_signpost_id_t)v4,  "MADPhotosFullAssetProcessingTask_Prepare",  (const char *)&unk_100199097,  buf,  2u);
  }

  uint64_t v11 = MediaAnalysisLogLevel(v9, v10);
  if ((int)v11 >= 6)
  {
    uint64_t v13 = VCPLogInstance(v11, v12);
    __int128 v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
    os_log_type_t v15 = VCPLogToOSLogType[6];
    if (os_log_type_enabled(v14, v15))
    {
      logPrefix = self->_logPrefix;
      unsigned int v17 = -[NSMutableArray count](self->_assetEntries, "count");
      uint64_t v18 = qos_class_self();
      uint64_t v19 = VCPMAQoSDescription(v18);
      objc_super v4 = (char *)objc_claimAutoreleasedReturnValue(v19);
      *(_DWORD *)buf = 138412802;
      os_signpost_id_t v62 = logPrefix;
      __int16 v63 = 1024;
      unsigned int v64 = v17;
      __int16 v65 = 2112;
      unint64_t v66 = v4;
      _os_log_impl((void *)&_mh_execute_header, v14, v15, "[%@] Preparing %d assets (QoS: %@)", buf, 0x1Cu);
    }
  }

  __int128 v58 = 0u;
  __int128 v59 = 0u;
  __int128 v56 = 0u;
  __int128 v57 = 0u;
  obj = self->_assetEntries;
  id v20 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( obj,  "countByEnumeratingWithState:objects:count:",  &v56,  v60,  16LL);
  if (v20)
  {
    uint64_t v51 = *(void *)v57;
LABEL_10:
    uint64_t v21 = 0LL;
    int v22 = (int)v4;
    id v50 = v20;
    while (1)
    {
      int v52 = v22;
      if (*(void *)v57 != v51) {
        objc_enumerationMutation(obj);
      }
      id v23 = *(void **)(*((void *)&v56 + 1) + 8LL * (void)v21);
      analysisDatabase = self->_analysisDatabase;
      uint64_t v25 = (char *)[v23 previousAttempts];
      unsigned int v54 = (void *)objc_claimAutoreleasedReturnValue([v23 asset]);
      unint64_t processingStatusTaskID = self->_processingStatusTaskID;
      __int128 v55 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate now](&OBJC_CLASS___NSDate, "now"));
      uint64_t v27 = (void *)objc_claimAutoreleasedReturnValue([v23 asset]);
      id v28 = [v27 mediaType];
      os_log_type_t v29 = (void *)objc_claimAutoreleasedReturnValue([v23 asset]);
      unsigned int v30 = -[VCPDatabaseWriter setAttempts:asset:taskID:status:lastAttemptDate:mediaType:mediaSubtypes:errorCode:errorLine:]( analysisDatabase,  "setAttempts:asset:taskID:status:lastAttemptDate:mediaType:mediaSubtypes:errorCode:errorLine:",  v25 + 1,  v54,  processingStatusTaskID,  1,  v55,  v28,  [v29 mediaSubtypes],  objc_msgSend(v23, "previousErrorCode"),  objc_msgSend(v23, "previousErrorLine"));

      if (v30 == -108 || v30 == -36)
      {
        LODWORD(v4) = v30;
      }

      else
      {
        LODWORD(v4) = v30;
        if (v30 != -23) {
          LODWORD(v4) = v52;
        }
      }

      if (v30 == -108 || v30 == -36 || v30 == -23) {
        goto LABEL_41;
      }
      uint64_t v21 = (char *)v21 + 1;
      int v22 = (int)v4;
      if (v50 == v21)
      {
        id v20 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( obj,  "countByEnumeratingWithState:objects:count:",  &v56,  v60,  16LL);
        if (v20) {
          goto LABEL_10;
        }
        break;
      }
    }
  }

  uint64_t v31 = -[VCPDatabaseWriter commit](self->_analysisDatabase, "commit");
  if ((_DWORD)v31 == -108 || (_DWORD)v31 == -36)
  {
    int v33 = v31;
  }

  else
  {
    int v33 = v31;
    if ((_DWORD)v31 != -23) {
      int v33 = (int)v4;
    }
  }

  if ((_DWORD)v31 != -108 && (_DWORD)v31 != -36 && (_DWORD)v31 != -23)
  {
    uint64_t v34 = MediaAnalysisLogLevel(v31, v32);
    if ((int)v34 >= 6)
    {
      uint64_t v36 = VCPLogInstance(v34, v35);
      id v37 = (os_log_s *)objc_claimAutoreleasedReturnValue(v36);
      os_log_type_t v38 = VCPLogToOSLogType[6];
      if (os_log_type_enabled(v37, v38))
      {
        uint64_t v39 = self->_logPrefix;
        *(_DWORD *)buf = 138412290;
        os_signpost_id_t v62 = v39;
        _os_log_impl((void *)&_mh_execute_header, v37, v38, "[%@] Preparing assets done", buf, 0xCu);
      }
    }

    uint64_t v40 = VCPSignPostLog(v34);
    uint64_t v41 = (os_log_s *)objc_claimAutoreleasedReturnValue(v40);
    uint64_t v42 = v41;
    if (v46 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v41))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v42,  OS_SIGNPOST_INTERVAL_END,  spid,  "MADPhotosFullAssetProcessingTask_Prepare",  (const char *)&unk_100199097,  buf,  2u);
    }

    -[VCPTimeMeasurement stop](v48, "stop");
    obj = (NSMutableArray *)objc_claimAutoreleasedReturnValue( +[VCPMADCoreAnalyticsManager sharedManager]( &OBJC_CLASS___VCPMADCoreAnalyticsManager,  "sharedManager"));
    -[VCPTimeMeasurement elapsedTimeSeconds](v48, "elapsedTimeSeconds");
    -[NSMutableArray accumulateDoubleValue:forField:andEvent:]( obj,  "accumulateDoubleValue:forField:andEvent:",  @"TotalPrepareTimeInSeconds",  @"com.apple.mediaanalysisd.FullAnalysisRunSession");
    uint64_t v43 = VCPCoreAnalyticsFieldForFull(self->_imageOnlyAnalysis, self->_mediaType, self->_mediaSubtype, 2LL);
    uint64_t v44 = (void *)objc_claimAutoreleasedReturnValue(v43);
    if (v44)
    {
      -[VCPTimeMeasurement elapsedTimeSeconds](v48, "elapsedTimeSeconds");
      -[NSMutableArray accumulateDoubleValue:forField:andEvent:]( obj,  "accumulateDoubleValue:forField:andEvent:",  v44,  @"com.apple.mediaanalysisd.FullAnalysisRunSession");
    }

    LODWORD(v4) = 0;
LABEL_41:

    int v33 = (int)v4;
  }

  return v33;
}

- (void)prepare
{
  self->_status = -[MADPhotosFullAssetProcessingTask _prepare](self, "_prepare");
}

- (void)download
{
  v131 = objc_alloc_init(&OBJC_CLASS___VCPTimeMeasurement);
  uint64_t v2 = VCPSignPostLog(-[VCPTimeMeasurement start](v131, "start"));
  id v3 = (os_log_s *)objc_claimAutoreleasedReturnValue(v2);
  os_signpost_id_t v4 = os_signpost_id_generate(v3);

  uint64_t v6 = VCPSignPostLog(v5);
  uint64_t v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
  id v8 = v7;
  os_signpost_id_t spid = v4;
  unint64_t v130 = v4 - 1;
  if (v4 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v7))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v8,  OS_SIGNPOST_INTERVAL_BEGIN,  v4,  "MADPhotosFullAssetProcessingTask_Download",  (const char *)&unk_100199097,  buf,  2u);
  }

  uint64_t v11 = MediaAnalysisLogLevel(v9, v10);
  if ((int)v11 >= 6)
  {
    uint64_t v13 = VCPLogInstance(v11, v12);
    __int128 v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
    os_log_type_t v15 = VCPLogToOSLogType[6];
    if (os_log_type_enabled(v14, v15))
    {
      logPrefix = self->_logPrefix;
      unsigned int v17 = -[NSMutableArray count](self->_assetEntries, "count");
      uint64_t v18 = qos_class_self();
      uint64_t v19 = VCPMAQoSDescription(v18);
      id v20 = (void *)objc_claimAutoreleasedReturnValue(v19);
      *(_DWORD *)buf = 138412802;
      v147 = logPrefix;
      __int16 v148 = 1024;
      *(_DWORD *)v149 = v17;
      *(_WORD *)&v149[4] = 2112;
      *(void *)&v149[6] = v20;
      _os_log_impl((void *)&_mh_execute_header, v14, v15, "[%@] Downloading %d assets (QoS: %@)", buf, 0x1Cu);
    }
  }

  uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue(+[MADStateHandler sharedStateHandler](&OBJC_CLASS___MADStateHandler, "sharedStateHandler"));
  [v21 addBreadcrumb:@"[%@] Downloading %d assets", self->_logPrefix, -[NSMutableArray count](self->_assetEntries, "count")];

  __int128 v144 = 0u;
  __int128 v145 = 0u;
  __int128 v142 = 0u;
  __int128 v143 = 0u;
  obj = self->_assetEntries;
  id v22 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( obj,  "countByEnumeratingWithState:objects:count:",  &v142,  v152,  16LL);
  if (!v22)
  {
    *(void *)&type[4] = 0LL;
    goto LABEL_68;
  }

  *(_DWORD *)&type[8] = 0;
  uint64_t v23 = *(void *)v143;
  os_log_type_t v136 = VCPLogToOSLogType[4];
  *(void *)type = VCPLogToOSLogType[5];
  os_log_type_t v137 = VCPLogToOSLogType[3];
  do
  {
    for (i = 0LL; i != v22; i = (char *)i + 1)
    {
      if (*(void *)v143 != v23) {
        objc_enumerationMutation(obj);
      }
      uint64_t v25 = *(void **)(*((void *)&v142 + 1) + 8LL * (void)i);
      uint64_t v26 = objc_autoreleasePoolPush();
      uint64_t v27 = (void *)objc_claimAutoreleasedReturnValue(+[VCPWatchdog sharedWatchdog](&OBJC_CLASS___VCPWatchdog, "sharedWatchdog"));
      [v27 pet];

      if (![v25 analysisTypes])
      {
        uint64_t v44 = MediaAnalysisLogLevel(0LL, v28);
        uint64_t v46 = VCPLogInstance(v44, v45);
        uint64_t v47 = (os_log_s *)objc_claimAutoreleasedReturnValue(v46);
        if (os_log_type_enabled(v47, v137))
        {
          uint64_t v48 = self->_logPrefix;
          uint64_t v49 = (void *)objc_claimAutoreleasedReturnValue([v25 asset]);
          id v50 = (void *)objc_claimAutoreleasedReturnValue([v49 localIdentifier]);
          *(_DWORD *)buf = 138412546;
          v147 = v48;
          __int16 v148 = 2112;
          *(void *)v149 = v50;
          _os_log_impl( (void *)&_mh_execute_header,  v47,  v137,  "[%@][%@] analysisTypes is nil and download is not needed; skipping",
            buf,
            0x16u);
        }

        goto LABEL_63;
      }

      id v29 = [v25 needDownload];
      if ((v29 & 1) == 0)
      {
        uint64_t v51 = MediaAnalysisLogLevel(v29, v30);
        uint64_t v53 = VCPLogInstance(v51, v52);
        uint64_t v47 = (os_log_s *)objc_claimAutoreleasedReturnValue(v53);
        if (os_log_type_enabled(v47, v136))
        {
          unsigned int v54 = self->_logPrefix;
          __int128 v55 = (void *)objc_claimAutoreleasedReturnValue([v25 asset]);
          __int128 v56 = (void *)objc_claimAutoreleasedReturnValue([v55 localIdentifier]);
          *(_DWORD *)buf = 138412546;
          v147 = v54;
          __int16 v148 = 2112;
          *(void *)v149 = v56;
          _os_log_impl((void *)&_mh_execute_header, v47, v136, "[%@][%@] Download is not needed; skipping", buf, 0x16u);
        }

        goto LABEL_63;
      }

      if (!self->_downloadAllowed)
      {
        uint64_t v93 = MediaAnalysisLogLevel(self, v30);
        if ((int)v93 < 3)
        {
          uint64_t v43 = 4294943488LL;
          goto LABEL_56;
        }

        uint64_t v95 = VCPLogInstance(v93, v94);
        uint64_t v39 = (os_log_s *)objc_claimAutoreleasedReturnValue(v95);
        if (os_log_type_enabled(v39, v137))
        {
          uint64_t v96 = self->_logPrefix;
          uint64_t v97 = (void *)objc_claimAutoreleasedReturnValue([v25 asset]);
          os_log_type_t v98 = (void *)objc_claimAutoreleasedReturnValue([v97 localIdentifier]);
          *(_DWORD *)buf = 138412546;
          v147 = v96;
          __int16 v148 = 2112;
          *(void *)v149 = v98;
          _os_log_impl((void *)&_mh_execute_header, v39, v137, "[%@][%@] Download is not allowed; skipping", buf, 0x16u);
        }

        uint64_t v43 = 4294943488LL;
LABEL_53:

        goto LABEL_56;
      }

      uint64_t v31 = (void *)objc_claimAutoreleasedReturnValue(-[MADProcessingTask cancelBlock](self, "cancelBlock"));
      if (v31)
      {
        uint64_t v32 = (uint64_t (**)(void))objc_claimAutoreleasedReturnValue(-[MADProcessingTask cancelBlock](self, "cancelBlock"));
        int v33 = v32[2]();

        if (v33)
        {
          uint64_t v36 = MediaAnalysisLogLevel(v34, v35);
          if ((int)v36 >= 5)
          {
            uint64_t v38 = VCPLogInstance(v36, v37);
            uint64_t v39 = (os_log_s *)objc_claimAutoreleasedReturnValue(v38);
            if (os_log_type_enabled(v39, (os_log_type_t)type[0]))
            {
              uint64_t v40 = self->_logPrefix;
              uint64_t v41 = (void *)objc_claimAutoreleasedReturnValue([v25 asset]);
              uint64_t v42 = (void *)objc_claimAutoreleasedReturnValue([v41 localIdentifier]);
              *(_DWORD *)buf = 138412546;
              v147 = v40;
              __int16 v148 = 2112;
              *(void *)v149 = v42;
              _os_log_impl( (void *)&_mh_execute_header,  v39,  (os_log_type_t)type[0],  "[%@][%@] Download is canceled; skipping",
                buf,
                0x16u);
            }

            uint64_t v43 = 4294967168LL;
            goto LABEL_53;
          }

          uint64_t v43 = 4294967168LL;
LABEL_56:
          [v25 setStatus:v43];
          [v25 setDownloadResource:0];
          goto LABEL_64;
        }
      }

      __int128 v57 = (void *)objc_claimAutoreleasedReturnValue([v25 downloadResource]);
      BOOL v58 = v57 == 0LL;

      if (v58)
      {
        uint64_t v99 = MediaAnalysisLogLevel(v59, v60);
        if ((int)v99 < 3)
        {
          uint64_t v43 = 4294943494LL;
          goto LABEL_56;
        }

        uint64_t v101 = VCPLogInstance(v99, v100);
        uint64_t v39 = (os_log_s *)objc_claimAutoreleasedReturnValue(v101);
        if (os_log_type_enabled(v39, v137))
        {
          uint64_t v102 = self->_logPrefix;
          uint64_t v103 = (void *)objc_claimAutoreleasedReturnValue([v25 asset]);
          os_log_type_t v104 = (void *)objc_claimAutoreleasedReturnValue([v103 localIdentifier]);
          *(_DWORD *)buf = 138412546;
          v147 = v102;
          __int16 v148 = 2112;
          *(void *)v149 = v104;
          _os_log_impl( (void *)&_mh_execute_header,  v39,  v137,  "[%@][%@] Asset resource not found; skipping",
            buf,
            0x16u);
        }

        uint64_t v43 = 4294943494LL;
        goto LABEL_53;
      }

      uint64_t v61 = VCPSignPostLog(v59);
      os_signpost_id_t v62 = (os_log_s *)objc_claimAutoreleasedReturnValue(v61);
      os_signpost_id_t v63 = os_signpost_id_generate(v62);

      uint64_t v65 = VCPSignPostLog(v64);
      unint64_t v66 = (os_log_s *)objc_claimAutoreleasedReturnValue(v65);
      uint64_t v67 = v66;
      if (v63 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v66))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v67,  OS_SIGNPOST_INTERVAL_BEGIN,  v63,  "MADPhotosFullAssetProcessingTask_DownloadUnpackComputeSync",  (const char *)&unk_100199097,  buf,  2u);
      }

      os_log_type_t v68 = (void *)objc_claimAutoreleasedReturnValue([v25 acceptableResources]);
      uint64_t v47 = (os_log_s *)objc_claimAutoreleasedReturnValue(objc_msgSend(v68, "mad_computeSyncResource"));

      uint64_t v69 = (void *)objc_claimAutoreleasedReturnValue([v25 asset]);
      uint64_t v70 = (void *)objc_claimAutoreleasedReturnValue(-[MADProcessingTask cancelBlock](self, "cancelBlock"));
      id v141 = (id)objc_claimAutoreleasedReturnValue( -[os_log_s mad_existingAnalysisFromComputeSyncForAsset:allowDownload:cancel:]( v47,  "mad_existingAnalysisFromComputeSyncForAsset:allowDownload:cancel:",  v69,  1LL,  v70));

      uint64_t v72 = VCPSignPostLog(v71);
      BOOL v73 = (os_log_s *)objc_claimAutoreleasedReturnValue(v72);
      uint64_t v74 = v73;
      if (v63 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v73))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v74,  OS_SIGNPOST_INTERVAL_END,  v63,  "MADPhotosFullAssetProcessingTask_DownloadUnpackComputeSync",  (const char *)&unk_100199097,  buf,  2u);
      }

      if (v141)
      {
        uint64_t v75 = (void *)objc_claimAutoreleasedReturnValue([v25 asset]);
        uint64_t v76 = (void *)objc_claimAutoreleasedReturnValue([v25 acceptableResources]);
        unint64_t v77 = -[MADPhotosFullAssetProcessingTask missingAnalysisForAsset:withExistingComputeSyncAnalysis:resources:forLocalResourcesOnly:]( self,  "missingAnalysisForAsset:withExistingComputeSyncAnalysis:resources:forLocalResourcesOnly:",  v75,  &v141,  v76,  [v25 needDownload] ^ 1);

        if (!v77)
        {
          uint64_t v105 = MediaAnalysisLogLevel(v78, v79);
          if ((int)v105 >= 5)
          {
            uint64_t v107 = VCPLogInstance(v105, v106);
            unint64_t v108 = (os_log_s *)objc_claimAutoreleasedReturnValue(v107);
            if (os_log_type_enabled(v108, (os_log_type_t)type[0]))
            {
              id v109 = self->_logPrefix;
              v134 = (void *)objc_claimAutoreleasedReturnValue([v25 asset]);
              uint64_t v110 = (void *)objc_claimAutoreleasedReturnValue([v134 localIdentifier]);
              uint64_t v111 = MediaAnalysisTypeShortDescription(objc_msgSend(v141, "vcp_types"));
              __int128 v112 = (void *)objc_claimAutoreleasedReturnValue(v111);
              *(_DWORD *)buf = 138412802;
              v147 = v109;
              __int16 v148 = 2112;
              *(void *)v149 = v110;
              *(_WORD *)&v149[8] = 2112;
              *(void *)&v149[10] = v112;
              _os_log_impl( (void *)&_mh_execute_header,  v108,  (os_log_type_t)type[0],  "[%@][%@] Reusing complete analysis results (%@) from downloaded compute sync, skipping media resource download",  buf,  0x20u);
            }
          }

          [v25 setExistingAnalysis:v141];
          [v25 setAnalysisTypes:0];
          [v25 setIsAnalysisFromComputeSync:1];
          [v25 setStatus:0];
          [v25 setDownloadResource:0];
          ++*(void *)&type[4];
          goto LABEL_62;
        }

        uint64_t v80 = MediaAnalysisLogLevel(v78, v79);
        if ((int)v80 >= 5)
        {
          uint64_t v82 = VCPLogInstance(v80, v81);
          uint64_t v83 = (os_log_s *)objc_claimAutoreleasedReturnValue(v82);
          if (os_log_type_enabled(v83, (os_log_type_t)type[0]))
          {
            uint64_t v84 = self->_logPrefix;
            v132 = (void *)objc_claimAutoreleasedReturnValue([v25 asset]);
            v133 = (void *)objc_claimAutoreleasedReturnValue([v132 localIdentifier]);
            uint64_t v85 = MediaAnalysisTypeShortDescription(objc_msgSend(v141, "vcp_types"));
            id v86 = (id)objc_claimAutoreleasedReturnValue(v85);
            uint64_t v87 = MediaAnalysisTypeShortDescription(v77);
            uint64_t v88 = (void *)objc_claimAutoreleasedReturnValue(v87);
            *(_DWORD *)buf = 138413058;
            v147 = v84;
            __int16 v148 = 2112;
            *(void *)v149 = v133;
            *(_WORD *)&v149[8] = 2112;
            *(void *)&v149[10] = v86;
            __int16 v150 = 2112;
            v151 = v88;
            _os_log_impl( (void *)&_mh_execute_header,  v83,  (os_log_type_t)type[0],  "[%@][%@] Incomplete analysis results from downloaded compute sync (existing: %@, missing: %@), falling bac k to download media resource",  buf,  0x2Au);
          }
        }
      }

      os_log_type_t v89 = (void *)objc_claimAutoreleasedReturnValue([v25 downloadResource]);
      id v140 = 0LL;
      os_log_type_t v90 = (void *)objc_claimAutoreleasedReturnValue(-[MADProcessingTask cancelBlock](self, "cancelBlock"));
      uint64_t v91 = +[PHAssetResourceManager vcp_requestInMemoryDownload:taskID:data:cancel:]( &OBJC_CLASS___PHAssetResourceManager,  "vcp_requestInMemoryDownload:taskID:data:cancel:",  v89,  1LL,  &v140,  v90);
      id v92 = v140;
      [v25 setStatus:v91];

      if (![v25 status])
      {
        [v25 setDownloadedData:v92];
        ++*(void *)&type[4];
      }

      [v25 setDownloadResource:0];

LABEL_62:
LABEL_63:

LABEL_64:
      objc_autoreleasePoolPop(v26);
    }

    id v22 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( obj,  "countByEnumeratingWithState:objects:count:",  &v142,  v152,  16LL);
  }

  while (v22);
LABEL_68:

  uint64_t v115 = MediaAnalysisLogLevel(v113, v114);
  if ((int)v115 >= 6)
  {
    uint64_t v117 = VCPLogInstance(v115, v116);
    __int16 v118 = (os_log_s *)objc_claimAutoreleasedReturnValue(v117);
    os_log_type_t v119 = VCPLogToOSLogType[6];
    if (os_log_type_enabled(v118, v119))
    {
      __int16 v120 = self->_logPrefix;
      *(_DWORD *)buf = 138412546;
      v147 = v120;
      __int16 v148 = 1024;
      *(_DWORD *)v149 = *(_DWORD *)&type[4];
      _os_log_impl((void *)&_mh_execute_header, v118, v119, "[%@] Downloaded %d assets", buf, 0x12u);
    }
  }

  v121 = (void *)objc_claimAutoreleasedReturnValue(+[MADStateHandler sharedStateHandler](&OBJC_CLASS___MADStateHandler, "sharedStateHandler"));
  [v121 addBreadcrumb:@"[%@] Downloaded %d assets", self->_logPrefix, *(void *)&type[4]];

  uint64_t v123 = VCPSignPostLog(v122);
  v124 = (os_log_s *)objc_claimAutoreleasedReturnValue(v123);
  v125 = v124;
  if (v130 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v124))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v125,  OS_SIGNPOST_INTERVAL_END,  spid,  "MADPhotosFullAssetProcessingTask_Download",  (const char *)&unk_100199097,  buf,  2u);
  }

  -[VCPTimeMeasurement stop](v131, "stop");
  v126 = (void *)objc_claimAutoreleasedReturnValue( +[VCPMADCoreAnalyticsManager sharedManager]( &OBJC_CLASS___VCPMADCoreAnalyticsManager,  "sharedManager"));
  -[VCPTimeMeasurement elapsedTimeSeconds](v131, "elapsedTimeSeconds");
  objc_msgSend( v126,  "accumulateDoubleValue:forField:andEvent:",  @"TotalDownloadTimeInSeconds",  @"com.apple.mediaanalysisd.FullAnalysisRunSession");
  v127 = VCPCoreAnalyticsFieldForFull(self->_imageOnlyAnalysis, self->_mediaType, self->_mediaSubtype, 1LL);
  v128 = (void *)objc_claimAutoreleasedReturnValue(v127);
  if (v128)
  {
    -[VCPTimeMeasurement elapsedTimeSeconds](v131, "elapsedTimeSeconds");
    objc_msgSend( v126,  "accumulateDoubleValue:forField:andEvent:",  v128,  @"com.apple.mediaanalysisd.FullAnalysisRunSession");
  }
}

- (void)processAssetEntry:(id)a3
{
  id v4 = a3;
  uint64_t v6 = MediaAnalysisLogLevel(v4, v5);
  if ((int)v6 >= 5)
  {
    uint64_t v8 = VCPLogInstance(v6, v7);
    uint64_t v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
    os_log_type_t v10 = VCPLogToOSLogType[5];
    if (os_log_type_enabled(v9, v10))
    {
      logPrefix = self->_logPrefix;
      uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue([v4 asset]);
      uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue([v12 localIdentifier]);
      uint64_t v14 = MediaAnalysisTypeShortDescription([v4 analysisTypes]);
      os_log_type_t v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
      *(_DWORD *)buf = 138412802;
      uint64_t v113 = logPrefix;
      __int16 v114 = 2112;
      uint64_t v115 = v13;
      __int16 v116 = 2112;
      uint64_t v117 = v15;
      _os_log_impl((void *)&_mh_execute_header, v9, v10, "[%@][%@] Processing asset (%@)", buf, 0x20u);
    }
  }

  if (![v4 analysisTypes])
  {
    uint64_t v27 = MediaAnalysisLogLevel(0LL, v16);
    if ((int)v27 >= 6)
    {
      uint64_t v29 = VCPLogInstance(v27, v28);
      id v22 = (os_log_s *)objc_claimAutoreleasedReturnValue(v29);
      os_log_type_t v30 = VCPLogToOSLogType[6];
      if (os_log_type_enabled(v22, v30))
      {
        uint64_t v31 = self->_logPrefix;
        uint64_t v32 = (void *)objc_claimAutoreleasedReturnValue([v4 asset]);
        int v33 = (void *)objc_claimAutoreleasedReturnValue([v32 localIdentifier]);
        *(_DWORD *)buf = 138412546;
        uint64_t v113 = v31;
        __int16 v114 = 2112;
        uint64_t v115 = v33;
        _os_log_impl( (void *)&_mh_execute_header,  v22,  v30,  "[%@][%@] processAssetEntry with nil analysisTypes; skipping",
          buf,
          0x16u);
      }

      goto LABEL_61;
    }

    goto LABEL_62;
  }

  id v17 = [v4 status];
  if (!(_DWORD)v17)
  {
    if ([v4 needDownload])
    {
      uint64_t v34 = (void *)objc_claimAutoreleasedReturnValue([v4 downloadedData]);
      BOOL v35 = v34 == 0LL;

      if (v35)
      {
        uint64_t v53 = MediaAnalysisLogLevel(v36, v37);
        if ((int)v53 >= 4)
        {
          uint64_t v55 = VCPLogInstance(v53, v54);
          __int128 v56 = (os_log_s *)objc_claimAutoreleasedReturnValue(v55);
          os_log_type_t v57 = VCPLogToOSLogType[4];
          if (os_log_type_enabled(v56, v57))
          {
            BOOL v58 = self->_logPrefix;
            uint64_t v59 = (void *)objc_claimAutoreleasedReturnValue([v4 asset]);
            uint64_t v60 = (void *)objc_claimAutoreleasedReturnValue([v59 localIdentifier]);
            *(_DWORD *)buf = 138412546;
            uint64_t v113 = v58;
            __int16 v114 = 2112;
            uint64_t v115 = v60;
            _os_log_impl( (void *)&_mh_execute_header,  v56,  v57,  "[%@][%@] Missing required resource data; skipping",
              buf,
              0x16u);
          }
        }

        [v4 setStatus:4294943494];
        goto LABEL_62;
      }
    }

    id v22 = objc_alloc_init(&OBJC_CLASS___VCPTimeMeasurement);
    -[os_log_s start](v22, "start");
    if (!self->_imageOnlyAnalysis)
    {
      uint64_t v38 = (void *)objc_claimAutoreleasedReturnValue([v4 asset]);
      if ([v38 isVideo])
      {
        id v39 = [v4 analysisTypes];
        BOOL v40 = v39 == (id)VCPMAFullAnalysisTypesThumbnail;

        if (!v40)
        {
          id v41 = objc_alloc(&OBJC_CLASS___VCPMovieAnalyzer);
          uint64_t v42 = (void *)objc_claimAutoreleasedReturnValue([v4 asset]);
          uint64_t v43 = (void *)objc_claimAutoreleasedReturnValue([v4 existingAnalysis]);
          id v44 = [v4 analysisTypes];
          uint64_t v45 = (void *)objc_claimAutoreleasedReturnValue([v4 downloadedData]);
          id v46 = [v41 initWithPHAsset:v42 existingAnalysis:v43 analysisTypes:v44 downloadedData:v45];

          [v46 setAllowStreaming:1];
          uint64_t v47 = (void *)objc_claimAutoreleasedReturnValue(+[MADStateHandler sharedStateHandler](&OBJC_CLASS___MADStateHandler, "sharedStateHandler"));
          [v47 enterKnownTimeoutRisk:2];

          v111[0] = _NSConcreteStackBlock;
          v111[1] = 3221225472LL;
          v111[2] = sub_10006D10C;
          v111[3] = &unk_1001B9E98;
          v111[4] = self;
          uint64_t v48 = (void *)objc_claimAutoreleasedReturnValue([v46 analyzeAsset:v111 streamed:buf]);
          uint64_t v49 = (void *)objc_claimAutoreleasedReturnValue(+[MADStateHandler sharedStateHandler](&OBJC_CLASS___MADStateHandler, "sharedStateHandler"));
          [v49 exitKnownTimeoutRisk];

          uint64_t v50 = (uint64_t)[v46 status];
          id v51 = [v46 errorCode];
          id v52 = [v46 errorLine];
          [v46 status];
LABEL_50:

          if (v50 == 4) {
            unsigned int v95 = -128;
          }
          else {
            unsigned int v95 = -18;
          }
          if (v50 == 2) {
            uint64_t v96 = 0LL;
          }
          else {
            uint64_t v96 = v95;
          }
          [v4 setStatus:v96];
          [v4 setErrorCode:v51];
          [v4 setErrorLine:v52];
          [v4 setAnalysisResults:v48];
          [v4 setExistingAnalysis:0];
          [v4 setDownloadedData:0];
          -[os_log_s stop](v22, "stop");
          -[os_log_s elapsedTimeSeconds](v22, "elapsedTimeSeconds");
          id v97 = objc_msgSend(v4, "setProcessingInterval:");
          uint64_t v99 = MediaAnalysisLogLevel(v97, v98);
          if ((int)v99 >= 6)
          {
            uint64_t v101 = VCPLogInstance(v99, v100);
            uint64_t v102 = (os_log_s *)objc_claimAutoreleasedReturnValue(v101);
            os_log_type_t v103 = VCPLogToOSLogType[6];
            if (os_log_type_enabled(v102, v103))
            {
              os_log_type_t v104 = self->_logPrefix;
              uint64_t v105 = (void *)objc_claimAutoreleasedReturnValue([v4 asset]);
              uint64_t v106 = (void *)objc_claimAutoreleasedReturnValue([v105 localIdentifier]);
              [v4 processingInterval];
              *(_DWORD *)buf = 138412802;
              uint64_t v113 = v104;
              __int16 v114 = 2112;
              uint64_t v115 = v106;
              __int16 v116 = 2048;
              uint64_t v117 = v107;
              _os_log_impl( (void *)&_mh_execute_header,  v102,  v103,  "[%@][%@] Processing asset done (interval: %.2fs)",  buf,  0x20u);
            }
          }

          goto LABEL_61;
        }
      }

      else
      {
      }
    }

    if (((unint64_t)[v4 analysisTypes] & 0xFFFFFFFFCBFFFFFFLL) != 0)
    {
      id v61 = objc_alloc(&OBJC_CLASS___VCPPhotoAnalyzer);
      os_signpost_id_t v62 = (void *)objc_claimAutoreleasedReturnValue([v4 asset]);
      os_signpost_id_t v63 = (void *)objc_claimAutoreleasedReturnValue([v4 existingAnalysis]);
      unint64_t v64 = (unint64_t)[v4 analysisTypes];
      uint64_t v65 = (void *)objc_claimAutoreleasedReturnValue([v4 downloadedData]);
      id v66 = [v61 initWithPHAsset:v62 existingAnalysis:v63 analysisTypes:v64 & 0xFFFFFFFFCBFFFFFFLL downloadedData:v65];

      [v66 setAllowStreaming:1];
      uint64_t v67 = (void *)objc_claimAutoreleasedReturnValue( +[VCPPhotoAnalyzerSharedContext sharedContext]( &OBJC_CLASS___VCPPhotoAnalyzerSharedContext,  "sharedContext"));
      [v66 setSharedContext:v67];

      v110[0] = _NSConcreteStackBlock;
      v110[1] = 3221225472LL;
      v110[2] = sub_10006D1B4;
      v110[3] = &unk_1001B9E98;
      v110[4] = self;
      os_log_type_t v68 = (void *)objc_claimAutoreleasedReturnValue([v66 analyzeAsset:v110 withOptions:0]);
      id v46 = [v68 mutableCopy];

      uint64_t v50 = (uint64_t)[v66 status];
      id v51 = [v66 errorCode];
      id v52 = [v66 errorLine];

      if (v50 != 2)
      {
LABEL_42:
        if (v46)
        {
          if (self->_imageOnlyAnalysis)
          {
            os_log_type_t v89 = (void *)objc_claimAutoreleasedReturnValue([v4 asset]);
            unsigned int v90 = [v89 isVideo];

            if (v90)
            {
              uint64_t v91 = (void *)objc_claimAutoreleasedReturnValue([v4 existingAnalysis]);
              BOOL v92 = v91 == 0LL;

              if (v92)
              {
                objc_msgSend(v46, "vcp_setFlags:", 0x40000);
              }

              else
              {
                uint64_t v93 = (void *)objc_claimAutoreleasedReturnValue([v4 existingAnalysis]);
                objc_msgSend(v46, "vcp_setFlags:", (unint64_t)objc_msgSend(v93, "vcp_flags") & 0x40000);

                uint64_t v94 = (void *)objc_claimAutoreleasedReturnValue([v4 existingAnalysis]);
                objc_msgSend(v46, "vcp_setVersion:", objc_msgSend(v94, "vcp_version"));
              }
            }
          }

          id v46 = v46;
          uint64_t v48 = v46;
        }

        else
        {
          uint64_t v48 = 0LL;
        }

        goto LABEL_50;
      }
    }

    else
    {
      uint64_t v69 = (void *)objc_claimAutoreleasedReturnValue([v4 existingAnalysis]);
      id v46 = [v69 mutableCopy];

      id v51 = 0LL;
      id v52 = 0LL;
    }

    if (((unint64_t)[v4 analysisTypes] & 0x34000000) != 0)
    {
      uint64_t v70 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v46, "vcp_results"));
      unint64_t v108 = (void *)objc_claimAutoreleasedReturnValue([v70 objectForKeyedSubscript:MediaAnalysisMovieSummaryResultsKey]);

      id v71 = [v108 count];
      if (v71
        && (BOOL v73 = (void *)objc_claimAutoreleasedReturnValue([v108 objectAtIndexedSubscript:0]),
            BOOL v74 = ((unint64_t)objc_msgSend(v73, "vcp_flags") & 0x80000) == 0,
            v73,
            !v74))
      {
        id v82 = objc_alloc(&OBJC_CLASS___VCPPhotoAnalyzer);
        uint64_t v83 = (void *)objc_claimAutoreleasedReturnValue([v4 asset]);
        unsigned int v84 = [v4 analysisTypes];
        uint64_t v85 = (void *)objc_claimAutoreleasedReturnValue([v4 downloadedData]);
        id v86 = [v82 initWithPHAsset:v83 existingAnalysis:0 analysisTypes:v84 & 0x34000000 downloadedData:v85];

        [v86 setAllowStreaming:1];
        v109[0] = _NSConcreteStackBlock;
        v109[1] = 3221225472LL;
        v109[2] = sub_10006D25C;
        v109[3] = &unk_1001B9E98;
        v109[4] = self;
        uint64_t v87 = (void *)objc_claimAutoreleasedReturnValue([v86 analyzeAsset:v109 withOptions:0]);
        uint64_t v50 = (uint64_t)[v86 status];
        id v51 = [v86 errorCode];
        id v52 = [v86 errorLine];
        if (v50 == 2)
        {
          uint64_t v88 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v87, "vcp_results"));
          objc_msgSend(v46, "vcp_addEntriesFromResults:", v88);

          objc_msgSend(v46, "vcp_addTypes:", (unint64_t)objc_msgSend(v4, "analysisTypes") & 0x34000000);
        }
      }

      else
      {
        uint64_t v75 = MediaAnalysisLogLevel(v71, v72);
        if ((int)v75 >= 5)
        {
          uint64_t v77 = VCPLogInstance(v75, v76);
          uint64_t v78 = (os_log_s *)objc_claimAutoreleasedReturnValue(v77);
          os_log_type_t v79 = VCPLogToOSLogType[5];
          if (os_log_type_enabled(v78, v79))
          {
            uint64_t v80 = (void *)objc_claimAutoreleasedReturnValue([v4 asset]);
            uint64_t v81 = (NSString *)objc_claimAutoreleasedReturnValue([v80 localIdentifier]);
            *(_DWORD *)buf = 138412290;
            uint64_t v113 = v81;
            _os_log_impl( (void *)&_mh_execute_header,  v78,  v79,  "  [%@] Pre-gating for stabilization not passed.",  buf,  0xCu);
          }
        }

        objc_msgSend(v46, "vcp_addTypes:", (unint64_t)objc_msgSend(v4, "analysisTypes") & 0x34000000);
        uint64_t v50 = 2LL;
      }
    }

    else
    {
      uint64_t v50 = 2LL;
    }

    goto LABEL_42;
  }

  uint64_t v19 = MediaAnalysisLogLevel(v17, v18);
  if ((int)v19 >= 4)
  {
    uint64_t v21 = VCPLogInstance(v19, v20);
    id v22 = (os_log_s *)objc_claimAutoreleasedReturnValue(v21);
    os_log_type_t v23 = VCPLogToOSLogType[4];
    if (os_log_type_enabled(v22, v23))
    {
      uint64_t v24 = self->_logPrefix;
      uint64_t v25 = (void *)objc_claimAutoreleasedReturnValue([v4 asset]);
      uint64_t v26 = (void *)objc_claimAutoreleasedReturnValue([v25 localIdentifier]);
      *(_DWORD *)buf = 138412546;
      uint64_t v113 = v24;
      __int16 v114 = 2112;
      uint64_t v115 = v26;
      _os_log_impl((void *)&_mh_execute_header, v22, v23, "[%@][%@] Asset has failure status; skipping", buf, 0x16u);
    }

- (unint64_t)concurrentAssetCount
{
  if (self->_imageOnlyAnalysis && (DeviceHasANE() & 1) != 0) {
    return 4LL;
  }
  else {
    return 1LL;
  }
}

- (unint64_t)_processAssetsConcurrently:(int64_t)a3
{
  id v4 = dispatch_semaphore_create(a3);
  uint64_t v5 = dispatch_group_create();
  qos_class_t v6 = qos_class_self();
  dispatch_queue_global_t global_queue = dispatch_get_global_queue(v6, 0LL);
  uint64_t v8 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(global_queue);
  unint64_t v9 = 0LL;
  os_log_type_t type = VCPLogToOSLogType[5];
  *(void *)&__int128 v10 = 138412290LL;
  __int128 v27 = v10;
  while (v9 < (unint64_t)-[NSMutableArray count](self->_assetEntries, "count", v27))
  {
    uint64_t v11 = objc_autoreleasePoolPush();
    dispatch_semaphore_wait(v4, 0xFFFFFFFFFFFFFFFFLL);
    uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(+[VCPWatchdog sharedWatchdog](&OBJC_CLASS___VCPWatchdog, "sharedWatchdog"));
    [v12 pet];

    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue(-[MADProcessingTask cancelBlock](self, "cancelBlock"));
    if (!v13) {
      goto LABEL_10;
    }
    uint64_t v14 = (uint64_t (**)(void))objc_claimAutoreleasedReturnValue(-[MADProcessingTask cancelBlock](self, "cancelBlock"));
    int v15 = v14[2]();

    if (v15)
    {
      uint64_t v18 = MediaAnalysisLogLevel(v16, v17);
      if ((int)v18 >= 5)
      {
        uint64_t v20 = VCPLogInstance(v18, v19);
        uint64_t v21 = (os_log_s *)objc_claimAutoreleasedReturnValue(v20);
        if (os_log_type_enabled(v21, type))
        {
          logPrefix = self->_logPrefix;
          *(_DWORD *)buf = v27;
          int v33 = logPrefix;
          _os_log_impl((void *)&_mh_execute_header, v21, type, "[%@] Processing canceled", buf, 0xCu);
        }
      }

      dispatch_semaphore_signal(v4);
      int v23 = 0;
    }

    else
    {
LABEL_10:
      uint64_t v24 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray objectAtIndexedSubscript:](self->_assetEntries, "objectAtIndexedSubscript:", v9));
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472LL;
      block[2] = sub_10006D5FC;
      block[3] = &unk_1001BBE70;
      block[4] = self;
      id v30 = v24;
      uint64_t v31 = v4;
      id v25 = v24;
      dispatch_group_async(v5, v8, block);

      int v23 = 1;
    }

    objc_autoreleasePoolPop(v11);
    if (!v23) {
      break;
    }
    ++v9;
  }

  dispatch_group_wait(v5, 0xFFFFFFFFFFFFFFFFLL);

  return v9;
}

- (unint64_t)_processAssetsSerially
{
  unint64_t v3 = 0LL;
  if (-[NSMutableArray count](self->_assetEntries, "count"))
  {
    while (1)
    {
      id v4 = objc_autoreleasePoolPush();
      uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(+[VCPWatchdog sharedWatchdog](&OBJC_CLASS___VCPWatchdog, "sharedWatchdog"));
      [v5 pet];

      qos_class_t v6 = (void *)objc_claimAutoreleasedReturnValue(-[MADProcessingTask cancelBlock](self, "cancelBlock"));
      if (v6)
      {
        uint64_t v7 = (uint64_t (**)(void))objc_claimAutoreleasedReturnValue(-[MADProcessingTask cancelBlock](self, "cancelBlock"));
        int v8 = v7[2]();

        if (v8) {
          break;
        }
      }

      uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray objectAtIndexedSubscript:](self->_assetEntries, "objectAtIndexedSubscript:", v3));
      uint64_t v12 = VCPSignPostLog(v11);
      uint64_t v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
      os_signpost_id_t v14 = os_signpost_id_generate(v13);

      uint64_t v16 = VCPSignPostLog(v15);
      uint64_t v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);
      uint64_t v18 = v17;
      if (v14 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v17))
      {
        LOWORD(v29) = 0;
        _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v18,  OS_SIGNPOST_INTERVAL_BEGIN,  v14,  "MADPhotosFullAssetProcessingTask_ProcessAsset",  (const char *)&unk_100199097,  (uint8_t *)&v29,  2u);
      }

      uint64_t v19 = VCPSignPostLog(-[MADPhotosFullAssetProcessingTask processAssetEntry:](self, "processAssetEntry:", v11));
      uint64_t v20 = (os_log_s *)objc_claimAutoreleasedReturnValue(v19);
      uint64_t v21 = v20;
      if (v14 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v20))
      {
        LOWORD(v29) = 0;
        _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v21,  OS_SIGNPOST_INTERVAL_END,  v14,  "MADPhotosFullAssetProcessingTask_ProcessAsset",  (const char *)&unk_100199097,  (uint8_t *)&v29,  2u);
      }

      objc_autoreleasePoolPop(v4);
    }

    uint64_t v22 = MediaAnalysisLogLevel(v9, v10);
    if ((int)v22 >= 5)
    {
      uint64_t v24 = VCPLogInstance(v22, v23);
      id v25 = (os_log_s *)objc_claimAutoreleasedReturnValue(v24);
      os_log_type_t v26 = VCPLogToOSLogType[5];
      if (os_log_type_enabled(v25, v26))
      {
        logPrefix = self->_logPrefix;
        int v29 = 138412290;
        id v30 = logPrefix;
        _os_log_impl((void *)&_mh_execute_header, v25, v26, "[%@] Processing canceled", (uint8_t *)&v29, 0xCu);
      }
    }

    objc_autoreleasePoolPop(v4);
  }

  return v3;
}

- (int)_process
{
  uint64_t v54 = objc_alloc_init(&OBJC_CLASS___VCPTimeMeasurement);
  uint64_t v3 = VCPSignPostLog(-[VCPTimeMeasurement start](v54, "start"));
  id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  os_signpost_id_t v5 = os_signpost_id_generate(v4);

  uint64_t v7 = VCPSignPostLog(v6);
  int v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
  uint64_t v9 = v8;
  os_signpost_id_t v52 = v5 - 1;
  if (v5 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v8))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v9,  OS_SIGNPOST_INTERVAL_BEGIN,  v5,  "MADPhotosFullAssetProcessingTask_Process",  (const char *)&unk_100199097,  buf,  2u);
  }

  uint64_t v12 = MediaAnalysisLogLevel(v10, v11);
  if ((int)v12 >= 6)
  {
    uint64_t v14 = VCPLogInstance(v12, v13);
    uint64_t v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
    os_log_type_t v16 = VCPLogToOSLogType[6];
    if (os_log_type_enabled(v15, v16))
    {
      os_signpost_id_t v17 = v5;
      logPrefix = self->_logPrefix;
      unsigned int v19 = -[NSMutableArray count](self->_assetEntries, "count");
      uint64_t v20 = qos_class_self();
      uint64_t v21 = VCPMAQoSDescription(v20);
      uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue(v21);
      *(_DWORD *)buf = 138412802;
      os_log_type_t v57 = logPrefix;
      __int16 v58 = 1024;
      LODWORD(v59[0]) = v19;
      WORD2(v59[0]) = 2112;
      *(void *)((char *)v59 + 6) = v22;
      _os_log_impl((void *)&_mh_execute_header, v15, v16, "[%@] Processing %d assets (QoS: %@)", buf, 0x1Cu);

      os_signpost_id_t v5 = v17;
    }
  }

  unint64_t v23 = -[MADPhotosFullAssetProcessingTask concurrentAssetCount](self, "concurrentAssetCount", v52);
  if (v23 < 2) {
    unint64_t v24 = -[MADPhotosFullAssetProcessingTask _processAssetsSerially](self, "_processAssetsSerially", v23);
  }
  else {
    unint64_t v24 = -[MADPhotosFullAssetProcessingTask _processAssetsConcurrently:](self, "_processAssetsConcurrently:", v23);
  }
  unint64_t v25 = v24;
  os_log_type_t type = VCPLogToOSLogType[7];
  while (1)
  {
    id v26 = -[NSMutableArray count](self->_assetEntries, "count");
    uint64_t v28 = objc_autoreleasePoolPush();
    int v29 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray objectAtIndexedSubscript:](self->_assetEntries, "objectAtIndexedSubscript:", v25));
    uint64_t v31 = MediaAnalysisLogLevel(v29, v30);
    if ((int)v31 >= 7)
    {
      uint64_t v33 = VCPLogInstance(v31, v32);
      uint64_t v34 = (os_log_s *)objc_claimAutoreleasedReturnValue(v33);
      if (os_log_type_enabled(v34, type))
      {
        os_signpost_id_t v35 = v5;
        uint64_t v36 = self->_logPrefix;
        uint64_t v37 = (void *)objc_claimAutoreleasedReturnValue([v29 asset]);
        uint64_t v38 = (void *)objc_claimAutoreleasedReturnValue([v37 localIdentifier]);
        *(_DWORD *)buf = 138412546;
        os_log_type_t v57 = v36;
        __int16 v58 = 2112;
        v59[0] = v38;
        _os_log_impl((void *)&_mh_execute_header, v34, type, "[%@][%@] Marking asset as canceled", buf, 0x16u);

        os_signpost_id_t v5 = v35;
      }
    }

    [v29 setStatus:4294967168];
    [v29 setExistingAnalysis:0];
    [v29 setDownloadedData:0];

    objc_autoreleasePoolPop(v28);
    ++v25;
  }

  uint64_t v39 = MediaAnalysisLogLevel(v26, v27);
  if ((int)v39 >= 6)
  {
    uint64_t v41 = VCPLogInstance(v39, v40);
    uint64_t v42 = (os_log_s *)objc_claimAutoreleasedReturnValue(v41);
    os_log_type_t v43 = VCPLogToOSLogType[6];
    if (os_log_type_enabled(v42, v43))
    {
      id v44 = self->_logPrefix;
      *(_DWORD *)buf = 138412290;
      os_log_type_t v57 = v44;
      _os_log_impl((void *)&_mh_execute_header, v42, v43, "[%@] Processing assets done", buf, 0xCu);
    }
  }

  uint64_t v45 = VCPSignPostLog(v39);
  id v46 = (os_log_s *)objc_claimAutoreleasedReturnValue(v45);
  uint64_t v47 = v46;
  if (v53 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v46))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v47,  OS_SIGNPOST_INTERVAL_END,  v5,  "MADPhotosFullAssetProcessingTask_Process",  (const char *)&unk_100199097,  buf,  2u);
  }

  -[VCPTimeMeasurement stop](v54, "stop");
  uint64_t v48 = (void *)objc_claimAutoreleasedReturnValue(+[VCPMADCoreAnalyticsManager sharedManager](&OBJC_CLASS___VCPMADCoreAnalyticsManager, "sharedManager"));
  -[VCPTimeMeasurement elapsedTimeSeconds](v54, "elapsedTimeSeconds");
  objc_msgSend( v48,  "accumulateDoubleValue:forField:andEvent:",  @"TotalProcessTimeInSeconds",  @"com.apple.mediaanalysisd.FullAnalysisRunSession");
  uint64_t v49 = VCPCoreAnalyticsFieldForFull(self->_imageOnlyAnalysis, self->_mediaType, self->_mediaSubtype, 3LL);
  uint64_t v50 = (void *)objc_claimAutoreleasedReturnValue(v49);
  if (v50)
  {
    -[VCPTimeMeasurement elapsedTimeSeconds](v54, "elapsedTimeSeconds");
    objc_msgSend( v48,  "accumulateDoubleValue:forField:andEvent:",  v50,  @"com.apple.mediaanalysisd.FullAnalysisRunSession");
  }

  return 0;
}

- (void)process
{
  if (!self->_status) {
    self->_status = -[MADPhotosFullAssetProcessingTask _process](self, "_process");
  }
}

- (int)_publish
{
  v249 = objc_alloc_init(&OBJC_CLASS___VCPTimeMeasurement);
  uint64_t v2 = VCPSignPostLog(-[VCPTimeMeasurement start](v249, "start"));
  uint64_t v3 = (os_log_s *)objc_claimAutoreleasedReturnValue(v2);
  os_signpost_id_t v4 = os_signpost_id_generate(v3);

  uint64_t v6 = VCPSignPostLog(v5);
  uint64_t v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
  int v8 = v7;
  unint64_t v245 = v4 - 1;
  os_signpost_id_t spid = v4;
  if (v4 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v7))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v8,  OS_SIGNPOST_INTERVAL_BEGIN,  v4,  "MADPhotosFullAssetProcessingTask_Publish",  (const char *)&unk_100199097,  buf,  2u);
  }

  uint64_t v11 = MediaAnalysisLogLevel(v9, v10);
  unint64_t v13 = (unint64_t)@"No";
  if ((int)v11 >= 5)
  {
    uint64_t v14 = VCPLogInstance(v11, v12);
    uint64_t v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
    os_log_type_t v16 = VCPLogToOSLogType[5];
    if (os_log_type_enabled(v15, v16))
    {
      logPrefix = self->_logPrefix;
      unsigned int v18 = -[NSMutableArray count](self->_assetEntries, "count");
      if (self->_imageOnlyAnalysis) {
        unsigned int v19 = @"Yes";
      }
      else {
        unsigned int v19 = @"No";
      }
      uint64_t v20 = qos_class_self();
      uint64_t v21 = VCPMAQoSDescription(v20);
      id v22 = (id)objc_claimAutoreleasedReturnValue(v21);
      *(_DWORD *)buf = 138413058;
      v272 = logPrefix;
      __int16 v273 = 1024;
      unsigned int v274 = v18;
      __int16 v275 = 2112;
      v276 = v19;
      __int16 v277 = 2112;
      id v278 = v22;
      _os_log_impl( (void *)&_mh_execute_header,  v15,  v16,  "[%@] Persisting %d assets (imageOnly:%@) (QoS: %@)",  buf,  0x26u);
    }
  }

  unint64_t v23 = (void *)objc_claimAutoreleasedReturnValue(+[MADStateHandler sharedStateHandler](&OBJC_CLASS___MADStateHandler, "sharedStateHandler"));
  unint64_t v24 = self->_logPrefix;
  id v25 = -[NSMutableArray count](self->_assetEntries, "count");
  if (self->_imageOnlyAnalysis) {
    id v26 = @"Yes";
  }
  else {
    id v26 = @"No";
  }
  [v23 addBreadcrumb:@"[%@] Persisting %d assets, (imageOnly:%@)", v24, v25, v26];

  if (-[NSMutableArray count](self->_assetEntries, "count"))
  {
    v254 = (void *)objc_claimAutoreleasedReturnValue( +[VCPPhotosAssetChangeManager managerForPhotoLibrary:]( &OBJC_CLASS___VCPPhotosAssetChangeManager,  "managerForPhotoLibrary:",  self->_photoLibrary));
    if (v254)
    {
      uint64_t v28 = objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
      __int128 v268 = 0u;
      __int128 v269 = 0u;
      __int128 v266 = 0u;
      __int128 v267 = 0u;
      obj = self->_assetEntries;
      v248 = (void *)v28;
      id v29 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( obj,  "countByEnumeratingWithState:objects:count:",  &v266,  v270,  16LL);
      if (!v29)
      {
        int v250 = 0;
        goto LABEL_219;
      }

      int v250 = 0;
      uint64_t v259 = *(void *)v267;
      os_log_type_t v251 = VCPLogToOSLogType[3];
      uint64_t v243 = MediaAnalysisKeyFrameResourceResultsKey;
      unint64_t v247 = MediaAnalysisVersion;
      os_log_type_t v255 = VCPLogToOSLogType[6];
      os_log_type_t type = VCPLogToOSLogType[7];
      int v244 = VCPPhotosCaptionProcessingVersion;
      while (1)
      {
        uint64_t v30 = 0LL;
        id v260 = v29;
        do
        {
          if (*(void *)v267 != v259) {
            objc_enumerationMutation(obj);
          }
          uint64_t v262 = v30;
          uint64_t v31 = *(void **)(*((void *)&v266 + 1) + 8 * v30);
          context = objc_autoreleasePoolPush();
          uint64_t v32 = self->_logPrefix;
          uint64_t v33 = (void *)objc_claimAutoreleasedReturnValue([v31 asset]);
          uint64_t v34 = (void *)objc_claimAutoreleasedReturnValue([v33 localIdentifier]);
          v263 = (NSString *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"[%@][%@]",  v32,  v34));

          if (![v31 analysisTypes])
          {
            id v48 = [v31 isAnalysisFromComputeSync];
            if ((_DWORD)v48)
            {
              uint64_t v50 = MediaAnalysisLogLevel(v48, v49);
              if ((int)v50 >= 6)
              {
                uint64_t v52 = VCPLogInstance(v50, v51);
                unint64_t v53 = (os_log_s *)objc_claimAutoreleasedReturnValue(v52);
                if (os_log_type_enabled(v53, v255))
                {
                  *(_DWORD *)buf = 138412290;
                  v272 = v263;
                  _os_log_impl( (void *)&_mh_execute_header,  v53,  v255,  "%@ Storing existing analysis results from compute sync into MA DB",  buf,  0xCu);
                }
              }

              analysisDatabase = self->_analysisDatabase;
              uint64_t v55 = (void *)objc_claimAutoreleasedReturnValue([v31 asset]);
              __int128 v56 = (void *)objc_claimAutoreleasedReturnValue([v31 existingAnalysis]);
              id v57 = (id)-[VCPDatabaseWriter storeAnalysisForAsset:analysis:]( analysisDatabase,  "storeAnalysisForAsset:analysis:",  v55,  v56);

              if ((_DWORD)v57 == -108 || (_DWORD)v57 == -36)
              {
                __int16 v58 = (const __CFString *)v57;
              }

              else
              {
                __int16 v58 = (const __CFString *)v57;
                if ((_DWORD)v57 != -23) {
                  __int16 v58 = (const __CFString *)v13;
                }
              }

              int v94 = 1;
              if ((_DWORD)v57 == -108 || (_DWORD)v57 == -36 || (_DWORD)v57 == -23)
              {
                unint64_t v13 = (unint64_t)v58;
                goto LABEL_178;
              }

              if (+[VCPVideoCNNAnalyzer isMUBackboneEnabled]( &OBJC_CLASS___VCPVideoCNNAnalyzer,  "isMUBackboneEnabled"))
              {
                v127 = (void *)objc_claimAutoreleasedReturnValue([v31 asset]);
                v128 = (void *)objc_claimAutoreleasedReturnValue([v127 localIdentifier]);
                v129 = (void *)objc_claimAutoreleasedReturnValue([v31 existingAnalysis]);
                unint64_t v130 = (void *)objc_claimAutoreleasedReturnValue( +[VSKAsset mad_assetsWithLocalIdentifier:mediaAnalysisResults:]( &OBJC_CLASS___VSKAsset,  "mad_assetsWithLocalIdentifier:mediaAnalysisResults:",  v128,  v129));

                [v248 addObjectsFromArray:v130];
              }
            }

            else
            {
              __int16 v58 = (const __CFString *)v13;
            }

            uint64_t v59 = (void *)objc_claimAutoreleasedReturnValue([v31 asset]);
            uint64_t v60 = (void *)objc_claimAutoreleasedReturnValue([v59 mediaAnalysisProperties]);

            if (self->_imageOnlyAnalysis)
            {
              if (!v60)
              {
                id v61 = [0 mediaAnalysisImageVersion];
                if ((int)v247 <= (int)v61)
                {
                  id v61 = [0 imageCaptionVersion];
                }
              }

- (void)publish
{
  if (!self->_status) {
    self->_status = -[MADPhotosFullAssetProcessingTask _publish](self, "_publish");
  }
}

- (void)_reportCoreAnalyticsWithEntry:(id)a3 analyticManager:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v9 = MediaAnalysisLogLevel(v7, v8);
  if ((int)v9 >= 7)
  {
    uint64_t v11 = VCPLogInstance(v9, v10);
    uint64_t v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
    os_log_type_t v13 = VCPLogToOSLogType[7];
    if (os_log_type_enabled(v12, v13))
    {
      logPrefix = self->_logPrefix;
      uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue([v6 asset]);
      os_log_type_t v16 = (void *)objc_claimAutoreleasedReturnValue([v15 localIdentifier]);
      *(_DWORD *)buf = 138412546;
      id v57 = logPrefix;
      __int16 v58 = 2112;
      uint64_t v59 = v16;
      _os_log_impl( (void *)&_mh_execute_header,  v12,  v13,  "[%@] Prepare to report CoreAnalytics for asset %@ ... ",  buf,  0x16u);
    }
  }

  os_signpost_id_t v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  unsigned int v18 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithBool:]( NSNumber,  "numberWithBool:",  [v6 status] == 0));
  [v17 setObject:v18 forKeyedSubscript:@"AnalyzeSuccess"];

  unsigned int v19 = (void *)objc_claimAutoreleasedReturnValue([v6 asset]);
  uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "vcp_typeDescription"));
  [v17 setObject:v20 forKeyedSubscript:@"AssetType"];

  [v6 processingInterval];
  uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:"));
  [v17 setObject:v21 forKeyedSubscript:@"TimeAnalyzing"];

  id v22 = (void *)objc_claimAutoreleasedReturnValue([v6 asset]);
  if (objc_msgSend(v22, "vcp_isLivePhoto"))
  {
  }

  else
  {
    unint64_t v23 = (void *)objc_claimAutoreleasedReturnValue([v6 asset]);
    unsigned int v24 = [v23 isVideo];

    if (!v24) {
      goto LABEL_10;
    }
  }

  id v25 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithBool:]( NSNumber,  "numberWithBool:",  [v6 needDownload]));
  [v17 setObject:v25 forKeyedSubscript:@"IsStreamAnalysis"];

  id v26 = (void *)objc_claimAutoreleasedReturnValue([v6 asset]);
  unsigned int v27 = [v26 isVideo];

  if (v27)
  {
    uint64_t v28 = (void *)objc_claimAutoreleasedReturnValue([v6 asset]);
    [v28 duration];
    id v29 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:"));
    [v17 setObject:v29 forKeyedSubscript:@"LengthOfMovieContentInSeconds"];
  }

- (void)_reportCoreAnalyticsForSession
{
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue(+[VCPMADCoreAnalyticsManager sharedManager](&OBJC_CLASS___VCPMADCoreAnalyticsManager, "sharedManager"));
  unint64_t v3 = atomic_load(&qword_1001E6488);
  [v2 accumulateInt64Value:v3 forField:@"NumberOfAssetsSteamed" andEvent:@"com.apple.mediaanalysisd.FullAnalysisRunSession"];

  os_signpost_id_t v4 = (void *)objc_claimAutoreleasedReturnValue(+[VCPMADCoreAnalyticsManager sharedManager](&OBJC_CLASS___VCPMADCoreAnalyticsManager, "sharedManager"));
  unint64_t v5 = atomic_load(&qword_1001E6490);
  [v4 accumulateInt64Value:v5 forField:@"NumberOfAssetsNoResourceFullResource" andEvent:@"com.apple.mediaanalysisd.FullAnalysisRunSession"];

  id v6 = (void *)objc_claimAutoreleasedReturnValue(+[VCPMADCoreAnalyticsManager sharedManager](&OBJC_CLASS___VCPMADCoreAnalyticsManager, "sharedManager"));
  unint64_t v7 = atomic_load(&qword_1001E6498);
  [v6 accumulateInt64Value:v7 forField:@"NumberOfAssetsNoResourcePartialResource" andEvent:@"com.apple.mediaanalysisd.FullAnalysisRunSession"];

  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(+[VCPMADCoreAnalyticsManager sharedManager](&OBJC_CLASS___VCPMADCoreAnalyticsManager, "sharedManager"));
  unint64_t v9 = atomic_load(&qword_1001E64A0);
  [v8 accumulateInt64Value:v9 forField:@"NumberOfAssetsSoftFailureFullResource" andEvent:@"com.apple.mediaanalysisd.FullAnalysisRunSession"];

  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(+[VCPMADCoreAnalyticsManager sharedManager](&OBJC_CLASS___VCPMADCoreAnalyticsManager, "sharedManager"));
  unint64_t v11 = atomic_load(&qword_1001E64A8);
  [v10 accumulateInt64Value:v11 forField:@"NumberOfAssetsSoftFailurePartialResource" andEvent:@"com.apple.mediaanalysisd.FullAnalysisRunSession"];

  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(+[VCPMADCoreAnalyticsManager sharedManager](&OBJC_CLASS___VCPMADCoreAnalyticsManager, "sharedManager"));
  unint64_t v13 = atomic_load(&qword_1001E64B0);
  [v12 accumulateInt64Value:v13 forField:@"NumberOfAssetsHardFailureFullResource" andEvent:@"com.apple.mediaanalysisd.FullAnalysisRunSession"];

  uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue(+[VCPMADCoreAnalyticsManager sharedManager](&OBJC_CLASS___VCPMADCoreAnalyticsManager, "sharedManager"));
  unint64_t v15 = atomic_load(&qword_1001E64B8);
  [v14 accumulateInt64Value:v15 forField:@"NumberOfAssetsHardFailurePartialResource" andEvent:@"com.apple.mediaanalysisd.FullAnalysisRunSession"];

  os_log_type_t v16 = (void *)objc_claimAutoreleasedReturnValue(+[VCPMADCoreAnalyticsManager sharedManager](&OBJC_CLASS___VCPMADCoreAnalyticsManager, "sharedManager"));
  unint64_t v17 = atomic_load(&qword_1001E64C0);
  [v16 accumulateInt64Value:v17 forField:@"NumberOfMoviesAnalyzedFullResource" andEvent:@"com.apple.mediaanalysisd.FullAnalysisRunSession"];

  unsigned int v18 = (void *)objc_claimAutoreleasedReturnValue(+[VCPMADCoreAnalyticsManager sharedManager](&OBJC_CLASS___VCPMADCoreAnalyticsManager, "sharedManager"));
  unint64_t v19 = atomic_load(&qword_1001E64C8);
  [v18 accumulateInt64Value:v19 forField:@"NumberOfMoviesAnalyzedPartialResource" andEvent:@"com.apple.mediaanalysisd.FullAnalysisRunSession"];

  uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue(+[VCPMADCoreAnalyticsManager sharedManager](&OBJC_CLASS___VCPMADCoreAnalyticsManager, "sharedManager"));
  unint64_t v21 = atomic_load(&qword_1001E64D0);
  [v20 accumulateInt64Value:v21 forField:@"NumberOfLivePhotosAnalyzedFullResource" andEvent:@"com.apple.mediaanalysisd.FullAnalysisRunSession"];

  id v22 = (void *)objc_claimAutoreleasedReturnValue(+[VCPMADCoreAnalyticsManager sharedManager](&OBJC_CLASS___VCPMADCoreAnalyticsManager, "sharedManager"));
  unint64_t v23 = atomic_load(&qword_1001E64D8);
  [v22 accumulateInt64Value:v23 forField:@"NumberOfLivePhotosAnalyzedPartialResource" andEvent:@"com.apple.mediaanalysisd.FullAnalysisRunSession"];

  unsigned int v24 = (void *)objc_claimAutoreleasedReturnValue(+[VCPMADCoreAnalyticsManager sharedManager](&OBJC_CLASS___VCPMADCoreAnalyticsManager, "sharedManager"));
  unint64_t v25 = atomic_load(&qword_1001E64E0);
  [v24 accumulateInt64Value:v25 forField:@"NumberOfPhotosAnalyzedFullResource" andEvent:@"com.apple.mediaanalysisd.FullAnalysisRunSession"];

  id v26 = (void *)objc_claimAutoreleasedReturnValue(+[VCPMADCoreAnalyticsManager sharedManager](&OBJC_CLASS___VCPMADCoreAnalyticsManager, "sharedManager"));
  unint64_t v27 = atomic_load(&qword_1001E64E8);
  [v26 accumulateInt64Value:v27 forField:@"NumberOfPhotosAnalyzedPartialResource" andEvent:@"com.apple.mediaanalysisd.FullAnalysisRunSession"];

  atomic_store(0LL, &qword_1001E6488);
  atomic_store(0LL, &qword_1001E6490);
  atomic_store(0LL, &qword_1001E6498);
  atomic_store(0LL, &qword_1001E64A0);
  atomic_store(0LL, &qword_1001E64A8);
  atomic_store(0LL, &qword_1001E64B0);
  atomic_store(0LL, &qword_1001E64B8);
  atomic_store(0LL, &qword_1001E64C0);
  atomic_store(0LL, &qword_1001E64C8);
  atomic_store(0LL, &qword_1001E64D0);
  atomic_store(0LL, &qword_1001E64D8);
  atomic_store(0LL, &qword_1001E64E0);
  atomic_store(0LL, &qword_1001E64E8);
}

- (void).cxx_destruct
{
}

@end