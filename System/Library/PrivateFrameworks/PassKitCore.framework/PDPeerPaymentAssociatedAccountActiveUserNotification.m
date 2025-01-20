@interface PDPeerPaymentAssociatedAccountActiveUserNotification
+ (BOOL)supportsSecureCoding;
- (PDPeerPaymentAssociatedAccountActiveUserNotification)initWithCoder:(id)a3;
- (PDPeerPaymentAssociatedAccountActiveUserNotification)initWithPassUniqueIdentifier:(id)a3 familyMember:(id)a4;
- (id)_messageString;
- (id)_titleString;
- (id)notificationContentWithDataSource:(id)a3;
- (unint64_t)familyNotificationType;
- (unint64_t)notificationType;
- (void)encodeWithCoder:(id)a3;
@end

@implementation PDPeerPaymentAssociatedAccountActiveUserNotification

- (PDPeerPaymentAssociatedAccountActiveUserNotification)initWithPassUniqueIdentifier:(id)a3 familyMember:(id)a4
{
  id v7 = a4;
  id v8 = a3;
  v9 = (void *)objc_claimAutoreleasedReturnValue([v7 altDSID]);
  v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"peerPaymentAssociatedAccountActive-%@",  v9));

  v18.receiver = self;
  v18.super_class = (Class)&OBJC_CLASS___PDPeerPaymentAssociatedAccountActiveUserNotification;
  v11 = -[PDUserNotification initWithNotificationIdentifier:forPassUniqueIdentifier:]( &v18,  "initWithNotificationIdentifier:forPassUniqueIdentifier:",  v10,  v8);

  if (v11)
  {
    objc_storeStrong((id *)&v11->_familyMember, a4);
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[PKFamilyMember appleID](v11->_familyMember, "appleID"));
    uint64_t SendPaymentSensitiveURL = PKPeerPaymentGetSendPaymentSensitiveURL(v12, 0LL, 0LL);
    v14 = (void *)objc_claimAutoreleasedReturnValue(SendPaymentSensitiveURL);

    v15 = (void *)objc_claimAutoreleasedReturnValue([v14 absoluteString]);
    -[PDUserNotification setCustomActionURLString:](v11, "setCustomActionURLString:", v15);

    v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
    -[PDUserNotification setDate:](v11, "setDate:", v16);
  }

  return v11;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PDPeerPaymentAssociatedAccountActiveUserNotification)initWithCoder:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)&OBJC_CLASS___PDPeerPaymentAssociatedAccountActiveUserNotification;
  v6 = -[PDUserNotification initWithCoder:](&v11, "initWithCoder:", v4);
  if (v6)
  {
    id v7 = objc_msgSend( v4,  "decodeObjectOfClass:forKey:",  objc_opt_class(PKFamilyMember, v5),  @"familyMember");
    uint64_t v8 = objc_claimAutoreleasedReturnValue(v7);
    familyMember = v6->_familyMember;
    v6->_familyMember = (PKFamilyMember *)v8;
  }

  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___PDPeerPaymentAssociatedAccountActiveUserNotification;
  id v4 = a3;
  -[PDUserNotification encodeWithCoder:](&v5, "encodeWithCoder:", v4);
  objc_msgSend(v4, "encodeObject:forKey:", self->_familyMember, @"familyMember", v5.receiver, v5.super_class);
}

- (id)_titleString
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[PKFamilyMember firstName](self->_familyMember, "firstName"));
  uint64_t v3 = PKLocalizedPeerPaymentLexingtonString( @"PEER_PAYMENT_ASSOCIATED_ACCOUNT_ACTIVE_NOTIFICATION_TITLE",  @"%@",  v2);
  id v4 = (void *)objc_claimAutoreleasedReturnValue(v3);

  return v4;
}

- (id)_messageString
{
  return (id)PKLocalizedPeerPaymentLexingtonString(@"PEER_PAYMENT_ASSOCIATED_ACCOUNT_ACTIVE_NOTIFICATION_MESSAGE");
}

- (id)notificationContentWithDataSource:(id)a3
{
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___PDPeerPaymentAssociatedAccountActiveUserNotification;
  id v4 = -[PDUserNotification notificationContentWithDataSource:](&v9, "notificationContentWithDataSource:", a3);
  objc_super v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[PDPeerPaymentAssociatedAccountActiveUserNotification _titleString](self, "_titleString"));
  [v5 setSubtitle:v6];

  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[PDPeerPaymentAssociatedAccountActiveUserNotification _messageString](self, "_messageString"));
  [v5 setBody:v7];

  return v5;
}

- (unint64_t)notificationType
{
  return 36LL;
}

- (unint64_t)familyNotificationType
{
  return self->_familyMember != 0LL;
}

- (void).cxx_destruct
{
}

@end