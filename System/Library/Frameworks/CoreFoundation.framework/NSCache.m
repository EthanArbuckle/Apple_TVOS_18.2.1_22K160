@interface NSCache
- (BOOL)evictsObjectsWhenApplicationEntersBackground;
- (BOOL)evictsObjectsWithDiscardedContent;
- (NSCache)init;
- (NSString)name;
- (NSUInteger)countLimit;
- (NSUInteger)totalCostLimit;
- (id)allObjects;
- (id)delegate;
- (id)objectForKey:(id)key;
- (unint64_t)minimumObjectCount;
- (void)__apply:(id)a3;
- (void)dealloc;
- (void)removeAllObjects;
- (void)removeObjectForKey:(id)key;
- (void)setCountLimit:(NSUInteger)countLimit;
- (void)setDelegate:(id)delegate;
- (void)setEvictsObjectsWhenApplicationEntersBackground:(BOOL)a3;
- (void)setEvictsObjectsWithDiscardedContent:(BOOL)evictsObjectsWithDiscardedContent;
- (void)setMinimumObjectCount:(unint64_t)a3;
- (void)setName:(NSString *)name;
- (void)setObject:(id)obj forKey:(id)key;
- (void)setObject:(id)obj forKey:(id)key cost:(NSUInteger)g;
- (void)setTotalCostLimit:(NSUInteger)totalCostLimit;
@end

@implementation NSCache

- (NSCache)init
{
  v2 = self;
  uint64_t v6 = *MEMORY[0x1895F89C0];
  attrs.version = 2;
  attrs.key_hash_cb = (cache_key_hash_cb_t)__NSCacheKeyHash;
  attrs.key_is_equal_cb = (cache_key_is_equal_cb_t)__NSCacheKeyEqual;
  attrs.key_retain_cb = (cache_key_retain_cb_t)__NSCacheKeyRetain;
  attrs.key_release_cb = (cache_release_cb_t)__NSCacheKeyRelease;
  attrs.value_release_cb = (cache_release_cb_t)__NSCacheValueRelease;
  attrs.value_make_nonpurgeable_cb = 0LL;
  attrs.value_make_purgeable_cb = 0LL;
  attrs.user_data = self;
  attrs.value_retain_cb = (cache_value_retain_cb_t)__NSCacheValueRetain;
  v4 = 0LL;
  if (cache_create("", &attrs, &v4))
  {

    return 0LL;
  }

  else
  {
    v2->_cache = v4;
    v2->_evictsDiscarded = 1;
    -[NSCache setEvictsObjectsWhenApplicationEntersBackground:]( v2,  "setEvictsObjectsWhenApplicationEntersBackground:",  1LL);
  }

  return v2;
}

- (void)dealloc
{
  uint64_t v6 = *MEMORY[0x1895F89C0];
  LocalCenter = CFNotificationCenterGetLocalCenter();
  CFNotificationCenterRemoveObserver(LocalCenter, self, @"UIApplicationDidEnterBackgroundNotification", 0LL);
  self->_moribund = 1;
  cache = self->_cache;
  if (cache)
  {
    cache_remove_all(cache);
    while (cache_destroy(self->_cache) == 35)
      sleep(1u);
  }

  self->_cache = 0LL;
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___NSCache;
  -[NSCache dealloc](&v5, sel_dealloc);
}

- (void)setName:(NSString *)name
{
  maxBufLen[1] = *MEMORY[0x1895F89C0];
  if (name) {
    v3 = (const __CFString *)name;
  }
  else {
    v3 = &stru_1899EF170;
  }
  maxBufLen[0] = 0LL;
  v6.length = CFStringGetLength(v3);
  v6.location = 0LL;
  CFStringGetBytes(v3, v6, 0x8000100u, 0, 0, 0LL, 0LL, maxBufLen);
  v4 = (UInt8 *)malloc(maxBufLen[0] + 1);
  v7.length = CFStringGetLength(v3);
  v7.location = 0LL;
  CFStringGetBytes(v3, v7, 0x8000100u, 0, 0, v4, maxBufLen[0], 0LL);
  v4[maxBufLen[0]] = 0;
  cache_set_name();
  free(v4);
}

- (NSString)name
{
  name = (const char *)cache_get_name();
  CFStringCreateWithCString((CFAllocatorRef)&__kCFAllocatorSystemDefault, name, 0x8000100u);
  return (NSString *)_CFAutoreleasePoolAddObject();
}

- (void)setDelegate:(id)delegate
{
  self->_cacheDelegate = (NSCacheDelegate *)delegate;
  int v4 = [delegate conformsToProtocol:&unk_18C5457A0];
  if (v4) {
    LOBYTE(v4) = objc_opt_respondsToSelector();
  }
  self->_doDelegateWillEvictValue = v4 & 1;
}

- (id)delegate
{
  return self->_cacheDelegate;
}

- (id)objectForKey:(id)key
{
  uint64_t v12 = *MEMORY[0x1895F89C0];
  uint64_t v6 = 0LL;
  CFRange v7 = &v6;
  uint64_t v8 = 0x3052000000LL;
  v9 = __Block_byref_object_copy__3;
  v10 = __Block_byref_object_dispose__3;
  uint64_t v11 = 0LL;
  if (key)
  {
    cache_get();
    v3 = (void *)v7[5];
  }

  else
  {
    v3 = 0LL;
  }

  id v4 = v3;
  _Block_object_dispose(&v6, 8);
  return v4;
}

