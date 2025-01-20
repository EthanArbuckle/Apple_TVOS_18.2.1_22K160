@interface MADPhotosTaskProvider
+ (id)name;
+ (void)unimplementedExceptionForMethodName:(id)a3;
- (BOOL)_isAssetEligible:(id)a3 withPreviousStatus:(unint64_t *)a4 previousAttempts:(int *)a5 lastAttemptDate:(id *)a6 allowDownload:(BOOL)a7;
- (BOOL)bypassDownload;
- (BOOL)checkCompatibilityForAsset:(id)a3;
- (MADPhotosTaskProvider)initWithPhotoLibrary:(id)a3 cancelBlock:(id)a4;
- (id)assetPriorities;
- (id)assetTaskWithAnalysisDatabase:(id)a3;
- (id)fetchOptionsForLibrary:(id)a3;
- (id)mediaTypePredicatesString;
- (id)nextAssetProcessingTask;
- (id)nextDownloadAssetProcessingTask;
- (id)photoLibrary;
- (int)_cleanupHardFailures;
- (int)downloadStatus;
- (int)status;
- (unint64_t)assetFetchCount;
- (unint64_t)batchAssetCount;
- (unint64_t)currentAssetPriority;
- (unint64_t)iterations;
- (unint64_t)photosMediaProcessingTaskID;
- (unint64_t)priority;
- (void)_collectNumberOfAssets:(unint64_t)a3 forCoreAnalyticsField:(id)a4;
- (void)evaluateAsset:(id)a3 forTask:(id)a4 download:(BOOL)a5;
- (void)markIgnoredAssetsAsProcessed;
- (void)performDownloadAssetEvaluationWithTask:(id)a3;
- (void)performDownloadRetryAssetEvaluationWithTask:(id)a3;
- (void)performFailedAssetEvaluationWithTask:(id)a3 localIdentifierBlock:(id)a4 fetchCount:(unint64_t)a5 assetCount:(unint64_t)a6 download:(BOOL)a7;
- (void)performFullAssetEvaluationWithTask:(id)a3 andContext:(id)a4;
- (void)performHardFailureAssetEvaluationWithTask:(id)a3;
- (void)performSoftFailureAssetEvaluationWithTask:(id)a3;
- (void)retireTask:(id)a3;
- (void)setStatus:(int)a3;
@end

@implementation MADPhotosTaskProvider

- (MADPhotosTaskProvider)initWithPhotoLibrary:(id)a3 cancelBlock:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v33.receiver = self;
  v33.super_class = (Class)&OBJC_CLASS___MADPhotosTaskProvider;
  v9 = -[MADPhotosTaskProvider init](&v33, "init");
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_photoLibrary, a3);
    uint64_t v11 = objc_claimAutoreleasedReturnValue( +[VCPDatabaseManager sharedDatabaseForPhotoLibrary:]( &OBJC_CLASS___VCPDatabaseManager,  "sharedDatabaseForPhotoLibrary:",  v7));
    analysisDatabase = v10->_analysisDatabase;
    v10->_analysisDatabase = (VCPDatabaseWriter *)v11;

    uint64_t v13 = VCPTaskIDDescription(-[MADTaskProvider taskID](v10, "taskID"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[PHPhotoLibrary vcp_description](v10->_photoLibrary, "vcp_description"));
    uint64_t v16 = objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"[%@][%@]", v14, v15));
    logPrefix = v10->_logPrefix;
    v10->_logPrefix = (NSString *)v16;

    dispatch_queue_t v18 = dispatch_queue_create("MADPhotosTaskProvider.statusQueue", 0LL);
    statusQueue = v10->_statusQueue;
    v10->_statusQueue = (OS_dispatch_queue *)v18;

    v10->_status = 0;
    v10->_downloadStatus = 0;
    dispatch_queue_t v20 = dispatch_queue_create("MADPhotosTaskProvider.taskContextQueue", 0LL);
    taskContextQueue = v10->_taskContextQueue;
    v10->_taskContextQueue = (OS_dispatch_queue *)v20;

    uint64_t v22 = objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
    taskContext = v10->_taskContext;
    v10->_taskContext = (NSMutableArray *)v22;

    uint64_t v24 = objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
    ignoredAssets = v10->_ignoredAssets;
    v10->_ignoredAssets = (NSMutableArray *)v24;

    v10->_assetStage = 0LL;
    id v26 = objc_retainBlock(v8);
    id cancelBlock = v10->_cancelBlock;
    v10->_id cancelBlock = v26;

    uint64_t v28 = objc_claimAutoreleasedReturnValue(+[NSMutableSet set](&OBJC_CLASS___NSMutableSet, "set"));
    activeAssets = v10->_activeAssets;
    v10->_activeAssets = (NSMutableSet *)v28;

    dispatch_queue_t v30 = dispatch_queue_create("MADPhotosTaskProvider.activeAssetsManagementQueue", 0LL);
    activeAssetsManagementQueue = v10->_activeAssetsManagementQueue;
    v10->_activeAssetsManagementQueue = (OS_dispatch_queue *)v30;

    -[MADPhotosTaskProvider _cleanupHardFailures](v10, "_cleanupHardFailures");
  }

  return v10;
}

- (unint64_t)priority
{
  unint64_t v3 = -[MADTaskProvider taskID](self, "taskID");
  uint64_t v4 = 10LL;
  uint64_t v5 = 20LL;
  if (v3 != 10) {
    uint64_t v5 = 0LL;
  }
  if (v3 != 12) {
    uint64_t v4 = v5;
  }
  if (v3 == 3) {
    uint64_t v6 = 30LL;
  }
  else {
    uint64_t v6 = v4;
  }
  else {
    return v6 | -[PHPhotoLibrary vcp_isSyndicationLibrary]( self->_photoLibrary,  "vcp_isSyndicationLibrary");
  }
}

- (unint64_t)iterations
{
  if ((id)-[MADTaskProvider taskID](self, "taskID") != (id)3) {
    return 1LL;
  }
  return 1LL;
}

