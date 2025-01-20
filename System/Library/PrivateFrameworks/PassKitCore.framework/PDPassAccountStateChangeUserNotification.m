@interface PDPassAccountStateChangeUserNotification
+ (BOOL)supportsSecureCoding;
- (BOOL)isValid;
- (BOOL)requiresDebtCollectionNotices;
- (PDPassAccountStateChangeUserNotification)initWithAccountIdentifier:(id)a3 accountState:(unint64_t)a4 accountStateReason:(unint64_t)a5 featureIdentifier:(unint64_t)a6;
- (PDPassAccountStateChangeUserNotification)initWithCoder:(id)a3;
- (PDPassAccountStateChangeUserNotification)initWithPassUniqueIdentifier:(id)a3 accountState:(unint64_t)a4 accountStateReason:(unint64_t)a5 accessLevel:(unint64_t)a6 featureIdentifier:(unint64_t)a7 requiresDebtCollectionNotices:(BOOL)a8;
- (id)_messageStringWithGenericMessaging:(BOOL)a3;
- (id)_titleStringWithGenericMessaging:(BOOL)a3;
- (id)notificationContentWithDataSource:(id)a3;
- (unint64_t)accessLevel;
- (unint64_t)accountState;
- (unint64_t)accountStateReason;
- (unint64_t)featureIdentifier;
- (unint64_t)notificationType;
- (void)_updateAutoDismissal;
- (void)encodeWithCoder:(id)a3;
@end

@implementation PDPassAccountStateChangeUserNotification

- (PDPassAccountStateChangeUserNotification)initWithPassUniqueIdentifier:(id)a3 accountState:(unint64_t)a4 accountStateReason:(unint64_t)a5 accessLevel:(unint64_t)a6 featureIdentifier:(unint64_t)a7 requiresDebtCollectionNotices:(BOOL)a8
{
  v16.receiver = self;
  v16.super_class = (Class)&OBJC_CLASS___PDPassAccountStateChangeUserNotification;
  v13 = -[PDUserNotification initWithNotificationIdentifier:forPassUniqueIdentifier:]( &v16,  "initWithNotificationIdentifier:forPassUniqueIdentifier:",  @"accountStateChange",  a3);
  v14 = v13;
  if (v13)
  {
    v13->_featureIdentifier = a7;
    v13->_requiresDebtCollectionNotices = a8;
    v13->_accountState = a4;
    v13->_accountStateReason = a5;
    v13->_accessLevel = a6;
    -[PDPassAccountStateChangeUserNotification _updateAutoDismissal](v13, "_updateAutoDismissal");
  }

  return v14;
}

