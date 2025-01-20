@interface PDAccountPhysicalCardExpiredNotification
+ (BOOL)supportsSecureCoding;
- (BOOL)isValid;
- (PDAccountPhysicalCardExpiredNotification)initWithAccountIdentifier:(id)a3 physicalCardIdentifier:(id)a4 forPassUniqueIdentifier:(id)a5;
- (id)applicationMessageContent;
- (id)notificationContentWithDataSource:(id)a3;
- (unint64_t)notificationType;
@end

@implementation PDAccountPhysicalCardExpiredNotification

- (PDAccountPhysicalCardExpiredNotification)initWithAccountIdentifier:(id)a3 physicalCardIdentifier:(id)a4 forPassUniqueIdentifier:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  if ([v8 length] && objc_msgSend(v7, "length"))
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@-physicalCardExpired",  v7));
    v16.receiver = self;
    v16.super_class = (Class)&OBJC_CLASS___PDAccountPhysicalCardExpiredNotification;
    v10 = -[PDUserNotification initWithNotificationIdentifier:forPassUniqueIdentifier:]( &v16,  "initWithNotificationIdentifier:forPassUniqueIdentifier:",  v9,  v8);
    v11 = v10;
    if (v10)
    {
      v12 = (void *)objc_claimAutoreleasedReturnValue(-[PDUserNotification notificationIdentifier](v10, "notificationIdentifier"));
      id v13 = [v12 length];

      if (v13)
      {
        v14 = (PDAccountPhysicalCardExpiredNotification *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@://%@/%@/%@",  PKWalletURLScheme,  PKURLActionRouteCreditPaymentPass,  PKURLActionRouteCreditPaymentPassDetailsAction,  PKURLSubactionRouteCreditPaymentPassReplace));
        -[PDUserNotification setCustomActionURLString:](v11, "setCustomActionURLString:", v14);
      }

      else
      {
        v14 = v11;
        v11 = 0LL;
      }
    }

    else
    {
      v14 = 0LL;
    }
  }

  else
  {

    v11 = 0LL;
  }

  return v11;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BOOL)isValid
{
  return PKIsMac(self, a2) ^ 1;
}

- (unint64_t)notificationType
{
  return 77LL;
}

- (id)notificationContentWithDataSource:(id)a3
{
  v13.receiver = self;
  v13.super_class = (Class)&OBJC_CLASS___PDAccountPhysicalCardExpiredNotification;
  id v3 = -[PDUserNotification notificationContentWithDataSource:](&v13, "notificationContentWithDataSource:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  uint64_t v5 = PKLocalizedFeatureString(@"ACCOUNT_SERVICE_PHYSICAL_CARD_EXPIRED_NOTIFICATION_TITLE", 2LL);
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  [v4 setSubtitle:v6];

  uint64_t v8 = PDDeviceSpecificLocalizedStringKeyForKey(@"ACCOUNT_SERVICE_PHYSICAL_CARD_EXPIRED_NOTIFICATION_BODY", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
  uint64_t v10 = PKLocalizedFeatureString(v9, 2LL);
  v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
  [v4 setBody:v11];

  return v4;
}

- (id)applicationMessageContent
{
  uint64_t v3 = PKLocalizedFeatureString(@"ACCOUNT_SERVICE_PHYSICAL_CARD_EXPIRED_NOTIFICATION_TITLE", 2LL);
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  uint64_t v5 = PKLocalizedFeatureString(@"ACCOUNT_SERVICE_PHYSICAL_CARD_EXPIRED_APPLICATION_MESSAGE_BODY", 2LL);
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  uint64_t v7 = PKLocalizedFeatureString(@"APPLICATION_MESSAGE_SUMMARY", 2LL);
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  id v9 = +[PKApplicationMessageGroupDescriptor createForIdentifier:withSingularSummary:pluralSummary:]( &OBJC_CLASS___PKApplicationMessageGroupDescriptor,  "createForIdentifier:withSingularSummary:pluralSummary:",  @"PDPassAccountEventApplicationMessageGroupIdentifier",  v8,  v8);
  uint64_t v11 = PKPassKitUIBundle(v9, v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
  objc_super v13 = (const __CFURL *)objc_claimAutoreleasedReturnValue( [v12 URLForResource:@"PhysicalCardMessageModule" withExtension:@"pdf"]);

  v14 = CGPDFDocumentCreateWithURL(v13);
  if (v14)
  {
    id v15 = +[PKApplicationMessageIcon maximumSizeForStyle:]( &OBJC_CLASS___PKApplicationMessageIcon,  "maximumSizeForStyle:",  1LL);
    double v17 = v16;
    double v19 = v18;
    double v20 = PKScreenScale(v15);
    uint64_t v21 = PKGetImageFromPDFDocument(v14, v17, v19, v20);
    v22 = (void *)objc_claimAutoreleasedReturnValue(v21);
    CGPDFDocumentRelease(v14);
    id v23 = +[PKImageDescriptorBitmap createForImage:withTintColor:hasBackground:]( &OBJC_CLASS___PKImageDescriptorBitmap,  "createForImage:withTintColor:hasBackground:",  v22,  0LL,  0LL);
    v14 = (CGPDFDocument *)+[PKApplicationMessageIcon createWithImage:style:]( &OBJC_CLASS___PKApplicationMessageIcon,  "createWithImage:style:",  v23,  0LL);
  }

  v24 = (void *)objc_claimAutoreleasedReturnValue(-[PDUserNotification actionURL](self, "actionURL"));
  id v25 = +[PKApplicationMessageActionURL createWithURL:]( &OBJC_CLASS___PKApplicationMessageActionURL,  "createWithURL:",  v24);
  id v26 = +[PKApplicationMessageContentDefault createWithGroup:action:icon:title:body:]( &OBJC_CLASS___PKApplicationMessageContentDefault,  "createWithGroup:action:icon:title:body:",  v9,  v25,  v14,  v4,  v6);

  return v26;
}

@end