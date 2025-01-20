@interface MADPhotosFaceTaskProvider
+ (id)name;
+ (unint64_t)taskID;
- (BOOL)shouldProcessAsset:(id)a3;
- (MADPhotosFaceTaskProvider)initWithPhotoLibrary:(id)a3 skipSyncGallery:(BOOL)a4 cancelBlock:(id)a5;
- (id)assetPriorities;
- (id)assetTaskWithAnalysisDatabase:(id)a3;
- (id)nextAssetProcessingTask;
- (id)nextClusterProcessingTask;
- (id)nextDownloadAssetProcessingTask;
- (void)dealloc;
- (void)retireTask:(id)a3;
@end

@implementation MADPhotosFaceTaskProvider

- (MADPhotosFaceTaskProvider)initWithPhotoLibrary:(id)a3 skipSyncGallery:(BOOL)a4 cancelBlock:(id)a5
{
  BOOL v6 = a4;
  id v9 = a3;
  id v10 = a5;
  v68.receiver = self;
  v68.super_class = (Class)&OBJC_CLASS___MADPhotosFaceTaskProvider;
  v11 = -[MADPhotosTaskProvider initWithPhotoLibrary:cancelBlock:](&v68, "initWithPhotoLibrary:cancelBlock:", v9, v10);
  v12 = v11;
  if (!v11) {
    goto LABEL_16;
  }
  p_photoLibrary = (id *)&v11->_photoLibrary;
  objc_storeStrong((id *)&v11->_photoLibrary, a3);
  v14 = -[VCPPhotosFaceProcessingContext initWithPhotoLibrary:]( objc_alloc(&OBJC_CLASS___VCPPhotosFaceProcessingContext),  "initWithPhotoLibrary:",  v9);
  context = v12->_context;
  v12->_context = v14;

  -[VCPPhotosFaceProcessingContext setSkipGallerySyncing:](v12->_context, "setSkipGallerySyncing:", v6);
  dispatch_queue_attr_t v16 = dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v17 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v16);
  dispatch_queue_t v18 = dispatch_queue_create("com.apple.mediaanalysisd.photos.facetask.person", v17);
  managementQueue = v12->_managementQueue;
  v12->_managementQueue = (OS_dispatch_queue *)v18;

  v12->_personProcessingRequirement = 0LL;
  uint64_t v20 = VCPTaskIDDescription(-[MADTaskProvider taskID](v12, "taskID"));
  v21 = (void *)objc_claimAutoreleasedReturnValue(v20);
  v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*p_photoLibrary, "vcp_description"));
  uint64_t v23 = objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"[%@][%@][Tasking]",  v21,  v22));
  logPrefix = v12->_logPrefix;
  v12->_logPrefix = (NSString *)v23;

  if (!objc_msgSend(*p_photoLibrary, "mad_useVUGallery"))
  {
    v30 = objc_alloc(&OBJC_CLASS___VCPFaceClusterer);
    v31 = v12->_context;
    v60[0] = _NSConcreteStackBlock;
    v60[1] = 3221225472LL;
    v60[2] = sub_100125CE8;
    v60[3] = &unk_1001B99C8;
    v61 = (os_log_s *)v10;
    v32 = -[VCPFaceClusterer initWithPhotoLibrary:context:cancelOrExtendTimeoutBlock:]( v30,  "initWithPhotoLibrary:context:cancelOrExtendTimeoutBlock:",  v9,  v31,  v60);
    faceClusterer = v12->_faceClusterer;
    v12->_faceClusterer = v32;

    v28 = v61;
    goto LABEL_15;
  }

  if (objc_msgSend(v9, "vcp_isSyndicationLibrary"))
  {
    uint64_t v25 = _os_feature_enabled_impl("MediaAnalysis", "VUSyndicationLibrary");
    if (!(_DWORD)v25)
    {
      uint64_t v55 = MediaAnalysisLogLevel(v25, v26);
      uint64_t v57 = VCPLogInstance(v55, v56);
      v28 = (os_log_s *)objc_claimAutoreleasedReturnValue(v57);
      os_log_type_t v58 = VCPLogToOSLogType[7];
      if (os_log_type_enabled(v28, v58))
      {
        v59 = v12->_logPrefix;
        *(_DWORD *)buf = 138412290;
        *(void *)&buf[4] = v59;
        _os_log_impl((void *)&_mh_execute_header, v28, v58, "%@ Skipping Syndication Library", buf, 0xCu);
      }

+ (id)name
{
  return @"Face";
}

+ (unint64_t)taskID
{
  return 3LL;
}

- (void)dealloc
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[VNSession globalSession](&OBJC_CLASS___VNSession, "globalSession"));
  [v3 releaseCachedResources];

  +[PHAssetResourceManager vcp_flushFileCache](&OBJC_CLASS___PHAssetResourceManager, "vcp_flushFileCache");
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___MADPhotosFaceTaskProvider;
  -[MADPhotosFaceTaskProvider dealloc](&v4, "dealloc");
}

