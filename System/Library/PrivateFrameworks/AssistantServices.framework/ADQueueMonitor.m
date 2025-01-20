@interface ADQueueMonitor
+ (id)sharedMonitor;
- (ADQueueMonitor)init;
- (void)_addQueue:(id)a3 heartBeatInterval:(double)a4 timeoutInterval:(double)a5 timeoutHandler:(id)a6;
- (void)_beginMonitoring;
- (void)_endMonitoring;
- (void)_removeQueue:(id)a3;
- (void)addQueue:(id)a3 heartBeatInterval:(double)a4 timeoutInterval:(double)a5 timeoutHandler:(id)a6;
- (void)beginMonitoring;
- (void)endMonitoring;
- (void)removeQueue:(id)a3;
@end

@implementation ADQueueMonitor

- (ADQueueMonitor)init
{
  v12.receiver = self;
  v12.super_class = (Class)&OBJC_CLASS___ADQueueMonitor;
  v2 = -[ADQueueMonitor init](&v12, "init");
  if (v2)
  {
    dispatch_queue_attr_t v3 = dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v4 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v3);
    dispatch_queue_attr_t v5 = dispatch_queue_attr_make_with_qos_class(v4, QOS_CLASS_DEFAULT, 0);
    v6 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v5);

    dispatch_queue_t v7 = dispatch_queue_create("com.apple.assistant.queue-monitor", v6);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v7;

    v9 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    observersByIdentifier = v2->_observersByIdentifier;
    v2->_observersByIdentifier = v9;
  }

  return v2;
}

- (void)addQueue:(id)a3 heartBeatInterval:(double)a4 timeoutInterval:(double)a5 timeoutHandler:(id)a6
{
  id v10 = a3;
  id v11 = a6;
  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1002F6D98;
  block[3] = &unk_1004FB3F8;
  block[4] = self;
  id v16 = v10;
  double v18 = a4;
  double v19 = a5;
  id v17 = v11;
  id v13 = v11;
  id v14 = v10;
  dispatch_async(queue, block);
}

- (void)removeQueue:(id)a3
{
  id v4 = a3;
  queue = (dispatch_queue_s *)self->_queue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_1002F6D8C;
  v7[3] = &unk_1004FD968;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

- (void)beginMonitoring
{
  dispatch_queue_attr_t v3 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315138;
    dispatch_queue_t v7 = "-[ADQueueMonitor beginMonitoring]";
    _os_log_debug_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEBUG, "%s ", buf, 0xCu);
  }

  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1002F6D84;
  block[3] = &unk_1004FD940;
  block[4] = self;
  dispatch_async(queue, block);
}

- (void)endMonitoring
{
  dispatch_queue_attr_t v3 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315138;
    dispatch_queue_t v7 = "-[ADQueueMonitor endMonitoring]";
    _os_log_debug_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEBUG, "%s ", buf, 0xCu);
  }

  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1002F6D7C;
  block[3] = &unk_1004FD940;
  block[4] = self;
  dispatch_async(queue, block);
}

- (void)_addQueue:(id)a3 heartBeatInterval:(double)a4 timeoutInterval:(double)a5 timeoutHandler:(id)a6
{
  id v10 = (dispatch_queue_s *)a3;
  id v11 = a6;
  objc_super v12 = -[NSString initWithUTF8String:]( objc_alloc(&OBJC_CLASS___NSString),  "initWithUTF8String:",  dispatch_queue_get_label(v10));
  id v13 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](self->_observersByIdentifier, "objectForKey:", v12));

  if (v13)
  {
    id v14 = (os_log_s *)AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR))
    {
      int v16 = 136315394;
      id v17 = "-[ADQueueMonitor _addQueue:heartBeatInterval:timeoutInterval:timeoutHandler:]";
      __int16 v18 = 2112;
      double v19 = v10;
      _os_log_error_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_ERROR,  "%s Queue %@ is already being observed.",  (uint8_t *)&v16,  0x16u);
    }
  }

  -[ADQueueMonitor _removeQueue:](self, "_removeQueue:", v10);
  v15 = -[_ADQueueObserver initWithQueue:heartBeatInterval:timeoutInterval:timeoutHandler:]( objc_alloc(&OBJC_CLASS____ADQueueObserver),  "initWithQueue:heartBeatInterval:timeoutInterval:timeoutHandler:",  v10,  v11,  a4,  a5);

  -[NSMutableDictionary setObject:forKey:](self->_observersByIdentifier, "setObject:forKey:", v15, v12);
  if (self->_numberOfTransactions >= 1) {
    -[_ADQueueObserver startWithQueue:](v15, "startWithQueue:", self->_queue);
  }
}

