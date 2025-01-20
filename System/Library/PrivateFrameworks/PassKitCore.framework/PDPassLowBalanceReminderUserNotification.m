@interface PDPassLowBalanceReminderUserNotification
+ (BOOL)supportsSecureCoding;
- (NSDecimalNumber)currentBalanceAmount;
- (NSDecimalNumber)reminderAmount;
- (NSString)balanceIdentifier;
- (NSString)currentBalanceCurrency;
- (NSString)reminderCurrency;
- (PDPassLowBalanceReminderUserNotification)initWithCoder:(id)a3;
- (PDPassLowBalanceReminderUserNotification)initWithCurrentBalance:(id)a3 balanceCurrency:(id)a4 exponent:(int64_t)a5 reminderAmount:(id)a6 reminderCurrency:(id)a7 passUniqueIdentifier:(id)a8 balanceIdentifier:(id)a9;
- (id)_messageString;
- (id)_titleString;
- (id)notificationContentWithDataSource:(id)a3;
- (int64_t)exponent;
- (unint64_t)notificationType;
- (void)encodeWithCoder:(id)a3;
- (void)updateBalanceAmount:(id)a3 currency:(id)a4 exponent:(int64_t)a5;
- (void)updateReminderAmount:(id)a3 currency:(id)a4;
@end

@implementation PDPassLowBalanceReminderUserNotification

- (PDPassLowBalanceReminderUserNotification)initWithCurrentBalance:(id)a3 balanceCurrency:(id)a4 exponent:(int64_t)a5 reminderAmount:(id)a6 reminderCurrency:(id)a7 passUniqueIdentifier:(id)a8 balanceIdentifier:(id)a9
{
  id v24 = a3;
  id v23 = a4;
  id v22 = a6;
  id v21 = a7;
  id v15 = a9;
  id v16 = a8;
  v17 = (void *)objc_claimAutoreleasedReturnValue([v16 stringByAppendingString:@"-LowBalance"]);
  v25.receiver = self;
  v25.super_class = (Class)&OBJC_CLASS___PDPassLowBalanceReminderUserNotification;
  v18 = -[PDUserNotification initWithNotificationIdentifier:forPassUniqueIdentifier:]( &v25,  "initWithNotificationIdentifier:forPassUniqueIdentifier:",  v17,  v16);

  if (v18)
  {
    objc_storeStrong((id *)&v18->_currentBalanceAmount, a3);
    objc_storeStrong((id *)&v18->_currentBalanceCurrency, a4);
    objc_storeStrong((id *)&v18->_reminderAmount, a6);
    objc_storeStrong((id *)&v18->_reminderCurrency, a7);
    objc_storeStrong((id *)&v18->_balanceIdentifier, a9);
    v18->_exponent = a5;
  }

  return v18;
}

- (void)updateBalanceAmount:(id)a3 currency:(id)a4 exponent:(int64_t)a5
{
  v8 = (NSDecimalNumber *)a3;
  v9 = (NSString *)a4;
  currentBalanceAmount = self->_currentBalanceAmount;
  self->_currentBalanceAmount = v8;
  v11 = v8;

  currentBalanceCurrency = self->_currentBalanceCurrency;
  self->_currentBalanceCurrency = v9;

  self->_exponent = a5;
}

- (void)updateReminderAmount:(id)a3 currency:(id)a4
{
  v6 = (NSDecimalNumber *)a3;
  v7 = (NSString *)a4;
  reminderAmount = self->_reminderAmount;
  self->_reminderAmount = v6;
  v10 = v6;

  reminderCurrency = self->_reminderCurrency;
  self->_reminderCurrency = v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PDPassLowBalanceReminderUserNotification)initWithCoder:(id)a3
{
  id v4 = a3;
  v27.receiver = self;
  v27.super_class = (Class)&OBJC_CLASS___PDPassLowBalanceReminderUserNotification;
  v6 = -[PDUserNotification initWithCoder:](&v27, "initWithCoder:", v4);
  if (v6)
  {
    id v7 = objc_msgSend( v4,  "decodeObjectOfClass:forKey:",  objc_opt_class(NSDecimalNumber, v5),  @"currentBalanceAmount");
    uint64_t v8 = objc_claimAutoreleasedReturnValue(v7);
    currentBalanceAmount = v6->_currentBalanceAmount;
    v6->_currentBalanceAmount = (NSDecimalNumber *)v8;

    id v11 = objc_msgSend( v4,  "decodeObjectOfClass:forKey:",  objc_opt_class(NSString, v10),  @"currentBalanceCurrency");
    uint64_t v12 = objc_claimAutoreleasedReturnValue(v11);
    currentBalanceCurrency = v6->_currentBalanceCurrency;
    v6->_currentBalanceCurrency = (NSString *)v12;

    id v15 = objc_msgSend( v4,  "decodeObjectOfClass:forKey:",  objc_opt_class(NSString, v14),  @"reminderCurrency");
    uint64_t v16 = objc_claimAutoreleasedReturnValue(v15);
    reminderCurrency = v6->_reminderCurrency;
    v6->_reminderCurrency = (NSString *)v16;

    id v19 = objc_msgSend( v4,  "decodeObjectOfClass:forKey:",  objc_opt_class(NSString, v18),  @"reminderAmount");
    uint64_t v20 = objc_claimAutoreleasedReturnValue(v19);
    reminderAmount = v6->_reminderAmount;
    v6->_reminderAmount = (NSDecimalNumber *)v20;

    id v23 = objc_msgSend( v4,  "decodeObjectOfClass:forKey:",  objc_opt_class(NSString, v22),  @"balanceIdentifier");
    uint64_t v24 = objc_claimAutoreleasedReturnValue(v23);
    balanceIdentifier = v6->_balanceIdentifier;
    v6->_balanceIdentifier = (NSString *)v24;

    v6->_exponent = (int64_t)[v4 decodeIntegerForKey:@"exponent"];
  }

  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___PDPassLowBalanceReminderUserNotification;
  id v4 = a3;
  -[PDUserNotification encodeWithCoder:](&v5, "encodeWithCoder:", v4);
  objc_msgSend( v4,  "encodeObject:forKey:",  self->_currentBalanceAmount,  @"currentBalanceAmount",  v5.receiver,  v5.super_class);
  [v4 encodeObject:self->_currentBalanceCurrency forKey:@"currentBalanceCurrency"];
  [v4 encodeObject:self->_reminderCurrency forKey:@"reminderCurrency"];
  [v4 encodeObject:self->_reminderAmount forKey:@"reminderAmount"];
  [v4 encodeObject:self->_balanceIdentifier forKey:@"balanceIdentifier"];
  [v4 encodeInteger:self->_exponent forKey:@"exponent"];
}

