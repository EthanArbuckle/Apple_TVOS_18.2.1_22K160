@interface VCPMADSceneFetchProcessingTask
+ (NSString)name;
+ (unint64_t)taskID;
- (BOOL)run:(id *)a3;
- (BOOL)shouldProcessAsset:(id)a3;
- (VCPMADSceneFetchProcessingTask)initWithFetchBlock:(id)a3 photoLibraryWithURL:(id)a4 cancelBlock:(id)a5 progressHandler:(id)a6 completionHandler:(id)a7;
- (id)batchWithAnalysisDatabase:(id)a3 allowDownload:(BOOL)a4 cancelBlock:(id)a5;
- (void)dealloc;
@end

@implementation VCPMADSceneFetchProcessingTask

- (VCPMADSceneFetchProcessingTask)initWithFetchBlock:(id)a3 photoLibraryWithURL:(id)a4 cancelBlock:(id)a5 progressHandler:(id)a6 completionHandler:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  v65.receiver = self;
  v65.super_class = (Class)&OBJC_CLASS___VCPMADSceneFetchProcessingTask;
  v17 = -[VCPMADPhotosFetchProcessingTask initWithFetchBlock:photoLibraryWithURL:cancelBlock:progressHandler:completionHandler:]( &v65,  "initWithFetchBlock:photoLibraryWithURL:cancelBlock:progressHandler:completionHandler:",  v12,  v13,  v14,  v15,  v16);
  v18 = v17;
  if (!v17) {
    goto LABEL_8;
  }
  +[VCPPreAnalysisRequests asyncCacheRequestIdealDimension]( &OBJC_CLASS___VCPPreAnalysisRequests,  "asyncCacheRequestIdealDimension");
  +[VCPPreAnalysisRequests asyncLoadSharedPhotoFormatsObjects]( &OBJC_CLASS___VCPPreAnalysisRequests,  "asyncLoadSharedPhotoFormatsObjects");
  v19 = objc_alloc(&OBJC_CLASS___VCPPoolBasedPixelBufferCreator);
  v20 = -[VCPPoolBasedPixelBufferCreator initWithBufferWidth:bufferHeight:andPixelFormat:]( v19,  "initWithBufferWidth:bufferHeight:andPixelFormat:",  kVCPMAPreAnalysisScaledSize,  kVCPMAPreAnalysisScaledSize,  1278226488LL);
  v21 = *(void **)(v17 + 52);
  *(void *)(v17 + 52) = v20;

  if (!*(void *)(v17 + 52))
  {
    if ((int)MediaAnalysisLogLevel(v22, v23) < 3)
    {
LABEL_25:
      v44 = 0LL;
      goto LABEL_26;
    }

    uint64_t v45 = VCPLogInstance();
    v46 = (os_log_s *)objc_claimAutoreleasedReturnValue(v45);
    os_log_type_t v47 = VCPLogToOSLogType[3];
    if (os_log_type_enabled(v46, v47))
    {
      uint64_t v48 = objc_opt_class(v18);
      *(_DWORD *)buf = 138412290;
      uint64_t v67 = v48;
      _os_log_impl( (void *)&_mh_execute_header,  v46,  v47,  "[%@] Failed to create VCPPoolBasedPixelBufferCreator for monochrome",  buf,  0xCu);
    }

- (void)dealloc
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[VNSession globalSession](&OBJC_CLASS___VNSession, "globalSession"));
  [v3 releaseCachedResources];

  MediaAnalysisPurgeResources();
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___VCPMADSceneFetchProcessingTask;
  -[VCPMADSceneFetchProcessingTask dealloc](&v4, "dealloc");
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

- (BOOL)run:(id *)a3
{
  if ((+[PFSceneTaxonomy mad_isExpectedTaxonomy](&OBJC_CLASS___PFSceneTaxonomy, "mad_isExpectedTaxonomy") & 1) != 0)
  {
    v12.receiver = self;
    v12.super_class = (Class)&OBJC_CLASS___VCPMADSceneFetchProcessingTask;
    return -[VCPMADPhotosFetchProcessingTask run:](&v12, "run:", a3);
  }

  else
  {
    NSErrorUserInfoKey v13 = NSLocalizedDescriptionKey;
    v6 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"[%@] MAD tracked taxonomy identifier is not the latest in Photos; skip scene processing",
           objc_opt_class(self));
    v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
    id v14 = v7;
    v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v14,  &v13,  1LL));
    v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  NSOSStatusErrorDomain,  -18LL,  v8));
    id v10 = *a3;
    *a3 = v9;

    v11 = (void (**)(void, void, void))objc_claimAutoreleasedReturnValue( -[VCPMADSceneFetchProcessingTask completionHandler]( self,  "completionHandler"));
    ((void (**)(void, void, id))v11)[2](v11, 0LL, *a3);

    return 0;
  }

- (void).cxx_destruct
{
}

@end