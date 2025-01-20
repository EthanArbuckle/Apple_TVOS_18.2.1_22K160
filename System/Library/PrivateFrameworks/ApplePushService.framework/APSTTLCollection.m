@interface APSTTLCollection
+ (id)suppressedTTRTopics;
- (APSTTLCollection)initWithQueue:(id)a3 ttlInSeconds:(double)a4;
- (APSTTLCollectionDelegate)delegate;
- (double)ttlInSeconds;
- (void)_performEvictionSweep;
- (void)_startEvictionTimerIfNeeded;
- (void)_stopEvictionTimer;
- (void)_stopEvictionTimerIfEmpty;
- (void)addItem:(id)a3;
- (void)addItem:(id)a3 withInitialState:(unsigned int)a4;
- (void)addItem:(id)a3 withInitialState:(unsigned int)a4 withTopic:(id)a5;
- (void)dealloc;
- (void)removeItem:(id)a3;
- (void)removeItem:(id)a3 withFlag:(unsigned int)a4;
- (void)setDelegate:(id)a3;
@end

@implementation APSTTLCollection

+ (id)suppressedTTRTopics
{
  if (qword_10014E7F8 != -1) {
    dispatch_once(&qword_10014E7F8, &stru_10011E4C8);
  }
  return (id)qword_10014E7F0;
}

- (APSTTLCollection)initWithQueue:(id)a3 ttlInSeconds:(double)a4
{
  id v7 = a3;
  v13.receiver = self;
  v13.super_class = (Class)&OBJC_CLASS___APSTTLCollection;
  v8 = -[APSTTLCollection init](&v13, "init");
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_queue, a3);
    v10 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    backingStore = v9->_backingStore;
    v9->_backingStore = v10;

    v9->_ttlInSeconds = a4;
  }

  return v9;
}

- (void)addItem:(id)a3
{
  if (a3) {
    -[APSTTLCollection addItem:withInitialState:](self, "addItem:withInitialState:");
  }
}

- (void)addItem:(id)a3 withInitialState:(unsigned int)a4
{
  if (a3) {
    -[APSTTLCollection addItem:withInitialState:withTopic:]( self,  "addItem:withInitialState:withTopic:",  a3,  *(void *)&a4,  0LL);
  }
}

- (void)addItem:(id)a3 withInitialState:(unsigned int)a4 withTopic:(id)a5
{
  if (a3)
  {
    uint64_t v5 = *(void *)&a4;
    id v8 = a5;
    id v9 = a3;
    v10 = -[APSTTLCollectionItemInfo initWithTTLInSeconds:state:withTopic:]( objc_alloc(&OBJC_CLASS___APSTTLCollectionItemInfo),  "initWithTTLInSeconds:state:withTopic:",  v5,  v8,  self->_ttlInSeconds);

    -[NSMutableDictionary setObject:forKey:](self->_backingStore, "setObject:forKey:", v10, v9);
    -[APSTTLCollection _startEvictionTimerIfNeeded](self, "_startEvictionTimerIfNeeded");
  }

- (void)removeItem:(id)a3
{
}

- (void)removeItem:(id)a3 withFlag:(unsigned int)a4
{
  id v6 = a3;
  if (v6)
  {
    id v10 = v6;
    id v7 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](self->_backingStore, "objectForKey:", v6));
    LODWORD(v8) = [v7 itemState];

    if ((v8 & a4) != 0)
    {
      uint64_t v8 = v8 ^ a4;
      id v9 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](self->_backingStore, "objectForKey:", v10));
      [v9 setItemState:v8];
    }

    id v6 = v10;
    if (!(_DWORD)v8)
    {
      -[NSMutableDictionary removeObjectForKey:](self->_backingStore, "removeObjectForKey:", v10);
      -[APSTTLCollection _stopEvictionTimerIfEmpty](self, "_stopEvictionTimerIfEmpty");
      id v6 = v10;
    }
  }
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___APSTTLCollection;
  -[APSTTLCollection dealloc](&v3, "dealloc");
}

