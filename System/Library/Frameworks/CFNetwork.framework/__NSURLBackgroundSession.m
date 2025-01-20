@interface __NSURLBackgroundSession
- (NSString)appWakeUUID;
- (__NSURLBackgroundSession)initWithConfiguration:(id)a3 delegate:(id)a4 delegateQueue:(id)a5 delegateDispatchQueue:(id)a6;
- (id).cxx_construct;
- (id)AVAggregateAssetDownloadTaskForURLAsset:(id)a3 mediaSelections:(id)a4 assetTitle:(id)a5 assetArtworkData:(id)a6 options:(id)a7;
- (id)AVAssetDownloadTaskForURLAsset:(id)a3 assetTitle:(id)a4 assetArtworkData:(id)a5 options:(id)a6 downloadConfiguration:(id)a7;
- (id)AVAssetDownloadTaskForURLAsset:(id)a3 destinationURL:(id)a4 options:(id)a5;
- (id)_AVAssetDownloadTaskForURL:(id)a3 destinationURL:(id)a4 options:(id)a5;
- (id)_dataTaskWithTaskForClass:(id)a3;
- (id)_downloadTaskWithTaskForClass:(id)a3;
- (id)_onqueue_AVAssetDownloadTaskForURLAsset:(uint64_t)a3 URL:(uint64_t)a4 destinationURL:(uint64_t)a5 assetTitle:(uint64_t)a6 assetArtworkData:(void *)a7 options:(uint64_t)a8 downloadConfiguration:(char)a9 enableSPIDelegateCallbacks:;
- (id)_onqueue_dummyTaskForClass:(void *)a1 withRequest:(Class)a2 error:(void *)a3;
- (id)_uploadTaskWithTaskForClass:(id)a3;
- (id)taskForIdentifier:(id *)result;
- (id)webSocketTaskForRequest:(id)a3;
- (id)webSocketTaskForURL:(id)a3 protocols:(id)a4;
- (uint64_t)doesAVAssetDownloadSessionSupportMultipleDownloads;
- (uint64_t)ensureRemoteSession;
- (uint64_t)setupXPCConnection;
- (uint64_t)validateSerializabilityForRequest:(uint64_t)result completion:(uint64_t)a2;
- (void)_onqueue_completeInvalidation:(BOOL)a3;
- (void)_onqueue_flushWithCompletionHandler:(id)a3;
- (void)_onqueue_getTasksWithCompletionHandler:(id)a3;
- (void)_onqueue_invokeInvalidateCallback;
- (void)_onqueue_resetStorageWithCompletionHandler:(id)a3;
- (void)_onqueue_retryDataTaskWithIdentifier:(uint64_t)a1;
- (void)_useTLSSessionCacheFromSession:(id)a3;
- (void)appWasLaunchedForBackgroundSession:(id)a3;
- (void)backgroundAVAssetDownloadTask:(unint64_t)a3 didFinishDownloadForMediaSelectionPropertyList:(id)a4;
- (void)backgroundAVAssetDownloadTask:(unint64_t)a3 didLoadTimeRange:(id)a4 totalTimeRangesLoaded:(id)a5 timeRangeExpectedToLoad:(id)a6 forMediaSelectionPropertyList:(id)a7;
- (void)backgroundAVAssetDownloadTask:(unint64_t)a3 didReceiveDownloadToken:(unint64_t)a4;
- (void)backgroundAVAssetDownloadTask:(unint64_t)a3 didResolveMediaSelectionProperyList:(id)a4 reply:(id)a5;
- (void)backgroundAVAssetDownloadTask:(unint64_t)a3 willDownloadToURL:(id)a4;
- (void)backgroundAVAssetDownloadTask:(unint64_t)a3 willDownloadVariants:(id)a4 reply:(id)a5;
- (void)backgroundAVAssetDownloadTaskDidUpdateProgress:(unint64_t)a3 totalBytesWritten:(unint64_t)a4 totalBytesExpectedToWrite:(unint64_t)a5;
- (void)backgroundDataTask:(unint64_t)a3 didReceiveData:(id)a4 withReply:(id)a5;
- (void)backgroundDataTaskDidBecomeDownloadTask:(unint64_t)a3;
- (void)backgroundDownloadTask:(unint64_t)a3 didFinishDownloadingToURL:(id)a4 response:(id)a5 reply:(id)a6;
- (void)backgroundDownloadTask:(unint64_t)a3 didResumeAtOffset:(int64_t)a4 expectedTotalBytes:(int64_t)a5;
- (void)backgroundDownloadTask:(unint64_t)a3 didWriteData:(int64_t)a4 totalBytesWritten:(int64_t)a5 totalBytesExpectedToWrite:(int64_t)a6;
- (void)backgroundDownloadsDirectory;
- (void)backgroundSessionDidFinishAppWake:(id)a3 reply:(id)a4;
- (void)backgroundSessionDidStartAppWake:(id)a3 reply:(id)a4;
- (void)backgroundTask:(unint64_t)a3 _willSendRequestForEstablishedConnection:(id)a4 reply:(id)a5;
- (void)backgroundTask:(unint64_t)a3 didCompleteWithError:(id)a4 taskMetrics:(id)a5 info:(id)a6 reply:(id)a7;
- (void)backgroundTask:(unint64_t)a3 didReceiveChallenge:(id)a4 reply:(id)a5;
- (void)backgroundTask:(unint64_t)a3 didReceiveInformationalResponse:(id)a4;
- (void)backgroundTask:(unint64_t)a3 didReceiveResponse:(id)a4 transactionMetrics:(id)a5;
- (void)backgroundTask:(unint64_t)a3 didReceiveResponse:(id)a4 transactionMetrics:(id)a5 reply:(id)a6;
- (void)backgroundTask:(unint64_t)a3 didSendBodyData:(int64_t)a4 totalBytesSent:(int64_t)a5 totalBytesExpectedToSend:(int64_t)a6;
- (void)backgroundTask:(unint64_t)a3 getAuthHeadersForResponse:(id)a4 reply:(id)a5;
- (void)backgroundTask:(unint64_t)a3 hasConnectionWaitingWithError:(id)a4;
- (void)backgroundTask:(unint64_t)a3 hasConnectionWaitingWithReason:(int64_t)a4;
- (void)backgroundTask:(unint64_t)a3 needNewBodyStream:(BOOL)a4 withReply:(id)a5;
- (void)backgroundTask:(unint64_t)a3 willBeginDelayedRequest:(id)a4 reply:(id)a5;
- (void)backgroundTask:(unint64_t)a3 willPerformHTTPRedirection:(id)a4 withNewRequest:(id)a5 reply:(id)a6;
- (void)backgroundTaskDidResume:(unint64_t)a3;
- (void)backgroundTaskDidSuspend:(unint64_t)a3;
- (void)backgroundTaskHasConnectionWaiting:(unint64_t)a3;
- (void)cameIntoForeground:(id)a3;
- (void)credStorage_allCredentialsWithReply:(id)a3;
- (void)credStorage_credentialsForProtectionSpace:(id)a3 reply:(id)a4;
- (void)credStorage_defaultCredentialForProtectionSpace:(id)a3 reply:(id)a4;
- (void)credStorage_getInitialCredentialDictionariesWithReply:(id)a3;
- (void)credStorage_removeCredential:(id)a3 forProtectionSpace:(id)a4;
- (void)credStorage_setCredential:(id)a3 forProtectionSpace:(id)a4;
- (void)credStorage_setDefaultCredential:(id)a3 forProtectionSpace:(id)a4;
- (void)dealloc;
- (void)moveFileForResumeData:(void *)a3 fromDirectory:(void *)a4 toDirectory:;
- (void)moveFileToTempForBackgroundResumeData:(uint64_t)a1;
- (void)openFileAtPath:(id)a3 mode:(int)a4 withReply:(id)a5;
- (void)performBlockOnQueueAndRethrowExceptions:(uint64_t)a1;
- (void)sendInvalidationRequest;
- (void)serializableAVAssetDownloadTaskOptionsFromOptions:(void *)a1 mediaSelections:(void *)a2 downloadConfiguration:(uint64_t)a3;
- (void)setAppWakeUUID:(id)a3;
- (void)setCookiesFromResponse:(void *)a3 forCurrentRequest:(const void *)a4 partitionIdentifier:;
- (void)setupBackgroundSession;
- (void)wentToBackground:(id)a3;
- (void)willRetryBackgroundDataTask:(unint64_t)a3 withError:(id)a4 transactionMetrics:(id)a5;
@end

@implementation __NSURLBackgroundSession

- (__NSURLBackgroundSession)initWithConfiguration:(id)a3 delegate:(id)a4 delegateQueue:(id)a5 delegateDispatchQueue:(id)a6
{
  uint64_t v29 = *MEMORY[0x1895F89C0];
  v21.receiver = self;
  v21.super_class = (Class)&OBJC_CLASS_____NSURLBackgroundSession;
  v7 = -[NSURLSession initWithConfiguration:delegate:delegateQueue:delegateDispatchQueue:]( &v21,  sel_initWithConfiguration_delegate_delegateQueue_delegateDispatchQueue_,  a3,  a4,  a5,  a6);
  v8 = v7;
  if (v7)
  {
    v7->_identSeed = 1LL;
    v7->_tasks = (NSMutableDictionary *)(id)[MEMORY[0x189603FC8] dictionary];
    v8->_taskIDsToFailOnReconnection = (NSMutableArray *)objc_opt_new();
    v8->_taskIDsGettingAuthHeaders = (NSMutableSet *)objc_opt_new();
    v8->_downloadDirectory = (NSURL *)[a3 _directoryForDownloadedFiles];
    v8->_companionAvailable = [a3 _isProxySession];
    uint64_t v9 = -[NSDictionary objectForKeyedSubscript:]( -[NSURLSessionConfiguration HTTPAdditionalHeaders]( v8->super._local_immutable_configuration_ivar,  "HTTPAdditionalHeaders"),  "objectForKeyedSubscript:",  0x18C5AF900LL);
    uint64_t v10 = -[NSDictionary objectForKeyedSubscript:]( -[NSURLSessionConfiguration HTTPAdditionalHeaders]( v8->super._local_immutable_configuration_ivar,  "HTTPAdditionalHeaders"),  "objectForKeyedSubscript:",  0x18C5AEC18LL);
    uint64_t v11 = v10;
    uint64_t v12 = MEMORY[0x1895F87A8];
    if (!v9 || !v10)
    {
      pthread_once(&initControl, initializeUserAgentString);
      uint64_t v13 = sUserAgentString;
      CFTypeRef v14 = (id)_CFNetworkCopyPreferredLanguageCode();
      *(void *)&__int128 buf = v12;
      *((void *)&buf + 1) = 3221225472LL;
      v23 = __41____NSURLBackgroundSession_cleanupConfig__block_invoke;
      v24 = &unk_189C07510;
      uint64_t v25 = v13;
      CFTypeRef v26 = v14;
      uint64_t v27 = v9;
      uint64_t v28 = v11;
      local_immutable_configuration_ivar = v8->super._local_immutable_configuration_ivar;
      v8->super._local_immutable_configuration_ivar = (NSURLSessionConfiguration *)-[NSURLSessionConfiguration copyImmutableVariant:]( local_immutable_configuration_ivar,  "copyImmutableVariant:",  &buf);
    }

    -[__NSURLBackgroundSession setupXPCConnection]((uint64_t)v8);
    objc_msgSend( (id)objc_msgSend(MEMORY[0x189607958], "defaultCenter"),  "addObserver:selector:name:object:",  v8,  sel_wentToBackground_,  @"UIApplicationDidEnterBackgroundNotification",  0);
    objc_msgSend( (id)objc_msgSend(MEMORY[0x189607958], "defaultCenter"),  "addObserver:selector:name:object:",  v8,  sel_cameIntoForeground_,  @"UIApplicationWillEnterForegroundNotification",  0);
    objc_msgSend( (id)objc_msgSend(MEMORY[0x189607958], "defaultCenter"),  "addObserver:selector:name:object:",  v8,  sel_appWasLaunchedForBackgroundSession_,  @"NSURLSessionAppWasResumedForBackgroundSessionNotification",  0);
    -[__NSURLBackgroundSession setupBackgroundSession]((uint64_t)v8);
    if (([a3 _isProxySession] & 1) == 0)
    {
      v8->_notifyToken = 0;
      workQueue = (dispatch_queue_s *)v8->super._workQueue;
      handler[0] = v12;
      handler[1] = 3221225472LL;
      handler[2] = __95____NSURLBackgroundSession_initWithConfiguration_delegate_delegateQueue_delegateDispatchQueue___block_invoke;
      handler[3] = &unk_189C12488;
      handler[4] = v8;
      notify_register_dispatch("com.apple.nsurlsessiond.started", &v8->_notifyToken, workQueue, handler);
    }

    if ([a3 isDiscretionary]
      && [a3 _xpcActivityBudgeted] == 2)
    {
      if (__CFNAPIMisuseFaultLogHandle::onceToken != -1) {
        dispatch_once(&__CFNAPIMisuseFaultLogHandle::onceToken, &__block_literal_global_7_4727);
      }
      v17 = (os_log_s *)__CFNAPIMisuseFaultLogHandle::logger;
      if (os_log_type_enabled((os_log_t)__CFNAPIMisuseFaultLogHandle::logger, OS_LOG_TYPE_FAULT))
      {
        uint64_t v19 = [a3 identifier];
        LODWORD(buf) = 138412290;
        *(void *)((char *)&buf + 4) = v19;
        _os_log_fault_impl( &dword_18298D000,  v17,  OS_LOG_TYPE_FAULT,  "Discretionary background URLSessionConfiguration (%@) is inconsistent with xpc activity configuration. If this is intended, please reach out to cfnetwork / duetactivityscheduler",  (uint8_t *)&buf,  0xCu);
      }
    }
  }

  return v8;
}