- (int)status
{
  uint64_t v6 = 0LL;
  id v7 = &v6;
  uint64_t v8 = 0x2020000000LL;
  int v9 = 0;
  statusQueue = (dispatch_queue_s *)self->_statusQueue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_10000CB78;
  v5[3] = &unk_1001B9D88;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(statusQueue, v5);
  int v3 = *((_DWORD *)v7 + 6);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (int)downloadStatus
{
  uint64_t v6 = 0LL;
  id v7 = &v6;
  uint64_t v8 = 0x2020000000LL;
  int v9 = 0;
  statusQueue = (dispatch_queue_s *)self->_statusQueue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_10000CC2C;
  v5[3] = &unk_1001B9D88;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(statusQueue, v5);
  int v3 = *((_DWORD *)v7 + 6);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (void)setStatus:(int)a3
{
  statusQueue = (dispatch_queue_s *)self->_statusQueue;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = sub_10000CCAC;
  v4[3] = &unk_1001B9DB0;
  int v5 = a3;
  v4[4] = self;
  dispatch_sync(statusQueue, v4);
}

- (void)_collectNumberOfAssets:(unint64_t)a3 forCoreAnalyticsField:(id)a4
{
  id v7 = a4;
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(+[VCPMADCoreAnalyticsManager sharedManager](&OBJC_CLASS___VCPMADCoreAnalyticsManager, "sharedManager"));
  if ((id)-[MADTaskProvider taskID](self, "taskID") == (id)10) {
    [v6 accumulateInt64Value:a3 forField:v7 andEvent:@"com.apple.mediaanalysisd.OCRAnalysisRunSession"];
  }
}

- (id)fetchOptionsForLibrary:(id)a3
{
  id v4 = a3;
  int v5 = (void *)objc_claimAutoreleasedReturnValue( +[PHAsset vcp_fetchOptionsForLibrary:forTaskID:]( &OBJC_CLASS___PHAsset,  "vcp_fetchOptionsForLibrary:forTaskID:",  v4,  -[MADTaskProvider taskID](self, "taskID")));

  return v5;
}

- (int)_cleanupHardFailures
{
  uint64_t v4 = MediaAnalysisLogLevel(self, a2);
  if ((int)v4 >= 5)
  {
    uint64_t v6 = VCPLogInstance(v4, v5);
    id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
    os_log_type_t v8 = VCPLogToOSLogType[5];
    if (os_log_type_enabled(v7, v8))
    {
      logPrefix = self->_logPrefix;
      *(_DWORD *)buf = 138412290;
      v62 = logPrefix;
      _os_log_impl((void *)&_mh_execute_header, v7, v8, "%@ Checking processing status from previous runs", buf, 0xCu);
    }
  }

  analysisDatabase = self->_analysisDatabase;
  id v60 = 0LL;
  unint64_t v11 = -[MADPhotosTaskProvider processingStatusTaskID](self, "processingStatusTaskID");
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[MADPhotosTaskProvider mediaTypePredicatesString](self, "mediaTypePredicatesString"));
  -[VCPDatabaseWriter fetchLocalIdentifiers:taskID:processingStatus:additionalPredicates:]( analysisDatabase,  "fetchLocalIdentifiers:taskID:processingStatus:additionalPredicates:",  &v60,  v11,  1LL,  v12);
  id v13 = v60;

  v14 = (char *)[v13 count];
  if (v14)
  {
    v59 = v14;
    uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue( -[MADPhotosTaskProvider fetchOptionsForLibrary:]( self,  "fetchOptionsForLibrary:",  self->_photoLibrary));
    v17 = (void *)objc_claimAutoreleasedReturnValue( +[PHAsset fetchAssetsWithLocalIdentifiers:options:]( &OBJC_CLASS___PHAsset,  "fetchAssetsWithLocalIdentifiers:options:",  v13,  v16));
    id v18 = [v17 count];
    if (v18)
    {
      unint64_t v21 = 0LL;
      os_log_type_t type = VCPLogToOSLogType[6];
      *(void *)&__int128 v20 = 138412546LL;
      __int128 v56 = v20;
      do
      {
        uint64_t v22 = objc_autoreleasePoolPush();
        v23 = (void *)objc_claimAutoreleasedReturnValue([v17 objectAtIndexedSubscript:v21]);
        if (objc_msgSend(v23, "vcp_needsProcessingForTask:", -[MADTaskProvider taskID](self, "taskID")))
        {
          LODWORD(v2) = (_DWORD)analysisDatabase;
        }

        else
        {
          uint64_t v24 = self->_analysisDatabase;
          v25 = (void *)objc_claimAutoreleasedReturnValue([v23 localIdentifier]);
          id v26 = (id)-[VCPDatabaseWriter removeProcessingStatusForLocalIdentifier:andTaskID:]( v24,  "removeProcessingStatusForLocalIdentifier:andTaskID:",  v25,  -[MADPhotosTaskProvider processingStatusTaskID](self, "processingStatusTaskID"));

          if ((_DWORD)v26 == -108 || (_DWORD)v26 == -36)
          {
            v2 = (VCPDatabaseWriter *)v26;
          }

          else
          {
            v2 = (VCPDatabaseWriter *)v26;
            if ((_DWORD)v26 != -23) {
              v2 = analysisDatabase;
            }
          }

          if ((_DWORD)v26 == -108 || (_DWORD)v26 == -36 || (_DWORD)v26 == -23)
          {

            objc_autoreleasePoolPop(v22);
            goto LABEL_38;
          }

          uint64_t v29 = MediaAnalysisLogLevel(v27, v28);
          if ((int)v29 >= 6)
          {
            uint64_t v31 = VCPLogInstance(v29, v30);
            v32 = (os_log_s *)objc_claimAutoreleasedReturnValue(v31);
            if (os_log_type_enabled(v32, type))
            {
              unsigned int v57 = v2;
              objc_super v33 = v17;
              v34 = v16;
              id v35 = v13;
              v36 = self->_logPrefix;
              v37 = (char *)objc_claimAutoreleasedReturnValue([v23 localIdentifier]);
              *(_DWORD *)buf = v56;
              v62 = v36;
              id v13 = v35;
              uint64_t v16 = v34;
              v17 = v33;
              v2 = (VCPDatabaseWriter *)v57;
              __int16 v63 = 2112;
              v64 = v37;
              _os_log_impl( (void *)&_mh_execute_header,  v32,  type,  "%@[%@] Asset is processed; clearing failure status",
                buf,
                0x16u);
            }
          }

          --v59;
          analysisDatabase = v2;
        }

        objc_autoreleasePoolPop(v22);
        ++v21;
        id v18 = [v17 count];
      }

      while (v21 < (unint64_t)v18);
    }

    uint64_t v38 = MediaAnalysisLogLevel(v18, v19);
    if ((int)v38 >= 6)
    {
      uint64_t v40 = VCPLogInstance(v38, v39);
      v41 = (os_log_s *)objc_claimAutoreleasedReturnValue(v40);
      os_log_type_t v42 = VCPLogToOSLogType[6];
      if (os_log_type_enabled(v41, v42))
      {
        v43 = self->_logPrefix;
        *(_DWORD *)buf = 138412546;
        v62 = v43;
        __int16 v63 = 2048;
        v64 = v59;
        _os_log_impl( (void *)&_mh_execute_header,  v41,  v42,  "%@ %lu assets processing status changed to Hard Failure",  buf,  0x16u);
      }
    }

    v44 = self->_analysisDatabase;
    unint64_t v45 = -[MADPhotosTaskProvider processingStatusTaskID](self, "processingStatusTaskID", v56);
    v46 = (void *)objc_claimAutoreleasedReturnValue(-[MADPhotosTaskProvider mediaTypePredicatesString](self, "mediaTypePredicatesString"));
    unsigned int v47 = -[VCPDatabaseWriter hardFailAllRunningProcessingStatusForTaskID:additionalPredicates:]( v44,  "hardFailAllRunningProcessingStatusForTaskID:additionalPredicates:",  v45,  v46);

    if (v47 == -108 || v47 == -36)
    {
      unsigned int v48 = v47;
    }

    else
    {
      unsigned int v48 = v47;
      if (v47 != -23) {
        unsigned int v48 = v2;
      }
    }

    if (v47 == -108 || v47 == -36 || v47 == -23)
    {
      LODWORD(v2) = v48;
LABEL_38:

      goto LABEL_52;
    }

    unsigned int v49 = -[VCPDatabaseWriter commit](self->_analysisDatabase, "commit");
    if (v49 == -108 || v49 == -36)
    {
      LODWORD(v2) = v49;
    }

    else
    {
      LODWORD(v2) = v49;
      if (v49 != -23) {
        LODWORD(v2) = v48;
      }
    }

    if (v49 == -108 || v49 == -23 || v49 == -36) {
      goto LABEL_38;
    }
    -[MADPhotosTaskProvider _collectNumberOfAssets:forCoreAnalyticsField:]( self,  "_collectNumberOfAssets:forCoreAnalyticsField:",  v59,  @"NumberOfAssetsHardFailure");
    -[MADPhotosTaskProvider _collectNumberOfAssets:forCoreAnalyticsField:]( self,  "_collectNumberOfAssets:forCoreAnalyticsField:",  v59,  @"NumberOfAssetsIntoBlacklist");
  }

  uint64_t v50 = MediaAnalysisLogLevel(v14, v15);
  if ((int)v50 < 7)
  {
    LODWORD(v2) = 0;
    goto LABEL_53;
  }

  uint64_t v52 = VCPLogInstance(v50, v51);
  uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue(v52);
  os_log_type_t v53 = VCPLogToOSLogType[7];
  if (os_log_type_enabled((os_log_t)v16, v53))
  {
    v54 = self->_logPrefix;
    *(_DWORD *)buf = 138412290;
    v62 = v54;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)v16, v53, "%@ Processing status is up-to-date", buf, 0xCu);
  }

  LODWORD(v2) = 0;
