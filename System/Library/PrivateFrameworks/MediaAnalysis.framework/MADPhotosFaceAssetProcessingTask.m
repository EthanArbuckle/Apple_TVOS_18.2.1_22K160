@interface MADPhotosFaceAssetProcessingTask
+ (BOOL)_concurrentFaceAnalysis;
+ (id)taskWithAnalysisDatabase:(id)a3 andFaceClusterer:(id)a4;
+ (id)taskWithAnalysisDatabase:(id)a3 andGallery:(id)a4;
+ (unint64_t)_concurrentQueueCount;
- (MADPhotosFaceAssetProcessingTask)initWithAnalysisDatabase:(id)a3 andFaceCluster:(id)a4;
- (MADPhotosFaceAssetProcessingTask)initWithAnalysisDatabase:(id)a3 andGallery:(id)a4;
- (double)downloadInactiveTimeInterval;
- (id)assetLocalIdentifiers;
- (int)_prepare;
- (int)_process;
- (int)_publish;
- (int)removeDownloadRequestIDForAsset:(id)a3;
- (int)status;
- (unint64_t)count;
- (void)_asyncAnalysisWithAssetEntry:(id)a3 resource:(id)a4 resourceURL:(id)a5 isBestResource:(BOOL)a6;
- (void)_collectVNAnimalObservationResults:(id)a3;
- (void)_dispatchAssetEntries;
- (void)_publishEntry:(id)a3 faceLocalIdentifiers:(id *)a4;
- (void)addDownloadRequestID:(int)a3 forAsset:(id)a4;
- (void)addPhotosAsset:(id)a3 priority:(unint64_t)a4 previousStatus:(unint64_t)a5 attempts:(unint64_t)a6 lastAttemptDate:(id)a7;
- (void)cancelRemainingDownloadsWithStatus:(int)a3;
- (void)dealloc;
- (void)download;
- (void)prepare;
- (void)process;
- (void)processDeletedAssets:(id)a3;
- (void)publish;
@end

@implementation MADPhotosFaceAssetProcessingTask

+ (BOOL)_concurrentFaceAnalysis
{
  unsigned __int8 v2 = atomic_load((unsigned __int8 *)&qword_1001E6570);
  if ((v2 & 1) == 0 && __cxa_guard_acquire(&qword_1001E6570))
  {
    byte_1001E6568 = DeviceHasANE();
    __cxa_guard_release(&qword_1001E6570);
  }

  return byte_1001E6568;
}

+ (unint64_t)_concurrentQueueCount
{
  unsigned __int8 v2 = atomic_load((unsigned __int8 *)&qword_1001E6580);
  p_opt_class_meths = &OBJC_PROTOCOL___MADEmbeddingStoreClientProtocol.opt_class_meths;
  if ((v2 & 1) == 0)
  {
    int v5 = __cxa_guard_acquire(&qword_1001E6580);
    p_opt_class_meths = &OBJC_PROTOCOL___MADEmbeddingStoreClientProtocol.opt_class_meths;
    if (v5)
    {
      byte_1001E6578 = 1;
      __cxa_guard_release(&qword_1001E6580);
      p_opt_class_meths = (__objc2_meth_list **)(&OBJC_PROTOCOL___MADEmbeddingStoreClientProtocol + 48);
    }
  }

  if (*((_BYTE *)p_opt_class_meths + 1400)) {
    return 4LL;
  }
  else {
    return 0LL;
  }
}

- (MADPhotosFaceAssetProcessingTask)initWithAnalysisDatabase:(id)a3 andFaceCluster:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v9 = (void *)objc_claimAutoreleasedReturnValue([v7 photoLibrary]);
  unsigned int v10 = objc_msgSend(v9, "mad_useVUGallery");

  if (v10)
  {
    uint64_t v13 = MediaAnalysisLogLevel(v11, v12);
    if ((int)v13 >= 3)
    {
      uint64_t v15 = VCPLogInstance(v13, v14);
      v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(v15);
      os_log_type_t v17 = VCPLogToOSLogType[3];
      if (os_log_type_enabled(v16, v17))
      {
        *(_WORD *)buf = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v16,  v17,  "[MADPhotosFaceAssetProcessingTask] VCPFaceClusterer is disabled",  buf,  2u);
      }
    }

    v18 = 0LL;
  }

  else
  {
    v40.receiver = self;
    v40.super_class = (Class)&OBJC_CLASS___MADPhotosFaceAssetProcessingTask;
    v19 = -[MADProcessingTask init](&v40, "init");
    v20 = v19;
    v21 = v19;
    if (v19)
    {
      objc_storeStrong((id *)&v19->_analysisDatabase, a3);
      uint64_t v22 = objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
      assetEntries = v21->_assetEntries;
      v21->_assetEntries = (NSMutableArray *)v22;

      objc_storeStrong((id *)&v20->_faceClusterer, a4);
      dispatch_group_t v24 = dispatch_group_create();
      processGroup = v21->_processGroup;
      v21->_processGroup = (OS_dispatch_group *)v24;

      dispatch_queue_attr_t v26 = dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
      v27 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v26);
      dispatch_queue_t v28 = dispatch_queue_create("com.apple.mediaanalysisd.face.management", v27);
      managementQueue = v21->_managementQueue;
      v21->_managementQueue = (OS_dispatch_queue *)v28;

      v21->_processingJobCount = 0LL;
      else {
        uint64_t v30 = 1LL;
      }
      v21->_processingQueuesCount = v30;
      dispatch_group_t v31 = dispatch_group_create();
      downloadGroup = v21->_downloadGroup;
      v21->_downloadGroup = (OS_dispatch_group *)v31;

      dispatch_queue_attr_t v33 = dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
      v34 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v33);
      dispatch_queue_t v35 = dispatch_queue_create("com.apple.mediaanalysisd.face.download", v34);
      downloadStateQueue = v21->_downloadStateQueue;
      v21->_downloadStateQueue = (OS_dispatch_queue *)v35;

      uint64_t v37 = objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
      downloadRequestIDs = v21->_downloadRequestIDs;
      v21->_downloadRequestIDs = (NSMutableDictionary *)v37;
    }

    self = v21;
    v18 = self;
  }

  return v18;
}

- (MADPhotosFaceAssetProcessingTask)initWithAnalysisDatabase:(id)a3 andGallery:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v9 = (void *)objc_claimAutoreleasedReturnValue([v7 photoLibrary]);
  unsigned __int8 v10 = objc_msgSend(v9, "mad_useVUGallery");

  if ((v10 & 1) != 0)
  {
    v40.receiver = self;
    v40.super_class = (Class)&OBJC_CLASS___MADPhotosFaceAssetProcessingTask;
    uint64_t v13 = -[MADProcessingTask init](&v40, "init");
    uint64_t v14 = v13;
    uint64_t v15 = v13;
    if (v13)
    {
      objc_storeStrong((id *)&v13->_analysisDatabase, a3);
      objc_storeStrong((id *)&v14->_gallery, a4);
      uint64_t v16 = objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
      assetEntries = v15->_assetEntries;
      v15->_assetEntries = (NSMutableArray *)v16;

      dispatch_group_t v18 = dispatch_group_create();
      processGroup = v15->_processGroup;
      v15->_processGroup = (OS_dispatch_group *)v18;

      dispatch_queue_attr_t v20 = dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
      v21 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v20);
      dispatch_queue_t v22 = dispatch_queue_create("com.apple.mediaanalysisd.face.management", v21);
      managementQueue = v15->_managementQueue;
      v15->_managementQueue = (OS_dispatch_queue *)v22;

      v15->_processingJobCount = 0LL;
      else {
        uint64_t v24 = 1LL;
      }
      v15->_processingQueuesCount = v24;
      dispatch_group_t v31 = dispatch_group_create();
      downloadGroup = v15->_downloadGroup;
      v15->_downloadGroup = (OS_dispatch_group *)v31;

      dispatch_queue_attr_t v33 = dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
      v34 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v33);
      dispatch_queue_t v35 = dispatch_queue_create("com.apple.mediaanalysisd.face.download", v34);
      downloadStateQueue = v15->_downloadStateQueue;
      v15->_downloadStateQueue = (OS_dispatch_queue *)v35;

      uint64_t v37 = objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
      downloadRequestIDs = v15->_downloadRequestIDs;
      v15->_downloadRequestIDs = (NSMutableDictionary *)v37;
    }

    self = v15;
    uint64_t v30 = self;
  }

  else
  {
    uint64_t v25 = MediaAnalysisLogLevel(v11, v12);
    if ((int)v25 >= 3)
    {
      uint64_t v27 = VCPLogInstance(v25, v26);
      dispatch_queue_t v28 = (os_log_s *)objc_claimAutoreleasedReturnValue(v27);
      os_log_type_t v29 = VCPLogToOSLogType[3];
      if (os_log_type_enabled(v28, v29))
      {
        *(_WORD *)buf = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v28,  v29,  "[MADPhotosFaceAssetProcessingTask] Gallery is not enabled",  buf,  2u);
      }
    }

    uint64_t v30 = 0LL;
  }

  return v30;
}

+ (id)taskWithAnalysisDatabase:(id)a3 andFaceClusterer:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [objc_alloc((Class)objc_opt_class(a1)) initWithAnalysisDatabase:v6 andFaceCluster:v7];

  return v8;
}

+ (id)taskWithAnalysisDatabase:(id)a3 andGallery:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [objc_alloc((Class)objc_opt_class(a1)) initWithAnalysisDatabase:v6 andGallery:v7];

  return v8;
}

- (void)dealloc
{
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  v3 = self->_assetEntries;
  id v4 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v3,  "countByEnumeratingWithState:objects:count:",  &v12,  v16,  16LL);
  if (v4)
  {
    uint64_t v5 = *(void *)v13;
    do
    {
      for (i = 0LL; i != v4; i = (char *)i + 1)
      {
        if (*(void *)v13 != v5) {
          objc_enumerationMutation(v3);
        }
        id v7 = *(void **)(*((void *)&v12 + 1) + 8LL * (void)i);
        id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 downloadURL]);
        BOOL v9 = v8 == 0LL;

        if (!v9)
        {
          unsigned __int8 v10 = (void *)objc_claimAutoreleasedReturnValue([v7 downloadURL]);
          +[PHAssetResourceManager vcp_flushResourceURL:]( &OBJC_CLASS___PHAssetResourceManager,  "vcp_flushResourceURL:",  v10);
        }
      }

      id v4 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v3,  "countByEnumeratingWithState:objects:count:",  &v12,  v16,  16LL);
    }

    while (v4);
  }

  v11.receiver = self;
  v11.super_class = (Class)&OBJC_CLASS___MADPhotosFaceAssetProcessingTask;
  -[MADPhotosFaceAssetProcessingTask dealloc](&v11, "dealloc");
}

- (unint64_t)count
{
  return (unint64_t)-[NSMutableArray count](self->_assetEntries, "count");
}

