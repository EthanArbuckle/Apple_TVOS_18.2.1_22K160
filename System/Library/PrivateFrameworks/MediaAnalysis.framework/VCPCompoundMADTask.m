@interface VCPCompoundMADTask
+ (id)taskWithPhotoLibrary:(id)a3 forVCPTaskIDs:(id)a4 andOptions:(id)a5 andProgressHandler:(id)a6 andCompletionHandler:(id)a7 andCancelBlock:(id)a8;
- (BOOL)autoCancellable;
- (BOOL)isCanceled;
- (BOOL)run:(id *)a3;
- (VCPCompoundMADTask)initWithVCPMADTasks:(id)a3 andCompletionHandler:(id)a4 andCancelBlock:(id)a5;
- (float)resourceRequirement;
- (int)run;
- (void)cancel;
- (void)dealloc;
@end

@implementation VCPCompoundMADTask

+ (id)taskWithPhotoLibrary:(id)a3 forVCPTaskIDs:(id)a4 andOptions:(id)a5 andProgressHandler:(id)a6 andCompletionHandler:(id)a7 andCancelBlock:(id)a8
{
  id v14 = a3;
  id v15 = a4;
  id v45 = a5;
  id v16 = a6;
  id v46 = a7;
  id v17 = a8;
  id v18 = [v15 count];
  if (v18)
  {
    id v44 = a1;
    v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithCapacity:](&OBJC_CLASS___NSMutableArray, "arrayWithCapacity:", v18));
    float v20 = 1.0 / (float)(unint64_t)v18;
    if ([v15 containsObject:&off_1001C7868])
    {
      uint64_t v77 = 0LL;
      v78 = &v77;
      uint64_t v79 = 0x3032000000LL;
      v80 = sub_1000093E4;
      v81 = sub_1000093F4;
      v82 = objc_alloc_init(&OBJC_CLASS___VCPTimeMeasurement);
      v72[0] = _NSConcreteStackBlock;
      v72[1] = 3221225472LL;
      v72[2] = sub_1000093FC;
      v72[3] = &unk_1001B9C38;
      v74 = &v77;
      float v76 = 1.0 / (float)(unint64_t)v18;
      id v73 = v16;
      uint64_t v75 = 0LL;
      v21 = objc_retainBlock(v72);
      v71[0] = _NSConcreteStackBlock;
      v71[1] = 3221225472LL;
      v71[2] = sub_100009520;
      v71[3] = &unk_1001B9C60;
      v71[4] = &v77;
      v22 = objc_retainBlock(v71);
      id v88 = v14;
      v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v88, 1LL));
      v24 = (void *)objc_claimAutoreleasedReturnValue( +[VCPMADSceneLibraryProcessingTask taskWithPhotoLibraries:cancelBlock:progressHandler:andCompletionHandler:]( &OBJC_CLASS___VCPMADSceneLibraryProcessingTask,  "taskWithPhotoLibraries:cancelBlock:progressHandler:andCompletionHandler:",  v23,  v17,  v21,  v22));
      [v19 addObject:v24];

      _Block_object_dispose(&v77, 8);
      uint64_t v25 = 1LL;
    }

    else
    {
      uint64_t v25 = 0LL;
    }

    if ([v15 containsObject:&off_1001C7880])
    {
      uint64_t v77 = 0LL;
      v78 = &v77;
      uint64_t v79 = 0x3032000000LL;
      v80 = sub_1000093E4;
      v81 = sub_1000093F4;
      v82 = objc_alloc_init(&OBJC_CLASS___VCPTimeMeasurement);
      v66[0] = _NSConcreteStackBlock;
      v66[1] = 3221225472LL;
      v66[2] = sub_100009618;
      v66[3] = &unk_1001B9C38;
      v68 = &v77;
      float v70 = v20;
      id v67 = v16;
      uint64_t v69 = v25;
      v27 = objc_retainBlock(v66);
      v65[0] = _NSConcreteStackBlock;
      v65[1] = 3221225472LL;
      v65[2] = sub_10000973C;
      v65[3] = &unk_1001B9C60;
      v65[4] = &v77;
      v28 = objc_retainBlock(v65);
      id v87 = v14;
      v29 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v87, 1LL));
      v30 = (void *)objc_claimAutoreleasedReturnValue( +[VCPFaceLibraryProcessingTask taskWithPhotoLibraries:andOptions:andProgressHandler:andCompletionHandler:andCancelBlock:]( &OBJC_CLASS___VCPFaceLibraryProcessingTask,  "taskWithPhotoLibraries:andOptions:andProgressHandler:andCompletionHandler:andCancelBlock:",  v29,  0LL,  v27,  v28,  v17));
      [v19 addObject:v30];

      _Block_object_dispose(&v77, 8);
      ++v25;
    }

    if ([v15 containsObject:&off_1001C7898])
    {
      uint64_t v77 = 0LL;
      v78 = &v77;
      uint64_t v79 = 0x3032000000LL;
      v80 = sub_1000093E4;
      v81 = sub_1000093F4;
      v82 = objc_alloc_init(&OBJC_CLASS___VCPTimeMeasurement);
      v60[0] = _NSConcreteStackBlock;
      v60[1] = 3221225472LL;
      v60[2] = sub_100009834;
      v60[3] = &unk_1001B9C38;
      v62 = &v77;
      float v64 = v20;
      id v61 = v16;
      uint64_t v63 = v25;
      v31 = objc_retainBlock(v60);
      v59[0] = _NSConcreteStackBlock;
      v59[1] = 3221225472LL;
      v59[2] = sub_100009958;
      v59[3] = &unk_1001B9C60;
      v59[4] = &v77;
      v32 = objc_retainBlock(v59);
      id v86 = v14;
      v33 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v86, 1LL));
      v34 = (void *)objc_claimAutoreleasedReturnValue( +[VCPMADOCRLibraryProcessingTask taskWithPhotoLibraries:cancelBlock:progressHandler:andCompletionHandler:]( &OBJC_CLASS___VCPMADOCRLibraryProcessingTask,  "taskWithPhotoLibraries:cancelBlock:progressHandler:andCompletionHandler:",  v33,  v17,  v31,  v32));
      [v19 addObject:v34];

      _Block_object_dispose(&v77, 8);
      ++v25;
    }

    if ([v15 containsObject:&off_1001C78B0])
    {
      uint64_t v77 = 0LL;
      v78 = &v77;
      uint64_t v79 = 0x3032000000LL;
      v80 = sub_1000093E4;
      v81 = sub_1000093F4;
      v82 = objc_alloc_init(&OBJC_CLASS___VCPTimeMeasurement);
      v54[0] = _NSConcreteStackBlock;
      v54[1] = 3221225472LL;
      v54[2] = sub_100009A50;
      v54[3] = &unk_1001B9C38;
      v56 = &v77;
      float v58 = v20;
      id v55 = v16;
      uint64_t v57 = v25;
      v35 = objc_retainBlock(v54);
      v53[0] = _NSConcreteStackBlock;
      v53[1] = 3221225472LL;
      v53[2] = sub_100009B74;
      v53[3] = &unk_1001B9C60;
      v53[4] = &v77;
      v36 = objc_retainBlock(v53);
      id v85 = v14;
      v37 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v85, 1LL));
      v38 = (void *)objc_claimAutoreleasedReturnValue( +[VCPLibraryProcessingTask taskWithPhotoLibraries:andOptions:andProgressHandler:andCompletionHandler:andCancelBlock:]( &OBJC_CLASS___VCPLibraryProcessingTask,  "taskWithPhotoLibraries:andOptions:andProgressHandler:andCompletionHandler:andCancelBlock:",  v37,  v45,  v35,  v36,  v17));
      [v19 addObject:v38];

      _Block_object_dispose(&v77, 8);
      ++v25;
    }

    if ([v15 containsObject:&off_1001C78C8])
    {
      uint64_t v77 = 0LL;
      v78 = &v77;
      uint64_t v79 = 0x3032000000LL;
      v80 = sub_1000093E4;
      v81 = sub_1000093F4;
      v82 = objc_alloc_init(&OBJC_CLASS___VCPTimeMeasurement);
      v48[0] = _NSConcreteStackBlock;
      v48[1] = 3221225472LL;
      v48[2] = sub_100009C6C;
      v48[3] = &unk_1001B9C88;
      v50 = &v77;
      float v52 = v20;
      id v49 = v16;
      uint64_t v51 = v25;
      v39 = objc_retainBlock(v48);
      v47[0] = _NSConcreteStackBlock;
      v47[1] = 3221225472LL;
      v47[2] = sub_100009D90;
      v47[3] = &unk_1001B9C60;
      v47[4] = &v77;
      v40 = objc_retainBlock(v47);
      v83 = @"SkipSyncGallery";
      v84 = &__kCFBooleanFalse;
      v41 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v84,  &v83,  1LL));
      v42 = (void *)objc_claimAutoreleasedReturnValue( +[MADUnifiedProcessingTask taskWithCancelBlock:options:progressHandler:andCompletionHandler:]( &OBJC_CLASS___MADUnifiedProcessingTask,  "taskWithCancelBlock:options:progressHandler:andCompletionHandler:",  v17,  v41,  v39,  v40));
      [v19 addObject:v42];

      _Block_object_dispose(&v77, 8);
    }

    id v26 = [objc_alloc((Class)objc_opt_class(v44)) initWithVCPMADTasks:v19 andCompletionHandler:v46 andCancelBlock:v17];
  }

  else
  {
    id v26 = 0LL;
  }

  return v26;
}