LABEL_52:

LABEL_53:
  return (int)v2;
}

- (BOOL)_isAssetEligible:(id)a3 withPreviousStatus:(unint64_t *)a4 previousAttempts:(int *)a5 lastAttemptDate:(id *)a6 allowDownload:(BOOL)a7
{
  BOOL v7 = a7;
  id v12 = a3;
  analysisDatabase = self->_analysisDatabase;
  id v42 = 0LL;
  v14 = (void *)objc_claimAutoreleasedReturnValue([v12 localIdentifier]);
  unsigned int v15 = -[VCPDatabaseWriter queryProcessingStatus:attempts:lastAttemptDate:andNextAttemptDate:forLocalIdentifier:andTaskID:]( analysisDatabase,  "queryProcessingStatus:attempts:lastAttemptDate:andNextAttemptDate:forLocalIdentifier:andTaskID:",  a4,  a5,  a6,  &v42,  v14,  -[MADPhotosTaskProvider processingStatusTaskID](self, "processingStatusTaskID"));
  id v16 = v42;

  if (v15)
  {
    uint64_t v19 = MediaAnalysisLogLevel(v17, v18);
    if ((int)v19 >= 3)
    {
      uint64_t v21 = VCPLogInstance(v19, v20);
      uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue(v21);
      os_log_type_t v23 = VCPLogToOSLogType[3];
      if (!os_log_type_enabled((os_log_t)v22, v23))
      {
LABEL_6:

        goto LABEL_7;
      }

      logPrefix = self->_logPrefix;
      v25 = (void *)objc_claimAutoreleasedReturnValue([v12 localIdentifier]);
      *(_DWORD *)buf = 138412802;
      v44 = logPrefix;
      __int16 v45 = 2112;
      v46 = v25;
      __int16 v47 = 1024;
      LODWORD(v48) = v15;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)v22,  v23,  "%@[%@] Failed to query processing status due to DB error %d",  buf,  0x1Cu);
LABEL_5:

      goto LABEL_6;
    }
  }

  else
  {
    if (!*a5
      || (uint64_t v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date")),
          id v28 = [v16 compare:v27],
          v27,
          v28 != (id)1)
      || v7 && *a5 == 1 && *a4 == 2)
    {
      BOOL v26 = 1;
      goto LABEL_14;
    }

    uint64_t v32 = MediaAnalysisLogLevel(v29, v30);
    if ((int)v32 >= 6)
    {
      uint64_t v34 = VCPLogInstance(v32, v33);
      uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue(v34);
      os_log_type_t v35 = VCPLogToOSLogType[6];
      if (!os_log_type_enabled((os_log_t)v22, v35)) {
        goto LABEL_6;
      }
      v36 = self->_logPrefix;
      v37 = (void *)objc_claimAutoreleasedReturnValue([v12 localIdentifier]);
      uint64_t v38 = VCPProcessingStatusDescription(*a4);
      v25 = (void *)objc_claimAutoreleasedReturnValue(v38);
      int v39 = *a5;
      uint64_t v40 = (void *)objc_claimAutoreleasedReturnValue(+[VCPLogManager dateFormatter](&OBJC_CLASS___VCPLogManager, "dateFormatter"));
      v41 = (void *)objc_claimAutoreleasedReturnValue([v40 stringFromDate:v16]);
      *(_DWORD *)buf = 138413314;
      v44 = v36;
      __int16 v45 = 2112;
      v46 = v37;
      __int16 v47 = 2112;
      unsigned int v48 = v25;
      __int16 v49 = 1024;
      int v50 = v39;
      __int16 v51 = 2112;
      uint64_t v52 = v41;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)v22,  v35,  "%@[%@] Asset skipped (%@|%d); revisit date: %@",
        buf,
        0x30u);

      goto LABEL_5;
    }
  }

