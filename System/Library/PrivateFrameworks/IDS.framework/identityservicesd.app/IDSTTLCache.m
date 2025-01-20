@interface IDSTTLCache
- (BOOL)_delegate_shouldEvictObject:(id)a3 forKey:(id)a4;
- (BOOL)_delegate_shouldTTLCacheEvictExpiredItems;
- (IDSTTLCache)initWithQueue:(id)a3 ttlInSeconds:(double)a4;
- (IDSTTLCacheDelegate)delegate;
- (IMMultiQueue)multiQueue;
- (NSMutableDictionary)backingStore;
- (OS_dispatch_queue)queue;
- (OS_dispatch_source)evictionTimer;
- (double)ttlInSeconds;
- (void)_delegate_DidEvictObject:(id)a3 forKey:(id)a4;
- (void)_delegate_didCacheObject:(id)a3 forKey:(id)a4;
- (void)_delegate_willReturnCachedObject:(id)a3 forKey:(id)a4 completion:(id)a5;
- (void)_fetchCachedObjectForKey:(id)a3 completion:(id)a4;
- (void)_performEvictionSweep;
- (void)_startEvictionTimerIfNeeded;
- (void)_stopEvictionTimer;
- (void)_stopEvictionTimerIfEmpty;
- (void)cacheObject:(id)a3 forKey:(id)a4;
- (void)dealloc;
- (void)evictCachedObjectForKey:(id)a3;
- (void)fetchCachedObjectForKey:(id)a3 completion:(id)a4;
- (void)setBackingStore:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setEvictionTimer:(id)a3;
- (void)setMultiQueue:(id)a3;
- (void)setQueue:(id)a3;
- (void)setTtlInSeconds:(double)a3;
@end

@implementation IDSTTLCache

- (IDSTTLCache)initWithQueue:(id)a3 ttlInSeconds:(double)a4
{
  v7 = (dispatch_queue_s *)a3;
  dispatch_assert_queue_V2(v7);
  v15.receiver = self;
  v15.super_class = (Class)&OBJC_CLASS___IDSTTLCache;
  v8 = -[IDSTTLCache init](&v15, "init");
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_queue, a3);
    v10 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    backingStore = v9->_backingStore;
    v9->_backingStore = v10;

    v9->_ttlInSeconds = a4;
    v12 = -[IMMultiQueue initWithQueue:](objc_alloc(&OBJC_CLASS___IMMultiQueue), "initWithQueue:", v7);
    multiQueue = v9->_multiQueue;
    v9->_multiQueue = v12;
  }

  return v9;
}

- (void)cacheObject:(id)a3 forKey:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog utilities](&OBJC_CLASS___IDSFoundationLog, "utilities"));
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    int v12 = 138478083;
    id v13 = v7;
    __int16 v14 = 2113;
    id v15 = v6;
    _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_INFO,  "Caching object {key: %{private}@, object: %{private}@}",  (uint8_t *)&v12,  0x16u);
  }

  v9 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[IDSTTLCache queue](self, "queue"));
  dispatch_assert_queue_V2(v9);

  if (v6)
  {
    v10 = -[IDSTTLCacheItem initWithObject:key:]( objc_alloc(&OBJC_CLASS___IDSTTLCacheItem),  "initWithObject:key:",  v6,  v7);
    -[IDSTTLCache ttlInSeconds](self, "ttlInSeconds");
    -[IDSTTLCacheItem bumpEvictionDateToSecondsFromNow:](v10, "bumpEvictionDateToSecondsFromNow:");
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[IDSTTLCache backingStore](self, "backingStore"));
    [v11 setObject:v10 forKeyedSubscript:v7];

    -[IDSTTLCache _delegate_didCacheObject:forKey:](self, "_delegate_didCacheObject:forKey:", v6, v7);
    -[IDSTTLCache _startEvictionTimerIfNeeded](self, "_startEvictionTimerIfNeeded");
  }

  else
  {
    -[IDSTTLCache evictCachedObjectForKey:](self, "evictCachedObjectForKey:", v7);
  }
}

