@interface SDXPCDaemon
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (BOOL)shouldAcceptNewConnection:(id)a3;
- (NSSet)activeConnections;
- (NSString)machServiceName;
- (NSXPCConnection)currentConnection;
- (NSXPCInterface)exportedInterface;
- (NSXPCInterface)remoteObjectInterface;
- (OS_dispatch_queue)dispatchQueue;
- (SDXPCDaemon)init;
- (void)_activate;
- (void)_invalidate;
- (void)connection:(id)a3 handleInvocation:(id)a4 isReply:(BOOL)a5;
- (void)connectionEstablished:(id)a3;
- (void)connectionInvalidated:(id)a3;
- (void)dealloc;
- (void)enumerateRemoteObjectProxiesUsingBlock:(id)a3;
- (void)establishConnectionWithCompletionHandler:(id)a3;
- (void)onqueue_activate;
- (void)onqueue_connectionInvalidated:(id)a3;
- (void)onqueue_enumerateRemoteObjectProxiesUsingBlock:(id)a3;
- (void)onqueue_invalidate;
- (void)onqueue_remoteObjectProxyForConnection:(id)a3 usingBlock:(id)a4;
- (void)remoteObjectProxyForConnection:(id)a3 usingBlock:(id)a4;
- (void)setActiveConnections:(id)a3;
- (void)setDispatchQueue:(id)a3;
@end

@implementation SDXPCDaemon

- (SDXPCDaemon)init
{
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___SDXPCDaemon;
  v2 = -[SDXPCDaemon init](&v9, "init");
  v4 = v2;
  if (v2)
  {
    uint64_t v5 = SFMainQueue(v2, v3);
    uint64_t v6 = objc_claimAutoreleasedReturnValue(v5);
    dispatchQueue = v4->_dispatchQueue;
    v4->_dispatchQueue = (OS_dispatch_queue *)v6;
  }

  return v4;
}

- (void)dealloc
{
  if (-[NSSet count](self->_activeConnections, "count"))
  {
    v4 = (SDXPCDaemon *)FatalErrorF("Connections still active during dealloc");
    -[SDXPCDaemon setDispatchQueue:](v4, v5, v6);
  }

  else
  {
    dispatchQueue = self->_dispatchQueue;
    if (dispatchQueue)
    {
      self->_dispatchQueue = 0LL;
    }

    v7.receiver = self;
    v7.super_class = (Class)&OBJC_CLASS___SDXPCDaemon;
    -[SDXPCDaemon dealloc](&v7, "dealloc");
  }

- (void)setDispatchQueue:(id)a3
{
  v4 = (OS_dispatch_queue *)a3;
  obj = self;
  objc_sync_enter(obj);
  if (obj->_activateCalled)
  {
    FatalErrorF("Attempt to set dispatch queue after activate has been called", v5);
    __break(1u);
  }

  else
  {
    dispatchQueue = obj->_dispatchQueue;
    obj->_dispatchQueue = v4;

    objc_sync_exit(obj);
  }

- (void)enumerateRemoteObjectProxiesUsingBlock:(id)a3
{
  id v4 = a3;
  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_100181A98;
  v7[3] = &unk_1005CB830;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(dispatchQueue, v7);
}

- (void)onqueue_enumerateRemoteObjectProxiesUsingBlock:(id)a3
{
  id v4 = (void (**)(id, void *, _BYTE *))a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (!self->_activateCalled) {
    FatalErrorF("Attempt to enqueue XPC block before activate has been called");
  }
  __int128 v18 = 0u;
  __int128 v19 = 0u;
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[SDXPCDaemon activeConnections](self, "activeConnections"));
  id v6 = [v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v17;
LABEL_4:
    uint64_t v8 = 0LL;
    while (1)
    {
      if (*(void *)v17 != v7) {
        objc_enumerationMutation(v5);
      }
      objc_super v9 = *(void **)(*((void *)&v16 + 1) + 8 * v8);
      id location = 0LL;
      objc_initWeak(&location, v9);
      v13[0] = _NSConcreteStackBlock;
      v13[1] = 3221225472LL;
      v13[2] = sub_100181C98;
      v13[3] = &unk_1005CF660;
      objc_copyWeak(&v14, &location);
      v10 = (void *)objc_claimAutoreleasedReturnValue([v9 remoteObjectProxyWithErrorHandler:v13]);
      char v12 = 0;
      v4[2](v4, v10, &v12);
      BOOL v11 = v12 == 0;

      objc_destroyWeak(&v14);
      objc_destroyWeak(&location);
      if (!v11) {
        break;
      }
      if (v6 == (id)++v8)
      {
        id v6 = [v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
        if (v6) {
          goto LABEL_4;
        }
        break;
      }
    }
  }
}

- (void)remoteObjectProxyForConnection:(id)a3 usingBlock:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100181DA0;
  block[3] = &unk_1005CB858;
  block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(dispatchQueue, block);
}

- (void)onqueue_remoteObjectProxyForConnection:(id)a3 usingBlock:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(id, void *))a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  id location = 0LL;
  objc_initWeak(&location, v6);
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472LL;
  v9[2] = sub_100181EA8;
  v9[3] = &unk_1005CF660;
  objc_copyWeak(&v10, &location);
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v6 remoteObjectProxyWithErrorHandler:v9]);
  v7[2](v7, v8);

  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);
}

