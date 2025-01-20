@interface PDPassPaymentDailyDailyCashWithAmountUserNotification
+ (BOOL)supportsSecureCoding;
- (BOOL)hasValidContent;
- (BOOL)includesMonthlyAggregate;
- (NSSet)dailyRewardTypes;
- (PDPassPaymentDailyDailyCashWithAmountUserNotification)initWithCoder:(id)a3;
- (PDPassPaymentDailyDailyCashWithAmountUserNotification)initWithDailyAmount:(id)a3 monthlyAmount:(id)a4 date:(id)a5 forPassUniqueIdentifier:(id)a6 dailyRewardTypes:(id)a7 monthlyRewardTypes:(id)a8;
- (PKCurrencyAmount)dailyAmount;
- (id)_firstRedemptionInMonthMessage;
- (id)_runningTotalInMonthMessage;
- (id)notificationContentWithDataSource:(id)a3;
- (unint64_t)notificationType;
- (void)encodeWithCoder:(id)a3;
@end

@implementation PDPassPaymentDailyDailyCashWithAmountUserNotification

- (PDPassPaymentDailyDailyCashWithAmountUserNotification)initWithDailyAmount:(id)a3 monthlyAmount:(id)a4 date:(id)a5 forPassUniqueIdentifier:(id)a6 dailyRewardTypes:(id)a7 monthlyRewardTypes:(id)a8
{
  id v15 = a3;
  id v16 = a4;
  id v17 = a5;
  id v18 = a6;
  id v19 = a7;
  id v20 = a8;
  if (!v15) {
    goto LABEL_7;
  }
  id v28 = v17;
  v21 = (void *)objc_claimAutoreleasedReturnValue([v15 amount]);
  v29 = v19;
  v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSDecimalNumber zero](&OBJC_CLASS___NSDecimalNumber, "zero"));
  id v23 = [v21 compare:v22];

  id v19 = v29;
  id v17 = v28;
  if (v23)
  {
    v24 = (void *)objc_claimAutoreleasedReturnValue([v29 anyObject]);
    v30.receiver = self;
    v30.super_class = (Class)&OBJC_CLASS___PDPassPaymentDailyDailyCashWithAmountUserNotification;
    v25 = -[PDPassPaymentDailyDailyCashUserNotification initWithMonthlyAmount:date:forPassUniqueIdentifier:lastRedemptionType:monthlyRewardTypes:]( &v30,  "initWithMonthlyAmount:date:forPassUniqueIdentifier:lastRedemptionType:monthlyRewardTypes:",  v16,  v28,  v18,  [v24 integerValue],  v20);

    if (v25)
    {
      objc_storeStrong((id *)&v25->_dailyAmount, a3);
      objc_storeStrong((id *)&v25->_dailyRewardTypes, a7);
      if (v16 && !PKEqualObjects(v16, v25->_dailyAmount))
      {
        v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSDecimalNumber zero](&OBJC_CLASS___NSDecimalNumber, "zero"));
        v25->_includesMonthlyAggregate = [v16 isEqual:v26] ^ 1;
      }

      else
      {
        v25->_includesMonthlyAggregate = 0;
      }

      id v17 = v28;
    }

    id v19 = v29;
  }

  else
  {
LABEL_7:

    v25 = 0LL;
  }

  return v25;
}

