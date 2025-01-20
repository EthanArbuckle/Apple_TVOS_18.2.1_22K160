@interface PDInstallmentStateUserNotification
+ (BOOL)supportsSecureCoding;
- (BOOL)isValid;
- (NSDate)statementClosingDate;
- (PDInstallmentStateUserNotification)initWithAccount:(id)a3 installmentPlan:(id)a4 passUniqueIdentifier:(id)a5;
- (PDInstallmentStateUserNotification)initWithCoder:(id)a3;
- (id)notificationContentWithDataSource:(id)a3;
- (unint64_t)notificationType;
- (void)encodeWithCoder:(id)a3;
- (void)setStatementClosingDate:(id)a3;
@end

@implementation PDInstallmentStateUserNotification

- (PDInstallmentStateUserNotification)initWithAccount:(id)a3 installmentPlan:(id)a4 passUniqueIdentifier:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (v9)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue([v9 identifier]);
    v12 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@-installmentPlanState",  v11));

    v22.receiver = self;
    v22.super_class = (Class)&OBJC_CLASS___PDInstallmentStateUserNotification;
    v13 = -[PDUserNotification initWithNotificationIdentifier:forPassUniqueIdentifier:]( &v22,  "initWithNotificationIdentifier:forPassUniqueIdentifier:",  v12,  v10);
    if (v13)
    {
      v14 = (void *)objc_claimAutoreleasedReturnValue([v8 accountIdentifier]);
      -[PDUserNotification setAccountIdentifier:](v13, "setAccountIdentifier:", v14);
      objc_storeStrong((id *)&v13->_installmentPlan, a4);
      v15 = (void *)objc_claimAutoreleasedReturnValue([v8 creditDetails]);
      v16 = (void *)objc_claimAutoreleasedReturnValue([v15 accountSummary]);
      unsigned __int8 v17 = [v16 requiresDebtCollectionNotices];

      if ((v17 & 1) == 0)
      {
        uint64_t v18 = PKInstallmentRoutePass;
        v19 = (void *)objc_claimAutoreleasedReturnValue(-[PKCreditInstallmentPlan identifier](v13->_installmentPlan, "identifier"));
        v20 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@/%@/%@",  v18,  v19,  v14));

        -[PDUserNotification setCustomActionRoute:](v13, "setCustomActionRoute:", v20);
      }
    }
  }

  else
  {

    v13 = 0LL;
  }

  return v13;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PDInstallmentStateUserNotification)initWithCoder:(id)a3
{
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)&OBJC_CLASS___PDInstallmentStateUserNotification;
  v6 = -[PDUserNotification initWithCoder:](&v15, "initWithCoder:", v4);
  if (v6)
  {
    id v7 = objc_msgSend( v4,  "decodeObjectOfClass:forKey:",  objc_opt_class(PKCreditInstallmentPlan, v5),  @"installmentPlan");
    uint64_t v8 = objc_claimAutoreleasedReturnValue(v7);
    installmentPlan = v6->_installmentPlan;
    v6->_installmentPlan = (PKCreditInstallmentPlan *)v8;

    id v11 = objc_msgSend( v4,  "decodeObjectOfClass:forKey:",  objc_opt_class(NSDate, v10),  @"statementClosingDate");
    uint64_t v12 = objc_claimAutoreleasedReturnValue(v11);
    statementClosingDate = v6->_statementClosingDate;
    v6->_statementClosingDate = (NSDate *)v12;
  }

  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___PDInstallmentStateUserNotification;
  id v4 = a3;
  -[PDUserNotification encodeWithCoder:](&v5, "encodeWithCoder:", v4);
  objc_msgSend( v4,  "encodeObject:forKey:",  self->_installmentPlan,  @"installmentPlan",  v5.receiver,  v5.super_class);
  [v4 encodeObject:self->_statementClosingDate forKey:@"statementClosingDate"];
}

- (unint64_t)notificationType
{
  return 26LL;
}

- (BOOL)isValid
{
  return -[PKCreditInstallmentPlan state](self->_installmentPlan, "state") == (id)2
      && self->_statementClosingDate != 0LL;
}

- (id)notificationContentWithDataSource:(id)a3
{
  v25.receiver = self;
  v25.super_class = (Class)&OBJC_CLASS___PDInstallmentStateUserNotification;
  id v4 = -[PDUserNotification notificationContentWithDataSource:](&v25, "notificationContentWithDataSource:", a3);
  objc_super v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  if (-[PKCreditInstallmentPlan state](self->_installmentPlan, "state") == (id)2)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[PKCreditInstallmentPlan payments](self->_installmentPlan, "payments"));
    id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 firstObject]);

    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(-[PKCreditInstallmentPlan product](self->_installmentPlan, "product"));
    if (v7)
    {
      id v9 = (NSDecimalNumber *)objc_claimAutoreleasedReturnValue([v7 amountDue]);
      uint64_t v10 = (NSString *)objc_claimAutoreleasedReturnValue([v7 currencyCode]);
      uint64_t v11 = PKCurrencyAmountCreate(v9, v10, 0LL);
      uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(v11);

      v13 = (void *)objc_claimAutoreleasedReturnValue( +[NSCalendar calendarWithIdentifier:]( &OBJC_CLASS___NSCalendar,  "calendarWithIdentifier:",  NSCalendarIdentifierGregorian));
      v14 = (void *)objc_claimAutoreleasedReturnValue([v13 components:8 fromDate:self->_statementClosingDate]);
      id v15 = [v14 month];

      uint64_t v16 = PKGregorianMonthSpecificLocalizedStringKeyForKey( @"INSTALLMENT_STATE_CHANGE_NOTIFICATION_ACTIVE_MESSAGE",  v15);
      unsigned __int8 v17 = (NSString *)objc_claimAutoreleasedReturnValue(v16);
      uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue([v8 model]);
      v19 = (void *)objc_claimAutoreleasedReturnValue([v12 formattedStringValue]);
      uint64_t v20 = PKLocalizedBeekmanString(v17, @"%@%@", v18, v19);
      v21 = (void *)objc_claimAutoreleasedReturnValue(v20);
    }

    else
    {
      v21 = 0LL;
    }
  }

  else
  {
    v21 = 0LL;
  }

  uint64_t v22 = PKLocalizedBeekmanString(@"APPLE_CARD_INSTALLMENTS");
  v23 = (void *)objc_claimAutoreleasedReturnValue(v22);
  [v5 setSubtitle:v23];
  if (v21) {
    [v5 setBody:v21];
  }

  return v5;
}

- (NSDate)statementClosingDate
{
  return self->_statementClosingDate;
}

- (void)setStatementClosingDate:(id)a3
{
}

- (void).cxx_destruct
{
}

@end