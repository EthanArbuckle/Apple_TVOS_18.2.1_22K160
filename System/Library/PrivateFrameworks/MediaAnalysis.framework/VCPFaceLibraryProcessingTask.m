@interface VCPFaceLibraryProcessingTask
+ (id)taskWithPhotoLibraries:(id)a3 andOptions:(id)a4 andProgressHandler:(id)a5 andCompletionHandler:(id)a6 andCancelBlock:(id)a7;
- (BOOL)_readyToProcessProcessLibrary:(id)a3;
- (BOOL)autoCancellable;
- (BOOL)isCancelled;
- (VCPFaceLibraryProcessingTask)init;
- (VCPFaceLibraryProcessingTask)initWithPhotoLibraries:(id)a3 andOptions:(id)a4 andProgressHandler:(id)a5 andCompletionHandler:(id)a6 andCancelBlock:(id)a7;
- (float)resourceRequirement;
- (id)_processingTaskForPhotoLibrary:(id)a3;
- (int)_addBatchWithAsset:(id)a3 isRetry:(BOOL)a4 withTask:(id)a5;
- (int)_analyzeAllAssetsWithTask:(id)a3;
- (int)_buildPersonsForPhotoLibrary:(id)a3 withClusterer:(id)a4 andContext:(id)a5;
- (int)_clusterAndProcessPersonsForPhotoLibrary:(id)a3 withContext:(id)a4 progressMade:(BOOL *)a5;
- (int)_clusterFacesWithClusterer:(id)a3;
- (int)_detectFacesForPhotoLibrary:(id)a3;
- (int)_generateAndDetectFaceCropsForPhotoLibrary:(id)a3;
- (int)_maintainProcessingStatusWithTask:(id)a3;
- (int)_processAutoCounterForPhotoLibrary:(id)a3;
- (int)_processFetchedAssets:(id)a3 withProcessingTask:(id)a4 andProgressReporter:(id)a5;
- (int)_processLibrary:(id)a3;
- (int)_processLocalIdentifiers:(id)a3 change:(id)a4 insert:(BOOL)a5 withTask:(id)a6;
- (int)_retryEligibleAssetsWithTask:(id)a3 andStatus:(unint64_t)a4 andReporter:(id)a5;
- (int)_retryFailedAssetsWithTask:(id)a3;
- (int)_screenLocalIdentifiers:(id)a3 withTask:(id)a4 andPreviousStatus:(unint64_t)a5 andProgressReporter:(id)a6;
- (int)_streamAnalysisWithTask:(id)a3 andProcessingStatus:(unint64_t)a4;
- (int)_updateQuickFaceIDModelForPhotoLibrary:(id)a3 withContext:(id)a4 andQuickFaceIDManager:(id)a5;
- (int)completeSceneProcessing;
- (int)run;
- (int)runGalleryProcessingForPhotoLibrary:(id)a3 progressHandler:(id)a4;
- (int)runLegacyProcessingForPhotoLibrary:(id)a3 progressHandler:(id)a4;
- (void)cancel;
- (void)dealloc;
@end

@implementation VCPFaceLibraryProcessingTask

- (VCPFaceLibraryProcessingTask)init
{
  return 0LL;
}

- (VCPFaceLibraryProcessingTask)initWithPhotoLibraries:(id)a3 andOptions:(id)a4 andProgressHandler:(id)a5 andCompletionHandler:(id)a6 andCancelBlock:(id)a7
{
  id v13 = a3;
  id v14 = a4;
  v15 = (Block_layout *)a5;
  v16 = (Block_layout *)a6;
  v17 = (Block_layout *)a7;
  v44.receiver = self;
  v44.super_class = (Class)&OBJC_CLASS___VCPFaceLibraryProcessingTask;
  v18 = -[VCPFaceLibraryProcessingTask init](&v44, "init");
  v19 = v18;
  v20 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_photoLibraries, a3);
    uint64_t v21 = objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
    processingTasks = v20->_processingTasks;
    v20->_processingTasks = (NSMutableDictionary *)v21;

    p_options = (id *)&v19->_options;
    objc_storeStrong((id *)&v19->_options, a4);
    if (v15) {
      v24 = v15;
    }
    else {
      v24 = &stru_1001BCD20;
    }
    v25 = objc_retainBlock(v24);
    id progressHandler = v20->_progressHandler;
    v20->_id progressHandler = v25;

    if (v16) {
      v27 = v16;
    }
    else {
      v27 = &stru_1001BCD40;
    }
    v28 = objc_retainBlock(v27);
    id completionHandler = v20->_completionHandler;
    v20->_id completionHandler = v28;

    if (v17) {
      v30 = v17;
    }
    else {
      v30 = &stru_1001BCD60;
    }
    v31 = objc_retainBlock(v30);
    id cancelBlock = v20->_cancelBlock;
    v20->_id cancelBlock = v31;

    uint64_t v33 = objc_claimAutoreleasedReturnValue(+[NSMutableSet set](&OBJC_CLASS___NSMutableSet, "set"));
    assetBatch = v20->_assetBatch;
    v20->_assetBatch = (NSMutableSet *)v33;

    v20->_subtasks = -1LL;
    v35 = (void *)objc_claimAutoreleasedReturnValue( -[NSDictionary objectForKeyedSubscript:]( v20->_options,  "objectForKeyedSubscript:",  MADFaceLibraryProcessing_ModifyPersonRequest));
    unsigned int v36 = [v35 BOOLValue];

    if (v36)
    {
      uint64_t v37 = 52LL;
    }

    else
    {
      v38 = (void *)objc_claimAutoreleasedReturnValue([*p_options objectForKeyedSubscript:MADFaceLibraryProcessing_AutoCounterOnly]);
      unsigned int v39 = [v38 BOOLValue];

      if (!v39)
      {
        uint64_t v41 = MADFaceLibraryProcessing_SubTasks;
        v42 = (void *)objc_claimAutoreleasedReturnValue([*p_options objectForKeyedSubscript:MADFaceLibraryProcessing_SubTasks]);

        if (v42)
        {
          v43 = (void *)objc_claimAutoreleasedReturnValue([*p_options objectForKeyedSubscript:v41]);
          v20->_subtasks = (unint64_t)[v43 unsignedIntegerValue];
        }

        goto LABEL_16;
      }

      uint64_t v37 = 128LL;
    }

    v20->_subtasks = v37;
LABEL_16:
    [(id)objc_opt_class(v20) _logSubtasks:v20->_subtasks];
  }

  return v20;
}

+ (id)taskWithPhotoLibraries:(id)a3 andOptions:(id)a4 andProgressHandler:(id)a5 andCompletionHandler:(id)a6 andCancelBlock:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  id v17 = [objc_alloc((Class)objc_opt_class(a1)) initWithPhotoLibraries:v12 andOptions:v13 andProgressHandler:v14 andCompletionHandler:v15 andCancelBlock:v16];

  return v17;
}

- (void)dealloc
{
  unsigned __int8 v3 = atomic_load((unsigned __int8 *)&self->_started);
  if ((v3 & 1) == 0) {
    (*((void (**)(void))self->_completionHandler + 2))();
  }
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___VCPFaceLibraryProcessingTask;
  -[VCPFaceLibraryProcessingTask dealloc](&v4, "dealloc");
}

- (float)resourceRequirement
{
  return 1.0;
}

- (BOOL)autoCancellable
{
  return 0;
}

- (void)cancel
{
}

- (BOOL)isCancelled
{
  unsigned __int8 v4 = atomic_load((unsigned __int8 *)&self->_cancel);
  return v4 & 1;
}

- (id)_processingTaskForPhotoLibrary:(id)a3
{
  id v4 = a3;
  v5 = self;
  objc_sync_enter(v5);
  processingTasks = v5->_processingTasks;
  v7 = (void *)objc_claimAutoreleasedReturnValue([v4 databaseUUID]);
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](processingTasks, "objectForKeyedSubscript:", v7));

  if (!v8)
  {
    uint64_t v11 = MediaAnalysisLogLevel(v9, v10);
    if ((int)v11 >= 6)
    {
      uint64_t v13 = VCPLogInstance(v11, v12);
      id v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
      os_log_type_t v15 = VCPLogToOSLogType[6];
      if (os_log_type_enabled(v14, v15))
      {
        *(_DWORD *)buf = 138412290;
        id v30 = v4;
        _os_log_impl( (void *)&_mh_execute_header,  v14,  v15,  "[FaceLibraryProcessing] Creating VCPFaceProcessingTask for library %@",  buf,  0xCu);
      }
    }

    id v16 = (void *)objc_claimAutoreleasedReturnValue( +[VCPPhotosFaceProcessingContext contextWithPhotoLibrary:]( &OBJC_CLASS___VCPPhotosFaceProcessingContext,  "contextWithPhotoLibrary:",  v4));
    id v17 = (void *)objc_claimAutoreleasedReturnValue( -[NSDictionary objectForKeyedSubscript:]( v5->_options,  "objectForKeyedSubscript:",  MADFaceLibraryProcessing_ModifyPersonRequest));
    unsigned int v18 = [v17 BOOLValue];

    if (v18) {
      [v16 setSkipGallerySyncing:1];
    }
    objc_initWeak((id *)buf, v5);
    v27[0] = _NSConcreteStackBlock;
    v27[1] = 3221225472LL;
    v27[2] = sub_1000B8FA4;
    v27[3] = &unk_1001BCD88;
    objc_copyWeak(&v28, (id *)buf);
    v19 = objc_retainBlock(v27);
    v20 = (void *)objc_claimAutoreleasedReturnValue( +[VCPFaceProcessingTask taskWithPhotoLibrary:andContext:andCancelBlock:]( &OBJC_CLASS___VCPFaceProcessingTask,  "taskWithPhotoLibrary:andContext:andCancelBlock:",  v4,  v16,  v19));
    uint64_t v21 = v5->_processingTasks;
    v22 = (void *)objc_claimAutoreleasedReturnValue([v4 databaseUUID]);
    -[NSMutableDictionary setObject:forKeyedSubscript:](v21, "setObject:forKeyedSubscript:", v20, v22);

    objc_destroyWeak(&v28);
    objc_destroyWeak((id *)buf);
  }

  v23 = v5->_processingTasks;
  v24 = (void *)objc_claimAutoreleasedReturnValue([v4 databaseUUID]);
  v25 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](v23, "objectForKeyedSubscript:", v24));

  objc_sync_exit(v5);
  return v25;
}

