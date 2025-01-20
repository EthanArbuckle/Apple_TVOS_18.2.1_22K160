@interface NEFlowDivertPlugin
- (id)managerInterface;
- (id)remotePluginInterface;
- (void)createFlowDivertControlSocketWithCompletionHandler:(id)a3;
@end

@implementation NEFlowDivertPlugin

- (void)createFlowDivertControlSocketWithCompletionHandler:(id)a3
{
  id v4 = a3;
  v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[NEPlugin delegateQueue](self, "delegateQueue"));
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_100014190;
  v7[3] = &unk_1000BED58;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

- (id)remotePluginInterface
{
  return +[NSXPCInterface interfaceWithProtocol:]( &OBJC_CLASS___NSXPCInterface,  "interfaceWithProtocol:",  &OBJC_PROTOCOL___NEFlowDivertPluginDriver);
}

- (id)managerInterface
{
  return +[NSXPCInterface interfaceWithProtocol:]( &OBJC_CLASS___NSXPCInterface,  "interfaceWithProtocol:",  &OBJC_PROTOCOL___NEFlowDivertPluginManager);
}

@end