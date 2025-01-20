@interface CSDCallHistoryControllerXPCServer
- (CSDCallHistoryController)callHistoryController;
- (CSDCallHistoryControllerXPCServer)initWithCallHistoryController:(id)a3;
- (CSDClientManager)clientManager;
- (OS_dispatch_queue)queue;
- (int)clientsShouldConnectToken;
- (void)allCallHistoryDeleted;
- (void)dealloc;
- (void)invalidate;
- (void)notifyClientsToConnectIfNecessary;
- (void)recentCallsDeleted:(id)a3;
- (void)registerClient:(id)a3;
- (void)setClientsShouldConnectToken:(int)a3;
- (void)unregisterClient:(id)a3;
@end

@implementation CSDCallHistoryControllerXPCServer

- (CSDCallHistoryControllerXPCServer)initWithCallHistoryController:(id)a3
{
  id v5 = a3;
  v22.receiver = self;
  v22.super_class = (Class)&OBJC_CLASS___CSDCallHistoryControllerXPCServer;
  v6 = -[CSDCallHistoryControllerXPCServer init](&v22, "init");
  if (v6)
  {
    id v7 = sub_1001704C4();
    v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "Creating CSDCallHistoryControllerXPCServer",  buf,  2u);
    }

    dispatch_queue_t v9 = dispatch_queue_create("com.apple.telephonyutilities.callservicesd.callhistorycontrollerxpcserver", 0LL);
    queue = v6->_queue;
    v6->_queue = (OS_dispatch_queue *)v9;

    objc_storeStrong((id *)&v6->_callHistoryController, a3);
    v11 = -[CSDClientManager initWithSerialQueue:]( objc_alloc(&OBJC_CLASS___CSDClientManager),  "initWithSerialQueue:",  v6->_queue);
    clientManager = v6->_clientManager;
    v6->_clientManager = v11;

    v13 = (dispatch_queue_s *)v6->_queue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_100021F18;
    block[3] = &unk_1003D7730;
    v14 = v6;
    v20 = v14;
    dispatch_sync(v13, block);
    v15 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDCallHistoryControllerXPCServer queue](v14, "queue"));
    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472LL;
    v17[2] = sub_10002218C;
    v17[3] = &unk_1003D7730;
    v18 = v14;
    dispatch_async(v15, v17);
  }

  return v6;
}

- (void)dealloc
{
  id v3 = sub_1001704C4();
  v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "deallocing CallHistoryControllerXPCServer",  buf,  2u);
  }

  notify_cancel(self->_clientsShouldConnectToken);
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___CSDCallHistoryControllerXPCServer;
  -[CSDCallHistoryControllerXPCServer dealloc](&v5, "dealloc");
}

- (void)invalidate
{
  id v3 = sub_1001704C4();
  v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "invalidating CallHistoryControllerXPCServer",  buf,  2u);
  }

  objc_super v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDCallHistoryControllerXPCServer queue](self, "queue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100022330;
  block[3] = &unk_1003D7730;
  void block[4] = self;
  dispatch_async(v5, block);
}

- (void)notifyClientsToConnectIfNecessary
{
  id v3 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDCallHistoryControllerXPCServer queue](self, "queue"));
  dispatch_assert_queue_V2(v3);

  id v4 = sub_1001704C4();
  objc_super v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "NOTIFYING CLIENTS TO CONNECT", v6, 2u);
  }

  notify_set_state(self->_clientsShouldConnectToken, 1uLL);
  notify_post("CSDCallHistoryControllerClientsShouldConnectNotification");
}

- (void)registerClient:(id)a3
{
  id v4 = a3;
  objc_super v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDCallHistoryControllerXPCServer queue](self, "queue"));
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_10002248C;
  v7[3] = &unk_1003D7758;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

- (void)unregisterClient:(id)a3
{
  id v4 = a3;
  objc_super v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDCallHistoryControllerXPCServer queue](self, "queue"));
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_100022564;
  v7[3] = &unk_1003D7758;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

- (void)recentCallsDeleted:(id)a3
{
  id v4 = a3;
  objc_super v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDCallHistoryControllerXPCServer queue](self, "queue"));
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_10002263C;
  v7[3] = &unk_1003D7758;
  id v8 = v4;
  dispatch_queue_t v9 = self;
  id v6 = v4;
  dispatch_async(v5, v7);
}

- (void)allCallHistoryDeleted
{
  id v3 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDCallHistoryControllerXPCServer queue](self, "queue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100022768;
  block[3] = &unk_1003D7730;
  void block[4] = self;
  dispatch_async(v3, block);
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (CSDCallHistoryController)callHistoryController
{
  return self->_callHistoryController;
}

- (CSDClientManager)clientManager
{
  return self->_clientManager;
}

- (int)clientsShouldConnectToken
{
  return self->_clientsShouldConnectToken;
}

- (void)setClientsShouldConnectToken:(int)a3
{
  self->_clientsShouldConnectToken = a3;
}

- (void).cxx_destruct
{
}

@end