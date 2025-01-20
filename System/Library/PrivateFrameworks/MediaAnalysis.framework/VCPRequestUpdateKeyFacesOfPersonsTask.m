@interface VCPRequestUpdateKeyFacesOfPersonsTask
+ (id)taskWithLocalIdentifiers:(id)a3 andForceUpdate:(BOOL)a4 andPhotoLibraryURL:(id)a5 andProgressHandler:(id)a6 andReply:(id)a7;
- (BOOL)autoCancellable;
- (BOOL)isCanceled;
- (VCPRequestUpdateKeyFacesOfPersonsTask)initWithLocalIdentifiers:(id)a3 andForceUpdate:(BOOL)a4 andPhotoLibraryURL:(id)a5 andProgressHandler:(id)a6 andReply:(id)a7;
- (float)resourceRequirement;
- (id)cancelBlock;
- (int)run;
- (void)cancel;
- (void)dealloc;
- (void)setCancelBlock:(id)a3;
@end

@implementation VCPRequestUpdateKeyFacesOfPersonsTask

- (VCPRequestUpdateKeyFacesOfPersonsTask)initWithLocalIdentifiers:(id)a3 andForceUpdate:(BOOL)a4 andPhotoLibraryURL:(id)a5 andProgressHandler:(id)a6 andReply:(id)a7
{
  id v12 = a3;
  id v13 = a5;
  id v14 = a7;
  v20.receiver = self;
  v20.super_class = (Class)&OBJC_CLASS___VCPRequestUpdateKeyFacesOfPersonsTask;
  v15 = -[VCPRequestUpdateKeyFacesOfPersonsTask init](&v20, "init");
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_personLocalIdentifiers, a3);
    v16->_forceUpdate = a4;
    objc_storeStrong((id *)&v16->_photoLibraryURL, a5);
    id v17 = objc_retainBlock(v14);
    id reply = v16->_reply;
    v16->_id reply = v17;
  }

  return v16;
}

+ (id)taskWithLocalIdentifiers:(id)a3 andForceUpdate:(BOOL)a4 andPhotoLibraryURL:(id)a5 andProgressHandler:(id)a6 andReply:(id)a7
{
  BOOL v10 = a4;
  id v12 = a3;
  id v13 = a5;
  id v14 = a6;
  id v15 = a7;
  id v16 = [objc_alloc((Class)objc_opt_class(a1)) initWithLocalIdentifiers:v12 andForceUpdate:v10 andPhotoLibraryURL:v13 andProgressHandler:v14 andReply:v15];

  return v16;
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
    BOOL v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  NSOSStatusErrorDomain,  -128LL,  v9));
    reply[2](reply, 0LL, v10);
  }

  v11.receiver = self;
  v11.super_class = (Class)&OBJC_CLASS___VCPRequestUpdateKeyFacesOfPersonsTask;
  -[VCPRequestUpdateKeyFacesOfPersonsTask dealloc](&v11, "dealloc");
}

- (float)resourceRequirement
{
  return 0.55;
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
    v12[2] = sub_1001097B0;
    v12[3] = &unk_1001B9E98;
    v12[4] = self;
    v7 = objc_retainBlock(v12);
    [v6 updateKeyFacesOfPersonsWithLocalIdentifiers:self->_personLocalIdentifiers forceUpdate:self->_forceUpdate context:&__NSDictionary0__struct cancelOrExtendTimeoutBlock:v7 reply:self->_reply];

    int v8 = 0;
  }

  else
  {
    id reply = (void (**)(id, void, void *))self->_reply;
    NSErrorUserInfoKey v13 = NSLocalizedDescriptionKey;
    v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Failed to find client specified Photos Library (%@)",  self->_photoLibraryURL));
    id v14 = v5;
    v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v14,  &v13,  1LL));
    BOOL v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  NSOSStatusErrorDomain,  -50LL,  v6));
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