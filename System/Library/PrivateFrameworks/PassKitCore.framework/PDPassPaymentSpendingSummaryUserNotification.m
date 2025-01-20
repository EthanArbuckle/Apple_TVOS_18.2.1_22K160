@interface PDPassPaymentSpendingSummaryUserNotification
+ (BOOL)supportsSecureCoding;
- (BOOL)isValid;
- (BOOL)summaryIncludesUsers;
- (PDPassPaymentSpendingSummaryUserNotification)initWithCoder:(id)a3;
- (PDPassPaymentSpendingSummaryUserNotification)initWithSpendingSummary:(id)a3 accountUserCollection:(id)a4 forPassUniqueIdentifier:(id)a5;
- (PKCurrencyAmount)rewardsAccrued;
- (PKCurrencyAmount)totalSpending;
- (id)_messageString;
- (id)_titleString;
- (id)notificationContentWithDataSource:(id)a3;
- (unint64_t)notificationType;
- (unint64_t)summaryType;
- (void)encodeWithCoder:(id)a3;
@end

@implementation PDPassPaymentSpendingSummaryUserNotification

- (PDPassPaymentSpendingSummaryUserNotification)initWithSpendingSummary:(id)a3 accountUserCollection:(id)a4 forPassUniqueIdentifier:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = (void *)objc_claimAutoreleasedReturnValue([v8 totalSpending]);
  v12 = (void *)objc_claimAutoreleasedReturnValue([v8 rewards]);
  v13 = (void *)objc_claimAutoreleasedReturnValue([v12 totalAmount]);

  v14 = (void *)objc_claimAutoreleasedReturnValue([v9 accountUsers]);
  if ((unint64_t)[v14 count] < 2)
  {
    BOOL v16 = 0;
  }

  else
  {
    v15 = (void *)objc_claimAutoreleasedReturnValue([v9 currentAccountUser]);
    BOOL v16 = [v15 accessLevel] != (id)2;
  }

  if (!v10 || !v8 || !v11 || !v13) {
    goto LABEL_13;
  }
  v17 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( NSString,  "stringWithFormat:",  @"spending-%lu-%lu",  [v8 summaryType],  objc_msgSend(v8, "summaryUnit")));
  v31.receiver = self;
  v31.super_class = (Class)&OBJC_CLASS___PDPassPaymentSpendingSummaryUserNotification;
  self = -[PDUserNotification initWithNotificationIdentifier:forPassUniqueIdentifier:]( &v31,  "initWithNotificationIdentifier:forPassUniqueIdentifier:",  v17,  v10);

  if (!self) {
    goto LABEL_16;
  }
  self->_unint64_t summaryType = (unint64_t)[v8 summaryType];
  objc_storeStrong((id *)&self->_rewardsAccrued, v13);
  objc_storeStrong((id *)&self->_totalSpending, v11);
  self->_summaryIncludesUsers = v16;
  -[PDUserNotification setReissueBannerOnUpdate:](self, "setReissueBannerOnUpdate:", 0LL);
  uint32_t v18 = arc4random_uniform(0x1C20u);
  unint64_t summaryType = self->_summaryType;
  if (summaryType == 2)
  {
LABEL_13:

    self = 0LL;
    goto LABEL_16;
  }

  unsigned int v20 = v18;
  if (summaryType == 1)
  {
    v27 = (void *)objc_claimAutoreleasedReturnValue([v8 endDate]);
    v28 = (void *)objc_claimAutoreleasedReturnValue([v27 dateByAddingTimeInterval:(double)v20 + 68400.0]);
    -[PDUserNotification setDate:](self, "setDate:", v28);

    -[PDUserNotification setCustomActionRoute:]( self,  "setCustomActionRoute:",  PKUserNotificationActionRouteViewSpendingSummary);
    v32[0] = PKUserNotificationActionQueryItemSpendingSummaryType;
    v23 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( NSString,  "stringWithFormat:",  @"%lu",  [v8 summaryType]));
    v33[0] = v23;
    v32[1] = PKUserNotificationActionQueryItemSpendingSummaryUnit;
    v24 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( NSString,  "stringWithFormat:",  @"%lu",  [v8 summaryUnit]));
    v32[2] = PKUserNotificationActionQueryItemPassUniqueIdentifier;
    v33[1] = v24;
    v33[2] = v10;
    v25 = v33;
    v26 = v32;
    goto LABEL_15;
  }

  if (!summaryType)
  {
    v21 = (void *)objc_claimAutoreleasedReturnValue([v8 endDate]);
    v22 = (void *)objc_claimAutoreleasedReturnValue([v21 dateByAddingTimeInterval:(double)v20 + 68400.0]);
    -[PDUserNotification setDate:](self, "setDate:", v22);

    -[PDUserNotification setCustomActionRoute:]( self,  "setCustomActionRoute:",  PKUserNotificationActionRouteViewSpendingSummary);
    v34[0] = PKUserNotificationActionQueryItemSpendingSummaryType;
    v23 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( NSString,  "stringWithFormat:",  @"%lu",  [v8 summaryType]));
    v35[0] = v23;
    v34[1] = PKUserNotificationActionQueryItemSpendingSummaryUnit;
    v24 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( NSString,  "stringWithFormat:",  @"%lu",  [v8 summaryUnit]));
    v34[2] = PKUserNotificationActionQueryItemPassUniqueIdentifier;
    v35[1] = v24;
    v35[2] = v10;
    v25 = v35;
    v26 = v34;
