@interface VCPBatchAnalysisTask
+ (id)taskWithPhotoLibrary:(id)a3;
- (BOOL)allowStreaming;
- (BOOL)containsAsset:(id)a3;
- (VCPBatchAnalysisTask)initWithPhotoLibrary:(id)a3;
- (VCPPhotosAssetChangeManager)photosChangeManager;
- (VCPProgressReporter)progressReporter;
- (double)cost;
- (int)mainInternal;
- (void)addAnalysis:(unint64_t)a3 withExistingAnalysis:(id)a4 forAsset:(id)a5;
- (void)addAnalysis:(unint64_t)a3 withExistingAnalysis:(id)a4 forAsset:(id)a5 allowStreaming:(BOOL)a6;
- (void)setAllowStreaming:(BOOL)a3;
- (void)setPhotosChangeManager:(id)a3;
- (void)setProgressReporter:(id)a3;
@end

@implementation VCPBatchAnalysisTask

- (VCPBatchAnalysisTask)initWithPhotoLibrary:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)&OBJC_CLASS___VCPBatchAnalysisTask;
  v5 = -[VCPTask initWithPhotoLibrary:](&v10, "initWithPhotoLibrary:", v4);
  v6 = v5;
  if (v5)
  {
    v5->_subtasks = 0LL;
    LOBYTE(v5->super._photoLibrary) = 0;
    uint64_t v7 = objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
    id progressHandler = v6->super._progressHandler;
    v6->super._id progressHandler = (id)v7;
  }

  return v6;
}

+ (id)taskWithPhotoLibrary:(id)a3
{
  id v4 = a3;
  id v5 = [objc_alloc((Class)objc_opt_class(a1)) initWithPhotoLibrary:v4];

  return v5;
}

- (void)addAnalysis:(unint64_t)a3 withExistingAnalysis:(id)a4 forAsset:(id)a5 allowStreaming:(BOOL)a6
{
  BOOL v6 = a6;
  id v10 = a4;
  id v11 = a5;
  id v12 = -[VCPBatchAnalysisTask isExecuting](self, "isExecuting");
  if ((v12 & 1) == 0)
  {
    id v12 = -[VCPBatchAnalysisTask isFinished](self, "isFinished");
    if (!(_DWORD)v12)
    {
      uint64_t v20 = MediaAnalysisLogLevel(v12, v13);
      if ((int)v20 >= 7)
      {
        uint64_t v22 = VCPLogInstance(v20, v21);
        v23 = (os_log_s *)objc_claimAutoreleasedReturnValue(v22);
        os_log_type_t v24 = VCPLogToOSLogType[7];
        if (os_log_type_enabled(v23, v24))
        {
          id v25 = (id)objc_claimAutoreleasedReturnValue([v11 localIdentifier]);
          v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "vcp_typeDescription"));
          uint64_t v27 = MediaAnalysisTypeShortDescription(a3);
          v28 = (void *)objc_claimAutoreleasedReturnValue(v27);
          int v32 = 138412802;
          id v33 = v25;
          __int16 v34 = 2112;
          v35 = v26;
          __int16 v36 = 2112;
          v37 = v28;
          _os_log_impl( (void *)&_mh_execute_header,  v23,  v24,  "  [%@] Batching %@ for analysis (%@)",  (uint8_t *)&v32,  0x20u);
        }
      }

      v17 = (void *)objc_claimAutoreleasedReturnValue( +[VCPAssetAnalysisTask taskWithAnalysisTypes:forAsset:withExistingAnalysis:]( &OBJC_CLASS___VCPAssetAnalysisTask,  "taskWithAnalysisTypes:forAsset:withExistingAnalysis:",  a3,  v11,  v10));
      v29 = (void *)objc_claimAutoreleasedReturnValue(-[VCPTask cancel](self, "cancel"));
      [v17 setCancel:v29];

      [v17 setAllowStreaming:v6];
      v30 = (void *)objc_claimAutoreleasedReturnValue(-[VCPBatchAnalysisTask photosChangeManager](self, "photosChangeManager"));
      [v17 setPhotosChangeManager:v30];

      [v17 cost];
      *(double *)&self->_subtasks = v31 + *(double *)&self->_subtasks;
      [self->super._progressHandler addObject:v17];
      goto LABEL_11;
    }
  }

  uint64_t v14 = MediaAnalysisLogLevel(v12, v13);
  if ((int)v14 >= 4)
  {
    uint64_t v16 = VCPLogInstance(v14, v15);
    v17 = (void *)objc_claimAutoreleasedReturnValue(v16);
    os_log_type_t v18 = VCPLogToOSLogType[4];
    if (os_log_type_enabled((os_log_t)v17, v18))
    {
      v19 = (void *)objc_claimAutoreleasedReturnValue([v11 localIdentifier]);
      int v32 = 138412290;
      id v33 = v19;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)v17,  v18,  "  [%@] Batch analysis task cannot be modified; dropping",
        (uint8_t *)&v32,
        0xCu);
    }