- (id)assetLocalIdentifiers
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](&OBJC_CLASS___NSMutableSet, "set"));
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  id v4 = self->_assetEntries;
  id v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v4,  "countByEnumeratingWithState:objects:count:",  &v13,  v17,  16LL);
  if (v5)
  {
    uint64_t v6 = *(void *)v14;
    do
    {
      id v7 = 0LL;
      do
      {
        if (*(void *)v14 != v6) {
          objc_enumerationMutation(v4);
        }
        id v8 = *(void **)(*((void *)&v13 + 1) + 8LL * (void)v7);
        BOOL v9 = objc_autoreleasePoolPush();
        unsigned __int8 v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "asset", (void)v13));
        objc_super v11 = (void *)objc_claimAutoreleasedReturnValue([v10 localIdentifier]);
        [v3 addObject:v11];

        objc_autoreleasePoolPop(v9);
        id v7 = (char *)v7 + 1;
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

- (void)addPhotosAsset:(id)a3 priority:(unint64_t)a4 previousStatus:(unint64_t)a5 attempts:(unint64_t)a6 lastAttemptDate:(id)a7
{
  id v12 = a3;
  v38.receiver = self;
  v38.super_class = (Class)&OBJC_CLASS___MADPhotosFaceAssetProcessingTask;
  unint64_t v31 = a5;
  unint64_t v32 = a6;
  id v33 = a7;
  -[MADPhotosAssetProcessingTask addPhotosAsset:priority:previousStatus:attempts:lastAttemptDate:]( &v38,  "addPhotosAsset:priority:previousStatus:attempts:lastAttemptDate:",  v12,  a4,  a5,  a6);
  __int128 v36 = 0u;
  __int128 v37 = 0u;
  __int128 v34 = 0u;
  __int128 v35 = 0u;
  uint64_t v30 = 8LL;
  __int128 v13 = self->_assetEntries;
  id v14 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v13,  "countByEnumeratingWithState:objects:count:",  &v34,  v41,  16LL);
  if (v14)
  {
    uint64_t v15 = *(void *)v35;
    while (2)
    {
      for (i = 0LL; i != v14; i = (char *)i + 1)
      {
        if (*(void *)v35 != v15) {
          objc_enumerationMutation(v13);
        }
        os_log_type_t v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((void *)&v34 + 1) + 8 * (void)i), "asset", v30 * 8));
        dispatch_group_t v18 = (void *)objc_claimAutoreleasedReturnValue([v17 localIdentifier]);
        v19 = (void *)objc_claimAutoreleasedReturnValue([v12 localIdentifier]);
        unsigned int v20 = [v18 isEqualToString:v19];

        if (v20)
        {
          uint64_t v24 = MediaAnalysisLogLevel(v21, v22);
          if ((int)v24 >= 4)
          {
            uint64_t v26 = VCPLogInstance(v24, v25);
            uint64_t v27 = (os_log_s *)objc_claimAutoreleasedReturnValue(v26);
            os_log_type_t v28 = VCPLogToOSLogType[4];
            if (os_log_type_enabled(v27, v28))
            {
              os_log_type_t v29 = (void *)objc_claimAutoreleasedReturnValue([v12 localIdentifier]);
              *(_DWORD *)buf = 138412290;
              objc_super v40 = v29;
              _os_log_impl( (void *)&_mh_execute_header,  v27,  v28,  "[Face][%@] Batch already contains asset; ignoring",
                buf,
                0xCu);
            }
          }

          goto LABEL_14;
        }
      }

      id v14 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v13,  "countByEnumeratingWithState:objects:count:",  &v34,  v41,  16LL);
      if (v14) {
        continue;
      }
      break;
    }
  }

  Class v23 = (&self->super.super.super.super.super.isa)[v30];
  __int128 v13 = (NSMutableArray *)objc_claimAutoreleasedReturnValue( +[MADFaceAssetEntry entryWithAsset:previousStatus:previousAttempts:andLastAttemptDate:]( &OBJC_CLASS___MADFaceAssetEntry,  "entryWithAsset:previousStatus:previousAttempts:andLastAttemptDate:",  v12,  v31,  v32,  v33));
  -[objc_class addObject:](v23, "addObject:", v13);
LABEL_14:
}

- (int)_prepare
{
  v42 = objc_alloc_init(&OBJC_CLASS___VCPTimeMeasurement);
  uint64_t v4 = VCPSignPostLog(-[VCPTimeMeasurement start](v42, "start"));
  id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
  os_signpost_id_t v6 = os_signpost_id_generate(v5);

  uint64_t v8 = VCPSignPostLog(v7);
  BOOL v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
  unsigned __int8 v10 = v9;
  unint64_t v40 = v6 - 1;
  os_signpost_id_t spid = v6;
  if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v9))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v10,  OS_SIGNPOST_INTERVAL_BEGIN,  v6,  "MADPhotosFaceAssetProcessingTask_Prepare",  (const char *)&unk_100199097,  buf,  2u);
  }

  uint64_t v13 = MediaAnalysisLogLevel(v11, v12);
  if ((int)v13 >= 6)
  {
    uint64_t v15 = VCPLogInstance(v13, v14);
    __int128 v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(v15);
    os_log_type_t v17 = VCPLogToOSLogType[6];
    if (os_log_type_enabled(v16, v17))
    {
      unsigned int v18 = -[NSMutableArray count](self->_assetEntries, "count");
      uint64_t v19 = qos_class_self();
      uint64_t v20 = VCPMAQoSDescription(v19);
      unsigned __int8 v2 = (void *)objc_claimAutoreleasedReturnValue(v20);
      *(_DWORD *)buf = 67109378;
      unsigned int v49 = v18;
      __int16 v50 = 2112;
      v51 = v2;
      _os_log_impl((void *)&_mh_execute_header, v16, v17, "[Face] Preparing %d assets (QoS: %@)", buf, 0x12u);
    }
  }

  __int128 v45 = 0u;
  __int128 v46 = 0u;
  __int128 v43 = 0u;
  __int128 v44 = 0u;
  uint64_t v21 = self->_assetEntries;
  id v22 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v21,  "countByEnumeratingWithState:objects:count:",  &v43,  v47,  16LL);
  if (v22)
  {
    uint64_t v23 = *(void *)v44;
LABEL_10:
    uint64_t v24 = 0LL;
    uint64_t v25 = v2;
    while (1)
    {
      if (*(void *)v44 != v23) {
        objc_enumerationMutation(v21);
      }
      uint64_t v26 = *(void **)(*((void *)&v43 + 1) + 8LL * (void)v24);
      uint64_t v27 = (void *)objc_claimAutoreleasedReturnValue([v26 asset]);
      unsigned int v28 = objc_msgSend(v27, "vcp_isPano");

      if (v28) {
        self->_processingQueuesCount = 1LL;
      }
      analysisDatabase = self->_analysisDatabase;
      uint64_t v30 = (char *)[v26 previousAttempts];
      unint64_t v31 = (void *)objc_claimAutoreleasedReturnValue([v26 asset]);
      unint64_t v32 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate now](&OBJC_CLASS___NSDate, "now"));
      id v33 = (id)-[VCPDatabaseWriter setAttempts:asset:taskID:status:lastAttemptDate:]( analysisDatabase,  "setAttempts:asset:taskID:status:lastAttemptDate:",  v30 + 1,  v31,  3LL,  1LL,  v32);

      if ((_DWORD)v33 == -108 || (_DWORD)v33 == -36)
      {
        unsigned __int8 v2 = v33;
      }

      else
      {
        unsigned __int8 v2 = v33;
        if ((_DWORD)v33 != -23) {
          unsigned __int8 v2 = v25;
        }
      }

      if ((_DWORD)v33 == -108 || (_DWORD)v33 == -36 || (_DWORD)v33 == -23) {
        goto LABEL_37;
      }
      uint64_t v24 = (char *)v24 + 1;
      uint64_t v25 = v2;
      if (v22 == v24)
      {
        id v22 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v21,  "countByEnumeratingWithState:objects:count:",  &v43,  v47,  16LL);
        if (v22) {
          goto LABEL_10;
        }
        break;
      }
    }
  }

  uint64_t v34 = -[VCPDatabaseWriter commit](self->_analysisDatabase, "commit");
  if ((_DWORD)v34 == -108 || (_DWORD)v34 == -36)
  {
    int v35 = v34;
  }

  else
  {
    int v35 = v34;
    if ((_DWORD)v34 != -23) {
      int v35 = (int)v2;
    }
  }

  if ((_DWORD)v34 != -108 && (_DWORD)v34 != -36 && (_DWORD)v34 != -23)
  {
    uint64_t v36 = VCPSignPostLog(v34);
    __int128 v37 = (os_log_s *)objc_claimAutoreleasedReturnValue(v36);
    objc_super v38 = v37;
    if (v40 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v37))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v38,  OS_SIGNPOST_INTERVAL_END,  spid,  "MADPhotosFaceAssetProcessingTask_Prepare",  (const char *)&unk_100199097,  buf,  2u);
    }

    -[VCPTimeMeasurement stop](v42, "stop");
    uint64_t v21 = (NSMutableArray *)objc_claimAutoreleasedReturnValue( +[VCPMADCoreAnalyticsManager sharedManager]( &OBJC_CLASS___VCPMADCoreAnalyticsManager,  "sharedManager"));
    -[VCPTimeMeasurement elapsedTimeSeconds](v42, "elapsedTimeSeconds");
    -[NSMutableArray accumulateDoubleValue:forField:andEvent:]( v21,  "accumulateDoubleValue:forField:andEvent:",  @"TotalPrepareTimeInSeconds",  @"com.apple.mediaanalysisd.FaceAnalysisRunSession");
    LODWORD(v2) = 0;
LABEL_37:

    int v35 = (int)v2;
  }

  return v35;
}

- (void)prepare
{
  self->_status = -[MADPhotosFaceAssetProcessingTask _prepare](self, "_prepare");
}

- (void)addDownloadRequestID:(int)a3 forAsset:(id)a4
{
  id v6 = a4;
  downloadStateQueue = (dispatch_queue_s *)self->_downloadStateQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10009FA58;
  block[3] = &unk_1001BBF50;
  block[4] = self;
  id v10 = v6;
  int v11 = a3;
  id v8 = v6;
  dispatch_sync(downloadStateQueue, block);
}

- (int)removeDownloadRequestIDForAsset:(id)a3
{
  id v4 = a3;
  uint64_t v11 = 0LL;
  uint64_t v12 = &v11;
  uint64_t v13 = 0x2020000000LL;
  int v14 = 0;
  downloadStateQueue = (dispatch_queue_s *)self->_downloadStateQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10009FBC0;
  block[3] = &unk_1001BBF78;
  id v9 = v4;
  id v10 = &v11;
  block[4] = self;
  id v6 = v4;
  dispatch_sync(downloadStateQueue, block);
  LODWORD(downloadStateQueue) = *((_DWORD *)v12 + 6);

  _Block_object_dispose(&v11, 8);
  return (int)downloadStateQueue;
}

