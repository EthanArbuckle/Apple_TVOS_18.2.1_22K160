@interface AKExpiringCache
- (AKExpiringCache)init;
- (id)objectForKey:(id)a3;
- (void)flushCacheForced:(BOOL)a3;
- (void)removeObjectForKey:(id)a3;
- (void)setObject:(id)a3 forKey:(id)a4 expiresIn:(double)a5;
@end

@implementation AKExpiringCache

- (AKExpiringCache)init
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___AKExpiringCache;
  v2 = -[AKExpiringCache init](&v6, "init");
  if (v2)
  {
    uint64_t v3 = objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
    internalCache = v2->_internalCache;
    v2->_internalCache = (NSMutableDictionary *)v3;

    v2->_lock._os_unfair_lock_opaque = 0;
  }

  return v2;
}

- (id)objectForKey:(id)a3
{
  p_lock = &self->_lock;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = sub_1000260D8;
  v8[3] = &unk_1001C72D8;
  v8[4] = self;
  id v9 = a3;
  id v4 = v9;
  os_unfair_lock_lock(p_lock);
  id v5 = sub_1000260D8((uint64_t)v8);
  objc_super v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  os_unfair_lock_unlock(p_lock);

  return v6;
}

- (void)removeObjectForKey:(id)a3
{
  p_lock = &self->_lock;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_1000261C8;
  v5[3] = &unk_1001C6538;
  v5[4] = self;
  id v6 = a3;
  id v4 = v6;
  os_unfair_lock_lock(p_lock);
  sub_1000261C8((uint64_t)v5);
  os_unfair_lock_unlock(p_lock);
}

- (void)setObject:(id)a3 forKey:(id)a4 expiresIn:(double)a5
{
  id v8 = a4;
  id v9 = a3;
  v10 = objc_alloc(&OBJC_CLASS____AKExpiringCacheValue);
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate dateWithTimeIntervalSinceNow:](&OBJC_CLASS___NSDate, "dateWithTimeIntervalSinceNow:", a5));
  v12 = -[_AKExpiringCacheValue initWithObject:expiryDate:](v10, "initWithObject:expiryDate:", v9, v11);

  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472LL;
  v19[2] = sub_100026350;
  v19[3] = &unk_1001C6510;
  v19[4] = self;
  v20 = v12;
  id v21 = v8;
  id v13 = v8;
  v14 = v12;
  os_unfair_lock_lock(&self->_lock);
  sub_100026350(v19);
  os_unfair_lock_unlock(&self->_lock);
  dispatch_time_t v15 = dispatch_time(0LL, (uint64_t)(a5 * 1000000000.0));
  dispatch_queue_global_t global_queue = dispatch_get_global_queue(21LL, 0LL);
  v17 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(global_queue);
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472LL;
  v18[2] = sub_100026364;
  v18[3] = &unk_1001C7300;
  v18[4] = self;
  dispatch_after(v15, v17, v18);
}

- (void)flushCacheForced:(BOOL)a3
{
  p_lock = &self->_lock;
  v25[0] = _NSConcreteStackBlock;
  v25[1] = 3221225472LL;
  v25[2] = sub_10002653C;
  v25[3] = &unk_1001C7328;
  v25[4] = self;
  os_unfair_lock_lock(&self->_lock);
  id v6 = sub_10002653C((uint64_t)v25);
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  os_unfair_lock_unlock(p_lock);
  __int128 v23 = 0u;
  __int128 v24 = 0u;
  __int128 v21 = 0u;
  __int128 v22 = 0u;
  id obj = v7;
  id v8 = [obj countByEnumeratingWithState:&v21 objects:v26 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v22;
    do
    {
      v11 = 0LL;
      do
      {
        if (*(void *)v22 != v10) {
          objc_enumerationMutation(obj);
        }
        uint64_t v12 = *(void *)(*((void *)&v21 + 1) + 8LL * (void)v11);
        v16[0] = _NSConcreteStackBlock;
        v16[1] = 3221225472LL;
        v17 = sub_100026548;
        v18 = &unk_1001C7350;
        v19 = self;
        uint64_t v20 = v12;
        os_unfair_lock_lock(p_lock);
        uint64_t v13 = (uint64_t)v17((uint64_t)v16);
        v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
        os_unfair_lock_unlock(p_lock);

        v11 = (char *)v11 + 1;
      }

      while (v9 != v11);
      id v9 = [obj countByEnumeratingWithState:&v21 objects:v26 count:16];
    }

    while (v9);
  }
}

- (void).cxx_destruct
{
}

@end