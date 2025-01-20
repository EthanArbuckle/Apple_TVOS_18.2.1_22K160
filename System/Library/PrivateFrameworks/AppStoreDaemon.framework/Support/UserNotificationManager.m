@interface UserNotificationManager
- (UserNotificationManager)init;
- (void)userNotificationCenter:(id)a3 didChangeSettings:(id)a4;
- (void)userNotificationCenter:(id)a3 didReceiveNotificationResponse:(id)a4 withCompletionHandler:(id)a5;
@end

@implementation UserNotificationManager

- (UserNotificationManager)init
{
  v10.receiver = self;
  v10.super_class = (Class)&OBJC_CLASS___UserNotificationManager;
  v2 = -[UserNotificationManager init](&v10, "init");
  if (v2)
  {
    v3 = -[UNUserNotificationCenter initWithBundleIdentifier:]( objc_alloc(&OBJC_CLASS___UNUserNotificationCenter),  "initWithBundleIdentifier:",  @"com.apple.AppStore");
    center = v2->_center;
    v2->_center = v3;

    v5 = (void *)objc_claimAutoreleasedReturnValue( +[UNNotificationCategory categoryWithIdentifier:actions:intentIdentifiers:options:]( &OBJC_CLASS___UNNotificationCategory,  "categoryWithIdentifier:actions:intentIdentifiers:options:",  @"asd-notification-default",  &__NSArray0__struct,  &__NSArray0__struct,  1LL));
    v6 = v2->_center;
    v11 = v5;
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v11, 1LL));
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](&OBJC_CLASS___NSSet, "setWithArray:", v7));
    -[UNUserNotificationCenter setNotificationCategories:](v6, "setNotificationCategories:", v8);

    -[UNUserNotificationCenter setDelegate:](v2->_center, "setDelegate:", v2);
    -[UNUserNotificationCenter setPrivateDelegate:](v2->_center, "setPrivateDelegate:", v2);
    -[UNUserNotificationCenter setWantsNotificationResponsesDelivered]( v2->_center,  "setWantsNotificationResponsesDelivered");
  }

  return v2;
}

- (void)userNotificationCenter:(id)a3 didReceiveNotificationResponse:(id)a4 withCompletionHandler:(id)a5
{
  v6 = (void (**)(void))a5;
  id v7 = a4;
  if (+[AMSUserNotification shouldHandleNotificationResponse:]( &OBJC_CLASS___AMSUserNotification,  "shouldHandleNotificationResponse:",  v7))
  {
    id v8 = sub_100255630((uint64_t)&OBJC_CLASS___URLBag);
    v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
    objc_super v10 = (void *)objc_claimAutoreleasedReturnValue( +[AMSUserNotification handleNotificationResponse:bag:]( &OBJC_CLASS___AMSUserNotification,  "handleNotificationResponse:bag:",  v7,  v9));

    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472LL;
    v14[2] = sub_10030899C;
    v14[3] = &unk_1003EAEC8;
    v15 = v6;
    [v10 addFinishBlock:v14];
  }

  else
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue([v7 notification]);
    v12 = (void *)objc_claimAutoreleasedReturnValue([v11 request]);
    v13 = sub_10026F67C((uint64_t)&OBJC_CLASS___Bulletin, v12);
    objc_super v10 = (void *)objc_claimAutoreleasedReturnValue(v13);

    sub_10026F9D8((uint64_t)v10, v7);
    v6[2](v6);
  }
}

- (void)userNotificationCenter:(id)a3 didChangeSettings:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = ASDLogHandleForCategory(9LL);
  v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    int v15 = 138543362;
    id v16 = (id)objc_opt_class(self, v10);
    id v11 = v16;
    _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "[%{public}@]: Settings did change",  (uint8_t *)&v15,  0xCu);
  }

  id v12 = sub_100255630((uint64_t)&OBJC_CLASS___URLBag);
  v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
  id v14 =  +[AMSUserNotification notificationCenter:didChangeSettings:bag:]( &OBJC_CLASS___AMSUserNotification,  "notificationCenter:didChangeSettings:bag:",  v6,  v7,  v13);
}

- (void).cxx_destruct
{
}

@end