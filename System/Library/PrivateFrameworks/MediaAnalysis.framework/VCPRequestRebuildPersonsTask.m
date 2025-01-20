@interface VCPRequestRebuildPersonsTask
+ (id)taskWithLocalIdentifiers:(id)a3 andPhotoLibraryURL:(id)a4 andProgressHandler:(id)a5 andReply:(id)a6;
- (BOOL)autoCancellable;
- (BOOL)isCanceled;
- (VCPRequestRebuildPersonsTask)initWithLocalIdentifiers:(id)a3 andPhotoLibraryURL:(id)a4 andProgressHandler:(id)a5 andReply:(id)a6;
- (float)resourceRequirement;
- (id)cancelBlock;
- (int)run;
- (void)cancel;
- (void)dealloc;
- (void)setCancelBlock:(id)a3;
@end

@implementation VCPRequestRebuildPersonsTask

- (VCPRequestRebuildPersonsTask)initWithLocalIdentifiers:(id)a3 andPhotoLibraryURL:(id)a4 andProgressHandler:(id)a5 andReply:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  v18.receiver = self;
  v18.super_class = (Class)&OBJC_CLASS___VCPRequestRebuildPersonsTask;
  v13 = -[VCPRequestRebuildPersonsTask init](&v18, "init");
  v14 = v13;
  if (v13)
  {
    objc_storeStrong((id *)&v13->_personLocalIdentifiers, a3);
    objc_storeStrong((id *)&v14->_photoLibraryURL, a4);
    id v15 = objc_retainBlock(v12);
    id reply = v14->_reply;
    v14->_id reply = v15;
  }

  return v14;
}

+ (id)taskWithLocalIdentifiers:(id)a3 andPhotoLibraryURL:(id)a4 andProgressHandler:(id)a5 andReply:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  id v14 = [objc_alloc((Class)objc_opt_class(a1)) initWithLocalIdentifiers:v10 andPhotoLibraryURL:v11 andProgressHandler:v12 andReply:v13];

  return v14;
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
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%@ canceled", v7));
    id v13 = v8;
    v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v13,  &v12,  1LL));
    id v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  NSOSStatusErrorDomain,  -128LL,  v9));
    reply[2](reply, 0LL, v10);
  }

  v11.receiver = self;
  v11.super_class = (Class)&OBJC_CLASS___VCPRequestRebuildPersonsTask;
  -[VCPRequestRebuildPersonsTask dealloc](&v11, "dealloc");
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
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
    if (-[NSArray count](self->_personLocalIdentifiers, "count")) {
      [v5 setObject:self->_personLocalIdentifiers forKeyedSubscript:VCPMediaAnalysisServiceRebuildPersonWithLocalIdentifierKey];
    }
    v6 = (void *)objc_claimAutoreleasedReturnValue( +[VCPPhotosFaceProcessingContext contextWithPhotoLibrary:]( &OBJC_CLASS___VCPPhotosFaceProcessingContext,  "contextWithPhotoLibrary:",  v4));
    v7 = (void *)objc_claimAutoreleasedReturnValue( +[VCPFaceProcessingServiceWorker workerWithPhotoLibrary:andContext:]( &OBJC_CLASS___VCPFaceProcessingServiceWorker,  "workerWithPhotoLibrary:andContext:",  v4,  v6));
    id reply = self->_reply;
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472LL;
    v12[2] = sub_10010DB18;
    v12[3] = &unk_1001B9E98;
    v12[4] = self;
    [v7 rebuildPersonsWithContext:v5 reply:reply extendTimeout:&stru_1001BDB50 cancel:v12];
    int v9 = 0;
  }

  else
  {
    id v10 = (void (**)(id, void, void *))self->_reply;
    NSErrorUserInfoKey v13 = NSLocalizedDescriptionKey;
    v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Failed to find client specified Photos Library (%@)",  self->_photoLibraryURL));
    id v14 = v5;
    v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v14,  &v13,  1LL));
    v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  NSOSStatusErrorDomain,  -50LL,  v6));
    v10[2](v10, 0LL, v7);
    int v9 = -50;
  }

  return v9;
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