@interface PDPassPaymentPromotionRewardEarnedUserNotification
+ (BOOL)supportsSecureCoding;
- (BOOL)isValid;
- (NSArray)promotionalRewardItems;
- (PDPassPaymentPromotionRewardEarnedUserNotification)initWithCoder:(id)a3;
- (PDPassPaymentPromotionRewardEarnedUserNotification)initWithPaymentTransaction:(id)a3 forPassUniqueIdentifier:(id)a4 paymentApplication:(id)a5 promotionalRewardItems:(id)a6;
- (PKPaymentTransaction)paymentTransaction;
- (id)_amountsString;
- (id)_locationString;
- (id)_percentRewardsAmountString;
- (id)_promotionalAmountString;
- (id)currencyCode;
- (id)notificationContentWithDataSource:(id)a3;
- (unint64_t)notificationType;
- (void)_populateNotificationContent:(id)a3 withDataSource:(id)a4;
- (void)encodeWithCoder:(id)a3;
@end

@implementation PDPassPaymentPromotionRewardEarnedUserNotification

- (PDPassPaymentPromotionRewardEarnedUserNotification)initWithPaymentTransaction:(id)a3 forPassUniqueIdentifier:(id)a4 paymentApplication:(id)a5 promotionalRewardItems:(id)a6
{
  id v10 = a3;
  id v11 = a6;
  if (v10)
  {
    id v12 = a4;
    v13 = (void *)objc_claimAutoreleasedReturnValue([v10 identifier]);
    v14 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"promotionreward-%@",  v13));

    v23.receiver = self;
    v23.super_class = (Class)&OBJC_CLASS___PDPassPaymentPromotionRewardEarnedUserNotification;
    v15 = -[PDUserNotification initWithNotificationIdentifier:forPassUniqueIdentifier:]( &v23,  "initWithNotificationIdentifier:forPassUniqueIdentifier:",  v14,  v12);

    if (v15)
    {
      v15->_isValid = 1;
      objc_storeStrong((id *)&v15->_paymentTransaction, a3);
      objc_storeStrong((id *)&v15->_promotionalRewardItems, a6);
      v16 = (void *)objc_claimAutoreleasedReturnValue(-[PKPaymentTransaction transactionDate](v15->_paymentTransaction, "transactionDate"));
      -[PDUserNotification setDate:](v15, "setDate:", v16);

      -[PDUserNotification setCustomActionRoute:]( v15,  "setCustomActionRoute:",  PKUserNotificationActionRouteViewTransaction);
      v17 = (void *)objc_claimAutoreleasedReturnValue(-[PKPaymentTransaction identifier](v15->_paymentTransaction, "identifier"));
      v18 = (void *)objc_claimAutoreleasedReturnValue( -[PKPaymentTransaction transactionSourceIdentifier]( v15->_paymentTransaction,  "transactionSourceIdentifier"));
      v19 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
      if ([v17 length]) {
        -[NSMutableDictionary setObject:forKey:]( v19,  "setObject:forKey:",  v17,  PKUserNotificationActionQueryItemTransactionIdentifier);
      }
      if ([v18 length]) {
        -[NSMutableDictionary setObject:forKey:]( v19,  "setObject:forKey:",  v18,  PKUserNotificationActionQueryItemTransactionSourceIdentifier);
      }
      id v20 = -[NSMutableDictionary copy](v19, "copy");
      -[PDUserNotification setCustomActionQueryParameters:](v15, "setCustomActionQueryParameters:", v20);
    }

    self = v15;

    v21 = self;
  }

  else
  {
    v21 = 0LL;
  }

  return v21;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PDPassPaymentPromotionRewardEarnedUserNotification)initWithCoder:(id)a3
{
  id v4 = a3;
  v21.receiver = self;
  v21.super_class = (Class)&OBJC_CLASS___PDPassPaymentPromotionRewardEarnedUserNotification;
  v5 = -[PDUserNotification initWithCoder:](&v21, "initWithCoder:", v4);
  v7 = v5;
  if (v5)
  {
    v5->_isValid = 1;
    id v8 = objc_msgSend( v4,  "decodeObjectOfClass:forKey:",  objc_opt_class(PKPaymentTransaction, v6),  @"paymentTransaction");
    uint64_t v9 = objc_claimAutoreleasedReturnValue(v8);
    paymentTransaction = v7->_paymentTransaction;
    v7->_paymentTransaction = (PKPaymentTransaction *)v9;

    uint64_t v12 = objc_opt_class(&OBJC_CLASS___NSSet, v11);
    uint64_t v14 = objc_opt_class(&OBJC_CLASS___NSArray, v13);
    v16 = +[NSSet setWithObjects:]( &OBJC_CLASS___NSSet,  "setWithObjects:",  v12,  v14,  objc_opt_class(&OBJC_CLASS___PKPaymentTransactionRewardsItem, v15),  0LL);
    v17 = (void *)objc_claimAutoreleasedReturnValue(v16);
    uint64_t v18 = objc_claimAutoreleasedReturnValue([v4 decodeObjectOfClasses:v17 forKey:@"promotionalRewards"]);
    promotionalRewardItems = v7->_promotionalRewardItems;
    v7->_promotionalRewardItems = (NSArray *)v18;
  }

  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___PDPassPaymentPromotionRewardEarnedUserNotification;
  id v4 = a3;
  -[PDUserNotification encodeWithCoder:](&v5, "encodeWithCoder:", v4);
  objc_msgSend( v4,  "encodeObject:forKey:",  self->_paymentTransaction,  @"paymentTransaction",  v5.receiver,  v5.super_class);
  [v4 encodeObject:self->_promotionalRewardItems forKey:@"promotionalRewards"];
}

