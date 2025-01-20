@interface MADUnifiedProcessingTask
+ (id)taskWithCancelBlock:(id)a3 options:(id)a4 progressHandler:(id)a5 andCompletionHandler:(id)a6;
- (BOOL)run:(id *)a3;
- (MADUnifiedProcessingTask)initWithCancelBlock:(id)a3 options:(id)a4 progressHandler:(id)a5 andCompletionHandler:(id)a6;
- (int)completeSceneProcessing;
- (void)purgeCachedModels;
@end

@implementation MADUnifiedProcessingTask

- (MADUnifiedProcessingTask)initWithCancelBlock:(id)a3 options:(id)a4 progressHandler:(id)a5 andCompletionHandler:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472LL;
  v21[2] = sub_1000AC4B8;
  v21[3] = &unk_1001B9800;
  id v13 = a6;
  id v22 = v13;
  v20.receiver = self;
  v20.super_class = (Class)&OBJC_CLASS___MADUnifiedProcessingTask;
  v14 = -[MADUnifiedProcessingTask initWithCompletionHandler:](&v20, "initWithCompletionHandler:", v21);
  v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_options, a4);
    id v16 = objc_retainBlock(v12);
    id progressHandler = v15->_progressHandler;
    v15->_id progressHandler = v16;

    v19.receiver = v15;
    v19.super_class = (Class)&OBJC_CLASS___MADUnifiedProcessingTask;
    -[MADUnifiedProcessingTask setCancelBlock:](&v19, "setCancelBlock:", v10);
  }

  return v15;
}

+ (id)taskWithCancelBlock:(id)a3 options:(id)a4 progressHandler:(id)a5 andCompletionHandler:(id)a6
{
  id v10 = a6;
  id v11 = a5;
  id v12 = a4;
  id v13 = a3;
  id v14 = [objc_alloc((Class)a1) initWithCancelBlock:v13 options:v12 progressHandler:v11 andCompletionHandler:v10];

  return v14;
}

- (int)completeSceneProcessing
{
  v3 = objc_autoreleasePoolPush();
  v14[0] = 0LL;
  v14[1] = v14;
  v14[2] = 0x2020000000LL;
  v14[3] = 0LL;
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472LL;
  v13[2] = sub_1000AC704;
  v13[3] = &unk_1001BC9F8;
  v13[4] = self;
  v13[5] = v14;
  v4 = objc_retainBlock(v13);
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472LL;
  v12[2] = sub_1000AC80C;
  v12[3] = &unk_1001BCA20;
  v12[4] = self;
  v12[5] = v14;
  v5 = objc_retainBlock(v12);
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472LL;
  v11[2] = sub_1000AC924;
  v11[3] = &unk_1001BCA48;
  v11[4] = self;
  v6 = objc_retainBlock(v11);
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[VCPPhotoLibraryManager sharedManager](&OBJC_CLASS___VCPPhotoLibraryManager, "sharedManager"));
  v8 = (void *)objc_claimAutoreleasedReturnValue([v7 allPhotoLibraries]);

  v9 = (void *)objc_claimAutoreleasedReturnValue( +[VCPMADSceneLibraryProcessingTask taskWithPhotoLibraries:cancelBlock:progressHandler:andCompletionHandler:]( &OBJC_CLASS___VCPMADSceneLibraryProcessingTask,  "taskWithPhotoLibraries:cancelBlock:progressHandler:andCompletionHandler:",  v8,  v6,  v4,  v5));
  LODWORD(v7) = [v9 run];

  _Block_object_dispose(v14, 8);
  objc_autoreleasePoolPop(v3);
  return (int)v7;
}

- (void)purgeCachedModels
{
}

