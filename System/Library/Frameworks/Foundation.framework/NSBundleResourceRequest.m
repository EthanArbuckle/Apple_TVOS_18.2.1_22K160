@interface NSBundleResourceRequest
+ (id)_assetPackBundleForBundle:(id)a3 withAssetPackID:(id)a4;
+ (id)_connection;
+ (id)_extensionEndpoint;
+ (id)_extensionEndpointForMainBundleOfHostApplication:(id)a3;
+ (id)_manifestWithBundle:(id)a3 error:(id *)a4;
+ (void)_addExtensionEndpoint:(id)a3;
+ (void)_flushCacheForBundle:(id)a3;
+ (void)_setConnection:(id)a3;
- (NSBundle)bundle;
- (NSBundleResourceRequest)init;
- (NSBundleResourceRequest)initWithTag:(id)a3;
- (NSBundleResourceRequest)initWithTags:(NSSet *)tags;
- (NSBundleResourceRequest)initWithTags:(NSSet *)tags bundle:(NSBundle *)bundle;
- (NSProgress)progress;
- (NSSet)tags;
- (double)loadingPriority;
- (void)beginAccessingResourcesWithCompletionHandler:(void *)completionHandler;
- (void)conditionallyBeginAccessingResourcesWithCompletionHandler:(void *)completionHandler;
- (void)dealloc;
- (void)endAccessingResources;
- (void)setLoadingPriority:(double)loadingPriority;
@end

@implementation NSBundleResourceRequest

+ (id)_connection
{
  id result = (id)qword_18C497F58;
  if (!qword_18C497F58)
  {
    if (qword_18C497F68 != -1) {
      dispatch_once(&qword_18C497F68, &__block_literal_global_212);
    }
    return (id)qword_18C497F60;
  }

  return result;
}

void __38__NSBundleResourceRequest__connection__block_invoke()
{
  qword_18C497F60 = -[NSXPCConnection initWithMachServiceName:options:]( objc_alloc(&OBJC_CLASS___NSXPCConnection),  "initWithMachServiceName:options:",  @"com.apple.ondemandd.client",  0LL);
  _setupConnection((void *)qword_18C497F60);
}

+ (void)_setConnection:(id)a3
{
  if (qword_18C497F58)
  {
    [(id)qword_18C497F58 invalidate];
  }

  id v4 = a3;
  qword_18C497F58 = (uint64_t)v4;
  if (a3) {
    _setupConnection(v4);
  }
}

+ (void)_flushCacheForBundle:(id)a3
{
  if (qword_18C497F38) {
    [(id)qword_18C497F38 removeObjectForKey:a3];
  }
  os_unfair_lock_unlock((os_unfair_lock_t)&_MergedGlobals_1_0);
}

- (NSBundleResourceRequest)init
{
  return -[NSBundleResourceRequest initWithTag:](v2, v3, v4);
}

- (NSBundleResourceRequest)initWithTag:(id)a3
{
  return -[NSBundleResourceRequest initWithTags:bundle:]( self,  "initWithTags:bundle:",  [MEMORY[0x189604010] setWithObject:a3],  +[NSBundle mainBundle](NSBundle, "mainBundle"));
}