- (void)_startEvictionTimerIfNeeded
{
  if (-[NSMutableDictionary count](self->_backingStore, "count"))
  {
    if (!self->_evictionTimer)
    {
      double ttlInSeconds = self->_ttlInSeconds;
      double v4 = ttlInSeconds * 1.2;
      double v5 = ttlInSeconds * 0.1;
      id v6 = (OS_dispatch_source *)dispatch_source_create( (dispatch_source_type_t)&_dispatch_source_type_timer,  0LL,  0LL,  (dispatch_queue_t)self->_queue);
      evictionTimer = self->_evictionTimer;
      self->_evictionTimer = v6;

      dispatch_source_set_timer( (dispatch_source_t)self->_evictionTimer,  0LL,  (unint64_t)(v4 * 1000000000.0),  (unint64_t)(v5 * 1000000000.0));
      uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(+[CUTWeakReference weakRefWithObject:](&OBJC_CLASS___CUTWeakReference, "weakRefWithObject:", self));
      id v9 = self->_evictionTimer;
      handler[0] = _NSConcreteStackBlock;
      handler[1] = 3221225472LL;
      handler[2] = sub_10001FFB0;
      handler[3] = &unk_10011E4F0;
      id v12 = v8;
      id v10 = v8;
      dispatch_source_set_event_handler((dispatch_source_t)v9, handler);
      dispatch_resume((dispatch_object_t)self->_evictionTimer);
    }
  }

- (void)_stopEvictionTimer
{
  evictionTimer = self->_evictionTimer;
  if (evictionTimer)
  {
    dispatch_source_cancel((dispatch_source_t)evictionTimer);
    double v4 = self->_evictionTimer;
    self->_evictionTimer = 0LL;
  }

- (void)_stopEvictionTimerIfEmpty
{
  if (!-[NSMutableDictionary count](self->_backingStore, "count")) {
    -[APSTTLCollection _stopEvictionTimer](self, "_stopEvictionTimer");
  }
}

- (void)_performEvictionSweep
{
  objc_super v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
  double v4 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  double v5 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  id v6 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  backingStore = self->_backingStore;
  v20 = _NSConcreteStackBlock;
  uint64_t v21 = 3221225472LL;
  v22 = sub_100020330;
  v23 = &unk_10011E518;
  id v8 = v3;
  id v24 = v8;
  id v9 = v6;
  v25 = v9;
  id v10 = v4;
  v26 = v10;
  v11 = v5;
  v27 = v11;
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](backingStore, "enumerateKeysAndObjectsUsingBlock:", &v20);
  if (-[NSMutableArray count](v10, "count", v20, v21, v22, v23))
  {
    id v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[APSLog ttlCollection](&OBJC_CLASS___APSLog, "ttlCollection"));
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412802;
      v29 = self;
      __int16 v30 = 2112;
      v31 = v10;
      __int16 v32 = 2112;
      v33 = v11;
      _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEFAULT,  "Timed out waiting for tracing enabled acks. Invoking TTR. {ttlCollection:%@; Guids:%@; States:%@}",
        buf,
        0x20u);
    }

    -[NSMutableDictionary removeObjectsForKeys:](self->_backingStore, "removeObjectsForKeys:", v10);
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    char v14 = objc_opt_respondsToSelector(WeakRetained, "ttlCollection:itemsDidExpire:");

    if ((v14 & 1) != 0)
    {
      id v15 = objc_loadWeakRetained((id *)&self->_delegate);
      [v15 ttlCollection:self itemsDidExpire:v10];
    }

    id v16 = objc_loadWeakRetained((id *)&self->_delegate);
    char v17 = objc_opt_respondsToSelector(v16, "ttlCollection:itemsDidExpire:withStates:");

    if ((v17 & 1) != 0)
    {
      id v18 = objc_loadWeakRetained((id *)&self->_delegate);
      [v18 ttlCollection:self itemsDidExpire:v10 withStates:v11];
    }
  }

  if (-[NSMutableArray count](v9, "count"))
  {
    v19 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[APSLog ttlCollection](&OBJC_CLASS___APSLog, "ttlCollection"));
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      v29 = self;
      __int16 v30 = 2112;
      v31 = v9;
      _os_log_impl( (void *)&_mh_execute_header,  v19,  OS_LOG_TYPE_DEFAULT,  "Timed out waiting for tracing enabled. {ttlCollection:%@; suppressedTopicItems:%@}",
        buf,
        0x16u);
    }

    -[NSMutableDictionary removeObjectsForKeys:](self->_backingStore, "removeObjectsForKeys:", v9);
  }

  -[APSTTLCollection _stopEvictionTimerIfEmpty](self, "_stopEvictionTimerIfEmpty");
  -[APSTTLCollection _startEvictionTimerIfNeeded](self, "_startEvictionTimerIfNeeded");
}

- (APSTTLCollectionDelegate)delegate
{
  return (APSTTLCollectionDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
}

- (double)ttlInSeconds
{
  return self->_ttlInSeconds;
}

- (void).cxx_destruct
{
}

@end