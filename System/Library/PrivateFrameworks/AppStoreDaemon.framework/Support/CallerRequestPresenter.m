@interface CallerRequestPresenter
- (void)presentAuthenticateRequest:(id)a3 resultHandler:(id)a4;
- (void)presentDialogRequest:(id)a3 resultHandler:(id)a4;
- (void)presentEngagementRequest:(id)a3 withClientInfo:(id)a4 resultHandler:(id)a5;
@end

@implementation CallerRequestPresenter

- (void)presentAuthenticateRequest:(id)a3 resultHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
  [v8 postNotificationName:@"RequestPresenterWillPresentUINotification" object:0];

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[XPCNotificationClient processInfo](self->_notificationClient, "processInfo"));
  if (v9)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[XPCNotificationClient processInfo](self->_notificationClient, "processInfo"));
    v11 = (void *)objc_claimAutoreleasedReturnValue([v6 options]);
    [v11 setClientInfo:v10];
  }

  notificationClient = self->_notificationClient;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472LL;
  v15[2] = sub_1002778D4;
  v15[3] = &unk_1003EBD80;
  id v16 = v6;
  id v17 = v7;
  id v13 = v7;
  id v14 = v6;
  -[XPCNotificationClient deliverAuthenticateRequest:withResultHandler:]( notificationClient,  "deliverAuthenticateRequest:withResultHandler:",  v14,  v15);
}

- (void)presentDialogRequest:(id)a3 resultHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
  [v8 postNotificationName:@"RequestPresenterWillPresentUINotification" object:0];

  notificationClient = self->_notificationClient;
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472LL;
  v12[2] = sub_100277B0C;
  v12[3] = &unk_1003EBDA8;
  id v13 = v6;
  id v14 = v7;
  id v10 = v7;
  id v11 = v6;
  -[XPCNotificationClient deliverDialogRequest:withResultHandler:]( notificationClient,  "deliverDialogRequest:withResultHandler:",  v11,  v12);
}

- (void)presentEngagementRequest:(id)a3 withClientInfo:(id)a4 resultHandler:(id)a5
{
  id v7 = a3;
  id v8 = a5;
  notificationClient = self->_notificationClient;
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472LL;
  v12[2] = sub_100277D18;
  v12[3] = &unk_1003EEC60;
  id v13 = v7;
  id v14 = v8;
  id v10 = v8;
  id v11 = v7;
  -[XPCNotificationClient deliverEngagementRequest:withResultHandler:]( notificationClient,  "deliverEngagementRequest:withResultHandler:",  v11,  v12);
}

- (void).cxx_destruct
{
}

@end