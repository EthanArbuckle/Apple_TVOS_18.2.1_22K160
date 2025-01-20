@interface VCPMADSceneAssetBatch
+ (BOOL)_allowConcurrentSceneProcessing;
+ (id)batchWithAnalysisDatabase:(id)a3 cancelBlock:(id)a4 monochromeBufferCreator:(id)a5 imageLoader:(id)a6 session:(id)a7 ivsPool:(id)a8 rotationModel:(id)a9 rotationBufferCreator:(id)a10 embeddingBufferCreator:(id)a11;
+ (unint64_t)_concurrentBlurExposureRotationQueueCount;
+ (unint64_t)_concurrentSceneNetQueueCount;
- (VCPMADSceneAssetBatch)initWithAnalysisDatabase:(id)a3 cancelBlock:(id)a4 monochromeBufferCreator:(id)a5 imageLoader:(id)a6 session:(id)a7 ivsPool:(id)a8 rotationModel:(id)a9 rotationBufferCreator:(id)a10 embeddingBufferCreator:(id)a11;
- (id)_extractAndSortBoundingBoxFromDetectedObjects:(id)a3;
- (id)_generateSceneClassificationsFromRequests:(id)a3 andIVSResults:(id)a4;
- (id)_processBoundingBoxFromDetectedObjects:(id)a3 forSceneClassID:(id)a4;
- (int)_collectResultsForAssetEntry:(id)a3 fromRequests:(id)a4 ivsResults:(id)a5;
- (int)_createRequests:(id *)a3 forAssetEntry:(id)a4;
- (int)_performBlurAnalysisForAssetEntry:(id)a3 withLumaPixelBuffer:(__CVBuffer *)a4;
- (int)_performEmbeddingAnalysisForAssetEntry:(id)a3 withColorPixelBuffer:(__CVBuffer *)a4;
- (int)_performExposureAnalysisForAssetEntry:(id)a3 withLumaPixelBuffer:(__CVBuffer *)a4;
- (int)_performRotationAnalysisForAssetEntry:(id)a3 withColorPixelBuffer:(__CVBuffer *)a4;
- (int)_performSceneNetAnalysisForAssetEntry:(id)a3 withImage:(id)a4 andRequests:(id)a5;
- (int)_performWallpaperAnalysisForAssetEntry:(id)a3 withSceneprint:(id)a4;
- (int)prepare;
- (int)process;
- (int)publish;
- (unint64_t)count;
- (void)_insertBoundingBox:(id)a3 toSortedBoundingBoxes:(id)a4;
- (void)_parseClassificationObservations:(id)a3 withPrefix:(id)a4 toClassificationResults:(id)a5;
- (void)_parsePhotosTaxonomyClassificationObservations:(id)a3 toClassificationResults:(id)a4 andDetectorSceneClassIds:(id)a5 isEntityNet:(BOOL)a6;
- (void)_processAssetEntry:(id)a3 resourceURL:(id)a4 completionHandler:(id)a5;
- (void)addPhotosAsset:(id)a3 withPreviousStatus:(unint64_t)a4 attempts:(unint64_t)a5 andAttemptDate:(id)a6;
@end

@implementation VCPMADSceneAssetBatch

+ (BOOL)_allowConcurrentSceneProcessing
{
  unsigned __int8 v2 = atomic_load((unsigned __int8 *)&qword_1001E6428);
  if ((v2 & 1) == 0 && __cxa_guard_acquire(&qword_1001E6428))
  {
    byte_1001E6420 = DeviceHasANE();
    __cxa_guard_release(&qword_1001E6428);
  }

  return byte_1001E6420;
}

+ (unint64_t)_concurrentSceneNetQueueCount
{
  return 4LL;
}

+ (unint64_t)_concurrentBlurExposureRotationQueueCount
{
  return 4LL;
}

- (VCPMADSceneAssetBatch)initWithAnalysisDatabase:(id)a3 cancelBlock:(id)a4 monochromeBufferCreator:(id)a5 imageLoader:(id)a6 session:(id)a7 ivsPool:(id)a8 rotationModel:(id)a9 rotationBufferCreator:(id)a10 embeddingBufferCreator:(id)a11
{
  id v52 = a3;
  id v53 = a4;
  id v51 = a5;
  id v50 = a6;
  id v49 = a7;
  id v48 = a8;
  id v47 = a9;
  id v46 = a10;
  id v45 = a11;
  v55.receiver = self;
  v55.super_class = (Class)&OBJC_CLASS___VCPMADSceneAssetBatch;
  v18 = -[VCPMADSceneAssetBatch init](&v55, "init");
  if (!v18) {
    goto LABEL_10;
  }
  uint64_t v19 = objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  assetEntries = v18->_assetEntries;
  v18->_assetEntries = (NSMutableArray *)v19;

  objc_storeStrong((id *)&v18->_analysisDatabase, a3);
  id v21 = objc_retainBlock(v53);
  id cancelBlock = v18->_cancelBlock;
  v18->_id cancelBlock = v21;

  objc_storeStrong((id *)&v18->_monochromeBufferCreator, a5);
  objc_storeStrong((id *)&v18->_imageLoader, a6);
  v23 = (void *)objc_claimAutoreleasedReturnValue(+[VCPMADProcessingJobManager sharedManager](&OBJC_CLASS___VCPMADProcessingJobManager, "sharedManager"));
  uint64_t v24 = objc_claimAutoreleasedReturnValue([v23 inProcessAssetBudget]);
  inProcessAssetBudget = v18->_inProcessAssetBudget;
  v18->_inProcessAssetBudget = (OS_dispatch_semaphore *)v24;

  v18->_id scenenetQueuesAllowed = 1LL;
  if ([(id)objc_opt_class(v18) _allowConcurrentSceneProcessing])
  {
    id scenenetQueuesAllowed = [(id)objc_opt_class(v18) _concurrentSceneNetQueueCount];
    v18->_id scenenetQueuesAllowed = (unint64_t)scenenetQueuesAllowed;
  }

  else
  {
    id scenenetQueuesAllowed = (id)v18->_scenenetQueuesAllowed;
  }

  [v23 registerQueueGroupWithName:@"Scenenet" andNumberOfQueues:scenenetQueuesAllowed];
  dispatch_group_t v27 = dispatch_group_create();
  scenenetGroup = v18->_scenenetGroup;
  v18->_scenenetGroup = (OS_dispatch_group *)v27;

  v18->_id blurExposureRotationQueuesAllowed = 1LL;
  if ([(id)objc_opt_class(v18) _allowConcurrentSceneProcessing])
  {
    id blurExposureRotationQueuesAllowed = [(id)objc_opt_class(v18) _concurrentBlurExposureRotationQueueCount];
    v18->_id blurExposureRotationQueuesAllowed = (unint64_t)blurExposureRotationQueuesAllowed;
  }

  else
  {
    id blurExposureRotationQueuesAllowed = (id)v18->_blurExposureRotationQueuesAllowed;
  }

  [v23 registerQueueGroupWithName:@"BlurExposureRotation" andNumberOfQueues:blurExposureRotationQueuesAllowed];
  dispatch_group_t v30 = dispatch_group_create();
  blurExposureRotationGroup = v18->_blurExposureRotationGroup;
  v18->_blurExposureRotationGroup = (OS_dispatch_group *)v30;

  [v23 registerQueueGroupWithName:@"AssetProcessCompletion" andNumberOfQueues:1];
  dispatch_group_t v32 = dispatch_group_create();
  assetProcessCompletionGroup = v18->_assetProcessCompletionGroup;
  v18->_assetProcessCompletionGroup = (OS_dispatch_group *)v32;

  uint64_t v34 = objc_claimAutoreleasedReturnValue([v23 getJobScheduler]);
  id scheduler = v18->_scheduler;
  v18->_id scheduler = (id)v34;

  if (v18->_scheduler)
  {
    objc_storeStrong((id *)&v18->_session, a7);
    objc_storeStrong((id *)&v18->_ivsPool, a8);
    objc_storeStrong((id *)&v18->_rotationModel, a9);
    objc_storeStrong((id *)&v18->_rotationBufferCreator, a10);
    objc_storeStrong((id *)&v18->_embeddingBufferCreator, a11);

LABEL_10:
    v38 = v18;
    goto LABEL_16;
  }

  uint64_t v39 = MediaAnalysisLogLevel(v36, v37);
  if ((int)v39 >= 3)
  {
    uint64_t v41 = VCPLogInstance(v39, v40);
    v42 = (os_log_s *)objc_claimAutoreleasedReturnValue(v41);
    os_log_type_t v43 = VCPLogToOSLogType[3];
    if (os_log_type_enabled(v42, v43))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v42,  v43,  "Failed to get job scheduler to dispatch analysis jobs onto global queues across batches",  buf,  2u);
    }
  }

  v38 = 0LL;
LABEL_16:

  return v38;
}

+ (id)batchWithAnalysisDatabase:(id)a3 cancelBlock:(id)a4 monochromeBufferCreator:(id)a5 imageLoader:(id)a6 session:(id)a7 ivsPool:(id)a8 rotationModel:(id)a9 rotationBufferCreator:(id)a10 embeddingBufferCreator:(id)a11
{
  id v17 = a3;
  id v18 = a4;
  id v19 = a5;
  id v20 = a6;
  id v21 = a7;
  id v22 = a8;
  id v23 = a9;
  id v24 = a10;
  id v25 = a11;
  id v26 = [objc_alloc((Class)a1) initWithAnalysisDatabase:v17 cancelBlock:v18 monochromeBufferCreator:v19 imageLoader:v20 session:v21 ivsPool:v22 rotationModel:v23 rotatio nBufferCreator:v24 embeddingBufferCreator:v25];

  return v26;
}

- (unint64_t)count
{
  return (unint64_t)-[NSMutableArray count](self->_assetEntries, "count");
}

- (void)addPhotosAsset:(id)a3 withPreviousStatus:(unint64_t)a4 attempts:(unint64_t)a5 andAttemptDate:(id)a6
{
  id v8 = a3;
  id v28 = a6;
  __int128 v29 = 0u;
  __int128 v30 = 0u;
  __int128 v31 = 0u;
  __int128 v32 = 0u;
  v9 = self->_assetEntries;
  id v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v9,  "countByEnumeratingWithState:objects:count:",  &v29,  v35,  16LL);
  if (v10)
  {
    uint64_t v11 = *(void *)v30;
    while (2)
    {
      for (i = 0LL; i != v10; i = (char *)i + 1)
      {
        if (*(void *)v30 != v11) {
          objc_enumerationMutation(v9);
        }
        v13 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(*((void *)&v29 + 1) + 8 * (void)i) asset]);
        v14 = (void *)objc_claimAutoreleasedReturnValue([v13 localIdentifier]);
        v15 = (void *)objc_claimAutoreleasedReturnValue([v8 localIdentifier]);
        unsigned int v16 = [v14 isEqualToString:v15];

        if (v16)
        {
          uint64_t v20 = MediaAnalysisLogLevel(v17, v18);
          if ((int)v20 >= 4)
          {
            uint64_t v22 = VCPLogInstance(v20, v21);
            id v23 = (os_log_s *)objc_claimAutoreleasedReturnValue(v22);
            os_log_type_t v24 = VCPLogToOSLogType[4];
            if (os_log_type_enabled(v23, v24))
            {
              id v25 = (void *)objc_claimAutoreleasedReturnValue([v8 localIdentifier]);
              *(_DWORD *)buf = 138412290;
              uint64_t v34 = v25;
              _os_log_impl( (void *)&_mh_execute_header,  v23,  v24,  "[Scene][%@] Batch already contains asset; ignoring",
                buf,
                0xCu);
            }
          }

          goto LABEL_14;
        }
      }

      id v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v9,  "countByEnumeratingWithState:objects:count:",  &v29,  v35,  16LL);
      if (v10) {
        continue;
      }
      break;
    }
  }

  assetEntries = self->_assetEntries;
  v9 = (NSMutableArray *)objc_claimAutoreleasedReturnValue( +[VCPMADSceneAssetEntry entryWithAsset:previousStatus:previousAttempts:andLastAttemptDate:]( &OBJC_CLASS___VCPMADSceneAssetEntry,  "entryWithAsset:previousStatus:previousAttempts:andLastAttemptDate:",  v8,  a4,  a5,  v28));
  -[NSMutableArray addObject:](assetEntries, "addObject:", v9);
LABEL_14:
}

- (int)prepare
{
  v42 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate now](&OBJC_CLASS___NSDate, "now"));
  uint64_t v4 = VCPSignPostLog();
  v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
  os_signpost_id_t v6 = os_signpost_id_generate(v5);

  uint64_t v7 = VCPSignPostLog();
  id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
  v9 = v8;
  unint64_t v40 = v6 - 1;
  os_signpost_id_t spid = v6;
  if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v8))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v9,  OS_SIGNPOST_INTERVAL_BEGIN,  v6,  "VCPMADSceneAssetBatch_Prepare",  (const char *)&unk_100199097,  buf,  2u);
  }

  uint64_t v12 = MediaAnalysisLogLevel(v10, v11);
  if ((int)v12 >= 6)
  {
    uint64_t v14 = VCPLogInstance(v12, v13);
    v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
    os_log_type_t v16 = VCPLogToOSLogType[6];
    if (os_log_type_enabled(v15, v16))
    {
      id v17 = -[NSMutableArray count](self->_assetEntries, "count");
      uint64_t v18 = qos_class_self();
      uint64_t v19 = VCPMAQoSDescription(v18);
      unsigned __int8 v2 = (void *)objc_claimAutoreleasedReturnValue(v19);
      *(_DWORD *)buf = 134218242;
      id v49 = v17;
      __int16 v50 = 2112;
      id v51 = v2;
      _os_log_impl((void *)&_mh_execute_header, v15, v16, "[Scene] Preparing %lu assets (QoS: %@)", buf, 0x16u);
    }
  }

  __int128 v45 = 0u;
  __int128 v46 = 0u;
  __int128 v43 = 0u;
  __int128 v44 = 0u;
  uint64_t v20 = self->_assetEntries;
  id v21 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v20,  "countByEnumeratingWithState:objects:count:",  &v43,  v47,  16LL);
  if (v21)
  {
    uint64_t v22 = *(void *)v44;
LABEL_10:
    id v23 = 0LL;
    os_log_type_t v24 = v2;
    while (1)
    {
      if (*(void *)v44 != v22) {
        objc_enumerationMutation(v20);
      }
      id v25 = *(void **)(*((void *)&v43 + 1) + 8LL * (void)v23);
      analysisDatabase = self->_analysisDatabase;
      dispatch_group_t v27 = (char *)[v25 previousAttempts];
      id v28 = (void *)objc_claimAutoreleasedReturnValue([v25 asset]);
      __int128 v29 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate now](&OBJC_CLASS___NSDate, "now"));
      id v30 = (id)-[VCPDatabaseWriter setAttempts:asset:taskID:status:lastAttemptDate:]( analysisDatabase,  "setAttempts:asset:taskID:status:lastAttemptDate:",  v27 + 1,  v28,  2LL,  1LL,  v29);

      if ((_DWORD)v30 == -108)
      {
        unsigned __int8 v2 = v30;
      }

      else
      {
        BOOL v31 = (_DWORD)v30 == -36 || (_DWORD)v30 == -23;
        unsigned __int8 v2 = v30;
        if (!v31) {
          unsigned __int8 v2 = v24;
        }
      }

      if ((_DWORD)v30 == -108) {
        goto LABEL_39;
      }
      if ((_DWORD)v30 == -36 || (_DWORD)v30 == -23) {
        goto LABEL_39;
      }
      id v23 = (char *)v23 + 1;
      os_log_type_t v24 = v2;
      if (v21 == v23)
      {
        id v21 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v20,  "countByEnumeratingWithState:objects:count:",  &v43,  v47,  16LL);
        if (v21) {
          goto LABEL_10;
        }
        break;
      }
    }
  }

  unsigned int v33 = -[VCPDatabaseWriter commit](self->_analysisDatabase, "commit");
  if (v33 == -108 || v33 == -36)
  {
    int v34 = v33;
  }

  else
  {
    int v34 = v33;
    if (v33 != -23) {
      int v34 = (int)v2;
    }
  }

  if (v33 != -108 && v33 != -36 && v33 != -23)
  {
    uint64_t v35 = VCPSignPostLog();
    uint64_t v36 = (os_log_s *)objc_claimAutoreleasedReturnValue(v35);
    uint64_t v37 = v36;
    if (v40 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v36))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v37,  OS_SIGNPOST_INTERVAL_END,  spid,  "VCPMADSceneAssetBatch_Prepare",  (const char *)&unk_100199097,  buf,  2u);
    }

    uint64_t v20 = (NSMutableArray *)objc_claimAutoreleasedReturnValue( +[VCPMADCoreAnalyticsManager sharedManager]( &OBJC_CLASS___VCPMADCoreAnalyticsManager,  "sharedManager"));
    [v42 timeIntervalSinceNow];
    -[NSMutableArray accumulateDoubleValue:forField:andEvent:]( v20,  "accumulateDoubleValue:forField:andEvent:",  @"TotalPrepareTimeInSeconds",  @"com.apple.mediaanalysisd.SceneAnalysisRunSession",  -v38);
    LODWORD(v2) = 0;
LABEL_39:

    int v34 = (int)v2;
  }

  return v34;
}

