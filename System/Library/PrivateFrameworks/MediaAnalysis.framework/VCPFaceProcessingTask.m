@interface VCPFaceProcessingTask
+ (BOOL)_concurrentFaceProcessing;
+ (BOOL)_concurrentFaceStagings;
+ (id)taskWithPhotoLibrary:(id)a3 andContext:(id)a4 andCancelBlock:(id)a5;
+ (unint64_t)_concurrentFaceProcessingThreadCount;
- (BOOL)_copyResourceFromURL:(id)a3 toURL:(id *)a4 forAsset:(id)a5 error:(id *)a6;
- (BOOL)allowStreaming;
- (BOOL)autoCancellable;
- (BOOL)isCancelled;
- (PHPhotoLibrary)photoLibrary;
- (VCPDatabaseWriter)database;
- (VCPFaceProcessingTask)init;
- (VCPFaceProcessingTask)initWithPhotoLibrary:(id)a3 andContext:(id)a4 andCancelBlock:(id)a5;
- (float)resourceRequirement;
- (int)_detectAsset:(id)a3 withResults:(id *)a4 andBatchContext:(id)a5;
- (int)_dispatchAssets:(id)a3 withBatchContext:(id)a4;
- (int)_publishClusterAndPersonProcessingWithBatchContext:(id)a3;
- (int)_recoverAttemptsForAssets:(id)a3 withProcessingStatusMap:(id)a4;
- (int)_removeTemporaryDownloadDirectory;
- (int)flush;
- (int)processAssets:(id)a3;
- (int)processFaceCrops;
- (int)processGalleryPersons:(BOOL *)a3;
- (int)promotePersons;
- (int)promotePets;
- (int)run;
- (void)_asyncAnalyzeAsset:(id)a3 andBatchContext:(id)a4;
- (void)_processDetectionResults:(id)a3 withDetectionStatus:(int)a4 asset:(id)a5 andBatchContext:(id)a6;
- (void)cancel;
- (void)dealloc;
- (void)setAllowStreaming:(BOOL)a3;
@end

@implementation VCPFaceProcessingTask

- (VCPFaceProcessingTask)init
{
  return 0LL;
}

- (VCPFaceProcessingTask)initWithPhotoLibrary:(id)a3 andContext:(id)a4 andCancelBlock:(id)a5
{
  id v9 = a3;
  id v80 = a4;
  v10 = (Block_layout *)a5;
  v87.receiver = self;
  v87.super_class = (Class)&OBJC_CLASS___VCPFaceProcessingTask;
  v11 = -[VCPFaceProcessingTask init](&v87, "init");
  v12 = v11;
  if (v11)
  {
    p_photoLibrary = (id *)&v11->_photoLibrary;
    objc_storeStrong((id *)&v11->_photoLibrary, a3);
    p_context = &v12->_context;
    objc_storeStrong((id *)&v12->_context, a4);
    if (v10) {
      v15 = v10;
    }
    else {
      v15 = &stru_1001BCAE0;
    }
    v79 = objc_retainBlock(v15);
    v16 = objc_retainBlock(v79);
    id cancelBlock = v12->_cancelBlock;
    v12->_id cancelBlock = v16;

    uint64_t v18 = objc_claimAutoreleasedReturnValue( +[VCPDatabaseManager sharedDatabaseForPhotoLibrary:]( &OBJC_CLASS___VCPDatabaseManager,  "sharedDatabaseForPhotoLibrary:",  *p_photoLibrary));
    database = v12->_database;
    v12->_database = (VCPDatabaseWriter *)v18;

    v20 = -[VCPFaceAnalyzer initWithContext:](objc_alloc(&OBJC_CLASS___VCPFaceAnalyzer), "initWithContext:", *p_context);
    analyzer = v12->_analyzer;
    v12->_analyzer = v20;

    v22 = -[VCPFaceCropManager initWithPhotoLibrary:andContext:]( objc_alloc(&OBJC_CLASS___VCPFaceCropManager),  "initWithPhotoLibrary:andContext:",  *p_photoLibrary,  *p_context);
    faceCropManager = v12->_faceCropManager;
    v12->_faceCropManager = v22;

    if (objc_msgSend(v9, "mad_useVUGallery"))
    {
      if (objc_msgSend(*p_photoLibrary, "vcp_isSyndicationLibrary"))
      {
        v24 = (void *)objc_claimAutoreleasedReturnValue( +[PHPhotoLibrary vcp_defaultPhotoLibrary]( &OBJC_CLASS___PHPhotoLibrary,  "vcp_defaultPhotoLibrary"));
        v25 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "vcp_visionCacheStorageDirectoryURL"));

        id v26 = [sub_1000AFB64() syndication];
        v27 = (NSArray *)objc_claimAutoreleasedReturnValue(v26);
      }

      else
      {
        uint64_t v34 = objc_claimAutoreleasedReturnValue(objc_msgSend(*p_photoLibrary, "vcp_visionCacheStorageDirectoryURL"));
        id v35 = [sub_1000AFB64() photos];
        v27 = (NSArray *)objc_claimAutoreleasedReturnValue(v35);
        v25 = (dispatch_queue_attr_s *)v34;
      }

      uint64_t v88 = 0LL;
      v89 = &v88;
      uint64_t v90 = 0x2050000000LL;
      v36 = (void *)qword_1001E65D0;
      uint64_t v91 = qword_1001E65D0;
      if (!qword_1001E65D0)
      {
        *(void *)&__int128 buf = _NSConcreteStackBlock;
        *((void *)&buf + 1) = 3221225472LL;
        v93 = sub_1000B8654;
        v94 = &unk_1001B9F10;
        v95 = &v88;
        sub_1000B8654((uint64_t)&buf);
        v36 = (void *)v89[3];
      }

      v37 = v36;
      _Block_object_dispose(&v88, 8);
      id v84 = 0LL;
      v38 = (GDVUVisualUnderstandingService *)[[v37 alloc] initWithClient:v27 version:1 url:v25 error:&v84];
      publishDetectionAndProcessPersonQueue = (OS_dispatch_queue *)v84;
      vuService = v12->_vuService;
      v12->_vuService = v38;

      if (!v12->_vuService)
      {
        uint64_t v74 = MediaAnalysisLogLevel(v41, v42);
        if ((int)v74 >= 3)
        {
          uint64_t v76 = VCPLogInstance(v74, v75);
          v77 = (os_log_s *)objc_claimAutoreleasedReturnValue(v76);
          os_log_type_t v78 = VCPLogToOSLogType[3];
          if (os_log_type_enabled(v77, v78))
          {
            LODWORD(buf) = 138412290;
            *(void *)((char *)&buf + 4) = publishDetectionAndProcessPersonQueue;
            _os_log_impl( (void *)&_mh_execute_header,  v77,  v78,  "Failed to create GDVUVisualUnderstandingService - %@",  (uint8_t *)&buf,  0xCu);
          }
        }

        v28 = 0LL;
        goto LABEL_21;
      }

      if (![v80 skipGallerySyncing])
      {
        v43 = objc_alloc_init(&OBJC_CLASS___VCPTimeMeasurement);
        -[VCPTimeMeasurement start](v43, "start");
        qos_class_t v44 = qos_class_self();
        dispatch_queue_global_t global_queue = dispatch_get_global_queue(v44, 0LL);
        v46 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(global_queue);
        block[0] = _NSConcreteStackBlock;
        block[1] = 3221225472LL;
        block[2] = sub_1000AFC18;
        block[3] = &unk_1001B9E70;
        v82 = v12;
        v83 = v43;
        v47 = v43;
        dispatch_async(v46, block);
      }
    }

    else
    {
      v29 = objc_alloc(&OBJC_CLASS___VCPFaceClusterer);
      id v30 = *p_photoLibrary;
      v31 = *p_context;
      v85[0] = _NSConcreteStackBlock;
      v85[1] = 3221225472LL;
      v85[2] = sub_1000AFB08;
      v85[3] = &unk_1001BBED8;
      v86 = v79;
      v32 = -[VCPFaceClusterer initWithPhotoLibrary:context:cancelOrExtendTimeoutBlock:]( v29,  "initWithPhotoLibrary:context:cancelOrExtendTimeoutBlock:",  v30,  v31,  v85);
      faceClusterer = v12->_faceClusterer;
      v12->_faceClusterer = v32;

      v25 = v86;
    }

    dispatch_group_t v48 = dispatch_group_create();
    downloadGroup = v12->_downloadGroup;
    v12->_downloadGroup = (OS_dispatch_group *)v48;

    dispatch_group_t v50 = dispatch_group_create();
    detectionGroup = v12->_detectionGroup;
    v12->_detectionGroup = (OS_dispatch_group *)v50;

    dispatch_queue_attr_t v52 = dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v53 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v52);
    dispatch_queue_t v54 = dispatch_queue_create("com.apple.mediaanalysis.detectionQueue", v53);
    detectionQueue = v12->_detectionQueue;
    v12->_detectionQueue = (OS_dispatch_queue *)v54;

    dispatch_queue_attr_t v56 = dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v57 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v56);
    dispatch_queue_t v58 = dispatch_queue_create("com.apple.mediaanalysis.postDetectionQueue", v57);
    postDetectionQueue = v12->_postDetectionQueue;
    v12->_postDetectionQueue = (OS_dispatch_queue *)v58;

    v12->_detectionProcessingJobCount = 0LL;
    v12->_detectionProcessingQueuesAllowed = 0LL;
    v60 = (NSArray *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
    for (unint64_t i = 0; i < (unint64_t)[(id)objc_opt_class(v12) _concurrentFaceProcessingThreadCount]; ++i)
    {
      id v62 = objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString, "stringWithFormat:", @"com.apple.mediaanalysis.detectionQueue%lu", i));
      dispatch_queue_t v63 = dispatch_queue_create((const char *)[v62 UTF8String], 0);
      qos_class_t v64 = qos_class_self();
      dispatch_queue_global_t v65 = dispatch_get_global_queue(v64, 0LL);
      v66 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(v65);
      dispatch_set_target_queue(v63, v66);

      -[NSArray addObject:](v60, "addObject:", v63);
    }

    detectionProcessingQueues = v12->_detectionProcessingQueues;
    v12->_detectionProcessingQueues = v60;
    v27 = v60;

    v12->_publishDetectionAndProcessPersonStatus = 0;
    dispatch_group_t v68 = dispatch_group_create();
    publishDetectionAndProcessPersonGroup = v12->_publishDetectionAndProcessPersonGroup;
    v12->_publishDetectionAndProcessPersonGroup = (OS_dispatch_group *)v68;

    dispatch_queue_attr_t v70 = dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v25 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v70);
    dispatch_queue_t v71 = dispatch_queue_create("com.apple.mediaanalysis.processPersonQueue", v25);
    publishDetectionAndProcessPersonQueue = v12->_publishDetectionAndProcessPersonQueue;
    v12->_publishDetectionAndProcessPersonQueue = (OS_dispatch_queue *)v71;
    v28 = v12;
