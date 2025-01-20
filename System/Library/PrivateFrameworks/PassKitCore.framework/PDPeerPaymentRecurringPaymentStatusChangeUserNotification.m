@interface PDPeerPaymentRecurringPaymentStatusChangeUserNotification
+ (BOOL)supportsSecureCoding;
- (BOOL)isValid;
- (PDPeerPaymentRecurringPaymentStatusChangeUserNotification)initWithCoder:(id)a3;
- (PDPeerPaymentRecurringPaymentStatusChangeUserNotification)initWithPassUniqueIdentifier:(id)a3 recurringPayment:(id)a4;
- (PKPeerPaymentRecurringPayment)recurringPayment;
- (id)_recipientNameForAddress:(id)a3;
- (id)notificationContentWithDataSource:(id)a3;
- (unint64_t)notificationType;
- (void)encodeWithCoder:(id)a3;
@end

@implementation PDPeerPaymentRecurringPaymentStatusChangeUserNotification

- (PDPeerPaymentRecurringPaymentStatusChangeUserNotification)initWithPassUniqueIdentifier:(id)a3 recurringPayment:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([v7 type] != (id)1 || objc_msgSend(v7, "sentByMe"))
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue([v7 identifier]);
    v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"PDPeerPaymentRecurringPaymentStatusChange-%@",  v8));

    v20.receiver = self;
    v20.super_class = (Class)&OBJC_CLASS___PDPeerPaymentRecurringPaymentStatusChangeUserNotification;
    v10 = -[PDUserNotification initWithNotificationIdentifier:forPassUniqueIdentifier:]( &v20,  "initWithNotificationIdentifier:forPassUniqueIdentifier:",  v9,  v6);
    v11 = v10;
    if (v10)
    {
      p_recurringPayment = (id *)&v10->_recurringPayment;
      objc_storeStrong((id *)&v10->_recurringPayment, a4);
      id v13 = [*p_recurringPayment type];
      if (v13 == (id)1)
      {
        uint64_t v16 = PKURLActionRoutePeerPaymentPass;
        uint64_t v17 = PKURLActionRouteRecurringPayment;
        v18 = (void *)objc_claimAutoreleasedReturnValue([*p_recurringPayment identifier]);
        v14 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@/%@/%@",  v16,  v17,  v18));

        goto LABEL_9;
      }

      if (v13 == (id)3)
      {
        v14 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@/%@",  PKURLActionRoutePeerPaymentPass,  PKURLActionRouteAutoReload));
LABEL_9:
        -[PDUserNotification setCustomActionRoute:](v11, "setCustomActionRoute:", v14);
      }
    }

    self = v11;

    v15 = self;
    goto LABEL_11;
  }

  v15 = 0LL;
LABEL_11:

  return v15;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PDPeerPaymentRecurringPaymentStatusChangeUserNotification)initWithCoder:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)&OBJC_CLASS___PDPeerPaymentRecurringPaymentStatusChangeUserNotification;
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
  v5.super_class = (Class)&OBJC_CLASS___PDPeerPaymentRecurringPaymentStatusChangeUserNotification;
  id v4 = a3;
  -[PDUserNotification encodeWithCoder:](&v5, "encodeWithCoder:", v4);
  objc_msgSend( v4,  "encodeObject:forKey:",  self->_recurringPayment,  @"recurringPayment",  v5.receiver,  v5.super_class);
}

- (BOOL)isValid
{
  id v3 = -[PKPeerPaymentRecurringPayment type](self->_recurringPayment, "type");
  if (v3 == (id)3) {
    return 1;
  }
  if (v3 == (id)1) {
    return -[PKPeerPaymentRecurringPayment sentByMe](self->_recurringPayment, "sentByMe");
  }
  return 0;
}

- (unint64_t)notificationType
{
  return 72LL;
}

- (id)notificationContentWithDataSource:(id)a3
{
  v19.receiver = self;
  v19.super_class = (Class)&OBJC_CLASS___PDPeerPaymentRecurringPaymentStatusChangeUserNotification;
  id v4 = -[PDUserNotification notificationContentWithDataSource:](&v19, "notificationContentWithDataSource:", a3);
  objc_super v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  id v6 = -[PKPeerPaymentRecurringPayment type](self->_recurringPayment, "type");
  if (v6 == (id)1)
  {
    else {
      v15 = @"NOTIFICATION_RECURRING_PAYMENT_ERROR_MESSAGE_SETTINGS";
    }
    v12 = (NSString *)objc_claimAutoreleasedReturnValue(-[PKPeerPaymentRecurringPayment recipientAddress](self->_recurringPayment, "recipientAddress"));
    v14 = (void *)objc_claimAutoreleasedReturnValue( -[PDPeerPaymentRecurringPaymentStatusChangeUserNotification _recipientNameForAddress:]( self,  "_recipientNameForAddress:",  v12));
    uint64_t v16 = PKLocalizedPeerPaymentRecurringString(&v15->isa, @"%@", v14);
    uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue(v16);
    [v5 setBody:v17];

    goto LABEL_8;
  }

  if (v6 == (id)3)
  {
    uint64_t v8 = PKLocalizedPeerPaymentRecurringString(@"NOTIFICATION_THRESHOLD_TOP_UP_ERROR_TITLE");
    v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
    [v5 setTitle:v9];

    uint64_t v11 = PDDeviceSpecificLocalizedStringKeyForKey(@"NOTIFICATION_THRESHOLD_TOP_UP_ERROR_MESSAGE", v10);
    v12 = (NSString *)objc_claimAutoreleasedReturnValue(v11);
    uint64_t v13 = PKLocalizedPeerPaymentRecurringString(v12);
    v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
    [v5 setBody:v14];
LABEL_8:
  }

  return v5;
}

- (id)_recipientNameForAddress:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc_init(&OBJC_CLASS___CNContactStore);
  objc_super v5 = (void *)objc_claimAutoreleasedReturnValue( +[PKPeerPaymentCounterpartHandleFormatter requiredContactKeys]( &OBJC_CLASS___PKPeerPaymentCounterpartHandleFormatter,  "requiredContactKeys"));
  id v6 = -[PKContactResolver initWithContactStore:keysToFetch:]( objc_alloc(&OBJC_CLASS___PKContactResolver),  "initWithContactStore:keysToFetch:",  v4,  v5);
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(-[PKContactResolver contactForHandle:](v6, "contactForHandle:", v3));
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v7 givenName]);
  v9 = v8;
  if (!v8) {
    uint64_t v8 = v3;
  }
  id v10 = v8;

  return v10;
}

- (PKPeerPaymentRecurringPayment)recurringPayment
{
  return self->_recurringPayment;
}

- (void).cxx_destruct
{
}

@end