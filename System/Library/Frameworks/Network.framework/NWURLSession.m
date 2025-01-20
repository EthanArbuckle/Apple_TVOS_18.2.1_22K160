@interface NWURLSession
+ (void)_strictTrustEvaluate:(id)a3 queue:(id)a4 completionHandler:(id)a5;
+ (void)initialize;
- (BOOL)isKindOfClass:(Class)a3;
- (NSOperationQueue)delegateQueue;
- (NSString)sessionDescription;
- (NSURLSessionConfiguration)configuration;
- (NSURLSessionDelegate)delegate;
- (NWURLSession)initWithConfiguration:(id)a3 delegate:(id)a4 delegateQueue:(id)a5;
- (OS_nw_context)_networkContext;
- (id)_dataTaskWithRequest:(id)a3 delegate:(id)a4;
- (id)_dataTaskWithRequest:(id)a3 delegate:(id)a4 completionHandler:(id)a5;
- (id)_dataTaskWithURL:(id)a3 delegate:(id)a4;
- (id)_dataTaskWithURL:(id)a3 delegate:(id)a4 completionHandler:(id)a5;
- (id)_downloadTaskWithRequest:(id)a3 delegate:(id)a4 completionHandler:(id)a5;
- (id)_downloadTaskWithResumeData:(id)a3 delegate:(id)a4 completionHandler:(id)a5;
- (id)_downloadTaskWithURL:(id)a3 delegate:(id)a4 completionHandler:(id)a5;
- (id)_uploadTaskWithRequest:(id)a3 fromData:(id)a4 delegate:(id)a5 completionHandler:(id)a6;
- (id)_uploadTaskWithRequest:(id)a3 fromFile:(id)a4 delegate:(id)a5 completionHandler:(id)a6;
- (id)dataTaskWithRequest:(id)a3;
- (id)dataTaskWithRequest:(id)a3 completionHandler:(id)a4;
- (id)dataTaskWithURL:(id)a3;
- (id)dataTaskWithURL:(id)a3 completionHandler:(id)a4;
- (id)downloadTaskWithRequest:(id)a3;
- (id)downloadTaskWithRequest:(id)a3 completionHandler:(id)a4;
- (id)downloadTaskWithResumeData:(id)a3;
- (id)downloadTaskWithResumeData:(id)a3 completionHandler:(id)a4;
- (id)downloadTaskWithURL:(id)a3;
- (id)downloadTaskWithURL:(id)a3 completionHandler:(id)a4;
- (id)preparedRequestFromRequest:(void *)a3 bodyInfo:;
- (id)streamTaskWithHostName:(id)a3 port:(int64_t)a4;
- (id)streamTaskWithNetService:(id)a3;
- (id)uploadTaskWithRequest:(id)a3 fromData:(id)a4;
- (id)uploadTaskWithRequest:(id)a3 fromData:(id)a4 completionHandler:(id)a5;
- (id)uploadTaskWithRequest:(id)a3 fromFile:(id)a4;
- (id)uploadTaskWithRequest:(id)a3 fromFile:(id)a4 completionHandler:(id)a5;
- (id)uploadTaskWithStreamedRequest:(id)a3;
- (id)webSocketTaskWithRequest:(id)a3;
- (id)webSocketTaskWithURL:(id)a3;
- (id)webSocketTaskWithURL:(id)a3 protocols:(id)a4;
- (void)checkForCompletion;
- (void)finishTasksAndInvalidate;
- (void)flushWithCompletionHandler:(id)a3;
- (void)getAllTasksWithCompletionHandler:(id)a3;
- (void)getTasksWithCompletionHandler:(id)a3;
- (void)invalidateAndCancel;
- (void)resetWithCompletionHandler:(id)a3;
- (void)setSessionDescription:(id)a3;
- (void)taskCompleted:(os_unfair_lock_s *)a1;
- (void)taskStarted:(os_unfair_lock_s *)a1;
- (void)teardownAllConnections;
- (void)withLock:(os_unfair_lock_s *)a1;
@end

@implementation NWURLSession

- (BOOL)isKindOfClass:(Class)a3
{
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___NWURLSession;
  if (-[NWURLSession isKindOfClass:](&v5, sel_isKindOfClass_)) {
    return 1;
  }
  else {
    return -[objc_class isEqual:](a3, "isEqual:", objc_opt_class());
  }
}

- (NWURLSession)initWithConfiguration:(id)a3 delegate:(id)a4 delegateQueue:(id)a5
{
  uint64_t v63 = *MEMORY[0x1895F89C0];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v58.receiver = self;
  v58.super_class = (Class)&OBJC_CLASS___NWURLSession;
  v11 = -[NWURLSession init](&v58, sel_init);
  v12 = v11;
  if (!v11) {
    goto LABEL_31;
  }
  uuid_generate_random(v11->uuid);
  v12->lock._os_unfair_lock_opaque = 0;
  dispatch_queue_t v13 = dispatch_queue_create("com.apple.NWURLSession", 0LL);
  queue = v12->_queue;
  v12->_queue = (OS_dispatch_queue *)v13;

  BOOL v15 = -[NWConcrete_nw_context initWithIdentifier:](objc_alloc(&OBJC_CLASS___NWConcrete_nw_context), "NWURLSession");
  context = v12->_context;
  v12->_context = (OS_nw_context *)v15;

  nw_context_set_isolate_protocol_cache(v12->_context, 1);
  nw_context_set_privacy_level(v12->_context, [v8 _loggingPrivacyLevel]);
  nw_context_activate(v12->_context);
  nw_queue_context_target_dispatch_queue(v12->_context, v12->_queue);
  __int128 v54 = 0u;
  __int128 v55 = 0u;
  __int128 v56 = 0u;
  __int128 v57 = 0u;
  [v8 _proxyConfigurations];
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v18 = [v17 countByEnumeratingWithState:&v54 objects:v62 count:16];
  if (v18)
  {
    uint64_t v19 = v18;
    uint64_t v20 = *(void *)v55;
    do
    {
      for (uint64_t i = 0LL; i != v19; ++i)
      {
        if (*(void *)v55 != v20) {
          objc_enumerationMutation(v17);
        }
        nw_context_add_proxy(v12->_context, *(void **)(*((void *)&v54 + 1) + 8 * i));
      }

      uint64_t v19 = [v17 countByEnumeratingWithState:&v54 objects:v62 count:16];
    }

    while (v19);
  }

  v51 = v8;
  if (v8)
  {
    uint64_t v22 = [v8 copy];
  }

  else
  {
    uint64_t v22 = [MEMORY[0x189601F00] defaultSessionConfiguration];
  }

  internalConfiguration = v12->_internalConfiguration;
  v12->_internalConfiguration = (NSURLSessionConfiguration *)v22;

  v24 = objc_alloc(&OBJC_CLASS___NWURLSessionDelegateWrapper);
  v25 = v12->_queue;
  v26 = v12;
  v27 = v25;
  id v53 = v9;
  id v28 = v9;
  id v52 = v10;
  id v29 = v10;
  if (v24)
  {
    v59.receiver = v24;
    v59.super_class = (Class)&OBJC_CLASS___NWURLSessionDelegateWrapper;
    id v30 = -[NWURLSession init](&v59, sel_init);
    v24 = (NWURLSessionDelegateWrapper *)v30;
    if (v30)
    {
      *((void *)v30 + 4) = v26;
      objc_storeStrong((id *)v30 + 5, v25);
      objc_storeStrong((id *)&v24->_wrappedDelegate, a4);
      v31 = objc_alloc(&OBJC_CLASS___NWURLSessionDelegateQueue);
      id v32 = v29;
      if (!v31) {
        goto LABEL_21;
      }
      v60.receiver = v31;
      v60.super_class = (Class)&OBJC_CLASS___NWURLSessionDelegateQueue;
      id v33 = -[NWURLSession init](&v60, sel_init);
      v31 = (NWURLSessionDelegateQueue *)v33;
      if (!v33) {
        goto LABEL_21;
      }
      objc_storeStrong((id *)v33 + 2, a5);
      [MEMORY[0x189607988] mainQueue];
      id v34 = (id)objc_claimAutoreleasedReturnValue();

      if (v34 == v32)
      {
        uint64_t v38 = getMainQueue();
        dispatchQueue = (dispatch_queue_attr_s *)v31->__dispatchQueue;
        v31->__dispatchQueue = (OS_dispatch_queue *)v38;
      }

      else
      {
        if (v32)
        {
LABEL_21:

          delegateQueueWrapper = v24->_delegateQueueWrapper;
          v24->_delegateQueueWrapper = v31;

          goto LABEL_22;
        }

        dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
        dispatchQueue = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue();
        dispatch_queue_t v36 = dispatch_queue_create("com.apple.NSURLSession-delegate", dispatchQueue);
        v37 = v31->__dispatchQueue;
        v31->__dispatchQueue = (OS_dispatch_queue *)v36;
      }

      goto LABEL_21;
    }
  }

- (NSURLSessionConfiguration)configuration
{
  if (self) {
    self = (NWURLSession *)self->_internalConfiguration;
  }
  return (NSURLSessionConfiguration *)(id)-[NWURLSession copy](self, "copy");
}

- (NSOperationQueue)delegateQueue
{
  if (!self) {
    return (NSOperationQueue *)self;
  }
  delegateWrapper = self->_delegateWrapper;
  if (delegateWrapper)
  {
    delegateQueueWrapper = (os_unfair_lock_s *)delegateWrapper->_delegateQueueWrapper;
    if (delegateQueueWrapper)
    {
      if (!objc_getProperty(delegateWrapper->_delegateQueueWrapper, a2, 16LL, 1))
      {
        v7[0] = MEMORY[0x1895F87A8];
        v7[1] = 3221225472LL;
        id v8 = __42__NWURLSessionDelegateQueue_delegateQueue__block_invoke;
        id v9 = &unk_189BC93A0;
        id v10 = delegateQueueWrapper;
        v6 = v7;
        os_unfair_lock_lock(delegateQueueWrapper + 2);
        ((void (*)(void *))v8)(v6);

        os_unfair_lock_unlock(delegateQueueWrapper + 2);
      }

      self = (NWURLSession *)objc_getProperty(delegateQueueWrapper, v4, 16LL, 1);
      return (NSOperationQueue *)self;
    }
  }

  return (NSOperationQueue *)0LL;
}

- (NSURLSessionDelegate)delegate
{
  if (self && (delegateWrapper = self->_delegateWrapper) != 0LL) {
    return (NSURLSessionDelegate *)objc_getProperty(delegateWrapper, a2, 16LL, 1);
  }
  else {
    return 0LL;
  }
}

- (void)finishTasksAndInvalidate
{
  uint64_t v10 = *MEMORY[0x1895F89C0];
  if (__nwlog_url_log::onceToken != -1) {
    dispatch_once(&__nwlog_url_log::onceToken, &__block_literal_global_54_44366);
  }
  v3 = (os_log_s *)(id)gurlLogObj;
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 68289026;
    int v7 = 16;
    __int16 v8 = 2098;
    uuid = self->uuid;
    _os_log_impl( &dword_181A5C000,  v3,  OS_LOG_TYPE_DEFAULT,  "Session <%{public,uuid_t}.16P> finish tasks and invalidate",  buf,  0x12u);
  }

  v5[0] = MEMORY[0x1895F87A8];
  v5[1] = 3221225472LL;
  v5[2] = __40__NWURLSession_finishTasksAndInvalidate__block_invoke;
  v5[3] = &unk_189BC93A0;
  v5[4] = self;
  v4 = self;
  -[NWURLSession withLock:]((os_unfair_lock_s *)v4, v5);
}

- (void)invalidateAndCancel
{
  uint64_t v10 = *MEMORY[0x1895F89C0];
  if (__nwlog_url_log::onceToken != -1) {
    dispatch_once(&__nwlog_url_log::onceToken, &__block_literal_global_54_44366);
  }
  v3 = (os_log_s *)(id)gurlLogObj;
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 68289026;
    int v7 = 16;
    __int16 v8 = 2098;
    uuid = self->uuid;
    _os_log_impl( &dword_181A5C000,  v3,  OS_LOG_TYPE_DEFAULT,  "Session <%{public,uuid_t}.16P> invalidate and cancel",  buf,  0x12u);
  }

  v5[0] = MEMORY[0x1895F87A8];
  v5[1] = 3221225472LL;
  v5[2] = __35__NWURLSession_invalidateAndCancel__block_invoke;
  v5[3] = &unk_189BC93A0;
  v5[4] = self;
  v4 = self;
  -[NWURLSession withLock:]((os_unfair_lock_s *)v4, v5);
}

- (void)resetWithCompletionHandler:(id)a3
{
  uint64_t v14 = *MEMORY[0x1895F89C0];
  id v4 = a3;
  if (__nwlog_url_log::onceToken != -1) {
    dispatch_once(&__nwlog_url_log::onceToken, &__block_literal_global_54_44366);
  }
  objc_super v5 = (os_log_s *)(id)gurlLogObj;
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 68289026;
    int v11 = 16;
    __int16 v12 = 2098;
    uuid = self->uuid;
    _os_log_impl(&dword_181A5C000, v5, OS_LOG_TYPE_DEFAULT, "Session <%{public,uuid_t}.16P> reset", buf, 0x12u);
  }

  if (self) {
    self = (NWURLSession *)self->_delegateWrapper;
  }
  v8[0] = MEMORY[0x1895F87A8];
  v8[1] = 3221225472LL;
  v8[2] = __43__NWURLSession_resetWithCompletionHandler___block_invoke;
  v8[3] = &unk_189BC8740;
  id v9 = v4;
  id v6 = v4;
  int v7 = v6;
  if (self)
  {
    -[NWURLSessionDelegateQueue runDelegateBlock:]((void *)self->_HTTPCookieStorage, v8);
    int v7 = v9;
  }
}

- (void)flushWithCompletionHandler:(id)a3
{
  uint64_t v14 = *MEMORY[0x1895F89C0];
  id v4 = a3;
  if (__nwlog_url_log::onceToken != -1) {
    dispatch_once(&__nwlog_url_log::onceToken, &__block_literal_global_54_44366);
  }
  objc_super v5 = (os_log_s *)(id)gurlLogObj;
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 68289026;
    int v11 = 16;
    __int16 v12 = 2098;
    uuid = self->uuid;
    _os_log_impl(&dword_181A5C000, v5, OS_LOG_TYPE_DEFAULT, "Session <%{public,uuid_t}.16P> flush", buf, 0x12u);
  }

  if (self) {
    self = (NWURLSession *)self->_delegateWrapper;
  }
  v8[0] = MEMORY[0x1895F87A8];
  v8[1] = 3221225472LL;
  v8[2] = __43__NWURLSession_flushWithCompletionHandler___block_invoke;
  v8[3] = &unk_189BC8740;
  id v9 = v4;
  id v6 = v4;
  int v7 = v6;
  if (self)
  {
    -[NWURLSessionDelegateQueue runDelegateBlock:]((void *)self->_HTTPCookieStorage, v8);
    int v7 = v9;
  }
}

- (void)getTasksWithCompletionHandler:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1895F87A8];
  v6[1] = 3221225472LL;
  v6[2] = __46__NWURLSession_getTasksWithCompletionHandler___block_invoke;
  v6[3] = &unk_189BC91E8;
  v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  -[NWURLSession withLock:]((os_unfair_lock_s *)self, v6);
  (*((void (**)(id, void, void, void))v5 + 2))(v5, 0LL, 0LL, 0LL);
}

- (void)getAllTasksWithCompletionHandler:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1895F87A8];
  v6[1] = 3221225472LL;
  v6[2] = __49__NWURLSession_getAllTasksWithCompletionHandler___block_invoke;
  v6[3] = &unk_189BC91E8;
  v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  -[NWURLSession withLock:]((os_unfair_lock_s *)self, v6);
}

- (id)dataTaskWithRequest:(id)a3
{
  return -[NWURLSession _dataTaskWithRequest:delegate:](self, "_dataTaskWithRequest:delegate:", a3, 0LL);
}

- (id)dataTaskWithURL:(id)a3
{
  return -[NWURLSession _dataTaskWithURL:delegate:](self, "_dataTaskWithURL:delegate:", a3, 0LL);
}