- (double)downloadInactiveTimeInterval
{
  uint64_t v6 = 0LL;
  uint64_t v7 = (double *)&v6;
  uint64_t v8 = 0x2020000000LL;
  downloadStateQueue = (dispatch_queue_s *)self->_downloadStateQueue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_10009FDAC;
  v5[3] = &unk_1001BA030;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(downloadStateQueue, v5);
  double v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (void)cancelRemainingDownloadsWithStatus:(int)a3
{
  downloadStateQueue = (dispatch_queue_s *)self->_downloadStateQueue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_10009FE9C;
  v5[3] = &unk_1001BBFA0;
  v5[4] = self;
  int v6 = a3;
  dispatch_sync(downloadStateQueue, v5);
  dispatch_group_wait((dispatch_group_t)self->_downloadGroup, 0xFFFFFFFFFFFFFFFFLL);
}

- (void)download
{
  v117 = objc_alloc_init(&OBJC_CLASS___VCPTimeMeasurement);
  uint64_t v2 = VCPSignPostLog(-[VCPTimeMeasurement start](v117, "start"));
  double v3 = (os_log_s *)objc_claimAutoreleasedReturnValue(v2);
  os_signpost_id_t v4 = os_signpost_id_generate(v3);

  uint64_t v6 = VCPSignPostLog(v5);
  uint64_t v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
  uint64_t v8 = v7;
  os_signpost_id_t spid = v4;
  unint64_t v116 = v4 - 1;
  if (v4 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v7))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v8,  OS_SIGNPOST_INTERVAL_BEGIN,  v4,  "MADPhotosFaceAssetProcessingTask_Download",  (const char *)&unk_100199097,  buf,  2u);
  }

  uint64_t v11 = MediaAnalysisLogLevel(v9, v10);
  if ((int)v11 >= 6)
  {
    uint64_t v13 = VCPLogInstance(v11, v12);
    int v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
    os_log_type_t v15 = VCPLogToOSLogType[6];
    if (os_log_type_enabled(v14, v15))
    {
      unsigned int v16 = -[NSMutableArray count](self->_assetEntries, "count");
      uint64_t v17 = qos_class_self();
      uint64_t v18 = VCPMAQoSDescription(v17);
      uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue(v18);
      *(_DWORD *)buf = 67109378;
      *(_DWORD *)v137 = v16;
      *(_WORD *)&v137[4] = 2112;
      *(void *)&v137[6] = v19;
      _os_log_impl( (void *)&_mh_execute_header,  v14,  v15,  "[Face][Download] Downloading %d assets (QoS: %@)",  buf,  0x12u);
    }
  }

  __int128 v132 = 0u;
  __int128 v133 = 0u;
  __int128 v130 = 0u;
  __int128 v131 = 0u;
  obj = self->_assetEntries;
  id v20 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( obj,  "countByEnumeratingWithState:objects:count:",  &v130,  v135,  16LL);
  id v22 = v20;
  if (v20)
  {
    uint64_t v23 = *(void *)v131;
    os_log_type_t v24 = VCPLogToOSLogType[6];
    os_log_type_t type = VCPLogToOSLogType[4];
    do
    {
      uint64_t v25 = 0LL;
      do
      {
        if (*(void *)v131 != v23) {
          objc_enumerationMutation(obj);
        }
        uint64_t v26 = *(void **)(*((void *)&v130 + 1) + 8LL * (void)v25);
        uint64_t v27 = MediaAnalysisLogLevel(v20, v21);
        if ((int)v27 >= 6)
        {
          uint64_t v29 = VCPLogInstance(v27, v28);
          uint64_t v30 = (os_log_s *)objc_claimAutoreleasedReturnValue(v29);
          if (os_log_type_enabled(v30, v24))
          {
            unint64_t v31 = (void *)objc_claimAutoreleasedReturnValue([v26 asset]);
            unint64_t v32 = (void *)objc_claimAutoreleasedReturnValue([v31 localIdentifier]);
            *(_DWORD *)buf = 138412290;
            *(void *)v137 = v32;
            _os_log_impl( (void *)&_mh_execute_header,  v30,  v24,  "[Face][Download][%@] Finding download resource",  buf,  0xCu);
          }
        }

        id v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "asset", spid));
        uint64_t v34 = (void *)objc_claimAutoreleasedReturnValue( +[VCPFaceUtils preferredResourcesForFaceProcessingWithAsset:]( &OBJC_CLASS___VCPFaceUtils,  "preferredResourcesForFaceProcessingWithAsset:",  v33));

        int v35 = (void *)objc_claimAutoreleasedReturnValue( +[VCPFaceUtils resourceForFaceProcessing:allowStreaming:]( &OBJC_CLASS___VCPFaceUtils,  "resourceForFaceProcessing:allowStreaming:",  v34,  1LL));
        [v26 setDownloadResource:v35];

        uint64_t v36 = (void *)objc_claimAutoreleasedReturnValue([v26 downloadResource]);
        BOOL v37 = v36 == 0LL;

        if (v37)
        {
          uint64_t v40 = MediaAnalysisLogLevel(v38, v39);
          if ((int)v40 >= 4)
          {
            uint64_t v42 = VCPLogInstance(v40, v41);
            __int128 v43 = (os_log_s *)objc_claimAutoreleasedReturnValue(v42);
            if (os_log_type_enabled(v43, type))
            {
              __int128 v44 = (void *)objc_claimAutoreleasedReturnValue([v26 asset]);
              __int128 v45 = (void *)objc_claimAutoreleasedReturnValue([v44 localIdentifier]);
              *(_DWORD *)buf = 138412290;
              *(void *)v137 = v45;
              _os_log_impl( (void *)&_mh_execute_header,  v43,  type,  "[Face][Download][%@] Failed to find download resource",  buf,  0xCu);
            }
          }

          [v26 setStatus:4294943494];
        }

        uint64_t v25 = (char *)v25 + 1;
      }

      while (v22 != v25);
      id v20 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( obj,  "countByEnumeratingWithState:objects:count:",  &v130,  v135,  16LL);
      id v22 = v20;
    }

    while (v20);
  }

  __int128 v128 = 0u;
  __int128 v129 = 0u;
  __int128 v126 = 0u;
  __int128 v127 = 0u;
  v121 = self->_assetEntries;
  id v46 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v121,  "countByEnumeratingWithState:objects:count:",  &v126,  v134,  16LL);
  if (!v46)
  {
    int obja = 0;
    goto LABEL_52;
  }

  int obja = 0;
  uint64_t v47 = *(void *)v127;
  os_log_type_t typea = VCPLogToOSLogType[5];
  os_log_type_t v118 = VCPLogToOSLogType[4];
  do
  {
    for (i = 0LL; i != v46; i = (char *)i + 1)
    {
      if (*(void *)v127 != v47) {
        objc_enumerationMutation(v121);
      }
      unsigned int v49 = *(void **)(*((void *)&v126 + 1) + 8LL * (void)i);
      __int16 v50 = (void *)objc_claimAutoreleasedReturnValue(+[VCPWatchdog sharedWatchdog](&OBJC_CLASS___VCPWatchdog, "sharedWatchdog", spid));
      [v50 pet];

      v51 = (void *)objc_claimAutoreleasedReturnValue([v49 asset]);
      v52 = (void *)objc_claimAutoreleasedReturnValue( +[PHAssetResource vcp_allResourcesForAsset:]( &OBJC_CLASS___PHAssetResource,  "vcp_allResourcesForAsset:",  v51));
      v53 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v52, "mad_computeSyncResource"));

      if (v53)
      {
        v54 = (void *)objc_claimAutoreleasedReturnValue([v49 asset]);
        v55 = (void *)objc_claimAutoreleasedReturnValue(-[MADProcessingTask cancelBlock](self, "cancelBlock"));
        objc_msgSend( v49,  "setIsAnalysisCompleteFromComputeSync:",  objc_msgSend( v53,  "mad_isAnalysisCompleteFromComputeSyncForAsset:taskID:allowDownload:cancel:",  v54,  3,  1,  v55));

        id v56 = [v49 isAnalysisCompleteFromComputeSync];
        if ((_DWORD)v56)
        {
          uint64_t v58 = MediaAnalysisLogLevel(v56, v57);
          if ((int)v58 >= 5)
          {
            uint64_t v60 = VCPLogInstance(v58, v59);
            v61 = (os_log_s *)objc_claimAutoreleasedReturnValue(v60);
            if (os_log_type_enabled(v61, typea))
            {
              v62 = (void *)objc_claimAutoreleasedReturnValue([v49 asset]);
              v63 = (void *)objc_claimAutoreleasedReturnValue([v62 localIdentifier]);
              *(_DWORD *)buf = 138412290;
              *(void *)v137 = v63;
              _os_log_impl( (void *)&_mh_execute_header,  v61,  typea,  "[Face][Download][%@] Analysis complete with compute sync, skipping media resource download",  buf,  0xCu);
            }
          }

          goto LABEL_48;
        }

        uint64_t v64 = MediaAnalysisLogLevel(v56, v57);
        if ((int)v64 >= 5)
        {
          uint64_t v66 = VCPLogInstance(v64, v65);
          v67 = (os_log_s *)objc_claimAutoreleasedReturnValue(v66);
          if (os_log_type_enabled(v67, typea))
          {
            v68 = (void *)objc_claimAutoreleasedReturnValue([v49 asset]);
            v69 = (void *)objc_claimAutoreleasedReturnValue([v68 localIdentifier]);
            *(_DWORD *)buf = 138412290;
            *(void *)v137 = v69;
            _os_log_impl( (void *)&_mh_execute_header,  v67,  typea,  "[Face][Download][%@] Analysis remains incomplete with compute sync, falling back to media resource download",  buf,  0xCu);
          }
        }
      }

      v70 = (void *)objc_claimAutoreleasedReturnValue([v49 downloadResource]);
      BOOL v71 = v70 == 0LL;

      if (!v71)
      {
        dispatch_group_enter((dispatch_group_t)self->_downloadGroup);
        v72 = (void *)objc_claimAutoreleasedReturnValue([v49 downloadResource]);
        v125[0] = _NSConcreteStackBlock;
        v125[1] = 3221225472LL;
        v125[2] = sub_1000A0C9C;
        v125[3] = &unk_1001BBFC8;
        v125[4] = self;
        v125[5] = v49;
        uint64_t v73 = +[PHAssetResourceManager vcp_requestFileURLForAssetResource:taskID:completionHandler:]( &OBJC_CLASS___PHAssetResourceManager,  "vcp_requestFileURLForAssetResource:taskID:completionHandler:",  v72,  3LL,  v125);

        if ((_DWORD)v73)
        {
          v76 = (void *)objc_claimAutoreleasedReturnValue([v49 asset]);
          -[MADPhotosFaceAssetProcessingTask addDownloadRequestID:forAsset:]( self,  "addDownloadRequestID:forAsset:",  v73,  v76);

          ++obja;
        }

        else
        {
          uint64_t v77 = MediaAnalysisLogLevel(v74, v75);
          if ((int)v77 >= 4)
          {
            uint64_t v79 = VCPLogInstance(v77, v78);
            v80 = (os_log_s *)objc_claimAutoreleasedReturnValue(v79);
            if (os_log_type_enabled(v80, v118))
            {
              v81 = (void *)objc_claimAutoreleasedReturnValue([v49 asset]);
              v82 = (void *)objc_claimAutoreleasedReturnValue([v81 localIdentifier]);
              *(_DWORD *)buf = 138412290;
              *(void *)v137 = v82;
              _os_log_impl( (void *)&_mh_execute_header,  v80,  v118,  "[Face][Download][%@] Failed to initialize resource download",  buf,  0xCu);
            }
          }

          [v49 setStatus:4294943494];
          dispatch_group_leave((dispatch_group_t)self->_downloadGroup);
        }
      }

