@interface RPBroadcastExtensionProxy
- (BOOL)enableMixedRealityCamera;
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (NSExtension)broadcastUploadExtension;
- (NSXPCConnection)connection;
- (NSXPCListener)listener;
- (NSXPCListenerEndpoint)listenerEndpoint;
- (RPBroadcastExtensionProxy)initWithBroadcastUploadExtension:(id)a3;
- (RPBroadcastExtensionProxy)initWithBroadcastUploadListenerEndpoint:(id)a3;
- (id)broadcastURLHandler;
- (id)connectionReadyHandler;
- (id)errorHandler;
- (id)serviceInfoHandler;
- (void)dealloc;
- (void)establishConnectionWithHandler:(id)a3;
- (void)finishBroadcastWithError:(id)a3;
- (void)invalidateConnection;
- (void)ping;
- (void)processPayload:(id)a3 completion:(id)a4;
- (void)setBroadcastURLHandler:(id)a3;
- (void)setBroadcastUploadExtension:(id)a3;
- (void)setConnection:(id)a3;
- (void)setConnectionReadyHandler:(id)a3;
- (void)setErrorHandler:(id)a3;
- (void)setListener:(id)a3;
- (void)setListenerEndpoint:(id)a3;
- (void)setServiceInfoHandler:(id)a3;
- (void)setupNewConnection:(id)a3;
- (void)updateBroadcastURL:(id)a3;
- (void)updateServiceInfo:(id)a3;
@end

@implementation RPBroadcastExtensionProxy

- (RPBroadcastExtensionProxy)initWithBroadcastUploadExtension:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___RPBroadcastExtensionProxy;
  v5 = -[RPBroadcastExtensionProxy init](&v9, "init");
  if (v5)
  {
    if (dword_100084688 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136446722;
      v11 = "-[RPBroadcastExtensionProxy initWithBroadcastUploadExtension:]";
      __int16 v12 = 1024;
      int v13 = 41;
      __int16 v14 = 2048;
      v15 = v5;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  " [INFO] %{public}s:%d %p",  buf,  0x1Cu);
    }

    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSXPCListener anonymousListener](&OBJC_CLASS___NSXPCListener, "anonymousListener"));
    -[RPBroadcastExtensionProxy setListener:](v5, "setListener:", v6);

    -[NSXPCListener resume](v5->_listener, "resume");
    -[NSXPCListener setDelegate:](v5->_listener, "setDelegate:", v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[NSXPCListener endpoint](v5->_listener, "endpoint"));
    -[RPBroadcastExtensionProxy setListenerEndpoint:](v5, "setListenerEndpoint:", v7);

    -[RPBroadcastExtensionProxy setBroadcastUploadExtension:](v5, "setBroadcastUploadExtension:", v4);
  }

  return v5;
}

- (RPBroadcastExtensionProxy)initWithBroadcastUploadListenerEndpoint:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___RPBroadcastExtensionProxy;
  v5 = -[RPBroadcastExtensionProxy init](&v8, "init");
  if (v5)
  {
    if (dword_100084688 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136446722;
      v10 = "-[RPBroadcastExtensionProxy initWithBroadcastUploadListenerEndpoint:]";
      __int16 v11 = 1024;
      int v12 = 53;
      __int16 v13 = 2048;
      __int16 v14 = v5;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  " [INFO] %{public}s:%d %p",  buf,  0x1Cu);
    }

    if (!v5->_connection)
    {
      v6 = -[NSXPCConnection initWithListenerEndpoint:]( objc_alloc(&OBJC_CLASS___NSXPCConnection),  "initWithListenerEndpoint:",  v4);
      -[RPBroadcastExtensionProxy setupNewConnection:](v5, "setupNewConnection:", v6);
    }
  }

  return v5;
}

- (void)dealloc
{
  if (dword_100084688 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446722;
    v5 = "-[RPBroadcastExtensionProxy dealloc]";
    __int16 v6 = 1024;
    int v7 = 63;
    __int16 v8 = 2048;
    objc_super v9 = self;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  " [INFO] %{public}s:%d %p",  buf,  0x1Cu);
  }

  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___RPBroadcastExtensionProxy;
  -[RPBroadcastExtensionProxy dealloc](&v3, "dealloc");
}