- (id)uploadTaskWithRequest:(id)a3 fromFile:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  [v6 URL];
  __int16 v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v8)
  {
    v17 = (void *)MEMORY[0x189603F70];
    uint64_t v18 = *MEMORY[0x189603A60];
    uint64_t v19 = @"URLSessionTask created with nil URL";
LABEL_13:
    [v17 exceptionWithName:v18 reason:v19 userInfo:0];
    id v20 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v20);
    goto LABEL_14;
  }

  if (!v7)
  {
    v17 = (void *)MEMORY[0x189603F70];
    uint64_t v18 = *MEMORY[0x189603A60];
    uint64_t v19 = @"URLSessionTask created with nil fileURL";
    goto LABEL_13;
  }

  if (([v7 isFileURL] & 1) == 0)
  {
    v17 = (void *)MEMORY[0x189603F70];
    uint64_t v18 = *MEMORY[0x189603A60];
    uint64_t v19 = @"URLSessionTask created with invalid fileURL";
    goto LABEL_13;
  }

  uint64_t v29 = 0LL;
  id v30 = &v29;
  uint64_t v31 = 0x3032000000LL;
  id v32 = __Block_byref_object_copy__43604;
  id v33 = __Block_byref_object_dispose__43605;
  id v34 = 0LL;
  uint64_t v21 = MEMORY[0x1895F87A8];
  uint64_t v22 = 3221225472LL;
  v23 = __47__NWURLSession_uploadTaskWithRequest_fromFile___block_invoke;
  v24 = &unk_189BBE1E0;
  v25 = self;
  id v7 = v7;
  id v26 = v7;
  id v6 = v6;
  id v27 = v6;
  id v28 = &v29;
  -[NWURLSession withLock:]((os_unfair_lock_s *)self, &v21);
  uint64_t v9 = v30[5];
  if (!v9)
  {
LABEL_14:
    int v11 = 0LL;
    goto LABEL_9;
  }

  uint64_t v10 = 248LL;
  if (!*(void *)(v9 + 248)) {
    uint64_t v10 = 240LL;
  }
  int v11 = *(id *)(v9 + v10);
  if (v11)
  {
    id v12 = (id)v30[5];
    -[NWURLSessionDelegateWrapper delegateFor_didCreateTask](v11, v13);
    uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "URLSession:didCreateTask:", v11[4], v12, v21, v22, v23, v24, v25, v26);
  }

- (id)uploadTaskWithRequest:(id)a3 fromData:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  [v6 URL];
  __int16 v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v8)
  {
    v17 = (void *)MEMORY[0x189603F70];
    uint64_t v18 = *MEMORY[0x189603A60];
    uint64_t v19 = @"URLSessionTask created with nil URL";
LABEL_11:
    [v17 exceptionWithName:v18 reason:v19 userInfo:0];
    id v20 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v20);
    goto LABEL_12;
  }

  if (!v7)
  {
    v17 = (void *)MEMORY[0x189603F70];
    uint64_t v18 = *MEMORY[0x189603A60];
    uint64_t v19 = @"URLSessionTask created with nil bodyData";
    goto LABEL_11;
  }

  uint64_t v29 = 0LL;
  id v30 = &v29;
  uint64_t v31 = 0x3032000000LL;
  id v32 = __Block_byref_object_copy__43604;
  id v33 = __Block_byref_object_dispose__43605;
  id v34 = 0LL;
  uint64_t v21 = MEMORY[0x1895F87A8];
  uint64_t v22 = 3221225472LL;
  v23 = __47__NWURLSession_uploadTaskWithRequest_fromData___block_invoke;
  v24 = &unk_189BBE1E0;
  v25 = self;
  id v7 = v7;
  id v26 = v7;
  id v6 = v6;
  id v27 = v6;
  id v28 = &v29;
  -[NWURLSession withLock:]((os_unfair_lock_s *)self, &v21);
  uint64_t v9 = v30[5];
  if (!v9)
  {
LABEL_12:
    int v11 = 0LL;
    goto LABEL_8;
  }

  uint64_t v10 = 248LL;
  if (!*(void *)(v9 + 248)) {
    uint64_t v10 = 240LL;
  }
  int v11 = *(id *)(v9 + v10);
  if (v11)
  {
    id v12 = (id)v30[5];
    -[NWURLSessionDelegateWrapper delegateFor_didCreateTask](v11, v13);
    uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "URLSession:didCreateTask:", v11[4], v12, v21, v22, v23, v24, v25, v26);
  }

- (id)uploadTaskWithStreamedRequest:(id)a3
{
  id v4 = a3;
  [v4 URL];
  id v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
  {
    [MEMORY[0x189603F70] exceptionWithName:*MEMORY[0x189603A60] reason:@"URLSessionTask created with nil URL" userInfo:0];
    id v14 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v14);
    goto LABEL_9;
  }

  uint64_t v18 = 0LL;
  uint64_t v19 = &v18;
  uint64_t v20 = 0x3032000000LL;
  uint64_t v21 = __Block_byref_object_copy__43604;
  uint64_t v22 = __Block_byref_object_dispose__43605;
  id v23 = 0LL;
  v15[0] = MEMORY[0x1895F87A8];
  v15[1] = 3221225472LL;
  v15[2] = __46__NWURLSession_uploadTaskWithStreamedRequest___block_invoke;
  v15[3] = &unk_189BBEEE8;
  v15[4] = self;
  id v4 = v4;
  id v16 = v4;
  v17 = &v18;
  -[NWURLSession withLock:]((os_unfair_lock_s *)self, v15);
  uint64_t v6 = v19[5];
  if (!v6)
  {
LABEL_9:
    __int16 v8 = 0LL;
    goto LABEL_7;
  }

  uint64_t v7 = 248LL;
  if (!*(void *)(v6 + 248)) {
    uint64_t v7 = 240LL;
  }
  __int16 v8 = *(id *)(v6 + v7);
  if (v8)
  {
    id v9 = (id)v19[5];
    -[NWURLSessionDelegateWrapper delegateFor_didCreateTask](v8, v10);
    int v11 = (void *)objc_claimAutoreleasedReturnValue();
    [v11 URLSession:v8[4] didCreateTask:v9];
  }

- (id)downloadTaskWithRequest:(id)a3
{
  id v4 = a3;
  [v4 URL];
  id v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
  {
    [MEMORY[0x189603F70] exceptionWithName:*MEMORY[0x189603A60] reason:@"URLSessionTask created with nil URL" userInfo:0];
    id v14 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v14);
    goto LABEL_9;
  }

  uint64_t v18 = 0LL;
  uint64_t v19 = &v18;
  uint64_t v20 = 0x3032000000LL;
  uint64_t v21 = __Block_byref_object_copy__43604;
  uint64_t v22 = __Block_byref_object_dispose__43605;
  id v23 = 0LL;
  v15[0] = MEMORY[0x1895F87A8];
  v15[1] = 3221225472LL;
  v15[2] = __40__NWURLSession_downloadTaskWithRequest___block_invoke;
  v15[3] = &unk_189BBEEE8;
  v15[4] = self;
  id v4 = v4;
  id v16 = v4;
  v17 = &v18;
  -[NWURLSession withLock:]((os_unfair_lock_s *)self, v15);
  uint64_t v6 = v19[5];
  if (!v6)
  {
LABEL_9:
    __int16 v8 = 0LL;
    goto LABEL_7;
  }

  uint64_t v7 = 248LL;
  if (!*(void *)(v6 + 248)) {
    uint64_t v7 = 240LL;
  }
  __int16 v8 = *(id *)(v6 + v7);
  if (v8)
  {
    id v9 = (id)v19[5];
    -[NWURLSessionDelegateWrapper delegateFor_didCreateTask](v8, v10);
    int v11 = (void *)objc_claimAutoreleasedReturnValue();
    [v11 URLSession:v8[4] didCreateTask:v9];
  }

- (id)downloadTaskWithURL:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    [MEMORY[0x189603F70] exceptionWithName:*MEMORY[0x189603A60] reason:@"URLSessionTask created with nil URL" userInfo:0];
    id v14 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v14);
    goto LABEL_9;
  }

  uint64_t v18 = 0LL;
  uint64_t v19 = &v18;
  uint64_t v20 = 0x3032000000LL;
  uint64_t v21 = __Block_byref_object_copy__43604;
  uint64_t v22 = __Block_byref_object_dispose__43605;
  id v23 = 0LL;
  v15[0] = MEMORY[0x1895F87A8];
  v15[1] = 3221225472LL;
  v15[2] = __36__NWURLSession_downloadTaskWithURL___block_invoke;
  v15[3] = &unk_189BBEEE8;
  v15[4] = self;
  id v3 = v5;
  id v16 = v3;
  v17 = &v18;
  -[NWURLSession withLock:]((os_unfair_lock_s *)self, v15);
  uint64_t v6 = v19[5];
  if (!v6)
  {
LABEL_9:
    __int16 v8 = 0LL;
    goto LABEL_7;
  }

  uint64_t v7 = 248LL;
  if (!*(void *)(v6 + 248)) {
    uint64_t v7 = 240LL;
  }
  __int16 v8 = *(id *)(v6 + v7);
  if (v8)
  {
    id v9 = (id)v19[5];
    -[NWURLSessionDelegateWrapper delegateFor_didCreateTask](v8, v10);
    int v11 = (void *)objc_claimAutoreleasedReturnValue();
    [v11 URLSession:v8[4] didCreateTask:v9];
  }

- (id)downloadTaskWithResumeData:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    [MEMORY[0x189603F70] exceptionWithName:*MEMORY[0x189603A60] reason:@"URLSessionDownloadTask created with nil resume data" userInfo:0];
    id v14 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v14);
    goto LABEL_9;
  }

  uint64_t v18 = 0LL;
  uint64_t v19 = &v18;
  uint64_t v20 = 0x3032000000LL;
  uint64_t v21 = __Block_byref_object_copy__43604;
  uint64_t v22 = __Block_byref_object_dispose__43605;
  id v23 = 0LL;
  v15[0] = MEMORY[0x1895F87A8];
  v15[1] = 3221225472LL;
  v15[2] = __43__NWURLSession_downloadTaskWithResumeData___block_invoke;
  v15[3] = &unk_189BBEEE8;
  v15[4] = self;
  id v3 = v5;
  id v16 = v3;
  v17 = &v18;
  -[NWURLSession withLock:]((os_unfair_lock_s *)self, v15);
  uint64_t v6 = v19[5];
  if (!v6)
  {
LABEL_9:
    __int16 v8 = 0LL;
    goto LABEL_7;
  }

  uint64_t v7 = 248LL;
  if (!*(void *)(v6 + 248)) {
    uint64_t v7 = 240LL;
  }
  __int16 v8 = *(id *)(v6 + v7);
  if (v8)
  {
    id v9 = (id)v19[5];
    -[NWURLSessionDelegateWrapper delegateFor_didCreateTask](v8, v10);
    int v11 = (void *)objc_claimAutoreleasedReturnValue();
    [v11 URLSession:v8[4] didCreateTask:v9];
  }

- (id)streamTaskWithHostName:(id)a3 port:(int64_t)a4
{
  id v7 = a3;
  if (!v7)
  {
    id v16 = (void *)MEMORY[0x189603F70];
    uint64_t v17 = *MEMORY[0x189603A60];
    uint64_t v18 = @"URLSessionTask created with nil hostname";
LABEL_11:
    [v16 exceptionWithName:v17 reason:v18 userInfo:0];
    id v19 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v19);
    goto LABEL_12;
  }

  if ((unint64_t)(a4 - 0x10000) <= 0xFFFFFFFFFFFF0000LL)
  {
    id v16 = (void *)MEMORY[0x189603F70];
    uint64_t v17 = *MEMORY[0x189603A60];
    uint64_t v18 = @"URLSessionTask created with invalid port";
    goto LABEL_11;
  }

  uint64_t v28 = 0LL;
  uint64_t v29 = &v28;
  uint64_t v30 = 0x3032000000LL;
  uint64_t v31 = __Block_byref_object_copy__43604;
  id v32 = __Block_byref_object_dispose__43605;
  id v33 = 0LL;
  uint64_t v20 = MEMORY[0x1895F87A8];
  uint64_t v21 = 3221225472LL;
  uint64_t v22 = __44__NWURLSession_streamTaskWithHostName_port___block_invoke;
  id v23 = &unk_189BBEC90;
  v24 = self;
  id v26 = &v28;
  id v4 = v7;
  id v25 = v4;
  int64_t v27 = a4;
  -[NWURLSession withLock:]((os_unfair_lock_s *)self, &v20);
  uint64_t v8 = v29[5];
  if (!v8)
  {
LABEL_12:
    uint64_t v10 = 0LL;
    goto LABEL_8;
  }

  uint64_t v9 = 248LL;
  if (!*(void *)(v8 + 248)) {
    uint64_t v9 = 240LL;
  }
  uint64_t v10 = *(id *)(v8 + v9);
  if (v10)
  {
    id v11 = (id)v29[5];
    -[NWURLSessionDelegateWrapper delegateFor_didCreateTask](v10, v12);
    dispatch_queue_t v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "URLSession:didCreateTask:", v10[4], v11, v20, v21, v22, v23, v24);
  }

- (id)streamTaskWithNetService:(id)a3
{
  id v3 = a3;
  [MEMORY[0x189603F70] exceptionWithName:*MEMORY[0x189603A48] reason:@"NetService is not supported by the new loader" userInfo:0];
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v4);
  return -[NWURLSession webSocketTaskWithURL:](v5, v6, v7);
}

- (id)webSocketTaskWithURL:(id)a3
{
  return -[NWURLSession webSocketTaskWithURL:protocols:]( self,  "webSocketTaskWithURL:protocols:",  a3,  MEMORY[0x189604A58]);
}

- (id)webSocketTaskWithURL:(id)a3 protocols:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  if (!v7)
  {
    uint64_t v17 = (void *)MEMORY[0x189603F70];
    uint64_t v18 = *MEMORY[0x189603A60];
    id v19 = @"URLSessionTask created with nil URL";
LABEL_14:
    [v17 exceptionWithName:v18 reason:v19 userInfo:0];
    id v20 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v20);
    goto LABEL_15;
  }

  id v4 = v8;
  [v7 scheme];
  a4 = (id)objc_claimAutoreleasedReturnValue();
  if ([a4 caseInsensitiveCompare:@"ws"]
    && [a4 caseInsensitiveCompare:@"wss"])
  {
    uint64_t v17 = (void *)MEMORY[0x189603F70];
    uint64_t v18 = *MEMORY[0x189603A60];
    id v19 = @"URLSessionTask created with invalid URL scheme";
    goto LABEL_14;
  }

  if (!v4)
  {
    uint64_t v17 = (void *)MEMORY[0x189603F70];
    uint64_t v18 = *MEMORY[0x189603A60];
    id v19 = @"URLSessionTask created with nil protocols";
    goto LABEL_14;
  }

  uint64_t v29 = 0LL;
  uint64_t v30 = &v29;
  uint64_t v31 = 0x3032000000LL;
  id v32 = __Block_byref_object_copy__43604;
  id v33 = __Block_byref_object_dispose__43605;
  id v34 = 0LL;
  uint64_t v21 = MEMORY[0x1895F87A8];
  uint64_t v22 = 3221225472LL;
  id v23 = __47__NWURLSession_webSocketTaskWithURL_protocols___block_invoke;
  v24 = &unk_189BBE1E0;
  id v25 = self;
  id v7 = v7;
  id v26 = v7;
  id v4 = v4;
  id v27 = v4;
  uint64_t v28 = &v29;
  -[NWURLSession withLock:]((os_unfair_lock_s *)self, &v21);
  uint64_t v9 = v30[5];
  if (!v9)
  {
LABEL_15:
    id v11 = 0LL;
    goto LABEL_10;
  }

  uint64_t v10 = 248LL;
  if (!*(void *)(v9 + 248)) {
    uint64_t v10 = 240LL;
  }
  id v11 = *(id *)(v9 + v10);
  if (v11)
  {
    id v12 = (id)v30[5];
    -[NWURLSessionDelegateWrapper delegateFor_didCreateTask](v11, v13);
    id v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "URLSession:didCreateTask:", v11[4], v12, v21, v22, v23, v24, v25, v26);
  }

