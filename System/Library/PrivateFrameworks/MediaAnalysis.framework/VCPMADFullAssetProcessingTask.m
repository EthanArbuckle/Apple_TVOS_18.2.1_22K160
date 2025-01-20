@interface VCPMADFullAssetProcessingTask
+ (id)taskWithPhotoLibrary:(id)a3 localIdentifiers:(id)a4;
- (BOOL)shouldSkipAnalysisForAsset:(id)a3 withResources:(id)a4 logPrefix:(id)a5;
- (VCPMADFullAssetProcessingTask)initWithPhotoLibrary:(id)a3 localIdentifiers:(id)a4;
- (int)mainInternal;
- (int)processAsset:(id)a3;
- (int)processAssetsWithProgressReporter:(id)a3;
- (int)processPendingBatch;
- (void)resetPendingBatch;
@end

@implementation VCPMADFullAssetProcessingTask

- (VCPMADFullAssetProcessingTask)initWithPhotoLibrary:(id)a3 localIdentifiers:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = -[VCPTask initWithPhotoLibrary:](self, "initWithPhotoLibrary:", v6);
  v9 = v8;
  if (!v8) {
    goto LABEL_3;
  }
  objc_storeStrong((id *)&v8->_pendingBatch, a4);
  uint64_t v10 = objc_claimAutoreleasedReturnValue( +[VCPDatabaseManager sharedDatabaseForPhotoLibrary:]( &OBJC_CLASS___VCPDatabaseManager,  "sharedDatabaseForPhotoLibrary:",  v6));
  id progressHandler = v9->super._progressHandler;
  v9->super._id progressHandler = (id)v10;

  uint64_t v12 = objc_claimAutoreleasedReturnValue( +[VCPPhotosAssetChangeManager managerForPhotoLibrary:]( &OBJC_CLASS___VCPPhotosAssetChangeManager,  "managerForPhotoLibrary:",  v6));
  photoLibrary = v9->super._photoLibrary;
  v9->super._photoLibrary = (PHPhotoLibrary *)v12;

  if (!v9->super._photoLibrary)
  {
    uint64_t v17 = MediaAnalysisLogLevel(v14, v15);
    if ((int)v17 >= 3)
    {
      uint64_t v19 = VCPLogInstance(v17, v18);
      v20 = (os_log_s *)objc_claimAutoreleasedReturnValue(v19);
      os_log_type_t v21 = VCPLogToOSLogType[3];
      if (os_log_type_enabled(v20, v21))
      {
        v23[0] = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v20,  v21,  "Failed to create VCPPhotosAssetChangeManager",  (uint8_t *)v23,  2u);
      }
    }

    v16 = 0LL;
  }

  else
  {
LABEL_3:
    v16 = v9;
  }

  return v16;
}

+ (id)taskWithPhotoLibrary:(id)a3 localIdentifiers:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [objc_alloc((Class)objc_opt_class(a1)) initWithPhotoLibrary:v7 localIdentifiers:v6];

  return v8;
}

- (void)resetPendingBatch
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[VCPTask photoLibrary](self, "photoLibrary"));
  v4 = (VCPDatabaseWriter *)objc_claimAutoreleasedReturnValue( +[VCPBatchAnalysisTask taskWithPhotoLibrary:]( &OBJC_CLASS___VCPBatchAnalysisTask,  "taskWithPhotoLibrary:",  v3));
  database = self->_database;
  self->_database = v4;

  -[VCPDatabaseWriter setPhotosChangeManager:](self->_database, "setPhotosChangeManager:", self->super._photoLibrary);
  id v6 = (id)objc_claimAutoreleasedReturnValue(-[VCPTask cancel](self, "cancel"));
  -[VCPDatabaseWriter setCancel:](self->_database, "setCancel:", v6);
}

- (int)processPendingBatch
{
  int v3 = -[VCPDatabaseWriter error](self->_database, "error");
  if (!v3) {
    -[VCPMADFullAssetProcessingTask resetPendingBatch](self, "resetPendingBatch");
  }
  return v3;
}

