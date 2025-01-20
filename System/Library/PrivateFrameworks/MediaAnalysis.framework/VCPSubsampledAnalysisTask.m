@interface VCPSubsampledAnalysisTask
+ (BOOL)prioritizeWallpaperSuggestion;
+ (id)taskWithPhotoLibrary:(id)a3 options:(id)a4;
- (BOOL)assetWouldBeSkipped:(id)a3 withAnalysis:(id)a4;
- (VCPSubsampledAnalysisTask)initWithPhotoLibrary:(id)a3 options:(id)a4;
- (id)memorySpecificFetchOptions;
- (int)checkAndMarkPriorityAssets;
- (int)collectHighlight:(id)a3 withAssetPredicate:(id)a4 andLimit:(BOOL)a5;
- (int)collectHighlightsOfTypes:(int64_t)a3 withHighlightPredicate:(id)a4 andLimit:(BOOL)a5 andProgressReporter:(id)a6;
- (int)collectHighlightsOfTypes:(int64_t)a3 withHighlightPredicate:(id)a4 assetPredicate:(id)a5 andLimit:(BOOL)a6 andProgressReporter:(id)a7;
- (int)collectMemoriesWithAssetPredicate:(id)a3 andProgressReporter:(id)a4;
- (int)collectMemorieswithProgressReporter:(id)a3;
- (int)collectMemory:(id)a3 withAssetPredicate:(id)a4 andAnalyzedAssetCount:(unint64_t *)a5;
- (int)collectWallpaperSuggestionWithAssetPredicate:(id)a3 andProgressReporter:(id)a4;
- (int)collectWallpaperSuggestionwithProgressReporter:(id)a3;
- (int)mainInternal;
- (int)markPrioritizedAsset:(id)a3 skipped:(BOOL *)a4;
- (int)processAsset:(id)a3 skipped:(BOOL *)a4;
- (int)processPendingBatch;
- (int)processPriorityAssets:(id)a3 progressReporter:(id)a4;
- (unint64_t)queryHighlightCount;
- (unint64_t)queryMemoryCount;
- (unint64_t)queryWallpaperSuggestionCount;
- (void)resetPendingBatch;
@end

@implementation VCPSubsampledAnalysisTask

+ (BOOL)prioritizeWallpaperSuggestion
{
  return 1;
}

- (VCPSubsampledAnalysisTask)initWithPhotoLibrary:(id)a3 options:(id)a4
{
  id v5 = a3;
  v21.receiver = self;
  v21.super_class = (Class)&OBJC_CLASS___VCPSubsampledAnalysisTask;
  v6 = -[VCPTask initWithPhotoLibrary:](&v21, "initWithPhotoLibrary:", v5);
  if (!v6) {
    goto LABEL_3;
  }
  uint64_t v7 = objc_claimAutoreleasedReturnValue( +[VCPDatabaseManager sharedDatabaseForPhotoLibrary:]( &OBJC_CLASS___VCPDatabaseManager,  "sharedDatabaseForPhotoLibrary:",  v5));
  id progressHandler = v6->super._progressHandler;
  v6->super._id progressHandler = (id)v7;

  uint64_t v9 = objc_claimAutoreleasedReturnValue( +[VCPPhotosAssetChangeManager managerForPhotoLibrary:]( &OBJC_CLASS___VCPPhotosAssetChangeManager,  "managerForPhotoLibrary:",  v5));
  photoLibrary = v6->super._photoLibrary;
  v6->super._photoLibrary = (PHPhotoLibrary *)v9;

  if (!v6->super._photoLibrary)
  {
    uint64_t v14 = MediaAnalysisLogLevel(v11, v12);
    if ((int)v14 >= 3)
    {
      uint64_t v16 = VCPLogInstance(v14, v15);
      v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);
      os_log_type_t v18 = VCPLogToOSLogType[3];
      if (os_log_type_enabled(v17, v18))
      {
        *(_WORD *)v20 = 0;
        _os_log_impl((void *)&_mh_execute_header, v17, v18, "Failed to create VCPPhotosAssetChangeManager", v20, 2u);
      }
    }

    v13 = 0LL;
  }

  else
  {
LABEL_3:
    v13 = v6;
  }

  return v13;
}

+ (id)taskWithPhotoLibrary:(id)a3 options:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [objc_alloc((Class)objc_opt_class(a1)) initWithPhotoLibrary:v7 options:v6];

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
    -[VCPSubsampledAnalysisTask resetPendingBatch](self, "resetPendingBatch");
  }
  return v3;
}

