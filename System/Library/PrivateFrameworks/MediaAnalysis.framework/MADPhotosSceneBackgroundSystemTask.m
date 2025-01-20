@interface MADPhotosSceneBackgroundSystemTask
+ (BOOL)enabledByDefault;
+ (NSString)identifier;
+ (id)sharedTask;
+ (id)taskWithPhotoLibraries:(id)a3 cancelBlock:(id)a4 progressHandler:(id)a5 andCompletionHandler:(id)a6;
+ (unint64_t)taskID;
@end

@implementation MADPhotosSceneBackgroundSystemTask

+ (id)sharedTask
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100096634;
  block[3] = &unk_1001B9958;
  block[4] = a1;
  if (qword_1001E6528 != -1) {
    dispatch_once(&qword_1001E6528, block);
  }
  return (id)qword_1001E6520;
}

+ (NSString)identifier
{
  return (NSString *)@"com.apple.mediaanalysisd.photos.scene";
}

+ (BOOL)enabledByDefault
{
  return 1;
}

+ (unint64_t)taskID
{
  return 2LL;
}

+ (id)taskWithPhotoLibraries:(id)a3 cancelBlock:(id)a4 progressHandler:(id)a5 andCompletionHandler:(id)a6
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  if (VCPMADUnifiedBackgroundProcessing())
  {
    v18 = @"SkipSyncGallery";
    v19 = &__kCFBooleanTrue;
    v13 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v19,  &v18,  1LL));
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472LL;
    v16[2] = sub_100096820;
    v16[3] = &unk_1001BC548;
    id v17 = v11;
    v14 = (void *)objc_claimAutoreleasedReturnValue( +[MADUnifiedProcessingTask taskWithCancelBlock:options:progressHandler:andCompletionHandler:]( &OBJC_CLASS___MADUnifiedProcessingTask,  "taskWithCancelBlock:options:progressHandler:andCompletionHandler:",  v10,  v13,  v16,  v12));
  }

  else
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue( +[VCPMADSceneLibraryProcessingTask taskWithPhotoLibraries:cancelBlock:progressHandler:andCompletionHandler:]( &OBJC_CLASS___VCPMADSceneLibraryProcessingTask,  "taskWithPhotoLibraries:cancelBlock:progressHandler:andCompletionHandler:",  v9,  v10,  v11,  v12));
  }

  return v14;
}

@end