- (int)_createRequests:(id *)a3 forAssetEntry:(id)a4
{
  id v5 = a4;
  id v6 = objc_alloc_init(&OBJC_CLASS___VCPPreAnalysisRequests);
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue( +[VNClassifyImageAestheticsRequest vcp_sceneRequest]( &OBJC_CLASS___VNClassifyImageAestheticsRequest,  "vcp_sceneRequest"));
  [v6 setAestheticsRequest:v7];

  id v8 = (void *)objc_claimAutoreleasedReturnValue( +[VNSceneClassificationRequest vcp_sceneRequest]( &OBJC_CLASS___VNSceneClassificationRequest,  "vcp_sceneRequest"));
  [v6 setClassificationRequest:v8];

  v9 = (void *)objc_claimAutoreleasedReturnValue( +[VNCreateSceneprintRequest vcp_sceneRequest]( &OBJC_CLASS___VNCreateSceneprintRequest,  "vcp_sceneRequest"));
  [v6 setSceneprintRequest:v9];

  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue( +[VNGenerateAttentionBasedSaliencyImageRequest vcp_sceneRequest]( &OBJC_CLASS___VNGenerateAttentionBasedSaliencyImageRequest,  "vcp_sceneRequest"));
  [v6 setSaliencyRequest:v10];

  if (+[VCPPreAnalysisRequests includeSO](&OBJC_CLASS___VCPPreAnalysisRequests, "includeSO"))
  {
    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue( +[VNGenerateObjectnessBasedSaliencyImageRequest vcp_sceneRequest]( &OBJC_CLASS___VNGenerateObjectnessBasedSaliencyImageRequest,  "vcp_sceneRequest"));
    [v6 setSaliencyObjectnessRequest:v11];
  }

  if (+[VCPPreAnalysisRequests includeJunk](&OBJC_CLASS___VCPPreAnalysisRequests, "includeJunk"))
  {
    uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue( +[VNClassifyJunkImageRequest vcp_sceneRequest]( &OBJC_CLASS___VNClassifyJunkImageRequest,  "vcp_sceneRequest"));
    [v6 setJunkImageRequest:v12];
  }

  if (+[VCPPreAnalysisRequests includeDO](&OBJC_CLASS___VCPPreAnalysisRequests, "includeDO"))
  {
    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue( +[VNRecognizeObjectsRequest vcp_sceneRequest]( &OBJC_CLASS___VNRecognizeObjectsRequest,  "vcp_sceneRequest"));
    [v6 setObjectRequest:v13];
  }

  if (+[VCPPreAnalysisRequests includeLM](&OBJC_CLASS___VCPPreAnalysisRequests, "includeLM"))
  {
    uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue( +[VNClassifyPotentialLandmarkRequest vcp_sceneRequest]( &OBJC_CLASS___VNClassifyPotentialLandmarkRequest,  "vcp_sceneRequest"));
    [v6 setLandmarkRequest:v14];
  }

  if (+[VCPPreAnalysisRequests includeNSFW](&OBJC_CLASS___VCPPreAnalysisRequests, "includeNSFW"))
  {
    v15 = (void *)objc_claimAutoreleasedReturnValue( +[VNVYvzEtX1JlUdu8xx5qhDI vcp_sceneRequest]( &OBJC_CLASS___VNVYvzEtX1JlUdu8xx5qhDI,  "vcp_sceneRequest"));
    [v6 setNsfwRequest:v15];
  }

  if (+[VCPPreAnalysisRequests includeSE](&OBJC_CLASS___VCPPreAnalysisRequests, "includeSE"))
  {
    os_log_type_t v16 = (void *)objc_claimAutoreleasedReturnValue( +[VN6Mb1ME89lyW3HpahkEygIG vcp_sceneRequest]( &OBJC_CLASS___VN6Mb1ME89lyW3HpahkEygIG,  "vcp_sceneRequest"));
    [v6 setTabooRequest:v16];
  }

  if (+[VCPPreAnalysisRequests includeSDG](&OBJC_CLASS___VCPPreAnalysisRequests, "includeSDG"))
  {
    id v17 = (void *)objc_claimAutoreleasedReturnValue( +[VN5kJNH3eYuyaLxNpZr5Z7zi vcp_sceneRequest]( &OBJC_CLASS___VN5kJNH3eYuyaLxNpZr5Z7zi,  "vcp_sceneRequest"));
    [v6 setSemanticRequest:v17];
  }

  if (+[VCPPreAnalysisRequests includeWP](&OBJC_CLASS___VCPPreAnalysisRequests, "includeWP"))
  {
    uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue( +[VNCreateSceneprintRequest vcp_sceneRequestForWallpaper]( &OBJC_CLASS___VNCreateSceneprintRequest,  "vcp_sceneRequestForWallpaper"));
    [v6 setSceneprintRawRequest:v18];
  }

  if (+[VCPPreAnalysisRequests includeMeme](&OBJC_CLASS___VCPPreAnalysisRequests, "includeMeme"))
  {
    uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue( +[VNClassifyMemeImageRequest vcp_sceneRequest]( &OBJC_CLASS___VNClassifyMemeImageRequest,  "vcp_sceneRequest"));
    [v6 setMemeRequest:v19];
  }

  if (+[VCPPreAnalysisRequests includeDocument](&OBJC_CLASS___VCPPreAnalysisRequests, "includeDocument"))
  {
    uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue( +[VNRecognizeDocumentElementsRequest vcp_sceneRequest]( &OBJC_CLASS___VNRecognizeDocumentElementsRequest,  "vcp_sceneRequest"));
    [v6 setDocumentRequest:v20];
  }

  if (+[VCPPreAnalysisRequests includePA](&OBJC_CLASS___VCPPreAnalysisRequests, "includePA"))
  {
    id v21 = (void *)objc_claimAutoreleasedReturnValue( +[VN1JC7R3k4455fKQz0dY1VhQ vcp_sceneRequest]( &OBJC_CLASS___VN1JC7R3k4455fKQz0dY1VhQ,  "vcp_sceneRequest"));
    [v6 setAdjustmentsRequest:v21];
  }

  if (+[VCPPreAnalysisRequests includeCN](&OBJC_CLASS___VCPPreAnalysisRequests, "includeCN"))
  {
    uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue( +[VNClassifyCityNatureImageRequest vcp_sceneRequest]( &OBJC_CLASS___VNClassifyCityNatureImageRequest,  "vcp_sceneRequest"));
    [v6 setCityNatureRequest:v22];
  }

  if (+[VCPPreAnalysisRequests includeDMF](&OBJC_CLASS___VCPPreAnalysisRequests, "includeDMF"))
  {
    id v23 = (void *)objc_claimAutoreleasedReturnValue([v5 asset]);
    id v24 = [v23 mediaType];

    if (v24 != (id)2)
    {
      id v25 = (void *)objc_claimAutoreleasedReturnValue( +[VNCreateImageFingerprintsRequest vcp_sceneRequest]( &OBJC_CLASS___VNCreateImageFingerprintsRequest,  "vcp_sceneRequest"));
      [v6 setImagefingerprintsRequest:v25];
    }
  }

  if (+[VNRequest mad_includeEntityNet](&OBJC_CLASS___VNRequest, "mad_includeEntityNet"))
  {
    id v26 = (void *)objc_claimAutoreleasedReturnValue(+[VNClassifyImageRequest vcp_sceneRequest](&OBJC_CLASS___VNClassifyImageRequest, "vcp_sceneRequest"));
    [v6 setClassifyImageRequest:v26];
  }

  id v27 = v6;
  *a3 = v27;

  return 0;
}

- (int)_performWallpaperAnalysisForAssetEntry:(id)a3 withSceneprint:(id)a4
{
  id v5 = a3;
  id v7 = a4;
  if (v7)
  {
    uint64_t v8 = VCPSignPostLog();
    v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
    os_signpost_id_t v10 = os_signpost_id_generate(v9);

    uint64_t v11 = VCPSignPostLog();
    uint64_t v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
    uint64_t v13 = v12;
    if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v12))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v13,  OS_SIGNPOST_INTERVAL_BEGIN,  v10,  "VCPWallpaperAnalysis",  (const char *)&unk_100199097,  buf,  2u);
    }

    id v14 = objc_alloc_init(&OBJC_CLASS___VCPWallpaperAnalyzer);
    id v44 = 0LL;
    int v15 = [v14 analyzeWithSceneprint:v7 results:&v44 cancel:&stru_1001BA5A8];
    id v16 = v44;
    uint64_t v17 = VCPSignPostLog();
    uint64_t v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(v17);
    uint64_t v19 = v18;
    if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v18))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v19,  OS_SIGNPOST_INTERVAL_END,  v10,  "VCPWallpaperAnalysis",  (const char *)&unk_100199097,  buf,  2u);
    }

    if (v15)
    {
      uint64_t v22 = MediaAnalysisLogLevel(v20, v21);
      if ((int)v22 >= 3)
      {
        uint64_t v24 = VCPLogInstance(v22, v23);
        id v25 = (os_log_s *)objc_claimAutoreleasedReturnValue(v24);
        os_log_type_t v26 = VCPLogToOSLogType[3];
        if (os_log_type_enabled(v25, v26))
        {
          *(_WORD *)buf = 0;
          _os_log_impl( (void *)&_mh_execute_header,  v25,  v26,  "Failed to run VCPWallpaperAnalyzer::analyzeWithSceneprint:results:cancel:",  buf,  2u);
        }

- (id)_processBoundingBoxFromDetectedObjects:(id)a3 forSceneClassID:(id)a4
{
  id v5 = a3;
  id v73 = a4;
  v74 = v5;
  if ([v5 count])
  {
    if ([v5 count] == (id)1)
    {
      id v7 = (void *)objc_claimAutoreleasedReturnValue([v5 firstObject]);
      uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v7 objectForKeyedSubscript:VCPConfidenceKey]);
      [v8 floatValue];
      float v10 = v9;

      uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([v5 firstObject]);
      uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue([v11 objectForKeyedSubscript:@"size"]);
      [v12 floatValue];
      float v14 = v13;

      v94[0] = v73;
      uint64_t v15 = VCPBoundingBoxKey;
      v93[0] = @"classID";
      v93[1] = VCPBoundingBoxKey;
      id v16 = (void *)objc_claimAutoreleasedReturnValue([v5 firstObject]);
      uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue([v16 objectForKeyedSubscript:v15]);
      v94[1] = v17;
      v93[2] = @"score";
      *(float *)&double v18 = v10 * v14;
      uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](&OBJC_CLASS___NSNumber, "numberWithFloat:", v18));
      v94[2] = v19;
      uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v94,  v93,  3LL));