- (BOOL)shouldSkipAnalysisForAsset:(id)a3 withResources:(id)a4 logPrefix:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v12 = v10;
  if (LOBYTE(self->_changeManager))
  {
    if (objc_msgSend(v8, "vcp_isLivePhoto"))
    {
      id v13 = objc_msgSend(v9, "vcp_hasLocalPhoto:", objc_msgSend(v8, "hasAdjustments"));
      if ((v13 & 1) == 0)
      {
        uint64_t v36 = MediaAnalysisLogLevel(v13, v14);
        if ((int)v36 >= 7)
        {
          uint64_t v38 = VCPLogInstance(v36, v37);
          v20 = (os_log_s *)objc_claimAutoreleasedReturnValue(v38);
          os_log_type_t v21 = VCPLogToOSLogType[7];
          if (os_log_type_enabled(v20, v21))
          {
            int v49 = 138412290;
            v50 = v12;
            v22 = "%@ Live Photo has no local image; skipping";
            goto LABEL_20;
          }

          goto LABEL_27;
        }

        goto LABEL_21;
      }
    }

    id v15 = objc_msgSend(v8, "vcp_isVideoSlowmo");
    if ((_DWORD)v15)
    {
      uint64_t v17 = MediaAnalysisLogLevel(v15, v16);
      if ((int)v17 >= 7)
      {
        uint64_t v19 = VCPLogInstance(v17, v18);
        v20 = (os_log_s *)objc_claimAutoreleasedReturnValue(v19);
        os_log_type_t v21 = VCPLogToOSLogType[7];
        if (os_log_type_enabled(v20, v21))
        {
          int v49 = 138412290;
          v50 = v12;
          v22 = "%@ Slowmo not supported for streaming analysis; skipping";
LABEL_20:
          _os_log_impl((void *)&_mh_execute_header, v20, v21, v22, (uint8_t *)&v49, 0xCu);
          goto LABEL_27;
        }

        goto LABEL_27;
      }

      goto LABEL_21;
    }

    v20 = (os_log_s *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "vcp_smallMovieDerivativeResource"));
    if (v20)
    {
      if ([v8 isVideo])
      {
        id v27 = -[os_log_s fileSize](v20, "fileSize");
        id v28 = +[VCPDownloadManager maxSizeBytes](&OBJC_CLASS___VCPDownloadManager, "maxSizeBytes");
        if (v27 > v28)
        {
          uint64_t v30 = MediaAnalysisLogLevel(v28, v29);
          uint64_t v32 = VCPLogInstance(v30, v31);
          v33 = (os_log_s *)objc_claimAutoreleasedReturnValue(v32);
          os_log_type_t v34 = VCPLogToOSLogType[7];
          if (os_log_type_enabled(v33, v34))
          {
            int v49 = 138412290;
            v50 = v12;
            v35 = "%@ File size exceeds streaming threshold; skipping";
LABEL_25:
            _os_log_impl((void *)&_mh_execute_header, v33, v34, v35, (uint8_t *)&v49, 0xCu);
            goto LABEL_26;
          }

          goto LABEL_26;
        }

        if (!v27)
        {
          id v44 = objc_msgSend(v8, "vcp_isLongMovie");
          if ((_DWORD)v44)
          {
            uint64_t v46 = MediaAnalysisLogLevel(v44, v45);
            uint64_t v48 = VCPLogInstance(v46, v47);
            v33 = (os_log_s *)objc_claimAutoreleasedReturnValue(v48);
            os_log_type_t v34 = VCPLogToOSLogType[7];
            if (!os_log_type_enabled(v33, v34)) {
              goto LABEL_26;
            }
            int v49 = 138412290;
            v50 = v12;
            v35 = "%@ Duration exceeds streaming threshold; skipping";
            goto LABEL_25;
          }
        }
      }

      BOOL v39 = 0;
      goto LABEL_28;
    }

    uint64_t v40 = MediaAnalysisLogLevel(0LL, v26);
    uint64_t v42 = VCPLogInstance(v40, v41);
    v33 = (os_log_s *)objc_claimAutoreleasedReturnValue(v42);
    os_log_type_t v34 = VCPLogToOSLogType[4];
    if (os_log_type_enabled(v33, v34))
    {
      int v49 = 138412290;
      v50 = v12;
      v35 = "%@ Asset has no small video derivative; skipping";
      goto LABEL_25;
    }