- (NSBundleResourceRequest)initWithTags:(NSSet *)tags
{
  return -[NSBundleResourceRequest initWithTags:bundle:]( self,  "initWithTags:bundle:",  tags,  +[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
}

- (NSBundleResourceRequest)initWithTags:(NSSet *)tags bundle:(NSBundle *)bundle
{
  uint64_t v10 = *MEMORY[0x1895F89C0];
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___NSBundleResourceRequest;
  v6 = -[NSBundleResourceRequest init](&v9, sel_init);
  if (v6)
  {
    v6->_tags = (NSSet *)-[NSSet copy](tags, "copy");
    v6->_priority = 0.5;
    v6->_bundle = bundle;
    v7 = -[NSProgress initWithParent:userInfo:]( objc_alloc(&OBJC_CLASS___NSProgress),  "initWithParent:userInfo:",  0LL,  0LL);
    v6->_progress = v7;
    -[NSProgress set_adoptChildUserInfo:](v7, "set_adoptChildUserInfo:", 1LL);
    -[NSProgress setTotalUnitCount:](v6->_progress, "setTotalUnitCount:", 1LL);
    -[NSProgress setUserInfoObject:forKey:]( v6->_progress,  "setUserInfoObject:forKey:",  @"NSProgressFileOperationKindDownloading",  @"NSProgressFileOperationKindKey");
    v6->_fetchState = 0LL;
  }

  return v6;
}

- (void)dealloc
{
  uint64_t v9 = *MEMORY[0x1895F89C0];
  int64_t fetchState = self->_fetchState;
  if ((unint64_t)(fetchState - 3) < 2)
  {
    -[NSBundleResourceRequest endAccessingResources](self, "endAccessingResources");
LABEL_4:

    v8.receiver = self;
    v8.super_class = (Class)&OBJC_CLASS___NSBundleResourceRequest;
    -[NSBundleResourceRequest dealloc](&v8, sel_dealloc);
    return;
  }

  if (fetchState != 2) {
    goto LABEL_4;
  }
  objc_exception_throw((id)[MEMORY[0x189603F70] exceptionWithName:*MEMORY[0x189603A58] reason:@"There appears to have been an overrelease of the NSBundleResourceRequest object" userInfo:0]);
  +[NSBundleResourceRequest _assetPackBundleForBundle:withAssetPackID:](v4, v5, v6, v7);
}

+ (id)_assetPackBundleForBundle:(id)a3 withAssetPackID:(id)a4
{
  id v6 = +[_NSBundleODRDataForApplications dataForBundle:createIfRequired:]( (uint64_t)&OBJC_CLASS____NSBundleODRDataForApplications,  (uint64_t)a3,  0);
  if (v6)
  {
    id v7 = v6;
    -[NSLock lock](v6->super._lock, "lock");
    uint64_t v8 = -[NSMutableDictionary objectForKey:](v7->super._assetPackToURL, "objectForKey:", a4);
    -[NSLock unlock](v7->super._lock, "unlock");
    if (v8) {
      return +[NSBundle bundleWithURL:](&OBJC_CLASS___NSBundle, "bundleWithURL:", v8);
    }
  }

  uint64_t v9 = +[_NSBundleODRDataForExtensions dataForBundle:createIfRequired:]( (uint64_t)&OBJC_CLASS____NSBundleODRDataForExtensions,  (uint64_t)a3,  0);
  if (v9
    && (uint64_t v10 = v9,
        -[NSLock lock](v9->super._lock, "lock"),
        uint64_t v8 = -[NSMutableDictionary objectForKey:](v10->super._assetPackToURL, "objectForKey:", a4),
        -[NSLock unlock](v10->super._lock, "unlock"),
        v8))
  {
    return +[NSBundle bundleWithURL:](&OBJC_CLASS___NSBundle, "bundleWithURL:", v8);
  }

  else
  {
    return 0LL;
  }

+ (id)_manifestWithBundle:(id)a3 error:(id *)a4
{
  v15[1] = *MEMORY[0x1895F89C0];
  if (!a3) {
    objc_exception_throw((id)[MEMORY[0x189603F70] exceptionWithName:*MEMORY[0x189603A60] reason:@"The bundle was nil" userInfo:0]);
  }
  uint64_t v5 = [a3 URLForResource:@"OnDemandResources.plist" withExtension:0];
  if (!v5)
  {
    if (a4)
    {
      uint64_t v8 = 100LL;
      uint64_t v9 = 0LL;
LABEL_13:
      id v6 = 0LL;
      *a4 = +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"_NSBundleResourceRequestErrorDomain",  v8,  v9);
      return v6;
    }

    return 0LL;
  }

  if (![MEMORY[0x189603F48] dataWithContentsOfURL:v5 options:0 error:v15])
  {
    if (a4)
    {
      uint64_t v9 = [MEMORY[0x189603F68] dictionaryWithObject:v15[0] forKey:@"NSUnderlyingError"];
      uint64_t v8 = 101LL;
      goto LABEL_13;
    }

    return 0LL;
  }

  v13[5] = 0LL;
  id v14 = 0LL;
  [MEMORY[0x189604010] setWithObject:@"NSBundleResourceRequestTags"];
  if ((_CFPropertyListCreateFiltered() & 1) == 0) {
    return 0LL;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    if (a4)
    {
      uint64_t v10 = (void *)MEMORY[0x189603F68];
      v11 = @"Manifest is not a dictionary";
LABEL_18:
      *a4 = +[NSError errorWithDomain:code:userInfo:]( NSError,  "errorWithDomain:code:userInfo:",  @"_NSBundleResourceRequestErrorDomain",  101,  [v10 dictionaryWithObject:v11 forKey:@"NSDebugDescription"]);
    }

uint64_t __53__NSBundleResourceRequest__manifestWithBundle_error___block_invoke( uint64_t a1,  uint64_t a2,  void *a3)
{
  uint64_t v5 = [a3 objectForKey:@"NSAssetPacks"];
  if (!v5) {
    uint64_t v5 = [MEMORY[0x189603F18] array];
  }
  return [*(id *)(a1 + 32) setObject:v5 forKey:a2];
}

- (NSProgress)progress
{
  return self->_progress;
}

- (double)loadingPriority
{
  return self->_priority;
}

- (void)setLoadingPriority:(double)loadingPriority
{
  if (self->_priority != loadingPriority)
  {
    double v3 = 1.0;
    if (loadingPriority == 1.79769313e308 || loadingPriority <= 1.0) {
      double v3 = loadingPriority;
    }
    BOOL v5 = loadingPriority < 0.0;
    double v6 = 0.0;
    if (!v5) {
      double v6 = v3;
    }
    self->_priority = v6;
    if (self->_fetchState == 2) {
      objc_msgSend( (id)objc_msgSend( +[NSBundleResourceRequest _connection](NSBundleResourceRequest, "_connection"),  "remoteObjectProxy"),  "setLoadingPriority:forTags:inBundle:",  self->_tags,  -[NSBundle bundleURL](self->_bundle, "bundleURL"),  self->_priority);
    }
  }

- (NSSet)tags
{
  return (NSSet *)(id)-[NSSet copy](self->_tags, "copy");
}

- (NSBundle)bundle
{
  return self->_bundle;
}

- (void)beginAccessingResourcesWithCompletionHandler:(void *)completionHandler
{
  uint64_t v28 = *MEMORY[0x1895F89C0];
  p_int64_t fetchState = &self->_fetchState;
  do
  {
    if (__ldxr((unint64_t *)p_fetchState))
    {
      __clrex();
      objc_exception_throw((id)[MEMORY[0x189603F70] exceptionWithName:*MEMORY[0x189603A60], +[NSString stringWithFormat:]( NSString, "stringWithFormat:", @"beginAccessingResources was called more than once or at the wrong time (%ld)", *p_fetchState), 0 reason userInfo]);
    }
  }

  while (__stxr(2uLL, (unint64_t *)p_fetchState));
  if (qword_18C497F90 != -1) {
    dispatch_once(&qword_18C497F90, &__block_literal_global_300);
  }
  id v7 = (os_log_s *)qword_18C497F88;
  if (os_log_type_enabled((os_log_t)qword_18C497F88, OS_LOG_TYPE_DEBUG))
  {
    bundle = self->_bundle;
    v19 = -[NSArray componentsJoinedByString:]( -[NSSet allObjects](self->_tags, "allObjects"),  "componentsJoinedByString:",  @",");
    *(_DWORD *)buf = 134218498;
    v23 = self;
    __int16 v24 = 2048;
    v25 = bundle;
    __int16 v26 = 2114;
    v27 = v19;
    _os_log_debug_impl( &dword_182EB1000,  v7,  OS_LOG_TYPE_DEBUG,  "Begin: Request 0x%p / Bundle 0x%p / Tags: \"%{public}@\"",  buf,  0x20u);
  }

  uint64_t v8 = +[_NSBundleODRDataForApplications dataForBundle:createIfRequired:]( (uint64_t)&OBJC_CLASS____NSBundleODRDataForApplications,  (uint64_t)self->_bundle,  1);
  id v9 = +[NSBundleResourceRequest _connection](&OBJC_CLASS___NSBundleResourceRequest, "_connection");
  if (v8)
  {
    initialStateGroup = (dispatch_group_s *)v8->_initialStateGroup;
    dispatch_time_t v11 = dispatch_time(0LL, 3000000000LL);
    dispatch_group_wait(initialStateGroup, v11);
  }

  v12 = +[NSProgress progressWithTotalUnitCount:parent:pendingUnitCount:]( &OBJC_CLASS___NSProgress,  "progressWithTotalUnitCount:parent:pendingUnitCount:",  1LL,  self->_progress,  1LL);
  -[NSProgress set_adoptChildUserInfo:](v12, "set_adoptChildUserInfo:", 1LL);
  -[NSProgress becomeCurrentWithPendingUnitCount:](v12, "becomeCurrentWithPendingUnitCount:", 1LL);
  uint64_t v13 = MEMORY[0x1895F87A8];
  v21[0] = MEMORY[0x1895F87A8];
  v21[1] = 3221225472LL;
  v21[2] = __72__NSBundleResourceRequest_beginAccessingResourcesWithCompletionHandler___block_invoke;
  v21[3] = &unk_189CA0D60;
  v21[4] = self;
  v21[5] = completionHandler;
  id v14 = (void *)[v9 remoteObjectProxyWithErrorHandler:v21];
  tags = self->_tags;
  v16 = -[NSBundle bundleURL](self->_bundle, "bundleURL");
  double priority = self->_priority;
  v20[0] = v13;
  v20[1] = 3221225472LL;
  v20[2] = __72__NSBundleResourceRequest_beginAccessingResourcesWithCompletionHandler___block_invoke_242;
  v20[3] = &unk_189CA0D88;
  v20[4] = v8;
  v20[5] = self;
  v20[6] = completionHandler;
  [v14 pinTags:tags inBundle:v16 priority:v20 completionHandler:priority];
  -[NSProgress resignCurrent](v12, "resignCurrent");
}

uint64_t __72__NSBundleResourceRequest_beginAccessingResourcesWithCompletionHandler___block_invoke( uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x1895F89C0];
  v2 = (unint64_t *)(*(void *)(a1 + 32) + 40LL);
  while (1)
  {
    unint64_t v3 = __ldxr(v2);
    if (v3 != 2) {
      break;
    }
    if (!__stxr(4uLL, v2)) {
      return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16LL))();
    }
  }

  __clrex();
  if (qword_18C497F90 != -1) {
    dispatch_once(&qword_18C497F90, &__block_literal_global_300);
  }
  id v4 = (os_log_s *)qword_18C497F88;
  if (os_log_type_enabled((os_log_t)qword_18C497F88, OS_LOG_TYPE_ERROR))
  {
    uint64_t v6 = *(void *)(*(void *)(a1 + 32) + 40LL);
    int v7 = 134217984;
    uint64_t v8 = v6;
    _os_log_error_impl( &dword_182EB1000,  v4,  OS_LOG_TYPE_ERROR,  "Unexpected state upon completion of beginAccessingResourcesWithCompletionHandler (error handler) (%lld)",  (uint8_t *)&v7,  0xCu);
  }

  *(void *)(*(void *)(a1 + 32) + 40LL) = 4LL;
  return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16LL))();
}