LABEL_48:
      goto LABEL_49;
    }

    __int128 v81 = 0u;
    __int128 v82 = 0u;
    __int128 v79 = 0u;
    __int128 v80 = 0u;
    id v29 = v5;
    id v30 = [v29 countByEnumeratingWithState:&v79 objects:v92 count:16];
    if (v30)
    {
      uint64_t v31 = *(void *)v80;
      uint64_t v32 = VCPConfidenceKey;
      float v33 = -1.0;
      do
      {
        for (i = 0LL; i != v30; i = (char *)i + 1)
        {
          if (*(void *)v80 != v31) {
            objc_enumerationMutation(v29);
          }
          BOOL v35 = (void *)objc_claimAutoreleasedReturnValue( [*(id *)(*((void *)&v79 + 1) + 8 * (void)i) objectForKeyedSubscript:v32]);
          [v35 floatValue];
          float v37 = v36;

          if (v37 > v33) {
            float v33 = v37;
          }
        }

        id v30 = [v29 countByEnumeratingWithState:&v79 objects:v92 count:16];
      }

      while (v30);
    }

    else
    {
      float v33 = -1.0;
    }

    double v40 = v33;
    if (v33 >= 0.01)
    {
      __int128 v77 = 0u;
      __int128 v78 = 0u;
      __int128 v75 = 0u;
      __int128 v76 = 0u;
      id v45 = v29;
      id v46 = [v45 countByEnumeratingWithState:&v75 objects:v91 count:16];
      float v47 = v33 * 0.8;
      id v16 = 0LL;
      if (v46)
      {
        uint64_t v48 = *(void *)v76;
        uint64_t v49 = VCPConfidenceKey;
        uint64_t v50 = VCPBoundingBoxKey;
        float v51 = -1.0;
        float v52 = -1.0;
        do
        {
          for (j = 0LL; j != v46; j = (char *)j + 1)
          {
            if (*(void *)v76 != v48) {
              objc_enumerationMutation(v45);
            }
            v54 = *(void **)(*((void *)&v75 + 1) + 8LL * (void)j);
            objc_super v55 = (void *)objc_claimAutoreleasedReturnValue([v54 objectForKeyedSubscript:v49]);
            [v55 floatValue];
            float v57 = v56;

            v58 = (void *)objc_claimAutoreleasedReturnValue([v54 objectForKeyedSubscript:@"size"]);
            [v58 floatValue];
            float v60 = v59;

            if (v57 >= v47 && v60 > v51)
            {
              uint64_t v62 = objc_claimAutoreleasedReturnValue([v54 objectForKeyedSubscript:v50]);

              float v51 = v60;
              float v52 = v57;
              id v16 = (void *)v62;
            }
          }

          id v46 = [v45 countByEnumeratingWithState:&v75 objects:v91 count:16];
        }

        while (v46);
      }

      else
      {
        float v51 = -1.0;
        float v52 = -1.0;
      }

      if (v51 == -1.0 || v52 == -1.0 || !v16)
      {
        uint64_t v67 = MediaAnalysisLogLevel(v63, v64);
        uint64_t v69 = VCPLogInstance(v67, v68);
        v66 = (os_log_s *)objc_claimAutoreleasedReturnValue(v69);
        os_log_type_t v70 = VCPLogToOSLogType[4];
        if (os_log_type_enabled(v66, v70))
        {
          v71 = (void *)objc_claimAutoreleasedReturnValue([v45 description]);
          *(_DWORD *)buf = 134218498;
          double v86 = v40;
          __int16 v87 = 2048;
          double v88 = v47;
          __int16 v89 = 2112;
          v90 = v71;
          _os_log_impl( (void *)&_mh_execute_header,  v66,  v70,  "[DO] Failed to choose the best bounding box c_max: %f, c_threshold (0.8x): %f from %@",  buf,  0x20u);
        }

        uint64_t v20 = 0LL;
      }

      else
      {
        v83[0] = @"classID";
        v83[1] = VCPBoundingBoxKey;
        v84[0] = v73;
        v84[1] = v16;
        v83[2] = @"score";
        *(float *)&double v65 = v51 * v52;
        v66 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](&OBJC_CLASS___NSNumber, "numberWithFloat:", v65));
        v84[2] = v66;
        uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v84,  v83,  3LL));
      }

      goto LABEL_48;
    }

    uint64_t v41 = MediaAnalysisLogLevel(v38, v39);
    if ((int)v41 >= 4)
    {
      uint64_t v43 = VCPLogInstance(v41, v42);
      id v16 = (void *)objc_claimAutoreleasedReturnValue(v43);
      os_log_type_t v44 = VCPLogToOSLogType[4];
      if (os_log_type_enabled((os_log_t)v16, v44))
      {
        *(_DWORD *)buf = 134217984;
        double v86 = v33;
        id v25 = "[DO] invalid confidenceMax: %f; skip detectedObjects";
        os_log_type_t v26 = (os_log_s *)v16;
        os_log_type_t v27 = v44;
        uint32_t v28 = 12;
        goto LABEL_22;
      }

      goto LABEL_47;
    }
  }

  else
  {
    uint64_t v21 = MediaAnalysisLogLevel(0LL, v6);
    if ((int)v21 >= 4)
    {
      uint64_t v23 = VCPLogInstance(v21, v22);
      id v16 = (void *)objc_claimAutoreleasedReturnValue(v23);
      os_log_type_t v24 = VCPLogToOSLogType[4];
      if (os_log_type_enabled((os_log_t)v16, v24))
      {
        *(_WORD *)buf = 0;
        id v25 = "[DO] detectedObjects count is 0; skip detectedObjects";
        os_log_type_t v26 = (os_log_s *)v16;
        os_log_type_t v27 = v24;
        uint32_t v28 = 2;
LABEL_22:
        _os_log_impl((void *)&_mh_execute_header, v26, v27, v25, buf, v28);
      }

- (void)_insertBoundingBox:(id)a3 toSortedBoundingBoxes:(id)a4
{
  id v14 = a3;
  id v5 = a4;
  if (v14 && v5)
  {
    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue([v14 objectForKeyedSubscript:@"score"]);
    [v6 floatValue];
    float v8 = v7;

    for (unint64_t i = 0; i < (unint64_t)[v5 count]; ++i)
    {
      float v10 = (void *)objc_claimAutoreleasedReturnValue([v5 objectAtIndexedSubscript:i]);
      uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([v10 objectForKeyedSubscript:@"score"]);
      [v11 floatValue];
      float v13 = v12;

      if (v13 < v8) {
        break;
      }
    }

    [v5 insertObject:v14 atIndex:i];
  }
}

- (id)_extractAndSortBoundingBoxFromDetectedObjects:(id)a3
{
  id v4 = a3;
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472LL;
  v12[2] = sub_10002207C;
  v12[3] = &unk_1001BA5D0;
  id v5 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  id v13 = v5;
  [v4 enumerateObjectsUsingBlock:v12];
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472LL;
  v10[2] = sub_100022444;
  v10[3] = &unk_1001BA5F8;
  v10[4] = self;
  id v6 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  id v11 = v6;
  [v5 enumerateKeysAndObjectsUsingBlock:v10];
  float v7 = v11;
  id v8 = v6;

  return v8;
}

- (void)_parseClassificationObservations:(id)a3 withPrefix:(id)a4 toClassificationResults:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v30 = a5;
  __int128 v31 = 0u;
  __int128 v32 = 0u;
  __int128 v33 = 0u;
  __int128 v34 = 0u;
  id v9 = v7;
  id v10 = [v9 countByEnumeratingWithState:&v31 objects:v39 count:16];
  if (v10)
  {
    uint64_t v11 = *(void *)v32;
    uint64_t v29 = VCPConfidenceKey;
    os_log_type_t type = VCPLogToOSLogType[4];
    do
    {
      float v12 = 0LL;
      do
      {
        if (*(void *)v32 != v11) {
          objc_enumerationMutation(v9);
        }
        id v13 = *(void **)(*((void *)&v31 + 1) + 8LL * (void)v12);
        id v14 = (void *)objc_claimAutoreleasedReturnValue([v13 identifier]);
        [v13 confidence];
        if (v15 >= 0.01)
        {
          if (v8 && ([v14 hasPrefix:v8] & 1) == 0)
          {
            uint64_t v16 = objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%@%@", v8, v14));

            id v14 = (void *)v16;
          }

          uint64_t v17 = VCPSpecialLabelToExtendedSceneClassificationID(v14);
          uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue(v17);
          if (v19)
          {
            uint64_t v37 = v29;
            [v13 confidence];
            uint64_t v20 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](&OBJC_CLASS___NSNumber, "numberWithFloat:"));
            uint64_t v38 = v20;
            uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v38,  &v37,  1LL));
            uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue([v19 stringValue]);
            [v30 setObject:v21 forKeyedSubscript:v22];

            goto LABEL_12;
          }

          uint64_t v23 = MediaAnalysisLogLevel(0LL, v18);
          if ((int)v23 >= 4)
          {
            uint64_t v25 = VCPLogInstance(v23, v24);
            uint64_t v20 = (os_log_s *)objc_claimAutoreleasedReturnValue(v25);
            if (os_log_type_enabled(v20, type))
            {
              os_log_type_t v26 = (void *)objc_claimAutoreleasedReturnValue([v13 identifier]);
              *(_DWORD *)buf = 138412290;
              float v36 = v26;
              _os_log_impl((void *)&_mh_execute_header, v20, type, "Unsupported observation label %@", buf, 0xCu);
            }

- (void)_parsePhotosTaxonomyClassificationObservations:(id)a3 toClassificationResults:(id)a4 andDetectorSceneClassIds:(id)a5 isEntityNet:(BOOL)a6
{
  BOOL v48 = a6;
  id v8 = a3;
  id v47 = a4;
  id v49 = a5;
  __int128 v52 = 0u;
  __int128 v53 = 0u;
  __int128 v54 = 0u;
  __int128 v55 = 0u;
  id v9 = v8;
  id v10 = [v9 countByEnumeratingWithState:&v52 objects:v60 count:16];
  if (v10)
  {
    uint64_t v11 = *(void *)v53;
    uint64_t v46 = VCPConfidenceKey;
    os_log_type_t type = VCPLogToOSLogType[7];
    os_log_type_t v45 = VCPLogToOSLogType[3];
    do
    {
      float v12 = 0LL;
      do
      {
        if (*(void *)v53 != v11) {
          objc_enumerationMutation(v9);
        }
        id v13 = *(void **)(*((void *)&v52 + 1) + 8LL * (void)v12);
        id v14 = objc_autoreleasePoolPush();
        [v13 confidence];
        if (v15 >= 0.01)
        {
          uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue(+[PFSceneTaxonomy vcp_sharedTaxonomy](&OBJC_CLASS___PFSceneTaxonomy, "vcp_sharedTaxonomy"));
          uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue([v13 identifier]);
          uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue([v16 nodeForName:v17]);

          if (v18)
          {
            [v18 highPrecisionThreshold];
            double v22 = v21;
            [v18 highRecallThreshold];
            double v24 = v23;
            [v18 searchThreshold];
            double v26 = v25;
            [v13 confidence];
            if (v24 >= v22) {
              double v28 = v22;
            }
            else {
              double v28 = v24;
            }
            if (v26 < v28) {
              double v28 = v26;
            }
            double v29 = v27;
            if (v28 < 0.01) {
              double v28 = 0.01;
            }
            if (v28 <= v29)
            {
              id v30 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedLongLong:]( NSNumber,  "numberWithUnsignedLongLong:",  [v18 extendedSceneClassId]));
              __int128 v31 = (os_log_s *)objc_claimAutoreleasedReturnValue([v30 stringValue]);

              uint64_t v58 = v46;
              [v13 confidence];
              __int128 v32 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](&OBJC_CLASS___NSNumber, "numberWithFloat:"));
              float v59 = v32;
              __int128 v33 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v59,  &v58,  1LL));
              [v47 setObject:v33 forKeyedSubscript:v31];

              if (v49)
              {
                __int128 v34 = (void *)objc_claimAutoreleasedReturnValue([v18 detectors]);
                v50[0] = _NSConcreteStackBlock;
                v50[1] = 3221225472LL;
                v50[2] = sub_100022CE0;
                v50[3] = &unk_1001BA620;
                id v51 = v49;
                [v34 enumerateObjectsUsingBlock:v50];
              }

              goto LABEL_18;
            }
          }

          else
          {
            if (v48)
            {
              uint64_t v35 = MediaAnalysisLogLevel(v19, v20);
              uint64_t v37 = VCPLogInstance(v35, v36);
              __int128 v31 = (os_log_s *)objc_claimAutoreleasedReturnValue(v37);
              if (os_log_type_enabled(v31, type))
              {
                uint64_t v38 = (void *)objc_claimAutoreleasedReturnValue([v13 identifier]);
                *(_DWORD *)buf = 138412290;
                float v57 = v38;
                _os_log_impl( (void *)&_mh_execute_header,  v31,  type,  "Unsupported EntityNet label in PFSceneTaxonomyNode: %@",  buf,  0xCu);
              }
            }

            else
            {
              uint64_t v39 = MediaAnalysisLogLevel(v19, v20);
              uint64_t v41 = VCPLogInstance(v39, v40);
              __int128 v31 = (os_log_s *)objc_claimAutoreleasedReturnValue(v41);
              if (os_log_type_enabled(v31, v45))
              {
                uint64_t v42 = (void *)objc_claimAutoreleasedReturnValue([v13 identifier]);
                *(_DWORD *)buf = 138412290;
                float v57 = v42;
                _os_log_impl( (void *)&_mh_execute_header,  v31,  v45,  "Unsupported SceneNet label in PFSceneTaxonomyNode: %@",  buf,  0xCu);
              }
            }

- (id)_generateSceneClassificationsFromRequests:(id)a3 andIVSResults:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  unsigned int v9 = +[VCPPreAnalysisRequests includeDO](&OBJC_CLASS___VCPPreAnalysisRequests, "includeDO");
  id v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](&OBJC_CLASS___NSMutableSet, "set"));
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([v6 classificationRequest]);
  float v12 = (void *)objc_claimAutoreleasedReturnValue([v11 results]);
  if (v9) {
    id v13 = v10;
  }
  else {
    id v13 = 0LL;
  }
  -[VCPMADSceneAssetBatch _parsePhotosTaxonomyClassificationObservations:toClassificationResults:andDetectorSceneClassIds:isEntityNet:]( self,  "_parsePhotosTaxonomyClassificationObservations:toClassificationResults:andDetectorSceneClassIds:isEntityNet:",  v12,  v8,  v13,  0LL);

  if (v9)
  {
    id v14 = (void *)objc_claimAutoreleasedReturnValue([v6 objectRequest]);
    float v15 = (void *)objc_claimAutoreleasedReturnValue([v14 results]);

    uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue( -[VCPMADSceneAssetBatch _extractAndSortBoundingBoxFromDetectedObjects:]( self,  "_extractAndSortBoundingBoxFromDetectedObjects:",  v15));
    v53[0] = 0LL;
    v53[1] = v53;
    v53[2] = 0x2020000000LL;
    v53[3] = 0LL;
    v49[0] = _NSConcreteStackBlock;
    v49[1] = 3221225472LL;
    v49[2] = sub_10002342C;
    v49[3] = &unk_1001BA648;
    id v50 = v10;
    id v51 = v8;
    __int128 v52 = v53;
    [v16 enumerateObjectsUsingBlock:v49];

    _Block_object_dispose(v53, 8);
  }

  uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue([v6 classifyImageRequest]);
  uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue([v17 results]);
  -[VCPMADSceneAssetBatch _parsePhotosTaxonomyClassificationObservations:toClassificationResults:andDetectorSceneClassIds:isEntityNet:]( self,  "_parsePhotosTaxonomyClassificationObservations:toClassificationResults:andDetectorSceneClassIds:isEntityNet:",  v18,  v8,  0LL,  1LL);

  uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue([v6 junkImageRequest]);
  uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue([v19 results]);
  -[VCPMADSceneAssetBatch _parseClassificationObservations:withPrefix:toClassificationResults:]( self,  "_parseClassificationObservations:withPrefix:toClassificationResults:",  v20,  0LL,  v8);

  double v21 = (void *)objc_claimAutoreleasedReturnValue([v6 landmarkRequest]);
  double v22 = (void *)objc_claimAutoreleasedReturnValue([v21 results]);
  -[VCPMADSceneAssetBatch _parseClassificationObservations:withPrefix:toClassificationResults:]( self,  "_parseClassificationObservations:withPrefix:toClassificationResults:",  v22,  0LL,  v8);

  double v23 = (void *)objc_claimAutoreleasedReturnValue([v6 nsfwRequest]);
  double v24 = (void *)objc_claimAutoreleasedReturnValue([v23 results]);
  -[VCPMADSceneAssetBatch _parseClassificationObservations:withPrefix:toClassificationResults:]( self,  "_parseClassificationObservations:withPrefix:toClassificationResults:",  v24,  0LL,  v8);

  double v25 = (void *)objc_claimAutoreleasedReturnValue([v6 tabooRequest]);
  double v26 = (void *)objc_claimAutoreleasedReturnValue([v25 results]);
  -[VCPMADSceneAssetBatch _parseClassificationObservations:withPrefix:toClassificationResults:]( self,  "_parseClassificationObservations:withPrefix:toClassificationResults:",  v26,  0LL,  v8);

  float v27 = (void *)objc_claimAutoreleasedReturnValue([v6 semanticRequest]);
  double v28 = (void *)objc_claimAutoreleasedReturnValue([v27 results]);
  -[VCPMADSceneAssetBatch _parseClassificationObservations:withPrefix:toClassificationResults:]( self,  "_parseClassificationObservations:withPrefix:toClassificationResults:",  v28,  0LL,  v8);

  double v29 = (void *)objc_claimAutoreleasedReturnValue([v6 memeRequest]);
  id v30 = (void *)objc_claimAutoreleasedReturnValue([v29 results]);
  -[VCPMADSceneAssetBatch _parseClassificationObservations:withPrefix:toClassificationResults:]( self,  "_parseClassificationObservations:withPrefix:toClassificationResults:",  v30,  @"meme_",  v8);

  __int128 v31 = (void *)objc_claimAutoreleasedReturnValue([v6 cityNatureRequest]);
  __int128 v32 = (void *)objc_claimAutoreleasedReturnValue([v31 results]);
  -[VCPMADSceneAssetBatch _parseClassificationObservations:withPrefix:toClassificationResults:]( self,  "_parseClassificationObservations:withPrefix:toClassificationResults:",  v32,  0LL,  v8);

  __int128 v47 = 0u;
  __int128 v48 = 0u;
  __int128 v45 = 0u;
  __int128 v46 = 0u;
  __int128 v33 = (void *)objc_claimAutoreleasedReturnValue([v6 documentRequest]);
  __int128 v34 = (void *)objc_claimAutoreleasedReturnValue([v33 results]);

  id v35 = [v34 countByEnumeratingWithState:&v45 objects:v54 count:16];
  if (v35)
  {
    uint64_t v36 = *(void *)v46;
    do
    {
      uint64_t v37 = 0LL;
      do
      {
        if (*(void *)v46 != v36) {
          objc_enumerationMutation(v34);
        }
        uint64_t v38 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(*((void *)&v45 + 1) + 8 * (void)v37) labels]);
        -[VCPMADSceneAssetBatch _parseClassificationObservations:withPrefix:toClassificationResults:]( self,  "_parseClassificationObservations:withPrefix:toClassificationResults:",  v38,  0LL,  v8);

        uint64_t v37 = (char *)v37 + 1;
      }

      while (v35 != v37);
      id v35 = [v34 countByEnumeratingWithState:&v45 objects:v54 count:16];
    }

    while (v35);
  }

  if (v7)
  {
    v43[0] = _NSConcreteStackBlock;
    v43[1] = 3221225472LL;
    v43[2] = sub_10002362C;
    v43[3] = &unk_1001BA670;
    id v44 = v8;
    [v7 enumerateKeysAndObjectsUsingBlock:v43];
  }

  v41[0] = _NSConcreteStackBlock;
  v41[1] = 3221225472LL;
  v41[2] = sub_1000237E4;
  v41[3] = &unk_1001BA698;
  id v39 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](&OBJC_CLASS___NSMutableSet, "set"));
  id v42 = v39;
  [v8 enumerateKeysAndObjectsUsingBlock:v41];

  return v39;
}

