@interface MADPhotosSceneFastPassBackgroundSystemTask
+ (id)featureCodes;
+ (id)identifier;
+ (id)processingTaskIdentifiers;
+ (id)producedResultIdentifiers;
- (id)processingTaskWithCancelBlock:(id)a3 progressHandler:(id)a4 completionHandler:(id)a5;
@end

@implementation MADPhotosSceneFastPassBackgroundSystemTask

+ (id)identifier
{
  return @"com.apple.mediaanalysisd.photos.scene.fastpass";
}

+ (id)processingTaskIdentifiers
{
  return &off_1001C93F0;
}

+ (id)featureCodes
{
  return &off_1001C9408;
}

+ (id)producedResultIdentifiers
{
  return +[NSSet setWithObject:]( &OBJC_CLASS___NSSet,  "setWithObject:",  @"com.apple.mediaanalysisd.photos.scene.results");
}

- (id)processingTaskWithCancelBlock:(id)a3 progressHandler:(id)a4 completionHandler:(id)a5
{
  return (id)objc_claimAutoreleasedReturnValue( +[MADPhotosSceneFastPassProcessingTask taskWithCancelBlock:progressHandler:andCompletionHandler:]( &OBJC_CLASS___MADPhotosSceneFastPassProcessingTask,  "taskWithCancelBlock:progressHandler:andCompletionHandler:",  a3,  a4,  a5));
}

@end