LABEL_21:

    goto LABEL_22;
  }

  v28 = 0LL;
LABEL_22:
  v72 = v28;

  return v72;
}

+ (id)taskWithPhotoLibrary:(id)a3 andContext:(id)a4 andCancelBlock:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = [objc_alloc((Class)objc_opt_class(a1)) initWithPhotoLibrary:v8 andContext:v9 andCancelBlock:v10];

  return v11;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___VCPFaceProcessingTask;
  -[VCPFaceProcessingTask dealloc](&v3, "dealloc");
}

- (float)resourceRequirement
{
  return 1.0;
}

- (void)cancel
{
}

- (BOOL)isCancelled
{
  unsigned __int8 v4 = atomic_load((unsigned __int8 *)&self->_cancel);
  return v4 & 1;
}

- (int)_removeTemporaryDownloadDirectory
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
  objc_super v3 = NSTemporaryDirectory();
  unsigned __int8 v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue([v4 stringByAppendingPathComponent:kDownloadCacheDirectory]);
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL fileURLWithPath:](&OBJC_CLASS___NSURL, "fileURLWithPath:", v5));

  v7 = (void *)objc_claimAutoreleasedReturnValue([v6 path]);
  unsigned __int8 v8 = [v2 fileExistsAtPath:v7 isDirectory:0];

  if ((v8 & 1) != 0)
  {
    id v26 = 0LL;
    unsigned __int8 v11 = [v2 removeItemAtURL:v6 error:&v26];
    v12 = (os_log_s *)v26;
    v14 = v12;
    if ((v11 & 1) == 0)
    {
      uint64_t v15 = MediaAnalysisLogLevel(v12, v13);
      if ((int)v15 >= 3)
      {
        uint64_t v17 = VCPLogInstance(v15, v16);
        uint64_t v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(v17);
        os_log_type_t v19 = VCPLogToOSLogType[3];
        if (os_log_type_enabled(v18, v19))
        {
          *(_DWORD *)__int128 buf = 138412546;
          v28 = v6;
          __int16 v29 = 2112;
          id v30 = v14;
          _os_log_impl( (void *)&_mh_execute_header,  v18,  v19,  "Failed to remove temporary download directory %@ - %@",  buf,  0x16u);
        }
      }

      int v20 = -36;
      goto LABEL_12;
    }
  }

  else
  {
    uint64_t v21 = MediaAnalysisLogLevel(v9, v10);
    if ((int)v21 < 7)
    {
      int v20 = 0;
      goto LABEL_14;
    }

    uint64_t v23 = VCPLogInstance(v21, v22);
    v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v23);
    os_log_type_t v24 = VCPLogToOSLogType[7];
    if (os_log_type_enabled(v14, v24))
    {
      *(_DWORD *)__int128 buf = 138412290;
      v28 = v6;
      _os_log_impl((void *)&_mh_execute_header, v14, v24, "Temporary download directory %@ does not exist", buf, 0xCu);
    }
  }

  int v20 = 0;
LABEL_12:

LABEL_14:
  return v20;
}

+ (BOOL)_concurrentFaceProcessing
{
  unsigned __int8 v2 = atomic_load((unsigned __int8 *)&qword_1001E65B8);
  if ((v2 & 1) == 0 && __cxa_guard_acquire(&qword_1001E65B8))
  {
    byte_1001E65B0 = DeviceHasANE();
    __cxa_guard_release(&qword_1001E65B8);
  }

  return byte_1001E65B0;
}

+ (unint64_t)_concurrentFaceProcessingThreadCount
{
  return 4LL;
}

+ (BOOL)_concurrentFaceStagings
{
  return 0;
}

- (int)_detectAsset:(id)a3 withResults:(id *)a4 andBatchContext:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  *a4 = 0LL;
  if (!-[VCPFaceProcessingTask isCancelled](self, "isCancelled"))
  {
    unsigned __int8 v11 = (void *)objc_claimAutoreleasedReturnValue([v8 adjustmentVersion]);

    if (!v11)
    {
      uint64_t v25 = MediaAnalysisLogLevel(v12, v13);
      if ((int)v25 < 3)
      {
        int v10 = -23803;
        goto LABEL_46;
      }

      uint64_t v27 = VCPLogInstance(v25, v26);
      uint64_t v22 = (os_log_s *)objc_claimAutoreleasedReturnValue(v27);
      os_log_type_t v28 = VCPLogToOSLogType[3];
      if (os_log_type_enabled(v22, v28))
      {
        __int16 v29 = (void *)objc_claimAutoreleasedReturnValue([v8 localIdentifier]);
        *(_DWORD *)__int128 buf = 138412290;
        uint64_t v79 = (uint64_t)v29;
        _os_log_impl((void *)&_mh_execute_header, v22, v28, "[%@] Adjustment version is nil", buf, 0xCu);
      }

      int v10 = -23803;
LABEL_45:

      goto LABEL_46;
    }

    v14 = (void *)objc_claimAutoreleasedReturnValue([v9 completedLocalIdentifiersFromComputeSync]);
    uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue([v8 localIdentifier]);
    unsigned int v16 = [v14 containsObject:v15];

    if (v16)
    {
      uint64_t v19 = MediaAnalysisLogLevel(v17, v18);
      if ((int)v19 < 6)
      {
        int v10 = 0;
        goto LABEL_46;
      }

      uint64_t v21 = VCPLogInstance(v19, v20);
      uint64_t v22 = (os_log_s *)objc_claimAutoreleasedReturnValue(v21);
      os_log_type_t v23 = VCPLogToOSLogType[6];
      if (os_log_type_enabled(v22, v23))
      {
        os_log_type_t v24 = (void *)objc_claimAutoreleasedReturnValue([v8 localIdentifier]);
        *(_DWORD *)__int128 buf = 138412290;
        uint64_t v79 = (uint64_t)v24;
        _os_log_impl( (void *)&_mh_execute_header,  v22,  v23,  "[Face][%@] Analysis already complete from compute sync ingestion; skipping",
          buf,
          0xCu);
      }

      int v10 = 0;
      goto LABEL_45;
    }

    id v30 = (void *)objc_claimAutoreleasedReturnValue([v8 localIdentifier]);
    uint64_t v22 = (os_log_s *)objc_claimAutoreleasedReturnValue([v9 resourceForLocalIdentifier:v30]);

    uint64_t v31 = objc_claimAutoreleasedReturnValue(-[os_log_s resourceURL](v22, "resourceURL"));
    v33 = (void *)v31;
    if (!v31
      || (uint64_t v34 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager")),
          id v35 = (void *)objc_claimAutoreleasedReturnValue([v33 path]),
          unsigned __int8 v36 = [v34 fileExistsAtPath:v35],
          v35,
          v34,
          (v36 & 1) == 0))
    {
      uint64_t v64 = MediaAnalysisLogLevel(v31, v32);
      if ((int)v64 < 3)
      {
        int v10 = -23802;
LABEL_44:

        goto LABEL_45;
      }

      uint64_t v66 = VCPLogInstance(v64, v65);
      dispatch_queue_attr_t v52 = (os_log_s *)objc_claimAutoreleasedReturnValue(v66);
      os_log_type_t v67 = VCPLogToOSLogType[3];
      if (os_log_type_enabled(v52, v67))
      {
        dispatch_group_t v68 = (void *)objc_claimAutoreleasedReturnValue([v8 localIdentifier]);
        *(_DWORD *)__int128 buf = 138412290;
        uint64_t v79 = (uint64_t)v68;
        _os_log_impl((void *)&_mh_execute_header, v52, v67, "[%@] No local resource", buf, 0xCu);
      }

      int v10 = -23802;
LABEL_43:

      goto LABEL_44;
    }

    uint64_t v37 = MediaAnalysisLogLevel(v31, v32);
    if ((int)v37 >= 6)
    {
      uint64_t v39 = VCPLogInstance(v37, v38);
      v40 = (os_log_s *)objc_claimAutoreleasedReturnValue(v39);
      os_log_type_t v41 = VCPLogToOSLogType[6];
      if (os_log_type_enabled(v40, v41))
      {
        spida = (void *)objc_claimAutoreleasedReturnValue([v8 localIdentifier]);
        id v42 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "vcp_typeDescription"));
        v43 = (void *)objc_claimAutoreleasedReturnValue(-[os_log_s resource](v22, "resource"));
        *(_DWORD *)__int128 buf = 138413058;
        uint64_t v79 = (uint64_t)spida;
        __int16 v80 = 2112;
        *(void *)v81 = v42;
        *(_WORD *)&v81[8] = 2048;
        id v82 = [v43 type];
        __int16 v83 = 2112;
        id v84 = v33;
        _os_log_impl( (void *)&_mh_execute_header,  v40,  v41,  "[Face][%@] Analyzing %@ using resource (%lu) %@",  buf,  0x2Au);
      }
    }

    uint64_t v44 = VCPSignPostLog(v37);
    v45 = (os_log_s *)objc_claimAutoreleasedReturnValue(v44);
    os_signpost_id_t spid = os_signpost_id_generate(v45);

    uint64_t v47 = VCPSignPostLog(v46);
    dispatch_group_t v48 = (os_log_s *)objc_claimAutoreleasedReturnValue(v47);
    v49 = v48;
    if (spid - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v48))
    {
      *(_WORD *)__int128 buf = 0;
      _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v49,  OS_SIGNPOST_INTERVAL_BEGIN,  spid,  "VCPFaceProcessingAnalyzeAsset",  (const char *)&unk_100199097,  buf,  2u);
    }

    analyzer = self->_analyzer;
    v51 = (void *)objc_claimAutoreleasedReturnValue(-[os_log_s resource](v22, "resource"));
    id v77 = 0LL;
    int v10 = -[VCPFaceAnalyzer analyzeAsset:withResource:resourceURL:isBestResource:quickMode:results:]( analyzer,  "analyzeAsset:withResource:resourceURL:isBestResource:quickMode:results:",  v8,  v51,  v33,  -[os_log_s isBestResource](v22, "isBestResource"),  0LL,  &v77);
    dispatch_queue_attr_t v52 = (os_log_s *)v77;

    if (!v10 && v52)
    {
      dispatch_queue_t v54 = (void *)objc_claimAutoreleasedReturnValue( -[os_log_s objectForKeyedSubscript:]( v52,  "objectForKeyedSubscript:",  VCPAnalysisResultWarningImageTooSmallKey));
      unsigned int v74 = [v54 BOOLValue];

      id v55 = -[os_log_s isBestResource](v22, "isBestResource");
      int v56 = (int)v55;
      uint64_t v58 = MediaAnalysisLogLevel(v55, v57);
      if ((int)v58 >= 7)
      {
        uint64_t v60 = VCPLogInstance(v58, v59);
        v61 = (os_log_s *)objc_claimAutoreleasedReturnValue(v60);
        os_log_type_t v62 = VCPLogToOSLogType[7];
        if (os_log_type_enabled(v61, v62))
        {
          uint64_t v63 = objc_claimAutoreleasedReturnValue([v8 localIdentifier]);
          *(_DWORD *)__int128 buf = 138412802;
          uint64_t v79 = v63;
          __int16 v80 = 1024;
          *(_DWORD *)v81 = v74;
          *(_WORD *)&v81[4] = 1024;
          *(_DWORD *)&v81[6] = v56;
          v73 = (void *)v63;
          _os_log_impl( (void *)&_mh_execute_header,  v61,  v62,  "[%@] Resource Too Small: %d; Best Resource: %d",
            buf,
            0x18u);
        }
      }

      if (((v74 ^ 1 | v56) & 1) != 0)
      {
        int v10 = 0;
      }

      else
      {
        v53 = (os_log_s *)_os_feature_enabled_impl("MediaAnalysis", "FCPeople");
        int v10 = -23802;
        if (!(_DWORD)v53) {
          goto LABEL_39;
        }
      }

      v53 = v52;
      *a4 = v53;
    }