- (int)_collectResultsForAssetEntry:(id)a3 fromRequests:(id)a4 ivsResults:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v278 = a5;
  id v10 = (void *)objc_claimAutoreleasedReturnValue([v8 asset]);
  unsigned __int8 v11 = objc_msgSend(v10, "vcp_abnormalImageDimensionForSceneNet");

  if ((v11 & 1) != 0)
  {
    uint64_t v42 = MediaAnalysisLogLevel(v12, v13);
    if ((int)v42 >= 7)
    {
      uint64_t v44 = VCPLogInstance(v42, v43);
      __int128 v45 = (os_log_s *)objc_claimAutoreleasedReturnValue(v44);
      os_log_type_t v46 = VCPLogToOSLogType[7];
      if (os_log_type_enabled(v45, v46))
      {
        __int128 v47 = (void *)objc_claimAutoreleasedReturnValue([v8 asset]);
        __int128 v48 = (void *)objc_claimAutoreleasedReturnValue([v47 localIdentifier]);
        *(_DWORD *)buf = 138412290;
        v290 = v48;
        _os_log_impl((void *)&_mh_execute_header, v45, v46, "[%@] Ignoring SceneNet result for tiny asset", buf, 0xCu);
      }
    }

    uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet set](&OBJC_CLASS___NSSet, "set"));
    float v27 = (void *)objc_claimAutoreleasedReturnValue([v8 results]);
    [v27 setSceneClassifications:v18];
  }

  else
  {
    id v14 = (void *)objc_claimAutoreleasedReturnValue( -[VCPMADSceneAssetBatch _generateSceneClassificationsFromRequests:andIVSResults:]( self,  "_generateSceneClassificationsFromRequests:andIVSResults:",  v9,  v278));
    float v15 = (void *)objc_claimAutoreleasedReturnValue([v8 results]);
    [v15 setSceneClassifications:v14];

    uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue([v8 results]);
    uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue([v16 sceneClassifications]);
    uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue([v17 allObjects]);

    uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue([v8 asset]);
    uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue([v19 location]);
    [v20 coordinate];
    double v22 = v21;

    double v23 = (void *)objc_claimAutoreleasedReturnValue([v8 asset]);
    double v24 = (void *)objc_claimAutoreleasedReturnValue([v23 location]);
    [v24 coordinate];
    double v26 = v25;

    float v27 = (void *)objc_claimAutoreleasedReturnValue( +[PFSceneGeography vcp_sharedSceneGeography]( &OBJC_CLASS___PFSceneGeography,  "vcp_sharedSceneGeography"));
    double v28 = (void *)objc_claimAutoreleasedReturnValue(+[PFSceneTaxonomy vcp_sharedTaxonomy](&OBJC_CLASS___PFSceneTaxonomy, "vcp_sharedTaxonomy"));
    id v29 = +[PNAssetCurationUtilities assetIconicScoreForSceneClassifications:assetLatitude:assetLongitude:sceneGeography:sceneTaxonomy:]( &OBJC_CLASS___PNAssetCurationUtilities,  "assetIconicScoreForSceneClassifications:assetLatitude:assetLongitude:sceneGeography:sceneTaxonomy:",  v18,  v27,  v28,  v22,  v26);
    double v31 = v30;
    uint64_t v33 = MediaAnalysisLogLevel(v29, v32);
    if ((int)v33 >= 7)
    {
      uint64_t v35 = VCPLogInstance(v33, v34);
      uint64_t v36 = (os_log_s *)objc_claimAutoreleasedReturnValue(v35);
      os_log_type_t v37 = VCPLogToOSLogType[7];
      if (os_log_type_enabled(v36, v37))
      {
        uint64_t v38 = (void *)objc_claimAutoreleasedReturnValue([v8 asset]);
        id v39 = (void *)objc_claimAutoreleasedReturnValue([v38 localIdentifier]);
        *(_DWORD *)buf = 138412546;
        v290 = v39;
        __int16 v291 = 2048;
        double v292 = v31;
        _os_log_impl((void *)&_mh_execute_header, v36, v37, "[%@] Accepting iconicScore: %.3f", buf, 0x16u);
      }
    }

    uint64_t v40 = (void *)objc_claimAutoreleasedReturnValue([v8 results]);
    *(float *)&double v41 = v31;
    [v40 setIconicScore:v41];
  }

  id v49 = (void *)objc_claimAutoreleasedReturnValue([v9 aestheticsRequest]);
  id v50 = (void *)objc_claimAutoreleasedReturnValue([v49 results]);
  BOOL v51 = [v50 count] == (id)1;

  if (v51)
  {
    __int128 v52 = (void *)objc_claimAutoreleasedReturnValue([v9 aestheticsRequest]);
    __int128 v53 = (void *)objc_claimAutoreleasedReturnValue([v52 results]);
    __int128 v54 = (void *)objc_claimAutoreleasedReturnValue([v53 firstObject]);

    [v54 aestheticScore];
    int v56 = v55;
    float v57 = (void *)objc_claimAutoreleasedReturnValue([v8 results]);
    LODWORD(v58) = v56;
    [v57 setOverallAestheticScore:v58];

    [v54 wellFramedSubjectScore];
    int v60 = v59;
    v61 = (void *)objc_claimAutoreleasedReturnValue([v8 results]);
    LODWORD(v62) = v60;
    [v61 setWellFramedSubjectScore:v62];

    [v54 wellChosenBackgroundScore];
    int v64 = v63;
    double v65 = (void *)objc_claimAutoreleasedReturnValue([v8 results]);
    LODWORD(v66) = v64;
    [v65 setWellChosenSubjectScore:v66];

    [v54 tastefullyBlurredScore];
    int v68 = v67;
    uint64_t v69 = (void *)objc_claimAutoreleasedReturnValue([v8 results]);
    LODWORD(v70) = v68;
    [v69 setTastefullyBlurredScore:v70];

    [v54 sharplyFocusedSubjectScore];
    int v72 = v71;
    id v73 = (void *)objc_claimAutoreleasedReturnValue([v8 results]);
    LODWORD(v74) = v72;
    [v73 setSharplyFocusedSubjectScore:v74];

    [v54 wellTimedShotScore];
    int v76 = v75;
    __int128 v77 = (void *)objc_claimAutoreleasedReturnValue([v8 results]);
    LODWORD(v78) = v76;
    [v77 setWellTimedShotScore:v78];

    [v54 pleasantLightingScore];
    int v80 = v79;
    __int128 v81 = (void *)objc_claimAutoreleasedReturnValue([v8 results]);
    LODWORD(v82) = v80;
    [v81 setPleasantLightingScore:v82];

    [v54 pleasantReflectionsScore];
    int v84 = v83;
    v85 = (void *)objc_claimAutoreleasedReturnValue([v8 results]);
    LODWORD(v86) = v84;
    [v85 setPleasantReflectionsScore:v86];

    [v54 harmoniousColorScore];
    int v88 = v87;
    __int16 v89 = (void *)objc_claimAutoreleasedReturnValue([v8 results]);
    LODWORD(v90) = v88;
    [v89 setHarmoniousColorScore:v90];

    [v54 livelyColorScore];
    int v92 = v91;
    v93 = (void *)objc_claimAutoreleasedReturnValue([v8 results]);
    LODWORD(v94) = v92;
    [v93 setLivelyColorScore:v94];

    [v54 pleasantSymmetryScore];
    int v96 = v95;
    v97 = (void *)objc_claimAutoreleasedReturnValue([v8 results]);
    LODWORD(v98) = v96;
    [v97 setPleasantSymmetryScore:v98];

    [v54 pleasantPatternScore];
    int v100 = v99;
    v101 = (void *)objc_claimAutoreleasedReturnValue([v8 results]);
    LODWORD(v102) = v100;
    [v101 setPleasantPatternScore:v102];

    [v54 immersivenessScore];
    int v104 = v103;
    v105 = (void *)objc_claimAutoreleasedReturnValue([v8 results]);
    LODWORD(v106) = v104;
    [v105 setImmersivenessScore:v106];

    [v54 pleasantPerspectiveScore];
    int v108 = v107;
    v109 = (void *)objc_claimAutoreleasedReturnValue([v8 results]);
    LODWORD(v110) = v108;
    [v109 setPleasantPerspectiveScore:v110];

    [v54 pleasantPostProcessingScore];
    int v112 = v111;
    v113 = (void *)objc_claimAutoreleasedReturnValue([v8 results]);
    LODWORD(v114) = v112;
    [v113 setPleasantPostProcessingScore:v114];

    [v54 noiseScore];
    int v116 = v115;
    v117 = (void *)objc_claimAutoreleasedReturnValue([v8 results]);
    LODWORD(v118) = v116;
    [v117 setNoiseScore:v118];

    [v54 failureScore];
    int v120 = v119;
    v121 = (void *)objc_claimAutoreleasedReturnValue([v8 results]);
    LODWORD(v122) = v120;
    [v121 setFailureScore:v122];

    [v54 pleasantCompositionScore];
    int v124 = v123;
    v125 = (void *)objc_claimAutoreleasedReturnValue([v8 results]);
    LODWORD(v126) = v124;
    [v125 setPleasantCompositionScore:v126];

    [v54 interestingSubjectScore];
    int v128 = v127;
    v129 = (void *)objc_claimAutoreleasedReturnValue([v8 results]);
    LODWORD(v130) = v128;
    [v129 setInterestingSubjectScore:v130];

    [v54 intrusiveObjectPresenceScore];
    int v132 = v131;
    v133 = (void *)objc_claimAutoreleasedReturnValue([v8 results]);
    LODWORD(v134) = v132;
    [v133 setIntrusiveObjectPresenceScore:v134];

    [v54 pleasantCameraTiltScore];
    int v136 = v135;
    v137 = (void *)objc_claimAutoreleasedReturnValue([v8 results]);
    LODWORD(v138) = v136;
    [v137 setPleasantCameraTiltScore:v138];

    [v54 lowKeyLightingScore];
    int v140 = v139;
    v141 = (void *)objc_claimAutoreleasedReturnValue([v8 results]);
    LODWORD(v142) = v140;
    [v141 setLowLight:v142];

    v143 = (void *)objc_claimAutoreleasedReturnValue([v9 saliencyRequest]);
    v144 = (void *)objc_claimAutoreleasedReturnValue([v143 results]);
    BOOL v145 = [v144 count] == (id)1;

    if (v145)
    {
      v146 = (void *)objc_claimAutoreleasedReturnValue([v9 saliencyRequest]);
      v147 = (void *)objc_claimAutoreleasedReturnValue([v146 results]);
      v148 = (void *)objc_claimAutoreleasedReturnValue([v147 firstObject]);
      [v148 boundingBox];
      CGFloat x = v293.origin.x;
      CGFloat y = v293.origin.y;
      CGFloat width = v293.size.width;
      CGFloat height = v293.size.height;
      if (CGRectGetMinX(v293) < 0.0) {
        goto LABEL_21;
      }
      v294.origin.CGFloat x = x;
      v294.origin.CGFloat y = y;
      v294.size.CGFloat width = width;
      v294.size.CGFloat height = height;
      if (CGRectGetMinX(v294) > 1.0) {
        goto LABEL_21;
      }
      v295.origin.CGFloat x = x;
      v295.origin.CGFloat y = y;
      v295.size.CGFloat width = width;
      v295.size.CGFloat height = height;
      if (CGRectGetMinY(v295) < 0.0) {
        goto LABEL_21;
      }
      v296.origin.CGFloat x = x;
      v296.origin.CGFloat y = y;
      v296.size.CGFloat width = width;
      v296.size.CGFloat height = height;
      if (CGRectGetMinY(v296) > 1.0) {
        goto LABEL_21;
      }
      v297.origin.CGFloat x = x;
      v297.origin.CGFloat y = y;
      v297.size.CGFloat width = width;
      v297.size.CGFloat height = height;
      if (CGRectGetMaxX(v297) < 0.0) {
        goto LABEL_21;
      }
      v298.origin.CGFloat x = x;
      v298.origin.CGFloat y = y;
      v298.size.CGFloat width = width;
      v298.size.CGFloat height = height;
      if (CGRectGetMaxX(v298) > 1.0
        || (v299.origin.CGFloat x = x,
            v299.origin.CGFloat y = y,
            v299.size.CGFloat width = width,
            v299.size.CGFloat height = height,
            CGRectGetMaxY(v299) < 0.0))
      {
LABEL_21:

        goto LABEL_22;
      }

      v301.origin.CGFloat x = x;
      v301.origin.CGFloat y = y;
      v301.size.CGFloat width = width;
      v301.size.CGFloat height = height;
      BOOL v165 = CGRectGetMaxY(v301) > 1.0;

      if (v165)
      {
LABEL_22:
        uint64_t v155 = VCPLogInstance(v153, v154);
        v156 = (os_log_s *)objc_claimAutoreleasedReturnValue(v155);
        if (os_log_type_enabled(v156, OS_LOG_TYPE_FAULT))
        {
          v158 = (void *)objc_claimAutoreleasedReturnValue([v8 asset]);
          v159 = (void *)objc_claimAutoreleasedReturnValue([v158 localIdentifier]);
          v160 = (void *)objc_claimAutoreleasedReturnValue([v9 saliencyRequest]);
          v161 = (void *)objc_claimAutoreleasedReturnValue([v160 results]);
          v162 = (void *)objc_claimAutoreleasedReturnValue([v161 firstObject]);
          [v162 boundingBox];
          v163 = NSStringFromRect(v300);
          v164 = (void *)objc_claimAutoreleasedReturnValue(v163);
          *(_DWORD *)buf = 138412546;
          v290 = v159;
          __int16 v291 = 2112;
          double v292 = *(double *)&v164;
          _os_log_fault_impl( (void *)&_mh_execute_header,  v156,  OS_LOG_TYPE_FAULT,  "[%@] Unnormalized saliencyRequest bounding box %@; skip",
            buf,
            0x16u);
        }

        goto LABEL_24;
      }

      v166 = (void *)objc_claimAutoreleasedReturnValue([v9 saliencyRequest]);
      v167 = (void *)objc_claimAutoreleasedReturnValue([v166 results]);
      v168 = (void *)objc_claimAutoreleasedReturnValue([v167 firstObject]);
      [v168 boundingBox];
      double v170 = v169;
      double v172 = v171;
      double v174 = v173;
      double v176 = v175;
      v177 = (void *)objc_claimAutoreleasedReturnValue([v8 results]);
      objc_msgSend(v177, "setPreferredCropRect:", v170, v172, v174, v176);

      v178 = (void *)objc_claimAutoreleasedReturnValue([v9 saliencyRequest]);
      v179 = (void *)objc_claimAutoreleasedReturnValue([v178 results]);
      v180 = (void *)objc_claimAutoreleasedReturnValue([v179 firstObject]);
      [v180 narrowedBoundingBox];
      CGFloat v181 = v302.origin.x;
      CGFloat v182 = v302.origin.y;
      CGFloat v183 = v302.size.width;
      CGFloat v184 = v302.size.height;
      if (CGRectGetMinX(v302) < 0.0) {
        goto LABEL_35;
      }
      v303.origin.CGFloat x = v181;
      v303.origin.CGFloat y = v182;
      v303.size.CGFloat width = v183;
      v303.size.CGFloat height = v184;
      if (CGRectGetMinX(v303) > 1.0) {
        goto LABEL_35;
      }
      v304.origin.CGFloat x = v181;
      v304.origin.CGFloat y = v182;
      v304.size.CGFloat width = v183;
      v304.size.CGFloat height = v184;
      if (CGRectGetMinY(v304) < 0.0) {
        goto LABEL_35;
      }
      v305.origin.CGFloat x = v181;
      v305.origin.CGFloat y = v182;
      v305.size.CGFloat width = v183;
      v305.size.CGFloat height = v184;
      if (CGRectGetMinY(v305) > 1.0) {
        goto LABEL_35;
      }
      v306.origin.CGFloat x = v181;
      v306.origin.CGFloat y = v182;
      v306.size.CGFloat width = v183;
      v306.size.CGFloat height = v184;
      if (CGRectGetMaxX(v306) < 0.0) {
        goto LABEL_35;
      }
      v307.origin.CGFloat x = v181;
      v307.origin.CGFloat y = v182;
      v307.size.CGFloat width = v183;
      v307.size.CGFloat height = v184;
      if (CGRectGetMaxX(v307) > 1.0
        || (v308.origin.CGFloat x = v181,
            v308.origin.CGFloat y = v182,
            v308.size.CGFloat width = v183,
            v308.size.CGFloat height = v184,
            CGRectGetMaxY(v308) < 0.0))
      {
LABEL_35:

        goto LABEL_36;
      }

      v310.origin.CGFloat x = v181;
      v310.origin.CGFloat y = v182;
      v310.size.CGFloat width = v183;
      v310.size.CGFloat height = v184;
      BOOL v195 = CGRectGetMaxY(v310) > 1.0;

      if (v195)
      {
LABEL_36:
        uint64_t v187 = VCPLogInstance(v185, v186);
        v156 = (os_log_s *)objc_claimAutoreleasedReturnValue(v187);
        if (os_log_type_enabled(v156, OS_LOG_TYPE_FAULT))
        {
          v188 = (void *)objc_claimAutoreleasedReturnValue([v8 asset]);
          v189 = (void *)objc_claimAutoreleasedReturnValue([v188 localIdentifier]);
          v190 = (void *)objc_claimAutoreleasedReturnValue([v9 saliencyRequest]);
          v191 = (void *)objc_claimAutoreleasedReturnValue([v190 results]);
          v192 = (void *)objc_claimAutoreleasedReturnValue([v191 firstObject]);
          [v192 narrowedBoundingBox];
          v193 = NSStringFromRect(v309);
          v194 = (void *)objc_claimAutoreleasedReturnValue(v193);
          *(_DWORD *)buf = 138412546;
          v290 = v189;
          __int16 v291 = 2112;
          double v292 = *(double *)&v194;
          _os_log_fault_impl( (void *)&_mh_execute_header,  v156,  OS_LOG_TYPE_FAULT,  "[%@] Unnormalized saliencyRequest narrowed bounding box %@; skip",
            buf,
            0x16u);
        }

        goto LABEL_24;
      }

      v196 = (void *)objc_claimAutoreleasedReturnValue([v9 saliencyRequest]);
      v197 = (void *)objc_claimAutoreleasedReturnValue([v196 results]);
      v198 = (void *)objc_claimAutoreleasedReturnValue([v197 firstObject]);
      [v198 narrowedBoundingBox];
      double v200 = v199;
      double v202 = v201;
      double v204 = v203;
      double v206 = v205;
      v207 = (void *)objc_claimAutoreleasedReturnValue([v8 results]);
      objc_msgSend(v207, "setAcceptableCropRect:", v200, v202, v204, v206);

      if (+[VCPPreAnalysisRequests includeSO](&OBJC_CLASS___VCPPreAnalysisRequests, "includeSO"))
      {
        v208 = (void *)objc_claimAutoreleasedReturnValue([v9 saliencyObjectnessRequest]);
        v209 = (void *)objc_claimAutoreleasedReturnValue([v208 results]);
        BOOL v210 = [v209 count] == (id)1;

        if (!v210) {
          goto LABEL_85;
        }
        v211 = (void *)objc_claimAutoreleasedReturnValue([v9 saliencyObjectnessRequest]);
        v212 = (void *)objc_claimAutoreleasedReturnValue([v211 results]);
        v213 = (void *)objc_claimAutoreleasedReturnValue([v212 firstObject]);
        v272 = (void *)objc_claimAutoreleasedReturnValue([v213 salientObjects]);

        v214 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
        __int128 v285 = 0u;
        __int128 v286 = 0u;
        __int128 v283 = 0u;
        __int128 v284 = 0u;
        v156 = v272;
        id v215 = -[os_log_s countByEnumeratingWithState:objects:count:]( v156,  "countByEnumeratingWithState:objects:count:",  &v283,  v288,  16LL);
        if (v215)
        {
          uint64_t v275 = *(void *)v284;
LABEL_43:
          uint64_t v216 = 0LL;
          while (1)
          {
            if (*(void *)v284 != v275) {
              objc_enumerationMutation(v156);
            }
            v217 = *(void **)(*((void *)&v283 + 1) + 8 * v216);
            [v217 boundingBox];
            CGFloat v218 = v311.origin.x;
            CGFloat v219 = v311.origin.y;
            CGFloat v220 = v311.size.width;
            CGFloat v221 = v311.size.height;
            if (CGRectGetMinX(v311) < 0.0) {
              goto LABEL_88;
            }
            v312.origin.CGFloat x = v218;
            v312.origin.CGFloat y = v219;
            v312.size.CGFloat width = v220;
            v312.size.CGFloat height = v221;
            if (CGRectGetMinX(v312) > 1.0) {
              goto LABEL_88;
            }
            v313.origin.CGFloat x = v218;
            v313.origin.CGFloat y = v219;
            v313.size.CGFloat width = v220;
            v313.size.CGFloat height = v221;
            if (CGRectGetMinY(v313) < 0.0) {
              goto LABEL_88;
            }
            v314.origin.CGFloat x = v218;
            v314.origin.CGFloat y = v219;
            v314.size.CGFloat width = v220;
            v314.size.CGFloat height = v221;
            if (CGRectGetMinY(v314) > 1.0) {
              goto LABEL_88;
            }
            v315.origin.CGFloat x = v218;
            v315.origin.CGFloat y = v219;
            v315.size.CGFloat width = v220;
            v315.size.CGFloat height = v221;
            if (CGRectGetMaxX(v315) < 0.0) {
              goto LABEL_88;
            }
            v316.origin.CGFloat x = v218;
            v316.origin.CGFloat y = v219;
            v316.size.CGFloat width = v220;
            v316.size.CGFloat height = v221;
            if (CGRectGetMaxX(v316) > 1.0) {
              goto LABEL_88;
            }
            v317.origin.CGFloat x = v218;
            v317.origin.CGFloat y = v219;
            v317.size.CGFloat width = v220;
            v317.size.CGFloat height = v221;
            if (CGRectGetMaxY(v317) < 0.0
              || (v318.origin.CGFloat x = v218,
                  v318.origin.CGFloat y = v219,
                  v318.size.CGFloat width = v220,
                  v318.size.CGFloat height = v221,
                  CGRectGetMaxY(v318) > 1.0))
            {
LABEL_88:
              uint64_t v265 = VCPLogInstance(v222, v223);
              v266 = (os_log_s *)objc_claimAutoreleasedReturnValue(v265);
              if (os_log_type_enabled(v266, OS_LOG_TYPE_FAULT))
              {
                v267 = (void *)objc_claimAutoreleasedReturnValue([v8 asset]);
                v268 = (void *)objc_claimAutoreleasedReturnValue([v267 localIdentifier]);
                [v217 boundingBox];
                v269 = NSStringFromRect(v319);
                v270 = (void *)objc_claimAutoreleasedReturnValue(v269);
                *(_DWORD *)buf = 138412546;
                v290 = v268;
                __int16 v291 = 2112;
                double v292 = *(double *)&v270;
                _os_log_fault_impl( (void *)&_mh_execute_header,  v266,  OS_LOG_TYPE_FAULT,  "[%@] Unnormalized salientObject bounding box %@; skip",
                  buf,
                  0x16u);
              }

              goto LABEL_24;
            }

            [v217 boundingBox];
            v224 = (void *)objc_claimAutoreleasedReturnValue(+[NSValue valueWithRect:](&OBJC_CLASS___NSValue, "valueWithRect:"));
            [v214 addObject:v224];

            if (v215 == (id)++v216)
            {
              id v215 = -[os_log_s countByEnumeratingWithState:objects:count:]( v156,  "countByEnumeratingWithState:objects:count:",  &v283,  v288,  16LL);
              if (v215) {
                goto LABEL_43;
              }
              break;
            }
          }
        }

        v225 = (void *)objc_claimAutoreleasedReturnValue([v8 results]);
        [v225 setObjectSaliencyRects:v214];
      }

      v226 = (void *)objc_claimAutoreleasedReturnValue([v9 sceneprintRequest]);
      v227 = (void *)objc_claimAutoreleasedReturnValue([v226 results]);
      BOOL v228 = [v227 count] == (id)1;

      if (v228)
      {
        v229 = (void *)objc_claimAutoreleasedReturnValue([v9 sceneprintRequest]);
        v230 = (void *)objc_claimAutoreleasedReturnValue([v229 results]);
        v231 = (void *)objc_claimAutoreleasedReturnValue([v230 firstObject]);
        v232 = (void *)objc_claimAutoreleasedReturnValue([v231 sceneprints]);
        v156 = (os_log_s *)objc_claimAutoreleasedReturnValue([v232 firstObject]);

        if (-[os_log_s elementType](v156, "elementType") != (id)1) {
          goto LABEL_24;
        }
        if (-[os_log_s elementCount](v156, "elementCount") != (id)768) {
          goto LABEL_24;
        }
        v233 = (void *)objc_claimAutoreleasedReturnValue(-[os_log_s descriptorData](v156, "descriptorData"));
        BOOL v234 = [v233 length] == (id)3072;

        if (!v234) {
          goto LABEL_24;
        }
        v235 = (void *)objc_claimAutoreleasedReturnValue( +[NSKeyedArchiver archivedDataWithRootObject:requiringSecureCoding:error:]( &OBJC_CLASS___NSKeyedArchiver,  "archivedDataWithRootObject:requiringSecureCoding:error:",  v156,  1LL,  0LL));
        v236 = (void *)objc_claimAutoreleasedReturnValue([v8 results]);
        [v236 setSceneprintData:v235];

        if (+[VCPPreAnalysisRequests includePA](&OBJC_CLASS___VCPPreAnalysisRequests, "includePA"))
        {
          v237 = (void *)objc_claimAutoreleasedReturnValue([v9 adjustmentsRequest]);
          v238 = (void *)objc_claimAutoreleasedReturnValue([v237 results]);
          BOOL v239 = [v238 count] == 0;

          if (v239) {
            goto LABEL_24;
          }
          v240 = (void *)objc_claimAutoreleasedReturnValue([v9 adjustmentsRequest]);
          v241 = (void *)objc_claimAutoreleasedReturnValue([v240 results]);
          v276 = (void *)objc_claimAutoreleasedReturnValue([v241 objectAtIndexedSubscript:0]);

          v273 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
          __int128 v281 = 0u;
          __int128 v282 = 0u;
          __int128 v279 = 0u;
          __int128 v280 = 0u;
          id obj = (id)objc_claimAutoreleasedReturnValue([v276 adjustmentKeys]);
          id v242 = [obj countByEnumeratingWithState:&v279 objects:v287 count:16];
          if (v242)
          {
            uint64_t v243 = *(void *)v280;
            do
            {
              for (unint64_t i = 0LL; i != v242; unint64_t i = (char *)i + 1)
              {
                if (*(void *)v280 != v243) {
                  objc_enumerationMutation(obj);
                }
                uint64_t v245 = *(void *)(*((void *)&v279 + 1) + 8LL * (void)i);
                v246 = (void *)objc_claimAutoreleasedReturnValue([v276 adjustmentValuesForKey:v245]);
                [v273 setObject:v246 forKeyedSubscript:v245];
              }

              id v242 = [obj countByEnumeratingWithState:&v279 objects:v287 count:16];
            }

            while (v242);
          }

          uint64_t v247 = PHAssetMediaAnalysisDataWithColorNormalizationDictionaryAndRevision(v273, 0LL);
          v248 = (void *)objc_claimAutoreleasedReturnValue(v247);
          v249 = (void *)objc_claimAutoreleasedReturnValue([v8 results]);
          [v249 setColorNormalizationData:v248];
        }

        v250 = (void *)objc_claimAutoreleasedReturnValue([v9 imagefingerprintsRequest]);
        BOOL v252 = (v11 & 1) == 0 && v250 != 0LL;

        if (!v252) {
          goto LABEL_97;
        }
        v253 = (void *)objc_claimAutoreleasedReturnValue([v9 imagefingerprintsRequest]);
        v254 = (void *)objc_claimAutoreleasedReturnValue([v253 results]);

        if ([v254 count])
        {
          v255 = (void *)objc_claimAutoreleasedReturnValue([v254 firstObject]);
          v256 = (void *)objc_claimAutoreleasedReturnValue([v255 fingerprintHashes]);

          if (v256 && [v256 count] == (id)2)
          {
            v257 = (void *)objc_claimAutoreleasedReturnValue([v256 objectAtIndexedSubscript:0]);
            v277 = (void *)objc_claimAutoreleasedReturnValue([v257 hashData]);

            if ([v277 length] == (id)24)
            {
              v258 = (void *)objc_claimAutoreleasedReturnValue([v256 objectAtIndexedSubscript:1]);
              v259 = (void *)objc_claimAutoreleasedReturnValue([v258 hashData]);

              if ([v259 length] == (id)24)
              {
                v274 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableData dataWithBytes:length:]( &OBJC_CLASS___NSMutableData,  "dataWithBytes:length:",  &unk_10019788C,  1LL));
                [v274 appendData:v259];
                id v260 = v274;

                v261 = (void *)objc_claimAutoreleasedReturnValue([v8 results]);
                [v261 setDuplicateMatchingFeature:v277];

                v262 = (void *)objc_claimAutoreleasedReturnValue([v8 results]);
                [v262 setDuplicateMatchingAlternateFeature:v260];

                int v263 = 0;
                v259 = v260;
              }

              else
              {
                int v263 = 1;
              }
            }

            else
            {
              int v263 = 1;
            }

            if (v263) {
              goto LABEL_24;
            }
LABEL_97:
            int v157 = 0;
            goto LABEL_25;
          }
        }

        else
        {
        }

- (int)_performSceneNetAnalysisForAssetEntry:(id)a3 withImage:(id)a4 andRequests:(id)a5
{
  id v7 = a3;
  id v142 = a4;
  v137 = v7;
  id v138 = a5;
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 asset]);
  id v9 = objc_msgSend(v8, "vcp_abnormalImageDimensionForSceneNet");

  if (!v9)
  {
    CFTypeRef cf = 0LL;
    __int128 v156 = 0u;
    __int128 v157 = 0u;
    __int128 v154 = 0u;
    __int128 v155 = 0u;
    v141 = (void *)objc_claimAutoreleasedReturnValue([v138 mapAvailableRequestsToResolution]);
    __int128 v54 = (VNImageRequestHandler *)objc_claimAutoreleasedReturnValue([v141 allKeys]);
    id v55 = 0LL;
    id v56 = -[VNImageRequestHandler countByEnumeratingWithState:objects:count:]( v54,  "countByEnumeratingWithState:objects:count:",  &v154,  v161,  16LL);
    if (v56)
    {
      uint64_t v139 = *(void *)v155;
      *(void *)&__int128 v57 = 67109376LL;
      __int128 v135 = v57;
      id obj = v54;
      while (2)
      {
        double v58 = 0LL;
        int v59 = v55;
        do
        {
          if (*(void *)v155 != v139) {
            objc_enumerationMutation(obj);
          }
          int v60 = *(void **)(*((void *)&v154 + 1) + 8LL * (void)v58);
          if (+[VCPPreAnalysisRequests isDimensionUnknown:]( &OBJC_CLASS___VCPPreAnalysisRequests,  "isDimensionUnknown:",  v60,  v135))
          {
            double Width = (double)CVPixelBufferGetWidth((CVPixelBufferRef)[v142 sourcePixelBuffer]);
            double Height = (double)CVPixelBufferGetHeight((CVPixelBufferRef)[v142 sourcePixelBuffer]);
            block[0] = _NSConcreteStackBlock;
            block[1] = 3221225472LL;
            block[2] = sub_10002634C;
            block[3] = &unk_1001BA6C0;
            id v150 = v141;
            v151 = v60;
            double v152 = Width;
            double v153 = Height;
            if (qword_1001E6430 != -1) {
              dispatch_once(&qword_1001E6430, block);
            }
          }

          else
          {
            [v60 sizeValue];
            double Width = v63;
            double Height = v64;
          }

          if (cf)
          {
            CFRelease(cf);
            CFTypeRef cf = 0LL;
          }

          LODWORD(v54) = [v142 pixelBuffer:&cf width:(unint64_t)Width height:(unint64_t)Height];
          if ((_DWORD)v54)
          {
            id v55 = v59;
LABEL_66:

            char v91 = 0;
            __int128 v52 = 0LL;
            goto LABEL_103;
          }

          double v65 = objc_alloc(&OBJC_CLASS___VNImageRequestHandler);
          __int128 v54 = -[VNImageRequestHandler initWithCVPixelBuffer:options:session:]( v65,  "initWithCVPixelBuffer:options:session:",  cf,  &__NSDictionary0__struct,  self->_session);
          double v66 = (void *)objc_claimAutoreleasedReturnValue([v141 objectForKeyedSubscript:v60]);
          if ([v66 count] == (id)1)
          {
            v145[0] = _NSConcreteStackBlock;
            v145[1] = 3221225472LL;
            v145[2] = sub_100026458;
            v145[3] = &unk_1001BA508;
            id v146 = v66;
            double v147 = Width;
            double v148 = Height;
            if (qword_1001E6438 != -1) {
              dispatch_once(&qword_1001E6438, v145);
            }
          }

          uint64_t v67 = VCPSignPostLog();
          int v68 = (os_log_s *)objc_claimAutoreleasedReturnValue(v67);
          os_signpost_id_t v69 = os_signpost_id_generate(v68);

          uint64_t v70 = VCPSignPostLog();
          int v71 = (os_log_s *)objc_claimAutoreleasedReturnValue(v70);
          int v72 = v71;
          if (v69 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v71))
          {
            *(_DWORD *)buf = v135;
            *(_DWORD *)v163 = (int)Width;
            *(_WORD *)&v163[4] = 1024;
            *(_DWORD *)&v163[6] = (int)Height;
            _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v72,  OS_SIGNPOST_INTERVAL_BEGIN,  v69,  "VNImageRequestHandler_PerformRequests",  "%dx%d",  buf,  0xEu);
          }

          id v144 = v59;
          unsigned __int8 v73 = -[VNImageRequestHandler performRequests:error:](v54, "performRequests:error:", v66, &v144);
          id v55 = v144;

          uint64_t v74 = VCPSignPostLog();
          int v75 = (os_log_s *)objc_claimAutoreleasedReturnValue(v74);
          int v76 = v75;
          if (v69 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v75))
          {
            *(_DWORD *)buf = v135;
            *(_DWORD *)v163 = (int)Width;
            *(_WORD *)&v163[4] = 1024;
            *(_DWORD *)&v163[6] = (int)Height;
            _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v76,  OS_SIGNPOST_INTERVAL_END,  v69,  "VNImageRequestHandler_PerformRequests",  "%dx%d",  buf,  0xEu);
          }

          if ((v73 & 1) == 0)
          {
            uint64_t v86 = MediaAnalysisLogLevel(v77, v78);
            if ((int)v86 >= 3)
            {
              uint64_t v88 = VCPLogInstance(v86, v87);
              __int16 v89 = (os_log_s *)objc_claimAutoreleasedReturnValue(v88);
              os_log_type_t v90 = VCPLogToOSLogType[3];
              if (os_log_type_enabled(v89, v90))
              {
                *(_DWORD *)buf = 138412290;
                *(void *)v163 = v55;
                _os_log_impl( (void *)&_mh_execute_header,  v89,  v90,  "Failed to run VNImageRequestHandler::performRequests: %@",  buf,  0xCu);
              }
            }

            LODWORD(v54) = -18;
            goto LABEL_66;
          }

          double v58 = (char *)v58 + 1;
          int v59 = v55;
        }

        while (v56 != v58);
        __int128 v54 = obj;
        id v56 = -[VNImageRequestHandler countByEnumeratingWithState:objects:count:]( obj,  "countByEnumeratingWithState:objects:count:",  &v154,  v161,  16LL);
        if (v56) {
          continue;
        }
        break;
      }
    }

    if (!+[VCPPreAnalysisRequests includeIVS](&OBJC_CLASS___VCPPreAnalysisRequests, "includeIVS"))
    {
      __int128 v52 = 0LL;
      goto LABEL_102;
    }

    int v79 = objc_autoreleasePoolPush();
    if (cf)
    {
      CFRelease(cf);
      CFTypeRef cf = 0LL;
    }

    LODWORD(v54) = [v142 pixelBuffer:&cf width:299 height:299];
    if ((_DWORD)v54)
    {
      __int128 v52 = 0LL;
      int v80 = 1;
      goto LABEL_100;
    }

    double v98 = (void *)objc_claimAutoreleasedReturnValue(-[VCPObjectPool getObject](self->_ivsPool, "getObject"));
    int v99 = (void *)objc_claimAutoreleasedReturnValue([v98 object]);
    BOOL v100 = v99 == 0LL;

    if (v100)
    {
      uint64_t v124 = MediaAnalysisLogLevel(v101, v102);
      if ((int)v124 < 3)
      {
        __int128 v52 = 0LL;
        int v80 = 1;
        goto LABEL_99;
      }

      uint64_t v126 = VCPLogInstance(v124, v125);
      double v110 = (os_log_s *)objc_claimAutoreleasedReturnValue(v126);
      os_log_type_t v127 = VCPLogToOSLogType[3];
      if (os_log_type_enabled(v110, v127))
      {
        int v128 = (void *)objc_opt_class(&OBJC_CLASS___SCMLHandler);
        *(_DWORD *)buf = 138412290;
        *(void *)v163 = v128;
        id v129 = v128;
        _os_log_impl((void *)&_mh_execute_header, v110, v127, "%@ unavailable for IVS", buf, 0xCu);
      }

      __int128 v52 = 0LL;
      int v80 = 1;
    }

    else
    {
      uint64_t v103 = VCPSignPostLog();
      int v104 = (os_log_s *)objc_claimAutoreleasedReturnValue(v103);
      os_signpost_id_t v105 = os_signpost_id_generate(v104);

      uint64_t v106 = VCPSignPostLog();
      int v107 = (os_log_s *)objc_claimAutoreleasedReturnValue(v106);
      int v108 = v107;
      if (v105 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v107))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v108,  OS_SIGNPOST_INTERVAL_BEGIN,  v105,  "CommSafetyHandler_IVS",  (const char *)&unk_100199097,  buf,  2u);
      }

      v109 = (void *)objc_claimAutoreleasedReturnValue([v98 object]);
      id v143 = v55;
      double v110 = (os_log_s *)objc_claimAutoreleasedReturnValue([v109 analyzePixelBuffer:cf error:&v143]);
      id v111 = v143;

      uint64_t v112 = VCPSignPostLog();
      v113 = (os_log_s *)objc_claimAutoreleasedReturnValue(v112);
      double v114 = v113;
      if (v105 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v113))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v114,  OS_SIGNPOST_INTERVAL_END,  v105,  "CommSafetyHandler_IVS",  (const char *)&unk_100199097,  buf,  2u);
      }

      if (v111)
      {
        uint64_t v117 = MediaAnalysisLogLevel(v115, v116);
        if ((int)v117 >= 3)
        {
          uint64_t v119 = VCPLogInstance(v117, v118);
          int v120 = (os_log_s *)objc_claimAutoreleasedReturnValue(v119);
          os_log_type_t v121 = VCPLogToOSLogType[3];
          if (os_log_type_enabled(v120, v121))
          {
            double v122 = (void *)objc_opt_class(&OBJC_CLASS___SCMLHandler);
            *(_DWORD *)buf = 138412546;
            *(void *)v163 = v122;
            *(_WORD *)&v163[8] = 2112;
            id v164 = v111;
            id v123 = v122;
            _os_log_impl( (void *)&_mh_execute_header,  v120,  v121,  "Failed to run %@::analyzePixelBuffer:error: %@",  buf,  0x16u);
          }
        }

        __int128 v52 = 0LL;
        int v80 = 1;
      }

      else
      {
        __int128 v52 = (void *)objc_claimAutoreleasedReturnValue(-[os_log_s scoresForLabels](v110, "scoresForLabels"));
        int v80 = 0;
      }

      id v55 = v111;
    }

