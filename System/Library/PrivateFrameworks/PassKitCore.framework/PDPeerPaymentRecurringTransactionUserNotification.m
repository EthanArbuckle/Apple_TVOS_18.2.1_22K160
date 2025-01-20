@interface PDPeerPaymentRecurringTransactionUserNotification
+ (BOOL)supportsSecureCoding;
- (BOOL)isValid;
- (NSData)imageData;
- (PDPeerPaymentRecurringTransactionUserNotification)initWithCoder:(id)a3;
- (PDPeerPaymentRecurringTransactionUserNotification)initWithPassUniqueIdentifier:(id)a3 transaction:(id)a4 imageData:(id)a5;
- (PKPaymentTransaction)transaction;
- (id)_formattedCounterpartName;
- (id)notificationContentWithDataSource:(id)a3;
- (unint64_t)notificationType;
- (void)encodeWithCoder:(id)a3;
@end

@implementation PDPeerPaymentRecurringTransactionUserNotification

- (PDPeerPaymentRecurringTransactionUserNotification)initWithPassUniqueIdentifier:(id)a3 transaction:(id)a4 imageData:(id)a5
{
  id v9 = a4;
  id v10 = a5;
  id v11 = a3;
  v12 = (void *)objc_claimAutoreleasedReturnValue([v9 serviceIdentifier]);
  v13 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"PDPeerPaymentRecurringTransaction-%@",  v12));

  v20.receiver = self;
  v20.super_class = (Class)&OBJC_CLASS___PDPeerPaymentRecurringTransactionUserNotification;
  v14 = -[PDUserNotification initWithNotificationIdentifier:forPassUniqueIdentifier:]( &v20,  "initWithNotificationIdentifier:forPassUniqueIdentifier:",  v13,  v11);

  if (v14)
  {
    objc_storeStrong((id *)&v14->_transaction, a4);
    objc_storeStrong((id *)&v14->_imageData, a5);
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

- (PDPeerPaymentRecurringTransactionUserNotification)initWithCoder:(id)a3
{
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)&OBJC_CLASS___PDPeerPaymentRecurringTransactionUserNotification;
  v6 = -[PDUserNotification initWithCoder:](&v15, "initWithCoder:", v4);
  if (v6)
  {
    id v7 = objc_msgSend( v4,  "decodeObjectOfClass:forKey:",  objc_opt_class(PKPaymentTransaction, v5),  @"paymentTransaction");
    uint64_t v8 = objc_claimAutoreleasedReturnValue(v7);
    transaction = v6->_transaction;
    v6->_transaction = (PKPaymentTransaction *)v8;

    id v11 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(NSData, v10), @"imageData");
    uint64_t v12 = objc_claimAutoreleasedReturnValue(v11);
    imageData = v6->_imageData;
    v6->_imageData = (NSData *)v12;
  }

  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___PDPeerPaymentRecurringTransactionUserNotification;
  id v4 = a3;
  -[PDUserNotification encodeWithCoder:](&v5, "encodeWithCoder:", v4);
  objc_msgSend(v4, "encodeObject:forKey:", self->_imageData, @"imageData", v5.receiver, v5.super_class);
  [v4 encodeObject:self->_transaction forKey:@"paymentTransaction"];
}

- (BOOL)isValid
{
  return 1;
}

- (unint64_t)notificationType
{
  return 69LL;
}

