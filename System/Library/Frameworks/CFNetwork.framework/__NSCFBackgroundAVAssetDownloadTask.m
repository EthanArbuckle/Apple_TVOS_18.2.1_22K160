@interface __NSCFBackgroundAVAssetDownloadTask
- (AVURLAsset)URLAsset;
- (BOOL)_isAVAssetTask;
- (BOOL)isKindOfClass:(Class)a3;
- (NSArray)loadedTimeRanges;
- (NSDictionary)options;
- (NSURL)URL;
- (NSURL)destinationURL;
- (__NSCFBackgroundAVAssetDownloadTask)initWithTaskGroup:(id)a3 URLAsset:(id)a4 URL:(id)a5 destinationURL:(id)a6 temporaryDestinationURL:(id)a7 assetTitle:(id)a8 assetArtworkData:(id)a9 ident:(unint64_t)a10 enableSPIDelegateCallbacks:(BOOL)a11;
- (__NSCFBackgroundAVAssetDownloadTask)initWithTaskInfo:(id)a3 taskGroup:(id)a4 ident:(unint64_t)a5;
- (id)cookiesForCurrentRequest;
- (id)currentRequest;
- (id)originalRequest;
- (id)progress;
- (id)response;
- (unint64_t)AVAssetDownloadToken;
- (void)_finishProgressReporting;
- (void)_onqueue_didFinishDownloadingToURL:(id)a3;
- (void)_onqueue_didFinishWithError:(id)a3;
- (void)_onqueue_didLoadTimeRange:(id)a3 totalTimeRangesLoaded:(id)a4 timeRangeExpectedToLoad:(id)a5 forMediaSelectionPropertyList:(id)a6;
- (void)_onqueue_didReceiveProgressUpdateWithTotalBytesWritten:(int64_t)a3 totalBytesExpectedToWrite:(int64_t)a4;
- (void)_onqueue_didResolveMediaSelectionPropertyList:(id)a3;
- (void)_onqueue_willDownloadToURL:(id)a3;
- (void)_onqueue_willDownloadVariants:(id)a3;
- (void)dealloc;
- (void)setAVAssetDownloadToken:(unint64_t)a3;
- (void)setDestinationURL:(id)a3;
- (void)setLoadedTimeRanges:(id)a3;
- (void)setOptions:(id)a3;
- (void)setURL:(id)a3;
- (void)setURLAsset:(id)a3;
@end

@implementation __NSCFBackgroundAVAssetDownloadTask

- (__NSCFBackgroundAVAssetDownloadTask)initWithTaskGroup:(id)a3 URLAsset:(id)a4 URL:(id)a5 destinationURL:(id)a6 temporaryDestinationURL:(id)a7 assetTitle:(id)a8 assetArtworkData:(id)a9 ident:(unint64_t)a10 enableSPIDelegateCallbacks:(BOOL)a11
{
  if (objc_opt_class())
  {
    v25.receiver = self;
    v25.super_class = (Class)&OBJC_CLASS_____NSCFBackgroundAVAssetDownloadTask;
    v19 = -[__NSCFBackgroundSessionTask initWithOriginalRequest:ident:taskGroup:]( &v25,  sel_initWithOriginalRequest_ident_taskGroup_,  0LL,  a10,  a3);
    v20 = v19;
    if (v19)
    {
      -[__NSCFBackgroundAVAssetDownloadTask setURL:](v19, "setURL:", a5);
      -[__NSCFBackgroundAVAssetDownloadTask setURLAsset:](v20, "setURLAsset:", a4);
      -[__NSCFBackgroundAVAssetDownloadTask setDestinationURL:](v20, "setDestinationURL:", a6);
      objc_setProperty_atomic_copy(v20, v21, a7, 856LL);
      objc_setProperty_atomic_copy(v20, v22, a8, 864LL);
      objc_setProperty_atomic_copy(v20, v23, a9, 872LL);
      v20->_enableSPIDelegateCallbacks = a11;
      v20->_progressLock._os_unfair_lock_opaque = 0;
    }

    return v20;
  }

  else
  {
    result = (__NSCFBackgroundAVAssetDownloadTask *)_os_crash();
    __break(1u);
  }

  return result;
}