- (void)wentToBackground:(id)a3
{
  if (self) {
    workQueue = (dispatch_queue_s *)self->super._workQueue;
  }
  else {
    workQueue = 0LL;
  }
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = __45____NSURLBackgroundSession_wentToBackground___block_invoke;
  block[3] = &unk_189C1A548;
  block[4] = self;
  dispatch_async(workQueue, block);
}

- (void)cameIntoForeground:(id)a3
{
  if (self) {
    workQueue = (dispatch_queue_s *)self->super._workQueue;
  }
  else {
    workQueue = 0LL;
  }
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = __47____NSURLBackgroundSession_cameIntoForeground___block_invoke;
  block[3] = &unk_189C1A548;
  block[4] = self;
  dispatch_async(workQueue, block);
}

- (void)appWasLaunchedForBackgroundSession:(id)a3
{
  if (self) {
    workQueue = (dispatch_queue_s *)self->super._workQueue;
  }
  else {
    workQueue = 0LL;
  }
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = __63____NSURLBackgroundSession_appWasLaunchedForBackgroundSession___block_invoke;
  block[3] = &unk_189C1A548;
  block[4] = self;
  dispatch_async(workQueue, block);
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS_____NSURLBackgroundSession;
  -[NSURLSession dealloc](&v3, sel_dealloc);
}

- (void)_useTLSSessionCacheFromSession:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS_____NSURLBackgroundSession;
  -[NSURLSession _useTLSSessionCacheFromSession:](&v6, sel__useTLSSessionCacheFromSession_, a3);
  if (self) {
    workQueue = (dispatch_queue_s *)self->super._workQueue;
  }
  else {
    workQueue = 0LL;
  }
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = __59____NSURLBackgroundSession__useTLSSessionCacheFromSession___block_invoke;
  block[3] = &unk_189C1A548;
  block[4] = self;
  dispatch_async(workQueue, block);
}

- (id)_dataTaskWithTaskForClass:(id)a3
{
  v4 = self;
  if (self) {
    self = (__NSURLBackgroundSession *)self->super._local_immutable_configuration_ivar;
  }
  if (-[__NSURLBackgroundSession _supportsAVAssetDownloads](self, "_supportsAVAssetDownloads"))
  {
    objc_exception_throw((id)[MEMORY[0x189603F70] exceptionWithName:*MEMORY[0x189603A48] reason:@"AVAssetDownloadURLSession does not support NSURLSessionDataTask" userInfo:0]);
    v8 = v7;
    _Block_object_dispose(&v10, 8);
    _Unwind_Resume(v8);
  }

  uint64_t v10 = 0LL;
  uint64_t v11 = &v10;
  uint64_t v12 = 0x3052000000LL;
  uint64_t v13 = __Block_byref_object_copy__4352;
  CFTypeRef v14 = __Block_byref_object_dispose__4353;
  uint64_t v15 = 0LL;
  v9[0] = MEMORY[0x1895F87A8];
  v9[1] = 3221225472LL;
  v9[2] = __54____NSURLBackgroundSession__dataTaskWithTaskForClass___block_invoke;
  v9[3] = &unk_189C19500;
  v9[5] = a3;
  v9[6] = &v10;
  v9[4] = v4;
  -[__NSURLBackgroundSession performBlockOnQueueAndRethrowExceptions:]((uint64_t)v4, (uint64_t)v9);
  v5 = (void *)v11[5];
  _Block_object_dispose(&v10, 8);
  return v5;
}

- (id)_uploadTaskWithTaskForClass:(id)a3
{
  v4 = self;
  if (self) {
    self = (__NSURLBackgroundSession *)self->super._local_immutable_configuration_ivar;
  }
  if (-[__NSURLBackgroundSession _supportsAVAssetDownloads](self, "_supportsAVAssetDownloads"))
  {
    objc_exception_throw((id)[MEMORY[0x189603F70] exceptionWithName:*MEMORY[0x189603A48] reason:@"AVAssetDownloadURLSession does not support NSURLSessionUploadTask" userInfo:0]);
    v8 = v7;
    _Block_object_dispose(&v10, 8);
    _Unwind_Resume(v8);
  }

  uint64_t v10 = 0LL;
  uint64_t v11 = &v10;
  uint64_t v12 = 0x3052000000LL;
  uint64_t v13 = __Block_byref_object_copy__4352;
  CFTypeRef v14 = __Block_byref_object_dispose__4353;
  uint64_t v15 = 0LL;
  v9[0] = MEMORY[0x1895F87A8];
  v9[1] = 3221225472LL;
  v9[2] = __56____NSURLBackgroundSession__uploadTaskWithTaskForClass___block_invoke;
  v9[3] = &unk_189C19500;
  v9[5] = a3;
  v9[6] = &v10;
  v9[4] = v4;
  -[__NSURLBackgroundSession performBlockOnQueueAndRethrowExceptions:]((uint64_t)v4, (uint64_t)v9);
  v5 = (void *)v11[5];
  _Block_object_dispose(&v10, 8);
  return v5;
}

- (id)_downloadTaskWithTaskForClass:(id)a3
{
  v4 = self;
  if (self) {
    self = (__NSURLBackgroundSession *)self->super._local_immutable_configuration_ivar;
  }
  if (-[__NSURLBackgroundSession _supportsAVAssetDownloads](self, "_supportsAVAssetDownloads"))
  {
    objc_exception_throw((id)[MEMORY[0x189603F70] exceptionWithName:*MEMORY[0x189603A48] reason:@"AVAssetDownloadURLSession does not support NSURLSessionDownloadTask" userInfo:0]);
    v8 = v7;
    _Block_object_dispose(&v10, 8);
    _Unwind_Resume(v8);
  }

  uint64_t v10 = 0LL;
  uint64_t v11 = &v10;
  uint64_t v12 = 0x3052000000LL;
  uint64_t v13 = __Block_byref_object_copy__4352;
  CFTypeRef v14 = __Block_byref_object_dispose__4353;
  uint64_t v15 = 0LL;
  v9[0] = MEMORY[0x1895F87A8];
  v9[1] = 3221225472LL;
  v9[2] = __58____NSURLBackgroundSession__downloadTaskWithTaskForClass___block_invoke;
  v9[3] = &unk_189C19500;
  v9[5] = a3;
  v9[6] = &v10;
  v9[4] = v4;
  -[__NSURLBackgroundSession performBlockOnQueueAndRethrowExceptions:]((uint64_t)v4, (uint64_t)v9);
  v5 = (void *)v11[5];
  _Block_object_dispose(&v10, 8);
  return v5;
}

- (id)webSocketTaskForRequest:(id)a3
{
  return -[__NSURLBackgroundSession webSocketTaskForURL:protocols:](v3, v4, v5, v6);
}

- (id)webSocketTaskForURL:(id)a3 protocols:(id)a4
{
  return -[__NSURLBackgroundSession _AVAssetDownloadTaskForURL:destinationURL:options:](v4, v5, v6, v7, v8);
}

- (id)_AVAssetDownloadTaskForURL:(id)a3 destinationURL:(id)a4 options:(id)a5
{
  uint64_t v8 = 0LL;
  uint64_t v9 = &v8;
  uint64_t v10 = 0x3052000000LL;
  uint64_t v11 = __Block_byref_object_copy__4352;
  uint64_t v12 = __Block_byref_object_dispose__4353;
  uint64_t v13 = 0LL;
  v7[0] = MEMORY[0x1895F87A8];
  v7[1] = 3221225472LL;
  v7[2] = __78____NSURLBackgroundSession__AVAssetDownloadTaskForURL_destinationURL_options___block_invoke;
  v7[3] = &unk_189C07648;
  v7[7] = a5;
  v7[8] = &v8;
  v7[4] = self;
  v7[5] = a3;
  v7[6] = a4;
  -[__NSURLBackgroundSession performBlockOnQueueAndRethrowExceptions:]((uint64_t)self, (uint64_t)v7);
  SEL v5 = (void *)v9[5];
  _Block_object_dispose(&v8, 8);
  return v5;
}

- (id)AVAssetDownloadTaskForURLAsset:(id)a3 destinationURL:(id)a4 options:(id)a5
{
  uint64_t v8 = 0LL;
  uint64_t v9 = &v8;
  uint64_t v10 = 0x3052000000LL;
  uint64_t v11 = __Block_byref_object_copy__4352;
  uint64_t v12 = __Block_byref_object_dispose__4353;
  uint64_t v13 = 0LL;
  v7[0] = MEMORY[0x1895F87A8];
  v7[1] = 3221225472LL;
  v7[2] = __82____NSURLBackgroundSession_AVAssetDownloadTaskForURLAsset_destinationURL_options___block_invoke;
  v7[3] = &unk_189C07648;
  v7[7] = a5;
  v7[8] = &v8;
  v7[4] = self;
  v7[5] = a3;
  v7[6] = a4;
  -[__NSURLBackgroundSession performBlockOnQueueAndRethrowExceptions:]((uint64_t)self, (uint64_t)v7);
  SEL v5 = (void *)v9[5];
  _Block_object_dispose(&v8, 8);
  return v5;
}

