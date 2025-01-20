@interface ActiveAccountObserver
+ (ACAccount)activeAccount;
+ (ACAccount)activeSandboxAccount;
+ (id)sharedInstance;
- (ActiveAccountObserver)init;
- (id)oneAccountDSIDWithLogKey:(id)a3;
- (void)handleAccountStoreDidChangeNotification:(id)a3;
- (void)handleSandboxAccountDidChangeNotification:(id)a3;
- (void)handleStorefrontChangedNotification:(id)a3;
@end

@implementation ActiveAccountObserver

+ (id)sharedInstance
{
  if (qword_1004622A0 != -1) {
    dispatch_once(&qword_1004622A0, &stru_1003EC4A8);
  }
  return (id)qword_1004622A8;
}

- (ActiveAccountObserver)init
{
  v23.receiver = self;
  v23.super_class = (Class)&OBJC_CLASS___ActiveAccountObserver;
  v2 = -[ActiveAccountObserver init](&v23, "init");
  if (v2)
  {
    dispatch_queue_attr_t v3 = dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v4 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v3);
    dispatch_queue_t v5 = dispatch_queue_create("com.apple.appstored.AccountStore", v4);
    dispatchQueue = v2->_dispatchQueue;
    v2->_dispatchQueue = (OS_dispatch_queue *)v5;

    v7 = (void *)objc_claimAutoreleasedReturnValue(+[ACAccountStore ams_sharedAccountStore](&OBJC_CLASS___ACAccountStore, "ams_sharedAccountStore"));
    uint64_t v8 = objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "ams_activeiTunesAccount"));
    account = v2->_account;
    v2->_account = (ACAccount *)v8;

    uint64_t v10 = objc_claimAutoreleasedReturnValue(-[ACAccount ams_storefront](v2->_account, "ams_storefront"));
    cachedStoreFront = v2->_cachedStoreFront;
    v2->_cachedStoreFront = (NSString *)v10;

    v12 = objc_alloc_init(&OBJC_CLASS___UnfairLock);
    lock = v2->_lock;
    v2->_lock = v12;

    uint64_t v14 = ASDLogHandleForCategory(14LL);
    v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      v17 = (void *)objc_opt_class(v2, v16);
      v18 = v2->_account;
      id v19 = v17;
      v20 = (void *)objc_claimAutoreleasedReturnValue(-[ACAccount ams_DSID](v18, "ams_DSID"));
      *(_DWORD *)buf = 138543618;
      v25 = v17;
      __int16 v26 = 2114;
      v27 = v20;
      _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_DEFAULT,  "[%{public}@] Intialized with account account: %{public}@",  buf,  0x16u);
    }

    v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
    [v21 addObserver:v2 selector:"handleAccountStoreDidChangeNotification:" name:@"com.apple.appstored.ASDItunesAccountDidChangeNotification" object:0];
    [v21 addObserver:v2 selector:"handleSandboxAccountDidChangeNotification:" name:@"com.apple.appstored.ASDSandboxAccountDidChangeNotification" object:0];
    [v21 addObserver:v2 selector:"handleStorefrontChangedNotification:" name:@"com.apple.StoreServices.StorefrontChanged" object:0];
  }

  return v2;
}

+ (ACAccount)activeAccount
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[ACAccountStore ams_sharedAccountStore](&OBJC_CLASS___ACAccountStore, "ams_sharedAccountStore"));
  dispatch_queue_attr_t v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "ams_activeiTunesAccount"));

  return (ACAccount *)v3;
}

+ (ACAccount)activeSandboxAccount
{
  v2 = (void *)objc_claimAutoreleasedReturnValue( +[ACAccountStore ams_sharedAccountStoreForMediaType:]( &OBJC_CLASS___ACAccountStore,  "ams_sharedAccountStoreForMediaType:",  AMSAccountMediaTypeAppStoreSandbox));
  dispatch_queue_attr_t v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "ams_activeiTunesAccount"));

  return (ACAccount *)v3;
}

