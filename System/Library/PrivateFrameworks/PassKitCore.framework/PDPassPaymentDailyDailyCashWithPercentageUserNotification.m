@interface PDPassPaymentDailyDailyCashWithPercentageUserNotification
+ (BOOL)supportsSecureCoding;
- (NSArray)merchantNames;
- (NSDecimalNumber)percentage;
- (PDPassPaymentDailyDailyCashWithPercentageUserNotification)initWithCoder:(id)a3;
- (PDPassPaymentDailyDailyCashWithPercentageUserNotification)initWithPercentage:(id)a3 merchantNames:(id)a4 monthlyAmount:(id)a5 date:(id)a6 forPassUniqueIdentifier:(id)a7;
- (id)notificationContentWithDataSource:(id)a3;
- (unint64_t)notificationType;
- (void)encodeWithCoder:(id)a3;
@end

@implementation PDPassPaymentDailyDailyCashWithPercentageUserNotification

- (PDPassPaymentDailyDailyCashWithPercentageUserNotification)initWithPercentage:(id)a3 merchantNames:(id)a4 monthlyAmount:(id)a5 date:(id)a6 forPassUniqueIdentifier:(id)a7
{
  id v13 = a3;
  id v14 = a4;
  v15 = v14;
  if (v13 && v14)
  {
    v19.receiver = self;
    v19.super_class = (Class)&OBJC_CLASS___PDPassPaymentDailyDailyCashWithPercentageUserNotification;
    v16 = -[PDPassPaymentDailyDailyCashUserNotification initWithMonthlyAmount:date:forPassUniqueIdentifier:lastRedemptionType:monthlyRewardTypes:]( &v19,  "initWithMonthlyAmount:date:forPassUniqueIdentifier:lastRedemptionType:monthlyRewardTypes:",  a5,  a6,  a7,  0LL,  0LL);
    v17 = v16;
    if (v16)
    {
      objc_storeStrong((id *)&v16->_percentage, a3);
      objc_storeStrong((id *)&v17->_merchantNames, a4);
    }
  }

  else
  {

    v17 = 0LL;
  }

  return v17;
}