- (id)AVAssetDownloadTaskForURLAsset:(id)a3 assetTitle:(id)a4 assetArtworkData:(id)a5 options:(id)a6 downloadConfiguration:(id)a7
{
  uint64_t v10 = 0LL;
  uint64_t v11 = &v10;
  uint64_t v12 = 0x3052000000LL;
  uint64_t v13 = __Block_byref_object_copy__4352;
  CFTypeRef v14 = __Block_byref_object_dispose__4353;
  uint64_t v15 = 0LL;
  v9[0] = MEMORY[0x1895F87A8];
  v9[1] = 3221225472LL;
  v9[2] = __117____NSURLBackgroundSession_AVAssetDownloadTaskForURLAsset_assetTitle_assetArtworkData_options_downloadConfiguration___block_invoke;
  v9[3] = &unk_189C076B0;
  v9[9] = a6;
  v9[10] = &v10;
  v9[4] = a7;
  v9[5] = self;
  v9[6] = a3;
  void v9[7] = a4;
  v9[8] = a5;
  -[__NSURLBackgroundSession performBlockOnQueueAndRethrowExceptions:]((uint64_t)self, (uint64_t)v9);
  id v7 = (void *)v11[5];
  _Block_object_dispose(&v10, 8);
  return v7;
}

- (id)AVAggregateAssetDownloadTaskForURLAsset:(id)a3 mediaSelections:(id)a4 assetTitle:(id)a5 assetArtworkData:(id)a6 options:(id)a7
{
  uint64_t v10 = 0LL;
  uint64_t v11 = &v10;
  uint64_t v12 = 0x3052000000LL;
  uint64_t v13 = __Block_byref_object_copy__4352;
  CFTypeRef v14 = __Block_byref_object_dispose__4353;
  uint64_t v15 = 0LL;
  v9[0] = MEMORY[0x1895F87A8];
  v9[1] = 3221225472LL;
  v9[2] = __120____NSURLBackgroundSession_AVAggregateAssetDownloadTaskForURLAsset_mediaSelections_assetTitle_assetArtworkData_options___block_invoke;
  v9[3] = &unk_189C076B0;
  v9[9] = a7;
  v9[10] = &v10;
  v9[4] = self;
  v9[5] = a3;
  v9[6] = a4;
  void v9[7] = a5;
  v9[8] = a6;
  -[__NSURLBackgroundSession performBlockOnQueueAndRethrowExceptions:]((uint64_t)self, (uint64_t)v9);
  id v7 = (void *)v11[5];
  _Block_object_dispose(&v10, 8);
  return v7;
}

- (void)_onqueue_flushWithCompletionHandler:(id)a3
{
  if (self) {
    self = (__NSURLBackgroundSession *)self->super._local_immutable_configuration_ivar;
  }
  objc_msgSend((id)-[__NSURLBackgroundSession HTTPCookieStorage](self, "HTTPCookieStorage"), "_saveCookies");
  dispatch_queue_global_t global_queue = dispatch_get_global_queue(0LL, 0LL);
  dispatch_async(global_queue, a3);
}

- (void)_onqueue_resetStorageWithCompletionHandler:(id)a3
{
  uint64_t v26 = *MEMORY[0x1895F89C0];
  SEL v5 = (void *)MEMORY[0x186E1578C](self, a2);
  if (self)
  {
    id v6 = -[NSURLSessionConfiguration HTTPCookieStorage]( self->super._local_immutable_configuration_ivar,  "HTTPCookieStorage");
    local_immutable_configuration_ivar = self->super._local_immutable_configuration_ivar;
  }

  else
  {
    id v6 = (NSHTTPCookieStorage *)[0 HTTPCookieStorage];
    local_immutable_configuration_ivar = 0LL;
  }

  uint64_t v8 = -[NSURLSessionConfiguration URLCredentialStorage](local_immutable_configuration_ivar, "URLCredentialStorage");
  uint64_t v9 = -[NSHTTPCookieStorage cookies](v6, "cookies");
  __int128 v21 = 0u;
  __int128 v22 = 0u;
  __int128 v23 = 0u;
  __int128 v24 = 0u;
  uint64_t v10 = -[NSArray countByEnumeratingWithState:objects:count:]( v9,  "countByEnumeratingWithState:objects:count:",  &v21,  v25,  16LL);
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v22;
    do
    {
      uint64_t v13 = 0LL;
      do
      {
        if (*(void *)v22 != v12) {
          objc_enumerationMutation(v9);
        }
        -[NSHTTPCookieStorage deleteCookie:](v6, "deleteCookie:", *(void *)(*((void *)&v21 + 1) + 8 * v13++));
      }

      while (v11 != v13);
      uint64_t v11 = -[NSArray countByEnumeratingWithState:objects:count:]( v9,  "countByEnumeratingWithState:objects:count:",  &v21,  v25,  16LL);
    }

    while (v11);
  }

  -[NSHTTPCookieStorage _saveCookies](v6, "_saveCookies");
  CFTypeRef v14 = -[NSURLCredentialStorage allCredentials](v8, "allCredentials");
  uint64_t v15 = MEMORY[0x1895F87A8];
  v20[0] = MEMORY[0x1895F87A8];
  v20[1] = 3221225472LL;
  v20[2] = __71____NSURLBackgroundSession__onqueue_resetStorageWithCompletionHandler___block_invoke;
  v20[3] = &unk_189C07750;
  v20[4] = v8;
  -[NSDictionary enumerateKeysAndObjectsUsingBlock:](v14, "enumerateKeysAndObjectsUsingBlock:", v20);
  remoteSession = self->_remoteSession;
  if (remoteSession)
  {
    v19[0] = v15;
    v19[1] = 3221225472LL;
    v19[2] = __71____NSURLBackgroundSession__onqueue_resetStorageWithCompletionHandler___block_invoke_3;
    v19[3] = &unk_189C07778;
    v19[4] = a3;
    v18[0] = v15;
    v18[1] = 3221225472LL;
    v18[2] = __71____NSURLBackgroundSession__onqueue_resetStorageWithCompletionHandler___block_invoke_4;
    v18[3] = &unk_189C1A298;
    v18[4] = a3;
    objc_msgSend( (id)-[NDBackgroundSessionProtocol remoteObjectProxyWithErrorHandler:]( remoteSession,  "remoteObjectProxyWithErrorHandler:",  v19),  "resetStorageWithReply:",  v18);
  }

  else
  {
    dispatch_queue_global_t global_queue = dispatch_get_global_queue(0LL, 0LL);
    dispatch_async(global_queue, a3);
  }

  objc_autoreleasePoolPop(v5);
}

- (void)backgroundTaskDidResume:(unint64_t)a3
{
  if (self) {
    workQueue = (dispatch_queue_s *)self->super._workQueue;
  }
  else {
    workQueue = 0LL;
  }
  v4[0] = MEMORY[0x1895F87A8];
  v4[1] = 3221225472LL;
  v4[2] = __52____NSURLBackgroundSession_backgroundTaskDidResume___block_invoke;
  v4[3] = &unk_189C1A570;
  v4[4] = self;
  v4[5] = a3;
  dispatch_async(workQueue, v4);
}

- (void)backgroundTaskDidSuspend:(unint64_t)a3
{
  if (self) {
    workQueue = (dispatch_queue_s *)self->super._workQueue;
  }
  else {
    workQueue = 0LL;
  }
  v4[0] = MEMORY[0x1895F87A8];
  v4[1] = 3221225472LL;
  v4[2] = __53____NSURLBackgroundSession_backgroundTaskDidSuspend___block_invoke;
  v4[3] = &unk_189C1A570;
  v4[4] = self;
  v4[5] = a3;
  dispatch_async(workQueue, v4);
}

- (void)backgroundTask:(unint64_t)a3 didReceiveChallenge:(id)a4 reply:(id)a5
{
  SEL v5 = self;
  if (self) {
    self = (__NSURLBackgroundSession *)self->super._workQueue;
  }
  v6[0] = MEMORY[0x1895F87A8];
  v6[1] = 3221225472LL;
  v6[2] = __69____NSURLBackgroundSession_backgroundTask_didReceiveChallenge_reply___block_invoke;
  v6[3] = &unk_189C16148;
  v6[4] = v5;
  v6[5] = a4;
  v6[6] = a5;
  v6[7] = a3;
  dispatch_async((dispatch_queue_t)self, v6);
}

- (void)backgroundTask:(unint64_t)a3 willBeginDelayedRequest:(id)a4 reply:(id)a5
{
  SEL v5 = self;
  if (self) {
    self = (__NSURLBackgroundSession *)self->super._workQueue;
  }
  v6[0] = MEMORY[0x1895F87A8];
  v6[1] = 3221225472LL;
  v6[2] = __73____NSURLBackgroundSession_backgroundTask_willBeginDelayedRequest_reply___block_invoke;
  v6[3] = &unk_189C16148;
  v6[4] = v5;
  v6[5] = a4;
  v6[6] = a5;
  v6[7] = a3;
  dispatch_async((dispatch_queue_t)self, v6);
}

- (void)backgroundTask:(unint64_t)a3 willPerformHTTPRedirection:(id)a4 withNewRequest:(id)a5 reply:(id)a6
{
  id v6 = self;
  if (self) {
    self = (__NSURLBackgroundSession *)self->super._workQueue;
  }
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = __91____NSURLBackgroundSession_backgroundTask_willPerformHTTPRedirection_withNewRequest_reply___block_invoke;
  block[3] = &unk_189C16170;
  block[7] = a6;
  block[8] = a3;
  block[4] = v6;
  void block[5] = a4;
  block[6] = a5;
  dispatch_async((dispatch_queue_t)self, block);
}

- (void)backgroundTask:(unint64_t)a3 _willSendRequestForEstablishedConnection:(id)a4 reply:(id)a5
{
  SEL v5 = self;
  if (self) {
    self = (__NSURLBackgroundSession *)self->super._workQueue;
  }
  v6[0] = MEMORY[0x1895F87A8];
  v6[1] = 3221225472LL;
  v6[2] = __90____NSURLBackgroundSession_backgroundTask__willSendRequestForEstablishedConnection_reply___block_invoke;
  v6[3] = &unk_189C16148;
  v6[4] = v5;
  v6[5] = a4;
  v6[6] = a5;
  v6[7] = a3;
  dispatch_async((dispatch_queue_t)self, v6);
}

- (void)backgroundTaskHasConnectionWaiting:(unint64_t)a3
{
  if (self) {
    workQueue = (dispatch_queue_s *)self->super._workQueue;
  }
  else {
    workQueue = 0LL;
  }
  v4[0] = MEMORY[0x1895F87A8];
  v4[1] = 3221225472LL;
  v4[2] = __63____NSURLBackgroundSession_backgroundTaskHasConnectionWaiting___block_invoke;
  v4[3] = &unk_189C1A570;
  v4[4] = self;
  v4[5] = a3;
  dispatch_async(workQueue, v4);
}

- (void)backgroundTask:(unint64_t)a3 hasConnectionWaitingWithReason:(int64_t)a4
{
  SEL v4 = self;
  if (self) {
    self = (__NSURLBackgroundSession *)self->super._workQueue;
  }
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = __74____NSURLBackgroundSession_backgroundTask_hasConnectionWaitingWithReason___block_invoke;
  block[3] = &unk_189C10E30;
  block[4] = v4;
  void block[5] = a3;
  block[6] = a4;
  dispatch_async((dispatch_queue_t)self, block);
}

