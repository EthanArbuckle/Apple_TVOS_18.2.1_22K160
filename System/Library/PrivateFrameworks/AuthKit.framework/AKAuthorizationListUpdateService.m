@interface AKAuthorizationListUpdateService
+ (id)sharedService;
- (AKAuthorizationListUpdateService)init;
- (void)_clearStaleCachedDevices;
- (void)performAuthorizationCheckInWithCompletion:(id)a3;
- (void)performGlobalConfigUpdateWithCompletion:(id)a3;
- (void)start;
@end

@implementation AKAuthorizationListUpdateService

+ (id)sharedService
{
  if (qword_10020F588 != -1) {
    dispatch_once(&qword_10020F588, &stru_1001CA488);
  }
  return (id)qword_10020F580;
}

- (AKAuthorizationListUpdateService)init
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___AKAuthorizationListUpdateService;
  v2 = -[AKAuthorizationListUpdateService init](&v6, "init");
  if (v2)
  {
    uint64_t v3 = objc_claimAutoreleasedReturnValue(+[AKAccountManager sharedInstance](&OBJC_CLASS___AKAccountManager, "sharedInstance"));
    accountManager = v2->_accountManager;
    v2->_accountManager = (AKAccountManager *)v3;
  }

  return v2;
}

- (void)start
{
  uint64_t v3 = _AKLogSystem(self);
  v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v7 = "com.apple.ak.listupdate";
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Registering for XPC activity: %s...", buf, 0xCu);
  }

  handler[0] = _NSConcreteStackBlock;
  handler[1] = 3221225472LL;
  handler[2] = sub_100098AC0;
  handler[3] = &unk_1001C7880;
  handler[4] = self;
  xpc_activity_register("com.apple.ak.listupdate", XPC_ACTIVITY_CHECK_IN, handler);
}

- (void)performAuthorizationCheckInWithCompletion:(id)a3
{
  id v4 = a3;
  v5 = dispatch_group_create();
  objc_super v6 = (void *)objc_claimAutoreleasedReturnValue(-[AKAccountManager primaryAuthKitAccount](self->_accountManager, "primaryAuthKitAccount"));
  dispatch_group_enter(v5);
  if (v6)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[AKAccountManager altDSIDForAccount:](self->_accountManager, "altDSIDForAccount:", v6));
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[AKUserInfoController sharedController](&OBJC_CLASS___AKUserInfoController, "sharedController"));
    v23[0] = _NSConcreteStackBlock;
    v23[1] = 3221225472LL;
    v23[2] = sub_100098EE0;
    v23[3] = &unk_1001CA4B0;
    id v24 = v8;
    v25 = v5;
    id v10 = v8;
    [v9 fetchUserInformationForAltDSID:v10 client:0 completion:v23];
  }

  else
  {
    uint64_t v11 = _AKLogSystem(v7);
    v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEFAULT,  "No Primary AuthKit account found skipping user information fetch",  buf,  2u);
    }

    dispatch_group_leave(v5);
  }

  v13 = (void *)objc_claimAutoreleasedReturnValue(+[AKFeatureManager sharedManager](&OBJC_CLASS___AKFeatureManager, "sharedManager"));
  unsigned int v14 = [v13 isDeviceListCacheEnableDryMode];

  if (v14)
  {
    dispatch_queue_global_t global_queue = dispatch_get_global_queue(9LL, 0LL);
    v16 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(global_queue);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_100098FC8;
    block[3] = &unk_1001C7300;
    block[4] = self;
    dispatch_async(v16, block);
  }

  dispatch_queue_global_t v17 = dispatch_get_global_queue(2LL, 0LL);
  v18 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(v17);
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472LL;
  v20[2] = sub_100098FD0;
  v20[3] = &unk_1001C78D0;
  id v21 = v4;
  id v19 = v4;
  dispatch_group_notify(v5, v18, v20);
}

- (void)performGlobalConfigUpdateWithCompletion:(id)a3
{
  id v4 = (void (**)(void))a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[AKAccountManager primaryAuthKitAccount](self->_accountManager, "primaryAuthKitAccount"));
  if (v5)
  {
    objc_super v6 = (void *)objc_claimAutoreleasedReturnValue(+[AKGlobalConfigService sharedInstance](&OBJC_CLASS___AKGlobalConfigService, "sharedInstance"));
    uint64_t v7 = AKRequestContextScheduledActivity;
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472LL;
    v10[2] = sub_100099100;
    v10[3] = &unk_1001C7B60;
    uint64_t v11 = v4;
    [v6 fetchGlobalConfigUsingCachePolicy:1 context:v7 completion:v10];
  }

  else
  {
    uint64_t v8 = _AKLogSystem(0LL);
    v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "No Primary AuthKit account found skipping global config fetch",  buf,  2u);
    }

    if (v4) {
      v4[2](v4);
    }
  }
}

- (void)_clearStaleCachedDevices
{
  id v3 = (id)objc_claimAutoreleasedReturnValue(+[AKDeviceListStoreManager sharedManager](&OBJC_CLASS___AKDeviceListStoreManager, "sharedManager"));
  [v3 clearStaleDevicesWithAccountManager:self->_accountManager completionHandler:&stru_1001CA4D0];
}

- (void).cxx_destruct
{
}

@end