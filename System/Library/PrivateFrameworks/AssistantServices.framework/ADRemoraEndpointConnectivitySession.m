@interface ADRemoraEndpointConnectivitySession
- (ADRemoraEndpointConnectivitySession)initWithQueue:(id)a3 xpcConnection:(id)a4 delegate:(id)a5;
- (NSString)description;
- (NSUUID)sessionUUID;
- (id)_remoteServiceDelegateWithErrorHandler:(id)a3;
- (void)_clearXPCConnection;
- (void)_handleXPCConnectionInterruption;
- (void)_handleXPCConnectionInvalidation;
- (void)_invalidate;
- (void)_relinquishEndpointAssertion;
- (void)_tearDownEndpointConnection;
- (void)acquireAssertionWithCompletion:(id)a3;
- (void)dealloc;
- (void)endpointConnection:(id)a3 didChangeState:(int64_t)a4 error:(id)a5;
- (void)endpointConnection:(id)a3 didReceiveMessage:(id)a4 error:(id)a5;
- (void)endpointConnectionInvalidated:(id)a3;
- (void)releaseAssertionWithCompletion:(id)a3;
- (void)sendMessage:(id)a3 completion:(id)a4;
- (void)startWithEndpointUUID:(id)a3 applicationProtocol:(id)a4 serviceClass:(int64_t)a5 trafficClass:(int64_t)a6 completion:(id)a7;
- (void)stop;
@end

@implementation ADRemoraEndpointConnectivitySession

- (ADRemoraEndpointConnectivitySession)initWithQueue:(id)a3 xpcConnection:(id)a4 delegate:(id)a5
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  if (v10)
  {
    if (v11) {
      goto LABEL_3;
    }
  }

  else
  {
    v31 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"));
    [v31 handleFailureInMethod:a2, self, @"ADRemoraEndpointConnectivitySession.m", 36, @"Invalid parameter not satisfying: %@", @"queue != nil" object file lineNumber description];

    if (v11) {
      goto LABEL_3;
    }
  }

  v32 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"));
  [v32 handleFailureInMethod:a2, self, @"ADRemoraEndpointConnectivitySession.m", 37, @"Invalid parameter not satisfying: %@", @"xpcConnection != nil" object file lineNumber description];