- (BOOL)shouldProcessAsset:(id)a3
{
  id v3 = a3;
  objc_super v4 = (void *)objc_claimAutoreleasedReturnValue([v3 photoLibrary]);
  if (!objc_msgSend(v4, "mad_pauseFCPeopleFurtherProcessing"))
  {

LABEL_12:
    unsigned __int8 v15 = objc_msgSend(v3, "vcp_needsFaceProcessing");
    goto LABEL_13;
  }

  unsigned int v5 = [v3 faceAnalysisVersion];
  else {
    int v6 = 11;
  }

  if (v6 != v5) {
    goto LABEL_12;
  }
  uint64_t v9 = MediaAnalysisLogLevel(v7, v8);
  if ((int)v9 >= 5)
  {
    uint64_t v11 = VCPLogInstance(v9, v10);
    v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
    os_log_type_t v13 = VCPLogToOSLogType[5];
    if (os_log_type_enabled(v12, v13))
    {
      v14 = (void *)objc_claimAutoreleasedReturnValue([v3 localIdentifier]);
      int v17 = 138412290;
      dispatch_queue_t v18 = v14;
      _os_log_impl((void *)&_mh_execute_header, v12, v13, "[%@] already with FC version; skip", (uint8_t *)&v17, 0xCu);
    }
  }

  unsigned __int8 v15 = 0;
LABEL_13:

  return v15;
}

- (id)assetTaskWithAnalysisDatabase:(id)a3
{
  id v4 = a3;
  unsigned int v5 = (void *)objc_claimAutoreleasedReturnValue([v4 photoLibrary]);
  unsigned int v6 = objc_msgSend(v5, "mad_useVUGallery");

  if (v6)
  {
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(-[GDVUVisualUnderstandingService gallery](self->_vuService, "gallery"));
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue( +[MADPhotosFaceAssetProcessingTask taskWithAnalysisDatabase:andGallery:]( &OBJC_CLASS___MADPhotosFaceAssetProcessingTask,  "taskWithAnalysisDatabase:andGallery:",  v4,  v7));
  }

  else
  {
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue( +[MADPhotosFaceAssetProcessingTask taskWithAnalysisDatabase:andFaceClusterer:]( &OBJC_CLASS___MADPhotosFaceAssetProcessingTask,  "taskWithAnalysisDatabase:andFaceClusterer:",  v4,  self->_faceClusterer));
  }

  return v8;
}

- (id)assetPriorities
{
  return &off_1001C9438;
}