- (void)_collectVNAnimalObservationResults:(id)a3
{
  id v8 = a3;
  double v3 = (void *)objc_claimAutoreleasedReturnValue(+[VCPMADCoreAnalyticsManager sharedManager](&OBJC_CLASS___VCPMADCoreAnalyticsManager, "sharedManager"));
  os_signpost_id_t v4 = (void *)objc_claimAutoreleasedReturnValue([v8 objectForKeyedSubscript:MediaAnalysisResultNumberOfPetsGeneratedKey]);
  objc_msgSend( v3,  "accumulateInt64Value:forField:andEvent:",  objc_msgSend(v4, "longValue"),  @"NumberOfPetsGenerated",  @"com.apple.mediaanalysisd.FaceAnalysisRunSession");

  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([v8 objectForKeyedSubscript:MediaAnalysisResultNumberOfPetsGeneratedWithHeadOnlyKey]);
  objc_msgSend( v3,  "accumulateInt64Value:forField:andEvent:",  objc_msgSend(v5, "longValue"),  @"NumberOfPetsGeneratedWithHeadOnly",  @"com.apple.mediaanalysisd.FaceAnalysisRunSession");

  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue([v8 objectForKeyedSubscript:MediaAnalysisResultNumberOfPetsGeneratedWithBodyOnlyKey]);
  objc_msgSend( v3,  "accumulateInt64Value:forField:andEvent:",  objc_msgSend(v6, "longValue"),  @"NumberOfPetsGeneratedWithBodyOnly",  @"com.apple.mediaanalysisd.FaceAnalysisRunSession");

  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue( [v8 objectForKeyedSubscript:MediaAnalysisResultNumberOfPetsGeneratedWithHeadAndBodyKey]);
  objc_msgSend( v3,  "accumulateInt64Value:forField:andEvent:",  objc_msgSend(v7, "longValue"),  @"NumberOfPetsGeneratedWithHeadAndBody",  @"com.apple.mediaanalysisd.FaceAnalysisRunSession");
}

- (void)_asyncAnalysisWithAssetEntry:(id)a3 resource:(id)a4 resourceURL:(id)a5 isBestResource:(BOOL)a6
{
  BOOL v6 = a6;
  id v10 = a3;
  id v122 = a4;
  id v11 = a5;
  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(-[MADProcessingTask cancelBlock](self, "cancelBlock"));
  if (v12)
  {
    uint64_t v13 = (uint64_t (**)(void))objc_claimAutoreleasedReturnValue(-[MADProcessingTask cancelBlock](self, "cancelBlock"));
    int v14 = v13[2]();

    if (v14)
    {
      uint64_t v17 = MediaAnalysisLogLevel(v15, v16);
      if ((int)v17 < 6)
      {
        uint64_t v24 = 4294967168LL;
        goto LABEL_42;
      }

      uint64_t v19 = VCPLogInstance(v17, v18);
      id v20 = (os_log_s *)objc_claimAutoreleasedReturnValue(v19);
      os_log_type_t v21 = VCPLogToOSLogType[6];
      if (os_log_type_enabled(v20, v21))
      {
        id v22 = (void *)objc_claimAutoreleasedReturnValue([v10 asset]);
        uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue([v22 localIdentifier]);
        *(_DWORD *)buf = 138412290;
        v125 = v23;
        _os_log_impl((void *)&_mh_execute_header, v20, v21, "[Face][%@] Cancelled", buf, 0xCu);
      }

      uint64_t v24 = 4294967168LL;
LABEL_34:

LABEL_42:
      [v10 setStatus:v24];
      goto LABEL_62;
    }
  }

  uint64_t v25 = (void *)objc_claimAutoreleasedReturnValue([v10 asset]);
  uint64_t v26 = (void *)objc_claimAutoreleasedReturnValue([v25 adjustmentVersion]);

  if (!v26)
  {
    uint64_t v79 = MediaAnalysisLogLevel(v27, v28);
    if ((int)v79 < 3)
    {
      uint64_t v24 = 4294943493LL;
      goto LABEL_42;
    }

    uint64_t v81 = VCPLogInstance(v79, v80);
    id v20 = (os_log_s *)objc_claimAutoreleasedReturnValue(v81);
    os_log_type_t v82 = VCPLogToOSLogType[3];
    if (os_log_type_enabled(v20, v82))
    {
      uint64_t v83 = (void *)objc_claimAutoreleasedReturnValue([v10 asset]);
      uint64_t v84 = (void *)objc_claimAutoreleasedReturnValue([v83 localIdentifier]);
      *(_DWORD *)buf = 138412290;
      v125 = v84;
      _os_log_impl((void *)&_mh_execute_header, v20, v82, "[Face][%@] Null asset adjustmentVersion", buf, 0xCu);
    }

    uint64_t v24 = 4294943493LL;
    goto LABEL_34;
  }

  uint64_t v29 = (void *)objc_claimAutoreleasedReturnValue(+[VCPWatchdog sharedWatchdog](&OBJC_CLASS___VCPWatchdog, "sharedWatchdog"));
  [v29 pet];

  uint64_t v32 = MediaAnalysisLogLevel(v30, v31);
  if ((int)v32 >= 6)
  {
    uint64_t v34 = VCPLogInstance(v32, v33);
    int v35 = (os_log_s *)objc_claimAutoreleasedReturnValue(v34);
    os_log_type_t v36 = VCPLogToOSLogType[6];
    if (os_log_type_enabled(v35, v36))
    {
      BOOL v37 = (void *)objc_claimAutoreleasedReturnValue([v10 asset]);
      uint64_t v38 = (void *)objc_claimAutoreleasedReturnValue([v37 localIdentifier]);
      uint64_t v39 = (void *)objc_claimAutoreleasedReturnValue([v10 asset]);
      uint64_t v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v39, "vcp_typeDescription"));
      *(_DWORD *)buf = 138413058;
      v125 = v38;
      __int16 v126 = 2112;
      *(void *)__int128 v127 = v40;
      *(_WORD *)&v127[8] = 2048;
      id v128 = [v122 type];
      __int16 v129 = 2112;
      id v130 = v11;
      _os_log_impl((void *)&_mh_execute_header, v35, v36, "[Face][%@] Analyzing %@ using resource (%lu) %@", buf, 0x2Au);
    }
  }

  uint64_t v41 = VCPSignPostLog(v32);
  uint64_t v42 = (os_log_s *)objc_claimAutoreleasedReturnValue(v41);
  os_signpost_id_t v43 = os_signpost_id_generate(v42);

  uint64_t v45 = VCPSignPostLog(v44);
  id v46 = (os_log_s *)objc_claimAutoreleasedReturnValue(v45);
  uint64_t v47 = v46;
  if (v43 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v46))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v47,  OS_SIGNPOST_INTERVAL_BEGIN,  v43,  "VCPFaceProcessingAnalyzeAsset",  (const char *)&unk_100199097,  buf,  2u);
  }

  faceAnalyzer = self->_faceAnalyzer;
  unsigned int v49 = (void *)objc_claimAutoreleasedReturnValue([v10 asset]);
  id v123 = 0LL;
  unsigned int v50 = -[VCPFaceAnalyzer analyzeAsset:withResource:resourceURL:isBestResource:quickMode:results:]( faceAnalyzer,  "analyzeAsset:withResource:resourceURL:isBestResource:quickMode:results:",  v49,  v122,  v11,  v6,  0LL,  &v123);
  id v51 = v123;

  if (v50 || !v51)
  {
    uint64_t v85 = MediaAnalysisLogLevel(v52, v53);
    if ((int)v85 >= 3)
    {
      uint64_t v87 = VCPLogInstance(v85, v86);
      v88 = (os_log_s *)objc_claimAutoreleasedReturnValue(v87);
      os_log_type_t v89 = VCPLogToOSLogType[3];
      if (os_log_type_enabled(v88, v89))
      {
        v90 = (void *)objc_claimAutoreleasedReturnValue([v10 asset]);
        dispatch_time_t v91 = (void *)objc_claimAutoreleasedReturnValue([v90 localIdentifier]);
        *(_DWORD *)buf = 138412546;
        v125 = v91;
        __int16 v126 = 1024;
        *(_DWORD *)__int128 v127 = v50;
        _os_log_impl((void *)&_mh_execute_header, v88, v89, "[Face][%@] Failed to analyze asset (%d)", buf, 0x12u);
      }
    }

    goto LABEL_57;
  }

  v54 = (void *)objc_claimAutoreleasedReturnValue([v51 objectForKeyedSubscript:VCPAnalysisResultWarningImageTooSmallKey]);
  unsigned int v55 = [v54 BOOLValue];

  if (!v55 || v6)
  {
    uint64_t v92 = MediaAnalysisLogLevel(v56, v57);
    if ((int)v92 >= 7)
    {
      uint64_t v94 = VCPLogInstance(v92, v93);
      int v95 = (os_log_s *)objc_claimAutoreleasedReturnValue(v94);
      os_log_type_t v96 = VCPLogToOSLogType[7];
      if (os_log_type_enabled(v95, v96))
      {
        uint64_t v97 = (void *)objc_claimAutoreleasedReturnValue([v10 asset]);
        id v98 = (void *)objc_claimAutoreleasedReturnValue([v97 localIdentifier]);
        *(_DWORD *)buf = 138412290;
        v125 = v98;
        _os_log_impl((void *)&_mh_execute_header, v95, v96, "[Face][%@] Analysis success", buf, 0xCu);
      }
    }

    [v10 setResults:v51];
    uint64_t v99 = MediaAnalysisVNAnimalObservationResultsKey;
    double v100 = (void *)objc_claimAutoreleasedReturnValue([v51 objectForKeyedSubscript:MediaAnalysisVNAnimalObservationResultsKey]);
    BOOL v101 = v100 == 0LL;

    if (!v101)
    {
      uint64_t v104 = MediaAnalysisLogLevel(v102, v103);
      if ((int)v104 >= 7)
      {
        uint64_t v106 = VCPLogInstance(v104, v105);
        uint64_t v107 = (os_log_s *)objc_claimAutoreleasedReturnValue(v106);
        os_log_type_t v108 = VCPLogToOSLogType[7];
        if (os_log_type_enabled(v107, v108))
        {
          v121 = (void *)objc_claimAutoreleasedReturnValue([v10 asset]);
          v109 = (void *)objc_claimAutoreleasedReturnValue([v121 localIdentifier]);
          *(_DWORD *)buf = 138412290;
          v125 = v109;
          _os_log_impl( (void *)&_mh_execute_header,  v107,  v108,  "[Face][%@] Collecting VN animal observation results...",  buf,  0xCu);
        }
      }

      os_log_type_t v110 = (void *)objc_claimAutoreleasedReturnValue([v51 objectForKeyedSubscript:v99]);
      -[MADPhotosFaceAssetProcessingTask _collectVNAnimalObservationResults:]( self,  "_collectVNAnimalObservationResults:",  v110);
    }

    goto LABEL_58;
  }

  uint64_t v58 = _os_feature_enabled_impl("MediaAnalysis", "FCPeople");
  if ((_DWORD)v58)
  {
    uint64_t v60 = MediaAnalysisLogLevel(v58, v59);
    if ((int)v60 >= 6)
    {
      uint64_t v62 = VCPLogInstance(v60, v61);
      v63 = (os_log_s *)objc_claimAutoreleasedReturnValue(v62);
      os_log_type_t v64 = VCPLogToOSLogType[6];
      if (os_log_type_enabled(v63, v64))
      {
        uint64_t v65 = (void *)objc_claimAutoreleasedReturnValue([v10 asset]);
        uint64_t v66 = (void *)objc_claimAutoreleasedReturnValue([v65 localIdentifier]);
        *(_DWORD *)buf = 138412802;
        v125 = v66;
        __int16 v126 = 1024;
        *(_DWORD *)__int128 v127 = 1;
        *(_WORD *)&v127[4] = 1024;
        *(_DWORD *)&v127[6] = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v63,  v64,  "[Face][%@] Result needs improvement (ResourceTooSmall: %d; BestResource: %d)",
          buf,
          0x18u);
      }
    }

    [v10 setResults:v51];
    uint64_t v67 = MediaAnalysisVNAnimalObservationResultsKey;
    v68 = (void *)objc_claimAutoreleasedReturnValue([v51 objectForKeyedSubscript:MediaAnalysisVNAnimalObservationResultsKey]);
    BOOL v69 = v68 == 0LL;

    if (v69) {
      goto LABEL_57;
    }
    uint64_t v72 = MediaAnalysisLogLevel(v70, v71);
    if ((int)v72 >= 7)
    {
      uint64_t v74 = VCPLogInstance(v72, v73);
      uint64_t v75 = (os_log_s *)objc_claimAutoreleasedReturnValue(v74);
      os_log_type_t v76 = VCPLogToOSLogType[7];
      if (os_log_type_enabled(v75, v76))
      {
        v120 = (void *)objc_claimAutoreleasedReturnValue([v10 asset]);
        uint64_t v77 = (void *)objc_claimAutoreleasedReturnValue([v120 localIdentifier]);
        *(_DWORD *)buf = 138412290;
        v125 = v77;
        _os_log_impl( (void *)&_mh_execute_header,  v75,  v76,  "[Face][%@] Collecting VN animal observation results...",  buf,  0xCu);
      }
    }

    uint64_t v78 = (os_log_s *)objc_claimAutoreleasedReturnValue([v51 objectForKeyedSubscript:v67]);
    -[MADPhotosFaceAssetProcessingTask _collectVNAnimalObservationResults:]( self,  "_collectVNAnimalObservationResults:",  v78);
    goto LABEL_56;
  }

  uint64_t v111 = MediaAnalysisLogLevel(v58, v59);
  if ((int)v111 >= 6)
  {
    uint64_t v113 = VCPLogInstance(v111, v112);
    uint64_t v78 = (os_log_s *)objc_claimAutoreleasedReturnValue(v113);
    os_log_type_t v114 = VCPLogToOSLogType[6];
    if (os_log_type_enabled(v78, v114))
    {
      v115 = (void *)objc_claimAutoreleasedReturnValue([v10 asset]);
      unint64_t v116 = (void *)objc_claimAutoreleasedReturnValue([v115 localIdentifier]);
      *(_DWORD *)buf = 138412802;
      v125 = v116;
      __int16 v126 = 1024;
      *(_DWORD *)__int128 v127 = 1;
      *(_WORD *)&v127[4] = 1024;
      *(_DWORD *)&v127[6] = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v78,  v114,  "[Face][%@] Results disqualified (ResourceTooSmall: %d; BestResource: %d)",
        buf,
        0x18u);
    }

