@interface VCPMADSceneLibraryProcessingTask
+ (NSString)name;
+ (id)taskWithPhotoLibraries:(id)a3 cancelBlock:(id)a4 progressHandler:(id)a5 andCompletionHandler:(id)a6;
+ (unint64_t)taskID;
- (BOOL)run:(id *)a3;
- (BOOL)shouldProcessAsset:(id)a3;
- (VCPMADSceneLibraryProcessingTask)initWithPhotoLibraries:(id)a3 cancelBlock:(id)a4 progressHandler:(id)a5 andCompletionHandler:(id)a6;
- (id)assetPriorities;
- (id)batchWithAnalysisDatabase:(id)a3 allowDownload:(BOOL)a4 cancelBlock:(id)a5;
- (int)_dataMigrationIfNeededForPhotoLibrary:(id)a3 withAnalysisDatabase:(id)a4 andProgress:(id)a5;
- (int)_dataMigrationWithAssets:(id)a3;
- (int)processAllAssetsInPhotoLibrary:(id)a3 withAnalysisDatabase:(id)a4 andProgress:(id)a5;
- (void)dealloc;
@end

@implementation VCPMADSceneLibraryProcessingTask

- (VCPMADSceneLibraryProcessingTask)initWithPhotoLibraries:(id)a3 cancelBlock:(id)a4 progressHandler:(id)a5 andCompletionHandler:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v70.receiver = self;
  v70.super_class = (Class)&OBJC_CLASS___VCPMADSceneLibraryProcessingTask;
  v14 = -[VCPMADPhotosLibraryProcessingTask initWithPhotoLibraries:cancelBlock:progressHandler:andCompletionHandler:]( &v70,  "initWithPhotoLibraries:cancelBlock:progressHandler:andCompletionHandler:",  v10,  v11,  v12,  v13);
  v15 = v14;
  if (!v14) {
    goto LABEL_8;
  }
  +[VCPPreAnalysisRequests asyncCacheRequestIdealDimension]( &OBJC_CLASS___VCPPreAnalysisRequests,  "asyncCacheRequestIdealDimension");
  +[VCPPreAnalysisRequests asyncLoadSharedPhotoFormatsObjects]( &OBJC_CLASS___VCPPreAnalysisRequests,  "asyncLoadSharedPhotoFormatsObjects");
  v16 = objc_alloc(&OBJC_CLASS___VCPPoolBasedPixelBufferCreator);
  v17 = -[VCPPoolBasedPixelBufferCreator initWithBufferWidth:bufferHeight:andPixelFormat:]( v16,  "initWithBufferWidth:bufferHeight:andPixelFormat:",  kVCPMAPreAnalysisScaledSize,  kVCPMAPreAnalysisScaledSize,  1278226488LL);
  v18 = *(void **)(v14 + 44);
  *(void *)(v14 + 44) = v17;

  if (!*(void *)(v14 + 44))
  {
    uint64_t v42 = MediaAnalysisLogLevel(v19, v20);
    if ((int)v42 < 3)
    {
LABEL_25:
      v41 = 0LL;
      goto LABEL_26;
    }

    uint64_t v44 = VCPLogInstance(v42, v43);
    v45 = (os_log_s *)objc_claimAutoreleasedReturnValue(v44);
    os_log_type_t v46 = VCPLogToOSLogType[3];
    if (os_log_type_enabled(v45, v46))
    {
      uint64_t v47 = objc_opt_class(v15);
      *(_DWORD *)buf = 138412290;
      uint64_t v72 = v47;
      _os_log_impl( (void *)&_mh_execute_header,  v45,  v46,  "[%@] Failed to create VCPPoolBasedPixelBufferCreator for monochrome",  buf,  0xCu);
    }

+ (id)taskWithPhotoLibraries:(id)a3 cancelBlock:(id)a4 progressHandler:(id)a5 andCompletionHandler:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  id v14 = [objc_alloc((Class)objc_opt_class(a1)) initWithPhotoLibraries:v10 cancelBlock:v11 progressHandler:v12 andCompletionHandler:v13];

  return v14;
}

- (void)dealloc
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[VNSession globalSession](&OBJC_CLASS___VNSession, "globalSession"));
  [v3 releaseCachedResources];

  MediaAnalysisPurgeResources();
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___VCPMADSceneLibraryProcessingTask;
  -[VCPMADSceneLibraryProcessingTask dealloc](&v4, "dealloc");
}

+ (NSString)name
{
  return (NSString *)@"Scene";
}