- (VCPCompoundMADTask)initWithVCPMADTasks:(id)a3 andCompletionHandler:(id)a4 andCancelBlock:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v19.receiver = self;
  v19.super_class = (Class)&OBJC_CLASS___VCPCompoundMADTask;
  v12 = -[VCPCompoundMADTask init](&v19, "init");
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_tasks, a3);
    id v14 = objc_retainBlock(v10);
    id completionHandler = v13->_completionHandler;
    v13->_id completionHandler = v14;

    id v16 = objc_retainBlock(v11);
    id cancelBlock = v13->_cancelBlock;
    v13->_id cancelBlock = v16;
  }

  return v13;
}

- (void)dealloc
{
  unsigned __int8 v3 = atomic_load((unsigned __int8 *)&self->_started);
  if ((v3 & 1) == 0)
  {
    id completionHandler = (void (**)(id, void *))self->_completionHandler;
    NSErrorUserInfoKey v12 = NSLocalizedDescriptionKey;
    v5 = (objc_class *)objc_opt_class(self);
    v6 = NSStringFromClass(v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%@ canceled", v7));
    v13 = v8;
    id v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v13,  &v12,  1LL));
    id v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  NSOSStatusErrorDomain,  -128LL,  v9));
    completionHandler[2](completionHandler, v10);
  }

  v11.receiver = self;
  v11.super_class = (Class)&OBJC_CLASS___VCPCompoundMADTask;
  -[VCPCompoundMADTask dealloc](&v11, "dealloc");
}

