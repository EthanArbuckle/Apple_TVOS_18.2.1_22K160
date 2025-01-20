@interface NSURLConnection
+ (BOOL)_collectsTimingData;
+ (BOOL)canHandleRequest:(NSURLRequest *)request;
+ (NSData)sendSynchronousRequest:(NSURLRequest *)request returningResponse:(NSURLResponse *)response error:(NSError *)error;
+ (NSURLConnection)connectionWithRequest:(NSURLRequest *)request delegate:(id)delegate;
+ (__CFRunLoop)resourceLoaderRunLoop;
+ (unint64_t)_sweeperInterval;
+ (unint64_t)_timingDataOptions;
+ (void)_collectTimingDataWithOptions:(unint64_t)a3;
+ (void)_setCollectsTimingData:(BOOL)a3;
+ (void)_setLoaderThreadPriority:(int)a3;
+ (void)_setMIMETypesWithNoSizeLimit:(id)a3;
+ (void)sendAsynchronousRequest:(NSURLRequest *)request queue:(NSOperationQueue *)queue completionHandler:(void *)handler;
- (BOOL)defersCallbacks;
- (NSString)description;
- (NSURLConnection)initWithRequest:(NSURLRequest *)request delegate:(id)delegate;
- (NSURLConnection)initWithRequest:(NSURLRequest *)request delegate:(id)delegate startImmediately:(BOOL)startImmediately;
- (NSURLRequest)currentRequest;
- (NSURLRequest)originalRequest;
- (id)_cfInternal;
- (id)_initWithRequest:(id)a3 delegate:(id)a4 usesCache:(BOOL)a5 maxContentLength:(int64_t)a6 startImmediately:(BOOL)a7 connectionProperties:(id)a8;
- (id)_timingData;
- (id)connectionProperties;
- (void)_resumeLoading;
- (void)_suspendLoading;
- (void)cancel;
- (void)cancelAuthenticationChallenge:(id)a3;
- (void)continueWithoutCredentialForAuthenticationChallenge:(id)a3;
- (void)dealloc;
- (void)performDefaultHandlingForAuthenticationChallenge:(id)a3;
- (void)rejectProtectionSpaceAndContinueWithChallenge:(id)a3;
- (void)scheduleInRunLoop:(NSRunLoop *)aRunLoop forMode:(NSRunLoopMode)mode;
- (void)setDefersCallbacks:(BOOL)a3;
- (void)setDelegateQueue:(NSOperationQueue *)queue;
- (void)start;
- (void)unscheduleFromRunLoop:(NSRunLoop *)aRunLoop forMode:(NSRunLoopMode)mode;
- (void)useCredential:(id)a3 forAuthenticationChallenge:(id)a4;
@end

@implementation NSURLConnection

+ (BOOL)_collectsTimingData
{
  return _timingDataCollection;
}

- (NSURLConnection)initWithRequest:(NSURLRequest *)request delegate:(id)delegate startImmediately:(BOOL)startImmediately
{
  return (NSURLConnection *)-[NSURLConnection _initWithRequest:delegate:usesCache:maxContentLength:startImmediately:connectionProperties:]( self,  "_initWithRequest:delegate:usesCache:maxContentLength:startImmediately:connectionProperties:",  request,  delegate,  1LL,  0LL,  startImmediately,  0LL);
}

- (NSURLConnection)initWithRequest:(NSURLRequest *)request delegate:(id)delegate
{
  return (NSURLConnection *)-[NSURLConnection _initWithRequest:delegate:usesCache:maxContentLength:startImmediately:connectionProperties:]( self,  "_initWithRequest:delegate:usesCache:maxContentLength:startImmediately:connectionProperties:",  request,  delegate,  1LL,  0LL,  1LL,  0LL);
}

- (NSString)description
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___NSURLConnection;
  return -[NSString stringByAppendingFormat:]( -[NSURLConnection description](&v3, sel_description),  "stringByAppendingFormat:",  @" { request: %@ }",  -[NSURLConnection originalRequest](self, "originalRequest"));
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___NSURLConnection;
  -[NSURLConnection dealloc](&v3, sel_dealloc);
}