- (int)_addBatchWithAsset:(id)a3 isRetry:(BOOL)a4 withTask:(id)a5
{
  BOOL v6 = a4;
  id v8 = a3;
  id v9 = a5;
  if (!-[VCPFaceLibraryProcessingTask isCancelled](self, "isCancelled"))
  {
    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(+[VCPWatchdog sharedWatchdog](&OBJC_CLASS___VCPWatchdog, "sharedWatchdog"));
    [v11 pet];

    if ((objc_msgSend(v8, "vcp_needsFaceProcessing") & 1) == 0)
    {
      if (!v6) {
        goto LABEL_18;
      }
      v23 = (void *)objc_claimAutoreleasedReturnValue([v9 database]);
      v24 = (void *)objc_claimAutoreleasedReturnValue([v8 localIdentifier]);
      [v23 removeProcessingStatusForLocalIdentifier:v24 andTaskID:3];

      v25 = (void *)objc_claimAutoreleasedReturnValue([v9 database]);
      [v25 commit];

      uint64_t v28 = MediaAnalysisLogLevel(v26, v27);
      uint64_t v30 = VCPLogInstance(v28, v29);
      v20 = (os_log_s *)objc_claimAutoreleasedReturnValue(v30);
      os_log_type_t v31 = VCPLogToOSLogType[6];
      if (os_log_type_enabled(v20, v31))
      {
        v32 = (void *)objc_claimAutoreleasedReturnValue([v8 localIdentifier]);
        *(_DWORD *)buf = 138412290;
        *(void *)&uint8_t buf[4] = v32;
        _os_log_impl( (void *)&_mh_execute_header,  v20,  v31,  "[FaceLibraryProcessing][%@] Analysis is up-to-date",  buf,  0xCu);
      }

      goto LABEL_17;
    }

    uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue([v8 photoLibrary]);
    if (objc_msgSend(v12, "mad_pauseFCPeopleFurtherProcessing"))
    {
      unsigned int v13 = [v8 faceAnalysisVersion];
      else {
        int v14 = 11;
      }

      if (v14 == v13)
      {
        uint64_t v17 = MediaAnalysisLogLevel(v15, v16);
        if ((int)v17 < 5)
        {
LABEL_18:
          int v10 = 0;
          goto LABEL_62;
        }

        uint64_t v19 = VCPLogInstance(v17, v18);
        v20 = (os_log_s *)objc_claimAutoreleasedReturnValue(v19);
        os_log_type_t v21 = VCPLogToOSLogType[5];
        if (os_log_type_enabled(v20, v21))
        {
          v22 = (void *)objc_claimAutoreleasedReturnValue([v8 localIdentifier]);
          *(_DWORD *)buf = 138412290;
          *(void *)&uint8_t buf[4] = v22;
          _os_log_impl( (void *)&_mh_execute_header,  v20,  v21,  "[%@][FaceAnalysisStateCheck] already with FC version; skip",
            buf,
            0xCu);
        }

- (int)_screenLocalIdentifiers:(id)a3 withTask:(id)a4 andPreviousStatus:(unint64_t)a5 andProgressReporter:(id)a6
{
  id v9 = a3;
  id v59 = a4;
  uint64_t v56 = v9;
  id v57 = a6;
  uint64_t v58 = -[NSMutableSet initWithArray:](objc_alloc(&OBJC_CLASS___NSMutableSet), "initWithArray:", v9);
  int v10 = (void *)objc_claimAutoreleasedReturnValue([v59 photoLibrary]);
  uint64_t v11 = objc_claimAutoreleasedReturnValue( +[PHAsset vcp_fetchOptionsForLibrary:forTaskID:]( &OBJC_CLASS___PHAsset,  "vcp_fetchOptionsForLibrary:forTaskID:",  v10,  3LL));

  uint64_t v55 = (void *)v11;
  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue( +[PHAsset fetchAssetsWithLocalIdentifiers:options:]( &OBJC_CLASS___PHAsset,  "fetchAssetsWithLocalIdentifiers:options:",  v9,  v11));
  uint64_t v13 = 0LL;
  id v14 = [v12 count];
  if (v14)
  {
    uint64_t v15 = 0LL;
    while (1)
    {
      uint64_t v16 = objc_autoreleasePoolPush();
      uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue([v12 objectAtIndexedSubscript:v15]);
      if (-[VCPFaceLibraryProcessingTask isCancelled](self, "isCancelled"))
      {
        uint64_t v13 = 4294967168LL;
        int v18 = 7;
      }

      else
      {
        uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue([v17 localIdentifier]);
        -[NSMutableSet removeObject:](v58, "removeObject:", v19);

        [v57 increaseProcessedJobCountByOne];
        unsigned int v20 = -[VCPFaceLibraryProcessingTask _addBatchWithAsset:isRetry:withTask:]( self,  "_addBatchWithAsset:isRetry:withTask:",  v17,  1LL,  v59);
        int v18 = v20 ? 7 : 0;
        uint64_t v13 = v20 ? v20 : v13;
      }

      objc_autoreleasePoolPop(v16);
      if (v18) {
        break;
      }
      if (v14 == (id)++v15) {
        goto LABEL_15;
      }
    }
  }

  else
  {
LABEL_15:
    if (-[NSMutableSet count](self->_assetBatch, "count"))
    {
      *(void *)&__int128 v71 = 0LL;
      *((void *)&v71 + 1) = &v71;
      uint64_t v72 = 0x2020000000LL;
      int v73 = 0;
      v64[0] = _NSConcreteStackBlock;
      v64[1] = 3221225472LL;
      v64[2] = sub_1000B9ECC;
      v64[3] = &unk_1001BBF78;
      v67 = &v71;
      id v65 = v59;
      v66 = self;
      os_log_type_t v21 = objc_retainBlock(v64);
      v22 = (void *)objc_claimAutoreleasedReturnValue(+[VCPMADQoSManager sharedManager](&OBJC_CLASS___VCPMADQoSManager, "sharedManager"));
      [v22 runBlock:v21 withTaskID:3];

      id v23 = -[NSMutableSet removeAllObjects](self->_assetBatch, "removeAllObjects");
      int v25 = *(_DWORD *)(*((void *)&v71 + 1) + 24LL);
      if (v25)
      {
        uint64_t v26 = MediaAnalysisLogLevel(v23, v24);
        if ((int)v26 >= 3)
        {
          uint64_t v28 = VCPLogInstance(v26, v27);
          uint64_t v29 = (os_log_s *)objc_claimAutoreleasedReturnValue(v28);
          os_log_type_t v30 = VCPLogToOSLogType[3];
          if (os_log_type_enabled(v29, v30))
          {
            int v31 = *(_DWORD *)(*((void *)&v71 + 1) + 24LL);
            *(_DWORD *)buf = 67109120;
            int v70 = v31;
            _os_log_impl( (void *)&_mh_execute_header,  v29,  v30,  "[FaceLibraryProcessing] Failed to process asset batch (error: %d)",  buf,  8u);
          }
        }

        *(_DWORD *)(*((void *)&v71 + 1) + 24LL) = v25;

        _Block_object_dispose(&v71, 8);
        goto LABEL_49;
      }

      _Block_object_dispose(&v71, 8);
    }

    v32 = (void *)objc_claimAutoreleasedReturnValue( +[VCPMADCoreAnalyticsManager sharedManager]( &OBJC_CLASS___VCPMADCoreAnalyticsManager,  "sharedManager"));
    [v32 accumulateInt64Value:v14 forField:@"NumberOfAssetsOutFromBlacklist" andEvent:@"com.apple.mediaanalysisd.FaceAnalysisRunSession"];

    if (-[NSMutableSet count](v58, "count"))
    {
      __int128 v62 = 0u;
      __int128 v63 = 0u;
      __int128 v60 = 0u;
      __int128 v61 = 0u;
      uint64_t v33 = v58;
      id v34 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( v33,  "countByEnumeratingWithState:objects:count:",  &v60,  v68,  16LL);
      if (v34)
      {
        uint64_t v35 = *(void *)v61;
LABEL_26:
        id v36 = 0LL;
        uint64_t v37 = v13;
        while (1)
        {
          if (*(void *)v61 != v35) {
            objc_enumerationMutation(v33);
          }
          uint64_t v38 = *(void *)(*((void *)&v60 + 1) + 8LL * (void)v36);
          unsigned int v39 = (void *)objc_claimAutoreleasedReturnValue([v59 database]);
          id v40 = [v39 removeProcessingStatusForLocalIdentifier:v38 andTaskID:3];

          int v41 = 7;
          if ((_DWORD)v40 == -108)
          {
            uint64_t v13 = (uint64_t)v40;
          }

          else
          {
            BOOL v42 = (_DWORD)v40 == -36 || (_DWORD)v40 == -23;
            uint64_t v13 = (uint64_t)v40;
            if (!v42)
            {
              int v41 = 0;
              uint64_t v13 = v37;
            }
          }

          if ((_DWORD)v40 == -108) {
            break;
          }
          if ((_DWORD)v40 == -36 || (_DWORD)v40 == -23) {
            break;
          }
          id v36 = (char *)v36 + 1;
          uint64_t v37 = v13;
          if (v34 == v36)
          {
            id v34 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( v33,  "countByEnumeratingWithState:objects:count:",  &v60,  v68,  16LL);
            if (v34) {
              goto LABEL_26;
            }
            goto LABEL_43;
          }
        }

        if (v41 == 7) {
          goto LABEL_49;
        }
      }

      else
      {
LABEL_43:
      }

      uint64_t v46 = MediaAnalysisLogLevel(v44, v45);
      if ((int)v46 >= 6)
      {
        uint64_t v48 = VCPLogInstance(v46, v47);
        int v49 = (os_log_s *)objc_claimAutoreleasedReturnValue(v48);
        os_log_type_t v50 = VCPLogToOSLogType[6];
        if (os_log_type_enabled(v49, v50))
        {
          id v51 = -[NSMutableSet count](v33, "count");
          LODWORD(v71) = 134217984;
          *(void *)((char *)&v71 + 4) = v51;
          _os_log_impl( (void *)&_mh_execute_header,  v49,  v50,  "[FaceLibraryProcessing] Removed %lu unknown assets",  (uint8_t *)&v71,  0xCu);
        }
      }
    }
  }

- (int)_streamAnalysisWithTask:(id)a3 andProcessingStatus:(unint64_t)a4
{
  id v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue([v6 photoLibrary]);
  unsigned __int8 v8 = objc_msgSend(v7, "vcp_allowInMemoryDownload");

  if ((v8 & 1) == 0)
  {
LABEL_47:
    int v55 = 0;
    goto LABEL_48;
  }

  id v9 = (void *)objc_claimAutoreleasedReturnValue([v6 photoLibrary]);
  id v10 = objc_msgSend(v9, "mad_pauseFCPeopleFurtherProcessing");

  if (v10)
  {
    uint64_t v13 = MediaAnalysisLogLevel(v11, v12);
    if ((int)v13 >= 6)
    {
      uint64_t v15 = VCPLogInstance(v13, v14);
      uint64_t v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(v15);
      os_log_type_t v17 = VCPLogToOSLogType[6];
      if (os_log_type_enabled(v16, v17))
      {
        *(_WORD *)buf = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v16,  v17,  "[FaceLibraryProcessing] Pause using large derivatives for FC people processing",  buf,  2u);
      }
    }

    goto LABEL_47;
  }

  uint64_t v18 = MediaAnalysisLogLevel(v11, v12);
  if ((int)v18 >= 5)
  {
    uint64_t v20 = VCPLogInstance(v18, v19);
    os_log_type_t v21 = (os_log_s *)objc_claimAutoreleasedReturnValue(v20);
    os_log_type_t v22 = VCPLogToOSLogType[5];
    if (os_log_type_enabled(v21, v22))
    {
      id v23 = (void *)objc_claimAutoreleasedReturnValue([v6 photoLibrary]);
      uint64_t v24 = (void *)objc_claimAutoreleasedReturnValue([v23 photoLibraryURL]);
      int v25 = (void *)objc_claimAutoreleasedReturnValue([v24 path]);
      uint64_t v26 = VCPProcessingStatusDescription(a4);
      uint64_t v27 = (void *)objc_claimAutoreleasedReturnValue(v26);
      *(_DWORD *)buf = 138412546;
      id v65 = v25;
      __int16 v66 = 2112;
      id v67 = v27;
      _os_log_impl( (void *)&_mh_execute_header,  v21,  v22,  "[FaceLibraryProcessing] Stream Library %@ for eligible %@ assets",  buf,  0x16u);
    }
  }

  uint64_t v28 = objc_claimAutoreleasedReturnValue([v6 database]);
  signed int v29 = [(id)v28 queryAssetCountForTaskID:3 withStatus:a4 andAttempts:1];

  if (!v29) {
    goto LABEL_47;
  }
  v63[0] = _NSConcreteStackBlock;
  v63[1] = 3221225472LL;
  v63[2] = sub_1000BA4B8;
  v63[3] = &unk_1001BC570;
  v63[4] = self;
  __int128 v60 = objc_retainBlock(v63);
  __int128 v61 = (void *)objc_claimAutoreleasedReturnValue( +[VCPProgressReporter reporterWithIntervalSeconds:andTotalJobCount:andBlock:]( &OBJC_CLASS___VCPProgressReporter,  "reporterWithIntervalSeconds:andTotalJobCount:andBlock:",  10LL,  v29,  v60));
  os_log_type_t v58 = VCPLogToOSLogType[3];
  os_log_type_t type = VCPLogToOSLogType[7];
  *(void *)&__int128 v30 = 134218242LL;
  __int128 v57 = v30;
  do
  {
    int v31 = objc_autoreleasePoolPush();
    if (-[VCPFaceLibraryProcessingTask isCancelled](self, "isCancelled"))
    {
      uint64_t v28 = 4294967168LL;
      int v32 = 1;
      goto LABEL_42;
    }

    uint64_t v33 = (void *)objc_claimAutoreleasedReturnValue([v6 database]);
    id v62 = 0LL;
    id v34 = [v33 fetchLocalIdentifiers:&v62 withProcessingStatus:a4 andTaskID:3 andAttempts:1 andFetchLimit:100];
    id v35 = v62;

    if ((_DWORD)v34 == -108 || (_DWORD)v34 == -36)
    {
      uint64_t v36 = (uint64_t)v34;
    }

    else
    {
      uint64_t v36 = (uint64_t)v34;
      if ((_DWORD)v34 != -23) {
        uint64_t v36 = v28;
      }
    }

    int v32 = 1;
    if ((_DWORD)v34 != -108 && (_DWORD)v34 != -36 && (_DWORD)v34 != -23)
    {
      if ([v35 count])
      {
        id v38 = [v6 setAllowStreaming:1];
        uint64_t v40 = MediaAnalysisLogLevel(v38, v39);
        if ((int)v40 >= 7)
        {
          uint64_t v42 = VCPLogInstance(v40, v41);
          uint64_t v43 = (os_log_s *)objc_claimAutoreleasedReturnValue(v42);
          if (os_log_type_enabled(v43, type))
          {
            id v44 = [v35 count];
            *(_DWORD *)buf = v57;
            id v65 = v44;
            __int16 v66 = 2112;
            id v67 = v35;
            _os_log_impl( (void *)&_mh_execute_header,  v43,  type,  "[FaceLibraryProcessing] Screening %lu assets: %@",  buf,  0x16u);
          }
        }

        uint64_t v45 = -[VCPFaceLibraryProcessingTask _screenLocalIdentifiers:withTask:andPreviousStatus:andProgressReporter:]( self,  "_screenLocalIdentifiers:withTask:andPreviousStatus:andProgressReporter:",  v35,  v6,  a4,  v61,  v57);
        uint64_t v47 = v45;
        if (!(_DWORD)v45)
        {
          int v32 = 0;
          goto LABEL_41;
        }

        uint64_t v48 = MediaAnalysisLogLevel(v45, v46);
        if ((int)v48 < 3)
        {
          uint64_t v36 = v47;
          goto LABEL_41;
        }

        uint64_t v50 = VCPLogInstance(v48, v49);
        id v51 = (os_log_s *)objc_claimAutoreleasedReturnValue(v50);
        if (os_log_type_enabled(v51, v58))
        {
          *(_WORD *)buf = 0;
          _os_log_impl( (void *)&_mh_execute_header,  v51,  v58,  "[FaceLibraryProcessing] Failed to screen assets",  buf,  2u);
        }

        uint64_t v36 = v47;
      }

      else
      {
        uint64_t v52 = MediaAnalysisLogLevel(0LL, v37);
        if ((int)v52 < 7)
        {
          int v32 = 11;
          goto LABEL_41;
        }

        uint64_t v54 = VCPLogInstance(v52, v53);
        id v51 = (os_log_s *)objc_claimAutoreleasedReturnValue(v54);
        if (os_log_type_enabled(v51, type))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v51, type, "[FaceLibraryProcessing] No qualified assets", buf, 2u);
        }

        int v32 = 11;
      }
    }

- (int)_retryEligibleAssetsWithTask:(id)a3 andStatus:(unint64_t)a4 andReporter:(id)a5
{
  id v9 = a3;
  id v77 = a5;
  id v10 = (void *)objc_claimAutoreleasedReturnValue([v9 database]);
  uint64_t v11 = (os_log_s *)[v10 queryEligibleToRetryAssetCountWithProcessingStatus:a4 andTaskID:3];

  if (!v11)
  {
LABEL_7:
    int v21 = 0;
    goto LABEL_66;
  }

  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue([v9 photoLibrary]);
  uint64_t v13 = (uint64_t)objc_msgSend(v12, "mad_pauseFCPeopleFurtherProcessing");

  if (v13)
  {
    uint64_t v16 = MediaAnalysisLogLevel(v14, v15);
    if ((int)v16 >= 6)
    {
      uint64_t v18 = VCPLogInstance(v16, v17);
      uint64_t v19 = (os_log_s *)objc_claimAutoreleasedReturnValue(v18);
      os_log_type_t v20 = VCPLogToOSLogType[6];
      if (os_log_type_enabled(v19, v20))
      {
        *(_WORD *)buf = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v19,  v20,  "[FaceLibraryProcessing] Pause using large derivatives for FC people processing",  buf,  2u);
      }
    }

    goto LABEL_7;
  }

  if (a4 <= 7 && ((1LL << a4) & 0x9C) != 0)
  {
    uint64_t v22 = MediaAnalysisLogLevel(v14, v15);
    if ((int)v22 >= 6)
    {
      uint64_t v25 = VCPLogInstance(v22, v23);
      uint64_t v26 = (os_log_s *)objc_claimAutoreleasedReturnValue(v25);
      os_log_type_t v27 = VCPLogToOSLogType[6];
      if (os_log_type_enabled(v26, v27))
      {
        uint64_t v28 = (void *)objc_claimAutoreleasedReturnValue([v9 photoLibrary]);
        v5 = (void *)objc_claimAutoreleasedReturnValue([v28 photoLibraryURL]);
        uint64_t v13 = objc_claimAutoreleasedReturnValue([v5 path]);
        uint64_t v29 = VCPProcessingStatusDescription(a4);
        __int128 v30 = (void *)objc_claimAutoreleasedReturnValue(v29);
        *(_DWORD *)buf = 138412802;
        uint64_t v80 = v13;
        __int16 v81 = 2048;
        uint64_t v82 = v11;
        __int16 v83 = 2112;
        int v84 = v30;
        _os_log_impl( (void *)&_mh_execute_header,  v26,  v27,  "[FaceLibraryProcessing] Retry Library %@ with %lu eligible %@ assets",  buf,  0x20u);
      }

- (int)_retryFailedAssetsWithTask:(id)a3
{
  id v4 = a3;
  uint64_t v6 = MediaAnalysisLogLevel(v4, v5);
  if ((int)v6 >= 5)
  {
    uint64_t v8 = VCPLogInstance(v6, v7);
    id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
    os_log_type_t v10 = VCPLogToOSLogType[5];
    if (os_log_type_enabled(v9, v10))
    {
      uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([v4 photoLibrary]);
      uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue([v11 photoLibraryURL]);
      uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue([v12 path]);
      *(_DWORD *)buf = 138412290;
      uint64_t v22 = v13;
      _os_log_impl( (void *)&_mh_execute_header,  v9,  v10,  "[FaceLibraryProcessing] Retry Library %@ for eligible failed assets",  buf,  0xCu);
    }
  }

  uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue([v4 database]);
  id v15 = [v14 queryEligibleToRetryAssetCountWithTaskID:3];

  if (v15)
  {
    v20[0] = _NSConcreteStackBlock;
    v20[1] = 3221225472LL;
    v20[2] = sub_1000BAEFC;
    v20[3] = &unk_1001BC570;
    v20[4] = self;
    uint64_t v16 = objc_retainBlock(v20);
    uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue( +[VCPProgressReporter reporterWithIntervalSeconds:andTotalJobCount:andBlock:]( &OBJC_CLASS___VCPProgressReporter,  "reporterWithIntervalSeconds:andTotalJobCount:andBlock:",  10LL,  v15,  v16));
    int v18 = -[VCPFaceLibraryProcessingTask _retryEligibleAssetsWithTask:andStatus:andReporter:]( self,  "_retryEligibleAssetsWithTask:andStatus:andReporter:",  v4,  0LL,  v17);
    if (!v18)
    {
      int v18 = -[VCPFaceLibraryProcessingTask _retryEligibleAssetsWithTask:andStatus:andReporter:]( self,  "_retryEligibleAssetsWithTask:andStatus:andReporter:",  v4,  1LL,  v17);
      if (!v18)
      {
        int v18 = -[VCPFaceLibraryProcessingTask _retryEligibleAssetsWithTask:andStatus:andReporter:]( self,  "_retryEligibleAssetsWithTask:andStatus:andReporter:",  v4,  2LL,  v17);
        if (!v18)
        {
          int v18 = -[VCPFaceLibraryProcessingTask _retryEligibleAssetsWithTask:andStatus:andReporter:]( self,  "_retryEligibleAssetsWithTask:andStatus:andReporter:",  v4,  7LL,  v17);
          if (!v18)
          {
            int v18 = -[VCPFaceLibraryProcessingTask _retryEligibleAssetsWithTask:andStatus:andReporter:]( self,  "_retryEligibleAssetsWithTask:andStatus:andReporter:",  v4,  3LL,  v17);
            if (!v18) {
              int v18 = -[VCPFaceLibraryProcessingTask _retryEligibleAssetsWithTask:andStatus:andReporter:]( self,  "_retryEligibleAssetsWithTask:andStatus:andReporter:",  v4,  4LL,  v17);
            }
          }
        }
      }
    }
  }

  else
  {
    int v18 = 0;
  }

  return v18;
}

- (int)_processFetchedAssets:(id)a3 withProcessingTask:(id)a4 andProgressReporter:(id)a5
{
  id v9 = a3;
  id v48 = a4;
  id v46 = a5;
  uint64_t v47 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  unint64_t v10 = 0LL;
  os_log_type_t type = VCPLogToOSLogType[5];
  *(void *)&__int128 v11 = 138412802LL;
  __int128 v44 = v11;
  while (v10 < (unint64_t)objc_msgSend(v9, "count", v44))
  {
    uint64_t v12 = objc_autoreleasePoolPush();
    if (-[VCPFaceLibraryProcessingTask isCancelled](self, "isCancelled"))
    {
      int v5 = -128;
      int v13 = 1;
    }

    else
    {
      uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue([v9 objectAtIndexedSubscript:v10]);
      [v46 increaseProcessedJobCountByOne];
      id v15 = +[PHPhotoLibrary mad_isProcessingNeededOnAsset:forTaskID:]( &OBJC_CLASS___PHPhotoLibrary,  "mad_isProcessingNeededOnAsset:forTaskID:",  v14,  3LL);
      if ((v15 & 1) != 0)
      {
        unsigned int v17 = -[VCPFaceLibraryProcessingTask _addBatchWithAsset:isRetry:withTask:]( self,  "_addBatchWithAsset:isRetry:withTask:",  v14,  0LL,  v48);
        int v13 = v17 != 0;
        if (v17) {
          int v5 = v17;
        }
      }

      else
      {
        uint64_t v18 = MediaAnalysisLogLevel(v15, v16);
        if ((int)v18 >= 5)
        {
          uint64_t v20 = VCPLogInstance(v18, v19);
          int v21 = (os_log_s *)objc_claimAutoreleasedReturnValue(v20);
          if (os_log_type_enabled(v21, type))
          {
            id v22 = (id)objc_opt_class(self);
            uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue([v14 localIdentifier]);
            *(_DWORD *)buf = v44;
            *(void *)&uint8_t buf[4] = v22;
            *(_WORD *)&buf[12] = 2112;
            *(void *)&buf[14] = v23;
            *(_WORD *)&buf[22] = 2048;
            uint64_t v56 = 3LL;
            _os_log_impl( (void *)&_mh_execute_header,  v21,  type,  "[%@][%@] Asset does not need processing in task %lu, ignoring... ",  buf,  0x20u);
          }
        }

        [v47 addObject:v14];
        __int128 v24 = (void *)objc_claimAutoreleasedReturnValue([v48 database]);
        uint64_t v25 = (void *)objc_claimAutoreleasedReturnValue([v14 localIdentifier]);
        [v24 removeProcessingStatusForLocalIdentifier:v25 andTaskID:3];

        uint64_t v26 = (void *)objc_claimAutoreleasedReturnValue([v48 database]);
        [v26 commit];

        id v27 = [v47 count];
        if (v27 >= +[PHPhotoLibrary mad_maxIgnoredAssetsToMarkAsProcessed]( &OBJC_CLASS___PHPhotoLibrary,  "mad_maxIgnoredAssetsToMarkAsProcessed"))
        {
          uint64_t v28 = (void *)objc_claimAutoreleasedReturnValue(+[VCPWatchdog sharedWatchdog](&OBJC_CLASS___VCPWatchdog, "sharedWatchdog"));
          [v28 pet];

          uint64_t v29 = (void *)objc_claimAutoreleasedReturnValue([v48 photoLibrary]);
          objc_msgSend(v29, "mad_markAsProcessedByTask:forAssets:", 3, v47);

          [v47 removeAllObjects];
        }

        int v13 = 4;
      }
    }

    objc_autoreleasePoolPop(v12);
    if ((v13 | 4) != 4) {
      goto LABEL_30;
    }
    ++v10;
  }

  if ([v47 count])
  {
    __int128 v30 = (void *)objc_claimAutoreleasedReturnValue(+[VCPWatchdog sharedWatchdog](&OBJC_CLASS___VCPWatchdog, "sharedWatchdog"));
    [v30 pet];

    uint64_t v31 = (void *)objc_claimAutoreleasedReturnValue([v48 photoLibrary]);
    objc_msgSend(v31, "mad_markAsProcessedByTask:forAssets:", 3, v47);

    [v47 removeAllObjects];
  }

  if (!-[NSMutableSet count](self->_assetBatch, "count")) {
    goto LABEL_29;
  }
  *(void *)buf = 0LL;
  *(void *)&buf[8] = buf;
  *(void *)&buf[16] = 0x2020000000LL;
  LODWORD(v56) = 0;
  v49[0] = _NSConcreteStackBlock;
  v49[1] = 3221225472LL;
  v49[2] = sub_1000BB48C;
  v49[3] = &unk_1001BBF78;
  uint64_t v52 = buf;
  id v50 = v48;
  uint64_t v51 = self;
  uint64_t v32 = objc_retainBlock(v49);
  uint64_t v33 = (void *)objc_claimAutoreleasedReturnValue(+[VCPMADQoSManager sharedManager](&OBJC_CLASS___VCPMADQoSManager, "sharedManager"));
  [v33 runBlock:v32 withTaskID:3];

  id v34 = -[NSMutableSet removeAllObjects](self->_assetBatch, "removeAllObjects");
  int v36 = *(_DWORD *)(*(void *)&buf[8] + 24LL);
  if (v36)
  {
    uint64_t v37 = MediaAnalysisLogLevel(v34, v35);
    if ((int)v37 >= 3)
    {
      uint64_t v39 = VCPLogInstance(v37, v38);
      uint64_t v40 = (os_log_s *)objc_claimAutoreleasedReturnValue(v39);
      os_log_type_t v41 = VCPLogToOSLogType[3];
      if (os_log_type_enabled(v40, v41))
      {
        int v42 = *(_DWORD *)(*(void *)&buf[8] + 24LL);
        *(_DWORD *)id v53 = 67109120;
        int v54 = v42;
        _os_log_impl( (void *)&_mh_execute_header,  v40,  v41,  "[FaceLibraryProcessing] Failed to process asset batch: %d",  v53,  8u);
      }
    }

    int v5 = v36;
  }

  _Block_object_dispose(buf, 8);
  if (!v36) {
LABEL_29:
  }
    int v5 = 0;
LABEL_30:

  return v5;
}

- (int)_analyzeAllAssetsWithTask:(id)a3
{
  id v70 = a3;
  uint64_t v4 = MediaAnalysisLogLevel(v70, v3);
  if ((int)v4 >= 5)
  {
    uint64_t v6 = VCPLogInstance(v4, v5);
    uint64_t v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
    os_log_type_t v8 = VCPLogToOSLogType[5];
    if (os_log_type_enabled(v7, v8))
    {
      id v9 = (void *)objc_claimAutoreleasedReturnValue([v70 photoLibrary]);
      unint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([v9 photoLibraryURL]);
      __int128 v11 = (void *)objc_claimAutoreleasedReturnValue([v10 path]);
      *(_DWORD *)buf = 138412290;
      *(void *)id v78 = v11;
      _os_log_impl((void *)&_mh_execute_header, v7, v8, "[FaceLibraryProcessing] Analyzing Library %@", buf, 0xCu);
    }
  }

  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue([v70 photoLibrary]);
  id v13 = objc_msgSend(v12, "vcp_assetCountForTaskID:", 3);

  if (v13)
  {
    v76[0] = _NSConcreteStackBlock;
    v76[1] = 3221225472LL;
    v76[2] = sub_1000BBB80;
    v76[3] = &unk_1001BC570;
    v76[4] = self;
    uint64_t v62 = objc_retainBlock(v76);
    uint64_t v64 = (void *)objc_claimAutoreleasedReturnValue( +[VCPProgressReporter reporterWithIntervalSeconds:andTotalJobCount:andBlock:]( &OBJC_CLASS___VCPProgressReporter,  "reporterWithIntervalSeconds:andTotalJobCount:andBlock:",  10LL,  v13,  v62));
    id v14 = [v70 setAllowStreaming:0];
    uint64_t v16 = MediaAnalysisLogLevel(v14, v15);
    if ((int)v16 >= 5)
    {
      uint64_t v18 = VCPLogInstance(v16, v17);
      uint64_t v19 = (os_log_s *)objc_claimAutoreleasedReturnValue(v18);
      os_log_type_t v20 = VCPLogToOSLogType[5];
      if (os_log_type_enabled(v19, v20))
      {
        *(_WORD *)buf = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v19,  v20,  "[FaceLibraryProcessing] Analyzing with local resources ... ",  buf,  2u);
      }
    }

    int v21 = (void *)objc_claimAutoreleasedReturnValue([v70 photoLibrary]);
    uint64_t v69 = (void *)objc_claimAutoreleasedReturnValue( +[PHMediaProcessingAlgorithmVersionProvider mad_sharedVersionProviderWithPhotoLibrary:]( &OBJC_CLASS___PHMediaProcessingAlgorithmVersionProvider,  "mad_sharedVersionProviderWithPhotoLibrary:",  v21));

    __int128 v74 = 0u;
    __int128 v75 = 0u;
    __int128 v72 = 0u;
    __int128 v73 = 0u;
    id v22 = [&off_1001C9168 countByEnumeratingWithState:&v72 objects:v79 count:16];
    if (v22)
    {
      uint64_t v68 = *(void *)v73;
      os_log_type_t type = VCPLogToOSLogType[5];
      os_log_type_t v65 = VCPLogToOSLogType[3];
      os_log_type_t v63 = VCPLogToOSLogType[6];
      *(void *)&__int128 v23 = 134217984LL;
      __int128 v61 = v23;
LABEL_12:
      uint64_t v24 = 0LL;
      while (1)
      {
        if (*(void *)v73 != v68) {
          objc_enumerationMutation(&off_1001C9168);
        }
        uint64_t v25 = *(void **)(*((void *)&v72 + 1) + 8 * v24);
        uint64_t v26 = objc_autoreleasePoolPush();
        id v27 = [v25 unsignedIntegerValue];
        uint64_t v29 = MediaAnalysisLogLevel(v27, v28);
        if ((int)v29 >= 5)
        {
          uint64_t v31 = VCPLogInstance(v29, v30);
          uint64_t v32 = (os_log_s *)objc_claimAutoreleasedReturnValue(v31);
          if (os_log_type_enabled(v32, type))
          {
            *(_DWORD *)buf = 67109120;
            *(_DWORD *)id v78 = (_DWORD)v27;
            _os_log_impl( (void *)&_mh_execute_header,  v32,  type,  "[FaceLibraryProcessing] Processing P%d assets ... ",  buf,  8u);
          }
        }

        uint64_t v33 = VCPSignPostLog(v29);
        id v34 = (os_log_s *)objc_claimAutoreleasedReturnValue(v33);
        os_signpost_id_t v35 = os_signpost_id_generate(v34);

        uint64_t v37 = VCPSignPostLog(v36);
        uint64_t v38 = (os_log_s *)objc_claimAutoreleasedReturnValue(v37);
        uint64_t v39 = v38;
        if (v35 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v38))
        {
          *(_WORD *)buf = 0;
          _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v39,  OS_SIGNPOST_INTERVAL_BEGIN,  v35,  "VCPFaceLibraryProcessingTask_FetchAssets",  (const char *)&unk_100199097,  buf,  2u);
        }

        uint64_t v40 = (void *)objc_claimAutoreleasedReturnValue([v70 photoLibrary]);
        +[PHAsset mad_peopleThreshold](&OBJC_CLASS___PHAsset, "mad_peopleThreshold");
        id v71 = 0LL;
        os_log_type_t v41 = (void *)objc_claimAutoreleasedReturnValue( objc_msgSend( v40,  "fetchAssetsForMediaProcessingTaskID:priority:algorithmVersion:sceneConfidenceThreshold:error:",  3,  v27,  v69,  &v71));
        id v42 = v71;

        uint64_t v44 = VCPSignPostLog(v43);
        uint64_t v45 = (os_log_s *)objc_claimAutoreleasedReturnValue(v44);
        id v46 = v45;
        if (v35 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v45))
        {
          *(_WORD *)buf = 0;
          _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v46,  OS_SIGNPOST_INTERVAL_END,  v35,  "VCPFaceLibraryProcessingTask_FetchAssets",  (const char *)&unk_100199097,  buf,  2u);
        }

        if (v42)
        {
          uint64_t v49 = MediaAnalysisLogLevel(v47, v48);
          if ((int)v49 >= 3)
          {
            uint64_t v51 = VCPLogInstance(v49, v50);
            uint64_t v52 = (os_log_s *)objc_claimAutoreleasedReturnValue(v51);
            if (os_log_type_enabled(v52, v65))
            {
              *(_DWORD *)buf = 67109378;
              *(_DWORD *)id v78 = (_DWORD)v27;
              *(_WORD *)&v78[4] = 2112;
              *(void *)&v78[6] = v42;
              _os_log_impl( (void *)&_mh_execute_header,  v52,  v65,  "[FaceLibraryProcessing] Failed to fetch P%d assets: %@",  buf,  0x12u);
            }
          }

          LODWORD(v12) = -18;
          BOOL v53 = 1;
        }

        else
        {
          uint64_t v54 = MediaAnalysisLogLevel(v47, v48);
          if ((int)v54 >= 6)
          {
            uint64_t v56 = VCPLogInstance(v54, v55);
            uint64_t v57 = (os_log_s *)objc_claimAutoreleasedReturnValue(v56);
            if (os_log_type_enabled(v57, v63))
            {
              id v58 = [v41 count];
              *(_DWORD *)buf = v61;
              *(void *)id v78 = v58;
              _os_log_impl( (void *)&_mh_execute_header,  v57,  v63,  "[FaceLibraryProcessing] Fetched %lu assets",  buf,  0xCu);
            }
          }

          unsigned int v59 = -[VCPFaceLibraryProcessingTask _processFetchedAssets:withProcessingTask:andProgressReporter:]( self,  "_processFetchedAssets:withProcessingTask:andProgressReporter:",  v41,  v70,  v64,  v61);
          BOOL v53 = v59 != 0;
          if (v59) {
            LODWORD(v12) = v59;
          }
        }

        objc_autoreleasePoolPop(v26);
        if (v53) {
          break;
        }
        if (v22 == (id)++v24)
        {
          id v22 = [&off_1001C9168 countByEnumeratingWithState:&v72 objects:v79 count:16];
          if (v22) {
            goto LABEL_12;
          }
          goto LABEL_40;
        }
      }
    }

    else
    {
LABEL_40:
      LODWORD(v12) = 0;
    }
  }

  else
  {
    LODWORD(v12) = 0;
  }

  return (int)v12;
}

- (int)_processLocalIdentifiers:(id)a3 change:(id)a4 insert:(BOOL)a5 withTask:(id)a6
{
  BOOL v46 = a5;
  id v42 = a3;
  id v45 = a4;
  id v47 = a6;
  unint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([v47 photoLibrary]);
  __int128 v11 = (void *)objc_claimAutoreleasedReturnValue( +[PHAsset vcp_fetchOptionsForLibrary:forTaskID:]( &OBJC_CLASS___PHAsset,  "vcp_fetchOptionsForLibrary:forTaskID:",  v10,  3LL));

  uint64_t v43 = v11;
  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue( +[NSSortDescriptor sortDescriptorWithKey:ascending:]( &OBJC_CLASS___NSSortDescriptor,  "sortDescriptorWithKey:ascending:",  @"creationDate",  0LL));
  uint64_t v52 = v12;
  id v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v52, 1LL));
  [v11 setSortDescriptors:v13];

  id v14 = (void *)objc_claimAutoreleasedReturnValue([v42 allObjects]);
  uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue( +[PHAsset fetchAssetsWithLocalIdentifiers:options:]( &OBJC_CLASS___PHAsset,  "fetchAssetsWithLocalIdentifiers:options:",  v14,  v11));

  unint64_t v17 = 0LL;
  os_log_type_t type = VCPLogToOSLogType[6];
  uint64_t v18 = @"inserted";
  if (!v46) {
    uint64_t v18 = @"editted";
  }
  os_log_type_t v41 = v18;
  *(void *)&__int128 v16 = 138412546LL;
  __int128 v40 = v16;
  while (v17 < (unint64_t)objc_msgSend(v15, "count", v40, v41))
  {
    uint64_t v19 = objc_autoreleasePoolPush();
    os_log_type_t v20 = (void *)objc_claimAutoreleasedReturnValue([v15 objectAtIndexedSubscript:v17]);
    BOOL v21 = -[VCPFaceLibraryProcessingTask isCancelled](self, "isCancelled");
    if (v21)
    {
      char v23 = 0;
      int v6 = -128;
      goto LABEL_28;
    }

    if (!v46)
    {
      uint64_t v24 = (void *)objc_claimAutoreleasedReturnValue([v20 objectID]);
      if (([v45 contentOrThumbnailChangedForPHAssetOID:v24] & 1) == 0)
      {
        uint64_t v36 = (void *)objc_claimAutoreleasedReturnValue([v20 objectID]);
        if (![v45 trashedStateChangedForPHAssetOID:v36]
          || ([v20 isTrashed] & 1) != 0)
        {
          uint64_t v37 = (void *)objc_claimAutoreleasedReturnValue([v20 objectID]);
          if (([v45 hiddenStateChangedForPHAssetOID:v37] & 1) == 0)
          {

LABEL_27:
            char v23 = 1;
            goto LABEL_28;
          }

          unsigned __int8 v38 = [v20 isHidden];

          if ((v38 & 1) != 0) {
            goto LABEL_27;
          }
          goto LABEL_10;
        }
      }
    }

- (int)_maintainProcessingStatusWithTask:(id)a3
{
  id v60 = a3;
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue([v60 database]);
  id v61 = 0LL;
  [v4 fetchLocalIdentifiers:&v61 withTaskID:3 andProcessingStatus:1];
  id v58 = v61;

  uint64_t v5 = (char *)[v58 count];
  uint64_t v57 = v5;
  if (!v5) {
    goto LABEL_57;
  }
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([v60 photoLibrary]);
  uint64_t v56 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[PHAsset vcp_fetchOptionsForLibrary:forTaskID:]( &OBJC_CLASS___PHAsset,  "vcp_fetchOptionsForLibrary:forTaskID:",  v7,  3LL));

  os_log_type_t v8 = (void *)objc_claimAutoreleasedReturnValue( +[PHAsset fetchAssetsWithLocalIdentifiers:options:]( &OBJC_CLASS___PHAsset,  "fetchAssetsWithLocalIdentifiers:options:",  v58,  v56));
  unint64_t v9 = 0LL;
  os_log_type_t type = VCPLogToOSLogType[5];
  os_log_type_t v10 = VCPLogToOSLogType[6];
  *(void *)&__int128 v11 = 138412290LL;
  __int128 v55 = v11;
  while (1)
  {
    id v12 = objc_msgSend(v8, "count", v55);
    id v14 = objc_autoreleasePoolPush();
    uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue([v8 objectAtIndexedSubscript:v9]);
    __int128 v16 = (void *)objc_claimAutoreleasedReturnValue([v15 photoLibrary]);
    if (objc_msgSend(v16, "mad_pauseFCPeopleFurtherProcessing"))
    {
      unsigned int v17 = [v15 faceAnalysisVersion];
      else {
        int v18 = 11;
      }
      BOOL v19 = v18 == v17;

      if (v19)
      {
        uint64_t v22 = MediaAnalysisLogLevel(v20, v21);
        if ((int)v22 >= 5)
        {
          uint64_t v24 = VCPLogInstance(v22, v23);
          uint64_t v25 = (os_log_s *)objc_claimAutoreleasedReturnValue(v24);
          if (os_log_type_enabled(v25, type))
          {
            uint64_t v26 = (char *)objc_claimAutoreleasedReturnValue([v15 localIdentifier]);
            *(_DWORD *)buf = v55;
            os_log_type_t v63 = v26;
            _os_log_impl( (void *)&_mh_execute_header,  v25,  type,  "[FaceLibraryProcessing][%@] already with FC version; skip",
              buf,
              0xCu);
          }
        }

        int v27 = 4;
        goto LABEL_17;
      }
    }

    else
    {
    }

    if (objc_msgSend(v15, "vcp_needsFaceProcessing"))
    {
      int v27 = 0;
LABEL_17:
      id v28 = v3;
      goto LABEL_18;
    }

    uint64_t v29 = (void *)objc_claimAutoreleasedReturnValue([v60 database]);
    uint64_t v30 = (void *)objc_claimAutoreleasedReturnValue([v15 localIdentifier]);
    id v31 = [v29 removeProcessingStatusForLocalIdentifier:v30 andTaskID:3];

    if ((_DWORD)v31 == -108 || (_DWORD)v31 == -36)
    {
      id v28 = v31;
    }

    else
    {
      id v28 = v31;
      if ((_DWORD)v31 != -23) {
        id v28 = v3;
      }
    }

    int v27 = 1;
    if ((_DWORD)v31 != -108 && (_DWORD)v31 != -36 && (_DWORD)v31 != -23)
    {
      uint64_t v34 = MediaAnalysisLogLevel(v32, v33);
      if ((int)v34 >= 6)
      {
        uint64_t v36 = VCPLogInstance(v34, v35);
        uint64_t v37 = (os_log_s *)objc_claimAutoreleasedReturnValue(v36);
        if (os_log_type_enabled(v37, v10))
        {
          unsigned __int8 v38 = (char *)objc_claimAutoreleasedReturnValue([v15 localIdentifier]);
          *(_DWORD *)buf = v55;
          os_log_type_t v63 = v38;
          _os_log_impl( (void *)&_mh_execute_header,  v37,  v10,  "[FaceLibraryProcessing][%@] Analysis is up-to-date",  buf,  0xCu);
        }
      }

      int v27 = 0;
      --v57;
    }

- (int)_processLibrary:(id)a3
{
  id v4 = a3;
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue( -[VCPFaceLibraryProcessingTask _processingTaskForPhotoLibrary:]( self,  "_processingTaskForPhotoLibrary:",  v4));
  v38[0] = _NSConcreteStackBlock;
  v38[1] = 3221225472LL;
  v38[2] = sub_1000BCB5C;
  v38[3] = &unk_1001B9E98;
  v38[4] = self;
  uint64_t v6 = objc_retainBlock(v38);
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([v5 photoLibrary]);
  +[VCPAnalysisProgressQuery reportProgressForPhotoLibrary:taskID:logMessage:cancelOrExtendTimeoutBlock:]( &OBJC_CLASS___VCPAnalysisProgressQuery,  "reportProgressForPhotoLibrary:taskID:logMessage:cancelOrExtendTimeoutBlock:",  v7,  3LL,  @"[FaceLibraryProcessing] Before task",  v6);

  os_log_type_t v8 = objc_alloc_init(&OBJC_CLASS___VCPTimeMeasurement);
  -[VCPTimeMeasurement start](v8, "start");
  uint64_t v9 = -[VCPFaceLibraryProcessingTask _maintainProcessingStatusWithTask:]( self,  "_maintainProcessingStatusWithTask:",  v5);
  unsigned int v11 = v9;
  if (!(_DWORD)v9)
  {
    uint64_t v12 = MediaAnalysisLogLevel(v9, v10);
    if ((int)v12 >= 6)
    {
      uint64_t v14 = VCPLogInstance(v12, v13);
      uint64_t v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
      os_log_type_t v16 = VCPLogToOSLogType[6];
      if (os_log_type_enabled(v15, v16))
      {
        unsigned int v17 = (void *)objc_claimAutoreleasedReturnValue([v5 database]);
        unsigned int v18 = [v17 queryAssetCountForTaskID:3];
        *(_DWORD *)buf = 67109120;
        unsigned int v40 = v18;
        _os_log_impl( (void *)&_mh_execute_header,  v15,  v16,  "[FaceLibraryProcessing] Start with %d failed assets",  buf,  8u);
      }
    }

    BOOL v19 = objc_autoreleasePoolPush();
    unsigned int v11 = -[VCPFaceLibraryProcessingTask _analyzeAllAssetsWithTask:](self, "_analyzeAllAssetsWithTask:", v5);
    if (!v11)
    {
      unsigned int v11 = -[VCPFaceLibraryProcessingTask _streamAnalysisWithTask:andProcessingStatus:]( self,  "_streamAnalysisWithTask:andProcessingStatus:",  v5,  2LL);
      if (!v11) {
        unsigned int v11 = -[VCPFaceLibraryProcessingTask _retryFailedAssetsWithTask:](self, "_retryFailedAssetsWithTask:", v5);
      }
    }

    objc_autoreleasePoolPop(v19);
  }

  unsigned int v20 = [v5 flush];
  uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue([v5 database]);
  int v22 = [v21 commit];

  if (v22 != -108 && v22 != -36 && v22 != -23)
  {
    uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue([v5 database]);
    [v23 flush];

    -[VCPTimeMeasurement stop](v8, "stop");
    -[VCPTimeMeasurement elapsedTimeSeconds](v8, "elapsedTimeSeconds");
    uint64_t v25 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"[FaceLibraryProcessing] Checking progress after task (%.2f seconds)",  v24));
    uint64_t v26 = (void *)objc_claimAutoreleasedReturnValue([v5 photoLibrary]);
    +[VCPAnalysisProgressQuery reportProgressForPhotoLibrary:taskID:logMessage:cancelOrExtendTimeoutBlock:]( &OBJC_CLASS___VCPAnalysisProgressQuery,  "reportProgressForPhotoLibrary:taskID:logMessage:cancelOrExtendTimeoutBlock:",  v26,  3LL,  v25,  v6);

    uint64_t v29 = MediaAnalysisLogLevel(v27, v28);
    if ((int)v29 >= 6)
    {
      uint64_t v31 = VCPLogInstance(v29, v30);
      uint64_t v32 = (os_log_s *)objc_claimAutoreleasedReturnValue(v31);
      os_log_type_t v33 = VCPLogToOSLogType[6];
      if (os_log_type_enabled(v32, v33))
      {
        uint64_t v34 = (void *)objc_claimAutoreleasedReturnValue([v5 database]);
        unsigned int v35 = [v34 queryAssetCountForTaskID:3];
        *(_DWORD *)buf = 67109120;
        unsigned int v40 = v35;
        _os_log_impl( (void *)&_mh_execute_header,  v32,  v33,  "[FaceLibraryProcessing] Finished with with %d failed assets",  buf,  8u);
      }
    }

    uint64_t v36 = (void *)objc_claimAutoreleasedReturnValue([v5 database]);
    [v36 cacheCurrentFaceProgress];

    if (v20) {
      int v22 = v20;
    }
    else {
      int v22 = v11;
    }
  }

  return v22;
}

