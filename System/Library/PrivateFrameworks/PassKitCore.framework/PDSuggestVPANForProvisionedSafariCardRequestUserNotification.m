@interface PDSuggestVPANForProvisionedSafariCardRequestUserNotification
+ (BOOL)supportsSecureCoding;
+ (id)notificationIdentifierForPassUniqueIdentifier:(id)a3;
- (PDSuggestVPANForProvisionedSafariCardRequestUserNotification)initWithCoder:(id)a3;
- (PDSuggestVPANForProvisionedSafariCardRequestUserNotification)initWithFPANSuffix:(id)a3 networkName:(id)a4 passUniqueIdentifier:(id)a5;
- (id)_messageString;
- (id)notificationContentWithDataSource:(id)a3;
- (unint64_t)notificationType;
- (void)encodeWithCoder:(id)a3;
@end

@implementation PDSuggestVPANForProvisionedSafariCardRequestUserNotification

+ (id)notificationIdentifierForPassUniqueIdentifier:(id)a3
{
  return +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"SuggestVPANForProvisionedSafariCard-%@",  a3);
}

- (PDSuggestVPANForProvisionedSafariCardRequestUserNotification)initWithFPANSuffix:(id)a3 networkName:(id)a4 passUniqueIdentifier:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = (void *)objc_claimAutoreleasedReturnValue( +[PDSuggestVPANForProvisionedSafariCardRequestUserNotification notificationIdentifierForPassUniqueIdentifier:]( &OBJC_CLASS___PDSuggestVPANForProvisionedSafariCardRequestUserNotification,  "notificationIdentifierForPassUniqueIdentifier:",  v10));
  v18.receiver = self;
  v18.super_class = (Class)&OBJC_CLASS___PDSuggestVPANForProvisionedSafariCardRequestUserNotification;
  v12 = -[PDUserNotification initWithNotificationIdentifier:forPassUniqueIdentifier:]( &v18,  "initWithNotificationIdentifier:forPassUniqueIdentifier:",  v11,  v10);

  if (v12)
  {
    v13 = (NSString *)[v8 copy];
    fpanSuffix = v12->_fpanSuffix;
    v12->_fpanSuffix = v13;

    v15 = (NSString *)[v9 copy];
    networkName = v12->_networkName;
    v12->_networkName = v15;

    -[PDUserNotification setCustomActionRoute:](v12, "setCustomActionRoute:", PKUserNotificationActionRouteViewPass);
    -[PDUserNotification setCustomActionVerb:]( v12,  "setCustomActionVerb:",  PKUserNotificationActionRouteSetupVirtualCardNumber);
  }

  return v12;
}

- (unint64_t)notificationType
{
  return 64LL;
}

- (id)notificationContentWithDataSource:(id)a3
{
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___PDSuggestVPANForProvisionedSafariCardRequestUserNotification;
  id v4 = -[PDGenericUserNotification notificationContentWithDataSource:](&v8, "notificationContentWithDataSource:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[PDSuggestVPANForProvisionedSafariCardRequestUserNotification _messageString](self, "_messageString"));
  [v5 setBody:v6];

  return v5;
}

- (id)_messageString
{
  return (id)PKLocalizedVirtualCardString( @"VIRTUAL_CARD_NOTIFICATION_SUGGEST_UPGRADE_BODY",  @"%1$@%2$@",  self->_networkName,  self->_fpanSuffix);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PDSuggestVPANForProvisionedSafariCardRequestUserNotification)initWithCoder:(id)a3
{
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)&OBJC_CLASS___PDSuggestVPANForProvisionedSafariCardRequestUserNotification;
  v6 = -[PDGenericUserNotification initWithCoder:](&v15, "initWithCoder:", v4);
  if (v6)
  {
    id v7 = objc_msgSend( v4,  "decodeObjectOfClass:forKey:",  objc_opt_class(NSString, v5),  @"networkName");
    uint64_t v8 = objc_claimAutoreleasedReturnValue(v7);
    networkName = v6->_networkName;
    v6->_networkName = (NSString *)v8;

    id v11 = objc_msgSend( v4,  "decodeObjectOfClass:forKey:",  objc_opt_class(NSString, v10),  @"fpanSuffix");
    uint64_t v12 = objc_claimAutoreleasedReturnValue(v11);
    fpanSuffix = v6->_fpanSuffix;
    v6->_fpanSuffix = (NSString *)v12;
  }

  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___PDSuggestVPANForProvisionedSafariCardRequestUserNotification;
  id v4 = a3;
  -[PDGenericUserNotification encodeWithCoder:](&v5, "encodeWithCoder:", v4);
  objc_msgSend(v4, "encodeObject:forKey:", self->_networkName, @"networkName", v5.receiver, v5.super_class);
  [v4 encodeObject:self->_fpanSuffix forKey:@"fpanSuffix"];
}

- (void).cxx_destruct
{
}

@end