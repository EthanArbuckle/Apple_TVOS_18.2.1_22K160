@interface LACCache
- (LACCache)initWithTimeout:(double)a3;
- (double)timeout;
- (id)_identifierForParameter:(id)a3;
- (id)cachedValueWithParameter:(id)a3;
- (void)_invalidateCachedValue:(id)a3 identifier:(id)a4;
- (void)invalidate;
- (void)setCachedValue:(id)a3 withParameter:(id)a4;
- (void)setTimeout:(double)a3;
@end

@implementation LACCache

- (LACCache)initWithTimeout:(double)a3
{
  v11.receiver = self;
  v11.super_class = (Class)&OBJC_CLASS___LACCache;
  v4 = -[LACCache init](&v11, sel_init);
  v5 = v4;
  if (v4)
  {
    v4->_timeout = a3;
    uint64_t v6 = objc_opt_new();
    cachedValues = v5->_cachedValues;
    v5->_cachedValues = (NSMutableDictionary *)v6;

    v5->_cachedValuesLock._os_unfair_lock_opaque = 0;
    uint64_t v8 = +[LACConcurrencyUtilities createDefaultSerialQueueWithIdentifier:]( &OBJC_CLASS___LACConcurrencyUtilities,  "createDefaultSerialQueueWithIdentifier:",  @"com.apple.LocalAuthentication.lac-cache-queue");
    workQueue = v5->_workQueue;
    v5->_workQueue = (OS_dispatch_queue *)v8;
  }

  return v5;
}

- (void)invalidate
{
  p_cachedValuesLock = &self->_cachedValuesLock;
  os_unfair_lock_lock(&self->_cachedValuesLock);
  -[NSMutableDictionary removeAllObjects](self->_cachedValues, "removeAllObjects");
  os_unfair_lock_unlock(p_cachedValuesLock);
}

- (id)cachedValueWithParameter:(id)a3
{
  p_cachedValuesLock = &self->_cachedValuesLock;
  id v5 = a3;
  os_unfair_lock_lock(p_cachedValuesLock);
  cachedValues = self->_cachedValues;
  v7 = -[LACCache _identifierForParameter:](self, "_identifierForParameter:", v5);
  -[NSMutableDictionary objectForKeyedSubscript:](cachedValues, "objectForKeyedSubscript:", v7);
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();

  os_unfair_lock_unlock(p_cachedValuesLock);
  return v8;
}

- (void)setCachedValue:(id)a3 withParameter:(id)a4
{
  id v6 = a3;
  if (v6)
  {
    v7 = -[LACCache _identifierForParameter:](self, "_identifierForParameter:", a4);
    os_unfair_lock_lock(&self->_cachedValuesLock);
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_cachedValues, "setObject:forKeyedSubscript:", v6, v7);
    os_unfair_lock_unlock(&self->_cachedValuesLock);
    if (self->_timeout > 0.0)
    {
      objc_initWeak(&location, self);
      dispatch_time_t v8 = dispatch_time(0LL, (uint64_t)(self->_timeout * 1000000000.0));
      workQueue = (dispatch_queue_s *)self->_workQueue;
      v10[0] = MEMORY[0x1895F87A8];
      v10[1] = 3221225472LL;
      v10[2] = __41__LACCache_setCachedValue_withParameter___block_invoke;
      v10[3] = &unk_18A36A208;
      objc_copyWeak(&v13, &location);
      id v11 = v6;
      id v12 = v7;
      dispatch_after(v8, workQueue, v10);

      objc_destroyWeak(&v13);
      objc_destroyWeak(&location);
    }
  }
}

void __41__LACCache_setCachedValue_withParameter___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  [WeakRetained _invalidateCachedValue:*(void *)(a1 + 32) identifier:*(void *)(a1 + 40)];
}

- (id)_identifierForParameter:(id)a3
{
  if (a3)
  {
    v3 = (void *)NSString;
    id v4 = a3;
    uint64_t v5 = objc_opt_class();
    [v4 description];
    id v6 = (void *)objc_claimAutoreleasedReturnValue();

    [v3 stringWithFormat:@"%@-%@", v5, v6];
    v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }

  else
  {
    v7 = &stru_18A36E1E8;
  }

  return v7;
}

- (void)_invalidateCachedValue:(id)a3 identifier:(id)a4
{
  id v8 = a4;
  id v6 = a3;
  os_unfair_lock_lock(&self->_cachedValuesLock);
  -[NSMutableDictionary objectForKeyedSubscript:](self->_cachedValues, "objectForKeyedSubscript:", v8);
  id v7 = (id)objc_claimAutoreleasedReturnValue();

  if (v7 == v6) {
    -[NSMutableDictionary removeObjectForKey:](self->_cachedValues, "removeObjectForKey:", v8);
  }
  os_unfair_lock_unlock(&self->_cachedValuesLock);
}

- (double)timeout
{
  return self->_timeout;
}

- (void)setTimeout:(double)a3
{
  self->_timeout = a3;
}

- (void).cxx_destruct
{
}

@end