- (int)completeSceneProcessing
{
  id v3 = objc_autoreleasePoolPush();
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472LL;
  v10[2] = sub_1000BCD90;
  v10[3] = &unk_1001BC570;
  v10[4] = self;
  id v4 = objc_retainBlock(v10);
  photoLibraries = self->_photoLibraries;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472LL;
  v9[2] = sub_1000BCE7C;
  v9[3] = &unk_1001B9E98;
  v9[4] = self;
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue( +[VCPMADSceneLibraryProcessingTask taskWithPhotoLibraries:cancelBlock:progressHandler:andCompletionHandler:]( &OBJC_CLASS___VCPMADSceneLibraryProcessingTask,  "taskWithPhotoLibraries:cancelBlock:progressHandler:andCompletionHandler:",  photoLibraries,  v9,  v4,  &stru_1001BCDA8));
  int v7 = [v6 run];

  objc_autoreleasePoolPop(v3);
  return v7;
}

- (BOOL)_readyToProcessProcessLibrary:(id)a3
{
  id v3 = a3;
  id v4 = [v3 isReadyForAnalysis];
  if ((v4 & 1) == 0)
  {
    uint64_t v9 = MediaAnalysisLogLevel(v4, v5);
    if ((int)v9 >= 5)
    {
      uint64_t v11 = VCPLogInstance(v9, v10);
      uint64_t v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
      os_log_type_t v13 = VCPLogToOSLogType[5];
      if (os_log_type_enabled(v12, v13))
      {
        uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue([v3 photoLibraryURL]);
        uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue([v14 path]);
        int v23 = 138412290;
        uint64_t v24 = v15;
        _os_log_impl( (void *)&_mh_execute_header,  v12,  v13,  "[FaceLibraryProcessing] Photo Library is not ready for analysis; skipping library (%@)",
          (uint8_t *)&v23,
          0xCu);
      }

      goto LABEL_10;
    }

- (int)_detectFacesForPhotoLibrary:(id)a3
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
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v9,  v10,  "[FaceLibraryProcessing] Start face detect and feature extraction",  buf,  2u);
    }
  }

  uint64_t v11 = -[VCPFaceLibraryProcessingTask _processLibrary:](self, "_processLibrary:", v4);
  int v13 = v11;
  if ((_DWORD)v11)
  {
    uint64_t v14 = MediaAnalysisLogLevel(v11, v12);
    if ((int)v14 >= 3)
    {
      uint64_t v16 = VCPLogInstance(v14, v15);
      uint64_t v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);
      os_log_type_t v18 = VCPLogToOSLogType[3];
      if (os_log_type_enabled(v17, v18))
      {
        __int16 v26 = 0;
        os_log_type_t v19 = "Finished face detect and feature extraction";
        unsigned int v20 = (uint8_t *)&v26;
LABEL_12:
        _os_log_impl((void *)&_mh_execute_header, v17, v18, v19, v20, 2u);
        goto LABEL_13;
      }

      goto LABEL_13;
    }
  }

  else
  {
    uint64_t v21 = MediaAnalysisLogLevel(v11, v12);
    if ((int)v21 >= 6)
    {
      uint64_t v23 = VCPLogInstance(v21, v22);
      uint64_t v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v23);
      os_log_type_t v18 = VCPLogToOSLogType[6];
      if (os_log_type_enabled(v17, v18))
      {
        __int16 v25 = 0;
        os_log_type_t v19 = "[FaceLibraryProcessing] Finished face detect and feature extraction";
        unsigned int v20 = (uint8_t *)&v25;
        goto LABEL_12;
      }

- (int)_generateAndDetectFaceCropsForPhotoLibrary:(id)a3
{
  id v4 = a3;
  unint64_t v5 = (unint64_t)[v4 countOfFaceCropsToBeGenerated];
  unint64_t v6 = (unint64_t)[v4 countOfUnprocessedFaceCrops];
  uint64_t v8 = MediaAnalysisLogLevel(v6, v7);
  if ((int)v8 >= 6)
  {
    uint64_t v10 = VCPLogInstance(v8, v9);
    uint64_t v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
    os_log_type_t v12 = VCPLogToOSLogType[6];
    if (os_log_type_enabled(v11, v12))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v11,  v12,  "[FaceLibraryProcessing] Start FaceCrop generation and detection",  buf,  2u);
    }
  }

  uint64_t v13 = MediaAnalysisLogLevel(v8, v9);
  if ((int)v13 >= 7)
  {
    uint64_t v15 = VCPLogInstance(v13, v14);
    uint64_t v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(v15);
    os_log_type_t v17 = VCPLogToOSLogType[7];
    if (os_log_type_enabled(v16, v17))
    {
      *(_DWORD *)buf = 134218240;
      *(void *)&uint8_t buf[4] = v5;
      *(_WORD *)&_BYTE buf[12] = 2048;
      *(void *)&buf[14] = v6;
      _os_log_impl( (void *)&_mh_execute_header,  v16,  v17,  "[FaceLibraryProcessing] countOfFaceCropsToBeGenerated: %lu, countOfUnprocessedFaceCrops: %lu",  buf,  0x16u);
    }
  }

  if (v5 | v6)
  {
    os_log_type_t v18 = (void *)objc_claimAutoreleasedReturnValue( -[VCPFaceLibraryProcessingTask _processingTaskForPhotoLibrary:]( self,  "_processingTaskForPhotoLibrary:",  v4));
    *(void *)buf = 0LL;
    *(void *)&buf[8] = buf;
    *(void *)&uint8_t buf[16] = 0x2020000000LL;
    int v52 = 0;
    os_log_type_t v19 = (void *)objc_claimAutoreleasedReturnValue([v18 photoLibrary]);
    id v20 = objc_msgSend(v19, "vcp_supportsInMemoryDownload");

    if (!(_DWORD)v20
      || (uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue([v18 photoLibrary]),
          unsigned int v22 = objc_msgSend(v21, "vcp_allowInMemoryDownload"),
          v21,
          v22))
    {
      [v18 setAllowStreaming:v20];
      uint64_t v43 = _NSConcreteStackBlock;
      uint64_t v44 = 3221225472LL;
      unsigned int v45 = sub_1000BD5A0;
      BOOL v46 = &unk_1001BA030;
      int v48 = buf;
      id v47 = v18;
      __int16 v25 = objc_retainBlock(&v43);
      __int16 v26 = (void *)objc_claimAutoreleasedReturnValue( +[VCPMADQoSManager sharedManager]( &OBJC_CLASS___VCPMADQoSManager,  "sharedManager",  v43,  v44,  v45,  v46));
      [v26 runBlock:v25 withTaskID:3];
    }

    if (*(_DWORD *)(*(void *)&buf[8] + 24LL))
    {
      uint64_t v27 = MediaAnalysisLogLevel(v23, v24);
      if ((int)v27 >= 3)
      {
        uint64_t v29 = VCPLogInstance(v27, v28);
        uint64_t v30 = (os_log_s *)objc_claimAutoreleasedReturnValue(v29);
        os_log_type_t v31 = VCPLogToOSLogType[3];
        if (os_log_type_enabled(v30, v31))
        {
          int v32 = *(_DWORD *)(*(void *)&buf[8] + 24LL);
          *(_DWORD *)uint64_t v49 = 67109120;
          int v50 = v32;
          os_log_type_t v33 = "[FaceLibraryProcessing] Failed to generate and detect FaceCrops - %d";
          uint64_t v34 = v30;
          os_log_type_t v35 = v31;
          uint32_t v36 = 8;
LABEL_21:
          _os_log_impl((void *)&_mh_execute_header, v34, v35, v33, v49, v36);
          goto LABEL_22;
        }

        goto LABEL_22;
      }
    }

    else
    {
      uint64_t v38 = MediaAnalysisLogLevel(v23, v24);
      if ((int)v38 >= 6)
      {
        uint64_t v40 = VCPLogInstance(v38, v39);
        uint64_t v30 = (os_log_s *)objc_claimAutoreleasedReturnValue(v40);
        os_log_type_t v41 = VCPLogToOSLogType[6];
        if (os_log_type_enabled(v30, v41))
        {
          *(_WORD *)uint64_t v49 = 0;
          os_log_type_t v33 = "[FaceLibraryProcessing] Finished FaceCrop generation and detection";
          uint64_t v34 = v30;
          os_log_type_t v35 = v41;
          uint32_t v36 = 2;
          goto LABEL_21;
        }

- (int)_updateQuickFaceIDModelForPhotoLibrary:(id)a3 withContext:(id)a4 andQuickFaceIDManager:(id)a5
{
  id v7 = a3;
  id v8 = a5;
  v34[0] = _NSConcreteStackBlock;
  v34[1] = 3221225472LL;
  v34[2] = sub_1000BD948;
  v34[3] = &unk_1001B9E98;
  v34[4] = self;
  uint64_t v9 = objc_retainBlock(v34);
  v33[0] = _NSConcreteStackBlock;
  v33[1] = 3221225472LL;
  v33[2] = sub_1000BD950;
  v33[3] = &unk_1001BA0C8;
  v33[4] = self;
  uint64_t v10 = objc_retainBlock(v33);
  uint64_t v12 = MediaAnalysisLogLevel(v10, v11);
  if ((int)v12 >= 6)
  {
    uint64_t v14 = VCPLogInstance(v12, v13);
    uint64_t v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
    os_log_type_t v16 = VCPLogToOSLogType[6];
    if (os_log_type_enabled(v15, v16))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v15,  v16,  "[FaceLibraryProcessing] Start QuickFaceID model update",  buf,  2u);
    }
  }

  id v17 = [v8 generateVIPModelWithType:0 ignoreLastGenerationTime:0 evaluationMode:0 allowUnverifiedPerson:0 modelGenerated:&v32 extendTi meout:v10 andCancel:v9];
  int v19 = (int)v17;
  if (!(_DWORD)v17)
  {
    if (v32)
    {
      id v20 = (void *)objc_claimAutoreleasedReturnValue( +[VCPMADCoreAnalyticsManager sharedManager]( &OBJC_CLASS___VCPMADCoreAnalyticsManager,  "sharedManager"));
      [v20 accumulateInt64Value:1 forField:@"PeopleVIPGenerated" andEvent:@"com.apple.mediaanalysisd.FaceAnalysisRunSession"];
    }

    id v17 = [v8 generateVIPModelWithType:1 ignoreLastGenerationTime:0 evaluationMode:0 allowUnverifiedPerson:0 modelGenerated:&v32 extend Timeout:v10 andCancel:v9];
    int v19 = (int)v17;
    if (!(_DWORD)v17)
    {
      if (v32)
      {
        uint64_t v27 = (void *)objc_claimAutoreleasedReturnValue( +[VCPMADCoreAnalyticsManager sharedManager]( &OBJC_CLASS___VCPMADCoreAnalyticsManager,  "sharedManager"));
        [v27 accumulateInt64Value:1 forField:@"PetsVIPGenerated" andEvent:@"com.apple.mediaanalysisd.FaceAnalysisRunSession"];
      }

      id v17 = objc_msgSend(v7, "mad_useVUGallery");
      if ((v17 & 1) != 0 || (id v17 = [v8 classifyVIPPets], (v19 = (int)v17) == 0))
      {
        uint64_t v28 = MediaAnalysisLogLevel(v17, v18);
        if ((int)v28 < 6)
        {
          int v19 = 0;
          goto LABEL_13;
        }

        uint64_t v30 = VCPLogInstance(v28, v29);
        uint64_t v24 = (os_log_s *)objc_claimAutoreleasedReturnValue(v30);
        os_log_type_t v31 = VCPLogToOSLogType[6];
        if (os_log_type_enabled(v24, v31))
        {
          *(_WORD *)buf = 0;
          _os_log_impl( (void *)&_mh_execute_header,  v24,  v31,  "[FaceLibraryProcessing] Finished QuickFaceID model update",  buf,  2u);
        }

        int v19 = 0;
        goto LABEL_12;
      }
    }
  }

  uint64_t v21 = MediaAnalysisLogLevel(v17, v18);
  if ((int)v21 >= 3)
  {
    uint64_t v23 = VCPLogInstance(v21, v22);
    uint64_t v24 = (os_log_s *)objc_claimAutoreleasedReturnValue(v23);
    os_log_type_t v25 = VCPLogToOSLogType[3];
    if (os_log_type_enabled(v24, v25))
    {
      *(_DWORD *)buf = 67109120;
      int v36 = v19;
      _os_log_impl( (void *)&_mh_execute_header,  v24,  v25,  "[FaceLibraryProcessing] Failed to update QuickFaceID model - %d",  buf,  8u);
    }

- (int)_clusterFacesWithClusterer:(id)a3
{
  uint64_t v36 = 0LL;
  int v37 = &v36;
  uint64_t v38 = 0x2020000000LL;
  int v39 = 0;
  uint64_t v30 = _NSConcreteStackBlock;
  uint64_t v31 = 3221225472LL;
  char v32 = sub_1000BDC80;
  os_log_type_t v33 = &unk_1001BA030;
  os_log_type_t v35 = &v36;
  id v3 = a3;
  id v34 = v3;
  id v4 = objc_retainBlock(&v30);
  uint64_t v6 = MediaAnalysisLogLevel(v4, v5);
  if ((int)v6 >= 6)
  {
    uint64_t v8 = VCPLogInstance(v6, v7);
    uint64_t v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
    os_log_type_t v10 = VCPLogToOSLogType[6];
    if (os_log_type_enabled(v9, v10))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v9, v10, "[FaceLibraryProcessing]  Start face clustering", buf, 2u);
    }
  }

  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(+[VCPMADQoSManager sharedManager](&OBJC_CLASS___VCPMADQoSManager, "sharedManager", v30, v31, v32, v33));
  [v11 runBlock:v4 withTaskID:3];

  if (*((_DWORD *)v37 + 6))
  {
    uint64_t v14 = MediaAnalysisLogLevel(v12, v13);
    if ((int)v14 >= 3)
    {
      uint64_t v16 = VCPLogInstance(v14, v15);
      id v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);
      os_log_type_t v18 = VCPLogToOSLogType[3];
      if (os_log_type_enabled(v17, v18))
      {
        int v19 = *((_DWORD *)v37 + 6);
        *(_DWORD *)buf = 67109120;
        int v41 = v19;
        id v20 = "[FaceLibraryProcessing] Failed to cluster faces - %d";
        uint64_t v21 = v17;
        os_log_type_t v22 = v18;
        uint32_t v23 = 8;
LABEL_12:
        _os_log_impl((void *)&_mh_execute_header, v21, v22, v20, buf, v23);
        goto LABEL_13;
      }

      goto LABEL_13;
    }
  }

  else
  {
    uint64_t v24 = MediaAnalysisLogLevel(v12, v13);
    if ((int)v24 >= 6)
    {
      uint64_t v26 = VCPLogInstance(v24, v25);
      id v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v26);
      os_log_type_t v27 = VCPLogToOSLogType[6];
      if (os_log_type_enabled(v17, v27))
      {
        *(_WORD *)buf = 0;
        id v20 = "[FaceLibraryProcessing] Finished face clustering";
        uint64_t v21 = v17;
        os_log_type_t v22 = v27;
        uint32_t v23 = 2;
        goto LABEL_12;
      }

- (int)_buildPersonsForPhotoLibrary:(id)a3 withClusterer:(id)a4 andContext:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v53[0] = _NSConcreteStackBlock;
  v53[1] = 3221225472LL;
  v53[2] = sub_1000BE0AC;
  v53[3] = &unk_1001B9E98;
  uint8_t v53[4] = self;
  uint64_t v11 = objc_retainBlock(v53);
  uint64_t v49 = 0LL;
  int v50 = &v49;
  uint64_t v51 = 0x2020000000LL;
  int v52 = 0;
  v42[0] = _NSConcreteStackBlock;
  v42[1] = 3221225472LL;
  v42[2] = sub_1000BE0B4;
  v42[3] = &unk_1001BCDF0;
  int v48 = &v49;
  id v12 = v8;
  id v43 = v12;
  id v13 = v9;
  id v44 = v13;
  id v14 = v10;
  id v45 = v14;
  BOOL v46 = &stru_1001BCDC8;
  uint64_t v15 = v11;
  id v47 = v15;
  uint64_t v16 = objc_retainBlock(v42);
  uint64_t v18 = MediaAnalysisLogLevel(v16, v17);
  if ((int)v18 >= 6)
  {
    uint64_t v20 = VCPLogInstance(v18, v19);
    uint64_t v21 = (os_log_s *)objc_claimAutoreleasedReturnValue(v20);
    os_log_type_t v22 = VCPLogToOSLogType[6];
    if (os_log_type_enabled(v21, v22))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v21, v22, "[FaceLibraryProcessing] Start person building", buf, 2u);
    }
  }

  uint32_t v23 = (void *)objc_claimAutoreleasedReturnValue(+[VCPMADQoSManager sharedManager](&OBJC_CLASS___VCPMADQoSManager, "sharedManager"));
  [v23 runBlock:v16 withTaskID:3];

  if (*((_DWORD *)v50 + 6))
  {
    uint64_t v26 = MediaAnalysisLogLevel(v24, v25);
    if ((int)v26 >= 6)
    {
      uint64_t v28 = VCPLogInstance(v26, v27);
      uint64_t v29 = (os_log_s *)objc_claimAutoreleasedReturnValue(v28);
      os_log_type_t v30 = VCPLogToOSLogType[6];
      if (os_log_type_enabled(v29, v30))
      {
        int v31 = *((_DWORD *)v50 + 6);
        *(_DWORD *)buf = 67109120;
        int v55 = v31;
        char v32 = "[FaceLibraryProcessing] Failed to build persons - %d";
        os_log_type_t v33 = v29;
        os_log_type_t v34 = v30;
        uint32_t v35 = 8;
LABEL_12:
        _os_log_impl((void *)&_mh_execute_header, v33, v34, v32, buf, v35);
        goto LABEL_13;
      }

      goto LABEL_13;
    }
  }

  else
  {
    uint64_t v36 = MediaAnalysisLogLevel(v24, v25);
    if ((int)v36 >= 6)
    {
      uint64_t v38 = VCPLogInstance(v36, v37);
      uint64_t v29 = (os_log_s *)objc_claimAutoreleasedReturnValue(v38);
      os_log_type_t v39 = VCPLogToOSLogType[6];
      if (os_log_type_enabled(v29, v39))
      {
        *(_WORD *)buf = 0;
        char v32 = "[FaceLibraryProcessing] Finished person building";
        os_log_type_t v33 = v29;
        os_log_type_t v34 = v39;
        uint32_t v35 = 2;
        goto LABEL_12;
      }

- (int)_clusterAndProcessPersonsForPhotoLibrary:(id)a3 withContext:(id)a4 progressMade:(BOOL *)a5
{
  id v8 = a3;
  id v9 = a4;
  v61[0] = _NSConcreteStackBlock;
  v61[1] = 3221225472LL;
  v61[2] = sub_1000BE6E4;
  v61[3] = &unk_1001B9E98;
  v61[4] = self;
  id v10 = objc_retainBlock(v61);
  *a5 = 0;
  uint64_t v12 = MediaAnalysisLogLevel(v10, v11);
  if ((int)v12 >= 6)
  {
    uint64_t v14 = VCPLogInstance(v12, v13);
    uint64_t v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
    os_log_type_t v16 = VCPLogToOSLogType[6];
    if (os_log_type_enabled(v15, v16))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v15,  v16,  "[FaceLibraryProcessing] Started face clustering and person workflow",  buf,  2u);
    }
  }

  if ((self->_subtasks & 0x10) != 0)
  {
    id v41 = objc_msgSend(v8, "mad_countOfUnclusteredFaces");
    uint64_t v43 = MediaAnalysisLogLevel(v41, v42);
    if ((int)v43 >= 7)
    {
      uint64_t v45 = VCPLogInstance(v43, v44);
      BOOL v46 = (os_log_s *)objc_claimAutoreleasedReturnValue(v45);
      os_log_type_t v47 = VCPLogToOSLogType[7];
      if (os_log_type_enabled(v46, v47))
      {
        *(_DWORD *)buf = 134217984;
        id v63 = v41;
        _os_log_impl( (void *)&_mh_execute_header,  v46,  v47,  "[FaceLibraryProcessing] countOfUnclusteredFaces (before): %lu",  buf,  0xCu);
      }
    }

    uint64_t v20 = -[VCPFaceLibraryProcessingTask isCancelled](self, "isCancelled");
    if ((v20 & 1) != 0)
    {
      uint64_t v17 = 0LL;
LABEL_43:
      int v25 = -128;
      goto LABEL_44;
    }

    int v52 = -[VCPFaceClusterer initWithPhotoLibrary:context:cancelOrExtendTimeoutBlock:]( objc_alloc(&OBJC_CLASS___VCPFaceClusterer),  "initWithPhotoLibrary:context:cancelOrExtendTimeoutBlock:",  v8,  v9,  v10);
    uint64_t v17 = v52;
    if (v41 || -[VCPFaceClusterer clustererState](v52, "clustererState") != (id)40)
    {
      uint64_t v20 = -[VCPFaceLibraryProcessingTask _clusterFacesWithClusterer:](self, "_clusterFacesWithClusterer:", v17);
      int v25 = v20;
      if ((_DWORD)v20) {
        goto LABEL_44;
      }
    }

    id v53 = objc_msgSend(v8, "mad_countOfUnclusteredFaces");
    uint64_t v55 = MediaAnalysisLogLevel(v53, v54);
    if ((int)v55 >= 7)
    {
      uint64_t v57 = VCPLogInstance(v55, v56);
      id v58 = (os_log_s *)objc_claimAutoreleasedReturnValue(v57);
      os_log_type_t v59 = VCPLogToOSLogType[7];
      if (os_log_type_enabled(v58, v59))
      {
        *(_DWORD *)buf = 134217984;
        id v63 = v53;
        _os_log_impl( (void *)&_mh_execute_header,  v58,  v59,  "[FaceLibraryProcessing] countOfUnclusteredFaces (after): %lu",  buf,  0xCu);
      }
    }

    *a5 = v41 != v53;
  }

  else
  {
    uint64_t v17 = 0LL;
  }

  id v18 = [v8 countOfDirtyFaceGroups];
  uint64_t v20 = MediaAnalysisLogLevel(v18, v19);
  if ((int)v20 >= 7)
  {
    uint64_t v22 = VCPLogInstance(v20, v21);
    uint32_t v23 = (os_log_s *)objc_claimAutoreleasedReturnValue(v22);
    os_log_type_t v24 = VCPLogToOSLogType[7];
    if (os_log_type_enabled(v23, v24))
    {
      *(_DWORD *)buf = 134217984;
      id v63 = v18;
      _os_log_impl( (void *)&_mh_execute_header,  v23,  v24,  "[FaceLibraryProcessing] countOfDirtyFaceGroups (before): %lu",  buf,  0xCu);
    }
  }

  if (!v18) {
    goto LABEL_33;
  }
  uint64_t v20 = -[VCPFaceLibraryProcessingTask isCancelled](self, "isCancelled");
  if ((v20 & 1) != 0) {
    goto LABEL_43;
  }
  if (!v17) {
    uint64_t v17 = -[VCPFaceClusterer initWithPhotoLibrary:context:cancelOrExtendTimeoutBlock:]( objc_alloc(&OBJC_CLASS___VCPFaceClusterer),  "initWithPhotoLibrary:context:cancelOrExtendTimeoutBlock:",  v8,  v9,  v10);
  }
  uint64_t v20 = -[VCPFaceLibraryProcessingTask isCancelled](self, "isCancelled");
  if ((v20 & 1) != 0) {
    goto LABEL_43;
  }
  if ((self->_subtasks & 0x20) != 0)
  {
    uint64_t v20 = -[VCPFaceLibraryProcessingTask _buildPersonsForPhotoLibrary:withClusterer:andContext:]( self,  "_buildPersonsForPhotoLibrary:withClusterer:andContext:",  v8,  v17,  v9);
    int v25 = v20;
    if ((_DWORD)v20) {
      goto LABEL_44;
    }
    id v26 = [v8 countOfDirtyFaceGroups];
    uint64_t v28 = MediaAnalysisLogLevel(v26, v27);
    if ((int)v28 >= 7)
    {
      uint64_t v30 = VCPLogInstance(v28, v29);
      int v31 = (os_log_s *)objc_claimAutoreleasedReturnValue(v30);
      os_log_type_t v32 = VCPLogToOSLogType[7];
      if (os_log_type_enabled(v31, v32))
      {
        *(_DWORD *)buf = 134217984;
        id v63 = v26;
        _os_log_impl( (void *)&_mh_execute_header,  v31,  v32,  "[FaceLibraryProcessing] countOfDirtyFaceGroups (after): %lu",  buf,  0xCu);
      }
    }

    BOOL v34 = *a5 || v18 != v26;
    *a5 = v34;
  }

  uint64_t v20 = -[VCPFaceLibraryProcessingTask isCancelled](self, "isCancelled");
  if ((v20 & 1) != 0) {
    goto LABEL_43;
  }
  if ((self->_subtasks & 0x40) == 0
    || !*a5
    || (uint32_t v35 = (void *)objc_claimAutoreleasedReturnValue( -[VCPFaceLibraryProcessingTask _processingTaskForPhotoLibrary:]( self,  "_processingTaskForPhotoLibrary:",  v8)),  v25 = [v35 promotePersons],  v35,  !v25))
  {
LABEL_33:
    uint64_t v36 = MediaAnalysisLogLevel(v20, v21);
    if ((int)v36 < 6)
    {
      int v25 = 0;
      goto LABEL_57;
    }

    uint64_t v38 = VCPLogInstance(v36, v37);
    os_log_type_t v39 = (os_log_s *)objc_claimAutoreleasedReturnValue(v38);
    os_log_type_t v40 = VCPLogToOSLogType[6];
    if (os_log_type_enabled(v39, v40))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v39,  v40,  "[FaceLibraryProcessing] Finished face clustering and person workflow",  buf,  2u);
    }

    int v25 = 0;
    goto LABEL_47;
  }

