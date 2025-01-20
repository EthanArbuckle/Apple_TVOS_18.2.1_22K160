@interface ActiveAccountObserver
+ (ACAccount)activeAccount;
+ (ACAccount)activeSandboxAccount;
+ (BOOL)_shouldNotifyChangeFromExistingAccount:(id)a3 toCurrentAccount:(id)a4;
+ (id)sharedInstance;
+ (void)_postAccountDidChangeFromOldAccount:(id)a3 withAccountStore:(id)a4;
- (ACAccount)activeAccount;
- (ACAccount)activeSandboxAccount;
- (ActiveAccountObserver)init;
- (void)handleAccountStoreDidChangeNotification:(id)a3;
- (void)handleSandboxAccountDidChangeNotification:(id)a3;
@end

@implementation ActiveAccountObserver

+ (id)sharedInstance
{
  if (qword_10032ED00 != -1) {
    dispatch_once(&qword_10032ED00, &stru_1002E9CB8);
  }
  return (id)qword_10032ED08;
}

- (ActiveAccountObserver)init
{
  v16.receiver = self;
  v16.super_class = (Class)&OBJC_CLASS___ActiveAccountObserver;
  v2 = -[ActiveAccountObserver init](&v16, "init");
  if (v2)
  {
    dispatch_queue_t v3 = dispatch_queue_create("com.apple.storekit.AccountStore", 0LL);
    dispatchQueue = v2->_dispatchQueue;
    v2->_dispatchQueue = (OS_dispatch_queue *)v3;

    v5 = (void *)objc_claimAutoreleasedReturnValue(+[ACAccountStore ams_sharedAccountStore](&OBJC_CLASS___ACAccountStore, "ams_sharedAccountStore"));
    uint64_t v6 = objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "ams_activeiTunesAccount"));
    account = v2->_account;
    v2->_account = (ACAccount *)v6;

    if (qword_10032ED58 != -1) {
      dispatch_once(&qword_10032ED58, &stru_1002E9CF0);
    }
    v8 = (void *)qword_10032ED10;
    if (os_log_type_enabled((os_log_t)qword_10032ED10, OS_LOG_TYPE_DEFAULT))
    {
      v9 = v8;
      v10 = (void *)objc_opt_class(v2);
      v11 = v2->_account;
      id v12 = v10;
      v13 = (void *)objc_claimAutoreleasedReturnValue(-[ACAccount ams_DSID](v11, "ams_DSID"));
      *(_DWORD *)buf = 138543619;
      v18 = v10;
      __int16 v19 = 2113;
      v20 = v13;
      _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "[%{public}@] Intialized with account: %{private}@",  buf,  0x16u);
    }

    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
    [v14 addObserver:v2 selector:"handleAccountStoreDidChangeNotification:" name:@"com.apple.appstored.ASDItunesAccountDidChangeNotification" object:0];
    [v14 addObserver:v2 selector:"handleSandboxAccountDidChangeNotification:" name:@"com.apple.appstored.ASDSandboxAccountDidChangeNotification" object:0];
  }

  return v2;
}

+ (ACAccount)activeAccount
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[ACAccountStore ams_sharedAccountStore](&OBJC_CLASS___ACAccountStore, "ams_sharedAccountStore"));
  dispatch_queue_t v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "ams_activeiTunesAccount"));

  return (ACAccount *)v3;
}

+ (ACAccount)activeSandboxAccount
{
  v2 = (void *)objc_claimAutoreleasedReturnValue( +[ACAccountStore ams_sharedAccountStoreForMediaType:]( &OBJC_CLASS___ACAccountStore,  "ams_sharedAccountStoreForMediaType:",  AMSAccountMediaTypeAppStoreSandbox));
  dispatch_queue_t v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "ams_activeiTunesAccount"));

  return (ACAccount *)v3;
}