- (void)addAnalysis:(unint64_t)a3 withExistingAnalysis:(id)a4 forAsset:(id)a5
{
  id v9 = a4;
  id v8 = a5;
  -[VCPBatchAnalysisTask addAnalysis:withExistingAnalysis:forAsset:allowStreaming:]( self,  "addAnalysis:withExistingAnalysis:forAsset:allowStreaming:",  a3,  v9,  v8,  -[VCPBatchAnalysisTask allowStreaming](self, "allowStreaming"));
}

- (BOOL)containsAsset:(id)a3
{
  id v4 = a3;
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  id v5 = self->super._progressHandler;
  id v6 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v15;
    while (2)
    {
      for (i = 0LL; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v15 != v7) {
          objc_enumerationMutation(v5);
        }
        id v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((void *)&v14 + 1) + 8 * (void)i), "asset", (void)v14));
        id v10 = (void *)objc_claimAutoreleasedReturnValue([v9 localIdentifier]);
        id v11 = (void *)objc_claimAutoreleasedReturnValue([v4 localIdentifier]);
        unsigned __int8 v12 = [v10 isEqualToString:v11];

        if ((v12 & 1) != 0)
        {
          LOBYTE(v6) = 1;
          goto LABEL_11;
        }
      }

      id v6 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }

