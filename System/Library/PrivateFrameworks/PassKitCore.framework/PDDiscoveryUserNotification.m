@interface PDDiscoveryUserNotification
+ (BOOL)supportsSecureCoding;
+ (id)notificationIdentifierForDiscoveryNotification:(id)a3;
- (PDDiscoveryUserNotification)initWithCoder:(id)a3;
- (PDDiscoveryUserNotification)initWithDiscoveryNotification:(id)a3 passUniqueIdentifier:(id)a4;
- (PKDiscoveryNotification)discoveryNotification;
- (id)notificationContentWithDataSource:(id)a3;
- (unint64_t)notificationType;
- (void)encodeWithCoder:(id)a3;
- (void)setDiscoveryNotification:(id)a3;
@end

@implementation PDDiscoveryUserNotification

+ (id)notificationIdentifierForDiscoveryNotification:(id)a3
{
  v3 = (void *)objc_claimAutoreleasedReturnValue([a3 identifier]);
  v4 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@-discoveryNotification",  v3));

  return v4;
}

- (PDDiscoveryUserNotification)initWithDiscoveryNotification:(id)a3 passUniqueIdentifier:(id)a4
{
  id v6 = a3;
  if (v6)
  {
    id v7 = a4;
    id v9 = objc_msgSend((id)objc_opt_class(self, v8), "notificationIdentifierForDiscoveryNotification:", v6);
    v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
    v14.receiver = self;
    v14.super_class = (Class)&OBJC_CLASS___PDDiscoveryUserNotification;
    v11 = -[PDUserNotification initWithNotificationIdentifier:forPassUniqueIdentifier:]( &v14,  "initWithNotificationIdentifier:forPassUniqueIdentifier:",  v10,  v7);

    if (v11) {
      -[PDDiscoveryUserNotification setDiscoveryNotification:](v11, "setDiscoveryNotification:", v6);
    }
    self = v11;

    v12 = self;
  }

  else
  {
    v12 = 0LL;
  }

  return v12;
}

- (void)setDiscoveryNotification:(id)a3
{
  id v15 = a3;
  p_discoveryNotification = &self->_discoveryNotification;
  objc_storeStrong((id *)&self->_discoveryNotification, a3);
  id v6 = -[PKDiscoveryNotification actionType](self->_discoveryNotification, "actionType");
  if (v6 == (id)5)
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue( -[PKDiscoveryNotification discoveryCardIdentifier]( *p_discoveryNotification,  "discoveryCardIdentifier"));
    if (v12) {
      v13 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@/%@/%@",  PKURLRouteDiscovery,  PKURLRouteDiscoveryCard,  v12,  v15));
    }
    else {
      v13 = 0LL;
    }

    if (v13) {
      goto LABEL_17;
    }
  }

  else
  {
    if (v6 == (id)3)
    {
      id v9 = -[PKDiscoveryNotification passQualifier](*p_discoveryNotification, "passQualifier");
      if (v9 == (id)2)
      {
        uint64_t v10 = PKURLActionRouteCreditPaymentPass;
        v11 = &PKURLActionRouteCreditPaymentPassDetailsAction;
      }

      else
      {
        if (v9 != (id)1) {
          goto LABEL_18;
        }
        uint64_t v10 = PKURLActionRoutePeerPaymentPass;
        v11 = &PKUserNotificationActionRouteViewPassDetails;
      }

      id v14 = (id)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%@/%@", v10, *v11));
    }

    else
    {
      if (v6 != (id)2) {
        goto LABEL_18;
      }
      id v7 = -[PKDiscoveryNotification passQualifier](*p_discoveryNotification, "passQualifier");
      if (v7 == (id)2)
      {
        uint64_t v8 = (id *)&PKURLActionRouteCreditPaymentPass;
      }

      else
      {
        if (v7 != (id)1) {
          goto LABEL_18;
        }
        uint64_t v8 = (id *)&PKURLActionRoutePeerPaymentPass;
      }

      id v14 = *v8;
    }

    v13 = v14;
    if (v14)
    {
LABEL_17:
      -[PDUserNotification setCustomActionRoute:](self, "setCustomActionRoute:", v13);
    }
  }

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PDDiscoveryUserNotification)initWithCoder:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)&OBJC_CLASS___PDDiscoveryUserNotification;
  id v6 = -[PDUserNotification initWithCoder:](&v11, "initWithCoder:", v4);
  if (v6)
  {
    id v7 = objc_msgSend( v4,  "decodeObjectOfClass:forKey:",  objc_opt_class(PKDiscoveryNotification, v5),  @"discoveryNotification");
    uint64_t v8 = objc_claimAutoreleasedReturnValue(v7);
    discoveryNotification = v6->_discoveryNotification;
    v6->_discoveryNotification = (PKDiscoveryNotification *)v8;
  }

  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___PDDiscoveryUserNotification;
  id v4 = a3;
  -[PDUserNotification encodeWithCoder:](&v5, "encodeWithCoder:", v4);
  objc_msgSend( v4,  "encodeObject:forKey:",  self->_discoveryNotification,  @"discoveryNotification",  v5.receiver,  v5.super_class);
}

- (unint64_t)notificationType
{
  return 27LL;
}

- (id)notificationContentWithDataSource:(id)a3
{
  v10.receiver = self;
  v10.super_class = (Class)&OBJC_CLASS___PDDiscoveryUserNotification;
  id v4 = -[PDUserNotification notificationContentWithDataSource:](&v10, "notificationContentWithDataSource:", a3);
  objc_super v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[PKDiscoveryNotification localizedTitle](self->_discoveryNotification, "localizedTitle"));
  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[PKDiscoveryNotification localizedMessage](self->_discoveryNotification, "localizedMessage"));
  if (v6) {
    [v5 setSubtitle:v6];
  }
  if (v7) {
    [v5 setBody:v7];
  }
  if (-[PKDiscoveryNotification actionType](self->_discoveryNotification, "actionType") == (id)4)
  {
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(-[PKDiscoveryNotification url](self->_discoveryNotification, "url"));
    [v5 setDefaultActionURL:v8];
  }

  return v5;
}

- (PKDiscoveryNotification)discoveryNotification
{
  return self->_discoveryNotification;
}

- (void).cxx_destruct
{
}

@end