- (PDPassPaymentDailyDailyCashWithAmountUserNotification)initWithCoder:(id)a3
{
  id v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)&OBJC_CLASS___PDPassPaymentDailyDailyCashWithAmountUserNotification;
  v6 = -[PDPassPaymentDailyDailyCashUserNotification initWithCoder:](&v18, "initWithCoder:", v4);
  if (v6)
  {
    id v7 = objc_msgSend( v4,  "decodeObjectOfClass:forKey:",  objc_opt_class(PKCurrencyAmount, v5),  @"dailyAmount");
    uint64_t v8 = objc_claimAutoreleasedReturnValue(v7);
    dailyAmount = v6->_dailyAmount;
    v6->_dailyAmount = (PKCurrencyAmount *)v8;

    uint64_t v11 = objc_opt_class(&OBJC_CLASS___NSSet, v10);
    v13 = +[NSSet setWithObjects:]( &OBJC_CLASS___NSSet,  "setWithObjects:",  v11,  objc_opt_class(&OBJC_CLASS___NSNumber, v12),  0LL);
    v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
    uint64_t v15 = objc_claimAutoreleasedReturnValue([v4 decodeObjectOfClasses:v14 forKey:@"dailyRewardTypes"]);
    dailyRewardTypes = v6->_dailyRewardTypes;
    v6->_dailyRewardTypes = (NSSet *)v15;

    v6->_includesMonthlyAggregate = [v4 decodeBoolForKey:@"includesMonthlyAggregate"];
  }

  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___PDPassPaymentDailyDailyCashWithAmountUserNotification;
  id v4 = a3;
  -[PDPassPaymentDailyDailyCashUserNotification encodeWithCoder:](&v5, "encodeWithCoder:", v4);
  objc_msgSend(v4, "encodeObject:forKey:", self->_dailyAmount, @"dailyAmount", v5.receiver, v5.super_class);
  [v4 encodeObject:self->_dailyRewardTypes forKey:@"dailyRewardTypes"];
  [v4 encodeBool:self->_includesMonthlyAggregate forKey:@"includesMonthlyAggregate"];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)notificationContentWithDataSource:(id)a3
{
  v11.receiver = self;
  v11.super_class = (Class)&OBJC_CLASS___PDPassPaymentDailyDailyCashWithAmountUserNotification;
  id v4 = -[PDPassPaymentDailyDailyCashUserNotification notificationContentWithDataSource:]( &v11,  "notificationContentWithDataSource:",  a3);
  objc_super v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  uint64_t v6 = PKLocalizedFeatureString(@"ACCOUNT_SERVICE_DAILY_DAILY_CASH_TITLE", 2LL);
  id v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  [v5 setTitle:v7];

  if (self->_includesMonthlyAggregate) {
    uint64_t v8 = objc_claimAutoreleasedReturnValue( -[PDPassPaymentDailyDailyCashWithAmountUserNotification _runningTotalInMonthMessage]( self,  "_runningTotalInMonthMessage"));
  }
  else {
    uint64_t v8 = objc_claimAutoreleasedReturnValue( -[PDPassPaymentDailyDailyCashWithAmountUserNotification _firstRedemptionInMonthMessage]( self,  "_firstRedemptionInMonthMessage"));
  }
  v9 = (void *)v8;
  [v5 setBody:v8];

  return v5;
}

- (unint64_t)notificationType
{
  return 42LL;
}

- (BOOL)hasValidContent
{
  if (self->_includesMonthlyAggregate) {
    v2 = (void *)objc_claimAutoreleasedReturnValue( -[PDPassPaymentDailyDailyCashWithAmountUserNotification _runningTotalInMonthMessage]( self,  "_runningTotalInMonthMessage"));
  }
  else {
    v2 = (void *)objc_claimAutoreleasedReturnValue( -[PDPassPaymentDailyDailyCashWithAmountUserNotification _firstRedemptionInMonthMessage]( self,  "_firstRedemptionInMonthMessage"));
  }
  v3 = v2;
  id v4 = [v2 length];

  return v4 != 0LL;
}