- (void)fetchCachedObjectForKey:(id)a3 completion:(id)a4
{
  id v6 = a3;
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472LL;
  v18[2] = sub_10012F65C;
  v18[3] = &unk_1008FB438;
  id v7 = a4;
  id v19 = v7;
  v8 = objc_retainBlock(v18);
  v9 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[IDSTTLCache queue](self, "queue"));
  dispatch_assert_queue_V2(v9);

  id location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[IDSTTLCache multiQueue](self, "multiQueue"));
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472LL;
  v13[2] = sub_10012F670;
  v13[3] = &unk_1008FB488;
  objc_copyWeak(&v16, &location);
  id v11 = v6;
  id v14 = v11;
  int v12 = v8;
  id v15 = v12;
  [v10 addBlock:v13 forKey:v11 description:@"IDSTTLCache fetch cached object"];

  objc_destroyWeak(&v16);
  objc_destroyWeak(&location);
}

- (void)evictCachedObjectForKey:(id)a3
{
  id v4 = a3;
  v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[IDSTTLCache queue](self, "queue"));
  dispatch_assert_queue_V2(v5);

  id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog utilities](&OBJC_CLASS___IDSFoundationLog, "utilities"));
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    int v15 = 138477827;
    id v16 = v4;
    _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_INFO,  "Evicting object {key: %{private}@",  (uint8_t *)&v15,  0xCu);
  }

  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[IDSTTLCache backingStore](self, "backingStore"));
  v8 = (void *)objc_claimAutoreleasedReturnValue([v7 objectForKey:v4]);

  if (!v8)
  {
    id v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog utilities](&OBJC_CLASS___IDSFoundationLog, "utilities"));
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      int v15 = 138477827;
      id v16 = v4;
      id v14 = "Tried to evict object that is not in cache {key: %{private}@}";
LABEL_10:
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, v14, (uint8_t *)&v15, 0xCu);
    }

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___IDSTTLCache;
  -[IDSTTLCache dealloc](&v3, "dealloc");
}

- (void)_startEvictionTimerIfNeeded
{
  objc_super v3 = (void *)objc_claimAutoreleasedReturnValue(-[IDSTTLCache evictionTimer](self, "evictionTimer"));

  if (!v3)
  {
    -[IDSTTLCache ttlInSeconds](self, "ttlInSeconds");
    double v5 = v4 * 1.2;
    -[IDSTTLCache ttlInSeconds](self, "ttlInSeconds");
    double v7 = v6 * 0.1;
    v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog utilities](&OBJC_CLASS___IDSFoundationLog, "utilities"));
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134218240;
      double v16 = v5;
      __int16 v17 = 2048;
      double v18 = v7;
      _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "Eviction timer did start {interval: %.6f, leeway: %.6f",  buf,  0x16u);
    }

    v9 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[IDSTTLCache queue](self, "queue"));
    dispatch_source_t v10 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0LL, 0LL, v9);
    -[IDSTTLCache setEvictionTimer:](self, "setEvictionTimer:", v10);

    id v11 = (dispatch_source_s *)objc_claimAutoreleasedReturnValue(-[IDSTTLCache evictionTimer](self, "evictionTimer"));
    dispatch_source_set_timer(v11, 0LL, (unint64_t)(v5 * 1000000000.0), (unint64_t)(v7 * 1000000000.0));

    int v12 = (dispatch_source_s *)objc_claimAutoreleasedReturnValue(-[IDSTTLCache evictionTimer](self, "evictionTimer"));
    handler[0] = _NSConcreteStackBlock;
    handler[1] = 3221225472LL;
    handler[2] = sub_10012FB88;
    handler[3] = &unk_1008F6010;
    handler[4] = self;
    dispatch_source_set_event_handler(v12, handler);

    id v13 = (dispatch_object_s *)objc_claimAutoreleasedReturnValue(-[IDSTTLCache evictionTimer](self, "evictionTimer"));
    dispatch_resume(v13);
  }

- (void)_stopEvictionTimerIfEmpty
{
  objc_super v3 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog utilities](&OBJC_CLASS___IDSFoundationLog, "utilities"));
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    LOWORD(v9) = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "Stop eviction timer if empty", (uint8_t *)&v9, 2u);
  }

  double v4 = (void *)objc_claimAutoreleasedReturnValue(-[IDSTTLCache backingStore](self, "backingStore"));
  id v5 = [v4 count];

  if (v5)
  {
    double v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog utilities](&OBJC_CLASS___IDSFoundationLog, "utilities"));
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      double v7 = (void *)objc_claimAutoreleasedReturnValue(-[IDSTTLCache backingStore](self, "backingStore"));
      id v8 = [v7 count];
      int v9 = 134217984;
      id v10 = v8;
      _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_INFO,  "Not stopping eviction timer {backingStore.count: %ld}",  (uint8_t *)&v9,  0xCu);
    }
  }

  else
  {
    -[IDSTTLCache _stopEvictionTimer](self, "_stopEvictionTimer");
  }

