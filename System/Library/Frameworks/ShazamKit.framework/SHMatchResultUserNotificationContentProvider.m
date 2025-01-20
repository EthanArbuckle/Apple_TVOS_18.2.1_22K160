@interface SHMatchResultUserNotificationContentProvider
+ (id)notificationActionForMatch;
+ (id)notificationCategories;
- (SHAttribution)attribution;
- (SHMatchResultUserNotificationContentProvider)initWithAttribution:(id)a3;
- (id)notificationContentForNoMatch;
- (void)notificationContentForMediaItem:(id)a3 completionHandler:(id)a4;
- (void)setAttribution:(id)a3;
@end

@implementation SHMatchResultUserNotificationContentProvider

- (SHMatchResultUserNotificationContentProvider)initWithAttribution:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___SHMatchResultUserNotificationContentProvider;
  v6 = -[SHMatchResultUserNotificationContentProvider init](&v9, "init");
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_attribution, a3);
  }

  return v7;
}

- (void)notificationContentForMediaItem:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = objc_alloc_init(&OBJC_CLASS___UNMutableNotificationContent);
  objc_super v9 = (void *)objc_claimAutoreleasedReturnValue([v6 title]);
  -[UNMutableNotificationContent setTitle:](v8, "setTitle:", v9);

  -[UNMutableNotificationContent setShouldBackgroundDefaultAction:](v8, "setShouldBackgroundDefaultAction:", 1LL);
  -[UNMutableNotificationContent setThreadIdentifier:]( v8,  "setThreadIdentifier:",  @"com.apple.ShazamNotifications.main-thread");
  -[UNMutableNotificationContent setShouldIgnoreDoNotDisturb:](v8, "setShouldIgnoreDoNotDisturb:", 1LL);
  -[UNMutableNotificationContent setShouldIgnoreDowntime:](v8, "setShouldIgnoreDowntime:", 1LL);
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[UNNotificationSound defaultSound](&OBJC_CLASS___UNNotificationSound, "defaultSound"));
  -[UNMutableNotificationContent setSound:](v8, "setSound:", v10);

  -[UNMutableNotificationContent setShouldAuthenticateDefaultAction:](v8, "setShouldAuthenticateDefaultAction:", 1LL);
  v11 = (void *)objc_claimAutoreleasedReturnValue([v6 artist]);
  if (v11) {
    -[UNMutableNotificationContent setBody:](v8, "setBody:", v11);
  }
  v12 = (void *)objc_claimAutoreleasedReturnValue([v6 appleMusicURL]);

  if (v12) {
    v13 = @"com.apple.ShazamNotifications.category.actionable";
  }
  else {
    v13 = @"com.apple.ShazamNotifications.category.default";
  }
  -[UNMutableNotificationContent setCategoryIdentifier:](v8, "setCategoryIdentifier:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[SHMatchResultUserNotificationContentProvider attribution](self, "attribution"));
  v15 = (void *)objc_claimAutoreleasedReturnValue([v14 bundleIdentifier]);
  v16 = (void *)objc_claimAutoreleasedReturnValue( +[SHMatchResultUserNotificationPayload userInfoPayloadForMediaItem:bundleIdentifier:]( &OBJC_CLASS___SHMatchResultUserNotificationPayload,  "userInfoPayloadForMediaItem:bundleIdentifier:",  v6,  v15));
  -[UNMutableNotificationContent setUserInfo:](v8, "setUserInfo:", v16);

  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472LL;
  v19[2] = sub_10001089C;
  v19[3] = &unk_10006D138;
  v20 = v8;
  id v21 = v7;
  id v17 = v7;
  v18 = v8;
  +[SHMatchResultUserNotificationAttachmentProvider notificationAttachmentForMediaItem:completionHandler:]( &OBJC_CLASS___SHMatchResultUserNotificationAttachmentProvider,  "notificationAttachmentForMediaItem:completionHandler:",  v6,  v19);
}

