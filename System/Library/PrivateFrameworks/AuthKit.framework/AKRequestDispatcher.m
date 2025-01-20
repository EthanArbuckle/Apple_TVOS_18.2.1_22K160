@interface AKRequestDispatcher
+ (id)sharedDispatcher;
- (AKRequestDispatcher)init;
- (BOOL)_executeScheduledRequest:(id)a3;
- (BOOL)_unsafe_executeNextScheduledRequest;
- (id)_dispatchingAlgorithmForInfo:(id)a3;
- (id)_nextScheduledRequest;
- (id)_orderedDispatchingInfoKeys;
- (void)_insertScheduledRequest:(id)a3;
- (void)_invalidateScheduledRequest:(id)a3 withErrorCode:(int64_t)a4;
- (void)_scheduleNextRequest;
- (void)_setDispatchingAlgorithm:(id)a3 forInfo:(id)a4;
- (void)_unsafe_cancelScheduler;
- (void)_unsafe_scheduleNextRequest;
- (void)_unsafe_scheduleRequestWithDispatchInterval:(double)a3;
- (void)_unsafe_schedulerSourceDidFire;
- (void)_updateDispatchingAlgorithmForInfo:(id)a3 withResponse:(id)a4;
- (void)submitDispatchableRequest:(id)a3;
@end

@implementation AKRequestDispatcher

- (AKRequestDispatcher)init
{
  v12.receiver = self;
  v12.super_class = (Class)&OBJC_CLASS___AKRequestDispatcher;
  v2 = -[AKRequestDispatcher init](&v12, "init");
  if (v2)
  {
    dispatch_queue_attr_t v3 = dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v4 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v3);
    dispatch_queue_t v5 = dispatch_queue_create("com.apple.akd.request-dispatcher.scheduler", v4);
    schedulerQueue = v2->_schedulerQueue;
    v2->_schedulerQueue = (OS_dispatch_queue *)v5;

    uint64_t v7 = objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
    dispatchingAlgorithmsByInfo = v2->_dispatchingAlgorithmsByInfo;
    v2->_dispatchingAlgorithmsByInfo = (NSMutableDictionary *)v7;

    v2->_dispatchingAlgorithmsByInfoLock._os_unfair_lock_opaque = 0;
    uint64_t v9 = objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
    scheduledRequests = v2->_scheduledRequests;
    v2->_scheduledRequests = (NSMutableArray *)v9;

    v2->_scheduledRequestsLock._os_unfair_lock_opaque = 0;
  }

  return v2;
}

+ (id)sharedDispatcher
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100094A14;
  block[3] = &unk_1001C8DA0;
  block[4] = a1;
  if (qword_10020F558 != -1) {
    dispatch_once(&qword_10020F558, block);
  }
  return (id)qword_10020F550;
}

- (void)submitDispatchableRequest:(id)a3
{
  id v4 = a3;
  dispatch_queue_t v5 = (void *)objc_claimAutoreleasedReturnValue([v4 dispatchingInfo]);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[AKRequestDispatcher _dispatchingAlgorithmForInfo:](self, "_dispatchingAlgorithmForInfo:", v5));
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([v6 nextCalculation]);
  v8 = (void *)objc_claimAutoreleasedReturnValue( +[_AKScheduledRequest scheduledRequestWithCalculation:forRequest:info:]( &OBJC_CLASS____AKScheduledRequest,  "scheduledRequestWithCalculation:forRequest:info:",  v7,  v4,  v5));
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([v8 calculation]);

  if (v9)
  {
    uint64_t v11 = _AKLogSystem(v10);
    objc_super v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      int v16 = 138412802;
      v17 = self;
      __int16 v18 = 2112;
      id v19 = v4;
      __int16 v20 = 2112;
      v21 = v7;
      _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEFAULT,  "%@: Scheduling request (%@) with calculation (%@)",  (uint8_t *)&v16,  0x20u);
    }

    -[AKRequestDispatcher _insertScheduledRequest:](self, "_insertScheduledRequest:", v8);
    -[AKRequestDispatcher _scheduleNextRequest](self, "_scheduleNextRequest");
  }

  else
  {
    uint64_t v13 = _AKLogSystem(v10);
    v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
    BOOL v15 = os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT);
    if (v6)
    {
      if (v15)
      {
        int v16 = 138412802;
        v17 = self;
        __int16 v18 = 2112;
        id v19 = v4;
        __int16 v20 = 2112;
        v21 = v6;
        _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_DEFAULT,  "%@: Unable to schedule request (%@) with algorithm (%@)",  (uint8_t *)&v16,  0x20u);
      }

      -[AKRequestDispatcher _invalidateScheduledRequest:withErrorCode:]( self,  "_invalidateScheduledRequest:withErrorCode:",  v8,  -7109LL);
    }

    else
    {
      if (v15)
      {
        int v16 = 138412546;
        v17 = self;
        __int16 v18 = 2112;
        id v19 = v4;
        _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_DEFAULT,  "%@: Immediately executing request (%@)",  (uint8_t *)&v16,  0x16u);
      }

      -[AKRequestDispatcher _executeScheduledRequest:](self, "_executeScheduledRequest:", v8);
    }
  }
}

