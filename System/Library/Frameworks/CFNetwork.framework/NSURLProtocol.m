@interface NSURLProtocol
+ (BOOL)canInitWithRequest:(NSURLRequest *)request;
+ (BOOL)canInitWithTask:(NSURLSessionTask *)task;
+ (BOOL)registerClass:(Class)protocolClass;
+ (BOOL)requestIsCacheEquivalent:(NSURLRequest *)a toRequest:(NSURLRequest *)b;
+ (Class)_protocolClassForRequest:(id)a3;
+ (Class)_protocolClassForRequest:(id)a3 skipAppSSO:(BOOL)a4;
+ (NSURLRequest)canonicalRequestForRequest:(NSURLRequest *)request;
+ (id)_makeRequestCanonicalByMakingRequestURLCanonical:(id)a3;
+ (id)canonicalRequestForRequest:(id)a3 task:(id)a4;
+ (id)propertyForKey:(NSString *)key inRequest:(NSURLRequest *)request;
+ (void)removePropertyForKey:(NSString *)key inRequest:(NSMutableURLRequest *)request;
+ (void)setProperty:(id)value forKey:(NSString *)key inRequest:(NSMutableURLRequest *)request;
+ (void)unregisterClass:(Class)protocolClass;
- (NSCachedURLResponse)cachedResponse;
- (NSURLProtocol)init;
- (NSURLProtocol)initWithRequest:(NSURLRequest *)request cachedResponse:(NSCachedURLResponse *)cachedResponse client:(id)client;
- (NSURLProtocol)initWithTask:(NSURLSessionTask *)task cachedResponse:(NSCachedURLResponse *)cachedResponse client:(id)client;
- (NSURLRequest)request;
- (NSURLSessionTask)task;
- (id)client;
- (void)dealloc;
- (void)startLoading;
- (void)stopLoading;
@end

@implementation NSURLProtocol

- (NSURLProtocol)init
{
  return -[NSURLProtocol initWithRequest:cachedResponse:client:]( self,  "initWithRequest:cachedResponse:client:",  +[NSURLRequest requestWithURL:](&OBJC_CLASS___NSURLRequest, "requestWithURL:", 0LL),  0LL,  0LL);
}

- (NSURLProtocol)initWithRequest:(NSURLRequest *)request cachedResponse:(NSCachedURLResponse *)cachedResponse client:(id)client
{
  v10.receiver = self;
  v10.super_class = (Class)&OBJC_CLASS___NSURLProtocol;
  v8 = -[NSURLProtocol init](&v10, sel_init);
  if (v8) {
    v8->_internal = (NSURLProtocolInternal *)-[NSURLProtocolInternal initWithRequest:cachedResponse:client:]( objc_alloc(&OBJC_CLASS___NSURLProtocolInternal),  request,  cachedResponse,  client);
  }
  return v8;
}

- (id)client
{
  internal = self->_internal;
  else {
    return 0LL;
  }
}

- (NSURLRequest)request
{
  internal = self->_internal;
  else {
    return 0LL;
  }
}

- (NSCachedURLResponse)cachedResponse
{
  internal = self->_internal;
  else {
    return 0LL;
  }
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___NSURLProtocol;
  -[NSURLProtocol dealloc](&v3, sel_dealloc);
}

- (void)startLoading
{
  v4 = (objc_class *)objc_opt_class();
  NSRequestConcreteImplementation((uint64_t)self, a2, v4);
}

- (void)stopLoading
{
  v4 = (objc_class *)objc_opt_class();
  NSRequestConcreteImplementation((uint64_t)self, a2, v4);
}

