@interface PDPassTransitRelevancyUserNotification
- (BOOL)isValid;
- (PDPassTransitRelevancyUserNotification)initWithPaymentTransaction:(id)a3 forPassUniqueIdentifier:(id)a4 paymentApplication:(id)a5 familyMember:(id)a6 accountUser:(id)a7;
- (id)notificationContentWithDataSource:(id)a3;
- (id)thumbnailImageForSizeContraints:(id)a3 dataSource:(id)a4;
- (unint64_t)notificationType;
@end

@implementation PDPassTransitRelevancyUserNotification

- (PDPassTransitRelevancyUserNotification)initWithPaymentTransaction:(id)a3 forPassUniqueIdentifier:(id)a4 paymentApplication:(id)a5 familyMember:(id)a6 accountUser:(id)a7
{
  v10.receiver = self;
  v10.super_class = (Class)&OBJC_CLASS___PDPassTransitRelevancyUserNotification;
  v7 = -[PDPassTransitTransactionUserNotification initWithPaymentTransaction:forPassUniqueIdentifier:paymentApplication:familyMember:accountUser:installmentCriteria:]( &v10,  "initWithPaymentTransaction:forPassUniqueIdentifier:paymentApplication:familyMember:accountUser:installmentCriteria:",  a3,  a4,  a5,  a6,  a7,  0LL);
  v8 = v7;
  if (v7) {
    -[PDUserNotification setPreventAutomaticDismissal:](v7, "setPreventAutomaticDismissal:", 1LL);
  }
  return v8;
}

- (unint64_t)notificationType
{
  return 6LL;
}

- (BOOL)isValid
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[PDPassPaymentTransactionUserNotification paymentTransaction](self, "paymentTransaction"));
  else {
    unsigned __int8 v3 = 0;
  }

  return v3;
}

- (id)notificationContentWithDataSource:(id)a3
{
  v14.receiver = self;
  v14.super_class = (Class)&OBJC_CLASS___PDPassTransitRelevancyUserNotification;
  id v4 = a3;
  id v5 = -[PDPassTransitTransactionUserNotification notificationContentWithDataSource:]( &v14,  "notificationContentWithDataSource:",  v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  objc_msgSend(v6, "setShouldHideDate:", 1, v14.receiver, v14.super_class);
  [v6 setDate:0];
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[PDUserNotification passUniqueIdentifier](self, "passUniqueIdentifier"));
  v8 = (void *)objc_claimAutoreleasedReturnValue([v4 fileURLForAsset:1 passUniqueIdentifier:v7]);

  if (v8)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](&OBJC_CLASS___NSUUID, "UUID"));
    objc_super v10 = (void *)objc_claimAutoreleasedReturnValue([v9 UUIDString]);
    v11 = (void *)objc_claimAutoreleasedReturnValue( +[UNNotificationAttachment attachmentWithIdentifier:URL:options:error:]( &OBJC_CLASS___UNNotificationAttachment,  "attachmentWithIdentifier:URL:options:error:",  v10,  v8,  0LL,  0LL));

    v15 = v11;
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v15, 1LL));
    [v6 setAttachments:v12];
  }

  return v6;
}

- (id)thumbnailImageForSizeContraints:(id)a3 dataSource:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[PDUserNotification passUniqueIdentifier](self, "passUniqueIdentifier"));
  v9 = (void *)objc_claimAutoreleasedReturnValue([v6 passWithUniqueIdentifier:v8]);

  objc_super v10 = (void *)objc_claimAutoreleasedReturnValue([v9 frontFaceImage]);
  PKPassFaceNotificationThumbnailPaddingInsets([v9 style]);
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "croppedImageWithInsets:"));
  v12 = (void *)objc_claimAutoreleasedReturnValue([v11 resizedImageWithConstraints:v7]);

  v13 = (void *)objc_claimAutoreleasedReturnValue([v12 imageData]);
  return v13;
}

@end