+ (id)notificationCategories
{
  id v2 = objc_msgSend((id)objc_opt_class(a1, a2), "notificationActionForMatch");
  v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  objc_super v9 = v3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v9, 1LL));
  id v5 = (void *)objc_claimAutoreleasedReturnValue( +[UNNotificationCategory categoryWithIdentifier:actions:intentIdentifiers:options:]( &OBJC_CLASS___UNNotificationCategory,  "categoryWithIdentifier:actions:intentIdentifiers:options:",  @"com.apple.ShazamNotifications.category.actionable",  v4,  &__NSArray0__struct,  4LL));

  id v6 = (void *)objc_claimAutoreleasedReturnValue( +[UNNotificationCategory categoryWithIdentifier:actions:intentIdentifiers:options:]( &OBJC_CLASS___UNNotificationCategory,  "categoryWithIdentifier:actions:intentIdentifiers:options:",  @"com.apple.ShazamNotifications.category.default",  &__NSArray0__struct,  &__NSArray0__struct,  4LL));
  id v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithObjects:](&OBJC_CLASS___NSSet, "setWithObjects:", v5, v6, 0LL));

  return v7;
}

+ (id)notificationActionForMatch
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue( +[SHLocalization localizedStringForKey:]( &OBJC_CLASS___SHLocalization,  "localizedStringForKey:",  @"SHAZAM_MODULE_NOTIFICATION_ACTION_TITLE"));
  v3 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@.%@",  @"com.apple.ShazamNotifications",  @"apple-music-action"));
  v4 = (void *)objc_claimAutoreleasedReturnValue( +[UNNotificationActionIcon iconWithSystemImageName:]( &OBJC_CLASS___UNNotificationActionIcon,  "iconWithSystemImageName:",  @"music.square.fill"));
  id v5 = (void *)objc_claimAutoreleasedReturnValue( +[UNNotificationAction actionWithIdentifier:title:options:icon:]( &OBJC_CLASS___UNNotificationAction,  "actionWithIdentifier:title:options:icon:",  v3,  v2,  0LL,  v4));

  return v5;
}

- (id)notificationContentForNoMatch
{
  v3 = objc_alloc_init(&OBJC_CLASS___UNMutableNotificationContent);
  v4 = (void *)objc_claimAutoreleasedReturnValue( +[NSString localizedUserNotificationStringForKey:arguments:]( &OBJC_CLASS___NSString,  "localizedUserNotificationStringForKey:arguments:",  @"SHAZAM_MODULE_NOTIFICATION_NO_MATCH_SUBTITLE",  0LL));
  -[UNMutableNotificationContent setTitle:](v3, "setTitle:", v4);

  id v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSString localizedUserNotificationStringForKey:arguments:]( &OBJC_CLASS___NSString,  "localizedUserNotificationStringForKey:arguments:",  @"SHAZAM_MODULE_NOTIFICATION_NO_MATCH_BODY",  0LL));
  -[UNMutableNotificationContent setBody:](v3, "setBody:", v5);

  -[UNMutableNotificationContent setThreadIdentifier:]( v3,  "setThreadIdentifier:",  @"com.apple.ShazamNotifications.main-thread");
  id v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate dateWithTimeIntervalSinceNow:](&OBJC_CLASS___NSDate, "dateWithTimeIntervalSinceNow:", 60.0));
  -[UNMutableNotificationContent setExpirationDate:](v3, "setExpirationDate:", v6);

  -[UNMutableNotificationContent setShouldIgnoreDoNotDisturb:](v3, "setShouldIgnoreDoNotDisturb:", 1LL);
  -[UNMutableNotificationContent setShouldIgnoreDowntime:](v3, "setShouldIgnoreDowntime:", 1LL);
  -[UNMutableNotificationContent setShouldHideDate:](v3, "setShouldHideDate:", 1LL);
  -[UNMutableNotificationContent setShouldSuppressDefaultAction:](v3, "setShouldSuppressDefaultAction:", 1LL);
  id v7 = (void *)objc_claimAutoreleasedReturnValue(+[UNNotificationSound defaultSound](&OBJC_CLASS___UNNotificationSound, "defaultSound"));
  -[UNMutableNotificationContent setSound:](v3, "setSound:", v7);

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[SHMatchResultUserNotificationContentProvider attribution](self, "attribution"));
  objc_super v9 = (void *)objc_claimAutoreleasedReturnValue([v8 bundleIdentifier]);
  v10 = (void *)objc_claimAutoreleasedReturnValue( +[SHMatchResultUserNotificationPayload userInfoPayloadForMediaItem:bundleIdentifier:]( &OBJC_CLASS___SHMatchResultUserNotificationPayload,  "userInfoPayloadForMediaItem:bundleIdentifier:",  0LL,  v9));
  -[UNMutableNotificationContent setUserInfo:](v3, "setUserInfo:", v10);

  return v3;
}

- (SHAttribution)attribution
{
  return self->_attribution;
}

- (void)setAttribution:(id)a3
{
}

- (void).cxx_destruct
{
}

@end