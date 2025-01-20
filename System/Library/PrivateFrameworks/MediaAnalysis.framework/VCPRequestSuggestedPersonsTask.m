@interface VCPRequestSuggestedPersonsTask
+ (id)taskWithPersonWithLocalIdentifier:(id)a3 toBeConfirmedPersonSuggestions:(id)a4 toBeRejectedPersonSuggestions:(id)a5 andPhotoLibraryURL:(id)a6 andProgressHandler:(id)a7 andReply:(id)a8;
- (BOOL)autoCancellable;
- (BOOL)isCanceled;
- (VCPRequestSuggestedPersonsTask)initWithPersonWithLocalIdentifier:(id)a3 toBeConfirmedPersonSuggestions:(id)a4 toBeRejectedPersonSuggestions:(id)a5 andPhotoLibraryURL:(id)a6 andProgressHandler:(id)a7 andReply:(id)a8;
- (float)resourceRequirement;
- (id)cancelBlock;
- (int)run;
- (void)cancel;
- (void)dealloc;
- (void)setCancelBlock:(id)a3;
@end

@implementation VCPRequestSuggestedPersonsTask

- (VCPRequestSuggestedPersonsTask)initWithPersonWithLocalIdentifier:(id)a3 toBeConfirmedPersonSuggestions:(id)a4 toBeRejectedPersonSuggestions:(id)a5 andPhotoLibraryURL:(id)a6 andProgressHandler:(id)a7 andReply:(id)a8
{
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  id v18 = a8;
  v24.receiver = self;
  v24.super_class = (Class)&OBJC_CLASS___VCPRequestSuggestedPersonsTask;
  v19 = -[VCPRequestSuggestedPersonsTask init](&v24, "init");
  v20 = v19;
  if (v19)
  {
    objc_storeStrong((id *)&v19->_personLocalIdentifier, a3);
    objc_storeStrong((id *)&v20->_toBeConfirmedPersonSuggestions, a4);
    objc_storeStrong((id *)&v20->_toBeRejectedPersonSuggestions, a5);
    objc_storeStrong((id *)&v20->_photoLibraryURL, a6);
    id v21 = objc_retainBlock(v18);
    id reply = v20->_reply;
    v20->_id reply = v21;
  }

  return v20;
}

+ (id)taskWithPersonWithLocalIdentifier:(id)a3 toBeConfirmedPersonSuggestions:(id)a4 toBeRejectedPersonSuggestions:(id)a5 andPhotoLibraryURL:(id)a6 andProgressHandler:(id)a7 andReply:(id)a8
{
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = a6;
  id v17 = a7;
  id v18 = a8;
  v19 = -[VCPRequestSuggestedPersonsTask initWithPersonWithLocalIdentifier:toBeConfirmedPersonSuggestions:toBeRejectedPersonSuggestions:andPhotoLibraryURL:andProgressHandler:andReply:]( objc_alloc(&OBJC_CLASS___VCPRequestSuggestedPersonsTask),  "initWithPersonWithLocalIdentifier:toBeConfirmedPersonSuggestions:toBeRejectedPersonSuggestions:andPhotoLibrary URL:andProgressHandler:andReply:",  v13,  v14,  v15,  v16,  v17,  v18);

  return v19;
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
    v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  NSOSStatusErrorDomain,  -128LL,  v9));
    reply[2](reply, 0LL, v10);
  }

  v11.receiver = self;
  v11.super_class = (Class)&OBJC_CLASS___VCPRequestSuggestedPersonsTask;
  -[VCPRequestSuggestedPersonsTask dealloc](&v11, "dealloc");
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
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472LL;
    v16[2] = sub_1001090F8;
    v16[3] = &unk_1001B9E98;
    v16[4] = self;
    v7 = objc_retainBlock(v16);
    personLocalIdentifier = self->_personLocalIdentifier;
    toBeConfirmedPersonSuggestions = self->_toBeConfirmedPersonSuggestions;
    toBeRejectedPersonSuggestions = self->_toBeRejectedPersonSuggestions;
    objc_super v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionary](&OBJC_CLASS___NSDictionary, "dictionary"));
    [v6 suggestPersonsForPersonWithLocalIdentifier:personLocalIdentifier toBeConfirmedPersonSuggestions:toBeConfirmedPersonSuggestions toBeRejectedPersonSuggestions:toBeRejectedPersonSuggestions context:v11 ca ncelOrExtendTimeoutBlock:v7 reply:self->_reply];

    int v12 = 0;
  }

  else
  {
    id reply = (void (**)(id, void, void *))self->_reply;
    NSErrorUserInfoKey v17 = NSLocalizedDescriptionKey;
    v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Failed to find client specified Photos Library (%@)",  self->_photoLibraryURL));
    id v18 = v5;
    v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v18,  &v17,  1LL));
    id v14 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  NSOSStatusErrorDomain,  -50LL,  v6));
    reply[2](reply, 0LL, v14);

    int v12 = -50;
  }

  return v12;
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