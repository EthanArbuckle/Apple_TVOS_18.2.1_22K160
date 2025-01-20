@interface AMSDAcceptHomeCloudShareTask
- (AMSDAcceptHomeCloudShareTask)initWithController:(id)a3 cloudShare:(id)a4;
- (AMSDHomeCloudShare)share;
- (AMSDMultiUserController)controller;
- (id)_generateInviteCode;
- (id)_performAuthKitUpdateTaskWithOptions:(id)a3;
- (id)performTask;
@end

@implementation AMSDAcceptHomeCloudShareTask

- (AMSDAcceptHomeCloudShareTask)initWithController:(id)a3 cloudShare:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)&OBJC_CLASS___AMSDAcceptHomeCloudShareTask;
  v9 = -[AMSDAcceptHomeCloudShareTask init](&v12, "init");
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_controller, a3);
    objc_storeStrong((id *)&v10->_share, a4);
  }

  return v10;
}

- (id)performTask
{
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472LL;
  v3[2] = sub_100003474;
  v3[3] = &unk_1000D5B50;
  v3[4] = self;
  return (id)objc_claimAutoreleasedReturnValue( -[AMSDAcceptHomeCloudShareTask performTaskWithPromiseBlock:]( self,  "performTaskWithPromiseBlock:",  v3));
}

- (id)_generateInviteCode
{
  v3 = objc_alloc_init(&OBJC_CLASS___AMSMutablePromise);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[AMSDAcceptHomeCloudShareTask controller](self, "controller"));
  v5 = (void *)objc_claimAutoreleasedReturnValue([v4 homeManager]);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[AMSDAcceptHomeCloudShareTask share](self, "share"));
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 homeIdentifier]);
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v5 homeWithHomeIdentifier:v7]);

  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472LL;
  v21[2] = sub_100003C4C;
  v21[3] = &unk_1000D5AD8;
  v9 = v3;
  v22 = v9;
  [v8 addErrorBlock:v21];
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472LL;
  v20[2] = sub_100003C58;
  v20[3] = &unk_1000D5B78;
  v20[4] = self;
  v10 = (void *)objc_claimAutoreleasedReturnValue([v8 thenWithBlock:v20]);
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472LL;
  v18[2] = sub_100003CE0;
  v18[3] = &unk_1000D5AD8;
  v11 = v9;
  v19 = v11;
  [v10 addErrorBlock:v18];
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472LL;
  v16[2] = sub_100003CEC;
  v16[3] = &unk_1000D5BA0;
  objc_super v12 = v11;
  v17 = v12;
  [v10 addSuccessBlock:v16];
  v13 = v17;
  v14 = v12;

  return v14;
}

- (id)_performAuthKitUpdateTaskWithOptions:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc(&OBJC_CLASS___AMSAuthKitUpdateTask);
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[ACAccountStore ams_sharedAccountStore](&OBJC_CLASS___ACAccountStore, "ams_sharedAccountStore"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "ams_activeiCloudAccount"));
  id v7 = [v4 initWithAccount:v6 options:v3];

  [v7 setRunMode:1];
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 performAuthKitUpdate]);

  return v8;
}

- (AMSDMultiUserController)controller
{
  return self->_controller;
}

- (AMSDHomeCloudShare)share
{
  return self->_share;
}

- (void).cxx_destruct
{
}

@end