- (void)_processDetectionResults:(id)a3 withDetectionStatus:(int)a4 asset:(id)a5 andBatchContext:(id)a6
{
  id v84 = self;
  id v9 = a3;
  id v10 = a5;
  id v11 = a6;
  uint64_t v88 = (void *)objc_claimAutoreleasedReturnValue(+[VCPMADCoreAnalyticsManager sharedManager](&OBJC_CLASS___VCPMADCoreAnalyticsManager, "sharedManager"));
  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue([v11 completedLocalIdentifiersFromComputeSync]);
  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue([v10 localIdentifier]);
  unsigned int v14 = [v12 containsObject:v13];

  if (!v14)
  {
    os_log_type_t v24 = (void *)objc_claimAutoreleasedReturnValue([v10 localIdentifier]);
    uint64_t v25 = (void *)objc_claimAutoreleasedReturnValue([v11 resourceForLocalIdentifier:v24]);

    objc_super v87 = v25;
    if ([v25 requestDownload])
    {
      uint64_t v26 = (void *)objc_claimAutoreleasedReturnValue([v25 resourceURL]);
      if (v26)
      {
        uint64_t v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
        id v89 = 0LL;
        unsigned __int8 v28 = [v27 removeItemAtURL:v26 error:&v89];
        id v29 = v89;

        if ((v28 & 1) == 0)
        {
          uint64_t v32 = MediaAnalysisLogLevel(v30, v31);
          if ((int)v32 >= 3)
          {
            uint64_t v34 = VCPLogInstance(v32, v33);
            id v35 = (os_log_s *)objc_claimAutoreleasedReturnValue(v34);
            os_log_type_t v36 = VCPLogToOSLogType[3];
            if (os_log_type_enabled(v35, v36))
            {
              uint64_t v37 = (void *)objc_claimAutoreleasedReturnValue([v10 localIdentifier]);
              *(_DWORD *)__int128 buf = 138412802;
              v95 = v37;
              __int16 v96 = 2112;
              *(void *)v97 = v26;
              *(_WORD *)&v97[8] = 2112;
              id v98 = v29;
              _os_log_impl( (void *)&_mh_execute_header,  v35,  v36,  "[%@] Failed to remove downloaded resource %@ - %@",  buf,  0x20u);
            }
          }
        }
      }

      else
      {
        id v29 = 0LL;
      }
    }

    if (!v9 || a4)
    {
      uint64_t v59 = _os_feature_enabled_impl("MediaAnalysis", "FCPeople");
      if (v9) {
        int v61 = v59;
      }
      else {
        int v61 = 0;
      }
      if (a4 == -23802 && v61)
      {
        v90[0] = MediaAnalysisVersionKey;
        os_log_type_t v62 = (void *)objc_claimAutoreleasedReturnValue([v10 photoLibrary]);
        uint64_t v63 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithInt:]( NSNumber,  "numberWithInt:",  objc_msgSend(v62, "mad_faceProcessingInternalVersion")));
        v91[0] = v63;
        v90[1] = MediaAnalysisDateAnalyzedKey;
        uint64_t v64 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
        v91[1] = v64;
        v91[2] = &off_1001C7EB0;
        v90[2] = MediaAnalysisAnalysisTypesKey;
        v90[3] = MediaAnalysisResultsKey;
        v91[3] = v9;
        uint64_t v65 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v91,  v90,  4LL));

        uint64_t v66 = (void *)objc_claimAutoreleasedReturnValue([v11 changeBatch]);
        [v66 updateAsset:v10 withAnalysis:v65];
      }

      uint64_t v67 = MediaAnalysisLogLevel(v59, v60);
      if ((int)v67 >= 4)
      {
        uint64_t v69 = VCPLogInstance(v67, v68);
        dispatch_queue_attr_t v70 = (os_log_s *)objc_claimAutoreleasedReturnValue(v69);
        os_log_type_t v71 = VCPLogToOSLogType[4];
        if (os_log_type_enabled(v70, v71))
        {
          v72 = (void *)objc_claimAutoreleasedReturnValue([v10 localIdentifier]);
          unsigned int v73 = [v25 downloadStatus];
          *(_DWORD *)__int128 buf = 138412802;
          v95 = v72;
          __int16 v96 = 1024;
          *(_DWORD *)v97 = a4;
          *(_WORD *)&v97[4] = 1024;
          *(_DWORD *)&v97[6] = v73;
          _os_log_impl( (void *)&_mh_execute_header,  v70,  v71,  "[%@] Analysis failed (detection:%d) (download:%d)",  buf,  0x18u);
        }
      }

      os_log_type_t v41 = @"NumberOfAssetsSoftFailure";
      if (a4 == -23802)
      {
        if ([v25 requestDownload]
          && [v25 downloadStatus] == -23808)
        {
          unsigned int v74 = &VCPAnalyticsFieldNumberOfAssetsDownloadThrottled;
          uint64_t v75 = 7LL;
        }

        else
        {
          unsigned int v74 = &VCPAnalyticsFieldNumberOfAssetsNoResource;
          uint64_t v75 = 2LL;
        }

        id v77 = *v74;

        os_log_type_t v41 = v77;
      }

      else
      {
        uint64_t v75 = 3LL;
      }

      os_log_type_t v78 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "processingStatusMap", v84));
      uint64_t v79 = (void *)objc_claimAutoreleasedReturnValue([v10 localIdentifier]);
      dispatch_queue_t v54 = (void *)objc_claimAutoreleasedReturnValue([v78 objectForKeyedSubscript:v79]);

      __int16 v80 = (void *)objc_claimAutoreleasedReturnValue([v54 currentAttemptDate]);
      int v56 = (void *)objc_claimAutoreleasedReturnValue( objc_msgSend( v10,  "mad_nextAttemptDateForStatus:currentAttemptDate:attemptCount:",  v75,  v80,  (char *)objc_msgSend(v54, "previousAttempts") + 1));

      v81 = *(void **)(v86 + 160);
      id v82 = (void *)objc_claimAutoreleasedReturnValue([v10 localIdentifier]);
      [v81 updateProcessingStatus:v75 andNextAttemptDate:v56 forLocalIdentifier:v82 andTaskID:3];

      if (a4 != -128)
      {
        __int16 v83 = (void *)objc_claimAutoreleasedReturnValue([v11 unprocessedAssets]);
        [v83 removeObject:v10];
      }

      [v88 accumulateInt64Value:1 forField:v41 andEvent:@"com.apple.mediaanalysisd.FaceAnalysisRunSession"];
    }

    else
    {
      v92[0] = MediaAnalysisVersionKey;
      uint64_t v38 = (void *)objc_claimAutoreleasedReturnValue([v10 photoLibrary]);
      uint64_t v39 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithInt:]( NSNumber,  "numberWithInt:",  objc_msgSend(v38, "mad_faceProcessingInternalVersion")));
      v93[0] = v39;
      v92[1] = MediaAnalysisDateAnalyzedKey;
      v40 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
      v93[1] = v40;
      v93[2] = &off_1001C7EB0;
      v92[2] = MediaAnalysisAnalysisTypesKey;
      v92[3] = MediaAnalysisResultsKey;
      v93[3] = v9;
      os_log_type_t v41 = (__CFString *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v93,  v92,  4LL));

      id v42 = (void *)objc_claimAutoreleasedReturnValue([v11 changeBatch]);
      unsigned int v43 = [v42 updateAsset:v10 withAnalysis:v41];

      if (!v43)
      {
        uint64_t v76 = (void *)objc_claimAutoreleasedReturnValue([v11 processedAssets]);
        [v76 addObject:v10];

        [v88 accumulateInt64Value:1 forField:@"NumberOfAssetsAnalyzed" andEvent:@"com.apple.mediaanalysisd.FaceAnalysisRunSession"];
LABEL_46:

        goto LABEL_47;
      }

      uint64_t v46 = MediaAnalysisLogLevel(v44, v45);
      if ((int)v46 >= 4)
      {
        uint64_t v48 = VCPLogInstance(v46, v47);
        v49 = (os_log_s *)objc_claimAutoreleasedReturnValue(v48);
        os_log_type_t v50 = VCPLogToOSLogType[4];
        if (os_log_type_enabled(v49, v50))
        {
          v51 = (void *)objc_claimAutoreleasedReturnValue([v10 localIdentifier]);
          *(_DWORD *)__int128 buf = 138412546;
          v95 = v51;
          __int16 v96 = 1024;
          *(_DWORD *)v97 = v43;
          _os_log_impl((void *)&_mh_execute_header, v49, v50, "[%@] Analysis failed to update change (%d)", buf, 0x12u);
        }
      }

      dispatch_queue_attr_t v52 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "processingStatusMap", v84));
      v53 = (void *)objc_claimAutoreleasedReturnValue([v10 localIdentifier]);
      dispatch_queue_t v54 = (void *)objc_claimAutoreleasedReturnValue([v52 objectForKeyedSubscript:v53]);

      id v55 = (void *)objc_claimAutoreleasedReturnValue([v54 currentAttemptDate]);
      int v56 = (void *)objc_claimAutoreleasedReturnValue( objc_msgSend( v10,  "mad_nextAttemptDateForStatus:currentAttemptDate:attemptCount:",  3,  v55,  (char *)objc_msgSend(v54, "previousAttempts") + 1));

      uint64_t v57 = *(void **)(v85 + 160);
      uint64_t v58 = (void *)objc_claimAutoreleasedReturnValue([v10 localIdentifier]);
      [v57 updateProcessingStatus:3 andNextAttemptDate:v56 forLocalIdentifier:v58 andTaskID:3];

      [v88 accumulateInt64Value:1 forField:@"NumberOfAssetsSoftFailure" andEvent:@"com.apple.mediaanalysisd.FaceAnalysisRunSession"];
    }

    goto LABEL_46;
  }

  uint64_t v17 = MediaAnalysisLogLevel(v15, v16);
  if ((int)v17 >= 6)
  {
    uint64_t v19 = VCPLogInstance(v17, v18);
    uint64_t v20 = (os_log_s *)objc_claimAutoreleasedReturnValue(v19);
    os_log_type_t v21 = VCPLogToOSLogType[6];
    if (os_log_type_enabled(v20, v21))
    {
      uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "localIdentifier", v84));
      *(_DWORD *)__int128 buf = 138412290;
      v95 = v22;
      _os_log_impl( (void *)&_mh_execute_header,  v20,  v21,  "[%@] Analysis already complete from compute sync ingestion; skip updating change batch",
        buf,
        0xCu);
    }
  }

  os_log_type_t v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "processedAssets", v84));
  [v23 addObject:v10];

  [v88 accumulateInt64Value:1 forField:@"NumberOfAssetsAnalyzed" andEvent:@"com.apple.mediaanalysisd.FaceAnalysisRunSession"];