uint64_t __72__NSBundleResourceRequest_beginAccessingResourcesWithCompletionHandler___block_invoke_242( uint64_t a1,  void *a2,  NSError *a3)
{
  uint64_t v40 = *MEMORY[0x1895F89C0];
  uint64_t v6 = *(void *)(a1 + 32);
  if (v6)
  {
    [*(id *)(v6 + 16) lock];
    id v7 = *(id *)(v6 + 56);
    [*(id *)(v6 + 16) unlock];
    if (v7)
    {
      uint64_t v8 = (unint64_t *)(*(void *)(a1 + 40) + 40LL);
      while (1)
      {
        unint64_t v9 = __ldxr(v8);
        if (v9 != 2) {
          break;
        }
        if (!__stxr(4uLL, v8)) {
          goto LABEL_16;
        }
      }

      __clrex();
      if (qword_18C497F90 != -1) {
        dispatch_once(&qword_18C497F90, &__block_literal_global_300);
      }
      v12 = (os_log_s *)qword_18C497F88;
      if (os_log_type_enabled((os_log_t)qword_18C497F88, OS_LOG_TYPE_ERROR))
      {
        uint64_t v31 = *(void *)(*(void *)(a1 + 40) + 40LL);
        *(_DWORD *)buf = 134217984;
        *(void *)&uint8_t buf[4] = v31;
        _os_log_error_impl( &dword_182EB1000,  v12,  OS_LOG_TYPE_ERROR,  "Unexpected state upon completion of beginAccessingResourcesWithCompletionHandler (error case) (%lld)",  buf,  0xCu);
      }

      *(void *)(*(void *)(a1 + 40) + 40LL) = 4LL;
LABEL_16:
      uint64_t v13 = *(uint64_t (**)(void))(*(void *)(a1 + 48) + 16LL);
      return v13();
    }
  }

  uint64_t v10 = (unint64_t *)(*(void *)(a1 + 40) + 40LL);
  if (a3)
  {
    while (1)
    {
      unint64_t v11 = __ldxr(v10);
      if (v11 != 2) {
        break;
      }
      if (!__stxr(4uLL, v10)) {
        goto LABEL_25;
      }
    }

    __clrex();
    if (qword_18C497F90 != -1) {
      dispatch_once(&qword_18C497F90, &__block_literal_global_300);
    }
    v16 = (os_log_s *)qword_18C497F88;
    if (os_log_type_enabled((os_log_t)qword_18C497F88, OS_LOG_TYPE_ERROR))
    {
      uint64_t v35 = *(void *)(*(void *)(a1 + 40) + 40LL);
      *(_DWORD *)buf = 134217984;
      *(void *)&uint8_t buf[4] = v35;
      _os_log_error_impl( &dword_182EB1000,  v16,  OS_LOG_TYPE_ERROR,  "Unexpected state upon completion of beginAccessingResourcesWithCompletionHandler (error case) (%lld)",  buf,  0xCu);
    }

    *(void *)(*(void *)(a1 + 40) + 40LL) = 4LL;
LABEL_25:
    if (-[NSString isEqualToString:](-[NSError domain](a3, "domain"), "isEqualToString:", @"NSCocoaErrorDomain")
      && -[NSError code](a3, "code") == 3072)
    {
      if (qword_18C497F90 != -1) {
        dispatch_once(&qword_18C497F90, &__block_literal_global_300);
      }
      v17 = (os_log_s *)qword_18C497F88;
      if (os_log_type_enabled((os_log_t)qword_18C497F88, OS_LOG_TYPE_DEBUG))
      {
        uint64_t v18 = *(void *)(a1 + 40);
        *(_DWORD *)buf = 134218242;
        *(void *)&uint8_t buf[4] = v18;
        __int16 v38 = 2112;
        uint64_t v39 = (uint64_t)a3;
        _os_log_debug_impl( &dword_182EB1000,  v17,  OS_LOG_TYPE_DEBUG,  "Begin: Request 0x%p was cancelled (error: %@)",  buf,  0x16u);
      }
    }

    else
    {
      if (qword_18C497F90 != -1) {
        dispatch_once(&qword_18C497F90, &__block_literal_global_300);
      }
      v19 = (os_log_s *)qword_18C497F88;
      if (os_log_type_enabled((os_log_t)qword_18C497F88, OS_LOG_TYPE_ERROR))
      {
        uint64_t v32 = *(void *)(a1 + 40);
        *(_DWORD *)buf = 134218242;
        *(void *)&uint8_t buf[4] = v32;
        __int16 v38 = 2112;
        uint64_t v39 = (uint64_t)a3;
        _os_log_error_impl( &dword_182EB1000,  v19,  OS_LOG_TYPE_ERROR,  "Begin: Request 0x%p response: Error: %@",  buf,  0x16u);
      }
    }

    if (-[NSString isEqualToString:]( -[NSError domain](a3, "domain"),  "isEqualToString:",  @"_NSBundleResourceRequestErrorDomain")
      && -[NSError code](a3, "code") == 101)
    {
      v20 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"At least one of the set of tags was not found in your application: %@",  *(void *)(*(void *)(a1 + 40) + 8LL));
      a3 = +[NSError errorWithDomain:code:userInfo:]( NSError,  "errorWithDomain:code:userInfo:",  @"NSCocoaErrorDomain",  4994,  [MEMORY[0x189603F68] dictionaryWithObject:v20 forKey:*MEMORY[0x189604F30]]);
    }

    if (-[NSString isEqualToString:](-[NSError domain](a3, "domain"), "isEqualToString:", @"NSCocoaErrorDomain"))
    {
      if (-[NSError code](a3, "code") == 4995)
      {
        uint64_t v21 = objc_msgSend( -[NSDictionary objectForKey:]( -[NSError userInfo](a3, "userInfo"),  "objectForKey:",  @"_NSBundleResourceRequestServerBusyTimeIntervalKey"),  "integerValue");
        if (v21)
        {
          uint64_t v22 = v21;
          v23 = (void *)objc_opt_new();
          [v23 setSecond:v22];
          __int16 v24 = (void *)objc_opt_new();
          [v24 setUnitsStyle:3];
          [v24 setAllowedUnits:240];
          v25 = +[NSString localizedStringWithFormat:]( NSString,  "localizedStringWithFormat:",  [(id)_NSFoundationBundle() localizedStringForKey:@"DetailedRecoverySuggestion4995" value:@"Try again in %@." table:@"FoundationErrors"],  objc_msgSend(v24, "stringFromDateComponents:", v23));

          +[NSError errorWithDomain:code:userInfo:]( NSError,  "errorWithDomain:code:userInfo:",  @"NSCocoaErrorDomain",  4995,  [MEMORY[0x189603F68] dictionaryWithObject:v25 forKey:@"NSLocalizedRecoverySuggestion"]);
        }
      }
    }

    uint64_t v13 = *(uint64_t (**)(void))(*(void *)(a1 + 48) + 16LL);
    return v13();
  }

  while (1)
  {
    unint64_t v14 = __ldxr(v10);
    if (v14 != 2) {
      break;
    }
    if (!__stxr(3uLL, v10))
    {
      char v15 = 1;
      goto LABEL_45;
    }
  }

  char v15 = 0;
  __clrex();