- (id)webSocketTaskWithRequest:(id)a3
{
  id v4 = a3;
  [v4 URL];
  id v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
  {
    id v15 = (void *)MEMORY[0x189603F70];
    uint64_t v16 = *MEMORY[0x189603A60];
    uint64_t v17 = @"URLSessionTask created with nil URL";
LABEL_12:
    [v15 exceptionWithName:v16 reason:v17 userInfo:0];
    id v18 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v18);
    goto LABEL_13;
  }

  [v4 URL];
  SEL v6 = (void *)objc_claimAutoreleasedReturnValue();
  [v6 scheme];
  id v5 = (void *)objc_claimAutoreleasedReturnValue();

  if ([v5 caseInsensitiveCompare:@"ws"]
    && [v5 caseInsensitiveCompare:@"wss"])
  {
    id v15 = (void *)MEMORY[0x189603F70];
    uint64_t v16 = *MEMORY[0x189603A60];
    uint64_t v17 = @"URLSessionTask created with invalid URL scheme";
    goto LABEL_12;
  }

  uint64_t v22 = 0LL;
  id v23 = &v22;
  uint64_t v24 = 0x3032000000LL;
  id v25 = __Block_byref_object_copy__43604;
  id v26 = __Block_byref_object_dispose__43605;
  id v27 = 0LL;
  v19[0] = MEMORY[0x1895F87A8];
  v19[1] = 3221225472LL;
  v19[2] = __41__NWURLSession_webSocketTaskWithRequest___block_invoke;
  v19[3] = &unk_189BBEEE8;
  v19[4] = self;
  id v4 = v4;
  id v20 = v4;
  uint64_t v21 = &v22;
  -[NWURLSession withLock:]((os_unfair_lock_s *)self, v19);
  uint64_t v7 = v23[5];
  if (!v7)
  {
LABEL_13:
    uint64_t v9 = 0LL;
    goto LABEL_9;
  }

  uint64_t v8 = 248LL;
  if (!*(void *)(v7 + 248)) {
    uint64_t v8 = 240LL;
  }
  uint64_t v9 = *(id *)(v7 + v8);
  if (v9)
  {
    id v10 = (id)v23[5];
    -[NWURLSessionDelegateWrapper delegateFor_didCreateTask](v9, v11);
    id v12 = (void *)objc_claimAutoreleasedReturnValue();
    [v12 URLSession:v9[4] didCreateTask:v10];
  }

- (id)dataTaskWithRequest:(id)a3 completionHandler:(id)a4
{
  return -[NWURLSession _dataTaskWithRequest:delegate:completionHandler:]( self,  "_dataTaskWithRequest:delegate:completionHandler:",  a3,  0LL,  a4);
}

- (id)dataTaskWithURL:(id)a3 completionHandler:(id)a4
{
  return -[NWURLSession _dataTaskWithURL:delegate:completionHandler:]( self,  "_dataTaskWithURL:delegate:completionHandler:",  a3,  0LL,  a4);
}

- (id)uploadTaskWithRequest:(id)a3 fromFile:(id)a4 completionHandler:(id)a5
{
  return -[NWURLSession _uploadTaskWithRequest:fromFile:delegate:completionHandler:]( self,  "_uploadTaskWithRequest:fromFile:delegate:completionHandler:",  a3,  a4,  0LL,  a5);
}

- (id)uploadTaskWithRequest:(id)a3 fromData:(id)a4 completionHandler:(id)a5
{
  return -[NWURLSession _uploadTaskWithRequest:fromData:delegate:completionHandler:]( self,  "_uploadTaskWithRequest:fromData:delegate:completionHandler:",  a3,  a4,  0LL,  a5);
}

- (id)downloadTaskWithRequest:(id)a3 completionHandler:(id)a4
{
  return -[NWURLSession _downloadTaskWithRequest:delegate:completionHandler:]( self,  "_downloadTaskWithRequest:delegate:completionHandler:",  a3,  0LL,  a4);
}

- (id)downloadTaskWithURL:(id)a3 completionHandler:(id)a4
{
  return -[NWURLSession _downloadTaskWithURL:delegate:completionHandler:]( self,  "_downloadTaskWithURL:delegate:completionHandler:",  a3,  0LL,  a4);
}

- (id)downloadTaskWithResumeData:(id)a3 completionHandler:(id)a4
{
  return -[NWURLSession _downloadTaskWithResumeData:delegate:completionHandler:]( self,  "_downloadTaskWithResumeData:delegate:completionHandler:",  a3,  0LL,  a4);
}

- (id)_dataTaskWithRequest:(id)a3 delegate:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  [v6 URL];
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v8)
  {
    [MEMORY[0x189603F70] exceptionWithName:*MEMORY[0x189603A60] reason:@"URLSessionTask created with nil URL" userInfo:0];
    id v17 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v17);
    goto LABEL_9;
  }

  uint64_t v26 = 0LL;
  id v27 = &v26;
  uint64_t v28 = 0x3032000000LL;
  uint64_t v29 = __Block_byref_object_copy__43604;
  uint64_t v30 = __Block_byref_object_dispose__43605;
  id v31 = 0LL;
  uint64_t v18 = MEMORY[0x1895F87A8];
  uint64_t v19 = 3221225472LL;
  id v20 = __46__NWURLSession__dataTaskWithRequest_delegate___block_invoke;
  uint64_t v21 = &unk_189BBE1E0;
  uint64_t v22 = self;
  id v6 = v6;
  id v23 = v6;
  id v25 = &v26;
  id v7 = v7;
  id v24 = v7;
  -[NWURLSession withLock:]((os_unfair_lock_s *)self, &v18);
  uint64_t v9 = v27[5];
  if (!v9)
  {
LABEL_9:
    id v11 = 0LL;
    goto LABEL_7;
  }

  uint64_t v10 = 248LL;
  if (!*(void *)(v9 + 248)) {
    uint64_t v10 = 240LL;
  }
  id v11 = *(id *)(v9 + v10);
  if (v11)
  {
    id v12 = (id)v27[5];
    -[NWURLSessionDelegateWrapper delegateFor_didCreateTask](v11, v13);
    id v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "URLSession:didCreateTask:", v11[4], v12, v18, v19, v20, v21, v22, v23);
  }

- (id)_dataTaskWithURL:(id)a3 delegate:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (!v6)
  {
    [MEMORY[0x189603F70] exceptionWithName:*MEMORY[0x189603A60] reason:@"URLSessionTask created with nil URL" userInfo:0];
    id v17 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v17);
    goto LABEL_9;
  }

  uint64_t v8 = v7;
  uint64_t v26 = 0LL;
  id v27 = &v26;
  uint64_t v28 = 0x3032000000LL;
  uint64_t v29 = __Block_byref_object_copy__43604;
  uint64_t v30 = __Block_byref_object_dispose__43605;
  id v31 = 0LL;
  uint64_t v18 = MEMORY[0x1895F87A8];
  uint64_t v19 = 3221225472LL;
  id v20 = __42__NWURLSession__dataTaskWithURL_delegate___block_invoke;
  uint64_t v21 = &unk_189BBE1E0;
  uint64_t v22 = self;
  id v6 = v6;
  id v23 = v6;
  id v25 = &v26;
  a4 = v8;
  id v24 = a4;
  -[NWURLSession withLock:]((os_unfair_lock_s *)self, &v18);
  uint64_t v9 = v27[5];
  if (!v9)
  {
LABEL_9:
    id v11 = 0LL;
    goto LABEL_7;
  }

  uint64_t v10 = 248LL;
  if (!*(void *)(v9 + 248)) {
    uint64_t v10 = 240LL;
  }
  id v11 = *(id *)(v9 + v10);
  if (v11)
  {
    id v12 = (id)v27[5];
    -[NWURLSessionDelegateWrapper delegateFor_didCreateTask](v11, v13);
    id v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "URLSession:didCreateTask:", v11[4], v12, v18, v19, v20, v21, v22, v23);
  }

- (id)_dataTaskWithRequest:(id)a3 delegate:(id)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  [v8 URL];
  id v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v11)
  {
    [MEMORY[0x189603F70] exceptionWithName:*MEMORY[0x189603A60] reason:@"URLSessionTask created with nil URL" userInfo:0];
    id v20 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v20);
    goto LABEL_9;
  }

  uint64_t v26 = 0LL;
  id v27 = &v26;
  uint64_t v28 = 0x3032000000LL;
  uint64_t v29 = __Block_byref_object_copy__43604;
  uint64_t v30 = __Block_byref_object_dispose__43605;
  id v31 = 0LL;
  v21[0] = MEMORY[0x1895F87A8];
  v21[1] = 3221225472LL;
  v21[2] = __64__NWURLSession__dataTaskWithRequest_delegate_completionHandler___block_invoke;
  v21[3] = &unk_189BBE230;
  v21[4] = self;
  id v8 = v8;
  id v22 = v8;
  id v25 = &v26;
  id v10 = v10;
  id v24 = v10;
  id v9 = v9;
  id v23 = v9;
  -[NWURLSession withLock:]((os_unfair_lock_s *)self, v21);
  uint64_t v12 = v27[5];
  if (!v12)
  {
LABEL_9:
    id v14 = 0LL;
    goto LABEL_7;
  }

  uint64_t v13 = 248LL;
  if (!*(void *)(v12 + 248)) {
    uint64_t v13 = 240LL;
  }
  id v14 = *(id *)(v12 + v13);
  if (v14)
  {
    id v15 = (id)v27[5];
    -[NWURLSessionDelegateWrapper delegateFor_didCreateTask](v14, v16);
    id v17 = (void *)objc_claimAutoreleasedReturnValue();
    [v17 URLSession:v14[4] didCreateTask:v15];
  }

- (id)_dataTaskWithURL:(id)a3 delegate:(id)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (!v8)
  {
    [MEMORY[0x189603F70] exceptionWithName:*MEMORY[0x189603A60] reason:@"URLSessionTask created with nil URL" userInfo:0];
    id v20 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v20);
    goto LABEL_9;
  }

  id v11 = v10;
  uint64_t v26 = 0LL;
  id v27 = &v26;
  uint64_t v28 = 0x3032000000LL;
  uint64_t v29 = __Block_byref_object_copy__43604;
  uint64_t v30 = __Block_byref_object_dispose__43605;
  id v31 = 0LL;
  v21[0] = MEMORY[0x1895F87A8];
  v21[1] = 3221225472LL;
  v21[2] = __60__NWURLSession__dataTaskWithURL_delegate_completionHandler___block_invoke;
  v21[3] = &unk_189BBE230;
  v21[4] = self;
  id v8 = v8;
  id v22 = v8;
  id v25 = &v26;
  a5 = v11;
  id v24 = a5;
  id v9 = v9;
  id v23 = v9;
  -[NWURLSession withLock:]((os_unfair_lock_s *)self, v21);
  uint64_t v12 = v27[5];
  if (!v12)
  {
LABEL_9:
    id v14 = 0LL;
    goto LABEL_7;
  }

  uint64_t v13 = 248LL;
  if (!*(void *)(v12 + 248)) {
    uint64_t v13 = 240LL;
  }
  id v14 = *(id *)(v12 + v13);
  if (v14)
  {
    id v15 = (id)v27[5];
    -[NWURLSessionDelegateWrapper delegateFor_didCreateTask](v14, v16);
    id v17 = (void *)objc_claimAutoreleasedReturnValue();
    [v17 URLSession:v14[4] didCreateTask:v15];
  }

- (id)_uploadTaskWithRequest:(id)a3 fromFile:(id)a4 delegate:(id)a5 completionHandler:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  [v10 URL];
  id v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v14)
  {
    id v23 = (void *)MEMORY[0x189603F70];
    uint64_t v24 = *MEMORY[0x189603A60];
    id v25 = @"URLSessionTask created with nil URL";
LABEL_13:
    [v23 exceptionWithName:v24 reason:v25 userInfo:0];
    id v26 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v26);
    goto LABEL_14;
  }

  if (!v11)
  {
    id v23 = (void *)MEMORY[0x189603F70];
    uint64_t v24 = *MEMORY[0x189603A60];
    id v25 = @"URLSessionTask created with nil fileURL";
    goto LABEL_13;
  }

  if (([v11 isFileURL] & 1) == 0)
  {
    id v23 = (void *)MEMORY[0x189603F70];
    uint64_t v24 = *MEMORY[0x189603A60];
    id v25 = @"URLSessionTask created with invalid fileURL";
    goto LABEL_13;
  }

  uint64_t v37 = 0LL;
  uint64_t v38 = &v37;
  uint64_t v39 = 0x3032000000LL;
  v40 = __Block_byref_object_copy__43604;
  uint64_t v41 = __Block_byref_object_dispose__43605;
  id v42 = 0LL;
  uint64_t v27 = MEMORY[0x1895F87A8];
  uint64_t v28 = 3221225472LL;
  uint64_t v29 = __75__NWURLSession__uploadTaskWithRequest_fromFile_delegate_completionHandler___block_invoke;
  uint64_t v30 = &unk_189BBE208;
  id v31 = self;
  id v11 = v11;
  id v32 = v11;
  id v10 = v10;
  id v33 = v10;
  dispatch_queue_t v36 = &v37;
  id v13 = v13;
  id v35 = v13;
  id v12 = v12;
  id v34 = v12;
  -[NWURLSession withLock:]((os_unfair_lock_s *)self, &v27);
  uint64_t v15 = v38[5];
  if (!v15)
  {
LABEL_14:
    id v17 = 0LL;
    goto LABEL_9;
  }

  uint64_t v16 = 248LL;
  if (!*(void *)(v15 + 248)) {
    uint64_t v16 = 240LL;
  }
  id v17 = *(id *)(v15 + v16);
  if (v17)
  {
    id v18 = (id)v38[5];
    -[NWURLSessionDelegateWrapper delegateFor_didCreateTask](v17, v19);
    id v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "URLSession:didCreateTask:", v17[4], v18, v27, v28, v29, v30, v31, v32, v33);
  }

- (id)_uploadTaskWithRequest:(id)a3 fromData:(id)a4 delegate:(id)a5 completionHandler:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  [v10 URL];
  id v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v14)
  {
    id v23 = (void *)MEMORY[0x189603F70];
    uint64_t v24 = *MEMORY[0x189603A60];
    id v25 = @"URLSessionTask created with nil URL";
LABEL_11:
    [v23 exceptionWithName:v24 reason:v25 userInfo:0];
    id v26 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v26);
    goto LABEL_12;
  }

  if (!v11)
  {
    id v23 = (void *)MEMORY[0x189603F70];
    uint64_t v24 = *MEMORY[0x189603A60];
    id v25 = @"URLSessionTask created with nil bodyData";
    goto LABEL_11;
  }

  uint64_t v37 = 0LL;
  uint64_t v38 = &v37;
  uint64_t v39 = 0x3032000000LL;
  v40 = __Block_byref_object_copy__43604;
  uint64_t v41 = __Block_byref_object_dispose__43605;
  id v42 = 0LL;
  uint64_t v27 = MEMORY[0x1895F87A8];
  uint64_t v28 = 3221225472LL;
  uint64_t v29 = __75__NWURLSession__uploadTaskWithRequest_fromData_delegate_completionHandler___block_invoke;
  uint64_t v30 = &unk_189BBE208;
  id v31 = self;
  id v11 = v11;
  id v32 = v11;
  id v10 = v10;
  id v33 = v10;
  dispatch_queue_t v36 = &v37;
  id v13 = v13;
  id v35 = v13;
  id v12 = v12;
  id v34 = v12;
  -[NWURLSession withLock:]((os_unfair_lock_s *)self, &v27);
  uint64_t v15 = v38[5];
  if (!v15)
  {
LABEL_12:
    id v17 = 0LL;
    goto LABEL_8;
  }

  uint64_t v16 = 248LL;
  if (!*(void *)(v15 + 248)) {
    uint64_t v16 = 240LL;
  }
  id v17 = *(id *)(v15 + v16);
  if (v17)
  {
    id v18 = (id)v38[5];
    -[NWURLSessionDelegateWrapper delegateFor_didCreateTask](v17, v19);
    id v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "URLSession:didCreateTask:", v17[4], v18, v27, v28, v29, v30, v31, v32, v33);
  }