LABEL_47:
}

- (void)_asyncAnalyzeAsset:(id)a3 andBatchContext:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  detectionQueue = (dispatch_queue_s *)self->_detectionQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000B1480;
  block[3] = &unk_1001BBE70;
  void block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(detectionQueue, block);
}

- (BOOL)_copyResourceFromURL:(id)a3 toURL:(id *)a4 forAsset:(id)a5 error:(id *)a6
{
  id v9 = a3;
  id v45 = a5;
  id v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
  id v11 = NSTemporaryDirectory();
  id v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
  id v13 = (void *)objc_claimAutoreleasedReturnValue([v12 stringByAppendingPathComponent:kDownloadCacheDirectory]);
  unsigned int v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL fileURLWithPath:](&OBJC_CLASS___NSURL, "fileURLWithPath:", v13));

  id v15 = [v10 createDirectoryAtURL:v14 withIntermediateDirectories:1 attributes:0 error:a6];
  if ((_DWORD)v15)
  {
    uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue([v45 localIdentifier]);
    uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue(+[PHObject uuidFromLocalIdentifier:](&OBJC_CLASS___PHObject, "uuidFromLocalIdentifier:", v17));
    uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue([v9 pathExtension]);
    uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%@.%@", v18, v19));

    os_log_type_t v21 = (void *)objc_claimAutoreleasedReturnValue( +[NSURL fileURLWithPath:relativeToURL:]( &OBJC_CLASS___NSURL,  "fileURLWithPath:relativeToURL:",  v20,  v14));
    id v22 = [v10 copyItemAtURL:v9 toURL:v21 error:a6];
    BOOL v24 = (char)v22;
    if ((_DWORD)v22)
    {
      uint64_t v25 = MediaAnalysisLogLevel(v22, v23);
      if ((int)v25 >= 7)
      {
        uint64_t v27 = VCPLogInstance(v25, v26);
        unsigned __int8 v28 = (os_log_s *)objc_claimAutoreleasedReturnValue(v27);
        os_log_type_t v29 = VCPLogToOSLogType[7];
        if (os_log_type_enabled(v28, v29))
        {
          uint64_t v30 = (void *)objc_claimAutoreleasedReturnValue([v45 localIdentifier]);
          *(_DWORD *)__int128 buf = 138412802;
          uint64_t v47 = v30;
          __int16 v48 = 2112;
          id v49 = v9;
          __int16 v50 = 2112;
          id v51 = v21;
          _os_log_impl( (void *)&_mh_execute_header,  v28,  v29,  "[%@] Succesfully copied downloaded file from %@ to %@",  buf,  0x20u);
        }
      }

      *a4 = v21;
    }

    else
    {
      uint64_t v37 = MediaAnalysisLogLevel(v22, v23);
      if ((int)v37 >= 3)
      {
        uint64_t v39 = VCPLogInstance(v37, v38);
        v40 = (os_log_s *)objc_claimAutoreleasedReturnValue(v39);
        os_log_type_t v41 = VCPLogToOSLogType[3];
        if (os_log_type_enabled(v40, v41))
        {
          id v42 = (void *)objc_claimAutoreleasedReturnValue([v45 localIdentifier]);
          id v43 = *a6;
          *(_DWORD *)__int128 buf = 138413058;
          uint64_t v47 = v42;
          __int16 v48 = 2112;
          id v49 = v9;
          __int16 v50 = 2112;
          id v51 = v21;
          __int16 v52 = 2112;
          id v53 = v43;
          _os_log_impl( (void *)&_mh_execute_header,  v40,  v41,  "[%@] Failed to copy downloaded file from %@ to %@ - %@",  buf,  0x2Au);
        }
      }
    }

LABEL_18:
    goto LABEL_19;
  }

  uint64_t v31 = MediaAnalysisLogLevel(v15, v16);
  if ((int)v31 >= 3)
  {
    uint64_t v33 = VCPLogInstance(v31, v32);
    uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue(v33);
    os_log_type_t v34 = VCPLogToOSLogType[3];
    if (os_log_type_enabled((os_log_t)v20, v34))
    {
      id v35 = (void *)objc_claimAutoreleasedReturnValue([v45 localIdentifier]);
      id v36 = *a6;
      *(_DWORD *)__int128 buf = 138412802;
      uint64_t v47 = v35;
      __int16 v48 = 2112;
      id v49 = v14;
      __int16 v50 = 2112;
      id v51 = v36;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)v20,  v34,  "[%@] Failed to create directory %@ to store downloaded files - %@",  buf,  0x20u);
    }

    BOOL v24 = 0;
    goto LABEL_18;
  }

  BOOL v24 = 0;
LABEL_19:

  return v24;
}