- (void)_scheduleNextRequest
{
  schedulerQueue = (dispatch_queue_s *)self->_schedulerQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100094CD0;
  block[3] = &unk_1001C7300;
  block[4] = self;
  dispatch_sync(schedulerQueue, block);
}

- (void)_unsafe_scheduleNextRequest
{
  dispatch_queue_attr_t v3 = (void *)objc_claimAutoreleasedReturnValue(-[AKRequestDispatcher _nextScheduledRequest](self, "_nextScheduledRequest"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 calculation]);
  uint64_t v5 = _AKLogSystem(v4);
  v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    int v10 = 138412802;
    uint64_t v11 = self;
    __int16 v12 = 2112;
    uint64_t v13 = v3;
    __int16 v14 = 2112;
    BOOL v15 = v4;
    _os_log_debug_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEBUG,  "%@: Scheduling next request (%@) with calculation (%@)",  (uint8_t *)&v10,  0x20u);
  }

  if (v4)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue([v4 dispatchDate]);
    [v8 timeIntervalSinceNow];
    -[AKRequestDispatcher _unsafe_scheduleRequestWithDispatchInterval:]( self,  "_unsafe_scheduleRequestWithDispatchInterval:");
  }

  else
  {
    uint64_t v9 = _AKLogSystem(v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled((os_log_t)v8, OS_LOG_TYPE_DEBUG)) {
      sub_10013DA04((uint64_t)self, (os_log_s *)v8);
    }
  }
}

- (void)_unsafe_scheduleRequestWithDispatchInterval:(double)a3
{
  uint64_t v5 = _AKLogSystem(-[AKRequestDispatcher _unsafe_cancelScheduler](self, "_unsafe_cancelScheduler"));
  v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  BOOL v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
  if (a3 <= 0.0)
  {
    if (v7)
    {
      *(_DWORD *)buf = 138412546;
      id v19 = self;
      __int16 v20 = 2048;
      double v21 = a3;
      _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "%@: Firing scheduler source immediately (dispatchInterval: %.2f)",  buf,  0x16u);
    }

    -[AKRequestDispatcher _unsafe_schedulerSourceDidFire](self, "_unsafe_schedulerSourceDidFire");
  }

  else
  {
    if (v7)
    {
      *(_DWORD *)buf = 138412546;
      id v19 = self;
      __int16 v20 = 2048;
      double v21 = a3;
      _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "%@: Creating scheduler source (dispatchInterval: %.2f)",  buf,  0x16u);
    }

    v8 = dispatch_source_create( (dispatch_source_type_t)&_dispatch_source_type_timer,  0LL,  0LL,  (dispatch_queue_t)self->_schedulerQueue);
    if (v8)
    {
      dispatch_time_t v9 = dispatch_time(0xFFFFFFFFFFFFFFFELL, (uint64_t)(a3 * 1000000000.0));
      dispatch_source_set_timer(v8, v9, 0xFFFFFFFFFFFFFFFFLL, 0LL);
      objc_initWeak((id *)buf, self);
      handler[0] = _NSConcreteStackBlock;
      handler[1] = 3221225472LL;
      handler[2] = sub_1000950D8;
      handler[3] = &unk_1001CA360;
      objc_copyWeak(v17, (id *)buf);
      v17[1] = *(id *)&a3;
      dispatch_source_set_registration_handler(v8, handler);
      v14[0] = _NSConcreteStackBlock;
      v14[1] = 3221225472LL;
      v14[2] = sub_10009513C;
      v14[3] = &unk_1001CA360;
      objc_copyWeak(v15, (id *)buf);
      v15[1] = *(id *)&a3;
      dispatch_source_set_cancel_handler(v8, v14);
      v12[0] = _NSConcreteStackBlock;
      v12[1] = 3221225472LL;
      v12[2] = sub_1000951A0;
      v12[3] = &unk_1001CA360;
      objc_copyWeak(v13, (id *)buf);
      v13[1] = *(id *)&a3;
      dispatch_source_set_event_handler(v8, v12);
      dispatch_resume(v8);
      objc_storeStrong((id *)&self->_schedulerSource, v8);
      objc_destroyWeak(v13);
      objc_destroyWeak(v15);
      objc_destroyWeak(v17);
      objc_destroyWeak((id *)buf);
    }

    else
    {
      uint64_t v10 = _AKLogSystem(0LL);
      uint64_t v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
      if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT)) {
        sub_10013DA74((uint64_t)self, v11, a3);
      }
    }
  }

