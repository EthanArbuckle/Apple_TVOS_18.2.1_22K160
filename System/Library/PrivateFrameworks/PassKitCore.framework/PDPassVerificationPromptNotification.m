@interface PDPassVerificationPromptNotification
+ (BOOL)supportsSecureCoding;
- (PDPassVerificationPromptNotification)initWithTitle:(id)a3 message:(id)a4 forPassUniqueIdentifier:(id)a5;
- (unint64_t)notificationType;
@end

@implementation PDPassVerificationPromptNotification

- (PDPassVerificationPromptNotification)initWithTitle:(id)a3 message:(id)a4 forPassUniqueIdentifier:(id)a5
{
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___PDPassVerificationPromptNotification;
  v5 = -[PDGenericUserNotification initWithTitle:message:forPassUniqueIdentifier:]( &v8,  "initWithTitle:message:forPassUniqueIdentifier:",  a3,  a4,  a5);
  v6 = v5;
  if (v5)
  {
    -[PDUserNotification setReissueBannerOnUpdate:](v5, "setReissueBannerOnUpdate:", 1LL);
    -[PDUserNotification setSuppressionBehavior:](v6, "setSuppressionBehavior:", 0LL);
  }

  return v6;
}

- (unint64_t)notificationType
{
  return 81LL;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end