- (void)handleSandboxAccountDidChangeNotification:(id)a3
{
  id v4 = a3;
  if (qword_10032ED58 != -1) {
    dispatch_once(&qword_10032ED58, &stru_1002E9CF0);
  }
  v5 = (void *)qword_10032ED10;
  if (os_log_type_enabled((os_log_t)qword_10032ED10, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v6 = v5;
    *(_DWORD *)buf = 138543362;
    id v13 = (id)objc_opt_class(self);
    id v7 = v13;
    _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "[%{public}@] Received sandbox account changed notification",  buf,  0xCu);
  }

  dispatchQueue = self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10006E588;
  block[3] = &unk_1002E7958;
  id v11 = v4;
  id v9 = v4;
  dispatch_async((dispatch_queue_t)dispatchQueue, block);
}

- (void)handleAccountStoreDidChangeNotification:(id)a3
{
  id v4 = a3;
  dispatchQueue = self->_dispatchQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_10006E6CC;
  v7[3] = &unk_1002E78B8;
  id v8 = v4;
  id v9 = self;
  id v6 = v4;
  dispatch_async((dispatch_queue_t)dispatchQueue, v7);
}

+ (void)_postAccountDidChangeFromOldAccount:(id)a3 withAccountStore:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  dispatch_queue_global_t global_queue = dispatch_get_global_queue(21LL, 0LL);
  id v8 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(global_queue);
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472LL;
  v11[2] = sub_10006EC50;
  v11[3] = &unk_1002E78B8;
  id v12 = v5;
  id v13 = v6;
  id v9 = v6;
  id v10 = v5;
  dispatch_async(v8, v11);
}

+ (BOOL)_shouldNotifyChangeFromExistingAccount:(id)a3 toCurrentAccount:(id)a4
{
  unint64_t v5 = (unint64_t)a3;
  unint64_t v6 = (unint64_t)a4;
  id v7 = (void *)v6;
  if (!(v5 | v6)) {
    goto LABEL_2;
  }
  if (!v5 && v6)
  {
    if (qword_10032ED58 != -1) {
      dispatch_once(&qword_10032ED58, &stru_1002E9CF0);
    }
    id v9 = (void *)qword_10032ED10;
    if (os_log_type_enabled((os_log_t)qword_10032ED10, OS_LOG_TYPE_DEBUG)) {
      sub_1002632AC(v9);
    }
LABEL_15:
    BOOL v8 = 1;
    goto LABEL_16;
  }

  if (v5 && !v6)
  {
    if (qword_10032ED58 != -1) {
      dispatch_once(&qword_10032ED58, &stru_1002E9CF0);
    }
    id v10 = (void *)qword_10032ED10;
    if (os_log_type_enabled((os_log_t)qword_10032ED10, OS_LOG_TYPE_DEBUG)) {
      sub_100263340(v10);
    }
    goto LABEL_15;
  }

  uint64_t v12 = objc_claimAutoreleasedReturnValue(objc_msgSend((id)v6, "ams_DSID"));
  if (v12)
  {
    id v13 = (void *)v12;
    uint64_t v14 = objc_claimAutoreleasedReturnValue(objc_msgSend((id)v5, "ams_DSID"));
    if (v14)
    {
      v15 = (void *)v14;
      objc_super v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "ams_DSID"));
      v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)v5, "ams_DSID"));
      unsigned __int8 v18 = [v16 isEqualToNumber:v17];

      if ((v18 & 1) == 0)
      {
        if (qword_10032ED58 != -1) {
          dispatch_once(&qword_10032ED58, &stru_1002E9CF0);
        }
        __int16 v19 = (void *)qword_10032ED10;
        if (os_log_type_enabled((os_log_t)qword_10032ED10, OS_LOG_TYPE_DEBUG)) {
          sub_1002633D4(v19);
        }
        goto LABEL_15;
      }
    }

    else
    {
    }
  }

- (ACAccount)activeAccount
{
  return (ACAccount *)objc_getProperty(self, a2, 24LL, 1);
}

- (ACAccount)activeSandboxAccount
{
  return (ACAccount *)objc_getProperty(self, a2, 32LL, 1);
}

- (void).cxx_destruct
{
}

@end