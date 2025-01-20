@interface VCPHomeKitFragmentProcessingTask
+ (id)taskForAssetData:(id)a3 withAnalyzer:(id)a4 withOptions:(id)a5 andCompletionHandler:(id)a6;
- (BOOL)autoCancellable;
- (VCPHomeKitFragmentProcessingTask)init;
- (VCPHomeKitFragmentProcessingTask)initWithAssetData:(id)a3 analyzer:(id)a4 options:(id)a5 completionHandler:(id)a6;
- (float)resourceRequirement;
- (int)run;
- (void)cancel;
- (void)dealloc;
@end

@implementation VCPHomeKitFragmentProcessingTask

- (VCPHomeKitFragmentProcessingTask)init
{
  return 0LL;
}

- (VCPHomeKitFragmentProcessingTask)initWithAssetData:(id)a3 analyzer:(id)a4 options:(id)a5 completionHandler:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v21.receiver = self;
  v21.super_class = (Class)&OBJC_CLASS___VCPHomeKitFragmentProcessingTask;
  v15 = -[VCPHomeKitFragmentProcessingTask init](&v21, "init");
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_assetData, a3);
    atomic_store(0, (unsigned __int8 *)&v16->_started);
    atomic_store(0, (unsigned __int8 *)&v16->_cancel);
    objc_storeStrong((id *)&v16->_analyzer, a4);
    objc_storeStrong((id *)&v16->_options, a5);
    id v17 = objc_retainBlock(v14);
    id completionHandler = v16->_completionHandler;
    v16->_id completionHandler = v17;

    v19 = v16;
  }

  return v16;
}

+ (id)taskForAssetData:(id)a3 withAnalyzer:(id)a4 withOptions:(id)a5 andCompletionHandler:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  if (v10) {
    id v14 = [objc_alloc((Class)objc_opt_class(a1)) initWithAssetData:v10 analyzer:v11 options:v12 completionHandler:v13];
  }
  else {
    id v14 = 0LL;
  }

  return v14;
}

- (void)dealloc
{
  unsigned __int8 v3 = atomic_load((unsigned __int8 *)&self->_started);
  if ((v3 & 1) == 0)
  {
    id completionHandler = (void (**)(id, void, void *))self->_completionHandler;
    NSErrorUserInfoKey v9 = NSLocalizedDescriptionKey;
    v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Home video fragment processing task cancelled"));
    id v10 = v5;
    v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v10,  &v9,  1LL));
    v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  NSOSStatusErrorDomain,  -128LL,  v6));
    completionHandler[2](completionHandler, 0LL, v7);
  }

  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___VCPHomeKitFragmentProcessingTask;
  -[VCPHomeKitFragmentProcessingTask dealloc](&v8, "dealloc");
}

- (float)resourceRequirement
{
  return 0.25;
}

- (void)cancel
{
}

- (int)run
{
  unsigned __int8 v3 = atomic_load((unsigned __int8 *)&self->_cancel);
  if ((v3 & 1) != 0)
  {
    id completionHandler = (void (**)(id, void, void *))self->_completionHandler;
    NSErrorUserInfoKey v44 = NSLocalizedDescriptionKey;
    v24 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Home video fragment processing task cancelled"));
    v45 = v24;
    v25 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v45,  &v44,  1LL));
    v26 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  NSOSStatusErrorDomain,  -128LL,  v25));
    completionHandler[2](completionHandler, 0LL, v26);

    return -128;
  }

  else
  {
    uint64_t v36 = 0LL;
    v37 = &v36;
    uint64_t v38 = 0x3032000000LL;
    v39 = sub_10001E264;
    v40 = sub_10001E274;
    id v41 = 0LL;
    v34[0] = 0LL;
    v34[1] = v34;
    v34[2] = 0x3032000000LL;
    v34[3] = sub_10001E264;
    v34[4] = sub_10001E274;
    id v35 = 0LL;
    dispatch_semaphore_t v4 = dispatch_semaphore_create(0LL);
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[VCPWatchdog sharedWatchdog](&OBJC_CLASS___VCPWatchdog, "sharedWatchdog"));
    [v5 pet];

    assetData = self->_assetData;
    analyzer = self->_analyzer;
    options = self->_options;
    v30[0] = _NSConcreteStackBlock;
    v30[1] = 3221225472LL;
    v30[2] = sub_10001E27C;
    v30[3] = &unk_1001BA398;
    v32 = v34;
    v33 = &v36;
    NSErrorUserInfoKey v9 = v4;
    v31 = v9;
    -[HMIVideoAnalyzer handleAssetData:withOptions:completionHandler:]( analyzer,  "handleAssetData:withOptions:completionHandler:",  assetData,  options,  v30);
    dispatch_time_t v10 = dispatch_time(0LL, 60000000000LL);
    uint64_t v11 = dispatch_semaphore_wait(v9, v10);
    if (v11)
    {
      uint64_t v13 = MediaAnalysisLogLevel(v11, v12);
      if ((int)v13 >= 4)
      {
        uint64_t v15 = VCPLogInstance(v13, v14);
        v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(v15);
        os_log_type_t v17 = VCPLogToOSLogType[4];
        if (os_log_type_enabled(v16, v17))
        {
          *(_WORD *)v29 = 0;
          _os_log_impl((void *)&_mh_execute_header, v16, v17, "HMIVideoAnalyzer handle asset data timed-out", v29, 2u);
        }
      }

      v18 = (void (**)(id, void, void *))self->_completionHandler;
      NSErrorUserInfoKey v42 = NSLocalizedDescriptionKey;
      v19 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"HMIVideoAnalyzer handle asset data timed-out"));
      v43 = v19;
      v20 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v43,  &v42,  1LL));
      objc_super v21 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  NSOSStatusErrorDomain,  -23804LL,  v20));
      v18[2](v18, 0LL, v21);

      int v22 = -23804;
    }

    else
    {
      v27 = (void *)v37[5];
      if (v27) {
        int v22 = [v27 code];
      }
      else {
        int v22 = 0;
      }
      (*((void (**)(void))self->_completionHandler + 2))();
    }

    _Block_object_dispose(v34, 8);
    _Block_object_dispose(&v36, 8);
  }

  return v22;
}

- (BOOL)autoCancellable
{
  return 0;
}

- (void).cxx_destruct
{
}

@end