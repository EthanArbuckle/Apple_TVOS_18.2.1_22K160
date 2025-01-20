@interface VCPRequestResetPersonsTask
+ (id)taskWithPhotoLibraryURL:(id)a3 andProgressHandler:(id)a4 andReply:(id)a5;
- (BOOL)autoCancellable;
- (BOOL)isCanceled;
- (VCPRequestResetPersonsTask)initWithPhotoLibraryURL:(id)a3 andProgressHandler:(id)a4 andReply:(id)a5;
- (float)resourceRequirement;
- (id)cancelBlock;
- (int)run;
- (void)cancel;
- (void)dealloc;
- (void)setCancelBlock:(id)a3;
@end

@implementation VCPRequestResetPersonsTask

- (VCPRequestResetPersonsTask)initWithPhotoLibraryURL:(id)a3 andProgressHandler:(id)a4 andReply:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  v15.receiver = self;
  v15.super_class = (Class)&OBJC_CLASS___VCPRequestResetPersonsTask;
  v10 = -[VCPRequestResetPersonsTask init](&v15, "init");
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
  v11.super_class = (Class)&OBJC_CLASS___VCPRequestResetPersonsTask;
  -[VCPRequestResetPersonsTask dealloc](&v11, "dealloc");
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
    uint64_t v7 = MediaAnalysisLogLevel(v5, v6);
    if ((int)v7 >= 5)
    {
      uint64_t v9 = VCPLogInstance(v7, v8);
      id v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
      os_log_type_t v11 = VCPLogToOSLogType[5];
      if (os_log_type_enabled(v10, v11))
      {
        *(_WORD *)buf = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v10,  v11,  "Resetting person promoter progress key values ...",  buf,  2u);
      }
    }

    NSErrorUserInfoKey v12 = (void *)objc_claimAutoreleasedReturnValue( +[VCPDatabaseManager sharedDatabaseForPhotoLibrary:]( &OBJC_CLASS___VCPDatabaseManager,  "sharedDatabaseForPhotoLibrary:",  v4));
    id v13 = [v12 cacheProcessedAssetCountAfterPromoter:0];
    uint64_t v15 = MediaAnalysisLogLevel(v13, v14);
    if ((int)v15 >= 5)
    {
      uint64_t v17 = VCPLogInstance(v15, v16);
      v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(v17);
      os_log_type_t v19 = VCPLogToOSLogType[5];
      if (os_log_type_enabled(v18, v19))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v18, v19, "Resetting person process change tokens ... ", buf, 2u);
      }
    }

    [v12 removeChangeTokenForTaskID:3 andChangeTokenType:2];
    id v20 = [v12 removeChangeTokenForTaskID:3 andChangeTokenType:3];
    uint64_t v22 = MediaAnalysisLogLevel(v20, v21);
    if ((int)v22 >= 5)
    {
      uint64_t v24 = VCPLogInstance(v22, v23);
      v25 = (os_log_s *)objc_claimAutoreleasedReturnValue(v24);
      os_log_type_t v26 = VCPLogToOSLogType[5];
      if (os_log_type_enabled(v25, v26))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v25, v26, "Resetting person process timestamps ...", buf, 2u);
      }
    }

    [v12 removeKey:@"ContactIngestionTimestamp"];
    [v12 removeKey:@"HomePersonIngestionTimestamp"];
    [v12 removeKey:@"VUDeepSyncTimestamp"];
    [v12 removeKey:MADPersonProcessingStatusKey];
    [v12 removeKey:MADPersonProcessingUpdateAttemptCountKey];
    [v12 commit];
    v27 = (void *)objc_claimAutoreleasedReturnValue( +[VCPPhotosFaceProcessingContext contextWithPhotoLibrary:]( &OBJC_CLASS___VCPPhotosFaceProcessingContext,  "contextWithPhotoLibrary:",  v4));
    v28 = (void *)objc_claimAutoreleasedReturnValue( +[VCPFaceProcessingServiceWorker workerWithPhotoLibrary:andContext:]( &OBJC_CLASS___VCPFaceProcessingServiceWorker,  "workerWithPhotoLibrary:andContext:",  v4,  v27));
    uint64_t v30 = MediaAnalysisLogLevel(v28, v29);
    if ((int)v30 >= 5)
    {
      uint64_t v32 = VCPLogInstance(v30, v31);
      v33 = (os_log_s *)objc_claimAutoreleasedReturnValue(v32);
      os_log_type_t v34 = VCPLogToOSLogType[5];
      if (os_log_type_enabled(v33, v34))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v33, v34, "Resetting person promoter status ... ", buf, 2u);
      }
    }

    [v28 resetPersonPromoterStatusWithReply:self->_reply];
    int v35 = 0;
  }

  else
  {
    id reply = (void (**)(id, void, void *))self->_reply;
    NSErrorUserInfoKey v39 = NSLocalizedDescriptionKey;
    NSErrorUserInfoKey v12 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Failed to find client specified Photos Library (%@)",  self->_photoLibraryURL));
    v40 = v12;
    v27 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v40,  &v39,  1LL));
    v28 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  NSOSStatusErrorDomain,  -50LL,  v27));
    reply[2](reply, 0LL, v28);
    int v35 = -50;
  }

  return v35;
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