- (void)_unsafe_cancelScheduler
{
  source = self->_schedulerSource;
  if (source) {
    dispatch_source_cancel((dispatch_source_t)source);
  }
  schedulerSource = self->_schedulerSource;
  self->_schedulerSource = 0LL;
}

- (void)_unsafe_schedulerSourceDidFire
{
  uint64_t v4 = _AKLogSystem(v3);
  uint64_t v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    sub_10013DBC8((uint64_t)self, v5, v6);
  }

  os_unfair_lock_lock(&self->_scheduledRequestsLock);
  while (-[AKRequestDispatcher _unsafe_executeNextScheduledRequest](self, "_unsafe_executeNextScheduledRequest"))
    ;
  os_unfair_lock_unlock(&self->_scheduledRequestsLock);
  -[AKRequestDispatcher _unsafe_scheduleNextRequest](self, "_unsafe_scheduleNextRequest");
}

- (BOOL)_unsafe_executeNextScheduledRequest
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray firstObject](self->_scheduledRequests, "firstObject"));
  BOOL v4 = -[AKRequestDispatcher _executeScheduledRequest:](self, "_executeScheduledRequest:", v3);
  if (v4 && -[NSMutableArray count](self->_scheduledRequests, "count")) {
    -[NSMutableArray removeObjectAtIndex:](self->_scheduledRequests, "removeObjectAtIndex:", 0LL);
  }

  return v4;
}

- (BOOL)_executeScheduledRequest:(id)a3
{
  id v4 = a3;
  uint64_t v5 = v4;
  if (v4
    && (uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue([v4 calculation]),
        BOOL v7 = (void *)objc_claimAutoreleasedReturnValue([v6 dispatchDate]),
        [v7 timeIntervalSinceNow],
        double v9 = v8,
        v7,
        v6,
        v9 <= 0.0))
  {
    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue([v5 calculation]);
    uint64_t v11 = (os_log_s *)objc_claimAutoreleasedReturnValue([v13 headerValue]);

    if (v11)
    {
      BOOL v15 = (void *)objc_claimAutoreleasedReturnValue([v5 request]);
      uint64_t v32 = AKDispatchingAlgorithmStateHeader;
      v33 = v11;
      int v16 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v33,  &v32,  1LL));
      [v15 setAdditionalHeaders:v16];
    }

    uint64_t v17 = _AKLogSystem(v14);
    __int16 v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(v17);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      id v19 = (void *)objc_claimAutoreleasedReturnValue([v5 request]);
      __int16 v20 = (void *)objc_claimAutoreleasedReturnValue([v5 calculation]);
      *(_DWORD *)buf = 138412802;
      v27 = self;
      __int16 v28 = 2112;
      v29 = v19;
      __int16 v30 = 2112;
      v31 = v20;
      _os_log_impl( (void *)&_mh_execute_header,  v18,  OS_LOG_TYPE_DEFAULT,  "%@: Executing request (%@) with calculation (%@)",  buf,  0x20u);
    }

    objc_initWeak((id *)buf, self);
    double v21 = (void *)objc_claimAutoreleasedReturnValue([v5 request]);
    v23[0] = _NSConcreteStackBlock;
    v23[1] = 3221225472LL;
    v23[2] = sub_10009564C;
    v23[3] = &unk_1001CA388;
    objc_copyWeak(&v25, (id *)buf);
    id v24 = v5;
    [v21 executeWithResponseHandler:v23];

    objc_destroyWeak(&v25);
    objc_destroyWeak((id *)buf);
    BOOL v12 = 1;
  }

  else
  {
    uint64_t v10 = _AKLogSystem(v4);
    uint64_t v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
      sub_10013DC40((uint64_t)self, v5, v11);
    }
    BOOL v12 = 0;
  }

  return v12;
}

