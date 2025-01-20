@interface VCPMADOCRLibraryProcessingTask
+ (NSString)name;
+ (id)taskWithPhotoLibraries:(id)a3 cancelBlock:(id)a4 progressHandler:(id)a5 andCompletionHandler:(id)a6;
+ (unint64_t)taskID;
- (BOOL)shouldProcessAsset:(id)a3;
- (id)assetPriorities;
- (id)batchWithAnalysisDatabase:(id)a3 allowDownload:(BOOL)a4 cancelBlock:(id)a5;
- (void)dealloc;
@end

@implementation VCPMADOCRLibraryProcessingTask

+ (id)taskWithPhotoLibraries:(id)a3 cancelBlock:(id)a4 progressHandler:(id)a5 andCompletionHandler:(id)a6
{
  id v10 = a6;
  id v11 = a5;
  id v12 = a4;
  id v13 = a3;
  id v14 = [objc_alloc((Class)objc_opt_class(a1)) initWithPhotoLibraries:v13 cancelBlock:v12 progressHandler:v11 andCompletionHandler:v10];

  return v14;
}

+ (NSString)name
{
  return (NSString *)@"OCR";
}

+ (unint64_t)taskID
{
  return 10LL;
}

- (void)dealloc
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[VNSession globalSession](&OBJC_CLASS___VNSession, "globalSession"));
  [v3 releaseCachedResources];

  +[PHAssetResourceManager vcp_flushFileCache](&OBJC_CLASS___PHAssetResourceManager, "vcp_flushFileCache");
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___VCPMADOCRLibraryProcessingTask;
  -[VCPMADOCRLibraryProcessingTask dealloc](&v4, "dealloc");
}

- (BOOL)shouldProcessAsset:(id)a3
{
  return objc_msgSend(a3, "vcp_needsOCRProcessing");
}

- (id)batchWithAnalysisDatabase:(id)a3 allowDownload:(BOOL)a4 cancelBlock:(id)a5
{
  return +[VCPMADOCRAssetBatch batchWithAnalysisDatabase:allowDownload:cancelBlock:]( &OBJC_CLASS___VCPMADOCRAssetBatch,  "batchWithAnalysisDatabase:allowDownload:cancelBlock:",  a3,  a4,  a5);
}

- (id)assetPriorities
{
  return &off_1001C9240;
}

@end