- (BOOL)assetWouldBeSkipped:(id)a3 withAnalysis:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  unint64_t v8 = (unint64_t)objc_msgSend(v6, "vcp_fullAnalysisTypes");
  unint64_t v9 = v8 & ~(unint64_t)objc_msgSend(v7, "vcp_types");

  unint64_t v10 = v9 & 0xFFFFFFFFDFEFFFFFLL;
  if (!v10)
  {
    BOOL v19 = 0;
    goto LABEL_38;
  }

  id v11 = objc_msgSend(v6, "vcp_isShortMovie");
  if (!(_DWORD)v11)
  {
    uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue( +[PHAssetResource vcp_allAcceptableResourcesForAsset:]( &OBJC_CLASS___PHAssetResource,  "vcp_allAcceptableResourcesForAsset:",  v6));
    unint64_t v20 = (unint64_t)objc_msgSend(v6, "vcp_fullAnalysisTypesForResources:", v16);
    if ((v10 & ~v20) == 0)
    {
LABEL_8:
      BOOL v19 = 0;
LABEL_37:

      goto LABEL_38;
    }

    if (!LOBYTE(self->_memoryCountPerAssetType))
    {
      uint64_t v33 = MediaAnalysisLogLevel(v20, v21);
      if ((int)v33 >= 7)
      {
        uint64_t v35 = VCPLogInstance(v33, v34);
        v29 = (os_log_s *)objc_claimAutoreleasedReturnValue(v35);
        os_log_type_t v30 = VCPLogToOSLogType[7];
        if (os_log_type_enabled(v29, v30))
        {
          v31 = (void *)objc_claimAutoreleasedReturnValue([v6 localIdentifier]);
          int v59 = 138412290;
          v60 = v31;
          v32 = "[%@] Network unavailable; skipping";
          goto LABEL_29;
        }

- (int)processAsset:(id)a3 skipped:(BOOL *)a4
{
  id v6 = a3;
  unint64_t v8 = v6;
  if (a4) {
    *a4 = 1;
  }
  uint64_t v9 = MediaAnalysisLogLevel(v6, v7);
  if ((int)v9 >= 7)
  {
    uint64_t v11 = VCPLogInstance(v9, v10);
    uint64_t v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
    os_log_type_t v13 = VCPLogToOSLogType[7];
    if (os_log_type_enabled(v12, v13))
    {
      uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue([v8 localIdentifier]);
      uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "vcp_typeDescription"));
      [v8 curationScore];
      *(_DWORD *)buf = 138412802;
      v76 = v14;
      __int16 v77 = 2112;
      v78 = v15;
      __int16 v79 = 2048;
      uint64_t v80 = v16;
      _os_log_impl((void *)&_mh_execute_header, v12, v13, "[%@] Evaluating %@ asset (score: %f)", buf, 0x20u);
    }
  }

  if (objc_msgSend(v8, "vcp_eligibleForFullAnalysis")
    && (-[VCPDatabaseWriter containsAsset:](self->_database, "containsAsset:", v8) & 1) == 0)
  {
    id progressHandler = self->super._progressHandler;
    BOOL v19 = (void *)objc_claimAutoreleasedReturnValue([v8 localIdentifier]);
    id v74 = 0LL;
    [progressHandler analysisForAsset:v19 analysis:&v74];
    id v20 = v74;

    uint64_t v21 = MediaAnalysisStripOutdatedAnalysis(v8, v20);
    id v22 = (void *)objc_claimAutoreleasedReturnValue(v21);

    unint64_t v23 = (unint64_t)objc_msgSend(v8, "vcp_fullAnalysisTypes") & 0xFFFFFFFFDFEFFFFFLL;
    unint64_t v24 = v23 & ~(unint64_t)objc_msgSend(v22, "vcp_types");
    if (!v24)
    {
      int v17 = 0;
LABEL_43:

      goto LABEL_44;
    }

    v73 = (void *)objc_claimAutoreleasedReturnValue( +[PHAssetResource vcp_allAcceptableResourcesForAsset:]( &OBJC_CLASS___PHAssetResource,  "vcp_allAcceptableResourcesForAsset:",  v8));
    unint64_t v25 = (unint64_t)objc_msgSend(v8, "vcp_fullAnalysisTypesForResources:");
    if ((v25 & v24) == v24)
    {
      id v26 = objc_msgSend(v22, "vcp_types");
      unint64_t v68 = v25 & ~(_DWORD)v26 & 0x100000 | v24;
    }

    else
    {
      id v26 = (id)-[VCPSubsampledAnalysisTask assetWouldBeSkipped:withAnalysis:]( self,  "assetWouldBeSkipped:withAnalysis:",  v8,  v22);
      unint64_t v68 = v24;
      if ((v26 & 1) != 0)
      {
        int v17 = 0;
LABEL_42:

        goto LABEL_43;
      }
    }

    unint64_t v71 = v25 & v24;
    unint64_t v70 = v24;
    uint64_t v27 = VCPSignPostLog(v26);
    uint64_t v28 = (os_log_s *)objc_claimAutoreleasedReturnValue(v27);
    os_signpost_id_t v29 = os_signpost_id_generate(v28);

    uint64_t v31 = VCPSignPostLog(v30);
    v32 = (os_log_s *)objc_claimAutoreleasedReturnValue(v31);
    uint64_t v33 = v32;
    if (v29 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v32))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v33,  OS_SIGNPOST_INTERVAL_BEGIN,  v29,  "VCPSubsampledAnalysisTask_UnpackComputeSync",  (const char *)&unk_100199097,  buf,  2u);
    }

    uint64_t v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v73, "mad_computeSyncResource"));
    uint64_t v35 = (void *)objc_claimAutoreleasedReturnValue(-[VCPTask cancel](self, "cancel"));
    v72 = v34;
    uint64_t v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v34, "mad_existingAnalysisFromComputeSyncForAsset:allowDownload:cancel:", v8, 0, v35));

    uint64_t v38 = VCPSignPostLog(v37);
    uint64_t v39 = (os_log_s *)objc_claimAutoreleasedReturnValue(v38);
    uint64_t v40 = v39;
    if (v29 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v39))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v40,  OS_SIGNPOST_INTERVAL_END,  v29,  "VCPSubsampledAnalysisTask_UnpackComputeSync",  (const char *)&unk_100199097,  buf,  2u);
    }

    if (v36)
    {
      uint64_t v43 = MediaAnalysisStripOutdatedAnalysis(v8, v36);
      os_log_type_t v44 = (void *)objc_claimAutoreleasedReturnValue(v43);

      unint64_t v45 = (unint64_t)objc_msgSend(v44, "vcp_types");
      unint64_t v46 = v23 & ~v45;
      uint64_t v48 = MediaAnalysisLogLevel(v45, v47);
      if ((int)v48 >= 5)
      {
        uint64_t v50 = VCPLogInstance(v48, v49);
        uint64_t v51 = (os_log_s *)objc_claimAutoreleasedReturnValue(v50);
        os_log_type_t v52 = VCPLogToOSLogType[5];
        if (os_log_type_enabled(v51, v52))
        {
          v69 = (void *)objc_claimAutoreleasedReturnValue([v8 localIdentifier]);
          uint64_t v53 = MediaAnalysisTypeShortDescription(objc_msgSend(v44, "vcp_types"));
          os_log_type_t type = v52;
          v66 = (void *)objc_claimAutoreleasedReturnValue(v53);
          uint64_t v54 = MediaAnalysisTypeShortDescription(v46);
          uint64_t v55 = objc_claimAutoreleasedReturnValue(v54);
          *(_DWORD *)buf = 138412802;
          v76 = v69;
          __int16 v77 = 2112;
          v78 = v66;
          __int16 v79 = 2112;
          uint64_t v80 = v55;
          uint64_t v56 = (void *)v55;
          _os_log_impl( (void *)&_mh_execute_header,  v51,  type,  "[%@] Reusing analysis results from compute sync (existing: %@, missing: %@)",  buf,  0x20u);
        }
      }

      if ((v46 & ~v25) != 0)
      {
        id v41 = (id)-[VCPSubsampledAnalysisTask assetWouldBeSkipped:withAnalysis:]( self,  "assetWouldBeSkipped:withAnalysis:",  v8,  v44);
      }

      else
      {
        id v41 = objc_msgSend(v44, "vcp_types");
        v46 |= v25 & ~(_DWORD)v41 & 0x100000;
      }
    }

    else
    {
      os_log_type_t v44 = v22;
      unint64_t v46 = v68;
    }

    uint64_t v57 = MediaAnalysisLogLevel(v41, v42);
    if ((int)v57 >= 7)
    {
      uint64_t v59 = VCPLogInstance(v57, v58);
      v60 = (os_log_s *)objc_claimAutoreleasedReturnValue(v59);
      os_log_type_t v61 = VCPLogToOSLogType[7];
      if (os_log_type_enabled(v60, v61))
      {
        v62 = (void *)objc_claimAutoreleasedReturnValue([v8 localIdentifier]);
        *(_DWORD *)buf = 138412290;
        v76 = v62;
        _os_log_impl((void *)&_mh_execute_header, v60, v61, "[%@] Queuing asset for analysis", buf, 0xCu);
      }
    }

    if (a4) {
      *a4 = 0;
    }
    -[VCPDatabaseWriter addAnalysis:withExistingAnalysis:forAsset:allowStreaming:]( self->_database,  "addAnalysis:withExistingAnalysis:forAsset:allowStreaming:",  v46,  v44,  v8,  v71 != v70);
    -[VCPDatabaseWriter cost](self->_database, "cost");
    if (v63 >= 100.0)
    {
      unsigned int v64 = -[VCPSubsampledAnalysisTask processPendingBatch](self, "processPendingBatch");
      if (v64)
      {
        int v17 = v64;
LABEL_41:

        id v22 = v44;
        goto LABEL_42;
      }
    }

- (int)markPrioritizedAsset:(id)a3 skipped:(BOOL *)a4
{
  id v6 = a3;
  id progressHandler = self->super._progressHandler;
  unint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v6 localIdentifier]);
  if (a4)
  {
    id v17 = 0LL;
    [progressHandler analysisForAsset:v8 analysis:&v17];
    id v9 = v17;

    uint64_t v10 = MediaAnalysisStripOutdatedAnalysis(v6, v9);
    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(v10);

    *a4 = -[VCPSubsampledAnalysisTask assetWouldBeSkipped:withAnalysis:]( self,  "assetWouldBeSkipped:withAnalysis:",  v6,  v11);
  }

  else
  {
    uint64_t v12 = [progressHandler isPrioritizedLocalIdentifier:v8];

    if ((v12 & 1) == 0)
    {
      id v14 = self->super._progressHandler;
      uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue([v6 localIdentifier]);
      int v13 = objc_msgSend( v14,  "setPrioritizedLocalIdentifier:mediaType:mediaSubtypes:",  v15,  objc_msgSend(v6, "mediaType"),  objc_msgSend(v6, "mediaSubtypes"));

      goto LABEL_6;
    }
  }

  int v13 = 0;
LABEL_6:

  return v13;
}

