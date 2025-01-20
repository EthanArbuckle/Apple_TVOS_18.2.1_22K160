@interface PDAccountFCCStepUpThresholdExceededUserNotification
+ (BOOL)supportsSecureCoding;
+ (id)notificationIdentifierForAccountIdentifier:(id)a3;
- (BOOL)isValid;
- (PDAccountFCCStepUpThresholdExceededUserNotification)initWithAccount:(id)a3;
- (PDAccountFCCStepUpThresholdExceededUserNotification)initWithCoder:(id)a3;
- (PKAccount)account;
- (id)applicationMessageContent;
- (id)notificationContentWithDataSource:(id)a3;
- (unint64_t)notificationType;
- (void)encodeWithCoder:(id)a3;
@end

@implementation PDAccountFCCStepUpThresholdExceededUserNotification

+ (id)notificationIdentifierForAccountIdentifier:(id)a3
{
  return +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@-fccThresholdExceeded",  a3);
}

- (PDAccountFCCStepUpThresholdExceededUserNotification)initWithAccount:(id)a3
{
  id v5 = a3;
  v6 = v5;
  if (v5)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue([v5 accountIdentifier]);
    id v9 = objc_msgSend((id)objc_opt_class(self, v8), "notificationIdentifierForAccountIdentifier:", v7);
    v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
    v14.receiver = self;
    v14.super_class = (Class)&OBJC_CLASS___PDAccountFCCStepUpThresholdExceededUserNotification;
    v11 = -[PDUserNotification initWithNotificationIdentifier:forAccountIdentifier:]( &v14,  "initWithNotificationIdentifier:forAccountIdentifier:",  v10,  v7);

    if (v11)
    {
      objc_storeStrong((id *)&v11->_account, a3);
      v12 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@/%@",  PKURLActionRouteSavings,  PKURLActionRouteSavingsFCCStepUp));
      -[PDUserNotification setCustomActionRoute:](v11, "setCustomActionRoute:", v12);
    }
  }

  else
  {

    v11 = 0LL;
  }

  return v11;
}

- (unint64_t)notificationType
{
  return 75LL;
}

- (BOOL)isValid
{
  if ((PKIsMac(self, a2) & 1) != 0) {
    return 0;
  }
  else {
    return PKSavingsAccountIsThresholdExceededActive(self->_account);
  }
}

- (id)notificationContentWithDataSource:(id)a3
{
  account = self->_account;
  id v5 = a3;
  id v6 = -[PKAccount feature](account, "feature");
  v16.receiver = self;
  v16.super_class = (Class)&OBJC_CLASS___PDAccountFCCStepUpThresholdExceededUserNotification;
  id v7 = -[PDUserNotification notificationContentWithDataSource:](&v16, "notificationContentWithDataSource:", v5);
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(v7);

  uint64_t v9 = PKLocalizedFeatureString(@"ACCOUNT_NOTIFICATION_GENERIC_TITLE", v6);
  v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
  [v8 setTitle:v10];

  uint64_t v11 = PKLocalizedFeatureString(@"ACCOUNT_NOTIFICATION_FCC_CRITICAL_SUBTITLE", v6);
  v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
  [v8 setSubtitle:v12];

  uint64_t v13 = PKLocalizedFeatureString(@"ACCOUNT_NOTIFICATION_FCC_CRITICAL_MESSAGE", v6);
  objc_super v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
  [v8 setBody:v14];

  [v8 setInterruptionLevel:2];
  return v8;
}

- (id)applicationMessageContent
{
  id v3 = -[PKAccount feature](self->_account, "feature");
  uint64_t v4 = PKLocalizedFeatureString(@"APPLICATION_MESSAGE_FCC_CRITICAL_TITLE", v3);
  id v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  uint64_t v6 = PKLocalizedFeatureString(@"APPLICATION_MESSAGE_FCC_CRITICAL_MESSAGE", v3);
  id v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(-[PDUserNotification accountIdentifier](self, "accountIdentifier"));
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue( [@"PDSavingsAccountApplicationMessageGroupIdentifier" stringByAppendingString:v8]);

  id v10 = +[PKApplicationMessageGroupDescriptor createForIdentifier:withSingularSummary:pluralSummary:]( &OBJC_CLASS___PKApplicationMessageGroupDescriptor,  "createForIdentifier:withSingularSummary:pluralSummary:",  v9,  v5,  v5);
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(-[PDUserNotification actionURL](self, "actionURL"));
  id v12 = +[PKApplicationMessageActionURL createWithURL:]( &OBJC_CLASS___PKApplicationMessageActionURL,  "createWithURL:",  v11);
  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue( +[PDUserNotification applicationMessageIconForFeature:]( &OBJC_CLASS___PDUserNotification,  "applicationMessageIconForFeature:",  5LL));
  id v14 = +[PKApplicationMessageContentDefault createWithGroup:action:icon:title:body:]( &OBJC_CLASS___PKApplicationMessageContentDefault,  "createWithGroup:action:icon:title:body:",  v10,  v12,  v13,  v5,  v7);

  return v14;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PDAccountFCCStepUpThresholdExceededUserNotification)initWithCoder:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)&OBJC_CLASS___PDAccountFCCStepUpThresholdExceededUserNotification;
  uint64_t v6 = -[PDUserNotification initWithCoder:](&v11, "initWithCoder:", v4);
  if (v6)
  {
    id v7 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(PKAccount, v5), @"account");
    uint64_t v8 = objc_claimAutoreleasedReturnValue(v7);
    account = v6->_account;
    v6->_account = (PKAccount *)v8;
  }

  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___PDAccountFCCStepUpThresholdExceededUserNotification;
  id v4 = a3;
  -[PDUserNotification encodeWithCoder:](&v5, "encodeWithCoder:", v4);
  objc_msgSend(v4, "encodeObject:forKey:", self->_account, @"account", v5.receiver, v5.super_class);
}

- (PKAccount)account
{
  return self->_account;
}

- (void).cxx_destruct
{
}

@end