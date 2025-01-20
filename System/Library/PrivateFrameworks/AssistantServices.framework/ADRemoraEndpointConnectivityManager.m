@interface ADRemoraEndpointConnectivityManager
- (ADRemoraEndpointConnectivityManager)init;
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (void)endpointConnectivitySessionDidInvalidate:(id)a3;
@end

@implementation ADRemoraEndpointConnectivityManager

- (ADRemoraEndpointConnectivityManager)init
{
  v15.receiver = self;
  v15.super_class = (Class)&OBJC_CLASS___ADRemoraEndpointConnectivityManager;
  v2 = -[ADRemoraEndpointConnectivityManager init](&v15, "init");
  if (v2)
  {
    dispatch_queue_attr_t v3 = dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v4 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v3);
    dispatch_queue_attr_t v5 = dispatch_queue_attr_make_with_qos_class(v4, QOS_CLASS_USER_INTERACTIVE, 0);
    v6 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v5);

    dispatch_queue_t v7 = dispatch_queue_create("com.apple.assistant.remora.endpoint-connectivity-manager", v6);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v7;

    v9 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    sessionsByUUID = v2->_sessionsByUUID;
    v2->_sessionsByUUID = v9;

    v11 = objc_alloc(&OBJC_CLASS___NSXPCListener);
    v12 = -[NSXPCListener initWithMachServiceName:]( v11,  "initWithMachServiceName:",  kAssistantEndpointConnectivityServiceName);
    xpcListener = v2->_xpcListener;
    v2->_xpcListener = v12;

    -[NSXPCListener _setQueue:](v2->_xpcListener, "_setQueue:", v2->_queue);
    -[NSXPCListener setDelegate:](v2->_xpcListener, "setDelegate:", v2);
    -[NSXPCListener resume](v2->_xpcListener, "resume");
  }

  return v2;
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  v6 = (ADRemoraEndpointConnectivitySession *)a4;
  queue = (dispatch_queue_s *)self->_queue;
  v8 = (NSXPCListener *)a3;
  dispatch_assert_queue_V2(queue);
  xpcListener = self->_xpcListener;

  if (xpcListener != v8)
  {
LABEL_10:
    BOOL v16 = 0;
    goto LABEL_11;
  }

  int HasEntitlement = AFConnectionHasEntitlement(v6, kAssistantEndpointConnectivityServiceEntitlement);
  v11 = (os_log_s *)AFSiriLogContextDaemon;
  if (!HasEntitlement)
  {
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR))
    {
      int v18 = 136315394;
      v19 = "-[ADRemoraEndpointConnectivityManager listener:shouldAcceptNewConnection:]";
      __int16 v20 = 2112;
      v21 = v6;
      _os_log_error_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_ERROR, "%s Reject %@", (uint8_t *)&v18, 0x16u);
    }

    goto LABEL_10;
  }

  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    int v18 = 136315394;
    v19 = "-[ADRemoraEndpointConnectivityManager listener:shouldAcceptNewConnection:]";
    __int16 v20 = 2112;
    v21 = v6;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "%s Accept %@", (uint8_t *)&v18, 0x16u);
  }

  v12 = -[ADRemoraEndpointConnectivitySession initWithQueue:xpcConnection:delegate:]( objc_alloc(&OBJC_CLASS___ADRemoraEndpointConnectivitySession),  "initWithQueue:xpcConnection:delegate:",  self->_queue,  v6,  self);
  v13 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    int v18 = 136315394;
    v19 = "-[ADRemoraEndpointConnectivityManager listener:shouldAcceptNewConnection:]";
    __int16 v20 = 2112;
    v21 = v12;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "%s Add %@", (uint8_t *)&v18, 0x16u);
  }

  sessionsByUUID = self->_sessionsByUUID;
  objc_super v15 = (void *)objc_claimAutoreleasedReturnValue(-[ADRemoraEndpointConnectivitySession sessionUUID](v12, "sessionUUID"));
  -[NSMutableDictionary setObject:forKey:](sessionsByUUID, "setObject:forKey:", v12, v15);

  BOOL v16 = 1;
LABEL_11:

  return v16;
}

- (void)endpointConnectivitySessionDidInvalidate:(id)a3
{
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  dispatch_queue_attr_t v5 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    int v8 = 136315394;
    v9 = "-[ADRemoraEndpointConnectivityManager endpointConnectivitySessionDidInvalidate:]";
    __int16 v10 = 2112;
    id v11 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "%s Remove %@", (uint8_t *)&v8, 0x16u);
  }

  sessionsByUUID = self->_sessionsByUUID;
  dispatch_queue_t v7 = (void *)objc_claimAutoreleasedReturnValue([v4 sessionUUID]);
  -[NSMutableDictionary removeObjectForKey:](sessionsByUUID, "removeObjectForKey:", v7);
}

- (void).cxx_destruct
{
}

@end