@interface VCPFaceProcessingBatchContext
+ (id)batchContextWithPhotoLibrary:(id)a3 clusterer:(id)a4 andContext:(id)a5;
- (BOOL)downloadTimedout;
- (BOOL)hasPanorama;
- (NSDate)lastestDownloadTimestamp;
- (NSMutableDictionary)downloadRequests;
- (NSMutableDictionary)processingStatusMap;
- (NSMutableSet)completedLocalIdentifiersFromComputeSync;
- (NSMutableSet)processedAssets;
- (NSMutableSet)unprocessedAssets;
- (VCPFaceProcessingBatchContext)initWithPhotoLibrary:(id)a3 clusterer:(id)a4 andContext:(id)a5;
- (VCPFaceProcessingChangeBatch)changeBatch;
- (id)resourceForLocalIdentifier:(id)a3;
- (void)setChangeBatch:(id)a3;
- (void)setCompletedLocalIdentifiersFromComputeSync:(id)a3;
- (void)setDownloadRequests:(id)a3;
- (void)setHasPanorama:(BOOL)a3;
- (void)setLastestDownloadTimestamp:(id)a3;
- (void)setProcessedAssets:(id)a3;
- (void)setProcessingStatusMap:(id)a3;
- (void)setUnprocessedAssets:(id)a3;
- (void)storeResource:(id)a3 resourceURL:(id)a4 isBestResource:(BOOL)a5 requestDownload:(BOOL)a6 downloadStatus:(int)a7 forLocalIdentifier:(id)a8;
- (void)updateLastestDownloadTimestamp;
@end

@implementation VCPFaceProcessingBatchContext

- (VCPFaceProcessingBatchContext)initWithPhotoLibrary:(id)a3 clusterer:(id)a4 andContext:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v31.receiver = self;
  v31.super_class = (Class)&OBJC_CLASS___VCPFaceProcessingBatchContext;
  v11 = -[VCPFaceProcessingBatchContext init](&v31, "init");
  if (v11)
  {
    uint64_t v12 = objc_claimAutoreleasedReturnValue(+[NSMutableSet set](&OBJC_CLASS___NSMutableSet, "set"));
    processedAssets = v11->_processedAssets;
    v11->_processedAssets = (NSMutableSet *)v12;

    uint64_t v14 = objc_claimAutoreleasedReturnValue(+[NSMutableSet set](&OBJC_CLASS___NSMutableSet, "set"));
    unprocessedAssets = v11->_unprocessedAssets;
    v11->_unprocessedAssets = (NSMutableSet *)v14;

    uint64_t v16 = objc_claimAutoreleasedReturnValue(+[NSMutableSet set](&OBJC_CLASS___NSMutableSet, "set"));
    completedLocalIdentifiersFromComputeSync = v11->_completedLocalIdentifiersFromComputeSync;
    v11->_completedLocalIdentifiersFromComputeSync = (NSMutableSet *)v16;

    uint64_t v18 = objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
    downloadRequests = v11->_downloadRequests;
    v11->_downloadRequests = (NSMutableDictionary *)v18;

    uint64_t v20 = objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
    resources = v11->_resources;
    v11->_resources = (NSMutableDictionary *)v20;

    uint64_t v22 = objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
    processingStatusMap = v11->_processingStatusMap;
    v11->_processingStatusMap = (NSMutableDictionary *)v22;

    uint64_t v24 = objc_claimAutoreleasedReturnValue( +[VCPFaceProcessingChangeBatch batchForPhotoLibrary:faceClusterer:andContext:]( &OBJC_CLASS___VCPFaceProcessingChangeBatch,  "batchForPhotoLibrary:faceClusterer:andContext:",  v8,  v9,  v10));
    changeBatch = v11->_changeBatch;
    v11->_changeBatch = (VCPFaceProcessingChangeBatch *)v24;

    dispatch_queue_attr_t v26 = dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v27 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v26);
    dispatch_queue_t v28 = dispatch_queue_create("com.apple.mediaanalysis.batchContextManagementQueue", v27);
    managementQueue = v11->_managementQueue;
    v11->_managementQueue = (OS_dispatch_queue *)v28;

    v11->_timeout = 0;
  }

  return v11;
}

