@interface PDPassTransitTransactionUserNotification
+ (BOOL)supportsSecureCoding;
- (BOOL)_shouldSuppressNotificationForPass:(id)a3;
- (BOOL)enrouteFlag;
- (BOOL)isValid;
- (NSDecimalNumber)transitBalance;
- (NSString)transitBalanceCurrencyCode;
- (PDPassTransitTransactionUserNotification)initWithCoder:(id)a3;
- (PDPassTransitTransactionUserNotification)initWithPaymentTransaction:(id)a3 forPassUniqueIdentifier:(id)a4 paymentApplication:(id)a5;
- (PDPassTransitTransactionUserNotification)initWithPaymentTransaction:(id)a3 forPassUniqueIdentifier:(id)a4 paymentApplication:(id)a5 balance:(id)a6;
- (PDPassTransitTransactionUserNotification)initWithPaymentTransaction:(id)a3 forPassUniqueIdentifier:(id)a4 paymentApplication:(id)a5 familyMember:(id)a6 accountUser:(id)a7 installmentCriteria:(id)a8;
- (PDPassTransitTransactionUserNotification)initWithPaymentTransaction:(id)a3 forPassUniqueIdentifier:(id)a4 paymentApplication:(id)a5 familyMember:(id)a6 balance:(id)a7 accountUser:(id)a8 installmentCriteria:(id)a9;
- (id)_amountTitleStringForSubtype:(int64_t)a3 transitModifiers:(unint64_t)a4 amountString:(id)a5;
- (id)_messageStringWithPass:(id)a3;
- (id)_titleStringForPass:(id)a3;
- (id)_zeroValueTitleStringForTransitSubtype:(int64_t)a3;
- (id)notificationContentWithDataSource:(id)a3;
- (unint64_t)notificationType;
- (void)encodeWithCoder:(id)a3;
- (void)invalidateTransitBalance;
@end

@implementation PDPassTransitTransactionUserNotification

- (PDPassTransitTransactionUserNotification)initWithPaymentTransaction:(id)a3 forPassUniqueIdentifier:(id)a4 paymentApplication:(id)a5 balance:(id)a6
{
  return -[PDPassTransitTransactionUserNotification initWithPaymentTransaction:forPassUniqueIdentifier:paymentApplication:familyMember:balance:accountUser:installmentCriteria:]( self,  "initWithPaymentTransaction:forPassUniqueIdentifier:paymentApplication:familyMember:balance:accountUser:installmentCriteria:",  a3,  a4,  a5,  0LL,  a6,  0LL,  0LL);
}

- (PDPassTransitTransactionUserNotification)initWithPaymentTransaction:(id)a3 forPassUniqueIdentifier:(id)a4 paymentApplication:(id)a5
{
  return -[PDPassTransitTransactionUserNotification initWithPaymentTransaction:forPassUniqueIdentifier:paymentApplication:familyMember:accountUser:installmentCriteria:]( self,  "initWithPaymentTransaction:forPassUniqueIdentifier:paymentApplication:familyMember:accountUser:installmentCriteria:",  a3,  a4,  a5,  0LL,  0LL,  0LL);
}

- (PDPassTransitTransactionUserNotification)initWithPaymentTransaction:(id)a3 forPassUniqueIdentifier:(id)a4 paymentApplication:(id)a5 familyMember:(id)a6 accountUser:(id)a7 installmentCriteria:(id)a8
{
  return -[PDPassTransitTransactionUserNotification initWithPaymentTransaction:forPassUniqueIdentifier:paymentApplication:familyMember:balance:accountUser:installmentCriteria:]( self,  "initWithPaymentTransaction:forPassUniqueIdentifier:paymentApplication:familyMember:balance:accountUser:installmentCriteria:",  a3,  a4,  a5,  a6,  0LL,  a7,  a8);
}

