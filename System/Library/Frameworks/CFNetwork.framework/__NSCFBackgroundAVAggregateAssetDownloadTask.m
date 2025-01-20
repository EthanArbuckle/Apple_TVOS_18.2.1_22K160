@interface __NSCFBackgroundAVAggregateAssetDownloadTask
- (AVURLAsset)URLAsset;
- (BOOL)_isAVAssetTask;
- (BOOL)isKindOfClass:(Class)a3;
- (__NSCFBackgroundAVAggregateAssetDownloadTask)initWithTaskInfo:(id)a3 taskGroup:(id)a4 ident:(unint64_t)a5;
- (id)cookiesForCurrentRequest;
- (id)currentRequest;
- (id)originalRequest;
- (id)response;
- (void)URLSession:(id)a3 assetDownloadTask:(id)a4 didLoadTimeRange:(id *)a5 totalTimeRangesLoaded:(id)a6 timeRangeExpectedToLoad:(id *)a7;
- (void)URLSession:(id)a3 assetDownloadTask:(id)a4 willDownloadToURL:(id)a5;
- (void)URLSession:(id)a3 task:(id)a4 didCompleteWithError:(id)a5;
- (void)URLSession:(id)a3 task:(id)a4 willBeginDelayedRequest:(id)a5 completionHandler:(id)a6;
- (void)_onqueue_cancel;
- (void)_onqueue_resume;
- (void)_onqueue_suspend;
- (void)dealloc;
- (void)setURLAsset:(id)a3;
@end

@implementation __NSCFBackgroundAVAggregateAssetDownloadTask

- (__NSCFBackgroundAVAggregateAssetDownloadTask)initWithTaskInfo:(id)a3 taskGroup:(id)a4 ident:(unint64_t)a5
{
  v17[1] = *MEMORY[0x1895F89C0];
  v15.receiver = self;
  v15.super_class = (Class)&OBJC_CLASS_____NSCFBackgroundAVAggregateAssetDownloadTask;
  v6 = -[__NSCFBackgroundSessionTask initWithTaskInfo:taskGroup:ident:]( &v15,  sel_initWithTaskInfo_taskGroup_ident_,  a3,  a4,  a5);
  if (v6)
  {
    if ([a3 initializedWithAVAsset])
    {
      v6->_AVAssetDownloadToken = [a3 AVAssetDownloadToken];
      objc_msgSend(MEMORY[0x189607968], "numberWithUnsignedLongLong:", objc_msgSend(a3, "AVAssetDownloadToken"));
      double Helper_x8__OBJC_CLASS___AVURLAsset = gotLoadHelper_x8__OBJC_CLASS___AVURLAsset(v7);
      v10 = *(void **)(v9 + 3312);
      v16 = @"AVURLAssetDownloadTokenKey";
      v17[0] = v11;
      -[__NSCFBackgroundAVAggregateAssetDownloadTask setURLAsset:]( v6,  "setURLAsset:",  objc_msgSend( v10,  "URLAssetWithURL:options:",  0,  objc_msgSend( MEMORY[0x189603F68],  "dictionaryWithObjects:forKeys:count:",  v17,  &v16,  1,  Helper_x8__OBJC_CLASS___AVURLAsset)));
      v6->_childAssetDownloadTasksSessionIdentifier = (NSString *)(id)[a3 avAssetDownloadChildDownloadSessionIdentifier];
      if (v6->_childAssetDownloadTasksSessionIdentifier)
      {
        uint64_t v12 = -[NSURLSessionTask session](v6, "session");
        if (v12) {
          uint64_t v12 = *(void *)(v12 + 120);
        }
        v14[0] = MEMORY[0x1895F87A8];
        v14[1] = 3221225472LL;
        v14[2] = __81____NSCFBackgroundAVAggregateAssetDownloadTask_initWithTaskInfo_taskGroup_ident___block_invoke;
        v14[3] = &unk_189C1A548;
        v14[4] = v6;
        dispatch_async((dispatch_queue_t)v12, v14);
      }
    }

    else
    {

      return 0LL;
    }
  }

  return v6;
}

- (void)dealloc
{
  objc_setProperty_atomic_copy(self, v3, 0LL, 816LL);
  objc_setProperty_atomic_copy(self, v4, 0LL, 824LL);
  -[__NSCFBackgroundAVAggregateAssetDownloadTask setURLAsset:](self, "setURLAsset:", 0LL);
  objc_setProperty_atomic_copy(self, v5, 0LL, 832LL);
  objc_setProperty_atomic(self, v6, 0LL, 808LL);
  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS_____NSCFBackgroundAVAggregateAssetDownloadTask;
  -[__NSCFBackgroundSessionTask dealloc](&v7, sel_dealloc);
}

