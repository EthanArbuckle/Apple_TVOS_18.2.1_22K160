@interface LACDTOMutableNotificationCategory
+ (id)newSecurityDelayRequiredCategory;
+ (id)securityDelayEndedCategory;
- (BOOL)hiddenPreviewShowsTitle;
- (LACDTOMutableNotificationCategory)initWithIdentifier:(id)a3 actions:(id)a4 hiddenPreviewShowsTitle:(BOOL)a5;
- (NSArray)actions;
- (NSString)identifier;
- (void)setActions:(id)a3;
- (void)setHiddenPreviewShowsTitle:(BOOL)a3;
- (void)setIdentifier:(id)a3;
@end

@implementation LACDTOMutableNotificationCategory

- (LACDTOMutableNotificationCategory)initWithIdentifier:(id)a3 actions:(id)a4 hiddenPreviewShowsTitle:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a3;
  id v9 = a4;
  v13.receiver = self;
  v13.super_class = (Class)&OBJC_CLASS___LACDTOMutableNotificationCategory;
  v10 = -[LACDTOMutableNotificationCategory init](&v13, sel_init);
  v11 = v10;
  if (v10)
  {
    -[LACDTOMutableNotificationCategory setIdentifier:](v10, "setIdentifier:", v8);
    -[LACDTOMutableNotificationCategory setActions:](v11, "setActions:", v9);
    -[LACDTOMutableNotificationCategory setHiddenPreviewShowsTitle:](v11, "setHiddenPreviewShowsTitle:", v5);
  }

  return v11;
}

+ (id)newSecurityDelayRequiredCategory
{
  v8[2] = *MEMORY[0x1895F89C0];
  id v2 = objc_alloc((Class)a1);
  v3 = +[LACDTOMutableNotificationAction startNewDelayAction]( &OBJC_CLASS___LACDTOMutableNotificationAction,  "startNewDelayAction");
  v8[0] = v3;
  v4 = +[LACDTOMutableNotificationAction doNotStartNewDelayAction]( &OBJC_CLASS___LACDTOMutableNotificationAction,  "doNotStartNewDelayAction");
  v8[1] = v4;
  [MEMORY[0x189603F18] arrayWithObjects:v8 count:2];
  BOOL v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)[v2 initWithIdentifier:@"com.apple.coreauthd.notifications.category.securityDelay.required" actions:v5 hiddenPreviewShowsTitle:1];

  return v6;
}

+ (id)securityDelayEndedCategory
{
  id v2 = objc_alloc((Class)a1);
  return (id)[v2 initWithIdentifier:@"com.apple.coreauthd.notifications.category.securityDelay.ended" actions:MEMORY[0x189604A58] hiddenPreviewShowsTitle:1];
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
}

- (NSArray)actions
{
  return self->_actions;
}

- (void)setActions:(id)a3
{
}

- (BOOL)hiddenPreviewShowsTitle
{
  return self->_hiddenPreviewShowsTitle;
}

- (void)setHiddenPreviewShowsTitle:(BOOL)a3
{
  self->_hiddenPreviewShowsTitle = a3;
}

- (void).cxx_destruct
{
}

@end