- (PDPassTransitTransactionUserNotification)initWithPaymentTransaction:(id)a3 forPassUniqueIdentifier:(id)a4 paymentApplication:(id)a5 familyMember:(id)a6 balance:(id)a7 accountUser:(id)a8 installmentCriteria:(id)a9
{
  id v15 = a3;
  id v16 = a7;
  v23.receiver = self;
  v23.super_class = (Class)&OBJC_CLASS___PDPassTransitTransactionUserNotification;
  v17 = -[PDPassPaymentTransactionUserNotification initWithPaymentTransaction:forPassUniqueIdentifier:paymentApplication:familyMember:accountUser:installmentCriteria:]( &v23,  "initWithPaymentTransaction:forPassUniqueIdentifier:paymentApplication:familyMember:accountUser:installmentCriteria:",  v15,  a4,  a5,  a6,  a8,  a9);
  if (v17)
  {
    v17->_enrouteFlag = [v15 enRoute];
    if (v16)
    {
      uint64_t v18 = objc_claimAutoreleasedReturnValue([v16 value]);
      transitBalance = v17->_transitBalance;
      v17->_transitBalance = (NSDecimalNumber *)v18;

      uint64_t v20 = objc_claimAutoreleasedReturnValue([v16 currencyCode]);
      transitBalanceCurrencyCode = v17->_transitBalanceCurrencyCode;
      v17->_transitBalanceCurrencyCode = (NSString *)v20;
    }
  }

  return v17;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PDPassTransitTransactionUserNotification)initWithCoder:(id)a3
{
  id v4 = a3;
  v25.receiver = self;
  v25.super_class = (Class)&OBJC_CLASS___PDPassTransitTransactionUserNotification;
  v5 = -[PDPassPaymentTransactionUserNotification initWithCoder:](&v25, "initWithCoder:", v4);
  v6 = v5;
  if (v5)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[PDPassPaymentTransactionUserNotification paymentTransaction](v5, "paymentTransaction"));
    v6->_enrouteFlag = [v7 enRoute];

    uint64_t v9 = objc_opt_class(&OBJC_CLASS___NSDecimalNumber, v8);
    v11 = +[NSSet setWithObjects:]( &OBJC_CLASS___NSSet,  "setWithObjects:",  v9,  objc_opt_class(&OBJC_CLASS___NSNumber, v10),  0LL);
    v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
    uint64_t v13 = objc_claimAutoreleasedReturnValue([v4 decodeObjectOfClasses:v12 forKey:@"transitBalance"]);
    transitBalance = v6->_transitBalance;
    v6->_transitBalance = (NSDecimalNumber *)v13;

    id v15 = v6->_transitBalance;
    uint64_t v17 = objc_opt_class(&OBJC_CLASS___NSDecimalNumber, v16);
    if ((objc_opt_isKindOfClass(v15, v17) & 1) == 0)
    {
      uint64_t v19 = objc_claimAutoreleasedReturnValue( +[NSDecimalNumber decimalNumberWithMantissa:exponent:isNegative:]( &OBJC_CLASS___NSDecimalNumber,  "decimalNumberWithMantissa:exponent:isNegative:",  -[NSDecimalNumber unsignedLongLongValue](v6->_transitBalance, "unsignedLongLongValue"),  0LL,  0LL));
      uint64_t v20 = v6->_transitBalance;
      v6->_transitBalance = (NSDecimalNumber *)v19;
    }

    id v21 = objc_msgSend( v4,  "decodeObjectOfClass:forKey:",  objc_opt_class(NSString, v18),  @"transitCurrencyCode");
    uint64_t v22 = objc_claimAutoreleasedReturnValue(v21);
    transitBalanceCurrencyCode = v6->_transitBalanceCurrencyCode;
    v6->_transitBalanceCurrencyCode = (NSString *)v22;
  }

  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___PDPassTransitTransactionUserNotification;
  id v4 = a3;
  -[PDPassPaymentTransactionUserNotification encodeWithCoder:](&v5, "encodeWithCoder:", v4);
  objc_msgSend(v4, "encodeObject:forKey:", self->_transitBalance, @"transitBalance", v5.receiver, v5.super_class);
  [v4 encodeObject:self->_transitBalanceCurrencyCode forKey:@"transitCurrencyCode"];
}

- (unint64_t)notificationType
{
  return 5LL;
}