- (id)oneAccountDSIDWithLogKey:(id)a3
{
  id v4 = a3;
  if (self)
  {
    id v5 = sub_100255630((uint64_t)&OBJC_CLASS___URLBag);
    v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
    unsigned int v7 = sub_100256DD0(v6, @"one-apple-account-enabled", (void *)1, 0);

    if (v7 && self->_account)
    {
      uint64_t v26 = 0LL;
      v27 = &v26;
      uint64_t v28 = 0x3032000000LL;
      v29 = sub_1001ED6AC;
      v30 = sub_1001ED6BC;
      id v31 = 0LL;
      lock = self->_lock;
      v25[0] = _NSConcreteStackBlock;
      v25[1] = 3221225472LL;
      v25[2] = sub_1001ED6C4;
      v25[3] = &unk_1003E9BE0;
      v25[4] = self;
      v25[5] = &v26;
      sub_1002C11C4(lock, v25);
      v9 = (void *)v27[5];
      if (v9)
      {
        self = v9;
      }

      else
      {
        dispatch_semaphore_t v10 = dispatch_semaphore_create(0LL);
        v11 = objc_alloc(&OBJC_CLASS____TtC9appstored23AccountCacheCoordinator);
        account = self->_account;
        v21[0] = _NSConcreteStackBlock;
        v21[1] = 3221225472LL;
        v21[2] = sub_1001ED6D8;
        v21[3] = &unk_1003EC4D0;
        id v22 = v4;
        v24 = &v26;
        v13 = v10;
        objc_super v23 = v13;
        -[AccountCacheCoordinator oneAccountDSID:logKey:completionHandler:]( v11,  "oneAccountDSID:logKey:completionHandler:",  account,  v22,  v21);

        dispatch_time_t v14 = dispatch_time(0LL, 5000000000LL);
        if (dispatch_semaphore_wait(v13, v14))
        {
          uint64_t v15 = ASDLogHandleForCategory(14LL);
          uint64_t v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(v15);
          if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
          {
            *(_WORD *)buf = 0;
            _os_log_error_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_ERROR,  "Timed out attempting to lookup oneAccountDSID",  buf,  2u);
          }
        }

        else
        {
          v17 = self->_lock;
          v19[0] = _NSConcreteStackBlock;
          v19[1] = 3221225472LL;
          v19[2] = sub_1001ED7C4;
          v19[3] = &unk_1003EC4F8;
          v19[4] = self;
          v19[5] = &v26;
          sub_1002C11C4(v17, v19);
        }

        self = (ActiveAccountObserver *)(id)v27[5];
      }

      _Block_object_dispose(&v26, 8);
    }

    else
    {
      self = 0LL;
    }
  }

  return self;
}

- (void)handleSandboxAccountDidChangeNotification:(id)a3
{
  id v4 = a3;
  uint64_t v5 = ASDLogHandleForCategory(14LL);
  v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    id v14 = (id)objc_opt_class(self, v7);
    id v8 = v14;
    _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "[%{public}@] Received sandbox account changed notification",  buf,  0xCu);
  }

  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1001ED8F4;
  block[3] = &unk_1003E9880;
  id v12 = v4;
  id v10 = v4;
  dispatch_async(dispatchQueue, block);
}

- (void)handleAccountStoreDidChangeNotification:(id)a3
{
  id v4 = a3;
  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_1001EDA38;
  v7[3] = &unk_1003E9DC0;
  id v8 = v4;
  v9 = self;
  id v6 = v4;
  dispatch_async(dispatchQueue, v7);
}

- (void)handleStorefrontChangedNotification:(id)a3
{
  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1001EE204;
  block[3] = &unk_1003E9880;
  void block[4] = self;
  dispatch_async(dispatchQueue, block);
}

- (void).cxx_destruct
{
}

@end