- (id)_downloadTaskWithRequest:(id)a3 delegate:(id)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  [v8 URL];
  id v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v11)
  {
    [MEMORY[0x189603F70] exceptionWithName:*MEMORY[0x189603A60] reason:@"URLSessionTask created with nil URL" userInfo:0];
    id v20 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v20);
    goto LABEL_9;
  }

  uint64_t v26 = 0LL;
  uint64_t v27 = &v26;
  uint64_t v28 = 0x3032000000LL;
  uint64_t v29 = __Block_byref_object_copy__43604;
  uint64_t v30 = __Block_byref_object_dispose__43605;
  id v31 = 0LL;
  v21[0] = MEMORY[0x1895F87A8];
  v21[1] = 3221225472LL;
  v21[2] = __68__NWURLSession__downloadTaskWithRequest_delegate_completionHandler___block_invoke;
  v21[3] = &unk_189BBE230;
  v21[4] = self;
  id v8 = v8;
  id v22 = v8;
  id v25 = &v26;
  id v10 = v10;
  id v24 = v10;
  id v9 = v9;
  id v23 = v9;
  -[NWURLSession withLock:]((os_unfair_lock_s *)self, v21);
  uint64_t v12 = v27[5];
  if (!v12)
  {
LABEL_9:
    id v14 = 0LL;
    goto LABEL_7;
  }

  uint64_t v13 = 248LL;
  if (!*(void *)(v12 + 248)) {
    uint64_t v13 = 240LL;
  }
  id v14 = *(id *)(v12 + v13);
  if (v14)
  {
    id v15 = (id)v27[5];
    -[NWURLSessionDelegateWrapper delegateFor_didCreateTask](v14, v16);
    id v17 = (void *)objc_claimAutoreleasedReturnValue();
    [v17 URLSession:v14[4] didCreateTask:v15];
  }

- (id)_downloadTaskWithURL:(id)a3 delegate:(id)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (!v8)
  {
    [MEMORY[0x189603F70] exceptionWithName:*MEMORY[0x189603A60] reason:@"URLSessionTask created with nil URL" userInfo:0];
    id v20 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v20);
    goto LABEL_9;
  }

  id v11 = v10;
  uint64_t v26 = 0LL;
  uint64_t v27 = &v26;
  uint64_t v28 = 0x3032000000LL;
  uint64_t v29 = __Block_byref_object_copy__43604;
  uint64_t v30 = __Block_byref_object_dispose__43605;
  id v31 = 0LL;
  v21[0] = MEMORY[0x1895F87A8];
  v21[1] = 3221225472LL;
  v21[2] = __64__NWURLSession__downloadTaskWithURL_delegate_completionHandler___block_invoke;
  v21[3] = &unk_189BBE230;
  v21[4] = self;
  id v8 = v8;
  id v22 = v8;
  id v25 = &v26;
  a5 = v11;
  id v24 = a5;
  id v9 = v9;
  id v23 = v9;
  -[NWURLSession withLock:]((os_unfair_lock_s *)self, v21);
  uint64_t v12 = v27[5];
  if (!v12)
  {
LABEL_9:
    id v14 = 0LL;
    goto LABEL_7;
  }

  uint64_t v13 = 248LL;
  if (!*(void *)(v12 + 248)) {
    uint64_t v13 = 240LL;
  }
  id v14 = *(id *)(v12 + v13);
  if (v14)
  {
    id v15 = (id)v27[5];
    -[NWURLSessionDelegateWrapper delegateFor_didCreateTask](v14, v16);
    id v17 = (void *)objc_claimAutoreleasedReturnValue();
    [v17 URLSession:v14[4] didCreateTask:v15];
  }

- (id)_downloadTaskWithResumeData:(id)a3 delegate:(id)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (!v8)
  {
    [MEMORY[0x189603F70] exceptionWithName:*MEMORY[0x189603A60] reason:@"URLSessionDownloadTask created with nil resume data" userInfo:0];
    id v20 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v20);
    goto LABEL_9;
  }

  id v11 = v10;
  uint64_t v26 = 0LL;
  uint64_t v27 = &v26;
  uint64_t v28 = 0x3032000000LL;
  uint64_t v29 = __Block_byref_object_copy__43604;
  uint64_t v30 = __Block_byref_object_dispose__43605;
  id v31 = 0LL;
  v21[0] = MEMORY[0x1895F87A8];
  v21[1] = 3221225472LL;
  v21[2] = __71__NWURLSession__downloadTaskWithResumeData_delegate_completionHandler___block_invoke;
  v21[3] = &unk_189BBE230;
  v21[4] = self;
  id v8 = v8;
  id v22 = v8;
  a5 = v11;
  id v24 = a5;
  id v25 = &v26;
  id v9 = v9;
  id v23 = v9;
  -[NWURLSession withLock:]((os_unfair_lock_s *)self, v21);
  uint64_t v12 = v27[5];
  if (!v12)
  {
LABEL_9:
    id v14 = 0LL;
    goto LABEL_7;
  }

  uint64_t v13 = 248LL;
  if (!*(void *)(v12 + 248)) {
    uint64_t v13 = 240LL;
  }
  id v14 = *(id *)(v12 + v13);
  if (v14)
  {
    id v15 = (id)v27[5];
    -[NWURLSessionDelegateWrapper delegateFor_didCreateTask](v14, v16);
    id v17 = (void *)objc_claimAutoreleasedReturnValue();
    [v17 URLSession:v14[4] didCreateTask:v15];
  }

- (OS_nw_context)_networkContext
{
  if (self) {
    self = (NWURLSession *)self->_context;
  }
  return (OS_nw_context *)self;
}

- (NSString)sessionDescription
{
  return (NSString *)objc_getProperty(self, a2, 88LL, 1);
}

- (void)setSessionDescription:(id)a3
{
}

- (void).cxx_destruct
{
}

void __71__NWURLSession__downloadTaskWithResumeData_delegate_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v4 = *(void *)(a1 + 32);
  if (v4 && *(_BYTE *)(v4 + 28))
  {
    [MEMORY[0x189603F70] exceptionWithName:*MEMORY[0x189603A48] reason:@"URLSessionDownloadTask created on an invalidated session" userInfo:0];
    id v19 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v19);
LABEL_13:
    id v11 = 0LL;
    int v10 = 1;
    goto LABEL_6;
  }

  +[NWURLSessionDownloadResumeInfo infoWithResumeData:]( (uint64_t)&OBJC_CLASS___NWURLSessionDownloadResumeInfo,  *(void **)(a1 + 40));
  id v5 = (id *)objc_claimAutoreleasedReturnValue();
  if (!v5) {
    goto LABEL_11;
  }
  id v20 = v5;
  id v6 = objc_alloc(&OBJC_CLASS___NWURLSessionResponseConsumerDownload);
  id v7 = v20[9];
  v1 = -[NWURLSessionResponseConsumerDownload initWithResumeInfo:completionHandler:]( (id *)&v6->super.isa,  v7,  *(void **)(a1 + 56));

  v2 = objc_alloc(&OBJC_CLASS___NWURLSessionDownloadTask);
  uint64_t v8 = [v1 countOfBytesReceived];
  uint64_t v9 = *(void *)(a1 + 32);
  if (!v9) {
    goto LABEL_13;
  }
  int v10 = *(_DWORD *)(v9 + 32) + 1;
  *(_DWORD *)(v9 + 32) = v10;
  id v11 = *(void **)(a1 + 32);
LABEL_6:
  uint64_t v12 = -[NWURLSessionDownloadTask initWithResumeInfo:fromOffset:identifier:session:]( (id *)&v2->super.super.isa,  v20,  v8,  v10,  v11);
  uint64_t v13 = *(void *)(*(void *)(a1 + 64) + 8LL);
  id v14 = *(void **)(v13 + 40);
  *(void *)(v13 + 40) = v12;

  uint64_t v15 = *(void *)(*(void *)(*(void *)(a1 + 64) + 8LL) + 40LL);
  if (v15)
  {
    objc_storeStrong((id *)(v15 + 424), v1);
    uint64_t v16 = *(void **)(*(void *)(*(void *)(a1 + 64) + 8LL) + 40LL);
  }

  else
  {
    uint64_t v16 = 0LL;
  }

  [v16 setDelegate:*(void *)(a1 + 48)];
  uint64_t v17 = *(void *)(a1 + 32);
  if (v17) {
    id v18 = *(void **)(v17 + 104);
  }
  else {
    id v18 = 0LL;
  }
  [v18 addObject:*(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40)];

  id v5 = v20;
LABEL_11:
}

- (void)withLock:(os_unfair_lock_s *)a1
{
  uint64_t v4 = a2;
  if (a1)
  {
    id v3 = a1 + 6;
    os_unfair_lock_lock(v3);
    v4[2]();
    os_unfair_lock_unlock(v3);
  }
}

void __64__NWURLSession__downloadTaskWithURL_delegate_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (v2 && *(_BYTE *)(v2 + 28))
  {
    [MEMORY[0x189603F70] exceptionWithName:*MEMORY[0x189603A48] reason:@"URLSessionTask created on an invalidated session" userInfo:0];
    id v18 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v18);
    goto LABEL_14;
  }

  [MEMORY[0x189601EB0] requestWithURL:*(void *)(a1 + 40)];
  id v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[NWURLSession preparedRequestFromRequest:bodyInfo:]((id *)v2, v3, 0LL);
  id v19 = (id)objc_claimAutoreleasedReturnValue();

  uint64_t v4 = objc_alloc(&OBJC_CLASS___NWURLSessionDownloadTask);
  uint64_t v5 = *(void *)(a1 + 32);
  if (!v5)
  {
LABEL_14:
    id v7 = 0LL;
    int v6 = 1;
    goto LABEL_5;
  }

  int v6 = *(_DWORD *)(v5 + 32) + 1;
  *(_DWORD *)(v5 + 32) = v6;
  id v7 = *(void **)(a1 + 32);
LABEL_5:
  uint64_t v8 = -[NWURLSessionTask initWithRequest:identifier:session:]((id *)&v4->super.super.isa, v19, v6, v7);
  uint64_t v9 = *(void *)(*(void *)(a1 + 64) + 8LL);
  int v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v8;

  id v11 = objc_alloc(&OBJC_CLASS___NWURLSessionResponseConsumerDownload);
  id v12 = *(id *)(a1 + 56);
  if (v11)
  {
    v20.receiver = v11;
    v20.super_class = (Class)&OBJC_CLASS___NWURLSessionResponseConsumerDownload;
    id v11 = (NWURLSessionResponseConsumerDownload *)objc_msgSendSuper2(&v20, sel_init);
    if (v11)
    {
      uint64_t v13 = _Block_copy(v12);
      id completionHandler = v11->_completionHandler;
      v11->_id completionHandler = v13;
    }
  }

  uint64_t v15 = *(void *)(*(void *)(*(void *)(a1 + 64) + 8LL) + 40LL);
  if (v15) {
    objc_storeStrong((id *)(v15 + 424), v11);
  }

  [*(id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40) setPrefersIncrementalDelivery:0];
  [*(id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40) setDelegate:*(void *)(a1 + 48)];
  uint64_t v16 = *(void *)(a1 + 32);
  if (v16) {
    uint64_t v17 = *(void **)(v16 + 104);
  }
  else {
    uint64_t v17 = 0LL;
  }
  [v17 addObject:*(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40)];
}

- (id)preparedRequestFromRequest:(void *)a3 bodyInfo:
{
  id v5 = a2;
  int v6 = a3;
  if (a1)
  {
    id v7 = a1[12];
    [v7 HTTPAdditionalHeaders];
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
    v23[0] = MEMORY[0x1895F87A8];
    v23[1] = 3221225472LL;
    v23[2] = __52__NWURLSession_preparedRequestFromRequest_bodyInfo___block_invoke;
    v23[3] = &unk_189BBE258;
    id v9 = v5;

    id v24 = v9;
    [v8 enumerateKeysAndObjectsUsingBlock:v23];

    [v9 valueForHTTPHeaderField:@"Connection"];
    int v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
    {
      [v9 setValue:0 forHTTPHeaderField:@"Connection"];
      if (__nwlog_url_log::onceToken != -1) {
        dispatch_once(&__nwlog_url_log::onceToken, &__block_literal_global_54_44366);
      }
      id v11 = (os_log_s *)(id)gurlLogObj;
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl( &dword_181A5C000,  v11,  OS_LOG_TYPE_ERROR,  "HTTP/1-only header field Connection should not be set on the request.",  buf,  2u);
      }
    }

    [v9 valueForHTTPHeaderField:@"Transfer-Encoding"];
    id v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (v12)
    {
      [v9 setValue:0 forHTTPHeaderField:@"Transfer-Encoding"];
      if (__nwlog_url_log::onceToken != -1) {
        dispatch_once(&__nwlog_url_log::onceToken, &__block_literal_global_54_44366);
      }
      uint64_t v13 = (os_log_s *)(id)gurlLogObj;
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl( &dword_181A5C000,  v13,  OS_LOG_TYPE_ERROR,  "HTTP/1-only header field Transfer-Encoding should not be set on the request.",  buf,  2u);
      }
    }

    if (!v6 || v6[1] != -1LL)
    {
      if (!v9) {
        goto LABEL_28;
      }
      [v9 HTTPMethod];
      id v14 = (void *)objc_claimAutoreleasedReturnValue();
      uint64_t v15 = [v14 caseInsensitiveCompare:@"GET"];

      if (v15)
      {
        [v9 HTTPMethod];
        uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue();
        uint64_t v18 = [v17 caseInsensitiveCompare:@"HEAD"];

        if (v18)
        {
LABEL_28:
          [v9 valueForHTTPHeaderField:@"Content-Length"];
          id v19 = (void *)objc_claimAutoreleasedReturnValue();

          if (!v19)
          {
            if (v6) {
              uint64_t v20 = v6[1];
            }
            else {
              uint64_t v20 = 0LL;
            }
            objc_msgSend(NSString, "stringWithFormat:", @"%lld", v20);
            id v21 = (void *)objc_claimAutoreleasedReturnValue();
            [v9 setValue:v21 forHTTPHeaderField:@"Content-Length"];
          }
        }
      }
    }

    a1 = (id *)v9;
  }

  return a1;
}

void __52__NWURLSession_preparedRequestFromRequest_bodyInfo___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v7 = a2;
  id v5 = a3;
  [*(id *)(a1 + 32) valueForHTTPHeaderField:v7];
  int v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6) {
    [*(id *)(a1 + 32) setValue:v5 forHTTPHeaderField:v7];
  }
}

void __68__NWURLSession__downloadTaskWithRequest_delegate_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (v2 && *(_BYTE *)(v2 + 28))
  {
    [MEMORY[0x189603F70] exceptionWithName:*MEMORY[0x189603A48] reason:@"URLSessionTask created on an invalidated session" userInfo:0];
    id v25 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v25);
  }

  else
  {
    id v3 = objc_alloc(&OBJC_CLASS___NWURLSessionRequestBodyInfo);
    uint64_t v5 = *(void *)(a1 + 32);
    uint64_t v4 = *(void **)(a1 + 40);
    if (v5)
    {
      int v6 = *(void **)(v5 + 144);
      goto LABEL_5;
    }
  }

  int v6 = 0LL;
LABEL_5:
  id obj = -[NWURLSessionRequestBodyInfo initWithRequest:queue:](v3, v4, v6);
  id v7 = *(id **)(a1 + 32);
  uint64_t v8 = (void *)[*(id *)(a1 + 40) mutableCopy];
  -[NWURLSession preparedRequestFromRequest:bodyInfo:](v7, v8, obj);
  id v9 = (void *)objc_claimAutoreleasedReturnValue();

  int v10 = objc_alloc(&OBJC_CLASS___NWURLSessionDownloadTask);
  uint64_t v11 = *(void *)(a1 + 32);
  if (v11)
  {
    int v12 = *(_DWORD *)(v11 + 32) + 1;
    *(_DWORD *)(v11 + 32) = v12;
    uint64_t v13 = *(void **)(a1 + 32);
  }

  else
  {
    uint64_t v13 = 0LL;
    int v12 = 1;
  }

  id v14 = -[NWURLSessionTask initWithRequest:identifier:session:]((id *)&v10->super.super.isa, v9, v12, v13);
  uint64_t v15 = *(void *)(*(void *)(a1 + 64) + 8LL);
  uint64_t v16 = *(void **)(v15 + 40);
  *(void *)(v15 + 40) = v14;

  uint64_t v17 = *(void *)(*(void *)(*(void *)(a1 + 64) + 8LL) + 40LL);
  if (v17) {
    objc_storeStrong((id *)(v17 + 416), obj);
  }
  uint64_t v18 = objc_alloc(&OBJC_CLASS___NWURLSessionResponseConsumerDownload);
  id v19 = *(id *)(a1 + 56);
  if (v18)
  {
    v27.receiver = v18;
    v27.super_class = (Class)&OBJC_CLASS___NWURLSessionResponseConsumerDownload;
    uint64_t v18 = (NWURLSessionResponseConsumerDownload *)objc_msgSendSuper2(&v27, sel_init);
    if (v18)
    {
      uint64_t v20 = _Block_copy(v19);
      id completionHandler = v18->_completionHandler;
      v18->_id completionHandler = v20;
    }
  }

  uint64_t v22 = *(void *)(*(void *)(*(void *)(a1 + 64) + 8LL) + 40LL);
  if (v22) {
    objc_storeStrong((id *)(v22 + 424), v18);
  }

  [*(id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40) setPrefersIncrementalDelivery:0];
  [*(id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40) setDelegate:*(void *)(a1 + 48)];
  uint64_t v23 = *(void *)(a1 + 32);
  if (v23) {
    id v24 = *(void **)(v23 + 104);
  }
  else {
    id v24 = 0LL;
  }
  [v24 addObject:*(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40)];
}

