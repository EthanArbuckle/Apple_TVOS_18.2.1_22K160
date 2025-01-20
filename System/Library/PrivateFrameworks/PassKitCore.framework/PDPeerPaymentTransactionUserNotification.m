@interface PDPeerPaymentTransactionUserNotification
+ (BOOL)supportsSecureCoding;
- (PDPeerPaymentTransactionUserNotification)initWithCoder:(id)a3;
- (PDPeerPaymentTransactionUserNotification)initWithPaymentTransaction:(id)a3 forPassUniqueIdentifier:(id)a4 familyMember:(id)a5;
- (PDPeerPaymentTransactionUserNotification)initWithPaymentTransaction:(id)a3 forPassUniqueIdentifier:(id)a4 familyMember:(id)a5 notificationIdentifier:(id)a6;
- (PKFamilyMember)familyMember;
- (PKPaymentTransaction)paymentTransaction;
- (id)_formattedCounterpartName;
- (id)_peerPaymentNotificationType;
- (unint64_t)familyNotificationType;
- (void)encodeWithCoder:(id)a3;
@end

@implementation PDPeerPaymentTransactionUserNotification

- (PDPeerPaymentTransactionUserNotification)initWithPaymentTransaction:(id)a3 forPassUniqueIdentifier:(id)a4 familyMember:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  v11 = (void *)objc_claimAutoreleasedReturnValue([v10 serviceIdentifier]);
  v12 = (void *)objc_claimAutoreleasedReturnValue( -[PDPeerPaymentTransactionUserNotification _peerPaymentNotificationType]( self,  "_peerPaymentNotificationType"));
  v13 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@-%@-%@",  v9,  v11,  v12));

  v14 = -[PDPeerPaymentTransactionUserNotification initWithPaymentTransaction:forPassUniqueIdentifier:familyMember:notificationIdentifier:]( self,  "initWithPaymentTransaction:forPassUniqueIdentifier:familyMember:notificationIdentifier:",  v10,  v9,  v8,  v13);
  return v14;
}

- (PDPeerPaymentTransactionUserNotification)initWithPaymentTransaction:(id)a3 forPassUniqueIdentifier:(id)a4 familyMember:(id)a5 notificationIdentifier:(id)a6
{
  id v11 = a3;
  id v12 = a5;
  v21.receiver = self;
  v21.super_class = (Class)&OBJC_CLASS___PDPeerPaymentTransactionUserNotification;
  v13 = -[PDUserNotification initWithNotificationIdentifier:forPassUniqueIdentifier:]( &v21,  "initWithNotificationIdentifier:forPassUniqueIdentifier:",  a6,  a4);
  v14 = v13;
  if (v13)
  {
    p_paymentTransaction = (id *)&v13->_paymentTransaction;
    objc_storeStrong((id *)&v13->_paymentTransaction, a3);
    objc_storeStrong((id *)&v14->_familyMember, a5);
    -[PDUserNotification setCustomActionRoute:]( v14,  "setCustomActionRoute:",  PKUserNotificationActionRouteViewTransaction);
    v16 = (void *)objc_claimAutoreleasedReturnValue([*p_paymentTransaction identifier]);
    v17 = (void *)objc_claimAutoreleasedReturnValue([*p_paymentTransaction transactionSourceIdentifier]);
    v18 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    if ([v16 length]) {
      -[NSMutableDictionary setObject:forKey:]( v18,  "setObject:forKey:",  v16,  PKUserNotificationActionQueryItemTransactionIdentifier);
    }
    if ([v17 length]) {
      -[NSMutableDictionary setObject:forKey:]( v18,  "setObject:forKey:",  v17,  PKUserNotificationActionQueryItemTransactionSourceIdentifier);
    }
    id v19 = -[NSMutableDictionary copy](v18, "copy");
    -[PDUserNotification setCustomActionQueryParameters:](v14, "setCustomActionQueryParameters:", v19);
  }

  return v14;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PDPeerPaymentTransactionUserNotification)initWithCoder:(id)a3
{
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)&OBJC_CLASS___PDPeerPaymentTransactionUserNotification;
  v6 = -[PDUserNotification initWithCoder:](&v15, "initWithCoder:", v4);
  if (v6)
  {
    id v7 = objc_msgSend( v4,  "decodeObjectOfClass:forKey:",  objc_opt_class(PKPaymentTransaction, v5),  @"paymentTransaction");
    uint64_t v8 = objc_claimAutoreleasedReturnValue(v7);
    paymentTransaction = v6->_paymentTransaction;
    v6->_paymentTransaction = (PKPaymentTransaction *)v8;

    id v11 = objc_msgSend( v4,  "decodeObjectOfClass:forKey:",  objc_opt_class(NSString, v10),  @"familyMember");
    uint64_t v12 = objc_claimAutoreleasedReturnValue(v11);
    familyMember = v6->_familyMember;
    v6->_familyMember = (PKFamilyMember *)v12;
  }

  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___PDPeerPaymentTransactionUserNotification;
  id v4 = a3;
  -[PDUserNotification encodeWithCoder:](&v5, "encodeWithCoder:", v4);
  objc_msgSend( v4,  "encodeObject:forKey:",  self->_paymentTransaction,  @"paymentTransaction",  v5.receiver,  v5.super_class);
  [v4 encodeObject:self->_familyMember forKey:@"familyMember"];
}