LABEL_99:
    LODWORD(v54) = -18;
LABEL_100:
    objc_autoreleasePoolPop(v79);
    if (v80)
    {
      char v91 = 0;
      goto LABEL_103;
    }

- (int)_performBlurAnalysisForAssetEntry:(id)a3 withLumaPixelBuffer:(__CVBuffer *)a4
{
  id v6 = a3;
  id v7 = v6;
  if (a4)
  {
    uint64_t v8 = VCPSignPostLog();
    id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
    os_signpost_id_t v10 = os_signpost_id_generate(v9);

    uint64_t v11 = VCPSignPostLog();
    uint64_t v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
    os_signpost_id_t v13 = v12;
    if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v12))
    {
      LOWORD(buf.data) = 0;
      _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v13,  OS_SIGNPOST_INTERVAL_BEGIN,  v10,  "VCPSceneAnalyzerImageBlurAnalysis",  (const char *)&unk_100199097,  (uint8_t *)&buf,  2u);
    }

    id v14 = +[VCPPreAnalysisRequests sharpnessRevision](&OBJC_CLASS___VCPPreAnalysisRequests, "sharpnessRevision");
    id v15 = objc_alloc(&OBJC_CLASS___VCPImageBlurAnalyzer);
    uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue([v7 asset]);
    id v71 = objc_msgSend(v15, "initWithFaceResults:sdof:revision:", 0, objc_msgSend(v16, "vcp_isSdofPhoto"), v14);

    uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue([v7 asset]);
    LOBYTE(v14) = objc_msgSend(v17, "vcp_abnormalImageDimensionForSceneNet") == 0;

    if ((v14 & 1) != 0)
    {
      id v72 = 0LL;
      int v24 = [v71 analyzePixelBuffer:a4 flags:0 results:&v72 cancel:&stru_1001BA700];
      id v25 = v72;
      id v26 = v25;
      if (!v24)
      {
        float v27 = (void *)objc_claimAutoreleasedReturnValue([v25 objectForKeyedSubscript:MediaAnalysisBlurResultsKey]);
        BOOL v28 = (void *)objc_claimAutoreleasedReturnValue([v27 objectAtIndexedSubscript:0]);
        uint64_t v29 = (void *)objc_claimAutoreleasedReturnValue([v28 objectForKeyedSubscript:MediaAnalysisResultAttributesKey]);

        uint64_t v30 = (void *)objc_claimAutoreleasedReturnValue([v29 objectForKeyedSubscript:MediaAnalysisResultSharpnessAttributeKey]);
        [v30 floatValue];
        float v32 = v31;

        os_signpost_id_t v33 = (void *)objc_claimAutoreleasedReturnValue([v7 results]);
        uint64_t v34 = v33;
        LODWORD(v35) = 1.0;
        if (v32 < 1.0) {
          *(float *)&double v35 = v32;
        }
        if (v32 <= 0.0) {
          *(float *)&double v35 = 0.0;
        }
        [v33 setBlurrinessScore:v35];

LABEL_40:
        uint64_t v45 = VCPSignPostLog();
        uint64_t v46 = (os_log_s *)objc_claimAutoreleasedReturnValue(v45);
        uint64_t v47 = v46;
        if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v46))
        {
          LOWORD(buf.data) = 0;
          _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v47,  OS_SIGNPOST_INTERVAL_END,  v10,  "VCPSceneAnalyzerImageBlurAnalysis",  (const char *)&unk_100199097,  (uint8_t *)&buf,  2u);
        }

        int v24 = 0;
      }
    }

    else
    {
      size_t Width = CVPixelBufferGetWidth(a4);
      size_t Height = CVPixelBufferGetHeight(a4);
      size_t v20 = Height;
      if (Width <= Height) {
        size_t v21 = Height / Width;
      }
      else {
        size_t v21 = Width / Height;
      }
      uint64_t v81 = 0LL;
      int v24 = -[VCPPoolBasedPixelBufferCreator createPixelBuffer:]( self->_monochromeBufferCreator,  "createPixelBuffer:",  &v81);
      if (!v24)
      {
        CVPixelBufferRef v79 = a4;
        CVPixelBufferLockFlags v80 = 1LL;
        int v24 = CVPixelBufferLockBaseAddress(a4, 1uLL);
        LODWORD(v78) = v24;
        if (!v24
          || os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)
          && (LODWORD(buf.data) = 134218240,
              *(void **)((char *)&buf.data + 4) = v79,
              WORD2(buf.height) = 1024,
              *(_DWORD *)((char *)&buf.height + 6) = v24,
              _os_log_error_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_ERROR,  "Failed to lock CVPixelBuffer (%p, %d)",  (uint8_t *)&buf,  0x12u),  (int v24 = v78) == 0))
        {
          LODWORD(v75) = 0;
          CVPixelBufferRef pixelBuffer = v81;
          CVPixelBufferLockFlags unlockFlags = 0LL;
          if (v81)
          {
            int v24 = CVPixelBufferLockBaseAddress(v81, 0LL);
            LODWORD(v75) = v24;
            if (v24)
            {
              if (!os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)
                || (LODWORD(buf.data) = 134218240,
                    *(void **)((char *)&buf.data + 4) = pixelBuffer,
                    WORD2(buf.height) = 1024,
                    *(_DWORD *)((char *)&buf.height + 6) = v24,
                    _os_log_error_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_ERROR,  "Failed to lock CVPixelBuffer (%p, %d)",  (uint8_t *)&buf,  0x12u),  (int v24 = v75) != 0))
              {
                id v26 = 0LL;
LABEL_25:
                char v36 = 0;
                goto LABEL_29;
              }
            }

            BaseAddress = (char *)CVPixelBufferGetBaseAddress(a4);
            size_t BytesPerRow = CVPixelBufferGetBytesPerRow(a4);
            if (v21)
            {
              id v50 = 0LL;
              unint64_t v70 = 0LL;
              uint64_t v51 = BytesPerRow;
              if (Width > v20) {
                uint64_t v51 = 1LL;
              }
              uint64_t v67 = MediaAnalysisBlurResultsKey;
              uint64_t v66 = MediaAnalysisResultAttributesKey;
              uint64_t v65 = MediaAnalysisResultSharpnessAttributeKey;
              vImagePixelCount v68 = kVCPMAPreAnalysisScaledSize;
              uint64_t v64 = v51 * kVCPMAPreAnalysisScaledSize;
              float v52 = 0.0;
              while (1)
              {
                buf.data = BaseAddress;
                buf.CGFloat height = v68;
                buf.CGFloat width = v68;
                buf.rowBytes = BytesPerRow;
                dest.data = CVPixelBufferGetBaseAddress(v81);
                dest.CGFloat height = CVPixelBufferGetHeight(v81);
                dest.CGFloat width = CVPixelBufferGetWidth(v81);
                dest.rowBytes = CVPixelBufferGetBytesPerRow(v81);
                int v24 = vImageScale_Planar8(&buf, &dest, 0LL, 0);
                if (v24) {
                  break;
                }
                id v73 = v50;
                int v24 = [v71 analyzePixelBuffer:v81 flags:0 results:&v73 cancel:&stru_1001BA6E0];
                id v26 = v73;

                if (v24) {
                  goto LABEL_25;
                }
                int v53 = (void *)objc_claimAutoreleasedReturnValue([v26 objectForKeyedSubscript:v67]);
                __int128 v54 = (void *)objc_claimAutoreleasedReturnValue([v53 objectAtIndexedSubscript:0]);
                id v55 = (void *)objc_claimAutoreleasedReturnValue([v54 objectForKeyedSubscript:v66]);

                id v56 = (void *)objc_claimAutoreleasedReturnValue([v55 objectForKeyedSubscript:v65]);
                __int128 v57 = v56;
                if (v56)
                {
                  [v56 floatValue];
                  float v52 = v52 + v58;
                  ++v70;
                }

                BaseAddress += v64;
                id v50 = v26;
                if (!--v21) {
                  goto LABEL_58;
                }
              }

              id v26 = v50;
              goto LABEL_25;
            }

            unint64_t v70 = 0LL;
            id v26 = 0LL;
            float v52 = 0.0;
