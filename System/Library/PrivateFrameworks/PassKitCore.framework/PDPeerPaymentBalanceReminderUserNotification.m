@interface PDPeerPaymentBalanceReminderUserNotification
+ (BOOL)supportsSecureCoding;
- (BOOL)isValid;
- (PDPeerPaymentBalanceReminderUserNotification)initWithCoder:(id)a3;
- (PDPeerPaymentBalanceReminderUserNotification)initWithPassUniqueIdentifier:(id)a3 currentBalance:(id)a4 reminderDate:(id)a5;
- (PKCurrencyAmount)currentBalance;
- (id)_messageString;
- (id)_titleString;
- (unint64_t)notificationType;
- (void)encodeWithCoder:(id)a3;
- (void)updateWithNewBalance:(id)a3 andNewReminderDate:(id)a4;
@end

@implementation PDPeerPaymentBalanceReminderUserNotification

- (PDPeerPaymentBalanceReminderUserNotification)initWithPassUniqueIdentifier:(id)a3 currentBalance:(id)a4 reminderDate:(id)a5
{
  id v9 = a4;
  id v10 = a5;
  id v11 = a3;
  v12 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"PDBalanceReminderUserNotification-%@",  v11));
  v15.receiver = self;
  v15.super_class = (Class)&OBJC_CLASS___PDPeerPaymentBalanceReminderUserNotification;
  v13 = -[PDUserNotification initWithNotificationIdentifier:forPassUniqueIdentifier:]( &v15,  "initWithNotificationIdentifier:forPassUniqueIdentifier:",  v12,  v11);

  if (v13)
  {
    objc_storeStrong((id *)&v13->_currentBalance, a4);
    -[PDUserNotification setDate:](v13, "setDate:", v10);
  }

  return v13;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PDPeerPaymentBalanceReminderUserNotification)initWithCoder:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)&OBJC_CLASS___PDPeerPaymentBalanceReminderUserNotification;
  v6 = -[PDUserNotification initWithCoder:](&v11, "initWithCoder:", v4);
  if (v6)
  {
    id v7 = objc_msgSend( v4,  "decodeObjectOfClass:forKey:",  objc_opt_class(PKCurrencyAmount, v5),  @"currentBalance");
    uint64_t v8 = objc_claimAutoreleasedReturnValue(v7);
    currentBalance = v6->_currentBalance;
    v6->_currentBalance = (PKCurrencyAmount *)v8;
  }

  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___PDPeerPaymentBalanceReminderUserNotification;
  id v4 = a3;
  -[PDUserNotification encodeWithCoder:](&v5, "encodeWithCoder:", v4);
  objc_msgSend(v4, "encodeObject:forKey:", self->_currentBalance, @"currentBalance", v5.receiver, v5.super_class);
}

- (void)updateWithNewBalance:(id)a3 andNewReminderDate:(id)a4
{
  id v6 = a4;
  -[PDUserNotification setDate:](self, "setDate:", v6);
}

- (BOOL)isValid
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[PKCurrencyAmount amount](self->_currentBalance, "amount"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSDecimalNumber zero](&OBJC_CLASS___NSDecimalNumber, "zero"));
  BOOL v4 = [v2 compare:v3] == (id)1;

  return v4;
}

- (unint64_t)notificationType
{
  return 14LL;
}

- (id)_titleString
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[PKCurrencyAmount formattedStringValue](self->_currentBalance, "formattedStringValue"));
  uint64_t v3 = PKLocalizedPeerPaymentString( @"PEER_PAYMENT_BALANCE_REMINDER_NOTIFICATION_TITLE",  @"%@",  v2);
  BOOL v4 = (void *)objc_claimAutoreleasedReturnValue(v3);

  return v4;
}

- (id)_messageString
{
  return (id)PKLocalizedPeerPaymentString(@"PEER_PAYMENT_BALANCE_REMINDER_NOTIFICATION_MESSAGE");
}

- (PKCurrencyAmount)currentBalance
{
  return self->_currentBalance;
}

- (void).cxx_destruct
{
}

@end