- (int)_dispatchAssets:(id)a3 withBatchContext:(id)a4
{
  id v6 = a3;
  id v85 = a4;
  [v85 setHasPanorama:0];
  __int128 v108 = 0u;
  __int128 v109 = 0u;
  __int128 v106 = 0u;
  __int128 v107 = 0u;
  id obj = v6;
  id v7 = [obj countByEnumeratingWithState:&v106 objects:v114 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v107;
    do
    {
      id v9 = 0LL;
      id v10 = v4;
      do
      {
        if (*(void *)v107 != v8) {
          objc_enumerationMutation(obj);
        }
        id v11 = *(void **)(*((void *)&v106 + 1) + 8LL * (void)v9);
        id v12 = objc_autoreleasePoolPush();
        id v13 = (void *)objc_claimAutoreleasedReturnValue([v85 unprocessedAssets]);
        [v13 addObject:v11];

        database = self->_database;
        id v104 = 0LL;
        id v15 = (void *)objc_claimAutoreleasedReturnValue([v11 localIdentifier]);
        id v4 = (id)-[VCPDatabaseWriter queryProcessingStatus:attempts:lastAttemptDate:andNextAttemptDate:forLocalIdentifier:andTaskID:]( database,  "queryProcessingStatus:attempts:lastAttemptDate:andNextAttemptDate:forLocalIdentifier:andTaskID:",  buf,  &v105,  &v104,  0LL,  v15,  3LL);
        id v16 = v104;

        if ((_DWORD)v4)
        {
          int v17 = 0;
        }

        else
        {
          uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue( +[VCPFaceAssetProcessingStatusEntry entryWithPreviousStatus:previousAttempts:andLastAttemptDate:]( &OBJC_CLASS___VCPFaceAssetProcessingStatusEntry,  "entryWithPreviousStatus:previousAttempts:andLastAttemptDate:",  *(void *)buf,  v105,  v16));
          uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue([v85 processingStatusMap]);
          uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue([v11 localIdentifier]);
          [v19 setObject:v18 forKeyedSubscript:v20];

          os_log_type_t v21 = self->_database;
          uint64_t v22 = v105;
          uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate now](&OBJC_CLASS___NSDate, "now"));
          id v4 = (id)-[VCPDatabaseWriter setAttempts:asset:taskID:status:lastAttemptDate:]( v21,  "setAttempts:asset:taskID:status:lastAttemptDate:",  v22 + 1,  v11,  3LL,  1LL,  v23);

          int v17 = 0;
          if ((_DWORD)v4 != -108 && (_DWORD)v4 != -36 && (_DWORD)v4 != -23)
          {
            int v17 = 1;
            id v4 = v10;
          }
        }

        objc_autoreleasePoolPop(v12);
        if (!v17) {
          goto LABEL_62;
        }
        id v9 = (char *)v9 + 1;
        id v10 = v4;
      }

      while (v7 != v9);
      id v24 = [obj countByEnumeratingWithState:&v106 objects:v114 count:16];
      id v7 = v24;
    }

    while (v24);
  }

  LODWORD(v4) = -[VCPDatabaseWriter commit](self->_database, "commit");
  if (!(_DWORD)v4)
  {
    if ([(id)objc_opt_class(self) _concurrentFaceProcessing]
      && ([v85 hasPanorama] & 1) == 0)
    {
      id v26 = [(id)objc_opt_class(self) _concurrentFaceProcessingThreadCount];
      unint64_t v25 = 4LL;
    }

    else
    {
      unint64_t v25 = 1LL;
    }

    self->_detectionProcessingQueuesAllowed = v25;
    __int128 v100 = 0u;
    __int128 v101 = 0u;
    __int128 v102 = 0u;
    __int128 v103 = 0u;
    id v79 = obj;
    id v27 = [v79 countByEnumeratingWithState:&v100 objects:v113 count:16];
    if (v27)
    {
      uint64_t v82 = *(void *)v101;
      os_log_type_t v76 = VCPLogToOSLogType[4];
      os_log_type_t type = VCPLogToOSLogType[5];
      do
      {
        id v83 = v27;
        for (unint64_t i = 0LL; i != v83; unint64_t i = (char *)i + 1)
        {
          if (*(void *)v101 != v82) {
            objc_enumerationMutation(v79);
          }
          os_log_type_t v29 = *(void **)(*((void *)&v100 + 1) + 8LL * (void)i);
          uint64_t v30 = objc_autoreleasePoolPush();
          uint64_t v31 = (void *)objc_claimAutoreleasedReturnValue(+[VCPWatchdog sharedWatchdog](&OBJC_CLASS___VCPWatchdog, "sharedWatchdog"));
          [v31 pet];

          uint64_t v32 = (void *)objc_claimAutoreleasedReturnValue( +[VCPFaceUtils preferredResourcesForFaceProcessingWithAsset:]( &OBJC_CLASS___VCPFaceUtils,  "preferredResourcesForFaceProcessingWithAsset:",  v29));
          uint64_t v33 = (void *)objc_claimAutoreleasedReturnValue([v85 processingStatusMap]);
          os_log_type_t v34 = (void *)objc_claimAutoreleasedReturnValue([v29 localIdentifier]);
          id v35 = (void *)objc_claimAutoreleasedReturnValue([v33 objectForKeyedSubscript:v34]);

          if (v35
            && ![v35 previousAttempts]
            && _os_feature_enabled_impl("MediaAnalysis", "FCPeople"))
          {
            uint64_t v36 = objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "vcp_thumbnailResource"));
          }

          else
          {
            uint64_t v36 = objc_claimAutoreleasedReturnValue( +[VCPFaceUtils resourceForFaceProcessing:allowStreaming:]( &OBJC_CLASS___VCPFaceUtils,  "resourceForFaceProcessing:allowStreaming:",  v32,  self->_allowStreaming));
          }

          uint64_t v37 = (void *)v36;
          id v38 = +[VCPFaceUtils isBestResourceForFaceProcessing:fromResources:]( &OBJC_CLASS___VCPFaceUtils,  "isBestResourceForFaceProcessing:fromResources:",  v36,  v32);
          if (!v37)
          {
            dispatch_group_enter((dispatch_group_t)self->_detectionGroup);
LABEL_45:
            __int16 v50 = (void *)objc_claimAutoreleasedReturnValue([v37 privateFileURL]);
            id v51 = (void *)objc_claimAutoreleasedReturnValue([v29 localIdentifier]);
            [v85 storeResource:v37 resourceURL:v50 isBestResource:v38 requestDownload:0 downloadStatus:0 forLocalIdentifier:v51];

            -[VCPFaceProcessingTask _asyncAnalyzeAsset:andBatchContext:]( self,  "_asyncAnalyzeAsset:andBatchContext:",  v29,  v85);
            goto LABEL_59;
          }

          unsigned __int8 v39 = objc_msgSend(v37, "vcp_isLocallyAvailable");
          dispatch_group_enter((dispatch_group_t)self->_detectionGroup);
          if ((v39 & 1) != 0) {
            goto LABEL_45;
          }
          v40 = (void *)objc_claimAutoreleasedReturnValue( +[PHAssetResource vcp_allResourcesForAsset:]( &OBJC_CLASS___PHAssetResource,  "vcp_allResourcesForAsset:",  v29));
          id v84 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v40, "mad_computeSyncResource"));

          if (!v84) {
            goto LABEL_50;
          }
          v99[0] = _NSConcreteStackBlock;
          v99[1] = 3221225472LL;
          v99[2] = sub_1000B2628;
          v99[3] = &unk_1001B9E98;
          v99[4] = self;
          id v41 = objc_msgSend( v84,  "mad_isAnalysisCompleteFromComputeSyncForAsset:taskID:allowDownload:cancel:",  v29,  3,  1,  v99);
          if (!(_DWORD)v41)
          {
            uint64_t v52 = MediaAnalysisLogLevel(v41, v42);
            if ((int)v52 >= 5)
            {
              uint64_t v54 = VCPLogInstance(v52, v53);
              id v55 = (os_log_s *)objc_claimAutoreleasedReturnValue(v54);
              if (os_log_type_enabled(v55, type))
              {
                int v56 = (void *)objc_claimAutoreleasedReturnValue([v29 localIdentifier]);
                *(_DWORD *)__int128 buf = 138412290;
                *(void *)&uint8_t buf[4] = v56;
                _os_log_impl( (void *)&_mh_execute_header,  v55,  type,  "[Face][Download][%@] Analysis remains incomplete with compute sync, falling back to media resource download",  buf,  0xCu);
              }
            }

- (int)processAssets:(id)a3
{
  id v4 = a3;
  v5 = objc_autoreleasePoolPush();
  id v6 = (void *)objc_claimAutoreleasedReturnValue( +[VCPFaceProcessingBatchContext batchContextWithPhotoLibrary:clusterer:andContext:]( &OBJC_CLASS___VCPFaceProcessingBatchContext,  "batchContextWithPhotoLibrary:clusterer:andContext:",  self->_photoLibrary,  self->_faceClusterer,  self->_context));
  if (v6)
  {
    id v58 = objc_alloc_init(&OBJC_CLASS___VCPTimeMeasurement);
    -[VCPTimeMeasurement start](v58, "start");
    id v7 = objc_alloc_init(&OBJC_CLASS___VCPTimeMeasurement);
    -[VCPTimeMeasurement start](v7, "start");
    int v8 = -[VCPFaceProcessingTask _dispatchAssets:withBatchContext:](self, "_dispatchAssets:withBatchContext:", v4, v6);
    if (v8) {
      goto LABEL_41;
    }
    downloadGroup = self->_downloadGroup;
    dispatch_time_t v10 = dispatch_time(0LL, 100000000LL);
    uint64_t v11 = dispatch_group_wait((dispatch_group_t)downloadGroup, v10);
    if (v11)
    {
      os_log_type_t v13 = VCPLogToOSLogType[7];
      do
      {
        id v14 = (id)-[VCPFaceProcessingTask isCancelled](self, "isCancelled");
        if ((v14 & 1) != 0 || (id v14 = [v6 downloadTimedout], (_DWORD)v14))
        {
          uint64_t v16 = MediaAnalysisLogLevel(v14, v15);
          if ((int)v16 >= 7)
          {
            uint64_t v18 = VCPLogInstance(v16, v17);
            uint64_t v19 = (os_log_s *)objc_claimAutoreleasedReturnValue(v18);
            if (os_log_type_enabled(v19, v13))
            {
              uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue([v6 downloadRequests]);
              id v21 = [v20 count];
              *(_DWORD *)__int128 buf = 134217984;
              id v60 = v21;
              _os_log_impl((void *)&_mh_execute_header, v19, v13, "Cancelling all %lu download requests", buf, 0xCu);
            }
          }

          uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue([v6 downloadRequests]);
          [v22 enumerateKeysAndObjectsUsingBlock:&stru_1001BCB98];

          uint64_t v23 = dispatch_group_wait((dispatch_group_t)self->_downloadGroup, 0xFFFFFFFFFFFFFFFFLL);
          uint64_t v25 = MediaAnalysisLogLevel(v23, v24);
          if ((int)v25 >= 7)
          {
            uint64_t v27 = VCPLogInstance(v25, v26);
            unsigned __int8 v28 = (os_log_s *)objc_claimAutoreleasedReturnValue(v27);
            if (os_log_type_enabled(v28, v13))
            {
              os_log_type_t v29 = (void *)objc_claimAutoreleasedReturnValue([v6 downloadRequests]);
              id v30 = [v29 count];
              *(_DWORD *)__int128 buf = 134217984;
              id v60 = v30;
              _os_log_impl((void *)&_mh_execute_header, v28, v13, "Cancelled all %lu download requests", buf, 0xCu);
            }
          }
        }

        uint64_t v31 = self->_downloadGroup;
        dispatch_time_t v32 = dispatch_time(0LL, 100000000LL);
        uint64_t v11 = dispatch_group_wait((dispatch_group_t)v31, v32);
      }

      while (v11);
    }

    uint64_t v33 = MediaAnalysisLogLevel(v11, v12);
    if ((int)v33 >= 7)
    {
      uint64_t v35 = VCPLogInstance(v33, v34);
      uint64_t v36 = (os_log_s *)objc_claimAutoreleasedReturnValue(v35);
      os_log_type_t v37 = VCPLogToOSLogType[7];
      if (os_log_type_enabled(v36, v37))
      {
        *(_WORD *)__int128 buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v36, v37, "Waiting for detection-group to finish", buf, 2u);
      }
    }

    uint64_t v38 = dispatch_group_wait((dispatch_group_t)self->_detectionGroup, 0xFFFFFFFFFFFFFFFFLL);
    uint64_t v40 = MediaAnalysisLogLevel(v38, v39);
    if ((int)v40 >= 7)
    {
      uint64_t v42 = VCPLogInstance(v40, v41);
      uint64_t v43 = (os_log_s *)objc_claimAutoreleasedReturnValue(v42);
      os_log_type_t v44 = VCPLogToOSLogType[7];
      if (os_log_type_enabled(v43, v44))
      {
        *(_WORD *)__int128 buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v43, v44, "Detection-group finished", buf, 2u);
      }
    }

    -[VCPTimeMeasurement stop](v7, "stop");
    uint64_t v45 = (void *)objc_claimAutoreleasedReturnValue( +[VCPMADCoreAnalyticsManager sharedManager]( &OBJC_CLASS___VCPMADCoreAnalyticsManager,  "sharedManager"));
    -[VCPTimeMeasurement elapsedTimeSeconds](v7, "elapsedTimeSeconds");
    objc_msgSend( v45,  "accumulateDoubleValue:forField:andEvent:",  @"FaceDetectionElapsedTimeInSeconds",  @"com.apple.mediaanalysisd.FaceAnalysisRunSession");

    int v8 = -[VCPFaceProcessingTask _publishClusterAndPersonProcessingWithBatchContext:]( self,  "_publishClusterAndPersonProcessingWithBatchContext:",  v6);
    if (v8) {
      goto LABEL_41;
    }
    id v46 = [v6 downloadTimedout];
    if ((_DWORD)v46)
    {
      uint64_t v48 = MediaAnalysisLogLevel(v46, v47);
      if ((int)v48 >= 3)
      {
        uint64_t v50 = VCPLogInstance(v48, v49);
        id v51 = (os_log_s *)objc_claimAutoreleasedReturnValue(v50);
        os_log_type_t v52 = VCPLogToOSLogType[3];
        if (os_log_type_enabled(v51, v52))
        {
          *(_WORD *)__int128 buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v51, v52, "Network error; skip to next batch", buf, 2u);
        }

- (int)_recoverAttemptsForAssets:(id)a3 withProcessingStatusMap:(id)a4
{
  id v5 = a3;
  id v28 = a4;
  uint64_t v24 = v5;
  if (![v5 count]) {
    goto LABEL_31;
  }
  __int128 v31 = 0u;
  __int128 v32 = 0u;
  __int128 v29 = 0u;
  __int128 v30 = 0u;
  id obj = v5;
  id v6 = [obj countByEnumeratingWithState:&v29 objects:v33 count:16];
  if (v6)
  {
    uint64_t v26 = *(void *)v30;
    while (2)
    {
      id v7 = 0LL;
      id v8 = a4;
      do
      {
        if (*(void *)v30 != v26) {
          objc_enumerationMutation(obj);
        }
        id v9 = *(void **)(*((void *)&v29 + 1) + 8LL * (void)v7);
        dispatch_time_t v10 = objc_autoreleasePoolPush();
        uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([v9 localIdentifier]);
        uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue([v28 objectForKeyedSubscript:v11]);

        id v13 = [v12 previousAttempts];
        database = self->_database;
        if (v13)
        {
          id v15 = [v12 previousAttempts];
          id v16 = [v12 previousStatus];
          uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue([v12 lastAttemptDate]);
          id v18 = (id)-[VCPDatabaseWriter setAttempts:asset:taskID:status:lastAttemptDate:]( database,  "setAttempts:asset:taskID:status:lastAttemptDate:",  v15,  v9,  3LL,  v16,  v17);
        }

        else
        {
          uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue([v9 localIdentifier]);
          id v18 = (id)-[VCPDatabaseWriter removeProcessingStatusForLocalIdentifier:andTaskID:]( database,  "removeProcessingStatusForLocalIdentifier:andTaskID:",  v19,  3LL);
        }

        if ((_DWORD)v18 == -108 || (_DWORD)v18 == -36)
        {
          a4 = v18;
        }

        else
        {
          a4 = v18;
          if ((_DWORD)v18 != -23) {
            a4 = v8;
          }
        }

        BOOL v20 = 0;
        if ((_DWORD)v18 != -108 && (_DWORD)v18 != -36) {
          BOOL v20 = (_DWORD)v18 != -23;
        }

        objc_autoreleasePoolPop(v10);
        if (!v20)
        {

          int v21 = (int)a4;
          goto LABEL_32;
        }

        id v7 = (char *)v7 + 1;
        id v8 = a4;
      }

      while (v6 != v7);
      id v6 = [obj countByEnumeratingWithState:&v29 objects:v33 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }

  unsigned int v22 = -[VCPDatabaseWriter commit](self->_database, "commit");
  if (v22 == -108 || v22 == -36)
  {
    int v21 = v22;
  }

  else
  {
    int v21 = v22;
    if (v22 != -23) {
      int v21 = (int)a4;
    }
  }

  if (v22 != -108 && v22 != -36 && v22 != -23) {
LABEL_31:
  }
    int v21 = 0;
LABEL_32:

  return v21;
}

- (int)promotePersons
{
  uint64_t v18 = 0LL;
  uint64_t v19 = &v18;
  uint64_t v20 = 0x2020000000LL;
  int v21 = 0;
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472LL;
  v17[2] = sub_1000B35F0;
  v17[3] = &unk_1001BA030;
  v17[4] = self;
  v17[5] = &v18;
  unsigned __int8 v2 = objc_retainBlock(v17);
  objc_super v3 = objc_alloc_init(&OBJC_CLASS___VCPTimeMeasurement);
  -[VCPTimeMeasurement start](v3, "start");
  id v4 = (void *)objc_claimAutoreleasedReturnValue(+[VCPMADQoSManager sharedManager](&OBJC_CLASS___VCPMADQoSManager, "sharedManager"));
  [v4 runBlock:v2 withTaskID:3];

  -[VCPTimeMeasurement stop](v3, "stop");
  id v5 = (void *)objc_claimAutoreleasedReturnValue(+[VCPMADCoreAnalyticsManager sharedManager](&OBJC_CLASS___VCPMADCoreAnalyticsManager, "sharedManager"));
  -[VCPTimeMeasurement elapsedTimeSeconds](v3, "elapsedTimeSeconds");
  objc_msgSend( v5,  "accumulateDoubleValue:forField:andEvent:",  @"PersonPromotingElapsedTimeInSeconds",  @"com.apple.mediaanalysisd.FaceAnalysisRunSession");

  id v6 = (void *)objc_claimAutoreleasedReturnValue(+[VCPMADCoreAnalyticsManager sharedManager](&OBJC_CLASS___VCPMADCoreAnalyticsManager, "sharedManager"));
  [v6 accumulateInt64Value:1 forField:@"NumberOfPersonPromotingEvents" andEvent:@"com.apple.mediaanalysisd.FaceAnalysisRunSession"];

  int v9 = *((_DWORD *)v19 + 6);
  if (v9)
  {
    uint64_t v10 = MediaAnalysisLogLevel(v7, v8);
    if ((int)v10 >= 3)
    {
      uint64_t v12 = VCPLogInstance(v10, v11);
      id v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
      os_log_type_t v14 = VCPLogToOSLogType[3];
      if (os_log_type_enabled(v13, v14))
      {
        int v15 = *((_DWORD *)v19 + 6);
        *(_DWORD *)__int128 buf = 67109120;
        int v23 = v15;
        _os_log_impl((void *)&_mh_execute_header, v13, v14, "[FaceProcessing] Failed to promote person - %d", buf, 8u);
      }
    }
  }

  _Block_object_dispose(&v18, 8);
  return v9;
}

- (int)promotePets
{
  uint64_t v18 = 0LL;
  uint64_t v19 = &v18;
  uint64_t v20 = 0x2020000000LL;
  int v21 = 0;
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472LL;
  v17[2] = sub_1000B3924;
  v17[3] = &unk_1001BA008;
  v17[4] = self;
  v17[5] = &v18;
  unsigned __int8 v2 = objc_retainBlock(v17);
  objc_super v3 = objc_alloc_init(&OBJC_CLASS___VCPTimeMeasurement);
  -[VCPTimeMeasurement start](v3, "start");
  id v4 = (void *)objc_claimAutoreleasedReturnValue(+[VCPMADQoSManager sharedManager](&OBJC_CLASS___VCPMADQoSManager, "sharedManager"));
  [v4 runBlock:v2 withTaskID:3];

  -[VCPTimeMeasurement stop](v3, "stop");
  id v5 = (void *)objc_claimAutoreleasedReturnValue(+[VCPMADCoreAnalyticsManager sharedManager](&OBJC_CLASS___VCPMADCoreAnalyticsManager, "sharedManager"));
  -[VCPTimeMeasurement elapsedTimeSeconds](v3, "elapsedTimeSeconds");
  objc_msgSend( v5,  "accumulateDoubleValue:forField:andEvent:",  @"PetPromotingElapsedTimeInSeconds",  @"com.apple.mediaanalysisd.FaceAnalysisRunSession");

  id v6 = (void *)objc_claimAutoreleasedReturnValue(+[VCPMADCoreAnalyticsManager sharedManager](&OBJC_CLASS___VCPMADCoreAnalyticsManager, "sharedManager"));
  [v6 accumulateInt64Value:1 forField:@"NumberOfPetPromotingEvents" andEvent:@"com.apple.mediaanalysisd.FaceAnalysisRunSession"];

  int v9 = *((_DWORD *)v19 + 6);
  if (v9)
  {
    uint64_t v10 = MediaAnalysisLogLevel(v7, v8);
    if ((int)v10 >= 3)
    {
      uint64_t v12 = VCPLogInstance(v10, v11);
      id v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
      os_log_type_t v14 = VCPLogToOSLogType[3];
      if (os_log_type_enabled(v13, v14))
      {
        int v15 = *((_DWORD *)v19 + 6);
        *(_DWORD *)__int128 buf = 67109120;
        int v23 = v15;
        _os_log_impl((void *)&_mh_execute_header, v13, v14, "[FaceProcessing] Failed to promote pet - %d", buf, 8u);
      }
    }
  }

  _Block_object_dispose(&v18, 8);
  return v9;
}

- (int)processGalleryPersons:(BOOL *)a3
{
  id v4 = (void *)objc_claimAutoreleasedReturnValue(+[MADGDUtilities sharedInstance](&OBJC_CLASS___MADGDUtilities, "sharedInstance"));
  [v4 flush];

  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[PHPhotoLibrary vcp_description](self->_photoLibrary, "vcp_description"));
  v331 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"[FaceLibraryProcessing][Person][%@]",  v5));

  v364[0] = _NSConcreteStackBlock;
  v364[1] = 3221225472LL;
  v364[2] = sub_1000B6068;
  v364[3] = &unk_1001B9E98;
  v364[4] = self;
  v330 = objc_retainBlock(v364);
  id v6 = -[PHPhotoLibrary mad_countOfUnclusteredFaces](self->_photoLibrary, "mad_countOfUnclusteredFaces");
  uint64_t v8 = MediaAnalysisLogLevel(v6, v7);
  if ((int)v8 >= 7)
  {
    uint64_t v10 = VCPLogInstance(v8, v9);
    uint64_t v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
    os_log_type_t v12 = VCPLogToOSLogType[7];
    if (os_log_type_enabled(v11, v12))
    {
      *(_DWORD *)__int128 buf = 138412546;
      *(void *)&uint8_t buf[4] = v331;
      *(_WORD *)&_BYTE buf[12] = 2048;
      *(void *)&buf[14] = v6;
      _os_log_impl((void *)&_mh_execute_header, v11, v12, "%@ Found %lu faces to add to Gallery", buf, 0x16u);
    }
  }

  if (v6)
  {
    id v13 = objc_alloc_init(&OBJC_CLASS___VCPTimeMeasurement);
    -[VCPTimeMeasurement start](v13, "start");
    uint64_t v14 = mach_absolute_time();
    uint64_t v15 = VCPSignPostLog(v14);
    id v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(v15);
    os_signpost_id_t v17 = os_signpost_id_generate(v16);

    uint64_t v19 = VCPSignPostLog(v18);
    uint64_t v20 = (os_log_s *)objc_claimAutoreleasedReturnValue(v19);
    int v21 = v20;
    if (v17 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v20))
    {
      *(_WORD *)__int128 buf = 0;
      _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v21,  OS_SIGNPOST_INTERVAL_BEGIN,  v17,  "FaceLibraryProcessingSendFaces",  (const char *)&unk_100199097,  buf,  2u);
    }

    unsigned int v22 = (void *)objc_claimAutoreleasedReturnValue( -[PHPhotoLibrary mad_unclusteredFacesFetchOptions]( self->_photoLibrary,  "mad_unclusteredFacesFetchOptions"));
    v372[0] = PHFacePropertySetIdentifier;
    v372[1] = PHFacePropertySetCore;
    v372[2] = PHFacePropertySetClustering;
    v372[3] = PHFacePropertySetPersonBuilder;
    int v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v372, 4LL));
    [v22 setFetchPropertySets:v23];

    uint64_t v24 = (void *)objc_claimAutoreleasedReturnValue(+[PHFace fetchFacesWithOptions:](&OBJC_CLASS___PHFace, "fetchFacesWithOptions:", v22));
    uint64_t v25 = (void *)objc_claimAutoreleasedReturnValue(+[MADGDUtilities sharedInstance](&OBJC_CLASS___MADGDUtilities, "sharedInstance"));
    uint64_t v26 = (void *)objc_claimAutoreleasedReturnValue(-[GDVUVisualUnderstandingService gallery](self->_vuService, "gallery"));
    id v363 = 0LL;
    unsigned __int8 v27 = [v25 prepareClusteringWithFaces:v24 gallery:v26 cancelOrExtendTimeoutBlock:v330 error:&v363];
    id v332 = v363;

    if ((v27 & 1) == 0)
    {
      uint64_t v28 = MediaAnalysisLogLevel(v28, v29);
      if ((int)v28 >= 3)
      {
        uint64_t v31 = VCPLogInstance(v28, v30);
        __int128 v32 = (os_log_s *)objc_claimAutoreleasedReturnValue(v31);
        os_log_type_t v33 = VCPLogToOSLogType[3];
        if (os_log_type_enabled(v32, v33))
        {
          *(_DWORD *)__int128 buf = 138412546;
          *(void *)&uint8_t buf[4] = v331;
          *(_WORD *)&_BYTE buf[12] = 2112;
          *(void *)&buf[14] = v332;
          _os_log_impl((void *)&_mh_execute_header, v32, v33, "%@ Failed to add faces to Gallery - %@", buf, 0x16u);
        }
      }
    }

    uint64_t v34 = VCPSignPostLog(v28);
    uint64_t v35 = (os_log_s *)objc_claimAutoreleasedReturnValue(v34);
    uint64_t v36 = v35;
    if (v17 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v35))
    {
      *(_WORD *)__int128 buf = 0;
      _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v36,  OS_SIGNPOST_INTERVAL_END,  v17,  "FaceLibraryProcessingSendFaces",  (const char *)&unk_100199097,  buf,  2u);
    }

    if (v14)
    {
      uint64_t v37 = mach_absolute_time();
      VCPPerformance_LogMeasurement("FaceLibraryProcessingSendFaces", v37 - v14);
    }

    -[VCPTimeMeasurement stop](v13, "stop");
    uint64_t v38 = (void *)objc_claimAutoreleasedReturnValue( +[VCPMADCoreAnalyticsManager sharedManager]( &OBJC_CLASS___VCPMADCoreAnalyticsManager,  "sharedManager"));
    -[VCPTimeMeasurement elapsedTimeSeconds](v13, "elapsedTimeSeconds");
    objc_msgSend( v38,  "accumulateDoubleValue:forField:andEvent:",  @"FaceClusteringElapsedTimeInSeconds",  @"com.apple.mediaanalysisd.FaceAnalysisRunSession");

    id v39 = -[PHPhotoLibrary mad_countOfUnclusteredFaces](self->_photoLibrary, "mad_countOfUnclusteredFaces");
    uint64_t v41 = MediaAnalysisLogLevel(v39, v40);
    if ((int)v41 >= 6)
    {
      uint64_t v43 = VCPLogInstance(v41, v42);
      os_log_type_t v44 = (os_log_s *)objc_claimAutoreleasedReturnValue(v43);
      os_log_type_t v45 = VCPLogToOSLogType[6];
      if (os_log_type_enabled(v44, v45))
      {
        *(_DWORD *)__int128 buf = 138412546;
        *(void *)&uint8_t buf[4] = v332;
        *(_WORD *)&_BYTE buf[12] = 2048;
        *(void *)&buf[14] = v39;
        _os_log_impl( (void *)&_mh_execute_header,  v44,  v45,  "%@ Found %lu (expected 0) faces yet to add to Gallery",  buf,  0x16u);
      }
    }

    id v46 = v332;
  }

  else
  {
    id v46 = 0LL;
  }

  v333 = v46;
  +[PNPersonPromoter setProcessed:forLibrary:]( &OBJC_CLASS___PNPersonPromoter,  "setProcessed:forLibrary:",  0LL,  self->_photoLibrary);
  uint64_t v47 = (void *)objc_claimAutoreleasedReturnValue(-[GDVUVisualUnderstandingService gallery](self->_vuService, "gallery"));
  unsigned int v325 = [v47 ready];

  if (v325)
  {
    uint64_t v50 = MediaAnalysisLogLevel(v48, v49);
    if ((int)v50 >= 7)
    {
      uint64_t v52 = VCPLogInstance(v50, v51);
      uint64_t v53 = (os_log_s *)objc_claimAutoreleasedReturnValue(v52);
      os_log_type_t v54 = VCPLogToOSLogType[7];
      if (os_log_type_enabled(v53, v54))
      {
        *(_DWORD *)__int128 buf = 138412290;
        *(void *)&uint8_t buf[4] = v331;
        _os_log_impl((void *)&_mh_execute_header, v53, v54, "%@ Gallery is ready; skip updating", buf, 0xCu);
      }

      id v46 = v333;
    }

- (int)_publishClusterAndPersonProcessingWithBatchContext:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 unprocessedAssets]);
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v4 processingStatusMap]);
  unsigned int publishDetectionAndProcessPersonStatus = -[VCPFaceProcessingTask _recoverAttemptsForAssets:withProcessingStatusMap:]( self,  "_recoverAttemptsForAssets:withProcessingStatusMap:",  v5,  v6);

  if (!publishDetectionAndProcessPersonStatus)
  {
    dispatch_group_wait((dispatch_group_t)self->_publishDetectionAndProcessPersonGroup, 0xFFFFFFFFFFFFFFFFLL);
    if (self->_publishDetectionAndProcessPersonStatus)
    {
      uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([v4 processedAssets]);
      uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([v4 processingStatusMap]);
      unsigned int publishDetectionAndProcessPersonStatus = -[VCPFaceProcessingTask _recoverAttemptsForAssets:withProcessingStatusMap:]( self,  "_recoverAttemptsForAssets:withProcessingStatusMap:",  v9,  v10);

      if (!publishDetectionAndProcessPersonStatus) {
        unsigned int publishDetectionAndProcessPersonStatus = self->_publishDetectionAndProcessPersonStatus;
      }
    }

    else
    {
      publishDetectionAndProcessPersonGroup = self->_publishDetectionAndProcessPersonGroup;
      publishDetectionAndProcessPersonQueue = (dispatch_queue_s *)self->_publishDetectionAndProcessPersonQueue;
      uint64_t v14 = _NSConcreteStackBlock;
      uint64_t v15 = 3221225472LL;
      id v16 = sub_1000B7018;
      os_signpost_id_t v17 = &unk_1001B9E70;
      id v18 = v4;
      uint64_t v19 = self;
      dispatch_group_async( (dispatch_group_t)publishDetectionAndProcessPersonGroup,  publishDetectionAndProcessPersonQueue,  &v14);
      id v13 = (void *)objc_opt_class(self);

      unsigned int publishDetectionAndProcessPersonStatus = 0;
    }
  }

  return publishDetectionAndProcessPersonStatus;
}