- (void)evaluateAsset:(id)a3 forTask:(id)a4 download:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a3;
  id v9 = a4;
  logPrefix = self->_logPrefix;
  unint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([v8 localIdentifier]);
  id v12 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@[%@][TaskID-%d]",  logPrefix,  v11,  -[MADPhotosTaskProvider processingStatusTaskID](self, "processingStatusTaskID")));

  uint64_t v15 = MediaAnalysisLogLevel(v13, v14);
  if ((int)v15 >= 7)
  {
    uint64_t v17 = VCPLogInstance(v15, v16);
    uint64_t v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(v17);
    os_log_type_t v19 = VCPLogToOSLogType[7];
    if (os_log_type_enabled(v18, v19))
    {
      uint64_t v20 = @"dis";
      if (v5) {
        uint64_t v20 = &stru_1001BE5A8;
      }
      *(_DWORD *)buf = 138412546;
      *(void *)&uint8_t buf[4] = v12;
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = v20;
      _os_log_impl((void *)&_mh_execute_header, v18, v19, "%@ Evaluating asset ... (download %@allowed)", buf, 0x16u);
    }
  }

  uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue(+[VCPWatchdog sharedWatchdog](&OBJC_CLASS___VCPWatchdog, "sharedWatchdog"));
  [v21 pet];

  *(void *)buf = 0LL;
  *(void *)&buf[8] = buf;
  *(void *)&buf[16] = 0x2020000000LL;
  char v104 = 0;
  activeAssetsManagementQueue = (dispatch_queue_s *)self->_activeAssetsManagementQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10000E070;
  block[3] = &unk_1001B9DD8;
  v100 = buf;
  block[4] = self;
  id v23 = v8;
  id v99 = v23;
  dispatch_sync(activeAssetsManagementQueue, block);
  if (*(_BYTE *)(*(void *)&buf[8] + 24LL))
  {
    uint64_t v26 = MediaAnalysisLogLevel(v24, v25);
    if ((int)v26 >= 4)
    {
      uint64_t v28 = VCPLogInstance(v26, v27);
      uint64_t v29 = (void *)objc_claimAutoreleasedReturnValue(v28);
      os_log_type_t v30 = VCPLogToOSLogType[4];
      if (!os_log_type_enabled((os_log_t)v29, v30))
      {
LABEL_49:

        goto LABEL_50;
      }

      *(_DWORD *)v101 = 138412290;
      v102 = v12;
      uint64_t v31 = "%@ Asset already added to a processing batch; skipping";
LABEL_11:
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)v29, v30, v31, v101, 0xCu);
      goto LABEL_49;
    }

    goto LABEL_50;
  }

  if ((id)-[MADTaskProvider taskID](self, "taskID") == (id)3)
  {
    uint64_t v32 = (void *)objc_claimAutoreleasedReturnValue([v23 photoLibrary]);
    if (objc_msgSend(v32, "mad_pauseFCPeopleFurtherProcessing"))
    {
      unsigned int v33 = [v23 faceAnalysisVersion];
      else {
        int v34 = 11;
      }
      BOOL v35 = v34 == v33;

      if (v35)
      {
        uint64_t v38 = MediaAnalysisLogLevel(v36, v37);
        if ((int)v38 >= 5)
        {
          uint64_t v40 = VCPLogInstance(v38, v39);
          uint64_t v29 = (void *)objc_claimAutoreleasedReturnValue(v40);
          os_log_type_t v30 = VCPLogToOSLogType[5];
          if (!os_log_type_enabled((os_log_t)v29, v30)) {
            goto LABEL_49;
          }
          *(_DWORD *)v101 = 138412290;
          v102 = v12;
          uint64_t v31 = "%@ already with FC version; skipping";
          goto LABEL_11;
        }

- (void)markIgnoredAssetsAsProcessed
{
  if (-[NSMutableArray count](self->_ignoredAssets, "count"))
  {
    id v3 = -[NSMutableArray count](self->_ignoredAssets, "count");
    if (v3 >= +[PHPhotoLibrary mad_maxIgnoredAssetsToMarkAsProcessed]( &OBJC_CLASS___PHPhotoLibrary,  "mad_maxIgnoredAssetsToMarkAsProcessed")
      || self->_assetStage == 1)
    {
      uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(+[VCPWatchdog sharedWatchdog](&OBJC_CLASS___VCPWatchdog, "sharedWatchdog"));
      [v4 pet];

      -[PHPhotoLibrary mad_markAsProcessedByTask:forAssets:]( self->_photoLibrary,  "mad_markAsProcessedByTask:forAssets:",  -[MADPhotosTaskProvider processingStatusTaskID](self, "processingStatusTaskID"),  self->_ignoredAssets);
      -[NSMutableArray removeAllObjects](self->_ignoredAssets, "removeAllObjects");
    }
  }

- (void)performFullAssetEvaluationWithTask:(id)a3 andContext:(id)a4
{
  id v6 = a3;
  id v98 = a4;
  uint64_t v8 = MediaAnalysisLogLevel(v98, v7);
  if ((int)v8 >= 6)
  {
    uint64_t v10 = VCPLogInstance(v8, v9);
    unint64_t v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
    os_log_type_t v12 = VCPLogToOSLogType[6];
    if (os_log_type_enabled(v11, v12))
    {
      logPrefix = self->_logPrefix;
      *(_DWORD *)buf = 138412290;
      v113 = logPrefix;
      _os_log_impl((void *)&_mh_execute_header, v11, v12, "%@ Perform full asset evaluation ... ", buf, 0xCu);
    }
  }

  v108 = (void *)objc_claimAutoreleasedReturnValue(-[MADPhotosTaskProvider assetPriorities](self, "assetPriorities"));
  id v14 = [v108 count];
  if (v14)
  {
    unint64_t v103 = (unint64_t)v14;
    os_log_type_t type = VCPLogToOSLogType[5];
    os_log_type_t v102 = VCPLogToOSLogType[6];
    uint64_t v99 = VCPKeyValueOCRAnalysisLastGatingIncludedFetchTimestamp;
    id v101 = v6;
    os_log_type_t v100 = VCPLogToOSLogType[3];
    while (1)
    {
      unint64_t fetchIdx = self->_fetchIdx;
      if (fetchIdx < -[PHFetchResult count](self->_fetchResult, "count"))
      {
        do
        {
          uint64_t v17 = objc_autoreleasePoolPush();
          fetchResult = self->_fetchResult;
          ++self->_fetchIdx;
          os_log_type_t v19 = (void *)objc_claimAutoreleasedReturnValue(-[PHFetchResult objectAtIndexedSubscript:](fetchResult, "objectAtIndexedSubscript:"));
          id v20 = +[PHPhotoLibrary mad_isProcessingNeededOnAsset:forTaskID:]( &OBJC_CLASS___PHPhotoLibrary,  "mad_isProcessingNeededOnAsset:forTaskID:",  v19,  -[MADPhotosTaskProvider processingStatusTaskID](self, "processingStatusTaskID"));
          if ((v20 & 1) != 0)
          {
            -[MADPhotosTaskProvider evaluateAsset:forTask:download:]( self,  "evaluateAsset:forTask:download:",  v19,  v6,  0LL);
            if (objc_msgSend( v6,  "hasAdequateAssets:",  -[MADPhotosTaskProvider batchAssetCount](self, "batchAssetCount")))
            {
              unint64_t v91 = self->_fetchIdx;
              if (v91 >= -[PHFetchResult count](self->_fetchResult, "count") && self->_assetPrioritiesIdx >= v103) {
                self->_assetStage = 1LL;
              }
              -[VCPDatabaseWriter commit](self->_analysisDatabase, "commit");

              objc_autoreleasePoolPop(v17);
              goto LABEL_61;
            }
          }

          else
          {
            uint64_t v22 = MediaAnalysisLogLevel(v20, v21);
            if ((int)v22 >= 5)
            {
              uint64_t v24 = VCPLogInstance(v22, v23);
              uint64_t v25 = (os_log_s *)objc_claimAutoreleasedReturnValue(v24);
              if (os_log_type_enabled(v25, type))
              {
                uint64_t v26 = self->_logPrefix;
                uint64_t v27 = (__CFString *)objc_claimAutoreleasedReturnValue([v19 localIdentifier]);
                unint64_t v28 = -[MADPhotosTaskProvider processingStatusTaskID](self, "processingStatusTaskID");
                *(_DWORD *)buf = 138412802;
                v113 = v26;
                __int16 v114 = 2112;
                v115 = v27;
                __int16 v116 = 2048;
                unint64_t v117 = v28;
                _os_log_impl( (void *)&_mh_execute_header,  v25,  type,  "[%@][%@] Asset does not need processing in task %lu, ignoring... ",  buf,  0x20u);
              }
            }

            -[NSMutableArray addObject:](self->_ignoredAssets, "addObject:", v19);
            analysisDatabase = self->_analysisDatabase;
            os_log_type_t v30 = (void *)objc_claimAutoreleasedReturnValue([v19 localIdentifier]);
            -[VCPDatabaseWriter removeProcessingStatusForLocalIdentifier:andTaskID:]( analysisDatabase,  "removeProcessingStatusForLocalIdentifier:andTaskID:",  v30,  -[MADPhotosTaskProvider processingStatusTaskID](self, "processingStatusTaskID"));

            if ((id)-[MADPhotosTaskProvider processingStatusTaskID](self, "processingStatusTaskID") == (id)1)
            {
              uint64_t v31 = self->_analysisDatabase;
              uint64_t v32 = (void *)objc_claimAutoreleasedReturnValue([v19 localIdentifier]);
              -[VCPDatabaseWriter removeProcessingStatusForLocalIdentifier:andTaskID:]( v31,  "removeProcessingStatusForLocalIdentifier:andTaskID:",  v32,  255LL);
            }

            -[MADPhotosTaskProvider markIgnoredAssetsAsProcessed](self, "markIgnoredAssetsAsProcessed");
          }

          objc_autoreleasePoolPop(v17);
          unint64_t v33 = self->_fetchIdx;
        }

        while (v33 < -[PHFetchResult count](self->_fetchResult, "count"));
      }

      -[VCPDatabaseWriter commit](self->_analysisDatabase, "commit");
      int v34 = self->_fetchResult;
      self->_fetchResult = 0LL;

      self->_unint64_t fetchIdx = 0LL;
      if (self->_assetPrioritiesIdx >= v103)
      {
        self->_assetStage = 1LL;
        goto LABEL_61;
      }

      context = objc_autoreleasePoolPush();
      BOOL v35 = (void *)objc_claimAutoreleasedReturnValue(+[VCPWatchdog sharedWatchdog](&OBJC_CLASS___VCPWatchdog, "sharedWatchdog"));
      [v35 pet];

      uint64_t v38 = @"All";
      if (v103 != 1)
      {
        uint64_t v39 = (void *)objc_claimAutoreleasedReturnValue([v108 objectAtIndexedSubscript:self->_assetPrioritiesIdx]);
        uint64_t v38 = (const __CFString *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( NSString,  "stringWithFormat:",  @"Priority %lu",  [v39 unsignedIntegerValue]));
      }

      uint64_t v40 = MediaAnalysisLogLevel(v36, v37);
      if ((int)v40 >= 6)
      {
        uint64_t v42 = VCPLogInstance(v40, v41);
        id v43 = (os_log_s *)objc_claimAutoreleasedReturnValue(v42);
        if (os_log_type_enabled(v43, v102))
        {
          uint64_t v44 = self->_logPrefix;
          *(_DWORD *)buf = 138412546;
          v113 = v44;
          __int16 v114 = 2112;
          v115 = v38;
          _os_log_impl((void *)&_mh_execute_header, v43, v102, "%@ Fetching %@ assets...", buf, 0x16u);
        }
      }

      uint64_t v45 = (void *)objc_claimAutoreleasedReturnValue(+[MADStateHandler sharedStateHandler](&OBJC_CLASS___MADStateHandler, "sharedStateHandler"));
      [v45 addBreadcrumb:@"%@ Fetching %@ assets...", self->_logPrefix, v38];

      ++self->_assetPrioritiesIdx;
      uint64_t v46 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v108, "objectAtIndexedSubscript:"));
      self->_unint64_t currentAssetPriority = (unint64_t)[v46 unsignedIntegerValue];

      uint64_t v105 = objc_claimAutoreleasedReturnValue( +[PHMediaProcessingAlgorithmVersionProvider mad_sharedVersionProviderWithPhotoLibrary:]( &OBJC_CLASS___PHMediaProcessingAlgorithmVersionProvider,  "mad_sharedVersionProviderWithPhotoLibrary:",  self->_photoLibrary));
      +[PHAsset mad_sceneConfidenceThresholdForTask:]( &OBJC_CLASS___PHAsset,  "mad_sceneConfidenceThresholdForTask:",  -[MADTaskProvider taskID](self, "taskID"));
      int v48 = v47;
      v106 = (__CFString *)v38;
      if ((id)-[MADTaskProvider taskID](self, "taskID") == (id)10)
      {
        os_log_type_t v49 = (void *)objc_claimAutoreleasedReturnValue( +[NSDate dateWithTimeIntervalSinceReferenceDate:]( &OBJC_CLASS___NSDate,  "dateWithTimeIntervalSinceReferenceDate:",  (double)-[VCPDatabaseWriter valueForKey:](self->_analysisDatabase, "valueForKey:", v99)));
        int v50 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate now](&OBJC_CLASS___NSDate, "now"));
        [v50 timeIntervalSinceDate:v49];
        BOOL v52 = v51 < 604800.0;
      }

      else
      {
        BOOL v52 = 0;
      }

      uint64_t v53 = VCPSignPostLog();
      uint64_t v54 = (os_log_s *)objc_claimAutoreleasedReturnValue(v53);
      os_signpost_id_t v55 = os_signpost_id_generate(v54);

      uint64_t v56 = VCPSignPostLog();
      uint64_t v57 = (os_log_s *)objc_claimAutoreleasedReturnValue(v56);
      v58 = v57;
      os_signpost_id_t spid = v55;
      unint64_t v59 = v55 - 1;
      if (v59 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v57))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v58,  OS_SIGNPOST_INTERVAL_BEGIN,  spid,  "MADPhotosTaskProvider_FetchAssets",  (const char *)&unk_100199097,  buf,  2u);
      }

      if (v52)
      {
        photoLibrary = self->_photoLibrary;
        unint64_t v61 = -[MADPhotosTaskProvider photosMediaProcessingTaskID](self, "photosMediaProcessingTaskID");
        unint64_t currentAssetPriority = self->_currentAssetPriority;
        uint64_t v111 = 0LL;
        uint64_t v63 = (id *)&v111;
        v64 = (void *)v105;
        LODWORD(v65) = v48;
        uint64_t v66 = objc_claimAutoreleasedReturnValue( -[PHPhotoLibrary fetchUnprocessedAssetsForMediaProcessingTaskID:priority:algorithmVersion:sceneConfidenceThreshold:error:]( photoLibrary,  "fetchUnprocessedAssetsForMediaProcessingTaskID:priority:algorithmVersion:sceneConfidenceThreshold:error:",  v61,  currentAssetPriority,  v105,  &v111,  v65));
      }

      else
      {
        if ((id)-[MADTaskProvider taskID](self, "taskID") == (id)10)
        {
          uint64_t v67 = self->_analysisDatabase;
          uint64_t v68 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate now](&OBJC_CLASS___NSDate, "now"));
          [v68 timeIntervalSinceReferenceDate];
          -[VCPDatabaseWriter setValue:forKey:](v67, "setValue:forKey:", (uint64_t)v69, v99);

          -[VCPDatabaseWriter commit](self->_analysisDatabase, "commit");
        }

        v70 = self->_photoLibrary;
        unint64_t v71 = -[MADPhotosTaskProvider photosMediaProcessingTaskID](self, "photosMediaProcessingTaskID");
        unint64_t v72 = self->_currentAssetPriority;
        uint64_t v110 = 0LL;
        uint64_t v63 = (id *)&v110;
        v64 = (void *)v105;
        LODWORD(v73) = v48;
        uint64_t v66 = objc_claimAutoreleasedReturnValue( -[PHPhotoLibrary fetchAssetsForMediaProcessingTaskID:priority:algorithmVersion:sceneConfidenceThreshold:error:]( v70,  "fetchAssetsForMediaProcessingTaskID:priority:algorithmVersion:sceneConfidenceThreshold:error:",  v71,  v72,  v105,  &v110,  v73));
      }

      uint64_t v74 = (PHFetchResult *)v66;
      v75 = (__CFString *)*v63;
      os_log_type_t v76 = self->_fetchResult;
      self->_fetchResult = v74;

      uint64_t v77 = VCPSignPostLog();
      uint64_t v78 = (os_log_s *)objc_claimAutoreleasedReturnValue(v77);
      uint64_t v79 = v78;
      id v6 = v101;
      if (v59 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v78))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v79,  OS_SIGNPOST_INTERVAL_END,  spid,  "MADPhotosTaskProvider_FetchAssets",  (const char *)&unk_100199097,  buf,  2u);
      }

      uint64_t v82 = MediaAnalysisLogLevel(v80, v81);
      if (!v75) {
        break;
      }
      if ((int)v82 >= 3)
      {
        uint64_t v84 = VCPLogInstance(v82, v83);
        uint64_t v85 = (os_log_s *)objc_claimAutoreleasedReturnValue(v84);
        if (os_log_type_enabled(v85, v100))
        {
          uint64_t v86 = self->_logPrefix;
          *(_DWORD *)buf = 138412546;
          v113 = v86;
          __int16 v114 = 2112;
          v115 = v75;
          _os_log_impl((void *)&_mh_execute_header, v85, v100, "%@ Failed to fetch assets: %@", buf, 0x16u);
        }

- (void)performFailedAssetEvaluationWithTask:(id)a3 localIdentifierBlock:(id)a4 fetchCount:(unint64_t)a5 assetCount:(unint64_t)a6 download:(BOOL)a7
{
  BOOL v7 = a7;
  id v11 = a3;
  uint64_t v60 = (uint64_t (**)(id, unint64_t))a4;
  uint64_t v13 = MediaAnalysisLogLevel(v60, v12);
  if ((int)v13 >= 6)
  {
    uint64_t v15 = VCPLogInstance(v13, v14);
    uint64_t v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(v15);
    os_log_type_t v17 = VCPLogToOSLogType[6];
    if (os_log_type_enabled(v16, v17))
    {
      logPrefix = self->_logPrefix;
      os_log_type_t v19 = @"NO";
      if (v7) {
        os_log_type_t v19 = @"YES";
      }
      *(_DWORD *)buf = 138412546;
      unint64_t v72 = logPrefix;
      __int16 v73 = 2112;
      *(void *)uint64_t v74 = v19;
      _os_log_impl( (void *)&_mh_execute_header,  v16,  v17,  "%@ Perform failed asset evaluation ... (download allowed: %@)",  buf,  0x16u);
    }
  }

  self->_unint64_t currentAssetPriority = 0LL;
  double v65 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](&OBJC_CLASS___NSMutableSet, "set"));
  os_log_type_t type = VCPLogToOSLogType[4];
  id v59 = v11;
  BOOL v62 = v7;
  unint64_t v61 = a6;
  while (1)
  {
    uint64_t v20 = v60[2](v60, a5);
    uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue(v20);
    if (![v21 count]) {
      break;
    }
    if ([v65 count])
    {
      uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet setWithArray:](&OBJC_CLASS___NSMutableSet, "setWithArray:", v21));
      [v22 minusSet:v65];
      uint64_t v23 = objc_claimAutoreleasedReturnValue([v22 allObjects]);

      uint64_t v21 = (void *)v23;
    }

    uint64_t v24 = (void *)objc_claimAutoreleasedReturnValue(+[VCPWatchdog sharedWatchdog](&OBJC_CLASS___VCPWatchdog, "sharedWatchdog"));
    [v24 pet];

    uint64_t v25 = (void *)objc_claimAutoreleasedReturnValue( -[MADPhotosTaskProvider fetchOptionsForLibrary:]( self,  "fetchOptionsForLibrary:",  self->_photoLibrary));
    uint64_t v26 = (void *)objc_claimAutoreleasedReturnValue( +[NSSortDescriptor sortDescriptorWithKey:ascending:]( &OBJC_CLASS___NSSortDescriptor,  "sortDescriptorWithKey:ascending:",  @"creationDate",  0LL));
    os_log_type_t v76 = v26;
    uint64_t v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v76, 1LL));
    [v25 setSortDescriptors:v27];

    unint64_t v28 = (void *)objc_claimAutoreleasedReturnValue(+[MADStateHandler sharedStateHandler](&OBJC_CLASS___MADStateHandler, "sharedStateHandler"));
    [v28 addBreadcrumb:@"%@ Fetching %lu assets for retry with fetchOptions: %@", self->_logPrefix, objc_msgSend(v21, "count"), v25];

    v64 = v25;
    uint64_t v29 = v21;
    os_log_type_t v30 = (void *)objc_claimAutoreleasedReturnValue( +[PHAsset fetchAssetsWithLocalIdentifiers:options:]( &OBJC_CLASS___PHAsset,  "fetchAssetsWithLocalIdentifiers:options:",  v21,  v25));
    uint64_t v31 = (void *)objc_claimAutoreleasedReturnValue(+[MADStateHandler sharedStateHandler](&OBJC_CLASS___MADStateHandler, "sharedStateHandler"));
    [v31 addBreadcrumb:@"%@ Fetched %lu assets for retry", self->_logPrefix, objc_msgSend(v29, "count")];

    uint64_t v66 = v29;
    id v32 = [v29 count];
    BOOL v33 = v62;
    unint64_t v34 = v61;
    if (v32 != [v30 count])
    {
      BOOL v35 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet setWithArray:](&OBJC_CLASS___NSMutableSet, "setWithArray:", v29));
      if ([v30 count])
      {
        unint64_t v36 = 0LL;
        do
        {
          uint64_t v37 = objc_autoreleasePoolPush();
          uint64_t v38 = (void *)objc_claimAutoreleasedReturnValue([v30 objectAtIndexedSubscript:v36]);
          uint64_t v39 = (void *)objc_claimAutoreleasedReturnValue([v38 localIdentifier]);
          [v35 removeObject:v39];

          objc_autoreleasePoolPop(v37);
          ++v36;
        }

        while (v36 < (unint64_t)[v30 count]);
      }

      if ([v35 count])
      {
        __int128 v69 = 0u;
        __int128 v70 = 0u;
        __int128 v67 = 0u;
        __int128 v68 = 0u;
        id v41 = v35;
        id v42 = [v41 countByEnumeratingWithState:&v67 objects:v75 count:16];
        if (v42)
        {
          id v43 = v42;
          uint64_t v44 = *(void *)v68;
          do
          {
            for (i = 0LL; i != v43; i = (char *)i + 1)
            {
              if (*(void *)v68 != v44) {
                objc_enumerationMutation(v41);
              }
              -[VCPDatabaseWriter removeProcessingStatusForLocalIdentifier:andTaskID:]( self->_analysisDatabase,  "removeProcessingStatusForLocalIdentifier:andTaskID:",  *(void *)(*((void *)&v67 + 1) + 8LL * (void)i),  -[MADPhotosTaskProvider processingStatusTaskID](self, "processingStatusTaskID"));
            }

            id v43 = [v41 countByEnumeratingWithState:&v67 objects:v75 count:16];
          }

          while (v43);
        }

        -[VCPDatabaseWriter commit](self->_analysisDatabase, "commit");
        id v11 = v59;
        BOOL v33 = v62;
        unint64_t v34 = v61;
      }

      else
      {
        uint64_t v46 = MediaAnalysisLogLevel(0LL, v40);
        BOOL v33 = v62;
        unint64_t v34 = v61;
        if ((int)v46 >= 4)
        {
          uint64_t v48 = VCPLogInstance(v46, v47);
          os_log_type_t v49 = (os_log_s *)objc_claimAutoreleasedReturnValue(v48);
          if (os_log_type_enabled(v49, type))
          {
            int v50 = self->_logPrefix;
            unsigned int v51 = [v66 count];
            unsigned int v52 = [v30 count];
            *(_DWORD *)buf = 138412802;
            unint64_t v72 = v50;
            __int16 v73 = 1024;
            *(_DWORD *)uint64_t v74 = v51;
            *(_WORD *)&v74[4] = 1024;
            *(_DWORD *)&v74[6] = v52;
            _os_log_impl( (void *)&_mh_execute_header,  v49,  type,  "%@ Fetch count mismatch (%d vs %d); but no missing identifiers...",
              buf,
              0x18u);
          }
        }
      }
    }

    if ([v30 count])
    {
      uint64_t v53 = 0LL;
      while (1)
      {
        uint64_t v54 = (void *)objc_claimAutoreleasedReturnValue([v30 objectAtIndexedSubscript:v53]);
        -[MADPhotosTaskProvider evaluateAsset:forTask:download:](self, "evaluateAsset:forTask:download:", v54, v11, v33);
        os_signpost_id_t v55 = (void *)objc_claimAutoreleasedReturnValue([v54 localIdentifier]);
        [v65 addObject:v55];
      }

      -[VCPDatabaseWriter commit](self->_analysisDatabase, "commit");

      int v57 = 1;
      uint64_t v56 = v66;
    }

    else
    {
LABEL_33:
      -[VCPDatabaseWriter commit](self->_analysisDatabase, "commit");
      uint64_t v56 = v66;
      else {
        int v57 = 5;
      }
    }

    if (v57) {
      goto LABEL_40;
    }
  }

