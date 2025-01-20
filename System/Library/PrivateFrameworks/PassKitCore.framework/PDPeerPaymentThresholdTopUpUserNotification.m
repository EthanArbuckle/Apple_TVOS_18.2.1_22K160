@interface PDPeerPaymentThresholdTopUpUserNotification
+ (BOOL)supportsSecureCoding;
- (BOOL)isValid;
- (PDPeerPaymentThresholdTopUpUserNotification)initWithCoder:(id)a3;
- (PDPeerPaymentThresholdTopUpUserNotification)initWithPassUniqueIdentifier:(id)a3 transaction:(id)a4 updatedBalance:(id)a5;
- (PKCurrencyAmount)updatedBalance;
- (PKPaymentTransaction)transaction;
- (id)notificationContentWithDataSource:(id)a3;
- (unint64_t)notificationType;
- (void)encodeWithCoder:(id)a3;
@end

@implementation PDPeerPaymentThresholdTopUpUserNotification

- (PDPeerPaymentThresholdTopUpUserNotification)initWithPassUniqueIdentifier:(id)a3 transaction:(id)a4 updatedBalance:(id)a5
{
  id v9 = a4;
  id v10 = a5;
  id v11 = a3;
  v12 = (void *)objc_claimAutoreleasedReturnValue([v9 serviceIdentifier]);
  v13 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"PDPeerPaymentThresholdTopUpTransaction-%@",  v12));

  v20.receiver = self;
  v20.super_class = (Class)&OBJC_CLASS___PDPeerPaymentThresholdTopUpUserNotification;
  v14 = -[PDUserNotification initWithNotificationIdentifier:forPassUniqueIdentifier:]( &v20,  "initWithNotificationIdentifier:forPassUniqueIdentifier:",  v13,  v11);

  if (v14)
  {
    objc_storeStrong((id *)&v14->_transaction, a4);
    objc_storeStrong((id *)&v14->_updatedBalance, a5);
    -[PDUserNotification setCustomActionRoute:]( v14,  "setCustomActionRoute:",  PKUserNotificationActionRouteViewTransaction);
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[PKPaymentTransaction identifier](v14->_transaction, "identifier"));
    v16 = (void *)objc_claimAutoreleasedReturnValue( -[PKPaymentTransaction transactionSourceIdentifier]( v14->_transaction,  "transactionSourceIdentifier"));
    v17 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    if ([v15 length]) {
      -[NSMutableDictionary setObject:forKey:]( v17,  "setObject:forKey:",  v15,  PKUserNotificationActionQueryItemTransactionIdentifier);
    }
    if ([v16 length]) {
      -[NSMutableDictionary setObject:forKey:]( v17,  "setObject:forKey:",  v16,  PKUserNotificationActionQueryItemTransactionSourceIdentifier);
    }
    id v18 = -[NSMutableDictionary copy](v17, "copy");
    -[PDUserNotification setCustomActionQueryParameters:](v14, "setCustomActionQueryParameters:", v18);
  }

  return v14;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PDPeerPaymentThresholdTopUpUserNotification)initWithCoder:(id)a3
{
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)&OBJC_CLASS___PDPeerPaymentThresholdTopUpUserNotification;
  v6 = -[PDUserNotification initWithCoder:](&v15, "initWithCoder:", v4);
  if (v6)
  {
    id v7 = objc_msgSend( v4,  "decodeObjectOfClass:forKey:",  objc_opt_class(PKPaymentTransaction, v5),  @"paymentTransaction");
    uint64_t v8 = objc_claimAutoreleasedReturnValue(v7);
    transaction = v6->_transaction;
    v6->_transaction = (PKPaymentTransaction *)v8;

    id v11 = objc_msgSend( v4,  "decodeObjectOfClass:forKey:",  objc_opt_class(PKCurrencyAmount, v10),  @"updatedBalance");
    uint64_t v12 = objc_claimAutoreleasedReturnValue(v11);
    updatedBalance = v6->_updatedBalance;
    v6->_updatedBalance = (PKCurrencyAmount *)v12;
  }

  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___PDPeerPaymentThresholdTopUpUserNotification;
  id v4 = a3;
  -[PDUserNotification encodeWithCoder:](&v5, "encodeWithCoder:", v4);
  objc_msgSend(v4, "encodeObject:forKey:", self->_transaction, @"paymentTransaction", v5.receiver, v5.super_class);
  [v4 encodeObject:self->_updatedBalance forKey:@"updatedBalance"];
}