LABEL_45:
  uint64_t v27 = qword_18C497F90;
  if ((v15 & 1) == 0)
  {
    if (qword_18C497F90 != -1) {
      dispatch_once(&qword_18C497F90, &__block_literal_global_300);
    }
    uint64_t v28 = (os_log_s *)qword_18C497F88;
    if (os_log_type_enabled((os_log_t)qword_18C497F88, OS_LOG_TYPE_ERROR))
    {
      uint64_t v36 = *(void *)(*(void *)(a1 + 40) + 40LL);
      *(_DWORD *)buf = 134217984;
      *(void *)&uint8_t buf[4] = v36;
      _os_log_error_impl( &dword_182EB1000,  v28,  OS_LOG_TYPE_ERROR,  "Unexpected state upon completion of beginAccessingResourcesWithCompletionHandler (success case) (%lld)",  buf,  0xCu);
      uint64_t v27 = qword_18C497F90;
    }

    else
    {
      uint64_t v27 = -1LL;
    }

    *(void *)(*(void *)(a1 + 40) + 40LL) = 3LL;
  }

  if (v27 != -1) {
    dispatch_once(&qword_18C497F90, &__block_literal_global_300);
  }
  v29 = (os_log_s *)qword_18C497F88;
  if (os_log_type_enabled((os_log_t)qword_18C497F88, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v33 = *(void *)(a1 + 40);
    uint64_t v34 = [a2 count];
    *(_DWORD *)buf = 134218240;
    *(void *)&uint8_t buf[4] = v33;
    __int16 v38 = 2048;
    uint64_t v39 = v34;
    _os_log_debug_impl( &dword_182EB1000,  v29,  OS_LOG_TYPE_DEBUG,  "Begin: Request 0x%p response: %lu packs now available",  buf,  0x16u);
  }

  *(void *)buf = 0LL;
  else {
    uint64_t v30 = *(void *)buf;
  }
  return (*(uint64_t (**)(void, uint64_t))(*(void *)(a1 + 48) + 16LL))(*(void *)(a1 + 48), v30);
}

