@interface NEFilterPlugin
- (id)managerInterface;
- (id)remotePluginInterface;
- (void)acceptAgentClients;
- (void)applySettings:(id)a3 completionHandler:(id)a4;
- (void)createContentFilterSocketWithCompletionHandler:(id)a3;
- (void)createPacketChannelWithCompletionHandler:(id)a3;
- (void)handlePluginFailedWithError:(id)a3;
- (void)setStatus:(int64_t)a3 error:(id)a4;
@end

@implementation NEFilterPlugin

- (void)createContentFilterSocketWithCompletionHandler:(id)a3
{
  id v4 = a3;
  v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[NEPlugin delegateQueue](self, "delegateQueue"));
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_1000147E4;
  v7[3] = &unk_1000BED58;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

- (void)createPacketChannelWithCompletionHandler:(id)a3
{
  id v4 = a3;
  v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[NEPlugin delegateQueue](self, "delegateQueue"));
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_100014788;
  v7[3] = &unk_1000BED58;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

- (void)handlePluginFailedWithError:(id)a3
{
  self->_filterStatus = 0LL;
  id v4 = (id)objc_claimAutoreleasedReturnValue(-[NEPlugin delegate](self, "delegate", a3));
  [v4 plugin:self didSetStatus:0 andError:1];
}

- (void)setStatus:(int64_t)a3 error:(id)a4
{
  id v6 = a4;
  v7 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[NEPlugin delegateQueue](self, "delegateQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000146A8;
  block[3] = &unk_1000BE8D8;
  id v10 = v6;
  int64_t v11 = a3;
  block[4] = self;
  id v8 = v6;
  dispatch_async(v7, block);
}

- (void)acceptAgentClients
{
  v3 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[NEPlugin delegateQueue](self, "delegateQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100014668;
  block[3] = &unk_1000BEC08;
  block[4] = self;
  dispatch_async(v3, block);
}

- (id)remotePluginInterface
{
  return +[NSXPCInterface interfaceWithProtocol:]( &OBJC_CLASS___NSXPCInterface,  "interfaceWithProtocol:",  &OBJC_PROTOCOL___NEFilterPluginDriver);
}

- (id)managerInterface
{
  return +[NSXPCInterface interfaceWithProtocol:]( &OBJC_CLASS___NSXPCInterface,  "interfaceWithProtocol:",  &OBJC_PROTOCOL___NEFilterPluginManager);
}

- (void)applySettings:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[NEPlugin delegateQueue](self, "delegateQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10001460C;
  block[3] = &unk_1000BED30;
  block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(v8, block);
}

@end