@interface MADPhotosFaceBackgroundSystemTask
+ (BOOL)enabledByDefault;
+ (NSString)identifier;
+ (double)expectedDuration;
+ (id)sharedTask;
+ (id)taskWithPhotoLibraries:(id)a3 cancelBlock:(id)a4 progressHandler:(id)a5 andCompletionHandler:(id)a6;
+ (unint64_t)taskID;
@end

@implementation MADPhotosFaceBackgroundSystemTask

+ (id)sharedTask
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10012080C;
  block[3] = &unk_1001B9958;
  block[4] = a1;
  if (qword_1001E6708 != -1) {
    dispatch_once(&qword_1001E6708, block);
  }
  return (id)qword_1001E6700;
}

+ (NSString)identifier
{
  return (NSString *)@"com.apple.mediaanalysisd.photos.face";
}

+ (BOOL)enabledByDefault
{
  return 1;
}

+ (unint64_t)taskID
{
  return 3LL;
}

+ (double)expectedDuration
{
  return 7200.0;
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
    v19 = &__kCFBooleanFalse;
    v13 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v19,  &v18,  1LL));
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472LL;
    v16[2] = sub_100120A08;
    v16[3] = &unk_1001BC548;
    id v17 = v11;
    v14 = (void *)objc_claimAutoreleasedReturnValue( +[MADUnifiedProcessingTask taskWithCancelBlock:options:progressHandler:andCompletionHandler:]( &OBJC_CLASS___MADUnifiedProcessingTask,  "taskWithCancelBlock:options:progressHandler:andCompletionHandler:",  v10,  v13,  v16,  v12));
  }

  else
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue( +[VCPFaceLibraryProcessingTask taskWithPhotoLibraries:andOptions:andProgressHandler:andCompletionHandler:andCancelBlock:]( &OBJC_CLASS___VCPFaceLibraryProcessingTask,  "taskWithPhotoLibraries:andOptions:andProgressHandler:andCompletionHandler:andCancelBlock:",  v9,  0LL,  v11,  v12,  v10));
  }

  return v14;
}

@end