- (BOOL)isValid
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[PDPassPaymentTransactionUserNotification paymentTransaction](self, "paymentTransaction"));
  if ([v2 transactionType] == (id)2
    && [v2 hasAssociatedPaymentApplication]
    && ([v2 enRoute] & 1) == 0)
  {
    unsigned int v3 = [v2 hasPendingAmounts] ^ 1;
  }

  else
  {
    LOBYTE(v3) = 0;
  }

  return v3;
}

- (id)_zeroValueTitleStringForTransitSubtype:(int64_t)a3
{
  if (a3 <= 512)
  {
    switch(a3)
    {
      case 2LL:
        id v4 = @"TRANSIT_TRANSACTION_TITLE_METRO";
        goto LABEL_23;
      case 3LL:
        id v4 = @"TRANSIT_TRANSACTION_TITLE_BUS";
        goto LABEL_23;
      case 4LL:
        id v4 = @"TRANSIT_TRANSACTION_TITLE_TRAIN";
        goto LABEL_23;
      case 5LL:
      case 6LL:
        goto LABEL_18;
      case 7LL:
        id v4 = @"TRANSIT_TRANSACTION_TITLE_LIGHT_RAIL";
        goto LABEL_23;
      case 8LL:
        id v4 = @"TRANSIT_TRANSACTION_TITLE_CABLE_CAR";
        goto LABEL_23;
      default:
        switch(a3)
        {
          case 257LL:
            unsigned int v3 = @"SHINKANSEN_TRANSACTION_NOTIFICATION_TITLE";
            goto LABEL_25;
          case 258LL:
            id v4 = @"TRANSIT_TRANSACTION_TITLE_MAGLEV";
            goto LABEL_23;
          case 259LL:
            id v4 = @"TRANSIT_TRANSACTION_TITLE_TAXI";
            goto LABEL_23;
          case 260LL:
            id v4 = @"TRANSIT_TRANSACTION_TITLE_FERRY";
            goto LABEL_23;
          case 261LL:
            id v4 = @"TRANSIT_TRANSACTION_TITLE_BIKE";
            goto LABEL_23;
          default:
            goto LABEL_18;
        }
    }
  }

  switch(a3)
  {
    case 513LL:
    case 515LL:
      unsigned int v3 = @"TRANSIT_TRANSACTION_TITLE_PURCHASE";
      goto LABEL_25;
    case 514LL:
      unsigned int v3 = @"TRANSIT_TRANSACTION_TITLE_REFUND";
      goto LABEL_25;
    case 516LL:
      goto LABEL_18;
    case 517LL:
      unsigned int v3 = @"TRANSIT_TRANSACTION_TITLE_CARD_READ";
      goto LABEL_25;
    default:
      if (a3 == 1025)
      {
        unsigned int v3 = @"GREEN_CAR_TRANSACTION_NOTIFICATION_TITLE";
        goto LABEL_25;
      }

      if (a3 != 1026)
      {
LABEL_18:
        unsigned int v3 = @"TRANSIT_TRANSACTION_TITLE_TRANSIT";
LABEL_25:
        uint64_t v7 = PKLocalizedPaymentString(&v3->isa);
        v6 = (void *)objc_claimAutoreleasedReturnValue(v7);
        return v6;
      }

      id v4 = @"TRANSIT_TRANSACTION_TITLE_METRO_UPGRADE";
LABEL_23:
      uint64_t v5 = PKLocalizedTransitString(&v4->isa);
      v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
      return v6;
  }

- (id)_amountTitleStringForSubtype:(int64_t)a3 transitModifiers:(unint64_t)a4 amountString:(id)a5
{
  char v5 = a4;
  id v7 = a5;
  uint64_t v8 = 0LL;
  if (a3 <= 512)
  {
    switch(a3)
    {
      case 0LL:
      case 1LL:
      case 5LL:
      case 6LL:
LABEL_5:
        if ((v5 & 8) != 0)
        {
          uint64_t v9 = @"TRANSIT_TRANSACTION_FARE_ADJUSTMENT_NOTIFICATION_TITLE_FORMAT";
        }

        else if ((v5 & 0x10) != 0)
        {
          uint64_t v9 = @"TRANSIT_TRANSACTION_FARE_REBATE_NOTIFICATION_TITLE_FORMAT";
        }

        else
        {
          uint64_t v9 = @"TRANSIT_TRANSACTION_NOTIFICATION_TITLE_FORMAT";
        }

- (id)_titleStringForPass:(id)a3
{
  id v4 = a3;
  char v5 = (void *)objc_claimAutoreleasedReturnValue(-[PDPassPaymentTransactionUserNotification paymentTransaction](self, "paymentTransaction"));
  id v6 = [v5 transitType];
  id v7 = [v5 transitModifiers];
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v5 amount]);
  unsigned int v9 = [v5 isZeroTransaction];
  if ((v9 & 1) != 0)
  {
    uint64_t v10 = 0LL;
  }

  else
  {
    if (v8)
    {
      uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([v5 formattedBalanceAdjustmentSubtotalAmount]);
      uint64_t v12 = v11;
      if (v11)
      {
        id v13 = v11;
        uint64_t v12 = v13;
      }

      else
      {
        id v13 = (id)objc_claimAutoreleasedReturnValue([v5 formattedBalanceAdjustmentAmount]);
      }
    }

    else
    {
      uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue([v4 paymentPass]);
      id v13 = (id)objc_claimAutoreleasedReturnValue([v5 formattedStringForMultipleAmountsForPass:v12]);
    }

    uint64_t v10 = v13;
  }

  if (self->_enrouteFlag)
  {
    id v14 = 0LL;
    uint64_t v15 = 0LL;
  }

  else
  {
    else {
      unsigned int v16 = v9;
    }
    if (v16 == 1)
    {
      uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue( -[PDPassTransitTransactionUserNotification _zeroValueTitleStringForTransitSubtype:]( self,  "_zeroValueTitleStringForTransitSubtype:",  v6));
      id v14 = 0LL;
    }

    else
    {
      id v14 = v10;
      uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue( -[PDPassTransitTransactionUserNotification _amountTitleStringForSubtype:transitModifiers:amountString:]( self,  "_amountTitleStringForSubtype:transitModifiers:amountString:",  v6,  v7,  v14));
    }
  }

  id v17 = v15;

  return v17;
}

- (BOOL)_shouldSuppressNotificationForPass:(id)a3
{
  id v4 = (void *)objc_claimAutoreleasedReturnValue([a3 paymentPass]);
  char v5 = (void *)objc_claimAutoreleasedReturnValue([v4 devicePrimaryPaymentApplication]);
  id v6 = [v5 paymentNetworkIdentifier];

  if (v6 == (id)131)
  {
    id v7 = (void *)objc_claimAutoreleasedReturnValue(-[PDPassPaymentTransactionUserNotification paymentTransaction](self, "paymentTransaction"));
    else {
      BOOL v8 = 0;
    }
  }

  else
  {
    BOOL v8 = 0;
  }

  return v8;
}

- (id)_messageStringWithPass:(id)a3
{
  id v4 = a3;
  if ([v4 passType] == (id)1) {
    char v5 = v4;
  }
  else {
    char v5 = 0LL;
  }
  id v6 = v5;
  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[PDPassPaymentTransactionUserNotification paymentTransaction](self, "paymentTransaction"));
  if (!self->_transitBalance && !self->_transitBalanceCurrencyCode)
  {
    BOOL v8 = (void *)objc_claimAutoreleasedReturnValue( +[PKTransitPassProperties passPropertiesForPass:]( &OBJC_CLASS___PKTransitPassProperties,  "passPropertiesForPass:",  v4));
    if ([v6 isEMoneyPass])
    {
      unsigned int v9 = (void *)objc_claimAutoreleasedReturnValue([v8 balances]);
      uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([v9 firstObject]);

      if (![v10 isCurrencyBalance])
      {
LABEL_13:

        goto LABEL_14;
      }

      uint64_t v11 = (NSDecimalNumber *)objc_claimAutoreleasedReturnValue([v10 amount]);
      transitBalance = self->_transitBalance;
      self->_transitBalance = v11;

      id v13 = (NSString *)objc_claimAutoreleasedReturnValue([v10 currencyCode]);
    }

    else
    {
      id v14 = (void *)objc_claimAutoreleasedReturnValue([v8 balanceAmount]);
      uint64_t v10 = v14;
      if (!v14)
      {
        v49 = (void *)objc_claimAutoreleasedReturnValue([v8 balances]);
        id v17 = (NSString *)objc_claimAutoreleasedReturnValue([v49 firstObject]);

        if (-[NSString isCurrencyBalance](v17, "isCurrencyBalance"))
        {
          v50 = (NSDecimalNumber *)objc_claimAutoreleasedReturnValue(-[NSString amount](v17, "amount"));
          v51 = self->_transitBalance;
          self->_transitBalance = v50;

          v52 = (NSString *)objc_claimAutoreleasedReturnValue(-[NSString currencyCode](v17, "currencyCode"));
          transitBalanceCurrencyCode = self->_transitBalanceCurrencyCode;
          self->_transitBalanceCurrencyCode = v52;
        }

        goto LABEL_12;
      }

      uint64_t v15 = (NSDecimalNumber *)objc_claimAutoreleasedReturnValue([v14 amount]);
      unsigned int v16 = self->_transitBalance;
      self->_transitBalance = v15;

      id v13 = (NSString *)objc_claimAutoreleasedReturnValue([v10 currency]);
    }

    id v17 = self->_transitBalanceCurrencyCode;
    self->_transitBalanceCurrencyCode = v13;
LABEL_12:

    goto LABEL_13;
  }

- (void)invalidateTransitBalance
{
  transitBalance = self->_transitBalance;
  self->_transitBalance = 0LL;

  transitBalanceCurrencyCode = self->_transitBalanceCurrencyCode;
  self->_transitBalanceCurrencyCode = 0LL;
}

- (id)notificationContentWithDataSource:(id)a3
{
  v17.receiver = self;
  v17.super_class = (Class)&OBJC_CLASS___PDPassTransitTransactionUserNotification;
  id v4 = a3;
  id v5 = -[PDPassPaymentTransactionUserNotification notificationContentWithDataSource:]( &v17,  "notificationContentWithDataSource:",  v4);
  id v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[PDUserNotification passUniqueIdentifier](self, "passUniqueIdentifier", v17.receiver, v17.super_class));
  BOOL v8 = (void *)objc_claimAutoreleasedReturnValue([v4 passWithUniqueIdentifier:v7]);

  if (-[PDPassTransitTransactionUserNotification _shouldSuppressNotificationForPass:]( self,  "_shouldSuppressNotificationForPass:",  v8))
  {
    id v9 = 0LL;
  }

  else
  {
    if (self->_enrouteFlag)
    {
      uint64_t v10 = PKLocalizedTransitString(@"TRANSIT_ENROUTE_TRANSACTION_NOTIFICATION_TITLE");
      uint64_t v11 = objc_claimAutoreleasedReturnValue(v10);
    }

    else
    {
      uint64_t v11 = objc_claimAutoreleasedReturnValue(-[PDPassTransitTransactionUserNotification _titleStringForPass:](self, "_titleStringForPass:", v8));
    }

    uint64_t v12 = (void *)v11;
    [v6 setSubtitle:v11];

    id v13 = (void *)objc_claimAutoreleasedReturnValue([v6 body]);
    id v14 = [v13 length];

    if (!v14)
    {
      uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue( -[PDPassTransitTransactionUserNotification _messageStringWithPass:]( self,  "_messageStringWithPass:",  v8));
      [v6 setBody:v15];
    }

    id v9 = v6;
  }

  return v9;
}

- (NSDecimalNumber)transitBalance
{
  return self->_transitBalance;
}

- (NSString)transitBalanceCurrencyCode
{
  return self->_transitBalanceCurrencyCode;
}

- (BOOL)enrouteFlag
{
  return self->_enrouteFlag;
}

- (void).cxx_destruct
{
}

@end