- (NSURLProtocol)initWithTask:(NSURLSessionTask *)task cachedResponse:(NSCachedURLResponse *)cachedResponse client:(id)client
{
  if (self->_inInitWithTask)
  {
    v11.receiver = self;
    v11.super_class = (Class)&OBJC_CLASS___NSURLProtocol;
    v9 = -[NSURLProtocol init](&v11, sel_init);
    if (v9) {
      v9->_internal = (NSURLProtocolInternal *)-[NSURLProtocolInternal initWithRequest:cachedResponse:client:]( objc_alloc(&OBJC_CLASS___NSURLProtocolInternal),  -[NSURLSessionTask currentRequest](task, "currentRequest"),  cachedResponse,  client);
    }
    return v9;
  }

  else
  {
    self->_task = task;
    self->_inInitWithTask = 1;
    return -[NSURLProtocol initWithRequest:cachedResponse:client:]( self,  "initWithRequest:cachedResponse:client:",  -[NSURLSessionTask currentRequest](task, "currentRequest"),  cachedResponse,  client);
  }

- (NSURLSessionTask)task
{
  return self->_task;
}

+ (BOOL)canInitWithRequest:(NSURLRequest *)request
{
  v5 = (objc_class *)objc_opt_class();
  NSRequestConcreteImplementation((uint64_t)a1, a2, v5);
  return 0;
}

+ (NSURLRequest)canonicalRequestForRequest:(NSURLRequest *)request
{
  if ((id)objc_opt_self() == a1)
  {
    v6 = (void *)[a1 _protocolClassForRequest:request];
    if (v6) {
      return (NSURLRequest *)[v6 canonicalRequestForRequest:request];
    }
  }

  else
  {
    v8 = (objc_class *)objc_opt_class();
    NSRequestConcreteImplementation((uint64_t)a1, a2, v8);
  }

  return request;
}

+ (id)canonicalRequestForRequest:(id)a3 task:(id)a4
{
  if ((id)objc_opt_self() != a1) {
    return (id)[a1 canonicalRequestForRequest:a3];
  }
  uint64_t v8 = [a4 session];
  if (v8 && (v9 = -[__NSURLSessionLocal _protocolClassForTask:skipAppSSO:](v8, a4)) != 0LL) {
    return (id)[v9 canonicalRequestForRequest:a3 task:a4];
  }
  else {
    return a3;
  }
}

+ (BOOL)requestIsCacheEquivalent:(NSURLRequest *)a toRequest:(NSURLRequest *)b
{
  if (!a && os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_FAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_fault_impl(&dword_18298D000, MEMORY[0x1895F8DA0], OS_LOG_TYPE_FAULT, "assertion failure", buf, 2u);
    if (b) {
      goto LABEL_6;
    }
  }

  else if (b)
  {
    goto LABEL_6;
  }

  if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_FAULT))
  {
    *(_WORD *)uint64_t v8 = 0;
    _os_log_fault_impl(&dword_18298D000, MEMORY[0x1895F8DA0], OS_LOG_TYPE_FAULT, "assertion failure", v8, 2u);
  }

+ (BOOL)registerClass:(Class)protocolClass
{
  uint64_t v4 = -[objc_class superclass](protocolClass, "superclass");
  if (v4)
  {
    v5 = (void *)v4;
    while (v5 != (void *)objc_opt_self())
    {
      uint64_t v4 = [v5 superclass];
      v5 = (void *)v4;
      if (!v4) {
        return v4;
      }
    }

    os_unfair_lock_lock((os_unfair_lock_t)&_localProtocolClassesForDefaultSessionLock);
    if (_localProtocolClassesForDefaultSession) {
      [(id)_localProtocolClassesForDefaultSession insertObject:protocolClass atIndex:0];
    }
    else {
      _localProtocolClassesForDefaultSession = (uint64_t)(id)[MEMORY[0x189603FA8] arrayWithObject:protocolClass];
    }
    os_unfair_lock_unlock((os_unfair_lock_t)&_localProtocolClassesForDefaultSessionLock);
    LOBYTE(v4) = 1;
  }

  return v4;
}