- (int)collectHighlight:(id)a3 withAssetPredicate:(id)a4 andLimit:(BOOL)a5
{
  BOOL v42 = a5;
  id v7 = a3;
  id v8 = a4;
  uint64_t v10 = MediaAnalysisLogLevel(v8, v9);
  if ((int)v10 >= 7)
  {
    uint64_t v12 = VCPLogInstance(v10, v11);
    int v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
    os_log_type_t v14 = VCPLogToOSLogType[7];
    if (os_log_type_enabled(v13, v14))
    {
      uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue([v7 localIdentifier]);
      uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue([v7 startDate]);
      *(_DWORD *)buf = 138412546;
      uint64_t v47 = v15;
      __int16 v48 = 2112;
      uint64_t v49 = v16;
      _os_log_impl((void *)&_mh_execute_header, v13, v14, "[%@] Evaluating Highlight (%@)", buf, 0x16u);
    }
  }

  id v17 = (void *)objc_claimAutoreleasedReturnValue(-[VCPTask photoLibrary](self, "photoLibrary"));
  os_log_type_t v18 = (void *)objc_claimAutoreleasedReturnValue( +[PHAsset vcp_fetchOptionsForLibrary:forTaskID:]( &OBJC_CLASS___PHAsset,  "vcp_fetchOptionsForLibrary:forTaskID:",  v17,  1LL));

  id v43 = v8;
  [v18 setPredicate:v8];
  BOOL v19 = (void *)objc_claimAutoreleasedReturnValue( +[NSSortDescriptor sortDescriptorWithKey:ascending:]( &OBJC_CLASS___NSSortDescriptor,  "sortDescriptorWithKey:ascending:",  @"curationScore",  0LL));
  unint64_t v45 = v19;
  id v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v45, 1LL));
  [v18 setInternalSortDescriptors:v20];

  id v44 = v7;
  uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue( +[PHAsset fetchKeyCuratedAssetInAssetCollection:referenceAsset:options:]( &OBJC_CLASS___PHAsset,  "fetchKeyCuratedAssetInAssetCollection:referenceAsset:options:",  v7,  0LL,  v18));
  uint64_t v22 = 0LL;
  if (![v21 count])
  {
LABEL_12:
    [v18 setHighlightCurationType:2];
    id v41 = v18;
    os_signpost_id_t v29 = (void *)objc_claimAutoreleasedReturnValue( +[PHAsset fetchAssetsInAssetCollection:options:]( &OBJC_CLASS___PHAsset,  "fetchAssetsInAssetCollection:options:",  v44,  v18));
    uint64_t v30 = v29;
    if (v42)
    {
      unint64_t v31 = (unint64_t)[v29 count] / 5;
      if (v31 >= 0x1E) {
        unint64_t v31 = 30LL;
      }
      if (v31 <= 6) {
        unint64_t v32 = 6LL;
      }
      else {
        unint64_t v32 = v31;
      }
    }

    else
    {
      unint64_t v32 = -1LL;
    }

    if ([v30 count])
    {
      uint64_t v33 = 0LL;
      while (1)
      {
        uint64_t v34 = objc_autoreleasePoolPush();
        if (-[VCPTask isCancelled](self, "isCancelled"))
        {
          int v28 = -128;
          goto LABEL_33;
        }

        uint64_t v35 = (void *)objc_claimAutoreleasedReturnValue([v30 objectAtIndexedSubscript:v33]);
        if (([v35 sourceType] & 0x10) == 0)
        {
          uint64_t v36 = (void *)objc_claimAutoreleasedReturnValue(+[VCPWatchdog sharedWatchdog](&OBJC_CLASS___VCPWatchdog, "sharedWatchdog"));
          [v36 pet];

          uint64_t v37 = objc_autoreleasePoolPush();
          int v28 = -[VCPSubsampledAnalysisTask markPrioritizedAsset:skipped:]( self,  "markPrioritizedAsset:skipped:",  v35,  0LL);
          objc_autoreleasePoolPop(v37);
          if (v28) {
            goto LABEL_32;
          }
          if (++v22 >= v32) {
            break;
          }
        }

        objc_autoreleasePoolPop(v34);
      }

      int v28 = 0;
LABEL_32:

LABEL_33:
      uint64_t v39 = v43;
      uint64_t v38 = v44;
      os_log_type_t v18 = v41;
      objc_autoreleasePoolPop(v34);
    }

    else
    {
LABEL_26:
      int v28 = 0;
      uint64_t v39 = v43;
      uint64_t v38 = v44;
      os_log_type_t v18 = v41;
    }

    goto LABEL_35;
  }

  uint64_t v23 = 0LL;
  while (1)
  {
    unint64_t v24 = objc_autoreleasePoolPush();
    if (-[VCPTask isCancelled](self, "isCancelled"))
    {
      objc_autoreleasePoolPop(v24);
      int v28 = -128;
      goto LABEL_30;
    }

    unint64_t v25 = (void *)objc_claimAutoreleasedReturnValue([v21 objectAtIndexedSubscript:v23]);
LABEL_11:

    objc_autoreleasePoolPop(v24);
  }

  id v26 = (void *)objc_claimAutoreleasedReturnValue(+[VCPWatchdog sharedWatchdog](&OBJC_CLASS___VCPWatchdog, "sharedWatchdog"));
  [v26 pet];

  uint64_t v27 = objc_autoreleasePoolPush();
  int v28 = -[VCPSubsampledAnalysisTask markPrioritizedAsset:skipped:](self, "markPrioritizedAsset:skipped:", v25, 0LL);
  objc_autoreleasePoolPop(v27);
  if (!v28)
  {
    ++v22;
    goto LABEL_11;
  }

  objc_autoreleasePoolPop(v24);
LABEL_30:
  uint64_t v39 = v43;
  uint64_t v38 = v44;
LABEL_35:

  return v28;
}

- (int)collectHighlightsOfTypes:(int64_t)a3 withHighlightPredicate:(id)a4 assetPredicate:(id)a5 andLimit:(BOOL)a6 andProgressReporter:(id)a7
{
  BOOL v39 = a6;
  id v11 = a4;
  id v41 = a5;
  id v40 = a7;
  uint64_t v12 = objc_alloc_init(&OBJC_CLASS___PHFetchOptions);
  int v13 = (void *)objc_claimAutoreleasedReturnValue(-[VCPTask photoLibrary](self, "photoLibrary"));
  -[PHFetchOptions setPhotoLibrary:](v12, "setPhotoLibrary:", v13);

  os_log_type_t v14 = (void *)objc_claimAutoreleasedReturnValue( +[NSSortDescriptor sortDescriptorWithKey:ascending:]( &OBJC_CLASS___NSSortDescriptor,  "sortDescriptorWithKey:ascending:",  @"startDate",  0LL));
  __int16 v48 = v14;
  uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v48, 1LL));
  -[PHFetchOptions setSortDescriptors:](v12, "setSortDescriptors:", v15);

  -[PHFetchOptions setPredicate:](v12, "setPredicate:", v11);
  uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue(+[MADStateHandler sharedStateHandler](&OBJC_CLASS___MADStateHandler, "sharedStateHandler"));
  [v16 addBreadcrumb:@"[Subsampled] Fetching highlights with fetchOptions: %@", v12];

  id v17 = (void *)objc_claimAutoreleasedReturnValue( +[PHAssetCollection fetchAssetCollectionsWithType:subtype:options:]( &OBJC_CLASS___PHAssetCollection,  "fetchAssetCollectionsWithType:subtype:options:",  6LL,  a3,  v12));
  os_log_type_t v18 = (void *)objc_claimAutoreleasedReturnValue(+[MADStateHandler sharedStateHandler](&OBJC_CLASS___MADStateHandler, "sharedStateHandler"));
  objc_msgSend(v18, "addBreadcrumb:", @"[Subsampled] Fetched %lu highlights", objc_msgSend(v17, "count"));

  __int128 v45 = 0u;
  __int128 v46 = 0u;
  __int128 v43 = 0u;
  __int128 v44 = 0u;
  id v19 = v17;
  id v20 = [v19 countByEnumeratingWithState:&v43 objects:v47 count:16];
  if (!v20)
  {
    int v31 = 0;
    goto LABEL_21;
  }

  id v21 = v20;
  uint64_t v22 = *(void *)v44;
  id v38 = v11;
  while (2)
  {
    for (i = 0LL; i != v21; i = (char *)i + 1)
    {
      if (*(void *)v44 != v22) {
        objc_enumerationMutation(v19);
      }
      uint64_t v24 = *(void *)(*((void *)&v43 + 1) + 8LL * (void)i);
      unint64_t v25 = objc_autoreleasePoolPush();
      if (-[VCPTask isCancelled](self, "isCancelled"))
      {
        int v31 = -128;
LABEL_20:
        objc_autoreleasePoolPop(v25);
        id v11 = v38;
        goto LABEL_21;
      }

      id v26 = (void *)objc_claimAutoreleasedReturnValue(+[VCPWatchdog sharedWatchdog](&OBJC_CLASS___VCPWatchdog, "sharedWatchdog"));
      [v26 pet];

      unsigned int v27 = -[VCPSubsampledAnalysisTask collectHighlight:withAssetPredicate:andLimit:]( self,  "collectHighlight:withAssetPredicate:andLimit:",  v24,  v41,  v39);
      if (v27)
      {
        int v31 = v27;
        goto LABEL_20;
      }

      id v28 = [v40 increaseProcessedJobCountByOne];
      uint64_t v30 = (VCPPhotosAssetChangeManager *)((char *)&self->_changeManager->super.isa + 1);
      self->_changeManager = v30;
      if ((unint64_t)v30 >= 0x5DC)
      {
        uint64_t v32 = MediaAnalysisLogLevel(v28, v29);
        if ((int)v32 >= 6)
        {
          uint64_t v34 = VCPLogInstance(v32, v33);
          uint64_t v35 = (os_log_s *)objc_claimAutoreleasedReturnValue(v34);
          os_log_type_t v36 = VCPLogToOSLogType[6];
          if (os_log_type_enabled(v35, v36))
          {
            *(_WORD *)buf = 0;
            _os_log_impl( (void *)&_mh_execute_header,  v35,  v36,  "Hit highlight collection limit; skipping remaining highlights",
              buf,
              2u);
          }
        }

        int v31 = 0;
        goto LABEL_20;
      }

      objc_autoreleasePoolPop(v25);
    }

    id v21 = [v19 countByEnumeratingWithState:&v43 objects:v47 count:16];
    int v31 = 0;
    id v11 = v38;
    if (v21) {
      continue;
    }
    break;
  }