- (void)setDelegateQueue:(NSOperationQueue *)queue
{
}

- (void)start
{
}

- (void)cancel
{
}

- (void)scheduleInRunLoop:(NSRunLoop *)aRunLoop forMode:(NSRunLoopMode)mode
{
}

- (void)unscheduleFromRunLoop:(NSRunLoop *)aRunLoop forMode:(NSRunLoopMode)mode
{
}

- (NSURLRequest)originalRequest
{
  internal = self->_internal;
  else {
    return 0LL;
  }
}

- (NSURLRequest)currentRequest
{
  internal = self->_internal;
  else {
    return 0LL;
  }
}

- (id)connectionProperties
{
  internal = self->_internal;
  else {
    return 0LL;
  }
}

- (void)setDefersCallbacks:(BOOL)a3
{
  internal = self->_internal;
  if (a3) {
    -[NSURLConnectionInternal _suspendLoading](internal, "_suspendLoading");
  }
  else {
    -[NSURLConnectionInternal _resumeLoading](internal, "_resumeLoading");
  }
}

- (BOOL)defersCallbacks
{
  return 0;
}

- (id)_cfInternal
{
  if ((objc_opt_isKindOfClass() & 1) != 0) {
    return self->_internal;
  }
  else {
    return 0LL;
  }
}

- (void)_suspendLoading
{
}

- (void)_resumeLoading
{
}

+ (NSURLConnection)connectionWithRequest:(NSURLRequest *)request delegate:(id)delegate
{
  return  -[NSURLConnection initWithRequest:delegate:]( objc_alloc(&OBJC_CLASS___NSURLConnection),  "initWithRequest:delegate:",  request,  delegate);
}