- (void)backgroundTask:(unint64_t)a3 hasConnectionWaitingWithError:(id)a4
{
  if (self) {
    workQueue = (dispatch_queue_s *)self->super._workQueue;
  }
  else {
    workQueue = 0LL;
  }
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = __73____NSURLBackgroundSession_backgroundTask_hasConnectionWaitingWithError___block_invoke;
  block[3] = &unk_189C194B0;
  void block[5] = a4;
  block[6] = a3;
  block[4] = self;
  dispatch_async(workQueue, block);
}

- (void)backgroundTask:(unint64_t)a3 didReceiveInformationalResponse:(id)a4
{
  if (self) {
    workQueue = (dispatch_queue_s *)self->super._workQueue;
  }
  else {
    workQueue = 0LL;
  }
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = __75____NSURLBackgroundSession_backgroundTask_didReceiveInformationalResponse___block_invoke;
  block[3] = &unk_189C194B0;
  void block[5] = a4;
  block[6] = a3;
  block[4] = self;
  dispatch_async(workQueue, block);
}

- (void)backgroundTask:(unint64_t)a3 didReceiveResponse:(id)a4 transactionMetrics:(id)a5
{
  SEL v5 = self;
  if (self) {
    self = (__NSURLBackgroundSession *)self->super._workQueue;
  }
  v6[0] = MEMORY[0x1895F87A8];
  v6[1] = 3221225472LL;
  v6[2] = __81____NSURLBackgroundSession_backgroundTask_didReceiveResponse_transactionMetrics___block_invoke;
  v6[3] = &unk_189C13670;
  v6[4] = v5;
  v6[5] = a5;
  v6[6] = a4;
  v6[7] = a3;
  dispatch_async((dispatch_queue_t)self, v6);
}

- (void)backgroundTask:(unint64_t)a3 didReceiveResponse:(id)a4 transactionMetrics:(id)a5 reply:(id)a6
{
  id v6 = self;
  if (self) {
    self = (__NSURLBackgroundSession *)self->super._workQueue;
  }
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = __87____NSURLBackgroundSession_backgroundTask_didReceiveResponse_transactionMetrics_reply___block_invoke;
  block[3] = &unk_189C16170;
  void block[7] = a6;
  block[8] = a3;
  block[4] = v6;
  void block[5] = a5;
  block[6] = a4;
  dispatch_async((dispatch_queue_t)self, block);
}

- (void)backgroundTask:(unint64_t)a3 didSendBodyData:(int64_t)a4 totalBytesSent:(int64_t)a5 totalBytesExpectedToSend:(int64_t)a6
{
  id v6 = self;
  if (self) {
    self = (__NSURLBackgroundSession *)self->super._workQueue;
  }
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = __99____NSURLBackgroundSession_backgroundTask_didSendBodyData_totalBytesSent_totalBytesExpectedToSend___block_invoke;
  block[3] = &unk_189C12438;
  block[4] = v6;
  void block[5] = a3;
  block[6] = a4;
  void block[7] = a5;
  block[8] = a6;
  dispatch_async((dispatch_queue_t)self, block);
}

- (void)backgroundTask:(unint64_t)a3 needNewBodyStream:(BOOL)a4 withReply:(id)a5
{
  if (self) {
    workQueue = (dispatch_queue_s *)self->super._workQueue;
  }
  else {
    workQueue = 0LL;
  }
  v6[0] = MEMORY[0x1895F87A8];
  v6[1] = 3221225472LL;
  v6[2] = __71____NSURLBackgroundSession_backgroundTask_needNewBodyStream_withReply___block_invoke;
  v6[3] = &unk_189C078A8;
  v6[5] = a5;
  v6[6] = a3;
  BOOL v7 = a4;
  v6[4] = self;
  dispatch_async(workQueue, v6);
}

- (void)backgroundTask:(unint64_t)a3 didCompleteWithError:(id)a4 taskMetrics:(id)a5 info:(id)a6 reply:(id)a7
{
  BOOL v7 = self;
  if (self) {
    self = (__NSURLBackgroundSession *)self->super._workQueue;
  }
  v8[0] = MEMORY[0x1895F87A8];
  v8[1] = 3221225472LL;
  v8[2] = __87____NSURLBackgroundSession_backgroundTask_didCompleteWithError_taskMetrics_info_reply___block_invoke;
  v8[3] = &unk_189C078F0;
  v8[4] = v7;
  v8[5] = a4;
  v8[8] = a7;
  v8[9] = a3;
  v8[6] = a5;
  v8[7] = a6;
  dispatch_async((dispatch_queue_t)self, v8);
}

- (void)backgroundDataTask:(unint64_t)a3 didReceiveData:(id)a4 withReply:(id)a5
{
  SEL v5 = self;
  if (self) {
    self = (__NSURLBackgroundSession *)self->super._workQueue;
  }
  v6[0] = MEMORY[0x1895F87A8];
  v6[1] = 3221225472LL;
  v6[2] = __72____NSURLBackgroundSession_backgroundDataTask_didReceiveData_withReply___block_invoke;
  v6[3] = &unk_189C16148;
  v6[4] = v5;
  v6[5] = a4;
  v6[6] = a5;
  void v6[7] = a3;
  dispatch_async((dispatch_queue_t)self, v6);
}

- (void)backgroundTask:(unint64_t)a3 getAuthHeadersForResponse:(id)a4 reply:(id)a5
{
  SEL v5 = self;
  if (self) {
    self = (__NSURLBackgroundSession *)self->super._workQueue;
  }
  v6[0] = MEMORY[0x1895F87A8];
  v6[1] = 3221225472LL;
  v6[2] = __75____NSURLBackgroundSession_backgroundTask_getAuthHeadersForResponse_reply___block_invoke;
  v6[3] = &unk_189C16148;
  v6[4] = v5;
  v6[5] = a4;
  v6[6] = a5;
  void v6[7] = a3;
  dispatch_async((dispatch_queue_t)self, v6);
}

- (void)backgroundDataTaskDidBecomeDownloadTask:(unint64_t)a3
{
  if (self) {
    workQueue = (dispatch_queue_s *)self->super._workQueue;
  }
  else {
    workQueue = 0LL;
  }
  v4[0] = MEMORY[0x1895F87A8];
  v4[1] = 3221225472LL;
  v4[2] = __68____NSURLBackgroundSession_backgroundDataTaskDidBecomeDownloadTask___block_invoke;
  v4[3] = &unk_189C1A570;
  v4[4] = self;
  v4[5] = a3;
  dispatch_async(workQueue, v4);
}

- (void)willRetryBackgroundDataTask:(unint64_t)a3 withError:(id)a4 transactionMetrics:(id)a5
{
  SEL v5 = self;
  if (self) {
    self = (__NSURLBackgroundSession *)self->super._workQueue;
  }
  v6[0] = MEMORY[0x1895F87A8];
  v6[1] = 3221225472LL;
  v6[2] = __85____NSURLBackgroundSession_willRetryBackgroundDataTask_withError_transactionMetrics___block_invoke;
  v6[3] = &unk_189C13670;
  v6[4] = v5;
  v6[5] = a5;
  v6[6] = a4;
  void v6[7] = a3;
  dispatch_async((dispatch_queue_t)self, v6);
}

- (void)backgroundDownloadTask:(unint64_t)a3 didFinishDownloadingToURL:(id)a4 response:(id)a5 reply:(id)a6
{
  id v6 = self;
  if (self) {
    self = (__NSURLBackgroundSession *)self->super._workQueue;
  }
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = __92____NSURLBackgroundSession_backgroundDownloadTask_didFinishDownloadingToURL_response_reply___block_invoke;
  block[3] = &unk_189C16170;
  void block[7] = a6;
  block[8] = a3;
  block[4] = v6;
  void block[5] = a5;
  block[6] = a4;
  dispatch_async((dispatch_queue_t)self, block);
}

- (void)backgroundDownloadTask:(unint64_t)a3 didWriteData:(int64_t)a4 totalBytesWritten:(int64_t)a5 totalBytesExpectedToWrite:(int64_t)a6
{
  id v6 = self;
  if (self) {
    self = (__NSURLBackgroundSession *)self->super._workQueue;
  }
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = __108____NSURLBackgroundSession_backgroundDownloadTask_didWriteData_totalBytesWritten_totalBytesExpectedToWrite___block_invoke;
  block[3] = &unk_189C12438;
  block[4] = v6;
  void block[5] = a3;
  block[6] = a4;
  void block[7] = a5;
  block[8] = a6;
  dispatch_async((dispatch_queue_t)self, block);
}

- (void)backgroundDownloadTask:(unint64_t)a3 didResumeAtOffset:(int64_t)a4 expectedTotalBytes:(int64_t)a5
{
  SEL v5 = self;
  if (self) {
    self = (__NSURLBackgroundSession *)self->super._workQueue;
  }
  v6[0] = MEMORY[0x1895F87A8];
  v6[1] = 3221225472LL;
  v6[2] = __88____NSURLBackgroundSession_backgroundDownloadTask_didResumeAtOffset_expectedTotalBytes___block_invoke;
  v6[3] = &unk_189C10A30;
  v6[4] = v5;
  v6[5] = a3;
  v6[6] = a4;
  void v6[7] = a5;
  dispatch_async((dispatch_queue_t)self, v6);
}

- (void)openFileAtPath:(id)a3 mode:(int)a4 withReply:(id)a5
{
}

- (void)backgroundAVAssetDownloadTaskDidUpdateProgress:(unint64_t)a3 totalBytesWritten:(unint64_t)a4 totalBytesExpectedToWrite:(unint64_t)a5
{
  SEL v5 = self;
  if (self) {
    self = (__NSURLBackgroundSession *)self->super._workQueue;
  }
  v6[0] = MEMORY[0x1895F87A8];
  v6[1] = 3221225472LL;
  v6[2] = __119____NSURLBackgroundSession_backgroundAVAssetDownloadTaskDidUpdateProgress_totalBytesWritten_totalBytesExpectedToWrite___block_invoke;
  v6[3] = &unk_189C10A30;
  v6[4] = v5;
  v6[5] = a3;
  v6[6] = a4;
  void v6[7] = a5;
  dispatch_async((dispatch_queue_t)self, v6);
}

- (void)backgroundAVAssetDownloadTask:(unint64_t)a3 didReceiveDownloadToken:(unint64_t)a4
{
  SEL v4 = self;
  if (self) {
    self = (__NSURLBackgroundSession *)self->super._workQueue;
  }
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = __82____NSURLBackgroundSession_backgroundAVAssetDownloadTask_didReceiveDownloadToken___block_invoke;
  block[3] = &unk_189C10E30;
  block[4] = v4;
  void block[5] = a3;
  block[6] = a4;
  dispatch_async((dispatch_queue_t)self, block);
}

