@interface MADPhotosDeferredProcessingTask
- (BOOL)run:(id *)a3;
- (MADPhotosDeferredProcessingTask)initWithCancelBlock:(id)a3 progressHandler:(id)a4 completionHandler:(id)a5;
- (int)performFullProcessing:(id)a3;
- (int)performSceneProcessing:(id)a3;
- (void)generateError:(id *)a3 status:(int)a4;
@end

@implementation MADPhotosDeferredProcessingTask

- (MADPhotosDeferredProcessingTask)initWithCancelBlock:(id)a3 progressHandler:(id)a4 completionHandler:(id)a5
{
  id v7 = a3;
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472LL;
  v14[2] = sub_10000254C;
  v14[3] = &unk_1001B9800;
  id v8 = a5;
  id v15 = v8;
  v9 = objc_retainBlock(v14);
  v13.receiver = self;
  v13.super_class = (Class)&OBJC_CLASS___MADPhotosDeferredProcessingTask;
  v10 = -[MADPhotosDeferredProcessingTask initWithCompletionHandler:](&v13, "initWithCompletionHandler:", v9);
  v11 = v10;
  if (v10) {
    -[MADPhotosDeferredProcessingTask setCancelBlock:](v10, "setCancelBlock:", v7);
  }

  return v11;
}

- (int)performSceneProcessing:(id)a3
{
  id v4 = a3;
  v5 = objc_autoreleasePoolPush();
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472LL;
  v19[2] = sub_100002730;
  v19[3] = &unk_1001B9828;
  id v6 = v4;
  id v20 = v6;
  id v7 = objc_retainBlock(v19);
  uint64_t v15 = 0LL;
  v16 = &v15;
  uint64_t v17 = 0x2020000000LL;
  int v18 = 0;
  id v8 = objc_alloc(&OBJC_CLASS___VCPMADSceneFetchProcessingTask);
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[PHPhotoLibrary systemPhotoLibraryURL](&OBJC_CLASS___PHPhotoLibrary, "systemPhotoLibraryURL"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[MADPhotosDeferredProcessingTask cancelBlock](self, "cancelBlock"));
  v14[1] = 3221225472LL;
  v14[2] = sub_10000280C;
  v14[3] = &unk_1001B9850;
  void v14[4] = self;
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472LL;
  v13[2] = sub_10000282C;
  v13[3] = &unk_1001B9878;
  v13[4] = &v15;
  v14[0] = _NSConcreteStackBlock;
  v11 = -[VCPMADSceneFetchProcessingTask initWithFetchBlock:photoLibraryWithURL:cancelBlock:progressHandler:completionHandler:]( v8,  "initWithFetchBlock:photoLibraryWithURL:cancelBlock:progressHandler:completionHandler:",  v7,  v9,  v10,  v14,  v13);

  -[VCPMADSceneFetchProcessingTask run](v11, "run");
  LODWORD(v9) = *((_DWORD *)v16 + 6);

  _Block_object_dispose(&v15, 8);
  objc_autoreleasePoolPop(v5);

  return (int)v9;
}

- (int)performFullProcessing:(id)a3
{
  id v4 = a3;
  v5 = objc_autoreleasePoolPush();
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472LL;
  v19[2] = sub_1000029E4;
  v19[3] = &unk_1001B9828;
  id v6 = v4;
  id v20 = v6;
  id v7 = objc_retainBlock(v19);
  uint64_t v15 = 0LL;
  v16 = &v15;
  uint64_t v17 = 0x2020000000LL;
  int v18 = 0;
  id v8 = objc_alloc(&OBJC_CLASS___MADFullImageFetchProcessingTask);
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[PHPhotoLibrary systemPhotoLibraryURL](&OBJC_CLASS___PHPhotoLibrary, "systemPhotoLibraryURL"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[MADPhotosDeferredProcessingTask cancelBlock](self, "cancelBlock"));
  v14[1] = 3221225472LL;
  v14[2] = sub_100002AC0;
  v14[3] = &unk_1001B9850;
  void v14[4] = self;
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472LL;
  v13[2] = sub_100002AE4;
  v13[3] = &unk_1001B9878;
  v13[4] = &v15;
  v14[0] = _NSConcreteStackBlock;
  v11 = -[MADFullImageFetchProcessingTask initWithFetchBlock:photoLibraryWithURL:cancelBlock:progressHandler:completionHandler:]( v8,  "initWithFetchBlock:photoLibraryWithURL:cancelBlock:progressHandler:completionHandler:",  v7,  v9,  v10,  v14,  v13);

  -[MADFullImageFetchProcessingTask run](v11, "run");
  LODWORD(v9) = *((_DWORD *)v16 + 6);

  _Block_object_dispose(&v15, 8);
  objc_autoreleasePoolPop(v5);

  return (int)v9;
}