- (unint64_t)notificationType
{
  return 57LL;
}

- (BOOL)isValid
{
  return self->_isValid;
}

- (id)notificationContentWithDataSource:(id)a3
{
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___PDPassPaymentPromotionRewardEarnedUserNotification;
  id v4 = a3;
  id v5 = -[PDUserNotification notificationContentWithDataSource:](&v8, "notificationContentWithDataSource:", v4);
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  -[PDPassPaymentPromotionRewardEarnedUserNotification _populateNotificationContent:withDataSource:]( self,  "_populateNotificationContent:withDataSource:",  v6,  v4,  v8.receiver,  v8.super_class);

  return v6;
}

- (void)_populateNotificationContent:(id)a3 withDataSource:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_super v8 = (void *)objc_claimAutoreleasedReturnValue(-[PDUserNotification passUniqueIdentifier](self, "passUniqueIdentifier"));
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([v7 passWithUniqueIdentifier:v8]);

  id v10 = (void *)objc_claimAutoreleasedReturnValue([v9 paymentPass]);
  if ([v10 isAppleCardPass])
  {
    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(-[PDPassPaymentPromotionRewardEarnedUserNotification paymentTransaction](self, "paymentTransaction"));
    id v12 = [v11 transactionType];

    if (v12)
    {
      self->_isValid = 0;
      uint64_t Object = PKLogFacilityTypeGetObject(14LL);
      uint64_t v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        int v22 = 134217984;
        id v23 = v12;
        _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_DEFAULT,  "Unexpected transaction type in promotion reward notification: %ld",  (uint8_t *)&v22,  0xCu);
      }

      uint64_t v15 = 0LL;
      v16 = 0LL;
    }

    else
    {
      uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue(-[PDPassPaymentPromotionRewardEarnedUserNotification _locationString](self, "_locationString"));
      uint64_t v19 = objc_claimAutoreleasedReturnValue(-[PDPassPaymentPromotionRewardEarnedUserNotification _amountsString](self, "_amountsString"));
      v16 = (void *)v19;
      if (v15 && v19)
      {
        [v6 setSubtitle:v15];
        [v6 setBody:v16];
LABEL_13:
        id v20 = (void *)objc_claimAutoreleasedReturnValue( -[PDPassPaymentPromotionRewardEarnedUserNotification paymentTransaction]( self,  "paymentTransaction"));
        objc_super v21 = (void *)objc_claimAutoreleasedReturnValue([v20 transactionDate]);
        [v6 setDate:v21];

        goto LABEL_14;
      }
    }

    self->_isValid = 0;
    goto LABEL_13;
  }

  uint64_t v17 = PKLogFacilityTypeGetObject(14LL);
  uint64_t v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(v17);
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v22) = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v18,  OS_LOG_TYPE_DEFAULT,  "Unexpected promotion reward notification for payment pass other than Apple Card",  (uint8_t *)&v22,  2u);
  }

  self->_isValid = 0;