LABEL_58:
            int v24 = sub_100026E48(&v75);
            if (v24) {
              goto LABEL_25;
            }
            int v24 = sub_100026E48(&v78);
            if (v24) {
              goto LABEL_25;
            }
            int v59 = (void *)objc_claimAutoreleasedReturnValue([v7 results]);
            int v60 = v59;
            *(float *)&double v61 = v52 / (float)v70;
            float v62 = 1.0;
            BOOL v63 = *(float *)&v61 > 0.0;
            LODWORD(v61) = 0;
            if (v63) {
              *(float *)&double v61 = v62;
            }
            [v59 setBlurrinessScore:v61];

            int v24 = 0;
            char v36 = 1;
          }

          else
          {
            BOOL v37 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
            if (v37) {
              sub_10002C480(v37, v38, v39, v40, v41, v42, v43, v44);
            }
            id v26 = 0LL;
            char v36 = 0;
            int v24 = -50;
            LODWORD(v75) = -50;
          }

- (int)_performExposureAnalysisForAssetEntry:(id)a3 withLumaPixelBuffer:(__CVBuffer *)a4
{
  id v5 = a3;
  id v6 = v5;
  if (a4)
  {
    uint64_t v7 = VCPSignPostLog();
    uint64_t v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
    os_signpost_id_t v9 = os_signpost_id_generate(v8);

    uint64_t v10 = VCPSignPostLog();
    uint64_t v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
    uint64_t v12 = v11;
    if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v11))
    {
      *(_WORD *)vImage_Buffer buf = 0;
      _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v12,  OS_SIGNPOST_INTERVAL_BEGIN,  v9,  "VCPSceneAnalyzerExposureAnalysis",  (const char *)&unk_100199097,  buf,  2u);
    }

    id v13 = objc_alloc_init(&OBJC_CLASS___VCPImageExposurePreAnalyzer);
    id v31 = 0LL;
    int v14 = [v13 analyzePixelBuffer:a4 flags:0 results:&v31 cancel:&stru_1001BA720];
    id v15 = v31;
    if (!v14)
    {
      uint64_t v16 = VCPSignPostLog();
      uint64_t v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);
      unsigned __int8 v18 = v17;
      if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v17))
      {
        *(_WORD *)uint64_t v30 = 0;
        _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v18,  OS_SIGNPOST_INTERVAL_END,  v9,  "VCPSceneAnalyzerExposureAnalysis",  (const char *)&unk_100199097,  v30,  2u);
      }

      id v19 = (void *)objc_claimAutoreleasedReturnValue([v15 objectForKeyedSubscript:MediaAnalysisExposureResultsKey]);
      size_t v20 = (void *)objc_claimAutoreleasedReturnValue([v19 objectAtIndexedSubscript:0]);
      size_t v21 = (void *)objc_claimAutoreleasedReturnValue([v20 objectForKeyedSubscript:MediaAnalysisResultQualityKey]);
      [v21 floatValue];
      float v23 = v22;

      int v24 = (void *)objc_claimAutoreleasedReturnValue([v6 results]);
      id v25 = v24;
      LODWORD(v26) = 1.0;
      if (v23 < 1.0) {
        *(float *)&double v26 = v23;
      }
      if (v23 <= 0.0) {
        *(float *)&double v26 = 0.0;
      }
      [v24 setExposureScore:v26];
    }
  }

  else
  {
    float v27 = (void *)objc_claimAutoreleasedReturnValue([v5 results]);
    LODWORD(v28) = 0.5;
    [v27 setExposureScore:v28];

    int v14 = 0;
  }

  return v14;
}

- (int)_performRotationAnalysisForAssetEntry:(id)a3 withColorPixelBuffer:(__CVBuffer *)a4
{
  id v6 = a3;
  uint64_t v7 = v6;
  if (!a4)
  {
    id v15 = (void *)objc_claimAutoreleasedReturnValue([v6 results]);
    [v15 setProbableRotationDirection:1];

    uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue([v7 results]);
    LODWORD(v17) = 0;
    [v16 setProbableRotationDirectionConfidence:v17];

    int v14 = 0;
    goto LABEL_9;
  }

  uint64_t v8 = VCPSignPostLog();
  os_signpost_id_t v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
  os_signpost_id_t v10 = os_signpost_id_generate(v9);

  uint64_t v11 = VCPSignPostLog();
  uint64_t v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
  id v13 = v12;
  if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v12))
  {
    LOWORD(buf.data) = 0;
    _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v13,  OS_SIGNPOST_INTERVAL_BEGIN,  v10,  "VCPSceneAnalyzerRotationAnalysisScaling",  (const char *)&unk_100199097,  (uint8_t *)&buf,  2u);
  }

  CVPixelBufferRef pixelBuffer = 0LL;
  -[VCPPoolBasedPixelBufferCreator createPixelBuffer:](self->_rotationBufferCreator, "createPixelBuffer:", &pixelBuffer);
  CVPixelBufferRef v69 = a4;
  CVPixelBufferLockFlags unlockFlags = 1LL;
  int v14 = CVPixelBufferLockBaseAddress(a4, 1uLL);
  LODWORD(v68) = v14;
  if (!v14
    || os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)
    && (LODWORD(buf.data) = 134218240,
        *(void **)((char *)&buf.data + 4) = v69,
        WORD2(buf.height) = 1024,
        *(_DWORD *)((char *)&buf.height + 6) = v14,
        _os_log_error_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_ERROR,  "Failed to lock CVPixelBuffer (%p, %d)",  (uint8_t *)&buf,  0x12u),  (int v14 = v68) == 0))
  {
    buf.data = CVPixelBufferGetBaseAddress(a4);
    buf.CGFloat height = CVPixelBufferGetHeight(a4);
    buf.CGFloat width = CVPixelBufferGetWidth(a4);
    buf.rowBytes = CVPixelBufferGetBytesPerRow(a4);
    LODWORD(v65) = 0;
    CVPixelBufferRef v66 = pixelBuffer;
    CVPixelBufferLockFlags v67 = 0LL;
    if (!pixelBuffer)
    {
      BOOL v50 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
      if (v50) {
        sub_10002C480(v50, v51, v52, v53, v54, v55, v56, v57);
      }
      int v14 = -50;
      goto LABEL_36;
    }

    int v14 = CVPixelBufferLockBaseAddress(pixelBuffer, 0LL);
    LODWORD(v65) = v14;
    if (v14)
    {
      if (!os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)
        || (LODWORD(v72.data) = 134218240,
            *(void **)((char *)&v72.data + 4) = v66,
            WORD2(v72.height) = 1024,
            *(_DWORD *)((char *)&v72.height + 6) = v14,
            _os_log_error_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_ERROR,  "Failed to lock CVPixelBuffer (%p, %d)",  (uint8_t *)&v72,  0x12u),  (int v14 = v65) != 0))
      {
LABEL_36:
        if (v69
          && !(_DWORD)v68
          && CVPixelBufferUnlockBaseAddress(v69, unlockFlags)
          && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
        {
          sub_10002C418();
        }

        goto LABEL_7;
      }
    }

    v72.data = CVPixelBufferGetBaseAddress(pixelBuffer);
    v72.CGFloat height = CVPixelBufferGetHeight(pixelBuffer);
    v72.CGFloat width = CVPixelBufferGetWidth(pixelBuffer);
    v72.rowBytes = CVPixelBufferGetBytesPerRow(pixelBuffer);
    int v14 = vImageScale_ARGB8888(&buf, &v72, 0LL, 0x20u);
    if (v14 || (int v14 = sub_100026E48(&v65)) != 0 || (int v14 = sub_100026E48(&v68)) != 0)
    {
LABEL_48:
      if (v66
        && !(_DWORD)v65
        && CVPixelBufferUnlockBaseAddress(v66, v67)
        && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
      {
        sub_10002C418();
      }

      goto LABEL_36;
    }

    uint64_t v19 = VCPSignPostLog();
    size_t v20 = (os_log_s *)objc_claimAutoreleasedReturnValue(v19);
    size_t v21 = v20;
    if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v20))
    {
      *(_WORD *)uint64_t v64 = 0;
      _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v21,  OS_SIGNPOST_INTERVAL_END,  v10,  "VCPSceneAnalyzerRotationAnalysisScaling",  (const char *)&unk_100199097,  v64,  2u);
    }

    uint64_t v22 = VCPSignPostLog();
    float v23 = (os_log_s *)objc_claimAutoreleasedReturnValue(v22);
    os_signpost_id_t v24 = os_signpost_id_generate(v23);

    uint64_t v25 = VCPSignPostLog();
    double v26 = (os_log_s *)objc_claimAutoreleasedReturnValue(v25);
    float v27 = v26;
    if (v24 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v26))
    {
      *(_WORD *)uint64_t v64 = 0;
      _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v27,  OS_SIGNPOST_INTERVAL_BEGIN,  v24,  "VCPSceneAnalyzerRotationAnalysisInference",  (const char *)&unk_100199097,  v64,  2u);
    }

    CVPixelBufferRef v28 = pixelBuffer;
    uint64_t v29 = (void *)objc_claimAutoreleasedReturnValue(-[VCPMAMLModel inputFeatureName](self->_rotationModel, "inputFeatureName"));
    uint64_t v30 = (void *)objc_claimAutoreleasedReturnValue( +[VCPMAMLFeatureProvider featureProviderWithCVPixelBuffer:andFeatureName:]( &OBJC_CLASS___VCPMAMLFeatureProvider,  "featureProviderWithCVPixelBuffer:andFeatureName:",  v28,  v29));

    id v31 = (void *)objc_claimAutoreleasedReturnValue(-[VCPMAMLModel model](self->_rotationModel, "model"));
    id v63 = 0LL;
    float v32 = (void *)objc_claimAutoreleasedReturnValue([v31 predictionFromFeatures:v30 error:&v63]);
    id v62 = v63;

    os_signpost_id_t v33 = (void *)objc_claimAutoreleasedReturnValue(-[VCPMAMLModel outputFeatureName](self->_rotationModel, "outputFeatureName"));
    uint64_t v34 = (void *)objc_claimAutoreleasedReturnValue([v32 featureValueForName:v33]);

    double v35 = (void *)objc_claimAutoreleasedReturnValue([v34 multiArrayValue]);
    id v36 = [v35 count];
    if (v36 == (id)4)
    {
      uint64_t v38 = 0LL;
      __int16 v39 = 0;
      float v40 = 0.0;
      do
      {
        uint64_t v41 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v35, "objectAtIndexedSubscript:", v38, v62));
        [v41 floatValue];
        float v43 = v42;

        if (v43 > v40)
        {
          float v40 = v43;
          __int16 v39 = v38;
        }

        ++v38;
      }

      while (v38 != 4);
      uint64_t v44 = (void *)objc_claimAutoreleasedReturnValue([v7 results]);
      [v44 setProbableRotationDirection:(__int16)(v39 + 1)];

      uint64_t v45 = (void *)objc_claimAutoreleasedReturnValue([v7 results]);
      *(float *)&double v46 = v40;
      [v45 setProbableRotationDirectionConfidence:v46];

      uint64_t v47 = VCPSignPostLog();
      __int128 v48 = (os_log_s *)objc_claimAutoreleasedReturnValue(v47);
      os_log_type_t v49 = v48;
      if (v24 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v48))
      {
        *(_WORD *)uint64_t v64 = 0;
        _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v49,  OS_SIGNPOST_INTERVAL_END,  v24,  "VCPSceneAnalyzerRotationAnalysisInference",  (const char *)&unk_100199097,  v64,  2u);
      }

      int v14 = 0;
    }

    else
    {
      uint64_t v58 = MediaAnalysisLogLevel(v36, v37);
      if ((int)v58 < 3)
      {
        int v14 = -18;
        goto LABEL_47;
      }

      uint64_t v60 = VCPLogInstance(v58, v59);
      os_log_type_t v49 = (os_log_s *)objc_claimAutoreleasedReturnValue(v60);
      os_log_type_t v61 = VCPLogToOSLogType[3];
      if (os_log_type_enabled(v49, v61))
      {
        *(_WORD *)uint64_t v64 = 0;
        _os_log_impl((void *)&_mh_execute_header, v49, v61, "[ProbableRotation] invalid coreML results", v64, 2u);
      }

      int v14 = -18;
    }