- (void)generateError:(id *)a3 status:(int)a4
{
  int v6 = MediaAnalysisLogLevel(self, a2);
  if (a4 == -128)
  {
    if (v6 >= 5)
    {
      uint64_t v7 = VCPLogInstance();
      id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
      os_log_type_t v9 = VCPLogToOSLogType[5];
      if (os_log_type_enabled(v8, v9))
      {
        *(_WORD *)id v20 = 0;
        _os_log_impl((void *)&_mh_execute_header, v8, v9, "[Deferred] Processing cancelled", v20, 2u);
      }
    }

    if (a3)
    {
      NSErrorUserInfoKey v23 = NSLocalizedDescriptionKey;
      v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Deferred processing cancelled"));
      v24 = v10;
      v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v24,  &v23,  1LL));
      NSErrorDomain v12 = NSOSStatusErrorDomain;
      uint64_t v13 = -128LL;
LABEL_14:
      int v18 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  v12,  v13,  v11));
      id v19 = *a3;
      *a3 = v18;
    }
  }

  else
  {
    if (v6 >= 3)
    {
      uint64_t v14 = VCPLogInstance();
      uint64_t v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
      os_log_type_t v16 = VCPLogToOSLogType[3];
      if (os_log_type_enabled(v15, v16))
      {
        *(_WORD *)id v20 = 0;
        _os_log_impl((void *)&_mh_execute_header, v15, v16, "[Deferred] Processing failed", v20, 2u);
      }
    }

    if (a3)
    {
      uint64_t v17 = a4;
      NSErrorUserInfoKey v21 = NSLocalizedDescriptionKey;
      v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Deferred processing failed"));
      v22 = v10;
      v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v22,  &v21,  1LL));
      NSErrorDomain v12 = NSOSStatusErrorDomain;
      uint64_t v13 = v17;
      goto LABEL_14;
    }
  }

- (BOOL)run:(id *)a3
{
  if ((int)MediaAnalysisLogLevel(self, a2) >= 5)
  {
    uint64_t v5 = VCPLogInstance();
    int v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
    os_log_type_t v7 = VCPLogToOSLogType[5];
    if (os_log_type_enabled(v6, v7))
    {
      *(_WORD *)v11 = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, v7, "[Deferred] Processing recent captures...", v11, 2u);
    }
  }

  uint64_t v8 = -[MADPhotosDeferredProcessingTask performSceneProcessing:](self, "performSceneProcessing:", &stru_1001B98B8);
  if ((_DWORD)v8
    || (uint64_t v8 = -[MADPhotosDeferredProcessingTask performFullProcessing:]( self,  "performFullProcessing:",  &stru_1001B98B8,  v8),  (_DWORD)v8))
  {
    -[MADPhotosDeferredProcessingTask generateError:status:](self, "generateError:status:", a3, v8);
    return 0;
  }

  else
  {
    v10 = (void (**)(void, void, void))objc_claimAutoreleasedReturnValue( -[MADPhotosDeferredProcessingTask completionHandler]( self,  "completionHandler"));
    v10[2](v10, 0LL, 0LL);

    return 1;
  }

- (void).cxx_destruct
{
}

@end