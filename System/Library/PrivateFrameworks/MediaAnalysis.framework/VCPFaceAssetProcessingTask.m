@interface VCPFaceAssetProcessingTask
+ (id)taskWithAssets:(id)a3 andProgressHandler:(id)a4 andCompletionHandler:(id)a5;
- (VCPFaceAssetProcessingTask)initWithAssets:(id)a3 andProgressHandler:(id)a4 andCompletionHandler:(id)a5;
- (int)main;
- (int)run;
@end

@implementation VCPFaceAssetProcessingTask

- (VCPFaceAssetProcessingTask)initWithAssets:(id)a3 andProgressHandler:(id)a4 andCompletionHandler:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  v11 = (Block_layout *)a5;
  if ([v9 count])
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[VCPFaceProcessingTask photoLibrary](self, "photoLibrary"));
    v13 = (void *)objc_claimAutoreleasedReturnValue( +[VCPPhotosFaceProcessingContext contextWithPhotoLibrary:]( &OBJC_CLASS___VCPPhotosFaceProcessingContext,  "contextWithPhotoLibrary:",  v12));

    v14 = (void *)objc_claimAutoreleasedReturnValue([v9 firstObject]);
    v15 = (void *)objc_claimAutoreleasedReturnValue([v14 photoLibrary]);
    v24.receiver = self;
    v24.super_class = (Class)&OBJC_CLASS___VCPFaceAssetProcessingTask;
    v16 = -[VCPFaceProcessingTask initWithPhotoLibrary:andContext:andCancelBlock:]( &v24,  "initWithPhotoLibrary:andContext:andCancelBlock:",  v15,  v13,  &stru_1001BCF48);

    if (v16)
    {
      id v17 = objc_retainBlock(v10);
      id progressHandler = v16->_progressHandler;
      v16->_id progressHandler = v17;

      if (v11) {
        v19 = v11;
      }
      else {
        v19 = &stru_1001BCF68;
      }
      v20 = objc_retainBlock(v19);
      id completionHandler = v16->_completionHandler;
      v16->_id completionHandler = v20;

      objc_storeStrong((id *)&v16->_assets, a3);
    }

    self = v16;

    v22 = self;
  }

  else
  {
    v22 = 0LL;
  }

  return v22;
}

+ (id)taskWithAssets:(id)a3 andProgressHandler:(id)a4 andCompletionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = [objc_alloc((Class)objc_opt_class(a1)) initWithAssets:v8 andProgressHandler:v9 andCompletionHandler:v10];

  return v11;
}

- (int)main
{
  if (!-[NSArray count](self->_assets, "count")) {
    return -50;
  }
  if (self->_progressHandler) {
    v27 = (void *)objc_claimAutoreleasedReturnValue( +[VCPProgressReporter reporterWithIntervalSeconds:andTotalJobCount:andBlock:]( &OBJC_CLASS___VCPProgressReporter,  "reporterWithIntervalSeconds:andTotalJobCount:andBlock:",  1LL,  -[NSArray count](self->_assets, "count"),  self->_progressHandler));
  }
  else {
    v27 = 0LL;
  }
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[NSArray firstObject](self->_assets, "firstObject"));
  v5 = (void *)objc_claimAutoreleasedReturnValue([v4 photoLibrary]);
  -[VCPFaceProcessingTask setAllowStreaming:](self, "setAllowStreaming:", objc_msgSend(v5, "vcp_allowInMemoryDownload"));

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](&OBJC_CLASS___NSMutableSet, "set"));
  __int128 v30 = 0u;
  __int128 v31 = 0u;
  __int128 v28 = 0u;
  __int128 v29 = 0u;
  v7 = self->_assets;
  id v8 = -[NSArray countByEnumeratingWithState:objects:count:]( v7,  "countByEnumeratingWithState:objects:count:",  &v28,  v34,  16LL);
  if (!v8) {
    goto LABEL_28;
  }
  uint64_t v10 = *(void *)v29;
  os_log_type_t type = VCPLogToOSLogType[5];
  *(void *)&__int128 v9 = 138412290LL;
  __int128 v25 = v9;
  while (2)
  {
    for (i = 0LL; i != v8; i = (char *)i + 1)
    {
      if (*(void *)v29 != v10) {
        objc_enumerationMutation(v7);
      }
      v12 = *(void **)(*((void *)&v28 + 1) + 8LL * (void)i);
      if (-[VCPFaceProcessingTask isCancelled](self, "isCancelled", v25))
      {
        int v3 = -128;
LABEL_33:

        goto LABEL_34;
      }

      v13 = (void *)objc_claimAutoreleasedReturnValue([v12 photoLibrary]);
      if (objc_msgSend(v13, "mad_pauseFCPeopleFurtherProcessing"))
      {
        unsigned int v14 = [v12 faceAnalysisVersion];
        else {
          int v15 = 11;
        }
        BOOL v16 = v15 == v14;

        if (v16)
        {
          uint64_t v19 = MediaAnalysisLogLevel(v17, v18);
          if ((int)v19 >= 5)
          {
            uint64_t v21 = VCPLogInstance(v19, v20);
            v22 = (os_log_s *)objc_claimAutoreleasedReturnValue(v21);
            if (os_log_type_enabled(v22, type))
            {
              v23 = (void *)objc_claimAutoreleasedReturnValue([v12 localIdentifier]);
              *(_DWORD *)buf = v25;
              v33 = v23;
              _os_log_impl((void *)&_mh_execute_header, v22, type, "[%@] already with FC version; skip", buf, 0xCu);
            }
          }

          continue;
        }
      }

      else
      {
      }

      if (objc_msgSend(v12, "vcp_needsFaceProcessing"))
      {
        [v27 increaseProcessedJobCountByOne];
        [v6 addObject:v12];
        if ((unint64_t)[v6 count] >= 0x64)
        {
          int v3 = -[VCPFaceProcessingTask processAssets:](self, "processAssets:", v6);
          if (v3) {
            goto LABEL_33;
          }
          [v6 removeAllObjects];
        }
      }
    }

    id v8 = -[NSArray countByEnumeratingWithState:objects:count:]( v7,  "countByEnumeratingWithState:objects:count:",  &v28,  v34,  16LL);
    if (v8) {
      continue;
    }
    break;
  }

- (int)run
{
  unsigned int v3 = -[VCPFaceAssetProcessingTask main](self, "main");
  uint64_t v4 = -[VCPFaceProcessingTask flush](self, "flush");
  int v6 = v4 | v3;
  if (v6)
  {
    uint64_t v7 = MediaAnalysisLogLevel(v4, v5);
    if ((int)v7 >= 4)
    {
      uint64_t v9 = VCPLogInstance(v7, v8);
      uint64_t v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
      os_log_type_t v11 = VCPLogToOSLogType[4];
      if (os_log_type_enabled(v10, v11))
      {
        *(_WORD *)BOOL v16 = 0;
        _os_log_impl((void *)&_mh_execute_header, v10, v11, "Face asset processing failed", v16, 2u);
      }
    }

    NSErrorUserInfoKey v17 = NSLocalizedDescriptionKey;
    uint64_t v18 = @"Face asset processing failed";
    v12 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v18,  &v17,  1LL));
    id completionHandler = (void (**)(id, void, void *))self->_completionHandler;
    unsigned int v14 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  NSOSStatusErrorDomain,  v6,  v12));
    completionHandler[2](completionHandler, 0LL, v14);
  }

  else
  {
    (*((void (**)(void))self->_completionHandler + 2))();
  }

  return v6;
}

- (void).cxx_destruct
{
}

@end