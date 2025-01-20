@interface VCPRequestPersonPromoterStatusTask
+ (id)taskWithAdvancedFlag:(BOOL)a3 andPhotoLibraryURL:(id)a4 andProgressHandler:(id)a5 andReply:(id)a6;
- (BOOL)autoCancellable;
- (BOOL)isCanceled;
- (VCPRequestPersonPromoterStatusTask)initWithAdvancedFlag:(BOOL)a3 andPhotoLibraryURL:(id)a4 andProgressHandler:(id)a5 andReply:(id)a6;
- (float)resourceRequirement;
- (id)cancelBlock;
- (int)run;
- (void)cancel;
- (void)dealloc;
- (void)setCancelBlock:(id)a3;
@end

@implementation VCPRequestPersonPromoterStatusTask

- (VCPRequestPersonPromoterStatusTask)initWithAdvancedFlag:(BOOL)a3 andPhotoLibraryURL:(id)a4 andProgressHandler:(id)a5 andReply:(id)a6
{
  id v10 = a4;
  id v11 = a6;
  v17.receiver = self;
  v17.super_class = (Class)&OBJC_CLASS___VCPRequestPersonPromoterStatusTask;
  v12 = -[VCPRequestPersonPromoterStatusTask init](&v17, "init");
  v13 = v12;
  if (v12)
  {
    v12->_advancedStatus = a3;
    objc_storeStrong((id *)&v12->_photoLibraryURL, a4);
    id v14 = objc_retainBlock(v11);
    id reply = v13->_reply;
    v13->_id reply = v14;
  }

  return v13;
}

+ (id)taskWithAdvancedFlag:(BOOL)a3 andPhotoLibraryURL:(id)a4 andProgressHandler:(id)a5 andReply:(id)a6
{
  BOOL v8 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  id v13 = [objc_alloc((Class)objc_opt_class(a1)) initWithAdvancedFlag:v8 andPhotoLibraryURL:v10 andProgressHandler:v11 andReply:v12];

  return v13;
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
    BOOL v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%@ canceled", v7));
    id v13 = v8;
    v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v13,  &v12,  1LL));
    id v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  NSOSStatusErrorDomain,  -128LL,  v9));
    reply[2](reply, 0LL, v10);
  }

  v11.receiver = self;
  v11.super_class = (Class)&OBJC_CLASS___VCPRequestPersonPromoterStatusTask;
  -[VCPRequestPersonPromoterStatusTask dealloc](&v11, "dealloc");
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
    uint64_t v12 = VCPMediaAnalysisServicePersonPromoterRequestAdvancedStatusKey;
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", self->_advancedStatus));
    id v13 = v7;
    BOOL v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v13,  &v12,  1LL));
    [v6 personPromoterStatusWithContext:v8 reply:self->_reply];

    int v9 = 0;
  }

  else
  {
    id reply = (void (**)(id, void, void *))self->_reply;
    NSErrorUserInfoKey v14 = NSLocalizedDescriptionKey;
    v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Failed to find client specified Photos Library (%@)",  self->_photoLibraryURL));
    v15 = v5;
    v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v15,  &v14,  1LL));
    v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  NSOSStatusErrorDomain,  -50LL,  v6));
    reply[2](reply, 0LL, v7);
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