- (void)_stopEvictionTimer
{
  objc_super v3 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog utilities](&OBJC_CLASS___IDSFoundationLog, "utilities"));
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    double v4 = (void *)objc_claimAutoreleasedReturnValue(-[IDSTTLCache backingStore](self, "backingStore"));
    int v7 = 134217984;
    id v8 = [v4 count];
    _os_log_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_DEFAULT,  "Stopping eviction timer {backingStore.count: %ld}",  (uint8_t *)&v7,  0xCu);
  }

  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[IDSTTLCache evictionTimer](self, "evictionTimer"));
  if (v5)
  {
    double v6 = (dispatch_source_s *)objc_claimAutoreleasedReturnValue(-[IDSTTLCache evictionTimer](self, "evictionTimer"));
    dispatch_source_cancel(v6);

    -[IDSTTLCache setEvictionTimer:](self, "setEvictionTimer:", 0LL);
  }

- (void)_performEvictionSweep
{
  if (-[IDSTTLCache _delegate_shouldTTLCacheEvictExpiredItems](self, "_delegate_shouldTTLCacheEvictExpiredItems"))
  {
    objc_super v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
    double v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog utilities](&OBJC_CLASS___IDSFoundationLog, "utilities"));
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v23 = v3;
      _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "Evicting items {currentDate: %{public}@}",  buf,  0xCu);
    }

    id v5 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
    double v6 = (void *)objc_claimAutoreleasedReturnValue(-[IDSTTLCache backingStore](self, "backingStore"));
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472LL;
    v18[2] = sub_100130018;
    v18[3] = &unk_1008FB4B0;
    id v7 = v3;
    id v19 = v7;
    id v8 = v5;
    v20 = v8;
    [v6 enumerateKeysAndObjectsUsingBlock:v18];

    __int128 v16 = 0u;
    __int128 v17 = 0u;
    __int128 v14 = 0u;
    __int128 v15 = 0u;
    int v9 = v8;
    id v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v9,  "countByEnumeratingWithState:objects:count:",  &v14,  v21,  16LL);
    if (v10)
    {
      id v11 = v10;
      uint64_t v12 = *(void *)v15;
      do
      {
        id v13 = 0LL;
        do
        {
          if (*(void *)v15 != v12) {
            objc_enumerationMutation(v9);
          }
          -[IDSTTLCache evictCachedObjectForKey:]( self,  "evictCachedObjectForKey:",  *(void *)(*((void *)&v14 + 1) + 8LL * (void)v13),  (void)v14);
          id v13 = (char *)v13 + 1;
        }

        while (v11 != v13);
        id v11 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v9,  "countByEnumeratingWithState:objects:count:",  &v14,  v21,  16LL);
      }

      while (v11);
    }

    -[IDSTTLCache _stopEvictionTimerIfEmpty](self, "_stopEvictionTimerIfEmpty");
  }

  else
  {
    id v7 = (id)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog utilities](&OBJC_CLASS___IDSFoundationLog, "utilities"));
    if (os_log_type_enabled((os_log_t)v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)v7,  OS_LOG_TYPE_DEFAULT,  "Delegate returned NO shouldTTLCacheEvictExpiredItems -- Bail",  buf,  2u);
    }
  }
}

- (void)_fetchCachedObjectForKey:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[IDSTTLCache queue](self, "queue"));
  dispatch_assert_queue_V2(v8);

  int v9 = (void *)objc_claimAutoreleasedReturnValue(-[IDSTTLCache backingStore](self, "backingStore"));
  id v10 = (void *)objc_claimAutoreleasedReturnValue([v9 objectForKey:v6]);

  if (!v10)
  {
    id v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog utilities](&OBJC_CLASS___IDSFoundationLog, "utilities"));
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138477827;
      id v21 = v6;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Cache miss {key: %{private}@", buf, 0xCu);
    }
  }

  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue([v10 object]);
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472LL;
  v16[2] = sub_100130308;
  v16[3] = &unk_1008FB4D8;
  v16[4] = self;
  id v17 = v10;
  id v18 = v6;
  id v19 = v7;
  id v13 = v7;
  id v14 = v6;
  id v15 = v10;
  -[IDSTTLCache _delegate_willReturnCachedObject:forKey:completion:]( self,  "_delegate_willReturnCachedObject:forKey:completion:",  v12,  v14,  v16);
}