- (float)resourceRequirement
{
  return 1.0;
}

- (void)cancel
{
  __int128 v7 = 0u;
  __int128 v8 = 0u;
  __int128 v9 = 0u;
  __int128 v10 = 0u;
  unsigned __int8 v3 = self->_tasks;
  id v4 = -[NSArray countByEnumeratingWithState:objects:count:]( v3,  "countByEnumeratingWithState:objects:count:",  &v7,  v11,  16LL);
  if (v4)
  {
    uint64_t v5 = *(void *)v8;
    do
    {
      v6 = 0LL;
      do
      {
        if (*(void *)v8 != v5) {
          objc_enumerationMutation(v3);
        }
        objc_msgSend(*(id *)(*((void *)&v7 + 1) + 8 * (void)v6), "cancel", (void)v7);
        v6 = (char *)v6 + 1;
      }

      while (v4 != v6);
      id v4 = -[NSArray countByEnumeratingWithState:objects:count:]( v3,  "countByEnumeratingWithState:objects:count:",  &v7,  v11,  16LL);
    }

    while (v4);
  }

  atomic_store(1u, (unsigned __int8 *)&self->_canceled);
}

- (BOOL)isCanceled
{
  unsigned __int8 v2 = atomic_load((unsigned __int8 *)&self->_canceled);
  if ((v2 & 1) != 0)
  {
    LOBYTE(cancelBlock) = 1;
  }

  else
  {
    id cancelBlock = (uint64_t (**)(void))self->_cancelBlock;
    if (cancelBlock) {
      LOBYTE(cancelBlock) = cancelBlock[2]();
    }
  }

  return (char)cancelBlock;
}