void __75__NWURLSession__uploadTaskWithRequest_fromData_delegate_completionHandler___block_invoke( uint64_t a1)
{
  uint64_t v3 = *(void *)(a1 + 32);
  if (v3 && *(_BYTE *)(v3 + 28))
  {
    [MEMORY[0x189603F70] exceptionWithName:*MEMORY[0x189603A48] reason:@"URLSessionTask created on an invalidated session" userInfo:0];
    id v23 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v23);
  }

  else
  {
    uint64_t v4 = objc_alloc(&OBJC_CLASS___NWURLSessionRequestBodyInfo);
    id v5 = *(id *)(a1 + 40);
    if (v4
      && (v25.receiver = v4,
          v25.super_class = (Class)&OBJC_CLASS___NWURLSessionRequestBodyInfo,
          (int v6 = objc_msgSendSuper2(&v25, sel_init)) != 0))
    {
      id obj = v6;
      uint64_t v7 = [v5 _createDispatchData];
      uint64_t v8 = (void *)obj[2];
      obj[2] = v7;

      obj[1] = [v5 length];
    }

    else
    {
      id obj = 0LL;
    }

    id v9 = *(id **)(a1 + 32);
    int v10 = (void *)[*(id *)(a1 + 48) mutableCopy];
    v1 = -[NWURLSession preparedRequestFromRequest:bodyInfo:](v9, v10, obj);
    uint64_t v11 = objc_alloc(&OBJC_CLASS___NWURLSessionUploadTask);
    uint64_t v12 = *(void *)(a1 + 32);
    if (v12)
    {
      int v13 = *(_DWORD *)(v12 + 32) + 1;
      *(_DWORD *)(v12 + 32) = v13;
      id v14 = *(void **)(a1 + 32);
      goto LABEL_9;
    }
  }

  id v14 = 0LL;
  int v13 = 1;
LABEL_9:
  uint64_t v15 = -[NWURLSessionTask initWithRequest:identifier:session:]((id *)&v11->super.super.super.isa, v1, v13, v14);
  uint64_t v16 = *(void *)(*(void *)(a1 + 72) + 8LL);
  uint64_t v17 = *(void **)(v16 + 40);
  *(void *)(v16 + 40) = v15;

  uint64_t v18 = *(void *)(*(void *)(*(void *)(a1 + 72) + 8LL) + 40LL);
  if (v18) {
    objc_storeStrong((id *)(v18 + 416), obj);
  }
  id v19 = -[NWURLSessionResponseConsumerDataCompletionHandler initWithCompletionHandler:]( (id *)objc_alloc(&OBJC_CLASS___NWURLSessionResponseConsumerDataCompletionHandler),  *(void **)(a1 + 64));
  uint64_t v20 = *(void *)(*(void *)(*(void *)(a1 + 72) + 8LL) + 40LL);
  if (v20) {
    objc_storeStrong((id *)(v20 + 424), v19);
  }

  [*(id *)(*(void *)(*(void *)(a1 + 72) + 8) + 40) setPrefersIncrementalDelivery:0];
  [*(id *)(*(void *)(*(void *)(a1 + 72) + 8) + 40) setDelegate:*(void *)(a1 + 56)];
  uint64_t v21 = *(void *)(a1 + 32);
  if (v21) {
    uint64_t v22 = *(void **)(v21 + 104);
  }
  else {
    uint64_t v22 = 0LL;
  }
  [v22 addObject:*(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 40)];
}

void __75__NWURLSession__uploadTaskWithRequest_fromFile_delegate_completionHandler___block_invoke( uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (v2 && *(_BYTE *)(v2 + 28))
  {
    [MEMORY[0x189603F70] exceptionWithName:*MEMORY[0x189603A48] reason:@"URLSessionTask created on an invalidated session" userInfo:0];
    id v22 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v22);
  }

  else
  {
    uint64_t v3 = objc_alloc(&OBJC_CLASS___NWURLSessionRequestBodyInfo);
    uint64_t v5 = *(void *)(a1 + 32);
    uint64_t v4 = *(void **)(a1 + 40);
    if (v5)
    {
      int v6 = *(void **)(v5 + 144);
      goto LABEL_5;
    }
  }

  int v6 = 0LL;
LABEL_5:
  id obj = -[NWURLSessionRequestBodyInfo initWithFileURL:queue:]((id *)&v3->super.isa, v4, v6);
  uint64_t v7 = *(id **)(a1 + 32);
  uint64_t v8 = (void *)[*(id *)(a1 + 48) mutableCopy];
  -[NWURLSession preparedRequestFromRequest:bodyInfo:](v7, v8, obj);
  id v9 = (void *)objc_claimAutoreleasedReturnValue();

  int v10 = objc_alloc(&OBJC_CLASS___NWURLSessionUploadTask);
  uint64_t v11 = *(void *)(a1 + 32);
  if (v11)
  {
    int v12 = *(_DWORD *)(v11 + 32) + 1;
    *(_DWORD *)(v11 + 32) = v12;
    int v13 = *(void **)(a1 + 32);
  }

  else
  {
    int v13 = 0LL;
    int v12 = 1;
  }

  id v14 = -[NWURLSessionTask initWithRequest:identifier:session:]((id *)&v10->super.super.super.isa, v9, v12, v13);
  uint64_t v15 = *(void *)(*(void *)(a1 + 72) + 8LL);
  uint64_t v16 = *(void **)(v15 + 40);
  *(void *)(v15 + 40) = v14;

  uint64_t v17 = *(void *)(*(void *)(*(void *)(a1 + 72) + 8LL) + 40LL);
  if (v17) {
    objc_storeStrong((id *)(v17 + 416), obj);
  }
  uint64_t v18 = -[NWURLSessionResponseConsumerDataCompletionHandler initWithCompletionHandler:]( (id *)objc_alloc(&OBJC_CLASS___NWURLSessionResponseConsumerDataCompletionHandler),  *(void **)(a1 + 64));
  uint64_t v19 = *(void *)(*(void *)(*(void *)(a1 + 72) + 8LL) + 40LL);
  if (v19) {
    objc_storeStrong((id *)(v19 + 424), v18);
  }

  [*(id *)(*(void *)(*(void *)(a1 + 72) + 8) + 40) setPrefersIncrementalDelivery:0];
  [*(id *)(*(void *)(*(void *)(a1 + 72) + 8) + 40) setDelegate:*(void *)(a1 + 56)];
  uint64_t v20 = *(void *)(a1 + 32);
  if (v20) {
    uint64_t v21 = *(void **)(v20 + 104);
  }
  else {
    uint64_t v21 = 0LL;
  }
  [v21 addObject:*(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 40)];
}

void __60__NWURLSession__dataTaskWithURL_delegate_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (v2 && *(_BYTE *)(v2 + 28))
  {
    [MEMORY[0x189603F70] exceptionWithName:*MEMORY[0x189603A48] reason:@"URLSessionTask created on an invalidated session" userInfo:0];
    id v15 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v15);
  }

  else
  {
    [MEMORY[0x189601EB0] requestWithURL:*(void *)(a1 + 40)];
    uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[NWURLSession preparedRequestFromRequest:bodyInfo:]((id *)v2, v3, 0LL);
    id v16 = (id)objc_claimAutoreleasedReturnValue();

    uint64_t v4 = objc_alloc(&OBJC_CLASS___NWURLSessionDataTask);
    uint64_t v5 = *(void *)(a1 + 32);
    if (v5)
    {
      int v6 = *(_DWORD *)(v5 + 32) + 1;
      *(_DWORD *)(v5 + 32) = v6;
      uint64_t v7 = *(void **)(a1 + 32);
      goto LABEL_5;
    }
  }

  uint64_t v7 = 0LL;
  int v6 = 1;
LABEL_5:
  uint64_t v8 = -[NWURLSessionTask initWithRequest:identifier:session:]((id *)&v4->super.super.isa, v16, v6, v7);
  uint64_t v9 = *(void *)(*(void *)(a1 + 64) + 8LL);
  int v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v8;

  uint64_t v11 = -[NWURLSessionResponseConsumerDataCompletionHandler initWithCompletionHandler:]( (id *)objc_alloc(&OBJC_CLASS___NWURLSessionResponseConsumerDataCompletionHandler),  *(void **)(a1 + 56));
  uint64_t v12 = *(void *)(*(void *)(*(void *)(a1 + 64) + 8LL) + 40LL);
  if (v12) {
    objc_storeStrong((id *)(v12 + 424), v11);
  }

  [*(id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40) setPrefersIncrementalDelivery:0];
  [*(id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40) setDelegate:*(void *)(a1 + 48)];
  uint64_t v13 = *(void *)(a1 + 32);
  if (v13) {
    id v14 = *(void **)(v13 + 104);
  }
  else {
    id v14 = 0LL;
  }
  [v14 addObject:*(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40)];
}

void __64__NWURLSession__dataTaskWithRequest_delegate_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (v2 && *(_BYTE *)(v2 + 28))
  {
    [MEMORY[0x189603F70] exceptionWithName:*MEMORY[0x189603A48] reason:@"URLSessionTask created on an invalidated session" userInfo:0];
    id v22 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v22);
  }

  else
  {
    uint64_t v3 = objc_alloc(&OBJC_CLASS___NWURLSessionRequestBodyInfo);
    uint64_t v5 = *(void *)(a1 + 32);
    uint64_t v4 = *(void **)(a1 + 40);
    if (v5)
    {
      int v6 = *(void **)(v5 + 144);
      goto LABEL_5;
    }
  }

  int v6 = 0LL;
LABEL_5:
  id obj = -[NWURLSessionRequestBodyInfo initWithRequest:queue:](v3, v4, v6);
  uint64_t v7 = *(id **)(a1 + 32);
  uint64_t v8 = (void *)[*(id *)(a1 + 40) mutableCopy];
  -[NWURLSession preparedRequestFromRequest:bodyInfo:](v7, v8, obj);
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue();

  int v10 = objc_alloc(&OBJC_CLASS___NWURLSessionDataTask);
  uint64_t v11 = *(void *)(a1 + 32);
  if (v11)
  {
    int v12 = *(_DWORD *)(v11 + 32) + 1;
    *(_DWORD *)(v11 + 32) = v12;
    uint64_t v13 = *(void **)(a1 + 32);
  }

  else
  {
    uint64_t v13 = 0LL;
    int v12 = 1;
  }

  id v14 = -[NWURLSessionTask initWithRequest:identifier:session:]((id *)&v10->super.super.isa, v9, v12, v13);
  uint64_t v15 = *(void *)(*(void *)(a1 + 64) + 8LL);
  id v16 = *(void **)(v15 + 40);
  *(void *)(v15 + 40) = v14;

  uint64_t v17 = *(void *)(*(void *)(*(void *)(a1 + 64) + 8LL) + 40LL);
  if (v17) {
    objc_storeStrong((id *)(v17 + 416), obj);
  }
  uint64_t v18 = -[NWURLSessionResponseConsumerDataCompletionHandler initWithCompletionHandler:]( (id *)objc_alloc(&OBJC_CLASS___NWURLSessionResponseConsumerDataCompletionHandler),  *(void **)(a1 + 56));
  uint64_t v19 = *(void *)(*(void *)(*(void *)(a1 + 64) + 8LL) + 40LL);
  if (v19) {
    objc_storeStrong((id *)(v19 + 424), v18);
  }

  [*(id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40) setPrefersIncrementalDelivery:0];
  [*(id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40) setDelegate:*(void *)(a1 + 48)];
  uint64_t v20 = *(void *)(a1 + 32);
  if (v20) {
    uint64_t v21 = *(void **)(v20 + 104);
  }
  else {
    uint64_t v21 = 0LL;
  }
  [v21 addObject:*(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40)];
}

void __42__NWURLSession__dataTaskWithURL_delegate___block_invoke(void *a1)
{
  uint64_t v2 = a1[4];
  if (v2 && *(_BYTE *)(v2 + 28))
  {
    [MEMORY[0x189603F70] exceptionWithName:*MEMORY[0x189603A48] reason:@"URLSessionTask created on an invalidated session" userInfo:0];
    id v15 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v15);
  }

  else
  {
    [MEMORY[0x189601EB0] requestWithURL:a1[5]];
    uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[NWURLSession preparedRequestFromRequest:bodyInfo:]((id *)v2, v3, 0LL);
    id v16 = (id)objc_claimAutoreleasedReturnValue();

    uint64_t v4 = objc_alloc(&OBJC_CLASS___NWURLSessionDataTask);
    uint64_t v5 = a1[4];
    if (v5)
    {
      int v6 = *(_DWORD *)(v5 + 32) + 1;
      *(_DWORD *)(v5 + 32) = v6;
      uint64_t v7 = (void *)a1[4];
      goto LABEL_5;
    }
  }

  uint64_t v7 = 0LL;
  int v6 = 1;
LABEL_5:
  uint64_t v8 = -[NWURLSessionTask initWithRequest:identifier:session:]((id *)&v4->super.super.isa, v16, v6, v7);
  uint64_t v9 = *(void *)(a1[7] + 8LL);
  int v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v8;

  uint64_t v11 = objc_alloc_init(&OBJC_CLASS___NWURLSessionResponseConsumerDataDelegate);
  uint64_t v12 = *(void *)(*(void *)(a1[7] + 8LL) + 40LL);
  if (v12) {
    objc_storeStrong((id *)(v12 + 424), v11);
  }

  [*(id *)(*(void *)(a1[7] + 8) + 40) setDelegate:a1[6]];
  uint64_t v13 = a1[4];
  if (v13) {
    id v14 = *(void **)(v13 + 104);
  }
  else {
    id v14 = 0LL;
  }
  [v14 addObject:*(void *)(*(void *)(a1[7] + 8) + 40)];
}

void __46__NWURLSession__dataTaskWithRequest_delegate___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (v2 && *(_BYTE *)(v2 + 28))
  {
    [MEMORY[0x189603F70] exceptionWithName:*MEMORY[0x189603A48] reason:@"URLSessionTask created on an invalidated session" userInfo:0];
    id v22 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v22);
  }

  else
  {
    uint64_t v3 = objc_alloc(&OBJC_CLASS___NWURLSessionRequestBodyInfo);
    uint64_t v5 = *(void *)(a1 + 32);
    uint64_t v4 = *(void **)(a1 + 40);
    if (v5)
    {
      int v6 = *(void **)(v5 + 144);
      goto LABEL_5;
    }
  }

  int v6 = 0LL;
LABEL_5:
  id obj = -[NWURLSessionRequestBodyInfo initWithRequest:queue:](v3, v4, v6);
  uint64_t v7 = *(id **)(a1 + 32);
  uint64_t v8 = (void *)[*(id *)(a1 + 40) mutableCopy];
  -[NWURLSession preparedRequestFromRequest:bodyInfo:](v7, v8, obj);
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue();

  int v10 = objc_alloc(&OBJC_CLASS___NWURLSessionDataTask);
  uint64_t v11 = *(void *)(a1 + 32);
  if (v11)
  {
    int v12 = *(_DWORD *)(v11 + 32) + 1;
    *(_DWORD *)(v11 + 32) = v12;
    uint64_t v13 = *(void **)(a1 + 32);
  }

  else
  {
    uint64_t v13 = 0LL;
    int v12 = 1;
  }

  id v14 = -[NWURLSessionTask initWithRequest:identifier:session:]((id *)&v10->super.super.isa, v9, v12, v13);
  uint64_t v15 = *(void *)(*(void *)(a1 + 56) + 8LL);
  id v16 = *(void **)(v15 + 40);
  *(void *)(v15 + 40) = v14;

  uint64_t v17 = *(void *)(*(void *)(*(void *)(a1 + 56) + 8LL) + 40LL);
  if (v17) {
    objc_storeStrong((id *)(v17 + 416), obj);
  }
  uint64_t v18 = objc_alloc_init(&OBJC_CLASS___NWURLSessionResponseConsumerDataDelegate);
  uint64_t v19 = *(void *)(*(void *)(*(void *)(a1 + 56) + 8LL) + 40LL);
  if (v19) {
    objc_storeStrong((id *)(v19 + 424), v18);
  }

  [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) setDelegate:*(void *)(a1 + 48)];
  uint64_t v20 = *(void *)(a1 + 32);
  if (v20) {
    uint64_t v21 = *(void **)(v20 + 104);
  }
  else {
    uint64_t v21 = 0LL;
  }
  [v21 addObject:*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40)];
}