- (void)conditionallyBeginAccessingResourcesWithCompletionHandler:(void *)completionHandler
{
  uint64_t v24 = *MEMORY[0x1895F89C0];
  BOOL v5 = +[_NSBundleODRDataForApplications dataForBundle:createIfRequired:]( (uint64_t)&OBJC_CLASS____NSBundleODRDataForApplications,  (uint64_t)self->_bundle,  1);
  p_int64_t fetchState = &self->_fetchState;
  do
  {
    if (__ldxr((unint64_t *)p_fetchState))
    {
      __clrex();
      objc_exception_throw((id)[MEMORY[0x189603F70] exceptionWithName:*MEMORY[0x189603A60], +[NSString stringWithFormat:]( NSString, "stringWithFormat:", @"beginAccessingResources was called more than once or at the wrong time (%ld)", *p_fetchState), 0 reason userInfo]);
    }
  }

  while (__stxr(1uLL, (unint64_t *)p_fetchState));
  if (qword_18C497F90 != -1) {
    dispatch_once(&qword_18C497F90, &__block_literal_global_300);
  }
  uint64_t v8 = (os_log_s *)qword_18C497F88;
  if (os_log_type_enabled((os_log_t)qword_18C497F88, OS_LOG_TYPE_DEBUG))
  {
    bundle = self->_bundle;
    char v15 = -[NSArray componentsJoinedByString:]( -[NSSet allObjects](self->_tags, "allObjects"),  "componentsJoinedByString:",  @",");
    *(_DWORD *)buf = 134218498;
    v19 = self;
    __int16 v20 = 2048;
    uint64_t v21 = bundle;
    __int16 v22 = 2114;
    v23 = v15;
    _os_log_debug_impl( &dword_182EB1000,  v8,  OS_LOG_TYPE_DEBUG,  "Begin: Request (Conditional) 0x%p / Bundle 0x%p / Tags: \"%{public}@\"",  buf,  0x20u);
  }

  id v9 = +[NSBundleResourceRequest _connection](&OBJC_CLASS___NSBundleResourceRequest, "_connection");
  uint64_t v10 = MEMORY[0x1895F87A8];
  v17[0] = MEMORY[0x1895F87A8];
  v17[1] = 3221225472LL;
  v17[2] = __85__NSBundleResourceRequest_conditionallyBeginAccessingResourcesWithCompletionHandler___block_invoke;
  v17[3] = &unk_189CA0D60;
  v17[4] = self;
  v17[5] = completionHandler;
  unint64_t v11 = (void *)[v9 remoteObjectProxyWithErrorHandler:v17];
  tags = self->_tags;
  uint64_t v13 = -[NSBundle bundleURL](self->_bundle, "bundleURL");
  v16[0] = v10;
  v16[1] = 3221225472LL;
  v16[2] = __85__NSBundleResourceRequest_conditionallyBeginAccessingResourcesWithCompletionHandler___block_invoke_253;
  v16[3] = &unk_189CA0DB0;
  v16[5] = v5;
  v16[6] = completionHandler;
  v16[4] = self;
  [v11 conditionallyPinTags:tags inBundle:v13 completionHandler:v16];
}

