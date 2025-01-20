@interface NSURLSession
+ (NSURLSession)sessionWithConfiguration:(NSURLSessionConfiguration *)configuration delegate:(id)delegate delegateQueue:(NSOperationQueue *)queue;
+ (__NSURLSessionLocal)_sessionWithConfiguration:(uint64_t)a3 delegate:(uint64_t)a4 delegateQueue:(uint64_t)a5 delegateDispatchQueue:;
+ (uint64_t)_errorFromError:(void *)a3 forTask:;
+ (uint64_t)_sharedSession;
+ (uint64_t)_sharedSessionForConnection;
- (NSString)_tlsSessionCachePrefix;
- (NSURLSession)initWithConfiguration:(id)a3 delegate:(id)a4 delegateQueue:(id)a5 delegateDispatchQueue:(id)a6;
- (NSURLSessionConfiguration)_groupConfiguration;
- (NSURLSessionConfiguration)configuration;
- (NSURLSessionDataTask)dataTaskWithRequest:(NSURLRequest *)request;
- (id).cxx_construct;
- (id)delegate;
- (uint64_t)_onqueue_didCompleteTask:(void *)a3 withError:;
- (void)dealloc;
- (void)finalizeDelegateWithError:(uint64_t)a1;
- (void)invalidateAndCancel;
- (void)runDelegateBlock:(uint64_t)a1;
@end

@implementation NSURLSession

- (NSURLSessionDataTask)dataTaskWithRequest:(NSURLRequest *)request
{
  v5 = -[__NSCFTaskForClass initWithGroup:]( objc_alloc(&OBJC_CLASS_____NSCFTaskForClass),  -[NSURLSession defaultTaskGroup](self, "defaultTaskGroup"));
  v7 = v5;
  if (v5) {
    objc_setProperty_atomic(v5, v6, request, 16LL);
  }
  return (NSURLSessionDataTask *)-[NSURLSession _dataTaskWithTaskForClass:]( self,  "_dataTaskWithTaskForClass:",  v7);
}

- (NSURLSessionConfiguration)_groupConfiguration
{
  return self->_local_immutable_configuration_ivar;
}

+ (NSURLSession)sessionWithConfiguration:(NSURLSessionConfiguration *)configuration delegate:(id)delegate delegateQueue:(NSOperationQueue *)queue
{
  return (NSURLSession *)+[NSURLSession _sessionWithConfiguration:delegate:delegateQueue:delegateDispatchQueue:]( (uint64_t)&OBJC_CLASS___NSURLSession,  configuration,  (uint64_t)delegate,  (uint64_t)queue,  0LL);
}