void __41__NWURLSession_webSocketTaskWithRequest___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (v2)
  {
    if (!*(_BYTE *)(v2 + 28))
    {
      uint64_t v3 = (void *)[*(id *)(a1 + 40) mutableCopy];
      uint64_t v4 = (id *)v2;
      goto LABEL_4;
    }

    [MEMORY[0x189603F70] exceptionWithName:*MEMORY[0x189603A48] reason:@"URLSessionTask created on an invalidated session" userInfo:0];
    id v20 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v20);
  }

  uint64_t v3 = (void *)[*(id *)(a1 + 40) mutableCopy];
  uint64_t v4 = 0LL;
LABEL_4:
  -[NWURLSession preparedRequestFromRequest:bodyInfo:](v4, v3, 0LL);
  id v21 = (id)objc_claimAutoreleasedReturnValue();

  +[NWURLSessionWebSocketTask addWebSocketHeadersToRequest:]((uint64_t)&OBJC_CLASS___NWURLSessionWebSocketTask, v21);
  uint64_t v5 = objc_alloc(&OBJC_CLASS___NWURLSessionWebSocketTask);
  uint64_t v6 = *(void *)(a1 + 32);
  if (v6)
  {
    int v7 = *(_DWORD *)(v6 + 32) + 1;
    *(_DWORD *)(v6 + 32) = v7;
    uint64_t v8 = *(void **)(a1 + 32);
    uint64_t v9 = v21;
    if (v5) {
      goto LABEL_6;
    }
LABEL_14:
    uint64_t v11 = 0LL;
    goto LABEL_8;
  }

  uint64_t v8 = 0LL;
  int v7 = 1;
  uint64_t v9 = v21;
  if (!v5) {
    goto LABEL_14;
  }
LABEL_6:
  int v10 = -[NWURLSessionTask initWithRequest:identifier:session:]((id *)&v5->super.super.isa, v9, v7, v8);
  uint64_t v11 = v10;
  if (v10)
  {
    v10[59] = (id)0x100000;
    id v12 = objc_alloc_init(MEMORY[0x189603FA8]);
    id v13 = v11[64];
    v11[64] = v12;

    id v14 = objc_alloc_init(MEMORY[0x189603FA8]);
    id v15 = v11[66];
    v11[66] = v14;
  }

void __47__NWURLSession_webSocketTaskWithURL_protocols___block_invoke(uint64_t a1)
{
  uint64_t v3 = *(void *)(a1 + 32);
  if (v3 && *(_BYTE *)(v3 + 28))
  {
    [MEMORY[0x189603F70] exceptionWithName:*MEMORY[0x189603A48] reason:@"URLSessionTask created on an invalidated session" userInfo:0];
    id v19 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v19);
  }

  else
  {
    [MEMORY[0x189601EB0] requestWithURL:*(void *)(a1 + 40)];
    id v20 = (id)objc_claimAutoreleasedReturnValue();
    if ([*(id *)(a1 + 48) count])
    {
      objc_msgSend(*(id *)(a1 + 48), "componentsJoinedByString:", @", ");
      uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue();
      [v20 addValue:v4 forHTTPHeaderField:@"Sec-WebSocket-Protocol"];
    }
    v1 = -[NWURLSession preparedRequestFromRequest:bodyInfo:](*(id **)(a1 + 32), v20, 0LL);
    +[NWURLSessionWebSocketTask addWebSocketHeadersToRequest:]((uint64_t)&OBJC_CLASS___NWURLSessionWebSocketTask, v1);
    uint64_t v5 = objc_alloc(&OBJC_CLASS___NWURLSessionWebSocketTask);
    uint64_t v6 = *(void *)(a1 + 32);
    if (v6)
    {
      int v7 = *(_DWORD *)(v6 + 32) + 1;
      *(_DWORD *)(v6 + 32) = v7;
      uint64_t v8 = *(void **)(a1 + 32);
      if (v5) {
        goto LABEL_7;
      }
LABEL_14:
      int v10 = 0LL;
      goto LABEL_9;
    }
  }

  uint64_t v8 = 0LL;
  int v7 = 1;
  if (!v5) {
    goto LABEL_14;
  }
LABEL_7:
  uint64_t v9 = -[NWURLSessionTask initWithRequest:identifier:session:]((id *)&v5->super.super.isa, v1, v7, v8);
  int v10 = v9;
  if (v9)
  {
    v9[59] = (id)0x100000;
    id v11 = objc_alloc_init(MEMORY[0x189603FA8]);
    id v12 = v10[64];
    v10[64] = v11;

    id v13 = objc_alloc_init(MEMORY[0x189603FA8]);
    id v14 = v10[66];
    v10[66] = v13;
  }

uint64_t __44__NWURLSession_streamTaskWithHostName_port___block_invoke(void *a1)
{
  uint64_t v4 = a1[4];
  if (v4 && *(_BYTE *)(v4 + 28))
  {
    [MEMORY[0x189603F70] exceptionWithName:*MEMORY[0x189603A48] reason:@"URLSessionTask created on an invalidated session" userInfo:0];
    id v42 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v42);
  }

  else
  {
    v1 = objc_alloc(&OBJC_CLASS___NWURLSessionStreamTask);
    int64_t v2 = a1[7];
    uint64_t v5 = a1[4];
    uint64_t v6 = (void *)a1[5];
    if (v5)
    {
      int v7 = *(_DWORD *)(v5 + 32) + 1;
      *(_DWORD *)(v5 + 32) = v7;
      uint64_t v8 = (void *)a1[4];
      goto LABEL_5;
    }
  }

  uint64_t v8 = 0LL;
  int v7 = 1;
LABEL_5:
  id obj = v6;
  id v9 = v6;
  if (v1)
  {
    int v10 = (objc_class *)MEMORY[0x189607A50];
    id v11 = v8;
    id v12 = objc_alloc_init(v10);
    [v12 setScheme:@"tcp"];
    [v12 setHost:v9];
    [MEMORY[0x189607968] numberWithInteger:v2];
    id v13 = (void *)objc_claimAutoreleasedReturnValue();
    [v12 setPort:v13];

    id v14 = (void *)MEMORY[0x189601EE8];
    [v12 URL];
    uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue();
    [v14 requestWithURL:v15];
    uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue();

    uint64_t v17 = -[NWURLSessionTask initWithRequest:identifier:session:]((id *)&v1->super.super.isa, v16, v7, v11);
    if (v17)
    {
      uint64_t v18 = objc_alloc(&OBJC_CLASS___NWURLSessionTaskConfiguration);
      id v19 = (id *)v17[50];
      id v20 = v19;
      int64_t v43 = v2;
      if (v19) {
        id v21 = v19[12];
      }
      else {
        id v21 = 0LL;
      }
      id v22 = -[NWURLSessionTaskConfiguration initWithConfiguration:task:request:]((id *)&v18->super.isa, v21, v17, 0LL);
      id v23 = v17[51];
      v17[51] = v22;

      id v24 = objc_alloc(&OBJC_CLASS___NWURLLoaderTCP);
      id v25 = v17[51];
      id v26 = v17[29];
      id v27 = v26;
      id v28 = v25;
      id v45 = v9;
      id v44 = v9;
      id v29 = v28;
      id v30 = v27;
      id v31 = v17;
      if (v24)
      {
        v47.receiver = v24;
        v47.super_class = (Class)&OBJC_CLASS___NWURLLoaderTCP;
        id v32 = (NWURLLoaderTCP *)objc_msgSendSuper2(&v47, sel_init);
        id v24 = v32;
        if (v32)
        {
          objc_storeStrong((id *)&v32->_hostname, obj);
          v24->_port = v43;
          objc_storeStrong((id *)&v24->_configuration, v25);
          objc_storeStrong((id *)&v24->_client, v17);
          objc_storeStrong((id *)&v24->_queue, v26);
          id v33 = (NSMutableArray *)objc_alloc_init(MEMORY[0x189603FA8]);
          pendingWork = v24->_pendingWork;
          v24->_pendingWork = v33;
        }
      }

      id v35 = v31[33];
      v31[33] = v24;

      id v9 = v45;
    }

    dispatch_queue_t v36 = v17;
  }

  else
  {
    dispatch_queue_t v36 = 0LL;
  }

  uint64_t v37 = *(void *)(a1[6] + 8LL);
  uint64_t v38 = *(void **)(v37 + 40);
  *(void *)(v37 + 40) = v36;

  uint64_t v39 = a1[4];
  if (v39) {
    v40 = *(void **)(v39 + 104);
  }
  else {
    v40 = 0LL;
  }
  return [v40 addObject:*(void *)(*(void *)(a1[6] + 8) + 40)];
}

void __43__NWURLSession_downloadTaskWithResumeData___block_invoke(uint64_t a1)
{
  uint64_t v4 = *(void *)(a1 + 32);
  if (v4 && *(_BYTE *)(v4 + 28))
  {
    [MEMORY[0x189603F70] exceptionWithName:*MEMORY[0x189603A48] reason:@"URLSessionDownloadTask created on an invalidated session" userInfo:0];
    id v18 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v18);
LABEL_13:
    id v11 = 0LL;
    int v10 = 1;
    goto LABEL_6;
  }

  +[NWURLSessionDownloadResumeInfo infoWithResumeData:]( (uint64_t)&OBJC_CLASS___NWURLSessionDownloadResumeInfo,  *(void **)(a1 + 40));
  uint64_t v5 = (id *)objc_claimAutoreleasedReturnValue();
  if (!v5) {
    goto LABEL_11;
  }
  id v19 = v5;
  uint64_t v6 = objc_alloc(&OBJC_CLASS___NWURLSessionResponseConsumerDownload);
  id v7 = v19[9];
  v1 = -[NWURLSessionResponseConsumerDownload initWithResumeInfo:completionHandler:]((id *)&v6->super.isa, v7, 0LL);

  int64_t v2 = objc_alloc(&OBJC_CLASS___NWURLSessionDownloadTask);
  uint64_t v8 = [v1 countOfBytesReceived];
  uint64_t v9 = *(void *)(a1 + 32);
  if (!v9) {
    goto LABEL_13;
  }
  int v10 = *(_DWORD *)(v9 + 32) + 1;
  *(_DWORD *)(v9 + 32) = v10;
  id v11 = *(void **)(a1 + 32);
LABEL_6:
  id v12 = -[NWURLSessionDownloadTask initWithResumeInfo:fromOffset:identifier:session:]( (id *)&v2->super.super.isa,  v19,  v8,  v10,  v11);
  uint64_t v13 = *(void *)(*(void *)(a1 + 48) + 8LL);
  id v14 = *(void **)(v13 + 40);
  *(void *)(v13 + 40) = v12;

  uint64_t v15 = *(void *)(*(void *)(*(void *)(a1 + 48) + 8LL) + 40LL);
  if (v15) {
    objc_storeStrong((id *)(v15 + 424), v1);
  }
  uint64_t v16 = *(void *)(a1 + 32);
  if (v16) {
    uint64_t v17 = *(void **)(v16 + 104);
  }
  else {
    uint64_t v17 = 0LL;
  }
  [v17 addObject:*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40)];

  uint64_t v5 = v19;
LABEL_11:
}

void __36__NWURLSession_downloadTaskWithURL___block_invoke(void *a1)
{
  uint64_t v2 = a1[4];
  if (v2 && *(_BYTE *)(v2 + 28))
  {
    [MEMORY[0x189603F70] exceptionWithName:*MEMORY[0x189603A48] reason:@"URLSessionTask created on an invalidated session" userInfo:0];
    id v15 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v15);
  }

  else
  {
    [MEMORY[0x189601EB0] requestWithURL:a1[5]];
    uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[NWURLSession preparedRequestFromRequest:bodyInfo:]((id *)v2, v3, 0LL);
    id v16 = (id)objc_claimAutoreleasedReturnValue();

    uint64_t v4 = objc_alloc(&OBJC_CLASS___NWURLSessionDownloadTask);
    uint64_t v5 = a1[4];
    if (v5)
    {
      int v6 = *(_DWORD *)(v5 + 32) + 1;
      *(_DWORD *)(v5 + 32) = v6;
      id v7 = (void *)a1[4];
      goto LABEL_5;
    }
  }

  id v7 = 0LL;
  int v6 = 1;
LABEL_5:
  uint64_t v8 = -[NWURLSessionTask initWithRequest:identifier:session:]((id *)&v4->super.super.isa, v16, v6, v7);
  uint64_t v9 = *(void *)(a1[6] + 8LL);
  int v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v8;

  [*(id *)(*(void *)(a1[6] + 8) + 40) setPrefersIncrementalDelivery:0];
  id v11 = objc_alloc_init(&OBJC_CLASS___NWURLSessionResponseConsumerDownload);
  uint64_t v12 = *(void *)(*(void *)(a1[6] + 8LL) + 40LL);
  if (v12) {
    objc_storeStrong((id *)(v12 + 424), v11);
  }

  uint64_t v13 = a1[4];
  if (v13) {
    id v14 = *(void **)(v13 + 104);
  }
  else {
    id v14 = 0LL;
  }
  [v14 addObject:*(void *)(*(void *)(a1[6] + 8) + 40)];
}

void __40__NWURLSession_downloadTaskWithRequest___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (v2 && *(_BYTE *)(v2 + 28))
  {
    [MEMORY[0x189603F70] exceptionWithName:*MEMORY[0x189603A48] reason:@"URLSessionTask created on an invalidated session" userInfo:0];
    id v22 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v22);
  }

  else
  {
    uint64_t v3 = objc_alloc(&OBJC_CLASS___NWURLSessionRequestBodyInfo);
    uint64_t v5 = *(void *)(a1 + 32);
    uint64_t v4 = *(void **)(a1 + 40);
    if (v5)
    {
      int v6 = *(void **)(v5 + 144);
      goto LABEL_5;
    }
  }

  int v6 = 0LL;
LABEL_5:
  id obj = -[NWURLSessionRequestBodyInfo initWithRequest:queue:](v3, v4, v6);
  id v7 = *(id **)(a1 + 32);
  uint64_t v8 = (void *)[*(id *)(a1 + 40) mutableCopy];
  -[NWURLSession preparedRequestFromRequest:bodyInfo:](v7, v8, obj);
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue();

  int v10 = objc_alloc(&OBJC_CLASS___NWURLSessionDownloadTask);
  uint64_t v11 = *(void *)(a1 + 32);
  if (v11)
  {
    int v12 = *(_DWORD *)(v11 + 32) + 1;
    *(_DWORD *)(v11 + 32) = v12;
    uint64_t v13 = *(void **)(a1 + 32);
  }

  else
  {
    uint64_t v13 = 0LL;
    int v12 = 1;
  }

  id v14 = -[NWURLSessionTask initWithRequest:identifier:session:]((id *)&v10->super.super.isa, v9, v12, v13);
  uint64_t v15 = *(void *)(*(void *)(a1 + 48) + 8LL);
  id v16 = *(void **)(v15 + 40);
  *(void *)(v15 + 40) = v14;

  [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) setPrefersIncrementalDelivery:0];
  uint64_t v17 = *(void *)(*(void *)(*(void *)(a1 + 48) + 8LL) + 40LL);
  if (v17) {
    objc_storeStrong((id *)(v17 + 416), obj);
  }
  id v18 = objc_alloc_init(&OBJC_CLASS___NWURLSessionResponseConsumerDownload);
  uint64_t v19 = *(void *)(*(void *)(*(void *)(a1 + 48) + 8LL) + 40LL);
  if (v19) {
    objc_storeStrong((id *)(v19 + 424), v18);
  }

  uint64_t v20 = *(void *)(a1 + 32);
  if (v20) {
    id v21 = *(void **)(v20 + 104);
  }
  else {
    id v21 = 0LL;
  }
  [v21 addObject:*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40)];
}