- (void)backgroundAVAssetDownloadTask:(unint64_t)a3 didLoadTimeRange:(id)a4 totalTimeRangesLoaded:(id)a5 timeRangeExpectedToLoad:(id)a6 forMediaSelectionPropertyList:(id)a7
{
  BOOL v7 = self;
  if (self) {
    self = (__NSURLBackgroundSession *)self->super._workQueue;
  }
  v8[0] = MEMORY[0x1895F87A8];
  v8[1] = 3221225472LL;
  v8[2] = __151____NSURLBackgroundSession_backgroundAVAssetDownloadTask_didLoadTimeRange_totalTimeRangesLoaded_timeRangeExpectedToLoad_forMediaSelectionPropertyList___block_invoke;
  v8[3] = &unk_189C079A8;
  v8[4] = v7;
  v8[5] = a4;
  v8[6] = a5;
  v8[7] = a6;
  v8[8] = a7;
  v8[9] = a3;
  dispatch_async((dispatch_queue_t)self, v8);
}

- (void)backgroundAVAssetDownloadTask:(unint64_t)a3 didResolveMediaSelectionProperyList:(id)a4 reply:(id)a5
{
  SEL v5 = self;
  if (self) {
    self = (__NSURLBackgroundSession *)self->super._workQueue;
  }
  v6[0] = MEMORY[0x1895F87A8];
  v6[1] = 3221225472LL;
  v6[2] = __100____NSURLBackgroundSession_backgroundAVAssetDownloadTask_didResolveMediaSelectionProperyList_reply___block_invoke;
  v6[3] = &unk_189C16148;
  v6[4] = v5;
  v6[5] = a4;
  v6[6] = a5;
  void v6[7] = a3;
  dispatch_async((dispatch_queue_t)self, v6);
}

- (void)backgroundAVAssetDownloadTask:(unint64_t)a3 willDownloadToURL:(id)a4
{
  if (self) {
    workQueue = (dispatch_queue_s *)self->super._workQueue;
  }
  else {
    workQueue = 0LL;
  }
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = __76____NSURLBackgroundSession_backgroundAVAssetDownloadTask_willDownloadToURL___block_invoke;
  block[3] = &unk_189C194B0;
  void block[5] = a4;
  block[6] = a3;
  block[4] = self;
  dispatch_async(workQueue, block);
}

- (void)backgroundAVAssetDownloadTask:(unint64_t)a3 willDownloadVariants:(id)a4 reply:(id)a5
{
  SEL v5 = self;
  if (self) {
    self = (__NSURLBackgroundSession *)self->super._workQueue;
  }
  v6[0] = MEMORY[0x1895F87A8];
  v6[1] = 3221225472LL;
  v6[2] = __85____NSURLBackgroundSession_backgroundAVAssetDownloadTask_willDownloadVariants_reply___block_invoke;
  v6[3] = &unk_189C16148;
  v6[4] = v5;
  v6[5] = a4;
  v6[6] = a5;
  void v6[7] = a3;
  dispatch_async((dispatch_queue_t)self, v6);
}

- (void)backgroundAVAssetDownloadTask:(unint64_t)a3 didFinishDownloadForMediaSelectionPropertyList:(id)a4
{
  if (self) {
    workQueue = (dispatch_queue_s *)self->super._workQueue;
  }
  else {
    workQueue = 0LL;
  }
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = __105____NSURLBackgroundSession_backgroundAVAssetDownloadTask_didFinishDownloadForMediaSelectionPropertyList___block_invoke;
  block[3] = &unk_189C194B0;
  void block[5] = a4;
  block[6] = a3;
  block[4] = self;
  dispatch_async(workQueue, block);
}

- (void)backgroundSessionDidStartAppWake:(id)a3 reply:(id)a4
{
  SEL v4 = self;
  if (self) {
    self = (__NSURLBackgroundSession *)self->super._workQueue;
  }
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = __67____NSURLBackgroundSession_backgroundSessionDidStartAppWake_reply___block_invoke;
  block[3] = &unk_189C1A480;
  block[4] = v4;
  void block[5] = a3;
  block[6] = a4;
  dispatch_async((dispatch_queue_t)self, block);
}

- (void)backgroundSessionDidFinishAppWake:(id)a3 reply:(id)a4
{
  SEL v4 = self;
  if (self) {
    self = (__NSURLBackgroundSession *)self->super._workQueue;
  }
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = __68____NSURLBackgroundSession_backgroundSessionDidFinishAppWake_reply___block_invoke;
  block[3] = &unk_189C1A480;
  block[4] = v4;
  void block[5] = a3;
  block[6] = a4;
  dispatch_async((dispatch_queue_t)self, block);
}

- (void)credStorage_getInitialCredentialDictionariesWithReply:(id)a3
{
  uint64_t v4 = [MEMORY[0x189603F68] dictionary];
  (*((void (**)(id, uint64_t, uint64_t))a3 + 2))(a3, v4, [MEMORY[0x189603F68] dictionary]);
}

- (void)credStorage_allCredentialsWithReply:(id)a3
{
  if (self) {
    self = (__NSURLBackgroundSession *)self->super._local_immutable_configuration_ivar;
  }
  (*((void (**)(id, uint64_t))a3 + 2))( a3,  objc_msgSend((id)-[__NSURLBackgroundSession URLCredentialStorage](self, "URLCredentialStorage"), "allCredentials"));
}

- (void)credStorage_credentialsForProtectionSpace:(id)a3 reply:(id)a4
{
  if (self) {
    self = (__NSURLBackgroundSession *)self->super._local_immutable_configuration_ivar;
  }
  (*((void (**)(id, uint64_t))a4 + 2))( a4,  objc_msgSend( (id)-[__NSURLBackgroundSession URLCredentialStorage](self, "URLCredentialStorage"),  "credentialsForProtectionSpace:",  a3));
}

- (void)credStorage_setCredential:(id)a3 forProtectionSpace:(id)a4
{
  if (self) {
    self = (__NSURLBackgroundSession *)self->super._local_immutable_configuration_ivar;
  }
  objc_msgSend( (id)-[__NSURLBackgroundSession URLCredentialStorage](self, "URLCredentialStorage"),  "setCredential:forProtectionSpace:",  a3,  a4);
}

- (void)credStorage_removeCredential:(id)a3 forProtectionSpace:(id)a4
{
  if (self) {
    self = (__NSURLBackgroundSession *)self->super._local_immutable_configuration_ivar;
  }
  objc_msgSend( (id)-[__NSURLBackgroundSession URLCredentialStorage](self, "URLCredentialStorage"),  "removeCredential:forProtectionSpace:",  a3,  a4);
}

- (void)credStorage_defaultCredentialForProtectionSpace:(id)a3 reply:(id)a4
{
  if (self) {
    self = (__NSURLBackgroundSession *)self->super._local_immutable_configuration_ivar;
  }
  SEL v5 = (void *)objc_msgSend( (id)-[__NSURLBackgroundSession URLCredentialStorage](self, "URLCredentialStorage"),  "defaultCredentialForProtectionSpace:",  a3);
  (*((void (**)(id, void *))a4 + 2))(a4, v5);
}

- (void)credStorage_setDefaultCredential:(id)a3 forProtectionSpace:(id)a4
{
  if (self) {
    self = (__NSURLBackgroundSession *)self->super._local_immutable_configuration_ivar;
  }
  objc_msgSend( (id)-[__NSURLBackgroundSession URLCredentialStorage](self, "URLCredentialStorage"),  "setDefaultCredential:forProtectionSpace:",  a3,  a4);
}

