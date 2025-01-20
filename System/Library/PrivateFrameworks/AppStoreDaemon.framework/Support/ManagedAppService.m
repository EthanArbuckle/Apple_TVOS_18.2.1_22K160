@interface ManagedAppService
- (ManagedAppService)init;
- (void)processITMSServicesRequest:(id)a3 withReplyHandler:(id)a4;
- (void)requestStatusWithReply:(id)a3;
- (void)showVPPInviteForCurrentUser:(id)a3 orgName:(id)a4 withReplyHandler:(id)a5;
- (void)submitManifestRequest:(id)a3 withReplyHandler:(id)a4;
- (void)submitVPPRequest:(id)a3 withReplyHandler:(id)a4;
@end

@implementation ManagedAppService

- (ManagedAppService)init
{
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___ManagedAppService;
  v2 = -[ManagedAppService init](&v8, "init");
  if (v2)
  {
    dispatch_queue_attr_t v3 = dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v4 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v3);
    dispatch_queue_t v5 = dispatch_queue_create("com.apple.AppStoreDaemon.ManagedAppService", v4);
    dispatchQueue = v2->_dispatchQueue;
    v2->_dispatchQueue = (OS_dispatch_queue *)v5;
  }

  return v2;
}

- (void)processITMSServicesRequest:(id)a3 withReplyHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_super v8 = sub_100316770((uint64_t)&OBJC_CLASS___XPCRequestToken);
  v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
  dispatchQueue = self->_dispatchQueue;
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472LL;
  v14[2] = sub_10026BE5C;
  v14[3] = &unk_1003E9FD0;
  id v16 = v6;
  id v17 = v7;
  id v15 = v9;
  id v11 = v6;
  id v12 = v7;
  id v13 = v9;
  sub_10022ED10(dispatchQueue, v14);
}

- (void)requestStatusWithReply:(id)a3
{
  id v4 = a3;
  dispatch_queue_t v5 = sub_100316770((uint64_t)&OBJC_CLASS___XPCRequestToken);
  id v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  dispatchQueue = self->_dispatchQueue;
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472LL;
  v10[2] = sub_10026C020;
  v10[3] = &unk_1003E9FF8;
  id v11 = v6;
  id v12 = v4;
  id v8 = v4;
  id v9 = v6;
  sub_10022ED10(dispatchQueue, v10);
}

- (void)showVPPInviteForCurrentUser:(id)a3 orgName:(id)a4 withReplyHandler:(id)a5
{
  id v6 = a5;
  dispatchQueue = self->_dispatchQueue;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472LL;
  v9[2] = sub_10026C2CC;
  v9[3] = &unk_1003EA158;
  id v10 = v6;
  id v8 = v6;
  sub_10022ED10(dispatchQueue, v9);
}

- (void)submitManifestRequest:(id)a3 withReplyHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = sub_100316770((uint64_t)&OBJC_CLASS___XPCRequestToken);
  id v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
  dispatchQueue = self->_dispatchQueue;
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472LL;
  v14[2] = sub_10026C400;
  v14[3] = &unk_1003EA390;
  id v15 = v9;
  id v16 = v6;
  id v17 = v7;
  id v11 = v7;
  id v12 = v6;
  id v13 = v9;
  sub_10022ED10(dispatchQueue, v14);
}

- (void)submitVPPRequest:(id)a3 withReplyHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = sub_100316770((uint64_t)&OBJC_CLASS___XPCRequestToken);
  id v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
  dispatchQueue = self->_dispatchQueue;
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472LL;
  v14[2] = sub_10026C61C;
  v14[3] = &unk_1003EA390;
  id v15 = v9;
  id v16 = v6;
  id v17 = v7;
  id v11 = v7;
  id v12 = v6;
  id v13 = v9;
  sub_10022ED10(dispatchQueue, v14);
}

- (void).cxx_destruct
{
}

@end