- (void)establishConnectionWithHandler:(id)a3
{
  id v4 = a3;
  if (dword_100084688 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446466;
    __int16 v13 = "-[RPBroadcastExtensionProxy establishConnectionWithHandler:]";
    __int16 v14 = 1024;
    int v15 = 67;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  " [INFO] %{public}s:%d establishing connection to extension",  buf,  0x12u);
  }

  -[RPBroadcastExtensionProxy setConnectionReadyHandler:](self, "setConnectionReadyHandler:", v4);
  v5 = objc_alloc_init(&OBJC_CLASS___NSExtensionItem);
  broadcastUploadExtension = self->_broadcastUploadExtension;
  __int16 v11 = v5;
  int v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v11, 1LL));
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472LL;
  v9[2] = sub_10000BBE8;
  v9[3] = &unk_100071028;
  v9[4] = self;
  id v10 = v4;
  id v8 = v4;
  -[NSExtension beginExtensionRequestWithInputItems:completion:]( broadcastUploadExtension,  "beginExtensionRequestWithInputItems:completion:",  v7,  v9);
}

- (void)invalidateConnection
{
  if (dword_100084688 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    connection = self->_connection;
    int v8 = 136446978;
    objc_super v9 = "-[RPBroadcastExtensionProxy invalidateConnection]";
    __int16 v10 = 1024;
    int v11 = 100;
    __int16 v12 = 2048;
    __int16 v13 = self;
    __int16 v14 = 2048;
    int v15 = connection;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  " [INFO] %{public}s:%d %p invalidating connection=%p with extension",  (uint8_t *)&v8,  0x26u);
  }

  -[RPBroadcastExtensionProxy setConnectionReadyHandler:](self, "setConnectionReadyHandler:", 0LL);
  -[NSXPCConnection setInvalidationHandler:](self->_connection, "setInvalidationHandler:", 0LL);
  -[NSXPCConnection setInterruptionHandler:](self->_connection, "setInterruptionHandler:", 0LL);
  -[NSXPCConnection invalidate](self->_connection, "invalidate");
  -[NSXPCListener invalidate](self->_listener, "invalidate");
  -[RPBroadcastExtensionProxy setConnection:](self, "setConnection:", 0LL);
  -[RPBroadcastExtensionProxy setListener:](self, "setListener:", 0LL);
  id serviceInfoHandler = self->_serviceInfoHandler;
  self->_id serviceInfoHandler = 0LL;

  id broadcastURLHandler = self->_broadcastURLHandler;
  self->_id broadcastURLHandler = 0LL;

  id errorHandler = self->_errorHandler;
  self->_id errorHandler = 0LL;

  int v7 = (void *)objc_claimAutoreleasedReturnValue(-[RPBroadcastExtensionProxy broadcastUploadExtension](self, "broadcastUploadExtension"));
  [v7 _kill:9];

  -[RPBroadcastExtensionProxy setBroadcastUploadExtension:](self, "setBroadcastUploadExtension:", 0LL);
}

- (void)setupNewConnection:(id)a3
{
  id v4 = a3;
  -[RPBroadcastExtensionProxy setConnection:](self, "setConnection:", v4);
  -[NSXPCConnection setExportedObject:](self->_connection, "setExportedObject:", self);
  v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSXPCInterface interfaceWithProtocol:]( &OBJC_CLASS___NSXPCInterface,  "interfaceWithProtocol:",  &OBJC_PROTOCOL___RPBroadcastDaemonProtocol));
  -[NSXPCConnection setExportedInterface:](self->_connection, "setExportedInterface:", v5);

  __int16 v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSXPCInterface interfaceWithProtocol:]( &OBJC_CLASS___NSXPCInterface,  "interfaceWithProtocol:",  &OBJC_PROTOCOL___RPBroadcastExtensionProtocol));
  -[NSXPCConnection setRemoteObjectInterface:](self->_connection, "setRemoteObjectInterface:", v6);

  objc_initWeak(&location, self);
  int v7 = _NSConcreteStackBlock;
  uint64_t v8 = 3221225472LL;
  objc_super v9 = sub_10000C1A0;
  __int16 v10 = &unk_100071050;
  objc_copyWeak(&v11, &location);
  -[NSXPCConnection setInvalidationHandler:](self->_connection, "setInvalidationHandler:", &v7);
  -[NSXPCConnection setInterruptionHandler:]( self->_connection,  "setInterruptionHandler:",  &stru_100071070,  v7,  v8,  v9,  v10);
  -[NSXPCConnection resume](self->_connection, "resume");
  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  return 1;
}

- (void)updateServiceInfo:(id)a3
{
  id v4 = a3;
  if (dword_100084688 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 136446466;
    int v7 = "-[RPBroadcastExtensionProxy updateServiceInfo:]";
    __int16 v8 = 1024;
    int v9 = 145;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  " [INFO] %{public}s:%d received serviceInfo",  (uint8_t *)&v6,  0x12u);
  }

  id serviceInfoHandler = (void (**)(id, id))self->_serviceInfoHandler;
  if (serviceInfoHandler) {
    serviceInfoHandler[2](serviceInfoHandler, v4);
  }
}