uint64_t __85__NSBundleResourceRequest_conditionallyBeginAccessingResourcesWithCompletionHandler___block_invoke( uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x1895F89C0];
  v2 = (unint64_t *)(*(void *)(a1 + 32) + 40LL);
  while (1)
  {
    unint64_t v3 = __ldxr(v2);
    if (v3 != 1) {
      break;
    }
    if (!__stxr(0LL, v2)) {
      return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16LL))();
    }
  }

  __clrex();
  if (qword_18C497F90 != -1) {
    dispatch_once(&qword_18C497F90, &__block_literal_global_300);
  }
  id v4 = (os_log_s *)qword_18C497F88;
  if (os_log_type_enabled((os_log_t)qword_18C497F88, OS_LOG_TYPE_ERROR))
  {
    uint64_t v6 = *(void *)(*(void *)(a1 + 32) + 40LL);
    int v7 = 134217984;
    uint64_t v8 = v6;
    _os_log_error_impl( &dword_182EB1000,  v4,  OS_LOG_TYPE_ERROR,  "Unexpected state upon completion of conditionallyBeginAccessingResourcesWithCompletionHandler (error handler) (%lld)",  (uint8_t *)&v7,  0xCu);
  }

  *(void *)(*(void *)(a1 + 32) + 40LL) = 0LL;
  return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16LL))();
}