- (BOOL)isKindOfClass:(Class)a3
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS_____NSCFBackgroundAVAggregateAssetDownloadTask;
  if (-[__NSCFBackgroundAVAggregateAssetDownloadTask isKindOfClass:](&v6, sel_isKindOfClass_)) {
    return 1;
  }
  gotLoadHelper_x8__OBJC_CLASS___AVAggregateAssetDownloadTask(v4);
  return -[objc_class isEqual:](a3, "isEqual:", objc_opt_class());
}

- (id)originalRequest
{
  return -[__NSCFBackgroundAVAggregateAssetDownloadTask currentRequest](v2, v3);
}

- (id)currentRequest
{
  return -[__NSCFBackgroundAVAggregateAssetDownloadTask response](v2, v3);
}

- (id)response
{
  return (id)-[__NSCFBackgroundAVAggregateAssetDownloadTask _isAVAssetTask](v2, v3);
}

- (BOOL)_isAVAssetTask
{
  return 1;
}

- (void)_onqueue_resume
{
  uint64_t v15 = *MEMORY[0x1895F89C0];
  v13.receiver = self;
  v13.super_class = (Class)&OBJC_CLASS_____NSCFBackgroundAVAggregateAssetDownloadTask;
  -[__NSCFBackgroundSessionTask _onqueue_resume](&v13, sel__onqueue_resume);
  __int128 v11 = 0u;
  __int128 v12 = 0u;
  __int128 v9 = 0u;
  __int128 v10 = 0u;
  if (self) {
    childAssetDownloadTasks = self->_childAssetDownloadTasks;
  }
  else {
    childAssetDownloadTasks = 0LL;
  }
  uint64_t v4 = -[NSArray countByEnumeratingWithState:objects:count:]( childAssetDownloadTasks,  "countByEnumeratingWithState:objects:count:",  &v9,  v14,  16LL);
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v10;
    do
    {
      for (uint64_t i = 0LL; i != v5; ++i)
      {
        if (*(void *)v10 != v6) {
          objc_enumerationMutation(childAssetDownloadTasks);
        }
        v8 = *(void **)(*((void *)&v9 + 1) + 8 * i);
        if (objc_msgSend(v8, "state", (void)v9) == 1)
        {
          objc_msgSend(v8, "setEarliestBeginDate:", -[NSURLSessionTask earliestBeginDate](self, "earliestBeginDate"));
          [v8 resume];
        }
      }

      uint64_t v5 = -[NSArray countByEnumeratingWithState:objects:count:]( childAssetDownloadTasks,  "countByEnumeratingWithState:objects:count:",  &v9,  v14,  16LL);
    }

    while (v5);
  }

- (void)_onqueue_suspend
{
  v2 = self;
  uint64_t v14 = *MEMORY[0x1895F89C0];
  v12.receiver = self;
  v12.super_class = (Class)&OBJC_CLASS_____NSCFBackgroundAVAggregateAssetDownloadTask;
  -[__NSCFBackgroundSessionTask _onqueue_suspend](&v12, sel__onqueue_suspend);
  __int128 v10 = 0u;
  __int128 v11 = 0u;
  __int128 v8 = 0u;
  __int128 v9 = 0u;
  if (v2) {
    v2 = (__NSCFBackgroundAVAggregateAssetDownloadTask *)v2->_childAssetDownloadTasks;
  }
  uint64_t v3 = -[__NSCFBackgroundAVAggregateAssetDownloadTask countByEnumeratingWithState:objects:count:]( v2,  "countByEnumeratingWithState:objects:count:",  &v8,  v13,  16LL);
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v9;
    do
    {
      for (uint64_t i = 0LL; i != v4; ++i)
      {
        if (*(void *)v9 != v5) {
          objc_enumerationMutation(v2);
        }
        objc_super v7 = *(void **)(*((void *)&v8 + 1) + 8 * i);
        if (!objc_msgSend(v7, "state", (void)v8)) {
          [v7 suspend];
        }
      }

      uint64_t v4 = -[__NSCFBackgroundAVAggregateAssetDownloadTask countByEnumeratingWithState:objects:count:]( v2,  "countByEnumeratingWithState:objects:count:",  &v8,  v13,  16LL);
    }

    while (v4);
  }