- (unint64_t)notificationType
{
  return 7LL;
}

- (id)_titleString
{
  v3 = (void *)PKNoCurrencyCode;
  id v4 = self->_reminderCurrency;
  objc_super v5 = v3;
  if (v4 != v5)
  {
    v6 = v5;
    if (v4) {
      BOOL v7 = v5 == 0LL;
    }
    else {
      BOOL v7 = 1;
    }
    if (v7)
    {
    }

    else
    {
      unsigned int v8 = -[NSString isEqualToString:](v4, "isEqualToString:", v5);

      if (v8) {
        goto LABEL_10;
      }
    }

    uint64_t v11 = PKFormattedCurrencyStringFromNumber(self->_reminderAmount, self->_reminderCurrency);
    uint64_t v10 = objc_claimAutoreleasedReturnValue(v11);
    goto LABEL_12;
  }

LABEL_10:
  uint64_t v9 = PKFormattedStringMinimalFractionDigitsFromNumber(self->_reminderAmount, self->_exponent);
  uint64_t v10 = objc_claimAutoreleasedReturnValue(v9);
LABEL_12:
  uint64_t v12 = (void *)v10;
  uint64_t v13 = PKLocalizedPaymentString(@"LOW_BALANCE_REMINDER_NOTIFICATION_TITLE", @"%@", v10);
  uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue(v13);

  return v14;
}

- (id)_messageString
{
  v3 = (void *)PKNoCurrencyCode;
  id v4 = self->_currentBalanceCurrency;
  objc_super v5 = v3;
  if (v4 != v5)
  {
    v6 = v5;
    if (v4) {
      BOOL v7 = v5 == 0LL;
    }
    else {
      BOOL v7 = 1;
    }
    if (v7)
    {
    }

    else
    {
      unsigned int v8 = -[NSString isEqualToString:](v4, "isEqualToString:", v5);

      if (v8) {
        goto LABEL_10;
      }
    }

    uint64_t v11 = PKFormattedCurrencyStringFromNumber(self->_currentBalanceAmount, self->_currentBalanceCurrency);
    uint64_t v10 = objc_claimAutoreleasedReturnValue(v11);
    goto LABEL_12;
  }

LABEL_10:
  uint64_t v9 = PKFormattedStringMinimalFractionDigitsFromNumber(self->_currentBalanceAmount, self->_exponent);
  uint64_t v10 = objc_claimAutoreleasedReturnValue(v9);
LABEL_12:
  uint64_t v12 = (void *)v10;
  uint64_t v13 = PKLocalizedPaymentString(@"LOW_BALANCE_REMINDER_NOTIFICATION_MESSAGE", @"%@", v10);
  uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue(v13);

  return v14;
}

- (id)notificationContentWithDataSource:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS___PDPassLowBalanceReminderUserNotification;
  id v3 = -[PDPassReminderUserNotification notificationContentWithDataSource:]( &v7,  "notificationContentWithDataSource:",  a3);
  id v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  objc_super v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
  [v4 setDate:v5];

  [v4 setInterruptionLevel:2];
  return v4;
}

- (NSDecimalNumber)currentBalanceAmount
{
  return self->_currentBalanceAmount;
}

- (NSString)currentBalanceCurrency
{
  return self->_currentBalanceCurrency;
}

- (int64_t)exponent
{
  return self->_exponent;
}

- (NSDecimalNumber)reminderAmount
{
  return self->_reminderAmount;
}

- (NSString)reminderCurrency
{
  return self->_reminderCurrency;
}

- (NSString)balanceIdentifier
{
  return self->_balanceIdentifier;
}

- (void).cxx_destruct
{
}

@end