- (void)_invalidateScheduledRequest:(id)a3 withErrorCode:(int64_t)a4
{
  id v6 = (id)objc_claimAutoreleasedReturnValue([a3 request]);
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSError ak_errorWithCode:](&OBJC_CLASS___NSError, "ak_errorWithCode:", a4));
  [v6 invalidateWithError:v5];
}

- (id)_dispatchingAlgorithmForInfo:(id)a3
{
  id v4 = a3;
  os_unfair_lock_lock(&self->_dispatchingAlgorithmsByInfoLock);
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_dispatchingAlgorithmsByInfo,  "objectForKeyedSubscript:",  v4));
  id v6 = [v4 mutableCopy];
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  __int128 v18 = 0u;
  id v7 = (id)objc_claimAutoreleasedReturnValue(-[AKRequestDispatcher _orderedDispatchingInfoKeys](self, "_orderedDispatchingInfoKeys"));
  id v8 = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v16;
LABEL_3:
    uint64_t v11 = 0LL;
    while (1)
    {
      if (*(void *)v16 != v10) {
        objc_enumerationMutation(v7);
      }
      if (v5) {
        break;
      }
      objc_msgSend(v6, "removeObjectForKey:", *(void *)(*((void *)&v15 + 1) + 8 * v11), (void)v15);
      dispatchingAlgorithmsByInfo = self->_dispatchingAlgorithmsByInfo;
      id v13 = [v6 copy];
      uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( dispatchingAlgorithmsByInfo,  "objectForKeyedSubscript:",  v13));

      if (v9 == (id)++v11)
      {
        id v9 = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
        if (v9) {
          goto LABEL_3;
        }
        break;
      }
    }
  }

  os_unfair_lock_unlock(&self->_dispatchingAlgorithmsByInfoLock);
  return v5;
}

- (void)_setDispatchingAlgorithm:(id)a3 forInfo:(id)a4
{
  p_dispatchingAlgorithmsByInfoLock = &self->_dispatchingAlgorithmsByInfoLock;
  id v7 = a4;
  id v8 = a3;
  os_unfair_lock_lock(p_dispatchingAlgorithmsByInfoLock);
  -[NSMutableDictionary setObject:forKeyedSubscript:]( self->_dispatchingAlgorithmsByInfo,  "setObject:forKeyedSubscript:",  v8,  v7);

  os_unfair_lock_unlock(p_dispatchingAlgorithmsByInfoLock);
}