- (BOOL)run:(id *)a3
{
  signed int v5 = -[MADUnifiedProcessingTask completeSceneProcessing](self, "completeSceneProcessing");
  if (v5)
  {
    if (a3)
    {
      uint64_t v6 = v5;
      NSErrorUserInfoKey v52 = NSLocalizedDescriptionKey;
      v7 = "failed";
      if (v5 == -128) {
        v7 = "canceled";
      }
      v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"[Unified] Pre-Analysis %s",  v7));
      v53 = v8;
      v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v53,  &v52,  1LL));
      id v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  NSOSStatusErrorDomain,  v6,  v9));
      id v11 = *a3;
      *a3 = v10;
    }

    -[MADUnifiedProcessingTask purgeCachedModels](self, "purgeCachedModels");
    return 0;
  }

  else
  {
    id v13 = (void *)objc_claimAutoreleasedReturnValue(+[VCPPhotoLibraryManager sharedManager](&OBJC_CLASS___VCPPhotoLibraryManager, "sharedManager"));
    id v14 = (void *)objc_claimAutoreleasedReturnValue([v13 allPhotoLibraries]);

    uint64_t v17 = MediaAnalysisLogLevel(v15, v16);
    if ((int)v17 >= 6)
    {
      uint64_t v19 = VCPLogInstance(v17, v18);
      objc_super v20 = (os_log_s *)objc_claimAutoreleasedReturnValue(v19);
      os_log_type_t v21 = VCPLogToOSLogType[6];
      if (os_log_type_enabled(v20, v21))
      {
        *(_DWORD *)buf = 134217984;
        id v51 = [v14 count];
        _os_log_impl( (void *)&_mh_execute_header,  v20,  v21,  "[Unified] Initiating processing with %lu photo libraries",  buf,  0xCu);
      }
    }

    if ([v14 count])
    {
      uint64_t v22 = 0LL;
      unint64_t v23 = 0LL;
      while (1)
      {
        v24 = objc_autoreleasePoolPush();
        v25 = (char *)[v14 count];
        uint64_t v26 = (unint64_t)&v25[v22] >= 5 ? 5LL : (uint64_t)&v25[v22];
        v27 = objc_alloc(&OBJC_CLASS___MADTaskCoordinator);
        v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "subarrayWithRange:", v23, v26));
        options = self->_options;
        v47[0] = _NSConcreteStackBlock;
        v47[1] = 3221225472LL;
        v47[2] = sub_1000ACD8C;
        v47[3] = &unk_1001BCA48;
        v47[4] = self;
        v30 = -[MADTaskCoordinator initWithPhotoLibraries:taskProviderTypes:options:cancelBlock:progressReporter:]( v27,  "initWithPhotoLibraries:taskProviderTypes:options:cancelBlock:progressReporter:",  v28,  &off_1001C90D8,  options,  v47,  0LL);

        if (!v30) {
          break;
        }
        signed int v33 = -[MADTaskCoordinator run](v30, "run");
        if (v33)
        {
          if (!a3) {
            goto LABEL_28;
          }
          goto LABEL_25;
        }

        objc_autoreleasePoolPop(v24);
        v23 += 5LL;
        v22 -= 5LL;
      }

      uint64_t v35 = MediaAnalysisLogLevel(v31, v32);
      if ((int)v35 >= 3)
      {
        uint64_t v37 = VCPLogInstance(v35, v36);
        v38 = (os_log_s *)objc_claimAutoreleasedReturnValue(v37);
        os_log_type_t v39 = VCPLogToOSLogType[3];
        if (os_log_type_enabled(v38, v39))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v38, v39, "[Unified] Failed to create task coordinator.", buf, 2u);
        }
      }

      signed int v33 = -18;
      if (a3)
      {
LABEL_25:
        uint64_t v40 = v33;
        NSErrorUserInfoKey v48 = NSLocalizedDescriptionKey;
        v41 = "failed";
        if (v33 == -128) {
          v41 = "canceled";
        }
        v42 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"[Unified] Analysis %s",  v41));
        v49 = v42;
        v43 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v49,  &v48,  1LL));
        v44 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  NSOSStatusErrorDomain,  v40,  v43));
        id v45 = *a3;
        *a3 = v44;
      }

- (void).cxx_destruct
{
}

@end