@interface ADClientLiteListener
- (ADClientLiteListener)init;
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (void)_decrementAndTestExecutionCount;
- (void)_doDelayedClientWorkIfAny:(id)a3;
- (void)_incrementAndTestExecutionCount;
- (void)doClientWork:(id)a3 withTimeoutBlock:(id)a4;
- (void)doDelayedClientWorkIfAny;
- (void)listen;
@end

@implementation ADClientLiteListener

- (ADClientLiteListener)init
{
  v13.receiver = self;
  v13.super_class = (Class)&OBJC_CLASS___ADClientLiteListener;
  v2 = -[ADClientLiteListener init](&v13, "init");
  if (v2)
  {
    v3 = objc_alloc(&OBJC_CLASS___NSXPCListener);
    v4 = -[NSXPCListener initWithMachServiceName:](v3, "initWithMachServiceName:", AFClientLiteServiceName);
    listener = v2->_listener;
    v2->_listener = v4;

    -[NSXPCListener setDelegate:](v2->_listener, "setDelegate:", v2);
    dispatch_queue_attr_t v6 = dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v7 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v6);
    dispatch_queue_t v8 = dispatch_queue_create(0LL, v7);

    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v8;

    v10 = objc_alloc_init(&OBJC_CLASS___AFQueue);
    workItemQueue = v2->_workItemQueue;
    v2->_workItemQueue = v10;

    v2->_executionCount = 0LL;
  }

  return v2;
}

- (void)listen
{
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v5 = a4;
  uint64_t v6 = AFClientLiteEntitlement;
  char HasEntitlement = AFConnectionHasEntitlement(v5, AFClientLiteEntitlement);
  if ((HasEntitlement & 1) != 0)
  {
    uint64_t v8 = AFClientLiteClientObjectInterface();
    v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
    [v5 setRemoteObjectInterface:v9];

    uint64_t v10 = AFClientLiteRemoteObjectInterface();
    v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
    [v5 setExportedInterface:v11];

    v12 = -[ADClientLite initWithListener:connection:]( objc_alloc(&OBJC_CLASS___ADClientLite),  "initWithListener:connection:",  self,  v5);
    [v5 setExportedObject:v12];

    [v5 resume];
  }

  else
  {
    objc_super v13 = (void *)AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR))
    {
      v15 = v13;
      int v16 = 136315650;
      v17 = "-[ADClientLiteListener listener:shouldAcceptNewConnection:]";
      __int16 v18 = 1026;
      unsigned int v19 = [v5 processIdentifier];
      __int16 v20 = 2112;
      uint64_t v21 = v6;
      _os_log_error_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_ERROR,  "%s Client with pid %{public}d does not have entitlement %@",  (uint8_t *)&v16,  0x1Cu);
    }
  }

  return HasEntitlement;
}

- (void)doClientWork:(id)a3 withTimeoutBlock:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    v17 = "-[ADClientLiteListener doClientWork:withTimeoutBlock:]";
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "%s ", buf, 0xCu);
  }

  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10014FF24;
  block[3] = &unk_1004FBE08;
  block[4] = self;
  id v14 = v6;
  id v15 = v7;
  id v10 = v7;
  id v11 = v6;
  v12 = queue;
  dispatch_async(v12, block);
}

- (void)doDelayedClientWorkIfAny
{
  v3 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG))
  {
    int v4 = 136315138;
    id v5 = "-[ADClientLiteListener doDelayedClientWorkIfAny]";
    _os_log_debug_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEBUG, "%s ", (uint8_t *)&v4, 0xCu);
  }

  -[ADClientLiteListener _doDelayedClientWorkIfAny:](self, "_doDelayedClientWorkIfAny:", self->_queue);
}

- (void)_doDelayedClientWorkIfAny:(id)a3
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10014FDDC;
  block[3] = &unk_1004FD940;
  block[4] = self;
  dispatch_async((dispatch_queue_t)a3, block);
}

- (void)_incrementAndTestExecutionCount
{
  int64_t executionCount = self->_executionCount;
  self->_int64_t executionCount = executionCount + 1;
  if (executionCount >= 1)
  {
    v3 = (os_log_s *)AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR))
    {
      int v4 = 136315138;
      id v5 = "-[ADClientLiteListener _incrementAndTestExecutionCount]";
      _os_log_error_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_ERROR,  "%s Unexpected execution count. File radar.",  (uint8_t *)&v4,  0xCu);
    }
  }

- (void)_decrementAndTestExecutionCount
{
  int64_t v2 = self->_executionCount - 1;
  self->_int64_t executionCount = v2;
  if (v2)
  {
    v3 = (os_log_s *)AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR))
    {
      int v4 = 136315138;
      id v5 = "-[ADClientLiteListener _decrementAndTestExecutionCount]";
      _os_log_error_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_ERROR,  "%s Unexpected execution count. File radar.",  (uint8_t *)&v4,  0xCu);
    }
  }

- (void).cxx_destruct
{
}

@end