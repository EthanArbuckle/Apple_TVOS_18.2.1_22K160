@interface NEVPNTunnelPlugin
- (NEVPNTunnelPlugin)initWithAgent:(id)a3 delegateQueue:(id)a4 andDelegate:(id)a5;
- (id)managerInterface;
- (id)remotePluginInterface;
- (void)createVirtualInterfaceWithParameters:(id)a3 completionHandler:(id)a4;
- (void)handleIPCDetached;
- (void)handlePluginFailedWithError:(id)a3;
- (void)setStatus:(int)a3 error:(id)a4;
- (void)setTunnelNetworkSettings:(id)a3 completionHandler:(id)a4;
@end

@implementation NEVPNTunnelPlugin

- (NEVPNTunnelPlugin)initWithAgent:(id)a3 delegateQueue:(id)a4 andDelegate:(id)a5
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___NEVPNTunnelPlugin;
  result = -[NEPlugin initWithAgent:delegateQueue:andDelegate:]( &v6,  "initWithAgent:delegateQueue:andDelegate:",  a3,  a4,  a5);
  if (result) {
    result->_pluginStatus = 0;
  }
  return result;
}

- (void)handlePluginFailedWithError:(id)a3
{
  self->_pluginStatus = 0;
  id v4 = a3;
  id v5 = (id)objc_claimAutoreleasedReturnValue(-[NEPlugin delegate](self, "delegate"));
  [v5 plugin:self didSetStatus:0 andDisconnectError:v4];
}

- (void)createVirtualInterfaceWithParameters:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[NEPlugin delegateQueue](self, "delegateQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100013FE0;
  block[3] = &unk_1000BED30;
  block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(v8, block);
}

- (void)handleIPCDetached
{
  v3 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[NEPlugin delegateQueue](self, "delegateQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100013FA0;
  block[3] = &unk_1000BEC08;
  block[4] = self;
  dispatch_async(v3, block);
}

- (void)setStatus:(int)a3 error:(id)a4
{
  id v6 = a4;
  id v7 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[NEPlugin delegateQueue](self, "delegateQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100013F1C;
  block[3] = &unk_1000BEDA8;
  int v11 = a3;
  block[4] = self;
  id v10 = v6;
  id v8 = v6;
  dispatch_async(v7, block);
}

- (void)setTunnelNetworkSettings:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[NEPlugin delegateQueue](self, "delegateQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100013E0C;
  block[3] = &unk_1000BED30;
  block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(v8, block);
}

- (id)remotePluginInterface
{
  return +[NSXPCInterface interfaceWithProtocol:]( &OBJC_CLASS___NSXPCInterface,  "interfaceWithProtocol:",  &OBJC_PROTOCOL___NEVPNPluginDriver);
}

- (id)managerInterface
{
  return +[NSXPCInterface interfaceWithProtocol:]( &OBJC_CLASS___NSXPCInterface,  "interfaceWithProtocol:",  &OBJC_PROTOCOL___NEVPNPluginManager);
}

@end