LABEL_3:
  v38.receiver = self;
  v38.super_class = (Class)&OBJC_CLASS___ADRemoraEndpointConnectivitySession;
  v13 = -[ADRemoraEndpointConnectivitySession init](&v38, "init");
  v14 = v13;
  if (v13)
  {
    objc_storeStrong((id *)&v13->_queue, a3);
    v15 = objc_alloc_init(&OBJC_CLASS___NSUUID);
    sessionUUID = v14->_sessionUUID;
    v14->_sessionUUID = v15;

    objc_storeWeak((id *)&v14->_delegate, v12);
    objc_storeStrong((id *)&v14->_xpcConnection, a4);
    id v17 = -[NSXPCConnection _setQueue:](v14->_xpcConnection, "_setQueue:", v14->_queue);
    xpcConnection = v14->_xpcConnection;
    uint64_t XPCInterface = AFRemoraEndpointConnectivityServiceDelegateGetXPCInterface(v17);
    v20 = (void *)objc_claimAutoreleasedReturnValue(XPCInterface);
    -[NSXPCConnection setRemoteObjectInterface:](xpcConnection, "setRemoteObjectInterface:", v20);

    id v21 = -[NSXPCConnection setExportedObject:](v14->_xpcConnection, "setExportedObject:", v14);
    v22 = v14->_xpcConnection;
    uint64_t v23 = AFRemoraEndpointConnectivityServiceGetXPCInterface(v21);
    v24 = (void *)objc_claimAutoreleasedReturnValue(v23);
    -[NSXPCConnection setExportedInterface:](v22, "setExportedInterface:", v24);

    objc_initWeak(&location, v14);
    v25 = v14->_xpcConnection;
    v35[0] = _NSConcreteStackBlock;
    v35[1] = 3221225472LL;
    v35[2] = sub_100076D98;
    v35[3] = &unk_1004FAF58;
    objc_copyWeak(&v36, &location);
    -[NSXPCConnection setInvalidationHandler:](v25, "setInvalidationHandler:", v35);
    v26 = v14->_xpcConnection;
    v33[0] = _NSConcreteStackBlock;
    v33[1] = 3221225472LL;
    v33[2] = sub_100076DC4;
    v33[3] = &unk_1004FAF58;
    objc_copyWeak(&v34, &location);
    -[NSXPCConnection setInterruptionHandler:](v26, "setInterruptionHandler:", v33);
    -[NSXPCConnection resume](v14->_xpcConnection, "resume");
    v27 = (os_log_s *)AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG))
    {
      v29 = v14->_sessionUUID;
      *(_DWORD *)buf = 136315650;
      v40 = "-[ADRemoraEndpointConnectivitySession initWithQueue:xpcConnection:delegate:]";
      __int16 v41 = 2048;
      v42 = v14;
      __int16 v43 = 2112;
      v44 = v29;
      _os_log_debug_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEBUG, "%s %p sessionUUID = %@", buf, 0x20u);
      v27 = (os_log_s *)AFSiriLogContextDaemon;
    }

    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG))
    {
      v30 = v14->_xpcConnection;
      *(_DWORD *)buf = 136315650;
      v40 = "-[ADRemoraEndpointConnectivitySession initWithQueue:xpcConnection:delegate:]";
      __int16 v41 = 2048;
      v42 = v14;
      __int16 v43 = 2112;
      v44 = v30;
      _os_log_debug_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEBUG, "%s %p xpcConnection = %@", buf, 0x20u);
    }

    objc_destroyWeak(&v34);
    objc_destroyWeak(&v36);
    objc_destroyWeak(&location);
  }

  return v14;
}

- (void)dealloc
{
  v3 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG))
  {
    sessionUUID = self->_sessionUUID;
    *(_DWORD *)buf = 136315650;
    v7 = "-[ADRemoraEndpointConnectivitySession dealloc]";
    __int16 v8 = 2048;
    v9 = self;
    __int16 v10 = 2112;
    id v11 = sessionUUID;
    _os_log_debug_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEBUG, "%s %p sessionUUID = %@", buf, 0x20u);
  }

  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___ADRemoraEndpointConnectivitySession;
  -[ADRemoraEndpointConnectivitySession dealloc](&v5, "dealloc");
}

- (NSString)description
{
  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS___ADRemoraEndpointConnectivitySession;
  v3 = -[ADRemoraEndpointConnectivitySession description](&v7, "description");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  objc_super v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@ {sessionUUID = %@, isValid = %d}",  v4,  self->_sessionUUID,  !self->_isInvalid));

  return (NSString *)v5;
}

- (void)endpointConnection:(id)a3 didChangeState:(int64_t)a4 error:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  __int16 v10 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315906;
    v19 = "-[ADRemoraEndpointConnectivitySession endpointConnection:didChangeState:error:]";
    __int16 v20 = 2048;
    id v21 = self;
    __int16 v22 = 2048;
    int64_t v23 = a4;
    __int16 v24 = 2112;
    id v25 = v9;
    _os_log_debug_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEBUG, "%s %p state = %zd, error = %@", buf, 0x2Au);
  }

  queue = (dispatch_queue_s *)self->_queue;
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472LL;
  v14[2] = sub_100076B2C;
  v14[3] = &unk_1004FD510;
  v14[4] = self;
  id v15 = v8;
  id v16 = v9;
  int64_t v17 = a4;
  id v12 = v9;
  id v13 = v8;
  dispatch_async(queue, v14);
}

