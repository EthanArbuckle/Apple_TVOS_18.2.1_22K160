@interface UserNotificationManager
+ (UserNotificationManager)sharedManager;
- (OS_dispatch_queue)delegateQueue;
- (UNUserNotificationCenter)center;
- (UserNotificationManager)init;
- (id)_bag;
- (void)setCenter:(id)a3;
- (void)setDelegateQueue:(id)a3;
- (void)userNotificationCenter:(id)a3 didChangeSettings:(id)a4;
- (void)userNotificationCenter:(id)a3 didReceiveNotificationResponse:(id)a4 withCompletionHandler:(id)a5;
@end

@implementation UserNotificationManager

- (UserNotificationManager)init
{
  v12.receiver = self;
  v12.super_class = (Class)&OBJC_CLASS___UserNotificationManager;
  v2 = -[UserNotificationManager init](&v12, "init");
  if (v2)
  {
    v3 = -[UNUserNotificationCenter initWithBundleIdentifier:]( objc_alloc(&OBJC_CLASS___UNUserNotificationCenter),  "initWithBundleIdentifier:",  @"com.apple.MobileStore");
    center = v2->_center;
    v2->_center = v3;

    dispatch_queue_t v5 = dispatch_queue_create("com.apple.itunesstored.UserNotifications", 0LL);
    delegateQueue = v2->_delegateQueue;
    v2->_delegateQueue = (OS_dispatch_queue *)v5;

    v7 = (void *)objc_claimAutoreleasedReturnValue( +[UNNotificationCategory categoryWithIdentifier:actions:intentIdentifiers:options:]( &OBJC_CLASS___UNNotificationCategory,  "categoryWithIdentifier:actions:intentIdentifiers:options:",  @"mst-notification-category",  &__NSArray0__struct,  &__NSArray0__struct,  1LL));
    v8 = v2->_center;
    v13 = v7;
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v13, 1LL));
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](&OBJC_CLASS___NSSet, "setWithArray:", v9));
    -[UNUserNotificationCenter setNotificationCategories:](v8, "setNotificationCategories:", v10);

    -[UNUserNotificationCenter setDelegate:](v2->_center, "setDelegate:", v2);
    -[UNUserNotificationCenter setPrivateDelegate:](v2->_center, "setPrivateDelegate:", v2);
    -[UNUserNotificationCenter setWantsNotificationResponsesDelivered]( v2->_center,  "setWantsNotificationResponsesDelivered");
  }

  return v2;
}

+ (UserNotificationManager)sharedManager
{
  if (qword_1003A35C8 != -1) {
    dispatch_once(&qword_1003A35C8, &stru_100350918);
  }
  return (UserNotificationManager *)(id)qword_1003A35C0;
}

- (void)userNotificationCenter:(id)a3 didReceiveNotificationResponse:(id)a4 withCompletionHandler:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  v9 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[UserNotificationManager delegateQueue](self, "delegateQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100186E74;
  block[3] = &unk_100350968;
  id v13 = v7;
  v14 = self;
  id v15 = v8;
  id v10 = v8;
  id v11 = v7;
  dispatch_async(v9, block);
}

- (void)userNotificationCenter:(id)a3 didChangeSettings:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[UserNotificationManager delegateQueue](self, "delegateQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10018715C;
  block[3] = &unk_10034BCE8;
  void block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(v8, block);
}

- (id)_bag
{
  v3 = objc_alloc_init(&OBJC_CLASS___ISLoadURLBagOperation);
  -[ISLoadURLBagOperation start](v3, "start");
  unsigned int v4 = -[ISLoadURLBagOperation success](v3, "success");
  uint64_t v5 = objc_claimAutoreleasedReturnValue(-[ISLoadURLBagOperation error](v3, "error"));
  id v6 = (void *)v5;
  if (v4) {
    BOOL v7 = v5 == 0;
  }
  else {
    BOOL v7 = 0;
  }
  if (!v7)
  {
    id v8 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharediTunesStoreConfig](&OBJC_CLASS___SSLogConfig, "sharediTunesStoreConfig"));
    if (!v8) {
      id v8 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig"));
    }
    unsigned int v9 = [v8 shouldLog];
    else {
      LODWORD(v10) = v9;
    }
    id v11 = (os_log_s *)objc_claimAutoreleasedReturnValue([v8 OSLogObject]);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      uint64_t v10 = v10;
    }
    else {
      v10 &= 2u;
    }
    if ((_DWORD)v10)
    {
      int v18 = 138543618;
      id v19 = (id)objc_opt_class(self);
      __int16 v20 = 2114;
      v21 = v6;
      id v12 = v19;
      id v13 = (void *)_os_log_send_and_compose_impl( v10,  0LL,  0LL,  0LL,  &_mh_execute_header,  v11,  16LL,  "%{public}@: Failed to load URL bag with error: %{public}@",  &v18,  22);

      if (!v13)
      {
LABEL_17:

        goto LABEL_18;
      }

      id v11 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[NSString stringWithCString:encoding:]( &OBJC_CLASS___NSString,  "stringWithCString:encoding:",  v13,  4LL));
      free(v13);
      SSFileLog(v8, @"%@");
    }

    goto LABEL_17;
  }

- (UNUserNotificationCenter)center
{
  return self->_center;
}

- (void)setCenter:(id)a3
{
}

- (OS_dispatch_queue)delegateQueue
{
  return self->_delegateQueue;
}

- (void)setDelegateQueue:(id)a3
{
}

- (void).cxx_destruct
{
}

@end