- (int)collectHighlightsOfTypes:(int64_t)a3 withHighlightPredicate:(id)a4 andLimit:(BOOL)a5 andProgressReporter:(id)a6
{
  BOOL v7 = a5;
  id v10 = a4;
  id v11 = a6;
  __int128 v26 = 0u;
  __int128 v27 = 0u;
  __int128 v28 = 0u;
  __int128 v29 = 0u;
  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate vcp_livePhotosPredicate:](&OBJC_CLASS___NSPredicate, "vcp_livePhotosPredicate:", 0LL));
  v30[0] = v12;
  int v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate vcp_stillImagesPredicate:](&OBJC_CLASS___NSPredicate, "vcp_stillImagesPredicate:", 0LL));
  v30[1] = v13;
  os_log_type_t v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate vcp_moviesPredicate:](&OBJC_CLASS___NSPredicate, "vcp_moviesPredicate:", 0LL));
  v30[2] = v14;
  uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v30, 3LL));

  id obj = v15;
  id v16 = [v15 countByEnumeratingWithState:&v26 objects:v31 count:16];
  if (!v16)
  {
    int v23 = 0;
    goto LABEL_15;
  }

  id v17 = v16;
  uint64_t v18 = *(void *)v27;
  while (2)
  {
    for (i = 0LL; i != v17; i = (char *)i + 1)
    {
      if (*(void *)v27 != v18) {
        objc_enumerationMutation(obj);
      }
      uint64_t v20 = *(void *)(*((void *)&v26 + 1) + 8LL * (void)i);
      id v21 = objc_autoreleasePoolPush();
      if (self->_changeManager > (VCPPhotosAssetChangeManager *)0x5DB)
      {
        int v23 = 0;
LABEL_14:
        objc_autoreleasePoolPop(v21);
        goto LABEL_15;
      }

      unsigned int v22 = -[VCPSubsampledAnalysisTask collectHighlightsOfTypes:withHighlightPredicate:assetPredicate:andLimit:andProgressReporter:]( self,  "collectHighlightsOfTypes:withHighlightPredicate:assetPredicate:andLimit:andProgressReporter:",  a3,  v10,  v20,  v7,  v11);
      if (v22)
      {
        int v23 = v22;
        goto LABEL_14;
      }

      objc_autoreleasePoolPop(v21);
    }

    id v17 = [obj countByEnumeratingWithState:&v26 objects:v31 count:16];
    int v23 = 0;
    if (v17) {
      continue;
    }
    break;
  }

- (id)memorySpecificFetchOptions
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[VCPTask photoLibrary](self, "photoLibrary"));
  int v3 = (void *)objc_claimAutoreleasedReturnValue([v2 librarySpecificFetchOptions]);

  [v3 setIncludePendingMemories:1];
  v4 = (void *)objc_claimAutoreleasedReturnValue( +[NSPredicate predicateWithFormat:]( &OBJC_CLASS___NSPredicate,  "predicateWithFormat:",  @"featuredState == %d",  1LL));
  [v3 setPredicate:v4];

  return v3;
}

- (int)collectMemory:(id)a3 withAssetPredicate:(id)a4 andAnalyzedAssetCount:(unint64_t *)a5
{
  id v8 = a3;
  id v9 = a4;
  if (a5) {
    *a5 = 0LL;
  }
  id v10 = (void *)objc_claimAutoreleasedReturnValue(-[VCPTask photoLibrary](self, "photoLibrary"));
  id v11 = (void *)objc_claimAutoreleasedReturnValue( +[PHAsset vcp_fetchOptionsForLibrary:forTaskID:]( &OBJC_CLASS___PHAsset,  "vcp_fetchOptionsForLibrary:forTaskID:",  v10,  1LL));

  [v11 setPredicate:v9];
  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue( +[PHAsset fetchAssetsInAssetCollection:options:]( &OBJC_CLASS___PHAsset,  "fetchAssetsInAssetCollection:options:",  v8,  v11));
  uint64_t v14 = MediaAnalysisLogLevel(v12, v13);
  if ((int)v14 >= 7)
  {
    id v16 = v9;
    uint64_t v17 = VCPLogInstance(v14, v15);
    uint64_t v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(v17);
    os_log_type_t v19 = VCPLogToOSLogType[7];
    if (os_log_type_enabled(v18, v19))
    {
      id v20 = [v12 count];
      id v21 = (void *)objc_claimAutoreleasedReturnValue([v8 localIdentifier]);
      *(_DWORD *)buf = 134218242;
      id v30 = v20;
      __int16 v31 = 2112;
      uint64_t v32 = v21;
      _os_log_impl((void *)&_mh_execute_header, v18, v19, "Collecting %lu assets for Memory %@", buf, 0x16u);
    }

    id v9 = v16;
  }

  if ([v12 count])
  {
    id v28 = v9;
    uint64_t v22 = 0LL;
    while (1)
    {
      int v23 = objc_autoreleasePoolPush();
      if (-[VCPTask isCancelled](self, "isCancelled")) {
        break;
      }
      uint64_t v24 = (void *)objc_claimAutoreleasedReturnValue(+[VCPWatchdog sharedWatchdog](&OBJC_CLASS___VCPWatchdog, "sharedWatchdog"));
      [v24 pet];

      unint64_t v25 = (void *)objc_claimAutoreleasedReturnValue([v12 objectAtIndexedSubscript:v22]);
      int v26 = -[VCPSubsampledAnalysisTask markPrioritizedAsset:skipped:](self, "markPrioritizedAsset:skipped:", v25, buf);

      if (v26) {
        goto LABEL_18;
      }
      if (a5 && !buf[0]) {
        ++*a5;
      }
      objc_autoreleasePoolPop(v23);
      if (++v22 >= (unint64_t)[v12 count])
      {
        int v26 = 0;
        goto LABEL_19;
      }
    }

    int v26 = -128;
LABEL_18:
    objc_autoreleasePoolPop(v23);
LABEL_19:
    id v9 = v28;
  }

  else
  {
    int v26 = 0;
  }

  return v26;
}

