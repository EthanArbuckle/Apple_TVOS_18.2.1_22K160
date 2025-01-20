@interface PDEntitlementUpdateUserNotification
+ (BOOL)supportsSecureCoding;
- (PDEntitlementUpdateUserNotification)initWithTitle:(id)a3 message:(id)a4 forPassUniqueIdentifier:(id)a5;
- (id)description;
- (unint64_t)notificationType;
@end

@implementation PDEntitlementUpdateUserNotification

- (PDEntitlementUpdateUserNotification)initWithTitle:(id)a3 message:(id)a4 forPassUniqueIdentifier:(id)a5
{
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___PDEntitlementUpdateUserNotification;
  v5 = -[PDGenericUserNotification initWithTitle:message:forPassUniqueIdentifier:]( &v8,  "initWithTitle:message:forPassUniqueIdentifier:",  a3,  a4,  a5);
  v6 = v5;
  if (v5)
  {
    -[PDUserNotification setCustomActionRoute:](v5, "setCustomActionRoute:", PKUserNotificationActionRouteViewPass);
    -[PDUserNotification setCustomActionVerb:]( v6,  "setCustomActionVerb:",  PKUserNotificationActionRouteViewEntitlementDetails);
    -[PDUserNotification setReissueBannerOnUpdate:](v6, "setReissueBannerOnUpdate:", 1LL);
  }

  return v6;
}

- (unint64_t)notificationType
{
  return 61LL;
}

- (id)description
{
  v3 = (objc_class *)objc_opt_class(self, a2);
  v4 = NSStringFromClass(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableString stringWithFormat:]( &OBJC_CLASS___NSMutableString,  "stringWithFormat:",  @"<%@: %p; ",
                   v5,
                   self));

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[PDUserNotification passUniqueIdentifier](self, "passUniqueIdentifier"));
  [v6 appendFormat:@"passIdentifier: '%@'; ", v7];

  objc_super v8 = (void *)objc_claimAutoreleasedReturnValue(-[PDGenericUserNotification title](self, "title"));
  [v6 appendFormat:@"title: '%@'; ", v8];

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[PDGenericUserNotification message](self, "message"));
  [v6 appendFormat:@"message: '%@'; ", v9];

  [v6 appendFormat:@">"];
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithString:](&OBJC_CLASS___NSString, "stringWithString:", v6));

  return v10;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end