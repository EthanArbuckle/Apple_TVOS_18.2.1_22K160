@interface _DASSignalQueue
- (NSMutableDictionary)signalQueueDictionary;
- (OS_dispatch_queue)executionQueue;
- (_DASSignalQueue)initWithCount:(unint64_t)a3;
- (double)dominant;
- (double)mean;
- (double)percentile:(double)a3;
- (double)rate;
- (double)trend;
- (id)allObjects;
- (id)top;
- (os_unfair_lock_s)queueLock;
- (unint64_t)count;
- (unint64_t)limit;
- (void)addObject:(id)a3;
- (void)setExecutionQueue:(id)a3;
- (void)setLimit:(unint64_t)a3;
- (void)setQueueLock:(os_unfair_lock_s)a3;
- (void)setSignalQueueDictionary:(id)a3;
@end

@implementation _DASSignalQueue

- (_DASSignalQueue)initWithCount:(unint64_t)a3
{
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS____DASSignalQueue;
  v4 = -[_DASSignalQueue init](&v8, "init");
  if (v4)
  {
    uint64_t v5 = objc_claimAutoreleasedReturnValue( +[NSMutableDictionary dictionaryWithCapacity:]( &OBJC_CLASS___NSMutableDictionary,  "dictionaryWithCapacity:",  a3));
    signalQueueDictionary = v4->_signalQueueDictionary;
    v4->_signalQueueDictionary = (NSMutableDictionary *)v5;

    v4->_limit = a3;
    v4->_queueLock._os_unfair_lock_opaque = 0;
  }

  return v4;
}

- (void)addObject:(id)a3
{
  p_queueLock = &self->_queueLock;
  id v5 = a3;
  os_unfair_lock_lock(p_queueLock);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary allValues](self->_signalQueueDictionary, "allValues"));
  id v7 = [v6 count];
  unint64_t limit = self->_limit;

  if ((unint64_t)v7 >= limit)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary allKeys](self->_signalQueueDictionary, "allKeys"));
    v10 = (void *)objc_claimAutoreleasedReturnValue([v9 sortedArrayUsingSelector:"compare:"]);
    v11 = (void *)objc_claimAutoreleasedReturnValue([v10 firstObject]);

    -[NSMutableDictionary removeObjectForKey:](self->_signalQueueDictionary, "removeObjectForKey:", v11);
  }

  signalQueueDictionary = self->_signalQueueDictionary;
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
  -[NSMutableDictionary setObject:forKeyedSubscript:](signalQueueDictionary, "setObject:forKeyedSubscript:", v5, v13);

  os_unfair_lock_unlock(p_queueLock);
}

- (id)allObjects
{
  p_queueLock = &self->_queueLock;
  os_unfair_lock_lock(&self->_queueLock);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary allKeys](self->_signalQueueDictionary, "allKeys"));
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 sortedArrayUsingSelector:"compare:"]);

  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472LL;
  v10[2] = sub_10001B21C;
  v10[3] = &unk_100115400;
  v10[4] = self;
  id v6 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  id v11 = v6;
  [v5 enumerateObjectsUsingBlock:v10];
  os_unfair_lock_unlock(p_queueLock);
  id v7 = v11;
  id v8 = v6;

  return v8;
}

- (id)top
{
  p_queueLock = &self->_queueLock;
  os_unfair_lock_lock(&self->_queueLock);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary allKeys](self->_signalQueueDictionary, "allKeys"));
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 sortedArrayUsingSelector:"compare:"]);

  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 lastObject]);
  os_unfair_lock_unlock(p_queueLock);
  id v7 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_signalQueueDictionary,  "objectForKeyedSubscript:",  v6));

  return v7;
}