- (int)collectMemoriesWithAssetPredicate:(id)a3 andProgressReporter:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (void *)objc_claimAutoreleasedReturnValue(+[MADStateHandler sharedStateHandler](&OBJC_CLASS___MADStateHandler, "sharedStateHandler"));
  [v8 addBreadcrumb:@"[Subsampled] Fetching Memories"];

  id v9 = (void *)objc_claimAutoreleasedReturnValue(-[VCPSubsampledAnalysisTask memorySpecificFetchOptions](self, "memorySpecificFetchOptions"));
  id v10 = (void *)objc_claimAutoreleasedReturnValue( +[PHAssetCollection fetchAssetCollectionsWithType:subtype:options:]( &OBJC_CLASS___PHAssetCollection,  "fetchAssetCollectionsWithType:subtype:options:",  4LL,  0x7FFFFFFFFFFFFFFFLL,  v9));

  id v11 = (void *)objc_claimAutoreleasedReturnValue(+[MADStateHandler sharedStateHandler](&OBJC_CLASS___MADStateHandler, "sharedStateHandler"));
  objc_msgSend(v11, "addBreadcrumb:", @"[Subsampled] Fetched %lu Memories", objc_msgSend(v10, "count"));

  if ([v10 count])
  {
    uint64_t v12 = 0LL;
    while (1)
    {
      uint64_t v13 = objc_autoreleasePoolPush();
      if (-[VCPTask isCancelled](self, "isCancelled"))
      {
        int v16 = -128;
        goto LABEL_17;
      }

      uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue(+[VCPWatchdog sharedWatchdog](&OBJC_CLASS___VCPWatchdog, "sharedWatchdog"));
      [v14 pet];

      uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue([v10 objectAtIndexedSubscript:v12]);
      int v16 = -[VCPSubsampledAnalysisTask collectMemory:withAssetPredicate:andAnalyzedAssetCount:]( self,  "collectMemory:withAssetPredicate:andAnalyzedAssetCount:",  v15,  v6,  &v27);

      if (v16) {
        goto LABEL_17;
      }
      if (v27)
      {
        id v17 = [v7 increaseProcessedJobCountByOne];
        pendingBatch = (VCPBatchAnalysisTask *)((char *)&self->_pendingBatch->super.super.super.isa + 1);
        self->_pendingBatch = pendingBatch;
      }

      else
      {
        pendingBatch = self->_pendingBatch;
      }

      objc_autoreleasePoolPop(v13);
    }

    uint64_t v20 = MediaAnalysisLogLevel(v17, v18);
    if ((int)v20 >= 6)
    {
      uint64_t v22 = VCPLogInstance(v20, v21);
      int v23 = (os_log_s *)objc_claimAutoreleasedReturnValue(v22);
      os_log_type_t v24 = VCPLogToOSLogType[6];
      if (os_log_type_enabled(v23, v24))
      {
        *(_WORD *)buf = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v23,  v24,  "Hit Memory processing limit; skipping remaining Memories",
          buf,
          2u);
      }
    }

    int v16 = 0;
LABEL_17:
    objc_autoreleasePoolPop(v13);
  }

  else
  {
LABEL_10:
    int v16 = 0;
  }

  return v16;
}

- (int)collectMemorieswithProgressReporter:(id)a3
{
  id v26 = a3;
  v36[0] = @"Live Photo";
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate vcp_livePhotosPredicate:](&OBJC_CLASS___NSPredicate, "vcp_livePhotosPredicate:", 0LL));
  v37[0] = v4;
  v36[1] = @"Still Image";
  id v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate vcp_stillImagesPredicate:](&OBJC_CLASS___NSPredicate, "vcp_stillImagesPredicate:", 0LL));
  v37[1] = v5;
  v36[2] = @"Movie";
  id v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate vcp_moviesPredicate:](&OBJC_CLASS___NSPredicate, "vcp_moviesPredicate:", 0LL));
  v37[2] = v6;
  id v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v37,  v36,  3LL));

  __int128 v29 = 0u;
  __int128 v30 = 0u;
  __int128 v27 = 0u;
  __int128 v28 = 0u;
  id v8 = v7;
  id v9 = [v8 countByEnumeratingWithState:&v27 objects:v35 count:16];
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v28;
    os_log_type_t type = VCPLogToOSLogType[7];
    while (2)
    {
      for (i = 0LL; i != v10; i = (char *)i + 1)
      {
        if (*(void *)v28 != v11) {
          objc_enumerationMutation(v8);
        }
        uint64_t v13 = *(void *)(*((void *)&v27 + 1) + 8LL * (void)i);
        uint64_t v14 = objc_autoreleasePoolPush();
        self->_pendingBatch = 0LL;
        uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue([v8 objectForKeyedSubscript:v13]);
        int v16 = -[VCPSubsampledAnalysisTask collectMemoriesWithAssetPredicate:andProgressReporter:]( self,  "collectMemoriesWithAssetPredicate:andProgressReporter:",  v15,  v26);

        if (v16)
        {
          objc_autoreleasePoolPop(v14);
          goto LABEL_15;
        }

        uint64_t v19 = MediaAnalysisLogLevel(v17, v18);
        if ((int)v19 >= 7)
        {
          uint64_t v21 = VCPLogInstance(v19, v20);
          uint64_t v22 = (os_log_s *)objc_claimAutoreleasedReturnValue(v21);
          if (os_log_type_enabled(v22, type))
          {
            pendingBatch = self->_pendingBatch;
            *(_DWORD *)buf = 134218242;
            uint64_t v32 = pendingBatch;
            __int16 v33 = 2112;
            uint64_t v34 = v13;
            _os_log_impl( (void *)&_mh_execute_header,  v22,  type,  "Finished collecting %lu Memories for %@ asset type",  buf,  0x16u);
          }
        }

        objc_autoreleasePoolPop(v14);
      }

      id v10 = [v8 countByEnumeratingWithState:&v27 objects:v35 count:16];
      if (v10) {
        continue;
      }
      break;
    }
  }

  int v16 = 0;
LABEL_15:

  return v16;
}

- (int)collectWallpaperSuggestionWithAssetPredicate:(id)a3 andProgressReporter:(id)a4
{
  id v6 = a3;
  id v51 = a4;
  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[VCPTask photoLibrary](self, "photoLibrary"));
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 librarySpecificFetchOptions]);

  id v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSPredicate predicateWithFormat:]( &OBJC_CLASS___NSPredicate,  "predicateWithFormat:",  @"%K != %d",  @"state",  4LL));
  v55[0] = v9;
  id v10 = (void *)objc_claimAutoreleasedReturnValue( +[PHSuggestion predicateForAllFeaturedStateEnabledSuggestionTypesForWallpaper]( &OBJC_CLASS___PHSuggestion,  "predicateForAllFeaturedStateEnabledSuggestionTypesForWallpaper"));
  v55[1] = v10;
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v55, 2LL));
  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue( +[NSCompoundPredicate andPredicateWithSubpredicates:]( &OBJC_CLASS___NSCompoundPredicate,  "andPredicateWithSubpredicates:",  v11));
  [v8 setPredicate:v12];

  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue( +[PHSuggestion fetchSuggestionsWithOptions:]( &OBJC_CLASS___PHSuggestion,  "fetchSuggestionsWithOptions:",  v8));
  uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue(+[MADStateHandler sharedStateHandler](&OBJC_CLASS___MADStateHandler, "sharedStateHandler"));
  [v14 addBreadcrumb:@"[Subsampled] Fetching wallpaper suggestions"];

  uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue(-[VCPTask photoLibrary](self, "photoLibrary"));
  int v16 = (void *)objc_claimAutoreleasedReturnValue( +[PHAsset vcp_fetchOptionsForLibrary:forTaskID:]( &OBJC_CLASS___PHAsset,  "vcp_fetchOptionsForLibrary:forTaskID:",  v15,  1LL));

  [v16 setPredicate:v6];
  uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue( +[PHAsset fetchKeyAssetForEachSuggestion:options:]( &OBJC_CLASS___PHAsset,  "fetchKeyAssetForEachSuggestion:options:",  v13,  v16));
  uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue(+[MADStateHandler sharedStateHandler](&OBJC_CLASS___MADStateHandler, "sharedStateHandler"));
  objc_msgSend( v18,  "addBreadcrumb:",  @"[Subsampled] Fetched %lu wallpaper suggestions",  objc_msgSend(v17, "count"));

  uint64_t v21 = MediaAnalysisLogLevel(v19, v20);
  if ((int)v21 >= 7)
  {
    uint64_t v23 = VCPLogInstance(v21, v22);
    os_log_type_t v24 = (os_log_s *)objc_claimAutoreleasedReturnValue(v23);
    os_log_type_t v25 = VCPLogToOSLogType[7];
    if (os_log_type_enabled(v24, v25))
    {
      *(_DWORD *)buf = 134217984;
      id v54 = [v17 count];
      _os_log_impl((void *)&_mh_execute_header, v24, v25, "Collecting %lu assets for Wallpaper suggestion", buf, 0xCu);
    }
  }

  if ([v17 count])
  {
    __int16 v48 = v13;
    uint64_t v49 = v8;
    id v50 = v6;
    uint64_t v26 = 0LL;
    os_log_type_t v27 = VCPLogToOSLogType[7];
    while (1)
    {
      __int128 v28 = objc_autoreleasePoolPush();
      uint64_t v30 = MediaAnalysisLogLevel(v28, v29);
      if ((int)v30 >= 7)
      {
        uint64_t v32 = VCPLogInstance(v30, v31);
        __int16 v33 = (os_log_s *)objc_claimAutoreleasedReturnValue(v32);
        if (os_log_type_enabled(v33, v27))
        {
          uint64_t v34 = (void *)objc_claimAutoreleasedReturnValue([v17 objectAtIndexedSubscript:v26]);
          uint64_t v35 = (void *)objc_claimAutoreleasedReturnValue([v34 localIdentifier]);
          *(_DWORD *)buf = 138412290;
          id v54 = v35;
          _os_log_impl((void *)&_mh_execute_header, v33, v27, "%@", buf, 0xCu);
        }
      }

      if (-[VCPTask isCancelled](self, "isCancelled"))
      {
        int v41 = -128;
        id v8 = v49;
        id v6 = v50;
        uint64_t v13 = v48;
        goto LABEL_25;
      }

      os_log_type_t v36 = (void *)objc_claimAutoreleasedReturnValue(+[VCPWatchdog sharedWatchdog](&OBJC_CLASS___VCPWatchdog, "sharedWatchdog"));
      [v36 pet];

      uint64_t v37 = (void *)objc_claimAutoreleasedReturnValue([v17 objectAtIndexedSubscript:v26]);
      -[VCPSubsampledAnalysisTask markPrioritizedAsset:skipped:](self, "markPrioritizedAsset:skipped:", v37, &v52);

      if (v52)
      {
        unint64_t highlightCount = self->_highlightCount;
      }

      else
      {
        id v38 = [v51 increaseProcessedJobCountByOne];
        unint64_t highlightCount = self->_highlightCount + 1;
        self->_unint64_t highlightCount = highlightCount;
      }

      if (highlightCount >= 0x1F4) {
        break;
      }
      objc_autoreleasePoolPop(v28);
      if (++v26 >= (unint64_t)[v17 count])
      {
        int v41 = 0;
        id v8 = v49;
        id v6 = v50;
        uint64_t v13 = v48;
        goto LABEL_26;
      }
    }

    uint64_t v42 = MediaAnalysisLogLevel(v38, v39);
    id v8 = v49;
    id v6 = v50;
    uint64_t v13 = v48;
    if ((int)v42 >= 6)
    {
      uint64_t v44 = VCPLogInstance(v42, v43);
      __int128 v45 = (os_log_s *)objc_claimAutoreleasedReturnValue(v44);
      os_log_type_t v46 = VCPLogToOSLogType[6];
      if (os_log_type_enabled(v45, v46))
      {
        *(_WORD *)buf = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v45,  v46,  "Hit wallpaper suggestion collection limit; skipping remaining wallpaper suggestion",
          buf,
          2u);
      }
    }

    int v41 = 0;
