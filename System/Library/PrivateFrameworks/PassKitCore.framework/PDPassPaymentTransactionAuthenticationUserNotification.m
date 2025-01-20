@interface PDPassPaymentTransactionAuthenticationUserNotification
+ (BOOL)supportsSecureCoding;
+ (id)notificationIdentifierForTransactionIdentifier:(id)a3;
- (BOOL)isValid;
- (PDPassPaymentTransactionAuthenticationUserNotification)initWithCoder:(id)a3;
- (PDPassPaymentTransactionAuthenticationUserNotification)initWithPaymentTransaction:(id)a3 forPassUniqueIdentifier:(id)a4;
- (PKPaymentTransaction)paymentTransaction;
- (id)notificationContentWithDataSource:(id)a3;
- (unint64_t)notificationType;
- (void)encodeWithCoder:(id)a3;
@end

@implementation PDPassPaymentTransactionAuthenticationUserNotification

+ (id)notificationIdentifierForTransactionIdentifier:(id)a3
{
  return +[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"authenticate-%@", a3);
}

- (PDPassPaymentTransactionAuthenticationUserNotification)initWithPaymentTransaction:(id)a3 forPassUniqueIdentifier:(id)a4
{
  id v7 = a3;
  id v9 = a4;
  if (v7)
  {
    v10 = (void *)objc_opt_class(self, v8);
    v11 = (void *)objc_claimAutoreleasedReturnValue([v7 identifier]);
    v12 = (void *)objc_claimAutoreleasedReturnValue([v10 notificationIdentifierForTransactionIdentifier:v11]);
    v19.receiver = self;
    v19.super_class = (Class)&OBJC_CLASS___PDPassPaymentTransactionAuthenticationUserNotification;
    v13 = -[PDUserNotification initWithNotificationIdentifier:forPassUniqueIdentifier:]( &v19,  "initWithNotificationIdentifier:forPassUniqueIdentifier:",  v12,  v9);

    if (v13)
    {
      objc_storeStrong((id *)&v13->_paymentTransaction, a3);
      -[PDUserNotification setCustomActionRoute:]( v13,  "setCustomActionRoute:",  PKUserNotificationActionRouteViewTransaction);
      v14 = (void *)objc_claimAutoreleasedReturnValue(-[PKPaymentTransaction identifier](v13->_paymentTransaction, "identifier"));
      v15 = (void *)objc_claimAutoreleasedReturnValue( -[PKPaymentTransaction transactionSourceIdentifier]( v13->_paymentTransaction,  "transactionSourceIdentifier"));
      v16 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
      if ([v14 length]) {
        -[NSMutableDictionary setObject:forKey:]( v16,  "setObject:forKey:",  v14,  PKUserNotificationActionQueryItemTransactionIdentifier);
      }
      if ([v15 length]) {
        -[NSMutableDictionary setObject:forKey:]( v16,  "setObject:forKey:",  v15,  PKUserNotificationActionQueryItemTransactionSourceIdentifier);
      }
      id v17 = -[NSMutableDictionary copy](v16, "copy");
      -[PDUserNotification setCustomActionQueryParameters:](v13, "setCustomActionQueryParameters:", v17);
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

- (PDPassPaymentTransactionAuthenticationUserNotification)initWithCoder:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)&OBJC_CLASS___PDPassPaymentTransactionAuthenticationUserNotification;
  v6 = -[PDUserNotification initWithCoder:](&v11, "initWithCoder:", v4);
  if (v6)
  {
    id v7 = objc_msgSend( v4,  "decodeObjectOfClass:forKey:",  objc_opt_class(PKPaymentTransaction, v5),  @"paymentTransaction");
    uint64_t v8 = objc_claimAutoreleasedReturnValue(v7);
    paymentTransaction = v6->_paymentTransaction;
    v6->_paymentTransaction = (PKPaymentTransaction *)v8;
  }

  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___PDPassPaymentTransactionAuthenticationUserNotification;
  id v4 = a3;
  -[PDUserNotification encodeWithCoder:](&v5, "encodeWithCoder:", v4);
  objc_msgSend( v4,  "encodeObject:forKey:",  self->_paymentTransaction,  @"paymentTransaction",  v5.receiver,  v5.super_class);
}

- (unint64_t)notificationType
{
  return 30LL;
}

- (BOOL)isValid
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[PKPaymentTransaction transactionDate](self->_paymentTransaction, "transactionDate"));
  [v3 timeIntervalSinceNow];
  double v5 = fabs(v4);

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[PKPaymentTransaction authenticationContext](self->_paymentTransaction, "authenticationContext"));
  if (v5 > PKPaymentTransactionAuthenticationValidPeriod
    || -[PKPaymentTransaction transactionStatus](self->_paymentTransaction, "transactionStatus")
    || ![v6 requestedAuthenticationMechanisms]
    || [v6 requestedAuthenticationMechanisms] == (id)2)
  {
    LOBYTE(v7) = 0;
  }

  else
  {
    unsigned int v7 = [v6 complete] ^ 1;
  }

  return v7;
}