void __46__NWURLSession_uploadTaskWithStreamedRequest___block_invoke(uint64_t a1)
{
  uint64_t v3 = *(void *)(a1 + 32);
  if (v3 && *(_BYTE *)(v3 + 28))
  {
    [MEMORY[0x189603F70] exceptionWithName:*MEMORY[0x189603A48] reason:@"URLSessionTask created on an invalidated session" userInfo:0];
    id v23 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v23);
    goto LABEL_19;
  }

  v1 = objc_alloc(&OBJC_CLASS___NWURLSessionRequestBodyInfo);
  uint64_t v4 = *(void *)(a1 + 32);
  if (!v4)
  {
LABEL_19:
    uint64_t v5 = 0LL;
    goto LABEL_5;
  }

  uint64_t v5 = *(void **)(v4 + 144);
LABEL_5:
  id v6 = v5;
  if (v1
    && (v25.receiver = v1,
        v25.super_class = (Class)&OBJC_CLASS___NWURLSessionRequestBodyInfo,
        (id v7 = (id *)objc_msgSendSuper2(&v25, sel_init)) != 0))
  {
    id obj = v7;
    objc_storeStrong(v7 + 4, 0LL);
    obj[1] = (id)-1LL;
    objc_storeStrong(obj + 5, v5);
  }

  else
  {
    id obj = 0LL;
  }

  uint64_t v8 = *(id **)(a1 + 32);
  uint64_t v9 = (void *)[*(id *)(a1 + 40) mutableCopy];
  -[NWURLSession preparedRequestFromRequest:bodyInfo:](v8, v9, obj);
  int v10 = (void *)objc_claimAutoreleasedReturnValue();

  uint64_t v11 = objc_alloc(&OBJC_CLASS___NWURLSessionUploadTask);
  uint64_t v12 = *(void *)(a1 + 32);
  if (v12)
  {
    int v13 = *(_DWORD *)(v12 + 32) + 1;
    *(_DWORD *)(v12 + 32) = v13;
    id v14 = *(void **)(a1 + 32);
  }

  else
  {
    id v14 = 0LL;
    int v13 = 1;
  }

  uint64_t v15 = -[NWURLSessionTask initWithRequest:identifier:session:]((id *)&v11->super.super.super.isa, v10, v13, v14);
  uint64_t v16 = *(void *)(*(void *)(a1 + 48) + 8LL);
  uint64_t v17 = *(void **)(v16 + 40);
  *(void *)(v16 + 40) = v15;

  uint64_t v18 = *(void *)(*(void *)(*(void *)(a1 + 48) + 8LL) + 40LL);
  if (v18) {
    objc_storeStrong((id *)(v18 + 416), obj);
  }
  uint64_t v19 = objc_alloc_init(&OBJC_CLASS___NWURLSessionResponseConsumerDataDelegate);
  uint64_t v20 = *(void *)(*(void *)(*(void *)(a1 + 48) + 8LL) + 40LL);
  if (v20) {
    objc_storeStrong((id *)(v20 + 424), v19);
  }

  uint64_t v21 = *(void *)(a1 + 32);
  if (v21) {
    id v22 = *(void **)(v21 + 104);
  }
  else {
    id v22 = 0LL;
  }
  [v22 addObject:*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40)];
}

void __47__NWURLSession_uploadTaskWithRequest_fromData___block_invoke(uint64_t a1)
{
  uint64_t v3 = *(void *)(a1 + 32);
  if (v3 && *(_BYTE *)(v3 + 28))
  {
    [MEMORY[0x189603F70] exceptionWithName:*MEMORY[0x189603A48] reason:@"URLSessionTask created on an invalidated session" userInfo:0];
    id v23 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v23);
  }

  else
  {
    uint64_t v4 = objc_alloc(&OBJC_CLASS___NWURLSessionRequestBodyInfo);
    id v5 = *(id *)(a1 + 40);
    if (v4
      && (v25.receiver = v4,
          v25.super_class = (Class)&OBJC_CLASS___NWURLSessionRequestBodyInfo,
          (id v6 = objc_msgSendSuper2(&v25, sel_init)) != 0))
    {
      id obj = v6;
      uint64_t v7 = [v5 _createDispatchData];
      uint64_t v8 = (void *)obj[2];
      obj[2] = v7;

      obj[1] = [v5 length];
    }

    else
    {
      id obj = 0LL;
    }

    uint64_t v9 = *(id **)(a1 + 32);
    int v10 = (void *)[*(id *)(a1 + 48) mutableCopy];
    v1 = -[NWURLSession preparedRequestFromRequest:bodyInfo:](v9, v10, obj);
    uint64_t v11 = objc_alloc(&OBJC_CLASS___NWURLSessionUploadTask);
    uint64_t v12 = *(void *)(a1 + 32);
    if (v12)
    {
      int v13 = *(_DWORD *)(v12 + 32) + 1;
      *(_DWORD *)(v12 + 32) = v13;
      id v14 = *(void **)(a1 + 32);
      goto LABEL_9;
    }
  }

  id v14 = 0LL;
  int v13 = 1;
LABEL_9:
  uint64_t v15 = -[NWURLSessionTask initWithRequest:identifier:session:]((id *)&v11->super.super.super.isa, v1, v13, v14);
  uint64_t v16 = *(void *)(*(void *)(a1 + 56) + 8LL);
  uint64_t v17 = *(void **)(v16 + 40);
  *(void *)(v16 + 40) = v15;

  uint64_t v18 = *(void *)(*(void *)(*(void *)(a1 + 56) + 8LL) + 40LL);
  if (v18) {
    objc_storeStrong((id *)(v18 + 416), obj);
  }
  uint64_t v19 = objc_alloc_init(&OBJC_CLASS___NWURLSessionResponseConsumerDataDelegate);
  uint64_t v20 = *(void *)(*(void *)(*(void *)(a1 + 56) + 8LL) + 40LL);
  if (v20) {
    objc_storeStrong((id *)(v20 + 424), v19);
  }

  uint64_t v21 = *(void *)(a1 + 32);
  if (v21) {
    id v22 = *(void **)(v21 + 104);
  }
  else {
    id v22 = 0LL;
  }
  [v22 addObject:*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40)];
}

void __47__NWURLSession_uploadTaskWithRequest_fromFile___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (v2 && *(_BYTE *)(v2 + 28))
  {
    [MEMORY[0x189603F70] exceptionWithName:*MEMORY[0x189603A48] reason:@"URLSessionTask created on an invalidated session" userInfo:0];
    id v22 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v22);
  }

  else
  {
    uint64_t v3 = objc_alloc(&OBJC_CLASS___NWURLSessionRequestBodyInfo);
    uint64_t v5 = *(void *)(a1 + 32);
    uint64_t v4 = *(void **)(a1 + 40);
    if (v5)
    {
      id v6 = *(void **)(v5 + 144);
      goto LABEL_5;
    }
  }

  id v6 = 0LL;
LABEL_5:
  id obj = -[NWURLSessionRequestBodyInfo initWithFileURL:queue:]((id *)&v3->super.isa, v4, v6);
  uint64_t v7 = *(id **)(a1 + 32);
  uint64_t v8 = (void *)[*(id *)(a1 + 48) mutableCopy];
  -[NWURLSession preparedRequestFromRequest:bodyInfo:](v7, v8, obj);
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue();

  int v10 = objc_alloc(&OBJC_CLASS___NWURLSessionUploadTask);
  uint64_t v11 = *(void *)(a1 + 32);
  if (v11)
  {
    int v12 = *(_DWORD *)(v11 + 32) + 1;
    *(_DWORD *)(v11 + 32) = v12;
    int v13 = *(void **)(a1 + 32);
  }

  else
  {
    int v13 = 0LL;
    int v12 = 1;
  }

  id v14 = -[NWURLSessionTask initWithRequest:identifier:session:]((id *)&v10->super.super.super.isa, v9, v12, v13);
  uint64_t v15 = *(void *)(*(void *)(a1 + 56) + 8LL);
  uint64_t v16 = *(void **)(v15 + 40);
  *(void *)(v15 + 40) = v14;

  uint64_t v17 = *(void *)(*(void *)(*(void *)(a1 + 56) + 8LL) + 40LL);
  if (v17) {
    objc_storeStrong((id *)(v17 + 416), obj);
  }
  uint64_t v18 = objc_alloc_init(&OBJC_CLASS___NWURLSessionResponseConsumerDataDelegate);
  uint64_t v19 = *(void *)(*(void *)(*(void *)(a1 + 56) + 8LL) + 40LL);
  if (v19) {
    objc_storeStrong((id *)(v19 + 424), v18);
  }

  uint64_t v20 = *(void *)(a1 + 32);
  if (v20) {
    uint64_t v21 = *(void **)(v20 + 104);
  }
  else {
    uint64_t v21 = 0LL;
  }
  [v21 addObject:*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40)];
}

void __49__NWURLSession_getAllTasksWithCompletionHandler___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  if (v2) {
    uint64_t v2 = (void *)v2[14];
  }
  uint64_t v3 = v2;
  [v3 allObjects];
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v5 = *(void **)(a1 + 32);
  if (v5) {
    uint64_t v5 = (void *)v5[13];
  }
  id v6 = v5;
  [v6 allObjects];
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 arrayByAddingObjectsFromArray:v7];
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();

  uint64_t v9 = *(void *)(a1 + 32);
  if (v9) {
    uint64_t v10 = *(void *)(v9 + 152);
  }
  else {
    uint64_t v10 = 0LL;
  }
  v14[0] = MEMORY[0x1895F87A8];
  v14[1] = 3221225472LL;
  v14[2] = __49__NWURLSession_getAllTasksWithCompletionHandler___block_invoke_2;
  v14[3] = &unk_189BC91E8;
  id v11 = *(id *)(a1 + 40);
  uint64_t v15 = v8;
  id v16 = v11;
  id v12 = v8;
  int v13 = v12;
  if (v10)
  {
    -[NWURLSessionDelegateQueue runDelegateBlock:](*(void **)(v10 + 48), v14);
    int v13 = v15;
  }
}

uint64_t __49__NWURLSession_getAllTasksWithCompletionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16LL))( *(void *)(a1 + 40),  *(void *)(a1 + 32));
}

void __46__NWURLSession_getTasksWithCompletionHandler___block_invoke(uint64_t a1)
{
  uint64_t v50 = *MEMORY[0x1895F89C0];
  id v2 = objc_alloc_init(MEMORY[0x189603FA8]);
  id v3 = objc_alloc_init(MEMORY[0x189603FA8]);
  id v4 = objc_alloc_init(MEMORY[0x189603FA8]);
  __int128 v44 = 0u;
  __int128 v45 = 0u;
  __int128 v46 = 0u;
  __int128 v47 = 0u;
  uint64_t v34 = a1;
  uint64_t v5 = *(void **)(a1 + 32);
  if (v5) {
    uint64_t v5 = (void *)v5[13];
  }
  id v6 = v5;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v44 objects:v49 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v45;
    do
    {
      uint64_t v10 = 0LL;
      do
      {
        if (*(void *)v45 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void *)(*((void *)&v44 + 1) + 8 * v10);
        objc_opt_class();
        char isKindOfClass = objc_opt_isKindOfClass();
        int v13 = v4;
        if ((isKindOfClass & 1) != 0
          || (objc_opt_class(), v14 = objc_opt_isKindOfClass(), int v13 = v3, (v14 & 1) != 0)
          || (objc_opt_class(), v15 = objc_opt_isKindOfClass(), int v13 = v2, (v15 & 1) != 0))
        {
          [v13 addObject:v11];
        }

        ++v10;
      }

      while (v8 != v10);
      uint64_t v8 = [v6 countByEnumeratingWithState:&v44 objects:v49 count:16];
    }

    while (v8);
  }

  __int128 v42 = 0u;
  __int128 v43 = 0u;
  __int128 v40 = 0u;
  __int128 v41 = 0u;
  id v16 = *(void **)(v34 + 32);
  if (v16) {
    id v16 = (void *)v16[14];
  }
  uint64_t v17 = v16;
  uint64_t v18 = [v17 countByEnumeratingWithState:&v40 objects:v48 count:16];
  if (v18)
  {
    uint64_t v19 = v18;
    uint64_t v20 = *(void *)v41;
    do
    {
      uint64_t v21 = 0LL;
      do
      {
        if (*(void *)v41 != v20) {
          objc_enumerationMutation(v17);
        }
        uint64_t v22 = *(void *)(*((void *)&v40 + 1) + 8 * v21);
        objc_opt_class();
        char v23 = objc_opt_isKindOfClass();
        id v24 = v4;
        if ((v23 & 1) != 0
          || (objc_opt_class(), char v25 = objc_opt_isKindOfClass(), v24 = v3, (v25 & 1) != 0)
          || (objc_opt_class(), char v26 = objc_opt_isKindOfClass(), v24 = v2, (v26 & 1) != 0))
        {
          [v24 addObject:v22];
        }

        ++v21;
      }

      while (v19 != v21);
      uint64_t v19 = [v17 countByEnumeratingWithState:&v40 objects:v48 count:16];
    }

    while (v19);
  }

  uint64_t v27 = *(void *)(v34 + 32);
  if (v27) {
    uint64_t v28 = *(void *)(v27 + 152);
  }
  else {
    uint64_t v28 = 0LL;
  }
  v35[0] = MEMORY[0x1895F87A8];
  v35[1] = 3221225472LL;
  v35[2] = __46__NWURLSession_getTasksWithCompletionHandler___block_invoke_2;
  v35[3] = &unk_189BC7210;
  id v29 = *(id *)(v34 + 40);
  id v36 = v2;
  id v37 = v3;
  id v38 = v4;
  id v39 = v29;
  id v30 = v4;
  id v31 = v3;
  id v32 = v2;
  id v33 = v30;
  if (v28)
  {
    -[NWURLSessionDelegateQueue runDelegateBlock:](*(void **)(v28 + 48), v35);
    id v33 = v38;
  }
}

void __46__NWURLSession_getTasksWithCompletionHandler___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 56);
  id v5 = (id)[*(id *)(a1 + 32) copy];
  id v3 = (void *)[*(id *)(a1 + 40) copy];
  id v4 = (void *)[*(id *)(a1 + 48) copy];
  (*(void (**)(uint64_t, id, void *, void *))(v2 + 16))(v2, v5, v3, v4);
}

uint64_t __43__NWURLSession_flushWithCompletionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

uint64_t __43__NWURLSession_resetWithCompletionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

void __35__NWURLSession_invalidateAndCancel__block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  if (v2) {
    uint64_t v2 = (void *)v2[13];
  }
  id v3 = v2;
  [v3 anyObject];
  id v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {

LABEL_8:
    uint64_t v8 = *(void *)(a1 + 32);
    if (v8) {
      uint64_t v9 = *(dispatch_queue_s **)(v8 + 144);
    }
    else {
      uint64_t v9 = 0LL;
    }
    block[0] = MEMORY[0x1895F87A8];
    block[1] = 3221225472LL;
    block[2] = __35__NWURLSession_invalidateAndCancel__block_invoke_2;
    block[3] = &unk_189BC93A0;
    block[4] = v8;
    dispatch_async(v9, block);
    goto LABEL_11;
  }

  uint64_t v5 = *(void *)(a1 + 32);
  if (v5) {
    id v6 = *(void **)(v5 + 112);
  }
  else {
    id v6 = 0LL;
  }
  uint64_t v7 = [v6 count];

  if (v7) {
    goto LABEL_8;
  }
LABEL_11:
  uint64_t v10 = *(void *)(a1 + 32);
  if (v10)
  {
    if (*(_BYTE *)(v10 + 28)) {
      return;
    }
    *(_BYTE *)(v10 + 28) = 1;
    uint64_t v11 = *(void *)(a1 + 32);
  }

  else
  {
    uint64_t v11 = 0LL;
  }

  -[NWURLSession checkForCompletion](v11);
}

void __35__NWURLSession_invalidateAndCancel__block_invoke_2(uint64_t a1)
{
  v1 = *(os_unfair_lock_s **)(a1 + 32);
  v2[0] = MEMORY[0x1895F87A8];
  v2[1] = 3221225472LL;
  v2[2] = __35__NWURLSession_invalidateAndCancel__block_invoke_3;
  v2[3] = &unk_189BC93A0;
  v2[4] = v1;
  -[NWURLSession withLock:](v1, v2);
}