void __24__NSCache_objectForKey___block_invoke(uint64_t a1, id a2, _BYTE *a3)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 40LL) = a2;
  if ([*(id *)(a1 + 32) evictsObjectsWithDiscardedContent])
  {
    int v5 = *(unsigned __int8 *)(*(void *)(a1 + 32) + 24LL);
    if (v5 == 255
      || v5 == 2
      && (objc_opt_respondsToSelector() & 1) != 0
      && (objc_opt_respondsToSelector() & 1) != 0
      && (objc_opt_respondsToSelector() & 1) != 0
      && (objc_opt_respondsToSelector() & 1) != 0)
    {
      if ([*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) isContentDiscarded])
      {

        *(void *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 40LL) = 0LL;
        *a3 = 1;
      }
    }
  }

- (void)setObject:(id)obj forKey:(id)key
{
}

- (void)setObject:(id)obj forKey:(id)key cost:(NSUInteger)g
{
  if (key)
  {
    if (!obj)
    {
      uint64_t v12 = __CFExceptionProem((objc_class *)self, a2);
      CFStringCreateWithFormat( (CFAllocatorRef)&__kCFAllocatorSystemDefault,  0LL,  @"%@: attempt to insert nil value (key: %@)",  v12,  key);
      v13 = +[NSException exceptionWithName:reason:userInfo:]( &OBJC_CLASS___NSException,  "exceptionWithName:reason:userInfo:",  @"NSInvalidArgumentException",  _CFAutoreleasePoolAddObject(),  0LL);
      objc_exception_throw(v13);
      -[NSCache removeObjectForKey:](v14, v15, v16);
      return;
    }

    int discardableContentState = self->_discardableContentState;
    if (self->_evictsDiscarded)
    {
      if (discardableContentState == 255)
      {
        if ((objc_opt_respondsToSelector() & 1) != 0
          && (objc_opt_respondsToSelector() & 1) != 0
          && (objc_opt_respondsToSelector() & 1) != 0
          && (objc_opt_respondsToSelector() & 1) != 0)
        {
          goto LABEL_27;
        }
      }

      else
      {
        if (discardableContentState != 1)
        {
          if (self->_discardableContentState) {
            goto LABEL_27;
          }
          if ((objc_opt_respondsToSelector() & 1) != 0
            && (objc_opt_respondsToSelector() & 1) != 0
            && (objc_opt_respondsToSelector() & 1) != 0)
          {
            if ((objc_opt_respondsToSelector() & 1) != 0) {
              unsigned __int8 v11 = -1;
            }
            else {
              unsigned __int8 v11 = 1;
            }
          }

          else
          {
            unsigned __int8 v11 = 1;
          }

          goto LABEL_26;
        }

        if ((objc_opt_respondsToSelector() & 1) == 0
          || (objc_opt_respondsToSelector() & 1) == 0
          || (objc_opt_respondsToSelector() & 1) == 0
          || (objc_opt_respondsToSelector() & 1) == 0)
        {
          goto LABEL_27;
        }
      }
    }

    else if (discardableContentState != 255)
    {
LABEL_27:
      if (!cache_set_and_retain(self->_cache, key, obj, g)) {
        cache_release_value(self->_cache, obj);
      }
      return;
    }

    unsigned __int8 v11 = 2;
LABEL_26:
    self->_int discardableContentState = v11;
    goto LABEL_27;
  }

- (void)removeObjectForKey:(id)key
{
  if (key) {
    cache_remove(self->_cache, key);
  }
}

- (void)removeAllObjects
{
}

- (void)setTotalCostLimit:(NSUInteger)totalCostLimit
{
}

- (NSUInteger)totalCostLimit
{
  return cache_get_cost_hint();
}

- (void)setCountLimit:(NSUInteger)countLimit
{
}

- (NSUInteger)countLimit
{
  return cache_get_count_hint();
}

- (void)setMinimumObjectCount:(unint64_t)a3
{
}

- (unint64_t)minimumObjectCount
{
  return cache_get_minimum_values_hint();
}

- (BOOL)evictsObjectsWithDiscardedContent
{
  return self->_evictsDiscarded;
}

- (void)setEvictsObjectsWithDiscardedContent:(BOOL)evictsObjectsWithDiscardedContent
{
  if (evictsObjectsWithDiscardedContent)
  {
    self->_int discardableContentState = 2;
    BOOL v3 = 1;
  }

  else
  {
    BOOL v3 = 0;
  }

  self->_evictsDiscarded = v3;
}

- (BOOL)evictsObjectsWhenApplicationEntersBackground
{
  return self->_evictOnSuspension;
}

- (void)setEvictsObjectsWhenApplicationEntersBackground:(BOOL)a3
{
  if (self->_evictOnSuspension != a3)
  {
    BOOL v3 = a3;
    self->_evictOnSuspension = a3;
    LocalCenter = CFNotificationCenterGetLocalCenter();
    if (v3) {
      CFNotificationCenterAddObserver( LocalCenter,  self,  (CFNotificationCallback)__NSCacheApplicationDidEnterBackgroundCallBack,  @"UIApplicationDidEnterBackgroundNotification",  0LL,  CFNotificationSuspensionBehaviorDrop);
    }
    else {
      CFNotificationCenterRemoveObserver(LocalCenter, self, @"UIApplicationDidEnterBackgroundNotification", 0LL);
    }
  }

- (id)allObjects
{
  v2 = +[NSArray array](&OBJC_CLASS___NSMutableArray, "array");
  uint64_t v4 = MEMORY[0x1895F87A8];
  cache_invoke();
  return (id)-[NSArray copy]( v2,  "copy",  v4,  3221225472LL,  __21__NSCache_allObjects__block_invoke,  &unk_1899ECAA0,  v2);
}

uint64_t __21__NSCache_allObjects__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "addObject:");
}

- (void)__apply:(id)a3
{
}

@end