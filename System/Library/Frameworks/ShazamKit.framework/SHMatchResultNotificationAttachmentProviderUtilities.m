@interface SHMatchResultNotificationAttachmentProviderUtilities
+ (void)downloadImageURL:(id)a3 completionHandler:(id)a4;
@end

@implementation SHMatchResultNotificationAttachmentProviderUtilities

+ (void)downloadImageURL:(id)a3 completionHandler:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSURLSession sharedSession](&OBJC_CLASS___NSURLSession, "sharedSession"));
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472LL;
  v10[2] = sub_100012F14;
  v10[3] = &unk_10006D160;
  id v11 = v5;
  id v8 = v5;
  v9 = (void *)objc_claimAutoreleasedReturnValue([v7 downloadTaskWithURL:v6 completionHandler:v10]);

  [v9 resume];
}

@end