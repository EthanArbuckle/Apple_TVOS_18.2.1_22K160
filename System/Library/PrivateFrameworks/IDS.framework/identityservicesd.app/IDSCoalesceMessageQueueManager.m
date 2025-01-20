@interface IDSCoalesceMessageQueueManager
- (BOOL)_isTopicBeingRateLimited:(id)a3;
- (BOOL)coalesceQueueExistsForTopic:(id)a3;
- (IDSCoalesceMessageQueueManager)initWithBag:(id)a3;
- (IDSCoalesceMessageQueueManagerDelegate)delegate;
- (IDSServerBag)bag;
- (NSMutableDictionary)queueMap;
- (NSMutableDictionary)rateLimitMap;
- (NSMutableDictionary)timerMap;
- (double)coalesceDelayForTopic:(id)a3 sendMode:(id)a4;
- (double)defaultDelayForSendMode:(id)a3;
- (id)formattedKeyForTopic:(id)a3 sendMode:(id)a4;
- (id)loggableOverviewForTopic:(id)a3;
- (os_unfair_lock_s)lock;
- (void)_clearQueueForTopic:(id)a3;
- (void)_clearTimerForTopic:(id)a3;
- (void)_createTimerForTopic:(id)a3 withDelay:(double)a4;
- (void)_resetTimerForTopic:(id)a3 withDelay:(double)a4;
- (void)_timerFired:(id)a3;
- (void)_updateTimerForTopic:(id)a3 sendMode:(id)a4;
- (void)enqueueMessage:(id)a3 forTopic:(id)a4 sendMode:(id)a5;
- (void)flushCoalesceQueueForTopic:(id)a3;
- (void)handleMessageToCoalesce:(id)a3 forTopic:(id)a4 sendMode:(id)a5;
- (void)handleRateLimitingResponseForTopic:(id)a3 ttr:(id)a4;
- (void)setBag:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setLock:(os_unfair_lock_s)a3;
- (void)setQueueMap:(id)a3;
- (void)setRateLimitMap:(id)a3;
- (void)setTimerMap:(id)a3;
@end

@implementation IDSCoalesceMessageQueueManager

- (IDSCoalesceMessageQueueManager)initWithBag:(id)a3
{
  id v5 = a3;
  v15.receiver = self;
  v15.super_class = (Class)&OBJC_CLASS___IDSCoalesceMessageQueueManager;
  v6 = -[IDSCoalesceMessageQueueManager init](&v15, "init");
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_bag, a3);
    v8 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    queueMap = v7->_queueMap;
    v7->_queueMap = v8;

    v10 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    timerMap = v7->_timerMap;
    v7->_timerMap = v10;

    v12 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    rateLimitMap = v7->_rateLimitMap;
    v7->_rateLimitMap = v12;

    v7->_lock._os_unfair_lock_opaque = 0;
  }

  return v7;
}

- (void)handleMessageToCoalesce:(id)a3 forTopic:(id)a4 sendMode:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  -[IDSCoalesceMessageQueueManager enqueueMessage:forTopic:sendMode:]( self,  "enqueueMessage:forTopic:sendMode:",  a3,  v9,  v8);
  -[IDSCoalesceMessageQueueManager _updateTimerForTopic:sendMode:](self, "_updateTimerForTopic:sendMode:", v9, v8);
}

- (void)enqueueMessage:(id)a3 forTopic:(id)a4 sendMode:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog delivery](&OBJC_CLASS___IDSFoundationLog, "delivery"));
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue([v8 objectForKeyedSubscript:IDSDeliveryMessageKey]);
    v13 = (void *)objc_claimAutoreleasedReturnValue([v12 messageID]);
    int v19 = 138412802;
    v20 = v13;
    __int16 v21 = 2112;
    id v22 = v9;
    __int16 v23 = 2112;
    id v24 = v10;
    _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "Coalesce queue manager enqueing message { guid : %@ topic : %@ sendMode : %@ }",  (uint8_t *)&v19,  0x20u);
  }

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  objc_super v15 = (IDSCoalesceMessageQueue *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](self->_queueMap, "objectForKey:", v9));
  if (!v15)
  {
    objc_super v15 = -[IDSCoalesceMessageQueue initWithTopic:sendMode:]( objc_alloc(&OBJC_CLASS___IDSCoalesceMessageQueue),  "initWithTopic:sendMode:",  v9,  v10);
    -[NSMutableDictionary setObject:forKey:](self->_queueMap, "setObject:forKey:", v15, v9);
  }

  v16 = (void *)objc_claimAutoreleasedReturnValue(-[IDSCoalesceMessageQueue infos](v15, "infos"));

  if (!v16)
  {
    v17 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
    -[IDSCoalesceMessageQueue setInfos:](v15, "setInfos:", v17);
  }

  [v8 setObject:&__kCFBooleanTrue forKey:IDSDeliveryFromCoalesceQueueKey];
  v18 = (void *)objc_claimAutoreleasedReturnValue(-[IDSCoalesceMessageQueue infos](v15, "infos"));
  [v18 addObject:v8];

  os_unfair_lock_unlock(p_lock);
}