- (__NSCFBackgroundAVAssetDownloadTask)initWithTaskInfo:(id)a3 taskGroup:(id)a4 ident:(unint64_t)a5
{
  v21[1] = *MEMORY[0x1895F89C0];
  v19.receiver = self;
  v19.super_class = (Class)&OBJC_CLASS_____NSCFBackgroundAVAssetDownloadTask;
  v6 = -[__NSCFBackgroundSessionTask initWithTaskInfo:taskGroup:ident:]( &v19,  sel_initWithTaskInfo_taskGroup_ident_,  a3,  a4,  a5);
  if (v6)
  {
    -[__NSCFBackgroundAVAssetDownloadTask setURL:](v6, "setURL:", [a3 URL]);
    -[__NSCFBackgroundAVAssetDownloadTask setDestinationURL:]( v6,  "setDestinationURL:",  [a3 destinationURL]);
    -[__NSCFBackgroundAVAssetDownloadTask setAVAssetDownloadToken:]( v6,  "setAVAssetDownloadToken:",  [a3 AVAssetDownloadToken]);
    if ([a3 initializedWithAVAsset])
    {
      objc_msgSend(MEMORY[0x189607968], "numberWithUnsignedLongLong:", objc_msgSend(a3, "AVAssetDownloadToken"));
      double Helper_x8__OBJC_CLASS___AVURLAsset = gotLoadHelper_x8__OBJC_CLASS___AVURLAsset(v7);
      v10 = *(void **)(v9 + 3312);
      v20 = @"AVURLAssetDownloadTokenKey";
      v21[0] = v11;
      -[__NSCFBackgroundAVAssetDownloadTask setURLAsset:]( v6,  "setURLAsset:",  objc_msgSend( v10,  "URLAssetWithURL:options:",  0,  objc_msgSend( MEMORY[0x189603F68],  "dictionaryWithObjects:forKeys:count:",  v21,  &v20,  1,  Helper_x8__OBJC_CLASS___AVURLAsset)));
      if ([a3 resolvedMediaSelectionPlist])
      {
        gotLoadHelper_x8__OBJC_CLASS___AVMediaSelection(v12);
        id v14 = (id)objc_msgSend( objc_alloc(*(Class *)(v13 + 3304)),  "initWithAsset:propertyList:",  -[__NSCFBackgroundAVAssetDownloadTask URLAsset](v6, "URLAsset"),  objc_msgSend(a3, "resolvedMediaSelectionPlist"));
        objc_setProperty_atomic_copy(v6, v15, v14, 880LL);
      }
    }

    v16 = (void *)[a3 temporaryDestinationURL];
    objc_setProperty_atomic_copy(v6, v17, v16, 856LL);
    v6->_enableSPIDelegateCallbacks = [a3 enableSPIDelegateCallbacks];
    v6->_progressLock._os_unfair_lock_opaque = 0;
  }

  return v6;
}

- (void)dealloc
{
  if (self)
  {
    objc_setProperty_atomic_copy(self, v3, 0LL, 856LL);
    -[__NSCFBackgroundAVAssetDownloadTask setLoadedTimeRanges:](self, "setLoadedTimeRanges:", 0LL);
    objc_setProperty_atomic_copy(self, v4, 0LL, 880LL);
    -[__NSCFBackgroundAVAssetDownloadTask setURLAsset:](self, "setURLAsset:", 0LL);
    objc_setProperty_atomic_copy(self, v5, 0LL, 872LL);
    objc_setProperty_atomic_copy(self, v6, 0LL, 864LL);
  }

  else
  {
    [0 setLoadedTimeRanges:0];
    [0 setURLAsset:0];
  }

  -[__NSCFBackgroundAVAssetDownloadTask setOptions:](self, "setOptions:", 0LL);

  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS_____NSCFBackgroundAVAssetDownloadTask;
  -[__NSCFBackgroundSessionTask dealloc](&v7, sel_dealloc);
}

