@interface ADDeviceContextConnection
- (ADDeviceContextConnection)initWithQueue:(id)a3 xpcConnection:(id)a4 delegate:(id)a5;
- (id)_remoteServiceDelegateWithErrorHandler:(id)a3;
- (void)_beginUpdateLocalDeviceContextWithReply:(id)a3;
- (void)_clearXPCConnection;
- (void)_endUpdateLocalDeviceContext;
- (void)_handleXPCConnectionInterruption;
- (void)_handleXPCConnectionInvalidation;
- (void)_invalidate;
- (void)beginUpdateLocalDeviceContextWithReply:(id)a3;
- (void)dealloc;
- (void)donateSerializedContextMapByPrivacyClass:(id)a3 withMetadataMap:(id)a4 forType:(id)a5 pushToRemote:(BOOL)a6 completion:(id)a7;
- (void)getLocalDeviceContextWithReply:(id)a3;
- (void)invalidate;
- (void)updateLocalDeviceContext:(id)a3;
@end

@implementation ADDeviceContextConnection

- (void)dealloc
{
  v3 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    v6 = "-[ADDeviceContextConnection dealloc]";
    __int16 v7 = 2048;
    v8 = self;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "%s %p", buf, 0x16u);
  }

  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___ADDeviceContextConnection;
  -[ADDeviceContextConnection dealloc](&v4, "dealloc");
}

- (ADDeviceContextConnection)initWithQueue:(id)a3 xpcConnection:(id)a4 delegate:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v36.receiver = self;
  v36.super_class = (Class)&OBJC_CLASS___ADDeviceContextConnection;
  v11 = -[ADDeviceContextConnection init](&v36, "init");
  if (v11)
  {
    if (v8)
    {
      v12 = (OS_dispatch_queue *)v8;
      queue = v11->_queue;
      v11->_queue = v12;
    }

    else
    {
      dispatch_queue_attr_t v14 = dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
      v15 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v14);
      dispatch_queue_attr_t v16 = dispatch_queue_attr_make_with_qos_class(v15, QOS_CLASS_DEFAULT, 0);
      v17 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v16);

      dispatch_queue_t v18 = dispatch_queue_create("com.apple.assistant.device-context.client-connection", v17);
      queue = v11->_queue;
      v11->_queue = (OS_dispatch_queue *)v18;
    }

    objc_storeWeak((id *)&v11->_delegate, v10);
    objc_storeStrong((id *)&v11->_xpcConnection, a4);
    id v19 = -[NSXPCConnection _setQueue:](v11->_xpcConnection, "_setQueue:", v11->_queue);
    xpcConnection = v11->_xpcConnection;
    uint64_t XPCInterface = AFDeviceContextServiceDelegateGetXPCInterface(v19);
    v22 = (void *)objc_claimAutoreleasedReturnValue(XPCInterface);
    -[NSXPCConnection setRemoteObjectInterface:](xpcConnection, "setRemoteObjectInterface:", v22);

    v23 = v11->_xpcConnection;
    uint64_t v24 = AFDeviceContextServiceGetXPCInterface();
    v25 = (void *)objc_claimAutoreleasedReturnValue(v24);
    -[NSXPCConnection setExportedInterface:](v23, "setExportedInterface:", v25);

    -[NSXPCConnection setExportedObject:](v11->_xpcConnection, "setExportedObject:", v11);
    objc_initWeak(&location, v11);
    v26 = v11->_xpcConnection;
    v33[0] = _NSConcreteStackBlock;
    v33[1] = 3221225472LL;
    v33[2] = sub_10010F294;
    v33[3] = &unk_1004FAF58;
    objc_copyWeak(&v34, &location);
    -[NSXPCConnection setInvalidationHandler:](v26, "setInvalidationHandler:", v33);
    v27 = v11->_xpcConnection;
    v31[0] = _NSConcreteStackBlock;
    v31[1] = 3221225472LL;
    v31[2] = sub_10010F2C0;
    v31[3] = &unk_1004FAF58;
    objc_copyWeak(&v32, &location);
    -[NSXPCConnection setInterruptionHandler:](v27, "setInterruptionHandler:", v31);
    -[NSXPCConnection resume](v11->_xpcConnection, "resume");
    v28 = (os_log_s *)AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
    {
      v29 = v11->_xpcConnection;
      *(_DWORD *)buf = 136315650;
      v38 = "-[ADDeviceContextConnection initWithQueue:xpcConnection:delegate:]";
      __int16 v39 = 2048;
      v40 = v11;
      __int16 v41 = 2112;
      v42 = v29;
      _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_INFO, "%s %p xpcConnection = %@", buf, 0x20u);
    }

    objc_destroyWeak(&v32);
    objc_destroyWeak(&v34);
    objc_destroyWeak(&location);
  }

  return v11;
}