LABEL_25:
    objc_autoreleasePoolPop(v28);
  }

  else
  {
    int v41 = 0;
  }

- (int)collectWallpaperSuggestionwithProgressReporter:(id)a3
{
  id v24 = a3;
  uint64_t v34 = @"Live Photo";
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate vcp_livePhotosPredicate:](&OBJC_CLASS___NSPredicate, "vcp_livePhotosPredicate:", 0LL));
  uint64_t v35 = v4;
  id v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v35,  &v34,  1LL));

  __int128 v27 = 0u;
  __int128 v28 = 0u;
  __int128 v25 = 0u;
  __int128 v26 = 0u;
  id v6 = v5;
  id v7 = [v6 countByEnumeratingWithState:&v25 objects:v33 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v26;
    os_log_type_t type = VCPLogToOSLogType[7];
    while (2)
    {
      for (i = 0LL; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v26 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void *)(*((void *)&v25 + 1) + 8LL * (void)i);
        uint64_t v12 = objc_autoreleasePoolPush();
        self->_unint64_t highlightCount = 0LL;
        uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKeyedSubscript:v11]);
        int v14 = -[VCPSubsampledAnalysisTask collectWallpaperSuggestionWithAssetPredicate:andProgressReporter:]( self,  "collectWallpaperSuggestionWithAssetPredicate:andProgressReporter:",  v13,  v24);

        if (v14)
        {
          objc_autoreleasePoolPop(v12);
          goto LABEL_15;
        }

        uint64_t v17 = MediaAnalysisLogLevel(v15, v16);
        if ((int)v17 >= 7)
        {
          uint64_t v19 = VCPLogInstance(v17, v18);
          uint64_t v20 = (os_log_s *)objc_claimAutoreleasedReturnValue(v19);
          if (os_log_type_enabled(v20, type))
          {
            unint64_t highlightCount = self->_highlightCount;
            *(_DWORD *)buf = 134218242;
            unint64_t v30 = highlightCount;
            __int16 v31 = 2112;
            uint64_t v32 = v11;
            _os_log_impl( (void *)&_mh_execute_header,  v20,  type,  "Finished collecting %lu Wallpaper suggestion for %@ asset type",  buf,  0x16u);
          }
        }

        objc_autoreleasePoolPop(v12);
      }

      id v8 = [v6 countByEnumeratingWithState:&v25 objects:v33 count:16];
      if (v8) {
        continue;
      }
      break;
    }
  }

  int v14 = 0;
LABEL_15:

  return v14;
}

- (unint64_t)queryWallpaperSuggestionCount
{
  int v3 = (void *)objc_claimAutoreleasedReturnValue(-[VCPTask photoLibrary](self, "photoLibrary"));
  v4 = (void *)objc_claimAutoreleasedReturnValue([v3 librarySpecificFetchOptions]);

  id v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSPredicate predicateWithFormat:]( &OBJC_CLASS___NSPredicate,  "predicateWithFormat:",  @"%K != %d",  @"state",  4LL));
  v16[0] = v5;
  id v6 = (void *)objc_claimAutoreleasedReturnValue( +[PHSuggestion predicateForAllFeaturedStateEnabledSuggestionTypesForWallpaper]( &OBJC_CLASS___PHSuggestion,  "predicateForAllFeaturedStateEnabledSuggestionTypesForWallpaper"));
  v16[1] = v6;
  id v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v16, 2LL));
  id v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSCompoundPredicate andPredicateWithSubpredicates:]( &OBJC_CLASS___NSCompoundPredicate,  "andPredicateWithSubpredicates:",  v7));
  [v4 setPredicate:v8];

  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue( +[PHSuggestion fetchSuggestionsWithOptions:]( &OBJC_CLASS___PHSuggestion,  "fetchSuggestionsWithOptions:",  v4));
  id v10 = (void *)objc_claimAutoreleasedReturnValue(-[VCPTask photoLibrary](self, "photoLibrary"));
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([v10 librarySpecificFetchOptions]);

  [v11 setShouldPrefetchCount:1];
  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate vcp_livePhotosPredicate:](&OBJC_CLASS___NSPredicate, "vcp_livePhotosPredicate:", 0LL));
  [v11 setPredicate:v12];

  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue( +[PHAsset fetchKeyAssetForEachSuggestion:options:]( &OBJC_CLASS___PHAsset,  "fetchKeyAssetForEachSuggestion:options:",  v9,  v11));
  id v14 = [v13 count];

  return (unint64_t)v14;
}

- (unint64_t)queryHighlightCount
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[VCPTask photoLibrary](self, "photoLibrary"));
  int v3 = (void *)objc_claimAutoreleasedReturnValue([v2 librarySpecificFetchOptions]);

  [v3 setShouldPrefetchCount:1];
  v4 = (void *)objc_claimAutoreleasedReturnValue( +[PHAssetCollection fetchAssetCollectionsWithType:subtype:options:]( &OBJC_CLASS___PHAssetCollection,  "fetchAssetCollectionsWithType:subtype:options:",  6LL,  0x7FFFFFFFFFFFFFFFLL,  v3));
  id v5 = [v4 count];

  return (unint64_t)v5;
}

- (unint64_t)queryMemoryCount
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[VCPSubsampledAnalysisTask memorySpecificFetchOptions](self, "memorySpecificFetchOptions"));
  [v2 setShouldPrefetchCount:1];
  int v3 = (void *)objc_claimAutoreleasedReturnValue( +[PHAssetCollection fetchAssetCollectionsWithType:subtype:options:]( &OBJC_CLASS___PHAssetCollection,  "fetchAssetCollectionsWithType:subtype:options:",  4LL,  0x7FFFFFFFFFFFFFFFLL,  v2));
  id v4 = [v3 count];

  return (unint64_t)v4;
}