+ (NSData)sendSynchronousRequest:(NSURLRequest *)request returningResponse:(NSURLResponse *)response error:(NSError *)error
{
  uint64_t v24 = *MEMORY[0x1895F89C0];
  if ([MEMORY[0x189607A40] isMainThread])
  {
    if (__CFNProcessIsApplication::onceToken != -1) {
      dispatch_once(&__CFNProcessIsApplication::onceToken, &__block_literal_global_20);
    }
    if (__CFNProcessIsApplication::result)
    {
      v8 = -[NSURL scheme](-[NSURLRequest URL](request, "URL"), "scheme");
      if (v8)
      {
        v9 = v8;
        if (-[NSString caseInsensitiveCompare:](v8, "caseInsensitiveCompare:", @"https") == NSOrderedSame
          || -[NSString caseInsensitiveCompare:](v9, "caseInsensitiveCompare:", @"http") == NSOrderedSame
          || -[NSString caseInsensitiveCompare:](v9, "caseInsensitiveCompare:", @"ftp") == NSOrderedSame)
        {
          if (__CFNPerformanceDiagnosticRuntimeIssuesLogHandle::onceToken != -1) {
            dispatch_once(&__CFNPerformanceDiagnosticRuntimeIssuesLogHandle::onceToken, &__block_literal_global_9_4731);
          }
          v10 = (os_log_s *)__CFNPerformanceDiagnosticRuntimeIssuesLogHandle::logger;
          if (os_log_type_enabled( (os_log_t)__CFNPerformanceDiagnosticRuntimeIssuesLogHandle::logger,  OS_LOG_TYPE_FAULT))
          {
            LODWORD(buf.var0) = 136315394;
            *(id *)((char *)&buf.var0 + 4) = "__delegate_identifier__:Performance Diagnostics__:::____message__:";
            WORD2(buf.var1) = 2112;
            *(id *)((char *)&buf.var1 + 6) = -[NSURLRequest URL](request, "URL");
            _os_log_fault_impl( &dword_18298D000,  v10,  OS_LOG_TYPE_FAULT,  "%sSynchronous URL loading of %@ should not occur on this application's main thread as it may lead to UI un responsiveness. Please switch to an asynchronous networking API such as URLSession.",  (uint8_t *)&buf,  0x16u);
          }
        }
      }
    }
  }

  buf.var5 = 0LL;
  buf.var0 = 0LL;
  *(_OWORD *)&buf.var2 = 0u;
  buf.var1 = request;
  *(void *)&buf.var4 = 1LL;
  v11 = createCFRequest(&buf);
  if (!v11)
  {
    if (!error) {
      return 0LL;
    }
    id v17 = objc_alloc(MEMORY[0x189607870]);
    v15 = 0LL;
    *error = (NSError *)(id)objc_msgSend( v17,  "_web_initWithDomain_nowarn:code:URL:",  *MEMORY[0x189607688],  12,  -[NSURLRequest URL](request, "URL"));
    return v15;
  }

  v12 = v11;
  CFTypeRef v21 = 0LL;
  CFTypeRef cf = 0LL;
  if (response) {
    p_CFTypeRef cf = &cf;
  }
  else {
    p_CFTypeRef cf = 0LL;
  }
  if (error) {
    v14 = &v21;
  }
  else {
    v14 = 0LL;
  }
  v15 = (NSData *)CFURLConnectionSendSynchronousRequest(v11, p_cf, v14, 86400.0);
  CFRelease(v12);
  if (!response)
  {
LABEL_23:
    if (error) {
      goto LABEL_24;
    }
    goto LABEL_33;
  }

  if (cf)
  {
    *response = (NSURLResponse *)+[NSURLResponse _responseWithCFURLResponse:]( &OBJC_CLASS___NSURLResponse,  "_responseWithCFURLResponse:");
    CFRelease(cf);
    goto LABEL_23;
  }

  *response = 0LL;
  if (error)
  {
LABEL_24:
    if (v21)
    {
      v16 = (NSError *)cfnTranslateCFError((__CFError *)v21, -[NSURLRequest URL](request, "URL"));
      *error = v16;
      if (v16 == v21) {
        v18 = v16;
      }
      else {
        CFRelease(v21);
      }
    }
  }

+ (void)sendAsynchronousRequest:(NSURLRequest *)request queue:(NSOperationQueue *)queue completionHandler:(void *)handler
{
  *(void *)&v15.var4 = 1LL;
  v15.var5 = 0LL;
  v15.var0 = 0LL;
  *(_OWORD *)&v15.var2 = 0u;
  v15.var1 = request;
  v8 = createCFRequest(&v15);
  if (v8)
  {
    dispatch_queue_global_t global_queue = dispatch_get_global_queue(0LL, 0LL);
    v13[0] = MEMORY[0x1895F87A8];
    v13[1] = 3221225472LL;
    v13[2] = __67__NSURLConnection_sendAsynchronousRequest_queue_completionHandler___block_invoke_2;
    v13[3] = &unk_189C07218;
    v13[5] = request;
    v13[6] = handler;
    v13[4] = queue;
    v10 = CFGetAllocator(v8);
    uint64_t v11 = MEMORY[0x186E12804](v10, 72LL, 0LL);
    *(_OWORD *)uint64_t v11 = 0u;
    *(_OWORD *)(v11 + 16) = 0u;
    *(_OWORD *)(v11 + 32) = 0u;
    *(_OWORD *)(v11 + 48) = 0u;
    *(void *)(v11 + 64) = 0LL;
    uint64_t v12 = SyncClient::SyncClient(v11, v10, v8, global_queue, v13);
    CFURLConnectionStart(*(void *)(v12 + 24));
    (*(void (**)(uint64_t))(*(void *)v11 + 48LL))(v11);
  }

  else
  {
    v14[0] = MEMORY[0x1895F87A8];
    v14[1] = 3221225472LL;
    v14[2] = __67__NSURLConnection_sendAsynchronousRequest_queue_completionHandler___block_invoke;
    v14[3] = &unk_189C1A2E8;
    v14[4] = request;
    v14[5] = handler;
    -[NSOperationQueue addOperationWithBlock:](queue, "addOperationWithBlock:", v14);
  }

  CFRelease(v8);
}

+ (BOOL)canHandleRequest:(NSURLRequest *)request
{
  return +[NSURLProtocol _protocolClassForRequest:skipAppSSO:]( &OBJC_CLASS___NSURLProtocol,  "_protocolClassForRequest:skipAppSSO:",  request,  1LL) != 0;
}

+ (unint64_t)_sweeperInterval
{
  return 0LL;
}

uint64_t __67__NSURLConnection_sendAsynchronousRequest_queue_completionHandler___block_invoke(uint64_t result)
{
  if (*(void *)(result + 40))
  {
    uint64_t v1 = result;
    id v2 = objc_alloc(MEMORY[0x189607870]);
    id v3 = (id)objc_msgSend( v2,  "_web_initWithDomain_nowarn:code:URL:",  *MEMORY[0x189607688],  12,  objc_msgSend(*(id *)(v1 + 32), "URL"));
    return (*(uint64_t (**)(void))(*(void *)(v1 + 40) + 16LL))();
  }

  return result;
}

uint64_t __67__NSURLConnection_sendAsynchronousRequest_queue_completionHandler___block_invoke_2( uint64_t a1,  CFTypeRef cf,  CFTypeRef a3,  CFTypeRef a4)
{
  if (cf) {
    CFRetain(cf);
  }
  if (a4) {
    CFRetain(a4);
  }
  if (a3) {
    CFRetain(a3);
  }
  v8 = *(void **)(a1 + 32);
  v10[0] = MEMORY[0x1895F87A8];
  v10[1] = 3221225472LL;
  v10[2] = __67__NSURLConnection_sendAsynchronousRequest_queue_completionHandler___block_invoke_3;
  v10[3] = &unk_189C160F8;
  CFTypeRef v12 = a3;
  CFTypeRef v13 = a4;
  __int128 v11 = *(_OWORD *)(a1 + 40);
  CFTypeRef v14 = cf;
  return [v8 addOperationWithBlock:v10];
}

void __67__NSURLConnection_sendAsynchronousRequest_queue_completionHandler___block_invoke_3(uint64_t a1)
{
  if (*(void *)(a1 + 40))
  {
    id v2 = (void *)MEMORY[0x186E1578C]();
    if (*(void *)(a1 + 48)) {
      +[NSURLResponse _responseWithCFURLResponse:](&OBJC_CLASS___NSURLResponse, "_responseWithCFURLResponse:");
    }
    id v3 = *(__CFError **)(a1 + 56);
    if (v3) {
      cfnTranslateCFError(v3, (void *)[*(id *)(a1 + 32) URL]);
    }
    (*(void (**)(void))(*(void *)(a1 + 40) + 16LL))();
    objc_autoreleasePoolPop(v2);
  }

  v4 = *(const void **)(a1 + 64);
  if (v4) {
    CFRelease(v4);
  }
  v5 = *(const void **)(a1 + 56);
  if (v5) {
    CFRelease(v5);
  }
  v6 = *(const void **)(a1 + 48);
  if (v6) {
    CFRelease(v6);
  }
}

- (id)_timingData
{
  return -[NSURLConnectionInternal _timingData](self->_internal, "_timingData");
}

- (id)_initWithRequest:(id)a3 delegate:(id)a4 usesCache:(BOOL)a5 maxContentLength:(int64_t)a6 startImmediately:(BOOL)a7 connectionProperties:(id)a8
{
  BOOL v9 = a7;
  if (!a3 && os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_FAULT))
  {
    LOWORD(v20[0]) = 0;
    _os_log_fault_impl( &dword_18298D000,  MEMORY[0x1895F8DA0],  OS_LOG_TYPE_FAULT,  "assertion failure",  (uint8_t *)v20,  2u);
  }

  v23.receiver = self;
  v23.super_class = (Class)&OBJC_CLASS___NSURLConnection;
  InternalInit v15 = -[NSURLConnection init](&v23, sel_init);
  if (v15)
  {
    v16 = objc_alloc(&OBJC_CLASS___NSURLConnectionInternalConnection);
    v15->_internal = &v16->super;
    if (!v16) {
      goto LABEL_9;
    }
    v20[0] = v15;
    v20[1] = a3;
    v20[2] = a4;
    v20[3] = a8;
    BOOL v21 = a5;
    int64_t v22 = a6;
    uint64_t v17 = -[NSURLConnectionInternalConnection initWithInfo:](v16, "initWithInfo:", v20);
    v15->_internal = (NSURLConnectionInternal *)v17;
    if (v17)
    {
      if (v9)
      {
        uint64_t v18 = [MEMORY[0x189604008] currentRunLoop];
        -[NSURLConnection scheduleInRunLoop:forMode:](v15, "scheduleInRunLoop:forMode:", v18, *MEMORY[0x189603A40]);
        -[NSURLConnection start](v15, "start");
      }
    }

    else
    {
LABEL_9:

      return 0LL;
    }
  }

  return v15;
}