uint64_t __85__NSBundleResourceRequest_conditionallyBeginAccessingResourcesWithCompletionHandler___block_invoke_253( uint64_t a1,  int a2,  void *a3)
{
  uint64_t v24 = *MEMORY[0x1895F89C0];
  if (qword_18C497F90 != -1) {
    dispatch_once(&qword_18C497F90, &__block_literal_global_300);
  }
  uint64_t v6 = (os_log_s *)qword_18C497F88;
  if (os_log_type_enabled((os_log_t)qword_18C497F88, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v14 = *(void *)(a1 + 32);
    if (a2) {
      uint64_t v15 = [a3 count];
    }
    else {
      uint64_t v15 = 0LL;
    }
    int v18 = 134218496;
    uint64_t v19 = v14;
    __int16 v20 = 2048;
    uint64_t v21 = v15;
    __int16 v22 = 1024;
    int v23 = a2;
    _os_log_debug_impl( &dword_182EB1000,  v6,  OS_LOG_TYPE_DEBUG,  "Begin: Request (Conditional) 0x%p response: Available %lu : %d packs",  (uint8_t *)&v18,  0x1Cu);
  }

  int v7 = (unint64_t *)(*(void *)(a1 + 32) + 40LL);
  if ((a2 & 1) != 0)
  {
    while (1)
    {
      unint64_t v8 = __ldxr(v7);
      if (v8 != 1) {
        break;
      }
      if (!__stxr(3uLL, v7)) {
        goto LABEL_16;
      }
    }

    __clrex();
    if (qword_18C497F90 != -1) {
      dispatch_once(&qword_18C497F90, &__block_literal_global_300);
    }
    uint64_t v10 = (os_log_s *)qword_18C497F88;
    if (os_log_type_enabled((os_log_t)qword_18C497F88, OS_LOG_TYPE_ERROR))
    {
      uint64_t v16 = *(void *)(*(void *)(a1 + 32) + 40LL);
      int v18 = 134217984;
      uint64_t v19 = v16;
      _os_log_error_impl( &dword_182EB1000,  v10,  OS_LOG_TYPE_ERROR,  "Unexpected state upon completion of conditionallyBeginAccessingResourcesWithCompletionHandler (available case) (%lld)",  (uint8_t *)&v18,  0xCu);
    }

    *(void *)(*(void *)(a1 + 32) + 40LL) = 3LL;
LABEL_16:
    [*(id *)(a1 + 40) assetPacksBecameAvailable:a3 error:0];
    unint64_t v11 = *(uint64_t (**)(void))(*(void *)(a1 + 48) + 16LL);
  }

  else
  {
    while (1)
    {
      unint64_t v9 = __ldxr(v7);
      if (v9 != 1) {
        break;
      }
      if (!__stxr(0LL, v7)) {
        goto LABEL_22;
      }
    }

    __clrex();
    if (qword_18C497F90 != -1) {
      dispatch_once(&qword_18C497F90, &__block_literal_global_300);
    }
    v12 = (os_log_s *)qword_18C497F88;
    if (os_log_type_enabled((os_log_t)qword_18C497F88, OS_LOG_TYPE_ERROR))
    {
      uint64_t v17 = *(void *)(*(void *)(a1 + 32) + 40LL);
      int v18 = 134217984;
      uint64_t v19 = v17;
      _os_log_error_impl( &dword_182EB1000,  v12,  OS_LOG_TYPE_ERROR,  "Unexpected state upon completion of conditionallyBeginAccessingResourcesWithCompletionHandler (unavailable case) (%lld)",  (uint8_t *)&v18,  0xCu);
    }

    *(void *)(*(void *)(a1 + 32) + 40LL) = 0LL;
LABEL_22:
    unint64_t v11 = *(uint64_t (**)(void))(*(void *)(a1 + 48) + 16LL);
  }

  return v11();
}

- (void)endAccessingResources
{
  uint64_t v23 = *MEMORY[0x1895F89C0];
  if (qword_18C497F90 != -1) {
    dispatch_once(&qword_18C497F90, &__block_literal_global_300);
  }
  unint64_t v3 = (os_log_s *)qword_18C497F88;
  if (os_log_type_enabled((os_log_t)qword_18C497F88, OS_LOG_TYPE_DEBUG))
  {
    LODWORD(buf) = 134217984;
    *(void *)((char *)&buf + 4) = self;
    _os_log_debug_impl(&dword_182EB1000, v3, OS_LOG_TYPE_DEBUG, "End: Request 0x%p", (uint8_t *)&buf, 0xCu);
  }

  p_int64_t fetchState = &self->_fetchState;
  while (1)
  {
    unint64_t v5 = __ldxr((unint64_t *)p_fetchState);
    if (v5 != 3) {
      break;
    }
    if (!__stxr(5uLL, (unint64_t *)p_fetchState))
    {
      tags = self->_tags;
      bundle = self->_bundle;
      unint64_t v8 = tags;
      unint64_t v9 = bundle;
      uint64_t v10 = +[_NSBundleODRDataForApplications dataForBundle:createIfRequired:]( (uint64_t)&OBJC_CLASS____NSBundleODRDataForApplications,  (uint64_t)bundle,  1);
      id v11 = +[NSBundleResourceRequest _connection](&OBJC_CLASS___NSBundleResourceRequest, "_connection");
      uint64_t v12 = MEMORY[0x1895F87A8];
      v15[0] = MEMORY[0x1895F87A8];
      v15[1] = 3221225472LL;
      void v15[2] = ___endAccessingResources_block_invoke;
      v15[3] = &unk_189CA0E48;
      v15[4] = tags;
      v15[5] = bundle;
      uint64_t v13 = (void *)[v11 remoteObjectProxyWithErrorHandler:v15];
      uint64_t v14 = -[NSBundle bundleURL](bundle, "bundleURL");
      *(void *)&__int128 buf = v12;
      *((void *)&buf + 1) = 3221225472LL;
      uint64_t v17 = ___endAccessingResources_block_invoke_2;
      int v18 = &unk_189CA0E70;
      uint64_t v19 = v10;
      id v20 = v11;
      uint64_t v21 = tags;
      __int16 v22 = bundle;
      [v13 unpinTags:tags inBundle:v14 completionHandler:&buf];
      return;
    }
  }

  __clrex();
}

+ (id)_extensionEndpoint
{
  return 0LL;
}

+ (id)_extensionEndpointForMainBundleOfHostApplication:(id)a3
{
  v4[5] = *MEMORY[0x1895F89C0];
  v4[0] = MEMORY[0x1895F87A8];
  v4[1] = 3221225472LL;
  v4[2] = __123__NSBundleResourceRequest__NSBundleResourceRequestAppExtensionAdditions___extensionEndpointForMainBundleOfHostApplication___block_invoke;
  v4[3] = &unk_189C9A030;
  v4[4] = a3;
  if (qword_18C497F80 != -1) {
    dispatch_once(&qword_18C497F80, v4);
  }
  return (id)[(id)qword_18C497F70 endpoint];
}

uint64_t __123__NSBundleResourceRequest__NSBundleResourceRequestAppExtensionAdditions___extensionEndpointForMainBundleOfHostApplication___block_invoke( uint64_t a1)
{
  qword_18C497F70 = +[NSXPCListener anonymousListener](&OBJC_CLASS___NSXPCListener, "anonymousListener");
  qword_18C497F78 = (uint64_t)+[_NSBundleODRDataForExtensions dataForBundle:createIfRequired:]( (uint64_t)&OBJC_CLASS____NSBundleODRDataForExtensions,  *(void *)(a1 + 32),  1);
  [(id)qword_18C497F70 setDelegate:qword_18C497F78];
  return [(id)qword_18C497F70 resume];
}

+ (void)_addExtensionEndpoint:(id)a3
{
  v9[6] = *MEMORY[0x1895F89C0];
  id v4 = +[_NSBundleODRDataForApplications dataForBundle:createIfRequired:]( (uint64_t)&OBJC_CLASS____NSBundleODRDataForApplications,  (uint64_t)+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"),  1);
  if (v4)
  {
    unint64_t v5 = v4;
    uint64_t v6 = -[NSXPCConnection initWithListenerEndpoint:]( objc_alloc(&OBJC_CLASS___NSXPCConnection),  "initWithListenerEndpoint:",  a3);
    -[NSXPCConnection setRemoteObjectInterface:](v6, "setRemoteObjectInterface:", _appExtensionInterface());
    v9[0] = MEMORY[0x1895F87A8];
    v9[1] = 3221225472LL;
    v9[2] = __56___NSBundleODRDataForApplications_addExtensionEndpoint___block_invoke;
    v9[3] = &unk_189C991F0;
    v9[4] = v5;
    v9[5] = v6;
    -[NSXPCConnection setInvalidationHandler:](v6, "setInvalidationHandler:", v9);
    -[NSXPCConnection resume](v6, "resume");
    -[NSLock lock](v5->super._lock, "lock");
    extensionConnections = v5->_extensionConnections;
    if (!extensionConnections)
    {
      extensionConnections = (NSMutableSet *)objc_alloc_init(MEMORY[0x189603FE0]);
      v5->_extensionConnections = extensionConnections;
    }

    -[NSMutableSet addObject:](extensionConnections, "addObject:", v6);
    rootSandboxPath = v5->_rootSandboxPath;
    if (rootSandboxPath)
    {
      -[NSString UTF8String](rootSandboxPath, "UTF8String");
      objc_msgSend( -[NSXPCConnection remoteObjectProxy](v6, "remoteObjectProxy"),  "accessSandboxExtension:",  +[NSString stringWithUTF8String:]( NSString,  "stringWithUTF8String:",  sandbox_extension_issue_file()));
    }

    -[NSLock unlock](v5->super._lock, "unlock");
  }

@end