- (void)_dispatchAssetEntries
{
  if (-[NSMutableArray count](self->_assetEntries, "count"))
  {
    double v3 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray firstObject](self->_assetEntries, "firstObject"));
    os_signpost_id_t v4 = (void *)objc_claimAutoreleasedReturnValue([v3 asset]);
    uint64_t v5 = objc_claimAutoreleasedReturnValue([v4 photoLibrary]);

    id v51 = (void *)v5;
    uint64_t v52 = (void *)objc_claimAutoreleasedReturnValue( +[VCPPhotosFaceProcessingContext contextWithPhotoLibrary:]( &OBJC_CLASS___VCPPhotosFaceProcessingContext,  "contextWithPhotoLibrary:",  v5));
    BOOL v6 = -[VCPFaceAnalyzer initWithContext:](objc_alloc(&OBJC_CLASS___VCPFaceAnalyzer), "initWithContext:", v52);
    faceAnalyzer = self->_faceAnalyzer;
    self->_faceAnalyzer = v6;

    unsigned int v55 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableArray arrayWithCapacity:]( &OBJC_CLASS___NSMutableArray,  "arrayWithCapacity:",  self->_processingQueuesCount));
    if (self->_processingQueuesCount)
    {
      unint64_t v8 = 0LL;
      do
      {
        id v9 = objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString, "stringWithFormat:", @"com.apple.mediaanalysisd.face.processing.%lu", v8));
        id v10 = (const char *)[v9 UTF8String];
        dispatch_queue_attr_t v11 = dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
        uint64_t v12 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v11);
        dispatch_queue_t v13 = dispatch_queue_create(v10, v12);

        [v55 addObject:v13];
        ++v8;
      }

      while (v8 < self->_processingQueuesCount);
    }

    unint64_t v14 = 0LL;
    os_log_type_t type = VCPLogToOSLogType[4];
    os_log_type_t v53 = VCPLogToOSLogType[6];
    while (1)
    {
      if (v14 >= (unint64_t)-[NSMutableArray count](self->_assetEntries, "count"))
      {

        return;
      }

      uint64_t v15 = objc_autoreleasePoolPush();
      uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray objectAtIndexedSubscript:](self->_assetEntries, "objectAtIndexedSubscript:", v14));
      id v17 = [v16 status];
      if ((_DWORD)v17) {
        break;
      }
      id v25 = [v16 isAnalysisCompleteFromComputeSync];
      if ((_DWORD)v25)
      {
        uint64_t v27 = MediaAnalysisLogLevel(v25, v26);
        if ((int)v27 >= 6)
        {
          uint64_t v29 = VCPLogInstance(v27, v28);
          id v22 = (os_log_s *)objc_claimAutoreleasedReturnValue(v29);
          if (os_log_type_enabled(v22, v53))
          {
            uint64_t v30 = (void *)objc_claimAutoreleasedReturnValue([v16 asset]);
            uint64_t v31 = (void *)objc_claimAutoreleasedReturnValue([v30 localIdentifier]);
            *(_DWORD *)buf = 138412290;
            v63 = v31;
            _os_log_impl( (void *)&_mh_execute_header,  v22,  v53,  "[Face][Process][%@] Analysis already complete from compute sync ingestion; skipping",
              buf,
              0xCu);
          }

- (int)_process
{
  uint64_t v3 = VCPSignPostLog(self);
  os_signpost_id_t v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  os_signpost_id_t v5 = os_signpost_id_generate(v4);

  uint64_t v7 = VCPSignPostLog(v6);
  unint64_t v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
  id v9 = v8;
  if (v5 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v8))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v9,  OS_SIGNPOST_INTERVAL_BEGIN,  v5,  "MADPhotosFaceAssetProcessingTask_Process",  (const char *)&unk_100199097,  buf,  2u);
  }

  uint64_t v12 = MediaAnalysisLogLevel(v10, v11);
  if ((int)v12 >= 6)
  {
    uint64_t v14 = VCPLogInstance(v12, v13);
    uint64_t v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
    os_log_type_t v16 = VCPLogToOSLogType[6];
    if (os_log_type_enabled(v15, v16))
    {
      unsigned int v17 = -[NSMutableArray count](self->_assetEntries, "count");
      uint64_t v18 = qos_class_self();
      uint64_t v19 = VCPMAQoSDescription(v18);
      uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue(v19);
      *(_DWORD *)buf = 67109378;
      unsigned int v50 = v17;
      __int16 v51 = 2112;
      uint64_t v52 = v20;
      _os_log_impl((void *)&_mh_execute_header, v15, v16, "[Face][Process] Processing %d assets (QoS: %@)", buf, 0x12u);
    }
  }

  uint64_t v21 = objc_alloc_init(&OBJC_CLASS___VCPTimeMeasurement);
  -[VCPTimeMeasurement start](v21, "start");
  id v22 = -[MADPhotosFaceAssetProcessingTask _dispatchAssetEntries](self, "_dispatchAssetEntries");
  uint64_t v24 = MediaAnalysisLogLevel(v22, v23);
  if ((int)v24 >= 7)
  {
    uint64_t v26 = VCPLogInstance(v24, v25);
    uint64_t v27 = (os_log_s *)objc_claimAutoreleasedReturnValue(v26);
    os_log_type_t v28 = VCPLogToOSLogType[7];
    if (os_log_type_enabled(v27, v28))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v27, v28, "[Face] Waiting for detection to complete ...", buf, 2u);
    }
  }

  uint64_t v29 = dispatch_group_wait((dispatch_group_t)self->_processGroup, 0xFFFFFFFFFFFFFFFFLL);
  uint64_t v31 = MediaAnalysisLogLevel(v29, v30);
  if ((int)v31 >= 7)
  {
    uint64_t v33 = VCPLogInstance(v31, v32);
    BOOL v34 = (os_log_s *)objc_claimAutoreleasedReturnValue(v33);
    os_log_type_t v35 = VCPLogToOSLogType[7];
    if (os_log_type_enabled(v34, v35))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v34, v35, "[Face] Detection completed", buf, 2u);
    }
  }

  id v36 = -[NSMutableArray count](self->_assetEntries, "count");
  if (v36)
  {
    -[VCPTimeMeasurement stop](v21, "stop");
    if (self->_processingQueuesCount <= 1) {
      BOOL v37 = @"Serial";
    }
    else {
      BOOL v37 = @"Concurrent";
    }
    uint64_t v38 = v37;
    uint64_t v39 = VCPTaskIDDescription(3LL);
    uint64_t v40 = (void *)objc_claimAutoreleasedReturnValue(v39);
    uint64_t v41 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@-%@-Analyze",  v40,  v38));

    -[VCPTimeMeasurement elapsedTimeSeconds](v21, "elapsedTimeSeconds");
    VCPCoreAnalyticsQoSReportSpeed( v41,  v42 * 1000.0 / (double)(unint64_t)-[NSMutableArray count](self->_assetEntries, "count"));
    os_signpost_id_t v43 = (void *)objc_claimAutoreleasedReturnValue( +[VCPMADCoreAnalyticsManager sharedManager]( &OBJC_CLASS___VCPMADCoreAnalyticsManager,  "sharedManager"));
    -[VCPTimeMeasurement elapsedTimeSeconds](v21, "elapsedTimeSeconds");
    objc_msgSend( v43,  "accumulateDoubleValue:forField:andEvent:",  @"FaceDetectionElapsedTimeInSeconds",  @"com.apple.mediaanalysisd.FaceAnalysisRunSession");

    uint64_t v44 = (void *)objc_claimAutoreleasedReturnValue( +[VCPMADCoreAnalyticsManager sharedManager]( &OBJC_CLASS___VCPMADCoreAnalyticsManager,  "sharedManager"));
    -[VCPTimeMeasurement elapsedTimeSeconds](v21, "elapsedTimeSeconds");
    objc_msgSend( v44,  "accumulateDoubleValue:forField:andEvent:",  @"TotalAnalyzingTimeInSeconds",  @"com.apple.mediaanalysisd.FaceAnalysisRunSession");
  }

  uint64_t v45 = VCPSignPostLog(v36);
  uint64_t v46 = (os_log_s *)objc_claimAutoreleasedReturnValue(v45);
  uint64_t v47 = v46;
  if (v5 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v46))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v47,  OS_SIGNPOST_INTERVAL_END,  v5,  "MADPhotosFaceAssetProcessingTask_Process",  (const char *)&unk_100199097,  buf,  2u);
  }

  return 0;
}

