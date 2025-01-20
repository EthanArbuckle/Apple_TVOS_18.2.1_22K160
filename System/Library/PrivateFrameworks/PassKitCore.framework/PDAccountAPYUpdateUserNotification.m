@interface PDAccountAPYUpdateUserNotification
+ (BOOL)supportsSecureCoding;
+ (id)notificationIdentifierForAccountIdentifier:(id)a3;
- (BOOL)isValid;
- (PDAccountAPYUpdateUserNotification)initWithAccount:(id)a3;
- (PDAccountAPYUpdateUserNotification)initWithCoder:(id)a3;
- (PKAccount)account;
- (id)_messageStringForAPY:(id)a3 apyDidIncrease:(BOOL)a4;
- (id)_subtitleStringForAPYDidIncrease:(BOOL)a3;
- (id)_titleString;
- (id)notificationContentWithDataSource:(id)a3;
- (unint64_t)notificationType;
- (void)encodeWithCoder:(id)a3;
@end

@implementation PDAccountAPYUpdateUserNotification

+ (id)notificationIdentifierForAccountIdentifier:(id)a3
{
  return +[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%@-apyUpdate", a3);
}

- (PDAccountAPYUpdateUserNotification)initWithAccount:(id)a3
{
  id v5 = a3;
  v6 = v5;
  if (v5)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue([v5 accountIdentifier]);
    id v9 = objc_msgSend((id)objc_opt_class(self, v8), "notificationIdentifierForAccountIdentifier:", v7);
    v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
    v14.receiver = self;
    v14.super_class = (Class)&OBJC_CLASS___PDAccountAPYUpdateUserNotification;
    v11 = -[PDUserNotification initWithNotificationIdentifier:forAccountIdentifier:]( &v14,  "initWithNotificationIdentifier:forAccountIdentifier:",  v10,  v7);
    v12 = v11;
    if (v11)
    {
      objc_storeStrong((id *)&v11->_account, a3);
      -[PDUserNotification setCustomActionRoute:](v12, "setCustomActionRoute:", PKURLActionRouteSavings);
    }
  }

  else
  {

    v12 = 0LL;
  }

  return v12;
}

- (unint64_t)notificationType
{
  return 65LL;
}

- (BOOL)isValid
{
  return PKIsMac(self, a2) ^ 1;
}

- (id)notificationContentWithDataSource:(id)a3
{
  account = self->_account;
  id v5 = a3;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[PKAccount savingsDetails](account, "savingsDetails"));
  v7 = (void *)objc_claimAutoreleasedReturnValue([v6 accountSummary]);
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v7 formattedAPY]);

  id v9 = (void *)objc_claimAutoreleasedReturnValue(-[PKAccount savingsDetails](self->_account, "savingsDetails"));
  v10 = (void *)objc_claimAutoreleasedReturnValue([v9 accountSummary]);
  v11 = (void *)objc_claimAutoreleasedReturnValue([v10 apy]);

  uint64_t updated = PKSavingsPreviousAPYForUpdateMessage();
  v13 = (void *)objc_claimAutoreleasedReturnValue(updated);
  BOOL v14 = [v11 compare:v13] == (id)1;
  v21.receiver = self;
  v21.super_class = (Class)&OBJC_CLASS___PDAccountAPYUpdateUserNotification;
  id v15 = -[PDUserNotification notificationContentWithDataSource:](&v21, "notificationContentWithDataSource:", v5);
  v16 = (void *)objc_claimAutoreleasedReturnValue(v15);

  v17 = (void *)objc_claimAutoreleasedReturnValue(-[PDAccountAPYUpdateUserNotification _titleString](self, "_titleString"));
  [v16 setTitle:v17];

  v18 = (void *)objc_claimAutoreleasedReturnValue( -[PDAccountAPYUpdateUserNotification _subtitleStringForAPYDidIncrease:]( self,  "_subtitleStringForAPYDidIncrease:",  v14));
  [v16 setSubtitle:v18];

  v19 = (void *)objc_claimAutoreleasedReturnValue( -[PDAccountAPYUpdateUserNotification _messageStringForAPY:apyDidIncrease:]( self,  "_messageStringForAPY:apyDidIncrease:",  v8,  v14));
  [v16 setBody:v19];

  return v16;
}

- (id)_titleString
{
  return (id)PKLocalizedFeatureString(@"ACCOUNT_NOTIFICATION_GENERIC_TITLE", 5LL);
}

- (id)_subtitleStringForAPYDidIncrease:(BOOL)a3
{
  if (a3) {
    v3 = @"ACCOUNT_NOTIFICATION_APY_INCREASE_SUBTITLE";
  }
  else {
    v3 = @"ACCOUNT_NOTIFICATION_APY_UPDATE_SUBTITLE";
  }
  return (id)PKLocalizedFeatureString(v3, 5LL);
}

- (id)_messageStringForAPY:(id)a3 apyDidIncrease:(BOOL)a4
{
  if (a4) {
    v4 = @"ACCOUNT_NOTIFICATION_APY_INCREASE_MESSAGE";
  }
  else {
    v4 = @"ACCOUNT_NOTIFICATION_APY_UPDATE_MESSAGE";
  }
  return (id)PKLocalizedFeatureString(v4, 5LL, @"%@");
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PDAccountAPYUpdateUserNotification)initWithCoder:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)&OBJC_CLASS___PDAccountAPYUpdateUserNotification;
  v6 = -[PDUserNotification initWithCoder:](&v11, "initWithCoder:", v4);
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
  v5.super_class = (Class)&OBJC_CLASS___PDAccountAPYUpdateUserNotification;
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