- (void)_delegate_didCacheObject:(id)a3 forKey:(id)a4
{
  id v10 = a3;
  id v6 = a4;
  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[IDSTTLCache delegate](self, "delegate"));
  char v8 = objc_opt_respondsToSelector(v7, "ttlCache:didCacheObject:forKey:");

  if ((v8 & 1) != 0)
  {
    int v9 = (void *)objc_claimAutoreleasedReturnValue(-[IDSTTLCache delegate](self, "delegate"));
    [v9 ttlCache:self didCacheObject:v10 forKey:v6];
  }
}

- (void)_delegate_willReturnCachedObject:(id)a3 forKey:(id)a4 completion:(id)a5
{
  id v13 = a3;
  id v8 = a4;
  int v9 = (void (**)(id, id))a5;
  id v10 = (void *)objc_claimAutoreleasedReturnValue(-[IDSTTLCache delegate](self, "delegate"));
  char v11 = objc_opt_respondsToSelector(v10, "ttlCache:willReturnCachedObject:forKey:completion:");

  if ((v11 & 1) != 0)
  {
    uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(-[IDSTTLCache delegate](self, "delegate"));
    [v12 ttlCache:self willReturnCachedObject:v13 forKey:v8 completion:v9];
  }

  else
  {
    v9[2](v9, v13);
  }
}

- (BOOL)_delegate_shouldEvictObject:(id)a3 forKey:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[IDSTTLCache delegate](self, "delegate"));
  char v9 = objc_opt_respondsToSelector(v8, "ttlCache:shouldEvictObject:forKey:");

  if ((v9 & 1) != 0)
  {
    id v10 = (void *)objc_claimAutoreleasedReturnValue(-[IDSTTLCache delegate](self, "delegate"));
    unsigned __int8 v11 = [v10 ttlCache:self shouldEvictObject:v6 forKey:v7];
  }

  else
  {
    unsigned __int8 v11 = 1;
  }

  return v11;
}

- (void)_delegate_DidEvictObject:(id)a3 forKey:(id)a4
{
  id v10 = a3;
  id v6 = a4;
  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[IDSTTLCache delegate](self, "delegate"));
  char v8 = objc_opt_respondsToSelector(v7, "ttlCache:didEvictObject:forKey:");

  if ((v8 & 1) != 0)
  {
    char v9 = (void *)objc_claimAutoreleasedReturnValue(-[IDSTTLCache delegate](self, "delegate"));
    [v9 ttlCache:self didEvictObject:v10 forKey:v6];
  }
}

- (BOOL)_delegate_shouldTTLCacheEvictExpiredItems
{
  objc_super v3 = (void *)objc_claimAutoreleasedReturnValue(-[IDSTTLCache delegate](self, "delegate"));
  char v4 = objc_opt_respondsToSelector(v3, "shouldTTLCacheEvictExpiredItems:");

  if ((v4 & 1) == 0) {
    return 1;
  }
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[IDSTTLCache delegate](self, "delegate"));
  unsigned __int8 v6 = [v5 shouldTTLCacheEvictExpiredItems:self];

  return v6;
}

- (NSMutableDictionary)backingStore
{
  return self->_backingStore;
}

- (void)setBackingStore:(id)a3
{
}

- (OS_dispatch_source)evictionTimer
{
  return self->_evictionTimer;
}

- (void)setEvictionTimer:(id)a3
{
}

- (double)ttlInSeconds
{
  return self->_ttlInSeconds;
}

- (void)setTtlInSeconds:(double)a3
{
  self->_ttlInSeconds = a3;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
}

- (IDSTTLCacheDelegate)delegate
{
  return (IDSTTLCacheDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
}

- (IMMultiQueue)multiQueue
{
  return self->_multiQueue;
}

- (void)setMultiQueue:(id)a3
{
}

- (void).cxx_destruct
{
}

@end