- (void)process
{
  if (!self->_status) {
    self->_status = -[MADPhotosFaceAssetProcessingTask _process](self, "_process");
  }
}

- (void)_publishEntry:(id)a3 faceLocalIdentifiers:(id *)a4
{
  id v135 = a3;
  os_signpost_id_t v4 = (void *)objc_claimAutoreleasedReturnValue([v135 asset]);
  os_signpost_id_t v5 = (void *)objc_claimAutoreleasedReturnValue([v4 localIdentifier]);
  v140 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"[FacePersist][Unified][%@]",  v5));

  if (_os_feature_enabled_impl("MediaAnalysis", "FCPeople"))
  {
    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue([v135 results]);
    BOOL v7 = v6 != 0LL;
  }

  else
  {
    BOOL v7 = 0;
  }

  if (!v135) {
    goto LABEL_123;
  }
  id v9 = [v135 isAnalysisCompleteFromComputeSync];
  if ((_DWORD)v9)
  {
    uint64_t v11 = MediaAnalysisLogLevel(v9, v10);
    if ((int)v11 >= 6)
    {
      uint64_t v13 = VCPLogInstance(v11, v12);
      uint64_t v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
      os_log_type_t v15 = VCPLogToOSLogType[6];
      os_log_type_t v16 = v14;
      v145 = v14;
      if (os_log_type_enabled(v14, v15))
      {
        *(_DWORD *)buf = 138412290;
        v155 = v140;
        _os_log_impl( (void *)&_mh_execute_header,  v16,  v15,  "%@ Analysis already complete from compute sync ingestion; skip publishing",
          buf,
          0xCu);
      }

      goto LABEL_122;
    }

    goto LABEL_123;
  }

  unsigned int v17 = (void *)objc_claimAutoreleasedReturnValue([v135 asset]);
  uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue([v17 photoLibrary]);
  uint64_t v19 = (os_log_s *)objc_claimAutoreleasedReturnValue([v18 librarySpecificFetchOptions]);

  v145 = v19;
  -[os_log_s setIncludeNonvisibleFaces:](v19, "setIncludeNonvisibleFaces:", 1LL);
  -[os_log_s setIncludeTorsoOnlyDetectionData:](v19, "setIncludeTorsoOnlyDetectionData:", 1LL);
  -[os_log_s setIncludedDetectionTypes:](v19, "setIncludedDetectionTypes:", &off_1001C90A8);
  uint64_t v162 = PHFacePropertySetIdentifier;
  uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v162, 1LL));
  -[os_log_s setFetchPropertySets:](v19, "setFetchPropertySets:", v20);

  uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue([v135 results]);
  uint64_t v22 = MediaAnalysisFaceResultsKey;
  uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue([v21 objectForKeyedSubscript:MediaAnalysisFaceResultsKey]);
  __int128 v131 = (void *)objc_claimAutoreleasedReturnValue([v23 objectForKeyedSubscript:VCPFacesToDelete]);

  id v130 = (void *)objc_claimAutoreleasedReturnValue( +[VCPFaceUtils phFacesFromVCPPhotosFaces:withFetchOptions:]( &OBJC_CLASS___VCPFaceUtils,  "phFacesFromVCPPhotosFaces:withFetchOptions:",  v131,  v145));
  id v24 = [v130 count];
  if (v24)
  {
    uint64_t v26 = MediaAnalysisLogLevel(v24, v25);
    if ((int)v26 >= 7)
    {
      uint64_t v28 = VCPLogInstance(v26, v27);
      uint64_t v29 = (os_log_s *)objc_claimAutoreleasedReturnValue(v28);
      os_log_type_t v30 = VCPLogToOSLogType[7];
      if (os_log_type_enabled(v29, v30))
      {
        *(_DWORD *)buf = 138412546;
        v155 = v140;
        __int16 v156 = 2048;
        v157 = (const __CFString *)[v130 count];
        _os_log_impl((void *)&_mh_execute_header, v29, v30, "%@ Deleting %lu faces", buf, 0x16u);
      }
    }

    +[PHFaceChangeRequest deleteFaces:](&OBJC_CLASS___PHFaceChangeRequest, "deleteFaces:", v130);
  }

  id v139 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  uint64_t v31 = (void *)objc_claimAutoreleasedReturnValue([v135 asset]);
  v142 = (void *)objc_claimAutoreleasedReturnValue( +[PHAssetChangeRequest changeRequestForAsset:]( &OBJC_CLASS___PHAssetChangeRequest,  "changeRequestForAsset:",  v31));

  uint64_t v32 = (void *)objc_claimAutoreleasedReturnValue([v135 results]);
  uint64_t v33 = (void *)objc_claimAutoreleasedReturnValue([v32 objectForKeyedSubscript:v22]);
  __int16 v129 = (void *)objc_claimAutoreleasedReturnValue([v33 objectForKeyedSubscript:VCPFacesToPersist]);

  uint64_t v36 = MediaAnalysisLogLevel(v34, v35);
  if ((int)v36 >= 7)
  {
    uint64_t v38 = VCPLogInstance(v36, v37);
    uint64_t v39 = (os_log_s *)objc_claimAutoreleasedReturnValue(v38);
    os_log_type_t v40 = VCPLogToOSLogType[7];
    if (os_log_type_enabled(v39, v40))
    {
      uint64_t v41 = (const __CFString *)[v129 count];
      *(_DWORD *)buf = 138412546;
      v155 = v140;
      __int16 v156 = 2048;
      v157 = v41;
      _os_log_impl((void *)&_mh_execute_header, v39, v40, "%@ Inserting/updating %lu faces ... ", buf, 0x16u);
    }
  }

  __int128 v151 = 0u;
  __int128 v152 = 0u;
  __int128 v149 = 0u;
  __int128 v150 = 0u;
  id obj = v129;
  id v42 = [obj countByEnumeratingWithState:&v149 objects:v161 count:16];
  if (!v42)
  {
    char v137 = 0;
    uint64_t v141 = 0LL;
    uint64_t v133 = 0LL;
    uint64_t v134 = 0LL;
    uint64_t v136 = 0LL;
    goto LABEL_102;
  }

  char v137 = 0;
  uint64_t v141 = 0LL;
  uint64_t v133 = 0LL;
  uint64_t v134 = 0LL;
  uint64_t v136 = 0LL;
  uint64_t v147 = *(void *)v150;
  os_log_type_t type = VCPLogToOSLogType[7];
  os_log_type_t v138 = VCPLogToOSLogType[3];
  do
  {
    id v148 = v42;
    for (i = 0LL; i != v148; i = (char *)i + 1)
    {
      if (*(void *)v150 != v147) {
        objc_enumerationMutation(obj);
      }
      uint64_t v44 = *(void **)(*((void *)&v149 + 1) + 8LL * (void)i);
      if (_os_feature_enabled_impl("MediaAnalysis", "FCPeople"))
      {
        id v45 = [v44 algorithmVersion];
        uint64_t v46 = _os_feature_enabled_impl("MediaAnalysis", "VisualUnderstandingService");
        uint64_t v48 = 11LL;
        if ((_DWORD)v46) {
          uint64_t v48 = 14LL;
        }
        if (v45 == (id)v48)
        {
          uint64_t v49 = MediaAnalysisLogLevel(v46, v47);
          if ((int)v49 >= 7)
          {
            uint64_t v51 = VCPLogInstance(v49, v50);
            uint64_t v52 = (os_log_s *)objc_claimAutoreleasedReturnValue(v51);
            if (os_log_type_enabled(v52, type))
            {
              os_log_type_t v53 = (__CFString *)objc_claimAutoreleasedReturnValue([v44 localIdentifier]);
              *(_DWORD *)buf = 138412546;
              v155 = v140;
              __int16 v156 = 2112;
              v157 = v53;
              _os_log_impl((void *)&_mh_execute_header, v52, type, "%@ Marking asset contains FC face %@", buf, 0x16u);
            }
          }

          char v137 = 1;
        }
      }

      v54 = (void *)objc_claimAutoreleasedReturnValue([v44 localIdentifier]);

      if (!v54)
      {
        unsigned __int8 v59 = 0LL;
        uint64_t v55 = objc_claimAutoreleasedReturnValue( +[PHFaceChangeRequest creationRequestForFace]( &OBJC_CLASS___PHFaceChangeRequest,  "creationRequestForFace"));
        id v58 = (void *)v55;
        if (!v55) {
          goto LABEL_55;
        }
LABEL_42:
        +[VCPFaceUtils assignPropertiesOfVCPPhotosFace:toPHFaceChangeRequest:]( &OBJC_CLASS___VCPFaceUtils,  "assignPropertiesOfVCPPhotosFace:toPHFaceChangeRequest:",  v44,  v58);
        unsigned int v60 = [v44 detectionType];
        BOOL v61 = [v44 detectionType] == 3
           || [v44 detectionType] == 4;
        if (v60 == 1)
        {
          [v44 centerX];
          if (v62 == 0.0 && ([v44 centerY], v63 == 0.0) && (objc_msgSend(v44, "size"), v64 == 0.0))
          {
            [v44 bodyCenterX];
            if (v65 == 0.0
              && ([v44 bodyCenterY], v66 == 0.0)
              && ([v44 bodyWidth], v67 == 0.0))
            {
              [v44 bodyHeight];
              BOOL v68 = v106 != 0.0;
            }

            else
            {
              BOOL v68 = 1;
            }
          }

          else
          {
            BOOL v68 = 0;
          }

          [v44 centerX];
          if (v74 == 0.0 && ([v44 centerY], v75 == 0.0) && (objc_msgSend(v44, "size"), v76 == 0.0)
            || ([v44 bodyCenterX], v77 != 0.0)
            || ([v44 bodyCenterY], v78 != 0.0)
            || ([v44 bodyWidth], v79 != 0.0))
          {
            BOOL v69 = 0;
            int v146 = 0;
            uint64_t v70 = @"face";
            if (!v68) {
              goto LABEL_69;
            }
          }

          else
          {
            [v44 bodyHeight];
            BOOL v69 = v80 == 0.0;
            if (!v68)
            {
              int v146 = 0;
              uint64_t v70 = @"face";
              goto LABEL_69;
            }
          }

          int v146 = 1;
          uint64_t v70 = @"torso";
          goto LABEL_69;
        }

        BOOL v69 = 0;
        int v146 = 0;
        uint64_t v70 = @"pet";
LABEL_69:
        if (v54)
        {
          v153 = v59;
          uint64_t v81 = (void *)objc_claimAutoreleasedReturnValue( +[NSArray arrayWithObjects:count:]( &OBJC_CLASS___NSArray,  "arrayWithObjects:count:",  &v153,  1LL));
          [v142 addFaces:v81];

          uint64_t v84 = MediaAnalysisLogLevel(v82, v83);
          if ((int)v84 >= 7)
          {
            uint64_t v86 = VCPLogInstance(v84, v85);
            uint64_t v87 = (os_log_s *)objc_claimAutoreleasedReturnValue(v86);
            if (os_log_type_enabled(v87, type))
            {
              v88 = (void *)objc_claimAutoreleasedReturnValue([v59 localIdentifier]);
              *(_DWORD *)buf = 138412802;
              v155 = v140;
              __int16 v156 = 2112;
              v157 = v70;
              __int16 v158 = 2112;
              v159 = v88;
              _os_log_impl((void *)&_mh_execute_header, v87, type, "%@ Updating %@ %@", buf, 0x20u);
            }
          }

          if (v60 == 1
            || v61
            && (double v100 = (void *)objc_claimAutoreleasedReturnValue([v135 asset]),
                BOOL v101 = (void *)objc_claimAutoreleasedReturnValue([v100 photoLibrary]),
                unsigned int v102 = objc_msgSend(v101, "mad_useVUGallery"),
                v101,
                v100,
                v102))
          {
            os_log_type_t v89 = (void *)objc_claimAutoreleasedReturnValue([v59 localIdentifier]);
            [v139 addObject:v89];
          }

          [v58 setClusterSequenceNumber:0];
          [v58 setVuObservationID:0];
        }

        else
        {
          v90 = (void *)objc_claimAutoreleasedReturnValue([v58 placeholderForCreatedFace]);
          v160 = v90;
          dispatch_time_t v91 = (void *)objc_claimAutoreleasedReturnValue( +[NSArray arrayWithObjects:count:]( &OBJC_CLASS___NSArray,  "arrayWithObjects:count:",  &v160,  1LL));
          [v142 addFaces:v91];

          uint64_t v94 = MediaAnalysisLogLevel(v92, v93);
          if ((int)v94 >= 7)
          {
            uint64_t v96 = VCPLogInstance(v94, v95);
            uint64_t v97 = (os_log_s *)objc_claimAutoreleasedReturnValue(v96);
            if (os_log_type_enabled(v97, type))
            {
              id v98 = (void *)objc_claimAutoreleasedReturnValue([v90 localIdentifier]);
              *(_DWORD *)buf = 138412802;
              v155 = v140;
              __int16 v156 = 2112;
              v157 = v70;
              __int16 v158 = 2112;
              v159 = v98;
              _os_log_impl((void *)&_mh_execute_header, v97, type, "%@ Adding %@ %@", buf, 0x20u);
            }
          }

          if (v60 == 1
            || v61
            && (uint64_t v103 = (void *)objc_claimAutoreleasedReturnValue([v135 asset]),
                uint64_t v104 = (void *)objc_claimAutoreleasedReturnValue([v103 photoLibrary]),
                unsigned int v105 = objc_msgSend(v104, "mad_useVUGallery"),
                v104,
                v103,
                v105))
          {
            uint64_t v99 = (void *)objc_claimAutoreleasedReturnValue([v90 localIdentifier]);
            [v139 addObject:v99];
          }
        }

        if (v60 == 1)
        {
          if (v69)
          {
            ++v136;
          }

          else if (v146)
          {
            ++v133;
          }

          else
          {
            ++v134;
          }
        }

        else
        {
          ++v141;
        }

        goto LABEL_92;
      }

      uint64_t v55 = objc_claimAutoreleasedReturnValue( +[VCPFaceUtils phFaceFromVCPPhotosFace:withFetchOptions:]( &OBJC_CLASS___VCPFaceUtils,  "phFaceFromVCPPhotosFace:withFetchOptions:",  v44,  v145));
      id v57 = (void *)v55;
      if (v55)
      {
        uint64_t v55 = objc_claimAutoreleasedReturnValue( +[PHFaceChangeRequest changeRequestForFace:]( &OBJC_CLASS___PHFaceChangeRequest,  "changeRequestForFace:",  v55));
        id v58 = (void *)v55;
        unsigned __int8 v59 = v57;
        if (v55) {
          goto LABEL_42;
        }
      }

      else
      {
        unsigned __int8 v59 = 0LL;
      }

- (int)_publish
{
  double v74 = objc_alloc_init(&OBJC_CLASS___VCPTimeMeasurement);
  uint64_t v2 = VCPSignPostLog(-[VCPTimeMeasurement start](v74, "start"));
  uint64_t v3 = (os_log_s *)objc_claimAutoreleasedReturnValue(v2);
  os_signpost_id_t v4 = os_signpost_id_generate(v3);

  uint64_t v6 = VCPSignPostLog(v5);
  BOOL v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
  unint64_t v8 = v7;
  os_signpost_id_t spid = v4;
  unint64_t v68 = v4 - 1;
  if (v4 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v7))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v8,  OS_SIGNPOST_INTERVAL_BEGIN,  v4,  "MADPhotosFaceAssetProcessingTask_Publish",  (const char *)&unk_100199097,  buf,  2u);
  }

  uint64_t v11 = MediaAnalysisLogLevel(v9, v10);
  uint64_t v13 = &selRef_requestImageProcessing_forAssetURL_withSandboxToken_identifier_requestID_andReply_;
  if ((int)v11 >= 6)
  {
    uint64_t v14 = VCPLogInstance(v11, v12);
    os_log_type_t v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
    os_log_type_t v16 = VCPLogToOSLogType[6];
    if (os_log_type_enabled(v15, v16))
    {
      unsigned int v17 = -[NSMutableArray count](self->_assetEntries, "count");
      uint64_t v18 = qos_class_self();
      uint64_t v19 = VCPMAQoSDescription(v18);
      uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue(v19);
      *(_DWORD *)buf = 67109378;
      *(_DWORD *)uint64_t v87 = v17;
      *(_WORD *)&v87[4] = 2112;
      *(void *)&v87[6] = v20;
      _os_log_impl((void *)&_mh_execute_header, v15, v16, "[Face] Persisting %d assets (QoS: %@)", buf, 0x12u);
    }
  }

  if (-[NSMutableArray count](self->_assetEntries, "count"))
  {
    uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue(+[MADStateHandler sharedStateHandler](&OBJC_CLASS___MADStateHandler, "sharedStateHandler"));
    objc_msgSend( v21,  "addBreadcrumb:",  @"[Face] Persisting %d assets to Photos",  -[NSMutableArray count](self->_assetEntries, "count"));

    uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue(+[VCPWatchdog sharedWatchdog](&OBJC_CLASS___VCPWatchdog, "sharedWatchdog"));
    [v22 pet];

    uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue(+[MADStateHandler sharedStateHandler](&OBJC_CLASS___MADStateHandler, "sharedStateHandler"));
    [v23 enterKnownTimeoutRisk:1];

    v84[0] = _NSConcreteStackBlock;
    v84[1] = 3221225472LL;
    v84[2] = sub_1000A44A0;
    v84[3] = &unk_1001BA0C8;
    v84[4] = self;
    uint64_t v72 = objc_retainBlock(v84);
    uint64_t v24 = objc_claimAutoreleasedReturnValue(-[NSMutableArray firstObject](self->_assetEntries, "firstObject"));
    uint64_t v25 = (void *)objc_claimAutoreleasedReturnValue([(id)v24 asset]);
    uint64_t v73 = (void *)objc_claimAutoreleasedReturnValue([v25 photoLibrary]);

    uint64_t v26 = (void *)objc_claimAutoreleasedReturnValue(-[MADProcessingTask cancelBlock](self, "cancelBlock"));
    id v83 = 0LL;
    LOBYTE(v24) = objc_msgSend( v73,  "mad_performChangesAndWait:cancelBlock:extendTimeoutBlock:error:",  v72,  v26,  &stru_1001BC870,  &v83);
    id v76 = v83;

    uint64_t v27 = (void *)objc_claimAutoreleasedReturnValue(+[MADStateHandler sharedStateHandler](&OBJC_CLASS___MADStateHandler, "sharedStateHandler"));
    [v27 exitKnownTimeoutRisk];

    uint64_t v28 = (void *)objc_claimAutoreleasedReturnValue(+[MADStateHandler sharedStateHandler](&OBJC_CLASS___MADStateHandler, "sharedStateHandler"));
    objc_msgSend( v28,  "addBreadcrumb:",  @"[Face] Finished persisting %d assets to Photos",  -[NSMutableArray count](self->_assetEntries, "count"));

    if ((v24 & 1) != 0)
    {
      uint64_t v70 = (void *)objc_claimAutoreleasedReturnValue( +[VCPMADCoreAnalyticsManager sharedManager]( &OBJC_CLASS___VCPMADCoreAnalyticsManager,  "sharedManager"));
      __int128 v81 = 0u;
      __int128 v82 = 0u;
      __int128 v79 = 0u;
      __int128 v80 = 0u;
      id obj = self->_assetEntries;
      id v31 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( obj,  "countByEnumeratingWithState:objects:count:",  &v79,  v85,  16LL);
      unsigned int v32 = 0;
      if (v31)
      {
        uint64_t v77 = *(void *)v80;
        do
        {
          id v75 = v31;
          for (i = 0LL; i != v75; i = (char *)i + 1)
          {
            if (*(void *)v80 != v77) {
              objc_enumerationMutation(obj);
            }
            uint64_t v34 = *(void **)(*((void *)&v79 + 1) + 8LL * (void)i);
            if ([v34 status])
            {
              if ([v34 status] == -128)
              {
                id v35 = [v34 previousAttempts];
                analysisDatabase = self->_analysisDatabase;
                if (v35)
                {
                  id v37 = [v34 previousAttempts];
                  uint64_t v38 = (void *)objc_claimAutoreleasedReturnValue([v34 asset]);
                  id v39 = [v34 previousStatus];
                  os_log_type_t v40 = (void *)objc_claimAutoreleasedReturnValue([v34 lastAttemptDate]);
                  id v41 = (id)-[VCPDatabaseWriter setAttempts:asset:taskID:status:lastAttemptDate:]( analysisDatabase,  "setAttempts:asset:taskID:status:lastAttemptDate:",  v37,  v38,  3LL,  v39,  v40);
                }

                else
                {
                  uint64_t v38 = (void *)objc_claimAutoreleasedReturnValue([v34 asset]);
                  os_log_type_t v40 = (void *)objc_claimAutoreleasedReturnValue([v38 localIdentifier]);
                  id v41 = (id)-[VCPDatabaseWriter removeProcessingStatusForLocalIdentifier:andTaskID:]( analysisDatabase,  "removeProcessingStatusForLocalIdentifier:andTaskID:",  v40,  3LL);
                }

                if ((_DWORD)v41 == -108 || (_DWORD)v41 == -36)
                {
                  uint64_t v47 = (os_log_s *)v41;
                }

                else
                {
                  uint64_t v47 = (os_log_s *)v41;
                  if ((_DWORD)v41 != -23) {
                    uint64_t v47 = (os_log_s *)v13;
                  }
                }

                if ((_DWORD)v41 == -108 || (_DWORD)v41 == -36 || (_DWORD)v41 == -23) {
                  goto LABEL_81;
                }
                unsigned int v32 = [v34 status];
                uint64_t v13 = (char **)v47;
                continue;
              }

              uint64_t v48 = @"NumberOfAssetsSoftFailure";
              if ([v34 status] == -23802)
              {
                uint64_t v49 = @"NumberOfAssetsNoResource";

                uint64_t v50 = 2LL;
                goto LABEL_29;
              }

              if ([v34 status] == -23808)
              {
                uint64_t v49 = @"NumberOfAssetsDownloadThrottled";

                unsigned int v32 = [v34 status];
                uint64_t v50 = 7LL;
LABEL_29:
                uint64_t v48 = v49;
              }

              else
              {
                uint64_t v50 = 3LL;
              }

              uint64_t v52 = (void *)objc_claimAutoreleasedReturnValue([v34 asset]);
              os_log_type_t v53 = (void *)objc_claimAutoreleasedReturnValue([v34 currentAttemptDate]);
              v54 = (void *)objc_claimAutoreleasedReturnValue( objc_msgSend( v52,  "mad_nextAttemptDateForStatus:currentAttemptDate:attemptCount:",  v50,  v53,  (char *)objc_msgSend(v34, "previousAttempts") + 1));

              uint64_t v55 = self->_analysisDatabase;
              uint64_t v56 = (void *)objc_claimAutoreleasedReturnValue([v34 asset]);
              id v57 = (void *)objc_claimAutoreleasedReturnValue([v56 localIdentifier]);
              id v58 = (id)-[VCPDatabaseWriter updateProcessingStatus:andNextAttemptDate:forLocalIdentifier:andTaskID:]( v55,  "updateProcessingStatus:andNextAttemptDate:forLocalIdentifier:andTaskID:",  v50,  v54,  v57,  3LL);

              if ((_DWORD)v58 == -108 || (_DWORD)v58 == -36)
              {
                uint64_t v47 = (os_log_s *)v58;
              }

              else
              {
                uint64_t v47 = (os_log_s *)v58;
                if ((_DWORD)v58 != -23) {
                  uint64_t v47 = (os_log_s *)v13;
                }
              }

              if ((_DWORD)v58 != -108 && (_DWORD)v58 != -36 && (_DWORD)v58 != -23) {
                [v70 accumulateInt64Value:1 forField:v48 andEvent:@"com.apple.mediaanalysisd.FaceAnalysisRunSession"];
              }

              if ((_DWORD)v58 == -108) {
                goto LABEL_81;
              }
              if ((_DWORD)v58 == -36) {
                goto LABEL_81;
              }
              uint64_t v13 = (char **)v47;
              if ((_DWORD)v58 == -23) {
                goto LABEL_81;
              }
              continue;
            }

            id v42 = self->_analysisDatabase;
            os_signpost_id_t v43 = (void *)objc_claimAutoreleasedReturnValue([v34 asset]);
            uint64_t v44 = (void *)objc_claimAutoreleasedReturnValue([v43 localIdentifier]);
            id v45 = (id)-[VCPDatabaseWriter removeProcessingStatusForLocalIdentifier:andTaskID:]( v42,  "removeProcessingStatusForLocalIdentifier:andTaskID:",  v44,  3LL);

            if ((_DWORD)v45 == -108)
            {
              uint64_t v47 = (os_log_s *)v45;
            }

            else
            {
              BOOL v46 = (_DWORD)v45 == -36 || (_DWORD)v45 == -23;
              uint64_t v47 = (os_log_s *)v45;
              if (!v46) {
                uint64_t v47 = (os_log_s *)v13;
              }
            }

            if ((_DWORD)v45 == -108) {
              goto LABEL_81;
            }
            if ((_DWORD)v45 == -36 || (_DWORD)v45 == -23) {
              goto LABEL_81;
            }
            [v70 accumulateInt64Value:1 forField:@"NumberOfAssetsAnalyzed" andEvent:@"com.apple.mediaanalysisd.FaceAnalysisRunSession"];
            uint64_t v13 = (char **)v47;
          }

          id v31 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( obj,  "countByEnumeratingWithState:objects:count:",  &v79,  v85,  16LL);
        }

        while (v31);
      }

      uint64_t v64 = -[VCPDatabaseWriter commit](self->_analysisDatabase, "commit");
      if ((_DWORD)v64 == -108 || (_DWORD)v64 == -36)
      {
        LODWORD(v47) = v64;
      }

      else
      {
        LODWORD(v47) = v64;
        if ((_DWORD)v64 != -23) {
          LODWORD(v47) = (_DWORD)v13;
        }
      }

      if ((_DWORD)v64 != -108 && (_DWORD)v64 != -36 && (_DWORD)v64 != -23)
      {
        uint64_t v65 = VCPSignPostLog(v64);
        double v66 = (os_log_s *)objc_claimAutoreleasedReturnValue(v65);
        uint64_t v47 = v66;
        if (v68 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v66))
        {
          *(_WORD *)buf = 0;
          _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v47,  OS_SIGNPOST_INTERVAL_END,  spid,  "MADPhotosFaceAssetProcessingTask_Publish",  (const char *)&unk_100199097,  buf,  2u);
        }

        -[VCPTimeMeasurement stop](v74, "stop");
        id obj = (NSMutableArray *)objc_claimAutoreleasedReturnValue( +[VCPMADCoreAnalyticsManager sharedManager]( &OBJC_CLASS___VCPMADCoreAnalyticsManager,  "sharedManager"));
        -[VCPTimeMeasurement elapsedTimeSeconds](v74, "elapsedTimeSeconds");
        -[NSMutableArray accumulateDoubleValue:forField:andEvent:]( obj,  "accumulateDoubleValue:forField:andEvent:",  @"TotalPublishTimeInSeconds",  @"com.apple.mediaanalysisd.FaceAnalysisRunSession");
        LODWORD(v47) = v32;
LABEL_81:
      }
    }

    else
    {
      uint64_t v59 = MediaAnalysisLogLevel(v29, v30);
      if ((int)v59 >= 3)
      {
        uint64_t v61 = VCPLogInstance(v59, v60);
        double v62 = (os_log_s *)objc_claimAutoreleasedReturnValue(v61);
        os_log_type_t v63 = VCPLogToOSLogType[3];
        if (os_log_type_enabled(v62, v63))
        {
          *(_DWORD *)buf = 138412290;
          *(void *)uint64_t v87 = v76;
          _os_log_impl( (void *)&_mh_execute_header,  v62,  v63,  "[Face] Failed to persist Face results to Photos (%@)",  buf,  0xCu);
        }
      }

      LODWORD(v47) = [v76 code];
    }
  }

  else
  {
    LODWORD(v47) = 0;
  }

  return (int)v47;
}