- (void)endpointConnection:(id)a3 didReceiveMessage:(id)a4 error:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315906;
    __int16 v22 = "-[ADRemoraEndpointConnectivitySession endpointConnection:didReceiveMessage:error:]";
    __int16 v23 = 2048;
    __int16 v24 = self;
    __int16 v25 = 2112;
    id v26 = v9;
    __int16 v27 = 2112;
    id v28 = v10;
    _os_log_debug_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEBUG,  "%s %p payload = %@, error = %@",  buf,  0x2Au);
  }

  id v12 = [v9 copy];
  queue = (dispatch_queue_s *)self->_queue;
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472LL;
  v17[2] = sub_1000768C0;
  v17[3] = &unk_1004FD470;
  v17[4] = self;
  id v18 = v8;
  id v19 = v12;
  id v20 = v10;
  id v14 = v10;
  id v15 = v12;
  id v16 = v8;
  dispatch_async(queue, v17);
}

- (void)endpointConnectionInvalidated:(id)a3
{
  id v4 = a3;
  objc_super v5 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315394;
    id v11 = "-[ADRemoraEndpointConnectivitySession endpointConnectionInvalidated:]";
    __int16 v12 = 2048;
    id v13 = self;
    _os_log_debug_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "%s %p", buf, 0x16u);
  }

  queue = (dispatch_queue_s *)self->_queue;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = sub_1000767D0;
  v8[3] = &unk_1004FD968;
  v8[4] = self;
  id v9 = v4;
  id v7 = v4;
  dispatch_async(queue, v8);
}

- (void)startWithEndpointUUID:(id)a3 applicationProtocol:(id)a4 serviceClass:(int64_t)a5 trafficClass:(int64_t)a6 completion:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = (void (**)(id, void *))a7;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (self->_isInvalid)
  {
    id v15 = (os_log_s *)AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR))
    {
      int v23 = 136315394;
      __int16 v24 = "-[ADRemoraEndpointConnectivitySession startWithEndpointUUID:applicationProtocol:serviceClass:trafficClass:completion:]";
      __int16 v25 = 2048;
      id v26 = self;
      _os_log_error_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_ERROR,  "%s %p Ignored because the session is invalidated.",  (uint8_t *)&v23,  0x16u);
      if (!v14) {
        goto LABEL_10;
      }
      goto LABEL_4;
    }

    if (v14)
    {
LABEL_4:
      uint64_t v16 = 23LL;
LABEL_9:
      id v18 = (void *)objc_claimAutoreleasedReturnValue(+[AFError errorWithCode:](&OBJC_CLASS___AFError, "errorWithCode:", v16));
      v14[2](v14, v18);
    }
  }

  else
  {
    if (self->_endpointConnection)
    {
      int64_t v17 = (os_log_s *)AFSiriLogContextDaemon;
      if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR))
      {
        int v23 = 136315394;
        __int16 v24 = "-[ADRemoraEndpointConnectivitySession startWithEndpointUUID:applicationProtocol:serviceClass:trafficClass:completion:]";
        __int16 v25 = 2048;
        id v26 = self;
        _os_log_error_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_ERROR,  "%s %p Ignored because the endpoint connection has already been set up.",  (uint8_t *)&v23,  0x16u);
        if (!v14) {
          goto LABEL_10;
        }
      }

      else if (!v14)
      {
        goto LABEL_10;
      }

      uint64_t v16 = 45LL;
      goto LABEL_9;
    }

    id v19 = -[ADRemoraEndpointConnection initWithEndpointIdentifier:applicationProtocolName:queue:serviceClass:trafficClass:delegate:]( objc_alloc(&OBJC_CLASS___ADRemoraEndpointConnection),  "initWithEndpointIdentifier:applicationProtocolName:queue:serviceClass:trafficClass:delegate:",  v12,  v13,  self->_queue,  a5,  a6,  self);
    endpointConnection = self->_endpointConnection;
    self->_endpointConnection = v19;

    -[ADRemoraEndpointConnection setupConnection](self->_endpointConnection, "setupConnection");
    id v21 = (os_log_s *)AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG))
    {
      __int16 v22 = self->_endpointConnection;
      int v23 = 136315650;
      __int16 v24 = "-[ADRemoraEndpointConnectivitySession startWithEndpointUUID:applicationProtocol:serviceClass:trafficClass:completion:]";
      __int16 v25 = 2048;
      id v26 = self;
      __int16 v27 = 2112;
      id v28 = v22;
      _os_log_debug_impl( (void *)&_mh_execute_header,  v21,  OS_LOG_TYPE_DEBUG,  "%s %p endpointConnection = %@",  (uint8_t *)&v23,  0x20u);
    }
  }