LABEL_40:
}

- (void)performSoftFailureAssetEvaluationWithTask:(id)a3
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
      logPrefix = self->_logPrefix;
      *(_DWORD *)buf = 138412290;
      uint64_t v15 = logPrefix;
      _os_log_impl((void *)&_mh_execute_header, v9, v10, "%@ Perform soft failure asset evaluation ... ", buf, 0xCu);
    }
  }

  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472LL;
  v13[2] = sub_10000F274;
  v13[3] = &unk_1001B9E28;
  v13[4] = self;
  uint64_t v12 = objc_retainBlock(v13);
  -[MADPhotosTaskProvider performFailedAssetEvaluationWithTask:localIdentifierBlock:fetchCount:assetCount:download:]( self,  "performFailedAssetEvaluationWithTask:localIdentifierBlock:fetchCount:assetCount:download:",  v4,  v12,  -[MADPhotosTaskProvider assetFetchCount](self, "assetFetchCount"),  -[MADPhotosTaskProvider batchAssetCount](self, "batchAssetCount"),  0LL);
}

- (void)performHardFailureAssetEvaluationWithTask:(id)a3
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
      logPrefix = self->_logPrefix;
      *(_DWORD *)buf = 138412290;
      uint64_t v15 = logPrefix;
      _os_log_impl((void *)&_mh_execute_header, v9, v10, "%@ Perform hard failure asset evaluation ... ", buf, 0xCu);
    }
  }

  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472LL;
  v13[2] = sub_10000F490;
  v13[3] = &unk_1001B9E28;
  v13[4] = self;
  uint64_t v12 = objc_retainBlock(v13);
  -[MADPhotosTaskProvider performFailedAssetEvaluationWithTask:localIdentifierBlock:fetchCount:assetCount:download:]( self,  "performFailedAssetEvaluationWithTask:localIdentifierBlock:fetchCount:assetCount:download:",  v4,  v12,  10LL,  1LL,  0LL);
}

