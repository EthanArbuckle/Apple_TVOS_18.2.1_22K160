@interface PDPeerPaymentRecurringPaymentSetupNotification
+ (BOOL)supportsSecureCoding;
- (BOOL)isValid;
- (PDPeerPaymentRecurringPaymentSetupNotification)initWithCoder:(id)a3;
- (PDPeerPaymentRecurringPaymentSetupNotification)initWithPassUniqueIdentifier:(id)a3 recurringPayment:(id)a4;
- (PKPeerPaymentRecurringPayment)recurringPayment;
- (id)_formattedCounterpartName;
- (id)notificationContentWithDataSource:(id)a3;
- (unint64_t)notificationType;
- (void)encodeWithCoder:(id)a3;
@end

@implementation PDPeerPaymentRecurringPaymentSetupNotification

- (PDPeerPaymentRecurringPaymentSetupNotification)initWithPassUniqueIdentifier:(id)a3 recurringPayment:(id)a4
{
  id v7 = a4;
  id v8 = a3;
  v9 = (void *)objc_claimAutoreleasedReturnValue([v7 identifier]);
  v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"PDPeerPaymentRecurringPaymentSetUp-%@",  v9));

  v17.receiver = self;
  v17.super_class = (Class)&OBJC_CLASS___PDPeerPaymentRecurringPaymentSetupNotification;
  v11 = -[PDUserNotification initWithNotificationIdentifier:forPassUniqueIdentifier:]( &v17,  "initWithNotificationIdentifier:forPassUniqueIdentifier:",  v10,  v8);

  if (v11)
  {
    objc_storeStrong((id *)&v11->_recurringPayment, a4);
    if (-[PKPeerPaymentRecurringPayment type](v11->_recurringPayment, "type") == (id)1)
    {
      uint64_t v12 = PKURLActionRoutePeerPaymentPass;
      uint64_t v13 = PKURLActionRouteRecurringPayment;
      v14 = (void *)objc_claimAutoreleasedReturnValue(-[PKPeerPaymentRecurringPayment identifier](v11->_recurringPayment, "identifier"));
      v15 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@/%@/%@",  v12,  v13,  v14));

      -[PDUserNotification setCustomActionRoute:](v11, "setCustomActionRoute:", v15);
    }
  }

  return v11;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PDPeerPaymentRecurringPaymentSetupNotification)initWithCoder:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)&OBJC_CLASS___PDPeerPaymentRecurringPaymentSetupNotification;
  v6 = -[PDUserNotification initWithCoder:](&v11, "initWithCoder:", v4);
  if (v6)
  {
    id v7 = objc_msgSend( v4,  "decodeObjectOfClass:forKey:",  objc_opt_class(PKPeerPaymentRecurringPayment, v5),  @"recurringPayment");
    uint64_t v8 = objc_claimAutoreleasedReturnValue(v7);
    recurringPayment = v6->_recurringPayment;
    v6->_recurringPayment = (PKPeerPaymentRecurringPayment *)v8;
  }

  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___PDPeerPaymentRecurringPaymentSetupNotification;
  id v4 = a3;
  -[PDUserNotification encodeWithCoder:](&v5, "encodeWithCoder:", v4);
  objc_msgSend( v4,  "encodeObject:forKey:",  self->_recurringPayment,  @"recurringPayment",  v5.receiver,  v5.super_class);
}

- (BOOL)isValid
{
  return -[PKPeerPaymentRecurringPayment type](self->_recurringPayment, "type") == (id)1;
}

- (unint64_t)notificationType
{
  return 74LL;
}

- (id)notificationContentWithDataSource:(id)a3
{
  v21.receiver = self;
  v21.super_class = (Class)&OBJC_CLASS___PDPeerPaymentRecurringPaymentSetupNotification;
  id v4 = -[PDUserNotification notificationContentWithDataSource:](&v21, "notificationContentWithDataSource:", a3);
  objc_super v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  if (-[PKPeerPaymentRecurringPayment type](self->_recurringPayment, "type") == (id)1)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[PKPeerPaymentRecurringPayment memo](self->_recurringPayment, "memo"));
    id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 text]);

    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(-[PKPeerPaymentRecurringPayment amount](self->_recurringPayment, "amount"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[PKPeerPaymentRecurringPayment currency](self->_recurringPayment, "currency"));
    uint64_t v10 = PKCurrencyAmountMake(v8, v9);
    objc_super v11 = (void *)objc_claimAutoreleasedReturnValue(v10);

    id v12 = [v7 length];
    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue([v11 minimalFormattedStringValue]);
    uint64_t v14 = objc_claimAutoreleasedReturnValue( -[PDPeerPaymentRecurringPaymentSetupNotification _formattedCounterpartName]( self,  "_formattedCounterpartName"));
    v15 = (void *)v14;
    if (v12) {
      uint64_t v16 = PKLocalizedPeerPaymentRecurringString( @"NOTIFICATION_RECURRING_PAYMENT_SET_UP_MESSAGE_MEMO",  @"%@%@%@",  v13,  v14,  v7);
    }
    else {
      uint64_t v16 = PKLocalizedPeerPaymentRecurringString( @"NOTIFICATION_RECURRING_PAYMENT_SET_UP_MESSAGE",  @"%@%@",  v13,  v14);
    }
    objc_super v17 = (void *)objc_claimAutoreleasedReturnValue(v16);
    [v5 setBody:v17];

    uint64_t v18 = PKLocalizedPeerPaymentRecurringString(@"NOTIFICATION_RECURRING_PAYMENT_SET_UP_TITLE");
    v19 = (void *)objc_claimAutoreleasedReturnValue(v18);
    [v5 setTitle:v19];
  }

  return v5;
}

- (id)_formattedCounterpartName
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[PKPeerPaymentRecurringPayment recipientAddress](self->_recurringPayment, "recipientAddress"));
  v3 = objc_alloc_init(&OBJC_CLASS___CNContactStore);
  id v4 = (void *)objc_claimAutoreleasedReturnValue( +[PKPeerPaymentCounterpartHandleFormatter requiredContactKeys]( &OBJC_CLASS___PKPeerPaymentCounterpartHandleFormatter,  "requiredContactKeys"));
  objc_super v5 = -[PKContactResolver initWithContactStore:keysToFetch:]( objc_alloc(&OBJC_CLASS___PKContactResolver),  "initWithContactStore:keysToFetch:",  v3,  v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[PKContactResolver contactForHandle:](v5, "contactForHandle:", v2));
  id v7 = (void *)objc_claimAutoreleasedReturnValue( +[PKPeerPaymentCounterpartHandleFormatter displayNameForCounterpartHandle:contact:]( &OBJC_CLASS___PKPeerPaymentCounterpartHandleFormatter,  "displayNameForCounterpartHandle:contact:",  v2,  v6));

  return v7;
}

- (PKPeerPaymentRecurringPayment)recurringPayment
{
  return self->_recurringPayment;
}

- (void).cxx_destruct
{
}

@end