- (void)updateBroadcastURL:(id)a3
{
  id v4 = a3;
  if (dword_100084688 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 136446466;
    int v7 = "-[RPBroadcastExtensionProxy updateBroadcastURL:]";
    __int16 v8 = 1024;
    int v9 = 152;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  " [INFO] %{public}s:%d received broadcastURL",  (uint8_t *)&v6,  0x12u);
  }

  id broadcastURLHandler = (void (**)(id, id))self->_broadcastURLHandler;
  if (broadcastURLHandler) {
    broadcastURLHandler[2](broadcastURLHandler, v4);
  }
}

- (void)ping
{
  if (dword_100084688 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 136446466;
    int v7 = "-[RPBroadcastExtensionProxy ping]";
    __int16 v8 = 1024;
    int v9 = 159;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  " [INFO] %{public}s:%d received ping from extension, notifying handler that connection is ready",  (uint8_t *)&v6,  0x12u);
  }

  connectionReadyHandler = (void (**)(id, void))self->_connectionReadyHandler;
  if (connectionReadyHandler) {
    connectionReadyHandler[2](connectionReadyHandler, 0LL);
  }
  id v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSXPCConnection currentConnection](&OBJC_CLASS___NSXPCConnection, "currentConnection"));
  self->_BOOL enableMixedRealityCamera = 0;
  if (dword_100084688 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    BOOL enableMixedRealityCamera = self->_enableMixedRealityCamera;
    int v6 = 136447234;
    int v7 = "-[RPBroadcastExtensionProxy ping]";
    __int16 v8 = 1024;
    int v9 = 169;
    __int16 v10 = 2048;
    id v11 = self;
    __int16 v12 = 2048;
    __int16 v13 = v4;
    __int16 v14 = 1024;
    BOOL v15 = enableMixedRealityCamera;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  " [INFO] %{public}s:%d %p connection=%p enableMixedRealityCamera=%d",  (uint8_t *)&v6,  0x2Cu);
  }
}

- (void)finishBroadcastWithError:(id)a3
{
  id v4 = a3;
  if (dword_100084688 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 136446722;
    int v7 = "-[RPBroadcastExtensionProxy finishBroadcastWithError:]";
    __int16 v8 = 1024;
    int v9 = 173;
    __int16 v10 = 2112;
    id v11 = v4;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  " [INFO] %{public}s:%d received finish request from service due to error %@",  (uint8_t *)&v6,  0x1Cu);
  }

  id errorHandler = (void (**)(id, id))self->_errorHandler;
  if (errorHandler) {
    errorHandler[2](errorHandler, v4);
  }
}

- (void)processPayload:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_initWeak(&location, self);
  connection = self->_connection;
  id v11 = _NSConcreteStackBlock;
  uint64_t v12 = 3221225472LL;
  __int16 v13 = sub_10000C814;
  __int16 v14 = &unk_100071098;
  objc_copyWeak(&v15, &location);
  int v9 = (void *)objc_claimAutoreleasedReturnValue( -[NSXPCConnection remoteObjectProxyWithErrorHandler:]( connection,  "remoteObjectProxyWithErrorHandler:",  &v11));
  __int16 v10 = v9;
  if (v9) {
    objc_msgSend(v9, "processPayload:completion:", v6, v7, v11, v12, v13, v14);
  }

  objc_destroyWeak(&v15);
  objc_destroyWeak(&location);
}

- (id)serviceInfoHandler
{
  return self->_serviceInfoHandler;
}

- (void)setServiceInfoHandler:(id)a3
{
}

- (id)broadcastURLHandler
{
  return self->_broadcastURLHandler;
}

- (void)setBroadcastURLHandler:(id)a3
{
}

- (id)errorHandler
{
  return self->_errorHandler;
}

- (void)setErrorHandler:(id)a3
{
}

- (BOOL)enableMixedRealityCamera
{
  return self->_enableMixedRealityCamera;
}

- (NSXPCListener)listener
{
  return self->_listener;
}

- (void)setListener:(id)a3
{
}

- (NSExtension)broadcastUploadExtension
{
  return self->_broadcastUploadExtension;
}

- (void)setBroadcastUploadExtension:(id)a3
{
}

- (NSXPCConnection)connection
{
  return self->_connection;
}

- (void)setConnection:(id)a3
{
}

- (id)connectionReadyHandler
{
  return self->_connectionReadyHandler;
}

- (void)setConnectionReadyHandler:(id)a3
{
}

- (NSXPCListenerEndpoint)listenerEndpoint
{
  return self->_listenerEndpoint;
}

- (void)setListenerEndpoint:(id)a3
{
}

- (void).cxx_destruct
{
}

@end