- (NSXPCConnection)currentConnection
{
  return (NSXPCConnection *)dispatch_queue_get_specific((dispatch_queue_t)self->_dispatchQueue, "SDXPCDaemonConnection");
}

- (void)_activate
{
  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100181F70;
  block[3] = &unk_1005CB2F8;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

- (void)onqueue_activate
{
  BOOL activateCalled = self->_activateCalled;
  uint64_t v5 = daemon_log(v4);
  id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  id v7 = v6;
  if (activateCalled)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      sub_100182D84(v7);
    }
  }

  else
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(-[SDXPCDaemon machServiceName](self, "machServiceName"));
      int v13 = 138412290;
      id v14 = v8;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Activating %@", (uint8_t *)&v13, 0xCu);
    }

    self->_BOOL activateCalled = 1;
    id v9 = objc_alloc(&OBJC_CLASS___NSXPCListener);
    id v10 = (void *)objc_claimAutoreleasedReturnValue(-[SDXPCDaemon machServiceName](self, "machServiceName"));
    BOOL v11 = -[NSXPCListener initWithMachServiceName:](v9, "initWithMachServiceName:", v10);
    xpcListener = self->_xpcListener;
    self->_xpcListener = v11;

    -[NSXPCListener setDelegate:](self->_xpcListener, "setDelegate:", self);
    -[NSXPCListener _setQueue:](self->_xpcListener, "_setQueue:", self->_dispatchQueue);
    -[NSXPCListener resume](self->_xpcListener, "resume");
  }