+ (unint64_t)taskID
{
  return 2LL;
}

- (BOOL)shouldProcessAsset:(id)a3
{
  return objc_msgSend(a3, "vcp_needSceneProcessing");
}

- (id)batchWithAnalysisDatabase:(id)a3 allowDownload:(BOOL)a4 cancelBlock:(id)a5
{
  return (id)objc_claimAutoreleasedReturnValue( +[VCPMADSceneAssetBatch batchWithAnalysisDatabase:cancelBlock:monochromeBufferCreator:imageLoader:session:ivsPool:rotationModel:rotationBufferCreator:embeddingBufferCreator:]( &OBJC_CLASS___VCPMADSceneAssetBatch,  "batchWithAnalysisDatabase:cancelBlock:monochromeBufferCreator:imageLoader:s ession:ivsPool:rotationModel:rotationBufferCreator:embeddingBufferCreator:",  a3,  a5,  *(id *)((char *)&self->super._progressHandler + 4),  *(VCPPoolBasedPixelBufferCreator **)((char *)&self->_monochromeBufferCreator + 4),  *(VCPPreAnalysisImageLoader **)((char *)&self->_imageLoader + 4),  *(VNSession **)((char *)&self->_session + 4),  *(VCPObjectPool **)((char *)&self->_ivsPool + 4),  *(VCPMAMLModel **)((char *)&self->_rotationModel + 4),  *(VCPPoolBasedPixelBufferCreator **)((char *)&self->_rotationBufferCreator + 4)));
}

- (id)assetPriorities
{
  return &off_1001C91B0;
}

- (int)_dataMigrationWithAssets:(id)a3
{
  id v4 = a3;
  id v5 = [(id)objc_opt_class(self) name];
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"[%@][Embedding][Migration]",  v6));

  v47.receiver = self;
  v47.super_class = (Class)&OBJC_CLASS___VCPMADSceneLibraryProcessingTask;
  id v8 = -[VCPMADSceneLibraryProcessingTask cancelBlock](&v47, "cancelBlock");
  v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
  if (!v9
    || (v46.receiver = self,
        v46.super_class = (Class)&OBJC_CLASS___VCPMADSceneLibraryProcessingTask,
        id v10 = -[VCPMADSceneLibraryProcessingTask cancelBlock](&v46, "cancelBlock"),
        id v11 = (uint64_t (**)(void))objc_claimAutoreleasedReturnValue(v10),
        int v12 = v11[2](),
        v11,
        v9,
        !v12))
  {
    v21 = (void *)objc_claimAutoreleasedReturnValue(+[VCPWatchdog sharedWatchdog](&OBJC_CLASS___VCPWatchdog, "sharedWatchdog"));
    [v21 pet];

    uint64_t v23 = VCPSignPostLog(v22);
    v24 = (os_log_s *)objc_claimAutoreleasedReturnValue(v23);
    os_signpost_id_t v25 = os_signpost_id_generate(v24);

    uint64_t v27 = VCPSignPostLog(v26);
    v28 = (os_log_s *)objc_claimAutoreleasedReturnValue(v27);
    uint64_t v29 = v28;
    if (v25 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v28))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v29,  OS_SIGNPOST_INTERVAL_BEGIN,  v25,  "VCPMADPhotosLibraryProcessingTask_Migration_ProcessingBatch",  (const char *)&unk_100199097,  buf,  2u);
    }

    uint64_t v30 = (void *)objc_claimAutoreleasedReturnValue([v4 firstObject]);
    v18 = (void *)objc_claimAutoreleasedReturnValue([v30 photoLibrary]);

    v44[0] = _NSConcreteStackBlock;
    v44[1] = 3221225472LL;
    v44[2] = sub_1000CCBF8;
    v44[3] = &unk_1001BA0C8;
    id v45 = v4;
    id v43 = 0LL;
    unsigned __int8 v31 = [v18 performChangesAndWait:v44 error:&v43];
    id v32 = v43;
    uint64_t v34 = v32;
    if ((v31 & 1) != 0)
    {
      uint64_t v35 = VCPSignPostLog(v32);
      v36 = (os_log_s *)objc_claimAutoreleasedReturnValue(v35);
      v37 = v36;
      if (v25 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v36))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v37,  OS_SIGNPOST_INTERVAL_END,  v25,  "VCPMADPhotosLibraryProcessingTask_Migration_ProcessingBatch",  (const char *)&unk_100199097,  buf,  2u);
      }

      int v20 = 0;
    }

    else
    {
      uint64_t v38 = MediaAnalysisLogLevel(v32, v33);
      if ((int)v38 < 3)
      {
        int v20 = -18;
        goto LABEL_21;
      }

      uint64_t v40 = VCPLogInstance(v38, v39);
      v37 = (os_log_s *)objc_claimAutoreleasedReturnValue(v40);
      os_log_type_t v41 = VCPLogToOSLogType[3];
      if (os_log_type_enabled(v37, v41))
      {
        *(_DWORD *)buf = 138412546;
        uint64_t v49 = v7;
        __int16 v50 = 2112;
        v51 = v34;
        _os_log_impl((void *)&_mh_execute_header, v37, v41, "%@ Failed to migrate Image embedding - %@", buf, 0x16u);
      }

      int v20 = -18;
    }