- (id)_runningTotalInMonthMessage
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[PDPassPaymentDailyDailyCashUserNotification monthlyAmount](self, "monthlyAmount"));
  id v4 = objc_alloc_init(&OBJC_CLASS___NSDateFormatter);
  -[NSDateFormatter setLocalizedDateFormatFromTemplate:](v4, "setLocalizedDateFormatFromTemplate:", @"MMMM");
  objc_super v5 = (void *)objc_claimAutoreleasedReturnValue(-[PDPassPaymentDailyDailyCashUserNotification monthlyRewardTypes](self, "monthlyRewardTypes"));
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue([v5 anyObject]);
  id v7 = [v6 unsignedIntegerValue];

  if (v7 == (id)3)
  {
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(-[PDPassPaymentDailyDailyCashWithAmountUserNotification dailyAmount](self, "dailyAmount"));
    v9 = (void *)objc_claimAutoreleasedReturnValue([v8 minimalFormattedStringValue]);
    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSCalendar currentCalendar](&OBJC_CLASS___NSCalendar, "currentCalendar"));
    objc_super v11 = (void *)objc_claimAutoreleasedReturnValue(-[PDPassPaymentDailyDailyCashUserNotification dateComponents](self, "dateComponents"));
    uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue([v10 dateFromComponents:v11]);
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[NSDateFormatter stringFromDate:](v4, "stringFromDate:", v12));
    v14 = (void *)objc_claimAutoreleasedReturnValue([v3 minimalFormattedStringValue]);
    uint64_t v15 = @"ACCOUNT_SERVICE_DAILY_DAILY_CASH_MESSAGE_SAVINGS_MONTH";
  }

  else
  {
    if (v7 != (id)1)
    {
      id v17 = 0LL;
      goto LABEL_7;
    }

    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(-[PDPassPaymentDailyDailyCashWithAmountUserNotification dailyAmount](self, "dailyAmount"));
    v9 = (void *)objc_claimAutoreleasedReturnValue([v8 minimalFormattedStringValue]);
    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSCalendar currentCalendar](&OBJC_CLASS___NSCalendar, "currentCalendar"));
    objc_super v11 = (void *)objc_claimAutoreleasedReturnValue(-[PDPassPaymentDailyDailyCashUserNotification dateComponents](self, "dateComponents"));
    uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue([v10 dateFromComponents:v11]);
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[NSDateFormatter stringFromDate:](v4, "stringFromDate:", v12));
    v14 = (void *)objc_claimAutoreleasedReturnValue([v3 minimalFormattedStringValue]);
    uint64_t v15 = @"ACCOUNT_SERVICE_DAILY_DAILY_CASH_MESSAGE_APPLE_CASH_MONTH";
  }

  uint64_t v16 = PKLocalizedFeatureString(v15, 2LL, @"%@%@%@");
  id v17 = (void *)objc_claimAutoreleasedReturnValue(v16);

LABEL_7:
  return v17;
}

- (id)_firstRedemptionInMonthMessage
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[PDPassPaymentDailyDailyCashWithAmountUserNotification dailyRewardTypes](self, "dailyRewardTypes"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 anyObject]);
  id v5 = [v4 unsignedIntegerValue];

  if (v5 == (id)3)
  {
    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(-[PDPassPaymentDailyDailyCashWithAmountUserNotification dailyAmount](self, "dailyAmount"));
    id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 minimalFormattedStringValue]);
    uint64_t v8 = @"ACCOUNT_SERVICE_DAILY_DAILY_CASH_TO_SAVINGS_MESSAGE";
  }

  else
  {
    if (v5 != (id)1)
    {
      uint64_t v10 = 0LL;
      return v10;
    }

    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(-[PDPassPaymentDailyDailyCashWithAmountUserNotification dailyAmount](self, "dailyAmount"));
    id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 minimalFormattedStringValue]);
    uint64_t v8 = @"ACCOUNT_SERVICE_DAILY_DAILY_CASH_TO_APPLE_CASH_MESSAGE";
  }

  uint64_t v9 = PKLocalizedFeatureString(v8, 2LL, @"%@");
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(v9);

  return v10;
}

- (PKCurrencyAmount)dailyAmount
{
  return self->_dailyAmount;
}

- (NSSet)dailyRewardTypes
{
  return self->_dailyRewardTypes;
}

- (BOOL)includesMonthlyAggregate
{
  return self->_includesMonthlyAggregate;
}

- (void).cxx_destruct
{
}

@end