- (id)nextAssetProcessingTask
{
  if (-[MADPhotosTaskProvider status](self, "status")) {
    return 0LL;
  }
  id v4 = (void *)objc_claimAutoreleasedReturnValue( -[MADPhotosTaskProvider assetTaskWithAnalysisDatabase:]( self,  "assetTaskWithAnalysisDatabase:",  self->_analysisDatabase));
  uint64_t v5 = objc_alloc(&OBJC_CLASS___MADPhotosTaskContext);
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue([v4 uuid]);
  uint64_t v7 = -[MADPhotosTaskContext initWithTaskUUID:](v5, "initWithTaskUUID:", v6);

  if (!self->_assetStage) {
    -[MADPhotosTaskProvider performFullAssetEvaluationWithTask:andContext:]( self,  "performFullAssetEvaluationWithTask:andContext:",  v4,  v7);
  }
  uint64_t v8 = [v4 count];
  if (self->_assetStage == 1)
  {
    -[MADPhotosTaskProvider markIgnoredAssetsAsProcessed](self, "markIgnoredAssetsAsProcessed");
    -[MADPhotosTaskProvider performSoftFailureAssetEvaluationWithTask:]( self,  "performSoftFailureAssetEvaluationWithTask:",  v4);
    if (![v4 count]) {
      -[MADPhotosTaskProvider performHardFailureAssetEvaluationWithTask:]( self,  "performHardFailureAssetEvaluationWithTask:",  v4);
    }
  }

  -[MADPhotosTaskProvider _collectNumberOfAssets:forCoreAnalyticsField:]( self,  "_collectNumberOfAssets:forCoreAnalyticsField:",  (_BYTE *)[v4 count] - v8,  @"NumberOfAssetsOutFromBlacklist");
  if ([v4 count])
  {
    taskContextQueue = (dispatch_queue_s *)self->_taskContextQueue;
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472LL;
    v11[2] = sub_10000F6B4;
    v11[3] = &unk_1001B9E00;
    v11[4] = self;
    uint64_t v12 = v7;
    dispatch_sync(taskContextQueue, v11);
    id v10 = v4;
  }

  else
  {
    id v10 = 0LL;
  }

  return v10;
}