- (void)checkForCompletion
{
  uint64_t v21 = *MEMORY[0x1895F89C0];
  if (a1)
  {
    os_unfair_lock_assert_owner((os_unfair_lock_t)(a1 + 24));
    if (*(_BYTE *)(a1 + 28))
    {
      id v12 = *(id *)(a1 + 104);
      [v12 anyObject];
      uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue();
      if (v2)
      {
      }

      else
      {
        uint64_t v3 = [*(id *)(a1 + 112) count];

        if (!v3)
        {
          uint64_t v4 = MEMORY[0x1895F87A8];
          uint64_t v5 = *(void **)(a1 + 160);
          v17[0] = MEMORY[0x1895F87A8];
          v17[1] = 3221225472LL;
          v17[2] = __34__NWURLSession_checkForCompletion__block_invoke;
          v17[3] = &unk_189BC93A0;
          v17[4] = a1;
          nw_queue_context_async_if_needed(v5, v17);
          v13[0] = v4;
          v13[1] = 3221225472LL;
          char v14 = __34__NWURLSession_checkForCompletion__block_invoke_2;
          char v15 = &unk_189BC93A0;
          uint64_t v16 = a1;
          id v6 = v13;
          uint64_t v7 = *(void **)(a1 + 136);
          *(void *)(a1 + 136) = 0LL;

          if (*(_DWORD *)(a1 + 36))
          {
            IONotificationPortSetDispatchQueue(*(IONotificationPortRef *)(a1 + 128), 0LL);
            if (*(_DWORD *)(a1 + 40))
            {
              io_object_t notifier = *(_DWORD *)(a1 + 40);
              *(_DWORD *)(a1 + 40) = 0;
              IOReturn v8 = IODeregisterForSystemPower(&notifier);
              if (v8)
              {
                IOReturn v9 = v8;
                if (__nwlog_url_log::onceToken != -1) {
                  dispatch_once(&__nwlog_url_log::onceToken, &__block_literal_global_54_44366);
                }
                uint64_t v10 = (os_log_s *)(id)gurlLogObj;
                if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
                {
                  *(_DWORD *)buf = 67109120;
                  IOReturn v20 = v9;
                  _os_log_impl( &dword_181A5C000,  v10,  OS_LOG_TYPE_ERROR,  "Failed to deregister power notifications: %d",  buf,  8u);
                }
              }
            }

            IOServiceClose(*(_DWORD *)(a1 + 36));
            *(_DWORD *)(a1 + 36) = 0;
            uint64_t v11 = *(IONotificationPort **)(a1 + 128);
            if (v11)
            {
              IONotificationPortDestroy(v11);
              *(void *)(a1 + 128) = 0LL;
            }

            dispatch_async(*(dispatch_queue_t *)(a1 + 144), v6);
          }

          else
          {
            ((void (*)(void *))v14)(v6);
          }
        }
      }
    }
  }

void __34__NWURLSession_checkForCompletion__block_invoke(uint64_t a1)
{
}

void __34__NWURLSession_checkForCompletion__block_invoke_2(uint64_t a1, const char *a2)
{
  uint64_t v3 = *(void *)(a1 + 32);
  if (v3)
  {
    uint64_t v4 = *(void *)(v3 + 152);
    if (v4)
    {
      -[NWURLSessionDelegateWrapper delegateFor_sessionDidBecomeInvalidWithError](*(_BYTE **)(v3 + 152), a2);
      id v6 = (void *)objc_claimAutoreleasedReturnValue();
      if (v6)
      {
        id v7 = *(id *)(v4 + 32);
        v12[0] = MEMORY[0x1895F87A8];
        v12[1] = 3221225472LL;
        v12[2] = __57__NWURLSessionDelegateWrapper_didBecomeInvalidWithError___block_invoke;
        v12[3] = &unk_189BC7848;
        id v13 = v6;
        id v14 = v7;
        id v15 = 0LL;
        uint64_t v16 = v4;
        IOReturn v8 = *(void **)(v4 + 48);
        id v9 = v7;
        -[NWURLSessionDelegateQueue runDelegateBlock:](v8, v12);
      }

      else
      {
        objc_setProperty_atomic((id)v4, v5, 0LL, 16LL);
      }
    }
  }

  uint64_t v10 = *(void *)(a1 + 32);
  if (v10)
  {
    uint64_t v11 = *(void **)(v10 + 152);
    if (v11) {
      objc_setProperty_atomic(v11, a2, 0LL, 16LL);
    }
  }

- (void)teardownAllConnections
{
  uint64_t v35 = *MEMORY[0x1895F89C0];
  if (a1)
  {
    BOOL v1 = nw_context_copy_cache_context(*(void **)(a1 + 160));
    id v2 = objc_alloc_init(MEMORY[0x189603FA8]);
    if (nw_protocol_http_messaging_identifier::onceToken != -1) {
      dispatch_once(&nw_protocol_http_messaging_identifier::onceToken, &__block_literal_global_76181);
    }
    uint64_t v3 = MEMORY[0x1895F87A8];
    v30[0] = MEMORY[0x1895F87A8];
    v30[1] = 3221225472LL;
    v30[2] = __38__NWURLSession_teardownAllConnections__block_invoke;
    v30[3] = &unk_189BBE280;
    id v4 = (id)v1;
    id v31 = v4;
    id v5 = v2;
    id v32 = v5;
    nw_protocol_enumerate_instances(nw_protocol_http_messaging_identifier::protocol_identifier, (uint64_t)v30);
    __int128 v28 = 0u;
    __int128 v29 = 0u;
    __int128 v26 = 0u;
    __int128 v27 = 0u;
    id v6 = v5;
    uint64_t v7 = [v6 countByEnumeratingWithState:&v26 objects:v34 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v27;
      do
      {
        for (uint64_t i = 0LL; i != v8; ++i)
        {
          if (*(void *)v27 != v9) {
            objc_enumerationMutation(v6);
          }
          nw_protocol_http_messaging_teardown( [*(id *)(*((void *)&v26 + 1) + 8 * i) unsignedIntegerValue],  0);
        }

        uint64_t v8 = [v6 countByEnumeratingWithState:&v26 objects:v34 count:16];
      }

      while (v8);
    }

    id v11 = objc_alloc_init(MEMORY[0x189603FA8]);
    if (nw_protocol_http_client_bottom_identifier::onceToken[0] != -1) {
      dispatch_once(nw_protocol_http_client_bottom_identifier::onceToken, &__block_literal_global_22210);
    }
    v23[0] = v3;
    v23[1] = 3221225472LL;
    v23[2] = __38__NWURLSession_teardownAllConnections__block_invoke_2;
    v23[3] = &unk_189BBE280;
    id v12 = v4;
    id v24 = v12;
    id v13 = v11;
    id v25 = v13;
    nw_protocol_enumerate_instances(&nw_protocol_http_client_bottom_identifier::protocol_identifier, (uint64_t)v23);
    __int128 v21 = 0u;
    __int128 v22 = 0u;
    __int128 v19 = 0u;
    __int128 v20 = 0u;
    id v14 = v13;
    uint64_t v15 = [v14 countByEnumeratingWithState:&v19 objects:v33 count:16];
    if (v15)
    {
      uint64_t v16 = v15;
      uint64_t v17 = *(void *)v20;
      do
      {
        for (uint64_t j = 0LL; j != v16; ++j)
        {
          if (*(void *)v20 != v17) {
            objc_enumerationMutation(v14);
          }
          nw_protocol_http_client_bottom_teardown(objc_msgSend(*(id *)(*((void *)&v19 + 1) + 8 * j), "unsignedIntegerValue", (void)v19));
        }

        uint64_t v16 = [v14 countByEnumeratingWithState:&v19 objects:v33 count:16];
      }

      while (v16);
    }
  }

void __38__NWURLSession_teardownAllConnections__block_invoke(uint64_t a1, uint64_t a2)
{
  id v8 = (id)objc_claimAutoreleasedReturnValue();
  id v4 = nw_parameters_copy_context(v8);
  id v5 = *(id *)(a1 + 32);

  if (v4 == v5)
  {
    id v6 = *(void **)(a1 + 40);
    [MEMORY[0x189607968] numberWithUnsignedInteger:a2];
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue();
    [v6 addObject:v7];
  }
}

void __38__NWURLSession_teardownAllConnections__block_invoke_2(uint64_t a1, uint64_t a2)
{
  id v8 = (id)objc_claimAutoreleasedReturnValue();
  id v4 = nw_parameters_copy_context(v8);
  id v5 = *(id *)(a1 + 32);

  if (v4 == v5)
  {
    id v6 = *(void **)(a1 + 40);
    [MEMORY[0x189607968] numberWithUnsignedInteger:a2];
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue();
    [v6 addObject:v7];
  }
}

void __35__NWURLSession_invalidateAndCancel__block_invoke_3(uint64_t a1)
{
  uint64_t v24 = *MEMORY[0x1895F89C0];
  __int128 v18 = 0u;
  __int128 v19 = 0u;
  __int128 v20 = 0u;
  __int128 v21 = 0u;
  id v2 = *(void **)(a1 + 32);
  if (v2) {
    id v2 = (void *)v2[13];
  }
  uint64_t v3 = v2;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v18 objects:v23 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v19;
    do
    {
      uint64_t v7 = 0LL;
      do
      {
        if (*(void *)v19 != v6) {
          objc_enumerationMutation(v3);
        }
        [*(id *)(*((void *)&v18 + 1) + 8 * v7++) cancel];
      }

      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v18 objects:v23 count:16];
    }

    while (v5);
  }

  __int128 v16 = 0u;
  __int128 v17 = 0u;
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  id v8 = *(void **)(a1 + 32);
  if (v8) {
    id v8 = (void *)v8[14];
  }
  uint64_t v9 = v8;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v14 objects:v22 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v15;
    do
    {
      uint64_t v13 = 0LL;
      do
      {
        if (*(void *)v15 != v12) {
          objc_enumerationMutation(v9);
        }
        objc_msgSend(*(id *)(*((void *)&v14 + 1) + 8 * v13++), "cancel", (void)v14);
      }

      while (v11 != v13);
      uint64_t v11 = [v9 countByEnumeratingWithState:&v14 objects:v22 count:16];
    }

    while (v11);
  }
}

void __40__NWURLSession_finishTasksAndInvalidate__block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  if (v1)
  {
    if (!*(_BYTE *)(v1 + 28))
    {
      *(_BYTE *)(v1 + 28) = 1;
      -[NWURLSession checkForCompletion](*(void *)(a1 + 32));
    }
  }

  else
  {
    -[NWURLSession checkForCompletion](0LL);
  }

void __62__NWURLSession_systemPowerChangedNotification_notificationID___block_invoke(void *a1)
{
  uint64_t v10 = *MEMORY[0x1895F89C0];
  if (__nwlog_url_log::onceToken != -1) {
    dispatch_once(&__nwlog_url_log::onceToken, &__block_literal_global_54_44366);
  }
  id v2 = (os_log_s *)(id)gurlLogObj;
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    LOWORD(v9[0]) = 0;
    _os_log_impl(&dword_181A5C000, v2, OS_LOG_TYPE_INFO, "Continuing system sleep", (uint8_t *)v9, 2u);
  }

  uint64_t v3 = a1[4];
  if (v3) {
    io_connect_t v4 = *(_DWORD *)(v3 + 36);
  }
  else {
    io_connect_t v4 = 0;
  }
  IOReturn v5 = IOAllowPowerChange(v4, a1[6]);
  if (v5)
  {
    IOReturn v7 = v5;
    if (__nwlog_url_log::onceToken != -1) {
      dispatch_once(&__nwlog_url_log::onceToken, &__block_literal_global_54_44366);
    }
    id v8 = (os_log_s *)(id)gurlLogObj;
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      v9[0] = 67109120;
      v9[1] = v7;
      _os_log_impl(&dword_181A5C000, v8, OS_LOG_TYPE_ERROR, "Failed to continue system sleep: %d", (uint8_t *)v9, 8u);
    }
  }

  nw_queue_cancel_source(*(void *)(*(void *)(a1[5] + 8LL) + 24LL), v6);
}

+ (void)initialize
{
  if (initialize_onceToken != -1) {
    dispatch_once(&initialize_onceToken, &__block_literal_global_43686);
  }
}

+ (void)_strictTrustEvaluate:(id)a3 queue:(id)a4 completionHandler:(id)a5
{
}

void __26__NWURLSession_initialize__block_invoke()
{
  unsigned int outCount = 0;
  v0 = (objc_class *)objc_opt_class();
  uint64_t v1 = class_copyMethodList(v0, &outCount);
  if (outCount)
  {
    for (unint64_t i = 0LL; i < outCount; ++i)
    {
      if ((+[NWURLSession instancesRespondToSelector:]( &OBJC_CLASS___NWURLSession,  "instancesRespondToSelector:",  method_getName(v1[i])) & 1) == 0)
      {
        Implementation = method_getImplementation(v1[i]);
        io_connect_t v4 = (const char *)dyld_image_path_containing_address();
        if (v4)
        {
          IOReturn v5 = v4;
          if (!strstr(v4, "CFNetwork.framework") && !strstr(v5, "FoundationNetworking.framework"))
          {
            Name = method_getName(v1[i]);
            TypeEncoding = method_getTypeEncoding(v1[i]);
            id v8 = (objc_class *)objc_opt_class();
            class_addMethod(v8, Name, Implementation, TypeEncoding);
          }
        }
      }
    }
  }

  free(v1);
  uint64_t v9 = (objc_class *)objc_opt_class();
  uint64_t v10 = class_copyMethodList(v9, &outCount);
  if (outCount)
  {
    for (unint64_t j = 0LL; j < outCount; ++j)
    {
      if ((+[NWURLSessionTask instancesRespondToSelector:]( &OBJC_CLASS___NWURLSessionTask,  "instancesRespondToSelector:",  method_getName(v10[j])) & 1) == 0)
      {
        uint64_t v12 = method_getImplementation(v10[j]);
        uint64_t v13 = (const char *)dyld_image_path_containing_address();
        if (v13)
        {
          __int128 v14 = v13;
          if (!strstr(v13, "CFNetwork.framework") && !strstr(v14, "FoundationNetworking.framework"))
          {
            __int128 v15 = method_getName(v10[j]);
            __int128 v16 = method_getTypeEncoding(v10[j]);
            __int128 v17 = (objc_class *)objc_opt_class();
            class_addMethod(v17, v15, v12, v16);
          }
        }
      }
    }
  }

  free(v10);
}

- (void)taskStarted:(os_unfair_lock_s *)a1
{
  id v3 = a2;
  if (a1)
  {
    v5[1] = 3221225472LL;
    v5[2] = __28__NWURLSession_taskStarted___block_invoke;
    v5[3] = &unk_189BC9238;
    v5[4] = a1;
    id v4 = v3;
    v5[0] = MEMORY[0x1895F87A8];
    id v6 = v3;
    -[NWURLSession withLock:](a1, v5);

    id v3 = v4;
  }
}

uint64_t __28__NWURLSession_taskStarted___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (v2) {
    id v3 = *(void **)(v2 + 104);
  }
  else {
    id v3 = 0LL;
  }
  [v3 removeObject:*(void *)(a1 + 40)];
  uint64_t v4 = *(void *)(a1 + 32);
  if (v4) {
    IOReturn v5 = *(void **)(v4 + 112);
  }
  else {
    IOReturn v5 = 0LL;
  }
  return [v5 addObject:*(void *)(a1 + 40)];
}

- (void)taskCompleted:(os_unfair_lock_s *)a1
{
  id v3 = a2;
  if (a1)
  {
    v5[1] = 3221225472LL;
    v5[2] = __30__NWURLSession_taskCompleted___block_invoke;
    v5[3] = &unk_189BC9238;
    v5[4] = a1;
    id v4 = v3;
    v5[0] = MEMORY[0x1895F87A8];
    id v6 = v3;
    -[NWURLSession withLock:](a1, v5);

    id v3 = v4;
  }
}

void __30__NWURLSession_taskCompleted___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (v2) {
    id v3 = *(void **)(v2 + 104);
  }
  else {
    id v3 = 0LL;
  }
  [v3 removeObject:*(void *)(a1 + 40)];
  uint64_t v4 = *(void *)(a1 + 32);
  if (v4) {
    IOReturn v5 = *(void **)(v4 + 112);
  }
  else {
    IOReturn v5 = 0LL;
  }
  [v5 removeObject:*(void *)(a1 + 40)];
  -[NWURLSession checkForCompletion](*(void *)(a1 + 32));
}

@end