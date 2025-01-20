@interface MADDatabaseRestoreFastPassBackgroundSystemTask
+ (id)featureCodes;
+ (id)identifier;
+ (id)processingTaskIdentifiers;
- (id)processingTaskWithCancelBlock:(id)a3 progressHandler:(id)a4 completionHandler:(id)a5;
@end

@implementation MADDatabaseRestoreFastPassBackgroundSystemTask

+ (id)identifier
{
  return @"com.apple.mediaanalysisd.photos.maintenance.fastpass";
}

+ (id)processingTaskIdentifiers
{
  return &off_1001C9450;
}

+ (id)featureCodes
{
  return &off_1001C9468;
}

- (id)processingTaskWithCancelBlock:(id)a3 progressHandler:(id)a4 completionHandler:(id)a5
{
  return (id)objc_claimAutoreleasedReturnValue( +[MADDatabaseRestoreFastPassProcessingTask taskWithCancelBlock:progressHandler:andCompletionHandler:]( &OBJC_CLASS___MADDatabaseRestoreFastPassProcessingTask,  "taskWithCancelBlock:progressHandler:andCompletionHandler:",  a3,  a4,  a5));
}

@end