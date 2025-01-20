@interface LACDTOMutableNotificationAction
+ (id)doNotStartNewDelayAction;
+ (id)startNewDelayAction;
- (BOOL)isDestructive;
- (BOOL)isTitleLocalized;
- (LACDTOMutableNotificationAction)initWithIdentifier:(id)a3 title:(id)a4 isTitleLocalized:(BOOL)a5 isDestructive:(BOOL)a6;
- (NSString)identifier;
- (NSString)title;
- (void)setIdentifier:(id)a3;
- (void)setIsDestructive:(BOOL)a3;
- (void)setIsTitleLocalized:(BOOL)a3;
- (void)setTitle:(id)a3;
@end

@implementation LACDTOMutableNotificationAction

- (LACDTOMutableNotificationAction)initWithIdentifier:(id)a3 title:(id)a4 isTitleLocalized:(BOOL)a5 isDestructive:(BOOL)a6
{
  BOOL v6 = a6;
  BOOL v7 = a5;
  id v10 = a3;
  id v11 = a4;
  v15.receiver = self;
  v15.super_class = (Class)&OBJC_CLASS___LACDTOMutableNotificationAction;
  v12 = -[LACDTOMutableNotificationAction init](&v15, sel_init);
  v13 = v12;
  if (v12)
  {
    -[LACDTOMutableNotificationAction setIdentifier:](v12, "setIdentifier:", v10);
    -[LACDTOMutableNotificationAction setTitle:](v13, "setTitle:", v11);
    -[LACDTOMutableNotificationAction setIsTitleLocalized:](v13, "setIsTitleLocalized:", v7);
    -[LACDTOMutableNotificationAction setIsDestructive:](v13, "setIsDestructive:", v6);
  }

  return v13;
}

+ (id)doNotStartNewDelayAction
{
  return (id)[objc_alloc((Class)a1) initWithIdentifier:@"com.apple.coreauthd.notifications.action.securityDelay.start" title:@"START_SECURITY_DELAY_ACTION" isTitleLocalized:0 isDestructive:0];
}

+ (id)startNewDelayAction
{
  return (id)[objc_alloc((Class)a1) initWithIdentifier:@"com.apple.coreauthd.notifications.action.securityDelay.dismiss" title:@"NOT_NOW_ACTION" isTitleLocalized:0 isDestructive:1];
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
}

- (BOOL)isDestructive
{
  return self->_isDestructive;
}

- (void)setIsDestructive:(BOOL)a3
{
  self->_isDestructive = a3;
}

- (BOOL)isTitleLocalized
{
  return self->_isTitleLocalized;
}

- (void)setIsTitleLocalized:(BOOL)a3
{
  self->_isTitleLocalized = a3;
}

- (void).cxx_destruct
{
}

@end