- (void)stop
{
  if (self->_isInvalid)
  {
    v3 = (os_log_s *)AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR))
    {
      int v6 = 136315394;
      id v7 = "-[ADRemoraEndpointConnectivitySession stop]";
      __int16 v8 = 2048;
      id v9 = self;
      id v4 = "%s %p Ignored because the session is invalidated.";
LABEL_4:
      _os_log_error_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_ERROR, v4, (uint8_t *)&v6, 0x16u);
    }
  }

  else
  {
    endpointConnection = self->_endpointConnection;
    v3 = (os_log_s *)AFSiriLogContextDaemon;
    if (endpointConnection)
    {
      if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG))
      {
        int v6 = 136315650;
        id v7 = "-[ADRemoraEndpointConnectivitySession stop]";
        __int16 v8 = 2048;
        id v9 = self;
        __int16 v10 = 2112;
        id v11 = endpointConnection;
        _os_log_debug_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_DEBUG,  "%s %p endpointConnection = %@",  (uint8_t *)&v6,  0x20u);
      }

      -[ADRemoraEndpointConnectivitySession _relinquishEndpointAssertion](self, "_relinquishEndpointAssertion");
      -[ADRemoraEndpointConnectivitySession _tearDownEndpointConnection](self, "_tearDownEndpointConnection");
    }

    else if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR))
    {
      int v6 = 136315394;
      id v7 = "-[ADRemoraEndpointConnectivitySession stop]";
      __int16 v8 = 2048;
      id v9 = self;
      id v4 = "%s %p Ignored because the endpoint connection has not been set up yet.";
      goto LABEL_4;
    }
  }

- (void)sendMessage:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(id, void *))a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (self->_isInvalid)
  {
    __int16 v8 = (os_log_s *)AFSiriLogContextDaemon;
    if (!os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR))
    {
      if (!v7) {
        goto LABEL_5;
      }
      goto LABEL_4;
    }

    *(_DWORD *)id location = 136315394;
    *(void *)&location[4] = "-[ADRemoraEndpointConnectivitySession sendMessage:completion:]";
    __int16 v18 = 2048;
    id v19 = self;
    _os_log_error_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_ERROR,  "%s %p Ignored because the session is invalidated.",  location,  0x16u);
    if (v7)
    {
LABEL_4:
      id v9 = (void *)objc_claimAutoreleasedReturnValue(+[AFError errorWithCode:](&OBJC_CLASS___AFError, "errorWithCode:", 23LL));
      v7[2](v7, v9);
    }
  }