- (void)_clearQueueForTopic:(id)a3
{
  id v4 = a3;
  id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog delivery](&OBJC_CLASS___IDSFoundationLog, "delivery"));
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 138412290;
    id v8 = v4;
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "Clearing coalesce queue for topic : %@",  (uint8_t *)&v7,  0xCu);
  }

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](self->_queueMap, "objectForKey:", v4));
  if (v6) {
    -[NSMutableDictionary removeObjectForKey:](self->_queueMap, "removeObjectForKey:", v4);
  }
}

- (void)flushCoalesceQueueForTopic:(id)a3
{
  id v4 = a3;
  os_unfair_lock_lock(&self->_lock);
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](self->_queueMap, "objectForKey:", v4));
  if ([v5 isEmpty])
  {
    os_unfair_lock_unlock(&self->_lock);
  }

  else
  {
    v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog delivery](&OBJC_CLASS___IDSFoundationLog, "delivery"));
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v27 = v4;
      _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "Flushing coalesce queue for topic : %@",  buf,  0xCu);
    }

    id v20 = v4;

    int v7 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
    __int128 v21 = 0u;
    __int128 v22 = 0u;
    __int128 v23 = 0u;
    __int128 v24 = 0u;
    int v19 = v5;
    id v8 = (void *)objc_claimAutoreleasedReturnValue([v5 infos]);
    id v9 = [v8 countByEnumeratingWithState:&v21 objects:v25 count:16];
    if (v9)
    {
      id v10 = v9;
      uint64_t v11 = *(void *)v22;
      uint64_t v12 = IDSDeliveryMessageKey;
      do
      {
        for (i = 0LL; i != v10; i = (char *)i + 1)
        {
          if (*(void *)v22 != v11) {
            objc_enumerationMutation(v8);
          }
          v14 = *(void **)(*((void *)&v21 + 1) + 8LL * (void)i);
          objc_super v15 = (void *)objc_claimAutoreleasedReturnValue([v14 objectForKeyedSubscript:v12]);
          v16 = (void *)objc_claimAutoreleasedReturnValue([v15 sendMode]);
        }

        id v10 = [v8 countByEnumeratingWithState:&v21 objects:v25 count:16];
      }

      while (v10);
    }

    id v4 = v20;
    -[IDSCoalesceMessageQueueManager _clearTimerForTopic:](self, "_clearTimerForTopic:", v20);
    -[IDSCoalesceMessageQueueManager _clearQueueForTopic:](self, "_clearQueueForTopic:", v20);
    os_unfair_lock_unlock(&self->_lock);
    v17 = (void *)objc_claimAutoreleasedReturnValue(-[IDSCoalesceMessageQueueManager delegate](self, "delegate"));
    id v5 = v19;
    v18 = (void *)objc_claimAutoreleasedReturnValue([v19 sendMode]);
    [v17 queueManager:self receivedMessagesToSend:v7 forTopic:v20 sendMode:v18];
  }
}

- (BOOL)coalesceQueueExistsForTopic:(id)a3
{
  id v4 = a3;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](self->_queueMap, "objectForKey:", v4));

  if (v6)
  {
    int v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog delivery](&OBJC_CLASS___IDSFoundationLog, "delivery"));
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      int v9 = 138412290;
      id v10 = v4;
      _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "Coalesce queue exists for topic : %@",  (uint8_t *)&v9,  0xCu);
    }
  }

  os_unfair_lock_unlock(p_lock);

  return v6 != 0LL;
}