LABEL_47:
    goto LABEL_48;
  }

- (int)_performEmbeddingAnalysisForAssetEntry:(id)a3 withColorPixelBuffer:(__CVBuffer *)a4
{
  id v6 = a3;
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([v6 asset]);
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v7 localIdentifier]);
  os_signpost_id_t v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"[Scene][Embedding][%@]",  v8));

  uint64_t v10 = VCPSignPostLog();
  uint64_t v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
  os_signpost_id_t v12 = os_signpost_id_generate(v11);

  uint64_t v13 = VCPSignPostLog();
  int v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
  id v15 = v14;
  if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v14))
  {
    LOWORD(buf.data) = 0;
    _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v15,  OS_SIGNPOST_INTERVAL_BEGIN,  v12,  "VCPSceneAnalyzerEmbeddingAnalysisScaling",  (const char *)&unk_100199097,  (uint8_t *)&buf,  2u);
  }

  CVPixelBufferRef pixelBuffer = 0LL;
  -[VCPPoolBasedPixelBufferCreator createPixelBuffer:]( self->_embeddingBufferCreator,  "createPixelBuffer:",  &pixelBuffer);
  LODWORD(v69) = 0;
  CVPixelBufferRef v70 = a4;
  CVPixelBufferLockFlags unlockFlags = 1LL;
  if (a4)
  {
    int v16 = CVPixelBufferLockBaseAddress(a4, 1uLL);
    LODWORD(v69) = v16;
    if (v16)
    {
      if (!os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
        goto LABEL_31;
      }
      LODWORD(buf.data) = 134218240;
      *(void **)((char *)&buf.data + 4) = v70;
      WORD2(buf.height) = 1024;
      *(_DWORD *)((char *)&buf.height + 6) = v16;
      _os_log_error_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_ERROR,  "Failed to lock CVPixelBuffer (%p, %d)",  (uint8_t *)&buf,  0x12u);
      int v16 = v69;
      if ((_DWORD)v69) {
        goto LABEL_31;
      }
    }

    buf.data = CVPixelBufferGetBaseAddress(a4);
    buf.CGFloat height = CVPixelBufferGetHeight(a4);
    buf.CGFloat width = CVPixelBufferGetWidth(a4);
    buf.rowBytes = CVPixelBufferGetBytesPerRow(a4);
    LODWORD(v66) = 0;
    CVPixelBufferRef v67 = pixelBuffer;
    CVPixelBufferLockFlags v68 = 0LL;
    if (!pixelBuffer)
    {
      BOOL v49 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
      if (v49) {
        sub_10002C480(v49, v50, v51, v52, v53, v54, v55, v56);
      }
      int v16 = -50;
      goto LABEL_35;
    }

    int v16 = CVPixelBufferLockBaseAddress(pixelBuffer, 0LL);
    LODWORD(v66) = v16;
    if (v16)
    {
      if (!os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)
        || (LODWORD(v75.data) = 134218240,
            *(void **)((char *)&v75.data + 4) = v67,
            WORD2(v75.height) = 1024,
            *(_DWORD *)((char *)&v75.height + 6) = v16,
            _os_log_error_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_ERROR,  "Failed to lock CVPixelBuffer (%p, %d)",  (uint8_t *)&v75,  0x12u),  (int v16 = v66) != 0))
      {
LABEL_35:
        if (v70
          && !(_DWORD)v69
          && CVPixelBufferUnlockBaseAddress(v70, unlockFlags)
          && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
        {
          sub_10002C418();
        }

        goto LABEL_31;
      }
    }

    v75.data = CVPixelBufferGetBaseAddress(pixelBuffer);
    v75.CGFloat height = CVPixelBufferGetHeight(pixelBuffer);
    v75.CGFloat width = CVPixelBufferGetWidth(pixelBuffer);
    v75.rowBytes = CVPixelBufferGetBytesPerRow(pixelBuffer);
    int v16 = vImageScale_ARGB8888(&buf, &v75, 0LL, 0x20u);
    if (v16 || (int v16 = sub_100026E48(&v66)) != 0 || (int v16 = sub_100026E48(&v69)) != 0)
    {
LABEL_52:
      if (v67
        && !(_DWORD)v66
        && CVPixelBufferUnlockBaseAddress(v67, v68)
        && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
      {
        sub_10002C418();
      }

      goto LABEL_35;
    }

    uint64_t v17 = VCPSignPostLog();
    unsigned __int8 v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(v17);
    uint64_t v19 = v18;
    if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v18))
    {
      *(_WORD *)id v73 = 0;
      _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v19,  OS_SIGNPOST_INTERVAL_END,  v12,  "VCPSceneAnalyzerEmbeddingAnalysisScaling",  (const char *)&unk_100199097,  v73,  2u);
    }

    uint64_t v20 = VCPSignPostLog();
    size_t v21 = (os_log_s *)objc_claimAutoreleasedReturnValue(v20);
    os_signpost_id_t v22 = os_signpost_id_generate(v21);

    uint64_t v23 = VCPSignPostLog();
    os_signpost_id_t v24 = (os_log_s *)objc_claimAutoreleasedReturnValue(v23);
    uint64_t v25 = v24;
    if (v22 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v24))
    {
      *(_WORD *)id v73 = 0;
      _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v25,  OS_SIGNPOST_INTERVAL_BEGIN,  v22,  "VCPSceneAnalyzerEmbeddingAnalysisInference",  (const char *)&unk_100199097,  v73,  2u);
    }

    double v26 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithInteger:]( &OBJC_CLASS___NSNumber,  "numberWithInteger:",  +[VCPVideoTransformerBackbone revision](&OBJC_CLASS___VCPVideoTransformerBackbone, "revision")));
    float v27 = (void *)objc_claimAutoreleasedReturnValue( +[VCPSharedImageBackboneAnalyzer sharedAnalyzerWithRevision:]( &OBJC_CLASS___VCPSharedImageBackboneAnalyzer,  "sharedAnalyzerWithRevision:",  v26));

    id v65 = 0LL;
    int v16 = [v27 analyzePixelBuffer:pixelBuffer flags:0 results:&v65 cancel:&stru_1001BA740];
    id v28 = v65;
    if (v16)
    {
LABEL_51:

      goto LABEL_52;
    }

    uint64_t v29 = VCPSignPostLog();
    uint64_t v30 = (os_log_s *)objc_claimAutoreleasedReturnValue(v29);
    id v31 = v30;
    if (v22 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v30))
    {
      *(_WORD *)id v73 = 0;
      _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v31,  OS_SIGNPOST_INTERVAL_END,  v22,  "VCPSceneAnalyzerEmbeddingAnalysisInference",  (const char *)&unk_100199097,  v73,  2u);
    }

    float v32 = (void *)objc_claimAutoreleasedReturnValue([v28 objectForKeyedSubscript:MediaAnalysisImageEmbeddingResultsKey]);
    if ([v32 count])
    {
      uint64_t v34 = (void *)objc_claimAutoreleasedReturnValue([v32 firstObject]);
      double v35 = (void *)objc_claimAutoreleasedReturnValue([v34 objectForKeyedSubscript:MediaAnalysisResultAttributesKey]);
      id v36 = (void *)objc_claimAutoreleasedReturnValue([v35 objectForKeyedSubscript:MediaAnalysisResultEmbeddingAttributeKey]);

      if (v36)
      {
        __int16 v39 = (void *)objc_claimAutoreleasedReturnValue([v6 results]);
        [v39 setEmbeddingResults:v28];
        int v16 = 0;
LABEL_47:

LABEL_49:
LABEL_50:

        goto LABEL_51;
      }

      uint64_t v61 = MediaAnalysisLogLevel(v37, v38);
      if ((int)v61 >= 3)
      {
        uint64_t v63 = VCPLogInstance(v61, v62);
        __int16 v39 = (void *)objc_claimAutoreleasedReturnValue(v63);
        os_log_type_t v64 = VCPLogToOSLogType[3];
        if (os_log_type_enabled((os_log_t)v39, v64))
        {
          *(_DWORD *)id v73 = 138412290;
          uint64_t v74 = v9;
          _os_log_impl((void *)&_mh_execute_header, (os_log_t)v39, v64, "%@ Empty embedding data", v73, 0xCu);
        }

        int v16 = -18;
        goto LABEL_47;
      }
    }

    else
    {
      uint64_t v57 = MediaAnalysisLogLevel(0LL, v33);
      if ((int)v57 < 3)
      {
        int v16 = -18;
        goto LABEL_50;
      }

      uint64_t v59 = VCPLogInstance(v57, v58);
      id v36 = (void *)objc_claimAutoreleasedReturnValue(v59);
      os_log_type_t v60 = VCPLogToOSLogType[3];
      if (os_log_type_enabled((os_log_t)v36, v60))
      {
        *(_DWORD *)id v73 = 138412290;
        uint64_t v74 = v9;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)v36, v60, "%@ Empty embedding results", v73, 0xCu);
      }
    }

    int v16 = -18;
    goto LABEL_49;
  }

  BOOL v40 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
  if (v40) {
    sub_10002C480(v40, v41, v42, v43, v44, v45, v46, v47);
  }
  int v16 = -50;
LABEL_31:
  sub_10000421C((const void **)&pixelBuffer);

  return v16;
}

- (void)_processAssetEntry:(id)a3 resourceURL:(id)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v94 = a4;
  os_signpost_id_t v9 = (void (**)(void))a5;
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([v8 asset]);
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([v10 localIdentifier]);
  os_log_type_t v95 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"[Scene][%@]", v11));

  id v12 = [v8 needsSceneProcessing];
  if ((v12 & 1) == 0)
  {
    id v12 = [v8 needsEmbeddingProcessing];
    if ((v12 & 1) == 0)
    {
      uint64_t v50 = MediaAnalysisLogLevel(v12, v13);
      if ((int)v50 >= 6)
      {
        uint64_t v52 = VCPLogInstance(v50, v51);
        uint64_t v53 = (os_log_s *)objc_claimAutoreleasedReturnValue(v52);
        os_log_type_t v54 = VCPLogToOSLogType[6];
        if (os_log_type_enabled(v53, v54))
        {
          *(_DWORD *)vImage_Buffer buf = 138412290;
          *(void *)&uint8_t buf[4] = v95;
          _os_log_impl((void *)&_mh_execute_header, v53, v54, "%@ Analysis meets requirement; skipping", buf, 0xCu);
        }
      }

      goto LABEL_32;
    }
  }

  uint64_t v14 = MediaAnalysisLogLevel(v12, v13);
  if ((int)v14 >= 6)
  {
    uint64_t v16 = VCPLogInstance(v14, v15);
    uint64_t v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);
    os_log_type_t v18 = VCPLogToOSLogType[6];
    if (os_log_type_enabled(v17, v18))
    {
      uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue([v8 asset]);
      id v20 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "vcp_typeDescription"));
      unsigned int v21 = [v8 needsSceneProcessing];
      unsigned int v22 = [v8 needsEmbeddingProcessing];
      uint64_t v23 = @"NO";
      *(_DWORD *)vImage_Buffer buf = 138413058;
      *(void *)&uint8_t buf[4] = v95;
      if (v21) {
        os_signpost_id_t v24 = @"YES";
      }
      else {
        os_signpost_id_t v24 = @"NO";
      }
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = v20;
      if (v22) {
        uint64_t v23 = @"YES";
      }
      *(_WORD *)&buf[22] = 2112;
      uint64_t v119 = (uint64_t (*)(uint64_t, uint64_t))v24;
      LOWORD(v120) = 2112;
      *(void *)((char *)&v120 + 2) = v23;
      _os_log_impl((void *)&_mh_execute_header, v17, v18, "%@ Analyzing %@ (Scene:%@, Embedding:%@)", buf, 0x2Au);
    }
  }

  uint64_t v25 = (void *)objc_claimAutoreleasedReturnValue(+[VCPWatchdog sharedWatchdog](&OBJC_CLASS___VCPWatchdog, "sharedWatchdog"));
  [v25 pet];

  id cancelBlock = (uint64_t (**)(void))self->_cancelBlock;
  if (cancelBlock)
  {
    uint64_t v27 = cancelBlock[2]();
    if ((_DWORD)v27)
    {
      uint64_t v29 = MediaAnalysisLogLevel(v27, v28);
      if ((int)v29 >= 5)
      {
        uint64_t v31 = VCPLogInstance(v29, v30);
        float v32 = (os_log_s *)objc_claimAutoreleasedReturnValue(v31);
        os_log_type_t v33 = VCPLogToOSLogType[5];
        if (os_log_type_enabled(v32, v33))
        {
          *(_DWORD *)vImage_Buffer buf = 138412290;
          *(void *)&uint8_t buf[4] = v95;
          _os_log_impl((void *)&_mh_execute_header, v32, v33, "%@ Processing canceled; skipping asset", buf, 0xCu);
        }
      }

      [v8 setStatus:4294967168];
LABEL_32:
      v9[2](v9);
      goto LABEL_57;
    }
  }

  uint64_t v34 = dispatch_semaphore_wait((dispatch_semaphore_t)self->_inProcessAssetBudget, 0xFFFFFFFFFFFFFFFFLL);
  uint64_t v35 = VCPSignPostLog(v34);
  id v36 = (os_log_s *)objc_claimAutoreleasedReturnValue(v35);
  os_signpost_id_t v37 = os_signpost_id_generate(v36);

  uint64_t v39 = VCPSignPostLog(v38);
  BOOL v40 = (os_log_s *)objc_claimAutoreleasedReturnValue(v39);
  uint64_t v41 = v40;
  if (v37 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v40))
  {
    *(_WORD *)vImage_Buffer buf = 0;
    _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v41,  OS_SIGNPOST_INTERVAL_BEGIN,  v37,  "VCPMADSceneAssetEntryProcess_CreateVNRequests",  (const char *)&unk_100199097,  buf,  2u);
  }

  *(void *)vImage_Buffer buf = 0LL;
  *(void *)&buf[8] = buf;
  *(void *)&uint8_t buf[16] = 0x3032000000LL;
  uint64_t v119 = sub_100028C04;
  *(void *)&__int128 v120 = sub_100028C14;
  *((void *)&v120 + 1) = 0LL;
  id obj = 0LL;
  unsigned int v42 = -[VCPMADSceneAssetBatch _createRequests:forAssetEntry:](self, "_createRequests:forAssetEntry:", &obj, v8);
  objc_storeStrong((id *)&v120 + 1, obj);
  if (v42)
  {
    uint64_t v45 = MediaAnalysisLogLevel(v43, v44);
    if ((int)v45 >= 3)
    {
      uint64_t v47 = VCPLogInstance(v45, v46);
      __int128 v48 = (os_log_s *)objc_claimAutoreleasedReturnValue(v47);
      os_log_type_t v49 = VCPLogToOSLogType[3];
      if (os_log_type_enabled(v48, v49))
      {
        *(_DWORD *)double v114 = 138412290;
        uint64_t v115 = v95;
        _os_log_impl((void *)&_mh_execute_header, v48, v49, "%@ Failed to create VNRequests", v114, 0xCu);
      }
    }

    dispatch_semaphore_signal((dispatch_semaphore_t)self->_inProcessAssetBudget);
    v9[2](v9);
  }

  else
  {
    uint64_t v55 = VCPSignPostLog(v43);
    uint64_t v56 = (os_log_s *)objc_claimAutoreleasedReturnValue(v55);
    uint64_t v57 = v56;
    if (v37 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v56))
    {
      *(_WORD *)double v114 = 0;
      _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v57,  OS_SIGNPOST_INTERVAL_END,  v37,  "VCPMADSceneAssetEntryProcess_CreateVNRequests",  (const char *)&unk_100199097,  v114,  2u);
    }

    uint64_t v59 = VCPSignPostLog(v58);
    os_log_type_t v60 = (os_log_s *)objc_claimAutoreleasedReturnValue(v59);
    os_signpost_id_t spid = os_signpost_id_generate(v60);

    uint64_t v62 = VCPSignPostLog(v61);
    uint64_t v63 = (os_log_s *)objc_claimAutoreleasedReturnValue(v62);
    os_log_type_t v64 = v63;
    if (spid - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v63))
    {
      *(_WORD *)double v114 = 0;
      _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v64,  OS_SIGNPOST_INTERVAL_BEGIN,  spid,  "VCPMADSceneAssetEntryProcess_Decode",  (const char *)&unk_100199097,  v114,  2u);
    }

    CFTypeRef cf = 0LL;
    CFTypeRef v112 = 0LL;
    imageLoader = self->_imageLoader;
    uint64_t v66 = (void *)objc_claimAutoreleasedReturnValue([v8 asset]);
    id v67 = objc_msgSend(v66, "vcp_abnormalImageDimensionForSceneNet");
    CVPixelBufferLockFlags v68 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(*(void *)&buf[8] + 40) mapAvailableRequestsToResolution]);
    uint64_t v69 = (void *)objc_claimAutoreleasedReturnValue([v68 allKeys]);
    id v110 = 0LL;
    id v70 = -[VCPPreAnalysisImageLoader loadImageURL:abnormalDimension:withNonPanoPreWarmSizes:toColorPixelBuffer:lumaPixelBuffer:andImage:]( imageLoader,  "loadImageURL:abnormalDimension:withNonPanoPreWarmSizes:toColorPixelBuffer:lumaPixelBuffer:andImage:",  v94,  v67,  v69,  &cf,  &v112,  &v110);
    id v71 = v110;
    [v8 setStatus:v70];

    uint64_t v73 = VCPSignPostLog(v72);
    uint64_t v74 = (os_log_s *)objc_claimAutoreleasedReturnValue(v73);
    vImage_Buffer v75 = v74;
    if (spid - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v74))
    {
      *(_WORD *)double v114 = 0;
      _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v75,  OS_SIGNPOST_INTERVAL_END,  spid,  "VCPMADSceneAssetEntryProcess_Decode",  (const char *)&unk_100199097,  v114,  2u);
    }

    id v76 = [v8 status];
    if ((_DWORD)v76)
    {
      uint64_t v78 = MediaAnalysisLogLevel(v76, v77);
      if ((int)v78 >= 3)
      {
        uint64_t v80 = VCPLogInstance(v78, v79);
        uint64_t v81 = (os_log_s *)objc_claimAutoreleasedReturnValue(v80);
        os_log_type_t v82 = VCPLogToOSLogType[3];
        if (os_log_type_enabled(v81, v82))
        {
          *(_DWORD *)double v114 = 138412546;
          uint64_t v115 = v95;
          __int16 v116 = 2112;
          id v117 = v94;
          _os_log_impl((void *)&_mh_execute_header, v81, v82, "%@ Failed to load resourceURL: %@", v114, 0x16u);
        }
      }

      dispatch_semaphore_signal((dispatch_semaphore_t)self->_inProcessAssetBudget);
      v9[2](v9);
    }

    else
    {
      id scheduler = (void (**)(id, const __CFString *, OS_dispatch_group *, void *))self->_scheduler;
      scenenetGroup = self->_scenenetGroup;
      v103[0] = _NSConcreteStackBlock;
      v103[1] = 3221225472LL;
      v103[2] = sub_100028C1C;
      v103[3] = &unk_1001BA790;
      id v85 = v8;
      id v104 = v85;
      id v86 = v95;
      id v105 = v86;
      uint64_t v106 = self;
      id v107 = v71;
      v109 = buf;
      uint64_t v87 = v9;
      id v108 = v87;
      scheduler[2](scheduler, @"Scenenet", scenenetGroup, v103);
      if (v112) {
        CFTypeRef v88 = CFRetain(v112);
      }
      else {
        CFTypeRef v88 = 0LL;
      }
      if (cf)
      {
        CFTypeRef v89 = CFRetain(cf);
        os_log_type_t v90 = v86;
      }

      else
      {
        os_log_type_t v90 = v86;
        CFTypeRef v89 = 0LL;
      }

      char v91 = (void (**)(id, const __CFString *, OS_dispatch_group *, void *))self->_scheduler;
      blurExposureRotationGroup = self->_blurExposureRotationGroup;
      v96[0] = _NSConcreteStackBlock;
      v96[1] = 3221225472LL;
      v96[2] = sub_100028F84;
      v96[3] = &unk_1001BA7B8;
      id v97 = v90;
      id v98 = v85;
      int v99 = self;
      CFTypeRef v101 = v88;
      CFTypeRef v102 = v89;
      BOOL v100 = v87;
      v91[2](v91, @"BlurExposureRotation", blurExposureRotationGroup, v96);
    }

    sub_10000421C(&cf);
    sub_10000421C(&v112);
  }

  _Block_object_dispose(buf, 8);

