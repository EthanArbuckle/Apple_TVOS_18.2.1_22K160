@interface MADFullAssetBatch
- (MADFullAssetBatch)initWithPhotoLibrary:(id)a3 database:(id)a4 cancelBlock:(id)a5;
- (int)prepare;
- (int)process;
- (int)publish;
- (unint64_t)count;
- (void)addPhotosAsset:(id)a3 withPreviousStatus:(unint64_t)a4 attempts:(unint64_t)a5 andAttemptDate:(id)a6;
@end

@implementation MADFullAssetBatch

- (MADFullAssetBatch)initWithPhotoLibrary:(id)a3 database:(id)a4 cancelBlock:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v16.receiver = self;
  v16.super_class = (Class)&OBJC_CLASS___MADFullAssetBatch;
  v11 = -[MADFullAssetBatch init](&v16, "init");
  if (v11)
  {
    LOBYTE(v15) = 0;
    uint64_t v12 = objc_claimAutoreleasedReturnValue( +[MADPhotosFullAssetProcessingTask taskWithAnalysisDatabase:photoLibrary:progressReporter:mediaType:mediaSubtype:imageOnlyAnalysis:downloadAllowed:]( &OBJC_CLASS___MADPhotosFullAssetProcessingTask,  "taskWithAnalysisDatabase:photoLibrary:progressReporter:mediaType:mediaSubtype:imageOnlyAnalysis:downloadAllowed:",  v9,  v8,  0LL,  1LL,  0LL,  1LL,  v15));
    task = v11->_task;
    v11->_task = (MADPhotosFullAssetProcessingTask *)v12;

    -[MADProcessingTask setCancelBlock:](v11->_task, "setCancelBlock:", v10);
  }

  return v11;
}

- (unint64_t)count
{
  return -[MADPhotosFullAssetProcessingTask count](self->_task, "count");
}

- (void)addPhotosAsset:(id)a3 withPreviousStatus:(unint64_t)a4 attempts:(unint64_t)a5 andAttemptDate:(id)a6
{
}

- (int)prepare
{
  return -[MADPhotosFullAssetProcessingTask status](self->_task, "status");
}

- (int)process
{
  return -[MADPhotosFullAssetProcessingTask status](self->_task, "status");
}

- (int)publish
{
  return -[MADPhotosFullAssetProcessingTask status](self->_task, "status");
}

- (void).cxx_destruct
{
}

@end