+ (void)unregisterClass:(Class)protocolClass
{
  if (_localProtocolClassesForDefaultSession)
  {
    [(id)_localProtocolClassesForDefaultSession removeObject:protocolClass];
    if (![(id)_localProtocolClassesForDefaultSession count])
    {

      _localProtocolClassesForDefaultSession = 0LL;
    }
  }

  os_unfair_lock_unlock((os_unfair_lock_t)&_localProtocolClassesForDefaultSessionLock);
}

+ (id)propertyForKey:(NSString *)key inRequest:(NSURLRequest *)request
{
  if (!key && os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_FAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_fault_impl(&dword_18298D000, MEMORY[0x1895F8DA0], OS_LOG_TYPE_FAULT, "assertion failure", buf, 2u);
    if (request) {
      return -[NSURLRequest _propertyForKey:](request, "_propertyForKey:", key);
    }
  }

  else if (request)
  {
    return -[NSURLRequest _propertyForKey:](request, "_propertyForKey:", key);
  }

  if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_FAULT))
  {
    *(_WORD *)v7 = 0;
    _os_log_fault_impl(&dword_18298D000, MEMORY[0x1895F8DA0], OS_LOG_TYPE_FAULT, "assertion failure", v7, 2u);
  }

  return -[NSURLRequest _propertyForKey:](request, "_propertyForKey:", key);
}

+ (void)setProperty:(id)value forKey:(NSString *)key inRequest:(NSMutableURLRequest *)request
{
  if (!key && os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_FAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_fault_impl(&dword_18298D000, MEMORY[0x1895F8DA0], OS_LOG_TYPE_FAULT, "assertion failure", buf, 2u);
    if (request) {
      goto LABEL_6;
    }
  }

  else if (request)
  {
    goto LABEL_6;
  }

  if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_FAULT))
  {
    *(_WORD *)uint64_t v8 = 0;
    _os_log_fault_impl(&dword_18298D000, MEMORY[0x1895F8DA0], OS_LOG_TYPE_FAULT, "assertion failure", v8, 2u);
  }

+ (void)removePropertyForKey:(NSString *)key inRequest:(NSMutableURLRequest *)request
{
  if (!key && os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_FAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_fault_impl(&dword_18298D000, MEMORY[0x1895F8DA0], OS_LOG_TYPE_FAULT, "assertion failure", buf, 2u);
    if (request) {
      goto LABEL_6;
    }
  }

  else if (request)
  {
    goto LABEL_6;
  }

  if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_FAULT))
  {
    *(_WORD *)uint64_t v6 = 0;
    _os_log_fault_impl(&dword_18298D000, MEMORY[0x1895F8DA0], OS_LOG_TYPE_FAULT, "assertion failure", v6, 2u);
  }

+ (BOOL)canInitWithTask:(NSURLSessionTask *)task
{
  return objc_msgSend(a1, "canInitWithRequest:", -[NSURLSessionTask currentRequest](task, "currentRequest"));
}

+ (Class)_protocolClassForRequest:(id)a3
{
  return +[NSURLProtocol _protocolClassForRequest:skipAppSSO:]( &OBJC_CLASS___NSURLProtocol,  "_protocolClassForRequest:skipAppSSO:",  a3,  0LL);
}

+ (Class)_protocolClassForRequest:(id)a3 skipAppSSO:(BOOL)a4
{
  v5 = (void *)+[NSURLSession _sharedSessionForConnection]();
  uint64_t v6 = -[NSURLSessionTask initWithOriginalRequest:ident:taskGroup:]( [NSURLSessionTask alloc],  "initWithOriginalRequest:ident:taskGroup:",  a3,  0,  [v5 defaultTaskGroup]);
  v7 = (objc_class *)-[__NSURLSessionLocal _protocolClassForTask:skipAppSSO:]((uint64_t)v5, v6);

  return v7;
}

+ (id)_makeRequestCanonicalByMakingRequestURLCanonical:(id)a3
{
  return a3;
}

@end