- (void)_updateTimerForTopic:(id)a3 sendMode:(id)a4
{
  id v20 = a3;
  id v6 = a4;
  os_unfair_lock_lock(&self->_lock);
  if (-[IDSCoalesceMessageQueueManager _isTopicBeingRateLimited:](self, "_isTopicBeingRateLimited:", v20))
  {
    int v7 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](self->_rateLimitMap, "objectForKey:", v20));
    id v8 = [v7 integerValue];

    int v9 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](self->_timerMap, "objectForKey:", v20));
    if (!v9) {
      -[IDSCoalesceMessageQueueManager _createTimerForTopic:withDelay:]( self,  "_createTimerForTopic:withDelay:",  v20,  (double)(uint64_t)v8);
    }
  }

  else
  {
    -[IDSCoalesceMessageQueueManager coalesceDelayForTopic:sendMode:](self, "coalesceDelayForTopic:sendMode:", v20, v6);
    double v11 = v10;
    uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](self->_timerMap, "objectForKey:", v20));

    if (!v12) {
      -[IDSCoalesceMessageQueueManager _createTimerForTopic:withDelay:]( self,  "_createTimerForTopic:withDelay:",  v20,  v11);
    }
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](self->_queueMap, "objectForKey:", v20));
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](self->_timerMap, "objectForKey:", v20));
    int v15 = [v6 intValue];
    v16 = (void *)objc_claimAutoreleasedReturnValue([v13 sendMode]);
    if (v15 >= (int)[v16 intValue])
    {
    }

    else
    {
      v17 = (void *)objc_claimAutoreleasedReturnValue([v14 fireDate]);
      [v17 timeIntervalSinceNow];
      double v19 = v18;

      if (v19 > v11)
      {
        [v13 setSendMode:v6];
        -[IDSCoalesceMessageQueueManager _resetTimerForTopic:withDelay:]( self,  "_resetTimerForTopic:withDelay:",  v20,  v11);
      }
    }
  }

  os_unfair_lock_unlock(&self->_lock);
}

- (void)_createTimerForTopic:(id)a3 withDelay:(double)a4
{
  id v6 = a3;
  int v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog delivery](&OBJC_CLASS___IDSFoundationLog, "delivery"));
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    id v15 = v6;
    __int16 v16 = 2048;
    double v17 = a4;
    _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "Creating coalesce queue timer for topic : %@ with delay : %f",  buf,  0x16u);
  }

  id v8 = objc_alloc(&OBJC_CLASS___IMDispatchTimer);
  uint64_t v10 = im_primary_queue(v8, v9);
  double v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472LL;
  v13[2] = sub_1001995BC;
  v13[3] = &unk_1008F8088;
  v13[4] = self;
  uint64_t v12 = -[IMDispatchTimer initWithQueue:interval:repeats:userInfo:handlerBlock:]( v8,  "initWithQueue:interval:repeats:userInfo:handlerBlock:",  v11,  (unint64_t)a4,  0LL,  v6,  v13);

  -[NSMutableDictionary setObject:forKey:](self->_timerMap, "setObject:forKey:", v12, v6);
}

- (void)_clearTimerForTopic:(id)a3
{
  id v4 = a3;
  id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog delivery](&OBJC_CLASS___IDSFoundationLog, "delivery"));
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 138412290;
    id v9 = v4;
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "Clearing coalesce queue timer for topic : %@",  (uint8_t *)&v8,  0xCu);
  }

  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](self->_timerMap, "objectForKey:", v4));
  if (v6)
  {
    int v7 = v6;
    [v6 invalidate];

    -[NSMutableDictionary removeObjectForKey:](self->_timerMap, "removeObjectForKey:", v4);
  }

  if (-[IDSCoalesceMessageQueueManager _isTopicBeingRateLimited:](self, "_isTopicBeingRateLimited:", v4)) {
    -[NSMutableDictionary removeObjectForKey:](self->_rateLimitMap, "removeObjectForKey:", v4);
  }
}

- (void)_resetTimerForTopic:(id)a3 withDelay:(double)a4
{
  id v6 = a3;
  int v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog delivery](&OBJC_CLASS___IDSFoundationLog, "delivery"));
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 138412546;
    id v9 = v6;
    __int16 v10 = 2048;
    double v11 = a4;
    _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "Resetting coalesce queue timer for topic : %@ with delay : %f",  (uint8_t *)&v8,  0x16u);
  }

  -[IDSCoalesceMessageQueueManager _clearTimerForTopic:](self, "_clearTimerForTopic:", v6);
  -[IDSCoalesceMessageQueueManager _createTimerForTopic:withDelay:](self, "_createTimerForTopic:withDelay:", v6, a4);
}

- (void)_timerFired:(id)a3
{
  id v4 = (void *)objc_claimAutoreleasedReturnValue([a3 userInfo]);
  id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog delivery](&OBJC_CLASS___IDSFoundationLog, "delivery"));
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 138412290;
    int v7 = v4;
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "Coalesce queue timer fired for topic : %@",  (uint8_t *)&v6,  0xCu);
  }

  -[IDSCoalesceMessageQueueManager flushCoalesceQueueForTopic:](self, "flushCoalesceQueueForTopic:", v4);
}