LABEL_14:
}

- (id)_locationString
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[PDPassPaymentPromotionRewardEarnedUserNotification paymentTransaction](self, "paymentTransaction"));
  v3 = (void *)objc_claimAutoreleasedReturnValue([v2 merchant]);
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 displayName]);

  if (v4)
  {
    uint64_t v5 = PKLocalizedFeatureString(@"ACCOUNT_SERVICE_PROMOTION_REWARD_EARNED_TITLE", 2LL, @"%@");
    id v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  }

  else
  {
    id v6 = 0LL;
  }

  return v6;
}

- (id)_amountsString
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[PDPassPaymentPromotionRewardEarnedUserNotification paymentTransaction](self, "paymentTransaction"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 merchant]);
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([v4 displayName]);

  id v6 = (void *)objc_claimAutoreleasedReturnValue( -[PDPassPaymentPromotionRewardEarnedUserNotification _promotionalAmountString]( self,  "_promotionalAmountString"));
  uint64_t v7 = objc_claimAutoreleasedReturnValue( -[PDPassPaymentPromotionRewardEarnedUserNotification _percentRewardsAmountString]( self,  "_percentRewardsAmountString"));
  objc_super v8 = (void *)v7;
  uint64_t v9 = 0LL;
  if (v5 && v6 && v7)
  {
    uint64_t v10 = PKLocalizedFeatureString(@"ACCOUNT_SERVICE_PROMOTION_REWARD_EARNED_MESSAGE", 2LL, @"%@%@%@");
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(v10);
  }

  return v9;
}

- (id)_promotionalAmountString
{
  promotionalRewardItems = self->_promotionalRewardItems;
  if (promotionalRewardItems && -[NSArray count](promotionalRewardItems, "count"))
  {
    id v4 = [[PKPaymentTransactionRewards alloc] initWithRewardsItems:self->_promotionalRewardItems];
    uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([v4 totalAmountForUnit:2]);
    id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 amount]);
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSDecimalNumber zero](&OBJC_CLASS___NSDecimalNumber, "zero"));
    unsigned __int8 v8 = [v6 isEqualToNumber:v7];

    uint64_t v9 = 0LL;
    if ((v8 & 1) == 0 && v5) {
      uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([v5 minimalFormattedStringValue]);
    }
  }

  else
  {
    uint64_t v9 = 0LL;
  }

  return v9;
}

- (id)_percentRewardsAmountString
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[PKPaymentTransaction rewards](self->_paymentTransaction, "rewards"));
  v3 = v2;
  if (v2)
  {
    id v4 = (void *)objc_claimAutoreleasedReturnValue([v2 totalAmountForUnit:1]);
    uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([v4 amount]);
    id v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSDecimalNumber zero](&OBJC_CLASS___NSDecimalNumber, "zero"));
    unsigned __int8 v7 = [v5 isEqualToNumber:v6];

    unsigned __int8 v8 = 0LL;
    if ((v7 & 1) == 0 && v4) {
      unsigned __int8 v8 = (void *)objc_claimAutoreleasedReturnValue([v4 minimalFormattedStringValue]);
    }
  }

  else
  {
    unsigned __int8 v8 = 0LL;
  }

  return v8;
}

- (id)currencyCode
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[PDPassPaymentPromotionRewardEarnedUserNotification paymentTransaction](self, "paymentTransaction"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 currencyCode]);

  if (!v4)
  {
    uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[PDPassPaymentPromotionRewardEarnedUserNotification paymentTransaction](self, "paymentTransaction"));
    id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 amounts]);
    unsigned __int8 v7 = (void *)objc_claimAutoreleasedReturnValue([v6 firstObject]);
    unsigned __int8 v8 = (void *)objc_claimAutoreleasedReturnValue([v7 amount]);
    id v4 = (void *)objc_claimAutoreleasedReturnValue([v8 currency]);
  }

  return v4;
}

- (PKPaymentTransaction)paymentTransaction
{
  return self->_paymentTransaction;
}

- (NSArray)promotionalRewardItems
{
  return self->_promotionalRewardItems;
}

- (void).cxx_destruct
{
}

@end