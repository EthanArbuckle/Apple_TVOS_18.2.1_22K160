@interface _ADQueueObserver
- (_ADQueueObserver)initWithQueue:(id)a3 heartBeatInterval:(double)a4 timeoutInterval:(double)a5 timeoutHandler:(id)a6;
- (void)heartBeatFiredWithQueue:(id)a3;
- (void)startWithQueue:(id)a3;
- (void)stop;
- (void)timeoutDetected;
@end

@implementation _ADQueueObserver

- (_ADQueueObserver)initWithQueue:(id)a3 heartBeatInterval:(double)a4 timeoutInterval:(double)a5 timeoutHandler:(id)a6
{
  id v11 = a3;
  id v12 = a6;
  v18.receiver = self;
  v18.super_class = (Class)&OBJC_CLASS____ADQueueObserver;
  v13 = -[_ADQueueObserver init](&v18, "init");
  v14 = v13;
  if (v13)
  {
    objc_storeStrong((id *)&v13->_queue, a3);
    v14->_heartBeatInterval = a4;
    v14->_timeoutInterval = a5;
    id v15 = [v12 copy];
    id timeoutHandler = v14->_timeoutHandler;
    v14->_id timeoutHandler = v15;
  }

  return v14;
}

- (void)startWithQueue:(id)a3
{
  id v4 = a3;
  if (!self->_heartBeat)
  {
    v5 = (os_log_s *)AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG))
    {
      queue = self->_queue;
      *(_DWORD *)location = 136315394;
      *(void *)&location[4] = "-[_ADQueueObserver startWithQueue:]";
      __int16 v16 = 2112;
      v17 = queue;
      _os_log_debug_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "%s queue = %@", location, 0x16u);
    }

    v6 = -[NSString initWithFormat:]( objc_alloc(&OBJC_CLASS___NSString),  "initWithFormat:",  @"com.apple.assistant.queue-observer.%s",  dispatch_queue_get_label((dispatch_queue_t)self->_queue));
    objc_initWeak((id *)location, self);
    v7 = objc_alloc(&OBJC_CLASS___AFHeartBeat);
    double heartBeatInterval = self->_heartBeatInterval;
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472LL;
    v12[2] = sub_1002F6D40;
    v12[3] = &unk_1004FB420;
    objc_copyWeak(&v14, (id *)location);
    id v13 = v4;
    v9 = -[AFHeartBeat initWithIdentifier:queue:effectiveDate:expirationDuration:heartBeatInterval:heartBeatHandler:invalidationHandler:]( v7,  "initWithIdentifier:queue:effectiveDate:expirationDuration:heartBeatInterval:heartBeatHandler:invalidationHandler:",  v6,  v13,  0LL,  v12,  0LL,  0.0,  heartBeatInterval);
    heartBeat = self->_heartBeat;
    self->_heartBeat = v9;

    objc_destroyWeak(&v14);
    objc_destroyWeak((id *)location);
  }
}

- (void)stop
{
  heartBeat = self->_heartBeat;
  if (heartBeat)
  {
    id v4 = (os_log_s *)AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG))
    {
      queue = self->_queue;
      int v7 = 136315394;
      v8 = "-[_ADQueueObserver stop]";
      __int16 v9 = 2112;
      v10 = queue;
      _os_log_debug_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEBUG, "%s queue = %@", (uint8_t *)&v7, 0x16u);
      heartBeat = self->_heartBeat;
    }

    -[AFHeartBeat invalidate](heartBeat, "invalidate");
    v5 = self->_heartBeat;
    self->_heartBeat = 0LL;
  }

- (void)heartBeatFiredWithQueue:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  uint64_t v23 = 0LL;
  v24 = &v23;
  uint64_t v25 = 0x3032000000LL;
  v26 = sub_1002F6C68;
  v27 = sub_1002F6C78;
  id v28 = 0LL;
  v5 = objc_alloc(&OBJC_CLASS___AFSafetyBlock);
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472LL;
  v21[2] = sub_1002F6C80;
  v21[3] = &unk_1004FB448;
  objc_copyWeak(&v22, &location);
  v6 = -[AFSafetyBlock initWithBlock:](v5, "initWithBlock:", v21);
  int v7 = objc_alloc(&OBJC_CLASS___AFWatchdogTimer);
  double timeoutInterval = self->_timeoutInterval;
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472LL;
  v19[2] = sub_1002F6CB8;
  v19[3] = &unk_1004FD940;
  __int16 v9 = v6;
  v20 = v9;
  v10 = -[AFWatchdogTimer initWithTimeoutInterval:onQueue:timeoutHandler:]( v7,  "initWithTimeoutInterval:onQueue:timeoutHandler:",  v4,  v19,  timeoutInterval);
  id v11 = (void *)v24[5];
  v24[5] = (uint64_t)v10;

  [(id)v24[5] start];
  queue = (dispatch_queue_s *)self->_queue;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472LL;
  v15[2] = sub_1002F6CC4;
  v15[3] = &unk_1004FBE80;
  __int16 v16 = v9;
  id v17 = v4;
  objc_super v18 = &v23;
  id v13 = v4;
  id v14 = v9;
  dispatch_async(queue, v15);

  objc_destroyWeak(&v22);
  _Block_object_dispose(&v23, 8);

  objc_destroyWeak(&location);
}

- (void)timeoutDetected
{
  unint64_t v3 = self->_numberOfOccurrences + 1;
  self->_numberOfOccurrences = v3;
  id v4 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR))
  {
    queue = self->_queue;
    int v7 = 136315650;
    v8 = "-[_ADQueueObserver timeoutDetected]";
    __int16 v9 = 2112;
    v10 = queue;
    __int16 v11 = 2048;
    unint64_t v12 = v3;
    _os_log_error_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_ERROR,  "%s queue = %@, numberOfOccurrences = %tu",  (uint8_t *)&v7,  0x20u);
  }

  id timeoutHandler = (void (**)(id, unint64_t))self->_timeoutHandler;
  if (timeoutHandler) {
    timeoutHandler[2](timeoutHandler, self->_numberOfOccurrences);
  }
}

- (void).cxx_destruct
{
}

@end