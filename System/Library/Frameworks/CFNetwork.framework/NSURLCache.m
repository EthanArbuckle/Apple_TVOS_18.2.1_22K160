@interface NSURLCache
+ (NSURLCache)sharedURLCache;
- (NSUInteger)diskCapacity;
- (NSUInteger)memoryCapacity;
- (double)_maxCacheableEntrySizeRatio;
- (void)_CFURLCache;
@end

@implementation NSURLCache

+ (NSURLCache)sharedURLCache
{
  if (!sharedInstance)
  {
    if (gSharedInstance)
    {
      v2 = objc_alloc(&OBJC_CLASS___NSURLCache);
      if (v2) {
        v2 = -[NSURLCache _initWithExistingCFURLCache:](v2, "_initWithExistingCFURLCache:", gSharedInstance);
      }
    }

    else
    {
      v2 = objc_alloc_init(&OBJC_CLASS___NSURLCache);
    }

    sharedInstance = (uint64_t)v2;
    v3 = (objc_class *)objc_opt_class();
    Name = class_getName(v3);
    v5 = (objc_class *)objc_opt_self();
    v6 = class_getName(v5);
    v7 = (const void *)sharedInstance;
    if (Name == v6) {
      v7 = *(const void **)(*(void *)(sharedInstance + 8) + 24LL);
    }
    CFURLCacheSetSharedURLCache(v7);
  }

  os_unfair_lock_unlock((os_unfair_lock_t)&_gSharedCacheLock);
  return (NSURLCache *)(id)sharedInstance;
}

- (void)_CFURLCache
{
  internal = self->_internal;
  else {
    return 0LL;
  }
}

- (NSUInteger)diskCapacity
{
  internal = self->_internal;
  else {
    return 0LL;
  }
}

- (NSUInteger)memoryCapacity
{
  internal = self->_internal;
  else {
    return 0LL;
  }
}

- (double)_maxCacheableEntrySizeRatio
{
  internal = self->_internal;
  double v3 = 0.0;
  if (internal)
  {
    cacheRef = internal->_cacheRef;
    if (IsCFURLCache((BOOL)cacheRef)) {
      return *(double *)(cacheRef[2] + 200LL);
    }
  }

  return v3;
}

@end