- (int)checkAndMarkPriorityAssets
{
  uint64_t v3 = PrioritizedAssetCollectionFinishTimestampKey;
  double v4 = (double)(uint64_t)[self->super._progressHandler valueForKey:PrioritizedAssetCollectionFinishTimestampKey];
  id v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate now](&OBJC_CLASS___NSDate, "now"));
  [v5 timeIntervalSince1970];
  double v7 = v6;

  uint64_t v10 = MediaAnalysisLogLevel(v8, v9);
  if (v7 - v4 > 604800.0)
  {
    if ((int)v10 >= 5)
    {
      uint64_t v12 = VCPLogInstance(v10, v11);
      uint64_t v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
      os_log_type_t v14 = VCPLogToOSLogType[5];
      if (os_log_type_enabled(v13, v14))
      {
        *(_WORD *)buf = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v13,  v14,  "Last finish is beyond cutoff time. Collecting priority assets...",  buf,  2u);
      }
    }

    [self->super._progressHandler clearPrioritizedAssets];
    uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue(-[VCPTask progressHandler](self, "progressHandler"));

    uint64_t v122 = v3;
    if (v15)
    {
      unint64_t v16 = -[VCPSubsampledAnalysisTask queryHighlightCount](self, "queryHighlightCount");
      if (3 * v16 >= 0x5DC) {
        uint64_t v17 = 1500LL;
      }
      else {
        uint64_t v17 = 3 * v16;
      }
      unint64_t v18 = -[VCPSubsampledAnalysisTask queryMemoryCount](self, "queryMemoryCount");
      if (3 * v18 >= 0x1E) {
        uint64_t v19 = 30LL;
      }
      else {
        uint64_t v19 = 3 * v18;
      }
      unint64_t v20 = -[VCPSubsampledAnalysisTask queryWallpaperSuggestionCount](self, "queryWallpaperSuggestionCount");
      if (v20 >= 0x1F4) {
        uint64_t v22 = 500LL;
      }
      else {
        uint64_t v22 = v20;
      }
      uint64_t v23 = MediaAnalysisLogLevel(v20, v21);
      if ((int)v23 >= 6)
      {
        uint64_t v25 = VCPLogInstance(v23, v24);
        __int128 v26 = (os_log_s *)objc_claimAutoreleasedReturnValue(v25);
        os_log_type_t v27 = VCPLogToOSLogType[6];
        if (os_log_type_enabled(v26, v27))
        {
          *(_DWORD *)buf = 134218496;
          uint64_t v131 = v17;
          __int16 v132 = 2048;
          uint64_t v133 = v19;
          __int16 v134 = 2048;
          uint64_t v135 = v22;
          _os_log_impl( (void *)&_mh_execute_header,  v26,  v27,  "Fetched %lu Highlights and %lu Memories and %lu Wallpaper Suggestions",  buf,  0x20u);
        }
      }

      if (v17 || v19 || v22)
      {
        uint64_t v31 = v19 + v17 + v22;
        uint64_t v32 = (void *)objc_claimAutoreleasedReturnValue(-[VCPTask progressHandler](self, "progressHandler"));
        uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue( +[VCPProgressReporter reporterWithIntervalSeconds:andTotalJobCount:andBlock:]( &OBJC_CLASS___VCPProgressReporter,  "reporterWithIntervalSeconds:andTotalJobCount:andBlock:",  10LL,  v31,  v32));
      }

      else
      {
        uint64_t v15 = 0LL;
      }
    }

    __int16 v33 = (void *)objc_claimAutoreleasedReturnValue( +[NSDate dateWithTimeIntervalSinceNow:]( &OBJC_CLASS___NSDate,  "dateWithTimeIntervalSinceNow:",  -7776000.0));
    v123 = (void *)objc_claimAutoreleasedReturnValue( +[NSPredicate predicateWithFormat:]( &OBJC_CLASS___NSPredicate,  "predicateWithFormat:",  @"startDate >= %@",  v33));
    v124 = (void *)objc_claimAutoreleasedReturnValue( +[NSPredicate predicateWithFormat:]( &OBJC_CLASS___NSPredicate,  "predicateWithFormat:",  @"startDate < %@",  v33));
    uint64_t v35 = MediaAnalysisLogLevel(v124, v34);
    if ((int)v35 >= 6)
    {
      uint64_t v37 = VCPLogInstance(v35, v36);
      id v38 = (os_log_s *)objc_claimAutoreleasedReturnValue(v37);
      os_log_type_t v39 = VCPLogToOSLogType[6];
      if (os_log_type_enabled(v38, v39))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v38, v39, "Collecting all assets in Memories...", buf, 2u);
      }
    }

    uint64_t v40 = VCPSignPostLog(v35);
    int v41 = (os_log_s *)objc_claimAutoreleasedReturnValue(v40);
    os_signpost_id_t v42 = os_signpost_id_generate(v41);

    uint64_t v44 = VCPSignPostLog(v43);
    __int128 v45 = (os_log_s *)objc_claimAutoreleasedReturnValue(v44);
    os_log_type_t v46 = v45;
    if (v42 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v45))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v46,  OS_SIGNPOST_INTERVAL_BEGIN,  v42,  "VCPSubsampledAnalysisProcessMemories",  (const char *)&unk_100199097,  buf,  2u);
    }

    uint64_t v47 = -[VCPSubsampledAnalysisTask collectMemorieswithProgressReporter:]( self,  "collectMemorieswithProgressReporter:",  v15);
    unsigned int v48 = v47;
    if ((_DWORD)v47) {
      goto LABEL_87;
    }
    uint64_t v49 = VCPSignPostLog(v47);
    id v50 = (os_log_s *)objc_claimAutoreleasedReturnValue(v49);
    id v51 = v50;
    if (v42 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v50))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v51,  OS_SIGNPOST_INTERVAL_END,  v42,  "VCPSubsampledAnalysisProcessMemories",  (const char *)&unk_100199097,  buf,  2u);
    }

    uint64_t v54 = MediaAnalysisLogLevel(v52, v53);
    if ((int)v54 >= 6)
    {
      uint64_t v56 = VCPLogInstance(v54, v55);
      uint64_t v57 = (os_log_s *)objc_claimAutoreleasedReturnValue(v56);
      os_log_type_t v58 = VCPLogToOSLogType[6];
      if (os_log_type_enabled(v57, v58))
      {
        *(_DWORD *)buf = 138412290;
        uint64_t v131 = (uint64_t)v33;
        _os_log_impl( (void *)&_mh_execute_header,  v57,  v58,  "Collecting all assets in Highlights after %@...",  buf,  0xCu);
      }
    }

    uint64_t v59 = VCPSignPostLog(v54);
    v60 = (os_log_s *)objc_claimAutoreleasedReturnValue(v59);
    os_signpost_id_t v61 = os_signpost_id_generate(v60);

    uint64_t v63 = VCPSignPostLog(v62);
    unsigned int v64 = (os_log_s *)objc_claimAutoreleasedReturnValue(v63);
    v65 = v64;
    if (v61 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v64))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v65,  OS_SIGNPOST_INTERVAL_BEGIN,  v61,  "VCPSubsampledAnalysisProcessRecentHighlights",  (const char *)&unk_100199097,  buf,  2u);
    }

    uint64_t v66 = -[VCPSubsampledAnalysisTask collectHighlightsOfTypes:withHighlightPredicate:andLimit:andProgressReporter:]( self,  "collectHighlightsOfTypes:withHighlightPredicate:andLimit:andProgressReporter:",  0x7FFFFFFFFFFFFFFFLL,  v123,  0LL,  v15);
    unsigned int v48 = v66;
    if ((_DWORD)v66) {
      goto LABEL_87;
    }
    uint64_t v67 = VCPSignPostLog(v66);
    unint64_t v68 = (os_log_s *)objc_claimAutoreleasedReturnValue(v67);
    v69 = v68;
    if (v61 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v68))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v69,  OS_SIGNPOST_INTERVAL_END,  v61,  "VCPSubsampledAnalysisProcessRecentHighlights",  (const char *)&unk_100199097,  buf,  2u);
    }

    uint64_t v72 = MediaAnalysisLogLevel(v70, v71);
    if ((int)v72 >= 6)
    {
      uint64_t v74 = VCPLogInstance(v72, v73);
      v75 = (os_log_s *)objc_claimAutoreleasedReturnValue(v74);
      os_log_type_t v76 = VCPLogToOSLogType[6];
      if (os_log_type_enabled(v75, v76))
      {
        *(_DWORD *)buf = 138412290;
        uint64_t v131 = (uint64_t)v33;
        _os_log_impl( (void *)&_mh_execute_header,  v75,  v76,  "Collecting subsampled assets in Moments before %@",  buf,  0xCu);
      }
    }

    uint64_t v77 = VCPSignPostLog(v72);
    v78 = (os_log_s *)objc_claimAutoreleasedReturnValue(v77);
    os_signpost_id_t v79 = os_signpost_id_generate(v78);

    uint64_t v81 = VCPSignPostLog(v80);
    v82 = (os_log_s *)objc_claimAutoreleasedReturnValue(v81);
    v83 = v82;
    unint64_t v84 = v79 - 1;
    if (v79 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v82))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v83,  OS_SIGNPOST_INTERVAL_BEGIN,  v79,  "VCPSubsampledAnalysisProcessOlderHighlights",  (const char *)&unk_100199097,  buf,  2u);
    }

    os_signpost_id_t spid = v79;

    __int128 v127 = 0u;
    __int128 v128 = 0u;
    __int128 v125 = 0u;
    __int128 v126 = 0u;
    id v85 = [&off_1001C9480 countByEnumeratingWithState:&v125 objects:v129 count:16];
    if (v85)
    {
      id v86 = v85;
      uint64_t v87 = *(void *)v126;
      unint64_t v121 = v84;
      while (2)
      {
        v88 = 0LL;
        do
        {
          if (*(void *)v126 != v87) {
            objc_enumerationMutation(&off_1001C9480);
          }
          v89 = *(void **)(*((void *)&v125 + 1) + 8LL * (void)v88);
          v90 = objc_autoreleasePoolPush();
          v91 = v90;
          if (self->_changeManager >= (VCPPhotosAssetChangeManager *)0x5DC)
          {
            objc_autoreleasePoolPop(v90);
            unint64_t v84 = v121;
            goto LABEL_70;
          }

          unsigned int v48 = -[VCPSubsampledAnalysisTask collectHighlightsOfTypes:withHighlightPredicate:andLimit:andProgressReporter:]( self,  "collectHighlightsOfTypes:withHighlightPredicate:andLimit:andProgressReporter:",  [v89 unsignedIntegerValue],  v124,  1,  v15);
          objc_autoreleasePoolPop(v91);
          if (v48) {
            goto LABEL_87;
          }
          v88 = (char *)v88 + 1;
        }

        while (v86 != v88);
        id v85 = [&off_1001C9480 countByEnumeratingWithState:&v125 objects:v129 count:16];
        id v86 = v85;
        unint64_t v84 = v121;
        if (v85) {
          continue;
        }
        break;
      }
    }

