@interface NSCachedURLResponse
- (NSCachedURLResponse)initWithResponse:(NSURLResponse *)response data:(NSData *)data userInfo:(NSDictionary *)userInfo storagePolicy:(NSURLCacheStoragePolicy)storagePolicy;
- (NSData)data;
- (NSURLResponse)response;
- (_CFCachedURLResponse)_CFCachedURLResponse;
- (id)_initWithCFCachedURLResponse:(_CFCachedURLResponse *)a3;
- (void)dealloc;
@end

@implementation NSCachedURLResponse

- (id)_initWithCFCachedURLResponse:(_CFCachedURLResponse *)a3
{
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___NSCachedURLResponse;
  v4 = -[NSCachedURLResponse init](&v8, sel_init);
  if (v4)
  {
    if (a3) {
      uint64_t v5 = *((void *)a3->var1 + 4);
    }
    else {
      uint64_t v5 = 0LL;
    }
    v4->_internal = objc_alloc_init(&OBJC_CLASS___NSCachedURLResponseInternal);
    v4->_internal->response = (NSURLResponse *) +[NSURLResponse _responseWithCFURLResponse:]( &OBJC_CLASS___NSURLResponse,  "_responseWithCFURLResponse:",  v5);
    v4->_internal->data = 0LL;
    v4->_internal->userInfo = 0LL;
    if (a3) {
      uint64_t v6 = *((int *)a3->var1 + 14);
    }
    else {
      uint64_t v6 = 2LL;
    }
    v4->_internal->storagePolicy = v6;
    v4->_internal->_cachedURLResponse = a3;
  }

  return v4;
}

- (NSURLResponse)response
{
  internal = self->_internal;
  else {
    return 0LL;
  }
}

- (NSData)data
{
  internal = self->_internal;
  v3 = (const __CFArray *)CFCachedURLResponseCopyReceiverDataArray((uint64_t)internal->_cachedURLResponse);
  if (!v3) {
    return (NSData *)[MEMORY[0x189603F48] data];
  }
  v4 = v3;
  CFIndex Count = CFArrayGetCount(v3);
  if (Count == 1)
  {
    ValueAtIndex = CFArrayGetValueAtIndex(v4, 0LL);
    CFTypeRef v7 = CFRetain(ValueAtIndex);
    objc_super v8 = (id)CFMakeCollectable(v7);
  }

  else
  {
    if (Count <= 1)
    {
      CFRelease(v4);
      return (NSData *)[MEMORY[0x189603F48] data];
    }

    CFIndex v9 = Count;
    objc_super v8 = (NSData *)[MEMORY[0x189603FB8] data];
    for (CFIndex i = 0LL; i != v9; ++i)
      -[NSData appendData:](v8, "appendData:", CFArrayGetValueAtIndex(v4, i));
  }

  CFRelease(v4);
  if (v8) {
    return v8;
  }
  return (NSData *)[MEMORY[0x189603F48] data];
}

- (void)dealloc
{
  internal = self->_internal;
  if (internal)
  {
    cachedURLResponse = internal->_cachedURLResponse;
    if (cachedURLResponse)
    {
      CFCachedURLResponseSetNSCachedURLResponse(cachedURLResponse, 0LL);

      internal = self->_internal;
    }
  }

  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___NSCachedURLResponse;
  -[NSCachedURLResponse dealloc](&v5, sel_dealloc);
}

- (NSCachedURLResponse)initWithResponse:(NSURLResponse *)response data:(NSData *)data userInfo:(NSDictionary *)userInfo storagePolicy:(NSURLCacheStoragePolicy)storagePolicy
{
  v13.receiver = self;
  v13.super_class = (Class)&OBJC_CLASS___NSCachedURLResponse;
  v10 = -[NSCachedURLResponse init](&v13, sel_init);
  if (v10)
  {
    v10->_internal = objc_alloc_init(&OBJC_CLASS___NSCachedURLResponseInternal);
    v10->_internal->response = (NSURLResponse *)-[NSURLResponse copy](response, "copy");
    v10->_internal->data = (NSData *)-[NSData copy](data, "copy");
    v10->_internal->userInfo = (NSDictionary *)-[NSDictionary copy](userInfo, "copy");
    v11 = (uint64_t *)MEMORY[0x189604DB0];
    v10->_internal->storagePolicy = storagePolicy;
    v10->_internal->_cachedURLResponse = (_CFCachedURLResponse *)CFCachedURLResponseCreateWithUserInfo( *v11,  v10->_internal->response,  v10->_internal->data,  v10->_internal->userInfo,  storagePolicy);
    CFMakeCollectable(v10->_internal->_cachedURLResponse);
  }

  return v10;
}

- (_CFCachedURLResponse)_CFCachedURLResponse
{
  internal = self->_internal;
  else {
    return 0LL;
  }
}

@end