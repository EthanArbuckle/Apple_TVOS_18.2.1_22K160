@interface NEAgentSession
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (id)managerObject;
- (id)managerObjectWithErrorHandler:(id)a3;
- (void)disposeWithCompletionHandler:(id)a3;
- (void)setupWithPluginType:(id)a3 pluginVersion:(int64_t)a4 pluginClass:(int64_t)a5 pluginInfo:(id)a6 completionHandler:(id)a7;
@end

@implementation NEAgentSession

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v6 = a4;
  delegateConnection = self->_delegateConnection;
  if (delegateConnection)
  {
    uint64_t v8 = ne_log_obj();
    v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_fault_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_FAULT,  "Received a second delegate connection",  buf,  2u);
    }
  }

  else
  {
    v19[0] = _NSConcreteStackBlock;
    v19[1] = 3221225472LL;
    v19[2] = sub_1000054BC;
    v19[3] = &unk_100008338;
    v19[4] = self;
    v10 = objc_retainBlock(v19);
    id v12 = objc_msgSend(objc_getProperty(self, v11, 8, 1), "driverInterface");
    v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
    [v6 setExportedInterface:v13];

    id v15 = objc_msgSend(objc_getProperty(self, v14, 8, 1), "managerInterface");
    v16 = (void *)objc_claimAutoreleasedReturnValue(v15);
    [v6 setRemoteObjectInterface:v16];

    objc_msgSend(v6, "setExportedObject:", objc_getProperty(self, v17, 8, 1));
    [v6 setInvalidationHandler:v10];
    [v6 setInterruptionHandler:v10];
    objc_storeStrong((id *)&self->_delegateConnection, a4);
    [v6 resume];
  }

  return delegateConnection == 0LL;
}

- (void)setupWithPluginType:(id)a3 pluginVersion:(int64_t)a4 pluginClass:(int64_t)a5 pluginInfo:(id)a6 completionHandler:(id)a7
{
  id v12 = a3;
  id v13 = a6;
  id v15 = a7;
  if (self) {
    Property = (dispatch_queue_s *)objc_getProperty(self, v14, 16LL, 1);
  }
  else {
    Property = 0LL;
  }
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472LL;
  v20[2] = sub_1000050A0;
  v20[3] = &unk_100008388;
  int64_t v24 = a4;
  int64_t v25 = a5;
  v20[4] = self;
  id v21 = v12;
  id v22 = v13;
  id v23 = v15;
  id v17 = v13;
  id v18 = v12;
  id v19 = v15;
  dispatch_async(Property, v20);
}

- (void)disposeWithCompletionHandler:(id)a3
{
  id v5 = a3;
  if (self) {
    Property = (dispatch_queue_s *)objc_getProperty(self, v4, 16LL, 1);
  }
  else {
    Property = 0LL;
  }
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = sub_100004F14;
  v8[3] = &unk_1000083B0;
  v8[4] = self;
  id v9 = v5;
  id v7 = v5;
  dispatch_async(Property, v8);
}

- (id)managerObject
{
  v2 = self;
  if (self) {
    self = (NEAgentSession *)objc_getProperty(self, a2, 32LL, 1);
  }
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[NEAgentSession remoteObjectProxy](self, "remoteObjectProxy"));
  if (!v4)
  {
    id v5 = ne_log_obj(v3);
    id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)id v9 = 0;
      _os_log_error_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_ERROR,  "Failed to get the remote manager object",  v9,  2u);
    }

    sub_100004D24(v2, v7);
  }

  return v4;
}

- (id)managerObjectWithErrorHandler:(id)a3
{
  id v5 = a3;
  if (self) {
    id Property = objc_getProperty(self, v4, 32LL, 1);
  }
  else {
    id Property = 0LL;
  }
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([Property remoteObjectProxyWithErrorHandler:v5]);
  if (!v8)
  {
    id v9 = ne_log_obj(v7);
    v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)id v13 = 0;
      _os_log_error_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_ERROR,  "Failed to get the remote manager object",  v13,  2u);
    }

    sub_100004D24(self, v11);
  }

  return v8;
}

- (void).cxx_destruct
{
}

@end