- (void)useCredential:(id)a3 forAuthenticationChallenge:(id)a4
{
}

- (void)continueWithoutCredentialForAuthenticationChallenge:(id)a3
{
}

- (void)cancelAuthenticationChallenge:(id)a3
{
}

- (void)performDefaultHandlingForAuthenticationChallenge:(id)a3
{
}

- (void)rejectProtectionSpaceAndContinueWithChallenge:(id)a3
{
}

+ (void)_setCollectsTimingData:(BOOL)a3
{
  _timingDataCollection = a3;
}

+ (void)_collectTimingDataWithOptions:(unint64_t)a3
{
  _dataCollection = a3;
  [a1 _setCollectsTimingData:1];
}

+ (unint64_t)_timingDataOptions
{
  return _dataCollection;
}

+ (__CFRunLoop)resourceLoaderRunLoop
{
  if (+[NSURLConnection(Loader) resourceLoaderRunLoop]::sOnce != -1) {
    dispatch_once(&+[NSURLConnection(Loader) resourceLoaderRunLoop]::sOnce, &__block_literal_global_4117);
  }
  return (__CFRunLoop *)+[NSURLConnection(Loader) resourceLoaderRunLoop]::sLoadRunLoop;
}

+ (void)_setLoaderThreadPriority:(int)a3
{
  _loaderThreadPriority = a3;
}

