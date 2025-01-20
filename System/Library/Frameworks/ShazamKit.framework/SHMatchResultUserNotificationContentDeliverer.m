@interface SHMatchResultUserNotificationContentDeliverer
- (SHMatchResultUserNotificationContentDeliverer)initWithContentProvider:(id)a3;
- (SHMatchResultUserNotificationContentProvider)contentProvider;
- (void)deliverContentForMatchedMediaItem:(id)a3 completion:(id)a4;
- (void)deliverContentForNoMatchWithCompletion:(id)a3;
@end

@implementation SHMatchResultUserNotificationContentDeliverer

- (SHMatchResultUserNotificationContentDeliverer)initWithContentProvider:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___SHMatchResultUserNotificationContentDeliverer;
  v6 = -[SHMatchResultUserNotificationContentDeliverer init](&v9, "init");
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_contentProvider, a3);
  }

  return v7;
}

- (void)deliverContentForNoMatchWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[SHMatchResultUserNotificationContentDeliverer contentProvider](self, "contentProvider"));
  v6 = (void *)objc_claimAutoreleasedReturnValue([v5 notificationContentForNoMatch]);

  v7 = (void *)objc_claimAutoreleasedReturnValue( +[UNNotificationRequest requestWithIdentifier:content:trigger:]( &OBJC_CLASS___UNNotificationRequest,  "requestWithIdentifier:content:trigger:",  @"NOMATCH",  v6,  0LL));
  v8 = (void *)objc_claimAutoreleasedReturnValue( +[SHMatchResultNotificationScheduler userNotificationCenter]( &OBJC_CLASS___SHMatchResultNotificationScheduler,  "userNotificationCenter"));
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472LL;
  v10[2] = sub_10000F090;
  v10[3] = &unk_10006CFF8;
  id v11 = v4;
  id v9 = v4;
  [v8 addNotificationRequest:v7 withCompletionHandler:v10];
}

- (void)deliverContentForMatchedMediaItem:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[SHMatchResultUserNotificationContentDeliverer contentProvider](self, "contentProvider"));
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472LL;
  v11[2] = sub_10000F210;
  v11[3] = &unk_10006D020;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  [v8 notificationContentForMediaItem:v10 completionHandler:v11];
}

- (SHMatchResultUserNotificationContentProvider)contentProvider
{
  return self->_contentProvider;
}

- (void).cxx_destruct
{
}

@end