- (int)processFaceCrops
{
  unsigned int v64 = -[PHPhotoLibrary vcp_allowInMemoryDownload](self->_photoLibrary, "vcp_allowInMemoryDownload");
  uint64_t v61 = self;
  id v57 = -[PHPhotoLibrary newFaceCropsToBeGeneratedFetchOptions]( self->_photoLibrary,  "newFaceCropsToBeGeneratedFetchOptions");
  id v66 = (void *)objc_claimAutoreleasedReturnValue(+[PHFace fetchFacesWithOptions:](&OBJC_CLASS___PHFace, "fetchFacesWithOptions:"));
  uint64_t v4 = MediaAnalysisLogLevel(v66, v3);
  if ((int)v4 >= 6)
  {
    uint64_t v6 = VCPLogInstance(v4, v5);
    uint64_t v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
    os_log_type_t v8 = VCPLogToOSLogType[6];
    if (os_log_type_enabled(v7, v8))
    {
      *(_DWORD *)__int128 buf = 134217984;
      *(void *)&uint8_t buf[4] = [v66 count];
      _os_log_impl((void *)&_mh_execute_header, v7, v8, "%lu face(s) need to generate facecrops", buf, 0xCu);
    }
  }

  id v63 = (void *)objc_claimAutoreleasedReturnValue( +[PHAsset fetchAssetsGroupedByFaceUUIDForFaces:]( &OBJC_CLASS___PHAsset,  "fetchAssetsGroupedByFaceUUIDForFaces:",  v66));
  v69[0] = _NSConcreteStackBlock;
  v69[1] = 3221225472LL;
  v69[2] = sub_1000B8424;
  v69[3] = &unk_1001B9E98;
  v69[4] = v61;
  int v65 = objc_retainBlock(v69);
  unint64_t v9 = 0LL;
  os_log_type_t v58 = VCPLogToOSLogType[3];
  os_log_type_t v59 = VCPLogToOSLogType[4];
  os_log_type_t type = VCPLogToOSLogType[6];
  *(void *)&__int128 v10 = 138412546LL;
  __int128 v56 = v10;
  while (1)
  {
    if (v9 >= (unint64_t)objc_msgSend(v66, "count", v56))
    {
      *(void *)__int128 buf = 0LL;
      int v53 = -[VCPFaceCropManager processDirtyFaceCrops:withCancelBlock:andExtendTimeoutBlock:]( v61->_faceCropManager,  "processDirtyFaceCrops:withCancelBlock:andExtendTimeoutBlock:",  buf,  v65,  &stru_1001BCCE8);
      os_log_type_t v54 = (void *)objc_claimAutoreleasedReturnValue( +[VCPMADCoreAnalyticsManager sharedManager]( &OBJC_CLASS___VCPMADCoreAnalyticsManager,  "sharedManager"));
      [v54 accumulateInt64Value:*(void *)buf forField:@"NumberOfFacecropsAnalyzed" andEvent:@"com.apple.mediaanalysisd.FaceAnalysisRunSession"];

      goto LABEL_44;
    }

    uint64_t v11 = objc_autoreleasePoolPush();
    uint64_t v12 = ((uint64_t (*)(void))v65[2])();
    if ((v12 & 1) == 0)
    {
      sub_1000B83D4((id)v12);
      uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue([v66 objectAtIndexedSubscript:v9]);
      uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue([v14 uuid]);
      id v16 = (void *)objc_claimAutoreleasedReturnValue([v63 objectForKeyedSubscript:v15]);

      os_signpost_id_t v17 = (void *)objc_claimAutoreleasedReturnValue( +[VCPFaceUtils preferredResourcesForFaceProcessingWithAsset:]( &OBJC_CLASS___VCPFaceUtils,  "preferredResourcesForFaceProcessingWithAsset:",  v16));
      id v18 = (void *)objc_claimAutoreleasedReturnValue( +[VCPFaceUtils resourceForFaceProcessing:allowStreaming:]( &OBJC_CLASS___VCPFaceUtils,  "resourceForFaceProcessing:allowStreaming:",  v17,  v64));
      id v19 = +[VCPFaceUtils isBestResourceForFaceProcessing:fromResources:]( &OBJC_CLASS___VCPFaceUtils,  "isBestResourceForFaceProcessing:fromResources:",  v18,  v17);
      if ((v19 & 1) != 0)
      {
        uint64_t v21 = objc_claimAutoreleasedReturnValue([v18 privateFileURL]);
        int v23 = (void *)v21;
        if (v64
          && (uint64_t v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager")),
              uint64_t v25 = (void *)objc_claimAutoreleasedReturnValue([v23 path]),
              unsigned __int8 v26 = [v24 fileExistsAtPath:v25],
              v25,
              v24,
              (v26 & 1) == 0))
        {
          id v68 = v23;
          +[PHAssetResourceManager vcp_requestFileURLForAssetResource:withTaskID:toResourceURL:cancel:]( &OBJC_CLASS___PHAssetResourceManager,  "vcp_requestFileURLForAssetResource:withTaskID:toResourceURL:cancel:",  v18,  3LL,  &v68,  v65);
          id v27 = v68;
        }

        else
        {
          id v27 = v23;
        }

        if (v27)
        {
          uint64_t v31 = VCPSignPostLog(v21);
          __int128 v32 = (os_log_s *)objc_claimAutoreleasedReturnValue(v31);
          os_signpost_id_t spid = os_signpost_id_generate(v32);

          uint64_t v34 = VCPSignPostLog(v33);
          uint64_t v35 = (os_log_s *)objc_claimAutoreleasedReturnValue(v34);
          uint64_t v36 = v35;
          if (spid - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v35))
          {
            *(_WORD *)__int128 buf = 0;
            _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v36,  OS_SIGNPOST_INTERVAL_BEGIN,  spid,  "VCPFaceProcessingGenerateFaceCrop",  (const char *)&unk_100199097,  buf,  2u);
          }

          faceCropManager = v61->_faceCropManager;
          uint64_t v73 = v14;
          uint64_t v38 = (void *)objc_claimAutoreleasedReturnValue( +[NSArray arrayWithObjects:count:]( &OBJC_CLASS___NSArray,  "arrayWithObjects:count:",  &v73,  1LL));
          id v67 = 0LL;
          LOBYTE(faceCropManager) = -[VCPFaceCropManager generateAndPersistFaceCropsForFaces:withAsset:resource:resourceURL:error:]( faceCropManager,  "generateAndPersistFaceCropsForFaces:withAsset:resource:resourceURL:error:",  v38,  v16,  v18,  v27,  &v67);
          id v39 = v67;

          if ((faceCropManager & 1) == 0)
          {
            uint64_t v40 = MediaAnalysisLogLevel(v40, v41);
            if ((int)v40 >= 3)
            {
              uint64_t v43 = VCPLogInstance(v40, v42);
              os_log_type_t v44 = (os_log_s *)objc_claimAutoreleasedReturnValue(v43);
              if (os_log_type_enabled(v44, v58))
              {
                os_log_type_t v45 = (void *)objc_claimAutoreleasedReturnValue([v16 localIdentifier]);
                *(_DWORD *)__int128 buf = v56;
                *(void *)&uint8_t buf[4] = v45;
                __int16 v71 = 2112;
                id v72 = v39;
                _os_log_impl( (void *)&_mh_execute_header,  v44,  v58,  "[FaceCropGeneration][%@] Failed to generate - %@",  buf,  0x16u);
              }
            }
          }

          uint64_t v46 = VCPSignPostLog(v40);
          uint64_t v47 = (os_log_s *)objc_claimAutoreleasedReturnValue(v46);
          uint64_t v48 = v47;
          if (spid - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v47))
          {
            *(_WORD *)__int128 buf = 0;
            _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v48,  OS_SIGNPOST_INTERVAL_END,  spid,  "VCPFaceProcessingGenerateFaceCrop",  (const char *)&unk_100199097,  buf,  2u);
          }

          int v13 = 0;
LABEL_35:

LABEL_37:
          goto LABEL_38;
        }

        uint64_t v49 = MediaAnalysisLogLevel(v21, v22);
        if ((int)v49 >= 4)
        {
          uint64_t v51 = VCPLogInstance(v49, v50);
          id v39 = (id)objc_claimAutoreleasedReturnValue(v51);
          if (os_log_type_enabled((os_log_t)v39, v59))
          {
            uint64_t v52 = (void *)objc_claimAutoreleasedReturnValue([v16 localIdentifier]);
            *(_DWORD *)__int128 buf = 138412290;
            *(void *)&uint8_t buf[4] = v52;
            _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)v39,  v59,  "[FaceCropGeneration][%@] No local or downloaded resource; skipping",
              buf,
              0xCu);
          }

          int v13 = 6;
          goto LABEL_35;
        }
      }

      else
      {
        uint64_t v28 = MediaAnalysisLogLevel(v19, v20);
        if ((int)v28 < 6)
        {
          int v13 = 6;
LABEL_38:

          goto LABEL_39;
        }

        uint64_t v30 = VCPLogInstance(v28, v29);
        id v27 = (id)objc_claimAutoreleasedReturnValue(v30);
        if (os_log_type_enabled((os_log_t)v27, type))
        {
          *(_WORD *)__int128 buf = 0;
          _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)v27,  type,  "[FaceCropGeneration] No applicable resource; skipping",
            buf,
            2u);
        }
      }

      int v13 = 6;
      goto LABEL_37;
    }

    int v13 = 1;
LABEL_39:
    objc_autoreleasePoolPop(v11);
    if (v13 != 6)
    {
      if (v13) {
        break;
      }
    }

    ++v9;
  }

  int v53 = -128;
LABEL_44:

  return v53;
}

- (int)flush
{
  return self->_publishDetectionAndProcessPersonStatus;
}

- (int)run
{
  return -4;
}

- (BOOL)autoCancellable
{
  return 0;
}

- (PHPhotoLibrary)photoLibrary
{
  return self->_photoLibrary;
}

- (VCPDatabaseWriter)database
{
  return self->_database;
}

- (BOOL)allowStreaming
{
  return self->_allowStreaming;
}

- (void)setAllowStreaming:(BOOL)a3
{
  self->_allowStreaming = a3;
}

- (void).cxx_destruct
{
}

@end