- (unint64_t)assetFetchCount
{
  return 2 * -[MADPhotosTaskProvider batchAssetCount](self, "batchAssetCount");
}

- (void)performDownloadAssetEvaluationWithTask:(id)a3
{
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472LL;
  v14[2] = sub_10000F858;
  v14[3] = &unk_1001B9E28;
  v14[4] = self;
  id v4 = a3;
  uint64_t v5 = objc_retainBlock(v14);
  uint64_t v7 = MediaAnalysisLogLevel(v5, v6);
  if ((int)v7 >= 6)
  {
    uint64_t v9 = VCPLogInstance(v7, v8);
    id v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
    os_log_type_t v11 = VCPLogToOSLogType[6];
    if (os_log_type_enabled(v10, v11))
    {
      logPrefix = self->_logPrefix;
      uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue(-[MADPhotosTaskProvider mediaTypePredicatesString](self, "mediaTypePredicatesString"));
      *(_DWORD *)buf = 138412546;
      uint64_t v16 = logPrefix;
      __int16 v17 = 2112;
      uint64_t v18 = v13;
      _os_log_impl((void *)&_mh_execute_header, v10, v11, "%@ perform download assets with %@ ...", buf, 0x16u);
    }
  }

  -[MADPhotosTaskProvider performFailedAssetEvaluationWithTask:localIdentifierBlock:fetchCount:assetCount:download:]( self,  "performFailedAssetEvaluationWithTask:localIdentifierBlock:fetchCount:assetCount:download:",  v4,  v5,  -[MADPhotosTaskProvider assetFetchCount](self, "assetFetchCount"),  -[MADPhotosTaskProvider batchAssetCount](self, "batchAssetCount"),  1LL);
}