LABEL_21:
    goto LABEL_22;
  }

  uint64_t v15 = MediaAnalysisLogLevel(v13, v14);
  if ((int)v15 < 5)
  {
    int v20 = -128;
    goto LABEL_23;
  }

  uint64_t v17 = VCPLogInstance(v15, v16);
  v18 = (void *)objc_claimAutoreleasedReturnValue(v17);
  os_log_type_t v19 = VCPLogToOSLogType[5];
  if (os_log_type_enabled((os_log_t)v18, v19))
  {
    *(_DWORD *)buf = 138412290;
    uint64_t v49 = v7;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)v18, v19, "%@ Processing cancelled", buf, 0xCu);
  }

  int v20 = -128;
LABEL_22:

LABEL_23:
  return v20;
}

- (int)_dataMigrationIfNeededForPhotoLibrary:(id)a3 withAnalysisDatabase:(id)a4 andProgress:(id)a5
{
  id v113 = a3;
  id v117 = a4;
  id v112 = a5;
  id v8 = [(id)objc_opt_class(self) name];
  v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
  v116 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"[%@][Embedding][Migration]",  v9));

  uint64_t v110 = VCPKeyValueSceneImageEmbeddingMigrationTimestamp;
  id v10 = objc_msgSend(v117, "valueForKey:");
  if (v10)
  {
    v114 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[NSDate dateWithTimeIntervalSinceReferenceDate:]( &OBJC_CLASS___NSDate,  "dateWithTimeIntervalSinceReferenceDate:",  (double)(uint64_t)v10));
    uint64_t v12 = MediaAnalysisLogLevel(v114, v11);
    if ((int)v12 >= 6)
    {
      uint64_t v14 = VCPLogInstance(v12, v13);
      uint64_t v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
      os_log_type_t v16 = VCPLogToOSLogType[6];
      if (os_log_type_enabled(v15, v16))
      {
        uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue(+[VCPLogManager dateFormatterDateTime](&OBJC_CLASS___VCPLogManager, "dateFormatterDateTime"));
        v18 = (void *)objc_claimAutoreleasedReturnValue([v17 stringFromDate:v114]);
        *(_DWORD *)buf = 138412546;
        v126 = v116;
        __int16 v127 = 2112;
        id v128 = v18;
        _os_log_impl( (void *)&_mh_execute_header,  v15,  v16,  "%@ Image embedding to Scene Processing migrated (%@)",  buf,  0x16u);
      }
    }

    LODWORD(v19) = 0;