LABEL_57:
}

- (int)process
{
  uint64_t v2 = VCPSignPostLog(self);
  v3 = (os_log_s *)objc_claimAutoreleasedReturnValue(v2);
  os_signpost_id_t spid = (char *)os_signpost_id_generate(v3);

  uint64_t v5 = VCPSignPostLog(v4);
  id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  uint64_t v7 = v6;
  if ((unint64_t)(spid - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v6))
  {
    *(_WORD *)vImage_Buffer buf = 0;
    _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v7,  OS_SIGNPOST_INTERVAL_BEGIN,  (os_signpost_id_t)spid,  "VCPMADSceneAssetBatch_Process",  (const char *)&unk_100199097,  buf,  2u);
  }

  uint64_t v10 = MediaAnalysisLogLevel(v8, v9);
  if ((int)v10 >= 6)
  {
    uint64_t v12 = VCPLogInstance(v10, v11);
    oslog = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
    os_log_type_t v13 = VCPLogToOSLogType[6];
    if (os_log_type_enabled(oslog, v13))
    {
      id v14 = -[NSMutableArray count](self->_assetEntries, "count");
      uint64_t v15 = qos_class_self();
      uint64_t v16 = VCPMAQoSDescription(v15);
      uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue(v16);
      *(_DWORD *)vImage_Buffer buf = 134218242;
      id v103 = v14;
      __int16 v104 = 2112;
      *(void *)id v105 = v17;
      _os_log_impl((void *)&_mh_execute_header, oslog, v13, "[Scene] Processing %lu assets (QoS: %@)", buf, 0x16u);
    }
  }

  os_log_type_t v18 = (void *)objc_claimAutoreleasedReturnValue(+[VCPWatchdog sharedWatchdog](&OBJC_CLASS___VCPWatchdog, "sharedWatchdog"));
  [v18 pet];

  os_log_t osloga = (os_log_t)objc_claimAutoreleasedReturnValue(+[NSDate now](&OBJC_CLASS___NSDate, "now"));
  unint64_t v92 = 0LL;
  os_log_type_t type = VCPLogToOSLogType[4];
  while (v92 < (unint64_t)-[NSMutableArray count](self->_assetEntries, "count"))
  {
    context = objc_autoreleasePoolPush();
    uint64_t v93 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray objectAtIndexedSubscript:](self->_assetEntries, "objectAtIndexedSubscript:", v92));
    uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue([v93 asset]);
    id v20 = (void *)objc_claimAutoreleasedReturnValue([v19 localIdentifier]);
    CFTypeRef v89 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"[Scene][%@]",  v20));

    unsigned int v21 = (void *)objc_claimAutoreleasedReturnValue([v93 asset]);
    unsigned int v22 = (void *)objc_claimAutoreleasedReturnValue([v21 adjustmentVersion]);
    BOOL v23 = v22 == 0LL;

    if (!v23)
    {
      uint64_t v26 = VCPSignPostLog(v24);
      uint64_t v27 = (os_log_s *)objc_claimAutoreleasedReturnValue(v26);
      os_signpost_id_t v28 = os_signpost_id_generate(v27);

      uint64_t v30 = VCPSignPostLog(v29);
      uint64_t v31 = (os_log_s *)objc_claimAutoreleasedReturnValue(v30);
      float v32 = v31;
      if (v28 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v31))
      {
        *(_WORD *)vImage_Buffer buf = 0;
        _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v32,  OS_SIGNPOST_INTERVAL_BEGIN,  v28,  "VCPMADSceneAssetEntry_QueryResource",  (const char *)&unk_100199097,  buf,  2u);
      }

      os_log_type_t v33 = (void *)objc_claimAutoreleasedReturnValue([v93 asset]);
      uint64_t v87 = (void *)objc_claimAutoreleasedReturnValue( +[PHAssetResource vcp_allAcceptableResourcesForAsset:]( &OBJC_CLASS___PHAssetResource,  "vcp_allAcceptableResourcesForAsset:",  v33));

      char v91 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v87, "vcp_thumbnailResource"));
      uint64_t v34 = VCPSignPostLog(v91);
      uint64_t v35 = (os_log_s *)objc_claimAutoreleasedReturnValue(v34);
      id v36 = v35;
      if (v28 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v35))
      {
        *(_WORD *)vImage_Buffer buf = 0;
        _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v36,  OS_SIGNPOST_INTERVAL_END,  v28,  "VCPMADSceneAssetEntry_QueryResource",  (const char *)&unk_100199097,  buf,  2u);
      }

      os_signpost_id_t v37 = v93;
      id v38 = objc_msgSend(v91, "vcp_isLocallyAvailable");
      if ((v38 & 1) != 0)
      {
        id v40 = objc_msgSend(v91, "vcp_hasExtremeAbnormalDimensionForScene");
        if ((_DWORD)v40)
        {
          uint64_t v42 = MediaAnalysisLogLevel(v40, v41);
          if ((int)v42 < 4)
          {
            uint64_t v48 = 0LL;
          }

          else
          {
            uint64_t v44 = VCPLogInstance(v42, v43);
            uint64_t v45 = (os_log_s *)objc_claimAutoreleasedReturnValue(v44);
            if (os_log_type_enabled(v45, type))
            {
              unsigned int v46 = [v91 pixelWidth];
              unsigned int v47 = [v91 pixelHeight];
              *(_DWORD *)vImage_Buffer buf = 138412802;
              id v103 = v89;
              __int16 v104 = 1024;
              *(_DWORD *)id v105 = v46;
              *(_WORD *)&v105[4] = 1024;
              *(_DWORD *)&v105[6] = v47;
              _os_log_impl( (void *)&_mh_execute_header,  v45,  type,  "%@ Asset has extreme abnormal dimension %dx%d; skipping",
                buf,
                0x18u);
            }

            uint64_t v48 = 0LL;
LABEL_48:

            os_signpost_id_t v37 = v93;
          }

- (int)publish
{
  uint64_t v2 = VCPTaskIDDescription(2LL);
  v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  unsigned int v4 = [(id)objc_opt_class(self) _allowConcurrentSceneProcessing];
  uint64_t v5 = @"Serial";
  if (v4) {
    uint64_t v5 = @"Concurrent";
  }
  double v152 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@-%@-Analyze",  v3,  v5));

  VCPCoreAnalyticsQoSReportSpeed( v152,  self->_processDuration * 1000.0 / (double)(unint64_t)-[NSMutableArray count](self->_assetEntries, "count"));
  v151 = (void *)objc_claimAutoreleasedReturnValue( +[VCPMADCoreAnalyticsManager sharedManager]( &OBJC_CLASS___VCPMADCoreAnalyticsManager,  "sharedManager"));
  uint64_t v6 = VCPSignPostLog(v151);
  uint64_t v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
  os_signpost_id_t v8 = os_signpost_id_generate(v7);

  uint64_t v10 = VCPSignPostLog(v9);
  uint64_t v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
  uint64_t v12 = v11;
  unint64_t v148 = v8 - 1;
  os_signpost_id_t spid = v8;
  if (v8 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v11))
  {
    *(_WORD *)vImage_Buffer buf = 0;
    _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v12,  OS_SIGNPOST_INTERVAL_BEGIN,  v8,  "VCPMADSceneAssetBatch_Publish",  (const char *)&unk_100199097,  buf,  2u);
  }

  uint64_t v15 = MediaAnalysisLogLevel(v13, v14);
  if ((int)v15 >= 6)
  {
    uint64_t v17 = VCPLogInstance(v15, v16);
    os_log_type_t v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(v17);
    os_log_type_t v19 = VCPLogToOSLogType[6];
    if (os_log_type_enabled(v18, v19))
    {
      id v20 = -[NSMutableArray count](self->_assetEntries, "count");
      uint64_t v21 = qos_class_self();
      uint64_t v22 = VCPMAQoSDescription(v21);
      BOOL v23 = (void *)objc_claimAutoreleasedReturnValue(v22);
      *(_DWORD *)vImage_Buffer buf = 134218242;
      id v191 = v20;
      __int16 v192 = 2112;
      v193 = v23;
      _os_log_impl((void *)&_mh_execute_header, v18, v19, "[Scene] Persisting %lu assets (QoS: %@) ...", buf, 0x16u);
    }
  }

  if (!-[NSMutableArray count](self->_assetEntries, "count"))
  {
    LODWORD(v173) = 0;
    goto LABEL_139;
  }

  uint64_t v24 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray firstObject](self->_assetEntries, "firstObject"));
  uint64_t v25 = (void *)objc_claimAutoreleasedReturnValue([v24 asset]);
  id v150 = (void *)objc_claimAutoreleasedReturnValue([v25 photoLibrary]);

  __int128 v155 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](&OBJC_CLASS___NSMutableSet, "set"));
  unsigned int v26 = +[VCPVideoCNNAnalyzer isMUBackboneEnabled]( &OBJC_CLASS___VCPVideoCNNAnalyzer,  "isMUBackboneEnabled");
  id v173 = v27;
  if (!v26) {
    goto LABEL_60;
  }
  __int128 v154 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  id v157 = +[VCPVideoTransformerBackbone embeddingVersion](&OBJC_CLASS___VCPVideoTransformerBackbone, "embeddingVersion");
  __int128 v185 = 0u;
  __int128 v186 = 0u;
  __int128 v183 = 0u;
  __int128 v184 = 0u;
  id obj = self->_assetEntries;
  id v28 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( obj,  "countByEnumeratingWithState:objects:count:",  &v183,  v189,  16LL);
  if (!v28) {
    goto LABEL_43;
  }
  uint64_t v171 = *(void *)v184;
  os_log_type_t type = VCPLogToOSLogType[3];
  uint64_t v163 = MediaAnalysisImageEmbeddingResultsKey;
  uint64_t v161 = MediaAnalysisResultAttributesKey;
  uint64_t v159 = MediaAnalysisResultEmbeddingAttributeKey;
  os_log_type_t v156 = VCPLogToOSLogType[7];
  do
  {
    uint64_t v29 = 0LL;
    id v174 = v28;
    do
    {
      if (*(void *)v184 != v171) {
        objc_enumerationMutation(obj);
      }
      uint64_t v30 = *(void **)(*((void *)&v183 + 1) + 8LL * (void)v29);
      uint64_t v31 = objc_autoreleasePoolPush();
      float v32 = (void *)objc_claimAutoreleasedReturnValue([v30 asset]);
      os_log_type_t v33 = (void *)objc_claimAutoreleasedReturnValue([v32 localIdentifier]);
      uint64_t v34 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"[Scene][Embedding][%@]",  v33));

      id v35 = [v30 status];
      if ((_DWORD)v35)
      {
        uint64_t v37 = MediaAnalysisLogLevel(v35, v36);
        uint64_t v39 = VCPLogInstance(v37, v38);
        id v40 = (os_log_s *)objc_claimAutoreleasedReturnValue(v39);
        if (os_log_type_enabled(v40, type))
        {
          unsigned int v41 = [v30 status];
          *(_DWORD *)vImage_Buffer buf = 138412546;
          id v191 = v34;
          __int16 v192 = 1024;
          LODWORD(v193) = v41;
          _os_log_impl((void *)&_mh_execute_header, v40, type, "%@ Analysis failed (%d); skipping", buf, 0x12u);
        }

        goto LABEL_33;
      }

      uint64_t v42 = (void *)objc_claimAutoreleasedReturnValue([v30 results]);
      uint64_t v43 = (void *)objc_claimAutoreleasedReturnValue([v42 embeddingResults]);
      id v40 = (os_log_s *)objc_claimAutoreleasedReturnValue([v43 objectForKeyedSubscript:v163]);

      uint64_t v44 = (void *)objc_claimAutoreleasedReturnValue(-[os_log_s firstObject](v40, "firstObject"));
      uint64_t v45 = (void *)objc_claimAutoreleasedReturnValue([v44 objectForKeyedSubscript:v161]);
      unsigned int v46 = (void *)objc_claimAutoreleasedReturnValue([v45 objectForKeyedSubscript:v159]);

      if (v46)
      {
        uint64_t v49 = MediaAnalysisLogLevel(v47, v48);
        if ((int)v49 >= 7)
        {
          uint64_t v51 = VCPLogInstance(v49, v50);
          uint64_t v52 = (os_log_s *)objc_claimAutoreleasedReturnValue(v51);
          if (os_log_type_enabled(v52, v156))
          {
            *(_DWORD *)vImage_Buffer buf = 138412290;
            id v191 = v34;
            _os_log_impl((void *)&_mh_execute_header, v52, v156, "%@ Preparing VSKAsset ...", buf, 0xCu);
          }
        }

        uint64_t v53 = (void *)objc_claimAutoreleasedReturnValue([v30 asset]);
        uint64_t v54 = (void *)objc_claimAutoreleasedReturnValue([v53 localIdentifier]);
        uint64_t v55 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[VSKAsset mad_stringIdentifierFromLocalIdentifier:embeddingType:]( &OBJC_CLASS___VSKAsset,  "mad_stringIdentifierFromLocalIdentifier:embeddingType:",  v54,  1LL));

        id v165 = (id)objc_claimAutoreleasedReturnValue( +[VSKAsset mad_attributesWithEmbeddingVersion:]( &OBJC_CLASS___VSKAsset,  "mad_attributesWithEmbeddingVersion:",  v157));
        id v56 = objc_alloc(&OBJC_CLASS___VSKAsset);
        v188 = v46;
        unsigned int v57 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v188, 1LL));
        id v58 = [v56 initWithStringIdentifier:v55 vectors:v57 attributes:v165 payload:0];

        if (v58)
        {
          uint64_t v61 = (void *)objc_claimAutoreleasedReturnValue([v30 asset]);
          uint64_t v62 = (void *)objc_claimAutoreleasedReturnValue([v61 localIdentifier]);
          [v154 setObject:v58 forKeyedSubscript:v62];

          uint64_t v63 = (void *)objc_claimAutoreleasedReturnValue([v30 asset]);
          os_log_type_t v64 = (void *)objc_claimAutoreleasedReturnValue([v63 localIdentifier]);
          [v155 addObject:v64];

          goto LABEL_29;
        }

        uint64_t v68 = MediaAnalysisLogLevel(v59, v60);
        if ((int)v68 >= 3)
        {
          uint64_t v70 = VCPLogInstance(v68, v69);
          uint64_t v63 = (void *)objc_claimAutoreleasedReturnValue(v70);
          if (os_log_type_enabled((os_log_t)v63, type))
          {
            *(_DWORD *)vImage_Buffer buf = 138412290;
            id v191 = v34;
            _os_log_impl((void *)&_mh_execute_header, (os_log_t)v63, type, "%@ Failed to create VSKAsset", buf, 0xCu);
          }

- (void).cxx_destruct
{
}

  ;
}

@end