LABEL_15:
    v29 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v25,  v26,  3LL));
    -[PDUserNotification setCustomActionQueryParameters:](self, "setCustomActionQueryParameters:", v29);
  }

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PDPassPaymentSpendingSummaryUserNotification)initWithCoder:(id)a3
{
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)&OBJC_CLASS___PDPassPaymentSpendingSummaryUserNotification;
  v5 = -[PDUserNotification initWithCoder:](&v15, "initWithCoder:", v4);
  if (v5)
  {
    v5->_unint64_t summaryType = (unint64_t)[v4 decodeIntegerForKey:@"spendingSummaryType"];
    id v7 = objc_msgSend( v4,  "decodeObjectOfClass:forKey:",  objc_opt_class(PKCurrencyAmount, v6),  @"spendingRewards");
    uint64_t v8 = objc_claimAutoreleasedReturnValue(v7);
    rewardsAccrued = v5->_rewardsAccrued;
    v5->_rewardsAccrued = (PKCurrencyAmount *)v8;

    id v11 = objc_msgSend( v4,  "decodeObjectOfClass:forKey:",  objc_opt_class(PKCurrencyAmount, v10),  @"spendingTotal");
    uint64_t v12 = objc_claimAutoreleasedReturnValue(v11);
    totalSpending = v5->_totalSpending;
    v5->_totalSpending = (PKCurrencyAmount *)v12;

    v5->_summaryIncludesUsers = [v4 decodeBoolForKey:@"summaryIncludesUsers"];
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___PDPassPaymentSpendingSummaryUserNotification;
  id v4 = a3;
  -[PDUserNotification encodeWithCoder:](&v5, "encodeWithCoder:", v4);
  objc_msgSend( v4,  "encodeInteger:forKey:",  self->_summaryType,  @"spendingSummaryType",  v5.receiver,  v5.super_class);
  [v4 encodeObject:self->_rewardsAccrued forKey:@"spendingRewards"];
  [v4 encodeObject:self->_totalSpending forKey:@"spendingTotal"];
  [v4 encodeBool:self->_summaryIncludesUsers forKey:@"summaryIncludesUsers"];
}

- (unint64_t)notificationType
{
  return 18LL;
}

- (BOOL)isValid
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[PKCurrencyAmount amount](self->_totalSpending, "amount"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSDecimalNumber zero](&OBJC_CLASS___NSDecimalNumber, "zero"));
  BOOL v4 = [v2 compare:v3] == (id)1;

  return v4;
}

- (id)notificationContentWithDataSource:(id)a3
{
  v10.receiver = self;
  v10.super_class = (Class)&OBJC_CLASS___PDPassPaymentSpendingSummaryUserNotification;
  id v4 = -[PDUserNotification notificationContentWithDataSource:](&v10, "notificationContentWithDataSource:", a3);
  objc_super v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(-[PDPassPaymentSpendingSummaryUserNotification _titleString](self, "_titleString"));
  [v5 setSubtitle:v6];

  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[PDPassPaymentSpendingSummaryUserNotification _messageString](self, "_messageString"));
  [v5 setBody:v7];

  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(-[PDUserNotification date](self, "date"));
  [v5 setDate:v8];

  return v5;
}