- (void)acquireAssertionWithCompletion:(id)a3
{
  id v4 = (void (**)(id, void, void *))a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (self->_isInvalid)
  {
    objc_super v5 = (os_log_s *)AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)id location = 136315394;
      *(void *)&location[4] = "-[ADRemoraEndpointConnectivitySession acquireAssertionWithCompletion:]";
      __int16 v15 = 2048;
      id v16 = self;
      _os_log_error_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_ERROR,  "%s %p Ignored because the session is invalidated.",  location,  0x16u);
      if (!v4) {
        goto LABEL_12;
      }
      goto LABEL_4;
    }

    if (v4)
    {
LABEL_4:
      id v6 = (void *)objc_claimAutoreleasedReturnValue(+[AFError errorWithCode:](&OBJC_CLASS___AFError, "errorWithCode:", 23LL));
      v4[2](v4, 0LL, v6);
    }
  }

  else
  {
    endpointConnection = self->_endpointConnection;
    __int16 v8 = (os_log_s *)AFSiriLogContextDaemon;
    if (!endpointConnection)
    {
      if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)id location = 136315394;
        *(void *)&location[4] = "-[ADRemoraEndpointConnectivitySession acquireAssertionWithCompletion:]";
        __int16 v15 = 2048;
        id v16 = self;
        _os_log_error_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_ERROR,  "%s %p Ignored because the endpoint connection has not been set up yet.",  location,  0x16u);
        if (!v4) {
          goto LABEL_12;
        }
      }

      else if (!v4)
      {
        goto LABEL_12;
      }

      __int16 v10 = (void *)objc_claimAutoreleasedReturnValue(+[AFError errorWithCode:](&OBJC_CLASS___AFError, "errorWithCode:", 44LL));
      v4[2](v4, 0LL, v10);

      goto LABEL_12;
    }

    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)id location = 136315650;
      *(void *)&location[4] = "-[ADRemoraEndpointConnectivitySession acquireAssertionWithCompletion:]";
      __int16 v15 = 2048;
      id v16 = self;
      __int16 v17 = 2112;
      __int16 v18 = endpointConnection;
      _os_log_debug_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEBUG,  "%s %p endpointConnection = %@",  location,  0x20u);
    }

    objc_initWeak((id *)location, self);
    id v9 = self->_endpointConnection;
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472LL;
    v11[2] = sub_10007649C;
    v11[3] = &unk_1004EF038;
    objc_copyWeak(&v13, (id *)location);
    id v12 = v4;
    -[ADRemoraEndpointConnection acquireEndpointConnectionAssertion:](v9, "acquireEndpointConnectionAssertion:", v11);

    objc_destroyWeak(&v13);
    objc_destroyWeak((id *)location);
  }

- (void)releaseAssertionWithCompletion:(id)a3
{
  id v4 = (void (**)(id, void, void *))a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (self->_isInvalid)
  {
    objc_super v5 = (os_log_s *)AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)id location = 136315394;
      *(void *)&location[4] = "-[ADRemoraEndpointConnectivitySession releaseAssertionWithCompletion:]";
      __int16 v15 = 2048;
      id v16 = self;
      _os_log_error_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_ERROR,  "%s %p Ignored because the session is invalidated.",  location,  0x16u);
      if (!v4) {
        goto LABEL_12;
      }
      goto LABEL_4;
    }

    if (v4)
    {
LABEL_4:
      id v6 = (void *)objc_claimAutoreleasedReturnValue(+[AFError errorWithCode:](&OBJC_CLASS___AFError, "errorWithCode:", 23LL));
      v4[2](v4, 0LL, v6);
    }
  }

  else
  {
    endpointConnection = self->_endpointConnection;
    __int16 v8 = (os_log_s *)AFSiriLogContextDaemon;
    if (!endpointConnection)
    {
      if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)id location = 136315394;
        *(void *)&location[4] = "-[ADRemoraEndpointConnectivitySession releaseAssertionWithCompletion:]";
        __int16 v15 = 2048;
        id v16 = self;
        _os_log_error_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_ERROR,  "%s %p Ignored because the endpoint connection has not been set up yet.",  location,  0x16u);
        if (!v4) {
          goto LABEL_12;
        }
      }

      else if (!v4)
      {
        goto LABEL_12;
      }

      __int16 v10 = (void *)objc_claimAutoreleasedReturnValue(+[AFError errorWithCode:](&OBJC_CLASS___AFError, "errorWithCode:", 44LL));
      v4[2](v4, 0LL, v10);

      goto LABEL_12;
    }

    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)id location = 136315650;
      *(void *)&location[4] = "-[ADRemoraEndpointConnectivitySession releaseAssertionWithCompletion:]";
      __int16 v15 = 2048;
      id v16 = self;
      __int16 v17 = 2112;
      __int16 v18 = endpointConnection;
      _os_log_debug_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEBUG,  "%s %p endpointConnection = %@",  location,  0x20u);
    }

    objc_initWeak((id *)location, self);
    id v9 = self->_endpointConnection;
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472LL;
    v11[2] = sub_1000762EC;
    v11[3] = &unk_1004EF038;
    objc_copyWeak(&v13, (id *)location);
    id v12 = v4;
    -[ADRemoraEndpointConnection releaseEndpointConnectionAssertion:](v9, "releaseEndpointConnectionAssertion:", v11);

    objc_destroyWeak(&v13);
    objc_destroyWeak((id *)location);
  }