LABEL_68:

    goto LABEL_69;
  }

  v124.receiver = self;
  v124.super_class = (Class)&OBJC_CLASS___VCPMADSceneLibraryProcessingTask;
  id v20 = -[VCPMADSceneLibraryProcessingTask cancelBlock](&v124, "cancelBlock");
  v21 = (void *)objc_claimAutoreleasedReturnValue(v20);
  if (!v21
    || (v123.receiver = self,
        v123.super_class = (Class)&OBJC_CLASS___VCPMADSceneLibraryProcessingTask,
        id v22 = -[VCPMADSceneLibraryProcessingTask cancelBlock](&v123, "cancelBlock"),
        uint64_t v23 = (uint64_t (**)(void))objc_claimAutoreleasedReturnValue(v22),
        int v24 = v23[2](),
        v23,
        v21,
        !v24))
  {
    id v32 = (void *)objc_claimAutoreleasedReturnValue(+[VCPWatchdog sharedWatchdog](&OBJC_CLASS___VCPWatchdog, "sharedWatchdog"));
    [v32 pet];

    LOWORD(v106) = 0;
    v114 = (os_log_s *)objc_msgSend( [PHMediaProcessingAlgorithmVersionProvider alloc],  "initWithSceneAnalysisVersion:faceAnalysisVersion:characterRecognitionAlgorithmVersion:visualSea rchAlgorithmVersion:stickerConfidenceAlgorithmVersion:vaAnalysisVersion:vaLocationAnalysisVersi on:mediaAnalysisVersion:mediaAnalysisImageVersion:captionGenerationVersion:imageEmbeddingVersio n:videoEmbeddingVersion:",  0,  0,  0,  0,  0,  0,  v106,  0,  0x4600000000);
    uint64_t v33 = VCPSignPostLog(v114);
    uint64_t v34 = (os_log_s *)objc_claimAutoreleasedReturnValue(v33);
    os_signpost_id_t v35 = os_signpost_id_generate(v34);

    uint64_t v37 = VCPSignPostLog(v36);
    uint64_t v38 = (os_log_s *)objc_claimAutoreleasedReturnValue(v37);
    uint64_t v39 = v38;
    if (v35 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v38))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v39,  OS_SIGNPOST_INTERVAL_BEGIN,  v35,  "VCPMADPhotosLibraryProcessingTask_Migration_FetchAssets",  (const char *)&unk_100199097,  buf,  2u);
    }

    uint64_t v40 = (void *)objc_claimAutoreleasedReturnValue(+[MADStateHandler sharedStateHandler](&OBJC_CLASS___MADStateHandler, "sharedStateHandler"));
    [v40 addBreadcrumb:@"%@ Fetching for Scene Embedding migration", v116];

    id v41 = [(id)objc_opt_class(self) taskID];
    id v122 = 0LL;
    LODWORD(v42) = 0;
    v115 = (void *)objc_claimAutoreleasedReturnValue( [v113 fetchAssetsForMediaProcessingTaskID:v41 priority:0 algorithmVersion:v114 sceneConfidenceThreshold:&v122 error:v42]);
    id v109 = v122;
    uint64_t v43 = VCPSignPostLog(v109);
    uint64_t v44 = (os_log_s *)objc_claimAutoreleasedReturnValue(v43);
    id v45 = v44;
    if (v35 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v44))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v45,  OS_SIGNPOST_INTERVAL_END,  v35,  "VCPMADPhotosLibraryProcessingTask_Migration_FetchAssets",  (const char *)&unk_100199097,  buf,  2u);
    }

    if (v109)
    {
      uint64_t v48 = MediaAnalysisLogLevel(v46, v47);
      if ((int)v48 >= 3)
      {
        uint64_t v50 = VCPLogInstance(v48, v49);
        v51 = (os_log_s *)objc_claimAutoreleasedReturnValue(v50);
        os_log_type_t v52 = VCPLogToOSLogType[3];
        v111 = v51;
        if (os_log_type_enabled(v51, v52))
        {
          *(_DWORD *)buf = 138412546;
          v126 = v116;
          __int16 v127 = 2112;
          id v128 = v109;
          _os_log_impl((void *)&_mh_execute_header, v51, v52, "%@ Failed to fetch assets: %@", buf, 0x16u);
        }

        LODWORD(v19) = -18;
        goto LABEL_66;
      }

      LODWORD(v19) = -18;
      goto LABEL_67;
    }

    uint64_t v53 = MediaAnalysisLogLevel(v46, v47);
    if ((int)v53 >= 6)
    {
      uint64_t v55 = VCPLogInstance(v53, v54);
      os_log_type_t v56 = (os_log_s *)objc_claimAutoreleasedReturnValue(v55);
      os_log_type_t v57 = VCPLogToOSLogType[6];
      if (os_log_type_enabled(v56, v57))
      {
        unsigned int v58 = [v115 count];
        *(_DWORD *)buf = 138412546;
        v126 = v116;
        __int16 v127 = 1024;
        LODWORD(v128) = v58;
        _os_log_impl((void *)&_mh_execute_header, v56, v57, "%@ Fetched %d assets", buf, 0x12u);
      }
    }

    uint64_t v59 = (void *)objc_claimAutoreleasedReturnValue(+[MADStateHandler sharedStateHandler](&OBJC_CLASS___MADStateHandler, "sharedStateHandler"));
    [v59 addBreadcrumb:@"%@ Fetched for Scene Embedding migration with %d assets", v116, objc_msgSend(v115, "count")];

    v121.receiver = self;
    v121.super_class = (Class)&OBJC_CLASS___VCPMADSceneLibraryProcessingTask;
    id v60 = -[VCPMADSceneLibraryProcessingTask cancelBlock](&v121, "cancelBlock");
    os_log_type_t v61 = (void *)objc_claimAutoreleasedReturnValue(v60);
    if (v61)
    {
      v120.receiver = self;
      v120.super_class = (Class)&OBJC_CLASS___VCPMADSceneLibraryProcessingTask;
      id v62 = -[VCPMADSceneLibraryProcessingTask cancelBlock](&v120, "cancelBlock");
      id v63 = (uint64_t (**)(void))objc_claimAutoreleasedReturnValue(v62);
      int v64 = v63[2]();

      if (v64)
      {
        uint64_t v67 = MediaAnalysisLogLevel(v65, v66);
        if ((int)v67 >= 5)
        {
          uint64_t v69 = VCPLogInstance(v67, v68);
          objc_super v70 = (os_log_s *)objc_claimAutoreleasedReturnValue(v69);
          os_log_type_t v71 = VCPLogToOSLogType[5];
          v111 = v70;
          if (os_log_type_enabled(v70, v71))
          {
            *(_DWORD *)buf = 138412290;
            v126 = v116;
            _os_log_impl((void *)&_mh_execute_header, v70, v71, "%@ Processing cancelled", buf, 0xCu);
          }

          LODWORD(v19) = -128;
          goto LABEL_66;
        }

        LODWORD(v19) = -128;
LABEL_67:

        goto LABEL_68;
      }
    }

    os_log_type_t v19 = (void *)objc_claimAutoreleasedReturnValue(+[VCPWatchdog sharedWatchdog](&OBJC_CLASS___VCPWatchdog, "sharedWatchdog"));
    [v19 pet];

    uint64_t v73 = VCPSignPostLog(v72);
    v74 = (os_log_s *)objc_claimAutoreleasedReturnValue(v73);
    os_signpost_id_t spid = os_signpost_id_generate(v74);

    uint64_t v76 = VCPSignPostLog(v75);
    v77 = (os_log_s *)objc_claimAutoreleasedReturnValue(v76);
    v78 = v77;
    if (spid - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v77))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v78,  OS_SIGNPOST_INTERVAL_BEGIN,  spid,  "VCPMADPhotosLibraryProcessingTask_Migration_Processing",  (const char *)&unk_100199097,  buf,  2u);
    }

    v111 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
    objc_msgSend(v112, "setTotalUnitCount:", objc_msgSend(v115, "count"));
    unint64_t v79 = 0LL;
    os_log_type_t type = VCPLogToOSLogType[5];
    int v80 = MediaAnalysisChangedVersion70;
    while (1)
    {
      if (v79 >= (unint64_t)[v115 count])
      {
        if (!-[os_log_s count](v111, "count")) {
          goto LABEL_62;
        }
        v99 = objc_autoreleasePoolPush();
        LODWORD(v19) = -[VCPMADSceneLibraryProcessingTask _dataMigrationWithAssets:]( self,  "_dataMigrationWithAssets:",  v111);
        if (!(_DWORD)v19)
        {
          -[os_log_s removeAllObjects](v111, "removeAllObjects");
          objc_msgSend( v112,  "setCompletedUnitCount:",  (char *)-[os_log_s count](v111, "count") + (void)objc_msgSend(v112, "completedUnitCount"));
        }

        objc_autoreleasePoolPop(v99);
        if (!(_DWORD)v19)
        {
LABEL_62:
          v100 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate now](&OBJC_CLASS___NSDate, "now"));
          [v100 timeIntervalSinceReferenceDate];
          [v117 setValue:(uint64_t)v101 forKey:v110];

          uint64_t v102 = VCPSignPostLog([v117 commit]);
          v103 = (os_log_s *)objc_claimAutoreleasedReturnValue(v102);
          v104 = v103;
          if (spid - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v103))
          {
            *(_WORD *)buf = 0;
            _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v104,  OS_SIGNPOST_INTERVAL_END,  spid,  "VCPMADPhotosLibraryProcessingTask_Migration_Processing",  (const char *)&unk_100199097,  buf,  2u);
          }

          LODWORD(v19) = 0;
        }

