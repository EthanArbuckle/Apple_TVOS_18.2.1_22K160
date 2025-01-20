@interface NotificationManager
+ (id)_notificationCategories;
+ (id)sharedManager;
+ (unint64_t)_authorizationOptions;
- (NotificationManager)init;
- (void)postNotificationRequest:(id)a3 withCompletionHandler:(id)a4;
- (void)removeNotificationRequestWithIdentifier:(id)a3;
@end

@implementation NotificationManager

- (NotificationManager)init
{
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___NotificationManager;
  v2 = -[NotificationManager init](&v8, "init");
  if (v2)
  {
    v3 = -[UNUserNotificationCenter initWithBundleIdentifier:]( objc_alloc(&OBJC_CLASS___UNUserNotificationCenter),  "initWithBundleIdentifier:",  @"com.apple.AppStore");
    notificationCenter = v2->_notificationCenter;
    v2->_notificationCenter = v3;

    -[UNUserNotificationCenter setWantsNotificationResponsesDelivered]( v2->_notificationCenter,  "setWantsNotificationResponsesDelivered");
    v5 = v2->_notificationCenter;
    v6 = (void *)objc_claimAutoreleasedReturnValue( +[NotificationManager _notificationCategories]( &OBJC_CLASS___NotificationManager,  "_notificationCategories"));
    -[UNUserNotificationCenter setNotificationCategories:](v5, "setNotificationCategories:", v6);

    -[UNUserNotificationCenter requestAuthorizationWithOptions:completionHandler:]( v2->_notificationCenter,  "requestAuthorizationWithOptions:completionHandler:",  +[NotificationManager _authorizationOptions](&OBJC_CLASS___NotificationManager, "_authorizationOptions"),  &stru_1002E9900);
  }

  return v2;
}

+ (id)sharedManager
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100060BD0;
  block[3] = &unk_1002E6B20;
  block[4] = a1;
  if (qword_10032EB28 != -1) {
    dispatch_once(&qword_10032EB28, block);
  }
  return (id)qword_10032EB20;
}

- (void)postNotificationRequest:(id)a3 withCompletionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_initWeak(&location, self);
  notificationCenter = self->_notificationCenter;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472LL;
  v11[2] = sub_100060CF8;
  v11[3] = &unk_1002E9928;
  objc_copyWeak(&v14, &location);
  id v9 = v6;
  id v12 = v9;
  id v10 = v7;
  id v13 = v10;
  -[UNUserNotificationCenter addNotificationRequest:withCompletionHandler:]( notificationCenter,  "addNotificationRequest:withCompletionHandler:",  v9,  v11);

  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);
}

- (void)removeNotificationRequestWithIdentifier:(id)a3
{
  notificationCenter = self->_notificationCenter;
  id v6 = a3;
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v6, 1LL));
  -[UNUserNotificationCenter removeDeliveredNotificationsWithIdentifiers:]( notificationCenter,  "removeDeliveredNotificationsWithIdentifiers:",  v5,  v6);
}

+ (id)_notificationCategories
{
  v2 = objc_alloc_init(&OBJC_CLASS___NSMutableSet);
  v3 = (void *)objc_claimAutoreleasedReturnValue( +[UNNotificationCategory categoryWithIdentifier:actions:intentIdentifiers:options:]( &OBJC_CLASS___UNNotificationCategory,  "categoryWithIdentifier:actions:intentIdentifiers:options:",  @"sk-notification-category-purchase-intent",  &__NSArray0__struct,  &__NSArray0__struct,  1LL));
  -[NSMutableSet addObject:](v2, "addObject:", v3);

  id v4 = (void *)objc_claimAutoreleasedReturnValue( +[NSString localizedUserNotificationStringForKey:arguments:]( &OBJC_CLASS___NSString,  "localizedUserNotificationStringForKey:arguments:",  @"VIEW_IN_APP_STORE",  0LL));
  v5 = (void *)objc_claimAutoreleasedReturnValue( +[UNNotificationAction actionWithIdentifier:title:options:]( &OBJC_CLASS___UNNotificationAction,  "actionWithIdentifier:title:options:",  @"sk-notification-action-view-in-app-store",  v4,  0LL));

  id v9 = v5;
  id v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v9, 1LL));
  id v7 = (void *)objc_claimAutoreleasedReturnValue( +[UNNotificationCategory categoryWithIdentifier:actions:intentIdentifiers:options:]( &OBJC_CLASS___UNNotificationCategory,  "categoryWithIdentifier:actions:intentIdentifiers:options:",  @"sk-notification-category-app-terminate",  v6,  &__NSArray0__struct,  1LL));
  -[NSMutableSet addObject:](v2, "addObject:", v7);

  return v2;
}

+ (unint64_t)_authorizationOptions
{
  return 6LL;
}

- (void).cxx_destruct
{
}

@end