- (int)_processAutoCounterForPhotoLibrary:(id)a3
{
  id v4 = a3;
  int v5 = _os_feature_enabled_impl("Photos", "PersonAutoCounter");
  if ([v4 isSystemPhotoLibrary] & v5) == 1 && (VCPMAIsAppleInternal())
  {
    v108[0] = _NSConcreteStackBlock;
    v108[1] = 3221225472LL;
    v108[2] = sub_1000BF26C;
    v108[3] = &unk_1001B9E98;
    v108[4] = self;
    v99 = objc_retainBlock(v108);
    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue( -[NSDictionary objectForKeyedSubscript:]( self->_options,  "objectForKeyedSubscript:",  @"SkipAutoCounters"));
    if (v6)
    {
      uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue( -[NSDictionary objectForKeyedSubscript:]( self->_options,  "objectForKeyedSubscript:",  @"SkipAutoCounters"));
      BOOL v8 = [v7 integerValue] == (id)1;
    }

    else
    {
      BOOL v8 = 0;
    }

    uint64_t v12 = MediaAnalysisLogLevel(v10, v11);
    if ((int)v12 >= 7)
    {
      uint64_t v14 = VCPLogInstance(v12, v13);
      uint64_t v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
      os_log_type_t v16 = VCPLogToOSLogType[7];
      if (os_log_type_enabled(v15, v16))
      {
        uint64_t v17 = @"NO";
        if (v8) {
          uint64_t v17 = @"YES";
        }
        *(_DWORD *)buf = 138412546;
        v110 = @"[FaceLibraryProcessing][AutoCounter]";
        __int16 v111 = 2112;
        uint64_t v112 = (uint64_t)v17;
        _os_log_impl((void *)&_mh_execute_header, v15, v16, "%@ Skipping - %@", buf, 0x16u);
      }
    }

    if (v8)
    {
      int v9 = 0;
LABEL_73:

      goto LABEL_74;
    }

    v107[0] = _NSConcreteStackBlock;
    v107[1] = 3221225472LL;
    v107[2] = sub_1000BF274;
    v107[3] = &unk_1001B9E98;
    v107[4] = self;
    v98 = objc_retainBlock(v107);
    id v106 = 0LL;
    +[VCPAnalysisProgressQuery queryProgressDetail:photoLibrary:taskID:cancelOrExtendTimeoutBlock:]( &OBJC_CLASS___VCPAnalysisProgressQuery,  "queryProgressDetail:photoLibrary:taskID:cancelOrExtendTimeoutBlock:",  &v106,  v4,  3LL,  v98);
    id v18 = v106;
    uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue([v18 objectForKeyedSubscript:VCPAnalysisCountTotalAllowedKey]);
    uint64_t v20 = (uint64_t)[v19 integerValue];

    uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue([v18 objectForKeyedSubscript:VCPAnalysisCountProcessedKey]);
    id v22 = [v21 integerValue];

    uint32_t v23 = (void *)objc_claimAutoreleasedReturnValue([v18 objectForKeyedSubscript:VCPAnalysisCountFailedKey]);
    id v24 = [v23 integerValue];

    if (v20 < 1)
    {
      BOOL v28 = 0LL;
      BOOL v27 = 0LL;
      BOOL v29 = 0LL;
      BOOL v30 = 0LL;
      BOOL v31 = 0;
      if (!v20) {
        goto LABEL_19;
      }
    }

    else
    {
      BOOL v27 = 100 * ((uint64_t)v22 + (uint64_t)v24) / v20 > 98;
      BOOL v28 = 100 * (uint64_t)v24 / v20 > 5;
    }

    BOOL v31 = v27 && !v28;
    BOOL v29 = v28;
    BOOL v30 = v27;
LABEL_19:
    uint64_t v32 = MediaAnalysisLogLevel(v25, v26);
    if ((int)v32 >= 7)
    {
      uint64_t v34 = VCPLogInstance(v32, v33);
      uint32_t v35 = (os_log_s *)objc_claimAutoreleasedReturnValue(v34);
      os_log_type_t v36 = VCPLogToOSLogType[7];
      if (os_log_type_enabled(v35, v36))
      {
        *(_DWORD *)buf = 138413058;
        v110 = @"[FaceLibraryProcessing][AutoCounter]";
        __int16 v111 = 2048;
        uint64_t v112 = v20;
        __int16 v113 = 2048;
        id v114 = v22;
        __int16 v115 = 2048;
        id v116 = v24;
        _os_log_impl( (void *)&_mh_execute_header,  v35,  v36,  "%@ Progress: totalCount = %ld, processed = %ld, failed = %ld",  buf,  0x2Au);
      }
    }

    uint64_t v37 = MediaAnalysisLogLevel(v32, v33);
    if ((int)v37 >= 7)
    {
      uint64_t v39 = VCPLogInstance(v37, v38);
      os_log_type_t v40 = (os_log_s *)objc_claimAutoreleasedReturnValue(v39);
      os_log_type_t v41 = VCPLogToOSLogType[7];
      if (os_log_type_enabled(v40, v41))
      {
        uint64_t v42 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", v30));
        uint64_t v43 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", v29));
        *(_DWORD *)buf = 138412802;
        v110 = @"[FaceLibraryProcessing][AutoCounter]";
        __int16 v111 = 2112;
        uint64_t v112 = (uint64_t)v42;
        __int16 v113 = 2112;
        id v114 = v43;
        _os_log_impl( (void *)&_mh_execute_header,  v40,  v41,  "%@ Progress: isFaceProcessingDone = %@, tooManyFailed = %@",  buf,  0x20u);
      }
    }

    if (!v31)
    {
      int v9 = 0;
LABEL_72:

      goto LABEL_73;
    }

    uint64_t v44 = (void *)objc_claimAutoreleasedReturnValue( +[VCPPhotosAutoCounterWorker workerWithPhotoLibrary:]( &OBJC_CLASS___VCPPhotosAutoCounterWorker,  "workerWithPhotoLibrary:",  v4));
    id v45 = [v44 optInPersonCount];
    uint64_t v47 = MediaAnalysisLogLevel(v45, v46);
    if ((int)v47 >= 7)
    {
      uint64_t v49 = VCPLogInstance(v47, v48);
      uint64_t v50 = (os_log_s *)objc_claimAutoreleasedReturnValue(v49);
      os_log_type_t v51 = VCPLogToOSLogType[7];
      if (os_log_type_enabled(v50, v51))
      {
        *(_DWORD *)buf = 138412546;
        v110 = @"[FaceLibraryProcessing][AutoCounter]";
        __int16 v111 = 2048;
        uint64_t v112 = (uint64_t)v45;
        _os_log_impl((void *)&_mh_execute_header, v50, v51, "%@ Opt-in person count - %lu", buf, 0x16u);
      }
    }

    if (!v45)
    {
      int v9 = 0;
LABEL_71:

      goto LABEL_72;
    }

    if (objc_msgSend(v4, "mad_useVUGallery"))
    {
      uint64_t v104 = 0LL;
      uint64_t v105 = 0LL;
      int v52 = (id *)&v104;
      id v53 = (id *)&v105;
      unsigned int v54 = [v44 exportVUGalleryClusterStates:&v105 error:&v104 extendTimeoutBlock:&stru_1001BCE10 cancelBlock:v99];
    }

    else
    {
      uint64_t v102 = 0LL;
      uint64_t v103 = 0LL;
      int v52 = (id *)&v102;
      id v53 = (id *)&v103;
      unsigned int v54 = [v44 exportClustersStates:&v103 error:&v102 extendTimeoutBlock:&stru_1001BCE10 cancelBlock:v99];
    }

    unsigned int v55 = v54;
    id v56 = *v53;
    id v57 = *v52;
    os_log_type_t v59 = v57;
    if (v55)
    {
      uint64_t v60 = MediaAnalysisLogLevel(v57, v58);
      if ((int)v60 < 3)
      {
        int v9 = 0;
LABEL_70:

        goto LABEL_71;
      }

      uint64_t v62 = VCPLogInstance(v60, v61);
      id v63 = (os_log_s *)objc_claimAutoreleasedReturnValue(v62);
      os_log_type_t v64 = VCPLogToOSLogType[3];
      if (os_log_type_enabled(v63, v64))
      {
        *(_DWORD *)buf = 138412546;
        v110 = @"[FaceLibraryProcessing][AutoCounter]";
        __int16 v111 = 2112;
        uint64_t v112 = (uint64_t)v59;
        _os_log_impl((void *)&_mh_execute_header, v63, v64, "%@ Failed to export cluster state - %@", buf, 0x16u);
      }

      goto LABEL_68;
    }

    uint64_t v65 = MediaAnalysisLogLevel(v57, v58);
    if ((int)v65 >= 6)
    {
      uint64_t v67 = VCPLogInstance(v65, v66);
      uint64_t v68 = (os_log_s *)objc_claimAutoreleasedReturnValue(v67);
      os_log_type_t v69 = VCPLogToOSLogType[6];
      if (os_log_type_enabled(v68, v69))
      {
        *(_DWORD *)buf = 138412546;
        v110 = @"[FaceLibraryProcessing][AutoCounter]";
        __int16 v111 = 2112;
        uint64_t v112 = (uint64_t)v56;
        _os_log_impl((void *)&_mh_execute_header, v68, v69, "%@ Exported cluster state to %@", buf, 0x16u);
      }
    }

    id v101 = 0LL;
    VCPFetchPersonPromoterClusterForEvaluation(v4, &v101, &stru_1001BCE10, v99);
    id v63 = (os_log_s *)v101;
    id v70 = [v44 calculateAndReportClusterAccuracyWithVisionClusterURL:v56 andPersonClusters:v63 results:0 extendTimeoutBlock:&stru_1001BCE10 cancelBlock:v99];
    int v72 = (int)v70;
    if ((_DWORD)v70)
    {
      uint64_t v73 = MediaAnalysisLogLevel(v70, v71);
      if ((int)v73 < 3)
      {
LABEL_68:
        int v9 = 0;
LABEL_69:

        goto LABEL_70;
      }

      uint64_t v75 = VCPLogInstance(v73, v74);
      v76 = (os_log_s *)objc_claimAutoreleasedReturnValue(v75);
      os_log_type_t v77 = VCPLogToOSLogType[3];
      if (os_log_type_enabled(v76, v77))
      {
        *(_DWORD *)buf = 138412546;
        v110 = @"[FaceLibraryProcessing][AutoCounter]";
        __int16 v111 = 1024;
        LODWORD(v112) = v72;
        _os_log_impl((void *)&_mh_execute_header, v76, v77, "%@ Failed to process cluster state (%d)", buf, 0x12u);
      }
    }

    else
    {
      uint64_t v78 = MediaAnalysisLogLevel(v70, v71);
      if ((int)v78 >= 7)
      {
        uint64_t v80 = VCPLogInstance(v78, v79);
        __int16 v81 = (os_log_s *)objc_claimAutoreleasedReturnValue(v80);
        os_log_type_t v82 = VCPLogToOSLogType[7];
        if (os_log_type_enabled(v81, v82))
        {
          *(_DWORD *)buf = 138412290;
          v110 = @"[FaceLibraryProcessing][AutoCounter]";
          _os_log_impl( (void *)&_mh_execute_header,  v81,  v82,  "%@ Successfully calculate and report AutoCounter",  buf,  0xCu);
        }
      }

      v76 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[VCPFaceProcessingVersionManager sharedManagerForPhotoLibrary:]( &OBJC_CLASS___VCPFaceProcessingVersionManager,  "sharedManagerForPhotoLibrary:",  v4));
      if ((int)-[os_log_s currentProcessingVersion](v76, "currentProcessingVersion") <= 14)
      {
        id v100 = 0LL;
        int v9 = objc_msgSend(v4, "vcp_bumpFaceProcessingToVersion:withError:", 15, &v100);
        id v83 = v100;
        __int16 v85 = v83;
        if (v9)
        {
          uint64_t v86 = MediaAnalysisLogLevel(v83, v84);
          if ((int)v86 >= 3)
          {
            uint64_t v88 = VCPLogInstance(v86, v87);
            v89 = (os_log_s *)objc_claimAutoreleasedReturnValue(v88);
            os_log_type_t v90 = VCPLogToOSLogType[3];
            log = v89;
            if (os_log_type_enabled(v89, v90))
            {
              *(_DWORD *)buf = 138412546;
              v110 = @"[FaceLibraryProcessing][AutoCounter]";
              __int16 v111 = 2112;
              uint64_t v112 = (uint64_t)v85;
              _os_log_impl( (void *)&_mh_execute_header,  log,  v90,  "%@ Failed to bump face processing version - %@",  buf,  0x16u);
            }
          }

          goto LABEL_69;
        }

        uint64_t v91 = MediaAnalysisLogLevel(v83, v84);
        if ((int)v91 >= 7)
        {
          uint64_t v93 = VCPLogInstance(v91, v92);
          v94 = (os_log_s *)objc_claimAutoreleasedReturnValue(v93);
          os_log_type_t v95 = VCPLogToOSLogType[7];
          if (os_log_type_enabled(v94, v95))
          {
            *(_DWORD *)buf = 138412290;
            v110 = @"[FaceLibraryProcessing][AutoCounter]";
            _os_log_impl( (void *)&_mh_execute_header,  v94,  v95,  "%@ Successfully bumpped face processing version",  buf,  0xCu);
          }
        }
      }
    }

    goto LABEL_68;
  }

  int v9 = 0;
