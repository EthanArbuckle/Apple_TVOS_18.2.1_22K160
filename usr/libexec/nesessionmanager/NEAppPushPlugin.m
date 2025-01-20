@interface NEAppPushPlugin
- (id)managerInterface;
- (id)remotePluginInterface;
- (void)handleProviderError:(id)a3;
- (void)handleProviderError:(id)a3 forMessageID:(id)a4;
- (void)handleProviderInstallationStatus:(int64_t)a3;
- (void)handleProviderStopped;
- (void)reportIncomingCall:(id)a3;
- (void)reportPushToTalkMessage:(id)a3;
- (void)sendExtensionFailed;
@end

@implementation NEAppPushPlugin

- (id)remotePluginInterface
{
  return +[NSXPCInterface interfaceWithProtocol:]( &OBJC_CLASS___NSXPCInterface,  "interfaceWithProtocol:",  &OBJC_PROTOCOL___NEAppPushPluginDriver);
}

- (id)managerInterface
{
  return +[NSXPCInterface interfaceWithProtocol:]( &OBJC_CLASS___NSXPCInterface,  "interfaceWithProtocol:",  &OBJC_PROTOCOL___NEAppPushPluginManager);
}

- (void)handleProviderError:(id)a3
{
  id v4 = a3;
  v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[NEPlugin delegateQueue](self, "delegateQueue"));
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_100014DC0;
  v7[3] = &unk_1000BEBE0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

- (void)handleProviderError:(id)a3 forMessageID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[NEPlugin delegateQueue](self, "delegateQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100014D7C;
  block[3] = &unk_1000BE900;
  block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(v8, block);
}

- (void)reportIncomingCall:(id)a3
{
  id v4 = a3;
  v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[NEPlugin delegateQueue](self, "delegateQueue"));
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_100014D3C;
  v7[3] = &unk_1000BEBE0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

- (void)reportPushToTalkMessage:(id)a3
{
  id v4 = a3;
  v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[NEPlugin delegateQueue](self, "delegateQueue"));
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_100014CFC;
  v7[3] = &unk_1000BEBE0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

- (void)sendExtensionFailed
{
  v3 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[NEPlugin delegateQueue](self, "delegateQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100014CBC;
  block[3] = &unk_1000BEC08;
  block[4] = self;
  dispatch_async(v3, block);
}

- (void)handleProviderStopped
{
  v3 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[NEPlugin delegateQueue](self, "delegateQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100014C7C;
  block[3] = &unk_1000BEC08;
  block[4] = self;
  dispatch_async(v3, block);
}

- (void)handleProviderInstallationStatus:(int64_t)a3
{
  v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[NEPlugin delegateQueue](self, "delegateQueue"));
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  v6[2] = sub_100014C3C;
  v6[3] = &unk_1000BEB20;
  v6[4] = self;
  v6[5] = a3;
  dispatch_async(v5, v6);
}

@end