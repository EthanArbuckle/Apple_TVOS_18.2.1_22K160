@interface VCPHomeKitAnalysisServiceTask
+ (BOOL)isPerFrameAnalysisEnabled;
+ (id)taskForFragmentData:(id)a3 withProperties:(id)a4 andProgressHandler:(id)a5 andCompletionHandler:(id)a6;
+ (id)taskForFragmentSurface:(id)a3 withProperties:(id)a4 andProgressHandler:(id)a5 andCompletionHandler:(id)a6;
- (BOOL)autoCancellable;
- (VCPHomeKitAnalysisServiceTask)init;
- (VCPHomeKitAnalysisServiceTask)initWithFragmentData:(id)a3 properties:(id)a4 progressHandler:(id)a5 completionHandler:(id)a6;
- (VCPHomeKitAnalysisServiceTask)initWithFragmentSurface:(id)a3 properties:(id)a4 progressHandler:(id)a5 completionHandler:(id)a6;
- (float)resourceRequirement;
- (int)run;
- (void)cancel;
- (void)runFragmentLevelAnalysis;
- (void)runFrameLevelAnalysis;
@end

@implementation VCPHomeKitAnalysisServiceTask

+ (BOOL)isPerFrameAnalysisEnabled
{
  return 0;
}

- (VCPHomeKitAnalysisServiceTask)init
{
  return 0LL;
}

- (VCPHomeKitAnalysisServiceTask)initWithFragmentData:(id)a3 properties:(id)a4 progressHandler:(id)a5 completionHandler:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  v13 = (Block_layout *)a5;
  v14 = (Block_layout *)a6;
  v29.receiver = self;
  v29.super_class = (Class)&OBJC_CLASS___VCPHomeKitAnalysisServiceTask;
  v15 = -[VCPHomeKitAnalysisServiceTask init](&v29, "init");
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_fragmentData, a3);
    *(_WORD *)&v16->_cancel = 0;
    v16->_requestID = -1;
    if (v13) {
      v17 = v13;
    }
    else {
      v17 = &stru_1001BA2C8;
    }
    v18 = objc_retainBlock(v17);
    id progressHandler = v16->_progressHandler;
    v16->_id progressHandler = v18;

    if (v14) {
      v20 = v14;
    }
    else {
      v20 = &stru_1001BA308;
    }
    v21 = objc_retainBlock(v20);
    id completionHandler = v16->_completionHandler;
    v16->_id completionHandler = v21;

    objc_storeStrong((id *)&v16->_properties, a4);
    v23 = (HMIAnalysisService *)objc_alloc_init((Class)sub_10001A840());
    analysisService = v16->_analysisService;
    v16->_analysisService = v23;

    dispatch_queue_t v25 = dispatch_queue_create("com.apple.mediaanalysisd.homekittaskmanagment", 0LL);
    managementQueue = v16->_managementQueue;
    v16->_managementQueue = (OS_dispatch_queue *)v25;

    v27 = v16;
  }

  return v16;
}

- (VCPHomeKitAnalysisServiceTask)initWithFragmentSurface:(id)a3 properties:(id)a4 progressHandler:(id)a5 completionHandler:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  v13 = (Block_layout *)a5;
  v14 = (Block_layout *)a6;
  v29.receiver = self;
  v29.super_class = (Class)&OBJC_CLASS___VCPHomeKitAnalysisServiceTask;
  v15 = -[VCPHomeKitAnalysisServiceTask init](&v29, "init");
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_fragmentSurface, a3);
    *(_WORD *)&v16->_cancel = 0;
    v16->_requestID = -1;
    if (v13) {
      v17 = v13;
    }
    else {
      v17 = &stru_1001BA328;
    }
    v18 = objc_retainBlock(v17);
    id progressHandler = v16->_progressHandler;
    v16->_id progressHandler = v18;

    if (v14) {
      v20 = v14;
    }
    else {
      v20 = &stru_1001BA348;
    }
    v21 = objc_retainBlock(v20);
    id completionHandler = v16->_completionHandler;
    v16->_id completionHandler = v21;

    objc_storeStrong((id *)&v16->_properties, a4);
    v23 = (HMIAnalysisService *)objc_alloc_init((Class)sub_10001A840());
    analysisService = v16->_analysisService;
    v16->_analysisService = v23;

    dispatch_queue_t v25 = dispatch_queue_create("com.apple.mediaanalysisd.homekittaskmanagment", 0LL);
    managementQueue = v16->_managementQueue;
    v16->_managementQueue = (OS_dispatch_queue *)v25;

    v27 = v16;
  }

  return v16;
}

+ (id)taskForFragmentData:(id)a3 withProperties:(id)a4 andProgressHandler:(id)a5 andCompletionHandler:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  if (v10) {
    id v14 = [objc_alloc((Class)objc_opt_class(a1)) initWithFragmentData:v10 properties:v11 progressHandler:v12 completionHandler:v13];
  }
  else {
    id v14 = 0LL;
  }

  return v14;
}

+ (id)taskForFragmentSurface:(id)a3 withProperties:(id)a4 andProgressHandler:(id)a5 andCompletionHandler:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  if (v10) {
    id v14 = [objc_alloc((Class)objc_opt_class(a1)) initWithFragmentSurface:v10 properties:v11 progressHandler:v12 completionHandler:v13];
  }
  else {
    id v14 = 0LL;
  }

  return v14;
}

- (float)resourceRequirement
{
  return 0.25;
}