- (BOOL)isValid
{
  return 1;
}

- (unint64_t)notificationType
{
  return 71LL;
}

- (id)notificationContentWithDataSource:(id)a3
{
  v25.receiver = self;
  v25.super_class = (Class)&OBJC_CLASS___PDPeerPaymentThresholdTopUpUserNotification;
  id v4 = -[PDUserNotification notificationContentWithDataSource:](&v25, "notificationContentWithDataSource:", a3);
  objc_super v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  uint64_t v6 = PKLocalizedPeerPaymentRecurringString(@"NOTIFICATION_THRESHOLD_TOP_UP_TRANSACTION_TITLE");
  id v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  [v5 setTitle:v7];

  updatedBalance = self->_updatedBalance;
  id v9 = (void *)objc_claimAutoreleasedReturnValue(-[PKPaymentTransaction currencyAmount](self->_transaction, "currencyAmount"));
  uint64_t v10 = objc_claimAutoreleasedReturnValue([v9 minimalFormattedStringValue]);
  id v11 = (void *)v10;
  if (updatedBalance)
  {
    uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue( -[PKCurrencyAmount minimalFormattedStringValue]( self->_updatedBalance,  "minimalFormattedStringValue"));
    uint64_t v13 = PKLocalizedPeerPaymentRecurringString( @"NOTIFICATION_THRESHOLD_TOP_UP_TRANSACTION_MESSAGE_BALANCE",  @"%@%@",  v11,  v12);
    v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
    [v5 setBody:v14];
  }

  else
  {
    uint64_t v15 = PKLocalizedPeerPaymentRecurringString( @"NOTIFICATION_THRESHOLD_TOP_UP_TRANSACTION_MESSAGE_NO_BALANCE",  @"%@",  v10);
    uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(v15);
    [v5 setBody:v12];
  }

  v16 = (void *)objc_claimAutoreleasedReturnValue([v5 userInfo]);
  id v17 = [v16 mutableCopy];
  id v18 = v17;
  if (v17) {
    v19 = (NSMutableDictionary *)v17;
  }
  else {
    v19 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  }
  objc_super v20 = v19;

  v21 = (void *)objc_claimAutoreleasedReturnValue(-[PKPaymentTransaction identifier](self->_transaction, "identifier"));
  -[NSMutableDictionary setObject:forKeyedSubscript:]( v20,  "setObject:forKeyedSubscript:",  v21,  PKUserNotificationTransactionIdentifierContextKey);

  v22 = (void *)objc_claimAutoreleasedReturnValue(-[PDUserNotification passUniqueIdentifier](self, "passUniqueIdentifier"));
  -[NSMutableDictionary setObject:forKeyedSubscript:]( v20,  "setObject:forKeyedSubscript:",  v22,  PKUserNotificationPassUniqueIdentifierContextKey);

  v23 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithInteger:]( &OBJC_CLASS___NSNumber,  "numberWithInteger:",  -[PKPaymentTransaction accountType](self->_transaction, "accountType")));
  -[NSMutableDictionary setObject:forKeyedSubscript:]( v20,  "setObject:forKeyedSubscript:",  v23,  PKUserNotificationAccountType);

  [v5 setUserInfo:v20];
  return v5;
}

- (PKPaymentTransaction)transaction
{
  return self->_transaction;
}

- (PKCurrencyAmount)updatedBalance
{
  return self->_updatedBalance;
}

- (void).cxx_destruct
{
}

@end