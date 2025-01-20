@interface CKNotification
- (id)cplNotificationTypeDescription;
@end

@implementation CKNotification

- (id)cplNotificationTypeDescription
{
  CKNotificationType v3 = -[CKNotification notificationType](self, "notificationType");
  if ((unint64_t)(v3 - 1) >= 4) {
    v4 = -[NSString initWithFormat:]( objc_alloc(&OBJC_CLASS___NSString),  "initWithFormat:",  @"%ld (???)",  -[CKNotification notificationType](self, "notificationType"));
  }
  else {
    v4 = (NSString *)*(&off_10023DBE8 + v3 - 1);
  }
  return v4;
}

@end