- (void)_invalidate
{
  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100182120;
  block[3] = &unk_1005CB2F8;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

- (void)onqueue_invalidate
{
  if (!self->_invalidateCalled)
  {
    self->_invalidateCalled = 1;
    -[NSXPCListener invalidate](self->_xpcListener, "invalidate");
    __int128 v10 = 0u;
    __int128 v11 = 0u;
    __int128 v8 = 0u;
    __int128 v9 = 0u;
    uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(-[SDXPCDaemon activeConnections](self, "activeConnections", 0LL));
    id v4 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
    if (v4)
    {
      id v5 = v4;
      uint64_t v6 = *(void *)v9;
      do
      {
        for (i = 0LL; i != v5; i = (char *)i + 1)
        {
          if (*(void *)v9 != v6) {
            objc_enumerationMutation(v3);
          }
          [*(id *)(*((void *)&v8 + 1) + 8 * (void)i) invalidate];
        }

        id v5 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
      }

      while (v5);
    }

    self->_invalidateDone = 1;
  }

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  BOOL v8 = -[SDXPCDaemon shouldAcceptNewConnection:](self, "shouldAcceptNewConnection:", v7);
  uint64_t v9 = daemon_log(v8);
  __int128 v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v11 = objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "sd_description"));
    id v12 = (void *)v11;
    int v13 = "no";
    if (v8) {
      int v13 = "yes";
    }
    *(_DWORD *)buf = 138412546;
    *(void *)&buf[4] = v11;
    __int16 v24 = 2080;
    v25 = v13;
    _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "New connection from %@ accepted %s",  buf,  0x16u);
  }

  if (v8)
  {
    [v7 _setQueue:self->_dispatchQueue];
    [v7 setDelegate:self];
    [v7 setExportedObject:self];
    id v14 = (void *)objc_claimAutoreleasedReturnValue(-[SDXPCDaemon exportedInterface](self, "exportedInterface"));
    [v7 setExportedInterface:v14];

    v15 = (void *)objc_claimAutoreleasedReturnValue(-[SDXPCDaemon remoteObjectInterface](self, "remoteObjectInterface"));
    [v7 setRemoteObjectInterface:v15];

    *(void *)buf = 0LL;
    objc_initWeak((id *)buf, self);
    id location = 0LL;
    objc_initWeak(&location, v7);
    v19[0] = _NSConcreteStackBlock;
    v19[1] = 3221225472LL;
    v19[2] = sub_100182500;
    v19[3] = &unk_1005D0930;
    objc_copyWeak(&v20, &location);
    objc_copyWeak(&v21, (id *)buf);
    [v7 setInvalidationHandler:v19];
    [v7 resume];
    __int128 v16 = (void *)objc_claimAutoreleasedReturnValue(-[SDXPCDaemon activeConnections](self, "activeConnections"));
    __int128 v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet setWithSet:](&OBJC_CLASS___NSMutableSet, "setWithSet:", v16));

    [v17 addObject:v7];
    -[SDXPCDaemon setActiveConnections:](self, "setActiveConnections:", v17);

    objc_destroyWeak(&v21);
    objc_destroyWeak(&v20);
    objc_destroyWeak(&location);
    objc_destroyWeak((id *)buf);
  }

  return v8;
}

- (void)onqueue_connectionInvalidated:(id)a3
{
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  uint64_t v6 = daemon_log(v5);
  id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    BOOL v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "sd_description"));
    int v11 = 138412290;
    id v12 = v8;
    _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "Connection %@ invalidated",  (uint8_t *)&v11,  0xCu);
  }

  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(-[SDXPCDaemon activeConnections](self, "activeConnections"));
  id v10 = [v9 mutableCopy];

  [v10 removeObject:v4];
  -[SDXPCDaemon setActiveConnections:](self, "setActiveConnections:", v10);
  -[SDXPCDaemon connectionInvalidated:](self, "connectionInvalidated:", v4);
}

- (void)connection:(id)a3 handleInvocation:(id)a4 isReply:(BOOL)a5
{
  id v7 = a3;
  id v8 = a4;
  [v8 retainArguments];
  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100182714;
  block[3] = &unk_1005CBC20;
  id v13 = v7;
  id v14 = self;
  id v15 = v8;
  id v10 = v8;
  id v11 = v7;
  dispatch_async(dispatchQueue, block);
}

- (void)establishConnectionWithCompletionHandler:(id)a3
{
  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  uint64_t v5 = (void (**)(void))a3;
  dispatch_assert_queue_V2(dispatchQueue);
  v5[2](v5);

  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(-[SDXPCDaemon currentConnection](self, "currentConnection"));
  uint64_t v7 = daemon_log(v6);
  id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "sd_description"));
    int v10 = 138412290;
    id v11 = v9;
    _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "New connection established to %@",  (uint8_t *)&v10,  0xCu);
  }

  -[SDXPCDaemon connectionEstablished:](self, "connectionEstablished:", v6);
}

- (NSString)machServiceName
{
  uint64_t v3 = (objc_class *)objc_opt_class(self);
  id v4 = NSStringFromClass(v3);
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  uint64_t v6 = NSStringFromSelector(a2);
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  id v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Subclass %@ must override %@",  v5,  v7));
  id v9 = (id)objc_claimAutoreleasedReturnValue( +[NSException exceptionWithName:reason:userInfo:]( &OBJC_CLASS___NSException,  "exceptionWithName:reason:userInfo:",  NSInternalInconsistencyException,  v8,  0LL));

  objc_exception_throw(v9);
  return (NSString *)-[SDXPCDaemon exportedInterface](v10, v11);
}

