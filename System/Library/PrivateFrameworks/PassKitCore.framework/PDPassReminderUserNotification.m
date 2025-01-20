@interface PDPassReminderUserNotification
+ (BOOL)supportsSecureCoding;
- (id)_messageString;
- (id)_titleString;
- (id)notificationContentWithDataSource:(id)a3;
- (id)thumbnailImageForSizeContraints:(id)a3 dataSource:(id)a4;
@end

@implementation PDPassReminderUserNotification

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)thumbnailImageForSizeContraints:(id)a3 dataSource:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[PDUserNotification passUniqueIdentifier](self, "passUniqueIdentifier"));
  v9 = (void *)objc_claimAutoreleasedReturnValue([v6 passWithUniqueIdentifier:v8]);

  v10 = (void *)objc_claimAutoreleasedReturnValue([v9 frontFaceImage]);
  PKPassFaceNotificationThumbnailPaddingInsets([v9 style]);
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "croppedImageWithInsets:"));
  v12 = (void *)objc_claimAutoreleasedReturnValue([v11 resizedImageWithConstraints:v7]);

  v13 = (void *)objc_claimAutoreleasedReturnValue([v12 imageData]);
  return v13;
}

- (id)notificationContentWithDataSource:(id)a3
{
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___PDPassReminderUserNotification;
  id v4 = -[PDUserNotification notificationContentWithDataSource:](&v9, "notificationContentWithDataSource:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[PDPassReminderUserNotification _titleString](self, "_titleString"));
  [v5 setSubtitle:v6];

  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[PDPassReminderUserNotification _messageString](self, "_messageString"));
  [v5 setBody:v7];

  return v5;
}

- (id)_titleString
{
  return 0LL;
}

- (id)_messageString
{
  return 0LL;
}

@end