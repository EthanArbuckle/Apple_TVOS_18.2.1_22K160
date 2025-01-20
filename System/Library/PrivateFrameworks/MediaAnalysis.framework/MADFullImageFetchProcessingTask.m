@interface MADFullImageFetchProcessingTask
+ (NSString)name;
+ (unint64_t)taskID;
- (BOOL)shouldProcessAsset:(id)a3;
- (MADFullImageFetchProcessingTask)initWithFetchBlock:(id)a3 photoLibraryWithURL:(id)a4 cancelBlock:(id)a5 progressHandler:(id)a6 completionHandler:(id)a7;
- (id)batchWithAnalysisDatabase:(id)a3 allowDownload:(BOOL)a4 cancelBlock:(id)a5;
- (void)dealloc;
@end

@implementation MADFullImageFetchProcessingTask

- (MADFullImageFetchProcessingTask)initWithFetchBlock:(id)a3 photoLibraryWithURL:(id)a4 cancelBlock:(id)a5 progressHandler:(id)a6 completionHandler:(id)a7
{
  id v12 = a4;
  v18.receiver = self;
  v18.super_class = (Class)&OBJC_CLASS___MADFullImageFetchProcessingTask;
  v13 = -[VCPMADPhotosFetchProcessingTask initWithFetchBlock:photoLibraryWithURL:cancelBlock:progressHandler:completionHandler:]( &v18,  "initWithFetchBlock:photoLibraryWithURL:cancelBlock:progressHandler:completionHandler:",  a3,  v12,  a5,  a6,  a7);
  if (v13)
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[VCPPhotoLibraryManager sharedManager](&OBJC_CLASS___VCPPhotoLibraryManager, "sharedManager"));
    uint64_t v15 = objc_claimAutoreleasedReturnValue([v14 photoLibraryWithURL:v12]);
    v16 = *(void **)(v13 + 52);
    *(void *)(v13 + 52) = v15;
  }

  return (MADFullImageFetchProcessingTask *)v13;
}

- (void)dealloc
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[VNSession globalSession](&OBJC_CLASS___VNSession, "globalSession"));
  [v3 releaseCachedResources];

  MediaAnalysisPurgeResources();
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___MADFullImageFetchProcessingTask;
  -[MADFullImageFetchProcessingTask dealloc](&v4, "dealloc");
}

+ (NSString)name
{
  return (NSString *)@"Full|Image";
}

+ (unint64_t)taskID
{
  return 1LL;
}

- (BOOL)shouldProcessAsset:(id)a3
{
  id v3 = a3;
  else {
    unsigned __int8 v4 = 0;
  }

  return v4;
}

- (id)batchWithAnalysisDatabase:(id)a3 allowDownload:(BOOL)a4 cancelBlock:(id)a5
{
  id v7 = a5;
  id v8 = a3;
  v9 = -[MADFullAssetBatch initWithPhotoLibrary:database:cancelBlock:]( objc_alloc(&OBJC_CLASS___MADFullAssetBatch),  "initWithPhotoLibrary:database:cancelBlock:",  *(id *)((char *)&self->super._progressHandler + 4),  v8,  v7);

  return v9;
}

- (void).cxx_destruct
{
}

@end