- (void)_onqueue_cancel
{
  v2 = self;
  if (self) {
    self = (__NSCFBackgroundAVAggregateAssetDownloadTask *)self->_childAssetDownloadSession;
  }
  -[__NSCFBackgroundAVAggregateAssetDownloadTask invalidateAndCancel](self, "invalidateAndCancel");
  v3.receiver = v2;
  v3.super_class = (Class)&OBJC_CLASS_____NSCFBackgroundAVAggregateAssetDownloadTask;
  -[__NSCFBackgroundSessionTask _onqueue_cancel](&v3, sel__onqueue_cancel);
}

- (void)URLSession:(id)a3 task:(id)a4 didCompleteWithError:(id)a5
{
  __int128 v8 = -[NSURLSessionTask session](self, "session", a3);
  if (v8) {
    __int128 v8 = (NSURLSession *)v8->_workQueue;
  }
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = __85____NSCFBackgroundAVAggregateAssetDownloadTask_URLSession_task_didCompleteWithError___block_invoke;
  block[3] = &unk_189C1A610;
  block[4] = self;
  block[5] = a4;
  block[6] = a5;
  dispatch_async((dispatch_queue_t)v8, block);
}

- (void)URLSession:(id)a3 task:(id)a4 willBeginDelayedRequest:(id)a5 completionHandler:(id)a6
{
  __int128 v10 = -[NSURLSessionTask session](self, "session", a3);
  if (v10) {
    __int128 v10 = (NSURLSession *)v10->_workQueue;
  }
  v11[0] = MEMORY[0x1895F87A8];
  v11[1] = 3221225472LL;
  v11[2] = __106____NSCFBackgroundAVAggregateAssetDownloadTask_URLSession_task_willBeginDelayedRequest_completionHandler___block_invoke;
  v11[3] = &unk_189C15848;
  v11[4] = self;
  v11[5] = a4;
  v11[6] = a5;
  v11[7] = a6;
  dispatch_async((dispatch_queue_t)v10, v11);
}

- (void)URLSession:(id)a3 assetDownloadTask:(id)a4 willDownloadToURL:(id)a5
{
  __int128 v8 = -[NSURLSessionTask session](self, "session", a3);
  if (v8) {
    __int128 v8 = (NSURLSession *)v8->_workQueue;
  }
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = __95____NSCFBackgroundAVAggregateAssetDownloadTask_URLSession_assetDownloadTask_willDownloadToURL___block_invoke;
  block[3] = &unk_189C1A610;
  block[4] = self;
  block[5] = a4;
  block[6] = a5;
  dispatch_async((dispatch_queue_t)v8, block);
}

- (void)URLSession:(id)a3 assetDownloadTask:(id)a4 didLoadTimeRange:(id *)a5 totalTimeRangesLoaded:(id)a6 timeRangeExpectedToLoad:(id *)a7
{
  objc_super v12 = -[NSURLSessionTask session](self, "session", a3);
  if (v12) {
    objc_super v12 = (NSURLSession *)v12->_workQueue;
  }
  block[1] = 3221225472LL;
  __int128 v13 = *(_OWORD *)&a5->var0.var3;
  __int128 v18 = *(_OWORD *)&a5->var0.var0;
  __int128 v19 = v13;
  __int128 v14 = *(_OWORD *)&a5->var1.var1;
  __int128 v15 = *(_OWORD *)&a7->var1.var1;
  __int128 v16 = *(_OWORD *)&a7->var0.var0;
  __int128 v22 = *(_OWORD *)&a7->var0.var3;
  __int128 v23 = v15;
  block[0] = MEMORY[0x1895F87A8];
  block[2] = __140____NSCFBackgroundAVAggregateAssetDownloadTask_URLSession_assetDownloadTask_didLoadTimeRange_totalTimeRangesLoaded_timeRangeExpectedToLoad___block_invoke;
  block[3] = &unk_189C0B730;
  block[4] = self;
  block[5] = a4;
  block[6] = a6;
  __int128 v20 = v14;
  __int128 v21 = v16;
  dispatch_async((dispatch_queue_t)v12, block);
}

- (id)cookiesForCurrentRequest
{
  return 0LL;
}

- (AVURLAsset)URLAsset
{
  return (AVURLAsset *)objc_getProperty(self, a2, 792LL, 1);
}

- (void)setURLAsset:(id)a3
{
}

@end