- (void)cancel
{
  managementQueue = (dispatch_queue_s *)self->_managementQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10001AC38;
  block[3] = &unk_1001BA0C8;
  block[4] = self;
  dispatch_sync(managementQueue, block);
}

- (void)runFragmentLevelAnalysis
{
  uint64_t v5 = 0LL;
  v6 = &v5;
  uint64_t v7 = 0x3032000000LL;
  v8 = sub_10001ADBC;
  v9 = sub_10001ADCC;
  dispatch_semaphore_t v10 = dispatch_semaphore_create(0LL);
  managementQueue = (dispatch_queue_s *)self->_managementQueue;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = sub_10001ADD4;
  v4[3] = &unk_1001BA008;
  v4[4] = self;
  v4[5] = &v5;
  dispatch_sync(managementQueue, v4);
  dispatch_semaphore_wait((dispatch_semaphore_t)v6[5], 0xFFFFFFFFFFFFFFFFLL);
  _Block_object_dispose(&v5, 8);
}

- (void)runFrameLevelAnalysis
{
  context = objc_autoreleasePoolPush();
  id progressHandler = (void (**)(double))self->_progressHandler;
  if (progressHandler) {
    progressHandler[2](0.0);
  }
  CFStringRef v36 = kCVPixelBufferPixelFormatTypeKey;
  v37 = &off_1001C7A60;
  v20 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v37,  &v36,  1LL));
  v18 = (void *)objc_claimAutoreleasedReturnValue( +[VCPInMemoryAVAsset assetWithData:]( &OBJC_CLASS___VCPInMemoryAVAsset,  "assetWithData:",  self->_fragmentData));
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "vcp_firstEnabledTrackWithMediaType:", AVMediaTypeVideo));
  v4 = (void *)objc_claimAutoreleasedReturnValue( +[AVAssetReader assetReaderWithAsset:error:]( &OBJC_CLASS___AVAssetReader,  "assetReaderWithAsset:error:",  v18,  0LL));
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue( +[AVAssetReaderTrackOutput assetReaderTrackOutputWithTrack:outputSettings:]( &OBJC_CLASS___AVAssetReaderTrackOutput,  "assetReaderTrackOutputWithTrack:outputSettings:",  v19,  v20));
  if (([v4 canAddOutput:v5] & 1) != 0
    && ([v4 addOutput:v5], objc_msgSend(v4, "startReading")))
  {
    uint64_t v30 = 0LL;
    v31 = &v30;
    uint64_t v32 = 0x3032000000LL;
    v33 = sub_10001ADBC;
    v34 = sub_10001ADCC;
    v35 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
    uint64_t v26 = 0LL;
    v27 = &v26;
    uint64_t v28 = 0x2020000000LL;
    char v29 = 0;
    dispatch_semaphore_t v6 = dispatch_semaphore_create(0LL);
    while (1)
    {
      CMSampleBufferRef sbuf = (CMSampleBufferRef)[v5 copyNextSampleBuffer];
      if (!sbuf) {
        break;
      }
      v21[0] = _NSConcreteStackBlock;
      v21[1] = 3221225472LL;
      v21[2] = sub_10001B4D0;
      v21[3] = &unk_1001BA398;
      v23 = &v26;
      v24 = &v30;
      uint64_t v7 = v6;
      v22 = v7;
      v8 = objc_retainBlock(v21);
      self->_requestID = -[HMIAnalysisService requestAnalysisForPixelBuffer:withProperties:andCompletionHandler:]( self->_analysisService,  "requestAnalysisForPixelBuffer:withProperties:andCompletionHandler:",  CMSampleBufferGetImageBuffer(sbuf),  self->_properties,  v8);
      dispatch_semaphore_wait(v7, 0xFFFFFFFFFFFFFFFFLL);
      BOOL v9 = *((_BYTE *)v27 + 24) == 0;

      if (!v9) {
        break;
      }
      sub_10000421C((const void **)&sbuf);
    }

    sub_10000421C((const void **)&sbuf);
    id v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObject:forKey:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObject:forKey:",  v31[5],  @"frameResults"));
    if ([v4 status] == (id)2)
    {
      id v12 = (void (**)(double))self->_progressHandler;
      if (v12) {
        v12[2](100.0);
      }
      id completionHandler = (void (**)(id, void, void *))self->_completionHandler;
      if (*((_BYTE *)v27 + 24))
      {
        id v14 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  NSOSStatusErrorDomain,  -18LL,  0LL));
        completionHandler[2](completionHandler, 0LL, v14);
      }

      else
      {
        ((void (**)(id, void *, void *))completionHandler)[2](self->_completionHandler, v11, 0LL);
      }

      int v10 = 0;
    }

    else
    {
      int v10 = -18;
    }

    _Block_object_dispose(&v26, 8);
    _Block_object_dispose(&v30, 8);
  }

  else
  {
    int v10 = -19;
  }

  objc_autoreleasePoolPop(context);
  if (v10)
  {
    v15 = (void (**)(id, void, void *))self->_completionHandler;
    v16 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  NSOSStatusErrorDomain,  v10,  0LL));
    v15[2](v15, 0LL, v16);
  }

- (int)run
{
  else {
    -[VCPHomeKitAnalysisServiceTask runFragmentLevelAnalysis](self, "runFragmentLevelAnalysis");
  }
  return 0;
}

- (BOOL)autoCancellable
{
  return 0;
}

- (void).cxx_destruct
{
}

@end