- (id)notificationContentWithDataSource:(id)a3
{
  v38.receiver = self;
  v38.super_class = (Class)&OBJC_CLASS___PDPeerPaymentRecurringTransactionUserNotification;
  id v4 = a3;
  id v5 = -[PDUserNotification notificationContentWithDataSource:](&v38, "notificationContentWithDataSource:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  uint64_t v7 = PKLocalizedPeerPaymentRecurringString(@"NOTIFICATION_RECURRING_PAYMENT_TRANSACTION_TITLE");
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  [v6 setTitle:v8];

  id v9 = (void *)objc_claimAutoreleasedReturnValue(-[PKPaymentTransaction recurringPeerPayment](self->_transaction, "recurringPeerPayment"));
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([v9 memo]);

  id v11 = (void *)objc_claimAutoreleasedReturnValue([v10 text]);
  id v12 = -[PKPaymentTransaction peerPaymentType](self->_transaction, "peerPaymentType");
  id v13 = [v11 length];
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[PKPaymentTransaction currencyAmount](self->_transaction, "currencyAmount"));
  objc_super v15 = (void *)objc_claimAutoreleasedReturnValue([v14 minimalFormattedStringValue]);
  uint64_t v16 = objc_claimAutoreleasedReturnValue( -[PDPeerPaymentRecurringTransactionUserNotification _formattedCounterpartName]( self,  "_formattedCounterpartName"));
  v17 = (void *)v16;
  if (v12 == (id)2)
  {
    if (v13)
    {
      uint64_t v35 = v16;
      v37 = v11;
      v33 = v15;
      id v18 = @"NOTIFICATION_RECURRING_PAYMENT_TRANSACTION_RECEIVED_MESSAGE_MEMO";
LABEL_6:
      uint64_t v19 = PKLocalizedPeerPaymentRecurringString(&v18->isa, @"%@%@%@", v33, v35, v37);
      goto LABEL_10;
    }

    v34 = v15;
    uint64_t v36 = v16;
    objc_super v20 = @"NOTIFICATION_RECURRING_PAYMENT_TRANSACTION_RECEIVED_MESSAGE";
  }

  else
  {
    if (v13)
    {
      uint64_t v35 = v16;
      v37 = v11;
      v33 = v15;
      id v18 = @"NOTIFICATION_RECURRING_PAYMENT_TRANSACTION_SENT_MESSAGE_MEMO";
      goto LABEL_6;
    }

    v34 = v15;
    uint64_t v36 = v16;
    objc_super v20 = @"NOTIFICATION_RECURRING_PAYMENT_TRANSACTION_SENT_MESSAGE";
  }

  uint64_t v19 = PKLocalizedPeerPaymentRecurringString(&v20->isa, @"%@%@", v34, v36);
LABEL_10:
  v21 = (void *)objc_claimAutoreleasedReturnValue(v19);
  [v6 setBody:v21];

  v22 = objc_alloc(&OBJC_CLASS___NSString);
  v23 = (void *)objc_claimAutoreleasedReturnValue([v10 emoji]);
  uint64_t v24 = PKSemanticColorToString([v10 color]);
  v25 = (void *)objc_claimAutoreleasedReturnValue(v24);
  v26 = -[NSString initWithFormat:](v22, "initWithFormat:", @"%@-%@", v23, v25);

  v27 = (void *)objc_claimAutoreleasedReturnValue([v4 fileURLForImage:self->_imageData identifier:v26]);
  if (v27)
  {
    v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](&OBJC_CLASS___NSUUID, "UUID"));
    v29 = (void *)objc_claimAutoreleasedReturnValue([v28 UUIDString]);
    v30 = (void *)objc_claimAutoreleasedReturnValue( +[UNNotificationAttachment attachmentWithIdentifier:URL:options:error:]( &OBJC_CLASS___UNNotificationAttachment,  "attachmentWithIdentifier:URL:options:error:",  v29,  v27,  0LL,  0LL));

    v39 = v30;
    v31 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v39, 1LL));
    [v6 setAttachments:v31];
  }

  return v6;
}

- (id)_formattedCounterpartName
{
  v2 = (void *)objc_claimAutoreleasedReturnValue( -[PKPaymentTransaction peerPaymentCounterpartHandle]( self->_transaction,  "peerPaymentCounterpartHandle"));
  v3 = objc_alloc_init(&OBJC_CLASS___CNContactStore);
  id v4 = (void *)objc_claimAutoreleasedReturnValue( +[PKPeerPaymentCounterpartHandleFormatter requiredContactKeys]( &OBJC_CLASS___PKPeerPaymentCounterpartHandleFormatter,  "requiredContactKeys"));
  id v5 = -[PKContactResolver initWithContactStore:keysToFetch:]( objc_alloc(&OBJC_CLASS___PKContactResolver),  "initWithContactStore:keysToFetch:",  v3,  v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[PKContactResolver contactForHandle:](v5, "contactForHandle:", v2));
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue( +[PKPeerPaymentCounterpartHandleFormatter displayNameForCounterpartHandle:contact:]( &OBJC_CLASS___PKPeerPaymentCounterpartHandleFormatter,  "displayNameForCounterpartHandle:contact:",  v2,  v6));

  return v7;
}

- (PKPaymentTransaction)transaction
{
  return self->_transaction;
}

- (NSData)imageData
{
  return self->_imageData;
}

- (void).cxx_destruct
{
}

@end