- (void)_handleXPCConnectionInvalidation
{
  v3 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG))
  {
    xpcConnection = self->_xpcConnection;
    int v5 = 136315650;
    id v6 = "-[ADRemoraEndpointConnectivitySession _handleXPCConnectionInvalidation]";
    __int16 v7 = 2048;
    __int16 v8 = self;
    __int16 v9 = 2112;
    __int16 v10 = xpcConnection;
    _os_log_debug_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_DEBUG,  "%s %p xpcConnection = %@",  (uint8_t *)&v5,  0x20u);
  }

  -[ADRemoraEndpointConnectivitySession _invalidate](self, "_invalidate");
}

- (void)_handleXPCConnectionInterruption
{
  v3 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG))
  {
    xpcConnection = self->_xpcConnection;
    int v5 = 136315650;
    id v6 = "-[ADRemoraEndpointConnectivitySession _handleXPCConnectionInterruption]";
    __int16 v7 = 2048;
    __int16 v8 = self;
    __int16 v9 = 2112;
    __int16 v10 = xpcConnection;
    _os_log_debug_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_DEBUG,  "%s %p xpcConnection = %@",  (uint8_t *)&v5,  0x20u);
  }

  -[ADRemoraEndpointConnectivitySession _invalidate](self, "_invalidate");
}

- (void)_clearXPCConnection
{
  xpcConnection = self->_xpcConnection;
  if (xpcConnection)
  {
    id v4 = (os_log_s *)AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG))
    {
      int v6 = 136315650;
      __int16 v7 = "-[ADRemoraEndpointConnectivitySession _clearXPCConnection]";
      __int16 v8 = 2048;
      __int16 v9 = self;
      __int16 v10 = 2112;
      id v11 = xpcConnection;
      _os_log_debug_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEBUG,  "%s %p xpcConnection = %@",  (uint8_t *)&v6,  0x20u);
      xpcConnection = self->_xpcConnection;
    }

    -[NSXPCConnection invalidate](xpcConnection, "invalidate");
    int v5 = self->_xpcConnection;
    self->_xpcConnection = 0LL;
  }

- (id)_remoteServiceDelegateWithErrorHandler:(id)a3
{
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (!self->_isInvalid)
  {
    xpcConnection = self->_xpcConnection;
    if (xpcConnection)
    {
      v10[0] = _NSConcreteStackBlock;
      v10[1] = 3221225472LL;
      v10[2] = sub_1000762D8;
      v10[3] = &unk_1004FCC00;
      id v11 = v4;
      __int16 v7 = (void *)objc_claimAutoreleasedReturnValue( -[NSXPCConnection remoteObjectProxyWithErrorHandler:]( xpcConnection,  "remoteObjectProxyWithErrorHandler:",  v10));
      int v6 = v11;
      goto LABEL_7;
    }
  }

  int v5 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315394;
    id v13 = "-[ADRemoraEndpointConnectivitySession _remoteServiceDelegateWithErrorHandler:]";
    __int16 v14 = 2048;
    __int16 v15 = self;
    _os_log_error_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_ERROR,  "%s %p Ignored because the connection is invalidated.",  buf,  0x16u);
    if (v4) {
      goto LABEL_4;
    }
