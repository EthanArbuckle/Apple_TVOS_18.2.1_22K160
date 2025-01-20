@interface PDAccountBalanceUpdateUserNotification
+ (BOOL)supportsSecureCoding;
- (PDAccountBalanceUpdateUserNotification)initWithAmount:(id)a3 forPassUniqueIdentifier:(id)a4;
- (PKCurrencyAmount)amount;
- (unint64_t)notificationType;
@end

@implementation PDAccountBalanceUpdateUserNotification

- (PDAccountBalanceUpdateUserNotification)initWithAmount:(id)a3 forPassUniqueIdentifier:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  uint64_t v8 = PKLocalizedLynxString(@"NOTIFICATION_IN_STORE_BALANCE_UPDATE_TITLE");
  v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue([v7 minimalFormattedStringValue]);

  uint64_t v11 = PKLocalizedLynxString(@"NOTIFICATION_IN_STORE_BALANCE_UPDATE_MESSAGE", @"%@", v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue(v11);

  v15.receiver = self;
  v15.super_class = (Class)&OBJC_CLASS___PDAccountBalanceUpdateUserNotification;
  v13 = -[PDGenericUserNotification initWithTitle:message:forPassUniqueIdentifier:]( &v15,  "initWithTitle:message:forPassUniqueIdentifier:",  v9,  v12,  v6);

  if (v13) {
    -[PDUserNotification setCustomActionRoute:](v13, "setCustomActionRoute:", PKURLActionRouteAppleBalancePass);
  }

  return v13;
}

- (unint64_t)notificationType
{
  return 70LL;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PKCurrencyAmount)amount
{
  return self->_amount;
}

- (void).cxx_destruct
{
}

@end