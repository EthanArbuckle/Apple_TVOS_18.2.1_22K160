@interface VCPMADQuickFaceIDAssetProcessingTask
+ (NSString)name;
+ (unint64_t)taskID;
- (BOOL)shouldProcessAsset:(id)a3;
- (VCPMADQuickFaceIDAssetProcessingTask)initWithLocalIdentifiers:(id)a3 fromPhotoLibraryWithURL:(id)a4 cancelBlock:(id)a5 progressHandler:(id)a6 completionHandler:(id)a7;
- (id)batchWithAnalysisDatabase:(id)a3 allowDownload:(BOOL)a4 cancelBlock:(id)a5;
@end

@implementation VCPMADQuickFaceIDAssetProcessingTask

- (VCPMADQuickFaceIDAssetProcessingTask)initWithLocalIdentifiers:(id)a3 fromPhotoLibraryWithURL:(id)a4 cancelBlock:(id)a5 progressHandler:(id)a6 completionHandler:(id)a7
{
  id v12 = a4;
  v35.receiver = self;
  v35.super_class = (Class)&OBJC_CLASS___VCPMADQuickFaceIDAssetProcessingTask;
  v13 = -[VCPMADPhotoAssetProcessingTask initWithLocalIdentifiers:fromPhotoLibraryWithURL:cancelBlock:progressHandler:completionHandler:]( &v35,  "initWithLocalIdentifiers:fromPhotoLibraryWithURL:cancelBlock:progressHandler:completionHandler:",  a3,  v12,  a5,  a6,  a7);
  if (!v13) {
    goto LABEL_5;
  }
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[VCPPhotoLibraryManager sharedManager](&OBJC_CLASS___VCPPhotoLibraryManager, "sharedManager"));
  v15 = (void *)objc_claimAutoreleasedReturnValue([v14 photoLibraryWithURL:v12]);

  if (!v15)
  {
    uint64_t v23 = MediaAnalysisLogLevel(v16, v17);
    if ((int)v23 >= 3)
    {
      uint64_t v25 = VCPLogInstance(v23, v24);
      v26 = (os_log_s *)objc_claimAutoreleasedReturnValue(v25);
      os_log_type_t v27 = VCPLogToOSLogType[3];
      if (os_log_type_enabled(v26, v27))
      {
        *(_DWORD *)buf = 138412290;
        id v37 = v12;
        _os_log_impl((void *)&_mh_execute_header, v26, v27, "Failed to open Photo Library %@", buf, 0xCu);
      }

      goto LABEL_12;
    }

+ (NSString)name
{
  return (NSString *)@"QuickFaceID";
}

+ (unint64_t)taskID
{
  return 8LL;
}

- (BOOL)shouldProcessAsset:(id)a3
{
  return objc_msgSend(a3, "vcp_quickFaceClassificationDone") ^ 1;
}

- (id)batchWithAnalysisDatabase:(id)a3 allowDownload:(BOOL)a4 cancelBlock:(id)a5
{
  return +[VCPMADQuickFaceIDAssetBatch batchWithAnalysisDatabase:quickFaceIDManager:cancelBlock:]( &OBJC_CLASS___VCPMADQuickFaceIDAssetBatch,  "batchWithAnalysisDatabase:quickFaceIDManager:cancelBlock:",  a3,  *(id *)((char *)&self->super._progressHandler + 4),  a5);
}

- (void).cxx_destruct
{
}

@end