LABEL_74:

  return v9;
}

- (int)runLegacyProcessingForPhotoLibrary:(id)a3 progressHandler:(id)a4
{
  id v6 = a3;
  id v43 = a4;
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue( +[VCPPhotosFaceProcessingContext contextWithPhotoLibrary:]( &OBJC_CLASS___VCPPhotosFaceProcessingContext,  "contextWithPhotoLibrary:",  v6));
  v46[0] = _NSConcreteStackBlock;
  v46[1] = 3221225472LL;
  v46[2] = sub_1000BF8D8;
  v46[3] = &unk_1001B9E98;
  v46[4] = self;
  uint64_t v42 = objc_retainBlock(v46);
  v45[0] = _NSConcreteStackBlock;
  v45[1] = 3221225472LL;
  v45[2] = sub_1000BF8E0;
  v45[3] = &unk_1001BA0C8;
  v45[4] = self;
  BOOL v8 = objc_retainBlock(v45);
  if ((self->_subtasks & 2) != 0)
  {
    int v9 = -[VCPFaceLibraryProcessingTask _detectFacesForPhotoLibrary:](self, "_detectFacesForPhotoLibrary:", v6);
    if (v9) {
      goto LABEL_44;
    }
  }

  if (objc_msgSend(v6, "vcp_isSyndicationLibrary"))
  {
    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue( +[VCPDefaultPhotoLibraryManager sharedManager]( &OBJC_CLASS___VCPDefaultPhotoLibraryManager,  "sharedManager"));
    uint64_t v11 = (VCPPhotosQuickFaceIdentificationManager *)objc_claimAutoreleasedReturnValue([v10 defaultPhotoLibrary]);

    uint64_t v12 = -[VCPPhotosQuickFaceIdentificationManager initWithPhotoLibrary:]( objc_alloc(&OBJC_CLASS___VCPPhotosQuickFaceIdentificationManager),  "initWithPhotoLibrary:",  v11);
    v44[0] = _NSConcreteStackBlock;
    v44[1] = 3221225472LL;
    v44[2] = sub_1000BF94C;
    v44[3] = &unk_1001B9E98;
    v44[4] = self;
    id v13 = -[VCPPhotosQuickFaceIdentificationManager personIdentificationForSyndicationPhotoLibrary:withCancelOrExtendTimeoutBlock:]( v12,  "personIdentificationForSyndicationPhotoLibrary:withCancelOrExtendTimeoutBlock:",  v6,  v44);
    uint64_t v15 = MediaAnalysisLogLevel(v13, v14);
    if ((int)v15 >= 7)
    {
      uint64_t v17 = VCPLogInstance(v15, v16);
      id v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(v17);
      os_log_type_t v19 = VCPLogToOSLogType[7];
      if (os_log_type_enabled(v18, v19))
      {
        uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue([v6 photoLibraryURL]);
        uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue([v20 path]);
        *(_DWORD *)buf = 138412290;
        uint64_t v48 = v21;
        _os_log_impl( (void *)&_mh_execute_header,  v18,  v19,  "[FaceLibraryProcessing] Skipping clustering and person processing for syndication library (%@)",  buf,  0xCu);
      }
    }

    goto LABEL_41;
  }

  unint64_t subtasks = self->_subtasks;
  if ((subtasks & 8) != 0)
  {
    uint32_t v23 = -[VCPPhotosQuickFaceIdentificationManager initWithPhotoLibrary:]( objc_alloc(&OBJC_CLASS___VCPPhotosQuickFaceIdentificationManager),  "initWithPhotoLibrary:",  v6);
    id v24 = (void *)objc_claimAutoreleasedReturnValue( -[VCPPhotosQuickFaceIdentificationManager fetchEntityForModelType:evaluationMode:allowUnverifiedPerson:]( v23,  "fetchEntityForModelType:evaluationMode:allowUnverifiedPerson:",  0LL,  0LL,  0LL));
    uint64_t v41 = (uint64_t)[v24 count];

    int v9 = -[VCPFaceLibraryProcessingTask _updateQuickFaceIDModelForPhotoLibrary:withContext:andQuickFaceIDManager:]( self,  "_updateQuickFaceIDModelForPhotoLibrary:withContext:andQuickFaceIDManager:",  v6,  v7,  v23);
    if (v9)
    {
      uint64_t v11 = v23;
      goto LABEL_43;
    }

    uint64_t v11 = v23;
    if ((self->_subtasks & 0x40) == 0) {
      goto LABEL_16;
    }
LABEL_14:
    if ((MADPersonPromoterHasProcessedForLibrary(v6) & 1) == 0)
    {
      uint64_t v25 = (void *)objc_claimAutoreleasedReturnValue( -[VCPFaceLibraryProcessingTask _processingTaskForPhotoLibrary:]( self,  "_processingTaskForPhotoLibrary:",  v6));
      int v9 = [v25 promotePersons];

      if (v9) {
        goto LABEL_43;
      }
    }

    goto LABEL_16;
  }

  uint64_t v11 = 0LL;
  uint64_t v41 = -1LL;
  if ((subtasks & 0x40) != 0) {
    goto LABEL_14;
  }
LABEL_16:
  uint64_t v12 = (VCPPhotosQuickFaceIdentificationManager *)objc_claimAutoreleasedReturnValue( +[VCPProgressReporter reporterWithIntervalSeconds:andTotalJobCount:andBlock:]( &OBJC_CLASS___VCPProgressReporter,  "reporterWithIntervalSeconds:andTotalJobCount:andBlock:",  10LL,  1LL,  v43));
  int v9 = 0;
  do
  {
    uint64_t v26 = objc_autoreleasePoolPush();
    buf[0] = 0;
    unint64_t v27 = self->_subtasks;
    if ((v27 & 4) != 0)
    {
      unsigned int v28 = -[VCPFaceLibraryProcessingTask _generateAndDetectFaceCropsForPhotoLibrary:]( self,  "_generateAndDetectFaceCropsForPhotoLibrary:",  v6);
      if (v28) {
        goto LABEL_22;
      }
      unint64_t v27 = self->_subtasks;
    }

    if ((v27 & 0x70) != 0)
    {
      unsigned int v28 = -[VCPFaceLibraryProcessingTask _clusterAndProcessPersonsForPhotoLibrary:withContext:progressMade:]( self,  "_clusterAndProcessPersonsForPhotoLibrary:withContext:progressMade:",  v6,  v7,  buf);
      if (v28)
      {
LABEL_22:
        int v29 = 1;
        int v9 = v28;
        goto LABEL_26;
      }
    }

    if (buf[0])
    {
      int v29 = 0;
    }

    else
    {
      -[VCPPhotosQuickFaceIdentificationManager increaseProcessedJobCountByOne](v12, "increaseProcessedJobCountByOne");
      int v29 = 11;
    }

- (int)runGalleryProcessingForPhotoLibrary:(id)a3 progressHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v42 = (void *)objc_claimAutoreleasedReturnValue( +[VCPPhotosFaceProcessingContext contextWithPhotoLibrary:]( &OBJC_CLASS___VCPPhotosFaceProcessingContext,  "contextWithPhotoLibrary:",  v6));
  v45[0] = _NSConcreteStackBlock;
  v45[1] = 3221225472LL;
  v45[2] = sub_1000BFFA0;
  v45[3] = &unk_1001B9E98;
  v45[4] = self;
  os_log_type_t v40 = objc_retainBlock(v45);
  v44[0] = _NSConcreteStackBlock;
  v44[1] = 3221225472LL;
  v44[2] = sub_1000BFFA8;
  v44[3] = &unk_1001BA0C8;
  v44[4] = self;
  uint64_t v41 = objc_retainBlock(v44);
  if ((self->_subtasks & 2) != 0)
  {
    int v8 = -[VCPFaceLibraryProcessingTask _detectFacesForPhotoLibrary:](self, "_detectFacesForPhotoLibrary:", v6);
    if (v8) {
      goto LABEL_41;
    }
  }

  if (objc_msgSend(v6, "vcp_isSyndicationLibrary")
    && (_os_feature_enabled_impl("MediaAnalysis", "VUSyndicationLibrary") & 1) == 0)
  {
    unsigned int v28 = (void *)objc_claimAutoreleasedReturnValue( +[VCPDefaultPhotoLibraryManager sharedManager]( &OBJC_CLASS___VCPDefaultPhotoLibraryManager,  "sharedManager"));
    int v9 = (VCPPhotosQuickFaceIdentificationManager *)objc_claimAutoreleasedReturnValue([v28 defaultPhotoLibrary]);

    uint64_t v11 = -[VCPPhotosQuickFaceIdentificationManager initWithPhotoLibrary:]( objc_alloc(&OBJC_CLASS___VCPPhotosQuickFaceIdentificationManager),  "initWithPhotoLibrary:",  v9);
    v43[0] = _NSConcreteStackBlock;
    v43[1] = 3221225472LL;
    v43[2] = sub_1000C0014;
    v43[3] = &unk_1001B9E98;
    v43[4] = self;
    id v29 = -[VCPPhotosQuickFaceIdentificationManager personIdentificationForSyndicationPhotoLibrary:withCancelOrExtendTimeoutBlock:]( v11,  "personIdentificationForSyndicationPhotoLibrary:withCancelOrExtendTimeoutBlock:",  v6,  v43);
    uint64_t v31 = MediaAnalysisLogLevel(v29, v30);
    if ((int)v31 >= 7)
    {
      uint64_t v33 = VCPLogInstance(v31, v32);
      uint64_t v34 = (os_log_s *)objc_claimAutoreleasedReturnValue(v33);
      os_log_type_t v35 = VCPLogToOSLogType[7];
      if (os_log_type_enabled(v34, v35))
      {
        uint64_t v36 = (void *)objc_claimAutoreleasedReturnValue([v6 photoLibraryURL]);
        uint64_t v37 = (void *)objc_claimAutoreleasedReturnValue([v36 path]);
        *(_DWORD *)buf = 138412290;
        uint64_t v47 = v37;
        _os_log_impl( (void *)&_mh_execute_header,  v34,  v35,  "[FaceLibraryProcessing] Skipping clustering and person processing for syndication library (%@)",  buf,  0xCu);
      }
    }

    goto LABEL_38;
  }

  if ((self->_subtasks & 8) != 0 && (objc_msgSend(v6, "vcp_isSyndicationLibrary") & 1) == 0)
  {
    int v9 = -[VCPPhotosQuickFaceIdentificationManager initWithPhotoLibrary:]( objc_alloc(&OBJC_CLASS___VCPPhotosQuickFaceIdentificationManager),  "initWithPhotoLibrary:",  v6);
    uint64_t v39 = (void *)objc_claimAutoreleasedReturnValue( -[VCPPhotosQuickFaceIdentificationManager fetchEntityForModelType:evaluationMode:allowUnverifiedPerson:]( v9,  "fetchEntityForModelType:evaluationMode:allowUnverifiedPerson:",  0LL,  0LL,  0LL));
    uint64_t v10 = (uint64_t)[v39 count];

    int v8 = -[VCPFaceLibraryProcessingTask _updateQuickFaceIDModelForPhotoLibrary:withContext:andQuickFaceIDManager:]( self,  "_updateQuickFaceIDModelForPhotoLibrary:withContext:andQuickFaceIDManager:",  v6,  v42,  v9);
    if (v8) {
      goto LABEL_40;
    }
  }

  else
  {
    int v9 = 0LL;
    uint64_t v10 = -1LL;
  }

  uint64_t v11 = (VCPPhotosQuickFaceIdentificationManager *)objc_claimAutoreleasedReturnValue( +[VCPProgressReporter reporterWithIntervalSeconds:andTotalJobCount:andBlock:]( &OBJC_CLASS___VCPProgressReporter,  "reporterWithIntervalSeconds:andTotalJobCount:andBlock:",  10LL,  1LL,  v7));
  int v8 = 0;
  do
  {
    uint64_t v12 = objc_autoreleasePoolPush();
    buf[0] = 0;
    unint64_t subtasks = self->_subtasks;
    if ((subtasks & 4) != 0)
    {
      unsigned int v14 = -[VCPFaceLibraryProcessingTask _generateAndDetectFaceCropsForPhotoLibrary:]( self,  "_generateAndDetectFaceCropsForPhotoLibrary:",  v6);
      if (v14)
      {
        int v15 = 1;
        int v8 = v14;
        goto LABEL_19;
      }

      unint64_t subtasks = self->_subtasks;
    }

    if ((subtasks & 0x70) != 0
      && (uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue( -[VCPFaceLibraryProcessingTask _processingTaskForPhotoLibrary:]( self,  "_processingTaskForPhotoLibrary:",  v6)),  v17 = [v16 processGalleryPersons:buf],  v16,  v17))
    {
      int v15 = 1;
      int v8 = v17;
    }

    else if (buf[0])
    {
      int v15 = 0;
    }

    else
    {
      -[VCPPhotosQuickFaceIdentificationManager increaseProcessedJobCountByOne](v11, "increaseProcessedJobCountByOne");
      int v15 = 9;
    }

- (int)run
{
  v2 = self;
  atomic_store(1u, (unsigned __int8 *)&self->_started);
  if ((self->_subtasks & 1) != 0)
  {
    self = (VCPFaceLibraryProcessingTask *)-[VCPFaceLibraryProcessingTask completeSceneProcessing]( self,  "completeSceneProcessing");
    if ((_DWORD)self)
    {
      int v3 = (int)self;
      (*((void (**)(void))v2->_completionHandler + 2))();
      return v3;
    }
  }

  uint64_t v4 = VCPSignPostLog(self);
  int v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
  os_signpost_id_t spid = os_signpost_id_generate(v5);

  uint64_t v7 = VCPSignPostLog(v6);
  int v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
  int v9 = v8;
  unint64_t v10 = spid - 1;
  if (spid - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v8))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v9,  OS_SIGNPOST_INTERVAL_BEGIN,  spid,  "VCPFaceLibraryProcessingTask",  (const char *)&unk_100199097,  buf,  2u);
  }

  uint64_t v11 = objc_alloc_init(&OBJC_CLASS___VCPTimeMeasurement);
  -[VCPTimeMeasurement start](v11, "start");
  (*((void (**)(double))v2->_progressHandler + 2))(10.0);
  v42[0] = _NSConcreteStackBlock;
  v42[1] = 3221225472LL;
  v42[2] = sub_1000C0538;
  v42[3] = &unk_1001BC570;
  void v42[4] = v2;
  uint64_t v12 = objc_retainBlock(v42);
  unint64_t v13 = 0LL;
  int v3 = 0;
  while (v13 < -[NSArray count](v2->_photoLibraries, "count", spid))
  {
    unsigned int v14 = objc_autoreleasePoolPush();
    if (-[VCPFaceLibraryProcessingTask isCancelled](v2, "isCancelled")) {
      goto LABEL_10;
    }
    uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue(+[VCPWatchdog sharedWatchdog](&OBJC_CLASS___VCPWatchdog, "sharedWatchdog"));
    [v16 pet];

    unsigned int v17 = (void *)objc_claimAutoreleasedReturnValue(-[NSArray objectAtIndexedSubscript:](v2->_photoLibraries, "objectAtIndexedSubscript:", v13));
    unsigned __int8 v18 = -[VCPFaceLibraryProcessingTask _readyToProcessProcessLibrary:](v2, "_readyToProcessProcessLibrary:", v17);

    if ((v18 & 1) != 0)
    {
      BOOL v19 = (void *)objc_claimAutoreleasedReturnValue(-[NSArray objectAtIndexedSubscript:](v2->_photoLibraries, "objectAtIndexedSubscript:", v13));
      unsigned int v20 = objc_msgSend(v19, "mad_useVUGallery");

      uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue(-[NSArray objectAtIndexedSubscript:](v2->_photoLibraries, "objectAtIndexedSubscript:", v13));
      if (v20) {
        unsigned int v22 = -[VCPFaceLibraryProcessingTask runGalleryProcessingForPhotoLibrary:progressHandler:]( v2,  "runGalleryProcessingForPhotoLibrary:progressHandler:",  v21,  v12);
      }
      else {
        unsigned int v22 = -[VCPFaceLibraryProcessingTask runLegacyProcessingForPhotoLibrary:progressHandler:]( v2,  "runLegacyProcessingForPhotoLibrary:progressHandler:",  v21,  v12);
      }
      unsigned int v23 = v22;

      if (v23) {
        int v3 = v23;
      }
      if (v3 == -128)
      {
LABEL_10:
        int v3 = -128;
        int v15 = 2;
        goto LABEL_20;
      }

      int v15 = 0;
    }

    else
    {
      int v15 = 4;
    }

- (void).cxx_destruct
{
}

@end