- (void)_onqueue_didReceiveProgressUpdateWithTotalBytesWritten:(int64_t)a3 totalBytesExpectedToWrite:(int64_t)a4
{
  if (-[NSURLSessionTask countOfBytesReceived](self, "countOfBytesReceived") != a3
    || -[NSURLSessionTask countOfBytesExpectedToReceive](self, "countOfBytesExpectedToReceive") != a4)
  {
    if (self)
    {
      if (self->_enableSPIDelegateCallbacks)
      {
        if (-[NSURLSessionTask session](self, "session"))
        {
          if ((objc_opt_respondsToSelector() & 1) != 0)
          {
            objc_super v7 = -[NSURLSessionTask session](self, "session");
            int64_t v8 = -[NSURLSessionTask countOfBytesReceived](self, "countOfBytesReceived");
            if (v7)
            {
              int64_t v9 = a3 - v8;
              uint64_t v11 = MEMORY[0x1895F87A8];
              uint64_t v12 = 3221225472LL;
              uint64_t v13 = __102__NSURLSession_delegate_AVAssetDownloadTask_didWriteData_totalBytesWritten_totalBytesExpectedToWrite___block_invoke;
              id v14 = &unk_189C13648;
              delegateDispatchQueue = (dispatch_queue_s *)v7->_delegateDispatchQueue;
              delegate_ivar = v7->_delegate_ivar;
              v16 = v7;
              SEL v17 = self;
              int64_t v18 = v9;
              int64_t v19 = a3;
              int64_t v20 = a4;
              if (delegateDispatchQueue) {
                dispatch_async(delegateDispatchQueue, &v11);
              }
              else {
                -[NSOperationQueue addOperationWithBlock:](v7->_delegateQueue_ivar, "addOperationWithBlock:", &v11);
              }
            }
          }
        }
      }
    }

    -[NSURLSessionTask setCountOfBytesReceived:]( self,  "setCountOfBytesReceived:",  a3,  v11,  v12,  v13,  v14,  delegate_ivar,  v16,  v17,  v18,  v19,  v20);
    -[NSURLSessionTask setCountOfBytesExpectedToReceive:](self, "setCountOfBytesExpectedToReceive:", a4);
    os_unfair_lock_lock(&self->_progressLock);
    -[NSProgress setTotalUnitCount:](self->_progress, "setTotalUnitCount:", a4);
    -[NSProgress setCompletedUnitCount:](self->_progress, "setCompletedUnitCount:", a3);
    os_unfair_lock_unlock(&self->_progressLock);
  }

- (void)_onqueue_didLoadTimeRange:(id)a3 totalTimeRangesLoaded:(id)a4 timeRangeExpectedToLoad:(id)a5 forMediaSelectionPropertyList:(id)a6
{
  if (-[NSURLSessionTask session](self, "session") && (objc_opt_respondsToSelector() & 1) != 0)
  {
    v10 = -[NSURLSessionTask session](self, "session");
    if (a3)
    {
      [a3 CMTimeRangeValue];
      if (a5) {
        goto LABEL_5;
      }
    }

    else
    {
      __int128 v17 = 0u;
      __int128 v18 = 0u;
      __int128 v16 = 0u;
      if (a5)
      {
LABEL_5:
        [a5 CMTimeRangeValue];
        if (!v10) {
          return;
        }
        goto LABEL_9;
      }
    }

    __int128 v14 = 0u;
    __int128 v15 = 0u;
    __int128 v13 = 0u;
    if (!v10) {
      return;
    }
LABEL_9:
    delegate_ivar = v10->_delegate_ivar;
    block[0] = MEMORY[0x1895F87A8];
    block[1] = 3221225472LL;
    block[2] = __108__NSURLSession_delegate_AVAssetDownloadTask_didLoadTimeRange_totalTimeRangesLoaded_timeRangeExpectedToLoad___block_invoke;
    block[3] = &unk_189C13698;
    block[4] = delegate_ivar;
    block[5] = v10;
    __int128 v20 = v16;
    __int128 v21 = v17;
    block[6] = self;
    block[7] = a4;
    __int128 v22 = v18;
    __int128 v23 = v13;
    __int128 v24 = v14;
    __int128 v25 = v15;
    delegateDispatchQueue = (dispatch_queue_s *)v10->_delegateDispatchQueue;
    if (delegateDispatchQueue) {
      dispatch_async(delegateDispatchQueue, block);
    }
    else {
      -[NSOperationQueue addOperationWithBlock:](v10->_delegateQueue_ivar, "addOperationWithBlock:", block);
    }
  }

- (void)_onqueue_didResolveMediaSelectionPropertyList:(id)a3
{
  id v7 = (id)objc_msgSend( objc_alloc(*(Class *)(v6 + 3304)),  "initWithAsset:propertyList:",  -[__NSCFBackgroundAVAssetDownloadTask URLAsset](self, "URLAsset"),  a3);
  if (self) {
    objc_setProperty_atomic_copy(self, v8, v7, 880LL);
  }
  if (-[NSURLSessionTask session](self, "session") && (objc_opt_respondsToSelector() & 1) != 0)
  {
    int64_t v9 = -[NSURLSessionTask session](self, "session");
    uint64_t v11 = v9;
    if (self)
    {
      id Property = objc_getProperty(self, v10, 880LL, 1);
      int64_t v9 = v11;
      __int128 v13 = self;
    }

    else
    {
      __int128 v13 = 0LL;
      id Property = 0LL;
    }

    -[NSURLSession delegate_AVAssetDownloadTask:didResolveMediaSelection:]((uint64_t)v9, (uint64_t)v13, (uint64_t)Property);
  }

- (void)_onqueue_didFinishDownloadingToURL:(id)a3
{
  if (-[NSURLSessionTask session](self, "session"))
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      SEL v5 = -[NSURLSessionTask session](self, "session");
      if (v5)
      {
        block[0] = MEMORY[0x1895F87A8];
        block[1] = 3221225472LL;
        block[2] = __89__NSURLSession_delegate_AVAssetDownloadTask_didFinishDownloadingToURL_completionHandler___block_invoke;
        block[3] = &unk_189C1A240;
        delegateDispatchQueue = (dispatch_queue_s *)v5->_delegateDispatchQueue;
        block[4] = v5->_delegate_ivar;
        block[5] = v5;
        block[6] = self;
        block[7] = a3;
        void block[8] = &__block_literal_global_192;
        if (delegateDispatchQueue) {
          dispatch_async(delegateDispatchQueue, block);
        }
        else {
          -[NSOperationQueue addOperationWithBlock:](v5->_delegateQueue_ivar, "addOperationWithBlock:", block);
        }
      }
    }
  }

- (void)_onqueue_willDownloadToURL:(id)a3
{
  if (-[__NSCFBackgroundAVAssetDownloadTask URLAsset](self, "URLAsset"))
  {
    double Helper_x8__OBJC_CLASS___AVAssetDownloadSession = gotLoadHelper_x8__OBJC_CLASS___AVAssetDownloadSession(v5);
    objc_msgSend( *(id *)(v7 + 3296),  "registerDownloadLocation:forURLAsset:",  a3,  -[__NSCFBackgroundAVAssetDownloadTask URLAsset](self, "URLAsset", Helper_x8__OBJC_CLASS___AVAssetDownloadSession));
  }

  if (-[NSURLSessionTask session](self, "session"))
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      int64_t v8 = -[NSURLSessionTask session](self, "session");
      if (v8)
      {
        v10[0] = MEMORY[0x1895F87A8];
        v10[1] = 3221225472LL;
        v10[2] = __63__NSURLSession_delegate_AVAssetDownloadTask_willDownloadToURL___block_invoke;
        v10[3] = &unk_189C136C0;
        delegateDispatchQueue = (dispatch_queue_s *)v8->_delegateDispatchQueue;
        v10[4] = v8->_delegate_ivar;
        v10[5] = v8;
        v10[6] = self;
        v10[7] = a3;
        if (delegateDispatchQueue) {
          dispatch_async(delegateDispatchQueue, v10);
        }
        else {
          -[NSOperationQueue addOperationWithBlock:](v8->_delegateQueue_ivar, "addOperationWithBlock:", v10);
        }
      }
    }
  }

- (void)_onqueue_didFinishWithError:(id)a3
{
  uint64_t v27 = *MEMORY[0x1895F89C0];
  if (a3)
  {
    double v5 = (void *)[a3 domain];
    uint64_t v6 = [a3 code];
    if (!self || v6 != -999) {
      goto LABEL_20;
    }
  }

  else if (!self)
  {
    goto LABEL_20;
  }

  if (objc_getProperty(self, a2, 856LL, 1))
  {
    uint64_t v7 = (void *)[MEMORY[0x1896078A8] defaultManager];
    if (objc_msgSend(v7, "fileExistsAtPath:", objc_msgSend(objc_getProperty(self, v8, 856, 1), "path")))
    {
      uint64_t v20 = 0LL;
      if (objc_msgSend( (id)objc_msgSend(MEMORY[0x1896078A8], "defaultManager"),  "fileExistsAtPath:",  -[NSURL path]( -[__NSCFBackgroundAVAssetDownloadTask destinationURL](self, "destinationURL"),  "path"))
        && (objc_msgSend( (id)objc_msgSend(MEMORY[0x1896078A8], "defaultManager"),  "removeItemAtURL:error:",  -[__NSCFBackgroundAVAssetDownloadTask destinationURL](self, "destinationURL"),  &v20) & 1) == 0)
      {
        if (CFNLog::onceToken != -1) {
          dispatch_once(&CFNLog::onceToken, &__block_literal_global_1_4717);
        }
        int64_t v9 = (os_log_s *)CFNLog::logger;
        if (os_log_type_enabled((os_log_t)CFNLog::logger, OS_LOG_TYPE_ERROR))
        {
          uint64_t v17 = v20;
          __int128 v18 = -[__NSCFBackgroundAVAssetDownloadTask destinationURL](self, "destinationURL");
          *(_DWORD *)buf = 138412546;
          uint64_t v22 = v17;
          __int16 v23 = 2112;
          __int128 v24 = v18;
          _os_log_error_impl( &dword_18298D000,  v9,  OS_LOG_TYPE_ERROR,  "Background download error %@ removing item at %@",  buf,  0x16u);
        }
      }

      v10 = (void *)[MEMORY[0x1896078A8] defaultManager];
      if ((objc_msgSend( v10,  "linkItemAtURL:toURL:error:",  objc_getProperty(self, v11, 856, 1),  -[__NSCFBackgroundAVAssetDownloadTask destinationURL](self, "destinationURL"),  &v20) & 1) == 0)
      {
        if (CFNLog::onceToken != -1) {
          dispatch_once(&CFNLog::onceToken, &__block_literal_global_1_4717);
        }
        uint64_t v12 = (os_log_s *)CFNLog::logger;
        if (os_log_type_enabled((os_log_t)CFNLog::logger, OS_LOG_TYPE_ERROR))
        {
          uint64_t v14 = v20;
          id Property = (NSURL *)objc_getProperty(self, v13, 856LL, 1);
          __int128 v16 = -[__NSCFBackgroundAVAssetDownloadTask destinationURL](self, "destinationURL");
          *(_DWORD *)buf = 138412802;
          uint64_t v22 = v14;
          __int16 v23 = 2112;
          __int128 v24 = Property;
          __int16 v25 = 2112;
          v26 = v16;
          _os_log_error_impl( &dword_18298D000,  v12,  OS_LOG_TYPE_ERROR,  "Background download error %@ linking item at %@ to %@",  buf,  0x20u);
        }
      }
    }
  }

- (void)_onqueue_willDownloadVariants:(id)a3
{
  if (-[NSURLSessionTask session](self, "session"))
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      double v5 = -[NSURLSessionTask session](self, "session");
      if (v5)
      {
        v7[0] = MEMORY[0x1895F87A8];
        v7[1] = 3221225472LL;
        v7[2] = __66__NSURLSession_delegate_AVAssetDownloadTask_willDownloadVariants___block_invoke;
        v7[3] = &unk_189C136C0;
        delegateDispatchQueue = (dispatch_queue_s *)v5->_delegateDispatchQueue;
        v7[4] = v5->_delegate_ivar;
        v7[5] = v5;
        v7[6] = self;
        v7[7] = a3;
        if (delegateDispatchQueue) {
          dispatch_async(delegateDispatchQueue, v7);
        }
        else {
          -[NSOperationQueue addOperationWithBlock:](v5->_delegateQueue_ivar, "addOperationWithBlock:", v7);
        }
      }
    }
  }

- (BOOL)isKindOfClass:(Class)a3
{
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS_____NSCFBackgroundAVAssetDownloadTask;
  if (-[__NSCFBackgroundAVAssetDownloadTask isKindOfClass:](&v5, sel_isKindOfClass_)
    || (-[objc_class isEqual:](a3, "isEqual:", objc_opt_class()) & 1) != 0)
  {
    return 1;
  }

  else
  {
    return -[objc_class isEqual:](a3, "isEqual:", objc_opt_class());
  }

- (id)originalRequest
{
  return -[__NSCFBackgroundAVAssetDownloadTask currentRequest](v2, v3);
}

- (id)currentRequest
{
  uint64_t v9 = *MEMORY[0x1895F89C0];
  if (CFNLog::onceToken != -1) {
    dispatch_once(&CFNLog::onceToken, &__block_literal_global_1_4717);
  }
  SEL v3 = (os_log_s *)CFNLog::logger;
  if (os_log_type_enabled((os_log_t)CFNLog::logger, OS_LOG_TYPE_DEBUG))
  {
    int v5 = 138412546;
    uint64_t v6 = objc_opt_class();
    __int16 v7 = 2048;
    SEL v8 = self;
    _os_log_debug_impl( &dword_18298D000,  v3,  OS_LOG_TYPE_DEBUG,  "%@<%p> simulating currentRequest property",  (uint8_t *)&v5,  0x16u);
  }

  return +[NSURLRequest requestWithURL:](&OBJC_CLASS___NSURLRequest, "requestWithURL:", self->_URL);
}

- (id)response
{
  return (id)-[__NSCFBackgroundAVAssetDownloadTask _isAVAssetTask](v2, v3);
}

- (BOOL)_isAVAssetTask
{
  return 1;
}

- (id)progress
{
  p_progressLock = &self->_progressLock;
  os_unfair_lock_lock(&self->_progressLock);
  if (!self->_progress)
  {
    if (-[NSURLSessionTask countOfBytesExpectedToReceive](self, "countOfBytesExpectedToReceive") < 1) {
      int64_t v4 = -1LL;
    }
    else {
      int64_t v4 = -[NSURLSessionTask countOfBytesExpectedToReceive](self, "countOfBytesExpectedToReceive");
    }
    self->_progress = (NSProgress *)(id)[MEMORY[0x1896079E0] progressWithTotalUnitCount:v4];
    if (-[NSURLSessionTask countOfBytesReceived](self, "countOfBytesReceived") >= 1) {
      -[NSProgress setCompletedUnitCount:]( self->_progress,  "setCompletedUnitCount:",  -[NSURLSessionTask countOfBytesReceived](self, "countOfBytesReceived"));
    }
    uint64_t v5 = MEMORY[0x1895F87A8];
    v9[0] = MEMORY[0x1895F87A8];
    v9[1] = 3221225472LL;
    v9[2] = __47____NSCFBackgroundAVAssetDownloadTask_progress__block_invoke;
    v9[3] = &unk_189C1A548;
    v9[4] = self;
    -[NSProgress setCancellationHandler:](self->_progress, "setCancellationHandler:", v9);
    v8[0] = v5;
    v8[1] = 3221225472LL;
    v8[2] = __47____NSCFBackgroundAVAssetDownloadTask_progress__block_invoke_2;
    v8[3] = &unk_189C1A548;
    v8[4] = self;
    -[NSProgress setPausingHandler:](self->_progress, "setPausingHandler:", v8);
    v7[0] = v5;
    v7[1] = 3221225472LL;
    v7[2] = __47____NSCFBackgroundAVAssetDownloadTask_progress__block_invoke_3;
    v7[3] = &unk_189C1A548;
    v7[4] = self;
    -[NSProgress setResumingHandler:](self->_progress, "setResumingHandler:", v7);
  }

  os_unfair_lock_unlock(p_progressLock);
  return self->_progress;
}

- (void)_finishProgressReporting
{
  if (!self->_didCleanupProgress)
  {
    self->_didCleanupProgress = 1;
    p_progressLock = &self->_progressLock;
    os_unfair_lock_lock(&self->_progressLock);
    if (!-[NSURLSessionTask error](self, "error") && !-[NSProgress isFinished](self->_progress, "isFinished")) {
      -[NSProgress setCompletedUnitCount:]( self->_progress,  "setCompletedUnitCount:",  -[NSProgress totalUnitCount](self->_progress, "totalUnitCount"));
    }
    -[NSProgress setCancellationHandler:](self->_progress, "setCancellationHandler:", 0LL);
    -[NSProgress setPausingHandler:](self->_progress, "setPausingHandler:", 0LL);
    -[NSProgress setResumingHandler:](self->_progress, "setResumingHandler:", 0LL);
    os_unfair_lock_unlock(p_progressLock);
  }

- (id)cookiesForCurrentRequest
{
  return 0LL;
}

- (unint64_t)AVAssetDownloadToken
{
  return self->_AVAssetDownloadToken;
}

- (void)setAVAssetDownloadToken:(unint64_t)a3
{
  self->_AVAssetDownloadToken = a3;
}

- (NSURL)URL
{
  return (NSURL *)objc_getProperty(self, a2, 816LL, 1);
}

- (void)setURL:(id)a3
{
}

- (NSURL)destinationURL
{
  return (NSURL *)objc_getProperty(self, a2, 824LL, 1);
}

- (void)setDestinationURL:(id)a3
{
}

- (AVURLAsset)URLAsset
{
  return (AVURLAsset *)objc_getProperty(self, a2, 832LL, 1);
}

- (void)setURLAsset:(id)a3
{
}

- (NSDictionary)options
{
  return (NSDictionary *)objc_getProperty(self, a2, 840LL, 1);
}

- (void)setOptions:(id)a3
{
}

- (NSArray)loadedTimeRanges
{
  return (NSArray *)objc_getProperty(self, a2, 848LL, 1);
}

- (void)setLoadedTimeRanges:(id)a3
{
}

@end