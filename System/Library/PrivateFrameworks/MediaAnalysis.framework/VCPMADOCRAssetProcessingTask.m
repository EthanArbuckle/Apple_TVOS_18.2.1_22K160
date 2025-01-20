@interface VCPMADOCRAssetProcessingTask
+ (NSString)name;
+ (unint64_t)taskID;
- (BOOL)shouldProcessAsset:(id)a3;
- (id)batchWithAnalysisDatabase:(id)a3 allowDownload:(BOOL)a4 cancelBlock:(id)a5;
- (void)dealloc;
@end

@implementation VCPMADOCRAssetProcessingTask

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

  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___VCPMADOCRAssetProcessingTask;
  -[VCPMADOCRAssetProcessingTask dealloc](&v4, "dealloc");
}

- (BOOL)shouldProcessAsset:(id)a3
{
  return objc_msgSend(a3, "vcp_needsOCRProcessing");
}

- (id)batchWithAnalysisDatabase:(id)a3 allowDownload:(BOOL)a4 cancelBlock:(id)a5
{
  return +[VCPMADOCRAssetBatch batchWithAnalysisDatabase:allowDownload:cancelBlock:]( &OBJC_CLASS___VCPMADOCRAssetBatch,  "batchWithAnalysisDatabase:allowDownload:cancelBlock:",  a3,  a4,  a5);
}

@end