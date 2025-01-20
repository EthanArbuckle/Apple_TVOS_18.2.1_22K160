@interface MADPhotosFullBackgroundSystemTask
+ (BOOL)enabledByDefault;
+ (NSString)identifier;
+ (id)sharedTask;
+ (id)taskWithPhotoLibraries:(id)a3 cancelBlock:(id)a4 progressHandler:(id)a5 andCompletionHandler:(id)a6;
+ (unint64_t)taskID;
@end

@implementation MADPhotosFullBackgroundSystemTask

+ (id)sharedTask
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100078870;
  block[3] = &unk_1001B9958;
  block[4] = a1;
  if (qword_1001E6508 != -1) {
    dispatch_once(&qword_1001E6508, block);
  }
  return (id)qword_1001E6500;
}

+ (NSString)identifier
{
  return (NSString *)@"com.apple.mediaanalysisd.photos.full";
}

+ (BOOL)enabledByDefault
{
  return 1;
}

+ (unint64_t)taskID
{
  return 1LL;
}

+ (id)taskWithPhotoLibraries:(id)a3 cancelBlock:(id)a4 progressHandler:(id)a5 andCompletionHandler:(id)a6
{
  return (id)objc_claimAutoreleasedReturnValue( +[VCPLibraryProcessingTask taskWithPhotoLibraries:andOptions:andProgressHandler:andCompletionHandler:andCancelBlock:]( &OBJC_CLASS___VCPLibraryProcessingTask,  "taskWithPhotoLibraries:andOptions:andProgressHandler:andCompletionHandler:andCancelBlock:",  a3,  0LL,  a5,  a6,  a4));
}

@end