- (BOOL)run:(id *)a3
{
  if (-[NSArray count](self->_tasks, "count"))
  {
    uint64_t v5 = 0LL;
    while (1)
    {
      v6 = objc_autoreleasePoolPush();
      __int128 v7 = (void *)objc_claimAutoreleasedReturnValue(-[NSArray objectAtIndexedSubscript:](self->_tasks, "objectAtIndexedSubscript:", v5));
      if (-[VCPCompoundMADTask isCanceled](self, "isCanceled"))
      {
        if (!a3) {
          goto LABEL_12;
        }
        NSErrorUserInfoKey v16 = NSLocalizedDescriptionKey;
        __int128 v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"VCPTask %@ cancelled",  v7));
        id v17 = v10;
        objc_super v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v17,  &v16,  1LL));
        NSErrorUserInfoKey v12 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  NSOSStatusErrorDomain,  -128LL,  v11));
        goto LABEL_11;
      }

      signed int v8 = [v7 run];
      if (v8) {
        break;
      }

      objc_autoreleasePoolPop(v6);
      if (++v5 >= -[NSArray count](self->_tasks, "count")) {
        goto LABEL_6;
      }
    }

    if (!a3) {
      goto LABEL_12;
    }
    __int128 v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"VCPTask %@ failed",  v7,  NSLocalizedDescriptionKey));
    id v15 = v10;
    objc_super v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v15,  &v14,  1LL));
    NSErrorUserInfoKey v12 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  NSOSStatusErrorDomain,  v8,  v11));
LABEL_11:
    id v13 = *a3;
    *a3 = v12;

LABEL_12:
    objc_autoreleasePoolPop(v6);
    return 0;
  }

  else
  {
LABEL_6:
    (*((void (**)(void))self->_completionHandler + 2))();
    return 1;
  }

- (int)run
{
  unsigned __int8 v3 = objc_autoreleasePoolPush();
  atomic_store(1u, (unsigned __int8 *)&self->_started);
  id v17 = 0LL;
  if (-[VCPCompoundMADTask run:](self, "run:", &v17))
  {
    int v4 = 0;
  }

  else
  {
    id v5 = [v17 code];
    if (v5 != (id)-128LL)
    {
      uint64_t v7 = MediaAnalysisLogLevel(v5, v6);
      if ((int)v7 >= 3)
      {
        uint64_t v9 = VCPLogInstance(v7, v8);
        __int128 v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
        os_log_type_t v11 = VCPLogToOSLogType[3];
        if (os_log_type_enabled(v10, v11))
        {
          NSErrorUserInfoKey v12 = (objc_class *)objc_opt_class(self);
          id v13 = NSStringFromClass(v12);
          uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
          id v15 = (void *)objc_claimAutoreleasedReturnValue([v17 description]);
          *(_DWORD *)buf = 138412546;
          objc_super v19 = v14;
          __int16 v20 = 2112;
          v21 = v15;
          _os_log_impl((void *)&_mh_execute_header, v10, v11, "%@ failed (%@)", buf, 0x16u);
        }
      }
    }

    (*((void (**)(void))self->_completionHandler + 2))();
    int v4 = [v17 code];
  }

  objc_autoreleasePoolPop(v3);
  return v4;
}

- (BOOL)autoCancellable
{
  return 0;
}

- (void).cxx_destruct
{
}

@end