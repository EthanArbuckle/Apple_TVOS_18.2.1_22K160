@interface PDPeerPaymentNearbySetupUserNotification
+ (BOOL)supportsSecureCoding;
- (PDPeerPaymentNearbySetupUserNotification)initWithCoder:(id)a3;
- (PDPeerPaymentNearbySetupUserNotification)initWithPassUniqueIdentifier:(id)a3 transactionIdentifier:(id)a4 amount:(id)a5 senderName:(id)a6;
- (id)_messageString;
- (id)_titleString;
- (id)notificationContentWithDataSource:(id)a3;
- (unint64_t)notificationType;
- (void)encodeWithCoder:(id)a3;
@end

@implementation PDPeerPaymentNearbySetupUserNotification

- (PDPeerPaymentNearbySetupUserNotification)initWithPassUniqueIdentifier:(id)a3 transactionIdentifier:(id)a4 amount:(id)a5 senderName:(id)a6
{
  id v11 = a5;
  id v12 = a6;
  id v13 = a3;
  v14 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"peerPaymentNearbySetup-%@",  a4));
  v22.receiver = self;
  v22.super_class = (Class)&OBJC_CLASS___PDPeerPaymentNearbySetupUserNotification;
  v15 = -[PDUserNotification initWithNotificationIdentifier:forPassUniqueIdentifier:]( &v22,  "initWithNotificationIdentifier:forPassUniqueIdentifier:",  v14,  v13);

  if (v15)
  {
    objc_storeStrong((id *)&v15->_amount, a5);
    objc_storeStrong((id *)&v15->_senderName, a6);
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
    -[PDUserNotification setDate:](v15, "setDate:", v16);
    id v17 = objc_alloc_init(&OBJC_CLASS___PKPeerPaymentAccountResolutionControllerConfiguration);
    [v17 setCurrencyAmount:v11];
    [v17 setRegistrationFlowState:2];
    [v17 setSenderAddress:v12];
    [v17 setPaymentMode:2];
    uint64_t SetupSensitiveURLWithConfiguration = PKPeerPaymentGetSetupSensitiveURLWithConfiguration(v17);
    v19 = (void *)objc_claimAutoreleasedReturnValue(SetupSensitiveURLWithConfiguration);
    v20 = (void *)objc_claimAutoreleasedReturnValue([v19 absoluteString]);
    -[PDUserNotification setCustomActionURLString:](v15, "setCustomActionURLString:", v20);
  }

  return v15;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PDPeerPaymentNearbySetupUserNotification)initWithCoder:(id)a3
{
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)&OBJC_CLASS___PDPeerPaymentNearbySetupUserNotification;
  v6 = -[PDUserNotification initWithCoder:](&v15, "initWithCoder:", v4);
  if (v6)
  {
    id v7 = objc_msgSend( v4,  "decodeObjectOfClass:forKey:",  objc_opt_class(PKCurrencyAmount, v5),  @"amount");
    uint64_t v8 = objc_claimAutoreleasedReturnValue(v7);
    amount = v6->_amount;
    v6->_amount = (PKCurrencyAmount *)v8;

    id v11 = objc_msgSend( v4,  "decodeObjectOfClass:forKey:",  objc_opt_class(NSString, v10),  @"senderName");
    uint64_t v12 = objc_claimAutoreleasedReturnValue(v11);
    senderName = v6->_senderName;
    v6->_senderName = (NSString *)v12;
  }

  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___PDPeerPaymentNearbySetupUserNotification;
  id v4 = a3;
  -[PDUserNotification encodeWithCoder:](&v5, "encodeWithCoder:", v4);
  objc_msgSend(v4, "encodeObject:forKey:", self->_amount, @"amount", v5.receiver, v5.super_class);
  [v4 encodeObject:self->_senderName forKey:@"senderName"];
}

- (id)_titleString
{
  return (id)PKLocalizedNearbyPeerPaymentString(@"NEARBY_SUCCESSFUL_TRANSACTION_GHOST_PASS_SETUP_TITLE");
}

- (id)_messageString
{
  senderName = self->_senderName;
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[PKCurrencyAmount formattedStringValue](self->_amount, "formattedStringValue"));
  uint64_t v4 = PKLocalizedNearbyPeerPaymentString( @"NEARBY_SUCCESSFUL_TRANSACTION_GHOST_PASS_SETUP_MESSAGE",  @"%@%@",  senderName,  v3);
  objc_super v5 = (void *)objc_claimAutoreleasedReturnValue(v4);

  return v5;
}

- (id)notificationContentWithDataSource:(id)a3
{
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___PDPeerPaymentNearbySetupUserNotification;
  id v4 = -[PDUserNotification notificationContentWithDataSource:](&v9, "notificationContentWithDataSource:", a3);
  objc_super v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[PDPeerPaymentNearbySetupUserNotification _titleString](self, "_titleString"));
  [v5 setSubtitle:v6];

  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[PDPeerPaymentNearbySetupUserNotification _messageString](self, "_messageString"));
  [v5 setBody:v7];

  return v5;
}

- (unint64_t)notificationType
{
  return 80LL;
}

- (void).cxx_destruct
{
}

@end