- (void)updateLocalDeviceContext:(id)a3
{
  id v4 = a3;
  queue = (dispatch_queue_s *)self->_queue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_10010EFFC;
  v7[3] = &unk_1004FD968;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

- (void)getLocalDeviceContextWithReply:(id)a3
{
  id v4 = (void (**)(id, void))a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  id v6 = WeakRetained;
  __int16 v7 = (os_log_s *)AFSiriLogContextDaemon;
  if (self->_isInvalid || WeakRetained == 0LL)
  {
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      dispatch_queue_attr_t v14 = "-[ADDeviceContextConnection getLocalDeviceContextWithReply:]";
      __int16 v15 = 2048;
      dispatch_queue_attr_t v16 = self;
      _os_log_error_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_ERROR,  "%s %p Ignored because the connection is invalidated.",  buf,  0x16u);
      if (!v4) {
        goto LABEL_12;
      }
    }

    else if (!v4)
    {
      goto LABEL_12;
    }

    v4[2](v4, 0LL);
    goto LABEL_12;
  }

  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    dispatch_queue_attr_t v14 = "-[ADDeviceContextConnection getLocalDeviceContextWithReply:]";
    __int16 v15 = 2048;
    dispatch_queue_attr_t v16 = self;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "%s %p", buf, 0x16u);
  }

  objc_initWeak((id *)buf, self);
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472LL;
  v10[2] = sub_10010EED8;
  v10[3] = &unk_1004F1B70;
  objc_copyWeak(&v12, (id *)buf);
  v11 = v4;
  [v6 deviceContextConnection:self getLocalDeviceContextWithCompletion:v10];

  objc_destroyWeak(&v12);
  objc_destroyWeak((id *)buf);
LABEL_12:
}

- (void)beginUpdateLocalDeviceContextWithReply:(id)a3
{
}

- (void)donateSerializedContextMapByPrivacyClass:(id)a3 withMetadataMap:(id)a4 forType:(id)a5 pushToRemote:(BOOL)a6 completion:(id)a7
{
  BOOL v8 = a6;
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  __int16 v15 = (void (**)(void))a7;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v17 = WeakRetained;
  if (self->_isInvalid || !WeakRetained)
  {
    dispatch_queue_t v18 = (os_log_s *)AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR))
    {
      int v19 = 136315394;
      v20 = "-[ADDeviceContextConnection donateSerializedContextMapByPrivacyClass:withMetadataMap:forType:pushToRemote:completion:]";
      __int16 v21 = 2048;
      v22 = self;
      _os_log_error_impl( (void *)&_mh_execute_header,  v18,  OS_LOG_TYPE_ERROR,  "%s %p Ignored because the connection is invalidated.",  (uint8_t *)&v19,  0x16u);
      if (!v15) {
        goto LABEL_7;
      }
    }

    else if (!v15)
    {
      goto LABEL_7;
    }

    v15[2](v15);
    goto LABEL_7;
  }

  [WeakRetained deviceContextConnection:self donateSerializedContextMapByPrivacyClass:v12 withMetadataMap:v13 forType:v14 pushToRemote:v8 completion:v15];
LABEL_7:
}

- (void)invalidate
{
  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10010EED0;
  block[3] = &unk_1004FD940;
  block[4] = self;
  dispatch_async(queue, block);
}

- (void)_handleXPCConnectionInvalidation
{
  v3 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    xpcConnection = self->_xpcConnection;
    int v5 = 136315650;
    id v6 = "-[ADDeviceContextConnection _handleXPCConnectionInvalidation]";
    __int16 v7 = 2048;
    BOOL v8 = self;
    __int16 v9 = 2112;
    id v10 = xpcConnection;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "%s %p xpcConnection = %@", (uint8_t *)&v5, 0x20u);
  }

  -[ADDeviceContextConnection _invalidate](self, "_invalidate");
}