- (id)notificationContentWithDataSource:(id)a3
{
  v40.receiver = self;
  v40.super_class = (Class)&OBJC_CLASS___PDPassPaymentTransactionAuthenticationUserNotification;
  id v4 = a3;
  id v5 = -[PDUserNotification notificationContentWithDataSource:](&v40, "notificationContentWithDataSource:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  unsigned int v7 = (void *)objc_claimAutoreleasedReturnValue(-[PDUserNotification passUniqueIdentifier](self, "passUniqueIdentifier"));
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v4 passWithUniqueIdentifier:v7]);

  id v9 = (void *)objc_claimAutoreleasedReturnValue(-[PKPaymentTransaction authenticationContext](self->_paymentTransaction, "authenticationContext"));
  id v10 = [v9 requestedAuthenticationMechanisms];

  if ((v10 & 4) != 0)
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[PKPaymentTransaction currencyAmount](self->_paymentTransaction, "currencyAmount"));
    v14 = (void *)objc_claimAutoreleasedReturnValue([v13 formattedStringValue]);
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[PKPaymentTransaction merchant](self->_paymentTransaction, "merchant"));
    v16 = (void *)objc_claimAutoreleasedReturnValue([v15 displayName]);
    uint64_t v17 = PKLocalizedAquamanString( @"TRANSACTION_AUTHENTICATION_USER_CONFIRMATION_MESSAGE",  @"%@%@",  v14,  v16);
    v12 = (void *)objc_claimAutoreleasedReturnValue(v17);

    goto LABEL_15;
  }

  if ((v10 & 8) == 0)
  {
    if ((v10 & 1) == 0)
    {
      objc_super v11 = 0LL;
      v12 = 0LL;
      goto LABEL_10;
    }

    v39 = (void *)objc_claimAutoreleasedReturnValue(-[PKPaymentTransaction currencyAmount](self->_paymentTransaction, "currencyAmount"));
    v33 = (void *)objc_claimAutoreleasedReturnValue([v39 formattedStringValue]);
    v34 = (void *)objc_claimAutoreleasedReturnValue(-[PKPaymentTransaction merchant](self->_paymentTransaction, "merchant"));
    v35 = (void *)objc_claimAutoreleasedReturnValue([v34 displayName]);
    v36 = v8;
    v37 = (void *)objc_claimAutoreleasedReturnValue([v8 organizationName]);
    uint64_t v38 = PKLocalizedAquamanString( @"TRANSACTION_AUTHENTICATION_PAYMENT_PIN_NOTIFICATION_BODY",  @"%@%@%@",  v33,  v35,  v37);
    v12 = (void *)objc_claimAutoreleasedReturnValue(v38);

    uint64_t v8 = v36;
LABEL_15:
    objc_super v11 = 0LL;
    if (!v12) {
      goto LABEL_10;
    }
LABEL_9:
    [v6 setBody:v12];
    goto LABEL_10;
  }

  uint64_t v18 = PKLocalizedAquamanString(@"TRANSACTION_AUTHENTICATION_APP_REDIRECT_NOTIFICATION_TITLE");
  objc_super v11 = (void *)objc_claimAutoreleasedReturnValue(v18);
  objc_super v19 = (void *)objc_claimAutoreleasedReturnValue([v8 organizationName]);
  uint64_t v20 = PKLocalizedAquamanString( @"TRANSACTION_AUTHENTICATION_APP_REDIRECT_NOTIFICATION_BODY",  @"%@",  v19);
  v12 = (void *)objc_claimAutoreleasedReturnValue(v20);

  if (v11) {
    [v6 setSubtitle:v11];
  }
  if (v12) {
    goto LABEL_9;
  }
LABEL_10:
  v21 = (void *)objc_claimAutoreleasedReturnValue(-[PKPaymentTransaction transactionDate](self->_paymentTransaction, "transactionDate"));
  [v6 setDate:v21];

  v22 = (void *)objc_claimAutoreleasedReturnValue(-[PKPaymentTransaction transactionDate](self->_paymentTransaction, "transactionDate"));
  v23 = (void *)objc_claimAutoreleasedReturnValue([v22 dateByAddingTimeInterval:PKPaymentTransactionAuthenticationValidPeriod]);
  [v6 setExpirationDate:v23];

  v24 = (void *)objc_claimAutoreleasedReturnValue([v6 userInfo]);
  id v25 = [v24 mutableCopy];
  v26 = v25;
  if (v25) {
    v27 = (NSMutableDictionary *)v25;
  }
  else {
    v27 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  }
  v28 = v27;

  v29 = (void *)objc_claimAutoreleasedReturnValue(-[PKPaymentTransaction identifier](self->_paymentTransaction, "identifier"));
  -[NSMutableDictionary setObject:forKeyedSubscript:]( v28,  "setObject:forKeyedSubscript:",  v29,  PKUserNotificationTransactionIdentifierContextKey);

  v30 = (void *)objc_claimAutoreleasedReturnValue(-[PDUserNotification passUniqueIdentifier](self, "passUniqueIdentifier"));
  -[NSMutableDictionary setObject:forKeyedSubscript:]( v28,  "setObject:forKeyedSubscript:",  v30,  PKUserNotificationPassUniqueIdentifierContextKey);

  v31 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInteger:", v10));
  -[NSMutableDictionary setObject:forKeyedSubscript:]( v28,  "setObject:forKeyedSubscript:",  v31,  PKUserNotificationRequestedAuthenticationMechanismsContextKey);

  [v6 setUserInfo:v28];
  return v6;
}

- (PKPaymentTransaction)paymentTransaction
{
  return self->_paymentTransaction;
}

- (void).cxx_destruct
{
}

@end