- (double)mean
{
  p_queueLock = &self->_queueLock;
  os_unfair_lock_lock(&self->_queueLock);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary allValues](self->_signalQueueDictionary, "allValues"));
  if ([v4 count]
    && (id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 firstObject]),
        uint64_t v6 = objc_opt_class(&OBJC_CLASS___NSNumber),
        char isKindOfClass = objc_opt_isKindOfClass(v5, v6),
        v5,
        (isKindOfClass & 1) != 0))
  {
    __int128 v19 = 0u;
    __int128 v20 = 0u;
    __int128 v17 = 0u;
    __int128 v18 = 0u;
    id v8 = v4;
    id v9 = [v8 countByEnumeratingWithState:&v17 objects:v21 count:16];
    if (v9)
    {
      id v10 = v9;
      uint64_t v11 = *(void *)v18;
      double v12 = 0.0;
      do
      {
        for (i = 0LL; i != v10; i = (char *)i + 1)
        {
          if (*(void *)v18 != v11) {
            objc_enumerationMutation(v8);
          }
          objc_msgSend(*(id *)(*((void *)&v17 + 1) + 8 * (void)i), "doubleValue", (void)v17);
          double v12 = v12 + v14;
        }

        id v10 = [v8 countByEnumeratingWithState:&v17 objects:v21 count:16];
      }

      while (v10);
    }

    else
    {
      double v12 = 0.0;
    }

    double v15 = v12 / (double)(unint64_t)[v8 count];
    os_unfair_lock_unlock(p_queueLock);
  }

  else
  {
    os_unfair_lock_unlock(p_queueLock);
    double v15 = 0.0;
  }

  return v15;
}

- (double)rate
{
  p_queueLock = &self->_queueLock;
  os_unfair_lock_lock(&self->_queueLock);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary allKeys](self->_signalQueueDictionary, "allKeys"));
  if ([v4 count])
  {
    id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 sortedArrayUsingSelector:"compare:"]);

    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue([v5 firstObject]);
    id v7 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_signalQueueDictionary,  "objectForKeyedSubscript:",  v6));
    uint64_t v8 = objc_opt_class(&OBJC_CLASS___NSNumber);
    if ((objc_opt_isKindOfClass(v7, v8) & 1) != 0)
    {
      id v9 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_signalQueueDictionary,  "objectForKeyedSubscript:",  v6));
      [v9 doubleValue];
      double v11 = v10;

      double v12 = (void *)objc_claimAutoreleasedReturnValue([v5 lastObject]);
      v13 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_signalQueueDictionary,  "objectForKeyedSubscript:",  v12));
      [v13 doubleValue];
      double v15 = v14;

      os_unfair_lock_unlock(p_queueLock);
      v16 = os_log_create("com.apple.clas", "signals");
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        [v12 timeIntervalSinceDate:v6];
        int v21 = 134218496;
        double v22 = v11;
        __int16 v23 = 2048;
        double v24 = v15;
        __int16 v25 = 2048;
        uint64_t v26 = v17;
        _os_log_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_DEFAULT,  "First %lf, Last %lf, timeInterval %lf",  (uint8_t *)&v21,  0x20u);
      }

      [v12 timeIntervalSinceDate:v6];
      double v19 = (v15 - v11) / v18;
    }

    else
    {
      os_unfair_lock_unlock(p_queueLock);
      double v19 = 0.0;
    }
  }

  else
  {
    os_unfair_lock_unlock(p_queueLock);
    double v19 = 0.0;
    id v5 = v4;
  }

  return v19;
}

- (double)trend
{
  return 0.0;
}

- (double)dominant
{
  return 0.0;
}

- (double)percentile:(double)a3
{
  return 0.0;
}

- (unint64_t)count
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary allValues](self->_signalQueueDictionary, "allValues"));
  id v3 = [v2 count];

  return (unint64_t)v3;
}

- (unint64_t)limit
{
  return self->_limit;
}

- (void)setLimit:(unint64_t)a3
{
  self->_unint64_t limit = a3;
}

- (NSMutableDictionary)signalQueueDictionary
{
  return self->_signalQueueDictionary;
}

- (void)setSignalQueueDictionary:(id)a3
{
}

- (OS_dispatch_queue)executionQueue
{
  return self->_executionQueue;
}

- (void)setExecutionQueue:(id)a3
{
}

- (os_unfair_lock_s)queueLock
{
  return self->_queueLock;
}

- (void)setQueueLock:(os_unfair_lock_s)a3
{
  self->_queueLock = a3;
}

- (void).cxx_destruct
{
}

@end