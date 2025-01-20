@interface PDUserNotificationProvisioningContinuityPrompt
+ (BOOL)supportsSecureCoding;
- (NSString)continuitySessionIdentifier;
- (PDUserNotificationProvisioningContinuityPrompt)initWithCoder:(id)a3;
- (PDUserNotificationProvisioningContinuityPrompt)initWithTitle:(id)a3 message:(id)a4 continuitySessionIdentifier:(id)a5;
- (id)description;
- (unint64_t)notificationType;
- (void)encodeWithCoder:(id)a3;
@end

@implementation PDUserNotificationProvisioningContinuityPrompt

- (PDUserNotificationProvisioningContinuityPrompt)initWithTitle:(id)a3 message:(id)a4 continuitySessionIdentifier:(id)a5
{
  id v9 = a5;
  v16.receiver = self;
  v16.super_class = (Class)&OBJC_CLASS___PDUserNotificationProvisioningContinuityPrompt;
  v10 = -[PDGenericUserNotification initWithTitle:message:forPassUniqueIdentifier:]( &v16,  "initWithTitle:message:forPassUniqueIdentifier:",  a3,  a4,  0LL);
  v11 = v10;
  if (v10)
  {
    p_continuitySessionIdentifier = &v10->_continuitySessionIdentifier;
    objc_storeStrong((id *)&v10->_continuitySessionIdentifier, a5);
    -[PDUserNotification setNotificationIdentifier:](v11, "setNotificationIdentifier:", *p_continuitySessionIdentifier);
    v13 = objc_alloc(&OBJC_CLASS___NSString);
    v14 = -[NSString initWithFormat:]( v13,  "initWithFormat:",  @"https://%@/%@/%@",  PKWalletUniversalLinkHostName,  PKURLActionProvisioningContinuityKey,  *p_continuitySessionIdentifier);
    -[PDUserNotification setCustomActionURLString:](v11, "setCustomActionURLString:", v14);
    -[PDUserNotification setReissueBannerOnUpdate:](v11, "setReissueBannerOnUpdate:", 1LL);
    -[PDUserNotification setSuppressionBehavior:](v11, "setSuppressionBehavior:", 0LL);
    -[PDUserNotification setPreventAutomaticDismissal:](v11, "setPreventAutomaticDismissal:", 1LL);
  }

  return v11;
}

- (unint64_t)notificationType
{
  return 79LL;
}

- (id)description
{
  v3 = (objc_class *)objc_opt_class(self, a2);
  v4 = NSStringFromClass(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableString stringWithFormat:]( &OBJC_CLASS___NSMutableString,  "stringWithFormat:",  @"<%@: %p; ",
                   v5,
                   self));

  [v6 appendFormat:@"continuitySessionIdentifier: '%@'; ", self->_continuitySessionIdentifier];
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[PDGenericUserNotification title](self, "title"));
  [v6 appendFormat:@"title: '%@'; ", v7];

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[PDGenericUserNotification message](self, "message"));
  [v6 appendFormat:@"message: '%@'; ", v8];

  [v6 appendFormat:@">"];
  id v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithString:](&OBJC_CLASS___NSString, "stringWithString:", v6));

  return v9;
}

- (PDUserNotificationProvisioningContinuityPrompt)initWithCoder:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)&OBJC_CLASS___PDUserNotificationProvisioningContinuityPrompt;
  v6 = -[PDGenericUserNotification initWithCoder:](&v11, "initWithCoder:", v4);
  if (v6)
  {
    id v7 = objc_msgSend( v4,  "decodeObjectOfClass:forKey:",  objc_opt_class(NSString, v5),  @"continuitySessionIdentifier");
    uint64_t v8 = objc_claimAutoreleasedReturnValue(v7);
    continuitySessionIdentifier = v6->_continuitySessionIdentifier;
    v6->_continuitySessionIdentifier = (NSString *)v8;
  }

  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___PDUserNotificationProvisioningContinuityPrompt;
  id v4 = a3;
  -[PDGenericUserNotification encodeWithCoder:](&v5, "encodeWithCoder:", v4);
  objc_msgSend( v4,  "encodeObject:forKey:",  self->_continuitySessionIdentifier,  @"continuitySessionIdentifier",  v5.receiver,  v5.super_class);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSString)continuitySessionIdentifier
{
  return self->_continuitySessionIdentifier;
}

- (void).cxx_destruct
{
}

@end