- (void)_removeQueue:(id)a3
{
  id v4 = (dispatch_queue_s *)a3;
  dispatch_queue_attr_t v5 = objc_alloc(&OBJC_CLASS___NSString);
  label = dispatch_queue_get_label(v4);

  id v8 = -[NSString initWithUTF8String:](v5, "initWithUTF8String:", label);
  dispatch_queue_t v7 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](self->_observersByIdentifier, "objectForKey:"));
  if (v7)
  {
    -[NSMutableDictionary removeObjectForKey:](self->_observersByIdentifier, "removeObjectForKey:", v8);
    [v7 stop];
  }
}

- (void)_beginMonitoring
{
  int64_t numberOfTransactions = self->_numberOfTransactions;
  if (!numberOfTransactions)
  {
    id v4 = (os_log_s *)AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136315138;
      int v16 = "-[ADQueueMonitor _beginMonitoring]";
      _os_log_debug_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEBUG, "%s ", buf, 0xCu);
    }

    __int128 v12 = 0u;
    __int128 v13 = 0u;
    __int128 v10 = 0u;
    __int128 v11 = 0u;
    dispatch_queue_attr_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary allValues](self->_observersByIdentifier, "allValues", 0LL));
    id v6 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    if (v6)
    {
      id v7 = v6;
      uint64_t v8 = *(void *)v11;
      do
      {
        v9 = 0LL;
        do
        {
          if (*(void *)v11 != v8) {
            objc_enumerationMutation(v5);
          }
          [*(id *)(*((void *)&v10 + 1) + 8 * (void)v9) startWithQueue:self->_queue];
          v9 = (char *)v9 + 1;
        }

        while (v7 != v9);
        id v7 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
      }

      while (v7);
    }

    int64_t numberOfTransactions = self->_numberOfTransactions;
  }

  self->_int64_t numberOfTransactions = numberOfTransactions + 1;
}

- (void)_endMonitoring
{
  int64_t numberOfTransactions = self->_numberOfTransactions;
  if (numberOfTransactions == 1)
  {
    id v4 = (os_log_s *)AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136315138;
      int v16 = "-[ADQueueMonitor _endMonitoring]";
      _os_log_debug_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEBUG, "%s ", buf, 0xCu);
    }

    __int128 v12 = 0u;
    __int128 v13 = 0u;
    __int128 v10 = 0u;
    __int128 v11 = 0u;
    dispatch_queue_attr_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary allValues](self->_observersByIdentifier, "allValues", 0LL));
    id v6 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    if (v6)
    {
      id v7 = v6;
      uint64_t v8 = *(void *)v11;
      do
      {
        v9 = 0LL;
        do
        {
          if (*(void *)v11 != v8) {
            objc_enumerationMutation(v5);
          }
          [*(id *)(*((void *)&v10 + 1) + 8 * (void)v9) stop];
          v9 = (char *)v9 + 1;
        }

        while (v7 != v9);
        id v7 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
      }

      while (v7);
    }

    int64_t numberOfTransactions = self->_numberOfTransactions;
  }

  self->_int64_t numberOfTransactions = numberOfTransactions - 1;
}

- (void).cxx_destruct
{
}

+ (id)sharedMonitor
{
  if (qword_100578510 != -1) {
    dispatch_once(&qword_100578510, &stru_1004FB3D0);
  }
  return (id)qword_100578518;
}

@end