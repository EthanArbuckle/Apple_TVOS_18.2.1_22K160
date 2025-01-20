@interface PDAccountBackgroundProvisionCompleteUserNotification
+ (BOOL)supportsSecureCoding;
- (BOOL)isValid;
- (PDAccountBackgroundProvisionCompleteUserNotification)initWithCoder:(id)a3;
- (PDAccountBackgroundProvisionCompleteUserNotification)initWithFeatureIdentifier:(unint64_t)a3 passUniqueIdentifier:(id)a4 supportsInStorePayment:(BOOL)a5;
- (id)_messageString;
- (id)_titleString;
- (id)notificationContentWithDataSource:(id)a3;
- (unint64_t)notificationType;
- (void)encodeWithCoder:(id)a3;
@end

@implementation PDAccountBackgroundProvisionCompleteUserNotification

- (PDAccountBackgroundProvisionCompleteUserNotification)initWithFeatureIdentifier:(unint64_t)a3 passUniqueIdentifier:(id)a4 supportsInStorePayment:(BOOL)a5
{
  id v8 = a4;
  v9 = objc_alloc(&OBJC_CLASS___NSString);
  uint64_t v10 = PKFeatureIdentifierToString(a3);
  v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
  v12 = -[NSString initWithFormat:](v9, "initWithFormat:", @"accountBackgroundProvisionComplete-%@", v11);

  v15.receiver = self;
  v15.super_class = (Class)&OBJC_CLASS___PDAccountBackgroundProvisionCompleteUserNotification;
  v13 = -[PDUserNotification initWithNotificationIdentifier:forPassUniqueIdentifier:]( &v15,  "initWithNotificationIdentifier:forPassUniqueIdentifier:",  v12,  v8);

  if (v13)
  {
    v13->_feature = a3;
    v13->_supportsInStorePayment = a5;
    -[PDUserNotification setSuppressionBehavior:](v13, "setSuppressionBehavior:", 0LL);
    -[PDUserNotification setCustomActionRoute:](v13, "setCustomActionRoute:", PKUserNotificationActionRouteViewPass);
  }

  return v13;
}

- (unint64_t)notificationType
{
  return 46LL;
}

- (BOOL)isValid
{
  return self->_feature != 0;
}

- (id)notificationContentWithDataSource:(id)a3
{
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___PDAccountBackgroundProvisionCompleteUserNotification;
  id v4 = -[PDGenericUserNotification notificationContentWithDataSource:](&v9, "notificationContentWithDataSource:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[PDAccountBackgroundProvisionCompleteUserNotification _titleString](self, "_titleString"));
  [v5 setTitle:v6];

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[PDAccountBackgroundProvisionCompleteUserNotification _messageString](self, "_messageString"));
  [v5 setBody:v7];

  return v5;
}

- (id)_titleString
{
  if (self->_feature == 4)
  {
    uint64_t v2 = PKLocalizedLynxString(@"PROVISION_NOTIFICATION_TITLE");
    v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  }

  else
  {
    v3 = 0LL;
  }

  return v3;
}

- (id)_messageString
{
  if (self->_feature == 4)
  {
    v3 = objc_alloc(&OBJC_CLASS___NSString);
    if (self->_supportsInStorePayment) {
      id v4 = &stru_100662310;
    }
    else {
      id v4 = @"_NO_IN_STORE_PAYMENT";
    }
    v5 = -[NSString initWithFormat:](v3, "initWithFormat:", @"PROVISION_NOTIFICATION_MESSAGE%@", v4);
    uint64_t v6 = PKLocalizedLynxString(v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  }

  else
  {
    v7 = 0LL;
  }

  return v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PDAccountBackgroundProvisionCompleteUserNotification)initWithCoder:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)&OBJC_CLASS___PDAccountBackgroundProvisionCompleteUserNotification;
  uint64_t v6 = -[PDGenericUserNotification initWithCoder:](&v10, "initWithCoder:", v4);
  if (v6)
  {
    id v7 = objc_msgSend( v4,  "decodeObjectOfClass:forKey:",  objc_opt_class(NSNumber, v5),  @"featureIdentifier");
    id v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
    v6->_feature = (unint64_t)[v8 unsignedIntegerValue];
  }

  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___PDAccountBackgroundProvisionCompleteUserNotification;
  id v4 = a3;
  -[PDGenericUserNotification encodeWithCoder:](&v6, "encodeWithCoder:", v4);
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithInteger:]( &OBJC_CLASS___NSNumber,  "numberWithInteger:",  self->_feature,  v6.receiver,  v6.super_class));
  [v4 encodeObject:v5 forKey:@"featureIdentifier"];
}

@end