- (id)_messageString
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[PKCurrencyAmount amount](self->_rewardsAccrued, "amount"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSDecimalNumber zero](&OBJC_CLASS___NSDecimalNumber, "zero"));
  id v5 = [v3 compare:v4];

  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(-[PKCurrencyAmount minimalFormattedStringValue](self->_totalSpending, "minimalFormattedStringValue"));
  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[PKCurrencyAmount minimalFormattedStringValue](self->_rewardsAccrued, "minimalFormattedStringValue"));
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(-[PKCurrencyAmount amount](self->_totalSpending, "amount"));
  [v8 floatValue];
  float v10 = v9;

  id v11 = (void *)objc_claimAutoreleasedReturnValue(-[PKCurrencyAmount amount](self->_rewardsAccrued, "amount"));
  [v11 floatValue];
  float v13 = v12;

  unint64_t summaryType = self->_summaryType;
  if (summaryType == 1)
  {
    double v16 = v10;
    if (v5 == (id)1)
    {
      double v17 = v13;
      if (self->_summaryIncludesUsers)
      {
        objc_super v31 = v6;
        v32 = v7;
        double v27 = v10;
        double v29 = v13;
        uint32_t v18 = @"ACCOUNT_NOTIFICATION_SPENDING_SUMMARY_FAMILY_MONTH_MESSAGE";
        goto LABEL_9;
      }

      v23 = @"ACCOUNT_NOTIFICATION_SPENDING_SUMMARY_MONTH_MESSAGE";
      goto LABEL_19;
    }

    if (self->_summaryIncludesUsers)
    {
      v30 = v6;
      double v28 = v10;
      v21 = @"ACCOUNT_NOTIFICATION_SPENDING_SUMMARY_FAMILY_MONTH_MESSAGE_NO_REWARDS";
      goto LABEL_15;
    }

    v23 = @"ACCOUNT_NOTIFICATION_SPENDING_SUMMARY_MONTH_MESSAGE_NO_REWARDS";
LABEL_22:
    v24 = @"%lf%@";
    goto LABEL_23;
  }

  if (!summaryType)
  {
    double v16 = v10;
    if (v5 == (id)1)
    {
      double v17 = v13;
      if (self->_summaryIncludesUsers)
      {
        objc_super v31 = v6;
        v32 = v7;
        double v27 = v10;
        double v29 = v13;
        uint32_t v18 = @"ACCOUNT_NOTIFICATION_SPENDING_SUMMARY_FAMILY_WEEK_MESSAGE";
LABEL_9:
        uint64_t v19 = PKLocalizedMadisonString( &v18->isa,  @"%lf%lf%@%@",  v16,  v17,  *(void *)&v27,  *(void *)&v29,  v31,  v32);
LABEL_16:
        uint64_t v22 = objc_claimAutoreleasedReturnValue(v19);
LABEL_24:
        unsigned int v20 = (void *)v22;
        goto LABEL_25;
      }

      v23 = @"ACCOUNT_NOTIFICATION_SPENDING_SUMMARY_WEEK_MESSAGE";
LABEL_19:
      v24 = @"%lf%lf%@%@";
LABEL_23:
      uint64_t v25 = PKLocalizedFeatureString(v23, 2LL, v24);
      uint64_t v22 = objc_claimAutoreleasedReturnValue(v25);
      goto LABEL_24;
    }

    if (self->_summaryIncludesUsers)
    {
      v30 = v6;
      double v28 = v10;
      v21 = @"ACCOUNT_NOTIFICATION_SPENDING_SUMMARY_FAMILY_WEEK_MESSAGE_NO_REWARDS";
LABEL_15:
      uint64_t v19 = PKLocalizedMadisonString(&v21->isa, @"%lf%@", v16, v14, *(void *)&v28, v30);
      goto LABEL_16;
    }

    v23 = @"ACCOUNT_NOTIFICATION_SPENDING_SUMMARY_WEEK_MESSAGE_NO_REWARDS";
    goto LABEL_22;
  }

  unsigned int v20 = 0LL;
LABEL_25:

  return v20;
}

- (id)_titleString
{
  unint64_t summaryType = self->_summaryType;
  if (summaryType)
  {
    if (summaryType != 1)
    {
      id v5 = 0LL;
      return v5;
    }

    v3 = @"ACCOUNT_NOTIFICATION_SPENDING_SUMMARY_MONTH_TITLE";
  }

  else
  {
    v3 = @"ACCOUNT_NOTIFICATION_SPENDING_SUMMARY_WEEK_TITLE";
  }

  uint64_t v4 = PKLocalizedFeatureString(v3, 2LL);
  id v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  return v5;
}

- (PKCurrencyAmount)totalSpending
{
  return self->_totalSpending;
}

- (PKCurrencyAmount)rewardsAccrued
{
  return self->_rewardsAccrued;
}

- (unint64_t)summaryType
{
  return self->_summaryType;
}

- (BOOL)summaryIncludesUsers
{
  return self->_summaryIncludesUsers;
}

- (void).cxx_destruct
{
}

@end