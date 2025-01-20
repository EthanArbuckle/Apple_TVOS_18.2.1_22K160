@interface HHDManagementServer
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (HHDManagementServer)initWithFactory:(id)a3 queue:(id)a4;
- (HHDManagementServer)initWithQueue:(id)a3;
- (void)bootstrapWithServiceRegistry:(id)a3;
- (void)dispatchNotificationWithInvocation:(id)a3;
- (void)start;
- (void)stop;
@end

@implementation HHDManagementServer

- (HHDManagementServer)initWithFactory:(id)a3 queue:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v15.receiver = self;
  v15.super_class = (Class)&OBJC_CLASS___HHDManagementServer;
  v8 = -[HHDManagementServer init](&v15, "init");
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_queue, a4);
    uint64_t v10 = objc_claimAutoreleasedReturnValue([v6 createListener]);
    listener = v9->_listener;
    v9->_listener = (NSXPCListener *)v10;

    uint64_t v12 = objc_claimAutoreleasedReturnValue([v6 createClientManagerWithQueue:v7]);
    clientManager = v9->_clientManager;
    v9->_clientManager = (HHDClientManager *)v12;
  }

  return v9;
}

- (HHDManagementServer)initWithQueue:(id)a3
{
  id v4 = a3;
  v5 = objc_opt_new(&OBJC_CLASS___HHDManagementServerDependencyFactory);
  id v6 = -[HHDManagementServer initWithFactory:queue:](self, "initWithFactory:queue:", v5, v4);

  return v6;
}

- (void)bootstrapWithServiceRegistry:(id)a3
{
  id v5 = a3;
  -[HHDClientManager bootstrapWithServiceRegistry:](self->_clientManager, "bootstrapWithServiceRegistry:", v5);
}

- (void)start
{
  id v3 = sub_10000B220();
  id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 138412290;
    id v6 = &stru_100024E50;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%@Starting", (uint8_t *)&v5, 0xCu);
  }

  -[NSXPCListener _setQueue:](self->_listener, "_setQueue:", self->_queue);
  -[NSXPCListener setDelegate:](self->_listener, "setDelegate:", self);
  -[NSXPCListener resume](self->_listener, "resume");
}

- (void)stop
{
  id v3 = sub_10000B220();
  id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 138412290;
    id v6 = &stru_100024E50;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%@Stopping", (uint8_t *)&v5, 0xCu);
  }

  -[NSXPCListener invalidate](self->_listener, "invalidate");
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v6 = a4;
  if (self->_listener == a3
    && -[HHDClientManager addClientWithConnection:](self->_clientManager, "addClientWithConnection:", v6))
  {
    [v6 resume];
    BOOL v7 = 1;
  }

  else
  {
    BOOL v7 = 0;
  }

  return v7;
}

- (void)dispatchNotificationWithInvocation:(id)a3
{
}

- (void).cxx_destruct
{
}

@end