- (void)_updateDispatchingAlgorithmForInfo:(id)a3 withResponse:(id)a4
{
  id v32 = a3;
  id v6 = a4;
  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[AKRequestDispatcher _dispatchingAlgorithmForInfo:](self, "_dispatchingAlgorithmForInfo:", v32));

  if (!v7)
  {
    uint64_t v9 = objc_opt_class(&OBJC_CLASS___NSString, v8);
    id v10 = (id)objc_claimAutoreleasedReturnValue([v6 objectForKeyedSubscript:@"ralg"]);
    if ((objc_opt_isKindOfClass(v10, v9) & 1) != 0) {
      id v11 = v10;
    }
    else {
      id v11 = 0LL;
    }

    uint64_t v13 = objc_opt_class(&OBJC_CLASS___NSNumber, v12);
    id v14 = (id)objc_claimAutoreleasedReturnValue([v6 objectForKeyedSubscript:@"maxqueue_size"]);
    if ((objc_opt_isKindOfClass(v14, v13) & 1) != 0) {
      id v15 = v14;
    }
    else {
      id v15 = 0LL;
    }

    id v16 = [v15 unsignedIntegerValue];
    if (v16) {
      uint64_t v17 = (uint64_t)v16;
    }
    else {
      uint64_t v17 = 10LL;
    }

    if ([v11 isEqualToString:@"E"])
    {
      uint64_t v19 = objc_opt_class(&OBJC_CLASS___NSNumber, v18);
      id v20 = (id)objc_claimAutoreleasedReturnValue([v6 objectForKeyedSubscript:@"base"]);
      if ((objc_opt_isKindOfClass(v20, v19) & 1) != 0) {
        id v21 = v20;
      }
      else {
        id v21 = 0LL;
      }

      [v21 doubleValue];
      double v27 = v26;

      __int16 v28 = -[AKExponentialDispatchingAlgorithm initWithBase:maxQueueSize:]( objc_alloc(&OBJC_CLASS___AKExponentialDispatchingAlgorithm),  "initWithBase:maxQueueSize:",  v17,  v27);
    }

    else
    {
      if (![v11 isEqualToString:@"D"])
      {
        v29 = 0LL;
LABEL_23:
        -[AKRequestDispatcher _setDispatchingAlgorithm:forInfo:](self, "_setDispatchingAlgorithm:forInfo:", v29, v32);

        goto LABEL_24;
      }

      uint64_t v23 = objc_opt_class(&OBJC_CLASS___NSNumber, v22);
      id v24 = (id)objc_claimAutoreleasedReturnValue([v6 objectForKeyedSubscript:@"delay"]);
      if ((objc_opt_isKindOfClass(v24, v23) & 1) != 0) {
        id v25 = v24;
      }
      else {
        id v25 = 0LL;
      }

      [v25 doubleValue];
      double v31 = v30;

      __int16 v28 = -[AKConstantDispatchingAlgorithm initWithDelay:maxQueueSize:]( objc_alloc(&OBJC_CLASS___AKConstantDispatchingAlgorithm),  "initWithDelay:maxQueueSize:",  v17,  v31);
    }

    v29 = v28;
    goto LABEL_23;
  }

- (id)_nextScheduledRequest
{
  p_scheduledRequestsLock = &self->_scheduledRequestsLock;
  os_unfair_lock_lock(&self->_scheduledRequestsLock);
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray firstObject](self->_scheduledRequests, "firstObject"));
  os_unfair_lock_unlock(p_scheduledRequestsLock);
  return v4;
}

- (void)_insertScheduledRequest:(id)a3
{
  id v11 = a3;
  os_unfair_lock_lock(&self->_scheduledRequestsLock);
  if (-[NSMutableArray count](self->_scheduledRequests, "count"))
  {
    uint64_t v4 = 0LL;
    while (1)
    {
      uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableArray objectAtIndexedSubscript:]( self->_scheduledRequests,  "objectAtIndexedSubscript:",  v4));
      id v6 = (void *)objc_claimAutoreleasedReturnValue([v11 calculation]);
      id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 dispatchDate]);
      uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v5 calculation]);
      uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([v8 dispatchDate]);
      id v10 = [v7 compare:v9];

      if (v10 == (id)1) {
        break;
      }
    }
  }

  else
  {
LABEL_5:
    uint64_t v4 = 0LL;
  }

  -[NSMutableArray insertObject:atIndex:](self->_scheduledRequests, "insertObject:atIndex:", v11, v4);
  os_unfair_lock_unlock(&self->_scheduledRequestsLock);
}

- (id)_orderedDispatchingInfoKeys
{
  if (qword_10020F568 != -1) {
    dispatch_once(&qword_10020F568, &stru_1001CA3A8);
  }
  return (id)qword_10020F560;
}

- (void).cxx_destruct
{
}

@end