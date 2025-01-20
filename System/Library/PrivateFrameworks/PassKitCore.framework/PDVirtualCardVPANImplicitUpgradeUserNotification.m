@interface PDVirtualCardVPANImplicitUpgradeUserNotification
+ (BOOL)supportsSecureCoding;
+ (id)notificationIdentifierForPassUniqueIdentifier:(id)a3;
- (PDVirtualCardVPANImplicitUpgradeUserNotification)initWithCardName:(id)a3 passUniqueIdentifier:(id)a4;
- (PDVirtualCardVPANImplicitUpgradeUserNotification)initWithCoder:(id)a3;
- (id)_messageString;
- (id)notificationContentWithDataSource:(id)a3;
- (unint64_t)notificationType;
- (void)encodeWithCoder:(id)a3;
@end

@implementation PDVirtualCardVPANImplicitUpgradeUserNotification

+ (id)notificationIdentifierForPassUniqueIdentifier:(id)a3
{
  return +[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"ImplicitVPANUpgrade-%@", a3);
}

- (PDVirtualCardVPANImplicitUpgradeUserNotification)initWithCardName:(id)a3 passUniqueIdentifier:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue( +[PDVirtualCardVPANImplicitUpgradeUserNotification notificationIdentifierForPassUniqueIdentifier:]( &OBJC_CLASS___PDVirtualCardVPANImplicitUpgradeUserNotification,  "notificationIdentifierForPassUniqueIdentifier:",  v7));
  v13.receiver = self;
  v13.super_class = (Class)&OBJC_CLASS___PDVirtualCardVPANImplicitUpgradeUserNotification;
  v9 = -[PDUserNotification initWithNotificationIdentifier:forPassUniqueIdentifier:]( &v13,  "initWithNotificationIdentifier:forPassUniqueIdentifier:",  v8,  v7);

  if (v9)
  {
    v10 = (NSString *)[v6 copy];
    cardName = v9->_cardName;
    v9->_cardName = v10;

    -[PDUserNotification setCustomActionRoute:](v9, "setCustomActionRoute:", PKUserNotificationActionRouteViewPass);
  }

  return v9;
}

- (unint64_t)notificationType
{
  return 62LL;
}

- (id)notificationContentWithDataSource:(id)a3
{
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___PDVirtualCardVPANImplicitUpgradeUserNotification;
  id v4 = -[PDGenericUserNotification notificationContentWithDataSource:](&v8, "notificationContentWithDataSource:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[PDVirtualCardVPANImplicitUpgradeUserNotification _messageString](self, "_messageString"));
  [v5 setBody:v6];

  return v5;
}

- (id)_messageString
{
  return (id)PKLocalizedVirtualCardString( @"VIRTUAL_CARD_NOTIFICATION_IMPLICIT_UPGRADE_BODY",  @"%@",  self->_cardName);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PDVirtualCardVPANImplicitUpgradeUserNotification)initWithCoder:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)&OBJC_CLASS___PDVirtualCardVPANImplicitUpgradeUserNotification;
  id v6 = -[PDGenericUserNotification initWithCoder:](&v11, "initWithCoder:", v4);
  if (v6)
  {
    id v7 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(NSString, v5), @"cardName");
    uint64_t v8 = objc_claimAutoreleasedReturnValue(v7);
    cardName = v6->_cardName;
    v6->_cardName = (NSString *)v8;
  }

  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___PDVirtualCardVPANImplicitUpgradeUserNotification;
  id v4 = a3;
  -[PDGenericUserNotification encodeWithCoder:](&v5, "encodeWithCoder:", v4);
  objc_msgSend(v4, "encodeObject:forKey:", self->_cardName, @"cardName", v5.receiver, v5.super_class);
}

- (void).cxx_destruct
{
}

@end