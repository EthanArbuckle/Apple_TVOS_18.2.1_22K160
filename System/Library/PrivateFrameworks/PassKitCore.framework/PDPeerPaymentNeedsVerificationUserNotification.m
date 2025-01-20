@interface PDPeerPaymentNeedsVerificationUserNotification
- (PDPeerPaymentNeedsVerificationUserNotification)initWithPassUniqueIdentifier:(id)a3;
- (id)_peerPaymentApplicationMessageContentWithTitleText:(id)a3 messageText:(id)a4;
- (id)_peerPaymentNeedsVerificationGroupDescriptor;
- (id)applicationMessageContent;
- (id)notificationContentWithDataSource:(id)a3;
- (unint64_t)notificationType;
@end

@implementation PDPeerPaymentNeedsVerificationUserNotification

- (PDPeerPaymentNeedsVerificationUserNotification)initWithPassUniqueIdentifier:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    v8.receiver = self;
    v8.super_class = (Class)&OBJC_CLASS___PDPeerPaymentNeedsVerificationUserNotification;
    v5 = -[PDUserNotification initWithNotificationIdentifier:forPassUniqueIdentifier:]( &v8,  "initWithNotificationIdentifier:forPassUniqueIdentifier:",  @"peerPaymentIdentityVerification",  v4);
    if (v5)
    {
      v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
      -[PDUserNotification setDate:](v5, "setDate:", v6);

      -[PDUserNotification setReissueBannerOnUpdate:](v5, "setReissueBannerOnUpdate:", 0LL);
    }
  }

  else
  {

    v5 = 0LL;
  }

  return v5;
}

- (unint64_t)notificationType
{
  return 19LL;
}

- (id)notificationContentWithDataSource:(id)a3
{
  v12.receiver = self;
  v12.super_class = (Class)&OBJC_CLASS___PDPeerPaymentNeedsVerificationUserNotification;
  id v4 = -[PDUserNotification notificationContentWithDataSource:](&v12, "notificationContentWithDataSource:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  uint64_t v6 = PKLocalizedFeatureString(@"ACCOUNT_SERVICE_REWARDS_VERIFICATION_REQUIRED_TITLE", 2LL);
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  [v5 setSubtitle:v7];
  uint64_t v8 = PKLocalizedFeatureString(@"ACCOUNT_SERVICE_REWARDS_VERIFICATION_REQUIRED_MESSAGE", 2LL);
  v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
  [v5 setBody:v9];

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[PDUserNotification date](self, "date"));
  [v5 setDate:v10];

  return v5;
}

- (id)applicationMessageContent
{
  uint64_t v3 = PKLocalizedFeatureString(@"ACCOUNT_SERVICE_REWARDS_VERIFICATION_REQUIRED_TITLE", 2LL);
  id v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  uint64_t v5 = PKLocalizedFeatureString(@"ACCOUNT_SERVICE_REWARDS_VERIFICATION_REQUIRED_MESSAGE", 2LL);
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue( -[PDPeerPaymentNeedsVerificationUserNotification _peerPaymentApplicationMessageContentWithTitleText:messageText:]( self,  "_peerPaymentApplicationMessageContentWithTitleText:messageText:",  v4,  v6));

  return v7;
}

- (id)_peerPaymentNeedsVerificationGroupDescriptor
{
  uint64_t v2 = PKLocalizedFeatureString(@"APPLICATION_MESSAGE_SUMMARY", 2LL);
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  id v4 = +[PKApplicationMessageGroupDescriptor createForIdentifier:withSingularSummary:pluralSummary:]( &OBJC_CLASS___PKApplicationMessageGroupDescriptor,  "createForIdentifier:withSingularSummary:pluralSummary:",  @"PDPassPaymentFraudTransactionApplicationMessageGroupIdentifier",  v3,  v3);

  return v4;
}

- (id)_peerPaymentApplicationMessageContentWithTitleText:(id)a3 messageText:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue( -[PDPeerPaymentNeedsVerificationUserNotification _peerPaymentNeedsVerificationGroupDescriptor]( self,  "_peerPaymentNeedsVerificationGroupDescriptor"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[PDUserNotification actionURL](self, "actionURL"));
  id v10 = +[PKApplicationMessageActionURL createWithURL:]( &OBJC_CLASS___PKApplicationMessageActionURL,  "createWithURL:",  v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue( +[PDUserNotification applicationMessageIconForFeature:]( &OBJC_CLASS___PDUserNotification,  "applicationMessageIconForFeature:",  1LL));
  id v12 = +[PKApplicationMessageContentDefault createWithGroup:action:icon:title:body:]( &OBJC_CLASS___PKApplicationMessageContentDefault,  "createWithGroup:action:icon:title:body:",  v8,  v10,  v11,  v7,  v6);

  return v12;
}

@end