- (int)processPriorityAssets:(id)a3 progressReporter:(id)a4
{
  id v6 = a3;
  id v38 = a4;
  __int128 v40 = 0u;
  __int128 v41 = 0u;
  __int128 v42 = 0u;
  __int128 v43 = 0u;
  id v7 = v6;
  id v8 = [v7 countByEnumeratingWithState:&v40 objects:v44 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v41;
    while (2)
    {
      for (i = 0LL; i != v9; i = (char *)i + 1)
      {
        if (*(void *)v41 != v10) {
          objc_enumerationMutation(v7);
        }
        uint64_t v12 = *(void **)(*((void *)&v40 + 1) + 8LL * (void)i);
        uint64_t v13 = objc_autoreleasePoolPush();
        unsigned int v14 = -[VCPSubsampledAnalysisTask processAsset:skipped:](self, "processAsset:skipped:", v12, buf);
        if (v14)
        {
          unsigned int v19 = v14;
          objc_autoreleasePoolPop(v13);

          uint64_t v22 = MediaAnalysisLogLevel(v20, v21);
          if ((int)v22 > 6)
          {
            uint64_t v24 = VCPLogInstance(v22, v23);
            uint64_t v25 = (os_log_s *)objc_claimAutoreleasedReturnValue(v24);
            os_log_type_t v26 = VCPLogToOSLogType[7];
            if (os_log_type_enabled(v25, v26))
            {
              *(_WORD *)buf = 0;
              _os_log_impl((void *)&_mh_execute_header, v25, v26, "Priority assets analysis bailed", buf, 2u);
            }
          }

          os_log_type_t v27 = (void *)objc_claimAutoreleasedReturnValue(+[VCPDownloadManager sharedManager](&OBJC_CLASS___VCPDownloadManager, "sharedManager"));
          [v27 flush];

          id v28 = -[PHPhotoLibrary publishPendingChanges](self->super._photoLibrary, "publishPendingChanges");
          if ((_DWORD)v28)
          {
            uint64_t v30 = MediaAnalysisLogLevel(v28, v29);
            if ((int)v30 >= 4)
            {
              uint64_t v32 = VCPLogInstance(v30, v31);
              __int16 v33 = (os_log_s *)objc_claimAutoreleasedReturnValue(v32);
              os_log_type_t v34 = VCPLogToOSLogType[4];
              if (os_log_type_enabled(v33, v34))
              {
                *(_WORD *)buf = 0;
                _os_log_impl( (void *)&_mh_execute_header,  v33,  v34,  "Failed to publish PHAssetPropertySetMediaAnalysis changes",  buf,  2u);
              }
            }
          }

          unsigned int v35 = [self->super._progressHandler commit];
          int v17 = v35;
          if (v35 != -108 && v35 != -36 && v35 != -23) {
            int v17 = v19;
          }
          goto LABEL_29;
        }

        if (!buf[0]) {
          [v38 increaseProcessedJobCountByOne];
        }
        id progressHandler = self->super._progressHandler;
        unint64_t v16 = (void *)objc_claimAutoreleasedReturnValue([v12 localIdentifier]);
        int v17 = [progressHandler removePrioritizedLocalIdentifier:v16];

        objc_autoreleasePoolPop(v13);
        if (v17)
        {

          goto LABEL_29;
        }
      }

      id v9 = [v7 countByEnumeratingWithState:&v40 objects:v44 count:16];
      if (v9) {
        continue;
      }
      break;
    }
  }

  unint64_t v18 = (void *)objc_claimAutoreleasedReturnValue(+[VNSession globalSession](&OBJC_CLASS___VNSession, "globalSession"));
  [v18 releaseCachedResources];

  int v17 = 0;
LABEL_29:

  return v17;
}

- (int)mainInternal
{
  uint64_t v3 = VCPSignPostLog(self);
  double v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  os_signpost_id_t v5 = os_signpost_id_generate(v4);

  uint64_t v7 = VCPSignPostLog(v6);
  id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
  id v9 = v8;
  unint64_t v10 = v5 - 1;
  if (v5 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v8))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v9,  OS_SIGNPOST_INTERVAL_BEGIN,  v5,  "VCPSubsampledAnalysisTask",  (const char *)&unk_100199097,  buf,  2u);
  }

  uint64_t v13 = MediaAnalysisLogLevel(v11, v12);
  if ((int)v13 >= 6)
  {
    uint64_t v15 = VCPLogInstance(v13, v14);
    unint64_t v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(v15);
    os_log_type_t v17 = VCPLogToOSLogType[6];
    if (os_log_type_enabled(v16, v17))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v16, v17, "Checking and processing prioritized assets...", buf, 2u);
    }
  }

  unint64_t v18 = (void *)objc_claimAutoreleasedReturnValue(-[VCPTask photoLibrary](self, "photoLibrary"));
  unsigned int v19 = [v18 isCloudPhotoLibraryEnabled];

  if (v19)
  {
    uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue(+[VCPInternetReachability sharedInstance](&OBJC_CLASS___VCPInternetReachability, "sharedInstance"));
    LOBYTE(self->_memoryCountPerAssetType) = [v20 hasWifiOrEthernetConnection];

    if (LOBYTE(self->_memoryCountPerAssetType))
    {
      uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue(-[VCPTask cancel](self, "cancel"));
      uint64_t v24 = (void *)objc_claimAutoreleasedReturnValue(+[VCPDownloadManager sharedManager](&OBJC_CLASS___VCPDownloadManager, "sharedManager"));
      [v24 setCancel:v23];

LABEL_11:
      goto LABEL_12;
    }

    uint64_t v38 = MediaAnalysisLogLevel(v21, v22);
    if ((int)v38 >= 6)
    {
      uint64_t v40 = VCPLogInstance(v38, v39);
      uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue(v40);
      os_log_type_t v41 = VCPLogToOSLogType[6];
      if (os_log_type_enabled((os_log_t)v23, v41))
      {
        *(_WORD *)buf = 0;
        _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)v23,  v41,  "Wifi/Ethernet connection unavailable; disabling streaming analysis",
          buf,
          2u);
      }

      goto LABEL_11;
    }
  }

- (void).cxx_destruct
{
}

@end