- (void)performDownloadRetryAssetEvaluationWithTask:(id)a3
{
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472LL;
  v14[2] = sub_10000FA60;
  v14[3] = &unk_1001B9E28;
  v14[4] = self;
  id v4 = a3;
  uint64_t v5 = objc_retainBlock(v14);
  uint64_t v7 = MediaAnalysisLogLevel(v5, v6);
  if ((int)v7 >= 6)
  {
    uint64_t v9 = VCPLogInstance(v7, v8);
    id v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
    os_log_type_t v11 = VCPLogToOSLogType[6];
    if (os_log_type_enabled(v10, v11))
    {
      logPrefix = self->_logPrefix;
      uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue(-[MADPhotosTaskProvider mediaTypePredicatesString](self, "mediaTypePredicatesString"));
      *(_DWORD *)buf = 138412546;
      uint64_t v16 = logPrefix;
      __int16 v17 = 2112;
      uint64_t v18 = v13;
      _os_log_impl((void *)&_mh_execute_header, v10, v11, "%@ perform download retry assets with %@ ...", buf, 0x16u);
    }
  }

  -[MADPhotosTaskProvider performFailedAssetEvaluationWithTask:localIdentifierBlock:fetchCount:assetCount:download:]( self,  "performFailedAssetEvaluationWithTask:localIdentifierBlock:fetchCount:assetCount:download:",  v4,  v5,  -[MADPhotosTaskProvider assetFetchCount](self, "assetFetchCount"),  -[MADPhotosTaskProvider batchAssetCount](self, "batchAssetCount"),  1LL);
}

- (id)nextDownloadAssetProcessingTask
{
  if (!-[PHPhotoLibrary vcp_requiresDownloadForTask:]( self->_photoLibrary,  "vcp_requiresDownloadForTask:",  -[MADTaskProvider taskID](self, "taskID"))
    || -[MADPhotosTaskProvider bypassDownload](self, "bypassDownload")
    || -[MADPhotosTaskProvider downloadStatus](self, "downloadStatus")
    || -[MADPhotosTaskProvider status](self, "status"))
  {
    id v3 = 0LL;
  }

  else
  {
    uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue( -[MADPhotosTaskProvider assetTaskWithAnalysisDatabase:]( self,  "assetTaskWithAnalysisDatabase:",  self->_analysisDatabase));
    -[MADPhotosTaskProvider performDownloadAssetEvaluationWithTask:]( self,  "performDownloadAssetEvaluationWithTask:",  v5);
    if ((objc_msgSend( v5,  "hasAdequateAssets:",  -[MADPhotosTaskProvider batchAssetCount](self, "batchAssetCount")) & 1) == 0) {
      -[MADPhotosTaskProvider performDownloadRetryAssetEvaluationWithTask:]( self,  "performDownloadRetryAssetEvaluationWithTask:",  v5);
    }
    -[MADPhotosTaskProvider _collectNumberOfAssets:forCoreAnalyticsField:]( self,  "_collectNumberOfAssets:forCoreAnalyticsField:",  [v5 count],  @"NumberOfAssetsOutFromBlacklist");
    if ([v5 count]) {
      uint64_t v6 = v5;
    }
    else {
      uint64_t v6 = 0LL;
    }
    id v3 = v6;
  }

  return v3;
}

- (void)retireTask:(id)a3
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
      uint64_t v12 = (void *)objc_opt_class(v4);
      id v13 = v12;
      uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue([v4 uuid]);
      *(_DWORD *)buf = 138412802;
      uint64_t v25 = logPrefix;
      __int16 v26 = 2112;
      uint64_t v27 = v12;
      __int16 v28 = 2112;
      uint64_t v29 = v14;
      _os_log_impl((void *)&_mh_execute_header, v9, v10, "%@ Retiring task %@ (%@)", buf, 0x20u);
    }
  }

  uint64_t v15 = objc_opt_class(&OBJC_CLASS___MADPhotosAssetProcessingTask);
  if ((objc_opt_isKindOfClass(v4, v15) & 1) != 0)
  {
    activeAssetsManagementQueue = (dispatch_queue_s *)self->_activeAssetsManagementQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_10000FDE4;
    block[3] = &unk_1001B9E00;
    block[4] = self;
    id v17 = v4;
    id v23 = v17;
    dispatch_sync(activeAssetsManagementQueue, block);
    id v18 = [v17 status];
    if ((_DWORD)v18) {
      -[MADPhotosTaskProvider setStatus:](self, "setStatus:", v18);
    }
    taskContextQueue = (dispatch_queue_s *)self->_taskContextQueue;
    v20[0] = _NSConcreteStackBlock;
    v20[1] = 3221225472LL;
    v20[2] = sub_10000FE30;
    v20[3] = &unk_1001B9E00;
    v20[4] = self;
    id v21 = v17;
    dispatch_sync(taskContextQueue, v20);
  }
}

- (unint64_t)currentAssetPriority
{
  return self->_currentAssetPriority;
}

- (void).cxx_destruct
{
}

+ (void)unimplementedExceptionForMethodName:(id)a3
{
  id v3 = +[NSException exceptionWithName:reason:userInfo:]( &OBJC_CLASS___NSException,  "exceptionWithName:reason:userInfo:",  @"NotImplementedException",  objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"[VCPMADPhotosProcessingTask %@] should not be called",  a3)),  0LL);
  id v4 = (id)objc_claimAutoreleasedReturnValue(v3);
  objc_exception_throw(v4);
  +[MADPhotosTaskProvider name](v5, v6);
}

+ (id)name
{
  return 0LL;
}

- (id)photoLibrary
{
  return self->_photoLibrary;
}

- (id)assetPriorities
{
  return &off_1001C8FA0;
}

- (id)mediaTypePredicatesString
{
  return 0LL;
}

- (BOOL)bypassDownload
{
  return 0;
}

- (unint64_t)photosMediaProcessingTaskID
{
  return PHMediaProcessingTaskIDForVCPTaskID(-[MADTaskProvider taskID](self, "taskID"));
}

- (BOOL)checkCompatibilityForAsset:(id)a3
{
  return 1;
}

- (id)assetTaskWithAnalysisDatabase:(id)a3
{
  return 0LL;
}

- (unint64_t)batchAssetCount
{
  return 100LL;
}

@end