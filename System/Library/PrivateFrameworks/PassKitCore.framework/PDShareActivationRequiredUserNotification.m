@interface PDShareActivationRequiredUserNotification
+ (BOOL)supportsSecureCoding;
- (NSString)shareIdentifier;
- (PDShareActivationRequiredUserNotification)initWithCoder:(id)a3;
- (PDShareActivationRequiredUserNotification)initWithTitle:(id)a3 message:(id)a4 shareIdentifier:(id)a5;
- (id)description;
- (unint64_t)notificationType;
- (void)encodeWithCoder:(id)a3;
@end

@implementation PDShareActivationRequiredUserNotification

- (PDShareActivationRequiredUserNotification)initWithTitle:(id)a3 message:(id)a4 shareIdentifier:(id)a5
{
  id v8 = a5;
  v12.receiver = self;
  v12.super_class = (Class)&OBJC_CLASS___PDShareActivationRequiredUserNotification;
  v9 = -[PDGenericUserNotification initWithTitle:message:forPassUniqueIdentifier:]( &v12,  "initWithTitle:message:forPassUniqueIdentifier:",  a3,  a4,  0LL);
  if (v9)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"wallet://%@/%@/%@",  PKURLActionShare,  v8,  PKURLActionShareActivateShare));
    -[PDUserNotification setCustomActionURLString:](v9, "setCustomActionURLString:", v10);

    -[PDUserNotification setReissueBannerOnUpdate:](v9, "setReissueBannerOnUpdate:", 1LL);
  }

  return v9;
}

- (unint64_t)notificationType
{
  return 48LL;
}

- (id)description
{
  v3 = (objc_class *)objc_opt_class(self, a2);
  v4 = NSStringFromClass(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableString stringWithFormat:]( &OBJC_CLASS___NSMutableString,  "stringWithFormat:",  @"<%@: %p; ",
                   v5,
                   self));

  [v6 appendFormat:@"shareIdentifier: '%@'; ", self->_shareIdentifier];
  [v6 appendFormat:@">"];
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithString:](&OBJC_CLASS___NSString, "stringWithString:", v6));

  return v7;
}

- (PDShareActivationRequiredUserNotification)initWithCoder:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)&OBJC_CLASS___PDShareActivationRequiredUserNotification;
  v6 = -[PDGenericUserNotification initWithCoder:](&v11, "initWithCoder:", v4);
  if (v6)
  {
    id v7 = objc_msgSend( v4,  "decodeObjectOfClass:forKey:",  objc_opt_class(NSString, v5),  @"shareIdentifier");
    uint64_t v8 = objc_claimAutoreleasedReturnValue(v7);
    shareIdentifier = v6->_shareIdentifier;
    v6->_shareIdentifier = (NSString *)v8;
  }

  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___PDShareActivationRequiredUserNotification;
  id v4 = a3;
  -[PDGenericUserNotification encodeWithCoder:](&v5, "encodeWithCoder:", v4);
  objc_msgSend( v4,  "encodeObject:forKey:",  self->_shareIdentifier,  @"shareIdentifier",  v5.receiver,  v5.super_class);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSString)shareIdentifier
{
  return self->_shareIdentifier;
}

- (void).cxx_destruct
{
}

@end