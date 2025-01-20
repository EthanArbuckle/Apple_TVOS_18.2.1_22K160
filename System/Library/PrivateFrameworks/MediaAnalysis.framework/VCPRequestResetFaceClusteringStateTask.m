@interface VCPRequestResetFaceClusteringStateTask
+ (id)taskWithPhotoLibraryURL:(id)a3 andProgressHandler:(id)a4 andReply:(id)a5;
- (BOOL)autoCancellable;
- (BOOL)isCanceled;
- (VCPRequestResetFaceClusteringStateTask)initWithPhotoLibraryURL:(id)a3 andProgressHandler:(id)a4 andReply:(id)a5;
- (float)resourceRequirement;
- (id)cancelBlock;
- (int)run;
- (void)cancel;
- (void)dealloc;
- (void)setCancelBlock:(id)a3;
@end

@implementation VCPRequestResetFaceClusteringStateTask

- (VCPRequestResetFaceClusteringStateTask)initWithPhotoLibraryURL:(id)a3 andProgressHandler:(id)a4 andReply:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  v15.receiver = self;
  v15.super_class = (Class)&OBJC_CLASS___VCPRequestResetFaceClusteringStateTask;
  v10 = -[VCPRequestResetFaceClusteringStateTask init](&v15, "init");
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
  v11.super_class = (Class)&OBJC_CLASS___VCPRequestResetFaceClusteringStateTask;
  -[VCPRequestResetFaceClusteringStateTask dealloc](&v11, "dealloc");
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
    if (objc_msgSend(v4, "mad_useVUGallery"))
    {
      v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "mad_allFacesFetchOptions"));
      v6 = (void *)objc_claimAutoreleasedReturnValue(+[PHFace fetchFacesWithOptions:](&OBJC_CLASS___PHFace, "fetchFacesWithOptions:", v5));
      if ([v6 count])
      {
        v26[0] = _NSConcreteStackBlock;
        v26[1] = 3221225472LL;
        v26[2] = sub_10010CAFC;
        v26[3] = &unk_1001B9E70;
        id v27 = v6;
        v28 = self;
        id v25 = 0LL;
        unsigned __int8 v7 = [v4 performChangesAndWait:v26 error:&v25];
        id v8 = v25;

        if ((v7 & 1) == 0)
        {
          (*((void (**)(void))self->_reply + 2))();
          int v9 = [v8 code];
LABEL_12:

          goto LABEL_13;
        }
      }

      else
      {
        id v8 = 0LL;
      }

      +[PNPersonPromoter setProcessed:forLibrary:](&OBJC_CLASS___PNPersonPromoter, "setProcessed:forLibrary:", 0LL, v4);
      v23[0] = 0LL;
      v23[1] = v23;
      v23[2] = 0x2020000000LL;
      int v24 = 0;
      if ((objc_msgSend(v4, "vcp_isSyndicationLibrary") & 1) == 0)
      {
        v22[0] = _NSConcreteStackBlock;
        v22[1] = 3221225472LL;
        v22[2] = sub_10010CC38;
        v22[3] = &unk_1001BDB10;
        v22[4] = v23;
        v16 = objc_retainBlock(v22);
        v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "vcp_visionCacheStorageDirectoryURL"));
        v18 = (void *)objc_claimAutoreleasedReturnValue([v17 URLByAppendingPathComponent:@"VUIndex.sqlite"]);
        ((void (*)(void *, void *))v16[2])(v16, v18);

        v19 = (void *)objc_claimAutoreleasedReturnValue([v17 URLByAppendingPathComponent:@"VUIndex.sqlite-shm"]);
        ((void (*)(void *, void *))v16[2])(v16, v19);

        v20 = (void *)objc_claimAutoreleasedReturnValue([v17 URLByAppendingPathComponent:@"VUIndex.sqlite-wal"]);
        ((void (*)(void *, void *))v16[2])(v16, v20);
      }

      (*((void (**)(void))self->_reply + 2))();
      _Block_object_dispose(v23, 8);
      int v9 = 1;
      goto LABEL_12;
    }

    v14 = (void *)objc_claimAutoreleasedReturnValue( +[VCPPhotosFaceProcessingContext contextWithPhotoLibrary:]( &OBJC_CLASS___VCPPhotosFaceProcessingContext,  "contextWithPhotoLibrary:",  v4));
    objc_super v15 = (void *)objc_claimAutoreleasedReturnValue( +[VCPFaceProcessingServiceWorker workerWithPhotoLibrary:andContext:]( &OBJC_CLASS___VCPFaceProcessingServiceWorker,  "workerWithPhotoLibrary:andContext:",  v4,  v14));
    [v15 resetFaceClusteringStateWithContext:&__NSDictionary0__struct reply:self->_reply];

    int v9 = 0;
  }

  else
  {
    id reply = (void (**)(id, void, void *))self->_reply;
    NSErrorUserInfoKey v29 = NSLocalizedDescriptionKey;
    objc_super v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Failed to find client specified Photos Library (%@)",  self->_photoLibraryURL));
    v30 = v11;
    NSErrorUserInfoKey v12 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v30,  &v29,  1LL));
    v13 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  NSOSStatusErrorDomain,  -50LL,  v12));
    reply[2](reply, 0LL, v13);

    int v9 = -50;
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