- (id)_peerPaymentNotificationType
{
  uint64_t v2 = -[PDUserNotification notificationType](self, "notificationType");
  id v3 = 0LL;
  if (v2 > 30)
  {
    switch(v2)
    {
      case 31LL:
        id v4 = (id *)&PDWalletUserNotificationPeerPaymentAssociatedAccountTransactionReceived;
        goto LABEL_14;
      case 34LL:
        id v4 = (id *)&PDWalletUserNotificationPeerPaymentAssociatedAccountTransactionSend;
        goto LABEL_14;
      case 49LL:
        id v4 = (id *)&PDWalletUserNotificationPeerPaymentTransactionReceived;
        goto LABEL_14;
    }
  }

  else
  {
    switch(v2)
    {
      case 9LL:
        id v4 = (id *)&PDWalletUserNotificationPeerPaymentTransactionAccepted;
        goto LABEL_14;
      case 10LL:
        id v4 = (id *)&PDWalletUserNotificationPeerPaymentTransactionExpired;
        goto LABEL_14;
      case 13LL:
        id v4 = (id *)&PDWalletUserNotificationPeerPaymentTransactionDeclined;
LABEL_14:
        id v3 = *v4;
        break;
    }
  }

  return v3;
}

- (id)_formattedCounterpartName
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[PDPeerPaymentTransactionUserNotification paymentTransaction](self, "paymentTransaction"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 peerPaymentCounterpartHandle]);

  objc_super v5 = (void *)objc_claimAutoreleasedReturnValue(-[PDPeerPaymentTransactionUserNotification paymentTransaction](self, "paymentTransaction"));
  id v6 = [v5 peerPaymentPaymentMode];

  if (v6 != (id)2)
  {
    id v7 = objc_alloc_init(&OBJC_CLASS___CNContactStore);
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue( +[PKPeerPaymentCounterpartHandleFormatter requiredContactKeys]( &OBJC_CLASS___PKPeerPaymentCounterpartHandleFormatter,  "requiredContactKeys"));
    id v9 = -[PKContactResolver initWithContactStore:keysToFetch:]( objc_alloc(&OBJC_CLASS___PKContactResolver),  "initWithContactStore:keysToFetch:",  v7,  v8);
    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(-[PKContactResolver contactForHandle:](v9, "contactForHandle:", v4));
    uint64_t v11 = objc_claimAutoreleasedReturnValue( +[PKPeerPaymentCounterpartHandleFormatter displayNameForCounterpartHandle:contact:]( &OBJC_CLASS___PKPeerPaymentCounterpartHandleFormatter,  "displayNameForCounterpartHandle:contact:",  v4,  v10));

    id v4 = (void *)v11;
  }

  return v4;
}

- (unint64_t)familyNotificationType
{
  return self->_familyMember != 0LL;
}

- (PKPaymentTransaction)paymentTransaction
{
  return self->_paymentTransaction;
}

- (PKFamilyMember)familyMember
{
  return self->_familyMember;
}

- (void).cxx_destruct
{
}

@end