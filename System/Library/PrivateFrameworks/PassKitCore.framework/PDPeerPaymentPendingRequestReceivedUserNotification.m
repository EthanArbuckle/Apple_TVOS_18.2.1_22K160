@interface PDPeerPaymentPendingRequestReceivedUserNotification
+ (BOOL)supportsSecureCoding;
+ (id)notificationIdentifierForRequestToken:(id)a3;
- (NSString)requesterName;
- (PDPeerPaymentPendingRequestReceivedUserNotification)initWithCoder:(id)a3;
- (PDPeerPaymentPendingRequestReceivedUserNotification)initWithPendingRequest:(id)a3 requesterName:(id)a4 forPassUniqueIdentifier:(id)a5;
- (PKPeerPaymentPendingRequest)pendingRequest;
- (id)notificationContentWithDataSource:(id)a3;
- (unint64_t)notificationType;
- (void)encodeWithCoder:(id)a3;
@end

@implementation PDPeerPaymentPendingRequestReceivedUserNotification

- (PDPeerPaymentPendingRequestReceivedUserNotification)initWithPendingRequest:(id)a3 requesterName:(id)a4 forPassUniqueIdentifier:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v12 = (void *)objc_claimAutoreleasedReturnValue([v9 requestToken]);
  v13 = v12;
  if (v12
    && (unsigned __int8 v14 = [v12 isEqualToString:&stru_100662310], v10)
    && (v14 & 1) == 0
    && ([v10 isEqualToString:&stru_100662310] & 1) == 0
    && (v15 = (void *)objc_claimAutoreleasedReturnValue([v9 requestDate]), v15, v15))
  {
    objc_storeStrong((id *)&self->_pendingRequest, a3);
    objc_storeStrong((id *)&self->_requesterName, a4);
    v16 = (void *)objc_claimAutoreleasedReturnValue( +[PDPeerPaymentPendingRequestReceivedUserNotification notificationIdentifierForRequestToken:]( &OBJC_CLASS___PDPeerPaymentPendingRequestReceivedUserNotification,  "notificationIdentifierForRequestToken:",  v13));
    v19.receiver = self;
    v19.super_class = (Class)&OBJC_CLASS___PDPeerPaymentPendingRequestReceivedUserNotification;
    v17 = -[PDUserNotification initWithNotificationIdentifier:forPassUniqueIdentifier:]( &v19,  "initWithNotificationIdentifier:forPassUniqueIdentifier:",  v16,  v11);
  }

  else
  {

    v17 = 0LL;
  }

  return v17;
}

- (PDPeerPaymentPendingRequestReceivedUserNotification)initWithCoder:(id)a3
{
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)&OBJC_CLASS___PDPeerPaymentPendingRequestReceivedUserNotification;
  v6 = -[PDUserNotification initWithCoder:](&v15, "initWithCoder:", v4);
  if (v6)
  {
    id v7 = objc_msgSend( v4,  "decodeObjectOfClass:forKey:",  objc_opt_class(PKPeerPaymentPendingRequest, v5),  @"pendingRequest");
    uint64_t v8 = objc_claimAutoreleasedReturnValue(v7);
    pendingRequest = v6->_pendingRequest;
    v6->_pendingRequest = (PKPeerPaymentPendingRequest *)v8;

    id v11 = objc_msgSend( v4,  "decodeObjectOfClass:forKey:",  objc_opt_class(NSString, v10),  @"requesterName");
    uint64_t v12 = objc_claimAutoreleasedReturnValue(v11);
    requesterName = v6->_requesterName;
    v6->_requesterName = (NSString *)v12;
  }

  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___PDPeerPaymentPendingRequestReceivedUserNotification;
  id v4 = a3;
  -[PDUserNotification encodeWithCoder:](&v5, "encodeWithCoder:", v4);
  objc_msgSend(v4, "encodeObject:forKey:", self->_pendingRequest, @"pendingRequest", v5.receiver, v5.super_class);
  [v4 encodeObject:self->_requesterName forKey:@"requesterName"];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)notificationIdentifierForRequestToken:(id)a3
{
  return +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"peerPaymentPendingRequest-%@",  a3);
}

- (unint64_t)notificationType
{
  return 63LL;
}

- (id)notificationContentWithDataSource:(id)a3
{
  pendingRequest = self->_pendingRequest;
  id v5 = a3;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[PKPeerPaymentPendingRequest currencyAmount](pendingRequest, "currencyAmount"));
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 formattedStringValue]);

  uint64_t v8 = objc_alloc_init(&OBJC_CLASS___NSDateFormatter);
  -[NSDateFormatter setDateFormat:](v8, "setDateFormat:", @"MMM dd");
  id v9 = (void *)objc_claimAutoreleasedReturnValue(-[PKPeerPaymentPendingRequest requestDate](self->_pendingRequest, "requestDate"));
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(-[NSDateFormatter stringFromDate:](v8, "stringFromDate:", v9));

  uint64_t v11 = PKLocalizedPeerPaymentString( @"PEER_PAYMENT_PENDING_REQUEST_RECEIVED_NOTIFICATION_MESSAGE",  @"%@%@%@",  self->_requesterName,  v7,  v10);
  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
  v18.receiver = self;
  v18.super_class = (Class)&OBJC_CLASS___PDPeerPaymentPendingRequestReceivedUserNotification;
  id v13 = -[PDUserNotification notificationContentWithDataSource:](&v18, "notificationContentWithDataSource:", v5);
  unsigned __int8 v14 = (void *)objc_claimAutoreleasedReturnValue(v13);

  [v14 setBody:v12];
  objc_super v15 = (void *)objc_claimAutoreleasedReturnValue(-[PDUserNotification date](self, "date"));
  [v14 setDate:v15];

  v16 = (void *)objc_claimAutoreleasedReturnValue(-[PKPeerPaymentPendingRequest expiryDate](self->_pendingRequest, "expiryDate"));
  [v14 setExpirationDate:v16];

  return v14;
}

- (PKPeerPaymentPendingRequest)pendingRequest
{
  return self->_pendingRequest;
}

- (NSString)requesterName
{
  return self->_requesterName;
}

- (void).cxx_destruct
{
}

@end