- (void)publish
{
  if (!self->_status) {
    self->_status = -[MADPhotosFaceAssetProcessingTask _publish](self, "_publish");
  }
}

- (void)processDeletedAssets:(id)a3
{
  id v4 = a3;
  if ([v4 count])
  {
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472LL;
    v18[2] = sub_1000A4810;
    v18[3] = &unk_1001B9E98;
    v18[4] = self;
    uint64_t v5 = objc_retainBlock(v18);
    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(+[MADGDUtilities sharedInstance](&OBJC_CLASS___MADGDUtilities, "sharedInstance"));
    gallery = self->_gallery;
    id v17 = 0LL;
    unsigned __int8 v8 = [v6 removeObservationsWithAssetLocalIdentifiers:v4 gallery:gallery cancelOrExtendTimeoutBlock:v5 error:&v17];
    id v9 = v17;

    if ((v8 & 1) == 0)
    {
      uint64_t v12 = MediaAnalysisLogLevel(v10, v11);
      if ((int)v12 >= 3)
      {
        uint64_t v14 = VCPLogInstance(v12, v13);
        os_log_type_t v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
        os_log_type_t v16 = VCPLogToOSLogType[3];
        if (os_log_type_enabled(v15, v16))
        {
          *(_DWORD *)buf = 138412290;
          id v20 = v9;
          _os_log_impl( (void *)&_mh_execute_header,  v15,  v16,  "[Face] Failed to remove faces from Gallery - %@",  buf,  0xCu);
        }
      }
    }
  }
}

- (void).cxx_destruct
{
}

@end