- (void)_onqueue_completeInvalidation:(BOOL)a3
{
  uint64_t v17 = *MEMORY[0x1895F89C0];
  if (self)
  {
    workQueue = self->super._workQueue;
    aBlock[0] = MEMORY[0x1895F87A8];
    aBlock[1] = 3221225472LL;
    aBlock[2] = __58____NSURLBackgroundSession__onqueue_completeInvalidation___block_invoke;
    aBlock[3] = &unk_189C079F8;
    aBlock[4] = self;
    if (self->_invalidateCallback)
    {
      __58____NSURLBackgroundSession__onqueue_completeInvalidation___block_invoke((uint64_t)aBlock, 0);
    }

    else
    {
      BOOL v5 = a3;
      self->_invalidateCallback = _Block_copy(aBlock);
      self->_invalidateQueue = workQueue;
      if (workQueue) {
        dispatch_retain((dispatch_object_t)workQueue);
      }
      if (v5)
      {
        id v6 = (void *)objc_msgSend((id)-[NSMutableDictionary allValues](self->_tasks, "allValues"), "copy");
        __int128 v12 = 0u;
        __int128 v13 = 0u;
        __int128 v14 = 0u;
        __int128 v15 = 0u;
        uint64_t v7 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
        if (v7)
        {
          uint64_t v8 = v7;
          uint64_t v9 = *(void *)v13;
          do
          {
            for (uint64_t i = 0LL; i != v8; ++i)
            {
              if (*(void *)v13 != v9) {
                objc_enumerationMutation(v6);
              }
              [*(id *)(*((void *)&v12 + 1) + 8 * i) cancel];
            }

            uint64_t v8 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
          }

          while (v8);
        }
      }

      -[__NSURLBackgroundSession sendInvalidationRequest]((uint64_t)self);
    }
  }

- (void)_onqueue_getTasksWithCompletionHandler:(id)a3
{
  uint64_t v4 = self;
  if (self) {
    self = (__NSURLBackgroundSession *)objc_msgSend( (id)-[NSMutableDictionary allValues](self->_tasks, "allValues"),  "copy");
  }
  v5[0] = MEMORY[0x1895F87A8];
  v5[1] = 3221225472LL;
  v5[2] = __67____NSURLBackgroundSession__onqueue_getTasksWithCompletionHandler___block_invoke;
  v5[3] = &unk_189C1A2E8;
  v5[4] = self;
  v5[5] = a3;
  -[NSURLSession runDelegateBlock:]((uint64_t)v4, v5);
}

- (NSString)appWakeUUID
{
  return (NSString *)objc_getProperty(self, a2, 240LL, 1);
}

- (void)setAppWakeUUID:(id)a3
{
}

- (void).cxx_destruct
{
}

- (id).cxx_construct
{
  *((void *)self + 28) = 0LL;
  *((void *)self + 29) = 0LL;
  return self;
}

- (void)sendInvalidationRequest
{
  if (a1)
  {
    v2 = *(void **)(a1 + 168);
    if (v2
      || *(_BYTE *)(a1 + 280)
      && (-[__NSURLBackgroundSession setupXPCConnection](a1),
          -[__NSURLBackgroundSession setupBackgroundSession](a1),
          (v2 = *(void **)(a1 + 168)) != 0LL))
    {
      v3[0] = MEMORY[0x1895F87A8];
      v3[1] = 3221225472LL;
      v3[2] = __51____NSURLBackgroundSession_sendInvalidationRequest__block_invoke;
      v3[3] = &unk_189C1A548;
      v3[4] = a1;
      [v2 invalidateWithReply:v3];
    }

    else
    {
      -[__NSURLBackgroundSession _onqueue_invokeInvalidateCallback](a1);
    }
  }

- (uint64_t)setupXPCConnection
{
  if (result)
  {
    uint64_t v1 = result;
    else {
      v2 = @"com.apple.nsurlsessiond";
    }
    *(void *)(v1 + 176) = [objc_alloc(MEMORY[0x189607B30]) initWithMachServiceName:v2 options:0];
    objc_msgSend( *(id *)(v1 + 176),  "setRemoteObjectInterface:",  +[__NSCFURLSessionXPC bgSessionManagerInterface](__NSCFURLSessionXPC, "bgSessionManagerInterface"));
    objc_super v3 = *(void **)(v1 + 176);
    uint64_t v4 = MEMORY[0x1895F87A8];
    v7[0] = MEMORY[0x1895F87A8];
    v7[1] = 3221225472LL;
    v7[2] = __46____NSURLBackgroundSession_setupXPCConnection__block_invoke;
    v7[3] = &unk_189C1A548;
    v7[4] = v1;
    [v3 setInterruptionHandler:v7];
    BOOL v5 = *(void **)(v1 + 176);
    v6[0] = v4;
    v6[1] = 3221225472LL;
    v6[2] = __46____NSURLBackgroundSession_setupXPCConnection__block_invoke_2_18;
    v6[3] = &unk_189C1A548;
    v6[4] = v1;
    [v5 setInvalidationHandler:v6];
    *(_BYTE *)(v1 + 281) = 0;
    return [*(id *)(v1 + 176) resume];
  }

  return result;
}

- (void)setupBackgroundSession
{
  uint64_t v58 = *MEMORY[0x1895F89C0];
  if (!a1) {
    return;
  }
  *(_BYTE *)(a1 + 280) = 0;
  if (([*(id *)(a1 + 112) _isProxySession] & 1) == 0
    && MKBDeviceUnlockedSinceBoot_delayInitStub(v2) != 1)
  {
    int v3 = [*(id *)(a1 + 112) _isProxySession];
    if (CFNLog::onceToken != -1) {
      dispatch_once(&CFNLog::onceToken, &__block_literal_global_1_4717);
    }
    uint64_t v4 = (os_log_s *)CFNLog::logger;
    BOOL v5 = os_log_type_enabled((os_log_t)CFNLog::logger, OS_LOG_TYPE_ERROR);
    if (v3)
    {
      if (!v5) {
        goto LABEL_10;
      }
      uint64_t v6 = *(void *)(a1 + 128);
      LODWORD(v50) = 138543362;
      *(void *)((char *)&v50 + 4) = v6;
      uint64_t v7 = "ProxySession <%{public}@> attempting to setup a background session before first device unlock!";
    }

    else
    {
      if (!v5) {
        goto LABEL_10;
      }
      uint64_t v37 = *(void *)(a1 + 128);
      LODWORD(v50) = 138543362;
      *(void *)((char *)&v50 + 4) = v37;
      uint64_t v7 = "BackgroundSession <%{public}@> attempting to setup a background session before first device unlock!";
    }

    _os_log_error_impl(&dword_18298D000, v4, OS_LOG_TYPE_ERROR, v7, (uint8_t *)&v50, 0xCu);
  }

- (void)_onqueue_invokeInvalidateCallback
{
  if (a1)
  {
    uint64_t v1 = *(void *)(a1 + 216);
    if (v1)
    {
      if (*(void *)(a1 + 208))
      {
        *(void *)(a1 + 216) = 0LL;
        double v2 = *(dispatch_queue_s **)(a1 + 208);
        *(void *)(a1 + 208) = 0LL;
        v3[0] = MEMORY[0x1895F87A8];
        v3[1] = 3221225472LL;
        v3[2] = __61____NSURLBackgroundSession__onqueue_invokeInvalidateCallback__block_invoke;
        v3[3] = &unk_189C1A2E8;
        v3[4] = a1;
        void v3[5] = v1;
        dispatch_async(v2, v3);
        dispatch_release(v2);
      }
    }
  }

- (id)taskForIdentifier:(id *)result
{
  if (result) {
    return (id *)(id)objc_msgSend( result[23],  "objectForKeyedSubscript:",  objc_msgSend(MEMORY[0x189607968], "numberWithUnsignedInteger:", a2));
  }
  return result;
}

- (void)_onqueue_retryDataTaskWithIdentifier:(uint64_t)a1
{
  uint64_t v24 = *MEMORY[0x1895F89C0];
  if (a1)
  {
    uint64_t v4 = -[__NSURLBackgroundSession taskForIdentifier:]((id *)a1, a2);
    if (!v4)
    {
      int v13 = [*(id *)(a1 + 112) _isProxySession];
      if (CFNLog::onceToken != -1) {
        dispatch_once(&CFNLog::onceToken, &__block_literal_global_1_4717);
      }
      __int128 v14 = (os_log_s *)CFNLog::logger;
      BOOL v15 = os_log_type_enabled((os_log_t)CFNLog::logger, OS_LOG_TYPE_ERROR);
      if (v13)
      {
        if (!v15) {
          return;
        }
        uint64_t v16 = *(void *)(a1 + 128);
        *(_DWORD *)__int128 buf = 138543618;
        uint64_t v21 = v16;
        __int16 v22 = 2048;
        uint64_t v23 = a2;
        uint64_t v17 = "ProxySession <%{public}@> cannot retry background data task with identifier %lu because there is no such task";
      }

      else
      {
        if (!v15) {
          return;
        }
        uint64_t v18 = *(void *)(a1 + 128);
        *(_DWORD *)__int128 buf = 138543618;
        uint64_t v21 = v18;
        __int16 v22 = 2048;
        uint64_t v23 = a2;
        uint64_t v17 = "BackgroundSession <%{public}@> cannot retry background data task with identifier %lu because there is no such task";
      }

      _os_log_error_impl(&dword_18298D000, v14, OS_LOG_TYPE_ERROR, v17, buf, 0x16u);
      return;
    }

    BOOL v5 = v4;
    -[__NSCFBackgroundDataTask _onqueue_finishStream:]((uint64_t)v4, 1u);
    uint64_t v6 = (uint64_t)v5[88];
    if (!v6) {
      uint64_t v6 = (uint64_t)v5[87];
    }
    uint64_t v7 = objc_msgSend((id)objc_msgSend(v5, "currentRequest"), "URL");
    -[__NSCFURLSessionDelegateWrapper _willRetryBackgroundDataTask:withError:]( v6,  v5,  (void *)objc_msgSend(MEMORY[0x189607870], "_web_errorWithDomain:code:URL:", *MEMORY[0x189607740], -1005, v7));
    id v8 = (id)objc_msgSend((id)objc_msgSend(v5, "currentRequest"), "mutableCopy");
    uint64_t v9 = (void *)MEMORY[0x189607968];
    [v5 startTime];
    +[NSURLProtocol setProperty:forKey:inRequest:]( NSURLProtocol,  "setProperty:forKey:inRequest:",  objc_msgSend(v9, "numberWithDouble:"),  @"NSURLSessionTaskOriginalStartTimeKey",  v8);
    uint64_t v10 = *(void **)(a1 + 168);
    uint64_t v11 = [v5 originalRequest];
    uint64_t v12 = [v5 _uniqueIdentifier];
    v19[0] = MEMORY[0x1895F87A8];
    v19[1] = 3221225472LL;
    v19[2] = __65____NSURLBackgroundSession__onqueue_retryDataTaskWithIdentifier___block_invoke;
    v19[3] = &unk_189C077A0;
    v19[4] = a1;
    void v19[5] = a2;
    [v10 dataTaskWithRequest:v8 originalRequest:v11 identifier:a2 uniqueIdentifier:v12 reply:v19];
    if ([v5 _priorityValue]) {
      objc_msgSend(*(id *)(a1 + 168), "setPriority:forTaskWithIdentifier:", objc_msgSend(v5, "_priorityValue"), a2);
    }
    if ([v5 _bytesPerSecondLimit]) {
      objc_msgSend( *(id *)(a1 + 168),  "setBytesPerSecondLimit:forTaskWithIdentifier:",  objc_msgSend(v5, "_bytesPerSecondLimit"),  a2);
    }
    if ([v5 _expectedProgressTarget]) {
      objc_msgSend( *(id *)(a1 + 168),  "setExpectedProgressTarget:forTaskWithIdentifier:",  objc_msgSend(v5, "_expectedProgressTarget"),  a2);
    }
    if ([v5 _TLSMinimumSupportedProtocolVersion]) {
      objc_msgSend( *(id *)(a1 + 168),  "setTLSMinimumSupportedProtocolVersion:forTaskWithIdentifier:",  objc_msgSend(v5, "_TLSMinimumSupportedProtocolVersion"),  a2);
    }
    if ([v5 _TLSMaximumSupportedProtocolVersion]) {
      objc_msgSend( *(id *)(a1 + 168),  "setTLSMaximumSupportedProtocolVersion:forTaskWithIdentifier:",  objc_msgSend(v5, "_TLSMaximumSupportedProtocolVersion"),  a2);
    }
    [*(id *)(a1 + 168) resumeTaskWithIdentifier:a2 withProperties:0];
  }

- (uint64_t)ensureRemoteSession
{
  uint64_t v14 = *MEMORY[0x1895F89C0];
  if (result)
  {
    uint64_t v1 = result;
    if (!*(void *)(result + 168))
    {
      int v2 = *(unsigned __int8 *)(result + 280);
      int v3 = [*(id *)(result + 112) _isProxySession];
      if (CFNLog::onceToken != -1) {
        dispatch_once(&CFNLog::onceToken, &__block_literal_global_1_4717);
      }
      uint64_t v4 = (os_log_s *)CFNLog::logger;
      BOOL v5 = os_log_type_enabled((os_log_t)CFNLog::logger, OS_LOG_TYPE_DEFAULT);
      if (v2)
      {
        if (v3)
        {
          if (v5)
          {
            uint64_t v6 = *(void *)(v1 + 128);
            int v12 = 138543362;
            uint64_t v13 = v6;
            uint64_t v7 = "ProxySession <%{public}@> attempting to reconnect to background transfer daemon";
LABEL_14:
            _os_log_impl(&dword_18298D000, v4, OS_LOG_TYPE_DEFAULT, v7, (uint8_t *)&v12, 0xCu);
          }
        }

        else if (v5)
        {
          uint64_t v10 = *(void *)(v1 + 128);
          int v12 = 138543362;
          uint64_t v13 = v10;
          uint64_t v7 = "BackgroundSession <%{public}@> attempting to reconnect to background transfer daemon";
          goto LABEL_14;
        }

        -[__NSURLBackgroundSession setupXPCConnection](v1);
        -[__NSURLBackgroundSession setupBackgroundSession](v1);
        return *(void *)(v1 + 168);
      }

      if (!v3)
      {
        if (!v5) {
          return *(void *)(v1 + 168);
        }
        uint64_t v11 = *(void *)(v1 + 128);
        int v12 = 138543362;
        uint64_t v13 = v11;
        uint64_t v9 = "BackgroundSession <%{public}@> no connection to background transfer daemon, and will not try to reconnect";
LABEL_18:
        _os_log_impl(&dword_18298D000, v4, OS_LOG_TYPE_DEFAULT, v9, (uint8_t *)&v12, 0xCu);
        return *(void *)(v1 + 168);
      }

      if (v5)
      {
        uint64_t v8 = *(void *)(v1 + 128);
        int v12 = 138543362;
        uint64_t v13 = v8;
        uint64_t v9 = "ProxySession <%{public}@> no connection to background transfer daemon, and will not try to reconnect";
        goto LABEL_18;
      }
    }

    return *(void *)(v1 + 168);
  }

  return result;
}

- (void)setCookiesFromResponse:(void *)a3 forCurrentRequest:(const void *)a4 partitionIdentifier:
{
  if (a1)
  {
    if ([*(id *)(a1 + 112) HTTPCookieStorage])
    {
      int v8 = [*(id *)(a1 + 112) HTTPShouldSetCookies];
      if (a2)
      {
        if (v8)
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            uint64_t v9 = [a2 allHeaderFields];
            [*(id *)(a1 + 112) HTTPCookieStorage];
            if ((objc_opt_respondsToSelector() & 1) != 0
              && (uint64_t v10 = objc_msgSend((id)objc_msgSend(*(id *)(a1 + 112), "HTTPCookieStorage"), "_cookieStorage")) != 0)
            {
              uint64_t v11 = v10;
              int v12 = (void *)[a2 _CFURLResponse];
              if (v12)
              {
                uint64_t v13 = *(void *)([v12 _inner] + 88);
                uint64_t v14 = (const __CFURL *)[a2 URL];
                BOOL v15 = (const void *)[a3 mainDocumentURL];
                int v16 = [*(id *)(a1 + 112) HTTPCookieAcceptPolicy];
                if (v14)
                {
                  int v17 = v16;
                  uint64_t v18 = CFGetAllocator((CFTypeRef)v11);
                  CookiesWithResponseMessage = _CFHTTPCookieCreateCookiesWithResponseMessage(v18, v13 - 16, v14, a4);
                  if (CookiesWithResponseMessage)
                  {
                    uint64_t v20 = CookiesWithResponseMessage;
                    if (CFArrayGetCount(CookiesWithResponseMessage) >= 1)
                    {
                      HTTPCookieStoragePolicy::HTTPCookieStoragePolicy( (uint64_t)v21,  v14,  v15,  (uint64_t)a4,  v17,  1,  0LL,  0);
                      if (HTTPCookieStorage::Class(void)::sOnce_HTTPCookieStorage != -1) {
                        dispatch_once( &HTTPCookieStorage::Class(void)::sOnce_HTTPCookieStorage,  &__block_literal_global_9757);
                      }
                      HTTPCookieStorage::setCookiesWithPolicy( (HTTPCookieStorage *)(v11 + 16),  v20,  (const HTTPCookieStoragePolicy *)v21);
                      HTTPCookieStoragePolicy::~HTTPCookieStoragePolicy((HTTPCookieStoragePolicy *)v21);
                    }

                    CFRelease(v20);
                  }
                }
              }
            }

            else
            {
              objc_msgSend( (id)objc_msgSend(*(id *)(a1 + 112), "HTTPCookieStorage"),  "setCookies:forURL:mainDocumentURL:",  +[NSHTTPCookie cookiesWithResponseHeaderFields:forURL:]( NSHTTPCookie,  "cookiesWithResponseHeaderFields:forURL:",  v9,  objc_msgSend(a2, "URL")),  objc_msgSend(a2, "URL"),  objc_msgSend(a3, "mainDocumentURL"));
            }
          }
        }
      }
    }
  }

- (void)performBlockOnQueueAndRethrowExceptions:(uint64_t)a1
{
  if (a1)
  {
    uint64_t v5 = 0LL;
    uint64_t v6 = &v5;
    uint64_t v7 = 0x3052000000LL;
    int v8 = __Block_byref_object_copy__4352;
    uint64_t v9 = __Block_byref_object_dispose__4353;
    uint64_t v10 = 0LL;
    int v2 = *(dispatch_queue_s **)(a1 + 120);
    block[0] = MEMORY[0x1895F87A8];
    block[1] = 3221225472LL;
    block[2] = __68____NSURLBackgroundSession_performBlockOnQueueAndRethrowExceptions___block_invoke;
    block[3] = &unk_189C075D0;
    block[4] = a1;
    void block[5] = a2;
    block[6] = &v5;
    dispatch_sync(v2, block);
    int v3 = (void *)v6[5];
    if (v3)
    {
      objc_exception_throw(v3);
      __break(1u);
    }

    else
    {
      _Block_object_dispose(&v5, 8);
    }
  }

- (uint64_t)doesAVAssetDownloadSessionSupportMultipleDownloads
{
  if (objc_opt_class()) {
    return objc_opt_respondsToSelector() & 1;
  }
  uint64_t result = _os_crash();
  __break(1u);
  return result;
}

- (void)serializableAVAssetDownloadTaskOptionsFromOptions:(void *)a1 mediaSelections:(void *)a2 downloadConfiguration:(uint64_t)a3
{
  uint64_t v43 = *MEMORY[0x1895F89C0];
  if (a1) {
    id v6 = (id)[a1 mutableCopy];
  }
  else {
    id v6 = (id)[MEMORY[0x189603FC8] dictionary];
  }
  int v8 = v6;
  if (!-[__NSURLBackgroundSession doesAVAssetDownloadSessionSupportMultipleDownloads](v7))
  {
    if (![v8 objectForKeyedSubscript:@"AVAssetDownloadTaskMediaSelectionKey"]) {
      goto LABEL_29;
    }
    uint64_t v16 = objc_msgSend( (id)objc_msgSend(v8, "objectForKeyedSubscript:", @"AVAssetDownloadTaskMediaSelectionKey"),  "propertyList");
    int v17 = v8;
    uint64_t v18 = @"AVAssetDownloadTaskMediaSelectionKey";
    goto LABEL_28;
  }

  if (a2)
  {
    uint64_t v9 = (void *)[MEMORY[0x189603FA8] array];
    __int128 v37 = 0u;
    __int128 v38 = 0u;
    __int128 v39 = 0u;
    __int128 v40 = 0u;
    uint64_t v10 = [a2 countByEnumeratingWithState:&v37 objects:v42 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v38;
      do
      {
        for (uint64_t i = 0LL; i != v11; ++i)
        {
          if (*(void *)v38 != v12) {
            objc_enumerationMutation(a2);
          }
          objc_msgSend(v9, "addObject:", objc_msgSend(*(id *)(*((void *)&v37 + 1) + 8 * i), "propertyList"));
        }

        uint64_t v11 = [a2 countByEnumeratingWithState:&v37 objects:v42 count:16];
      }

      while (v11);
    }

    uint64_t v14 = v8;
    uint64_t v15 = (uint64_t)v9;
    goto LABEL_18;
  }

  if ([v8 objectForKeyedSubscript:@"AVAssetDownloadTaskMediaSelectionKey"])
  {
    uint64_t v19 = (void *)[v8 objectForKeyedSubscript:@"AVAssetDownloadTaskMediaSelectionKey"];
    uint64_t v15 = objc_msgSend(MEMORY[0x189603F18], "arrayWithObject:", objc_msgSend(v19, "propertyList"));
    uint64_t v14 = v8;
LABEL_18:
    [v14 setObject:v15 forKeyedSubscript:@"AVAssetDownloadSessionMediaSelectionArrayKey"];
  }

  uint64_t v20 = [a1 objectForKeyedSubscript:@"AVAssetDownloadTaskMediaSelectionsForMultichannelKey"];
  if (!v20) {
    goto LABEL_29;
  }
  uint64_t v21 = (void *)v20;
  __int16 v22 = (void *)[MEMORY[0x189603FA8] array];
  __int128 v33 = 0u;
  __int128 v34 = 0u;
  __int128 v35 = 0u;
  __int128 v36 = 0u;
  uint64_t v23 = [v21 countByEnumeratingWithState:&v33 objects:v41 count:16];
  if (v23)
  {
    uint64_t v24 = v23;
    uint64_t v25 = *(void *)v34;
    do
    {
      for (uint64_t j = 0LL; j != v24; ++j)
      {
        if (*(void *)v34 != v25) {
          objc_enumerationMutation(v21);
        }
        objc_msgSend(v22, "addObject:", objc_msgSend(*(id *)(*((void *)&v33 + 1) + 8 * j), "propertyList"));
      }

      uint64_t v24 = [v21 countByEnumeratingWithState:&v33 objects:v41 count:16];
    }

    while (v24);
  }

  uint64_t v18 = @"AVAssetDownloadTaskMediaSelectionsForMultichannelKey";
  int v17 = v8;
  uint64_t v16 = (uint64_t)v22;
LABEL_28:
  [v17 setObject:v16 forKeyedSubscript:v18];
LABEL_29:
  if (a3) {
    [v8 setObject:a3 forKeyedSubscript:@"AVAssetDownloadTaskDownloadConfigurationKey"];
  }
  uint64_t v27 = (void *)[v8 objectForKey:@"AVAssetDownloadTaskMinimumRequiredPresentationSizeKey"];
  if (v27)
  {
    uint64_t v28 = v27;
    if (!strncmp((const char *)[v27 objCType], "{CGSize=dd}", 0x10uLL))
    {
      [v28 getValue:&v32];
      DictionaryRepresentation_delayInitStub = (const void *)CGSizeCreateDictionaryRepresentation_delayInitStub(v32);
      CFTypeRef v29 = (id)CFMakeCollectable(DictionaryRepresentation_delayInitStub);
    }

    else
    {
      CFTypeRef v29 = 0LL;
    }

    [v8 setObject:v29 forKeyedSubscript:@"AVAssetDownloadTaskMinimumRequiredPresentationSizeKey"];
  }

  objc_msgSend( v8,  "removeObjectsForKeys:",  objc_msgSend((id)objc_msgSend(v8, "keysOfEntriesPassingTest:", &__block_literal_global_147), "allObjects"));
  return v8;
}

- (id)_onqueue_AVAssetDownloadTaskForURLAsset:(uint64_t)a3 URL:(uint64_t)a4 destinationURL:(uint64_t)a5 assetTitle:(uint64_t)a6 assetArtworkData:(void *)a7 options:(uint64_t)a8 downloadConfiguration:(char)a9 enableSPIDelegateCallbacks:
{
  uint64_t v72 = *MEMORY[0x1895F89C0];
  if (!result) {
    return result;
  }
  uint64_t v9 = (uint64_t)result;
  if (*((_BYTE *)result + 265))
  {
    int v10 = [result[14] _isProxySession];
    if (CFNLog::onceToken != -1) {
      dispatch_once(&CFNLog::onceToken, &__block_literal_global_1_4717);
    }
    uint64_t v11 = (os_log_s *)CFNLog::logger;
    BOOL v12 = os_log_type_enabled((os_log_t)CFNLog::logger, OS_LOG_TYPE_ERROR);
    if (v10)
    {
      if (!v12) {
        goto LABEL_13;
      }
      uint64_t v13 = *(void *)(v9 + 128);
      *(_DWORD *)__int128 buf = 138543362;
      uint64_t v71 = v13;
      uint64_t v14 = "ProxySession <%{public}@> attempted to create an AVAssetDownloadTask in a session that has been invalidated";
    }

    else
    {
      if (!v12) {
        goto LABEL_13;
      }
      uint64_t v58 = *(void *)(v9 + 128);
      *(_DWORD *)__int128 buf = 138543362;
      uint64_t v71 = v58;
      uint64_t v14 = "BackgroundSession <%{public}@> attempted to create an AVAssetDownloadTask in a session that has been invalidated";
    }

    _os_log_error_impl(&dword_18298D000, v11, OS_LOG_TYPE_ERROR, v14, buf, 0xCu);
LABEL_13:
    uint64_t v26 = (NSString *)dyld_program_sdk_at_least();
    if (!(_DWORD)v26) {
      return 0LL;
    }
    uint64_t v61 = __URLSESSION_CLIENT_API_MISUSE_INVALIDATED_SESSION__(v26);
    return (id *)-[__NSURLBackgroundSession backgroundDownloadsDirectory](v61);
  }

  if (!result[34])
  {
    if (a7) {
      id v28 = (id)[a7 mutableCopy];
    }
    else {
      id v28 = (id)[MEMORY[0x189603FC8] dictionary];
    }
    CFTypeRef v29 = v28;
    uint64_t v66 = a4;
    if (a4)
    {
      if (a2)
      {
LABEL_21:
        uint64_t v30 = [a2 downloadToken];
        uint64_t v31 = 0LL;
        uint64_t v65 = v30;
        if (!a8 && v66 && a4)
        {
          uint64_t v32 = [NSString stringWithFormat:@"CFNetworkAVDownload_%@.movpkg", destinationURLFragment( a2, (void *)objc_msgSend(NSString, "stringWithFormat:", @"%llu", v30))];
          uint64_t v31 = [-[__NSURLBackgroundSession backgroundDownloadsDirectory](v9) URLByAppendingPathComponent:v32 isDirectory:0];
          if (objc_msgSend((id)objc_msgSend(a2, "URL"), "isFileURL")) {
            [v29 setObject:MEMORY[0x189604A88] forKeyedSubscript:@"AVAssetDownloadSessionLinkAssetURLToDestinationURLKey"];
          }
          [v29 setObject:MEMORY[0x189604A88] forKeyedSubscript:@"AVAssetDownloadSessionDeleteDownloadWhenAssetFinalizesKey"];
          a3 = 0LL;
        }

        else
        {
          a3 = 0LL;
        }

- (void)backgroundDownloadsDirectory
{
  uint64_t v47 = *MEMORY[0x1895F89C0];
  int v2 = *(void **)(a1 + 248);
  uint64_t v41 = 0LL;
  if (v2) {
    goto LABEL_2;
  }
  uint64_t v42 = 0LL;
  if (![*(id *)(a1 + 112) sharedContainerIdentifier]) {
    goto LABEL_34;
  }
  int v10 = (void *)objc_msgSend( (id)objc_msgSend(MEMORY[0x1896078A8], "defaultManager"),  "containerURLForSecurityApplicationGroupIdentifier:",  objc_msgSend(*(id *)(a1 + 112), "sharedContainerIdentifier"));
  if (!v10)
  {
    int v18 = [*(id *)(a1 + 112) _isProxySession];
    if (CFNLog::onceToken != -1) {
      dispatch_once(&CFNLog::onceToken, &__block_literal_global_1_4717);
    }
    uint64_t v19 = (os_log_s *)CFNLog::logger;
    BOOL v20 = os_log_type_enabled((os_log_t)CFNLog::logger, OS_LOG_TYPE_ERROR);
    if (v18)
    {
      if (!v20) {
        goto LABEL_34;
      }
      uint64_t v21 = *(void *)(a1 + 128);
      uint64_t v22 = [*(id *)(a1 + 112) sharedContainerIdentifier];
      *(_DWORD *)__int128 buf = 138543618;
      uint64_t v44 = v21;
      __int16 v45 = 2112;
      uint64_t v46 = v22;
      uint64_t v23 = "ProxySession <%{public}@> failed to get URL for container with identifier %@";
    }

    else
    {
      if (!v20) {
        goto LABEL_34;
      }
      uint64_t v39 = *(void *)(a1 + 128);
      uint64_t v40 = [*(id *)(a1 + 112) sharedContainerIdentifier];
      *(_DWORD *)__int128 buf = 138543618;
      uint64_t v44 = v39;
      __int16 v45 = 2112;
      uint64_t v46 = v40;
      uint64_t v23 = "BackgroundSession <%{public}@> failed to get URL for container with identifier %@";
    }

    _os_log_error_impl(&dword_18298D000, v19, OS_LOG_TYPE_ERROR, v23, buf, 0x16u);
LABEL_34:
    uint64_t v11 = (void *)objc_msgSend( (id)objc_msgSend(MEMORY[0x1896078A8], "defaultManager", v41),  "URLForDirectory:inDomain:appropriateForURL:create:error:",  13,  1,  0,  1,  &v42);
    if (v42)
    {
      int v24 = [*(id *)(a1 + 112) _isProxySession];
      if (CFNLog::onceToken != -1) {
        dispatch_once(&CFNLog::onceToken, &__block_literal_global_1_4717);
      }
      uint64_t v25 = (os_log_s *)CFNLog::logger;
      BOOL v26 = os_log_type_enabled((os_log_t)CFNLog::logger, OS_LOG_TYPE_ERROR);
      if (v24)
      {
        if (v26)
        {
          uint64_t v27 = *(void *)(a1 + 128);
          *(_DWORD *)__int128 buf = 138543618;
          uint64_t v44 = v27;
          __int16 v45 = 2112;
          uint64_t v46 = v42;
          id v28 = "ProxySession <%{public}@> failed to get caches directory for app, error: %@";
          goto LABEL_47;
        }
      }

      else if (v26)
      {
        uint64_t v31 = *(void *)(a1 + 128);
        *(_DWORD *)__int128 buf = 138543618;
        uint64_t v44 = v31;
        __int16 v45 = 2112;
        uint64_t v46 = v42;
        id v28 = "BackgroundSession <%{public}@> failed to get caches directory for app, error: %@";
LABEL_47:
        _os_log_error_impl(&dword_18298D000, v25, OS_LOG_TYPE_ERROR, v28, buf, 0x16u);
        if (!v11) {
          goto LABEL_48;
        }
        goto LABEL_42;
      }
    }

    if (!v11) {
      goto LABEL_48;
    }
    goto LABEL_42;
  }

  uint64_t v11 = (void *)objc_msgSend( (id)objc_msgSend(v10, "URLByAppendingPathComponent:", @"Library"),  "URLByAppendingPathComponent:",  @"Caches");
  if (!v11)
  {
LABEL_48:
    int v32 = objc_msgSend(*(id *)(a1 + 112), "_isProxySession", v41);
    if (CFNLog::onceToken != -1) {
      dispatch_once(&CFNLog::onceToken, &__block_literal_global_1_4717);
    }
    __int128 v33 = (os_log_s *)CFNLog::logger;
    BOOL v34 = os_log_type_enabled((os_log_t)CFNLog::logger, OS_LOG_TYPE_ERROR);
    if (v32)
    {
      if (v34)
      {
        uint64_t v35 = *(void *)(a1 + 128);
        *(_DWORD *)__int128 buf = 138543362;
        uint64_t v44 = v35;
        uint64_t v36 = "ProxySession <%{public}@> failed to obtain the Caches directory for this user-context. We will not be able to download.";
LABEL_57:
        _os_log_error_impl(&dword_18298D000, v33, OS_LOG_TYPE_ERROR, v36, buf, 0xCu);
      }
    }

    else if (v34)
    {
      uint64_t v38 = *(void *)(a1 + 128);
      *(_DWORD *)__int128 buf = 138543362;
      uint64_t v44 = v38;
      uint64_t v36 = "BackgroundSession <%{public}@> failed to obtain the Caches directory for this user-context. We will not be a"
            "ble to download.";
      goto LABEL_57;
    }

    return 0LL;
  }

- (uint64_t)validateSerializabilityForRequest:(uint64_t)result completion:(uint64_t)a2
{
  if (!result
    || (objc_opt_class(), uint64_t result = objc_opt_isKindOfClass(), (result & 1) != 0)
    || (objc_opt_class(), uint64_t result = objc_opt_isKindOfClass(), (result & 1) != 0))
  {
    if (!a2) {
      return result;
    }
    int v3 = (void *)MEMORY[0x189603F70];
    uint64_t v4 = *MEMORY[0x189603A48];
    int v5 = @"Completion handler blocks are not supported in background sessions. Use a delegate instead.";
  }

  else
  {
    id v6 = (void *)MEMORY[0x189603F70];
    uint64_t v7 = *MEMORY[0x189603A60];
    int v5 = (const __CFString *)[NSString stringWithFormat:@"Custom subclasses of NSURLRequest are not supported in background sessions. Attempted to use a request of class %@", objc_opt_class()];
    int v3 = v6;
    uint64_t v4 = v7;
  }

  objc_exception_throw((id)[v3 exceptionWithName:v4 reason:v5 userInfo:0]);
  return -[__NSURLBackgroundSession _onqueue_dummyTaskForClass:withRequest:error:](v8, v9);
}

- (id)_onqueue_dummyTaskForClass:(void *)a1 withRequest:(Class)a2 error:(void *)a3
{
  id v5 = objc_alloc(a2);
  uint64_t v6 = a1[20];
  a1[20] = v6 + 1;
  uint64_t v7 = (void *)objc_msgSend( v5,  "initWithOriginalRequest:ident:taskGroup:",  0,  v6,  objc_msgSend(a1, "defaultTaskGroup"));
  Class v9 = v7;
  if (v7) {
    objc_setProperty_atomic(v7, v8, a3, 776LL);
  }
  return v9;
}

- (void)moveFileForResumeData:(void *)a3 fromDirectory:(void *)a4 toDirectory:
{
  uint64_t v24 = *MEMORY[0x1895F89C0];
  id v7 = copyDecodedResumeData(a2);
  uint64_t v8 = [v7 objectForKeyedSubscript:@"NSURLSessionResumeInfoTempFileName"];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = [a3 stringByAppendingPathComponent:v8];
    uint64_t v11 = [a4 stringByAppendingPathComponent:v9];
    uint64_t v19 = 0LL;
    if ((objc_msgSend( (id)objc_msgSend(MEMORY[0x1896078A8], "defaultManager"),  "moveItemAtPath:toPath:error:",  v10,  v11,  &v19) & 1) == 0)
    {
      if (a1) {
        int v12 = *(void **)(a1 + 112);
      }
      else {
        int v12 = 0LL;
      }
      int v13 = [v12 _isProxySession];
      if (CFNLog::onceToken != -1) {
        dispatch_once(&CFNLog::onceToken, &__block_literal_global_1_4717);
      }
      BOOL v14 = (os_log_s *)CFNLog::logger;
      BOOL v15 = os_log_type_enabled((os_log_t)CFNLog::logger, OS_LOG_TYPE_DEBUG);
      if (v13)
      {
        if (v15)
        {
          if (a1) {
            uint64_t v16 = *(void *)(a1 + 128);
          }
          else {
            uint64_t v16 = 0LL;
          }
          *(_DWORD *)__int128 buf = 138543618;
          uint64_t v21 = v16;
          __int16 v22 = 2112;
          uint64_t v23 = v19;
          uint64_t v17 = "ProxySession <%{public}@> error moving resume file: %@";
LABEL_17:
          _os_log_debug_impl(&dword_18298D000, v14, OS_LOG_TYPE_DEBUG, v17, buf, 0x16u);
        }
      }

      else if (v15)
      {
        if (a1) {
          uint64_t v18 = *(void *)(a1 + 128);
        }
        else {
          uint64_t v18 = 0LL;
        }
        *(_DWORD *)__int128 buf = 138543618;
        uint64_t v21 = v18;
        __int16 v22 = 2112;
        uint64_t v23 = v19;
        uint64_t v17 = "BackgroundSession <%{public}@> error moving resume file: %@";
        goto LABEL_17;
      }
    }
  }
}

- (void)moveFileToTempForBackgroundResumeData:(uint64_t)a1
{
  if (a1 && ![*(id *)(a1 + 112) _directoryForDownloadedFiles])
  {
    uint64_t v4 = -[__NSURLBackgroundSession backgroundDownloadsDirectory](a1);
    if (v4)
    {
      id v5 = (void *)[v4 path];
      uint64_t v6 = NSTemporaryDirectory();
      -[__NSURLBackgroundSession moveFileForResumeData:fromDirectory:toDirectory:](a1, a2, v5, v6);
    }
  }

@end