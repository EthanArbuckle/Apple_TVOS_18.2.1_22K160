@interface SHMatchResultUserNotificationAttachmentProvider
+ (void)notificationAttachmentForMediaItem:(id)a3 completionHandler:(id)a4;
@end

@implementation SHMatchResultUserNotificationAttachmentProvider

+ (void)notificationAttachmentForMediaItem:(id)a3 completionHandler:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue([v5 artworkURL]);

  if (v7)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue([v5 artworkURL]);
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472LL;
    v9[2] = sub_100042284;
    v9[3] = &unk_10006E070;
    id v11 = v6;
    id v10 = v5;
    +[SHMatchResultNotificationAttachmentProviderUtilities downloadImageURL:completionHandler:]( &OBJC_CLASS___SHMatchResultNotificationAttachmentProviderUtilities,  "downloadImageURL:completionHandler:",  v8,  v9);
  }

  else
  {
    (*((void (**)(id, void))v6 + 2))(v6, 0LL);
  }
}

@end