LABEL_9:
    __int16 v7 = 0LL;
    goto LABEL_10;
  }

  if (!v4) {
    goto LABEL_9;
  }
LABEL_4:
  int v6 = (void *)objc_claimAutoreleasedReturnValue(+[AFError errorWithCode:](&OBJC_CLASS___AFError, "errorWithCode:", 23LL));
  (*((void (**)(id, void *))v4 + 2))(v4, v6);
  __int16 v7 = 0LL;
LABEL_7:

LABEL_10:
  return v7;
}

- (void)_relinquishEndpointAssertion
{
  endpointConnection = self->_endpointConnection;
  if (endpointConnection)
  {
    id v4 = (os_log_s *)AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)id location = 136315650;
      *(void *)&location[4] = "-[ADRemoraEndpointConnectivitySession _relinquishEndpointAssertion]";
      __int16 v9 = 2048;
      __int16 v10 = self;
      __int16 v11 = 2112;
      id v12 = endpointConnection;
      _os_log_debug_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEBUG,  "%s %p endpointConnection = %@",  location,  0x20u);
    }

    objc_initWeak((id *)location, self);
    int v5 = self->_endpointConnection;
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472LL;
    v6[2] = sub_100076140;
    v6[3] = &unk_1004EF060;
    objc_copyWeak(&v7, (id *)location);
    -[ADRemoraEndpointConnection releaseEndpointConnectionAssertion:](v5, "releaseEndpointConnectionAssertion:", v6);
    objc_destroyWeak(&v7);
    objc_destroyWeak((id *)location);
  }

- (void)_tearDownEndpointConnection
{
  endpointConnection = self->_endpointConnection;
  if (endpointConnection)
  {
    id v4 = (os_log_s *)AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG))
    {
      int v6 = 136315650;
      id v7 = "-[ADRemoraEndpointConnectivitySession _tearDownEndpointConnection]";
      __int16 v8 = 2048;
      __int16 v9 = self;
      __int16 v10 = 2112;
      __int16 v11 = endpointConnection;
      _os_log_debug_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEBUG,  "%s %p endpointConnection = %@",  (uint8_t *)&v6,  0x20u);
      endpointConnection = self->_endpointConnection;
    }

    -[ADRemoraEndpointConnection teardownConnection](endpointConnection, "teardownConnection");
    int v5 = self->_endpointConnection;
    self->_endpointConnection = 0LL;
  }

- (void)_invalidate
{
  if (!self->_isInvalid)
  {
    self->_isInvalid = 1;
    v3 = (os_log_s *)AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
    {
      int v6 = 136315394;
      id v7 = "-[ADRemoraEndpointConnectivitySession _invalidate]";
      __int16 v8 = 2048;
      __int16 v9 = self;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "%s %p", (uint8_t *)&v6, 0x16u);
    }

    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    if ((objc_opt_respondsToSelector(WeakRetained, "endpointConnectivitySessionDidInvalidate:") & 1) != 0)
    {
      id v5 = objc_loadWeakRetained((id *)&self->_delegate);
      [v5 endpointConnectivitySessionDidInvalidate:self];
    }

    objc_storeWeak((id *)&self->_delegate, 0LL);
  }

  -[ADRemoraEndpointConnectivitySession _relinquishEndpointAssertion](self, "_relinquishEndpointAssertion");
  -[ADRemoraEndpointConnectivitySession _tearDownEndpointConnection](self, "_tearDownEndpointConnection");
  -[ADRemoraEndpointConnectivitySession _clearXPCConnection](self, "_clearXPCConnection");
}

- (NSUUID)sessionUUID
{
  return self->_sessionUUID;
}

- (void).cxx_destruct
{
}

@end