CFTypeRef __48__NSURLConnection_Loader__resourceLoaderRunLoop__block_invoke()
{
  CFTypeRef result = CoreSchedulingSet::createNewPrivateRunLoopThread( (uint64_t)"com.apple.NSURLConnectionLoader",  (uint64_t)&__block_literal_global_14_4119,  &__block_literal_global_16_4120);
  +[NSURLConnection(Loader) resourceLoaderRunLoop]::sLoadRunLoop = (uint64_t)result;
  return result;
}

uint64_t __48__NSURLConnection_Loader__resourceLoaderRunLoop__block_invoke_3()
{
  *(_DWORD *)v2.__opaque = 0;
  v2.sched_priority = _loaderThreadPriority;
  v0 = pthread_self();
  uint64_t result = pthread_setschedparam(v0, 1, &v2);
  if ((_DWORD)result == -1)
  {
    NSLog(@"FATAL: Failed to change priority.");
    abort();
  }

  return result;
}

+ (void)_setMIMETypesWithNoSizeLimit:(id)a3
{
  if ((+[NSURLConnection(Deprecated) _setMIMETypesWithNoSizeLimit:]::sDidWarn & 1) == 0)
  {
    +[NSURLConnection(Deprecated) _setMIMETypesWithNoSizeLimit:]::sDidWarn = 1;
    NSLog(@"%s deprecated", a2, a3, "+[NSURLConnection(Deprecated) _setMIMETypesWithNoSizeLimit:]");
  }

@end