- (id)nextAssetProcessingTask
{
  id v3 = -[PHPhotoLibrary countOfUnprocessedFaceCrops](self->_photoLibrary, "countOfUnprocessedFaceCrops");
  if (v3 == (id)self->_previousCountOfUnprocessedFaceCrops)
  {
    v24.receiver = self;
    v24.super_class = (Class)&OBJC_CLASS___MADPhotosFaceTaskProvider;
    id v5 = -[MADPhotosTaskProvider nextAssetProcessingTask](&v24, "nextAssetProcessingTask");
    unsigned int v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
    managementQueue = (dispatch_queue_s *)self->_managementQueue;
    v22[0] = _NSConcreteStackBlock;
    v22[1] = 3221225472LL;
    v22[2] = sub_1001261B0;
    v22[3] = &unk_1001B9E00;
    v22[4] = self;
    id v8 = v6;
    id v23 = v8;
    dispatch_sync(managementQueue, v22);
    uint64_t v9 = v23;
    id v10 = v8;

    return v10;
  }

  else
  {
    self->_previousCountOfUnprocessedFaceCrops = (unint64_t)v3;
    uint64_t v12 = MediaAnalysisLogLevel(v3, v4);
    if ((int)v12 >= 6)
    {
      uint64_t v14 = VCPLogInstance(v12, v13);
      unsigned __int8 v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
      os_log_type_t v16 = VCPLogToOSLogType[6];
      if (os_log_type_enabled(v15, v16))
      {
        logPrefix = self->_logPrefix;
        *(_DWORD *)buf = 138412290;
        uint64_t v26 = logPrefix;
        _os_log_impl((void *)&_mh_execute_header, v15, v16, "%@ Scheduling face crop processing task", buf, 0xCu);
      }
    }

    unsigned int v18 = -[PHPhotoLibrary mad_useVUGallery](self->_photoLibrary, "mad_useVUGallery");
    photoLibrary = self->_photoLibrary;
    if (v18)
    {
      uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue(-[GDVUVisualUnderstandingService gallery](self->_vuService, "gallery"));
      v21 = (void *)objc_claimAutoreleasedReturnValue( +[MADPhotosFaceCropProcessingTask taskWithPhotoLibrary:andGallery:]( &OBJC_CLASS___MADPhotosFaceCropProcessingTask,  "taskWithPhotoLibrary:andGallery:",  photoLibrary,  v20));

      return v21;
    }

    else
    {
      return (id)objc_claimAutoreleasedReturnValue( +[MADPhotosFaceCropProcessingTask taskWithPhotoLibrary:andFaceClusterer:]( &OBJC_CLASS___MADPhotosFaceCropProcessingTask,  "taskWithPhotoLibrary:andFaceClusterer:",  self->_photoLibrary,  self->_faceClusterer));
    }
  }

- (id)nextDownloadAssetProcessingTask
{
  v12.receiver = self;
  v12.super_class = (Class)&OBJC_CLASS___MADPhotosFaceTaskProvider;
  id v3 = -[MADPhotosTaskProvider nextDownloadAssetProcessingTask](&v12, "nextDownloadAssetProcessingTask");
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  managementQueue = (dispatch_queue_s *)self->_managementQueue;
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472LL;
  v10[2] = sub_100126358;
  v10[3] = &unk_1001B9E00;
  v10[4] = self;
  id v6 = v4;
  id v11 = v6;
  dispatch_sync(managementQueue, v10);
  uint64_t v7 = v11;
  id v8 = v6;

  return v8;
}

- (id)nextClusterProcessingTask
{
  uint64_t v6 = 0LL;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x3032000000LL;
  uint64_t v9 = sub_100126508;
  id v10 = sub_100126518;
  id v11 = 0LL;
  managementQueue = (dispatch_queue_s *)self->_managementQueue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_100126520;
  v5[3] = &unk_1001BD4A8;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(managementQueue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

- (void)retireTask:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)&OBJC_CLASS___MADPhotosFaceTaskProvider;
  -[MADPhotosTaskProvider retireTask:](&v10, "retireTask:", v4);
  managementQueue = (dispatch_queue_s *)self->_managementQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_1001268B8;
  v7[3] = &unk_1001B9E00;
  id v8 = v4;
  uint64_t v9 = self;
  id v6 = v4;
  dispatch_sync(managementQueue, v7);
}

- (void).cxx_destruct
{
}

@end