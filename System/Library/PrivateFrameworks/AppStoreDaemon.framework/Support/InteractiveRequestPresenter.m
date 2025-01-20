@interface InteractiveRequestPresenter
- (void)authenticateTask:(id)a3 handleDialogRequest:(id)a4 completion:(id)a5;
- (void)presentAuthenticateRequest:(id)a3 resultHandler:(id)a4;
- (void)presentDialogRequest:(id)a3 resultHandler:(id)a4;
- (void)presentEngagementRequest:(id)a3 withClientInfo:(id)a4 resultHandler:(id)a5;
@end

@implementation InteractiveRequestPresenter

- (void)presentAuthenticateRequest:(id)a3 resultHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
  [v8 postNotificationName:@"RequestPresenterWillPresentUINotification" object:0];

  else {
    id v9 = sub_100255630((uint64_t)&OBJC_CLASS___URLBag);
  }
  v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
  uint64_t v18 = 0LL;
  v19 = &v18;
  uint64_t v20 = 0x3032000000LL;
  v21 = sub_10027775C;
  v22 = sub_10027776C;
  id v23 = [[AMSAuthenticateTask alloc] initWithRequest:v6 bag:v10];
  [(id)v19[5] setDelegate:self];
  v11 = (void *)objc_claimAutoreleasedReturnValue([(id)v19[5] performAuthentication]);
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472LL;
  v14[2] = sub_1002784BC;
  v14[3] = &unk_1003EF6D8;
  id v12 = v6;
  id v15 = v12;
  id v13 = v7;
  id v16 = v13;
  v17 = &v18;
  [v11 addFinishBlock:v14];

  _Block_object_dispose(&v18, 8);
}

- (void)presentDialogRequest:(id)a3 resultHandler:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
  [v7 postNotificationName:@"RequestPresenterWillPresentUINotification" object:0];

  uint64_t v15 = 0LL;
  id v16 = &v15;
  uint64_t v17 = 0x3032000000LL;
  uint64_t v18 = sub_10027775C;
  v19 = sub_10027776C;
  uint64_t v20 = -[AMSSystemAlertDialogTask initWithRequest:]( objc_alloc(&OBJC_CLASS___AMSSystemAlertDialogTask),  "initWithRequest:",  v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue([(id)v16[5] present]);
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472LL;
  v11[2] = sub_100278784;
  v11[3] = &unk_1003EF700;
  id v9 = v5;
  id v12 = v9;
  id v10 = v6;
  id v13 = v10;
  v14 = &v15;
  [v8 addFinishBlock:v11];

  _Block_object_dispose(&v15, 8);
}

- (void)presentEngagementRequest:(id)a3 withClientInfo:(id)a4 resultHandler:(id)a5
{
  id v5 = (void (**)(id, void, id))a5;
  id v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
  [v6 postNotificationName:@"RequestPresenterWillPresentUINotification" object:0];

  uint64_t v7 = ASDErrorWithTitleAndMessage(ASDErrorDomain, 909LL, 0LL, 0LL);
  id v8 = (id)objc_claimAutoreleasedReturnValue(v7);
  v5[2](v5, 0LL, v8);
}

- (void)authenticateTask:(id)a3 handleDialogRequest:(id)a4 completion:(id)a5
{
}

@end