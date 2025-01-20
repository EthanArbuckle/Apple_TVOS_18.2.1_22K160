@interface VCPRequestClusterCacheValidationTask
+ (id)taskWithPhotoLibraryURL:(id)a3 andProgressHandler:(id)a4 andReply:(id)a5;
- (BOOL)autoCancellable;
- (BOOL)isCanceled;
- (VCPRequestClusterCacheValidationTask)initWithPhotoLibraryURL:(id)a3 andProgressHandler:(id)a4 andReply:(id)a5;
- (float)resourceRequirement;
- (id)cancelBlock;
- (int)run;
- (void)cancel;
- (void)dealloc;
- (void)setCancelBlock:(id)a3;
@end

@implementation VCPRequestClusterCacheValidationTask

- (VCPRequestClusterCacheValidationTask)initWithPhotoLibraryURL:(id)a3 andProgressHandler:(id)a4 andReply:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  v15.receiver = self;
  v15.super_class = (Class)&OBJC_CLASS___VCPRequestClusterCacheValidationTask;
  v10 = -[VCPRequestClusterCacheValidationTask init](&v15, "init");
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_photoLibraryURL, a3);
    id v12 = objc_retainBlock(v9);
    id reply = v11->_reply;
    v11->_id reply = v12;
  }

  return v11;
}

+ (id)taskWithPhotoLibraryURL:(id)a3 andProgressHandler:(id)a4 andReply:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = [objc_alloc((Class)objc_opt_class(a1)) initWithPhotoLibraryURL:v8 andProgressHandler:v9 andReply:v10];

  return v11;
}

- (void)dealloc
{
  unsigned __int8 v3 = atomic_load((unsigned __int8 *)&self->_started);
  if ((v3 & 1) == 0)
  {
    id reply = (void (**)(id, void, void *))self->_reply;
    NSErrorUserInfoKey v12 = NSLocalizedDescriptionKey;
    v5 = (objc_class *)objc_opt_class(self);
    v6 = NSStringFromClass(v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
    id v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%@ canceled", v7));
    v13 = v8;
    id v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v13,  &v12,  1LL));
    id v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  NSOSStatusErrorDomain,  -128LL,  v9));
    reply[2](reply, 0LL, v10);
  }

  v11.receiver = self;
  v11.super_class = (Class)&OBJC_CLASS___VCPRequestClusterCacheValidationTask;
  -[VCPRequestClusterCacheValidationTask dealloc](&v11, "dealloc");
}

- (float)resourceRequirement
{
  return 1.0;
}

- (void)cancel
{
}

- (BOOL)isCanceled
{
  unsigned __int8 v2 = atomic_load((unsigned __int8 *)&self->_cancel);
  if ((v2 & 1) != 0)
  {
    LOBYTE(cancelBlock) = 1;
  }

  else
  {
    cancelBlock = (uint64_t (**)(void))self->_cancelBlock;
    if (cancelBlock) {
      LOBYTE(cancelBlock) = cancelBlock[2]();
    }
  }

  return (char)cancelBlock;
}

- (int)run
{
  unsigned __int8 v3 = (void *)objc_claimAutoreleasedReturnValue(+[VCPPhotoLibraryManager sharedManager](&OBJC_CLASS___VCPPhotoLibraryManager, "sharedManager"));
  v4 = (void *)objc_claimAutoreleasedReturnValue([v3 photoLibraryWithURL:self->_photoLibraryURL]);

  if (v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue( +[VCPPhotosFaceProcessingContext contextWithPhotoLibrary:]( &OBJC_CLASS___VCPPhotosFaceProcessingContext,  "contextWithPhotoLibrary:",  v4));
    v6 = (void *)objc_claimAutoreleasedReturnValue( +[VCPFaceProcessingServiceWorker workerWithPhotoLibrary:andContext:]( &OBJC_CLASS___VCPFaceProcessingServiceWorker,  "workerWithPhotoLibrary:andContext:",  v4,  v5));
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472LL;
    v12[2] = sub_10010C284;
    v12[3] = &unk_1001B9E98;
    v12[4] = self;
    v7 = objc_retainBlock(v12);
    [v6 validateClusterCacheWithContext:&__NSDictionary0__struct cancelOrExtendTimeoutBlock:v7 reply:self->_reply];

    int v8 = 0;
  }

  else
  {
    id reply = (void (**)(id, void, void *))self->_reply;
    NSErrorUserInfoKey v13 = NSLocalizedDescriptionKey;
    v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Failed to find client specified Photos Library (%@)",  self->_photoLibraryURL));
    v14 = v5;
    v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v14,  &v13,  1LL));
    id v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  NSOSStatusErrorDomain,  -50LL,  v6));
    reply[2](reply, 0LL, v10);

    int v8 = -50;
  }

  return v8;
}

- (BOOL)autoCancellable
{
  return 0;
}

- (id)cancelBlock
{
  return self->_cancelBlock;
}

- (void)setCancelBlock:(id)a3
{
}

- (void).cxx_destruct
{
}

@end