- (int)processAllAssetsInPhotoLibrary:(id)a3 withAnalysisDatabase:(id)a4 andProgress:(id)a5
{
  id v101 = a3;
  id v100 = a4;
  id v8 = a5;
  v99 = v8;
  if (+[VCPVideoCNNAnalyzer isMUBackboneEnabled]( &OBJC_CLASS___VCPVideoCNNAnalyzer,  "isMUBackboneEnabled")) {
    uint64_t v9 = 3LL;
  }
  else {
    uint64_t v9 = 1LL;
  }
  [v8 setTotalUnitCount:v9];
  id v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "vcp_childWithPendingUnitCount:", 1));
  v106.receiver = self;
  v106.super_class = (Class)&OBJC_CLASS___VCPMADSceneLibraryProcessingTask;
  int v11 = -[VCPMADPhotosLibraryProcessingTask processAllAssetsInPhotoLibrary:withAnalysisDatabase:andProgress:]( &v106,  "processAllAssetsInPhotoLibrary:withAnalysisDatabase:andProgress:",  v101,  v100,  v10);

  if (v11) {
    goto LABEL_61;
  }
  if (!+[VCPVideoCNNAnalyzer isMUBackboneEnabled]( &OBJC_CLASS___VCPVideoCNNAnalyzer,  "isMUBackboneEnabled")) {
    goto LABEL_60;
  }
  context = objc_autoreleasePoolPush();
  id v12 = [(id)objc_opt_class(self) name];
  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
  unsigned int v98 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"[%@][Embedding]",  v13));

  BOOL v16 = (int)MediaAnalysisLogLevel(v14, v15) < 5;
  v18 = v99;
  if (!v16)
  {
    uint64_t v19 = VCPLogInstance(v99, v17);
    id v20 = (os_log_s *)objc_claimAutoreleasedReturnValue(v19);
    os_log_type_t v21 = VCPLogToOSLogType[5];
    if (os_log_type_enabled(v20, v21))
    {
      *(_DWORD *)buf = 138412290;
      v108 = v98;
      _os_log_impl((void *)&_mh_execute_header, v20, v21, "%@ Evaluating all assets in Photo Library", buf, 0xCu);
    }

    v18 = v99;
  }

  id v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "vcp_childWithPendingUnitCount:", 1));
  int v11 = -[VCPMADSceneLibraryProcessingTask _dataMigrationIfNeededForPhotoLibrary:withAnalysisDatabase:andProgress:]( self,  "_dataMigrationIfNeededForPhotoLibrary:withAnalysisDatabase:andProgress:",  v101,  v100,  v22);

  if (v11)
  {
    int v23 = 1;
    goto LABEL_59;
  }

  LOWORD(v91) = 0;
  id v97 = objc_msgSend( [PHMediaProcessingAlgorithmVersionProvider alloc],  "initWithSceneAnalysisVersion:faceAnalysisVersion:characterRecognitionAlgorithmVersion:visualSearchAlgorithmVer sion:stickerConfidenceAlgorithmVersion:vaAnalysisVersion:vaLocationAnalysisVersion:mediaAnalysisVersion:mediaA nalysisImageVersion:captionGenerationVersion:imageEmbeddingVersion:videoEmbeddingVersion:",  0,  0,  0,  0,  0,  0,  v91,  0,  0x4600000000);
  int v24 = (void *)objc_claimAutoreleasedReturnValue(-[VCPMADSceneLibraryProcessingTask assetPriorities](self, "assetPriorities"));
  v94 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v99, "vcp_childWithPendingUnitCount:", objc_msgSend(v24, "count")));
  int v11 = 0;
  uint64_t v25 = 1LL;
  os_log_type_t v95 = VCPLogToOSLogType[3];
  os_log_type_t type = VCPLogToOSLogType[5];
  os_log_type_t v92 = VCPLogToOSLogType[6];
  while (1)
  {
    uint64_t v26 = v24;
    uint64_t v27 = objc_autoreleasePoolPush();
    v105.receiver = self;
    v105.super_class = (Class)&OBJC_CLASS___VCPMADSceneLibraryProcessingTask;
    id v28 = -[VCPMADSceneLibraryProcessingTask cancelBlock](&v105, "cancelBlock");
    uint64_t v29 = (void *)objc_claimAutoreleasedReturnValue(v28);
    if (v29
      && (v104.receiver = self,
          v104.super_class = (Class)&OBJC_CLASS___VCPMADSceneLibraryProcessingTask,
          id v30 = -[VCPMADSceneLibraryProcessingTask cancelBlock](&v104, "cancelBlock"),
          os_log_type_t v31 = (uint64_t (**)(void))objc_claimAutoreleasedReturnValue(v30),
          int v32 = v31[2](),
          v31,
          v29,
          v32))
    {
      uint64_t v35 = MediaAnalysisLogLevel(v33, v34);
      if ((int)v35 < 5)
      {
        int v11 = -128;
        BOOL v39 = 1;
        goto LABEL_45;
      }

      uint64_t v37 = VCPLogInstance(v35, v36);
      uint64_t v38 = (os_log_s *)objc_claimAutoreleasedReturnValue(v37);
      if (os_log_type_enabled(v38, type))
      {
        *(_DWORD *)buf = 138412290;
        v108 = v98;
        _os_log_impl((void *)&_mh_execute_header, v38, type, "%@ Processing cancelled", buf, 0xCu);
      }

      int v11 = -128;
      BOOL v39 = 1;
    }

    else
    {
      uint64_t v40 = (void *)objc_claimAutoreleasedReturnValue(+[VCPWatchdog sharedWatchdog](&OBJC_CLASS___VCPWatchdog, "sharedWatchdog"));
      [v40 pet];

      id v41 = [v24 count];
      if ((unint64_t)v41 >= 2)
      {
        uint64_t v43 = MediaAnalysisLogLevel(v41, v42);
        if ((int)v43 >= 5)
        {
          uint64_t v45 = VCPLogInstance(v43, v44);
          uint64_t v46 = (os_log_s *)objc_claimAutoreleasedReturnValue(v45);
          if (os_log_type_enabled(v46, type))
          {
            *(_DWORD *)buf = 138412546;
            v108 = v98;
            __int16 v109 = 2048;
            uint64_t v110 = v25;
            _os_log_impl((void *)&_mh_execute_header, v46, type, "%@ Evaluating P%lu assets", buf, 0x16u);
          }
        }
      }

      uint64_t v47 = (void *)objc_claimAutoreleasedReturnValue([v24 objectAtIndexedSubscript:v25 - 1]);
      id v48 = [v47 unsignedIntegerValue];

      +[PHAsset mad_sceneConfidenceThresholdForTask:]( PHAsset,  "mad_sceneConfidenceThresholdForTask:",  [(id)objc_opt_class(self) taskID]);
      int v50 = v49;
      v51 = (void *)objc_claimAutoreleasedReturnValue(+[MADStateHandler sharedStateHandler](&OBJC_CLASS___MADStateHandler, "sharedStateHandler"));
      [v51 addBreadcrumb:@"%@ Fetching Priority%lu assets (image embedding)", v98, v25];

      uint64_t v53 = VCPSignPostLog(v52);
      uint64_t v54 = (os_log_s *)objc_claimAutoreleasedReturnValue(v53);
      os_signpost_id_t v55 = os_signpost_id_generate(v54);

      uint64_t v57 = VCPSignPostLog(v56);
      unsigned int v58 = (os_log_s *)objc_claimAutoreleasedReturnValue(v57);
      uint64_t v59 = v58;
      if (v55 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v58))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v59,  OS_SIGNPOST_INTERVAL_BEGIN,  v55,  "VCPMADPhotosLibraryProcessingTask_FetchAssets_ImageEmbedding",  (const char *)&unk_100199097,  buf,  2u);
      }

      id v60 = [(id)objc_opt_class(self) taskID];
      id v103 = 0LL;
      LODWORD(v61) = v50;
      id v62 = (void *)objc_claimAutoreleasedReturnValue( [v101 fetchAssetsForMediaProcessingTaskID:v60 priority:v48 algorithmVersion:v97 sceneConfidenceThreshold:&v103 error:v61]);
      uint64_t v38 = (os_log_s *)v103;
      uint64_t v63 = VCPSignPostLog(v38);
      int v64 = (os_log_s *)objc_claimAutoreleasedReturnValue(v63);
      uint64_t v65 = v64;
      if (v55 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v64))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v65,  OS_SIGNPOST_INTERVAL_END,  v55,  "VCPMADPhotosLibraryProcessingTask_FetchAssets_ImageEmbedding",  (const char *)&unk_100199097,  buf,  2u);
      }

      if (v38)
      {
        uint64_t v68 = MediaAnalysisLogLevel(v66, v67);
        if ((int)v68 >= 3)
        {
          uint64_t v70 = VCPLogInstance(v68, v69);
          os_log_type_t v71 = (os_log_s *)objc_claimAutoreleasedReturnValue(v70);
          if (os_log_type_enabled(v71, v95))
          {
            *(_DWORD *)buf = 138412546;
            v108 = v98;
            __int16 v109 = 2112;
            uint64_t v110 = (uint64_t)v38;
            _os_log_impl((void *)&_mh_execute_header, v71, v95, "%@ Failed to fetch assets: %@", buf, 0x16u);
          }
        }

        int v11 = -18;
        BOOL v39 = 1;
      }

      else
      {
        uint64_t v72 = MediaAnalysisLogLevel(v66, v67);
        if ((int)v72 >= 6)
        {
          uint64_t v74 = VCPLogInstance(v72, v73);
          uint64_t v75 = (os_log_s *)objc_claimAutoreleasedReturnValue(v74);
          if (os_log_type_enabled(v75, v92))
          {
            unsigned int v76 = [v62 count];
            *(_DWORD *)buf = 138412546;
            v108 = v98;
            __int16 v109 = 1024;
            LODWORD(v110) = v76;
            _os_log_impl((void *)&_mh_execute_header, v75, v92, "%@ Fetched %d assets", buf, 0x12u);
          }
        }

        v77 = (void *)objc_claimAutoreleasedReturnValue(+[MADStateHandler sharedStateHandler](&OBJC_CLASS___MADStateHandler, "sharedStateHandler"));
        [v77 addBreadcrumb:@"%@ Fetched %d Priority%lu assets", v98, objc_msgSend(v62, "count"), v25];

        unsigned int v78 = -[VCPMADPhotosProcessingTask processAssetsInFetchResult:withAnalysisDatabase:allowDownload:progress:]( self,  "processAssetsInFetchResult:withAnalysisDatabase:allowDownload:progress:",  v62,  v100,  0LL,  v94);
        BOOL v39 = v78 != 0;
        if (v78) {
          int v11 = v78;
        }
      }
    }