- (void)_handleXPCConnectionInterruption
{
  v3 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    xpcConnection = self->_xpcConnection;
    int v5 = 136315650;
    id v6 = "-[ADDeviceContextConnection _handleXPCConnectionInterruption]";
    __int16 v7 = 2048;
    BOOL v8 = self;
    __int16 v9 = 2112;
    id v10 = xpcConnection;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "%s %p xpcConnection = %@", (uint8_t *)&v5, 0x20u);
  }

  -[ADDeviceContextConnection _invalidate](self, "_invalidate");
}

- (void)_clearXPCConnection
{
  xpcConnection = self->_xpcConnection;
  if (xpcConnection)
  {
    id v4 = (os_log_s *)AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
    {
      int v6 = 136315650;
      __int16 v7 = "-[ADDeviceContextConnection _clearXPCConnection]";
      __int16 v8 = 2048;
      __int16 v9 = self;
      __int16 v10 = 2112;
      v11 = xpcConnection;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "%s %p xpcConnection = %@", (uint8_t *)&v6, 0x20u);
      xpcConnection = self->_xpcConnection;
    }

    -[NSXPCConnection invalidate](xpcConnection, "invalidate");
    int v5 = self->_xpcConnection;
    self->_xpcConnection = 0LL;
  }

- (void)_invalidate
{
  if (!self->_isInvalid)
  {
    self->_isInvalid = 1;
    v3 = (os_log_s *)AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
    {
      int v5 = 136315394;
      int v6 = "-[ADDeviceContextConnection _invalidate]";
      __int16 v7 = 2048;
      __int16 v8 = self;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "%s %p", (uint8_t *)&v5, 0x16u);
    }

    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    [WeakRetained deviceContextConnectionDidInvalidate:self];

    objc_storeWeak((id *)&self->_delegate, 0LL);
  }

  -[ADDeviceContextConnection _clearXPCConnection](self, "_clearXPCConnection");
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
      v10[2] = sub_10010EEBC;
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
    id v13 = "-[ADDeviceContextConnection _remoteServiceDelegateWithErrorHandler:]";
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

- (void)_beginUpdateLocalDeviceContextWithReply:(id)a3
{
  queue = (dispatch_queue_s *)self->_queue;
  id v5 = a3;
  dispatch_assert_queue_V2(queue);
  self->_isUpdatingLocalDeviceContext = 1;
  int v6 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    int v9 = 136315650;
    __int16 v10 = "-[ADDeviceContextConnection _beginUpdateLocalDeviceContextWithReply:]";
    __int16 v11 = 2048;
    id v12 = self;
    __int16 v13 = 1024;
    int v14 = 1;
    _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_INFO,  "%s %p isUpdatingLocalDeviceContext = %d",  (uint8_t *)&v9,  0x1Cu);
  }

  id v7 = objc_retainBlock(v5);

  id updateLocalDeviceContextReply = self->_updateLocalDeviceContextReply;
  self->_id updateLocalDeviceContextReply = v7;
}

- (void)_endUpdateLocalDeviceContext
{
  self->_isUpdatingLocalDeviceContext = 0;
  v3 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    int v6 = 136315650;
    id v7 = "-[ADDeviceContextConnection _endUpdateLocalDeviceContext]";
    __int16 v8 = 2048;
    int v9 = self;
    __int16 v10 = 1024;
    int v11 = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_INFO,  "%s %p isUpdatingLocalDeviceContext = %d",  (uint8_t *)&v6,  0x1Cu);
  }

  id updateLocalDeviceContextReply = (void (**)(id))self->_updateLocalDeviceContextReply;
  if (updateLocalDeviceContextReply)
  {
    id v5 = (os_log_s *)AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
    {
      int v6 = 136315394;
      id v7 = "-[ADDeviceContextConnection _endUpdateLocalDeviceContext]";
      __int16 v8 = 2048;
      int v9 = self;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "%s %p sending reply...", (uint8_t *)&v6, 0x16u);
      id updateLocalDeviceContextReply = (void (**)(id))self->_updateLocalDeviceContextReply;
    }

    updateLocalDeviceContextReply[2](updateLocalDeviceContextReply);
  }

- (void).cxx_destruct
{
}

@end