+ (__NSURLSessionLocal)_sessionWithConfiguration:(uint64_t)a3 delegate:(uint64_t)a4 delegateQueue:(uint64_t)a5 delegateDispatchQueue:
{
  uint64_t v58 = *MEMORY[0x1895F89C0];
  v9 = (id *)objc_opt_self();
  if ([v9 isEqual:objc_opt_class()])
  {
    v10 = (void *)MEMORY[0x189603F70];
    uint64_t v11 = *MEMORY[0x189603A60];
    Name = sel_getName(sel__sessionWithConfiguration_delegate_delegateQueue_delegateDispatchQueue_);
    v13 = (objc_class *)objc_opt_class();
    objc_msgSend(v10, "raise:format:", v11, @"*** -%s is not supported by %s", Name, class_getName(v13));
  }

  objc_opt_self();
  if (-[NSString isEqualToString:]( -[NSURLSessionConfiguration disposition](a2, "disposition"),  "isEqualToString:",  0x18C5B2680LL)
    || -[NSURLSessionConfiguration _disablesNWLoader](a2, "_disablesNWLoader"))
  {
    goto LABEL_9;
  }

  if (__CFNUseNWLoader::onceToken != -1) {
    dispatch_once(&__CFNUseNWLoader::onceToken, &__block_literal_global_32);
  }
  if (__CFNUseNWLoader::useNWLoader == 1
    || __CFNUseNWLoader::useNWLoader != 2
    && (-[NSURLSessionConfiguration _usesNWLoader](a2, "_usesNWLoader")
     || -[NSURLSessionConfiguration proxiesRequireNWLoader](a2, "proxiesRequireNWLoader")
     || (objc_opt_self(), gotLoadHelper_x22__OBJC_CLASS___PrivacyProxyClient(v37), objc_opt_class())
     && ([v9[333] currentProcessShouldUseOpaqueProxying] & 1) != 0))
  {
    int v14 = 1;
  }

  else
  {
LABEL_9:
    int v14 = 0;
  }

  if (+[NSURLSession _sessionWithConfiguration:delegate:delegateQueue:delegateDispatchQueue:]::onceToken != -1) {
    dispatch_once( &+[NSURLSession _sessionWithConfiguration:delegate:delegateQueue:delegateDispatchQueue:]::onceToken,  &__block_literal_global_47_12588);
  }
  v15 = (void *)MEMORY[0x186E1578C]();
  if (!a2)
  {
    if ((v14 & 1) != 0)
    {
LABEL_33:
      objc_autoreleasePoolPop(v15);
      return (__NSURLSessionLocal *)(id)[objc_alloc(objc_getClass("NWURLSession")) initWithConfiguration:a2 delegate:a3 delegateQueue:a4];
    }

    a2 = +[NSURLSessionConfiguration defaultSessionConfiguration]( &OBJC_CLASS___NSURLSessionConfiguration,  "defaultSessionConfiguration");
LABEL_34:
    v28 = -[__NSURLSessionLocal initWithConfiguration:delegate:delegateQueue:delegateDispatchQueue:]( objc_alloc(&OBJC_CLASS_____NSURLSessionLocal),  "initWithConfiguration:delegate:delegateQueue:delegateDispatchQueue:",  a2,  a3,  a4,  a5);
    if (-[NSURLSessionConfiguration _disableAPWakeOnIdleConnections](a2, "_disableAPWakeOnIdleConnections"))
    {
      if (CFNLog::onceToken != -1) {
        dispatch_once(&CFNLog::onceToken, &__block_literal_global_1_4717);
      }
      v29 = (os_log_s *)CFNLog::logger;
      if (os_log_type_enabled((os_log_t)CFNLog::logger, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(buf) = 0;
        _os_log_impl( &dword_18298D000,  v29,  OS_LOG_TYPE_DEFAULT,  "Session opted-in for _disableAPWakeOnIdleConnections",  (uint8_t *)&buf,  2u);
      }

      v30 = v28;
      if (v28)
      {
        *((_DWORD *)v28 + 13) = 0;
        *((_DWORD *)v28 + 12) = 0;
        *((_BYTE *)v28 + 69) = 0;
        io_connect_t v31 = IORegisterForSystemPower( v28,  (IONotificationPortRef *)v28 + 7,  (IOServiceInterestCallback)_systemPowerNotificationsCallback,  (io_object_t *)v28 + 16);
        *((_DWORD *)v28 + 13) = v31;
        if (v31)
        {
          IONotificationPortSetDispatchQueue(*((IONotificationPortRef *)v28 + 7), *((dispatch_queue_t *)v28 + 15));
        }

        else
        {
          if (CFNLog::onceToken != -1) {
            dispatch_once(&CFNLog::onceToken, &__block_literal_global_1_4717);
          }
          v39 = (os_log_s *)CFNLog::logger;
          if (os_log_type_enabled((os_log_t)CFNLog::logger, OS_LOG_TYPE_ERROR))
          {
            LOWORD(buf) = 0;
            _os_log_error_impl( &dword_18298D000,  v39,  OS_LOG_TYPE_ERROR,  "Failed to IORegisterForSystemPower",  (uint8_t *)&buf,  2u);
          }
        }
      }
    }

    objc_autoreleasePoolPop(v15);
    goto LABEL_67;
  }

  if (!CFEqual(-[NSURLSessionConfiguration disposition](a2, "disposition"), &unk_18C5B2680))
  {
    if ((v14 & 1) != 0) {
      goto LABEL_33;
    }
    goto LABEL_34;
  }

  if (!-[NSURLSessionConfiguration _isProxySession](a2, "_isProxySession")
    && MKBDeviceUnlockedSinceBoot_delayInitStub(v16) != 1)
  {
    if (CFNLog::onceToken != -1) {
      dispatch_once(&CFNLog::onceToken, &__block_literal_global_1_4717);
    }
    v17 = (os_log_s *)CFNLog::logger;
    if (os_log_type_enabled((os_log_t)CFNLog::logger, OS_LOG_TYPE_ERROR))
    {
      LOWORD(buf) = 0;
      _os_log_error_impl( &dword_18298D000,  v17,  OS_LOG_TYPE_ERROR,  "Attempting to create a background session before first device unlock!",  (uint8_t *)&buf,  2u);
    }

    if (MKBDeviceFormattedForContentProtection_delayInitStub(v18)
      && MKBDeviceUnlockedSinceBoot_delayInitStub(v19) != 1)
    {
      if (CFNLog::onceToken != -1) {
        dispatch_once(&CFNLog::onceToken, &__block_literal_global_1_4717);
      }
      v20 = (os_log_s *)CFNLog::logger;
      if (os_log_type_enabled((os_log_t)CFNLog::logger, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(buf) = 0;
        _os_log_impl(&dword_18298D000, v20, OS_LOG_TYPE_DEFAULT, "Waiting for first unlock", (uint8_t *)&buf, 2u);
      }

      uint64_t v49 = 0LL;
      v50 = (int *)&v49;
      uint64_t v51 = 0x2020000000LL;
      int v52 = 0;
      v21 = dispatch_semaphore_create(0LL);
      v22 = dispatch_queue_create("com.apple.nsurlsession.wait-unlock", 0LL);
      uint64_t v23 = MEMORY[0x1895F87A8];
      block[0] = MEMORY[0x1895F87A8];
      block[1] = 3221225472LL;
      block[2] = ___ZL28CFNWaitUntilDeviceIsUnlockedv_block_invoke;
      block[3] = &unk_189C1A548;
      block[4] = v21;
      gotLoadHelper_x8__kMobileKeyBagLockStatusNotifyToken(v24);
      v26 = **(const char ***)(v25 + 1400);
      *(void *)&__int128 buf = v23;
      *((void *)&buf + 1) = 3221225472LL;
      v54 = ___ZL28CFNWaitUntilDeviceIsUnlockedv_block_invoke_347;
      v55 = &unk_189C137C8;
      v56 = block;
      v57 = &v49;
      if (notify_register_dispatch(v26, v50 + 6, v22, &buf))
      {
        if (CFNLog::onceToken != -1) {
          dispatch_once(&CFNLog::onceToken, &__block_literal_global_1_4717);
        }
        v42 = (os_log_s *)CFNLog::logger;
        if (os_log_type_enabled((os_log_t)CFNLog::logger, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)v43 = 0;
          _os_log_error_impl( &dword_18298D000,  v42,  OS_LOG_TYPE_ERROR,  "Failed to regsiter for lock status notification! Calling abort()",  v43,  2u);
        }

        abort();
      }

      dispatch_async(v22, block);
      dispatch_semaphore_wait(v21, 0xFFFFFFFFFFFFFFFFLL);
      *(void *)v43 = v23;
      uint64_t v44 = 3221225472LL;
      v45 = ___ZL28CFNWaitUntilDeviceIsUnlockedv_block_invoke_348;
      v46 = &unk_189C17740;
      v47 = &v49;
      dispatch_sync(v22, v43);
      dispatch_release(v22);
      dispatch_release(v21);
      _Block_object_dispose(&v49, 8);
    }
  }

  if (-[NSURLSessionConfiguration _isProxySession](a2, "_isProxySession"))
  {
    v28 = -[__NSURLBackgroundSession initWithConfiguration:delegate:delegateQueue:delegateDispatchQueue:]( objc_alloc(&OBJC_CLASS_____NSURLBackgroundSession),  "initWithConfiguration:delegate:delegateQueue:delegateDispatchQueue:",  a2,  a3,  a4,  a5);
    goto LABEL_60;
  }

  if (__CFNIsInDevelopmentEnvironment::onceToken != -1) {
    dispatch_once(&__CFNIsInDevelopmentEnvironment::onceToken, &__block_literal_global_21_4739);
  }
  if (__CFNIsInDevelopmentEnvironment::ok)
  {
    gotLoadHelper_x8__CPCopyBundleIdentifierAndTeamFromSecTaskRef(v27);
    if (*(void *)(v32 + 3792))
    {
      if (+[NSURLSession _sessionWithConfiguration:delegate:delegateQueue:delegateDispatchQueue:]::onceToken != -1) {
        dispatch_once( &+[NSURLSession _sessionWithConfiguration:delegate:delegateQueue:delegateDispatchQueue:]::onceToken,  &__block_literal_global_51);
      }
    }
  }

  v33 = (void *)objc_opt_class();
  objc_sync_enter(v33);
  if (!objc_msgSend( (id)gBackgroundSessions,  "objectForKey:",  -[NSURLSessionConfiguration identifier](a2, "identifier")))
  {
    v28 = -[__NSURLBackgroundSession initWithConfiguration:delegate:delegateQueue:delegateDispatchQueue:]( objc_alloc(&OBJC_CLASS_____NSURLBackgroundSession),  "initWithConfiguration:delegate:delegateQueue:delegateDispatchQueue:",  a2,  a3,  a4,  a5);
    objc_msgSend( (id)gBackgroundSessions,  "setObject:forKey:",  v28,  -[NSURLSessionConfiguration identifier](a2, "identifier"));
    objc_sync_exit(v33);
LABEL_60:
    objc_autoreleasePoolPop(v15);
    if (v14) {
      return (__NSURLSessionLocal *)(id)[objc_alloc(objc_getClass("NWURLSession")) initWithConfiguration:a2 delegate:a3 delegateQueue:a4];
    }
LABEL_67:
    if (-[NSURLSession delegate](v28, "delegate")) {
      v40 = v28;
    }
    return v28;
  }

  if (CFNLog::onceToken != -1) {
    dispatch_once(&CFNLog::onceToken, &__block_literal_global_1_4717);
  }
  v34 = (os_log_s *)CFNLog::logger;
  if (os_log_type_enabled((os_log_t)CFNLog::logger, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v35 = -[NSURLSessionConfiguration identifier](a2, "identifier");
    LODWORD(buf) = 138412290;
    *(void *)((char *)&buf + 4) = v35;
    _os_log_impl( &dword_18298D000,  v34,  OS_LOG_TYPE_DEFAULT,  "A background URLSession with identifier %@ already exists!",  (uint8_t *)&buf,  0xCu);
  }

  uint64_t v36 = objc_msgSend( (id)gBackgroundSessions,  "objectForKey:",  -[NSURLSessionConfiguration identifier](a2, "identifier"));
  objc_sync_exit(v33);
  objc_autoreleasePoolPop(v15);
  return (__NSURLSessionLocal *)v36;
}

- (id).cxx_construct
{
  *((void *)self + 2) = 0LL;
  *((void *)self + 3) = 0LL;
  return self;
}

- (NSURLSession)initWithConfiguration:(id)a3 delegate:(id)a4 delegateQueue:(id)a5 delegateDispatchQueue:(id)a6
{
  v23.receiver = self;
  v23.super_class = (Class)&OBJC_CLASS___NSURLSession;
  v10 = -[NSURLSession init](&v23, sel_init);
  if (!v10) {
    return v10;
  }
  if (!a3) {
    a3 = +[NSURLSessionConfiguration defaultSessionConfiguration]( &OBJC_CLASS___NSURLSessionConfiguration,  "defaultSessionConfiguration");
  }
  v10->_local_immutable_configuration_ivar = (NSURLSessionConfiguration *)[a3 copyImmutableVariant:&__block_literal_global_101_12540];
  v10->_delegateQueue_ivar = (NSOperationQueue *)a5;
  v10->_delegate_ivar = (NSURLSessionDelegate *)a4;
  if (a6)
  {
    v10->_delegateDispatchQueue = (OS_dispatch_queue *)a6;
    uint64_t v11 = (dispatch_object_s *)a6;
  }

  else
  {
    if ((id)[MEMORY[0x189607988] mainQueue] != a5)
    {
      if (!a5)
      {
        v21 = dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
        v10->_delegateDispatchQueue = (OS_dispatch_queue *)dispatch_queue_create("com.apple.NSURLSession-delegate", v21);
      }

      goto LABEL_7;
    }

    uint64_t v11 = (dispatch_object_s *)MEMORY[0x1895F8AE0];
    v10->_delegateDispatchQueue = (OS_dispatch_queue *)MEMORY[0x1895F8AE0];
  }

  dispatch_retain(v11);
LABEL_7:
  v12 = dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v10->_workQueue = (OS_dispatch_queue *)dispatch_queue_create("com.apple.NSURLSession-work", v12);
  v13 = (NSUUID *)objc_alloc_init(MEMORY[0x189607AB8]);
  v10->_uuid_ivar = v13;
  v10->_tlsSessionCachePrefix = (NSString *)-[NSString copy](-[NSUUID UUIDString](v13, "UUIDString"), "copy");
  objc_opt_self();
  if (+[__CFN_ConnectionContextManager sharedManager]::onceToken != -1) {
    dispatch_once(&+[__CFN_ConnectionContextManager sharedManager]::onceToken, &__block_literal_global_13542);
  }
  uint64_t v14 = _sharedManager;
  v10->_nwContextManager = (__CFN_ConnectionContextManager *)_sharedManager;
  -[__CFN_ConnectionContextManager registerSession:](&v22, v14, (uint64_t)v10);
  std::shared_ptr<CoreSchedulingSet>::operator=[abi:nn180100]((uint64_t)&v10->_nwContext, &v22);
  v15 = (std::__shared_weak_count *)*((void *)&v22 + 1);
  if (*((void *)&v22 + 1))
  {
    double v16 = (unint64_t *)(*((void *)&v22 + 1) + 8LL);
    do
      unint64_t v17 = __ldaxr(v16);
    while (__stlxr(v17 - 1, v16));
    if (!v17)
    {
      ((void (*)(std::__shared_weak_count *))v15->__on_zero_shared)(v15);
      std::__shared_weak_count::__release_weak(v15);
    }
  }

  v10->_lock._os_unfair_lock_opaque = 0;
  double v18 = -[__NSCFURLSessionDelegateWrapper initWithSession:]( (id *)objc_alloc(&OBJC_CLASS_____NSCFURLSessionDelegateWrapper),  v10);
  v10->_delegateWrapper = (__NSCFURLSessionDelegateWrapper *)v18;
  if (v18) {
    objc_setProperty_atomic(v18, v19, a4, 32LL);
  }
  return v10;
}

uint64_t __83__NSURLSession_initWithConfiguration_delegate_delegateQueue_delegateDispatchQueue___block_invoke( uint64_t a1,  void *a2)
{
  uint64_t result = [a2 _appleIDContext];
  if (result) {
    return objc_msgSend( a2,  "set_authenticatorStatusCodes:",  objc_msgSend((id)objc_msgSend(a2, "_appleIDContext"), "relevantHTTPStatusCodes"));
  }
  return result;
}

- (NSString)_tlsSessionCachePrefix
{
  return self->_tlsSessionCachePrefix;
}

- (id)delegate
{
  return objc_getProperty(self, a2, 96LL, 1);
}

- (void)runDelegateBlock:(uint64_t)a1
{
  if (a1)
  {
    if (*(void *)(a1 + 88)) {
      dispatch_async(*(dispatch_queue_t *)(a1 + 88), a2);
    }
    else {
      [*(id *)(a1 + 80) addOperationWithBlock:a2];
    }
  }

- (NSURLSessionConfiguration)configuration
{
  return (NSURLSessionConfiguration *)(id)-[NSURLSessionConfiguration mutableCopy]( self->_local_immutable_configuration_ivar,  "mutableCopy");
}

- (uint64_t)_onqueue_didCompleteTask:(void *)a3 withError:
{
  uint64_t v22 = *MEMORY[0x1895F89C0];
  if (!result) {
    return result;
  }
  v4 = (void *)+[NSURLSession _errorFromError:forTask:]((uint64_t)&OBJC_CLASS___NSURLSession, a3, a2);
  [a2 setState:3];
  if (!v4)
  {
    if (CFNLog::onceToken != -1) {
      dispatch_once(&CFNLog::onceToken, &__block_literal_global_1_4717);
    }
    uint64_t v5 = CFNLog::logger;
    if (!os_log_type_enabled((os_log_t)CFNLog::logger, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_23;
    }
    *(_DWORD *)__int128 buf = 138543362;
    uint64_t v17 = [a2 _loggableDescription];
    v6 = "%{public}@ finished successfully";
LABEL_18:
    uint64_t v11 = (os_log_s *)v5;
    os_log_type_t v12 = OS_LOG_TYPE_DEFAULT;
    uint32_t v13 = 12;
LABEL_22:
    _os_log_impl(&dword_18298D000, v11, v12, v6, buf, v13);
    goto LABEL_23;
  }

  if ([a2 _cacheOnly] && objc_msgSend(v4, "code") == -2000)
  {
    if (CFNLog::onceToken != -1) {
      dispatch_once(&CFNLog::onceToken, &__block_literal_global_1_4717);
    }
    uint64_t v5 = CFNLog::logger;
    if (!os_log_type_enabled((os_log_t)CFNLog::logger, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_23;
    }
    *(_DWORD *)__int128 buf = 138543362;
    uint64_t v17 = [a2 _loggableDescription];
    v6 = "%{public}@ finished - cache miss";
    goto LABEL_18;
  }

  os_log_type_t v7 = 16 * ([v4 code] != -999);
  int v8 = objc_msgSend((id)objc_msgSend(a2, "_effectiveConfiguration"), "_loggingPrivacyLevel");
  if (CFNLog::onceToken != -1) {
    dispatch_once(&CFNLog::onceToken, &__block_literal_global_1_4717);
  }
  uint64_t v9 = CFNLog::logger;
  BOOL v10 = os_log_type_enabled((os_log_t)CFNLog::logger, v7);
  if (v8 > 2)
  {
    if (v10)
    {
      *(_DWORD *)__int128 buf = 138543875;
      uint64_t v17 = [a2 _loggableDescription];
      __int16 v18 = 2048;
      uint64_t v19 = [v4 code];
      __int16 v20 = 2117;
      v21 = v4;
      v6 = "%{public}@ finished with error [%ld] %{sensitive}@";
      goto LABEL_21;
    }
  }

  else if (v10)
  {
    *(_DWORD *)__int128 buf = 138543874;
    uint64_t v17 = [a2 _loggableDescription];
    __int16 v18 = 2048;
    uint64_t v19 = [v4 code];
    __int16 v20 = 2112;
    v21 = v4;
    v6 = "%{public}@ finished with error [%ld] %@";
LABEL_21:
    uint64_t v11 = (os_log_s *)v9;
    os_log_type_t v12 = v7;
    uint32_t v13 = 32;
    goto LABEL_22;
  }

+ (uint64_t)_errorFromError:(void *)a3 forTask:
{
  if (!a2) {
    return 0LL;
  }
  if ([a2 userInfo]) {
    id v5 = (id)objc_msgSend((id)objc_msgSend(a2, "userInfo"), "mutableCopy");
  }
  else {
    id v5 = (id)[MEMORY[0x189603FC8] dictionaryWithCapacity:2];
  }
  os_log_type_t v7 = v5;
  if ([v5 objectForKeyedSubscript:@"_NSURLErrorRelatedURLSessionTaskErrorKey"]) {
    id v8 = (id)objc_msgSend( (id)objc_msgSend( v7,  "objectForKeyedSubscript:",  @"_NSURLErrorRelatedURLSessionTaskErrorKey"),  "mutableCopy");
  }
  else {
    id v8 = (id)[MEMORY[0x189603FA8] arrayWithCapacity:1];
  }
  uint64_t v9 = v8;
  objc_msgSend(v8, "insertObject:atIndex:", objc_msgSend(a3, "_description"), 0);
  objc_msgSend( v7,  "setObject:forKeyedSubscript:",  (id)objc_msgSend(v9, "copy"),  @"_NSURLErrorRelatedURLSessionTaskErrorKey");
  objc_msgSend( v7,  "setObject:forKeyedSubscript:",  objc_msgSend(a3, "_description"),  @"_NSURLErrorFailingURLSessionTaskErrorKey");
  return objc_msgSend( MEMORY[0x189607A70],  "errorWithDomain:code:userInfo:",  objc_msgSend(a2, "domain"),  objc_msgSend(a2, "code"),  v7);
}

void __51__NSURLSession__onqueue_didCompleteTask_withError___block_invoke(uint64_t a1)
{
}

- (void)invalidateAndCancel
{
  if (self->_isSharedSession_ivar)
  {
    NSLog(@"[NSURLSession sharedSession] may not be invalidated", a2);
  }

  else
  {
    objc_sync_enter(self);
    BOOL invalid_ivar = self->_invalid_ivar;
    self->_BOOL invalid_ivar = 1;
    objc_sync_exit(self);
    if (!invalid_ivar)
    {
      workQueue = (dispatch_queue_s *)self->_workQueue;
      block[0] = MEMORY[0x1895F87A8];
      block[1] = 3221225472LL;
      block[2] = __35__NSURLSession_invalidateAndCancel__block_invoke;
      block[3] = &unk_189C1A548;
      block[4] = self;
      dispatch_async(workQueue, block);
    }
  }

uint64_t __35__NSURLSession_invalidateAndCancel__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_onqueue_completeInvalidation:", 1);
}

- (void)finalizeDelegateWithError:(uint64_t)a1
{
  if (a1)
  {
    if (objc_msgSend( (id)objc_msgSend(*(id *)(a1 + 112), "disposition"),  "isEqualToString:",  0x18C5B2680)
      && ([*(id *)(a1 + 112) _isProxySession] & 1) == 0)
    {
      v3 = (void *)objc_opt_class();
      objc_sync_enter(v3);
      uint64_t v4 = [*(id *)(a1 + 112) identifier];
      if (v4 && gBackgroundSessions && [(id)gBackgroundSessions objectForKey:v4]) {
        [(id)gBackgroundSessions removeObjectForKey:v4];
      }
      objc_sync_exit(v3);
    }

    id v5 = *(void **)(a1 + 96);
    if (v5)
    {
      *(void *)(a1 + 96) = 0LL;
      -[__NSCFURLSessionDelegateWrapper didBecomeInvalidWithError:](*(void *)(a1 + 72), v2);

      block[0] = MEMORY[0x1895F87A8];
      block[1] = 3221225472LL;
      block[2] = __42__NSURLSession_finalizeDelegateWithError___block_invoke;
      block[3] = &unk_189C1A548;
      block[4] = a1;
      v6 = *(dispatch_queue_s **)(a1 + 88);
      if (v6) {
        dispatch_async(v6, block);
      }
      else {
        [*(id *)(a1 + 80) addOperationWithBlock:block];
      }
    }
  }

void __42__NSURLSession_finalizeDelegateWithError___block_invoke(uint64_t a1)
{
}

+ (uint64_t)_sharedSessionForConnection
{
  uint64_t v0 = +[NSURLSession _sharedSession]();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    if (+[NSURLSession _sharedSessionForConnection]::sOnce != -1) {
      dispatch_once(&+[NSURLSession _sharedSessionForConnection]::sOnce, &__block_literal_global_33_12703);
    }
    return +[NSURLSession _sharedSessionForConnection]::sSharedSession;
  }

  return v0;
}

+ (uint64_t)_sharedSession
{
  uint64_t v0 = (void *)objc_opt_self();
  if ([v0 isEqual:objc_opt_class()])
  {
    v1 = (void *)MEMORY[0x189603F70];
    uint64_t v2 = *MEMORY[0x189603A60];
    Name = sel_getName(sel__sharedSession);
    uint64_t v4 = (objc_class *)objc_opt_class();
    objc_msgSend(v1, "raise:format:", v2, @"*** -%s is not supported by %s", Name, class_getName(v4));
  }

  if (+[NSURLSession _sharedSession]::sOnce != -1) {
    dispatch_once(&+[NSURLSession _sharedSession]::sOnce, &__block_literal_global_29_12626);
  }
  return +[NSURLSession _sharedSession]::sSharedSession;
}

- (void)dealloc
{
  if (self->_isSharedSession_ivar) {
    __assert_rtn("-[NSURLSession dealloc]", "Session.mm", 542, "! _isSharedSession_ivar");
  }
  -[__CFN_ConnectionContextManager unregisterSession:]((uint64_t)self->_nwContextManager, (uint64_t)self);
  workQueue = (dispatch_object_s *)self->_workQueue;
  if (workQueue)
  {
    dispatch_release(workQueue);
    self->_workQueue = 0LL;
  }

  self->_uuid_ivar = 0LL;
  self->_tlsSessionCachePrefix = 0LL;
  __int128 v11 = 0uLL;
  std::shared_ptr<CoreSchedulingSet>::operator=[abi:nn180100]((uint64_t)&self->_nwContext, &v11);
  id v5 = (std::__shared_weak_count *)*((void *)&v11 + 1);
  if (*((void *)&v11 + 1))
  {
    v6 = (unint64_t *)(*((void *)&v11 + 1) + 8LL);
    do
      unint64_t v7 = __ldaxr(v6);
    while (__stlxr(v7 - 1, v6));
    if (!v7)
    {
      ((void (*)(std::__shared_weak_count *))v5->__on_zero_shared)(v5);
      std::__shared_weak_count::__release_weak(v5);
    }
  }

  self->_nwContextManager = 0LL;
  objc_setProperty_atomic(self, v4, 0LL, 144LL);
  objc_setProperty_atomic(self, v8, 0LL, 152LL);

  self->_sessionDescription_ivar = 0LL;
  self->_atsState_ivar = 0LL;

  delegateDispatchQueue = (dispatch_object_s *)self->_delegateDispatchQueue;
  if (delegateDispatchQueue) {
    dispatch_release(delegateDispatchQueue);
  }

  self->_delegate_ivar = 0LL;
  self->_local_immutable_configuration_ivar = 0LL;
  v10.receiver = self;
  v10.super_class = (Class)&OBJC_CLASS___NSURLSession;
  -[NSURLSession dealloc](&v10, sel_dealloc);
}

- (void).cxx_destruct
{
}

@end