LABEL_45:
    objc_autoreleasePoolPop(v27);
    ++v25;
    int v24 = v26;
    if (v39)
    {
      int v23 = 1;
      goto LABEL_58;
    }
  }

  unsigned int v79 = -[VCPMADPhotosProcessingTask waitForPublishing](self, "waitForPublishing");
  if (v79)
  {
    int v23 = 1;
    int v11 = v79;
  }

  else
  {
    int v80 = (void *)objc_claimAutoreleasedReturnValue( +[MADVectorDatabaseManager sharedDatabaseWithPhotoLibrary:]( &OBJC_CLASS___MADVectorDatabaseManager,  "sharedDatabaseWithPhotoLibrary:",  v101));
    v81 = (void *)objc_claimAutoreleasedReturnValue(-[VCPMADSceneLibraryProcessingTask cancelBlock](self, "cancelBlock"));
    id v102 = 0LL;
    unsigned int v82 = [v80 rebuildWithForce:0 cancelBlock:v81 extendTimeoutBlock:&stru_1001BD098 error:&v102];
    id v83 = v102;

    if (v82)
    {
      uint64_t v86 = MediaAnalysisLogLevel(v84, v85);
      if ((int)v86 >= 3)
      {
        uint64_t v88 = VCPLogInstance(v86, v87);
        uint64_t v89 = (os_log_s *)objc_claimAutoreleasedReturnValue(v88);
        if (os_log_type_enabled(v89, v95))
        {
          *(_DWORD *)buf = 138412546;
          v108 = v98;
          __int16 v109 = 2112;
          uint64_t v110 = (uint64_t)v83;
          _os_log_impl((void *)&_mh_execute_header, v89, v95, "%@ Failed to build VSKDB - %@", buf, 0x16u);
        }
      }

      int v23 = 1;
      int v11 = v82;
    }

    else
    {
      int v23 = 0;
    }
  }

- (BOOL)run:(id *)a3
{
  if ((+[PFSceneTaxonomy mad_isExpectedTaxonomy](&OBJC_CLASS___PFSceneTaxonomy, "mad_isExpectedTaxonomy") & 1) != 0)
  {
    v12.receiver = self;
    v12.super_class = (Class)&OBJC_CLASS___VCPMADSceneLibraryProcessingTask;
    return -[VCPMADPhotosLibraryProcessingTask run:](&v12, "run:", a3);
  }

  else
  {
    NSErrorUserInfoKey v13 = NSLocalizedDescriptionKey;
    v6 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"[%@] MAD tracked taxonomy identifier is not the latest in Photos; skip scene processing",
           objc_opt_class(self));
    v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
    uint64_t v14 = v7;
    id v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v14,  &v13,  1LL));
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  NSOSStatusErrorDomain,  -18LL,  v8));
    id v10 = *a3;
    *a3 = v9;

    int v11 = (void (**)(void, void, void))objc_claimAutoreleasedReturnValue( -[VCPMADSceneLibraryProcessingTask completionHandler]( self,  "completionHandler"));
    ((void (**)(void, void, id))v11)[2](v11, 0LL, *a3);

    return 0;
  }

- (void).cxx_destruct
{
}

@end