- (PDPassAccountStateChangeUserNotification)initWithAccountIdentifier:(id)a3 accountState:(unint64_t)a4 accountStateReason:(unint64_t)a5 featureIdentifier:(unint64_t)a6
{
  v12.receiver = self;
  v12.super_class = (Class)&OBJC_CLASS___PDPassAccountStateChangeUserNotification;
  v9 = -[PDUserNotification initWithNotificationIdentifier:forAccountIdentifier:]( &v12,  "initWithNotificationIdentifier:forAccountIdentifier:",  @"accountStateChange",  a3);
  v10 = v9;
  if (v9)
  {
    v9->_featureIdentifier = a6;
    v9->_requiresDebtCollectionNotices = 0;
    v9->_accountState = a4;
    v9->_accountStateReason = a5;
    v9->_accessLevel = 0LL;
    -[PDPassAccountStateChangeUserNotification _updateAutoDismissal](v9, "_updateAutoDismissal");
  }

  return v10;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PDPassAccountStateChangeUserNotification)initWithCoder:(id)a3
{
  id v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS___PDPassAccountStateChangeUserNotification;
  v5 = -[PDUserNotification initWithCoder:](&v7, "initWithCoder:", v4);
  if (v5)
  {
    v5->_featureIdentifier = (unint64_t)[v4 decodeIntegerForKey:@"accountFeatureIdentifier"];
    v5->_accountState = (unint64_t)[v4 decodeIntegerForKey:@"accountState"];
    v5->_accountStateReason = (unint64_t)[v4 decodeIntegerForKey:@"accountStateReason"];
    v5->_accessLevel = (unint64_t)[v4 decodeIntegerForKey:@"accountAccessLevel"];
    v5->_requiresDebtCollectionNotices = [v4 decodeBoolForKey:@"debtCollectionNotices"];
    -[PDPassAccountStateChangeUserNotification _updateAutoDismissal](v5, "_updateAutoDismissal");
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___PDPassAccountStateChangeUserNotification;
  id v4 = a3;
  -[PDUserNotification encodeWithCoder:](&v5, "encodeWithCoder:", v4);
  objc_msgSend(v4, "encodeInteger:forKey:", self->_accountState, @"accountState", v5.receiver, v5.super_class);
  [v4 encodeInteger:self->_accountStateReason forKey:@"accountStateReason"];
  [v4 encodeInteger:self->_featureIdentifier forKey:@"accountFeatureIdentifier"];
  [v4 encodeInteger:self->_accessLevel forKey:@"accountAccessLevel"];
  [v4 encodeBool:self->_requiresDebtCollectionNotices forKey:@"debtCollectionNotices"];
}

- (void)_updateAutoDismissal
{
  BOOL v2 = self->_featureIdentifier == 2 && self->_accountStateReason == 8;
  -[PDUserNotification setPreventAutomaticDismissal:](self, "setPreventAutomaticDismissal:", v2);
}

- (id)_titleStringWithGenericMessaging:(BOOL)a3
{
  BOOL v3 = a3;
  unint64_t accessLevel = self->_accessLevel;
  if (accessLevel >= 2)
  {
    if (accessLevel != 2)
    {
      v9 = 0LL;
      goto LABEL_7;
    }

    uint64_t v8 = PKLocalizedMadisonString(@"SHARING_STOPPED_TITLE");
    uint64_t v7 = objc_claimAutoreleasedReturnValue(v8);
  }

  else
  {
    uint64_t v6 = PKLocalizedFeatureString(@"ACCOUNT_NOTIFICATION_IMPORTANT_UPDATE_SUBTITLE", self->_featureIdentifier);
    uint64_t v7 = objc_claimAutoreleasedReturnValue(v6);
  }

  v9 = (void *)v7;
LABEL_7:
  unint64_t featureIdentifier = self->_featureIdentifier;
  if (featureIdentifier == 2)
  {
    if (self->_accountStateReason == 8)
    {
      if (!self->_requiresDebtCollectionNotices && !v3) {
        v11 = @"ACCOUNT_NOTIFICATION_CHARGEDOFF_SUBTITLE";
      }
      else {
        v11 = @"ACCOUNT_SERVICE_PAYMENT_PAST_DUE_TITLE_MM";
      }
      uint64_t v12 = 2LL;
      goto LABEL_19;
    }
  }

  else if (featureIdentifier == 5 && self->_accountState == 4)
  {
    v11 = @"ACCOUNT_NOTIFICATION_CLOSED_SUBTITLE";
    uint64_t v12 = 5LL;
LABEL_19:
    uint64_t v14 = PKLocalizedFeatureString(v11, v12);
    uint64_t v15 = objc_claimAutoreleasedReturnValue(v14);

    v9 = (void *)v15;
  }

  return v9;
}

- (id)_messageStringWithGenericMessaging:(BOOL)a3
{
  BOOL v3 = a3;
  unint64_t accessLevel = self->_accessLevel;
  if (accessLevel >= 2)
  {
    if (accessLevel == 2)
    {
      uint64_t v10 = PKLocalizedMadisonString(@"SHARING_STOPPED_MESSAGE");
      v9 = (void *)objc_claimAutoreleasedReturnValue(v10);
    }

    else
    {
      v9 = 0LL;
    }
  }

  else
  {
    uint64_t v6 = PDDeviceSpecificLocalizedStringKeyForKey(@"ACCOUNT_NOTIFICATION_IMPORTANT_UPDATE_MESSAGE", a2);
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
    uint64_t v8 = PKLocalizedFeatureString(v7, self->_featureIdentifier);
    v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
  }

  unint64_t featureIdentifier = self->_featureIdentifier;
  if (featureIdentifier == 2)
  {
    if (self->_accountStateReason == 8)
    {
      if (self->_requiresDebtCollectionNotices || v3)
      {
        uint64_t v15 = PDDeviceSpecificLocalizedStringKeyForKey(@"ACCOUNT_SERVICE_PAYMENT_PAST_DUE_BODY_MM", a2);
        uint64_t v16 = objc_claimAutoreleasedReturnValue(v15);
        uint64_t v17 = PKLocalizedFeatureString(v16, self->_featureIdentifier);
        uint64_t v18 = objc_claimAutoreleasedReturnValue(v17);

        v9 = (void *)v16;
LABEL_23:

        v9 = (void *)v18;
        return v9;
      }

      v13 = @"ACCOUNT_NOTIFICATION_CHARGEDOFF_MESSAGE";
      uint64_t v19 = 2LL;
LABEL_22:
      uint64_t v20 = PKLocalizedFeatureString(v13, v19);
      uint64_t v18 = objc_claimAutoreleasedReturnValue(v20);
      goto LABEL_23;
    }
  }

  else if (featureIdentifier == 5)
  {
    unint64_t accountState = self->_accountState;
    switch(accountState)
    {
      case 4uLL:
        v13 = @"ACCOUNT_NOTIFICATION_CLOSED_MESSAGE";
        goto LABEL_20;
      case 3uLL:
        v13 = @"ACCOUNT_NOTIFICATION_LOCKED_MESSAGE";
        goto LABEL_20;
      case 2uLL:
        v13 = @"ACCOUNT_NOTIFICATION_RESTRICTED_MESSAGE";
LABEL_20:
        uint64_t v19 = 5LL;
        goto LABEL_22;
    }
  }

  return v9;
}

- (id)notificationContentWithDataSource:(id)a3
{
  v13.receiver = self;
  v13.super_class = (Class)&OBJC_CLASS___PDPassAccountStateChangeUserNotification;
  id v4 = a3;
  id v5 = -[PDUserNotification notificationContentWithDataSource:](&v13, "notificationContentWithDataSource:", v4);
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "notificationSettings", v13.receiver, v13.super_class));

  BOOL v8 = [v7 showPreviewsSetting] == 0;
  v9 = (void *)objc_claimAutoreleasedReturnValue( -[PDPassAccountStateChangeUserNotification _titleStringWithGenericMessaging:]( self,  "_titleStringWithGenericMessaging:",  v8));
  [v6 setTitle:v9];

  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue( -[PDPassAccountStateChangeUserNotification _messageStringWithGenericMessaging:]( self,  "_messageStringWithGenericMessaging:",  v8));
  [v6 setBody:v10];

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[PDUserNotification date](self, "date"));
  [v6 setDate:v11];

  if (self->_featureIdentifier == 2 && self->_accountStateReason == 8) {
    [v6 setInterruptionLevel:2];
  }

  return v6;
}

- (BOOL)isValid
{
  unint64_t featureIdentifier = self->_featureIdentifier;
  if (featureIdentifier == 3 || featureIdentifier == 5) {
    return 1;
  }
  unint64_t accountState = self->_accountState;
  if (accountState == 2) {
    return 1;
  }
  if (accountState != 4) {
    return 0;
  }
  BOOL result = self->_accessLevel == 2;
  if (self->_accountStateReason == 8) {
    return 1;
  }
  return result;
}

- (unint64_t)notificationType
{
  return 20LL;
}

- (unint64_t)accountState
{
  return self->_accountState;
}

- (unint64_t)accountStateReason
{
  return self->_accountStateReason;
}

- (unint64_t)accessLevel
{
  return self->_accessLevel;
}

- (unint64_t)featureIdentifier
{
  return self->_featureIdentifier;
}

- (BOOL)requiresDebtCollectionNotices
{
  return self->_requiresDebtCollectionNotices;
}

@end