- (int)processAsset:(id)a3
{
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue([v4 localIdentifier]);
  id v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"[VCPMADFullAssetProcessingTask][%@]",  v5));

  uint64_t v9 = MediaAnalysisLogLevel(v7, v8);
  if ((int)v9 >= 7)
  {
    uint64_t v11 = VCPLogInstance(v9, v10);
    uint64_t v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
    os_log_type_t v13 = VCPLogToOSLogType[7];
    if (os_log_type_enabled(v12, v13))
    {
      uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "vcp_typeDescription"));
      *(_DWORD *)buf = 138412546;
      v92 = v6;
      __int16 v93 = 2112;
      v94 = v14;
      _os_log_impl((void *)&_mh_execute_header, v12, v13, "%@ Evaluating %@ asset", buf, 0x16u);
    }
  }

  if (objc_msgSend(v4, "vcp_eligibleForFullAnalysis")
    && (-[VCPDatabaseWriter containsAsset:](self->_database, "containsAsset:", v4) & 1) == 0)
  {
    id progressHandler = self->super._progressHandler;
    uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue([v4 localIdentifier]);
    id v90 = 0LL;
    [progressHandler analysisForAsset:v17 analysis:&v90];
    id v18 = v90;

    uint64_t v19 = MediaAnalysisStripOutdatedAnalysis(v4, v18);
    v20 = (void *)objc_claimAutoreleasedReturnValue(v19);

    unint64_t v21 = (unint64_t)objc_msgSend(v4, "vcp_fullAnalysisTypes") & 0xFFFFFFFFDFEFFFFFLL;
    unint64_t v22 = (unint64_t)objc_msgSend(v20, "vcp_types");
    unint64_t v24 = v21 & ~v22;
    if (!v24)
    {
      int v15 = 0;
LABEL_47:

      goto LABEL_48;
    }

    uint64_t v25 = MediaAnalysisLogLevel(v22, v23);
    if ((int)v25 >= 7)
    {
      uint64_t v27 = VCPLogInstance(v25, v26);
      id v28 = (os_log_s *)objc_claimAutoreleasedReturnValue(v27);
      os_log_type_t v29 = VCPLogToOSLogType[7];
      if (os_log_type_enabled(v28, v29))
      {
        uint64_t v30 = MediaAnalysisTypeDescription(objc_msgSend(v20, "vcp_types"));
        uint64_t v31 = (void *)objc_claimAutoreleasedReturnValue(v30);
        *(_DWORD *)buf = 138412546;
        v92 = v6;
        __int16 v93 = 2112;
        v94 = v31;
        _os_log_impl((void *)&_mh_execute_header, v28, v29, "%@ existing analyses from MA DB %@", buf, 0x16u);
      }
    }

    uint64_t v32 = MediaAnalysisLogLevel(v25, v26);
    if ((int)v32 >= 7)
    {
      uint64_t v34 = VCPLogInstance(v32, v33);
      v35 = (os_log_s *)objc_claimAutoreleasedReturnValue(v34);
      os_log_type_t v36 = VCPLogToOSLogType[7];
      if (os_log_type_enabled(v35, v36))
      {
        uint64_t v37 = MediaAnalysisTypeDescription(v24);
        uint64_t v38 = (void *)objc_claimAutoreleasedReturnValue(v37);
        *(_DWORD *)buf = 138412546;
        v92 = v6;
        __int16 v93 = 2112;
        v94 = v38;
        _os_log_impl((void *)&_mh_execute_header, v35, v36, "%@ missing analyses from MA DB %@", buf, 0x16u);
      }
    }

    BOOL v39 = (void *)objc_claimAutoreleasedReturnValue( +[PHAssetResource vcp_allAcceptableResourcesForAsset:]( &OBJC_CLASS___PHAssetResource,  "vcp_allAcceptableResourcesForAsset:",  v4));
    unint64_t v40 = (unint64_t)objc_msgSend(v4, "vcp_fullAnalysisTypesForResources:", v39);
    if ((v40 & v24) == v24)
    {
      id v41 = objc_msgSend(v20, "vcp_types");
      unint64_t v87 = v40 & ~(_DWORD)v41 & 0x100000 | v24;
    }

    else
    {
      id v41 = (id)-[VCPMADFullAssetProcessingTask shouldSkipAnalysisForAsset:withResources:logPrefix:]( self,  "shouldSkipAnalysisForAsset:withResources:logPrefix:",  v4,  v39,  v6);
      unint64_t v87 = v24;
      if ((v41 & 1) != 0)
      {
        int v15 = 0;
LABEL_46:

        goto LABEL_47;
      }
    }

    unint64_t v82 = v40;
    *(void *)type = v21;
    unint64_t v85 = v40 & v24;
    unint64_t v89 = v24;
    uint64_t v42 = VCPSignPostLog(v41);
    v43 = (os_log_s *)objc_claimAutoreleasedReturnValue(v42);
    os_signpost_id_t v44 = os_signpost_id_generate(v43);

    uint64_t v46 = VCPSignPostLog(v45);
    uint64_t v47 = (os_log_s *)objc_claimAutoreleasedReturnValue(v46);
    uint64_t v48 = v47;
    if (v44 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v47))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v48,  OS_SIGNPOST_INTERVAL_BEGIN,  v44,  "VCPMADFullAssetProcessingTask_UnpackComputeSync",  (const char *)&unk_100199097,  buf,  2u);
    }

    int v49 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v39, "mad_computeSyncResource"));
    v50 = (void *)objc_claimAutoreleasedReturnValue(-[VCPTask cancel](self, "cancel"));
    v86 = v49;
    v51 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v49, "mad_existingAnalysisFromComputeSyncForAsset:allowDownload:cancel:", v4, 0, v50));

    uint64_t v53 = VCPSignPostLog(v52);
    v54 = (os_log_s *)objc_claimAutoreleasedReturnValue(v53);
    v55 = v54;
    if (v44 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v54))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v55,  OS_SIGNPOST_INTERVAL_END,  v44,  "VCPMADFullAssetProcessingTask_UnpackComputeSync",  (const char *)&unk_100199097,  buf,  2u);
    }

    if (v51)
    {
      uint64_t v58 = MediaAnalysisStripOutdatedAnalysis(v4, v51);
      v59 = (void *)objc_claimAutoreleasedReturnValue(v58);

      unint64_t v60 = (unint64_t)objc_msgSend(v59, "vcp_types");
      unint64_t v61 = *(void *)type & ~v60;
      uint64_t v63 = MediaAnalysisLogLevel(v60, v62);
      unint64_t v65 = v24;
      if ((int)v63 >= 5)
      {
        uint64_t v66 = VCPLogInstance(v63, v64);
        v67 = (os_log_s *)objc_claimAutoreleasedReturnValue(v66);
        os_log_type_t typea = VCPLogToOSLogType[5];
        if (os_log_type_enabled(v67, typea))
        {
          uint64_t v68 = MediaAnalysisTypeShortDescription(objc_msgSend(v59, "vcp_types"));
          v69 = (void *)objc_claimAutoreleasedReturnValue(v68);
          uint64_t v70 = MediaAnalysisTypeShortDescription(v61);
          unint64_t v88 = v61;
          v71 = (void *)objc_claimAutoreleasedReturnValue(v70);
          *(_DWORD *)buf = 138412802;
          v92 = v6;
          __int16 v93 = 2112;
          v94 = v69;
          __int16 v95 = 2112;
          v96 = v71;
          _os_log_impl( (void *)&_mh_execute_header,  v67,  typea,  "%@ Reusing analysis results from compute sync (existing: %@, missing: %@)",  buf,  0x20u);

          unint64_t v61 = v88;
        }

        unint64_t v65 = v89;
      }

      if ((v61 & ~v82) != 0)
      {
        id v56 = (id)-[VCPMADFullAssetProcessingTask shouldSkipAnalysisForAsset:withResources:logPrefix:]( self,  "shouldSkipAnalysisForAsset:withResources:logPrefix:",  v4,  v39,  v6);
      }

      else
      {
        id v56 = objc_msgSend(v59, "vcp_types");
        v61 |= v82 & ~(_DWORD)v56 & 0x100000;
      }
    }

    else
    {
      v59 = v20;
      unint64_t v61 = v87;
      unint64_t v65 = v24;
    }

    uint64_t v72 = MediaAnalysisLogLevel(v56, v57);
    if ((int)v72 >= 7)
    {
      v74 = v51;
      unint64_t v75 = v61;
      uint64_t v76 = VCPLogInstance(v72, v73);
      v77 = (os_log_s *)objc_claimAutoreleasedReturnValue(v76);
      os_log_type_t v78 = VCPLogToOSLogType[7];
      if (os_log_type_enabled(v77, v78))
      {
        *(_DWORD *)buf = 138412290;
        v92 = v6;
        _os_log_impl((void *)&_mh_execute_header, v77, v78, "%@ Queuing asset for analysis", buf, 0xCu);
      }

      unint64_t v61 = v75;
      v51 = v74;
      unint64_t v65 = v89;
    }

    -[VCPDatabaseWriter addAnalysis:withExistingAnalysis:forAsset:allowStreaming:]( self->_database,  "addAnalysis:withExistingAnalysis:forAsset:allowStreaming:",  v61,  v59,  v4,  v85 != v65);
    -[VCPDatabaseWriter cost](self->_database, "cost");
    if (v79 >= 100.0)
    {
      unsigned int v80 = -[VCPMADFullAssetProcessingTask processPendingBatch](self, "processPendingBatch");
      if (v80)
      {
        int v15 = v80;
LABEL_45:

        v20 = v59;
        goto LABEL_46;
      }
    }

