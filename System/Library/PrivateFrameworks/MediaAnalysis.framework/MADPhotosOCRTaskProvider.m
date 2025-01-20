@interface MADPhotosOCRTaskProvider
+ (id)name;
+ (unint64_t)taskID;
- (id)assetPriorities;
- (id)assetTaskWithAnalysisDatabase:(id)a3;
- (void)dealloc;
@end

@implementation MADPhotosOCRTaskProvider

+ (id)name
{
  return @"OCR";
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
  v4.super_class = (Class)&OBJC_CLASS___MADPhotosOCRTaskProvider;
  -[MADPhotosOCRTaskProvider dealloc](&v4, "dealloc");
}

- (id)assetTaskWithAnalysisDatabase:(id)a3
{
  return +[MADPhotosOCRAssetProcessingTask taskWithAnalysisDatabase:]( &OBJC_CLASS___MADPhotosOCRAssetProcessingTask,  "taskWithAnalysisDatabase:",  a3);
}

- (id)assetPriorities
{
  return &off_1001C9420;
}

@end