- (double)coalesceDelayForTopic:(id)a3 sendMode:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  -[IDSCoalesceMessageQueueManager defaultDelayForSendMode:](self, "defaultDelayForSendMode:", v6);
  double v9 = v8;
  __int16 v10 = (void *)objc_claimAutoreleasedReturnValue( -[IDSCoalesceMessageQueueManager formattedKeyForTopic:sendMode:]( self,  "formattedKeyForTopic:sendMode:",  v7,  v6));

  double v11 = (void *)objc_claimAutoreleasedReturnValue(-[IDSCoalesceMessageQueueManager bag](self, "bag"));
  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue([v11 objectForKey:v10]);

  uint64_t v14 = objc_opt_class(&OBJC_CLASS___NSNumber, v13);
  if ((objc_opt_isKindOfClass(v12, v14) & 1) != 0) {
    double v9 = (double)(uint64_t)[v12 integerValue];
  }
  if (+[IMUserDefaults coalesceDelayOverride](&OBJC_CLASS___IMUserDefaults, "coalesceDelayOverride") >= 1) {
    double v9 = (double)+[IMUserDefaults coalesceDelayOverride](&OBJC_CLASS___IMUserDefaults, "coalesceDelayOverride");
  }

  return v9;
}

- (double)defaultDelayForSendMode:(id)a3
{
  unint64_t v3 = (unint64_t)[a3 integerValue];
  double result = 0.0;
  if (v3 <= 3) {
    return dbl_1007178B8[v3];
  }
  return result;
}

- (id)formattedKeyForTopic:(id)a3 sendMode:(id)a4
{
  id v5 = a3;
  unint64_t v6 = (unint64_t)[a4 integerValue];
  if (v6 > 3) {
    id v7 = 0LL;
  }
  else {
    id v7 = off_1008FC700[v6];
  }
  double v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@-%@-%@",  @"coalesce-send-delay",  v7,  v5));

  return v8;
}

- (id)loggableOverviewForTopic:(id)a3
{
  p_lock = &self->_lock;
  id v5 = a3;
  os_unfair_lock_lock(p_lock);
  unint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](self->_queueMap, "objectForKey:", v5));
  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](self->_timerMap, "objectForKey:", v5));
  double v8 = objc_alloc(&OBJC_CLASS___NSString);
  id v9 = [v6 count];
  __int16 v10 = (void *)objc_claimAutoreleasedReturnValue([v7 fireDate]);
  [v10 timeIntervalSinceNow];
  uint64_t v12 = -[NSString initWithFormat:]( v8,  "initWithFormat:",  @"<%@  ->  count: %ld  time until firing: %f>",  v5,  v9,  v11);

  os_unfair_lock_unlock(p_lock);
  return v12;
}

- (BOOL)_isTopicBeingRateLimited:(id)a3
{
  unint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](self->_rateLimitMap, "objectForKey:", a3));
  BOOL v4 = v3 != 0LL;

  return v4;
}

- (void)handleRateLimitingResponseForTopic:(id)a3 ttr:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  os_unfair_lock_lock(&self->_lock);
  double v8 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](self->_rateLimitMap, "objectForKey:", v6));

  if (!v8)
  {
    id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog delivery](&OBJC_CLASS___IDSFoundationLog, "delivery"));
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      int v10 = 138412546;
      id v11 = v6;
      __int16 v12 = 2048;
      id v13 = [v7 integerValue];
      _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "Handling server rate limiting response for topic %@ - messages will be held for %ld seconds",  (uint8_t *)&v10,  0x16u);
    }

    -[NSMutableDictionary setObject:forKey:](self->_rateLimitMap, "setObject:forKey:", v7, v6);
  }

  os_unfair_lock_unlock(&self->_lock);
}

- (IDSCoalesceMessageQueueManagerDelegate)delegate
{
  return (IDSCoalesceMessageQueueManagerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
}

- (NSMutableDictionary)queueMap
{
  return self->_queueMap;
}

- (void)setQueueMap:(id)a3
{
}

- (NSMutableDictionary)timerMap
{
  return self->_timerMap;
}

- (void)setTimerMap:(id)a3
{
}

- (NSMutableDictionary)rateLimitMap
{
  return self->_rateLimitMap;
}

- (void)setRateLimitMap:(id)a3
{
}

- (IDSServerBag)bag
{
  return self->_bag;
}

- (void)setBag:(id)a3
{
}

- (os_unfair_lock_s)lock
{
  return self->_lock;
}

- (void)setLock:(os_unfair_lock_s)a3
{
  self->_lock = a3;
}

- (void).cxx_destruct
{
}

@end