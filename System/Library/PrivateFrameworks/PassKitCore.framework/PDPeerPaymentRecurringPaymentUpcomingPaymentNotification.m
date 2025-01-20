@interface PDPeerPaymentRecurringPaymentUpcomingPaymentNotification
+ (BOOL)supportsSecureCoding;
+ (id)notificationIdentifierForRecurringPaymentIdentifier:(id)a3;
- (BOOL)isValid;
- (PDPeerPaymentRecurringPaymentUpcomingPaymentNotification)initWithCoder:(id)a3;
- (PDPeerPaymentRecurringPaymentUpcomingPaymentNotification)initWithPassUniqueIdentifier:(id)a3 recurringPayment:(id)a4;
- (PKPeerPaymentRecurringPayment)recurringPayment;
- (id)_recipientNameForAddress:(id)a3;
- (id)notificationContentWithDataSource:(id)a3;
- (unint64_t)notificationType;
- (void)encodeWithCoder:(id)a3;
@end

@implementation PDPeerPaymentRecurringPaymentUpcomingPaymentNotification

- (PDPeerPaymentRecurringPaymentUpcomingPaymentNotification)initWithPassUniqueIdentifier:(id)a3 recurringPayment:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([v7 type] == (id)1 && objc_msgSend(v7, "sentByMe"))
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue([v7 identifier]);
    v9 = (void *)objc_claimAutoreleasedReturnValue( +[PDPeerPaymentRecurringPaymentUpcomingPaymentNotification notificationIdentifierForRecurringPaymentIdentifier:]( &OBJC_CLASS___PDPeerPaymentRecurringPaymentUpcomingPaymentNotification,  "notificationIdentifierForRecurringPaymentIdentifier:",  v8));

    v18.receiver = self;
    v18.super_class = (Class)&OBJC_CLASS___PDPeerPaymentRecurringPaymentUpcomingPaymentNotification;
    v10 = -[PDUserNotification initWithNotificationIdentifier:forPassUniqueIdentifier:]( &v18,  "initWithNotificationIdentifier:forPassUniqueIdentifier:",  v9,  v6);
    p_isa = (id *)&v10->super.super.isa;
    if (v10)
    {
      objc_storeStrong((id *)&v10->_recurringPayment, a4);
      uint64_t v12 = PKURLActionRoutePeerPaymentPass;
      uint64_t v13 = PKURLActionRouteRecurringPayment;
      v14 = (void *)objc_claimAutoreleasedReturnValue([p_isa[17] identifier]);
      v15 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@/%@/%@",  v12,  v13,  v14));

      [p_isa setCustomActionRoute:v15];
    }

    self = p_isa;

    v16 = self;
  }

  else
  {
    v16 = 0LL;
  }

  return v16;
}

+ (id)notificationIdentifierForRecurringPaymentIdentifier:(id)a3
{
  return +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"PDPeerPaymentRecurringPaymentUpcomingPaymentNotification-%@",  a3);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PDPeerPaymentRecurringPaymentUpcomingPaymentNotification)initWithCoder:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)&OBJC_CLASS___PDPeerPaymentRecurringPaymentUpcomingPaymentNotification;
  id v6 = -[PDUserNotification initWithCoder:](&v11, "initWithCoder:", v4);
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
  v5.super_class = (Class)&OBJC_CLASS___PDPeerPaymentRecurringPaymentUpcomingPaymentNotification;
  id v4 = a3;
  -[PDUserNotification encodeWithCoder:](&v5, "encodeWithCoder:", v4);
  objc_msgSend( v4,  "encodeObject:forKey:",  self->_recurringPayment,  @"recurringPayment",  v5.receiver,  v5.super_class);
}

- (BOOL)isValid
{
  if (-[PKPeerPaymentRecurringPayment type](self->_recurringPayment, "type") == (id)1) {
    return -[PKPeerPaymentRecurringPayment sentByMe](self->_recurringPayment, "sentByMe");
  }
  else {
    return 0;
  }
}

- (unint64_t)notificationType
{
  return 73LL;
}

- (id)notificationContentWithDataSource:(id)a3
{
  v22.receiver = self;
  v22.super_class = (Class)&OBJC_CLASS___PDPeerPaymentRecurringPaymentUpcomingPaymentNotification;
  id v4 = -[PDUserNotification notificationContentWithDataSource:](&v22, "notificationContentWithDataSource:", a3);
  objc_super v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  uint64_t v6 = PKLocalizedPeerPaymentRecurringString(@"NOTIFICATION_RECURRING_PAYMENT_UPCOMING_PAYMENT_TITLE");
  id v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  [v5 setTitle:v7];

  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(-[PKPeerPaymentRecurringPayment memo](self->_recurringPayment, "memo"));
  v9 = (void *)objc_claimAutoreleasedReturnValue([v8 text]);

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[PKPeerPaymentRecurringPayment amount](self->_recurringPayment, "amount"));
  objc_super v11 = (void *)objc_claimAutoreleasedReturnValue(-[PKPeerPaymentRecurringPayment currency](self->_recurringPayment, "currency"));
  uint64_t v12 = PKCurrencyAmountMake(v10, v11);
  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue(v12);

  id v14 = [v9 length];
  v15 = (void *)objc_claimAutoreleasedReturnValue([v13 minimalFormattedStringValue]);
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[PKPeerPaymentRecurringPayment recipientAddress](self->_recurringPayment, "recipientAddress"));
  uint64_t v17 = objc_claimAutoreleasedReturnValue( -[PDPeerPaymentRecurringPaymentUpcomingPaymentNotification _recipientNameForAddress:]( self,  "_recipientNameForAddress:",  v16));
  objc_super v18 = (void *)v17;
  if (v14) {
    uint64_t v19 = PKLocalizedPeerPaymentRecurringString( @"NOTIFICATION_RECURRING_PAYMENT_UPCOMING_PAYMENT_MESSAGE_MEMO",  @"%@%@%@",  v15,  v17,  v9);
  }
  else {
    uint64_t v19 = PKLocalizedPeerPaymentRecurringString( @"NOTIFICATION_RECURRING_PAYMENT_UPCOMING_PAYMENT_MESSAGE",  @"%@%@",  v15,  v17);
  }
  v20 = (void *)objc_claimAutoreleasedReturnValue(v19);
  [v5 setBody:v20];

  return v5;
}

- (id)_recipientNameForAddress:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc_init(&OBJC_CLASS___CNContactStore);
  objc_super v5 = (void *)objc_claimAutoreleasedReturnValue( +[PKPeerPaymentCounterpartHandleFormatter requiredContactKeys]( &OBJC_CLASS___PKPeerPaymentCounterpartHandleFormatter,  "requiredContactKeys"));
  uint64_t v6 = -[PKContactResolver initWithContactStore:keysToFetch:]( objc_alloc(&OBJC_CLASS___PKContactResolver),  "initWithContactStore:keysToFetch:",  v4,  v5);
  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[PKContactResolver contactForHandle:](v6, "contactForHandle:", v3));
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue( +[PKPeerPaymentCounterpartHandleFormatter displayNameForCounterpartHandle:contact:]( &OBJC_CLASS___PKPeerPaymentCounterpartHandleFormatter,  "displayNameForCounterpartHandle:contact:",  v3,  v7));

  return v8;
}

- (PKPeerPaymentRecurringPayment)recurringPayment
{
  return self->_recurringPayment;
}

- (void).cxx_destruct
{
}

@end