- (NSXPCInterface)exportedInterface
{
  uint64_t v3 = (objc_class *)objc_opt_class(self);
  id v4 = NSStringFromClass(v3);
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  uint64_t v6 = NSStringFromSelector(a2);
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  id v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Subclass %@ must override %@",  v5,  v7));
  id v9 = (id)objc_claimAutoreleasedReturnValue( +[NSException exceptionWithName:reason:userInfo:]( &OBJC_CLASS___NSException,  "exceptionWithName:reason:userInfo:",  NSInternalInconsistencyException,  v8,  0LL));

  objc_exception_throw(v9);
  return -[SDXPCDaemon remoteObjectInterface](v10, v11);
}

- (NSXPCInterface)remoteObjectInterface
{
  uint64_t v3 = (objc_class *)objc_opt_class(self);
  id v4 = NSStringFromClass(v3);
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  uint64_t v6 = NSStringFromSelector(a2);
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  id v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Subclass %@ must override %@",  v5,  v7));
  id v9 = (id)objc_claimAutoreleasedReturnValue( +[NSException exceptionWithName:reason:userInfo:]( &OBJC_CLASS___NSException,  "exceptionWithName:reason:userInfo:",  NSInternalInconsistencyException,  v8,  0LL));

  objc_exception_throw(v9);
  return (NSXPCInterface *)-[SDXPCDaemon shouldAcceptNewConnection:](v10, v11, v12);
}

- (BOOL)shouldAcceptNewConnection:(id)a3
{
  id v5 = a3;
  uint64_t v6 = (objc_class *)objc_opt_class(self);
  uint64_t v7 = NSStringFromClass(v6);
  id v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  id v9 = NSStringFromSelector(a2);
  int v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
  SEL v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Subclass %@ must override %@",  v8,  v10));
  id v12 = (id)objc_claimAutoreleasedReturnValue( +[NSException exceptionWithName:reason:userInfo:]( &OBJC_CLASS___NSException,  "exceptionWithName:reason:userInfo:",  NSInternalInconsistencyException,  v11,  0LL));

  objc_exception_throw(v12);
  -[SDXPCDaemon connectionEstablished:](v13, v14, v15);
  return result;
}

- (void)connectionEstablished:(id)a3
{
  id v5 = a3;
  uint64_t v6 = (objc_class *)objc_opt_class(self);
  uint64_t v7 = NSStringFromClass(v6);
  id v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  id v9 = NSStringFromSelector(a2);
  int v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
  SEL v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Subclass %@ must override %@",  v8,  v10));
  id v12 = (id)objc_claimAutoreleasedReturnValue( +[NSException exceptionWithName:reason:userInfo:]( &OBJC_CLASS___NSException,  "exceptionWithName:reason:userInfo:",  NSInternalInconsistencyException,  v11,  0LL));

  objc_exception_throw(v12);
  -[SDXPCDaemon connectionInvalidated:](v13, v14, v15);
}

- (void)connectionInvalidated:(id)a3
{
  id v5 = a3;
  uint64_t v6 = (objc_class *)objc_opt_class(self);
  uint64_t v7 = NSStringFromClass(v6);
  id v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  id v9 = NSStringFromSelector(a2);
  int v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
  SEL v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Subclass %@ must override %@",  v8,  v10));
  id v12 = (id)objc_claimAutoreleasedReturnValue( +[NSException exceptionWithName:reason:userInfo:]( &OBJC_CLASS___NSException,  "exceptionWithName:reason:userInfo:",  NSInternalInconsistencyException,  v11,  0LL));

  objc_exception_throw(v12);
  -[SDXPCDaemon activeConnections](v13, v14);
}

- (NSSet)activeConnections
{
  return self->_activeConnections;
}

- (void)setActiveConnections:(id)a3
{
}

- (OS_dispatch_queue)dispatchQueue
{
  return self->_dispatchQueue;
}

- (void).cxx_destruct
{
}

@end