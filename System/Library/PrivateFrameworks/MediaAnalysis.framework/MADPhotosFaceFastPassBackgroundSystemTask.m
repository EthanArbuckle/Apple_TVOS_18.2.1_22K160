@interface MADPhotosFaceFastPassBackgroundSystemTask
+ (id)featureCodes;
+ (id)identifier;
+ (id)processingTaskIdentifiers;
+ (id)producedResultIdentifiers;
- (id)processingTaskWithCancelBlock:(id)a3 progressHandler:(id)a4 completionHandler:(id)a5;
@end

@implementation MADPhotosFaceFastPassBackgroundSystemTask

+ (id)identifier
{
  return @"com.apple.mediaanalysisd.photos.face.fastpass";
}

+ (id)processingTaskIdentifiers
{
  return &off_1001C9300;
}

+ (id)featureCodes
{
  return &off_1001C9318;
}

+ (id)producedResultIdentifiers
{
  return +[NSSet setWithObject:]( &OBJC_CLASS___NSSet,  "setWithObject:",  @"com.apple.mediaanalysisd.photos.face.results");
}

- (id)processingTaskWithCancelBlock:(id)a3 progressHandler:(id)a4 completionHandler:(id)a5
{
  return (id)objc_claimAutoreleasedReturnValue( +[MADPhotosFaceFastPassProcessingTask taskWithCancelBlock:progressHandler:andCompletionHandler:]( &OBJC_CLASS___MADPhotosFaceFastPassProcessingTask,  "taskWithCancelBlock:progressHandler:andCompletionHandler:",  a3,  a4,  a5));
}

@end