- (int)processAssetsWithProgressReporter:(id)a3
{
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[VCPTask photoLibrary](self, "photoLibrary"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue( +[PHAsset vcp_fetchOptionsForLibrary:forTaskID:]( &OBJC_CLASS___PHAsset,  "vcp_fetchOptionsForLibrary:forTaskID:",  v5,  1LL));

  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue( +[PHAsset fetchAssetsWithLocalIdentifiers:options:]( &OBJC_CLASS___PHAsset,  "fetchAssetsWithLocalIdentifiers:options:",  self->_pendingBatch,  v6));
  if ([v7 count])
  {
    uint64_t v8 = 0LL;
    while (1)
    {
      uint64_t v9 = objc_autoreleasePoolPush();
      if (-[VCPTask isCancelled](self, "isCancelled")) {
        break;
      }
      uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(+[VCPWatchdog sharedWatchdog](&OBJC_CLASS___VCPWatchdog, "sharedWatchdog"));
      [v10 pet];

      uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([v7 objectAtIndexedSubscript:v8]);
      int v12 = -[VCPMADFullAssetProcessingTask processAsset:](self, "processAsset:", v11);

      if (v12) {
        goto LABEL_10;
      }
      [v4 increaseProcessedJobCountByOne];
      objc_autoreleasePoolPop(v9);
    }

    int v12 = -128;
LABEL_10:
    objc_autoreleasePoolPop(v9);
  }

  else
  {
LABEL_6:
    -[VCPDatabaseWriter cost](self->_database, "cost");
    if (v13 == 0.0 || (int v12 = -[VCPMADFullAssetProcessingTask processPendingBatch](self, "processPendingBatch")) == 0)
    {
      uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue(+[VNSession globalSession](&OBJC_CLASS___VNSession, "globalSession"));
      [v14 releaseCachedResources];

      int v12 = 0;
    }
  }

  return v12;
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
      id v8 = -[VCPBatchAnalysisTask count](self->_pendingBatch, "count");
      int v47 = 138412546;
      uint64_t v48 = @"[VCPMADFullAssetProcessingTask]";
      __int16 v49 = 2048;
      id v50 = v8;
      _os_log_impl( (void *)&_mh_execute_header,  v6,  v7,  "%@ Processing %lu assets for full analysis ...",  (uint8_t *)&v47,  0x16u);
    }
  }

  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(-[VCPTask photoLibrary](self, "photoLibrary"));
  unsigned int v10 = [v9 isCloudPhotoLibraryEnabled];

  if (v10)
  {
    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(+[VCPInternetReachability sharedInstance](&OBJC_CLASS___VCPInternetReachability, "sharedInstance"));
    LOBYTE(self->_changeManager) = [v11 hasWifiOrEthernetConnection];

    if (LOBYTE(self->_changeManager))
    {
      uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue(-[VCPTask cancel](self, "cancel"));
      int v15 = (void *)objc_claimAutoreleasedReturnValue(+[VCPDownloadManager sharedManager](&OBJC_CLASS___VCPDownloadManager, "sharedManager"));
      [v15 setCancel:v14];

LABEL_8:
      goto LABEL_9;
    }

    uint64_t v43 = MediaAnalysisLogLevel(v12, v13);
    if ((int)v43 >= 6)
    {
      uint64_t v45 = VCPLogInstance(v43, v44);
      uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue(v45);
      os_log_type_t v46 = VCPLogToOSLogType[6];
      if (os_log_type_enabled((os_log_t)v14, v46))
      {
        int v47 = 138412290;
        uint64_t v48 = @"[VCPMADFullAssetProcessingTask]";
        _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)v14,  v46,  "%@ Wifi/Ethernet connection unavailable; disabling streaming analysis",
          (uint8_t *)&v47,
          0xCu);
      }

      goto LABEL_8;
    }
  }

- (void).cxx_destruct
{
}

@end