- (PDPassPaymentDailyDailyCashWithPercentageUserNotification)initWithCoder:(id)a3
{
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)&OBJC_CLASS___PDPassPaymentDailyDailyCashWithPercentageUserNotification;
  v6 = -[PDPassPaymentDailyDailyCashUserNotification initWithCoder:](&v15, "initWithCoder:", v4);
  if (v6)
  {
    id v7 = objc_msgSend( v4,  "decodeObjectOfClass:forKey:",  objc_opt_class(NSDecimalNumber, v5),  @"percentage");
    uint64_t v8 = objc_claimAutoreleasedReturnValue(v7);
    percentage = v6->_percentage;
    v6->_percentage = (NSDecimalNumber *)v8;

    id v11 = objc_msgSend( v4,  "decodeArrayOfObjectsOfClass:forKey:",  objc_opt_class(NSString, v10),  @"merchantNames");
    uint64_t v12 = objc_claimAutoreleasedReturnValue(v11);
    merchantNames = v6->_merchantNames;
    v6->_merchantNames = (NSArray *)v12;
  }

  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___PDPassPaymentDailyDailyCashWithPercentageUserNotification;
  id v4 = a3;
  -[PDPassPaymentDailyDailyCashUserNotification encodeWithCoder:](&v5, "encodeWithCoder:", v4);
  objc_msgSend(v4, "encodeObject:forKey:", self->_percentage, @"percentage", v5.receiver, v5.super_class);
  [v4 encodeObject:self->_merchantNames forKey:@"merchantNames"];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)notificationContentWithDataSource:(id)a3
{
  v28.receiver = self;
  v28.super_class = (Class)&OBJC_CLASS___PDPassPaymentDailyDailyCashWithPercentageUserNotification;
  id v4 = -[PDPassPaymentDailyDailyCashUserNotification notificationContentWithDataSource:]( &v28,  "notificationContentWithDataSource:",  a3);
  objc_super v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  uint64_t v6 = PKLocalizedFeatureString(@"ACCOUNT_SERVICE_DAILY_DAILY_CASH_TITLE", 2LL);
  id v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  [v5 setTitle:v7];

  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(-[PDPassPaymentDailyDailyCashUserNotification monthlyAmount](self, "monthlyAmount"));
  if (v8)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSDecimalNumber zero](&OBJC_CLASS___NSDecimalNumber, "zero"));
    unsigned __int8 v10 = [v8 isEqual:v9];

    if ((v10 & 1) == 0)
    {
      id v11 = objc_alloc_init(&OBJC_CLASS___NSDateFormatter);
      -[NSDateFormatter setLocalizedDateFormatFromTemplate:](v11, "setLocalizedDateFormatFromTemplate:", @"MMMM");
      NSUInteger v12 = -[NSArray count](self->_merchantNames, "count");
      uint64_t v13 = PKFormattedStringMinimalFractionDigitsFromNumber(self->_percentage, 0LL);
      v25 = (void *)objc_claimAutoreleasedReturnValue(v13);
      uint64_t v14 = PKLocalizedFeatureString(@"TRANSACTION_REWARDS_PERCENT_FORMAT", 2LL, @"%@%%");
      objc_super v15 = (void *)objc_claimAutoreleasedReturnValue(v14);

      v16 = &stru_100662310;
      switch(v12)
      {
        case 0uLL:
          goto LABEL_10;
        case 1uLL:
          v16 = (__CFString *)objc_claimAutoreleasedReturnValue(-[NSArray firstObject](self->_merchantNames, "firstObject", v25));
          v17 = @"ACCOUNT_SERVICE_DAILY_DAILY_CASH_MESSAGE_PROMO_SINGLE";
          goto LABEL_9;
        case 2uLL:
          v18 = (void *)objc_claimAutoreleasedReturnValue(-[NSArray firstObject](self->_merchantNames, "firstObject", v25));
          objc_super v19 = (void *)objc_claimAutoreleasedReturnValue(-[NSArray objectAtIndex:](self->_merchantNames, "objectAtIndex:", 1LL));
          uint64_t v20 = PKLocalizedFeatureString( @"ACCOUNT_SERVICE_DAILY_DAILY_CASH_MESSAGE_PROMO_TWO_MERCHANTS",  2LL,  @"%@%@");
          v16 = (__CFString *)objc_claimAutoreleasedReturnValue(v20);
          goto LABEL_7;
        case 3uLL:
          v18 = (void *)objc_claimAutoreleasedReturnValue(-[NSArray firstObject](self->_merchantNames, "firstObject", v25));
          objc_super v19 = (void *)objc_claimAutoreleasedReturnValue(-[NSArray objectAtIndex:](self->_merchantNames, "objectAtIndex:", 1LL));
          v27 = (void *)objc_claimAutoreleasedReturnValue(-[NSArray objectAtIndex:](self->_merchantNames, "objectAtIndex:", 2LL));
          uint64_t v21 = PKLocalizedFeatureString( @"ACCOUNT_SERVICE_DAILY_DAILY_CASH_MESSAGE_PROMO_THREE_MERCHANTS",  2LL,  @"%@%@%@");
          v16 = (__CFString *)objc_claimAutoreleasedReturnValue(v21);

LABEL_7:
          break;
        default:
          break;
      }

      v17 = @"ACCOUNT_SERVICE_DAILY_DAILY_CASH_MESSAGE_PROMO_MULTI";
LABEL_9:
      v25 = v15;
      v26 = v16;
      uint64_t v22 = PKLocalizedFeatureString(v17, 2LL, @"%@%@");
      uint64_t v23 = objc_claimAutoreleasedReturnValue(v22);

      v16 = (__CFString *)v23;
LABEL_10:
      objc_msgSend(v5, "setBody:", v16, v25, v26, v27);
    }
  }

  return v5;
}

- (unint64_t)notificationType
{
  return 43LL;
}

- (NSDecimalNumber)percentage
{
  return self->_percentage;
}

- (NSArray)merchantNames
{
  return self->_merchantNames;
}

- (void).cxx_destruct
{
}

@end