- (int)mainInternal
{
  uint64_t v4 = MediaAnalysisLogLevel(self, a2);
  if ((int)v4 >= 6)
  {
    uint64_t v6 = VCPLogInstance(v4, v5);
    uint64_t v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
    os_log_type_t v8 = VCPLogToOSLogType[6];
    if (os_log_type_enabled(v7, v8))
    {
      unsigned int v9 = [self->super._progressHandler count];
      *(_DWORD *)buf = 67109120;
      unsigned int v59 = v9;
      _os_log_impl((void *)&_mh_execute_header, v7, v8, "Batch analyzing %d assets", buf, 8u);
    }
  }

  id v10 = (void *)objc_claimAutoreleasedReturnValue(-[VCPTask photoLibrary](self, "photoLibrary"));
  v45 = (void *)objc_claimAutoreleasedReturnValue( +[VCPDatabaseManager sharedDatabaseForPhotoLibrary:]( &OBJC_CLASS___VCPDatabaseManager,  "sharedDatabaseForPhotoLibrary:",  v10));

  __int128 v54 = 0u;
  __int128 v55 = 0u;
  __int128 v52 = 0u;
  __int128 v53 = 0u;
  id obj = self->super._progressHandler;
  id v11 = [obj countByEnumeratingWithState:&v52 objects:v57 count:16];
  if (!v11)
  {
LABEL_24:

    unsigned int v20 = [v45 commit];
    if (v20 == -108 || v20 == -36)
    {
      unsigned int v21 = v20;
    }

    else
    {
      unsigned int v21 = v20;
      if (v20 != -23) {
        unsigned int v21 = v2;
      }
    }

    if (v20 == -108 || v20 == -36 || v20 == -23)
    {
      LODWORD(v2) = v21;
      goto LABEL_61;
    }

    unsigned int v42 = v21;
    id obj = (id)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
    __int128 v50 = 0u;
    __int128 v51 = 0u;
    __int128 v48 = 0u;
    __int128 v49 = 0u;
    id v44 = self->super._progressHandler;
    LODWORD(v2) = 0;
    id v22 = [v44 countByEnumeratingWithState:&v48 objects:v56 count:16];
    if (!v22) {
      goto LABEL_48;
    }
    uint64_t v23 = *(void *)v49;
LABEL_35:
    uint64_t v24 = 0LL;
    while (1)
    {
      if (*(void *)v49 != v23) {
        objc_enumerationMutation(v44);
      }
      id v25 = *(void **)(*((void *)&v48 + 1) + 8 * v24);
      v26 = objc_autoreleasePoolPush();
      uint64_t v27 = (void *)objc_claimAutoreleasedReturnValue(+[VCPWatchdog sharedWatchdog](&OBJC_CLASS___VCPWatchdog, "sharedWatchdog"));
      [v27 pet];

      if (!(_DWORD)v2)
      {
        if (!-[VCPTask isCancelled](self, "isCancelled"))
        {
          v30 = (void *)objc_claimAutoreleasedReturnValue(+[VCPMADQoSManager sharedManager](&OBJC_CLASS___VCPMADQoSManager, "sharedManager"));
          v47[0] = _NSConcreteStackBlock;
          v47[1] = 3221225472LL;
          v47[2] = sub_10009D800;
          v47[3] = &unk_1001BA0C8;
          v47[4] = v25;
          [v30 runBlock:v47 withTaskID:1];

          if (+[VCPVideoCNNAnalyzer isMUBackboneEnabled]( &OBJC_CLASS___VCPVideoCNNAnalyzer,  "isMUBackboneEnabled"))
          {
            double v31 = (void *)objc_claimAutoreleasedReturnValue([v25 asset]);
            int v32 = (void *)objc_claimAutoreleasedReturnValue([v31 localIdentifier]);
            id v33 = (void *)objc_claimAutoreleasedReturnValue([v25 analysisResults]);
            __int16 v34 = (void *)objc_claimAutoreleasedReturnValue( +[VSKAsset mad_assetsWithLocalIdentifier:mediaAnalysisResults:]( &OBJC_CLASS___VSKAsset,  "mad_assetsWithLocalIdentifier:mediaAnalysisResults:",  v32,  v33));

            [obj addObjectsFromArray:v34];
          }

          LODWORD(v2) = [v25 error];
          goto LABEL_42;
        }

        LODWORD(v2) = -128;
      }

      v28 = (void *)objc_claimAutoreleasedReturnValue([v25 asset]);
      v29 = (void *)objc_claimAutoreleasedReturnValue([v28 localIdentifier]);
      [v45 decrementBlacklistCountForLocalIdentifier:v29];

LABEL_42:
      [*(id *)&self->_cost increaseProcessedJobCountByOne];
      objc_autoreleasePoolPop(v26);
      if (v22 == (id)++v24)
      {
        id v35 = [v44 countByEnumeratingWithState:&v48 objects:v56 count:16];
        id v22 = v35;
        if (!v35)
        {
LABEL_48:

          unsigned int v36 = [v45 commit];
          if (v36 == -108 || v36 == -36)
          {
            unsigned int v37 = v36;
          }

          else
          {
            unsigned int v37 = v36;
            if (v36 != -23) {
              unsigned int v37 = v42;
            }
          }

          if (v36 == -108 || v36 == -36 || v36 == -23)
          {
            LODWORD(v2) = v37;
          }

          else
          {
            if ([obj count])
            {
              v38 = (void *)objc_claimAutoreleasedReturnValue(-[VCPTask photoLibrary](self, "photoLibrary"));
              v46[0] = _NSConcreteStackBlock;
              v46[1] = 3221225472LL;
              v46[2] = sub_10009D808;
              v46[3] = &unk_1001B9E98;
              v46[4] = self;
              +[MADVectorDatabaseUtilities updateWithAssetsEmbeddings:photoLibrary:cancelBlock:error:]( &OBJC_CLASS___MADVectorDatabaseUtilities,  "updateWithAssetsEmbeddings:photoLibrary:cancelBlock:error:",  obj,  v38,  v46,  0LL);
            }

            v39 = (void *)objc_claimAutoreleasedReturnValue(-[VCPTask photoLibrary](self, "photoLibrary"));
            v40 = (void *)objc_claimAutoreleasedReturnValue( +[VCPBackgroundProcessingMetrics sharedMetricsWithPhotoLibrary:]( &OBJC_CLASS___VCPBackgroundProcessingMetrics,  "sharedMetricsWithPhotoLibrary:",  v39));
            [v40 persist];
          }

          goto LABEL_60;
        }

        goto LABEL_35;
      }
    }
  }

  uint64_t v12 = *(void *)v53;
LABEL_7:
  uint64_t v13 = 0LL;
  id v14 = v2;
  while (1)
  {
    if (*(void *)v53 != v12) {
      objc_enumerationMutation(obj);
    }
    __int128 v15 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(*((void *)&v52 + 1) + 8 * (void)v13) asset]);
    __int128 v16 = (void *)objc_claimAutoreleasedReturnValue([v15 localIdentifier]);
    id v17 = [v45 addAssetToBlacklist:v16];

    if ((_DWORD)v17 == -108)
    {
      id v2 = v17;
    }

    else
    {
      BOOL v18 = (_DWORD)v17 == -36 || (_DWORD)v17 == -23;
      id v2 = v17;
      if (!v18) {
        id v2 = v14;
      }
    }

    if ((_DWORD)v17 == -108) {
      break;
    }
    if ((_DWORD)v17 == -36 || (_DWORD)v17 == -23) {
      break;
    }
    uint64_t v13 = (char *)v13 + 1;
    id v14 = v2;
    if (v11 == v13)
    {
      id v11 = [obj countByEnumeratingWithState:&v52 objects:v57 count:16];
      if (!v11) {
        goto LABEL_24;
      }
      goto LABEL_7;
    }
  }

- (double)cost
{
  return *(double *)&self->_subtasks;
}

- (BOOL)allowStreaming
{
  return (BOOL)self->super._photoLibrary;
}

- (void)setAllowStreaming:(BOOL)a3
{
  LOBYTE(self->super._photoLibrary) = a3;
}

- (VCPPhotosAssetChangeManager)photosChangeManager
{
  return *(VCPPhotosAssetChangeManager **)&self->_allowStreaming;
}

- (void)setPhotosChangeManager:(id)a3
{
}

- (VCPProgressReporter)progressReporter
{
  return *(VCPProgressReporter **)&self->_cost;
}

- (void)setProgressReporter:(id)a3
{
}

- (void).cxx_destruct
{
}

@end