@interface NEPlugin
- (NEPlugin)initWithAgent:(id)a3 delegateQueue:(id)a4 andDelegate:(id)a5;
- (NEPluginDelegate)delegate;
- (NSString)internalDescription;
- (NSXPCConnection)pluginConnection;
- (NSXPCInterface)managerInterface;
- (NSXPCInterface)remotePluginInterface;
- (OS_dispatch_queue)delegateQueue;
- (id)description;
- (id)remotePluginObject;
- (id)remotePluginObjectWithErrorHandler:(id)a3;
- (int)extension_pid;
- (void)setExtension_pid:(int)a3;
- (void)setInternalDescription:(id)a3;
- (void)setPluginConnection:(id)a3;
- (void)setStarted:(BOOL)a3;
@end

@implementation NEPlugin

- (NEPlugin)initWithAgent:(id)a3 delegateQueue:(id)a4 andDelegate:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v23.receiver = self;
  v23.super_class = (Class)&OBJC_CLASS___NEPlugin;
  v12 = -[NEPlugin init](&v23, "init");
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_agent, a3);
    objc_storeStrong((id *)&v13->_delegateQueue, a4);
    agent = v13->_agent;
    if (agent) {
      objc_setProperty_atomic(agent, v14, v13->_delegateQueue, 32LL);
    }
    objc_storeWeak((id *)&v13->_delegate, v11);
    v16 = objc_alloc(&OBJC_CLASS___NSString);
    v17 = (objc_class *)objc_opt_class(v13);
    v18 = NSStringFromClass(v17);
    v19 = (void *)objc_claimAutoreleasedReturnValue(v18);
    v20 = -[NSString initWithFormat:](v16, "initWithFormat:", @"%@(%@)", v19, v9);
    internalDescription = v13->_internalDescription;
    v13->_internalDescription = v20;

    v13->_started = 0;
  }

  return v13;
}

- (id)description
{
  return -[NEPlugin internalDescription](self, "internalDescription");
}

- (id)remotePluginObject
{
  pluginDriver = self->_pluginDriver;
  if (pluginDriver)
  {
    v3 = pluginDriver;
  }

  else
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[NEPlugin pluginConnection](self, "pluginConnection"));
    v3 = (NEPluginDriver *)objc_claimAutoreleasedReturnValue([v4 remoteObjectProxy]);
  }

  return v3;
}

- (id)remotePluginObjectWithErrorHandler:(id)a3
{
  pluginDriver = self->_pluginDriver;
  if (pluginDriver)
  {
    v4 = pluginDriver;
  }

  else
  {
    id v6 = a3;
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[NEPlugin pluginConnection](self, "pluginConnection"));
    v4 = (NEPluginDriver *)objc_claimAutoreleasedReturnValue([v7 remoteObjectProxyWithErrorHandler:v6]);
  }

  return v4;
}

- (NSXPCInterface)remotePluginInterface
{
  return +[NSXPCInterface interfaceWithProtocol:]( &OBJC_CLASS___NSXPCInterface,  "interfaceWithProtocol:",  &OBJC_PROTOCOL___NEPluginDriver);
}

- (NSXPCInterface)managerInterface
{
  return 0LL;
}

- (void)setStarted:(BOOL)a3
{
  self->_started = a3;
}

- (NEPluginDelegate)delegate
{
  return (NEPluginDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (OS_dispatch_queue)delegateQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 40LL, 1);
}

- (int)extension_pid
{
  return self->_extension_pid;
}

- (void)setExtension_pid:(int)a3
{
  self->_extension_pid = a3;
}

- (NSXPCConnection)pluginConnection
{
  return (NSXPCConnection *)objc_getProperty(self, a2, 48LL, 1);
}

- (void)setPluginConnection:(id)a3
{
}

- (NSString)internalDescription
{
  return self->_internalDescription;
}

- (void)setInternalDescription:(id)a3
{
}

- (void).cxx_destruct
{
}

@end