+ (id)batchContextWithPhotoLibrary:(id)a3 clusterer:(id)a4 andContext:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  id v10 = -[VCPFaceProcessingBatchContext initWithPhotoLibrary:clusterer:andContext:]( objc_alloc(&OBJC_CLASS___VCPFaceProcessingBatchContext),  "initWithPhotoLibrary:clusterer:andContext:",  v7,  v8,  v9);

  return v10;
}

- (id)resourceForLocalIdentifier:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0LL;
  v13 = &v12;
  uint64_t v14 = 0x3032000000LL;
  v15 = sub_1000AED68;
  uint64_t v16 = sub_1000AED78;
  id v17 = 0LL;
  managementQueue = (dispatch_queue_s *)self->_managementQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000AED80;
  block[3] = &unk_1001BBF78;
  id v10 = v4;
  v11 = &v12;
  block[4] = self;
  id v6 = v4;
  dispatch_sync(managementQueue, block);
  id v7 = (id)v13[5];

  _Block_object_dispose(&v12, 8);
  return v7;
}

- (void)storeResource:(id)a3 resourceURL:(id)a4 isBestResource:(BOOL)a5 requestDownload:(BOOL)a6 downloadStatus:(int)a7 forLocalIdentifier:(id)a8
{
  id v14 = a3;
  id v15 = a4;
  id v16 = a8;
  uint64_t v18 = v16;
  if (v16)
  {
    managementQueue = (dispatch_queue_s *)self->_managementQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_1000AEF68;
    block[3] = &unk_1001BCAC0;
    block[4] = self;
    id v26 = v16;
    id v27 = v14;
    id v28 = v15;
    BOOL v30 = a5;
    BOOL v31 = a6;
    int v29 = a7;
    dispatch_sync(managementQueue, block);
  }

  else
  {
    uint64_t v20 = MediaAnalysisLogLevel(0LL, v17);
    if ((int)v20 >= 3)
    {
      uint64_t v22 = VCPLogInstance(v20, v21);
      v23 = (os_log_s *)objc_claimAutoreleasedReturnValue(v22);
      os_log_type_t v24 = VCPLogToOSLogType[3];
      if (os_log_type_enabled(v23, v24))
      {
        *(_DWORD *)buf = 138412290;
        uint64_t v33 = 0LL;
        _os_log_impl( (void *)&_mh_execute_header,  v23,  v24,  "[VCPFaceProcessingBatchContext] Nil asset localIdentifier %@",  buf,  0xCu);
      }
    }
  }
}

- (void)updateLastestDownloadTimestamp
{
  managementQueue = (dispatch_queue_s *)self->_managementQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000AF030;
  block[3] = &unk_1001BA0C8;
  block[4] = self;
  dispatch_sync(managementQueue, block);
}

- (BOOL)downloadTimedout
{
  managementQueue = (dispatch_queue_s *)self->_managementQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000AF17C;
  block[3] = &unk_1001BA0C8;
  block[4] = self;
  dispatch_sync(managementQueue, block);
  return self->_timeout;
}

- (NSMutableSet)processedAssets
{
  return self->_processedAssets;
}

- (void)setProcessedAssets:(id)a3
{
}

- (NSMutableSet)unprocessedAssets
{
  return self->_unprocessedAssets;
}

- (void)setUnprocessedAssets:(id)a3
{
}

- (NSMutableSet)completedLocalIdentifiersFromComputeSync
{
  return self->_completedLocalIdentifiersFromComputeSync;
}

- (void)setCompletedLocalIdentifiersFromComputeSync:(id)a3
{
}

- (NSMutableDictionary)downloadRequests
{
  return self->_downloadRequests;
}

- (void)setDownloadRequests:(id)a3
{
}

- (NSMutableDictionary)processingStatusMap
{
  return self->_processingStatusMap;
}

- (void)setProcessingStatusMap:(id)a3
{
}

- (VCPFaceProcessingChangeBatch)changeBatch
{
  return self->_changeBatch;
}

- (void)setChangeBatch:(id)a3
{
}

- (BOOL)hasPanorama
{
  return self->_hasPanorama;
}

- (void)setHasPanorama:(BOOL)a3
{
  self->_hasPanorama = a3;
}

- (NSDate)lastestDownloadTimestamp
{
  return self->_lastestDownloadTimestamp;
}

- (void)setLastestDownloadTimestamp:(id)a3
{
}

- (void).cxx_destruct
{
}

@end