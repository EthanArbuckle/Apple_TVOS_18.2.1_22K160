@interface PDPeerPaymentTransactionReceivedUserNotification
+ (BOOL)supportsSecureCoding;
- (BOOL)isValid;
- (PDPeerPaymentTransactionReceivedUserNotification)initWithCoder:(id)a3;
- (PDPeerPaymentTransactionReceivedUserNotification)initWithPassUniqueIdentifier:(id)a3 accountBalance:(id)a4;
- (PKCurrencyAmount)updatedBalance;
- (id)notificationContentWithDataSource:(id)a3;
- (unint64_t)notificationType;
- (void)encodeWithCoder:(id)a3;
@end

@implementation PDPeerPaymentTransactionReceivedUserNotification

- (PDPeerPaymentTransactionReceivedUserNotification)initWithPassUniqueIdentifier:(id)a3 accountBalance:(id)a4
{
  id v7 = a4;
  id v8 = a3;
  v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"PDPeerPaymentTransactionReceived-%@",  v8));
  v12.receiver = self;
  v12.super_class = (Class)&OBJC_CLASS___PDPeerPaymentTransactionReceivedUserNotification;
  v10 = -[PDUserNotification initWithNotificationIdentifier:forPassUniqueIdentifier:]( &v12,  "initWithNotificationIdentifier:forPassUniqueIdentifier:",  v9,  v8);

  if (v10) {
    objc_storeStrong((id *)&v10->_updatedBalance, a4);
  }

  return v10;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PDPeerPaymentTransactionReceivedUserNotification)initWithCoder:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)&OBJC_CLASS___PDPeerPaymentTransactionReceivedUserNotification;
  v6 = -[PDUserNotification initWithCoder:](&v11, "initWithCoder:", v4);
  if (v6)
  {
    id v7 = objc_msgSend( v4,  "decodeObjectOfClass:forKey:",  objc_opt_class(PKCurrencyAmount, v5),  @"updatedBalance");
    uint64_t v8 = objc_claimAutoreleasedReturnValue(v7);
    updatedBalance = v6->_updatedBalance;
    v6->_updatedBalance = (PKCurrencyAmount *)v8;
  }

  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___PDPeerPaymentTransactionReceivedUserNotification;
  id v4 = a3;
  -[PDUserNotification encodeWithCoder:](&v5, "encodeWithCoder:", v4);
  objc_msgSend(v4, "encodeObject:forKey:", self->_updatedBalance, @"updatedBalance", v5.receiver, v5.super_class);
}

- (BOOL)isValid
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[PKCurrencyAmount amount](self->_updatedBalance, "amount"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSDecimalNumber zero](&OBJC_CLASS___NSDecimalNumber, "zero"));
  BOOL v4 = [v2 compare:v3] == (id)1;

  return v4;
}

- (unint64_t)notificationType
{
  return 49LL;
}

- (id)notificationContentWithDataSource:(id)a3
{
  v12.receiver = self;
  v12.super_class = (Class)&OBJC_CLASS___PDPeerPaymentTransactionReceivedUserNotification;
  id v4 = -[PDUserNotification notificationContentWithDataSource:](&v12, "notificationContentWithDataSource:", a3);
  objc_super v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  uint64_t v6 = PKLocalizedPeerPaymentString(@"PEER_PAYMENT_TRANSACTION_RECEIVED_NOTIFICATION_TITLE");
  id v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  [v5 setTitle:v7];

  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(-[PKCurrencyAmount formattedStringValue](self->_updatedBalance, "formattedStringValue"));
  uint64_t v9 = PKLocalizedPeerPaymentString( @"PEER_PAYMENT_TRANSACTION_RECEIVED_NOTIFICATION_MESSAGE",  @"%@",  v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
  [v5 setBody:v10];

  return v5;
}

- (PKCurrencyAmount)updatedBalance
{
  return self->_updatedBalance;
}

- (void).cxx_destruct
{
}

@end